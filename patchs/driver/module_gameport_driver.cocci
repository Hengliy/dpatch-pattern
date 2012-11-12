/// use module_gameport_driver to simplify the code
///
/// Use the module_gameport_driver() macro to make the code simpler
/// by eliminating module_init and module_exit calls.
/// 
/// dpatch engine is used to auto generate this patch.
/// (https://github.com/weiyj/dpatch)
///

@r1@
identifier fn_init;
identifier driver;
@@
int fn_init(void)
{
	return gameport_register_driver(&driver);
}

@r2 depends on r1@
identifier fn_exit;
identifier r1.driver;
@@
static void fn_exit(void)
{
	gameport_unregister_driver(&driver);
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
declarer name module_gameport_driver;
@@

-int fn_init(void)
-{
-	return gameport_register_driver(&driver);
-}

@exit depends on r1 && r2 && r3 && r4@
identifier r2.fn_exit;
identifier r1.driver;
@@

-static void fn_exit(void)
-{
-	gameport_unregister_driver(&driver);
-}
+ module_gameport_driver(driver);

@depends on r1 && r2 && r3 && r4@
identifier r1.fn_init;
identifier r2.fn_exit;
@@
(
- module_init(fn_init);
|
- module_exit(fn_exit);
)

