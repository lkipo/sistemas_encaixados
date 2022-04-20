@
@ This program:
@  + initialices the variables 'a' and 'b' with the numbers 5 and 4, respectivelly,
@  + loads the contents of the variables 'a' and 'b' on the registers r0 and r1, respectivelly,
@  + adds the contents of these registers, and
@  + stores the result in the variable 'c'.
@

	.data

a:	.word 0x00FF00FF
b:	.word 0xFF00FF00
res:	.space 4

	.text

main:	ldr r0, =a	
	ldr r0, [r0]	
	ldr r1, =b	
	ldr r1, [r1]	
	mov r2, r0 @ copia do rexistro 0 no 2 para realizar as operacions loxicas sobre el
	orr r2, r1 @ operacion or
	mov r2, r0 @ copia do rexistro 0 no 2 para realizar as operacions loxicas sobre el
	eor r2, r1 @ operacion xor
	mov r2, r0 @ copia do rexistro 0 no 2 para realizar as operacions loxicas sobre el
	mvn r2, r1 @ operacion not

	ldr r0, =res
	
end:	wfi		@ End of program
