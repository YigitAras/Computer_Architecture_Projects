	.globl T_INSERT
	.globl T_FIND
	.globl T_PRINT

// ********************************** T_INSERT ************************************
 T_INSERT:
	CBZ X1,ROOT_CASE
	B NORMAL_CASE

NORMAL_CASE:
	SUB SP,SP,#48
	MOV X29,SP
	MOV X12,SP
	STUR X0,[X29,#0]
	EOR X3,X3,X3
	STUR X3,[X29,#8] 	// +8 left
	STUR X3,[X29,#16]	// +16 right
	LDUR X4,[X1,#0]
	MOV X5,X1
	B INSERTION

INSERTION:
	CMP X0,X4
	B.HS HIGHER
	B.LS LOWER

HIGHER:
	LDUR X6,[X5,#16] // LOAD THE RIGHT PTR
	CBZ X6,HIGHER2	// CHECK IF ITS NULLPTR
	MOV X5,X6		// IF NOT NULL MOVE IT AS NEW PTR
	LDUR X4,[X5,#0]	// GET NEW PTR'S VAL
	B INSERTION
HIGHER2:
	// insert it
	STUR X12,[X5,#16]
	LDUR X20,[X5,#16]
	MOV X0,X1
	BR X30

LOWER:
	LDUR X6,[X5,#8] // LOAD THE LEFT PTR
	CBZ X6,LOWER2	// CHECK IF ITS NULLPTR
	MOV X5,X6		// IF NOT NULL MOVE IT AS THE NEW PTR
	LDUR X4,[X5,#0] // GET NEW PTR'S VAL
	B INSERTION
LOWER2:
	STUR X12,[X5,#8]
	LDUR X20,[X5,#8]
	MOV X0,X1
	BR X30

ROOT_CASE:
	SUB SP,SP,#48 // save SP as well
	MOV X29,SP	// save X29 as well
	STUR X0,[X29,#0]
	EOR X3,X3,X3
	STUR X3,[X29,#8]				// +8 left
	STUR X3,[X29,#16]			// +16 right
	MOV X0,SP  // move the head of the linked list to save
	BR X30
// ********************************** T_INSERT ************************************

// ********************************** T_FIND ************************************
T_FIND:
	MOV X4,X1
T_ROUT:
	LDUR X3,[X4,#0]
	CMP X0,X3
	B.EQ FOUND
	B.HS HIGHERF
	B.LS LOWERF

HIGHERF:
	LDUR X4,[X4,#16]
	CBZ X4,NOT_FOUND
	B T_ROUT
LOWERF:
	LDUR X4,[X4,#8]
	CBZ X4,NOT_FOUND
	B T_ROUT
FOUND:
	MOV X0,#1
	BR X30
NOT_FOUND:
	MOV X0,#0
	SUB X0,X0,#1
	BR X30
// ********************************** T_FIND ************************************

// ********************************** T_PRINT ************************************
T_PRINT:
	// X0 is the root that acquired
	LDUR X2,[X0,#8] // LEFT
	CBNZ X2,HANDLE1
T_P_N:
	SUB SP,SP,#48
	STUR X0,[SP,#0]
	STUR X2,[SP,#8]
	STUR X30,[SP,#16]
	MOV X12,X0
	LDUR X11,[X12,#0]
	LDR X0, = string
	MOV X1, X11						// print the value
	BL printf
	LDUR X0,[SP,#0]
	LDUR X2,[SP,#8]
	LDUR X30,[SP,#16]
	ADD SP,SP,#48
	LDUR X2,[X0,#16] // RIGHT
	CBNZ X2,HANDLE2
T_P_NN:
	BR X30

HANDLE1:
	SUB SP,SP,#48
	STUR X0,[SP,#0]
	STUR X2,[SP,#8]
	STUR X30,[SP,#16]
	MOV X0,X2
	BL T_PRINT
	LDUR X0,[SP,#0]
	LDUR X2,[SP,#8]
	LDUR X30,[SP,#16]
	ADD SP,SP,#48
	B T_P_N
HANDLE2:
	SUB SP,SP,#48
	STUR X0,[SP,#0]
	STUR X2,[SP,#8]
	STUR X30,[SP,#16]
	MOV X0,X2
	BL T_PRINT
	LDUR X0,[SP,#0]
	LDUR X2,[SP,#8]
	LDUR X30,[SP,#16]
	ADD SP,SP,#48
	B T_P_NN


.data
string:
	.asciz "%d "
