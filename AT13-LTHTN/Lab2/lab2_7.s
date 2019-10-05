; ; Chuong trinh tinh tong cac so chan, so le trong ma tran 
; ; Y tuong: 	Luu ket qua tong chan o? R0, tong le? o R1
; ;		kiem tra tung phan tu? trong ma tran neu' chan goi ham setChan, nguoc lai goi setLe
; ;		do ko co' phep chia lay du, nen ta tru lan luot cho 2, neu =0 la so chan, =1 la` so le?

; ;Khai bao doan du lieu
	; AREA    RESET, DATA, READONLY
		; DCD  0x20001000     
		; DCD  Start  
  
; ; Khai bao' chuoi~ 
; matran
	; DCD 2,5,4
	; DCD 3,5,0
	; DCD 1,5,2
	
; ;Khai bao doan ma lenh
	; AREA    HOANG, CODE, READONLY
   	  ; ENTRY
   	  ; EXPORT Start
	  
; Start
; ;----------------------------------
; soluongPT	EQU	9

	; MOV R0, #0 ; tong chan = 0
	; MOV R1, #0 ; tong le? = 0
	; LDR R2, =matran
	; MOV R3, #0; offset = 0
	; LDR R4, =soluongPT ; r3 = 9

; loop
	; LDR R5, [R2, R3]  ; R5 = gtri phan tu dau tien c?a ma tran
	; MOV R6, R5
	; CMP R6, #0
	; BEQ setChan
	; CMP R6, #1
	; BEQ setLe
	; B 	lapTru
; next
	; ADD R3, #4
	; SUB R4, #1
	; CMP R4, #0
	; BGT loop
	; B stop
	
; lapTru
	; SUB R6, #2
	; CMP R6, #0
	; BEQ setChan
	; CMP R6, #1
	; BEQ setLe
	; B 	lapTru

; setChan
	; ADD R0, R5 ; sumChan += gtri R5
	; B next

; setLe
	; ADD R1, R5 ; sumLe += R5
	; B next


; stop 
	; B stop

	; END
	
	
	