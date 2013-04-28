/// remove needless check before usb_free_urb()
///
/// usb_free_urb(NULL) is safe and this check is not required.
///
@@
expression E;
@@

- if (E) usb_free_urb(E);
+ usb_free_urb(E);
