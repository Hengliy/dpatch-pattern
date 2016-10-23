/// export HDA module alias information
/// 
/// Flags: 8
///
/// If the driver is built as a module, autoload won't work because the
/// module alias information is not filled. So user-space can't match the
/// registered device with the corresponding module. Export the module
/// alias information using the MODULE_DEVICE_TABLE().
///

@ismod exists@
declarer name module_init, module_exit;
declarer name module_hda_codec_driver;
identifier fn_init, fn_exit, drv;
@@
(
module_init(fn_init);
|
module_exit(fn_exit);
|
module_hda_codec_driver(drv);
)

@ok1_ids exists@
declarer name MODULE_DEVICE_TABLE;
identifier ids;
@@
MODULE_DEVICE_TABLE(..., ids);

@ok1@
identifier ok1_ids.ids;
type T;
position p;
@@
T ids@p[] = { ... };

/*
 * struct hda_device_id
 *
 * MODULE_DEVICE_TABLE(hdaudio, matchs)
 */
@hda_ids depends on ismod@
identifier ids;
position p != ok1.p;
@@
struct hda_device_id ids@p[] = { ... };

@hda_driver@
identifier drv, hda_ids.ids;
@@
(
struct hda_codec_driver drv = {
  ...,
  .id = ids,
  ...,
};
|
struct hdac_ext_driver drv = {
  ...,
  .hdac = {
    ...,
    .id_table = ids,
    ...,
  },
  ...,
};
)

@hda_p1 depends on ismod && hda_driver@
identifier hda_ids.ids;
@@
  struct hda_device_id ids[] = { ... };
+ MODULE_DEVICE_TABLE(hdaudio, ids);

