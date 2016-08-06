/// use devm_spi_register_master()
///
/// Options: -D fullmatch
/// Flags: 64
///
/// Use devm_spi_register_master() to make cleanup paths simpler,
/// and drop unnecessary .remove callback.
///

virtual patch
virtual content
virtual fullmatch

@r1@
identifier fn_probe;
identifier pdev;
type T;
position p;
@@

T fn_probe(struct platform_device *pdev)
{
  <+...
  spi_register_master@p(...)
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

@r4@
identifier r3.fn_remove;
identifier drvdata, fn;
type T, T2;
@@
T fn_remove(...)
{
? T2 drvdata = fn(...);
  ...
  spi_unregister_master(...);
? return 0;
}

@r5@
identifier r3.fn_remove;
identifier drvdata, fn;
type T, T2;
@@
T fn_remove(...)
{
? T2 drvdata = fn(...);
  spi_unregister_master(...);
? return 0;
}

@p1 depends on r2 && !content && (!fullmatch || r4 || !r3)@
identifier r1.fn_probe;
identifier pdev;
expression master;
type T;
@@
T fn_probe(struct platform_device *pdev)
{
  <+...
- spi_register_master(master)
+ devm_spi_register_master(&pdev->dev, master)
  ...+>
}

@p2 depends on p1@
identifier r1.fn_probe;
type T;
@@
T fn_probe(...)
{
  <+...
- spi_unregister_master(...);
  ...+>
}

@p3 depends on p1@
identifier r3.fn_remove;
type T;
@@
T fn_remove(...)
{
  <+...
- spi_unregister_master(...);
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
-   return ...;
- }

@p5 depends on p4@
identifier r3.fn_remove;
identifier driver;
type T;
@@
T driver = {
...,
- .remove = fn_remove,
...
};

@script:python depends on r2 && !r5 && content@
@@
msg = "Use devm_spi_register_master() to make cleanup paths simpler."

print msg

@script:python depends on r2 && r5 && content@
@@

msg = """Use devm_spi_register_master() to make cleanup paths simpler,
and drop unnecessary .remove callback."""

print msg

