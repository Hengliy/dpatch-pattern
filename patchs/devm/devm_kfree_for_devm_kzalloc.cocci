/// drop devm_kfree of devm_kzalloc'd data
///
/// The devm_kfree function allocates memory that is released
/// when a driver detaches. Thus, there is no reason to explicitly
/// call devm_kfree in probe or remove functions.
///

@@
expression x;
@@
x = devm_kzalloc(...)
...
?-devm_kfree(..., x);

@r1@
identifier fn_probe;
expression x;
type T;
@@
T fn_probe(...)
{
  ...
  x = devm_kzalloc(...)
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
expression r1.x;
type T;
@@
T fn_remove(...)
{
...
-devm_kfree(..., x);
...
}

