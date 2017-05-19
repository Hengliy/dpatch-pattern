/// use devm_reset_controller_register()
///
/// Options: -D fullmatch
/// Flags: 64
///
/// Use devm_reset_controller_register() for the reset controller
/// registration and drop the .remove callback.
///

virtual patch
virtual content
virtual fullmatch

@r1@
identifier fn_probe;
identifier pdev;
expression rcdev;
position p;
type T;
@@

T fn_probe(struct platform_device *pdev)
{
  <+...
  reset_controller_register@p(rcdev)
  ...+>
}

@r11@
identifier r1.fn_probe;
identifier r1.pdev;
identifier dev;
type T;
@@

T fn_probe(struct platform_device *pdev)
{
  ...
  struct device *dev = &pdev->dev;
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

@r4@
identifier r3.fn_remove;
type T;
@@
T fn_remove(...)
{
  ...
  reset_controller_unregister(...);
? return ...;
}

@r5@
identifier r3.fn_remove;
identifier drvdata, fn;
type T, T2;
@@

T fn_remove(...)
{
? T2 drvdata = fn(...);
  reset_controller_unregister(...);
? return ...;
}

@p11 depends on r2 && r11 && !content && (!fullmatch || r4 || !r3)@
identifier r1.fn_probe;
identifier r1.pdev, r11.dev;
expression r1.rcdev;
type T;
@@
T fn_probe(struct platform_device *pdev)
{
  <+...
- reset_controller_register(rcdev)
+ devm_reset_controller_register(dev, rcdev)
  ...+>
}

@p12 depends on r2 && !r11 && !content && (!fullmatch || r4 || !r3)@
identifier r1.fn_probe;
identifier r1.pdev;
expression r1.rcdev;
type T;
@@
T fn_probe(struct platform_device *pdev)
{
  <+...
- reset_controller_register(rcdev)
+ devm_reset_controller_register(&pdev->dev, rcdev)
  ...+>
}

@p2 depends on p11 || p12@
identifier r1.fn_probe;
type T;
@@
T fn_probe(...)
{
  <+...
- reset_controller_unregister(...);
  ...+>
}

@p3 depends on p11 || p12@
identifier r3.fn_remove;
type T;
@@
T fn_remove(...)
{
  <+...
- reset_controller_unregister(...);
  ...+>
}

@p4 depends on p3@
identifier r3.fn_remove;
identifier drvdata, fn;
type T, T2;
@@

- T fn_remove(...)
- {
?-  T2 drvdata = fn(...);
?-  return ...;
- }

@p5 depends on p4@
identifier r1.fn_probe;
identifier r3.fn_remove;
identifier driver;
@@
struct platform_driver driver = {
...,
  .probe = fn_probe,
- .remove = fn_remove,
...
};

@script:python depends on r2 && !r3 && !r5 && content@
@@
msg = """Use devm_reset_controller_register() for the reset controller
registration and fixes the memory leak when unload the module."""

print("%s" % msg)

@script:python depends on r2 && r3 && !r5 && content@
@@
msg = """Use devm_reset_controller_register() for the reset controller
registration and remove the unregister call from the .remove
callback."""

print("%s" % msg)

@script:python depends on r2 && r3 && r5 && content@
@@

msg = """Use devm_reset_controller_register() for the reset controller
registration and drop the .remove callback."""

print("%s" % msg)

