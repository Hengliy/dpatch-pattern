/// avoid calling platform_device_put() twice in {{function}}
///
/// In case of error, the function {{function}} need to call
/// platform_device_del() instead of platform_device_unregister().
/// Otherwise, we will call platform_device_put() twice.
///
@@
expression pdev, E;
@@
- platform_device_unregister(pdev);
+ platform_device_del(pdev);
... when != pdev = E
  platform_device_put(pdev);

