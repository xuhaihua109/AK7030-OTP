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
# 70 "C:\test__190531\AK7030-OTP\main.c"
	psect config,class=CONFIG,delta=2 ;#
# 70 "C:\test__190531\AK7030-OTP\main.c"
	dw 0x2FFF & 0x3FFF & 0x3FFF & 0x3FFF & 0x3FFF & 0x3FFF ;#
# 71 "C:\test__190531\AK7030-OTP\main.c"
	psect config,class=CONFIG,delta=2 ;#
# 71 "C:\test__190531\AK7030-OTP\main.c"
	dw 0x3FFF & 0x3FDF & 0x3FFF & 0x3FFE ;#
# 72 "C:\test__190531\AK7030-OTP\main.c"
	psect config,class=CONFIG,delta=2 ;#
# 72 "C:\test__190531\AK7030-OTP\main.c"
	dw 0X3FFF & 0x3FFF & 0x3FFF & 0x3FF8 ;#
	FNCALL	_main,_clock_config
	FNCALL	_main,_timer1_config
	FNCALL	_main,_timer1_interrupt_config
	FNCALL	_main,_adc_test_init
	FNCALL	_main,_dac_init
	FNCALL	_main,_op1_init
	FNCALL	_main,_op2_init
	FNCALL	_main,_adc_start
	FNCALL	_main,_isPermitSampleTime
	FNCALL	_main,_clrSampeTime
	FNCALL	_main,_process_AD_Converter_Value
	FNCALL	_main,_getAdCh14Value
	FNCALL	_main,_getAdCh4Value
	FNCALL	_process_AD_Converter_Value,_getAD_ConvertFlag
	FNCALL	_process_AD_Converter_Value,_setAD_ConvertFlag
	FNCALL	_process_AD_Converter_Value,_AD_Sample
	FNCALL	_process_AD_Converter_Value,_adc_test_init
	FNCALL	_process_AD_Converter_Value,_adc_start
	FNCALL	_AD_Sample,_getAdOriginalValue
	FNROOT	_main
	FNCALL	_ISR,i1_setAD_ConvertFlag
	FNCALL	_ISR,_adc_get
	FNCALL	intlevel1,_ISR
	global	intlevel1
	FNROOT	intlevel1
	global	_sampleChannelSelect
psect	idataBANK0,class=CODE,space=0,delta=2
global __pidataBANK0
__pidataBANK0:
	file	"C:\test__190531\AK7030-OTP\common.c"
	line	18

;initializer for _sampleChannelSelect
	retlw	0Eh
	global	_buffer_Sample_AD_Value
	global	_adc_original_value
	global	_multiFilterMaxValue
	global	_multiFilterMinValue
	global	_multiFilterSumValue
	global	_sampleCH14Value
	global	_sampleCH4Value
	global	_uiSmallTimer
	global	main@ucTimerCount
	global	_sampleTimes
	global	main@AD_sample_process_step
	global	main@ucChannel4Type
	global	main@ucLoaderStep
	global	main@ucLoaderStep1
	global	main@ucLoaderStep2
	global	main@ucLoaderStep3
	global	main@ucLoaderStep4
	global	main@ucTimerDelay
	global	main@ucTimerDelay1
	global	main@ucTimerDelay2
	global	main@ucTimerDelay3
	global	main@ucTimerDelay4
	global	_uiBigTimer
	global	ISR@ucTimer1sCnt
	global	_adc_convert_flag
	global	_timer
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
	global	_GIE
_GIE	set	95
	global	_GO
_GO	set	249
	global	_PA0
_PA0	set	40
	global	_PA1
_PA1	set	41
	global	_PA2
_PA2	set	42
	global	_PA6
_PA6	set	46
	global	_PB0
_PB0	set	48
	global	_PB1
_PB1	set	49
	global	_PEIE
_PEIE	set	94
	global	_TMR1IF
_TMR1IF	set	96
	global	_ADCON1
_ADCON1	set	159
	global	_ADRESL
_ADRESL	set	158
	global	_DACCON
_DACCON	set	135
	global	_DACR0
_DACR0	set	136
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
	global	_TRISA6
_TRISA6	set	1070
	global	_TRISA7
_TRISA7	set	1071
	global	_TRISB1
_TRISB1	set	1073
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
	global	_TRISB7
_TRISB7	set	1079
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
_uiBigTimer:
       ds      2

ISR@ucTimer1sCnt:
       ds      1

_adc_convert_flag:
       ds      1

_timer:
       ds      1

psect	bssBANK0,class=BANK0,space=1
global __pbssBANK0
__pbssBANK0:
_buffer_Sample_AD_Value:
       ds      12

_adc_original_value:
       ds      2

_multiFilterMaxValue:
       ds      2

_multiFilterMinValue:
       ds      2

_multiFilterSumValue:
       ds      2

_sampleCH14Value:
       ds      2

_sampleCH4Value:
       ds      2

_uiSmallTimer:
       ds      2

main@ucTimerCount:
       ds      2

_sampleTimes:
       ds      1

main@AD_sample_process_step:
       ds      1

main@ucChannel4Type:
       ds      1

main@ucLoaderStep:
       ds      1

main@ucLoaderStep1:
       ds      1

main@ucLoaderStep2:
       ds      1

main@ucLoaderStep3:
       ds      1

main@ucLoaderStep4:
       ds      1

main@ucTimerDelay:
       ds      1

main@ucTimerDelay1:
       ds      1

main@ucTimerDelay2:
       ds      1

main@ucTimerDelay3:
       ds      1

main@ucTimerDelay4:
       ds      1

psect	dataBANK0,class=BANK0,space=1
global __pdataBANK0
__pdataBANK0:
	file	"C:\test__190531\AK7030-OTP\common.c"
_sampleChannelSelect:
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
	clrf	((__pbssCOMMON)+3)&07Fh
	clrf	((__pbssCOMMON)+4)&07Fh
; Clear objects allocated to BANK0
psect cinit,class=CODE,delta=2
	bcf	status, 7	;select IRP bank0
	movlw	low(__pbssBANK0)
	movwf	fsr
	movlw	low((__pbssBANK0)+029h)
	fcall	clear_ram
; Initialize objects allocated to BANK0
	global __pidataBANK0
psect cinit,class=CODE,delta=2
	fcall	__pidataBANK0+0		;fetch initializer
	movwf	__pdataBANK0+0&07fh		
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
	global	?_timer1_config
?_timer1_config:	; 0 bytes @ 0x0
	global	?_timer1_interrupt_config
?_timer1_interrupt_config:	; 0 bytes @ 0x0
	global	?_dac_init
?_dac_init:	; 0 bytes @ 0x0
	global	?_op1_init
?_op1_init:	; 0 bytes @ 0x0
	global	?_op2_init
?_op2_init:	; 0 bytes @ 0x0
	global	?_adc_start
?_adc_start:	; 0 bytes @ 0x0
	global	?_clrSampeTime
?_clrSampeTime:	; 0 bytes @ 0x0
	global	?_process_AD_Converter_Value
?_process_AD_Converter_Value:	; 0 bytes @ 0x0
	global	?_AD_Sample
?_AD_Sample:	; 0 bytes @ 0x0
	global	?_main
?_main:	; 0 bytes @ 0x0
	global	?_setAD_ConvertFlag
?_setAD_ConvertFlag:	; 0 bytes @ 0x0
	global	?_ISR
?_ISR:	; 0 bytes @ 0x0
	global	?i1_setAD_ConvertFlag
?i1_setAD_ConvertFlag:	; 0 bytes @ 0x0
	global	??i1_setAD_ConvertFlag
??i1_setAD_ConvertFlag:	; 0 bytes @ 0x0
	global	?_isPermitSampleTime
?_isPermitSampleTime:	; 1 bytes @ 0x0
	global	?_getAD_ConvertFlag
?_getAD_ConvertFlag:	; 1 bytes @ 0x0
	global	?_adc_get
?_adc_get:	; 2 bytes @ 0x0
	global	i1setAD_ConvertFlag@flag
i1setAD_ConvertFlag@flag:	; 1 bytes @ 0x0
	ds	2
	global	??_adc_get
??_adc_get:	; 0 bytes @ 0x2
	global	adc_get@val
adc_get@val:	; 2 bytes @ 0x2
	ds	2
	global	??_ISR
??_ISR:	; 0 bytes @ 0x4
	ds	2
psect	cstackBANK0,class=BANK0,space=1
global __pcstackBANK0
__pcstackBANK0:
	global	??_clock_config
??_clock_config:	; 0 bytes @ 0x0
	global	??_timer1_config
??_timer1_config:	; 0 bytes @ 0x0
	global	??_timer1_interrupt_config
??_timer1_interrupt_config:	; 0 bytes @ 0x0
	global	?_adc_test_init
?_adc_test_init:	; 0 bytes @ 0x0
	global	??_dac_init
??_dac_init:	; 0 bytes @ 0x0
	global	??_op1_init
??_op1_init:	; 0 bytes @ 0x0
	global	??_op2_init
??_op2_init:	; 0 bytes @ 0x0
	global	??_adc_start
??_adc_start:	; 0 bytes @ 0x0
	global	??_isPermitSampleTime
??_isPermitSampleTime:	; 0 bytes @ 0x0
	global	??_clrSampeTime
??_clrSampeTime:	; 0 bytes @ 0x0
	global	??_getAD_ConvertFlag
??_getAD_ConvertFlag:	; 0 bytes @ 0x0
	global	??_setAD_ConvertFlag
??_setAD_ConvertFlag:	; 0 bytes @ 0x0
	global	?_getAdCh14Value
?_getAdCh14Value:	; 2 bytes @ 0x0
	global	?_getAdCh4Value
?_getAdCh4Value:	; 2 bytes @ 0x0
	global	?_getAdOriginalValue
?_getAdOriginalValue:	; 2 bytes @ 0x0
	global	setAD_ConvertFlag@flag
setAD_ConvertFlag@flag:	; 1 bytes @ 0x0
	global	adc_test_init@ref
adc_test_init@ref:	; 1 bytes @ 0x0
	ds	1
	global	??_adc_test_init
??_adc_test_init:	; 0 bytes @ 0x1
	ds	1
	global	??_getAdCh14Value
??_getAdCh14Value:	; 0 bytes @ 0x2
	global	??_getAdCh4Value
??_getAdCh4Value:	; 0 bytes @ 0x2
	global	??_AD_Sample
??_AD_Sample:	; 0 bytes @ 0x2
	global	??_getAdOriginalValue
??_getAdOriginalValue:	; 0 bytes @ 0x2
	global	adc_test_init@channel
adc_test_init@channel:	; 1 bytes @ 0x2
	ds	2
	global	AD_Sample@index
AD_Sample@index:	; 1 bytes @ 0x4
	ds	1
	global	??_process_AD_Converter_Value
??_process_AD_Converter_Value:	; 0 bytes @ 0x5
	global	??_main
??_main:	; 0 bytes @ 0x5
;;Data sizes: Strings 0, constant 0, data 1, bss 46, persistent 0 stack 0
;;Auto spaces:   Size  Autos    Used
;; COMMON          14      6      11
;; BANK0           80      5      47
;; BANK1           80      0       0
;; BANK3           96      0       0
;; BANK2           96      0       0

;;
;; Pointer list with targets:

;; ?_adc_get	unsigned int  size(1) Largest target is 0
;;
;; ?_getAdCh14Value	unsigned int  size(1) Largest target is 0
;;
;; ?_getAdCh4Value	unsigned int  size(1) Largest target is 0
;;
;; ?_getAdOriginalValue	unsigned int  size(1) Largest target is 0
;;


;;
;; Critical Paths under _main in COMMON
;;
;;   None.
;;
;; Critical Paths under _ISR in COMMON
;;
;;   _ISR->_adc_get
;;
;; Critical Paths under _main in BANK0
;;
;;   _process_AD_Converter_Value->_AD_Sample
;;   _AD_Sample->_getAdOriginalValue
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
;; (0) _main                                                 0     0      0     178
;;                       _clock_config
;;                      _timer1_config
;;            _timer1_interrupt_config
;;                      _adc_test_init
;;                           _dac_init
;;                           _op1_init
;;                           _op2_init
;;                          _adc_start
;;                 _isPermitSampleTime
;;                       _clrSampeTime
;;         _process_AD_Converter_Value
;;                     _getAdCh14Value
;;                      _getAdCh4Value
;; ---------------------------------------------------------------------------------
;; (1) _process_AD_Converter_Value                           0     0      0     134
;;                  _getAD_ConvertFlag
;;                  _setAD_ConvertFlag
;;                          _AD_Sample
;;                      _adc_test_init
;;                          _adc_start
;; ---------------------------------------------------------------------------------
;; (2) _AD_Sample                                            3     3      0      68
;;                                              2 BANK0      3     3      0
;;                 _getAdOriginalValue
;; ---------------------------------------------------------------------------------
;; (3) _getAdOriginalValue                                   2     0      2       0
;;                                              0 BANK0      2     0      2
;; ---------------------------------------------------------------------------------
;; (2) _setAD_ConvertFlag                                    1     1      0      22
;;                                              0 BANK0      1     1      0
;; ---------------------------------------------------------------------------------
;; (2) _getAD_ConvertFlag                                    0     0      0       0
;; ---------------------------------------------------------------------------------
;; (1) _getAdCh4Value                                        2     0      2       0
;;                                              0 BANK0      2     0      2
;; ---------------------------------------------------------------------------------
;; (1) _getAdCh14Value                                       2     0      2       0
;;                                              0 BANK0      2     0      2
;; ---------------------------------------------------------------------------------
;; (1) _clrSampeTime                                         0     0      0       0
;; ---------------------------------------------------------------------------------
;; (1) _isPermitSampleTime                                   0     0      0       0
;; ---------------------------------------------------------------------------------
;; (2) _adc_start                                            0     0      0       0
;; ---------------------------------------------------------------------------------
;; (1) _op2_init                                             0     0      0       0
;; ---------------------------------------------------------------------------------
;; (1) _op1_init                                             0     0      0       0
;; ---------------------------------------------------------------------------------
;; (1) _dac_init                                             0     0      0       0
;; ---------------------------------------------------------------------------------
;; (2) _adc_test_init                                        3     2      1      44
;;                                              0 BANK0      3     2      1
;; ---------------------------------------------------------------------------------
;; (1) _timer1_interrupt_config                              0     0      0       0
;; ---------------------------------------------------------------------------------
;; (1) _timer1_config                                        0     0      0       0
;; ---------------------------------------------------------------------------------
;; (1) _clock_config                                         0     0      0       0
;; ---------------------------------------------------------------------------------
;; Estimated maximum stack depth 3
;; ---------------------------------------------------------------------------------
;; (Depth) Function   	        Calls       Base Space   Used Autos Params    Refs
;; ---------------------------------------------------------------------------------
;; (4) _ISR                                                  2     2      0      97
;;                                              4 COMMON     2     2      0
;;                i1_setAD_ConvertFlag
;;                            _adc_get
;; ---------------------------------------------------------------------------------
;; (5) i1_setAD_ConvertFlag                                  1     1      0      73
;;                                              0 COMMON     1     1      0
;; ---------------------------------------------------------------------------------
;; (5) _adc_get                                              4     2      2      24
;;                                              0 COMMON     4     2      2
;; ---------------------------------------------------------------------------------
;; Estimated maximum stack depth 5
;; ---------------------------------------------------------------------------------

;; Call Graph Graphs:

;; _main (ROOT)
;;   _clock_config
;;   _timer1_config
;;   _timer1_interrupt_config
;;   _adc_test_init
;;   _dac_init
;;   _op1_init
;;   _op2_init
;;   _adc_start
;;   _isPermitSampleTime
;;   _clrSampeTime
;;   _process_AD_Converter_Value
;;     _getAD_ConvertFlag
;;     _setAD_ConvertFlag
;;     _AD_Sample
;;       _getAdOriginalValue
;;     _adc_test_init
;;     _adc_start
;;   _getAdCh14Value
;;   _getAdCh4Value
;;
;; _ISR (ROOT)
;;   i1_setAD_ConvertFlag
;;   _adc_get
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
;;DATA                 0      0      41       6        0.0%
;;ABS                  0      0      3A       3        0.0%
;;NULL                 0      0       0       0        0.0%
;;STACK                0      0       7       2        0.0%
;;BANK0               50      5      2F       5       58.8%
;;BITBANK0            50      0       0       4        0.0%
;;SFR0                 0      0       0       1        0.0%
;;BITSFR0              0      0       0       1        0.0%
;;COMMON               E      6       B       1       78.6%
;;BITCOMMON            E      0       0       0        0.0%

	global	_main
psect	maintext,global,class=CODE,delta=2
global __pmaintext
__pmaintext:

;; *************** function _main *****************
;; Defined at:
;;		line 84 in file "C:\test__190531\AK7030-OTP\main.c"
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
;;		_timer1_config
;;		_timer1_interrupt_config
;;		_adc_test_init
;;		_dac_init
;;		_op1_init
;;		_op2_init
;;		_adc_start
;;		_isPermitSampleTime
;;		_clrSampeTime
;;		_process_AD_Converter_Value
;;		_getAdCh14Value
;;		_getAdCh4Value
;; This function is called by:
;;		Startup code after reset
;; This function uses a non-reentrant model
;;
psect	maintext
	file	"C:\test__190531\AK7030-OTP\main.c"
	line	84
	global	__size_of_main
	__size_of_main	equ	__end_of_main-_main
	
_main:	
	opt	stack 3
; Regs used in _main: [wreg-fsr0h+status,2+status,0+pclath+cstack]
	line	118
	
l3473:	
;main.c: 85: enum step
;main.c: 86: {
;main.c: 87: SENSE_PB2_INPUT_VOLTAGE = 0,
;main.c: 88: SENSE_PB2_DURATION_ONE_SECOND,
;main.c: 89: SENSE_PB2_INPUT_VOLTAGE__AGAIN,
;main.c: 90: SENSE_PB2_DURATION__SECOND,
;main.c: 91: SET_PA2_VALUE,
;main.c: 92: ADC1_VALUE_MEET_CONDITION,
;main.c: 93: PROCESS_AD_VALUE,
;main.c: 94: WAIT_SET_TIME_FINISHED,
;main.c: 95: SET_TIME_BE_FINISHED,
;main.c: 96: CHECKING_PULL_OUT_BATTERY,
;main.c: 97: CHECKING_INSTALLED_BATTERY,
;main.c: 98: };
;main.c: 100: enum workTimerType
;main.c: 101: {
	bsf	status, 5	;RP0=1, select bank1
	bcf	(1064/8)^080h,(1064)&7
	line	119
;main.c: 119: TRISA1 = 0;
	bcf	(1065/8)^080h,(1065)&7
	line	120
;main.c: 120: TRISA3 = 0;
	bcf	(1067/8)^080h,(1067)&7
	line	121
;main.c: 121: TRISA2 = 0;
	bcf	(1066/8)^080h,(1066)&7
	line	122
;main.c: 122: TRISA6 = 0;
	bcf	(1070/8)^080h,(1070)&7
	line	123
;main.c: 123: PA2 = 1;
	bcf	status, 5	;RP0=0, select bank0
	bsf	(42/8),(42)&7
	line	124
;main.c: 124: PA0 = 1;
	bsf	(40/8),(40)&7
	line	126
;main.c: 126: TRISB2 = 1;
	bsf	status, 5	;RP0=1, select bank1
	bsf	(1074/8)^080h,(1074)&7
	line	128
;main.c: 128: TRISB1 = 1;
	bsf	(1073/8)^080h,(1073)&7
	line	129
;main.c: 129: TRISB4 = 1;
	bsf	(1076/8)^080h,(1076)&7
	line	131
	
l3475:	
;main.c: 131: clock_config();
	fcall	_clock_config
	line	132
;main.c: 132: timer1_config();
	fcall	_timer1_config
	line	133
	
l3477:	
;main.c: 133: timer1_interrupt_config();
	fcall	_timer1_interrupt_config
	line	135
	
l3479:	
;main.c: 135: adc_test_init(14,3);
	movlw	(03h)
	bcf	status, 5	;RP0=0, select bank0
	movwf	(?_adc_test_init)
	movlw	(0Eh)
	fcall	_adc_test_init
	line	137
	
l3481:	
;main.c: 137: dac_init();
	fcall	_dac_init
	line	138
	
l3483:	
;main.c: 138: op1_init();
	fcall	_op1_init
	line	139
	
l3485:	
;main.c: 139: op2_init();
	fcall	_op2_init
	line	142
	
l3487:	
;main.c: 142: adc_start();
	fcall	_adc_start
	line	154
	
l3489:	
# 154 "C:\test__190531\AK7030-OTP\main.c"
 clrwdt ;#
psect	maintext
	line	156
	
l3491:	
;main.c: 156: if(isPermitSampleTime())
	fcall	_isPermitSampleTime
	xorlw	0
	skipnz
	goto	u661
	goto	u660
u661:
	goto	l3489
u660:
	line	158
	
l3493:	
;main.c: 157: {
;main.c: 158: clrSampeTime();
	fcall	_clrSampeTime
	line	159
	
l3495:	
;main.c: 159: process_AD_Converter_Value();
	fcall	_process_AD_Converter_Value
	line	161
;main.c: 161: switch(AD_sample_process_step)
	goto	l3805
	line	166
	
l3497:	
;main.c: 164: {
;main.c: 165: static unsigned ucTimerCount = 0;
;main.c: 166: if(getAdCh14Value() > 1951)
	fcall	_getAdCh14Value
	movlw	high(07A0h)
	subwf	(1+(?_getAdCh14Value)),w
	movlw	low(07A0h)
	skipnz
	subwf	(0+(?_getAdCh14Value)),w
	skipc
	goto	u671
	goto	u670
u671:
	goto	l3501
u670:
	line	168
	
l3499:	
;main.c: 167: {
;main.c: 168: ucTimerCount++;
	incf	(main@ucTimerCount),f
	skipnz
	incf	(main@ucTimerCount+1),f
	line	169
;main.c: 169: }
	goto	l3503
	line	171
	
l3501:	
;main.c: 170: else
;main.c: 171: ucTimerCount = 0;
	clrf	(main@ucTimerCount)
	clrf	(main@ucTimerCount+1)
	line	173
	
l3503:	
;main.c: 173: if(ucTimerCount >= 10)
	movlw	high(0Ah)
	subwf	(main@ucTimerCount+1),w
	movlw	low(0Ah)
	skipnz
	subwf	(main@ucTimerCount),w
	skipc
	goto	u681
	goto	u680
u681:
	goto	l3489
u680:
	line	174
	
l3505:	
;main.c: 174: AD_sample_process_step++;
	incf	(main@AD_sample_process_step),f
	goto	l3489
	line	179
;main.c: 177: }
;main.c: 179: case 1:
	
l685:	
	line	182
;main.c: 180: {
;main.c: 182: PA6 = 1;
	bsf	(46/8),(46)&7
	goto	l3505
	line	191
	
l3509:	
;main.c: 189: {
;main.c: 191: if(getAdCh4Value() < 1911)
	fcall	_getAdCh4Value
	movlw	high(0777h)
	subwf	(1+(?_getAdCh4Value)),w
	movlw	low(0777h)
	skipnz
	subwf	(0+(?_getAdCh4Value)),w
	skipnc
	goto	u691
	goto	u690
u691:
	goto	l3513
u690:
	line	193
	
l3511:	
;main.c: 192: {
;main.c: 193: ucChannel4Type = 0;
	clrf	(main@ucChannel4Type)
	line	195
;main.c: 195: }
	goto	l3505
	line	196
	
l3513:	
;main.c: 196: else if(getAdCh4Value() < 2067)
	fcall	_getAdCh4Value
	movlw	high(0813h)
	subwf	(1+(?_getAdCh4Value)),w
	movlw	low(0813h)
	skipnz
	subwf	(0+(?_getAdCh4Value)),w
	skipnc
	goto	u701
	goto	u700
u701:
	goto	l3517
u700:
	line	198
	
l3515:	
;main.c: 197: {
;main.c: 198: ucChannel4Type = 1;
	clrf	(main@ucChannel4Type)
	incf	(main@ucChannel4Type),f
	line	199
;main.c: 199: }
	goto	l3505
	line	200
	
l3517:	
;main.c: 200: else if(getAdCh4Value() < 2204)
	fcall	_getAdCh4Value
	movlw	high(089Ch)
	subwf	(1+(?_getAdCh4Value)),w
	movlw	low(089Ch)
	skipnz
	subwf	(0+(?_getAdCh4Value)),w
	skipnc
	goto	u711
	goto	u710
u711:
	goto	l3521
u710:
	line	202
	
l3519:	
;main.c: 201: {
;main.c: 202: ucChannel4Type = 2;
	movlw	(02h)
	movwf	(main@ucChannel4Type)
	line	203
;main.c: 203: }
	goto	l3505
	line	204
	
l3521:	
;main.c: 204: else if(getAdCh4Value() < 2340)
	fcall	_getAdCh4Value
	movlw	high(0924h)
	subwf	(1+(?_getAdCh4Value)),w
	movlw	low(0924h)
	skipnz
	subwf	(0+(?_getAdCh4Value)),w
	skipnc
	goto	u721
	goto	u720
u721:
	goto	l3525
u720:
	line	206
	
l3523:	
;main.c: 205: {
;main.c: 206: ucChannel4Type = 3;
	movlw	(03h)
	movwf	(main@ucChannel4Type)
	line	207
;main.c: 207: }
	goto	l3505
	line	210
	
l3525:	
;main.c: 208: else
;main.c: 209: {
;main.c: 210: ucChannel4Type = 4;
	movlw	(04h)
	movwf	(main@ucChannel4Type)
	goto	l3505
	line	229
;main.c: 228: {
;main.c: 229: case 0:
	
l703:	
	line	231
;main.c: 230: {
;main.c: 231: PA2 = 1;
	bsf	(42/8),(42)&7
	line	232
	
l3529:	
;main.c: 232: ucLoaderStep++;
	incf	(main@ucLoaderStep),f
	line	233
;main.c: 233: break;
	goto	l3489
	line	238
	
l3531:	
;main.c: 237: {
;main.c: 238: if(ucTimerDelay >= 5)
	movlw	(05h)
	subwf	(main@ucTimerDelay),w
	skipc
	goto	u731
	goto	u730
u731:
	goto	l3539
u730:
	line	240
	
l3533:	
;main.c: 239: {
;main.c: 240: PA1 = 1;
	bsf	(41/8),(41)&7
	line	241
	
l3535:	
;main.c: 241: ucTimerDelay = 0;
	clrf	(main@ucTimerDelay)
	goto	l3529
	line	245
	
l3539:	
;main.c: 244: else
;main.c: 245: ucTimerDelay++;
	incf	(main@ucTimerDelay),f
	goto	l3489
	line	251
	
l3541:	
;main.c: 250: {
;main.c: 251: if(ucTimerDelay >= 5)
	movlw	(05h)
	subwf	(main@ucTimerDelay),w
	skipc
	goto	u741
	goto	u740
u741:
	goto	l3539
u740:
	line	253
	
l3543:	
;main.c: 252: {
;main.c: 253: PA0= 1;
	bsf	(40/8),(40)&7
	goto	l3535
	line	266
	
l3551:	
;main.c: 265: {
;main.c: 266: if(ucTimerDelay >= 5)
	movlw	(05h)
	subwf	(main@ucTimerDelay),w
	skipc
	goto	u751
	goto	u750
u751:
	goto	l3539
u750:
	line	268
	
l3553:	
;main.c: 267: {
;main.c: 268: PB0 = 1;
	bsf	(48/8),(48)&7
	goto	l3535
	line	279
	
l3561:	
;main.c: 278: {
;main.c: 279: if(ucTimerDelay >= 5)
	movlw	(05h)
	subwf	(main@ucTimerDelay),w
	skipc
	goto	u761
	goto	u760
u761:
	goto	l3539
u760:
	line	281
	
l3563:	
;main.c: 280: {
;main.c: 281: PB1 = 1;
	bsf	(49/8),(49)&7
	goto	l3535
	line	292
	
l3571:	
;main.c: 291: {
;main.c: 292: if(ucTimerDelay >= 5)
	movlw	(05h)
	subwf	(main@ucTimerDelay),w
	skipc
	goto	u771
	goto	u770
u771:
	goto	l3539
u770:
	line	294
	
l3573:	
;main.c: 293: {
;main.c: 294: PA2 = 0;
	bcf	(42/8),(42)&7
	line	295
;main.c: 295: PA1 = 0;
	bcf	(41/8),(41)&7
	line	296
;main.c: 296: PA0 = 0;
	bcf	(40/8),(40)&7
	line	297
;main.c: 297: PB0 = 0;
	bcf	(48/8),(48)&7
	line	298
;main.c: 298: PB1 = 0;
	bcf	(49/8),(49)&7
	goto	l3535
	line	309
	
l3581:	
;main.c: 308: {
;main.c: 309: if(ucTimerDelay >= 5)
	movlw	(05h)
	subwf	(main@ucTimerDelay),w
	skipc
	goto	u781
	goto	u780
u781:
	goto	l3539
u780:
	line	311
	
l3583:	
;main.c: 310: {
;main.c: 311: ucTimerDelay = 0;
	clrf	(main@ucTimerDelay)
	line	312
	
l3585:	
;main.c: 312: AD_sample_process_step = 2;
	movlw	(02h)
	movwf	(main@AD_sample_process_step)
	line	313
	
l3587:	
;main.c: 313: ucLoaderStep = 0;
	clrf	(main@ucLoaderStep)
	line	314
;main.c: 314: }
	goto	l3489
	line	227
	
l3593:	
	movf	(main@ucLoaderStep),w
	; Switch size 1, requested type "space"
; Number of cases is 7, Range of values is 0 to 6
; switch strategies available:
; Name         Instructions Cycles
; direct_byte           21     7 (fixed)
; simple_byte           22    12 (average)
; jumptable            260     6 (fixed)
; rangetable            11     6 (fixed)
; spacedrange           20     9 (fixed)
; locatedrange           7     3 (fixed)
;	Chosen strategy is direct_byte

	movwf fsr
	movlw	7
	subwf	fsr,w
skipnc
goto l676
movlw high(S3987)
movwf pclath
	clrc
	rlf fsr,w
	addlw low(S3987)
	movwf pc
psect	swtext1,local,class=CONST,delta=2
global __pswtext1
__pswtext1:
S3987:
	ljmp	l703
	ljmp	l3531
	ljmp	l3541
	ljmp	l3551
	ljmp	l3561
	ljmp	l3571
	ljmp	l3581
psect	maintext

	line	334
;main.c: 333: {
;main.c: 334: case 0:
	
l731:	
	line	336
;main.c: 335: {
;main.c: 336: PA2 = 1;
	bsf	(42/8),(42)&7
	line	337
	
l3595:	
;main.c: 337: ucLoaderStep1++;
	incf	(main@ucLoaderStep1),f
	line	338
;main.c: 338: break;
	goto	l3489
	line	343
	
l3597:	
;main.c: 342: {
;main.c: 343: if(ucTimerDelay1 >= 5)
	movlw	(05h)
	subwf	(main@ucTimerDelay1),w
	skipc
	goto	u791
	goto	u790
u791:
	goto	l3605
u790:
	line	345
	
l3599:	
;main.c: 344: {
;main.c: 345: PA1 = 1;
	bsf	(41/8),(41)&7
	line	346
	
l3601:	
;main.c: 346: ucTimerDelay1 = 0;
	clrf	(main@ucTimerDelay1)
	goto	l3595
	line	350
	
l3605:	
;main.c: 349: else
;main.c: 350: ucTimerDelay1++;
	incf	(main@ucTimerDelay1),f
	goto	l3489
	line	356
	
l3607:	
;main.c: 355: {
;main.c: 356: if(ucTimerDelay1 >= 5)
	movlw	(05h)
	subwf	(main@ucTimerDelay1),w
	skipc
	goto	u801
	goto	u800
u801:
	goto	l3605
u800:
	line	358
	
l3609:	
;main.c: 357: {
;main.c: 358: PA0 = 1;
	bsf	(40/8),(40)&7
	goto	l3601
	line	369
	
l3617:	
;main.c: 368: {
;main.c: 369: if(ucTimerDelay1 >= 5)
	movlw	(05h)
	subwf	(main@ucTimerDelay1),w
	skipc
	goto	u811
	goto	u810
u811:
	goto	l3605
u810:
	line	371
	
l3619:	
;main.c: 370: {
;main.c: 371: PB0 = 1;
	bsf	(48/8),(48)&7
	goto	l3601
	line	382
	
l3627:	
;main.c: 381: {
;main.c: 382: if(ucTimerDelay1 >= 5)
	movlw	(05h)
	subwf	(main@ucTimerDelay1),w
	skipc
	goto	u821
	goto	u820
u821:
	goto	l3605
u820:
	line	384
	
l3629:	
;main.c: 383: {
;main.c: 384: PB1 = 1;
	bsf	(49/8),(49)&7
	goto	l3601
	line	395
	
l3637:	
;main.c: 394: {
;main.c: 395: if(ucTimerDelay1 >= 5)
	movlw	(05h)
	subwf	(main@ucTimerDelay1),w
	skipc
	goto	u831
	goto	u830
u831:
	goto	l3605
u830:
	line	397
	
l3639:	
;main.c: 396: {
;main.c: 397: PA1 = 0;
	bcf	(41/8),(41)&7
	line	398
;main.c: 398: PA0 = 0;
	bcf	(40/8),(40)&7
	line	399
;main.c: 399: PB0 = 0;
	bcf	(48/8),(48)&7
	line	400
;main.c: 400: PB1 = 0;
	bcf	(49/8),(49)&7
	goto	l3601
	line	411
	
l3647:	
;main.c: 410: {
;main.c: 411: if(ucTimerDelay1 >= 5)
	movlw	(05h)
	subwf	(main@ucTimerDelay1),w
	skipc
	goto	u841
	goto	u840
u841:
	goto	l3605
u840:
	line	413
	
l3649:	
;main.c: 412: {
;main.c: 413: ucTimerDelay1 = 0;
	clrf	(main@ucTimerDelay1)
	line	414
	
l3651:	
;main.c: 414: AD_sample_process_step = 2;
	movlw	(02h)
	movwf	(main@AD_sample_process_step)
	line	415
	
l3653:	
;main.c: 415: ucLoaderStep1 = 0;
	clrf	(main@ucLoaderStep1)
	line	416
;main.c: 416: }
	goto	l3489
	line	332
	
l3659:	
	movf	(main@ucLoaderStep1),w
	; Switch size 1, requested type "space"
; Number of cases is 7, Range of values is 0 to 6
; switch strategies available:
; Name         Instructions Cycles
; direct_byte           21     7 (fixed)
; simple_byte           22    12 (average)
; jumptable            260     6 (fixed)
; rangetable            11     6 (fixed)
; spacedrange           20     9 (fixed)
; locatedrange           7     3 (fixed)
;	Chosen strategy is direct_byte

	movwf fsr
	movlw	7
	subwf	fsr,w
skipnc
goto l676
movlw high(S3989)
movwf pclath
	clrc
	rlf fsr,w
	addlw low(S3989)
	movwf pc
psect	swtext2,local,class=CONST,delta=2
global __pswtext2
__pswtext2:
S3989:
	ljmp	l731
	ljmp	l3597
	ljmp	l3607
	ljmp	l3617
	ljmp	l3627
	ljmp	l3637
	ljmp	l3647
psect	maintext

	line	437
;main.c: 436: {
;main.c: 437: case 0:
	
l758:	
	line	439
;main.c: 438: {
;main.c: 439: PA2 = 1;
	bsf	(42/8),(42)&7
	line	440
;main.c: 440: PA1 = 1;
	bsf	(41/8),(41)&7
	line	441
	
l3661:	
;main.c: 441: ucLoaderStep2++;
	incf	(main@ucLoaderStep2),f
	line	442
;main.c: 442: break;
	goto	l3489
	line	447
	
l3663:	
;main.c: 446: {
;main.c: 447: if(ucTimerDelay2 >= 5)
	movlw	(05h)
	subwf	(main@ucTimerDelay2),w
	skipc
	goto	u851
	goto	u850
u851:
	goto	l3671
u850:
	line	449
	
l3665:	
;main.c: 448: {
;main.c: 449: PA0 = 1;
	bsf	(40/8),(40)&7
	line	450
	
l3667:	
;main.c: 450: ucTimerDelay2 = 0;
	clrf	(main@ucTimerDelay2)
	goto	l3661
	line	454
	
l3671:	
;main.c: 453: else
;main.c: 454: ucTimerDelay2++;
	incf	(main@ucTimerDelay2),f
	goto	l3489
	line	460
	
l3673:	
;main.c: 459: {
;main.c: 460: if(ucTimerDelay2 >= 5)
	movlw	(05h)
	subwf	(main@ucTimerDelay2),w
	skipc
	goto	u861
	goto	u860
u861:
	goto	l3671
u860:
	line	462
	
l3675:	
;main.c: 461: {
;main.c: 462: PB0 = 1;
	bsf	(48/8),(48)&7
	goto	l3667
	line	473
	
l3683:	
;main.c: 472: {
;main.c: 473: if(ucTimerDelay2 >= 5)
	movlw	(05h)
	subwf	(main@ucTimerDelay2),w
	skipc
	goto	u871
	goto	u870
u871:
	goto	l3671
u870:
	line	475
	
l3685:	
;main.c: 474: {
;main.c: 475: PB1 = 1;
	bsf	(49/8),(49)&7
	goto	l3667
	line	486
	
l3693:	
;main.c: 485: {
;main.c: 486: if(ucTimerDelay2 >= 5)
	movlw	(05h)
	subwf	(main@ucTimerDelay2),w
	skipc
	goto	u881
	goto	u880
u881:
	goto	l3671
u880:
	line	489
	
l3695:	
;main.c: 487: {
;main.c: 489: PA0 = 0;
	bcf	(40/8),(40)&7
	line	490
;main.c: 490: PB0 = 0;
	bcf	(48/8),(48)&7
	line	491
;main.c: 491: PB1 = 0;
	bcf	(49/8),(49)&7
	goto	l3667
	line	502
	
l3703:	
;main.c: 501: {
;main.c: 502: if(ucTimerDelay2 >= 5)
	movlw	(05h)
	subwf	(main@ucTimerDelay2),w
	skipc
	goto	u891
	goto	u890
u891:
	goto	l3671
u890:
	line	504
	
l3705:	
;main.c: 503: {
;main.c: 504: ucTimerDelay2 = 0;
	clrf	(main@ucTimerDelay2)
	line	505
	
l3707:	
;main.c: 505: AD_sample_process_step = 2;
	movlw	(02h)
	movwf	(main@AD_sample_process_step)
	line	506
	
l3709:	
;main.c: 506: ucLoaderStep2 = 0;
	clrf	(main@ucLoaderStep2)
	line	507
;main.c: 507: }
	goto	l3489
	line	435
	
l3715:	
	movf	(main@ucLoaderStep2),w
	; Switch size 1, requested type "space"
; Number of cases is 6, Range of values is 0 to 5
; switch strategies available:
; Name         Instructions Cycles
; direct_byte           19     7 (fixed)
; simple_byte           19    10 (average)
; jumptable            260     6 (fixed)
; rangetable            10     6 (fixed)
; spacedrange           18     9 (fixed)
; locatedrange           6     3 (fixed)
;	Chosen strategy is direct_byte

	movwf fsr
	movlw	6
	subwf	fsr,w
skipnc
goto l676
movlw high(S3991)
movwf pclath
	clrc
	rlf fsr,w
	addlw low(S3991)
	movwf pc
psect	swtext3,local,class=CONST,delta=2
global __pswtext3
__pswtext3:
S3991:
	ljmp	l758
	ljmp	l3663
	ljmp	l3673
	ljmp	l3683
	ljmp	l3693
	ljmp	l3703
psect	maintext

	line	528
;main.c: 527: {
;main.c: 528: case 0:
	
l782:	
	line	530
;main.c: 529: {
;main.c: 530: PA2 = 1;
	bsf	(42/8),(42)&7
	line	531
;main.c: 531: PA1 = 1;
	bsf	(41/8),(41)&7
	line	532
;main.c: 532: PA0 = 1;
	bsf	(40/8),(40)&7
	line	533
	
l3717:	
;main.c: 533: ucLoaderStep3++;
	incf	(main@ucLoaderStep3),f
	line	534
;main.c: 534: break;
	goto	l3489
	line	539
	
l3719:	
;main.c: 538: {
;main.c: 539: if(ucTimerDelay3 >= 5)
	movlw	(05h)
	subwf	(main@ucTimerDelay3),w
	skipc
	goto	u901
	goto	u900
u901:
	goto	l3727
u900:
	line	541
	
l3721:	
;main.c: 540: {
;main.c: 541: PB0 = 1;
	bsf	(48/8),(48)&7
	line	542
	
l3723:	
;main.c: 542: ucTimerDelay3 = 0;
	clrf	(main@ucTimerDelay3)
	goto	l3717
	line	546
	
l3727:	
;main.c: 545: else
;main.c: 546: ucTimerDelay3++;
	incf	(main@ucTimerDelay3),f
	goto	l3489
	line	552
	
l3729:	
;main.c: 551: {
;main.c: 552: if(ucTimerDelay3 >= 5)
	movlw	(05h)
	subwf	(main@ucTimerDelay3),w
	skipc
	goto	u911
	goto	u910
u911:
	goto	l3727
u910:
	line	554
	
l3731:	
;main.c: 553: {
;main.c: 554: PB1 = 1;
	bsf	(49/8),(49)&7
	goto	l3723
	line	566
	
l3739:	
;main.c: 565: {
;main.c: 566: if(ucTimerDelay3 >= 5)
	movlw	(05h)
	subwf	(main@ucTimerDelay3),w
	skipc
	goto	u921
	goto	u920
u921:
	goto	l3727
u920:
	line	569
	
l3741:	
;main.c: 567: {
;main.c: 569: PB0 = 0;
	bcf	(48/8),(48)&7
	line	570
;main.c: 570: PB1 = 0;
	bcf	(49/8),(49)&7
	goto	l3723
	line	581
	
l3749:	
;main.c: 580: {
;main.c: 581: if(ucTimerDelay3 >= 5)
	movlw	(05h)
	subwf	(main@ucTimerDelay3),w
	skipc
	goto	u931
	goto	u930
u931:
	goto	l3727
u930:
	line	583
	
l3751:	
;main.c: 582: {
;main.c: 583: ucTimerDelay3 = 0;
	clrf	(main@ucTimerDelay3)
	line	584
	
l3753:	
;main.c: 584: AD_sample_process_step = 2;
	movlw	(02h)
	movwf	(main@AD_sample_process_step)
	line	585
	
l3755:	
;main.c: 585: ucLoaderStep3 = 0;
	clrf	(main@ucLoaderStep3)
	line	586
;main.c: 586: }
	goto	l3489
	line	526
	
l3761:	
	movf	(main@ucLoaderStep3),w
	; Switch size 1, requested type "space"
; Number of cases is 5, Range of values is 0 to 4
; switch strategies available:
; Name         Instructions Cycles
; simple_byte           16     9 (average)
; direct_byte           17     7 (fixed)
; jumptable            260     6 (fixed)
; rangetable             9     6 (fixed)
; spacedrange           16     9 (fixed)
; locatedrange           5     3 (fixed)
;	Chosen strategy is simple_byte

	opt asmopt_off
	xorlw	0^0	; case 0
	skipnz
	goto	l782
	xorlw	1^0	; case 1
	skipnz
	goto	l3719
	xorlw	2^1	; case 2
	skipnz
	goto	l3729
	xorlw	3^2	; case 3
	skipnz
	goto	l3739
	xorlw	4^3	; case 4
	skipnz
	goto	l3749
	goto	l676
	opt asmopt_on

	line	607
;main.c: 606: {
;main.c: 607: case 0:
	
l803:	
	line	609
;main.c: 608: {
;main.c: 609: PA2 = 1;
	bsf	(42/8),(42)&7
	line	610
;main.c: 610: PA1 = 1;
	bsf	(41/8),(41)&7
	line	611
;main.c: 611: PA0 = 1;
	bsf	(40/8),(40)&7
	line	612
;main.c: 612: PB0 = 1;
	bsf	(48/8),(48)&7
	line	613
	
l3763:	
;main.c: 613: ucLoaderStep4++;
	incf	(main@ucLoaderStep4),f
	line	614
;main.c: 614: break;
	goto	l3489
	line	619
	
l3765:	
;main.c: 618: {
;main.c: 619: if(ucTimerDelay4 >= 5)
	movlw	(05h)
	subwf	(main@ucTimerDelay4),w
	skipc
	goto	u941
	goto	u940
u941:
	goto	l3773
u940:
	line	621
	
l3767:	
;main.c: 620: {
;main.c: 621: PB1 = 1;
	bsf	(49/8),(49)&7
	line	622
	
l3769:	
;main.c: 622: ucTimerDelay4 = 0;
	clrf	(main@ucTimerDelay4)
	goto	l3763
	line	626
	
l3773:	
;main.c: 625: else
;main.c: 626: ucTimerDelay4++;
	incf	(main@ucTimerDelay4),f
	goto	l3489
	line	632
	
l3775:	
;main.c: 631: {
;main.c: 632: if(ucTimerDelay4 >= 5)
	movlw	(05h)
	subwf	(main@ucTimerDelay4),w
	skipc
	goto	u951
	goto	u950
u951:
	goto	l3773
u950:
	line	634
	
l3777:	
;main.c: 633: {
;main.c: 634: PB1 = 0;
	bcf	(49/8),(49)&7
	goto	l3769
	line	645
	
l3785:	
;main.c: 644: {
;main.c: 645: if(ucTimerDelay4 >= 5)
	movlw	(05h)
	subwf	(main@ucTimerDelay4),w
	skipc
	goto	u961
	goto	u960
u961:
	goto	l3773
u960:
	line	647
	
l3787:	
;main.c: 646: {
;main.c: 647: ucTimerDelay4 = 0;
	clrf	(main@ucTimerDelay4)
	line	648
	
l3789:	
;main.c: 648: AD_sample_process_step = 2;
	movlw	(02h)
	movwf	(main@AD_sample_process_step)
	line	649
	
l3791:	
;main.c: 649: ucLoaderStep4 = 0;
	clrf	(main@ucLoaderStep4)
	line	650
;main.c: 650: }
	goto	l3489
	line	605
	
l3797:	
	movf	(main@ucLoaderStep4),w
	; Switch size 1, requested type "space"
; Number of cases is 4, Range of values is 0 to 3
; switch strategies available:
; Name         Instructions Cycles
; simple_byte           13     7 (average)
; direct_byte           15     7 (fixed)
; jumptable            260     6 (fixed)
; rangetable             8     6 (fixed)
; spacedrange           14     9 (fixed)
; locatedrange           4     3 (fixed)
;	Chosen strategy is simple_byte

	opt asmopt_off
	xorlw	0^0	; case 0
	skipnz
	goto	l803
	xorlw	1^0	; case 1
	skipnz
	goto	l3765
	xorlw	2^1	; case 2
	skipnz
	goto	l3775
	xorlw	3^2	; case 3
	skipnz
	goto	l3785
	goto	l676
	opt asmopt_on

	line	220
	
l3801:	
	movf	(main@ucChannel4Type),w
	; Switch size 1, requested type "space"
; Number of cases is 5, Range of values is 0 to 4
; switch strategies available:
; Name         Instructions Cycles
; simple_byte           16     9 (average)
; direct_byte           17     7 (fixed)
; jumptable            260     6 (fixed)
; rangetable             9     6 (fixed)
; spacedrange           16     9 (fixed)
; locatedrange           5     3 (fixed)
;	Chosen strategy is simple_byte

	opt asmopt_off
	xorlw	0^0	; case 0
	skipnz
	goto	l3593
	xorlw	1^0	; case 1
	skipnz
	goto	l3659
	xorlw	2^1	; case 2
	skipnz
	goto	l3715
	xorlw	3^2	; case 3
	skipnz
	goto	l3761
	xorlw	4^3	; case 4
	skipnz
	goto	l3797
	goto	l676
	opt asmopt_on

	line	161
	
l3805:	
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	movf	(main@AD_sample_process_step),w
	; Switch size 1, requested type "space"
; Number of cases is 4, Range of values is 0 to 3
; switch strategies available:
; Name         Instructions Cycles
; simple_byte           13     7 (average)
; direct_byte           15     7 (fixed)
; jumptable            260     6 (fixed)
; rangetable             8     6 (fixed)
; spacedrange           14     9 (fixed)
; locatedrange           4     3 (fixed)
;	Chosen strategy is simple_byte

	opt asmopt_off
	xorlw	0^0	; case 0
	skipnz
	goto	l3497
	xorlw	1^0	; case 1
	skipnz
	goto	l685
	xorlw	2^1	; case 2
	skipnz
	goto	l3509
	xorlw	3^2	; case 3
	skipnz
	goto	l3801
	goto	l676
	opt asmopt_on

	line	919
	
l676:	
	goto	l3489
	global	start
	ljmp	start
	opt stack 0
psect	maintext
	line	923
GLOBAL	__end_of_main
	__end_of_main:
;; =============== function _main ends ============

	signat	_main,88
	global	_process_AD_Converter_Value
psect	text414,local,class=CODE,delta=2
global __ptext414
__ptext414:

;; *************** function _process_AD_Converter_Value *****************
;; Defined at:
;;		line 100 in file "C:\test__190531\AK7030-OTP\common.c"
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
;;		On exit  : 0/0
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
;;		_getAD_ConvertFlag
;;		_setAD_ConvertFlag
;;		_AD_Sample
;;		_adc_test_init
;;		_adc_start
;; This function is called by:
;;		_main
;; This function uses a non-reentrant model
;;
psect	text414
	file	"C:\test__190531\AK7030-OTP\common.c"
	line	100
	global	__size_of_process_AD_Converter_Value
	__size_of_process_AD_Converter_Value	equ	__end_of_process_AD_Converter_Value-_process_AD_Converter_Value
	
_process_AD_Converter_Value:	
	opt	stack 3
; Regs used in _process_AD_Converter_Value: [wreg-fsr0h+status,2+status,0+pclath+cstack]
	line	101
	
l3459:	
;common.c: 101: if(getAD_ConvertFlag())
	fcall	_getAD_ConvertFlag
	xorlw	0
	skipnz
	goto	u641
	goto	u640
u641:
	goto	l1519
u640:
	line	103
	
l3461:	
;common.c: 102: {
;common.c: 103: setAD_ConvertFlag(0);
	movlw	(0)
	fcall	_setAD_ConvertFlag
	line	104
	
l3463:	
;common.c: 104: AD_Sample();
	fcall	_AD_Sample
	line	105
	
l3465:	
;common.c: 105: if(4 == sampleChannelSelect)
	movf	(_sampleChannelSelect),w
	xorlw	04h
	skipz
	goto	u651
	goto	u650
u651:
	goto	l3469
u650:
	line	106
	
l3467:	
;common.c: 106: adc_test_init(4,3);
	movlw	(03h)
	movwf	(?_adc_test_init)
	movlw	(04h)
	fcall	_adc_test_init
	goto	l3471
	line	108
	
l3469:	
;common.c: 107: else
;common.c: 108: adc_test_init(14,3);
	movlw	(03h)
	movwf	(?_adc_test_init)
	movlw	(0Eh)
	fcall	_adc_test_init
	line	110
	
l3471:	
;common.c: 110: adc_start();
	fcall	_adc_start
	line	112
	
l1519:	
	return
	opt stack 0
GLOBAL	__end_of_process_AD_Converter_Value
	__end_of_process_AD_Converter_Value:
;; =============== function _process_AD_Converter_Value ends ============

	signat	_process_AD_Converter_Value,88
	global	_AD_Sample
psect	text415,local,class=CODE,delta=2
global __ptext415
__ptext415:

;; *************** function _AD_Sample *****************
;; Defined at:
;;		line 124 in file "C:\test__190531\AK7030-OTP\common.c"
;; Parameters:    Size  Location     Type
;;		None
;; Auto vars:     Size  Location     Type
;;  index           1    4[BANK0 ] unsigned char 
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
;;      Locals:         0       1       0       0       0
;;      Temps:          0       2       0       0       0
;;      Totals:         0       3       0       0       0
;;Total ram usage:        3 bytes
;; Hardware stack levels used:    1
;; Hardware stack levels required when called:    3
;; This function calls:
;;		_getAdOriginalValue
;; This function is called by:
;;		_process_AD_Converter_Value
;; This function uses a non-reentrant model
;;
psect	text415
	file	"C:\test__190531\AK7030-OTP\common.c"
	line	124
	global	__size_of_AD_Sample
	__size_of_AD_Sample	equ	__end_of_AD_Sample-_AD_Sample
	
_AD_Sample:	
	opt	stack 3
; Regs used in _AD_Sample: [wreg-fsr0h+status,2+status,0+pclath+cstack]
	line	125
	
l3405:	
;common.c: 125: if(sampleTimes < 6)
	movlw	(06h)
	subwf	(_sampleTimes),w
	skipnc
	goto	u561
	goto	u560
u561:
	goto	l1533
u560:
	line	128
	
l3407:	
;common.c: 126: {
;common.c: 128: buffer_Sample_AD_Value[sampleTimes] = getAdOriginalValue();
	fcall	_getAdOriginalValue
	clrc
	rlf	(_sampleTimes),w
	addlw	_buffer_Sample_AD_Value&0ffh
	movwf	fsr0
	movf	(0+(?_getAdOriginalValue)),w
	bcf	status, 7	;select IRP bank0
	movwf	indf
	incf	fsr0,f
	movf	(1+(?_getAdOriginalValue)),w
	movwf	indf
	line	130
	
l3409:	
;common.c: 130: if(sampleTimes == 0)
	movf	(_sampleTimes),f
	skipz
	goto	u571
	goto	u570
u571:
	goto	l3413
u570:
	line	132
	
l3411:	
;common.c: 131: {
;common.c: 132: multiFilterMaxValue = buffer_Sample_AD_Value[0];
	movf	(_buffer_Sample_AD_Value+1),w
	movwf	(_multiFilterMaxValue+1)
	movf	(_buffer_Sample_AD_Value),w
	movwf	(_multiFilterMaxValue)
	line	133
;common.c: 133: multiFilterMinValue = buffer_Sample_AD_Value[0];
	movf	(_buffer_Sample_AD_Value+1),w
	movwf	(_multiFilterMinValue+1)
	movf	(_buffer_Sample_AD_Value),w
	movwf	(_multiFilterMinValue)
	line	136
	
l3413:	
;common.c: 134: }
;common.c: 136: if(multiFilterMaxValue < buffer_Sample_AD_Value[sampleTimes])
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
	goto	u585
	movf	0+(??_AD_Sample+0)+0,w
	subwf	(_multiFilterMaxValue),w
u585:
	skipnc
	goto	u581
	goto	u580
u581:
	goto	l1524
u580:
	line	138
	
l3415:	
;common.c: 137: {
;common.c: 138: multiFilterMaxValue = buffer_Sample_AD_Value[sampleTimes];
	clrc
	rlf	(_sampleTimes),w
	addlw	_buffer_Sample_AD_Value&0ffh
	movwf	fsr0
	movf	indf,w
	movwf	(_multiFilterMaxValue)
	incf	fsr0,f
	movf	indf,w
	movwf	(_multiFilterMaxValue+1)
	line	139
	
l1524:	
	line	140
;common.c: 139: }
;common.c: 140: if(multiFilterMinValue > buffer_Sample_AD_Value[sampleTimes])
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
	goto	u595
	movf	(_multiFilterMinValue),w
	subwf	0+(??_AD_Sample+0)+0,w
u595:
	skipnc
	goto	u591
	goto	u590
u591:
	goto	l1525
u590:
	line	142
	
l3417:	
;common.c: 141: {
;common.c: 142: multiFilterMinValue = buffer_Sample_AD_Value[sampleTimes];
	clrc
	rlf	(_sampleTimes),w
	addlw	_buffer_Sample_AD_Value&0ffh
	movwf	fsr0
	movf	indf,w
	movwf	(_multiFilterMinValue)
	incf	fsr0,f
	movf	indf,w
	movwf	(_multiFilterMinValue+1)
	line	143
	
l1525:	
	line	145
;common.c: 143: }
;common.c: 145: multiFilterSumValue = multiFilterSumValue + buffer_Sample_AD_Value[sampleTimes];
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
	line	147
	
l3419:	
;common.c: 147: sampleTimes++;
	incf	(_sampleTimes),f
	line	149
	
l3421:	
;common.c: 149: if(sampleTimes >= 6)
	movlw	(06h)
	subwf	(_sampleTimes),w
	skipc
	goto	u601
	goto	u600
u601:
	goto	l1533
u600:
	line	151
	
l3423:	
;common.c: 150: {
;common.c: 151: sampleTimes = 0;
	clrf	(_sampleTimes)
	line	153
	
l3425:	
;common.c: 153: if(sampleChannelSelect == 14)
	movf	(_sampleChannelSelect),w
	xorlw	0Eh
	skipz
	goto	u611
	goto	u610
u611:
	goto	l3433
u610:
	line	156
	
l3427:	
;common.c: 154: {
;common.c: 156: sampleCH14Value = ((multiFilterSumValue - multiFilterMaxValue - multiFilterMinValue))>> 2;
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
	movwf	(_sampleCH14Value)
	movf	1+(??_AD_Sample+0)+0,w
	movwf	(_sampleCH14Value+1)
	
l3429:	
	movf	(_multiFilterSumValue),w
	addwf	(_sampleCH14Value),f
	skipnc
	incf	(_sampleCH14Value+1),f
	movf	(_multiFilterSumValue+1),w
	addwf	(_sampleCH14Value+1),f
	clrc
	rrf	(_sampleCH14Value+1),f
	rrf	(_sampleCH14Value),f
	clrc
	rrf	(_sampleCH14Value+1),f
	rrf	(_sampleCH14Value),f
	line	157
	
l3431:	
;common.c: 157: sampleChannelSelect = 4;
	movlw	(04h)
	movwf	(_sampleChannelSelect)
	line	158
;common.c: 158: }
	goto	l3447
	line	159
	
l3433:	
;common.c: 159: else if(sampleChannelSelect == 4)
	movf	(_sampleChannelSelect),w
	xorlw	04h
	skipz
	goto	u621
	goto	u620
u621:
	goto	l3441
u620:
	line	161
	
l3435:	
;common.c: 160: {
;common.c: 161: sampleCH4Value = ((multiFilterSumValue - multiFilterMaxValue - multiFilterMinValue))>> 2;
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
	movwf	(_sampleCH4Value)
	movf	1+(??_AD_Sample+0)+0,w
	movwf	(_sampleCH4Value+1)
	
l3437:	
	movf	(_multiFilterSumValue),w
	addwf	(_sampleCH4Value),f
	skipnc
	incf	(_sampleCH4Value+1),f
	movf	(_multiFilterSumValue+1),w
	addwf	(_sampleCH4Value+1),f
	clrc
	rrf	(_sampleCH4Value+1),f
	rrf	(_sampleCH4Value),f
	clrc
	rrf	(_sampleCH4Value+1),f
	rrf	(_sampleCH4Value),f
	line	162
	
l3439:	
;common.c: 162: sampleChannelSelect = 14;
	movlw	(0Eh)
	movwf	(_sampleChannelSelect)
	line	163
;common.c: 163: }
	goto	l3447
	line	166
	
l3441:	
;common.c: 164: else
;common.c: 165: {
;common.c: 166: sampleCH14Value = ((multiFilterSumValue - multiFilterMaxValue - multiFilterMinValue))>> 2;
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
	movwf	(_sampleCH14Value)
	movf	1+(??_AD_Sample+0)+0,w
	movwf	(_sampleCH14Value+1)
	
l3443:	
	movf	(_multiFilterSumValue),w
	addwf	(_sampleCH14Value),f
	skipnc
	incf	(_sampleCH14Value+1),f
	movf	(_multiFilterSumValue+1),w
	addwf	(_sampleCH14Value+1),f
	clrc
	rrf	(_sampleCH14Value+1),f
	rrf	(_sampleCH14Value),f
	clrc
	rrf	(_sampleCH14Value+1),f
	rrf	(_sampleCH14Value),f
	goto	l3439
	line	170
	
l3447:	
;common.c: 168: }
;common.c: 170: for(unsigned char index = 0; index < 6;index++)
	clrf	(AD_Sample@index)
	line	171
	
l3453:	
;common.c: 171: buffer_Sample_AD_Value[index] = 0;
	clrc
	rlf	(AD_Sample@index),w
	addlw	_buffer_Sample_AD_Value&0ffh
	movwf	fsr0
	clrf	indf
	incf	fsr0,f
	clrf	indf
	line	170
	
l3455:	
	incf	(AD_Sample@index),f
	
l3457:	
	movlw	(06h)
	subwf	(AD_Sample@index),w
	skipc
	goto	u631
	goto	u630
u631:
	goto	l3453
u630:
	line	175
	
l1533:	
	return
	opt stack 0
GLOBAL	__end_of_AD_Sample
	__end_of_AD_Sample:
;; =============== function _AD_Sample ends ============

	signat	_AD_Sample,88
	global	_getAdOriginalValue
psect	text416,local,class=CODE,delta=2
global __ptext416
__ptext416:

;; *************** function _getAdOriginalValue *****************
;; Defined at:
;;		line 76 in file "C:\test__190531\AK7030-OTP\common.c"
;; Parameters:    Size  Location     Type
;;		None
;; Auto vars:     Size  Location     Type
;;		None
;; Return value:  Size  Location     Type
;;                  2    0[BANK0 ] unsigned int 
;; Registers used:
;;		wreg
;; Tracked objects:
;;		On entry : 60/0
;;		On exit  : 60/0
;;		Unchanged: FFF9F/0
;; Data sizes:     COMMON   BANK0   BANK1   BANK3   BANK2
;;      Params:         0       2       0       0       0
;;      Locals:         0       0       0       0       0
;;      Temps:          0       0       0       0       0
;;      Totals:         0       2       0       0       0
;;Total ram usage:        2 bytes
;; Hardware stack levels used:    1
;; Hardware stack levels required when called:    2
;; This function calls:
;;		Nothing
;; This function is called by:
;;		_AD_Sample
;; This function uses a non-reentrant model
;;
psect	text416
	file	"C:\test__190531\AK7030-OTP\common.c"
	line	76
	global	__size_of_getAdOriginalValue
	__size_of_getAdOriginalValue	equ	__end_of_getAdOriginalValue-_getAdOriginalValue
	
_getAdOriginalValue:	
	opt	stack 3
; Regs used in _getAdOriginalValue: [wreg]
	line	77
	
l3365:	
;common.c: 77: return adc_original_value;
	movf	(_adc_original_value+1),w
	movwf	(?_getAdOriginalValue+1)
	movf	(_adc_original_value),w
	movwf	(?_getAdOriginalValue)
	line	78
	
l1504:	
	return
	opt stack 0
GLOBAL	__end_of_getAdOriginalValue
	__end_of_getAdOriginalValue:
;; =============== function _getAdOriginalValue ends ============

	signat	_getAdOriginalValue,90
	global	_setAD_ConvertFlag
psect	text417,local,class=CODE,delta=2
global __ptext417
__ptext417:

;; *************** function _setAD_ConvertFlag *****************
;; Defined at:
;;		line 70 in file "C:\test__190531\AK7030-OTP\common.c"
;; Parameters:    Size  Location     Type
;;  flag            1    wreg     unsigned char 
;; Auto vars:     Size  Location     Type
;;  flag            1    0[BANK0 ] unsigned char 
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
;;      Locals:         0       1       0       0       0
;;      Temps:          0       0       0       0       0
;;      Totals:         0       1       0       0       0
;;Total ram usage:        1 bytes
;; Hardware stack levels used:    1
;; Hardware stack levels required when called:    2
;; This function calls:
;;		Nothing
;; This function is called by:
;;		_process_AD_Converter_Value
;; This function uses a non-reentrant model
;;
psect	text417
	file	"C:\test__190531\AK7030-OTP\common.c"
	line	70
	global	__size_of_setAD_ConvertFlag
	__size_of_setAD_ConvertFlag	equ	__end_of_setAD_ConvertFlag-_setAD_ConvertFlag
	
_setAD_ConvertFlag:	
	opt	stack 4
; Regs used in _setAD_ConvertFlag: [wreg]
;setAD_ConvertFlag@flag stored from wreg
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	movwf	(setAD_ConvertFlag@flag)
	line	71
	
l3363:	
;common.c: 71: adc_convert_flag = flag;
	movf	(setAD_ConvertFlag@flag),w
	movwf	(_adc_convert_flag)
	line	72
	
l1501:	
	return
	opt stack 0
GLOBAL	__end_of_setAD_ConvertFlag
	__end_of_setAD_ConvertFlag:
;; =============== function _setAD_ConvertFlag ends ============

	signat	_setAD_ConvertFlag,4216
	global	_getAD_ConvertFlag
psect	text418,local,class=CODE,delta=2
global __ptext418
__ptext418:

;; *************** function _getAD_ConvertFlag *****************
;; Defined at:
;;		line 64 in file "C:\test__190531\AK7030-OTP\common.c"
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
;;		On exit  : 0/0
;;		Unchanged: FFFFF/0
;; Data sizes:     COMMON   BANK0   BANK1   BANK3   BANK2
;;      Params:         0       0       0       0       0
;;      Locals:         0       0       0       0       0
;;      Temps:          0       0       0       0       0
;;      Totals:         0       0       0       0       0
;;Total ram usage:        0 bytes
;; Hardware stack levels used:    1
;; Hardware stack levels required when called:    2
;; This function calls:
;;		Nothing
;; This function is called by:
;;		_process_AD_Converter_Value
;; This function uses a non-reentrant model
;;
psect	text418
	file	"C:\test__190531\AK7030-OTP\common.c"
	line	64
	global	__size_of_getAD_ConvertFlag
	__size_of_getAD_ConvertFlag	equ	__end_of_getAD_ConvertFlag-_getAD_ConvertFlag
	
_getAD_ConvertFlag:	
	opt	stack 4
; Regs used in _getAD_ConvertFlag: [wreg]
	line	65
	
l3359:	
;common.c: 65: return adc_convert_flag;
	movf	(_adc_convert_flag),w
	line	66
	
l1498:	
	return
	opt stack 0
GLOBAL	__end_of_getAD_ConvertFlag
	__end_of_getAD_ConvertFlag:
;; =============== function _getAD_ConvertFlag ends ============

	signat	_getAD_ConvertFlag,89
	global	_getAdCh4Value
psect	text419,local,class=CODE,delta=2
global __ptext419
__ptext419:

;; *************** function _getAdCh4Value *****************
;; Defined at:
;;		line 180 in file "C:\test__190531\AK7030-OTP\common.c"
;; Parameters:    Size  Location     Type
;;		None
;; Auto vars:     Size  Location     Type
;;		None
;; Return value:  Size  Location     Type
;;                  2    0[BANK0 ] unsigned int 
;; Registers used:
;;		wreg
;; Tracked objects:
;;		On entry : 60/0
;;		On exit  : 60/0
;;		Unchanged: FFF9F/0
;; Data sizes:     COMMON   BANK0   BANK1   BANK3   BANK2
;;      Params:         0       2       0       0       0
;;      Locals:         0       0       0       0       0
;;      Temps:          0       0       0       0       0
;;      Totals:         0       2       0       0       0
;;Total ram usage:        2 bytes
;; Hardware stack levels used:    1
;; Hardware stack levels required when called:    2
;; This function calls:
;;		Nothing
;; This function is called by:
;;		_main
;; This function uses a non-reentrant model
;;
psect	text419
	file	"C:\test__190531\AK7030-OTP\common.c"
	line	180
	global	__size_of_getAdCh4Value
	__size_of_getAdCh4Value	equ	__end_of_getAdCh4Value-_getAdCh4Value
	
_getAdCh4Value:	
	opt	stack 5
; Regs used in _getAdCh4Value: [wreg]
	line	181
	
l3355:	
;common.c: 181: return sampleCH4Value;
	movf	(_sampleCH4Value+1),w
	movwf	(?_getAdCh4Value+1)
	movf	(_sampleCH4Value),w
	movwf	(?_getAdCh4Value)
	line	182
	
l1536:	
	return
	opt stack 0
GLOBAL	__end_of_getAdCh4Value
	__end_of_getAdCh4Value:
;; =============== function _getAdCh4Value ends ============

	signat	_getAdCh4Value,90
	global	_getAdCh14Value
psect	text420,local,class=CODE,delta=2
global __ptext420
__ptext420:

;; *************** function _getAdCh14Value *****************
;; Defined at:
;;		line 186 in file "C:\test__190531\AK7030-OTP\common.c"
;; Parameters:    Size  Location     Type
;;		None
;; Auto vars:     Size  Location     Type
;;		None
;; Return value:  Size  Location     Type
;;                  2    0[BANK0 ] unsigned int 
;; Registers used:
;;		wreg
;; Tracked objects:
;;		On entry : 60/0
;;		On exit  : 60/0
;;		Unchanged: FFF9F/0
;; Data sizes:     COMMON   BANK0   BANK1   BANK3   BANK2
;;      Params:         0       2       0       0       0
;;      Locals:         0       0       0       0       0
;;      Temps:          0       0       0       0       0
;;      Totals:         0       2       0       0       0
;;Total ram usage:        2 bytes
;; Hardware stack levels used:    1
;; Hardware stack levels required when called:    2
;; This function calls:
;;		Nothing
;; This function is called by:
;;		_main
;; This function uses a non-reentrant model
;;
psect	text420
	file	"C:\test__190531\AK7030-OTP\common.c"
	line	186
	global	__size_of_getAdCh14Value
	__size_of_getAdCh14Value	equ	__end_of_getAdCh14Value-_getAdCh14Value
	
_getAdCh14Value:	
	opt	stack 5
; Regs used in _getAdCh14Value: [wreg]
	line	187
	
l3351:	
;common.c: 187: return sampleCH14Value;
	movf	(_sampleCH14Value+1),w
	movwf	(?_getAdCh14Value+1)
	movf	(_sampleCH14Value),w
	movwf	(?_getAdCh14Value)
	line	188
	
l1539:	
	return
	opt stack 0
GLOBAL	__end_of_getAdCh14Value
	__end_of_getAdCh14Value:
;; =============== function _getAdCh14Value ends ============

	signat	_getAdCh14Value,90
	global	_clrSampeTime
psect	text421,local,class=CODE,delta=2
global __ptext421
__ptext421:

;; *************** function _clrSampeTime *****************
;; Defined at:
;;		line 254 in file "C:\test__190531\AK7030-OTP\common.c"
;; Parameters:    Size  Location     Type
;;		None
;; Auto vars:     Size  Location     Type
;;		None
;; Return value:  Size  Location     Type
;;		None               void
;; Registers used:
;;		status,2
;; Tracked objects:
;;		On entry : 0/0
;;		On exit  : 0/0
;;		Unchanged: FFFFF/0
;; Data sizes:     COMMON   BANK0   BANK1   BANK3   BANK2
;;      Params:         0       0       0       0       0
;;      Locals:         0       0       0       0       0
;;      Temps:          0       0       0       0       0
;;      Totals:         0       0       0       0       0
;;Total ram usage:        0 bytes
;; Hardware stack levels used:    1
;; Hardware stack levels required when called:    2
;; This function calls:
;;		Nothing
;; This function is called by:
;;		_main
;; This function uses a non-reentrant model
;;
psect	text421
	file	"C:\test__190531\AK7030-OTP\common.c"
	line	254
	global	__size_of_clrSampeTime
	__size_of_clrSampeTime	equ	__end_of_clrSampeTime-_clrSampeTime
	
_clrSampeTime:	
	opt	stack 5
; Regs used in _clrSampeTime: [status,2]
	line	255
	
l3349:	
;common.c: 255: timer.timer10msStopWatch = 0;
	clrf	(_timer)
	line	256
	
l1572:	
	return
	opt stack 0
GLOBAL	__end_of_clrSampeTime
	__end_of_clrSampeTime:
;; =============== function _clrSampeTime ends ============

	signat	_clrSampeTime,88
	global	_isPermitSampleTime
psect	text422,local,class=CODE,delta=2
global __ptext422
__ptext422:

;; *************** function _isPermitSampleTime *****************
;; Defined at:
;;		line 244 in file "C:\test__190531\AK7030-OTP\common.c"
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
;;		On exit  : 0/0
;;		Unchanged: FFFFF/0
;; Data sizes:     COMMON   BANK0   BANK1   BANK3   BANK2
;;      Params:         0       0       0       0       0
;;      Locals:         0       0       0       0       0
;;      Temps:          0       0       0       0       0
;;      Totals:         0       0       0       0       0
;;Total ram usage:        0 bytes
;; Hardware stack levels used:    1
;; Hardware stack levels required when called:    2
;; This function calls:
;;		Nothing
;; This function is called by:
;;		_main
;; This function uses a non-reentrant model
;;
psect	text422
	file	"C:\test__190531\AK7030-OTP\common.c"
	line	244
	global	__size_of_isPermitSampleTime
	__size_of_isPermitSampleTime	equ	__end_of_isPermitSampleTime-_isPermitSampleTime
	
_isPermitSampleTime:	
	opt	stack 5
; Regs used in _isPermitSampleTime: [wreg]
	line	245
	
l3337:	
;common.c: 245: if(timer.timer10msStopWatch > 10)
	movlw	(0Bh)
	subwf	(_timer),w
	skipc
	goto	u501
	goto	u500
u501:
	goto	l3345
u500:
	line	247
	
l3339:	
;common.c: 246: {
;common.c: 247: return 1;
	movlw	(01h)
	goto	l1568
	line	250
	
l3345:	
;common.c: 249: else
;common.c: 250: return 0;
	movlw	(0)
	line	251
	
l1568:	
	return
	opt stack 0
GLOBAL	__end_of_isPermitSampleTime
	__end_of_isPermitSampleTime:
;; =============== function _isPermitSampleTime ends ============

	signat	_isPermitSampleTime,89
	global	_adc_start
psect	text423,local,class=CODE,delta=2
global __ptext423
__ptext423:

;; *************** function _adc_start *****************
;; Defined at:
;;		line 100 in file "C:\test__190531\AK7030-OTP\periph.c"
;; Parameters:    Size  Location     Type
;;		None
;; Auto vars:     Size  Location     Type
;;		None
;; Return value:  Size  Location     Type
;;		None               void
;; Registers used:
;;		None
;; Tracked objects:
;;		On entry : 60/20
;;		On exit  : 60/0
;;		Unchanged: FFF9F/0
;; Data sizes:     COMMON   BANK0   BANK1   BANK3   BANK2
;;      Params:         0       0       0       0       0
;;      Locals:         0       0       0       0       0
;;      Temps:          0       0       0       0       0
;;      Totals:         0       0       0       0       0
;;Total ram usage:        0 bytes
;; Hardware stack levels used:    1
;; Hardware stack levels required when called:    2
;; This function calls:
;;		Nothing
;; This function is called by:
;;		_main
;;		_process_AD_Converter_Value
;; This function uses a non-reentrant model
;;
psect	text423
	file	"C:\test__190531\AK7030-OTP\periph.c"
	line	100
	global	__size_of_adc_start
	__size_of_adc_start	equ	__end_of_adc_start-_adc_start
	
_adc_start:	
	opt	stack 4
; Regs used in _adc_start: []
	line	101
	
l3335:	
;periph.c: 101: GO=1;
	bcf	status, 5	;RP0=0, select bank0
	bsf	(249/8),(249)&7
	line	102
	
l2231:	
	return
	opt stack 0
GLOBAL	__end_of_adc_start
	__end_of_adc_start:
;; =============== function _adc_start ends ============

	signat	_adc_start,88
	global	_op2_init
psect	text424,local,class=CODE,delta=2
global __ptext424
__ptext424:

;; *************** function _op2_init *****************
;; Defined at:
;;		line 45 in file "C:\test__190531\AK7030-OTP\periph.c"
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
;; Hardware stack levels required when called:    2
;; This function calls:
;;		Nothing
;; This function is called by:
;;		_main
;; This function uses a non-reentrant model
;;
psect	text424
	file	"C:\test__190531\AK7030-OTP\periph.c"
	line	45
	global	__size_of_op2_init
	__size_of_op2_init	equ	__end_of_op2_init-_op2_init
	
_op2_init:	
	opt	stack 5
; Regs used in _op2_init: [wreg]
	line	52
	
l3327:	
;periph.c: 52: OP2CON1=0x10;
	movlw	(010h)
	movwf	(156)^080h	;volatile
	line	54
;periph.c: 54: OP2CON2=0x90;
	movlw	(090h)
	movwf	(157)^080h	;volatile
	line	55
;periph.c: 55: OP2CON0=0x80;
	movlw	(080h)
	movwf	(155)^080h	;volatile
	line	58
	
l3329:	
;periph.c: 58: TRISA7=0;
	bcf	(1071/8)^080h,(1071)&7
	line	59
	
l3331:	
;periph.c: 59: TRISB6=1;
	bsf	(1078/8)^080h,(1078)&7
	line	60
	
l3333:	
;periph.c: 60: TRISB7 = 1;
	bsf	(1079/8)^080h,(1079)&7
	line	61
	
l2217:	
	return
	opt stack 0
GLOBAL	__end_of_op2_init
	__end_of_op2_init:
;; =============== function _op2_init ends ============

	signat	_op2_init,88
	global	_op1_init
psect	text425,local,class=CODE,delta=2
global __ptext425
__ptext425:

;; *************** function _op1_init *****************
;; Defined at:
;;		line 26 in file "C:\test__190531\AK7030-OTP\periph.c"
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
;; Hardware stack levels required when called:    2
;; This function calls:
;;		Nothing
;; This function is called by:
;;		_main
;; This function uses a non-reentrant model
;;
psect	text425
	file	"C:\test__190531\AK7030-OTP\periph.c"
	line	26
	global	__size_of_op1_init
	__size_of_op1_init	equ	__end_of_op1_init-_op1_init
	
_op1_init:	
	opt	stack 5
; Regs used in _op1_init: [wreg]
	line	33
	
l3319:	
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
	line	38
	
l3321:	
;periph.c: 38: TRISB3=1;
	bsf	status, 5	;RP0=1, select bank1
	bsf	(1075/8)^080h,(1075)&7
	line	39
	
l3323:	
;periph.c: 39: TRISB4=1;
	bsf	(1076/8)^080h,(1076)&7
	line	40
	
l3325:	
;periph.c: 40: TRISB5=0;
	bcf	(1077/8)^080h,(1077)&7
	line	41
	
l2214:	
	return
	opt stack 0
GLOBAL	__end_of_op1_init
	__end_of_op1_init:
;; =============== function _op1_init ends ============

	signat	_op1_init,88
	global	_dac_init
psect	text426,local,class=CODE,delta=2
global __ptext426
__ptext426:

;; *************** function _dac_init *****************
;; Defined at:
;;		line 14 in file "C:\test__190531\AK7030-OTP\periph.c"
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
;; Hardware stack levels required when called:    2
;; This function calls:
;;		Nothing
;; This function is called by:
;;		_main
;; This function uses a non-reentrant model
;;
psect	text426
	file	"C:\test__190531\AK7030-OTP\periph.c"
	line	14
	global	__size_of_dac_init
	__size_of_dac_init	equ	__end_of_dac_init-_dac_init
	
_dac_init:	
	opt	stack 5
; Regs used in _dac_init: [wreg]
	line	15
	
l3313:	
;periph.c: 15: DACCON|=1;
	bsf	(135)^080h+(0/8),(0)&7	;volatile
	line	17
	
l3315:	
;periph.c: 17: DACR0=0x0F;
	movlw	(0Fh)
	movwf	(136)^080h	;volatile
	line	18
	
l3317:	
;periph.c: 18: DACCON|=(1)<<2;
	bsf	(135)^080h+(2/8),(2)&7	;volatile
	line	22
	
l2211:	
	return
	opt stack 0
GLOBAL	__end_of_dac_init
	__end_of_dac_init:
;; =============== function _dac_init ends ============

	signat	_dac_init,88
	global	_adc_test_init
psect	text427,local,class=CODE,delta=2
global __ptext427
__ptext427:

;; *************** function _adc_test_init *****************
;; Defined at:
;;		line 85 in file "C:\test__190531\AK7030-OTP\periph.c"
;; Parameters:    Size  Location     Type
;;  channel         1    wreg     unsigned char 
;;  ref             1    0[BANK0 ] unsigned char 
;; Auto vars:     Size  Location     Type
;;  channel         1    2[BANK0 ] unsigned char 
;; Return value:  Size  Location     Type
;;		None               void
;; Registers used:
;;		wreg, status,2, status,0
;; Tracked objects:
;;		On entry : 60/0
;;		On exit  : 60/20
;;		Unchanged: FFF9F/0
;; Data sizes:     COMMON   BANK0   BANK1   BANK3   BANK2
;;      Params:         0       1       0       0       0
;;      Locals:         0       1       0       0       0
;;      Temps:          0       1       0       0       0
;;      Totals:         0       3       0       0       0
;;Total ram usage:        3 bytes
;; Hardware stack levels used:    1
;; Hardware stack levels required when called:    2
;; This function calls:
;;		Nothing
;; This function is called by:
;;		_main
;;		_process_AD_Converter_Value
;; This function uses a non-reentrant model
;;
psect	text427
	file	"C:\test__190531\AK7030-OTP\periph.c"
	line	85
	global	__size_of_adc_test_init
	__size_of_adc_test_init	equ	__end_of_adc_test_init-_adc_test_init
	
_adc_test_init:	
	opt	stack 4
; Regs used in _adc_test_init: [wreg+status,2+status,0]
;adc_test_init@channel stored from wreg
	movwf	(adc_test_init@channel)
	line	86
	
l3303:	
;periph.c: 86: ADCON0 = 0x00;
	clrf	(31)	;volatile
	line	87
	
l3305:	
;periph.c: 87: ADCON0|=channel<<2;
	movf	(adc_test_init@channel),w
	movwf	(??_adc_test_init+0)+0
	clrc
	rlf	(??_adc_test_init+0)+0,f
	clrc
	rlf	(??_adc_test_init+0)+0,w
	iorwf	(31),f	;volatile
	line	88
	
l3307:	
;periph.c: 88: ADCON1|=ref<<6;
	movf	(adc_test_init@ref),w
	movwf	(??_adc_test_init+0)+0
	rrf	(??_adc_test_init+0)+0,f
	rrf	(??_adc_test_init+0)+0,f
	rrf	(??_adc_test_init+0)+0,w
	andlw	0c0h
	bsf	status, 5	;RP0=1, select bank1
	iorwf	(159)^080h,f	;volatile
	line	89
	
l3309:	
;periph.c: 89: ADON=1;
	bcf	status, 5	;RP0=0, select bank0
	bsf	(248/8),(248)&7
	line	90
	
l3311:	
;periph.c: 90: ADIE=1;
	bsf	status, 5	;RP0=1, select bank1
	bsf	(1130/8)^080h,(1130)&7
	line	91
	
l2225:	
	return
	opt stack 0
GLOBAL	__end_of_adc_test_init
	__end_of_adc_test_init:
;; =============== function _adc_test_init ends ============

	signat	_adc_test_init,8312
	global	_timer1_interrupt_config
psect	text428,local,class=CODE,delta=2
global __ptext428
__ptext428:

;; *************** function _timer1_interrupt_config *****************
;; Defined at:
;;		line 56 in file "C:\test__190531\AK7030-OTP\common.c"
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
;;		On exit  : 17F/20
;;		Unchanged: FFE80/0
;; Data sizes:     COMMON   BANK0   BANK1   BANK3   BANK2
;;      Params:         0       0       0       0       0
;;      Locals:         0       0       0       0       0
;;      Temps:          0       0       0       0       0
;;      Totals:         0       0       0       0       0
;;Total ram usage:        0 bytes
;; Hardware stack levels used:    1
;; Hardware stack levels required when called:    2
;; This function calls:
;;		Nothing
;; This function is called by:
;;		_main
;; This function uses a non-reentrant model
;;
psect	text428
	file	"C:\test__190531\AK7030-OTP\common.c"
	line	56
	global	__size_of_timer1_interrupt_config
	__size_of_timer1_interrupt_config	equ	__end_of_timer1_interrupt_config-_timer1_interrupt_config
	
_timer1_interrupt_config:	
	opt	stack 5
; Regs used in _timer1_interrupt_config: []
	line	57
	
l3301:	
;common.c: 57: GIE = 1;
	bsf	(95/8),(95)&7
	line	58
;common.c: 58: PEIE = 1;
	bsf	(94/8),(94)&7
	line	59
	
l1495:	
	return
	opt stack 0
GLOBAL	__end_of_timer1_interrupt_config
	__end_of_timer1_interrupt_config:
;; =============== function _timer1_interrupt_config ends ============

	signat	_timer1_interrupt_config,88
	global	_timer1_config
psect	text429,local,class=CODE,delta=2
global __ptext429
__ptext429:

;; *************** function _timer1_config *****************
;; Defined at:
;;		line 44 in file "C:\test__190531\AK7030-OTP\common.c"
;; Parameters:    Size  Location     Type
;;		None
;; Auto vars:     Size  Location     Type
;;		None
;; Return value:  Size  Location     Type
;;		None               void
;; Registers used:
;;		wreg
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
;; Hardware stack levels required when called:    2
;; This function calls:
;;		Nothing
;; This function is called by:
;;		_main
;; This function uses a non-reentrant model
;;
psect	text429
	file	"C:\test__190531\AK7030-OTP\common.c"
	line	44
	global	__size_of_timer1_config
	__size_of_timer1_config	equ	__end_of_timer1_config-_timer1_config
	
_timer1_config:	
	opt	stack 5
; Regs used in _timer1_config: [wreg]
	line	46
	
l3297:	
;common.c: 46: TMR1H=0xCF;
	movlw	(0CFh)
	bcf	status, 6	;RP1=0, select bank0
	movwf	(15)	;volatile
	line	47
;common.c: 47: TMR1L=0x2C;
	movlw	(02Ch)
	movwf	(14)	;volatile
	line	48
;common.c: 48: T1CON=0xE1;
	movlw	(0E1h)
	movwf	(16)	;volatile
	line	49
	
l3299:	
;common.c: 49: TMR1IE=1;
	bsf	status, 5	;RP0=1, select bank1
	bsf	(1120/8)^080h,(1120)&7
	line	51
	
l1492:	
	return
	opt stack 0
GLOBAL	__end_of_timer1_config
	__end_of_timer1_config:
;; =============== function _timer1_config ends ============

	signat	_timer1_config,88
	global	_clock_config
psect	text430,local,class=CODE,delta=2
global __ptext430
__ptext430:

;; *************** function _clock_config *****************
;; Defined at:
;;		line 36 in file "C:\test__190531\AK7030-OTP\common.c"
;; Parameters:    Size  Location     Type
;;		None
;; Auto vars:     Size  Location     Type
;;		None
;; Return value:  Size  Location     Type
;;		None               void
;; Registers used:
;;		wreg, status,2
;; Tracked objects:
;;		On entry : 17F/20
;;		On exit  : 17F/40
;;		Unchanged: FFE80/0
;; Data sizes:     COMMON   BANK0   BANK1   BANK3   BANK2
;;      Params:         0       0       0       0       0
;;      Locals:         0       0       0       0       0
;;      Temps:          0       0       0       0       0
;;      Totals:         0       0       0       0       0
;;Total ram usage:        0 bytes
;; Hardware stack levels used:    1
;; Hardware stack levels required when called:    2
;; This function calls:
;;		Nothing
;; This function is called by:
;;		_main
;; This function uses a non-reentrant model
;;
psect	text430
	file	"C:\test__190531\AK7030-OTP\common.c"
	line	36
	global	__size_of_clock_config
	__size_of_clock_config	equ	__end_of_clock_config-_clock_config
	
_clock_config:	
	opt	stack 5
; Regs used in _clock_config: [wreg+status,2]
	line	38
	
l3293:	
;common.c: 38: CLKPR = 0x80;
	movlw	(080h)
	bcf	status, 5	;RP0=0, select bank2
	bsf	status, 6	;RP1=1, select bank2
	movwf	(264)^0100h	;volatile
	line	39
	
l3295:	
;common.c: 39: CLKPR = 0x00;
	clrf	(264)^0100h	;volatile
	line	40
;common.c: 40: while(CLKPCE);
	
l1486:	
	btfsc	(2119/8)^0100h,(2119)&7
	goto	u491
	goto	u490
u491:
	goto	l1486
u490:
	line	41
	
l1489:	
	return
	opt stack 0
GLOBAL	__end_of_clock_config
	__end_of_clock_config:
;; =============== function _clock_config ends ============

	signat	_clock_config,88
	global	_ISR
psect	text431,local,class=CODE,delta=2
global __ptext431
__ptext431:

;; *************** function _ISR *****************
;; Defined at:
;;		line 259 in file "C:\test__190531\AK7030-OTP\common.c"
;; Parameters:    Size  Location     Type
;;		None
;; Auto vars:     Size  Location     Type
;;		None
;; Return value:  Size  Location     Type
;;		None               void
;; Registers used:
;;		wreg, status,2, status,0, pclath, cstack
;; Tracked objects:
;;		On entry : 0/0
;;		On exit  : 40/0
;;		Unchanged: FFF9F/0
;; Data sizes:     COMMON   BANK0   BANK1   BANK3   BANK2
;;      Params:         0       0       0       0       0
;;      Locals:         0       0       0       0       0
;;      Temps:          2       0       0       0       0
;;      Totals:         2       0       0       0       0
;;Total ram usage:        2 bytes
;; Hardware stack levels used:    1
;; Hardware stack levels required when called:    1
;; This function calls:
;;		i1_setAD_ConvertFlag
;;		_adc_get
;; This function is called by:
;;		Interrupt level 1
;; This function uses a non-reentrant model
;;
psect	text431
	file	"C:\test__190531\AK7030-OTP\common.c"
	line	259
	global	__size_of_ISR
	__size_of_ISR	equ	__end_of_ISR-_ISR
	
_ISR:	
	opt	stack 3
; Regs used in _ISR: [wreg+status,2+status,0+pclath+cstack]
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
psect	text431
	line	262
	
i1l3369:	
;common.c: 260: static unsigned char ucTimer1sCnt = 0;
;common.c: 262: if(TMR1IF == 1)
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	btfss	(96/8),(96)&7
	goto	u51_21
	goto	u51_20
u51_21:
	goto	i1l3385
u51_20:
	line	264
	
i1l3371:	
;common.c: 263: {
;common.c: 264: TMR1IF = 0 ;
	bcf	(96/8),(96)&7
	line	265
	
i1l3373:	
;common.c: 265: timer.timer10msStopWatch++;
	incf	(_timer),f
	line	266
;common.c: 266: ucTimer1sCnt++;
	incf	(ISR@ucTimer1sCnt),f
	line	268
	
i1l3375:	
;common.c: 268: if(ucTimer1sCnt >= 100)
	movlw	(064h)
	subwf	(ISR@ucTimer1sCnt),w
	skipc
	goto	u52_21
	goto	u52_20
u52_21:
	goto	i1l3385
u52_20:
	line	270
	
i1l3377:	
;common.c: 269: {
;common.c: 270: ucTimer1sCnt = 0;
	clrf	(ISR@ucTimer1sCnt)
	line	271
	
i1l3379:	
;common.c: 271: if(uiBigTimer > 0)
	movf	(_uiBigTimer+1),w
	iorwf	(_uiBigTimer),w
	skipnz
	goto	u53_21
	goto	u53_20
u53_21:
	goto	i1l1579
u53_20:
	line	272
	
i1l3381:	
;common.c: 272: uiBigTimer--;
	movlw	low(01h)
	subwf	(_uiBigTimer),f
	movlw	high(01h)
	skipc
	decf	(_uiBigTimer+1),f
	subwf	(_uiBigTimer+1),f
	
i1l1579:	
	line	274
;common.c: 274: if(uiSmallTimer)
	movf	(_uiSmallTimer+1),w
	iorwf	(_uiSmallTimer),w
	skipnz
	goto	u54_21
	goto	u54_20
u54_21:
	goto	i1l3385
u54_20:
	line	275
	
i1l3383:	
;common.c: 275: uiSmallTimer--;
	movlw	low(01h)
	subwf	(_uiSmallTimer),f
	movlw	high(01h)
	skipc
	decf	(_uiSmallTimer+1),f
	subwf	(_uiSmallTimer+1),f
	line	279
	
i1l3385:	
;common.c: 276: }
;common.c: 277: }
;common.c: 279: if(ADIF)
	btfss	(106/8),(106)&7
	goto	u55_21
	goto	u55_20
u55_21:
	goto	i1l1584
u55_20:
	line	281
	
i1l3387:	
;common.c: 280: {
;common.c: 281: ADIF=0;
	bcf	(106/8),(106)&7
	line	282
	
i1l3389:	
;common.c: 282: setAD_ConvertFlag(1);
	movlw	(01h)
	fcall	i1_setAD_ConvertFlag
	line	283
	
i1l3391:	
;common.c: 283: adc_original_value = adc_get();
	fcall	_adc_get
	movf	(1+(?_adc_get)),w
	bcf	status, 5	;RP0=0, select bank0
	movwf	(_adc_original_value+1)
	movf	(0+(?_adc_get)),w
	movwf	(_adc_original_value)
	line	285
	
i1l3395:	
;common.c: 285: adc_original_CH4_value = adc_get();
	fcall	_adc_get
	line	290
	
i1l1584:	
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
	global	i1_setAD_ConvertFlag
psect	text432,local,class=CODE,delta=2
global __ptext432
__ptext432:

;; *************** function i1_setAD_ConvertFlag *****************
;; Defined at:
;;		line 70 in file "C:\test__190531\AK7030-OTP\common.c"
;; Parameters:    Size  Location     Type
;;  setAD_Conver    1    wreg     unsigned char 
;; Auto vars:     Size  Location     Type
;;  setAD_Conver    1    0[COMMON] unsigned char 
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
;;      Locals:         1       0       0       0       0
;;      Temps:          0       0       0       0       0
;;      Totals:         1       0       0       0       0
;;Total ram usage:        1 bytes
;; Hardware stack levels used:    1
;; This function calls:
;;		Nothing
;; This function is called by:
;;		_ISR
;; This function uses a non-reentrant model
;;
psect	text432
	file	"C:\test__190531\AK7030-OTP\common.c"
	line	70
	global	__size_ofi1_setAD_ConvertFlag
	__size_ofi1_setAD_ConvertFlag	equ	__end_ofi1_setAD_ConvertFlag-i1_setAD_ConvertFlag
	
i1_setAD_ConvertFlag:	
	opt	stack 3
; Regs used in i1_setAD_ConvertFlag: [wreg]
;i1setAD_ConvertFlag@flag stored from wreg
	movwf	(i1setAD_ConvertFlag@flag)
	line	71
	
i1l3403:	
;common.c: 71: adc_convert_flag = flag;
	movf	(i1setAD_ConvertFlag@flag),w
	movwf	(_adc_convert_flag)
	line	72
	
i1l1501:	
	return
	opt stack 0
GLOBAL	__end_ofi1_setAD_ConvertFlag
	__end_ofi1_setAD_ConvertFlag:
;; =============== function i1_setAD_ConvertFlag ends ============

	signat	i1_setAD_ConvertFlag,88
	global	_adc_get
psect	text433,local,class=CODE,delta=2
global __ptext433
__ptext433:

;; *************** function _adc_get *****************
;; Defined at:
;;		line 105 in file "C:\test__190531\AK7030-OTP\periph.c"
;; Parameters:    Size  Location     Type
;;		None
;; Auto vars:     Size  Location     Type
;;  val             2    2[COMMON] unsigned int 
;; Return value:  Size  Location     Type
;;                  2    0[COMMON] unsigned int 
;; Registers used:
;;		wreg
;; Tracked objects:
;;		On entry : 60/0
;;		On exit  : 60/20
;;		Unchanged: FFF9F/0
;; Data sizes:     COMMON   BANK0   BANK1   BANK3   BANK2
;;      Params:         2       0       0       0       0
;;      Locals:         2       0       0       0       0
;;      Temps:          0       0       0       0       0
;;      Totals:         4       0       0       0       0
;;Total ram usage:        4 bytes
;; Hardware stack levels used:    1
;; This function calls:
;;		Nothing
;; This function is called by:
;;		_ISR
;; This function uses a non-reentrant model
;;
psect	text433
	file	"C:\test__190531\AK7030-OTP\periph.c"
	line	105
	global	__size_of_adc_get
	__size_of_adc_get	equ	__end_of_adc_get-_adc_get
	
_adc_get:	
	opt	stack 3
; Regs used in _adc_get: [wreg]
	line	107
	
i1l3399:	
;periph.c: 106: unsigned int val;
;periph.c: 107: val = (ADRESH<<8) | ADRESL;
	movf	(30),w	;volatile
	movwf	(adc_get@val+1)
	clrf	(adc_get@val)
	bsf	status, 5	;RP0=1, select bank1
	movf	(158)^080h,w	;volatile
	iorwf	(adc_get@val),f
	line	108
;periph.c: 108: return val;
	movf	(adc_get@val+1),w
	movwf	(?_adc_get+1)
	movf	(adc_get@val),w
	movwf	(?_adc_get)
	line	109
	
i1l2234:	
	return
	opt stack 0
GLOBAL	__end_of_adc_get
	__end_of_adc_get:
;; =============== function _adc_get ends ============

	signat	_adc_get,90
psect	text434,local,class=CODE,delta=2
global __ptext434
__ptext434:
	global	btemp
	btemp set 07Eh

	DABS	1,126,2	;btemp
	global	wtemp0
	wtemp0 set btemp
	end
