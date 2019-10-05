	; AREA	RESET, DATA, READONLY
		; DCD 0x20001000
		; DCD Batdau
		
; GiaiThua DCD 1
; N	DCD	5		
		
	; AREA	HOANG, CODE, READONLY
		; ENTRY
		
; Batdau
	; LDR R1, N   ; bien N
	; MOV R2, #1 ; Giaithua 
	; MOV R3, #1 ; bien i = 1
	; BL TinhGT
	; LDR R4, GiaiThua
	; STR R2, [R4]
	; B Stop
	
; TinhGT PROC	
	; MUL R2, R3
	; ADD R3, #1
	; CMP R3, R1 ; so sanh R3 vs N
	; BLE TinhGT
	; BX LR
	; ENDP

	
; Stop B Stop	
	
	; END
