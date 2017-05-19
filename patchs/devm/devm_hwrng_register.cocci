/// use devm_hwrng_register() for hwrng registration
///
/// Options: -D fullmatch
/// Flags: 64
///
/// Use resource managed function devm_hwrng_register() instead
/// of hwrng_register to make the error-path simpler. Also get
/// rid of .remove callback.
///

virtual context
virtual patch
virtual org
virtual report
virtual content
virtual fullmatch

@r1@
identifier fn_probe;
identifier pdev;
type T;
position p;
@@

T fn_probe(struct platform_device *pdev)
{
<+...
  hwrng_register@p(...)
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
? T2 drvdata = fn(...);
  ...
  hwrng_unregister(...);
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
  hwrng_unregister(...);
? return 0;
}

@p1 depends on r2 && !org && !report && !context && !content && (!fullmatch || r4 || !r3)@
identifier r1.fn_probe, r1.pdev;
expression rng;
type T;
@@

T fn_probe(struct platform_device *pdev)
{
<+...
- hwrng_register(rng)
+ devm_hwrng_register(&pdev->dev, rng)
...+>
}

@p2 depends on p1@
identifier r1.fn_probe;
type T;
@@

T fn_probe(...)
{
<+...
- hwrng_unregister(...);
...+>
}

@p3 depends on p1@
identifier r3.fn_remove;
type T;
@@
T fn_remove(...)
{
<+...
- hwrng_unregister(...);
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

@depends on r2 && context && !org && !report && (!fullmatch || r4 || !r3)@
identifier r1.fn_probe;
identifier ret;
type T;
@@

T fn_probe(...)
{
<+...
(
- ret = hwrng_register(...);
|
- return hwrng_register(...);
)
...+>
}

@script:python depends on r1 && !r5 && content@
@@

msg = """Use resource managed function devm_hwrng_register() instead
of hwrng_register to make the error-path simpler."""

print("%s" % msg)

@script:python depends on r1 && r5 && content@
@@

msg = """Use resource managed function devm_hwrng_register() instead
of hwrng_register to make the error-path simpler. Also get
rid of .remove callback."""

print("%s" % msg)

@script:python depends on org && (!fullmatch || r4 || !r3)@
p << r1.p;
@@

msg="WARNING: hwrng_register can be used with devm_hwrng_register"
coccilib.org.print_todo(p[0], msg)

@script:python depends on report && (!fullmatch || r4 || !r3)@
p << r1.p;
@@

msg="WARNING: hwrng_register can be used with devm_hwrng_register"
coccilib.report.print_report(p[0], msg)
