/// remove pointless conditional before kfree_skb()
///
/// Except File: include/linux/skbuff.h : performance impact for nf_conntrack_put_reasm()
/// Except File: net/tipc/port.c : special case that can not detect correctly
/// Except File: net/ipv6/netfilter/nf_conntrack_reasm.c : special case that can not detect correctly
/// Except File: net/batman-adv/send.c : special case that can not detect correctly
/// Except File: kernel/audit.c : special case that can not detect correctly
/// Except File: drivers/isdn/mISDN/socket.c : special case that can not detect correctly
/// Except File: drivers/net/ethernet/chelsio/cxgb3/cxgb3_offload.c : special case that can not detect correctly
/// Except File: drivers/net/ethernet/chelsio/cxgb3/cxgb3_main.c : special case that can not detect correctly
/// Except File: net/batman-adv/network-coding.c : special case that can not detect correctly
///
/// Remove pointless conditional before kfree_skb().
///
@@
expression E;
@@

- if (E) kfree_skb(E);
+ kfree_skb(E);