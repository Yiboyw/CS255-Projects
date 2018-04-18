* Name: Yibo Wang
* Emory email: yibo.wang@emory.edu
* userID: ywan738
* THIS CODE WAS MY OWN WORK, IT WAS WRITTEN WITHOUT CONSULTING CODE WRITTEN BY OTHER STUDENTS. _YIBO_WANG_

        xdef BinarySearch, Part1, Part2, Part3


BinarySearch:
******************************************************
* Write your recursive binary search assembler subroutine here
*
*    BinarySearch: input stack frame (see pdf for details)
*                    
******************************************************

 move.l a6, -(a7)          *save caller's frame pointer
 move.l a7, a6             *setup my own frame pointer
 suba.l #4, a7             *creates a local variable mid
 move.l -4(a6), d0         *d0 = mid
 
 *mid = (low + high)/2
 move.l 8(a6), d6         *d6 = high
 move.l 8(a6), d1         *d1 = high
 add.l 12(a6), d1         *d1 = low + high
 divs #2, d1              *d1 = (low + high)/2
 ext.l d1
 
 move.l d1, -4(a6)        *mid = (low + high)/2
 move.l -4(a6), d2        *d2 = mid
 move.l d2, d5            *d5 = mid
 muls #4, d5              *get offset 

 movea.l 20(a6), a0       *put base address of array in A0
 move.l 0(a0, d5), d3     *d3 = A[mid]
 move.l 16(a6), d4        *d4 = key
 cmp.l d2, d6             *compares mid to high
 BEQ Equal
 cmp.l d4, d3             *compares A[mid] to key
 BNE IfPart 
 

 Equal:
 cmp.l d4, d3             *compares A[mid] to key
 BEQ  L1
 move.l #-1, d0           *return -1
 bra End
 
 L1:
 move.l d2, d0            *if A[mid] == key, return mid
 bra End

 IfPart:

Part1:

 cmp.l d4, d3             *compares A[mid] to key
 BGT GreatPart	          *if A[mid] > key go to GreatPart

 *return binarySearch(int[] A, int key, int mid+1, int high)
 *adda.l #20, a7          *clean up the stack
 move.l 20(a6), -(a7)     *moves the array to the stack
 move.l 16(a6), -(a7)     *moves key to the stack
 add.l #1, d2             *add 1 to mid
 move.l d2, -(a7)         *moves mid+1 onto stack
 move.l d2, -4(a6)        *sets mid+1 to stack
 move.l 8(a6), -(a7)      *moves high onto stack
 bsr BinarySearch         *calls the BinarySearch recursively
 
 adda.l #28, a7            *clean up the stack
 move.l a6, a7             *Deallocate local variables
 move.l (a7)+, a6          *Restore caller's frame pointer
 rts
 
 GreatPart:

Part2:

 *return binarySearch(int[] A, int key, int low, int mid-1)
 *adda.l #20, a7          *clean up the stack
 
 move.l 20(a6), -(a7)     *moves the array to the stack
 move.l 16(a6), -(a7)     *moves key to the stack
 move.l 12(a6), -(a7)     *moves low onto the stack
 sub.l #1, d2
 move.l d2, -(a7)         *moves mid-1 to stack
 move.l d2, -4(a6)        *sets updated value of mid to stack
 bsr BinarySearch         *calls the BinarySearch recursively
 
 adda.l #28, a7            *clean up the stack
 move.l a6, a7             *Deallocate local variables
 move.l (a7)+, a6          *Restore caller's frame pointer
 rts
 

 End: 
 move.l a6, a7             *Deallocate local variables
 move.l (a7)+, a6          *Restore caller's frame pointer
 rts


* *****************************************************************************
* If you need local variables, you can add variable definitions below this line
* *****************************************************************************


        end