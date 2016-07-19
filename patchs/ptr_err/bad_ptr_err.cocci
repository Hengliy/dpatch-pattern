/// fix the error return code in {{function}}
///
/// The error return code PTR_ERR(ret) is always 0 since ret is
/// equal to 0 in this error handling case.
///

@@
expression ret, e;
@@
if (!ret) {
  <+... when != ret = e
*  PTR_ERR(ret)
  ...+>
}

@@
expression ret, e;
@@
if (IS_ERR(ret)) {
  <+...
  ret = NULL;
  ... when != ret = e
* PTR_ERR(ret)
  ...+>
}

