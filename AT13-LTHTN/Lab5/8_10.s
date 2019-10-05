; CHUYEN DOI CO SO 8 SANG 10
	; Chuyen so 3715 (co so 8) sang co so 10

; Khai bao vung du lieu
	AREA RESET, DATA, READONLY
		DCD 0x20001000
		DCD Start
;Khai bao du lieu
chuoi
		DCD 5, 1, 7, 3	; chuoi duoc lay tu phan tu thu 0 den phan tu cuoi cung cua day so can chuyen doi
; Khai bao vung ma lenh
	AREA HESO, CODE, READONLY
		ENTRY
		
Start
soluongpt EQU 4
		MOV R1, #0	; R1 la ket qua
		LDR R2, =chuoi	; lay dia chi dau tien cua chuoi gan cho R2
		LDR R3, =soluongpt ; R3 = 4
		MOV R12, #1
		MOV R11, #8
for		
		LDR R4, [R2], #4	; lay gia tri cua dia chi R2 gan cho R4
							; tang dia chi cua R2 len them 4
		MUL R4, R12			; R4 = R4*R12
		ADD R1, R4			; R1 = R1 + R4
		MUL R12, R11		; R12 = R12*8
		SUBS R3, #1			; R3 = R3 - 1
		CMP R3, #0
		BGT for				; Neu R3>0 thi lap lai vong lap
		BEQ stop			; Neu R3 = 0 thi thuc hien stop
stop
		B stop
	END