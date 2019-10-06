;   Chuong trinh tinh tong cac phan tu trong ma tran
;  Khai bao doan du lieu
	 AREA    RESET, DATA, READONLY
		 DCD  0x20001000     
		 DCD  Start  
  
       ALIGN
;   Khai bao' chuoi~ 
 matran
	 DCD 2,5,1
	 DCD 3,4,0
	 DCD 1,2,2
	
;  Khai bao doan ma lenh
	 AREA    HOANG, CODE, READONLY
   	   ENTRY
   	   EXPORT Start
	  
 Start
;  ----------------------------------
 soluongPT	EQU	9

	 MOV	R1, #0		; sum = 0  => gan' R1 = 0
	 LDR	R2, =matran	; gan' address = matran
	 MOV	R3, #0		; gan' offset = 0
	 LDR	R4, =soluongPT	; soluongPT = 5
 loop
	 LDR	R5, [R2, R3]
	 ADD	R1, R1, R5
	 ADD	R3, R3, #4
	 SUB R4, R4, #1
	 CMP R4, #0
	 BGT	loop
	
 stop
	 B stop

	 END
	