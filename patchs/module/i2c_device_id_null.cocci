/// add terminate entry for i2c_device_id tables
///
/// Make sure i2c_device_id tables are NULL terminated.
///

@r1@
identifier ids;
position p;
@@
struct i2c_device_id ids@p[] = { ... };

@r2@
identifier drv, r1.ids;
@@
struct i2c_driver drv = {
  ...,
  .id_table = ids,
  ...,
};

@depends on r2@
identifier r1.ids, fld;
expression E;
position r1.p;
@@
(
struct i2c_device_id ids@p[] = {
  ...,
  { ..., .fld = E, ... },
+ { },
};
|
struct i2c_device_id ids@p[] = {
  ...,
  { ..., E, ... },
+ { },
};
)
