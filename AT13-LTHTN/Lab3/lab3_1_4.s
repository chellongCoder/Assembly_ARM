	 AREA	RESET, DATA, READONLY
		 DCD 0x20001000
		 DCD Batdau
		
 SUM DCD 0
 N	DCD	9		
		
	 AREA	HOANG, CODE, READONLY
		 ENTRY
		
 Batdau
	 LDR R1, N    bien N
	 MOV R2, #0   sum = 0
	 MOV R3, #0  i = 0
	 BL	Tongchia5
	 LDR R4, SUM
	 STR R2, [R4]
	 B Stop
	
 Tongchia5 PROC	
	 ADD R2, R3
	 ADD R3, #5
	 CMP R3, R1
	 BLE Tongchia5
	 BX LR
	 ENDP

	
 Stop B Stop	
	
	 END
