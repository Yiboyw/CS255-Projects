*
* Collaboration Statement here
* THIS CODE WAS MY OWN WORK. IT WAS WRITTEN WITHOUT CONSULTING CODE WRITTEN BY OTHER STUDENTS. _YIBO_WANG_
*
*
	xdef Start, Stop, End
	xdef Q1, Q2, Q3, Q4, Q5, Q6, Q7, Q8, Q9, Q10
	xdef v1, v2, v3, v4, v5, v6, v7, v8, v9, v10

Start:
        bra     Q1
        dc.b    -123
        dc.b       0
        dc.w    -314
        dc.l    -4321

*******************************************************************
* DO NOT make any changes to the line ABOVE
*
* Write the assembler instruction to each question after the
* CORRESPONDING LABEL:
*                       Q1, Q2, Q3, ..... Q10
* Define the variable (with ds or dc) for each question after the
* CORRESPONDING LABEL:
*                       v1, v2, v3, ..... v10
*
* The v1, v2,.. labels are towards the end of the file,
*
* *** Failure to do so will result in point dedections !!! ***
*******************************************************************

*******************************************************************
* Put your assembler instructions AFTER this line
*******************************************************************

**************************************************************************
* Define an uninitialized byte variable at label v1 (see the end of
* this file) and  write the assembler instruction at label Q1 to
* move the byte value 23 into this variable.
*
* Do NOT forget to SKIP some space (or use TAB) !!!
**************************************************************************
Q1:  move.b #23,v1



**************************************************************************
* Define an initialized byte variable at label v2 with initial value -14
* and write the assembler instruction at label Q2 to move the byte value
* at memory location B into this variable.
*
* Do NOT forget to SKIP some space (or use TAB) !!!
**************************************************************************
Q2:  move.b B,v2



**************************************************************************
* Define an initialized byte variable at label v3 with initial value -105
* and write the assembler instruction at label Q3 to move the byte value
* at memory location 5634 into this variable.
*
* Do NOT forget to SKIP some space (or use TAB) !!!
**************************************************************************
Q3:  move.b 5634,v3



**************************************************************************
* Define an initialized byte variable at label v4 with initial value -12
* and write the assembler instruction at label Q4 to move the byte value
* from this variable to memory location 5635.
**************************************************************************
Q4:  move.b v4,5635


**************************************************************************
* Define an uninitialized short variable at label v5 and write
* the assembler instruction at label Q5 to move the short value 5635
* into this variable.
**************************************************************************
Q5:  move.w #5635,v5


**************************************************************************
* Define an initialized short variable at label v6 with initial value -53
* and write the assembler instruction at label Q6 to move the short value
* at memory location S into this variable - you should see -4 moved
**************************************************************************
Q6:  move.w S, v6



**************************************************************************
* Define an initialized short variable at label v7 with initial value -1
* and write the assembler instruction at label Q7 to move the short value
* at memory location 5636 into this variable.
**************************************************************************
Q7:  move.w 5636,v7


**************************************************************************
* Define an uninitialized int variable at label v8 and write the assembler
* instruction at label Q8 to move the int value -200000 into this variable.
**************************************************************************
Q8:  move.l #-200000,v8


**************************************************************************
* Define an initialized int variable at label v9 with initial value 255
* and write the assembler instruction at label Q9 to move the int value
* at memory location L into this variable.
**************************************************************************
Q9:  move.l L,v9


**************************************************************************
* Define an initialized int variable at label v10 with initial value -224
* and write the assembler instruction at label Q10 to move the int value
* at memory location 5638 into this variable.
**************************************************************************
Q10:  move.l 5638,v10



Stop:	nop
	nop

*************************************************
* Write your variable definitions here...
*
* Do NOT forget to SKIP some space (or use TAB) !!!
*************************************************

v1: ds.b 1


v2: dc.b -14


v3: dc.b -105


v4: dc.b -12


v5: ds.w 1


v6: dc.w -53


v7: dc.w -1


v8: ds.l 1


v9: dc.l 225


v10: dc.l -224


*************************************************
* Don't touch the variables below this line
*************************************************

End:
	ds.b    20

B:      dc.b    24
        dc.b     0
S:      dc.w    -8
L:      dc.l    -8

	end
