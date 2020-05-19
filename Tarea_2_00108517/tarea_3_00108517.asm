    ;Ejercicio 3
    mov ax, 0d 
    mov bx, 1d 
    mov cx, 12d 
    mov di, 0d 

    mov [di+200h], ax 
    add di,1 
    mov[di+200h],bx 
    add ax,bx 
    add di,1 
    mov[di+200h], ax 
    add ax,bx 
    add di, 1 
fibonacci:
    mov[di + 200h], ax 
    mov dx, ax
    add ax, bx
    mov bx, dx
    add di, 1d

    loop fibonacci
    int 20h