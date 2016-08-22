/// fix missing clk_disable_unprepare() in {{function}}
///
/// Except File: drivers/media/platform/fsl-viu.c : special case that can not detect correctly
/// Except File: drivers/spi/spi-atmel.c : special case that can not detect correctly
/// Except File: drivers/mmc/host/sdhci-pxav3.c : special case that can not detect correctly
/// Except File: drivers/i2c/busses/i2c-exynos5.c : special case that can not detect correctly
/// Except File: drivers/i2c/busses/i2c-bcm-kona.c : special case that can not detect correctly
/// Except File: drivers/usb/chipidea/usbmisc_imx.c : special case that can not detect correctly
/// Except File: drivers/spi/spi-bcm63xx-hsspi.c : special case that can not detect correctly
/// Except File: drivers/mmc/host/sdhci-of-arasan.c : special case that can not detect correctly
/// Except File: sound/soc/samsung/i2s.c : special case that can not detect correctly
/// Except File: drivers/tty/serial/imx.c : special case that can not detect correctly
/// Except File: drivers/pwm/pwm-atmel-tcb.c : special case that can not detect correctly
/// Except File: drivers/pwm/pwm-atmel-hlcdc.c : special case that can not detect correctly
/// Except File: drivers/media/platform/sti/c8sectpfe/c8sectpfe-core.c : special case that can not detect correctly
///
/// clock source is prepared and enabled by clk_prepare_enable()
/// in probe function, but no disable or unprepare in remove.
///
@r1@
identifier fn_probe;
expression clk, ret;
type T;
@@
T fn_probe(...)
{
  ...
  ret = clk_prepare_enable(clk)
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
      when != atlas7_wdt_shutdown(...)
      when != s3cmci_shutdown(...)
      when forall
+ clk_disable_unprepare(clk);
? return ...;
}

