;-------------------------------------------------------------------------------
; TAKE A STRING FROM USER 
; TAKE A CHARACTER FROM USER
; LOOK AT THE STRING HOW MUCH CHARACTER(USER TYPED) INSIDE THE STRING (USER TYPED) 
; RESULT SHOULD BE LOWER THAN 10
;-------------------------------------------------------------------------------


data segment
    message1 db 10,13,"Enter a string: $"
    message2 db 10,13,"Enter a character: $"
    message3 db 10,13,"Result: $"
    
    string db 20
           db ?
           db 20 dup(?)
data ends


code segment
assume cs:code,ds:data


start:
    
    mov ax,data
    mov ds,ax
        
    
    mov bl,0   ; I defined bl=0 to count the character 
       

takeString: 
   
    mov ah,09h
    mov dx,offset message1
    int 21h
       
    ; To take string from user
    mov ah,0Ah
    mov dx,offset string
    int 21h
    
    
takeCharacter:
    
    mov ah,09h
    mov dx,offset message2
    int 21h
    
    mov ah,01h
    int 21h
    
    
    mov cl,string+1  ; The length of the string
    mov si,offset string+2  ; si has first character of the string
    
    
   
findCharacter:
    
    cmp cl,0
    je showResult
    
    cmp [si],al
    jne notEqual
    
    inc bl  ; Character found
    
    
notEqual:
    
    inc si
    dec cl
    jmp findCharacter
    
   
    
    
showResult:
    
    mov ah,09h
    mov dx,offset message3
    int 21h
    
    add bl,30h
    mov dl,bl
    
    mov ah,02h
    int 21h
    
    
exitProgram:
    mov ah,4Ch
    int 21h
    
    
code ends
end start
    
    

    
    
    
    
    