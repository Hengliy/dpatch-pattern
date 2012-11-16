/// fix return value check in {{function}}
///
/// Except File: drivers/hid/hid-debug.c : special case that can handle null
///
/// In case of error, the function follow_page() returns ERR_PTR()
/// or NULL pointer. The NULL test in the error handling should be
/// replaced with IS_ERR_OR_NULL().
/// 
///
@@
expression ret, E;
@@
ret = follow_page(...);
... when != ret = E
    when != IS_ERR(ret)
(
ret == NULL || IS_ERR(ret)
|
IS_ERR(ret) || ret == NULL
|
IS_ERR_OR_NULL(ret)
|
ret != NULL && !IS_ERR(ret)
|
- ret == NULL
+ IS_ERR_OR_NULL(ret)
|
- ret != NULL
+ !IS_ERR_OR_NULL(ret)
|
- IS_ERR(ret)
+ IS_ERR_OR_NULL(ret)
)
... when != ret == NULL
    when != IS_ERR(ret)
