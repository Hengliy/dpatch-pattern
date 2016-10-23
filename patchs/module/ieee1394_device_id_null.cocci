/// add terminate entry for ieee1394_device_id tables
///
/// Make sure ieee1394_device_id tables have terminate entry.
///

@@
identifier ids, fld;
expression E;
@@
(
struct ieee1394_device_id ids[] = {
  ...,
  { ..., .fld = E, ... },
+ { }
};
|
struct ieee1394_device_id ids[] = {
  ...,
  { ..., E, ... },
+ { }
};
)
