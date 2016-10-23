/// add terminate entry for input_device_id tables
///
/// Make sure input_device_id tables are NULL terminated.
///

@@
identifier ids, fld;
expression E;
@@
(
struct input_device_id ids[] = {
  ...,
  { ..., .fld = E, ... },
+ { },
};
|
struct input_device_id ids[] = {
  ...,
  { ..., E, ... },
+ { },
};
)
