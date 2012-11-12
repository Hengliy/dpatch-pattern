/// using eth_hw_addr_random() for random MAC and set device flag
///
/// Except File: include/linux/etherdevice.h : implementation file
///
/// Using eth_hw_addr_random() to generate a random Ethernet address
/// (MAC) to be used by a net device and set addr_assign_type.
/// Not need to duplicating its implementation.
/// 
/// dpatch engine is used to auto generate this patch.
/// (https://github.com/weiyj/dpatch)
///
@@
struct net_device *dev;
@@

-	dev->addr_assign_type |= NET_ADDR_RANDOM;
-	random_ether_addr(dev->dev_addr);
+	eth_hw_addr_random(dev);

@@
struct net_device *dev;
@@

-	dev->addr_assign_type |= NET_ADDR_RANDOM;
-	eth_random_addr(dev->dev_addr);
+	eth_hw_addr_random(dev);

@@
struct net_device *dev;
@@

-	random_ether_addr(dev->dev_addr);
-	dev->addr_assign_type |= NET_ADDR_RANDOM;
+	eth_hw_addr_random(dev);

@@
struct net_device *dev;
@@

-	eth_random_addr(dev->dev_addr);
-	dev->addr_assign_type |= NET_ADDR_RANDOM;
+	eth_hw_addr_random(dev);
