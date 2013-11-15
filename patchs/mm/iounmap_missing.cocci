/// add missing iounmap() on error in {{function}}
///
/// Except File: drivers/char/applicom.c : special case that can not detect correctly
/// Except File: drivers/scsi/qla2xxx/qla_os.c : special case that can not detect correctly
/// Except File: drivers/tty/cyclades.c : special case that can not detect correctly
/// Except File: drivers/ssb/scan.c : special case that can not detect correctly
/// Except File: drivers/scsi/qla2xxx/qla_mr.c : special case that can not detect correctly
/// Except File: drivers/iommu/exynos-iommu.c : special case that can not detect correctly
/// Except File: drivers/bus/mvebu-mbus.c : special case that can not detect correctly
/// Except File: drivers/net/ethernet/smsc/smsc9420.c : special case that can not detect correctly
/// Except File: drivers/net/ethernet/nvidia/forcedeth.c : special case that can not detect correctly
/// Except File: drivers/memstick/host/jmb38x_ms.c : special case that can not detect correctly
/// Except File: drivers/tty/serial/ar933x_uart.c : special case that can not detect correctly
/// Except File: drivers/mfd/sm501.c : special case that can not detect correctly
/// Except File: drivers/scsi/arcmsr/arcmsr_hba.c : special case that can not detect correctly
/// Except File: drivers/net/ethernet/sfc/ef10.c : special case that can not detect correctly
///
/// Add the missing iounmap() before return from {{function}}
/// in the error handling case.
///
@ok1 exists@
expression addr;
expression E, E1;
statement S;
position p1;
@@
 addr = \(ioremap\|ioremap_nocache\)(...);
 if (addr == NULL) S
 ... when != iounmap(addr)
(
 E1 = addr;
|
 E1 = addr++;
)
 <... when != iounmap(E1)
 if@p1 (...) {
   ...
   iounmap(E1);
   ...
   return E;
 }
 ...>

@ok2 exists@
expression E;
position p2;
@@
 if(E == 0) {
   ...
   return @p2 E;
 }

@r1 exists@
expression addr;
expression E != {0};
statement S;
position p1 != ok1.p1;
position p2 != ok2.p2;
type T;
@@
 addr = \(ioremap\|ioremap_nocache\)(...);
 if (addr == NULL) S
 <... when != iounmap(addr)
 if@p1 (...) {
   ... when != iounmap(addr)
       when != iounmap((T)addr)
       when != pruss_cleanup(...)
       when != whc_clean_up(...)
       when != pch_udc_remove(...)
       when != udc_pci_remove(...)
       when != goku_remove(...)
       when != net2280_remove(...)
       when != ichxrom_cleanup(...)
       when != sa1100_destroy_subdev(...)
       when != cleanup_sbc_gxx()
       when != amd76xrom_cleanup(...)
       when != ixp4xx_flash_remove(...)
       when != esb2rom_cleanup(...)
       when != of_flash_remove(...)
       when != ck804xrom_cleanup(...)
       when != fsl_ifc_chip_remove(...)
       when != fsl_elbc_chip_remove(...)
       when != isif_remove(...)
       when != pruss_cleanup(...)
       when != tilcdc_unload(...)
       when != pcc_clear_mapping(...)
       when != cx18_iounmap(...)
       when != rt2x00soc_free_reg(...)
       when != ep93xx_eth_remove(...)
       when != ace_init_cleanup(...)
       when != ems_pcmcia_del_card(...)
       when != fsl_of_msi_remove(...)
       when != xemaclite_remove_ndev(...)
       when != sis_chip_free(...)
       when != snd_harmony_free(...)
       when != ace_init_cleanup(...)
       when != omap24xxcam_remove(...)
       when != ioc4_serial_remove_one(...)
       when != omap_dmm_remove(...)
       when != sh_mobile_lcdc_remove(...)
       when forall
   return@p2 E;
  }
  ...>

@depends on r1@
expression r1.addr, r1.E;
position r1.p2;
@@
+ iounmap(addr);
  return@p2 E;

