;   Tinh UCLN
;  Euclid   UCLN 
;  	while(b != 0)
;  		temp = a%b
;  		a = b     
;  		b =temp
;   return a
	 AREA	RESET, DATA, READONLY
		 DCD 0x20001000
		 DCD Batdau
		
 UCLN DCD 0
 bienA	DCD	12	
 bienB	DCD	8

	 AREA	HOANG, CODE, READONLY
		 ENTRY
		
 Batdau
	 LDR R1, bienA  ; bien A
	 LDR R2,; bienB
	 MOV R3, #0;  bien temp
	 BL	TimUCLN
	 LDR R4, UCLN
	 STR	R1, [R4]
 Stop B Stop		
	
 TimUCLN PROC	
	 B	phanDu
 tiep	
	 MOV R3, R1  ;  gan temp = phan du
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

	
	 END
