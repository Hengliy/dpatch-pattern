/// drop pwm_put for device requested with devm_pwm_get
///
/// It's not necessary to release device requested with devm_pwm_get().
///

@r1@
identifier fn_probe;
expression pwm;
type T;
@@
T fn_probe(...)
{
  ...
  pwm = devm_pwm_get(...)
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
-pwm_put(...);
...+>
}

@depends on r3@
identifier r3.fn_remove;
type T;
@@
T fn_remove(...)
{
<+...
-pwm_put(...);
...+>
}

@@
expression pwm, dev;
@@
pwm = devm_pwm_get(dev, ...)
<+...
- pwm_put(pwm)
+ devm_pwm_put(dev, pwm)
...+>


