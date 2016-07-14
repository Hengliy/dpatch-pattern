/// fix to pass correct device identity to request_irq()
///
/// Except File: drivers/net/ethernet/pasemi/pasemi_mac.c : special case that can not detect correctly
/// Except File: drivers/scsi/pm8001/pm8001_init.c : special case that can not detect correctly
/// Except File: drivers/scsi/eata_pio.c : special case that can not detect correctly
/// Except File: arch/avr32/oprofile/op_model_avr32.c : special case that can not detect correctly
/// Except File: drivers/video/ps3fb.c : special case that can not detect correctly
/// Except File: drivers/video/amifb.c : special case that can not detect correctly
/// Except File: drivers/dma/sa11x0-dma.c : special case that can not detect correctly
/// Except File: drivers/parport/parport_ip32.c : special case that can not detect correctly
///
/// The IRQ handler handler() use the device identity as
/// a type of XXX, we should pass correct device identity
/// to request_irq().
///
@r1@
identifier irq, dev_id;
identifier handler;
type T;
T info;
@@
handler(int irq, void *dev_id)
{
...
    info = dev_id
...
}

@r2@
expression irq, flags, name;
identifier r1.handler;
type r1.T;
T devid;
position p;
@@
(
request_irq@p(irq, handler, flags, name, devid)
|
request_irq@p(irq, handler, flags, name, (void *)devid)
)

@r3@
expression irq, flags, name, devid;
identifier r1.handler;
position p != r2.p;
@@
*request_irq@p(irq, handler, flags, name, devid)

