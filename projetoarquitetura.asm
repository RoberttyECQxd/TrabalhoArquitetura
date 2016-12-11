section .data
	msg1 db 'Informe o valor '
	lenmsg1 equ $- msg1
	msg2 db ' do primeiro vetor: '
	lenmsg2 equ $- msg2
	msg3 db ' do segundo vetor: '
	lenmsg3 equ $- msg3
	msg4 db 0xa, 'Valor '
	lenmsg4 equ $- msg4
	msg5 db ' do terceiro vetor: '
	lenmsg5 equ $- msg5
	msg6 db 0xa
	lenmsg6 equ $- msg6
	
	vetA TIMES 10 DB 0
	vetB TIMES 10 DB 0
	vetC TIMES 10 DB 0
	
section .bss
	num resb 0
	res resb 0
section .text
	global _start
_start:
	
	mov ecx,10
    mov eax,'0'
	mov ebp, vetA

l1:
	mov [num],eax
    push ecx
    
	mov eax, 4
	mov ebx, 1
	mov ecx, msg1
	mov edx, lenmsg1
	int 80h
	
	
	mov eax, 4
	mov ebx, 1
	mov ecx, num
	mov edx, 2
	int 80h
	
	mov eax, 4
	mov ebx, 1
	mov ecx, msg2
	mov edx, lenmsg2
	int 80h
	
	
	mov ecx, ebp
	mov eax, 3
	mov ebx, 2
	mov edx, 2
	int 80h
	
	mov eax, [ebp]
	sub eax, 30h
	mov [ebp], eax
	
	mov eax, [num]	
    sub eax, '0'
    inc eax
    inc ebp
    add eax, '0'
    pop ecx
    
    loop l1
    
    mov eax, 4
	mov ebx, 2
	mov ecx, msg6
	mov edx, lenmsg6
	int 80h
	
    mov ecx,10
    mov eax,'0'
	mov ebp, vetB

l2:
	mov [num],eax
    push ecx
    
	mov eax, 4
	mov ebx, 1
	mov ecx, msg1
	mov edx, lenmsg1
	int 80h
	
	
	mov eax, 4
	mov ebx, 1
	mov ecx, num
	mov edx, 2
	int 80h
	
	mov eax, 4
	mov ebx, 1
	mov ecx, msg3
	mov edx, lenmsg3
	int 80h
	
	
	mov ecx, ebp
	mov eax, 3
	mov ebx, 2
	mov edx, 2
	int 80h
	
	mov eax, [ebp]
	sub eax, 30h
	mov [ebp], eax
	
	
	mov eax, [num]	
    sub eax, '0'
    inc eax
    inc ebp
    add eax, '0'
    pop ecx
    
    loop l2
    
    
	mov ecx, 10
    mov ebp, vetA
    mov eax, vetB
    mov edx, vetC
	
soma:
	mov ebx, 0
	push ecx
    
    add ebx, [ebp]
    add ebx, [eax]
	
	mov [edx], ebx
	
	inc ebp
	inc eax
	inc edx
	
	pop ecx
    
    loop soma
    
    mov ecx,10
    mov eax,'0'
    mov ebp, vetC

l3:
	mov [num],eax
    push ecx
    
	mov eax, 4
	mov ebx, 1
	mov ecx, msg4
	mov edx, lenmsg4
	int 80h
	
	
	mov eax, 4
	mov ebx, 1
	mov ecx, num
	mov edx, 2
	int 80h
	
	mov eax, 4
	mov ebx, 1
	mov ecx, msg5
	mov edx, lenmsg5
	int 80h
	
	mov eax, [ebp]
	add eax, 30h
	mov [ebp], eax
	
	mov ecx, ebp
	mov eax, 4
	mov ebx, 1
	mov edx, 1
	int 80h

	
	inc ebp

	mov eax, [num]	
    sub eax, '0'
    inc eax
    add eax, '0'
    pop ecx
    
    loop l3
	
	mov eax, 4
	mov ebx, 2
	mov ecx, msg6
	mov edx, lenmsg6
	int 80h
	
	mov eax, 1
	mov ebx, 0
	int 80h

