/* main.c simple program to test assembler program */

#include <stdio.h>

extern long int fib(long long int a);

int main(void)
{

	long long int a = fib(1);
    long long int b = fib(2);
    long long int c = fib(3);
    long long int d = fib(4);
    long long int e = fib(5);
    long long int f = fib(6);
    long long int g = fib(7);
    long long int h = fib(8);


    printf("Results are as follows;\n"
    		"fib(1) = %lld\n"
    		"fib(2) = %lld\n"
    		"fib(3) = %lld\n"
    		"fib(4) = %lld\n"
    		"fib(5) = %lld\n"
    		"fib(6) = %lld\n"
    		"fib(7) = %lld\n"
    		"fib(8) = %lld\n" , a,b,c,d,e,f,g,h);
    return 0;
}
