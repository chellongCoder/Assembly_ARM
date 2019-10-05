  AREA reset,data,readonly
     DCD 0x20001000
	 DCD Start1
	 ALIGN

  AREA linh,code,readonly
     ENTRY
	 EXPORT Start1
;; day la phan code
Start1   
  MOV R1,#0x6
  MUL R0,R1,R1
  LDR R2,=4
  MUL R0,R2,R0
  LDR R2,=3
  MUL R2,R1,R2
  ADD R0,R0,R2
Stop B Stop

   END 