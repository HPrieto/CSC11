// bare bones source file 
.global main

//.align 4
.text
main: 	push {lr} // save link register, this is one of many ways this can be done

	// assembly program here

	mov r0, #0 // return code for your program (must be 8 bits)
	pop {pc}

.data
	// all program data goes here, variables, constants, etc
