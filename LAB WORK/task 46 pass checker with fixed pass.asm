.model small
.stack 100h
.data
prompt db "Enter password: $" 
user_pass db 30 dup('$')
pass db 'szabist','$'
correct db "Correct password$"
incorrect db "Incorrect password$"  
count dw 0    
     
.code
main proc
    
    mov ax,@data
    mov ds,ax    
    
    lea dx, prompt
    call print
    
    mov SI,offset pass

Len: 
    mov al, [SI]
    cmp al,'$'
    je Lvl1 
    inc SI
    inc count
    jmp Len 

Lvl1:    
    mov DI, offset user_pass
    
L1:
    mov ah,7
    int 21h 
    
    cmp al,13
    je check_pass 

    mov [DI], al
    inc DI
    call star
    jmp L1
    
    call new_line
    
check_pass:       
    mov cx,count 
    mov SI, offset pass
    mov DI, offset user_pass 
    
compare: 
    mov al,[SI]
    mov bl,[DI]
    cmp al,bl
    jne wrong
    inc SI
    inc DI
    loop compare
    jmp right
    
wrong:
    call new_line
    lea dx, incorrect
    call print
    jmp terminate
      
right:
    call new_line
    lea dx, correct
    call print 
    jmp terminate
    
terminate:
    mov ah,4ch
    int 21h
    
    main endp 

star proc
    mov dl,'*'
    mov ah,2
    int 21h
    ret
    star endp 

new_line proc
    mov dl,10
    mov ah,2
    int 21h
    mov dl,13
    mov ah,2
    int 21h
    ret 
    new_line endp 

print proc
    mov ah,9
    int 21h
    ret
    print endp
    
end main