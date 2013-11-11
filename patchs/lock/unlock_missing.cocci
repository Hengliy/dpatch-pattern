/// fix missing unlock on error in {{function}}
///
/// Except File: net/sunrpc/rpc_pipe.c : special case that can not detect correctly
/// Except File: net/irda/irlmp.c : special case that can not detect correctly
/// Except File: lib/dec_and_lock.c : special case that can not detect correctly
/// Except File: kernel/workqueue.c : special case that can not detect correctly
/// Except File: kernel/signal.c : special case that can not detect correctly
/// Except File: fs/ntfs/mft.c : special case that can not detect correctly
/// Except File: fs/namespace.c : special case that can not detect correctly
/// Except File: fs/mbcache.c : special case that can not detect correctly
/// Except File: drivers/usb/chipidea/udc.c : special case that can not detect correctly
/// Except File: drivers/tty/isicom.c : special case that can not detect correctly
/// Except File: drivers/s390/scsi/zfcp_qdio.c : special case that can not detect correctly
/// Except File: drivers/net/wireless/b43/main.c : special case that can not detect correctly
/// Except File: drivers/gpu/drm/nouveau/core/core/engctx.c : special case that can not detect correctly
/// Except File: drivers/block/loop.c : special case that can not detect correctly
/// Except File: arch/powerpc/platforms/wsp/wsp_pci.c : special case that can not detect correctly
/// Except File: arch/hexagon/kernel/traps.c : special case that can not detect correctly
/// Except File: arch/alpha/lib/dec_and_lock.c : special case that can not detect correctly
/// Except File: net/ipv4/ipmr.c : special case that can not detect correctly
/// Except File: net/ipv6/ip6mr.c : special case that can not detect correctly
/// Except File: drivers/vfio/vfio.c : special case that can not detect correctly
/// Except File: drivers/gpu/drm/ttm/ttm_bo.c : special case that can not detect correctly
/// Except File: net/ceph/messenger.c : special case that can not detect correctly
/// Except File: drivers/dma/ioat/dma_v2.c : special case that can not detect correctly
/// Except File: mm/memcontrol.c : special case that can not detect correctly
/// Except File: fs/autofs4/root.c : special case that can not detect correctly
/// Except File: ipc/util.c : special case that can not detect correctly
/// Except File: include/linux/kref.h : special case that can not detect correctly
/// Except File: drivers/staging/lustre/lnet/selftest/rpc.c : special case that can not detect correctly
/// Except File: drivers/staging/lustre/lnet/selftest/framework.c : special case that can not detect correctly
/// Except File: net/ipv4/udp.c : special case that can not detect correctly
/// Except File: net/llc/llc_proc.c : special case that can not detect correctly
/// Except File: include/linux/lockref.h : special case that can not detect correctly
/// Except File: lib/lockref.c : special case that can not detect correctly
/// Except File: ipc/sem.c : special case that can not detect correctly
///
/// Add the missing unlock before return from function {{function}}
/// in the error handling case.
///
@r1@
expression E;
position p;
@@
  mutex_lock(E);
<+... when != E
  if (...) {
    ... when != E
        when forall
    return@p ...;
  }
...+>
  mutex_unlock(E);

@depends on r1@
expression r1.E;
position r1.p;
@@
+ mutex_unlock(E);
  return@p ...;

@r2@
expression E;
position p;
@@
  spin_lock(E);
<+... when != E
  if (...) {
    ... when != E
        when forall
    return@p ...;
  }
...+>
  spin_unlock(E);

@depends on r2@
expression r2.E;
position r2.p;
@@
+ spin_unlock(E);
  return@p ...;

@r3@
expression E;
position p;
@@
  spin_lock_bh(E);
<+... when != E
  if (...) {
    ... when != E
        when forall
    return@p ...;
  }
...+>
  spin_unlock_bh(E);

@depends on r3@
expression r3.E;
position r3.p;
@@
+ spin_unlock(E);
  return@p ...;

@r4@
expression E;
position p;
@@
  spin_lock_irq(E);
<+... when != E
  if (...) {
    ... when != E
        when forall
    return@p ...;
  }
...+>
  spin_unlock_irq(E);

@depends on r4@
expression r4.E;
position r4.p;
@@
+ spin_unlock_irq(E);
  return@p ...;

@subfld@
identifier E;
position r;
identifier fld, fld2;
@@
spin_lock_irqsave@r(&E->fld,...);
<+...
if (...) {
  ...
  return \(E \| E->fld2\);
}
...+>
spin_unlock_irqrestore(&E->fld,...);

@r5@
expression E, flags;
position r != { subfld.r }, p;
@@
  spin_lock_irqsave@r(E, flags);
<+... when != E
  if (...) {
  ... when != E
      when forall
    return@p ...;
  }
...+>
  spin_unlock_irqrestore(E, flags);

@depends on r5@
expression r5.E, r5.flags;
position r5.p;
@@
+ spin_unlock_irqrestore(E, flags);
  return@p ...;
