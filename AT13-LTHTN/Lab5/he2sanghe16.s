; cho vao mang, vi du: 1011001 thi nhap vao 1,0,1,1,0,0,1. Sau do lay tung so nhan len, i = n. i=0 thi dung	
	AREA reset, data, readonly
		EXPORT __Vectors
__Vectors
			DCD 0x20001000
			DCD Reset_Handler			 
			ALIGN
array	DCD 1,0,1,1,0,0,1
		AREA mycode, code, readonly
		ENTRY
		EXPORT Reset_Handler
doihe2sang16 proc
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
		MOV R0,#2	; he nao thi so day, vi du he nhi phan thi la 2, he bat phan thi la 8
		MOV R3,#1	; tich
		MOV R12,#0	; tong
		LDR R4,=array
		MOV R5,#24	; so byte trong mang
		LDR R6,[R4,R5]
		ADD R12,R12,R6
		BL doihe2sang16
		NOP
		ENDP
		END
		
		