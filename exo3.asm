main:
    bne R20, R0, DoElse
    add R4, R16, R0     ; move g → R4
    add R5, R17, R0     ; move h → R5
    jal update
    addi R21, R2    ; move result → b
    j SkipElse

DoElse:
    add R4, R18, R0     ; move k → R4
    add R5, R19, R0     ; move m → R5
    jal update
    addi R22, R2    ; move result → c

SkipElse:

update:
    add R20, R4, R5
    sll R21, R5, 4
    sub R2, R20, R21
    jr $ra
