/// fix missing unlock on error in {{function}}
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
