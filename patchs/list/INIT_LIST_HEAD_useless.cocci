/// kill unnecessary INIT_LIST_HEAD()
///
/// Flags: 64
///
/// The list_head {{head}} is initialized statically. It is
/// unnecessary to initialize by INIT_LIST_HEAD().
///

virtual content

@r1@
declarer name LIST_HEAD;
identifier lname;
@@

LIST_HEAD(lname);

@r2@
identifier r1.lname;
@@

 INIT_LIST_HEAD(&lname);

@depends on !content@
identifier r1.lname;
@@

- INIT_LIST_HEAD(&lname);

@script:python depends on r2 && content@
lname << r1.lname;
@@

msg = """The list_head '%s' is initialized statically. It is
unnecessary to initialize by INIT_LIST_HEAD()."""

print msg % lname

