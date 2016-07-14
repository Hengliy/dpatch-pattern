/// fix potential double free in {{function}}
///
/// Since rc_unregister_device() frees its argument, the subsequently
/// call to rc_free_device() on the same variable will cause a double
/// free bug. Fix by set argument to NULL, thus when fall through to
/// rc_free_device(), nothing will be done there.
///
 
@@
expression dev, E;
@@
 rc_unregister_device(dev);
+ dev = NULL;
 ... when != dev = E
 rc_free_device(dev);
