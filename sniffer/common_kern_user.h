/* This common_kern_user.h is used by kernel side BPF-progs and
 * userspace programs, for sharing common struct's and DEFINEs.
 */
#ifndef __COMMON_KERN_USER_H
#define __COMMON_KERN_USER_H
#include <netinet/in.h>

/* This is the data record stored in the map */
struct datarec
{
	__u64 rx_packets;
	__u64 rx_bytes;
};

typedef union
{
	struct in6_addr v6;
	__be32 v4;
} tcp_addr;

struct packetrec
{
	tcp_addr src_addr;
	tcp_addr dst_addr;
	__u8 isv6;
	__u16 src_port;
	__u16 dst_port;
};

#ifndef XDP_ACTION_MAX
#define XDP_ACTION_MAX (XDP_REDIRECT + 1)
#endif

#ifndef XDP_QUEUE_MAX
#define XDP_QUEUE_MAX 100
#endif

#endif /* __COMMON_KERN_USER_H */
