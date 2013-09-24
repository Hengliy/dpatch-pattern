/// drop free_irq for devm_request_irq allocated irq
///
/// irq allocated with devm_request_irq should not be freed using
/// free_irq, because doing so causes a dangling pointer, and a
/// subsequent double free.
///

@r@
expression dev, irq;
@@
(
 devm_request_irq(dev, irq, ...)
|
 devm_request_threaded_irq(dev, irq, ...)
)

@@
expression r.irq;
@@
- free_irq(irq, ...);

