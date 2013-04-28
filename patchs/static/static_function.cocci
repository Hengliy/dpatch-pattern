/// {{function}} can be static
///
/// Except File: net/nfc/llcp/llcp.c : special case that can not detect correctly
/// Except File: drivers/media/usb/tlg2300/pd-main.c : special case that can not detect correctly
/// Except File: drivers/staging/vt6655/wcmd.c : special case that can not detect correctly
/// Except File: drivers/staging/vt6655/wmgr.c : special case that can not detect correctly
///
/// {{function}} only used within this file. It should be static.
///
@fun@
identifier sym;
type T;
position p;
@@
T sym@p(...) {
   ...
}

@e1@
declarer name EXPORT_SYMBOL;
declarer name EXPORT_SYMBOL_GPL;
declarer name ACPI_EXPORT_SYMBOL;
identifier fun.sym;
@@

(
EXPORT_SYMBOL(sym);
|
EXPORT_SYMBOL_GPL(sym);
|
ACPI_EXPORT_SYMBOL(sym);
)

@e2@
identifier fun.sym;
type T1;
position fun.p;
@@
static
 T1 sym@p(...)
{
   ...
}

@e3@
identifier fun.sym;
type T1;
position fun.p;
@@

static T1 sym@p(...);

@script:python depends on !e1 && !e2 && !e3@
sym << fun.sym;
T << fun.T;
p << fun.p;
@@

import subprocess
import os
import re

_exsymlist = [
]

_extypelist = [
    'sctp_disposition_t'
]

_exlist = [
    'qeth_l3_main.c|int|qeth_l3_get_cast_type',
    'filter.c|void_*|bpf_internal_load_pointer_neg_helper'
]

_exdlist = [
    'scripts/',
    'tools/',
    'arch/',
    'fs/xfs/',
    'coccinelle/',
    'drivers/gpu/drm/nouveau/core/'
]

def _is_except(fname, T, sym):
    if sym in _exsymlist:
        return True

    if T in _extypelist:
        return True

    _exp = re.sub(r"[ \t\\]+", "_", "%s|%s|%s" % (os.path.basename(fname), T, sym))
    return _exp in _exlist

def _is_declared(dir, T, sym):
    _dpatterns = []
    _dpatterns.append(re.sub(r"[ \t]+", "\s*", "%s\s*\S*\s*%s\s*(" % (T, sym)))
    _dpatterns.append(re.sub(r"[ \t]+", "\s*", "^\s*%s\s*(" % (sym)))
    if T.find("*") != -1:
        T1 = re.sub(r'\*', '', T).strip()
        _dpatterns.append(re.sub(r"[ \t]+", "\s*", "%s\s*\S*\s*\*\s*%s\s*(" % (T1, sym)))

    if dir is None:
        return False
    for pattern in _dpatterns:
        cmd = "/usr/bin/grep --exclude=*.c -r \"%s\" %s > /dev/null" % (pattern, dir)
        if subprocess.call(cmd, shell=True) == 0:
            return True
    return False

def _is_weak(fname, T, sym):
    _wpatterns = []
    _wpatterns.append(re.sub(r"[ \t]+", "\s*", "%s\s*__attribute__((weak))\s*%s\s*(" % (T1, sym)))
    _wpatterns.append(re.sub(r"[ \t]+", "\s*", "%s\s*__weak__\s*%s\s*(" % (T1, sym)))
    _wpatterns.append(re.sub(r"[ \t]+", "\s*", "%s\s*__weak\s*%s\s*(" % (T1, sym)))

    if dir is None:
        return False
    for pattern in _wpatterns:
        cmd = "/usr/bin/grep -r \"%s\" %s > /dev/null" % (pattern, fname)
        if subprocess.call(cmd, shell=True) == 0:
            return True
    return False

def _is_alias_static(fname, T, sym):
    _alias = []
    _alias.append(re.sub(r"[ \t]+", "\s*", "static\s*%s\s*%s\s*(" % (T1, sym)))
    _alias.append(re.sub(r"[ \t]+", "\s*", "SCTP_STATIC\s*%s\s*%s\s*(" % (T1, sym)))
    _alias.append(re.sub(r"[ \t]+", "\s*", "STATIC\s*%s\s*%s\s*(" % (T1, sym)))

    for pattern in _alias:
        cmd = "/usr/bin/grep -r \"%s\" %s > /dev/null" % (pattern, fname)
        if subprocess.call(cmd, shell=True) == 0:
            return True
    return False

def _is_exclude_dir(fname):
    for _dir in _exdlist:
        if fname.find(_dir) != -1:
            return True
    return False

def _inclue_dir(dir):
    dname = os.path.dirname(dir)
    while len(dname) > 3:
        if os.path.exists(os.path.join(dname, "Documentation", "CodingStyle")):
            return os.path.join(dname, "include")
        dname = os.path.dirname(dname)
    return None

def _arch_dir(dir):
    if dir is None:
        return None
    return os.path.join(os.path.dirname(dir), "arch")

fname = p[0].file
dname = os.path.dirname(fname)
dinc = _inclue_dir(fname)
darch = _arch_dir(dinc)
T1 = re.sub(r"\*", '\*', T).strip()

if re.search(r"\.c$", fname) == None:
    cocci.include_match(False)
elif _is_exclude_dir(fname) is True:
    cocci.include_match(False)
elif _is_except(fname, T1, sym):
    cocci.include_match(False)
elif _is_alias_static(fname, T1, sym):
    cocci.include_match(False)
elif _is_weak(fname, T1, sym):
    cocci.include_match(False)
elif _is_declared(dinc, T1, sym):
    cocci.include_match(False)
elif _is_declared(dname, T1, sym):
    cocci.include_match(False)
elif _is_declared(darch, T1, sym):
    cocci.include_match(False)

@depends on !e1 && !e2 && !e3@
type fun.T;
identifier fun.sym;
@@
+static
T sym(...) {
    ...
}
