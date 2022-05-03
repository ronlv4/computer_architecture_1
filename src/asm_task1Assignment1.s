; Define printf as an external function
extern	printf

SECTION .DATA
    msg:	db "Hello world", 0 ; Zero is Null terminator 
    fmt:    db "%s", 10, 0 ; printf format string follow by a newline(10) and a null terminator(0), "\n",'0'

SECTION .TEXT
    global assFunc
    
assFunc:
    push ebp 
    mov eax, dword [ebp+8]
    call myPrint


end:
    pop ebp
    mov eax, 0
    ret

myPrint:
    push ebp

    mov	edi,fmt
    mov	esi,msg
    mov	eax,0
    call printf

    pop ebp
    ret
