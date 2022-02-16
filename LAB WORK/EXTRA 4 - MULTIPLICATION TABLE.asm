takeInput MACRO destination
    MOV AH,1
    INT 21h
    MOV destination,AL
ENDM

sysout MACRO var
    LEA DX, var
    MOV AH,9
    INT 21h
ENDM

doAMMVar MACRO dest
    AAM
    XCHG AH,AL
    MOV dest, AX
    ADD dest,30h
    ADD [dest+1],30h
ENDM

.model small
.stack 100h
.data
prompt DB "Enter Table: $"
tOut DB 10,13
table DB ?, 'x'
times DW ?,?, '='
answer DW ?,?, '$'

tableN DB ?

.code
main PROC
    MOV AX,@data
    MOV DS,AX
    
    sysout prompt
    
    takeInput table
    MOV AL, table
    MOV tableN, AL
    SUB tableN,30h
    
    MOV CX,1

loopdeLoop:
    ;Set Times
    MOV times, CX
    MOV AL, CL
    doAMMVar times
    
    ;Set Answer
    MOV AL,tableN
    MUL CL
    doAMMVar answer

    ;Print the Line
    sysout tOut
    
    INC CX
    CMP CX, 10
    JNG loopdeLoop
    
terminate:
    MOV AH,4ch
    INT 21h
    
    main ENDP
END main