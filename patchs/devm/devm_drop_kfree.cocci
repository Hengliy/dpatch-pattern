/// drop kfree for memory allocated with devm_kzalloc
///
/// It's not necessary to free memory allocated with devm_kzalloc
/// and using kfree leads to a double free.
///

@r1@
identifier fn_probe;
expression x;
type T;
@@
T fn_probe(...)
{
  <+...
  x = \(devm_kmalloc\|devm_kmalloc_array\|devm_kzalloc\|devm_kcalloc\|devm_kmemdup\|devm_kstrdup\|devm_kvasprintf\)(...)
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
expression r1.x;
type T;
@@
T fn_probe(...)
{
<+...
(
- devm_kfree(x);
|
- kfree(x);
)
...+>
}

@depends on r3@
identifier r3.fn_remove;
expression r1.x;
type T;
@@
T fn_remove(...)
{
<+...
(
- devm_kfree(x);
|
- kfree(x);
)
...+>
}

@@
expression x;
@@
 x = \(devm_kmalloc\|devm_kmalloc_array\|devm_kzalloc\|devm_kcalloc\|devm_kmemdup\|devm_kstrdup\|devm_kvasprintf\)(...)
<+...
- kfree(x)
+ devm_kfree(x)
...+>


