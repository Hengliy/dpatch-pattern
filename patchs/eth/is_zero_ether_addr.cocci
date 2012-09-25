/// use is_zero_ether_addr() instead of memcmp()
///
/// Using is_zero_ether_addr() instead of directly use
/// memcmp() to determine if the ethernet address is all
/// zeros.
/// 
/// dpatch engine is used to auto generate this patch.
/// (https://github.com/weiyj/dpatch)
///
@r1@
expression addr;
@@
(
-	memcmp(addr, "\x00\x00\x00\x00\x00\x00", ETH_ALEN) == 0
+	is_zero_ether_addr(addr)
|
-	memcmp(addr, "\x0\x0\x0\x0\x0\x0", ETH_ALEN) == 0
+	is_zero_ether_addr(addr)
|
-	memcmp(addr, "\x00\x00\x00\x00\x00\x00", ETH_ALEN) != 0
+	!is_zero_ether_addr(addr)
|
-	memcmp(addr, "\x0\x0\x0\x0\x0\x0", ETH_ALEN) != 0
+	!is_zero_ether_addr(addr)
)

@d1@
type	T;
identifier zero_addr;
@@
(
	T zero_addr[] = {0};
|
	T zero_addr[] = {0, 0, 0, 0, 0, 0};
|
	T zero_addr[ETH_ALEN] = {0};
|
	T zero_addr[ETH_ALEN] = {0, 0, 0, 0, 0, 0};
)

@r2 depends on d1@
expression addr;
identifier d1.zero_addr;
@@

(
-	memcmp(zero_addr, addr, ETH_ALEN) == 0
+	is_zero_ether_addr(addr)
|
-	memcmp(zero_addr, addr, ETH_ALEN) != 0
+	!is_zero_ether_addr(addr)
|
-	memcmp(addr, zero_addr, ETH_ALEN) == 0
+	is_zero_ether_addr(addr)
|
-	memcmp(addr, zero_addr, ETH_ALEN) != 0
+	!is_zero_ether_addr(addr)
|
-	memcmp(zero_addr, addr, sizeof(zero_addr)) == 0
+	is_zero_ether_addr(addr)
|
-	memcmp(zero_addr, addr, sizeof(zero_addr)) != 0
+	!is_zero_ether_addr(addr)
|
-	memcmp(addr, zero_addr, sizeof(zero_addr)) == 0
+	is_zero_ether_addr(addr)
|
-	memcmp(addr, zero_addr, sizeof(zero_addr)) != 0
+	!is_zero_ether_addr(addr)
)

@d3 depends on r2 && d1@
identifier d1.zero_addr;
type d1.T;
@@
(
-	T zero_addr[] = {0};
|
-	T zero_addr[] = {0, 0, 0, 0, 0, 0};
|
-	T zero_addr[ETH_ALEN] = {0};
|
-	T zero_addr[ETH_ALEN] = {0, 0, 0, 0, 0, 0};
)

@include depends on r1 || r2@
@@

#include <linux/etherdevice.h>

@ no_include1 depends on !include && (r1 || r2)@
@@
  #include <linux/...>
+ #include <linux/etherdevice.h>

@ no_include2 depends on !include && !no_include1 && (r1 || r2)@
@@

+ #include <linux/etherdevice.h>
+ 
  #include "..."
