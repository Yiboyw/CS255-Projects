*THIS CODE WAS MY OWN WORK. IT WAS WRITTEN WITHOUT CONSULTING CODE WRITTEN BY OTHER STUDENTS _Yibo_Wang_

* ********************************************************************
* Do not touch the following 2 xdef lists:
* ********************************************************************
        xdef Start, Stop, End
        xdef A, B, len_a, len_b, max, min, sum, common

* ++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
* You can add more xdef here to export labels to emacsim
* ++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
	xdef i, j, Q1, Q2, Q3, Q4, Q5, Q6, Q7

* +++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
*      Put your assembler program here - between the start and stop label
*      DO NOT define any variables here - see the variable section below
* +++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
Start:

*Find the min for array A 
	move.l A, min *min = A[0] 
	move.l #1, i *move i = 1

 WhileStart2:
	move.l i, d1 *d1 = i
	cmp.l len_a, d1 *compares i to length of A
	BGE End4 * if greater than or equal to end
	
	movea.l #A, a0
	move.l i, d1 
	muls #4, d1 *muls i by 4
	move.l 0(a0,d1), d3 *d3 = A[i]
	
	move.l min, d4 *d4 = min
	cmp.l d4, d3 *Compare A[i] to min
	bge IfEnd2 *if A[i] >= min then i++
	move.l d3, min *min = A[i] 

 IfEnd2:
	move.l i, d0
	add.l #1, d0
	move.l d0, i

	bra WhileStart2

 End4:

Q1:
*Find the min for array B
	move.l #0, i *move i = 0

 WhileStart3:
	move.l i, d1 * d1 = i
	cmp.l len_b, d1 *compares i to length of B
	BGE End3 * if greater than or equal to end
	
	movea.l #B, a0
	move.l i, d1 
	muls #4, d1 *muls i by 4
	move.l 0(a0,d1), d3 *d3 = A[i]
	
	move.l min, d4 *d1 = min
	cmp.l d4, d3 *Compare B[i] to min
	bge IfEnd3 *if B[i] <= min then go to next item
	move.l d3, min *min = B[i]

 IfEnd3:
	*i++
	move.l i, d0
	add.l #1, d0
	move.l d0, i

	bra WhileStart3

 End3:

Q2:
*Find the max for array A
	move.l A, max *max = A[0]
	move.l #1, i *move i = 0

 WhileStart5:
	move.l i, d1 * d1 = i
	cmp.l len_a, d1 *compares i to length of A
	BGE End2 * if greater than or equal to end
	
	movea.l #A, a0
	move.l i, d1 
	muls #4, d1 *muls i by 4
	move.l 0(a0,d1), d3 *d3 = A[i]
	
	move.l max, d4 *d4 = max
	cmp.l d4, d3 *Compare A[i] to max
	ble IfEnd5 *if A[i] <= max then go to next item
	move.l d3, max *max = A[i]

 IfEnd5:
	move.l i, d0
	add.l #1, d0
	move.l d0, i

	bra WhileStart5

 End2:

Q3:
*Find the max for Array A + B
	move.l #0, i *move i = 0

 WhileStart:
	move.l i, d1 * d1 = i
	cmp.l len_a, d1 *compares i to length of B
	BGE End5 * if greater than or equal to end
	
	movea.l #B, a0
	move.l i, d1 
	muls #4, d1 *muls i by 4
	move.l 0(a0,d1), d3 *d3 = A[i]
	
	move.l max, d4 *d4 = max
	cmp.l d4, d3 *Compare B[i] to max
	ble IfEnd *if B[i] <= max then go to next item
	move.l d3, max *max = B[i]

 IfEnd:
	*i++
	move.l i, d0
	add.l #1, d0
	move.l d0, i

	bra WhileStart

 End5:

Q4:
*Find the sum of array A
	move.l #0, sum
	move.l #0, i
	
 Loop:
	move.l i, d0
	cmp.l len_a, d0
	BGE LoopExit
	
	move.l sum, d0 *d0 = sum
	movea.l #A, a0 *a0 = array A
	move.l i, d1
	muls #4, d1
	move.l 0(a0, d1), d2 *d2 = A[i]
	add.l d0, d2 *adds sum + A[i] = d2
	move.l d2, sum *d2 = sum
	
	*i++
	move.l i, d0
	add.l #1, d0
	move.l d0, i
	BRA Loop
	
 LoopExit:

Q5:
*Find the sum of array A + B
	move.l #0, i
	
 Loop2:
	move.l i, d0
	cmp.l len_b, d0
	BGE LoopExit2
	
	move.l sum, d0  *d0 = sum
	movea.l #B, a0 *a0 = array B
	move.l i, d1 *d1=i
	muls #4, d1
	move.l 0(a0, d1), d2 *d2 = A[i]
	add.l d0, d2 *adds sum + A[i] = d2
	move.l d2, sum *d2 = sum
	
	*i++
	move.l i, d0
	add.l #1, d0
	move.l d0, i
	BRA Loop2
	
 LoopExit2:

Q6:
*Find the common elements in A and B
 move.l #0, i
 move.l #0, j
 move.l i, d0 
 move.l j, d1
 move.l #0, common *make common equal to zero
 movea.l #A, a0
 movea.l #B, a1
 
 Begin:
	cmp.l len_a, d0 *compare i to length of A
	BGE End10 
 Begin2:	
	cmp.l len_b, d1
	BGE End9
	muls #4, d0	
	muls #4, d1	
	move.l 0(a0, d0), d3 *d3 = A[i]
	move.l 0(a1, d1), d5 *d5 = B[j]
	cmp.l d3, d5 
	BNE JLoop
	
	*common++
	move.l common, d4
	add.l #1, d4
	move.l d4, common

 JLoop:
	*j++
	move.l j, d1
	add.l #1, d1
	move.l d1, j

	bra Begin2

 End9:
	*i++
	move.l i, d0
	add.l #1, d0
	move.l d0, i 
	*resets j to 0
	move.l #0, j 
	move.l j, d1

	bra Begin

  End10:

Q7:

	rts

* ********************************************************************
* Do not touch the stop label - you need it to stop the program
*********************************************************************
Stop:   nop



* +++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
*    Variable Section -   Put your variables here IF you need more
*
*    DO NOT define A, B, len_a, len_b, max, min, sum and common !!!
*    They are already defined below
*
*    You can add more variables below this line if you need them
* +++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
i: dc.l 0
j: dc.l 0


* ********************************************************************
* Adjust the arrays (and lengths) below to test different arrays
* ********************************************************************
A:      dc.l  13,3,21,1,8,5,4,23
B:      dc.l  4,8,15,16,23,42
len_a:  dc.l  8
len_b:  dc.l  6

* ********************************************************************
* Do not touch anything below this line !!!
* ********************************************************************
max:    ds.l  1
min:    ds.l  1
sum:    ds.l  1
common: ds.l  1

End:    nop
        end
