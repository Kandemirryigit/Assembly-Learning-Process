;-------------------------------
; FILL A STRING WITH A CHARACTER
;-------------------------------

data segment
    dst db 20 dup(0)   ; 20 byte empty string
data ends


code segment
assume cs:code,ds:data

start:
    mov ax,data
    mov ds,ax
    mov es,ax
    
    mov di,offset dst  ; Pointer for destination
    mov al,'*'   ; Character to fill
    mov cx,20    ; number of bytes
    rep stosb    ; repeat storing al into [di] cx times
    
    mov byte ptr [di],'$'
    

print:
    
    ; To display the string on the screen
    mov ah,09h
    mov dx,offset dst
    int 21h
    
    
endProgram:
    mov ah,4Ch
    int 21h
    
    
code ends
end start