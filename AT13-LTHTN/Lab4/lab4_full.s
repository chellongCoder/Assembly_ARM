
;  Viết chương trình gồm hàm main và các chương trình con sau:
;  1. Tính tổng các phần tử trong chuỗi số.
;  2. Tìm ƯCLN của 2 số
;  3. Viết chương trình tìm giá trị lớn nhất và nhỏ nhất trong chuỗi số.
;  4. Viết chương trình tính trung bình cộng của chuỗi số.
;  5. Viết chương trình tính tổng các phần tử trong ma trận
;  6. Viết chương trình đếm số phần tử dương, âm trong ma trận
;  7. Viết chương trình tìm giá trị lớn nhất, nhỏ nhất trên đường chéo chính, chéo phụ
;  8. Viết chương trình tính tổng các số chẵn, lẻ trong ma trận
;  9. Viết chương trình tính tổng các số chia hết cho 5 trong ma trận
;  10. Tìm ƯCLN của 1 chuỗi

;  --------------------------------------------------------------------------------------------
;  	Bài làm được viết theo dạng Switch - case	
;   Người dùng sẽ chọn hàm con muốn chạy bằng cách thay đổi giá trị cảu biến Select
;  	Kết quả tất cả các bài luôn lưu ở thanh ghi R1 ( bài nào kq 2 biến thì sẽ lưu ở R1 và R2)
 
;  ---------------------------------------------------------------------------------------------
	 AREA	RESET, DATA, READONLY
		 DCD 0x20001000
		 DCD	Start
		
 Select DCD  9

;  1----------
 chuoi
	 DCD 1,4,3,5,2
;  2-------	
 bienA DCD 12
 bienB DCD 8
 UCLN DCD 0
;  5-------------
 matran
	 DCD 2,5,-1
	 DCD 3,4,0
	 DCD 1,-2,2
;  8-------------
 matran8
	 DCD 2,5,4
	 DCD 3,5,0
	 DCD 1,5,2
;  9--------------
 matran9
	 DCD 2,-5,15
	 DCD 3,2,0
	 DCD 10,1,5

;  10-------------
 chuoi2
	 DCD 4,8,24,12,4
;  --------------


	 AREA	LAB4_HOANG, CODE, READONLY
		 ENTRY
		
 Start
;  -----------------
 PTchuoi EQU 5
 PTmatran EQU 9
;  ---
	;   Ket qua tat ca cac bai luu o thanh ghi R1
	 LDR R0, Select
	
	 CMP R0, #1
	 BEQ lab4_1
	 CMP R0, #2
	 BEQ lab4_2
	 CMP R0, #3
	 BEQ lab4_3    ;  kqua luu R1, R2
	  CMP R0, #4
	  BEQ lab4_4
	  CMP R0, #5
	  BEQ lab4_5
	  CMP R0, #6
	  BEQ lab4_6
	  CMP R0, #7
	  BEQ lab4_7
	 CMP R0, #8
	 BEQ lab4_8
	 CMP R0, #9
	 BEQ lab4_9
	 CMP R0, #10
	 BEQ lab4_10
 Stop B	Stop	

;  ------------------------------

;  1----------------------------
 lab4_1 PROC
	 MOV R1, #0   ;  ketqua sum
	 LDR R2, =chuoi
	 MOV R3, #0 	;	offset
	 LDR R4, =PTchuoi
 tinhTong
	 LDR R5, [R2, R3]  ; R5 = R2 + R3
	 ADD R1, R5
	 ADD R3, #4
	 SUB R4, #1
	 CMP R4, #0
	 BGT tinhTong
	 BX 	LR
	 ENDP
;  --------------------------------

;  2-------------------------------
 lab4_2 PROC
	 LDR R1, bienA
	 LDR R2, bienB
	 MOV R3, #0  ;bien temp
	 BL	TimUCLN
	
 TimUCLN 	
	 B	phanDu
 tiep	
	 MOV R3, R1   ; gan temp = phan du
	 MOV R1, R2
	 MOV R2, R3
	 CMP R2, #0
	 BNE TimUCLN	
	 BX 	LR
	 ENDP
	
 phanDu
	 SUB R1, R2
	 CMP R1, R2
	 BHS phanDu
	 B	tiep	
;  ---------------------------------------

;  3--------------------------------------
 lab4_3 PROC
  	; coi MAX = R1 va MIN = R2
	 MOV R1, #0    max
	 LDR	R3, =chuoi	; gan' address chuoi
	 LDR R2, =chuoi ;  min = phan tu dau chuoi
	 MOV	R6, #0		; gan' offset = 0
	 LDR	R4, =PTchuoi;	 soluongPT = 5
 loop
	 LDR	R5, [R3, R6]
	 CMP R5, R1
	 BGT setMax
 next1
	 CMP R5, R2
	 BLT setMin
 next2	
	 ADD	R6, #4
	 SUB R4, #1
	 CMP R4, #0
	 BGT	loop
	 BX LR
	 ENDP
	
 setMax	
	 MOV R1, R5
	 B next1
 setMin
	 MOV R2, R5
	 B next2
	
;  --------------------
;  4-------------------
  lab4_4 PROC
	  MOV R1, #0    ; ketqua sum
	  LDR R2, =chuoi
	  MOV R3, #0 	;	offset
	  LDR R4, =PTchuoi
  tong
	  LDR R5, [R2, R3] ;  R5 = R2 + R3
	  ADD R1, R5
	  ADD R3, #4
	  SUB R4, #1
	  CMP R4, #0
	  BGT tong
	  LDR R6, =PTchuoi 
	  SDIV R1, R6
	  BX 	LR
	  ENDP

;   --------------------
;   5--------------------
  lab4_5 PROC
	  MOV	R1, #0		; sum = 0  => gan' R1 = 0
	  LDR	R2, =matran	; gan' address = matran
	  MOV	R3, #0		; gan' offset = 0
	  LDR	R4, =PTmatran	 ;soluongPT = 5
  loop5
	  LDR	R5, [R2, R3]
	  ADD	R1, R1, R5
	  ADD	R3, R3, #4
	  SUB R4, R4, #1
	  CMP R4, #0
	  BGT	loop5
	  BX LR
	  ENDP

;   ---------------------
;   6--------------------
  lab4_6 PROC
	  MOV R1, #0	;soPTduong = 0
	  MOV R2, #0;	soPTam = 0
	  LDR R3, =matran ; gan R3 = address matran
	  MOV R6, #0	; gan offset = 0
	  LDR R4, =PTmatran	

  loop6
	  LDR R5, [R3, R6]
	  CMP R5, #0
	  BGE duong   ;  neu gia tri >=0 thi goi den label duong
	  BLT am		; neu gia tri <0 thi goi den label am
	
  duong
	  ADD R1, #1
	  B increase
	
  am 
	  ADD R2, #1
	  B increase
	
  increase
	  ADD R6, #4
	  SUB R4, #1
	  CMP R4, #0
	  BGT loop6
	
	  BX LR
	  ENDP
	
;   7----------------------------
;   -----------------------------
  lab4_7 PROC	
	   Max = 0
	  MOV R1, #0  ;max
	  LDR R2, =matran; min
	  LDR R3, =matran
	  MOV R4, #0 ;; offset
	  LDR R6, =PTmatran

  loop7 
	  LDR R5, [R3, R4]
	  CMP R5, R1
	  BGT setMax1   ; 16 -> 10 -> A
  next11	
	  CMP R5, R2
	  BLT setMin1
  next22	
	  ADD R4, #16
	  SUB R6, #1
	  CMP R6, #0
	  BGT loop7
	  BX LR
	  ENDP
	
  setMax1
	  MOV R1, R5
	  B next11
  setMin1
	  MOV R2, R5
	  B next22
	
;  ----------------------------------------------	

;  8---------------------------------------------	
 lab4_8 PROC
	 MOV R1, #0  ;tong le = 0
	 MOV R2, #0  ;tong chan = 0
	 LDR R0, =matran8
	 MOV R3, #0 ;offset = 0
	 LDR R4, =PTmatran ; r3 = 9
	 BL loop8
 loop8
	 LDR R5, [R0, R3]  ; R5 = gtri phan tu dau tien c?a ma tran
	 MOV R6, R5
	 CMP R6, #0
	 BEQ setChan
	 CMP R6, #1
	 BEQ setLe
	 B 	lapTru
 next8
	 ADD R3, #4
	 SUB R4, #1
	 CMP R4, #0
	 BGT loop8
	 B Stop
	
 lapTru
	 SUB R6, #2
	 CMP R6, #0
	 BEQ setChan
	 CMP R6, #1
	 BEQ setLe
	 B 	lapTru

 setChan
	 ADD R2, R5  ;sumChan += gtri R5
	 B next8

 setLe
	 ADD R1, R5  ;sumLe += R5
	 B next8

;  ----------------------------------------------	
;  9---------------------------------------------
 lab4_9 PROC
	 MOV R1, #0  sum = 0
	 LDR R0, =matran9
	 LDR R2, =PTmatran  r2 = 9
	
 loop9
	 LDR R4, [R0]
	 MOV R5, R4	
 lapTru9
	 CMP R5, #5
	 BLT next9
	 SUB R5, #5
	 B lapTru9
 next9	
	 CMP R5, #0
	 BNE thaydoi9
	 ADD R1, R4
 thaydoi9
	 SUB R2, #1
	 ADD R0, #4
	 CMP R2, #0
	 BGT loop9
	 BX LR
	 ENDP
	
;  10----------------------------
;  -----------------------------	
 lab4_10 PROC
	 LDR R1, chuoi2    ;bienA
	 LDR R5, =chuoi2
	 MOV R6, #0  ;offset
	 LDR R8, =PTchuoi   R8 = 5
 sosanh	
	 ADD R6, #4
	 LDR R2, [R5, R6] ;   bienB
	 CMP R1, R2
	 BLT thaydoi
 nextt	
	 MOV R3, #0  ;bien temp
	 BL	timUCLN	
	
	
 timUCLN 	
	 B	phanDu10
 tiep10	
	 MOV R3, R1    ;gan temp = phan du
	 MOV R1, R2
	 MOV R2, R3
	 CMP R2, #0
	 BNE timUCLN	
	 SUB R8, #1
	 CMP R8, #2 
	 BGT	;sosanh
	 BX LR
	 ENDP
	
 phanDu10
	 SUB R1, R2
	 CMP R1, R2
	 BHS phanDu
	 B	tiep10
	
	
 thaydoi
	 MOV R7, R1
	 MOV R1, R2
	 MOV R2, R7
	 B	nextt	
	
;  -------------------------------------	
	 END
	