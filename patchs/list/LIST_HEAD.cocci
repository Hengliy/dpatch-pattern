/// use LIST_HEAD() for list head
///
/// list_head can be initialized automatically with LIST_HEAD()
/// rather than explicitly calling INIT_LIST_HEAD().
///

@r@
identifier list;
@@
struct list_head list;

@p1@
identifier r.list;
@@
- INIT_LIST_HEAD(&list);

@depends on p1@
identifier r.list;
declarer name LIST_HEAD;
@@
- struct list_head list;
+ LIST_HEAD(list);

