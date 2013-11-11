/// set correct platform drvdata in {{function}}
///
/// Except File: drivers/usb/gadget/dummy_hcd.c : special case that can not detect correctly
/// Except File: drivers/tty/serial/mpc52xx_uart.c : special case that can not detect correctly
///
/// The XXX() use the platform drvdata as
/// a type of XXX, we should pass correct platform drvdata
/// to platform_set_drvdata().
///
@r1@
expression pdev;
type T;
T data != {NULL};
@@
platform_set_drvdata(pdev, data)

@r2@
expression pdev;
type r1.T;
T data;
position p;
@@
data = platform_get_drvdata@p(pdev)

@r3 depends on r1@
expression data;
expression pdev;
position p != r2.p;
@@
* data = platform_get_drvdata@p(pdev)

@r4 depends on r3@
expression r1.pdev;
expression data != {NULL};
@@
* platform_set_drvdata(pdev, data)

@r11@
expression driver, pdev;
identifier dev;
type T;
T data;
@@
data = usb_create_hcd(driver, &pdev->dev, ...)
... when != platform_set_drvdata(pdev, ...)
    when forall

@r12@
expression r11.pdev;
type r11.T;
T data;
position p;
@@
data = platform_get_drvdata@p(pdev)

@r13 depends on r11@
expression data;
expression r11.pdev;
position p != r12.p;
@@
* data = platform_get_drvdata@p(pdev)

@r14 depends on r13@
expression r11.driver, r11.pdev;
identifier r11.dev;
@@
* usb_create_hcd(driver, &pdev->dev, ...)

@r21@
type T;
T card;
@@
snd_soc_register_card(card)
... when != platform_set_drvdata(...)
    when forall

@r22@
expression pdev;
type r21.T;
T data;
position p;
@@
data = platform_get_drvdata@p(pdev)

@r23 depends on r21@
expression data;
expression pdev;
position p != r22.p;
@@
* data = platform_get_drvdata@p(pdev)

@r24 depends on r23@
expression card;
@@
* snd_soc_register_card(card)
