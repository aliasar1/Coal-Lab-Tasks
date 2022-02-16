.model small
.stack 100h
.data
.code
main proc
    
    mov ah,1
    int 21h
    mov bl,al
        
    mov dl,'-'
    mov ah,2
    int 21h
    
    mov ah,1
    int 21h
    mov cl,al 
    
    sub bl,cl  
    add bl,30h
    
    mov dl,'='
    mov ah,2
    int 21h
    
    mov dl,bl
    mov ah,2
    int 21h
    
    mov ah,4ch
    int 21h
    
    main endp
end main                         



