;----------------
;STRCPY PROCEDURE
;----------------


data segment
    src db 'C','o','d','e','$'
    dst db 10 dup(?)
data ends

code segment
assume cs:code,ds:data,es:data


start:
    mov ax,data
    mov ds,ax
    mov es,ax
    
    mov si,offset src   ; SI -> src
    mov di,offset dst   ; SI -> dst
    call strcpy  ; I defined this at the bottom of the code so I can use that procedure everywhere in my code 
    
    ; To display dst on the screen
    mov ah,09h
    mov dx,offset dst
    int 21h
    
    ; Exit
    mov ah,4Ch
    int 21h
    
    
;-----------------
; STRCPY PROCEDURE
; SI -> source
; DI -> destination
;-------------------

strcpy proc
copy:
    mov al,[si]
    mov [di],al
    inc si
    inc di
    cmp al,'$'
    jne copy
    ret
    
strcpy endp

code ends
end start

    