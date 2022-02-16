.model small
.stack 100h
.data
array1 dw '1','2','3','4','5','$'
.code
main proc
    mov ax,@data
    mov ds,ax       
    
    mov si,0
    mov dx,array1[si]
    mov ah,2
    int 21h    
    
    add si,2 
    mov dx,array1[si] 
    mov ah,2
    int 21h   
    
    add si,2  
    mov dx,array1[si]
    mov ah,2
    int 21h
    
    mov ah,4ch
    int 21h
    
    main endp
end main