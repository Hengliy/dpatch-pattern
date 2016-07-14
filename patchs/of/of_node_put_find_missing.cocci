/// add missing of_node_put() in {{function}}
///
/// Options: -D patch
///
/// This node pointer is returned by of_find_compatible_node() with
/// refcount incremented in this function. of_node_put() on it before
/// exitting this function.
///
/// Found by Coccinelle.
///
virtual patch
virtual context
virtual org
virtual report

@r exists@
local idexpression n;
statement S;
identifier fn;
position p1;
@@

n = \(
of_get_parent\|
of_get_next_parent\|
of_get_next_child\|
of_get_next_available_child\|
of_get_child_by_name\|
of_find_node_opts_by_path\|
of_find_node_by_name\|
of_find_node_by_type\|
of_find_compatible_node\|
of_find_node_with_property\|
of_find_matching_node_and_match\|
of_find_node_by_phandle\|
of_parse_phandle\|
of_find_next_cache_node\|
of_graph_get_port_by_id\|
of_graph_get_next_endpoint\|
of_graph_get_remote_port\|
of_graph_get_remote_port_parent\)(...)
...
if (!n) S
... when != of_node_put(n)
    when != of_platform_populate(n, ...)
    when any
    when strict
(
  of_node_put(n);
|
  return 0;
|
  return fn(...,n,...);
|
  return@p1 ...;
)

@t depends on patch && !context && !org && !report@
local idexpression r.n;
position r.p1;
@@
+ of_node_put(n);
? return@p1 ...;

@t_context depends on !patch && (context || org || report)@
position r.p1;
position j0;
@@

*  return@j0@p1 ...;

// ----------------------------------------------------------------------------

@script:python t_org depends on org@
j0 << t_context.j0;
@@

msg = "ERROR: probable missing put."
coccilib.org.print_todo(j0[0], msg)

// ----------------------------------------------------------------------------

@script:python t_report depends on report@
j0 << t_context.j0;
@@

msg = "ERROR: probable missing put."
coccilib.report.print_report(j0[0], msg)

