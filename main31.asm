; Program: Take a string from user and copy it
;--------------------------------------------

data segment
    inputStr  db 20,0        ; max 20 chars, first byte = max size, second = actual length
    copyStr   db 20 dup('$') ; destination string, $-terminated for display
    message1 db 10,13,"Input a string: $"
    msg       db 10,13,"Copied string is: $"
data ends

code segment
assume cs:code, ds:data

start:
    mov ax, data
    mov ds, ax

    ;--------------------------------------------
    ; Read string from user
    ;--------------------------------------------
    
    mov ah,09h
    mov dx,offset message1
    int 21h
    
    
    mov dx, offset inputStr
    mov ah, 0Ah       
    int 21h
    

    ;--------------------------------------------
    ; Copy string
    ;--------------------------------------------
    mov si, offset inputStr + 2 ; skip first 2 bytes
    mov di, offset copyStr
    mov cl, [inputStr+1]        ; actual input length
    
copy_loop:
    mov al, [si]
    mov [di], al
    inc si
    inc di
    loop copy_loop

    ; Add $ at the end for display
    mov byte ptr [di], '$'

    ;--------------------------------------------
    ; Display copied string
    ;--------------------------------------------
    mov ah, 09h
    lea dx, msg
    int 21h

    mov ah, 09h
    lea dx, copyStr
    int 21h

    ;--------------------------------------------
    ; Exit
    ;--------------------------------------------
    mov ah, 4Ch
    int 21h

code ends
end start
