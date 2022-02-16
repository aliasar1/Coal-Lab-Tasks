.model small
.stack 100h
.data 
prompt1 db 'Enter a statement: $'
arr1 db 30 dup('$')             

.code
main proc
    mov ax,@data
    mov ds,ax  
    
    lea dx,prompt1
    mov ah,9
    int 21h
    
    mov DI, offset arr1
    L1:
    mov ah,1
    int 21h
    cmp al,13
    je exit
    mov [DI],al
    inc DI
    jmp L1
    
    exit:
    mov ah,4ch
    int 21h   
    
    main endp
end main
