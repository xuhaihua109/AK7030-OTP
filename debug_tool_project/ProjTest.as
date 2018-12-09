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
# 70 "C:\dev\AK7030-OTP\main.c"
	psect config,class=CONFIG,delta=2 ;#
# 70 "C:\dev\AK7030-OTP\main.c"
	dw 0x2FFF & 0x3FFF & 0x3FFF & 0x3FFF & 0x3FFF & 0x3FFF ;#
# 71 "C:\dev\AK7030-OTP\main.c"
	psect config,class=CONFIG,delta=2 ;#
# 71 "C:\dev\AK7030-OTP\main.c"
	dw 0x3FFF & 0x3FDF & 0x3FFF & 0x3FFE ;#
# 72 "C:\dev\AK7030-OTP\main.c"
	psect config,class=CONFIG,delta=2 ;#
# 72 "C:\dev\AK7030-OTP\main.c"
	dw 0X3FFF & 0x3FFF & 0x3FFF & 0x3FF8 ;#
	FNCALL	_main,_clock_config
	FNCALL	_main,_timer1_interrupt_config
	FNCALL	_main,_timer1_config
	FNCALL	_main,_adConverter_config
	FNCALL	_main,_dac_init
	FNCALL	_main,_op1_init
	FNCALL	_main,_op2_init
	FNCALL	_main,_start_timer1
	FNCALL	_main,_process_AD_Converter_Value
	FNCALL	_process_AD_Converter_Value,_AD_Sample
	FNCALL	_AD_Sample,_SetTempThermistorChannel
	FNCALL	_AD_Sample,_start_AD_Converter
	FNCALL	_AD_Sample,_isAD_Completed
	FNCALL	_AD_Sample,_clearAdCompleteFalg
	FNCALL	_AD_Sample,_stop_AD_Converter
	FNCALL	_AD_Sample,_getAdValue
	FNCALL	_getAdValue,_isAD_Completed
	FNROOT	_main
	FNCALL	intlevel1,_ISR
	global	intlevel1
	FNROOT	intlevel1
	global	_sampleChannelSelect
psect	idataCOMMON,class=CODE,space=0,delta=2
global __pidataCOMMON
__pidataCOMMON:
	file	"C:\dev\AK7030-OTP\common.c"
	line	13

;initializer for _sampleChannelSelect
	retlw	0Dh
	global	_buffer_Sample_AD_Value
	global	ISR@flashCnt
	global	_multiFilterMaxValue
	global	_multiFilterMinValue
	global	_sampleCount
	global	_sampleTimes
	global	_timer10msCnt
	global	_ADCON0
_ADCON0	set	31
	global	_ADRESH
_ADRESH	set	30
	global	_OP1CON0
_OP1CON0	set	27
	global	_OP1CON1
_OP1CON1	set	28
	global	_OP1CON2
_OP1CON2	set	29
	global	_T1CON
_T1CON	set	16
	global	_TMR1H
_TMR1H	set	15
	global	_TMR1L
_TMR1L	set	14
	global	_ADIF
_ADIF	set	106
	global	_ADON
_ADON	set	248
	global	_CHS0
_CHS0	set	250
	global	_CHS1
_CHS1	set	251
	global	_CHS2
_CHS2	set	252
	global	_CHS3
_CHS3	set	253
	global	_GIE
_GIE	set	95
	global	_PA0
_PA0	set	40
	global	_PEIE
_PEIE	set	94
	global	_TMR1IF
_TMR1IF	set	96
	global	_TMR1ON
_TMR1ON	set	128
	global	_ADCON1
_ADCON1	set	159
	global	_ADRESL
_ADRESL	set	158
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
	global	_ADIE
_ADIE	set	1130
	global	_TMR1IE
_TMR1IE	set	1120
	global	_TRISA0
_TRISA0	set	1064
	global	_TRISA1
_TRISA1	set	1065
	global	_TRISA3
_TRISA3	set	1067
	global	_TRISA7
_TRISA7	set	1071
	global	_TRISB0
_TRISB0	set	1072
	global	_TRISB2
_TRISB2	set	1074
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
	global	_CLKPCE
_CLKPCE	set	2119
	file	"ProjTest.as"
	line	#
psect cinit,class=CODE,delta=2
global start_initialization
start_initialization:

psect	bssCOMMON,class=COMMON,space=1
global __pbssCOMMON
__pbssCOMMON:
_sampleCount:
       ds      1

_sampleTimes:
       ds      1

_timer10msCnt:
       ds      1

psect	dataCOMMON,class=COMMON,space=1
global __pdataCOMMON
__pdataCOMMON:
	file	"C:\dev\AK7030-OTP\common.c"
_sampleChannelSelect:
       ds      1

psect	bssBANK0,class=BANK0,space=1
global __pbssBANK0
__pbssBANK0:
_buffer_Sample_AD_Value:
       ds      20

ISR@flashCnt:
       ds      2

_multiFilterMaxValue:
       ds      2

_multiFilterMinValue:
       ds      2

psect clrtext,class=CODE,delta=2
global clear_ram
;	Called with FSR containing the base address, and
;	W with the last address+1
clear_ram:
	clrwdt			;clear the watchdog before getting into this loop
clrloop:
	clrf	indf		;clear RAM location pointed to by FSR
	incf	fsr,f		;increment pointer
	xorwf	fsr,w		;XOR with final address
	btfsc	status,2	;have we reached the end yet?
	retlw	0		;all done for this memory range, return
	xorwf	fsr,w		;XOR again to restore value
	goto	clrloop		;do the next byte

; Clear objects allocated to COMMON
psect cinit,class=CODE,delta=2
	clrf	((__pbssCOMMON)+0)&07Fh
	clrf	((__pbssCOMMON)+1)&07Fh
	clrf	((__pbssCOMMON)+2)&07Fh
; Clear objects allocated to BANK0
psect cinit,class=CODE,delta=2
	bcf	status, 7	;select IRP bank0
	movlw	low(__pbssBANK0)
	movwf	fsr
	movlw	low((__pbssBANK0)+01Ah)
	fcall	clear_ram
; Initialize objects allocated to COMMON
	global __pidataCOMMON
psect cinit,class=CODE,delta=2
	fcall	__pidataCOMMON+0		;fetch initializer
	movwf	__pdataCOMMON+0&07fh		
psect cinit,class=CODE,delta=2
global end_of_initialization

;End of C runtime variable initialization code

end_of_initialization:
clrf status
ljmp _main	;jump to C main() function
psect	cstackCOMMON,class=COMMON,space=1
global __pcstackCOMMON
__pcstackCOMMON:
	global	?_AD_Sample
?_AD_Sample:	; 0 bytes @ 0x0
	global	?_SetTempThermistorChannel
?_SetTempThermistorChannel:	; 0 bytes @ 0x0
	global	?_dac_init
?_dac_init:	; 0 bytes @ 0x0
	global	?_op1_init
?_op1_init:	; 0 bytes @ 0x0
	global	?_op2_init
?_op2_init:	; 0 bytes @ 0x0
	global	?_clock_config
?_clock_config:	; 0 bytes @ 0x0
	global	?_timer1_config
?_timer1_config:	; 0 bytes @ 0x0
	global	?_start_timer1
?_start_timer1:	; 0 bytes @ 0x0
	global	?_timer1_interrupt_config
?_timer1_interrupt_config:	; 0 bytes @ 0x0
	global	?_adConverter_config
?_adConverter_config:	; 0 bytes @ 0x0
	global	?_start_AD_Converter
?_start_AD_Converter:	; 0 bytes @ 0x0
	global	?_stop_AD_Converter
?_stop_AD_Converter:	; 0 bytes @ 0x0
	global	?_clearAdCompleteFalg
?_clearAdCompleteFalg:	; 0 bytes @ 0x0
	global	?_process_AD_Converter_Value
?_process_AD_Converter_Value:	; 0 bytes @ 0x0
	global	?_main
?_main:	; 0 bytes @ 0x0
	global	?_ISR
?_ISR:	; 0 bytes @ 0x0
	global	??_ISR
??_ISR:	; 0 bytes @ 0x0
	global	?_isAD_Completed
?_isAD_Completed:	; 1 bytes @ 0x0
	ds	2
	global	??_SetTempThermistorChannel
??_SetTempThermistorChannel:	; 0 bytes @ 0x2
	global	??_dac_init
??_dac_init:	; 0 bytes @ 0x2
	global	??_op1_init
??_op1_init:	; 0 bytes @ 0x2
	global	??_op2_init
??_op2_init:	; 0 bytes @ 0x2
	global	??_clock_config
??_clock_config:	; 0 bytes @ 0x2
	global	??_timer1_config
??_timer1_config:	; 0 bytes @ 0x2
	global	??_start_timer1
??_start_timer1:	; 0 bytes @ 0x2
	global	??_timer1_interrupt_config
??_timer1_interrupt_config:	; 0 bytes @ 0x2
	global	??_adConverter_config
??_adConverter_config:	; 0 bytes @ 0x2
	global	??_start_AD_Converter
??_start_AD_Converter:	; 0 bytes @ 0x2
	global	??_stop_AD_Converter
??_stop_AD_Converter:	; 0 bytes @ 0x2
	global	??_isAD_Completed
??_isAD_Completed:	; 0 bytes @ 0x2
	global	??_clearAdCompleteFalg
??_clearAdCompleteFalg:	; 0 bytes @ 0x2
	global	?_getAdValue
?_getAdValue:	; 2 bytes @ 0x2
	ds	2
	global	??_getAdValue
??_getAdValue:	; 0 bytes @ 0x4
	global	getAdValue@AdValue
getAdValue@AdValue:	; 2 bytes @ 0x4
	ds	2
	global	getAdValue@AdHighValue
getAdValue@AdHighValue:	; 2 bytes @ 0x6
	ds	2
	global	??_process_AD_Converter_Value
??_process_AD_Converter_Value:	; 0 bytes @ 0x8
	global	??_main
??_main:	; 0 bytes @ 0x8
psect	cstackBANK0,class=BANK0,space=1
global __pcstackBANK0
__pcstackBANK0:
	global	??_AD_Sample
??_AD_Sample:	; 0 bytes @ 0x0
	ds	2
;;Data sizes: Strings 0, constant 0, data 1, bss 29, persistent 0 stack 0
;;Auto spaces:   Size  Autos    Used
;; COMMON          14      8      12
;; BANK0           80      2      28
;; BANK1           80      0       0
;; BANK3           96      0       0
;; BANK2           96      0       0

;;
;; Pointer list with targets:

;; ?_getAdValue	unsigned int  size(1) Largest target is 0
;;


;;
;; Critical Paths under _main in COMMON
;;
;;   _AD_Sample->_getAdValue
;;
;; Critical Paths under _ISR in COMMON
;;
;;   None.
;;
;; Critical Paths under _main in BANK0
;;
;;   _process_AD_Converter_Value->_AD_Sample
;;
;; Critical Paths under _ISR in BANK0
;;
;;   None.
;;
;; Critical Paths under _main in BANK1
;;
;;   None.
;;
;; Critical Paths under _ISR in BANK1
;;
;;   None.
;;
;; Critical Paths under _main in BANK3
;;
;;   None.
;;
;; Critical Paths under _ISR in BANK3
;;
;;   None.
;;
;; Critical Paths under _main in BANK2
;;
;;   None.
;;
;; Critical Paths under _ISR in BANK2
;;
;;   None.

;;
;;Main: autosize = 0, tempsize = 0, incstack = 0, save=0
;;

;;
;;Call Graph Tables:
;;
;; ---------------------------------------------------------------------------------
;; (Depth) Function   	        Calls       Base Space   Used Autos Params    Refs
;; ---------------------------------------------------------------------------------
;; (0) _main                                                 0     0      0      50
;;                       _clock_config
;;            _timer1_interrupt_config
;;                      _timer1_config
;;                 _adConverter_config
;;                           _dac_init
;;                           _op1_init
;;                           _op2_init
;;                       _start_timer1
;;         _process_AD_Converter_Value
;; ---------------------------------------------------------------------------------
;; (1) _process_AD_Converter_Value                           0     0      0      50
;;                          _AD_Sample
;; ---------------------------------------------------------------------------------
;; (2) _AD_Sample                                            2     2      0      50
;;                                              0 BANK0      2     2      0
;;           _SetTempThermistorChannel
;;                 _start_AD_Converter
;;                     _isAD_Completed
;;                _clearAdCompleteFalg
;;                  _stop_AD_Converter
;;                         _getAdValue
;; ---------------------------------------------------------------------------------
;; (3) _getAdValue                                           6     4      2      50
;;                                              2 COMMON     6     4      2
;;                     _isAD_Completed
;; ---------------------------------------------------------------------------------
;; (1) _op2_init                                             0     0      0       0
;; ---------------------------------------------------------------------------------
;; (1) _op1_init                                             0     0      0       0
;; ---------------------------------------------------------------------------------
;; (1) _dac_init                                             0     0      0       0
;; ---------------------------------------------------------------------------------
;; (3) _SetTempThermistorChannel                             0     0      0       0
;; ---------------------------------------------------------------------------------
;; (3) _clearAdCompleteFalg                                  0     0      0       0
;; ---------------------------------------------------------------------------------
;; (4) _isAD_Completed                                       0     0      0       0
;; ---------------------------------------------------------------------------------
;; (3) _stop_AD_Converter                                    0     0      0       0
;; ---------------------------------------------------------------------------------
;; (3) _start_AD_Converter                                   0     0      0       0
;; ---------------------------------------------------------------------------------
;; (1) _adConverter_config                                   0     0      0       0
;; ---------------------------------------------------------------------------------
;; (1) _timer1_interrupt_config                              0     0      0       0
;; ---------------------------------------------------------------------------------
;; (1) _start_timer1                                         0     0      0       0
;; ---------------------------------------------------------------------------------
;; (1) _timer1_config                                        0     0      0       0
;; ---------------------------------------------------------------------------------
;; (1) _clock_config                                         0     0      0       0
;; ---------------------------------------------------------------------------------
;; Estimated maximum stack depth 4
;; ---------------------------------------------------------------------------------
;; (Depth) Function   	        Calls       Base Space   Used Autos Params    Refs
;; ---------------------------------------------------------------------------------
;; (5) _ISR                                                  2     2      0       0
;;                                              0 COMMON     2     2      0
;; ---------------------------------------------------------------------------------
;; Estimated maximum stack depth 5
;; ---------------------------------------------------------------------------------

;; Call Graph Graphs:

;; _main (ROOT)
;;   _clock_config
;;   _timer1_interrupt_config
;;   _timer1_config
;;   _adConverter_config
;;   _dac_init
;;   _op1_init
;;   _op2_init
;;   _start_timer1
;;   _process_AD_Converter_Value
;;     _AD_Sample
;;       _SetTempThermistorChannel
;;       _start_AD_Converter
;;       _isAD_Completed
;;       _clearAdCompleteFalg
;;       _stop_AD_Converter
;;       _getAdValue
;;         _isAD_Completed
;;
;; _ISR (ROOT)
;;

;; Address spaces:

;;Name               Size   Autos  Total    Cost      Usage
;;BANK3               60      0       0      10        0.0%
;;BITBANK3            60      0       0       9        0.0%
;;SFR3                 0      0       0       4        0.0%
;;BITSFR3              0      0       0       4        0.0%
;;BANK2               60      0       0      12        0.0%
;;BITBANK2            60      0       0      11        0.0%
;;SFR2                 0      0       0       5        0.0%
;;BITSFR2              0      0       0       5        0.0%
;;SFR1                 0      0       0       2        0.0%
;;BITSFR1              0      0       0       2        0.0%
;;BANK1               50      0       0       8        0.0%
;;BITBANK1            50      0       0       7        0.0%
;;CODE                 0      0       0       0        0.0%
;;DATA                 0      0      2C       6        0.0%
;;ABS                  0      0      28       3        0.0%
;;NULL                 0      0       0       0        0.0%
;;STACK                0      0       4       2        0.0%
;;BANK0               50      2      1C       5       35.0%
;;BITBANK0            50      0       0       4        0.0%
;;SFR0                 0      0       0       1        0.0%
;;BITSFR0              0      0       0       1        0.0%
;;COMMON               E      8       C       1       85.7%
;;BITCOMMON            E      0       0       0        0.0%

	global	_main
psect	maintext,global,class=CODE,delta=2
global __pmaintext
__pmaintext:

;; *************** function _main *****************
;; Defined at:
;;		line 83 in file "C:\dev\AK7030-OTP\main.c"
;; Parameters:    Size  Location     Type
;;		None
;; Auto vars:     Size  Location     Type
;;		None
;; Return value:  Size  Location     Type
;;		None               void
;; Registers used:
;;		wreg, fsr0l, fsr0h, status,2, status,0, pclath, cstack
;; Tracked objects:
;;		On entry : 17F/0
;;		On exit  : 60/0
;;		Unchanged: FFE00/0
;; Data sizes:     COMMON   BANK0   BANK1   BANK3   BANK2
;;      Params:         0       0       0       0       0
;;      Locals:         0       0       0       0       0
;;      Temps:          0       0       0       0       0
;;      Totals:         0       0       0       0       0
;;Total ram usage:        0 bytes
;; Hardware stack levels required when called:    5
;; This function calls:
;;		_clock_config
;;		_timer1_interrupt_config
;;		_timer1_config
;;		_adConverter_config
;;		_dac_init
;;		_op1_init
;;		_op2_init
;;		_start_timer1
;;		_process_AD_Converter_Value
;; This function is called by:
;;		Startup code after reset
;; This function uses a non-reentrant model
;;
psect	maintext
	file	"C:\dev\AK7030-OTP\main.c"
	line	83
	global	__size_of_main
	__size_of_main	equ	__end_of_main-_main
	
_main:	
	opt	stack 3
; Regs used in _main: [wreg-fsr0h+status,2+status,0+pclath+cstack]
	line	84
	
l2768:	
;main.c: 84: clock_config();
	fcall	_clock_config
	line	85
	
l2770:	
;main.c: 85: timer1_interrupt_config();
	fcall	_timer1_interrupt_config
	line	86
	
l2772:	
;main.c: 86: timer1_config();
	fcall	_timer1_config
	line	88
	
l2774:	
;main.c: 88: adConverter_config();
	fcall	_adConverter_config
	line	92
	
l2776:	
;main.c: 92: TRISB3=1;
	bsf	(1075/8)^080h,(1075)&7
	line	93
	
l2778:	
;main.c: 93: TRISB4=1;
	bsf	(1076/8)^080h,(1076)&7
	line	94
	
l2780:	
;main.c: 94: TRISB5=0;
	bcf	(1077/8)^080h,(1077)&7
	line	97
	
l2782:	
;main.c: 97: TRISA7=0;
	bcf	(1071/8)^080h,(1071)&7
	line	98
	
l2784:	
;main.c: 98: TRISB6=1;
	bsf	(1078/8)^080h,(1078)&7
	line	100
	
l2786:	
;main.c: 100: TRISA0 = 0;
	bcf	(1064/8)^080h,(1064)&7
	line	101
	
l2788:	
;main.c: 101: TRISA1 = 0;
	bcf	(1065/8)^080h,(1065)&7
	line	102
	
l2790:	
;main.c: 102: TRISA3 = 0;
	bcf	(1067/8)^080h,(1067)&7
	line	105
	
l2792:	
;main.c: 105: dac_init();
	fcall	_dac_init
	line	106
	
l2794:	
;main.c: 106: op1_init();
	fcall	_op1_init
	line	107
	
l2796:	
;main.c: 107: op2_init();
	fcall	_op2_init
	line	109
;main.c: 109: start_timer1();
	fcall	_start_timer1
	line	112
	
l2798:	
# 112 "C:\dev\AK7030-OTP\main.c"
 clrwdt ;#
psect	maintext
	line	113
	
l2800:	
;main.c: 113: if(timer10msCnt >= 5 )
	movlw	(05h)
	subwf	(_timer10msCnt),w
	skipc
	goto	u471
	goto	u470
u471:
	goto	l2798
u470:
	line	115
	
l2802:	
;main.c: 114: {
;main.c: 115: timer10msCnt = 0;
	clrf	(_timer10msCnt)
	line	116
	
l2804:	
;main.c: 116: process_AD_Converter_Value();
	fcall	_process_AD_Converter_Value
	goto	l2798
	global	start
	ljmp	start
	opt stack 0
psect	maintext
	line	119
GLOBAL	__end_of_main
	__end_of_main:
;; =============== function _main ends ============

	signat	_main,88
	global	_process_AD_Converter_Value
psect	text561,local,class=CODE,delta=2
global __ptext561
__ptext561:

;; *************** function _process_AD_Converter_Value *****************
;; Defined at:
;;		line 100 in file "C:\dev\AK7030-OTP\common.c"
;; Parameters:    Size  Location     Type
;;		None
;; Auto vars:     Size  Location     Type
;;		None
;; Return value:  Size  Location     Type
;;		None               void
;; Registers used:
;;		wreg, fsr0l, fsr0h, status,2, status,0, pclath, cstack
;; Tracked objects:
;;		On entry : 0/0
;;		On exit  : 60/0
;;		Unchanged: FFE9F/0
;; Data sizes:     COMMON   BANK0   BANK1   BANK3   BANK2
;;      Params:         0       0       0       0       0
;;      Locals:         0       0       0       0       0
;;      Temps:          0       0       0       0       0
;;      Totals:         0       0       0       0       0
;;Total ram usage:        0 bytes
;; Hardware stack levels used:    1
;; Hardware stack levels required when called:    4
;; This function calls:
;;		_AD_Sample
;; This function is called by:
;;		_main
;; This function uses a non-reentrant model
;;
psect	text561
	file	"C:\dev\AK7030-OTP\common.c"
	line	100
	global	__size_of_process_AD_Converter_Value
	__size_of_process_AD_Converter_Value	equ	__end_of_process_AD_Converter_Value-_process_AD_Converter_Value
	
_process_AD_Converter_Value:	
	opt	stack 3
; Regs used in _process_AD_Converter_Value: [wreg-fsr0h+status,2+status,0+pclath+cstack]
	line	101
	
l2766:	
;common.c: 101: AD_Sample();
	fcall	_AD_Sample
	line	102
	
l683:	
	return
	opt stack 0
GLOBAL	__end_of_process_AD_Converter_Value
	__end_of_process_AD_Converter_Value:
;; =============== function _process_AD_Converter_Value ends ============

	signat	_process_AD_Converter_Value,88
	global	_AD_Sample
psect	text562,local,class=CODE,delta=2
global __ptext562
__ptext562:

;; *************** function _AD_Sample *****************
;; Defined at:
;;		line 114 in file "C:\dev\AK7030-OTP\common.c"
;; Parameters:    Size  Location     Type
;;		None
;; Auto vars:     Size  Location     Type
;;		None
;; Return value:  Size  Location     Type
;;		None               void
;; Registers used:
;;		wreg, fsr0l, fsr0h, status,2, status,0, pclath, cstack
;; Tracked objects:
;;		On entry : 0/0
;;		On exit  : 60/0
;;		Unchanged: FFE9F/0
;; Data sizes:     COMMON   BANK0   BANK1   BANK3   BANK2
;;      Params:         0       0       0       0       0
;;      Locals:         0       0       0       0       0
;;      Temps:          0       2       0       0       0
;;      Totals:         0       2       0       0       0
;;Total ram usage:        2 bytes
;; Hardware stack levels used:    1
;; Hardware stack levels required when called:    3
;; This function calls:
;;		_SetTempThermistorChannel
;;		_start_AD_Converter
;;		_isAD_Completed
;;		_clearAdCompleteFalg
;;		_stop_AD_Converter
;;		_getAdValue
;; This function is called by:
;;		_process_AD_Converter_Value
;; This function uses a non-reentrant model
;;
psect	text562
	file	"C:\dev\AK7030-OTP\common.c"
	line	114
	global	__size_of_AD_Sample
	__size_of_AD_Sample	equ	__end_of_AD_Sample-_AD_Sample
	
_AD_Sample:	
	opt	stack 3
; Regs used in _AD_Sample: [wreg-fsr0h+status,2+status,0+pclath+cstack]
	line	115
	
l2702:	
;common.c: 115: if(sampleTimes == 0)
	movf	(_sampleTimes),f
	skipz
	goto	u361
	goto	u360
u361:
	goto	l686
u360:
	line	117
	
l2704:	
;common.c: 116: {
;common.c: 117: SetTempThermistorChannel();
	fcall	_SetTempThermistorChannel
	line	118
	
l2706:	
;common.c: 118: multiFilterMaxValue = 0;
	clrf	(_multiFilterMaxValue)
	clrf	(_multiFilterMaxValue+1)
	line	119
	
l2708:	
;common.c: 120: multiFilterSumValue = 0;
	clrf	(_multiFilterMinValue)
	clrf	(_multiFilterMinValue+1)
	line	121
	
l2710:	
;common.c: 121: sampleCount = 1;
	clrf	(_sampleCount)
	incf	(_sampleCount),f
	line	122
	
l2712:	
;common.c: 122: start_AD_Converter();
	fcall	_start_AD_Converter
	line	123
	
l686:	
	line	125
;common.c: 123: }
;common.c: 125: if(sampleTimes < 10)
	movlw	(0Ah)
	subwf	(_sampleTimes),w
	skipnc
	goto	u371
	goto	u370
u371:
	goto	l2750
u370:
	goto	l2726
	line	129
	
l2716:	
;common.c: 128: {
;common.c: 129: if(sampleCount <= 10)
	movlw	(0Bh)
	subwf	(_sampleCount),w
	skipnc
	goto	u381
	goto	u380
u381:
	goto	l2724
u380:
	line	131
	
l2718:	
;common.c: 130: {
;common.c: 131: sampleCount ++;
	incf	(_sampleCount),f
	line	132
	
l2720:	
;common.c: 132: if(isAD_Completed())
	fcall	_isAD_Completed
	xorlw	0
	skipnz
	goto	u391
	goto	u390
u391:
	goto	l2726
u390:
	line	134
	
l2722:	
;common.c: 133: {
;common.c: 134: clearAdCompleteFalg();
	fcall	_clearAdCompleteFalg
	line	135
;common.c: 135: stop_AD_Converter();
	fcall	_stop_AD_Converter
	line	136
;common.c: 136: break;
	goto	l2728
	line	141
	
l2724:	
;common.c: 139: else
;common.c: 140: {
;common.c: 141: sampleCount = 0;
	clrf	(_sampleCount)
	line	142
;common.c: 142: sampleTimes = 0;
	clrf	(_sampleTimes)
	line	143
;common.c: 143: break;
	goto	l2728
	line	127
	
l2726:	
	fcall	_isAD_Completed
	xorlw	0
	skipnz
	goto	u401
	goto	u400
u401:
	goto	l2716
u400:
	line	147
	
l2728:	
;common.c: 144: }
;common.c: 145: }
;common.c: 147: if(sampleCount != 0)
	movf	(_sampleCount),w
	skipz
	goto	u410
	goto	l2732
u410:
	line	149
	
l2730:	
;common.c: 148: {
;common.c: 149: buffer_Sample_AD_Value[sampleTimes] = getAdValue();
	fcall	_getAdValue
	clrc
	rlf	(_sampleTimes),w
	addlw	_buffer_Sample_AD_Value&0ffh
	movwf	fsr0
	movf	(0+(?_getAdValue)),w
	bcf	status, 7	;select IRP bank0
	movwf	indf
	incf	fsr0,f
	movf	(1+(?_getAdValue)),w
	movwf	indf
	line	150
;common.c: 150: }
	goto	l2734
	line	153
	
l2732:	
;common.c: 151: else
;common.c: 152: {
;common.c: 153: buffer_Sample_AD_Value[sampleTimes] = 2048;
	clrc
	rlf	(_sampleTimes),w
	addlw	_buffer_Sample_AD_Value&0ffh
	movwf	fsr0
	movlw	low(0800h)
	bcf	status, 7	;select IRP bank0
	movwf	indf
	incf	fsr0,f
	movlw	high(0800h)
	movwf	indf
	line	156
	
l2734:	
;common.c: 154: }
;common.c: 156: if(sampleTimes == 0)
	movf	(_sampleTimes),f
	skipz
	goto	u421
	goto	u420
u421:
	goto	l2738
u420:
	line	158
	
l2736:	
;common.c: 157: {
;common.c: 158: multiFilterMaxValue = buffer_Sample_AD_Value[0];
	movf	(_buffer_Sample_AD_Value+1),w
	movwf	(_multiFilterMaxValue+1)
	movf	(_buffer_Sample_AD_Value),w
	movwf	(_multiFilterMaxValue)
	line	159
;common.c: 159: multiFilterMinValue = buffer_Sample_AD_Value[0];
	movf	(_buffer_Sample_AD_Value+1),w
	movwf	(_multiFilterMinValue+1)
	movf	(_buffer_Sample_AD_Value),w
	movwf	(_multiFilterMinValue)
	line	161
	
l2738:	
;common.c: 160: }
;common.c: 161: if(multiFilterMaxValue < buffer_Sample_AD_Value[sampleTimes])
	clrc
	rlf	(_sampleTimes),w
	addlw	_buffer_Sample_AD_Value&0ffh
	movwf	fsr0
	movf	indf,w
	movwf	(??_AD_Sample+0)+0+0
	incf	fsr0,f
	movf	indf,w
	movwf	(??_AD_Sample+0)+0+1
	movf	1+(??_AD_Sample+0)+0,w
	subwf	(_multiFilterMaxValue+1),w
	skipz
	goto	u435
	movf	0+(??_AD_Sample+0)+0,w
	subwf	(_multiFilterMaxValue),w
u435:
	skipnc
	goto	u431
	goto	u430
u431:
	goto	l697
u430:
	line	163
	
l2740:	
;common.c: 162: {
;common.c: 163: multiFilterMaxValue = buffer_Sample_AD_Value[sampleTimes];
	clrc
	rlf	(_sampleTimes),w
	addlw	_buffer_Sample_AD_Value&0ffh
	movwf	fsr0
	movf	indf,w
	movwf	(_multiFilterMaxValue)
	incf	fsr0,f
	movf	indf,w
	movwf	(_multiFilterMaxValue+1)
	line	164
	
l697:	
	line	165
;common.c: 164: }
;common.c: 165: if(multiFilterMinValue > buffer_Sample_AD_Value[sampleTimes])
	clrc
	rlf	(_sampleTimes),w
	addlw	_buffer_Sample_AD_Value&0ffh
	movwf	fsr0
	movf	indf,w
	movwf	(??_AD_Sample+0)+0+0
	incf	fsr0,f
	movf	indf,w
	movwf	(??_AD_Sample+0)+0+1
	movf	(_multiFilterMinValue+1),w
	subwf	1+(??_AD_Sample+0)+0,w
	skipz
	goto	u445
	movf	(_multiFilterMinValue),w
	subwf	0+(??_AD_Sample+0)+0,w
u445:
	skipnc
	goto	u441
	goto	u440
u441:
	goto	l2744
u440:
	line	167
	
l2742:	
;common.c: 166: {
;common.c: 167: multiFilterMinValue = buffer_Sample_AD_Value[sampleTimes];
	clrc
	rlf	(_sampleTimes),w
	addlw	_buffer_Sample_AD_Value&0ffh
	movwf	fsr0
	movf	indf,w
	movwf	(_multiFilterMinValue)
	incf	fsr0,f
	movf	indf,w
	movwf	(_multiFilterMinValue+1)
	line	171
	
l2744:	
;common.c: 171: sampleTimes++;
	incf	(_sampleTimes),f
	line	173
	
l2746:	
;common.c: 173: if(sampleTimes < 10)
	movlw	(0Ah)
	subwf	(_sampleTimes),w
	skipnc
	goto	u451
	goto	u450
u451:
	goto	l706
u450:
	line	175
	
l2748:	
;common.c: 174: {
;common.c: 175: start_AD_Converter();
	fcall	_start_AD_Converter
	goto	l706
	line	180
	
l2750:	
;common.c: 178: else
;common.c: 179: {
;common.c: 180: sampleTimes = 0;
	clrf	(_sampleTimes)
	line	182
	
l2752:	
;common.c: 182: stop_AD_Converter();
	fcall	_stop_AD_Converter
	line	195
	
l2760:	
;common.c: 192: }
;common.c: 195: if(sampleChannelSelect == 13)
	movf	(_sampleChannelSelect),w
	xorlw	0Dh
	skipz
	goto	u461
	goto	u460
u461:
	goto	l2764
u460:
	line	197
	
l2762:	
;common.c: 196: {
;common.c: 197: sampleChannelSelect = 12;
	movlw	(0Ch)
	movwf	(_sampleChannelSelect)
	line	198
;common.c: 198: }
	goto	l706
	line	201
	
l2764:	
;common.c: 199: else
;common.c: 200: {
;common.c: 201: sampleChannelSelect = 13;
	movlw	(0Dh)
	movwf	(_sampleChannelSelect)
	line	204
	
l706:	
	return
	opt stack 0
GLOBAL	__end_of_AD_Sample
	__end_of_AD_Sample:
;; =============== function _AD_Sample ends ============

	signat	_AD_Sample,88
	global	_getAdValue
psect	text563,local,class=CODE,delta=2
global __ptext563
__ptext563:

;; *************** function _getAdValue *****************
;; Defined at:
;;		line 85 in file "C:\dev\AK7030-OTP\common.c"
;; Parameters:    Size  Location     Type
;;		None
;; Auto vars:     Size  Location     Type
;;  AdHighValue     2    6[COMMON] unsigned int 
;;  AdValue         2    4[COMMON] unsigned int 
;; Return value:  Size  Location     Type
;;                  2    2[COMMON] unsigned int 
;; Registers used:
;;		wreg, status,2, pclath, cstack
;; Tracked objects:
;;		On entry : 0/0
;;		On exit  : 60/0
;;		Unchanged: FFF9F/0
;; Data sizes:     COMMON   BANK0   BANK1   BANK3   BANK2
;;      Params:         2       0       0       0       0
;;      Locals:         4       0       0       0       0
;;      Temps:          0       0       0       0       0
;;      Totals:         6       0       0       0       0
;;Total ram usage:        6 bytes
;; Hardware stack levels used:    1
;; Hardware stack levels required when called:    2
;; This function calls:
;;		_isAD_Completed
;; This function is called by:
;;		_AD_Sample
;; This function uses a non-reentrant model
;;
psect	text563
	file	"C:\dev\AK7030-OTP\common.c"
	line	85
	global	__size_of_getAdValue
	__size_of_getAdValue	equ	__end_of_getAdValue-_getAdValue
	
_getAdValue:	
	opt	stack 3
; Regs used in _getAdValue: [wreg+status,2+pclath+cstack]
	line	86
	
l2588:	
;common.c: 86: unsigned int AdValue = 0,AdHighValue = 0;
	clrf	(getAdValue@AdValue)
	clrf	(getAdValue@AdValue+1)
	line	87
	
l2590:	
;common.c: 87: if(isAD_Completed()!=0)
	fcall	_isAD_Completed
	xorlw	0
	skipnz
	goto	u231
	goto	u230
u231:
	goto	l679
u230:
	line	89
	
l2592:	
;common.c: 88: {
;common.c: 89: ADIF = 0;
	bcf	(106/8),(106)&7
	line	90
	
l2594:	
;common.c: 90: AdValue = ADRESL;
	bsf	status, 5	;RP0=1, select bank1
	movf	(158)^080h,w	;volatile
	movwf	(getAdValue@AdValue)
	clrf	(getAdValue@AdValue+1)
	line	91
;common.c: 91: AdHighValue = ADRESH;
	bcf	status, 5	;RP0=0, select bank0
	movf	(30),w	;volatile
	movwf	(getAdValue@AdHighValue)
	clrf	(getAdValue@AdHighValue+1)
	line	92
;common.c: 92: AdHighValue = AdHighValue << 8;
	movf	(getAdValue@AdHighValue),w
	movwf	(getAdValue@AdHighValue+1)
	clrf	(getAdValue@AdHighValue)
	line	93
;common.c: 93: AdValue = AdValue | AdHighValue;
	movf	(getAdValue@AdHighValue),w
	iorwf	(getAdValue@AdValue),f
	movf	(getAdValue@AdHighValue+1),w
	iorwf	(getAdValue@AdValue+1),f
	line	94
	
l679:	
	line	96
;common.c: 94: }
;common.c: 96: return AdValue;
	movf	(getAdValue@AdValue+1),w
	movwf	(?_getAdValue+1)
	movf	(getAdValue@AdValue),w
	movwf	(?_getAdValue)
	line	97
	
l680:	
	return
	opt stack 0
GLOBAL	__end_of_getAdValue
	__end_of_getAdValue:
;; =============== function _getAdValue ends ============

	signat	_getAdValue,90
	global	_op2_init
psect	text564,local,class=CODE,delta=2
global __ptext564
__ptext564:

;; *************** function _op2_init *****************
;; Defined at:
;;		line 40 in file "C:\dev\AK7030-OTP\periph.c"
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
;; Hardware stack levels required when called:    1
;; This function calls:
;;		Nothing
;; This function is called by:
;;		_main
;; This function uses a non-reentrant model
;;
psect	text564
	file	"C:\dev\AK7030-OTP\periph.c"
	line	40
	global	__size_of_op2_init
	__size_of_op2_init	equ	__end_of_op2_init-_op2_init
	
_op2_init:	
	opt	stack 6
; Regs used in _op2_init: [wreg]
	line	47
	
l2426:	
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
	
l2004:	
	return
	opt stack 0
GLOBAL	__end_of_op2_init
	__end_of_op2_init:
;; =============== function _op2_init ends ============

	signat	_op2_init,88
	global	_op1_init
psect	text565,local,class=CODE,delta=2
global __ptext565
__ptext565:

;; *************** function _op1_init *****************
;; Defined at:
;;		line 26 in file "C:\dev\AK7030-OTP\periph.c"
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
;; Hardware stack levels required when called:    1
;; This function calls:
;;		Nothing
;; This function is called by:
;;		_main
;; This function uses a non-reentrant model
;;
psect	text565
	file	"C:\dev\AK7030-OTP\periph.c"
	line	26
	global	__size_of_op1_init
	__size_of_op1_init	equ	__end_of_op1_init-_op1_init
	
_op1_init:	
	opt	stack 6
; Regs used in _op1_init: [wreg]
	line	33
	
l2424:	
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
	
l2001:	
	return
	opt stack 0
GLOBAL	__end_of_op1_init
	__end_of_op1_init:
;; =============== function _op1_init ends ============

	signat	_op1_init,88
	global	_dac_init
psect	text566,local,class=CODE,delta=2
global __ptext566
__ptext566:

;; *************** function _dac_init *****************
;; Defined at:
;;		line 14 in file "C:\dev\AK7030-OTP\periph.c"
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
;; Hardware stack levels required when called:    1
;; This function calls:
;;		Nothing
;; This function is called by:
;;		_main
;; This function uses a non-reentrant model
;;
psect	text566
	file	"C:\dev\AK7030-OTP\periph.c"
	line	14
	global	__size_of_dac_init
	__size_of_dac_init	equ	__end_of_dac_init-_dac_init
	
_dac_init:	
	opt	stack 6
; Regs used in _dac_init: [wreg]
	line	15
	
l2416:	
;periph.c: 15: DACCON|=2;
	bsf	(135)^080h+(1/8),(1)&7	;volatile
	line	17
	
l2418:	
;periph.c: 17: DACR0=0x19;
	movlw	(019h)
	movwf	(136)^080h	;volatile
	line	18
	
l2420:	
;periph.c: 18: DACCON|=(1)<<2;
	bsf	(135)^080h+(2/8),(2)&7	;volatile
	line	20
;periph.c: 20: DACR1=0x06;
	movlw	(06h)
	movwf	(137)^080h	;volatile
	line	21
	
l2422:	
;periph.c: 21: DACCON|=(1)<<3;
	bsf	(135)^080h+(3/8),(3)&7	;volatile
	line	22
	
l1998:	
	return
	opt stack 0
GLOBAL	__end_of_dac_init
	__end_of_dac_init:
;; =============== function _dac_init ends ============

	signat	_dac_init,88
	global	_SetTempThermistorChannel
psect	text567,local,class=CODE,delta=2
global __ptext567
__ptext567:

;; *************** function _SetTempThermistorChannel *****************
;; Defined at:
;;		line 217 in file "C:\dev\AK7030-OTP\common.c"
;; Parameters:    Size  Location     Type
;;		None
;; Auto vars:     Size  Location     Type
;;		None
;; Return value:  Size  Location     Type
;;		None               void
;; Registers used:
;;		wreg
;; Tracked objects:
;;		On entry : 0/0
;;		On exit  : 60/0
;;		Unchanged: FFF9F/0
;; Data sizes:     COMMON   BANK0   BANK1   BANK3   BANK2
;;      Params:         0       0       0       0       0
;;      Locals:         0       0       0       0       0
;;      Temps:          0       0       0       0       0
;;      Totals:         0       0       0       0       0
;;Total ram usage:        0 bytes
;; Hardware stack levels used:    1
;; Hardware stack levels required when called:    1
;; This function calls:
;;		Nothing
;; This function is called by:
;;		_AD_Sample
;; This function uses a non-reentrant model
;;
psect	text567
	file	"C:\dev\AK7030-OTP\common.c"
	line	217
	global	__size_of_SetTempThermistorChannel
	__size_of_SetTempThermistorChannel	equ	__end_of_SetTempThermistorChannel-_SetTempThermistorChannel
	
_SetTempThermistorChannel:	
	opt	stack 4
; Regs used in _SetTempThermistorChannel: [wreg]
	line	220
	
l2572:	
;common.c: 220: if(sampleChannelSelect == 12)
	movf	(_sampleChannelSelect),w
	xorlw	0Ch
	skipz
	goto	u201
	goto	u200
u201:
	goto	l709
u200:
	line	222
	
l2574:	
;common.c: 221: {
;common.c: 222: CHS3 = 1;
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	bsf	(253/8),(253)&7
	line	223
;common.c: 223: CHS2 = 1;
	bsf	(252/8),(252)&7
	line	224
;common.c: 224: CHS1 = 0;
	bcf	(251/8),(251)&7
	line	225
;common.c: 225: CHS0 = 0;
	bcf	(250/8),(250)&7
	line	226
;common.c: 226: }
	goto	l711
	line	227
	
l709:	
	line	229
;common.c: 227: else
;common.c: 228: {
;common.c: 229: CHS3 = 1;
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	bsf	(253/8),(253)&7
	line	230
;common.c: 230: CHS2 = 1;
	bsf	(252/8),(252)&7
	line	231
;common.c: 231: CHS1 = 0;
	bcf	(251/8),(251)&7
	line	232
;common.c: 232: CHS0 = 1;
	bsf	(250/8),(250)&7
	line	235
	
l711:	
	return
	opt stack 0
GLOBAL	__end_of_SetTempThermistorChannel
	__end_of_SetTempThermistorChannel:
;; =============== function _SetTempThermistorChannel ends ============

	signat	_SetTempThermistorChannel,88
	global	_clearAdCompleteFalg
psect	text568,local,class=CODE,delta=2
global __ptext568
__ptext568:

;; *************** function _clearAdCompleteFalg *****************
;; Defined at:
;;		line 80 in file "C:\dev\AK7030-OTP\common.c"
;; Parameters:    Size  Location     Type
;;		None
;; Auto vars:     Size  Location     Type
;;		None
;; Return value:  Size  Location     Type
;;		None               void
;; Registers used:
;;		None
;; Tracked objects:
;;		On entry : 60/0
;;		On exit  : 60/0
;;		Unchanged: FFF9F/0
;; Data sizes:     COMMON   BANK0   BANK1   BANK3   BANK2
;;      Params:         0       0       0       0       0
;;      Locals:         0       0       0       0       0
;;      Temps:          0       0       0       0       0
;;      Totals:         0       0       0       0       0
;;Total ram usage:        0 bytes
;; Hardware stack levels used:    1
;; Hardware stack levels required when called:    1
;; This function calls:
;;		Nothing
;; This function is called by:
;;		_AD_Sample
;; This function uses a non-reentrant model
;;
psect	text568
	file	"C:\dev\AK7030-OTP\common.c"
	line	80
	global	__size_of_clearAdCompleteFalg
	__size_of_clearAdCompleteFalg	equ	__end_of_clearAdCompleteFalg-_clearAdCompleteFalg
	
_clearAdCompleteFalg:	
	opt	stack 4
; Regs used in _clearAdCompleteFalg: []
	line	81
	
l2570:	
;common.c: 81: ADIF = 0;
	bcf	(106/8),(106)&7
	line	82
	
l676:	
	return
	opt stack 0
GLOBAL	__end_of_clearAdCompleteFalg
	__end_of_clearAdCompleteFalg:
;; =============== function _clearAdCompleteFalg ends ============

	signat	_clearAdCompleteFalg,88
	global	_isAD_Completed
psect	text569,local,class=CODE,delta=2
global __ptext569
__ptext569:

;; *************** function _isAD_Completed *****************
;; Defined at:
;;		line 72 in file "C:\dev\AK7030-OTP\common.c"
;; Parameters:    Size  Location     Type
;;		None
;; Auto vars:     Size  Location     Type
;;		None
;; Return value:  Size  Location     Type
;;                  1    wreg      unsigned char 
;; Registers used:
;;		wreg
;; Tracked objects:
;;		On entry : 0/0
;;		On exit  : 60/0
;;		Unchanged: FFF9F/0
;; Data sizes:     COMMON   BANK0   BANK1   BANK3   BANK2
;;      Params:         0       0       0       0       0
;;      Locals:         0       0       0       0       0
;;      Temps:          0       0       0       0       0
;;      Totals:         0       0       0       0       0
;;Total ram usage:        0 bytes
;; Hardware stack levels used:    1
;; Hardware stack levels required when called:    1
;; This function calls:
;;		Nothing
;; This function is called by:
;;		_getAdValue
;;		_AD_Sample
;; This function uses a non-reentrant model
;;
psect	text569
	file	"C:\dev\AK7030-OTP\common.c"
	line	72
	global	__size_of_isAD_Completed
	__size_of_isAD_Completed	equ	__end_of_isAD_Completed-_isAD_Completed
	
_isAD_Completed:	
	opt	stack 3
; Regs used in _isAD_Completed: [wreg]
	line	73
	
l2558:	
;common.c: 73: if(ADIF)
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	btfss	(106/8),(106)&7
	goto	u191
	goto	u190
u191:
	goto	l2566
u190:
	line	74
	
l2560:	
;common.c: 74: return 1;
	movlw	(01h)
	goto	l672
	line	76
	
l2566:	
;common.c: 75: else
;common.c: 76: return 0;
	movlw	(0)
	line	77
	
l672:	
	return
	opt stack 0
GLOBAL	__end_of_isAD_Completed
	__end_of_isAD_Completed:
;; =============== function _isAD_Completed ends ============

	signat	_isAD_Completed,89
	global	_stop_AD_Converter
psect	text570,local,class=CODE,delta=2
global __ptext570
__ptext570:

;; *************** function _stop_AD_Converter *****************
;; Defined at:
;;		line 67 in file "C:\dev\AK7030-OTP\common.c"
;; Parameters:    Size  Location     Type
;;		None
;; Auto vars:     Size  Location     Type
;;		None
;; Return value:  Size  Location     Type
;;		None               void
;; Registers used:
;;		None
;; Tracked objects:
;;		On entry : 0/0
;;		On exit  : 60/0
;;		Unchanged: FFF9F/0
;; Data sizes:     COMMON   BANK0   BANK1   BANK3   BANK2
;;      Params:         0       0       0       0       0
;;      Locals:         0       0       0       0       0
;;      Temps:          0       0       0       0       0
;;      Totals:         0       0       0       0       0
;;Total ram usage:        0 bytes
;; Hardware stack levels used:    1
;; Hardware stack levels required when called:    1
;; This function calls:
;;		Nothing
;; This function is called by:
;;		_AD_Sample
;; This function uses a non-reentrant model
;;
psect	text570
	file	"C:\dev\AK7030-OTP\common.c"
	line	67
	global	__size_of_stop_AD_Converter
	__size_of_stop_AD_Converter	equ	__end_of_stop_AD_Converter-_stop_AD_Converter
	
_stop_AD_Converter:	
	opt	stack 4
; Regs used in _stop_AD_Converter: []
	line	68
	
l2556:	
;common.c: 68: ADON = 0;
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	bcf	(248/8),(248)&7
	line	69
	
l668:	
	return
	opt stack 0
GLOBAL	__end_of_stop_AD_Converter
	__end_of_stop_AD_Converter:
;; =============== function _stop_AD_Converter ends ============

	signat	_stop_AD_Converter,88
	global	_start_AD_Converter
psect	text571,local,class=CODE,delta=2
global __ptext571
__ptext571:

;; *************** function _start_AD_Converter *****************
;; Defined at:
;;		line 62 in file "C:\dev\AK7030-OTP\common.c"
;; Parameters:    Size  Location     Type
;;		None
;; Auto vars:     Size  Location     Type
;;		None
;; Return value:  Size  Location     Type
;;		None               void
;; Registers used:
;;		None
;; Tracked objects:
;;		On entry : 60/0
;;		On exit  : 60/0
;;		Unchanged: FFF9F/0
;; Data sizes:     COMMON   BANK0   BANK1   BANK3   BANK2
;;      Params:         0       0       0       0       0
;;      Locals:         0       0       0       0       0
;;      Temps:          0       0       0       0       0
;;      Totals:         0       0       0       0       0
;;Total ram usage:        0 bytes
;; Hardware stack levels used:    1
;; Hardware stack levels required when called:    1
;; This function calls:
;;		Nothing
;; This function is called by:
;;		_AD_Sample
;; This function uses a non-reentrant model
;;
psect	text571
	file	"C:\dev\AK7030-OTP\common.c"
	line	62
	global	__size_of_start_AD_Converter
	__size_of_start_AD_Converter	equ	__end_of_start_AD_Converter-_start_AD_Converter
	
_start_AD_Converter:	
	opt	stack 4
; Regs used in _start_AD_Converter: []
	line	63
	
l2554:	
;common.c: 63: ADON = 1;
	bsf	(248/8),(248)&7
	line	64
	
l665:	
	return
	opt stack 0
GLOBAL	__end_of_start_AD_Converter
	__end_of_start_AD_Converter:
;; =============== function _start_AD_Converter ends ============

	signat	_start_AD_Converter,88
	global	_adConverter_config
psect	text572,local,class=CODE,delta=2
global __ptext572
__ptext572:

;; *************** function _adConverter_config *****************
;; Defined at:
;;		line 52 in file "C:\dev\AK7030-OTP\common.c"
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
;; Hardware stack levels required when called:    1
;; This function calls:
;;		Nothing
;; This function is called by:
;;		_main
;; This function uses a non-reentrant model
;;
psect	text572
	file	"C:\dev\AK7030-OTP\common.c"
	line	52
	global	__size_of_adConverter_config
	__size_of_adConverter_config	equ	__end_of_adConverter_config-_adConverter_config
	
_adConverter_config:	
	opt	stack 6
; Regs used in _adConverter_config: [wreg]
	line	53
	
l2388:	
;common.c: 53: TRISB0 = 1;
	bsf	status, 5	;RP0=1, select bank1
	bsf	(1072/8)^080h,(1072)&7
	line	54
;common.c: 54: TRISB2 = 1;
	bsf	(1074/8)^080h,(1074)&7
	line	55
	
l2390:	
;common.c: 55: ADCON0 = 0xC4;
	movlw	(0C4h)
	bcf	status, 5	;RP0=0, select bank0
	movwf	(31)	;volatile
	line	56
;common.c: 56: ADCON1 = 0xFE;
	movlw	(0FEh)
	bsf	status, 5	;RP0=1, select bank1
	movwf	(159)^080h	;volatile
	line	57
	
l2392:	
;common.c: 57: ADIE = 0;
	bcf	(1130/8)^080h,(1130)&7
	line	58
	
l662:	
	return
	opt stack 0
GLOBAL	__end_of_adConverter_config
	__end_of_adConverter_config:
;; =============== function _adConverter_config ends ============

	signat	_adConverter_config,88
	global	_timer1_interrupt_config
psect	text573,local,class=CODE,delta=2
global __ptext573
__ptext573:

;; *************** function _timer1_interrupt_config *****************
;; Defined at:
;;		line 45 in file "C:\dev\AK7030-OTP\common.c"
;; Parameters:    Size  Location     Type
;;		None
;; Auto vars:     Size  Location     Type
;;		None
;; Return value:  Size  Location     Type
;;		None               void
;; Registers used:
;;		None
;; Tracked objects:
;;		On entry : 17F/40
;;		On exit  : 17F/20
;;		Unchanged: FFE80/0
;; Data sizes:     COMMON   BANK0   BANK1   BANK3   BANK2
;;      Params:         0       0       0       0       0
;;      Locals:         0       0       0       0       0
;;      Temps:          0       0       0       0       0
;;      Totals:         0       0       0       0       0
;;Total ram usage:        0 bytes
;; Hardware stack levels used:    1
;; Hardware stack levels required when called:    1
;; This function calls:
;;		Nothing
;; This function is called by:
;;		_main
;; This function uses a non-reentrant model
;;
psect	text573
	file	"C:\dev\AK7030-OTP\common.c"
	line	45
	global	__size_of_timer1_interrupt_config
	__size_of_timer1_interrupt_config	equ	__end_of_timer1_interrupt_config-_timer1_interrupt_config
	
_timer1_interrupt_config:	
	opt	stack 6
; Regs used in _timer1_interrupt_config: []
	line	46
	
l2386:	
;common.c: 46: GIE = 1;
	bsf	(95/8),(95)&7
	line	47
;common.c: 47: PEIE = 1;
	bsf	(94/8),(94)&7
	line	48
;common.c: 48: TMR1IE = 1;
	bsf	status, 5	;RP0=1, select bank1
	bcf	status, 6	;RP1=0, select bank1
	bsf	(1120/8)^080h,(1120)&7
	line	49
	
l659:	
	return
	opt stack 0
GLOBAL	__end_of_timer1_interrupt_config
	__end_of_timer1_interrupt_config:
;; =============== function _timer1_interrupt_config ends ============

	signat	_timer1_interrupt_config,88
	global	_start_timer1
psect	text574,local,class=CODE,delta=2
global __ptext574
__ptext574:

;; *************** function _start_timer1 *****************
;; Defined at:
;;		line 40 in file "C:\dev\AK7030-OTP\common.c"
;; Parameters:    Size  Location     Type
;;		None
;; Auto vars:     Size  Location     Type
;;		None
;; Return value:  Size  Location     Type
;;		None               void
;; Registers used:
;;		None
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
;; Hardware stack levels required when called:    1
;; This function calls:
;;		Nothing
;; This function is called by:
;;		_main
;; This function uses a non-reentrant model
;;
psect	text574
	file	"C:\dev\AK7030-OTP\common.c"
	line	40
	global	__size_of_start_timer1
	__size_of_start_timer1	equ	__end_of_start_timer1-_start_timer1
	
_start_timer1:	
	opt	stack 6
; Regs used in _start_timer1: []
	line	41
	
l2384:	
;common.c: 41: TMR1ON = 1;
	bcf	status, 5	;RP0=0, select bank0
	bsf	(128/8),(128)&7
	line	42
	
l656:	
	return
	opt stack 0
GLOBAL	__end_of_start_timer1
	__end_of_start_timer1:
;; =============== function _start_timer1 ends ============

	signat	_start_timer1,88
	global	_timer1_config
psect	text575,local,class=CODE,delta=2
global __ptext575
__ptext575:

;; *************** function _timer1_config *****************
;; Defined at:
;;		line 32 in file "C:\dev\AK7030-OTP\common.c"
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
;; Hardware stack levels required when called:    1
;; This function calls:
;;		Nothing
;; This function is called by:
;;		_main
;; This function uses a non-reentrant model
;;
psect	text575
	file	"C:\dev\AK7030-OTP\common.c"
	line	32
	global	__size_of_timer1_config
	__size_of_timer1_config	equ	__end_of_timer1_config-_timer1_config
	
_timer1_config:	
	opt	stack 6
; Regs used in _timer1_config: [wreg]
	line	33
	
l2382:	
;common.c: 33: T1CON = 0xC4;
	movlw	(0C4h)
	bcf	status, 5	;RP0=0, select bank0
	movwf	(16)	;volatile
	line	34
;common.c: 34: TMR1H = 0xC3;
	movlw	(0C3h)
	movwf	(15)	;volatile
	line	35
;common.c: 35: TMR1L = 0x50;
	movlw	(050h)
	movwf	(14)	;volatile
	line	37
	
l653:	
	return
	opt stack 0
GLOBAL	__end_of_timer1_config
	__end_of_timer1_config:
;; =============== function _timer1_config ends ============

	signat	_timer1_config,88
	global	_clock_config
psect	text576,local,class=CODE,delta=2
global __ptext576
__ptext576:

;; *************** function _clock_config *****************
;; Defined at:
;;		line 24 in file "C:\dev\AK7030-OTP\common.c"
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
;; Hardware stack levels required when called:    1
;; This function calls:
;;		Nothing
;; This function is called by:
;;		_main
;; This function uses a non-reentrant model
;;
psect	text576
	file	"C:\dev\AK7030-OTP\common.c"
	line	24
	global	__size_of_clock_config
	__size_of_clock_config	equ	__end_of_clock_config-_clock_config
	
_clock_config:	
	opt	stack 6
; Regs used in _clock_config: [wreg+status,2]
	line	26
	
l2378:	
;common.c: 26: CLKPR = 0x80;
	movlw	(080h)
	bsf	status, 6	;RP1=1, select bank2
	movwf	(264)^0100h	;volatile
	line	27
	
l2380:	
;common.c: 27: CLKPR = 0x00;
	clrf	(264)^0100h	;volatile
	line	28
;common.c: 28: while(CLKPCE);
	
l647:	
	btfsc	(2119/8)^0100h,(2119)&7
	goto	u11
	goto	u10
u11:
	goto	l647
u10:
	line	29
	
l650:	
	return
	opt stack 0
GLOBAL	__end_of_clock_config
	__end_of_clock_config:
;; =============== function _clock_config ends ============

	signat	_clock_config,88
	global	_ISR
psect	text577,local,class=CODE,delta=2
global __ptext577
__ptext577:

;; *************** function _ISR *****************
;; Defined at:
;;		line 123 in file "C:\dev\AK7030-OTP\main.c"
;; Parameters:    Size  Location     Type
;;		None
;; Auto vars:     Size  Location     Type
;;		None
;; Return value:  Size  Location     Type
;;		None               void
;; Registers used:
;;		wreg, status,2, status,0
;; Tracked objects:
;;		On entry : 0/0
;;		On exit  : 60/0
;;		Unchanged: FFF9F/0
;; Data sizes:     COMMON   BANK0   BANK1   BANK3   BANK2
;;      Params:         0       0       0       0       0
;;      Locals:         0       0       0       0       0
;;      Temps:          2       0       0       0       0
;;      Totals:         2       0       0       0       0
;;Total ram usage:        2 bytes
;; Hardware stack levels used:    1
;; This function calls:
;;		Nothing
;; This function is called by:
;;		Interrupt level 1
;; This function uses a non-reentrant model
;;
psect	text577
	file	"C:\dev\AK7030-OTP\main.c"
	line	123
	global	__size_of_ISR
	__size_of_ISR	equ	__end_of_ISR-_ISR
	
_ISR:	
	opt	stack 3
; Regs used in _ISR: [wreg+status,2+status,0]
psect	intentry,class=CODE,delta=2
global __pintentry
__pintentry:
global interrupt_function
interrupt_function:
	global saved_w
	saved_w	set	btemp+0
	movwf	saved_w
	swapf	status,w
	movwf	(??_ISR+0)
	movf	pclath,w
	movwf	(??_ISR+1)
	ljmp	_ISR
psect	text577
	line	124
	
i1l2576:	
;main.c: 124: if(TMR1IF == 1)
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	btfss	(96/8),(96)&7
	goto	u21_21
	goto	u21_20
u21_21:
	goto	i1l1373
u21_20:
	line	126
	
i1l2578:	
;main.c: 125: {
;main.c: 126: TMR1IF = 0 ;
	bcf	(96/8),(96)&7
	line	127
	
i1l2580:	
;main.c: 127: timer10msCnt++;
	incf	(_timer10msCnt),f
	line	130
;main.c: 129: static unsigned int flashCnt = 0;
;main.c: 130: flashCnt++;
	incf	(ISR@flashCnt),f
	skipnz
	incf	(ISR@flashCnt+1),f
	line	131
	
i1l2582:	
;main.c: 131: if(flashCnt > 100)
	movlw	high(065h)
	subwf	(ISR@flashCnt+1),w
	movlw	low(065h)
	skipnz
	subwf	(ISR@flashCnt),w
	skipc
	goto	u22_21
	goto	u22_20
u22_21:
	goto	i1l1373
u22_20:
	line	133
	
i1l2584:	
;main.c: 132: {
;main.c: 133: PA0 = ~PA0;
	movlw	1<<((40)&7)
	xorwf	((40)/8),f
	line	134
	
i1l2586:	
;main.c: 134: flashCnt = 0;
	clrf	(ISR@flashCnt)
	clrf	(ISR@flashCnt+1)
	line	138
	
i1l1373:	
	movf	(??_ISR+1),w
	movwf	pclath
	swapf	(??_ISR+0)^0FFFFFF80h,w
	movwf	status
	swapf	saved_w,f
	swapf	saved_w,w
	retfie
	opt stack 0
GLOBAL	__end_of_ISR
	__end_of_ISR:
;; =============== function _ISR ends ============

	signat	_ISR,88
psect	text578,local,class=CODE,delta=2
global __ptext578
__ptext578:
	global	btemp
	btemp set 07Eh

	DABS	1,126,2	;btemp
	global	wtemp0
	wtemp0 set btemp
	end
