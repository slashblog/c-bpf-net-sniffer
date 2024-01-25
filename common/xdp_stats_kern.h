/* SPDX-License-Identifier: GPL-2.0 */

/* Used *ONLY* by BPF-prog running kernel side. */
#ifndef __XDP_STATS_KERN_H
#define __XDP_STATS_KERN_H

/* Data record type 'struct datarec' is defined in common/xdp_stats_kern_user.h,
 * programs using this header must first include that file.
 */
#ifndef __XDP_STATS_KERN_USER_H
#warning "You forgot to #include <../common/xdp_stats_kern_user.h>"
#include "xdp_stats_kern_user.h"
#endif

/* Keeps stats per (enum) xdp_action */
struct
{
	__uint(type, BPF_MAP_TYPE_PERCPU_ARRAY);
	__type(key, __u32);
	__type(value, struct datarec);
	__uint(max_entries, XDP_ACTION_MAX);
} xdp_stats_map SEC(".maps");

struct
{
	__uint(type, BPF_MAP_TYPE_QUEUE);
	__type(value, struct packetrec);
	__uint(max_entries, XDP_QUEUE_MAX);
} xdp_packets_queue SEC(".maps");

static __always_inline
	__u32
	xdp_stats_record_action(struct xdp_md *ctx, __u32 action)
{
	if (action >= XDP_ACTION_MAX)
		return XDP_ABORTED;

	/* Lookup in kernel BPF-side return pointer to actual data record */
	struct datarec *rec = bpf_map_lookup_elem(&xdp_stats_map, &action);
	if (!rec)
		return XDP_ABORTED;

	/* BPF_MAP_TYPE_PERCPU_ARRAY returns a data record specific to current
	 * CPU and XDP hooks runs under Softirq, which makes it safe to update
	 * without atomic operations.
	 */
	rec->rx_packets++;
	rec->rx_bytes += (ctx->data_end - ctx->data);

	return action;
}

static __always_inline __u32 xdp_add_to_queue(struct xdp_md *ctx, const tcp_addr *saddr, const tcp_addr *daddr, const __u8 isv6, const __u16 *sport, const __u16 *dport)
{
	struct packetrec data;

	data.src_addr = *saddr;
	data.dst_addr = *daddr;
	data.isv6 = isv6;
	data.src_port = *sport;
	data.dst_port = *dport;

	if (bpf_map_push_elem(&xdp_packets_queue, &data, BPF_EXIST) < 0)
		return XDP_ABORTED;

	return XDP_PASS;
}

#endif /* __XDP_STATS_KERN_H */
