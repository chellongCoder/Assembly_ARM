;   Chuong trinh thuc hien phep chia 2 so nguyen (lay phan nguyen, phan du)
;   Sau chuong trinh R0 la phan nguyen, R1 la phan du

;  Khai bao doan du lieu
	 AREA	RESET, DATA, READONLY
		 DCD 0x20001000
		 DCD Start
;  Khai bao doan ma lenh	
	 AREA	HOANG, CODE, READONLY
		 ENTRY
		 EXPORT Start
		
 Start

	 MOV R1, #9
	 MOV R2, #2
	 MOV R0, #0
 loop
	 SUBS R1, R2 ; R1=R1-R2    
	 ADD R0, #1	; R0 += 1  (phan nguyen)
	 CMP R1, R2
	 BEQ stop
	 BGT loop

 stop 

	 END
	