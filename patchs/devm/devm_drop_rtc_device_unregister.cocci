/// drop unnessary rtc_device_unregister() call
///
/// It's not necessary to unregister RTC device which registered
/// with devm_rtc_device_register().
///

@r1@
identifier fn_probe;
expression master;
type T;
@@
T fn_probe(...)
{
  ...
  devm_rtc_device_register(master)
  ...
}

@r2 depends on r1@
identifier r1.fn_probe;
identifier driver;
position p;
type T;
@@
T driver@p = {
...,
  .probe = fn_probe,
...
};

@r3@
identifier fn_remove;
identifier r2.driver;
position r2.p;
type T;
@@
T driver@p = {
...,
 .remove = fn_remove,
...
};

@depends on r2@
identifier r1.fn_probe;
type T;
@@
T fn_probe(...)
{
<+...
(
- devm_rtc_device_unregister(...);
|
- rtc_device_unregister(...);
)
...+>
}

@depends on r3@
identifier r3.fn_remove;
type T;
@@
T fn_remove(...)
{
<+...
(
- devm_rtc_device_unregister(...);
|
- rtc_device_unregister(...);
)
...+>
}

@@
@@
devm_rtc_device_register(...)
<+...
- rtc_device_unregister(...);
...+>


