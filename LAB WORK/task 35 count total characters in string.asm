.model small
.stack 100h
.data 
str1 db 'Enter a statement: $'
str2 db 10,13,'Total number of characters entered are: $'
.code
main proc
    
    mov ax,@data
    mov ds,ax
    
    lea dx,str1
    mov ah,9
    int 21h
    mov bl,0
    
    L1:
    mov ah,1
    int 21h
    cmp al,13
    je display
    cmp al,32
    je L1
    inc bl
    jmp L1
    
    display:
    lea dx,str2
    mov ah,9
    int 21h
    add bl,30h
    mov dl,bl
    mov ah,2
    int 21h
    
    mov ah,4ch
    int 21h
    
    main endp
end main