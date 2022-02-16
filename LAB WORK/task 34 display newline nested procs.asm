.model small
.stack 100h
.data 
name1 db "Name: Ali Asar Khowaja$"
reg1 db "Reg ID: 2012285$" 
email1 db "Email: bscs2012285@szabist.pk$"
uni1 db "Institution name: SZABIST$"
.code
main proc
    
    mov ax,@data
    mov ds,ax
    
    lea dx,name1
    call display
    
    lea dx,reg1
    call display
    
    lea dx,email1
    call display
    
    lea dx,uni1
    call display
    
    mov ah,4ch
    int 21h 
    
    main endp  

display proc 
    mov ah,9
    int 21h
    call newline
    ret 
    display endp

newline proc
    mov dl,10
    mov ah,2
    int 21h
    mov dl,13
    mov ah,2
    int 21h
    ret
    newline endp
end main
