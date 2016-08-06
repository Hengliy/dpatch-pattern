/// fix missing platform_set_drvdata() in {{function}}
///
/// Add missing platform_set_drvdata() in {{function}}, otherwise
/// calling platform_get_drvdata() in remove returns NULL.
///
/// This is detected by Coccinelle semantic patch.
///

@r1@
identifier fn_probe;
identifier fn_remove;
identifier driver;
@@
struct platform_driver driver = {
...,
  .probe = fn_probe,
  .remove = fn_remove,
...
};

@r2 depends on r1@
identifier r1.fn_remove;
identifier pdev;
type T;
T data;
@@
int fn_remove(struct platform_device *pdev)
{
  <+...
  data = platform_get_drvdata(pdev)
  ...+>
}

@depends on r2@
identifier r1.fn_probe;
expression E;
identifier pdev, dev;
type r2.T;
T rdata, r2.data;
@@
int fn_probe(struct platform_device *pdev)
{
  ... when != platform_set_drvdata(pdev, E)
      when != dev_set_drvdata(&pdev->dev, E)
      when != dev_set_drvdata(E, rdata)
      when != usb_create_hcd(...)
      when != snd_soc_register_card(...)
      when != devm_snd_soc_register_card(...)
      when != sport_init(...)
      when != v4l2_device_register(...)
      when != register_device(...)
      when != grcan_setup_netdev(...)
      when != sdhci_pltfm_init(...)
      when != omapfb_do_probe(...)
      when != fsl_spi_probe(...)
      when != tmio_mmc_host_probe(...)
      when != ata_host_alloc(&pdev->dev, ...)
      when != ata_host_alloc_pinfo(&pdev->dev, ...)
      when != mpc52xx_ata_init_one(&pdev->dev, ...)
      when != devm_regulator_register(&pdev->dev, ...)
      when != nouveau_platform_device_create(E, pdev, ...)
      when != data = platform_get_drvdata(pdev)
      when != rdata = ata_host_alloc(...)
      when != fpga_mgr_register(...)
      when != rdata = regulator_register(...)
      when != arcpgu_load(data)
      when != atmel_hlcdc_dc_load(data)
      when forall
+ platform_set_drvdata(pdev, data);
? return 0;
}

