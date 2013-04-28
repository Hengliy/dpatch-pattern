/// fix krealloc() misuse in in {{function}}
///
/// If krealloc() returns NULL, it doesn't free the original. So any code
/// of the form 'foo = krealloc(foo, ...);' is almost certainly a bug.
///
@@
expression E, len, flag;
@@

* E = krealloc(E, len, flag);

