/// don't call input_free_device() after input_unregister_device()
///
/// input_free_device() should only be used if input_register_device()
/// was not called yet or if it failed. Once device was unregistered
/// use input_unregister_device() and memory will be freed once last
/// reference to the device is dropped.
///
@e exists@
expression dev, E;
position p;
@@
 input_unregister_device@p(dev);
 ... when != dev = E
 input_free_device(dev);
 
@depends on e@
identifier l;
expression dev, E;
position e.p;
@@
 input_unregister_device@p(dev);
+ dev = NULL;
 ... when != dev = E
l:

@depends on e@
expression dev, E;
@@
 input_unregister_device(dev);
 ... when != dev = E
- input_free_device(dev);

