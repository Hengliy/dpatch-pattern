/// add missing platform_device_unregister() when module exit
///
/// We have registered platform device when module init, and
/// need unregister it when module exit.
///
@r1@
declarer name module_init, subsys_initcall;
identifier fn_init;
@@
(
module_init(fn_init);
|
subsys_initcall(fn_init);
)

@r2@
declarer name module_exit;
identifier fn_exit != {serial8250_exit, omap_dsp_exit, hx4700_pcmcia_exit, xxxfb_exit};
@@
module_exit(fn_exit);

@r3 depends on r1@
identifier r1.fn_init;
expression dev;
@@
int fn_init(void)
{
  <+...
(
  dev = platform_device_register_simple(...)
|
  dev = platform_device_register_full(...)
|
  dev = platform_device_register_resndata(...)
|
  dev = platform_device_register_data(...)
|
  platform_device_register(dev)
|
  platform_device_add(dev)
)
  ...+>
}

@r4 depends on r2 && r3@
identifier r2.fn_exit;
expression r3.dev;
@@
void fn_exit(void)
{
  ... when != platform_device_unregister(dev)
      when != atml_plat_remove()
      when != snd_mpu401_unregister_all()
      when != loopback_unregister_all()
      when != snd_virmidi_unregister_all()
      when != snd_dummy_unregister_all()
      when != snd_serial_unregister_all()
      when forall
+ platform_device_unregister(dev);
}
