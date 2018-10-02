;------------------------------------------
; mypop -- ecx тут аргумент куда вести запись из стека

mypop:

	dec dword [count_for_mysteak]
	mov ebx, [count_for_mysteak]
	mov al, [mysteak+ebx]
	mov [ecx], al
	
	ret
	
;------------------------------------------
; mypush -- ecx тут аргумент откуда вести запись в стек

mypush:

	mov ebx, [count_for_mysteak]
	mov al, [ecx]
	mov [mysteak+ebx], al
	inc dword [count_for_mysteak]
	
	ret
