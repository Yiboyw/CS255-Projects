* ====================================================================
* Do not touch the following xdef:
* ====================================================================
        xdef F
	*xdef D1
       
* **************************************************************************
* You can add more xdef directives above if you need more external labels
*
* - Remember that you can only add a label as a break point (stop location) 
*   in EGTAPI if the label has been xdef'ed !!!
*
* - And I am pretty sure you will need to use break point for debugging 
* - in this project... So add more xdef above to export your breakpoints
* **************************************************************************

F:

* ********************************************************************
* Put your (recursive) function F here 
*
* F receives the parameters i, j, k on the stack
* F returns the function value in register d0
*
* Make sure you use the "rts" instruction to return to the caller
* Also: Make sure you DE-ALLOCATE the local variables and restore a6
*       BEFORE you return to the caller !!!
* ********************************************************************

*int F(int i, int j, int k)
* {
*     int s, t;
*
*     if ( i <= 0 || j <= 0 )
*        return(-1);
*     else if ( i + j < k )
*        return (i+j);
*     else
*     {
*        s = 0;
*        for (t = 1; t < k; t++)
*        {
*           s = s + F(i-t, j-t, k-1) + 1;               
*        }
*        return(s);
*     }
*  }


*save caller's frame pointer
 move.l a6, -(a7) 
*setup my own frame pointer
 move.l a7, a6    
 
*creates 2 local variables for s and t
 suba.l #8, a7  
 
*moves i to D1
 move.l 16(a6), D1
*compares i <= 0
 cmp.l #0, D1   
 BLE L1  
 
 move.l 12(a6), D2
*compares j <= 0
 cmp.l #0, D2 
 BGT ElseIf
 
 L1:
*return -1
 move.l #-1, D0
*Deallocate local variables
 move.l a6, a7
*restore caller's frame pointer    
 move.l (a7)+, a6 
 rts
 
 ElseIf:

*moves i to D5
 move.l 16(a6), D5
*adds j to D5 
 add.l 12(a6), D5 
*compares k to i+j
 cmp.l 8(a6), D5  
 BGE Else
 
* return i+j in D0  
 move.l D5, D0

* Deallocate local variables       
 move.l a6, a7
*restore caller's frame pointer      
 move.l (a7)+, a6   
 rts

 Else:

*S=0
 move.l -4(a6), D3
 move.l #0, D3
 move.l D3, -4(a6)
 
*t=1
*moves t to D4
 move.l #1, D4
 move.l D4, -8(a6)
 
 ForLoop:
*compares t to k
 cmp.l 8(a6), D4 
 BGE ForLoopEnd

*s = s + F(i-t, j-t, k-1) + 1; 
  
*moves i to D4  
 move.l 16(a6), D4 
 *D4 = i-t   
 sub.l -8(a6), D4   
 move.l D4, -(A7)
*moves j to D4 
 move.l 12(a6), D4 
*D4 = j-t   
 sub.l -8(a6), D4    
 move.l D4, -(A7)
*D4 = k 
 move.l 8(a6), D4
 *D4 = k-1     
 sub.l #1, D4       
 move.l D4, -(A7)

 bsr F
*clears the stack
 adda.l #12, a7      

*D3 = s 
 move.l -4(a6), D3
*D3 = s + 1  
 add.l #1, D3
*adds F(i-t, j-t, k-1) to s  
 add.l D0, D3
 move.l D3, -4(a6)    

*moves t to D4  
 move.l -8(a6), D4
*add 1 to t  
 add.l #1, D4 
 move.l D4, -8(a6) 
 
 bra ForLoop
 
 ForLoopEnd:

*return s
 move.l -4(a6), D0

*Deallocate local variables  
 move.l a6, a7 
*Restore caller's frame pointer     
 move.l (a7)+, a6 
 rts
*====================================================================
* Don't add anything below this line...
* ====================================================================
        end
