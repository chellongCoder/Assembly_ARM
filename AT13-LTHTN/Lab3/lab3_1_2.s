	; AREA	RESET, DATA, READONLY
		; DCD 0x20001000
		; DCD Batdau
		
; SUM_EVEN DCD 0		
; SUM_ODD	DCD 0
; N	DCD	5		
		
	; AREA	HOANG, CODE, READONLY
		; ENTRY
		
; Batdau
	; LDR R0, N   ; bien N
	; MOV R1, #0  ; bien i=0
	; MOV R2, #0  ; tong chan
	; MOV R3, #1	; j=1
	; MOV R4, #0  ; tong le
	; BL TongChan
	; LDR R5, SUM_EVEN
	; STR R2, [R5]
	; BL TongLe
	; LDR R6, SUM_ODD
	; STR R4, [R6]
	; B Stop
	
; TongChan	PROC	
	; ADD R2, R1
	; ADD R1, #2
	; CMP R1, R0
	; BLE TongChan
	; BX LR
	; ENDP

; TongLe	PROC
	; ADD R4, R3
	; ADD R3, #2
	; CMP R3, R0
	; BLE TongLe
	; BX LR
	; ENDP
	
; Stop B Stop	
	
	; END
