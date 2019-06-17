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
	global	_uiSmallTimer
	global	_uiTwentySecondsTimer
	global	_sampleTimes
	global	main@cTimer1s_806
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

_uiSmallTimer:
       ds      2

_uiTwentySecondsTimer:
       ds      2

_sampleTimes:
       ds      1

main@cTimer1s_806:
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
	global	?_startTwelveHourTimer
?_startTwelveHourTimer:	; 0 bytes @ 0x0
	global	?_startTwentySecondsTimer
?_startTwentySecondsTimer:	; 0 bytes @ 0x0
	global	?_startThreeHoursTimer
?_startThreeHoursTimer:	; 0 bytes @ 0x0
	global	?_AD_Sample
?_AD_Sample:	; 0 bytes @ 0x0
	global	?_clearAllTimer
?_clearAllTimer:	; 0 bytes @ 0x0
	global	?_clearPinPortAndTimer
?_clearPinPortAndTimer:	; 0 bytes @ 0x0
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
	global	??_startTwelveHourTimer
??_startTwelveHourTimer:	; 0 bytes @ 0x0
	global	??_isFinishedTwelveHoursTimer
??_isFinishedTwelveHoursTimer:	; 0 bytes @ 0x0
	global	??_startTwentySecondsTimer
??_startTwentySecondsTimer:	; 0 bytes @ 0x0
	global	??_isFinishedTwentySecondsTimer
??_isFinishedTwentySecondsTimer:	; 0 bytes @ 0x0
	global	??_startThreeHoursTimer
??_startThreeHoursTimer:	; 0 bytes @ 0x0
	global	??_isFinishedThreeHoursTimer
??_isFinishedThreeHoursTimer:	; 0 bytes @ 0x0
	global	??_clearAllTimer
??_clearAllTimer:	; 0 bytes @ 0x0
	global	??_clearPinPortAndTimer
??_clearPinPortAndTimer:	; 0 bytes @ 0x0
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
	ds	1
	global	??_adc_test_init
??_adc_test_init:	; 0 bytes @ 0x1
	ds	1
	global	??_getAdOriginalCh14Value
??_getAdOriginalCh14Value:	; 0 bytes @ 0x2
	global	??_getAdOriginalCh1Value
??_getAdOriginalCh1Value:	; 0 bytes @ 0x2
	global	??_getAdOriginaCh4Value
??_getAdOriginaCh4Value:	; 0 bytes @ 0x2
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
;; (1) _startThreeHoursTimer                                 0     0      0       0
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
;; (1) _startTwelveHourTimer                                 0     0      0       0
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
;;		line 105 in file "C:\190604\AK7030-OTP\main.c"
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
	line	105
	global	__size_of_main
	__size_of_main	equ	__end_of_main-_main
	
_main:	
	opt	stack 3
; Regs used in _main: [wreg-fsr0h+status,2+status,0+pclath+cstack]
	line	126
	
l3931:	
;main.c: 106: enum setp_Adc4
;main.c: 107: {
;main.c: 108: ADC4_STEP_INIT = 0,
;main.c: 109: ADC4_STEP_FIRST,
;main.c: 110: ADC4_STEP_SECOND,
;main.c: 111: ADC4_STEP_THIRD,
;main.c: 112: ADC4_STEP_FOURTH,
;main.c: 113: ADC4_STEP_FIFTH,
;main.c: 114: ADC4_STEP_SIXTH,
;main.c: 115: };
;main.c: 118: static unsigned char ucWaitTime1S = 0;
;main.c: 120: static unsigned char ucWaitTimeO3s = 0;
;main.c: 122: static unsigned char ucSmallTimerActionFlag = 0;
;main.c: 124: static unsigned char ucSetSmallActionFlag = 0;
	bsf	status, 5	;RP0=1, select bank1
	bcf	(1064/8)^080h,(1064)&7
	line	127
;main.c: 127: TRISA1 = 0;
	bcf	(1065/8)^080h,(1065)&7
	line	128
;main.c: 128: TRISA2 = 0;
	bcf	(1066/8)^080h,(1066)&7
	line	129
;main.c: 129: TRISA3 = 0;
	bcf	(1067/8)^080h,(1067)&7
	line	130
;main.c: 130: TRISB0 = 0;
	bcf	(1072/8)^080h,(1072)&7
	line	131
;main.c: 131: TRISB1 = 0;
	bcf	(1073/8)^080h,(1073)&7
	line	132
;main.c: 132: TRISA6 = 0;
	bcf	(1070/8)^080h,(1070)&7
	line	133
;main.c: 133: TRISA7 = 0;
	bcf	(1071/8)^080h,(1071)&7
	line	135
;main.c: 135: PBOD6 = 1;
	bsf	status, 6	;RP1=1, select bank3
	bsf	(3142/8)^0180h,(3142)&7
	line	137
;main.c: 137: PA0 = 0;
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	bcf	(40/8),(40)&7
	line	138
;main.c: 138: PA1 = 0;
	bcf	(41/8),(41)&7
	line	139
;main.c: 139: PA2 = 0;
	bcf	(42/8),(42)&7
	line	140
;main.c: 140: PA3 = 0;
	bcf	(43/8),(43)&7
	line	141
;main.c: 141: PB0 = 0;
	bcf	(48/8),(48)&7
	line	142
;main.c: 142: PB1 = 1;
	bsf	(49/8),(49)&7
	line	143
;main.c: 143: PA6 = 0;
	bcf	(46/8),(46)&7
	line	144
;main.c: 144: PA7 = 0;
	bcf	(47/8),(47)&7
	line	146
;main.c: 146: TRISB2 = 1;
	bsf	status, 5	;RP0=1, select bank1
	bsf	(1074/8)^080h,(1074)&7
	line	148
;main.c: 148: TRISB7 = 1;
	bsf	(1079/8)^080h,(1079)&7
	line	149
;main.c: 149: TRISB4 = 1;
	bsf	(1076/8)^080h,(1076)&7
	line	151
	
l3933:	
;main.c: 151: clock_config();
	fcall	_clock_config
	line	152
;main.c: 152: timer1_config();
	fcall	_timer1_config
	line	153
	
l3935:	
;main.c: 153: timer1_interrupt_config();
	fcall	_timer1_interrupt_config
	line	155
	
l3937:	
;main.c: 155: adc_test_init(14,3);
	movlw	(03h)
	bcf	status, 5	;RP0=0, select bank0
	movwf	(?_adc_test_init)
	movlw	(0Eh)
	fcall	_adc_test_init
	line	157
	
l3939:	
;main.c: 157: dac_init();
	fcall	_dac_init
	line	158
	
l3941:	
;main.c: 158: op1_init();
	fcall	_op1_init
	line	159
	
l3943:	
;main.c: 159: op2_init();
	fcall	_op2_init
	line	162
	
l3945:	
;main.c: 162: adc_start();
	fcall	_adc_start
	line	195
	
l3947:	
# 195 "C:\190604\AK7030-OTP\main.c"
 clrwdt ;#
psect	maintext
	line	197
	
l3949:	
;main.c: 197: if(isPermitSampleTime())
	fcall	_isPermitSampleTime
	xorlw	0
	skipnz
	goto	u1001
	goto	u1000
u1001:
	goto	l3947
u1000:
	line	199
	
l3951:	
;main.c: 198: {
;main.c: 199: clrSampeTime();
	fcall	_clrSampeTime
	line	200
	
l3953:	
;main.c: 200: process_AD_Converter_Value();
	fcall	_process_AD_Converter_Value
	line	202
;main.c: 202: switch(enumMainLoopStep)
	goto	l4443
	line	207
	
l3955:	
;main.c: 205: {
;main.c: 206: static unsigned char ucTimerZeroPoint5s = 0;
;main.c: 207: if(getAdOriginalCh14Value() > 1950)
	fcall	_getAdOriginalCh14Value
	movlw	high(079Fh)
	subwf	(1+(?_getAdOriginalCh14Value)),w
	movlw	low(079Fh)
	skipnz
	subwf	(0+(?_getAdOriginalCh14Value)),w
	skipc
	goto	u1011
	goto	u1010
u1011:
	goto	l3959
u1010:
	line	209
	
l3957:	
;main.c: 208: {
;main.c: 209: ucTimerZeroPoint5s++;
	incf	(main@ucTimerZeroPoint5s),f
	line	210
;main.c: 210: }
	goto	l3961
	line	212
	
l3959:	
;main.c: 211: else
;main.c: 212: ucTimerZeroPoint5s = 0;
	clrf	(main@ucTimerZeroPoint5s)
	line	214
	
l3961:	
;main.c: 214: if(ucTimerZeroPoint5s >= 5)
	movlw	(05h)
	subwf	(main@ucTimerZeroPoint5s),w
	skipc
	goto	u1021
	goto	u1020
u1021:
	goto	l3947
u1020:
	line	216
	
l3963:	
;main.c: 215: {
;main.c: 216: ucTimerZeroPoint5s = 0;
	clrf	(main@ucTimerZeroPoint5s)
	line	217
	
l3965:	
;main.c: 217: enumMainLoopStep = MAIN_LOOP_STEP_FIRST;
	clrf	(main@enumMainLoopStep)
	incf	(main@enumMainLoopStep),f
	goto	l3947
	line	218
	
l703:	
	line	219
;main.c: 218: }
;main.c: 219: break;
	goto	l3947
	line	226
	
l3967:	
;main.c: 223: {
;main.c: 224: static unsigned char ucTimerZeroPoint3s = 0;
;main.c: 226: if(ucTimerZeroPoint3s < 3)
	movlw	(03h)
	subwf	(main@ucTimerZeroPoint3s),w
	skipnc
	goto	u1031
	goto	u1030
u1031:
	goto	l3971
u1030:
	line	228
	
l3969:	
;main.c: 227: {
;main.c: 228: ucTimerZeroPoint3s++;
	incf	(main@ucTimerZeroPoint3s),f
	line	229
;main.c: 229: }
	goto	l3947
	line	232
	
l3971:	
;main.c: 230: else
;main.c: 231: {
;main.c: 232: ucTimerZeroPoint3s = 0;
	clrf	(main@ucTimerZeroPoint3s)
	line	234
	
l3973:	
;main.c: 234: if(getAdOriginalCh14Value() > 1950)
	fcall	_getAdOriginalCh14Value
	movlw	high(079Fh)
	subwf	(1+(?_getAdOriginalCh14Value)),w
	movlw	low(079Fh)
	skipnz
	subwf	(0+(?_getAdOriginalCh14Value)),w
	skipc
	goto	u1041
	goto	u1040
u1041:
	goto	l3977
u1040:
	line	237
	
l3975:	
;main.c: 235: {
;main.c: 237: enumMainLoopStep = MAIN_LOOP_STEP_SECOND;
	movlw	(02h)
	movwf	(main@enumMainLoopStep)
	line	238
;main.c: 238: }
	goto	l3947
	line	241
	
l3977:	
;main.c: 239: else
;main.c: 240: {
;main.c: 241: clearPinPortAndTimer();
	fcall	_clearPinPortAndTimer
	goto	l3947
	line	247
;main.c: 245: }
;main.c: 247: case MAIN_LOOP_STEP_SECOND:
	
l712:	
	line	250
;main.c: 248: {
;main.c: 250: PA6 = 1;
	bsf	(46/8),(46)&7
	line	251
	
l3979:	
;main.c: 251: enumMainLoopStep = MAIN_LOOP_STEP_THIRD;
	movlw	(03h)
	movwf	(main@enumMainLoopStep)
	line	253
;main.c: 253: break;
	goto	l3947
	line	260
	
l3981:	
;main.c: 257: {
;main.c: 258: static unsigned char ucTimerADC1ZeroP5s = 0;
;main.c: 260: if(getAdOriginalCh1Value() < 130)
	fcall	_getAdOriginalCh1Value
	movlw	high(082h)
	subwf	(1+(?_getAdOriginalCh1Value)),w
	movlw	low(082h)
	skipnz
	subwf	(0+(?_getAdOriginalCh1Value)),w
	skipnc
	goto	u1051
	goto	u1050
u1051:
	goto	l3985
u1050:
	line	262
	
l3983:	
;main.c: 261: {
;main.c: 262: ucTimerADC1ZeroP5s = 0;
	clrf	(main@ucTimerADC1ZeroP5s)
	line	264
;main.c: 264: }
	goto	l3987
	line	267
	
l3985:	
;main.c: 265: else
;main.c: 266: {
;main.c: 267: ucTimerADC1ZeroP5s++;
	incf	(main@ucTimerADC1ZeroP5s),f
	line	270
	
l3987:	
;main.c: 268: }
;main.c: 270: if(ucTimerADC1ZeroP5s >= 1)
	movf	(main@ucTimerADC1ZeroP5s),w
	skipz
	goto	u1060
	goto	l3993
u1060:
	line	272
	
l3989:	
;main.c: 271: {
;main.c: 272: ucTimerADC1ZeroP5s = 0;
	clrf	(main@ucTimerADC1ZeroP5s)
	line	273
	
l3991:	
;main.c: 273: enumMainLoopStep = MAIN_LOOP_STEP_FOURTH;
	movlw	(04h)
	movwf	(main@enumMainLoopStep)
	line	274
;main.c: 274: }
	goto	l3947
	line	279
	
l3993:	
;main.c: 275: else
;main.c: 276: {
;main.c: 277: static unsigned char ucTimerRightP5s = 0;
;main.c: 279: if(getAdOriginalCh1Value() < 117)
	fcall	_getAdOriginalCh1Value
	movlw	high(075h)
	subwf	(1+(?_getAdOriginalCh1Value)),w
	movlw	low(075h)
	skipnz
	subwf	(0+(?_getAdOriginalCh1Value)),w
	skipnc
	goto	u1071
	goto	u1070
u1071:
	goto	l3997
u1070:
	line	281
	
l3995:	
;main.c: 280: {
;main.c: 281: ucTimerRightP5s++;
	incf	(main@ucTimerRightP5s),f
	line	282
;main.c: 282: }
	goto	l3999
	line	285
	
l3997:	
;main.c: 283: else
;main.c: 284: {
;main.c: 285: ucTimerRightP5s = 0;
	clrf	(main@ucTimerRightP5s)
	line	288
	
l3999:	
;main.c: 286: }
;main.c: 288: if(ucTimerRightP5s >= 1)
	movf	(main@ucTimerRightP5s),w
	skipz
	goto	u1080
	goto	l703
u1080:
	line	290
	
l4001:	
;main.c: 289: {
;main.c: 290: ucTimerRightP5s = 0;
	clrf	(main@ucTimerRightP5s)
	line	291
	
l4003:	
;main.c: 291: enumMainLoopStep = MAIN_LOOP_STEP_3_HOUR_BRANCH;
	movlw	(08h)
	movwf	(main@enumMainLoopStep)
	line	292
;main.c: 292: }
	goto	l3947
	line	305
	
l4005:	
;main.c: 303: {
;main.c: 305: startTwelveHourTimer();
	fcall	_startTwelveHourTimer
	line	306
	
l4007:	
;main.c: 306: enumMainLoopStep = MAIN_LOOP_STEP_FIFTH;
	movlw	(05h)
	movwf	(main@enumMainLoopStep)
	line	308
;main.c: 308: break;
	goto	l3947
	line	314
	
l4009:	
;main.c: 312: {
;main.c: 314: if(isFinishedTwelveHoursTimer())
	fcall	_isFinishedTwelveHoursTimer
	xorlw	0
	skipnz
	goto	u1091
	goto	u1090
u1091:
	goto	l4323
u1090:
	line	316
	
l4011:	
;main.c: 315: {
;main.c: 316: enumMainLoopStep = MAIN_LOOP_STEP_12_HOUR_END;
	movlw	(09h)
	movwf	(main@enumMainLoopStep)
	line	317
;main.c: 317: }
	goto	l3947
	line	326
	
l4013:	
;main.c: 325: {
;main.c: 326: startTwentySecondsTimer();
	fcall	_startTwentySecondsTimer
	line	327
	
l4015:	
;main.c: 327: ucADC4_Step = ADC4_STEP_FIRST;
	clrf	(main@ucADC4_Step)
	incf	(main@ucADC4_Step),f
	line	328
;main.c: 328: break;
	goto	l3947
	line	333
	
l4017:	
;main.c: 332: {
;main.c: 333: if(getAdOriginaCh4Value() < 1911)
	fcall	_getAdOriginaCh4Value
	movlw	high(0777h)
	subwf	(1+(?_getAdOriginaCh4Value)),w
	movlw	low(0777h)
	skipnz
	subwf	(0+(?_getAdOriginaCh4Value)),w
	skipnc
	goto	u1101
	goto	u1100
u1101:
	goto	l4021
u1100:
	line	334
	
l4019:	
;main.c: 334: ucChannel4Type = LESS_THAN_1911;
	clrf	(main@ucChannel4Type)
	goto	l737
	line	335
	
l4021:	
;main.c: 335: else if(getAdOriginaCh4Value() < 2067)
	fcall	_getAdOriginaCh4Value
	movlw	high(0813h)
	subwf	(1+(?_getAdOriginaCh4Value)),w
	movlw	low(0813h)
	skipnz
	subwf	(0+(?_getAdOriginaCh4Value)),w
	skipnc
	goto	u1111
	goto	u1110
u1111:
	goto	l4025
u1110:
	line	336
	
l4023:	
;main.c: 336: ucChannel4Type = BETWEEN_1911_AND_2067;
	clrf	(main@ucChannel4Type)
	incf	(main@ucChannel4Type),f
	goto	l737
	line	337
	
l4025:	
;main.c: 337: else if(getAdOriginaCh4Value() < 2204)
	fcall	_getAdOriginaCh4Value
	movlw	high(089Ch)
	subwf	(1+(?_getAdOriginaCh4Value)),w
	movlw	low(089Ch)
	skipnz
	subwf	(0+(?_getAdOriginaCh4Value)),w
	skipnc
	goto	u1121
	goto	u1120
u1121:
	goto	l4029
u1120:
	line	338
	
l4027:	
;main.c: 338: ucChannel4Type = BETWEEN_2067_AND_2204;
	movlw	(02h)
	movwf	(main@ucChannel4Type)
	goto	l737
	line	339
	
l4029:	
;main.c: 339: else if(getAdOriginaCh4Value() < 2340)
	fcall	_getAdOriginaCh4Value
	movlw	high(0924h)
	subwf	(1+(?_getAdOriginaCh4Value)),w
	movlw	low(0924h)
	skipnz
	subwf	(0+(?_getAdOriginaCh4Value)),w
	skipnc
	goto	u1131
	goto	u1130
u1131:
	goto	l4033
u1130:
	line	340
	
l4031:	
;main.c: 340: ucChannel4Type = BETWEEN_2204_AND_2340;
	movlw	(03h)
	movwf	(main@ucChannel4Type)
	goto	l737
	line	342
	
l4033:	
;main.c: 341: else
;main.c: 342: ucChannel4Type = MORE_THAN_2340;
	movlw	(04h)
	movwf	(main@ucChannel4Type)
	
l737:	
	line	344
;main.c: 344: ucADC4_Step = ADC4_STEP_SECOND;
	movlw	(02h)
	movwf	(main@ucADC4_Step)
	line	345
;main.c: 345: break;
	goto	l3947
	line	360
;main.c: 359: {
;main.c: 360: case 0:
	
l752:	
	line	362
;main.c: 361: {
;main.c: 362: PB0 = 1;
	bsf	(48/8),(48)&7
	line	363
	
l4035:	
;main.c: 363: ucLoaderStep++;
	incf	(main@ucLoaderStep),f
	line	364
;main.c: 364: break;
	goto	l3947
	line	369
	
l4037:	
;main.c: 368: {
;main.c: 369: if(ucTimerDelay >= 5)
	movlw	(05h)
	subwf	(main@ucTimerDelay),w
	skipc
	goto	u1141
	goto	u1140
u1141:
	goto	l4045
u1140:
	line	371
	
l4039:	
;main.c: 370: {
;main.c: 371: PA0 = 1;
	bsf	(40/8),(40)&7
	line	372
	
l4041:	
;main.c: 372: ucTimerDelay = 0;
	clrf	(main@ucTimerDelay)
	goto	l4035
	line	376
	
l4045:	
;main.c: 375: else
;main.c: 376: ucTimerDelay++;
	incf	(main@ucTimerDelay),f
	goto	l3947
	line	382
	
l4047:	
;main.c: 381: {
;main.c: 382: if(ucTimerDelay >= 5)
	movlw	(05h)
	subwf	(main@ucTimerDelay),w
	skipc
	goto	u1151
	goto	u1150
u1151:
	goto	l4045
u1150:
	line	384
	
l4049:	
;main.c: 383: {
;main.c: 384: PA1= 1;
	bsf	(41/8),(41)&7
	goto	l4041
	line	396
	
l4057:	
;main.c: 395: {
;main.c: 396: if(ucTimerDelay >= 5)
	movlw	(05h)
	subwf	(main@ucTimerDelay),w
	skipc
	goto	u1161
	goto	u1160
u1161:
	goto	l4045
u1160:
	line	398
	
l4059:	
;main.c: 397: {
;main.c: 398: PA2= 1;
	bsf	(42/8),(42)&7
	goto	l4041
	line	409
	
l4067:	
;main.c: 408: {
;main.c: 409: if(ucTimerDelay >= 5)
	movlw	(05h)
	subwf	(main@ucTimerDelay),w
	skipc
	goto	u1171
	goto	u1170
u1171:
	goto	l4045
u1170:
	line	411
	
l4069:	
;main.c: 410: {
;main.c: 411: PA3 = 1;
	bsf	(43/8),(43)&7
	goto	l4041
	line	422
	
l4077:	
;main.c: 421: {
;main.c: 422: if(ucTimerDelay >= 5)
	movlw	(05h)
	subwf	(main@ucTimerDelay),w
	skipc
	goto	u1181
	goto	u1180
u1181:
	goto	l4045
u1180:
	line	424
	
l4079:	
;main.c: 423: {
;main.c: 424: PB0 = 0;
	bcf	(48/8),(48)&7
	line	425
;main.c: 425: PA0 = 0;
	bcf	(40/8),(40)&7
	line	426
;main.c: 426: PA1 = 0;
	bcf	(41/8),(41)&7
	line	427
;main.c: 427: PA2 = 0;
	bcf	(42/8),(42)&7
	line	428
;main.c: 428: PA3 = 0;
	bcf	(43/8),(43)&7
	goto	l4041
	line	439
	
l4087:	
;main.c: 438: {
;main.c: 439: if(ucTimerDelay >= 2)
	movlw	(02h)
	subwf	(main@ucTimerDelay),w
	skipc
	goto	u1191
	goto	u1190
u1191:
	goto	l4045
u1190:
	line	441
	
l4089:	
;main.c: 440: {
;main.c: 441: ucTimerDelay = 0;
	clrf	(main@ucTimerDelay)
	line	443
;main.c: 443: ucLoaderStep = 0;
	clrf	(main@ucLoaderStep)
	line	444
	
l4091:	
;main.c: 444: ucADC4_Step = ADC4_STEP_THIRD;
	movlw	(03h)
	movwf	(main@ucADC4_Step)
	line	445
;main.c: 445: }
	goto	l3947
	line	358
	
l4097:	
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
goto l703
movlw high(S4661)
movwf pclath
	clrc
	rlf fsr,w
	addlw low(S4661)
	movwf pc
psect	swtext1,local,class=CONST,delta=2
global __pswtext1
__pswtext1:
S4661:
	ljmp	l752
	ljmp	l4037
	ljmp	l4047
	ljmp	l4057
	ljmp	l4067
	ljmp	l4077
	ljmp	l4087
psect	maintext

	line	465
;main.c: 464: {
;main.c: 465: case 0:
	
l780:	
	line	467
;main.c: 466: {
;main.c: 467: PB0 = 1;
	bsf	(48/8),(48)&7
	line	468
	
l4099:	
;main.c: 468: ucLoaderStep1++;
	incf	(main@ucLoaderStep1),f
	line	469
;main.c: 469: break;
	goto	l3947
	line	474
	
l4101:	
;main.c: 473: {
;main.c: 474: if(ucTimerDelay1 >= 5)
	movlw	(05h)
	subwf	(main@ucTimerDelay1),w
	skipc
	goto	u1201
	goto	u1200
u1201:
	goto	l4109
u1200:
	line	476
	
l4103:	
;main.c: 475: {
;main.c: 476: PA0 = 1;
	bsf	(40/8),(40)&7
	line	477
	
l4105:	
;main.c: 477: ucTimerDelay1 = 0;
	clrf	(main@ucTimerDelay1)
	goto	l4099
	line	481
	
l4109:	
;main.c: 480: else
;main.c: 481: ucTimerDelay1++;
	incf	(main@ucTimerDelay1),f
	goto	l3947
	line	487
	
l4111:	
;main.c: 486: {
;main.c: 487: if(ucTimerDelay1 >= 5)
	movlw	(05h)
	subwf	(main@ucTimerDelay1),w
	skipc
	goto	u1211
	goto	u1210
u1211:
	goto	l4109
u1210:
	line	489
	
l4113:	
;main.c: 488: {
;main.c: 489: PA1= 1;
	bsf	(41/8),(41)&7
	goto	l4105
	line	500
	
l4121:	
;main.c: 499: {
;main.c: 500: if(ucTimerDelay1 >= 5)
	movlw	(05h)
	subwf	(main@ucTimerDelay1),w
	skipc
	goto	u1221
	goto	u1220
u1221:
	goto	l4109
u1220:
	line	502
	
l4123:	
;main.c: 501: {
;main.c: 502: PA2 = 1;
	bsf	(42/8),(42)&7
	goto	l4105
	line	513
	
l4131:	
;main.c: 512: {
;main.c: 513: if(ucTimerDelay1 >= 5)
	movlw	(05h)
	subwf	(main@ucTimerDelay1),w
	skipc
	goto	u1231
	goto	u1230
u1231:
	goto	l4109
u1230:
	line	515
	
l4133:	
;main.c: 514: {
;main.c: 515: PA3 = 1;
	bsf	(43/8),(43)&7
	goto	l4105
	line	526
	
l4141:	
;main.c: 525: {
;main.c: 526: if(ucTimerDelay1 >= 5)
	movlw	(05h)
	subwf	(main@ucTimerDelay1),w
	skipc
	goto	u1241
	goto	u1240
u1241:
	goto	l4109
u1240:
	line	528
	
l4143:	
;main.c: 527: {
;main.c: 528: PA0 = 0;
	bcf	(40/8),(40)&7
	line	529
;main.c: 529: PA1 = 0;
	bcf	(41/8),(41)&7
	line	530
;main.c: 530: PA2 = 0;
	bcf	(42/8),(42)&7
	line	531
;main.c: 531: PA3 = 0;
	bcf	(43/8),(43)&7
	goto	l4105
	line	542
	
l4151:	
;main.c: 541: {
;main.c: 542: if(ucTimerDelay1 >= 2)
	movlw	(02h)
	subwf	(main@ucTimerDelay1),w
	skipc
	goto	u1251
	goto	u1250
u1251:
	goto	l4109
u1250:
	line	544
	
l4153:	
;main.c: 543: {
;main.c: 544: ucTimerDelay1 = 0;
	clrf	(main@ucTimerDelay1)
	line	546
;main.c: 546: ucLoaderStep1 = 0;
	clrf	(main@ucLoaderStep1)
	goto	l4091
	line	463
	
l4161:	
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
goto l703
movlw high(S4663)
movwf pclath
	clrc
	rlf fsr,w
	addlw low(S4663)
	movwf pc
psect	swtext2,local,class=CONST,delta=2
global __pswtext2
__pswtext2:
S4663:
	ljmp	l780
	ljmp	l4101
	ljmp	l4111
	ljmp	l4121
	ljmp	l4131
	ljmp	l4141
	ljmp	l4151
psect	maintext

	line	569
;main.c: 568: {
;main.c: 569: case 0:
	
l807:	
	line	571
;main.c: 570: {
;main.c: 571: PB0 = 1;
	bsf	(48/8),(48)&7
	line	572
;main.c: 572: PA0 = 1;
	bsf	(40/8),(40)&7
	line	573
	
l4163:	
;main.c: 573: ucLoaderStep2++;
	incf	(main@ucLoaderStep2),f
	line	574
;main.c: 574: break;
	goto	l3947
	line	579
	
l4165:	
;main.c: 578: {
;main.c: 579: if(ucTimerDelay2 >= 5)
	movlw	(05h)
	subwf	(main@ucTimerDelay2),w
	skipc
	goto	u1261
	goto	u1260
u1261:
	goto	l4173
u1260:
	line	581
	
l4167:	
;main.c: 580: {
;main.c: 581: PA1 = 1;
	bsf	(41/8),(41)&7
	line	582
	
l4169:	
;main.c: 582: ucTimerDelay2 = 0;
	clrf	(main@ucTimerDelay2)
	goto	l4163
	line	586
	
l4173:	
;main.c: 585: else
;main.c: 586: ucTimerDelay2++;
	incf	(main@ucTimerDelay2),f
	goto	l3947
	line	592
	
l4175:	
;main.c: 591: {
;main.c: 592: if(ucTimerDelay2 >= 5)
	movlw	(05h)
	subwf	(main@ucTimerDelay2),w
	skipc
	goto	u1271
	goto	u1270
u1271:
	goto	l4173
u1270:
	line	594
	
l4177:	
;main.c: 593: {
;main.c: 594: PA2 = 1;
	bsf	(42/8),(42)&7
	goto	l4169
	line	605
	
l4185:	
;main.c: 604: {
;main.c: 605: if(ucTimerDelay2 >= 5)
	movlw	(05h)
	subwf	(main@ucTimerDelay2),w
	skipc
	goto	u1281
	goto	u1280
u1281:
	goto	l4173
u1280:
	line	607
	
l4187:	
;main.c: 606: {
;main.c: 607: PA3 = 1;
	bsf	(43/8),(43)&7
	goto	l4169
	line	618
	
l4195:	
;main.c: 617: {
;main.c: 618: if(ucTimerDelay2 >= 5)
	movlw	(05h)
	subwf	(main@ucTimerDelay2),w
	skipc
	goto	u1291
	goto	u1290
u1291:
	goto	l4173
u1290:
	line	621
	
l4197:	
;main.c: 619: {
;main.c: 621: PA1 = 0;
	bcf	(41/8),(41)&7
	line	622
;main.c: 622: PA2 = 0;
	bcf	(42/8),(42)&7
	line	623
;main.c: 623: PA3 = 0;
	bcf	(43/8),(43)&7
	goto	l4169
	line	634
	
l4205:	
;main.c: 633: {
;main.c: 634: if(ucTimerDelay2 >= 2)
	movlw	(02h)
	subwf	(main@ucTimerDelay2),w
	skipc
	goto	u1301
	goto	u1300
u1301:
	goto	l4173
u1300:
	line	636
	
l4207:	
;main.c: 635: {
;main.c: 636: ucTimerDelay2 = 0;
	clrf	(main@ucTimerDelay2)
	line	638
;main.c: 638: ucLoaderStep2 = 0;
	clrf	(main@ucLoaderStep2)
	goto	l4091
	line	567
	
l4215:	
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
goto l703
movlw high(S4665)
movwf pclath
	clrc
	rlf fsr,w
	addlw low(S4665)
	movwf pc
psect	swtext3,local,class=CONST,delta=2
global __pswtext3
__pswtext3:
S4665:
	ljmp	l807
	ljmp	l4165
	ljmp	l4175
	ljmp	l4185
	ljmp	l4195
	ljmp	l4205
psect	maintext

	line	661
;main.c: 660: {
;main.c: 661: case 0:
	
l831:	
	line	663
;main.c: 662: {
;main.c: 663: PB0 = 1;
	bsf	(48/8),(48)&7
	line	664
;main.c: 664: PA0 = 1;
	bsf	(40/8),(40)&7
	line	665
;main.c: 665: PA1 = 1;
	bsf	(41/8),(41)&7
	line	666
	
l4217:	
;main.c: 666: ucLoaderStep3++;
	incf	(main@ucLoaderStep3),f
	line	667
;main.c: 667: break;
	goto	l3947
	line	672
	
l4219:	
;main.c: 671: {
;main.c: 672: if(ucTimerDelay3 >= 5)
	movlw	(05h)
	subwf	(main@ucTimerDelay3),w
	skipc
	goto	u1311
	goto	u1310
u1311:
	goto	l4227
u1310:
	line	674
	
l4221:	
;main.c: 673: {
;main.c: 674: PA2 = 1;
	bsf	(42/8),(42)&7
	line	675
	
l4223:	
;main.c: 675: ucTimerDelay3 = 0;
	clrf	(main@ucTimerDelay3)
	goto	l4217
	line	679
	
l4227:	
;main.c: 678: else
;main.c: 679: ucTimerDelay3++;
	incf	(main@ucTimerDelay3),f
	goto	l3947
	line	685
	
l4229:	
;main.c: 684: {
;main.c: 685: if(ucTimerDelay3 >= 5)
	movlw	(05h)
	subwf	(main@ucTimerDelay3),w
	skipc
	goto	u1321
	goto	u1320
u1321:
	goto	l4227
u1320:
	line	687
	
l4231:	
;main.c: 686: {
;main.c: 687: PA3 = 1;
	bsf	(43/8),(43)&7
	goto	l4223
	line	699
	
l4239:	
;main.c: 698: {
;main.c: 699: if(ucTimerDelay3 >= 5)
	movlw	(05h)
	subwf	(main@ucTimerDelay3),w
	skipc
	goto	u1331
	goto	u1330
u1331:
	goto	l4227
u1330:
	line	702
	
l4241:	
;main.c: 700: {
;main.c: 702: PA2 = 0;
	bcf	(42/8),(42)&7
	line	703
;main.c: 703: PA3 = 0;
	bcf	(43/8),(43)&7
	goto	l4223
	line	714
	
l4249:	
;main.c: 713: {
;main.c: 714: if(ucTimerDelay3 >= 2)
	movlw	(02h)
	subwf	(main@ucTimerDelay3),w
	skipc
	goto	u1341
	goto	u1340
u1341:
	goto	l4227
u1340:
	line	716
	
l4251:	
;main.c: 715: {
;main.c: 716: ucTimerDelay3 = 0;
	clrf	(main@ucTimerDelay3)
	line	718
;main.c: 718: ucLoaderStep3 = 0;
	clrf	(main@ucLoaderStep3)
	goto	l4091
	line	659
	
l4259:	
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
	goto	l831
	xorlw	1^0	; case 1
	skipnz
	goto	l4219
	xorlw	2^1	; case 2
	skipnz
	goto	l4229
	xorlw	3^2	; case 3
	skipnz
	goto	l4239
	xorlw	4^3	; case 4
	skipnz
	goto	l4249
	goto	l703
	opt asmopt_on

	line	741
;main.c: 740: {
;main.c: 741: case 0:
	
l852:	
	line	743
;main.c: 742: {
;main.c: 743: PB0 = 1;
	bsf	(48/8),(48)&7
	line	744
;main.c: 744: PA0 = 1;
	bsf	(40/8),(40)&7
	line	745
;main.c: 745: PA1 = 1;
	bsf	(41/8),(41)&7
	line	746
;main.c: 746: PA2 = 1;
	bsf	(42/8),(42)&7
	line	747
	
l4261:	
;main.c: 747: ucLoaderStep4++;
	incf	(main@ucLoaderStep4),f
	line	748
;main.c: 748: break;
	goto	l3947
	line	753
	
l4263:	
;main.c: 752: {
;main.c: 753: if(ucTimerDelay4 >= 5)
	movlw	(05h)
	subwf	(main@ucTimerDelay4),w
	skipc
	goto	u1351
	goto	u1350
u1351:
	goto	l4271
u1350:
	line	755
	
l4265:	
;main.c: 754: {
;main.c: 755: PA3 = 1;
	bsf	(43/8),(43)&7
	line	756
	
l4267:	
;main.c: 756: ucTimerDelay4 = 0;
	clrf	(main@ucTimerDelay4)
	goto	l4261
	line	760
	
l4271:	
;main.c: 759: else
;main.c: 760: ucTimerDelay4++;
	incf	(main@ucTimerDelay4),f
	goto	l3947
	line	766
	
l4273:	
;main.c: 765: {
;main.c: 766: if(ucTimerDelay4 >= 5)
	movlw	(05h)
	subwf	(main@ucTimerDelay4),w
	skipc
	goto	u1361
	goto	u1360
u1361:
	goto	l4271
u1360:
	line	768
	
l4275:	
;main.c: 767: {
;main.c: 768: PA3 = 0;
	bcf	(43/8),(43)&7
	goto	l4267
	line	779
	
l4283:	
;main.c: 778: {
;main.c: 779: if(ucTimerDelay4 >= 2)
	movlw	(02h)
	subwf	(main@ucTimerDelay4),w
	skipc
	goto	u1371
	goto	u1370
u1371:
	goto	l4271
u1370:
	line	781
	
l4285:	
;main.c: 780: {
;main.c: 781: ucTimerDelay4 = 0;
	clrf	(main@ucTimerDelay4)
	line	783
;main.c: 783: ucLoaderStep4 = 0;
	clrf	(main@ucLoaderStep4)
	goto	l4091
	line	739
	
l4293:	
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
	goto	l852
	xorlw	1^0	; case 1
	skipnz
	goto	l4263
	xorlw	2^1	; case 2
	skipnz
	goto	l4273
	xorlw	3^2	; case 3
	skipnz
	goto	l4283
	goto	l703
	opt asmopt_on

	line	350
	
l4297:	
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
	goto	l4097
	xorlw	1^0	; case 1
	skipnz
	goto	l4161
	xorlw	2^1	; case 2
	skipnz
	goto	l4215
	xorlw	3^2	; case 3
	skipnz
	goto	l4259
	xorlw	4^3	; case 4
	skipnz
	goto	l4293
	goto	l703
	opt asmopt_on

	line	808
	
l4299:	
;main.c: 807: {
;main.c: 808: if(isFinishedTwentySecondsTimer())
	fcall	_isFinishedTwentySecondsTimer
	xorlw	0
	skipnz
	goto	u1381
	goto	u1380
u1381:
	goto	l4015
u1380:
	line	810
	
l4301:	
;main.c: 809: {
;main.c: 810: PBOD6 =0;
	bsf	status, 5	;RP0=1, select bank3
	bsf	status, 6	;RP1=1, select bank3
	bcf	(3142/8)^0180h,(3142)&7
	line	811
;main.c: 811: PB6 = 1;
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	bsf	(54/8),(54)&7
	line	812
;main.c: 812: PA6 = 0;
	bcf	(46/8),(46)&7
	line	819
	
l4303:	
;main.c: 819: if((getAdOriginalCh14Value() > 3900))
	fcall	_getAdOriginalCh14Value
	movlw	high(0F3Dh)
	subwf	(1+(?_getAdOriginalCh14Value)),w
	movlw	low(0F3Dh)
	skipnz
	subwf	(0+(?_getAdOriginalCh14Value)),w
	skipc
	goto	u1391
	goto	u1390
u1391:
	goto	l4307
u1390:
	line	820
	
l4305:	
;main.c: 820: DACR0=0x0F;
	movlw	(0Fh)
	bsf	status, 5	;RP0=1, select bank1
	movwf	(136)^080h	;volatile
	goto	l868
	line	822
	
l4307:	
;main.c: 821: else
;main.c: 822: DACR0=0x07;
	movlw	(07h)
	bsf	status, 5	;RP0=1, select bank1
	movwf	(136)^080h	;volatile
	
l868:	
	line	824
;main.c: 824: ucADC4_Step = ADC4_STEP_FOURTH;
	movlw	(04h)
	bcf	status, 5	;RP0=0, select bank0
	movwf	(main@ucADC4_Step)
	line	825
;main.c: 825: }
	goto	l3947
	line	835
	
l4309:	
;main.c: 833: {
;main.c: 834: static unsigned char ucTimer1s = 0;
;main.c: 835: if(ucTimer1s < 10)
	movlw	(0Ah)
	subwf	(main@ucTimer1s),w
	skipnc
	goto	u1401
	goto	u1400
u1401:
	goto	l4315
u1400:
	line	837
	
l4311:	
;main.c: 836: {
;main.c: 837: ucTimer1s++;
	incf	(main@ucTimer1s),f
	line	838
	
l4313:	
;main.c: 838: PB6 = 1;
	bsf	(54/8),(54)&7
	line	839
;main.c: 839: }
	goto	l3947
	line	842
	
l4315:	
;main.c: 840: else
;main.c: 841: {
;main.c: 842: ucTimer1s = 0;
	clrf	(main@ucTimer1s)
	line	843
	
l4317:	
;main.c: 843: PBOD6 = 1;
	bsf	status, 5	;RP0=1, select bank3
	bsf	status, 6	;RP1=1, select bank3
	bsf	(3142/8)^0180h,(3142)&7
	line	844
	
l4319:	
;main.c: 844: enumMainLoopStep = MAIN_LOOP_STEP_FIRST;
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	clrf	(main@enumMainLoopStep)
	incf	(main@enumMainLoopStep),f
	line	845
;main.c: 845: ucADC4_Step = ADC4_STEP_INIT;
	clrf	(main@ucADC4_Step)
	goto	l3947
	line	322
	
l4323:	
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
	goto	l4013
	xorlw	1^0	; case 1
	skipnz
	goto	l4017
	xorlw	2^1	; case 2
	skipnz
	goto	l4297
	xorlw	3^2	; case 3
	skipnz
	goto	l4299
	xorlw	4^3	; case 4
	skipnz
	goto	l4309
	goto	l703
	opt asmopt_on

	line	872
;main.c: 871: {
;main.c: 872: case HOUR_3_BRANCH_STEP_FIRST:
	
l880:	
	line	874
;main.c: 873: {
;main.c: 874: PAOD7 = 1;
	bsf	status, 5	;RP0=1, select bank3
	bsf	status, 6	;RP1=1, select bank3
	bsf	(3135/8)^0180h,(3135)&7
	line	875
	
l4325:	
;main.c: 875: startThreeHoursTimer();
	fcall	_startThreeHoursTimer
	line	877
	
l4327:	
;main.c: 877: enumBranchStep = HOUR_3_BRANCH_STEP_SECOND;
	clrf	(main@enumBranchStep)
	incf	(main@enumBranchStep),f
	line	878
;main.c: 878: break;
	goto	l3947
	line	885
	
l4329:	
;main.c: 882: {
;main.c: 883: static unsigned char ucTimer20s = 0;
;main.c: 885: if(ucTimer20s < 20)
	movlw	(014h)
	subwf	(main@ucTimer20s),w
	skipnc
	goto	u1411
	goto	u1410
u1411:
	goto	l4333
u1410:
	line	886
	
l4331:	
;main.c: 886: ucTimer20s++;
	incf	(main@ucTimer20s),f
	goto	l4349
	line	889
	
l4333:	
;main.c: 887: else
;main.c: 888: {
;main.c: 889: ucTimer20s = 0;
	clrf	(main@ucTimer20s)
	line	890
	
l4335:	
;main.c: 890: PB0 = 1;
	bsf	(48/8),(48)&7
	line	891
	
l4337:	
;main.c: 891: PA0 = 1;
	bsf	(40/8),(40)&7
	line	892
	
l4339:	
;main.c: 892: PA1 = 1;
	bsf	(41/8),(41)&7
	line	893
	
l4341:	
;main.c: 893: PA2 = 1;
	bsf	(42/8),(42)&7
	line	894
	
l4343:	
;main.c: 894: PA3 = 1;
	bsf	(43/8),(43)&7
	line	895
	
l4345:	
;main.c: 895: PA6 = 0;
	bcf	(46/8),(46)&7
	line	897
	
l4347:	
;main.c: 897: enumBranchStep = HOUR_3_BRANCH_STEP_THIRD;
	movlw	(02h)
	movwf	(main@enumBranchStep)
	line	903
	
l4349:	
;main.c: 902: {
;main.c: 903: if(isFinishedThreeHoursTimer())
	fcall	_isFinishedThreeHoursTimer
	xorlw	0
	skipnz
	goto	u1421
	goto	u1420
u1421:
	goto	l4355
u1420:
	line	905
	
l4351:	
;main.c: 904: {
;main.c: 905: enumBranchStep = HOUR_3_BRANCH_STEP_FIRST;
	clrf	(main@enumBranchStep)
	goto	l4011
	line	912
	
l4355:	
;main.c: 908: else
;main.c: 909: {
;main.c: 910: static unsigned char ucTimerX1P5s = 0;
;main.c: 912: if(getAdOriginalCh1Value() < 0x0082)
	fcall	_getAdOriginalCh1Value
	movlw	high(082h)
	subwf	(1+(?_getAdOriginalCh1Value)),w
	movlw	low(082h)
	skipnz
	subwf	(0+(?_getAdOriginalCh1Value)),w
	skipnc
	goto	u1431
	goto	u1430
u1431:
	goto	l4359
u1430:
	line	914
	
l4357:	
;main.c: 913: {
;main.c: 914: ucTimerX1P5s = 0;
	clrf	(main@ucTimerX1P5s)
	line	915
;main.c: 915: }
	goto	l4361
	line	918
	
l4359:	
;main.c: 916: else
;main.c: 917: {
;main.c: 918: ucTimerX1P5s++;
	incf	(main@ucTimerX1P5s),f
	line	921
	
l4361:	
;main.c: 919: }
;main.c: 921: if(ucTimerX1P5s >= 1)
	movf	(main@ucTimerX1P5s),w
	skipz
	goto	u1440
	goto	l4373
u1440:
	line	923
	
l4363:	
;main.c: 922: {
;main.c: 923: ucTimerX1P5s = 0;
	clrf	(main@ucTimerX1P5s)
	line	924
	
l4365:	
;main.c: 924: PA7 = 0;
	bcf	(47/8),(47)&7
	line	925
	
l4367:	
;main.c: 925: clearThreeHoursTimer();
	fcall	_clearThreeHoursTimer
	line	927
	
l4369:	
;main.c: 927: enumBranchStep = HOUR_3_BRANCH_STEP_FIRST;
	clrf	(main@enumBranchStep)
	goto	l3975
	line	935
	
l4373:	
;main.c: 931: else
;main.c: 932: {
;main.c: 933: static unsigned char ucTimerX2P5s = 0;
;main.c: 935: if(getAdOriginalCh14Value() >= 1950)
	fcall	_getAdOriginalCh14Value
	movlw	high(079Eh)
	subwf	(1+(?_getAdOriginalCh14Value)),w
	movlw	low(079Eh)
	skipnz
	subwf	(0+(?_getAdOriginalCh14Value)),w
	skipc
	goto	u1451
	goto	u1450
u1451:
	goto	l4377
u1450:
	line	937
	
l4375:	
;main.c: 936: {
;main.c: 937: ucTimerX2P5s++;
	incf	(main@ucTimerX2P5s),f
	line	938
;main.c: 938: }
	goto	l4379
	line	941
	
l4377:	
;main.c: 939: else
;main.c: 940: {
;main.c: 941: ucTimerX2P5s = 0;
	clrf	(main@ucTimerX2P5s)
	line	944
	
l4379:	
;main.c: 942: }
;main.c: 944: if(ucTimerX2P5s >= 1)
	movf	(main@ucTimerX2P5s),w
	skipz
	goto	u1460
	goto	l4383
u1460:
	line	946
	
l4381:	
;main.c: 945: {
;main.c: 946: ucTimerX2P5s = 0;
	clrf	(main@ucTimerX2P5s)
	line	947
;main.c: 947: }
	goto	l3947
	line	950
	
l4383:	
;main.c: 948: else
;main.c: 949: {
;main.c: 950: clearPinPortAndTimer();
	fcall	_clearPinPortAndTimer
	goto	l3965
	line	870
	
l4389:	
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
	goto	l880
	xorlw	1^0	; case 1
	skipnz
	goto	l4329
	xorlw	2^1	; case 2
	skipnz
	goto	l4349
	goto	l703
	opt asmopt_on

	line	981
;main.c: 980: {
;main.c: 981: case INTERNAL_FIRST_STEP:
	
l907:	
	line	983
;main.c: 982: {
;main.c: 983: PB0 = 0;
	bcf	(48/8),(48)&7
	line	984
;main.c: 984: PB1 = 0;
	bcf	(49/8),(49)&7
	line	985
;main.c: 985: PA0 = 0;
	bcf	(40/8),(40)&7
	line	986
;main.c: 986: PA1 = 0;
	bcf	(41/8),(41)&7
	line	987
;main.c: 987: PA2 = 0;
	bcf	(42/8),(42)&7
	line	988
;main.c: 988: PA3 = 0;
	bcf	(43/8),(43)&7
	line	989
;main.c: 989: PB6 = 1;
	bsf	(54/8),(54)&7
	line	990
;main.c: 990: PA6 =0;
	bcf	(46/8),(46)&7
	line	992
;main.c: 992: enumInteralStep = INTERNAL_SECOND_STEP;
	clrf	(main@enumInteralStep)
	incf	(main@enumInteralStep),f
	line	993
;main.c: 993: break;
	goto	l3947
	line	1000
	
l4391:	
;main.c: 997: {
;main.c: 998: static unsigned char ucTimer1s = 0;
;main.c: 1000: if(getAdOriginalCh14Value() <= 1000)
	fcall	_getAdOriginalCh14Value
	movlw	high(03E9h)
	subwf	(1+(?_getAdOriginalCh14Value)),w
	movlw	low(03E9h)
	skipnz
	subwf	(0+(?_getAdOriginalCh14Value)),w
	skipnc
	goto	u1471
	goto	u1470
u1471:
	goto	l4395
u1470:
	line	1002
	
l4393:	
;main.c: 1001: {
;main.c: 1002: ucTimer1s++;
	incf	(main@cTimer1s_806),f
	line	1003
;main.c: 1003: }
	goto	l4397
	line	1005
	
l4395:	
;main.c: 1004: else
;main.c: 1005: ucTimer1s = 0;
	clrf	(main@cTimer1s_806)
	line	1007
	
l4397:	
;main.c: 1007: if(ucTimer1s >= 10)
	movlw	(0Ah)
	subwf	(main@cTimer1s_806),w
	skipc
	goto	u1481
	goto	u1480
u1481:
	goto	l703
u1480:
	line	1009
	
l4399:	
;main.c: 1008: {
;main.c: 1009: enumInteralStep = INTERNAL_THIRD_STEP;
	movlw	(02h)
	movwf	(main@enumInteralStep)
	line	1010
	
l4401:	
;main.c: 1010: ucTimer1s = 0;
	clrf	(main@cTimer1s_806)
	goto	l3947
	line	1019
	
l4403:	
;main.c: 1016: {
;main.c: 1017: static unsigned char ucTimerP3s = 0;
;main.c: 1019: if(getAdOriginalCh14Value() >= 1950)
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
	goto	l4407
u1490:
	line	1021
	
l4405:	
;main.c: 1020: {
;main.c: 1021: ucTimerP3s++;
	incf	(main@ucTimerP3s),f
	line	1022
;main.c: 1022: }
	goto	l4409
	line	1024
	
l4407:	
;main.c: 1023: else
;main.c: 1024: ucTimerP3s = 0;
	clrf	(main@ucTimerP3s)
	line	1026
	
l4409:	
;main.c: 1026: if(ucTimerP3s >= 3)
	movlw	(03h)
	subwf	(main@ucTimerP3s),w
	skipc
	goto	u1501
	goto	u1500
u1501:
	goto	l703
u1500:
	line	1028
	
l4411:	
;main.c: 1027: {
;main.c: 1028: enumInteralStep = INTERNAL_FIRST_STEP;
	clrf	(main@enumInteralStep)
	line	1029
;main.c: 1029: ucTimerP3s = 0;
	clrf	(main@ucTimerP3s)
	line	1030
	
l4413:	
;main.c: 1030: clearAllTimer();
	fcall	_clearAllTimer
	line	1032
	
l4415:	
;main.c: 1032: DACR0=0x0F;
	movlw	(0Fh)
	bsf	status, 5	;RP0=1, select bank1
	movwf	(136)^080h	;volatile
	line	1033
	
l4417:	
;main.c: 1033: PBOD6 = 1;
	bsf	status, 6	;RP1=1, select bank3
	bsf	(3142/8)^0180h,(3142)&7
	line	1035
	
l4419:	
;main.c: 1035: PA0 = 0;
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	bcf	(40/8),(40)&7
	line	1036
	
l4421:	
;main.c: 1036: PA1 = 0;
	bcf	(41/8),(41)&7
	line	1037
	
l4423:	
;main.c: 1037: PA2 = 0;
	bcf	(42/8),(42)&7
	line	1038
	
l4425:	
;main.c: 1038: PA3 = 1;
	bsf	(43/8),(43)&7
	line	1039
	
l4427:	
;main.c: 1039: PB0 = 0;
	bcf	(48/8),(48)&7
	line	1040
	
l4429:	
;main.c: 1040: PB1 = 0;
	bcf	(49/8),(49)&7
	line	1041
	
l4431:	
;main.c: 1041: PA6 = 0;
	bcf	(46/8),(46)&7
	line	1042
	
l4433:	
;main.c: 1042: PA7 = 0;
	bcf	(47/8),(47)&7
	line	1045
	
l4435:	
;main.c: 1045: enumMainLoopStep = MAIN_LOOP_STEP_INIT;
	clrf	(main@enumMainLoopStep)
	goto	l3947
	line	979
	
l4439:	
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
	goto	l907
	xorlw	1^0	; case 1
	skipnz
	goto	l4391
	xorlw	2^1	; case 2
	skipnz
	goto	l4403
	goto	l703
	opt asmopt_on

	line	202
	
l4443:	
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
	goto	l3955
	xorlw	1^0	; case 1
	skipnz
	goto	l3967
	xorlw	2^1	; case 2
	skipnz
	goto	l712
	xorlw	3^2	; case 3
	skipnz
	goto	l3981
	xorlw	4^3	; case 4
	skipnz
	goto	l4005
	xorlw	5^4	; case 5
	skipnz
	goto	l4009
	xorlw	8^5	; case 8
	skipnz
	goto	l4389
	xorlw	9^8	; case 9
	skipnz
	goto	l4439
	goto	l703
	opt asmopt_on

	global	start
	ljmp	start
	opt stack 0
psect	maintext
	line	1066
GLOBAL	__end_of_main
	__end_of_main:
;; =============== function _main ends ============

	signat	_main,88
	global	_process_AD_Converter_Value
psect	text583,local,class=CODE,delta=2
global __ptext583
__ptext583:

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
psect	text583
	file	"C:\190604\AK7030-OTP\common.c"
	line	102
	global	__size_of_process_AD_Converter_Value
	__size_of_process_AD_Converter_Value	equ	__end_of_process_AD_Converter_Value-_process_AD_Converter_Value
	
_process_AD_Converter_Value:	
	opt	stack 3
; Regs used in _process_AD_Converter_Value: [wreg-fsr0h+status,2+status,0+pclath+cstack]
	line	103
	
l3913:	
;common.c: 103: if(getAD_ConvertFlag())
	fcall	_getAD_ConvertFlag
	xorlw	0
	skipnz
	goto	u971
	goto	u970
u971:
	goto	l1635
u970:
	line	105
	
l3915:	
;common.c: 104: {
;common.c: 105: setAD_ConvertFlag(0);
	movlw	(0)
	fcall	_setAD_ConvertFlag
	line	106
	
l3917:	
;common.c: 106: AD_Sample();
	fcall	_AD_Sample
	line	107
	
l3919:	
;common.c: 107: if(4 == sampleChannelSelect)
	movf	(_sampleChannelSelect),w
	xorlw	04h
	skipz
	goto	u981
	goto	u980
u981:
	goto	l3923
u980:
	line	108
	
l3921:	
;common.c: 108: adc_test_init(4,3);
	movlw	(03h)
	movwf	(?_adc_test_init)
	movlw	(04h)
	fcall	_adc_test_init
	goto	l3929
	line	109
	
l3923:	
;common.c: 109: else if(1 == sampleChannelSelect)
	decf	(_sampleChannelSelect),w
	skipz
	goto	u991
	goto	u990
u991:
	goto	l3927
u990:
	line	110
	
l3925:	
;common.c: 110: adc_test_init(1,3);
	movlw	(03h)
	movwf	(?_adc_test_init)
	movlw	(01h)
	fcall	_adc_test_init
	goto	l3929
	line	112
	
l3927:	
;common.c: 111: else
;common.c: 112: adc_test_init(14,3);
	movlw	(03h)
	movwf	(?_adc_test_init)
	movlw	(0Eh)
	fcall	_adc_test_init
	line	114
	
l3929:	
;common.c: 114: adc_start();
	fcall	_adc_start
	line	116
	
l1635:	
	return
	opt stack 0
GLOBAL	__end_of_process_AD_Converter_Value
	__end_of_process_AD_Converter_Value:
;; =============== function _process_AD_Converter_Value ends ============

	signat	_process_AD_Converter_Value,88
	global	_clearPinPortAndTimer
psect	text584,local,class=CODE,delta=2
global __ptext584
__ptext584:

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
psect	text584
	file	"C:\190604\AK7030-OTP\main.c"
	line	92
	global	__size_of_clearPinPortAndTimer
	__size_of_clearPinPortAndTimer	equ	__end_of_clearPinPortAndTimer-_clearPinPortAndTimer
	
_clearPinPortAndTimer:	
	opt	stack 3
; Regs used in _clearPinPortAndTimer: [status,2+status,0+pclath+cstack]
	line	93
	
l3909:	
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
;main.c: 98: PA7 = 0;
	bcf	(47/8),(47)&7
	line	99
	
l3911:	
;main.c: 99: clearAllTimer();
	fcall	_clearAllTimer
	line	100
	
l680:	
	return
	opt stack 0
GLOBAL	__end_of_clearPinPortAndTimer
	__end_of_clearPinPortAndTimer:
;; =============== function _clearPinPortAndTimer ends ============

	signat	_clearPinPortAndTimer,88
	global	_AD_Sample
psect	text585,local,class=CODE,delta=2
global __ptext585
__ptext585:

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
psect	text585
	file	"C:\190604\AK7030-OTP\common.c"
	line	128
	global	__size_of_AD_Sample
	__size_of_AD_Sample	equ	__end_of_AD_Sample-_AD_Sample
	
_AD_Sample:	
	opt	stack 3
; Regs used in _AD_Sample: [wreg-fsr0h+status,2+status,0+pclath+cstack]
	line	129
	
l3863:	
;common.c: 129: if(sampleTimes < 6)
	movlw	(06h)
	subwf	(_sampleTimes),w
	skipnc
	goto	u891
	goto	u890
u891:
	goto	l1651
u890:
	line	132
	
l3865:	
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
	
l3867:	
;common.c: 134: if(sampleTimes == 0)
	movf	(_sampleTimes),f
	skipz
	goto	u901
	goto	u900
u901:
	goto	l3871
u900:
	line	136
	
l3869:	
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
	
l3871:	
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
	goto	u915
	movf	0+(??_AD_Sample+0)+0,w
	subwf	(_multiFilterMaxValue),w
u915:
	skipnc
	goto	u911
	goto	u910
u911:
	goto	l1640
u910:
	line	142
	
l3873:	
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
	
l1640:	
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
	goto	u925
	movf	(_multiFilterMinValue),w
	subwf	0+(??_AD_Sample+0)+0,w
u925:
	skipnc
	goto	u921
	goto	u920
u921:
	goto	l3877
u920:
	line	146
	
l3875:	
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
	
l3877:	
;common.c: 151: sampleTimes++;
	incf	(_sampleTimes),f
	line	153
	
l3879:	
;common.c: 153: if(sampleTimes >= 6)
	movlw	(06h)
	subwf	(_sampleTimes),w
	skipc
	goto	u931
	goto	u930
u931:
	goto	l1651
u930:
	line	155
	
l3881:	
;common.c: 154: {
;common.c: 155: sampleTimes = 0;
	clrf	(_sampleTimes)
	line	157
	
l3883:	
;common.c: 158: {
;common.c: 160: sampleCH14Value = ((multiFilterSumValue - multiFilterMaxValue - multiFilterMinValue))>> 2;
	movf	(_sampleChannelSelect),w
	xorlw	0Eh
	skipz
	goto	u941
	goto	u940
u941:
	goto	l3887
u940:
	line	161
	
l3885:	
;common.c: 161: sampleChannelSelect = 4;
	movlw	(04h)
	movwf	(_sampleChannelSelect)
	line	162
;common.c: 162: }
	goto	l3897
	line	163
	
l3887:	
;common.c: 164: {
;common.c: 165: sampleCH4Value = ((multiFilterSumValue - multiFilterMaxValue - multiFilterMinValue))>> 2;
	movf	(_sampleChannelSelect),w
	xorlw	04h
	skipz
	goto	u951
	goto	u950
u951:
	goto	l3891
u950:
	line	166
	
l3889:	
;common.c: 166: sampleChannelSelect = 1;
	clrf	(_sampleChannelSelect)
	incf	(_sampleChannelSelect),f
	line	167
;common.c: 167: }
	goto	l3897
	line	168
	
l3891:	
	line	171
	
l3893:	
;common.c: 171: sampleChannelSelect = 14;
	movlw	(0Eh)
	movwf	(_sampleChannelSelect)
	line	179
;common.c: 172: }
	
l3897:	
;common.c: 177: }
;common.c: 179: for(unsigned char index = 0; index < 6;index++)
	clrf	(AD_Sample@index)
	line	180
	
l3903:	
;common.c: 180: buffer_Sample_AD_Value[index] = 0;
	clrc
	rlf	(AD_Sample@index),w
	addlw	_buffer_Sample_AD_Value&0ffh
	movwf	fsr0
	clrf	indf
	incf	fsr0,f
	clrf	indf
	line	179
	
l3905:	
	incf	(AD_Sample@index),f
	
l3907:	
	movlw	(06h)
	subwf	(AD_Sample@index),w
	skipc
	goto	u961
	goto	u960
u961:
	goto	l3903
u960:
	line	184
	
l1651:	
	return
	opt stack 0
GLOBAL	__end_of_AD_Sample
	__end_of_AD_Sample:
;; =============== function _AD_Sample ends ============

	signat	_AD_Sample,88
	global	_clearAllTimer
psect	text586,local,class=CODE,delta=2
global __ptext586
__ptext586:

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
psect	text586
	file	"C:\190604\AK7030-OTP\main.c"
	line	83
	global	__size_of_clearAllTimer
	__size_of_clearAllTimer	equ	__end_of_clearAllTimer-_clearAllTimer
	
_clearAllTimer:	
	opt	stack 4
; Regs used in _clearAllTimer: [status,2+status,0+pclath+cstack]
	line	84
	
l3861:	
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
psect	text587,local,class=CODE,delta=2
global __ptext587
__ptext587:

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
psect	text587
	file	"C:\190604\AK7030-OTP\common.c"
	line	78
	global	__size_of_getAdOriginalValue
	__size_of_getAdOriginalValue	equ	__end_of_getAdOriginalValue-_getAdOriginalValue
	
_getAdOriginalValue:	
	opt	stack 3
; Regs used in _getAdOriginalValue: [wreg]
	line	79
	
l3815:	
;common.c: 79: return adc_original_value;
	movf	(_adc_original_value+1),w
	movwf	(?_getAdOriginalValue+1)
	movf	(_adc_original_value),w
	movwf	(?_getAdOriginalValue)
	line	80
	
l1618:	
	return
	opt stack 0
GLOBAL	__end_of_getAdOriginalValue
	__end_of_getAdOriginalValue:
;; =============== function _getAdOriginalValue ends ============

	signat	_getAdOriginalValue,90
	global	_setAD_ConvertFlag
psect	text588,local,class=CODE,delta=2
global __ptext588
__ptext588:

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
psect	text588
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
	
l3813:	
;common.c: 73: adc_convert_flag = flag;
	movf	(setAD_ConvertFlag@flag),w
	movwf	(_adc_convert_flag)
	line	74
	
l1615:	
	return
	opt stack 0
GLOBAL	__end_of_setAD_ConvertFlag
	__end_of_setAD_ConvertFlag:
;; =============== function _setAD_ConvertFlag ends ============

	signat	_setAD_ConvertFlag,4216
	global	_getAD_ConvertFlag
psect	text589,local,class=CODE,delta=2
global __ptext589
__ptext589:

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
psect	text589
	file	"C:\190604\AK7030-OTP\common.c"
	line	66
	global	__size_of_getAD_ConvertFlag
	__size_of_getAD_ConvertFlag	equ	__end_of_getAD_ConvertFlag-_getAD_ConvertFlag
	
_getAD_ConvertFlag:	
	opt	stack 4
; Regs used in _getAD_ConvertFlag: [wreg]
	line	67
	
l3809:	
;common.c: 67: return adc_convert_flag;
	movf	(_adc_convert_flag),w
	line	68
	
l1612:	
	return
	opt stack 0
GLOBAL	__end_of_getAD_ConvertFlag
	__end_of_getAD_ConvertFlag:
;; =============== function _getAD_ConvertFlag ends ============

	signat	_getAD_ConvertFlag,89
	global	_isFinishedThreeHoursTimer
psect	text590,local,class=CODE,delta=2
global __ptext590
__ptext590:

;; *************** function _isFinishedThreeHoursTimer *****************
;; Defined at:
;;		line 265 in file "C:\190604\AK7030-OTP\common.c"
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
psect	text590
	file	"C:\190604\AK7030-OTP\common.c"
	line	265
	global	__size_of_isFinishedThreeHoursTimer
	__size_of_isFinishedThreeHoursTimer	equ	__end_of_isFinishedThreeHoursTimer-_isFinishedThreeHoursTimer
	
_isFinishedThreeHoursTimer:	
	opt	stack 5
; Regs used in _isFinishedThreeHoursTimer: [wreg+status,2+status,0]
	line	266
	
l3797:	
;common.c: 266: if(uiSmallTimer == 0)
	movf	((_uiSmallTimer+1)),w
	iorwf	((_uiSmallTimer)),w
	skipz
	goto	u801
	goto	u800
u801:
	goto	l3805
u800:
	line	267
	
l3799:	
;common.c: 267: return 1;
	movlw	(01h)
	goto	l1692
	line	269
	
l3805:	
;common.c: 268: else
;common.c: 269: return 0;
	movlw	(0)
	line	270
	
l1692:	
	return
	opt stack 0
GLOBAL	__end_of_isFinishedThreeHoursTimer
	__end_of_isFinishedThreeHoursTimer:
;; =============== function _isFinishedThreeHoursTimer ends ============

	signat	_isFinishedThreeHoursTimer,89
	global	_startThreeHoursTimer
psect	text591,local,class=CODE,delta=2
global __ptext591
__ptext591:

;; *************** function _startThreeHoursTimer *****************
;; Defined at:
;;		line 232 in file "C:\190604\AK7030-OTP\common.c"
;; Parameters:    Size  Location     Type
;;		None
;; Auto vars:     Size  Location     Type
;;		None
;; Return value:  Size  Location     Type
;;		None               void
;; Registers used:
;;		wreg
;; Tracked objects:
;;		On entry : 60/60
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
psect	text591
	file	"C:\190604\AK7030-OTP\common.c"
	line	232
	global	__size_of_startThreeHoursTimer
	__size_of_startThreeHoursTimer	equ	__end_of_startThreeHoursTimer-_startThreeHoursTimer
	
_startThreeHoursTimer:	
	opt	stack 5
; Regs used in _startThreeHoursTimer: [wreg]
	line	233
	
l3795:	
;common.c: 233: uiSmallTimer = 10800;
	movlw	low(02A30h)
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	movwf	(_uiSmallTimer)
	movlw	high(02A30h)
	movwf	((_uiSmallTimer))+1
	line	238
	
l1675:	
	return
	opt stack 0
GLOBAL	__end_of_startThreeHoursTimer
	__end_of_startThreeHoursTimer:
;; =============== function _startThreeHoursTimer ends ============

	signat	_startThreeHoursTimer,88
	global	_isFinishedTwentySecondsTimer
psect	text592,local,class=CODE,delta=2
global __ptext592
__ptext592:

;; *************** function _isFinishedTwentySecondsTimer *****************
;; Defined at:
;;		line 248 in file "C:\190604\AK7030-OTP\common.c"
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
psect	text592
	file	"C:\190604\AK7030-OTP\common.c"
	line	248
	global	__size_of_isFinishedTwentySecondsTimer
	__size_of_isFinishedTwentySecondsTimer	equ	__end_of_isFinishedTwentySecondsTimer-_isFinishedTwentySecondsTimer
	
_isFinishedTwentySecondsTimer:	
	opt	stack 5
; Regs used in _isFinishedTwentySecondsTimer: [wreg+status,2+status,0]
	line	249
	
l3783:	
;common.c: 249: if(0 == uiTwentySecondsTimer)
	movf	((_uiTwentySecondsTimer+1)),w
	iorwf	((_uiTwentySecondsTimer)),w
	skipz
	goto	u791
	goto	u790
u791:
	goto	l3791
u790:
	line	250
	
l3785:	
;common.c: 250: return 1;
	movlw	(01h)
	goto	l1682
	line	252
	
l3791:	
;common.c: 251: else
;common.c: 252: return 0;
	movlw	(0)
	line	253
	
l1682:	
	return
	opt stack 0
GLOBAL	__end_of_isFinishedTwentySecondsTimer
	__end_of_isFinishedTwentySecondsTimer:
;; =============== function _isFinishedTwentySecondsTimer ends ============

	signat	_isFinishedTwentySecondsTimer,89
	global	_getAdOriginaCh4Value
psect	text593,local,class=CODE,delta=2
global __ptext593
__ptext593:

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
psect	text593
	file	"C:\190604\AK7030-OTP\common.c"
	line	89
	global	__size_of_getAdOriginaCh4Value
	__size_of_getAdOriginaCh4Value	equ	__end_of_getAdOriginaCh4Value-_getAdOriginaCh4Value
	
_getAdOriginaCh4Value:	
	opt	stack 5
; Regs used in _getAdOriginaCh4Value: [wreg]
	line	90
	
l3779:	
;common.c: 90: return adc_original_CH4_value;
	movf	(_adc_original_CH4_value+1),w
	movwf	(?_getAdOriginaCh4Value+1)
	movf	(_adc_original_CH4_value),w
	movwf	(?_getAdOriginaCh4Value)
	line	91
	
l1624:	
	return
	opt stack 0
GLOBAL	__end_of_getAdOriginaCh4Value
	__end_of_getAdOriginaCh4Value:
;; =============== function _getAdOriginaCh4Value ends ============

	signat	_getAdOriginaCh4Value,90
	global	_startTwentySecondsTimer
psect	text594,local,class=CODE,delta=2
global __ptext594
__ptext594:

;; *************** function _startTwentySecondsTimer *****************
;; Defined at:
;;		line 242 in file "C:\190604\AK7030-OTP\common.c"
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
psect	text594
	file	"C:\190604\AK7030-OTP\common.c"
	line	242
	global	__size_of_startTwentySecondsTimer
	__size_of_startTwentySecondsTimer	equ	__end_of_startTwentySecondsTimer-_startTwentySecondsTimer
	
_startTwentySecondsTimer:	
	opt	stack 5
; Regs used in _startTwentySecondsTimer: [wreg]
	line	243
	
l3777:	
;common.c: 243: uiTwentySecondsTimer = 20;
	movlw	014h
	movwf	(_uiTwentySecondsTimer)
	clrf	(_uiTwentySecondsTimer+1)
	line	244
	
l1678:	
	return
	opt stack 0
GLOBAL	__end_of_startTwentySecondsTimer
	__end_of_startTwentySecondsTimer:
;; =============== function _startTwentySecondsTimer ends ============

	signat	_startTwentySecondsTimer,88
	global	_isFinishedTwelveHoursTimer
psect	text595,local,class=CODE,delta=2
global __ptext595
__ptext595:

;; *************** function _isFinishedTwelveHoursTimer *****************
;; Defined at:
;;		line 257 in file "C:\190604\AK7030-OTP\common.c"
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
psect	text595
	file	"C:\190604\AK7030-OTP\common.c"
	line	257
	global	__size_of_isFinishedTwelveHoursTimer
	__size_of_isFinishedTwelveHoursTimer	equ	__end_of_isFinishedTwelveHoursTimer-_isFinishedTwelveHoursTimer
	
_isFinishedTwelveHoursTimer:	
	opt	stack 5
; Regs used in _isFinishedTwelveHoursTimer: [wreg+status,2+status,0]
	line	258
	
l3765:	
;common.c: 258: if(uiBigTimer == 0)
	movf	((_uiBigTimer+1)),w
	iorwf	((_uiBigTimer)),w
	skipz
	goto	u781
	goto	u780
u781:
	goto	l3773
u780:
	line	259
	
l3767:	
;common.c: 259: return 1;
	movlw	(01h)
	goto	l1687
	line	261
	
l3773:	
;common.c: 260: else
;common.c: 261: return 0;
	movlw	(0)
	line	262
	
l1687:	
	return
	opt stack 0
GLOBAL	__end_of_isFinishedTwelveHoursTimer
	__end_of_isFinishedTwelveHoursTimer:
;; =============== function _isFinishedTwelveHoursTimer ends ============

	signat	_isFinishedTwelveHoursTimer,89
	global	_startTwelveHourTimer
psect	text596,local,class=CODE,delta=2
global __ptext596
__ptext596:

;; *************** function _startTwelveHourTimer *****************
;; Defined at:
;;		line 205 in file "C:\190604\AK7030-OTP\common.c"
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
psect	text596
	file	"C:\190604\AK7030-OTP\common.c"
	line	205
	global	__size_of_startTwelveHourTimer
	__size_of_startTwelveHourTimer	equ	__end_of_startTwelveHourTimer-_startTwelveHourTimer
	
_startTwelveHourTimer:	
	opt	stack 5
; Regs used in _startTwelveHourTimer: [wreg]
	line	206
	
l3763:	
;common.c: 206: uiBigTimer = 43200;
	movlw	low(0A8C0h)
	movwf	(_uiBigTimer)
	movlw	high(0A8C0h)
	movwf	((_uiBigTimer))+1
	line	212
	
l1663:	
	return
	opt stack 0
GLOBAL	__end_of_startTwelveHourTimer
	__end_of_startTwelveHourTimer:
;; =============== function _startTwelveHourTimer ends ============

	signat	_startTwelveHourTimer,88
	global	_getAdOriginalCh1Value
psect	text597,local,class=CODE,delta=2
global __ptext597
__ptext597:

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
psect	text597
	file	"C:\190604\AK7030-OTP\common.c"
	line	83
	global	__size_of_getAdOriginalCh1Value
	__size_of_getAdOriginalCh1Value	equ	__end_of_getAdOriginalCh1Value-_getAdOriginalCh1Value
	
_getAdOriginalCh1Value:	
	opt	stack 5
; Regs used in _getAdOriginalCh1Value: [wreg]
	line	84
	
l3759:	
;common.c: 84: return adc_original_CH1_value;
	movf	(_adc_original_CH1_value+1),w
	movwf	(?_getAdOriginalCh1Value+1)
	movf	(_adc_original_CH1_value),w
	movwf	(?_getAdOriginalCh1Value)
	line	85
	
l1621:	
	return
	opt stack 0
GLOBAL	__end_of_getAdOriginalCh1Value
	__end_of_getAdOriginalCh1Value:
;; =============== function _getAdOriginalCh1Value ends ============

	signat	_getAdOriginalCh1Value,90
	global	_getAdOriginalCh14Value
psect	text598,local,class=CODE,delta=2
global __ptext598
__ptext598:

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
psect	text598
	file	"C:\190604\AK7030-OTP\common.c"
	line	95
	global	__size_of_getAdOriginalCh14Value
	__size_of_getAdOriginalCh14Value	equ	__end_of_getAdOriginalCh14Value-_getAdOriginalCh14Value
	
_getAdOriginalCh14Value:	
	opt	stack 5
; Regs used in _getAdOriginalCh14Value: [wreg]
	line	96
	
l3755:	
;common.c: 96: return adc_original_CH14_value;
	movf	(_adc_original_CH14_value+1),w
	movwf	(?_getAdOriginalCh14Value+1)
	movf	(_adc_original_CH14_value),w
	movwf	(?_getAdOriginalCh14Value)
	line	97
	
l1627:	
	return
	opt stack 0
GLOBAL	__end_of_getAdOriginalCh14Value
	__end_of_getAdOriginalCh14Value:
;; =============== function _getAdOriginalCh14Value ends ============

	signat	_getAdOriginalCh14Value,90
	global	_clrSampeTime
psect	text599,local,class=CODE,delta=2
global __ptext599
__ptext599:

;; *************** function _clrSampeTime *****************
;; Defined at:
;;		line 283 in file "C:\190604\AK7030-OTP\common.c"
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
psect	text599
	file	"C:\190604\AK7030-OTP\common.c"
	line	283
	global	__size_of_clrSampeTime
	__size_of_clrSampeTime	equ	__end_of_clrSampeTime-_clrSampeTime
	
_clrSampeTime:	
	opt	stack 5
; Regs used in _clrSampeTime: [status,2]
	line	284
	
l3753:	
;common.c: 284: timer.timer10msStopWatch = 0;
	clrf	(_timer)
	line	285
	
l1701:	
	return
	opt stack 0
GLOBAL	__end_of_clrSampeTime
	__end_of_clrSampeTime:
;; =============== function _clrSampeTime ends ============

	signat	_clrSampeTime,88
	global	_isPermitSampleTime
psect	text600,local,class=CODE,delta=2
global __ptext600
__ptext600:

;; *************** function _isPermitSampleTime *****************
;; Defined at:
;;		line 273 in file "C:\190604\AK7030-OTP\common.c"
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
psect	text600
	file	"C:\190604\AK7030-OTP\common.c"
	line	273
	global	__size_of_isPermitSampleTime
	__size_of_isPermitSampleTime	equ	__end_of_isPermitSampleTime-_isPermitSampleTime
	
_isPermitSampleTime:	
	opt	stack 5
; Regs used in _isPermitSampleTime: [wreg]
	line	274
	
l3741:	
;common.c: 274: if(timer.timer10msStopWatch >= 10)
	movlw	(0Ah)
	subwf	(_timer),w
	skipc
	goto	u771
	goto	u770
u771:
	goto	l3749
u770:
	line	276
	
l3743:	
;common.c: 275: {
;common.c: 276: return 1;
	movlw	(01h)
	goto	l1697
	line	279
	
l3749:	
;common.c: 278: else
;common.c: 279: return 0;
	movlw	(0)
	line	280
	
l1697:	
	return
	opt stack 0
GLOBAL	__end_of_isPermitSampleTime
	__end_of_isPermitSampleTime:
;; =============== function _isPermitSampleTime ends ============

	signat	_isPermitSampleTime,89
	global	_adc_start
psect	text601,local,class=CODE,delta=2
global __ptext601
__ptext601:

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
psect	text601
	file	"C:\190604\AK7030-OTP\periph.c"
	line	100
	global	__size_of_adc_start
	__size_of_adc_start	equ	__end_of_adc_start-_adc_start
	
_adc_start:	
	opt	stack 4
; Regs used in _adc_start: []
	line	101
	
l3739:	
;periph.c: 101: GO=1;
	bcf	status, 5	;RP0=0, select bank0
	bsf	(249/8),(249)&7
	line	102
	
l2367:	
	return
	opt stack 0
GLOBAL	__end_of_adc_start
	__end_of_adc_start:
;; =============== function _adc_start ends ============

	signat	_adc_start,88
	global	_op2_init
psect	text602,local,class=CODE,delta=2
global __ptext602
__ptext602:

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
psect	text602
	file	"C:\190604\AK7030-OTP\periph.c"
	line	45
	global	__size_of_op2_init
	__size_of_op2_init	equ	__end_of_op2_init-_op2_init
	
_op2_init:	
	opt	stack 5
; Regs used in _op2_init: [wreg]
	line	52
	
l3733:	
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
	
l3735:	
;periph.c: 58: TRISA7=0;
	bcf	(1071/8)^080h,(1071)&7
	line	60
	
l3737:	
;periph.c: 60: TRISB7 = 1;
	bsf	(1079/8)^080h,(1079)&7
	line	61
	
l2353:	
	return
	opt stack 0
GLOBAL	__end_of_op2_init
	__end_of_op2_init:
;; =============== function _op2_init ends ============

	signat	_op2_init,88
	global	_op1_init
psect	text603,local,class=CODE,delta=2
global __ptext603
__ptext603:

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
psect	text603
	file	"C:\190604\AK7030-OTP\periph.c"
	line	26
	global	__size_of_op1_init
	__size_of_op1_init	equ	__end_of_op1_init-_op1_init
	
_op1_init:	
	opt	stack 5
; Regs used in _op1_init: [wreg]
	line	33
	
l3727:	
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
	
l3729:	
;periph.c: 38: TRISB3=1;
	bsf	status, 5	;RP0=1, select bank1
	bsf	(1075/8)^080h,(1075)&7
	line	40
	
l3731:	
;periph.c: 40: TRISB5=0;
	bcf	(1077/8)^080h,(1077)&7
	line	41
	
l2350:	
	return
	opt stack 0
GLOBAL	__end_of_op1_init
	__end_of_op1_init:
;; =============== function _op1_init ends ============

	signat	_op1_init,88
	global	_dac_init
psect	text604,local,class=CODE,delta=2
global __ptext604
__ptext604:

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
psect	text604
	file	"C:\190604\AK7030-OTP\periph.c"
	line	14
	global	__size_of_dac_init
	__size_of_dac_init	equ	__end_of_dac_init-_dac_init
	
_dac_init:	
	opt	stack 5
; Regs used in _dac_init: [wreg]
	line	15
	
l3721:	
;periph.c: 15: DACCON|=1;
	bsf	(135)^080h+(0/8),(0)&7	;volatile
	line	17
	
l3723:	
;periph.c: 17: DACR0=0x0F;
	movlw	(0Fh)
	movwf	(136)^080h	;volatile
	line	18
	
l3725:	
;periph.c: 18: DACCON|=(1)<<2;
	bsf	(135)^080h+(2/8),(2)&7	;volatile
	line	22
	
l2347:	
	return
	opt stack 0
GLOBAL	__end_of_dac_init
	__end_of_dac_init:
;; =============== function _dac_init ends ============

	signat	_dac_init,88
	global	_adc_test_init
psect	text605,local,class=CODE,delta=2
global __ptext605
__ptext605:

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
psect	text605
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
	
l3711:	
;periph.c: 86: ADCON0 = 0x00;
	clrf	(31)	;volatile
	line	87
	
l3713:	
;periph.c: 87: ADCON0|=channel<<2;
	movf	(adc_test_init@channel),w
	movwf	(??_adc_test_init+0)+0
	clrc
	rlf	(??_adc_test_init+0)+0,f
	clrc
	rlf	(??_adc_test_init+0)+0,w
	iorwf	(31),f	;volatile
	line	88
	
l3715:	
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
	
l3717:	
;periph.c: 89: ADON=1;
	bcf	status, 5	;RP0=0, select bank0
	bsf	(248/8),(248)&7
	line	90
	
l3719:	
;periph.c: 90: ADIE=1;
	bsf	status, 5	;RP0=1, select bank1
	bsf	(1130/8)^080h,(1130)&7
	line	91
	
l2361:	
	return
	opt stack 0
GLOBAL	__end_of_adc_test_init
	__end_of_adc_test_init:
;; =============== function _adc_test_init ends ============

	signat	_adc_test_init,8312
	global	_timer1_interrupt_config
psect	text606,local,class=CODE,delta=2
global __ptext606
__ptext606:

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
psect	text606
	file	"C:\190604\AK7030-OTP\common.c"
	line	58
	global	__size_of_timer1_interrupt_config
	__size_of_timer1_interrupt_config	equ	__end_of_timer1_interrupt_config-_timer1_interrupt_config
	
_timer1_interrupt_config:	
	opt	stack 5
; Regs used in _timer1_interrupt_config: []
	line	59
	
l3709:	
;common.c: 59: GIE = 1;
	bsf	(95/8),(95)&7
	line	60
;common.c: 60: PEIE = 1;
	bsf	(94/8),(94)&7
	line	61
	
l1609:	
	return
	opt stack 0
GLOBAL	__end_of_timer1_interrupt_config
	__end_of_timer1_interrupt_config:
;; =============== function _timer1_interrupt_config ends ============

	signat	_timer1_interrupt_config,88
	global	_timer1_config
psect	text607,local,class=CODE,delta=2
global __ptext607
__ptext607:

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
psect	text607
	file	"C:\190604\AK7030-OTP\common.c"
	line	46
	global	__size_of_timer1_config
	__size_of_timer1_config	equ	__end_of_timer1_config-_timer1_config
	
_timer1_config:	
	opt	stack 5
; Regs used in _timer1_config: [wreg]
	line	48
	
l3705:	
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
	
l3707:	
;common.c: 51: TMR1IE=1;
	bsf	status, 5	;RP0=1, select bank1
	bsf	(1120/8)^080h,(1120)&7
	line	53
	
l1606:	
	return
	opt stack 0
GLOBAL	__end_of_timer1_config
	__end_of_timer1_config:
;; =============== function _timer1_config ends ============

	signat	_timer1_config,88
	global	_clock_config
psect	text608,local,class=CODE,delta=2
global __ptext608
__ptext608:

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
psect	text608
	file	"C:\190604\AK7030-OTP\common.c"
	line	38
	global	__size_of_clock_config
	__size_of_clock_config	equ	__end_of_clock_config-_clock_config
	
_clock_config:	
	opt	stack 5
; Regs used in _clock_config: [wreg+status,2]
	line	40
	
l3701:	
;common.c: 40: CLKPR = 0x80;
	movlw	(080h)
	bcf	status, 5	;RP0=0, select bank2
	bsf	status, 6	;RP1=1, select bank2
	movwf	(264)^0100h	;volatile
	line	41
	
l3703:	
;common.c: 41: CLKPR = 0x00;
	clrf	(264)^0100h	;volatile
	line	42
;common.c: 42: while(CLKPCE);
	
l1600:	
	btfsc	(2119/8)^0100h,(2119)&7
	goto	u761
	goto	u760
u761:
	goto	l1600
u760:
	line	43
	
l1603:	
	return
	opt stack 0
GLOBAL	__end_of_clock_config
	__end_of_clock_config:
;; =============== function _clock_config ends ============

	signat	_clock_config,88
	global	_clearTwentySecondsTimer
psect	text609,local,class=CODE,delta=2
global __ptext609
__ptext609:

;; *************** function _clearTwentySecondsTimer *****************
;; Defined at:
;;		line 226 in file "C:\190604\AK7030-OTP\common.c"
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
psect	text609
	file	"C:\190604\AK7030-OTP\common.c"
	line	226
	global	__size_of_clearTwentySecondsTimer
	__size_of_clearTwentySecondsTimer	equ	__end_of_clearTwentySecondsTimer-_clearTwentySecondsTimer
	
_clearTwentySecondsTimer:	
	opt	stack 4
; Regs used in _clearTwentySecondsTimer: [status,2]
	line	227
	
l3699:	
;common.c: 227: uiTwentySecondsTimer = 0;
	clrf	(_uiTwentySecondsTimer)
	clrf	(_uiTwentySecondsTimer+1)
	line	228
	
l1672:	
	return
	opt stack 0
GLOBAL	__end_of_clearTwentySecondsTimer
	__end_of_clearTwentySecondsTimer:
;; =============== function _clearTwentySecondsTimer ends ============

	signat	_clearTwentySecondsTimer,88
	global	_clearThreeHoursTimer
psect	text610,local,class=CODE,delta=2
global __ptext610
__ptext610:

;; *************** function _clearThreeHoursTimer *****************
;; Defined at:
;;		line 221 in file "C:\190604\AK7030-OTP\common.c"
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
psect	text610
	file	"C:\190604\AK7030-OTP\common.c"
	line	221
	global	__size_of_clearThreeHoursTimer
	__size_of_clearThreeHoursTimer	equ	__end_of_clearThreeHoursTimer-_clearThreeHoursTimer
	
_clearThreeHoursTimer:	
	opt	stack 4
; Regs used in _clearThreeHoursTimer: [status,2]
	line	222
	
l3697:	
;common.c: 222: uiSmallTimer = 0;
	clrf	(_uiSmallTimer)
	clrf	(_uiSmallTimer+1)
	line	223
	
l1669:	
	return
	opt stack 0
GLOBAL	__end_of_clearThreeHoursTimer
	__end_of_clearThreeHoursTimer:
;; =============== function _clearThreeHoursTimer ends ============

	signat	_clearThreeHoursTimer,88
	global	_clearTwelveHoursTimer
psect	text611,local,class=CODE,delta=2
global __ptext611
__ptext611:

;; *************** function _clearTwelveHoursTimer *****************
;; Defined at:
;;		line 215 in file "C:\190604\AK7030-OTP\common.c"
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
psect	text611
	file	"C:\190604\AK7030-OTP\common.c"
	line	215
	global	__size_of_clearTwelveHoursTimer
	__size_of_clearTwelveHoursTimer	equ	__end_of_clearTwelveHoursTimer-_clearTwelveHoursTimer
	
_clearTwelveHoursTimer:	
	opt	stack 4
; Regs used in _clearTwelveHoursTimer: [status,2]
	line	216
	
l3695:	
;common.c: 216: uiBigTimer = 0;
	clrf	(_uiBigTimer)
	clrf	(_uiBigTimer+1)
	line	217
	
l1666:	
	return
	opt stack 0
GLOBAL	__end_of_clearTwelveHoursTimer
	__end_of_clearTwelveHoursTimer:
;; =============== function _clearTwelveHoursTimer ends ============

	signat	_clearTwelveHoursTimer,88
	global	_ISR
psect	text612,local,class=CODE,delta=2
global __ptext612
__ptext612:

;; *************** function _ISR *****************
;; Defined at:
;;		line 288 in file "C:\190604\AK7030-OTP\common.c"
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
psect	text612
	file	"C:\190604\AK7030-OTP\common.c"
	line	288
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
psect	text612
	line	291
	
i1l3819:	
;common.c: 289: static unsigned char ucTimer1sCnt = 0;
;common.c: 291: if(TMR1IF == 1)
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	btfss	(96/8),(96)&7
	goto	u81_21
	goto	u81_20
u81_21:
	goto	i1l3837
u81_20:
	line	293
	
i1l3821:	
;common.c: 292: {
;common.c: 293: TMR1IF = 0 ;
	bcf	(96/8),(96)&7
	line	294
	
i1l3823:	
;common.c: 294: timer.timer10msStopWatch++;
	incf	(_timer),f
	line	295
;common.c: 295: ucTimer1sCnt++;
	incf	(ISR@ucTimer1sCnt),f
	line	297
	
i1l3825:	
;common.c: 297: if(ucTimer1sCnt >= 100)
	movlw	(064h)
	subwf	(ISR@ucTimer1sCnt),w
	skipc
	goto	u82_21
	goto	u82_20
u82_21:
	goto	i1l3837
u82_20:
	line	299
	
i1l3827:	
;common.c: 298: {
;common.c: 299: ucTimer1sCnt = 0;
	clrf	(ISR@ucTimer1sCnt)
	line	300
	
i1l3829:	
;common.c: 300: if(uiBigTimer > 0)
	movf	(_uiBigTimer+1),w
	iorwf	(_uiBigTimer),w
	skipnz
	goto	u83_21
	goto	u83_20
u83_21:
	goto	i1l1708
u83_20:
	line	301
	
i1l3831:	
;common.c: 301: uiBigTimer--;
	movlw	low(01h)
	subwf	(_uiBigTimer),f
	movlw	high(01h)
	skipc
	decf	(_uiBigTimer+1),f
	subwf	(_uiBigTimer+1),f
	
i1l1708:	
	line	303
;common.c: 303: if(uiSmallTimer)
	movf	(_uiSmallTimer+1),w
	iorwf	(_uiSmallTimer),w
	skipnz
	goto	u84_21
	goto	u84_20
u84_21:
	goto	i1l1709
u84_20:
	line	304
	
i1l3833:	
;common.c: 304: uiSmallTimer--;
	movlw	low(01h)
	subwf	(_uiSmallTimer),f
	movlw	high(01h)
	skipc
	decf	(_uiSmallTimer+1),f
	subwf	(_uiSmallTimer+1),f
	
i1l1709:	
	line	306
;common.c: 306: if(uiTwentySecondsTimer)
	movf	(_uiTwentySecondsTimer+1),w
	iorwf	(_uiTwentySecondsTimer),w
	skipnz
	goto	u85_21
	goto	u85_20
u85_21:
	goto	i1l3837
u85_20:
	line	307
	
i1l3835:	
;common.c: 307: uiTwentySecondsTimer--;
	movlw	low(01h)
	subwf	(_uiTwentySecondsTimer),f
	movlw	high(01h)
	skipc
	decf	(_uiTwentySecondsTimer+1),f
	subwf	(_uiTwentySecondsTimer+1),f
	line	311
	
i1l3837:	
;common.c: 308: }
;common.c: 309: }
;common.c: 311: if(ADIF)
	btfss	(106/8),(106)&7
	goto	u86_21
	goto	u86_20
u86_21:
	goto	i1l1716
u86_20:
	line	313
	
i1l3839:	
;common.c: 312: {
;common.c: 313: ADIF=0;
	bcf	(106/8),(106)&7
	line	314
	
i1l3841:	
;common.c: 314: setAD_ConvertFlag(1);
	movlw	(01h)
	fcall	i1_setAD_ConvertFlag
	line	315
	
i1l3843:	
;common.c: 315: adc_original_value = adc_get();
	fcall	_adc_get
	movf	(1+(?_adc_get)),w
	bcf	status, 5	;RP0=0, select bank0
	movwf	(_adc_original_value+1)
	movf	(0+(?_adc_get)),w
	movwf	(_adc_original_value)
	line	316
	
i1l3845:	
;common.c: 316: if(sampleChannelSelect == 4)
	movf	(_sampleChannelSelect),w
	xorlw	04h
	skipz
	goto	u87_21
	goto	u87_20
u87_21:
	goto	i1l3849
u87_20:
	line	317
	
i1l3847:	
;common.c: 317: adc_original_CH4_value = adc_get();
	fcall	_adc_get
	movf	(1+(?_adc_get)),w
	bcf	status, 5	;RP0=0, select bank0
	movwf	(_adc_original_CH4_value+1)
	movf	(0+(?_adc_get)),w
	movwf	(_adc_original_CH4_value)
	goto	i1l1716
	line	318
	
i1l3849:	
;common.c: 318: else if(sampleChannelSelect == 1)
	decf	(_sampleChannelSelect),w
	skipz
	goto	u88_21
	goto	u88_20
u88_21:
	goto	i1l3853
u88_20:
	line	319
	
i1l3851:	
;common.c: 319: adc_original_CH1_value = adc_get();
	fcall	_adc_get
	movf	(1+(?_adc_get)),w
	bcf	status, 5	;RP0=0, select bank0
	movwf	(_adc_original_CH1_value+1)
	movf	(0+(?_adc_get)),w
	movwf	(_adc_original_CH1_value)
	goto	i1l1716
	line	321
	
i1l3853:	
;common.c: 320: else
;common.c: 321: adc_original_CH14_value = adc_get();
	fcall	_adc_get
	movf	(1+(?_adc_get)),w
	bcf	status, 5	;RP0=0, select bank0
	movwf	(_adc_original_CH14_value+1)
	movf	(0+(?_adc_get)),w
	movwf	(_adc_original_CH14_value)
	line	324
	
i1l1716:	
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
psect	text613,local,class=CODE,delta=2
global __ptext613
__ptext613:

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
psect	text613
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
	
i1l3859:	
;common.c: 73: adc_convert_flag = flag;
	movf	(i1setAD_ConvertFlag@flag),w
	movwf	(_adc_convert_flag)
	line	74
	
i1l1615:	
	return
	opt stack 0
GLOBAL	__end_ofi1_setAD_ConvertFlag
	__end_ofi1_setAD_ConvertFlag:
;; =============== function i1_setAD_ConvertFlag ends ============

	signat	i1_setAD_ConvertFlag,88
	global	_adc_get
psect	text614,local,class=CODE,delta=2
global __ptext614
__ptext614:

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
psect	text614
	file	"C:\190604\AK7030-OTP\periph.c"
	line	105
	global	__size_of_adc_get
	__size_of_adc_get	equ	__end_of_adc_get-_adc_get
	
_adc_get:	
	opt	stack 3
; Regs used in _adc_get: [wreg]
	line	107
	
i1l3855:	
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
	
i1l2370:	
	return
	opt stack 0
GLOBAL	__end_of_adc_get
	__end_of_adc_get:
;; =============== function _adc_get ends ============

	signat	_adc_get,90
psect	text615,local,class=CODE,delta=2
global __ptext615
__ptext615:
	global	btemp
	btemp set 07Eh

	DABS	1,126,2	;btemp
	global	wtemp0
	wtemp0 set btemp
	end
