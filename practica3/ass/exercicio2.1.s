	.data

vector:	.word 2, 4, 6, 3, 10, 1, 4
tamanho: .word 7
valor:	.word 4
res:	.space 4

	.text

main:	ldr r0, =vector	@ cargamos a primeira direccion de memoria do vector
	ldr r2, =valor	@ cargamos a direccion de memoria do valor
	ldr r2, [r2]	@ cargamos o valor
	ldr r3, =tamanho@ cargamos a direccion de memoria de tamanho
	ldr r3, [r3]	@ cargamos o valor de tamanho
for:	ldr r1, [r0]	@ cargamos a seguinte compoñente do vector
	add r0, #4	@ sumamos 4 para poder cargar a seguinte compoñente do vector
	cmp r3, r0 	@ comparamos a compoñente do vector co valor
	beq end		@ se o tamaño restante é cero acabase o programa
	sub r3, #1
	cmp r1, r2
	ble for		@ se non é maior que o valor (é menor ou igual) volvemos ao inicio do for
	add r4, r4, r1
	b for		@ volvemos ao inicio do for

end:	wfi		@ End of program
