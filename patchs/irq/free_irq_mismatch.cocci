/// fix to pass correct device identity to free_irq()
///
/// Except File: drivers/net/ethernet/broadcom/bnx2x/bnx2x_cmn.c : special case that can not detect correctly
/// Except File: drivers/net/ethernet/sun/sunqe.c : special case that can not detect correctly
/// Except File: drivers/scsi/initio.c : special case that can not detect correctly
/// Except File: drivers/usb/host/xhci.c : special case that can not detect correctly
/// Except File: drivers/net/ethernet/mellanox/mlx4/eq.c : special case that can not detect correctly
/// Except File: drivers/scsi/ipr.c : special case that can not detect correctly
/// Except File: drivers/infiniband/hw/ocrdma/ocrdma_hw.c : special case that can not detect correctly
///
/// free_irq() expects the same device identity that was passed to
/// corresponding request_irq(), otherwise the IRQ is not freed.
///
@r exists@
expression irq, handler, flags, name, dev;
type T;
@@
(
 request_irq(irq, handler, flags, name, (T)dev)
|
 request_irq(irq, handler, flags, name, dev)
)

@ok1 depends on r@
expression r.irq, r.dev;
position p;
type T;
@@
(
free_irq@p(irq, dev);
|
free_irq@p(irq, (T)dev);
)

@r2 depends on r@
expression r.dev, E;
@@
(
E = dev;
|
dev = E;
)

@ok2 depends on r2@
expression r.irq, r2.E;
position p;
@@
 free_irq@p(irq, E);

@r3 depends on r@
expression r.dev, pdev;
@@
platform_set_drvdata(pdev, dev)

@ok3 depends on r3@
expression r.irq, r3.pdev;
expression E;
position p;
@@
 E = platform_get_drvdata(pdev)
<+...when any
 free_irq@p(irq, E);
...+>

@script:python depends on r@
dev << r.dev;
@@
if dev.find("[") != -1:
    cocci.include_match(False)

@depends on r@
expression r.irq, r.dev;
position p != {ok1.p, ok2.p, ok3.p};
@@
- free_irq@p(irq, ...);
+ free_irq(irq, dev);
... when != free_irq(irq, dev)
    when forall