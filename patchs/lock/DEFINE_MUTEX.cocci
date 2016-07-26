/// use DEFINE_MUTEX() for mutex lock
///
/// mutex lock can be initialized automatically with DEFINE_MUTEX()
/// rather than explicitly calling mutex_init().
///

@r@
identifier lock;
@@
struct mutex lock;

@p1@
identifier r.lock;
@@
- mutex_init(&lock);

@depends on p1@
identifier r.lock;
declarer name DEFINE_MUTEX;
@@
- struct mutex lock;
+ DEFINE_MUTEX(lock);

