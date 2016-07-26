/// drop free_irq of devm_ allocated irq
///
/// The devm_request_irq function allocates irq that is released
/// when a driver detaches. Thus, there is no reason to explicitly
/// call free_irq in probe or remove functions.
///

@r1@
identifier fn_probe;
expression dev, irq;
type T;
@@
T fn_probe(...)
{
  ...
  \(devm_request_irq\|devm_request_threaded_irq\)(dev, irq, ...)
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
(
- devm_free_irq(...);
|
- free_irq(...);
)
...+>
}

@depends on r3@
identifier r3.fn_remove;
expression r1.dev;
type T;
@@
T fn_remove(...)
{
<+...
- free_irq
+ devm_free_irq
  (
+ dev,
  ...);
...+>
}

@@
expression dev, irq;
@@
\(devm_request_irq\|devm_request_threaded_irq\)(dev, irq, ...)
<+...
(
- free_irq
+ devm_free_irq
  (
+ dev,
  ...);
)
...+>

