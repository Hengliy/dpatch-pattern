/// drop unnecessary gpiochip_remove
///
/// It's not necessary to unregister gpio_chip which registered
/// with devm_gpiochip_add_data().
///

@r1@
identifier fn_probe;
expression dev;
type T;
@@
T fn_probe(...)
{
  <+...
  devm_gpiochip_add_data(dev, ...)
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
- gpiochip_remove(...);
...+>
}

@depends on r3@
identifier r3.fn_remove;
type T;
@@
T fn_remove(...)
{
<+...
- gpiochip_remove(...);
...+>
}

@@
expression dev;
@@
  devm_gpiochip_add_data(dev, ...)
<+...
- gpiochip_remove(...);
...+>


