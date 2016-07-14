/// fix return value check in {{function}}
///
/// In case of error, the function pinctrl_register() returns
/// NULL not ERR_PTR(). The IS_ERR() test in the return value
/// check should be replaced with NULL test.
///
@@
expression ret, E;
@@
ret = pinctrl_register(...);
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

