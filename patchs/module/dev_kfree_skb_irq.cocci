/// use dev_kfree_skb_irq instead of kfree_skb
///
/// It is not allowed to call kfree_skb() from hardware interrupt
/// context or with interrupts being disabled, spin_lock_irqsave()
/// make sure always in irq disable context. So the kfree_skb()
/// should be replaced with dev_kfree_skb_irq().
///
/// This is detected by Coccinelle semantic patch.
///

@r1@
expression lock, skb;
@@

spin_lock_irq(lock);
<+... when != spin_unlock_irq(lock)
- kfree_skb(skb);
+ dev_kfree_skb_irq(skb);
...+>
spin_unlock_irq(lock);

@r2@
expression lock, skb, flags;
@@

spin_lock_irqsave(lock, flags);
<+... when != spin_unlock_irqrestore(lock, flags)
- kfree_skb(skb);
+ dev_kfree_skb_irq(skb);
...+>
spin_unlock_irqrestore(lock, flags);

