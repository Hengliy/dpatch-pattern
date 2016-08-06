/// drop unnessary snd_soc_unregister_component()
///
/// It's not necessary to unregister a component registered
/// with devm_snd_soc_register_component().
///

@r1@
identifier fn_probe;
expression dev;
type T;
@@
T fn_probe(...)
{
  <+...
  devm_snd_soc_register_component(dev, ...)
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

@depends on r2@
identifier r1.fn_probe;
type T;
@@
T fn_probe(...)
{
<+...
- snd_soc_unregister_component(...);
...+>
}

@depends on r3@
identifier r3.fn_remove;
type T;
@@
T fn_remove(...)
{
<+...
- snd_soc_unregister_component(...);
...+>
}

@@
expression dev;
@@
  devm_snd_soc_register_component(dev, ...)
<+...
- snd_soc_unregister_component
+ devm_snd_soc_unregister_component
  (...)
...+>


