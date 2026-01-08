;-----------
; PALINDROME
;-----------

data segment
    message1 db 10,13,"Enter a string: $"
    message2 db 10,13,"Palindrome $"
    message3 db 10,13,"Not Palindrome $"
    
    string db 50         ; Max length
           db ?          ; Actual length
           db 50 dup(?)   ; String data       
           
data ends


code segment
assume cs:code,ds:data


start:
    mov ax,data
    mov ds,ax
    
    
takeString:
    mov ah,09h
    mov dx,offset message1
    int 21h
    
    mov si,offset string
    
readChar:
    mov ah,01h
    int 21h
    
    cmp al,13    ; Did enter pressed?
    je endRead
    
    mov [si],al    ; Store the character in the memory at si
    inc si         ; move pointer to next position in the buffer
    jmp readChar   ; read new char
    
endRead:
    dec si        ; To be able to show last character because si is enter right now
    
    ; DI -> Points to first character of the string
    ; SI -> Points to last character of the string
    mov di,offset string 
    
check:
    cmp di,si    
    jge success
    
    mov al,[di]   ; load first character of the string in al
    mov bl,[si]   ; load last character of the string in bl
    cmp al,bl     ; compare al and bl
    jne failure   ; If not equal it is not palindrome
    
    ; If equal
    inc di        ; Increase di ---->
    dec si        ; Decresea si <----
    jmp check     ; Check again
    
  
success:
    mov ah,09h
    mov dx,offset message2
    int 21h
    
    jmp endProgram
    
    
failure:
    mov ah,09h
    mov dx,offset message3
    int 21h
    
    
endProgram:
    mov ah,4Ch
    int 21h
    
    
    
code ends
end start
    
    
    
    
    
 
    

    
    
    
    
    
    
    
    
    
    
    
    
    