.model small
.stack 100h
.data
.code 
main proc
    
    mov cx,26
    mov dl,61h
    L1:    
    mov ah,2
    int 21h
    inc dl
    loop L1
    
    mov ah,4ch
    int 21h
    
    main endp
end main