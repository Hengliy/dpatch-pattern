/// missing uart_unregister_driver() on error in {{function}}
///
/// Except File: drivers/tty/serial/max3100.c : special case that can not detect correctly
///
/// Add the missing uart_unregister_driver() before return
/// from {{function}} in the error handling case.
///
@r1 exists@
expression ret, drv;
expression E != {0};
statement S;
position p;
@@
 ret = uart_register_driver(drv);
 if (\(ret < 0\|ret != 0\)) S
  ... when != uart_unregister_driver(drv)
 if (...) {
    ... when != uart_unregister_driver(drv);
   return@p E;
  }

@depends on r1@
expression r1.drv, r1.E;
position r1.p;
@@
+ uart_unregister_driver(drv);
  return@p E;
