/// remove unnessary regulator_bulk_free() call
///
/// It's not necessary to free regulators which registered with
/// devm_regulator_bulk_get() and using regulator_bulk_free() leads
/// to a double free.
///

@r1@
identifier fn_probe;
type T;
@@
T fn_probe(...)
{
  <+...
  devm_regulator_bulk_get(...)
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
- regulator_bulk_free(...);
...+>
}

@depends on r3@
identifier r3.fn_remove;
type T;
@@
T fn_remove(...)
{
<+...
-regulator_bulk_free(...);
...+>
}

@@
@@
  devm_regulator_bulk_get(...)
<+...
- regulator_bulk_free(...);
...+>


