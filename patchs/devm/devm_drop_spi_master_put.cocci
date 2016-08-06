/// remove spi_master_put in {{function}}
///
/// The call to spi_master_put() in {{function}} is redundant since
/// the master is registered using devm_spi_register_master() and no
/// reference hold by using spi_master_get() in {{function}}.
///
/// This is detected by Coccinelle semantic patch.
///

@r11@
identifier fn_probe;
expression master, dev;
type T;
@@
T fn_probe(...)
{
  ...
  devm_spi_register_master(dev, master)
  ...
}

@r12 depends on r11@
identifier r11.fn_probe;
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

@depends on r12@
identifier r12.fn_remove;
type T;
@@
T fn_remove(...)
{
  ... when != spi_master_get(...)
      when forall
- spi_master_put(...);
  ...
}

