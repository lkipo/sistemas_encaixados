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
	.file	"exercicio1.1.9.c"
	.text
	.global	str
	.data
	.align	2
	.type	str, %object
	.size	str, 6
str:
	.ascii	"hello\000"
	.global	len
	.bss
	.align	2
	.type	len, %object
	.size	len, 4
len:
	.space	4
	.global	p
	.data
	.align	2
	.type	p, %object
	.size	p, 4
p:
	.word	str
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
.L4:
	ldr	r3, .L8
	ldr	r3, [r3]
	ldrb	r3, [r3]
	cmp	r3, #0 @ compara p con 0 (final da cadea de caracteres)
	beq	.L7 @ se e igual salta a l7 e acaba o programa
	ldr	r3, .L8
	ldr	r3, [r3]
	adds	r2, r3, #1
	ldr	r3, .L8
	str	r2, [r3]
	ldr	r3, .L8+4
	ldr	r3, [r3]
	adds	r2, r3, #1
	ldr	r3, .L8+4
	str	r2, [r3]
	b	.L4 @ por ser un bucle infinito salta hacia l4 sempre que chegue ao fin do bucle (necesita un break)
.L7:
	nop
	movs	r3, #0
	movs	r0, r3
	mov	sp, r7
	@ sp needed
	pop	{r7, pc}
.L9:
	.align	2
.L8:
	.word	p
	.word	len
	.size	main, .-main
	.ident	"GCC: (15:9-2019-q4-0ubuntu1) 9.2.1 20191025 (release) [ARM/arm-9-branch revision 277599]"
