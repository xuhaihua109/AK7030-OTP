opt subtitle "HI-TECH Software Omniscient Code Generator (PRO mode) build 10920"

opt pagewidth 120

	opt pm

	processor	16C77
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
# 69 "C:\dev\DAC_OP_Test V1.1\src\main.c"
	psect config,class=CONFIG,delta=2 ;#
# 69 "C:\dev\DAC_OP_Test V1.1\src\main.c"
	dw 0x2FFF & 0x3fdf & 0x3FEF & 0x3FFB & 0x3FFF & 0x3FFF ;#
# 70 "C:\dev\DAC_OP_Test V1.1\src\main.c"
	psect config,class=CONFIG,delta=2 ;#
# 70 "C:\dev\DAC_OP_Test V1.1\src\main.c"
	dw 0x3FFF & 0x3FAF & 0x3FFF & 0x3FFE ;#
# 71 "C:\dev\DAC_OP_Test V1.1\src\main.c"
	psect config,class=CONFIG,delta=2 ;#
# 71 "C:\dev\DAC_OP_Test V1.1\src\main.c"
	dw 0X3FFF & 0x3FFF & 0x3FFF & 0x3FF8 ;#
	FNCALL	_main,_clock_config
	FNCALL	_main,_dac_init
	FNCALL	_main,_op1_init
	FNCALL	_main,_op2_init
	FNROOT	_main
	global	_OP1CON0
psect	text61,local,class=CODE,delta=2
global __ptext61
__ptext61:
_OP1CON0	set	27
	global	_OP1CON1
_OP1CON1	set	28
	global	_OP1CON2
_OP1CON2	set	29
	global	_PB0
_PB0	set	48
	global	_DACCON
_DACCON	set	135
	global	_DACR0
_DACR0	set	136
	global	_DACR1
_DACR1	set	137
	global	_OP2CON0
_OP2CON0	set	155
	global	_OP2CON1
_OP2CON1	set	156
	global	_OP2CON2
_OP2CON2	set	157
	global	_TRISA7
_TRISA7	set	1071
	global	_TRISB0
_TRISB0	set	1072
	global	_TRISB3
_TRISB3	set	1075
	global	_TRISB4
_TRISB4	set	1076
	global	_TRISB5
_TRISB5	set	1077
	global	_TRISB6
_TRISB6	set	1078
	global	_CLKPR
_CLKPR	set	264
	file	"ProjTest.as"
	line	#
psect cinit,class=CODE,delta=2
global start_initialization
start_initialization:

psect cinit,class=CODE,delta=2
global end_of_initialization

;End of C runtime variable initialization code

end_of_initialization:
clrf status
ljmp _main	;jump to C main() function
psect	cstackCOMMON,class=COMMON,space=1
global __pcstackCOMMON
__pcstackCOMMON:
	global	?_dac_init
?_dac_init:	; 0 bytes @ 0x0
	global	??_dac_init
??_dac_init:	; 0 bytes @ 0x0
	global	?_op1_init
?_op1_init:	; 0 bytes @ 0x0
	global	??_op1_init
??_op1_init:	; 0 bytes @ 0x0
	global	?_op2_init
?_op2_init:	; 0 bytes @ 0x0
	global	??_op2_init
??_op2_init:	; 0 bytes @ 0x0
	global	?_clock_config
?_clock_config:	; 0 bytes @ 0x0
	global	??_clock_config
??_clock_config:	; 0 bytes @ 0x0
	global	?_main
?_main:	; 0 bytes @ 0x0
	global	??_main
??_main:	; 0 bytes @ 0x0
	ds	2
;;Data sizes: Strings 0, constant 0, data 0, bss 0, persistent 0 stack 0
;;Auto spaces:   Size  Autos    Used
;; COMMON          14      2       2
;; BANK0           80      0       0
;; BANK1           80      0       0
;; BANK3           96      0       0
;; BANK2           96      0       0

;;
;; Pointer list with targets:



;;
;; Critical Paths under _main in COMMON
;;
;;   None.
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
;;Main: autosize = 0, tempsize = 2, incstack = 0, save=0
;;

;;
;;Call Graph Tables:
;;
;; ---------------------------------------------------------------------------------
;; (Depth) Function   	        Calls       Base Space   Used Autos Params    Refs
;; ---------------------------------------------------------------------------------
;; (0) _main                                                 2     2      0       0
;;                                              0 COMMON     2     2      0
;;                       _clock_config
;;                           _dac_init
;;                           _op1_init
;;                           _op2_init
;; ---------------------------------------------------------------------------------
;; (1) _op2_init                                             0     0      0       0
;; ---------------------------------------------------------------------------------
;; (1) _op1_init                                             0     0      0       0
;; ---------------------------------------------------------------------------------
;; (1) _dac_init                                             0     0      0       0
;; ---------------------------------------------------------------------------------
;; (1) _clock_config                                         0     0      0       0
;; ---------------------------------------------------------------------------------
;; Estimated maximum stack depth 1
;; ---------------------------------------------------------------------------------

;; Call Graph Graphs:

;; _main (ROOT)
;;   _clock_config
;;   _dac_init
;;   _op1_init
;;   _op2_init
;;

;; Address spaces:

;;Name               Size   Autos  Total    Cost      Usage
;;BITCOMMON            E      0       0       0        0.0%
;;NULL                 0      0       0       0        0.0%
;;CODE                 0      0       0       0        0.0%
;;COMMON               E      2       2       1       14.3%
;;BITSFR0              0      0       0       1        0.0%
;;SFR0                 0      0       0       1        0.0%
;;BITSFR1              0      0       0       2        0.0%
;;SFR1                 0      0       0       2        0.0%
;;STACK                0      0       1       2        0.0%
;;ABS                  0      0       0       3        0.0%
;;BITBANK0            50      0       0       4        0.0%
;;BITSFR3              0      0       0       4        0.0%
;;SFR3                 0      0       0       4        0.0%
;;BANK0               50      0       0       5        0.0%
;;BITSFR2              0      0       0       5        0.0%
;;SFR2                 0      0       0       5        0.0%
;;DATA                 0      0       0       6        0.0%
;;BITBANK1            50      0       0       7        0.0%
;;BANK1               50      0       0       8        0.0%
;;BITBANK3            60      0       0       9        0.0%
;;BANK3               60      0       0      10        0.0%
;;BITBANK2            60      0       0      11        0.0%
;;BANK2               60      0       0      12        0.0%

	global	_main
psect	maintext,global,class=CODE,delta=2
global __pmaintext
__pmaintext:

;; *************** function _main *****************
;; Defined at:
;;		line 80 in file "C:\dev\DAC_OP_Test V1.1\src\main.c"
;; Parameters:    Size  Location     Type
;;		None
;; Auto vars:     Size  Location     Type
;;		None
;; Return value:  Size  Location     Type
;;		None               void
;; Registers used:
;;		wreg, status,2, status,0, pclath, cstack
;; Tracked objects:
;;		On entry : 17F/0
;;		On exit  : 0/0
;;		Unchanged: 0/0
;; Data sizes:     COMMON   BANK0   BANK1   BANK3   BANK2
;;      Params:         0       0       0       0       0
;;      Locals:         0       0       0       0       0
;;      Temps:          2       0       0       0       0
;;      Totals:         2       0       0       0       0
;;Total ram usage:        2 bytes
;; Hardware stack levels required when called:    1
;; This function calls:
;;		_clock_config
;;		_dac_init
;;		_op1_init
;;		_op2_init
;; This function is called by:
;;		Startup code after reset
;; This function uses a non-reentrant model
;;
psect	maintext
	file	"C:\dev\DAC_OP_Test V1.1\src\main.c"
	line	80
	global	__size_of_main
	__size_of_main	equ	__end_of_main-_main
	
_main:	
	opt	stack 7
; Regs used in _main: [wreg+status,2+status,0+pclath+cstack]
	line	81
	
l2284:	
;main.c: 81: clock_config();
	fcall	_clock_config
	line	84
	
l2286:	
;main.c: 84: TRISB3=1;
	bsf	status, 5	;RP0=1, select bank1
	bcf	status, 6	;RP1=0, select bank1
	bsf	(1075/8)^080h,(1075)&7
	line	85
	
l2288:	
;main.c: 85: TRISB4=1;
	bsf	(1076/8)^080h,(1076)&7
	line	86
	
l2290:	
;main.c: 86: TRISB5=0;
	bcf	(1077/8)^080h,(1077)&7
	line	89
	
l2292:	
;main.c: 89: TRISA7=0;
	bcf	(1071/8)^080h,(1071)&7
	line	90
	
l2294:	
;main.c: 90: TRISB6=1;
	bsf	(1078/8)^080h,(1078)&7
	line	93
	
l2296:	
;main.c: 93: TRISB0=0;
	bcf	(1072/8)^080h,(1072)&7
	line	95
;main.c: 95: dac_init();
	fcall	_dac_init
	line	96
;main.c: 96: op1_init();
	fcall	_op1_init
	line	97
;main.c: 97: op2_init();
	fcall	_op2_init
	line	101
	
l2298:	
;main.c: 100: {
;main.c: 101: PB0=~PB0;
	movlw	1<<((48)&7)
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	xorwf	((48)/8),f
	line	102
	
l2300:	
;main.c: 102: _delay((unsigned long)((1000)*(20000000/4000000.0)));
	opt asmopt_off
movlw	7
movwf	((??_main+0)+0+1),f
	movlw	125
movwf	((??_main+0)+0),f
u17:
	decfsz	((??_main+0)+0),f
	goto	u17
	decfsz	((??_main+0)+0+1),f
	goto	u17
opt asmopt_on

	goto	l2298
	global	start
	ljmp	start
	opt stack 0
psect	maintext
	line	104
GLOBAL	__end_of_main
	__end_of_main:
;; =============== function _main ends ============

	signat	_main,88
	global	_op2_init
psect	text62,local,class=CODE,delta=2
global __ptext62
__ptext62:

;; *************** function _op2_init *****************
;; Defined at:
;;		line 40 in file "C:\dev\DAC_OP_Test V1.1\src\periph.c"
;; Parameters:    Size  Location     Type
;;		None
;; Auto vars:     Size  Location     Type
;;		None
;; Return value:  Size  Location     Type
;;		None               void
;; Registers used:
;;		wreg
;; Tracked objects:
;;		On entry : 17F/0
;;		On exit  : 17F/20
;;		Unchanged: FFE80/0
;; Data sizes:     COMMON   BANK0   BANK1   BANK3   BANK2
;;      Params:         0       0       0       0       0
;;      Locals:         0       0       0       0       0
;;      Temps:          0       0       0       0       0
;;      Totals:         0       0       0       0       0
;;Total ram usage:        0 bytes
;; Hardware stack levels used:    1
;; This function calls:
;;		Nothing
;; This function is called by:
;;		_main
;; This function uses a non-reentrant model
;;
psect	text62
	file	"C:\dev\DAC_OP_Test V1.1\src\periph.c"
	line	40
	global	__size_of_op2_init
	__size_of_op2_init	equ	__end_of_op2_init-_op2_init
	
_op2_init:	
	opt	stack 7
; Regs used in _op2_init: [wreg]
	line	47
	
l2282:	
;periph.c: 47: OP2CON1=0x03;
	movlw	(03h)
	bsf	status, 5	;RP0=1, select bank1
	movwf	(156)^080h	;volatile
	line	49
;periph.c: 49: OP2CON2=0xB0;
	movlw	(0B0h)
	movwf	(157)^080h	;volatile
	line	50
;periph.c: 50: OP2CON0=0x80;
	movlw	(080h)
	movwf	(155)^080h	;volatile
	line	51
	
l1894:	
	return
	opt stack 0
GLOBAL	__end_of_op2_init
	__end_of_op2_init:
;; =============== function _op2_init ends ============

	signat	_op2_init,88
	global	_op1_init
psect	text63,local,class=CODE,delta=2
global __ptext63
__ptext63:

;; *************** function _op1_init *****************
;; Defined at:
;;		line 26 in file "C:\dev\DAC_OP_Test V1.1\src\periph.c"
;; Parameters:    Size  Location     Type
;;		None
;; Auto vars:     Size  Location     Type
;;		None
;; Return value:  Size  Location     Type
;;		None               void
;; Registers used:
;;		wreg
;; Tracked objects:
;;		On entry : 17F/20
;;		On exit  : 17F/0
;;		Unchanged: FFE80/0
;; Data sizes:     COMMON   BANK0   BANK1   BANK3   BANK2
;;      Params:         0       0       0       0       0
;;      Locals:         0       0       0       0       0
;;      Temps:          0       0       0       0       0
;;      Totals:         0       0       0       0       0
;;Total ram usage:        0 bytes
;; Hardware stack levels used:    1
;; This function calls:
;;		Nothing
;; This function is called by:
;;		_main
;; This function uses a non-reentrant model
;;
psect	text63
	file	"C:\dev\DAC_OP_Test V1.1\src\periph.c"
	line	26
	global	__size_of_op1_init
	__size_of_op1_init	equ	__end_of_op1_init-_op1_init
	
_op1_init:	
	opt	stack 7
; Regs used in _op1_init: [wreg]
	line	33
	
l2280:	
;periph.c: 33: OP1CON1=0x02;
	movlw	(02h)
	bcf	status, 5	;RP0=0, select bank0
	movwf	(28)	;volatile
	line	34
;periph.c: 34: OP1CON2=0xA0;
	movlw	(0A0h)
	movwf	(29)	;volatile
	line	35
;periph.c: 35: OP1CON0=0x80;
	movlw	(080h)
	movwf	(27)	;volatile
	line	36
	
l1891:	
	return
	opt stack 0
GLOBAL	__end_of_op1_init
	__end_of_op1_init:
;; =============== function _op1_init ends ============

	signat	_op1_init,88
	global	_dac_init
psect	text64,local,class=CODE,delta=2
global __ptext64
__ptext64:

;; *************** function _dac_init *****************
;; Defined at:
;;		line 14 in file "C:\dev\DAC_OP_Test V1.1\src\periph.c"
;; Parameters:    Size  Location     Type
;;		None
;; Auto vars:     Size  Location     Type
;;		None
;; Return value:  Size  Location     Type
;;		None               void
;; Registers used:
;;		wreg
;; Tracked objects:
;;		On entry : 17F/20
;;		On exit  : 17F/20
;;		Unchanged: FFE80/0
;; Data sizes:     COMMON   BANK0   BANK1   BANK3   BANK2
;;      Params:         0       0       0       0       0
;;      Locals:         0       0       0       0       0
;;      Temps:          0       0       0       0       0
;;      Totals:         0       0       0       0       0
;;Total ram usage:        0 bytes
;; Hardware stack levels used:    1
;; This function calls:
;;		Nothing
;; This function is called by:
;;		_main
;; This function uses a non-reentrant model
;;
psect	text64
	file	"C:\dev\DAC_OP_Test V1.1\src\periph.c"
	line	14
	global	__size_of_dac_init
	__size_of_dac_init	equ	__end_of_dac_init-_dac_init
	
_dac_init:	
	opt	stack 7
; Regs used in _dac_init: [wreg]
	line	15
	
l2272:	
;periph.c: 15: DACCON|=2;
	bsf	(135)^080h+(1/8),(1)&7	;volatile
	line	17
	
l2274:	
;periph.c: 17: DACR0=0x19;
	movlw	(019h)
	movwf	(136)^080h	;volatile
	line	18
	
l2276:	
;periph.c: 18: DACCON|=(1)<<2;
	bsf	(135)^080h+(2/8),(2)&7	;volatile
	line	20
;periph.c: 20: DACR1=0x06;
	movlw	(06h)
	movwf	(137)^080h	;volatile
	line	21
	
l2278:	
;periph.c: 21: DACCON|=(1)<<3;
	bsf	(135)^080h+(3/8),(3)&7	;volatile
	line	22
	
l1888:	
	return
	opt stack 0
GLOBAL	__end_of_dac_init
	__end_of_dac_init:
;; =============== function _dac_init ends ============

	signat	_dac_init,88
	global	_clock_config
psect	text65,local,class=CODE,delta=2
global __ptext65
__ptext65:

;; *************** function _clock_config *****************
;; Defined at:
;;		line 7 in file "C:\dev\DAC_OP_Test V1.1\src\common.c"
;; Parameters:    Size  Location     Type
;;		None
;; Auto vars:     Size  Location     Type
;;		None
;; Return value:  Size  Location     Type
;;		None               void
;; Registers used:
;;		wreg, status,2
;; Tracked objects:
;;		On entry : 17F/0
;;		On exit  : 17F/40
;;		Unchanged: FFE80/0
;; Data sizes:     COMMON   BANK0   BANK1   BANK3   BANK2
;;      Params:         0       0       0       0       0
;;      Locals:         0       0       0       0       0
;;      Temps:          0       0       0       0       0
;;      Totals:         0       0       0       0       0
;;Total ram usage:        0 bytes
;; Hardware stack levels used:    1
;; This function calls:
;;		Nothing
;; This function is called by:
;;		_main
;; This function uses a non-reentrant model
;;
psect	text65
	file	"C:\dev\DAC_OP_Test V1.1\src\common.c"
	line	7
	global	__size_of_clock_config
	__size_of_clock_config	equ	__end_of_clock_config-_clock_config
	
_clock_config:	
	opt	stack 7
; Regs used in _clock_config: [wreg+status,2]
	line	9
	
l2268:	
;common.c: 9: CLKPR = 0x80;
	movlw	(080h)
	bsf	status, 6	;RP1=1, select bank2
	movwf	(264)^0100h	;volatile
	line	10
	
l2270:	
;common.c: 10: CLKPR = 0x00;
	clrf	(264)^0100h	;volatile
	line	11
	
l625:	
	return
	opt stack 0
GLOBAL	__end_of_clock_config
	__end_of_clock_config:
;; =============== function _clock_config ends ============

	signat	_clock_config,88
psect	text66,local,class=CODE,delta=2
global __ptext66
__ptext66:
	global	btemp
	btemp set 07Eh

	DABS	1,126,2	;btemp
	global	wtemp0
	wtemp0 set btemp
	end
