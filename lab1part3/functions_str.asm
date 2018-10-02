;------------------------------------------
; запись строки в память
sread:

    push    eax
    push    ebx

    mov     ebx, 0 ; записать в файл STDIN
    mov     eax, 3 ; вызывать SYS_READ (код инструкции 3)
    int     80h
    
    pop     ebx
    pop		eax
    
    ret

;------------------------------------------
; вычислить длинну строки
slen:
    push    ebx
    mov     ebx, eax
 
nextchar:
    cmp     byte [eax], 0
    jz      finished
    inc     eax
    jmp     nextchar
 
finished:
    sub     eax, ebx
    pop     ebx
    ret
 
 
;------------------------------------------
; вывод строки
sprint:
    push    edx
    push    ecx
    push    ebx
    push    eax
    call    slen
 
    mov     edx, eax
    pop     eax
 
    mov     ecx, eax
    mov     ebx, 1
    mov     eax, 4
    int     80h
 
    pop     ebx
    pop     ecx
    pop     edx
    ret
 
 
;------------------------------------------
; вывод строки с переходом на новую строку
sprintLF:
    call    sprint
 
    push    eax
    mov     eax, 0AH
    push    eax
    mov     eax, esp
    call    sprint
    pop     eax
    pop     eax
    ret
 
 
;------------------------------------------
; выход из программы
quit:
    mov     ebx, 0
    mov     eax, 1
    int     80h
    ret
