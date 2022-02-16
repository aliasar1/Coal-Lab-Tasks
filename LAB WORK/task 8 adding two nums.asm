.model small
.stack 100h
.data
.code
main proc
    
    mov bl,3
    mov cl,4
    
    add bl,cl  
    add bl,30h  
    
    mov dl,bl
    mov ah,2
    int 21h
    
    mov ah,4ch
    int 21h
    
    main endp
end main                         



