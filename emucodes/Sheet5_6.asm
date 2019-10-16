include emu8086.inc
org 100h  
mov si,offset prompt    ;Printing Prompt Message
call print_string 

mov dx,offset src          ;Getting Input
mov ah,0ah
int 21h
mov cx,0
mov cl,src[1]
mov bx,0     
                           ;Copying to Extra Segment
l1:     
    mov al,src[bx+2]
    mov es:[3200h+bx],al
    inc bx
    loop l1
    
mov bx,0
mov di,3200h
mov si,offset des
call strcpy
  
ret

src db 30,?,30 dup(?)
des db 30 dup(?)
prompt db 'Enter a String : ',0
proc strcpy
    mov bx,0
    lab:
        mov al,es:[di+bx]
        mov ds:[si+bx],al
        inc bx
        cmp es:[di+bx],0
        jnz lab
ret
endp strcpy
      

define_print_string
end