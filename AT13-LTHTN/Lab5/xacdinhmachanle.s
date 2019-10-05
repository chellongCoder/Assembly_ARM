; Khai bao doan du lieu
	AREA    RESET, DATA, READONLY
		DCD  0x20001000     ; stack pointer value when stack is empty
		DCD  Reset_Handler  ; reset vector
  
      ALIGN
 
; Khai bao doan ma lenh
          AREA    ANH, CODE, READONLY
 
   	  ENTRY ;Khai bao diem vao chuong trinh
   	  EXPORT Reset_Handler
	  
Reset_Handler
;-------------------------------------------------------------------------
; Bat dau doan code (Diem vao cua chuong trinh)---------------------------
start
	LDR	r0, =0x16
	
	MOV	r1, r0			; tmp = value
	
	EOR	r1, r1, r1, LSR #1	; tmp = tmp EOR tmp << 1
	EOR	r1, r1, r1, LSR #2	; tmp = tmp EOR tmp << 2
	EOR	r1, r1, r1, LSR #4	; tmp = tmp EOR tmp << 4
	
	AND	r1, r1, #0x00000001	; xoa moi bit tru LSB
	ORR	r0, r0, r1, LSL #7	; thiet lap bit chan le o vi tri MSB
	
stop	B	stop

	END
