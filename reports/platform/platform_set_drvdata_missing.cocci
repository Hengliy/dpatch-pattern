/// add missing platform_set_drvdata() in {{function}}
///
/// Except File: drivers/net/ethernet/aeroflex/greth.c : special case that can not detect correctly
///
/// Add missing platform_set_drvdata() in {{function}}, otherwise
/// calling platform_get_drvdata() in remove returns NULL.
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
expression data;
identifier pdev;
@@
int fn_remove(struct platform_device *pdev)
{
  ...
  data = platform_get_drvdata(pdev)
  ...
}

@depends on r2@
identifier r1.fn_probe;
expression r2.data, E;
identifier pdev, dev;
@@
int fn_probe(struct platform_device *pdev)
{
  ... when != platform_set_drvdata(pdev, E)
      when != dev_set_drvdata(&pdev->dev, E)
      when != dev_set_drvdata(E, data)
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
      when != data = platform_get_drvdata(pdev)
      when forall
+ platform_set_drvdata(pdev, data);
? return 0;
}

