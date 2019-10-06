 	;Lab 1_3 : Viet chuong trinh tinh giai thua cua N
 

 ;Khai bao doan du lieu
	 AREA	RESET, DATA, READONLY
		 DCD 0x20001000  ;stack pointer value when stack is empty
		 DCD Start  reset vector
	
	 ALIGN

  ;Khai bao doan ma lenh
	 AREA	HOANG, CODE, READONLY
	
	 ENTRY ;Khai bao diem vao chuong trinh
	 EXPORT Start

 Start
;  ---------------------
  ;Bat dau doan code (Diem vao chuong trinh)
  ;Tinh giai thua so N
	 MOV R2, #1  ;Sum = 1
	 MOV R3, #1   ;i = 1
 LOOP
	 CMP R3, #5   ;N=5
	 BGT STOP
	 MUL R2, R3
	 ADD R3, #1
	 B LOOP
	
 STOP	B	STOP
	
 ---------------------
	 END  ;ket thuc chuong trinh
 ---------------------