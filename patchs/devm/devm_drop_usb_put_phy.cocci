/// drop usb_put_phy for device obtain with devm_usb_get_phy
///
/// This is not required because current code use devm_usb_get_phy()
/// to request the phy driver.
///

@r1@
identifier fn_probe;
expression dev;
type T;
@@
T fn_probe(...)
{
  ...
  dev = devm_usb_get_phy(...)
  ...
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
-usb_put_phy(...);
...+>
}

@depends on r3@
identifier r3.fn_remove;
type T;
@@
T fn_remove(...)
{
<+...
-usb_put_phy(...);
...+>
}

@@
expression usb, dev;
@@
usb = devm_usb_get_phy(dev, ...)
<+...
- usb_put_phy(usb)
+ devm_usb_put_phy(dev, usb)
...+>


