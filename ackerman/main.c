/* main.c simple program to test assembler program */

#include <stdio.h>


extern long long acker(long long n,long long m);

int main(void)
{
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
    return 0;
}
