;------------------------------------------
; mypop -- ecx тут аргумент куда вести запись из стека -- edx как сообщение ошибки

mypop:

	cmp dword [count_for_mysteak], 0
	jz mysteak_empty

	dec dword [count_for_mysteak]
	mov ebx, [count_for_mysteak]
	mov al, [mysteak+ebx]
	mov [ecx], al
	jmp mypop_finish

mysteak_empty:

	mov edx, 2
	
	jmp mypop_finish
	
mypop_finish:	
	
	ret
	
;------------------------------------------
; mypush -- ecx тут аргумент откуда вести запись в стек -- edx как сообщение ошибки

mypush:

	cmp dword [count_for_mysteak], len_mysteak
	jz mysteak_crowded
	
	mov ebx, [count_for_mysteak]
	mov al, [ecx]
	mov [mysteak+ebx], al
	inc dword [count_for_mysteak]
	jmp mypush_finish
	
mysteak_crowded:

	mov edx, 1
	jmp mypush_finish
	
mypush_finish:	
	
	ret
	
	ret
