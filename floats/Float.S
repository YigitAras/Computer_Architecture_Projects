	.globl FLOAT_CALC
FLOAT_CALC:
	// get 1st floats fraction
	LSL X10,X0,#12
	LSR X10,X10,#12
	// get 1st floats exponent
	LSL X11,X0,#1
	LSR X11,X11,#53
	// get 1st floats sign
	LSR X12,X0,#63
	// ========================
	// get 2nd floats fraction
	LSL X13,X1,#12
	LSR X13,X13,#12
	// get 2nd floats exponent
	LSL X14,X1,#1
	LSR X14,X14,#53
	//get 2nd floats sign
	LSR X15,X1,#63
	// =======================
	SUBS X9,X2,#1
	B.EQ FACT_ADD
	B FACT_MUL

FACT_ADD:
	MOV X3,#0x0010000000000000 // set 53th bit
	ORR X13,X13,X3 // set 53th bit of 2nd frac
	ORR X10,X10,X3 // set 53th bit of 1st frac
	CMP X11,X14
	B.EQ CONT
	CMP X11,X14
	B.LO Lesser
	CMP X11,X14
	B.HI Higher
Lesser:
	SUB X3,X14,X11 // this is the shift amt needed
	LSR X10,X10,X3 // shift the smaller one
	ADD X11,X11,X3 // add the difference
	B CONT
Higher:
	SUB X3,X11,X14 // this is the shift amt needed
	LSR X13,X13,X3	// shift the smaller one
	ADD X14,X14,X3  // add the difference
	B CONT

CONT:


// CURSED MULTİPLİCATİON FFS
FACT_MUL:
	// add exponent
	ADD X16,X11,X14
	SUB X16,X16,#1023
	MOV X3,#1
	LSL X3,X3,#52
	//MOV X3,#0x0010000000000000 // set 53th bit
	ORR X13,X13,X3 // set 53th bit of 2nd frac
	ORR X10,X10,X3 // set 53th bit of 1st frac
	UMULH X4,X13,X10 // multiply and take highest 64 bit of 1st and 2nd frac
	MUL X5,X13,X10 // the lower bits

	MOV X6,#64 // shift amount
Loop:
	SUB X6,X6,#1 // decrement
	LSR X7,X4,X6 // shift the UMULH result
	AND X7,X7,#1 // check the bit
	CMP X7,#1
	B.NE Loop // keep on shifting bebi
	// Out of loop below
	MOV X7,#52 // get for 64-SHIFTAM
	SUB X7,X7,X6 // get the required shift amount
	LSL X4,X4,X7 // get the meaningful bits
	MOV X6,#64
	SUB X6,X6,X7
	LSR X5,X5,X6
	ORR X4,X4,X5
	LSL X4,X4,#12
	LSR X4,X4,#12
	MOV X6,#52
LOOP2:
	SUB X6,X6,#1 // decrement
	LSR X7,X4,X6 // shift the UMULH result
	AND X7,X7,#1 // check the bit
	CMP X7,#1
	B.NE LOOP2
	MOV X7,#52
	ADD X6,X6,#1
	SUB X7,X7,X6
	CBZ X7,SPEC
	SUB X7,X7,#1
	ADD X16,X16,X7
	EOR X12,X12,X15  // get the sign
	LSL X12,X12,#63		// get the sign in position
	LSL X16,X16,#52
	ORR X0,X12,X16
	ORR X0,X0,X4
	// FREE REGISTERS X1,X2,X3,X6,X5
	BR X30
SPEC:
	ADD X16,X16,X7
	EOR X12,X12,X15  // get the sign
	LSL X12,X12,#63		// get the sign in position
	LSL X16,X16,#52
	ORR X0,X12,X16
	ORR X0,X0,X4
	// FREE REGISTERS X1,X2,X3,X6,X5
	BR X30
