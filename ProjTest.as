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
# 70 "C:\190604\AK7030-OTP\main.c"
	psect config,class=CONFIG,delta=2 ;#
# 70 "C:\190604\AK7030-OTP\main.c"
	dw 0x2FFF & 0x3FFF & 0x3FFF & 0x3FFF & 0x3FFF & 0x3FFF ;#
# 71 "C:\190604\AK7030-OTP\main.c"
	psect config,class=CONFIG,delta=2 ;#
# 71 "C:\190604\AK7030-OTP\main.c"
	dw 0x3FFF & 0x3FDF & 0x3FFF & 0x3FFE ;#
# 72 "C:\190604\AK7030-OTP\main.c"
	psect config,class=CONFIG,delta=2 ;#
# 72 "C:\190604\AK7030-OTP\main.c"
	dw 0X3FFF & 0x3FFF & 0x3FFF & 0x3FF8 ;#
	FNCALL	_main,_initPin
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
	FNCALL	_main,_getAdOriginalCh14Value
	FNCALL	_main,_clearPinPortAndTimer
	FNCALL	_main,_getAdOriginalCh1Value
	FNCALL	_main,_startTwelveHourTimer
	FNCALL	_main,_isFinishedTwelveHoursTimer
	FNCALL	_main,_startTwentySecondsTimer
	FNCALL	_main,_getAdOriginaCh4Value
	FNCALL	_main,_isFinishedTwentySecondsTimer
	FNCALL	_main,_startThreeHoursTimer
	FNCALL	_main,_isFinishedThreeHoursTimer
	FNCALL	_main,_clearThreeHoursTimer
	FNCALL	_main,_clearAllTimer
	FNCALL	_process_AD_Converter_Value,_getAD_ConvertFlag
	FNCALL	_process_AD_Converter_Value,_setAD_ConvertFlag
	FNCALL	_process_AD_Converter_Value,_AD_Sample
	FNCALL	_process_AD_Converter_Value,_adc_test_init
	FNCALL	_process_AD_Converter_Value,_adc_start
	FNCALL	_clearPinPortAndTimer,_clearAllTimer
	FNCALL	_AD_Sample,_getAdOriginalValue
	FNCALL	_clearAllTimer,_clearTwelveHoursTimer
	FNCALL	_clearAllTimer,_clearThreeHoursTimer
	FNCALL	_clearAllTimer,_clearTwentySecondsTimer
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
	file	"C:\190604\AK7030-OTP\common.c"
	line	18

;initializer for _sampleChannelSelect
	retlw	0Eh
	global	_buffer_Sample_AD_Value
	global	_adc_original_CH14_value
	global	_adc_original_CH1_value
	global	_adc_original_CH4_value
	global	_adc_original_value
	global	_multiFilterMaxValue
	global	_multiFilterMinValue
	global	_uiBigTimer
	global	_uiSmallTimer
	global	_sampleTimes
	global	main@cTimer1s_809
	global	main@enumBranchStep
	global	main@enumInteralStep
	global	main@enumMainLoopStep
	global	main@ucADC4_Step
	global	main@ucChannel4Type
	global	main@ucLoaderStep
	global	main@ucLoaderStep1
	global	main@ucLoaderStep2
	global	main@ucLoaderStep3
	global	main@ucLoaderStep4
	global	main@ucTimer1s
	global	main@ucTimer20s
	global	main@ucTimerADC1ZeroP5s
	global	main@ucTimerDelay
	global	main@ucTimerDelay1
	global	main@ucTimerDelay2
	global	main@ucTimerDelay3
	global	main@ucTimerDelay4
	global	main@ucTimerP3s
	global	main@ucTimerRightP5s
	global	main@ucTimerX1P5s
	global	main@ucTimerX2P5s
	global	main@ucTimerZeroPoint3s
	global	main@ucTimerZeroPoint5s
	global	_uiTwentySecondsTimer
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
	global	_PA3
_PA3	set	43
	global	_PA6
_PA6	set	46
	global	_PA7
_PA7	set	47
	global	_PB0
_PB0	set	48
	global	_PB1
_PB1	set	49
	global	_PB6
_PB6	set	54
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
	global	_TRISB0
_TRISB0	set	1072
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
	global	_PAOD7
_PAOD7	set	3135
	global	_PBOD6
_PBOD6	set	3142
	file	"ProjTest.as"
	line	#
psect cinit,class=CODE,delta=2
global start_initialization
start_initialization:

psect	bssCOMMON,class=COMMON,space=1
global __pbssCOMMON
__pbssCOMMON:
_uiTwentySecondsTimer:
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

_adc_original_CH14_value:
       ds      2

_adc_original_CH1_value:
       ds      2

_adc_original_CH4_value:
       ds      2

_adc_original_value:
       ds      2

_multiFilterMaxValue:
       ds      2

_multiFilterMinValue:
       ds      2

_uiBigTimer:
       ds      2

_uiSmallTimer:
       ds      2

_sampleTimes:
       ds      1

main@cTimer1s_809:
       ds      1

main@enumBranchStep:
       ds      1

main@enumInteralStep:
       ds      1

main@enumMainLoopStep:
       ds      1

main@ucADC4_Step:
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

main@ucTimer1s:
       ds      1

main@ucTimer20s:
       ds      1

main@ucTimerADC1ZeroP5s:
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

main@ucTimerP3s:
       ds      1

main@ucTimerRightP5s:
       ds      1

main@ucTimerX1P5s:
       ds      1

main@ucTimerX2P5s:
       ds      1

main@ucTimerZeroPoint3s:
       ds      1

main@ucTimerZeroPoint5s:
       ds      1

psect	dataBANK0,class=BANK0,space=1
global __pdataBANK0
__pdataBANK0:
	file	"C:\190604\AK7030-OTP\common.c"
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
	movlw	low((__pbssBANK0)+036h)
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
	global	?_clearTwelveHoursTimer
?_clearTwelveHoursTimer:	; 0 bytes @ 0x0
	global	?_clearThreeHoursTimer
?_clearThreeHoursTimer:	; 0 bytes @ 0x0
	global	?_clearTwentySecondsTimer
?_clearTwentySecondsTimer:	; 0 bytes @ 0x0
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
	global	?_startTwentySecondsTimer
?_startTwentySecondsTimer:	; 0 bytes @ 0x0
	global	?_AD_Sample
?_AD_Sample:	; 0 bytes @ 0x0
	global	?_clearAllTimer
?_clearAllTimer:	; 0 bytes @ 0x0
	global	?_clearPinPortAndTimer
?_clearPinPortAndTimer:	; 0 bytes @ 0x0
	global	?_initPin
?_initPin:	; 0 bytes @ 0x0
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
	global	?_isFinishedTwelveHoursTimer
?_isFinishedTwelveHoursTimer:	; 1 bytes @ 0x0
	global	?_isFinishedTwentySecondsTimer
?_isFinishedTwentySecondsTimer:	; 1 bytes @ 0x0
	global	?_isFinishedThreeHoursTimer
?_isFinishedThreeHoursTimer:	; 1 bytes @ 0x0
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
	global	??_clearTwelveHoursTimer
??_clearTwelveHoursTimer:	; 0 bytes @ 0x0
	global	??_clearThreeHoursTimer
??_clearThreeHoursTimer:	; 0 bytes @ 0x0
	global	??_clearTwentySecondsTimer
??_clearTwentySecondsTimer:	; 0 bytes @ 0x0
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
	global	?_startTwelveHourTimer
?_startTwelveHourTimer:	; 0 bytes @ 0x0
	global	??_isFinishedTwelveHoursTimer
??_isFinishedTwelveHoursTimer:	; 0 bytes @ 0x0
	global	??_startTwentySecondsTimer
??_startTwentySecondsTimer:	; 0 bytes @ 0x0
	global	??_isFinishedTwentySecondsTimer
??_isFinishedTwentySecondsTimer:	; 0 bytes @ 0x0
	global	?_startThreeHoursTimer
?_startThreeHoursTimer:	; 0 bytes @ 0x0
	global	??_isFinishedThreeHoursTimer
??_isFinishedThreeHoursTimer:	; 0 bytes @ 0x0
	global	??_clearAllTimer
??_clearAllTimer:	; 0 bytes @ 0x0
	global	??_clearPinPortAndTimer
??_clearPinPortAndTimer:	; 0 bytes @ 0x0
	global	??_initPin
??_initPin:	; 0 bytes @ 0x0
	global	??_getAD_ConvertFlag
??_getAD_ConvertFlag:	; 0 bytes @ 0x0
	global	??_setAD_ConvertFlag
??_setAD_ConvertFlag:	; 0 bytes @ 0x0
	global	?_getAdOriginalCh14Value
?_getAdOriginalCh14Value:	; 2 bytes @ 0x0
	global	?_getAdOriginalCh1Value
?_getAdOriginalCh1Value:	; 2 bytes @ 0x0
	global	?_getAdOriginaCh4Value
?_getAdOriginaCh4Value:	; 2 bytes @ 0x0
	global	?_getAdOriginalValue
?_getAdOriginalValue:	; 2 bytes @ 0x0
	global	setAD_ConvertFlag@flag
setAD_ConvertFlag@flag:	; 1 bytes @ 0x0
	global	adc_test_init@ref
adc_test_init@ref:	; 1 bytes @ 0x0
	global	startTwelveHourTimer@uiSetTime
startTwelveHourTimer@uiSetTime:	; 2 bytes @ 0x0
	global	startThreeHoursTimer@uiSetTime
startThreeHoursTimer@uiSetTime:	; 2 bytes @ 0x0
	ds	1
	global	??_adc_test_init
??_adc_test_init:	; 0 bytes @ 0x1
	ds	1
	global	??_getAdOriginalCh14Value
??_getAdOriginalCh14Value:	; 0 bytes @ 0x2
	global	??_getAdOriginalCh1Value
??_getAdOriginalCh1Value:	; 0 bytes @ 0x2
	global	??_startTwelveHourTimer
??_startTwelveHourTimer:	; 0 bytes @ 0x2
	global	??_getAdOriginaCh4Value
??_getAdOriginaCh4Value:	; 0 bytes @ 0x2
	global	??_startThreeHoursTimer
??_startThreeHoursTimer:	; 0 bytes @ 0x2
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
;;Data sizes: Strings 0, constant 0, data 1, bss 59, persistent 0 stack 0
;;Auto spaces:   Size  Autos    Used
;; COMMON          14      6      11
;; BANK0           80      5      60
;; BANK1           80      0       0
;; BANK3           96      0       0
;; BANK2           96      0       0

;;
;; Pointer list with targets:

;; ?_adc_get	unsigned int  size(1) Largest target is 0
;;
;; ?_getAdOriginalCh14Value	unsigned int  size(1) Largest target is 0
;;
;; ?_getAdOriginaCh4Value	unsigned int  size(1) Largest target is 0
;;
;; ?_getAdOriginalCh1Value	unsigned int  size(1) Largest target is 0
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
;; (0) _main                                                 0     0      0     222
;;                            _initPin
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
;;             _getAdOriginalCh14Value
;;               _clearPinPortAndTimer
;;              _getAdOriginalCh1Value
;;               _startTwelveHourTimer
;;         _isFinishedTwelveHoursTimer
;;            _startTwentySecondsTimer
;;               _getAdOriginaCh4Value
;;       _isFinishedTwentySecondsTimer
;;               _startThreeHoursTimer
;;          _isFinishedThreeHoursTimer
;;               _clearThreeHoursTimer
;;                      _clearAllTimer
;; ---------------------------------------------------------------------------------
;; (1) _process_AD_Converter_Value                           0     0      0     134
;;                  _getAD_ConvertFlag
;;                  _setAD_ConvertFlag
;;                          _AD_Sample
;;                      _adc_test_init
;;                          _adc_start
;; ---------------------------------------------------------------------------------
;; (1) _clearPinPortAndTimer                                 0     0      0       0
;;                      _clearAllTimer
;; ---------------------------------------------------------------------------------
;; (2) _AD_Sample                                            3     3      0      68
;;                                              2 BANK0      3     3      0
;;                 _getAdOriginalValue
;; ---------------------------------------------------------------------------------
;; (1) _clearAllTimer                                        0     0      0       0
;;              _clearTwelveHoursTimer
;;               _clearThreeHoursTimer
;;            _clearTwentySecondsTimer
;; ---------------------------------------------------------------------------------
;; (3) _getAdOriginalValue                                   2     0      2       0
;;                                              0 BANK0      2     0      2
;; ---------------------------------------------------------------------------------
;; (2) _setAD_ConvertFlag                                    1     1      0      22
;;                                              0 BANK0      1     1      0
;; ---------------------------------------------------------------------------------
;; (2) _getAD_ConvertFlag                                    0     0      0       0
;; ---------------------------------------------------------------------------------
;; (1) _isFinishedThreeHoursTimer                            0     0      0       0
;; ---------------------------------------------------------------------------------
;; (1) _startThreeHoursTimer                                 2     0      2      22
;;                                              0 BANK0      2     0      2
;; ---------------------------------------------------------------------------------
;; (1) _isFinishedTwentySecondsTimer                         0     0      0       0
;; ---------------------------------------------------------------------------------
;; (1) _getAdOriginaCh4Value                                 2     0      2       0
;;                                              0 BANK0      2     0      2
;; ---------------------------------------------------------------------------------
;; (1) _startTwentySecondsTimer                              0     0      0       0
;; ---------------------------------------------------------------------------------
;; (1) _isFinishedTwelveHoursTimer                           0     0      0       0
;; ---------------------------------------------------------------------------------
;; (1) _startTwelveHourTimer                                 2     0      2      22
;;                                              0 BANK0      2     0      2
;; ---------------------------------------------------------------------------------
;; (1) _getAdOriginalCh1Value                                2     0      2       0
;;                                              0 BANK0      2     0      2
;; ---------------------------------------------------------------------------------
;; (1) _getAdOriginalCh14Value                               2     0      2       0
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
;; (1) _initPin                                              0     0      0       0
;; ---------------------------------------------------------------------------------
;; (2) _clearTwentySecondsTimer                              0     0      0       0
;; ---------------------------------------------------------------------------------
;; (2) _clearThreeHoursTimer                                 0     0      0       0
;; ---------------------------------------------------------------------------------
;; (2) _clearTwelveHoursTimer                                0     0      0       0
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
;;   _initPin
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
;;   _getAdOriginalCh14Value
;;   _clearPinPortAndTimer
;;     _clearAllTimer
;;       _clearTwelveHoursTimer
;;       _clearThreeHoursTimer
;;       _clearTwentySecondsTimer
;;   _getAdOriginalCh1Value
;;   _startTwelveHourTimer
;;   _isFinishedTwelveHoursTimer
;;   _startTwentySecondsTimer
;;   _getAdOriginaCh4Value
;;   _isFinishedTwentySecondsTimer
;;   _startThreeHoursTimer
;;   _isFinishedThreeHoursTimer
;;   _clearThreeHoursTimer
;;   _clearAllTimer
;;     _clearTwelveHoursTimer
;;     _clearThreeHoursTimer
;;     _clearTwentySecondsTimer
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
;;DATA                 0      0      4E       6        0.0%
;;ABS                  0      0      47       3        0.0%
;;NULL                 0      0       0       0        0.0%
;;STACK                0      0       7       2        0.0%
;;BANK0               50      5      3C       5       75.0%
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
;;		line 129 in file "C:\190604\AK7030-OTP\main.c"
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
;;		_initPin
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
;;		_getAdOriginalCh14Value
;;		_clearPinPortAndTimer
;;		_getAdOriginalCh1Value
;;		_startTwelveHourTimer
;;		_isFinishedTwelveHoursTimer
;;		_startTwentySecondsTimer
;;		_getAdOriginaCh4Value
;;		_isFinishedTwentySecondsTimer
;;		_startThreeHoursTimer
;;		_isFinishedThreeHoursTimer
;;		_clearThreeHoursTimer
;;		_clearAllTimer
;; This function is called by:
;;		Startup code after reset
;; This function uses a non-reentrant model
;;
psect	maintext
	file	"C:\190604\AK7030-OTP\main.c"
	line	129
	global	__size_of_main
	__size_of_main	equ	__end_of_main-_main
	
_main:	
	opt	stack 3
; Regs used in _main: [wreg-fsr0h+status,2+status,0+pclath+cstack]
	line	150
	
l3938:	
;main.c: 130: enum setp_Adc4
;main.c: 131: {
;main.c: 132: ADC4_STEP_INIT = 0,
;main.c: 133: ADC4_STEP_FIRST,
;main.c: 134: ADC4_STEP_SECOND,
;main.c: 135: ADC4_STEP_THIRD,
;main.c: 136: ADC4_STEP_FOURTH,
;main.c: 137: ADC4_STEP_FIFTH,
;main.c: 138: ADC4_STEP_SIXTH,
;main.c: 139: };
;main.c: 142: static unsigned char ucWaitTime1S = 0;
;main.c: 144: static unsigned char ucWaitTimeO3s = 0;
;main.c: 146: static unsigned char ucSmallTimerActionFlag = 0;
;main.c: 148: static unsigned char ucSetSmallActionFlag = 0;
	bsf	status, 5	;RP0=1, select bank1
	bcf	(1064/8)^080h,(1064)&7
	line	151
;main.c: 151: TRISA1 = 0;
	bcf	(1065/8)^080h,(1065)&7
	line	152
;main.c: 152: TRISA2 = 0;
	bcf	(1066/8)^080h,(1066)&7
	line	153
;main.c: 153: TRISA3 = 0;
	bcf	(1067/8)^080h,(1067)&7
	line	154
;main.c: 154: TRISB0 = 0;
	bcf	(1072/8)^080h,(1072)&7
	line	155
;main.c: 155: TRISB1 = 0;
	bcf	(1073/8)^080h,(1073)&7
	line	156
;main.c: 156: TRISA6 = 0;
	bcf	(1070/8)^080h,(1070)&7
	line	157
;main.c: 157: TRISA7 = 0;
	bcf	(1071/8)^080h,(1071)&7
	line	158
;main.c: 158: TRISB6 = 0;
	bcf	(1078/8)^080h,(1078)&7
	line	161
	
l3940:	
;main.c: 161: initPin();
	fcall	_initPin
	line	164
	
l3942:	
;main.c: 164: TRISB2 = 1;
	bcf	status, 6	;RP1=0, select bank1
	bsf	(1074/8)^080h,(1074)&7
	line	166
	
l3944:	
;main.c: 166: TRISB7 = 1;
	bsf	(1079/8)^080h,(1079)&7
	line	167
	
l3946:	
;main.c: 167: TRISB4 = 1;
	bsf	(1076/8)^080h,(1076)&7
	line	169
	
l3948:	
;main.c: 169: clock_config();
	fcall	_clock_config
	line	170
	
l3950:	
;main.c: 170: timer1_config();
	fcall	_timer1_config
	line	171
;main.c: 171: timer1_interrupt_config();
	fcall	_timer1_interrupt_config
	line	173
	
l3952:	
;main.c: 173: adc_test_init(14,3);
	movlw	(03h)
	bcf	status, 5	;RP0=0, select bank0
	movwf	(?_adc_test_init)
	movlw	(0Eh)
	fcall	_adc_test_init
	line	175
	
l3954:	
;main.c: 175: dac_init();
	fcall	_dac_init
	line	176
	
l3956:	
;main.c: 176: op1_init();
	fcall	_op1_init
	line	177
	
l3958:	
;main.c: 177: op2_init();
	fcall	_op2_init
	line	180
;main.c: 180: adc_start();
	fcall	_adc_start
	line	213
	
l3960:	
# 213 "C:\190604\AK7030-OTP\main.c"
 clrwdt ;#
psect	maintext
	line	215
	
l3962:	
;main.c: 215: if(isPermitSampleTime())
	fcall	_isPermitSampleTime
	xorlw	0
	skipnz
	goto	u1041
	goto	u1040
u1041:
	goto	l3960
u1040:
	line	217
	
l3964:	
;main.c: 216: {
;main.c: 217: clrSampeTime();
	fcall	_clrSampeTime
	line	218
	
l3966:	
;main.c: 218: process_AD_Converter_Value();
	fcall	_process_AD_Converter_Value
	line	220
;main.c: 220: switch(enumMainLoopStep)
	goto	l4440
	line	225
	
l3968:	
;main.c: 223: {
;main.c: 224: static unsigned char ucTimerZeroPoint5s = 0;
;main.c: 225: if(getAdOriginalCh14Value() > 1950)
	fcall	_getAdOriginalCh14Value
	movlw	high(079Fh)
	subwf	(1+(?_getAdOriginalCh14Value)),w
	movlw	low(079Fh)
	skipnz
	subwf	(0+(?_getAdOriginalCh14Value)),w
	skipc
	goto	u1051
	goto	u1050
u1051:
	goto	l3972
u1050:
	line	227
	
l3970:	
;main.c: 226: {
;main.c: 227: ucTimerZeroPoint5s++;
	incf	(main@ucTimerZeroPoint5s),f
	line	228
;main.c: 228: }
	goto	l3974
	line	230
	
l3972:	
;main.c: 229: else
;main.c: 230: ucTimerZeroPoint5s = 0;
	clrf	(main@ucTimerZeroPoint5s)
	line	232
	
l3974:	
;main.c: 232: if(ucTimerZeroPoint5s >= 5)
	movlw	(05h)
	subwf	(main@ucTimerZeroPoint5s),w
	skipc
	goto	u1061
	goto	u1060
u1061:
	goto	l3960
u1060:
	line	234
	
l3976:	
;main.c: 233: {
;main.c: 234: ucTimerZeroPoint5s = 0;
	clrf	(main@ucTimerZeroPoint5s)
	line	235
	
l3978:	
;main.c: 235: enumMainLoopStep = MAIN_LOOP_STEP_FIRST;
	clrf	(main@enumMainLoopStep)
	incf	(main@enumMainLoopStep),f
	goto	l3960
	line	236
	
l706:	
	line	237
;main.c: 236: }
;main.c: 237: break;
	goto	l3960
	line	244
	
l3980:	
;main.c: 241: {
;main.c: 242: static unsigned char ucTimerZeroPoint3s = 0;
;main.c: 244: if(ucTimerZeroPoint3s < 3)
	movlw	(03h)
	subwf	(main@ucTimerZeroPoint3s),w
	skipnc
	goto	u1071
	goto	u1070
u1071:
	goto	l3984
u1070:
	line	246
	
l3982:	
;main.c: 245: {
;main.c: 246: ucTimerZeroPoint3s++;
	incf	(main@ucTimerZeroPoint3s),f
	line	247
;main.c: 247: }
	goto	l3960
	line	250
	
l3984:	
;main.c: 248: else
;main.c: 249: {
;main.c: 250: ucTimerZeroPoint3s = 0;
	clrf	(main@ucTimerZeroPoint3s)
	line	252
	
l3986:	
;main.c: 252: if(getAdOriginalCh14Value() > 1950)
	fcall	_getAdOriginalCh14Value
	movlw	high(079Fh)
	subwf	(1+(?_getAdOriginalCh14Value)),w
	movlw	low(079Fh)
	skipnz
	subwf	(0+(?_getAdOriginalCh14Value)),w
	skipc
	goto	u1081
	goto	u1080
u1081:
	goto	l3990
u1080:
	line	255
	
l3988:	
;main.c: 253: {
;main.c: 255: enumMainLoopStep = MAIN_LOOP_STEP_SECOND;
	movlw	(02h)
	movwf	(main@enumMainLoopStep)
	line	256
;main.c: 256: }
	goto	l3960
	line	259
	
l3990:	
;main.c: 257: else
;main.c: 258: {
;main.c: 259: clearPinPortAndTimer();
	fcall	_clearPinPortAndTimer
	goto	l3960
	line	265
;main.c: 263: }
;main.c: 265: case MAIN_LOOP_STEP_SECOND:
	
l715:	
	line	268
;main.c: 266: {
;main.c: 268: PA6 = 1;
	bsf	(46/8),(46)&7
	line	269
	
l3992:	
;main.c: 269: enumMainLoopStep = MAIN_LOOP_STEP_THIRD;
	movlw	(03h)
	movwf	(main@enumMainLoopStep)
	line	271
;main.c: 271: break;
	goto	l3960
	line	278
	
l3994:	
;main.c: 275: {
;main.c: 276: static unsigned char ucTimerADC1ZeroP5s = 0;
;main.c: 278: if(getAdOriginalCh1Value() < 130)
	fcall	_getAdOriginalCh1Value
	movlw	high(082h)
	subwf	(1+(?_getAdOriginalCh1Value)),w
	movlw	low(082h)
	skipnz
	subwf	(0+(?_getAdOriginalCh1Value)),w
	skipnc
	goto	u1091
	goto	u1090
u1091:
	goto	l3998
u1090:
	line	280
	
l3996:	
;main.c: 279: {
;main.c: 280: ucTimerADC1ZeroP5s = 0;
	clrf	(main@ucTimerADC1ZeroP5s)
	line	282
;main.c: 282: }
	goto	l4000
	line	285
	
l3998:	
;main.c: 283: else
;main.c: 284: {
;main.c: 285: ucTimerADC1ZeroP5s++;
	incf	(main@ucTimerADC1ZeroP5s),f
	line	288
	
l4000:	
;main.c: 286: }
;main.c: 288: if(ucTimerADC1ZeroP5s >= 1)
	movf	(main@ucTimerADC1ZeroP5s),w
	skipz
	goto	u1100
	goto	l4006
u1100:
	line	290
	
l4002:	
;main.c: 289: {
;main.c: 290: ucTimerADC1ZeroP5s = 0;
	clrf	(main@ucTimerADC1ZeroP5s)
	line	291
	
l4004:	
;main.c: 291: enumMainLoopStep = MAIN_LOOP_STEP_FOURTH;
	movlw	(04h)
	movwf	(main@enumMainLoopStep)
	line	292
;main.c: 292: }
	goto	l3960
	line	297
	
l4006:	
;main.c: 293: else
;main.c: 294: {
;main.c: 295: static unsigned char ucTimerRightP5s = 0;
;main.c: 297: if(getAdOriginalCh1Value() < 117)
	fcall	_getAdOriginalCh1Value
	movlw	high(075h)
	subwf	(1+(?_getAdOriginalCh1Value)),w
	movlw	low(075h)
	skipnz
	subwf	(0+(?_getAdOriginalCh1Value)),w
	skipnc
	goto	u1111
	goto	u1110
u1111:
	goto	l4010
u1110:
	line	299
	
l4008:	
;main.c: 298: {
;main.c: 299: ucTimerRightP5s++;
	incf	(main@ucTimerRightP5s),f
	line	300
;main.c: 300: }
	goto	l4012
	line	303
	
l4010:	
;main.c: 301: else
;main.c: 302: {
;main.c: 303: ucTimerRightP5s = 0;
	clrf	(main@ucTimerRightP5s)
	line	306
	
l4012:	
;main.c: 304: }
;main.c: 306: if(ucTimerRightP5s >= 1)
	movf	(main@ucTimerRightP5s),w
	skipz
	goto	u1120
	goto	l706
u1120:
	line	308
	
l4014:	
;main.c: 307: {
;main.c: 308: ucTimerRightP5s = 0;
	clrf	(main@ucTimerRightP5s)
	line	309
	
l4016:	
;main.c: 309: enumMainLoopStep = MAIN_LOOP_STEP_3_HOUR_BRANCH;
	movlw	(08h)
	movwf	(main@enumMainLoopStep)
	line	310
;main.c: 310: }
	goto	l3960
	line	323
	
l4018:	
;main.c: 321: {
;main.c: 323: startTwelveHourTimer(180);
	movlw	0B4h
	movwf	(?_startTwelveHourTimer)
	clrf	(?_startTwelveHourTimer+1)
	fcall	_startTwelveHourTimer
	line	324
	
l4020:	
;main.c: 324: enumMainLoopStep = MAIN_LOOP_STEP_FIFTH;
	movlw	(05h)
	movwf	(main@enumMainLoopStep)
	line	326
;main.c: 326: break;
	goto	l3960
	line	332
	
l4022:	
;main.c: 330: {
;main.c: 332: if(isFinishedTwelveHoursTimer())
	fcall	_isFinishedTwelveHoursTimer
	xorlw	0
	skipnz
	goto	u1131
	goto	u1130
u1131:
	goto	l4336
u1130:
	line	334
	
l4024:	
;main.c: 333: {
;main.c: 334: enumMainLoopStep = MAIN_LOOP_STEP_12_HOUR_END;
	movlw	(09h)
	movwf	(main@enumMainLoopStep)
	line	335
;main.c: 335: }
	goto	l3960
	line	344
	
l4026:	
;main.c: 343: {
;main.c: 344: startTwentySecondsTimer();
	fcall	_startTwentySecondsTimer
	line	345
	
l4028:	
;main.c: 345: ucADC4_Step = ADC4_STEP_FIRST;
	clrf	(main@ucADC4_Step)
	incf	(main@ucADC4_Step),f
	line	346
;main.c: 346: break;
	goto	l3960
	line	351
	
l4030:	
;main.c: 350: {
;main.c: 351: if(getAdOriginaCh4Value() < 1911)
	fcall	_getAdOriginaCh4Value
	movlw	high(0777h)
	subwf	(1+(?_getAdOriginaCh4Value)),w
	movlw	low(0777h)
	skipnz
	subwf	(0+(?_getAdOriginaCh4Value)),w
	skipnc
	goto	u1141
	goto	u1140
u1141:
	goto	l4034
u1140:
	line	352
	
l4032:	
;main.c: 352: ucChannel4Type = LESS_THAN_1911;
	clrf	(main@ucChannel4Type)
	goto	l740
	line	353
	
l4034:	
;main.c: 353: else if(getAdOriginaCh4Value() < 2067)
	fcall	_getAdOriginaCh4Value
	movlw	high(0813h)
	subwf	(1+(?_getAdOriginaCh4Value)),w
	movlw	low(0813h)
	skipnz
	subwf	(0+(?_getAdOriginaCh4Value)),w
	skipnc
	goto	u1151
	goto	u1150
u1151:
	goto	l4038
u1150:
	line	354
	
l4036:	
;main.c: 354: ucChannel4Type = BETWEEN_1911_AND_2067;
	clrf	(main@ucChannel4Type)
	incf	(main@ucChannel4Type),f
	goto	l740
	line	355
	
l4038:	
;main.c: 355: else if(getAdOriginaCh4Value() < 2204)
	fcall	_getAdOriginaCh4Value
	movlw	high(089Ch)
	subwf	(1+(?_getAdOriginaCh4Value)),w
	movlw	low(089Ch)
	skipnz
	subwf	(0+(?_getAdOriginaCh4Value)),w
	skipnc
	goto	u1161
	goto	u1160
u1161:
	goto	l4042
u1160:
	line	356
	
l4040:	
;main.c: 356: ucChannel4Type = BETWEEN_2067_AND_2204;
	movlw	(02h)
	movwf	(main@ucChannel4Type)
	goto	l740
	line	357
	
l4042:	
;main.c: 357: else if(getAdOriginaCh4Value() < 2340)
	fcall	_getAdOriginaCh4Value
	movlw	high(0924h)
	subwf	(1+(?_getAdOriginaCh4Value)),w
	movlw	low(0924h)
	skipnz
	subwf	(0+(?_getAdOriginaCh4Value)),w
	skipnc
	goto	u1171
	goto	u1170
u1171:
	goto	l4046
u1170:
	line	358
	
l4044:	
;main.c: 358: ucChannel4Type = BETWEEN_2204_AND_2340;
	movlw	(03h)
	movwf	(main@ucChannel4Type)
	goto	l740
	line	360
	
l4046:	
;main.c: 359: else
;main.c: 360: ucChannel4Type = MORE_THAN_2340;
	movlw	(04h)
	movwf	(main@ucChannel4Type)
	
l740:	
	line	362
;main.c: 362: ucADC4_Step = ADC4_STEP_SECOND;
	movlw	(02h)
	movwf	(main@ucADC4_Step)
	line	363
;main.c: 363: break;
	goto	l3960
	line	378
;main.c: 377: {
;main.c: 378: case 0:
	
l755:	
	line	380
;main.c: 379: {
;main.c: 380: PB0 = 1;
	bsf	(48/8),(48)&7
	line	381
	
l4048:	
;main.c: 381: ucLoaderStep++;
	incf	(main@ucLoaderStep),f
	line	382
;main.c: 382: break;
	goto	l3960
	line	387
	
l4050:	
;main.c: 386: {
;main.c: 387: if(ucTimerDelay >= 5)
	movlw	(05h)
	subwf	(main@ucTimerDelay),w
	skipc
	goto	u1181
	goto	u1180
u1181:
	goto	l4058
u1180:
	line	389
	
l4052:	
;main.c: 388: {
;main.c: 389: PA0 = 1;
	bsf	(40/8),(40)&7
	line	390
	
l4054:	
;main.c: 390: ucTimerDelay = 0;
	clrf	(main@ucTimerDelay)
	goto	l4048
	line	394
	
l4058:	
;main.c: 393: else
;main.c: 394: ucTimerDelay++;
	incf	(main@ucTimerDelay),f
	goto	l3960
	line	400
	
l4060:	
;main.c: 399: {
;main.c: 400: if(ucTimerDelay >= 5)
	movlw	(05h)
	subwf	(main@ucTimerDelay),w
	skipc
	goto	u1191
	goto	u1190
u1191:
	goto	l4058
u1190:
	line	402
	
l4062:	
;main.c: 401: {
;main.c: 402: PA1= 1;
	bsf	(41/8),(41)&7
	goto	l4054
	line	414
	
l4070:	
;main.c: 413: {
;main.c: 414: if(ucTimerDelay >= 5)
	movlw	(05h)
	subwf	(main@ucTimerDelay),w
	skipc
	goto	u1201
	goto	u1200
u1201:
	goto	l4058
u1200:
	line	416
	
l4072:	
;main.c: 415: {
;main.c: 416: PA2= 1;
	bsf	(42/8),(42)&7
	goto	l4054
	line	427
	
l4080:	
;main.c: 426: {
;main.c: 427: if(ucTimerDelay >= 5)
	movlw	(05h)
	subwf	(main@ucTimerDelay),w
	skipc
	goto	u1211
	goto	u1210
u1211:
	goto	l4058
u1210:
	line	429
	
l4082:	
;main.c: 428: {
;main.c: 429: PA3 = 1;
	bsf	(43/8),(43)&7
	goto	l4054
	line	440
	
l4090:	
;main.c: 439: {
;main.c: 440: if(ucTimerDelay >= 5)
	movlw	(05h)
	subwf	(main@ucTimerDelay),w
	skipc
	goto	u1221
	goto	u1220
u1221:
	goto	l4058
u1220:
	line	442
	
l4092:	
;main.c: 441: {
;main.c: 442: PB0 = 0;
	bcf	(48/8),(48)&7
	line	443
;main.c: 443: PA0 = 0;
	bcf	(40/8),(40)&7
	line	444
;main.c: 444: PA1 = 0;
	bcf	(41/8),(41)&7
	line	445
;main.c: 445: PA2 = 0;
	bcf	(42/8),(42)&7
	line	446
;main.c: 446: PA3 = 0;
	bcf	(43/8),(43)&7
	goto	l4054
	line	457
	
l4100:	
;main.c: 456: {
;main.c: 457: if(ucTimerDelay >= 2)
	movlw	(02h)
	subwf	(main@ucTimerDelay),w
	skipc
	goto	u1231
	goto	u1230
u1231:
	goto	l4058
u1230:
	line	459
	
l4102:	
;main.c: 458: {
;main.c: 459: ucTimerDelay = 0;
	clrf	(main@ucTimerDelay)
	line	461
;main.c: 461: ucLoaderStep = 0;
	clrf	(main@ucLoaderStep)
	line	462
	
l4104:	
;main.c: 462: ucADC4_Step = ADC4_STEP_THIRD;
	movlw	(03h)
	movwf	(main@ucADC4_Step)
	line	463
;main.c: 463: }
	goto	l3960
	line	376
	
l4110:	
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
goto l706
movlw high(S4658)
movwf pclath
	clrc
	rlf fsr,w
	addlw low(S4658)
	movwf pc
psect	swtext1,local,class=CONST,delta=2
global __pswtext1
__pswtext1:
S4658:
	ljmp	l755
	ljmp	l4050
	ljmp	l4060
	ljmp	l4070
	ljmp	l4080
	ljmp	l4090
	ljmp	l4100
psect	maintext

	line	483
;main.c: 482: {
;main.c: 483: case 0:
	
l783:	
	line	485
;main.c: 484: {
;main.c: 485: PB0 = 1;
	bsf	(48/8),(48)&7
	line	486
	
l4112:	
;main.c: 486: ucLoaderStep1++;
	incf	(main@ucLoaderStep1),f
	line	487
;main.c: 487: break;
	goto	l3960
	line	492
	
l4114:	
;main.c: 491: {
;main.c: 492: if(ucTimerDelay1 >= 5)
	movlw	(05h)
	subwf	(main@ucTimerDelay1),w
	skipc
	goto	u1241
	goto	u1240
u1241:
	goto	l4122
u1240:
	line	494
	
l4116:	
;main.c: 493: {
;main.c: 494: PA0 = 1;
	bsf	(40/8),(40)&7
	line	495
	
l4118:	
;main.c: 495: ucTimerDelay1 = 0;
	clrf	(main@ucTimerDelay1)
	goto	l4112
	line	499
	
l4122:	
;main.c: 498: else
;main.c: 499: ucTimerDelay1++;
	incf	(main@ucTimerDelay1),f
	goto	l3960
	line	505
	
l4124:	
;main.c: 504: {
;main.c: 505: if(ucTimerDelay1 >= 5)
	movlw	(05h)
	subwf	(main@ucTimerDelay1),w
	skipc
	goto	u1251
	goto	u1250
u1251:
	goto	l4122
u1250:
	line	507
	
l4126:	
;main.c: 506: {
;main.c: 507: PA1= 1;
	bsf	(41/8),(41)&7
	goto	l4118
	line	518
	
l4134:	
;main.c: 517: {
;main.c: 518: if(ucTimerDelay1 >= 5)
	movlw	(05h)
	subwf	(main@ucTimerDelay1),w
	skipc
	goto	u1261
	goto	u1260
u1261:
	goto	l4122
u1260:
	line	520
	
l4136:	
;main.c: 519: {
;main.c: 520: PA2 = 1;
	bsf	(42/8),(42)&7
	goto	l4118
	line	531
	
l4144:	
;main.c: 530: {
;main.c: 531: if(ucTimerDelay1 >= 5)
	movlw	(05h)
	subwf	(main@ucTimerDelay1),w
	skipc
	goto	u1271
	goto	u1270
u1271:
	goto	l4122
u1270:
	line	533
	
l4146:	
;main.c: 532: {
;main.c: 533: PA3 = 1;
	bsf	(43/8),(43)&7
	goto	l4118
	line	544
	
l4154:	
;main.c: 543: {
;main.c: 544: if(ucTimerDelay1 >= 5)
	movlw	(05h)
	subwf	(main@ucTimerDelay1),w
	skipc
	goto	u1281
	goto	u1280
u1281:
	goto	l4122
u1280:
	line	546
	
l4156:	
;main.c: 545: {
;main.c: 546: PA0 = 0;
	bcf	(40/8),(40)&7
	line	547
;main.c: 547: PA1 = 0;
	bcf	(41/8),(41)&7
	line	548
;main.c: 548: PA2 = 0;
	bcf	(42/8),(42)&7
	line	549
;main.c: 549: PA3 = 0;
	bcf	(43/8),(43)&7
	goto	l4118
	line	560
	
l4164:	
;main.c: 559: {
;main.c: 560: if(ucTimerDelay1 >= 2)
	movlw	(02h)
	subwf	(main@ucTimerDelay1),w
	skipc
	goto	u1291
	goto	u1290
u1291:
	goto	l4122
u1290:
	line	562
	
l4166:	
;main.c: 561: {
;main.c: 562: ucTimerDelay1 = 0;
	clrf	(main@ucTimerDelay1)
	line	564
;main.c: 564: ucLoaderStep1 = 0;
	clrf	(main@ucLoaderStep1)
	goto	l4104
	line	481
	
l4174:	
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
goto l706
movlw high(S4660)
movwf pclath
	clrc
	rlf fsr,w
	addlw low(S4660)
	movwf pc
psect	swtext2,local,class=CONST,delta=2
global __pswtext2
__pswtext2:
S4660:
	ljmp	l783
	ljmp	l4114
	ljmp	l4124
	ljmp	l4134
	ljmp	l4144
	ljmp	l4154
	ljmp	l4164
psect	maintext

	line	587
;main.c: 586: {
;main.c: 587: case 0:
	
l810:	
	line	589
;main.c: 588: {
;main.c: 589: PB0 = 1;
	bsf	(48/8),(48)&7
	line	590
;main.c: 590: PA0 = 1;
	bsf	(40/8),(40)&7
	line	591
	
l4176:	
;main.c: 591: ucLoaderStep2++;
	incf	(main@ucLoaderStep2),f
	line	592
;main.c: 592: break;
	goto	l3960
	line	597
	
l4178:	
;main.c: 596: {
;main.c: 597: if(ucTimerDelay2 >= 5)
	movlw	(05h)
	subwf	(main@ucTimerDelay2),w
	skipc
	goto	u1301
	goto	u1300
u1301:
	goto	l4186
u1300:
	line	599
	
l4180:	
;main.c: 598: {
;main.c: 599: PA1 = 1;
	bsf	(41/8),(41)&7
	line	600
	
l4182:	
;main.c: 600: ucTimerDelay2 = 0;
	clrf	(main@ucTimerDelay2)
	goto	l4176
	line	604
	
l4186:	
;main.c: 603: else
;main.c: 604: ucTimerDelay2++;
	incf	(main@ucTimerDelay2),f
	goto	l3960
	line	610
	
l4188:	
;main.c: 609: {
;main.c: 610: if(ucTimerDelay2 >= 5)
	movlw	(05h)
	subwf	(main@ucTimerDelay2),w
	skipc
	goto	u1311
	goto	u1310
u1311:
	goto	l4186
u1310:
	line	612
	
l4190:	
;main.c: 611: {
;main.c: 612: PA2 = 1;
	bsf	(42/8),(42)&7
	goto	l4182
	line	623
	
l4198:	
;main.c: 622: {
;main.c: 623: if(ucTimerDelay2 >= 5)
	movlw	(05h)
	subwf	(main@ucTimerDelay2),w
	skipc
	goto	u1321
	goto	u1320
u1321:
	goto	l4186
u1320:
	line	625
	
l4200:	
;main.c: 624: {
;main.c: 625: PA3 = 1;
	bsf	(43/8),(43)&7
	goto	l4182
	line	636
	
l4208:	
;main.c: 635: {
;main.c: 636: if(ucTimerDelay2 >= 5)
	movlw	(05h)
	subwf	(main@ucTimerDelay2),w
	skipc
	goto	u1331
	goto	u1330
u1331:
	goto	l4186
u1330:
	line	639
	
l4210:	
;main.c: 637: {
;main.c: 639: PA1 = 0;
	bcf	(41/8),(41)&7
	line	640
;main.c: 640: PA2 = 0;
	bcf	(42/8),(42)&7
	line	641
;main.c: 641: PA3 = 0;
	bcf	(43/8),(43)&7
	goto	l4182
	line	652
	
l4218:	
;main.c: 651: {
;main.c: 652: if(ucTimerDelay2 >= 2)
	movlw	(02h)
	subwf	(main@ucTimerDelay2),w
	skipc
	goto	u1341
	goto	u1340
u1341:
	goto	l4186
u1340:
	line	654
	
l4220:	
;main.c: 653: {
;main.c: 654: ucTimerDelay2 = 0;
	clrf	(main@ucTimerDelay2)
	line	656
;main.c: 656: ucLoaderStep2 = 0;
	clrf	(main@ucLoaderStep2)
	goto	l4104
	line	585
	
l4228:	
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
goto l706
movlw high(S4662)
movwf pclath
	clrc
	rlf fsr,w
	addlw low(S4662)
	movwf pc
psect	swtext3,local,class=CONST,delta=2
global __pswtext3
__pswtext3:
S4662:
	ljmp	l810
	ljmp	l4178
	ljmp	l4188
	ljmp	l4198
	ljmp	l4208
	ljmp	l4218
psect	maintext

	line	679
;main.c: 678: {
;main.c: 679: case 0:
	
l834:	
	line	681
;main.c: 680: {
;main.c: 681: PB0 = 1;
	bsf	(48/8),(48)&7
	line	682
;main.c: 682: PA0 = 1;
	bsf	(40/8),(40)&7
	line	683
;main.c: 683: PA1 = 1;
	bsf	(41/8),(41)&7
	line	684
	
l4230:	
;main.c: 684: ucLoaderStep3++;
	incf	(main@ucLoaderStep3),f
	line	685
;main.c: 685: break;
	goto	l3960
	line	690
	
l4232:	
;main.c: 689: {
;main.c: 690: if(ucTimerDelay3 >= 5)
	movlw	(05h)
	subwf	(main@ucTimerDelay3),w
	skipc
	goto	u1351
	goto	u1350
u1351:
	goto	l4240
u1350:
	line	692
	
l4234:	
;main.c: 691: {
;main.c: 692: PA2 = 1;
	bsf	(42/8),(42)&7
	line	693
	
l4236:	
;main.c: 693: ucTimerDelay3 = 0;
	clrf	(main@ucTimerDelay3)
	goto	l4230
	line	697
	
l4240:	
;main.c: 696: else
;main.c: 697: ucTimerDelay3++;
	incf	(main@ucTimerDelay3),f
	goto	l3960
	line	703
	
l4242:	
;main.c: 702: {
;main.c: 703: if(ucTimerDelay3 >= 5)
	movlw	(05h)
	subwf	(main@ucTimerDelay3),w
	skipc
	goto	u1361
	goto	u1360
u1361:
	goto	l4240
u1360:
	line	705
	
l4244:	
;main.c: 704: {
;main.c: 705: PA3 = 1;
	bsf	(43/8),(43)&7
	goto	l4236
	line	717
	
l4252:	
;main.c: 716: {
;main.c: 717: if(ucTimerDelay3 >= 5)
	movlw	(05h)
	subwf	(main@ucTimerDelay3),w
	skipc
	goto	u1371
	goto	u1370
u1371:
	goto	l4240
u1370:
	line	720
	
l4254:	
;main.c: 718: {
;main.c: 720: PA2 = 0;
	bcf	(42/8),(42)&7
	line	721
;main.c: 721: PA3 = 0;
	bcf	(43/8),(43)&7
	goto	l4236
	line	732
	
l4262:	
;main.c: 731: {
;main.c: 732: if(ucTimerDelay3 >= 2)
	movlw	(02h)
	subwf	(main@ucTimerDelay3),w
	skipc
	goto	u1381
	goto	u1380
u1381:
	goto	l4240
u1380:
	line	734
	
l4264:	
;main.c: 733: {
;main.c: 734: ucTimerDelay3 = 0;
	clrf	(main@ucTimerDelay3)
	line	736
;main.c: 736: ucLoaderStep3 = 0;
	clrf	(main@ucLoaderStep3)
	goto	l4104
	line	677
	
l4272:	
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
	goto	l834
	xorlw	1^0	; case 1
	skipnz
	goto	l4232
	xorlw	2^1	; case 2
	skipnz
	goto	l4242
	xorlw	3^2	; case 3
	skipnz
	goto	l4252
	xorlw	4^3	; case 4
	skipnz
	goto	l4262
	goto	l706
	opt asmopt_on

	line	759
;main.c: 758: {
;main.c: 759: case 0:
	
l855:	
	line	761
;main.c: 760: {
;main.c: 761: PB0 = 1;
	bsf	(48/8),(48)&7
	line	762
;main.c: 762: PA0 = 1;
	bsf	(40/8),(40)&7
	line	763
;main.c: 763: PA1 = 1;
	bsf	(41/8),(41)&7
	line	764
;main.c: 764: PA2 = 1;
	bsf	(42/8),(42)&7
	line	765
	
l4274:	
;main.c: 765: ucLoaderStep4++;
	incf	(main@ucLoaderStep4),f
	line	766
;main.c: 766: break;
	goto	l3960
	line	771
	
l4276:	
;main.c: 770: {
;main.c: 771: if(ucTimerDelay4 >= 5)
	movlw	(05h)
	subwf	(main@ucTimerDelay4),w
	skipc
	goto	u1391
	goto	u1390
u1391:
	goto	l4284
u1390:
	line	773
	
l4278:	
;main.c: 772: {
;main.c: 773: PA3 = 1;
	bsf	(43/8),(43)&7
	line	774
	
l4280:	
;main.c: 774: ucTimerDelay4 = 0;
	clrf	(main@ucTimerDelay4)
	goto	l4274
	line	778
	
l4284:	
;main.c: 777: else
;main.c: 778: ucTimerDelay4++;
	incf	(main@ucTimerDelay4),f
	goto	l3960
	line	784
	
l4286:	
;main.c: 783: {
;main.c: 784: if(ucTimerDelay4 >= 5)
	movlw	(05h)
	subwf	(main@ucTimerDelay4),w
	skipc
	goto	u1401
	goto	u1400
u1401:
	goto	l4284
u1400:
	line	786
	
l4288:	
;main.c: 785: {
;main.c: 786: PA3 = 0;
	bcf	(43/8),(43)&7
	goto	l4280
	line	797
	
l4296:	
;main.c: 796: {
;main.c: 797: if(ucTimerDelay4 >= 2)
	movlw	(02h)
	subwf	(main@ucTimerDelay4),w
	skipc
	goto	u1411
	goto	u1410
u1411:
	goto	l4284
u1410:
	line	799
	
l4298:	
;main.c: 798: {
;main.c: 799: ucTimerDelay4 = 0;
	clrf	(main@ucTimerDelay4)
	line	801
;main.c: 801: ucLoaderStep4 = 0;
	clrf	(main@ucLoaderStep4)
	goto	l4104
	line	757
	
l4306:	
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
	goto	l855
	xorlw	1^0	; case 1
	skipnz
	goto	l4276
	xorlw	2^1	; case 2
	skipnz
	goto	l4286
	xorlw	3^2	; case 3
	skipnz
	goto	l4296
	goto	l706
	opt asmopt_on

	line	368
	
l4310:	
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
	goto	l4110
	xorlw	1^0	; case 1
	skipnz
	goto	l4174
	xorlw	2^1	; case 2
	skipnz
	goto	l4228
	xorlw	3^2	; case 3
	skipnz
	goto	l4272
	xorlw	4^3	; case 4
	skipnz
	goto	l4306
	goto	l706
	opt asmopt_on

	line	826
	
l4312:	
;main.c: 825: {
;main.c: 826: if(isFinishedTwentySecondsTimer())
	fcall	_isFinishedTwentySecondsTimer
	xorlw	0
	skipnz
	goto	u1421
	goto	u1420
u1421:
	goto	l4028
u1420:
	line	828
	
l4314:	
;main.c: 827: {
;main.c: 828: PBOD6 =0;
	bsf	status, 5	;RP0=1, select bank3
	bsf	status, 6	;RP1=1, select bank3
	bcf	(3142/8)^0180h,(3142)&7
	line	829
;main.c: 829: PB6 = 1;
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	bsf	(54/8),(54)&7
	line	830
;main.c: 830: PA6 = 0;
	bcf	(46/8),(46)&7
	line	837
	
l4316:	
;main.c: 837: if((getAdOriginalCh14Value() > 2800))
	fcall	_getAdOriginalCh14Value
	movlw	high(0AF1h)
	subwf	(1+(?_getAdOriginalCh14Value)),w
	movlw	low(0AF1h)
	skipnz
	subwf	(0+(?_getAdOriginalCh14Value)),w
	skipc
	goto	u1431
	goto	u1430
u1431:
	goto	l4320
u1430:
	line	838
	
l4318:	
;main.c: 838: DACR0=0x0F;
	movlw	(0Fh)
	bsf	status, 5	;RP0=1, select bank1
	movwf	(136)^080h	;volatile
	goto	l871
	line	840
	
l4320:	
;main.c: 839: else
;main.c: 840: DACR0=0x07;
	movlw	(07h)
	bsf	status, 5	;RP0=1, select bank1
	movwf	(136)^080h	;volatile
	
l871:	
	line	842
;main.c: 842: ucADC4_Step = ADC4_STEP_FOURTH;
	movlw	(04h)
	bcf	status, 5	;RP0=0, select bank0
	movwf	(main@ucADC4_Step)
	line	843
;main.c: 843: }
	goto	l3960
	line	853
	
l4322:	
;main.c: 851: {
;main.c: 852: static unsigned char ucTimer1s = 0;
;main.c: 853: if(ucTimer1s < 5)
	movlw	(05h)
	subwf	(main@ucTimer1s),w
	skipnc
	goto	u1441
	goto	u1440
u1441:
	goto	l4326
u1440:
	line	855
	
l4324:	
;main.c: 854: {
;main.c: 855: ucTimer1s++;
	incf	(main@ucTimer1s),f
	line	856
;main.c: 856: }
	goto	l3960
	line	859
	
l4326:	
;main.c: 857: else
;main.c: 858: {
;main.c: 859: ucTimer1s = 0;
	clrf	(main@ucTimer1s)
	line	860
	
l4328:	
;main.c: 860: PB6 = 1;
	bsf	(54/8),(54)&7
	line	861
	
l4330:	
;main.c: 861: PBOD6 = 1;
	bsf	status, 5	;RP0=1, select bank3
	bsf	status, 6	;RP1=1, select bank3
	bsf	(3142/8)^0180h,(3142)&7
	line	862
	
l4332:	
;main.c: 862: enumMainLoopStep = MAIN_LOOP_STEP_FIRST;
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	clrf	(main@enumMainLoopStep)
	incf	(main@enumMainLoopStep),f
	line	863
;main.c: 863: ucADC4_Step = ADC4_STEP_INIT;
	clrf	(main@ucADC4_Step)
	goto	l3960
	line	340
	
l4336:	
	movf	(main@ucADC4_Step),w
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
	goto	l4026
	xorlw	1^0	; case 1
	skipnz
	goto	l4030
	xorlw	2^1	; case 2
	skipnz
	goto	l4310
	xorlw	3^2	; case 3
	skipnz
	goto	l4312
	xorlw	4^3	; case 4
	skipnz
	goto	l4322
	goto	l706
	opt asmopt_on

	line	890
;main.c: 889: {
;main.c: 890: case HOUR_3_BRANCH_STEP_FIRST:
	
l883:	
	line	892
;main.c: 891: {
;main.c: 892: PA7 = 1;
	bsf	(47/8),(47)&7
	line	893
;main.c: 893: PAOD7 = 1;
	bsf	status, 5	;RP0=1, select bank3
	bsf	status, 6	;RP1=1, select bank3
	bsf	(3135/8)^0180h,(3135)&7
	line	894
	
l4338:	
;main.c: 894: startThreeHoursTimer(60);
	movlw	03Ch
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	movwf	(?_startThreeHoursTimer)
	clrf	(?_startThreeHoursTimer+1)
	fcall	_startThreeHoursTimer
	line	896
	
l4340:	
;main.c: 896: enumBranchStep = HOUR_3_BRANCH_STEP_SECOND;
	clrf	(main@enumBranchStep)
	incf	(main@enumBranchStep),f
	line	897
;main.c: 897: break;
	goto	l3960
	line	904
	
l4342:	
;main.c: 901: {
;main.c: 902: static unsigned char ucTimer20s = 0;
;main.c: 904: if(ucTimer20s < 200)
	movlw	(0C8h)
	subwf	(main@ucTimer20s),w
	skipnc
	goto	u1451
	goto	u1450
u1451:
	goto	l4356
u1450:
	line	906
	
l4344:	
;main.c: 905: {
;main.c: 906: ucTimer20s++;
	incf	(main@ucTimer20s),f
	line	907
	
l4346:	
;main.c: 907: PB0 = 1;
	bsf	(48/8),(48)&7
	line	908
	
l4348:	
;main.c: 908: PA0 = 1;
	bsf	(40/8),(40)&7
	line	909
	
l4350:	
;main.c: 909: PA1 = 1;
	bsf	(41/8),(41)&7
	line	910
	
l4352:	
;main.c: 910: PA2 = 1;
	bsf	(42/8),(42)&7
	line	911
	
l4354:	
;main.c: 911: PA3 = 1;
	bsf	(43/8),(43)&7
	line	912
;main.c: 912: }
	goto	l3960
	line	916
	
l4356:	
;main.c: 913: else
;main.c: 914: {
;main.c: 916: ucTimer20s = 0;
	clrf	(main@ucTimer20s)
	line	919
	
l4358:	
;main.c: 919: enumBranchStep = HOUR_3_BRANCH_STEP_THIRD;
	movlw	(02h)
	movwf	(main@enumBranchStep)
	goto	l3960
	line	924
;main.c: 922: }
;main.c: 924: case HOUR_3_BRANCH_STEP_THIRD:
	
l890:	
	line	926
;main.c: 925: {
;main.c: 926: PA6 = 0;
	bcf	(46/8),(46)&7
	line	928
	
l4360:	
;main.c: 928: if(isFinishedThreeHoursTimer())
	fcall	_isFinishedThreeHoursTimer
	xorlw	0
	skipnz
	goto	u1461
	goto	u1460
u1461:
	goto	l4366
u1460:
	line	930
	
l4362:	
;main.c: 929: {
;main.c: 930: enumBranchStep = HOUR_3_BRANCH_STEP_FIRST;
	clrf	(main@enumBranchStep)
	goto	l4024
	line	937
	
l4366:	
;main.c: 933: else
;main.c: 934: {
;main.c: 935: static unsigned char ucTimerX1P5s = 0;
;main.c: 937: if(getAdOriginalCh1Value() < 130)
	fcall	_getAdOriginalCh1Value
	movlw	high(082h)
	subwf	(1+(?_getAdOriginalCh1Value)),w
	movlw	low(082h)
	skipnz
	subwf	(0+(?_getAdOriginalCh1Value)),w
	skipnc
	goto	u1471
	goto	u1470
u1471:
	goto	l4370
u1470:
	line	939
	
l4368:	
;main.c: 938: {
;main.c: 939: ucTimerX1P5s = 0;
	clrf	(main@ucTimerX1P5s)
	line	940
;main.c: 940: }
	goto	l4372
	line	943
	
l4370:	
;main.c: 941: else
;main.c: 942: {
;main.c: 943: ucTimerX1P5s++;
	incf	(main@ucTimerX1P5s),f
	line	946
	
l4372:	
;main.c: 944: }
;main.c: 946: if(ucTimerX1P5s >= 1)
	movf	(main@ucTimerX1P5s),w
	skipz
	goto	u1480
	goto	l4386
u1480:
	line	948
	
l4374:	
;main.c: 947: {
;main.c: 948: ucTimerX1P5s = 0;
	clrf	(main@ucTimerX1P5s)
	line	949
	
l4376:	
;main.c: 949: PAOD7 = 0;
	bsf	status, 5	;RP0=1, select bank3
	bsf	status, 6	;RP1=1, select bank3
	bcf	(3135/8)^0180h,(3135)&7
	line	950
	
l4378:	
;main.c: 950: PA7 = 0;
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	bcf	(47/8),(47)&7
	line	951
	
l4380:	
;main.c: 951: clearThreeHoursTimer();
	fcall	_clearThreeHoursTimer
	line	953
	
l4382:	
;main.c: 953: enumBranchStep = HOUR_3_BRANCH_STEP_FIRST;
	clrf	(main@enumBranchStep)
	goto	l3988
	line	961
	
l4386:	
;main.c: 957: else
;main.c: 958: {
;main.c: 959: static unsigned char ucTimerX2P5s = 0;
;main.c: 961: if(getAdOriginalCh14Value() >= 1950)
	fcall	_getAdOriginalCh14Value
	movlw	high(079Eh)
	subwf	(1+(?_getAdOriginalCh14Value)),w
	movlw	low(079Eh)
	skipnz
	subwf	(0+(?_getAdOriginalCh14Value)),w
	skipc
	goto	u1491
	goto	u1490
u1491:
	goto	l4390
u1490:
	line	963
	
l4388:	
;main.c: 962: {
;main.c: 963: ucTimerX2P5s++;
	incf	(main@ucTimerX2P5s),f
	line	964
;main.c: 964: }
	goto	l4392
	line	967
	
l4390:	
;main.c: 965: else
;main.c: 966: {
;main.c: 967: ucTimerX2P5s = 0;
	clrf	(main@ucTimerX2P5s)
	line	970
	
l4392:	
;main.c: 968: }
;main.c: 970: if(ucTimerX2P5s >= 1)
	movf	(main@ucTimerX2P5s),w
	skipz
	goto	u1500
	goto	l4396
u1500:
	line	972
	
l4394:	
;main.c: 971: {
;main.c: 972: ucTimerX2P5s = 0;
	clrf	(main@ucTimerX2P5s)
	line	973
;main.c: 973: }
	goto	l3960
	line	976
	
l4396:	
;main.c: 974: else
;main.c: 975: {
;main.c: 976: clearPinPortAndTimer();
	fcall	_clearPinPortAndTimer
	goto	l3978
	line	888
	
l4402:	
	movf	(main@enumBranchStep),w
	; Switch size 1, requested type "space"
; Number of cases is 3, Range of values is 0 to 2
; switch strategies available:
; Name         Instructions Cycles
; simple_byte           10     6 (average)
; direct_byte           13     7 (fixed)
; jumptable            260     6 (fixed)
; rangetable             7     6 (fixed)
; spacedrange           12     9 (fixed)
; locatedrange           3     3 (fixed)
;	Chosen strategy is simple_byte

	opt asmopt_off
	xorlw	0^0	; case 0
	skipnz
	goto	l883
	xorlw	1^0	; case 1
	skipnz
	goto	l4342
	xorlw	2^1	; case 2
	skipnz
	goto	l890
	goto	l706
	opt asmopt_on

	line	1007
;main.c: 1006: {
;main.c: 1007: case INTERNAL_FIRST_STEP:
	
l910:	
	line	1009
;main.c: 1008: {
;main.c: 1009: PB0 = 0;
	bcf	(48/8),(48)&7
	line	1010
;main.c: 1010: PB1 = 0;
	bcf	(49/8),(49)&7
	line	1011
;main.c: 1011: PA0 = 0;
	bcf	(40/8),(40)&7
	line	1012
;main.c: 1012: PA1 = 0;
	bcf	(41/8),(41)&7
	line	1013
;main.c: 1013: PA2 = 0;
	bcf	(42/8),(42)&7
	line	1014
;main.c: 1014: PA3 = 0;
	bcf	(43/8),(43)&7
	line	1015
;main.c: 1015: PBOD6 = 0;
	bsf	status, 5	;RP0=1, select bank3
	bsf	status, 6	;RP1=1, select bank3
	bcf	(3142/8)^0180h,(3142)&7
	line	1016
;main.c: 1016: PB6 = 1;
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	bsf	(54/8),(54)&7
	line	1017
;main.c: 1017: PA6 =0;
	bcf	(46/8),(46)&7
	line	1019
;main.c: 1019: enumInteralStep = INTERNAL_SECOND_STEP;
	clrf	(main@enumInteralStep)
	incf	(main@enumInteralStep),f
	line	1020
;main.c: 1020: break;
	goto	l3960
	line	1027
	
l4404:	
;main.c: 1024: {
;main.c: 1025: static unsigned char ucTimer1s = 0;
;main.c: 1027: if(getAdOriginalCh14Value() <= 1000)
	fcall	_getAdOriginalCh14Value
	movlw	high(03E9h)
	subwf	(1+(?_getAdOriginalCh14Value)),w
	movlw	low(03E9h)
	skipnz
	subwf	(0+(?_getAdOriginalCh14Value)),w
	skipnc
	goto	u1511
	goto	u1510
u1511:
	goto	l4408
u1510:
	line	1029
	
l4406:	
;main.c: 1028: {
;main.c: 1029: ucTimer1s++;
	incf	(main@cTimer1s_809),f
	line	1030
;main.c: 1030: }
	goto	l4410
	line	1032
	
l4408:	
;main.c: 1031: else
;main.c: 1032: ucTimer1s = 0;
	clrf	(main@cTimer1s_809)
	line	1034
	
l4410:	
;main.c: 1034: if(ucTimer1s >= 10)
	movlw	(0Ah)
	subwf	(main@cTimer1s_809),w
	skipc
	goto	u1521
	goto	u1520
u1521:
	goto	l706
u1520:
	line	1036
	
l4412:	
;main.c: 1035: {
;main.c: 1036: enumInteralStep = INTERNAL_THIRD_STEP;
	movlw	(02h)
	movwf	(main@enumInteralStep)
	line	1037
	
l4414:	
;main.c: 1037: ucTimer1s = 0;
	clrf	(main@cTimer1s_809)
	goto	l3960
	line	1046
	
l4416:	
;main.c: 1043: {
;main.c: 1044: static unsigned char ucTimerP3s = 0;
;main.c: 1046: if(getAdOriginalCh14Value() >= 1950)
	fcall	_getAdOriginalCh14Value
	movlw	high(079Eh)
	subwf	(1+(?_getAdOriginalCh14Value)),w
	movlw	low(079Eh)
	skipnz
	subwf	(0+(?_getAdOriginalCh14Value)),w
	skipc
	goto	u1531
	goto	u1530
u1531:
	goto	l4420
u1530:
	line	1048
	
l4418:	
;main.c: 1047: {
;main.c: 1048: ucTimerP3s++;
	incf	(main@ucTimerP3s),f
	line	1049
;main.c: 1049: }
	goto	l4422
	line	1051
	
l4420:	
;main.c: 1050: else
;main.c: 1051: ucTimerP3s = 0;
	clrf	(main@ucTimerP3s)
	line	1053
	
l4422:	
;main.c: 1053: if(ucTimerP3s >= 3)
	movlw	(03h)
	subwf	(main@ucTimerP3s),w
	skipc
	goto	u1541
	goto	u1540
u1541:
	goto	l706
u1540:
	line	1055
	
l4424:	
;main.c: 1054: {
;main.c: 1055: enumInteralStep = INTERNAL_FIRST_STEP;
	clrf	(main@enumInteralStep)
	line	1056
;main.c: 1056: ucTimerP3s = 0;
	clrf	(main@ucTimerP3s)
	line	1057
	
l4426:	
;main.c: 1057: clearAllTimer();
	fcall	_clearAllTimer
	line	1059
	
l4428:	
;main.c: 1059: DACR0=0x0F;
	movlw	(0Fh)
	bsf	status, 5	;RP0=1, select bank1
	movwf	(136)^080h	;volatile
	line	1060
	
l4430:	
;main.c: 1060: initPin();
	fcall	_initPin
	line	1063
	
l4432:	
;main.c: 1063: enumMainLoopStep = MAIN_LOOP_STEP_INIT;
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	clrf	(main@enumMainLoopStep)
	goto	l3960
	line	1005
	
l4436:	
	movf	(main@enumInteralStep),w
	; Switch size 1, requested type "space"
; Number of cases is 3, Range of values is 0 to 2
; switch strategies available:
; Name         Instructions Cycles
; simple_byte           10     6 (average)
; direct_byte           13     7 (fixed)
; jumptable            260     6 (fixed)
; rangetable             7     6 (fixed)
; spacedrange           12     9 (fixed)
; locatedrange           3     3 (fixed)
;	Chosen strategy is simple_byte

	opt asmopt_off
	xorlw	0^0	; case 0
	skipnz
	goto	l910
	xorlw	1^0	; case 1
	skipnz
	goto	l4404
	xorlw	2^1	; case 2
	skipnz
	goto	l4416
	goto	l706
	opt asmopt_on

	line	220
	
l4440:	
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	movf	(main@enumMainLoopStep),w
	; Switch size 1, requested type "space"
; Number of cases is 8, Range of values is 0 to 9
; switch strategies available:
; Name         Instructions Cycles
; simple_byte           25    13 (average)
; direct_byte           27     7 (fixed)
; jumptable            260     6 (fixed)
; rangetable            14     6 (fixed)
; spacedrange           26     9 (fixed)
; locatedrange          10     3 (fixed)
;	Chosen strategy is simple_byte

	opt asmopt_off
	xorlw	0^0	; case 0
	skipnz
	goto	l3968
	xorlw	1^0	; case 1
	skipnz
	goto	l3980
	xorlw	2^1	; case 2
	skipnz
	goto	l715
	xorlw	3^2	; case 3
	skipnz
	goto	l3994
	xorlw	4^3	; case 4
	skipnz
	goto	l4018
	xorlw	5^4	; case 5
	skipnz
	goto	l4022
	xorlw	8^5	; case 8
	skipnz
	goto	l4402
	xorlw	9^8	; case 9
	skipnz
	goto	l4436
	goto	l706
	opt asmopt_on

	global	start
	ljmp	start
	opt stack 0
psect	maintext
	line	1084
GLOBAL	__end_of_main
	__end_of_main:
;; =============== function _main ends ============

	signat	_main,88
	global	_process_AD_Converter_Value
psect	text601,local,class=CODE,delta=2
global __ptext601
__ptext601:

;; *************** function _process_AD_Converter_Value *****************
;; Defined at:
;;		line 102 in file "C:\190604\AK7030-OTP\common.c"
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
psect	text601
	file	"C:\190604\AK7030-OTP\common.c"
	line	102
	global	__size_of_process_AD_Converter_Value
	__size_of_process_AD_Converter_Value	equ	__end_of_process_AD_Converter_Value-_process_AD_Converter_Value
	
_process_AD_Converter_Value:	
	opt	stack 3
; Regs used in _process_AD_Converter_Value: [wreg-fsr0h+status,2+status,0+pclath+cstack]
	line	103
	
l3920:	
;common.c: 103: if(getAD_ConvertFlag())
	fcall	_getAD_ConvertFlag
	xorlw	0
	skipnz
	goto	u1011
	goto	u1010
u1011:
	goto	l1638
u1010:
	line	105
	
l3922:	
;common.c: 104: {
;common.c: 105: setAD_ConvertFlag(0);
	movlw	(0)
	fcall	_setAD_ConvertFlag
	line	106
	
l3924:	
;common.c: 106: AD_Sample();
	fcall	_AD_Sample
	line	107
	
l3926:	
;common.c: 107: if(4 == sampleChannelSelect)
	movf	(_sampleChannelSelect),w
	xorlw	04h
	skipz
	goto	u1021
	goto	u1020
u1021:
	goto	l3930
u1020:
	line	108
	
l3928:	
;common.c: 108: adc_test_init(4,3);
	movlw	(03h)
	movwf	(?_adc_test_init)
	movlw	(04h)
	fcall	_adc_test_init
	goto	l3936
	line	109
	
l3930:	
;common.c: 109: else if(1 == sampleChannelSelect)
	decf	(_sampleChannelSelect),w
	skipz
	goto	u1031
	goto	u1030
u1031:
	goto	l3934
u1030:
	line	110
	
l3932:	
;common.c: 110: adc_test_init(1,3);
	movlw	(03h)
	movwf	(?_adc_test_init)
	movlw	(01h)
	fcall	_adc_test_init
	goto	l3936
	line	112
	
l3934:	
;common.c: 111: else
;common.c: 112: adc_test_init(14,3);
	movlw	(03h)
	movwf	(?_adc_test_init)
	movlw	(0Eh)
	fcall	_adc_test_init
	line	114
	
l3936:	
;common.c: 114: adc_start();
	fcall	_adc_start
	line	116
	
l1638:	
	return
	opt stack 0
GLOBAL	__end_of_process_AD_Converter_Value
	__end_of_process_AD_Converter_Value:
;; =============== function _process_AD_Converter_Value ends ============

	signat	_process_AD_Converter_Value,88
	global	_clearPinPortAndTimer
psect	text602,local,class=CODE,delta=2
global __ptext602
__ptext602:

;; *************** function _clearPinPortAndTimer *****************
;; Defined at:
;;		line 92 in file "C:\190604\AK7030-OTP\main.c"
;; Parameters:    Size  Location     Type
;;		None
;; Auto vars:     Size  Location     Type
;;		None
;; Return value:  Size  Location     Type
;;		None               void
;; Registers used:
;;		status,2, status,0, pclath, cstack
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
;; Hardware stack levels required when called:    4
;; This function calls:
;;		_clearAllTimer
;; This function is called by:
;;		_main
;; This function uses a non-reentrant model
;;
psect	text602
	file	"C:\190604\AK7030-OTP\main.c"
	line	92
	global	__size_of_clearPinPortAndTimer
	__size_of_clearPinPortAndTimer	equ	__end_of_clearPinPortAndTimer-_clearPinPortAndTimer
	
_clearPinPortAndTimer:	
	opt	stack 3
; Regs used in _clearPinPortAndTimer: [status,2+status,0+pclath+cstack]
	line	93
	
l3916:	
;main.c: 93: PB0 = 0;
	bcf	(48/8),(48)&7
	line	94
;main.c: 94: PA0 = 0;
	bcf	(40/8),(40)&7
	line	95
;main.c: 95: PA1 = 0;
	bcf	(41/8),(41)&7
	line	96
;main.c: 96: PA2 = 0;
	bcf	(42/8),(42)&7
	line	97
;main.c: 97: PA3 = 0;
	bcf	(43/8),(43)&7
	line	98
;main.c: 98: PAOD7 = 0;
	bsf	status, 5	;RP0=1, select bank3
	bsf	status, 6	;RP1=1, select bank3
	bcf	(3135/8)^0180h,(3135)&7
	line	99
;main.c: 99: PA7 = 0;
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	bcf	(47/8),(47)&7
	line	100
	
l3918:	
;main.c: 100: clearAllTimer();
	fcall	_clearAllTimer
	line	101
	
l680:	
	return
	opt stack 0
GLOBAL	__end_of_clearPinPortAndTimer
	__end_of_clearPinPortAndTimer:
;; =============== function _clearPinPortAndTimer ends ============

	signat	_clearPinPortAndTimer,88
	global	_AD_Sample
psect	text603,local,class=CODE,delta=2
global __ptext603
__ptext603:

;; *************** function _AD_Sample *****************
;; Defined at:
;;		line 128 in file "C:\190604\AK7030-OTP\common.c"
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
psect	text603
	file	"C:\190604\AK7030-OTP\common.c"
	line	128
	global	__size_of_AD_Sample
	__size_of_AD_Sample	equ	__end_of_AD_Sample-_AD_Sample
	
_AD_Sample:	
	opt	stack 3
; Regs used in _AD_Sample: [wreg-fsr0h+status,2+status,0+pclath+cstack]
	line	129
	
l3870:	
;common.c: 129: if(sampleTimes < 6)
	movlw	(06h)
	subwf	(_sampleTimes),w
	skipnc
	goto	u931
	goto	u930
u931:
	goto	l1654
u930:
	line	132
	
l3872:	
;common.c: 130: {
;common.c: 132: buffer_Sample_AD_Value[sampleTimes] = getAdOriginalValue();
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
	line	134
	
l3874:	
;common.c: 134: if(sampleTimes == 0)
	movf	(_sampleTimes),f
	skipz
	goto	u941
	goto	u940
u941:
	goto	l3878
u940:
	line	136
	
l3876:	
;common.c: 135: {
;common.c: 136: multiFilterMaxValue = buffer_Sample_AD_Value[0];
	movf	(_buffer_Sample_AD_Value+1),w
	movwf	(_multiFilterMaxValue+1)
	movf	(_buffer_Sample_AD_Value),w
	movwf	(_multiFilterMaxValue)
	line	137
;common.c: 137: multiFilterMinValue = buffer_Sample_AD_Value[0];
	movf	(_buffer_Sample_AD_Value+1),w
	movwf	(_multiFilterMinValue+1)
	movf	(_buffer_Sample_AD_Value),w
	movwf	(_multiFilterMinValue)
	line	140
	
l3878:	
;common.c: 138: }
;common.c: 140: if(multiFilterMaxValue < buffer_Sample_AD_Value[sampleTimes])
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
	goto	u955
	movf	0+(??_AD_Sample+0)+0,w
	subwf	(_multiFilterMaxValue),w
u955:
	skipnc
	goto	u951
	goto	u950
u951:
	goto	l1643
u950:
	line	142
	
l3880:	
;common.c: 141: {
;common.c: 142: multiFilterMaxValue = buffer_Sample_AD_Value[sampleTimes];
	clrc
	rlf	(_sampleTimes),w
	addlw	_buffer_Sample_AD_Value&0ffh
	movwf	fsr0
	movf	indf,w
	movwf	(_multiFilterMaxValue)
	incf	fsr0,f
	movf	indf,w
	movwf	(_multiFilterMaxValue+1)
	line	143
	
l1643:	
	line	144
;common.c: 143: }
;common.c: 144: if(multiFilterMinValue > buffer_Sample_AD_Value[sampleTimes])
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
	goto	u965
	movf	(_multiFilterMinValue),w
	subwf	0+(??_AD_Sample+0)+0,w
u965:
	skipnc
	goto	u961
	goto	u960
u961:
	goto	l3884
u960:
	line	146
	
l3882:	
;common.c: 145: {
;common.c: 146: multiFilterMinValue = buffer_Sample_AD_Value[sampleTimes];
	clrc
	rlf	(_sampleTimes),w
	addlw	_buffer_Sample_AD_Value&0ffh
	movwf	fsr0
	movf	indf,w
	movwf	(_multiFilterMinValue)
	incf	fsr0,f
	movf	indf,w
	movwf	(_multiFilterMinValue+1)
	line	151
	
l3884:	
;common.c: 151: sampleTimes++;
	incf	(_sampleTimes),f
	line	153
	
l3886:	
;common.c: 153: if(sampleTimes >= 6)
	movlw	(06h)
	subwf	(_sampleTimes),w
	skipc
	goto	u971
	goto	u970
u971:
	goto	l1654
u970:
	line	155
	
l3888:	
;common.c: 154: {
;common.c: 155: sampleTimes = 0;
	clrf	(_sampleTimes)
	line	157
	
l3890:	
;common.c: 158: {
;common.c: 160: sampleCH14Value = ((multiFilterSumValue - multiFilterMaxValue - multiFilterMinValue))>> 2;
	movf	(_sampleChannelSelect),w
	xorlw	0Eh
	skipz
	goto	u981
	goto	u980
u981:
	goto	l3894
u980:
	line	161
	
l3892:	
;common.c: 161: sampleChannelSelect = 4;
	movlw	(04h)
	movwf	(_sampleChannelSelect)
	line	162
;common.c: 162: }
	goto	l3904
	line	163
	
l3894:	
;common.c: 164: {
;common.c: 165: sampleCH4Value = ((multiFilterSumValue - multiFilterMaxValue - multiFilterMinValue))>> 2;
	movf	(_sampleChannelSelect),w
	xorlw	04h
	skipz
	goto	u991
	goto	u990
u991:
	goto	l3898
u990:
	line	166
	
l3896:	
;common.c: 166: sampleChannelSelect = 1;
	clrf	(_sampleChannelSelect)
	incf	(_sampleChannelSelect),f
	line	167
;common.c: 167: }
	goto	l3904
	line	168
	
l3898:	
	line	171
	
l3900:	
;common.c: 171: sampleChannelSelect = 14;
	movlw	(0Eh)
	movwf	(_sampleChannelSelect)
	line	179
;common.c: 172: }
	
l3904:	
;common.c: 177: }
;common.c: 179: for(unsigned char index = 0; index < 6;index++)
	clrf	(AD_Sample@index)
	line	180
	
l3910:	
;common.c: 180: buffer_Sample_AD_Value[index] = 0;
	clrc
	rlf	(AD_Sample@index),w
	addlw	_buffer_Sample_AD_Value&0ffh
	movwf	fsr0
	clrf	indf
	incf	fsr0,f
	clrf	indf
	line	179
	
l3912:	
	incf	(AD_Sample@index),f
	
l3914:	
	movlw	(06h)
	subwf	(AD_Sample@index),w
	skipc
	goto	u1001
	goto	u1000
u1001:
	goto	l3910
u1000:
	line	184
	
l1654:	
	return
	opt stack 0
GLOBAL	__end_of_AD_Sample
	__end_of_AD_Sample:
;; =============== function _AD_Sample ends ============

	signat	_AD_Sample,88
	global	_clearAllTimer
psect	text604,local,class=CODE,delta=2
global __ptext604
__ptext604:

;; *************** function _clearAllTimer *****************
;; Defined at:
;;		line 83 in file "C:\190604\AK7030-OTP\main.c"
;; Parameters:    Size  Location     Type
;;		None
;; Auto vars:     Size  Location     Type
;;		None
;; Return value:  Size  Location     Type
;;		None               void
;; Registers used:
;;		status,2, status,0, pclath, cstack
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
;; Hardware stack levels required when called:    3
;; This function calls:
;;		_clearTwelveHoursTimer
;;		_clearThreeHoursTimer
;;		_clearTwentySecondsTimer
;; This function is called by:
;;		_clearPinPortAndTimer
;;		_main
;; This function uses a non-reentrant model
;;
psect	text604
	file	"C:\190604\AK7030-OTP\main.c"
	line	83
	global	__size_of_clearAllTimer
	__size_of_clearAllTimer	equ	__end_of_clearAllTimer-_clearAllTimer
	
_clearAllTimer:	
	opt	stack 4
; Regs used in _clearAllTimer: [status,2+status,0+pclath+cstack]
	line	84
	
l3868:	
;main.c: 84: clearTwelveHoursTimer();
	fcall	_clearTwelveHoursTimer
	line	85
;main.c: 85: clearThreeHoursTimer();
	fcall	_clearThreeHoursTimer
	line	86
;main.c: 86: clearTwentySecondsTimer();
	fcall	_clearTwentySecondsTimer
	line	87
	
l677:	
	return
	opt stack 0
GLOBAL	__end_of_clearAllTimer
	__end_of_clearAllTimer:
;; =============== function _clearAllTimer ends ============

	signat	_clearAllTimer,88
	global	_getAdOriginalValue
psect	text605,local,class=CODE,delta=2
global __ptext605
__ptext605:

;; *************** function _getAdOriginalValue *****************
;; Defined at:
;;		line 78 in file "C:\190604\AK7030-OTP\common.c"
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
psect	text605
	file	"C:\190604\AK7030-OTP\common.c"
	line	78
	global	__size_of_getAdOriginalValue
	__size_of_getAdOriginalValue	equ	__end_of_getAdOriginalValue-_getAdOriginalValue
	
_getAdOriginalValue:	
	opt	stack 3
; Regs used in _getAdOriginalValue: [wreg]
	line	79
	
l3822:	
;common.c: 79: return adc_original_value;
	movf	(_adc_original_value+1),w
	movwf	(?_getAdOriginalValue+1)
	movf	(_adc_original_value),w
	movwf	(?_getAdOriginalValue)
	line	80
	
l1621:	
	return
	opt stack 0
GLOBAL	__end_of_getAdOriginalValue
	__end_of_getAdOriginalValue:
;; =============== function _getAdOriginalValue ends ============

	signat	_getAdOriginalValue,90
	global	_setAD_ConvertFlag
psect	text606,local,class=CODE,delta=2
global __ptext606
__ptext606:

;; *************** function _setAD_ConvertFlag *****************
;; Defined at:
;;		line 72 in file "C:\190604\AK7030-OTP\common.c"
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
psect	text606
	file	"C:\190604\AK7030-OTP\common.c"
	line	72
	global	__size_of_setAD_ConvertFlag
	__size_of_setAD_ConvertFlag	equ	__end_of_setAD_ConvertFlag-_setAD_ConvertFlag
	
_setAD_ConvertFlag:	
	opt	stack 4
; Regs used in _setAD_ConvertFlag: [wreg]
;setAD_ConvertFlag@flag stored from wreg
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	movwf	(setAD_ConvertFlag@flag)
	line	73
	
l3820:	
;common.c: 73: adc_convert_flag = flag;
	movf	(setAD_ConvertFlag@flag),w
	movwf	(_adc_convert_flag)
	line	74
	
l1618:	
	return
	opt stack 0
GLOBAL	__end_of_setAD_ConvertFlag
	__end_of_setAD_ConvertFlag:
;; =============== function _setAD_ConvertFlag ends ============

	signat	_setAD_ConvertFlag,4216
	global	_getAD_ConvertFlag
psect	text607,local,class=CODE,delta=2
global __ptext607
__ptext607:

;; *************** function _getAD_ConvertFlag *****************
;; Defined at:
;;		line 66 in file "C:\190604\AK7030-OTP\common.c"
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
psect	text607
	file	"C:\190604\AK7030-OTP\common.c"
	line	66
	global	__size_of_getAD_ConvertFlag
	__size_of_getAD_ConvertFlag	equ	__end_of_getAD_ConvertFlag-_getAD_ConvertFlag
	
_getAD_ConvertFlag:	
	opt	stack 4
; Regs used in _getAD_ConvertFlag: [wreg]
	line	67
	
l3816:	
;common.c: 67: return adc_convert_flag;
	movf	(_adc_convert_flag),w
	line	68
	
l1615:	
	return
	opt stack 0
GLOBAL	__end_of_getAD_ConvertFlag
	__end_of_getAD_ConvertFlag:
;; =============== function _getAD_ConvertFlag ends ============

	signat	_getAD_ConvertFlag,89
	global	_isFinishedThreeHoursTimer
psect	text608,local,class=CODE,delta=2
global __ptext608
__ptext608:

;; *************** function _isFinishedThreeHoursTimer *****************
;; Defined at:
;;		line 267 in file "C:\190604\AK7030-OTP\common.c"
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
;; Hardware stack levels required when called:    2
;; This function calls:
;;		Nothing
;; This function is called by:
;;		_main
;; This function uses a non-reentrant model
;;
psect	text608
	file	"C:\190604\AK7030-OTP\common.c"
	line	267
	global	__size_of_isFinishedThreeHoursTimer
	__size_of_isFinishedThreeHoursTimer	equ	__end_of_isFinishedThreeHoursTimer-_isFinishedThreeHoursTimer
	
_isFinishedThreeHoursTimer:	
	opt	stack 5
; Regs used in _isFinishedThreeHoursTimer: [wreg+status,2+status,0]
	line	268
	
l3804:	
;common.c: 268: if(uiSmallTimer == 0)
	movf	((_uiSmallTimer+1)),w
	iorwf	((_uiSmallTimer)),w
	skipz
	goto	u841
	goto	u840
u841:
	goto	l3812
u840:
	line	269
	
l3806:	
;common.c: 269: return 1;
	movlw	(01h)
	goto	l1697
	line	271
	
l3812:	
;common.c: 270: else
;common.c: 271: return 0;
	movlw	(0)
	line	272
	
l1697:	
	return
	opt stack 0
GLOBAL	__end_of_isFinishedThreeHoursTimer
	__end_of_isFinishedThreeHoursTimer:
;; =============== function _isFinishedThreeHoursTimer ends ============

	signat	_isFinishedThreeHoursTimer,89
	global	_startThreeHoursTimer
psect	text609,local,class=CODE,delta=2
global __ptext609
__ptext609:

;; *************** function _startThreeHoursTimer *****************
;; Defined at:
;;		line 233 in file "C:\190604\AK7030-OTP\common.c"
;; Parameters:    Size  Location     Type
;;  uiSetTime       2    0[BANK0 ] unsigned int 
;; Auto vars:     Size  Location     Type
;;		None
;; Return value:  Size  Location     Type
;;		None               void
;; Registers used:
;;		wreg, status,2, status,0
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
psect	text609
	file	"C:\190604\AK7030-OTP\common.c"
	line	233
	global	__size_of_startThreeHoursTimer
	__size_of_startThreeHoursTimer	equ	__end_of_startThreeHoursTimer-_startThreeHoursTimer
	
_startThreeHoursTimer:	
	opt	stack 5
; Regs used in _startThreeHoursTimer: [wreg+status,2+status,0]
	line	234
	
l3800:	
;common.c: 234: if(0 == uiSmallTimer)
	movf	((_uiSmallTimer+1)),w
	iorwf	((_uiSmallTimer)),w
	skipz
	goto	u831
	goto	u830
u831:
	goto	l1680
u830:
	line	235
	
l3802:	
;common.c: 235: uiSmallTimer = uiSetTime;
	movf	(startThreeHoursTimer@uiSetTime+1),w
	movwf	(_uiSmallTimer+1)
	movf	(startThreeHoursTimer@uiSetTime),w
	movwf	(_uiSmallTimer)
	line	240
	
l1680:	
	return
	opt stack 0
GLOBAL	__end_of_startThreeHoursTimer
	__end_of_startThreeHoursTimer:
;; =============== function _startThreeHoursTimer ends ============

	signat	_startThreeHoursTimer,4216
	global	_isFinishedTwentySecondsTimer
psect	text610,local,class=CODE,delta=2
global __ptext610
__ptext610:

;; *************** function _isFinishedTwentySecondsTimer *****************
;; Defined at:
;;		line 250 in file "C:\190604\AK7030-OTP\common.c"
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
;; Hardware stack levels required when called:    2
;; This function calls:
;;		Nothing
;; This function is called by:
;;		_main
;; This function uses a non-reentrant model
;;
psect	text610
	file	"C:\190604\AK7030-OTP\common.c"
	line	250
	global	__size_of_isFinishedTwentySecondsTimer
	__size_of_isFinishedTwentySecondsTimer	equ	__end_of_isFinishedTwentySecondsTimer-_isFinishedTwentySecondsTimer
	
_isFinishedTwentySecondsTimer:	
	opt	stack 5
; Regs used in _isFinishedTwentySecondsTimer: [wreg+status,2+status,0]
	line	251
	
l3788:	
;common.c: 251: if(0 == uiTwentySecondsTimer)
	movf	((_uiTwentySecondsTimer+1)),w
	iorwf	((_uiTwentySecondsTimer)),w
	skipz
	goto	u821
	goto	u820
u821:
	goto	l3796
u820:
	line	252
	
l3790:	
;common.c: 252: return 1;
	movlw	(01h)
	goto	l1687
	line	254
	
l3796:	
;common.c: 253: else
;common.c: 254: return 0;
	movlw	(0)
	line	255
	
l1687:	
	return
	opt stack 0
GLOBAL	__end_of_isFinishedTwentySecondsTimer
	__end_of_isFinishedTwentySecondsTimer:
;; =============== function _isFinishedTwentySecondsTimer ends ============

	signat	_isFinishedTwentySecondsTimer,89
	global	_getAdOriginaCh4Value
psect	text611,local,class=CODE,delta=2
global __ptext611
__ptext611:

;; *************** function _getAdOriginaCh4Value *****************
;; Defined at:
;;		line 89 in file "C:\190604\AK7030-OTP\common.c"
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
psect	text611
	file	"C:\190604\AK7030-OTP\common.c"
	line	89
	global	__size_of_getAdOriginaCh4Value
	__size_of_getAdOriginaCh4Value	equ	__end_of_getAdOriginaCh4Value-_getAdOriginaCh4Value
	
_getAdOriginaCh4Value:	
	opt	stack 5
; Regs used in _getAdOriginaCh4Value: [wreg]
	line	90
	
l3784:	
;common.c: 90: return adc_original_CH4_value;
	movf	(_adc_original_CH4_value+1),w
	movwf	(?_getAdOriginaCh4Value+1)
	movf	(_adc_original_CH4_value),w
	movwf	(?_getAdOriginaCh4Value)
	line	91
	
l1627:	
	return
	opt stack 0
GLOBAL	__end_of_getAdOriginaCh4Value
	__end_of_getAdOriginaCh4Value:
;; =============== function _getAdOriginaCh4Value ends ============

	signat	_getAdOriginaCh4Value,90
	global	_startTwentySecondsTimer
psect	text612,local,class=CODE,delta=2
global __ptext612
__ptext612:

;; *************** function _startTwentySecondsTimer *****************
;; Defined at:
;;		line 244 in file "C:\190604\AK7030-OTP\common.c"
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
;; Hardware stack levels required when called:    2
;; This function calls:
;;		Nothing
;; This function is called by:
;;		_main
;; This function uses a non-reentrant model
;;
psect	text612
	file	"C:\190604\AK7030-OTP\common.c"
	line	244
	global	__size_of_startTwentySecondsTimer
	__size_of_startTwentySecondsTimer	equ	__end_of_startTwentySecondsTimer-_startTwentySecondsTimer
	
_startTwentySecondsTimer:	
	opt	stack 5
; Regs used in _startTwentySecondsTimer: [wreg]
	line	245
	
l3782:	
;common.c: 245: uiTwentySecondsTimer = 20;
	movlw	014h
	movwf	(_uiTwentySecondsTimer)
	clrf	(_uiTwentySecondsTimer+1)
	line	246
	
l1683:	
	return
	opt stack 0
GLOBAL	__end_of_startTwentySecondsTimer
	__end_of_startTwentySecondsTimer:
;; =============== function _startTwentySecondsTimer ends ============

	signat	_startTwentySecondsTimer,88
	global	_isFinishedTwelveHoursTimer
psect	text613,local,class=CODE,delta=2
global __ptext613
__ptext613:

;; *************** function _isFinishedTwelveHoursTimer *****************
;; Defined at:
;;		line 259 in file "C:\190604\AK7030-OTP\common.c"
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
;; Hardware stack levels required when called:    2
;; This function calls:
;;		Nothing
;; This function is called by:
;;		_main
;; This function uses a non-reentrant model
;;
psect	text613
	file	"C:\190604\AK7030-OTP\common.c"
	line	259
	global	__size_of_isFinishedTwelveHoursTimer
	__size_of_isFinishedTwelveHoursTimer	equ	__end_of_isFinishedTwelveHoursTimer-_isFinishedTwelveHoursTimer
	
_isFinishedTwelveHoursTimer:	
	opt	stack 5
; Regs used in _isFinishedTwelveHoursTimer: [wreg+status,2+status,0]
	line	260
	
l3770:	
;common.c: 260: if(uiBigTimer == 0)
	movf	((_uiBigTimer+1)),w
	iorwf	((_uiBigTimer)),w
	skipz
	goto	u811
	goto	u810
u811:
	goto	l3778
u810:
	line	261
	
l3772:	
;common.c: 261: return 1;
	movlw	(01h)
	goto	l1692
	line	263
	
l3778:	
;common.c: 262: else
;common.c: 263: return 0;
	movlw	(0)
	line	264
	
l1692:	
	return
	opt stack 0
GLOBAL	__end_of_isFinishedTwelveHoursTimer
	__end_of_isFinishedTwelveHoursTimer:
;; =============== function _isFinishedTwelveHoursTimer ends ============

	signat	_isFinishedTwelveHoursTimer,89
	global	_startTwelveHourTimer
psect	text614,local,class=CODE,delta=2
global __ptext614
__ptext614:

;; *************** function _startTwelveHourTimer *****************
;; Defined at:
;;		line 205 in file "C:\190604\AK7030-OTP\common.c"
;; Parameters:    Size  Location     Type
;;  uiSetTime       2    0[BANK0 ] unsigned int 
;; Auto vars:     Size  Location     Type
;;		None
;; Return value:  Size  Location     Type
;;		None               void
;; Registers used:
;;		wreg, status,2, status,0
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
psect	text614
	file	"C:\190604\AK7030-OTP\common.c"
	line	205
	global	__size_of_startTwelveHourTimer
	__size_of_startTwelveHourTimer	equ	__end_of_startTwelveHourTimer-_startTwelveHourTimer
	
_startTwelveHourTimer:	
	opt	stack 5
; Regs used in _startTwelveHourTimer: [wreg+status,2+status,0]
	line	206
	
l3766:	
;common.c: 206: if(0 == uiBigTimer)
	movf	((_uiBigTimer+1)),w
	iorwf	((_uiBigTimer)),w
	skipz
	goto	u801
	goto	u800
u801:
	goto	l1667
u800:
	line	207
	
l3768:	
;common.c: 207: uiBigTimer = uiSetTime;
	movf	(startTwelveHourTimer@uiSetTime+1),w
	movwf	(_uiBigTimer+1)
	movf	(startTwelveHourTimer@uiSetTime),w
	movwf	(_uiBigTimer)
	line	213
	
l1667:	
	return
	opt stack 0
GLOBAL	__end_of_startTwelveHourTimer
	__end_of_startTwelveHourTimer:
;; =============== function _startTwelveHourTimer ends ============

	signat	_startTwelveHourTimer,4216
	global	_getAdOriginalCh1Value
psect	text615,local,class=CODE,delta=2
global __ptext615
__ptext615:

;; *************** function _getAdOriginalCh1Value *****************
;; Defined at:
;;		line 83 in file "C:\190604\AK7030-OTP\common.c"
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
psect	text615
	file	"C:\190604\AK7030-OTP\common.c"
	line	83
	global	__size_of_getAdOriginalCh1Value
	__size_of_getAdOriginalCh1Value	equ	__end_of_getAdOriginalCh1Value-_getAdOriginalCh1Value
	
_getAdOriginalCh1Value:	
	opt	stack 5
; Regs used in _getAdOriginalCh1Value: [wreg]
	line	84
	
l3762:	
;common.c: 84: return adc_original_CH1_value;
	movf	(_adc_original_CH1_value+1),w
	movwf	(?_getAdOriginalCh1Value+1)
	movf	(_adc_original_CH1_value),w
	movwf	(?_getAdOriginalCh1Value)
	line	85
	
l1624:	
	return
	opt stack 0
GLOBAL	__end_of_getAdOriginalCh1Value
	__end_of_getAdOriginalCh1Value:
;; =============== function _getAdOriginalCh1Value ends ============

	signat	_getAdOriginalCh1Value,90
	global	_getAdOriginalCh14Value
psect	text616,local,class=CODE,delta=2
global __ptext616
__ptext616:

;; *************** function _getAdOriginalCh14Value *****************
;; Defined at:
;;		line 95 in file "C:\190604\AK7030-OTP\common.c"
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
psect	text616
	file	"C:\190604\AK7030-OTP\common.c"
	line	95
	global	__size_of_getAdOriginalCh14Value
	__size_of_getAdOriginalCh14Value	equ	__end_of_getAdOriginalCh14Value-_getAdOriginalCh14Value
	
_getAdOriginalCh14Value:	
	opt	stack 5
; Regs used in _getAdOriginalCh14Value: [wreg]
	line	96
	
l3758:	
;common.c: 96: return adc_original_CH14_value;
	movf	(_adc_original_CH14_value+1),w
	movwf	(?_getAdOriginalCh14Value+1)
	movf	(_adc_original_CH14_value),w
	movwf	(?_getAdOriginalCh14Value)
	line	97
	
l1630:	
	return
	opt stack 0
GLOBAL	__end_of_getAdOriginalCh14Value
	__end_of_getAdOriginalCh14Value:
;; =============== function _getAdOriginalCh14Value ends ============

	signat	_getAdOriginalCh14Value,90
	global	_clrSampeTime
psect	text617,local,class=CODE,delta=2
global __ptext617
__ptext617:

;; *************** function _clrSampeTime *****************
;; Defined at:
;;		line 285 in file "C:\190604\AK7030-OTP\common.c"
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
psect	text617
	file	"C:\190604\AK7030-OTP\common.c"
	line	285
	global	__size_of_clrSampeTime
	__size_of_clrSampeTime	equ	__end_of_clrSampeTime-_clrSampeTime
	
_clrSampeTime:	
	opt	stack 5
; Regs used in _clrSampeTime: [status,2]
	line	286
	
l3756:	
;common.c: 286: timer.timer10msStopWatch = 0;
	clrf	(_timer)
	line	287
	
l1706:	
	return
	opt stack 0
GLOBAL	__end_of_clrSampeTime
	__end_of_clrSampeTime:
;; =============== function _clrSampeTime ends ============

	signat	_clrSampeTime,88
	global	_isPermitSampleTime
psect	text618,local,class=CODE,delta=2
global __ptext618
__ptext618:

;; *************** function _isPermitSampleTime *****************
;; Defined at:
;;		line 275 in file "C:\190604\AK7030-OTP\common.c"
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
psect	text618
	file	"C:\190604\AK7030-OTP\common.c"
	line	275
	global	__size_of_isPermitSampleTime
	__size_of_isPermitSampleTime	equ	__end_of_isPermitSampleTime-_isPermitSampleTime
	
_isPermitSampleTime:	
	opt	stack 5
; Regs used in _isPermitSampleTime: [wreg]
	line	276
	
l3744:	
;common.c: 276: if(timer.timer10msStopWatch >= 10)
	movlw	(0Ah)
	subwf	(_timer),w
	skipc
	goto	u791
	goto	u790
u791:
	goto	l3752
u790:
	line	278
	
l3746:	
;common.c: 277: {
;common.c: 278: return 1;
	movlw	(01h)
	goto	l1702
	line	281
	
l3752:	
;common.c: 280: else
;common.c: 281: return 0;
	movlw	(0)
	line	282
	
l1702:	
	return
	opt stack 0
GLOBAL	__end_of_isPermitSampleTime
	__end_of_isPermitSampleTime:
;; =============== function _isPermitSampleTime ends ============

	signat	_isPermitSampleTime,89
	global	_adc_start
psect	text619,local,class=CODE,delta=2
global __ptext619
__ptext619:

;; *************** function _adc_start *****************
;; Defined at:
;;		line 100 in file "C:\190604\AK7030-OTP\periph.c"
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
psect	text619
	file	"C:\190604\AK7030-OTP\periph.c"
	line	100
	global	__size_of_adc_start
	__size_of_adc_start	equ	__end_of_adc_start-_adc_start
	
_adc_start:	
	opt	stack 4
; Regs used in _adc_start: []
	line	101
	
l3742:	
;periph.c: 101: GO=1;
	bcf	status, 5	;RP0=0, select bank0
	bsf	(249/8),(249)&7
	line	102
	
l2372:	
	return
	opt stack 0
GLOBAL	__end_of_adc_start
	__end_of_adc_start:
;; =============== function _adc_start ends ============

	signat	_adc_start,88
	global	_op2_init
psect	text620,local,class=CODE,delta=2
global __ptext620
__ptext620:

;; *************** function _op2_init *****************
;; Defined at:
;;		line 45 in file "C:\190604\AK7030-OTP\periph.c"
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
psect	text620
	file	"C:\190604\AK7030-OTP\periph.c"
	line	45
	global	__size_of_op2_init
	__size_of_op2_init	equ	__end_of_op2_init-_op2_init
	
_op2_init:	
	opt	stack 5
; Regs used in _op2_init: [wreg]
	line	52
	
l3736:	
;periph.c: 52: OP2CON1=0x10;
	movlw	(010h)
	movwf	(156)^080h	;volatile
	line	54
;periph.c: 54: OP2CON2=0x10;
	movlw	(010h)
	movwf	(157)^080h	;volatile
	line	55
;periph.c: 55: OP2CON0=0x80;
	movlw	(080h)
	movwf	(155)^080h	;volatile
	line	58
	
l3738:	
;periph.c: 58: TRISA7=0;
	bcf	(1071/8)^080h,(1071)&7
	line	60
	
l3740:	
;periph.c: 60: TRISB7 = 1;
	bsf	(1079/8)^080h,(1079)&7
	line	61
	
l2358:	
	return
	opt stack 0
GLOBAL	__end_of_op2_init
	__end_of_op2_init:
;; =============== function _op2_init ends ============

	signat	_op2_init,88
	global	_op1_init
psect	text621,local,class=CODE,delta=2
global __ptext621
__ptext621:

;; *************** function _op1_init *****************
;; Defined at:
;;		line 26 in file "C:\190604\AK7030-OTP\periph.c"
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
psect	text621
	file	"C:\190604\AK7030-OTP\periph.c"
	line	26
	global	__size_of_op1_init
	__size_of_op1_init	equ	__end_of_op1_init-_op1_init
	
_op1_init:	
	opt	stack 5
; Regs used in _op1_init: [wreg]
	line	33
	
l3730:	
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
	
l3732:	
;periph.c: 38: TRISB3=1;
	bsf	status, 5	;RP0=1, select bank1
	bsf	(1075/8)^080h,(1075)&7
	line	40
	
l3734:	
;periph.c: 40: TRISB5=0;
	bcf	(1077/8)^080h,(1077)&7
	line	41
	
l2355:	
	return
	opt stack 0
GLOBAL	__end_of_op1_init
	__end_of_op1_init:
;; =============== function _op1_init ends ============

	signat	_op1_init,88
	global	_dac_init
psect	text622,local,class=CODE,delta=2
global __ptext622
__ptext622:

;; *************** function _dac_init *****************
;; Defined at:
;;		line 14 in file "C:\190604\AK7030-OTP\periph.c"
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
psect	text622
	file	"C:\190604\AK7030-OTP\periph.c"
	line	14
	global	__size_of_dac_init
	__size_of_dac_init	equ	__end_of_dac_init-_dac_init
	
_dac_init:	
	opt	stack 5
; Regs used in _dac_init: [wreg]
	line	15
	
l3724:	
;periph.c: 15: DACCON|=1;
	bsf	(135)^080h+(0/8),(0)&7	;volatile
	line	17
	
l3726:	
;periph.c: 17: DACR0=0x0F;
	movlw	(0Fh)
	movwf	(136)^080h	;volatile
	line	18
	
l3728:	
;periph.c: 18: DACCON|=(1)<<2;
	bsf	(135)^080h+(2/8),(2)&7	;volatile
	line	22
	
l2352:	
	return
	opt stack 0
GLOBAL	__end_of_dac_init
	__end_of_dac_init:
;; =============== function _dac_init ends ============

	signat	_dac_init,88
	global	_adc_test_init
psect	text623,local,class=CODE,delta=2
global __ptext623
__ptext623:

;; *************** function _adc_test_init *****************
;; Defined at:
;;		line 85 in file "C:\190604\AK7030-OTP\periph.c"
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
psect	text623
	file	"C:\190604\AK7030-OTP\periph.c"
	line	85
	global	__size_of_adc_test_init
	__size_of_adc_test_init	equ	__end_of_adc_test_init-_adc_test_init
	
_adc_test_init:	
	opt	stack 4
; Regs used in _adc_test_init: [wreg+status,2+status,0]
;adc_test_init@channel stored from wreg
	movwf	(adc_test_init@channel)
	line	86
	
l3714:	
;periph.c: 86: ADCON0 = 0x00;
	clrf	(31)	;volatile
	line	87
	
l3716:	
;periph.c: 87: ADCON0|=channel<<2;
	movf	(adc_test_init@channel),w
	movwf	(??_adc_test_init+0)+0
	clrc
	rlf	(??_adc_test_init+0)+0,f
	clrc
	rlf	(??_adc_test_init+0)+0,w
	iorwf	(31),f	;volatile
	line	88
	
l3718:	
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
	
l3720:	
;periph.c: 89: ADON=1;
	bcf	status, 5	;RP0=0, select bank0
	bsf	(248/8),(248)&7
	line	90
	
l3722:	
;periph.c: 90: ADIE=1;
	bsf	status, 5	;RP0=1, select bank1
	bsf	(1130/8)^080h,(1130)&7
	line	91
	
l2366:	
	return
	opt stack 0
GLOBAL	__end_of_adc_test_init
	__end_of_adc_test_init:
;; =============== function _adc_test_init ends ============

	signat	_adc_test_init,8312
	global	_timer1_interrupt_config
psect	text624,local,class=CODE,delta=2
global __ptext624
__ptext624:

;; *************** function _timer1_interrupt_config *****************
;; Defined at:
;;		line 58 in file "C:\190604\AK7030-OTP\common.c"
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
psect	text624
	file	"C:\190604\AK7030-OTP\common.c"
	line	58
	global	__size_of_timer1_interrupt_config
	__size_of_timer1_interrupt_config	equ	__end_of_timer1_interrupt_config-_timer1_interrupt_config
	
_timer1_interrupt_config:	
	opt	stack 5
; Regs used in _timer1_interrupt_config: []
	line	59
	
l3712:	
;common.c: 59: GIE = 1;
	bsf	(95/8),(95)&7
	line	60
;common.c: 60: PEIE = 1;
	bsf	(94/8),(94)&7
	line	61
	
l1612:	
	return
	opt stack 0
GLOBAL	__end_of_timer1_interrupt_config
	__end_of_timer1_interrupt_config:
;; =============== function _timer1_interrupt_config ends ============

	signat	_timer1_interrupt_config,88
	global	_timer1_config
psect	text625,local,class=CODE,delta=2
global __ptext625
__ptext625:

;; *************** function _timer1_config *****************
;; Defined at:
;;		line 46 in file "C:\190604\AK7030-OTP\common.c"
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
psect	text625
	file	"C:\190604\AK7030-OTP\common.c"
	line	46
	global	__size_of_timer1_config
	__size_of_timer1_config	equ	__end_of_timer1_config-_timer1_config
	
_timer1_config:	
	opt	stack 5
; Regs used in _timer1_config: [wreg]
	line	48
	
l3708:	
;common.c: 48: TMR1H=0xCF;
	movlw	(0CFh)
	bcf	status, 6	;RP1=0, select bank0
	movwf	(15)	;volatile
	line	49
;common.c: 49: TMR1L=0x2C;
	movlw	(02Ch)
	movwf	(14)	;volatile
	line	50
;common.c: 50: T1CON=0xE1;
	movlw	(0E1h)
	movwf	(16)	;volatile
	line	51
	
l3710:	
;common.c: 51: TMR1IE=1;
	bsf	status, 5	;RP0=1, select bank1
	bsf	(1120/8)^080h,(1120)&7
	line	53
	
l1609:	
	return
	opt stack 0
GLOBAL	__end_of_timer1_config
	__end_of_timer1_config:
;; =============== function _timer1_config ends ============

	signat	_timer1_config,88
	global	_clock_config
psect	text626,local,class=CODE,delta=2
global __ptext626
__ptext626:

;; *************** function _clock_config *****************
;; Defined at:
;;		line 38 in file "C:\190604\AK7030-OTP\common.c"
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
psect	text626
	file	"C:\190604\AK7030-OTP\common.c"
	line	38
	global	__size_of_clock_config
	__size_of_clock_config	equ	__end_of_clock_config-_clock_config
	
_clock_config:	
	opt	stack 5
; Regs used in _clock_config: [wreg+status,2]
	line	40
	
l3704:	
;common.c: 40: CLKPR = 0x80;
	movlw	(080h)
	bcf	status, 5	;RP0=0, select bank2
	bsf	status, 6	;RP1=1, select bank2
	movwf	(264)^0100h	;volatile
	line	41
	
l3706:	
;common.c: 41: CLKPR = 0x00;
	clrf	(264)^0100h	;volatile
	line	42
;common.c: 42: while(CLKPCE);
	
l1603:	
	btfsc	(2119/8)^0100h,(2119)&7
	goto	u781
	goto	u780
u781:
	goto	l1603
u780:
	line	43
	
l1606:	
	return
	opt stack 0
GLOBAL	__end_of_clock_config
	__end_of_clock_config:
;; =============== function _clock_config ends ============

	signat	_clock_config,88
	global	_initPin
psect	text627,local,class=CODE,delta=2
global __ptext627
__ptext627:

;; *************** function _initPin *****************
;; Defined at:
;;		line 105 in file "C:\190604\AK7030-OTP\main.c"
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
;;		On exit  : 60/60
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
;; This function uses a non-reentrant model
;;
psect	text627
	file	"C:\190604\AK7030-OTP\main.c"
	line	105
	global	__size_of_initPin
	__size_of_initPin	equ	__end_of_initPin-_initPin
	
_initPin:	
	opt	stack 5
; Regs used in _initPin: []
	line	106
	
l3702:	
;main.c: 106: PB6 = 1;
	bcf	status, 5	;RP0=0, select bank0
	bsf	(54/8),(54)&7
	line	107
;main.c: 107: PBOD6 = 1;
	bsf	status, 5	;RP0=1, select bank3
	bsf	status, 6	;RP1=1, select bank3
	bsf	(3142/8)^0180h,(3142)&7
	line	111
;main.c: 111: PA0 = 0;
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	bcf	(40/8),(40)&7
	line	112
;main.c: 112: PA1 = 0;
	bcf	(41/8),(41)&7
	line	113
;main.c: 113: PA2 = 0;
	bcf	(42/8),(42)&7
	line	114
;main.c: 114: PA3 = 0;
	bcf	(43/8),(43)&7
	line	115
;main.c: 115: PB0 = 0;
	bcf	(48/8),(48)&7
	line	116
;main.c: 116: PB1 = 1;
	bsf	(49/8),(49)&7
	line	117
;main.c: 117: PA6 = 0;
	bcf	(46/8),(46)&7
	line	118
;main.c: 118: PA7 = 0;
	bcf	(47/8),(47)&7
	line	119
;main.c: 119: PAOD7 = 0;
	bsf	status, 5	;RP0=1, select bank3
	bsf	status, 6	;RP1=1, select bank3
	bcf	(3135/8)^0180h,(3135)&7
	line	121
	
l683:	
	return
	opt stack 0
GLOBAL	__end_of_initPin
	__end_of_initPin:
;; =============== function _initPin ends ============

	signat	_initPin,88
	global	_clearTwentySecondsTimer
psect	text628,local,class=CODE,delta=2
global __ptext628
__ptext628:

;; *************** function _clearTwentySecondsTimer *****************
;; Defined at:
;;		line 227 in file "C:\190604\AK7030-OTP\common.c"
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
;; Hardware stack levels required when called:    2
;; This function calls:
;;		Nothing
;; This function is called by:
;;		_clearAllTimer
;; This function uses a non-reentrant model
;;
psect	text628
	file	"C:\190604\AK7030-OTP\common.c"
	line	227
	global	__size_of_clearTwentySecondsTimer
	__size_of_clearTwentySecondsTimer	equ	__end_of_clearTwentySecondsTimer-_clearTwentySecondsTimer
	
_clearTwentySecondsTimer:	
	opt	stack 4
; Regs used in _clearTwentySecondsTimer: [status,2]
	line	228
	
l3700:	
;common.c: 228: uiTwentySecondsTimer = 0;
	clrf	(_uiTwentySecondsTimer)
	clrf	(_uiTwentySecondsTimer+1)
	line	229
	
l1676:	
	return
	opt stack 0
GLOBAL	__end_of_clearTwentySecondsTimer
	__end_of_clearTwentySecondsTimer:
;; =============== function _clearTwentySecondsTimer ends ============

	signat	_clearTwentySecondsTimer,88
	global	_clearThreeHoursTimer
psect	text629,local,class=CODE,delta=2
global __ptext629
__ptext629:

;; *************** function _clearThreeHoursTimer *****************
;; Defined at:
;;		line 222 in file "C:\190604\AK7030-OTP\common.c"
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
;; Hardware stack levels required when called:    2
;; This function calls:
;;		Nothing
;; This function is called by:
;;		_clearAllTimer
;;		_main
;; This function uses a non-reentrant model
;;
psect	text629
	file	"C:\190604\AK7030-OTP\common.c"
	line	222
	global	__size_of_clearThreeHoursTimer
	__size_of_clearThreeHoursTimer	equ	__end_of_clearThreeHoursTimer-_clearThreeHoursTimer
	
_clearThreeHoursTimer:	
	opt	stack 4
; Regs used in _clearThreeHoursTimer: [status,2]
	line	223
	
l3698:	
;common.c: 223: uiSmallTimer = 0;
	clrf	(_uiSmallTimer)
	clrf	(_uiSmallTimer+1)
	line	224
	
l1673:	
	return
	opt stack 0
GLOBAL	__end_of_clearThreeHoursTimer
	__end_of_clearThreeHoursTimer:
;; =============== function _clearThreeHoursTimer ends ============

	signat	_clearThreeHoursTimer,88
	global	_clearTwelveHoursTimer
psect	text630,local,class=CODE,delta=2
global __ptext630
__ptext630:

;; *************** function _clearTwelveHoursTimer *****************
;; Defined at:
;;		line 216 in file "C:\190604\AK7030-OTP\common.c"
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
;; Hardware stack levels required when called:    2
;; This function calls:
;;		Nothing
;; This function is called by:
;;		_clearAllTimer
;; This function uses a non-reentrant model
;;
psect	text630
	file	"C:\190604\AK7030-OTP\common.c"
	line	216
	global	__size_of_clearTwelveHoursTimer
	__size_of_clearTwelveHoursTimer	equ	__end_of_clearTwelveHoursTimer-_clearTwelveHoursTimer
	
_clearTwelveHoursTimer:	
	opt	stack 4
; Regs used in _clearTwelveHoursTimer: [status,2]
	line	217
	
l3696:	
;common.c: 217: uiBigTimer = 0;
	clrf	(_uiBigTimer)
	clrf	(_uiBigTimer+1)
	line	218
	
l1670:	
	return
	opt stack 0
GLOBAL	__end_of_clearTwelveHoursTimer
	__end_of_clearTwelveHoursTimer:
;; =============== function _clearTwelveHoursTimer ends ============

	signat	_clearTwelveHoursTimer,88
	global	_ISR
psect	text631,local,class=CODE,delta=2
global __ptext631
__ptext631:

;; *************** function _ISR *****************
;; Defined at:
;;		line 290 in file "C:\190604\AK7030-OTP\common.c"
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
;;		On exit  : 60/0
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
psect	text631
	file	"C:\190604\AK7030-OTP\common.c"
	line	290
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
psect	text631
	line	293
	
i1l3826:	
;common.c: 291: static unsigned char ucTimer1sCnt = 0;
;common.c: 293: if(TMR1IF == 1)
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	btfss	(96/8),(96)&7
	goto	u85_21
	goto	u85_20
u85_21:
	goto	i1l3844
u85_20:
	line	295
	
i1l3828:	
;common.c: 294: {
;common.c: 295: TMR1IF = 0 ;
	bcf	(96/8),(96)&7
	line	296
	
i1l3830:	
;common.c: 296: timer.timer10msStopWatch++;
	incf	(_timer),f
	line	297
;common.c: 297: ucTimer1sCnt++;
	incf	(ISR@ucTimer1sCnt),f
	line	299
	
i1l3832:	
;common.c: 299: if(ucTimer1sCnt >= 100)
	movlw	(064h)
	subwf	(ISR@ucTimer1sCnt),w
	skipc
	goto	u86_21
	goto	u86_20
u86_21:
	goto	i1l3844
u86_20:
	line	301
	
i1l3834:	
;common.c: 300: {
;common.c: 301: ucTimer1sCnt = 0;
	clrf	(ISR@ucTimer1sCnt)
	line	302
	
i1l3836:	
;common.c: 302: if(uiBigTimer > 0)
	movf	(_uiBigTimer+1),w
	iorwf	(_uiBigTimer),w
	skipnz
	goto	u87_21
	goto	u87_20
u87_21:
	goto	i1l1713
u87_20:
	line	303
	
i1l3838:	
;common.c: 303: uiBigTimer--;
	movlw	low(01h)
	subwf	(_uiBigTimer),f
	movlw	high(01h)
	skipc
	decf	(_uiBigTimer+1),f
	subwf	(_uiBigTimer+1),f
	
i1l1713:	
	line	305
;common.c: 305: if(uiSmallTimer)
	movf	(_uiSmallTimer+1),w
	iorwf	(_uiSmallTimer),w
	skipnz
	goto	u88_21
	goto	u88_20
u88_21:
	goto	i1l1714
u88_20:
	line	306
	
i1l3840:	
;common.c: 306: uiSmallTimer--;
	movlw	low(01h)
	subwf	(_uiSmallTimer),f
	movlw	high(01h)
	skipc
	decf	(_uiSmallTimer+1),f
	subwf	(_uiSmallTimer+1),f
	
i1l1714:	
	line	308
;common.c: 308: if(uiTwentySecondsTimer)
	movf	(_uiTwentySecondsTimer+1),w
	iorwf	(_uiTwentySecondsTimer),w
	skipnz
	goto	u89_21
	goto	u89_20
u89_21:
	goto	i1l3844
u89_20:
	line	309
	
i1l3842:	
;common.c: 309: uiTwentySecondsTimer--;
	movlw	low(01h)
	subwf	(_uiTwentySecondsTimer),f
	movlw	high(01h)
	skipc
	decf	(_uiTwentySecondsTimer+1),f
	subwf	(_uiTwentySecondsTimer+1),f
	line	313
	
i1l3844:	
;common.c: 310: }
;common.c: 311: }
;common.c: 313: if(ADIF)
	btfss	(106/8),(106)&7
	goto	u90_21
	goto	u90_20
u90_21:
	goto	i1l1721
u90_20:
	line	315
	
i1l3846:	
;common.c: 314: {
;common.c: 315: ADIF=0;
	bcf	(106/8),(106)&7
	line	316
	
i1l3848:	
;common.c: 316: setAD_ConvertFlag(1);
	movlw	(01h)
	fcall	i1_setAD_ConvertFlag
	line	317
	
i1l3850:	
;common.c: 317: adc_original_value = adc_get();
	fcall	_adc_get
	movf	(1+(?_adc_get)),w
	bcf	status, 5	;RP0=0, select bank0
	movwf	(_adc_original_value+1)
	movf	(0+(?_adc_get)),w
	movwf	(_adc_original_value)
	line	318
	
i1l3852:	
;common.c: 318: if(sampleChannelSelect == 4)
	movf	(_sampleChannelSelect),w
	xorlw	04h
	skipz
	goto	u91_21
	goto	u91_20
u91_21:
	goto	i1l3856
u91_20:
	line	319
	
i1l3854:	
;common.c: 319: adc_original_CH4_value = adc_get();
	fcall	_adc_get
	movf	(1+(?_adc_get)),w
	bcf	status, 5	;RP0=0, select bank0
	movwf	(_adc_original_CH4_value+1)
	movf	(0+(?_adc_get)),w
	movwf	(_adc_original_CH4_value)
	goto	i1l1721
	line	320
	
i1l3856:	
;common.c: 320: else if(sampleChannelSelect == 1)
	decf	(_sampleChannelSelect),w
	skipz
	goto	u92_21
	goto	u92_20
u92_21:
	goto	i1l3860
u92_20:
	line	321
	
i1l3858:	
;common.c: 321: adc_original_CH1_value = adc_get();
	fcall	_adc_get
	movf	(1+(?_adc_get)),w
	bcf	status, 5	;RP0=0, select bank0
	movwf	(_adc_original_CH1_value+1)
	movf	(0+(?_adc_get)),w
	movwf	(_adc_original_CH1_value)
	goto	i1l1721
	line	323
	
i1l3860:	
;common.c: 322: else
;common.c: 323: adc_original_CH14_value = adc_get();
	fcall	_adc_get
	movf	(1+(?_adc_get)),w
	bcf	status, 5	;RP0=0, select bank0
	movwf	(_adc_original_CH14_value+1)
	movf	(0+(?_adc_get)),w
	movwf	(_adc_original_CH14_value)
	line	326
	
i1l1721:	
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
psect	text632,local,class=CODE,delta=2
global __ptext632
__ptext632:

;; *************** function i1_setAD_ConvertFlag *****************
;; Defined at:
;;		line 72 in file "C:\190604\AK7030-OTP\common.c"
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
psect	text632
	file	"C:\190604\AK7030-OTP\common.c"
	line	72
	global	__size_ofi1_setAD_ConvertFlag
	__size_ofi1_setAD_ConvertFlag	equ	__end_ofi1_setAD_ConvertFlag-i1_setAD_ConvertFlag
	
i1_setAD_ConvertFlag:	
	opt	stack 3
; Regs used in i1_setAD_ConvertFlag: [wreg]
;i1setAD_ConvertFlag@flag stored from wreg
	movwf	(i1setAD_ConvertFlag@flag)
	line	73
	
i1l3866:	
;common.c: 73: adc_convert_flag = flag;
	movf	(i1setAD_ConvertFlag@flag),w
	movwf	(_adc_convert_flag)
	line	74
	
i1l1618:	
	return
	opt stack 0
GLOBAL	__end_ofi1_setAD_ConvertFlag
	__end_ofi1_setAD_ConvertFlag:
;; =============== function i1_setAD_ConvertFlag ends ============

	signat	i1_setAD_ConvertFlag,88
	global	_adc_get
psect	text633,local,class=CODE,delta=2
global __ptext633
__ptext633:

;; *************** function _adc_get *****************
;; Defined at:
;;		line 105 in file "C:\190604\AK7030-OTP\periph.c"
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
psect	text633
	file	"C:\190604\AK7030-OTP\periph.c"
	line	105
	global	__size_of_adc_get
	__size_of_adc_get	equ	__end_of_adc_get-_adc_get
	
_adc_get:	
	opt	stack 3
; Regs used in _adc_get: [wreg]
	line	107
	
i1l3862:	
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
	
i1l2375:	
	return
	opt stack 0
GLOBAL	__end_of_adc_get
	__end_of_adc_get:
;; =============== function _adc_get ends ============

	signat	_adc_get,90
psect	text634,local,class=CODE,delta=2
global __ptext634
__ptext634:
	global	btemp
	btemp set 07Eh

	DABS	1,126,2	;btemp
	global	wtemp0
	wtemp0 set btemp
	end
