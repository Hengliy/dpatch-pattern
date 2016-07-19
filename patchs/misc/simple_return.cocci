/// simplify the return expression of {{function}}
///
/// Simplify the return expression.
///

@p1@
identifier fun, ret;
expression e;
type T;
@@
T fun(...) {
  ...
- ret =
+ return
  e;
- if (ret != 0)
-   return ret;
- return 0;
}

@p2 depends on p1@
identifier p1.fun, p1.ret;
type p1.T;
@@
T fun(...) {
  ...
- T ret;
  ... when != ret
  return ...;
}

