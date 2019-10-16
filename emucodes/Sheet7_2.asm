org 100h
mov ax,0003h
int 10h

mov ch,6
mov ah,1
int 10h

lab:
    mov bh,0   
    mov ah,3h
    int 10h
    mov ah,0h
    int 16h
    cmp ah,48h
    je up:
    cmp ah,50h
    je down
    cmp ah,4dh
    je right
    cmp ah,4bh
    je left
    jmp endl
    up:
        dec dh
        jmp fin
    down:
        inc dh
        jmp fin
    left:
        dec dl
        jmp fin
    right:
        inc dl
        jmp fin
    fin:
    mov ah,2h
    int 10h
    loop lab
    endl:
    
ret 

    
    