/// fix wrong pointer passed to PTR_ERR()
///
/// PTR_ERR should access the value just tested by IS_ERR, otherwise
/// the wrong error code will be returned.
///
@ok1 exists@
expression x,e;
position p;
@@

if (IS_ERR(x=e) || ...) {
  <...
   PTR_ERR@p(x)
  ...>
}

@ok2 exists@
expression x,e1,e2;
position p;
@@

if (IS_ERR(x) || ...) {
  <...
(
   PTR_ERR@p(\(e1 ? e2 : x\|e1 ? x : e2\))
|
   PTR_ERR@p(x)
)
  ...>
}

@r1@
expression x,y;
position p != {ok1.p,ok2.p};
@@

if (IS_ERR(x) || ...) {
  ... when any
      when != IS_ERR(...)
(
  PTR_ERR(x)
|
  PTR_ERR@p(
-     y
+     x
  )
)
  ... when any
}

