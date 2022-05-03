extern printf
extern c_checkValidity

section .data                    	; we define (global) initialized variables in .data section
        an: dd 0              		; an is a local variable of size double-word, we use it to count the string characters
	fmt: db "%s", 10, 0 ;
	msg: db "Hello World", 0 ;

section .text                    	; we write code in .text section
        global assFunc         		; 'global' directive causes the function do_Str(...) to appear in global scope

assFunc:                       		; do_Str function definition - functions are defined as labels
        push ebp              		; save Base Pointer (bp) original value
        mov ebp, esp         		; use Base Pointer to access stack contents (do_Str(...) activation frame)
        pushad                   	; push all signficant registers onto stack (backup registers values)

	mov edi, fmt;
	mov esi, msg;
	mov eax, 0;
	call printf;

	pop ebp;

	mov eax, 0
	ret;




myCode:
        pushad;                      ;backup registers
        push ecx;                    ; push first argument of function c_checkValidity
        call c_checkValidity;
        cmp byte eax, 0;
        je negative;
        shl dword eax, 2;
        jmp print;
negative:
        shl dword eax, 3;
print:
	mov edi, fmt
	mov esi, eax
	call printf

        popad                    	; restore all previously used registers
        mov eax,[an]         		; return an (returned values are in eax)
        mov esp, ebp			; free function activation frame
        pop ebp				; restore Base Pointer previous value (to returnt to the activation frame of main(...))
        ret				; returns from do_Str(...) function

myprint:
	mov edi, fmt;
	mov esi, msg;
	mov eax, 0;
	call printf;
	ret
