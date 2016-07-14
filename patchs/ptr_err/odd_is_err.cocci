/// fix wrong pointer passed to IS_ERR()
///
/// Except File: fs/ecryptfs/keystore.c : false positive
/// Except File: fs/f2fs/gc.c : false positive
/// Except File: drivers/scsi/ufs/ufshcd-pltfrm.c : false positive
/// Except File: drivers/clk/ti/clkt_dflt.c : false positive
///
/// IS_ERR() should test XX instead of pointer b.
///

@ok1 exists@
expression x, E;
identifier fn != {PTR_ERR};
position p, p1;
@@

x = E(...);
... when != x = fn(...)
if@p1 (IS_ERR@p(x) || ...) {
...
}

@ok2 exists@
expression x, E;
identifier fn != {PTR_ERR};
position p, p1;
type T;
@@

x = E;
... when != x = fn(...)
if@p1 (IS_ERR@p((T *)x) || ...) {
...
}

@ok3 exists@
expression x, y;
identifier fn != {PTR_ERR};
position p, p1;
@@

x = PTR_ERR(y);
... when != x = fn(...)
if@p1 (IS_ERR@p(y) || ...) {
...
}

@r1 exists@
expression x, y, E != {strlen};
position p != {ok1.p, ok2.p, ok3.p};
position p1 != {ok1.p1, ok2.p1, ok3.p1};
@@

x = E(...);
if@p1 (IS_ERR@p(y) || ...) {
...
}

@depends on r1@
expression r1.x, r1.y;
position r1.p;
@@

- IS_ERR@p(y)
+ IS_ERR(x)
