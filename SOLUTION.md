# TP1 HOMEWORK
## Exercise 01 :
```asm
.data
vars:   .word 5
     .text
li $t0, 10
li $t1, 15
la $t2, vars
sw $t1, 0($t0)
lw $t2, 4($t0)
addi $t2, $t0,4
subi $t2, $t0,4
syscall
```
### question 1 :
the binary code of each instruction and its format group.
#### instruction li $t0, 10
1. type is : immediate format.

   
![first](images/exo1_quest1/firstinst.png)  

#### instruction li $t1, 15
2. type is : immediate format.

   
![second](images/exo1_quest1/secondinstru.png)

#### instruction la $t2, vars  
3. type is : immediate format.

   
![thirdd](images/exo1_quest1/thirdinst.png)  

4. type is : immediate format.
  
![fourth](images/exo1_quest1/fourthinst.png)  

#### instruction sw $t1, 0($t0)
5. type is : immediate format.


![fifth](images/exo1_quest1/fifthinst.png)  

#### instruction lw $t2, 4($t0)
6. type is : immediate format.


![sixth](images/exo1_quest1/sixthinst.png)  

#### instruction addi $t2, $t0,4
7. type is : immediate format.

![eightth](images/exo1_quest1/seventhinst.png)  

#### instruction subi $t2, $t0,4
8. type is :  immediate format.


![nineth](images/exo1_quest1/eightthinst.png)  

9. type is : register format.

![tenth](images/exo1_quest1/ninethisnt.png)  

#### instruction syscall
10. type is : register format.

![tenth](images/exo1_quest1/tenthisnt.png)  

### question 2:
the state of the control unit signals and the ALU control.
#### instruction sw $t1, 0($t0)
1. control unit signals :
   
   ![eightth](images/exo1_quest2/swcommand.png)
   
3. ALU control signals :

   ![eightth](images/exo1_quest2/sw.png)
   
#### instruction lw $t2, 4($t0)
1. control unit signals :
   
   ![eightth](images/exo1_quest2/lwcommand.png)
   
3. ALU control signals :
   
   ![eightth](images/exo1_quest2/lw.png)
   
#### instruction addi $t2, $t0,4
1. control unit signals :
   
   ![eightth](images/exo1_quest2/addcommand.png)
   
3. ALU control signals :
   
   ![eightth](images/exo1_quest2/add.png)
   

## Exercise 02 :
```asm
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

```
### question 1 :
the value of the PC register for each instruction.
1. first : 

![first](images/exo2_quest1/1_.png)  
![first](images/exo2_quest1/1_one.png)  

2.second :

![first](images/exo2_quest1/2_.png)  
![first](images/exo2_quest1/2_two.png)  

3.third :  

![first](images/exo2_quest1/3_.png)  
![first](images/exo2_quest1/3_three.png) 

4. fourth :

![first](images/exo2_quest1/4_.png)  
![first](images/exo2_quest1/4_four.png) 

5. fifth :

![first](images/exo2_quest1/5_.png)  
![first](images/exo2_quest1/5_five.png) 

6. sixth :

![first](images/exo2_quest1/6_.png)  
![first](images/exo2_quest1/6_six.png) 

7. seventh :


![first](images/exo2_quest1/7_.png)  
![first](images/exo2_quest1/7_seven.png) 

8. eighth :


![first](images/exo2_quest1/8_.png)  
![first](images/exo2_quest1/8_eight.png)  

## Exercise 03 :
```asm
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

```
### question 1 :
the value of the PC register for the branch instructions.  
 
 1.first :  
 
 ![first](images/exo3_quest1/1_.png)  
 ![first](images/exo3_quest1/11_.png)  
 
 2.second :  
 
 ![first](images/exo3_quest1/2_.png)  
 ![first](images/exo3_quest1/22_.png)   
 
 3.third :  
 
 ![first](images/exo3_quest1/3_.png)  
 ![first](images/exo3_quest1/33_.png) 
 
 4.fourth :  
 
 ![first](images/exo3_quest1/4_.png)  
 ![first](images/exo3_quest1/44_.png) 
 
 5.fifth :  before jumping .
 
 ![first](images/exo3_quest1/5_.png)  
 ![first](images/exo3_quest1/55_.png) 
 
 6.sixth:  after jumping.
 
 ![first](images/exo3_quest1/6_.png)  
 ![first](images/exo3_quest1/66_.png) 
 
 7.seventh :  
 
 ![first](images/exo3_quest1/7_.png)  
 ![first](images/exo3_quest1/77_.png) 
 
 8.eighth :  
 
 ![first](images/exo3_quest1/8_.png)  
 ![first](images/exo3_quest1/88_.png) 
 
 9.nineth :  
 
 ![first](images/exo3_quest1/9_.png)  
 ![first](images/exo3_quest1/99_.png) 
 
 10.tenth :  before jumping.
 
 ![first](images/exo3_quest1/10_.png)  
 ![first](images/exo3_quest1/1010_.png) 
 
 11.eleventh :  after jumping.
 
 ![first](images/exo3_quest1/111_.png)  
 ![first](images/exo3_quest1/1111_.png) 
 
 12.twelfth :  
 
 ![first](images/exo3_quest1/12_.png)  
 ![first](images/exo3_quest1/1212_.png) 
 
 13.thirteenth :  before jumping.
 
 ![first](images/exo3_quest1/13_.png)  
 ![first](images/exo3_quest1/1313_.png) 
 
 14.fourteenth :  after jumping.
 
 ![first](images/exo3_quest1/14_.png)  
 ![first](images/exo3_quest1/1414_.png)  
 
 ### question 2 :
 the problem in the given code is :
 > Overwriting $s1 and $s0 inside update function .
 
 ### question 3 :  
 two solutions for this problem :  
 > the use of temperory registers inside the update function instead of s0 and s1.

 ```asm
 update:
     add $t0, $a1, $a0    # $t0 = a1 + a0
     add $t1, $a1, $a0    # $t1 = a1 + a0 (if you need it again)
     addi $v1, $t0, 0     # move to $v1
     addi $v0, $t1, 0     # move to $v0
     jr $ra
 ```
 
 > save the value of s0 and s1 registers in a stack.

 ```asm
    update:
     addi $sp, $sp, -8      # Make space on stack
     sw $s0, 0($sp)         # Save $s0
     sw $s1, 4($sp)         # Save $s1
 
     add $s1, $a1, $a0      # Modify $s1
     add $s0, $a1, $a0      # Modify $s0
     addi $v1, $s1, 0
     addi $v0, $s0, 0
 
     lw $s0, 0($sp)         # Restore $s0
     lw $s1, 4($sp)         # Restore $s1
     addi $sp, $sp, 8       # Reclaim stack space
     jr $ra
 ``` 
