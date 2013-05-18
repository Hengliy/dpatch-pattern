/// add missing platform_device_del() on error in {{function}}
///
/// Except File: drivers/char/ipmi/ipmi_si_intf.c : special case that can not detect correctly
///
/// Add the missing platform_device_del() before return from
/// {{function}} in the error handling case.
///
@r1 exists@
expression dev;
expression ret, E2 != {0};
statement S;
position p;
@@
 ret = platform_device_add(dev);
 if (\(ret < 0\|ret != 0\)) S
 ... when != platform_device_del(dev)
     when forall
 if (...) {
   ... when != platform_device_del(dev);
       when != platform_device_unregister(dev);
       when forall
   return E2@p;
 }

@depends on r1@
position r1.p;
expression r1.dev, r1.E2;
@@
+ platform_device_del(dev);
  return E2@p;

