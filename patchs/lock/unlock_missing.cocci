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
///
/// Add the missing unlock before return from function {{function}}
/// in the error handling case.
/// 
/// dpatch engine is used to auto generate this patch.
/// (https://github.com/weiyj/dpatch)
///
@@
expression E;
@@
  mutex_lock(E);
<+... when != E
  if (...)
+ {
+   mutex_unlock(E);
    return ...;
+ }
...+>
  mutex_unlock(E);

@@
expression E;
@@
  mutex_lock(E);
<+... when != E
  if (...) {
    ... when != E
        when forall
+ mutex_unlock(E);
    return ...;
  }
...+>
  mutex_unlock(E);

@@
expression E;
@@

  spin_lock(E);
<+... when != E
  if (...)
+ {
+   spin_unlock(E);
    return ...;
+ }
...+>
  spin_unlock(E);

@@
expression E;
@@
  spin_lock(E);
<+... when != E
  if (...) {
    ... when != E
        when forall
+ spin_unlock(E);
    return ...;
  }
...+>
  spin_unlock(E);

@@
expression E;
@@

  spin_lock_bh(E);
<+... when != E
  if (...)
+ {
+   spin_unlock_bh(E);
    return ...;
+ }
...+>
  spin_unlock_bh(E);

@@
expression E;
@@
  spin_lock_bh(E);
<+... when != E
  if (...) {
    ... when != E
        when forall
+ spin_unlock_bh(E);
    return ...;
  }
...+>
  spin_unlock_bh(E);

@@
expression E;
@@

  spin_lock_irq(E);
<+... when != E
  if (...)
+ {
+   spin_unlock_irq(E);
    return ...;
+ }
...+>
  spin_unlock_irq(E);

@@
expression E;
@@
  spin_lock_irq(E);
<+... when != E
  if (...) {
    ... when != E
        when forall
+ spin_unlock_irq(E);
    return ...;
  }
...+>
  spin_unlock_irq(E);

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

@@
expression E, flags;
position r != { subfld.r };
@@
  spin_lock_irqsave@r(E, flags);
<+... when != E
(
  if (...)
+ {
+   spin_unlock_irqrestore(E, flags);
    return ...;
+ }
|
  if (...) {
  ... when != E
      when forall
+   spin_unlock_irqrestore(E, flags);
    return ...;
  }
)
...+>
  spin_unlock_irqrestore(E, flags);

