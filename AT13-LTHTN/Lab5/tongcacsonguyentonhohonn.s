; tinh tong cac so nguyen to nho hon n
; ta biet trong dãy so nguyen to thi chi co 2 la so chan, tat ca cac so nguyen to lon hon 2 deu la so le
; va 2 la so nguyen to bé nhat. Vay thi tong cac so nguyen to nho hon 2 la 0, tong cac so nguyen to < =2 la 2
; ta se kiem tra tu so i=3 tro di, va sau moi lan kiem tra se tang len 2 don vi. Tuc la 3 -> 5 -> 7 -> 9 ->11 ->... ->n
; ta se chia i cho j (i>=3,i+=2; i>=1;j++) lay du, cho den khi nao j>i/2 thi dung. Moi lan chia het ta se tang bien dem len 1
; sau khi j>i/2 thì kiem tra dem vs 2. Neu d > 2 thi day kp la so nguyen to (vi i chia het cho 3 so tro len).
; Neu d <2 thi day la so nguyen to vì i chi chia het cho 1 va chinh no
		AREA reset, data, readonly
		EXPORT __Vectors
__Vectors
			DCD 0x20001000
			DCD Reset_Handler			 
			ALIGN
array		DCD 5,0,2,15
		DCD 10,11,20,13
		AREA mycode, code, readonly
		ENTRY
		EXPORT Reset_Handler
tongsonguyento proc		; chuong trinh con tongsonguyento
		CMP R0,#2	; so sanh R0 vs 2
		BLT tong0	; neu R0 < 2 thi nhay den nhan tong0
		BEQ tong2       ; neu R0=2 thi nhay den nhan tong2
		B loop		; con lai thi nhay den loop
tong0 	MOV R12,#0	;tong  =0
		B stop
tong2	MOV R12,#2	; tong = 2
		B stop
loop	
		UDIV R4,R1,R2   ; chia so nguyen khong dau : R4=R1/R2
		MUL R5,R4,R2    ; nhan : R5=R4*R2
		SUB R6,R1,R5	; tru  : R6=R1-R5
		CMP R6,#0	; so sanh R6 voi 0
		BEQ tangd 	; neu R6=0 thi nhay den nhan tangd
		B tangj		; con lai thi nhay den tangj
tangd	ADD R3,R3,#1		; R3=R3+1
		B tangj		; nhay den tangj
tangj	ADD R2,R2,#1		; R2=R2+1
		UDIV R7,R1,R8		; R7 = R1/R8 = i/2
		CMP R2,R7			; so sanh R2 vs R7 tuc la so sanh j vs i/2
		BGT ktbiendem		; neu j > i/2 thi nhay den nhan ktbiendem
		B loop				; con khong thi nhay den loop
ktbiendem 	
			CMP R3,#2 	; so sanh R3 voi 2
			BGE tangi	; neu lon hon hoac bang thi nhay den nhan tangi
			BLT	ketqua	; nho hon thi nhay den nhan ketqua
ketqua	
		ADD R12,R12,R1		; R12=R12+R1
		B tangi			; nhay den nhan tangi
		
tangi	MOV R3,#0			;R3=0
		MOV R2,#1		; R2=1
		ADD R1,R1,#2		;R1=R1+2
		CMP R1,R0		; so sanh R1 voi R0
		BGT stop		; neu lon hon thi nhay den stop
		B loop			; con lai thi nhay den loop

stop	BX LR				; luu dia chi vao thanh ghi lien ket LR
		ENDP 			; ket thuc chuong trinh con
Reset_Handler
main					; chuong trinh chinh
		MOV	R0,#14	; so n=14	
		MOV R1,#3	; R1: i =3	
		MOV R2,#1	; R2: j =1
		MOV R3,#0	; R3 bien dem = 0
		MOV R8,#2	; R8 bien chia = 2
		MOV R12,#2	; R12 bien tong =2
		BL tongsonguyento ; goi chuong trinh con tongsonguyento
		NOP		 ; khong co dieu kien
		ENDP		 ; ket thuc chuong trinh con	
		END		 ; ket thuc chuong trinh chinh	
	
		