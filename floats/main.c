/* main.c simple program to test assembler program */

#include <stdio.h>


extern long long acker(long long n,long long m);
extern long long FLOAT_CALC(long long a,long long b,long long opt);
int main(void)
{
	/*
	int check = acker(-1,0); // -1
	int check2 = acker(0,-1); // -1
	int res1 = acker(0,0); // 1
	int res2 = acker(1,0); // 2
	int res3 = acker(2,0); // 3
	int res4 = acker(3,0); // 5
	int res5 = acker(4,0); // 13
	int res6 = acker(0,1); // 2
	int res7 = acker(1,1); // 3
	int res8 = acker(2,1); // 5
	int res9 = acker(3,1); // 13
	int res10 = acker(0,2); // 3
	int res11 = acker(1,2); // 4
	int res12 = acker(2,2); // 7
	int res13 = acker(3,2); // 29
	printf("Results are as follows:\n"
			"res1: %d\nres2: %d\nres3: %d\nres4: %d\n"
			"res5: %d\nres6: %d\nres7: %d\nres8: %d\n"
			"res9: %d\nres10: %d\nres11: %d\n"
			"res12: %d\nres13: %d\n",
			res1,res2,res3,res4,res5,res6,res7,
			res8,res9,res10,res11,res12,res13);
	int res_1 = acker(3,4); // 125
	int res_2 = acker(3,5); // 253
	printf("Big results:\nres1: %d\nres2: %d\n",
			res_1,res_2);
	printf("Error input check=%d check=%d\n",check,check2);
	printf("Trials are over...\n");
	*/
	/******************/
	// -4605943928902490522 => -5.1
	//  4623001312491156275 => 12.1
	// 	4614162998222441677 => 3.1
	//  4617428107952285286 ==> 5.1
	// 	4620749512677471027 ==> 8.1
	//  4631010682953457992 ==> 41.31   (5.1 * 8.1)
	//  4630475880497707745 ==> 37.51   (12.2 * 3.1)
	//  4621599567107137208 ==> 9.61
	long long ot = 4630475880497707745; // 37.51
	long long x = 4631010682953457992;  // 41.31
	long long y = 4617428107952285286;  // 5.1
	long long z = 4614162998222441677;  // 3.1
	long long c = 4623001312491156275;  // 12.1
	long long a = 4620749512677471027;  // 8.1

	   //FLOAT_CALC(x,y,1); //add
	  long long res =  FLOAT_CALC(a,z,2); //mul



    return 0;
}
