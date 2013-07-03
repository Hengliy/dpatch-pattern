/// fix krealloc() misuse in in {{function}}
///
/// Except File: sound/soc/soc-dapm.c : special case that can not detect correctly
/// Except File: kernel/params.c : special case that can not detect correctly
/// Except File: arch/x86/platform/efi/efi.c : special case that can not detect correctly
/// Except File: drivers/pinctrl/pinctrl-sunxi.c : special case that can not detect correctly
/// Except File: drivers/media/media-entity.c : special case that can not detect correctly
/// Except File: drivers/pinctrl/sh-pfc/pinctrl.c : special case that can not detect correctly
/// Except File: drivers/thermal/x86_pkg_temp_thermal.c : special case that can not detect correctly
///
/// If krealloc() returns NULL, it doesn't free the original. So any code
/// of the form 'foo = krealloc(foo, ...);' is almost certainly a bug.
///
@@
expression E, len, flag;
@@

* E = krealloc(E, len, flag);

