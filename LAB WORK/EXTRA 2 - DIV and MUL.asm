input macro
    mov ah,1
    int 21h    
endm  

print_string macro v1
    lea dx, v1
    mov ah,9
    int 21h
endm 

new_line macro
    mov dl,10
    mov ah,2
    int 21h
    mov dl,13
    mov ah,2
    int 21h
endm

calc_mul macro
    and al,0fh
    and bl,0fh
    mul bl
    AAM 
    mov cx,ax
endm 

calc_div macro 
    and al,0fh
    and bl,0fh
    mov ah,0
    div bl
    mov cx,ax
endm 

display macro dest
    mov dl,dest
    mov ah,2
    int 21h
endm

conv macro 
    add ch,30h 
    display ch
    add cl,30h
    display cl
endm



.model small
.stack 100h
.data
msg1 db 'Press (*) for multiplication, Press (/) for division or ESC key to terminate.$'
firstNum db 'Enter first number: $'
secondNum db 'Enter second number: $' 
n1 db ?
n2 db ? 
rem db 'R: $'
quot db 'Q: $'

.code
main proc
    
    mov ax,@data
    mov ds,ax
    
    L1:  
    new_line
    print_string msg1
    input
    cmp al,'*'
    je mult
    cmp al,'/'
    je divide
    cmp al, 27
    je exit
    jmp L1
    
    mult:
    new_line 
    print_string firstNum 
    input
    mov bl,al
    mov n1, bl
    new_line
    print_string secondNum   
    input  
    mov n2, al
    calc_mul
    new_line 
    display n1
    display 'x'
    display n2
    display '='
    conv
    jmp L1
    
    divide:
    new_line 
    print_string firstNum 
    input
    mov bl,al
    mov n1, bl
    new_line
    print_string secondNum  
    input 
    mov n2,al
    calc_div
    new_line
    display n2
    display '/'
    display n1
    display '=' 
    add ch,30h
    display rem
    display ch  
    display quot
    add cl,30h
    display cl
    jmp L1
    
    exit:              
    mov ah,4ch
    int 21h
    
    main endp
end main