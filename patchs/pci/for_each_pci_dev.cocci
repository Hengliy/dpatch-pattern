/// use for_each_pci_dev to simplify the code
///
/// Use for_each_pci_dev to simplify the code.
///
@@
struct pci_dev *dev;
iterator name for_each_pci_dev;
statement S;
@@

- while ((dev = pci_get_device(PCI_ANY_ID, PCI_ANY_ID, dev)) != NULL)
+ for_each_pci_dev(dev)
 S
