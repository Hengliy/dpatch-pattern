/// fix return value check in {{function}}
///
/// In case of error, the function rpcauth_create() returns ERR_PTR()
/// and never returns NULL. The NULL test in the return value check
/// should be replaced with IS_ERR().
/// 
/// dpatch engine is used to auto generate this patch.
/// (https://github.com/weiyj/dpatch)
///
@@
expression ret, E;
@@
ret = rpcauth_create(...);
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

