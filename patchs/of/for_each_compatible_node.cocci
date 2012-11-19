/// use for_each_compatible_node() macro
///
/// Fixed: for_each_compatible_node\(([^,]+),([^,]+),([^\)]+)\) ... for_each_compatible_node(\g<1>, \g<2>, \g<3>)
///
/// Except File: include/linux/of.h : implementation file
///
/// Use for_each_compatible_node() macro instead of open coding it.
///
@@
struct device_node *np;
expression type, compatible;
statement S;
iterator name for_each_compatible_node;
@@

-	for (np = of_find_compatible_node(NULL, type, compatible); np != NULL; np = of_find_compatible_node(np, type, compatible))
+	for_each_compatible_node(np, type, compatible)
		S

@@
struct device_node *np;
expression type, compatible;
statement S;
@@

-	for (np = NULL; (np = of_find_compatible_node(np, type, compatible)) != NULL;)
+	for_each_compatible_node(np, type, compatible)
		S

@@
expression type, compatible;
struct device_node *np;
statement S;
@@
-	np = NULL;
...
-	while ((np = of_find_compatible_node(np, type, compatible)) != NULL)
+	for_each_compatible_node(np, type, compatible)
		S

@@
expression type, compatible;
statement S;
identifier np;
@@
-	struct device_node *np = NULL;
+	struct device_node *np;
...
-	while ((np = of_find_compatible_node(np, type, compatible)) != NULL)
+	for_each_compatible_node(np, type, compatible)
		S

