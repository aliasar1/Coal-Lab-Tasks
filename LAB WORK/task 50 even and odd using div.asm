.model small
.stack 100h
.data
even db 10,13,'EVEN NUMBER!$'
odd db 10,13,'ODD NUMBER!$'
.code
main proc
    mov ax,@data
    mov ds,ax 
    
    mov ah,1
    int 21h
    mov dl,al
    mov bl,2 
    div bl
    cmp ah,0 
    jne L1
    lea dx,even
    mov ah,9
    int 21h
    jmp exit
    L1:
    lea dx,odd
    mov ah,9	
    int 21h 
    
    exit:
    mov ah,4ch
    int 21h
main endp
end main
