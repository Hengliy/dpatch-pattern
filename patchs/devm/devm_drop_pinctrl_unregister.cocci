/// drop pinctrl_unregister for devm_ registered device
///
/// It's not necessary to unregister pin controller device registered
/// with devm_pinctrl_register() and using pinctrl_unregister() leads
/// to a double free.
///

@r1@
identifier fn_probe;
expression dev;
type T;
@@
T fn_probe(...)
{
  <+...
  dev = devm_pinctrl_register(...)
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

@p1 depends on r2@
identifier r1.fn_probe;
type T;
@@
T fn_probe(...)
{
<+...
(
- devm_pinctrl_unregister(...);
|
- pinctrl_unregister(...);
)
...+>
}

@p2 depends on r3@
identifier r3.fn_remove;
type T;
@@
T fn_remove(...)
{
<+...
(
- devm_pinctrl_unregister(...);
|
- pinctrl_unregister(...);
)
...+>
}

@p3@
expression dev, pctl;
@@
pctl = devm_pinctrl_register(dev, ...)
<+...
- pinctrl_unregister(pctl);
+ devm_pinctrl_unregister(dev, pctl);
...+>

