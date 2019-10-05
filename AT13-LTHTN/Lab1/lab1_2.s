; ;Lab1_2 Viet chuong trinh tinh tong so chan, so le <=N

; ;Khai bao doan du lieu
	; AREA	RESET, DATA, READONLY
		; DCD 0x20001000 ; stack pointer value when stack is empty
		; DCD Start ; reset vector
	
	; ALIGN

; ; Khai bao doan ma lenh
	; AREA	HOANG, CODE, READONLY	
		; ENTRY ;Khai bao diem vao chuong trinh
		; EXPORT Start

; Start
; ;---------------------
; ; Bat dau doan code (Diem vao chuong trinh)
; soN	EQU	9

; ;So chan <= N
	; MOV R1, #0  ; Sum_chan = 0   Tong so chan
	; MOV R2, #0	; Sum_le = 0	Tong so le	
	; MOV R3, #0  ; i = 0 bien cua Sum_chan    
	; MOV R4, #1  ; j = 1 bien cua Sum_le?
	; LDR R5, =soN   ; load so N vao` R5

; LOOP
	; ADD R1, R3 	; 
	; ADD R3, #2
	; CMP R3, R5
	; BLS LOOP	; neu R3 <= R5( so sanh i <= N) thi tiep tuc LOOP
	
; LOOP2
	; ADD R2, R4
	; ADD R4, #2
	; CMP R4, R5
	; BLS LOOP2

; STOP	B	STOP	
	
; ;---------------------
	; END ; ket thuc chuong trinh
; ;---------------------