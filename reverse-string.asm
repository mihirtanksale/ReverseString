.model SMALL
.data
        msg1 db 10,13,"Enter the string$"
        msg2 db 0AH,0DH,"Your String is accepted$"
        msg3 db 10 dup()
        abc db ('$')
        len db 0
        var db 0
        buff db 81
             db 0
             db 81 dup("$")

.code
START:
      mov AX,@DATA
      mov DS,AX
      mov CX,0

      LEA DX,msg1
      mov AH,09H
      INT 21H
     
     LEA DX,buff
     mov ah,0ah
     INT 21h

     LEA DX,msg2
     MOV AH,09H
     INT 21H

     LEA DX,buff+2
     MOV AH,09H
     INT 21H

     LEA SI,buff+2
     MOV BL,abc

     next:
     CMP [SI],BL
     JE done
     inc cx 
     inc SI
     JMP next

     done:
    ; sub cx,1

     lea si,buff+2
     lea di,msg3
     add si,cx

     here:
     mov al,[SI]
     mov [DI],al
     DEC SI
     INC DI
     DEC CX
     JNZ here
    ; mov al,[SI]
    ; mov [DI],al

     lea DX,msg3
     mov ah,09h
     int 21h

MOV AH,4CH
INT 21H
END START


