	.globl _QUEUE
	.globl _DEQ

//********************************** QUEUE ****************************************************
_QUEUE:
	CBZ X1,HEAD_CASE
	B NORMAL_CASE

NORMAL_CASE:
	SUB SP,SP,#32
	MOV X29,SP
	MOV X2,SP // save the current location, X1 is the head location
	STUR X0,[X29,#0]
	EOR X5,X5,X5
	STUR X5,[X29,#8] // new nullptr , end of the linked list
	LDUR X8,[X29,#8]
	LDUR X10,[X29,#0]
	MOV X5,X1 // set head to X5
LOOP:
	MOV SP,X5 // new stackpointer
	MOV X29,SP
	LDUR X5,[X29,#8]
	LDUR X9,[X29,#0]
	CBNZ X5,LOOP // means couldnt find

	STUR X2,[X29,#8] // write the new locations addres to the pointer of the tail
	LDUR X8,[X29,#8]
	MOV SP,X2  // old STACK location to return to
	MOV X29,X2
	MOV X0,X1 // should return the address of the HEAD
	BR X30



HEAD_CASE:
	SUB SP,SP,#32
	MOV X29,SP
	STUR X0,[SP,#0]
	MOV X2,#0  // move 0 as the nullptr
	STUR X2,[SP,#8]
	MOV X0,SP  // move the head of the linked list to save
	BR X30
//********************************** QUEUE ****************************************************


//********************************** DEQUEUE **************************************************
_DEQ:
	LDUR X7,[X0,#8]
	LDUR X8,[X0,#0]
	MOV X0,X7
	BR X30
