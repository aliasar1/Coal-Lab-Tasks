new_line macro
    mov dl,10
    mov ah,2
    int 21h
    mov dl,13
    mov ah,2
    int 21h
endm

char_input macro
    mov ah,1
    int 21h
endm

display macro str
    lea dx,str
    mov ah,9
    int 21h
endm  

power macro v1 
    mov bl,v1
    and bl,0Fh
    mov al,bl
    imul bl
    AAM  
    mov cx,ax
endm  

show macro 
    add ch,30h
    mov dl,ch
    mov ah,2
    int 21h  
    add cl,30h
    mov dl,cl
    mov ah,2
    int 21h
endm
  

.model small
.stack 100h
.data    
fact db 'FACTORIZATION$'
msg1 db 'Press ',39,'1',39,' to implement (A+B)^2 or press ',39,'2',39,' to (A-B)^2$'
msg2 db 'Please enter a digit ',39,'A',39,' for (A+B)^2: $' 
msg3 db 'Please enter a digit ',39,'B',39,' for (A+B)^2: $' 
res1 db 'The result of (A+B)^2 = $'  
msg4 db 'Please enter a digit ',39,'A',39,' for (A-B)^2: $' 
msg5 db 'Please enter a digit ',39,'B',39,' for (A-B)^2: $' 
res2 db 'The result of (A-B)^2 = $'
again1 db 'User ENTER KEY to run program again or use Esc key to terminate the program: $'
add1 db ?
sub1 db ?

.code
main proc  
    
    mov ax,@data
    mov ds,ax 
    
    display fact 
    
    L1:  
    new_line
    display msg1    
    mov ah,7
    int 21h
    
    cmp al,'1'
    je posEq
    cmp al,'2'
    je negEq
    jmp L1   
    
    posEq: 
    new_line      
    display msg2
    char_input
    mov bl,al 
    new_line
    display msg3
    char_input
    add al,bl
    sub al,30h
    mov add1,al
    new_line   
    power add1
    display res1 
    show 
    jmp again
    
    
    negEq:
    new_line      
    display msg4
    char_input
    mov bl,al 
    new_line
    display msg5
    char_input
    sub bl,al
    add bl,30h
    mov sub1,bl
    new_line
    power sub1
    display res2 
    show
    jmp again
    
    
    again:  
    new_line
    display again1
    mov ah,1
    int 21h
    cmp al,13
    je L1
    cmp al,27
    je exit
    jmp again
                
    exit:            
    mov ah,4ch
    int 21h
    
    
    main endp
end main