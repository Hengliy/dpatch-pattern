/// fix return value check in {{function}}
///
/// In case of error, the function clk_register_fixed_rate() returns
/// ERR_PTR() and never returns NULL. The NULL test in the return value
/// check should be replaced with IS_ERR().
///
@@
expression ret, E;
@@
ret = clk_register_fixed_rate(...);
... when != ret = E
(
- ret == NULL || IS_ERR(ret)
+ IS_ERR(ret)
|
- IS_ERR(ret) || ret == NULL
+ IS_ERR(ret)
|
- ret == NULL
+ IS_ERR(ret)
|
- ret != NULL
+ !IS_ERR(ret)
)

