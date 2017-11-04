.global main
.data

// Word 127:96 -> Word with Bits 127 to 96
// Word  95:64 -> Word with Bits 95 to 64
// Word  63:32 -> Word with Bits 63 to 32
// Word  31:0 -> Word with Bits 31 to 0

//	 Word 127:96	Word 95:64	Word 63:32	Word 31:0
x: .word 0x7FFFFFFF,	0x00000001,	0xFFFFFFFF,	0xFFFFFFF8
y: .word 0x70000000,	0xFFFFFFFF,	0xFFFFFFFF,	0xFFFFFFF9
z: .word 0x00000000, 	0x00000000,	0x00000000,	0x00000000

.text
main:
	push {lr}		// save original lr

	ldr r0, =x		// r0 contains pointer to x
	ldr r0, [r0, #12]	// dereference [r0+12], gets value at x[31:0]
	ldr r1, =y		// r1 contains pointer to y
        ldr r1, [r1, #12]	// dereference [r1+12], gets value at y[31:0]
	adds r2, r0, r1		// add (with status flag update) r2 = r0 + r1
	ldr r0, =z		// r0 contains pointer to z
	str r2, [r0, #12]	// store z[31:0] at dereferenced pointer [r0+12]

        ldr r0, =x              // r0 contains pointer to x
        ldr r0, [r0, #8]       	// dereference [r0+8], gets value at x[63:32]
        ldr r1, =y              // r1 contains pointer to y
        ldr r1, [r1, #8]        // dereference [r1+8], gets value at y[63:32]
        adcs r2, r0, r1         // add with carry (with status flag update) r2 = r0 + r1 + carry
        ldr r0, =z              // r0 contains pointer to z
        str r2, [r0, #8]        // store z[63:32] at dereferenced pointer [r0+8]

        ldr r0, =x              // r0 contains pointer to x
        ldr r0, [r0, #4]        // dereference [r0+4], gets value at x[95:64]
        ldr r1, =y              // r1 contains pointer to y
        ldr r1, [r1, #4]        // dereference [r1+4], gets value at y[95:64]
        adcs r2, r0, r1         // add with carry (with status flag update) r2 = r0 + r1 + carry
        ldr r0, =z              // r0 contains pointer to z
        str r2, [r0, #4]        // store z[95:64] at dereferenced pointer [r0+4]

        ldr r0, =x              // r0 contains pointer to x
        ldr r0, [r0]       	// dereference [r0], gets value at x[127:96]
        ldr r1, =y              // r1 contains pointer to y
        ldr r1, [r1]       	// dereference [r1], gets value at y[127:96]
        adcs r2, r0, r1         // add with carry (with status flag update) r2 = r0 + r1 + carry
        ldr r0, =z              // r0 contains pointer to z
        str r2, [r0]       	// store z[127:96] at dereferenced pointer [r0]
halt:
	pop {pc}