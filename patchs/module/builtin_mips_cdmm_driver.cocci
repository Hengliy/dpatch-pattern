/// use builtin_mips_cdmm_driver to simplify the code
///
/// Use the builtin_platform_driver() macro to make the code simpler.
///

@r1@
identifier fn_init;
identifier driver;
@@
int fn_init(void)
{
	return mips_cdmm_driver_register(&driver);
}

@r2 depends on r1@
declarer name device_initcall;
identifier r1.fn_init;
@@
device_initcall(fn_init);

@init depends on r1 && r2@
identifier r1.fn_init;
identifier r1.driver;
@@

-int fn_init(void)
-{
-	return mips_cdmm_driver_register(&driver);
-}

@depends on r1 && r2@
identifier r1.fn_init;
identifier r1.driver;
declarer name builtin_mips_cdmm_driver;
@@
- device_initcall(fn_init);
+ builtin_mips_cdmm_driver(driver);
