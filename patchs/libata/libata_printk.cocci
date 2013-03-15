/// convert ata_<foo>_printk() to ata_<foo>_<level>()
///
/// Except File: include/linux/libata.h : special case that can not detect correctly
///
/// Using ata_<foo>_<level>() instead of ata_<foo>_printk().
///
@@
expression ap;
@@
- ata_port_printk(ap,
+ ata_port_err(ap,
- "KERN_ERR",
...)

@@
expression ap;
@@
- ata_port_printk(ap,
+ ata_port_warn(ap,
- "KERN_WARNING",
...)

@@
expression ap;
@@
- ata_port_printk(ap,
+ ata_port_notice(ap,
- "KERN_NOTICE",
...)

@@
expression ap;
@@
- ata_port_printk(ap,
+ ata_port_info(ap,
- "KERN_INFO",
...)

@@
expression ap;
@@
- ata_port_printk(ap,
+ ata_port_dbg(ap,
- "KERN_DEBUG",
...)

@@
expression link;
@@
- ata_link_printk(link,
+ ata_link_err(link,
- "KERN_ERR",
...)

@@
expression link;
@@
- ata_link_printk(link,
+ ata_link_warn(link,
- "KERN_WARNING",
...)

@@
expression link;
@@
- ata_link_printk(link,
+ ata_link_notice(link,
- "KERN_NOTICE",
...)

@@
expression link;
@@
- ata_link_printk(link,
+ ata_link_info(link,
- "KERN_INFO",
...)

@@
expression link;
@@
- ata_link_printk(link,
+ ata_link_dbg(link,
- "KERN_DEBUG",
...)

@@
expression dev;
@@
- ata_dev_printk(dev,
+ ata_dev_err(dev,
- "KERN_ERR",
...)

@@
expression dev;
@@
- ata_dev_printk(dev,
+ ata_dev_warn(dev,
- "KERN_WARNING",
...)

@@
expression dev;
@@
- ata_dev_printk(dev,
+ ata_dev_notice(dev,
- "KERN_NOTICE",
...)

@@
expression dev;
@@
- ata_dev_printk(dev,
+ ata_dev_info(dev,
- "KERN_INFO",
...)

@@
expression dev;
@@
- ata_dev_printk(dev,
+ ata_dev_dbg(dev,
- "KERN_DEBUG",
...)

