        mov ax, 0
        mov bx, 8
        add ax,bx
        mov bx, 5
        add ax, bx
        mov bx, 1
        add ax, bx
        mov bx, 7
        add ax, bx
        mov bx, 5
        div bx
        
        mov cl, "M"
        mov  [200h], cl
        mov cl, "E"
        mov  [201h], cl
        mov cl, " "
        mov  [202h], cl
        mov cl, "R"
        mov  [203h], cl
        mov cl, "E"
        mov  [204h], cl
        mov cl, "C"
        mov  [205h], cl
        mov cl, "U"
        mov  [206h], cl
        mov cl, "P"
        mov  [207h], cl
        mov cl, "E"
        mov  [208h], cl
        mov cl, "R"
        mov  [209h], cl
        mov cl, "0"
        mov  [20Ah], cl
        
        int 20h
