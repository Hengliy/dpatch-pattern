/// use eth_broadcast_addr() to assign broadcast address
///
/// Except File: include/linux/etherdevice.h : implementation file
///
/// Using eth_zero_addr() to assign broadcast address insetad
/// of memset() or an inefficient copy from a static array that
/// contains the all-ones broadcast address.
/// 
/// dpatch engine is used to auto generate this patch.
/// (https://github.com/weiyj/dpatch)
///
@r1@
expression addr;
@@
-	memset(addr, 0xff, ETH_ALEN)
+	eth_broadcast_addr(addr)

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
- memcpy(addr, bcast_addr, ETH_ALEN)
+ eth_broadcast_addr(addr)
|
- memcpy(addr, bcast_addr, sizeof(bcast_addr))
+ eth_broadcast_addr(addr)
|
- memcpy(addr, bcast_addr, sizeof(addr))
+ eth_broadcast_addr(addr)
)

@r3 depends on r2 && d1@
identifier d1.bcast_addr;
type d1.T;
@@
(
-	T bcast_addr[] = {0xff, 0xff, 0xff, 0xff, 0xff, 0xff};
|
-	T bcast_addr[ETH_ALEN] = {0xff, 0xff, 0xff, 0xff, 0xff, 0xff};
)

