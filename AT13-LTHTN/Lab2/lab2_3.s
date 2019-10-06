;   Chuong trinh tinh trung binh cong 1 chuoi so
;  Khai bao doan du lieu
	 AREA    RESET, DATA, READONLY
		 DCD  0x20001000     
		 DCD  Start  
  
       ALIGN
;   Khai bao' chuoi~ 
 chuoi	
	 DCD	1,2,1,3,4
	
;  Khai bao doan ma lenh
	 AREA    HOANG, CODE, READONLY
   	   ENTRY
   	   EXPORT Start
	  
 Start
;  ----------------------------------
 soluongPT	EQU	5

	 MOV	R1, #0	;	 sum = 0  => gan' R1 = 0
	 LDR	R2, =chuoi	; gan' address = chuoi
	 MOV	R3, #0		; gan' offset = 0
	 LDR	R4, =soluongPT	 ;soluongPT = 5
 loop
	 LDR	R5, [R2, R3]
	 ADD	R1, R1, R5
	 ADD	R3, R3, #4
	 SUB R4, R4, #1
	 CMP R4, #0
	 BGT	loop
	 SDIV R6, R1, #5
 stop
	 B stop

	 END
	