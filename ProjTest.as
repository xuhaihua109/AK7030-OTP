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
# 70 "D:\develop\190625\AK7030-OTP\main.c"
	psect config,class=CONFIG,delta=2 ;#
# 70 "D:\develop\190625\AK7030-OTP\main.c"
	dw 0x2FFF & 0x3FFF & 0x3FFF & 0x3FFF & 0x3FFF & 0x3FFF ;#
# 71 "D:\develop\190625\AK7030-OTP\main.c"
	psect config,class=CONFIG,delta=2 ;#
# 71 "D:\develop\190625\AK7030-OTP\main.c"
	dw 0x3FFF & 0x3FDF & 0x3FFF & 0x3FFE ;#
# 72 "D:\develop\190625\AK7030-OTP\main.c"
	psect config,class=CONFIG,delta=2 ;#
# 72 "D:\develop\190625\AK7030-OTP\main.c"
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
	file	"D:\develop\190625\AK7030-OTP\common.c"
	line	24

;initializer for _sampleChannelSelect
	retlw	0Eh
	global	_adc_convert_flag
	global	_sampleTimes
	global	main@cTimer1s_818
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
	global	main@ucTimerLessADC1ZeroP5s
	global	main@ucTimerLessX1P5s
	global	main@ucTimerLessX2P5s
	global	main@ucTimerP3s
	global	main@ucTimerP5s
	global	main@ucTimerPA6DelayP1s
	global	main@ucTimerPB6DelayP1s
	global	main@ucTimerPowerLed
	global	main@ucTimerRightP5s
	global	main@ucTimerSeond1s
	global	main@ucTimerX1P5s
	global	main@ucTimerX2P5s
	global	main@ucTimerZeroPoint3s
	global	main@ucTimerZeroPoint5s
	global	vPutSampleDataIntoTable@ucChannelFourteenthLength
	global	vPutSampleDataIntoTable@ucChannelFourthLength
	global	vPutSampleDataIntoTable@ucChannelFirstLength
	global	_uiBigTimer
	global	_uiSmallTimer
	global	_uiTwentySecondsTimer
	global	ISR@ucTimer1sCnt
	global	_timer
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
_adc_convert_flag:
       ds      1

_sampleTimes:
       ds      1

main@cTimer1s_818:
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

main@ucTimerLessADC1ZeroP5s:
       ds      1

main@ucTimerLessX1P5s:
       ds      1

main@ucTimerLessX2P5s:
       ds      1

main@ucTimerP3s:
       ds      1

main@ucTimerP5s:
       ds      1

main@ucTimerPA6DelayP1s:
       ds      1

main@ucTimerPB6DelayP1s:
       ds      1

main@ucTimerPowerLed:
       ds      1

main@ucTimerRightP5s:
       ds      1

main@ucTimerSeond1s:
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
	file	"D:\develop\190625\AK7030-OTP\common.c"
_sampleChannelSelect:
       ds      1

psect	bssBANK1,class=BANK1,space=1
global __pbssBANK1
__pbssBANK1:
_uiBigTimer:
       ds      2

_uiSmallTimer:
       ds      2

_uiTwentySecondsTimer:
       ds      2

ISR@ucTimer1sCnt:
       ds      1

_timer:
       ds      1

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
	movlw	low((__pbssBANK0)+026h)
	fcall	clear_ram
; Clear objects allocated to BANK1
psect cinit,class=CODE,delta=2
	movlw	low(__pbssBANK1)
	movwf	fsr
	movlw	low((__pbssBANK1)+050h)
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
;;Data sizes: Strings 0, constant 0, data 1, bss 119, persistent 0 stack 0
;;Auto spaces:   Size  Autos    Used
;; COMMON          14     13      14
;; BANK0           80     41      80
;; BANK1           80      0      80
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
;;BANK1               50      0      50       8      100.0%
;;BITBANK1            50      0       0       7        0.0%
;;CODE                 0      0       0       0        0.0%
;;DATA                 0      0      B5       6        0.0%
;;ABS                  0      0      AE       3        0.0%
;;NULL                 0      0       0       0        0.0%
;;STACK                0      0       7       2        0.0%
;;BANK0               50     29      50       5      100.0%
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
;;		line 129 in file "D:\develop\190625\AK7030-OTP\main.c"
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
	file	"D:\develop\190625\AK7030-OTP\main.c"
	line	129
	global	__size_of_main
	__size_of_main	equ	__end_of_main-_main
	
_main:	
	opt	stack 3
; Regs used in _main: [wreg-fsr0h+status,2+status,0+btemp+1+pclath+cstack]
	line	150
	
l4184:	
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
	
l4186:	
;main.c: 161: initPin();
	fcall	_initPin
	line	164
	
l4188:	
;main.c: 164: TRISB2 = 1;
	bcf	status, 6	;RP1=0, select bank1
	bsf	(1074/8)^080h,(1074)&7
	line	166
	
l4190:	
;main.c: 166: TRISB7 = 1;
	bsf	(1079/8)^080h,(1079)&7
	line	167
	
l4192:	
;main.c: 167: TRISB4 = 1;
	bsf	(1076/8)^080h,(1076)&7
	line	169
	
l4194:	
;main.c: 169: clock_config();
	fcall	_clock_config
	line	170
	
l4196:	
;main.c: 170: timer1_config();
	fcall	_timer1_config
	line	171
;main.c: 171: timer1_interrupt_config();
	fcall	_timer1_interrupt_config
	line	173
	
l4198:	
;main.c: 173: adc_test_init(14,3);
	movlw	(03h)
	bcf	status, 5	;RP0=0, select bank0
	movwf	(?_adc_test_init)
	movlw	(0Eh)
	fcall	_adc_test_init
	line	175
	
l4200:	
;main.c: 175: dac_init();
	fcall	_dac_init
	line	176
	
l4202:	
;main.c: 176: op1_init();
	fcall	_op1_init
	line	177
	
l4204:	
;main.c: 177: op2_init();
	fcall	_op2_init
	line	180
;main.c: 180: adc_start();
	fcall	_adc_start
	line	215
	
l4206:	
# 215 "D:\develop\190625\AK7030-OTP\main.c"
 clrwdt ;#
psect	maintext
	line	217
	
l4208:	
;main.c: 217: process_AD_Converter_Value();
	fcall	_process_AD_Converter_Value
	line	219
	
l4210:	
;main.c: 219: if(isPermitSampleTime())
	fcall	_isPermitSampleTime
	xorlw	0
	skipnz
	goto	u1331
	goto	u1330
u1331:
	goto	l4206
u1330:
	line	221
	
l4212:	
;main.c: 220: {
;main.c: 221: clrSampeTime();
	fcall	_clrSampeTime
	line	223
	
l4214:	
;main.c: 223: if(ucTimerPowerLed < 30)
	movlw	(01Eh)
	bcf	status, 5	;RP0=0, select bank0
	subwf	(main@ucTimerPowerLed),w
	skipnc
	goto	u1341
	goto	u1340
u1341:
	goto	l4218
u1340:
	line	225
	
l4216:	
;main.c: 224: {
;main.c: 225: ucTimerPowerLed ++;
	incf	(main@ucTimerPowerLed),f
	line	226
;main.c: 226: }
	goto	l4752
	line	229
	
l4218:	
;main.c: 227: else
;main.c: 228: {
;main.c: 229: ucTimerPowerLed = 0;
	clrf	(main@ucTimerPowerLed)
	line	230
	
l4220:	
;main.c: 230: PB1 = 0;
	bcf	(49/8),(49)&7
	goto	l4752
	line	239
	
l4222:	
;main.c: 237: {
;main.c: 238: static unsigned char ucTimerZeroPoint5s = 0;
;main.c: 239: if(getAdOriginalCh14Value() > 1950)
	fcall	_getAdOriginalCh14Value
	movlw	high(079Fh)
	subwf	(1+(?_getAdOriginalCh14Value)),w
	movlw	low(079Fh)
	skipnz
	subwf	(0+(?_getAdOriginalCh14Value)),w
	skipc
	goto	u1351
	goto	u1350
u1351:
	goto	l4226
u1350:
	line	241
	
l4224:	
;main.c: 240: {
;main.c: 241: ucTimerZeroPoint5s++;
	incf	(main@ucTimerZeroPoint5s),f
	line	242
;main.c: 242: }
	goto	l4228
	line	244
	
l4226:	
;main.c: 243: else
;main.c: 244: ucTimerZeroPoint5s = 0;
	clrf	(main@ucTimerZeroPoint5s)
	line	246
	
l4228:	
;main.c: 246: if(ucTimerZeroPoint5s >= 5)
	movlw	(05h)
	subwf	(main@ucTimerZeroPoint5s),w
	skipc
	goto	u1361
	goto	u1360
u1361:
	goto	l4206
u1360:
	line	248
	
l4230:	
;main.c: 247: {
;main.c: 248: ucTimerZeroPoint5s = 0;
	clrf	(main@ucTimerZeroPoint5s)
	line	249
	
l4232:	
;main.c: 249: enumMainLoopStep = MAIN_LOOP_STEP_FIRST;
	bcf	status, 5	;RP0=0, select bank0
	clrf	(main@enumMainLoopStep)
	incf	(main@enumMainLoopStep),f
	goto	l4206
	line	250
	
l710:	
	line	251
;main.c: 250: }
;main.c: 251: break;
	goto	l4206
	line	259
	
l4234:	
;main.c: 255: {
;main.c: 256: static unsigned char ucTimerZeroPoint3s = 0;
;main.c: 259: if(getAdOriginalCh14Value() > 1950)
	fcall	_getAdOriginalCh14Value
	movlw	high(079Fh)
	subwf	(1+(?_getAdOriginalCh14Value)),w
	movlw	low(079Fh)
	skipnz
	subwf	(0+(?_getAdOriginalCh14Value)),w
	skipc
	goto	u1371
	goto	u1370
u1371:
	goto	l4240
u1370:
	line	262
	
l4236:	
;main.c: 260: {
;main.c: 262: enumMainLoopStep = MAIN_LOOP_STEP_SECOND;
	movlw	(02h)
	movwf	(main@enumMainLoopStep)
	line	264
	
l4238:	
;main.c: 264: ucTimerZeroPoint3s = 0;
	clrf	(main@ucTimerZeroPoint3s)
	line	265
;main.c: 265: }
	goto	l4206
	line	268
	
l4240:	
;main.c: 266: else
;main.c: 267: {
;main.c: 268: ucTimerZeroPoint3s++;
	incf	(main@ucTimerZeroPoint3s),f
	line	270
	
l4242:	
;main.c: 270: if(ucTimerZeroPoint3s >= 3)
	movlw	(03h)
	subwf	(main@ucTimerZeroPoint3s),w
	skipc
	goto	u1381
	goto	u1380
u1381:
	goto	l710
u1380:
	line	272
	
l4244:	
;main.c: 271: {
;main.c: 272: ucTimerZeroPoint3s = 0;
	clrf	(main@ucTimerZeroPoint3s)
	line	274
	
l4246:	
;main.c: 274: clearPinPortAndTimer();
	fcall	_clearPinPortAndTimer
	goto	l4206
	line	280
;main.c: 278: }
;main.c: 280: case MAIN_LOOP_STEP_SECOND:
	
l718:	
	line	284
;main.c: 281: {
;main.c: 282: static unsigned char ucTimerP5s = 0;
;main.c: 284: PA6 = 1;
	bsf	(46/8),(46)&7
	line	286
	
l4248:	
;main.c: 286: if(ucTimerP5s < 5)
	movlw	(05h)
	subwf	(main@ucTimerP5s),w
	skipnc
	goto	u1391
	goto	u1390
u1391:
	goto	l4252
u1390:
	line	287
	
l4250:	
;main.c: 287: ucTimerP5s++;
	incf	(main@ucTimerP5s),f
	goto	l4206
	line	290
	
l4252:	
;main.c: 288: else
;main.c: 289: {
;main.c: 290: ucTimerP5s = 0;
	clrf	(main@ucTimerP5s)
	line	292
	
l4254:	
;main.c: 292: enumMainLoopStep = MAIN_LOOP_STEP_THIRD;
	movlw	(03h)
	movwf	(main@enumMainLoopStep)
	goto	l4206
	line	306
	
l4256:	
;main.c: 299: {
;main.c: 300: static unsigned char ucTimerADC1ZeroP5s = 0;
;main.c: 302: static unsigned char ucTimerLessADC1ZeroP5s = 0;
;main.c: 304: static unsigned char ucTimerRightP5s = 0;
;main.c: 306: if(getAdOriginalCh1Value() < 130)
	fcall	_getAdOriginalCh1Value
	movlw	high(082h)
	subwf	(1+(?_getAdOriginalCh1Value)),w
	movlw	low(082h)
	skipnz
	subwf	(0+(?_getAdOriginalCh1Value)),w
	skipnc
	goto	u1401
	goto	u1400
u1401:
	goto	l4262
u1400:
	line	308
	
l4258:	
;main.c: 307: {
;main.c: 308: ucTimerADC1ZeroP5s = 0;
	clrf	(main@ucTimerADC1ZeroP5s)
	line	310
	
l4260:	
;main.c: 310: ucTimerLessADC1ZeroP5s++;
	incf	(main@ucTimerLessADC1ZeroP5s),f
	line	311
;main.c: 311: }
	goto	l4266
	line	314
	
l4262:	
;main.c: 312: else
;main.c: 313: {
;main.c: 314: ucTimerADC1ZeroP5s++;
	incf	(main@ucTimerADC1ZeroP5s),f
	line	316
	
l4264:	
;main.c: 316: ucTimerLessADC1ZeroP5s = 0;
	clrf	(main@ucTimerLessADC1ZeroP5s)
	line	319
	
l4266:	
;main.c: 317: }
;main.c: 319: if(ucTimerADC1ZeroP5s >= 5)
	movlw	(05h)
	subwf	(main@ucTimerADC1ZeroP5s),w
	skipc
	goto	u1411
	goto	u1410
u1411:
	goto	l4272
u1410:
	line	321
	
l4268:	
;main.c: 320: {
;main.c: 321: ucTimerADC1ZeroP5s = 0;
	clrf	(main@ucTimerADC1ZeroP5s)
	line	322
	
l4270:	
;main.c: 322: enumMainLoopStep = MAIN_LOOP_STEP_FOURTH;
	movlw	(04h)
	movwf	(main@enumMainLoopStep)
	line	323
;main.c: 323: }
	goto	l4288
	line	324
	
l4272:	
;main.c: 324: else if( ucTimerLessADC1ZeroP5s >= 5)
	movlw	(05h)
	subwf	(main@ucTimerLessADC1ZeroP5s),w
	skipc
	goto	u1421
	goto	u1420
u1421:
	goto	l4288
u1420:
	line	328
	
l4274:	
;main.c: 325: {
;main.c: 328: ucTimerLessADC1ZeroP5s = 0;
	clrf	(main@ucTimerLessADC1ZeroP5s)
	line	330
	
l4276:	
;main.c: 330: if(getAdOriginalCh1Value() < 117)
	fcall	_getAdOriginalCh1Value
	movlw	high(075h)
	subwf	(1+(?_getAdOriginalCh1Value)),w
	movlw	low(075h)
	skipnz
	subwf	(0+(?_getAdOriginalCh1Value)),w
	skipnc
	goto	u1431
	goto	u1430
u1431:
	goto	l4280
u1430:
	line	332
	
l4278:	
;main.c: 331: {
;main.c: 332: ucTimerRightP5s++;
	incf	(main@ucTimerRightP5s),f
	line	333
;main.c: 333: }
	goto	l4282
	line	336
	
l4280:	
;main.c: 334: else
;main.c: 335: {
;main.c: 336: ucTimerRightP5s = 0;
	clrf	(main@ucTimerRightP5s)
	line	339
	
l4282:	
;main.c: 337: }
;main.c: 339: if(ucTimerRightP5s >= 5)
	movlw	(05h)
	subwf	(main@ucTimerRightP5s),w
	skipc
	goto	u1441
	goto	u1440
u1441:
	goto	l739
u1440:
	line	341
	
l4284:	
;main.c: 340: {
;main.c: 341: ucTimerRightP5s = 0;
	clrf	(main@ucTimerRightP5s)
	line	342
	
l4286:	
;main.c: 342: enumMainLoopStep = MAIN_LOOP_STEP_3_HOUR_BRANCH;
	movlw	(08h)
	movwf	(main@enumMainLoopStep)
	line	343
;main.c: 343: }
	goto	l4288
	line	352
;main.c: 349: else
;main.c: 350: {
;main.c: 351: ;
	
l739:	
	line	354
	
l4288:	
;main.c: 352: }
;main.c: 354: if((MAIN_LOOP_STEP_3_HOUR_BRANCH == enumMainLoopStep) || (MAIN_LOOP_STEP_FOURTH == enumMainLoopStep))
	movf	(main@enumMainLoopStep),w
	xorlw	08h
	skipnz
	goto	u1451
	goto	u1450
u1451:
	goto	l4292
u1450:
	
l4290:	
	movf	(main@enumMainLoopStep),w
	xorlw	04h
	skipz
	goto	u1461
	goto	u1460
u1461:
	goto	l710
u1460:
	line	356
	
l4292:	
;main.c: 355: {
;main.c: 356: ucTimerRightP5s = 0;
	clrf	(main@ucTimerRightP5s)
	line	357
;main.c: 357: ucTimerADC1ZeroP5s = 0;
	clrf	(main@ucTimerADC1ZeroP5s)
	line	358
;main.c: 358: ucTimerLessADC1ZeroP5s = 0;
	clrf	(main@ucTimerLessADC1ZeroP5s)
	goto	l4206
	line	368
	
l4294:	
;main.c: 366: {
;main.c: 368: startTwelveHourTimer(600);
	movlw	low(0258h)
	movwf	(?_startTwelveHourTimer)
	movlw	high(0258h)
	movwf	((?_startTwelveHourTimer))+1
	fcall	_startTwelveHourTimer
	line	369
	
l4296:	
;main.c: 369: enumMainLoopStep = MAIN_LOOP_STEP_FIFTH;
	movlw	(05h)
	bcf	status, 5	;RP0=0, select bank0
	movwf	(main@enumMainLoopStep)
	line	371
;main.c: 371: break;
	goto	l4206
	line	377
	
l4298:	
;main.c: 375: {
;main.c: 377: if(isFinishedTwelveHoursTimer())
	fcall	_isFinishedTwelveHoursTimer
	xorlw	0
	skipnz
	goto	u1471
	goto	u1470
u1471:
	goto	l4634
u1470:
	line	379
	
l4300:	
;main.c: 378: {
;main.c: 379: enumMainLoopStep = MAIN_LOOP_STEP_12_HOUR_END;
	movlw	(09h)
	bcf	status, 5	;RP0=0, select bank0
	movwf	(main@enumMainLoopStep)
	line	380
;main.c: 380: }
	goto	l4206
	line	389
	
l4302:	
;main.c: 388: {
;main.c: 389: startTwentySecondsTimer();
	fcall	_startTwentySecondsTimer
	line	390
	
l4304:	
;main.c: 390: ucADC4_Step = ADC4_STEP_FIRST;
	bcf	status, 5	;RP0=0, select bank0
	clrf	(main@ucADC4_Step)
	incf	(main@ucADC4_Step),f
	line	391
;main.c: 391: break;
	goto	l4206
	line	396
	
l4306:	
;main.c: 395: {
;main.c: 396: if(getAdOriginaCh4Value() < 1911)
	fcall	_getAdOriginaCh4Value
	movlw	high(0777h)
	subwf	(1+(?_getAdOriginaCh4Value)),w
	movlw	low(0777h)
	skipnz
	subwf	(0+(?_getAdOriginaCh4Value)),w
	skipnc
	goto	u1481
	goto	u1480
u1481:
	goto	l4310
u1480:
	line	397
	
l4308:	
;main.c: 397: ucChannel4Type = LESS_THAN_1911;
	clrf	(main@ucChannel4Type)
	goto	l754
	line	398
	
l4310:	
;main.c: 398: else if(getAdOriginaCh4Value() < 2067)
	fcall	_getAdOriginaCh4Value
	movlw	high(0813h)
	subwf	(1+(?_getAdOriginaCh4Value)),w
	movlw	low(0813h)
	skipnz
	subwf	(0+(?_getAdOriginaCh4Value)),w
	skipnc
	goto	u1491
	goto	u1490
u1491:
	goto	l4314
u1490:
	line	399
	
l4312:	
;main.c: 399: ucChannel4Type = BETWEEN_1911_AND_2067;
	clrf	(main@ucChannel4Type)
	incf	(main@ucChannel4Type),f
	goto	l754
	line	400
	
l4314:	
;main.c: 400: else if(getAdOriginaCh4Value() < 2204)
	fcall	_getAdOriginaCh4Value
	movlw	high(089Ch)
	subwf	(1+(?_getAdOriginaCh4Value)),w
	movlw	low(089Ch)
	skipnz
	subwf	(0+(?_getAdOriginaCh4Value)),w
	skipnc
	goto	u1501
	goto	u1500
u1501:
	goto	l4318
u1500:
	line	401
	
l4316:	
;main.c: 401: ucChannel4Type = BETWEEN_2067_AND_2204;
	movlw	(02h)
	movwf	(main@ucChannel4Type)
	goto	l754
	line	402
	
l4318:	
;main.c: 402: else if(getAdOriginaCh4Value() < 2340)
	fcall	_getAdOriginaCh4Value
	movlw	high(0924h)
	subwf	(1+(?_getAdOriginaCh4Value)),w
	movlw	low(0924h)
	skipnz
	subwf	(0+(?_getAdOriginaCh4Value)),w
	skipnc
	goto	u1511
	goto	u1510
u1511:
	goto	l4322
u1510:
	line	403
	
l4320:	
;main.c: 403: ucChannel4Type = BETWEEN_2204_AND_2340;
	movlw	(03h)
	movwf	(main@ucChannel4Type)
	goto	l754
	line	405
	
l4322:	
;main.c: 404: else
;main.c: 405: ucChannel4Type = MORE_THAN_2340;
	movlw	(04h)
	movwf	(main@ucChannel4Type)
	
l754:	
	line	407
;main.c: 407: ucADC4_Step = ADC4_STEP_SECOND;
	movlw	(02h)
	movwf	(main@ucADC4_Step)
	line	408
;main.c: 408: break;
	goto	l4206
	line	423
;main.c: 422: {
;main.c: 423: case 0:
	
l769:	
	line	425
;main.c: 424: {
;main.c: 425: PB0 = 1;
	bsf	(48/8),(48)&7
	line	426
	
l4324:	
;main.c: 426: ucLoaderStep++;
	incf	(main@ucLoaderStep),f
	line	427
;main.c: 427: break;
	goto	l4206
	line	432
	
l4326:	
;main.c: 431: {
;main.c: 432: if(ucTimerDelay >= 5)
	movlw	(05h)
	subwf	(main@ucTimerDelay),w
	skipc
	goto	u1521
	goto	u1520
u1521:
	goto	l4334
u1520:
	line	434
	
l4328:	
;main.c: 433: {
;main.c: 434: PA0 = 1;
	bsf	(40/8),(40)&7
	line	435
	
l4330:	
;main.c: 435: ucTimerDelay = 0;
	clrf	(main@ucTimerDelay)
	goto	l4324
	line	439
	
l4334:	
;main.c: 438: else
;main.c: 439: ucTimerDelay++;
	incf	(main@ucTimerDelay),f
	goto	l4206
	line	445
	
l4336:	
;main.c: 444: {
;main.c: 445: if(ucTimerDelay >= 5)
	movlw	(05h)
	subwf	(main@ucTimerDelay),w
	skipc
	goto	u1531
	goto	u1530
u1531:
	goto	l4334
u1530:
	line	447
	
l4338:	
;main.c: 446: {
;main.c: 447: PA1= 1;
	bsf	(41/8),(41)&7
	goto	l4330
	line	459
	
l4346:	
;main.c: 458: {
;main.c: 459: if(ucTimerDelay >= 5)
	movlw	(05h)
	subwf	(main@ucTimerDelay),w
	skipc
	goto	u1541
	goto	u1540
u1541:
	goto	l4334
u1540:
	line	461
	
l4348:	
;main.c: 460: {
;main.c: 461: PA2= 1;
	bsf	(42/8),(42)&7
	goto	l4330
	line	472
	
l4356:	
;main.c: 471: {
;main.c: 472: if(ucTimerDelay >= 5)
	movlw	(05h)
	subwf	(main@ucTimerDelay),w
	skipc
	goto	u1551
	goto	u1550
u1551:
	goto	l4334
u1550:
	line	474
	
l4358:	
;main.c: 473: {
;main.c: 474: PA3 = 1;
	bsf	(43/8),(43)&7
	goto	l4330
	line	485
	
l4366:	
;main.c: 484: {
;main.c: 485: if(ucTimerDelay >= 5)
	movlw	(05h)
	subwf	(main@ucTimerDelay),w
	skipc
	goto	u1561
	goto	u1560
u1561:
	goto	l4334
u1560:
	line	487
	
l4368:	
;main.c: 486: {
;main.c: 487: PB0 = 0;
	bcf	(48/8),(48)&7
	line	488
;main.c: 488: PA0 = 0;
	bcf	(40/8),(40)&7
	line	489
;main.c: 489: PA1 = 0;
	bcf	(41/8),(41)&7
	line	490
;main.c: 490: PA2 = 0;
	bcf	(42/8),(42)&7
	line	491
;main.c: 491: PA3 = 0;
	bcf	(43/8),(43)&7
	goto	l4330
	line	502
	
l4376:	
;main.c: 501: {
;main.c: 502: if(ucTimerDelay >= 2)
	movlw	(02h)
	subwf	(main@ucTimerDelay),w
	skipc
	goto	u1571
	goto	u1570
u1571:
	goto	l4334
u1570:
	line	504
	
l4378:	
;main.c: 503: {
;main.c: 504: ucTimerDelay = 0;
	clrf	(main@ucTimerDelay)
	line	506
;main.c: 506: ucLoaderStep = 0;
	clrf	(main@ucLoaderStep)
	line	507
	
l4380:	
;main.c: 507: ucADC4_Step = ADC4_STEP_THIRD;
	movlw	(03h)
	movwf	(main@ucADC4_Step)
	line	508
;main.c: 508: }
	goto	l4206
	line	421
	
l4386:	
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
goto l710
movlw high(S4970)
movwf pclath
	clrc
	rlf fsr,w
	addlw low(S4970)
	movwf pc
psect	swtext1,local,class=CONST,delta=2
global __pswtext1
__pswtext1:
S4970:
	ljmp	l769
	ljmp	l4326
	ljmp	l4336
	ljmp	l4346
	ljmp	l4356
	ljmp	l4366
	ljmp	l4376
psect	maintext

	line	528
;main.c: 527: {
;main.c: 528: case 0:
	
l797:	
	line	530
;main.c: 529: {
;main.c: 530: PB0 = 1;
	bsf	(48/8),(48)&7
	line	531
	
l4388:	
;main.c: 531: ucLoaderStep1++;
	incf	(main@ucLoaderStep1),f
	line	532
;main.c: 532: break;
	goto	l4206
	line	537
	
l4390:	
;main.c: 536: {
;main.c: 537: if(ucTimerDelay1 >= 5)
	movlw	(05h)
	subwf	(main@ucTimerDelay1),w
	skipc
	goto	u1581
	goto	u1580
u1581:
	goto	l4398
u1580:
	line	539
	
l4392:	
;main.c: 538: {
;main.c: 539: PA0 = 1;
	bsf	(40/8),(40)&7
	line	540
	
l4394:	
;main.c: 540: ucTimerDelay1 = 0;
	clrf	(main@ucTimerDelay1)
	goto	l4388
	line	544
	
l4398:	
;main.c: 543: else
;main.c: 544: ucTimerDelay1++;
	incf	(main@ucTimerDelay1),f
	goto	l4206
	line	550
	
l4400:	
;main.c: 549: {
;main.c: 550: if(ucTimerDelay1 >= 5)
	movlw	(05h)
	subwf	(main@ucTimerDelay1),w
	skipc
	goto	u1591
	goto	u1590
u1591:
	goto	l4398
u1590:
	line	552
	
l4402:	
;main.c: 551: {
;main.c: 552: PA1= 1;
	bsf	(41/8),(41)&7
	goto	l4394
	line	563
	
l4410:	
;main.c: 562: {
;main.c: 563: if(ucTimerDelay1 >= 5)
	movlw	(05h)
	subwf	(main@ucTimerDelay1),w
	skipc
	goto	u1601
	goto	u1600
u1601:
	goto	l4398
u1600:
	line	565
	
l4412:	
;main.c: 564: {
;main.c: 565: PA2 = 1;
	bsf	(42/8),(42)&7
	goto	l4394
	line	576
	
l4420:	
;main.c: 575: {
;main.c: 576: if(ucTimerDelay1 >= 5)
	movlw	(05h)
	subwf	(main@ucTimerDelay1),w
	skipc
	goto	u1611
	goto	u1610
u1611:
	goto	l4398
u1610:
	line	578
	
l4422:	
;main.c: 577: {
;main.c: 578: PA3 = 1;
	bsf	(43/8),(43)&7
	goto	l4394
	line	589
	
l4430:	
;main.c: 588: {
;main.c: 589: if(ucTimerDelay1 >= 5)
	movlw	(05h)
	subwf	(main@ucTimerDelay1),w
	skipc
	goto	u1621
	goto	u1620
u1621:
	goto	l4398
u1620:
	line	591
	
l4432:	
;main.c: 590: {
;main.c: 591: PA0 = 0;
	bcf	(40/8),(40)&7
	line	592
;main.c: 592: PA1 = 0;
	bcf	(41/8),(41)&7
	line	593
;main.c: 593: PA2 = 0;
	bcf	(42/8),(42)&7
	line	594
;main.c: 594: PA3 = 0;
	bcf	(43/8),(43)&7
	goto	l4394
	line	605
	
l4440:	
;main.c: 604: {
;main.c: 605: if(ucTimerDelay1 >= 2)
	movlw	(02h)
	subwf	(main@ucTimerDelay1),w
	skipc
	goto	u1631
	goto	u1630
u1631:
	goto	l4398
u1630:
	line	607
	
l4442:	
;main.c: 606: {
;main.c: 607: ucTimerDelay1 = 0;
	clrf	(main@ucTimerDelay1)
	line	609
;main.c: 609: ucLoaderStep1 = 0;
	clrf	(main@ucLoaderStep1)
	goto	l4380
	line	526
	
l4450:	
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
goto l710
movlw high(S4972)
movwf pclath
	clrc
	rlf fsr,w
	addlw low(S4972)
	movwf pc
psect	swtext2,local,class=CONST,delta=2
global __pswtext2
__pswtext2:
S4972:
	ljmp	l797
	ljmp	l4390
	ljmp	l4400
	ljmp	l4410
	ljmp	l4420
	ljmp	l4430
	ljmp	l4440
psect	maintext

	line	632
;main.c: 631: {
;main.c: 632: case 0:
	
l824:	
	line	634
;main.c: 633: {
;main.c: 634: PB0 = 1;
	bsf	(48/8),(48)&7
	line	635
;main.c: 635: PA0 = 1;
	bsf	(40/8),(40)&7
	line	636
	
l4452:	
;main.c: 636: ucLoaderStep2++;
	incf	(main@ucLoaderStep2),f
	line	637
;main.c: 637: break;
	goto	l4206
	line	642
	
l4454:	
;main.c: 641: {
;main.c: 642: if(ucTimerDelay2 >= 5)
	movlw	(05h)
	subwf	(main@ucTimerDelay2),w
	skipc
	goto	u1641
	goto	u1640
u1641:
	goto	l4462
u1640:
	line	644
	
l4456:	
;main.c: 643: {
;main.c: 644: PA1 = 1;
	bsf	(41/8),(41)&7
	line	645
	
l4458:	
;main.c: 645: ucTimerDelay2 = 0;
	clrf	(main@ucTimerDelay2)
	goto	l4452
	line	649
	
l4462:	
;main.c: 648: else
;main.c: 649: ucTimerDelay2++;
	incf	(main@ucTimerDelay2),f
	goto	l4206
	line	655
	
l4464:	
;main.c: 654: {
;main.c: 655: if(ucTimerDelay2 >= 5)
	movlw	(05h)
	subwf	(main@ucTimerDelay2),w
	skipc
	goto	u1651
	goto	u1650
u1651:
	goto	l4462
u1650:
	line	657
	
l4466:	
;main.c: 656: {
;main.c: 657: PA2 = 1;
	bsf	(42/8),(42)&7
	goto	l4458
	line	668
	
l4474:	
;main.c: 667: {
;main.c: 668: if(ucTimerDelay2 >= 5)
	movlw	(05h)
	subwf	(main@ucTimerDelay2),w
	skipc
	goto	u1661
	goto	u1660
u1661:
	goto	l4462
u1660:
	line	670
	
l4476:	
;main.c: 669: {
;main.c: 670: PA3 = 1;
	bsf	(43/8),(43)&7
	goto	l4458
	line	681
	
l4484:	
;main.c: 680: {
;main.c: 681: if(ucTimerDelay2 >= 5)
	movlw	(05h)
	subwf	(main@ucTimerDelay2),w
	skipc
	goto	u1671
	goto	u1670
u1671:
	goto	l4462
u1670:
	line	684
	
l4486:	
;main.c: 682: {
;main.c: 684: PA1 = 0;
	bcf	(41/8),(41)&7
	line	685
;main.c: 685: PA2 = 0;
	bcf	(42/8),(42)&7
	line	686
;main.c: 686: PA3 = 0;
	bcf	(43/8),(43)&7
	goto	l4458
	line	697
	
l4494:	
;main.c: 696: {
;main.c: 697: if(ucTimerDelay2 >= 2)
	movlw	(02h)
	subwf	(main@ucTimerDelay2),w
	skipc
	goto	u1681
	goto	u1680
u1681:
	goto	l4462
u1680:
	line	699
	
l4496:	
;main.c: 698: {
;main.c: 699: ucTimerDelay2 = 0;
	clrf	(main@ucTimerDelay2)
	line	701
;main.c: 701: ucLoaderStep2 = 0;
	clrf	(main@ucLoaderStep2)
	goto	l4380
	line	630
	
l4504:	
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
goto l710
movlw high(S4974)
movwf pclath
	clrc
	rlf fsr,w
	addlw low(S4974)
	movwf pc
psect	swtext3,local,class=CONST,delta=2
global __pswtext3
__pswtext3:
S4974:
	ljmp	l824
	ljmp	l4454
	ljmp	l4464
	ljmp	l4474
	ljmp	l4484
	ljmp	l4494
psect	maintext

	line	724
;main.c: 723: {
;main.c: 724: case 0:
	
l848:	
	line	726
;main.c: 725: {
;main.c: 726: PB0 = 1;
	bsf	(48/8),(48)&7
	line	727
;main.c: 727: PA0 = 1;
	bsf	(40/8),(40)&7
	line	728
;main.c: 728: PA1 = 1;
	bsf	(41/8),(41)&7
	line	729
	
l4506:	
;main.c: 729: ucLoaderStep3++;
	incf	(main@ucLoaderStep3),f
	line	730
;main.c: 730: break;
	goto	l4206
	line	735
	
l4508:	
;main.c: 734: {
;main.c: 735: if(ucTimerDelay3 >= 5)
	movlw	(05h)
	subwf	(main@ucTimerDelay3),w
	skipc
	goto	u1691
	goto	u1690
u1691:
	goto	l4516
u1690:
	line	737
	
l4510:	
;main.c: 736: {
;main.c: 737: PA2 = 1;
	bsf	(42/8),(42)&7
	line	738
	
l4512:	
;main.c: 738: ucTimerDelay3 = 0;
	clrf	(main@ucTimerDelay3)
	goto	l4506
	line	742
	
l4516:	
;main.c: 741: else
;main.c: 742: ucTimerDelay3++;
	incf	(main@ucTimerDelay3),f
	goto	l4206
	line	748
	
l4518:	
;main.c: 747: {
;main.c: 748: if(ucTimerDelay3 >= 5)
	movlw	(05h)
	subwf	(main@ucTimerDelay3),w
	skipc
	goto	u1701
	goto	u1700
u1701:
	goto	l4516
u1700:
	line	750
	
l4520:	
;main.c: 749: {
;main.c: 750: PA3 = 1;
	bsf	(43/8),(43)&7
	goto	l4512
	line	762
	
l4528:	
;main.c: 761: {
;main.c: 762: if(ucTimerDelay3 >= 5)
	movlw	(05h)
	subwf	(main@ucTimerDelay3),w
	skipc
	goto	u1711
	goto	u1710
u1711:
	goto	l4516
u1710:
	line	765
	
l4530:	
;main.c: 763: {
;main.c: 765: PA2 = 0;
	bcf	(42/8),(42)&7
	line	766
;main.c: 766: PA3 = 0;
	bcf	(43/8),(43)&7
	goto	l4512
	line	777
	
l4538:	
;main.c: 776: {
;main.c: 777: if(ucTimerDelay3 >= 2)
	movlw	(02h)
	subwf	(main@ucTimerDelay3),w
	skipc
	goto	u1721
	goto	u1720
u1721:
	goto	l4516
u1720:
	line	779
	
l4540:	
;main.c: 778: {
;main.c: 779: ucTimerDelay3 = 0;
	clrf	(main@ucTimerDelay3)
	line	781
;main.c: 781: ucLoaderStep3 = 0;
	clrf	(main@ucLoaderStep3)
	goto	l4380
	line	722
	
l4548:	
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
	goto	l848
	xorlw	1^0	; case 1
	skipnz
	goto	l4508
	xorlw	2^1	; case 2
	skipnz
	goto	l4518
	xorlw	3^2	; case 3
	skipnz
	goto	l4528
	xorlw	4^3	; case 4
	skipnz
	goto	l4538
	goto	l710
	opt asmopt_on

	line	804
;main.c: 803: {
;main.c: 804: case 0:
	
l869:	
	line	806
;main.c: 805: {
;main.c: 806: PB0 = 1;
	bsf	(48/8),(48)&7
	line	807
;main.c: 807: PA0 = 1;
	bsf	(40/8),(40)&7
	line	808
;main.c: 808: PA1 = 1;
	bsf	(41/8),(41)&7
	line	809
;main.c: 809: PA2 = 1;
	bsf	(42/8),(42)&7
	line	810
	
l4550:	
;main.c: 810: ucLoaderStep4++;
	incf	(main@ucLoaderStep4),f
	line	811
;main.c: 811: break;
	goto	l4206
	line	816
	
l4552:	
;main.c: 815: {
;main.c: 816: if(ucTimerDelay4 >= 5)
	movlw	(05h)
	subwf	(main@ucTimerDelay4),w
	skipc
	goto	u1731
	goto	u1730
u1731:
	goto	l4560
u1730:
	line	818
	
l4554:	
;main.c: 817: {
;main.c: 818: PA3 = 1;
	bsf	(43/8),(43)&7
	line	819
	
l4556:	
;main.c: 819: ucTimerDelay4 = 0;
	clrf	(main@ucTimerDelay4)
	goto	l4550
	line	823
	
l4560:	
;main.c: 822: else
;main.c: 823: ucTimerDelay4++;
	incf	(main@ucTimerDelay4),f
	goto	l4206
	line	829
	
l4562:	
;main.c: 828: {
;main.c: 829: if(ucTimerDelay4 >= 5)
	movlw	(05h)
	subwf	(main@ucTimerDelay4),w
	skipc
	goto	u1741
	goto	u1740
u1741:
	goto	l4560
u1740:
	line	831
	
l4564:	
;main.c: 830: {
;main.c: 831: PA3 = 0;
	bcf	(43/8),(43)&7
	goto	l4556
	line	842
	
l4572:	
;main.c: 841: {
;main.c: 842: if(ucTimerDelay4 >= 2)
	movlw	(02h)
	subwf	(main@ucTimerDelay4),w
	skipc
	goto	u1751
	goto	u1750
u1751:
	goto	l4560
u1750:
	line	844
	
l4574:	
;main.c: 843: {
;main.c: 844: ucTimerDelay4 = 0;
	clrf	(main@ucTimerDelay4)
	line	846
;main.c: 846: ucLoaderStep4 = 0;
	clrf	(main@ucLoaderStep4)
	goto	l4380
	line	802
	
l4582:	
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
	goto	l869
	xorlw	1^0	; case 1
	skipnz
	goto	l4552
	xorlw	2^1	; case 2
	skipnz
	goto	l4562
	xorlw	3^2	; case 3
	skipnz
	goto	l4572
	goto	l710
	opt asmopt_on

	line	413
	
l4586:	
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
	goto	l4386
	xorlw	1^0	; case 1
	skipnz
	goto	l4450
	xorlw	2^1	; case 2
	skipnz
	goto	l4504
	xorlw	3^2	; case 3
	skipnz
	goto	l4548
	xorlw	4^3	; case 4
	skipnz
	goto	l4582
	goto	l710
	opt asmopt_on

	line	877
	
l4588:	
;main.c: 870: {
;main.c: 871: static unsigned char ucTimerDelayP5s = 0;
;main.c: 873: static unsigned char ucTimerPA6DelayP1s = 0;
;main.c: 875: static unsigned char ucTimerPB6DelayP1s = 0;
;main.c: 877: if(isFinishedTwentySecondsTimer())
	fcall	_isFinishedTwentySecondsTimer
	xorlw	0
	skipnz
	goto	u1761
	goto	u1760
u1761:
	goto	l4304
u1760:
	line	879
	
l4590:	
;main.c: 878: {
;main.c: 879: if(ucTimerPA6DelayP1s < 1)
	bcf	status, 5	;RP0=0, select bank0
	movf	(main@ucTimerPA6DelayP1s),f
	skipz
	goto	u1771
	goto	u1770
u1771:
	goto	l4596
u1770:
	line	881
	
l4592:	
;main.c: 880: {
;main.c: 881: PA6 = 0;
	bcf	(46/8),(46)&7
	line	882
	
l4594:	
;main.c: 882: ucTimerPA6DelayP1s++;
	incf	(main@ucTimerPA6DelayP1s),f
	line	883
;main.c: 883: }
	goto	l4206
	line	886
	
l4596:	
;main.c: 884: else
;main.c: 885: {
;main.c: 886: if(ucTimerPB6DelayP1s < 1)
	movf	(main@ucTimerPB6DelayP1s),f
	skipz
	goto	u1781
	goto	u1780
u1781:
	goto	l4602
u1780:
	line	888
	
l4598:	
;main.c: 887: {
;main.c: 888: PBOD6 =0;
	bsf	status, 5	;RP0=1, select bank3
	bsf	status, 6	;RP1=1, select bank3
	bcf	(3142/8)^0180h,(3142)&7
	line	889
;main.c: 889: PB6 = 1;
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	bsf	(54/8),(54)&7
	line	890
	
l4600:	
;main.c: 890: ucTimerPB6DelayP1s++;
	incf	(main@ucTimerPB6DelayP1s),f
	line	891
;main.c: 891: }
	goto	l4206
	line	894
	
l4602:	
;main.c: 892: else
;main.c: 893: {
;main.c: 894: if(ucTimerDelayP5s < 5)
	movlw	(05h)
	subwf	(main@ucTimerDelayP5s),w
	skipnc
	goto	u1791
	goto	u1790
u1791:
	goto	l4606
u1790:
	line	896
	
l4604:	
;main.c: 895: {
;main.c: 896: ucTimerDelayP5s++;
	incf	(main@ucTimerDelayP5s),f
	line	897
;main.c: 897: }
	goto	l4206
	line	901
	
l4606:	
;main.c: 898: else
;main.c: 899: {
;main.c: 901: ucTimerDelayP5s = 0;
	clrf	(main@ucTimerDelayP5s)
	line	903
;main.c: 903: ucTimerPB6DelayP1s = 0;
	clrf	(main@ucTimerPB6DelayP1s)
	line	904
;main.c: 904: ucTimerPA6DelayP1s = 0;
	clrf	(main@ucTimerPA6DelayP1s)
	line	906
	
l4608:	
;main.c: 906: if((getAdOriginalCh14Value() > 2800))
	fcall	_getAdOriginalCh14Value
	movlw	high(0AF1h)
	subwf	(1+(?_getAdOriginalCh14Value)),w
	movlw	low(0AF1h)
	skipnz
	subwf	(0+(?_getAdOriginalCh14Value)),w
	skipc
	goto	u1801
	goto	u1800
u1801:
	goto	l4612
u1800:
	line	907
	
l4610:	
;main.c: 907: DACR0=0x0F;
	movlw	(0Fh)
	bsf	status, 5	;RP0=1, select bank1
	movwf	(136)^080h	;volatile
	goto	l897
	line	909
	
l4612:	
;main.c: 908: else
;main.c: 909: DACR0=0x07;
	movlw	(07h)
	bsf	status, 5	;RP0=1, select bank1
	movwf	(136)^080h	;volatile
	
l897:	
	line	911
;main.c: 911: ucADC4_Step = ADC4_STEP_FOURTH;
	movlw	(04h)
	bcf	status, 5	;RP0=0, select bank0
	movwf	(main@ucADC4_Step)
	goto	l4206
	line	928
	
l4614:	
;main.c: 923: {
;main.c: 924: static unsigned char ucTimer1s = 0;
;main.c: 926: static unsigned char ucTimerSeond1s = 0;
;main.c: 928: if(ucTimerSeond1s < 5)
	movlw	(05h)
	subwf	(main@ucTimerSeond1s),w
	skipnc
	goto	u1811
	goto	u1810
u1811:
	goto	l4618
u1810:
	line	930
	
l4616:	
;main.c: 929: {
;main.c: 930: ucTimerSeond1s++;
	incf	(main@ucTimerSeond1s),f
	line	931
;main.c: 931: }
	goto	l4206
	line	934
	
l4618:	
;main.c: 932: else
;main.c: 933: {
;main.c: 934: ucTimerSeond1s = 0;
	clrf	(main@ucTimerSeond1s)
	line	936
	
l4620:	
;main.c: 936: if(ucTimer1s < 5)
	movlw	(05h)
	subwf	(main@ucTimer1s),w
	skipnc
	goto	u1821
	goto	u1820
u1821:
	goto	l4628
u1820:
	line	938
	
l4622:	
;main.c: 937: {
;main.c: 938: ucTimer1s++;
	incf	(main@ucTimer1s),f
	line	939
	
l4624:	
;main.c: 939: PB6 = 1;
	bsf	(54/8),(54)&7
	line	940
	
l4626:	
;main.c: 940: PBOD6 = 1;
	bsf	status, 5	;RP0=1, select bank3
	bsf	status, 6	;RP1=1, select bank3
	bsf	(3142/8)^0180h,(3142)&7
	line	941
;main.c: 941: }
	goto	l4206
	line	944
	
l4628:	
;main.c: 942: else
;main.c: 943: {
;main.c: 944: ucTimer1s = 0;
	clrf	(main@ucTimer1s)
	line	946
	
l4630:	
;main.c: 946: enumMainLoopStep = MAIN_LOOP_STEP_FIRST;
	clrf	(main@enumMainLoopStep)
	incf	(main@enumMainLoopStep),f
	line	947
;main.c: 947: ucADC4_Step = ADC4_STEP_INIT;
	clrf	(main@ucADC4_Step)
	goto	l4206
	line	385
	
l4634:	
	bcf	status, 5	;RP0=0, select bank0
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
	goto	l4302
	xorlw	1^0	; case 1
	skipnz
	goto	l4306
	xorlw	2^1	; case 2
	skipnz
	goto	l4586
	xorlw	3^2	; case 3
	skipnz
	goto	l4588
	xorlw	4^3	; case 4
	skipnz
	goto	l4614
	goto	l710
	opt asmopt_on

	line	975
;main.c: 974: {
;main.c: 975: case HOUR_3_BRANCH_STEP_FIRST:
	
l913:	
	line	977
;main.c: 976: {
;main.c: 977: PA7 = 1;
	bsf	(47/8),(47)&7
	line	978
;main.c: 978: PAOD7 = 1;
	bsf	status, 5	;RP0=1, select bank3
	bsf	status, 6	;RP1=1, select bank3
	bsf	(3135/8)^0180h,(3135)&7
	line	979
	
l4636:	
;main.c: 979: startThreeHoursTimer(60);
	movlw	03Ch
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	movwf	(?_startThreeHoursTimer)
	clrf	(?_startThreeHoursTimer+1)
	fcall	_startThreeHoursTimer
	line	981
	
l4638:	
;main.c: 981: PB0 = 1;
	bcf	status, 5	;RP0=0, select bank0
	bsf	(48/8),(48)&7
	line	982
	
l4640:	
;main.c: 982: PA0 = 1;
	bsf	(40/8),(40)&7
	line	983
	
l4642:	
;main.c: 983: PA1 = 1;
	bsf	(41/8),(41)&7
	line	984
	
l4644:	
;main.c: 984: PA2 = 1;
	bsf	(42/8),(42)&7
	line	985
	
l4646:	
;main.c: 985: PA3 = 1;
	bsf	(43/8),(43)&7
	line	987
	
l4648:	
;main.c: 987: enumBranchStep = HOUR_3_BRANCH_STEP_SECOND;
	clrf	(main@enumBranchStep)
	incf	(main@enumBranchStep),f
	line	988
;main.c: 988: break;
	goto	l4206
	line	995
	
l4650:	
;main.c: 992: {
;main.c: 993: static unsigned char ucTimer20s = 0;
;main.c: 995: if(ucTimer20s < 200)
	movlw	(0C8h)
	subwf	(main@ucTimer20s),w
	skipnc
	goto	u1831
	goto	u1830
u1831:
	goto	l4654
u1830:
	line	997
	
l4652:	
;main.c: 996: {
;main.c: 997: ucTimer20s++;
	incf	(main@ucTimer20s),f
	line	999
;main.c: 999: }
	goto	l4206
	line	1003
	
l4654:	
;main.c: 1000: else
;main.c: 1001: {
;main.c: 1003: ucTimer20s = 0;
	clrf	(main@ucTimer20s)
	line	1005
	
l4656:	
;main.c: 1005: enumBranchStep = HOUR_3_BRANCH_STEP_THIRD;
	movlw	(02h)
	movwf	(main@enumBranchStep)
	line	1007
	
l4658:	
;main.c: 1007: PA6 = 0;
	bcf	(46/8),(46)&7
	goto	l4206
	line	1014
	
l4660:	
;main.c: 1013: {
;main.c: 1014: if(isFinishedThreeHoursTimer())
	fcall	_isFinishedThreeHoursTimer
	xorlw	0
	skipnz
	goto	u1841
	goto	u1840
u1841:
	goto	l4666
u1840:
	line	1016
	
l4662:	
;main.c: 1015: {
;main.c: 1016: enumBranchStep = HOUR_3_BRANCH_STEP_FIRST;
	bcf	status, 5	;RP0=0, select bank0
	clrf	(main@enumBranchStep)
	goto	l4300
	line	1025
	
l4666:	
;main.c: 1019: else
;main.c: 1020: {
;main.c: 1021: static unsigned char ucTimerX1P5s = 0;
;main.c: 1023: static unsigned char ucTimerLessX1P5s = 0;
;main.c: 1025: if(getAdOriginalCh1Value() < 130)
	fcall	_getAdOriginalCh1Value
	movlw	high(082h)
	subwf	(1+(?_getAdOriginalCh1Value)),w
	movlw	low(082h)
	skipnz
	subwf	(0+(?_getAdOriginalCh1Value)),w
	skipnc
	goto	u1851
	goto	u1850
u1851:
	goto	l4672
u1850:
	line	1027
	
l4668:	
;main.c: 1026: {
;main.c: 1027: ucTimerX1P5s = 0;
	clrf	(main@ucTimerX1P5s)
	line	1028
	
l4670:	
;main.c: 1028: ucTimerLessX1P5s++;
	incf	(main@ucTimerLessX1P5s),f
	line	1029
;main.c: 1029: }
	goto	l4676
	line	1032
	
l4672:	
;main.c: 1030: else
;main.c: 1031: {
;main.c: 1032: ucTimerX1P5s++;
	incf	(main@ucTimerX1P5s),f
	line	1033
	
l4674:	
;main.c: 1033: ucTimerLessX1P5s = 0;
	clrf	(main@ucTimerLessX1P5s)
	line	1036
	
l4676:	
;main.c: 1034: }
;main.c: 1036: if(ucTimerX1P5s >= 5)
	movlw	(05h)
	subwf	(main@ucTimerX1P5s),w
	skipc
	goto	u1861
	goto	u1860
u1861:
	goto	l4690
u1860:
	line	1038
	
l4678:	
;main.c: 1037: {
;main.c: 1038: ucTimerX1P5s = 0;
	clrf	(main@ucTimerX1P5s)
	line	1039
	
l4680:	
;main.c: 1039: PAOD7 = 0;
	bsf	status, 5	;RP0=1, select bank3
	bsf	status, 6	;RP1=1, select bank3
	bcf	(3135/8)^0180h,(3135)&7
	line	1040
	
l4682:	
;main.c: 1040: PA7 = 0;
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	bcf	(47/8),(47)&7
	line	1041
	
l4684:	
;main.c: 1041: clearThreeHoursTimer();
	fcall	_clearThreeHoursTimer
	line	1043
	
l4686:	
;main.c: 1043: enumBranchStep = HOUR_3_BRANCH_STEP_FIRST;
	bcf	status, 5	;RP0=0, select bank0
	clrf	(main@enumBranchStep)
	line	1045
	
l4688:	
;main.c: 1045: enumMainLoopStep = MAIN_LOOP_STEP_SECOND;
	movlw	(02h)
	movwf	(main@enumMainLoopStep)
	line	1046
;main.c: 1046: }
	goto	l4206
	line	1047
	
l4690:	
;main.c: 1047: else if(ucTimerLessX1P5s >= 5)
	movlw	(05h)
	subwf	(main@ucTimerLessX1P5s),w
	skipc
	goto	u1871
	goto	u1870
u1871:
	goto	l710
u1870:
	line	1053
	
l4692:	
;main.c: 1048: {
;main.c: 1049: static unsigned char ucTimerX2P5s = 0;
;main.c: 1051: static unsigned char ucTimerLessX2P5s = 0;
;main.c: 1053: if(getAdOriginalCh14Value() >= 1950)
	fcall	_getAdOriginalCh14Value
	movlw	high(079Eh)
	subwf	(1+(?_getAdOriginalCh14Value)),w
	movlw	low(079Eh)
	skipnz
	subwf	(0+(?_getAdOriginalCh14Value)),w
	skipc
	goto	u1881
	goto	u1880
u1881:
	goto	l4698
u1880:
	line	1055
	
l4694:	
;main.c: 1054: {
;main.c: 1055: ucTimerX2P5s++;
	incf	(main@ucTimerX2P5s),f
	line	1056
	
l4696:	
;main.c: 1056: ucTimerLessX2P5s = 0;
	clrf	(main@ucTimerLessX2P5s)
	line	1057
;main.c: 1057: }
	goto	l4702
	line	1060
	
l4698:	
;main.c: 1058: else
;main.c: 1059: {
;main.c: 1060: ucTimerX2P5s = 0;
	clrf	(main@ucTimerX2P5s)
	line	1061
	
l4700:	
;main.c: 1061: ucTimerLessX2P5s++;
	incf	(main@ucTimerLessX2P5s),f
	line	1064
	
l4702:	
;main.c: 1062: }
;main.c: 1064: if(ucTimerX2P5s >= 5)
	movlw	(05h)
	subwf	(main@ucTimerX2P5s),w
	skipc
	goto	u1891
	goto	u1890
u1891:
	goto	l4706
u1890:
	line	1066
	
l4704:	
;main.c: 1065: {
;main.c: 1066: ucTimerX2P5s = 0;
	clrf	(main@ucTimerX2P5s)
	line	1067
;main.c: 1067: }
	goto	l4206
	line	1068
	
l4706:	
;main.c: 1068: else if(ucTimerLessX2P5s >= 5)
	movlw	(05h)
	subwf	(main@ucTimerLessX2P5s),w
	skipc
	goto	u1901
	goto	u1900
u1901:
	goto	l710
u1900:
	line	1070
	
l4708:	
;main.c: 1069: {
;main.c: 1070: clearPinPortAndTimer();
	fcall	_clearPinPortAndTimer
	goto	l4232
	line	973
	
l4714:	
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
	goto	l913
	xorlw	1^0	; case 1
	skipnz
	goto	l4650
	xorlw	2^1	; case 2
	skipnz
	goto	l4660
	goto	l710
	opt asmopt_on

	line	1109
;main.c: 1108: {
;main.c: 1109: case INTERNAL_FIRST_STEP:
	
l948:	
	line	1111
;main.c: 1110: {
;main.c: 1111: PB0 = 0;
	bcf	(48/8),(48)&7
	line	1112
;main.c: 1112: PB1 = 0;
	bcf	(49/8),(49)&7
	line	1113
;main.c: 1113: PA0 = 0;
	bcf	(40/8),(40)&7
	line	1114
;main.c: 1114: PA1 = 0;
	bcf	(41/8),(41)&7
	line	1115
;main.c: 1115: PA2 = 0;
	bcf	(42/8),(42)&7
	line	1116
;main.c: 1116: PA3 = 0;
	bcf	(43/8),(43)&7
	line	1117
;main.c: 1117: PBOD6 = 0;
	bsf	status, 5	;RP0=1, select bank3
	bsf	status, 6	;RP1=1, select bank3
	bcf	(3142/8)^0180h,(3142)&7
	line	1118
;main.c: 1118: PB6 = 1;
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	bsf	(54/8),(54)&7
	line	1119
;main.c: 1119: PA6 =0;
	bcf	(46/8),(46)&7
	line	1121
;main.c: 1121: enumInteralStep = INTERNAL_SECOND_STEP;
	clrf	(main@enumInteralStep)
	incf	(main@enumInteralStep),f
	line	1122
;main.c: 1122: break;
	goto	l4206
	line	1129
	
l4716:	
;main.c: 1126: {
;main.c: 1127: static unsigned char ucTimer1s = 0;
;main.c: 1129: if(getAdOriginalCh14Value() <= 1000)
	fcall	_getAdOriginalCh14Value
	movlw	high(03E9h)
	subwf	(1+(?_getAdOriginalCh14Value)),w
	movlw	low(03E9h)
	skipnz
	subwf	(0+(?_getAdOriginalCh14Value)),w
	skipnc
	goto	u1911
	goto	u1910
u1911:
	goto	l4720
u1910:
	line	1131
	
l4718:	
;main.c: 1130: {
;main.c: 1131: ucTimer1s++;
	incf	(main@cTimer1s_818),f
	line	1132
;main.c: 1132: }
	goto	l4722
	line	1134
	
l4720:	
;main.c: 1133: else
;main.c: 1134: ucTimer1s = 0;
	clrf	(main@cTimer1s_818)
	line	1136
	
l4722:	
;main.c: 1136: if(ucTimer1s >= 10)
	movlw	(0Ah)
	subwf	(main@cTimer1s_818),w
	skipc
	goto	u1921
	goto	u1920
u1921:
	goto	l710
u1920:
	line	1138
	
l4724:	
;main.c: 1137: {
;main.c: 1138: enumInteralStep = INTERNAL_THIRD_STEP;
	movlw	(02h)
	movwf	(main@enumInteralStep)
	line	1139
	
l4726:	
;main.c: 1139: ucTimer1s = 0;
	clrf	(main@cTimer1s_818)
	goto	l4206
	line	1148
	
l4728:	
;main.c: 1145: {
;main.c: 1146: static unsigned char ucTimerP3s = 0;
;main.c: 1148: if(getAdOriginalCh14Value() >= 1950)
	fcall	_getAdOriginalCh14Value
	movlw	high(079Eh)
	subwf	(1+(?_getAdOriginalCh14Value)),w
	movlw	low(079Eh)
	skipnz
	subwf	(0+(?_getAdOriginalCh14Value)),w
	skipc
	goto	u1931
	goto	u1930
u1931:
	goto	l4732
u1930:
	line	1150
	
l4730:	
;main.c: 1149: {
;main.c: 1150: ucTimerP3s++;
	incf	(main@ucTimerP3s),f
	line	1151
;main.c: 1151: }
	goto	l4734
	line	1153
	
l4732:	
;main.c: 1152: else
;main.c: 1153: ucTimerP3s = 0;
	clrf	(main@ucTimerP3s)
	line	1155
	
l4734:	
;main.c: 1155: if(ucTimerP3s >= 3)
	movlw	(03h)
	subwf	(main@ucTimerP3s),w
	skipc
	goto	u1941
	goto	u1940
u1941:
	goto	l710
u1940:
	line	1157
	
l4736:	
;main.c: 1156: {
;main.c: 1157: enumInteralStep = INTERNAL_FIRST_STEP;
	clrf	(main@enumInteralStep)
	line	1158
;main.c: 1158: ucTimerP3s = 0;
	clrf	(main@ucTimerP3s)
	line	1159
	
l4738:	
;main.c: 1159: clearAllTimer();
	fcall	_clearAllTimer
	line	1161
	
l4740:	
;main.c: 1161: DACR0=0x0F;
	movlw	(0Fh)
	movwf	(136)^080h	;volatile
	line	1162
	
l4742:	
;main.c: 1162: initPin();
	fcall	_initPin
	line	1165
	
l4744:	
;main.c: 1165: enumMainLoopStep = MAIN_LOOP_STEP_INIT;
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	clrf	(main@enumMainLoopStep)
	goto	l4206
	line	1107
	
l4748:	
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
	goto	l948
	xorlw	1^0	; case 1
	skipnz
	goto	l4716
	xorlw	2^1	; case 2
	skipnz
	goto	l4728
	goto	l710
	opt asmopt_on

	line	234
	
l4752:	
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
	goto	l4222
	xorlw	1^0	; case 1
	skipnz
	goto	l4234
	xorlw	2^1	; case 2
	skipnz
	goto	l718
	xorlw	3^2	; case 3
	skipnz
	goto	l4256
	xorlw	4^3	; case 4
	skipnz
	goto	l4294
	xorlw	5^4	; case 5
	skipnz
	goto	l4298
	xorlw	8^5	; case 8
	skipnz
	goto	l4714
	xorlw	9^8	; case 9
	skipnz
	goto	l4748
	goto	l710
	opt asmopt_on

	global	start
	ljmp	start
	opt stack 0
psect	maintext
	line	1186
GLOBAL	__end_of_main
	__end_of_main:
;; =============== function _main ends ============

	signat	_main,88
	global	_clearPinPortAndTimer
psect	text739,local,class=CODE,delta=2
global __ptext739
__ptext739:

;; *************** function _clearPinPortAndTimer *****************
;; Defined at:
;;		line 92 in file "D:\develop\190625\AK7030-OTP\main.c"
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
psect	text739
	file	"D:\develop\190625\AK7030-OTP\main.c"
	line	92
	global	__size_of_clearPinPortAndTimer
	__size_of_clearPinPortAndTimer	equ	__end_of_clearPinPortAndTimer-_clearPinPortAndTimer
	
_clearPinPortAndTimer:	
	opt	stack 3
; Regs used in _clearPinPortAndTimer: [status,2+status,0+pclath+cstack]
	line	93
	
l4180:	
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
	
l4182:	
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
psect	text740,local,class=CODE,delta=2
global __ptext740
__ptext740:

;; *************** function _getAdOriginaCh4Value *****************
;; Defined at:
;;		line 229 in file "D:\develop\190625\AK7030-OTP\common.c"
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
psect	text740
	file	"D:\develop\190625\AK7030-OTP\common.c"
	line	229
	global	__size_of_getAdOriginaCh4Value
	__size_of_getAdOriginaCh4Value	equ	__end_of_getAdOriginaCh4Value-_getAdOriginaCh4Value
	
_getAdOriginaCh4Value:	
	opt	stack 4
; Regs used in _getAdOriginaCh4Value: [wreg-fsr0h+status,2+status,0+btemp+1+pclath+cstack]
	line	231
	
l4176:	
;common.c: 231: return Filter(uiSampleChannelFourth);
	movlw	(_uiSampleChannelFourth)&0ffh
	fcall	_Filter
	movf	(1+(?_Filter)),w
	movwf	(?_getAdOriginaCh4Value+1)
	movf	(0+(?_Filter)),w
	movwf	(?_getAdOriginaCh4Value)
	line	236
	
l1682:	
	return
	opt stack 0
GLOBAL	__end_of_getAdOriginaCh4Value
	__end_of_getAdOriginaCh4Value:
;; =============== function _getAdOriginaCh4Value ends ============

	signat	_getAdOriginaCh4Value,90
	global	_getAdOriginalCh1Value
psect	text741,local,class=CODE,delta=2
global __ptext741
__ptext741:

;; *************** function _getAdOriginalCh1Value *****************
;; Defined at:
;;		line 217 in file "D:\develop\190625\AK7030-OTP\common.c"
;; Parameters:    Size  Location     Type
;;		None
;; Auto vars:     Size  Location     Type
;;		None
;; Return value:  Size  Location     Type
;;                  2   39[BANK0 ] unsigned int 
;; Registers used:
;;		wreg, fsr0l, fsr0h, status,2, status,0, btemp+1, pclath, cstack
;; Tracked objects:
;;		On entry : 40/0
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
psect	text741
	file	"D:\develop\190625\AK7030-OTP\common.c"
	line	217
	global	__size_of_getAdOriginalCh1Value
	__size_of_getAdOriginalCh1Value	equ	__end_of_getAdOriginalCh1Value-_getAdOriginalCh1Value
	
_getAdOriginalCh1Value:	
	opt	stack 4
; Regs used in _getAdOriginalCh1Value: [wreg-fsr0h+status,2+status,0+btemp+1+pclath+cstack]
	line	220
	
l4172:	
;common.c: 220: return Filter(uiSampleChannelFirst);
	movlw	(_uiSampleChannelFirst)&0ffh
	fcall	_Filter
	movf	(1+(?_Filter)),w
	movwf	(?_getAdOriginalCh1Value+1)
	movf	(0+(?_Filter)),w
	movwf	(?_getAdOriginalCh1Value)
	line	225
	
l1679:	
	return
	opt stack 0
GLOBAL	__end_of_getAdOriginalCh1Value
	__end_of_getAdOriginalCh1Value:
;; =============== function _getAdOriginalCh1Value ends ============

	signat	_getAdOriginalCh1Value,90
	global	_getAdOriginalCh14Value
psect	text742,local,class=CODE,delta=2
global __ptext742
__ptext742:

;; *************** function _getAdOriginalCh14Value *****************
;; Defined at:
;;		line 240 in file "D:\develop\190625\AK7030-OTP\common.c"
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
psect	text742
	file	"D:\develop\190625\AK7030-OTP\common.c"
	line	240
	global	__size_of_getAdOriginalCh14Value
	__size_of_getAdOriginalCh14Value	equ	__end_of_getAdOriginalCh14Value-_getAdOriginalCh14Value
	
_getAdOriginalCh14Value:	
	opt	stack 4
; Regs used in _getAdOriginalCh14Value: [wreg-fsr0h+status,2+status,0+btemp+1+pclath+cstack]
	line	242
	
l4168:	
;common.c: 242: return Filter(uiSampleChannelFourteenth);
	movlw	(_uiSampleChannelFourteenth)&0ffh
	fcall	_Filter
	movf	(1+(?_Filter)),w
	movwf	(?_getAdOriginalCh14Value+1)
	movf	(0+(?_Filter)),w
	movwf	(?_getAdOriginalCh14Value)
	line	246
	
l1685:	
	return
	opt stack 0
GLOBAL	__end_of_getAdOriginalCh14Value
	__end_of_getAdOriginalCh14Value:
;; =============== function _getAdOriginalCh14Value ends ============

	signat	_getAdOriginalCh14Value,90
	global	_process_AD_Converter_Value
psect	text743,local,class=CODE,delta=2
global __ptext743
__ptext743:

;; *************** function _process_AD_Converter_Value *****************
;; Defined at:
;;		line 251 in file "D:\develop\190625\AK7030-OTP\common.c"
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
psect	text743
	file	"D:\develop\190625\AK7030-OTP\common.c"
	line	251
	global	__size_of_process_AD_Converter_Value
	__size_of_process_AD_Converter_Value	equ	__end_of_process_AD_Converter_Value-_process_AD_Converter_Value
	
_process_AD_Converter_Value:	
	opt	stack 4
; Regs used in _process_AD_Converter_Value: [wreg+status,2+status,0+pclath+cstack]
	line	252
	
l4152:	
;common.c: 252: if(getAD_ConvertFlag())
	fcall	_getAD_ConvertFlag
	xorlw	0
	skipnz
	goto	u1301
	goto	u1300
u1301:
	goto	l1693
u1300:
	line	254
	
l4154:	
;common.c: 253: {
;common.c: 254: setAD_ConvertFlag(0);
	movlw	(0)
	fcall	_setAD_ConvertFlag
	line	255
;common.c: 255: AD_Sample();
	fcall	_AD_Sample
	line	256
	
l4156:	
;common.c: 256: if(4 == sampleChannelSelect)
	movf	(_sampleChannelSelect),w
	xorlw	04h
	skipz
	goto	u1311
	goto	u1310
u1311:
	goto	l4160
u1310:
	line	257
	
l4158:	
;common.c: 257: adc_test_init(4,3);
	movlw	(03h)
	movwf	(?_adc_test_init)
	movlw	(04h)
	fcall	_adc_test_init
	goto	l4166
	line	258
	
l4160:	
;common.c: 258: else if(1 == sampleChannelSelect)
	decf	(_sampleChannelSelect),w
	skipz
	goto	u1321
	goto	u1320
u1321:
	goto	l4164
u1320:
	line	259
	
l4162:	
;common.c: 259: adc_test_init(1,3);
	movlw	(03h)
	movwf	(?_adc_test_init)
	movlw	(01h)
	fcall	_adc_test_init
	goto	l4166
	line	261
	
l4164:	
;common.c: 260: else
;common.c: 261: adc_test_init(14,3);
	movlw	(03h)
	movwf	(?_adc_test_init)
	movlw	(0Eh)
	fcall	_adc_test_init
	line	263
	
l4166:	
;common.c: 263: adc_start();
	fcall	_adc_start
	line	265
	
l1693:	
	return
	opt stack 0
GLOBAL	__end_of_process_AD_Converter_Value
	__end_of_process_AD_Converter_Value:
;; =============== function _process_AD_Converter_Value ends ============

	signat	_process_AD_Converter_Value,88
	global	_clearAllTimer
psect	text744,local,class=CODE,delta=2
global __ptext744
__ptext744:

;; *************** function _clearAllTimer *****************
;; Defined at:
;;		line 83 in file "D:\develop\190625\AK7030-OTP\main.c"
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
psect	text744
	file	"D:\develop\190625\AK7030-OTP\main.c"
	line	83
	global	__size_of_clearAllTimer
	__size_of_clearAllTimer	equ	__end_of_clearAllTimer-_clearAllTimer
	
_clearAllTimer:	
	opt	stack 4
; Regs used in _clearAllTimer: [status,2+status,0+pclath+cstack]
	line	84
	
l4150:	
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
psect	text745,local,class=CODE,delta=2
global __ptext745
__ptext745:

;; *************** function _AD_Sample *****************
;; Defined at:
;;		line 277 in file "D:\develop\190625\AK7030-OTP\common.c"
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
psect	text745
	file	"D:\develop\190625\AK7030-OTP\common.c"
	line	277
	global	__size_of_AD_Sample
	__size_of_AD_Sample	equ	__end_of_AD_Sample-_AD_Sample
	
_AD_Sample:	
	opt	stack 4
; Regs used in _AD_Sample: [wreg+status,2+status,0]
	line	278
	
l4088:	
;common.c: 278: if(sampleTimes < 12)
	movlw	(0Ch)
	subwf	(_sampleTimes),w
	skipnc
	goto	u1171
	goto	u1170
u1171:
	goto	l1704
u1170:
	line	300
	
l4090:	
;common.c: 279: {
;common.c: 300: sampleTimes++;
	incf	(_sampleTimes),f
	line	302
	
l4092:	
;common.c: 302: if(sampleTimes >= 12)
	movlw	(0Ch)
	subwf	(_sampleTimes),w
	skipc
	goto	u1181
	goto	u1180
u1181:
	goto	l1704
u1180:
	line	304
	
l4094:	
;common.c: 303: {
;common.c: 304: sampleTimes = 0;
	clrf	(_sampleTimes)
	line	306
	
l4096:	
;common.c: 306: if(sampleChannelSelect == 14)
	movf	(_sampleChannelSelect),w
	xorlw	0Eh
	skipz
	goto	u1191
	goto	u1190
u1191:
	goto	l4100
u1190:
	line	310
	
l4098:	
;common.c: 307: {
;common.c: 310: sampleChannelSelect = 1;
	clrf	(_sampleChannelSelect)
	incf	(_sampleChannelSelect),f
	line	311
;common.c: 311: }
	goto	l1704
	line	312
	
l4100:	
;common.c: 312: else if(sampleChannelSelect == 4)
	movf	(_sampleChannelSelect),w
	xorlw	04h
	skipz
	goto	u1201
	goto	u1200
u1201:
	goto	l4104
u1200:
	line	315
	
l4102:	
;common.c: 313: {
;common.c: 315: sampleChannelSelect = 14;
	movlw	(0Eh)
	movwf	(_sampleChannelSelect)
	line	316
;common.c: 316: }
	goto	l1704
	line	317
	
l4104:	
;common.c: 317: else if(sampleChannelSelect == 1)
	decf	(_sampleChannelSelect),w
	skipz
	goto	u1211
	goto	u1210
u1211:
	goto	l4102
u1210:
	line	320
	
l4106:	
;common.c: 318: {
;common.c: 320: sampleChannelSelect = 4;
	movlw	(04h)
	movwf	(_sampleChannelSelect)
	line	333
;common.c: 321: }
	
l1704:	
	return
	opt stack 0
GLOBAL	__end_of_AD_Sample
	__end_of_AD_Sample:
;; =============== function _AD_Sample ends ============

	signat	_AD_Sample,88
	global	_setAD_ConvertFlag
psect	text746,local,class=CODE,delta=2
global __ptext746
__ptext746:

;; *************** function _setAD_ConvertFlag *****************
;; Defined at:
;;		line 206 in file "D:\develop\190625\AK7030-OTP\common.c"
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
psect	text746
	file	"D:\develop\190625\AK7030-OTP\common.c"
	line	206
	global	__size_of_setAD_ConvertFlag
	__size_of_setAD_ConvertFlag	equ	__end_of_setAD_ConvertFlag-_setAD_ConvertFlag
	
_setAD_ConvertFlag:	
	opt	stack 4
; Regs used in _setAD_ConvertFlag: [wreg]
;setAD_ConvertFlag@flag stored from wreg
	movwf	(setAD_ConvertFlag@flag)
	line	207
	
l4086:	
;common.c: 207: adc_convert_flag = flag;
	movf	(setAD_ConvertFlag@flag),w
	movwf	(_adc_convert_flag)
	line	208
	
l1676:	
	return
	opt stack 0
GLOBAL	__end_of_setAD_ConvertFlag
	__end_of_setAD_ConvertFlag:
;; =============== function _setAD_ConvertFlag ends ============

	signat	_setAD_ConvertFlag,4216
	global	_getAD_ConvertFlag
psect	text747,local,class=CODE,delta=2
global __ptext747
__ptext747:

;; *************** function _getAD_ConvertFlag *****************
;; Defined at:
;;		line 200 in file "D:\develop\190625\AK7030-OTP\common.c"
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
psect	text747
	file	"D:\develop\190625\AK7030-OTP\common.c"
	line	200
	global	__size_of_getAD_ConvertFlag
	__size_of_getAD_ConvertFlag	equ	__end_of_getAD_ConvertFlag-_getAD_ConvertFlag
	
_getAD_ConvertFlag:	
	opt	stack 4
; Regs used in _getAD_ConvertFlag: [wreg]
	line	201
	
l4082:	
;common.c: 201: return adc_convert_flag;
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	movf	(_adc_convert_flag),w
	line	202
	
l1673:	
	return
	opt stack 0
GLOBAL	__end_of_getAD_ConvertFlag
	__end_of_getAD_ConvertFlag:
;; =============== function _getAD_ConvertFlag ends ============

	signat	_getAD_ConvertFlag,89
	global	_Filter
psect	text748,local,class=CODE,delta=2
global __ptext748
__ptext748:

;; *************** function _Filter *****************
;; Defined at:
;;		line 51 in file "D:\develop\190625\AK7030-OTP\common.c"
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
;;		On entry : 40/0
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
psect	text748
	file	"D:\develop\190625\AK7030-OTP\common.c"
	line	51
	global	__size_of_Filter
	__size_of_Filter	equ	__end_of_Filter-_Filter
	
_Filter:	
	opt	stack 4
; Regs used in _Filter: [wreg-fsr0h+status,2+status,0+btemp+1]
;Filter@tmpValue stored from wreg
	line	53
	bcf	status, 5	;RP0=0, select bank0
	movwf	(Filter@tmpValue)
	
l3984:	
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
	
l3990:	
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
	
l3992:	
	incf	(Filter@tmpValue),f
	incf	(Filter@tmpValue),f
	line	59
	
l3994:	
	incf	(Filter@cir),f
	skipnz
	incf	(Filter@cir+1),f
	
l3996:	
	movf	(Filter@cir+1),w
	xorlw	80h
	movwf	btemp+1
	movlw	(high(0Ch))^80h
	subwf	btemp+1,w
	skipz
	goto	u1055
	movlw	low(0Ch)
	subwf	(Filter@cir),w
u1055:

	skipc
	goto	u1051
	goto	u1050
u1051:
	goto	l3990
u1050:
	line	63
	
l3998:	
;common.c: 63: for(j = 0; j < 12 - 1; j++)
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	clrf	(Filter@j)
	line	65
	
l4004:	
;common.c: 64: {
;common.c: 65: for(i = 0; i < 12 - 1 - j; i++)
	clrf	(Filter@i)
	goto	l4012
	line	67
	
l4006:	
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
	goto	u1065
	movf	0+(??_Filter+0)+0,w
	subwf	0+(??_Filter+2)+0,w
u1065:
	skipnc
	goto	u1061
	goto	u1060
u1061:
	goto	l4010
u1060:
	line	70
	
l4008:	
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
	
l4010:	
	incf	(Filter@i),f
	
l4012:	
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
	goto	u1075
	movf	0+(??_Filter+0)+0,w
	subwf	(Filter@i),w
u1075:

	skipc
	goto	u1071
	goto	u1070
u1071:
	goto	l4006
u1070:
	line	63
	
l4014:	
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	incf	(Filter@j),f
	
l4016:	
	movlw	(0Bh)
	subwf	(Filter@j),w
	skipc
	goto	u1081
	goto	u1080
u1081:
	goto	l4004
u1080:
	line	79
	
l4018:	
;common.c: 75: }
;common.c: 76: }
;common.c: 77: }
;common.c: 79: for(i = 2; i < 12 - 2; i++)
	movlw	(02h)
	movwf	(Filter@i)
	line	81
	
l4022:	
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
	
l4024:	
	incf	(Filter@i),f
	
l4026:	
	movlw	(0Ah)
	subwf	(Filter@i),w
	skipc
	goto	u1091
	goto	u1090
u1091:
	goto	l4022
u1090:
	line	84
	
l4028:	
;common.c: 82: }
;common.c: 84: return (filter_sum >> 3);
	movf	(Filter@filter_sum+1),w
	movwf	(?_Filter+1)
	movf	(Filter@filter_sum),w
	movwf	(?_Filter)
	
l4030:	
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
	
l1635:	
	return
	opt stack 0
GLOBAL	__end_of_Filter
	__end_of_Filter:
;; =============== function _Filter ends ============

	signat	_Filter,4218
	global	_isFinishedThreeHoursTimer
psect	text749,local,class=CODE,delta=2
global __ptext749
__ptext749:

;; *************** function _isFinishedThreeHoursTimer *****************
;; Defined at:
;;		line 416 in file "D:\develop\190625\AK7030-OTP\common.c"
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
psect	text749
	file	"D:\develop\190625\AK7030-OTP\common.c"
	line	416
	global	__size_of_isFinishedThreeHoursTimer
	__size_of_isFinishedThreeHoursTimer	equ	__end_of_isFinishedThreeHoursTimer-_isFinishedThreeHoursTimer
	
_isFinishedThreeHoursTimer:	
	opt	stack 5
; Regs used in _isFinishedThreeHoursTimer: [wreg+status,2+status,0]
	line	417
	
l3972:	
;common.c: 417: if(uiSmallTimer == 0)
	bsf	status, 5	;RP0=1, select bank1
	movf	((_uiSmallTimer+1)^080h),w
	iorwf	((_uiSmallTimer)^080h),w
	skipz
	goto	u1041
	goto	u1040
u1041:
	goto	l3980
u1040:
	line	418
	
l3974:	
;common.c: 418: return 1;
	movlw	(01h)
	goto	l1741
	line	420
	
l3980:	
;common.c: 419: else
;common.c: 420: return 0;
	movlw	(0)
	line	421
	
l1741:	
	return
	opt stack 0
GLOBAL	__end_of_isFinishedThreeHoursTimer
	__end_of_isFinishedThreeHoursTimer:
;; =============== function _isFinishedThreeHoursTimer ends ============

	signat	_isFinishedThreeHoursTimer,89
	global	_startThreeHoursTimer
psect	text750,local,class=CODE,delta=2
global __ptext750
__ptext750:

;; *************** function _startThreeHoursTimer *****************
;; Defined at:
;;		line 382 in file "D:\develop\190625\AK7030-OTP\common.c"
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
;;		On exit  : 60/20
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
psect	text750
	file	"D:\develop\190625\AK7030-OTP\common.c"
	line	382
	global	__size_of_startThreeHoursTimer
	__size_of_startThreeHoursTimer	equ	__end_of_startThreeHoursTimer-_startThreeHoursTimer
	
_startThreeHoursTimer:	
	opt	stack 5
; Regs used in _startThreeHoursTimer: [wreg+status,2+status,0]
	line	383
	
l3968:	
;common.c: 383: if(0 == uiSmallTimer)
	bsf	status, 5	;RP0=1, select bank1
	movf	((_uiSmallTimer+1)^080h),w
	iorwf	((_uiSmallTimer)^080h),w
	skipz
	goto	u1031
	goto	u1030
u1031:
	goto	l1724
u1030:
	line	384
	
l3970:	
;common.c: 384: uiSmallTimer = uiSetTime;
	bcf	status, 5	;RP0=0, select bank0
	movf	(startThreeHoursTimer@uiSetTime+1),w
	bsf	status, 5	;RP0=1, select bank1
	movwf	(_uiSmallTimer+1)^080h
	bcf	status, 5	;RP0=0, select bank0
	movf	(startThreeHoursTimer@uiSetTime),w
	bsf	status, 5	;RP0=1, select bank1
	movwf	(_uiSmallTimer)^080h
	line	389
	
l1724:	
	return
	opt stack 0
GLOBAL	__end_of_startThreeHoursTimer
	__end_of_startThreeHoursTimer:
;; =============== function _startThreeHoursTimer ends ============

	signat	_startThreeHoursTimer,4216
	global	_isFinishedTwentySecondsTimer
psect	text751,local,class=CODE,delta=2
global __ptext751
__ptext751:

;; *************** function _isFinishedTwentySecondsTimer *****************
;; Defined at:
;;		line 399 in file "D:\develop\190625\AK7030-OTP\common.c"
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
psect	text751
	file	"D:\develop\190625\AK7030-OTP\common.c"
	line	399
	global	__size_of_isFinishedTwentySecondsTimer
	__size_of_isFinishedTwentySecondsTimer	equ	__end_of_isFinishedTwentySecondsTimer-_isFinishedTwentySecondsTimer
	
_isFinishedTwentySecondsTimer:	
	opt	stack 5
; Regs used in _isFinishedTwentySecondsTimer: [wreg+status,2+status,0]
	line	400
	
l3956:	
;common.c: 400: if(0 == uiTwentySecondsTimer)
	bsf	status, 5	;RP0=1, select bank1
	movf	((_uiTwentySecondsTimer+1)^080h),w
	iorwf	((_uiTwentySecondsTimer)^080h),w
	skipz
	goto	u1021
	goto	u1020
u1021:
	goto	l3964
u1020:
	line	401
	
l3958:	
;common.c: 401: return 1;
	movlw	(01h)
	goto	l1731
	line	403
	
l3964:	
;common.c: 402: else
;common.c: 403: return 0;
	movlw	(0)
	line	404
	
l1731:	
	return
	opt stack 0
GLOBAL	__end_of_isFinishedTwentySecondsTimer
	__end_of_isFinishedTwentySecondsTimer:
;; =============== function _isFinishedTwentySecondsTimer ends ============

	signat	_isFinishedTwentySecondsTimer,89
	global	_startTwentySecondsTimer
psect	text752,local,class=CODE,delta=2
global __ptext752
__ptext752:

;; *************** function _startTwentySecondsTimer *****************
;; Defined at:
;;		line 393 in file "D:\develop\190625\AK7030-OTP\common.c"
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
psect	text752
	file	"D:\develop\190625\AK7030-OTP\common.c"
	line	393
	global	__size_of_startTwentySecondsTimer
	__size_of_startTwentySecondsTimer	equ	__end_of_startTwentySecondsTimer-_startTwentySecondsTimer
	
_startTwentySecondsTimer:	
	opt	stack 5
; Regs used in _startTwentySecondsTimer: [wreg]
	line	394
	
l3954:	
;common.c: 394: uiTwentySecondsTimer = 20;
	movlw	014h
	bsf	status, 5	;RP0=1, select bank1
	movwf	(_uiTwentySecondsTimer)^080h
	clrf	(_uiTwentySecondsTimer+1)^080h
	line	395
	
l1727:	
	return
	opt stack 0
GLOBAL	__end_of_startTwentySecondsTimer
	__end_of_startTwentySecondsTimer:
;; =============== function _startTwentySecondsTimer ends ============

	signat	_startTwentySecondsTimer,88
	global	_isFinishedTwelveHoursTimer
psect	text753,local,class=CODE,delta=2
global __ptext753
__ptext753:

;; *************** function _isFinishedTwelveHoursTimer *****************
;; Defined at:
;;		line 408 in file "D:\develop\190625\AK7030-OTP\common.c"
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
psect	text753
	file	"D:\develop\190625\AK7030-OTP\common.c"
	line	408
	global	__size_of_isFinishedTwelveHoursTimer
	__size_of_isFinishedTwelveHoursTimer	equ	__end_of_isFinishedTwelveHoursTimer-_isFinishedTwelveHoursTimer
	
_isFinishedTwelveHoursTimer:	
	opt	stack 5
; Regs used in _isFinishedTwelveHoursTimer: [wreg+status,2+status,0]
	line	409
	
l3942:	
;common.c: 409: if(uiBigTimer == 0)
	bsf	status, 5	;RP0=1, select bank1
	movf	((_uiBigTimer+1)^080h),w
	iorwf	((_uiBigTimer)^080h),w
	skipz
	goto	u1011
	goto	u1010
u1011:
	goto	l3950
u1010:
	line	410
	
l3944:	
;common.c: 410: return 1;
	movlw	(01h)
	goto	l1736
	line	412
	
l3950:	
;common.c: 411: else
;common.c: 412: return 0;
	movlw	(0)
	line	413
	
l1736:	
	return
	opt stack 0
GLOBAL	__end_of_isFinishedTwelveHoursTimer
	__end_of_isFinishedTwelveHoursTimer:
;; =============== function _isFinishedTwelveHoursTimer ends ============

	signat	_isFinishedTwelveHoursTimer,89
	global	_startTwelveHourTimer
psect	text754,local,class=CODE,delta=2
global __ptext754
__ptext754:

;; *************** function _startTwelveHourTimer *****************
;; Defined at:
;;		line 354 in file "D:\develop\190625\AK7030-OTP\common.c"
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
;;		On exit  : 60/20
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
psect	text754
	file	"D:\develop\190625\AK7030-OTP\common.c"
	line	354
	global	__size_of_startTwelveHourTimer
	__size_of_startTwelveHourTimer	equ	__end_of_startTwelveHourTimer-_startTwelveHourTimer
	
_startTwelveHourTimer:	
	opt	stack 5
; Regs used in _startTwelveHourTimer: [wreg+status,2+status,0]
	line	355
	
l3938:	
;common.c: 355: if(0 == uiBigTimer)
	bsf	status, 5	;RP0=1, select bank1
	movf	((_uiBigTimer+1)^080h),w
	iorwf	((_uiBigTimer)^080h),w
	skipz
	goto	u1001
	goto	u1000
u1001:
	goto	l1711
u1000:
	line	356
	
l3940:	
;common.c: 356: uiBigTimer = uiSetTime;
	bcf	status, 5	;RP0=0, select bank0
	movf	(startTwelveHourTimer@uiSetTime+1),w
	bsf	status, 5	;RP0=1, select bank1
	movwf	(_uiBigTimer+1)^080h
	bcf	status, 5	;RP0=0, select bank0
	movf	(startTwelveHourTimer@uiSetTime),w
	bsf	status, 5	;RP0=1, select bank1
	movwf	(_uiBigTimer)^080h
	line	362
	
l1711:	
	return
	opt stack 0
GLOBAL	__end_of_startTwelveHourTimer
	__end_of_startTwelveHourTimer:
;; =============== function _startTwelveHourTimer ends ============

	signat	_startTwelveHourTimer,4216
	global	_clrSampeTime
psect	text755,local,class=CODE,delta=2
global __ptext755
__ptext755:

;; *************** function _clrSampeTime *****************
;; Defined at:
;;		line 434 in file "D:\develop\190625\AK7030-OTP\common.c"
;; Parameters:    Size  Location     Type
;;		None
;; Auto vars:     Size  Location     Type
;;		None
;; Return value:  Size  Location     Type
;;		None               void
;; Registers used:
;;		status,2
;; Tracked objects:
;;		On entry : 60/20
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
psect	text755
	file	"D:\develop\190625\AK7030-OTP\common.c"
	line	434
	global	__size_of_clrSampeTime
	__size_of_clrSampeTime	equ	__end_of_clrSampeTime-_clrSampeTime
	
_clrSampeTime:	
	opt	stack 5
; Regs used in _clrSampeTime: [status,2]
	line	435
	
l3936:	
;common.c: 435: timer.timer10msStopWatch = 0;
	clrf	(_timer)^080h
	line	436
	
l1750:	
	return
	opt stack 0
GLOBAL	__end_of_clrSampeTime
	__end_of_clrSampeTime:
;; =============== function _clrSampeTime ends ============

	signat	_clrSampeTime,88
	global	_isPermitSampleTime
psect	text756,local,class=CODE,delta=2
global __ptext756
__ptext756:

;; *************** function _isPermitSampleTime *****************
;; Defined at:
;;		line 424 in file "D:\develop\190625\AK7030-OTP\common.c"
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
psect	text756
	file	"D:\develop\190625\AK7030-OTP\common.c"
	line	424
	global	__size_of_isPermitSampleTime
	__size_of_isPermitSampleTime	equ	__end_of_isPermitSampleTime-_isPermitSampleTime
	
_isPermitSampleTime:	
	opt	stack 5
; Regs used in _isPermitSampleTime: [wreg]
	line	425
	
l3924:	
;common.c: 425: if(timer.timer10msStopWatch >= 10)
	movlw	(0Ah)
	bsf	status, 5	;RP0=1, select bank1
	subwf	(_timer)^080h,w
	skipc
	goto	u991
	goto	u990
u991:
	goto	l3932
u990:
	line	427
	
l3926:	
;common.c: 426: {
;common.c: 427: return 1;
	movlw	(01h)
	goto	l1746
	line	430
	
l3932:	
;common.c: 429: else
;common.c: 430: return 0;
	movlw	(0)
	line	431
	
l1746:	
	return
	opt stack 0
GLOBAL	__end_of_isPermitSampleTime
	__end_of_isPermitSampleTime:
;; =============== function _isPermitSampleTime ends ============

	signat	_isPermitSampleTime,89
	global	_adc_start
psect	text757,local,class=CODE,delta=2
global __ptext757
__ptext757:

;; *************** function _adc_start *****************
;; Defined at:
;;		line 100 in file "D:\develop\190625\AK7030-OTP\periph.c"
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
psect	text757
	file	"D:\develop\190625\AK7030-OTP\periph.c"
	line	100
	global	__size_of_adc_start
	__size_of_adc_start	equ	__end_of_adc_start-_adc_start
	
_adc_start:	
	opt	stack 4
; Regs used in _adc_start: []
	line	101
	
l3922:	
;periph.c: 101: GO=1;
	bcf	status, 5	;RP0=0, select bank0
	bsf	(249/8),(249)&7
	line	102
	
l2416:	
	return
	opt stack 0
GLOBAL	__end_of_adc_start
	__end_of_adc_start:
;; =============== function _adc_start ends ============

	signat	_adc_start,88
	global	_op2_init
psect	text758,local,class=CODE,delta=2
global __ptext758
__ptext758:

;; *************** function _op2_init *****************
;; Defined at:
;;		line 45 in file "D:\develop\190625\AK7030-OTP\periph.c"
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
psect	text758
	file	"D:\develop\190625\AK7030-OTP\periph.c"
	line	45
	global	__size_of_op2_init
	__size_of_op2_init	equ	__end_of_op2_init-_op2_init
	
_op2_init:	
	opt	stack 5
; Regs used in _op2_init: [wreg]
	line	52
	
l3916:	
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
	
l3918:	
;periph.c: 58: TRISA7=0;
	bcf	(1071/8)^080h,(1071)&7
	line	60
	
l3920:	
;periph.c: 60: TRISB7 = 1;
	bsf	(1079/8)^080h,(1079)&7
	line	61
	
l2402:	
	return
	opt stack 0
GLOBAL	__end_of_op2_init
	__end_of_op2_init:
;; =============== function _op2_init ends ============

	signat	_op2_init,88
	global	_op1_init
psect	text759,local,class=CODE,delta=2
global __ptext759
__ptext759:

;; *************** function _op1_init *****************
;; Defined at:
;;		line 26 in file "D:\develop\190625\AK7030-OTP\periph.c"
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
psect	text759
	file	"D:\develop\190625\AK7030-OTP\periph.c"
	line	26
	global	__size_of_op1_init
	__size_of_op1_init	equ	__end_of_op1_init-_op1_init
	
_op1_init:	
	opt	stack 5
; Regs used in _op1_init: [wreg]
	line	33
	
l3910:	
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
	
l3912:	
;periph.c: 38: TRISB3=1;
	bsf	status, 5	;RP0=1, select bank1
	bsf	(1075/8)^080h,(1075)&7
	line	40
	
l3914:	
;periph.c: 40: TRISB5=0;
	bcf	(1077/8)^080h,(1077)&7
	line	41
	
l2399:	
	return
	opt stack 0
GLOBAL	__end_of_op1_init
	__end_of_op1_init:
;; =============== function _op1_init ends ============

	signat	_op1_init,88
	global	_dac_init
psect	text760,local,class=CODE,delta=2
global __ptext760
__ptext760:

;; *************** function _dac_init *****************
;; Defined at:
;;		line 14 in file "D:\develop\190625\AK7030-OTP\periph.c"
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
psect	text760
	file	"D:\develop\190625\AK7030-OTP\periph.c"
	line	14
	global	__size_of_dac_init
	__size_of_dac_init	equ	__end_of_dac_init-_dac_init
	
_dac_init:	
	opt	stack 5
; Regs used in _dac_init: [wreg]
	line	15
	
l3904:	
;periph.c: 15: DACCON|=1;
	bsf	(135)^080h+(0/8),(0)&7	;volatile
	line	17
	
l3906:	
;periph.c: 17: DACR0=0x0F;
	movlw	(0Fh)
	movwf	(136)^080h	;volatile
	line	18
	
l3908:	
;periph.c: 18: DACCON|=(1)<<2;
	bsf	(135)^080h+(2/8),(2)&7	;volatile
	line	22
	
l2396:	
	return
	opt stack 0
GLOBAL	__end_of_dac_init
	__end_of_dac_init:
;; =============== function _dac_init ends ============

	signat	_dac_init,88
	global	_adc_test_init
psect	text761,local,class=CODE,delta=2
global __ptext761
__ptext761:

;; *************** function _adc_test_init *****************
;; Defined at:
;;		line 85 in file "D:\develop\190625\AK7030-OTP\periph.c"
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
psect	text761
	file	"D:\develop\190625\AK7030-OTP\periph.c"
	line	85
	global	__size_of_adc_test_init
	__size_of_adc_test_init	equ	__end_of_adc_test_init-_adc_test_init
	
_adc_test_init:	
	opt	stack 4
; Regs used in _adc_test_init: [wreg+status,2+status,0]
;adc_test_init@channel stored from wreg
	movwf	(adc_test_init@channel)
	line	86
	
l3894:	
;periph.c: 86: ADCON0 = 0x00;
	clrf	(31)	;volatile
	line	87
	
l3896:	
;periph.c: 87: ADCON0|=channel<<2;
	movf	(adc_test_init@channel),w
	movwf	(??_adc_test_init+0)+0
	clrc
	rlf	(??_adc_test_init+0)+0,f
	clrc
	rlf	(??_adc_test_init+0)+0,w
	iorwf	(31),f	;volatile
	line	88
	
l3898:	
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
	
l3900:	
;periph.c: 89: ADON=1;
	bcf	status, 5	;RP0=0, select bank0
	bsf	(248/8),(248)&7
	line	90
	
l3902:	
;periph.c: 90: ADIE=1;
	bsf	status, 5	;RP0=1, select bank1
	bsf	(1130/8)^080h,(1130)&7
	line	91
	
l2410:	
	return
	opt stack 0
GLOBAL	__end_of_adc_test_init
	__end_of_adc_test_init:
;; =============== function _adc_test_init ends ============

	signat	_adc_test_init,8312
	global	_timer1_interrupt_config
psect	text762,local,class=CODE,delta=2
global __ptext762
__ptext762:

;; *************** function _timer1_interrupt_config *****************
;; Defined at:
;;		line 192 in file "D:\develop\190625\AK7030-OTP\common.c"
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
psect	text762
	file	"D:\develop\190625\AK7030-OTP\common.c"
	line	192
	global	__size_of_timer1_interrupt_config
	__size_of_timer1_interrupt_config	equ	__end_of_timer1_interrupt_config-_timer1_interrupt_config
	
_timer1_interrupt_config:	
	opt	stack 5
; Regs used in _timer1_interrupt_config: []
	line	193
	
l3892:	
;common.c: 193: GIE = 1;
	bsf	(95/8),(95)&7
	line	194
;common.c: 194: PEIE = 1;
	bsf	(94/8),(94)&7
	line	195
	
l1670:	
	return
	opt stack 0
GLOBAL	__end_of_timer1_interrupt_config
	__end_of_timer1_interrupt_config:
;; =============== function _timer1_interrupt_config ends ============

	signat	_timer1_interrupt_config,88
	global	_timer1_config
psect	text763,local,class=CODE,delta=2
global __ptext763
__ptext763:

;; *************** function _timer1_config *****************
;; Defined at:
;;		line 180 in file "D:\develop\190625\AK7030-OTP\common.c"
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
psect	text763
	file	"D:\develop\190625\AK7030-OTP\common.c"
	line	180
	global	__size_of_timer1_config
	__size_of_timer1_config	equ	__end_of_timer1_config-_timer1_config
	
_timer1_config:	
	opt	stack 5
; Regs used in _timer1_config: [wreg]
	line	182
	
l3888:	
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
	
l3890:	
;common.c: 185: TMR1IE=1;
	bsf	status, 5	;RP0=1, select bank1
	bsf	(1120/8)^080h,(1120)&7
	line	187
	
l1667:	
	return
	opt stack 0
GLOBAL	__end_of_timer1_config
	__end_of_timer1_config:
;; =============== function _timer1_config ends ============

	signat	_timer1_config,88
	global	_clock_config
psect	text764,local,class=CODE,delta=2
global __ptext764
__ptext764:

;; *************** function _clock_config *****************
;; Defined at:
;;		line 172 in file "D:\develop\190625\AK7030-OTP\common.c"
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
psect	text764
	file	"D:\develop\190625\AK7030-OTP\common.c"
	line	172
	global	__size_of_clock_config
	__size_of_clock_config	equ	__end_of_clock_config-_clock_config
	
_clock_config:	
	opt	stack 5
; Regs used in _clock_config: [wreg+status,2]
	line	174
	
l3884:	
;common.c: 174: CLKPR = 0x80;
	movlw	(080h)
	bcf	status, 5	;RP0=0, select bank2
	bsf	status, 6	;RP1=1, select bank2
	movwf	(264)^0100h	;volatile
	line	175
	
l3886:	
;common.c: 175: CLKPR = 0x00;
	clrf	(264)^0100h	;volatile
	line	176
;common.c: 176: while(CLKPCE);
	
l1661:	
	btfsc	(2119/8)^0100h,(2119)&7
	goto	u981
	goto	u980
u981:
	goto	l1661
u980:
	line	177
	
l1664:	
	return
	opt stack 0
GLOBAL	__end_of_clock_config
	__end_of_clock_config:
;; =============== function _clock_config ends ============

	signat	_clock_config,88
	global	_initPin
psect	text765,local,class=CODE,delta=2
global __ptext765
__ptext765:

;; *************** function _initPin *****************
;; Defined at:
;;		line 105 in file "D:\develop\190625\AK7030-OTP\main.c"
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
psect	text765
	file	"D:\develop\190625\AK7030-OTP\main.c"
	line	105
	global	__size_of_initPin
	__size_of_initPin	equ	__end_of_initPin-_initPin
	
_initPin:	
	opt	stack 5
; Regs used in _initPin: []
	line	106
	
l3882:	
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
psect	text766,local,class=CODE,delta=2
global __ptext766
__ptext766:

;; *************** function _clearTwentySecondsTimer *****************
;; Defined at:
;;		line 376 in file "D:\develop\190625\AK7030-OTP\common.c"
;; Parameters:    Size  Location     Type
;;		None
;; Auto vars:     Size  Location     Type
;;		None
;; Return value:  Size  Location     Type
;;		None               void
;; Registers used:
;;		status,2
;; Tracked objects:
;;		On entry : 160/20
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
psect	text766
	file	"D:\develop\190625\AK7030-OTP\common.c"
	line	376
	global	__size_of_clearTwentySecondsTimer
	__size_of_clearTwentySecondsTimer	equ	__end_of_clearTwentySecondsTimer-_clearTwentySecondsTimer
	
_clearTwentySecondsTimer:	
	opt	stack 4
; Regs used in _clearTwentySecondsTimer: [status,2]
	line	377
	
l3880:	
;common.c: 377: uiTwentySecondsTimer = 0;
	clrf	(_uiTwentySecondsTimer)^080h
	clrf	(_uiTwentySecondsTimer+1)^080h
	line	378
	
l1720:	
	return
	opt stack 0
GLOBAL	__end_of_clearTwentySecondsTimer
	__end_of_clearTwentySecondsTimer:
;; =============== function _clearTwentySecondsTimer ends ============

	signat	_clearTwentySecondsTimer,88
	global	_clearThreeHoursTimer
psect	text767,local,class=CODE,delta=2
global __ptext767
__ptext767:

;; *************** function _clearThreeHoursTimer *****************
;; Defined at:
;;		line 371 in file "D:\develop\190625\AK7030-OTP\common.c"
;; Parameters:    Size  Location     Type
;;		None
;; Auto vars:     Size  Location     Type
;;		None
;; Return value:  Size  Location     Type
;;		None               void
;; Registers used:
;;		status,2
;; Tracked objects:
;;		On entry : 140/0
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
;;		_main
;; This function uses a non-reentrant model
;;
psect	text767
	file	"D:\develop\190625\AK7030-OTP\common.c"
	line	371
	global	__size_of_clearThreeHoursTimer
	__size_of_clearThreeHoursTimer	equ	__end_of_clearThreeHoursTimer-_clearThreeHoursTimer
	
_clearThreeHoursTimer:	
	opt	stack 4
; Regs used in _clearThreeHoursTimer: [status,2]
	line	372
	
l3878:	
;common.c: 372: uiSmallTimer = 0;
	bsf	status, 5	;RP0=1, select bank1
	clrf	(_uiSmallTimer)^080h
	clrf	(_uiSmallTimer+1)^080h
	line	373
	
l1717:	
	return
	opt stack 0
GLOBAL	__end_of_clearThreeHoursTimer
	__end_of_clearThreeHoursTimer:
;; =============== function _clearThreeHoursTimer ends ============

	signat	_clearThreeHoursTimer,88
	global	_clearTwelveHoursTimer
psect	text768,local,class=CODE,delta=2
global __ptext768
__ptext768:

;; *************** function _clearTwelveHoursTimer *****************
;; Defined at:
;;		line 365 in file "D:\develop\190625\AK7030-OTP\common.c"
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
psect	text768
	file	"D:\develop\190625\AK7030-OTP\common.c"
	line	365
	global	__size_of_clearTwelveHoursTimer
	__size_of_clearTwelveHoursTimer	equ	__end_of_clearTwelveHoursTimer-_clearTwelveHoursTimer
	
_clearTwelveHoursTimer:	
	opt	stack 4
; Regs used in _clearTwelveHoursTimer: [status,2]
	line	366
	
l3876:	
;common.c: 366: uiBigTimer = 0;
	bsf	status, 5	;RP0=1, select bank1
	clrf	(_uiBigTimer)^080h
	clrf	(_uiBigTimer+1)^080h
	line	367
	
l1714:	
	return
	opt stack 0
GLOBAL	__end_of_clearTwelveHoursTimer
	__end_of_clearTwelveHoursTimer:
;; =============== function _clearTwelveHoursTimer ends ============

	signat	_clearTwelveHoursTimer,88
	global	_ISR
psect	text769,local,class=CODE,delta=2
global __ptext769
__ptext769:

;; *************** function _ISR *****************
;; Defined at:
;;		line 439 in file "D:\develop\190625\AK7030-OTP\common.c"
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
psect	text769
	file	"D:\develop\190625\AK7030-OTP\common.c"
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
psect	text769
	line	442
	
i1l4110:	
;common.c: 440: static unsigned char ucTimer1sCnt = 0;
;common.c: 442: if(TMR1IF == 1)
	btfss	(96/8),(96)&7
	goto	u122_21
	goto	u122_20
u122_21:
	goto	i1l4128
u122_20:
	line	444
	
i1l4112:	
;common.c: 443: {
;common.c: 444: TMR1IF = 0 ;
	bcf	(96/8),(96)&7
	line	445
	
i1l4114:	
;common.c: 445: timer.timer10msStopWatch++;
	bsf	status, 5	;RP0=1, select bank1
	incf	(_timer)^080h,f
	line	446
;common.c: 446: ucTimer1sCnt++;
	incf	(ISR@ucTimer1sCnt)^080h,f
	line	448
	
i1l4116:	
;common.c: 448: if(ucTimer1sCnt >= 100)
	movlw	(064h)
	subwf	(ISR@ucTimer1sCnt)^080h,w
	skipc
	goto	u123_21
	goto	u123_20
u123_21:
	goto	i1l4128
u123_20:
	line	450
	
i1l4118:	
;common.c: 449: {
;common.c: 450: ucTimer1sCnt = 0;
	clrf	(ISR@ucTimer1sCnt)^080h
	line	451
	
i1l4120:	
;common.c: 451: if(uiBigTimer > 0)
	movf	(_uiBigTimer+1)^080h,w
	iorwf	(_uiBigTimer)^080h,w
	skipnz
	goto	u124_21
	goto	u124_20
u124_21:
	goto	i1l1757
u124_20:
	line	452
	
i1l4122:	
;common.c: 452: uiBigTimer--;
	movlw	low(01h)
	subwf	(_uiBigTimer)^080h,f
	movlw	high(01h)
	skipc
	decf	(_uiBigTimer+1)^080h,f
	subwf	(_uiBigTimer+1)^080h,f
	
i1l1757:	
	line	454
;common.c: 454: if(uiSmallTimer)
	movf	(_uiSmallTimer+1)^080h,w
	iorwf	(_uiSmallTimer)^080h,w
	skipnz
	goto	u125_21
	goto	u125_20
u125_21:
	goto	i1l1758
u125_20:
	line	455
	
i1l4124:	
;common.c: 455: uiSmallTimer--;
	movlw	low(01h)
	subwf	(_uiSmallTimer)^080h,f
	movlw	high(01h)
	skipc
	decf	(_uiSmallTimer+1)^080h,f
	subwf	(_uiSmallTimer+1)^080h,f
	
i1l1758:	
	line	457
;common.c: 457: if(uiTwentySecondsTimer)
	movf	(_uiTwentySecondsTimer+1)^080h,w
	iorwf	(_uiTwentySecondsTimer)^080h,w
	skipnz
	goto	u126_21
	goto	u126_20
u126_21:
	goto	i1l4128
u126_20:
	line	458
	
i1l4126:	
;common.c: 458: uiTwentySecondsTimer--;
	movlw	low(01h)
	subwf	(_uiTwentySecondsTimer)^080h,f
	movlw	high(01h)
	skipc
	decf	(_uiTwentySecondsTimer+1)^080h,f
	subwf	(_uiTwentySecondsTimer+1)^080h,f
	line	462
	
i1l4128:	
;common.c: 459: }
;common.c: 460: }
;common.c: 462: if(ADIF)
	bcf	status, 5	;RP0=0, select bank0
	btfss	(106/8),(106)&7
	goto	u127_21
	goto	u127_20
u127_21:
	goto	i1l1765
u127_20:
	line	464
	
i1l4130:	
;common.c: 463: {
;common.c: 464: ADIF=0;
	bcf	(106/8),(106)&7
	line	465
	
i1l4132:	
;common.c: 465: setAD_ConvertFlag(1);
	movlw	(01h)
	fcall	i1_setAD_ConvertFlag
	line	467
	
i1l4134:	
;common.c: 467: if(sampleChannelSelect == 4)
	movf	(_sampleChannelSelect),w
	xorlw	04h
	skipz
	goto	u128_21
	goto	u128_20
u128_21:
	goto	i1l4138
u128_20:
	line	471
	
i1l4136:	
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
	goto	i1l1765
	line	476
	
i1l4138:	
;common.c: 476: else if(sampleChannelSelect == 1)
	decf	(_sampleChannelSelect),w
	skipz
	goto	u129_21
	goto	u129_20
u129_21:
	goto	i1l4142
u129_20:
	line	479
	
i1l4140:	
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
	goto	i1l1765
	line	490
	
i1l4142:	
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
	
i1l1765:	
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
psect	text770,local,class=CODE,delta=2
global __ptext770
__ptext770:

;; *************** function i1_setAD_ConvertFlag *****************
;; Defined at:
;;		line 206 in file "D:\develop\190625\AK7030-OTP\common.c"
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
psect	text770
	file	"D:\develop\190625\AK7030-OTP\common.c"
	line	206
	global	__size_ofi1_setAD_ConvertFlag
	__size_ofi1_setAD_ConvertFlag	equ	__end_ofi1_setAD_ConvertFlag-i1_setAD_ConvertFlag
	
i1_setAD_ConvertFlag:	
	opt	stack 3
; Regs used in i1_setAD_ConvertFlag: [wreg]
;i1setAD_ConvertFlag@flag stored from wreg
	movwf	(i1setAD_ConvertFlag@flag)
	line	207
	
i1l4148:	
;common.c: 207: adc_convert_flag = flag;
	movf	(i1setAD_ConvertFlag@flag),w
	movwf	(_adc_convert_flag)
	line	208
	
i1l1676:	
	return
	opt stack 0
GLOBAL	__end_ofi1_setAD_ConvertFlag
	__end_ofi1_setAD_ConvertFlag:
;; =============== function i1_setAD_ConvertFlag ends ============

	signat	i1_setAD_ConvertFlag,88
	global	_adc_get
psect	text771,local,class=CODE,delta=2
global __ptext771
__ptext771:

;; *************** function _adc_get *****************
;; Defined at:
;;		line 105 in file "D:\develop\190625\AK7030-OTP\periph.c"
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
psect	text771
	file	"D:\develop\190625\AK7030-OTP\periph.c"
	line	105
	global	__size_of_adc_get
	__size_of_adc_get	equ	__end_of_adc_get-_adc_get
	
_adc_get:	
	opt	stack 3
; Regs used in _adc_get: [wreg]
	line	107
	
i1l4144:	
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
	
i1l2419:	
	return
	opt stack 0
GLOBAL	__end_of_adc_get
	__end_of_adc_get:
;; =============== function _adc_get ends ============

	signat	_adc_get,90
	global	_vPutSampleDataIntoTable
psect	text772,local,class=CODE,delta=2
global __ptext772
__ptext772:

;; *************** function _vPutSampleDataIntoTable *****************
;; Defined at:
;;		line 97 in file "D:\develop\190625\AK7030-OTP\common.c"
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
psect	text772
	file	"D:\develop\190625\AK7030-OTP\common.c"
	line	97
	global	__size_of_vPutSampleDataIntoTable
	__size_of_vPutSampleDataIntoTable	equ	__end_of_vPutSampleDataIntoTable-_vPutSampleDataIntoTable
	
_vPutSampleDataIntoTable:	
	opt	stack 3
; Regs used in _vPutSampleDataIntoTable: [wreg-fsr0h+status,2+status,0+btemp+1]
	line	105
	
i1l4034:	
;common.c: 99: static unsigned char ucChannelFirstLength = 0;
;common.c: 101: static unsigned char ucChannelFourthLength = 0;
;common.c: 103: static unsigned char ucChannelFourteenthLength = 0;
;common.c: 105: if(channel == 1)
	decf	(vPutSampleDataIntoTable@channel),w
	skipz
	goto	u110_21
	goto	u110_20
u110_21:
	goto	i1l4046
u110_20:
	line	107
	
i1l4036:	
;common.c: 106: {
;common.c: 107: if(ucChannelFirstLength < 12)
	movlw	(0Ch)
	subwf	(vPutSampleDataIntoTable@ucChannelFirstLength),w
	skipnc
	goto	u111_21
	goto	u111_20
u111_21:
	goto	i1l4042
u111_20:
	line	109
	
i1l4038:	
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
	
i1l4040:	
;common.c: 111: ucChannelFirstLength++;
	incf	(vPutSampleDataIntoTable@ucChannelFirstLength),f
	line	112
;common.c: 112: }
	goto	i1l1658
	line	115
	
i1l4042:	
;common.c: 113: else
;common.c: 114: {
;common.c: 115: ucChannelFirstLength = 0;
	clrf	(vPutSampleDataIntoTable@ucChannelFirstLength)
	line	117
	
i1l4044:	
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
	goto	i1l1658
	line	120
	
i1l4046:	
;common.c: 120: else if(channel == 4)
	movf	(vPutSampleDataIntoTable@channel),w
	xorlw	04h
	skipz
	goto	u112_21
	goto	u112_20
u112_21:
	goto	i1l4058
u112_20:
	line	122
	
i1l4048:	
;common.c: 121: {
;common.c: 122: if(ucChannelFourthLength < 12)
	movlw	(0Ch)
	bcf	status, 5	;RP0=0, select bank0
	subwf	(vPutSampleDataIntoTable@ucChannelFourthLength),w
	skipnc
	goto	u113_21
	goto	u113_20
u113_21:
	goto	i1l4054
u113_20:
	line	124
	
i1l4050:	
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
	
i1l4052:	
;common.c: 126: ucChannelFourthLength++;
	incf	(vPutSampleDataIntoTable@ucChannelFourthLength),f
	line	127
;common.c: 127: }
	goto	i1l1658
	line	130
	
i1l4054:	
;common.c: 128: else
;common.c: 129: {
;common.c: 130: ucChannelFourthLength = 0;
	clrf	(vPutSampleDataIntoTable@ucChannelFourthLength)
	line	132
	
i1l4056:	
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
	goto	i1l1658
	line	135
	
i1l4058:	
;common.c: 135: else if(channel == 14)
	movf	(vPutSampleDataIntoTable@channel),w
	xorlw	0Eh
	skipz
	goto	u114_21
	goto	u114_20
u114_21:
	goto	i1l4070
u114_20:
	line	137
	
i1l4060:	
;common.c: 136: {
;common.c: 137: if(ucChannelFourteenthLength < 12)
	movlw	(0Ch)
	bcf	status, 5	;RP0=0, select bank0
	subwf	(vPutSampleDataIntoTable@ucChannelFourteenthLength),w
	skipnc
	goto	u115_21
	goto	u115_20
u115_21:
	goto	i1l4066
u115_20:
	line	139
	
i1l4062:	
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
	
i1l4064:	
;common.c: 141: ucChannelFourteenthLength++;
	incf	(vPutSampleDataIntoTable@ucChannelFourteenthLength),f
	line	142
;common.c: 142: }
	goto	i1l1658
	line	145
	
i1l4066:	
;common.c: 143: else
;common.c: 144: {
;common.c: 145: ucChannelFourteenthLength = 0;
	clrf	(vPutSampleDataIntoTable@ucChannelFourteenthLength)
	line	147
	
i1l4068:	
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
	goto	i1l1658
	line	152
	
i1l4070:	
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
	
i1l4076:	
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
	
i1l4078:	
	incf	(vPutSampleDataIntoTable@i),f
	skipnz
	incf	(vPutSampleDataIntoTable@i+1),f
	
i1l4080:	
	movf	(vPutSampleDataIntoTable@i+1),w
	xorlw	80h
	movwf	btemp+1
	movlw	(high(0Ch))^80h
	subwf	btemp+1,w
	skipz
	goto	u116_25
	movlw	low(0Ch)
	subwf	(vPutSampleDataIntoTable@i),w
u116_25:

	skipc
	goto	u116_21
	goto	u116_20
u116_21:
	goto	i1l4076
u116_20:
	line	168
	
i1l1658:	
	return
	opt stack 0
GLOBAL	__end_of_vPutSampleDataIntoTable
	__end_of_vPutSampleDataIntoTable:
;; =============== function _vPutSampleDataIntoTable ends ============

	signat	_vPutSampleDataIntoTable,8312
psect	text773,local,class=CODE,delta=2
global __ptext773
__ptext773:
	global	btemp
	btemp set 07Eh

	DABS	1,126,2	;btemp
	global	wtemp0
	wtemp0 set btemp
	end
