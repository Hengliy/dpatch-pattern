/// fix return value check in {{function}}
///
/// In case of error, the function ioremap() returns NULL
/// not ERR_PTR(). The IS_ERR() test in the return value
/// check should be replaced with NULL test.
/// 
///
@@
expression ret;
@@
ret = ioremap(...);
<...
(
- !IS_ERR(ret)
+ ret
|
- IS_ERR(ret)
+ !ret
)
...>

