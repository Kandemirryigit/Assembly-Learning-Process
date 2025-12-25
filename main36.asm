;-------------------
;CONCATENATE STRINGS
;-------------------


data segment
    s1 db 'H','e','l','l','o','','$'
    s2 db 'W','o','r','l','d','$'
data ends


code segment
assume cs:code,ds:data

start:
    mov ax,data
    mov ds,ax
    
    
    mov si,offset s1  ; SI -> s1
    
find_end:
    cmp byte ptr [si],'$'
    je copy_s2
    inc si
    jmp find_end
    
copy_s2:
    mov di,offset s2
   
copy_loop:
    mov al,[di]   ; Now al has di
    mov [si],al   ; Now si has al
     
    cmp al,'$'
    je done
    
    inc si
    inc di
    jmp copy_loop
    
done:
    mov ah,09h
    mov dx,offset s1
    int 21h
    
code ends
end start
    
