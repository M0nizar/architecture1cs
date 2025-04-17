.text
li $s0, 3
li $s1, 4
li $a0, 3
li $a1, 5
jal update
add $s4,$t0,$v0
add $s3,$s1,$v1
j suit
update:
add $s1,$a1,$a0
add $s0,$a1,$a0
addi $v1,$s1,0
addi $v0,$s0,0
jr $ra
suit:
syscall
