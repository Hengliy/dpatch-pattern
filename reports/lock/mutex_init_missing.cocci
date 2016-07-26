/// Fix missing mutex_init()
///
/// Except File: drivers/gpu/drm/amd/amdgpu/atom.c : false positive
/// Except File: drivers/gpu/drm/radeon/atom.c : false positive
/// Except File: drivers/media/platform/vsp1/vsp1_video.c : false positive
/// Except File: drivers/infiniband/ulp/iser/iscsi_iser.c : false positive
///
/// Options: --include-headers
///
/// The driver allocates the mutex but not initialize it.
/// Use mutex_init() on it to initialize it correctly.
///
/// This is detected by Coccinelle semantic patch.
///

@r1@
identifier s, fld;
struct s *mm;
@@
  mutex_init(\(&mm->fld\|&(mm->fld)\))

@r2@
identifier r1.s, r1.fld;
position p;
@@

struct s {
  ...
  struct mutex fld@p;
  ...
};

@r3@
identifier s, fld;
position p != {r2.p};
@@

struct s {
  ...
  struct mutex fld@p;
  ...
};

@r4@
identifier r3.fld;
identifier r3.s;
struct s *mm;
@@

mutex_lock(&mm->fld)

@depends on r4@
identifier r3.s;
struct s *mm;
@@
* mm = \(kmalloc\|kzalloc\|devm_kmalloc\|devm_kzalloc\)(...)

