.model small
.stack 100h
.data

.code
main proc
    
    mov ah,1
    int 21h  
    mov bl,al
    and bl, 11011111b
    call newline
    
    mov dl, bl
    mov ah,2
    int 21h
      
    mov ah,4ch
    int 21h
    
    main endp 

newline proc
    mov dl,10
    mov ah,2
    int 21h
    mov dl,13
    mov ah,2
    int 21h 
    ret
    newline endp

end main