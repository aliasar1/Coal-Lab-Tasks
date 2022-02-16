.model small
.stack 100h
.data
msg db 'Enter Password: $'
pass db 30 dup('$')
.code 
main proc
    mov ax,@data
    mov ds,ax
    
    lea dx, msg
    mov ah,9
    int 21h
    mov DI, offset pass
    
    l1:
    mov ah,7
    int 21h
    cmp al, 13
    je terminate
    mov [DI],al
    inc DI  
    mov dl,"*"
    mov ah,2 
    int 21h
    jmp l1
    
    terminate:
    mov ah,4ch
    int 21h   
    
    main endp
end main