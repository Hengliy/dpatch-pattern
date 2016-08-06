/// use devm_rtc_device_register()
///
/// Options: -D fullmatch
///
/// devm_rtc_device_register() is device managed and makes error
/// handling and code cleanup simpler.
///

virtual patch
virtual content
virtual fullmatch

@r1@
identifier fn_probe;
type T;
@@

T fn_probe(...)
{
  <+...
  rtc_device_register(...)
  ...+>
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

@r4@
identifier r3.fn_remove;
identifier drvdata, fn;
type T, T2;
@@
T fn_remove(...)
{
?	T2 drvdata = fn(...);
...
(
	rtc_device_unregister(...);
|
	if (...) rtc_device_unregister(...);
)
?	return 0;
}

@p1 depends on r2 && !content && (!fullmatch || r4 || !r3)@
identifier r1.fn_probe;
expression E1, E2, E3, E4;
type T;
@@

T fn_probe(...)
{
  <+...
- rtc_device_register(E1, E2, E3, E4)
+ devm_rtc_device_register(E2, E1, E3, E4)
  ...+>
}

@p11 depends on p1@
identifier r1.fn_probe;
type T;
@@

T fn_probe(...)
{
<+...
- rtc_device_unregister(...);
...+>
}

@p2 depends on p1@
identifier r3.fn_remove;
type T;
@@
T fn_remove(...)
{
<+...
- rtc_device_unregister(...);
...+>
}

@ depends on p2@
identifier r3.fn_remove;
type T;
@@
T fn_remove(...)
{
<+...
- if (...) {}
...+>
}

@p3 depends on p2@
identifier r3.fn_remove;
identifier drvdata;
type T, T2;
@@

- T fn_remove(...)
- {
?- 	T2 drvdata = ...;
?- 	return 0;
- }

@depends on p3@
identifier r3.fn_remove;
identifier r2.driver;
type T;
@@
T driver = {
...,
- .remove = fn_remove,
...
};

