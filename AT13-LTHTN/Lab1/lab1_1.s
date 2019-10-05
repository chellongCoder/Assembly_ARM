;Lab 1_1 Viet chuong trinh tinh tong cac so <= N

; ;Khai bao doan du lieu
AREA        RESET     , DATA, READONLY
            DCD       0x20001000          ; stack pointer value when stack is empty
            DCD       Start               ; reset vector
	
            ALIGN

; Khai bao doan ma lenh
AREA	LONG,  CODE      , READONLY
            ENTRY                         ;Khai bao diem vao chuong trinh
            EXPORT    Start

Start  
;---------------------
; Bat dau doan code (Diem vao chuong trinh)

            MOV       R2, #0              ; sum =0
            MOV       R3, #1              ; i = 1
	
LOOP 
            CMP       R3, #5              ; N =5
            BGT       STOP
            ADD       R2, R3              ;sum += i;
            ADD       R3, #1              ;i++
            B         LOOP
            
STOP B      STOP
	
; ;---------------------
            END                           ; ket thuc chuong trinh
; ;---------------------

