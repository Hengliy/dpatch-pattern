/// fix return value check in {{function}}
///
/// In case of error, the function clk_register() returns ERR_PTR()
/// and never returns NULL. The NULL test in the return value check
/// should be replaced with IS_ERR().
///

@r@
position p1;
int ret;
@@
ret = clk_register@p1(...);

@@
position p != r.p1;
expression ret, E;
@@
ret = clk_register@p(...);
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

