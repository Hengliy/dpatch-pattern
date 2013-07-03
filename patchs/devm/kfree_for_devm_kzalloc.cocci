/// remove kfree for memory allocated with devm_kzalloc
///
/// It's not necessary to free memory allocated with devm_kzalloc
/// and using kfree leads to a double free.
///

@@
expression x;
@@
x = devm_kzalloc(...)
...
?-kfree(x);

@r1@
identifier fn_probe;
expression x;
type T;
@@
T fn_probe(...)
{
  ...
  x = devm_kzalloc(...)
  ...
}

@r2 depends on r1@
identifier r1.fn_probe;
identifier fn_remove;
identifier driver;
type T;
@@
T driver = {
...,
  .probe = fn_probe,
  .remove = fn_remove,
...
};

@depends on r2@
identifier r2.fn_remove;
expression r1.x;
type T;
@@
T fn_remove(...)
{
...
- kfree(x);
...
}

