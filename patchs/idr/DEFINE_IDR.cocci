/// use DEFINE_IDR() for idr
///
/// idr can be initialized automatically with DEFINE_IDR()
/// rather than explicitly calling idr_init().
///

@r@
identifier idr;
@@
struct idr idr;

@p1@
identifier r.idr;
@@
- idr_init(&idr);

@depends on p1@
identifier r.idr;
declarer name DEFINE_IDR;
@@
- struct idr idr;
+ DEFINE_IDR(idr);

