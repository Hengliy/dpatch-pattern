/// use for_each_node_by_type() macro
///
/// Fixed: for_each_node_by_type\(([^,]+),([^\)]+)\) ... for_each_node_by_type(\g<1>, \g<2>)
///
/// Except File: include/linux/of.h : implementation file
///
/// Use for_each_node_by_type() macro instead of open coding it.
///
@@
struct device_node *np;
expression type;
statement S;
iterator name for_each_node_by_type;
@@

-	for (np = NULL; (np = of_find_node_by_type(np, type)) != NULL;)
+	for_each_node_by_type(np, type)
		S

@@
struct device_node *np;
expression type;
statement S;
@@

-	for (np = of_find_node_by_type(NULL, type); np != NULL; np = of_find_node_by_type(np, type))
+	for_each_node_by_type(np, type)
		S

@@
struct device_node *np;
expression type;
statement S;
@@
-	np = NULL;
...
-	while ((np = of_find_node_by_type(np, type)) != NULL)
+	for_each_node_by_type(np, type)
		S

@@
expression type;
statement S;
identifier np;
@@
-	struct device_node *np = NULL;
+	struct device_node *np;
...
-	while ((np = of_find_node_by_type(np, type)) != NULL)
+	for_each_node_by_type(np, type)
		S
