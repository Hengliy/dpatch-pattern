/// drop gpiod_put for gpio descriptor obtain with devm_gpiod_get
///
/// devm_gpiod_get() is used so there is no reason to explicitly
/// call gpiod_put() in probe or remove functions.
///

@r1@
identifier fn_probe;
expression dev;
type T;
@@
T fn_probe(...)
{
  ...
  dev = devm_gpiod_get(...)
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
-gpiod_put(...);
...+>
}

@depends on r3@
identifier r3.fn_remove;
type T;
@@
T fn_remove(...)
{
<+...
-gpiod_put(...);
...+>
}

@@
expression desc, dev;
@@
desc = devm_gpiod_get(dev, ...)
<+...
- gpiod_put(desc);
+ devm_gpiod_put(dev, desc);
...+>


