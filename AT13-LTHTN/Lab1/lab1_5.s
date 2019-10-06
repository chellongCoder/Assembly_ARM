;  Khai bao doan du lieu
	 AREA	RESET, DATA, READONLY
		 DCD 0x20001000  ;stack pointer value when stack is empty
		 DCD Start  reset vector
		
		

;   Khai bao doan ma lenh
	 AREA	HOANG, CODE, READONLY
		 ENTRY ;Khai bao diem vao chuong trinh
		 EXPORT Start

 Start
 ;---------------------
  ;Bat dau doan code (Diem vao chuong trinh)
	 MOV R1, #2  ;x = 2
	 MOV R2, #1   ;Tich = 1
	 MOV R3, #1   ;i = 1
 LOOP 
	 CMP R3, #3   ;N=3
	 BGT STOP
	 MUL R2, R1
	 ADD R3, #1
	 B LOOP

 STOP	B	STOP
	
 ---------------------
	 END  ;ket thuc chuong trinh
 ---------------------
