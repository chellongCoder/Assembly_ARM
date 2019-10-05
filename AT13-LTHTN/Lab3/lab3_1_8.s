; ; ; Viet chuong trinh tim BCNN cua 2 so
; ; ; Y tuong tim UCLN 2 so trc' luu o R1
; ; ; Roi` tinh BCNN = (A x B) chia UCLN
; ; ; Ket qua BCNN luu o R7

	; AREA	RESET, DATA, READONLY
		; DCD 0x20001000
		; DCD Start
	
; bienA	DCD	12	
; bienB	DCD	8
; UCLN DCD 0
; BCNN DCD 0

	; AREA	HOANG, CODE, READONLY
		; ENTRY
		
; Start
	; LDR R1, bienA  ; bien A
	; LDR R2, bienB
	; MOV R3, #0 ; bien temp
	; BL	TimUCLN
	; LDR R4, UCLN
	; STR	R1, [R4]
	; BL TinhBCNN
	; LDR R8, BCNN
	; STR R7, [R8]
; Stop B Stop		
	
; TimUCLN PROC	
	; B	phanDu
; tiep	
	; MOV R3, R1   ; gan temp = phan du
	; MOV R1, R2
	; MOV R2, R3
	; CMP R2, #0
	; BNE TimUCLN	
	; BX 	LR
	; ENDP

; phanDu
	; SUB R1, R2
	; CMP R1, R2
	; BHS phanDu
	; B	tiep

; TinhBCNN PROC
	; LDR R4, bienA   ; lay lai gia tri bien A
	; LDR R5, bienB	; lay lai gia tri bien B
	; MUL R6, R4, R5	; R6 = R4 x R5
	; SDIV R7, R6, R1	; R7 = R6/R1
	; BX LR
	; ENDP
	
	; END
