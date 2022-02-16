.model small
.stack 100h
.data   
prompt1 db 'Start typing: $'
prompt2 db 10,13,'You just pressed Enter to terminate the program!$'

.code                                                         
main proc 
    
    mov ax,@data
    mov ds,ax
    
    lea dx,prompt1
    mov ah,9
    int 21h 
    
    L1:
    mov ah,1
    int 21h
    cmp al,13
    je exit
    loop L1
    
    exit:
    lea dx,prompt2
    mov ah,9
    int 21h
    
    mov ah,4ch
    int 21h
    
    main endp
end main