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
	.file	"exercicio1.1.7.c"
	.text
	.global	i
	.data
	.align	2
	.type	i, %object
	.size	i, 4
i:
	.word	10
	.global	sum
	.bss
	.align	2
	.type	sum, %object
	.size	sum, 4
sum:
	.space	4
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
	b	.L2 @ salta a L2 
.L3: @ interior do while
	ldr	r3, .L5
	ldr	r2, [r3]
	ldr	r3, .L5+4
	ldr	r3, [r3]
	adds	r2, r2, r3
	ldr	r3, .L5
	str	r2, [r3]
	ldr	r3, .L5+4
	ldr	r3, [r3]
	subs	r2, r3, #1
	ldr	r3, .L5+4
	str	r2, [r3]
.L2: @ comprobación da condición para entrar no while
	ldr	r3, .L5+4
	ldr	r3, [r3]
	cmp	r3, #0 @ compara i con 0 
	bgt	.L3 @ se i é maior salta a L3 (entra no while)
	movs	r3, #0
	movs	r0, r3
	mov	sp, r7
	@ sp needed
	pop	{r7, pc}
.L6:
	.align	2
.L5:
	.word	sum
	.word	i
	.size	main, .-main
	.ident	"GCC: (15:9-2019-q4-0ubuntu1) 9.2.1 20191025 (release) [ARM/arm-9-branch revision 277599]"
