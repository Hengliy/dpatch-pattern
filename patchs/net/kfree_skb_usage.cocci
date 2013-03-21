/// use kfree_skb() instead of kfree()
///
/// Use kfree_skb() instead of kfree() to free sk_buff.
///
@@
struct sk_buff *skb;
@@
- kfree(skb);
+ kfree_skb(skb);
