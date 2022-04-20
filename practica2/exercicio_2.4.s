	.data

a:	.word 15
res:	.space 32

	.text

main:
	ldr r0, =a @cargamos a dirección de a
	ldr r0, [r0] @ cargamos o valor almacenado na direccion de memoria que ten r0 (a)
	add r1, r1, r0 @ sumamoslle o mesmo número, o que equivale a sumar o número multiplicado por 1 
	lsl r0, #3 @ desplazamos o número 3 bits á dereita (multiplicamos por 8)
	add r1, r1, r0 @ sumamos o número*1 e o número*8
	lsl r0, #1 @ desplazamos o número q byte á dereita, o que equivale multiplicalo por 2 (16 se temos en conta que xa o multiplicaramos por 8)
	add r1, r1, r0 @ sumamos o número multiplicado por 16, co que temos número*16 + número*8 + número = número*(16+8+1) = número*25

end:	wfi
