/// use vzalloc() instead of vmalloc()/memset(0)
///
/// Use vzalloc() instead of vmalloc() and memset(0).
///
@@
expression E, size;
@@
- 	E = vmalloc(size);
+ 	E = vzalloc(size);
...
- 	memset(E, 0, size);

