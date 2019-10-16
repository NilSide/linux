include emu8086.inc
org 100h 
ip1:
    printn "Enter a single digit integer "
    mov ah,1
    int 21h
    call clear_screen    
    cmp al,48h
    jl error
    cmp al,57
    jg error
    jmp ip2 
    error:
    printn "Input Error "
    call clear_screen
    jmp ip1
ip2:
    printn "Enter a single digit integer "
    mov ah,1
    int 21