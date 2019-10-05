;Chuyen so he 8 sang he 2
;Khai bao doan du lieu
	AREA RESET, DATA, READONLY
		 DCD 0x20001000 ; Khai bao gia tri con tro dinh stack
		 DCD Start ; Diem bat dau chuong trinh
	ALIGN
;Khai bao du lieu
array	DCD 1,2,3,4
nhiphan DCD 0
 ; Khai bao doan ma lenh
	 AREA NHOM9, CODE, READONLY
		 ENTRY ;Khai bao diem vao chuong trinh
		 EXPORT Start

; Bat dau doan code (Diem vao chuong trinh)
doihe8sanghe10 proc
loop	SUB R1,R1,#1; R1 = R1 - 1
		CMP R1,#0; So sanh R1 voi 0
		BGT	tong ; R1 > 0 thi nhay nhan tong
		B stop ; Nhay den nhan stop khong can dieu kien
tong	SUB R5,R5,#4 ; R5 = R5 - 4
		LDR R6,[R4,R5] ; R6 = diachiR4 +R5 => Gia tri R6
		MUL	R3,R3,R0 ; R3 = R3*0
		MUL R7,R6,R3 ; R7 = R6*R3
		ADD R12,R12,R7 ; R12 = R12+R7
		B loop ; Nhảy đến nhan loop khong can dieu kien
stop	BX LR
		ENDP

doihe10sang2 proc
		MOV R1,#2 ; R1 = 2
		MOV R2,#0; R2 = 0
		MOV R8,R12; R8 = R12
		LDR R6,=nhiphan ; R6 = dia chi cua chuoi
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
		MOV R1,#4	;  R1 = 4, bien chay i
		MOV R0,#8	; he nao thi so day, vi du day la he bat phan thi la 8, he nhi phan thi la 2
		MOV R3,#1	; tich
		MOV R12,#0	; tong
		LDR R4,=array
		MOV R5,#12	; so byte trong mang
		LDR R6,[R4,R5]
		ADD R12,R12,R6
		BL doihe8sanghe10
		NOP
		BL doihe10sang2
		NOP
		ENDP
		END

		
		
