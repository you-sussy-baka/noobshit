.model small
.data
    s1 db 'hi$'
    s2 db 'hello$'
    s3 db 'bye$'
    arr db 2,6,7
    tmp dw 0
    arr2 dw offset s1, offset s2, offset s3
.code
main proc
    mov ax, @data
    mov ds, ax

    ; mov ah, 9
    ; mov bx, offset arr2
    ; mov dx, [bx + 2]
    ; int 21h

    mov si, offset arr
    add si, 1
    xor bx, bx
    mov bl, [si]
    mov tmp, bx

    mov ah, 4Ch
    int 21h
main endp
end main
