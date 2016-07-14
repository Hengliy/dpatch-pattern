/// use devm_gpiochip_add_data() for gpio registration
///
/// Options: -D full
///
/// Use devm_gpiochip_add_data() for GPIO registration and remove
/// the need of driver callback .remove.
///

virtual patch
virtual content
virtual full

@r1@
identifier fn_probe;
identifier pdev;
expression chip, data;
@@

int fn_probe(struct platform_device *pdev)
{
  ...
  gpiochip_add_data(chip, data)
  ...
}

@r2@
identifier fn_remove;
identifier pdev;
expression chip;
@@
int fn_remove(struct platform_device *pdev)
{
  ...
  gpiochip_remove(chip);
  ...
}

@r3@
identifier r2.fn_remove;
identifier drvdata, fn;
expression r2.chip;
type T;
@@

int fn_remove(...)
{
? T drvdata = fn(...);
  gpiochip_remove(chip);
  return ...;
}

@p1 depends on r1 && !content && (!full || r3)@
identifier r1.fn_probe;
identifier r1.pdev;
expression r1.chip, r1.data;
@@
int fn_probe(struct platform_device *pdev)
{
  ...
- gpiochip_add_data(chip, data)
+ devm_gpiochip_add_data(&pdev->dev, chip, data)
  ...
}

@p2 depends on p1@
identifier r1.fn_probe;
identifier r1.pdev;
expression r1.chip;
@@
int fn_probe(struct platform_device *pdev)
{
  <+...
- gpiochip_remove(chip);
  ...+>
}

@p3 depends on p1@
identifier r2.fn_remove;
identifier r2.pdev;
expression r2.chip;
@@
int fn_remove(struct platform_device *pdev)
{
  ...
- gpiochip_remove(chip);
  ...
}

@p4 depends on p3@
identifier r2.fn_remove;
identifier drvdata, fn;
type T;
@@

- int fn_remove(...)
- {
?-  T drvdata = fn(...);
-   return ...;
- }

@p5 depends on p4@
identifier r1.fn_probe;
identifier r2.fn_remove;
identifier driver;
@@
struct platform_driver driver = {
...,
  .probe = fn_probe,
- .remove = fn_remove,
...
};

@script:python depends on r1 && !r3 && content@
@@
msg = "Use devm_gpiochip_add_data() for GPIO registration."

print msg

@script:python depends on r1 && r3 && content@
@@

msg = """Use devm_gpiochip_add_data() for GPIO registration and remove
the need of driver callback .remove."""

print msg

