%include        'functions_str.asm' ; подключаем функции для ввода и вывода строк
%include        'functions_mysteak.asm' ; подключаем функции для работы со стеком
%include        'functions_mirror_str.asm' ; подключаем функции для переворота строки

 
SECTION .data

msg_add_str		db      'Введите строку: ', 0h      ; сообщение пользователю
msg_result_str	db      'Результат: ', 0h           ; сообщение с результатом
error_mysteak_crowded db 'Ошибка стек был переполнен во время выполнения программы', 0h
error_mysteak_empty db 'Ошибка стек был пуст во время выполнения программы', 0h
 
SECTION .bss

str:     			resb   32		; память под введеную строку
len_str equ $ - str					; длинна строки ; что бы в коде не править во всех местах
mysteak: 			resb	16		; ставим память под стек меньше чем память под строку
len_mysteak equ $ - mysteak			; длинна стека ; что-бы выполнять проверку о заполненности стека
count_for_mysteak:	resd 	1		; переменная для указателя стека
 
SECTION .text
global  _start
 
_start:
 
	mov dword [count_for_mysteak], 0 ; обнуляем указатель стека
 
    mov     eax, msg_add_str ; сообщение в регистр
    call    sprintLF ; напечатать его

    mov     edx, len_str ; кол-во байт на чтение
    mov     ecx, str ; указание на память в которую будем писать строку  
	call sread ; считать строку
	
	mov		edx, 0
	call mirror_str ; отражаем строку с помошью нашего стека

	call    quit








