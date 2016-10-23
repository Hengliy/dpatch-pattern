/// export I2C module alias information
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
declarer name module_i2c_driver;
identifier fn_init, fn_exit, drv;
@@
(
module_init(fn_init);
|
module_exit(fn_exit);
|
module_i2c_driver(drv);
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
 * struct i2c_device_id
 *
 * MODULE_DEVICE_TABLE(i2c, matchs)
 */
@i2c_ids depends on ismod@
identifier ids;
position p != ok1.p;
@@
struct i2c_device_id ids@p[] = { ... };

@i2c_driver depends on i2c_ids@
identifier drv, i2c_ids.ids;
@@
struct i2c_driver drv = {
  ...,
  .id_table = ids,
  ...,
};

@i2c_p1 depends on ismod && i2c_driver@
identifier i2c_ids.ids;
@@
  struct i2c_device_id ids[] = { ... };
+ MODULE_DEVICE_TABLE(i2c, ids);

