.model small
.stack 100h
.data
star dw 1

.code
main proc
    mov ax,@data
    mov ds,ax 
    mov cx,5
    L1:
    mov bx,cx
    mov cx,star
    L2:
    mov dl,'*'
    mov ah,2
    int 21h
    loop L2  
    inc star
    
    mov dl,10
    mov ah,2
    int 21h
    mov dl,13
    mov ah,2
    int 21h
    mov cx,bx
    loop L1   
         
    mov ah,4ch
    int 21h
    
    main endp
end main
    
    