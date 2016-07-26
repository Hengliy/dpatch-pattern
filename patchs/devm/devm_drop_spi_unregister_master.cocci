/// drop unneeded spi_unregister_master() call
///
/// It's not necessary to unregister SPI master controller registered
/// with devm_spi_register_master().
///

@r1@
identifier fn_probe;
expression master;
type T;
@@
T fn_probe(...)
{
  ...
  devm_spi_register_master(master)
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
- devm_spi_unregister(...);
|
- spi_unregister_master(...);
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
- devm_spi_unregister(...);
|
- spi_unregister_master(...);
)
...+>
}

@@
expression master;
@@
devm_spi_register_master(master)
<+...
- spi_unregister_master(master)
+ devm_spi_unregister(master)
...+>


