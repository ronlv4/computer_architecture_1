section	.rodata			; we define (global) read-only variables in .rodata section
	format_string: db "%s", 10, 0	; format string

section .bss			; we define (global) uninitialized variables in .bss section
	an: resb 12		; enough to store integer in [-2,147,483,648 (-2^31) : 2,147,483,647 (2^31-1)]
	temp: resd 1

section .text
	global convertor
	extern printf

convertor:
	push ebp
	mov ebp, esp	
	pushad

	mov eax, dword [ebp+8]  ; get function argument (pointer to string)
	xor ebx, ebx
        xor ecx, ecx
	xor edx, edx

extractFigure:
	mov byte bl,[eax]
	inc eax
        cmp ebx, 0            ; compare to null terminator
        je exit
        cmp ebx, 0xA          ; compare to newline
        je exit
        sub ebx, '0'
	
	xor ecx, ecx
        mov ecx, 4
printFigure:
	mov dword [temp], ebx
        and dword [temp], ecx
        jnz add1

add0:
        mov byte [an+edx], '0'
        inc edx
	shr ecx, 1
        jnz printFigure
        jmp extractFigure

add1:
        mov byte [an+edx], '1'
        inc edx
	shr ecx, 1
        jnz printFigure        
        jmp extractFigure

exit:
	mov byte [an+edx], 0x0
	push an			; call printf with 2 arguments -  
	push format_string	; pointer to str and pointer to format string
	call printf
	add esp, 8		; clean up stack after call

	popad			
	mov esp, ebp	
	pop ebp
	ret

