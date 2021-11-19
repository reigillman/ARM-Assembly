.data
bPrompt: .asciz "Please guess the number (0 to 255):"
		   .align
tlPrompt: .asciz "Incorrect: Your number is too low."
		   .align
thPrompt: .asciz "Incorrect: Your number is too high."
		   .align
wPrompt: .asciz "Correct! Amount of tries: "
		   .align

.text
random:
	swi 0x6d
	AND r0,r0,#0xFF
	mov r2,r0
	
loop:
	mov r0,#1
	ldr r1,=bPrompt
	swi 0x69
	
	mov r0,#0
	swi 0x6c
	
	add r3,r3,#1
	
	add r0,r0,#1
	
	cmp r0,r2
	blt toolow
	
	cmp r0,r2
	bgt toohigh
	
	b youwin
	
toolow:
	mov r0,#1
	ldr r1,=tlPrompt
	swi 0x69
	b loop

toohigh:
	mov r0,#1
	ldr r1,=thPrompt
	swi 0x69
	b loop

youwin:
	mov r0,#1
	ldr r1,=wPrompt
	swi 0x69
	
	mov r0,#1
	mov r1,r3
	swi 0x6b
	
	swi 0x11
	

.end