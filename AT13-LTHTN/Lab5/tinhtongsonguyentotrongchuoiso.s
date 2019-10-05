;-----------------------------------------
;Tinh tong cac so nguyen to trong chuoi so
;-----------------------------------------
	AREA RESET, DATA, READONLY
		DCD 0X20001000
		DCD Start
chuoi	DCD 2,3,7,8,10,11		; nhap vao chuoi

	ALIGN
	AREA NHOM14, CODE, READONLY
ENTRY
	EXPORT Start
Start
sopt EQU 6
	LDR R4, =chuoi			;nap chuoi vao R4
	LDR R5, =sopt			;nap so phan tu cua chuoi vao R5
	MOV R6, #0				;khoi tao con tro
LOOP1	
	LDR R0,[R4,R6]          ;bat dau kiem tra so dau tien cua chuoi
	CMP R0,#01              ;so sanh voi 1
	BEQ SUM               	;neu bang -> so nguyen to -> ham tinh tong SUM
	CMP R0,#02              ;so sanh voi 2
	BEQ SUM                	;neu bang -> so nguyen to -> ham tinh tong SUM
	MOV R1,R0               ;nap so do tu R0 vao R1
	MOV R2,#02              ;neu da khac 1 va 2 thi bat dau lay so chia
UP                     
	BL DIV            		;nhay den ham chia DIV
	CMP R8,#00              ;so sanh so du voi 0
	BEQ NEXT           		;neu bang -> khong phai so nguyen to nhay den next de chay den so tiep theo cua chuoi
	ADD R2,R2,#01           ;neu khac 0 -> tang so chia len 1 don vi
	CMP R2,R1               ;so sanh so chia voi so dang duoc kiem tra
	BEQ SUM            		;neu so chia da bang so kiem tra -> so nguyen to -> ham tinh tong SUM
	B UP                    ;neu chua thi tiep tuc vong lap
NEXT
	ADD R6,#4				;con tro nhay den vi tri tiep theo
	SUB R5,#1				;so phan tu cua chuoi giam 1 do da tro qua vi tri dau tien
	CMP R5,#0				;so sanh so phan tu con lai voi 0
	BGT LOOP1				;neu con phan tu nao cua chuoi thi tiep tuc nhay den vong lap LOOP1
	B STOP					;neu khong con phan tu nao thi nhay den STOP va dung chuong trinh
SUM
	MOV R3,R0				;chuyen so nguyen to da tim duoc vao R3
	ADD R7,R7,R3			;R7 := R7 + R3 tinh tong ghi vao thanh R7 -> ket qua cuoi cung duoc luu o day
	BL NEXT					;quay lai ham next de duyet phan tu tiep theo trong chuoi
STOP 
	B STOP             

DIV                 	
	MOV R8,R0               ;lay so can kiem tra tinh nguyen to ghi vao R8
	MOV R9,R2               ;ghi so chia vao R9
LOOP2                     	
	SUB R8,R8,R9            ;lay so bi chia tru di so chia -> day la so du cua phep chia khi vong lap ket thuc
	ADD R10,R10,#01         ;dem so lan thuc hien phep tru -> day la thuong khi vong lap ket thuc
	CMP R8,R9               ;so sanh so bi chia voi so chia den khi so bi chia nho hon so chia
	BPL LOOP2               ;tiep tuc vong lap neu van can tiep tuc phep tru (-)
	MOV PC,LR               ;quay lai ham chinh
	