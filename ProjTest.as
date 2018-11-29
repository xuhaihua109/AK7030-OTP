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
# 70 "C:\AK7030-OTP\main.c"
	psect config,class=CONFIG,delta=2 ;#
# 70 "C:\AK7030-OTP\main.c"
	dw 0x2FFF & 0x3FFF & 0x3FFF & 0x3FFF & 0x3FFF & 0x3FFF ;#
# 71 "C:\AK7030-OTP\main.c"
	psect config,class=CONFIG,delta=2 ;#
# 71 "C:\AK7030-OTP\main.c"
	dw 0x3FFF & 0x3FDF & 0x3FFF & 0x3FFE ;#
# 72 "C:\AK7030-OTP\main.c"
	psect config,class=CONFIG,delta=2 ;#
# 72 "C:\AK7030-OTP\main.c"
	dw 0X3FFF & 0x3FFF & 0x3FFF & 0x3FF8 ;#
	FNCALL	_main,_clock_config
	FNCALL	_main,_timer1_interrupt_config
	FNCALL	_main,_timer1_config
	FNCALL	_main,_adConverter_config
	FNCALL	_main,_dac_init
	FNCALL	_main,_op1_init
	FNCALL	_main,_op2_init
	FNCALL	_main,_start_timer1
	FNCALL	_main,_isPermitSampleTime
	FNCALL	_main,_clrSampeTime
	FNCALL	_main,_process_AD_Converter_Value
	FNCALL	_main,_getAdCh13Value
	FNCALL	_main,_setDAC0_ChannelValue
	FNCALL	_main,_startBigTimer
	FNCALL	_main,_startSmallTimer
	FNCALL	_main,_isFinishedBigTimer
	FNCALL	_main,_isFinishedSmallTimer
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
	file	"C:\AK7030-OTP\common.c"
	line	13

;initializer for _sampleChannelSelect
	retlw	0Dh
	global	_buffer_Sample_AD_Value
	global	ISR@flashCnt
	global	_multiFilterMaxValue
	global	_multiFilterMinValue
	global	_multiFilterSumValue
	global	_sampleCH13Value
	global	_uiBigTimer
	global	_uiSmallTimer
	global	_timer
	global	_ucTimer1sCnt
	global	main@tDA_timer
	global	main@ucCheckBatteryCnt
	global	main@ucConfirmTimer1S
	global	main@ucConfirmTimerZptS
	global	main@ucConfrimeCnt
	global	main@ucInit
	global	main@ucInstalledBatteryCnt
	global	_sampleCount
	global	_sampleTimes
	global	main@ampStep
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
	global	_PA1
_PA1	set	41
	global	_PA2
_PA2	set	42
	global	_PA3
_PA3	set	43
	global	_PB2
_PB2	set	50
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
	global	_TRISA2
_TRISA2	set	1066
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

main@ampStep:
       ds      1

psect	dataCOMMON,class=COMMON,space=1
global __pdataCOMMON
__pdataCOMMON:
	file	"C:\AK7030-OTP\common.c"
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

_multiFilterSumValue:
       ds      2

_sampleCH13Value:
       ds      2

_uiBigTimer:
       ds      2

_uiSmallTimer:
       ds      2

_timer:
       ds      1

_ucTimer1sCnt:
       ds      1

main@tDA_timer:
       ds      1

main@ucCheckBatteryCnt:
       ds      1

main@ucConfirmTimer1S:
       ds      1

main@ucConfirmTimerZptS:
       ds      1

main@ucConfrimeCnt:
       ds      1

main@ucInit:
       ds      1

main@ucInstalledBatteryCnt:
       ds      1

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
	movlw	low((__pbssBANK0)+02Bh)
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
	global	?_clock_config
?_clock_config:	; 0 bytes @ 0x0
	global	?_timer1_interrupt_config
?_timer1_interrupt_config:	; 0 bytes @ 0x0
	global	?_timer1_config
?_timer1_config:	; 0 bytes @ 0x0
	global	?_adConverter_config
?_adConverter_config:	; 0 bytes @ 0x0
	global	?_dac_init
?_dac_init:	; 0 bytes @ 0x0
	global	?_op1_init
?_op1_init:	; 0 bytes @ 0x0
	global	?_op2_init
?_op2_init:	; 0 bytes @ 0x0
	global	?_start_timer1
?_start_timer1:	; 0 bytes @ 0x0
	global	?_clrSampeTime
?_clrSampeTime:	; 0 bytes @ 0x0
	global	?_process_AD_Converter_Value
?_process_AD_Converter_Value:	; 0 bytes @ 0x0
	global	?_setDAC0_ChannelValue
?_setDAC0_ChannelValue:	; 0 bytes @ 0x0
	global	?_startBigTimer
?_startBigTimer:	; 0 bytes @ 0x0
	global	?_startSmallTimer
?_startSmallTimer:	; 0 bytes @ 0x0
	global	?_AD_Sample
?_AD_Sample:	; 0 bytes @ 0x0
	global	?_SetTempThermistorChannel
?_SetTempThermistorChannel:	; 0 bytes @ 0x0
	global	?_main
?_main:	; 0 bytes @ 0x0
	global	?_start_AD_Converter
?_start_AD_Converter:	; 0 bytes @ 0x0
	global	?_stop_AD_Converter
?_stop_AD_Converter:	; 0 bytes @ 0x0
	global	?_clearAdCompleteFalg
?_clearAdCompleteFalg:	; 0 bytes @ 0x0
	global	?_ISR
?_ISR:	; 0 bytes @ 0x0
	global	??_ISR
??_ISR:	; 0 bytes @ 0x0
	global	?_isPermitSampleTime
?_isPermitSampleTime:	; 1 bytes @ 0x0
	global	?_isFinishedBigTimer
?_isFinishedBigTimer:	; 1 bytes @ 0x0
	global	?_isFinishedSmallTimer
?_isFinishedSmallTimer:	; 1 bytes @ 0x0
	global	?_isAD_Completed
?_isAD_Completed:	; 1 bytes @ 0x0
	ds	2
	global	??_clock_config
??_clock_config:	; 0 bytes @ 0x2
	global	??_timer1_interrupt_config
??_timer1_interrupt_config:	; 0 bytes @ 0x2
	global	??_timer1_config
??_timer1_config:	; 0 bytes @ 0x2
	global	??_adConverter_config
??_adConverter_config:	; 0 bytes @ 0x2
	global	??_dac_init
??_dac_init:	; 0 bytes @ 0x2
	global	??_op1_init
??_op1_init:	; 0 bytes @ 0x2
	global	??_op2_init
??_op2_init:	; 0 bytes @ 0x2
	global	??_start_timer1
??_start_timer1:	; 0 bytes @ 0x2
	global	??_isPermitSampleTime
??_isPermitSampleTime:	; 0 bytes @ 0x2
	global	??_clrSampeTime
??_clrSampeTime:	; 0 bytes @ 0x2
	global	??_setDAC0_ChannelValue
??_setDAC0_ChannelValue:	; 0 bytes @ 0x2
	global	??_startBigTimer
??_startBigTimer:	; 0 bytes @ 0x2
	global	??_startSmallTimer
??_startSmallTimer:	; 0 bytes @ 0x2
	global	??_isFinishedBigTimer
??_isFinishedBigTimer:	; 0 bytes @ 0x2
	global	??_isFinishedSmallTimer
??_isFinishedSmallTimer:	; 0 bytes @ 0x2
	global	??_SetTempThermistorChannel
??_SetTempThermistorChannel:	; 0 bytes @ 0x2
	global	??_start_AD_Converter
??_start_AD_Converter:	; 0 bytes @ 0x2
	global	??_stop_AD_Converter
??_stop_AD_Converter:	; 0 bytes @ 0x2
	global	??_isAD_Completed
??_isAD_Completed:	; 0 bytes @ 0x2
	global	??_clearAdCompleteFalg
??_clearAdCompleteFalg:	; 0 bytes @ 0x2
	global	?_getAdCh13Value
?_getAdCh13Value:	; 2 bytes @ 0x2
	global	?_getAdValue
?_getAdValue:	; 2 bytes @ 0x2
	ds	2
	global	??_getAdCh13Value
??_getAdCh13Value:	; 0 bytes @ 0x4
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
;;Data sizes: Strings 0, constant 0, data 1, bss 46, persistent 0 stack 0
;;Auto spaces:   Size  Autos    Used
;; COMMON          14      8      12
;; BANK0           80      2      45
;; BANK1           80      0       0
;; BANK3           96      0       0
;; BANK2           96      0       0

;;
;; Pointer list with targets:

;; ?_getAdCh13Value	unsigned int  size(1) Largest target is 0
;;
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
;;                 _isPermitSampleTime
;;                       _clrSampeTime
;;         _process_AD_Converter_Value
;;                     _getAdCh13Value
;;               _setDAC0_ChannelValue
;;                      _startBigTimer
;;                    _startSmallTimer
;;                 _isFinishedBigTimer
;;               _isFinishedSmallTimer
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
;; (1) _isFinishedSmallTimer                                 0     0      0       0
;; ---------------------------------------------------------------------------------
;; (1) _isFinishedBigTimer                                   0     0      0       0
;; ---------------------------------------------------------------------------------
;; (1) _startSmallTimer                                      0     0      0       0
;; ---------------------------------------------------------------------------------
;; (1) _startBigTimer                                        0     0      0       0
;; ---------------------------------------------------------------------------------
;; (1) _setDAC0_ChannelValue                                 0     0      0       0
;; ---------------------------------------------------------------------------------
;; (1) _getAdCh13Value                                       2     0      2       0
;;                                              2 COMMON     2     0      2
;; ---------------------------------------------------------------------------------
;; (1) _clrSampeTime                                         0     0      0       0
;; ---------------------------------------------------------------------------------
;; (1) _isPermitSampleTime                                   0     0      0       0
;; ---------------------------------------------------------------------------------
;; (1) _start_timer1                                         0     0      0       0
;; ---------------------------------------------------------------------------------
;; (1) _op2_init                                             0     0      0       0
;; ---------------------------------------------------------------------------------
;; (1) _op1_init                                             0     0      0       0
;; ---------------------------------------------------------------------------------
;; (1) _dac_init                                             0     0      0       0
;; ---------------------------------------------------------------------------------
;; (1) _adConverter_config                                   0     0      0       0
;; ---------------------------------------------------------------------------------
;; (1) _timer1_config                                        0     0      0       0
;; ---------------------------------------------------------------------------------
;; (1) _timer1_interrupt_config                              0     0      0       0
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
;;   _isPermitSampleTime
;;   _clrSampeTime
;;   _process_AD_Converter_Value
;;     _AD_Sample
;;       _SetTempThermistorChannel
;;       _start_AD_Converter
;;       _isAD_Completed
;;       _clearAdCompleteFalg
;;       _stop_AD_Converter
;;       _getAdValue
;;         _isAD_Completed
;;   _getAdCh13Value
;;   _setDAC0_ChannelValue
;;   _startBigTimer
;;   _startSmallTimer
;;   _isFinishedBigTimer
;;   _isFinishedSmallTimer
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
;;DATA                 0      0      3D       6        0.0%
;;ABS                  0      0      39       3        0.0%
;;NULL                 0      0       0       0        0.0%
;;STACK                0      0       4       2        0.0%
;;BANK0               50      2      2D       5       56.3%
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
;;		line 84 in file "C:\AK7030-OTP\main.c"
;; Parameters:    Size  Location     Type
;;		None
;; Auto vars:     Size  Location     Type
;;		None
;; Return value:  Size  Location     Type
;;		None               void
;; Registers used:
;;		wreg, fsr0l, fsr0h, fsr1l, fsr1h, status,2, status,0, btemp+1, pclath, cstack
;; Tracked objects:
;;		On entry : 17F/0
;;		On exit  : 60/0
;;		Unchanged: 0/0
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
;;		_isPermitSampleTime
;;		_clrSampeTime
;;		_process_AD_Converter_Value
;;		_getAdCh13Value
;;		_setDAC0_ChannelValue
;;		_startBigTimer
;;		_startSmallTimer
;;		_isFinishedBigTimer
;;		_isFinishedSmallTimer
;; This function is called by:
;;		Startup code after reset
;; This function uses a non-reentrant model
;;
psect	maintext
	file	"C:\AK7030-OTP\main.c"
	line	84
	global	__size_of_main
	__size_of_main	equ	__end_of_main-_main
	
_main:	
	opt	stack 3
; Regs used in _main: [allreg]
	line	109
	
l3381:	
;main.c: 85: enum step
;main.c: 86: {
;main.c: 87: SENSE_PB2_INPUT_VOLTAGE = 0,
;main.c: 88: SENSE_PB2_DURATION_ONE_SECOND,
;main.c: 89: SENSE_PB2_INPUT_VOLTAGE__AGAIN,
;main.c: 90: SENSE_PB2_DURATION__SECOND,
;main.c: 91: SET_PA2_VALUE,
;main.c: 92: PROCESS_AD_VALUE,
;main.c: 93: WAIT_SET_TIME_FINISHED,
;main.c: 94: SET_TIME_BE_FINISHED,
;main.c: 95: CHECKING_PULL_OUT_BATTERY,
;main.c: 96: CHECKING_INSTALLED_BATTERY,
;main.c: 97: };
;main.c: 99: enum workTimerType
;main.c: 100: {
;main.c: 101: BIG_TIMER_WORK = 0,
	fcall	_clock_config
	line	110
	
l3383:	
;main.c: 110: timer1_interrupt_config();
	fcall	_timer1_interrupt_config
	line	111
	
l3385:	
;main.c: 111: timer1_config();
	fcall	_timer1_config
	line	113
	
l3387:	
;main.c: 113: adConverter_config();
	fcall	_adConverter_config
	line	117
	
l3389:	
;main.c: 117: TRISB3=1;
	bsf	(1075/8)^080h,(1075)&7
	line	118
	
l3391:	
;main.c: 118: TRISB4=1;
	bsf	(1076/8)^080h,(1076)&7
	line	119
	
l3393:	
;main.c: 119: TRISB5=0;
	bcf	(1077/8)^080h,(1077)&7
	line	122
	
l3395:	
;main.c: 122: TRISA7=0;
	bcf	(1071/8)^080h,(1071)&7
	line	123
	
l3397:	
;main.c: 123: TRISB6=1;
	bsf	(1078/8)^080h,(1078)&7
	line	125
	
l3399:	
;main.c: 125: TRISA0 = 0;
	bcf	(1064/8)^080h,(1064)&7
	line	126
	
l3401:	
;main.c: 126: TRISA1 = 0;
	bcf	(1065/8)^080h,(1065)&7
	line	127
	
l3403:	
;main.c: 127: TRISA3 = 0;
	bcf	(1067/8)^080h,(1067)&7
	line	128
	
l3405:	
;main.c: 128: TRISA2 = 0;
	bcf	(1066/8)^080h,(1066)&7
	line	129
	
l3407:	
;main.c: 129: PA2 = 1;
	bcf	status, 5	;RP0=0, select bank0
	bsf	(42/8),(42)&7
	line	131
	
l3409:	
;main.c: 131: TRISB2 = 1;
	bsf	status, 5	;RP0=1, select bank1
	bsf	(1074/8)^080h,(1074)&7
	line	134
	
l3411:	
;main.c: 134: dac_init();
	fcall	_dac_init
	line	135
	
l3413:	
;main.c: 135: op1_init();
	fcall	_op1_init
	line	136
	
l3415:	
;main.c: 136: op2_init();
	fcall	_op2_init
	line	138
;main.c: 138: start_timer1();
	fcall	_start_timer1
	line	143
	
l3417:	
# 143 "C:\AK7030-OTP\main.c"
 clrwdt ;#
psect	maintext
	line	144
	
l3419:	
;main.c: 144: if(isPermitSampleTime())
	fcall	_isPermitSampleTime
	xorlw	0
	skipnz
	goto	u991
	goto	u990
u991:
	goto	l3417
u990:
	line	146
	
l3421:	
;main.c: 145: {
;main.c: 146: clrSampeTime();
	fcall	_clrSampeTime
	line	147
	
l3423:	
;main.c: 147: process_AD_Converter_Value();
	fcall	_process_AD_Converter_Value
	line	149
;main.c: 149: switch(ampStep)
	goto	l3533
	line	151
;main.c: 150: {
;main.c: 151: case SENSE_PB2_INPUT_VOLTAGE:
	
l668:	
	line	153
;main.c: 152: {
;main.c: 153: if(!PB2)
	btfsc	(50/8),(50)&7
	goto	u1001
	goto	u1000
u1001:
	goto	l3417
u1000:
	line	154
	
l3425:	
;main.c: 154: ampStep++;
	incf	(main@ampStep),f
	goto	l3417
	line	158
;main.c: 156: }
;main.c: 158: case SENSE_PB2_DURATION_ONE_SECOND:
	
l671:	
	line	161
;main.c: 159: {
;main.c: 160: static unsigned char ucConfirmTimer1S = 0;
;main.c: 161: if(!PB2)
	btfsc	(50/8),(50)&7
	goto	u1011
	goto	u1010
u1011:
	goto	l3429
u1010:
	line	163
	
l3427:	
;main.c: 162: {
;main.c: 163: ucConfirmTimer1S++;
	incf	(main@ucConfirmTimer1S),f
	line	164
;main.c: 164: }
	goto	l3431
	line	167
	
l3429:	
;main.c: 165: else
;main.c: 166: {
;main.c: 167: ucConfirmTimer1S = 0;
	clrf	(main@ucConfirmTimer1S)
	line	170
	
l3431:	
;main.c: 168: }
;main.c: 170: if(ucConfirmTimer1S >= 10)
	movlw	(0Ah)
	subwf	(main@ucConfirmTimer1S),w
	skipc
	goto	u1021
	goto	u1020
u1021:
	goto	l666
u1020:
	line	172
	
l3433:	
;main.c: 171: {
;main.c: 172: ucConfirmTimer1S = 0;
	clrf	(main@ucConfirmTimer1S)
	goto	l3425
	line	179
;main.c: 177: }
;main.c: 179: case SENSE_PB2_INPUT_VOLTAGE__AGAIN:
	
l677:	
	line	181
;main.c: 180: {
;main.c: 181: if(!PB2)
	btfsc	(50/8),(50)&7
	goto	u1031
	goto	u1030
u1031:
	goto	l666
u1030:
	goto	l3425
	line	186
;main.c: 184: }
;main.c: 186: case SENSE_PB2_DURATION__SECOND:
	
l679:	
	line	189
;main.c: 187: {
;main.c: 188: static unsigned char ucConfirmTimerZptS = 0;
;main.c: 189: if(!PB2)
	btfsc	(50/8),(50)&7
	goto	u1041
	goto	u1040
u1041:
	goto	l3441
u1040:
	line	191
	
l3439:	
;main.c: 190: {
;main.c: 191: ucConfirmTimerZptS++;
	incf	(main@ucConfirmTimerZptS),f
	line	192
;main.c: 192: }
	goto	l3443
	line	195
	
l3441:	
;main.c: 193: else
;main.c: 194: {
;main.c: 195: ucConfirmTimerZptS = 0;
	clrf	(main@ucConfirmTimerZptS)
	line	198
	
l3443:	
;main.c: 196: }
;main.c: 198: if(ucConfirmTimerZptS >= 3)
	movlw	(03h)
	subwf	(main@ucConfirmTimerZptS),w
	skipc
	goto	u1051
	goto	u1050
u1051:
	goto	l666
u1050:
	line	200
	
l3445:	
;main.c: 199: {
;main.c: 200: ucConfirmTimerZptS = 0;
	clrf	(main@ucConfirmTimerZptS)
	goto	l3425
	line	207
;main.c: 205: }
;main.c: 207: case SET_PA2_VALUE:
	
l685:	
	line	209
;main.c: 208: {
;main.c: 209: PA2 = 0;
	bcf	(42/8),(42)&7
	goto	l3425
	line	217
	
l3451:	
;main.c: 215: {
;main.c: 216: static unsigned char ucInit = 0;
;main.c: 217: if(getAdCh13Value() > 40)
	fcall	_getAdCh13Value
	movlw	high(029h)
	subwf	(1+(?_getAdCh13Value)),w
	movlw	low(029h)
	skipnz
	subwf	(0+(?_getAdCh13Value)),w
	skipc
	goto	u1061
	goto	u1060
u1061:
	goto	l3461
u1060:
	line	219
	
l3453:	
;main.c: 218: {
;main.c: 219: PA0 = 0;
	bcf	(40/8),(40)&7
	line	220
;main.c: 220: PA1 = 1;
	bsf	(41/8),(41)&7
	line	221
;main.c: 221: PA3 = 1;
	bsf	(43/8),(43)&7
	line	222
	
l3455:	
;main.c: 222: tDA_timer = BIG_TIMER_WORK;
	clrf	(main@tDA_timer)
	line	223
	
l3457:	
;main.c: 223: setDAC0_ChannelValue(27);
	movlw	(01Bh)
	fcall	_setDAC0_ChannelValue
	line	224
	
l3459:	
;main.c: 224: startBigTimer();
	fcall	_startBigTimer
	line	225
;main.c: 225: }
	goto	l3425
	line	226
	
l3461:	
;main.c: 226: else if(getAdCh13Value() <35)
	fcall	_getAdCh13Value
	movlw	high(023h)
	subwf	(1+(?_getAdCh13Value)),w
	movlw	low(023h)
	skipnz
	subwf	(0+(?_getAdCh13Value)),w
	skipnc
	goto	u1071
	goto	u1070
u1071:
	goto	l3469
u1070:
	line	228
	
l3463:	
;main.c: 227: {
;main.c: 228: PA0 = 1;
	bsf	(40/8),(40)&7
	line	229
;main.c: 229: PA1 = 0;
	bcf	(41/8),(41)&7
	line	230
;main.c: 230: PA3 = 0;
	bcf	(43/8),(43)&7
	line	231
;main.c: 231: tDA_timer = SMALL_TIMER_WORK;
	clrf	(main@tDA_timer)
	incf	(main@tDA_timer),f
	line	232
	
l3465:	
;main.c: 232: setDAC0_ChannelValue(25);
	movlw	(019h)
	fcall	_setDAC0_ChannelValue
	line	233
	
l3467:	
;main.c: 233: startSmallTimer();
	fcall	_startSmallTimer
	line	234
;main.c: 234: }
	goto	l3425
	line	237
	
l3469:	
;main.c: 235: else
;main.c: 236: {
;main.c: 237: if(!ucInit)
	movf	(main@ucInit),f
	skipz
	goto	u1081
	goto	u1080
u1081:
	goto	l3425
u1080:
	line	239
	
l3471:	
;main.c: 238: {
;main.c: 239: ucInit = 1;
	clrf	(main@ucInit)
	incf	(main@ucInit),f
	line	240
;main.c: 240: PA0 = 0;
	bcf	(40/8),(40)&7
	line	241
;main.c: 241: PA1 = 1;
	bsf	(41/8),(41)&7
	line	242
;main.c: 242: PA3 = 1;
	bsf	(43/8),(43)&7
	line	243
	
l3473:	
;main.c: 243: tDA_timer = BIG_TIMER_WORK;
	clrf	(main@tDA_timer)
	line	244
	
l3475:	
;main.c: 244: setDAC0_ChannelValue(27);
	movlw	(01Bh)
	fcall	_setDAC0_ChannelValue
	goto	l3459
	line	260
	
l3481:	
;main.c: 258: {
;main.c: 259: static unsigned char ucConfrimeCnt = 0;
;main.c: 260: if(!isFinishedBigTimer())
	fcall	_isFinishedBigTimer
	iorlw	0
	skipz
	goto	u1091
	goto	u1090
u1091:
	goto	l3425
u1090:
	line	262
	
l3483:	
;main.c: 261: {
;main.c: 262: if(!PB2)
	btfsc	(50/8),(50)&7
	goto	u1101
	goto	u1100
u1101:
	goto	l3487
u1100:
	line	263
	
l3485:	
;main.c: 263: ucConfrimeCnt++;
	incf	(main@ucConfrimeCnt),f
	goto	l3489
	line	265
	
l3487:	
;main.c: 264: else
;main.c: 265: ucConfrimeCnt = 0;
	clrf	(main@ucConfrimeCnt)
	line	267
	
l3489:	
;main.c: 267: if(ucConfrimeCnt >=3)
	movlw	(03h)
	subwf	(main@ucConfrimeCnt),w
	skipc
	goto	u1111
	goto	u1110
u1111:
	goto	l666
u1110:
	line	269
	
l3491:	
;main.c: 268: {
;main.c: 269: ucConfrimeCnt = 0;
	clrf	(main@ucConfrimeCnt)
	line	270
	
l3493:	
;main.c: 270: ampStep = SET_PA2_VALUE;
	movlw	(04h)
	movwf	(main@ampStep)
	goto	l3417
	line	282
	
l3497:	
;main.c: 281: {
;main.c: 282: if(!isFinishedSmallTimer())
	fcall	_isFinishedSmallTimer
	iorlw	0
	skipz
	goto	u1121
	goto	u1120
u1121:
	goto	l3425
u1120:
	line	284
	
l3499:	
;main.c: 283: {
;main.c: 284: if(getAdCh13Value() > 40)
	fcall	_getAdCh13Value
	movlw	high(029h)
	subwf	(1+(?_getAdCh13Value)),w
	movlw	low(029h)
	skipnz
	subwf	(0+(?_getAdCh13Value)),w
	skipc
	goto	u1131
	goto	u1130
u1131:
	goto	l666
u1130:
	line	285
	
l3501:	
;main.c: 285: ampStep = PROCESS_AD_VALUE;
	movlw	(05h)
	movwf	(main@ampStep)
	goto	l3417
	line	255
	
l3507:	
	movf	(main@tDA_timer),w
	; Switch size 1, requested type "space"
; Number of cases is 2, Range of values is 0 to 1
; switch strategies available:
; Name         Instructions Cycles
; simple_byte            7     4 (average)
; direct_byte           11     7 (fixed)
; jumptable            260     6 (fixed)
; rangetable             6     6 (fixed)
; spacedrange           10     9 (fixed)
; locatedrange           2     3 (fixed)
;	Chosen strategy is simple_byte

	opt asmopt_off
	xorlw	0^0	; case 0
	skipnz
	goto	l3481
	xorlw	1^0	; case 1
	skipnz
	goto	l3497
	goto	l666
	opt asmopt_on

	line	301
;main.c: 299: }
;main.c: 301: case SET_TIME_BE_FINISHED:
	
l710:	
	line	303
;main.c: 302: {
;main.c: 303: PA2 = 1;
	bsf	(42/8),(42)&7
	line	304
;main.c: 304: PA0 = 0;
	bcf	(40/8),(40)&7
	line	305
;main.c: 305: PA1 = 0;
	bcf	(41/8),(41)&7
	line	306
;main.c: 306: PA2 = 0;
	bcf	(42/8),(42)&7
	line	307
	
l3509:	
;main.c: 307: setDAC0_ChannelValue(25);
	movlw	(019h)
	fcall	_setDAC0_ChannelValue
	goto	l3425
	line	312
;main.c: 310: }
;main.c: 312: case CHECKING_PULL_OUT_BATTERY:
	
l711:	
	line	315
;main.c: 313: {
;main.c: 314: static unsigned char ucCheckBatteryCnt = 0;
;main.c: 315: if(PB2)
	btfss	(50/8),(50)&7
	goto	u1141
	goto	u1140
u1141:
	goto	l3515
u1140:
	line	316
	
l3513:	
;main.c: 316: ucCheckBatteryCnt++;
	incf	(main@ucCheckBatteryCnt),f
	goto	l3517
	line	318
	
l3515:	
;main.c: 317: else
;main.c: 318: ucCheckBatteryCnt = 0;
	clrf	(main@ucCheckBatteryCnt)
	line	320
	
l3517:	
;main.c: 320: if(ucCheckBatteryCnt > 2)
	movlw	(03h)
	subwf	(main@ucCheckBatteryCnt),w
	skipc
	goto	u1151
	goto	u1150
u1151:
	goto	l666
u1150:
	line	322
	
l3519:	
;main.c: 321: {
;main.c: 322: ucCheckBatteryCnt = 0;
	clrf	(main@ucCheckBatteryCnt)
	goto	l3425
	line	328
;main.c: 326: }
;main.c: 328: case CHECKING_INSTALLED_BATTERY:
	
l717:	
	line	331
;main.c: 329: {
;main.c: 330: static unsigned char ucInstalledBatteryCnt = 0;
;main.c: 331: if(!PB2)
	btfsc	(50/8),(50)&7
	goto	u1161
	goto	u1160
u1161:
	goto	l3525
u1160:
	line	332
	
l3523:	
;main.c: 332: ucInstalledBatteryCnt++;
	incf	(main@ucInstalledBatteryCnt),f
	goto	l3527
	line	334
	
l3525:	
;main.c: 333: else
;main.c: 334: ucInstalledBatteryCnt = 0;
	clrf	(main@ucInstalledBatteryCnt)
	line	336
	
l3527:	
;main.c: 336: if(ucInstalledBatteryCnt > 10)
	movlw	(0Bh)
	subwf	(main@ucInstalledBatteryCnt),w
	skipc
	goto	u1171
	goto	u1170
u1171:
	goto	l666
u1170:
	line	338
	
l3529:	
;main.c: 337: {
;main.c: 338: ucInstalledBatteryCnt = 0;
	clrf	(main@ucInstalledBatteryCnt)
	line	339
;main.c: 339: ampStep = SENSE_PB2_INPUT_VOLTAGE;
	clrf	(main@ampStep)
	goto	l3417
	line	149
	
l3533:	
	movf	(main@ampStep),w
	; Switch size 1, requested type "space"
; Number of cases is 10, Range of values is 0 to 9
; switch strategies available:
; Name         Instructions Cycles
; direct_byte           27     7 (fixed)
; simple_byte           31    16 (average)
; jumptable            260     6 (fixed)
; rangetable            14     6 (fixed)
; spacedrange           26     9 (fixed)
; locatedrange          10     3 (fixed)
;	Chosen strategy is direct_byte

	movwf fsr
	movlw	10
	subwf	fsr,w
skipnc
goto l666
movlw high(S3583)
movwf pclath
	clrc
	rlf fsr,w
	addlw low(S3583)
	movwf pc
psect	swtext1,local,class=CONST,delta=2
global __pswtext1
__pswtext1:
S3583:
	ljmp	l668
	ljmp	l671
	ljmp	l677
	ljmp	l679
	ljmp	l685
	ljmp	l3451
	ljmp	l3507
	ljmp	l710
	ljmp	l711
	ljmp	l717
psect	maintext

	line	348
	
l666:	
	goto	l3417
	global	start
	ljmp	start
	opt stack 0
psect	maintext
	line	350
GLOBAL	__end_of_main
	__end_of_main:
;; =============== function _main ends ============

	signat	_main,88
	global	_process_AD_Converter_Value
psect	text715,local,class=CODE,delta=2
global __ptext715
__ptext715:

;; *************** function _process_AD_Converter_Value *****************
;; Defined at:
;;		line 111 in file "C:\AK7030-OTP\common.c"
;; Parameters:    Size  Location     Type
;;		None
;; Auto vars:     Size  Location     Type
;;		None
;; Return value:  Size  Location     Type
;;		None               void
;; Registers used:
;;		wreg, fsr0l, fsr0h, status,2, status,0, pclath, cstack
;; Tracked objects:
;;		On entry : 60/0
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
psect	text715
	file	"C:\AK7030-OTP\common.c"
	line	111
	global	__size_of_process_AD_Converter_Value
	__size_of_process_AD_Converter_Value	equ	__end_of_process_AD_Converter_Value-_process_AD_Converter_Value
	
_process_AD_Converter_Value:	
	opt	stack 3
; Regs used in _process_AD_Converter_Value: [wreg-fsr0h+status,2+status,0+pclath+cstack]
	line	112
	
l3379:	
;common.c: 112: AD_Sample();
	fcall	_AD_Sample
	line	113
	
l1417:	
	return
	opt stack 0
GLOBAL	__end_of_process_AD_Converter_Value
	__end_of_process_AD_Converter_Value:
;; =============== function _process_AD_Converter_Value ends ============

	signat	_process_AD_Converter_Value,88
	global	_AD_Sample
psect	text716,local,class=CODE,delta=2
global __ptext716
__ptext716:

;; *************** function _AD_Sample *****************
;; Defined at:
;;		line 125 in file "C:\AK7030-OTP\common.c"
;; Parameters:    Size  Location     Type
;;		None
;; Auto vars:     Size  Location     Type
;;		None
;; Return value:  Size  Location     Type
;;		None               void
;; Registers used:
;;		wreg, fsr0l, fsr0h, status,2, status,0, pclath, cstack
;; Tracked objects:
;;		On entry : 60/0
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
psect	text716
	file	"C:\AK7030-OTP\common.c"
	line	125
	global	__size_of_AD_Sample
	__size_of_AD_Sample	equ	__end_of_AD_Sample-_AD_Sample
	
_AD_Sample:	
	opt	stack 3
; Regs used in _AD_Sample: [wreg-fsr0h+status,2+status,0+pclath+cstack]
	line	126
	
l3309:	
;common.c: 126: if(sampleTimes == 0)
	movf	(_sampleTimes),f
	skipz
	goto	u871
	goto	u870
u871:
	goto	l3323
u870:
	line	128
	
l3311:	
;common.c: 127: {
;common.c: 128: SetTempThermistorChannel();
	fcall	_SetTempThermistorChannel
	line	129
	
l3313:	
;common.c: 129: multiFilterMaxValue = 0;
	clrf	(_multiFilterMaxValue)
	clrf	(_multiFilterMaxValue+1)
	line	130
	
l3315:	
;common.c: 130: multiFilterMinValue = 0;
	clrf	(_multiFilterMinValue)
	clrf	(_multiFilterMinValue+1)
	line	131
	
l3317:	
;common.c: 131: multiFilterSumValue = 0;
	clrf	(_multiFilterSumValue)
	clrf	(_multiFilterSumValue+1)
	line	132
	
l3319:	
;common.c: 132: sampleCount = 1;
	clrf	(_sampleCount)
	incf	(_sampleCount),f
	line	133
	
l3321:	
;common.c: 133: start_AD_Converter();
	fcall	_start_AD_Converter
	line	136
	
l3323:	
;common.c: 134: }
;common.c: 136: if(sampleTimes < 10)
	movlw	(0Ah)
	subwf	(_sampleTimes),w
	skipnc
	goto	u881
	goto	u880
u881:
	goto	l3361
u880:
	goto	l3337
	line	140
	
l3327:	
;common.c: 139: {
;common.c: 140: if(sampleCount <= 10)
	movlw	(0Bh)
	subwf	(_sampleCount),w
	skipnc
	goto	u891
	goto	u890
u891:
	goto	l3335
u890:
	line	142
	
l3329:	
;common.c: 141: {
;common.c: 142: sampleCount ++;
	incf	(_sampleCount),f
	line	143
	
l3331:	
;common.c: 143: if(isAD_Completed())
	fcall	_isAD_Completed
	xorlw	0
	skipnz
	goto	u901
	goto	u900
u901:
	goto	l3337
u900:
	line	145
	
l3333:	
;common.c: 144: {
;common.c: 145: clearAdCompleteFalg();
	fcall	_clearAdCompleteFalg
	line	146
;common.c: 146: stop_AD_Converter();
	fcall	_stop_AD_Converter
	line	147
;common.c: 147: break;
	goto	l3339
	line	152
	
l3335:	
;common.c: 150: else
;common.c: 151: {
;common.c: 152: sampleCount = 0;
	clrf	(_sampleCount)
	line	153
;common.c: 153: sampleTimes = 0;
	clrf	(_sampleTimes)
	line	154
;common.c: 154: break;
	goto	l3339
	line	138
	
l3337:	
	fcall	_isAD_Completed
	xorlw	0
	skipnz
	goto	u911
	goto	u910
u911:
	goto	l3327
u910:
	line	158
	
l3339:	
;common.c: 155: }
;common.c: 156: }
;common.c: 158: if(sampleCount != 0)
	movf	(_sampleCount),w
	skipz
	goto	u920
	goto	l3343
u920:
	line	160
	
l3341:	
;common.c: 159: {
;common.c: 160: buffer_Sample_AD_Value[sampleTimes] = getAdValue();
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
	line	161
;common.c: 161: }
	goto	l3345
	line	164
	
l3343:	
;common.c: 162: else
;common.c: 163: {
;common.c: 164: buffer_Sample_AD_Value[sampleTimes] = 2048;
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
	line	167
	
l3345:	
;common.c: 165: }
;common.c: 167: if(sampleTimes == 0)
	movf	(_sampleTimes),f
	skipz
	goto	u931
	goto	u930
u931:
	goto	l3349
u930:
	line	169
	
l3347:	
;common.c: 168: {
;common.c: 169: multiFilterMaxValue = buffer_Sample_AD_Value[0];
	movf	(_buffer_Sample_AD_Value+1),w
	movwf	(_multiFilterMaxValue+1)
	movf	(_buffer_Sample_AD_Value),w
	movwf	(_multiFilterMaxValue)
	line	170
;common.c: 170: multiFilterMinValue = buffer_Sample_AD_Value[0];
	movf	(_buffer_Sample_AD_Value+1),w
	movwf	(_multiFilterMinValue+1)
	movf	(_buffer_Sample_AD_Value),w
	movwf	(_multiFilterMinValue)
	line	172
	
l3349:	
;common.c: 171: }
;common.c: 172: if(multiFilterMaxValue < buffer_Sample_AD_Value[sampleTimes])
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
	goto	u945
	movf	0+(??_AD_Sample+0)+0,w
	subwf	(_multiFilterMaxValue),w
u945:
	skipnc
	goto	u941
	goto	u940
u941:
	goto	l1431
u940:
	line	174
	
l3351:	
;common.c: 173: {
;common.c: 174: multiFilterMaxValue = buffer_Sample_AD_Value[sampleTimes];
	clrc
	rlf	(_sampleTimes),w
	addlw	_buffer_Sample_AD_Value&0ffh
	movwf	fsr0
	movf	indf,w
	movwf	(_multiFilterMaxValue)
	incf	fsr0,f
	movf	indf,w
	movwf	(_multiFilterMaxValue+1)
	line	175
	
l1431:	
	line	176
;common.c: 175: }
;common.c: 176: if(multiFilterMinValue > buffer_Sample_AD_Value[sampleTimes])
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
	goto	u955
	movf	(_multiFilterMinValue),w
	subwf	0+(??_AD_Sample+0)+0,w
u955:
	skipnc
	goto	u951
	goto	u950
u951:
	goto	l1432
u950:
	line	178
	
l3353:	
;common.c: 177: {
;common.c: 178: multiFilterMinValue = buffer_Sample_AD_Value[sampleTimes];
	clrc
	rlf	(_sampleTimes),w
	addlw	_buffer_Sample_AD_Value&0ffh
	movwf	fsr0
	movf	indf,w
	movwf	(_multiFilterMinValue)
	incf	fsr0,f
	movf	indf,w
	movwf	(_multiFilterMinValue+1)
	line	179
	
l1432:	
	line	180
;common.c: 179: }
;common.c: 180: multiFilterSumValue = multiFilterSumValue + buffer_Sample_AD_Value[sampleTimes];
	clrc
	rlf	(_sampleTimes),w
	addlw	_buffer_Sample_AD_Value&0ffh
	movwf	fsr0
	movf	indf,w
	movwf	(??_AD_Sample+0)+0+0
	incf	fsr0,f
	movf	indf,w
	movwf	(??_AD_Sample+0)+0+1
	movf	0+(??_AD_Sample+0)+0,w
	addwf	(_multiFilterSumValue),f
	skipnc
	incf	(_multiFilterSumValue+1),f
	movf	1+(??_AD_Sample+0)+0,w
	addwf	(_multiFilterSumValue+1),f
	line	182
	
l3355:	
;common.c: 182: sampleTimes++;
	incf	(_sampleTimes),f
	line	184
	
l3357:	
;common.c: 184: if(sampleTimes < 10)
	movlw	(0Ah)
	subwf	(_sampleTimes),w
	skipnc
	goto	u961
	goto	u960
u961:
	goto	l1440
u960:
	line	186
	
l3359:	
;common.c: 185: {
;common.c: 186: start_AD_Converter();
	fcall	_start_AD_Converter
	goto	l1440
	line	191
	
l3361:	
;common.c: 189: else
;common.c: 190: {
;common.c: 191: sampleTimes = 0;
	clrf	(_sampleTimes)
	line	193
	
l3363:	
;common.c: 193: stop_AD_Converter();
	fcall	_stop_AD_Converter
	line	195
	
l3365:	
;common.c: 195: if(sampleChannelSelect == 13)
	movf	(_sampleChannelSelect),w
	xorlw	0Dh
	skipz
	goto	u971
	goto	u970
u971:
	goto	l1437
u970:
	line	198
	
l3367:	
;common.c: 196: {
;common.c: 198: sampleCH13Value = ((multiFilterSumValue - multiFilterMaxValue - multiFilterMinValue))>> 3;
	movf	(_multiFilterMinValue),w
	addwf	(_multiFilterMaxValue),w
	movwf	(??_AD_Sample+0)+0
	movf	(_multiFilterMinValue+1),w
	skipnc
	incf	(_multiFilterMinValue+1),w
	addwf	(_multiFilterMaxValue+1),w
	movwf	1+(??_AD_Sample+0)+0
	comf	(??_AD_Sample+0)+0,f
	comf	(??_AD_Sample+0)+1,f
	incf	(??_AD_Sample+0)+0,f
	skipnz
	incf	(??_AD_Sample+0)+1,f
	movf	0+(??_AD_Sample+0)+0,w
	movwf	(_sampleCH13Value)
	movf	1+(??_AD_Sample+0)+0,w
	movwf	(_sampleCH13Value+1)
	
l3369:	
	movf	(_multiFilterSumValue),w
	addwf	(_sampleCH13Value),f
	skipnc
	incf	(_sampleCH13Value+1),f
	movf	(_multiFilterSumValue+1),w
	addwf	(_sampleCH13Value+1),f
	clrc
	rrf	(_sampleCH13Value+1),f
	rrf	(_sampleCH13Value),f
	clrc
	rrf	(_sampleCH13Value+1),f
	rrf	(_sampleCH13Value),f
	clrc
	rrf	(_sampleCH13Value+1),f
	rrf	(_sampleCH13Value),f
	line	199
;common.c: 199: }
	goto	l3373
	line	203
	
l1437:	
	line	206
	
l3373:	
;common.c: 203: }
;common.c: 206: if(sampleChannelSelect == 13)
	movf	(_sampleChannelSelect),w
	xorlw	0Dh
	skipz
	goto	u981
	goto	u980
u981:
	goto	l3377
u980:
	line	208
	
l3375:	
;common.c: 207: {
;common.c: 208: sampleChannelSelect = 12;
	movlw	(0Ch)
	movwf	(_sampleChannelSelect)
	line	209
;common.c: 209: }
	goto	l1440
	line	212
	
l3377:	
;common.c: 210: else
;common.c: 211: {
;common.c: 212: sampleChannelSelect = 13;
	movlw	(0Dh)
	movwf	(_sampleChannelSelect)
	line	215
	
l1440:	
	return
	opt stack 0
GLOBAL	__end_of_AD_Sample
	__end_of_AD_Sample:
;; =============== function _AD_Sample ends ============

	signat	_AD_Sample,88
	global	_getAdValue
psect	text717,local,class=CODE,delta=2
global __ptext717
__ptext717:

;; *************** function _getAdValue *****************
;; Defined at:
;;		line 96 in file "C:\AK7030-OTP\common.c"
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
;;		On entry : 60/0
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
psect	text717
	file	"C:\AK7030-OTP\common.c"
	line	96
	global	__size_of_getAdValue
	__size_of_getAdValue	equ	__end_of_getAdValue-_getAdValue
	
_getAdValue:	
	opt	stack 3
; Regs used in _getAdValue: [wreg+status,2+pclath+cstack]
	line	97
	
l3025:	
;common.c: 97: unsigned int AdValue = 0,AdHighValue = 0;
	clrf	(getAdValue@AdValue)
	clrf	(getAdValue@AdValue+1)
	line	98
	
l3027:	
;common.c: 98: if(isAD_Completed()!=0)
	fcall	_isAD_Completed
	xorlw	0
	skipnz
	goto	u551
	goto	u550
u551:
	goto	l1413
u550:
	line	100
	
l3029:	
;common.c: 99: {
;common.c: 100: ADIF = 0;
	bcf	(106/8),(106)&7
	line	101
	
l3031:	
;common.c: 101: AdValue = ADRESL;
	bsf	status, 5	;RP0=1, select bank1
	movf	(158)^080h,w	;volatile
	movwf	(getAdValue@AdValue)
	clrf	(getAdValue@AdValue+1)
	line	102
;common.c: 102: AdHighValue = ADRESH;
	bcf	status, 5	;RP0=0, select bank0
	movf	(30),w	;volatile
	movwf	(getAdValue@AdHighValue)
	clrf	(getAdValue@AdHighValue+1)
	line	103
;common.c: 103: AdHighValue = AdHighValue << 8;
	movf	(getAdValue@AdHighValue),w
	movwf	(getAdValue@AdHighValue+1)
	clrf	(getAdValue@AdHighValue)
	line	104
;common.c: 104: AdValue = AdValue | AdHighValue;
	movf	(getAdValue@AdHighValue),w
	iorwf	(getAdValue@AdValue),f
	movf	(getAdValue@AdHighValue+1),w
	iorwf	(getAdValue@AdValue+1),f
	line	105
	
l1413:	
	line	107
;common.c: 105: }
;common.c: 107: return AdValue;
	movf	(getAdValue@AdValue+1),w
	movwf	(?_getAdValue+1)
	movf	(getAdValue@AdValue),w
	movwf	(?_getAdValue)
	line	108
	
l1414:	
	return
	opt stack 0
GLOBAL	__end_of_getAdValue
	__end_of_getAdValue:
;; =============== function _getAdValue ends ============

	signat	_getAdValue,90
	global	_SetTempThermistorChannel
psect	text718,local,class=CODE,delta=2
global __ptext718
__ptext718:

;; *************** function _SetTempThermistorChannel *****************
;; Defined at:
;;		line 228 in file "C:\AK7030-OTP\common.c"
;; Parameters:    Size  Location     Type
;;		None
;; Auto vars:     Size  Location     Type
;;		None
;; Return value:  Size  Location     Type
;;		None               void
;; Registers used:
;;		wreg
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
psect	text718
	file	"C:\AK7030-OTP\common.c"
	line	228
	global	__size_of_SetTempThermistorChannel
	__size_of_SetTempThermistorChannel	equ	__end_of_SetTempThermistorChannel-_SetTempThermistorChannel
	
_SetTempThermistorChannel:	
	opt	stack 4
; Regs used in _SetTempThermistorChannel: [wreg]
	line	231
	
l2997:	
;common.c: 231: if(sampleChannelSelect == 12)
	movf	(_sampleChannelSelect),w
	xorlw	0Ch
	skipz
	goto	u491
	goto	u490
u491:
	goto	l1443
u490:
	line	233
	
l2999:	
;common.c: 232: {
;common.c: 233: CHS3 = 1;
	bsf	(253/8),(253)&7
	line	234
;common.c: 234: CHS2 = 1;
	bsf	(252/8),(252)&7
	line	235
;common.c: 235: CHS1 = 0;
	bcf	(251/8),(251)&7
	line	236
;common.c: 236: CHS0 = 0;
	bcf	(250/8),(250)&7
	line	237
;common.c: 237: }
	goto	l1445
	line	238
	
l1443:	
	line	240
;common.c: 238: else
;common.c: 239: {
;common.c: 240: CHS3 = 1;
	bsf	(253/8),(253)&7
	line	241
;common.c: 241: CHS2 = 1;
	bsf	(252/8),(252)&7
	line	242
;common.c: 242: CHS1 = 0;
	bcf	(251/8),(251)&7
	line	243
;common.c: 243: CHS0 = 1;
	bsf	(250/8),(250)&7
	line	246
	
l1445:	
	return
	opt stack 0
GLOBAL	__end_of_SetTempThermistorChannel
	__end_of_SetTempThermistorChannel:
;; =============== function _SetTempThermistorChannel ends ============

	signat	_SetTempThermistorChannel,88
	global	_clearAdCompleteFalg
psect	text719,local,class=CODE,delta=2
global __ptext719
__ptext719:

;; *************** function _clearAdCompleteFalg *****************
;; Defined at:
;;		line 91 in file "C:\AK7030-OTP\common.c"
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
psect	text719
	file	"C:\AK7030-OTP\common.c"
	line	91
	global	__size_of_clearAdCompleteFalg
	__size_of_clearAdCompleteFalg	equ	__end_of_clearAdCompleteFalg-_clearAdCompleteFalg
	
_clearAdCompleteFalg:	
	opt	stack 4
; Regs used in _clearAdCompleteFalg: []
	line	92
	
l2995:	
;common.c: 92: ADIF = 0;
	bcf	(106/8),(106)&7
	line	93
	
l1410:	
	return
	opt stack 0
GLOBAL	__end_of_clearAdCompleteFalg
	__end_of_clearAdCompleteFalg:
;; =============== function _clearAdCompleteFalg ends ============

	signat	_clearAdCompleteFalg,88
	global	_isAD_Completed
psect	text720,local,class=CODE,delta=2
global __ptext720
__ptext720:

;; *************** function _isAD_Completed *****************
;; Defined at:
;;		line 83 in file "C:\AK7030-OTP\common.c"
;; Parameters:    Size  Location     Type
;;		None
;; Auto vars:     Size  Location     Type
;;		None
;; Return value:  Size  Location     Type
;;                  1    wreg      unsigned char 
;; Registers used:
;;		wreg
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
;;		_getAdValue
;;		_AD_Sample
;; This function uses a non-reentrant model
;;
psect	text720
	file	"C:\AK7030-OTP\common.c"
	line	83
	global	__size_of_isAD_Completed
	__size_of_isAD_Completed	equ	__end_of_isAD_Completed-_isAD_Completed
	
_isAD_Completed:	
	opt	stack 3
; Regs used in _isAD_Completed: [wreg]
	line	84
	
l2983:	
;common.c: 84: if(ADIF)
	btfss	(106/8),(106)&7
	goto	u481
	goto	u480
u481:
	goto	l2991
u480:
	line	85
	
l2985:	
;common.c: 85: return 1;
	movlw	(01h)
	goto	l1406
	line	87
	
l2991:	
;common.c: 86: else
;common.c: 87: return 0;
	movlw	(0)
	line	88
	
l1406:	
	return
	opt stack 0
GLOBAL	__end_of_isAD_Completed
	__end_of_isAD_Completed:
;; =============== function _isAD_Completed ends ============

	signat	_isAD_Completed,89
	global	_stop_AD_Converter
psect	text721,local,class=CODE,delta=2
global __ptext721
__ptext721:

;; *************** function _stop_AD_Converter *****************
;; Defined at:
;;		line 78 in file "C:\AK7030-OTP\common.c"
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
psect	text721
	file	"C:\AK7030-OTP\common.c"
	line	78
	global	__size_of_stop_AD_Converter
	__size_of_stop_AD_Converter	equ	__end_of_stop_AD_Converter-_stop_AD_Converter
	
_stop_AD_Converter:	
	opt	stack 4
; Regs used in _stop_AD_Converter: []
	line	79
	
l2981:	
;common.c: 79: ADON = 0;
	bcf	(248/8),(248)&7
	line	80
	
l1402:	
	return
	opt stack 0
GLOBAL	__end_of_stop_AD_Converter
	__end_of_stop_AD_Converter:
;; =============== function _stop_AD_Converter ends ============

	signat	_stop_AD_Converter,88
	global	_start_AD_Converter
psect	text722,local,class=CODE,delta=2
global __ptext722
__ptext722:

;; *************** function _start_AD_Converter *****************
;; Defined at:
;;		line 73 in file "C:\AK7030-OTP\common.c"
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
psect	text722
	file	"C:\AK7030-OTP\common.c"
	line	73
	global	__size_of_start_AD_Converter
	__size_of_start_AD_Converter	equ	__end_of_start_AD_Converter-_start_AD_Converter
	
_start_AD_Converter:	
	opt	stack 4
; Regs used in _start_AD_Converter: []
	line	74
	
l2979:	
;common.c: 74: ADON = 1;
	bsf	(248/8),(248)&7
	line	75
	
l1399:	
	return
	opt stack 0
GLOBAL	__end_of_start_AD_Converter
	__end_of_start_AD_Converter:
;; =============== function _start_AD_Converter ends ============

	signat	_start_AD_Converter,88
	global	_isFinishedSmallTimer
psect	text723,local,class=CODE,delta=2
global __ptext723
__ptext723:

;; *************** function _isFinishedSmallTimer *****************
;; Defined at:
;;		line 286 in file "C:\AK7030-OTP\common.c"
;; Parameters:    Size  Location     Type
;;		None
;; Auto vars:     Size  Location     Type
;;		None
;; Return value:  Size  Location     Type
;;                  1    wreg      unsigned char 
;; Registers used:
;;		wreg, status,2, status,0
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
;;		_main
;; This function uses a non-reentrant model
;;
psect	text723
	file	"C:\AK7030-OTP\common.c"
	line	286
	global	__size_of_isFinishedSmallTimer
	__size_of_isFinishedSmallTimer	equ	__end_of_isFinishedSmallTimer-_isFinishedSmallTimer
	
_isFinishedSmallTimer:	
	opt	stack 6
; Regs used in _isFinishedSmallTimer: [wreg+status,2+status,0]
	line	287
	
l2963:	
;common.c: 287: if(uiSmallTimer == 0)
	movf	((_uiSmallTimer+1)),w
	iorwf	((_uiSmallTimer)),w
	skipz
	goto	u471
	goto	u470
u471:
	goto	l2971
u470:
	line	288
	
l2965:	
;common.c: 288: return 1;
	movlw	(01h)
	goto	l1469
	line	290
	
l2971:	
;common.c: 289: else
;common.c: 290: return 0;
	movlw	(0)
	line	292
	
l1469:	
	return
	opt stack 0
GLOBAL	__end_of_isFinishedSmallTimer
	__end_of_isFinishedSmallTimer:
;; =============== function _isFinishedSmallTimer ends ============

	signat	_isFinishedSmallTimer,89
	global	_isFinishedBigTimer
psect	text724,local,class=CODE,delta=2
global __ptext724
__ptext724:

;; *************** function _isFinishedBigTimer *****************
;; Defined at:
;;		line 278 in file "C:\AK7030-OTP\common.c"
;; Parameters:    Size  Location     Type
;;		None
;; Auto vars:     Size  Location     Type
;;		None
;; Return value:  Size  Location     Type
;;                  1    wreg      unsigned char 
;; Registers used:
;;		wreg, status,2, status,0
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
;;		_main
;; This function uses a non-reentrant model
;;
psect	text724
	file	"C:\AK7030-OTP\common.c"
	line	278
	global	__size_of_isFinishedBigTimer
	__size_of_isFinishedBigTimer	equ	__end_of_isFinishedBigTimer-_isFinishedBigTimer
	
_isFinishedBigTimer:	
	opt	stack 6
; Regs used in _isFinishedBigTimer: [wreg+status,2+status,0]
	line	279
	
l2951:	
;common.c: 279: if(uiBigTimer == 0)
	movf	((_uiBigTimer+1)),w
	iorwf	((_uiBigTimer)),w
	skipz
	goto	u461
	goto	u460
u461:
	goto	l2959
u460:
	line	280
	
l2953:	
;common.c: 280: return 1;
	movlw	(01h)
	goto	l1464
	line	282
	
l2959:	
;common.c: 281: else
;common.c: 282: return 0;
	movlw	(0)
	line	283
	
l1464:	
	return
	opt stack 0
GLOBAL	__end_of_isFinishedBigTimer
	__end_of_isFinishedBigTimer:
;; =============== function _isFinishedBigTimer ends ============

	signat	_isFinishedBigTimer,89
	global	_startSmallTimer
psect	text725,local,class=CODE,delta=2
global __ptext725
__ptext725:

;; *************** function _startSmallTimer *****************
;; Defined at:
;;		line 272 in file "C:\AK7030-OTP\common.c"
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
;;		_main
;; This function uses a non-reentrant model
;;
psect	text725
	file	"C:\AK7030-OTP\common.c"
	line	272
	global	__size_of_startSmallTimer
	__size_of_startSmallTimer	equ	__end_of_startSmallTimer-_startSmallTimer
	
_startSmallTimer:	
	opt	stack 6
; Regs used in _startSmallTimer: [wreg]
	line	273
	
l2949:	
;common.c: 273: uiSmallTimer = 10800;
	movlw	low(02A30h)
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	movwf	(_uiSmallTimer)
	movlw	high(02A30h)
	movwf	((_uiSmallTimer))+1
	line	274
	
l1460:	
	return
	opt stack 0
GLOBAL	__end_of_startSmallTimer
	__end_of_startSmallTimer:
;; =============== function _startSmallTimer ends ============

	signat	_startSmallTimer,88
	global	_startBigTimer
psect	text726,local,class=CODE,delta=2
global __ptext726
__ptext726:

;; *************** function _startBigTimer *****************
;; Defined at:
;;		line 266 in file "C:\AK7030-OTP\common.c"
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
;;		_main
;; This function uses a non-reentrant model
;;
psect	text726
	file	"C:\AK7030-OTP\common.c"
	line	266
	global	__size_of_startBigTimer
	__size_of_startBigTimer	equ	__end_of_startBigTimer-_startBigTimer
	
_startBigTimer:	
	opt	stack 6
; Regs used in _startBigTimer: [wreg]
	line	267
	
l2947:	
;common.c: 267: uiBigTimer = 34200;
	movlw	low(08598h)
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	movwf	(_uiBigTimer)
	movlw	high(08598h)
	movwf	((_uiBigTimer))+1
	line	268
	
l1457:	
	return
	opt stack 0
GLOBAL	__end_of_startBigTimer
	__end_of_startBigTimer:
;; =============== function _startBigTimer ends ============

	signat	_startBigTimer,88
	global	_setDAC0_ChannelValue
	global	_getAdCh13Value
psect	text727,local,class=CODE,delta=2
global __ptext727
__ptext727:

;; *************** function _getAdCh13Value *****************
;; Defined at:
;;		line 256 in file "C:\AK7030-OTP\common.c"
;; Parameters:    Size  Location     Type
;;		None
;; Auto vars:     Size  Location     Type
;;		None
;; Return value:  Size  Location     Type
;;                  2    2[COMMON] unsigned int 
;; Registers used:
;;		wreg
;; Tracked objects:
;;		On entry : 60/0
;;		On exit  : 60/0
;;		Unchanged: FFF9F/0
;; Data sizes:     COMMON   BANK0   BANK1   BANK3   BANK2
;;      Params:         2       0       0       0       0
;;      Locals:         0       0       0       0       0
;;      Temps:          0       0       0       0       0
;;      Totals:         2       0       0       0       0
;;Total ram usage:        2 bytes
;; Hardware stack levels used:    1
;; Hardware stack levels required when called:    1
;; This function calls:
;;		Nothing
;; This function is called by:
;;		_main
;; This function uses a non-reentrant model
;;
psect	text727
	file	"C:\AK7030-OTP\common.c"
	line	256
	global	__size_of_getAdCh13Value
	__size_of_getAdCh13Value	equ	__end_of_getAdCh13Value-_getAdCh13Value
	
_getAdCh13Value:	
	opt	stack 6
; Regs used in _getAdCh13Value: [wreg]
	line	257
	
l2943:	
;common.c: 257: return sampleCH13Value;
	movf	(_sampleCH13Value+1),w
	movwf	(?_getAdCh13Value+1)
	movf	(_sampleCH13Value),w
	movwf	(?_getAdCh13Value)
	line	258
	
l1451:	
	return
	opt stack 0
GLOBAL	__end_of_getAdCh13Value
	__end_of_getAdCh13Value:
;; =============== function _getAdCh13Value ends ============

	signat	_getAdCh13Value,90
	global	_clrSampeTime
psect	text728,local,class=CODE,delta=2
global __ptext728
__ptext728:

;; *************** function _clrSampeTime *****************
;; Defined at:
;;		line 305 in file "C:\AK7030-OTP\common.c"
;; Parameters:    Size  Location     Type
;;		None
;; Auto vars:     Size  Location     Type
;;		None
;; Return value:  Size  Location     Type
;;		None               void
;; Registers used:
;;		status,2
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
;;		_main
;; This function uses a non-reentrant model
;;
psect	text728
	file	"C:\AK7030-OTP\common.c"
	line	305
	global	__size_of_clrSampeTime
	__size_of_clrSampeTime	equ	__end_of_clrSampeTime-_clrSampeTime
	
_clrSampeTime:	
	opt	stack 6
; Regs used in _clrSampeTime: [status,2]
	line	306
	
l2941:	
;common.c: 306: timer.timer10msStopWatch = 0;
	clrf	(_timer)
	line	307
	
l1478:	
	return
	opt stack 0
GLOBAL	__end_of_clrSampeTime
	__end_of_clrSampeTime:
;; =============== function _clrSampeTime ends ============

	signat	_clrSampeTime,88
	global	_isPermitSampleTime
psect	text729,local,class=CODE,delta=2
global __ptext729
__ptext729:

;; *************** function _isPermitSampleTime *****************
;; Defined at:
;;		line 295 in file "C:\AK7030-OTP\common.c"
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
;;		_main
;; This function uses a non-reentrant model
;;
psect	text729
	file	"C:\AK7030-OTP\common.c"
	line	295
	global	__size_of_isPermitSampleTime
	__size_of_isPermitSampleTime	equ	__end_of_isPermitSampleTime-_isPermitSampleTime
	
_isPermitSampleTime:	
	opt	stack 6
; Regs used in _isPermitSampleTime: [wreg]
	line	296
	
l2929:	
;common.c: 296: if(timer.timer10msStopWatch > 10)
	movlw	(0Bh)
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	subwf	(_timer),w
	skipc
	goto	u451
	goto	u450
u451:
	goto	l2937
u450:
	line	298
	
l2931:	
;common.c: 297: {
;common.c: 298: return 1;
	movlw	(01h)
	goto	l1474
	line	301
	
l2937:	
;common.c: 300: else
;common.c: 301: return 0;
	movlw	(0)
	line	302
	
l1474:	
	return
	opt stack 0
GLOBAL	__end_of_isPermitSampleTime
	__end_of_isPermitSampleTime:
;; =============== function _isPermitSampleTime ends ============

	signat	_isPermitSampleTime,89
	global	_start_timer1
psect	text730,local,class=CODE,delta=2
global __ptext730
__ptext730:

;; *************** function _start_timer1 *****************
;; Defined at:
;;		line 51 in file "C:\AK7030-OTP\common.c"
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
psect	text730
	file	"C:\AK7030-OTP\common.c"
	line	51
	global	__size_of_start_timer1
	__size_of_start_timer1	equ	__end_of_start_timer1-_start_timer1
	
_start_timer1:	
	opt	stack 6
; Regs used in _start_timer1: []
	line	52
	
l2927:	
;common.c: 52: TMR1ON = 1;
	bcf	status, 5	;RP0=0, select bank0
	bsf	(128/8),(128)&7
	line	53
	
l1390:	
	return
	opt stack 0
GLOBAL	__end_of_start_timer1
	__end_of_start_timer1:
;; =============== function _start_timer1 ends ============

	signat	_start_timer1,88
	global	_op2_init
psect	text731,local,class=CODE,delta=2
global __ptext731
__ptext731:

;; *************** function _op2_init *****************
;; Defined at:
;;		line 40 in file "C:\AK7030-OTP\periph.c"
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
psect	text731
	file	"C:\AK7030-OTP\periph.c"
	line	40
	global	__size_of_op2_init
	__size_of_op2_init	equ	__end_of_op2_init-_op2_init
	
_op2_init:	
	opt	stack 6
; Regs used in _op2_init: [wreg]
	line	47
	
l2925:	
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
	
l2119:	
	return
	opt stack 0
GLOBAL	__end_of_op2_init
	__end_of_op2_init:
;; =============== function _op2_init ends ============

	signat	_op2_init,88
	global	_op1_init
psect	text732,local,class=CODE,delta=2
global __ptext732
__ptext732:

;; *************** function _op1_init *****************
;; Defined at:
;;		line 26 in file "C:\AK7030-OTP\periph.c"
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
psect	text732
	file	"C:\AK7030-OTP\periph.c"
	line	26
	global	__size_of_op1_init
	__size_of_op1_init	equ	__end_of_op1_init-_op1_init
	
_op1_init:	
	opt	stack 6
; Regs used in _op1_init: [wreg]
	line	33
	
l2923:	
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
	
l2116:	
	return
	opt stack 0
GLOBAL	__end_of_op1_init
	__end_of_op1_init:
;; =============== function _op1_init ends ============

	signat	_op1_init,88
	global	_dac_init
psect	text733,local,class=CODE,delta=2
global __ptext733
__ptext733:

;; *************** function _dac_init *****************
;; Defined at:
;;		line 14 in file "C:\AK7030-OTP\periph.c"
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
psect	text733
	file	"C:\AK7030-OTP\periph.c"
	line	14
	global	__size_of_dac_init
	__size_of_dac_init	equ	__end_of_dac_init-_dac_init
	
_dac_init:	
	opt	stack 6
; Regs used in _dac_init: [wreg]
	line	15
	
l2915:	
;periph.c: 15: DACCON|=2;
	bsf	(135)^080h+(1/8),(1)&7	;volatile
	line	17
	
l2917:	
;periph.c: 17: DACR0=0x19;
	movlw	(019h)
	movwf	(136)^080h	;volatile
	line	18
	
l2919:	
;periph.c: 18: DACCON|=(1)<<2;
	bsf	(135)^080h+(2/8),(2)&7	;volatile
	line	20
;periph.c: 20: DACR1=0x06;
	movlw	(06h)
	movwf	(137)^080h	;volatile
	line	21
	
l2921:	
;periph.c: 21: DACCON|=(1)<<3;
	bsf	(135)^080h+(3/8),(3)&7	;volatile
	line	22
	
l2113:	
	return
	opt stack 0
GLOBAL	__end_of_dac_init
	__end_of_dac_init:
;; =============== function _dac_init ends ============

	signat	_dac_init,88
	global	_adConverter_config
psect	text734,local,class=CODE,delta=2
global __ptext734
__ptext734:

;; *************** function _adConverter_config *****************
;; Defined at:
;;		line 63 in file "C:\AK7030-OTP\common.c"
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
psect	text734
	file	"C:\AK7030-OTP\common.c"
	line	63
	global	__size_of_adConverter_config
	__size_of_adConverter_config	equ	__end_of_adConverter_config-_adConverter_config
	
_adConverter_config:	
	opt	stack 6
; Regs used in _adConverter_config: [wreg]
	line	64
	
l2909:	
;common.c: 64: TRISB0 = 1;
	bsf	status, 5	;RP0=1, select bank1
	bsf	(1072/8)^080h,(1072)&7
	line	65
;common.c: 65: TRISB2 = 1;
	bsf	(1074/8)^080h,(1074)&7
	line	66
	
l2911:	
;common.c: 66: ADCON0 = 0xC4;
	movlw	(0C4h)
	bcf	status, 5	;RP0=0, select bank0
	movwf	(31)	;volatile
	line	67
;common.c: 67: ADCON1 = 0xFE;
	movlw	(0FEh)
	bsf	status, 5	;RP0=1, select bank1
	movwf	(159)^080h	;volatile
	line	68
	
l2913:	
;common.c: 68: ADIE = 0;
	bcf	(1130/8)^080h,(1130)&7
	line	69
	
l1396:	
	return
	opt stack 0
GLOBAL	__end_of_adConverter_config
	__end_of_adConverter_config:
;; =============== function _adConverter_config ends ============

	signat	_adConverter_config,88
	global	_timer1_config
psect	text735,local,class=CODE,delta=2
global __ptext735
__ptext735:

;; *************** function _timer1_config *****************
;; Defined at:
;;		line 43 in file "C:\AK7030-OTP\common.c"
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
psect	text735
	file	"C:\AK7030-OTP\common.c"
	line	43
	global	__size_of_timer1_config
	__size_of_timer1_config	equ	__end_of_timer1_config-_timer1_config
	
_timer1_config:	
	opt	stack 6
; Regs used in _timer1_config: [wreg]
	line	44
	
l2907:	
;common.c: 44: T1CON = 0xC4;
	movlw	(0C4h)
	bcf	status, 5	;RP0=0, select bank0
	movwf	(16)	;volatile
	line	45
;common.c: 45: TMR1H = 0xC3;
	movlw	(0C3h)
	movwf	(15)	;volatile
	line	46
;common.c: 46: TMR1L = 0x50;
	movlw	(050h)
	movwf	(14)	;volatile
	line	48
	
l1387:	
	return
	opt stack 0
GLOBAL	__end_of_timer1_config
	__end_of_timer1_config:
;; =============== function _timer1_config ends ============

	signat	_timer1_config,88
	global	_timer1_interrupt_config
psect	text736,local,class=CODE,delta=2
global __ptext736
__ptext736:

;; *************** function _timer1_interrupt_config *****************
;; Defined at:
;;		line 56 in file "C:\AK7030-OTP\common.c"
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
psect	text736
	file	"C:\AK7030-OTP\common.c"
	line	56
	global	__size_of_timer1_interrupt_config
	__size_of_timer1_interrupt_config	equ	__end_of_timer1_interrupt_config-_timer1_interrupt_config
	
_timer1_interrupt_config:	
	opt	stack 6
; Regs used in _timer1_interrupt_config: []
	line	57
	
l2905:	
;common.c: 57: GIE = 1;
	bsf	(95/8),(95)&7
	line	58
;common.c: 58: PEIE = 1;
	bsf	(94/8),(94)&7
	line	59
;common.c: 59: TMR1IE = 1;
	bsf	status, 5	;RP0=1, select bank1
	bcf	status, 6	;RP1=0, select bank1
	bsf	(1120/8)^080h,(1120)&7
	line	60
	
l1393:	
	return
	opt stack 0
GLOBAL	__end_of_timer1_interrupt_config
	__end_of_timer1_interrupt_config:
;; =============== function _timer1_interrupt_config ends ============

	signat	_timer1_interrupt_config,88
	global	_clock_config
psect	text737,local,class=CODE,delta=2
global __ptext737
__ptext737:

;; *************** function _clock_config *****************
;; Defined at:
;;		line 35 in file "C:\AK7030-OTP\common.c"
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
psect	text737
	file	"C:\AK7030-OTP\common.c"
	line	35
	global	__size_of_clock_config
	__size_of_clock_config	equ	__end_of_clock_config-_clock_config
	
_clock_config:	
	opt	stack 6
; Regs used in _clock_config: [wreg+status,2]
	line	37
	
l2901:	
;common.c: 37: CLKPR = 0x80;
	movlw	(080h)
	bsf	status, 6	;RP1=1, select bank2
	movwf	(264)^0100h	;volatile
	line	38
	
l2903:	
;common.c: 38: CLKPR = 0x00;
	clrf	(264)^0100h	;volatile
	line	39
;common.c: 39: while(CLKPCE);
	
l1381:	
	btfsc	(2119/8)^0100h,(2119)&7
	goto	u441
	goto	u440
u441:
	goto	l1381
u440:
	line	40
	
l1384:	
	return
	opt stack 0
GLOBAL	__end_of_clock_config
	__end_of_clock_config:
;; =============== function _clock_config ends ============

	signat	_clock_config,88
	global	_ISR
psect	text738,local,class=CODE,delta=2
global __ptext738
__ptext738:

;; *************** function _ISR *****************
;; Defined at:
;;		line 310 in file "C:\AK7030-OTP\common.c"
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
psect	text738
	file	"C:\AK7030-OTP\common.c"
	line	310
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
psect	text738
	line	311
	
i1l3001:	
;common.c: 311: if(TMR1IF == 1)
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	btfss	(96/8),(96)&7
	goto	u50_21
	goto	u50_20
u50_21:
	goto	i1l1488
u50_20:
	line	313
	
i1l3003:	
;common.c: 312: {
;common.c: 313: TMR1IF = 0 ;
	bcf	(96/8),(96)&7
	line	314
	
i1l3005:	
;common.c: 314: timer.timer10msStopWatch++;
	incf	(_timer),f
	line	315
;common.c: 315: ucTimer1sCnt++;
	incf	(_ucTimer1sCnt),f
	line	317
	
i1l3007:	
;common.c: 317: if(ucTimer1sCnt >= 100)
	movlw	(064h)
	subwf	(_ucTimer1sCnt),w
	skipc
	goto	u51_21
	goto	u51_20
u51_21:
	goto	i1l3017
u51_20:
	line	319
	
i1l3009:	
;common.c: 318: {
;common.c: 319: ucTimer1sCnt = 0;
	clrf	(_ucTimer1sCnt)
	line	320
	
i1l3011:	
;common.c: 320: if(uiBigTimer > 0)
	movf	(_uiBigTimer+1),w
	iorwf	(_uiBigTimer),w
	skipnz
	goto	u52_21
	goto	u52_20
u52_21:
	goto	i1l1483
u52_20:
	line	321
	
i1l3013:	
;common.c: 321: uiBigTimer--;
	movlw	low(01h)
	subwf	(_uiBigTimer),f
	movlw	high(01h)
	skipc
	decf	(_uiBigTimer+1),f
	subwf	(_uiBigTimer+1),f
	
i1l1483:	
	line	323
;common.c: 323: if(uiSmallTimer)
	movf	(_uiSmallTimer+1),w
	iorwf	(_uiSmallTimer),w
	skipnz
	goto	u53_21
	goto	u53_20
u53_21:
	goto	i1l3017
u53_20:
	line	324
	
i1l3015:	
;common.c: 324: uiSmallTimer--;
	movlw	low(01h)
	subwf	(_uiSmallTimer),f
	movlw	high(01h)
	skipc
	decf	(_uiSmallTimer+1),f
	subwf	(_uiSmallTimer+1),f
	line	329
	
i1l3017:	
;common.c: 325: }
;common.c: 328: static unsigned int flashCnt = 0;
;common.c: 329: flashCnt++;
	incf	(ISR@flashCnt),f
	skipnz
	incf	(ISR@flashCnt+1),f
	line	330
	
i1l3019:	
;common.c: 330: if(flashCnt > 100)
	movlw	high(065h)
	subwf	(ISR@flashCnt+1),w
	movlw	low(065h)
	skipnz
	subwf	(ISR@flashCnt),w
	skipc
	goto	u54_21
	goto	u54_20
u54_21:
	goto	i1l1488
u54_20:
	line	332
	
i1l3021:	
;common.c: 331: {
;common.c: 332: PA0 = ~PA0;
	movlw	1<<((40)&7)
	xorwf	((40)/8),f
	line	333
	
i1l3023:	
;common.c: 333: flashCnt = 0;
	clrf	(ISR@flashCnt)
	clrf	(ISR@flashCnt+1)
	line	337
	
i1l1488:	
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
psect	text739,local,class=CODE,delta=2
global __ptext739
__ptext739:
	global	btemp
	btemp set 07Eh

	DABS	1,126,2	;btemp
	global	wtemp0
	wtemp0 set btemp
	end
