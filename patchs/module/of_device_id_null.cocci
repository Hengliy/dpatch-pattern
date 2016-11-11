/// add terminate entry for of_device_id tables
///
/// Make sure of_device_id tables are NULL terminated.
///

@r1@
identifier ids;
position p;
@@
struct of_device_id ids@p[] = { ... };

@r2@
identifier drv, r1.ids;
identifier driver, fld;
type T;
@@
(
T drv = {
  ...,
  .fld = ids,
  ...
};
|
T drv = {
  ...,
  .driver = {
     ...,
     .fld = ids,
     ...
  },
  ...
};
)

@depends on r2@
identifier var, r1.ids;
expression E;
position r1.p;
@@
(
struct of_device_id ids@p[] = {
	...,
	{
	.var = E,
-	}
+	},
+	{ }
};
|
struct of_device_id ids@p[] = {
	...,
	{ ..., E, ... },
+	{ },
};
)
