include emu8086.inc
org 100h  
mov si,offset prompt        ;Printing Prompt Message
call print_string 

mov dx,offset src           ;Getting Input
mov ah,0ah
int 21h
mov cx,0
mov cl,src[1]
mov bx,0     
                           
l1:     
    mov al,src[bx+2]
    mov es:[3200h+bx],al
    inc bx
    loop l1
mov es:[3200+bx],0

mov si,offset prompt        ;Printing Prompt Message
call print_string
    
mov dx,offset src1           ;Getting Input
mov ah,0ah
int 21h
mov cx,0
mov cl,src1[1]
mov bx,0
    
l2:  
    mov al,src1[bx+2]
    mov [3400h+bx],al
    inc bx
    loop l2
mov [3400+bx],0
    
    
mov bx,0
mov di,3200h
mov si,3400h
call strcmp
  
ret

src db 30,?,30 dup(?)
src1 db 30,?,30 dup(?)
prompt db 'Enter a String : ',



proc strcmp
    mov bx,0
    mov al,'Y'
    mov ds:[5200h],al
    
    lab:
        mov al,es:[di+bx]
        cmp ds:[si+bx],al
        jne l4
        jmp l5
        l4:
            mov al,'N'
            mov ds:[5200h],al
            jmp l6 
        l5:
        inc bx
        cmp es:[di+bx],0
        jnz lab
l6:
ret
endp strcmp
      

define_print_string
end