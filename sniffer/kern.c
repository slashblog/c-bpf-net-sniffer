/* SPDX-License-Identifier: GPL-2.0 */
#include <linux/bpf.h>
#include <linux/in.h>
#include <bpf/bpf_helpers.h>
#include <bpf/bpf_endian.h>

#include "../common/parsing_helpers.h"

#include "../common/xdp_stats_kern_user.h"
#include "../common/xdp_stats_kern.h"

SEC("xdp")
int xdp_parser_func(struct xdp_md *ctx)
{
	void *data_end = (void *)(long)ctx->data_end;
	void *data = (void *)(long)ctx->data;

	/* Default action XDP_PASS, imply everything we couldn't parse, or that
	 * we don't want to deal with, we just pass up the stack and let the
	 * kernel deal with it.
	 */
	__u32 action = XDP_PASS; /* Default action */

	/* These keep track of the next header type and iterator pointer */
	struct hdr_cursor nh;
	int nh_type;
	nh.pos = data;

	struct ethhdr *eth;

	/* Packet parsing in steps: Get each header one at a time, aborting if
	 * parsing fails. Each helper function does sanity checking (is the
	 * header type in the packet correct?), and bounds checking.
	 */
	nh_type = parse_ethhdr(&nh, data_end, &eth);

	tcp_addr src_addr = { 0 };
	tcp_addr dst_addr = { 0 };
	__u16 src_port = 0;
	__u16 dst_port = 0;
	__u8 isv6 = 0;

	bpf_printk("got something");

	if (nh_type == bpf_htons(ETH_P_IPV6))
	{
		struct ipv6hdr *ip6h;

		nh_type = parse_ip6hdr(&nh, data_end, &ip6h);
		if (nh_type != IPPROTO_TCP)
			goto out;

		if (ip6h + 1 > data_end)
			return -1;

		src_addr.v6 = ip6h->saddr;
		dst_addr.v6 = ip6h->daddr;
		isv6 = 1;
	}
	else if (nh_type == bpf_htons(ETH_P_IP))
	{
		struct iphdr *iph;

		nh_type = parse_iphdr(&nh, data_end, &iph);
		if (nh_type != IPPROTO_TCP)
			goto out;

		if (iph + 1 > data_end)
			return -1;

		src_addr.v4 = iph->saddr;
		dst_addr.v4 = iph->daddr;
		isv6 = 0;
	} else {
		goto out;
	}

	struct tcphdr *tcph;
	nh_type = parse_tcphdr(&nh, data_end, &tcph);

	if (tcph + 1 > data_end)
		return XDP_ABORTED;
	src_port = bpf_ntohs(tcph->source);
	dst_port = bpf_ntohs(tcph->dest);

	action = xdp_add_to_queue(ctx, &src_addr, &dst_addr, isv6, &src_port, &dst_port);
out:
	return xdp_stats_record_action(ctx, action);
}

char _license[] SEC("license") = "GPL";
