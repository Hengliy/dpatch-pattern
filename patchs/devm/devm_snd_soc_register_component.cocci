/// use devm_snd_soc_register_component()
///
/// Options: -D fullmatch
///
/// Using devm_snd_soc_register_component() can make the code
/// shorter and cleaner.
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
  snd_soc_register_component(...)
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
  snd_soc_unregister_component(...);
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
  snd_soc_unregister_component(...);
? return 0;
}

@p1 depends on r2 && !content && (!fullmatch || r4 || !r3)@
identifier r1.fn_probe;
type T;
@@

T fn_probe(...)
{
<+...
- snd_soc_register_component
+ devm_snd_soc_register_component
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
- snd_soc_unregister_component(...);
...+>
}

@p3 depends on p1@
identifier r3.fn_remove;
type T;
@@
T fn_remove(...)
{
<+...
- snd_soc_unregister_component(...);
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

@script:python depends on r1 && content@
@@

msg = """Using devm_snd_soc_register_component() can make the code
shorter and cleaner."""

print("%s" % msg)

