/// use for_each_child_of_node() macro
///
/// Fixed: for_each_child_of_node\(([^,]+),([^\)]+)\) ... for_each_child_of_node(\g<1>, \g<2>)
///
/// Except File: include/linux/of.h : implementation file
///
/// Use for_each_child_of_node() macro instead of open coding it.
///
@@
struct device_node *parent;
struct device_node *child;
statement S;
iterator name for_each_child_of_node;
@@

-	for (child = NULL; (child = of_get_next_child(parent, child)) != NULL;)
+	for_each_child_of_node(parent, child)
		S

@@
struct device_node *parent;
struct device_node *child;
statement S;
@@

-	for (child = of_get_next_child(parent, NULL); child != NULL; child = of_get_next_child(parent, child))
+	for_each_child_of_node(parent, child)
		S

@@
struct device_node *parent;
struct device_node *child;
statement S;
@@
-	child = NULL;
...
-	while ((child = of_get_next_child(parent, child)) != NULL)
+	for_each_child_of_node(parent, child)
		S

@@
struct device_node *parent;
statement S;
identifier np;
@@
-	struct device_node *np = NULL;
+	struct device_node *np;
...
-	while ((np = of_get_next_child(parent, np)) != NULL)
+	for_each_child_of_node(parent, np)
		S

