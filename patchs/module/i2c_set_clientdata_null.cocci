/// remove unnecessary i2c_set_clientdata()
///
/// The driver core clears the driver data to NULL after device_release
/// or on probe failure. Thus, it is not needed to manually clear the
/// device driver data to NULL.
///

@@
expression client;
@@
- i2c_set_clientdata(client, NULL);
