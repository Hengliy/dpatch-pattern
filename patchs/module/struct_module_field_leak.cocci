/// add missing {{newfield}} to {{struct}}
///
/// Add missing {{newfield}} of {{struct}}. This prevents the
/// module from being removed from underneath its users.
///
@r1@
declarer name module_init;
identifier fn_init;
@@
module_init(fn_init);

@r2@
declarer name module_exit;
identifier fn_exit;
@@
module_exit(fn_exit);

@r3@
declarer name module_acpi_driver;
declarer name module_comedi_pcmcia_driver;
declarer name module_pci_driver;
declarer name module_usb_driver;
declarer name module_comedi_usb_driver;
declarer name module_platform_driver;
declarer name module_virtio_driver;
declarer name module_amba_driver;
declarer name module_gameport_driver;
declarer name module_platform_driver_probe;
declarer name module_comedi_driver;
declarer name module_hid_driver;
declarer name module_serio_driver;
declarer name module_comedi_pci_driver;
declarer name module_i2c_driver;
declarer name module_spi_driver;
identifier driver;
@@
(
module_acpi_driver(driver);
|
module_comedi_pcmcia_driver(driver);
|
module_pci_driver(driver);
|
module_usb_driver(driver);
|
module_comedi_usb_driver(driver);
|
module_platform_driver(driver);
|
module_virtio_driver(driver);
|
module_amba_driver(driver);
|
module_gameport_driver(driver);
|
module_platform_driver_probe(driver);
|
module_comedi_driver(driver);
|
module_hid_driver(driver);
|
module_serio_driver(driver);
|
module_comedi_pci_driver(driver);
|
module_i2c_driver(driver);
|
module_spi_driver(driver);
)


@r__acpi_driver depends on (r1 && r2) || r3@
identifier nm;
position p;
@@
struct acpi_driver nm@p = {
...,
  .owner = THIS_MODULE,
...
};

@depends on (r1 && r2) || r3@
identifier nm;
position p != {r__acpi_driver.p};
@@
struct acpi_driver nm@p = {
...,
+ .owner = THIS_MODULE,
};

@r__acpiphp_attention_info depends on (r1 && r2) || r3@
identifier nm;
position p;
@@
struct acpiphp_attention_info nm@p = {
...,
  .owner = THIS_MODULE,
...
};

@depends on (r1 && r2) || r3@
identifier nm;
position p != {r__acpiphp_attention_info.p};
@@
struct acpiphp_attention_info nm@p = {
...,
+ .owner = THIS_MODULE,
};

@r__af_alg_type depends on (r1 && r2) || r3@
identifier nm;
position p;
@@
struct af_alg_type nm@p = {
...,
  .owner = THIS_MODULE,
...
};

@depends on (r1 && r2) || r3@
identifier nm;
position p != {r__af_alg_type.p};
@@
struct af_alg_type nm@p = {
...,
+ .owner = THIS_MODULE,
};

@r__agp_bridge_driver depends on (r1 && r2) || r3@
identifier nm;
position p;
@@
struct agp_bridge_driver nm@p = {
...,
  .owner = THIS_MODULE,
...
};

@depends on (r1 && r2) || r3@
identifier nm;
position p != {r__agp_bridge_driver.p};
@@
struct agp_bridge_driver nm@p = {
...,
+ .owner = THIS_MODULE,
};

@r__aoa_fabric depends on (r1 && r2) || r3@
identifier nm;
position p;
@@
struct aoa_fabric nm@p = {
...,
  .owner = THIS_MODULE,
...
};

@depends on (r1 && r2) || r3@
identifier nm;
position p != {r__aoa_fabric.p};
@@
struct aoa_fabric nm@p = {
...,
+ .owner = THIS_MODULE,
};

@r__appldata_ops depends on (r1 && r2) || r3@
identifier nm;
position p;
@@
struct appldata_ops nm@p = {
...,
  .owner = THIS_MODULE,
...
};

@depends on (r1 && r2) || r3@
identifier nm;
position p != {r__appldata_ops.p};
@@
struct appldata_ops nm@p = {
...,
+ .owner = THIS_MODULE,
};

@r__asus_wmi_driver depends on (r1 && r2) || r3@
identifier nm;
position p;
@@
struct asus_wmi_driver nm@p = {
...,
  .owner = THIS_MODULE,
...
};

@depends on (r1 && r2) || r3@
identifier nm;
position p != {r__asus_wmi_driver.p};
@@
struct asus_wmi_driver nm@p = {
...,
+ .owner = THIS_MODULE,
};

@r__asymmetric_key_parser depends on (r1 && r2) || r3@
identifier nm;
position p;
@@
struct asymmetric_key_parser nm@p = {
...,
  .owner = THIS_MODULE,
...
};

@depends on (r1 && r2) || r3@
identifier nm;
position p != {r__asymmetric_key_parser.p};
@@
struct asymmetric_key_parser nm@p = {
...,
+ .owner = THIS_MODULE,
};

@r__asymmetric_key_subtype depends on (r1 && r2) || r3@
identifier nm;
position p;
@@
struct asymmetric_key_subtype nm@p = {
...,
  .owner = THIS_MODULE,
...
};

@depends on (r1 && r2) || r3@
identifier nm;
position p != {r__asymmetric_key_subtype.p};
@@
struct asymmetric_key_subtype nm@p = {
...,
+ .owner = THIS_MODULE,
};

@r__atmdev_ops depends on (r1 && r2) || r3@
identifier nm;
position p;
@@
struct atmdev_ops nm@p = {
...,
  .owner = THIS_MODULE,
...
};

@depends on (r1 && r2) || r3@
identifier nm;
position p != {r__atmdev_ops.p};
@@
struct atmdev_ops nm@p = {
...,
+ .owner = THIS_MODULE,
};

@r__atm_ioctl depends on (r1 && r2) || r3@
identifier nm;
position p;
@@
struct atm_ioctl nm@p = {
...,
  .owner = THIS_MODULE,
...
};

@depends on (r1 && r2) || r3@
identifier nm;
position p != {r__atm_ioctl.p};
@@
struct atm_ioctl nm@p = {
...,
+ .owner = THIS_MODULE,
};

@r__audio_driver depends on (r1 && r2) || r3@
identifier nm;
position p;
@@
struct audio_driver nm@p = {
...,
  .owner = THIS_MODULE,
...
};

@depends on (r1 && r2) || r3@
identifier nm;
position p != {r__audio_driver.p};
@@
struct audio_driver nm@p = {
...,
+ .owner = THIS_MODULE,
};

@r__auth_ops depends on (r1 && r2) || r3@
identifier nm;
position p;
@@
struct auth_ops nm@p = {
...,
  .owner = THIS_MODULE,
...
};

@depends on (r1 && r2) || r3@
identifier nm;
position p != {r__auth_ops.p};
@@
struct auth_ops nm@p = {
...,
+ .owner = THIS_MODULE,
};

@r__block_device_operations depends on (r1 && r2) || r3@
identifier nm;
position p;
@@
struct block_device_operations nm@p = {
...,
  .owner = THIS_MODULE,
...
};

@depends on (r1 && r2) || r3@
identifier nm;
position p != {r__block_device_operations.p};
@@
struct block_device_operations nm@p = {
...,
+ .owner = THIS_MODULE,
};

@r__broadsheet_board depends on (r1 && r2) || r3@
identifier nm;
position p;
@@
struct broadsheet_board nm@p = {
...,
  .owner = THIS_MODULE,
...
};

@depends on (r1 && r2) || r3@
identifier nm;
position p != {r__broadsheet_board.p};
@@
struct broadsheet_board nm@p = {
...,
+ .owner = THIS_MODULE,
};

@r__cache_detail depends on (r1 && r2) || r3@
identifier nm;
position p;
@@
struct cache_detail nm@p = {
...,
  .owner = THIS_MODULE,
...
};

@depends on (r1 && r2) || r3@
identifier nm;
position p != {r__cache_detail.p};
@@
struct cache_detail nm@p = {
...,
+ .owner = THIS_MODULE,
};

@r__ccdc_hw_device depends on (r1 && r2) || r3@
identifier nm;
position p;
@@
struct ccdc_hw_device nm@p = {
...,
  .owner = THIS_MODULE,
...
};

@depends on (r1 && r2) || r3@
identifier nm;
position p != {r__ccdc_hw_device.p};
@@
struct ccdc_hw_device nm@p = {
...,
+ .owner = THIS_MODULE,
};

@r__cgroup_subsys depends on (r1 && r2) || r3@
identifier nm;
position p;
@@
struct cgroup_subsys nm@p = {
...,
  .module = THIS_MODULE,
...
};

@depends on (r1 && r2) || r3@
identifier nm;
position p != {r__cgroup_subsys.p};
@@
struct cgroup_subsys nm@p = {
...,
+ .module = THIS_MODULE,
};

@r__class depends on (r1 && r2) || r3@
identifier nm;
position p;
@@
struct class nm@p = {
...,
  .owner = THIS_MODULE,
...
};

@depends on (r1 && r2) || r3@
identifier nm;
position p != {r__class.p};
@@
struct class nm@p = {
...,
+ .owner = THIS_MODULE,
};

@r__cnic_ops depends on (r1 && r2) || r3@
identifier nm;
position p;
@@
struct cnic_ops nm@p = {
...,
  .cnic_owner = THIS_MODULE,
...
};

@depends on (r1 && r2) || r3@
identifier nm;
position p != {r__cnic_ops.p};
@@
struct cnic_ops nm@p = {
...,
+ .cnic_owner = THIS_MODULE,
};

@r__cnic_ulp_ops depends on (r1 && r2) || r3@
identifier nm;
position p;
@@
struct cnic_ulp_ops nm@p = {
...,
  .owner = THIS_MODULE,
...
};

@depends on (r1 && r2) || r3@
identifier nm;
position p != {r__cnic_ulp_ops.p};
@@
struct cnic_ulp_ops nm@p = {
...,
+ .owner = THIS_MODULE,
};

@r__codec_info depends on (r1 && r2) || r3@
identifier nm;
position p;
@@
struct codec_info nm@p = {
...,
  .owner = THIS_MODULE,
...
};

@depends on (r1 && r2) || r3@
identifier nm;
position p != {r__codec_info.p};
@@
struct codec_info nm@p = {
...,
+ .owner = THIS_MODULE,
};

@r__comedi_driver depends on (r1 && r2) || r3@
identifier nm;
position p;
@@
struct comedi_driver nm@p = {
...,
  .module = THIS_MODULE,
...
};

@depends on (r1 && r2) || r3@
identifier nm;
position p != {r__comedi_driver.p};
@@
struct comedi_driver nm@p = {
...,
+ .module = THIS_MODULE,
};

@r__compressor depends on (r1 && r2) || r3@
identifier nm;
position p;
@@
struct compressor nm@p = {
...,
  .owner = THIS_MODULE,
...
};

@depends on (r1 && r2) || r3@
identifier nm;
position p != {r__compressor.p};
@@
struct compressor nm@p = {
...,
+ .owner = THIS_MODULE,
};

@r__configfs_attribute depends on (r1 && r2) || r3@
identifier nm;
position p;
@@
struct configfs_attribute nm@p = {
...,
  .ca_owner = THIS_MODULE,
...
};

@depends on (r1 && r2) || r3@
identifier nm;
position p != {r__configfs_attribute.p};
@@
struct configfs_attribute nm@p = {
...,
+ .ca_owner = THIS_MODULE,
};

@r__config_item_type depends on (r1 && r2) || r3@
identifier nm;
position p;
@@
struct config_item_type nm@p = {
...,
  .ct_owner = THIS_MODULE,
...
};

@depends on (r1 && r2) || r3@
identifier nm;
position p != {r__config_item_type.p};
@@
struct config_item_type nm@p = {
...,
+ .ct_owner = THIS_MODULE,
};

@r__consw depends on (r1 && r2) || r3@
identifier nm;
position p;
@@
struct consw nm@p = {
...,
  .owner = THIS_MODULE,
...
};

@depends on (r1 && r2) || r3@
identifier nm;
position p != {r__consw.p};
@@
struct consw nm@p = {
...,
+ .owner = THIS_MODULE,
};

@r__cpufreq_driver depends on (r1 && r2) || r3@
identifier nm;
position p;
@@
struct cpufreq_driver nm@p = {
...,
  .owner = THIS_MODULE,
...
};

@depends on (r1 && r2) || r3@
identifier nm;
position p != {r__cpufreq_driver.p};
@@
struct cpufreq_driver nm@p = {
...,
+ .owner = THIS_MODULE,
};

@r__cpufreq_governor depends on (r1 && r2) || r3@
identifier nm;
position p;
@@
struct cpufreq_governor nm@p = {
...,
  .owner = THIS_MODULE,
...
};

@depends on (r1 && r2) || r3@
identifier nm;
position p != {r__cpufreq_governor.p};
@@
struct cpufreq_governor nm@p = {
...,
+ .owner = THIS_MODULE,
};

@r__cpuidle_driver depends on (r1 && r2) || r3@
identifier nm;
position p;
@@
struct cpuidle_driver nm@p = {
...,
  .owner = THIS_MODULE,
...
};

@depends on (r1 && r2) || r3@
identifier nm;
position p != {r__cpuidle_driver.p};
@@
struct cpuidle_driver nm@p = {
...,
+ .owner = THIS_MODULE,
};

@r__cpuidle_governor depends on (r1 && r2) || r3@
identifier nm;
position p;
@@
struct cpuidle_governor nm@p = {
...,
  .owner = THIS_MODULE,
...
};

@depends on (r1 && r2) || r3@
identifier nm;
position p != {r__cpuidle_governor.p};
@@
struct cpuidle_governor nm@p = {
...,
+ .owner = THIS_MODULE,
};

@r__crypto_alg depends on (r1 && r2) || r3@
identifier nm;
position p;
@@
struct crypto_alg nm@p = {
...,
  .cra_module = THIS_MODULE,
...
};

@depends on (r1 && r2) || r3@
identifier nm;
position p != {r__crypto_alg.p};
@@
struct crypto_alg nm@p = {
...,
+ .cra_module = THIS_MODULE,
};

@r__crypto_template depends on (r1 && r2) || r3@
identifier nm;
position p;
@@
struct crypto_template nm@p = {
...,
  .module = THIS_MODULE,
...
};

@depends on (r1 && r2) || r3@
identifier nm;
position p != {r__crypto_template.p};
@@
struct crypto_template nm@p = {
...,
+ .module = THIS_MODULE,
};

@r__dasd_discipline depends on (r1 && r2) || r3@
identifier nm;
position p;
@@
struct dasd_discipline nm@p = {
...,
  .owner = THIS_MODULE,
...
};

@depends on (r1 && r2) || r3@
identifier nm;
position p != {r__dasd_discipline.p};
@@
struct dasd_discipline nm@p = {
...,
+ .owner = THIS_MODULE,
};

@r__device_driver depends on (r1 && r2) || r3@
identifier nm;
position p;
@@
struct device_driver nm@p = {
...,
  .owner = THIS_MODULE,
...
};

@depends on (r1 && r2) || r3@
identifier nm;
position p != {r__device_driver.p};
@@
struct device_driver nm@p = {
...,
+ .owner = THIS_MODULE,
};

@r__dm_cache_policy_type depends on (r1 && r2) || r3@
identifier nm;
position p;
@@
struct dm_cache_policy_type nm@p = {
...,
  .owner = THIS_MODULE,
...
};

@depends on (r1 && r2) || r3@
identifier nm;
position p != {r__dm_cache_policy_type.p};
@@
struct dm_cache_policy_type nm@p = {
...,
+ .owner = THIS_MODULE,
};

@r__dm_dirty_log_type depends on (r1 && r2) || r3@
identifier nm;
position p;
@@
struct dm_dirty_log_type nm@p = {
...,
  .module = THIS_MODULE,
...
};

@depends on (r1 && r2) || r3@
identifier nm;
position p != {r__dm_dirty_log_type.p};
@@
struct dm_dirty_log_type nm@p = {
...,
+ .module = THIS_MODULE,
};

@r__dm_exception_store_type depends on (r1 && r2) || r3@
identifier nm;
position p;
@@
struct dm_exception_store_type nm@p = {
...,
  .module = THIS_MODULE,
...
};

@depends on (r1 && r2) || r3@
identifier nm;
position p != {r__dm_exception_store_type.p};
@@
struct dm_exception_store_type nm@p = {
...,
+ .module = THIS_MODULE,
};

@r__dongle_driver depends on (r1 && r2) || r3@
identifier nm;
position p;
@@
struct dongle_driver nm@p = {
...,
  .owner = THIS_MODULE,
...
};

@depends on (r1 && r2) || r3@
identifier nm;
position p != {r__dongle_driver.p};
@@
struct dongle_driver nm@p = {
...,
+ .owner = THIS_MODULE,
};

@r__eadm_ops depends on (r1 && r2) || r3@
identifier nm;
position p;
@@
struct eadm_ops nm@p = {
...,
  .owner = THIS_MODULE,
...
};

@depends on (r1 && r2) || r3@
identifier nm;
position p != {r__eadm_ops.p};
@@
struct eadm_ops nm@p = {
...,
+ .owner = THIS_MODULE,
};

@r__ebt_table depends on (r1 && r2) || r3@
identifier nm;
position p;
@@
struct ebt_table nm@p = {
...,
  .me = THIS_MODULE,
...
};

@depends on (r1 && r2) || r3@
identifier nm;
position p != {r__ebt_table.p};
@@
struct ebt_table nm@p = {
...,
+ .me = THIS_MODULE,
};

@r__elevator_type depends on (r1 && r2) || r3@
identifier nm;
position p;
@@
struct elevator_type nm@p = {
...,
  .elevator_owner = THIS_MODULE,
...
};

@depends on (r1 && r2) || r3@
identifier nm;
position p != {r__elevator_type.p};
@@
struct elevator_type nm@p = {
...,
+ .elevator_owner = THIS_MODULE,
};

@r__exec_domain depends on (r1 && r2) || r3@
identifier nm;
position p;
@@
struct exec_domain nm@p = {
...,
  .module = THIS_MODULE,
...
};

@depends on (r1 && r2) || r3@
identifier nm;
position p != {r__exec_domain.p};
@@
struct exec_domain nm@p = {
...,
+ .module = THIS_MODULE,
};

@r__fb_ops depends on (r1 && r2) || r3@
identifier nm;
position p;
@@
struct fb_ops nm@p = {
...,
  .owner = THIS_MODULE,
...
};

@depends on (r1 && r2) || r3@
identifier nm;
position p != {r__fb_ops.p};
@@
struct fb_ops nm@p = {
...,
+ .owner = THIS_MODULE,
};

@r__fc4_prov depends on (r1 && r2) || r3@
identifier nm;
position p;
@@
struct fc4_prov nm@p = {
...,
  .module = THIS_MODULE,
...
};

@depends on (r1 && r2) || r3@
identifier nm;
position p != {r__fc4_prov.p};
@@
struct fc4_prov nm@p = {
...,
+ .module = THIS_MODULE,
};

@r__file_operations depends on (r1 && r2) || r3@
identifier nm;
position p;
@@
struct file_operations nm@p = {
...,
  .owner = THIS_MODULE,
...
};

@depends on (r1 && r2) || r3@
identifier nm;
position p != {r__file_operations.p};
@@
struct file_operations nm@p = {
...,
+ .owner = THIS_MODULE,
};

@r__file_system_type depends on (r1 && r2) || r3@
identifier nm;
position p;
@@
struct file_system_type nm@p = {
...,
  .owner = THIS_MODULE,
...
};

@depends on (r1 && r2) || r3@
identifier nm;
position p != {r__file_system_type.p};
@@
struct file_system_type nm@p = {
...,
+ .owner = THIS_MODULE,
};

@r__fmc_device depends on (r1 && r2) || r3@
identifier nm;
position p;
@@
struct fmc_device nm@p = {
...,
  .owner = THIS_MODULE,
...
};

@depends on (r1 && r2) || r3@
identifier nm;
position p != {r__fmc_device.p};
@@
struct fmc_device nm@p = {
...,
+ .owner = THIS_MODULE,
};

@r__fsfilt_operations depends on (r1 && r2) || r3@
identifier nm;
position p;
@@
struct fsfilt_operations nm@p = {
...,
  .fs_owner = THIS_MODULE,
...
};

@depends on (r1 && r2) || r3@
identifier nm;
position p != {r__fsfilt_operations.p};
@@
struct fsfilt_operations nm@p = {
...,
+ .fs_owner = THIS_MODULE,
};

@r__gpio_chip depends on (r1 && r2) || r3@
identifier nm;
position p;
@@
struct gpio_chip nm@p = {
...,
  .owner = THIS_MODULE,
...
};

@depends on (r1 && r2) || r3@
identifier nm;
position p != {r__gpio_chip.p};
@@
struct gpio_chip nm@p = {
...,
+ .owner = THIS_MODULE,
};

@r__gss_api_mech depends on (r1 && r2) || r3@
identifier nm;
position p;
@@
struct gss_api_mech nm@p = {
...,
  .gm_owner = THIS_MODULE,
...
};

@depends on (r1 && r2) || r3@
identifier nm;
position p != {r__gss_api_mech.p};
@@
struct gss_api_mech nm@p = {
...,
+ .gm_owner = THIS_MODULE,
};

@r__hda_codec_preset_list depends on (r1 && r2) || r3@
identifier nm;
position p;
@@
struct hda_codec_preset_list nm@p = {
...,
  .owner = THIS_MODULE,
...
};

@depends on (r1 && r2) || r3@
identifier nm;
position p != {r__hda_codec_preset_list.p};
@@
struct hda_codec_preset_list nm@p = {
...,
+ .owner = THIS_MODULE,
};

@r__hdlc_proto depends on (r1 && r2) || r3@
identifier nm;
position p;
@@
struct hdlc_proto nm@p = {
...,
  .module = THIS_MODULE,
...
};

@depends on (r1 && r2) || r3@
identifier nm;
position p != {r__hdlc_proto.p};
@@
struct hdlc_proto nm@p = {
...,
+ .module = THIS_MODULE,
};

@r__hecuba_board depends on (r1 && r2) || r3@
identifier nm;
position p;
@@
struct hecuba_board nm@p = {
...,
  .owner = THIS_MODULE,
...
};

@depends on (r1 && r2) || r3@
identifier nm;
position p != {r__hecuba_board.p};
@@
struct hecuba_board nm@p = {
...,
+ .owner = THIS_MODULE,
};

@r__hotplug_slot_ops depends on (r1 && r2) || r3@
identifier nm;
position p;
@@
struct hotplug_slot_ops nm@p = {
...,
  .owner = THIS_MODULE,
...
};

@depends on (r1 && r2) || r3@
identifier nm;
position p != {r__hotplug_slot_ops.p};
@@
struct hotplug_slot_ops nm@p = {
...,
+ .owner = THIS_MODULE,
};

@r__i2c_adapter depends on (r1 && r2) || r3@
identifier nm;
position p;
@@
struct i2c_adapter nm@p = {
...,
  .owner = THIS_MODULE,
...
};

@depends on (r1 && r2) || r3@
identifier nm;
position p != {r__i2c_adapter.p};
@@
struct i2c_adapter nm@p = {
...,
+ .owner = THIS_MODULE,
};

@r__ieee80211_crypto_ops depends on (r1 && r2) || r3@
identifier nm;
position p;
@@
struct ieee80211_crypto_ops nm@p = {
...,
  .owner = THIS_MODULE,
...
};

@depends on (r1 && r2) || r3@
identifier nm;
position p != {r__ieee80211_crypto_ops.p};
@@
struct ieee80211_crypto_ops nm@p = {
...,
+ .owner = THIS_MODULE,
};

@r__ieee802154_ops depends on (r1 && r2) || r3@
identifier nm;
position p;
@@
struct ieee802154_ops nm@p = {
...,
  .owner = THIS_MODULE,
...
};

@depends on (r1 && r2) || r3@
identifier nm;
position p != {r__ieee802154_ops.p};
@@
struct ieee802154_ops nm@p = {
...,
+ .owner = THIS_MODULE,
};

@r__iio_info depends on (r1 && r2) || r3@
identifier nm;
position p;
@@
struct iio_info nm@p = {
...,
  .driver_module = THIS_MODULE,
...
};

@depends on (r1 && r2) || r3@
identifier nm;
position p != {r__iio_info.p};
@@
struct iio_info nm@p = {
...,
+ .driver_module = THIS_MODULE,
};

@r__iio_trigger_ops depends on (r1 && r2) || r3@
identifier nm;
position p;
@@
struct iio_trigger_ops nm@p = {
...,
  .owner = THIS_MODULE,
...
};

@depends on (r1 && r2) || r3@
identifier nm;
position p != {r__iio_trigger_ops.p};
@@
struct iio_trigger_ops nm@p = {
...,
+ .owner = THIS_MODULE,
};

@r__ioc3_submodule depends on (r1 && r2) || r3@
identifier nm;
position p;
@@
struct ioc3_submodule nm@p = {
...,
  .owner = THIS_MODULE,
...
};

@depends on (r1 && r2) || r3@
identifier nm;
position p != {r__ioc3_submodule.p};
@@
struct ioc3_submodule nm@p = {
...,
+ .owner = THIS_MODULE,
};

@r__ioc4_submodule depends on (r1 && r2) || r3@
identifier nm;
position p;
@@
struct ioc4_submodule nm@p = {
...,
  .is_owner = THIS_MODULE,
...
};

@depends on (r1 && r2) || r3@
identifier nm;
position p != {r__ioc4_submodule.p};
@@
struct ioc4_submodule nm@p = {
...,
+ .is_owner = THIS_MODULE,
};

@r__ipmi_smi_handlers depends on (r1 && r2) || r3@
identifier nm;
position p;
@@
struct ipmi_smi_handlers nm@p = {
...,
  .owner = THIS_MODULE,
...
};

@depends on (r1 && r2) || r3@
identifier nm;
position p != {r__ipmi_smi_handlers.p};
@@
struct ipmi_smi_handlers nm@p = {
...,
+ .owner = THIS_MODULE,
};

@r__ipmi_smi_watcher depends on (r1 && r2) || r3@
identifier nm;
position p;
@@
struct ipmi_smi_watcher nm@p = {
...,
  .owner = THIS_MODULE,
...
};

@depends on (r1 && r2) || r3@
identifier nm;
position p != {r__ipmi_smi_watcher.p};
@@
struct ipmi_smi_watcher nm@p = {
...,
+ .owner = THIS_MODULE,
};

@r__ip_set_type depends on (r1 && r2) || r3@
identifier nm;
position p;
@@
struct ip_set_type nm@p = {
...,
  .me = THIS_MODULE,
...
};

@depends on (r1 && r2) || r3@
identifier nm;
position p != {r__ip_set_type.p};
@@
struct ip_set_type nm@p = {
...,
+ .me = THIS_MODULE,
};

@r__ip_vs_app depends on (r1 && r2) || r3@
identifier nm;
position p;
@@
struct ip_vs_app nm@p = {
...,
  .module = THIS_MODULE,
...
};

@depends on (r1 && r2) || r3@
identifier nm;
position p != {r__ip_vs_app.p};
@@
struct ip_vs_app nm@p = {
...,
+ .module = THIS_MODULE,
};

@r__ip_vs_pe depends on (r1 && r2) || r3@
identifier nm;
position p;
@@
struct ip_vs_pe nm@p = {
...,
  .module = THIS_MODULE,
...
};

@depends on (r1 && r2) || r3@
identifier nm;
position p != {r__ip_vs_pe.p};
@@
struct ip_vs_pe nm@p = {
...,
+ .module = THIS_MODULE,
};

@r__ip_vs_scheduler depends on (r1 && r2) || r3@
identifier nm;
position p;
@@
struct ip_vs_scheduler nm@p = {
...,
  .module = THIS_MODULE,
...
};

@depends on (r1 && r2) || r3@
identifier nm;
position p != {r__ip_vs_scheduler.p};
@@
struct ip_vs_scheduler nm@p = {
...,
+ .module = THIS_MODULE,
};

@r__iscsi_transport depends on (r1 && r2) || r3@
identifier nm;
position p;
@@
struct iscsi_transport nm@p = {
...,
  .owner = THIS_MODULE,
...
};

@depends on (r1 && r2) || r3@
identifier nm;
position p != {r__iscsi_transport.p};
@@
struct iscsi_transport nm@p = {
...,
+ .owner = THIS_MODULE,
};

@r__iscsit_transport depends on (r1 && r2) || r3@
identifier nm;
position p;
@@
struct iscsit_transport nm@p = {
...,
  .owner = THIS_MODULE,
...
};

@depends on (r1 && r2) || r3@
identifier nm;
position p != {r__iscsit_transport.p};
@@
struct iscsit_transport nm@p = {
...,
+ .owner = THIS_MODULE,
};

@r__isdn_ppp_compressor depends on (r1 && r2) || r3@
identifier nm;
position p;
@@
struct isdn_ppp_compressor nm@p = {
...,
  .owner = THIS_MODULE,
...
};

@depends on (r1 && r2) || r3@
identifier nm;
position p != {r__isdn_ppp_compressor.p};
@@
struct isdn_ppp_compressor nm@p = {
...,
+ .owner = THIS_MODULE,
};

@r__kvm_vmm_info depends on (r1 && r2) || r3@
identifier nm;
position p;
@@
struct kvm_vmm_info nm@p = {
...,
  .module = THIS_MODULE,
...
};

@depends on (r1 && r2) || r3@
identifier nm;
position p != {r__kvm_vmm_info.p};
@@
struct kvm_vmm_info nm@p = {
...,
+ .module = THIS_MODULE,
};

@r__lib80211_crypto_ops depends on (r1 && r2) || r3@
identifier nm;
position p;
@@
struct lib80211_crypto_ops nm@p = {
...,
  .owner = THIS_MODULE,
...
};

@depends on (r1 && r2) || r3@
identifier nm;
position p != {r__lib80211_crypto_ops.p};
@@
struct lib80211_crypto_ops nm@p = {
...,
+ .owner = THIS_MODULE,
};

@r__linux_binfmt depends on (r1 && r2) || r3@
identifier nm;
position p;
@@
struct linux_binfmt nm@p = {
...,
  .module = THIS_MODULE,
...
};

@depends on (r1 && r2) || r3@
identifier nm;
position p != {r__linux_binfmt.p};
@@
struct linux_binfmt nm@p = {
...,
+ .module = THIS_MODULE,
};

@r__lirc_driver depends on (r1 && r2) || r3@
identifier nm;
position p;
@@
struct lirc_driver nm@p = {
...,
  .owner = THIS_MODULE,
...
};

@depends on (r1 && r2) || r3@
identifier nm;
position p != {r__lirc_driver.p};
@@
struct lirc_driver nm@p = {
...,
+ .owner = THIS_MODULE,
};

@r__loop_func_table depends on (r1 && r2) || r3@
identifier nm;
position p;
@@
struct loop_func_table nm@p = {
...,
  .owner = THIS_MODULE,
...
};

@depends on (r1 && r2) || r3@
identifier nm;
position p != {r__loop_func_table.p};
@@
struct loop_func_table nm@p = {
...,
+ .owner = THIS_MODULE,
};

@r__mdiobb_ops depends on (r1 && r2) || r3@
identifier nm;
position p;
@@
struct mdiobb_ops nm@p = {
...,
  .owner = THIS_MODULE,
...
};

@depends on (r1 && r2) || r3@
identifier nm;
position p != {r__mdiobb_ops.p};
@@
struct mdiobb_ops nm@p = {
...,
+ .owner = THIS_MODULE,
};

@r__md_personality depends on (r1 && r2) || r3@
identifier nm;
position p;
@@
struct md_personality nm@p = {
...,
  .owner = THIS_MODULE,
...
};

@depends on (r1 && r2) || r3@
identifier nm;
position p != {r__md_personality.p};
@@
struct md_personality nm@p = {
...,
+ .owner = THIS_MODULE,
};

@r__media_file_operations depends on (r1 && r2) || r3@
identifier nm;
position p;
@@
struct media_file_operations nm@p = {
...,
  .owner = THIS_MODULE,
...
};

@depends on (r1 && r2) || r3@
identifier nm;
position p != {r__media_file_operations.p};
@@
struct media_file_operations nm@p = {
...,
+ .owner = THIS_MODULE,
};

@r__metronome_board depends on (r1 && r2) || r3@
identifier nm;
position p;
@@
struct metronome_board nm@p = {
...,
  .owner = THIS_MODULE,
...
};

@depends on (r1 && r2) || r3@
identifier nm;
position p != {r__metronome_board.p};
@@
struct metronome_board nm@p = {
...,
+ .owner = THIS_MODULE,
};

@r__midi_operations depends on (r1 && r2) || r3@
identifier nm;
position p;
@@
struct midi_operations nm@p = {
...,
  .owner = THIS_MODULE,
...
};

@depends on (r1 && r2) || r3@
identifier nm;
position p != {r__midi_operations.p};
@@
struct midi_operations nm@p = {
...,
+ .owner = THIS_MODULE,
};

@r__mixer_operations depends on (r1 && r2) || r3@
identifier nm;
position p;
@@
struct mixer_operations nm@p = {
...,
  .owner = THIS_MODULE,
...
};

@depends on (r1 && r2) || r3@
identifier nm;
position p != {r__mixer_operations.p};
@@
struct mixer_operations nm@p = {
...,
+ .owner = THIS_MODULE,
};

@r__mtd_blktrans_ops depends on (r1 && r2) || r3@
identifier nm;
position p;
@@
struct mtd_blktrans_ops nm@p = {
...,
  .owner = THIS_MODULE,
...
};

@depends on (r1 && r2) || r3@
identifier nm;
position p != {r__mtd_blktrans_ops.p};
@@
struct mtd_blktrans_ops nm@p = {
...,
+ .owner = THIS_MODULE,
};

@r__mtd_chip_driver depends on (r1 && r2) || r3@
identifier nm;
position p;
@@
struct mtd_chip_driver nm@p = {
...,
  .module = THIS_MODULE,
...
};

@depends on (r1 && r2) || r3@
identifier nm;
position p != {r__mtd_chip_driver.p};
@@
struct mtd_chip_driver nm@p = {
...,
+ .module = THIS_MODULE,
};

@r__mtd_part_parser depends on (r1 && r2) || r3@
identifier nm;
position p;
@@
struct mtd_part_parser nm@p = {
...,
  .owner = THIS_MODULE,
...
};

@depends on (r1 && r2) || r3@
identifier nm;
position p != {r__mtd_part_parser.p};
@@
struct mtd_part_parser nm@p = {
...,
+ .owner = THIS_MODULE,
};

@r__netlink_tap depends on (r1 && r2) || r3@
identifier nm;
position p;
@@
struct netlink_tap nm@p = {
...,
  .module = THIS_MODULE,
...
};

@depends on (r1 && r2) || r3@
identifier nm;
position p != {r__netlink_tap.p};
@@
struct netlink_tap nm@p = {
...,
+ .module = THIS_MODULE,
};

@r__net_proto_family depends on (r1 && r2) || r3@
identifier nm;
position p;
@@
struct net_proto_family nm@p = {
...,
  .owner = THIS_MODULE,
...
};

@depends on (r1 && r2) || r3@
identifier nm;
position p != {r__net_proto_family.p};
@@
struct net_proto_family nm@p = {
...,
+ .owner = THIS_MODULE,
};

@r__nf_conntrack_helper depends on (r1 && r2) || r3@
identifier nm;
position p;
@@
struct nf_conntrack_helper nm@p = {
...,
  .me = THIS_MODULE,
...
};

@depends on (r1 && r2) || r3@
identifier nm;
position p != {r__nf_conntrack_helper.p};
@@
struct nf_conntrack_helper nm@p = {
...,
+ .me = THIS_MODULE,
};

@r__nf_conntrack_l3proto depends on (r1 && r2) || r3@
identifier nm;
position p;
@@
struct nf_conntrack_l3proto nm@p = {
...,
  .me = THIS_MODULE,
...
};

@depends on (r1 && r2) || r3@
identifier nm;
position p != {r__nf_conntrack_l3proto.p};
@@
struct nf_conntrack_l3proto nm@p = {
...,
+ .me = THIS_MODULE,
};

@r__nf_conntrack_l4proto depends on (r1 && r2) || r3@
identifier nm;
position p;
@@
struct nf_conntrack_l4proto nm@p = {
...,
  .me = THIS_MODULE,
...
};

@depends on (r1 && r2) || r3@
identifier nm;
position p != {r__nf_conntrack_l4proto.p};
@@
struct nf_conntrack_l4proto nm@p = {
...,
+ .me = THIS_MODULE,
};

@r__nfc_protocol depends on (r1 && r2) || r3@
identifier nm;
position p;
@@
struct nfc_protocol nm@p = {
...,
  .owner = THIS_MODULE,
...
};

@depends on (r1 && r2) || r3@
identifier nm;
position p != {r__nfc_protocol.p};
@@
struct nfc_protocol nm@p = {
...,
+ .owner = THIS_MODULE,
};

@r__nf_logger depends on (r1 && r2) || r3@
identifier nm;
position p;
@@
struct nf_logger nm@p = {
...,
  .me = THIS_MODULE,
...
};

@depends on (r1 && r2) || r3@
identifier nm;
position p != {r__nf_logger.p};
@@
struct nf_logger nm@p = {
...,
+ .me = THIS_MODULE,
};

@r__nf_sockopt_ops depends on (r1 && r2) || r3@
identifier nm;
position p;
@@
struct nf_sockopt_ops nm@p = {
...,
  .owner = THIS_MODULE,
...
};

@depends on (r1 && r2) || r3@
identifier nm;
position p != {r__nf_sockopt_ops.p};
@@
struct nf_sockopt_ops nm@p = {
...,
+ .owner = THIS_MODULE,
};

@r__nfs_subversion depends on (r1 && r2) || r3@
identifier nm;
position p;
@@
struct nfs_subversion nm@p = {
...,
  .owner = THIS_MODULE,
...
};

@depends on (r1 && r2) || r3@
identifier nm;
position p != {r__nfs_subversion.p};
@@
struct nfs_subversion nm@p = {
...,
+ .owner = THIS_MODULE,
};

@r__nls_table depends on (r1 && r2) || r3@
identifier nm;
position p;
@@
struct nls_table nm@p = {
...,
  .owner = THIS_MODULE,
...
};

@depends on (r1 && r2) || r3@
identifier nm;
position p != {r__nls_table.p};
@@
struct nls_table nm@p = {
...,
+ .owner = THIS_MODULE,
};

@r__nsc_gpio_ops depends on (r1 && r2) || r3@
identifier nm;
position p;
@@
struct nsc_gpio_ops nm@p = {
...,
  .owner = THIS_MODULE,
...
};

@depends on (r1 && r2) || r3@
identifier nm;
position p != {r__nsc_gpio_ops.p};
@@
struct nsc_gpio_ops nm@p = {
...,
+ .owner = THIS_MODULE,
};

@r__obd_ops depends on (r1 && r2) || r3@
identifier nm;
position p;
@@
struct obd_ops nm@p = {
...,
  .o_owner = THIS_MODULE,
...
};

@depends on (r1 && r2) || r3@
identifier nm;
position p != {r__obd_ops.p};
@@
struct obd_ops nm@p = {
...,
+ .o_owner = THIS_MODULE,
};

@r__ocfs2_stack_plugin depends on (r1 && r2) || r3@
identifier nm;
position p;
@@
struct ocfs2_stack_plugin nm@p = {
...,
  .sp_owner = THIS_MODULE,
...
};

@depends on (r1 && r2) || r3@
identifier nm;
position p != {r__ocfs2_stack_plugin.p};
@@
struct ocfs2_stack_plugin nm@p = {
...,
+ .sp_owner = THIS_MODULE,
};

@r__p9_trans_module depends on (r1 && r2) || r3@
identifier nm;
position p;
@@
struct p9_trans_module nm@p = {
...,
  .owner = THIS_MODULE,
...
};

@depends on (r1 && r2) || r3@
identifier nm;
position p != {r__p9_trans_module.p};
@@
struct p9_trans_module nm@p = {
...,
+ .owner = THIS_MODULE,
};

@r__parport_operations depends on (r1 && r2) || r3@
identifier nm;
position p;
@@
struct parport_operations nm@p = {
...,
  .owner = THIS_MODULE,
...
};

@depends on (r1 && r2) || r3@
identifier nm;
position p != {r__parport_operations.p};
@@
struct parport_operations nm@p = {
...,
+ .owner = THIS_MODULE,
};

@r__path_selector_type depends on (r1 && r2) || r3@
identifier nm;
position p;
@@
struct path_selector_type nm@p = {
...,
  .module = THIS_MODULE,
...
};

@depends on (r1 && r2) || r3@
identifier nm;
position p != {r__path_selector_type.p};
@@
struct path_selector_type nm@p = {
...,
+ .module = THIS_MODULE,
};

@r__pcmcia_callback depends on (r1 && r2) || r3@
identifier nm;
position p;
@@
struct pcmcia_callback nm@p = {
...,
  .owner = THIS_MODULE,
...
};

@depends on (r1 && r2) || r3@
identifier nm;
position p != {r__pcmcia_callback.p};
@@
struct pcmcia_callback nm@p = {
...,
+ .owner = THIS_MODULE,
};

@r__pcmcia_driver depends on (r1 && r2) || r3@
identifier nm;
position p;
@@
struct pcmcia_driver nm@p = {
...,
  .owner = THIS_MODULE,
...
};

@depends on (r1 && r2) || r3@
identifier nm;
position p != {r__pcmcia_driver.p};
@@
struct pcmcia_driver nm@p = {
...,
+ .owner = THIS_MODULE,
};

@r__pcmcia_low_level depends on (r1 && r2) || r3@
identifier nm;
position p;
@@
struct pcmcia_low_level nm@p = {
...,
  .owner = THIS_MODULE,
...
};

@depends on (r1 && r2) || r3@
identifier nm;
position p != {r__pcmcia_low_level.p};
@@
struct pcmcia_low_level nm@p = {
...,
+ .owner = THIS_MODULE,
};

@r__pinctrl_desc depends on (r1 && r2) || r3@
identifier nm;
position p;
@@
struct pinctrl_desc nm@p = {
...,
  .owner = THIS_MODULE,
...
};

@depends on (r1 && r2) || r3@
identifier nm;
position p != {r__pinctrl_desc.p};
@@
struct pinctrl_desc nm@p = {
...,
+ .owner = THIS_MODULE,
};

@r__pi_protocol depends on (r1 && r2) || r3@
identifier nm;
position p;
@@
struct pi_protocol nm@p = {
...,
  .owner = THIS_MODULE,
...
};

@depends on (r1 && r2) || r3@
identifier nm;
position p != {r__pi_protocol.p};
@@
struct pi_protocol nm@p = {
...,
+ .owner = THIS_MODULE,
};

@r__pmf_irq_client depends on (r1 && r2) || r3@
identifier nm;
position p;
@@
struct pmf_irq_client nm@p = {
...,
  .owner = THIS_MODULE,
...
};

@depends on (r1 && r2) || r3@
identifier nm;
position p != {r__pmf_irq_client.p};
@@
struct pmf_irq_client nm@p = {
...,
+ .owner = THIS_MODULE,
};

@r__pnfs_layoutdriver_type depends on (r1 && r2) || r3@
identifier nm;
position p;
@@
struct pnfs_layoutdriver_type nm@p = {
...,
  .owner = THIS_MODULE,
...
};

@depends on (r1 && r2) || r3@
identifier nm;
position p != {r__pnfs_layoutdriver_type.p};
@@
struct pnfs_layoutdriver_type nm@p = {
...,
+ .owner = THIS_MODULE,
};

@r__posix_clock_operations depends on (r1 && r2) || r3@
identifier nm;
position p;
@@
struct posix_clock_operations nm@p = {
...,
  .owner = THIS_MODULE,
...
};

@depends on (r1 && r2) || r3@
identifier nm;
position p != {r__posix_clock_operations.p};
@@
struct posix_clock_operations nm@p = {
...,
+ .owner = THIS_MODULE,
};

@r__pppox_proto depends on (r1 && r2) || r3@
identifier nm;
position p;
@@
struct pppox_proto nm@p = {
...,
  .owner = THIS_MODULE,
...
};

@depends on (r1 && r2) || r3@
identifier nm;
position p != {r__pppox_proto.p};
@@
struct pppox_proto nm@p = {
...,
+ .owner = THIS_MODULE,
};

@r__pps_source_info depends on (r1 && r2) || r3@
identifier nm;
position p;
@@
struct pps_source_info nm@p = {
...,
  .owner = THIS_MODULE,
...
};

@depends on (r1 && r2) || r3@
identifier nm;
position p != {r__pps_source_info.p};
@@
struct pps_source_info nm@p = {
...,
+ .owner = THIS_MODULE,
};

@r__proto_ops depends on (r1 && r2) || r3@
identifier nm;
position p;
@@
struct proto_ops nm@p = {
...,
  .owner = THIS_MODULE,
...
};

@depends on (r1 && r2) || r3@
identifier nm;
position p != {r__proto_ops.p};
@@
struct proto_ops nm@p = {
...,
+ .owner = THIS_MODULE,
};

@r__proto depends on (r1 && r2) || r3@
identifier nm;
position p;
@@
struct proto nm@p = {
...,
  .owner = THIS_MODULE,
...
};

@depends on (r1 && r2) || r3@
identifier nm;
position p != {r__proto.p};
@@
struct proto nm@p = {
...,
+ .owner = THIS_MODULE,
};

@r__pstore_info depends on (r1 && r2) || r3@
identifier nm;
position p;
@@
struct pstore_info nm@p = {
...,
  .owner = THIS_MODULE,
...
};

@depends on (r1 && r2) || r3@
identifier nm;
position p != {r__pstore_info.p};
@@
struct pstore_info nm@p = {
...,
+ .owner = THIS_MODULE,
};

@r__ptlrpc_sec_policy depends on (r1 && r2) || r3@
identifier nm;
position p;
@@
struct ptlrpc_sec_policy nm@p = {
...,
  .sp_owner = THIS_MODULE,
...
};

@depends on (r1 && r2) || r3@
identifier nm;
position p != {r__ptlrpc_sec_policy.p};
@@
struct ptlrpc_sec_policy nm@p = {
...,
+ .sp_owner = THIS_MODULE,
};

@r__ptp_clock_info depends on (r1 && r2) || r3@
identifier nm;
position p;
@@
struct ptp_clock_info nm@p = {
...,
  .owner = THIS_MODULE,
...
};

@depends on (r1 && r2) || r3@
identifier nm;
position p != {r__ptp_clock_info.p};
@@
struct ptp_clock_info nm@p = {
...,
+ .owner = THIS_MODULE,
};

@r__pwm_ops depends on (r1 && r2) || r3@
identifier nm;
position p;
@@
struct pwm_ops nm@p = {
...,
  .owner = THIS_MODULE,
...
};

@depends on (r1 && r2) || r3@
identifier nm;
position p != {r__pwm_ops.p};
@@
struct pwm_ops nm@p = {
...,
+ .owner = THIS_MODULE,
};

@r__Qdisc_ops depends on (r1 && r2) || r3@
identifier nm;
position p;
@@
struct Qdisc_ops nm@p = {
...,
  .owner = THIS_MODULE,
...
};

@depends on (r1 && r2) || r3@
identifier nm;
position p != {r__Qdisc_ops.p};
@@
struct Qdisc_ops nm@p = {
...,
+ .owner = THIS_MODULE,
};

@r__quota_format_type depends on (r1 && r2) || r3@
identifier nm;
position p;
@@
struct quota_format_type nm@p = {
...,
  .qf_owner = THIS_MODULE,
...
};

@depends on (r1 && r2) || r3@
identifier nm;
position p != {r__quota_format_type.p};
@@
struct quota_format_type nm@p = {
...,
+ .qf_owner = THIS_MODULE,
};

@r__rds_transport depends on (r1 && r2) || r3@
identifier nm;
position p;
@@
struct rds_transport nm@p = {
...,
  .t_owner = THIS_MODULE,
...
};

@depends on (r1 && r2) || r3@
identifier nm;
position p != {r__rds_transport.p};
@@
struct rds_transport nm@p = {
...,
+ .t_owner = THIS_MODULE,
};

@r__regulator_desc depends on (r1 && r2) || r3@
identifier nm;
position p;
@@
struct regulator_desc nm@p = {
...,
  .owner = THIS_MODULE,
...
};

@depends on (r1 && r2) || r3@
identifier nm;
position p != {r__regulator_desc.p};
@@
struct regulator_desc nm@p = {
...,
+ .owner = THIS_MODULE,
};

@r__rpc_authops depends on (r1 && r2) || r3@
identifier nm;
position p;
@@
struct rpc_authops nm@p = {
...,
  .owner = THIS_MODULE,
...
};

@depends on (r1 && r2) || r3@
identifier nm;
position p != {r__rpc_authops.p};
@@
struct rpc_authops nm@p = {
...,
+ .owner = THIS_MODULE,
};

@r__rt2x00debug depends on (r1 && r2) || r3@
identifier nm;
position p;
@@
struct rt2x00debug nm@p = {
...,
  .owner = THIS_MODULE,
...
};

@depends on (r1 && r2) || r3@
identifier nm;
position p != {r__rt2x00debug.p};
@@
struct rt2x00debug nm@p = {
...,
+ .owner = THIS_MODULE,
};

@r__rxrpc_security depends on (r1 && r2) || r3@
identifier nm;
position p;
@@
struct rxrpc_security nm@p = {
...,
  .owner = THIS_MODULE,
...
};

@depends on (r1 && r2) || r3@
identifier nm;
position p != {r__rxrpc_security.p};
@@
struct rxrpc_security nm@p = {
...,
+ .owner = THIS_MODULE,
};

@r__saa7146_extension depends on (r1 && r2) || r3@
identifier nm;
position p;
@@
struct saa7146_extension nm@p = {
...,
  .module = THIS_MODULE,
...
};

@depends on (r1 && r2) || r3@
identifier nm;
position p != {r__saa7146_extension.p};
@@
struct saa7146_extension nm@p = {
...,
+ .module = THIS_MODULE,
};

@r__scsi_device_handler depends on (r1 && r2) || r3@
identifier nm;
position p;
@@
struct scsi_device_handler nm@p = {
...,
  .module = THIS_MODULE,
...
};

@depends on (r1 && r2) || r3@
identifier nm;
position p != {r__scsi_device_handler.p};
@@
struct scsi_device_handler nm@p = {
...,
+ .module = THIS_MODULE,
};

@r__scsi_driver depends on (r1 && r2) || r3@
identifier nm;
position p;
@@
struct scsi_driver nm@p = {
...,
  .owner = THIS_MODULE,
...
};

@depends on (r1 && r2) || r3@
identifier nm;
position p != {r__scsi_driver.p};
@@
struct scsi_driver nm@p = {
...,
+ .owner = THIS_MODULE,
};

@r__scsi_host_template depends on (r1 && r2) || r3@
identifier nm;
position p;
@@
struct scsi_host_template nm@p = {
...,
  .module = THIS_MODULE,
...
};

@depends on (r1 && r2) || r3@
identifier nm;
position p != {r__scsi_host_template.p};
@@
struct scsi_host_template nm@p = {
...,
+ .module = THIS_MODULE,
};

@r__se_subsystem_api depends on (r1 && r2) || r3@
identifier nm;
position p;
@@
struct se_subsystem_api nm@p = {
...,
  .owner = THIS_MODULE,
...
};

@depends on (r1 && r2) || r3@
identifier nm;
position p != {r__se_subsystem_api.p};
@@
struct se_subsystem_api nm@p = {
...,
+ .owner = THIS_MODULE,
};

@r__sir_driver depends on (r1 && r2) || r3@
identifier nm;
position p;
@@
struct sir_driver nm@p = {
...,
  .owner = THIS_MODULE,
...
};

@depends on (r1 && r2) || r3@
identifier nm;
position p != {r__sir_driver.p};
@@
struct sir_driver nm@p = {
...,
+ .owner = THIS_MODULE,
};

@r__snd_emux_operators depends on (r1 && r2) || r3@
identifier nm;
position p;
@@
struct snd_emux_operators nm@p = {
...,
  .owner = THIS_MODULE,
...
};

@depends on (r1 && r2) || r3@
identifier nm;
position p != {r__snd_emux_operators.p};
@@
struct snd_emux_operators nm@p = {
...,
+ .owner = THIS_MODULE,
};

@r__snd_seq_oss_callback depends on (r1 && r2) || r3@
identifier nm;
position p;
@@
struct snd_seq_oss_callback nm@p = {
...,
  .owner = THIS_MODULE,
...
};

@depends on (r1 && r2) || r3@
identifier nm;
position p != {r__snd_seq_oss_callback.p};
@@
struct snd_seq_oss_callback nm@p = {
...,
+ .owner = THIS_MODULE,
};

@r__soc_camera_host_ops depends on (r1 && r2) || r3@
identifier nm;
position p;
@@
struct soc_camera_host_ops nm@p = {
...,
  .owner = THIS_MODULE,
...
};

@depends on (r1 && r2) || r3@
identifier nm;
position p != {r__soc_camera_host_ops.p};
@@
struct soc_camera_host_ops nm@p = {
...,
+ .owner = THIS_MODULE,
};

@r__soundbus_driver depends on (r1 && r2) || r3@
identifier nm;
position p;
@@
struct soundbus_driver nm@p = {
...,
  .owner = THIS_MODULE,
...
};

@depends on (r1 && r2) || r3@
identifier nm;
position p != {r__soundbus_driver.p};
@@
struct soundbus_driver nm@p = {
...,
+ .owner = THIS_MODULE,
};

@r__sound_timer_operations depends on (r1 && r2) || r3@
identifier nm;
position p;
@@
struct sound_timer_operations nm@p = {
...,
  .owner = THIS_MODULE,
...
};

@depends on (r1 && r2) || r3@
identifier nm;
position p != {r__sound_timer_operations.p};
@@
struct sound_timer_operations nm@p = {
...,
+ .owner = THIS_MODULE,
};

@r__spufs_calls depends on (r1 && r2) || r3@
identifier nm;
position p;
@@
struct spufs_calls nm@p = {
...,
  .owner = THIS_MODULE,
...
};

@depends on (r1 && r2) || r3@
identifier nm;
position p != {r__spufs_calls.p};
@@
struct spufs_calls nm@p = {
...,
+ .owner = THIS_MODULE,
};

@r__svc_xprt_class depends on (r1 && r2) || r3@
identifier nm;
position p;
@@
struct svc_xprt_class nm@p = {
...,
  .xcl_owner = THIS_MODULE,
...
};

@depends on (r1 && r2) || r3@
identifier nm;
position p != {r__svc_xprt_class.p};
@@
struct svc_xprt_class nm@p = {
...,
+ .xcl_owner = THIS_MODULE,
};

@r__synth_operations depends on (r1 && r2) || r3@
identifier nm;
position p;
@@
struct synth_operations nm@p = {
...,
  .owner = THIS_MODULE,
...
};

@depends on (r1 && r2) || r3@
identifier nm;
position p != {r__synth_operations.p};
@@
struct synth_operations nm@p = {
...,
+ .owner = THIS_MODULE,
};

@r__tape_discipline depends on (r1 && r2) || r3@
identifier nm;
position p;
@@
struct tape_discipline nm@p = {
...,
  .owner = THIS_MODULE,
...
};

@depends on (r1 && r2) || r3@
identifier nm;
position p != {r__tape_discipline.p};
@@
struct tape_discipline nm@p = {
...,
+ .owner = THIS_MODULE,
};

@r__target_type depends on (r1 && r2) || r3@
identifier nm;
position p;
@@
struct target_type nm@p = {
...,
  .module = THIS_MODULE,
...
};

@depends on (r1 && r2) || r3@
identifier nm;
position p != {r__target_type.p};
@@
struct target_type nm@p = {
...,
+ .module = THIS_MODULE,
};

@r__tc_action_ops depends on (r1 && r2) || r3@
identifier nm;
position p;
@@
struct tc_action_ops nm@p = {
...,
  .owner = THIS_MODULE,
...
};

@depends on (r1 && r2) || r3@
identifier nm;
position p != {r__tc_action_ops.p};
@@
struct tc_action_ops nm@p = {
...,
+ .owner = THIS_MODULE,
};

@r__tcf_ematch_ops depends on (r1 && r2) || r3@
identifier nm;
position p;
@@
struct tcf_ematch_ops nm@p = {
...,
  .owner = THIS_MODULE,
...
};

@depends on (r1 && r2) || r3@
identifier nm;
position p != {r__tcf_ematch_ops.p};
@@
struct tcf_ematch_ops nm@p = {
...,
+ .owner = THIS_MODULE,
};

@r__tcf_proto_ops depends on (r1 && r2) || r3@
identifier nm;
position p;
@@
struct tcf_proto_ops nm@p = {
...,
  .owner = THIS_MODULE,
...
};

@depends on (r1 && r2) || r3@
identifier nm;
position p != {r__tcf_proto_ops.p};
@@
struct tcf_proto_ops nm@p = {
...,
+ .owner = THIS_MODULE,
};

@r__tcp_congestion_ops depends on (r1 && r2) || r3@
identifier nm;
position p;
@@
struct tcp_congestion_ops nm@p = {
...,
  .owner = THIS_MODULE,
...
};

@depends on (r1 && r2) || r3@
identifier nm;
position p != {r__tcp_congestion_ops.p};
@@
struct tcp_congestion_ops nm@p = {
...,
+ .owner = THIS_MODULE,
};

@r__team_mode depends on (r1 && r2) || r3@
identifier nm;
position p;
@@
struct team_mode nm@p = {
...,
  .owner = THIS_MODULE,
...
};

@depends on (r1 && r2) || r3@
identifier nm;
position p != {r__team_mode.p};
@@
struct team_mode nm@p = {
...,
+ .owner = THIS_MODULE,
};

@r__ts_ops depends on (r1 && r2) || r3@
identifier nm;
position p;
@@
struct ts_ops nm@p = {
...,
  .owner = THIS_MODULE,
...
};

@depends on (r1 && r2) || r3@
identifier nm;
position p != {r__ts_ops.p};
@@
struct ts_ops nm@p = {
...,
+ .owner = THIS_MODULE,
};

@r__tty_ldisc_ops depends on (r1 && r2) || r3@
identifier nm;
position p;
@@
struct tty_ldisc_ops nm@p = {
...,
  .owner = THIS_MODULE,
...
};

@depends on (r1 && r2) || r3@
identifier nm;
position p != {r__tty_ldisc_ops.p};
@@
struct tty_ldisc_ops nm@p = {
...,
+ .owner = THIS_MODULE,
};

@r__uart_driver depends on (r1 && r2) || r3@
identifier nm;
position p;
@@
struct uart_driver nm@p = {
...,
  .owner = THIS_MODULE,
...
};

@depends on (r1 && r2) || r3@
identifier nm;
position p != {r__uart_driver.p};
@@
struct uart_driver nm@p = {
...,
+ .owner = THIS_MODULE,
};

@r__v4l2_clk_ops depends on (r1 && r2) || r3@
identifier nm;
position p;
@@
struct v4l2_clk_ops nm@p = {
...,
  .owner = THIS_MODULE,
...
};

@depends on (r1 && r2) || r3@
identifier nm;
position p != {r__v4l2_clk_ops.p};
@@
struct v4l2_clk_ops nm@p = {
...,
+ .owner = THIS_MODULE,
};

@r__v4l2_file_operations depends on (r1 && r2) || r3@
identifier nm;
position p;
@@
struct v4l2_file_operations nm@p = {
...,
  .owner = THIS_MODULE,
...
};

@depends on (r1 && r2) || r3@
identifier nm;
position p != {r__v4l2_file_operations.p};
@@
struct v4l2_file_operations nm@p = {
...,
+ .owner = THIS_MODULE,
};

@r__v4l2_int_device depends on (r1 && r2) || r3@
identifier nm;
position p;
@@
struct v4l2_int_device nm@p = {
...,
  .module = THIS_MODULE,
...
};

@depends on (r1 && r2) || r3@
identifier nm;
position p != {r__v4l2_int_device.p};
@@
struct v4l2_int_device nm@p = {
...,
+ .module = THIS_MODULE,
};

@r__vfio_iommu_driver_ops depends on (r1 && r2) || r3@
identifier nm;
position p;
@@
struct vfio_iommu_driver_ops nm@p = {
...,
  .owner = THIS_MODULE,
...
};

@depends on (r1 && r2) || r3@
identifier nm;
position p != {r__vfio_iommu_driver_ops.p};
@@
struct vfio_iommu_driver_ops nm@p = {
...,
+ .owner = THIS_MODULE,
};

@r__videocodec depends on (r1 && r2) || r3@
identifier nm;
position p;
@@
struct videocodec nm@p = {
...,
  .owner = THIS_MODULE,
...
};

@depends on (r1 && r2) || r3@
identifier nm;
position p != {r__videocodec.p};
@@
struct videocodec nm@p = {
...,
+ .owner = THIS_MODULE,
};

@r__watchdog_ops depends on (r1 && r2) || r3@
identifier nm;
position p;
@@
struct watchdog_ops nm@p = {
...,
  .owner = THIS_MODULE,
...
};

@depends on (r1 && r2) || r3@
identifier nm;
position p != {r__watchdog_ops.p};
@@
struct watchdog_ops nm@p = {
...,
+ .owner = THIS_MODULE,
};

@r__wf_control_ops depends on (r1 && r2) || r3@
identifier nm;
position p;
@@
struct wf_control_ops nm@p = {
...,
  .owner = THIS_MODULE,
...
};

@depends on (r1 && r2) || r3@
identifier nm;
position p != {r__wf_control_ops.p};
@@
struct wf_control_ops nm@p = {
...,
+ .owner = THIS_MODULE,
};

@r__wf_sensor_ops depends on (r1 && r2) || r3@
identifier nm;
position p;
@@
struct wf_sensor_ops nm@p = {
...,
  .owner = THIS_MODULE,
...
};

@depends on (r1 && r2) || r3@
identifier nm;
position p != {r__wf_sensor_ops.p};
@@
struct wf_sensor_ops nm@p = {
...,
+ .owner = THIS_MODULE,
};

@r__xfrm_mode depends on (r1 && r2) || r3@
identifier nm;
position p;
@@
struct xfrm_mode nm@p = {
...,
  .owner = THIS_MODULE,
...
};

@depends on (r1 && r2) || r3@
identifier nm;
position p != {r__xfrm_mode.p};
@@
struct xfrm_mode nm@p = {
...,
+ .owner = THIS_MODULE,
};

@r__xfrm_state_afinfo depends on (r1 && r2) || r3@
identifier nm;
position p;
@@
struct xfrm_state_afinfo nm@p = {
...,
  .owner = THIS_MODULE,
...
};

@depends on (r1 && r2) || r3@
identifier nm;
position p != {r__xfrm_state_afinfo.p};
@@
struct xfrm_state_afinfo nm@p = {
...,
+ .owner = THIS_MODULE,
};

@r__xfrm_type depends on (r1 && r2) || r3@
identifier nm;
position p;
@@
struct xfrm_type nm@p = {
...,
  .owner = THIS_MODULE,
...
};

@depends on (r1 && r2) || r3@
identifier nm;
position p != {r__xfrm_type.p};
@@
struct xfrm_type nm@p = {
...,
+ .owner = THIS_MODULE,
};

@r__xprt_class depends on (r1 && r2) || r3@
identifier nm;
position p;
@@
struct xprt_class nm@p = {
...,
  .owner = THIS_MODULE,
...
};

@depends on (r1 && r2) || r3@
identifier nm;
position p != {r__xprt_class.p};
@@
struct xprt_class nm@p = {
...,
+ .owner = THIS_MODULE,
};

@r__xt_match depends on (r1 && r2) || r3@
identifier nm;
position p;
@@
struct xt_match nm@p = {
...,
  .me = THIS_MODULE,
...
};

@depends on (r1 && r2) || r3@
identifier nm;
position p != {r__xt_match.p};
@@
struct xt_match nm@p = {
...,
+ .me = THIS_MODULE,
};

@r__xt_table depends on (r1 && r2) || r3@
identifier nm;
position p;
@@
struct xt_table nm@p = {
...,
  .me = THIS_MODULE,
...
};

@depends on (r1 && r2) || r3@
identifier nm;
position p != {r__xt_table.p};
@@
struct xt_table nm@p = {
...,
+ .me = THIS_MODULE,
};

@r__xt_target depends on (r1 && r2) || r3@
identifier nm;
position p;
@@
struct xt_target nm@p = {
...,
  .me = THIS_MODULE,
...
};

@depends on (r1 && r2) || r3@
identifier nm;
position p != {r__xt_target.p};
@@
struct xt_target nm@p = {
...,
+ .me = THIS_MODULE,
};

@r__zcrypt_ops depends on (r1 && r2) || r3@
identifier nm;
position p;
@@
struct zcrypt_ops nm@p = {
...,
  .owner = THIS_MODULE,
...
};

@depends on (r1 && r2) || r3@
identifier nm;
position p != {r__zcrypt_ops.p};
@@
struct zcrypt_ops nm@p = {
...,
+ .owner = THIS_MODULE,
};
