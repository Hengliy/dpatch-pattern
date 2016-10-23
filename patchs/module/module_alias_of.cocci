/// export OF module alias information
/// 
/// If the driver is built as a module, autoload won't work because the
/// module alias information is not filled. So user-space can't match the
/// registered device with the corresponding module. Export the module
/// alias information using the MODULE_DEVICE_TABLE().
///

@ismod exists@
declarer name module_init, module_exit;
declarer name module_platform_driver;
declarer name module_spi_driver;
declarer name module_i2c_driver;
declarer name module_spmi_driver;
declarer name module_qcom_smd_driver;
declarer name module_mipi_dsi_driver;
identifier fn_init, fn_exit, drv;
@@
(
module_init(fn_init);
|
module_exit(fn_exit);
|
module_platform_driver(drv);
|
module_spi_driver(drv);
|
module_i2c_driver(drv);
|
module_spmi_driver(drv);
|
module_qcom_smd_driver(drv);
|
module_mipi_dsi_driver(drv);
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
 * struct of_device_id
 *
 * MODULE_DEVICE_TABLE(of, matchs)
 */
@of_ids@
identifier ids;
position p != ok1.p;
@@
struct of_device_id ids@p[] = { ... };

@of_driver@
identifier drv, of_ids.ids;
identifier driver, fld;
type T;
@@
(
T drv = {
  ...,
  .fld = ids,
  ...
};
|
T drv = {
  ...,
  .driver = {
     ...,
     .fld = ids,
     ...
  },
  ...
};
)

@of_p1 depends on ismod && of_driver@
identifier of_ids.ids;
@@
  struct of_device_id ids[] = { ... };
+ MODULE_DEVICE_TABLE(of, ids);

