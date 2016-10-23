/// add terminate entry for pcmcia_device_id tables
///
/// Make sure pcmcia_device_id tables have terminate entry.
///

@@
identifier ids, fld;
expression E;
@@
(
struct pcmcia_device_id ids[] = {
  ...,
  { ..., .fld = E, ... },
+ { }
};
|
struct pcmcia_device_id ids[] = {
  ...,
  { ..., E, ... },
+ { }
};
)
