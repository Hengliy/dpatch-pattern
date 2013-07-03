/// remove redundant dev_err call in {{function}}
///
/// There is a error message within devm_ioremap_resource
/// already, so remove the dev_err call to avoid redundant
/// error message.
///
@@
expression E, dev;
@@
E = devm_ioremap_resource(dev, ...);
if (IS_ERR(E))
- {
-    \(dev_dbg\|dev_err\|pr_debug\|pr_err\|DRM_ERROR\)(...);
    return PTR_ERR(E);
- }

@@
expression E, dev;
identifier l;
@@
E = devm_ioremap_resource(dev, ...);
if (<+...E...+>) {
  ... when != goto l;
      when forall
-    \(dev_dbg\|dev_err\|pr_debug\|pr_err\|DRM_ERROR\)(...);
  ...
}
