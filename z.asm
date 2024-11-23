.model small
.stack 100h
.data
    ; Fruit Store Title
    line   db '=-=-=-=-=-=-=-=-=-=-=-=-=-=-$'
    apple1 db "   ,--./,-.   $"
    apple2 db "  / #      \  $"
    apple3 db " |          | $"
    apple4 db "  \        /  $"
    apple5 db "   `._,._,'   $"
    storeName db '      ABC FRUIT STORE$      '

    ; System Shutdown
    shutdown    db 'Shutting down...$'
    
    ; Fruits Name (grapes, apple, orange, papaya, watermelon, strawberry, pear, guava)
    fGrapes     db 'Grapes$'
    fApple      db 'Apple$'
    fOrange     db 'Orange$'
    fPapaya     db 'Papaya$'
    fWatermelon db 'Watermelon$'
    fStrawberry db 'Strawberry$'
    fPear       db 'Pear$'
    fGuava      db 'Guava$'

    ; Fruits Price
    pGrapes     dw 10
    pApple      dw 2
    pOrange     dw 3
    pPapaya     dw 7
    pWatermelon dw 15
    pStrawberry dw 10
    pPear       dw 3
    pGuava      dw 5

    ; Fruits Total Sold
    tGrapes     dw 0
    tApple      dw 0
    tOrange     dw 0
    tPapaya     dw 0
    tWatermelon dw 0
    tStrawberry dw 0
    tPear       dw 0
    tGuava      dw 0

    ; Cart fruits quantity
    cGrapes     dw 0
    cApple      dw 0
    cOrange     dw 0
    cPapaya     dw 0
    cWatermelon dw 0
    cStrawberry dw 0
    cPear       dw 0
    cGuava      dw 0

    ; Plastic Bag
    pBag        dw 1
    PBagString  db 'Plastic Bag$'

    ; Summary Report
    totalProfit dw 0

    ;==============================================================================
.code
main proc
    ; Initialize data segment
    mov ax, @data
    mov ds, ax

    loginLoop:
    ; Print Apple
    call printApple
    
    mov dx, offset line
    mov ah, 09h
    int 21h
    call newline
    mov dx, offset storeName
    mov ah, 09h
    int 21h
    call newline
    mov dx, offset line
    mov ah, 09h
    int 21h

   
    ; Print Shutdown Message
    call newline
    mov dx, offset shutdown
    mov ah, 09h
    int 21h
    call newline

    ; Exit program
    mov ah, 4Ch
    int 21h
main endp

printApple proc
    mov cx, 2
    printApple1:
    mov dx, offset apple1
    mov ah, 09h
    int 21h
    loop printApple1
    call newline
    mov cx, 2
    printApple2:
    mov dx, offset apple2
    mov ah, 09h
    int 21h
    loop printApple2
    call newline
    mov cx, 2
    printApple3:
    mov dx, offset apple3
    mov ah, 09h
    int 21h
    loop printApple3
    call newline
    mov cx, 2
    printApple4:
    mov dx, offset apple4
    mov ah, 09h
    int 21h
    loop printApple4
    call newline
    mov cx, 2
    printApple5:
    mov dx, offset apple5
    mov ah, 09h
    int 21h
    loop printApple5
    call newline
    ret
printApple endp

newline proc
    mov ah, 02h
    mov dl, 0Dh
    int 21h
    mov dl, 0Ah
    int 21h
    ret
newline endp

end main
