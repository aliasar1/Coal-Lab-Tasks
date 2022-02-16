.model small
.stack 100h
.data
.code
main proc
    
    mov dl,'a'
    mov ah,2
    int 21h
    
    mov dl,'l'
    mov ah,2
    int 21h
    
    mov dl,'i'
    mov ah,2
    int 21h
    
    mov dl,' '
    mov ah,2
    int 21h
    
    mov dl,'a'
    mov ah,2
    int 21h
    
    mov dl,'s'
    mov ah,2
    int 21h
    
    mov dl,'a'
    mov ah,2
    int 21h
    
    mov dl,'r'
    mov ah,2
    int 21h
    
    mov ah,4ch
    int 21h
    
    main endp
end main