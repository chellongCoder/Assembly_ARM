;Chuong trinh chuyen so n tu he co so 10 sang he co so 2
;ket qua luu vao mang nhiphan
;doc ket qua tu phai qua trai
;--------------------------------------------------------

	AREA reset,data,readonly
		DCD 0x20001000
		DCD Main
n		DCD 35

	AREA data, data, readwrite
nhiphan	DCD 0

	AREA mycode,code,readonly
		ENTRY
		EXPORT Main

Main
	LDR r0, n					;load gia tri n vao thanh ghi r0
	LDR r4, =nhiphan			;load dia chi mang nhiphan vao thanh ghi r4
	MOV r5, #0					;chuyen 0 vao thanh ghi r5
	MOV r1, #2					;chuyen 2 vao thanh ghi r1
loop
	UDIV r2, r0, r1				;r2 = r0 / r1
	MUL r3, r2, r1				;r3 = r2 * r1
	SUB r3, r0, r3				;r3 = r0 - r3
	STR r3, [r4, r5]			;luu gia tri r3 vao mang nhiphan va tang 2 len 2 byte de luu so tiep theo
	MOV r0, r2					;chuyen gia tri thanh ghi r2 vao thanh ghi r0
	CMP r0, #0					;so sanh r0 voi 0
	BEQ stop					;nhay den nhan stop neu bang
	ADD r5, #1					;tang r5 them 1
	B loop						;nhay den nhan loop
stop
END 