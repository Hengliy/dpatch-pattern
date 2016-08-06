/// fix invalid use of sizeof in {{function}}
///
/// Except File: drivers/usb/core/hcd.c : special case that can not detect correctly
/// Except File: drivers/iio/adc/at91_adc.c : special case that can not detect correctly
/// Except File: tools/perf/util/hist.c : special case that can not detect correctly
/// Except File: drivers/watchdog/pcwd_usb.c : special case that can not detect correctly
/// Except File: security/integrity/ima/ima_template.c : special case that can not detect correctly
/// Except File: tools/perf/tests/dso-data.c : special case that can not detect correctly
/// Except File: drivers/net/wireless/brcm80211/brcmfmac/pcie.c : special case that can not detect correctly
/// Except File: drivers/clk/bcm/clk-kona-setup.c : special case that can not detect correctly
///
/// sizeof() when applied to a pointer typed expression gives the
/// size of the pointer, not that of the pointed data.
///
// Confidence: High
// Copyright: (C) 2012 Julia Lawall, INRIA/LIP6.  GPLv2.
// Copyright: (C) 2012 Gilles Muller, INRIA/LiP6.  GPLv2.
// URL: http://coccinelle.lip6.fr/
// Comments:
// Options: -no_includes -include_headers

@@
expression *x;
expression f;
type T;
@@

(
x = <+... sizeof(
- x
+ *x
   ) ...+>
|
f(...,(T)(x),...,sizeof(
- x
+ *x
   ),...)
|
f(...,sizeof(x),...,(T)(
- x
+ *x
   ),...)
)


