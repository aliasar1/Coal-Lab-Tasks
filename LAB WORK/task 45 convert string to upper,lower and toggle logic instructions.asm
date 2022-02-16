print macro v1
    lea dx,v1
    mov ah,9 
    int 21h
endm 

new_line macro
    mov dl, 10
    mov ah,2
    int 21h
    mov dl, 13
    mov ah,2
    int 21h 
endm    
    
.model small
.stack 100h
.data
msg db 'Please enter a statement: $'
upper db 'Statement in upper case: $' 
lower db 'Statement in lower case: $'
toggle db 'Statement in toggled case: $'
arr1 db 50 dup ('$')
length dw ?
size dw ?

.code
main proc
    
    mov ax,@data
    mov ds,ax
    
    print msg
    
    lea bx,arr1
    mov cx,0
    
    L1:
    mov ah,1
    int 21h
    cmp al,13
    je d1
    mov [bx],al
    inc cx
    inc bx 
    jmp L1
    
    d1:  
    new_line
    print upper
    mov length,cx
    xor cx,cx  
    mov bx,offset arr1  
    display1: 
    cmp cx,length
    je d2
    mov al,[bx]       
    and al, 11011111b  
    mov dl,al
    call show
    inc cx 
    inc bx
    jmp display1
     
    d2: 
    new_line
    print lower
    xor cx,cx 
    mov bx,offset arr1
    display2: 
    cmp cx,length
    je d3
    mov al,[bx]       
    or al, 00100000b
    mov dl,al
    call show
    inc cx 
    inc bx
    jmp display2
    
    d3: 
    new_line
    print toggle  
    xor cx,cx
    mov bx,offset arr1
    display3: 
    cmp cx,length
    je exit
    mov al,[bx]       
    xor al,00100000b 
    mov dl,al
    call show 
    inc cx 
    inc bx
    jmp display3
    
     
    exit:
    mov ah,4ch
    int 21h 

    main endp       

show proc
    mov ah,2
    int 21h
    ret
    show endp
end main