
	.data

vector:	.word 2, 4, 6, 3, 10, 1, 4
tamanho: .word 7
valor:	.word 4
res:	.space 4

	.text
subr:	push {r4, lr}
for:	sub r2, #1 @ diminuimos o tamaño en 1
	ldr r4, [r0] @ almacenamos en r4 o valor da direccion de memoria de r0
	cmp r4, r1 @ comparamos o valor almacenado na direccion de memoria de r0 co valor (r2)
	blt else @ se non e mais grande ou igual saltamos ao else
	add r3, r4 @ se e maior sumamos o seu valor a r3
else:	add r0, #4 @ sumamos catro á direccion de memoria para coller o valor seguinte do vector
	cmp r2, #0 @ comparamos o tamaño con 0
	beq endr @ se e igual saltamos ao final da subrutina	
	b for
endr:	mov r0, r3 @ cargamos o valor do resultado no rexistro 0 para devolvelo
	pop {r4, pc} @ devolvemos o control ao programa inicial
main:	
	ldr r0, =vector @ cargamos a direccion de memoria do vector
	ldr r1, =valor @ cargamos a direccion de memoria do valor
	ldr r1,  [r1] @ cargamos o valor da direccion de memoria almacenada en r1
	ldr r2, =tamanho @ cargamos a direccion de memoria do tamaño
	ldr r2, [r2] @ cargamos o tamaño de r2 (o valor do tamaño do vector)
	bl subr
end:	wfi	
