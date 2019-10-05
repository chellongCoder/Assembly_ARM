; ;	Lab2_1: Viet chuong trinh tinh tong cac phan tu trong 1 chuoi so


; ;Khai bao doan du lieu
	; AREA    RESET, DATA, READONLY
		; DCD  0x20001000     
		; DCD  Start  

; chuoi
	; DCD 1,2,2,1,0
	
; ;Khai bao doan ma lenh
	; AREA    HOANG, CODE, READONLY
   	  ; ENTRY
   	  ; EXPORT Start
	  
; Start
; ;----------------------------------
; soluongPT EQU 5

	; MOV R1, #0	;sum = R1 =0
	; LDR R2, =chuoi
	; MOV R3, #0 ;; offset = 0
	; LDR R4, =soluongPT ; R4 = 5    
	; ; for (int i=5; i>0; i--)
	; ; R1 = R1 + gtri hien tai
	; ; R2 +4
; for
	; LDR R5, [R2, R3]  ; R5 = R2+R3
	; ADD R1, R5
	; ADD R3, #4
	; SUB R4, #1
	; CMP R4, #0
	; BGT for
	; B stop
; stop	B 	stop

	; END
	