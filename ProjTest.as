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
# 70 "D:\develop\ATK\AK7030-OTP\main.c"
	psect config,class=CONFIG,delta=2 ;#
# 70 "D:\develop\ATK\AK7030-OTP\main.c"
	dw 0x2FFF & 0x3FFF & 0x3FFF & 0x3FFF & 0x3FFF & 0x3FFF ;#
# 71 "D:\develop\ATK\AK7030-OTP\main.c"
	psect config,class=CONFIG,delta=2 ;#
# 71 "D:\develop\ATK\AK7030-OTP\main.c"
	dw 0x3FFF & 0x3FDF & 0x3FFF & 0x3FFE ;#
# 72 "D:\develop\ATK\AK7030-OTP\main.c"
	psect config,class=CONFIG,delta=2 ;#
# 72 "D:\develop\ATK\AK7030-OTP\main.c"
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
	FNCALL	_main,_process_AD_Converter_Value
	FNCALL	_main,_isPermitSampleTime
	FNCALL	_main,_clrSampeTime
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
	FNCALL	_clearPinPortAndTimer,_clearAllTimer
	FNCALL	_getAdOriginaCh4Value,_Filter
	FNCALL	_getAdOriginalCh1Value,_Filter
	FNCALL	_getAdOriginalCh14Value,_Filter
	FNCALL	_process_AD_Converter_Value,_getAD_ConvertFlag
	FNCALL	_process_AD_Converter_Value,_setAD_ConvertFlag
	FNCALL	_process_AD_Converter_Value,_AD_Sample
	FNCALL	_process_AD_Converter_Value,_adc_test_init
	FNCALL	_process_AD_Converter_Value,_adc_start
	FNCALL	_clearAllTimer,_clearTwelveHoursTimer
	FNCALL	_clearAllTimer,_clearThreeHoursTimer
	FNCALL	_clearAllTimer,_clearTwentySecondsTimer
	FNROOT	_main
	FNCALL	_ISR,i1_setAD_ConvertFlag
	FNCALL	_ISR,_adc_get
	FNCALL	_ISR,_vPutSampleDataIntoTable
	FNCALL	intlevel1,_ISR
	global	intlevel1
	FNROOT	intlevel1
	global	_sampleChannelSelect
psect	idataBANK0,class=CODE,space=0,delta=2
global __pidataBANK0
__pidataBANK0:
	file	"D:\develop\ATK\AK7030-OTP\common.c"
	line	24

;initializer for _sampleChannelSelect
	retlw	0Eh
	global	_uiBigTimer
	global	_uiSmallTimer
	global	ISR@ucTimer1sCnt
	global	_adc_convert_flag
	global	_sampleTimes
	global	_timer
	global	main@cTimer1s_811
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
	global	main@ucTimerDelayP5s
	global	main@ucTimerP3s
	global	main@ucTimerP5s
	global	main@ucTimerRightP5s
	global	main@ucTimerX1P5s
	global	main@ucTimerX2P5s
	global	main@ucTimerZeroPoint3s
	global	main@ucTimerZeroPoint5s
	global	vPutSampleDataIntoTable@ucChannelFourteenthLength
	global	vPutSampleDataIntoTable@ucChannelFourthLength
	global	vPutSampleDataIntoTable@ucChannelFirstLength
	global	_uiTwentySecondsTimer
	global	_uiSampleChannelFirst
	global	_uiSampleChannelFourteenth
	global	_uiSampleChannelFourth
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
vPutSampleDataIntoTable@ucChannelFirstLength:
       ds      1

psect	bssBANK0,class=BANK0,space=1
global __pbssBANK0
__pbssBANK0:
_uiBigTimer:
       ds      2

_uiSmallTimer:
       ds      2

ISR@ucTimer1sCnt:
       ds      1

_adc_convert_flag:
       ds      1

_sampleTimes:
       ds      1

_timer:
       ds      1

main@cTimer1s_811:
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

main@ucTimerDelayP5s:
       ds      1

main@ucTimerP3s:
       ds      1

main@ucTimerP5s:
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

vPutSampleDataIntoTable@ucChannelFourteenthLength:
       ds      1

vPutSampleDataIntoTable@ucChannelFourthLength:
       ds      1

psect	dataBANK0,class=BANK0,space=1
global __pdataBANK0
__pdataBANK0:
	file	"D:\develop\ATK\AK7030-OTP\common.c"
_sampleChannelSelect:
       ds      1

psect	bssBANK1,class=BANK1,space=1
global __pbssBANK1
__pbssBANK1:
_uiTwentySecondsTimer:
       ds      2

_uiSampleChannelFirst:
       ds      24

_uiSampleChannelFourteenth:
       ds      24

_uiSampleChannelFourth:
       ds      24

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
; Clear objects allocated to BANK0
psect cinit,class=CODE,delta=2
	bcf	status, 7	;select IRP bank0
	movlw	low(__pbssBANK0)
	movwf	fsr
	movlw	low((__pbssBANK0)+025h)
	fcall	clear_ram
; Clear objects allocated to BANK1
psect cinit,class=CODE,delta=2
	movlw	low(__pbssBANK1)
	movwf	fsr
	movlw	low((__pbssBANK1)+04Ah)
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
	global	?_process_AD_Converter_Value
?_process_AD_Converter_Value:	; 0 bytes @ 0x0
	global	?_clrSampeTime
?_clrSampeTime:	; 0 bytes @ 0x0
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
	global	?_vPutSampleDataIntoTable
?_vPutSampleDataIntoTable:	; 0 bytes @ 0x4
	global	vPutSampleDataIntoTable@uiSampleData
vPutSampleDataIntoTable@uiSampleData:	; 2 bytes @ 0x4
	ds	2
	global	vPutSampleDataIntoTable@channel
vPutSampleDataIntoTable@channel:	; 1 bytes @ 0x6
	ds	1
	global	??_vPutSampleDataIntoTable
??_vPutSampleDataIntoTable:	; 0 bytes @ 0x7
	global	vPutSampleDataIntoTable@i
vPutSampleDataIntoTable@i:	; 2 bytes @ 0x7
	ds	2
	global	??_ISR
??_ISR:	; 0 bytes @ 0x9
	ds	4
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
	global	??_AD_Sample
??_AD_Sample:	; 0 bytes @ 0x0
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
	global	?_Filter
?_Filter:	; 2 bytes @ 0x0
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
	global	??_startTwelveHourTimer
??_startTwelveHourTimer:	; 0 bytes @ 0x2
	global	??_startThreeHoursTimer
??_startThreeHoursTimer:	; 0 bytes @ 0x2
	global	??_Filter
??_Filter:	; 0 bytes @ 0x2
	global	adc_test_init@channel
adc_test_init@channel:	; 1 bytes @ 0x2
	ds	1
	global	??_process_AD_Converter_Value
??_process_AD_Converter_Value:	; 0 bytes @ 0x3
	ds	3
	global	Filter@filter_buf
Filter@filter_buf:	; 24 bytes @ 0x6
	ds	24
	global	Filter@filter_temp
Filter@filter_temp:	; 2 bytes @ 0x1E
	ds	2
	global	Filter@filter_sum
Filter@filter_sum:	; 2 bytes @ 0x20
	ds	2
	global	Filter@tmpValue
Filter@tmpValue:	; 1 bytes @ 0x22
	ds	1
	global	Filter@cir
Filter@cir:	; 2 bytes @ 0x23
	ds	2
	global	Filter@j
Filter@j:	; 1 bytes @ 0x25
	ds	1
	global	Filter@i
Filter@i:	; 1 bytes @ 0x26
	ds	1
	global	?_getAdOriginalCh14Value
?_getAdOriginalCh14Value:	; 2 bytes @ 0x27
	global	?_getAdOriginalCh1Value
?_getAdOriginalCh1Value:	; 2 bytes @ 0x27
	global	?_getAdOriginaCh4Value
?_getAdOriginaCh4Value:	; 2 bytes @ 0x27
	ds	2
	global	??_getAdOriginalCh14Value
??_getAdOriginalCh14Value:	; 0 bytes @ 0x29
	global	??_getAdOriginalCh1Value
??_getAdOriginalCh1Value:	; 0 bytes @ 0x29
	global	??_getAdOriginaCh4Value
??_getAdOriginaCh4Value:	; 0 bytes @ 0x29
	global	??_main
??_main:	; 0 bytes @ 0x29
;;Data sizes: Strings 0, constant 0, data 1, bss 112, persistent 0 stack 0
;;Auto spaces:   Size  Autos    Used
;; COMMON          14     13      14
;; BANK0           80     41      79
;; BANK1           80      0      74
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
;; ?_Filter	unsigned int  size(1) Largest target is 0
;;
;; Filter@tmpValue	PTR int  size(1) Largest target is 24
;;		 -> uiSampleChannelFourteenth(BANK1[24]), uiSampleChannelFourth(BANK1[24]), uiSampleChannelFirst(BANK1[24]), 
;;


;;
;; Critical Paths under _main in COMMON
;;
;;   None.
;;
;; Critical Paths under _ISR in COMMON
;;
;;   _ISR->_vPutSampleDataIntoTable
;;   _vPutSampleDataIntoTable->_adc_get
;;
;; Critical Paths under _main in BANK0
;;
;;   _main->_getAdOriginalCh14Value
;;   _main->_getAdOriginalCh1Value
;;   _main->_getAdOriginaCh4Value
;;   _getAdOriginaCh4Value->_Filter
;;   _getAdOriginalCh1Value->_Filter
;;   _getAdOriginalCh14Value->_Filter
;;   _process_AD_Converter_Value->_adc_test_init
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
;; (0) _main                                                 0     0      0    2014
;;                            _initPin
;;                       _clock_config
;;                      _timer1_config
;;            _timer1_interrupt_config
;;                      _adc_test_init
;;                           _dac_init
;;                           _op1_init
;;                           _op2_init
;;                          _adc_start
;;         _process_AD_Converter_Value
;;                 _isPermitSampleTime
;;                       _clrSampeTime
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
;; (1) _clearPinPortAndTimer                                 0     0      0       0
;;                      _clearAllTimer
;; ---------------------------------------------------------------------------------
;; (1) _getAdOriginaCh4Value                                 2     0      2     620
;;                                             39 BANK0      2     0      2
;;                             _Filter
;; ---------------------------------------------------------------------------------
;; (1) _getAdOriginalCh1Value                                2     0      2     620
;;                                             39 BANK0      2     0      2
;;                             _Filter
;; ---------------------------------------------------------------------------------
;; (1) _getAdOriginalCh14Value                               2     0      2     620
;;                                             39 BANK0      2     0      2
;;                             _Filter
;; ---------------------------------------------------------------------------------
;; (1) _process_AD_Converter_Value                           0     0      0      66
;;                  _getAD_ConvertFlag
;;                  _setAD_ConvertFlag
;;                          _AD_Sample
;;                      _adc_test_init
;;                          _adc_start
;; ---------------------------------------------------------------------------------
;; (1) _clearAllTimer                                        0     0      0       0
;;              _clearTwelveHoursTimer
;;               _clearThreeHoursTimer
;;            _clearTwentySecondsTimer
;; ---------------------------------------------------------------------------------
;; (2) _AD_Sample                                            0     0      0       0
;; ---------------------------------------------------------------------------------
;; (2) _setAD_ConvertFlag                                    1     1      0      22
;;                                              0 BANK0      1     1      0
;; ---------------------------------------------------------------------------------
;; (2) _getAD_ConvertFlag                                    0     0      0       0
;; ---------------------------------------------------------------------------------
;; (2) _Filter                                              39    37      2     620
;;                                              0 BANK0     39    37      2
;; ---------------------------------------------------------------------------------
;; (1) _isFinishedThreeHoursTimer                            0     0      0       0
;; ---------------------------------------------------------------------------------
;; (1) _startThreeHoursTimer                                 2     0      2      22
;;                                              0 BANK0      2     0      2
;; ---------------------------------------------------------------------------------
;; (1) _isFinishedTwentySecondsTimer                         0     0      0       0
;; ---------------------------------------------------------------------------------
;; (1) _startTwentySecondsTimer                              0     0      0       0
;; ---------------------------------------------------------------------------------
;; (1) _isFinishedTwelveHoursTimer                           0     0      0       0
;; ---------------------------------------------------------------------------------
;; (1) _startTwelveHourTimer                                 2     0      2      22
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
;; Estimated maximum stack depth 2
;; ---------------------------------------------------------------------------------
;; (Depth) Function   	        Calls       Base Space   Used Autos Params    Refs
;; ---------------------------------------------------------------------------------
;; (4) _ISR                                                  4     4      0     407
;;                                              9 COMMON     4     4      0
;;                i1_setAD_ConvertFlag
;;                            _adc_get
;;            _vPutSampleDataIntoTable
;; ---------------------------------------------------------------------------------
;; (5) i1_setAD_ConvertFlag                                  1     1      0      73
;;                                              0 COMMON     1     1      0
;; ---------------------------------------------------------------------------------
;; (5) _adc_get                                              4     2      2      24
;;                                              0 COMMON     4     2      2
;; ---------------------------------------------------------------------------------
;; (5) _vPutSampleDataIntoTable                              5     2      3     310
;;                                              4 COMMON     5     2      3
;;                            _adc_get (ARG)
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
;;   _process_AD_Converter_Value
;;     _getAD_ConvertFlag
;;     _setAD_ConvertFlag
;;     _AD_Sample
;;     _adc_test_init
;;     _adc_start
;;   _isPermitSampleTime
;;   _clrSampeTime
;;   _getAdOriginalCh14Value
;;     _Filter
;;   _clearPinPortAndTimer
;;     _clearAllTimer
;;       _clearTwelveHoursTimer
;;       _clearThreeHoursTimer
;;       _clearTwentySecondsTimer
;;   _getAdOriginalCh1Value
;;     _Filter
;;   _startTwelveHourTimer
;;   _isFinishedTwelveHoursTimer
;;   _startTwentySecondsTimer
;;   _getAdOriginaCh4Value
;;     _Filter
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
;;   _vPutSampleDataIntoTable
;;     _adc_get (ARG)
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
;;BANK1               50      0      4A       8       92.5%
;;BITBANK1            50      0       0       7        0.0%
;;CODE                 0      0       0       0        0.0%
;;DATA                 0      0      AE       6        0.0%
;;ABS                  0      0      A7       3        0.0%
;;NULL                 0      0       0       0        0.0%
;;STACK                0      0       7       2        0.0%
;;BANK0               50     29      4F       5       98.8%
;;BITBANK0            50      0       0       4        0.0%
;;SFR0                 0      0       0       1        0.0%
;;BITSFR0              0      0       0       1        0.0%
;;COMMON               E      D       E       1      100.0%
;;BITCOMMON            E      0       0       0        0.0%

	global	_main
psect	maintext,global,class=CODE,delta=2
global __pmaintext
__pmaintext:

;; *************** function _main *****************
;; Defined at:
;;		line 129 in file "D:\develop\ATK\AK7030-OTP\main.c"
;; Parameters:    Size  Location     Type
;;		None
;; Auto vars:     Size  Location     Type
;;		None
;; Return value:  Size  Location     Type
;;		None               void
;; Registers used:
;;		wreg, fsr0l, fsr0h, status,2, status,0, btemp+1, pclath, cstack
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
;;		_process_AD_Converter_Value
;;		_isPermitSampleTime
;;		_clrSampeTime
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
	file	"D:\develop\ATK\AK7030-OTP\main.c"
	line	129
	global	__size_of_main
	__size_of_main	equ	__end_of_main-_main
	
_main:	
	opt	stack 3
; Regs used in _main: [wreg-fsr0h+status,2+status,0+btemp+1+pclath+cstack]
	line	150
	
l4100:	
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
	
l4102:	
;main.c: 161: initPin();
	fcall	_initPin
	line	164
	
l4104:	
;main.c: 164: TRISB2 = 1;
	bcf	status, 6	;RP1=0, select bank1
	bsf	(1074/8)^080h,(1074)&7
	line	166
	
l4106:	
;main.c: 166: TRISB7 = 1;
	bsf	(1079/8)^080h,(1079)&7
	line	167
	
l4108:	
;main.c: 167: TRISB4 = 1;
	bsf	(1076/8)^080h,(1076)&7
	line	169
	
l4110:	
;main.c: 169: clock_config();
	fcall	_clock_config
	line	170
	
l4112:	
;main.c: 170: timer1_config();
	fcall	_timer1_config
	line	171
;main.c: 171: timer1_interrupt_config();
	fcall	_timer1_interrupt_config
	line	173
	
l4114:	
;main.c: 173: adc_test_init(14,3);
	movlw	(03h)
	bcf	status, 5	;RP0=0, select bank0
	movwf	(?_adc_test_init)
	movlw	(0Eh)
	fcall	_adc_test_init
	line	175
	
l4116:	
;main.c: 175: dac_init();
	fcall	_dac_init
	line	176
	
l4118:	
;main.c: 176: op1_init();
	fcall	_op1_init
	line	177
	
l4120:	
;main.c: 177: op2_init();
	fcall	_op2_init
	line	180
;main.c: 180: adc_start();
	fcall	_adc_start
	line	213
	
l4122:	
# 213 "D:\develop\ATK\AK7030-OTP\main.c"
 clrwdt ;#
psect	maintext
	line	215
	
l4124:	
;main.c: 215: process_AD_Converter_Value();
	fcall	_process_AD_Converter_Value
	line	217
	
l4126:	
;main.c: 217: if(isPermitSampleTime())
	fcall	_isPermitSampleTime
	xorlw	0
	skipnz
	goto	u1241
	goto	u1240
u1241:
	goto	l4122
u1240:
	line	219
	
l4128:	
;main.c: 218: {
;main.c: 219: clrSampeTime();
	fcall	_clrSampeTime
	line	221
;main.c: 221: switch(enumMainLoopStep)
	goto	l4614
	line	226
	
l4130:	
;main.c: 224: {
;main.c: 225: static unsigned char ucTimerZeroPoint5s = 0;
;main.c: 226: if(getAdOriginalCh14Value() > 1950)
	fcall	_getAdOriginalCh14Value
	movlw	high(079Fh)
	subwf	(1+(?_getAdOriginalCh14Value)),w
	movlw	low(079Fh)
	skipnz
	subwf	(0+(?_getAdOriginalCh14Value)),w
	skipc
	goto	u1251
	goto	u1250
u1251:
	goto	l4134
u1250:
	line	228
	
l4132:	
;main.c: 227: {
;main.c: 228: ucTimerZeroPoint5s++;
	incf	(main@ucTimerZeroPoint5s),f
	line	229
;main.c: 229: }
	goto	l4136
	line	231
	
l4134:	
;main.c: 230: else
;main.c: 231: ucTimerZeroPoint5s = 0;
	clrf	(main@ucTimerZeroPoint5s)
	line	233
	
l4136:	
;main.c: 233: if(ucTimerZeroPoint5s >= 1)
	movf	(main@ucTimerZeroPoint5s),w
	skipz
	goto	u1260
	goto	l4122
u1260:
	line	235
	
l4138:	
;main.c: 234: {
;main.c: 235: ucTimerZeroPoint5s = 0;
	clrf	(main@ucTimerZeroPoint5s)
	line	236
	
l4140:	
;main.c: 236: enumMainLoopStep = MAIN_LOOP_STEP_FIRST;
	bcf	status, 5	;RP0=0, select bank0
	clrf	(main@enumMainLoopStep)
	incf	(main@enumMainLoopStep),f
	goto	l4122
	line	237
	
l706:	
	line	238
;main.c: 237: }
;main.c: 238: break;
	goto	l4122
	line	245
	
l4142:	
;main.c: 242: {
;main.c: 243: static unsigned char ucTimerZeroPoint3s = 0;
;main.c: 245: if(ucTimerZeroPoint3s < 1)
	movf	(main@ucTimerZeroPoint3s),f
	skipz
	goto	u1271
	goto	u1270
u1271:
	goto	l4146
u1270:
	line	247
	
l4144:	
;main.c: 246: {
;main.c: 247: ucTimerZeroPoint3s++;
	incf	(main@ucTimerZeroPoint3s),f
	line	248
;main.c: 248: }
	goto	l4122
	line	251
	
l4146:	
;main.c: 249: else
;main.c: 250: {
;main.c: 251: ucTimerZeroPoint3s = 0;
	clrf	(main@ucTimerZeroPoint3s)
	line	253
	
l4148:	
;main.c: 253: if(getAdOriginalCh14Value() > 1950)
	fcall	_getAdOriginalCh14Value
	movlw	high(079Fh)
	subwf	(1+(?_getAdOriginalCh14Value)),w
	movlw	low(079Fh)
	skipnz
	subwf	(0+(?_getAdOriginalCh14Value)),w
	skipc
	goto	u1281
	goto	u1280
u1281:
	goto	l4152
u1280:
	line	256
	
l4150:	
;main.c: 254: {
;main.c: 256: enumMainLoopStep = MAIN_LOOP_STEP_SECOND;
	movlw	(02h)
	movwf	(main@enumMainLoopStep)
	line	257
;main.c: 257: }
	goto	l4122
	line	260
	
l4152:	
;main.c: 258: else
;main.c: 259: {
;main.c: 260: clearPinPortAndTimer();
	fcall	_clearPinPortAndTimer
	goto	l4122
	line	266
;main.c: 264: }
;main.c: 266: case MAIN_LOOP_STEP_SECOND:
	
l715:	
	line	270
;main.c: 267: {
;main.c: 268: static unsigned char ucTimerP5s = 0;
;main.c: 270: PA6 = 1;
	bsf	(46/8),(46)&7
	line	272
	
l4154:	
;main.c: 272: if(ucTimerP5s < 5)
	movlw	(05h)
	subwf	(main@ucTimerP5s),w
	skipnc
	goto	u1291
	goto	u1290
u1291:
	goto	l4158
u1290:
	line	273
	
l4156:	
;main.c: 273: ucTimerP5s++;
	incf	(main@ucTimerP5s),f
	goto	l4122
	line	276
	
l4158:	
;main.c: 274: else
;main.c: 275: {
;main.c: 276: ucTimerP5s = 0;
	clrf	(main@ucTimerP5s)
	line	278
	
l4160:	
;main.c: 278: enumMainLoopStep = MAIN_LOOP_STEP_THIRD;
	movlw	(03h)
	movwf	(main@enumMainLoopStep)
	goto	l4122
	line	288
	
l4162:	
;main.c: 285: {
;main.c: 286: static unsigned char ucTimerADC1ZeroP5s = 0;
;main.c: 288: if(getAdOriginalCh1Value() < 130)
	fcall	_getAdOriginalCh1Value
	movlw	high(082h)
	subwf	(1+(?_getAdOriginalCh1Value)),w
	movlw	low(082h)
	skipnz
	subwf	(0+(?_getAdOriginalCh1Value)),w
	skipnc
	goto	u1301
	goto	u1300
u1301:
	goto	l4166
u1300:
	line	290
	
l4164:	
;main.c: 289: {
;main.c: 290: ucTimerADC1ZeroP5s = 0;
	clrf	(main@ucTimerADC1ZeroP5s)
	line	292
;main.c: 292: }
	goto	l4168
	line	295
	
l4166:	
;main.c: 293: else
;main.c: 294: {
;main.c: 295: ucTimerADC1ZeroP5s++;
	incf	(main@ucTimerADC1ZeroP5s),f
	line	298
	
l4168:	
;main.c: 296: }
;main.c: 298: if(ucTimerADC1ZeroP5s >= 1)
	movf	(main@ucTimerADC1ZeroP5s),w
	skipz
	goto	u1310
	goto	l4174
u1310:
	line	300
	
l4170:	
;main.c: 299: {
;main.c: 300: ucTimerADC1ZeroP5s = 0;
	clrf	(main@ucTimerADC1ZeroP5s)
	line	301
	
l4172:	
;main.c: 301: enumMainLoopStep = MAIN_LOOP_STEP_FOURTH;
	movlw	(04h)
	movwf	(main@enumMainLoopStep)
	line	302
;main.c: 302: }
	goto	l4122
	line	307
	
l4174:	
;main.c: 303: else
;main.c: 304: {
;main.c: 305: static unsigned char ucTimerRightP5s = 0;
;main.c: 307: if(getAdOriginalCh1Value() < 117)
	fcall	_getAdOriginalCh1Value
	movlw	high(075h)
	subwf	(1+(?_getAdOriginalCh1Value)),w
	movlw	low(075h)
	skipnz
	subwf	(0+(?_getAdOriginalCh1Value)),w
	skipnc
	goto	u1321
	goto	u1320
u1321:
	goto	l4178
u1320:
	line	309
	
l4176:	
;main.c: 308: {
;main.c: 309: ucTimerRightP5s++;
	incf	(main@ucTimerRightP5s),f
	line	310
;main.c: 310: }
	goto	l4180
	line	313
	
l4178:	
;main.c: 311: else
;main.c: 312: {
;main.c: 313: ucTimerRightP5s = 0;
	clrf	(main@ucTimerRightP5s)
	line	316
	
l4180:	
;main.c: 314: }
;main.c: 316: if(ucTimerRightP5s >= 1)
	movf	(main@ucTimerRightP5s),w
	skipz
	goto	u1330
	goto	l706
u1330:
	line	318
	
l4182:	
;main.c: 317: {
;main.c: 318: ucTimerRightP5s = 0;
	clrf	(main@ucTimerRightP5s)
	line	319
	
l4184:	
;main.c: 319: enumMainLoopStep = MAIN_LOOP_STEP_3_HOUR_BRANCH;
	movlw	(08h)
	movwf	(main@enumMainLoopStep)
	line	320
;main.c: 320: }
	goto	l4122
	line	333
	
l4186:	
;main.c: 331: {
;main.c: 333: startTwelveHourTimer(180);
	movlw	0B4h
	movwf	(?_startTwelveHourTimer)
	clrf	(?_startTwelveHourTimer+1)
	fcall	_startTwelveHourTimer
	line	334
	
l4188:	
;main.c: 334: enumMainLoopStep = MAIN_LOOP_STEP_FIFTH;
	movlw	(05h)
	movwf	(main@enumMainLoopStep)
	line	336
;main.c: 336: break;
	goto	l4122
	line	342
	
l4190:	
;main.c: 340: {
;main.c: 342: if(isFinishedTwelveHoursTimer())
	fcall	_isFinishedTwelveHoursTimer
	xorlw	0
	skipnz
	goto	u1341
	goto	u1340
u1341:
	goto	l4510
u1340:
	line	344
	
l4192:	
;main.c: 343: {
;main.c: 344: enumMainLoopStep = MAIN_LOOP_STEP_12_HOUR_END;
	movlw	(09h)
	movwf	(main@enumMainLoopStep)
	line	345
;main.c: 345: }
	goto	l4122
	line	354
	
l4194:	
;main.c: 353: {
;main.c: 354: startTwentySecondsTimer();
	fcall	_startTwentySecondsTimer
	line	355
	
l4196:	
;main.c: 355: ucADC4_Step = ADC4_STEP_FIRST;
	bcf	status, 5	;RP0=0, select bank0
	clrf	(main@ucADC4_Step)
	incf	(main@ucADC4_Step),f
	line	356
;main.c: 356: break;
	goto	l4122
	line	361
	
l4198:	
;main.c: 360: {
;main.c: 361: if(getAdOriginaCh4Value() < 1911)
	fcall	_getAdOriginaCh4Value
	movlw	high(0777h)
	subwf	(1+(?_getAdOriginaCh4Value)),w
	movlw	low(0777h)
	skipnz
	subwf	(0+(?_getAdOriginaCh4Value)),w
	skipnc
	goto	u1351
	goto	u1350
u1351:
	goto	l4202
u1350:
	line	362
	
l4200:	
;main.c: 362: ucChannel4Type = LESS_THAN_1911;
	clrf	(main@ucChannel4Type)
	goto	l744
	line	363
	
l4202:	
;main.c: 363: else if(getAdOriginaCh4Value() < 2067)
	fcall	_getAdOriginaCh4Value
	movlw	high(0813h)
	subwf	(1+(?_getAdOriginaCh4Value)),w
	movlw	low(0813h)
	skipnz
	subwf	(0+(?_getAdOriginaCh4Value)),w
	skipnc
	goto	u1361
	goto	u1360
u1361:
	goto	l4206
u1360:
	line	364
	
l4204:	
;main.c: 364: ucChannel4Type = BETWEEN_1911_AND_2067;
	clrf	(main@ucChannel4Type)
	incf	(main@ucChannel4Type),f
	goto	l744
	line	365
	
l4206:	
;main.c: 365: else if(getAdOriginaCh4Value() < 2204)
	fcall	_getAdOriginaCh4Value
	movlw	high(089Ch)
	subwf	(1+(?_getAdOriginaCh4Value)),w
	movlw	low(089Ch)
	skipnz
	subwf	(0+(?_getAdOriginaCh4Value)),w
	skipnc
	goto	u1371
	goto	u1370
u1371:
	goto	l4210
u1370:
	line	366
	
l4208:	
;main.c: 366: ucChannel4Type = BETWEEN_2067_AND_2204;
	movlw	(02h)
	movwf	(main@ucChannel4Type)
	goto	l744
	line	367
	
l4210:	
;main.c: 367: else if(getAdOriginaCh4Value() < 2340)
	fcall	_getAdOriginaCh4Value
	movlw	high(0924h)
	subwf	(1+(?_getAdOriginaCh4Value)),w
	movlw	low(0924h)
	skipnz
	subwf	(0+(?_getAdOriginaCh4Value)),w
	skipnc
	goto	u1381
	goto	u1380
u1381:
	goto	l4214
u1380:
	line	368
	
l4212:	
;main.c: 368: ucChannel4Type = BETWEEN_2204_AND_2340;
	movlw	(03h)
	movwf	(main@ucChannel4Type)
	goto	l744
	line	370
	
l4214:	
;main.c: 369: else
;main.c: 370: ucChannel4Type = MORE_THAN_2340;
	movlw	(04h)
	movwf	(main@ucChannel4Type)
	
l744:	
	line	372
;main.c: 372: ucADC4_Step = ADC4_STEP_SECOND;
	movlw	(02h)
	movwf	(main@ucADC4_Step)
	line	373
;main.c: 373: break;
	goto	l4122
	line	388
;main.c: 387: {
;main.c: 388: case 0:
	
l759:	
	line	390
;main.c: 389: {
;main.c: 390: PB0 = 1;
	bsf	(48/8),(48)&7
	line	391
	
l4216:	
;main.c: 391: ucLoaderStep++;
	incf	(main@ucLoaderStep),f
	line	392
;main.c: 392: break;
	goto	l4122
	line	397
	
l4218:	
;main.c: 396: {
;main.c: 397: if(ucTimerDelay >= 5)
	movlw	(05h)
	subwf	(main@ucTimerDelay),w
	skipc
	goto	u1391
	goto	u1390
u1391:
	goto	l4226
u1390:
	line	399
	
l4220:	
;main.c: 398: {
;main.c: 399: PA0 = 1;
	bsf	(40/8),(40)&7
	line	400
	
l4222:	
;main.c: 400: ucTimerDelay = 0;
	clrf	(main@ucTimerDelay)
	goto	l4216
	line	404
	
l4226:	
;main.c: 403: else
;main.c: 404: ucTimerDelay++;
	incf	(main@ucTimerDelay),f
	goto	l4122
	line	410
	
l4228:	
;main.c: 409: {
;main.c: 410: if(ucTimerDelay >= 5)
	movlw	(05h)
	subwf	(main@ucTimerDelay),w
	skipc
	goto	u1401
	goto	u1400
u1401:
	goto	l4226
u1400:
	line	412
	
l4230:	
;main.c: 411: {
;main.c: 412: PA1= 1;
	bsf	(41/8),(41)&7
	goto	l4222
	line	424
	
l4238:	
;main.c: 423: {
;main.c: 424: if(ucTimerDelay >= 5)
	movlw	(05h)
	subwf	(main@ucTimerDelay),w
	skipc
	goto	u1411
	goto	u1410
u1411:
	goto	l4226
u1410:
	line	426
	
l4240:	
;main.c: 425: {
;main.c: 426: PA2= 1;
	bsf	(42/8),(42)&7
	goto	l4222
	line	437
	
l4248:	
;main.c: 436: {
;main.c: 437: if(ucTimerDelay >= 5)
	movlw	(05h)
	subwf	(main@ucTimerDelay),w
	skipc
	goto	u1421
	goto	u1420
u1421:
	goto	l4226
u1420:
	line	439
	
l4250:	
;main.c: 438: {
;main.c: 439: PA3 = 1;
	bsf	(43/8),(43)&7
	goto	l4222
	line	450
	
l4258:	
;main.c: 449: {
;main.c: 450: if(ucTimerDelay >= 5)
	movlw	(05h)
	subwf	(main@ucTimerDelay),w
	skipc
	goto	u1431
	goto	u1430
u1431:
	goto	l4226
u1430:
	line	452
	
l4260:	
;main.c: 451: {
;main.c: 452: PB0 = 0;
	bcf	(48/8),(48)&7
	line	453
;main.c: 453: PA0 = 0;
	bcf	(40/8),(40)&7
	line	454
;main.c: 454: PA1 = 0;
	bcf	(41/8),(41)&7
	line	455
;main.c: 455: PA2 = 0;
	bcf	(42/8),(42)&7
	line	456
;main.c: 456: PA3 = 0;
	bcf	(43/8),(43)&7
	goto	l4222
	line	467
	
l4268:	
;main.c: 466: {
;main.c: 467: if(ucTimerDelay >= 2)
	movlw	(02h)
	subwf	(main@ucTimerDelay),w
	skipc
	goto	u1441
	goto	u1440
u1441:
	goto	l4226
u1440:
	line	469
	
l4270:	
;main.c: 468: {
;main.c: 469: ucTimerDelay = 0;
	clrf	(main@ucTimerDelay)
	line	471
;main.c: 471: ucLoaderStep = 0;
	clrf	(main@ucLoaderStep)
	line	472
	
l4272:	
;main.c: 472: ucADC4_Step = ADC4_STEP_THIRD;
	movlw	(03h)
	movwf	(main@ucADC4_Step)
	line	473
;main.c: 473: }
	goto	l4122
	line	386
	
l4278:	
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
movlw high(S4832)
movwf pclath
	clrc
	rlf fsr,w
	addlw low(S4832)
	movwf pc
psect	swtext1,local,class=CONST,delta=2
global __pswtext1
__pswtext1:
S4832:
	ljmp	l759
	ljmp	l4218
	ljmp	l4228
	ljmp	l4238
	ljmp	l4248
	ljmp	l4258
	ljmp	l4268
psect	maintext

	line	493
;main.c: 492: {
;main.c: 493: case 0:
	
l787:	
	line	495
;main.c: 494: {
;main.c: 495: PB0 = 1;
	bsf	(48/8),(48)&7
	line	496
	
l4280:	
;main.c: 496: ucLoaderStep1++;
	incf	(main@ucLoaderStep1),f
	line	497
;main.c: 497: break;
	goto	l4122
	line	502
	
l4282:	
;main.c: 501: {
;main.c: 502: if(ucTimerDelay1 >= 5)
	movlw	(05h)
	subwf	(main@ucTimerDelay1),w
	skipc
	goto	u1451
	goto	u1450
u1451:
	goto	l4290
u1450:
	line	504
	
l4284:	
;main.c: 503: {
;main.c: 504: PA0 = 1;
	bsf	(40/8),(40)&7
	line	505
	
l4286:	
;main.c: 505: ucTimerDelay1 = 0;
	clrf	(main@ucTimerDelay1)
	goto	l4280
	line	509
	
l4290:	
;main.c: 508: else
;main.c: 509: ucTimerDelay1++;
	incf	(main@ucTimerDelay1),f
	goto	l4122
	line	515
	
l4292:	
;main.c: 514: {
;main.c: 515: if(ucTimerDelay1 >= 5)
	movlw	(05h)
	subwf	(main@ucTimerDelay1),w
	skipc
	goto	u1461
	goto	u1460
u1461:
	goto	l4290
u1460:
	line	517
	
l4294:	
;main.c: 516: {
;main.c: 517: PA1= 1;
	bsf	(41/8),(41)&7
	goto	l4286
	line	528
	
l4302:	
;main.c: 527: {
;main.c: 528: if(ucTimerDelay1 >= 5)
	movlw	(05h)
	subwf	(main@ucTimerDelay1),w
	skipc
	goto	u1471
	goto	u1470
u1471:
	goto	l4290
u1470:
	line	530
	
l4304:	
;main.c: 529: {
;main.c: 530: PA2 = 1;
	bsf	(42/8),(42)&7
	goto	l4286
	line	541
	
l4312:	
;main.c: 540: {
;main.c: 541: if(ucTimerDelay1 >= 5)
	movlw	(05h)
	subwf	(main@ucTimerDelay1),w
	skipc
	goto	u1481
	goto	u1480
u1481:
	goto	l4290
u1480:
	line	543
	
l4314:	
;main.c: 542: {
;main.c: 543: PA3 = 1;
	bsf	(43/8),(43)&7
	goto	l4286
	line	554
	
l4322:	
;main.c: 553: {
;main.c: 554: if(ucTimerDelay1 >= 5)
	movlw	(05h)
	subwf	(main@ucTimerDelay1),w
	skipc
	goto	u1491
	goto	u1490
u1491:
	goto	l4290
u1490:
	line	556
	
l4324:	
;main.c: 555: {
;main.c: 556: PA0 = 0;
	bcf	(40/8),(40)&7
	line	557
;main.c: 557: PA1 = 0;
	bcf	(41/8),(41)&7
	line	558
;main.c: 558: PA2 = 0;
	bcf	(42/8),(42)&7
	line	559
;main.c: 559: PA3 = 0;
	bcf	(43/8),(43)&7
	goto	l4286
	line	570
	
l4332:	
;main.c: 569: {
;main.c: 570: if(ucTimerDelay1 >= 2)
	movlw	(02h)
	subwf	(main@ucTimerDelay1),w
	skipc
	goto	u1501
	goto	u1500
u1501:
	goto	l4290
u1500:
	line	572
	
l4334:	
;main.c: 571: {
;main.c: 572: ucTimerDelay1 = 0;
	clrf	(main@ucTimerDelay1)
	line	574
;main.c: 574: ucLoaderStep1 = 0;
	clrf	(main@ucLoaderStep1)
	goto	l4272
	line	491
	
l4342:	
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
movlw high(S4834)
movwf pclath
	clrc
	rlf fsr,w
	addlw low(S4834)
	movwf pc
psect	swtext2,local,class=CONST,delta=2
global __pswtext2
__pswtext2:
S4834:
	ljmp	l787
	ljmp	l4282
	ljmp	l4292
	ljmp	l4302
	ljmp	l4312
	ljmp	l4322
	ljmp	l4332
psect	maintext

	line	597
;main.c: 596: {
;main.c: 597: case 0:
	
l814:	
	line	599
;main.c: 598: {
;main.c: 599: PB0 = 1;
	bsf	(48/8),(48)&7
	line	600
;main.c: 600: PA0 = 1;
	bsf	(40/8),(40)&7
	line	601
	
l4344:	
;main.c: 601: ucLoaderStep2++;
	incf	(main@ucLoaderStep2),f
	line	602
;main.c: 602: break;
	goto	l4122
	line	607
	
l4346:	
;main.c: 606: {
;main.c: 607: if(ucTimerDelay2 >= 5)
	movlw	(05h)
	subwf	(main@ucTimerDelay2),w
	skipc
	goto	u1511
	goto	u1510
u1511:
	goto	l4354
u1510:
	line	609
	
l4348:	
;main.c: 608: {
;main.c: 609: PA1 = 1;
	bsf	(41/8),(41)&7
	line	610
	
l4350:	
;main.c: 610: ucTimerDelay2 = 0;
	clrf	(main@ucTimerDelay2)
	goto	l4344
	line	614
	
l4354:	
;main.c: 613: else
;main.c: 614: ucTimerDelay2++;
	incf	(main@ucTimerDelay2),f
	goto	l4122
	line	620
	
l4356:	
;main.c: 619: {
;main.c: 620: if(ucTimerDelay2 >= 5)
	movlw	(05h)
	subwf	(main@ucTimerDelay2),w
	skipc
	goto	u1521
	goto	u1520
u1521:
	goto	l4354
u1520:
	line	622
	
l4358:	
;main.c: 621: {
;main.c: 622: PA2 = 1;
	bsf	(42/8),(42)&7
	goto	l4350
	line	633
	
l4366:	
;main.c: 632: {
;main.c: 633: if(ucTimerDelay2 >= 5)
	movlw	(05h)
	subwf	(main@ucTimerDelay2),w
	skipc
	goto	u1531
	goto	u1530
u1531:
	goto	l4354
u1530:
	line	635
	
l4368:	
;main.c: 634: {
;main.c: 635: PA3 = 1;
	bsf	(43/8),(43)&7
	goto	l4350
	line	646
	
l4376:	
;main.c: 645: {
;main.c: 646: if(ucTimerDelay2 >= 5)
	movlw	(05h)
	subwf	(main@ucTimerDelay2),w
	skipc
	goto	u1541
	goto	u1540
u1541:
	goto	l4354
u1540:
	line	649
	
l4378:	
;main.c: 647: {
;main.c: 649: PA1 = 0;
	bcf	(41/8),(41)&7
	line	650
;main.c: 650: PA2 = 0;
	bcf	(42/8),(42)&7
	line	651
;main.c: 651: PA3 = 0;
	bcf	(43/8),(43)&7
	goto	l4350
	line	662
	
l4386:	
;main.c: 661: {
;main.c: 662: if(ucTimerDelay2 >= 2)
	movlw	(02h)
	subwf	(main@ucTimerDelay2),w
	skipc
	goto	u1551
	goto	u1550
u1551:
	goto	l4354
u1550:
	line	664
	
l4388:	
;main.c: 663: {
;main.c: 664: ucTimerDelay2 = 0;
	clrf	(main@ucTimerDelay2)
	line	666
;main.c: 666: ucLoaderStep2 = 0;
	clrf	(main@ucLoaderStep2)
	goto	l4272
	line	595
	
l4396:	
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
movlw high(S4836)
movwf pclath
	clrc
	rlf fsr,w
	addlw low(S4836)
	movwf pc
psect	swtext3,local,class=CONST,delta=2
global __pswtext3
__pswtext3:
S4836:
	ljmp	l814
	ljmp	l4346
	ljmp	l4356
	ljmp	l4366
	ljmp	l4376
	ljmp	l4386
psect	maintext

	line	689
;main.c: 688: {
;main.c: 689: case 0:
	
l838:	
	line	691
;main.c: 690: {
;main.c: 691: PB0 = 1;
	bsf	(48/8),(48)&7
	line	692
;main.c: 692: PA0 = 1;
	bsf	(40/8),(40)&7
	line	693
;main.c: 693: PA1 = 1;
	bsf	(41/8),(41)&7
	line	694
	
l4398:	
;main.c: 694: ucLoaderStep3++;
	incf	(main@ucLoaderStep3),f
	line	695
;main.c: 695: break;
	goto	l4122
	line	700
	
l4400:	
;main.c: 699: {
;main.c: 700: if(ucTimerDelay3 >= 5)
	movlw	(05h)
	subwf	(main@ucTimerDelay3),w
	skipc
	goto	u1561
	goto	u1560
u1561:
	goto	l4408
u1560:
	line	702
	
l4402:	
;main.c: 701: {
;main.c: 702: PA2 = 1;
	bsf	(42/8),(42)&7
	line	703
	
l4404:	
;main.c: 703: ucTimerDelay3 = 0;
	clrf	(main@ucTimerDelay3)
	goto	l4398
	line	707
	
l4408:	
;main.c: 706: else
;main.c: 707: ucTimerDelay3++;
	incf	(main@ucTimerDelay3),f
	goto	l4122
	line	713
	
l4410:	
;main.c: 712: {
;main.c: 713: if(ucTimerDelay3 >= 5)
	movlw	(05h)
	subwf	(main@ucTimerDelay3),w
	skipc
	goto	u1571
	goto	u1570
u1571:
	goto	l4408
u1570:
	line	715
	
l4412:	
;main.c: 714: {
;main.c: 715: PA3 = 1;
	bsf	(43/8),(43)&7
	goto	l4404
	line	727
	
l4420:	
;main.c: 726: {
;main.c: 727: if(ucTimerDelay3 >= 5)
	movlw	(05h)
	subwf	(main@ucTimerDelay3),w
	skipc
	goto	u1581
	goto	u1580
u1581:
	goto	l4408
u1580:
	line	730
	
l4422:	
;main.c: 728: {
;main.c: 730: PA2 = 0;
	bcf	(42/8),(42)&7
	line	731
;main.c: 731: PA3 = 0;
	bcf	(43/8),(43)&7
	goto	l4404
	line	742
	
l4430:	
;main.c: 741: {
;main.c: 742: if(ucTimerDelay3 >= 2)
	movlw	(02h)
	subwf	(main@ucTimerDelay3),w
	skipc
	goto	u1591
	goto	u1590
u1591:
	goto	l4408
u1590:
	line	744
	
l4432:	
;main.c: 743: {
;main.c: 744: ucTimerDelay3 = 0;
	clrf	(main@ucTimerDelay3)
	line	746
;main.c: 746: ucLoaderStep3 = 0;
	clrf	(main@ucLoaderStep3)
	goto	l4272
	line	687
	
l4440:	
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
	goto	l838
	xorlw	1^0	; case 1
	skipnz
	goto	l4400
	xorlw	2^1	; case 2
	skipnz
	goto	l4410
	xorlw	3^2	; case 3
	skipnz
	goto	l4420
	xorlw	4^3	; case 4
	skipnz
	goto	l4430
	goto	l706
	opt asmopt_on

	line	769
;main.c: 768: {
;main.c: 769: case 0:
	
l859:	
	line	771
;main.c: 770: {
;main.c: 771: PB0 = 1;
	bsf	(48/8),(48)&7
	line	772
;main.c: 772: PA0 = 1;
	bsf	(40/8),(40)&7
	line	773
;main.c: 773: PA1 = 1;
	bsf	(41/8),(41)&7
	line	774
;main.c: 774: PA2 = 1;
	bsf	(42/8),(42)&7
	line	775
	
l4442:	
;main.c: 775: ucLoaderStep4++;
	incf	(main@ucLoaderStep4),f
	line	776
;main.c: 776: break;
	goto	l4122
	line	781
	
l4444:	
;main.c: 780: {
;main.c: 781: if(ucTimerDelay4 >= 5)
	movlw	(05h)
	subwf	(main@ucTimerDelay4),w
	skipc
	goto	u1601
	goto	u1600
u1601:
	goto	l4452
u1600:
	line	783
	
l4446:	
;main.c: 782: {
;main.c: 783: PA3 = 1;
	bsf	(43/8),(43)&7
	line	784
	
l4448:	
;main.c: 784: ucTimerDelay4 = 0;
	clrf	(main@ucTimerDelay4)
	goto	l4442
	line	788
	
l4452:	
;main.c: 787: else
;main.c: 788: ucTimerDelay4++;
	incf	(main@ucTimerDelay4),f
	goto	l4122
	line	794
	
l4454:	
;main.c: 793: {
;main.c: 794: if(ucTimerDelay4 >= 5)
	movlw	(05h)
	subwf	(main@ucTimerDelay4),w
	skipc
	goto	u1611
	goto	u1610
u1611:
	goto	l4452
u1610:
	line	796
	
l4456:	
;main.c: 795: {
;main.c: 796: PA3 = 0;
	bcf	(43/8),(43)&7
	goto	l4448
	line	807
	
l4464:	
;main.c: 806: {
;main.c: 807: if(ucTimerDelay4 >= 2)
	movlw	(02h)
	subwf	(main@ucTimerDelay4),w
	skipc
	goto	u1621
	goto	u1620
u1621:
	goto	l4452
u1620:
	line	809
	
l4466:	
;main.c: 808: {
;main.c: 809: ucTimerDelay4 = 0;
	clrf	(main@ucTimerDelay4)
	line	811
;main.c: 811: ucLoaderStep4 = 0;
	clrf	(main@ucLoaderStep4)
	goto	l4272
	line	767
	
l4474:	
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
	goto	l859
	xorlw	1^0	; case 1
	skipnz
	goto	l4444
	xorlw	2^1	; case 2
	skipnz
	goto	l4454
	xorlw	3^2	; case 3
	skipnz
	goto	l4464
	goto	l706
	opt asmopt_on

	line	378
	
l4478:	
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
	goto	l4278
	xorlw	1^0	; case 1
	skipnz
	goto	l4342
	xorlw	2^1	; case 2
	skipnz
	goto	l4396
	xorlw	3^2	; case 3
	skipnz
	goto	l4440
	xorlw	4^3	; case 4
	skipnz
	goto	l4474
	goto	l706
	opt asmopt_on

	line	838
	
l4480:	
;main.c: 835: {
;main.c: 836: static unsigned char ucTimerDelayP5s = 0;
;main.c: 838: if(isFinishedTwentySecondsTimer())
	fcall	_isFinishedTwentySecondsTimer
	xorlw	0
	skipnz
	goto	u1631
	goto	u1630
u1631:
	goto	l4196
u1630:
	line	840
	
l4482:	
;main.c: 839: {
;main.c: 840: PBOD6 =0;
	bsf	status, 6	;RP1=1, select bank3
	bcf	(3142/8)^0180h,(3142)&7
	line	841
;main.c: 841: PB6 = 1;
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	bsf	(54/8),(54)&7
	line	842
;main.c: 842: PA6 = 0;
	bcf	(46/8),(46)&7
	line	849
	
l4484:	
;main.c: 849: if(ucTimerDelayP5s < 5)
	movlw	(05h)
	subwf	(main@ucTimerDelayP5s),w
	skipnc
	goto	u1641
	goto	u1640
u1641:
	goto	l4488
u1640:
	line	851
	
l4486:	
;main.c: 850: {
;main.c: 851: ucTimerDelayP5s++;
	incf	(main@ucTimerDelayP5s),f
	line	852
;main.c: 852: }
	goto	l4122
	line	856
	
l4488:	
;main.c: 853: else
;main.c: 854: {
;main.c: 856: ucTimerDelayP5s = 0;
	clrf	(main@ucTimerDelayP5s)
	line	858
	
l4490:	
;main.c: 858: if((getAdOriginalCh14Value() > 2800))
	fcall	_getAdOriginalCh14Value
	movlw	high(0AF1h)
	subwf	(1+(?_getAdOriginalCh14Value)),w
	movlw	low(0AF1h)
	skipnz
	subwf	(0+(?_getAdOriginalCh14Value)),w
	skipc
	goto	u1651
	goto	u1650
u1651:
	goto	l4494
u1650:
	line	859
	
l4492:	
;main.c: 859: DACR0=0x0F;
	movlw	(0Fh)
	bsf	status, 5	;RP0=1, select bank1
	movwf	(136)^080h	;volatile
	goto	l879
	line	861
	
l4494:	
;main.c: 860: else
;main.c: 861: DACR0=0x07;
	movlw	(07h)
	bsf	status, 5	;RP0=1, select bank1
	movwf	(136)^080h	;volatile
	
l879:	
	line	863
;main.c: 863: ucADC4_Step = ADC4_STEP_FOURTH;
	movlw	(04h)
	bcf	status, 5	;RP0=0, select bank0
	movwf	(main@ucADC4_Step)
	goto	l4122
	line	875
	
l4496:	
;main.c: 873: {
;main.c: 874: static unsigned char ucTimer1s = 0;
;main.c: 875: if(ucTimer1s < 5)
	movlw	(05h)
	subwf	(main@ucTimer1s),w
	skipnc
	goto	u1661
	goto	u1660
u1661:
	goto	l4500
u1660:
	line	877
	
l4498:	
;main.c: 876: {
;main.c: 877: ucTimer1s++;
	incf	(main@ucTimer1s),f
	line	878
;main.c: 878: }
	goto	l4122
	line	881
	
l4500:	
;main.c: 879: else
;main.c: 880: {
;main.c: 881: ucTimer1s = 0;
	clrf	(main@ucTimer1s)
	line	882
	
l4502:	
;main.c: 882: PB6 = 1;
	bsf	(54/8),(54)&7
	line	883
	
l4504:	
;main.c: 883: PBOD6 = 1;
	bsf	status, 5	;RP0=1, select bank3
	bsf	status, 6	;RP1=1, select bank3
	bsf	(3142/8)^0180h,(3142)&7
	line	884
	
l4506:	
;main.c: 884: enumMainLoopStep = MAIN_LOOP_STEP_FIRST;
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	clrf	(main@enumMainLoopStep)
	incf	(main@enumMainLoopStep),f
	line	885
;main.c: 885: ucADC4_Step = ADC4_STEP_INIT;
	clrf	(main@ucADC4_Step)
	goto	l4122
	line	350
	
l4510:	
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
	goto	l4194
	xorlw	1^0	; case 1
	skipnz
	goto	l4198
	xorlw	2^1	; case 2
	skipnz
	goto	l4478
	xorlw	3^2	; case 3
	skipnz
	goto	l4480
	xorlw	4^3	; case 4
	skipnz
	goto	l4496
	goto	l706
	opt asmopt_on

	line	912
;main.c: 911: {
;main.c: 912: case HOUR_3_BRANCH_STEP_FIRST:
	
l891:	
	line	914
;main.c: 913: {
;main.c: 914: PA7 = 1;
	bsf	(47/8),(47)&7
	line	915
;main.c: 915: PAOD7 = 1;
	bsf	status, 5	;RP0=1, select bank3
	bsf	status, 6	;RP1=1, select bank3
	bsf	(3135/8)^0180h,(3135)&7
	line	916
	
l4512:	
;main.c: 916: startThreeHoursTimer(60);
	movlw	03Ch
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	movwf	(?_startThreeHoursTimer)
	clrf	(?_startThreeHoursTimer+1)
	fcall	_startThreeHoursTimer
	line	918
	
l4514:	
;main.c: 918: enumBranchStep = HOUR_3_BRANCH_STEP_SECOND;
	clrf	(main@enumBranchStep)
	incf	(main@enumBranchStep),f
	line	919
;main.c: 919: break;
	goto	l4122
	line	926
	
l4516:	
;main.c: 923: {
;main.c: 924: static unsigned char ucTimer20s = 0;
;main.c: 926: if(ucTimer20s < 200)
	movlw	(0C8h)
	subwf	(main@ucTimer20s),w
	skipnc
	goto	u1671
	goto	u1670
u1671:
	goto	l4530
u1670:
	line	928
	
l4518:	
;main.c: 927: {
;main.c: 928: ucTimer20s++;
	incf	(main@ucTimer20s),f
	line	929
	
l4520:	
;main.c: 929: PB0 = 1;
	bsf	(48/8),(48)&7
	line	930
	
l4522:	
;main.c: 930: PA0 = 1;
	bsf	(40/8),(40)&7
	line	931
	
l4524:	
;main.c: 931: PA1 = 1;
	bsf	(41/8),(41)&7
	line	932
	
l4526:	
;main.c: 932: PA2 = 1;
	bsf	(42/8),(42)&7
	line	933
	
l4528:	
;main.c: 933: PA3 = 1;
	bsf	(43/8),(43)&7
	line	934
;main.c: 934: }
	goto	l4122
	line	938
	
l4530:	
;main.c: 935: else
;main.c: 936: {
;main.c: 938: ucTimer20s = 0;
	clrf	(main@ucTimer20s)
	line	941
	
l4532:	
;main.c: 941: enumBranchStep = HOUR_3_BRANCH_STEP_THIRD;
	movlw	(02h)
	movwf	(main@enumBranchStep)
	goto	l4122
	line	946
;main.c: 944: }
;main.c: 946: case HOUR_3_BRANCH_STEP_THIRD:
	
l898:	
	line	948
;main.c: 947: {
;main.c: 948: PA6 = 0;
	bcf	(46/8),(46)&7
	line	950
	
l4534:	
;main.c: 950: if(isFinishedThreeHoursTimer())
	fcall	_isFinishedThreeHoursTimer
	xorlw	0
	skipnz
	goto	u1681
	goto	u1680
u1681:
	goto	l4540
u1680:
	line	952
	
l4536:	
;main.c: 951: {
;main.c: 952: enumBranchStep = HOUR_3_BRANCH_STEP_FIRST;
	clrf	(main@enumBranchStep)
	goto	l4192
	line	959
	
l4540:	
;main.c: 955: else
;main.c: 956: {
;main.c: 957: static unsigned char ucTimerX1P5s = 0;
;main.c: 959: if(getAdOriginalCh1Value() < 130)
	fcall	_getAdOriginalCh1Value
	movlw	high(082h)
	subwf	(1+(?_getAdOriginalCh1Value)),w
	movlw	low(082h)
	skipnz
	subwf	(0+(?_getAdOriginalCh1Value)),w
	skipnc
	goto	u1691
	goto	u1690
u1691:
	goto	l4544
u1690:
	line	961
	
l4542:	
;main.c: 960: {
;main.c: 961: ucTimerX1P5s = 0;
	clrf	(main@ucTimerX1P5s)
	line	962
;main.c: 962: }
	goto	l4546
	line	965
	
l4544:	
;main.c: 963: else
;main.c: 964: {
;main.c: 965: ucTimerX1P5s++;
	incf	(main@ucTimerX1P5s),f
	line	968
	
l4546:	
;main.c: 966: }
;main.c: 968: if(ucTimerX1P5s >= 1)
	movf	(main@ucTimerX1P5s),w
	skipz
	goto	u1700
	goto	l4560
u1700:
	line	970
	
l4548:	
;main.c: 969: {
;main.c: 970: ucTimerX1P5s = 0;
	clrf	(main@ucTimerX1P5s)
	line	971
	
l4550:	
;main.c: 971: PAOD7 = 0;
	bsf	status, 5	;RP0=1, select bank3
	bsf	status, 6	;RP1=1, select bank3
	bcf	(3135/8)^0180h,(3135)&7
	line	972
	
l4552:	
;main.c: 972: PA7 = 0;
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	bcf	(47/8),(47)&7
	line	973
	
l4554:	
;main.c: 973: clearThreeHoursTimer();
	fcall	_clearThreeHoursTimer
	line	975
	
l4556:	
;main.c: 975: enumBranchStep = HOUR_3_BRANCH_STEP_FIRST;
	clrf	(main@enumBranchStep)
	goto	l4150
	line	983
	
l4560:	
;main.c: 979: else
;main.c: 980: {
;main.c: 981: static unsigned char ucTimerX2P5s = 0;
;main.c: 983: if(getAdOriginalCh14Value() >= 1950)
	fcall	_getAdOriginalCh14Value
	movlw	high(079Eh)
	subwf	(1+(?_getAdOriginalCh14Value)),w
	movlw	low(079Eh)
	skipnz
	subwf	(0+(?_getAdOriginalCh14Value)),w
	skipc
	goto	u1711
	goto	u1710
u1711:
	goto	l4564
u1710:
	line	985
	
l4562:	
;main.c: 984: {
;main.c: 985: ucTimerX2P5s++;
	incf	(main@ucTimerX2P5s),f
	line	986
;main.c: 986: }
	goto	l4566
	line	989
	
l4564:	
;main.c: 987: else
;main.c: 988: {
;main.c: 989: ucTimerX2P5s = 0;
	clrf	(main@ucTimerX2P5s)
	line	992
	
l4566:	
;main.c: 990: }
;main.c: 992: if(ucTimerX2P5s >= 1)
	movf	(main@ucTimerX2P5s),w
	skipz
	goto	u1720
	goto	l4570
u1720:
	line	994
	
l4568:	
;main.c: 993: {
;main.c: 994: ucTimerX2P5s = 0;
	clrf	(main@ucTimerX2P5s)
	line	995
;main.c: 995: }
	goto	l4122
	line	998
	
l4570:	
;main.c: 996: else
;main.c: 997: {
;main.c: 998: clearPinPortAndTimer();
	fcall	_clearPinPortAndTimer
	goto	l4140
	line	910
	
l4576:	
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
	goto	l891
	xorlw	1^0	; case 1
	skipnz
	goto	l4516
	xorlw	2^1	; case 2
	skipnz
	goto	l898
	goto	l706
	opt asmopt_on

	line	1029
;main.c: 1028: {
;main.c: 1029: case INTERNAL_FIRST_STEP:
	
l918:	
	line	1031
;main.c: 1030: {
;main.c: 1031: PB0 = 0;
	bcf	(48/8),(48)&7
	line	1032
;main.c: 1032: PB1 = 0;
	bcf	(49/8),(49)&7
	line	1033
;main.c: 1033: PA0 = 0;
	bcf	(40/8),(40)&7
	line	1034
;main.c: 1034: PA1 = 0;
	bcf	(41/8),(41)&7
	line	1035
;main.c: 1035: PA2 = 0;
	bcf	(42/8),(42)&7
	line	1036
;main.c: 1036: PA3 = 0;
	bcf	(43/8),(43)&7
	line	1037
;main.c: 1037: PBOD6 = 0;
	bsf	status, 5	;RP0=1, select bank3
	bsf	status, 6	;RP1=1, select bank3
	bcf	(3142/8)^0180h,(3142)&7
	line	1038
;main.c: 1038: PB6 = 1;
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	bsf	(54/8),(54)&7
	line	1039
;main.c: 1039: PA6 =0;
	bcf	(46/8),(46)&7
	line	1041
;main.c: 1041: enumInteralStep = INTERNAL_SECOND_STEP;
	clrf	(main@enumInteralStep)
	incf	(main@enumInteralStep),f
	line	1042
;main.c: 1042: break;
	goto	l4122
	line	1049
	
l4578:	
;main.c: 1046: {
;main.c: 1047: static unsigned char ucTimer1s = 0;
;main.c: 1049: if(getAdOriginalCh14Value() <= 1000)
	fcall	_getAdOriginalCh14Value
	movlw	high(03E9h)
	subwf	(1+(?_getAdOriginalCh14Value)),w
	movlw	low(03E9h)
	skipnz
	subwf	(0+(?_getAdOriginalCh14Value)),w
	skipnc
	goto	u1731
	goto	u1730
u1731:
	goto	l4582
u1730:
	line	1051
	
l4580:	
;main.c: 1050: {
;main.c: 1051: ucTimer1s++;
	incf	(main@cTimer1s_811),f
	line	1052
;main.c: 1052: }
	goto	l4584
	line	1054
	
l4582:	
;main.c: 1053: else
;main.c: 1054: ucTimer1s = 0;
	clrf	(main@cTimer1s_811)
	line	1056
	
l4584:	
;main.c: 1056: if(ucTimer1s >= 10)
	movlw	(0Ah)
	subwf	(main@cTimer1s_811),w
	skipc
	goto	u1741
	goto	u1740
u1741:
	goto	l706
u1740:
	line	1058
	
l4586:	
;main.c: 1057: {
;main.c: 1058: enumInteralStep = INTERNAL_THIRD_STEP;
	movlw	(02h)
	movwf	(main@enumInteralStep)
	line	1059
	
l4588:	
;main.c: 1059: ucTimer1s = 0;
	clrf	(main@cTimer1s_811)
	goto	l4122
	line	1068
	
l4590:	
;main.c: 1065: {
;main.c: 1066: static unsigned char ucTimerP3s = 0;
;main.c: 1068: if(getAdOriginalCh14Value() >= 1950)
	fcall	_getAdOriginalCh14Value
	movlw	high(079Eh)
	subwf	(1+(?_getAdOriginalCh14Value)),w
	movlw	low(079Eh)
	skipnz
	subwf	(0+(?_getAdOriginalCh14Value)),w
	skipc
	goto	u1751
	goto	u1750
u1751:
	goto	l4594
u1750:
	line	1070
	
l4592:	
;main.c: 1069: {
;main.c: 1070: ucTimerP3s++;
	incf	(main@ucTimerP3s),f
	line	1071
;main.c: 1071: }
	goto	l4596
	line	1073
	
l4594:	
;main.c: 1072: else
;main.c: 1073: ucTimerP3s = 0;
	clrf	(main@ucTimerP3s)
	line	1075
	
l4596:	
;main.c: 1075: if(ucTimerP3s >= 3)
	movlw	(03h)
	subwf	(main@ucTimerP3s),w
	skipc
	goto	u1761
	goto	u1760
u1761:
	goto	l706
u1760:
	line	1077
	
l4598:	
;main.c: 1076: {
;main.c: 1077: enumInteralStep = INTERNAL_FIRST_STEP;
	clrf	(main@enumInteralStep)
	line	1078
;main.c: 1078: ucTimerP3s = 0;
	clrf	(main@ucTimerP3s)
	line	1079
	
l4600:	
;main.c: 1079: clearAllTimer();
	fcall	_clearAllTimer
	line	1081
	
l4602:	
;main.c: 1081: DACR0=0x0F;
	movlw	(0Fh)
	movwf	(136)^080h	;volatile
	line	1082
	
l4604:	
;main.c: 1082: initPin();
	fcall	_initPin
	line	1085
	
l4606:	
;main.c: 1085: enumMainLoopStep = MAIN_LOOP_STEP_INIT;
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	clrf	(main@enumMainLoopStep)
	goto	l4122
	line	1027
	
l4610:	
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
	goto	l918
	xorlw	1^0	; case 1
	skipnz
	goto	l4578
	xorlw	2^1	; case 2
	skipnz
	goto	l4590
	goto	l706
	opt asmopt_on

	line	221
	
l4614:	
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
	goto	l4130
	xorlw	1^0	; case 1
	skipnz
	goto	l4142
	xorlw	2^1	; case 2
	skipnz
	goto	l715
	xorlw	3^2	; case 3
	skipnz
	goto	l4162
	xorlw	4^3	; case 4
	skipnz
	goto	l4186
	xorlw	5^4	; case 5
	skipnz
	goto	l4190
	xorlw	8^5	; case 8
	skipnz
	goto	l4576
	xorlw	9^8	; case 9
	skipnz
	goto	l4610
	goto	l706
	opt asmopt_on

	global	start
	ljmp	start
	opt stack 0
psect	maintext
	line	1106
GLOBAL	__end_of_main
	__end_of_main:
;; =============== function _main ends ============

	signat	_main,88
	global	_clearPinPortAndTimer
psect	text704,local,class=CODE,delta=2
global __ptext704
__ptext704:

;; *************** function _clearPinPortAndTimer *****************
;; Defined at:
;;		line 92 in file "D:\develop\ATK\AK7030-OTP\main.c"
;; Parameters:    Size  Location     Type
;;		None
;; Auto vars:     Size  Location     Type
;;		None
;; Return value:  Size  Location     Type
;;		None               void
;; Registers used:
;;		status,2, status,0, pclath, cstack
;; Tracked objects:
;;		On entry : 160/0
;;		On exit  : 160/20
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
;;		_clearAllTimer
;; This function is called by:
;;		_main
;; This function uses a non-reentrant model
;;
psect	text704
	file	"D:\develop\ATK\AK7030-OTP\main.c"
	line	92
	global	__size_of_clearPinPortAndTimer
	__size_of_clearPinPortAndTimer	equ	__end_of_clearPinPortAndTimer-_clearPinPortAndTimer
	
_clearPinPortAndTimer:	
	opt	stack 3
; Regs used in _clearPinPortAndTimer: [status,2+status,0+pclath+cstack]
	line	93
	
l4096:	
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
	
l4098:	
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
	global	_getAdOriginaCh4Value
psect	text705,local,class=CODE,delta=2
global __ptext705
__ptext705:

;; *************** function _getAdOriginaCh4Value *****************
;; Defined at:
;;		line 229 in file "D:\develop\ATK\AK7030-OTP\common.c"
;; Parameters:    Size  Location     Type
;;		None
;; Auto vars:     Size  Location     Type
;;		None
;; Return value:  Size  Location     Type
;;                  2   39[BANK0 ] unsigned int 
;; Registers used:
;;		wreg, fsr0l, fsr0h, status,2, status,0, btemp+1, pclath, cstack
;; Tracked objects:
;;		On entry : 60/0
;;		On exit  : 160/0
;;		Unchanged: FFE00/0
;; Data sizes:     COMMON   BANK0   BANK1   BANK3   BANK2
;;      Params:         0       2       0       0       0
;;      Locals:         0       0       0       0       0
;;      Temps:          0       0       0       0       0
;;      Totals:         0       2       0       0       0
;;Total ram usage:        2 bytes
;; Hardware stack levels used:    1
;; Hardware stack levels required when called:    3
;; This function calls:
;;		_Filter
;; This function is called by:
;;		_main
;; This function uses a non-reentrant model
;;
psect	text705
	file	"D:\develop\ATK\AK7030-OTP\common.c"
	line	229
	global	__size_of_getAdOriginaCh4Value
	__size_of_getAdOriginaCh4Value	equ	__end_of_getAdOriginaCh4Value-_getAdOriginaCh4Value
	
_getAdOriginaCh4Value:	
	opt	stack 4
; Regs used in _getAdOriginaCh4Value: [wreg-fsr0h+status,2+status,0+btemp+1+pclath+cstack]
	line	231
	
l4092:	
;common.c: 231: return Filter(uiSampleChannelFourth);
	movlw	(_uiSampleChannelFourth)&0ffh
	fcall	_Filter
	movf	(1+(?_Filter)),w
	movwf	(?_getAdOriginaCh4Value+1)
	movf	(0+(?_Filter)),w
	movwf	(?_getAdOriginaCh4Value)
	line	236
	
l1652:	
	return
	opt stack 0
GLOBAL	__end_of_getAdOriginaCh4Value
	__end_of_getAdOriginaCh4Value:
;; =============== function _getAdOriginaCh4Value ends ============

	signat	_getAdOriginaCh4Value,90
	global	_getAdOriginalCh1Value
psect	text706,local,class=CODE,delta=2
global __ptext706
__ptext706:

;; *************** function _getAdOriginalCh1Value *****************
;; Defined at:
;;		line 217 in file "D:\develop\ATK\AK7030-OTP\common.c"
;; Parameters:    Size  Location     Type
;;		None
;; Auto vars:     Size  Location     Type
;;		None
;; Return value:  Size  Location     Type
;;                  2   39[BANK0 ] unsigned int 
;; Registers used:
;;		wreg, fsr0l, fsr0h, status,2, status,0, btemp+1, pclath, cstack
;; Tracked objects:
;;		On entry : 60/0
;;		On exit  : 160/0
;;		Unchanged: FFE00/0
;; Data sizes:     COMMON   BANK0   BANK1   BANK3   BANK2
;;      Params:         0       2       0       0       0
;;      Locals:         0       0       0       0       0
;;      Temps:          0       0       0       0       0
;;      Totals:         0       2       0       0       0
;;Total ram usage:        2 bytes
;; Hardware stack levels used:    1
;; Hardware stack levels required when called:    3
;; This function calls:
;;		_Filter
;; This function is called by:
;;		_main
;; This function uses a non-reentrant model
;;
psect	text706
	file	"D:\develop\ATK\AK7030-OTP\common.c"
	line	217
	global	__size_of_getAdOriginalCh1Value
	__size_of_getAdOriginalCh1Value	equ	__end_of_getAdOriginalCh1Value-_getAdOriginalCh1Value
	
_getAdOriginalCh1Value:	
	opt	stack 4
; Regs used in _getAdOriginalCh1Value: [wreg-fsr0h+status,2+status,0+btemp+1+pclath+cstack]
	line	220
	
l4088:	
;common.c: 220: return Filter(uiSampleChannelFirst);
	movlw	(_uiSampleChannelFirst)&0ffh
	fcall	_Filter
	movf	(1+(?_Filter)),w
	movwf	(?_getAdOriginalCh1Value+1)
	movf	(0+(?_Filter)),w
	movwf	(?_getAdOriginalCh1Value)
	line	225
	
l1649:	
	return
	opt stack 0
GLOBAL	__end_of_getAdOriginalCh1Value
	__end_of_getAdOriginalCh1Value:
;; =============== function _getAdOriginalCh1Value ends ============

	signat	_getAdOriginalCh1Value,90
	global	_getAdOriginalCh14Value
psect	text707,local,class=CODE,delta=2
global __ptext707
__ptext707:

;; *************** function _getAdOriginalCh14Value *****************
;; Defined at:
;;		line 240 in file "D:\develop\ATK\AK7030-OTP\common.c"
;; Parameters:    Size  Location     Type
;;		None
;; Auto vars:     Size  Location     Type
;;		None
;; Return value:  Size  Location     Type
;;                  2   39[BANK0 ] unsigned int 
;; Registers used:
;;		wreg, fsr0l, fsr0h, status,2, status,0, btemp+1, pclath, cstack
;; Tracked objects:
;;		On entry : 60/0
;;		On exit  : 160/0
;;		Unchanged: FFE00/0
;; Data sizes:     COMMON   BANK0   BANK1   BANK3   BANK2
;;      Params:         0       2       0       0       0
;;      Locals:         0       0       0       0       0
;;      Temps:          0       0       0       0       0
;;      Totals:         0       2       0       0       0
;;Total ram usage:        2 bytes
;; Hardware stack levels used:    1
;; Hardware stack levels required when called:    3
;; This function calls:
;;		_Filter
;; This function is called by:
;;		_main
;; This function uses a non-reentrant model
;;
psect	text707
	file	"D:\develop\ATK\AK7030-OTP\common.c"
	line	240
	global	__size_of_getAdOriginalCh14Value
	__size_of_getAdOriginalCh14Value	equ	__end_of_getAdOriginalCh14Value-_getAdOriginalCh14Value
	
_getAdOriginalCh14Value:	
	opt	stack 4
; Regs used in _getAdOriginalCh14Value: [wreg-fsr0h+status,2+status,0+btemp+1+pclath+cstack]
	line	242
	
l4084:	
;common.c: 242: return Filter(uiSampleChannelFourteenth);
	movlw	(_uiSampleChannelFourteenth)&0ffh
	fcall	_Filter
	movf	(1+(?_Filter)),w
	movwf	(?_getAdOriginalCh14Value+1)
	movf	(0+(?_Filter)),w
	movwf	(?_getAdOriginalCh14Value)
	line	246
	
l1655:	
	return
	opt stack 0
GLOBAL	__end_of_getAdOriginalCh14Value
	__end_of_getAdOriginalCh14Value:
;; =============== function _getAdOriginalCh14Value ends ============

	signat	_getAdOriginalCh14Value,90
	global	_process_AD_Converter_Value
psect	text708,local,class=CODE,delta=2
global __ptext708
__ptext708:

;; *************** function _process_AD_Converter_Value *****************
;; Defined at:
;;		line 251 in file "D:\develop\ATK\AK7030-OTP\common.c"
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
;;      Temps:          0       0       0       0       0
;;      Totals:         0       0       0       0       0
;;Total ram usage:        0 bytes
;; Hardware stack levels used:    1
;; Hardware stack levels required when called:    3
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
psect	text708
	file	"D:\develop\ATK\AK7030-OTP\common.c"
	line	251
	global	__size_of_process_AD_Converter_Value
	__size_of_process_AD_Converter_Value	equ	__end_of_process_AD_Converter_Value-_process_AD_Converter_Value
	
_process_AD_Converter_Value:	
	opt	stack 4
; Regs used in _process_AD_Converter_Value: [wreg+status,2+status,0+pclath+cstack]
	line	252
	
l4068:	
;common.c: 252: if(getAD_ConvertFlag())
	fcall	_getAD_ConvertFlag
	xorlw	0
	skipnz
	goto	u1211
	goto	u1210
u1211:
	goto	l1663
u1210:
	line	254
	
l4070:	
;common.c: 253: {
;common.c: 254: setAD_ConvertFlag(0);
	movlw	(0)
	fcall	_setAD_ConvertFlag
	line	255
;common.c: 255: AD_Sample();
	fcall	_AD_Sample
	line	256
	
l4072:	
;common.c: 256: if(4 == sampleChannelSelect)
	movf	(_sampleChannelSelect),w
	xorlw	04h
	skipz
	goto	u1221
	goto	u1220
u1221:
	goto	l4076
u1220:
	line	257
	
l4074:	
;common.c: 257: adc_test_init(4,3);
	movlw	(03h)
	movwf	(?_adc_test_init)
	movlw	(04h)
	fcall	_adc_test_init
	goto	l4082
	line	258
	
l4076:	
;common.c: 258: else if(1 == sampleChannelSelect)
	decf	(_sampleChannelSelect),w
	skipz
	goto	u1231
	goto	u1230
u1231:
	goto	l4080
u1230:
	line	259
	
l4078:	
;common.c: 259: adc_test_init(1,3);
	movlw	(03h)
	movwf	(?_adc_test_init)
	movlw	(01h)
	fcall	_adc_test_init
	goto	l4082
	line	261
	
l4080:	
;common.c: 260: else
;common.c: 261: adc_test_init(14,3);
	movlw	(03h)
	movwf	(?_adc_test_init)
	movlw	(0Eh)
	fcall	_adc_test_init
	line	263
	
l4082:	
;common.c: 263: adc_start();
	fcall	_adc_start
	line	265
	
l1663:	
	return
	opt stack 0
GLOBAL	__end_of_process_AD_Converter_Value
	__end_of_process_AD_Converter_Value:
;; =============== function _process_AD_Converter_Value ends ============

	signat	_process_AD_Converter_Value,88
	global	_clearAllTimer
psect	text709,local,class=CODE,delta=2
global __ptext709
__ptext709:

;; *************** function _clearAllTimer *****************
;; Defined at:
;;		line 83 in file "D:\develop\ATK\AK7030-OTP\main.c"
;; Parameters:    Size  Location     Type
;;		None
;; Auto vars:     Size  Location     Type
;;		None
;; Return value:  Size  Location     Type
;;		None               void
;; Registers used:
;;		status,2, status,0, pclath, cstack
;; Tracked objects:
;;		On entry : 160/0
;;		On exit  : 160/20
;;		Unchanged: FFE9F/0
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
psect	text709
	file	"D:\develop\ATK\AK7030-OTP\main.c"
	line	83
	global	__size_of_clearAllTimer
	__size_of_clearAllTimer	equ	__end_of_clearAllTimer-_clearAllTimer
	
_clearAllTimer:	
	opt	stack 4
; Regs used in _clearAllTimer: [status,2+status,0+pclath+cstack]
	line	84
	
l4066:	
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
	global	_AD_Sample
psect	text710,local,class=CODE,delta=2
global __ptext710
__ptext710:

;; *************** function _AD_Sample *****************
;; Defined at:
;;		line 277 in file "D:\develop\ATK\AK7030-OTP\common.c"
;; Parameters:    Size  Location     Type
;;		None
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
psect	text710
	file	"D:\develop\ATK\AK7030-OTP\common.c"
	line	277
	global	__size_of_AD_Sample
	__size_of_AD_Sample	equ	__end_of_AD_Sample-_AD_Sample
	
_AD_Sample:	
	opt	stack 4
; Regs used in _AD_Sample: [wreg+status,2+status,0]
	line	278
	
l4004:	
;common.c: 278: if(sampleTimes < 12)
	movlw	(0Ch)
	subwf	(_sampleTimes),w
	skipnc
	goto	u1081
	goto	u1080
u1081:
	goto	l1674
u1080:
	line	300
	
l4006:	
;common.c: 279: {
;common.c: 300: sampleTimes++;
	incf	(_sampleTimes),f
	line	302
	
l4008:	
;common.c: 302: if(sampleTimes >= 12)
	movlw	(0Ch)
	subwf	(_sampleTimes),w
	skipc
	goto	u1091
	goto	u1090
u1091:
	goto	l1674
u1090:
	line	304
	
l4010:	
;common.c: 303: {
;common.c: 304: sampleTimes = 0;
	clrf	(_sampleTimes)
	line	306
	
l4012:	
;common.c: 306: if(sampleChannelSelect == 14)
	movf	(_sampleChannelSelect),w
	xorlw	0Eh
	skipz
	goto	u1101
	goto	u1100
u1101:
	goto	l4016
u1100:
	line	310
	
l4014:	
;common.c: 307: {
;common.c: 310: sampleChannelSelect = 1;
	clrf	(_sampleChannelSelect)
	incf	(_sampleChannelSelect),f
	line	311
;common.c: 311: }
	goto	l1674
	line	312
	
l4016:	
;common.c: 312: else if(sampleChannelSelect == 4)
	movf	(_sampleChannelSelect),w
	xorlw	04h
	skipz
	goto	u1111
	goto	u1110
u1111:
	goto	l4020
u1110:
	line	315
	
l4018:	
;common.c: 313: {
;common.c: 315: sampleChannelSelect = 14;
	movlw	(0Eh)
	movwf	(_sampleChannelSelect)
	line	316
;common.c: 316: }
	goto	l1674
	line	317
	
l4020:	
;common.c: 317: else if(sampleChannelSelect == 1)
	decf	(_sampleChannelSelect),w
	skipz
	goto	u1121
	goto	u1120
u1121:
	goto	l4018
u1120:
	line	320
	
l4022:	
;common.c: 318: {
;common.c: 320: sampleChannelSelect = 4;
	movlw	(04h)
	movwf	(_sampleChannelSelect)
	line	333
;common.c: 321: }
	
l1674:	
	return
	opt stack 0
GLOBAL	__end_of_AD_Sample
	__end_of_AD_Sample:
;; =============== function _AD_Sample ends ============

	signat	_AD_Sample,88
	global	_setAD_ConvertFlag
psect	text711,local,class=CODE,delta=2
global __ptext711
__ptext711:

;; *************** function _setAD_ConvertFlag *****************
;; Defined at:
;;		line 206 in file "D:\develop\ATK\AK7030-OTP\common.c"
;; Parameters:    Size  Location     Type
;;  flag            1    wreg     unsigned char 
;; Auto vars:     Size  Location     Type
;;  flag            1    0[BANK0 ] unsigned char 
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
psect	text711
	file	"D:\develop\ATK\AK7030-OTP\common.c"
	line	206
	global	__size_of_setAD_ConvertFlag
	__size_of_setAD_ConvertFlag	equ	__end_of_setAD_ConvertFlag-_setAD_ConvertFlag
	
_setAD_ConvertFlag:	
	opt	stack 4
; Regs used in _setAD_ConvertFlag: [wreg]
;setAD_ConvertFlag@flag stored from wreg
	movwf	(setAD_ConvertFlag@flag)
	line	207
	
l4002:	
;common.c: 207: adc_convert_flag = flag;
	movf	(setAD_ConvertFlag@flag),w
	movwf	(_adc_convert_flag)
	line	208
	
l1646:	
	return
	opt stack 0
GLOBAL	__end_of_setAD_ConvertFlag
	__end_of_setAD_ConvertFlag:
;; =============== function _setAD_ConvertFlag ends ============

	signat	_setAD_ConvertFlag,4216
	global	_getAD_ConvertFlag
psect	text712,local,class=CODE,delta=2
global __ptext712
__ptext712:

;; *************** function _getAD_ConvertFlag *****************
;; Defined at:
;;		line 200 in file "D:\develop\ATK\AK7030-OTP\common.c"
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
;; Hardware stack levels required when called:    2
;; This function calls:
;;		Nothing
;; This function is called by:
;;		_process_AD_Converter_Value
;; This function uses a non-reentrant model
;;
psect	text712
	file	"D:\develop\ATK\AK7030-OTP\common.c"
	line	200
	global	__size_of_getAD_ConvertFlag
	__size_of_getAD_ConvertFlag	equ	__end_of_getAD_ConvertFlag-_getAD_ConvertFlag
	
_getAD_ConvertFlag:	
	opt	stack 4
; Regs used in _getAD_ConvertFlag: [wreg]
	line	201
	
l3998:	
;common.c: 201: return adc_convert_flag;
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	movf	(_adc_convert_flag),w
	line	202
	
l1643:	
	return
	opt stack 0
GLOBAL	__end_of_getAD_ConvertFlag
	__end_of_getAD_ConvertFlag:
;; =============== function _getAD_ConvertFlag ends ============

	signat	_getAD_ConvertFlag,89
	global	_Filter
psect	text713,local,class=CODE,delta=2
global __ptext713
__ptext713:

;; *************** function _Filter *****************
;; Defined at:
;;		line 51 in file "D:\develop\ATK\AK7030-OTP\common.c"
;; Parameters:    Size  Location     Type
;;  tmpValue        1    wreg     PTR int 
;;		 -> uiSampleChannelFourteenth(24), uiSampleChannelFourth(24), uiSampleChannelFirst(24), 
;; Auto vars:     Size  Location     Type
;;  tmpValue        1   34[BANK0 ] PTR int 
;;		 -> uiSampleChannelFourteenth(24), uiSampleChannelFourth(24), uiSampleChannelFirst(24), 
;;  cir             2   35[BANK0 ] int 
;;  filter_buf     24    6[BANK0 ] unsigned int [12]
;;  filter_sum      2   32[BANK0 ] unsigned int 
;;  filter_temp     2   30[BANK0 ] unsigned int 
;;  i               1   38[BANK0 ] unsigned char 
;;  j               1   37[BANK0 ] unsigned char 
;; Return value:  Size  Location     Type
;;                  2    0[BANK0 ] unsigned int 
;; Registers used:
;;		wreg, fsr0l, fsr0h, status,2, status,0, btemp+1
;; Tracked objects:
;;		On entry : 60/0
;;		On exit  : 160/0
;;		Unchanged: FFE00/0
;; Data sizes:     COMMON   BANK0   BANK1   BANK3   BANK2
;;      Params:         0       2       0       0       0
;;      Locals:         0      33       0       0       0
;;      Temps:          0       4       0       0       0
;;      Totals:         0      39       0       0       0
;;Total ram usage:       39 bytes
;; Hardware stack levels used:    1
;; Hardware stack levels required when called:    2
;; This function calls:
;;		Nothing
;; This function is called by:
;;		_getAdOriginalCh1Value
;;		_getAdOriginaCh4Value
;;		_getAdOriginalCh14Value
;; This function uses a non-reentrant model
;;
psect	text713
	file	"D:\develop\ATK\AK7030-OTP\common.c"
	line	51
	global	__size_of_Filter
	__size_of_Filter	equ	__end_of_Filter-_Filter
	
_Filter:	
	opt	stack 4
; Regs used in _Filter: [wreg-fsr0h+status,2+status,0+btemp+1]
;Filter@tmpValue stored from wreg
	line	53
	movwf	(Filter@tmpValue)
	
l3900:	
	clrf	(Filter@j)
	line	55
;common.c: 55: unsigned int filter_temp = 0, filter_sum = 0;
	clrf	(Filter@filter_temp)
	clrf	(Filter@filter_temp+1)
	clrf	(Filter@filter_sum)
	clrf	(Filter@filter_sum+1)
	line	59
;common.c: 57: unsigned int filter_buf[12];
;common.c: 59: for(int cir = 0;cir < 12; cir++)
	clrf	(Filter@cir)
	clrf	(Filter@cir+1)
	line	60
	
l3906:	
;common.c: 60: filter_buf[cir] = *tmpValue++;
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	movf	(Filter@tmpValue),w
	movwf	fsr0
	bcf	status, 7	;select IRP bank0
	movf	indf,w
	movwf	(??_Filter+0)+0+0
	incf	fsr0,f
	movf	indf,w
	movwf	(??_Filter+0)+0+1
	clrc
	rlf	(Filter@cir),w
	addlw	Filter@filter_buf&0ffh
	movwf	fsr0
	movf	0+(??_Filter+0)+0,w
	movwf	indf
	incf	fsr0,f
	movf	1+(??_Filter+0)+0,w
	movwf	indf
	
l3908:	
	incf	(Filter@tmpValue),f
	incf	(Filter@tmpValue),f
	line	59
	
l3910:	
	incf	(Filter@cir),f
	skipnz
	incf	(Filter@cir+1),f
	
l3912:	
	movf	(Filter@cir+1),w
	xorlw	80h
	movwf	btemp+1
	movlw	(high(0Ch))^80h
	subwf	btemp+1,w
	skipz
	goto	u965
	movlw	low(0Ch)
	subwf	(Filter@cir),w
u965:

	skipc
	goto	u961
	goto	u960
u961:
	goto	l3906
u960:
	line	63
	
l3914:	
;common.c: 63: for(j = 0; j < 12 - 1; j++)
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	clrf	(Filter@j)
	line	65
	
l3920:	
;common.c: 64: {
;common.c: 65: for(i = 0; i < 12 - 1 - j; i++)
	clrf	(Filter@i)
	goto	l3928
	line	67
	
l3922:	
;common.c: 66: {
;common.c: 67: if(filter_buf[i] > filter_buf[i + 1])
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	clrc
	rlf	(Filter@i),w
	addlw	Filter@filter_buf&0ffh
	movwf	fsr0
	bcf	status, 7	;select IRP bank0
	movf	indf,w
	movwf	(??_Filter+0)+0+0
	incf	fsr0,f
	movf	indf,w
	movwf	(??_Filter+0)+0+1
	clrc
	rlf	(Filter@i),w
	addlw	02h
	addlw	Filter@filter_buf&0ffh
	movwf	fsr0
	movf	indf,w
	movwf	(??_Filter+2)+0+0
	incf	fsr0,f
	movf	indf,w
	movwf	(??_Filter+2)+0+1
	movf	1+(??_Filter+0)+0,w
	subwf	1+(??_Filter+2)+0,w
	skipz
	goto	u975
	movf	0+(??_Filter+0)+0,w
	subwf	0+(??_Filter+2)+0,w
u975:
	skipnc
	goto	u971
	goto	u970
u971:
	goto	l3926
u970:
	line	70
	
l3924:	
;common.c: 68: {
;common.c: 70: filter_temp = filter_buf[i];
	clrc
	rlf	(Filter@i),w
	addlw	Filter@filter_buf&0ffh
	movwf	fsr0
	movf	indf,w
	movwf	(Filter@filter_temp)
	incf	fsr0,f
	movf	indf,w
	movwf	(Filter@filter_temp+1)
	line	72
;common.c: 72: filter_buf[i] = filter_buf[i + 1];
	clrc
	rlf	(Filter@i),w
	addlw	02h
	addlw	Filter@filter_buf&0ffh
	movwf	fsr0
	movf	indf,w
	movwf	(??_Filter+0)+0+0
	incf	fsr0,f
	movf	indf,w
	movwf	(??_Filter+0)+0+1
	clrc
	rlf	(Filter@i),w
	addlw	Filter@filter_buf&0ffh
	movwf	fsr0
	movf	0+(??_Filter+0)+0,w
	movwf	indf
	incf	fsr0,f
	movf	1+(??_Filter+0)+0,w
	movwf	indf
	line	74
;common.c: 74: filter_buf[i + 1] = filter_temp;
	clrc
	rlf	(Filter@i),w
	addlw	02h
	addlw	Filter@filter_buf&0ffh
	movwf	fsr0
	movf	(Filter@filter_temp),w
	movwf	indf
	incf	fsr0,f
	movf	(Filter@filter_temp+1),w
	movwf	indf
	line	65
	
l3926:	
	incf	(Filter@i),f
	
l3928:	
	movlw	high(0Bh)
	movwf	(??_Filter+0)+0+1
	movf	(Filter@j),w
	sublw	low(0Bh)
	movwf	(??_Filter+0)+0
	skipc
	decf	(??_Filter+0)+0+1,f
	movf	1+(??_Filter+0)+0,w
	xorlw	80h
	sublw	080h
	skipz
	goto	u985
	movf	0+(??_Filter+0)+0,w
	subwf	(Filter@i),w
u985:

	skipc
	goto	u981
	goto	u980
u981:
	goto	l3922
u980:
	line	63
	
l3930:	
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	incf	(Filter@j),f
	
l3932:	
	movlw	(0Bh)
	subwf	(Filter@j),w
	skipc
	goto	u991
	goto	u990
u991:
	goto	l3920
u990:
	line	79
	
l3934:	
;common.c: 75: }
;common.c: 76: }
;common.c: 77: }
;common.c: 79: for(i = 2; i < 12 - 2; i++)
	movlw	(02h)
	movwf	(Filter@i)
	line	81
	
l3938:	
;common.c: 80: {
;common.c: 81: filter_sum += filter_buf[i];
	clrc
	rlf	(Filter@i),w
	addlw	Filter@filter_buf&0ffh
	movwf	fsr0
	bcf	status, 7	;select IRP bank0
	movf	indf,w
	movwf	(??_Filter+0)+0+0
	incf	fsr0,f
	movf	indf,w
	movwf	(??_Filter+0)+0+1
	movf	0+(??_Filter+0)+0,w
	addwf	(Filter@filter_sum),f
	skipnc
	incf	(Filter@filter_sum+1),f
	movf	1+(??_Filter+0)+0,w
	addwf	(Filter@filter_sum+1),f
	line	79
	
l3940:	
	incf	(Filter@i),f
	
l3942:	
	movlw	(0Ah)
	subwf	(Filter@i),w
	skipc
	goto	u1001
	goto	u1000
u1001:
	goto	l3938
u1000:
	line	84
	
l3944:	
;common.c: 82: }
;common.c: 84: return (filter_sum >> 3);
	movf	(Filter@filter_sum+1),w
	movwf	(?_Filter+1)
	movf	(Filter@filter_sum),w
	movwf	(?_Filter)
	
l3946:	
	clrc
	rrf	(?_Filter+1),f
	rrf	(?_Filter),f
	clrc
	rrf	(?_Filter+1),f
	rrf	(?_Filter),f
	clrc
	rrf	(?_Filter+1),f
	rrf	(?_Filter),f
	line	86
	
l1605:	
	return
	opt stack 0
GLOBAL	__end_of_Filter
	__end_of_Filter:
;; =============== function _Filter ends ============

	signat	_Filter,4218
	global	_isFinishedThreeHoursTimer
psect	text714,local,class=CODE,delta=2
global __ptext714
__ptext714:

;; *************** function _isFinishedThreeHoursTimer *****************
;; Defined at:
;;		line 416 in file "D:\develop\ATK\AK7030-OTP\common.c"
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
psect	text714
	file	"D:\develop\ATK\AK7030-OTP\common.c"
	line	416
	global	__size_of_isFinishedThreeHoursTimer
	__size_of_isFinishedThreeHoursTimer	equ	__end_of_isFinishedThreeHoursTimer-_isFinishedThreeHoursTimer
	
_isFinishedThreeHoursTimer:	
	opt	stack 5
; Regs used in _isFinishedThreeHoursTimer: [wreg+status,2+status,0]
	line	417
	
l3888:	
;common.c: 417: if(uiSmallTimer == 0)
	movf	((_uiSmallTimer+1)),w
	iorwf	((_uiSmallTimer)),w
	skipz
	goto	u951
	goto	u950
u951:
	goto	l3896
u950:
	line	418
	
l3890:	
;common.c: 418: return 1;
	movlw	(01h)
	goto	l1711
	line	420
	
l3896:	
;common.c: 419: else
;common.c: 420: return 0;
	movlw	(0)
	line	421
	
l1711:	
	return
	opt stack 0
GLOBAL	__end_of_isFinishedThreeHoursTimer
	__end_of_isFinishedThreeHoursTimer:
;; =============== function _isFinishedThreeHoursTimer ends ============

	signat	_isFinishedThreeHoursTimer,89
	global	_startThreeHoursTimer
psect	text715,local,class=CODE,delta=2
global __ptext715
__ptext715:

;; *************** function _startThreeHoursTimer *****************
;; Defined at:
;;		line 382 in file "D:\develop\ATK\AK7030-OTP\common.c"
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
psect	text715
	file	"D:\develop\ATK\AK7030-OTP\common.c"
	line	382
	global	__size_of_startThreeHoursTimer
	__size_of_startThreeHoursTimer	equ	__end_of_startThreeHoursTimer-_startThreeHoursTimer
	
_startThreeHoursTimer:	
	opt	stack 5
; Regs used in _startThreeHoursTimer: [wreg+status,2+status,0]
	line	383
	
l3884:	
;common.c: 383: if(0 == uiSmallTimer)
	movf	((_uiSmallTimer+1)),w
	iorwf	((_uiSmallTimer)),w
	skipz
	goto	u941
	goto	u940
u941:
	goto	l1694
u940:
	line	384
	
l3886:	
;common.c: 384: uiSmallTimer = uiSetTime;
	movf	(startThreeHoursTimer@uiSetTime+1),w
	movwf	(_uiSmallTimer+1)
	movf	(startThreeHoursTimer@uiSetTime),w
	movwf	(_uiSmallTimer)
	line	389
	
l1694:	
	return
	opt stack 0
GLOBAL	__end_of_startThreeHoursTimer
	__end_of_startThreeHoursTimer:
;; =============== function _startThreeHoursTimer ends ============

	signat	_startThreeHoursTimer,4216
	global	_isFinishedTwentySecondsTimer
psect	text716,local,class=CODE,delta=2
global __ptext716
__ptext716:

;; *************** function _isFinishedTwentySecondsTimer *****************
;; Defined at:
;;		line 399 in file "D:\develop\ATK\AK7030-OTP\common.c"
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
;;		On exit  : 60/20
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
psect	text716
	file	"D:\develop\ATK\AK7030-OTP\common.c"
	line	399
	global	__size_of_isFinishedTwentySecondsTimer
	__size_of_isFinishedTwentySecondsTimer	equ	__end_of_isFinishedTwentySecondsTimer-_isFinishedTwentySecondsTimer
	
_isFinishedTwentySecondsTimer:	
	opt	stack 5
; Regs used in _isFinishedTwentySecondsTimer: [wreg+status,2+status,0]
	line	400
	
l3872:	
;common.c: 400: if(0 == uiTwentySecondsTimer)
	bsf	status, 5	;RP0=1, select bank1
	movf	((_uiTwentySecondsTimer+1)^080h),w
	iorwf	((_uiTwentySecondsTimer)^080h),w
	skipz
	goto	u931
	goto	u930
u931:
	goto	l3880
u930:
	line	401
	
l3874:	
;common.c: 401: return 1;
	movlw	(01h)
	goto	l1701
	line	403
	
l3880:	
;common.c: 402: else
;common.c: 403: return 0;
	movlw	(0)
	line	404
	
l1701:	
	return
	opt stack 0
GLOBAL	__end_of_isFinishedTwentySecondsTimer
	__end_of_isFinishedTwentySecondsTimer:
;; =============== function _isFinishedTwentySecondsTimer ends ============

	signat	_isFinishedTwentySecondsTimer,89
	global	_startTwentySecondsTimer
psect	text717,local,class=CODE,delta=2
global __ptext717
__ptext717:

;; *************** function _startTwentySecondsTimer *****************
;; Defined at:
;;		line 393 in file "D:\develop\ATK\AK7030-OTP\common.c"
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
;;		On exit  : 60/20
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
psect	text717
	file	"D:\develop\ATK\AK7030-OTP\common.c"
	line	393
	global	__size_of_startTwentySecondsTimer
	__size_of_startTwentySecondsTimer	equ	__end_of_startTwentySecondsTimer-_startTwentySecondsTimer
	
_startTwentySecondsTimer:	
	opt	stack 5
; Regs used in _startTwentySecondsTimer: [wreg]
	line	394
	
l3870:	
;common.c: 394: uiTwentySecondsTimer = 20;
	movlw	014h
	bsf	status, 5	;RP0=1, select bank1
	movwf	(_uiTwentySecondsTimer)^080h
	clrf	(_uiTwentySecondsTimer+1)^080h
	line	395
	
l1697:	
	return
	opt stack 0
GLOBAL	__end_of_startTwentySecondsTimer
	__end_of_startTwentySecondsTimer:
;; =============== function _startTwentySecondsTimer ends ============

	signat	_startTwentySecondsTimer,88
	global	_isFinishedTwelveHoursTimer
psect	text718,local,class=CODE,delta=2
global __ptext718
__ptext718:

;; *************** function _isFinishedTwelveHoursTimer *****************
;; Defined at:
;;		line 408 in file "D:\develop\ATK\AK7030-OTP\common.c"
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
psect	text718
	file	"D:\develop\ATK\AK7030-OTP\common.c"
	line	408
	global	__size_of_isFinishedTwelveHoursTimer
	__size_of_isFinishedTwelveHoursTimer	equ	__end_of_isFinishedTwelveHoursTimer-_isFinishedTwelveHoursTimer
	
_isFinishedTwelveHoursTimer:	
	opt	stack 5
; Regs used in _isFinishedTwelveHoursTimer: [wreg+status,2+status,0]
	line	409
	
l3858:	
;common.c: 409: if(uiBigTimer == 0)
	movf	((_uiBigTimer+1)),w
	iorwf	((_uiBigTimer)),w
	skipz
	goto	u921
	goto	u920
u921:
	goto	l3866
u920:
	line	410
	
l3860:	
;common.c: 410: return 1;
	movlw	(01h)
	goto	l1706
	line	412
	
l3866:	
;common.c: 411: else
;common.c: 412: return 0;
	movlw	(0)
	line	413
	
l1706:	
	return
	opt stack 0
GLOBAL	__end_of_isFinishedTwelveHoursTimer
	__end_of_isFinishedTwelveHoursTimer:
;; =============== function _isFinishedTwelveHoursTimer ends ============

	signat	_isFinishedTwelveHoursTimer,89
	global	_startTwelveHourTimer
psect	text719,local,class=CODE,delta=2
global __ptext719
__ptext719:

;; *************** function _startTwelveHourTimer *****************
;; Defined at:
;;		line 354 in file "D:\develop\ATK\AK7030-OTP\common.c"
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
psect	text719
	file	"D:\develop\ATK\AK7030-OTP\common.c"
	line	354
	global	__size_of_startTwelveHourTimer
	__size_of_startTwelveHourTimer	equ	__end_of_startTwelveHourTimer-_startTwelveHourTimer
	
_startTwelveHourTimer:	
	opt	stack 5
; Regs used in _startTwelveHourTimer: [wreg+status,2+status,0]
	line	355
	
l3854:	
;common.c: 355: if(0 == uiBigTimer)
	movf	((_uiBigTimer+1)),w
	iorwf	((_uiBigTimer)),w
	skipz
	goto	u911
	goto	u910
u911:
	goto	l1681
u910:
	line	356
	
l3856:	
;common.c: 356: uiBigTimer = uiSetTime;
	movf	(startTwelveHourTimer@uiSetTime+1),w
	movwf	(_uiBigTimer+1)
	movf	(startTwelveHourTimer@uiSetTime),w
	movwf	(_uiBigTimer)
	line	362
	
l1681:	
	return
	opt stack 0
GLOBAL	__end_of_startTwelveHourTimer
	__end_of_startTwelveHourTimer:
;; =============== function _startTwelveHourTimer ends ============

	signat	_startTwelveHourTimer,4216
	global	_clrSampeTime
psect	text720,local,class=CODE,delta=2
global __ptext720
__ptext720:

;; *************** function _clrSampeTime *****************
;; Defined at:
;;		line 434 in file "D:\develop\ATK\AK7030-OTP\common.c"
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
;;		_main
;; This function uses a non-reentrant model
;;
psect	text720
	file	"D:\develop\ATK\AK7030-OTP\common.c"
	line	434
	global	__size_of_clrSampeTime
	__size_of_clrSampeTime	equ	__end_of_clrSampeTime-_clrSampeTime
	
_clrSampeTime:	
	opt	stack 5
; Regs used in _clrSampeTime: [status,2]
	line	435
	
l3852:	
;common.c: 435: timer.timer10msStopWatch = 0;
	clrf	(_timer)
	line	436
	
l1720:	
	return
	opt stack 0
GLOBAL	__end_of_clrSampeTime
	__end_of_clrSampeTime:
;; =============== function _clrSampeTime ends ============

	signat	_clrSampeTime,88
	global	_isPermitSampleTime
psect	text721,local,class=CODE,delta=2
global __ptext721
__ptext721:

;; *************** function _isPermitSampleTime *****************
;; Defined at:
;;		line 424 in file "D:\develop\ATK\AK7030-OTP\common.c"
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
;; Hardware stack levels required when called:    2
;; This function calls:
;;		Nothing
;; This function is called by:
;;		_main
;; This function uses a non-reentrant model
;;
psect	text721
	file	"D:\develop\ATK\AK7030-OTP\common.c"
	line	424
	global	__size_of_isPermitSampleTime
	__size_of_isPermitSampleTime	equ	__end_of_isPermitSampleTime-_isPermitSampleTime
	
_isPermitSampleTime:	
	opt	stack 5
; Regs used in _isPermitSampleTime: [wreg]
	line	425
	
l3840:	
;common.c: 425: if(timer.timer10msStopWatch >= 10)
	movlw	(0Ah)
	subwf	(_timer),w
	skipc
	goto	u901
	goto	u900
u901:
	goto	l3848
u900:
	line	427
	
l3842:	
;common.c: 426: {
;common.c: 427: return 1;
	movlw	(01h)
	goto	l1716
	line	430
	
l3848:	
;common.c: 429: else
;common.c: 430: return 0;
	movlw	(0)
	line	431
	
l1716:	
	return
	opt stack 0
GLOBAL	__end_of_isPermitSampleTime
	__end_of_isPermitSampleTime:
;; =============== function _isPermitSampleTime ends ============

	signat	_isPermitSampleTime,89
	global	_adc_start
psect	text722,local,class=CODE,delta=2
global __ptext722
__ptext722:

;; *************** function _adc_start *****************
;; Defined at:
;;		line 100 in file "D:\develop\ATK\AK7030-OTP\periph.c"
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
psect	text722
	file	"D:\develop\ATK\AK7030-OTP\periph.c"
	line	100
	global	__size_of_adc_start
	__size_of_adc_start	equ	__end_of_adc_start-_adc_start
	
_adc_start:	
	opt	stack 4
; Regs used in _adc_start: []
	line	101
	
l3838:	
;periph.c: 101: GO=1;
	bcf	status, 5	;RP0=0, select bank0
	bsf	(249/8),(249)&7
	line	102
	
l2386:	
	return
	opt stack 0
GLOBAL	__end_of_adc_start
	__end_of_adc_start:
;; =============== function _adc_start ends ============

	signat	_adc_start,88
	global	_op2_init
psect	text723,local,class=CODE,delta=2
global __ptext723
__ptext723:

;; *************** function _op2_init *****************
;; Defined at:
;;		line 45 in file "D:\develop\ATK\AK7030-OTP\periph.c"
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
psect	text723
	file	"D:\develop\ATK\AK7030-OTP\periph.c"
	line	45
	global	__size_of_op2_init
	__size_of_op2_init	equ	__end_of_op2_init-_op2_init
	
_op2_init:	
	opt	stack 5
; Regs used in _op2_init: [wreg]
	line	52
	
l3832:	
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
	
l3834:	
;periph.c: 58: TRISA7=0;
	bcf	(1071/8)^080h,(1071)&7
	line	60
	
l3836:	
;periph.c: 60: TRISB7 = 1;
	bsf	(1079/8)^080h,(1079)&7
	line	61
	
l2372:	
	return
	opt stack 0
GLOBAL	__end_of_op2_init
	__end_of_op2_init:
;; =============== function _op2_init ends ============

	signat	_op2_init,88
	global	_op1_init
psect	text724,local,class=CODE,delta=2
global __ptext724
__ptext724:

;; *************** function _op1_init *****************
;; Defined at:
;;		line 26 in file "D:\develop\ATK\AK7030-OTP\periph.c"
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
psect	text724
	file	"D:\develop\ATK\AK7030-OTP\periph.c"
	line	26
	global	__size_of_op1_init
	__size_of_op1_init	equ	__end_of_op1_init-_op1_init
	
_op1_init:	
	opt	stack 5
; Regs used in _op1_init: [wreg]
	line	33
	
l3826:	
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
	
l3828:	
;periph.c: 38: TRISB3=1;
	bsf	status, 5	;RP0=1, select bank1
	bsf	(1075/8)^080h,(1075)&7
	line	40
	
l3830:	
;periph.c: 40: TRISB5=0;
	bcf	(1077/8)^080h,(1077)&7
	line	41
	
l2369:	
	return
	opt stack 0
GLOBAL	__end_of_op1_init
	__end_of_op1_init:
;; =============== function _op1_init ends ============

	signat	_op1_init,88
	global	_dac_init
psect	text725,local,class=CODE,delta=2
global __ptext725
__ptext725:

;; *************** function _dac_init *****************
;; Defined at:
;;		line 14 in file "D:\develop\ATK\AK7030-OTP\periph.c"
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
psect	text725
	file	"D:\develop\ATK\AK7030-OTP\periph.c"
	line	14
	global	__size_of_dac_init
	__size_of_dac_init	equ	__end_of_dac_init-_dac_init
	
_dac_init:	
	opt	stack 5
; Regs used in _dac_init: [wreg]
	line	15
	
l3820:	
;periph.c: 15: DACCON|=1;
	bsf	(135)^080h+(0/8),(0)&7	;volatile
	line	17
	
l3822:	
;periph.c: 17: DACR0=0x0F;
	movlw	(0Fh)
	movwf	(136)^080h	;volatile
	line	18
	
l3824:	
;periph.c: 18: DACCON|=(1)<<2;
	bsf	(135)^080h+(2/8),(2)&7	;volatile
	line	22
	
l2366:	
	return
	opt stack 0
GLOBAL	__end_of_dac_init
	__end_of_dac_init:
;; =============== function _dac_init ends ============

	signat	_dac_init,88
	global	_adc_test_init
psect	text726,local,class=CODE,delta=2
global __ptext726
__ptext726:

;; *************** function _adc_test_init *****************
;; Defined at:
;;		line 85 in file "D:\develop\ATK\AK7030-OTP\periph.c"
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
psect	text726
	file	"D:\develop\ATK\AK7030-OTP\periph.c"
	line	85
	global	__size_of_adc_test_init
	__size_of_adc_test_init	equ	__end_of_adc_test_init-_adc_test_init
	
_adc_test_init:	
	opt	stack 4
; Regs used in _adc_test_init: [wreg+status,2+status,0]
;adc_test_init@channel stored from wreg
	movwf	(adc_test_init@channel)
	line	86
	
l3810:	
;periph.c: 86: ADCON0 = 0x00;
	clrf	(31)	;volatile
	line	87
	
l3812:	
;periph.c: 87: ADCON0|=channel<<2;
	movf	(adc_test_init@channel),w
	movwf	(??_adc_test_init+0)+0
	clrc
	rlf	(??_adc_test_init+0)+0,f
	clrc
	rlf	(??_adc_test_init+0)+0,w
	iorwf	(31),f	;volatile
	line	88
	
l3814:	
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
	
l3816:	
;periph.c: 89: ADON=1;
	bcf	status, 5	;RP0=0, select bank0
	bsf	(248/8),(248)&7
	line	90
	
l3818:	
;periph.c: 90: ADIE=1;
	bsf	status, 5	;RP0=1, select bank1
	bsf	(1130/8)^080h,(1130)&7
	line	91
	
l2380:	
	return
	opt stack 0
GLOBAL	__end_of_adc_test_init
	__end_of_adc_test_init:
;; =============== function _adc_test_init ends ============

	signat	_adc_test_init,8312
	global	_timer1_interrupt_config
psect	text727,local,class=CODE,delta=2
global __ptext727
__ptext727:

;; *************** function _timer1_interrupt_config *****************
;; Defined at:
;;		line 192 in file "D:\develop\ATK\AK7030-OTP\common.c"
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
psect	text727
	file	"D:\develop\ATK\AK7030-OTP\common.c"
	line	192
	global	__size_of_timer1_interrupt_config
	__size_of_timer1_interrupt_config	equ	__end_of_timer1_interrupt_config-_timer1_interrupt_config
	
_timer1_interrupt_config:	
	opt	stack 5
; Regs used in _timer1_interrupt_config: []
	line	193
	
l3808:	
;common.c: 193: GIE = 1;
	bsf	(95/8),(95)&7
	line	194
;common.c: 194: PEIE = 1;
	bsf	(94/8),(94)&7
	line	195
	
l1640:	
	return
	opt stack 0
GLOBAL	__end_of_timer1_interrupt_config
	__end_of_timer1_interrupt_config:
;; =============== function _timer1_interrupt_config ends ============

	signat	_timer1_interrupt_config,88
	global	_timer1_config
psect	text728,local,class=CODE,delta=2
global __ptext728
__ptext728:

;; *************** function _timer1_config *****************
;; Defined at:
;;		line 180 in file "D:\develop\ATK\AK7030-OTP\common.c"
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
psect	text728
	file	"D:\develop\ATK\AK7030-OTP\common.c"
	line	180
	global	__size_of_timer1_config
	__size_of_timer1_config	equ	__end_of_timer1_config-_timer1_config
	
_timer1_config:	
	opt	stack 5
; Regs used in _timer1_config: [wreg]
	line	182
	
l3804:	
;common.c: 182: TMR1H=0xCF;
	movlw	(0CFh)
	bcf	status, 6	;RP1=0, select bank0
	movwf	(15)	;volatile
	line	183
;common.c: 183: TMR1L=0x2C;
	movlw	(02Ch)
	movwf	(14)	;volatile
	line	184
;common.c: 184: T1CON=0xE1;
	movlw	(0E1h)
	movwf	(16)	;volatile
	line	185
	
l3806:	
;common.c: 185: TMR1IE=1;
	bsf	status, 5	;RP0=1, select bank1
	bsf	(1120/8)^080h,(1120)&7
	line	187
	
l1637:	
	return
	opt stack 0
GLOBAL	__end_of_timer1_config
	__end_of_timer1_config:
;; =============== function _timer1_config ends ============

	signat	_timer1_config,88
	global	_clock_config
psect	text729,local,class=CODE,delta=2
global __ptext729
__ptext729:

;; *************** function _clock_config *****************
;; Defined at:
;;		line 172 in file "D:\develop\ATK\AK7030-OTP\common.c"
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
psect	text729
	file	"D:\develop\ATK\AK7030-OTP\common.c"
	line	172
	global	__size_of_clock_config
	__size_of_clock_config	equ	__end_of_clock_config-_clock_config
	
_clock_config:	
	opt	stack 5
; Regs used in _clock_config: [wreg+status,2]
	line	174
	
l3800:	
;common.c: 174: CLKPR = 0x80;
	movlw	(080h)
	bcf	status, 5	;RP0=0, select bank2
	bsf	status, 6	;RP1=1, select bank2
	movwf	(264)^0100h	;volatile
	line	175
	
l3802:	
;common.c: 175: CLKPR = 0x00;
	clrf	(264)^0100h	;volatile
	line	176
;common.c: 176: while(CLKPCE);
	
l1631:	
	btfsc	(2119/8)^0100h,(2119)&7
	goto	u891
	goto	u890
u891:
	goto	l1631
u890:
	line	177
	
l1634:	
	return
	opt stack 0
GLOBAL	__end_of_clock_config
	__end_of_clock_config:
;; =============== function _clock_config ends ============

	signat	_clock_config,88
	global	_initPin
psect	text730,local,class=CODE,delta=2
global __ptext730
__ptext730:

;; *************** function _initPin *****************
;; Defined at:
;;		line 105 in file "D:\develop\ATK\AK7030-OTP\main.c"
;; Parameters:    Size  Location     Type
;;		None
;; Auto vars:     Size  Location     Type
;;		None
;; Return value:  Size  Location     Type
;;		None               void
;; Registers used:
;;		None
;; Tracked objects:
;;		On entry : 160/20
;;		On exit  : 160/60
;;		Unchanged: FFE9F/0
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
psect	text730
	file	"D:\develop\ATK\AK7030-OTP\main.c"
	line	105
	global	__size_of_initPin
	__size_of_initPin	equ	__end_of_initPin-_initPin
	
_initPin:	
	opt	stack 5
; Regs used in _initPin: []
	line	106
	
l3798:	
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
psect	text731,local,class=CODE,delta=2
global __ptext731
__ptext731:

;; *************** function _clearTwentySecondsTimer *****************
;; Defined at:
;;		line 376 in file "D:\develop\ATK\AK7030-OTP\common.c"
;; Parameters:    Size  Location     Type
;;		None
;; Auto vars:     Size  Location     Type
;;		None
;; Return value:  Size  Location     Type
;;		None               void
;; Registers used:
;;		status,2
;; Tracked objects:
;;		On entry : 160/0
;;		On exit  : 160/20
;;		Unchanged: FFE9F/0
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
psect	text731
	file	"D:\develop\ATK\AK7030-OTP\common.c"
	line	376
	global	__size_of_clearTwentySecondsTimer
	__size_of_clearTwentySecondsTimer	equ	__end_of_clearTwentySecondsTimer-_clearTwentySecondsTimer
	
_clearTwentySecondsTimer:	
	opt	stack 4
; Regs used in _clearTwentySecondsTimer: [status,2]
	line	377
	
l3796:	
;common.c: 377: uiTwentySecondsTimer = 0;
	bsf	status, 5	;RP0=1, select bank1
	clrf	(_uiTwentySecondsTimer)^080h
	clrf	(_uiTwentySecondsTimer+1)^080h
	line	378
	
l1690:	
	return
	opt stack 0
GLOBAL	__end_of_clearTwentySecondsTimer
	__end_of_clearTwentySecondsTimer:
;; =============== function _clearTwentySecondsTimer ends ============

	signat	_clearTwentySecondsTimer,88
	global	_clearThreeHoursTimer
psect	text732,local,class=CODE,delta=2
global __ptext732
__ptext732:

;; *************** function _clearThreeHoursTimer *****************
;; Defined at:
;;		line 371 in file "D:\develop\ATK\AK7030-OTP\common.c"
;; Parameters:    Size  Location     Type
;;		None
;; Auto vars:     Size  Location     Type
;;		None
;; Return value:  Size  Location     Type
;;		None               void
;; Registers used:
;;		status,2
;; Tracked objects:
;;		On entry : 160/0
;;		On exit  : 160/0
;;		Unchanged: FFE9F/0
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
psect	text732
	file	"D:\develop\ATK\AK7030-OTP\common.c"
	line	371
	global	__size_of_clearThreeHoursTimer
	__size_of_clearThreeHoursTimer	equ	__end_of_clearThreeHoursTimer-_clearThreeHoursTimer
	
_clearThreeHoursTimer:	
	opt	stack 4
; Regs used in _clearThreeHoursTimer: [status,2]
	line	372
	
l3794:	
;common.c: 372: uiSmallTimer = 0;
	clrf	(_uiSmallTimer)
	clrf	(_uiSmallTimer+1)
	line	373
	
l1687:	
	return
	opt stack 0
GLOBAL	__end_of_clearThreeHoursTimer
	__end_of_clearThreeHoursTimer:
;; =============== function _clearThreeHoursTimer ends ============

	signat	_clearThreeHoursTimer,88
	global	_clearTwelveHoursTimer
psect	text733,local,class=CODE,delta=2
global __ptext733
__ptext733:

;; *************** function _clearTwelveHoursTimer *****************
;; Defined at:
;;		line 365 in file "D:\develop\ATK\AK7030-OTP\common.c"
;; Parameters:    Size  Location     Type
;;		None
;; Auto vars:     Size  Location     Type
;;		None
;; Return value:  Size  Location     Type
;;		None               void
;; Registers used:
;;		status,2
;; Tracked objects:
;;		On entry : 160/0
;;		On exit  : 160/0
;;		Unchanged: FFE9F/0
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
psect	text733
	file	"D:\develop\ATK\AK7030-OTP\common.c"
	line	365
	global	__size_of_clearTwelveHoursTimer
	__size_of_clearTwelveHoursTimer	equ	__end_of_clearTwelveHoursTimer-_clearTwelveHoursTimer
	
_clearTwelveHoursTimer:	
	opt	stack 4
; Regs used in _clearTwelveHoursTimer: [status,2]
	line	366
	
l3792:	
;common.c: 366: uiBigTimer = 0;
	clrf	(_uiBigTimer)
	clrf	(_uiBigTimer+1)
	line	367
	
l1684:	
	return
	opt stack 0
GLOBAL	__end_of_clearTwelveHoursTimer
	__end_of_clearTwelveHoursTimer:
;; =============== function _clearTwelveHoursTimer ends ============

	signat	_clearTwelveHoursTimer,88
	global	_ISR
psect	text734,local,class=CODE,delta=2
global __ptext734
__ptext734:

;; *************** function _ISR *****************
;; Defined at:
;;		line 439 in file "D:\develop\ATK\AK7030-OTP\common.c"
;; Parameters:    Size  Location     Type
;;		None
;; Auto vars:     Size  Location     Type
;;		None
;; Return value:  Size  Location     Type
;;		None               void
;; Registers used:
;;		wreg, fsr0l, fsr0h, status,2, status,0, btemp+1, pclath, cstack
;; Tracked objects:
;;		On entry : 0/0
;;		On exit  : 60/0
;;		Unchanged: FFE00/0
;; Data sizes:     COMMON   BANK0   BANK1   BANK3   BANK2
;;      Params:         0       0       0       0       0
;;      Locals:         0       0       0       0       0
;;      Temps:          4       0       0       0       0
;;      Totals:         4       0       0       0       0
;;Total ram usage:        4 bytes
;; Hardware stack levels used:    1
;; Hardware stack levels required when called:    1
;; This function calls:
;;		i1_setAD_ConvertFlag
;;		_adc_get
;;		_vPutSampleDataIntoTable
;; This function is called by:
;;		Interrupt level 1
;; This function uses a non-reentrant model
;;
psect	text734
	file	"D:\develop\ATK\AK7030-OTP\common.c"
	line	439
	global	__size_of_ISR
	__size_of_ISR	equ	__end_of_ISR-_ISR
	
_ISR:	
	opt	stack 3
; Regs used in _ISR: [wreg-fsr0h+status,2+status,0+btemp+1+pclath+cstack]
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
	movf	fsr0,w
	movwf	(??_ISR+1)
	movf	pclath,w
	movwf	(??_ISR+2)
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	movf	btemp+1,w
	movwf	(??_ISR+3)
	ljmp	_ISR
psect	text734
	line	442
	
i1l4026:	
;common.c: 440: static unsigned char ucTimer1sCnt = 0;
;common.c: 442: if(TMR1IF == 1)
	btfss	(96/8),(96)&7
	goto	u113_21
	goto	u113_20
u113_21:
	goto	i1l4044
u113_20:
	line	444
	
i1l4028:	
;common.c: 443: {
;common.c: 444: TMR1IF = 0 ;
	bcf	(96/8),(96)&7
	line	445
	
i1l4030:	
;common.c: 445: timer.timer10msStopWatch++;
	incf	(_timer),f
	line	446
;common.c: 446: ucTimer1sCnt++;
	incf	(ISR@ucTimer1sCnt),f
	line	448
	
i1l4032:	
;common.c: 448: if(ucTimer1sCnt >= 100)
	movlw	(064h)
	subwf	(ISR@ucTimer1sCnt),w
	skipc
	goto	u114_21
	goto	u114_20
u114_21:
	goto	i1l4044
u114_20:
	line	450
	
i1l4034:	
;common.c: 449: {
;common.c: 450: ucTimer1sCnt = 0;
	clrf	(ISR@ucTimer1sCnt)
	line	451
	
i1l4036:	
;common.c: 451: if(uiBigTimer > 0)
	movf	(_uiBigTimer+1),w
	iorwf	(_uiBigTimer),w
	skipnz
	goto	u115_21
	goto	u115_20
u115_21:
	goto	i1l1727
u115_20:
	line	452
	
i1l4038:	
;common.c: 452: uiBigTimer--;
	movlw	low(01h)
	subwf	(_uiBigTimer),f
	movlw	high(01h)
	skipc
	decf	(_uiBigTimer+1),f
	subwf	(_uiBigTimer+1),f
	
i1l1727:	
	line	454
;common.c: 454: if(uiSmallTimer)
	movf	(_uiSmallTimer+1),w
	iorwf	(_uiSmallTimer),w
	skipnz
	goto	u116_21
	goto	u116_20
u116_21:
	goto	i1l1728
u116_20:
	line	455
	
i1l4040:	
;common.c: 455: uiSmallTimer--;
	movlw	low(01h)
	subwf	(_uiSmallTimer),f
	movlw	high(01h)
	skipc
	decf	(_uiSmallTimer+1),f
	subwf	(_uiSmallTimer+1),f
	
i1l1728:	
	line	457
;common.c: 457: if(uiTwentySecondsTimer)
	bsf	status, 5	;RP0=1, select bank1
	movf	(_uiTwentySecondsTimer+1)^080h,w
	iorwf	(_uiTwentySecondsTimer)^080h,w
	skipnz
	goto	u117_21
	goto	u117_20
u117_21:
	goto	i1l4044
u117_20:
	line	458
	
i1l4042:	
;common.c: 458: uiTwentySecondsTimer--;
	movlw	low(01h)
	subwf	(_uiTwentySecondsTimer)^080h,f
	movlw	high(01h)
	skipc
	decf	(_uiTwentySecondsTimer+1)^080h,f
	subwf	(_uiTwentySecondsTimer+1)^080h,f
	line	462
	
i1l4044:	
;common.c: 459: }
;common.c: 460: }
;common.c: 462: if(ADIF)
	bcf	status, 5	;RP0=0, select bank0
	btfss	(106/8),(106)&7
	goto	u118_21
	goto	u118_20
u118_21:
	goto	i1l1735
u118_20:
	line	464
	
i1l4046:	
;common.c: 463: {
;common.c: 464: ADIF=0;
	bcf	(106/8),(106)&7
	line	465
	
i1l4048:	
;common.c: 465: setAD_ConvertFlag(1);
	movlw	(01h)
	fcall	i1_setAD_ConvertFlag
	line	467
	
i1l4050:	
;common.c: 467: if(sampleChannelSelect == 4)
	movf	(_sampleChannelSelect),w
	xorlw	04h
	skipz
	goto	u119_21
	goto	u119_20
u119_21:
	goto	i1l4054
u119_20:
	line	471
	
i1l4052:	
;common.c: 468: {
;common.c: 471: vPutSampleDataIntoTable(adc_get(),4);
	fcall	_adc_get
	movf	(1+(?_adc_get)),w
	movwf	(?_vPutSampleDataIntoTable+1)
	movf	(0+(?_adc_get)),w
	movwf	(?_vPutSampleDataIntoTable)
	movlw	(04h)
	movwf	0+(?_vPutSampleDataIntoTable)+02h
	fcall	_vPutSampleDataIntoTable
	line	475
;common.c: 475: }
	goto	i1l1735
	line	476
	
i1l4054:	
;common.c: 476: else if(sampleChannelSelect == 1)
	decf	(_sampleChannelSelect),w
	skipz
	goto	u120_21
	goto	u120_20
u120_21:
	goto	i1l4058
u120_20:
	line	479
	
i1l4056:	
;common.c: 477: {
;common.c: 479: vPutSampleDataIntoTable(adc_get(),1);
	fcall	_adc_get
	movf	(1+(?_adc_get)),w
	movwf	(?_vPutSampleDataIntoTable+1)
	movf	(0+(?_adc_get)),w
	movwf	(?_vPutSampleDataIntoTable)
	clrf	0+(?_vPutSampleDataIntoTable)+02h
	incf	0+(?_vPutSampleDataIntoTable)+02h,f
	fcall	_vPutSampleDataIntoTable
	line	484
;common.c: 484: }
	goto	i1l1735
	line	490
	
i1l4058:	
;common.c: 485: else
;common.c: 486: {
;common.c: 490: vPutSampleDataIntoTable(adc_get(),14);
	fcall	_adc_get
	movf	(1+(?_adc_get)),w
	movwf	(?_vPutSampleDataIntoTable+1)
	movf	(0+(?_adc_get)),w
	movwf	(?_vPutSampleDataIntoTable)
	movlw	(0Eh)
	movwf	0+(?_vPutSampleDataIntoTable)+02h
	fcall	_vPutSampleDataIntoTable
	line	495
	
i1l1735:	
	movf	(??_ISR+3),w
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	movwf	btemp+1
	movf	(??_ISR+2),w
	movwf	pclath
	movf	(??_ISR+1),w
	movwf	fsr0
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
psect	text735,local,class=CODE,delta=2
global __ptext735
__ptext735:

;; *************** function i1_setAD_ConvertFlag *****************
;; Defined at:
;;		line 206 in file "D:\develop\ATK\AK7030-OTP\common.c"
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
psect	text735
	file	"D:\develop\ATK\AK7030-OTP\common.c"
	line	206
	global	__size_ofi1_setAD_ConvertFlag
	__size_ofi1_setAD_ConvertFlag	equ	__end_ofi1_setAD_ConvertFlag-i1_setAD_ConvertFlag
	
i1_setAD_ConvertFlag:	
	opt	stack 3
; Regs used in i1_setAD_ConvertFlag: [wreg]
;i1setAD_ConvertFlag@flag stored from wreg
	movwf	(i1setAD_ConvertFlag@flag)
	line	207
	
i1l4064:	
;common.c: 207: adc_convert_flag = flag;
	movf	(i1setAD_ConvertFlag@flag),w
	movwf	(_adc_convert_flag)
	line	208
	
i1l1646:	
	return
	opt stack 0
GLOBAL	__end_ofi1_setAD_ConvertFlag
	__end_ofi1_setAD_ConvertFlag:
;; =============== function i1_setAD_ConvertFlag ends ============

	signat	i1_setAD_ConvertFlag,88
	global	_adc_get
psect	text736,local,class=CODE,delta=2
global __ptext736
__ptext736:

;; *************** function _adc_get *****************
;; Defined at:
;;		line 105 in file "D:\develop\ATK\AK7030-OTP\periph.c"
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
psect	text736
	file	"D:\develop\ATK\AK7030-OTP\periph.c"
	line	105
	global	__size_of_adc_get
	__size_of_adc_get	equ	__end_of_adc_get-_adc_get
	
_adc_get:	
	opt	stack 3
; Regs used in _adc_get: [wreg]
	line	107
	
i1l4060:	
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
	
i1l2389:	
	return
	opt stack 0
GLOBAL	__end_of_adc_get
	__end_of_adc_get:
;; =============== function _adc_get ends ============

	signat	_adc_get,90
	global	_vPutSampleDataIntoTable
psect	text737,local,class=CODE,delta=2
global __ptext737
__ptext737:

;; *************** function _vPutSampleDataIntoTable *****************
;; Defined at:
;;		line 97 in file "D:\develop\ATK\AK7030-OTP\common.c"
;; Parameters:    Size  Location     Type
;;  uiSampleData    2    4[COMMON] unsigned int 
;;  channel         1    6[COMMON] unsigned char 
;; Auto vars:     Size  Location     Type
;;  i               2    7[COMMON] int 
;; Return value:  Size  Location     Type
;;		None               void
;; Registers used:
;;		wreg, fsr0l, fsr0h, status,2, status,0, btemp+1
;; Tracked objects:
;;		On entry : 60/20
;;		On exit  : 0/0
;;		Unchanged: FFE00/0
;; Data sizes:     COMMON   BANK0   BANK1   BANK3   BANK2
;;      Params:         3       0       0       0       0
;;      Locals:         2       0       0       0       0
;;      Temps:          0       0       0       0       0
;;      Totals:         5       0       0       0       0
;;Total ram usage:        5 bytes
;; Hardware stack levels used:    1
;; This function calls:
;;		Nothing
;; This function is called by:
;;		_ISR
;; This function uses a non-reentrant model
;;
psect	text737
	file	"D:\develop\ATK\AK7030-OTP\common.c"
	line	97
	global	__size_of_vPutSampleDataIntoTable
	__size_of_vPutSampleDataIntoTable	equ	__end_of_vPutSampleDataIntoTable-_vPutSampleDataIntoTable
	
_vPutSampleDataIntoTable:	
	opt	stack 3
; Regs used in _vPutSampleDataIntoTable: [wreg-fsr0h+status,2+status,0+btemp+1]
	line	105
	
i1l3950:	
;common.c: 99: static unsigned char ucChannelFirstLength = 0;
;common.c: 101: static unsigned char ucChannelFourthLength = 0;
;common.c: 103: static unsigned char ucChannelFourteenthLength = 0;
;common.c: 105: if(channel == 1)
	decf	(vPutSampleDataIntoTable@channel),w
	skipz
	goto	u101_21
	goto	u101_20
u101_21:
	goto	i1l3962
u101_20:
	line	107
	
i1l3952:	
;common.c: 106: {
;common.c: 107: if(ucChannelFirstLength < 12)
	movlw	(0Ch)
	subwf	(vPutSampleDataIntoTable@ucChannelFirstLength),w
	skipnc
	goto	u102_21
	goto	u102_20
u102_21:
	goto	i1l3958
u102_20:
	line	109
	
i1l3954:	
;common.c: 108: {
;common.c: 109: uiSampleChannelFirst[ucChannelFirstLength] = uiSampleData;
	clrc
	rlf	(vPutSampleDataIntoTable@ucChannelFirstLength),w
	addlw	_uiSampleChannelFirst&0ffh
	movwf	fsr0
	movf	(vPutSampleDataIntoTable@uiSampleData),w
	bcf	status, 7	;select IRP bank1
	movwf	indf
	incf	fsr0,f
	movf	(vPutSampleDataIntoTable@uiSampleData+1),w
	movwf	indf
	line	111
	
i1l3956:	
;common.c: 111: ucChannelFirstLength++;
	incf	(vPutSampleDataIntoTable@ucChannelFirstLength),f
	line	112
;common.c: 112: }
	goto	i1l1628
	line	115
	
i1l3958:	
;common.c: 113: else
;common.c: 114: {
;common.c: 115: ucChannelFirstLength = 0;
	clrf	(vPutSampleDataIntoTable@ucChannelFirstLength)
	line	117
	
i1l3960:	
;common.c: 117: uiSampleChannelFirst[ucChannelFirstLength] = uiSampleData;
	clrc
	rlf	(vPutSampleDataIntoTable@ucChannelFirstLength),w
	addlw	_uiSampleChannelFirst&0ffh
	movwf	fsr0
	movf	(vPutSampleDataIntoTable@uiSampleData),w
	bcf	status, 7	;select IRP bank1
	movwf	indf
	incf	fsr0,f
	movf	(vPutSampleDataIntoTable@uiSampleData+1),w
	movwf	indf
	goto	i1l1628
	line	120
	
i1l3962:	
;common.c: 120: else if(channel == 4)
	movf	(vPutSampleDataIntoTable@channel),w
	xorlw	04h
	skipz
	goto	u103_21
	goto	u103_20
u103_21:
	goto	i1l3974
u103_20:
	line	122
	
i1l3964:	
;common.c: 121: {
;common.c: 122: if(ucChannelFourthLength < 12)
	movlw	(0Ch)
	bcf	status, 5	;RP0=0, select bank0
	subwf	(vPutSampleDataIntoTable@ucChannelFourthLength),w
	skipnc
	goto	u104_21
	goto	u104_20
u104_21:
	goto	i1l3970
u104_20:
	line	124
	
i1l3966:	
;common.c: 123: {
;common.c: 124: uiSampleChannelFourth[ucChannelFourthLength] = uiSampleData;
	clrc
	rlf	(vPutSampleDataIntoTable@ucChannelFourthLength),w
	addlw	_uiSampleChannelFourth&0ffh
	movwf	fsr0
	movf	(vPutSampleDataIntoTable@uiSampleData),w
	bcf	status, 7	;select IRP bank1
	movwf	indf
	incf	fsr0,f
	movf	(vPutSampleDataIntoTable@uiSampleData+1),w
	movwf	indf
	line	126
	
i1l3968:	
;common.c: 126: ucChannelFourthLength++;
	incf	(vPutSampleDataIntoTable@ucChannelFourthLength),f
	line	127
;common.c: 127: }
	goto	i1l1628
	line	130
	
i1l3970:	
;common.c: 128: else
;common.c: 129: {
;common.c: 130: ucChannelFourthLength = 0;
	clrf	(vPutSampleDataIntoTable@ucChannelFourthLength)
	line	132
	
i1l3972:	
;common.c: 132: uiSampleChannelFourth[ucChannelFourthLength] = uiSampleData;
	clrc
	rlf	(vPutSampleDataIntoTable@ucChannelFourthLength),w
	addlw	_uiSampleChannelFourth&0ffh
	movwf	fsr0
	movf	(vPutSampleDataIntoTable@uiSampleData),w
	bcf	status, 7	;select IRP bank1
	movwf	indf
	incf	fsr0,f
	movf	(vPutSampleDataIntoTable@uiSampleData+1),w
	movwf	indf
	goto	i1l1628
	line	135
	
i1l3974:	
;common.c: 135: else if(channel == 14)
	movf	(vPutSampleDataIntoTable@channel),w
	xorlw	0Eh
	skipz
	goto	u105_21
	goto	u105_20
u105_21:
	goto	i1l3986
u105_20:
	line	137
	
i1l3976:	
;common.c: 136: {
;common.c: 137: if(ucChannelFourteenthLength < 12)
	movlw	(0Ch)
	bcf	status, 5	;RP0=0, select bank0
	subwf	(vPutSampleDataIntoTable@ucChannelFourteenthLength),w
	skipnc
	goto	u106_21
	goto	u106_20
u106_21:
	goto	i1l3982
u106_20:
	line	139
	
i1l3978:	
;common.c: 138: {
;common.c: 139: uiSampleChannelFourteenth[ucChannelFourteenthLength] = uiSampleData;
	clrc
	rlf	(vPutSampleDataIntoTable@ucChannelFourteenthLength),w
	addlw	_uiSampleChannelFourteenth&0ffh
	movwf	fsr0
	movf	(vPutSampleDataIntoTable@uiSampleData),w
	bcf	status, 7	;select IRP bank1
	movwf	indf
	incf	fsr0,f
	movf	(vPutSampleDataIntoTable@uiSampleData+1),w
	movwf	indf
	line	141
	
i1l3980:	
;common.c: 141: ucChannelFourteenthLength++;
	incf	(vPutSampleDataIntoTable@ucChannelFourteenthLength),f
	line	142
;common.c: 142: }
	goto	i1l1628
	line	145
	
i1l3982:	
;common.c: 143: else
;common.c: 144: {
;common.c: 145: ucChannelFourteenthLength = 0;
	clrf	(vPutSampleDataIntoTable@ucChannelFourteenthLength)
	line	147
	
i1l3984:	
;common.c: 147: uiSampleChannelFourth[ucChannelFourteenthLength] = uiSampleData;
	clrc
	rlf	(vPutSampleDataIntoTable@ucChannelFourteenthLength),w
	addlw	_uiSampleChannelFourth&0ffh
	movwf	fsr0
	movf	(vPutSampleDataIntoTable@uiSampleData),w
	bcf	status, 7	;select IRP bank1
	movwf	indf
	incf	fsr0,f
	movf	(vPutSampleDataIntoTable@uiSampleData+1),w
	movwf	indf
	goto	i1l1628
	line	152
	
i1l3986:	
;common.c: 150: else
;common.c: 151: {
;common.c: 152: ucChannelFirstLength = 0;
	clrf	(vPutSampleDataIntoTable@ucChannelFirstLength)
	line	154
;common.c: 154: ucChannelFourthLength = 0;
	bcf	status, 5	;RP0=0, select bank0
	clrf	(vPutSampleDataIntoTable@ucChannelFourthLength)
	line	156
;common.c: 156: ucChannelFourteenthLength = 0;
	clrf	(vPutSampleDataIntoTable@ucChannelFourteenthLength)
	line	158
;common.c: 158: for(int i = 0;i < 12; i++)
	clrf	(vPutSampleDataIntoTable@i)
	clrf	(vPutSampleDataIntoTable@i+1)
	line	160
	
i1l3992:	
;common.c: 159: {
;common.c: 160: uiSampleChannelFirst[i] = 0;
	clrc
	rlf	(vPutSampleDataIntoTable@i),w
	addlw	_uiSampleChannelFirst&0ffh
	movwf	fsr0
	bcf	status, 7	;select IRP bank1
	clrf	indf
	incf	fsr0,f
	clrf	indf
	line	162
;common.c: 162: uiSampleChannelFourth[i] = 0;
	clrc
	rlf	(vPutSampleDataIntoTable@i),w
	addlw	_uiSampleChannelFourth&0ffh
	movwf	fsr0
	clrf	indf
	incf	fsr0,f
	clrf	indf
	line	164
;common.c: 164: uiSampleChannelFourth[i] = 0;
	clrc
	rlf	(vPutSampleDataIntoTable@i),w
	addlw	_uiSampleChannelFourth&0ffh
	movwf	fsr0
	clrf	indf
	incf	fsr0,f
	clrf	indf
	line	158
	
i1l3994:	
	incf	(vPutSampleDataIntoTable@i),f
	skipnz
	incf	(vPutSampleDataIntoTable@i+1),f
	
i1l3996:	
	movf	(vPutSampleDataIntoTable@i+1),w
	xorlw	80h
	movwf	btemp+1
	movlw	(high(0Ch))^80h
	subwf	btemp+1,w
	skipz
	goto	u107_25
	movlw	low(0Ch)
	subwf	(vPutSampleDataIntoTable@i),w
u107_25:

	skipc
	goto	u107_21
	goto	u107_20
u107_21:
	goto	i1l3992
u107_20:
	line	168
	
i1l1628:	
	return
	opt stack 0
GLOBAL	__end_of_vPutSampleDataIntoTable
	__end_of_vPutSampleDataIntoTable:
;; =============== function _vPutSampleDataIntoTable ends ============

	signat	_vPutSampleDataIntoTable,8312
psect	text738,local,class=CODE,delta=2
global __ptext738
__ptext738:
	global	btemp
	btemp set 07Eh

	DABS	1,126,2	;btemp
	global	wtemp0
	wtemp0 set btemp
	end
