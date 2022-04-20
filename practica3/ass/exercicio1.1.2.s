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
	.file	"exercicio1.1.2.c"
	.text
	.comm	x,4,4
	.comm	y,4,4
	.comm	z,4,4
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
	ldr	r3, .L5
	movs	r2, #1
	str	r2, [r3]
	ldr	r3, .L5+4
	movs	r2, #1
	rsbs	r2, r2, #0
	str	r2, [r3]
	ldr	r3, .L5
	ldr	r2, [r3]
	ldr	r3, .L5+4
	ldr	r3, [r3]
	cmp	r2, r3 @ compara
	ble	.L2 @ if
	ldr	r3, .L5+8 @ then 
	movs	r2, #1
	str	r2, [r3]
	b	.L3 @ salta ao final do if
.L2: @ else
	ldr	r3, .L5+8
	movs	r2, #0
	str	r2, [r3]
.L3:
	movs	r3, #0
	movs	r0, r3
	mov	sp, r7
	@ sp needed
	pop	{r7, pc}
.L6:
	.align	2
.L5:
	.word	x
	.word	y
	.word	z
	.size	main, .-main
	.ident	"GCC: (15:9-2019-q4-0ubuntu1) 9.2.1 20191025 (release) [ARM/arm-9-branch revision 277599]"
