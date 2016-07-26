/// kill unnecessary mutex_init()
///
/// Flags: 64
///
/// The mutex {{mutex}} is initialized statically. It is
/// unnecessary to initialize by mutex_init().
///

virtual content

@r1@
declarer name DEFINE_MUTEX;
identifier mutex;
@@

DEFINE_MUTEX(mutex);

@r2@
identifier r1.mutex;
@@

 mutex_init(&mutex);

@depends on !content@
identifier r1.mutex;
@@

- mutex_init(&mutex);

@script:python depends on r2 && content@
mutex << r1.mutex;
@@

msg = """The mutex '%s' is initialized statically. It is
unnecessary to initialize by mutex_init()."""

print msg % mutex

