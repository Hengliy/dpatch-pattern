/// fix return value check in {{function}}
///
/// In case of error, the function anon_inode_getfile() returns
/// ERR_PTR() and never returns NULL. The NULL test in the return
/// value check should be replaced with IS_ERR().
///
@@
expression ret, E;
@@
ret = anon_inode_getfile(...);
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
