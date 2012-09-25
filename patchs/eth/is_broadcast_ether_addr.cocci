/// use is_broadcast_ether_addr() instead of memcmp()
///
/// Using is_broadcast_ether_addr() instead of directly use
/// memcmp() to determine if the ethernet address is broadcast
/// address.
///
/// dpatch engine is used to auto generate this patch.
/// (https://github.com/weiyj/dpatch)
///

@r1@
expression addr;
@@
(
-	memcmp(addr, "\xff\xff\xff\xff\xff\xff", ETH_ALEN) == 0
+	is_broadcast_ether_addr(addr)
|
-	memcmp(addr, "\xff\xff\xff\xff\xff\xff", ETH_ALEN) != 0
+	!is_broadcast_ether_addr(addr)
)

@d1@
type	T;
identifier bcast_addr;
@@
(
	T bcast_addr[] = {0xff, 0xff, 0xff, 0xff, 0xff, 0xff};
|
	T bcast_addr[ETH_ALEN] = {0xff, 0xff, 0xff, 0xff, 0xff, 0xff};
)

@r2 depends on d1@
expression addr;
identifier d1.bcast_addr;
@@

(
-	memcmp(bcast_addr, addr, ETH_ALEN) == 0
+	is_broadcast_ether_addr(addr)
|
-	memcmp(bcast_addr, addr, ETH_ALEN) != 0
+	!is_broadcast_ether_addr(addr)
|
-	memcmp(addr, bcast_addr, ETH_ALEN) == 0
+	is_broadcast_ether_addr(addr)
|
-	memcmp(addr, bcast_addr, ETH_ALEN) != 0
+	!is_broadcast_ether_addr(addr)
|
-	memcmp(bcast_addr, addr, sizeof(bcast_addr)) == 0
+	is_broadcast_ether_addr(addr)
|
-	memcmp(bcast_addr, addr, sizeof(bcast_addr)) != 0
+	!is_broadcast_ether_addr(addr)
|
-	memcmp(addr, bcast_addr, sizeof(bcast_addr)) == 0
+	is_broadcast_ether_addr(addr)
|
-	memcmp(addr, bcast_addr, sizeof(bcast_addr)) != 0
+	!is_broadcast_ether_addr(addr)
)

@d3 depends on r2 && d1@
identifier d1.bcast_addr;
type d1.T;
@@
(
-	T bcast_addr[] = {0xff, 0xff, 0xff, 0xff, 0xff, 0xff};
|
-	T bcast_addr[ETH_ALEN] = {0xff, 0xff, 0xff, 0xff, 0xff, 0xff};
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

