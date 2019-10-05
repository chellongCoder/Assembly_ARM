; Viết chương trình tính tổng các số <= N.
; ; Khai bao doan du lieu
	; AREA    RESET, DATA, READONLY
		; DCD  0x20001000     ; stack pointer value when stack is empty
		; DCD  Reset_Handler  ; reset vector
  
      ; ALIGN
	  
; ;Chu y: Cac nhan, ten can dat sat le trai
; SUMP      DCD SUM
; SUM       DCD 0


; N         DCD 5

; ; Khai bao doan ma lenh
          ; AREA    MYCODE, CODE, READONLY
 
   	  ; ENTRY ;Khai bao diem vao chuong trinh
   	  ; EXPORT Reset_Handler
; ;-------------------------------------------------------------------------
; ; Bat dau doan code (Diem vao cua chuong trinh)---------------------------

; ;---------------------------------------------------------------
; SUMUP 	PROC
	; ADD 	R0, R0, R1 	;Add number into R0
	; SUBS 	R1, R1, #1 	;Decrement loop counter R1
	; BGT 	SUMUP 		;Branch back if not done
	; ;MOV 	PC, LR
	; BX 	LR
	; ENDP

; ;;;users main program;;;;;

; Reset_Handler  

   	
	; LDR 	R1, N 		;Load count into R1
	; MOV 	R0, #0 		;Clear accumulator R0
	; BL  	SUMUP
	; LDR 	R3, SUMP	;Load address of SUM to R3
	; STR 	R0, [R3]	;Store SUM
    

; STOP	
        ; B STOP

	; END 	