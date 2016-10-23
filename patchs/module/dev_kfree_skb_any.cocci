/// use dev_kfree_skb_any instead of dev_kfree_skb
///
/// Replace dev_kfree_skb with dev_kfree_skb_any in {{function}}
/// which can be called from hard irq context (netpoll) and from
/// other contexts. {{function}} only frees skbs that it has
/// dropped.
///
/// This is detected by Coccinelle semantic patch.
///

@r1@
identifier netdev_ops, poll_controller;
@@
struct net_device_ops netdev_ops = {
    ...,
    .ndo_poll_controller = poll_controller,
    ...
};

@r2@
identifier r1.netdev_ops, xmit;
@@
struct net_device_ops netdev_ops = {
    ...,
    .ndo_start_xmit = xmit,
    ...
};

@p1@
identifier r2.xmit;
expression skb;
@@
int xmit(...)
{
<+...
- \(dev_kfree_skb\|dev_kfree_skb_irq\|kfree_skb\|consume_skb\)(skb);
+ dev_kfree_skb_any(skb);
...+>
}

@r3@
expression skb;
identifier func;
type T;
@@
T func(...)
{
<+...
\(dev_kfree_skb\|dev_kfree_skb_irq\|kfree_skb\|consume_skb\)(skb);
...+>
}

@r4@
identifier r2.xmit, r3.func;
@@
int xmit(...)
{
<+...
func(...);
...+>
}

@p2 depends on r4@
expression r3.skb;
identifier r3.func;
type T;
@@
T func(...)
{
<+...
- \(dev_kfree_skb\|dev_kfree_skb_irq\|kfree_skb\|consume_skb\)
+ dev_kfree_skb_any
  (skb);
...+>
}

