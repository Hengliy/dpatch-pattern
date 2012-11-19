/// use GFP_ATOMIC under spin lock
///
/// The function {{function}} is called from several
/// places, in some of which, such as {{function2}}, a lock may
/// be held here, so we should use GFP_ATOMIC when a lock is held.
///
@gfp exists@
identifier fn;
position p;
@@

fn(...) {
 ... when != spin_unlock(...)
     when != spin_unlock_bh(...)
     when != spin_unlock_irq(...)
     when != spin_unlock_irqrestore(...)
     when != local_irq_enable(...)
     when any
 GFP_KERNEL@p
 ... when any
}

@locked exists@
identifier gfp.fn;
@@

(
spin_lock
|
spin_trylock
|
spin_lock_bh
|
spin_lock_irq
|
spin_lock_irqsave
|
local_irq_disable
)
 (...)
...  when != spin_unlock(...)
     when != spin_unlock_bh(...)
     when != spin_unlock_irq(...)
     when != spin_unlock_irqrestore(...)
     when != local_irq_enable(...)
fn(...)

@depends on locked@
position gfp.p;
expression E;
@@
(
E ? GFP_KERNEL : GFP_ATOMIC
|
- GFP_KERNEL@p
+ GFP_ATOMIC
)
