@
@ This program:
@  + loads two numbers, 5 and 4, in the registers r0 and r1, respectivelly,
@  + adds the contents of these registers, and
@  + loads the result in the register r2.
@

	.text

main:	ldr r0, =0x12345678	@ usamos ldr para cargar numeros de 32 bytes	
	ldr r1, =0x3344FF00	
	add r3, r1, r0	

stop:	wfi		@ End of program
