/// fix return value check in {{function}}
///
/// In case of error, the function pinctrl_register() returns
/// ERR_PTR() not NULL. The NULL test in the return value check
/// should be replaced with IS_ERR().
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

