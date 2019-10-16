include emu8086.inc 
org 100h

mov ah,0
mov al,3h
int 10h

a1:   
    mov dh,a
    mov dl,a
    call right
    call down
    call left
    call up
    add dh,2
    
    mov al,a
    add al,2
    mov a,al
    
    mov al,x
    sub al,2
    mov x,al
    
    mov al,y
    sub al,2
    mov y,al
    
    inc case
    mov al,case
    cmp al,4
    jne a1
     
     
ret     

x db 78
y db 23  
a db 0
case db 0 
n db 4
 
proc put_pixel
    mov al,'*' ;to delte
    mov bh,0
    mov ah,2
    int 10h  
    
    mov ah,0ah
    mov cx,1
    int 10h
ret
endp

proc right
    l1:
        call put_pixel
        mov al,x 
        inc dl
        cmp dl,al
        jne l1
dec dl
ret
endp         

proc left
    l2:
        call put_pixel
        dec dl
        mov al,a
        dec al
        cmp dl,al
        jne l2
inc dl
ret
endp       

proc down
    l3:
        call put_pixel
        mov al,y 
        inc dh
        cmp dh,al
        jne l3
dec dh
ret
endp 
  
proc up
    l4:
        call put_pixel
        dec dh
        mov al,a
        dec al
        cmp dh,al
        jne l4
inc dh
ret
endp       

end


