/// add missing i2c_set_clientdata() in {{function}}
///
/// Add missing i2c_set_clientdata() in {{function}}, otherwise
/// calling i2c_get_clientdata() in remove returns NULL.
///

@r1@
identifier fn_probe;
identifier fn_remove;
identifier driver;
@@
struct i2c_driver driver = {
...,
  .probe = fn_probe,
  .remove = fn_remove,
...
};

@r2 depends on r1@
identifier r1.fn_remove;
expression data;
identifier client;
@@
int fn_remove(struct i2c_client *client)
{
  ...
  data = i2c_get_clientdata(client)
  ...
}

@depends on r2@
identifier r1.fn_probe;
expression r2.data, E;
identifier client, id;
@@
int fn_probe(struct i2c_client *client, const struct i2c_device_id *id)
{
  ... when != i2c_set_clientdata(client, E)
      when != dev_set_drvdata(&client->dev, E)
      when != dev_set_drvdata(E, data)
      when != cyttsp4_probe(...)
      when != st_sensors_i2c_configure(...)
      when != v4l2_i2c_subdev_init(...)
      when != data = i2c_get_clientdata(client)
      when forall
+ i2c_set_clientdata(client, data);
? return 0;
}

