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
	.file	"exercicio1.1.3.c"
	.text
	.global	a
	.data
	.align	2
	.type	a, %object
	.size	a, 4
a:
	.word	1
	.global	x
	.align	2
	.type	x, %object
	.size	x, 4
x:
	.word	2
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
	cmp	r3, #0 @ compara a con 0
	bge	.L2 @ mira se 0 é mais grande e nese caso salta a L2 (non entra no if)
	ldr	r3, .L4 @ then
	ldr	r3, [r3]
	rsbs	r2, r3, #0
	ldr	r3, .L4
	str	r2, [r3] @ final do if
.L2: 
	ldr	r3, .L4+4
	ldr	r3, [r3]
	adds	r2, r3, #1
	ldr	r3, .L4+4
	str	r2, [r3]
	movs	r3, #0
	movs	r0, r3
	mov	sp, r7
	@ sp needed
	pop	{r7, pc}
.L5:
	.align	2
.L4:
	.word	a
	.word	x
	.size	main, .-main
	.ident	"GCC: (15:9-2019-q4-0ubuntu1) 9.2.1 20191025 (release) [ARM/arm-9-branch revision 277599]"
