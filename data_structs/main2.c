#include <stdio.h>

extern unsigned long long int *HASH_INSERT(unsigned long long int val,unsigned long long int *head); //give head address and the val head 0 if new insertion
extern unsigned long long int *HASH_DELETE(unsigned long long int val,unsigned long long int *head); //give head address and the val head 0 if new insertion
extern unsigned long long int *HASH_FIND(unsigned long long int val,unsigned long long int *head); //give head address and the val head 0 if new insertion


int main(void)
{
	unsigned long long int *HEAD = 0;
	unsigned long long int VAL = 5;
	//int elem_ctr = 0;
	HEAD = HASH_INSERT(125,0)+6 ;
	HEAD = HASH_INSERT(81,HEAD)+6;
	//HEAD = HASH_DELETE(10,HEAD);
	for(int i = 0;i<50;i++)
		{
			//if(*(HEAD + i) != -1)
			printf("%d at sdsd index  %d \n",*(HEAD + i),i);

		}
	HEAD = HASH_DELETE(10,HEAD) + 6;
	printf("*******************************************************************\n");
	for(int i = 0;i<50;i++)
			{
			//if(*(HEAD + i) != -1)
				printf("%d at index %d \n",*(HEAD + i),i);

			}
	printf("*******************************************************************\n");

	long long int *res = HASH_FIND(81,HEAD);
	printf("FIND 81 : %d \n", res);
	res = HASH_FIND(125,HEAD);
	printf("FIND 125 : %d \n", res);

	res = HASH_FIND(10,HEAD);
	printf("FIND 10 : %d \n", res);
	HEAD = HASH_INSERT(10,HEAD)+6;
	res = HASH_FIND(10,HEAD);

	printf("FIND after insert 10 : %d \n", res);
	for(int i = 0;i<50;i++)
			{
			//if(*(HEAD + i) != -1)
				printf("%d at index %d \n",*(HEAD + i),i);

			}
    return 0;
}
