;--------------------
; UPPERCASE CONVERSION
;---------------------


data segment
    src db "Hello World$"
    dst db 20 dup(0)
data ends


code segment
assume cs:code,ds:data

start:
    mov ax,data
    mov ds,ax
    mov es,ax
    
    mov si,offset src   ; Pointer to the source
    mov di,offset dst   ; Pointer to the destination
  
    
convert_loop:
    lodsb   ; Load byte from [si] into al
    cmp al,'a'  ; Check if lowercase
    jb skip_uppercase  ; If below 'a',skip
    cmp al,'z'
    ja skip_uppercase   ; If above 'z', skip
    sub al,20h   ; Convert to uppercase
    
  
skip_uppercase:
    stosb   ; store al into [di]
    cmp byte ptr [si],'$'  ; end if '$' reached
    jne convert_loop
    
print:
    
    ; Display the source
    mov ah,09h
    mov dx,offset src
    int 21h
    
    ; Display the destination
    mov ah,09h
    mov dx,offset dst
    int 21h
    
    
    
endPorgram:
    
    mov ah,4Ch
    int 21h
    
    
    
    
code ends
end start
    
    
    
    
    
    
    
    
    
    
      