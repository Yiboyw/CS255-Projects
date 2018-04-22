/*
Name: Yibo Wang
Email: yibo.wang@emory.edu
UserID: ywan738
THIS  CODE  WAS MY OWN WORK , IT WAS  WRITTEN  WITHOUT  CONSULTING
CODE  WRITTEN  BY  OTHER  STUDENTS. _Yibo_Wang_
*/

#define EXTERN
#include <stdio.h>
#include <stdlib.h>
#include "header.h"

//The setAll function will make all bits in the prime[] array equal to 1.
void setAll(){
	
	//divide the total bytes in prime by size in one index to get the size of its index
	int N = sizeof(prime)/sizeof(prime[0]); 
	
	for(int i=0; i < N; i++){
		prime[i] = -1;
	}
}


//The clearBit(n) function will set the bit in the prime[] array to 0 that corresponds to the number n.
void clearBit(int n) { 

 int i = n/32; // i = array index A[i]
 int pos = n%32; // pos = bit position in A[i]
 
 unsigned int flag = 1;  // flag = 0000.....0001

 flag = flag << pos;     // flag = 0000...010...000   (shifted k positions)
 flag = ~flag;           // flag = 1111...101..111

 prime[i] = prime[i] & flag;     // Clear the bit at the k-th position in A[i]

}

/*
The testBitIs1(n) function will return 1 if the bit in the prime[] array that corresponds to the number n is equal to 1. 
Otherwise, it will return 0. In other words, testBitIs1(n) will return 1 when the integer n is prime.
*/

int testBitIs1(int n){ 
  int i = n/32;
  int pos = n%32;

  unsigned int flag = 1;  // flag = 0000.....00001

  flag = flag << pos;     // flag = 0000...010...000   (shifted k positions)

  if ( prime[i] & flag )      // If the nth bit is 1, it is prime so return 1
	return 1;
  else
         //n-th bit is 0, it is not prime
	return 0;
}

//A function void sieveOfE( int N ) that find all prime numbers that are less than or equal to N using the Sieve of Erathothenes algorithm.
void sieveOfE (int N) { //let N =10
	setAll(); //run clearAll to make all bits in prime array equal to 1
	clearBit(0); //0 is not prime so its bit position is 0
	clearBit(1); //1 is not prime so its bit position is 0
	
	 int i,j,k;	

 	 k=2;
 
	 while( k < N) {
	   for ( i = k; i <= N; i++ ){//for loop needs to go through bit positions in the array
		if(testBitIs1(i) == 1){ //if the index at prime is 0, return true
			break; 	
		}
	   }
	   for (j = 2*i; j <= N; j = j + i){
			clearBit(j);
	   }
	  k++;
	}
}


//countPrimes counts the number of primes numbers from 0 to the given N parameter
int countPrimes(int N) {
	sieveOfE(N); //run the Sieve of E algorithm
	int count = 0;
  	//go through prime array and if the array index is 1, add one to count
	for (int i =0; i < N; i++){
		if(testBitIs1(i) == 1){
			count++;
		}
	
	}
	return count;
}

//printPrimes prints the number of primes from 0 to the given N parameter
void printPrimes(int N){
	sieveOfE(N); //run the Sieve of E algorithm
	for (int i = 0; i < N; i++){
		//go through prime array and if the array index is 1, print that index
		if(testBitIs1(i) == 1){
			printf("%d\n", i);
		} 
	}
}

