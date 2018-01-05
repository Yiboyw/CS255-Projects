* ********************************************************************
* Do not touch the following 2 xdef lists:
* ********************************************************************
        xdef Start, Stop, End
        xdef A, B, GCD

* ++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
* You can add more xdef here to export labels to emacsim
* ++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++


* +++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
*      Put your assembler program here - between the start and stop label
*      DO NOT define any variables here - see the variable section below
* +++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
Start:

* int A, B, GCD;
*  if (B > A)
*  { X = A;    { Swap A and B }
*    A = B;
*    B = X;
*  }
*    X = A % B;
*    while (X != 0)
*    {  A = B;
*       B = X;
*       X = A % B;
*    }
*    GCD = B;


*makes sure that A is the max number of the two numbers A and B
 move.l A, d0
 cmp.l B, d0 
 BGE LoopBegin

*swaps B with A if B is greater than A
 move.l B, A
 move.l d0, B

 LoopBegin:
* X = A % B
 move.l A, d0
 move.l B, d1
 DIVS d1, d0 
 swap d0
 ext.l d0
 move.l d0, X

*checks to see if X != 0
 move.l X, d2
 cmp.l Z, d2 
 BLE  LoopEnd

 move.l B, A
 move.l X, B

*X = A % B
 move.l A, d0
 move.l B, d1
 DIVS d1, d0 
 swap d0
 ext.l d0
 move.l d0, X
 BRA LoopBegin

 LoopEnd:
 move.l B, d0
 move.l d0, GCD


* ********************************************************************
* Don't touch the stop label - you need it to stop the program
* ********************************************************************
Stop:   nop



* +++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
*    Variable Section -   Put your variables here IF you need more
*
*    DO NOT define A, B and GCD !!!
*    They are already defined below
*
* You can add more variables below this line if you need them
* +++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
X:  dc.l 0	
Z:  dc.l 0




* ********************************************************************
* XXXX Don't touch anything below this line !!!
* ********************************************************************
A:      dc.l  168
B:      dc.l  651
GCD:    ds.l  1

End:    nop
        end
