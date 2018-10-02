;------------------------------------------
;отражение строки через mysteak
mirror_str:

	call mirror_str_in_mysteak ; занести строку посимвольно в стек
	
	cmp edx, 1
	jz print_error_mysteak_crowded
	
    call mirror_str_out_mysteak ; считать посимвольно строку из стека
    
    cmp edx, 2
    jz print_error_mysteak_empty
    
    mov     eax, msg_result_str ; вывод сообщения о результате
    call    sprint
 
    mov     eax, str     ; вывод самого результата
    call    sprintLF   
    
	ret
	
print_error_mysteak_crowded:

    mov     eax, error_mysteak_crowded ; сообщение в регистр
    call    sprintLF ; напечатать его

	ret
	
print_error_mysteak_empty:

    mov     eax, error_mysteak_empty ; сообщение в регистр
    call    sprintLF ; напечатать его

	ret	
	
;------------------------------------------
; запись строки в наш стек	
	
mirror_str_in_mysteak:
	
	mov     ecx, str ;
	jmp     mirror_str_char_in_mysteak
	
	mirror_str_char_in_mysteak:
	cmp		byte [ecx], 0
	jz      mirror_str_in_mysteak_finish
	
	call mypush
	
	inc     ecx
    jmp     mirror_str_char_in_mysteak	
    
    mirror_str_in_mysteak_finish:
    
    ret
    
;------------------------------------------
; запись данных из стека в строку

mirror_str_out_mysteak:

    mov     ecx, str ;
    jmp     mirror_str_char_out_mysteak
    
	mirror_str_char_out_mysteak:
	cmp		dword [count_for_mysteak], 0
	jz      mirror_str_out_mysteak_finish
	
	call mypop
	
	inc     ecx
    jmp     mirror_str_char_out_mysteak
    
    mirror_str_out_mysteak_finish:
    
    ret
