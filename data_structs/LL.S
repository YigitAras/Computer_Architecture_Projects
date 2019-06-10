	.globl LL_INSERT
	.globl LL_DELETE

// *********************** LL_INSERT ********************************************
LL_INSERT:
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
// *********************** LL_INSERT ********************************************


// *********************** LL_DELET ********************************************
LL_DELETE:
	CBZ X1,EMPTY
	MOV X4,X1
	//LDUR X3,[X1,#0]  // get the value for comp
	//LDUR X4,[X1,#8]	 // get the addr for comp
	LDUR X7,[X1,#8]
	LDUR X8,[X1,#0]
	MOV X11,X1 // store head ffs
	// X1 is the prev addr
	// FIRST CASE ELEMENT TO BE DELETED IS FIRST ELEMENT
	CMP X8,X0
	B.NE NORMAL_DEL1
	MOV X0,X7
	BR X30
EMPTY:
	MOV X0,X1
	BR X30

NORMAL_DEL1:
	// Normal stuff
	LDUR X3,[X4,#0]
	LDUR X4,[X4,#8]
	CMP X4,#0
	B.EQ EXCEPTION
	CMP X0,X3
	B.NE NORMAL_DEL2

	// falls here means we are there boiz
	MOV X10,X4
	STUR X10,[X1,#8]
	MOV X0,X11
	BR X30

NORMAL_DEL2:
	// Normal stuff
	MOV X12,X4     //prev
	LDUR X3,[X4,#0]
	LDUR X4,[X4,#8]
	CMP X4,#0
	B.EQ EXCEPTION
	CMP X0,X3
	B.NE NORMAL_DEL3
	// falls here means we are there boiz
	MOV X10,X4
	STUR X10,[X1,#8]
	MOV X0,X11
	BR X30
NORMAL_DEL3:
	MOV X1,X12
	MOV X12,X4
	LDUR X3,[X4,#0]
	LDUR X4,[X4,#8]
	CMP X4,#0
	B.EQ EXCEPTION
	CMP X0,X3
	B.NE NORMAL_DEL3

	// falls here means we are there boiz
	MOV X10,X4
	STUR X10,[X1,#8]
	MOV X0,X11
	BR X30

EXCEPTION:
	CMP X3,X0
	B.EQ NORM1
	MOV X0,X11
	BR X30
NORM1:
	MOV X14,#0
	STUR X14,[X1,#8]
	MOV X0,X11
	BR X30

// *********************** LL_DELET ********************************************
