/// remove redundant return value check of platform_get_resource()
///
/// Except File: drivers/pinctrl/pinctrl-bcm281xx.c : special case that can not detect correctly
///
/// Remove unneeded error handling on the result of a call
/// to platform_get_resource() when the value is passed to
/// devm_ioremap_resource().
/// 
/// And move those two call together
/// to make the connection between them more clear.
///
@@
expression pdev, res, n, t, e, e1;
expression ret != 0;
identifier l;
@@

- res = platform_get_resource(pdev, t, n);
  ... when != res
- if (res == NULL) { ... \(goto l;\|return ret;\) }
  ... when != res
+ res = platform_get_resource(pdev, t, n);
  e = devm_ioremap_resource(e1, res);

@@
type T;
expression pdev, n, t, e, e1;
expression ret != 0;
identifier l, res;
@@
(
- T res = platform_get_resource(pdev, t, n);
+ T res;
  ... when != res
- if (res == NULL) { ... \(goto l;\|return ret;\) }
  ... when != res
+ res = platform_get_resource(pdev, t, n);
  e = devm_ioremap_resource(e1, res);
|
 res = platform_get_resource(pdev, t, n)
  ... when != res
- if (res == NULL) { ... \(goto l;\|return ret;\) }
  ... when != res
  e = devm_ioremap_resource(e1, res);
)
