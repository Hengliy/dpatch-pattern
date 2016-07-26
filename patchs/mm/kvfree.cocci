/// use kvfree() in {{function}}
///
/// Use kvfree() instead of open-coding it.
///
@r@
expression addr;
@@

- if (is_vmalloc_addr(addr))
-     vfree(addr);
- else
-     kfree(addr);
+ kvfree(addr);
