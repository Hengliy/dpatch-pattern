/// use module_platform_driver_probe()
///
/// Fixed: module_platform_driver_probe\(([^,]+),([^\)]+)\) ... for_each_clear_bit(\g<1>, \g<2>)
///
/// module_platform_driver_probe() makes the code simpler by
/// eliminating boilerplate code.
///
@r1@
identifier fn_init;
identifier driver, probe;
@@
int fn_init(void)
{
	return platform_driver_probe(&driver, probe);
}

@r2 depends on r1@
identifier fn_exit;
identifier r1.driver;
@@
static void fn_exit(void)
{
	platform_driver_unregister(&driver);
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
identifier r1.driver;
identifier r1.probe;
declarer name module_platform_driver_probe;
@@

-int fn_init(void)
-{
-	return platform_driver_probe(&driver, probe);
-}

@exit depends on r1 && r2 && r3 && r4@
identifier r2.fn_exit;
identifier r1.driver;
@@

-static void fn_exit(void)
-{
-	platform_driver_unregister(&driver);
-}
+ module_platform_driver_probe(driver, probe);

@depends on r1 && r2 && r3 && r4@
identifier r1.fn_init;
identifier r2.fn_exit;
@@
(
- module_init(fn_init);
|
- module_exit(fn_exit);
)


