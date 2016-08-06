/// drop unnessary backlight_device_unregister()
///
/// It's not necessary to unregister backlight device which
/// registered with devm_backlight_device_register().
///

@r1@
identifier fn_probe;
type T;
@@
T fn_probe(...)
{
  <+...
  devm_backlight_device_register(...)
  ...+>
}

@r2 depends on r1@
identifier r1.fn_probe;
identifier driver;
position p;
type T;
@@
T driver@p = {
...,
  .probe = fn_probe,
...
};

@r3@
identifier fn_remove;
identifier r2.driver;
position r2.p;
type T;
@@
T driver@p = {
...,
 .remove = fn_remove,
...
};

@depends on r2@
identifier r1.fn_probe;
type T;
@@
T fn_probe(...)
{
<+...
- backlight_device_unregister(...);
...+>
}

@depends on r3@
identifier r3.fn_remove;
type T;
@@
T fn_remove(...)
{
<+...
- backlight_device_unregister(...);
...+>
}

@@
expression dev;
@@
  devm_backlight_device_register(dev, ...)
<+...
- backlight_device_unregister(...);
...+>


