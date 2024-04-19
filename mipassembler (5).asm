
addi $s0,$zero,0               # i = 0

addi $t4,$t2,0                 #copying input first address into t4 

addi $t5,$t3,0                	#copying first output address into t5

              

loop2: beq $s0,$t1,exitloop2  

             # Memory[t5] <= Memory[t4]

             lw $t7,0($t4)

             sw $t7,0($t5)

             # Increment the contents of t4 and t5 in such a way that you can access the next number from the memory.

             addi $t4,$t4,4		#since byte addressable memory

             addi $t5,$t5,4

             addi $s0,$s0,1           	# i++

             j loop2                 	# Jump back to loop2   

exitloop2:

# Copying ends





# Sorting algorithm 

addi $s0,$zero,0

addi $at,$zero,1
sub $t7,$t1,$at

addi $t5,$zero,0

addi $s5,$t3,0 				#s5 = address of i



outerloop: beq $s0,$t7,endouterloop

	addi $s1,$s0,1	#j

	addi $t6,$s5,4	#t6 = address of j

	addi $t9,$s0,0	#t9 = min_ind

	addi $t8,$s5,0	#t8 = address of min_ind

	addi $s4,$t3,0	#s4 is just a temporary register storing address of first later used to navigate to t9(updated min_ind address)

			#go to line 95 i.e cycleloop

	lw $s6,0($s5)	#value arr[i]

	lw $t4,0($s5)	#value arr[min_ind]

	innerloop: beq $s1,$t1,endinnerloop

		lw $t5,0($t6)		#value of arr[j]	

		slt $s2,$t5,$t4		#s2 is bool in t5 less t4

			beq $s2,$zero,enter1

				addi $t9,$s1,0

				addi $t4,$t5,0

		enter1:

		addi $t6,$t6,4		#iteration

		addi $s1,$s1,1

		j innerloop

	endinnerloop:

	addi $s3,$zero,0

	cycleloop: beq $s3,$t9,endcycle

		addi $s4,$s4,4

		addi $s3,$s3,1	#iteration

		j cycleloop

	endcycle:

		beq $t9,$s0,enter2

			lw $s7,0($s4)	#swapping

			sw $s6,0($s4)

			sw $s7,0($s5)

		enter2:

	addi $t8,$t8,4			#iterations	

	addi $s0,$s0,1

	addi $s5,$s5,4

	j outerloop

endouterloop:
