/// add terminate entry for pci_device_id tables
///
/// Make sure pci_device_id tables are NULL terminated.
///
/// drivers/tty/serial/8250/8250_pci.c

@@
identifier ids, fld;
expression E;
@@
(
struct pci_device_id ids[] = {
  ...,
  { 0, ... },
};
|
struct pci_device_id ids[] = {
  ...,
  { .fld = 0, },
};
|
struct pci_device_id ids[] = {
  ...,
  { ..., .fld = E, ... },
+ { },
};
|
struct pci_device_id ids[] = {
  ...,
  { ..., E, ... },
+ { },
};
)
