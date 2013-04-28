/// add missing platform_driver_unregister() when module exit
///
/// We have registered platform driver when module init, and
/// need unregister it when module exit.
///
@r1@
declarer name module_init;
identifier fn_init;
@@
module_init(fn_init);

@r2@
declarer name module_exit;
identifier fn_exit != {xxxfb_exit};
@@
module_exit(fn_exit);

@r3 depends on r1@
identifier r1.fn_init;
expression drv;
@@
int fn_init(void)
{
  ...
  platform_driver_register(drv)
  ...
}

@r4 depends on r2 && r3@
identifier r2.fn_exit;
expression r3.drv;
@@
void fn_exit(void)
{
  ... when != platform_driver_unregister(drv)
      when != snd_portman_unregister_all()
      when != snd_mpu401_unregister_all()
      when != loopback_unregister_all()
      when != snd_virmidi_unregister_all()
      when != snd_dummy_unregister_all()
      when != snd_serial_unregister_all()
      when != snd_mts64_unregister_all()
      when forall
+ platform_driver_unregister(drv);
}
