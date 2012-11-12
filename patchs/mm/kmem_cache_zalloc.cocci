/// use kmem_cache_zalloc instead of kmem_cache_alloc/memset
///
/// Using kmem_cache_zalloc() instead of kmem_cache_alloc() and memset().
/// 
/// dpatch engine is used to auto generate this patch.
/// (https://github.com/weiyj/dpatch)
///
@@
expression E, E1, E2, E3;
@@
- 	E = kmem_cache_alloc(E1, E2);
+ 	E = kmem_cache_zalloc(E1, E2);
...
- 	memset(E, 0, sizeof(E3));

@@
expression E, E1, E2;
@@
- 	E = kmem_cache_alloc(E1, E2);
+ 	E = kmem_cache_zalloc(E1, E2);
...
- 	memset(E, 0, kmem_cache_size(E1));
