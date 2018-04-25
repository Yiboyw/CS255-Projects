#define EXTERN
#include <stdio.h>
#include "header.h"
#define SetBit(A,k)     ( A[(k/32)] |= (1 << (k%32)) )
#define ClearBit(A,k)   ( A[(k/32)] &= ~(1 << (k%32)) )
#define TestBit(A,k)    ( A[(k/32)] & (1 << (k%32)) )
//testBit returns an int 


//The clearAll() function will make all elements in the prime[] array equal to 0
void clearAll(){
	 
	int N = sizeof(prime) / sizeof(prime[0]);; //int N equals the prime array size

	for(int i=0; i < N; i++) {
	prime[i] = 0;
	}
}
//The setBit(A, n) function will set (only) the bit in the A[ ] array that corresponds to the number n
void setBit(int A[], int n){
	//setBit sets the nth bit in the array prime 
	int i = n/32;  //i = array index A[i]
	int pos = n%32; //pos = bit position in a[i]
	unsigned int flag = 1; //flag = 0000...00001
	flag = flag << pos; // flag = 0000... 010..000 shifed k positions 

	prime[i] = A[i] | flag; //set the bit at the k-th position in A[i]
}

//The call isPrime(A, n) will return true (≠ 0) if the bit in the A[ ] array that corresponds to the number n is equal to 0 
//(i.e., the number n is prime) will return 0 otherwise.
int isPrime(int A[], int n) {
//n is the nth bit-> 33-> A[1]

	if(TestBit(A, n)) {//if the nth bit at the A[n] is 1, it's not prime so return false
		//printf("This bit was 0. Not Prime: %d\n", n);
		return 0;
	}
	else{
		//printf("This bit is 1. Prime!: %d\n", n);
		return 1;
	}
}
//A function void sieveOfE( int N ) that find all prime numbers that are less than or equal to N using the Sieve of Erathothenes algorithm.
void sieveOfE(int N) { //let N =10
	 clearAll(); //run clearAll to clear bits in prime array
	 setBit(prime, 0); // 0 is not prime so its bit position 0 will be set to 1
	 setBit(prime, 1); // 1 is not prime so its bit position 1 will be set to 1
	
	 int i,j,k;	

 	 k=2;
 
	 while( k < N) {
	   for ( i = k; i <= N; i++ ){//for loop needs to go through bit positions in the array
		if (isPrime(prime,i) == 1){ //if the index at prime is 0, return true
			break; 	
		}
		}
		 for (j = 2*i; j <= N; j = j + i){
			setBit(prime, j);
		}
	  k++;
	}
}


int countPrimes(int N){ 

	sieveOfE(N); //run the Sieve of E algorithm
	int count = 0;
	//go through the prime array and if the array index is 0, add one to count
	for(int i =0; i< N; i++){
		if(isPrime(prime,i) == 1) {
		count++;		
		}	
	}
	return count;
}


void printPrimes(int k1, int k2, int N) {//2,3,5,7 || k1 =1 , k2 = 3 || 2, 3, 5

	sieveOfE(N); //run the Sieve of E algorithm
	int count =0; //count the prime number

	for(int i =0; i< N; i++){
		if(isPrime(prime, i) == 1) {
		count++;
			if(count >=k1 && count <= k2) {
			printf(" %d\n", i);		
			} 
		}
		
	}
}
