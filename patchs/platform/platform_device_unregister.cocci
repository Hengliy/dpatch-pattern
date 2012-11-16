/// use platform_device_unregister in {{function}}
///
/// Except File: drivers/base/platform.c : implementation file
///
/// platform_device_unregister() only calls platform_device_del() and
/// platform_device_put(), thus use platform_device_unregister() to
/// simplify the code.
/// 
/// Also the documents in platform.c shows that platform_device_del
/// and platform_device_put must _only_ be externally called in error
/// cases.  All other usage is a bug.
///

@@
expression pdev;
@@
- platform_device_del(pdev);
- platform_device_put(pdev);
+ platform_device_unregister(pdev);
