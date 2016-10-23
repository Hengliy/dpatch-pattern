/// add terminate entry for pnp_device_id tables
///
/// Make sure pnp_device_id tables have terminate entry.
///

/// FIXME:
/// static const struct pnp_device_id *match_device(struct pnp_driver *drv,
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
