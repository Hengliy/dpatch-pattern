/// fix error-valued pointer dereference in {{function}}
///
/// Except File: fs/jffs2/write.c : special case that can not detect correctly
/// Except File: drivers/staging/lustre/lustre/obdecho/echo_client.c : special case that can not detect correctly
/// Except File: drivers/staging/lustre/lustre/obdclass/lu_object.c : special case that can not detect correctly
/// Except File: drivers/staging/lustre/lustre/obdclass/genops.c : special case that can not detect correctly
/// Except File: drivers/staging/lustre/lustre/obdclass/dt_object.c : special case that can not detect correctly
/// Except File: drivers/staging/lustre/lustre/obdclass/cl_page.c : special case that can not detect correctly
/// Except File: drivers/staging/lustre/lustre/llite/namei.c : special case that can not detect correctly
/// Except File: drivers/staging/lustre/lustre/llite/llite_nfs.c : special case that can not detect correctly
/// Except File: drivers/usb/gadget/f_subset.c : special case that can not detect correctly
/// Except File: drivers/usb/gadget/f_rndis.c : special case that can not detect correctly
/// Except File: drivers/usb/gadget/f_phonet.c : special case that can not detect correctly
/// Except File: drivers/usb/gadget/f_ncm.c : special case that can not detect correctly
/// Except File: drivers/usb/gadget/f_eem.c : special case that can not detect correctly
/// Except File: drivers/usb/gadget/f_ecm.c : special case that can not detect correctly
///
/// Fix error-valued pointer dereference in {{function}}.
///
@bad1 exists@
expression x;
position p;
type T;
@@
if (IS_ERR@p(x)) {
...
(
return x;
|
return (T *)x;
)
}

@bad2 exists@
expression x, ret;
position p;
type T;
@@
if (IS_ERR@p(x)) {
...
(
ret = x;
|
ret = (T *)x;
)
...
return \(ret \| ERR_CAST(ret) \| PTR_ERR(x)\);
}

@bad3 exists@
expression x, ret;
position p;
@@
if (IS_ERR@p(x)) {
...
 ret = x;
...
 nd_set_link(..., ret);
...
 return ...;
}

@@
expression x, E;
position p != {bad1.p, bad2.p, bad3.p};
@@
if (IS_ERR@p(x)) {
...
(
PTR_ERR(x)
|
PTR_RET(x)
|
ERR_CAST(x)
|
IS_ERR(x)
|
x = E
|
x == E
|
fc_lport_error(..., x)
|
fc_disc_error(..., x)
|
fc_fcp_srr_error(..., x)
|
fc_rport_error(..., x)
|
fc_rport_error_retry(..., x)
|
fc_fcp_error(..., x)
|
fc_fcp_rec_error(..., x)
|
dev_err(...,x,...)
|
* x
)
...
}

