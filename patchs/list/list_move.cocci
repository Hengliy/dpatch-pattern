/// use list_move instead of list_del/list_add
///
/// Using list_move() instead of list_del() + list_add().
///
@@
expression E1, E2;
@@
-list_del(E1);
-list_add(E1, E2);
+list_move(E1, E2);
