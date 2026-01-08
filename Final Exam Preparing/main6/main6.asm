;-----------------------------
; MULTIPLY 2 (1-DIGIT) NUMBER
; RESULT<10
;-----------------------------


data segment
    num1 db 3
    num2 db 2
    result db ?
    message1 db 10,13,"Result: $"
data ends

code segment
assume cs:code,ds:data

start:
    mov ax,data
    mov ds,ax
    
multiple:
    
    mov al,num1  ; num1 is inside al
    mul num2     ; AX =al*num2   Result is inside al
    
    add al,30h
    mov result,al  ; mov al top result
    
    
showResult:
    
    mov ah,09h
    mov dx,offset message1
    int 21h
    
    mov dl,result
    mov ah,02h
    int 21h
    
    
exitProgram:
    mov ah,4Ch
    int 21h
    
    
    
code ends
end start