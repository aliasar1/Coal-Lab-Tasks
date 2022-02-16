.model small
.stack 100h
.data
name1 db "Name: Ali Asar Khowaja$"
reg1 db "Reg ID: 2012285$" 
email1 db "Email: bscs2012285@szabist.pk$"
uni1 db "Institution name: SZABIST$"

.code 
main proc
    
    mov ax,@data
    mov ds,ax
    
    mov dx,offset name1          
    mov ah,9
    int 21h
    
    mov dl, 10
    mov ah, 02h
    int 21h
    mov dl, 13
    mov ah, 02h
    int 21h   
    
    mov dx,offset reg1          
    mov ah,9
    int 21h
    
    mov dl, 10
    mov ah, 02h
    int 21h
    mov dl, 13
    mov ah, 02h
    int 21h
    
    mov dx,offset email1          
    mov ah,9
    int 21h
    
    mov dl, 10
    mov ah, 02h
    int 21h
    mov dl, 13
    mov ah, 02h
    int 21h
    
    mov dx,offset uni1          
    mov ah,9
    int 21h
    
    mov ah,4ch
    int 21h

    main endp
end main
                    
                    
                    
                    
                    