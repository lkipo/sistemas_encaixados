	.data

a:	.word	2 	@ asignamos valor a a
b:	.word	765	@ asignamos valor a c
c:	.word	0	@ reservamos memoria para c

	.text
main: 
	ldr r0, =a	@ cargamos a direccion de a
	ldr r1, =b	@ cargarmos a direccion de b
	ldr r0, [r0]	@ cargamos o valor almacenado na direccion de a
	ldr r1, [r1]	@ cargamos o valor almacenado na direccion de b
	cmp r0, r1	@ comparamos a e b
	bls 	else	@ se a e menor que b saltamos ao else
	sub r2, r0, r1	@ se non e menor restamos a-b e gardamolo no rexistro 2
	b 	endelse	@ saltamos ao final do else
else:	sub r2, r1, r0	@ se a non e menor que b restamos b-a e gardamolo no rexistro 2
endelse:ldr r3, =c	@ cargamos no rexistro 3 o valor da direccion de memoria de c
	str r2, [r3]	@ gardamos o valor do rexistro 2 na direccion de memoria de c
end:	wfi	@ final do programa
