opt subtitle "HI-TECH Software Omniscient Code Generator (Lite mode) build 6738"

opt pagewidth 120

	opt lm

	processor	16F877A
clrc	macro
	bcf	3,0
	endm
clrz	macro
	bcf	3,2
	endm
setc	macro
	bsf	3,0
	endm
setz	macro
	bsf	3,2
	endm
skipc	macro
	btfss	3,0
	endm
skipz	macro
	btfss	3,2
	endm
skipnc	macro
	btfsc	3,0
	endm
skipnz	macro
	btfsc	3,2
	endm
indf	equ	0
indf0	equ	0
pc	equ	2
pcl	equ	2
status	equ	3
fsr	equ	4
fsr0	equ	4
c	equ	1
z	equ	0
pclath	equ	10
# 15 "C:\Users\Phang\Desktop\New folder\PR 7 _ Controlling Stepper Motor Using SD02B (2 Amp per phase)\Source Code PR7\PR7.c"
	psect config,class=CONFIG,delta=2 ;#
# 15 "C:\Users\Phang\Desktop\New folder\PR 7 _ Controlling Stepper Motor Using SD02B (2 Amp per phase)\Source Code PR7\PR7.c"
	dw 0x3F32 ;#
	FNCALL	_main,_delay
	FNCALL	_main,_rotate
	FNCALL	_rotate,_delay
	FNROOT	_main
	global	_ccw
	global	_on
	global	_run
	global	_ADCON0
psect	text102,local,class=CODE,delta=2
global __ptext102
__ptext102:
_ADCON0	set	31
	global	_ADRESH
_ADRESH	set	30
	global	_PORTC
_PORTC	set	7
	global	_ADGO
_ADGO	set	250
	global	_RB1
_RB1	set	49
	global	_RB2
_RB2	set	50
	global	_RB4
_RB4	set	52
	global	_RC0
_RC0	set	56
	global	_RC1
_RC1	set	57
	global	_RC2
_RC2	set	58
	global	_RC3
_RC3	set	59
	global	_RC4
_RC4	set	60
	global	_RC5
_RC5	set	61
	global	_ADCON1
_ADCON1	set	159
	global	_TRISA
_TRISA	set	133
	global	_TRISB
_TRISB	set	134
	global	_TRISC
_TRISC	set	135
	file	"PR 7.as"
	line	#
psect cinit,class=CODE,delta=2
global start_initialization
start_initialization:

psect	bssBANK0,class=BANK0,space=1
global __pbssBANK0
__pbssBANK0:
_ccw:
       ds      1

_on:
       ds      1

_run:
       ds      1

; Clear objects allocated to BANK0
psect cinit,class=CODE,delta=2
	clrf	((__pbssBANK0)+0)&07Fh
	clrf	((__pbssBANK0)+1)&07Fh
	clrf	((__pbssBANK0)+2)&07Fh
psect cinit,class=CODE,delta=2
global end_of_initialization

;End of C runtime variable initialization code

end_of_initialization:
clrf status
ljmp _main	;jump to C main() function
psect	cstackCOMMON,class=COMMON,space=1
global __pcstackCOMMON
__pcstackCOMMON:
	global	?_delay
?_delay:	; 0 bytes @ 0x0
	global	?_rotate
?_rotate:	; 0 bytes @ 0x0
	global	?_main
?_main:	; 0 bytes @ 0x0
	global	delay@data
delay@data:	; 4 bytes @ 0x0
	ds	4
	global	??_delay
??_delay:	; 0 bytes @ 0x4
	ds	4
	global	??_rotate
??_rotate:	; 0 bytes @ 0x8
	ds	4
	global	rotate@i
rotate@i:	; 1 bytes @ 0xC
	ds	1
	global	??_main
??_main:	; 0 bytes @ 0xD
	ds	1
psect	cstackBANK0,class=BANK0,space=1
global __pcstackBANK0
__pcstackBANK0:
	global	main@turn
main@turn:	; 1 bytes @ 0x0
	ds	1
;;Data sizes: Strings 0, constant 0, data 0, bss 3, persistent 0 stack 0
;;Auto spaces:   Size  Autos    Used
;; COMMON          14     14      14
;; BANK0           80      1       4
;; BANK1           80      0       0
;; BANK3           96      0       0
;; BANK2           96      0       0

;;
;; Pointer list with targets:



;;
;; Critical Paths under _main in COMMON
;;
;;   _main->_rotate
;;   _rotate->_delay
;;
;; Critical Paths under _main in BANK0
;;
;;   None.
;;
;; Critical Paths under _main in BANK1
;;
;;   None.
;;
;; Critical Paths under _main in BANK3
;;
;;   None.
;;
;; Critical Paths under _main in BANK2
;;
;;   None.

;;
;;Main: autosize = 0, tempsize = 1, incstack = 0, save=0
;;

;;
;;Call Graph Tables:
;;
;; ---------------------------------------------------------------------------------
;; (Depth) Function   	        Calls       Base Space   Used Autos Params    Refs
;; ---------------------------------------------------------------------------------
;; (0) _main                                                 2     2      0     182
;;                                             13 COMMON     1     1      0
;;                                              0 BANK0      1     1      0
;;                              _delay
;;                             _rotate
;; ---------------------------------------------------------------------------------
;; (1) _rotate                                               5     5      0     136
;;                                              8 COMMON     5     5      0
;;                              _delay
;; ---------------------------------------------------------------------------------
;; (2) _delay                                                8     4      4      45
;;                                              0 COMMON     8     4      4
;; ---------------------------------------------------------------------------------
;; Estimated maximum stack depth 2
;; ---------------------------------------------------------------------------------

;; Call Graph Graphs:

;; _main (ROOT)
;;   _delay
;;   _rotate
;;     _delay
;;

;; Address spaces:

;;Name               Size   Autos  Total    Cost      Usage
;;BITCOMMON            E      0       0       0        0.0%
;;EEDATA             100      0       0       0        0.0%
;;NULL                 0      0       0       0        0.0%
;;CODE                 0      0       0       0        0.0%
;;COMMON               E      E       E       1      100.0%
;;BITSFR0              0      0       0       1        0.0%
;;SFR0                 0      0       0       1        0.0%
;;BITSFR1              0      0       0       2        0.0%
;;SFR1                 0      0       0       2        0.0%
;;STACK                0      0       2       2        0.0%
;;ABS                  0      0      12       3        0.0%
;;BITBANK0            50      0       0       4        0.0%
;;BITSFR3              0      0       0       4        0.0%
;;SFR3                 0      0       0       4        0.0%
;;BANK0               50      1       4       5        5.0%
;;BITSFR2              0      0       0       5        0.0%
;;SFR2                 0      0       0       5        0.0%
;;BITBANK1            50      0       0       6        0.0%
;;BANK1               50      0       0       7        0.0%
;;BITBANK3            60      0       0       8        0.0%
;;BANK3               60      0       0       9        0.0%
;;BITBANK2            60      0       0      10        0.0%
;;BANK2               60      0       0      11        0.0%
;;DATA                 0      0      14      12        0.0%

	global	_main
psect	maintext,global,class=CODE,delta=2
global __pmaintext
__pmaintext:

;; *************** function _main *****************
;; Defined at:
;;		line 51 in file "C:\Users\Phang\Desktop\New folder\PR 7 _ Controlling Stepper Motor Using SD02B (2 Amp per phase)\Source Code PR7\PR7.c"
;; Parameters:    Size  Location     Type
;;		None
;; Auto vars:     Size  Location     Type
;;  turn            1    0[BANK0 ] unsigned char 
;; Return value:  Size  Location     Type
;;		None               void
;; Registers used:
;;		wreg, status,2, status,0, btemp+1, pclath, cstack
;; Tracked objects:
;;		On entry : 17F/0
;;		On exit  : 0/0
;;		Unchanged: 0/0
;; Data sizes:     COMMON   BANK0   BANK1   BANK3   BANK2
;;      Params:         0       0       0       0       0
;;      Locals:         0       1       0       0       0
;;      Temps:          1       0       0       0       0
;;      Totals:         1       1       0       0       0
;;Total ram usage:        2 bytes
;; Hardware stack levels required when called:    2
;; This function calls:
;;		_delay
;;		_rotate
;; This function is called by:
;;		Startup code after reset
;; This function uses a non-reentrant model
;;
psect	maintext
	file	"C:\Users\Phang\Desktop\New folder\PR 7 _ Controlling Stepper Motor Using SD02B (2 Amp per phase)\Source Code PR7\PR7.c"
	line	51
	global	__size_of_main
	__size_of_main	equ	__end_of_main-_main
	
_main:	
	opt	stack 6
; Regs used in _main: [wreg+status,2+status,0+btemp+1+pclath+cstack]
	line	53
	
l1913:	
;PR7.c: 53: unsigned char turn=0;
	clrc
	movlw	0
	btfsc	status,0
	movlw	1
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	movwf	(main@turn)
	line	55
	
l1915:	
;PR7.c: 55: TRISA=0b11111111;
	movlw	(0FFh)
	bsf	status, 5	;RP0=1, select bank1
	bcf	status, 6	;RP1=0, select bank1
	movwf	(133)^080h	;volatile
	line	56
	
l1917:	
;PR7.c: 56: TRISB=0b11111111;
	movlw	(0FFh)
	movwf	(134)^080h	;volatile
	line	57
	
l1919:	
;PR7.c: 57: TRISC=0B00000000;
	clrf	(135)^080h	;volatile
	line	59
	
l1921:	
;PR7.c: 59: PORTC=0;
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	clrf	(7)	;volatile
	line	60
	
l1923:	
;PR7.c: 60: ADCON1=0b00000000;
	bsf	status, 5	;RP0=1, select bank1
	bcf	status, 6	;RP1=0, select bank1
	clrf	(159)^080h	;volatile
	line	61
	
l1925:	
;PR7.c: 61: ADCON0=0b01000001;
	movlw	(041h)
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	movwf	(31)	;volatile
	line	64
	
l1927:	
;PR7.c: 64: RC0 = 0;
	bcf	(56/8),(56)&7
	line	65
	
l1929:	
;PR7.c: 65: RC1 = 0;
	bcf	(57/8),(57)&7
	line	66
	
l1931:	
;PR7.c: 66: RC2 = 0;
	bcf	(58/8),(58)&7
	goto	l1933
	line	69
;PR7.c: 69: while(1)
	
l569:	
	line	71
	
l1933:	
;PR7.c: 70: {
;PR7.c: 71: if(!RB1)
	btfsc	(49/8),(49)&7
	goto	u2391
	goto	u2390
u2391:
	goto	l1943
u2390:
	goto	l571
	line	73
	
l1935:	
;PR7.c: 72: {
;PR7.c: 73: while(RB1==0)continue;
	goto	l571
	
l572:	
	
l571:	
	btfss	(49/8),(49)&7
	goto	u2401
	goto	u2400
u2401:
	goto	l571
u2400:
	goto	l1937
	
l573:	
	line	74
	
l1937:	
;PR7.c: 74: delay(6250);
	movlw	0
	movwf	(?_delay+3)
	movlw	0
	movwf	(?_delay+2)
	movlw	018h
	movwf	(?_delay+1)
	movlw	06Ah
	movwf	(?_delay)

	fcall	_delay
	line	75
	
l1939:	
;PR7.c: 75: on^=1;
	movlw	(01h)
	movwf	(??_main+0)+0
	movf	(??_main+0)+0,w
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	xorwf	(_on),f
	line	76
	
l1941:	
;PR7.c: 76: RC0^=1;
	movlw	1<<((56)&7)
	xorwf	((56)/8),f
	goto	l1943
	line	77
	
l570:	
	line	78
	
l1943:	
;PR7.c: 77: }
;PR7.c: 78: if(!RB2)
	btfsc	(50/8),(50)&7
	goto	u2411
	goto	u2410
u2411:
	goto	l1953
u2410:
	goto	l575
	line	80
	
l1945:	
;PR7.c: 79: {
;PR7.c: 80: while(RB2==0)continue;
	goto	l575
	
l576:	
	
l575:	
	btfss	(50/8),(50)&7
	goto	u2421
	goto	u2420
u2421:
	goto	l575
u2420:
	goto	l1947
	
l577:	
	line	81
	
l1947:	
;PR7.c: 81: delay(6250);
	movlw	0
	movwf	(?_delay+3)
	movlw	0
	movwf	(?_delay+2)
	movlw	018h
	movwf	(?_delay+1)
	movlw	06Ah
	movwf	(?_delay)

	fcall	_delay
	line	82
	
l1949:	
;PR7.c: 82: ccw^=1;
	movlw	(01h)
	movwf	(??_main+0)+0
	movf	(??_main+0)+0,w
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	xorwf	(_ccw),f
	line	83
	
l1951:	
;PR7.c: 83: RC1^=1;
	movlw	1<<((57)&7)
	xorwf	((57)/8),f
	goto	l1953
	line	84
	
l574:	
	line	85
	
l1953:	
;PR7.c: 84: }
;PR7.c: 85: if(!RB4)
	btfsc	(52/8),(52)&7
	goto	u2431
	goto	u2430
u2431:
	goto	l1981
u2430:
	goto	l579
	line	87
	
l1955:	
;PR7.c: 86: {
;PR7.c: 87: while(RB4==0)continue;
	goto	l579
	
l580:	
	
l579:	
	btfss	(52/8),(52)&7
	goto	u2441
	goto	u2440
u2441:
	goto	l579
u2440:
	goto	l1957
	
l581:	
	line	88
	
l1957:	
;PR7.c: 88: delay(6250);
	movlw	0
	movwf	(?_delay+3)
	movlw	0
	movwf	(?_delay+2)
	movlw	018h
	movwf	(?_delay+1)
	movlw	06Ah
	movwf	(?_delay)

	fcall	_delay
	line	89
	
l1959:	
;PR7.c: 89: run^=1;
	movlw	(01h)
	movwf	(??_main+0)+0
	movf	(??_main+0)+0,w
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	xorwf	(_run),f
	line	90
	
l1961:	
;PR7.c: 90: RC2^=1;
	movlw	1<<((58)&7)
	xorwf	((58)/8),f
	goto	l1981
	line	91
	
l578:	
	line	93
;PR7.c: 91: }
;PR7.c: 93: while(RB1&&RB2&&RB4)
	goto	l1981
	
l583:	
	line	95
	
l1963:	
;PR7.c: 94: {
;PR7.c: 95: if(on)
	movf	(_on),w
	skipz
	goto	u2450
	goto	l584
u2450:
	line	97
	
l1965:	
;PR7.c: 96: {
;PR7.c: 97: RC5=1;
	bsf	(61/8),(61)&7
	line	99
	
l1967:	
;PR7.c: 99: if(ccw)
	movf	(_ccw),w
	skipz
	goto	u2460
	goto	l585
u2460:
	line	101
	
l1969:	
;PR7.c: 100: {
;PR7.c: 101: RC4=1;
	bsf	(60/8),(60)&7
	line	102
	
l1971:	
;PR7.c: 102: if(run)
	movf	(_run),w
	skipz
	goto	u2470
	goto	l586
u2470:
	line	104
	
l1973:	
;PR7.c: 103: {
;PR7.c: 104: rotate();
	fcall	_rotate
	line	105
;PR7.c: 105: }
	goto	l1981
	line	106
	
l586:	
	line	108
;PR7.c: 106: else
;PR7.c: 107: {
;PR7.c: 108: RC3=0;
	bcf	(59/8),(59)&7
	goto	l1981
	line	109
	
l587:	
	line	110
;PR7.c: 109: }
;PR7.c: 110: }
	goto	l1981
	line	111
	
l585:	
	line	113
;PR7.c: 111: else
;PR7.c: 112: {
;PR7.c: 113: RC4=0;
	bcf	(60/8),(60)&7
	line	114
	
l1975:	
;PR7.c: 114: if(run)
	movf	(_run),w
	skipz
	goto	u2480
	goto	l589
u2480:
	line	116
	
l1977:	
;PR7.c: 115: {
;PR7.c: 116: rotate();
	fcall	_rotate
	line	117
;PR7.c: 117: }
	goto	l1981
	line	118
	
l589:	
	line	120
;PR7.c: 118: else
;PR7.c: 119: {
;PR7.c: 120: RC3=0;
	bcf	(59/8),(59)&7
	goto	l1981
	line	121
	
l590:	
	goto	l1981
	line	122
	
l588:	
	line	123
;PR7.c: 121: }
;PR7.c: 122: }
;PR7.c: 123: }
	goto	l1981
	line	124
	
l584:	
	line	126
;PR7.c: 124: else
;PR7.c: 125: {
;PR7.c: 126: RC0=0;
	bcf	(56/8),(56)&7
	line	127
;PR7.c: 127: RC1=0;
	bcf	(57/8),(57)&7
	line	128
;PR7.c: 128: RC2=0;
	bcf	(58/8),(58)&7
	line	129
;PR7.c: 129: RC5=0;
	bcf	(61/8),(61)&7
	line	130
	
l1979:	
;PR7.c: 130: ccw=0;
	clrc
	movlw	0
	btfsc	status,0
	movlw	1
	movwf	(_ccw)
	line	131
;PR7.c: 131: run=0;
	clrc
	movlw	0
	btfsc	status,0
	movlw	1
	movwf	(_run)
	goto	l1981
	line	132
	
l591:	
	goto	l1981
	line	133
	
l582:	
	line	93
	
l1981:	
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	btfss	(49/8),(49)&7
	goto	u2491
	goto	u2490
u2491:
	goto	l1933
u2490:
	
l1983:	
	btfss	(50/8),(50)&7
	goto	u2501
	goto	u2500
u2501:
	goto	l1933
u2500:
	
l1985:	
	btfsc	(52/8),(52)&7
	goto	u2511
	goto	u2510
u2511:
	goto	l1963
u2510:
	goto	l1933
	
l593:	
	goto	l1933
	
l594:	
	goto	l1933
	line	134
	
l595:	
	line	69
	goto	l1933
	
l596:	
	line	135
	
l597:	
	global	start
	ljmp	start
	opt stack 0
GLOBAL	__end_of_main
	__end_of_main:
;; =============== function _main ends ============

	signat	_main,88
	global	_rotate
psect	text103,local,class=CODE,delta=2
global __ptext103
__ptext103:

;; *************** function _rotate *****************
;; Defined at:
;;		line 146 in file "C:\Users\Phang\Desktop\New folder\PR 7 _ Controlling Stepper Motor Using SD02B (2 Amp per phase)\Source Code PR7\PR7.c"
;; Parameters:    Size  Location     Type
;;		None
;; Auto vars:     Size  Location     Type
;;  i               1   12[COMMON] unsigned char 
;; Return value:  Size  Location     Type
;;		None               void
;; Registers used:
;;		wreg, status,2, status,0, btemp+1, pclath, cstack
;; Tracked objects:
;;		On entry : 0/0
;;		On exit  : 0/0
;;		Unchanged: 0/0
;; Data sizes:     COMMON   BANK0   BANK1   BANK3   BANK2
;;      Params:         0       0       0       0       0
;;      Locals:         1       0       0       0       0
;;      Temps:          4       0       0       0       0
;;      Totals:         5       0       0       0       0
;;Total ram usage:        5 bytes
;; Hardware stack levels used:    1
;; Hardware stack levels required when called:    1
;; This function calls:
;;		_delay
;; This function is called by:
;;		_main
;; This function uses a non-reentrant model
;;
psect	text103
	file	"C:\Users\Phang\Desktop\New folder\PR 7 _ Controlling Stepper Motor Using SD02B (2 Amp per phase)\Source Code PR7\PR7.c"
	line	146
	global	__size_of_rotate
	__size_of_rotate	equ	__end_of_rotate-_rotate
	
_rotate:	
	opt	stack 6
; Regs used in _rotate: [wreg+status,2+status,0+btemp+1+pclath+cstack]
	line	147
	
l1883:	
;PR7.c: 147: unsigned char i=0;
	clrc
	movlw	0
	btfsc	status,0
	movlw	1
	movwf	(rotate@i)
	line	149
	
l1885:	
;PR7.c: 149: ADGO=1;
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	bsf	(250/8),(250)&7
	line	150
;PR7.c: 150: while(ADGO==1)continue;
	goto	l605
	
l606:	
	
l605:	
	btfsc	(250/8),(250)&7
	goto	u2361
	goto	u2360
u2361:
	goto	l605
u2360:
	goto	l1887
	
l607:	
	line	168
	
l1887:	
;PR7.c: 168: if(ADRESH==0)
	movf	(30),f
	skipz	;volatile
	goto	u2371
	goto	u2370
u2371:
	goto	l1891
u2370:
	line	170
	
l1889:	
;PR7.c: 169: {
;PR7.c: 170: RC3=0;
	bcf	(59/8),(59)&7
	line	171
;PR7.c: 171: }
	goto	l612
	line	173
	
l608:	
	
l1891:	
;PR7.c: 173: else if((255-ADRESH)<=6)
	movf	(30),w	;volatile
	movwf	(??_rotate+0)+0
	clrf	(??_rotate+0)+0+1
	comf	(??_rotate+0)+0,f
	comf	(??_rotate+0)+1,f
	incf	(??_rotate+0)+0,f
	skipnz
	incf	(??_rotate+0)+1,f
	movf	0+(??_rotate+0)+0,w
	addlw	low(0FFh)
	movwf	(??_rotate+2)+0
	movf	1+(??_rotate+0)+0,w
	skipnc
	addlw	1
	addlw	high(0FFh)
	movwf	1+(??_rotate+2)+0
	movf	1+(??_rotate+2)+0,w
	xorlw	80h
	movwf	btemp+1
	movlw	(high(07h))^80h
	subwf	btemp+1,w
	skipz
	goto	u2385
	movlw	low(07h)
	subwf	0+(??_rotate+2)+0,w
u2385:

	skipnc
	goto	u2381
	goto	u2380
u2381:
	goto	l1903
u2380:
	line	175
	
l1893:	
;PR7.c: 174: {
;PR7.c: 175: i = 6;
	movlw	(06h)
	movwf	(??_rotate+0)+0
	movf	(??_rotate+0)+0,w
	movwf	(rotate@i)
	line	176
	
l1895:	
;PR7.c: 176: RC3=1;
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	bsf	(59/8),(59)&7
	line	177
	
l1897:	
;PR7.c: 177: delay(i);
	movf	(rotate@i),w
	movwf	(??_rotate+0)+0
	clrf	((??_rotate+0)+0+1)
	clrf	((??_rotate+0)+0+2)
	clrf	((??_rotate+0)+0+3)
	movf	3+(??_rotate+0)+0,w
	movwf	(?_delay+3)
	movf	2+(??_rotate+0)+0,w
	movwf	(?_delay+2)
	movf	1+(??_rotate+0)+0,w
	movwf	(?_delay+1)
	movf	0+(??_rotate+0)+0,w
	movwf	(?_delay)

	fcall	_delay
	line	178
	
l1899:	
;PR7.c: 178: RC3=0;
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	bcf	(59/8),(59)&7
	line	179
	
l1901:	
;PR7.c: 179: delay(i);
	movf	(rotate@i),w
	movwf	(??_rotate+0)+0
	clrf	((??_rotate+0)+0+1)
	clrf	((??_rotate+0)+0+2)
	clrf	((??_rotate+0)+0+3)
	movf	3+(??_rotate+0)+0,w
	movwf	(?_delay+3)
	movf	2+(??_rotate+0)+0,w
	movwf	(?_delay+2)
	movf	1+(??_rotate+0)+0,w
	movwf	(?_delay+1)
	movf	0+(??_rotate+0)+0,w
	movwf	(?_delay)

	fcall	_delay
	line	180
;PR7.c: 180: }
	goto	l612
	line	181
	
l610:	
	line	183
	
l1903:	
;PR7.c: 181: else
;PR7.c: 182: {
;PR7.c: 183: i = 255-ADRESH;
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	decf	(30),w	;volatile
	xorlw	0ffh
	addlw	0FFh
	movwf	(??_rotate+0)+0
	movf	(??_rotate+0)+0,w
	movwf	(rotate@i)
	line	184
	
l1905:	
;PR7.c: 184: RC3=1;
	bsf	(59/8),(59)&7
	line	185
	
l1907:	
;PR7.c: 185: delay(i);
	movf	(rotate@i),w
	movwf	(??_rotate+0)+0
	clrf	((??_rotate+0)+0+1)
	clrf	((??_rotate+0)+0+2)
	clrf	((??_rotate+0)+0+3)
	movf	3+(??_rotate+0)+0,w
	movwf	(?_delay+3)
	movf	2+(??_rotate+0)+0,w
	movwf	(?_delay+2)
	movf	1+(??_rotate+0)+0,w
	movwf	(?_delay+1)
	movf	0+(??_rotate+0)+0,w
	movwf	(?_delay)

	fcall	_delay
	line	186
	
l1909:	
;PR7.c: 186: RC3=0;
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	bcf	(59/8),(59)&7
	line	187
	
l1911:	
;PR7.c: 187: delay(i);
	movf	(rotate@i),w
	movwf	(??_rotate+0)+0
	clrf	((??_rotate+0)+0+1)
	clrf	((??_rotate+0)+0+2)
	clrf	((??_rotate+0)+0+3)
	movf	3+(??_rotate+0)+0,w
	movwf	(?_delay+3)
	movf	2+(??_rotate+0)+0,w
	movwf	(?_delay+2)
	movf	1+(??_rotate+0)+0,w
	movwf	(?_delay+1)
	movf	0+(??_rotate+0)+0,w
	movwf	(?_delay)

	fcall	_delay
	goto	l612
	line	188
	
l611:	
	goto	l612
	
l609:	
	line	189
	
l612:	
	return
	opt stack 0
GLOBAL	__end_of_rotate
	__end_of_rotate:
;; =============== function _rotate ends ============

	signat	_rotate,88
	global	_delay
psect	text104,local,class=CODE,delta=2
global __ptext104
__ptext104:

;; *************** function _delay *****************
;; Defined at:
;;		line 140 in file "C:\Users\Phang\Desktop\New folder\PR 7 _ Controlling Stepper Motor Using SD02B (2 Amp per phase)\Source Code PR7\PR7.c"
;; Parameters:    Size  Location     Type
;;  data            4    0[COMMON] unsigned long 
;; Auto vars:     Size  Location     Type
;;		None
;; Return value:  Size  Location     Type
;;		None               void
;; Registers used:
;;		wreg
;; Tracked objects:
;;		On entry : 0/0
;;		On exit  : 0/0
;;		Unchanged: 0/0
;; Data sizes:     COMMON   BANK0   BANK1   BANK3   BANK2
;;      Params:         4       0       0       0       0
;;      Locals:         0       0       0       0       0
;;      Temps:          4       0       0       0       0
;;      Totals:         8       0       0       0       0
;;Total ram usage:        8 bytes
;; Hardware stack levels used:    1
;; This function calls:
;;		Nothing
;; This function is called by:
;;		_main
;;		_rotate
;; This function uses a non-reentrant model
;;
psect	text104
	file	"C:\Users\Phang\Desktop\New folder\PR 7 _ Controlling Stepper Motor Using SD02B (2 Amp per phase)\Source Code PR7\PR7.c"
	line	140
	global	__size_of_delay
	__size_of_delay	equ	__end_of_delay-_delay
	
_delay:	
	opt	stack 6
; Regs used in _delay: [wreg]
	line	141
	
l1877:	
;PR7.c: 141: for( ;data>0;data-=1);
	movf	(delay@data+3),w
	iorwf	(delay@data+2),w
	iorwf	(delay@data+1),w
	iorwf	(delay@data),w
	skipz
	goto	u2331
	goto	u2330
u2331:
	goto	l1881
u2330:
	goto	l602
	
l1879:	
	goto	l602
	
l600:	
	
l1881:	
	movlw	01h
	movwf	((??_delay+0)+0)
	movlw	0
	movwf	((??_delay+0)+0+1)
	movlw	0
	movwf	((??_delay+0)+0+2)
	movlw	0
	movwf	((??_delay+0)+0+3)
	movf	0+(??_delay+0)+0,w
	subwf	(delay@data),f
	movf	1+(??_delay+0)+0,w
	skipc
	incfsz	1+(??_delay+0)+0,w
	goto	u2345
	goto	u2346
u2345:
	subwf	(delay@data+1),f
u2346:
	movf	2+(??_delay+0)+0,w
	skipc
	incfsz	2+(??_delay+0)+0,w
	goto	u2347
	goto	u2348
u2347:
	subwf	(delay@data+2),f
u2348:
	movf	3+(??_delay+0)+0,w
	skipc
	incfsz	3+(??_delay+0)+0,w
	goto	u2349
	goto	u2340
u2349:
	subwf	(delay@data+3),f
u2340:

	movf	(delay@data+3),w
	iorwf	(delay@data+2),w
	iorwf	(delay@data+1),w
	iorwf	(delay@data),w
	skipz
	goto	u2351
	goto	u2350
u2351:
	goto	l1881
u2350:
	goto	l602
	
l601:	
	line	142
	
l602:	
	return
	opt stack 0
GLOBAL	__end_of_delay
	__end_of_delay:
;; =============== function _delay ends ============

	signat	_delay,4216
psect	text105,local,class=CODE,delta=2
global __ptext105
__ptext105:
	global	btemp
	btemp set 07Eh

	DABS	1,126,2	;btemp
	global	wtemp0
	wtemp0 set btemp
	end
