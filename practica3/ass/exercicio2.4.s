	.data
a:	.word 3
b:	.word 9
res:	.word 0
	.text

subr:	push {lr}
	mov r2, #0
for:	cmp r1, #0	@ se se completaron os ciclos seguimos o bucle
	beq save
	add r2, r2, r0	@ se non completou os ciclos sumamos outra vez o valor
	sub r1, #1	@ restamos un a r1
	b for	@ volvemos ao inicio do bucle
save:	ldr r1, =res
	str r2, [r1, #0] 	@ gardamos o resultado en memoria
	pop {pc}
main:	ldr r0, =a 	@ cargamos a direccion de a
	ldr r1, =b 	@ cargamos a direccion de b
	ldr r0, [r0] 	@ cargamos o valor de a
	ldr r1, [r1]	@ cargamos o valor de b
	bl subr
end:	wfi
