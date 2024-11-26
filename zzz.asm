.model small
.data

.code
    main proc

        mov cx, 5
        testing:
        mov ah, 2
        mov dl, 'a'
        int 21h

        call abc


        mov ah, 4Ch
        int 21h
    main endp

    abc proc

    ret
    abc endp

end main