/// use module_comedi_pci_driver to simplify the code
///
/// Fixed: module_comedi_pci_driver\(([^,]+),([^\)]+)\) ... module_comedi_pci_driver(\g<1>, \g<2>)
///
/// module_comedi_pci_driver() makes the code simpler by eliminating
/// boilerplate code.
///
@r1@
identifier fn_init;
identifier driver, pci;
@@
int fn_init(void)
{
	return comedi_pci_driver_register(&driver, &pci);
}

@r2 depends on r1@
identifier fn_exit;
identifier r1.driver;
@@
void fn_exit(void)
{
	comedi_pci_driver_unregister(&driver);
}

@r3 depends on r1@
declarer name module_init;
identifier r1.fn_init;
@@
module_init(fn_init);

@r4 depends on r2@
declarer name module_exit;
identifier r2.fn_exit;
@@
module_exit(fn_exit);

@init depends on r1 && r2 && r3 && r4@
identifier r1.fn_init;
identifier r1.driver, r1.pci;
declarer name module_comedi_pci_driver;
@@

-int fn_init(void)
-{
-	return comedi_pci_driver_register(&driver, &pci);
-}

@exit depends on r1 && r2 && r3 && r4@
identifier r2.fn_exit;
identifier r1.driver, r1.pci;
@@

+ module_comedi_pci_driver(driver, pci);
-void fn_exit(void)
-{
-	comedi_pci_driver_unregister(&driver);
-}

@depends on r1 && r2 && r3 && r4@
identifier r1.fn_init;
identifier r2.fn_exit;
@@
(
- module_init(fn_init);
|
- module_exit(fn_exit);
)

