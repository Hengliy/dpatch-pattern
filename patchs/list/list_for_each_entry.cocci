/// convert list_for_each to entry variant
///
/// convert list_for_each() to list_for_each_entry() where
/// applicable.
///
@@
iterator name list_for_each;
iterator name list_for_each_entry;
expression ep, E, list;
identifier p;
@@
- struct list_head *p;
...
- list_for_each(p, E)
+ list_for_each_entry(ep, E, list)
{
-  ep = list_entry(p, ..., list);
    ...when != p
}


