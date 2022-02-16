.model small
.stack 100h
.data
.code
main proc 
    
    call takeInput
    call display
    
    mov ah,4ch
    int 21h
    
    main endp  
takeInput proc
    mov ah,1
    int 21h
    ret
    takeInput endp     

display proc 
    mov dl,al
    mov ah,2
    int 21h
    ret
    display endp

end main
