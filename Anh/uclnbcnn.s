; TIM UOC CHUNG LN , BCNN CUA 2 SO
 AREA RESET, DATA, READONLY
    DCD 0x20001000
	DCD ST
 ALIGN
  AREA LINH, CODE, READONLY
   ENTRY
   EXPORT
; HAM UCNN
UCNN PROC
A0   CMP R1,#0 
	BNE B0
	MOV R3,R2
	
	
B0 
     CMP R3,#0
	 BNE TIMUCNN
	 MOV R3,R1

TIMUCNN
     CMP R2,R1
	 BEQ GANUC
	 BLE TRU1
	 BGT TRU2
TRU1
     SUBS R1,R1,R2
	 B TIMUCNN
TRU2
    SUB R2,R2,R1
	B TIMUCNN

	  
GANUC
     MOV R3,R1
    BX LR
	 ENDP
; MAIN
ST 
   MOV R1, #0 ; a=3
   MOV R2,#6  ; B=6 
   MOV R3,#0 ; UOC CHUNG NHO NHAT
    BL UCNN
STOP B STOP


END