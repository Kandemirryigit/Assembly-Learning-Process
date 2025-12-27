;----------------
;STRCMP PROCEDURE
;----------------

data segment
    s1 db 'T','e','s','t','$'
    s2 db 'T','e','s','t','$'
    message1 db 10,13,"EQUAL$"
    message2 db 10,13,"NOT EQUAL$"
data ends

code segment
assume cs:code,ds:data

start:
    mov ax,data
    mov ds,ax
    
    mov si,offset s1   ; SI -> string 1
    mov di,offset s2   ; DI -> string 2
    call strcmp
    
    cmp al,0   ; If al equals 0 it means s1 and s2 are equal
    je equal1
    jne not_equal1 
    
    
equal1:
    
    ; To display message1 on the screen
    mov ah,09h
    mov dx,offset message1
    int 21h
    
    jmp exit
    
    
not_equal1:
    
    ; To display message2 on the screen
    mov ah,09h
    mov dx,offset message2
    int 21h
    
    jmp exit
    
    
exit:
    
    ; To exit the program
    mov ah,4Ch
    int 21h
    
    

    
;------------------------
;STRCMP PROCEDURE
; return al=0 if equal
;------------------------

strcmp proc

cmp_loop:
    mov al,[si]
    mov bl,[di]
    cmp al,bl
    jne not_equal
    
    cmp al,'$'
    je equal
    
    inc si
    inc di
    jmp cmp_loop
    
not_equal:
    mov al,1
    ret
    
equal:
    mov al,0
    ret

strcmp endp


code ends
end start

    
    