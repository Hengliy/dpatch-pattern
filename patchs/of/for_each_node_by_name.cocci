/// use for_each_node_by_name() macro
///
/// Fixed: for_each_node_by_name\(([^,]+),([^\)]+)\) ... for_each_node_by_name(\g<1>, \g<2>)
///
/// Except File: include/linux/of.h : implementation file
///
/// Use for_each_node_by_name() macro instead of open coding it.
///
@@
struct device_node *np;
expression name;
statement S;
iterator name for_each_node_by_name;
@@

-	for (np = NULL; (np = of_find_node_by_name(np, name)) != NULL;)
+	for_each_node_by_name(np, name)
		S

@@
struct device_node *np;
expression name;
statement S;
@@

-	for (np = of_find_node_by_name(NULL, name); np != NULL; np = of_find_node_by_name(np, name))
+	for_each_node_by_name(np, name)
		S

@@
struct device_node *np;
expression name;
statement S;
@@
-	np = NULL;
...
-	while ((np = of_find_node_by_name(np, name)) != NULL)
+	for_each_node_by_name(np, name)
		S

@@
expression name;
statement S;
identifier np;
@@
-	struct device_node *np = NULL;
+	struct device_node *np;
...
-	while ((np = of_find_node_by_name(np, name)) != NULL)
+	for_each_node_by_name(np, name)
		S


