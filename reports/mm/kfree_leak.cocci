/// fix possible memory leak in {{function}}
///
/// Except File: sound/core/seq/oss/seq_oss_synth.c : special case that can not detect correctly
/// Except File: net/ipv6/mcast.c : special case that can not detect correctly
/// Except File: net/ipv6/ipv6_sockglue.c : special case that can not detect correctly
/// Except File: net/ipv4/igmp.c : special case that can not detect correctly
/// Except File: drivers/uwb/reset.c : special case that can not detect correctly
/// Except File: drivers/target/target_core_pr.c : special case that can not detect correctly
/// Except File: drivers/target/iscsi/iscsi_target.c : special case that can not detect correctly
/// Except File: drivers/mtd/tests/mtd_stresstest.c : special case that can not detect correctly
/// Except File: drivers/usb/host/fhci-hcd.c : special case that can not detect correctly
/// Except File: drivers/crypto/nx/nx-842.c : special case that can not detect correctly
/// Except File: drivers/mtd/tests/mtd_speedtest.c : special case that can not detect correctly
/// Except File: drivers/mtd/lpddr/qinfo_probe.c : special case that can not detect correctly
/// Except File: drivers/mtd/chips/gen_probe.c : special case that can not detect correctly
/// Except File: drivers/s390/block/dasd_diag.c : special case that can not detect correctly
/// Except File: drivers/scsi/ips.c : special case that can not detect correctly
/// Except File: drivers/net/wan/cosa.c : special case that can not detect correctly
/// Except File: drivers/target/iscsi/iscsi_target_login.c : special case that can not detect correctly
/// Except File: arch/x86/kernel/microcode_intel_early.c : special case that can not detect correctly
///
/// memory is malloced in {{function}} and should be freed before
/// leaving from the error handling cases, otherwise it will cause
/// memory leak.
///
@r1 exists@
position p1;
identifier E, fn;
expression E1, E2, E3;
@@

E1 = fn(...,&E,...);
if@p1 (<+...E1...+>) {
... when != kfree(E)
return E2;
}
... when != E = E3
kfree(E);
... when != E = E3

@r2 exists@
position p2;
identifier E, fn;
expression E1, E2;
@@

if@p2 (!fn(...,&E,...)) {
... when != kfree(E)
return E1;
}
... when != E = E2
kfree(E);
... when != E = E2

@r22 exists@
position p22;
identifier E, fn;
expression E1, E2;
@@

if@p22 (fn(...,&E,...) != E2) {
... when != kfree(E)
return E1;
}
... when != E = E2
kfree(E);
... when != E = E2

@r3 exists@
type T;
position p3;
identifier E;
expression E1, E2, E3;
@@
T E = E1;
<...
if@p3 (...) {
... when != kfree(E)
return E3;
}
...>
E1 = E2
...
kfree(E);

@r32 exists@
position p32;
identifier E;
expression E1, E2, E3;
@@
E = E1;
<...
if@p32 (...) {
... when != kfree(E)
return E3;
}
...>
E1 = E2
...
kfree(E);

@r33 exists@
type T;
position p33;
identifier E;
expression E1, E2, E3;
@@
T E = E1;
<...
if@p33 (...) {
... when != kfree(E)
return E3;
}
...>
rcu_assign_pointer(E1, E2)
...
kfree(E);

@r4 exists@
type T;
position p4;
identifier E, fn;
expression E1, E2;
@@
T E;
<...when != fn(...,&E,...)
    when != E = E2
    when != E = fn(...)
if@p4 (...) {
... when != kfree(E)
return E1;
}
...>
(
E = E2
|
fn(...,&E,...)
)
...
kfree(E);


@r5 exists@
position p5;
identifier E;
expression E1;
@@

if@p5 (E == 0) {
... when != kfree(E)
}
... when != E = E1
kfree(E);
... when != E = E1

@r52 exists@
position p52;
identifier E;
expression E1;
@@

if@p52 (E == NULL) {
... when != kfree(E)
}
... when != E = E1
kfree(E);
... when != E = E1

@r53 exists@
position p53;
identifier E;
expression E1;
@@

if@p53 (unlikely(E == NULL)) {
... when != kfree(E)
}
... when != E = E1
kfree(E);
... when != E = E1

@r54 exists@
position p54;
identifier E;
expression E1, E2;
@@

if@p54 ((E = E1) == NULL) {
... when != kfree(E)
}
... when != E = E2
kfree(E);
... when != E = E2

@r55 exists@
position p55;
identifier E;
expression E1;
@@

if@p55 (E != NULL) {
... when != kfree(E)
}
... when != E = E1
kfree(E);
... when != E = E1

@r56 exists@
position p56;
identifier E;
expression E1;
@@

if@p56 (IS_ERR(E)) {
... when != kfree(E)
}
... when != E = E1
kfree(E);
... when != E = E1

@r57 exists@
position p57;
identifier E;
expression E1;
@@

<...
if@p57 (...) {
... when != kfree(E)
return E;
}
...>
kfree(E);
... when != E = E1

@r58 exists@
position p58;
identifier E, l, fn;
expression E1;
@@

if@p58 (E == 0)
	goto l;
... when != E = E1
    when != E = fn(...)
kfree(E);
... when != E = E1

@r59 exists@
position p59;
identifier E;
expression E1, E2;
@@

if@p59 (E == 0)
	return E2;
... when != E = E1
kfree(E);
... when != E = E1

@r510 exists@
position p510;
identifier E, l, fn;
expression E1;
@@

if@p510 (E == NULL)
	goto l;
... when != E = E1
    when != E = fn(...)
kfree(E);
... when != E = E1

@r511 exists@
position p511;
identifier E, l, fn;
expression E1;
@@

if@p511 (IS_ERR(E))
	goto l;
... when != E = E1
    when != E = fn(...)
kfree(E);
... when != E = E1

@r512 exists@
position p512;
identifier E, l;
expression E1, E2;
@@

if@p512 ((E = E1) == NULL)
	goto l;
... when != E = E2
kfree(E);
... when != E = E2

@r513 exists@
position p513;
identifier E, l;
expression E1;
@@

if@p513 (unlikely(E == NULL))
	goto l;
... when != E = E1
kfree(E);
... when != E = E1

@r514 exists@
position p514;
identifier E;
expression E1, E2;
@@

E = E2
...
if@p514 (...) {
...
kfree(E2)
...
}
... when != E = E1
kfree(E);
... when != E = E1

@r515 exists@
position p515;
identifier E, fn;
expression E1, E2;
@@
// for drivers/tty/hvc/hvc_xen.c
// net/can/raw.c
if (...) {
	E = fn(...);
	...
} else if@p515 (...) {
	...
	return E2;
}
... when != E = E1
kfree(E);
... when != E = E1

@r516 exists@
position p516;
identifier E;
expression E1, E2, E3, E4;
@@
// for fs/befs/linuxvfs.c
E2 = E = E4;
if@p516 (E2 == NULL) {
	...
	return E3;
}
... when != E = E1
kfree(E);
... when != E = E1

@ok exists@
type T;
position p1 != {r1.p1, r2.p2, r22.p22, r3.p3, r32.p32, r33.p33, r4.p4, r5.p5, r52.p52, r53.p53, r54.p54, r55.p55, r56.p56, r57.p57, r58.p58, r59.p59, r510.p510, r511.p511, r512.p512, r513.p513, r514.p514, r515.p515, r516.p516};
identifier E, fn, fld, sb;
expression E1 != {0, true, NULL, AE_OK}, E2;
@@
//... when != kfree(E) //??? //drivers/staging/bcm/Bcmchar.c
(
if@p1(<+...E...+>)
return E1;
|
//if@p1(...)
//+ {
//+ kfree(E);
//return E1;
//+ }
//|
if@p1 (...) {
... when != kfree(E)
    when != E == NULL // fs/ntfs/namei.c
    when != E        //??? drivers/staging/bcm/Bcmchar.c
    when != dev_err(...)
    when != WARN_ON(...)
    when != if (E2) kfree(E);
    when != acpi_video_device_lcd_set_level(...)
    when != MREF_ERR(...)
    when != DMERR(...) // drivers/md/dm-thin-metadata.c
    when strict
+kfree(E);
return E1;
}
)
... when != E = E1
    when != &E
    when != E = fn(...)
    when != E = (T)fn(...)
    when != T E; // drivers/staging/ft1000/ft1000-usb/ft1000_debug.c
    when != list_del(&E->fld)
    when != list_replace(&E->fld, ...)
    when != hlist_del(&E->fld)
    when != list_del_rcu(&E->fld)
    when != videobuf_mmap_free(&E->fld)
    when != __remove_shared_memory(E)
    when != free_netdev(E->fld)
    when != em28xx_unregister_dvb(E)
    when != mspro_block_data_clear(E)
    when != sparse_init_one_section(...)
    when != sysfs_slab_alias(...)
    when != sb->s_fs_info // fs/ntfs/super.c
    when != mutex_unlock(&E->fld) // drivers/vme/vme.c
    when != kmem_cache_destroy(E->fld)
    //when != kfree(E->fld) // drivers/usb/mon/mon_bin.c problem double free?
    when != rb_erase(...) // drivers/char/mmtimer.c
    //when != scan_for_bad_eraseblocks() //
    when != drv_proc_node_update_status(E, ...) // drivers/staging/tidspbridge/rmgr/node.c
    when != scan_for_bad_eraseblocks() // drivers/mtd/tests/mtd_speedtest.c
kfree(E);
... when != E = E2

