/// fix return value check in {{function}}
///
/// Except File: arch/powerpc/platforms/pseries/dlpar.c : static derive_parent() function
/// Except File: fs/inode.c : static find_inode() function return NULL
/// Except File: drivers/clocksource/pxa_timer.c : special case that can not detect correctly
///
/// In case of error, the function clk_get() returns ERR_PTR()
/// and never returns NULL. The NULL test in the return value
/// check should be replaced with IS_ERR().
///
@@
expression ret, E;
@@
ret = clk_get(...);
... when != ret = E
(
- ret == NULL || IS_ERR(ret)
+ IS_ERR(ret)
|
- IS_ERR(ret) || ret == NULL
+ IS_ERR(ret)
|
- ret != NULL && !IS_ERR(ret)
+ !IS_ERR(ret)
|
- !IS_ERR(ret) && ret != NULL
+ !IS_ERR(ret)
|
- ret == NULL
+ IS_ERR(ret)
|
- ret != NULL
+ !IS_ERR(ret)
)
