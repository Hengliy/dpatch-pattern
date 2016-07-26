/// drop iounmap for devm_ allocated data
///
/// Data allocated with devm_ioremap or devm_ioremap_nocache should not be
/// freed using iounmap, because doing so causes a dangling pointer, and a
/// subsequent double free.
///

@r1@
identifier fn_probe;
expression iomem;
type T;
@@
T fn_probe(...)
{
  <+...
  iomem = \(devm_ioremap\|devm_ioremap_nocache\)(...)
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
expression iomem;
type T;
@@
T fn_probe(...)
{
<+...
- iounmap(iomem);
...+>
}

@depends on r3@
identifier r3.fn_remove;
type T;
@@
T fn_remove(...)
{
<+...
- iounmap(...);
...+>
}

@@
expression iomem;
@@
iomem = \(devm_ioremap\|devm_ioremap_nocache\)(...)
<+...
- iounmap(iomem);
+ devm_iounmap(iomem);
...+>


