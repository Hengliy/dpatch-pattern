/// add terminate entry for pci_device_id tables
///
/// Make sure pci_device_id tables are NULL terminated.
///

@r1@
identifier ids;
position p;
@@
struct pci_device_id ids@p[] = { ... };

@r2@
identifier drv, r1.ids;
@@
struct pci_driver drv = {
  ...,
  .id_table = ids,
  ...,
};

@depends on r2@
identifier r1.ids, fld;
position r1.p;
expression E;
@@
(
struct pci_device_id ids@p[] = {
  ...,
  { 0, ... },
};
|
struct pci_device_id ids@p[] = {
  ...,
  { .fld = 0, },
};
|
struct pci_device_id ids@p[] = {
  ...,
  { ..., .fld = E, ... },
+ { },
};
|
struct pci_device_id ids@p[] = {
  ...,
  { ..., E, ... },
+ { },
};
)
