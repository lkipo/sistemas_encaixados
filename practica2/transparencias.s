	.cpu arm7tdmi
	.eabi_attribute 20, 1
	.eabi_attribute 21, 1
	.eabi_attribute 23, 3
	.eabi_attribute 24, 1
	.eabi_attribute 25, 1
	.eabi_attribute 26, 1
	.eabi_attribute 30, 6
	.eabi_attribute 34, 0
	.eabi_attribute 18, 4
	.file	"transparencias.c"
	.text
	.global	a
	.data
	.type	a, %object
	.size	a, 1
a:
	.byte	-1
	.global	b
	.align	1
	.type	b, %object
	.size	b, 2
b:
	.short	-2
	.comm	c,4,4
	.global	d
	.type	d, %object
	.size	d, 1
d:
	.byte	1
	.comm	e,4,4
	.text
	.align	1
	.global	main
	.arch armv4t
	.syntax unified
	.code	16
	.thumb_func
	.fpu softvfp
	.type	main, %function
main:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 1, uses_anonymous_args = 0
	push	{r7, lr}
	add	r7, sp, #0
	ldr	r3, .L3
	ldrb	r3, [r3]
	lsls	r3, r3, #24
	asrs	r3, r3, #24
	movs	r2, r3
	ldr	r3, .L3+4
	str	r2, [r3]
	ldr	r3, .L3+8
	movs	r2, #0
	ldrsh	r3, [r3, r2]
	movs	r2, r3
	ldr	r3, .L3+4
	str	r2, [r3]
	ldr	r3, .L3+12
	ldrb	r3, [r3]
	movs	r2, r3
	ldr	r3, .L3+16
	str	r2, [r3]
	movs	r3, #0
	movs	r0, r3
	mov	sp, r7
	@ sp needed
	pop	{r7}
	pop	{r1}
	bx	r1
.L4:
	.align	2
.L3:
	.word	a
	.word	c
	.word	b
	.word	d
	.word	e
	.size	main, .-main
	.ident	"GCC: (15:9-2019-q4-0ubuntu1) 9.2.1 20191025 (release) [ARM/arm-9-branch revision 277599]"
