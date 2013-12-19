/// remove unused variable in {{function}}
///
/// Except File: sound/soc/codecs/wm8994.c : special case that can not detect correctly
/// Except File: fs/xfs/xfs_buf_item.c : special case that can not detect correctly
/// Except File: drivers/block/floppy.c : special case that can not detect correctly
/// Except File: drivers/video/mx3fb.c : special case that can not detect correctly
/// Except File: drivers/video/omap2/dss/dispc.c : special case that can not detect correctly
/// Except File: drivers/mmc/host/sdhci.c : special case that can not detect correctly
/// Except File: drivers/usb/gadget/f_mass_storage.c : special case that can not detect correctly
/// Except File: drivers/net/ethernet/dec/ewrk3.c : special case that can not detect correctly
/// Except File: drivers/net/irda/smsc-ircc2.c : special case that can not detect correctly
/// Except File: fs/xfs/xfs_dir2_node.c : special case that can not detect correctly
/// Except File: drivers/scsi/qla4xxx/ql4_os.c : special case that can not detect correctly
/// Except File: drivers/staging/speakup/speakup_soft.c : special case that can not detect correctly
/// Except File: drivers/scsi/be2iscsi/be_main.c : special case that can not detect correctly
/// Except File: drivers/staging/rts5208/xd.c : special case that can not detect correctly
///
/// The variable {{variable}} is initialized but never used
/// otherwise, so remove the unused variable.
///
@bad exists@
type T, T1;
identifier i;
expression fn;
position p;
@@

T i@p;
...
(
i = fn(...);
|
i = (T1 *)fn(...);
)

@@
type T;
identifier i;
expression E;
position p != bad.p;
@@

(
extern T i;
|
- T i@p;
  <+... when != i
(
- i = E++;
+ E++;
|
- i = E;
)
...+>
)
