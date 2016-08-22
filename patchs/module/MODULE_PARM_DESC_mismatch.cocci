/// fix typo in parameter description
///
/// Options: -D context
///
/// Fix typo in parameter description.
///

virtual org
virtual report
virtual context

@r1@
identifier parm;
expression E;
position p;
declarer name MODULE_PARM_DESC;
@@

 MODULE_PARM_DESC@p(parm, E);

@r2@
identifier r1.parm;
expression E;
position p;
@@

 MODULE_PARM_DESC@p(parm, E);

@script:python depends on context@
ps << r1.p;
pr << r2.p;
@@

import os

if int(ps[0].line) == int(pr[0].line):
  cocci.include_match(False)

@depends on context@
identifier r1.parm;
expression r2.E;
position r2.p;
@@

* MODULE_PARM_DESC@p(parm, E);

@script:python depends on org@
parm << r1.parm;
p0 << r1.p;
ps << r1.p;
pr << r2.p;
@@

if int(ps[0].line) < int(pr[0].line):
  cocci.print_main(parm,p0)
  cocci.print_secs("s",ps)
  cocci.print_secs("r",pr)

@script:python depends on report@
parm << r1.parm;
p0 << r1.p;
ps << r1.p;
pr << r2.p;
@@

if int(ps[0].line) < int(pr[0].line):
  msg = "%s: first occurrence line %s, second occurrence line %s" % (parm,ps[0].line,pr[0].line)
  coccilib.report.print_report(p0[0],msg)

