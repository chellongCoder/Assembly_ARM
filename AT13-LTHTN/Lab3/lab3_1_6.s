; ; Viet chuong trinh tinh tong? 1 + x^2 + x^3 + ..... + x^N 
; ;	Y tuong?: 	Khoi tao sum = 1 
; ;				x va` N tu khoi? tao
; ;		tao bien i=2 neu i > N thi` dung` nguoc lai thi` tinh x^i roi` tang i len
; ;	Ket qua Sum duoc luu o? R2

	; AREA	RESET, DATA, READONLY
		; DCD 0x20001000
		; DCD Start
	
; x	DCD	2	
; N	DCD	3
; Sum DCD 0


	; AREA	HOANG, CODE, READONLY
		; ENTRY
		
; Start

	; LDR R1, x ; x = 2
	; MOV R2, #1  ; Sum = 1
	; MOV R3, #2  ; i = 2
	; MOV R4, #1 ; tichphu=1
	; LDR R6, N
	; BL 	tinhTong
	; LDR R7, Sum
	; STR R2, [R7]
	
	
	
; tinhTong  PROC
	; CMP R3, R6  ;  so sanh i vs N
	; BGT STOP
	; MOV R5, R3   ; j = i
; LOOP2	
	; CMP R5, #0
	; BEQ NEXT
	; MUL R4, R1
	; SUB R5, #1
	; B 	LOOP2
; NEXT		
	; ADD R2, R4
	; MOV R4, #1
	; ADD R3, #1
	; B 	tinhTong
	; BX 	LR
	; ENDP
	
; STOP	
	; B	STOP
	
	; END
