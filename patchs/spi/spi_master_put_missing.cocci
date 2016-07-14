/// fix reference leak to master
///
/// Once a spi_master_get() call succeeds, we need an additional
/// spi_master_put() call to free the memory, otherwise we will
/// leak a reference to master.
///

@@
expression master;
identifier fn != {spi_alloc_device};
type T;
@@
T fn(...)
{
  ...
- spi_master_get(master)
+ master
  ... when != spi_master_put(...)
      when forall
}

@@
expression master;
identifier fn;
@@
 ... when != spi_master_get(master)
     when != master = spi_master_get(...)
-  spi_unregister_master(master);
+  spi_unregister_master(spi_master_get(master));
  ...
  fn(master);

@r11@
identifier fn_probe;
expression master, dev;
type T;
@@
T fn_probe(...)
{
  ...
  master = spi_alloc_master(...)
  ... when != spi_register_master(master)
      when != devm_spi_register_master(dev, master)
      when forall
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
expression r11.master;
type T;
@@
T fn_remove(...)
{
  ... when != spi_master_put(...)
      when != uwire_off(...)
      when forall
+ spi_master_put(master);
? return ...;
}
 
