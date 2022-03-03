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
	.file	"transparencias.c"
	.text
	.global	a
	.data
	.align	2
	.type	a, %object
	.size	a, 4
a:
	.word	1
	.global	b
	.align	2
	.type	b, %object
	.size	b, 4
b:
	.word	2
	.global	c
	.bss
	.align	2
	.type	c, %object
	.size	c, 4
c:
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
	ldr	r3, .L3
	ldr	r2, [r3]
	ldr	r3, .L3+4
	ldr	r3, [r3]
	adds	r2, r2, r3
	ldr	r3, .L3+8
	str	r2, [r3]
.L2:
	b	.L2
.L4:
	.align	2
.L3:
	.word	a
	.word	b
	.word	c
	.size	main, .-main
	.ident	"GCC: (15:9-2019-q4-0ubuntu1) 9.2.1 20191025 (release) [ARM/arm-9-branch revision 277599]"
