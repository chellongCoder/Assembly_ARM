;   Chuong trinh dem so phan tu duong, am trong ma tran
;  Khai bao doan du lieu
	 AREA    RESET, DATA, READONLY
		 DCD  0x20001000     
		 DCD  Start  
  
      
;   Khai bao' chuoi~ 
 matran
	 DCD 2,-5,1
	 DCD -3,4,0
	 DCD -1,2,2
	
;  Khai bao doan ma lenh
	 AREA    HOANG, CODE, READONLY
   	   ENTRY
   	   EXPORT Start
	  
 Start
;  ----------------------------------
 soluongPT	EQU	9

 start
	 MOV R1, #0	;soPTduong = 0
	 MOV R2, #0;	soPTam = 0
	 LDR R3, =matran ; gan R3 = address matran
	 MOV R0, #0	; gan offset = 0
	 LDR R4, =soluongPT	

 loop
	 LDR R5, [R3, R0]
	 CMP R5, #0
	 BGE DUONG  ;   neu gia tri >=0 thi goi den label duong
	 BLT AM		 ;neu gia tri <0 thi goi den label am
	
 DUONG
	 ADD R1, #1
	 B increase
	
 AM 
	 ADD R2, #1
	 B increase
	
 increase
	 ADD R0, #4
	 SUB R4, #1
	 CMP R4, #0
	 BGT loop	
 stop 
	 B stop

	 END
	