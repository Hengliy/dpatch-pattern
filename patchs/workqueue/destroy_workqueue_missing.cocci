/// fix missing destroy_workqueue() on error in {{function}}
///
/// Except File: fs/sysfs/file.c : special case that can not detect correctly
/// Except File: drivers/net/ethernet/chelsio/cxgb3/cxgb3_main.c : special case that can not detect correctly
/// Except File: drivers/net/ethernet/qlogic/qlcnic/qlcnic_sriov_common.c : special case that can not detect correctly
/// Except File: drivers/pci/hotplug/shpchp_core.c : special case that can not detect correctly
/// Except File: drivers/net/ethernet/sfc/ptp.c : special case that can not detect correctly
/// Except File: drivers/thunderbolt/tb.c : special case that can not detect correctly
///
/// Add the missing destroy_workqueue() before return from
/// {{function}} in the error handling case.
///
@r1 exists@
expression ret, wq;
expression E != {0};
statement S;
position p;
@@
 wq = \(alloc_workqueue\|create_singlethread_workqueue\|alloc_ordered_workqueue\)(...);
 if (\(ret < 0\|ret != 0\)) S
 ... when any
     when != destroy_workqueue(wq)
 if (...) {
   ... when != destroy_workqueue(wq)
       when != whc_clean_up(...)
       when != asus_led_exit(...)
       when != asus_wmi_led_exit(...)
       when != thinkpad_acpi_module_exit(...)
       when != pegasus_dec_workqueue(...)
       when != brcmf_sdbrcm_release(...)
       when != brcmf_fws_deinit(...)
       when != rt2x00lib_remove_dev(...)
       when != cx25821_dev_unregister(...)
       when != crypt_dtr(...)
       when != destroy(...)
       when != dwc2_hcd_release(...)
       when != snd_hda_bus_free(...)
       when != mwifiex_terminate_workqueue(...)
       when != dlm_destroy_dlm_worker(...)
       when != brcmf_sdio_remove(...)
       when != mwifiex_terminate_workqueue(...)
       when != mlx5e_arfs_destroy_tables(...)
       when forall
   return@p E;
  }

@depends on r1@
expression r1.wq, r1.E;
position r1.p;
@@
+ destroy_workqueue(wq);
  return@p E;
