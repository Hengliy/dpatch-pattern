/// fix return value check in {{function}}
///
/// Except File: drivers/mmc/host/atmel-mci.c : special case that can not detect correctly
///
/// In case of error, the function debugfs_create_*() returns NULL
/// pointer not ERR_PTR() if debugfs is enabled. The IS_ERR() test
/// in the return value check should be replaced with NULL test.
///
@r1 exists@
expression ret, E;
position p;
@@
ret = \(debugfs_create_dir\|
debugfs_create_file\|
debugfs_create_u8\|
debugfs_create_u16\|
debugfs_create_u32\|
debugfs_create_u64\|
debugfs_create_x8\|
debugfs_create_x16\|
debugfs_create_x32\|
debugfs_create_x64\)(...);
... when != ret = E
 IS_ERR@p(ret)

@script:python depends on r1@
p << r1.p;
@@
import subprocess

def is_config_debug_fs(fname):
    cmd = "/usr/bin/grep -r \"CONFIG_DEBUG_FS\" %s > /dev/null" % (fname)
    if subprocess.call(cmd, shell=True) == 0:
        return True
    return False

if is_config_debug_fs(p[0].file) is False:
    cocci.include_match(False)

@depends on r1@
expression r1.ret;
position r1.p;
@@
(
ret == NULL || IS_ERR@p(ret)
|
IS_ERR@p(ret) || ret == NULL
|
- IS_ERR@p(ret)
+ !ret
|
- !IS_ERR@p(ret)
+ ret
)
