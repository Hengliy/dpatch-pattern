/// use module_fsl_mc_driver to simplify the code
///
/// module_fsl_mc_driver() makes the code simpler by eliminating
/// boilerplate code.
///
@r1@
identifier fn_init;
identifier driver;
@@
int fn_init(void)
{
	return fsl_mc_driver_register(&driver);
}

@r2 depends on r1@
identifier fn_exit;
identifier r1.driver;
@@
static void fn_exit(void)
{
	fsl_mc_driver_unregister(&driver);
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
declarer name module_fsl_mc_driver;
@@

-int fn_init(void)
-{
-	return fsl_mc_driver_register(&driver);
-}

@exit depends on r1 && r2 && r3 && r4@
identifier r2.fn_exit;
identifier r1.driver;
@@

-static void fn_exit(void)
-{
-	fsl_mc_driver_unregister(&driver);
-}
+ module_fsl_mc_driver(driver);

@depends on r1 && r2 && r3 && r4@
identifier r1.fn_init;
identifier r2.fn_exit;
@@
(
- module_init(fn_init);
|
- module_exit(fn_exit);
)

