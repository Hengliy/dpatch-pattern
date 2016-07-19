/// drop pointless static qualifier in {{function}}
///
/// There is no need to have the 'T *v' variable static
/// since new value always be assigned before use it.
///

virtual context
virtual patch
virtual org
virtual report
virtual content

@r1@
identifier func, v;
expression E;
position p, p2;
type T, T2;
@@

T func(...)
{
  ...
  static T2 v@p;
  ... when != v
  v@p2 = E
  ...
}

@ok1@
identifier r1.func, r1.v;
expression r1.E;
position r1.p, r1.p2;
type r1.T, r1.T2;
@@

T func(...)
{
  ...
  static T2 v@p;
  ... when != v
  if (...) {
    ...
    v@p2 = E
    ...
  }
  ...
}

@depends on r1 && !ok1 && !patch && context@
identifier r1.func, r1.v;
expression r1.E;
position r1.p;
type r1.T, r1.T2;
@@

T func(...)
{
  ...
*  static T2 v@p;
  ... when != v
*  v = E
  ...
}

@depends on r1 && !ok1 && patch && !context@
identifier r1.func, v;
type T, T2;
@@

T func(...)
{
  ...
- static
  T2 v;
  ...
}

@script:python depends on content && r1 && !ok1@
T2 << r1.T2;
v << r1.v;
@@

msg = """There is no need to have the '%s%s' variable
static since new value always be assigned before use it."""

print msg % (T2, v)

@script:python depends on org && r1 && !ok1@
p << r1.p;
@@

msg="WARNING: useless static qualifier"
coccilib.org.print_todo(p[0], msg)

@script:python depends on report && r1 && !ok1@
p << r1.p;
@@

msg="WARNING: useless static qualifier"
coccilib.report.print_report(p[0], msg)
