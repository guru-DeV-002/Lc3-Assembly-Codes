	.ORIG X300

	AND R1,R1,x0
	AND R2,R2,x0
	LD R1,x30		;1ST NUM
	ADD R1,R1,x0
	BRp NEXT		; IF POSITIVE THEN JMP
	AND R3,R3,x0
	ADD R3,R1,R3
	JSR TWOSCOMP		; MAKE POSITIVE
NEXT	ST R3,x31		; STORE AT x3123
	
	LD R2,x31		;2ND NUM
	ADD R2,R2,x0
	BRp NEXT1		; IF POSITIVE THEN JMP
	AND R3,R3,x0
	ADD R3,R3,R2
	JSR TWOSCOMP		; MAKE POSITIVE
NEXT1	ST R3,x32		; STORE AT x3124
	
	AND R3,R3,x0
	ADD R3,R2,x0
	JSR TWOSCOMP
	AND R2,R2,x0
	ADD R2,R2,R3
	ADD R0,R1,R2		;X-Y
	ST R0,x33		;X-Y AT x3122
	ADD R0,R0,x0
	BRz EQUALS
	BRp GREATERX
	BRn GREATERY

EQUALS	AND R4,R4,x0	
	ST R4,x35
	JSR HLT
	
GREATERX AND R4,R4,x0
	ADD R4,R4,x1
	ST R4,x35
	JSR HLT
	
GREATERY AND R4,R4,x0
	ADD R4,R4,x2
	ST R4,x35
	JSR HLT	

HLT	HALT

TWOSCOMP NOT R3,R3
	ADD R3,R3,x1
	RET
	.END
