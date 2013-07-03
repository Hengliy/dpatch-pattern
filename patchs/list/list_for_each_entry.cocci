/// convert list_for_each to entry variant
///
/// Except File: drivers/staging/rtl8187se/ieee80211/ieee80211_rx.c : special case that can not detect correctly
/// Except File: drivers/net/wireless/ipw2x00/ipw2200.c : special case that can not detect correctly
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


