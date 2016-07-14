/// add missing misc_deregister() on error in {{function}}
///
/// Except File: drivers/input/serio/serio_raw.c : special case that can not detect correctly
///
/// Add the missing misc_deregister() before return from
/// {{function}} in the error handling case.
///

@r1 exists@
expression ret, misc;
expression E != {0};
statement S;
position p1, p2;
@@
 ret = misc_register(misc);
 if (\(ret < 0\|ret != 0\)) S
  ... when != misc_deregister(misc)
 if@p1 (...) {
   ... when != misc_deregister(misc)
       when forall
   return@p2 E;
  }

@depends on r1@
expression r1.misc, r1.E;
position r1.p2;
@@
+ misc_deregister(misc);
  return@p2 E;

