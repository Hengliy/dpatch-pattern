/// fix potential NULL dereference in {{function}}
///
/// platform_get_resource() may return NULL, add proper
/// check to avoid potential NULL dereferencing.
///
/// This is detected by Coccinelle semantic patch.
///
/// @@
/// expression pdev, res, n, t, e, e1, e2;
/// @@
///
///  res = platform_get_resource(pdev, t, n);
/// + if (!res)
/// +   return -EINVAL;
///  ... when != res == NULL
///  e = devm_ioremap(e1, res->start, e2);
///

@@
expression pdev, res, n, t, e, e1, e2;
@@

  res = platform_get_resource(pdev, t, n);
+ if (!res)
+   return -EINVAL;
  ... when != res == NULL
  e = devm_ioremap(e1, res->start, e2);
