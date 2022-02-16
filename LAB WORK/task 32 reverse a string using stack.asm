.model small
.stack 100h
.data
msg1 db 'hello world$'
.code
main proc 
    
    mov ax,@data
    mov ds,ax
    
    mov DI, offset msg1 
    mov bl,0
    
    L1:   
    mov al,[DI]
    cmp al,'$'
    je reverse 
    mov ah,0
    push ax
    inc bl  
    inc DI
    jmp L1
       
    reverse:
    pop dx
    mov ah,2
    int 21h
    dec bl
    cmp bl,0
    je exit
    jmp reverse
    
    exit:
    mov ah,4ch
    int 21h
    
    main endp
end main