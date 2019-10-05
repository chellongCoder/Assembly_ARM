; CHUYEN DOI CO SO 10 SANG 8

; Khai bao vung du lieu
	AREA RESET, DATA, READONLY
		DCD 0x30000000
		DCD Start
; Khai bao vung ma lenh
	AREA HESO, CODE, READONLY
		ENTRY
		
Start
		MOV R12, #1010	; 1010 la so can chuyen doi
		MOV R11, #8		; co so 8
		MOV R4, #0		; R4, R3, R2 lan luot la cac thanh ghi luu lai phan nguyen
		MOV R3, #0
		MOV R2, #0
		MOV R1, #0
loop1	
		SUBS R12, R11 	;R12 = R12 - R11
		ADD R4, #1 		;R4 = R4 + 1
		CMP R12, R11	; so sanh R12 voi R11
		BLS loop2		; R12<R11 thi thuc hien loop2
		BGT loop1		; R12>R11 thi nhay lai loop1
		; So du la R12
loop2	
		SUBS R4, R11 	;R4 = R4 - R11
		ADD R3, #1 		; Tang R3 lên 1
		CMP R4, R11 	; So sánh R4 voi R11
		BLS loop3 		; Neu R4<R11 thi thuc hien loop3
		BGT loop2 		; Neu R4>R11 thi nhay lai loop2
		; So du la R4
loop3
		SUBS R3, R11	; R3 = R3 - R11
		ADD R2, #1		; tang R2 len 1
		CMP R3, R11		; So sanh R3 voi R11
		BLS loop4		; R3<R11 thi thuc hien loop4
		BGT loop3		; R3>R11 thi nhay lai loop3
		;So du la R3
loop4
		CMP R3, R11		; so sanh R3 voi R11
		BCC loop5		; R3<R11 thi thuc hien loop5
loop5
		SUBS R11, R3	
		MOV R1, R11		
		B stop
		; So du la R1
stop
	; Thuc hien tinh toan co so 8
		MOV R10, #10
		MOV R9, #100
		MOV R8, #1000
		MOV R0, R12
		MUL R4, R10
		ADD R0, R4
		MUL R3, R9
		ADD R0, R3
		MUL R1, R8
		ADD R0, R1
		; R0 chinh la ket qua
	END