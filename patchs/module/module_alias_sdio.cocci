/// export sdio module alias information
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
identifier fn_init, fn_exit, drv;
@@
(
module_init(fn_init);
|
module_exit(fn_exit);
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
 * struct sdio_device_id
 *
 * MODULE_DEVICE_TABLE(sdio, matchs)
 */
@sdio_ids depends on ismod@
identifier ids;
position p != ok1.p;
@@
struct sdio_device_id ids@p[] = { ... };

@sdio_driver@
identifier driver, sdio_ids.ids;
@@
struct sdio_driver driver = {
  ...,
  .id_table = ids,
  ...
};

@sdio_p1 depends on sdio_driver && ismod@
identifier sdio_ids.ids;
@@
  struct of_device_id ids[] = { ... };
+ MODULE_DEVICE_TABLE(sdio, ids);

