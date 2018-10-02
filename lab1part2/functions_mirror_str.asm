;------------------------------------------
;отражение строки через mysteak
mirror_str:

	call mirror_str_in_mysteak ; занести строку посимвольно в стек
	
    call mirror_str_out_mysteak ; считать посимвольно строку из стека
    
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
