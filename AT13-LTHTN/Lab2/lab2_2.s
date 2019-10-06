;   Chuong trinh tim gia tri lon nhat, nho nhat trong chuoi so


;  Khai bao doan du lieu
	 AREA    RESET, DATA, READONLY
		 DCD  0x20001000     
		 DCD  Start  
  
;   Khai bao' chuoi~ 
 chuoi	
	 DCD	1,2,-1,4,3
	
;  Khai bao doan ma lenh
	 AREA    HOANG, CODE, READONLY
   	   ENTRY
   	   EXPORT Start
	  
 Start
;  ----------------------------------
 soluongPT	EQU	5

	;   coi MAX = R1 va MIN = R2
	 MOV R1, #0   ; max
	 MOV R2, #0	 ; min
	 LDR	R3, =chuoi	 ;gan' address chuoi
	 MOV	R0, #0		; gan' offset = 0
	 LDR	R4, =soluongPT	; soluongPT = 5
 loop
	 LDR	R5, [R3, R0]
	 CMP R5, R1
	 BGT setMax
 next1
	 CMP R5, R2
	 BLT setMin
 next2	
	 ADD	R0, #4
	 SUB R4, #1
	 CMP R4, #0
	 BGT	loop
	 B stop
 setMax	
	 MOV R1, R5
	 B next1
 setMin
	 MOV R2, R5
	 B next2
 stop
	 B stop

	 END
	