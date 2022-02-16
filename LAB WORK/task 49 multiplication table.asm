newline macro
    mov dl,10
    mov ah,2
    int 21h
    
    mov dl,13
    mov ah,2
    int 21h     
endm

display macro p1
    lea dx,p1
    mov ah,9
    int 21h
endm     

char macro p2
    mov dl,p2
    mov ah,2
    int 21h
endm

.model small
.stack 100h
.data
arr1 db "Please enter a digit: $" 
var1 db ?
var2 db ?
var3 db ? 
var4 db ?  
var5 db ? 
ten db "10$"
.code
main proc       
    mov ax,@data
    mov ds,ax
    
    display arr1
    
    mov ah,1
    int 21h 
    mov var3,al
    sub al,48
    mov var1,al
    
    newline
    
    mov al,var1
    
    mov bl,1 
    mov var4,bl
    add var4,48
    mov cx,10
     
table: 
    mul bl
    aam  
    
    mov var2,al
    mov var5,ah 
    
    cmp cx,1
    je inst2
    
inst1:   
    char var3
    char "x" 
    char '0'
    char var4  
    char "=" 
    
    jmp cont 
    
inst2:
    char var3
    char "x"
    display ten  
    char "="    
       
cont:           
    mov dl,var5
    add dl,48
    mov ah,2
    int 21h
    
    mov dl,var2
    add dl,48
    mov ah,2
    int 21h 
    
    inc bl 
    inc var4
    newline
    
    mov al,var1
    
    loop table
    
    mov ah,4ch
    int 21h
    
    main endp
end main