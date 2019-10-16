include emu8086.inc
org 100h
mov ah,0ah
mov dx,offset str1
int 21h
mov dx,offset str2
int 21h
mov si,offset p2
mov al,str1[1]
cmp al,str2[1]
jne l2
mov cl,str2[1]
mov bx,2
lab:
    mov al,str1[bx]
    cmp al,str2[bx]
    jne l2:
    inc bx
    dec cx
    jnz lab
l2:
    cmp cx,0
    je l3:
    mov si,offset p2
    jmp l4
l3:
    mov si,offset p1
l4:
    call print_string
    
ret 

str1 db 20,?,20 dup(' ')
str2 db 20,?,20 dup(' ')
p1 db 'Equal',0
p2 db 'Not Equal',0
define_print_string
end
    




