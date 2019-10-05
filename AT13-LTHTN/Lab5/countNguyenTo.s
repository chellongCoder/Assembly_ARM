;Dem cac so nguyen to <= N

; Ket Qua Luu Trên R12
		AREA reset, data, readonly
		EXPORT __Vectors
__Vectors
			DCD 0x20001000
			DCD Reset_Handler			 
			ALIGN
N EQU 20
		AREA mycode, code, readonly
		ENTRY
		EXPORT Reset_Handler
demsonguyento proc
		MOV R12, #1
		CMP R0,#2	; so sanh R0 vs 2
		BLT dem0	; neu R0 < 2 thi nhay den nhan dem0
		BEQ dem1
		B loop
dem0 	MOV R12,#0	;dem = 0
		B stop
dem1	MOV R12,#1	;dem = 1
		B stop
loop	
		UDIV R4,R1,R2
		MUL R5,R4,R2
		SUB R6,R1,R5
		CMP R6,#0
		BEQ tangd
		B tangj
tangd	ADD R3,R3,#1
		B tangj
tangj	ADD R2,R2,#1
		UDIV R7,R1,R8		; R7 = R1/R8 = i/2
		CMP R2,R7			; so sanh R2 vs R7 tuc la so sanh j vs i/2
		BGT ktbiendem		; neu j > i/2 thi nhay den nhan ktbiendem
		B loop				; con khong thi nhay den loop
ktbiendem 	
			CMP R3,#2
			BGE tangi
			BLT	ketqua	
ketqua	
		ADD R12,R12,#1
		B tangi
		
tangi	MOV R3,#0
		MOV R2,#1
		ADD R1,R1,#2
		CMP R1,R0
		BGT stop
		B loop

stop	BX LR
		ENDP
Reset_Handler
main
		LDR R0, =N	; so n = 20
		MOV R1,#3	; i =3
		MOV R2,#1	; j =1
		MOV R8,#2
		BL demsonguyento
		NOP
		ENDP
		END
	
		