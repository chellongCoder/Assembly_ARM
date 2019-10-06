;   Viet chuong trinh tim UCLN cua 2 so
;   Ket qua UCLN luu R1
;   Thuc hien theo thuat toan Euclid tim UCLN 
;  	while(b != 0)
;  		temp = a%b
;  		a = b     
;  		b =temp
;   return a

;  Khai bao doan du lieu
	 AREA	RESET, DATA, READONLY
		 DCD 0x20001000 ; stack pointer value when stack is empty
		 DCD Start  reset vector

;  bienA DCD 12
;  bienB DCD 8


;   Khai bao doan ma lenh
	 AREA	HOANG, CODE, READONLY
		 ENTRY ;Khai bao diem vao chuong trinh
		 EXPORT Start

 Start
;  ---------------------
;   Bat dau doan code (Diem vao chuong trinh)

	 LDR R1, bienA
	 LDR R2, bienB
	 MOV R3, #0 ; bien temp
	
 TimUCLN 	
	 B	phanDu
 tiep	
	 MOV R3, R1   ; gan temp = phan du
	 MOV R1, R2
	 MOV R2, R3
	 CMP R2, #0
	 BNE TimUCLN	
	 B STOP
	
 phanDu
	 SUB R1, R2
	 CMP R1, R2
	 BHS phanDu
	 B	tiep	
	
 STOP	B	STOP
	
;  ---------------------
	 END ; ket thuc chuong trinh
;  ---------------------
