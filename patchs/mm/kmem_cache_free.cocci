/// use kmem_cache_free() instead of kfree()
///
/// memory allocated by kmem_cache_alloc() should be freed using
/// kmem_cache_free(), not kfree().
///

@e@
type T;
expression c;
identifier x;
@@
(
T x;
...
 x = \(kmem_cache_alloc\|kmem_cache_zalloc\|kmem_cache_alloc_node\)(c,...);
|
T x= \(kmem_cache_alloc\|kmem_cache_zalloc\|kmem_cache_alloc_node\)(c,...);
)

@ok@
identifier x;
expression E;
position p1;
@@
 x = \(kmalloc\|kzalloc\)(...);
 ... when != x = E
     when != &x
 kfree@p1(x);

@@
expression e.c;
identifier e.x;
position p != {ok.p1};
@@
- kfree@p(x);
+ kmem_cache_free(c, x);

@bad@
expression x, E, c;
@@
 x = \(kmem_cache_alloc\|kmem_cache_zalloc\|kmem_cache_alloc_node\)(c,...)
 ... when != x = E
     when != &x
?-kfree(x)
+ kmem_cache_free(c,x)


