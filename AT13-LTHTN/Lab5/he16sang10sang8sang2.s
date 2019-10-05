; cho vao mang, vi du: AB thi nhap vao 0xA,0xB. Sau do lay tung so nhan len, i = n. i=0 thi dung	
; bai nay la bai chuyen tu he 16 -> 10, he 16->8, he 16 ->2 .
; tu he 16, t se chuyen ve he 10, tu he 10 chia 2 lay du roi gan vao mang nhiphan co dia chi o nho dau tien la 0x20000004 
;de dc he 2
; tu he 16, t se chuyen ve he 10, tu he 10 chia 8 lay du roi gan vao mang batphan co dia chi o nho dau tien la 0x20000000 
;de dc he 8
	AREA reset, data, readonly
		EXPORT __Vectors
__Vectors
			DCD 0x20001000
			DCD Reset_Handler			 
			ALIGN
array	DCD 0xA,0xB
		AREA data,DATA,readwrite
batphan DCD 0
nhiphan DCD 0
		AREA mycode, code, readonly
		ENTRY
		EXPORT Reset_Handler
doihe16sang10 proc
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
	
doihe10sang8 proc
		MOV R1,#8
		MOV R8,R12
		LDR R6,=batphan
l8		MOV R7,R8
		UDIV R8,R8,R1
		MUL R4,R8,R1
		SUB R11,R7,R4
		STR R11,[R6],#4
		CMP R7,R1
		BLT stop8
		B l8
stop8	BX LR
		ENDP

doihe10sang2	proc
		MOV R2,#2
		LDR R4,=nhiphan
		MOV R5,R12
l2		MOV R9,R5
		UDIV R5,R5,R2
		MUL R10,R5,R2
		SUB R11,R9,R10
		STR R11,[R4],#4
		CMP R9,R2
		BLT stop2
		B l2
stop2	BX LR
		ENDP

Reset_Handler
main proc
		MOV R1,#2	; i=n
		MOV R0,#16	; he nao thi so day, vi du he nhi phan thi la 2, he bat phan thi la 8
		MOV R3,#1	; tich
		MOV R12,#0	; tong
		LDR R4,=array
		MOV R5,#4	; so byte trong mang
		LDR R6,[R4,R5]
		ADD R12,R12,R6
		BL doihe16sang10
		NOP
		BL doihe10sang8
		NOP
		BL doihe10sang2
		NOP
		ENDP
		END
		
		