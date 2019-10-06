;   Chuong trinh tim gia tri lon nhat, nho nhat tren duong cheo chinh, cheo phu
;  Khai bao doan du lieu
	 AREA    RESET, DATA, READONLY
		 DCD  0x20001000     
		 DCD  Batdau  
  
       ALIGN
;   Khai bao' chuoi~ 
 matran
	 DCD 2,-5,1
	 DCD -3,4,0
	 DCD -1,2,2
	
;  Khai bao doan ma lenh
	 AREA    MYCODE, CODE, READONLY
   	   ENTRY
   	   EXPORT Batdau
	  
 Batdau
;  ----------------------------------
 soluongPT	EQU	9

 start
	  Max = 0
	 MOV R1, #0 ; max
	 MOV R2, #0 ;min
	 LDR R3, =matran
	 MOV R4, #0  offset
	 LDR R0, =soluongPT

 loop 
	 LDR R5, [R3, R4]
	 CMP R5, R1
	 BGT setMax    
 next1	
	 CMP R5, R2
	 BLT setMin
 next2	
	 ADD R4, #16 ; 16 -> 10 -> A
	 SUB R0, #1
	 CMP R0, #0
	 BGT loop
	 B stop
 setMax
	 MOV R1, R5
	 B next1
 setMin
	 MOV R2, R5
	 B next2

 stop

	 END
	