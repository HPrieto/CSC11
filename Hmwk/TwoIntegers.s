.section .data
/* Prompt message */
greeting: .asciz "Hello! Welcome to Two Integers.\n\n "
command1: .asciz "Enter an integer for first number: "
command2: .asciz "Enter an integer for second number: "
output1: .asciz "The sum of %d and %d is %d\n\n"
output2: .asciz "The difference of %d and %d is %d\n\n"
output3: .asciz "The product of %d and %d is %d\n\n"
/* Where scanf will store the number read */
value1: .word 0
value2: .word 0

.section .text
.global main
main:
	push {lr}

    	ldr r0, =greeting		
    	bl printf		

    	ldr r0, =command		
    	bl printf		

    	/* load and scan values */
    	ldr r0, =input 	
    	ldr r1, =value1  	
    	bl scanf              

    	/* move to register 3 value of register 1 */
    	mov r3, r1
		
    	ldr r0, =command
		ldr r1, =value2
    	bl scanf     

    	/* move to register 5, register 1 value */
    	mov r5, r1

    	/* in register 4 place difference of values */
    	add r4, value1, value2

    	/* in register 6 place difference of register values */
    	mul r6, r3, r5

    	/* in register 7 place difference of values */
    	sub r7, value1, value2

    	/* load registers for first output */
    	ldr r0, =output1
    	mov r1, =value1
    	mov r2, =value2
    	mov r3, r4
    	bl printf

    	/* load registers for second output */
    	ldr r0, =output2
    	mov r1, =value1
    	mov r2, =value2
    	mov r3, r7
    	bl printf

    	/* load registers for third output */
    	ldr r0, =output3
    	mov r1, =value1
    	mov r2, =value2
    	mov r3, r6
    	bl printf

	mov r0, #0		/* exit code 0 = program terminated normally */
	pop {pc}		/* exit our main function */