.section .data
/* Prompt message */
prompt: .asciz "Hi there! Please type in five integer values (seperated by a space): "

/* Response message */
response: .asciz "I read the numbers %d, %d, %d, %d and %d from the keyboard\n"

/* Format pattern for scanf */
pattern: .asciz "%d%d%d%d%d"

.align 4
/* Where scanf will store the number read */
v1: .word 0
v2: .word 0
v3: .word 0
v4: .word 0
v5: .word 0

.section .text
.global main
main:
	push {lr}		/* save our return address */

    	ldr r0, =prompt		/* r0 contains pointer to prompt message */
    	bl printf		/* call printf to output our prompt */

    	ldr r0, =pattern 	/* r0 contains pointer to format string for our scan pattern */
    	ldr r1, =v1  		/* r1 contains pointer to v1 */
	ldr r2, =v2		/* r2 contains pointer to v2 */
	ldr r3, =v3		/* r3 contains pointer to v3 */
	ldr r4, =v5		/* r4 contains pointer to v5 */
	push {r4}		/* push pointer to v5 on to stack */
	ldr r4, =v4		/* r4 contains pointer to v4 */
	push {r4}		/* push pointer to v4 on to stack */
    	bl scanf              	/* call to scanf */
	add sp, #8		/* we pushed pointers to v4 and v5 on stack earlier, now
				   we have to add 8 bytes back to stack pointer to put the
				   stack back to where it was before the two pushes (could do
				   two pops to an unused register) */

next:
	ldr r0, =response	/* r0 contains pointer to response message */
	ldr r1, =v1		/* r1 contains pointer to v1 */
	ldr r1, [r1]		/* r1 contains value dereferenced from r1 in previous instruction */
	ldr r2, =v2		

	ldr r2, [r2]
	ldr r3, =v3
	ldr r3, [r3]
	ldr r4, =v5
	ldr r4, [r4]
	push {r4}
	ldr r4, =v4
	ldr r4, [r4]
	push {r4}
	bl printf		/* call printf to output our response */
	add sp, #8		/* sp = sp + 8 */
	mov r0, #0		/* exit code 0 = program terminated normally */
	pop {pc}		/* exit our main function */
