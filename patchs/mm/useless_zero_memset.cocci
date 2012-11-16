/// remove useless set memory to zero use memset()
///
/// The memory return by kzalloc() or kmem_cache_zalloc() has already
/// be set to zero, so remove useless memset(0).
///
@@
expression E, E1;
statement S;
@@

  E = kmem_cache_zalloc(...);
(
  if (unlikely(E==NULL) || ...) S
|
  if ((E==NULL) || ...) S
)
- memset(E, 0, E1);

@@
expression E, E1;
statement S;
@@
  E = kzalloc(...);
(
  if (unlikely(E==NULL) || ...) S
|
  if ((E==NULL) || ...) S
)
- memset(E, 0, E1);

