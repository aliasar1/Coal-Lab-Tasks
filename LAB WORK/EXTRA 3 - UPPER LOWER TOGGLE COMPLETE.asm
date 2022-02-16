print_string macro v1
    lea dx,v1
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

clear_lower macro counter 
    local L1
    mov cx,counter
    mov SI, offset arr1
    L1:
    mov [SI],'$'
    inc SI
    loop L1
endm 

clear_upper macro counter 
    local L2
    mov cx,counter
    mov DI, offset arr2
    L2:
    mov [DI],'$'
    inc DI
    loop L2
endm  

clear_toggle macro counter 
    local L3
    mov cx,counter
    mov BX, offset arr3
    L3:
    mov [BX],'$'
    inc BX
    loop L3
endm  

display macro d1
    mov dl,d1
    mov ah,2
    int 21h
endm

conv macro counts
    mov ax,counts
    AAM 
    mov cx,ax
    add ch,30h
    display ch  
    add cl,30h
    display cl
endm

.model small
.stack 100h
.data
msg1 db 'Enter a statement: $'
lower db 'Statement in lower case: $'
upper db 'Statement in upper case: $'
toggle db 'Statement in toggle case: $'  
arr1 db 50 dup('$')   
arr2 db 50 dup('$')
arr3 db 50 dup('$')   
msg2 db 'Use ENTER key to run program again or ESC key to terminate the program. $' 
count dw 0  
words db 'Total characters in statement are: $'
count_word dw 30h

.code
main proc
    
    mov ax,@data
    mov ds,ax
    
    Start: 
    mov count,0
    mov count_word,30h 
    mov SI, offset arr1
    mov DI, offset arr2
    mov BX, offset arr3 
    new_line   
    print_string msg1  
    
    L1:  
    mov ah,1
    int 21h
    cmp al,13
    je show 
    cmp al,20h
    je space   
    mov ch,al    
    or al, 00100000b
    mov [SI], al 
    mov al,ch
    and al, 11011111b
    mov [DI], al
    mov al,ch 
    xor al,00100000b
    mov [BX], al
    inc SI
    inc DI
    inc BX
    inc count_word
    inc count
    jmp L1  
    
    space:
    mov [SI], al
    mov [DI], al
    mov [BX], al
    inc SI
    inc DI
    inc BX  
    inc count
    jmp L1 
    
    show: 
    new_line 
    print_string lower
    print_string arr1  
    new_line 
    print_string upper
    print_string arr2 
    new_line  
    print_string toggle
    print_string arr3
    new_line
    print_string words 
    sub count_word,30h
    conv count_word 
    mov SI, offset arr1
    mov DI, offset arr2
    mov BX, offset arr3  
    clear_lower count
    clear_upper count
    clear_toggle count
    jmp again
    
    
    again:  
    new_line 
    print_string msg2 
    mov ah,1
    int 21h
    cmp al,13
    je start
    cmp al,27
    je exit
    jmp again
    
    exit:
    mov ah,4ch
    int 21h 
    
    main endp
end main