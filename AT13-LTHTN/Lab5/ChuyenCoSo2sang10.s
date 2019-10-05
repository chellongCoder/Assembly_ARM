;Chuong trinh chuyen so nhi phan duoc luu trong mang array sang co so 10
;ket qua luu vao thanh ghi r2
;-----------------------------------------------------------------------
	
	AREA reset,data,readonly
		DCD 0x20001000
		DCD Main
array	DCD 1,1,0,0,1		;mang so nhi phan
n		DCD 5				;so chu so trong mang
offset	DCD 16				;so offset max cua mang

	AREA mycode,code,readonly
		ENTRY
		EXPORT Main
		
Main
	LDR r0, n
	LDR r1, =array		;load dia chi mang array vao thanh ghi r1
	MOV r2, #0			;chuyen 0 vao thanh ghi r2 (luu tong)
	MOV r3, #1			;chuyen 1 vao thanh ghi r3 (luu tich)
	MOV r4, #2			;chuyen 2 vao thanh ghi r4 (co so 2)
	LDR r5, offset		;gia tri toi da cua offset mang array
	LDR r6, [r1,r5]		;load gia tri cua cung trong mang array vao thanh ghi r6
	ADD r2, r6			;r2 = r2 + r6
loop
	SUB r0,r0,#1		;r0 = r0 - 1
	CMP R0,#0			;so sanh r0 voi 0
	BGT	tong			;nhay den tong neu lon hon
	B stop				;nhay den stop
tong
	SUB r5,#4			;r5 = r5 - 4
	LDR r6,[r1,r5]		;load gia tri tiep theo cua mang tu phai qua trai
	MUL	r3,r4			;r3 = r3 * r4
	MUL r7,r6,r3		;r7 = r6 * r3
	ADD r2,r7			;r2 = r2 + r7
	B loop				;nhay den loop
stop	
END 





