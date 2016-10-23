/// add terminate entry for platform_device_id tables
///
/// Make sure platform_device_id tables are NULL terminated.
///

@@
identifier ids, fld;
expression E;
@@
(
struct platform_device_id ids[] = {
  ...,
  { ..., .fld = E, ... },
+ { },
};
|
struct platform_device_id ids[] = {
  ...,
  { ..., E, ... },
+ { },
};
)
