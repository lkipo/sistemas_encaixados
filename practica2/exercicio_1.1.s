@
@ This program:
@  + loads two numbers, 5 and 4, in the registers r0 and r1, respectivelly,
@  + adds the contents of these registers, and
@  + loads the result in the register r2.
@

	.text

main:	mov r0, #4 
	mov r1, #5	
	add r2, r1, r0	

stop:	wfi		@ End of program
