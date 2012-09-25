/// fix to use list_for_each_safe() when delete list items
///
/// Except File: drivers/usb/gadget/dummy_hcd.c : special case that can not detector as ok
///
/// Since we will remove items off the list using list_del() we need
/// to use a safe version of the list_for_each() macro aptly named
/// list_for_each_safe(). 
///
/// dpatch engine is used to auto generate this patch.
/// (https://github.com/weiyj/dpatch)
///

@@
iterator name list_for_each;
expression E;
expression pos, head;
identifier l;
@@
*  list_for_each(pos, head)
{
...
*  \(list_del\|list_del_init\)(pos);
... when != \(goto l; \| break; \| return E; \| return;\)
}

@@
expression E;
expression pos, head, head2;
identifier l;
@@
*  list_for_each(pos, head)
{
...
*  \(list_move\|list_move_tail\)(pos, head2);
... when != \(goto l; \| break; \| return E; \| return;\)
}

@@
iterator name list_for_each_prev;
expression E;
expression pos, head;
identifier l;
@@
*  list_for_each_prev(pos, head)
{
...
*  \(list_del\|list_del_init\)(pos);
... when != \(goto l; \| break; \| return E; \| return;\)
}

@@
iterator name list_for_each_entry;
expression E;
expression pos, head;
identifier l, member;
@@

*  list_for_each_entry(pos, head, member)
{
...
*  \(list_del\|list_del_init\)(&pos->member);
... when != \(goto l; \| break; \| return E; \| return;\)
}

@@
iterator name list_for_each_entry_from;
expression E;
expression pos, head;
identifier l, member;
@@

*  list_for_each_entry_from(pos, head, member)
{
...
*  \(list_del\|list_del_init\)(&pos->member);
... when != \(goto l; \| break; \| return E; \| return;\)
}

@@
iterator name list_for_each_entry_reverse;
expression E;
expression pos, head;
identifier l, member;
@@

*  list_for_each_entry_reverse(pos, head, member)
{
...
*  \(list_del\|list_del_init\)(&pos->member);
... when != \(goto l; \| break; \| return E; \| return;\)
}
