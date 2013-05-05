/// missing platform_device_unregister() on error in {{function}}
///
/// Add the missing platform_device_unregister() before return
/// from {{function}} in the error handling case.
///

@r1@
expression pdev, ret;
expression E != {0};
statement S;
position p;
@@
(
  ret = platform_device_register(pdev);
  if (ret == 0) S
|
  pdev = \(platform_device_register_simple\|platform_device_register_full\)(...);
  if (IS_ERR(pdev)) S
|
  pdev = \(platform_device_register_resndata\|platform_device_register_data\)(...);
  if (IS_ERR(pdev)) S
)
  ... when any
      when != platform_device_unregister(pdev)
  if (...) {
    ... when != platform_device_unregister(pdev);
        when != atml_plat_remove()
        when != snd_mpu401_unregister_all()
        when != loopback_unregister_all()
        when != snd_virmidi_unregister_all()
        when != snd_dummy_unregister_all()
        when != snd_serial_unregister_all()
        when forall
    return@p E;
  }

@depends on r1@
expression r1.pdev, r1.E;
position r1.p;
@@
+ platform_device_unregister(pdev);
  return@p E;

