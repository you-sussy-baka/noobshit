.model small
.stack 100h
.data
    ; New Line
    newline db 0Dh, 0Ah, '$'
    
    ; Fruits Name (grapes, apple, orange, papaya, watermelon, strawberry, pear, guava)
    fGrapes db 'Grapes$'
    fApple db 'Apple$'
    fOrange db 'Orange$'
    fPapaya db 'Papaya$'
    fWatermelon db 'Watermelon$'
    fStrawberry db 'Strawberry$'
    fPear db 'Pear$'
    fGuava db 'Guava$'

    ; Fruits Price
    pGrapes dw 10.00
    pApple dw 1.50
    pOrange dw 2.00
    pPapaya dw 7.00
    pWatermelon dw 15.00
    pStrawberry dw 10.50
    pPear dw 2.50
    pGuava dw 3.00

    ; Fruits Total Sold
    tGrapes dw 0
    tApple dw 0
    tOrange dw 0
    tPapaya dw 0
    tWatermelon dw 0
    tStrawberry dw 0
    tPear dw 0
    tGuava dw 0

    ; Cart fruits quantity
    cGrapes dw 0
    cApple dw 0
    cOrange dw 0
    cPapaya dw 0
    cWatermelon dw 0
    cStrawberry dw 0
    cPear dw 0
    cGuava dw 0

    ; Plastic Bag
    pBag dw 0.50
    PBagString db 'Plastic Bag$'

    ; Summary Report
    totalProfit dw 0
    
    ; Define strings with '$' terminators
    string1 db 'String abc$'
    string2 db 'String def$'
    string3 db 'String ghi$'
    string4 db 'String afew$'
    string5 db 'String afew$'

    ; Define an array of pointers to the strings
    stringPtrs dw offset string1
               dw offset string2
               dw offset string3
               dw offset string4
               dw offset string5

;==============================================================================
.code
main proc
    ; Initialize the data segment
    mov ax, @data
    mov ds, ax

    ; Access index 2 (third string) from the pointer array
;    lea si, stringPtrs        ; Load address of the pointer array
    mov bx, [stringPtrs + 4]          ; Get the pointer for index 2 (2 bytes per entry)

    ; Print the string at index 2
    mov dx, bx                ; Move the pointer into DX
    mov ah, 09h               ; DOS interrupt to print a string
    int 21h
    
    
     
     ; Print the string at index 3
    mov dx, offset string1               ; Move the pointer into DX
    mov ah, 09h               ; DOS interrupt to print a string
    int 21h

    ; Exit program
    mov ah, 4Ch
    int 21h
main endp
end main
