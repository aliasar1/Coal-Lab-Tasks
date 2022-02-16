.model small
.stack 100h
.data
prompt1 db 'Program has ended.$'

.code 
main proc
    
    mov ax,@data
    mov ds,ax
    
    mov cx,20 
    
    L1:
    mov dl,'*'
    mov ah,2
    int 21h
    
    mov dl,10
    mov ah,2
    int 21h
    mov dl,13
    mov ah,2
    int 21h
    loop L1
    
    mov dx,offset prompt1         
    mov ah,9
    int 21h

    mov ah,4ch
    int 21h
    
    main endp
end main