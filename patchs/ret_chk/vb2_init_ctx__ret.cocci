/// fix return value check in {{function}}
///
/// In case of error, the function vb2_dma_contig_init_ctx() returns
/// ERR_PTR() and never returns NULL. The NULL test in the return value
/// check should be replaced with IS_ERR().
///
@@
expression ret, E;
@@
ret = vb2_dma_contig_init_ctx(...);
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

