/// use module_i2c_driver to simplify the code
///
/// Use the module_i2c_driver() macro to make the code smaller
/// and a bit simpler.
///
@r1@
identifier fn_init;
identifier driver;
@@
int fn_init(void)
{
	return i2c_add_driver(&driver);
}

@r2 depends on r1@
identifier fn_exit;
identifier r1.driver;
@@
void fn_exit(void)
{
	i2c_del_driver(&driver);
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
@@

-int fn_init(void)
-{
-	return i2c_add_driver(&driver);
-}

@exit depends on r1 && r2 && r3 && r4@
identifier r2.fn_exit;
identifier r1.driver;
declarer name module_i2c_driver;
@@

+ module_i2c_driver(driver);
-void fn_exit(void)
-{
-	i2c_del_driver(&driver);
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

