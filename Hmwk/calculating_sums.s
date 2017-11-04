.section .rodata

intro: .asciz "Enter a number to find the sums leading up to it!\n"
scan_v: .asciz "%d"
output: .asciz "The total sum of %d to %d is %d ! \n"

.section .data

value: .word 0, 0

.section .text

.global main

main:
	push {lr}

	ldr r0, =intro			// output intro
	bl printf

	ldr r0, =scan_v 		// scan user input value
	ldr r1, =value 			// load value holder from user input
	bl scanf

	mov r0, #1				// initialize counter
	mov r4, #0				// initialize sum

while_r0_lt_inpt:			// while (register0 < value)
	cmp r0, =value			// compare register0 with input value
	bgt end_while			// end while loop if register0 is bigger than
	add r4, r4, r0			// add counter value to our sum
	add r0, #1				// increment counter
	bal while_r0_lt_inpt
end_while:

	ldr r0, =output			// output result
	mov r1, #1				// 'restart counter'
	mov r2, =value			// load user input value
	mov r3, r4				// load total sum for output
	bl printf

	mov r0, #0				// return errorcode zero
	pop {pc}				// end of main