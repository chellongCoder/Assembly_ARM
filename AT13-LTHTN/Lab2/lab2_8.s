;   Chuong trinh tinh tong cac so chia het cho 5 tren ma tran
;  Khai bao doan du lieu
	 AREA    RESET, DATA, READONLY
		 DCD  0x20001000     
		 DCD  Start  
  
       ALIGN
;   Khai bao' chuoi~ 
 matran
	 DCD 2,-5,15
	 DCD 3,2,0
	 DCD 10,1,5
	
;  Khai bao doan ma lenh
	 AREA    HOANG, CODE, READONLY
   	   ENTRY
   	   EXPORT Start
	  
 Start
;  ----------------------------------
 soluongPT	EQU	9

	 MOV R1, #0 ; sum = 0
	 LDR R0, =matran
	 LDR R2, =soluongPT ; r2 = 9
	
 loop
	 LDR R4, [R0]
	 MOV R5, R4	
 lapTru
	 CMP R5, #5
	 BLT next
	 SUB R5, #5
	 B lapTru
 next	
	 CMP R5, #0
	 BNE thaydoi
	 ADD R1, R4
 thaydoi
	 SUB R2, #1
	 ADD R0, #4
	 CMP R2, #0
	 BGT loop

 stop 
	 B stop

	 END
	
	
	