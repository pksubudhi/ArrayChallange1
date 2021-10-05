
#Let there be two arrays of integers of equal size and initialized. Display content of both the arrays in main. Then do the following operations through a separate function.

#A. Add corresponding elements in the arrays and store sum at the corresponding position in the first array, if the position index is even.
#B. Multiply corresponding elements in the two arrays and store production at the  corresponding position in the second array, if the position index is odd.

#NOTE: Array index starts from 0 to n-1 if n is the number of elements.

#Hint: You can take global constand for aray-size and need not to pass it as an argument. The function takes only the reference of two source arrays and it returns nothing.

#Example:
#If the arrays are: 
#Arr1:-6, 3, 8, 5, 2, 9, 7, 7, 3, 4
#Arr2:-4, 1, 6, 3, 8, 3, 5, 2, 4, 6

#Then after processing the araays should be:
#Arr1:-10, 3, 14, 5, 10, 9, 12, 7, 7, 4
#Arr2:-4, 3, 6, 15, 8, 27, 5, 14, 4, 24 
#############################################

# GLOBAL CONSTANTS #
####################

ARR_SIZE = 10

# main() function #
###################

	.text
main:
	addiu $sp, $sp, -4
	sw   $ra, ($sp)

	la	 $a0, prompt1
	li	 $v0, 4
	syscall
	
	la	 $t0, arr1
	li   $t1, 1
first_loop:
	lw   $a0, ($t0)
	li   $v0, 1
	syscall
	
	li   $a0, ' '
	li   $v0, 11
	syscall
	
	addi $t0, $t0, 4
	addi $t1, $t1, 1
	ble  $t1, ARR_SIZE, first_loop
	
	la	 $a0, prompt2
	li	 $v0, 4
	syscall
	
	la	 $t0, arr2
	li   $t1, 1
second_loop:
	lw   $a0, ($t0)
	li   $v0, 1
	syscall
	
	li   $a0, ' '
	li   $v0, 11
	syscall
	
	addi $t0, $t0, 4
	addi $t1, $t1, 1
	ble  $t1, ARR_SIZE, second_loop
	
	# Calling function fun()
	la   $a0, arr1
	la   $a1, arr2
	
	jal fun
	
	la	 $a0, result1
	li	 $v0, 4
	syscall
	
	la	 $t0, arr1
	li   $t1, 1
first_result_loop:
	lw   $a0, ($t0)
	li   $v0, 1
	syscall
	
	li   $a0, ' '
	li   $v0, 11
	syscall
	
	addi $t0, $t0, 4
	addi $t1, $t1, 1
	ble  $t1, ARR_SIZE, first_result_loop
	
	la	 $a0, result2
	li	 $v0, 4
	syscall
	
	la	 $t0, arr2
	li   $t1, 1
second_result_loop:
	lw   $a0, ($t0)
	li   $v0, 1
	syscall
	
	li   $a0, ' '
	li   $v0, 11
	syscall
	
	addi $t0, $t0, 4
	addi $t1, $t1, 1
	ble  $t1, ARR_SIZE, second_result_loop
	
	lw   $ra, ($sp)
	addiu $sp, $sp, 4
	jr	 $ra
	
# fun() function #
##################

	.text
fun:
	addiu $sp, $sp, -4
	sw   $ra, ($sp)
	
	move $t0, $a0
	move $t1, $a1
	
	li   $t2, 0
fun_loop:
	lw   $t3, ($t0)
	lw   $t4, ($t1)
	rem  $t5, $t2, 2
	beq  $t5, 0, add_pair
	mul  $t3, $t3, $t4
	sw   $t3, ($t1)
	b move_ahead
add_pair:
	add  $t3, $t3, $t4
	sw   $t3, ($t0)
move_ahead:
	addi $t0, $t0, 4
	addi $t1, $t1, 4
	addi $t2, $t2, 1
	blt  $t2, ARR_SIZE, fun_loop
	
	lw   $ra, ($sp)
	addiu $sp, $sp, 4
	jr   $ra
	
# DATA section #
################

	.data
prompt1:
	.asciiz "First array is: "
prompt2:
	.asciiz "\nSecond array is: "
	
result1:
	.asciiz "\nFirst result array is: "
result2:
	.asciiz "\nSecond result array is: "
	
arr1:
	.word 6, 3, 8, 5, 2, 9, 7, 7, 3, 4
arr2:
	.word 4, 1, 6, 3, 8, 3, 5, 2, 4, 6
