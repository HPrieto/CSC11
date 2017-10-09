.global main
.func main

main:
	push {lr}
	sub sp,sp,#8  	//Subtracting 8 off the stack for two inputs
	
	ldr r0, addr_messin     //reading message in
	bl printf		

	ldr r0, addr_format	//specifying its a integer
	mov r1,sp
	

	bl scanf

 	ldr r1,[sp]		//loading that integer to stack

	mov r4,r1		//moving the value from r1 to r4 to reuse reg
		


	ldr r0, addr_messin
	bl printf

	ldr r0, addr_format
	mov r1,sp		//using the stack
	
	bl scanf
	ldr r1,[sp]		//loading the register with value of stack
	
	
	add r1,r4,r1		//adding both r4 and r1 to get sum.
	
	
	ldr r0, addr_messout	//displays the resultant
	bl printf

	add sp,sp,#8		//adding 8 back to stack to neutralize the two inputs.

	pop {pc}

_exit:
	mov pc,lr


addr_messin: .word messagein
addr_format: .word scanformat
addr_messout: .word messageout

.data
messagein: .asciz "Enter a number to sum: "
scanformat: .asciz "%d"
messageout: .asciz "Sum of the two  number's is %d\n"

