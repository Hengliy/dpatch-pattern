/// use eth_zero_addr() to assign zero address
///
/// Except File: include/linux/etherdevice.h : implementation file
///
/// Using eth_zero_addr() to assign zero address insetad of
/// memset() or an inefficient copy from a static array.
///
@d1@
identifier zero != {strIssueBssid, granted_mac};
type	T;
@@
(
	T zero[] = {0};
|
	T zero[] = {0, 0, 0, 0, 0, 0};
|
	T zero[ETH_ALEN] = {0};
|
	T zero[ETH_ALEN] = {0, 0, 0, 0, 0, 0};
)

@r1 depends on d1@
expression addr;
identifier d1.zero;
@@
(
- memcpy(addr, zero, ETH_ALEN)
+ eth_zero_addr(addr)
|
- memcpy(addr, zero, sizeof(zero))
+ eth_zero_addr(addr)
|
- memcpy(addr, zero, sizeof(addr))
+ eth_zero_addr(addr)
)

@r2 depends on r1 && d1@
identifier d1.zero;
type d1.T;
@@
(
-	T zero[] = {0};
|
-	T zero[] = {0, 0, 0, 0, 0, 0};
|
-	T zero[ETH_ALEN] = {0};
|
-	T zero[ETH_ALEN] = {0, 0, 0, 0, 0, 0};
)

@r3@
expression addr;
@@
-	memset(addr, 0x00, ETH_ALEN)
+	eth_zero_addr(addr)

