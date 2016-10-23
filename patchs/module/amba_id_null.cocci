/// add terminate entry for amba_id tables
///
/// Make sure amba_id tables have terminate entry.
///

@@
identifier ids, fld;
expression E;
@@
(
struct amba_id ids[] = {
  ...,
  { 0, ... }
};
|
struct amba_id ids[] = {
  ...,
  { ..., .fld = E, ... },
+ { }
};
|
struct amba_id ids[] = {
  ...,
  { ..., E, ... },
+ { }
};
)
