/// convert to use leXX_add_cpu()
///
/// Except File: include/linux/byteorder/generic.h : implementation file
/// Except File: drivers/net/wireless/ath/ath6kl/main.c : special case that can not detect correctly
///
/// Convert cpu_to_leXX(leXX_to_cpu(E1) + E2) to use leXX_add_cpu().
///
@@
expression E1, E2;
@@
- E1 = cpu_to_le16(le16_to_cpu(E1) + E2);
+ le16_add_cpu(&E1, E2);

@@
expression E1, E2;
@@
- E1 = cpu_to_le16(le16_to_cpu(E1) - E2);
+ le16_add_cpu(&E1, -E2);

@@
expression E1, E2;
@@
- E1 = cpu_to_le32(le32_to_cpu(E1) + E2);
+ le32_add_cpu(&E1, E2);

@@
expression E1, E2;
@@
- E1 = cpu_to_le32(le32_to_cpu(E1) - E2);
+ le32_add_cpu(&E1, -E2);

@@
expression E1, E2;
@@
- E1 = cpu_to_le64(le64_to_cpu(E1) + E2);
+ le64_add_cpu(&E1, E2);

@@
expression E1, E2;
@@
- E1 = cpu_to_le64(le64_to_cpu(E1) - E2);
+ le64_add_cpu(&E1, -E2);

