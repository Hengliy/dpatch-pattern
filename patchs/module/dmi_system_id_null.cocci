/// add terminate entry for dmi_system_id tables
///
/// Make sure dmi_system_id tables are NULL terminated.
///

@@
identifier ids, fld;
expression E;
@@
(
struct dmi_system_id ids[] = {
  ...,
  { NULL, },
};
|
struct dmi_system_id ids[] = {
  ...,
  { .ident = NULL, },
};
|
struct dmi_system_id ids[] = {
  ...,
  { ..., .fld = E, ... },
+ { }
};
|
struct dmi_system_id ids[] = {
  ...,
  { ..., E, ... },
+ { },
};
)
