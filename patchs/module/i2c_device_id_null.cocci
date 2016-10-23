/// add terminate entry for i2c_device_id tables
///
/// Make sure i2c_device_id tables are NULL terminated.
///

@@
identifier ids, fld;
expression E;
@@
(
struct i2c_device_id ids[] = {
  ...,
  { ..., .fld = E, ... },
+ { },
};
|
struct i2c_device_id ids[] = {
  ...,
  { ..., E, ... },
+ { },
};
)
