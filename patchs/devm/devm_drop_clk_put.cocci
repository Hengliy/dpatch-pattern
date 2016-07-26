/// drop clk_put for clk get with devm_clk_get
///
/// devm_clk_get() is used so there is no reason to explicitly
/// call clk_put() in probe or remove functions.
///

@r1@
identifier fn_probe;
expression clk;
type T;
@@
T fn_probe(...)
{
  ...
  clk = devm_clk_get(...)
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
expression r1.clk;
type T;
@@
T fn_probe(...)
{
<+...
- clk_put(clk);
...+>
}

@depends on r3@
identifier r3.fn_remove;
type T;
@@
T fn_remove(...)
{
<+...
- clk_put(...);
...+>
}

@@
expression dev, clk;
@@
clk = devm_clk_get(dev, ...)
<+...
- clk_put(clk);
+ devm_clk_put(dev, clk);
...+>


