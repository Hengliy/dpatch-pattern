/// add missing fwnode_handle_put() in {{function}}
///
/// Options: -D patch
///
/// fwnode_handle_put() should be used when terminating
/// device_for_each_child_node() iteration with break or
/// return to prevent stale device node references from
/// being left behind.
///
/// Found by Coccinelle.
///
virtual patch
virtual context
virtual org
virtual report

@r exists@
local idexpression n;
iterator name device_for_each_child_node;
iterator i;
position p1, p2;
statement S;
@@

(
(
device_for_each_child_node(..., n) S
)
&
i@p1(...) {
  ... when != fwnode_handle_put(n)
(
    return n;
|
    return@p2 ...;
)
  ...
 }
)

@t depends on patch && !context && !org && !report@
local idexpression r.n;
position r.p2;
@@

+ fwnode_handle_put(n);
? return@p2 ...;

@t_context depends on !patch && (context || org || report)@
position r.p2;
position j0;
@@

*  return@j0@p2 ...;

// ----------------------------------------------------------------------------

@script:python t_org depends on org@
j0 << t_context.j0;
@@

msg = "ERROR: probable missing fwnode_handle_put."
coccilib.org.print_todo(j0[0], msg)

// ----------------------------------------------------------------------------

@script:python t_report depends on report@
j0 << t_context.j0;
@@

msg = "ERROR: probable missing fwnode_handle_put."
coccilib.report.print_report(j0[0], msg)

