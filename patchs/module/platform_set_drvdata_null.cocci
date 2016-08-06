/// remove unnecessary platform_set_drvdata()
///
/// The driver core clears the driver data to NULL after device_release
/// or on probe failure. Thus, it is not needed to manually clear the
/// device driver data to NULL.
///

@@
expression pdev;
@@
- platform_set_drvdata(pdev, NULL);

