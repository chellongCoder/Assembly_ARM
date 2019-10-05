;De bai: Viet chuong trinh chuyen tu he 8 sang he 16
;Khai bao doan du lieu
	AREA RESET, DATA, READONLY
		 DCD 0x20001000 ; Khai bao gia tri con tro dinh stack
		 DCD Start ; Diem bat dau chuong trinh
	ALIGN
;Khai bao du lieu
array	DCD 4,2
;Khai bao doan ma lenh
	 AREA	L05_Nhom10, CODE, READONLY	
		 ENTRY ;Khai bao diem vao chuong trinh
		 EXPORT Start

he8sang10 proc
kiemTra
		SUB R5,R5,#4	  ; Giam dia chi cua mang	
		SUB R1,#1         ; R1 = R1 - 1
		CMP R1,#1         ; so sanh R1 voi 1
		BGE tinh          ; neu R1 <= 1 thi nhay den tinh
		BX LR             ; Neu dieu kien tren khong thoa man nhay ve main
tinh	
		
		LDR R6,[R4,R5]    ; Lay gia tri tu dia chi [R4 + R5]
		MUL R3,R0         ; nhan he so 8
		MUL R7,R6,R3      ; nhan day voi he so
		ADD R12, R12,R7   ; cong ket qua
		 	
	
		B kiemTra         ; nhay vo dieu kien ve ham kiemTra   
		
ENDP

Start
		MOV R1,#2			; bien dem mang
		MOV R0,#8			; he nao thi so day, vi du day la he bat phan thi la 8, he nhi phan thi la 2
		MOV R3,#1			; bien de tinh tich
		MOV R12,#0			; bien ket qua
		LDR R4,=array 		; lay dia chi dau tien trong mang
		MOV R5,#4	  		; so byte trong mang
		LDR R6,[R4,R5] 		;lay gia tri cuoi cung cua mang
		ADD R12,R6     		;cong gia tri vao ket qua
		BL he8sang10
		NOP
		
END; ket thuc chuong tinh ket qua luu tai thanh ghi R12
