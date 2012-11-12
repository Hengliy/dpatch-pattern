/// convert to use simple_open()
///
/// This removes an open coded simple_open() function and
/// replaces file operations references to the function
/// with simple_open() instead.
/// 
/// dpatch engine is used to auto generate this patch.
/// (https://github.com/weiyj/dpatch)
///

@open@
identifier open_f != simple_open;
identifier i, f;
@@
-int open_f(struct inode *i, struct file *f)
-{
(
-if (i->i_private)
-f->private_data = i->i_private;
|
-f->private_data = i->i_private;
)
-return 0;
-}

@has_open depends on open@
identifier fops;
identifier open.open_f;
@@
struct file_operations fops = {
...,
-.open = open_f,
+.open = simple_open,
...
};

