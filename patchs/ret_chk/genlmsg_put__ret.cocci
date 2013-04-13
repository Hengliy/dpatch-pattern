/// fix return value check in {{function}}
///
/// In case of error, the function genlmsg_put() returns NULL pointer
/// not ERR_PTR(). The IS_ERR() test in the return value check should
/// be replaced with NULL test.
/// 
///
@@
expression ret;
@@
ret = genlmsg_put(...);
<... 
(
- !IS_ERR(ret)
+ ret
|
- IS_ERR(ret)
+ !ret
|
- PTR_ERR(ret)
+ -EMSGSIZE
)
...>
