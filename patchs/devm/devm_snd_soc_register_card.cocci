/// use devm_snd_soc_register_card()
///
/// Options: -D fullmatch
///
/// Using devm_snd_soc_register_card() can make the code
/// shorter and cleaner.
///

virtual context
virtual patch
virtual org
virtual report
virtual fullmatch

@r1@
identifier fn_probe;
identifier pdev;
type T;
position p;
@@

T fn_probe(struct platform_device *pdev)
{
  ...
  snd_soc_register_card@p(...)
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
  snd_soc_unregister_card(...);
? return 0;
}

@p1 depends on r2 && !org && !report && !context && (!fullmatch || r4 || (r2 && !r3))@
identifier r1.fn_probe;
identifier r1.pdev;
expression card;
type T;
@@

T fn_probe(struct platform_device *pdev)
{
<+...
- snd_soc_register_card(card)
+ devm_snd_soc_register_card(&pdev->dev, card)
...+>
}

@p2 depends on p1@
identifier r1.fn_probe;
type T;
@@

T fn_probe(...)
{
<+...
- snd_soc_unregister_card(...);
...+>
}

@p3 depends on p1@
identifier r3.fn_remove;
type T;
@@
T fn_remove(...)
{
<+...
- snd_soc_unregister_card(...);
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
identifier ret, card;
type T;
@@

T fn_probe(...)
{
<+...
(
- ret = snd_soc_register_card(card);
|
- return snd_soc_register_card(card);
)
...+>
}

@script:python depends on org && (!fullmatch || r4 || !r3)@
p << r1.p;
@@

msg="WARNING: snd_soc_register_card can be used with devm_snd_soc_register_card"
coccilib.org.print_todo(p[0], msg)

@script:python depends on report && (!fullmatch || r4 || !r3)@
p << r1.p;
@@

msg="WARNING: snd_soc_register_card can be used with devm_snd_soc_register_card"
coccilib.report.print_report(p[0], msg)
