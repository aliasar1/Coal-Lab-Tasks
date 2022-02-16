.model small
.stack 100h
.data
.code 
main proc    
    
    mov cx,5
    L1:
    mov dl,'#'
    mov ah,2
    int 21h
    mov bx,cx
    mov cx,3
    L2:
    mov dl,'*'
    mov ah,2
    int 21h
    loop L2
    mov cx,bx
    loop L1
    
    mov ah,4ch
    int 21h   
       
    main endp
end main