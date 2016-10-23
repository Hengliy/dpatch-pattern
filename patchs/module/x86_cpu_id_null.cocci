/// add terminate entry for x86_cpu_id tables
///
/// Make sure x86_cpu_id tables have terminate entry.
///

@@
identifier ids, fld;
expression E;
@@
(
struct x86_cpu_id ids[] = {
  ...,
  X86_FEATURE_MATCH(...),
+ { }
};
|
struct x86_cpu_id ids[] = {
  ...,
  { ..., .fld = E, ... },
+ { }
};
|
struct x86_cpu_id ids[] = {
  ...,
  { ..., E, ... },
+ { }
};
)
