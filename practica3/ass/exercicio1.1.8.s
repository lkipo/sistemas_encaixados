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
	.file	"exercicio1.1.8.c"
	.text
	.global	sum
	.bss
	.align	2
	.type	sum, %object
	.size	sum, 4
sum:
	.space	4
	.comm	i,4,4
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
	@ args = 0, pretend = 0, frame = 8
	@ frame_needed = 1, uses_anonymous_args = 0
	push	{r7, lr}
	sub	sp, sp, #8
	add	r7, sp, #0
	movs	r3, #0
	str	r3, [r7, #4]
	b	.L2 @ salta a l2
.L5:
	ldr	r3, [r7, #4]
	cmp	r3, #5 @ compara sum con 5
	beq	.L7 @ se e igual a 5 salta ao if
	ldr	r3, .L8
	ldr	r2, [r3]
	ldr	r3, [r7, #4]
	adds	r2, r2, r3
	ldr	r3, .L8
	str	r2, [r3]
	b	.L4
.L7: @ then
	nop
.L4:
	ldr	r3, [r7, #4]
	adds	r3, r3, #1
	str	r3, [r7, #4]
.L2:
	ldr	r3, [r7, #4]
	cmp	r3, #9 @ compara i con 9
	ble	.L5 @ se e menor ou igual salta ao bucle
	movs	r3, #0
	movs	r0, r3
	mov	sp, r7
	add	sp, sp, #8
	@ sp needed
	pop	{r7, pc}
.L9:
	.align	2
.L8:
	.word	sum
	.size	main, .-main
	.ident	"GCC: (15:9-2019-q4-0ubuntu1) 9.2.1 20191025 (release) [ARM/arm-9-branch revision 277599]"
