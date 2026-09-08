%include "../LIB/pc_io.inc"  	

section	.text
	global _start
	
_start:                   
	mov edx, msg		; edx = dirección de la cadena msg
	call puts			; imprime cadena msg terminada en valor nulo (0)

	mov	eax, 1	    	; seleccionar llamada al sistema para fin de programa
	int	0x80        	; llamada al sistema - fin de programa

section	.data
msg	db  'abcdefghijklmnopqrstuvwxyz0123456789',0xa,0 