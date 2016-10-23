/// add terminate entry for hda_device_id tables
///
/// Make sure hda_device_id tables have terminate entry.
///

@@
identifier ids, fld;
expression E;
@@
(
struct hda_device_id ids[] = {
  ...,
  HDA_CODEC_EXT_ENTRY(...),
+ { }
};
|
struct hda_device_id ids[] = {
  ...,
  { ..., .fld = E, ... },
+ { }
};
|
struct hda_device_id ids[] = {
  ...,
  { ..., E, ... },
+ { }
};
)
