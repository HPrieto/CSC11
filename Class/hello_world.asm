.global main

.section .data

hello_msg : .asciz "Hello World\n"

.section .text

main :
	push { lr }
	
	ldr = r0, =hello_msg
	bl  printf
	mov r0, #0
	pop { pc }
