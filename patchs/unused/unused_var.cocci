/// remove unused variable in {{function}}
///
/// Except File: sound/soc/codecs/wm8994.c : special case that can not detect correctly
/// Except File: fs/xfs/xfs_buf_item.c : special case that can not detect correctly
/// Except File: drivers/block/floppy.c : special case that can not detect correctly
///
/// The variable {{variable}} is initialized but never used
/// otherwise, so remove the unused variable.
/// 
/// dpatch engine is used to auto generate this patch.
/// (https://github.com/weiyj/dpatch)
///
@bad exists@
type T, T1;
identifier i;
expression fn;
position p;
@@

T i@p;
...
(
i = fn(...);
|
i = (T1 *)fn(...);
)

@@
type T;
identifier i;
expression E;
position p != bad.p;
@@

(
extern T i;
|
- T i@p;
  <+... when != i
(
- i = E++;
+ E++;
|
- i = E;
)
...+>
)
