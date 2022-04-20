	.data

a:	.byte 75
b:	.byte -128
res:	.space 32

	.text

main:	ldr r0, =a	
	ldrb r0, [r0]	@ Cargar número de 1 byte
	ldr r1, =b	
	ldrb r1, [r1]	@ Cargar número de 1 byte
	add r2, r0, r1	
	ldr r0, =res	
	strb r2, [r0]	@ Gardar número de 1 byte

end: 	wfi
