/// add terminate entry for spi_device_id tables
///
/// Make sure spi_device_id tables are NULL terminated.
///

@@
identifier ids, fld;
expression E;
@@
(
struct spi_device_id ids[] = {
  ...,
  { ..., .fld = E, ... },
+ { },
};
|
struct spi_device_id ids[] = {
  ...,
  { ..., E, ... },
+ { },
};
)
