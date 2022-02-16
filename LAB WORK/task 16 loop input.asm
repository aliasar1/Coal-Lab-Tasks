.model small
.stack 100h
.data

.code 
main proc
    
    mov cx,5
    
    L1:
    mov ah,1
    int 21h
    loop L1
    
    mov ah,4ch
    int 21h

    main endp
end main                 
                    