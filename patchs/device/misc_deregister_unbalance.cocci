/// add missing misc_deregister() when module exit
///
/// Except File: drivers/char/efirtc.c : special case that can not detect correctly
///
/// We have register misc device when module init, and
/// need deregister it when module exit.
///

@r1@
identifier fn_probe;
expression misc != {mpc8xxx_wdt_miscdev};
type T;
@@
T fn_probe(...)
{
  ...
  misc_register(misc)
  ...
}

@r2 depends on r1@
identifier r1.fn_probe;
identifier fn_remove;
identifier driver;
type T;
@@
T driver = {
...,
  .probe = fn_probe,
  .remove = fn_remove,
...
};

@depends on r2@
identifier r2.fn_remove;
expression r1.misc;
type T;
@@
T fn_remove(...)
{
  ... when != misc_deregister(misc)
      when != nv_tco_cleanup()
      when != sp5100_tco_cleanup()
      when forall
+ misc_deregister(misc);
? return ...;
}

@r3 depends on r1 && !r2@
declarer name module_init;
identifier r1.fn_probe;
@@
module_init(fn_probe);

@r4 depends on r3@
declarer name module_exit;
identifier fn_remove;
@@
module_exit(fn_remove);

@depends on r4@
identifier r4.fn_remove;
expression r1.misc;
type T;
@@
T fn_remove(...)
{
  ... when != misc_deregister(misc)
      when forall
+ misc_deregister(misc);
? return ...;
}

