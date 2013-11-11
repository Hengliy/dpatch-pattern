/// add missing clk_disable_unprepare() in {{function}}
///
/// Except File: drivers/media/platform/fsl-viu.c : special case that can not detect correctly
/// Except File: drivers/spi/spi-atmel.c : special case that can not detect correctly
///
/// clock source is prepared and enabled by clk_prepare_enable()
/// in probe function, but no disable or unprepare in remove.
///
@r1@
identifier fn_probe;
expression clk;
type T;
@@
T fn_probe(...)
{
  ...
  clk_prepare_enable(clk)
  ...
}

@ok1 depends on r1@
identifier r1.fn_probe;
expression r1.clk;
type T;
@@
T fn_probe(...)
{
  ...
  \(clk_disable_unprepare\|clk_disable\)(clk)
  ...
  return 0;
}

@r2 depends on r1 && !ok1@
identifier r1.fn_probe;
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

@depends on r2@
identifier r2.fn_remove;
expression r1.clk;
type T;
@@
T fn_remove(...)
{
  ... when != clk_disable_unprepare(clk)
      when != mpc5121_nfc_free(...)
      when forall
+ clk_disable_unprepare(clk);
? return ...;
}

