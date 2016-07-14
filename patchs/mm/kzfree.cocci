/// use kzfree instead of memset/kfree
///
/// Using kzfree() instead of memset() and kfree().
///

@r@
expression E;
@@
- memset(E, 0, ...);
... when != E
- kfree(E);
+ kzfree(E);

@depends on r@
expression E;
@@
- if (E) {
	kzfree(E);
- }
