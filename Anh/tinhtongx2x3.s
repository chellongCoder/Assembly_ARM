; tinh tong  1+ x2 + x3 +...+ xn voi x>0 và 5<=n<=10

 AREA RESET, DATA, READONLY
     DCD 0x20001000
	 DCD ST
	 ALIGN
SOx DCD 3
SOn DCD 6
MATRAN DCD 3,4,5
       DCD 6,7,8
	   DCD 7,9,7
	   
 
TEST   DCD 0xD,0xC,0x1,0xB
       DCD 0x4,0x9,0xC,0x2
  AREA LINH, CODE, READONLY
     ENTRY
     EXPORT ST
	 
	 
; HAM TINH TONG
TINHTONG  PROC 
     MOV R6,#1 ; 
     ADD  R4,R4,#1
	 MOV R5,#0 ; BIEN J CHAY
VONGLAP
     ADD R5,R5,#1
	 CMP R5,R4
	 BGT SUM
     MUL  R6,R6,R1
	 B VONGLAP
    
SUM	 
	ADD R3,R3,R6
	CMP R4,R2
	BLT TINHTONG
	BX LR 
	ENDP
ST 
  LDR R1,SOx ; X= 3
  LDR R2,SOn  ; N =6
  MOV R3,#1 ; SUM = 1
  MOV R4,#1 ; BIEN I CHAY
 ; PHEP LUXY THUA
  BL TINHTONG
 
  
STOP B STOP
    END