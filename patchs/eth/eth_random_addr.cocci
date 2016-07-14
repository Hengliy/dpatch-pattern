/// use eth_random_addr() to generate random MAC
///
/// Except File: include/linux/etherdevice.h : implementation file
///
/// Using eth_random_addr() to generate a random Ethernet
/// address (MAC) that is not multicast and has the local
/// assigned bit set. Not need to duplicating its implementation.
///
@change_random@
expression addr;
@@

-	get_random_bytes (addr, ETH_ALEN);
(
-	addr [0] &= 0xfe;
|
-	addr [0] &= ~0x01;
)
-	addr [0] |= 0x02;
+	eth_random_addr(addr);

@include depends on change_random@
@@

#include <linux/etherdevice.h>

@ no_include depends on !include && change_random@
@@

#include <linux/...>
+ #include <linux/etherdevice.h>
