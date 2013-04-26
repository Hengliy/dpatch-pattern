/// add missing iounmap() on error in {{function}}
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

