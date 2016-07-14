/// use vfree() instead of kfree()
///
/// Except File: net/xfrm/xfrm_hash.c : special case that can not detect correctly
///
/// Use vfree() instead of kfree() to free vmalloc()
/// allocated data.
///
@r01@
expression nm;
@@
nm = \(vmalloc\|vzalloc\)(...)

@r02@
expression nm, E;
position p1;
@@
 nm = \(kmalloc\|kzalloc\|kcalloc\)(...)
 ... when != nm = E
     when != &nm
 kfree@p1(nm);

@depends on !r02@
expression r01.nm;
position p != {r02.p1};
@@
- kfree@p(nm)
+ vfree(nm)

