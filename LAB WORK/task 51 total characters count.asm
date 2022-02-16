.model small
.stack 100h
.data 
msg1 db 'Enter a statement: $'
msg2 db 10,13,'Total number of characters: $' 
count db 0
.code
main proc
    mov ax,@data
    mov ds,ax 
    
    lea dx,msg1
    mov ah,9
    int 21h
    scan:
    mov ah,1
    int 21h
    cmp al,13
    je terminate
    cmp al,' '
    je scan
    jmp addcount 
    
    addcount:
    inc count
    jmp scan 
    
    terminate:
    lea dx,msg2
    mov ah,9
    int 21h  

    mov al,count
    aam
    mov dh,al
    add ah,30h
    mov dl,ah
    mov ah,2
    int 21h  
    
    mov al,dh
    add al,30h
    mov dl, al
    mov ah,2
    int 21h 
    
    mov ah,4ch
    int 21h

main endp
end main
