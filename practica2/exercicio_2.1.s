	.data

a:	.byte 6
b:	.byte 5
res:	.space 32

	.text

main:	ldr r0, =a
	ldrb r0, [r0]	@ Cargamos un número de 1 byte
	ldr r1, =b	
	ldrb r1, [r1]	@ Cargamos un número de 1 byte
	add r2, r0, r1	
	ldr r0, =res	
	strb r2, [r0]	@ Gardamos en memoria un número de 1 byte

end: 	wfi
