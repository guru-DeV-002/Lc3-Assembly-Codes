	.ORIG x3000
	
	AND R1,R1,x0
	AND R2,R2,x0
	AND R3,R3,x0
	AND R4,R4,x0	

	ADD R1,R1,xA
	ADD R2,R2,x1
		
LOOP	AND R3,R1,R2
	BRz SKIP	
	ADD R4,R4,x1
SKIP	AND R5,R5,x0
	ADD R5,R5,xF
	AND R5,R5,R2

	ADD R2,R2,R2
	
	NOT R5,R5
	AND R1,R1,R5
	BRp LOOP
	
	

HLT 	HALT

	.END