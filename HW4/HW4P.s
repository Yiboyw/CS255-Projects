* Collaboration Statement:
* THIS CODE WAS MY OWN WORK, IT WAS WRITTEN WITHOUT CONSULTING CODE WRITTEN BY OTHER STUDENTS. _YIBO_WANG_
* 
*
	xdef Start, Stop, End
	xdef Q1, Q2, Q3, Q4, Q5, Q6, Q7, Q8, Q9, Q10
	xdef A, B, C
	xdef i, j, k
	xdef head
	xdef ans_b, ans_w, ans_l

Start:
*******************************************************************
* Put your assembler instructions here
* Write the answer to each question after the corresponding label.
* DO NOT REMOVE ANY LABEL IN THIS ASSIGNMENT
* *** Failure to do so will result in point dedections !!! ***
*******************************************************************


*         ans_b = A[4];
Q1:
	movea.l #A, a0
	move.b 4(a0), d0
	move.b d0, ans_b
		



*         ans_l = B[6];
Q2:
	movea.l #B, a0
	move.w 12(a0),d0
	ext.l d0
	move.l d0, ans_l






*         ans_l = C[k];
Q3:
	movea.l #C, a0
	move.l k, d0
	muls #4, d0
	move.l 0(a0,d0), d0
	move.l d0, ans_l




*         ans_w = A[i + k];
Q4:
	movea.l #A, a0
	move.b i, d0
	ext.w d0
	ext.l d0
	add.l k, d0
	
	move.b 0(a0, d0), d0
	ext.w d0
	move.w d0, ans_w



*         ans_w = C[i + j];
Q5:
	movea.l #C, a0
	move.w j, d1
	move.b i, d2
	ext.w d2
	add.w d2, d1
	muls #4, d1
	move.l 0(a0, d1), d1
	move.w d1, d1
	move.w d1, ans_w





*         ans_l = A[k] + B[i];
Q6:
	movea.l #A, a0
	move.l k, d0
	move.b 0(a0, d0), d0
	
	movea.l #B, a1	
	move.b i, d1
	ext.w d1
	muls #2, d1
	move.w 0(a1, d1), d1

	ext.w d0
	ext.l d0
	ext.l d1
	add.l d0, d1
	move.l d1, ans_l
	
		



*         ans_l = A[A[j] + 64];
Q7:
	move.w j, d2
	move.b d2, d2
	
	movea.l #A, a0
	move.b 0(a0, d2), d2
	add.b #64, d2
	move.b 0(a0, d2), d2
	
	ext.w d2
	ext.l d2
	move.l d2, ans_l




*         ans_w = B[13]
Q8:
	movea.l #B, a0
	move.w #13, d0
	muls #2, d0
	move.w 0(a0, d0), d0
	move.w d0, ans_w



*	  ans_l = head.value2;
Q9:
	movea.l head, a0
	move.w 4(a0), d0
	ext.l d0
	move.l d0, ans_l
		


*	  ans_w = head.next.value1;
Q10:
	movea.l head, a0
	movea.l 6(a0), a0
	move.l 0(a0), d0
	move.w d0, ans_w




*************************************************
* Don't write any code below this line
*************************************************

Stop:	nop
	    nop

*************************************************
* Don't touch these variables
* You do NOT need to define more variables !!!
*************************************************

************************************************************************
* Note the use of the even directive to locate the variables ans_w and j
* at an EVEN address due to the variables ans_b and i being bytes
* Short and int variables MUST start on an even address (or you 
* will get an "odd address" error)
************************************************************************

ans_b: ds.b 1
	   even
ans_w: ds.w 1
ans_l: ds.l 1

i:     dc.b  3
	   even
j:     dc.w  4
k:     dc.l  5

A:     dc.b   -11, 22, -33, 44, -55, 66, -77, 88, -99, 109

B:     dc.w   111, -222, 333, -444, 555, -666, 777, -888, 999, -5181

C:     dc.l   1111, -2222, 3333, -4444, 5555, -6666, 7777, -8888, 9999, -9983


head:   dc.l  list1

list3:  dc.l 2468
        dc.w 88
	dc.l list4
list2:  dc.l 1470
        dc.w 78
	dc.l list3
list4:  dc.l 4567
        dc.w 65
	dc.l list5
list1:  dc.l 1357
        dc.w 98
	dc.l list2
list5:  dc.l 9876
        dc.w 54
	dc.l 0


End:
	end
