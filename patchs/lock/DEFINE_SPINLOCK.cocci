/// use DEFINE_SPINLOCK() for spinlock
///
/// spinlock can be initialized automatically with DEFINE_SPINLOCK()
/// rather than explicitly calling spin_lock_init().
///

@r@
identifier spinlock;
@@
spinlock_t spinlock;

@p1@
identifier r.spinlock;
@@
- spin_lock_init(&spinlock);

@depends on p1@
identifier r.spinlock;
declarer name DEFINE_IDR;
@@
- spinlock_t spinlock;
+ DEFINE_SPINLOCK(spinlock);

