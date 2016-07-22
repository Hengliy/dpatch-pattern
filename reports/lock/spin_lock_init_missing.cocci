/// Fix missing spin_lock_init()
///
/// Options: --include-headers
///
/// The driver allocates the spinlock but not initialize it.
/// Use spin_lock_init() on it to initialize it correctly.
///
/// This is detected by Coccinelle semantic patch.
///

@r1@
identifier s, fld;
struct s *mm;
@@
  spin_lock_init(\(&mm->fld\|&(mm->fld)\))

@r2@
identifier r1.s, r1.fld;
position p;
@@

struct s {
  ...
  spinlock_t fld@p;
  ...
};

@r3@
identifier s, fld;
position p != {r2.p};
@@

struct s {
  ...
  spinlock_t fld@p;
  ...
};

@r4@
identifier r3.fld;
identifier r3.s;
struct s *mm;
@@
(
 \(spin_lock\|spin_lock_bh\|spin_trylock\|spin_lock_irq\)(&mm->fld)
|
 spin_lock_irqsave(&mm->fld,...)
)

@depends on r4@
identifier r3.s;
struct s *mm;
@@
* mm = \(kmalloc\|kzalloc\|devm_kmalloc\|devm_kzalloc\)(...)
