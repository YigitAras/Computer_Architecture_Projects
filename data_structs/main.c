/* main.c simple program to test assembler program */

#include <stdio.h>

extern unsigned long long int *LL_INSERT(unsigned long long int val,unsigned long long int *head); //give head address and the val head 0 if new insertion
extern long long int *LL_DELETE(long long int val,long long int *head); // give head address and the val

extern unsigned long long int *_QUEUE(unsigned long long int val,unsigned long long int *head);
extern unsigned long long int *_DEQ(unsigned long long int *head);

extern unsigned long long int *T_INSERT(unsigned long long int val,unsigned long long int *root);
extern int T_FIND(unsigned long long int val,unsigned long long int *root);
extern void T_PRINT(unsigned long long *root);

int main(void)
{
	/*
	unsigned long long int *HEAD = 0;
	unsigned long long int VAL = 5;
	HEAD = LL_INSERT(5,0);
	HEAD = LL_INSERT(15,HEAD);
	HEAD = LL_INSERT(25,HEAD);
	HEAD = LL_INSERT(35,HEAD);
	HEAD = LL_INSERT(31,HEAD);
	HEAD = LL_DELETE(32,HEAD);

	if(HEAD == 0) {
		printf("List empty\n");
		return 0;
	}
	printf("|| ");
	while(*(HEAD+1) != 0){
	printf("%d --> ",*(HEAD));
	HEAD = *(HEAD+1);
	}
	printf("%d ||\n",*(HEAD));
*/
// =======================================================================
/*
	unsigned long long int *HEAD = 0;
	HEAD = _QUEUE(5,0);
	HEAD = _QUEUE(15,HEAD);
	HEAD = _QUEUE(25,HEAD);
	HEAD = _QUEUE(35,HEAD);
	HEAD = _QUEUE(45,HEAD);
	HEAD = _DEQ(HEAD);
	HEAD = _DEQ(HEAD);
	HEAD = _DEQ(HEAD);
	HEAD = _DEQ(HEAD);

	if(HEAD == 0) {
		printf("QUEUE empty\n");
		return 0;
	}
	printf("|| ");
	while(*(HEAD+1) != 0){
	printf("%d --> ",*(HEAD));
	HEAD = *(HEAD+1);
	}
	printf("%d ||\n",*(HEAD));
*/

	unsigned long long int *ROOT = 0;
	ROOT = T_INSERT(5,0);
	ROOT =  T_INSERT(6,ROOT);
	ROOT = T_INSERT(4,ROOT);
	ROOT = T_INSERT(7,ROOT);
	ROOT = T_INSERT(3,ROOT);
	int look1 = T_FIND(6,ROOT);
	int look2 = T_FIND(3,ROOT);
	int look3 = T_FIND(11,ROOT);
	int look4 = T_FIND(1,ROOT);
	printf("%d %d %d %d\n",look1,look2,look3,look4);
	T_PRINT(ROOT);
	printf("\n");



    return 0;
}
