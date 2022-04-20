	.data

a: 	.word 20
res:	.space 32

	.text

main:	
	ldr r0, =a @ Cargamos a dirección de a
	ldr r1, [r0] @ Cargamos o valor almacenado na direccion de memoria que ten r0 (a)
	lsl r1, #8 @ desplazamos o posicións á esquerda o número (en binario, dúas en hexadecimal), o que equivale a multiplicalo por 32
	str r1, [r0, #4] @ Gardamos o valor do rexistro 2 na dirección de memoria seguinte á de a
end:	wfi @ Final do programa
