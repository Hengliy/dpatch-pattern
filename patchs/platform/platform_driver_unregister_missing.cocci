/// missing platform_driver_unregister() on error in {{function}}
///
/// Add the missing platform_driver_unregister() before return
/// from {{function}} in the error handling case.
///
@r1 exists@
expression ret, drv;
expression E != {0};
statement S;
position p;
@@
 ret = platform_driver_register(drv);
 if (\(ret < 0\|ret != 0\)) S
  ... when != platform_driver_unregister(drv)
 if (...) {
   ... when != platform_driver_unregister(drv);
       when != thinkpad_acpi_module_exit();
       when != loopback_unregister_all();
       when forall
   return@p E;
  }

@depends on r1@
expression r1.drv, r1.E;
position r1.p;
@@
+ platform_driver_unregister(drv);
  return@p E;
