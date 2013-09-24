/// add missing platform_device_put() on error in {{function}}
///
/// Except File: drivers/usb/dwc3/dwc3-pci.c : special case that can not detect correctly
/// Except File: drivers/usb/dwc3/dwc3-exynos.c : special case that can not detect correctly
/// Except File: drivers/hwmon/nct6775.c : special case that can not detect correctly
///
/// Add the missing platform_device_put() before return from
/// {{function}} in the error handling case.
///
@r1 exists@
expression E;
expression E2 != {0};
statement S;
identifier l;
position p;
@@
 E = platform_device_alloc(...);
 if (E == NULL) S
 ... when != platform_device_put(E)
     when != platform_device_add(E)
 if (...) {
   ... when != platform_device_put(E);
   goto l;
 }
...
l:
   ... when != platform_device_put(E);
   return E2@p;

@depends on r1@
identifier r1.l;
position r1.p;
expression r1.E, r1.E2;
@@
(
l:
- platform_device_unregister(E);
+ platform_device_put(E);
   ...
  return E2@p;
|
l:
+ platform_device_put(E);
   ...
  return E2@p;
)

@r2 exists@
expression E, E1;
expression E2 != {0};
statement S;
identifier l;
position p;
@@
  E = platform_device_alloc(...);
  if (E == NULL) S
  ... when != platform_device_put(E)
  E1 = platform_device_add(E);
  if (E1) {
   ... when != platform_device_put(E);
   goto l;
  }
  ...
l:
  ... when != platform_device_put(E);
  return E2@p;

@depends on r2@
identifier r2.l;
position r2.p;
expression r2.E, r2.E2;
@@
(
l:
- platform_device_unregister(E);
+ platform_device_put(E);
   ...
  return E2@p;
|
l:
+ platform_device_put(E);
   ...
  return E2@p;
)

@r3 exists@
expression E;
statement S;
position p;
identifier l;
@@
 E = platform_device_alloc(...);
  if (E == NULL) S
  ... when != platform_device_put(E)
      when != platform_device_add(E)
 if (...) {
    ... when != platform_device_put(E);
        when != goto l;
   return@p ...;
  }

@depends on r3@
expression r3.E;
position r3.p;
@@
+ platform_device_put(E);
  return@p ...;

@r4 exists@
expression E, E1;
statement S;
position p;
identifier l;
@@
  E = platform_device_alloc(...);
  if (E == NULL) S
  ... when != platform_device_put(E)
  E1 = platform_device_add(E);
  if (E1) {
    ... when != platform_device_put(E);
        when != goto l;
    return@p ...;
  }

@depends on r4@
expression r4.E;
position r4.p;
@@
+ platform_device_put(E);
  return@p ...;

