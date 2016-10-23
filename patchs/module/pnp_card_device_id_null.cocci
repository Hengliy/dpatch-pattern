/// add terminate entry for pnp_card_device_id tables
///
/// Make sure pnp_card_device_id tables have terminate entry.
///

@@
identifier ids, fld;
expression E;
@@
(
struct pnp_card_device_id ids[] = {
  ...,
  { "", ... },
};
|
struct pnp_card_device_id ids[] = {
  ...,
  { .id = "", ... },
};
|
struct pnp_card_device_id ids[] = {
  ...,
  { ..., .fld = E, ... },
+ { .id = "" }
};
|
struct pnp_card_device_id ids[] = {
  ...,
  { ..., E, ... },
+ { .id = "", }
};
)
