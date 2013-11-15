/// using for_each_clear_bit_from to simplify the code
///
/// Fixed: for_each_clear_bit_from\(([^,]+),([^, ]+),([^ \)]+)\) ... for_each_clear_bit_from(\g<1>, \g<2>, \g<3>)
///
/// Using for_each_clear_bit_from() to simplify the code.
///
@@
expression bit, addr, size;
iterator name for_each_clear_bit_from;
statement S;
@@
-	for (bit = find_next_zero_bit(addr, size, bit); bit < size; bit = find_next_zero_bit(addr, size, bit + 1))
+	for_each_clear_bit_from(bit, addr, size)
S

@@
expression bit, addr, size;
@@
-	bit = find_next_zero_bit(addr, size, bit);
-	while (bit < size) {
+	for_each_clear_bit_from(bit, addr, size) {
...
-		bit = find_next_zero_bit(addr, size, bit + 1);
...
	}

