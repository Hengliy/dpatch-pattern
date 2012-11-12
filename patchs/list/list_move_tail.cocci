/// use list_move_tail instead of list_del/list_add_tail
///
/// Using list_move_tail() instead of list_del() + list_add_tail().
/// 
/// dpatch engine is used to auto generate this patch.
/// (https://github.com/weiyj/dpatch)
///
@@
expression E1, E2;
@@
-list_del(E1);
-list_add_tail(E1, E2);
+list_move_tail(E1, E2);

