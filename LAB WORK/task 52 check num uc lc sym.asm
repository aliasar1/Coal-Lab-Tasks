print macro var
    lea dx, var
    mov ah, 9
    int 21h
endm
.model small
.stack 100h
.data
inputMsg DB 10,13,"Enter a character: $"
uppercase DB 10,13, "You entered upper case letter $"
lowercase DB 10,13, "You entered lower case letter $"
number DB 10,13, "You entered a number $"
symbol DB 10,13, "You entered a special character $"

.code 
main PROC
    mov ax, @data
    mov ds,ax
    
takeInput:

    print inputMsg
    mov ah,1
    int 21h
    
    cmp al, 7bh
    jge symP
    cmp al, 61h
    jge lclP
    cmp al, 5bh
    jge symP
    cmp al, 41h
    jge uclP
    cmp al, 3ah
    jge symP
    cmp al, 30h
    jge numP
    
    cmp al, 13
    je terminate
    
    jmp symP
    
uclP:
    print uppercase
    jmp takeInput
lclP:
    print lowercase
    jmp takeInput
numP:
    print number
    jmp takeInput
symP:
    print symbol
    jmp takeInput 
    
terminate:
    mov ah,4ch
    int 21h
        
    main endp
end main