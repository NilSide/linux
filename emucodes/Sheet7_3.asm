include emu8086.inc
org 100h
lab:
    mov ah,7
    int 21h
    printn "key "
    cmp al,13
    jne lab
ret
