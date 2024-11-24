.model small
.stack 100h
.data
    ; Fruit Store Title
    line        db '=-=-=-=-=-=-=-=-=-=-=-$'
    apple1      db "       ,--./,-.       $"
    apple2      db "      / #      \      $"
    apple3      db "     |          |     $"
    apple4      db "      \        /      $"
    apple5      db "       `._,._,'       $"
    appleString dw offset apple1, offset apple2, offset apple3, offset apple4, offset apple5
    storeName   db '  FRESH FRUIT STORE  $'

    ; System Shutdown
    shutdown    db 'Shutting down...$'
    
    ; Fruits (grapes 7, apple 2.2, orange 1.8, papaya 5, watermelon 18, strawberry 9, pear 4.5, guava 2.5)
    pointerGrapes     db 'Grapes      $'
    pointerApple      db 'Apple       $'
    pointerOrange     db 'Orange      $'
    pointerPapaya     db 'Papaya      $'
    pointerWatermelon db 'Watermelon  $'
    pointerStrawberry db 'Strawberry  $'
    pointerPear       db 'Pear        $'
    pointerGuava      db 'Guava       $'
    fruitsName dw offset pointerGrapes, offset pointerApple, offset pointerOrange, offset pointerPapaya, offset pointerWatermelon, offset pointerStrawberry, offset pointerPear, offset pointerGuava
    fruitsIPrice db 7, 2, 1, 5, 18, 9, 4, 2
    fruitsFprice db 0, 20, 80, 0, 0, 0, 50, 50

    ; Cart
    cart db 8 dup(0)

    ; Plastic Bag
    pFBag       db 50 ;RM0.50
    PBagString  db 'Plastic Bag $'

    ; Summary Report
    fruitsSold db 8 dup(0)
    totalProfitI dw 0
    totalProfitF dw 0

    ; Round Up Proc 
    roundUpI dw 0
    roundUpF dw 0

    ; Print Price Proc
    printPriceI dw 0
    printPriceF dw 0
    printPriceTemp db 0

;==============================================================================
.code
main proc
    ; Initialize data segment
    mov ax, @data
    mov ds, ax

    loginLoop:
        ; Print Fruit Store Title
        call newline
        mov dx, offset line
        mov ah, 09h
        int 21h
        call newline
        mov si, offset appleString
        mov cx, 5
        apple:
            mov dx, [si]
            mov ah, 09h
            int 21h
            call newline
            add si, 2
        loop apple
        mov dx, offset storeName
        mov ah, 09h
        int 21h
        call newline
        mov dx, offset line
        mov ah, 09h
        int 21h
        call newline
   
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

printPrice proc
    mov printPriceTemp, 0
    mov cx, printPriceI
    storeInteger:
        xor dx, dx
        mov ax, cx
        mov bx, 10
        div bx
        push dx
        mov cx, ax
        inc printPriceTemp
    loop storeInteger

    mov cx, printPriceTemp
    printInteger:
        pop dx
        add dl, 48
        mov ah, 02h
        int 21h
    loop printInteger

    mov printPriceTemp, 0
    mov cx, printPriceD
    storeDecimal:
        xor dx, dx
        mov ax, cx
        mov bx, 10
        div bx
        push dx
        mov cx, ax
        inc printPriceTemp
    loop storeDecimal

    mov ah, 02h
	mov dl, '.'
	int 21h

    mov cx, printPriceTemp
    printDecimal:
        pop dx
        add dl, 48
        mov ah, 02h 
        int 21h
    loop printDecimal
printPrice endp

roundUp proc
    mov ax, roundUpF
    xor dx, dx
    mov bx, 100
    div bx
    add roundUpI, ax
    mov roundUpF, dx
roundUp endp

newline proc
    mov ah, 02h
    mov dl, 0Dh
    int 21h
    mov dl, 0Ah
    int 21h
    ret
newline endp

tab proc
    mov ah, 02h
    mov dl, 09h
    int 21h
    ret
tab endp

end main
