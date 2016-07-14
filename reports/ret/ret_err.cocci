/// fix error return code in {{function}}
///
/// Fix to return a negative error code from the error handling
/// case instead of 0, as done elsewhere in this function.
///
@ok1@
identifier ret;
expression e1,e2,e3;
position p;
@@
if (\(ret < 0\|ret != 0\)) {
 ... return ret;
}
<... when != ret = e1
     when != &ret
if (<+... ret = e3 ...+>) {
 ... when != ret = e2
 return ret@p;
}
...>

@ok2@
identifier ret;
expression e1,e2;
position p;
@@
if (\(ret < 0\|ret != 0\)) {
 ... return ret;
}
<... when != ret = e1
     when != &ret
if (!IS_ERR(e2)) {
 ... return ret@p;
}
...>

@e@
identifier ret != {found, len, page};
expression e1, e2, e3;
position p != {ok1.p, ok2.p};
@@

if (\(ret < 0\|ret != 0\))
 { ... return ret; }
<... when != ret = e1
     when != &ret
if(e3)
 {
  ... when != ret = e2
 return ret@p;
}
...>

@script:python depends on e@
ret << e.ret;
exp << e.e3;
p << e.p;
@@

import os
import re

_exlist = [
    'libiscsi.c|rc|itt_==_~_0U',
    'socket.c|error|sk_->_sk_shutdown_&_RCV_SHUTDOWN',
    'nf_nat_core.c|err|!_tb_[_CTA_NAT_PROTO_]',
    'tg3.c|err|!_(_tp_->_phy_flags_&_TG3_PHYFLG_EEE_CAP_)',
    'inode.c|err|err_||_ia_valid_==_ATTR_SIZE',
    'bio.c|slab|!_new_bio_slabs',
    'filemap.c|retval|!_count',
    'ftrace.c|rec|!_stat_->_pages_->_next',
    'qlcnic_main.c|err|qlcnic_83xx_check_(_adapter_)',
    'btmrvl_sdio.c|ret|(_status_&_bits_)_==_bits',
    'core.c|pmu|!_ret',
    'skd_main.c|rc|rc_<_SKD_MIN_MSIX_COUNT',
    'big_key.c|ret|written_!=_datalen'
]

def _is_except(fname, ret, e):
    _exp = re.sub(r"[ \t\\]+", "_", "%s|%s|%s" % (fname, ret, e))
    #print _exp
    return _exp in _exlist

if _is_except(os.path.basename(p[0].file), ret, exp):
    cocci.include_match(False)

@depends on e@
identifier e.ret;
expression e.e3;
position e.p;
@@

*if(e3)
 {
  ...
* return ret@p;
}
