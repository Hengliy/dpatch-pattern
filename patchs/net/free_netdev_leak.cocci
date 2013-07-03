/// add missing free_netdev() on error in {{function}}
///
/// Except File: drivers/net/ethernet/realtek/8139too.c : special case that can not detect correctly
///
/// Add the missing free_netdev() before return from function
/// {{function}} in the error handling case.
///
@ok exists@
expression E;
statement S;
position p;
@@
 E = \(alloc_etherdev_mq\|alloc_etherdev\)(...);
 if (E == NULL) S
 ...
 return E@p;

@r1 exists@
expression E;
expression E2 != {0};
statement S;
identifier l;
position p != { ok.p };
@@
 E = \(alloc_etherdev_mq\|alloc_etherdev\)(...);
  if (E == NULL) S
...
  if (...) {
    ... when != free_netdev(E);
        when != xemaclite_remove_ndev(E, ...);
        when != cleanup_dev(E);
        when != __rtl8139_cleanup_dev(E);
    goto l;
 }
...
l:
    ... when != free_netdev(E);
        when != xemaclite_remove_ndev(E, ...);
        when != cleanup_dev(E);
        when != __rtl8139_cleanup_dev(E);
    return E2@p;

@depends on r1@
identifier r1.l;
position r1.p;
expression r1.E, r1.E2;
@@
l:
   ...
+ free_netdev(E);
  return E2@p;

@@
expression E;
expression E2 != {0};
statement S;
@@
 E = \(alloc_etherdev_mq\|alloc_etherdev\)(...);
  if (E == NULL) S
<+...
(
  if (...) return E;
|
  if (...)
+ {
+   free_netdev(E);
    return E2;
+ }
)
...+>

@@
expression E;
expression E2 != {0};
statement S;
@@
 E = \(alloc_etherdev_mq\|alloc_etherdev\)(...);
  if (E == NULL) S
<+...
  if (...) {
    ... when != free_netdev(E);
        when != xemaclite_remove_ndev(E, ...);
        when != cleanup_dev(E);
        when != __rtl8139_cleanup_dev(E);
        when != AdapterFree(...);
+   free_netdev(E);
    return E2;
 }
...+>
