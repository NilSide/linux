org 100
mov ax,1234h
mov cx,16
lab:
    or ax,0
    jns lab1
    inc no 
    jmp lab2
    lab1:
        cmp no,0
        jz lab2
        inc nz
    lab2:
    shl ax,1   
    loop lab
    
ret 

nz db 0
no db 0    
end