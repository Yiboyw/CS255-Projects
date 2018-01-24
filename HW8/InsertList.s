	xdef InsertList

InsertList:

* ********************************************************************
* Put your InsertList function here 
* ********************************************************************
*save caller's frame pointer
 move.l a6, -(a7) 
*setup my own frame pointer
 move.l a7, a6   
*creates local variable 
 suba.l #4, a7

*d0 = head
 move.l 12(a6), d0 
 cmp.l #0, d0
 bne IfPart

*if(h == null){
*      newelem.next = null;
*      return newelem;
* }

 move.l 8(a6), a0
*new.next = null
 move.l #0, 4(a0)
*return new in D0
 move.l 8(a6), d0

 move.l a6,a7
 move.l (a7)+, a6
 rts

IfPart:

* if(h.value > newelem.value){
*      newelem.next = h;
*     return newelem;
* }

 movea.l 12(a6), a0
 movea.l 8(a6), a1
 move.l 0(a0), d1
 move.l 0(a1),d2
 cmp.l d2, d1
 BLE ElsePart
 move.l 8(a6), a2
 move.l 12(a6),d0
*newelem.next = head
 move.l d0, 4(a2)
 move.l 8(a6), d0
 
 move.l a6,a7
 move.l (a7)+, a6
 rts


* else {
*      help = InsertList(h.next, newelem);
*      h.next = help;
*      return h; 	
* }	

 ElsePart:
*a0 = head
 move.l 12(a6), a0
*pass head.next
 move.l 4(a0), -(a7)
*pass newelement
 move.l 8(a6), -(a7)
*recursion: InsertList(head.next, newelem)
 bsr InsertList
 adda.l #8, a7

*help = InsertList(head.next, newelem)
 move.l d0, -4(a6)
*a0 = head
 move.l 12(a6), a0
*head.next = help
 move.l -4(a6), 4(a0)
*return head
 move.l 12(a6), d0

 move.l a6, a7
 move.l (a7)+, a6
 rts
        end
