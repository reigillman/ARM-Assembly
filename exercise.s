.data
x: .asciz "30"
y: .asciz "20"
z: .asciz "10"

.text
	ldr r0,=x;
	ldr r1,=y;
	ldr r2,=z;
	cmp r0,r1
	cmpgt r1,r2
	bgt next1
	cmp r1, r2
	cmplt r1, r0
	blt next2
	ORR r5,r3,r4
	swi 0x011
	
next1:
	mov r3, r0

next2:
	mov r4, r1


.end