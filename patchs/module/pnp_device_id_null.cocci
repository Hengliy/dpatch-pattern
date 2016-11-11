/// add terminate entry for pnp_device_id tables
///
/// Make sure pnp_device_id tables have terminate entry.
///

@@
identifier ids, fld;
expression E;
@@
(
struct pnp_device_id ids[] = {
  ...,
  { "", ... },
};
|
struct pnp_device_id ids[] = {
  ...,
  { ..., .id = "", ... },
};
|
struct pnp_device_id ids[] = {
  ...,
  { ..., .fld = E, ... },
+ { "", 0 },
};
|
struct pnp_device_id ids[] = {
  ...,
  { ..., E, ... },
+ { .id = "" },
};
)
