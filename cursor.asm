org 100h
mov ah,09h
mov cx,1000h
mov al,20h
mov bl,36
int 10h
; add your code here
mov bh,0  
mov cx,1  
mov dh,10
mov dl,12    
 
push cs
pop es
mov bp, offset h
lp:
    mov ah,00h
    int 16h
    cmp ah,72
    je up
    cmp ah,80
    je do
    cmp ah,75
    je lf
    cmp ah,77
    je rt
    jne x
    up:      
        mov al,'s'
        dec dh
       
mov ah, 13h
int 10h
        jmp lp
    do:          
         mov al,'s'
        inc dh
      ;  mov bp, offset h
mov ah, 13h
int 10h
 
        jmp lp
    lf:            
         mov al,'s'
        dec dl
     ;   mov bp, offset h
mov ah, 13h
int 10h
     
        jmp lp
    rt:            
         mov al,'s'
        inc dl
      ;  mov bp, offset h
mov ah, 13h
int 10h
        jmp lp
x:

ret
h db 'k'



