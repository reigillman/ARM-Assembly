.data
notEven: .asciz "Number is not even"
arraySize: .asciz "The array size is "
bPrompt: .asciz "Enter numbers between 0 and 255 (up to the array size):"
myArray: .skip 40

.text
 
	swi 0x6d
	AND r0,r0,#0xF
	mov r2,r0
	
	AND r3,r2,#0xE
	cmp r3,r2
	bne exit

	mov r0,#1
	ldr r1,=arraySize
	swi 0x69
	mov r1,r2
	swi 0x6b
	
	mov r6,r1

loop:
	swi 0x6d
	AND r0,r0,#0xFF
	mov r2,r0
	
	ldr r0,=myArray
	ldr r1,[r0]
	
	mov r0,r2
	
	mov r3,r3,ASR#1
	cmp r6,r3
	bgt endLoop
	
	ldrb r1,[r3,r6]
	add r0,r0,r3
	swi 0x69
	
	add r6,r6,#1
	
	ldr r1,[r0],#4
	
	b loop
	
endLoop:
	swi 0x11
	
exit:
	ldr r0,=notEven
	swi 0x69
	swi 0x11


.end