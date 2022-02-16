.model small
.stack 100h
.data
msg1 db 'Enter a statement in UPPER CASE: $'
msg2 db 10,13,'Converted to lower case: $'
str1 db 50 dup('$') 
.code
main proc
    
    mov ax,@data
    mov ds,ax
    
    lea dx,msg1
    call display
    
    mov SI, offset str1
    L1:
    mov ah,1
    int 21h
    cmp al,13
    je convert 
    add al,20h
    mov [SI],al
    inc SI
    jmp L1
    
    convert: 
    lea dx,msg2
    call display
    lea dx,str1
    call display
    mov ah,4ch
    int 21h
    
    
    main endp 
display proc
    mov ah,9
    int 21h
    ret
    display endp
end main
