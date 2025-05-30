; Программа для вывода 4 на восьмисегментном индикаторе с частотой около 1 Гц
.def temp0=r20; Назначение рабочих регистров
.def temp1=r21
.def temp2=r22
.def score1=r23
.def score2=r24
.def score3=r25

.cseg 
.org 0 

ldi temp0,0x00 
out acsr,temp0
ldi temp0,0xff 
out ddrd,temp0 
ldi temp0,0x00 
out ddra,temp0 

ldi temp0, 0xff
out portd, temp0

ldi temp1, 0b11111111; Затухание цифры
ldi temp2, 0b10011001; Вывод цифры. Для вывода другой цифры (или символа) требуется изменить набор 0 и 1

; Для изменения частоты нужно провести редактирование задержек

metka0:
in temp0, pina
cpi temp0, 0
brne metka1
out portd, temp2
rcall Delay1
out portd, temp1
rcall Delay1
rjmp metka0

metka1:
out portd, temp1
rjmp metka0

Delay1:
ldi score1,4
ldi score2,4
ldi score3,4

Delay2:
dec score1
brne Delay2
dec score2
brne Delay2
dec score3
brne Delay2

ret
