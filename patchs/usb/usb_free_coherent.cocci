/// remove needless check before usb_free_coherent()
///
/// usb_free_coherent() is safe with NULL addr and this check is
/// not required.
///
@@
expression dev, size, addr, dma;
@@

- if (addr != NULL) usb_free_coherent(dev, size, addr, dma);
+ usb_free_coherent(dev, size, addr, dma);
