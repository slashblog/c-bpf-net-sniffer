/* SPDX-License-Identifier: GPL-2.0 */
#include <linux/bpf.h>
#include <linux/in.h>
#include <bpf/bpf_helpers.h>
#include <bpf/bpf_endian.h>

// The parsing helper functions from the packet01 lesson have moved here
#include "../common/parsing_helpers.h"

/* Defines xdp_stats_map */
#include "../common/xdp_stats_kern_user.h"
#include "../common/xdp_stats_kern.h"

/* Pops the outermost VLAN tag off the packet. Returns the popped VLAN ID on
 * success or -1 on failure.
 */
static __always_inline int vlan_tag_pop(struct xdp_md *ctx, struct ethhdr *eth)
{
	/*
	void *data_end = (void *)(long)ctx->data_end;
	struct ethhdr eth_cpy;
	struct vlan_hdr *vlh;
	__be16 h_proto;
	*/
	int vlid = -1;

	/* Check if there is a vlan tag to pop */

	/* Still need to do bounds checking */

	/* Save vlan ID for returning, h_proto for updating Ethernet header */

	/* Make a copy of the outer Ethernet header before we cut it off */

	/* Actually adjust the head pointer */

	/* Need to re-evaluate data *and* data_end and do new bounds checking
	 * after adjusting head
	 */

	/* Copy back the old Ethernet header and update the proto type */

	return vlid;
}

/* Pushes a new VLAN tag after the Ethernet header. Returns 0 on success,
 * -1 on failure.
 */
static __always_inline int vlan_tag_push(struct xdp_md *ctx,
										 struct ethhdr *eth, int vlid)
{
	return 0;
}

/* Implement assignment 1 in this section */
SEC("xdp")
int xdp_port_rewrite_func(struct xdp_md *ctx)
{
	return XDP_PASS;
}

/* VLAN swapper; will pop outermost VLAN tag if it exists, otherwise push a new
 * one with ID 1. Use this for assignments 2 and 3.
 */
SEC("xdp")
int xdp_vlan_swap_func(struct xdp_md *ctx)
{
	void *data_end = (void *)(long)ctx->data_end;
	void *data = (void *)(long)ctx->data;

	/* These keep track of the next header type and iterator pointer */
	struct hdr_cursor nh;
	int nh_type;
	nh.pos = data;

	struct ethhdr *eth;
	nh_type = parse_ethhdr(&nh, data_end, &eth);
	if (nh_type < 0)
		return XDP_PASS;

	/* Assignment 2 and 3 will implement these. For now they do nothing */
	if (proto_is_vlan(eth->h_proto))
		vlan_tag_pop(ctx, eth);
	else
		vlan_tag_push(ctx, eth, 1);

	return XDP_PASS;
}

/* Solution to the parsing exercise in lesson packet01. Handles VLANs and legacy
 * IP (via the helpers in parsing_helpers.h).
 */
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
		//inet_ntop(AF_INET6, &ip6h->saddr, src_addr, sizeof(src_addr));
		//inet_ntop(AF_INET6, &ip6h->daddr, dst_addr, sizeof(src_addr));
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
		//inet_ntop(AF_INET, &iph->saddr, src_addr, sizeof(src_addr));
		//inet_ntop(AF_INET, &iph->daddr, dst_addr, sizeof(src_addr));
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
