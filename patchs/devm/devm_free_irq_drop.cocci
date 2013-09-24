/// drop devm_free_irq of devm_ allocated irq
///
/// Except File: drivers/tty/serial/clps711x.c : special case that can not detect correctly
///
/// The devm_request_irq function allocates irq that is released
/// when a driver detaches. Thus, there is no reason to explicitly
/// call devm_free_irq in probe or remove functions.
///

@@
expression dev, irq;
@@
\(devm_request_irq\|devm_request_threaded_irq\)(dev, irq, ...)
...
(
?-devm_free_irq(...);
|
?-free_irq(...);
)

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
type T;
@@
T fn_remove(...)
{
...
(
-devm_free_irq(...);
|
-free_irq(...);
)
...
}

