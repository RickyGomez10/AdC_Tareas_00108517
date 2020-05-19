
       ;ejercicio 2
        mov al, 2d
        mov bl, 2d
        mov bx, 2d
        mov cx, 11d
        mov di, 0d
        ciclo:
            mul bl
            jo foverflow
            mov [di+200h], al
            add di, 1d
            loop ciclo
            int 20h
            
        foverflow:
            mov [di+200h], al
            add di, 1
            mov [di+200h], ah
            add di, 1
            mul bx
            loop foverflow
            int 20h
