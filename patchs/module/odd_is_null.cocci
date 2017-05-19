/// fix return value check in {{function}}
///
/// Fix the return value check which testing the wrong variable
/// in {{function}}.
///

@ok11 exists@
expression E;
statement S;
identifier x, fn;
position p, p1;
@@

x = E(...);
... when != x = fn(...)
if@p1 (!x@p || ...) S

@ok12 exists@
expression E;
statement S;
identifier x, fn;
position p, p1;
@@

x = E(...);
... when != x = fn(...)
if@p1 (<+...x@p...+>) S

@ok13 exists@
expression E;
statement S;
identifier x, y, fn;
position p, p1;
@@

x = E(..., &y, ...);
... when != x = fn(...)
if@p1 (!y@p || ...) S

@r11 exists@
expression ret, E != {strlen, D40_TYPE_TO_EVENT, spi_master_get_devdata, async_gen_syndrome, isif_read, min, netdev_priv, le16_to_cpu, rb_entry, ARRAY_SIZE, roundup, container_of, get_unaligned_le32};
identifier x, y;
constant C;
position p != {ok11.p, ok12.p, ok13.p};
position p1 != {ok11.p1, ok12.p1, ok13.p1};
@@

x = E(...);
if@p1 (!y@p || ...)
(
{
  ...
(
  return;
|
  return -C;
|
  ret = -C;
  ...
  return ret;
)
}
|
return -C;
)

@depends on r11@
identifier r11.x, r11.y;
position r11.p;
@@

- !y@p
+ !x

@ok21 exists@
expression E;
identifier f, x, fn;
position p, p1;
statement S;
@@

f->x = E(...);
... when != f->x = fn(...)
if@p1 (!f->x@p || ...) S

@ok22 exists@
expression E;
identifier f, x, m, y, fn;
position p, p1;
statement S;
@@

f->x = E(..., &m->y, ...);
... when != f->x = fn(...)
if@p1 (!m->y@p || ...) S

@r21 exists@
expression ret, E != {strlen};
identifier f, x, m, y;
position p != {ok21.p, ok22.p};
position p1 != {ok21.p1, ok22.p1};
constant C;
@@

f->x = E(...);
if@p1 (!m->y@p || ...)
(
{
  ...
(
  return;
|
  return -C;
|
  ret = -C;
  ...
  return ret;
)
}
|
return -C;
)

@depends on r21@
identifier r21.x, r21.y, r21.f, r21.m;
position r21.p;
@@

- !m->y@p
+ !f->x

