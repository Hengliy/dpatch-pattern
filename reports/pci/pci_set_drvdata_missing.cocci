/// add missing pci_set_drvdata() in {{function}}
///
/// Add missing pci_set_drvdata() in {{function}}, otherwise
/// calling pci_get_drvdata() in remove returns NULL.
///

@r1@
identifier fn_probe;
identifier fn_remove;
identifier driver;
@@
struct pci_driver driver = {
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
int fn_remove(struct pci_dev *pdev)
{
  ...
  data = pci_get_drvdata(pdev)
  ...
}

@depends on r2@
identifier r1.fn_probe;
expression r2.data, E;
identifier pdev, ent, dev;
@@
int fn_probe(struct pci_dev *pdev, const struct pci_device_id *ent)
{
  ... when != pci_set_drvdata(pdev, E)
      when != dev_set_drvdata(&pdev->dev, E)
      when != dev_set_drvdata(E, data)
      when != data = pci_get_drvdata(pdev)
      when forall
+ pci_set_drvdata(pdev, data);
? return 0;
}

