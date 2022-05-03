extern printf
extern c_checkValidity

section .bss
	result: resd 1

section .data
	fmt:    db "%d", 10, 0 ; printf format string follow by a newline(10) and a null terminator(0), "\n",'0'

section .text
	global assFunc
    
assFunc:
	push ebp
	mov ebp, esp

	mov eax, dword [ebp+8]
	mov [result], eax
	push eax
	call c_checkValidity
	add esp, 4

	cmp eax, 0
	je negative
	shl dword [result], 2
	jmp print
negative:
	shl dword [result], 3
print:
	push dword [result]
	push fmt
	mov al, 0
	call printf
	add esp, 8

end:
	mov esp, ebp
	pop ebp
	mov eax, 0
	ret
