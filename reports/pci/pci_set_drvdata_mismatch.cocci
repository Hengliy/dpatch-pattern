/// set correct pci drvdata in {{function}}
///
/// Except File: drivers/tty/serial/mfd.c : special case that can not detect correctly
/// Except File: drivers/misc/ibmasm/module.c : special case that can not detect correctly
///
/// The XXX() use the pci drvdata as a type
/// of XXX, we should pass correct pci drvdata
/// to pci_set_drvdata().
///

@r1@
expression pdev;
type T;
T data != {NULL};
@@
pci_set_drvdata(pdev, data)

@r2@
expression r1.pdev;
type r1.T;
T data;
position p;
@@
data = pci_get_drvdata@p(pdev)

@r3@
expression data;
expression r1.pdev;
position p != r2.p;
@@
* data = pci_get_drvdata@p(pdev)

