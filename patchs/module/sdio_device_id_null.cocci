/// add terminate entry for sdio_device_id tables
///
/// Make sure sdio_device_id tables have terminate entry.
///

@@
identifier ids, fld;
expression E;
@@
(
struct sdio_device_id ids[] = {
  ...,
  { ..., .fld = E, ... },
+ { }
};
|
struct sdio_device_id ids[] = {
  ...,
  { ..., E, ... },
+ { }
};
)
