/// drop pinctrl_put for device with requested devm_pinctrl_get
///
/// This is not required because current code use devm_pinctrl_get()
/// to retrieves the pinctrl handle.
///

@r1@
identifier fn_probe;
expression dev;
type T;
@@
T fn_probe(...)
{
  ...
  dev = devm_pinctrl_get(...)
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
(
- pinctrl_put(...);
|
- devm_pinctrl_put(...);
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
- pinctrl_put(...);
...+>
}

@@
expression pctl, dev;
@@
pctl = devm_pinctrl_get(dev)
<+...
- pinctrl_put(pctl);
+ devm_pinctrl_put(dev, pctl);
...+>


