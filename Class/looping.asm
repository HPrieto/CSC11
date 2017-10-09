.global main
.data

// High Word -> top 32-bits, bits 63 -> 32,
// Low Word  -> the lower 32-bits, bits 31 -> 0
//       High Word    Low Word
x: .word 0xFFFFFFF, 0xA000001
y: .word 0x7000000, 0xFFFFFFF
z: .word 0x0, 		0x0

// our program to perform z = x + y
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

	pop {pc}