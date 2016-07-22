/// Fix missing spin_lock_init()
///
/// Options: --include-headers
///
/// The driver allocates the spinlock but not initialize it.
/// Use spin_lock_init() on it to initialize it correctly.
///
/// This is detected by Coccinelle semantic patch.
///

@r@
identifier s, fld;
@@

struct s {
  ...
  spinlock_t fld;
  ...
};

@ok1@
identifier r.s, r.fld;
struct s *mm;
@@
  spin_lock_init(&mm->fld)

@ok2@
identifier r.s, r.fld;
struct s *mm;
position p;
@@
  mm@p = \(kmalloc\|kzalloc\|devm_kmalloc\|devm_kzalloc\)(...)
<+...
  spin_lock_init(&mm->fld)
...+>

@r1@
identifier r.fld;
expression E;
@@
 spin_lock(&E->fld)

@depends on !ok1 && r1@
identifier r.s;
struct s *mm;
position p != {ok2.p};
@@
* mm@p = \(kmalloc\|kzalloc\|devm_kmalloc\|devm_kzalloc\)(...)

