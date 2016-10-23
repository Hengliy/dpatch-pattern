/// export amba module alias information
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
declarer name module_amba_driver;
identifier fn_init, fn_exit, drv;
@@
(
module_init(fn_init);
|
module_exit(fn_exit);
|
module_amba_driver(drv);
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
 * struct amba_id
 *
 * MODULE_DEVICE_TABLE(amba, matchs)
 */
@amba_ids depends on ismod@
identifier ids;
position p != ok1.p;
@@
struct amba_id ids@p[] = { ... };

@amba_driver@
identifier drv, amba_ids.ids;
@@
struct amba_driver drv = {
  ...,
  .id_table = ids,
  ...,
};

@amba_p1 depends on ismod && amba_driver@
identifier amba_ids.ids;
@@
  struct amba_id ids[] = { ... };
+ MODULE_DEVICE_TABLE(amba, ids);

