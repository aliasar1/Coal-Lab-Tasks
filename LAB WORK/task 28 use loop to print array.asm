.model small
.stack 100h
.data
arr1 db 68,65,97,'#',56,'4'

.code
main proc
    mov ax,@data
    mov ds,ax  
    mov cx,6
     
    L1: 
    mov DI,offset arr1
    add DI,cx
    sub DI,6 
    neg DI
    mov dl,[DI]
    mov ah,2
    int 21h
    loop L1
    
    mov ah,4ch
    int 21h   
    
    main endp
end main
