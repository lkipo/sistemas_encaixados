	.data
a:	.word 3
b:	.word 9
c:	.word 2
d:	.word 5
e:	.word 4
f: 	.word 6
res:	.word
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
sum:	push {r1, r2, r3, r4, r5, lr} @ facemos un push como copia de seguridade
	mov r1, r5
	bl subr @ chamamos a subrutina
	ldr r3, =res @ recollemos o resultado
	ldr r3, [r3] @ cargamos o valor do resultado
	pop {r0} @ sacamos da pila r1 e almacenamolo en r0 para empregalo na subrutina
	mov r1, r4 @ colocamos r4 en r1 para almacenalo na subrutina
	bl subr @ chamamos a subrutina
	ldr r4, =res @ recollemos o resultado
	ldr r4, [r4] @ cargamos o valor do resultado
	pop {r0, r1} @ sacamos da pila r4 e r5 e almacenamolos en r0 e r1 para empregalos na subrutina
	bl subr @ chamamos a subrutina
	ldr r5, =res @ recollemos o resultado
	ldr r5, [r5] @ cargamos o valor do resultado
	mov r0, r3 @ movemos o resultado de multiplicar a*f ao rexistro 0
	mov r1, r4 @ movemos o resultado de multiplicar b*e ao rexistro 1
	mov r2, r5 @ movemos o resultado de multiplicar c*d ao resistro 2
	add r3, r0, r1 @ gardamos en r3 o resultado de sumar r0 e r1
	add r3, r3, r2 @ gardamos en r3 o resultado de sumar r3 (r0+r1) e r2
	pop {r4, r5, pc} @ restauramos os valores de r4 e r5 e volvemos ao programa principal
main:	ldr r0, =a 	@ cargamos nos seis primeiros rexistros as direccions de memoria das variables
	ldr r1, =b
	ldr r2, =c
	ldr r3, =d
	ldr r4, =e
	ldr r5, =f
	ldr r0, [r0] 	@ cargamos o valor de cada variable
	ldr r1, [r1]
	ldr r2, [r2]	
	ldr r3, [r3]
	ldr r4, [r4]
	ldr r5, [r5]
	bl sum
end:	wfi
