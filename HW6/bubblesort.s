        xdef BubbleSort


BubbleSort:
******************************************************
* Write your bubble sort assembler subroutine here
*
*    BubbleSort: input  D0 = address of int array
*                       D1 = N size of int array
******************************************************
 
 *move.l #A,D0			* Pass address of the array in D0
 *move.l #5,D1			* Pass size of the array in D1
 *jsr    BubbleSort		* Sort array A 
 
 move.l #0, Done
 move.l #0, Help
 move.l #0, i
 move.l #0, k 
 
 move.l D0, A0
 move.l Done, D2
 move.l Help, D3
 move.l k, D4
 move.l i, D5

*while (Done == 0)
 
 WhileStart: 
 *compares Done with zero
 cmp.l #0, D2 
 BNE WhileEnd 

*Done == 0
 move.l #1, D2 *Done ==0
 
*sets i to zero 
 move.l #0, i

 ForLoop:

*D6 = N-K
 move.l D1, D6
 sub.l k, D6 
 cmp.l D6, D5 *compares i to N-6
 BGE ForLoopEnd

*if (A[i] > A[i+1])
 muls #4, D5
 move.l 0(D0, D5), D7
 cmp.l  4(D0, D5), D7  
 BLE IfEnd:
  
* Help = A[i];
 move.l 0(D0, D5), D3

* A[i] = A[i+1];
 move.l  4(D0, D5), 0(D0, D5)

* A[i+1] = Help;
 move.l D3, 4(A0,D5)
 move.l D3, Help

* Done = 0;  
 move.l 0, D2
 move.l D2, Done

 IfEnd:

 *i++	
 move.l i, D5
 add.l #1, D5
 move.l D5, i
 bra ForLoop
 
 ForLoopEnd:
  
*k = k+1
 add.l #1, D4 
 move.l D4, k
 bra WhileStart

 WhileEnd: 

	rts

* *****************************************************************************
* If you need local variables, you can add variable definitions below this line
* *****************************************************************************
 Done: dc.l 0
 Help: dc.l 0
 k: dc.l 1
 i: dc.l 0
        end
