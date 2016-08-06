/// use devm_led_classdev_register()
///
/// Options: -D fullmatch
/// Flags: 64
///
/// Use devm_led_classdev_register() for led device registration and
/// get rid of .remove callback to remove led device. This is done by
/// managed device framework.
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
  ...
  led_classdev_register(...)
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

@r4@
identifier r3.fn_remove;
identifier drvdata, fn;
type T, T2;
@@
T fn_remove(...)
{
? T2 drvdata = fn(...);
  ...
  led_classdev_unregister(...);
? return 0;
}

@r5@
identifier r3.fn_remove;
identifier drvdata, fn;
type T, T2;
@@
T fn_remove(...)
{
? T2 drvdata = fn(...);
  led_classdev_unregister(...);
? return 0;
}

@p1 depends on r2 && !content && (!fullmatch || r4 || !r3)@
identifier r1.fn_probe;
type T;
@@

T fn_probe(...)
{
<+...
- led_classdev_register
+ devm_led_classdev_register
  (...)
...+>
}

@p2 depends on p1@
identifier r1.fn_probe;
type T;
@@

T fn_probe(...)
{
<+...
- led_classdev_unregister(...);
...+>
}

@p3 depends on p1@
identifier r3.fn_remove;
type T;
@@
T fn_remove(...)
{
<+...
- led_classdev_unregister(...);
...+>
}

@p4 depends on p3@
identifier r3.fn_remove;
identifier drvdata;
type T, T2;
@@

- T fn_remove(...)
- {
?- 	T2 drvdata = ...;
?- 	return 0;
- }

@depends on p4@
identifier r3.fn_remove;
identifier r2.driver;
type T;
@@
T driver = {
...,
- .remove = fn_remove,
...
};

@script:python depends on r1 && !r5 && content@
@@

msg = """Use devm_led_classdev_register() for LED device registration and
remove the call of led_classdev_unregister() from .remove callback
to remove LED device. This is done by managed device framework."""

print msg

@script:python depends on r1 && r5 && content@
@@

msg = """Use devm_led_classdev_register() for led device registration and
get rid of .remove callback to remove led device. This is done by
managed device framework."""

print msg

