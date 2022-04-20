	.cpu cortex-m0
	.eabi_attribute 20, 1
	.eabi_attribute 21, 1
	.eabi_attribute 23, 3
	.eabi_attribute 24, 1
	.eabi_attribute 25, 1
	.eabi_attribute 26, 1
	.eabi_attribute 30, 6
	.eabi_attribute 34, 0
	.eabi_attribute 18, 4
	.file	"exercicio1.1.4.c"
	.text
	.global	x
	.data
	.align	2
	.type	x, %object
	.size	x, 4
x:
	.word	22
	.comm	a,4,4
	.text
	.align	1
	.global	main
	.arch armv6s-m
	.syntax unified
	.code	16
	.thumb_func
	.fpu softvfp
	.type	main, %function
main:
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 1, uses_anonymous_args = 0
	push	{r7, lr}
	add	r7, sp, #0
	ldr	r3, .L4
	ldr	r3, [r3]
	cmp	r3, #20 @ compara se x e menor que 20, se non e xa non entra no if
	ble	.L2 @ aqui salta para non entrar no if nin mirar se e menor que 25
	ldr	r3, .L4
	ldr	r3, [r3]
	cmp	r3, #24 @ compara x con 24
	bgt	.L2 se é maior que 24 (non menor que 25) salta a L2 para non entrar no if, en caso contrario entra
	ldr	r3, .L4+4 @ then
	movs	r2, #1 @ a = 1
	str	r2, [r3]
.L2:
	movs	r3, #0
	movs	r0, r3
	mov	sp, r7
	@ sp needed
	pop	{r7, pc}
.L5:
	.align	2
.L4:
	.word	x
	.word	a
	.size	main, .-main
	.ident	"GCC: (15:9-2019-q4-0ubuntu1) 9.2.1 20191025 (release) [ARM/arm-9-branch revision 277599]"
