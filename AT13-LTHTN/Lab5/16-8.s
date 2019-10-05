;De bai: Viet chuong trinh chuyen tu he 16 sang he 8
;Khai bao doan du lieu
	AREA RESET, DATA, READONLY
		 DCD 0x20001000 ; Khai bao gia tri con tro dinh stack
		 DCD Start ; Diem bat dau chuong trinh
	ALIGN
;Khai bao du lieu
array	DCD 0xA,0xB
		
chuoi8 DCD 0
;Khai bao doan ma lenh
	 AREA	L05_Nhom10, CODE, READONLY	
		 ENTRY ;Khai bao diem vao chuong trinh
		 EXPORT Start		
		
he16sang10 proc
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
		
		
he10sang8 proc
		MOV R1,#8 ; gan R1 = 8
		MOV R2,#0; gan R2 = 0
		MOV R8,R12; gan R8 = R12
		LDR R6,=chuoi8 ; gan R6 voi dia chi cua chuoi
tinh2		
		MOV R7,R8 ; gan R7 = R8
		UDIV R8,R8,R1; Chia khong dau R8 cho R1
		MUL R4,R8,R1 ; Nhan R4 = R8 * R1
		SUB R11,R7,R4; R11 = R7 - R4
		STR R11,[R6],#4; dia chi R6 + 4  roi luu gia tri vao R11
		CMP R7,R1 ; So sanh R7 va R1
		BLT stop; nhay den nhan stop8 neu R7 < R1
		B tinh2 ; Nhay nhan l8 neu R7>R1
stop	
		BX LR ;  quay lai ham main
        ENDP

Start
		MOV R1,#2			; bien dem mang
		MOV R0,#16			; he nao thi so day, vi du day la he bat phan thi la 8, he nhi phan thi la 2
		MOV R3,#1			; bien de tinh tich
		MOV R12,#0			; bien ket qua
		LDR R4,=array 		; lay dia chi dau tien trong mang
		MOV R5,#4	  		; so byte trong mang
		LDR R6,[R4,R5] 		; lay gia tri cuoi cung cua mang
		ADD R12,R6     		; cong gia tri vao ket qua
		BL he16sang10       ; goi ham chuyen he 16 sang 10
		NOP                 
		BL he10sang8        ; goi ham chuyen tu he 10 sang 8
		
END; Ket thuc chuong trinh		
		
		
		
		


		
		