.model small
.stack 100h
.data
.code
main proc 
    
    mov ah,7
    int 21h
    mov bl,al
    sub bl,30h
    
    mov ah,7
    int 21h
    sub al,30h 
    mov ah,0
    div bl  
    
    mov bh,ah
    mov bl,al
    
    add bh,48
    add bl,48
    
    mov dl,bl
    mov ah,2
    int 21h
    
    mov dl,'r'
    mov ah,2
    int 21h 
    
    mov dl,bh
    mov ah,2
    int 21h
    
    mov ah, 4ch
    int 21h 
    
    main endp
end main