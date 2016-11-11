/// add terminate entry for dmi_system_id tables
///
/// Make sure dmi_system_id tables are NULL terminated.
///

@r1@
identifier ids;
position p;
@@
struct dmi_system_id ids@p[] = { ... };

@r2@
identifier r1.ids;
@@
\(dmi_check_system\|dmi_first_match\)(ids)

@depends on r2@
identifier r1.ids, fld;
expression E;
position p;
@@
(
struct dmi_system_id ids@p[] = {
  ...,
  { NULL, },
};
|
struct dmi_system_id ids@p[] = {
  ...,
  { .ident = NULL, },
};
|
struct dmi_system_id ids@p[] = {
  ...,
  { ..., .fld = E, ... },
+ { }
};
|
struct dmi_system_id ids@p[] = {
  ...,
  { ..., E, ... },
+ { },
};
)
