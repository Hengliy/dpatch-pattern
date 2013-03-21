/// use free_netdev(netdev) instead of kfree()
///
/// Except File: net/core/dev.c : implementation file
///
/// Freeing netdev without free_netdev() leads to net, tx leaks.
/// And it may lead to dereferencing freed pointer.
///
@@
struct net_device *dev;
@@
- kfree(dev);
+ free_netdev(dev);
