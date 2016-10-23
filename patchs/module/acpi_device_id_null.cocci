/// add terminate entry for acpi_device_id tables
///
/// Make sure acpi_device_id tables have terminate entry.
///

@@
identifier ids, fld;
expression E;
@@
(
struct acpi_device_id ids[] = {
  ...,
  { "", 0 },
};
|
struct acpi_device_id ids[] = {
  ...,
  { "", },
};
|
struct acpi_device_id ids[] = {
  ...,
  { .id = "", },
};
|
struct acpi_device_id ids[] = {
  ...,
  { ..., .fld = E, ... },
+ { "", 0 },
};
|
struct acpi_device_id ids[] = {
  ...,
  { ..., E, ... },
+ { "", 0 },
};
)
