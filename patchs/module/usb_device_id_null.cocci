/// add terminate entry for usb_device_id tables
///
/// Make sure usb_device_id tables have terminate entry.
///

@@
identifier ids, fld;
expression E;
@@
(
struct usb_device_id ids[] = {
  ...,
  { 0 }
};
|
struct usb_device_id ids[] = {
  ...,
  { ..., .fld = E, ... },
+ { }
};
|
struct usb_device_id ids[] = {
  ...,
  { ..., E, ... },
+ { }
};
)
