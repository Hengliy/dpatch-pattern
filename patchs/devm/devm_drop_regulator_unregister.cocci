/// remove unnessary regulator_unregister() call
///
/// It's not necessary to unregister regulator which registered
/// with devm_regulator_register() and using regulator_unregister()
/// leads to a double free.
///

@r1@
identifier fn_probe;
expression dev;
type T;
@@
T fn_probe(...)
{
  <+...
  dev = devm_regulator_register(...)
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
(
- devm_regulator_unregister(...);
|
- regulator_unregister(...);
)
...+>
}

@depends on r3@
identifier r3.fn_remove;
type T;
@@
T fn_remove(...)
{
<+...
(
-devm_regulator_unregister(...);
|
-regulator_unregister(...);
)
...+>
}

@@
expression dev, rdev;
@@
rdev = devm_regulator_register(dev, ...)
<+...
- regulator_unregister(rdev);
+ devm_regulator_unregister(dev, rdev);
...+>


