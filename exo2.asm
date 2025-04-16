.data
vars: .word 5
.text
la $t0, vars
lw $t1, 0($t0)
lw $t2, 4($t0)
saut: bge $t1, $t2, exit
move $a0, $t1
li $v0, 1
syscall
addi $t1, $t1, 1
j saut
exit: li $v0, 10
syscall
