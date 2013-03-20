/// make local function {{function}} static
///
/// Except File: net/nfc/llcp/llcp.c : special case that can not detect correctly
///
/// function '{{function}}' was not declared. It should it be static.
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
identifier fun.sym;
@@

(
EXPORT_SYMBOL(sym);
|
EXPORT_SYMBOL_GPL(sym);
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
    cmd = "/usr/bin/grep --exclude=*.c -r \"%s\" %s > /dev/null" % (pattern, dir)
    return subprocess.call(cmd, shell=True)

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
T1 = re.sub(r"\*", '\*', T).strip()
patterns.append(re.sub(r"[ \t]+", "\s*", "%s\s*\S*\s*%s\s*(" % (T1, sym)))
patterns.append(re.sub(r"[ \t]+", "\s*", "^\s*%s\s*(" % (sym)))

if fname.find('scripts/') != -1 or fname.find('tools/') != -1 or fname.find('fs/xfs/') != -1:
    cocci.include_match(False)
elif fname.find('coccinelle/') != -1:
    cocci.include_match(False)
elif _is_except(fname, T1, sym):
    cocci.include_match(False)
else:
    for pattern in patterns:
        if _is_declared(dinc, pattern) == 0:
            cocci.include_match(False)
            break
        elif _is_declared(dname, pattern) == 0:
            cocci.include_match(False)
            break

@depends on !e1 && !e2 && !e3@
type fun.T;
identifier fun.sym;
@@
+static
T sym(...) {
    ...
}
