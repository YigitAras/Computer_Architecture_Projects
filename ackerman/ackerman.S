	.globl acker
acker:
	ADDS X9,X0,#0
	B.LT err
	ADDS X9,X1,#0
	B.LT err
	B acker1

acker1:
	SUB SP,SP,#32
	STUR X0,[SP,#16]
	STUR X1,[SP,#8]
	STUR X30,[SP,#0]
	SUBS XZR,X0,#0
	B.GT first
	ADD X0,X1,#1
	B exit

first:
	SUBS X1,X1,#1
	B.GE second
	SUB X0,X0,#1
	MOV X1,1
	BL acker1
	LDUR X30,[SP,#0]
	ADD SP,SP,#32
	BR X30

second:
	BL acker1
	ADD X1,X0,#0
	LDUR X0,[SP,#16]
	SUB X0,X0,1
	BL acker1

exit:
	LDUR X30,[SP,#0]
	ADD SP,SP,#32
	BR X30

err:
	EOR X0,X0,X0
	SUB X0,X0,#1
	BR X30
