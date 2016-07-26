/// kill unnecessary spin_lock_init()
///
/// Flags: 64
///
/// The spinlock {{spinlock}} is initialized statically. It is
/// unnecessary to initialize by spin_lock_init().
///

virtual content

@r1@
declarer name DEFINE_SPINLOCK;
identifier spinlock;
@@

DEFINE_SPINLOCK(spinlock);

@r2@
identifier r1.spinlock;
@@

 spin_lock_init(&spinlock);

@depends on !content@
identifier r1.spinlock;
@@

- spin_lock_init(&spinlock);

@script:python depends on r2 && content@
spinlock << r1.spinlock;
@@

msg = """The spinlock '%s' is initialized statically. It is
unnecessary to initialize by spin_lock_init()."""

print msg % spinlock

