/// add missing destroy_workqueue() on error in {{function}}
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
       when forall
   return@p E;
  }

@depends on r1@
expression r1.wq, r1.E;
position r1.p;
@@
+ destroy_workqueue(wq);
  return@p E;
