%include "../LIB/pc_io.inc"  	

section	.text
	global _start
	
_start:                   
	mov edx, msg
	call puts

	mov edx, msg
	mov eax, 9
	mov byte [edx + 2*eax + 1], '%'
	call puts

	mov	eax, 1
	int	0x80

section	.data
msg	db  'abcdefghijklmnopqrstuvwxyz0123456789',0xa,0