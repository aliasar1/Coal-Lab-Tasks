.model small
.stack 100h
.data
msg1 dw 'Press (+) for addition, Press (-) for subtraction or (Esc key) to terminate the program: $'
num1 db 'Enter first number: $',
num2 db 'Enter second number: $'

main proc
    
    mov ax,@data
    mov ds,ax 
    
    L1:
    lea dx,msg1  
    call display
    
    mov ah,1
    int 21h
    cmp al,'+'
    je addition
    cmp al,'-'
    je subtraction
    cmp al,27
    je terminate
    jmp L1 
    
    addition: 
    call newline
    call takeInput 
    mov cl,bl
    add cl,bh
    sub cl,30h
    jmp showAdd
    
    showAdd: 
    call newline
    mov dl,bl
    call show 
    mov dl,'+'
    call show 
    mov dl,bh
    call show
    mov dl,'='
    call show
    mov dl,cl
    call show 
    call newline
    jmp L1
    
    subtraction:
    call newline
    call takeInput 
    mov cl,bl
    sub cl,bh
    add cl,30h
    jmp showSub
    
    showSub: 
    call newline
    mov dl,bl
    call show 
    mov dl,'-'
    call show 
    mov dl,bh
    call show
    mov dl,'='
    call show
    mov dl,cl
    call show 
    call newline
    jmp L1
    
    terminate:
    mov ah,4ch
    int 21h
    
    main endp 

takeInput proc  
    mov cl,0
    mov bl,0
    mov bh,0
    lea dx,num1
    call display
    mov ah,1
    int 21h
    mov bl,al 
    call newline
    lea dx,num2
    call display
    mov ah,1  
    int 21h   
    mov bh,al
    ret
    takeInput endp

display proc
    mov ah,9
    int 21h
    ret
    display endp 

show proc
    mov ah,2
    int 21h
    ret 
    show endp 

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