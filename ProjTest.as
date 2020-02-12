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
# 79 "C:\temp\dev\AK7030-OTP\main.c"
	psect config,class=CONFIG,delta=2 ;#
# 79 "C:\temp\dev\AK7030-OTP\main.c"
	dw 0x2FFF & 0x3FFF & 0x3FFF & 0x3FFF & 0x3FFF & 0x3FFF ;#
# 80 "C:\temp\dev\AK7030-OTP\main.c"
	psect config,class=CONFIG,delta=2 ;#
# 80 "C:\temp\dev\AK7030-OTP\main.c"
	dw 0x3FFF & 0x3FDF & 0x3FFF & 0x3FFE ;#
# 81 "C:\temp\dev\AK7030-OTP\main.c"
	psect config,class=CONFIG,delta=2 ;#
# 81 "C:\temp\dev\AK7030-OTP\main.c"
	dw 0X3FFF & 0x3FFF & 0x3FFF & 0x3FF8 ;#
	FNCALL	_main,_initPin
	FNCALL	_main,_clock_config
	FNCALL	_main,_timer1_config
	FNCALL	_main,_timer1_interrupt_config
	FNCALL	_main,_adc_test_init
	FNCALL	_main,_dac_init
	FNCALL	_main,_adc_start
	FNCALL	_main,_process_AD_Converter_Value
	FNCALL	_main,_isPermitSampleTime
	FNCALL	_main,_clrSampeTime
	FNCALL	_main,_getAdOriginalCh14Value
	FNCALL	_main,_clearPinPortAndTimer
	FNCALL	_main,_setPA6
	FNCALL	_main,_getAdOriginalCh1Value
	FNCALL	_main,_startTwelveHourTimer
	FNCALL	_main,_isFinishedTwelveHoursTimer
	FNCALL	_main,_getAdOriginaCh4Value
	FNCALL	_main,_setPA2
	FNCALL	_main,_setPA3
	FNCALL	_main,_setPA0
	FNCALL	_main,_setPA1
	FNCALL	_main,_setPB0
	FNCALL	_main,_startTwentySecondsTimer
	FNCALL	_main,_isFinishedTwentySecondsTimer
	FNCALL	_main,_clearTwentySecondsTimer
	FNCALL	_main,_startThreeHoursTimer
	FNCALL	_main,_isFinishedThreeHoursTimer
	FNCALL	_main,_clearThreeHoursTimer
	FNCALL	_main,_setPB1
	FNCALL	_main,_clearAllTimer
	FNCALL	_process_AD_Converter_Value,_getAD_ConvertFlag
	FNCALL	_process_AD_Converter_Value,_setAD_ConvertFlag
	FNCALL	_process_AD_Converter_Value,_AD_Sample
	FNCALL	_process_AD_Converter_Value,_adc_start
	FNCALL	_clearPinPortAndTimer,_clearAllTimer
	FNCALL	_AD_Sample,_adc_test_init
	FNCALL	_getAdOriginaCh4Value,_Filter
	FNCALL	_getAdOriginalCh1Value,_Filter
	FNCALL	_getAdOriginalCh14Value,_Filter
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
	global	main@uiOldValue
	global	_bBigTimerStartFlag
	global	_bSmallTimerStartFlag
	global	_bTwentySecStartFlag
	global	_sampleChannelSelect
	global	_sampleTimes
	global	main@bCheckTweHour
	global	main@bInitFlag
	global	main@enumMainLoopStep
	global	main@ucADC4_Step
	global	main@ucChannel4Type
	global	main@ucDelayPrefix4TimerP5s
	global	main@ucDelayPrefix6TimerP2s
	global	main@ucLoaderStep
	global	main@ucLoaderStep1
	global	main@ucLoaderStep2
	global	main@ucLoaderStep3
	global	main@ucLoaderStep4
	global	main@ucTimerADC1ZeroP5s
	global	main@ucTimerDelay
	global	main@ucTimerDelay1
	global	main@ucTimerDelay2
	global	main@ucTimerDelay3
	global	main@ucTimerDelay4
	global	main@ucTimerDelayP2sLess
	global	main@ucTimerDelayP2sMore
	global	main@ucTimerForDACR0_CNT1
	global	main@ucTimerForDACR0_CNT1_f
	global	main@ucTimerForDACR0_CNT2
	global	main@ucTimerForDACR0_CNT2_f
	global	main@ucTimerLessADC1ZeroP5s
	global	main@ucTimerP5s
	global	main@ucTimerRightP5s
	global	main@ucTimerZeroPoint3s
	global	main@ucTimerZeroPoint5s
	global	vPutSampleDataIntoTable@ucChannelFifthLength
	global	vPutSampleDataIntoTable@ucChannelSecondLength
	global	vPutSampleDataIntoTable@ucChannelSixthLength
	global	_uiSampleChannelSixth
	global	vPutSampleDataIntoTable@ucChannelZeroLength
	global	_uiBigTimer
	global	_uiSmallTimer
	global	_uiTwentySecondsTimer
	global	main@uiMaxValue
	global	main@uiMinValue
	global	ISR@ucTimer1sCnt
	global	_adc_convert_flag
	global	_timer
	global	main@enumBranchStep
	global	main@enumInteralStep
	global	main@ucCheckTimerP2sLess
	global	main@ucCheckTimerP2sMore
	global	main@ucFourthSuffix1TimerP3s
	global	main@ucTimer1s
	global	main@ucTimer20s
	global	main@ucTimerLessX1P5s
	global	main@ucTimerLessX2P5s
	global	main@ucTimerP3s
	global	main@ucTimerX1P5s
	global	main@ucTimerX2P5s
	global	_uiSampleChannelFifth
	global	_uiSampleChannelSecond
	global	_uiSampleZero
	global	_ADCON0
psect	text795,local,class=CODE,delta=2
global __ptext795
__ptext795:
_ADCON0	set	31
	global	_ADRESH
_ADRESH	set	30
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
	global	_PB0
_PB0	set	48
	global	_PB1
_PB1	set	49
	global	_PB6
_PB6	set	54
	global	_PB7
_PB7	set	55
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
	global	_TRISB4
_TRISB4	set	1076
	global	_TRISB6
_TRISB6	set	1078
	global	_TRISB7
_TRISB7	set	1079
	global	_CLKPR
_CLKPR	set	264
	global	_CLKPCE
_CLKPCE	set	2119
	global	_PBOD6
_PBOD6	set	3142
	global	_PBOD7
_PBOD7	set	3143
	file	"ProjTest.as"
	line	#
psect cinit,class=CODE,delta=2
global start_initialization
start_initialization:

psect	bssCOMMON,class=COMMON,space=1
global __pbssCOMMON
__pbssCOMMON:
vPutSampleDataIntoTable@ucChannelZeroLength:
       ds      1

psect	bssBANK0,class=BANK0,space=1
global __pbssBANK0
__pbssBANK0:
main@uiOldValue:
       ds      2

_bBigTimerStartFlag:
       ds      1

_bSmallTimerStartFlag:
       ds      1

_bTwentySecStartFlag:
       ds      1

_sampleChannelSelect:
       ds      1

_sampleTimes:
       ds      1

main@bCheckTweHour:
       ds      1

main@bInitFlag:
       ds      1

main@enumMainLoopStep:
       ds      1

main@ucADC4_Step:
       ds      1

main@ucChannel4Type:
       ds      1

main@ucDelayPrefix4TimerP5s:
       ds      1

main@ucDelayPrefix6TimerP2s:
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

main@ucTimerDelayP2sLess:
       ds      1

main@ucTimerDelayP2sMore:
       ds      1

main@ucTimerForDACR0_CNT1:
       ds      1

main@ucTimerForDACR0_CNT1_f:
       ds      1

main@ucTimerForDACR0_CNT2:
       ds      1

main@ucTimerForDACR0_CNT2_f:
       ds      1

main@ucTimerLessADC1ZeroP5s:
       ds      1

main@ucTimerP5s:
       ds      1

main@ucTimerRightP5s:
       ds      1

main@ucTimerZeroPoint3s:
       ds      1

main@ucTimerZeroPoint5s:
       ds      1

vPutSampleDataIntoTable@ucChannelFifthLength:
       ds      1

vPutSampleDataIntoTable@ucChannelSecondLength:
       ds      1

vPutSampleDataIntoTable@ucChannelSixthLength:
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

main@uiMaxValue:
       ds      2

main@uiMinValue:
       ds      2

ISR@ucTimer1sCnt:
       ds      1

_adc_convert_flag:
       ds      1

_timer:
       ds      1

main@enumBranchStep:
       ds      1

main@enumInteralStep:
       ds      1

main@ucCheckTimerP2sLess:
       ds      1

main@ucCheckTimerP2sMore:
       ds      1

main@ucFourthSuffix1TimerP3s:
       ds      1

main@ucTimer1s:
       ds      1

main@ucTimer20s:
       ds      1

main@ucTimerLessX1P5s:
       ds      1

main@ucTimerLessX2P5s:
       ds      1

main@ucTimerP3s:
       ds      1

main@ucTimerX1P5s:
       ds      1

main@ucTimerX2P5s:
       ds      1

_uiSampleChannelSecond:
       ds      24

_uiSampleZero:
       ds      24

psect	bssBANK3,class=BANK3,space=1
global __pbssBANK3
__pbssBANK3:
_uiSampleChannelSixth:
       ds      24

_uiSampleChannelFifth:
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
	movlw	low((__pbssBANK0)+027h)
	fcall	clear_ram
; Clear objects allocated to BANK1
psect cinit,class=CODE,delta=2
	movlw	low(__pbssBANK1)
	movwf	fsr
	movlw	low((__pbssBANK1)+049h)
	fcall	clear_ram
; Clear objects allocated to BANK3
psect cinit,class=CODE,delta=2
	bsf	status, 7	;select IRP bank2
	movlw	low(__pbssBANK3)
	movwf	fsr
	movlw	low((__pbssBANK3)+030h)
	fcall	clear_ram
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
	global	?_setPB0
?_setPB0:	; 0 bytes @ 0x0
	global	?_setPB1
?_setPB1:	; 0 bytes @ 0x0
	global	?_setPA0
?_setPA0:	; 0 bytes @ 0x0
	global	?_setPA1
?_setPA1:	; 0 bytes @ 0x0
	global	?_setPA2
?_setPA2:	; 0 bytes @ 0x0
	global	?_setPA3
?_setPA3:	; 0 bytes @ 0x0
	global	?_setPA6
?_setPA6:	; 0 bytes @ 0x0
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
	global	??_setPB0
??_setPB0:	; 0 bytes @ 0x0
	global	??_setPB1
??_setPB1:	; 0 bytes @ 0x0
	global	??_setPA0
??_setPA0:	; 0 bytes @ 0x0
	global	??_setPA1
??_setPA1:	; 0 bytes @ 0x0
	global	??_setPA2
??_setPA2:	; 0 bytes @ 0x0
	global	??_setPA3
??_setPA3:	; 0 bytes @ 0x0
	global	??_setPA6
??_setPA6:	; 0 bytes @ 0x0
	global	??_getAD_ConvertFlag
??_getAD_ConvertFlag:	; 0 bytes @ 0x0
	global	??_setAD_ConvertFlag
??_setAD_ConvertFlag:	; 0 bytes @ 0x0
	global	?_Filter
?_Filter:	; 2 bytes @ 0x0
	global	setPB0@bValue
setPB0@bValue:	; 1 bytes @ 0x0
	global	setPB1@bValue
setPB1@bValue:	; 1 bytes @ 0x0
	global	setPA0@bValue
setPA0@bValue:	; 1 bytes @ 0x0
	global	setPA1@bValue
setPA1@bValue:	; 1 bytes @ 0x0
	global	setPA2@bValue
setPA2@bValue:	; 1 bytes @ 0x0
	global	setPA3@bValue
setPA3@bValue:	; 1 bytes @ 0x0
	global	setPA6@bValue
setPA6@bValue:	; 1 bytes @ 0x0
	global	setAD_ConvertFlag@flag
setAD_ConvertFlag@flag:	; 1 bytes @ 0x0
	global	adc_test_init@ref
adc_test_init@ref:	; 1 bytes @ 0x0
	global	Filter@tmpValue
Filter@tmpValue:	; 2 bytes @ 0x0
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
	global	??_AD_Sample
??_AD_Sample:	; 0 bytes @ 0x3
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
	global	Filter@cir
Filter@cir:	; 2 bytes @ 0x22
	ds	2
	global	Filter@j
Filter@j:	; 1 bytes @ 0x24
	ds	1
	global	Filter@i
Filter@i:	; 1 bytes @ 0x25
	ds	1
	global	?_getAdOriginalCh14Value
?_getAdOriginalCh14Value:	; 2 bytes @ 0x26
	global	?_getAdOriginalCh1Value
?_getAdOriginalCh1Value:	; 2 bytes @ 0x26
	global	?_getAdOriginaCh4Value
?_getAdOriginaCh4Value:	; 2 bytes @ 0x26
	ds	2
	global	??_getAdOriginalCh14Value
??_getAdOriginalCh14Value:	; 0 bytes @ 0x28
	global	??_getAdOriginalCh1Value
??_getAdOriginalCh1Value:	; 0 bytes @ 0x28
	global	??_getAdOriginaCh4Value
??_getAdOriginaCh4Value:	; 0 bytes @ 0x28
	global	??_main
??_main:	; 0 bytes @ 0x28
;;Data sizes: Strings 0, constant 0, data 0, bss 161, persistent 0 stack 0
;;Auto spaces:   Size  Autos    Used
;; COMMON          14     13      14
;; BANK0           80     40      79
;; BANK1           80      0      73
;; BANK3           96      0      48
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
;; Filter@tmpValue	PTR int  size(2) Largest target is 24
;;		 -> uiSampleChannelFifth(BANK3[24]), uiSampleChannelSecond(BANK1[24]), uiSampleZero(BANK1[24]), 
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
;;   _AD_Sample->_adc_test_init
;;   _getAdOriginaCh4Value->_Filter
;;   _getAdOriginalCh1Value->_Filter
;;   _getAdOriginalCh14Value->_Filter
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
;; (0) _main                                                 0     0      0    2168
;;                            _initPin
;;                       _clock_config
;;                      _timer1_config
;;            _timer1_interrupt_config
;;                      _adc_test_init
;;                           _dac_init
;;                          _adc_start
;;         _process_AD_Converter_Value
;;                 _isPermitSampleTime
;;                       _clrSampeTime
;;             _getAdOriginalCh14Value
;;               _clearPinPortAndTimer
;;                             _setPA6
;;              _getAdOriginalCh1Value
;;               _startTwelveHourTimer
;;         _isFinishedTwelveHoursTimer
;;               _getAdOriginaCh4Value
;;                             _setPA2
;;                             _setPA3
;;                             _setPA0
;;                             _setPA1
;;                             _setPB0
;;            _startTwentySecondsTimer
;;       _isFinishedTwentySecondsTimer
;;            _clearTwentySecondsTimer
;;               _startThreeHoursTimer
;;          _isFinishedThreeHoursTimer
;;               _clearThreeHoursTimer
;;                             _setPB1
;;                      _clearAllTimer
;; ---------------------------------------------------------------------------------
;; (1) _process_AD_Converter_Value                           0     0      0      66
;;                  _getAD_ConvertFlag
;;                  _setAD_ConvertFlag
;;                          _AD_Sample
;;                          _adc_start
;; ---------------------------------------------------------------------------------
;; (1) _clearPinPortAndTimer                                 0     0      0       0
;;                      _clearAllTimer
;; ---------------------------------------------------------------------------------
;; (2) _AD_Sample                                            0     0      0      44
;;                      _adc_test_init
;; ---------------------------------------------------------------------------------
;; (1) _getAdOriginaCh4Value                                 2     0      2     620
;;                                             38 BANK0      2     0      2
;;                             _Filter
;; ---------------------------------------------------------------------------------
;; (1) _getAdOriginalCh1Value                                2     0      2     620
;;                                             38 BANK0      2     0      2
;;                             _Filter
;; ---------------------------------------------------------------------------------
;; (1) _getAdOriginalCh14Value                               2     0      2     620
;;                                             38 BANK0      2     0      2
;;                             _Filter
;; ---------------------------------------------------------------------------------
;; (1) _clearAllTimer                                        0     0      0       0
;;              _clearTwelveHoursTimer
;;               _clearThreeHoursTimer
;;            _clearTwentySecondsTimer
;; ---------------------------------------------------------------------------------
;; (2) _setAD_ConvertFlag                                    1     1      0      22
;;                                              0 BANK0      1     1      0
;; ---------------------------------------------------------------------------------
;; (2) _getAD_ConvertFlag                                    0     0      0       0
;; ---------------------------------------------------------------------------------
;; (2) _Filter                                              38    36      2     620
;;                                              0 BANK0     38    36      2
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
;; (1) _dac_init                                             0     0      0       0
;; ---------------------------------------------------------------------------------
;; (3) _adc_test_init                                        3     2      1      44
;;                                              0 BANK0      3     2      1
;; ---------------------------------------------------------------------------------
;; (1) _timer1_interrupt_config                              0     0      0       0
;; ---------------------------------------------------------------------------------
;; (1) _timer1_config                                        0     0      0       0
;; ---------------------------------------------------------------------------------
;; (1) _clock_config                                         0     0      0       0
;; ---------------------------------------------------------------------------------
;; (1) _setPA6                                               1     1      0      22
;;                                              0 BANK0      1     1      0
;; ---------------------------------------------------------------------------------
;; (1) _setPA3                                               1     1      0      22
;;                                              0 BANK0      1     1      0
;; ---------------------------------------------------------------------------------
;; (1) _setPA2                                               1     1      0      22
;;                                              0 BANK0      1     1      0
;; ---------------------------------------------------------------------------------
;; (1) _setPA1                                               1     1      0      22
;;                                              0 BANK0      1     1      0
;; ---------------------------------------------------------------------------------
;; (1) _setPA0                                               1     1      0      22
;;                                              0 BANK0      1     1      0
;; ---------------------------------------------------------------------------------
;; (1) _setPB1                                               1     1      0      22
;;                                              0 BANK0      1     1      0
;; ---------------------------------------------------------------------------------
;; (1) _setPB0                                               1     1      0      22
;;                                              0 BANK0      1     1      0
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
;; (4) _ISR                                                  4     4      0     495
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
;; (5) _vPutSampleDataIntoTable                              5     2      3     398
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
;;   _adc_start
;;   _process_AD_Converter_Value
;;     _getAD_ConvertFlag
;;     _setAD_ConvertFlag
;;     _AD_Sample
;;       _adc_test_init
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
;;   _setPA6
;;   _getAdOriginalCh1Value
;;     _Filter
;;   _startTwelveHourTimer
;;   _isFinishedTwelveHoursTimer
;;   _getAdOriginaCh4Value
;;     _Filter
;;   _setPA2
;;   _setPA3
;;   _setPA0
;;   _setPA1
;;   _setPB0
;;   _startTwentySecondsTimer
;;   _isFinishedTwentySecondsTimer
;;   _clearTwentySecondsTimer
;;   _startThreeHoursTimer
;;   _isFinishedThreeHoursTimer
;;   _clearThreeHoursTimer
;;   _setPB1
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
;;BITCOMMON            E      0       0       0        0.0%
;;NULL                 0      0       0       0        0.0%
;;CODE                 0      0       0       0        0.0%
;;COMMON               E      D       E       1      100.0%
;;BITSFR0              0      0       0       1        0.0%
;;SFR0                 0      0       0       1        0.0%
;;BITSFR1              0      0       0       2        0.0%
;;SFR1                 0      0       0       2        0.0%
;;STACK                0      0       7       2        0.0%
;;ABS                  0      0      D6       3        0.0%
;;BITBANK0            50      0       0       4        0.0%
;;BITSFR3              0      0       0       4        0.0%
;;SFR3                 0      0       0       4        0.0%
;;BANK0               50     28      4F       5       98.8%
;;BITSFR2              0      0       0       5        0.0%
;;SFR2                 0      0       0       5        0.0%
;;DATA                 0      0      DD       6        0.0%
;;BITBANK1            50      0       0       7        0.0%
;;BANK1               50      0      49       8       91.3%
;;BITBANK3            60      0       0       9        0.0%
;;BANK3               60      0      30      10       50.0%
;;BITBANK2            60      0       0      11        0.0%
;;BANK2               60      0       0      12        0.0%

	global	_main
psect	maintext,global,class=CODE,delta=2
global __pmaintext
__pmaintext:

;; *************** function _main *****************
;; Defined at:
;;		line 459 in file "C:\temp\dev\AK7030-OTP\main.c"
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
;;		_adc_start
;;		_process_AD_Converter_Value
;;		_isPermitSampleTime
;;		_clrSampeTime
;;		_getAdOriginalCh14Value
;;		_clearPinPortAndTimer
;;		_setPA6
;;		_getAdOriginalCh1Value
;;		_startTwelveHourTimer
;;		_isFinishedTwelveHoursTimer
;;		_getAdOriginaCh4Value
;;		_setPA2
;;		_setPA3
;;		_setPA0
;;		_setPA1
;;		_setPB0
;;		_startTwentySecondsTimer
;;		_isFinishedTwentySecondsTimer
;;		_clearTwentySecondsTimer
;;		_startThreeHoursTimer
;;		_isFinishedThreeHoursTimer
;;		_clearThreeHoursTimer
;;		_setPB1
;;		_clearAllTimer
;; This function is called by:
;;		Startup code after reset
;; This function uses a non-reentrant model
;;
psect	maintext
	file	"C:\temp\dev\AK7030-OTP\main.c"
	line	459
	global	__size_of_main
	__size_of_main	equ	__end_of_main-_main
	
_main:	
	opt	stack 3
; Regs used in _main: [wreg-fsr0h+status,2+status,0+btemp+1+pclath+cstack]
	line	499
	
l4542:	
;main.c: 465: enum setp_Adc4
;main.c: 466: {
;main.c: 467: ADC4_STEP_INIT = 0,
;main.c: 468: ADC4_STEP_FIRST,
;main.c: 469: ADC4_STEP_SECOND,
;main.c: 470: ADC4_STEP_THIRD,
;main.c: 471: ADC4_STEP_FOURTH_PREFIX1,
;main.c: 472: ADC4_STEP_FOURTH_PREFIX2,
;main.c: 473: ADC4_STEP_FOURTH_PREFIX3,
;main.c: 474: ADC4_STEP_FOURTH_PREFIX4,
;main.c: 475: ADC4_STEP_FOURTH_PREFIX5,
;main.c: 476: ADC4_STEP_FOURTH_PREFIX6,
;main.c: 477: ADC4_STEP_FOURTH,
;main.c: 478: ADC4_STEP_FOURTH_SUFFIX1,
;main.c: 479: ADC4_STEP_FOURTH_SUFFIX2,
	bsf	status, 5	;RP0=1, select bank1
	bcf	(1064/8)^080h,(1064)&7
	line	500
;main.c: 500: TRISA1 = 0;
	bcf	(1065/8)^080h,(1065)&7
	line	501
;main.c: 501: TRISA2 = 0;
	bcf	(1066/8)^080h,(1066)&7
	line	502
;main.c: 502: TRISA3 = 0;
	bcf	(1067/8)^080h,(1067)&7
	line	503
;main.c: 503: TRISB0 = 0;
	bcf	(1072/8)^080h,(1072)&7
	line	504
;main.c: 504: TRISB1 = 0;
	bcf	(1073/8)^080h,(1073)&7
	line	505
;main.c: 505: TRISA6 = 0;
	bcf	(1070/8)^080h,(1070)&7
	line	507
;main.c: 507: TRISB7 = 0;
	bcf	(1079/8)^080h,(1079)&7
	line	508
;main.c: 508: TRISB6 = 0;
	bcf	(1078/8)^080h,(1078)&7
	line	511
	
l4544:	
;main.c: 511: initPin();
	fcall	_initPin
	line	514
	
l4546:	
;main.c: 514: TRISB2 = 1;
	bcf	status, 6	;RP1=0, select bank1
	bsf	(1074/8)^080h,(1074)&7
	line	517
	
l4548:	
;main.c: 517: TRISA7 = 1;
	bsf	(1071/8)^080h,(1071)&7
	line	519
	
l4550:	
;main.c: 519: TRISB4 = 1;
	bsf	(1076/8)^080h,(1076)&7
	line	521
	
l4552:	
;main.c: 521: clock_config();
	fcall	_clock_config
	line	522
	
l4554:	
;main.c: 522: timer1_config();
	fcall	_timer1_config
	line	523
;main.c: 523: timer1_interrupt_config();
	fcall	_timer1_interrupt_config
	line	525
	
l4556:	
;main.c: 525: adc_test_init(0,3);
	movlw	(03h)
	bcf	status, 5	;RP0=0, select bank0
	movwf	(?_adc_test_init)
	movlw	(0)
	fcall	_adc_test_init
	line	527
	
l4558:	
;main.c: 527: dac_init();
	fcall	_dac_init
	line	532
;main.c: 532: adc_start();
	fcall	_adc_start
	line	573
	
l4560:	
# 573 "C:\temp\dev\AK7030-OTP\main.c"
 clrwdt ;#
psect	maintext
	line	575
	
l4562:	
;main.c: 575: process_AD_Converter_Value();
	fcall	_process_AD_Converter_Value
	line	577
	
l4564:	
;main.c: 577: if( isPermitSampleTime() )
	fcall	_isPermitSampleTime
	xorlw	0
	skipnz
	goto	u1741
	goto	u1740
u1741:
	goto	l4560
u1740:
	line	581
	
l4566:	
;main.c: 578: {
;main.c: 581: clrSampeTime();
	fcall	_clrSampeTime
	line	596
;main.c: 596: switch(enumMainLoopStep)
	goto	l5220
	line	605
	
l4568:	
;main.c: 599: {
;main.c: 604: static unsigned char ucTimerZeroPoint5s = 0;
;main.c: 605: if(getAdOriginalCh14Value() > 1950)
	fcall	_getAdOriginalCh14Value
	movlw	high(079Fh)
	subwf	(1+(?_getAdOriginalCh14Value)),w
	movlw	low(079Fh)
	skipnz
	subwf	(0+(?_getAdOriginalCh14Value)),w
	skipc
	goto	u1751
	goto	u1750
u1751:
	goto	l4572
u1750:
	line	607
	
l4570:	
;main.c: 606: {
;main.c: 607: ucTimerZeroPoint5s++;
	incf	(main@ucTimerZeroPoint5s),f
	line	608
;main.c: 608: }
	goto	l4574
	line	610
	
l4572:	
;main.c: 609: else
;main.c: 610: ucTimerZeroPoint5s = 0;
	clrf	(main@ucTimerZeroPoint5s)
	line	612
	
l4574:	
;main.c: 612: if(ucTimerZeroPoint5s >= 5)
	movlw	(05h)
	subwf	(main@ucTimerZeroPoint5s),w
	skipc
	goto	u1761
	goto	u1760
u1761:
	goto	l4560
u1760:
	line	614
	
l4576:	
;main.c: 613: {
;main.c: 614: ucTimerZeroPoint5s = 0;
	clrf	(main@ucTimerZeroPoint5s)
	line	615
	
l4578:	
;main.c: 615: enumMainLoopStep = MAIN_LOOP_STEP_FIRST;
	clrf	(main@enumMainLoopStep)
	incf	(main@enumMainLoopStep),f
	goto	l4560
	line	616
	
l748:	
	line	617
;main.c: 616: }
;main.c: 617: break;
	goto	l4560
	line	629
	
l4580:	
;main.c: 621: {
;main.c: 626: static unsigned char ucTimerZeroPoint3s = 0;
;main.c: 629: if(getAdOriginalCh14Value() > 1950)
	fcall	_getAdOriginalCh14Value
	movlw	high(079Fh)
	subwf	(1+(?_getAdOriginalCh14Value)),w
	movlw	low(079Fh)
	skipnz
	subwf	(0+(?_getAdOriginalCh14Value)),w
	skipc
	goto	u1771
	goto	u1770
u1771:
	goto	l4586
u1770:
	line	632
	
l4582:	
;main.c: 630: {
;main.c: 632: enumMainLoopStep = MAIN_LOOP_STEP_SECOND;
	movlw	(02h)
	movwf	(main@enumMainLoopStep)
	line	634
	
l4584:	
;main.c: 634: ucTimerZeroPoint3s = 0;
	clrf	(main@ucTimerZeroPoint3s)
	line	636
;main.c: 636: }
	goto	l4560
	line	639
	
l4586:	
;main.c: 637: else
;main.c: 638: {
;main.c: 639: ucTimerZeroPoint3s++;
	incf	(main@ucTimerZeroPoint3s),f
	line	641
	
l4588:	
;main.c: 641: if(ucTimerZeroPoint3s >= 3)
	movlw	(03h)
	subwf	(main@ucTimerZeroPoint3s),w
	skipc
	goto	u1781
	goto	u1780
u1781:
	goto	l748
u1780:
	line	643
	
l4590:	
;main.c: 642: {
;main.c: 643: ucTimerZeroPoint3s = 0;
	clrf	(main@ucTimerZeroPoint3s)
	line	645
	
l4592:	
;main.c: 645: clearPinPortAndTimer();
	fcall	_clearPinPortAndTimer
	goto	l4560
	line	661
	
l4594:	
;main.c: 653: {
;main.c: 658: static unsigned char ucTimerP5s = 0;
;main.c: 661: setPA6(1);
	movlw	(01h)
	fcall	_setPA6
	line	663
	
l4596:	
;main.c: 663: if(ucTimerP5s < 5)
	movlw	(05h)
	subwf	(main@ucTimerP5s),w
	skipnc
	goto	u1791
	goto	u1790
u1791:
	goto	l4600
u1790:
	line	664
	
l4598:	
;main.c: 664: ucTimerP5s++;
	incf	(main@ucTimerP5s),f
	goto	l4560
	line	667
	
l4600:	
;main.c: 665: else
;main.c: 666: {
;main.c: 667: ucTimerP5s = 0;
	clrf	(main@ucTimerP5s)
	line	669
	
l4602:	
;main.c: 669: enumMainLoopStep = MAIN_LOOP_STEP_THIRD;
	movlw	(03h)
	movwf	(main@enumMainLoopStep)
	goto	l4560
	line	689
	
l4604:	
;main.c: 676: {
;main.c: 681: static unsigned char ucTimerADC1ZeroP5s = 0;
;main.c: 683: static unsigned char ucTimerLessADC1ZeroP5s = 0;
;main.c: 685: static unsigned char ucTimerLessADC1ZeroP5sFlag = 0;
;main.c: 687: static unsigned char ucTimerRightP5s = 0;
;main.c: 689: if(getAdOriginalCh1Value() < 115)
	fcall	_getAdOriginalCh1Value
	movlw	high(073h)
	subwf	(1+(?_getAdOriginalCh1Value)),w
	movlw	low(073h)
	skipnz
	subwf	(0+(?_getAdOriginalCh1Value)),w
	skipnc
	goto	u1801
	goto	u1800
u1801:
	goto	l4610
u1800:
	line	691
	
l4606:	
;main.c: 690: {
;main.c: 691: ucTimerADC1ZeroP5s = 0;
	clrf	(main@ucTimerADC1ZeroP5s)
	line	693
	
l4608:	
;main.c: 693: ucTimerLessADC1ZeroP5s++;
	incf	(main@ucTimerLessADC1ZeroP5s),f
	line	694
;main.c: 694: }
	goto	l4614
	line	697
	
l4610:	
;main.c: 695: else
;main.c: 696: {
;main.c: 697: ucTimerADC1ZeroP5s++;
	incf	(main@ucTimerADC1ZeroP5s),f
	line	699
	
l4612:	
;main.c: 699: ucTimerLessADC1ZeroP5s = 0;
	clrf	(main@ucTimerLessADC1ZeroP5s)
	line	702
	
l4614:	
;main.c: 700: }
;main.c: 702: if(ucTimerADC1ZeroP5s >= 3)
	movlw	(03h)
	subwf	(main@ucTimerADC1ZeroP5s),w
	skipc
	goto	u1811
	goto	u1810
u1811:
	goto	l4620
u1810:
	line	704
	
l4616:	
;main.c: 703: {
;main.c: 704: ucTimerADC1ZeroP5s = 0;
	clrf	(main@ucTimerADC1ZeroP5s)
	line	705
	
l4618:	
;main.c: 705: enumMainLoopStep = MAIN_LOOP_STEP_FOURTH;
	movlw	(04h)
	movwf	(main@enumMainLoopStep)
	line	706
;main.c: 706: }
	goto	l4634
	line	707
	
l4620:	
;main.c: 707: else if( ucTimerLessADC1ZeroP5s >= 3)
	movlw	(03h)
	subwf	(main@ucTimerLessADC1ZeroP5s),w
	skipc
	goto	u1821
	goto	u1820
u1821:
	goto	l4634
u1820:
	line	710
	
l4622:	
;main.c: 708: {
;main.c: 710: if(getAdOriginalCh1Value() < 105)
	fcall	_getAdOriginalCh1Value
	movlw	high(069h)
	subwf	(1+(?_getAdOriginalCh1Value)),w
	movlw	low(069h)
	skipnz
	subwf	(0+(?_getAdOriginalCh1Value)),w
	skipnc
	goto	u1831
	goto	u1830
u1831:
	goto	l4626
u1830:
	line	712
	
l4624:	
;main.c: 711: {
;main.c: 712: ucTimerRightP5s++;
	incf	(main@ucTimerRightP5s),f
	line	713
;main.c: 713: }
	goto	l4628
	line	716
	
l4626:	
;main.c: 714: else
;main.c: 715: {
;main.c: 716: ucTimerRightP5s = 0;
	clrf	(main@ucTimerRightP5s)
	line	719
	
l4628:	
;main.c: 717: }
;main.c: 719: if(ucTimerRightP5s >= 3)
	movlw	(03h)
	subwf	(main@ucTimerRightP5s),w
	skipc
	goto	u1841
	goto	u1840
u1841:
	goto	l779
u1840:
	line	721
	
l4630:	
;main.c: 720: {
;main.c: 721: ucTimerLessADC1ZeroP5s = 0;
	clrf	(main@ucTimerLessADC1ZeroP5s)
	line	722
;main.c: 722: ucTimerRightP5s = 0;
	clrf	(main@ucTimerRightP5s)
	line	723
	
l4632:	
;main.c: 723: enumMainLoopStep = MAIN_LOOP_STEP_3_HOUR_BRANCH;
	movlw	(08h)
	movwf	(main@enumMainLoopStep)
	line	724
;main.c: 724: }
	goto	l4634
	line	733
;main.c: 730: else
;main.c: 731: {
;main.c: 732: ;
	
l779:	
	line	735
	
l4634:	
;main.c: 733: }
;main.c: 735: if((MAIN_LOOP_STEP_3_HOUR_BRANCH == enumMainLoopStep) || (MAIN_LOOP_STEP_FOURTH == enumMainLoopStep))
	movf	(main@enumMainLoopStep),w
	xorlw	08h
	skipnz
	goto	u1851
	goto	u1850
u1851:
	goto	l4638
u1850:
	
l4636:	
	movf	(main@enumMainLoopStep),w
	xorlw	04h
	skipz
	goto	u1861
	goto	u1860
u1861:
	goto	l748
u1860:
	line	737
	
l4638:	
;main.c: 736: {
;main.c: 737: ucTimerRightP5s = 0;
	clrf	(main@ucTimerRightP5s)
	line	738
;main.c: 738: ucTimerADC1ZeroP5s = 0;
	clrf	(main@ucTimerADC1ZeroP5s)
	line	739
;main.c: 739: ucTimerLessADC1ZeroP5s = 0;
	clrf	(main@ucTimerLessADC1ZeroP5s)
	goto	l4560
	line	753
	
l4640:	
;main.c: 747: {
;main.c: 753: startTwelveHourTimer(36000);
	movlw	low(08CA0h)
	movwf	(?_startTwelveHourTimer)
	movlw	high(08CA0h)
	movwf	((?_startTwelveHourTimer))+1
	fcall	_startTwelveHourTimer
	line	754
	
l4642:	
;main.c: 754: enumMainLoopStep = MAIN_LOOP_STEP_FIFTH;
	movlw	(05h)
	bcf	status, 5	;RP0=0, select bank0
	movwf	(main@enumMainLoopStep)
	line	756
	
l4644:	
;main.c: 756: bCheckTweHour = 0;
	clrf	(main@bCheckTweHour)
	line	758
;main.c: 758: break;
	goto	l4560
	line	766
	
l4646:	
;main.c: 762: {
;main.c: 766: if(( isFinishedTwelveHoursTimer() && (! bCheckTweHour)))
	fcall	_isFinishedTwelveHoursTimer
	xorlw	0
	skipnz
	goto	u1871
	goto	u1870
u1871:
	goto	l5100
u1870:
	
l4648:	
	bcf	status, 5	;RP0=0, select bank0
	movf	(main@bCheckTweHour),f
	skipz
	goto	u1881
	goto	u1880
u1881:
	goto	l5100
u1880:
	line	768
	
l4650:	
;main.c: 767: {
;main.c: 768: enumMainLoopStep = MAIN_LOOP_STEP_12_HOUR_END;
	movlw	(09h)
	movwf	(main@enumMainLoopStep)
	line	769
	
l4652:	
;main.c: 769: bCheckTweHour = 1;
	clrf	(main@bCheckTweHour)
	incf	(main@bCheckTweHour),f
	line	770
;main.c: 770: }
	goto	l4560
	line	777
;main.c: 776: {
;main.c: 777: case ADC4_STEP_INIT:
	
l790:	
	line	783
;main.c: 778: {
;main.c: 783: ucADC4_Step = ADC4_STEP_FIRST;
	clrf	(main@ucADC4_Step)
	incf	(main@ucADC4_Step),f
	line	784
;main.c: 784: break;
	goto	l4560
	line	796
	
l4654:	
;main.c: 788: {
;main.c: 792: static unsigned int uiOldValue = 0, uiMinValue = 0, uiMaxValue = 0;
;main.c: 794: static unsigned char bInitFlag = 0;
;main.c: 796: if( 0 == bInitFlag)
	movf	(main@bInitFlag),f
	skipz
	goto	u1891
	goto	u1890
u1891:
	goto	l4660
u1890:
	line	798
	
l4656:	
;main.c: 797: {
;main.c: 798: bInitFlag = 1;
	clrf	(main@bInitFlag)
	incf	(main@bInitFlag),f
	line	799
	
l4658:	
;main.c: 799: uiOldValue = getAdOriginaCh4Value();
	fcall	_getAdOriginaCh4Value
	movf	(1+(?_getAdOriginaCh4Value)),w
	movwf	(main@uiOldValue+1)
	movf	(0+(?_getAdOriginaCh4Value)),w
	movwf	(main@uiOldValue)
	line	809
	
l4660:	
;main.c: 800: }
;main.c: 809: if(LESS_THAN_1911 == ucChannel4Type)
	movf	(main@ucChannel4Type),f
	skipz
	goto	u1901
	goto	u1900
u1901:
	goto	l4666
u1900:
	line	811
	
l4662:	
;main.c: 810: {
;main.c: 811: uiMinValue = 0;
	bsf	status, 5	;RP0=1, select bank1
	clrf	(main@uiMinValue)^080h
	clrf	(main@uiMinValue+1)^080h
	line	812
	
l4664:	
;main.c: 812: uiMaxValue = 1931;
	movlw	low(078Bh)
	movwf	(main@uiMaxValue)^080h
	movlw	high(078Bh)
	movwf	((main@uiMaxValue)^080h)+1
	line	813
;main.c: 813: }
	goto	l4680
	line	814
	
l4666:	
;main.c: 814: else if(BETWEEN_1911_AND_2067 == ucChannel4Type)
	decf	(main@ucChannel4Type),w
	skipz
	goto	u1911
	goto	u1910
u1911:
	goto	l4670
u1910:
	line	816
	
l4668:	
;main.c: 815: {
;main.c: 816: uiMinValue = 1931 - 40;
	movlw	low(0763h)
	bsf	status, 5	;RP0=1, select bank1
	movwf	(main@uiMinValue)^080h
	movlw	high(0763h)
	movwf	((main@uiMinValue)^080h)+1
	line	817
;main.c: 817: uiMaxValue = 2047;
	movlw	low(07FFh)
	movwf	(main@uiMaxValue)^080h
	movlw	high(07FFh)
	movwf	((main@uiMaxValue)^080h)+1
	line	818
;main.c: 818: }
	goto	l4680
	line	819
	
l4670:	
;main.c: 819: else if(BETWEEN_2067_AND_2204 == ucChannel4Type)
	movf	(main@ucChannel4Type),w
	xorlw	02h
	skipz
	goto	u1921
	goto	u1920
u1921:
	goto	l4674
u1920:
	line	821
	
l4672:	
;main.c: 820: {
;main.c: 821: uiMinValue = 2047 - 40;
	movlw	low(07D7h)
	bsf	status, 5	;RP0=1, select bank1
	movwf	(main@uiMinValue)^080h
	movlw	high(07D7h)
	movwf	((main@uiMinValue)^080h)+1
	line	822
;main.c: 822: uiMaxValue = 2164;
	movlw	low(0874h)
	movwf	(main@uiMaxValue)^080h
	movlw	high(0874h)
	movwf	((main@uiMaxValue)^080h)+1
	line	823
;main.c: 823: }
	goto	l4680
	line	824
	
l4674:	
;main.c: 824: else if(BETWEEN_2204_AND_2340 == ucChannel4Type)
	movf	(main@ucChannel4Type),w
	xorlw	03h
	skipz
	goto	u1931
	goto	u1930
u1931:
	goto	l4678
u1930:
	line	826
	
l4676:	
;main.c: 825: {
;main.c: 826: uiMinValue = 2164 - 40;
	movlw	low(084Ch)
	bsf	status, 5	;RP0=1, select bank1
	movwf	(main@uiMinValue)^080h
	movlw	high(084Ch)
	movwf	((main@uiMinValue)^080h)+1
	line	827
;main.c: 827: uiMaxValue = 2281;
	movlw	low(08E9h)
	movwf	(main@uiMaxValue)^080h
	movlw	high(08E9h)
	movwf	((main@uiMaxValue)^080h)+1
	line	828
;main.c: 828: }
	goto	l4680
	line	831
	
l4678:	
;main.c: 829: else
;main.c: 830: {
;main.c: 831: uiMinValue = 2281 - 40;
	movlw	low(08C1h)
	bsf	status, 5	;RP0=1, select bank1
	movwf	(main@uiMinValue)^080h
	movlw	high(08C1h)
	movwf	((main@uiMinValue)^080h)+1
	line	832
;main.c: 832: uiMaxValue = 2281;
	movlw	low(08E9h)
	movwf	(main@uiMaxValue)^080h
	movlw	high(08E9h)
	movwf	((main@uiMaxValue)^080h)+1
	line	837
	
l4680:	
;main.c: 833: }
;main.c: 836: if(( getAdOriginaCh4Value() < uiMinValue )
;main.c: 837: || (getAdOriginaCh4Value() > uiMaxValue ))
	fcall	_getAdOriginaCh4Value
	bsf	status, 5	;RP0=1, select bank1
	movf	(main@uiMinValue+1)^080h,w
	bcf	status, 5	;RP0=0, select bank0
	subwf	(1+(?_getAdOriginaCh4Value)),w
	skipz
	goto	u1945
	bsf	status, 5	;RP0=1, select bank1
	movf	(main@uiMinValue)^080h,w
	bcf	status, 5	;RP0=0, select bank0
	subwf	(0+(?_getAdOriginaCh4Value)),w
u1945:
	skipc
	goto	u1941
	goto	u1940
u1941:
	goto	l4684
u1940:
	
l4682:	
	fcall	_getAdOriginaCh4Value
	movf	(1+(?_getAdOriginaCh4Value)),w
	bsf	status, 5	;RP0=1, select bank1
	subwf	(main@uiMaxValue+1)^080h,w
	skipz
	goto	u1955
	bcf	status, 5	;RP0=0, select bank0
	movf	(0+(?_getAdOriginaCh4Value)),w
	bsf	status, 5	;RP0=1, select bank1
	subwf	(main@uiMaxValue)^080h,w
u1955:
	skipnc
	goto	u1951
	goto	u1950
u1951:
	goto	l4686
u1950:
	line	839
	
l4684:	
;main.c: 838: {
;main.c: 839: uiOldValue = getAdOriginaCh4Value();
	fcall	_getAdOriginaCh4Value
	movf	(1+(?_getAdOriginaCh4Value)),w
	movwf	(main@uiOldValue+1)
	movf	(0+(?_getAdOriginaCh4Value)),w
	movwf	(main@uiOldValue)
	line	842
	
l4686:	
;main.c: 840: }
;main.c: 842: if( uiOldValue < 1931 )
	movlw	high(078Bh)
	bcf	status, 5	;RP0=0, select bank0
	subwf	(main@uiOldValue+1),w
	movlw	low(078Bh)
	skipnz
	subwf	(main@uiOldValue),w
	skipnc
	goto	u1961
	goto	u1960
u1961:
	goto	l4690
u1960:
	line	843
	
l4688:	
;main.c: 843: ucChannel4Type = LESS_THAN_1911;
	clrf	(main@ucChannel4Type)
	goto	l814
	line	844
	
l4690:	
;main.c: 844: else if( uiOldValue < 2047 )
	movlw	high(07FFh)
	subwf	(main@uiOldValue+1),w
	movlw	low(07FFh)
	skipnz
	subwf	(main@uiOldValue),w
	skipnc
	goto	u1971
	goto	u1970
u1971:
	goto	l4694
u1970:
	line	845
	
l4692:	
;main.c: 845: ucChannel4Type = BETWEEN_1911_AND_2067;
	clrf	(main@ucChannel4Type)
	incf	(main@ucChannel4Type),f
	goto	l814
	line	846
	
l4694:	
;main.c: 846: else if( uiOldValue < 2164 )
	movlw	high(0874h)
	subwf	(main@uiOldValue+1),w
	movlw	low(0874h)
	skipnz
	subwf	(main@uiOldValue),w
	skipnc
	goto	u1981
	goto	u1980
u1981:
	goto	l4698
u1980:
	line	847
	
l4696:	
;main.c: 847: ucChannel4Type = BETWEEN_2067_AND_2204;
	movlw	(02h)
	movwf	(main@ucChannel4Type)
	goto	l814
	line	848
	
l4698:	
;main.c: 848: else if( uiOldValue < 2281 )
	movlw	high(08E9h)
	subwf	(main@uiOldValue+1),w
	movlw	low(08E9h)
	skipnz
	subwf	(main@uiOldValue),w
	skipnc
	goto	u1991
	goto	u1990
u1991:
	goto	l4702
u1990:
	line	849
	
l4700:	
;main.c: 849: ucChannel4Type = BETWEEN_2204_AND_2340;
	movlw	(03h)
	movwf	(main@ucChannel4Type)
	goto	l814
	line	851
	
l4702:	
;main.c: 850: else
;main.c: 851: ucChannel4Type = MORE_THAN_2340;
	movlw	(04h)
	movwf	(main@ucChannel4Type)
	
l814:	
	line	853
;main.c: 853: ucADC4_Step = ADC4_STEP_SECOND;
	movlw	(02h)
	movwf	(main@ucADC4_Step)
	line	854
;main.c: 854: break;
	goto	l4560
	line	872
;main.c: 871: {
;main.c: 872: case 0:
	
l829:	
	line	876
;main.c: 873: {
;main.c: 876: PB0 = 1;
	bsf	(48/8),(48)&7
	line	880
	
l4704:	
;main.c: 880: ucLoaderStep++;
	incf	(main@ucLoaderStep),f
	line	881
;main.c: 881: break;
	goto	l4560
	line	886
	
l4706:	
;main.c: 885: {
;main.c: 886: if(ucTimerDelay >= 5)
	movlw	(05h)
	subwf	(main@ucTimerDelay),w
	skipc
	goto	u2001
	goto	u2000
u2001:
	goto	l4714
u2000:
	line	889
	
l4708:	
;main.c: 887: {
;main.c: 889: PA0 = 1;
	bsf	(40/8),(40)&7
	line	893
	
l4710:	
;main.c: 893: ucTimerDelay = 0;
	clrf	(main@ucTimerDelay)
	goto	l4704
	line	897
	
l4714:	
;main.c: 896: else
;main.c: 897: ucTimerDelay++;
	incf	(main@ucTimerDelay),f
	goto	l4560
	line	903
	
l4716:	
;main.c: 902: {
;main.c: 903: if(ucTimerDelay >= 5)
	movlw	(05h)
	subwf	(main@ucTimerDelay),w
	skipc
	goto	u2011
	goto	u2010
u2011:
	goto	l4714
u2010:
	line	906
	
l4718:	
;main.c: 904: {
;main.c: 906: PA1= 1;
	bsf	(41/8),(41)&7
	goto	l4710
	line	921
	
l4726:	
;main.c: 920: {
;main.c: 921: if(ucTimerDelay >= 5)
	movlw	(05h)
	subwf	(main@ucTimerDelay),w
	skipc
	goto	u2021
	goto	u2020
u2021:
	goto	l4714
u2020:
	line	924
	
l4728:	
;main.c: 922: {
;main.c: 924: PA2= 1;
	bsf	(42/8),(42)&7
	goto	l4710
	line	939
	
l4736:	
;main.c: 938: {
;main.c: 939: if(ucTimerDelay >= 5)
	movlw	(05h)
	subwf	(main@ucTimerDelay),w
	skipc
	goto	u2031
	goto	u2030
u2031:
	goto	l4714
u2030:
	line	942
	
l4738:	
;main.c: 940: {
;main.c: 942: PA3 = 1;
	bsf	(43/8),(43)&7
	goto	l4710
	line	956
	
l4746:	
;main.c: 955: {
;main.c: 956: if(ucTimerDelay >= 5)
	movlw	(05h)
	subwf	(main@ucTimerDelay),w
	skipc
	goto	u2041
	goto	u2040
u2041:
	goto	l4714
u2040:
	line	959
	
l4748:	
;main.c: 957: {
;main.c: 959: PB0 = 0;
	bcf	(48/8),(48)&7
	line	960
;main.c: 960: PA0 = 0;
	bcf	(40/8),(40)&7
	line	961
;main.c: 961: PA1 = 0;
	bcf	(41/8),(41)&7
	line	962
;main.c: 962: PA2 = 0;
	bcf	(42/8),(42)&7
	line	963
;main.c: 963: PA3 = 0;
	bcf	(43/8),(43)&7
	goto	l4710
	line	981
	
l4756:	
;main.c: 980: {
;main.c: 981: if(ucTimerDelay >= 1)
	movf	(main@ucTimerDelay),w
	skipz
	goto	u2050
	goto	l4714
u2050:
	line	983
	
l4758:	
;main.c: 982: {
;main.c: 983: ucTimerDelay = 0;
	clrf	(main@ucTimerDelay)
	line	985
;main.c: 985: ucLoaderStep = 0;
	clrf	(main@ucLoaderStep)
	line	986
	
l4760:	
;main.c: 986: ucADC4_Step = ADC4_STEP_THIRD;
	movlw	(03h)
	movwf	(main@ucADC4_Step)
	line	987
;main.c: 987: }
	goto	l4560
	line	870
	
l4766:	
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
goto l748
movlw high(S5510)
movwf pclath
	clrc
	rlf fsr,w
	addlw low(S5510)
	movwf pc
psect	swtext1,local,class=CONST,delta=2
global __pswtext1
__pswtext1:
S5510:
	ljmp	l829
	ljmp	l4706
	ljmp	l4716
	ljmp	l4726
	ljmp	l4736
	ljmp	l4746
	ljmp	l4756
psect	maintext

	line	1007
;main.c: 1006: {
;main.c: 1007: case 0:
	
l857:	
	line	1010
;main.c: 1008: {
;main.c: 1010: PB0 = 1;
	bsf	(48/8),(48)&7
	line	1014
	
l4768:	
;main.c: 1014: ucLoaderStep1++;
	incf	(main@ucLoaderStep1),f
	line	1015
;main.c: 1015: break;
	goto	l4560
	line	1020
	
l4770:	
;main.c: 1019: {
;main.c: 1020: if(ucTimerDelay1 >= 5)
	movlw	(05h)
	subwf	(main@ucTimerDelay1),w
	skipc
	goto	u2061
	goto	u2060
u2061:
	goto	l4778
u2060:
	line	1023
	
l4772:	
;main.c: 1021: {
;main.c: 1023: PA0 = 1;
	bsf	(40/8),(40)&7
	line	1027
	
l4774:	
;main.c: 1027: ucTimerDelay1 = 0;
	clrf	(main@ucTimerDelay1)
	goto	l4768
	line	1031
	
l4778:	
;main.c: 1030: else
;main.c: 1031: ucTimerDelay1++;
	incf	(main@ucTimerDelay1),f
	goto	l4560
	line	1037
	
l4780:	
;main.c: 1036: {
;main.c: 1037: if(ucTimerDelay1 >= 5)
	movlw	(05h)
	subwf	(main@ucTimerDelay1),w
	skipc
	goto	u2071
	goto	u2070
u2071:
	goto	l4778
u2070:
	line	1040
	
l4782:	
;main.c: 1038: {
;main.c: 1040: PA1= 1;
	bsf	(41/8),(41)&7
	goto	l4774
	line	1054
	
l4790:	
;main.c: 1053: {
;main.c: 1054: if(ucTimerDelay1 >= 5)
	movlw	(05h)
	subwf	(main@ucTimerDelay1),w
	skipc
	goto	u2081
	goto	u2080
u2081:
	goto	l4778
u2080:
	line	1057
	
l4792:	
;main.c: 1055: {
;main.c: 1057: setPA2(1);
	movlw	(01h)
	fcall	_setPA2
	goto	l4774
	line	1068
	
l4800:	
;main.c: 1067: {
;main.c: 1068: if(ucTimerDelay1 >= 5)
	movlw	(05h)
	subwf	(main@ucTimerDelay1),w
	skipc
	goto	u2091
	goto	u2090
u2091:
	goto	l4778
u2090:
	line	1071
	
l4802:	
;main.c: 1069: {
;main.c: 1071: setPA3(1);
	movlw	(01h)
	fcall	_setPA3
	goto	l4774
	line	1082
	
l4810:	
;main.c: 1081: {
;main.c: 1082: if(ucTimerDelay1 >= 5)
	movlw	(05h)
	subwf	(main@ucTimerDelay1),w
	skipc
	goto	u2101
	goto	u2100
u2101:
	goto	l4778
u2100:
	line	1085
	
l4812:	
;main.c: 1083: {
;main.c: 1085: setPA0(0);
	movlw	(0)
	fcall	_setPA0
	line	1087
;main.c: 1087: setPA1(0);
	movlw	(0)
	fcall	_setPA1
	line	1089
;main.c: 1089: setPA2(0);
	movlw	(0)
	fcall	_setPA2
	line	1091
;main.c: 1091: setPA3(0);
	movlw	(0)
	fcall	_setPA3
	goto	l4774
	line	1102
	
l4820:	
;main.c: 1101: {
;main.c: 1102: if(ucTimerDelay1 >= 1)
	movf	(main@ucTimerDelay1),w
	skipz
	goto	u2110
	goto	l4778
u2110:
	line	1104
	
l4822:	
;main.c: 1103: {
;main.c: 1104: ucTimerDelay1 = 0;
	clrf	(main@ucTimerDelay1)
	line	1106
;main.c: 1106: ucLoaderStep1 = 0;
	clrf	(main@ucLoaderStep1)
	goto	l4760
	line	1005
	
l4830:	
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
goto l748
movlw high(S5512)
movwf pclath
	clrc
	rlf fsr,w
	addlw low(S5512)
	movwf pc
psect	swtext2,local,class=CONST,delta=2
global __pswtext2
__pswtext2:
S5512:
	ljmp	l857
	ljmp	l4770
	ljmp	l4780
	ljmp	l4790
	ljmp	l4800
	ljmp	l4810
	ljmp	l4820
psect	maintext

	line	1132
	
l4832:	
;main.c: 1130: {
;main.c: 1132: setPB0(1);
	movlw	(01h)
	fcall	_setPB0
	line	1134
;main.c: 1134: setPA0(1);
	movlw	(01h)
	fcall	_setPA0
	line	1135
	
l4834:	
;main.c: 1135: ucLoaderStep2++;
	incf	(main@ucLoaderStep2),f
	line	1136
;main.c: 1136: break;
	goto	l4560
	line	1141
	
l4836:	
;main.c: 1140: {
;main.c: 1141: if(ucTimerDelay2 >= 5)
	movlw	(05h)
	subwf	(main@ucTimerDelay2),w
	skipc
	goto	u2121
	goto	u2120
u2121:
	goto	l4844
u2120:
	line	1144
	
l4838:	
;main.c: 1142: {
;main.c: 1144: setPA1(1);
	movlw	(01h)
	fcall	_setPA1
	line	1145
	
l4840:	
;main.c: 1145: ucTimerDelay2 = 0;
	clrf	(main@ucTimerDelay2)
	goto	l4834
	line	1149
	
l4844:	
;main.c: 1148: else
;main.c: 1149: ucTimerDelay2++;
	incf	(main@ucTimerDelay2),f
	goto	l4560
	line	1155
	
l4846:	
;main.c: 1154: {
;main.c: 1155: if(ucTimerDelay2 >= 5)
	movlw	(05h)
	subwf	(main@ucTimerDelay2),w
	skipc
	goto	u2131
	goto	u2130
u2131:
	goto	l4844
u2130:
	line	1158
	
l4848:	
;main.c: 1156: {
;main.c: 1158: setPA2(1);
	movlw	(01h)
	fcall	_setPA2
	goto	l4840
	line	1169
	
l4856:	
;main.c: 1168: {
;main.c: 1169: if(ucTimerDelay2 >= 5)
	movlw	(05h)
	subwf	(main@ucTimerDelay2),w
	skipc
	goto	u2141
	goto	u2140
u2141:
	goto	l4844
u2140:
	line	1172
	
l4858:	
;main.c: 1170: {
;main.c: 1172: setPA3(1);
	movlw	(01h)
	fcall	_setPA3
	goto	l4840
	line	1183
	
l4866:	
;main.c: 1182: {
;main.c: 1183: if(ucTimerDelay2 >= 5)
	movlw	(05h)
	subwf	(main@ucTimerDelay2),w
	skipc
	goto	u2151
	goto	u2150
u2151:
	goto	l4844
u2150:
	line	1187
	
l4868:	
;main.c: 1184: {
;main.c: 1187: setPA1(0);
	movlw	(0)
	fcall	_setPA1
	line	1189
;main.c: 1189: setPA2(0);
	movlw	(0)
	fcall	_setPA2
	line	1191
;main.c: 1191: setPA3(0);
	movlw	(0)
	fcall	_setPA3
	goto	l4840
	line	1202
	
l4876:	
;main.c: 1201: {
;main.c: 1202: if(ucTimerDelay2 >= 1)
	movf	(main@ucTimerDelay2),w
	skipz
	goto	u2160
	goto	l4844
u2160:
	line	1204
	
l4878:	
;main.c: 1203: {
;main.c: 1204: ucTimerDelay2 = 0;
	clrf	(main@ucTimerDelay2)
	line	1206
;main.c: 1206: ucLoaderStep2 = 0;
	clrf	(main@ucLoaderStep2)
	goto	l4760
	line	1127
	
l4886:	
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
goto l748
movlw high(S5514)
movwf pclath
	clrc
	rlf fsr,w
	addlw low(S5514)
	movwf pc
psect	swtext3,local,class=CONST,delta=2
global __pswtext3
__pswtext3:
S5514:
	ljmp	l4832
	ljmp	l4836
	ljmp	l4846
	ljmp	l4856
	ljmp	l4866
	ljmp	l4876
psect	maintext

	line	1232
	
l4888:	
;main.c: 1230: {
;main.c: 1232: setPB0(1);
	movlw	(01h)
	fcall	_setPB0
	line	1234
;main.c: 1234: setPA0(1);
	movlw	(01h)
	fcall	_setPA0
	line	1236
;main.c: 1236: setPA1(1);
	movlw	(01h)
	fcall	_setPA1
	line	1237
	
l4890:	
;main.c: 1237: ucLoaderStep3++;
	incf	(main@ucLoaderStep3),f
	line	1238
;main.c: 1238: break;
	goto	l4560
	line	1243
	
l4892:	
;main.c: 1242: {
;main.c: 1243: if(ucTimerDelay3 >= 5)
	movlw	(05h)
	subwf	(main@ucTimerDelay3),w
	skipc
	goto	u2171
	goto	u2170
u2171:
	goto	l4900
u2170:
	line	1246
	
l4894:	
;main.c: 1244: {
;main.c: 1246: setPA2(1);
	movlw	(01h)
	fcall	_setPA2
	line	1247
	
l4896:	
;main.c: 1247: ucTimerDelay3 = 0;
	clrf	(main@ucTimerDelay3)
	goto	l4890
	line	1251
	
l4900:	
;main.c: 1250: else
;main.c: 1251: ucTimerDelay3++;
	incf	(main@ucTimerDelay3),f
	goto	l4560
	line	1257
	
l4902:	
;main.c: 1256: {
;main.c: 1257: if(ucTimerDelay3 >= 5)
	movlw	(05h)
	subwf	(main@ucTimerDelay3),w
	skipc
	goto	u2181
	goto	u2180
u2181:
	goto	l4900
u2180:
	line	1260
	
l4904:	
;main.c: 1258: {
;main.c: 1260: setPA3(1);
	movlw	(01h)
	fcall	_setPA3
	goto	l4896
	line	1272
	
l4912:	
;main.c: 1271: {
;main.c: 1272: if(ucTimerDelay3 >= 5)
	movlw	(05h)
	subwf	(main@ucTimerDelay3),w
	skipc
	goto	u2191
	goto	u2190
u2191:
	goto	l4900
u2190:
	line	1276
	
l4914:	
;main.c: 1273: {
;main.c: 1276: setPA2(0);
	movlw	(0)
	fcall	_setPA2
	line	1278
;main.c: 1278: setPA3(0);
	movlw	(0)
	fcall	_setPA3
	goto	l4896
	line	1289
	
l4922:	
;main.c: 1288: {
;main.c: 1289: if(ucTimerDelay3 >= 1)
	movf	(main@ucTimerDelay3),w
	skipz
	goto	u2200
	goto	l4900
u2200:
	line	1291
	
l4924:	
;main.c: 1290: {
;main.c: 1291: ucTimerDelay3 = 0;
	clrf	(main@ucTimerDelay3)
	line	1293
;main.c: 1293: ucLoaderStep3 = 0;
	clrf	(main@ucLoaderStep3)
	goto	l4760
	line	1227
	
l4932:	
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
	goto	l4888
	xorlw	1^0	; case 1
	skipnz
	goto	l4892
	xorlw	2^1	; case 2
	skipnz
	goto	l4902
	xorlw	3^2	; case 3
	skipnz
	goto	l4912
	xorlw	4^3	; case 4
	skipnz
	goto	l4922
	goto	l748
	opt asmopt_on

	line	1319
	
l4934:	
;main.c: 1317: {
;main.c: 1319: setPB0(1);
	movlw	(01h)
	fcall	_setPB0
	line	1321
;main.c: 1321: setPA0(1);
	movlw	(01h)
	fcall	_setPA0
	line	1323
;main.c: 1323: setPA1(1);
	movlw	(01h)
	fcall	_setPA1
	line	1325
;main.c: 1325: setPA2(1);
	movlw	(01h)
	fcall	_setPA2
	line	1326
	
l4936:	
;main.c: 1326: ucLoaderStep4++;
	incf	(main@ucLoaderStep4),f
	line	1327
;main.c: 1327: break;
	goto	l4560
	line	1332
	
l4938:	
;main.c: 1331: {
;main.c: 1332: if(ucTimerDelay4 >= 5)
	movlw	(05h)
	subwf	(main@ucTimerDelay4),w
	skipc
	goto	u2211
	goto	u2210
u2211:
	goto	l4946
u2210:
	line	1335
	
l4940:	
;main.c: 1333: {
;main.c: 1335: setPA3(1);
	movlw	(01h)
	fcall	_setPA3
	line	1336
	
l4942:	
;main.c: 1336: ucTimerDelay4 = 0;
	clrf	(main@ucTimerDelay4)
	goto	l4936
	line	1340
	
l4946:	
;main.c: 1339: else
;main.c: 1340: ucTimerDelay4++;
	incf	(main@ucTimerDelay4),f
	goto	l4560
	line	1346
	
l4948:	
;main.c: 1345: {
;main.c: 1346: if(ucTimerDelay4 >= 5)
	movlw	(05h)
	subwf	(main@ucTimerDelay4),w
	skipc
	goto	u2221
	goto	u2220
u2221:
	goto	l4946
u2220:
	line	1349
	
l4950:	
;main.c: 1347: {
;main.c: 1349: setPA3(0);
	movlw	(0)
	fcall	_setPA3
	goto	l4942
	line	1360
	
l4958:	
;main.c: 1359: {
;main.c: 1360: if(ucTimerDelay4 >= 1)
	movf	(main@ucTimerDelay4),w
	skipz
	goto	u2230
	goto	l4946
u2230:
	line	1362
	
l4960:	
;main.c: 1361: {
;main.c: 1362: ucTimerDelay4 = 0;
	clrf	(main@ucTimerDelay4)
	line	1364
;main.c: 1364: ucLoaderStep4 = 0;
	clrf	(main@ucLoaderStep4)
	goto	l4760
	line	1314
	
l4968:	
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
	goto	l4934
	xorlw	1^0	; case 1
	skipnz
	goto	l4938
	xorlw	2^1	; case 2
	skipnz
	goto	l4948
	xorlw	3^2	; case 3
	skipnz
	goto	l4958
	goto	l748
	opt asmopt_on

	line	862
	
l4972:	
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
	goto	l4766
	xorlw	1^0	; case 1
	skipnz
	goto	l4830
	xorlw	2^1	; case 2
	skipnz
	goto	l4886
	xorlw	3^2	; case 3
	skipnz
	goto	l4932
	xorlw	4^3	; case 4
	skipnz
	goto	l4968
	goto	l748
	opt asmopt_on

	line	1396
	
l4974:	
;main.c: 1388: {
;main.c: 1392: static unsigned char ucTimerDelayP2sLess = 0;
;main.c: 1394: static unsigned char ucTimerDelayP2sMore = 0;
;main.c: 1396: if( getAdOriginalCh1Value() <= 220 )
	fcall	_getAdOriginalCh1Value
	movlw	high(0DDh)
	subwf	(1+(?_getAdOriginalCh1Value)),w
	movlw	low(0DDh)
	skipnz
	subwf	(0+(?_getAdOriginalCh1Value)),w
	skipnc
	goto	u2241
	goto	u2240
u2241:
	goto	l4980
u2240:
	line	1398
	
l4976:	
;main.c: 1397: {
;main.c: 1398: ucTimerDelayP2sLess++;
	incf	(main@ucTimerDelayP2sLess),f
	line	1399
	
l4978:	
;main.c: 1399: ucTimerDelayP2sMore = 0;
	clrf	(main@ucTimerDelayP2sMore)
	line	1400
;main.c: 1400: }
	goto	l4984
	line	1403
	
l4980:	
;main.c: 1401: else
;main.c: 1402: {
;main.c: 1403: ucTimerDelayP2sMore++;
	incf	(main@ucTimerDelayP2sMore),f
	line	1404
	
l4982:	
;main.c: 1404: ucTimerDelayP2sLess = 0;
	clrf	(main@ucTimerDelayP2sLess)
	line	1407
	
l4984:	
;main.c: 1405: }
;main.c: 1407: if( ucTimerDelayP2sLess >= 2)
	movlw	(02h)
	subwf	(main@ucTimerDelayP2sLess),w
	skipc
	goto	u2251
	goto	u2250
u2251:
	goto	l4992
u2250:
	line	1409
	
l4986:	
;main.c: 1408: {
;main.c: 1409: ucTimerDelayP2sLess = 0;
	clrf	(main@ucTimerDelayP2sLess)
	line	1410
;main.c: 1410: ucTimerDelayP2sMore = 0;
	clrf	(main@ucTimerDelayP2sMore)
	line	1412
	
l4988:	
;main.c: 1412: startTwentySecondsTimer();
	fcall	_startTwentySecondsTimer
	line	1414
	
l4990:	
;main.c: 1414: ucADC4_Step = ADC4_STEP_FOURTH_PREFIX1;
	movlw	(04h)
	bcf	status, 5	;RP0=0, select bank0
	movwf	(main@ucADC4_Step)
	line	1417
	
l4992:	
;main.c: 1415: }
;main.c: 1417: if(ucTimerDelayP2sMore >= 2)
	movlw	(02h)
	subwf	(main@ucTimerDelayP2sMore),w
	skipc
	goto	u2261
	goto	u2260
u2261:
	goto	l748
u2260:
	line	1419
	
l4994:	
;main.c: 1418: {
;main.c: 1419: ucTimerDelayP2sMore = 0;
	clrf	(main@ucTimerDelayP2sMore)
	line	1420
;main.c: 1420: ucTimerDelayP2sLess = 0;
	clrf	(main@ucTimerDelayP2sLess)
	line	1421
	
l4996:	
;main.c: 1421: ucADC4_Step = ADC4_STEP_FOURTH_PREFIX2;
	movlw	(05h)
	bcf	status, 5	;RP0=0, select bank0
	movwf	(main@ucADC4_Step)
	goto	l4560
	line	1433
	
l4998:	
;main.c: 1429: {
;main.c: 1433: if( !isFinishedTwentySecondsTimer() )
	fcall	_isFinishedTwentySecondsTimer
	iorlw	0
	skipz
	goto	u2271
	goto	u2270
u2271:
	goto	l5002
u2270:
	goto	l4996
	line	1436
	
l5002:	
;main.c: 1435: else
;main.c: 1436: ucADC4_Step = ADC4_STEP_FOURTH_PREFIX3;
	movlw	(06h)
	bcf	status, 5	;RP0=0, select bank0
	movwf	(main@ucADC4_Step)
	goto	l4560
	line	1451
	
l5004:	
;main.c: 1443: {
;main.c: 1447: static unsigned char ucTimerForDACR0_CNT1 = 0, ucTimerForDACR0_CNT2 = 0;
;main.c: 1449: static unsigned char ucTimerForDACR0_CNT1_f = 0, ucTimerForDACR0_CNT2_f = 0;
;main.c: 1451: if((getAdOriginalCh14Value() > 2800))
	fcall	_getAdOriginalCh14Value
	movlw	high(0AF1h)
	subwf	(1+(?_getAdOriginalCh14Value)),w
	movlw	low(0AF1h)
	skipnz
	subwf	(0+(?_getAdOriginalCh14Value)),w
	skipc
	goto	u2281
	goto	u2280
u2281:
	goto	l5010
u2280:
	line	1453
	
l5006:	
;main.c: 1452: {
;main.c: 1453: ucTimerForDACR0_CNT1++;
	incf	(main@ucTimerForDACR0_CNT1),f
	line	1454
	
l5008:	
;main.c: 1454: ucTimerForDACR0_CNT2 = 0;
	clrf	(main@ucTimerForDACR0_CNT2)
	line	1455
;main.c: 1455: }
	goto	l5014
	line	1458
	
l5010:	
;main.c: 1456: else
;main.c: 1457: {
;main.c: 1458: ucTimerForDACR0_CNT2++;
	incf	(main@ucTimerForDACR0_CNT2),f
	line	1459
	
l5012:	
;main.c: 1459: ucTimerForDACR0_CNT1 = 0;
	clrf	(main@ucTimerForDACR0_CNT1)
	line	1462
	
l5014:	
;main.c: 1460: }
;main.c: 1462: if(ucTimerForDACR0_CNT1 >= 2)
	movlw	(02h)
	subwf	(main@ucTimerForDACR0_CNT1),w
	skipc
	goto	u2291
	goto	u2290
u2291:
	goto	l5018
u2290:
	line	1463
	
l5016:	
;main.c: 1463: ucTimerForDACR0_CNT1_f = 1;
	clrf	(main@ucTimerForDACR0_CNT1_f)
	incf	(main@ucTimerForDACR0_CNT1_f),f
	line	1465
	
l5018:	
;main.c: 1465: if(ucTimerForDACR0_CNT2 >= 2)
	movlw	(02h)
	subwf	(main@ucTimerForDACR0_CNT2),w
	skipc
	goto	u2301
	goto	u2300
u2301:
	goto	l5022
u2300:
	line	1466
	
l5020:	
;main.c: 1466: ucTimerForDACR0_CNT2_f = 1;
	clrf	(main@ucTimerForDACR0_CNT2_f)
	incf	(main@ucTimerForDACR0_CNT2_f),f
	line	1468
	
l5022:	
;main.c: 1468: if(ucTimerForDACR0_CNT1_f)
	movf	(main@ucTimerForDACR0_CNT1_f),w
	skipz
	goto	u2310
	goto	l5026
u2310:
	line	1471
	
l5024:	
;main.c: 1469: {
;main.c: 1471: DACR0=0x0F;
	movlw	(0Fh)
	bsf	status, 5	;RP0=1, select bank1
	movwf	(136)^080h	;volatile
	line	1475
;main.c: 1475: ucADC4_Step = ADC4_STEP_FOURTH;
	movlw	(0Ah)
	bcf	status, 5	;RP0=0, select bank0
	movwf	(main@ucADC4_Step)
	line	1476
;main.c: 1476: }
	goto	l5030
	line	1477
	
l5026:	
;main.c: 1477: else if(ucTimerForDACR0_CNT2_f)
	movf	(main@ucTimerForDACR0_CNT2_f),w
	skipz
	goto	u2320
	goto	l5030
u2320:
	line	1480
	
l5028:	
;main.c: 1478: {
;main.c: 1480: DACR0=0x09;
	movlw	(09h)
	bsf	status, 5	;RP0=1, select bank1
	movwf	(136)^080h	;volatile
	line	1484
;main.c: 1484: ucADC4_Step = ADC4_STEP_FOURTH;
	movlw	(0Ah)
	bcf	status, 5	;RP0=0, select bank0
	movwf	(main@ucADC4_Step)
	line	1491
;main.c: 1485: }
	
l5030:	
;main.c: 1489: }
;main.c: 1491: if(ADC4_STEP_FOURTH == ucADC4_Step)
	movf	(main@ucADC4_Step),w
	xorlw	0Ah
	skipz
	goto	u2331
	goto	u2330
u2331:
	goto	l748
u2330:
	line	1493
	
l5032:	
;main.c: 1492: {
;main.c: 1493: ucTimerForDACR0_CNT1 = 0;
	clrf	(main@ucTimerForDACR0_CNT1)
	line	1494
;main.c: 1494: ucTimerForDACR0_CNT2 = 0;
	clrf	(main@ucTimerForDACR0_CNT2)
	line	1495
;main.c: 1495: ucTimerForDACR0_CNT1_f = 0;
	clrf	(main@ucTimerForDACR0_CNT1_f)
	line	1496
;main.c: 1496: ucTimerForDACR0_CNT2_f = 0;
	clrf	(main@ucTimerForDACR0_CNT2_f)
	goto	l4560
	line	1508
	
l5034:	
;main.c: 1504: {
;main.c: 1508: clearTwentySecondsTimer();
	fcall	_clearTwentySecondsTimer
	line	1510
	
l5036:	
;main.c: 1510: setPA6(0);
	movlw	(0)
	fcall	_setPA6
	line	1512
	
l5038:	
;main.c: 1512: PBOD6 = 0;
	bsf	status, 5	;RP0=1, select bank3
	bsf	status, 6	;RP1=1, select bank3
	bcf	(3142/8)^0180h,(3142)&7
	line	1513
	
l5040:	
;main.c: 1513: PB6 = 1;
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	bsf	(54/8),(54)&7
	line	1518
;main.c: 1518: ucADC4_Step = ADC4_STEP_FOURTH_PREFIX4;
	movlw	(07h)
	movwf	(main@ucADC4_Step)
	line	1519
;main.c: 1519: break;
	goto	l4560
	line	1532
	
l5042:	
;main.c: 1525: {
;main.c: 1530: static unsigned char ucDelayPrefix4TimerP5s;
;main.c: 1532: ucDelayPrefix4TimerP5s++;
	incf	(main@ucDelayPrefix4TimerP5s),f
	line	1534
	
l5044:	
;main.c: 1534: if( ucDelayPrefix4TimerP5s >= 5)
	movlw	(05h)
	subwf	(main@ucDelayPrefix4TimerP5s),w
	skipc
	goto	u2341
	goto	u2340
u2341:
	goto	l748
u2340:
	line	1536
	
l5046:	
;main.c: 1535: {
;main.c: 1536: ucDelayPrefix4TimerP5s = 0;
	clrf	(main@ucDelayPrefix4TimerP5s)
	line	1538
	
l5048:	
;main.c: 1538: ucADC4_Step = ADC4_STEP_FOURTH_PREFIX5;
	movlw	(08h)
	movwf	(main@ucADC4_Step)
	goto	l4560
	line	1543
;main.c: 1541: }
;main.c: 1543: case ADC4_STEP_FOURTH_PREFIX5:
	
l977:	
	line	1550
;main.c: 1544: {
;main.c: 1550: PBOD6 = 1;
	bsf	status, 5	;RP0=1, select bank3
	bsf	status, 6	;RP1=1, select bank3
	bsf	(3142/8)^0180h,(3142)&7
	line	1551
;main.c: 1551: PB6 = 1;
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	bsf	(54/8),(54)&7
	line	1556
	
l5050:	
;main.c: 1556: ucADC4_Step = ADC4_STEP_FOURTH_PREFIX6;
	movlw	(09h)
	movwf	(main@ucADC4_Step)
	line	1558
;main.c: 1558: break;
	goto	l4560
	line	1566
	
l5052:	
;main.c: 1563: {
;main.c: 1564: static unsigned char ucDelayPrefix6TimerP2s;
;main.c: 1566: ucDelayPrefix6TimerP2s++;
	incf	(main@ucDelayPrefix6TimerP2s),f
	line	1568
	
l5054:	
;main.c: 1568: if( ucDelayPrefix6TimerP2s >= 2)
	movlw	(02h)
	subwf	(main@ucDelayPrefix6TimerP2s),w
	skipc
	goto	u2351
	goto	u2350
u2351:
	goto	l748
u2350:
	line	1570
	
l5056:	
;main.c: 1569: {
;main.c: 1570: ucDelayPrefix6TimerP2s = 0;
	clrf	(main@ucDelayPrefix6TimerP2s)
	line	1572
;main.c: 1572: ucADC4_Step = ADC4_STEP_INIT;
	clrf	(main@ucADC4_Step)
	goto	l4578
	line	1589
	
l5060:	
;main.c: 1581: {
;main.c: 1585: static unsigned char ucCheckTimerP2sLess = 0;
;main.c: 1587: static unsigned char ucCheckTimerP2sMore = 0;
;main.c: 1589: if( getAdOriginalCh1Value() < 85)
	fcall	_getAdOriginalCh1Value
	movlw	high(055h)
	subwf	(1+(?_getAdOriginalCh1Value)),w
	movlw	low(055h)
	skipnz
	subwf	(0+(?_getAdOriginalCh1Value)),w
	skipnc
	goto	u2361
	goto	u2360
u2361:
	goto	l5066
u2360:
	line	1591
	
l5062:	
;main.c: 1590: {
;main.c: 1591: ucCheckTimerP2sLess++;
	bsf	status, 5	;RP0=1, select bank1
	incf	(main@ucCheckTimerP2sLess)^080h,f
	line	1592
	
l5064:	
;main.c: 1592: ucCheckTimerP2sMore = 0;
	clrf	(main@ucCheckTimerP2sMore)^080h
	line	1593
;main.c: 1593: }
	goto	l5070
	line	1596
	
l5066:	
;main.c: 1594: else
;main.c: 1595: {
;main.c: 1596: ucCheckTimerP2sMore++;
	bsf	status, 5	;RP0=1, select bank1
	incf	(main@ucCheckTimerP2sMore)^080h,f
	line	1597
	
l5068:	
;main.c: 1597: ucCheckTimerP2sLess = 0;
	clrf	(main@ucCheckTimerP2sLess)^080h
	line	1600
	
l5070:	
;main.c: 1598: }
;main.c: 1600: if( ucCheckTimerP2sMore > 2)
	movlw	(03h)
	subwf	(main@ucCheckTimerP2sMore)^080h,w
	skipc
	goto	u2371
	goto	u2370
u2371:
	goto	l5076
u2370:
	line	1602
	
l5072:	
;main.c: 1601: {
;main.c: 1602: ucCheckTimerP2sMore = 0;
	clrf	(main@ucCheckTimerP2sMore)^080h
	line	1603
;main.c: 1603: ucCheckTimerP2sLess = 0;
	clrf	(main@ucCheckTimerP2sLess)^080h
	line	1605
;main.c: 1605: ucADC4_Step = ADC4_STEP_INIT;
	bcf	status, 5	;RP0=0, select bank0
	clrf	(main@ucADC4_Step)
	line	1607
	
l5074:	
;main.c: 1607: enumMainLoopStep = MAIN_LOOP_STEP_THIRD;
	movlw	(03h)
	movwf	(main@enumMainLoopStep)
	line	1610
	
l5076:	
;main.c: 1608: }
;main.c: 1610: if( ucCheckTimerP2sLess > 2)
	movlw	(03h)
	bsf	status, 5	;RP0=1, select bank1
	subwf	(main@ucCheckTimerP2sLess)^080h,w
	skipc
	goto	u2381
	goto	u2380
u2381:
	goto	l748
u2380:
	line	1612
	
l5078:	
;main.c: 1611: {
;main.c: 1612: ucCheckTimerP2sMore = 0;
	clrf	(main@ucCheckTimerP2sMore)^080h
	line	1613
;main.c: 1613: ucCheckTimerP2sLess = 0;
	clrf	(main@ucCheckTimerP2sLess)^080h
	line	1615
	
l5080:	
;main.c: 1615: ucADC4_Step = ADC4_STEP_FOURTH_SUFFIX1;
	movlw	(0Bh)
	bcf	status, 5	;RP0=0, select bank0
	movwf	(main@ucADC4_Step)
	goto	l4560
	line	1630
	
l5082:	
;main.c: 1624: {
;main.c: 1628: static unsigned char ucFourthSuffix1TimerP3s = 0;
;main.c: 1630: ucFourthSuffix1TimerP3s++;
	bsf	status, 5	;RP0=1, select bank1
	incf	(main@ucFourthSuffix1TimerP3s)^080h,f
	line	1632
	
l5084:	
;main.c: 1632: if( ucFourthSuffix1TimerP3s > 3)
	movlw	(04h)
	subwf	(main@ucFourthSuffix1TimerP3s)^080h,w
	skipc
	goto	u2391
	goto	u2390
u2391:
	goto	l748
u2390:
	line	1634
	
l5086:	
;main.c: 1633: {
;main.c: 1634: ucFourthSuffix1TimerP3s = 0;
	clrf	(main@ucFourthSuffix1TimerP3s)^080h
	line	1635
	
l5088:	
;main.c: 1635: ucADC4_Step = ADC4_STEP_FOURTH_SUFFIX2;
	movlw	(0Ch)
	bcf	status, 5	;RP0=0, select bank0
	movwf	(main@ucADC4_Step)
	goto	l4560
	line	1647
	
l5090:	
;main.c: 1642: {
;main.c: 1647: setPA6(0);
	movlw	(0)
	fcall	_setPA6
	line	1649
	
l5092:	
;main.c: 1649: clearPinPortAndTimer();
	fcall	_clearPinPortAndTimer
	line	1650
	
l5094:	
;main.c: 1650: ucADC4_Step = ADC4_STEP_INIT;
	clrf	(main@ucADC4_Step)
	goto	l4578
	line	775
	
l5100:	
	bcf	status, 5	;RP0=0, select bank0
	movf	(main@ucADC4_Step),w
	; Switch size 1, requested type "space"
; Number of cases is 13, Range of values is 0 to 12
; switch strategies available:
; Name         Instructions Cycles
; direct_byte           33     7 (fixed)
; simple_byte           40    21 (average)
; jumptable            260     6 (fixed)
; rangetable            17     6 (fixed)
; spacedrange           32     9 (fixed)
; locatedrange          13     3 (fixed)
;	Chosen strategy is direct_byte

	movwf fsr
	movlw	13
	subwf	fsr,w
skipnc
goto l748
movlw high(S5516)
movwf pclath
	clrc
	rlf fsr,w
	addlw low(S5516)
	movwf pc
psect	swtext4,local,class=CONST,delta=2
global __pswtext4
__pswtext4:
S5516:
	ljmp	l790
	ljmp	l4654
	ljmp	l4972
	ljmp	l4974
	ljmp	l4998
	ljmp	l5004
	ljmp	l5034
	ljmp	l5042
	ljmp	l977
	ljmp	l5052
	ljmp	l5060
	ljmp	l5082
	ljmp	l5090
psect	maintext

	line	1680
;main.c: 1679: {
;main.c: 1680: case HOUR_3_BRANCH_STEP_FIRST:
	
l1001:	
	line	1683
;main.c: 1681: {
;main.c: 1683: PB7 = 1;
	bcf	status, 5	;RP0=0, select bank0
	bsf	(55/8),(55)&7
	line	1684
;main.c: 1684: PBOD7 = 1;
	bsf	status, 5	;RP0=1, select bank3
	bsf	status, 6	;RP1=1, select bank3
	bsf	(3143/8)^0180h,(3143)&7
	line	1689
	
l5102:	
;main.c: 1689: startThreeHoursTimer(10800);
	movlw	low(02A30h)
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	movwf	(?_startThreeHoursTimer)
	movlw	high(02A30h)
	movwf	((?_startThreeHoursTimer))+1
	fcall	_startThreeHoursTimer
	line	1692
;main.c: 1692: setPB0(1);
	movlw	(01h)
	fcall	_setPB0
	line	1694
;main.c: 1694: setPA0(1);
	movlw	(01h)
	fcall	_setPA0
	line	1696
;main.c: 1696: setPA1(1);
	movlw	(01h)
	fcall	_setPA1
	line	1698
;main.c: 1698: setPA2(1);
	movlw	(01h)
	fcall	_setPA2
	line	1700
;main.c: 1700: setPA3(1);
	movlw	(01h)
	fcall	_setPA3
	line	1702
	
l5104:	
;main.c: 1702: enumBranchStep = HOUR_3_BRANCH_STEP_SECOND;
	bsf	status, 5	;RP0=1, select bank1
	clrf	(main@enumBranchStep)^080h
	incf	(main@enumBranchStep)^080h,f
	line	1703
;main.c: 1703: break;
	goto	l4560
	line	1713
	
l5106:	
;main.c: 1707: {
;main.c: 1711: static unsigned char ucTimer20s = 0;
;main.c: 1713: if(ucTimer20s < 200)
	movlw	(0C8h)
	subwf	(main@ucTimer20s)^080h,w
	skipnc
	goto	u2401
	goto	u2400
u2401:
	goto	l5110
u2400:
	line	1715
	
l5108:	
;main.c: 1714: {
;main.c: 1715: ucTimer20s++;
	incf	(main@ucTimer20s)^080h,f
	line	1717
;main.c: 1717: }
	goto	l4560
	line	1721
	
l5110:	
;main.c: 1718: else
;main.c: 1719: {
;main.c: 1721: ucTimer20s = 0;
	clrf	(main@ucTimer20s)^080h
	line	1723
	
l5112:	
;main.c: 1723: enumBranchStep = HOUR_3_BRANCH_STEP_THIRD;
	movlw	(02h)
	movwf	(main@enumBranchStep)^080h
	line	1726
	
l5114:	
;main.c: 1726: setPA6(0);
	movlw	(0)
	fcall	_setPA6
	goto	l4560
	line	1736
	
l5116:	
;main.c: 1732: {
;main.c: 1736: if( (isFinishedTwelveHoursTimer()) || (isFinishedThreeHoursTimer()))
	fcall	_isFinishedTwelveHoursTimer
	iorlw	0
	skipz
	goto	u2411
	goto	u2410
u2411:
	goto	l5120
u2410:
	
l5118:	
	fcall	_isFinishedThreeHoursTimer
	xorlw	0
	skipnz
	goto	u2421
	goto	u2420
u2421:
	goto	l5124
u2420:
	line	1738
	
l5120:	
;main.c: 1737: {
;main.c: 1738: enumBranchStep = HOUR_3_BRANCH_STEP_FIRST;
	bsf	status, 5	;RP0=1, select bank1
	clrf	(main@enumBranchStep)^080h
	line	1739
	
l5122:	
;main.c: 1739: enumMainLoopStep = MAIN_LOOP_STEP_12_HOUR_END;
	movlw	(09h)
	bcf	status, 5	;RP0=0, select bank0
	movwf	(main@enumMainLoopStep)
	line	1740
;main.c: 1740: }
	goto	l4560
	line	1747
	
l5124:	
;main.c: 1741: else
;main.c: 1742: {
;main.c: 1743: static unsigned char ucTimerX1P5s = 0;
;main.c: 1745: static unsigned char ucTimerLessX1P5s = 0;
;main.c: 1747: if(getAdOriginalCh1Value() < 115)
	fcall	_getAdOriginalCh1Value
	movlw	high(073h)
	subwf	(1+(?_getAdOriginalCh1Value)),w
	movlw	low(073h)
	skipnz
	subwf	(0+(?_getAdOriginalCh1Value)),w
	skipnc
	goto	u2431
	goto	u2430
u2431:
	goto	l5130
u2430:
	line	1749
	
l5126:	
;main.c: 1748: {
;main.c: 1749: ucTimerX1P5s = 0;
	bsf	status, 5	;RP0=1, select bank1
	clrf	(main@ucTimerX1P5s)^080h
	line	1750
	
l5128:	
;main.c: 1750: ucTimerLessX1P5s++;
	incf	(main@ucTimerLessX1P5s)^080h,f
	line	1751
;main.c: 1751: }
	goto	l5134
	line	1754
	
l5130:	
;main.c: 1752: else
;main.c: 1753: {
;main.c: 1754: ucTimerX1P5s++;
	bsf	status, 5	;RP0=1, select bank1
	incf	(main@ucTimerX1P5s)^080h,f
	line	1755
	
l5132:	
;main.c: 1755: ucTimerLessX1P5s = 0;
	clrf	(main@ucTimerLessX1P5s)^080h
	line	1758
	
l5134:	
;main.c: 1756: }
;main.c: 1758: if(ucTimerX1P5s >= 5)
	movlw	(05h)
	subwf	(main@ucTimerX1P5s)^080h,w
	skipc
	goto	u2441
	goto	u2440
u2441:
	goto	l5148
u2440:
	line	1760
	
l5136:	
;main.c: 1759: {
;main.c: 1760: ucTimerX1P5s = 0;
	clrf	(main@ucTimerX1P5s)^080h
	line	1764
	
l5138:	
;main.c: 1764: PBOD7 = 0;
	bsf	status, 6	;RP1=1, select bank3
	bcf	(3143/8)^0180h,(3143)&7
	line	1765
	
l5140:	
;main.c: 1765: PB7 = 0;
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	bcf	(55/8),(55)&7
	line	1770
	
l5142:	
;main.c: 1770: clearThreeHoursTimer();
	fcall	_clearThreeHoursTimer
	line	1772
	
l5144:	
;main.c: 1772: enumBranchStep = HOUR_3_BRANCH_STEP_FIRST;
	bsf	status, 5	;RP0=1, select bank1
	clrf	(main@enumBranchStep)^080h
	line	1774
	
l5146:	
;main.c: 1774: enumMainLoopStep = MAIN_LOOP_STEP_SECOND;
	movlw	(02h)
	bcf	status, 5	;RP0=0, select bank0
	movwf	(main@enumMainLoopStep)
	line	1775
;main.c: 1775: }
	goto	l4560
	line	1776
	
l5148:	
;main.c: 1776: else if(ucTimerLessX1P5s >= 5)
	movlw	(05h)
	subwf	(main@ucTimerLessX1P5s)^080h,w
	skipc
	goto	u2451
	goto	u2450
u2451:
	goto	l748
u2450:
	line	1782
	
l5150:	
;main.c: 1777: {
;main.c: 1778: static unsigned char ucTimerX2P5s = 0;
;main.c: 1780: static unsigned char ucTimerLessX2P5s = 0;
;main.c: 1782: if(getAdOriginalCh14Value() >= 1950)
	fcall	_getAdOriginalCh14Value
	movlw	high(079Eh)
	subwf	(1+(?_getAdOriginalCh14Value)),w
	movlw	low(079Eh)
	skipnz
	subwf	(0+(?_getAdOriginalCh14Value)),w
	skipc
	goto	u2461
	goto	u2460
u2461:
	goto	l5156
u2460:
	line	1784
	
l5152:	
;main.c: 1783: {
;main.c: 1784: ucTimerX2P5s++;
	bsf	status, 5	;RP0=1, select bank1
	incf	(main@ucTimerX2P5s)^080h,f
	line	1785
	
l5154:	
;main.c: 1785: ucTimerLessX2P5s = 0;
	clrf	(main@ucTimerLessX2P5s)^080h
	line	1786
;main.c: 1786: }
	goto	l5160
	line	1789
	
l5156:	
;main.c: 1787: else
;main.c: 1788: {
;main.c: 1789: ucTimerX2P5s = 0;
	bsf	status, 5	;RP0=1, select bank1
	clrf	(main@ucTimerX2P5s)^080h
	line	1790
	
l5158:	
;main.c: 1790: ucTimerLessX2P5s++;
	incf	(main@ucTimerLessX2P5s)^080h,f
	line	1793
	
l5160:	
;main.c: 1791: }
;main.c: 1793: if(ucTimerX2P5s >= 5)
	movlw	(05h)
	subwf	(main@ucTimerX2P5s)^080h,w
	skipc
	goto	u2471
	goto	u2470
u2471:
	goto	l5164
u2470:
	line	1795
	
l5162:	
;main.c: 1794: {
;main.c: 1795: ucTimerX2P5s = 0;
	clrf	(main@ucTimerX2P5s)^080h
	line	1796
;main.c: 1796: }
	goto	l4560
	line	1797
	
l5164:	
;main.c: 1797: else if(ucTimerLessX2P5s >= 5)
	movlw	(05h)
	subwf	(main@ucTimerLessX2P5s)^080h,w
	skipc
	goto	u2481
	goto	u2480
u2481:
	goto	l748
u2480:
	line	1799
	
l5166:	
;main.c: 1798: {
;main.c: 1799: clearPinPortAndTimer();
	fcall	_clearPinPortAndTimer
	line	1800
	
l5168:	
;main.c: 1800: enumMainLoopStep = MAIN_LOOP_STEP_FIRST;
	clrf	(main@enumMainLoopStep)
	incf	(main@enumMainLoopStep),f
	line	1801
	
l5170:	
;main.c: 1801: enumBranchStep = HOUR_3_BRANCH_STEP_FIRST;
	bsf	status, 5	;RP0=1, select bank1
	clrf	(main@enumBranchStep)^080h
	line	1802
;main.c: 1802: }
	goto	l4560
	line	1678
	
l5174:	
	bsf	status, 5	;RP0=1, select bank1
	movf	(main@enumBranchStep)^080h,w
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
	goto	l1001
	xorlw	1^0	; case 1
	skipnz
	goto	l5106
	xorlw	2^1	; case 2
	skipnz
	goto	l5116
	goto	l748
	opt asmopt_on

	line	1848
	
l5176:	
;main.c: 1843: {
;main.c: 1848: setPB0(0);
	movlw	(0)
	fcall	_setPB0
	line	1850
;main.c: 1850: setPB1(0);
	movlw	(0)
	fcall	_setPB1
	line	1852
;main.c: 1852: setPA0(0);
	movlw	(0)
	fcall	_setPA0
	line	1854
;main.c: 1854: setPA1(0);
	movlw	(0)
	fcall	_setPA1
	line	1856
;main.c: 1856: setPA2(0);
	movlw	(0)
	fcall	_setPA2
	line	1858
;main.c: 1858: setPA3(0);
	movlw	(0)
	fcall	_setPA3
	line	1861
	
l5178:	
;main.c: 1861: PBOD6 = 0;
	bsf	status, 5	;RP0=1, select bank3
	bsf	status, 6	;RP1=1, select bank3
	bcf	(3142/8)^0180h,(3142)&7
	line	1862
	
l5180:	
;main.c: 1862: PB6 = 1;
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	bsf	(54/8),(54)&7
	line	1868
;main.c: 1868: setPA6(0);
	movlw	(0)
	fcall	_setPA6
	line	1870
	
l5182:	
;main.c: 1870: enumInteralStep = INTERNAL_SECOND_STEP;
	bsf	status, 5	;RP0=1, select bank1
	clrf	(main@enumInteralStep)^080h
	incf	(main@enumInteralStep)^080h,f
	line	1871
;main.c: 1871: break;
	goto	l4560
	line	1881
	
l5184:	
;main.c: 1875: {
;main.c: 1879: static unsigned char ucTimer1s = 0;
;main.c: 1881: if(getAdOriginalCh14Value() <= 1000)
	fcall	_getAdOriginalCh14Value
	movlw	high(03E9h)
	subwf	(1+(?_getAdOriginalCh14Value)),w
	movlw	low(03E9h)
	skipnz
	subwf	(0+(?_getAdOriginalCh14Value)),w
	skipnc
	goto	u2491
	goto	u2490
u2491:
	goto	l5188
u2490:
	line	1883
	
l5186:	
;main.c: 1882: {
;main.c: 1883: ucTimer1s++;
	bsf	status, 5	;RP0=1, select bank1
	incf	(main@ucTimer1s)^080h,f
	line	1884
;main.c: 1884: }
	goto	l5190
	line	1886
	
l5188:	
;main.c: 1885: else
;main.c: 1886: ucTimer1s = 0;
	bsf	status, 5	;RP0=1, select bank1
	clrf	(main@ucTimer1s)^080h
	line	1888
	
l5190:	
;main.c: 1888: if(ucTimer1s >= 10)
	movlw	(0Ah)
	subwf	(main@ucTimer1s)^080h,w
	skipc
	goto	u2501
	goto	u2500
u2501:
	goto	l748
u2500:
	line	1890
	
l5192:	
;main.c: 1889: {
;main.c: 1890: enumInteralStep = INTERNAL_THIRD_STEP;
	movlw	(02h)
	movwf	(main@enumInteralStep)^080h
	line	1891
	
l5194:	
;main.c: 1891: ucTimer1s = 0;
	clrf	(main@ucTimer1s)^080h
	goto	l4560
	line	1903
	
l5196:	
;main.c: 1897: {
;main.c: 1901: static unsigned char ucTimerP3s = 0;
;main.c: 1903: if(getAdOriginalCh14Value() >= 1950)
	fcall	_getAdOriginalCh14Value
	movlw	high(079Eh)
	subwf	(1+(?_getAdOriginalCh14Value)),w
	movlw	low(079Eh)
	skipnz
	subwf	(0+(?_getAdOriginalCh14Value)),w
	skipc
	goto	u2511
	goto	u2510
u2511:
	goto	l5200
u2510:
	line	1905
	
l5198:	
;main.c: 1904: {
;main.c: 1905: ucTimerP3s++;
	bsf	status, 5	;RP0=1, select bank1
	incf	(main@ucTimerP3s)^080h,f
	line	1906
;main.c: 1906: }
	goto	l5202
	line	1908
	
l5200:	
;main.c: 1907: else
;main.c: 1908: ucTimerP3s = 0;
	bsf	status, 5	;RP0=1, select bank1
	clrf	(main@ucTimerP3s)^080h
	line	1910
	
l5202:	
;main.c: 1910: if(ucTimerP3s >= 3)
	movlw	(03h)
	subwf	(main@ucTimerP3s)^080h,w
	skipc
	goto	u2521
	goto	u2520
u2521:
	goto	l748
u2520:
	line	1912
	
l5204:	
;main.c: 1911: {
;main.c: 1912: enumInteralStep = INTERNAL_FIRST_STEP;
	clrf	(main@enumInteralStep)^080h
	line	1913
;main.c: 1913: ucTimerP3s = 0;
	clrf	(main@ucTimerP3s)^080h
	line	1915
	
l5206:	
;main.c: 1915: clearAllTimer();
	fcall	_clearAllTimer
	line	1917
	
l5208:	
;main.c: 1917: DACR0=0x0F;
	movlw	(0Fh)
	bsf	status, 5	;RP0=1, select bank1
	movwf	(136)^080h	;volatile
	line	1921
	
l5210:	
;main.c: 1921: initPin();
	fcall	_initPin
	line	1924
	
l5212:	
;main.c: 1924: enumMainLoopStep = MAIN_LOOP_STEP_INIT;
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	clrf	(main@enumMainLoopStep)
	line	1926
	
l1053:	
	goto	l1053
	line	1840
	
l5216:	
	bsf	status, 5	;RP0=1, select bank1
	movf	(main@enumInteralStep)^080h,w
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
	goto	l5176
	xorlw	1^0	; case 1
	skipnz
	goto	l5184
	xorlw	2^1	; case 2
	skipnz
	goto	l5196
	goto	l748
	opt asmopt_on

	line	596
	
l5220:	
	bcf	status, 5	;RP0=0, select bank0
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
	goto	l4568
	xorlw	1^0	; case 1
	skipnz
	goto	l4580
	xorlw	2^1	; case 2
	skipnz
	goto	l4594
	xorlw	3^2	; case 3
	skipnz
	goto	l4604
	xorlw	4^3	; case 4
	skipnz
	goto	l4640
	xorlw	5^4	; case 5
	skipnz
	goto	l4646
	xorlw	8^5	; case 8
	skipnz
	goto	l5174
	xorlw	9^8	; case 9
	skipnz
	goto	l5216
	goto	l748
	opt asmopt_on

	global	start
	ljmp	start
	opt stack 0
psect	maintext
	line	1949
GLOBAL	__end_of_main
	__end_of_main:
;; =============== function _main ends ============

	signat	_main,88
	global	_process_AD_Converter_Value
psect	text796,local,class=CODE,delta=2
global __ptext796
__ptext796:

;; *************** function _process_AD_Converter_Value *****************
;; Defined at:
;;		line 280 in file "C:\temp\dev\AK7030-OTP\common.c"
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
;;      Temps:          0       0       0       0       0
;;      Totals:         0       0       0       0       0
;;Total ram usage:        0 bytes
;; Hardware stack levels used:    1
;; Hardware stack levels required when called:    4
;; This function calls:
;;		_getAD_ConvertFlag
;;		_setAD_ConvertFlag
;;		_AD_Sample
;;		_adc_start
;; This function is called by:
;;		_main
;; This function uses a non-reentrant model
;;
psect	text796
	file	"C:\temp\dev\AK7030-OTP\common.c"
	line	280
	global	__size_of_process_AD_Converter_Value
	__size_of_process_AD_Converter_Value	equ	__end_of_process_AD_Converter_Value-_process_AD_Converter_Value
	
_process_AD_Converter_Value:	
	opt	stack 3
; Regs used in _process_AD_Converter_Value: [wreg+status,2+status,0+pclath+cstack]
	line	281
	
l4536:	
;common.c: 281: if(getAD_ConvertFlag())
	fcall	_getAD_ConvertFlag
	xorlw	0
	skipnz
	goto	u1731
	goto	u1730
u1731:
	goto	l1798
u1730:
	line	283
	
l4538:	
;common.c: 282: {
;common.c: 283: setAD_ConvertFlag(0);
	movlw	(0)
	fcall	_setAD_ConvertFlag
	line	284
;common.c: 284: AD_Sample();
	fcall	_AD_Sample
	line	296
	
l4540:	
;common.c: 296: adc_start();
	fcall	_adc_start
	line	298
	
l1798:	
	return
	opt stack 0
GLOBAL	__end_of_process_AD_Converter_Value
	__end_of_process_AD_Converter_Value:
;; =============== function _process_AD_Converter_Value ends ============

	signat	_process_AD_Converter_Value,88
	global	_clearPinPortAndTimer
psect	text797,local,class=CODE,delta=2
global __ptext797
__ptext797:

;; *************** function _clearPinPortAndTimer *****************
;; Defined at:
;;		line 104 in file "C:\temp\dev\AK7030-OTP\main.c"
;; Parameters:    Size  Location     Type
;;		None
;; Auto vars:     Size  Location     Type
;;		None
;; Return value:  Size  Location     Type
;;		None               void
;; Registers used:
;;		status,2, status,0, pclath, cstack
;; Tracked objects:
;;		On entry : 40/0
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
psect	text797
	file	"C:\temp\dev\AK7030-OTP\main.c"
	line	104
	global	__size_of_clearPinPortAndTimer
	__size_of_clearPinPortAndTimer	equ	__end_of_clearPinPortAndTimer-_clearPinPortAndTimer
	
_clearPinPortAndTimer:	
	opt	stack 3
; Regs used in _clearPinPortAndTimer: [status,2+status,0+pclath+cstack]
	line	106
	
l4532:	
;main.c: 106: PB0 = 0;
	bcf	status, 5	;RP0=0, select bank0
	bcf	(48/8),(48)&7
	line	107
;main.c: 107: PA0 = 0;
	bcf	(40/8),(40)&7
	line	108
;main.c: 108: PA1 = 0;
	bcf	(41/8),(41)&7
	line	109
;main.c: 109: PA2 = 0;
	bcf	(42/8),(42)&7
	line	110
;main.c: 110: PA3 = 0;
	bcf	(43/8),(43)&7
	line	113
;main.c: 113: PBOD7 = 0;
	bsf	status, 5	;RP0=1, select bank3
	bsf	status, 6	;RP1=1, select bank3
	bcf	(3143/8)^0180h,(3143)&7
	line	114
;main.c: 114: PB7 = 0;
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	bcf	(55/8),(55)&7
	line	115
	
l4534:	
;main.c: 115: clearAllTimer();
	fcall	_clearAllTimer
	line	119
	
l678:	
	return
	opt stack 0
GLOBAL	__end_of_clearPinPortAndTimer
	__end_of_clearPinPortAndTimer:
;; =============== function _clearPinPortAndTimer ends ============

	signat	_clearPinPortAndTimer,88
	global	_AD_Sample
psect	text798,local,class=CODE,delta=2
global __ptext798
__ptext798:

;; *************** function _AD_Sample *****************
;; Defined at:
;;		line 310 in file "C:\temp\dev\AK7030-OTP\common.c"
;; Parameters:    Size  Location     Type
;;		None
;; Auto vars:     Size  Location     Type
;;		None
;; Return value:  Size  Location     Type
;;		None               void
;; Registers used:
;;		wreg, status,2, status,0, pclath, cstack
;; Tracked objects:
;;		On entry : 60/20
;;		On exit  : 40/0
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
;;		_adc_test_init
;; This function is called by:
;;		_process_AD_Converter_Value
;; This function uses a non-reentrant model
;;
psect	text798
	file	"C:\temp\dev\AK7030-OTP\common.c"
	line	310
	global	__size_of_AD_Sample
	__size_of_AD_Sample	equ	__end_of_AD_Sample-_AD_Sample
	
_AD_Sample:	
	opt	stack 3
; Regs used in _AD_Sample: [wreg+status,2+status,0+pclath+cstack]
	line	311
	
l4508:	
;common.c: 311: if(sampleTimes < 12)
	movlw	(0Ch)
	bcf	status, 5	;RP0=0, select bank0
	subwf	(_sampleTimes),w
	skipnc
	goto	u1681
	goto	u1680
u1681:
	goto	l1809
u1680:
	line	314
	
l4510:	
;common.c: 312: {
;common.c: 314: sampleTimes++;
	incf	(_sampleTimes),f
	line	316
	
l4512:	
;common.c: 316: if(sampleTimes >= 12)
	movlw	(0Ch)
	subwf	(_sampleTimes),w
	skipc
	goto	u1691
	goto	u1690
u1691:
	goto	l1809
u1690:
	line	318
	
l4514:	
;common.c: 317: {
;common.c: 318: sampleTimes = 0;
	clrf	(_sampleTimes)
	line	320
	
l4516:	
;common.c: 320: if(sampleChannelSelect == 0)
	movf	(_sampleChannelSelect),f
	skipz
	goto	u1701
	goto	u1700
u1701:
	goto	l4520
u1700:
	line	324
	
l4518:	
;common.c: 321: {
;common.c: 324: sampleChannelSelect = 2;
	movlw	(02h)
	movwf	(_sampleChannelSelect)
	line	325
;common.c: 325: }
	goto	l4530
	line	326
	
l4520:	
;common.c: 326: else if(sampleChannelSelect == 2)
	movf	(_sampleChannelSelect),w
	xorlw	02h
	skipz
	goto	u1711
	goto	u1710
u1711:
	goto	l4524
u1710:
	line	329
	
l4522:	
;common.c: 327: {
;common.c: 329: sampleChannelSelect = 5;
	movlw	(05h)
	movwf	(_sampleChannelSelect)
	line	330
;common.c: 330: }
	goto	l4530
	line	331
	
l4524:	
;common.c: 331: else if(sampleChannelSelect == 5)
	movf	(_sampleChannelSelect),w
	xorlw	05h
	skipz
	goto	u1721
	goto	u1720
u1721:
	goto	l4528
u1720:
	line	334
	
l4526:	
;common.c: 332: {
;common.c: 334: sampleChannelSelect = 6;
	movlw	(06h)
	movwf	(_sampleChannelSelect)
	line	335
;common.c: 335: }
	goto	l4530
	line	339
	
l4528:	
;common.c: 336: else
;common.c: 337: {
;common.c: 339: sampleChannelSelect = 0;
	clrf	(_sampleChannelSelect)
	line	345
	
l4530:	
;common.c: 340: }
;common.c: 345: adc_test_init(sampleChannelSelect,3);
	movlw	(03h)
	movwf	(?_adc_test_init)
	movf	(_sampleChannelSelect),w
	fcall	_adc_test_init
	line	349
	
l1809:	
	return
	opt stack 0
GLOBAL	__end_of_AD_Sample
	__end_of_AD_Sample:
;; =============== function _AD_Sample ends ============

	signat	_AD_Sample,88
	global	_getAdOriginaCh4Value
psect	text799,local,class=CODE,delta=2
global __ptext799
__ptext799:

;; *************** function _getAdOriginaCh4Value *****************
;; Defined at:
;;		line 258 in file "C:\temp\dev\AK7030-OTP\common.c"
;; Parameters:    Size  Location     Type
;;		None
;; Auto vars:     Size  Location     Type
;;		None
;; Return value:  Size  Location     Type
;;                  2   38[BANK0 ] unsigned int 
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
psect	text799
	file	"C:\temp\dev\AK7030-OTP\common.c"
	line	258
	global	__size_of_getAdOriginaCh4Value
	__size_of_getAdOriginaCh4Value	equ	__end_of_getAdOriginaCh4Value-_getAdOriginaCh4Value
	
_getAdOriginaCh4Value:	
	opt	stack 4
; Regs used in _getAdOriginaCh4Value: [wreg-fsr0h+status,2+status,0+btemp+1+pclath+cstack]
	line	260
	
l4504:	
;common.c: 260: return Filter(uiSampleChannelSecond);
	movlw	(_uiSampleChannelSecond&0ffh)
	bcf	status, 5	;RP0=0, select bank0
	movwf	(?_Filter)
	movlw	(0x1/2)
	movwf	(?_Filter+1)
	fcall	_Filter
	movf	(1+(?_Filter)),w
	movwf	(?_getAdOriginaCh4Value+1)
	movf	(0+(?_Filter)),w
	movwf	(?_getAdOriginaCh4Value)
	line	265
	
l1791:	
	return
	opt stack 0
GLOBAL	__end_of_getAdOriginaCh4Value
	__end_of_getAdOriginaCh4Value:
;; =============== function _getAdOriginaCh4Value ends ============

	signat	_getAdOriginaCh4Value,90
	global	_getAdOriginalCh1Value
psect	text800,local,class=CODE,delta=2
global __ptext800
__ptext800:

;; *************** function _getAdOriginalCh1Value *****************
;; Defined at:
;;		line 246 in file "C:\temp\dev\AK7030-OTP\common.c"
;; Parameters:    Size  Location     Type
;;		None
;; Auto vars:     Size  Location     Type
;;		None
;; Return value:  Size  Location     Type
;;                  2   38[BANK0 ] unsigned int 
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
psect	text800
	file	"C:\temp\dev\AK7030-OTP\common.c"
	line	246
	global	__size_of_getAdOriginalCh1Value
	__size_of_getAdOriginalCh1Value	equ	__end_of_getAdOriginalCh1Value-_getAdOriginalCh1Value
	
_getAdOriginalCh1Value:	
	opt	stack 4
; Regs used in _getAdOriginalCh1Value: [wreg-fsr0h+status,2+status,0+btemp+1+pclath+cstack]
	line	249
	
l4500:	
;common.c: 249: return Filter(uiSampleZero);
	movlw	(_uiSampleZero&0ffh)
	bcf	status, 5	;RP0=0, select bank0
	movwf	(?_Filter)
	movlw	(0x1/2)
	movwf	(?_Filter+1)
	fcall	_Filter
	movf	(1+(?_Filter)),w
	movwf	(?_getAdOriginalCh1Value+1)
	movf	(0+(?_Filter)),w
	movwf	(?_getAdOriginalCh1Value)
	line	254
	
l1788:	
	return
	opt stack 0
GLOBAL	__end_of_getAdOriginalCh1Value
	__end_of_getAdOriginalCh1Value:
;; =============== function _getAdOriginalCh1Value ends ============

	signat	_getAdOriginalCh1Value,90
	global	_getAdOriginalCh14Value
psect	text801,local,class=CODE,delta=2
global __ptext801
__ptext801:

;; *************** function _getAdOriginalCh14Value *****************
;; Defined at:
;;		line 269 in file "C:\temp\dev\AK7030-OTP\common.c"
;; Parameters:    Size  Location     Type
;;		None
;; Auto vars:     Size  Location     Type
;;		None
;; Return value:  Size  Location     Type
;;                  2   38[BANK0 ] unsigned int 
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
psect	text801
	file	"C:\temp\dev\AK7030-OTP\common.c"
	line	269
	global	__size_of_getAdOriginalCh14Value
	__size_of_getAdOriginalCh14Value	equ	__end_of_getAdOriginalCh14Value-_getAdOriginalCh14Value
	
_getAdOriginalCh14Value:	
	opt	stack 4
; Regs used in _getAdOriginalCh14Value: [wreg-fsr0h+status,2+status,0+btemp+1+pclath+cstack]
	line	271
	
l4496:	
;common.c: 271: return Filter(uiSampleChannelFifth);
	movlw	(_uiSampleChannelFifth&0ffh)
	bcf	status, 5	;RP0=0, select bank0
	movwf	(?_Filter)
	movlw	(0x3/2)
	movwf	(?_Filter+1)
	fcall	_Filter
	movf	(1+(?_Filter)),w
	movwf	(?_getAdOriginalCh14Value+1)
	movf	(0+(?_Filter)),w
	movwf	(?_getAdOriginalCh14Value)
	line	275
	
l1794:	
	return
	opt stack 0
GLOBAL	__end_of_getAdOriginalCh14Value
	__end_of_getAdOriginalCh14Value:
;; =============== function _getAdOriginalCh14Value ends ============

	signat	_getAdOriginalCh14Value,90
	global	_clearAllTimer
psect	text802,local,class=CODE,delta=2
global __ptext802
__ptext802:

;; *************** function _clearAllTimer *****************
;; Defined at:
;;		line 95 in file "C:\temp\dev\AK7030-OTP\main.c"
;; Parameters:    Size  Location     Type
;;		None
;; Auto vars:     Size  Location     Type
;;		None
;; Return value:  Size  Location     Type
;;		None               void
;; Registers used:
;;		status,2, status,0, pclath, cstack
;; Tracked objects:
;;		On entry : 40/20
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
psect	text802
	file	"C:\temp\dev\AK7030-OTP\main.c"
	line	95
	global	__size_of_clearAllTimer
	__size_of_clearAllTimer	equ	__end_of_clearAllTimer-_clearAllTimer
	
_clearAllTimer:	
	opt	stack 4
; Regs used in _clearAllTimer: [status,2+status,0+pclath+cstack]
	line	96
	
l4494:	
;main.c: 96: clearTwelveHoursTimer();
	fcall	_clearTwelveHoursTimer
	line	97
;main.c: 97: clearThreeHoursTimer();
	fcall	_clearThreeHoursTimer
	line	98
;main.c: 98: clearTwentySecondsTimer();
	fcall	_clearTwentySecondsTimer
	line	99
	
l675:	
	return
	opt stack 0
GLOBAL	__end_of_clearAllTimer
	__end_of_clearAllTimer:
;; =============== function _clearAllTimer ends ============

	signat	_clearAllTimer,88
	global	_setAD_ConvertFlag
psect	text803,local,class=CODE,delta=2
global __ptext803
__ptext803:

;; *************** function _setAD_ConvertFlag *****************
;; Defined at:
;;		line 235 in file "C:\temp\dev\AK7030-OTP\common.c"
;; Parameters:    Size  Location     Type
;;  flag            1    wreg     unsigned char 
;; Auto vars:     Size  Location     Type
;;  flag            1    0[BANK0 ] unsigned char 
;; Return value:  Size  Location     Type
;;		None               void
;; Registers used:
;;		wreg
;; Tracked objects:
;;		On entry : 60/20
;;		On exit  : 60/20
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
psect	text803
	file	"C:\temp\dev\AK7030-OTP\common.c"
	line	235
	global	__size_of_setAD_ConvertFlag
	__size_of_setAD_ConvertFlag	equ	__end_of_setAD_ConvertFlag-_setAD_ConvertFlag
	
_setAD_ConvertFlag:	
	opt	stack 4
; Regs used in _setAD_ConvertFlag: [wreg]
;setAD_ConvertFlag@flag stored from wreg
	bcf	status, 5	;RP0=0, select bank0
	movwf	(setAD_ConvertFlag@flag)
	line	236
	
l4460:	
;common.c: 236: adc_convert_flag = flag;
	movf	(setAD_ConvertFlag@flag),w
	bsf	status, 5	;RP0=1, select bank1
	movwf	(_adc_convert_flag)^080h
	line	237
	
l1785:	
	return
	opt stack 0
GLOBAL	__end_of_setAD_ConvertFlag
	__end_of_setAD_ConvertFlag:
;; =============== function _setAD_ConvertFlag ends ============

	signat	_setAD_ConvertFlag,4216
	global	_getAD_ConvertFlag
psect	text804,local,class=CODE,delta=2
global __ptext804
__ptext804:

;; *************** function _getAD_ConvertFlag *****************
;; Defined at:
;;		line 229 in file "C:\temp\dev\AK7030-OTP\common.c"
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
;;		_process_AD_Converter_Value
;; This function uses a non-reentrant model
;;
psect	text804
	file	"C:\temp\dev\AK7030-OTP\common.c"
	line	229
	global	__size_of_getAD_ConvertFlag
	__size_of_getAD_ConvertFlag	equ	__end_of_getAD_ConvertFlag-_getAD_ConvertFlag
	
_getAD_ConvertFlag:	
	opt	stack 4
; Regs used in _getAD_ConvertFlag: [wreg]
	line	230
	
l4456:	
;common.c: 230: return adc_convert_flag;
	bsf	status, 5	;RP0=1, select bank1
	bcf	status, 6	;RP1=0, select bank1
	movf	(_adc_convert_flag)^080h,w
	line	231
	
l1782:	
	return
	opt stack 0
GLOBAL	__end_of_getAD_ConvertFlag
	__end_of_getAD_ConvertFlag:
;; =============== function _getAD_ConvertFlag ends ============

	signat	_getAD_ConvertFlag,89
	global	_Filter
psect	text805,local,class=CODE,delta=2
global __ptext805
__ptext805:

;; *************** function _Filter *****************
;; Defined at:
;;		line 63 in file "C:\temp\dev\AK7030-OTP\common.c"
;; Parameters:    Size  Location     Type
;;  tmpValue        2    0[BANK0 ] PTR int 
;;		 -> uiSampleChannelFifth(24), uiSampleChannelSecond(24), uiSampleZero(24), 
;; Auto vars:     Size  Location     Type
;;  cir             2   34[BANK0 ] int 
;;  filter_buf     24    6[BANK0 ] unsigned int [12]
;;  filter_sum      2   32[BANK0 ] unsigned int 
;;  filter_temp     2   30[BANK0 ] unsigned int 
;;  i               1   37[BANK0 ] unsigned char 
;;  j               1   36[BANK0 ] unsigned char 
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
;;      Locals:         0      32       0       0       0
;;      Temps:          0       4       0       0       0
;;      Totals:         0      38       0       0       0
;;Total ram usage:       38 bytes
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
psect	text805
	file	"C:\temp\dev\AK7030-OTP\common.c"
	line	63
	global	__size_of_Filter
	__size_of_Filter	equ	__end_of_Filter-_Filter
	
_Filter:	
	opt	stack 4
; Regs used in _Filter: [wreg-fsr0h+status,2+status,0+btemp+1]
	line	65
	
l4346:	
	clrf	(Filter@j)
	line	67
;common.c: 67: unsigned int filter_temp = 0, filter_sum = 0;
	clrf	(Filter@filter_temp)
	clrf	(Filter@filter_temp+1)
	clrf	(Filter@filter_sum)
	clrf	(Filter@filter_sum+1)
	line	71
;common.c: 69: unsigned int filter_buf[12];
;common.c: 71: for(int cir = 0;cir < 12; cir++)
	clrf	(Filter@cir)
	clrf	(Filter@cir+1)
	line	72
	
l4352:	
;common.c: 72: filter_buf[cir] = *tmpValue++;
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	movf	(Filter@tmpValue),w
	movwf	fsr0
	bsf	status,7
	btfss	(Filter@tmpValue+1),0
	bcf	status,7
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
	bcf	status, 7	;select IRP bank0
	movwf	indf
	incf	fsr0,f
	movf	1+(??_Filter+0)+0,w
	movwf	indf
	
l4354:	
	movlw	02h
	addwf	(Filter@tmpValue),f
	skipnc
	incf	(Filter@tmpValue+1),f
	line	71
	
l4356:	
	incf	(Filter@cir),f
	skipnz
	incf	(Filter@cir+1),f
	
l4358:	
	movf	(Filter@cir+1),w
	xorlw	80h
	movwf	btemp+1
	movlw	(high(0Ch))^80h
	subwf	btemp+1,w
	skipz
	goto	u1485
	movlw	low(0Ch)
	subwf	(Filter@cir),w
u1485:

	skipc
	goto	u1481
	goto	u1480
u1481:
	goto	l4352
u1480:
	line	75
	
l4360:	
;common.c: 75: for(j = 0; j < 12 - 1; j++)
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	clrf	(Filter@j)
	line	77
	
l4366:	
;common.c: 76: {
;common.c: 77: for(i = 0; i < 12 - 1 - j; i++)
	clrf	(Filter@i)
	goto	l4374
	line	79
	
l4368:	
;common.c: 78: {
;common.c: 79: if(filter_buf[i] > filter_buf[i + 1])
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
	goto	u1495
	movf	0+(??_Filter+0)+0,w
	subwf	0+(??_Filter+2)+0,w
u1495:
	skipnc
	goto	u1491
	goto	u1490
u1491:
	goto	l4372
u1490:
	line	82
	
l4370:	
;common.c: 80: {
;common.c: 82: filter_temp = filter_buf[i];
	clrc
	rlf	(Filter@i),w
	addlw	Filter@filter_buf&0ffh
	movwf	fsr0
	movf	indf,w
	movwf	(Filter@filter_temp)
	incf	fsr0,f
	movf	indf,w
	movwf	(Filter@filter_temp+1)
	line	84
;common.c: 84: filter_buf[i] = filter_buf[i + 1];
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
	line	86
;common.c: 86: filter_buf[i + 1] = filter_temp;
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
	line	77
	
l4372:	
	incf	(Filter@i),f
	
l4374:	
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
	goto	u1505
	movf	0+(??_Filter+0)+0,w
	subwf	(Filter@i),w
u1505:

	skipc
	goto	u1501
	goto	u1500
u1501:
	goto	l4368
u1500:
	line	75
	
l4376:	
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	incf	(Filter@j),f
	
l4378:	
	movlw	(0Bh)
	subwf	(Filter@j),w
	skipc
	goto	u1511
	goto	u1510
u1511:
	goto	l4366
u1510:
	line	91
	
l4380:	
;common.c: 87: }
;common.c: 88: }
;common.c: 89: }
;common.c: 91: for(i = 2; i < 12 - 2; i++)
	movlw	(02h)
	movwf	(Filter@i)
	line	93
	
l4384:	
;common.c: 92: {
;common.c: 93: filter_sum += filter_buf[i];
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
	line	91
	
l4386:	
	incf	(Filter@i),f
	
l4388:	
	movlw	(0Ah)
	subwf	(Filter@i),w
	skipc
	goto	u1521
	goto	u1520
u1521:
	goto	l4384
u1520:
	line	96
	
l4390:	
;common.c: 94: }
;common.c: 96: return (filter_sum >> 3);
	movf	(Filter@filter_sum+1),w
	movwf	(?_Filter+1)
	movf	(Filter@filter_sum),w
	movwf	(?_Filter)
	
l4392:	
	clrc
	rrf	(?_Filter+1),f
	rrf	(?_Filter),f
	clrc
	rrf	(?_Filter+1),f
	rrf	(?_Filter),f
	clrc
	rrf	(?_Filter+1),f
	rrf	(?_Filter),f
	line	98
	
l1738:	
	return
	opt stack 0
GLOBAL	__end_of_Filter
	__end_of_Filter:
;; =============== function _Filter ends ============

	signat	_Filter,4218
	global	_isFinishedThreeHoursTimer
psect	text806,local,class=CODE,delta=2
global __ptext806
__ptext806:

;; *************** function _isFinishedThreeHoursTimer *****************
;; Defined at:
;;		line 451 in file "C:\temp\dev\AK7030-OTP\common.c"
;; Parameters:    Size  Location     Type
;;		None
;; Auto vars:     Size  Location     Type
;;		None
;; Return value:  Size  Location     Type
;;                  1    wreg      unsigned char 
;; Registers used:
;;		wreg, status,2, status,0
;; Tracked objects:
;;		On entry : 40/20
;;		On exit  : 40/0
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
psect	text806
	file	"C:\temp\dev\AK7030-OTP\common.c"
	line	451
	global	__size_of_isFinishedThreeHoursTimer
	__size_of_isFinishedThreeHoursTimer	equ	__end_of_isFinishedThreeHoursTimer-_isFinishedThreeHoursTimer
	
_isFinishedThreeHoursTimer:	
	opt	stack 5
; Regs used in _isFinishedThreeHoursTimer: [wreg+status,2+status,0]
	line	452
	
l4330:	
;common.c: 452: if((uiSmallTimer == 0) && bSmallTimerStartFlag)
	bsf	status, 5	;RP0=1, select bank1
	movf	((_uiSmallTimer+1)^080h),w
	iorwf	((_uiSmallTimer)^080h),w
	skipz
	goto	u1461
	goto	u1460
u1461:
	goto	l4342
u1460:
	
l4332:	
	bcf	status, 5	;RP0=0, select bank0
	movf	(_bSmallTimerStartFlag),w
	skipz
	goto	u1470
	goto	l4342
u1470:
	line	454
	
l4334:	
;common.c: 453: {
;common.c: 454: bSmallTimerStartFlag = 0;
	clrf	(_bSmallTimerStartFlag)
	line	455
	
l4336:	
;common.c: 455: return 1;
	movlw	(01h)
	goto	l1847
	line	458
	
l4342:	
;common.c: 457: else
;common.c: 458: return 0;
	movlw	(0)
	line	459
	
l1847:	
	return
	opt stack 0
GLOBAL	__end_of_isFinishedThreeHoursTimer
	__end_of_isFinishedThreeHoursTimer:
;; =============== function _isFinishedThreeHoursTimer ends ============

	signat	_isFinishedThreeHoursTimer,89
	global	_startThreeHoursTimer
psect	text807,local,class=CODE,delta=2
global __ptext807
__ptext807:

;; *************** function _startThreeHoursTimer *****************
;; Defined at:
;;		line 404 in file "C:\temp\dev\AK7030-OTP\common.c"
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
;;		On exit  : 40/0
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
psect	text807
	file	"C:\temp\dev\AK7030-OTP\common.c"
	line	404
	global	__size_of_startThreeHoursTimer
	__size_of_startThreeHoursTimer	equ	__end_of_startThreeHoursTimer-_startThreeHoursTimer
	
_startThreeHoursTimer:	
	opt	stack 5
; Regs used in _startThreeHoursTimer: [wreg+status,2+status,0]
	line	405
	
l4322:	
;common.c: 405: if(( 0 == uiSmallTimer ) && ( 0 == bSmallTimerStartFlag ))
	bsf	status, 5	;RP0=1, select bank1
	movf	((_uiSmallTimer+1)^080h),w
	iorwf	((_uiSmallTimer)^080h),w
	skipz
	goto	u1441
	goto	u1440
u1441:
	goto	l1829
u1440:
	
l4324:	
	bcf	status, 5	;RP0=0, select bank0
	movf	(_bSmallTimerStartFlag),f
	skipz
	goto	u1451
	goto	u1450
u1451:
	goto	l1829
u1450:
	line	407
	
l4326:	
;common.c: 406: {
;common.c: 407: uiSmallTimer = uiSetTime;
	movf	(startThreeHoursTimer@uiSetTime+1),w
	bsf	status, 5	;RP0=1, select bank1
	movwf	(_uiSmallTimer+1)^080h
	bcf	status, 5	;RP0=0, select bank0
	movf	(startThreeHoursTimer@uiSetTime),w
	bsf	status, 5	;RP0=1, select bank1
	movwf	(_uiSmallTimer)^080h
	line	408
	
l4328:	
;common.c: 408: bSmallTimerStartFlag = 1;
	bcf	status, 5	;RP0=0, select bank0
	clrf	(_bSmallTimerStartFlag)
	incf	(_bSmallTimerStartFlag),f
	line	414
	
l1829:	
	return
	opt stack 0
GLOBAL	__end_of_startThreeHoursTimer
	__end_of_startThreeHoursTimer:
;; =============== function _startThreeHoursTimer ends ============

	signat	_startThreeHoursTimer,4216
	global	_isFinishedTwentySecondsTimer
psect	text808,local,class=CODE,delta=2
global __ptext808
__ptext808:

;; *************** function _isFinishedTwentySecondsTimer *****************
;; Defined at:
;;		line 428 in file "C:\temp\dev\AK7030-OTP\common.c"
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
;;		On exit  : 40/0
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
psect	text808
	file	"C:\temp\dev\AK7030-OTP\common.c"
	line	428
	global	__size_of_isFinishedTwentySecondsTimer
	__size_of_isFinishedTwentySecondsTimer	equ	__end_of_isFinishedTwentySecondsTimer-_isFinishedTwentySecondsTimer
	
_isFinishedTwentySecondsTimer:	
	opt	stack 5
; Regs used in _isFinishedTwentySecondsTimer: [wreg+status,2+status,0]
	line	429
	
l4306:	
;common.c: 429: if(( 0 == uiTwentySecondsTimer ) && bTwentySecStartFlag )
	bsf	status, 5	;RP0=1, select bank1
	movf	((_uiTwentySecondsTimer+1)^080h),w
	iorwf	((_uiTwentySecondsTimer)^080h),w
	skipz
	goto	u1421
	goto	u1420
u1421:
	goto	l4318
u1420:
	
l4308:	
	bcf	status, 5	;RP0=0, select bank0
	movf	(_bTwentySecStartFlag),w
	skipz
	goto	u1430
	goto	l4318
u1430:
	line	431
	
l4310:	
;common.c: 430: {
;common.c: 431: bTwentySecStartFlag = 0;
	clrf	(_bTwentySecStartFlag)
	line	432
	
l4312:	
;common.c: 432: return 1;
	movlw	(01h)
	goto	l1837
	line	435
	
l4318:	
;common.c: 434: else
;common.c: 435: return 0;
	movlw	(0)
	line	436
	
l1837:	
	return
	opt stack 0
GLOBAL	__end_of_isFinishedTwentySecondsTimer
	__end_of_isFinishedTwentySecondsTimer:
;; =============== function _isFinishedTwentySecondsTimer ends ============

	signat	_isFinishedTwentySecondsTimer,89
	global	_startTwentySecondsTimer
psect	text809,local,class=CODE,delta=2
global __ptext809
__ptext809:

;; *************** function _startTwentySecondsTimer *****************
;; Defined at:
;;		line 418 in file "C:\temp\dev\AK7030-OTP\common.c"
;; Parameters:    Size  Location     Type
;;		None
;; Auto vars:     Size  Location     Type
;;		None
;; Return value:  Size  Location     Type
;;		None               void
;; Registers used:
;;		wreg, status,2, status,0
;; Tracked objects:
;;		On entry : 160/0
;;		On exit  : 140/0
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
psect	text809
	file	"C:\temp\dev\AK7030-OTP\common.c"
	line	418
	global	__size_of_startTwentySecondsTimer
	__size_of_startTwentySecondsTimer	equ	__end_of_startTwentySecondsTimer-_startTwentySecondsTimer
	
_startTwentySecondsTimer:	
	opt	stack 5
; Regs used in _startTwentySecondsTimer: [wreg+status,2+status,0]
	line	419
	
l4298:	
;common.c: 419: if(( 0 == uiTwentySecondsTimer) && ( 0 == bTwentySecStartFlag))
	bsf	status, 5	;RP0=1, select bank1
	movf	((_uiTwentySecondsTimer+1)^080h),w
	iorwf	((_uiTwentySecondsTimer)^080h),w
	skipz
	goto	u1401
	goto	u1400
u1401:
	goto	l1833
u1400:
	
l4300:	
	bcf	status, 5	;RP0=0, select bank0
	movf	(_bTwentySecStartFlag),f
	skipz
	goto	u1411
	goto	u1410
u1411:
	goto	l1833
u1410:
	line	421
	
l4302:	
;common.c: 420: {
;common.c: 421: uiTwentySecondsTimer = 20;
	movlw	014h
	bsf	status, 5	;RP0=1, select bank1
	movwf	(_uiTwentySecondsTimer)^080h
	clrf	(_uiTwentySecondsTimer+1)^080h
	line	422
	
l4304:	
;common.c: 422: bTwentySecStartFlag = 1;
	bcf	status, 5	;RP0=0, select bank0
	clrf	(_bTwentySecStartFlag)
	incf	(_bTwentySecStartFlag),f
	line	424
	
l1833:	
	return
	opt stack 0
GLOBAL	__end_of_startTwentySecondsTimer
	__end_of_startTwentySecondsTimer:
;; =============== function _startTwentySecondsTimer ends ============

	signat	_startTwentySecondsTimer,88
	global	_isFinishedTwelveHoursTimer
psect	text810,local,class=CODE,delta=2
global __ptext810
__ptext810:

;; *************** function _isFinishedTwelveHoursTimer *****************
;; Defined at:
;;		line 440 in file "C:\temp\dev\AK7030-OTP\common.c"
;; Parameters:    Size  Location     Type
;;		None
;; Auto vars:     Size  Location     Type
;;		None
;; Return value:  Size  Location     Type
;;                  1    wreg      unsigned char 
;; Registers used:
;;		wreg, status,2, status,0
;; Tracked objects:
;;		On entry : 40/0
;;		On exit  : 40/0
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
psect	text810
	file	"C:\temp\dev\AK7030-OTP\common.c"
	line	440
	global	__size_of_isFinishedTwelveHoursTimer
	__size_of_isFinishedTwelveHoursTimer	equ	__end_of_isFinishedTwelveHoursTimer-_isFinishedTwelveHoursTimer
	
_isFinishedTwelveHoursTimer:	
	opt	stack 5
; Regs used in _isFinishedTwelveHoursTimer: [wreg+status,2+status,0]
	line	441
	
l4282:	
;common.c: 441: if(( uiBigTimer == 0 ) && bBigTimerStartFlag )
	bsf	status, 5	;RP0=1, select bank1
	movf	((_uiBigTimer+1)^080h),w
	iorwf	((_uiBigTimer)^080h),w
	skipz
	goto	u1381
	goto	u1380
u1381:
	goto	l4294
u1380:
	
l4284:	
	bcf	status, 5	;RP0=0, select bank0
	movf	(_bBigTimerStartFlag),w
	skipz
	goto	u1390
	goto	l4294
u1390:
	line	443
	
l4286:	
;common.c: 442: {
;common.c: 443: bBigTimerStartFlag = 0;
	clrf	(_bBigTimerStartFlag)
	line	444
	
l4288:	
;common.c: 444: return 1;
	movlw	(01h)
	goto	l1842
	line	447
	
l4294:	
;common.c: 446: else
;common.c: 447: return 0;
	movlw	(0)
	line	448
	
l1842:	
	return
	opt stack 0
GLOBAL	__end_of_isFinishedTwelveHoursTimer
	__end_of_isFinishedTwelveHoursTimer:
;; =============== function _isFinishedTwelveHoursTimer ends ============

	signat	_isFinishedTwelveHoursTimer,89
	global	_startTwelveHourTimer
psect	text811,local,class=CODE,delta=2
global __ptext811
__ptext811:

;; *************** function _startTwelveHourTimer *****************
;; Defined at:
;;		line 370 in file "C:\temp\dev\AK7030-OTP\common.c"
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
;;		On exit  : 40/0
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
psect	text811
	file	"C:\temp\dev\AK7030-OTP\common.c"
	line	370
	global	__size_of_startTwelveHourTimer
	__size_of_startTwelveHourTimer	equ	__end_of_startTwelveHourTimer-_startTwelveHourTimer
	
_startTwelveHourTimer:	
	opt	stack 5
; Regs used in _startTwelveHourTimer: [wreg+status,2+status,0]
	line	371
	
l4274:	
;common.c: 371: if((0 == uiBigTimer) && ( 0 == bBigTimerStartFlag))
	bsf	status, 5	;RP0=1, select bank1
	movf	((_uiBigTimer+1)^080h),w
	iorwf	((_uiBigTimer)^080h),w
	skipz
	goto	u1361
	goto	u1360
u1361:
	goto	l1816
u1360:
	
l4276:	
	bcf	status, 5	;RP0=0, select bank0
	movf	(_bBigTimerStartFlag),f
	skipz
	goto	u1371
	goto	u1370
u1371:
	goto	l1816
u1370:
	line	373
	
l4278:	
;common.c: 372: {
;common.c: 373: uiBigTimer = uiSetTime;
	movf	(startTwelveHourTimer@uiSetTime+1),w
	bsf	status, 5	;RP0=1, select bank1
	movwf	(_uiBigTimer+1)^080h
	bcf	status, 5	;RP0=0, select bank0
	movf	(startTwelveHourTimer@uiSetTime),w
	bsf	status, 5	;RP0=1, select bank1
	movwf	(_uiBigTimer)^080h
	line	374
	
l4280:	
;common.c: 374: bBigTimerStartFlag = 1;
	bcf	status, 5	;RP0=0, select bank0
	clrf	(_bBigTimerStartFlag)
	incf	(_bBigTimerStartFlag),f
	line	381
	
l1816:	
	return
	opt stack 0
GLOBAL	__end_of_startTwelveHourTimer
	__end_of_startTwelveHourTimer:
;; =============== function _startTwelveHourTimer ends ============

	signat	_startTwelveHourTimer,4216
	global	_clrSampeTime
psect	text812,local,class=CODE,delta=2
global __ptext812
__ptext812:

;; *************** function _clrSampeTime *****************
;; Defined at:
;;		line 472 in file "C:\temp\dev\AK7030-OTP\common.c"
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
psect	text812
	file	"C:\temp\dev\AK7030-OTP\common.c"
	line	472
	global	__size_of_clrSampeTime
	__size_of_clrSampeTime	equ	__end_of_clrSampeTime-_clrSampeTime
	
_clrSampeTime:	
	opt	stack 5
; Regs used in _clrSampeTime: [status,2]
	line	473
	
l4272:	
;common.c: 473: timer.timer10msStopWatch = 0;
	clrf	(_timer)^080h
	line	474
	
l1856:	
	return
	opt stack 0
GLOBAL	__end_of_clrSampeTime
	__end_of_clrSampeTime:
;; =============== function _clrSampeTime ends ============

	signat	_clrSampeTime,88
	global	_isPermitSampleTime
psect	text813,local,class=CODE,delta=2
global __ptext813
__ptext813:

;; *************** function _isPermitSampleTime *****************
;; Defined at:
;;		line 462 in file "C:\temp\dev\AK7030-OTP\common.c"
;; Parameters:    Size  Location     Type
;;		None
;; Auto vars:     Size  Location     Type
;;		None
;; Return value:  Size  Location     Type
;;                  1    wreg      unsigned char 
;; Registers used:
;;		wreg
;; Tracked objects:
;;		On entry : 40/0
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
psect	text813
	file	"C:\temp\dev\AK7030-OTP\common.c"
	line	462
	global	__size_of_isPermitSampleTime
	__size_of_isPermitSampleTime	equ	__end_of_isPermitSampleTime-_isPermitSampleTime
	
_isPermitSampleTime:	
	opt	stack 5
; Regs used in _isPermitSampleTime: [wreg]
	line	463
	
l4260:	
;common.c: 463: if(timer.timer10msStopWatch >= 10)
	movlw	(0Ah)
	bsf	status, 5	;RP0=1, select bank1
	subwf	(_timer)^080h,w
	skipc
	goto	u1351
	goto	u1350
u1351:
	goto	l4268
u1350:
	line	465
	
l4262:	
;common.c: 464: {
;common.c: 465: return 1;
	movlw	(01h)
	goto	l1852
	line	468
	
l4268:	
;common.c: 467: else
;common.c: 468: return 0;
	movlw	(0)
	line	469
	
l1852:	
	return
	opt stack 0
GLOBAL	__end_of_isPermitSampleTime
	__end_of_isPermitSampleTime:
;; =============== function _isPermitSampleTime ends ============

	signat	_isPermitSampleTime,89
	global	_adc_start
psect	text814,local,class=CODE,delta=2
global __ptext814
__ptext814:

;; *************** function _adc_start *****************
;; Defined at:
;;		line 100 in file "C:\temp\dev\AK7030-OTP\periph.c"
;; Parameters:    Size  Location     Type
;;		None
;; Auto vars:     Size  Location     Type
;;		None
;; Return value:  Size  Location     Type
;;		None               void
;; Registers used:
;;		None
;; Tracked objects:
;;		On entry : 40/20
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
psect	text814
	file	"C:\temp\dev\AK7030-OTP\periph.c"
	line	100
	global	__size_of_adc_start
	__size_of_adc_start	equ	__end_of_adc_start-_adc_start
	
_adc_start:	
	opt	stack 4
; Regs used in _adc_start: []
	line	101
	
l4258:	
;periph.c: 101: GO=1;
	bcf	status, 5	;RP0=0, select bank0
	bsf	(249/8),(249)&7
	line	102
	
l2520:	
	return
	opt stack 0
GLOBAL	__end_of_adc_start
	__end_of_adc_start:
;; =============== function _adc_start ends ============

	signat	_adc_start,88
	global	_dac_init
psect	text815,local,class=CODE,delta=2
global __ptext815
__ptext815:

;; *************** function _dac_init *****************
;; Defined at:
;;		line 14 in file "C:\temp\dev\AK7030-OTP\periph.c"
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
psect	text815
	file	"C:\temp\dev\AK7030-OTP\periph.c"
	line	14
	global	__size_of_dac_init
	__size_of_dac_init	equ	__end_of_dac_init-_dac_init
	
_dac_init:	
	opt	stack 5
; Regs used in _dac_init: [wreg]
	line	15
	
l4252:	
;periph.c: 15: DACCON|=1;
	bsf	(135)^080h+(0/8),(0)&7	;volatile
	line	17
	
l4254:	
;periph.c: 17: DACR0=0x0F;
	movlw	(0Fh)
	movwf	(136)^080h	;volatile
	line	18
	
l4256:	
;periph.c: 18: DACCON|=(1)<<2;
	bsf	(135)^080h+(2/8),(2)&7	;volatile
	line	22
	
l2500:	
	return
	opt stack 0
GLOBAL	__end_of_dac_init
	__end_of_dac_init:
;; =============== function _dac_init ends ============

	signat	_dac_init,88
	global	_adc_test_init
psect	text816,local,class=CODE,delta=2
global __ptext816
__ptext816:

;; *************** function _adc_test_init *****************
;; Defined at:
;;		line 85 in file "C:\temp\dev\AK7030-OTP\periph.c"
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
;;		_AD_Sample
;; This function uses a non-reentrant model
;;
psect	text816
	file	"C:\temp\dev\AK7030-OTP\periph.c"
	line	85
	global	__size_of_adc_test_init
	__size_of_adc_test_init	equ	__end_of_adc_test_init-_adc_test_init
	
_adc_test_init:	
	opt	stack 3
; Regs used in _adc_test_init: [wreg+status,2+status,0]
;adc_test_init@channel stored from wreg
	movwf	(adc_test_init@channel)
	line	86
	
l4242:	
;periph.c: 86: ADCON0 = 0x00;
	clrf	(31)	;volatile
	line	87
	
l4244:	
;periph.c: 87: ADCON0|=channel<<2;
	movf	(adc_test_init@channel),w
	movwf	(??_adc_test_init+0)+0
	clrc
	rlf	(??_adc_test_init+0)+0,f
	clrc
	rlf	(??_adc_test_init+0)+0,w
	iorwf	(31),f	;volatile
	line	88
	
l4246:	
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
	
l4248:	
;periph.c: 89: ADON=1;
	bcf	status, 5	;RP0=0, select bank0
	bsf	(248/8),(248)&7
	line	90
	
l4250:	
;periph.c: 90: ADIE=1;
	bsf	status, 5	;RP0=1, select bank1
	bsf	(1130/8)^080h,(1130)&7
	line	91
	
l2514:	
	return
	opt stack 0
GLOBAL	__end_of_adc_test_init
	__end_of_adc_test_init:
;; =============== function _adc_test_init ends ============

	signat	_adc_test_init,8312
	global	_timer1_interrupt_config
psect	text817,local,class=CODE,delta=2
global __ptext817
__ptext817:

;; *************** function _timer1_interrupt_config *****************
;; Defined at:
;;		line 221 in file "C:\temp\dev\AK7030-OTP\common.c"
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
psect	text817
	file	"C:\temp\dev\AK7030-OTP\common.c"
	line	221
	global	__size_of_timer1_interrupt_config
	__size_of_timer1_interrupt_config	equ	__end_of_timer1_interrupt_config-_timer1_interrupt_config
	
_timer1_interrupt_config:	
	opt	stack 5
; Regs used in _timer1_interrupt_config: []
	line	222
	
l4240:	
;common.c: 222: GIE = 1;
	bsf	(95/8),(95)&7
	line	223
;common.c: 223: PEIE = 1;
	bsf	(94/8),(94)&7
	line	224
	
l1779:	
	return
	opt stack 0
GLOBAL	__end_of_timer1_interrupt_config
	__end_of_timer1_interrupt_config:
;; =============== function _timer1_interrupt_config ends ============

	signat	_timer1_interrupt_config,88
	global	_timer1_config
psect	text818,local,class=CODE,delta=2
global __ptext818
__ptext818:

;; *************** function _timer1_config *****************
;; Defined at:
;;		line 209 in file "C:\temp\dev\AK7030-OTP\common.c"
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
psect	text818
	file	"C:\temp\dev\AK7030-OTP\common.c"
	line	209
	global	__size_of_timer1_config
	__size_of_timer1_config	equ	__end_of_timer1_config-_timer1_config
	
_timer1_config:	
	opt	stack 5
; Regs used in _timer1_config: [wreg]
	line	211
	
l4236:	
;common.c: 211: TMR1H=0xCF;
	movlw	(0CFh)
	bcf	status, 6	;RP1=0, select bank0
	movwf	(15)	;volatile
	line	212
;common.c: 212: TMR1L=0x2C;
	movlw	(02Ch)
	movwf	(14)	;volatile
	line	213
;common.c: 213: T1CON=0xE1;
	movlw	(0E1h)
	movwf	(16)	;volatile
	line	214
	
l4238:	
;common.c: 214: TMR1IE=1;
	bsf	status, 5	;RP0=1, select bank1
	bsf	(1120/8)^080h,(1120)&7
	line	216
	
l1776:	
	return
	opt stack 0
GLOBAL	__end_of_timer1_config
	__end_of_timer1_config:
;; =============== function _timer1_config ends ============

	signat	_timer1_config,88
	global	_clock_config
psect	text819,local,class=CODE,delta=2
global __ptext819
__ptext819:

;; *************** function _clock_config *****************
;; Defined at:
;;		line 201 in file "C:\temp\dev\AK7030-OTP\common.c"
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
psect	text819
	file	"C:\temp\dev\AK7030-OTP\common.c"
	line	201
	global	__size_of_clock_config
	__size_of_clock_config	equ	__end_of_clock_config-_clock_config
	
_clock_config:	
	opt	stack 5
; Regs used in _clock_config: [wreg+status,2]
	line	203
	
l4232:	
;common.c: 203: CLKPR = 0x80;
	movlw	(080h)
	bcf	status, 5	;RP0=0, select bank2
	bsf	status, 6	;RP1=1, select bank2
	movwf	(264)^0100h	;volatile
	line	204
	
l4234:	
;common.c: 204: CLKPR = 0x00;
	clrf	(264)^0100h	;volatile
	line	205
;common.c: 205: while(CLKPCE);
	
l1770:	
	btfsc	(2119/8)^0100h,(2119)&7
	goto	u1341
	goto	u1340
u1341:
	goto	l1770
u1340:
	line	206
	
l1773:	
	return
	opt stack 0
GLOBAL	__end_of_clock_config
	__end_of_clock_config:
;; =============== function _clock_config ends ============

	signat	_clock_config,88
	global	_setPA6
psect	text820,local,class=CODE,delta=2
global __ptext820
__ptext820:

;; *************** function _setPA6 *****************
;; Defined at:
;;		line 281 in file "C:\temp\dev\AK7030-OTP\main.c"
;; Parameters:    Size  Location     Type
;;  bValue          1    wreg     unsigned char 
;; Auto vars:     Size  Location     Type
;;  bValue          1    0[BANK0 ] unsigned char 
;; Return value:  Size  Location     Type
;;		None               void
;; Registers used:
;;		wreg
;; Tracked objects:
;;		On entry : 40/0
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
;;		_main
;; This function uses a non-reentrant model
;;
psect	text820
	file	"C:\temp\dev\AK7030-OTP\main.c"
	line	281
	global	__size_of_setPA6
	__size_of_setPA6	equ	__end_of_setPA6-_setPA6
	
_setPA6:	
	opt	stack 5
; Regs used in _setPA6: [wreg]
;setPA6@bValue stored from wreg
	bcf	status, 5	;RP0=0, select bank0
	movwf	(setPA6@bValue)
	line	282
	
l4228:	
;main.c: 282: if( bValue )
	movf	(setPA6@bValue),w
	skipz
	goto	u1330
	goto	l719
u1330:
	line	284
	
l4230:	
;main.c: 284: PA6 = 1;
	bsf	(46/8),(46)&7
	goto	l721
	line	288
	
l719:	
	line	290
;main.c: 288: else
;main.c: 290: PA6= 0;
	bcf	(46/8),(46)&7
	line	294
	
l721:	
	return
	opt stack 0
GLOBAL	__end_of_setPA6
	__end_of_setPA6:
;; =============== function _setPA6 ends ============

	signat	_setPA6,4216
	global	_setPA3
psect	text821,local,class=CODE,delta=2
global __ptext821
__ptext821:

;; *************** function _setPA3 *****************
;; Defined at:
;;		line 235 in file "C:\temp\dev\AK7030-OTP\main.c"
;; Parameters:    Size  Location     Type
;;  bValue          1    wreg     unsigned char 
;; Auto vars:     Size  Location     Type
;;  bValue          1    0[BANK0 ] unsigned char 
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
;;		_main
;; This function uses a non-reentrant model
;;
psect	text821
	file	"C:\temp\dev\AK7030-OTP\main.c"
	line	235
	global	__size_of_setPA3
	__size_of_setPA3	equ	__end_of_setPA3-_setPA3
	
_setPA3:	
	opt	stack 5
; Regs used in _setPA3: [wreg]
;setPA3@bValue stored from wreg
	movwf	(setPA3@bValue)
	line	236
	
l4224:	
;main.c: 236: if( bValue )
	movf	(setPA3@bValue),w
	skipz
	goto	u1320
	goto	l709
u1320:
	line	238
	
l4226:	
;main.c: 238: PA3 = 1;
	bsf	(43/8),(43)&7
	goto	l711
	line	242
	
l709:	
	line	244
;main.c: 242: else
;main.c: 244: PA3 = 0;
	bcf	(43/8),(43)&7
	line	248
	
l711:	
	return
	opt stack 0
GLOBAL	__end_of_setPA3
	__end_of_setPA3:
;; =============== function _setPA3 ends ============

	signat	_setPA3,4216
	global	_setPA2
psect	text822,local,class=CODE,delta=2
global __ptext822
__ptext822:

;; *************** function _setPA2 *****************
;; Defined at:
;;		line 218 in file "C:\temp\dev\AK7030-OTP\main.c"
;; Parameters:    Size  Location     Type
;;  bValue          1    wreg     unsigned char 
;; Auto vars:     Size  Location     Type
;;  bValue          1    0[BANK0 ] unsigned char 
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
;;		_main
;; This function uses a non-reentrant model
;;
psect	text822
	file	"C:\temp\dev\AK7030-OTP\main.c"
	line	218
	global	__size_of_setPA2
	__size_of_setPA2	equ	__end_of_setPA2-_setPA2
	
_setPA2:	
	opt	stack 5
; Regs used in _setPA2: [wreg]
;setPA2@bValue stored from wreg
	movwf	(setPA2@bValue)
	line	219
	
l4220:	
;main.c: 219: if( bValue )
	movf	(setPA2@bValue),w
	skipz
	goto	u1310
	goto	l704
u1310:
	line	221
	
l4222:	
;main.c: 221: PA2 = 1;
	bsf	(42/8),(42)&7
	goto	l706
	line	225
	
l704:	
	line	227
;main.c: 225: else
;main.c: 227: PA2 = 0;
	bcf	(42/8),(42)&7
	line	231
	
l706:	
	return
	opt stack 0
GLOBAL	__end_of_setPA2
	__end_of_setPA2:
;; =============== function _setPA2 ends ============

	signat	_setPA2,4216
	global	_setPA1
psect	text823,local,class=CODE,delta=2
global __ptext823
__ptext823:

;; *************** function _setPA1 *****************
;; Defined at:
;;		line 200 in file "C:\temp\dev\AK7030-OTP\main.c"
;; Parameters:    Size  Location     Type
;;  bValue          1    wreg     unsigned char 
;; Auto vars:     Size  Location     Type
;;  bValue          1    0[BANK0 ] unsigned char 
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
;;		_main
;; This function uses a non-reentrant model
;;
psect	text823
	file	"C:\temp\dev\AK7030-OTP\main.c"
	line	200
	global	__size_of_setPA1
	__size_of_setPA1	equ	__end_of_setPA1-_setPA1
	
_setPA1:	
	opt	stack 5
; Regs used in _setPA1: [wreg]
;setPA1@bValue stored from wreg
	movwf	(setPA1@bValue)
	line	201
	
l4216:	
;main.c: 201: if( bValue )
	movf	(setPA1@bValue),w
	skipz
	goto	u1300
	goto	l699
u1300:
	line	203
	
l4218:	
;main.c: 203: PA1 = 1;
	bsf	(41/8),(41)&7
	goto	l701
	line	207
	
l699:	
	line	209
;main.c: 207: else
;main.c: 209: PA1 = 0;
	bcf	(41/8),(41)&7
	line	213
	
l701:	
	return
	opt stack 0
GLOBAL	__end_of_setPA1
	__end_of_setPA1:
;; =============== function _setPA1 ends ============

	signat	_setPA1,4216
	global	_setPA0
psect	text824,local,class=CODE,delta=2
global __ptext824
__ptext824:

;; *************** function _setPA0 *****************
;; Defined at:
;;		line 183 in file "C:\temp\dev\AK7030-OTP\main.c"
;; Parameters:    Size  Location     Type
;;  bValue          1    wreg     unsigned char 
;; Auto vars:     Size  Location     Type
;;  bValue          1    0[BANK0 ] unsigned char 
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
;;		_main
;; This function uses a non-reentrant model
;;
psect	text824
	file	"C:\temp\dev\AK7030-OTP\main.c"
	line	183
	global	__size_of_setPA0
	__size_of_setPA0	equ	__end_of_setPA0-_setPA0
	
_setPA0:	
	opt	stack 5
; Regs used in _setPA0: [wreg]
;setPA0@bValue stored from wreg
	movwf	(setPA0@bValue)
	line	184
	
l4212:	
;main.c: 184: if( bValue )
	movf	(setPA0@bValue),w
	skipz
	goto	u1290
	goto	l694
u1290:
	line	186
	
l4214:	
;main.c: 186: PA0 = 1;
	bsf	(40/8),(40)&7
	goto	l696
	line	190
	
l694:	
	line	192
;main.c: 190: else
;main.c: 192: PA0 = 0;
	bcf	(40/8),(40)&7
	line	196
	
l696:	
	return
	opt stack 0
GLOBAL	__end_of_setPA0
	__end_of_setPA0:
;; =============== function _setPA0 ends ============

	signat	_setPA0,4216
	global	_setPB1
psect	text825,local,class=CODE,delta=2
global __ptext825
__ptext825:

;; *************** function _setPB1 *****************
;; Defined at:
;;		line 166 in file "C:\temp\dev\AK7030-OTP\main.c"
;; Parameters:    Size  Location     Type
;;  bValue          1    wreg     unsigned char 
;; Auto vars:     Size  Location     Type
;;  bValue          1    0[BANK0 ] unsigned char 
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
;;		_main
;; This function uses a non-reentrant model
;;
psect	text825
	file	"C:\temp\dev\AK7030-OTP\main.c"
	line	166
	global	__size_of_setPB1
	__size_of_setPB1	equ	__end_of_setPB1-_setPB1
	
_setPB1:	
	opt	stack 5
; Regs used in _setPB1: [wreg]
;setPB1@bValue stored from wreg
	movwf	(setPB1@bValue)
	line	167
	
l4208:	
;main.c: 167: if( bValue )
	movf	(setPB1@bValue),w
	skipz
	goto	u1280
	goto	l689
u1280:
	line	169
	
l4210:	
;main.c: 169: PB1 = 1;
	bsf	(49/8),(49)&7
	goto	l691
	line	173
	
l689:	
	line	175
;main.c: 173: else
;main.c: 175: PB1 = 0;
	bcf	(49/8),(49)&7
	line	179
	
l691:	
	return
	opt stack 0
GLOBAL	__end_of_setPB1
	__end_of_setPB1:
;; =============== function _setPB1 ends ============

	signat	_setPB1,4216
	global	_setPB0
psect	text826,local,class=CODE,delta=2
global __ptext826
__ptext826:

;; *************** function _setPB0 *****************
;; Defined at:
;;		line 149 in file "C:\temp\dev\AK7030-OTP\main.c"
;; Parameters:    Size  Location     Type
;;  bValue          1    wreg     unsigned char 
;; Auto vars:     Size  Location     Type
;;  bValue          1    0[BANK0 ] unsigned char 
;; Return value:  Size  Location     Type
;;		None               void
;; Registers used:
;;		wreg
;; Tracked objects:
;;		On entry : 40/0
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
;;		_main
;; This function uses a non-reentrant model
;;
psect	text826
	file	"C:\temp\dev\AK7030-OTP\main.c"
	line	149
	global	__size_of_setPB0
	__size_of_setPB0	equ	__end_of_setPB0-_setPB0
	
_setPB0:	
	opt	stack 5
; Regs used in _setPB0: [wreg]
;setPB0@bValue stored from wreg
	bcf	status, 5	;RP0=0, select bank0
	movwf	(setPB0@bValue)
	line	150
	
l4204:	
;main.c: 150: if( bValue )
	movf	(setPB0@bValue),w
	skipz
	goto	u1270
	goto	l684
u1270:
	line	152
	
l4206:	
;main.c: 152: PB0 = 1;
	bsf	(48/8),(48)&7
	goto	l686
	line	156
	
l684:	
	line	158
;main.c: 156: else
;main.c: 158: PB0 = 0;
	bcf	(48/8),(48)&7
	line	162
	
l686:	
	return
	opt stack 0
GLOBAL	__end_of_setPB0
	__end_of_setPB0:
;; =============== function _setPB0 ends ============

	signat	_setPB0,4216
	global	_initPin
psect	text827,local,class=CODE,delta=2
global __ptext827
__ptext827:

;; *************** function _initPin *****************
;; Defined at:
;;		line 123 in file "C:\temp\dev\AK7030-OTP\main.c"
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
psect	text827
	file	"C:\temp\dev\AK7030-OTP\main.c"
	line	123
	global	__size_of_initPin
	__size_of_initPin	equ	__end_of_initPin-_initPin
	
_initPin:	
	opt	stack 5
; Regs used in _initPin: []
	line	125
	
l4202:	
;main.c: 125: PB6 = 1;
	bcf	status, 5	;RP0=0, select bank0
	bsf	(54/8),(54)&7
	line	126
;main.c: 126: PBOD6 = 1;
	bsf	status, 5	;RP0=1, select bank3
	bsf	status, 6	;RP1=1, select bank3
	bsf	(3142/8)^0180h,(3142)&7
	line	130
;main.c: 130: PA0 = 0;
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	bcf	(40/8),(40)&7
	line	131
;main.c: 131: PA1 = 0;
	bcf	(41/8),(41)&7
	line	132
;main.c: 132: PA2 = 0;
	bcf	(42/8),(42)&7
	line	133
;main.c: 133: PA3 = 0;
	bcf	(43/8),(43)&7
	line	134
;main.c: 134: PB0 = 0;
	bcf	(48/8),(48)&7
	line	135
;main.c: 135: PB1 = 1;
	bsf	(49/8),(49)&7
	line	136
;main.c: 136: PA6 = 0;
	bcf	(46/8),(46)&7
	line	138
;main.c: 138: PB7 = 0;
	bcf	(55/8),(55)&7
	line	139
;main.c: 139: PBOD7 = 0;
	bsf	status, 5	;RP0=1, select bank3
	bsf	status, 6	;RP1=1, select bank3
	bcf	(3143/8)^0180h,(3143)&7
	line	144
	
l681:	
	return
	opt stack 0
GLOBAL	__end_of_initPin
	__end_of_initPin:
;; =============== function _initPin ends ============

	signat	_initPin,88
	global	_clearTwentySecondsTimer
psect	text828,local,class=CODE,delta=2
global __ptext828
__ptext828:

;; *************** function _clearTwentySecondsTimer *****************
;; Defined at:
;;		line 397 in file "C:\temp\dev\AK7030-OTP\common.c"
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
psect	text828
	file	"C:\temp\dev\AK7030-OTP\common.c"
	line	397
	global	__size_of_clearTwentySecondsTimer
	__size_of_clearTwentySecondsTimer	equ	__end_of_clearTwentySecondsTimer-_clearTwentySecondsTimer
	
_clearTwentySecondsTimer:	
	opt	stack 4
; Regs used in _clearTwentySecondsTimer: [status,2]
	line	398
	
l4200:	
;common.c: 398: uiTwentySecondsTimer = 0;
	bsf	status, 5	;RP0=1, select bank1
	clrf	(_uiTwentySecondsTimer)^080h
	clrf	(_uiTwentySecondsTimer+1)^080h
	line	399
;common.c: 399: bTwentySecStartFlag = 0;
	bcf	status, 5	;RP0=0, select bank0
	clrf	(_bTwentySecStartFlag)
	line	400
	
l1825:	
	return
	opt stack 0
GLOBAL	__end_of_clearTwentySecondsTimer
	__end_of_clearTwentySecondsTimer:
;; =============== function _clearTwentySecondsTimer ends ============

	signat	_clearTwentySecondsTimer,88
	global	_clearThreeHoursTimer
psect	text829,local,class=CODE,delta=2
global __ptext829
__ptext829:

;; *************** function _clearThreeHoursTimer *****************
;; Defined at:
;;		line 391 in file "C:\temp\dev\AK7030-OTP\common.c"
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
psect	text829
	file	"C:\temp\dev\AK7030-OTP\common.c"
	line	391
	global	__size_of_clearThreeHoursTimer
	__size_of_clearThreeHoursTimer	equ	__end_of_clearThreeHoursTimer-_clearThreeHoursTimer
	
_clearThreeHoursTimer:	
	opt	stack 4
; Regs used in _clearThreeHoursTimer: [status,2]
	line	392
	
l4198:	
;common.c: 392: uiSmallTimer = 0;
	bsf	status, 5	;RP0=1, select bank1
	clrf	(_uiSmallTimer)^080h
	clrf	(_uiSmallTimer+1)^080h
	line	393
;common.c: 393: bSmallTimerStartFlag = 0;
	bcf	status, 5	;RP0=0, select bank0
	clrf	(_bSmallTimerStartFlag)
	line	394
	
l1822:	
	return
	opt stack 0
GLOBAL	__end_of_clearThreeHoursTimer
	__end_of_clearThreeHoursTimer:
;; =============== function _clearThreeHoursTimer ends ============

	signat	_clearThreeHoursTimer,88
	global	_clearTwelveHoursTimer
psect	text830,local,class=CODE,delta=2
global __ptext830
__ptext830:

;; *************** function _clearTwelveHoursTimer *****************
;; Defined at:
;;		line 384 in file "C:\temp\dev\AK7030-OTP\common.c"
;; Parameters:    Size  Location     Type
;;		None
;; Auto vars:     Size  Location     Type
;;		None
;; Return value:  Size  Location     Type
;;		None               void
;; Registers used:
;;		status,2
;; Tracked objects:
;;		On entry : 40/20
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
psect	text830
	file	"C:\temp\dev\AK7030-OTP\common.c"
	line	384
	global	__size_of_clearTwelveHoursTimer
	__size_of_clearTwelveHoursTimer	equ	__end_of_clearTwelveHoursTimer-_clearTwelveHoursTimer
	
_clearTwelveHoursTimer:	
	opt	stack 4
; Regs used in _clearTwelveHoursTimer: [status,2]
	line	385
	
l4196:	
;common.c: 385: uiBigTimer = 0;
	bsf	status, 5	;RP0=1, select bank1
	clrf	(_uiBigTimer)^080h
	clrf	(_uiBigTimer+1)^080h
	line	386
;common.c: 386: bBigTimerStartFlag = 0;
	bcf	status, 5	;RP0=0, select bank0
	clrf	(_bBigTimerStartFlag)
	line	387
	
l1819:	
	return
	opt stack 0
GLOBAL	__end_of_clearTwelveHoursTimer
	__end_of_clearTwelveHoursTimer:
;; =============== function _clearTwelveHoursTimer ends ============

	signat	_clearTwelveHoursTimer,88
	global	_ISR
psect	text831,local,class=CODE,delta=2
global __ptext831
__ptext831:

;; *************** function _ISR *****************
;; Defined at:
;;		line 477 in file "C:\temp\dev\AK7030-OTP\common.c"
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
psect	text831
	file	"C:\temp\dev\AK7030-OTP\common.c"
	line	477
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
psect	text831
	line	480
	
i1l4462:	
;common.c: 478: static unsigned char ucTimer1sCnt = 0;
;common.c: 480: if(TMR1IF == 1)
	btfss	(96/8),(96)&7
	goto	u162_21
	goto	u162_20
u162_21:
	goto	i1l4480
u162_20:
	line	482
	
i1l4464:	
;common.c: 481: {
;common.c: 482: TMR1IF = 0 ;
	bcf	(96/8),(96)&7
	line	483
	
i1l4466:	
;common.c: 483: timer.timer10msStopWatch++;
	bsf	status, 5	;RP0=1, select bank1
	incf	(_timer)^080h,f
	line	484
;common.c: 484: ucTimer1sCnt++;
	incf	(ISR@ucTimer1sCnt)^080h,f
	line	486
	
i1l4468:	
;common.c: 486: if(ucTimer1sCnt >= 100)
	movlw	(064h)
	subwf	(ISR@ucTimer1sCnt)^080h,w
	skipc
	goto	u163_21
	goto	u163_20
u163_21:
	goto	i1l4480
u163_20:
	line	488
	
i1l4470:	
;common.c: 487: {
;common.c: 488: ucTimer1sCnt = 0;
	clrf	(ISR@ucTimer1sCnt)^080h
	line	489
	
i1l4472:	
;common.c: 489: if(uiBigTimer > 0)
	movf	(_uiBigTimer+1)^080h,w
	iorwf	(_uiBigTimer)^080h,w
	skipnz
	goto	u164_21
	goto	u164_20
u164_21:
	goto	i1l1863
u164_20:
	line	490
	
i1l4474:	
;common.c: 490: uiBigTimer--;
	movlw	low(01h)
	subwf	(_uiBigTimer)^080h,f
	movlw	high(01h)
	skipc
	decf	(_uiBigTimer+1)^080h,f
	subwf	(_uiBigTimer+1)^080h,f
	
i1l1863:	
	line	492
;common.c: 492: if(uiSmallTimer)
	movf	(_uiSmallTimer+1)^080h,w
	iorwf	(_uiSmallTimer)^080h,w
	skipnz
	goto	u165_21
	goto	u165_20
u165_21:
	goto	i1l1864
u165_20:
	line	493
	
i1l4476:	
;common.c: 493: uiSmallTimer--;
	movlw	low(01h)
	subwf	(_uiSmallTimer)^080h,f
	movlw	high(01h)
	skipc
	decf	(_uiSmallTimer+1)^080h,f
	subwf	(_uiSmallTimer+1)^080h,f
	
i1l1864:	
	line	495
;common.c: 495: if(uiTwentySecondsTimer)
	movf	(_uiTwentySecondsTimer+1)^080h,w
	iorwf	(_uiTwentySecondsTimer)^080h,w
	skipnz
	goto	u166_21
	goto	u166_20
u166_21:
	goto	i1l4480
u166_20:
	line	496
	
i1l4478:	
;common.c: 496: uiTwentySecondsTimer--;
	movlw	low(01h)
	subwf	(_uiTwentySecondsTimer)^080h,f
	movlw	high(01h)
	skipc
	decf	(_uiTwentySecondsTimer+1)^080h,f
	subwf	(_uiTwentySecondsTimer+1)^080h,f
	line	500
	
i1l4480:	
;common.c: 497: }
;common.c: 498: }
;common.c: 500: if(ADIF)
	bcf	status, 5	;RP0=0, select bank0
	btfss	(106/8),(106)&7
	goto	u167_21
	goto	u167_20
u167_21:
	goto	i1l1867
u167_20:
	line	502
	
i1l4482:	
;common.c: 501: {
;common.c: 502: ADIF=0;
	bcf	(106/8),(106)&7
	line	503
	
i1l4484:	
;common.c: 503: setAD_ConvertFlag(1);
	movlw	(01h)
	fcall	i1_setAD_ConvertFlag
	line	504
	
i1l4486:	
;common.c: 504: vPutSampleDataIntoTable(adc_get(),sampleChannelSelect);
	fcall	_adc_get
	movf	(1+(?_adc_get)),w
	movwf	(?_vPutSampleDataIntoTable+1)
	movf	(0+(?_adc_get)),w
	movwf	(?_vPutSampleDataIntoTable)
	bcf	status, 5	;RP0=0, select bank0
	movf	(_sampleChannelSelect),w
	movwf	0+(?_vPutSampleDataIntoTable)+02h
	fcall	_vPutSampleDataIntoTable
	line	534
	
i1l1867:	
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
psect	text832,local,class=CODE,delta=2
global __ptext832
__ptext832:

;; *************** function i1_setAD_ConvertFlag *****************
;; Defined at:
;;		line 235 in file "C:\temp\dev\AK7030-OTP\common.c"
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
;;		On exit  : 60/20
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
psect	text832
	file	"C:\temp\dev\AK7030-OTP\common.c"
	line	235
	global	__size_ofi1_setAD_ConvertFlag
	__size_ofi1_setAD_ConvertFlag	equ	__end_ofi1_setAD_ConvertFlag-i1_setAD_ConvertFlag
	
i1_setAD_ConvertFlag:	
	opt	stack 3
; Regs used in i1_setAD_ConvertFlag: [wreg]
;i1setAD_ConvertFlag@flag stored from wreg
	movwf	(i1setAD_ConvertFlag@flag)
	line	236
	
i1l4492:	
;common.c: 236: adc_convert_flag = flag;
	movf	(i1setAD_ConvertFlag@flag),w
	bsf	status, 5	;RP0=1, select bank1
	movwf	(_adc_convert_flag)^080h
	line	237
	
i1l1785:	
	return
	opt stack 0
GLOBAL	__end_ofi1_setAD_ConvertFlag
	__end_ofi1_setAD_ConvertFlag:
;; =============== function i1_setAD_ConvertFlag ends ============

	signat	i1_setAD_ConvertFlag,88
	global	_adc_get
psect	text833,local,class=CODE,delta=2
global __ptext833
__ptext833:

;; *************** function _adc_get *****************
;; Defined at:
;;		line 105 in file "C:\temp\dev\AK7030-OTP\periph.c"
;; Parameters:    Size  Location     Type
;;		None
;; Auto vars:     Size  Location     Type
;;  val             2    2[COMMON] unsigned int 
;; Return value:  Size  Location     Type
;;                  2    0[COMMON] unsigned int 
;; Registers used:
;;		wreg
;; Tracked objects:
;;		On entry : 60/20
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
psect	text833
	file	"C:\temp\dev\AK7030-OTP\periph.c"
	line	105
	global	__size_of_adc_get
	__size_of_adc_get	equ	__end_of_adc_get-_adc_get
	
_adc_get:	
	opt	stack 3
; Regs used in _adc_get: [wreg]
	line	107
	
i1l4488:	
;periph.c: 106: unsigned int val;
;periph.c: 107: val = (ADRESH<<8) | ADRESL;
	bcf	status, 5	;RP0=0, select bank0
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
	
i1l2523:	
	return
	opt stack 0
GLOBAL	__end_of_adc_get
	__end_of_adc_get:
;; =============== function _adc_get ends ============

	signat	_adc_get,90
	global	_vPutSampleDataIntoTable
psect	text834,local,class=CODE,delta=2
global __ptext834
__ptext834:

;; *************** function _vPutSampleDataIntoTable *****************
;; Defined at:
;;		line 105 in file "C:\temp\dev\AK7030-OTP\common.c"
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
;;		On entry : 60/0
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
psect	text834
	file	"C:\temp\dev\AK7030-OTP\common.c"
	line	105
	global	__size_of_vPutSampleDataIntoTable
	__size_of_vPutSampleDataIntoTable	equ	__end_of_vPutSampleDataIntoTable-_vPutSampleDataIntoTable
	
_vPutSampleDataIntoTable:	
	opt	stack 3
; Regs used in _vPutSampleDataIntoTable: [wreg-fsr0h+status,2+status,0+btemp+1]
	line	115
	
i1l4396:	
;common.c: 107: static unsigned char ucChannelZeroLength = 0;
;common.c: 109: static unsigned char ucChannelSecondLength = 0;
;common.c: 111: static unsigned char ucChannelFifthLength = 0;
;common.c: 113: static unsigned char ucChannelSixthLength = 0;
;common.c: 115: if(channel == 0)
	movf	(vPutSampleDataIntoTable@channel),f
	skipz
	goto	u153_21
	goto	u153_20
u153_21:
	goto	i1l4408
u153_20:
	line	117
	
i1l4398:	
;common.c: 116: {
;common.c: 117: if(ucChannelZeroLength < 12)
	movlw	(0Ch)
	subwf	(vPutSampleDataIntoTable@ucChannelZeroLength),w
	skipnc
	goto	u154_21
	goto	u154_20
u154_21:
	goto	i1l4404
u154_20:
	line	119
	
i1l4400:	
;common.c: 118: {
;common.c: 119: uiSampleZero[ucChannelZeroLength] = uiSampleData;
	clrc
	rlf	(vPutSampleDataIntoTable@ucChannelZeroLength),w
	addlw	_uiSampleZero&0ffh
	movwf	fsr0
	movf	(vPutSampleDataIntoTable@uiSampleData),w
	bcf	status, 7	;select IRP bank1
	movwf	indf
	incf	fsr0,f
	movf	(vPutSampleDataIntoTable@uiSampleData+1),w
	movwf	indf
	line	121
	
i1l4402:	
;common.c: 121: ucChannelZeroLength++;
	incf	(vPutSampleDataIntoTable@ucChannelZeroLength),f
	line	122
;common.c: 122: }
	goto	i1l1767
	line	125
	
i1l4404:	
;common.c: 123: else
;common.c: 124: {
;common.c: 125: ucChannelZeroLength = 0;
	clrf	(vPutSampleDataIntoTable@ucChannelZeroLength)
	line	127
	
i1l4406:	
;common.c: 127: uiSampleZero[ucChannelZeroLength] = uiSampleData;
	clrc
	rlf	(vPutSampleDataIntoTable@ucChannelZeroLength),w
	addlw	_uiSampleZero&0ffh
	movwf	fsr0
	movf	(vPutSampleDataIntoTable@uiSampleData),w
	bcf	status, 7	;select IRP bank1
	movwf	indf
	incf	fsr0,f
	movf	(vPutSampleDataIntoTable@uiSampleData+1),w
	movwf	indf
	goto	i1l1767
	line	130
	
i1l4408:	
;common.c: 130: else if(channel == 2)
	movf	(vPutSampleDataIntoTable@channel),w
	xorlw	02h
	skipz
	goto	u155_21
	goto	u155_20
u155_21:
	goto	i1l4420
u155_20:
	line	132
	
i1l4410:	
;common.c: 131: {
;common.c: 132: if(ucChannelSecondLength < 12)
	movlw	(0Ch)
	subwf	(vPutSampleDataIntoTable@ucChannelSecondLength),w
	skipnc
	goto	u156_21
	goto	u156_20
u156_21:
	goto	i1l4416
u156_20:
	line	134
	
i1l4412:	
;common.c: 133: {
;common.c: 134: uiSampleChannelSecond[ucChannelSecondLength] = uiSampleData;
	clrc
	rlf	(vPutSampleDataIntoTable@ucChannelSecondLength),w
	addlw	_uiSampleChannelSecond&0ffh
	movwf	fsr0
	movf	(vPutSampleDataIntoTable@uiSampleData),w
	bcf	status, 7	;select IRP bank1
	movwf	indf
	incf	fsr0,f
	movf	(vPutSampleDataIntoTable@uiSampleData+1),w
	movwf	indf
	line	136
	
i1l4414:	
;common.c: 136: ucChannelSecondLength++;
	incf	(vPutSampleDataIntoTable@ucChannelSecondLength),f
	line	137
;common.c: 137: }
	goto	i1l1767
	line	140
	
i1l4416:	
;common.c: 138: else
;common.c: 139: {
;common.c: 140: ucChannelSecondLength = 0;
	clrf	(vPutSampleDataIntoTable@ucChannelSecondLength)
	line	142
	
i1l4418:	
;common.c: 142: uiSampleChannelSecond[ucChannelSecondLength] = uiSampleData;
	clrc
	rlf	(vPutSampleDataIntoTable@ucChannelSecondLength),w
	addlw	_uiSampleChannelSecond&0ffh
	movwf	fsr0
	movf	(vPutSampleDataIntoTable@uiSampleData),w
	bcf	status, 7	;select IRP bank1
	movwf	indf
	incf	fsr0,f
	movf	(vPutSampleDataIntoTable@uiSampleData+1),w
	movwf	indf
	goto	i1l1767
	line	145
	
i1l4420:	
;common.c: 145: else if(channel == 5)
	movf	(vPutSampleDataIntoTable@channel),w
	xorlw	05h
	skipz
	goto	u157_21
	goto	u157_20
u157_21:
	goto	i1l4432
u157_20:
	line	147
	
i1l4422:	
;common.c: 146: {
;common.c: 147: if(ucChannelFifthLength < 12)
	movlw	(0Ch)
	subwf	(vPutSampleDataIntoTable@ucChannelFifthLength),w
	skipnc
	goto	u158_21
	goto	u158_20
u158_21:
	goto	i1l4428
u158_20:
	line	149
	
i1l4424:	
;common.c: 148: {
;common.c: 149: uiSampleChannelFifth[ucChannelFifthLength] = uiSampleData;
	clrc
	rlf	(vPutSampleDataIntoTable@ucChannelFifthLength),w
	addlw	_uiSampleChannelFifth&0ffh
	movwf	fsr0
	movf	(vPutSampleDataIntoTable@uiSampleData),w
	bsf	status, 7	;select IRP bank3
	movwf	indf
	incf	fsr0,f
	movf	(vPutSampleDataIntoTable@uiSampleData+1),w
	movwf	indf
	line	151
	
i1l4426:	
;common.c: 151: ucChannelFifthLength++;
	incf	(vPutSampleDataIntoTable@ucChannelFifthLength),f
	line	152
;common.c: 152: }
	goto	i1l1767
	line	155
	
i1l4428:	
;common.c: 153: else
;common.c: 154: {
;common.c: 155: ucChannelFifthLength = 0;
	clrf	(vPutSampleDataIntoTable@ucChannelFifthLength)
	line	157
	
i1l4430:	
;common.c: 157: uiSampleChannelSecond[ucChannelFifthLength] = uiSampleData;
	clrc
	rlf	(vPutSampleDataIntoTable@ucChannelFifthLength),w
	addlw	_uiSampleChannelSecond&0ffh
	movwf	fsr0
	movf	(vPutSampleDataIntoTable@uiSampleData),w
	bcf	status, 7	;select IRP bank1
	movwf	indf
	incf	fsr0,f
	movf	(vPutSampleDataIntoTable@uiSampleData+1),w
	movwf	indf
	goto	i1l1767
	line	160
	
i1l4432:	
;common.c: 160: else if(channel == 6)
	movf	(vPutSampleDataIntoTable@channel),w
	xorlw	06h
	skipz
	goto	u159_21
	goto	u159_20
u159_21:
	goto	i1l4444
u159_20:
	line	162
	
i1l4434:	
;common.c: 161: {
;common.c: 162: if(ucChannelSixthLength < 12)
	movlw	(0Ch)
	subwf	(vPutSampleDataIntoTable@ucChannelSixthLength),w
	skipnc
	goto	u160_21
	goto	u160_20
u160_21:
	goto	i1l4440
u160_20:
	line	164
	
i1l4436:	
;common.c: 163: {
;common.c: 164: uiSampleChannelFifth[ucChannelSixthLength] = uiSampleData;
	clrc
	rlf	(vPutSampleDataIntoTable@ucChannelSixthLength),w
	addlw	_uiSampleChannelFifth&0ffh
	movwf	fsr0
	movf	(vPutSampleDataIntoTable@uiSampleData),w
	bsf	status, 7	;select IRP bank3
	movwf	indf
	incf	fsr0,f
	movf	(vPutSampleDataIntoTable@uiSampleData+1),w
	movwf	indf
	line	166
	
i1l4438:	
;common.c: 166: ucChannelSixthLength++;
	incf	(vPutSampleDataIntoTable@ucChannelSixthLength),f
	line	167
;common.c: 167: }
	goto	i1l1767
	line	170
	
i1l4440:	
;common.c: 168: else
;common.c: 169: {
;common.c: 170: ucChannelSixthLength = 0;
	clrf	(vPutSampleDataIntoTable@ucChannelSixthLength)
	line	172
	
i1l4442:	
;common.c: 172: uiSampleChannelSecond[ucChannelSixthLength] = uiSampleData;
	clrc
	rlf	(vPutSampleDataIntoTable@ucChannelSixthLength),w
	addlw	_uiSampleChannelSecond&0ffh
	movwf	fsr0
	movf	(vPutSampleDataIntoTable@uiSampleData),w
	bcf	status, 7	;select IRP bank1
	movwf	indf
	incf	fsr0,f
	movf	(vPutSampleDataIntoTable@uiSampleData+1),w
	movwf	indf
	goto	i1l1767
	line	177
	
i1l4444:	
;common.c: 175: else
;common.c: 176: {
;common.c: 177: ucChannelZeroLength = 0;
	clrf	(vPutSampleDataIntoTable@ucChannelZeroLength)
	line	179
;common.c: 179: ucChannelSecondLength = 0;
	clrf	(vPutSampleDataIntoTable@ucChannelSecondLength)
	line	181
;common.c: 181: ucChannelFifthLength = 0;
	clrf	(vPutSampleDataIntoTable@ucChannelFifthLength)
	line	183
;common.c: 183: ucChannelSixthLength = 0;
	clrf	(vPutSampleDataIntoTable@ucChannelSixthLength)
	line	185
;common.c: 185: for(int i = 0;i < 12; i++)
	clrf	(vPutSampleDataIntoTable@i)
	clrf	(vPutSampleDataIntoTable@i+1)
	line	187
	
i1l4450:	
;common.c: 186: {
;common.c: 187: uiSampleZero[i] = 0;
	clrc
	rlf	(vPutSampleDataIntoTable@i),w
	addlw	_uiSampleZero&0ffh
	movwf	fsr0
	bcf	status, 7	;select IRP bank1
	clrf	indf
	incf	fsr0,f
	clrf	indf
	line	189
;common.c: 189: uiSampleChannelSecond[i] = 0;
	clrc
	rlf	(vPutSampleDataIntoTable@i),w
	addlw	_uiSampleChannelSecond&0ffh
	movwf	fsr0
	clrf	indf
	incf	fsr0,f
	clrf	indf
	line	191
;common.c: 191: uiSampleChannelFifth[i] = 0;
	clrc
	rlf	(vPutSampleDataIntoTable@i),w
	addlw	_uiSampleChannelFifth&0ffh
	movwf	fsr0
	bsf	status, 7	;select IRP bank3
	clrf	indf
	incf	fsr0,f
	clrf	indf
	line	193
;common.c: 193: uiSampleChannelSixth[i] = 0;
	clrc
	rlf	(vPutSampleDataIntoTable@i),w
	addlw	_uiSampleChannelSixth&0ffh
	movwf	fsr0
	clrf	indf
	incf	fsr0,f
	clrf	indf
	line	185
	
i1l4452:	
	incf	(vPutSampleDataIntoTable@i),f
	skipnz
	incf	(vPutSampleDataIntoTable@i+1),f
	
i1l4454:	
	movf	(vPutSampleDataIntoTable@i+1),w
	xorlw	80h
	movwf	btemp+1
	movlw	(high(0Ch))^80h
	subwf	btemp+1,w
	skipz
	goto	u161_25
	movlw	low(0Ch)
	subwf	(vPutSampleDataIntoTable@i),w
u161_25:

	skipc
	goto	u161_21
	goto	u161_20
u161_21:
	goto	i1l4450
u161_20:
	line	197
	
i1l1767:	
	return
	opt stack 0
GLOBAL	__end_of_vPutSampleDataIntoTable
	__end_of_vPutSampleDataIntoTable:
;; =============== function _vPutSampleDataIntoTable ends ============

	signat	_vPutSampleDataIntoTable,8312
psect	text835,local,class=CODE,delta=2
global __ptext835
__ptext835:
	global	btemp
	btemp set 07Eh

	DABS	1,126,2	;btemp
	global	wtemp0
	wtemp0 set btemp
	end
