/// add terminate entry for acpi_device_id tables
///
/// Make sure acpi_device_id tables have terminate entry.
///

@r1@
identifier ids;
position p;
@@
struct acpi_device_id ids@p[] = { ... };

@r2@
identifier drv, r1.ids;
identifier driver, fld;
type T;
@@
(
T drv = {
  ...,
  .fld = <+...ids...+>,
  ...
};
|
T drv = {
  ...,
  .driver = {
     ...,
     .fld = <+...ids...+>,
     ...
  },
  ...
};
)

@depends on r2@
identifier r1.ids, fld;
expression E;
position r1.p;
@@
(
struct acpi_device_id ids@p[] = {
  ...,
  { "", 0 },
};
|
struct acpi_device_id ids@p[] = {
  ...,
  { "", },
};
|
struct acpi_device_id ids@p[] = {
  ...,
  { .id = "", },
};
|
struct acpi_device_id ids@p[] = {
  ...,
  { ..., .fld = E, ... },
+ { "", 0 },
};
|
struct acpi_device_id ids@p[] = {
  ...,
  { ..., E, ... },
+ { "", 0 },
};
)
