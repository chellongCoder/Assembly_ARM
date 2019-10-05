;doi he 8 sang 10
	AREA reset, data, readonly
		EXPORT __Vectors
__Vectors
			DCD 0x20001000
			DCD Reset_Handler			 
			ALIGN
array	DCD 1,2,9,1,0,0,6
		AREA mycode, code, readonly
		ENTRY
		EXPORT Reset_Handler
doihe8sang10 proc
loop	SUB R1,R1,#1
		CMP R1,#0
		BGT	tong
		B stop
tong	SUB R5,R5,#4
		LDR R6,[R4,R5]
		MUL	R3,R3,R0
		MUL R7,R6,R3
		ADD R12,R12,R7
		B loop
stop	BX LR
		ENDP
Reset_Handler
main proc
		MOV R1,#7	; i=n
		MOV R0,#8	
		MOV R3,#1	; tich
		MOV R12,#0	; tong
		LDR R4,=array
		MOV R5,#24	; so byte trong mang
		LDR R6,[R4,R5]
		ADD R12,R12,R6
		BL doihe8sang10
		NOP
		ENDP
		END
		
		