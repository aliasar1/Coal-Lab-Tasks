.model small
.stack 100h
.data
n1 db 3
n2 db 2
n3 db 1
sum1 db ?

.code
main proc
    
    mov ax,@data
    mov ds,ax
    
    add bl,n1 
    add bl,n2
    add bl,n3
    
    add bl,30h
    mov sum1,bl
    
    mov dl,sum1
    mov ah,2
    int 21h
    
    mov ah,4ch
    int 21h
    
    main endp
end main                         



