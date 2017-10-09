.global main
.data

// High word is the upper 32 bits, bits 63:32
// Low word is the lower 32 bits, bits 31:0

//	 High Word	Low Word
x: .word 0x7FFFFFFF,	0x00000001
y: .word 0x70000000,	0xFFFFFFFF
z: .word 0x0, 		0x0

.text
main:
	push {lr}

	ldr r0, =x
	add r0, #4
	ldr r0, [r0]
	ldr r1, =y
        add r1, #4
        ldr r1, [r1]
	adds r2, r0, r1
	ldr r0, =z
	add r0, #4
	str r2, [r0]
	ldr r0, =x
        ldr r0, [r0]
        ldr r1, =y
        ldr r1, [r1]
        adcs r2, r0, r1
        ldr r0, =z
        str r2, [r0]

	pop {pc}

