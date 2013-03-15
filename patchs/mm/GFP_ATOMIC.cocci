/// use GFP_ATOMIC under spin lock
///
/// Except File: drivers/net/ethernet/intel/igb/igb_main.c : special case that can not detect correctly
///
/// A spin lock is taken here so we should use GFP_ATOMIC.
///
@@
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
- GFP_KERNEL
+ GFP_ATOMIC


