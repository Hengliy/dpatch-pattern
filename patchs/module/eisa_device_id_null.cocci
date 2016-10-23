/// add terminate entry for eisa_device_id tables
///
/// Make sure eisa_device_id tables have terminate entry.
///

@@
identifier ids, fld;
expression E;
@@
(
struct eisa_device_id ids[] = {
  ...,
  { "", 0 },
};
|
struct eisa_device_id ids[] = {
  ...,
  { "", },
};
|
struct eisa_device_id ids[] = {
  ...,
  { .sig = "", },
};
|
struct eisa_device_id ids[] = {
  ...,
  { ..., .fld = E, ... },
+ { "" },
};
|
struct eisa_device_id ids[] = {
  ...,
  { ..., E, ... },
+ { "" },
};
)
