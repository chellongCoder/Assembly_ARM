
; AREA	RESET, DATA, READONLY
		; DCD 0x20001000
		; DCD Batdau
		
; XmuN DCD 0
; N	DCD	5		
		
	; AREA	HOANG, CODE, READONLY
		; ENTRY
		
; Batdau
	; LDR R1, N   ; bien N
	; MOV R2, #1 ; tich = 1
	; MOV R3, #1 ; i = 1
	; BL	TinhXmuN
	; LDR R4, XmuN
	; STR R2, [R4]
	; B Stop
	
; TinhXmuN PROC	
	; MUL R2, R3
	; ADD R3, #1
	; CMP R3, R1
	; BLE TinhXmuN
	; BX LR
	; ENDP

	
; Stop B Stop	
	
	; END
