/// make symbol {{variable}} static
///
/// Except File: drivers/acpi/acpica/utglobal.c : special case that can not detect correctly
/// Except File: drivers/char/random.c : special case that can not detect correctly
///
/// symbol '{{variable}}' only used within this file. It should be static.
///
@f1@
identifier fun;
type T;
position p;
identifier x;
@@
fun(...) {
   <... T x@p; ...>
}

@f2@
identifier fun;
type T;
position p;
identifier x;
@@
fun(...) {
   <... T x@p = ...; ...>
}

@f3@
type T;
position p;
identifier x;
@@
T x@p(...);

@sd disable optional_storage@
type T;
identifier sym;
position p != {f1.p, f2.p, f3.p};
@@
(
T sym@p;
|
T sym@p = ...;
)

@e@
declarer name EXPORT_SYMBOL;
declarer name EXPORT_SYMBOL_GPL;
identifier sd.sym;
@@

(
EXPORT_SYMBOL(sym);
|
EXPORT_SYMBOL_GPL(sym);
)

@script:python depends on !e@
sym << sd.sym;
T << sd.T;
p << sd.p;
@@

import subprocess
import os
import re

_exsymlist = [
    '__read_mostly',
    '____cacheline_aligned_in_smp',
    '__packed'
]

_extypelist = [
    '__packed',
    'struct cgroup_subsys'
]

_exdlist = [
    'scripts/',
    'tools/',
    'arch/',
    'coccinelle/',
    'drivers/gpu/drm/nouveau/core/'
]

_exlist = [
]

def _is_except(fname, T, sym):
    if sym in _exsymlist:
        return True

    if T in _extypelist:
        return True

    _exp = re.sub(r"[ \t\\]+", "_", "%s|%s|%s" % (os.path.basename(fname), T, sym))
    return _exp in _exlist

def _is_declared(dir, pattern):
    if dir is None:
        return 1
    cmd = "/usr/bin/grep -r \"%s\" %s > /dev/null" % (pattern, dir)
    return subprocess.call(cmd, shell=True)

def _is_weak(fname, T, sym):
    _wpatterns = []
    _wpatterns.append(re.sub(r"[ \t]+", "\s*", "%s\s*%s\s*__weak" % (T1, sym)))
    _wpatterns.append(re.sub(r"[ \t]+", "\s*", "%s\s*%s\s*\[.*\]\s*__weak" % (T1, sym)))
    if dir is None:
        return False
    for pattern in _wpatterns:
        cmd = "/usr/bin/grep -r \"%s\" %s > /dev/null" % (pattern, fname)
        if subprocess.call(cmd, shell=True) == 0:
            return True
    return False

def _is_in_macro(fname, T, sym):
    if dir is None:
        return False
    _mpatterns = []
    _mpatterns.append(re.sub(r"[ \t]+", "\s*", "%s\s*%s\s*;\s*\\\\\\\\" % (T1, sym)))
    for pattern in _mpatterns:
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

fname = p[0].file
dname = os.path.dirname(fname)
dinc = _inclue_dir(fname)

patterns = []
T1 = re.sub(r"\*", '\S*\s*\*', T).strip()
T1 = re.sub(r"\{.*\}", '', T1).strip()
if T.find("[") == -1:
    patterns.append(re.sub(r"[ \t]+", "\s*", "extern\s*\S*\s*%s\s*\S*\s*%s\s*\S*;" % (T1, sym)))
    patterns.append(re.sub(r"[ \t]+", "\s*", "extern\s*const\s*%s\s*\S*\s*%s\s*\S*;" % (T1, sym)))
else:
    T1 = re.sub(r"\[.*", '', T1).strip()
    patterns.append(re.sub(r"[ \t]+", "\s*", "extern\s*\S*\s*%s\s*\S*\s*%s\s*\[.*]\s*\S*;" % (T1, sym)))
    patterns.append(re.sub(r"[ \t]+", "\s*", "extern\s*const\s*%s\s*\S*\s*%s\s*\[.*]\s*\S*;" % (T1, sym)))

if re.search(r"\.c$", fname) == None or len(sym) < 6:
    cocci.include_match(False)
elif _is_exclude_dir(fname) is True:
    cocci.include_match(False)
elif _is_except(fname, T1, sym):
    cocci.include_match(False)
elif _is_weak(fname, T1, sym):
    cocci.include_match(False)
elif _is_in_macro(fname, T1, sym):
    cocci.include_match(False)
else:
    for pattern in patterns:
        if _is_declared(dinc, pattern) == 0:
            cocci.include_match(False)
            break
        elif _is_declared(dname, pattern) == 0:
            cocci.include_match(False)
            break

@depends on !e@
type sd.T;
identifier sd.sym;
position sd.p;
@@
(
+static
T sym@p;
|
+static
T sym@p = ...;
)
