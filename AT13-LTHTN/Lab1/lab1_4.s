;  	Viet chuong trinh tinh tong cac <= N chia het cho 5
;   Y tuong: Moi~ lan` tang bien len 5 roi them vao Sum neu' bien >N thi` dung`.

;  Khai bao doan du lieu
	 AREA	RESET, DATA, READONLY
		 DCD 0x20001000 ; stack pointer value when stack is empty
		 DCD Start  reset vector

;   Khai bao doan ma lenh
	 AREA	HOANG, CODE, READONLY
		 ENTRY ;Khai bao diem vao chuong trinh
		 EXPORT Start

 Start
;  ---------------------
;   Bat dau doan code (Diem vao chuong trinh)
 Tong <=N ;chia het cho 5
	 MOV R2, #0  ;Sum = 0
	 MOV R3, #5   ;i = 5
 LOOP 
	 CMP R3, #10  ; N=5
	 BGT STOP
	 ADD R2, R3
	 ADD R3, #5
	 B LOOP
	
 STOP	B	STOP

 ---------------------
	 END ; ket thuc chuong trinh
 ---------------------