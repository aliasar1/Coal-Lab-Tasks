.model small
.stack 100h
.data
msg1 db 'Enter a sentence: $'
msg2 db 'Total vowels: $'
msg3 db 'Total consonants: $'  
msg4 db 'Press Y to run again or ESC key to terminate: $'
vowels db 30h
consonants db 30h
.code
main proc
    
    mov ax,@data
    mov ds,ax
    
    L1: 
    lea dx,msg1 
    call display
    
    L2:
    mov ah,1
    int 21h 
    cmp al,13
    je show 
    cmp al,32
    je L2
    cmp al,'A'
    je vowel
    cmp al,'a' 
    je vowel
    cmp al,'E'
    je vowel
    cmp al,'e'
    je vowel
    cmp al,'I'
    je vowel
    cmp al,'i'
    je vowel
    cmp al,'O'
    je vowel
    cmp al,'o'
    je vowel
    cmp al,'U'
    je vowel
    cmp al,'u'
    je vowel
    jmp consonant
    
    vowel:
    inc vowels
    jmp L2  
    
    consonant:
    inc consonants
    jmp L2 
    
    show: 
    call newline
    lea dx,msg2
    call display
    mov dl,vowels
    mov ah,2
    int 21h
    call newline
    lea dx,msg3
    call display
    mov dl,consonants
    mov ah,2
    int 21h
    mov vowels,30h
    mov consonants,30h
    
    L3:
    call newline
    lea dx,msg4
    call display
    mov ah,1   
    int 21h 
    mov bl,al
    call newline
    cmp bl,'Y'
    je L1
    cmp bl,27
    je exit
    jmp L3
    
    exit:
    mov ah,4ch
    int 21h 
      
    main endp

display proc
    mov ah,9
    int 21h
    ret
    display endp

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