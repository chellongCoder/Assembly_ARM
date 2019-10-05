;Chuyen so he 2 sang he 8 

;Khai bao doan du lieu
	AREA RESET, DATA, READONLY
		 DCD 0x20001000 ; Khai bao gia tri con tro dinh stack
		 DCD Start ; Diem bat dau chuong trinh
	ALIGN
; Khai bao du lieu
array	DCD 1,1,1,0,0,1,1
	AREA DATA, data, READWRITE
batphan DCD 0
 ; Khai bao doan ma lenh
	 AREA NHOM9, CODE, READONLY
		 ENTRY ;Khai bao diem vao chuong trinh
		 EXPORT Start

; Bat dau doan code (Diem vao chuong trinh)
doihe2sang10 proc
loop	SUB R1,R1,#1 ; R1 = R1 - 1
		CMP R1,#0 ; So sanh R1 voi 0
		BGT	tong ; R1 > 0 thi nhay sang nhan tong
		B stop; R1 < 0 Nhay den nhan stop
tong	SUB R5,R5,#4 ; R5 = R5 - 4
		LDR R6,[R4,R5] ; R6 = dia chi R4 + R5
		MUL	R3,R3,R0 ; R3 = R3*R0
		MUL R7,R6,R3 ; R7 = R6*R3
		ADD R12,R12,R7; R12 = R12 + R7
		B loop; Nhay den nhan loop khong can dieu kien
stop	BX LR ; Return from function call
		ENDP

doihe10sang8 proc
		MOV R1,#8 ; R1 = 8
		MOV R2,#0; R2 = 0
		MOV R8,R12; R8 = R12
		LDR R6,=batphan ; R6 = dia chi cua chuoi
l8		MOV R7,R8 ; R7 = R8
		UDIV R8,R8,R1; Chia khong dau R8 = R8/R1
		MUL R4,R8,R1 ; R4 = R8 * R1
		SUB R11,R7,R4; R11 = R7 - R4
		STR R11,[R6],#4; dia chi R6 + 4  roi luu gia tri vao R11
		CMP R7,R1 ; So sanh R7 va R1
		BLT stop8; nhay den nhan stop8 neu R7 < R1
		B l8 ; Nhay nhan l8 neu R7>R1
stop8	BX LR ;  Return from function call
		ENDP

Start
main proc
		MOV R1,#7	; i=n _R1 = 7
		MOV R0,#2	; he nao thi so day, vi du he nhi phan thi la 2, he bat phan thi la 8
		MOV R3,#1	; R3 = 1 _tich
		MOV R12,#0	; R12 = 0 _tong
		LDR R4,=array ; Lay dia chi dau tien cua chuoi luu R4
		MOV R5,#24	; R5 = 24 _so byte trong mang
		LDR R6,[R4,R5] ; R6 = dia chi R4 + 24 => R6 = 0
		ADD R12,R12,R6 ; R12 = R12+R6 = 0
		BL doihe2sang10 ; Goi ham 
		NOP
		BL doihe10sang8
		NOP
		ENDP
		END
		
		