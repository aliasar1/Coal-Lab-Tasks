print macro v1
    lea dx,v1
    mov ah,9 
    int 21h
endm 

new_line macro
    mov dl, 10
    mov ah,2
    int 21h
    mov dl, 13
    mov ah,2
    int 21h 
endm    
    
.model small
.stack 100h
.data
msg db 'Please enter a statement: $'
lower db 'Statement in lower case: $'
arr1 db 50 dup ('$')

.code
main proc
    
    mov ax,@data
    mov ds,ax
    
    print msg
    
    lea bx,arr1 
    
    L1:
    mov ah,1
    int 21h
    cmp al,13
    je display
    or al, 00100000b
    mov [bx],al
    inc bx 
    jmp L1
    
    display:
    new_line 
    print lower
    print arr1
    
    mov ah,4ch
    int 21h 

    main endp
end main