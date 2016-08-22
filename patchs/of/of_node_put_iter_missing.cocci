/// add missing of_node_put() in {{function}}
///
/// Options: -D patch
///
/// When terminating for_each_child_of_node() iteration with
/// break or return, of_node_put() should be used to prevent
/// stale device node references from being left behind.
///
/// This is detected by Coccinelle semantic patch.
///
virtual patch
virtual context
virtual org
virtual report

@r exists@
expression e;
local idexpression n;
iterator name for_each_node_by_name, for_each_node_by_type,
for_each_compatible_node, for_each_matching_node,
for_each_matching_node_and_match, for_each_child_of_node,
for_each_available_child_of_node, for_each_node_with_property;
iterator i;
position p1, p2;
statement S;
@@

(
(
for_each_child_of_node(..., n) S
|
for_each_node_by_name(n, ...) S
|
for_each_compatible_node(n, ...) S
|
for_each_matching_node(n, ...) S
|
for_each_matching_node_and_match(n, ...) S
|
for_each_child_of_node(..., n) S
|
for_each_available_child_of_node(..., n) S
|
for_each_node_with_property(n, ...) S
)
&
i@p1(...) {
  ... when != of_node_put(n)
      when != e = n
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

+ of_node_put(n);
? return@p2 ...;


@r2 exists@
expression e;
local idexpression n;
iterator i;
position p1, p2;
statement S;
@@

(
(
for_each_child_of_node(..., n) S
|
for_each_node_by_name(n, ...) S
|
for_each_compatible_node(n, ...) S
|
for_each_matching_node(n, ...) S
|
for_each_matching_node_and_match(n, ...) S
|
for_each_child_of_node(..., n) S
|
for_each_available_child_of_node(..., n) S
|
for_each_node_with_property(n, ...) S
)
&
i@p1(...) {
  ... when != of_node_put(n)
      when != e = n
  break@p2;
  ...
 }
)
... when != n

@t2 depends on patch && !context && !org && !report@
local idexpression r2.n;
position r2.p2;
@@

+ of_node_put(n);
? break@p2;

@t_context depends on !patch && (context || org || report)@
position r.p2;
position j0;
@@

*  return@j0@p2 ...;

@t2_context depends on !patch && (context || org || report)@
position r2.p2;
position j0;
@@

*  break@j0@p2;

// ----------------------------------------------------------------------------

@script:python t_org depends on org@
j0 << t_context.j0;
@@

msg = "ERROR: probable missing put."
coccilib.org.print_todo(j0[0], msg)

@script:python t2_org depends on org@
j0 << t2_context.j0;
@@

msg = "ERROR: probable missing put."
coccilib.org.print_todo(j0[0], msg)

// ----------------------------------------------------------------------------

@script:python t_report depends on report@
j0 << t_context.j0;
@@

msg = "ERROR: probable missing put."
coccilib.report.print_report(j0[0], msg)

@script:python t2_report depends on report@
j0 << t2_context.j0;
@@

msg = "ERROR: probable missing put."
coccilib.report.print_report(j0[0], msg)

