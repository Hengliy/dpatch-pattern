/// fix missing clk_disable_unprepare() on error in {{function}}
///
/// Except File: drivers/net/ethernet/freescale/fs_enet/fs_enet-main.c : special case that can not detect correctly
/// Except File: drivers/tty/serial/imx.c : special case that can not detect correctly
/// Except File: sound/soc/fsl/imx-audmux.c : special case that can not detect correctly
/// Except File: drivers/mtd/nand/gpmi-nand/gpmi-lib.c : special case that can not detect correctly
/// Except File: sound/soc/kirkwood/kirkwood-i2s.c : special case that can not detect correctly
/// Except File: drivers/tty/serial/mpc52xx_uart.c : special case that can not detect correctly
/// Except File: drivers/spi/spi-bcm63xx.c : special case that can not detect correctly
///
/// Fix the missing clk_disable_unprepare() before return
/// from {{function}} in the error handling case.
///
@ok1 exists@
expression ret, clk;
expression E != {0}, E1;
statement S;
position p;
@@
 ret = clk_prepare_enable(clk);
 if (\(ret < 0\|ret != 0\)) S
  ... when != clk_disable_unprepare(clk)
  E1 = clk;
 ... when != clk_disable_unprepare(clk)
 if (...) {
   ... when != clk_disable_unprepare(E1)
       when forall
    clk_disable_unprepare(E1);
  ...
   return@p E;
  }

@r1 exists@
expression ret, clk;
expression E != {0};
statement S;
position p1, p2 != {ok1.p};
@@
 ret = clk_prepare_enable(clk);
 if (\(ret < 0\|ret != 0\)) S
  ... when != clk_disable_unprepare(clk)
 if@p1 (...) {
   ... when != clk_disable_unprepare(clk)
       when != mpc5121_nfc_free(...)
       when != imx_keypad_close(...)
       when forall
   return@p2 E;
  }

@depends on r1@
expression r1.clk, r1.E;
position r1.p2;
@@
+ clk_disable_unprepare(clk);
  return@p2 E;
