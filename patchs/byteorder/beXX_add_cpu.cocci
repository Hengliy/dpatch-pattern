/// convert to use beXX_add_cpu()
///
/// Except File: include/linux/byteorder/generic.h : implementation file
///
/// Convert cpu_to_beXX(beXX_to_cpu(E1) + E2) to use beXX_add_cpu().
/// 
/// dpatch engine is used to auto generate this patch.
/// (https://github.com/weiyj/dpatch)
///
@@
expression E1, E2;
@@
- E1 = cpu_to_be16(be16_to_cpu(E1) + E2);
+ be16_add_cpu(&E1, E2);

@@
expression E1, E2;
@@
- E1 = cpu_to_be16(be16_to_cpu(E1) - E2);
+ be16_add_cpu(&E1, -E2);

@@
expression E1, E2;
@@
- E1 = cpu_to_be32(be32_to_cpu(E1) + E2);
+ be32_add_cpu(&E1, E2);

@@
expression E1, E2;
@@
- E1 = cpu_to_be32(be32_to_cpu(E1) - E2);
+ be32_add_cpu(&E1, -E2);

@@
expression E1, E2;
@@
- E1 = cpu_to_be64(be64_to_cpu(E1) + E2);
+ be64_add_cpu(&E1, E2);

@@
expression E1, E2;
@@
- E1 = cpu_to_be64(be64_to_cpu(E1) - E2);
+ be64_add_cpu(&E1, -E2);

