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
	 
ST 
    MOV R2,#0X0 
	LDR R1,=0X7
	MOVS R1,R1,LSR #1
	ADC R2,R2,#1
	MOVS R1,R1, LSR #1
	ADC R2,R2,#1
STOP B STOP
   END