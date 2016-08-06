/// use devm_iio_device_register()
///
/// Options: -D fullmatch
///
/// Use devm_iio_device_register() for IIO subsystem device
/// registration and delete the remove function since there
/// is no need after this change.
///

virtual patch
virtual content
virtual fullmatch

@r1@
identifier fn_probe;
identifier pdev;
position p;
@@
int fn_probe(struct \(platform_device\|spi_device\|i2c_client\) *pdev)
{
  ...
  iio_device_register@p(...)
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
identifier drvdata;
type T;
@@
T fn_remove(...)
{
? T drvdata = ...;
  ...
  iio_device_unregister(...);
? return 0;
}

@r5@
identifier r3.fn_remove;
identifier drvdata;
type T;
@@
T fn_remove(...)
{
? T drvdata = ...;
  iio_device_unregister(...);
? return 0;
}

@p1 depends on r1 && r2 && !content && (!fullmatch || r4 || !r3)@
identifier r1.fn_probe;
identifier pdev;
expression indio_dev;
@@
int fn_probe(struct \(platform_device\|spi_device\|i2c_client\) *pdev)
{
  <+...
- iio_device_register(indio_dev)
+ devm_iio_device_register(&pdev->dev, indio_dev)
  ...+>
}

@p2 depends on p1@
identifier r1.fn_probe;
@@
int fn_probe(...)
{
  <+...
- iio_device_unregister(...);
  ...+>
}

@p3 depends on p1@
identifier r3.fn_remove;
@@
int fn_remove(...)
{
  <+...
- iio_device_unregister(...);
  ...+>
}

@p4 depends on p3@
identifier r3.fn_remove;
identifier drvdata;
type T;
@@

- int fn_remove(...)
- {
?-  T drvdata = ...;
-   return 0;
- }

@depends on p3@
identifier r3.fn_remove;
identifier indio_dev;
type T;
@@
int fn_remove(...)
{
  ...
- T indio_dev = ...;
  ... when != indio_dev
}

@p5 depends on p4@
identifier r1.fn_probe;
identifier r3.fn_remove;
identifier driver;
type T;
@@
T driver = {
...,
  .probe = fn_probe,
- .remove = fn_remove,
...
};

@script:python depends on r1 && r2 && !r5 && content@
@@
msg = "Use devm_iio_device_register() for IIO subsystem device registration."

print msg

@script:python depends on r1 && r2 && r5 && content@
@@

msg = """Use devm_iio_device_register() for IIO subsystem device
registration and delete the remove function since there
is no need after this change."""

print msg

