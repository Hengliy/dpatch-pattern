/// use for_each_matching_node() macro
///
/// Fixed: for_each_matching_node\(([^,]+),([^ \)]+)\) ... for_each_matching_node(\g<1>, \g<2>)
///
/// Except File: include/linux/of.h : implementation file
///
/// Use for_each_matching_node() macro instead of open coding it.
///
@@
struct device_node *np;
expression matches;
statement S;
iterator name for_each_matching_node;
@@

-	for (np = NULL; (np = of_find_matching_node(np, matches)) != NULL;)
+	for_each_matching_node(np, matches)
		S

@@
struct device_node *np;
expression matches;
statement S;
@@

-	for (np = of_find_matching_node(NULL, matches); np != NULL; np = of_find_matching_node(np, matches))
+	for_each_matching_node(np, matches)
		S

@@
struct device_node *np;
expression matches;
statement S;
@@
-	np = NULL;
...
-	while ((np = of_find_matching_node(np, matches)) != NULL)
+	for_each_matching_node(np, matches)
		S

@@
expression matches;
statement S;
identifier np;
@@
-	struct device_node *np = NULL;
+	struct device_node *np;
...
-	while ((np = of_find_matching_node(np, matches)) != NULL)
+	for_each_matching_node(np, matches)
		S


