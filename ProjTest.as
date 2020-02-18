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
# 84 "C:\temp\dev\AK7030-OTP\main.c"
	psect config,class=CONFIG,delta=2 ;#
# 84 "C:\temp\dev\AK7030-OTP\main.c"
	dw 0x2FFF & 0x3FFF & 0x3FFF & 0x3FFF & 0x3FFF & 0x3FFF ;#
# 85 "C:\temp\dev\AK7030-OTP\main.c"
	psect config,class=CONFIG,delta=2 ;#
# 85 "C:\temp\dev\AK7030-OTP\main.c"
	dw 0x3FFF & 0x3FDF & 0x3FFF & 0x3FFE ;#
# 86 "C:\temp\dev\AK7030-OTP\main.c"
	psect config,class=CONFIG,delta=2 ;#
# 86 "C:\temp\dev\AK7030-OTP\main.c"
	dw 0X3FFF & 0x3FFF & 0x3FFF & 0x3FF8 ;#
	FNCALL	_main,_initPin
	FNCALL	_main,_clock_config
	FNCALL	_main,_timer1_config
	FNCALL	_main,_timer1_interrupt_config
	FNCALL	_main,_adc_test_init
	FNCALL	_main,_adc_start
	FNCALL	_main,_startTwentyMinuteTimer
	FNCALL	_main,_process_AD_Converter_Value
	FNCALL	_main,_isPermitSampleTime
	FNCALL	_main,_clrSampeTime
	FNCALL	_main,_getAdOriginalCh0Value
	FNCALL	_main,_isFinishedTwentyMinuteTimer
	FNCALL	_main,_clearParaFunction1
	FNCALL	_main,_setPA3
	FNCALL	_main,_setPB4
	FNCALL	_main,_getAdOriginalCh6Value
	FNCALL	_main,_startTwelveHourTimer
	FNCALL	_main,_isFinishedTwelveHoursTimer
	FNCALL	_main,_getAdOriginalCh5Value
	FNCALL	_main,_setPA1
	FNCALL	_main,_setPA0
	FNCALL	_main,_setPB0
	FNCALL	_main,_setPB1
	FNCALL	_main,_setPB2
	FNCALL	_main,_startTwentySecondsTimer
	FNCALL	_main,_isFinishedTwentySecondsTimer
	FNCALL	_main,_call_ADC4_STEP_FOURTH_PREFIX2
	FNCALL	_main,_call_ADC4_STEP_FOURTH_PREFIX3
	FNCALL	_main,_getAdOriginalCh2Value
	FNCALL	_main,_setPB6
	FNCALL	_main,_setPB6AsInput
	FNCALL	_main,_clearTwentySecondsTimer
	FNCALL	_main,_setPA6
	FNCALL	_main,_clearPinPortAndTimer
	FNCALL	_main,_startThreeHoursTimer
	FNCALL	_main,_isFinishedThreeHoursTimer
	FNCALL	_main,_clearThreeHoursTimer
	FNCALL	_main,_setPA2
	FNCALL	_main,_clearAllTimer
	FNCALL	_call_ADC4_STEP_FOURTH_PREFIX2,_getAdOriginalCh2Value
	FNCALL	_call_ADC4_STEP_FOURTH_PREFIX2,_getAdOriginalCh6Value
	FNCALL	_call_ADC4_STEP_FOURTH_PREFIX2,_setPA3
	FNCALL	_call_ADC4_STEP_FOURTH_PREFIX2,_setPB6
	FNCALL	_call_ADC4_STEP_FOURTH_PREFIX2,_setPB6AsInput
	FNCALL	_process_AD_Converter_Value,_getAD_ConvertFlag
	FNCALL	_process_AD_Converter_Value,_setAD_ConvertFlag
	FNCALL	_process_AD_Converter_Value,_AD_Sample
	FNCALL	_process_AD_Converter_Value,_adc_start
	FNCALL	_clearParaFunction1,_setPA1
	FNCALL	_clearParaFunction1,_setPA0
	FNCALL	_clearParaFunction1,_setPB0
	FNCALL	_clearParaFunction1,_setPB1
	FNCALL	_clearParaFunction1,_setPB2
	FNCALL	_clearParaFunction1,_clearAllTimer
	FNCALL	_clearParaFunction1,_setPA3
	FNCALL	_clearParaFunction1,_setPB4
	FNCALL	_clearPinPortAndTimer,_clearAllTimer
	FNCALL	_AD_Sample,_adc_test_init
	FNCALL	_getAdOriginalCh2Value,_Filter
	FNCALL	_call_ADC4_STEP_FOURTH_PREFIX3,_setPA3
	FNCALL	_call_ADC4_STEP_FOURTH_PREFIX3,_setPB4
	FNCALL	_call_ADC4_STEP_FOURTH_PREFIX3,_setPB6
	FNCALL	_call_ADC4_STEP_FOURTH_PREFIX3,_setPB6AsInput
	FNCALL	_call_ADC4_STEP_FOURTH_PREFIX3,_clearTwentySecondsTimer
	FNCALL	_getAdOriginalCh5Value,_Filter
	FNCALL	_getAdOriginalCh6Value,_Filter
	FNCALL	_getAdOriginalCh0Value,_Filter
	FNCALL	_clearAllTimer,_clearTwelveHoursTimer
	FNCALL	_clearAllTimer,_clearThreeHoursTimer
	FNCALL	_clearAllTimer,_clearTwentySecondsTimer
	FNCALL	_clearAllTimer,_clearTwentyMinuteTimer
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
	global	_bTwentyMinStartFlag
	global	_bTwentySecStartFlag
	global	_enumMainLoopStep
	global	_sampleChannelSelect
	global	_sampleTimes
	global	_ucADC4_Step
	global	_ucChannel5Type
	global	main@bCheckTweHour
	global	main@bInitFlag
	global	main@ucLoaderStep
	global	main@ucLoaderStep1
	global	main@ucLoaderStep2
	global	main@ucLoaderStep3
	global	main@ucLoaderStep4
	global	main@ucTimerCntMore
	global	main@ucTimerCntP3s
	global	main@ucTimerDelay
	global	main@ucTimerDelay1
	global	main@ucTimerDelay2
	global	main@ucTimerDelay3
	global	main@ucTimerDelay4
	global	main@ucTimerDelayP2sLess
	global	main@ucTimerDelayP2sMore
	global	main@ucTimerLargeZeroP5s
	global	main@ucTimerLessZeroP5s
	global	main@ucTimerP5s
	global	main@ucTimerRightP5s
	global	main@ucTimerZeroPoint3s
	global	main@ucTimerZeroPoint5s
	global	vPutSampleDataIntoTable@ucChannelFifthLength
	global	vPutSampleDataIntoTable@ucChannelSecondLength
	global	vPutSampleDataIntoTable@ucChannelSixthLength
	global	vPutSampleDataIntoTable@ucChannelZeroLength
	global	call_ADC4_STEP_FOURTH_PREFIX3@ucPrefix3Cnt
	global	_uiBigTimer
	global	_uiSmallTimer
	global	_uiTwentyMinuteTimer
	global	_uiTwentySecondsTimer
	global	main@uiMaxValue
	global	main@uiMinValue
	global	ISR@ucTimer1sCnt
	global	_adc_convert_flag
	global	_timer
	global	call_ADC4_STEP_FOURTH_PREFIX2@ucCompareStep
	global	call_ADC4_STEP_FOURTH_PREFIX2@ucLessThanP3sCnt
	global	call_ADC4_STEP_FOURTH_PREFIX2@ucLessThanP8sCnt
	global	call_ADC4_STEP_FOURTH_PREFIX2@ucMoreThanP3sCnt
	global	call_ADC4_STEP_FOURTH_PREFIX2@ucMoreThanP8sCnt
	global	call_ADC4_STEP_FOURTH_PREFIX2@ucPrefix2Step
	global	call_ADC4_STEP_FOURTH_PREFIX2@ucTimeCntP2s
	global	call_ADC4_STEP_FOURTH_PREFIX2@ucTimerCntLess
	global	call_ADC4_STEP_FOURTH_PREFIX2@ucTimerCntMore
	global	call_ADC4_STEP_FOURTH_PREFIX2@ucTimerCntN1
	global	call_ADC4_STEP_FOURTH_PREFIX2@ucTimerCntP5s
	global	call_ADC4_STEP_FOURTH_PREFIX3@ucPreFix3Step
	global	main@enumBranchStep
	global	main@enumInteralStep
	global	main@ucDelayPrefix4TimerP5s
	global	main@ucDelayPrefix6TimerP2s
	global	main@ucFourthSuffix1TimerP3s
	global	main@ucLessThanP3sCnt
	global	main@ucLessThanP8sCnt
	global	main@ucMoreThanP3sCnt
	global	main@ucMoreThanP8sCnt
	global	main@ucPrefix2Step
	global	main@ucTimeCntP2s
	global	main@ucTimer1s
	global	main@ucTimerCntLess
	global	main@ucTimerCntLessFlag
	global	main@ucTimerCntMoreFlag
	global	main@ucTimerCntP5s
	global	main@ucTimerLessX1P5s
	global	main@ucTimerLessX2P5s
	global	main@ucTimerP3s
	global	main@ucTimerX1P5s
	global	main@ucTimerX2P5s
	global	_uiSampleChannelFifth
	global	_uiSampleChannelSecond
	global	_uiSampleChannelSixth
	global	_uiSampleChannelZero
	global	_ADCON0
psect	text989,local,class=CODE,delta=2
global __ptext989
__ptext989:
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
	global	_PB2
_PB2	set	50
	global	_PB4
_PB4	set	52
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
call_ADC4_STEP_FOURTH_PREFIX3@ucPrefix3Cnt:
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

_bTwentyMinStartFlag:
       ds      1

_bTwentySecStartFlag:
       ds      1

_enumMainLoopStep:
       ds      1

_sampleChannelSelect:
       ds      1

_sampleTimes:
       ds      1

_ucADC4_Step:
       ds      1

_ucChannel5Type:
       ds      1

main@bCheckTweHour:
       ds      1

main@bInitFlag:
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

main@ucTimerCntMore:
       ds      1

main@ucTimerCntP3s:
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

main@ucTimerLargeZeroP5s:
       ds      1

main@ucTimerLessZeroP5s:
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

vPutSampleDataIntoTable@ucChannelZeroLength:
       ds      1

psect	bssBANK1,class=BANK1,space=1
global __pbssBANK1
__pbssBANK1:
_uiBigTimer:
       ds      2

_uiSmallTimer:
       ds      2

_uiTwentyMinuteTimer:
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

call_ADC4_STEP_FOURTH_PREFIX2@ucCompareStep:
       ds      1

call_ADC4_STEP_FOURTH_PREFIX2@ucLessThanP3sCnt:
       ds      1

call_ADC4_STEP_FOURTH_PREFIX2@ucLessThanP8sCnt:
       ds      1

call_ADC4_STEP_FOURTH_PREFIX2@ucMoreThanP3sCnt:
       ds      1

call_ADC4_STEP_FOURTH_PREFIX2@ucMoreThanP8sCnt:
       ds      1

call_ADC4_STEP_FOURTH_PREFIX2@ucPrefix2Step:
       ds      1

call_ADC4_STEP_FOURTH_PREFIX2@ucTimeCntP2s:
       ds      1

call_ADC4_STEP_FOURTH_PREFIX2@ucTimerCntLess:
       ds      1

call_ADC4_STEP_FOURTH_PREFIX2@ucTimerCntMore:
       ds      1

call_ADC4_STEP_FOURTH_PREFIX2@ucTimerCntN1:
       ds      1

call_ADC4_STEP_FOURTH_PREFIX2@ucTimerCntP5s:
       ds      1

call_ADC4_STEP_FOURTH_PREFIX3@ucPreFix3Step:
       ds      1

main@enumBranchStep:
       ds      1

main@enumInteralStep:
       ds      1

main@ucDelayPrefix4TimerP5s:
       ds      1

main@ucDelayPrefix6TimerP2s:
       ds      1

main@ucFourthSuffix1TimerP3s:
       ds      1

main@ucLessThanP3sCnt:
       ds      1

main@ucLessThanP8sCnt:
       ds      1

main@ucMoreThanP3sCnt:
       ds      1

main@ucMoreThanP8sCnt:
       ds      1

main@ucPrefix2Step:
       ds      1

main@ucTimeCntP2s:
       ds      1

main@ucTimer1s:
       ds      1

main@ucTimerCntLess:
       ds      1

main@ucTimerCntLessFlag:
       ds      1

main@ucTimerCntMoreFlag:
       ds      1

main@ucTimerCntP5s:
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

_uiSampleChannelZero:
       ds      24

psect	bssBANK3,class=BANK3,space=1
global __pbssBANK3
__pbssBANK3:
_uiSampleChannelFifth:
       ds      24

_uiSampleChannelSecond:
       ds      24

_uiSampleChannelSixth:
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
	movlw	low((__pbssBANK1)+048h)
	fcall	clear_ram
; Clear objects allocated to BANK3
psect cinit,class=CODE,delta=2
	bsf	status, 7	;select IRP bank2
	movlw	low(__pbssBANK3)
	movwf	fsr
	movlw	low((__pbssBANK3)+048h)
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
	global	?_clearTwentyMinuteTimer
?_clearTwentyMinuteTimer:	; 0 bytes @ 0x0
	global	?_clock_config
?_clock_config:	; 0 bytes @ 0x0
	global	?_timer1_config
?_timer1_config:	; 0 bytes @ 0x0
	global	?_timer1_interrupt_config
?_timer1_interrupt_config:	; 0 bytes @ 0x0
	global	?_adc_start
?_adc_start:	; 0 bytes @ 0x0
	global	?_process_AD_Converter_Value
?_process_AD_Converter_Value:	; 0 bytes @ 0x0
	global	?_clrSampeTime
?_clrSampeTime:	; 0 bytes @ 0x0
	global	?_startTwentySecondsTimer
?_startTwentySecondsTimer:	; 0 bytes @ 0x0
	global	?_call_ADC4_STEP_FOURTH_PREFIX2
?_call_ADC4_STEP_FOURTH_PREFIX2:	; 0 bytes @ 0x0
	global	?_call_ADC4_STEP_FOURTH_PREFIX3
?_call_ADC4_STEP_FOURTH_PREFIX3:	; 0 bytes @ 0x0
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
	global	?_setPB2
?_setPB2:	; 0 bytes @ 0x0
	global	?_setPA0
?_setPA0:	; 0 bytes @ 0x0
	global	?_setPA1
?_setPA1:	; 0 bytes @ 0x0
	global	?_setPA2
?_setPA2:	; 0 bytes @ 0x0
	global	?_setPA3
?_setPA3:	; 0 bytes @ 0x0
	global	?_setPB6
?_setPB6:	; 0 bytes @ 0x0
	global	?_setPB4
?_setPB4:	; 0 bytes @ 0x0
	global	?_setPA6
?_setPA6:	; 0 bytes @ 0x0
	global	?_setPB6AsInput
?_setPB6AsInput:	; 0 bytes @ 0x0
	global	?_clearParaFunction1
?_clearParaFunction1:	; 0 bytes @ 0x0
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
	global	?_isFinishedTwentyMinuteTimer
?_isFinishedTwentyMinuteTimer:	; 1 bytes @ 0x0
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
	global	??_clearTwentyMinuteTimer
??_clearTwentyMinuteTimer:	; 0 bytes @ 0x0
	global	??_clock_config
??_clock_config:	; 0 bytes @ 0x0
	global	??_timer1_config
??_timer1_config:	; 0 bytes @ 0x0
	global	??_timer1_interrupt_config
??_timer1_interrupt_config:	; 0 bytes @ 0x0
	global	?_adc_test_init
?_adc_test_init:	; 0 bytes @ 0x0
	global	??_adc_start
??_adc_start:	; 0 bytes @ 0x0
	global	?_startTwentyMinuteTimer
?_startTwentyMinuteTimer:	; 0 bytes @ 0x0
	global	??_isPermitSampleTime
??_isPermitSampleTime:	; 0 bytes @ 0x0
	global	??_clrSampeTime
??_clrSampeTime:	; 0 bytes @ 0x0
	global	??_isFinishedTwentyMinuteTimer
??_isFinishedTwentyMinuteTimer:	; 0 bytes @ 0x0
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
	global	??_setPB2
??_setPB2:	; 0 bytes @ 0x0
	global	??_setPA0
??_setPA0:	; 0 bytes @ 0x0
	global	??_setPA1
??_setPA1:	; 0 bytes @ 0x0
	global	??_setPA2
??_setPA2:	; 0 bytes @ 0x0
	global	??_setPA3
??_setPA3:	; 0 bytes @ 0x0
	global	??_setPB6
??_setPB6:	; 0 bytes @ 0x0
	global	??_setPB4
??_setPB4:	; 0 bytes @ 0x0
	global	??_setPA6
??_setPA6:	; 0 bytes @ 0x0
	global	??_setPB6AsInput
??_setPB6AsInput:	; 0 bytes @ 0x0
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
	global	setPB2@bValue
setPB2@bValue:	; 1 bytes @ 0x0
	global	setPA0@bValue
setPA0@bValue:	; 1 bytes @ 0x0
	global	setPA1@bValue
setPA1@bValue:	; 1 bytes @ 0x0
	global	setPA2@bValue
setPA2@bValue:	; 1 bytes @ 0x0
	global	setPA3@bValue
setPA3@bValue:	; 1 bytes @ 0x0
	global	setPB6@bValue
setPB6@bValue:	; 1 bytes @ 0x0
	global	setPB4@bValue
setPB4@bValue:	; 1 bytes @ 0x0
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
	global	startTwentyMinuteTimer@uiValue
startTwentyMinuteTimer@uiValue:	; 2 bytes @ 0x0
	ds	1
	global	??_adc_test_init
??_adc_test_init:	; 0 bytes @ 0x1
	global	??_call_ADC4_STEP_FOURTH_PREFIX3
??_call_ADC4_STEP_FOURTH_PREFIX3:	; 0 bytes @ 0x1
	global	??_clearParaFunction1
??_clearParaFunction1:	; 0 bytes @ 0x1
	global	call_ADC4_STEP_FOURTH_PREFIX3@bClearStep
call_ADC4_STEP_FOURTH_PREFIX3@bClearStep:	; 1 bytes @ 0x1
	ds	1
	global	??_startTwentyMinuteTimer
??_startTwentyMinuteTimer:	; 0 bytes @ 0x2
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
	global	?_getAdOriginalCh0Value
?_getAdOriginalCh0Value:	; 2 bytes @ 0x26
	global	?_getAdOriginalCh6Value
?_getAdOriginalCh6Value:	; 2 bytes @ 0x26
	global	?_getAdOriginalCh5Value
?_getAdOriginalCh5Value:	; 2 bytes @ 0x26
	global	?_getAdOriginalCh2Value
?_getAdOriginalCh2Value:	; 2 bytes @ 0x26
	ds	2
	global	??_getAdOriginalCh0Value
??_getAdOriginalCh0Value:	; 0 bytes @ 0x28
	global	??_getAdOriginalCh6Value
??_getAdOriginalCh6Value:	; 0 bytes @ 0x28
	global	??_getAdOriginalCh5Value
??_getAdOriginalCh5Value:	; 0 bytes @ 0x28
	global	??_call_ADC4_STEP_FOURTH_PREFIX2
??_call_ADC4_STEP_FOURTH_PREFIX2:	; 0 bytes @ 0x28
	global	??_getAdOriginalCh2Value
??_getAdOriginalCh2Value:	; 0 bytes @ 0x28
	global	??_main
??_main:	; 0 bytes @ 0x28
	global	main@uiCh5Value
main@uiCh5Value:	; 2 bytes @ 0x28
	ds	2
;;Data sizes: Strings 0, constant 0, data 0, bss 182, persistent 0 stack 0
;;Auto spaces:   Size  Autos    Used
;; COMMON          14     13      14
;; BANK0           80     42      79
;; BANK1           80      0      72
;; BANK3           96      0      72
;; BANK2           96      0       0

;;
;; Pointer list with targets:

;; ?_adc_get	unsigned int  size(1) Largest target is 0
;;
;; ?_getAdOriginalCh2Value	unsigned int  size(1) Largest target is 0
;;
;; ?_getAdOriginalCh6Value	unsigned int  size(1) Largest target is 0
;;
;; ?_getAdOriginalCh5Value	unsigned int  size(1) Largest target is 0
;;
;; ?_getAdOriginalCh0Value	unsigned int  size(1) Largest target is 0
;;
;; ?_Filter	unsigned int  size(1) Largest target is 0
;;
;; Filter@tmpValue	PTR int  size(2) Largest target is 24
;;		 -> uiSampleChannelSixth(BANK3[24]), uiSampleChannelFifth(BANK3[24]), uiSampleChannelSecond(BANK3[24]), uiSampleChannelZero(BANK1[24]), 
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
;;   _main->_getAdOriginalCh0Value
;;   _main->_getAdOriginalCh6Value
;;   _main->_getAdOriginalCh5Value
;;   _main->_getAdOriginalCh2Value
;;   _call_ADC4_STEP_FOURTH_PREFIX2->_getAdOriginalCh2Value
;;   _call_ADC4_STEP_FOURTH_PREFIX2->_getAdOriginalCh6Value
;;   _clearParaFunction1->_setPA1
;;   _clearParaFunction1->_setPA0
;;   _clearParaFunction1->_setPB0
;;   _clearParaFunction1->_setPB1
;;   _clearParaFunction1->_setPB2
;;   _clearParaFunction1->_setPA3
;;   _clearParaFunction1->_setPB4
;;   _AD_Sample->_adc_test_init
;;   _getAdOriginalCh2Value->_Filter
;;   _call_ADC4_STEP_FOURTH_PREFIX3->_setPA3
;;   _call_ADC4_STEP_FOURTH_PREFIX3->_setPB4
;;   _call_ADC4_STEP_FOURTH_PREFIX3->_setPB6
;;   _getAdOriginalCh5Value->_Filter
;;   _getAdOriginalCh6Value->_Filter
;;   _getAdOriginalCh0Value->_Filter
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
;; (0) _main                                                 2     2      0    4493
;;                                             40 BANK0      2     2      0
;;                            _initPin
;;                       _clock_config
;;                      _timer1_config
;;            _timer1_interrupt_config
;;                      _adc_test_init
;;                          _adc_start
;;             _startTwentyMinuteTimer
;;         _process_AD_Converter_Value
;;                 _isPermitSampleTime
;;                       _clrSampeTime
;;              _getAdOriginalCh0Value
;;        _isFinishedTwentyMinuteTimer
;;                 _clearParaFunction1
;;                             _setPA3
;;                             _setPB4
;;              _getAdOriginalCh6Value
;;               _startTwelveHourTimer
;;         _isFinishedTwelveHoursTimer
;;              _getAdOriginalCh5Value
;;                             _setPA1
;;                             _setPA0
;;                             _setPB0
;;                             _setPB1
;;                             _setPB2
;;            _startTwentySecondsTimer
;;       _isFinishedTwentySecondsTimer
;;      _call_ADC4_STEP_FOURTH_PREFIX2
;;      _call_ADC4_STEP_FOURTH_PREFIX3
;;              _getAdOriginalCh2Value
;;                             _setPB6
;;                      _setPB6AsInput
;;            _clearTwentySecondsTimer
;;                             _setPA6
;;               _clearPinPortAndTimer
;;               _startThreeHoursTimer
;;          _isFinishedThreeHoursTimer
;;               _clearThreeHoursTimer
;;                             _setPA2
;;                      _clearAllTimer
;; ---------------------------------------------------------------------------------
;; (1) _call_ADC4_STEP_FOURTH_PREFIX2                        0     0      0    1284
;;              _getAdOriginalCh2Value
;;              _getAdOriginalCh6Value
;;                             _setPA3
;;                             _setPB6
;;                      _setPB6AsInput
;; ---------------------------------------------------------------------------------
;; (1) _process_AD_Converter_Value                           0     0      0      66
;;                  _getAD_ConvertFlag
;;                  _setAD_ConvertFlag
;;                          _AD_Sample
;;                          _adc_start
;; ---------------------------------------------------------------------------------
;; (1) _clearParaFunction1                                   0     0      0     154
;;                             _setPA1
;;                             _setPA0
;;                             _setPB0
;;                             _setPB1
;;                             _setPB2
;;                      _clearAllTimer
;;                             _setPA3
;;                             _setPB4
;; ---------------------------------------------------------------------------------
;; (1) _clearPinPortAndTimer                                 0     0      0       0
;;                      _clearAllTimer
;; ---------------------------------------------------------------------------------
;; (2) _AD_Sample                                            0     0      0      44
;;                      _adc_test_init
;; ---------------------------------------------------------------------------------
;; (1) _getAdOriginalCh2Value                                2     0      2     620
;;                                             38 BANK0      2     0      2
;;                             _Filter
;; ---------------------------------------------------------------------------------
;; (1) _call_ADC4_STEP_FOURTH_PREFIX3                        1     1      0      89
;;                                              1 BANK0      1     1      0
;;                             _setPA3
;;                             _setPB4
;;                             _setPB6
;;                      _setPB6AsInput
;;            _clearTwentySecondsTimer
;; ---------------------------------------------------------------------------------
;; (1) _getAdOriginalCh5Value                                2     0      2     620
;;                                             38 BANK0      2     0      2
;;                             _Filter
;; ---------------------------------------------------------------------------------
;; (2) _getAdOriginalCh6Value                                2     0      2     620
;;                                             38 BANK0      2     0      2
;;                             _Filter
;; ---------------------------------------------------------------------------------
;; (1) _getAdOriginalCh0Value                                2     0      2     620
;;                                             38 BANK0      2     0      2
;;                             _Filter
;; ---------------------------------------------------------------------------------
;; (1) _clearAllTimer                                        0     0      0       0
;;              _clearTwelveHoursTimer
;;               _clearThreeHoursTimer
;;            _clearTwentySecondsTimer
;;             _clearTwentyMinuteTimer
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
;; (1) _isFinishedTwentyMinuteTimer                          0     0      0       0
;; ---------------------------------------------------------------------------------
;; (1) _clrSampeTime                                         0     0      0       0
;; ---------------------------------------------------------------------------------
;; (1) _isPermitSampleTime                                   0     0      0       0
;; ---------------------------------------------------------------------------------
;; (1) _startTwentyMinuteTimer                               2     0      2      22
;;                                              0 BANK0      2     0      2
;; ---------------------------------------------------------------------------------
;; (2) _adc_start                                            0     0      0       0
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
;; (1) _setPB6AsInput                                        0     0      0       0
;; ---------------------------------------------------------------------------------
;; (1) _setPA6                                               1     1      0      22
;;                                              0 BANK0      1     1      0
;; ---------------------------------------------------------------------------------
;; (2) _setPB4                                               1     1      0      22
;;                                              0 BANK0      1     1      0
;; ---------------------------------------------------------------------------------
;; (1) _setPB6                                               1     1      0      22
;;                                              0 BANK0      1     1      0
;; ---------------------------------------------------------------------------------
;; (2) _setPA3                                               1     1      0      22
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
;; (1) _setPB2                                               1     1      0      22
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
;; (2) _clearTwentyMinuteTimer                               0     0      0       0
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
;;   _adc_start
;;   _startTwentyMinuteTimer
;;   _process_AD_Converter_Value
;;     _getAD_ConvertFlag
;;     _setAD_ConvertFlag
;;     _AD_Sample
;;       _adc_test_init
;;     _adc_start
;;   _isPermitSampleTime
;;   _clrSampeTime
;;   _getAdOriginalCh0Value
;;     _Filter
;;   _isFinishedTwentyMinuteTimer
;;   _clearParaFunction1
;;     _setPA1
;;     _setPA0
;;     _setPB0
;;     _setPB1
;;     _setPB2
;;     _clearAllTimer
;;       _clearTwelveHoursTimer
;;       _clearThreeHoursTimer
;;       _clearTwentySecondsTimer
;;       _clearTwentyMinuteTimer
;;     _setPA3
;;     _setPB4
;;   _setPA3
;;   _setPB4
;;   _getAdOriginalCh6Value
;;     _Filter
;;   _startTwelveHourTimer
;;   _isFinishedTwelveHoursTimer
;;   _getAdOriginalCh5Value
;;     _Filter
;;   _setPA1
;;   _setPA0
;;   _setPB0
;;   _setPB1
;;   _setPB2
;;   _startTwentySecondsTimer
;;   _isFinishedTwentySecondsTimer
;;   _call_ADC4_STEP_FOURTH_PREFIX2
;;     _getAdOriginalCh2Value
;;       _Filter
;;     _getAdOriginalCh6Value
;;       _Filter
;;     _setPA3
;;     _setPB6
;;     _setPB6AsInput
;;   _call_ADC4_STEP_FOURTH_PREFIX3
;;     _setPA3
;;     _setPB4
;;     _setPB6
;;     _setPB6AsInput
;;     _clearTwentySecondsTimer
;;   _getAdOriginalCh2Value
;;     _Filter
;;   _setPB6
;;   _setPB6AsInput
;;   _clearTwentySecondsTimer
;;   _setPA6
;;   _clearPinPortAndTimer
;;     _clearAllTimer
;;       _clearTwelveHoursTimer
;;       _clearThreeHoursTimer
;;       _clearTwentySecondsTimer
;;       _clearTwentyMinuteTimer
;;   _startThreeHoursTimer
;;   _isFinishedThreeHoursTimer
;;   _clearThreeHoursTimer
;;   _setPA2
;;   _clearAllTimer
;;     _clearTwelveHoursTimer
;;     _clearThreeHoursTimer
;;     _clearTwentySecondsTimer
;;     _clearTwentyMinuteTimer
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
;;ABS                  0      0      ED       3        0.0%
;;BITBANK0            50      0       0       4        0.0%
;;BITSFR3              0      0       0       4        0.0%
;;SFR3                 0      0       0       4        0.0%
;;BANK0               50     2A      4F       5       98.8%
;;BITSFR2              0      0       0       5        0.0%
;;SFR2                 0      0       0       5        0.0%
;;DATA                 0      0      F4       6        0.0%
;;BITBANK1            50      0       0       7        0.0%
;;BANK1               50      0      48       8       90.0%
;;BITBANK3            60      0       0       9        0.0%
;;BANK3               60      0      48      10       75.0%
;;BITBANK2            60      0       0      11        0.0%
;;BANK2               60      0       0      12        0.0%

	global	_main
psect	maintext,global,class=CODE,delta=2
global __pmaintext
__pmaintext:

;; *************** function _main *****************
;; Defined at:
;;		line 672 in file "C:\temp\dev\AK7030-OTP\main.c"
;; Parameters:    Size  Location     Type
;;		None
;; Auto vars:     Size  Location     Type
;;  uiCh5Value      2   40[BANK0 ] unsigned int 
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
;;      Locals:         0       2       0       0       0
;;      Temps:          0       0       0       0       0
;;      Totals:         0       2       0       0       0
;;Total ram usage:        2 bytes
;; Hardware stack levels required when called:    5
;; This function calls:
;;		_initPin
;;		_clock_config
;;		_timer1_config
;;		_timer1_interrupt_config
;;		_adc_test_init
;;		_adc_start
;;		_startTwentyMinuteTimer
;;		_process_AD_Converter_Value
;;		_isPermitSampleTime
;;		_clrSampeTime
;;		_getAdOriginalCh0Value
;;		_isFinishedTwentyMinuteTimer
;;		_clearParaFunction1
;;		_setPA3
;;		_setPB4
;;		_getAdOriginalCh6Value
;;		_startTwelveHourTimer
;;		_isFinishedTwelveHoursTimer
;;		_getAdOriginalCh5Value
;;		_setPA1
;;		_setPA0
;;		_setPB0
;;		_setPB1
;;		_setPB2
;;		_startTwentySecondsTimer
;;		_isFinishedTwentySecondsTimer
;;		_call_ADC4_STEP_FOURTH_PREFIX2
;;		_call_ADC4_STEP_FOURTH_PREFIX3
;;		_getAdOriginalCh2Value
;;		_setPB6
;;		_setPB6AsInput
;;		_clearTwentySecondsTimer
;;		_setPA6
;;		_clearPinPortAndTimer
;;		_startThreeHoursTimer
;;		_isFinishedThreeHoursTimer
;;		_clearThreeHoursTimer
;;		_setPA2
;;		_clearAllTimer
;; This function is called by:
;;		Startup code after reset
;; This function uses a non-reentrant model
;;
psect	maintext
	file	"C:\temp\dev\AK7030-OTP\main.c"
	line	672
	global	__size_of_main
	__size_of_main	equ	__end_of_main-_main
	
_main:	
	opt	stack 3
; Regs used in _main: [wreg-fsr0h+status,2+status,0+btemp+1+pclath+cstack]
	line	688
	
l5257:	
;main.c: 682: static unsigned char bCheckTweHour = 0;
;main.c: 688: initPin();
	fcall	_initPin
	line	691
	
l5259:	
;main.c: 691: TRISB3 = 1;
	bsf	(1075/8)^080h,(1075)&7
	line	693
	
l5261:	
;main.c: 693: TRISB5 = 1;
	bsf	(1077/8)^080h,(1077)&7
	line	695
	
l5263:	
;main.c: 695: TRISA7 = 1;
	bsf	(1071/8)^080h,(1071)&7
	line	697
	
l5265:	
;main.c: 697: TRISA6 = 1;
	bsf	(1070/8)^080h,(1070)&7
	line	699
	
l5267:	
;main.c: 699: clock_config();
	fcall	_clock_config
	line	700
	
l5269:	
;main.c: 700: timer1_config();
	fcall	_timer1_config
	line	701
;main.c: 701: timer1_interrupt_config();
	fcall	_timer1_interrupt_config
	line	703
	
l5271:	
;main.c: 703: adc_test_init(0,3);
	movlw	(03h)
	bcf	status, 5	;RP0=0, select bank0
	movwf	(?_adc_test_init)
	movlw	(0)
	fcall	_adc_test_init
	line	710
	
l5273:	
;main.c: 710: adc_start();
	fcall	_adc_start
	line	723
;main.c: 723: startTwentyMinuteTimer(60);
	movlw	03Ch
	movwf	(?_startTwentyMinuteTimer)
	clrf	(?_startTwentyMinuteTimer+1)
	fcall	_startTwentyMinuteTimer
	line	728
	
l5275:	
# 728 "C:\temp\dev\AK7030-OTP\main.c"
 clrwdt ;#
psect	maintext
	line	730
;main.c: 730: process_AD_Converter_Value();
	fcall	_process_AD_Converter_Value
	line	732
	
l5277:	
;main.c: 732: if( isPermitSampleTime() )
	fcall	_isPermitSampleTime
	xorlw	0
	skipnz
	goto	u2341
	goto	u2340
u2341:
	goto	l5275
u2340:
	line	736
	
l5279:	
;main.c: 733: {
;main.c: 736: clrSampeTime();
	fcall	_clrSampeTime
	line	751
;main.c: 751: switch(enumMainLoopStep)
	goto	l6017
	line	761
	
l5281:	
;main.c: 754: {
;main.c: 759: static unsigned char ucTimerZeroPoint5s = 0;
;main.c: 761: if(getAdOriginalCh0Value() <= 1950)
	fcall	_getAdOriginalCh0Value
	movlw	high(079Fh)
	subwf	(1+(?_getAdOriginalCh0Value)),w
	movlw	low(079Fh)
	skipnz
	subwf	(0+(?_getAdOriginalCh0Value)),w
	skipnc
	goto	u2351
	goto	u2350
u2351:
	goto	l5285
u2350:
	line	763
	
l5283:	
;main.c: 762: {
;main.c: 763: ucTimerZeroPoint5s++;
	incf	(main@ucTimerZeroPoint5s),f
	line	764
;main.c: 764: }
	goto	l5287
	line	766
	
l5285:	
;main.c: 765: else
;main.c: 766: ucTimerZeroPoint5s = 0;
	clrf	(main@ucTimerZeroPoint5s)
	line	768
	
l5287:	
;main.c: 768: if(ucTimerZeroPoint5s >= 5)
	movlw	(05h)
	subwf	(main@ucTimerZeroPoint5s),w
	skipc
	goto	u2361
	goto	u2360
u2361:
	goto	l5293
u2360:
	line	770
	
l5289:	
;main.c: 769: {
;main.c: 770: ucTimerZeroPoint5s = 0;
	clrf	(main@ucTimerZeroPoint5s)
	line	771
	
l5291:	
;main.c: 771: enumMainLoopStep = MAIN_LOOP_STEP_FIRST;
	clrf	(_enumMainLoopStep)
	incf	(_enumMainLoopStep),f
	line	774
	
l5293:	
;main.c: 772: }
;main.c: 774: if(isFinishedTwentyMinuteTimer())
	fcall	_isFinishedTwentyMinuteTimer
	xorlw	0
	skipnz
	goto	u2371
	goto	u2370
u2371:
	goto	l5275
u2370:
	line	775
	
l5295:	
;main.c: 775: enumMainLoopStep = MAIN_LOOP_STEP_10_HOUR_END;
	movlw	(09h)
	bcf	status, 5	;RP0=0, select bank0
	movwf	(_enumMainLoopStep)
	goto	l5275
	
l772:	
	line	776
;main.c: 776: break;
	goto	l5275
	line	790
	
l5297:	
;main.c: 780: {
;main.c: 785: static unsigned char ucTimerZeroPoint3s = 0;
;main.c: 787: static unsigned char ucTimerCntP3s = 0;
;main.c: 790: if(getAdOriginalCh0Value() <= 1950)
	fcall	_getAdOriginalCh0Value
	movlw	high(079Fh)
	subwf	(1+(?_getAdOriginalCh0Value)),w
	movlw	low(079Fh)
	skipnz
	subwf	(0+(?_getAdOriginalCh0Value)),w
	skipnc
	goto	u2381
	goto	u2380
u2381:
	goto	l5309
u2380:
	line	792
	
l5299:	
;main.c: 791: {
;main.c: 792: ucTimerCntP3s++;
	incf	(main@ucTimerCntP3s),f
	line	793
	
l5301:	
;main.c: 793: if(ucTimerCntP3s >= 3)
	movlw	(03h)
	subwf	(main@ucTimerCntP3s),w
	skipc
	goto	u2391
	goto	u2390
u2391:
	goto	l772
u2390:
	line	795
	
l5303:	
;main.c: 794: {
;main.c: 795: ucTimerCntP3s = 0;
	clrf	(main@ucTimerCntP3s)
	line	797
	
l5305:	
;main.c: 797: enumMainLoopStep = MAIN_LOOP_STEP_SECOND;
	movlw	(02h)
	movwf	(_enumMainLoopStep)
	line	799
	
l5307:	
;main.c: 799: ucTimerZeroPoint3s = 0;
	clrf	(main@ucTimerZeroPoint3s)
	goto	l5275
	line	805
	
l5309:	
;main.c: 803: else
;main.c: 804: {
;main.c: 805: ucTimerZeroPoint3s++;
	incf	(main@ucTimerZeroPoint3s),f
	line	807
	
l5311:	
;main.c: 807: if(ucTimerZeroPoint3s >= 3)
	movlw	(03h)
	subwf	(main@ucTimerZeroPoint3s),w
	skipc
	goto	u2401
	goto	u2400
u2401:
	goto	l772
u2400:
	line	809
	
l5313:	
;main.c: 808: {
;main.c: 809: ucTimerZeroPoint3s = 0;
	clrf	(main@ucTimerZeroPoint3s)
	line	811
	
l5315:	
;main.c: 811: clearParaFunction1();
	fcall	_clearParaFunction1
	goto	l5275
	line	826
	
l5317:	
;main.c: 819: {
;main.c: 824: static unsigned char ucTimerP5s = 0;
;main.c: 826: setPA3(1);
	movlw	(01h)
	fcall	_setPA3
	line	827
;main.c: 827: setPB4(1);
	movlw	(01h)
	fcall	_setPB4
	line	829
	
l5319:	
;main.c: 829: if(ucTimerP5s < 5)
	movlw	(05h)
	subwf	(main@ucTimerP5s),w
	skipnc
	goto	u2411
	goto	u2410
u2411:
	goto	l5323
u2410:
	line	830
	
l5321:	
;main.c: 830: ucTimerP5s++;
	incf	(main@ucTimerP5s),f
	goto	l5275
	line	833
	
l5323:	
;main.c: 831: else
;main.c: 832: {
;main.c: 833: ucTimerP5s = 0;
	clrf	(main@ucTimerP5s)
	line	835
	
l5325:	
;main.c: 835: startTwentyMinuteTimer(60);
	movlw	03Ch
	movwf	(?_startTwentyMinuteTimer)
	clrf	(?_startTwentyMinuteTimer+1)
	fcall	_startTwentyMinuteTimer
	line	837
	
l5327:	
;main.c: 837: enumMainLoopStep = MAIN_LOOP_STEP_THIRD;
	movlw	(03h)
	bcf	status, 5	;RP0=0, select bank0
	movwf	(_enumMainLoopStep)
	goto	l5275
	line	856
	
l5329:	
;main.c: 844: {
;main.c: 849: static unsigned char ucTimerLessZeroP5s = 0;
;main.c: 851: static unsigned char ucTimerLargeZeroP5s = 0;
;main.c: 854: static unsigned char ucTimerRightP5s = 0;
;main.c: 856: if(getAdOriginalCh6Value() <= 85)
	fcall	_getAdOriginalCh6Value
	movlw	high(056h)
	subwf	(1+(?_getAdOriginalCh6Value)),w
	movlw	low(056h)
	skipnz
	subwf	(0+(?_getAdOriginalCh6Value)),w
	skipnc
	goto	u2421
	goto	u2420
u2421:
	goto	l5335
u2420:
	line	858
	
l5331:	
;main.c: 857: {
;main.c: 858: ucTimerLargeZeroP5s = 0;
	clrf	(main@ucTimerLargeZeroP5s)
	line	860
	
l5333:	
;main.c: 860: ucTimerLessZeroP5s++;
	incf	(main@ucTimerLessZeroP5s),f
	line	861
;main.c: 861: }
	goto	l5341
	line	864
	
l5335:	
;main.c: 862: else
;main.c: 863: {
;main.c: 864: ucTimerLargeZeroP5s++;
	incf	(main@ucTimerLargeZeroP5s),f
	line	866
	
l5337:	
;main.c: 866: ucTimerLessZeroP5s = 0;
	clrf	(main@ucTimerLessZeroP5s)
	line	868
	
l5339:	
;main.c: 868: ucTimerRightP5s = 0;
	clrf	(main@ucTimerRightP5s)
	line	871
	
l5341:	
;main.c: 869: }
;main.c: 871: if(ucTimerLargeZeroP5s >= 3)
	movlw	(03h)
	subwf	(main@ucTimerLargeZeroP5s),w
	skipc
	goto	u2431
	goto	u2430
u2431:
	goto	l5347
u2430:
	line	873
	
l5343:	
;main.c: 872: {
;main.c: 873: ucTimerLargeZeroP5s = 0;
	clrf	(main@ucTimerLargeZeroP5s)
	line	874
	
l5345:	
;main.c: 874: enumMainLoopStep = MAIN_LOOP_STEP_FOURTH;
	movlw	(04h)
	movwf	(_enumMainLoopStep)
	line	875
;main.c: 875: }
	goto	l5361
	line	876
	
l5347:	
;main.c: 876: else if( ucTimerLessZeroP5s >= 3)
	movlw	(03h)
	subwf	(main@ucTimerLessZeroP5s),w
	skipc
	goto	u2441
	goto	u2440
u2441:
	goto	l5361
u2440:
	line	879
	
l5349:	
;main.c: 877: {
;main.c: 879: if(getAdOriginalCh6Value() < 65)
	fcall	_getAdOriginalCh6Value
	movlw	high(041h)
	subwf	(1+(?_getAdOriginalCh6Value)),w
	movlw	low(041h)
	skipnz
	subwf	(0+(?_getAdOriginalCh6Value)),w
	skipnc
	goto	u2451
	goto	u2450
u2451:
	goto	l5353
u2450:
	line	881
	
l5351:	
;main.c: 880: {
;main.c: 881: ucTimerRightP5s++;
	incf	(main@ucTimerRightP5s),f
	line	882
;main.c: 882: }
	goto	l5355
	line	885
	
l5353:	
;main.c: 883: else
;main.c: 884: {
;main.c: 885: ucTimerRightP5s = 0;
	clrf	(main@ucTimerRightP5s)
	line	888
	
l5355:	
;main.c: 886: }
;main.c: 888: if(ucTimerRightP5s >= 3)
	movlw	(03h)
	subwf	(main@ucTimerRightP5s),w
	skipc
	goto	u2461
	goto	u2460
u2461:
	goto	l804
u2460:
	line	890
	
l5357:	
;main.c: 889: {
;main.c: 890: ucTimerLargeZeroP5s = 0;
	clrf	(main@ucTimerLargeZeroP5s)
	line	891
;main.c: 891: ucTimerRightP5s = 0;
	clrf	(main@ucTimerRightP5s)
	line	892
	
l5359:	
;main.c: 892: enumMainLoopStep = MAIN_LOOP_STEP_3_HOUR_BRANCH;
	movlw	(08h)
	movwf	(_enumMainLoopStep)
	line	893
;main.c: 893: }
	goto	l5361
	line	902
;main.c: 899: else
;main.c: 900: {
;main.c: 901: ;
	
l804:	
	line	904
	
l5361:	
;main.c: 902: }
;main.c: 904: if((MAIN_LOOP_STEP_3_HOUR_BRANCH == enumMainLoopStep) || (MAIN_LOOP_STEP_FOURTH == enumMainLoopStep))
	movf	(_enumMainLoopStep),w
	xorlw	08h
	skipnz
	goto	u2471
	goto	u2470
u2471:
	goto	l5365
u2470:
	
l5363:	
	movf	(_enumMainLoopStep),w
	xorlw	04h
	skipz
	goto	u2481
	goto	u2480
u2481:
	goto	l772
u2480:
	line	906
	
l5365:	
;main.c: 905: {
;main.c: 906: ucTimerRightP5s = 0;
	clrf	(main@ucTimerRightP5s)
	line	907
;main.c: 907: ucTimerLargeZeroP5s = 0;
	clrf	(main@ucTimerLargeZeroP5s)
	line	908
;main.c: 908: ucTimerLessZeroP5s = 0;
	clrf	(main@ucTimerLessZeroP5s)
	goto	l5275
	line	922
	
l5367:	
;main.c: 916: {
;main.c: 922: startTwelveHourTimer(300);
	movlw	low(012Ch)
	movwf	(?_startTwelveHourTimer)
	movlw	high(012Ch)
	movwf	((?_startTwelveHourTimer))+1
	fcall	_startTwelveHourTimer
	line	923
	
l5369:	
;main.c: 923: enumMainLoopStep = MAIN_LOOP_STEP_FIFTH;
	movlw	(05h)
	bcf	status, 5	;RP0=0, select bank0
	movwf	(_enumMainLoopStep)
	line	925
	
l5371:	
;main.c: 925: bCheckTweHour = 0;
	clrf	(main@bCheckTweHour)
	line	927
;main.c: 927: break;
	goto	l5275
	line	935
	
l5373:	
;main.c: 931: {
;main.c: 935: if(( isFinishedTwelveHoursTimer() && (! bCheckTweHour)))
	fcall	_isFinishedTwelveHoursTimer
	xorlw	0
	skipnz
	goto	u2491
	goto	u2490
u2491:
	goto	l5909
u2490:
	
l5375:	
	bcf	status, 5	;RP0=0, select bank0
	movf	(main@bCheckTweHour),f
	skipz
	goto	u2501
	goto	u2500
u2501:
	goto	l5909
u2500:
	line	937
	
l5377:	
;main.c: 936: {
;main.c: 937: enumMainLoopStep = MAIN_LOOP_STEP_10_HOUR_END;
	movlw	(09h)
	movwf	(_enumMainLoopStep)
	line	938
	
l5379:	
;main.c: 938: bCheckTweHour = 1;
	clrf	(main@bCheckTweHour)
	incf	(main@bCheckTweHour),f
	line	939
;main.c: 939: }
	goto	l5275
	line	945
;main.c: 944: {
;main.c: 945: case ADC4_STEP_INIT:
	
l813:	
	line	951
;main.c: 946: {
;main.c: 951: ucADC4_Step = ADC4_STEP_FIRST;
	clrf	(_ucADC4_Step)
	incf	(_ucADC4_Step),f
	line	952
;main.c: 952: break;
	goto	l5275
	line	964
	
l5381:	
	line	966
	
l5383:	
;main.c: 966: uiCh5Value = getAdOriginalCh5Value();
	fcall	_getAdOriginalCh5Value
	movf	(1+(?_getAdOriginalCh5Value)),w
	movwf	(main@uiCh5Value+1)
	movf	(0+(?_getAdOriginalCh5Value)),w
	movwf	(main@uiCh5Value)
	line	968
	
l5385:	
;main.c: 968: if( 0 == bInitFlag)
	movf	(main@bInitFlag),f
	skipz
	goto	u2511
	goto	u2510
u2511:
	goto	l5391
u2510:
	line	970
	
l5387:	
;main.c: 969: {
;main.c: 970: bInitFlag = 1;
	clrf	(main@bInitFlag)
	incf	(main@bInitFlag),f
	line	971
	
l5389:	
;main.c: 971: uiOldValue = uiCh5Value;
	movf	(main@uiCh5Value+1),w
	movwf	(main@uiOldValue+1)
	movf	(main@uiCh5Value),w
	movwf	(main@uiOldValue)
	line	981
	
l5391:	
;main.c: 972: }
;main.c: 981: if(LESS_THAN_1911 == ucChannel5Type)
	movf	(_ucChannel5Type),f
	skipz
	goto	u2521
	goto	u2520
u2521:
	goto	l5397
u2520:
	line	983
	
l5393:	
;main.c: 982: {
;main.c: 983: uiMinValue = 0;
	bsf	status, 5	;RP0=1, select bank1
	clrf	(main@uiMinValue)^080h
	clrf	(main@uiMinValue+1)^080h
	line	984
	
l5395:	
;main.c: 984: uiMaxValue = 1931;
	movlw	low(078Bh)
	movwf	(main@uiMaxValue)^080h
	movlw	high(078Bh)
	movwf	((main@uiMaxValue)^080h)+1
	line	985
;main.c: 985: }
	goto	l826
	line	986
	
l5397:	
;main.c: 986: else if(BETWEEN_1911_AND_2067 == ucChannel5Type)
	decf	(_ucChannel5Type),w
	skipz
	goto	u2531
	goto	u2530
u2531:
	goto	l5401
u2530:
	line	988
	
l5399:	
;main.c: 987: {
;main.c: 988: uiMinValue = 1931 - 40;
	movlw	low(0763h)
	bsf	status, 5	;RP0=1, select bank1
	movwf	(main@uiMinValue)^080h
	movlw	high(0763h)
	movwf	((main@uiMinValue)^080h)+1
	line	989
;main.c: 989: uiMaxValue = 2047;
	movlw	low(07FFh)
	movwf	(main@uiMaxValue)^080h
	movlw	high(07FFh)
	movwf	((main@uiMaxValue)^080h)+1
	line	990
;main.c: 990: }
	goto	l826
	line	991
	
l5401:	
;main.c: 991: else if(BETWEEN_2067_AND_2204 == ucChannel5Type)
	movf	(_ucChannel5Type),w
	xorlw	02h
	skipz
	goto	u2541
	goto	u2540
u2541:
	goto	l5405
u2540:
	line	993
	
l5403:	
;main.c: 992: {
;main.c: 993: uiMinValue = 2047 - 40;
	movlw	low(07D7h)
	bsf	status, 5	;RP0=1, select bank1
	movwf	(main@uiMinValue)^080h
	movlw	high(07D7h)
	movwf	((main@uiMinValue)^080h)+1
	line	994
;main.c: 994: uiMaxValue = 2164;
	movlw	low(0874h)
	movwf	(main@uiMaxValue)^080h
	movlw	high(0874h)
	movwf	((main@uiMaxValue)^080h)+1
	line	995
;main.c: 995: }
	goto	l826
	line	996
	
l5405:	
;main.c: 996: else if(BETWEEN_2204_AND_2340 == ucChannel5Type)
	movf	(_ucChannel5Type),w
	xorlw	03h
	skipz
	goto	u2551
	goto	u2550
u2551:
	goto	l5409
u2550:
	line	998
	
l5407:	
;main.c: 997: {
;main.c: 998: uiMinValue = 2164 - 40;
	movlw	low(084Ch)
	bsf	status, 5	;RP0=1, select bank1
	movwf	(main@uiMinValue)^080h
	movlw	high(084Ch)
	movwf	((main@uiMinValue)^080h)+1
	line	999
;main.c: 999: uiMaxValue = 2281;
	movlw	low(08E9h)
	movwf	(main@uiMaxValue)^080h
	movlw	high(08E9h)
	movwf	((main@uiMaxValue)^080h)+1
	line	1000
;main.c: 1000: }
	goto	l826
	line	1003
	
l5409:	
;main.c: 1001: else
;main.c: 1002: {
;main.c: 1003: uiMinValue = 2281 - 40;
	movlw	low(08C1h)
	bsf	status, 5	;RP0=1, select bank1
	movwf	(main@uiMinValue)^080h
	movlw	high(08C1h)
	movwf	((main@uiMinValue)^080h)+1
	line	1004
;main.c: 1004: uiMaxValue = 2281;
	movlw	low(08E9h)
	movwf	(main@uiMaxValue)^080h
	movlw	high(08E9h)
	movwf	((main@uiMaxValue)^080h)+1
	line	1005
	
l826:	
	line	1009
;main.c: 1005: }
;main.c: 1008: if(( uiCh5Value < uiMinValue )
;main.c: 1009: || ( uiCh5Value > uiMaxValue ))
	movf	(main@uiMinValue+1)^080h,w
	bcf	status, 5	;RP0=0, select bank0
	subwf	(main@uiCh5Value+1),w
	skipz
	goto	u2565
	bsf	status, 5	;RP0=1, select bank1
	movf	(main@uiMinValue)^080h,w
	bcf	status, 5	;RP0=0, select bank0
	subwf	(main@uiCh5Value),w
u2565:
	skipc
	goto	u2561
	goto	u2560
u2561:
	goto	l5413
u2560:
	
l5411:	
	movf	(main@uiCh5Value+1),w
	bsf	status, 5	;RP0=1, select bank1
	subwf	(main@uiMaxValue+1)^080h,w
	skipz
	goto	u2575
	bcf	status, 5	;RP0=0, select bank0
	movf	(main@uiCh5Value),w
	bsf	status, 5	;RP0=1, select bank1
	subwf	(main@uiMaxValue)^080h,w
u2575:
	skipnc
	goto	u2571
	goto	u2570
u2571:
	goto	l833
u2570:
	line	1011
	
l5413:	
;main.c: 1010: {
;main.c: 1011: uiOldValue = uiCh5Value;
	bcf	status, 5	;RP0=0, select bank0
	movf	(main@uiCh5Value+1),w
	movwf	(main@uiOldValue+1)
	movf	(main@uiCh5Value),w
	movwf	(main@uiOldValue)
	line	1012
	
l833:	
	line	1014
;main.c: 1012: }
;main.c: 1014: if( uiOldValue < 1931 )
	movlw	high(078Bh)
	bcf	status, 5	;RP0=0, select bank0
	subwf	(main@uiOldValue+1),w
	movlw	low(078Bh)
	skipnz
	subwf	(main@uiOldValue),w
	skipnc
	goto	u2581
	goto	u2580
u2581:
	goto	l5417
u2580:
	line	1015
	
l5415:	
;main.c: 1015: ucChannel5Type = LESS_THAN_1911;
	clrf	(_ucChannel5Type)
	goto	l837
	line	1016
	
l5417:	
;main.c: 1016: else if( uiOldValue < 2047 )
	movlw	high(07FFh)
	subwf	(main@uiOldValue+1),w
	movlw	low(07FFh)
	skipnz
	subwf	(main@uiOldValue),w
	skipnc
	goto	u2591
	goto	u2590
u2591:
	goto	l5421
u2590:
	line	1017
	
l5419:	
;main.c: 1017: ucChannel5Type = BETWEEN_1911_AND_2067;
	clrf	(_ucChannel5Type)
	incf	(_ucChannel5Type),f
	goto	l837
	line	1018
	
l5421:	
;main.c: 1018: else if( uiOldValue < 2164 )
	movlw	high(0874h)
	subwf	(main@uiOldValue+1),w
	movlw	low(0874h)
	skipnz
	subwf	(main@uiOldValue),w
	skipnc
	goto	u2601
	goto	u2600
u2601:
	goto	l5425
u2600:
	line	1019
	
l5423:	
;main.c: 1019: ucChannel5Type = BETWEEN_2067_AND_2204;
	movlw	(02h)
	movwf	(_ucChannel5Type)
	goto	l837
	line	1020
	
l5425:	
;main.c: 1020: else if( uiOldValue < 2281 )
	movlw	high(08E9h)
	subwf	(main@uiOldValue+1),w
	movlw	low(08E9h)
	skipnz
	subwf	(main@uiOldValue),w
	skipnc
	goto	u2611
	goto	u2610
u2611:
	goto	l5429
u2610:
	line	1021
	
l5427:	
;main.c: 1021: ucChannel5Type = BETWEEN_2204_AND_2340;
	movlw	(03h)
	movwf	(_ucChannel5Type)
	goto	l837
	line	1023
	
l5429:	
;main.c: 1022: else
;main.c: 1023: ucChannel5Type = MORE_THAN_2340;
	movlw	(04h)
	movwf	(_ucChannel5Type)
	
l837:	
	line	1025
;main.c: 1025: ucADC4_Step = ADC4_STEP_SECOND;
	movlw	(02h)
	movwf	(_ucADC4_Step)
	line	1026
;main.c: 1026: break;
	goto	l5275
	line	1046
	
l5431:	
;main.c: 1045: {
;main.c: 1046: setPA1(1);
	movlw	(01h)
	fcall	_setPA1
	line	1047
	
l5433:	
;main.c: 1047: ucLoaderStep++;
	incf	(main@ucLoaderStep),f
	line	1048
;main.c: 1048: break;
	goto	l5275
	line	1053
	
l5435:	
;main.c: 1052: {
;main.c: 1053: if(ucTimerDelay >= 5)
	movlw	(05h)
	subwf	(main@ucTimerDelay),w
	skipc
	goto	u2621
	goto	u2620
u2621:
	goto	l5443
u2620:
	line	1055
	
l5437:	
;main.c: 1054: {
;main.c: 1055: setPA0(1);
	movlw	(01h)
	fcall	_setPA0
	line	1056
	
l5439:	
;main.c: 1056: ucTimerDelay = 0;
	clrf	(main@ucTimerDelay)
	goto	l5433
	line	1060
	
l5443:	
;main.c: 1059: else
;main.c: 1060: ucTimerDelay++;
	incf	(main@ucTimerDelay),f
	goto	l5275
	line	1066
	
l5445:	
;main.c: 1065: {
;main.c: 1066: if(ucTimerDelay >= 5)
	movlw	(05h)
	subwf	(main@ucTimerDelay),w
	skipc
	goto	u2631
	goto	u2630
u2631:
	goto	l5443
u2630:
	line	1068
	
l5447:	
;main.c: 1067: {
;main.c: 1068: setPB0(1);
	movlw	(01h)
	fcall	_setPB0
	goto	l5439
	line	1080
	
l5455:	
;main.c: 1079: {
;main.c: 1080: if(ucTimerDelay >= 5)
	movlw	(05h)
	subwf	(main@ucTimerDelay),w
	skipc
	goto	u2641
	goto	u2640
u2641:
	goto	l5443
u2640:
	line	1082
	
l5457:	
;main.c: 1081: {
;main.c: 1082: setPB1(1);
	movlw	(01h)
	fcall	_setPB1
	goto	l5439
	line	1093
	
l5465:	
;main.c: 1092: {
;main.c: 1093: if(ucTimerDelay >= 5)
	movlw	(05h)
	subwf	(main@ucTimerDelay),w
	skipc
	goto	u2651
	goto	u2650
u2651:
	goto	l5443
u2650:
	line	1095
	
l5467:	
;main.c: 1094: {
;main.c: 1095: setPB2(1);
	movlw	(01h)
	fcall	_setPB2
	goto	l5439
	line	1106
	
l5475:	
;main.c: 1105: {
;main.c: 1106: if(ucTimerDelay >= 5)
	movlw	(05h)
	subwf	(main@ucTimerDelay),w
	skipc
	goto	u2661
	goto	u2660
u2661:
	goto	l5443
u2660:
	line	1108
	
l5477:	
;main.c: 1107: {
;main.c: 1108: setPA1(0);
	movlw	(0)
	fcall	_setPA1
	line	1109
;main.c: 1109: setPA0(0);
	movlw	(0)
	fcall	_setPA0
	line	1110
;main.c: 1110: setPB0(0);
	movlw	(0)
	fcall	_setPB0
	line	1111
;main.c: 1111: setPB1(0);
	movlw	(0)
	fcall	_setPB1
	line	1112
;main.c: 1112: setPB2(0);
	movlw	(0)
	fcall	_setPB2
	goto	l5439
	line	1123
	
l5485:	
;main.c: 1122: {
;main.c: 1123: if(ucTimerDelay >= 1)
	movf	(main@ucTimerDelay),w
	skipz
	goto	u2670
	goto	l5443
u2670:
	line	1125
	
l5487:	
;main.c: 1124: {
;main.c: 1125: ucTimerDelay = 0;
	clrf	(main@ucTimerDelay)
	line	1127
;main.c: 1127: ucLoaderStep = 0;
	clrf	(main@ucLoaderStep)
	line	1128
	
l5489:	
;main.c: 1128: ucADC4_Step = ADC4_STEP_THIRD;
	movlw	(03h)
	movwf	(_ucADC4_Step)
	line	1129
;main.c: 1129: }
	goto	l5275
	line	1042
	
l5495:	
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
goto l772
movlw high(S6307)
movwf pclath
	clrc
	rlf fsr,w
	addlw low(S6307)
	movwf pc
psect	swtext1,local,class=CONST,delta=2
global __pswtext1
__pswtext1:
S6307:
	ljmp	l5431
	ljmp	l5435
	ljmp	l5445
	ljmp	l5455
	ljmp	l5465
	ljmp	l5475
	ljmp	l5485
psect	maintext

	line	1151
	
l5497:	
;main.c: 1150: {
;main.c: 1151: setPA1(1);
	movlw	(01h)
	fcall	_setPA1
	line	1152
	
l5499:	
;main.c: 1152: ucLoaderStep1++;
	incf	(main@ucLoaderStep1),f
	line	1153
;main.c: 1153: break;
	goto	l5275
	line	1158
	
l5501:	
;main.c: 1157: {
;main.c: 1158: if(ucTimerDelay1 >= 5)
	movlw	(05h)
	subwf	(main@ucTimerDelay1),w
	skipc
	goto	u2681
	goto	u2680
u2681:
	goto	l5509
u2680:
	line	1160
	
l5503:	
;main.c: 1159: {
;main.c: 1160: setPA0(1);
	movlw	(01h)
	fcall	_setPA0
	line	1161
	
l5505:	
;main.c: 1161: ucTimerDelay1 = 0;
	clrf	(main@ucTimerDelay1)
	goto	l5499
	line	1165
	
l5509:	
;main.c: 1164: else
;main.c: 1165: ucTimerDelay1++;
	incf	(main@ucTimerDelay1),f
	goto	l5275
	line	1171
	
l5511:	
;main.c: 1170: {
;main.c: 1171: if(ucTimerDelay1 >= 5)
	movlw	(05h)
	subwf	(main@ucTimerDelay1),w
	skipc
	goto	u2691
	goto	u2690
u2691:
	goto	l5509
u2690:
	line	1173
	
l5513:	
;main.c: 1172: {
;main.c: 1173: setPB0(1);
	movlw	(01h)
	fcall	_setPB0
	goto	l5505
	line	1184
	
l5521:	
;main.c: 1183: {
;main.c: 1184: if(ucTimerDelay1 >= 5)
	movlw	(05h)
	subwf	(main@ucTimerDelay1),w
	skipc
	goto	u2701
	goto	u2700
u2701:
	goto	l5509
u2700:
	line	1187
	
l5523:	
;main.c: 1185: {
;main.c: 1187: setPB1(1);
	movlw	(01h)
	fcall	_setPB1
	goto	l5505
	line	1198
	
l5531:	
;main.c: 1197: {
;main.c: 1198: if(ucTimerDelay1 >= 5)
	movlw	(05h)
	subwf	(main@ucTimerDelay1),w
	skipc
	goto	u2711
	goto	u2710
u2711:
	goto	l5509
u2710:
	line	1201
	
l5533:	
;main.c: 1199: {
;main.c: 1201: setPB2(1);
	movlw	(01h)
	fcall	_setPB2
	goto	l5505
	line	1212
	
l5541:	
;main.c: 1211: {
;main.c: 1212: if(ucTimerDelay1 >= 5)
	movlw	(05h)
	subwf	(main@ucTimerDelay1),w
	skipc
	goto	u2721
	goto	u2720
u2721:
	goto	l5509
u2720:
	line	1214
	
l5543:	
;main.c: 1213: {
;main.c: 1214: setPA0(0);
	movlw	(0)
	fcall	_setPA0
	line	1216
;main.c: 1216: setPB0(0);
	movlw	(0)
	fcall	_setPB0
	line	1218
;main.c: 1218: setPB1(0);
	movlw	(0)
	fcall	_setPB1
	line	1220
;main.c: 1220: setPB2(0);
	movlw	(0)
	fcall	_setPB2
	goto	l5505
	line	1231
	
l5551:	
;main.c: 1230: {
;main.c: 1231: if(ucTimerDelay1 >= 1)
	movf	(main@ucTimerDelay1),w
	skipz
	goto	u2730
	goto	l5509
u2730:
	line	1233
	
l5553:	
;main.c: 1232: {
;main.c: 1233: ucTimerDelay1 = 0;
	clrf	(main@ucTimerDelay1)
	line	1235
;main.c: 1235: ucLoaderStep1 = 0;
	clrf	(main@ucLoaderStep1)
	goto	l5489
	line	1147
	
l5561:	
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
goto l772
movlw high(S6309)
movwf pclath
	clrc
	rlf fsr,w
	addlw low(S6309)
	movwf pc
psect	swtext2,local,class=CONST,delta=2
global __pswtext2
__pswtext2:
S6309:
	ljmp	l5497
	ljmp	l5501
	ljmp	l5511
	ljmp	l5521
	ljmp	l5531
	ljmp	l5541
	ljmp	l5551
psect	maintext

	line	1261
	
l5563:	
;main.c: 1259: {
;main.c: 1261: setPA1(1);
	movlw	(01h)
	fcall	_setPA1
	line	1263
;main.c: 1263: setPA0(1);
	movlw	(01h)
	fcall	_setPA0
	line	1264
	
l5565:	
;main.c: 1264: ucLoaderStep2++;
	incf	(main@ucLoaderStep2),f
	line	1265
;main.c: 1265: break;
	goto	l5275
	line	1270
	
l5567:	
;main.c: 1269: {
;main.c: 1270: if(ucTimerDelay2 >= 5)
	movlw	(05h)
	subwf	(main@ucTimerDelay2),w
	skipc
	goto	u2741
	goto	u2740
u2741:
	goto	l5575
u2740:
	line	1273
	
l5569:	
;main.c: 1271: {
;main.c: 1273: setPB0(1);
	movlw	(01h)
	fcall	_setPB0
	line	1274
	
l5571:	
;main.c: 1274: ucTimerDelay2 = 0;
	clrf	(main@ucTimerDelay2)
	goto	l5565
	line	1278
	
l5575:	
;main.c: 1277: else
;main.c: 1278: ucTimerDelay2++;
	incf	(main@ucTimerDelay2),f
	goto	l5275
	line	1284
	
l5577:	
;main.c: 1283: {
;main.c: 1284: if(ucTimerDelay2 >= 5)
	movlw	(05h)
	subwf	(main@ucTimerDelay2),w
	skipc
	goto	u2751
	goto	u2750
u2751:
	goto	l5575
u2750:
	line	1287
	
l5579:	
;main.c: 1285: {
;main.c: 1287: setPB1(1);
	movlw	(01h)
	fcall	_setPB1
	goto	l5571
	line	1298
	
l5587:	
;main.c: 1297: {
;main.c: 1298: if(ucTimerDelay2 >= 5)
	movlw	(05h)
	subwf	(main@ucTimerDelay2),w
	skipc
	goto	u2761
	goto	u2760
u2761:
	goto	l5575
u2760:
	line	1301
	
l5589:	
;main.c: 1299: {
;main.c: 1301: setPB2(1);
	movlw	(01h)
	fcall	_setPB2
	goto	l5571
	line	1312
	
l5597:	
;main.c: 1311: {
;main.c: 1312: if(ucTimerDelay2 >= 5)
	movlw	(05h)
	subwf	(main@ucTimerDelay2),w
	skipc
	goto	u2771
	goto	u2770
u2771:
	goto	l5575
u2770:
	line	1316
	
l5599:	
;main.c: 1313: {
;main.c: 1316: setPB0(0);
	movlw	(0)
	fcall	_setPB0
	line	1318
;main.c: 1318: setPB1(0);
	movlw	(0)
	fcall	_setPB1
	line	1320
;main.c: 1320: setPB2(0);
	movlw	(0)
	fcall	_setPB2
	goto	l5571
	line	1331
	
l5607:	
;main.c: 1330: {
;main.c: 1331: if(ucTimerDelay2 >= 1)
	movf	(main@ucTimerDelay2),w
	skipz
	goto	u2780
	goto	l5575
u2780:
	line	1333
	
l5609:	
;main.c: 1332: {
;main.c: 1333: ucTimerDelay2 = 0;
	clrf	(main@ucTimerDelay2)
	line	1335
;main.c: 1335: ucLoaderStep2 = 0;
	clrf	(main@ucLoaderStep2)
	goto	l5489
	line	1256
	
l5617:	
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
goto l772
movlw high(S6311)
movwf pclath
	clrc
	rlf fsr,w
	addlw low(S6311)
	movwf pc
psect	swtext3,local,class=CONST,delta=2
global __pswtext3
__pswtext3:
S6311:
	ljmp	l5563
	ljmp	l5567
	ljmp	l5577
	ljmp	l5587
	ljmp	l5597
	ljmp	l5607
psect	maintext

	line	1361
	
l5619:	
;main.c: 1359: {
;main.c: 1361: setPB0(1);
	movlw	(01h)
	fcall	_setPB0
	line	1363
;main.c: 1363: setPA0(1);
	movlw	(01h)
	fcall	_setPA0
	line	1365
;main.c: 1365: setPA1(1);
	movlw	(01h)
	fcall	_setPA1
	line	1366
	
l5621:	
;main.c: 1366: ucLoaderStep3++;
	incf	(main@ucLoaderStep3),f
	line	1367
;main.c: 1367: break;
	goto	l5275
	line	1372
	
l5623:	
;main.c: 1371: {
;main.c: 1372: if(ucTimerDelay3 >= 5)
	movlw	(05h)
	subwf	(main@ucTimerDelay3),w
	skipc
	goto	u2791
	goto	u2790
u2791:
	goto	l5631
u2790:
	line	1375
	
l5625:	
;main.c: 1373: {
;main.c: 1375: setPB1(1);
	movlw	(01h)
	fcall	_setPB1
	line	1376
	
l5627:	
;main.c: 1376: ucTimerDelay3 = 0;
	clrf	(main@ucTimerDelay3)
	goto	l5621
	line	1380
	
l5631:	
;main.c: 1379: else
;main.c: 1380: ucTimerDelay3++;
	incf	(main@ucTimerDelay3),f
	goto	l5275
	line	1386
	
l5633:	
;main.c: 1385: {
;main.c: 1386: if(ucTimerDelay3 >= 5)
	movlw	(05h)
	subwf	(main@ucTimerDelay3),w
	skipc
	goto	u2801
	goto	u2800
u2801:
	goto	l5631
u2800:
	line	1389
	
l5635:	
;main.c: 1387: {
;main.c: 1389: setPB2(1);
	movlw	(01h)
	fcall	_setPB2
	goto	l5627
	line	1401
	
l5643:	
;main.c: 1400: {
;main.c: 1401: if(ucTimerDelay3 >= 5)
	movlw	(05h)
	subwf	(main@ucTimerDelay3),w
	skipc
	goto	u2811
	goto	u2810
u2811:
	goto	l5631
u2810:
	line	1405
	
l5645:	
;main.c: 1402: {
;main.c: 1405: setPB1(0);
	movlw	(0)
	fcall	_setPB1
	line	1407
;main.c: 1407: setPB2(0);
	movlw	(0)
	fcall	_setPB2
	goto	l5627
	line	1418
	
l5653:	
;main.c: 1417: {
;main.c: 1418: if(ucTimerDelay3 >= 1)
	movf	(main@ucTimerDelay3),w
	skipz
	goto	u2820
	goto	l5631
u2820:
	line	1420
	
l5655:	
;main.c: 1419: {
;main.c: 1420: ucTimerDelay3 = 0;
	clrf	(main@ucTimerDelay3)
	line	1422
;main.c: 1422: ucLoaderStep3 = 0;
	clrf	(main@ucLoaderStep3)
	goto	l5489
	line	1356
	
l5663:	
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
	goto	l5619
	xorlw	1^0	; case 1
	skipnz
	goto	l5623
	xorlw	2^1	; case 2
	skipnz
	goto	l5633
	xorlw	3^2	; case 3
	skipnz
	goto	l5643
	xorlw	4^3	; case 4
	skipnz
	goto	l5653
	goto	l772
	opt asmopt_on

	line	1448
	
l5665:	
;main.c: 1446: {
;main.c: 1448: setPB0(1);
	movlw	(01h)
	fcall	_setPB0
	line	1450
;main.c: 1450: setPA0(1);
	movlw	(01h)
	fcall	_setPA0
	line	1452
;main.c: 1452: setPA1(1);
	movlw	(01h)
	fcall	_setPA1
	line	1454
;main.c: 1454: setPB1(1);
	movlw	(01h)
	fcall	_setPB1
	line	1455
	
l5667:	
;main.c: 1455: ucLoaderStep4++;
	incf	(main@ucLoaderStep4),f
	line	1456
;main.c: 1456: break;
	goto	l5275
	line	1461
	
l5669:	
;main.c: 1460: {
;main.c: 1461: if(ucTimerDelay4 >= 5)
	movlw	(05h)
	subwf	(main@ucTimerDelay4),w
	skipc
	goto	u2831
	goto	u2830
u2831:
	goto	l5677
u2830:
	line	1464
	
l5671:	
;main.c: 1462: {
;main.c: 1464: setPB2(1);
	movlw	(01h)
	fcall	_setPB2
	line	1465
	
l5673:	
;main.c: 1465: ucTimerDelay4 = 0;
	clrf	(main@ucTimerDelay4)
	goto	l5667
	line	1469
	
l5677:	
;main.c: 1468: else
;main.c: 1469: ucTimerDelay4++;
	incf	(main@ucTimerDelay4),f
	goto	l5275
	line	1475
	
l5679:	
;main.c: 1474: {
;main.c: 1475: if(ucTimerDelay4 >= 5)
	movlw	(05h)
	subwf	(main@ucTimerDelay4),w
	skipc
	goto	u2841
	goto	u2840
u2841:
	goto	l5677
u2840:
	line	1478
	
l5681:	
;main.c: 1476: {
;main.c: 1478: setPB2(0);
	movlw	(0)
	fcall	_setPB2
	goto	l5673
	line	1489
	
l5689:	
;main.c: 1488: {
;main.c: 1489: if(ucTimerDelay4 >= 1)
	movf	(main@ucTimerDelay4),w
	skipz
	goto	u2850
	goto	l5677
u2850:
	line	1491
	
l5691:	
;main.c: 1490: {
;main.c: 1491: ucTimerDelay4 = 0;
	clrf	(main@ucTimerDelay4)
	line	1493
;main.c: 1493: ucLoaderStep4 = 0;
	clrf	(main@ucLoaderStep4)
	goto	l5489
	line	1443
	
l5699:	
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
	goto	l5665
	xorlw	1^0	; case 1
	skipnz
	goto	l5669
	xorlw	2^1	; case 2
	skipnz
	goto	l5679
	xorlw	3^2	; case 3
	skipnz
	goto	l5689
	goto	l772
	opt asmopt_on

	line	1035
	
l5703:	
	movf	(_ucChannel5Type),w
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
	goto	l5495
	xorlw	1^0	; case 1
	skipnz
	goto	l5561
	xorlw	2^1	; case 2
	skipnz
	goto	l5617
	xorlw	3^2	; case 3
	skipnz
	goto	l5663
	xorlw	4^3	; case 4
	skipnz
	goto	l5699
	goto	l772
	opt asmopt_on

	line	1525
	
l5705:	
;main.c: 1517: {
;main.c: 1521: static unsigned char ucTimerDelayP2sLess = 0;
;main.c: 1523: static unsigned char ucTimerDelayP2sMore = 0;
;main.c: 1525: if( getAdOriginalCh6Value() <= 150 )
	fcall	_getAdOriginalCh6Value
	movlw	high(097h)
	subwf	(1+(?_getAdOriginalCh6Value)),w
	movlw	low(097h)
	skipnz
	subwf	(0+(?_getAdOriginalCh6Value)),w
	skipnc
	goto	u2861
	goto	u2860
u2861:
	goto	l5711
u2860:
	line	1527
	
l5707:	
;main.c: 1526: {
;main.c: 1527: ucTimerDelayP2sLess++;
	incf	(main@ucTimerDelayP2sLess),f
	line	1528
	
l5709:	
;main.c: 1528: ucTimerDelayP2sMore = 0;
	clrf	(main@ucTimerDelayP2sMore)
	line	1529
;main.c: 1529: }
	goto	l5715
	line	1532
	
l5711:	
;main.c: 1530: else
;main.c: 1531: {
;main.c: 1532: ucTimerDelayP2sMore++;
	incf	(main@ucTimerDelayP2sMore),f
	line	1533
	
l5713:	
;main.c: 1533: ucTimerDelayP2sLess = 0;
	clrf	(main@ucTimerDelayP2sLess)
	line	1536
	
l5715:	
;main.c: 1534: }
;main.c: 1536: if(ucTimerDelayP2sLess > 200)
	movlw	(0C9h)
	subwf	(main@ucTimerDelayP2sLess),w
	skipc
	goto	u2871
	goto	u2870
u2871:
	goto	l972
u2870:
	line	1537
	
l5717:	
;main.c: 1537: ucTimerDelayP2sLess = 2;
	movlw	(02h)
	movwf	(main@ucTimerDelayP2sLess)
	
l972:	
	line	1540
;main.c: 1540: if(ucTimerDelayP2sMore > 200)
	movlw	(0C9h)
	subwf	(main@ucTimerDelayP2sMore),w
	skipc
	goto	u2881
	goto	u2880
u2881:
	goto	l973
u2880:
	line	1541
	
l5719:	
;main.c: 1541: ucTimerDelayP2sMore = 2;
	movlw	(02h)
	movwf	(main@ucTimerDelayP2sMore)
	
l973:	
	line	1543
;main.c: 1543: if( ucTimerDelayP2sLess >= 2)
	movlw	(02h)
	subwf	(main@ucTimerDelayP2sLess),w
	skipc
	goto	u2891
	goto	u2890
u2891:
	goto	l5731
u2890:
	line	1545
	
l5721:	
;main.c: 1544: {
;main.c: 1545: ucTimerDelayP2sLess = 0;
	clrf	(main@ucTimerDelayP2sLess)
	line	1546
;main.c: 1546: ucTimerDelayP2sMore = 0;
	clrf	(main@ucTimerDelayP2sMore)
	line	1548
	
l5723:	
;main.c: 1548: startTwentySecondsTimer();
	fcall	_startTwentySecondsTimer
	line	1551
	
l5725:	
;main.c: 1551: if( !isFinishedTwentySecondsTimer() )
	fcall	_isFinishedTwentySecondsTimer
	iorlw	0
	skipz
	goto	u2901
	goto	u2900
u2901:
	goto	l5729
u2900:
	line	1557
	
l5727:	
;main.c: 1552: {
;main.c: 1557: call_ADC4_STEP_FOURTH_PREFIX2();
	fcall	_call_ADC4_STEP_FOURTH_PREFIX2
	line	1558
;main.c: 1558: }
	goto	l5275
	line	1565
	
l5729:	
;main.c: 1559: else
;main.c: 1561: {
;main.c: 1565: call_ADC4_STEP_FOURTH_PREFIX3(0);
	movlw	(0)
	fcall	_call_ADC4_STEP_FOURTH_PREFIX3
	goto	l5275
	line	1568
	
l5731:	
;main.c: 1568: else if(ucTimerDelayP2sMore >= 2)
	movlw	(02h)
	subwf	(main@ucTimerDelayP2sMore),w
	skipc
	goto	u2911
	goto	u2910
u2911:
	goto	l772
u2910:
	line	1570
	
l5733:	
;main.c: 1569: {
;main.c: 1570: ucTimerDelayP2sMore = 0;
	clrf	(main@ucTimerDelayP2sMore)
	line	1571
;main.c: 1571: ucTimerDelayP2sLess = 0;
	clrf	(main@ucTimerDelayP2sLess)
	goto	l5727
	line	1592
	
l5737:	
;main.c: 1588: {
;main.c: 1592: if( !isFinishedTwentySecondsTimer() )
	fcall	_isFinishedTwentySecondsTimer
	iorlw	0
	skipz
	goto	u2921
	goto	u2920
u2921:
	goto	l5741
u2920:
	line	1593
	
l5739:	
;main.c: 1593: ucADC4_Step = ADC4_STEP_FOURTH_PREFIX2;
	movlw	(05h)
	bcf	status, 5	;RP0=0, select bank0
	movwf	(_ucADC4_Step)
	goto	l5275
	line	1596
	
l5741:	
;main.c: 1595: else
;main.c: 1596: ucADC4_Step = ADC4_STEP_FOURTH_PREFIX3;
	movlw	(06h)
	bcf	status, 5	;RP0=0, select bank0
	movwf	(_ucADC4_Step)
	goto	l5275
	line	1611
	
l5743:	
;main.c: 1603: {
;main.c: 1607: static unsigned char ucTimerCntMore = 0, ucTimerCntLess = 0;
;main.c: 1609: static unsigned char ucTimerCntMoreFlag = 0, ucTimerCntLessFlag = 0;
;main.c: 1611: if((getAdOriginalCh2Value() > 1950))
	fcall	_getAdOriginalCh2Value
	movlw	high(079Fh)
	subwf	(1+(?_getAdOriginalCh2Value)),w
	movlw	low(079Fh)
	skipnz
	subwf	(0+(?_getAdOriginalCh2Value)),w
	skipc
	goto	u2931
	goto	u2930
u2931:
	goto	l5749
u2930:
	line	1613
	
l5745:	
;main.c: 1612: {
;main.c: 1613: ucTimerCntMore++;
	incf	(main@ucTimerCntMore),f
	line	1614
	
l5747:	
;main.c: 1614: ucTimerCntLess = 0;
	bsf	status, 5	;RP0=1, select bank1
	clrf	(main@ucTimerCntLess)^080h
	line	1615
;main.c: 1615: }
	goto	l5753
	line	1618
	
l5749:	
;main.c: 1616: else
;main.c: 1617: {
;main.c: 1618: ucTimerCntLess++;
	bsf	status, 5	;RP0=1, select bank1
	incf	(main@ucTimerCntLess)^080h,f
	line	1619
	
l5751:	
;main.c: 1619: ucTimerCntMore = 0;
	bcf	status, 5	;RP0=0, select bank0
	clrf	(main@ucTimerCntMore)
	line	1622
	
l5753:	
;main.c: 1620: }
;main.c: 1622: if(ucTimerCntMore >= 2)
	movlw	(02h)
	bcf	status, 5	;RP0=0, select bank0
	subwf	(main@ucTimerCntMore),w
	skipc
	goto	u2941
	goto	u2940
u2941:
	goto	l5757
u2940:
	line	1623
	
l5755:	
;main.c: 1623: ucTimerCntMoreFlag = 1;
	bsf	status, 5	;RP0=1, select bank1
	clrf	(main@ucTimerCntMoreFlag)^080h
	incf	(main@ucTimerCntMoreFlag)^080h,f
	line	1625
	
l5757:	
;main.c: 1625: if(ucTimerCntLess >= 2)
	movlw	(02h)
	bsf	status, 5	;RP0=1, select bank1
	subwf	(main@ucTimerCntLess)^080h,w
	skipc
	goto	u2951
	goto	u2950
u2951:
	goto	l5761
u2950:
	line	1626
	
l5759:	
;main.c: 1626: ucTimerCntLessFlag = 1;
	clrf	(main@ucTimerCntLessFlag)^080h
	incf	(main@ucTimerCntLessFlag)^080h,f
	line	1628
	
l5761:	
;main.c: 1628: if( ucTimerCntLessFlag )
	movf	(main@ucTimerCntLessFlag)^080h,w
	skipz
	goto	u2960
	goto	l5831
u2960:
	goto	l5829
	line	1638
	
l5765:	
;main.c: 1637: {
;main.c: 1638: ucTimeCntP2s = 0;
	clrf	(main@ucTimeCntP2s)^080h
	line	1639
	
l5767:	
;main.c: 1639: setPA3(0);
	movlw	(0)
	fcall	_setPA3
	line	1640
	
l5769:	
;main.c: 1640: setPB6(0);
	movlw	(0)
	fcall	_setPB6
	line	1641
	
l5771:	
;main.c: 1641: ucPrefix2Step++;
	bsf	status, 5	;RP0=1, select bank1
	incf	(main@ucPrefix2Step)^080h,f
	line	1642
;main.c: 1642: break;
	goto	l5859
	line	1647
	
l5773:	
;main.c: 1646: {
;main.c: 1647: if((getAdOriginalCh2Value() > 2300))
	fcall	_getAdOriginalCh2Value
	movlw	high(08FDh)
	subwf	(1+(?_getAdOriginalCh2Value)),w
	movlw	low(08FDh)
	skipnz
	subwf	(0+(?_getAdOriginalCh2Value)),w
	skipc
	goto	u2971
	goto	u2970
u2971:
	goto	l5777
u2970:
	line	1649
	
l5775:	
;main.c: 1648: {
;main.c: 1649: ucTimeCntP2s++;
	bsf	status, 5	;RP0=1, select bank1
	incf	(main@ucTimeCntP2s)^080h,f
	line	1650
;main.c: 1650: }
	goto	l5779
	line	1652
	
l5777:	
;main.c: 1651: else
;main.c: 1652: ucTimeCntP2s = 0;
	bsf	status, 5	;RP0=1, select bank1
	clrf	(main@ucTimeCntP2s)^080h
	line	1654
	
l5779:	
;main.c: 1654: if( ucTimeCntP2s >= 2)
	movlw	(02h)
	subwf	(main@ucTimeCntP2s)^080h,w
	skipc
	goto	u2981
	goto	u2980
u2981:
	goto	l5859
u2980:
	line	1656
	
l5781:	
;main.c: 1655: {
;main.c: 1656: ucTimeCntP2s = 0;
	clrf	(main@ucTimeCntP2s)^080h
	goto	l5771
	line	1666
	
l5785:	
;main.c: 1665: {
;main.c: 1666: setPA3(1);
	movlw	(01h)
	fcall	_setPA3
	line	1668
	
l5787:	
;main.c: 1668: setPB6AsInput();
	fcall	_setPB6AsInput
	goto	l5771
	line	1676
	
l5791:	
;main.c: 1674: {
;main.c: 1675: static unsigned char ucTimerCntP5s = 0;
;main.c: 1676: if( ucTimerCntP5s < 5)
	movlw	(05h)
	subwf	(main@ucTimerCntP5s)^080h,w
	skipnc
	goto	u2991
	goto	u2990
u2991:
	goto	l5795
u2990:
	line	1677
	
l5793:	
;main.c: 1677: ucTimerCntP5s++;
	incf	(main@ucTimerCntP5s)^080h,f
	goto	l5859
	line	1680
	
l5795:	
;main.c: 1678: else
;main.c: 1679: {
;main.c: 1680: ucTimerCntP5s = 0;
	clrf	(main@ucTimerCntP5s)^080h
	goto	l5771
	line	1692
	
l5799:	
;main.c: 1688: {
;main.c: 1689: static unsigned char ucMoreThanP3sCnt = 0;
;main.c: 1691: static unsigned char ucLessThanP3sCnt = 0;
;main.c: 1692: if((getAdOriginalCh6Value() < 50))
	fcall	_getAdOriginalCh6Value
	movlw	high(032h)
	subwf	(1+(?_getAdOriginalCh6Value)),w
	movlw	low(032h)
	skipnz
	subwf	(0+(?_getAdOriginalCh6Value)),w
	skipnc
	goto	u3001
	goto	u3000
u3001:
	goto	l5805
u3000:
	line	1694
	
l5801:	
;main.c: 1693: {
;main.c: 1694: ucLessThanP3sCnt++;
	bsf	status, 5	;RP0=1, select bank1
	incf	(main@ucLessThanP3sCnt)^080h,f
	line	1695
	
l5803:	
;main.c: 1695: ucMoreThanP3sCnt = 0;
	clrf	(main@ucMoreThanP3sCnt)^080h
	line	1696
;main.c: 1696: }
	goto	l5809
	line	1699
	
l5805:	
;main.c: 1697: else
;main.c: 1698: {
;main.c: 1699: ucMoreThanP3sCnt++;
	bsf	status, 5	;RP0=1, select bank1
	incf	(main@ucMoreThanP3sCnt)^080h,f
	line	1700
	
l5807:	
;main.c: 1700: ucLessThanP3sCnt = 0;
	clrf	(main@ucLessThanP3sCnt)^080h
	line	1703
	
l5809:	
;main.c: 1701: }
;main.c: 1703: if( ucLessThanP3sCnt >= 3)
	movlw	(03h)
	subwf	(main@ucLessThanP3sCnt)^080h,w
	skipc
	goto	u3011
	goto	u3010
u3011:
	goto	l5815
u3010:
	line	1705
	
l5811:	
;main.c: 1704: {
;main.c: 1705: ucLessThanP3sCnt = 0;
	clrf	(main@ucLessThanP3sCnt)^080h
	line	1706
;main.c: 1706: ucMoreThanP3sCnt = 0;
	clrf	(main@ucMoreThanP3sCnt)^080h
	line	1708
	
l5813:	
;main.c: 1708: enumMainLoopStep = MAIN_LOOP_STEP_FIRST;
	bcf	status, 5	;RP0=0, select bank0
	clrf	(_enumMainLoopStep)
	incf	(_enumMainLoopStep),f
	line	1709
;main.c: 1709: ucADC4_Step = ADC4_STEP_INIT;
	clrf	(_ucADC4_Step)
	line	1710
;main.c: 1710: ucTimerCntMoreFlag = 0;
	bsf	status, 5	;RP0=1, select bank1
	clrf	(main@ucTimerCntMoreFlag)^080h
	line	1712
;main.c: 1712: ucPrefix2Step = 0;
	clrf	(main@ucPrefix2Step)^080h
	line	1716
	
l5815:	
;main.c: 1714: }
;main.c: 1716: if(ucMoreThanP3sCnt > 3)
	movlw	(04h)
	subwf	(main@ucMoreThanP3sCnt)^080h,w
	skipc
	goto	u3021
	goto	u3020
u3021:
	goto	l5859
u3020:
	line	1718
	
l5817:	
;main.c: 1717: {
;main.c: 1718: ucLessThanP3sCnt = 0;
	clrf	(main@ucLessThanP3sCnt)^080h
	line	1719
;main.c: 1719: ucMoreThanP3sCnt = 0;
	clrf	(main@ucMoreThanP3sCnt)^080h
	line	1721
	
l5819:	
;main.c: 1721: enumMainLoopStep = MAIN_LOOP_STEP_THIRD;
	movlw	(03h)
	bcf	status, 5	;RP0=0, select bank0
	movwf	(_enumMainLoopStep)
	line	1722
	
l5821:	
;main.c: 1722: ucADC4_Step = ADC4_STEP_INIT;
	clrf	(_ucADC4_Step)
	line	1723
	
l5823:	
;main.c: 1723: ucTimerCntMoreFlag = 0;
	bsf	status, 5	;RP0=1, select bank1
	clrf	(main@ucTimerCntMoreFlag)^080h
	line	1725
	
l5825:	
;main.c: 1725: ucPrefix2Step = 0;
	clrf	(main@ucPrefix2Step)^080h
	goto	l5859
	line	1634
	
l5829:	
	movf	(main@ucPrefix2Step)^080h,w
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
	goto	l5765
	xorlw	1^0	; case 1
	skipnz
	goto	l5773
	xorlw	2^1	; case 2
	skipnz
	goto	l5785
	xorlw	3^2	; case 3
	skipnz
	goto	l5791
	xorlw	4^3	; case 4
	skipnz
	goto	l5799
	goto	l5859
	opt asmopt_on

	line	1732
	
l1003:	
	line	1733
;main.c: 1733: }
	goto	l5859
	line	1734
	
l5831:	
;main.c: 1734: else if( ucTimerCntMoreFlag )
	movf	(main@ucTimerCntMoreFlag)^080h,w
	skipz
	goto	u3030
	goto	l5859
u3030:
	line	1739
	
l5833:	
;main.c: 1735: {
;main.c: 1736: static unsigned char ucMoreThanP8sCnt = 0;
;main.c: 1738: static unsigned char ucLessThanP8sCnt = 0;
;main.c: 1739: if((getAdOriginalCh6Value() < 50))
	fcall	_getAdOriginalCh6Value
	movlw	high(032h)
	subwf	(1+(?_getAdOriginalCh6Value)),w
	movlw	low(032h)
	skipnz
	subwf	(0+(?_getAdOriginalCh6Value)),w
	skipnc
	goto	u3041
	goto	u3040
u3041:
	goto	l5839
u3040:
	line	1741
	
l5835:	
;main.c: 1740: {
;main.c: 1741: ucLessThanP8sCnt++;
	bsf	status, 5	;RP0=1, select bank1
	incf	(main@ucLessThanP8sCnt)^080h,f
	line	1742
	
l5837:	
;main.c: 1742: ucMoreThanP8sCnt = 0;
	clrf	(main@ucMoreThanP8sCnt)^080h
	line	1743
;main.c: 1743: }
	goto	l5843
	line	1746
	
l5839:	
;main.c: 1744: else
;main.c: 1745: {
;main.c: 1746: ucMoreThanP8sCnt++;
	bsf	status, 5	;RP0=1, select bank1
	incf	(main@ucMoreThanP8sCnt)^080h,f
	line	1747
	
l5841:	
;main.c: 1747: ucLessThanP8sCnt = 0;
	clrf	(main@ucLessThanP8sCnt)^080h
	line	1750
	
l5843:	
;main.c: 1748: }
;main.c: 1750: if( ucLessThanP8sCnt >= 8)
	movlw	(08h)
	subwf	(main@ucLessThanP8sCnt)^080h,w
	skipc
	goto	u3051
	goto	u3050
u3051:
	goto	l5849
u3050:
	line	1752
	
l5845:	
;main.c: 1751: {
;main.c: 1752: ucLessThanP8sCnt = 0;
	clrf	(main@ucLessThanP8sCnt)^080h
	line	1753
;main.c: 1753: ucMoreThanP8sCnt = 0;
	clrf	(main@ucMoreThanP8sCnt)^080h
	line	1755
	
l5847:	
;main.c: 1755: enumMainLoopStep = MAIN_LOOP_STEP_FIRST;
	bcf	status, 5	;RP0=0, select bank0
	clrf	(_enumMainLoopStep)
	incf	(_enumMainLoopStep),f
	line	1756
;main.c: 1756: ucADC4_Step = ADC4_STEP_INIT;
	clrf	(_ucADC4_Step)
	line	1757
;main.c: 1757: ucTimerCntMoreFlag = 0;
	bsf	status, 5	;RP0=1, select bank1
	clrf	(main@ucTimerCntMoreFlag)^080h
	line	1759
;main.c: 1758: ;
;main.c: 1759: }
	goto	l5859
	line	1760
	
l5849:	
;main.c: 1760: else if( ucMoreThanP8sCnt >= 8 )
	movlw	(08h)
	subwf	(main@ucMoreThanP8sCnt)^080h,w
	skipc
	goto	u3061
	goto	u3060
u3061:
	goto	l1003
u3060:
	line	1762
	
l5851:	
;main.c: 1761: {
;main.c: 1762: ucLessThanP8sCnt = 0;
	clrf	(main@ucLessThanP8sCnt)^080h
	line	1763
;main.c: 1763: ucMoreThanP8sCnt = 0;
	clrf	(main@ucMoreThanP8sCnt)^080h
	line	1765
	
l5853:	
;main.c: 1765: enumMainLoopStep = MAIN_LOOP_STEP_THIRD;
	movlw	(03h)
	bcf	status, 5	;RP0=0, select bank0
	movwf	(_enumMainLoopStep)
	line	1766
	
l5855:	
;main.c: 1766: ucADC4_Step = ADC4_STEP_INIT;
	clrf	(_ucADC4_Step)
	line	1767
	
l5857:	
;main.c: 1767: ucTimerCntMoreFlag = 0;
	bsf	status, 5	;RP0=1, select bank1
	clrf	(main@ucTimerCntMoreFlag)^080h
	line	1778
;main.c: 1768: ;
;main.c: 1769: }
	
l5859:	
;main.c: 1776: }
;main.c: 1778: if(ADC4_STEP_INIT == ucADC4_Step)
	bcf	status, 5	;RP0=0, select bank0
	movf	(_ucADC4_Step),f
	skipz
	goto	u3071
	goto	u3070
u3071:
	goto	l772
u3070:
	line	1780
	
l5861:	
;main.c: 1779: {
;main.c: 1780: ucTimerCntMore = 0;
	clrf	(main@ucTimerCntMore)
	line	1781
;main.c: 1781: ucTimerCntLess = 0;
	bsf	status, 5	;RP0=1, select bank1
	clrf	(main@ucTimerCntLess)^080h
	line	1782
;main.c: 1782: ucTimerCntMoreFlag = 0;
	clrf	(main@ucTimerCntMoreFlag)^080h
	line	1783
;main.c: 1783: ucTimerCntLessFlag = 0;
	clrf	(main@ucTimerCntLessFlag)^080h
	goto	l5275
	line	1795
	
l5863:	
;main.c: 1791: {
;main.c: 1795: clearTwentySecondsTimer();
	fcall	_clearTwentySecondsTimer
	line	1797
	
l5865:	
;main.c: 1797: setPA3(0);
	movlw	(0)
	fcall	_setPA3
	line	1798
	
l5867:	
;main.c: 1798: setPB4(0);
	movlw	(0)
	fcall	_setPB4
	line	1799
	
l5869:	
;main.c: 1799: setPB6(1);
	movlw	(01h)
	fcall	_setPB6
	line	1801
;main.c: 1801: ucADC4_Step = ADC4_STEP_FOURTH_PREFIX4;
	movlw	(07h)
	movwf	(_ucADC4_Step)
	line	1802
;main.c: 1802: break;
	goto	l5275
	line	1815
	
l5871:	
;main.c: 1808: {
;main.c: 1813: static unsigned char ucDelayPrefix4TimerP5s;
;main.c: 1815: ucDelayPrefix4TimerP5s++;
	bsf	status, 5	;RP0=1, select bank1
	incf	(main@ucDelayPrefix4TimerP5s)^080h,f
	line	1817
	
l5873:	
;main.c: 1817: if( ucDelayPrefix4TimerP5s >= 10)
	movlw	(0Ah)
	subwf	(main@ucDelayPrefix4TimerP5s)^080h,w
	skipc
	goto	u3081
	goto	u3080
u3081:
	goto	l772
u3080:
	line	1819
	
l5875:	
;main.c: 1818: {
;main.c: 1819: ucDelayPrefix4TimerP5s = 0;
	clrf	(main@ucDelayPrefix4TimerP5s)^080h
	line	1821
	
l5877:	
;main.c: 1821: ucADC4_Step = ADC4_STEP_FOURTH_PREFIX5;
	movlw	(08h)
	bcf	status, 5	;RP0=0, select bank0
	movwf	(_ucADC4_Step)
	goto	l5275
	line	1828
	
l5879:	
;main.c: 1827: {
;main.c: 1828: setPA3(1);
	movlw	(01h)
	fcall	_setPA3
	line	1829
;main.c: 1829: setPB4(1);
	movlw	(01h)
	fcall	_setPB4
	line	1831
	
l5881:	
;main.c: 1831: setPB6AsInput();
	fcall	_setPB6AsInput
	line	1832
;main.c: 1832: ucADC4_Step = ADC4_STEP_FOURTH_PREFIX6;
	movlw	(09h)
	bcf	status, 5	;RP0=0, select bank0
	movwf	(_ucADC4_Step)
	line	1834
;main.c: 1834: break;
	goto	l5275
	line	1842
	
l5883:	
;main.c: 1839: {
;main.c: 1840: static unsigned char ucDelayPrefix6TimerP2s;
;main.c: 1842: ucDelayPrefix6TimerP2s++;
	bsf	status, 5	;RP0=1, select bank1
	incf	(main@ucDelayPrefix6TimerP2s)^080h,f
	line	1844
	
l5885:	
;main.c: 1844: if( ucDelayPrefix6TimerP2s >= 2)
	movlw	(02h)
	subwf	(main@ucDelayPrefix6TimerP2s)^080h,w
	skipc
	goto	u3091
	goto	u3090
u3091:
	goto	l772
u3090:
	line	1846
	
l5887:	
;main.c: 1845: {
;main.c: 1846: ucDelayPrefix6TimerP2s = 0;
	clrf	(main@ucDelayPrefix6TimerP2s)^080h
	line	1848
;main.c: 1848: ucADC4_Step = ADC4_STEP_INIT;
	bcf	status, 5	;RP0=0, select bank0
	clrf	(_ucADC4_Step)
	goto	l5327
	line	1906
	
l5891:	
;main.c: 1900: {
;main.c: 1904: static unsigned char ucFourthSuffix1TimerP3s = 0;
;main.c: 1906: ucFourthSuffix1TimerP3s++;
	bsf	status, 5	;RP0=1, select bank1
	incf	(main@ucFourthSuffix1TimerP3s)^080h,f
	line	1908
	
l5893:	
;main.c: 1908: if( ucFourthSuffix1TimerP3s > 3)
	movlw	(04h)
	subwf	(main@ucFourthSuffix1TimerP3s)^080h,w
	skipc
	goto	u3101
	goto	u3100
u3101:
	goto	l772
u3100:
	line	1910
	
l5895:	
;main.c: 1909: {
;main.c: 1910: ucFourthSuffix1TimerP3s = 0;
	clrf	(main@ucFourthSuffix1TimerP3s)^080h
	line	1911
	
l5897:	
;main.c: 1911: ucADC4_Step = ADC4_STEP_FOURTH_SUFFIX2;
	movlw	(0Ch)
	bcf	status, 5	;RP0=0, select bank0
	movwf	(_ucADC4_Step)
	goto	l5275
	line	1923
	
l5899:	
;main.c: 1918: {
;main.c: 1923: setPA6(0);
	movlw	(0)
	fcall	_setPA6
	line	1925
	
l5901:	
;main.c: 1925: clearPinPortAndTimer();
	fcall	_clearPinPortAndTimer
	line	1926
	
l5903:	
;main.c: 1926: ucADC4_Step = ADC4_STEP_INIT;
	clrf	(_ucADC4_Step)
	line	1928
	
l5905:	
;main.c: 1928: enumMainLoopStep = MAIN_LOOP_STEP_FIRST;
	clrf	(_enumMainLoopStep)
	incf	(_enumMainLoopStep),f
	line	1929
;main.c: 1929: break;
	goto	l5275
	line	943
	
l5909:	
	bcf	status, 5	;RP0=0, select bank0
	movf	(_ucADC4_Step),w
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
goto l772
movlw high(S6313)
movwf pclath
	clrc
	rlf fsr,w
	addlw low(S6313)
	movwf pc
psect	swtext4,local,class=CONST,delta=2
global __pswtext4
__pswtext4:
S6313:
	ljmp	l813
	ljmp	l5381
	ljmp	l5703
	ljmp	l5705
	ljmp	l5737
	ljmp	l5743
	ljmp	l5863
	ljmp	l5871
	ljmp	l5879
	ljmp	l5883
	ljmp	l772
	ljmp	l5891
	ljmp	l5899
psect	maintext

	line	1956
;main.c: 1955: {
;main.c: 1956: case HOUR_3_BRANCH_STEP_FIRST:
	
l1059:	
	line	1959
;main.c: 1957: {
;main.c: 1959: PB7 = 1;
	bcf	status, 5	;RP0=0, select bank0
	bsf	(55/8),(55)&7
	line	1960
;main.c: 1960: PBOD7 = 1;
	bsf	status, 5	;RP0=1, select bank3
	bsf	status, 6	;RP1=1, select bank3
	bsf	(3143/8)^0180h,(3143)&7
	line	1965
	
l5911:	
;main.c: 1965: startThreeHoursTimer(180);
	movlw	0B4h
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	movwf	(?_startThreeHoursTimer)
	clrf	(?_startThreeHoursTimer+1)
	fcall	_startThreeHoursTimer
	line	1969
;main.c: 1969: setPA0(1);
	movlw	(01h)
	fcall	_setPA0
	line	1971
;main.c: 1971: setPA1(1);
	movlw	(01h)
	fcall	_setPA1
	line	1973
;main.c: 1973: setPB0(1);
	movlw	(01h)
	fcall	_setPB0
	line	1975
;main.c: 1975: setPB1(1);
	movlw	(01h)
	fcall	_setPB1
	line	1977
;main.c: 1977: setPB2(1);
	movlw	(01h)
	fcall	_setPB2
	line	1979
;main.c: 1979: setPB4(0);
	movlw	(0)
	fcall	_setPB4
	line	1981
	
l5913:	
;main.c: 1981: enumBranchStep = HOUR_3_BRANCH_STEP_SECOND;
	bsf	status, 5	;RP0=1, select bank1
	clrf	(main@enumBranchStep)^080h
	incf	(main@enumBranchStep)^080h,f
	line	1982
;main.c: 1982: break;
	goto	l5275
	line	1991
	
l5915:	
;main.c: 1986: {
;main.c: 1991: enumBranchStep = HOUR_3_BRANCH_STEP_THIRD;
	movlw	(02h)
	movwf	(main@enumBranchStep)^080h
	line	1992
;main.c: 1992: break;
	goto	l5275
	line	2000
	
l5917:	
;main.c: 1996: {
;main.c: 2000: if( (isFinishedTwelveHoursTimer()) || (isFinishedThreeHoursTimer()))
	fcall	_isFinishedTwelveHoursTimer
	iorlw	0
	skipz
	goto	u3111
	goto	u3110
u3111:
	goto	l5921
u3110:
	
l5919:	
	fcall	_isFinishedThreeHoursTimer
	xorlw	0
	skipnz
	goto	u3121
	goto	u3120
u3121:
	goto	l5925
u3120:
	line	2002
	
l5921:	
;main.c: 2001: {
;main.c: 2002: enumBranchStep = HOUR_3_BRANCH_STEP_FIRST;
	bsf	status, 5	;RP0=1, select bank1
	clrf	(main@enumBranchStep)^080h
	goto	l5295
	line	2011
	
l5925:	
;main.c: 2005: else
;main.c: 2006: {
;main.c: 2007: static unsigned char ucTimerX1P5s = 0;
;main.c: 2009: static unsigned char ucTimerLessX1P5s = 0;
;main.c: 2011: if(getAdOriginalCh6Value() <= 85)
	fcall	_getAdOriginalCh6Value
	movlw	high(056h)
	subwf	(1+(?_getAdOriginalCh6Value)),w
	movlw	low(056h)
	skipnz
	subwf	(0+(?_getAdOriginalCh6Value)),w
	skipnc
	goto	u3131
	goto	u3130
u3131:
	goto	l5931
u3130:
	line	2013
	
l5927:	
;main.c: 2012: {
;main.c: 2013: ucTimerX1P5s = 0;
	bsf	status, 5	;RP0=1, select bank1
	clrf	(main@ucTimerX1P5s)^080h
	line	2014
	
l5929:	
;main.c: 2014: ucTimerLessX1P5s++;
	incf	(main@ucTimerLessX1P5s)^080h,f
	line	2015
;main.c: 2015: }
	goto	l5935
	line	2018
	
l5931:	
;main.c: 2016: else
;main.c: 2017: {
;main.c: 2018: ucTimerX1P5s++;
	bsf	status, 5	;RP0=1, select bank1
	incf	(main@ucTimerX1P5s)^080h,f
	line	2019
	
l5933:	
;main.c: 2019: ucTimerLessX1P5s = 0;
	clrf	(main@ucTimerLessX1P5s)^080h
	line	2022
	
l5935:	
;main.c: 2020: }
;main.c: 2022: if(ucTimerX1P5s >= 5)
	movlw	(05h)
	subwf	(main@ucTimerX1P5s)^080h,w
	skipc
	goto	u3141
	goto	u3140
u3141:
	goto	l5949
u3140:
	line	2024
	
l5937:	
;main.c: 2023: {
;main.c: 2024: ucTimerX1P5s = 0;
	clrf	(main@ucTimerX1P5s)^080h
	line	2026
;main.c: 2026: ucTimerLessX1P5s = 0;
	clrf	(main@ucTimerLessX1P5s)^080h
	line	2030
	
l5939:	
;main.c: 2030: PBOD7 = 0;
	bsf	status, 6	;RP1=1, select bank3
	bcf	(3143/8)^0180h,(3143)&7
	line	2031
	
l5941:	
;main.c: 2031: PB7 = 0;
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	bcf	(55/8),(55)&7
	line	2036
	
l5943:	
;main.c: 2036: clearThreeHoursTimer();
	fcall	_clearThreeHoursTimer
	line	2038
	
l5945:	
;main.c: 2038: enumBranchStep = HOUR_3_BRANCH_STEP_FIRST;
	bsf	status, 5	;RP0=1, select bank1
	clrf	(main@enumBranchStep)^080h
	line	2040
	
l5947:	
;main.c: 2040: enumMainLoopStep = MAIN_LOOP_STEP_SECOND;
	movlw	(02h)
	bcf	status, 5	;RP0=0, select bank0
	movwf	(_enumMainLoopStep)
	line	2041
;main.c: 2041: }
	goto	l5275
	line	2042
	
l5949:	
;main.c: 2042: else if(ucTimerLessX1P5s >= 5)
	movlw	(05h)
	subwf	(main@ucTimerLessX1P5s)^080h,w
	skipc
	goto	u3151
	goto	u3150
u3151:
	goto	l772
u3150:
	line	2048
	
l5951:	
;main.c: 2043: {
;main.c: 2044: static unsigned char ucTimerX2P5s = 0;
;main.c: 2046: static unsigned char ucTimerLessX2P5s = 0;
;main.c: 2048: if(getAdOriginalCh6Value() > 20)
	fcall	_getAdOriginalCh6Value
	movlw	high(015h)
	subwf	(1+(?_getAdOriginalCh6Value)),w
	movlw	low(015h)
	skipnz
	subwf	(0+(?_getAdOriginalCh6Value)),w
	skipc
	goto	u3161
	goto	u3160
u3161:
	goto	l5957
u3160:
	line	2050
	
l5953:	
;main.c: 2049: {
;main.c: 2050: ucTimerX2P5s++;
	bsf	status, 5	;RP0=1, select bank1
	incf	(main@ucTimerX2P5s)^080h,f
	line	2051
	
l5955:	
;main.c: 2051: ucTimerLessX2P5s = 0;
	clrf	(main@ucTimerLessX2P5s)^080h
	line	2052
;main.c: 2052: }
	goto	l5961
	line	2055
	
l5957:	
;main.c: 2053: else
;main.c: 2054: {
;main.c: 2055: ucTimerX2P5s = 0;
	bsf	status, 5	;RP0=1, select bank1
	clrf	(main@ucTimerX2P5s)^080h
	line	2056
	
l5959:	
;main.c: 2056: ucTimerLessX2P5s++;
	incf	(main@ucTimerLessX2P5s)^080h,f
	line	2059
	
l5961:	
;main.c: 2057: }
;main.c: 2059: if(ucTimerX2P5s >= 5)
	movlw	(05h)
	subwf	(main@ucTimerX2P5s)^080h,w
	skipc
	goto	u3171
	goto	u3170
u3171:
	goto	l5965
u3170:
	line	2061
	
l5963:	
;main.c: 2060: {
;main.c: 2061: ucTimerX2P5s = 0;
	clrf	(main@ucTimerX2P5s)^080h
	line	2062
;main.c: 2062: }
	goto	l5275
	line	2063
	
l5965:	
;main.c: 2063: else if(ucTimerLessX2P5s >= 5)
	movlw	(05h)
	subwf	(main@ucTimerLessX2P5s)^080h,w
	skipc
	goto	u3181
	goto	u3180
u3181:
	goto	l772
u3180:
	line	2065
	
l5967:	
;main.c: 2064: {
;main.c: 2065: clearParaFunction1();
	fcall	_clearParaFunction1
	line	2066
	
l5969:	
;main.c: 2066: enumMainLoopStep = MAIN_LOOP_STEP_FIRST;
	clrf	(_enumMainLoopStep)
	incf	(_enumMainLoopStep),f
	line	2067
	
l5971:	
;main.c: 2067: enumBranchStep = HOUR_3_BRANCH_STEP_FIRST;
	bsf	status, 5	;RP0=1, select bank1
	clrf	(main@enumBranchStep)^080h
	line	2069
	
l5973:	
;main.c: 2069: ucTimerLessX2P5s = 0;
	clrf	(main@ucTimerLessX2P5s)^080h
	goto	l5963
	line	1954
	
l5979:	
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
	goto	l1059
	xorlw	1^0	; case 1
	skipnz
	goto	l5915
	xorlw	2^1	; case 2
	skipnz
	goto	l5917
	goto	l772
	opt asmopt_on

	line	2118
	
l5981:	
;main.c: 2113: {
;main.c: 2118: setPA2(0);
	movlw	(0)
	fcall	_setPA2
	line	2119
;main.c: 2119: setPA1(0);
	movlw	(0)
	fcall	_setPA1
	line	2120
;main.c: 2120: setPA0(0);
	movlw	(0)
	fcall	_setPA0
	line	2121
;main.c: 2121: setPB0(0);
	movlw	(0)
	fcall	_setPB0
	line	2122
;main.c: 2122: setPB1(0);
	movlw	(0)
	fcall	_setPB1
	line	2123
;main.c: 2123: setPB2(0);
	movlw	(0)
	fcall	_setPB2
	line	2124
;main.c: 2124: setPA3(0);
	movlw	(0)
	fcall	_setPA3
	line	2125
;main.c: 2125: setPB4(0);
	movlw	(0)
	fcall	_setPB4
	line	2127
	
l5983:	
;main.c: 2127: enumInteralStep = INTERNAL_SECOND_STEP;
	bsf	status, 5	;RP0=1, select bank1
	clrf	(main@enumInteralStep)^080h
	incf	(main@enumInteralStep)^080h,f
	line	2128
;main.c: 2128: break;
	goto	l5275
	line	2138
	
l5985:	
;main.c: 2132: {
;main.c: 2136: static unsigned char ucTimer1s = 0;
;main.c: 2138: if(getAdOriginalCh0Value() >= 2500)
	fcall	_getAdOriginalCh0Value
	movlw	high(09C4h)
	subwf	(1+(?_getAdOriginalCh0Value)),w
	movlw	low(09C4h)
	skipnz
	subwf	(0+(?_getAdOriginalCh0Value)),w
	skipc
	goto	u3191
	goto	u3190
u3191:
	goto	l5989
u3190:
	line	2140
	
l5987:	
;main.c: 2139: {
;main.c: 2140: ucTimer1s++;
	bsf	status, 5	;RP0=1, select bank1
	incf	(main@ucTimer1s)^080h,f
	line	2141
;main.c: 2141: }
	goto	l5991
	line	2143
	
l5989:	
;main.c: 2142: else
;main.c: 2143: ucTimer1s = 0;
	bsf	status, 5	;RP0=1, select bank1
	clrf	(main@ucTimer1s)^080h
	line	2145
	
l5991:	
;main.c: 2145: if(ucTimer1s >= 10)
	movlw	(0Ah)
	subwf	(main@ucTimer1s)^080h,w
	skipc
	goto	u3201
	goto	u3200
u3201:
	goto	l772
u3200:
	line	2147
	
l5993:	
;main.c: 2146: {
;main.c: 2147: enumInteralStep = INTERNAL_THIRD_STEP;
	movlw	(02h)
	movwf	(main@enumInteralStep)^080h
	line	2148
	
l5995:	
;main.c: 2148: ucTimer1s = 0;
	clrf	(main@ucTimer1s)^080h
	goto	l5275
	line	2160
	
l5997:	
;main.c: 2154: {
;main.c: 2158: static unsigned char ucTimerP3s = 0;
;main.c: 2160: if(getAdOriginalCh0Value() <= 1950)
	fcall	_getAdOriginalCh0Value
	movlw	high(079Fh)
	subwf	(1+(?_getAdOriginalCh0Value)),w
	movlw	low(079Fh)
	skipnz
	subwf	(0+(?_getAdOriginalCh0Value)),w
	skipnc
	goto	u3211
	goto	u3210
u3211:
	goto	l6001
u3210:
	line	2162
	
l5999:	
;main.c: 2161: {
;main.c: 2162: ucTimerP3s++;
	bsf	status, 5	;RP0=1, select bank1
	incf	(main@ucTimerP3s)^080h,f
	line	2163
;main.c: 2163: }
	goto	l6003
	line	2165
	
l6001:	
;main.c: 2164: else
;main.c: 2165: ucTimerP3s = 0;
	bsf	status, 5	;RP0=1, select bank1
	clrf	(main@ucTimerP3s)^080h
	line	2167
	
l6003:	
;main.c: 2167: if(ucTimerP3s >= 3)
	movlw	(03h)
	subwf	(main@ucTimerP3s)^080h,w
	skipc
	goto	u3221
	goto	u3220
u3221:
	goto	l772
u3220:
	line	2169
	
l6005:	
;main.c: 2168: {
;main.c: 2169: enumInteralStep = INTERNAL_FIRST_STEP;
	clrf	(main@enumInteralStep)^080h
	line	2170
;main.c: 2170: ucTimerP3s = 0;
	clrf	(main@ucTimerP3s)^080h
	line	2172
	
l6007:	
;main.c: 2172: clearAllTimer();
	fcall	_clearAllTimer
	line	2174
	
l6009:	
;main.c: 2174: initPin();
	fcall	_initPin
	line	2177
;main.c: 2177: enumMainLoopStep = MAIN_LOOP_STEP_INIT;
	bcf	status, 5	;RP0=0, select bank0
	clrf	(_enumMainLoopStep)
	line	2179
	
l1107:	
	goto	l1107
	line	2110
	
l6013:	
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
	goto	l5981
	xorlw	1^0	; case 1
	skipnz
	goto	l5985
	xorlw	2^1	; case 2
	skipnz
	goto	l5997
	goto	l772
	opt asmopt_on

	line	751
	
l6017:	
	bcf	status, 5	;RP0=0, select bank0
	movf	(_enumMainLoopStep),w
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
	goto	l5281
	xorlw	1^0	; case 1
	skipnz
	goto	l5297
	xorlw	2^1	; case 2
	skipnz
	goto	l5317
	xorlw	3^2	; case 3
	skipnz
	goto	l5329
	xorlw	4^3	; case 4
	skipnz
	goto	l5367
	xorlw	5^4	; case 5
	skipnz
	goto	l5373
	xorlw	8^5	; case 8
	skipnz
	goto	l5979
	xorlw	9^8	; case 9
	skipnz
	goto	l6013
	goto	l772
	opt asmopt_on

	global	start
	ljmp	start
	opt stack 0
psect	maintext
	line	2204
GLOBAL	__end_of_main
	__end_of_main:
;; =============== function _main ends ============

	signat	_main,88
	global	_call_ADC4_STEP_FOURTH_PREFIX2
psect	text990,local,class=CODE,delta=2
global __ptext990
__ptext990:

;; *************** function _call_ADC4_STEP_FOURTH_PREFIX2 *****************
;; Defined at:
;;		line 2208 in file "C:\temp\dev\AK7030-OTP\main.c"
;; Parameters:    Size  Location     Type
;;		None
;; Auto vars:     Size  Location     Type
;;		None
;; Return value:  Size  Location     Type
;;		None               void
;; Registers used:
;;		wreg, fsr0l, fsr0h, status,2, status,0, btemp+1, pclath, cstack
;; Tracked objects:
;;		On entry : 140/0
;;		On exit  : 140/0
;;		Unchanged: FFE00/0
;; Data sizes:     COMMON   BANK0   BANK1   BANK3   BANK2
;;      Params:         0       0       0       0       0
;;      Locals:         0       0       0       0       0
;;      Temps:          0       0       0       0       0
;;      Totals:         0       0       0       0       0
;;Total ram usage:        0 bytes
;; Hardware stack levels used:    1
;; Hardware stack levels required when called:    4
;; This function calls:
;;		_getAdOriginalCh2Value
;;		_getAdOriginalCh6Value
;;		_setPA3
;;		_setPB6
;;		_setPB6AsInput
;; This function is called by:
;;		_main
;; This function uses a non-reentrant model
;;
psect	text990
	file	"C:\temp\dev\AK7030-OTP\main.c"
	line	2208
	global	__size_of_call_ADC4_STEP_FOURTH_PREFIX2
	__size_of_call_ADC4_STEP_FOURTH_PREFIX2	equ	__end_of_call_ADC4_STEP_FOURTH_PREFIX2-_call_ADC4_STEP_FOURTH_PREFIX2
	
_call_ADC4_STEP_FOURTH_PREFIX2:	
	opt	stack 3
; Regs used in _call_ADC4_STEP_FOURTH_PREFIX2: [wreg-fsr0h+status,2+status,0+btemp+1+pclath+cstack]
	line	2232
	
l5127:	
;main.c: 2209: enum enum_prefix2_step
;main.c: 2210: {
;main.c: 2211: prefix2_step1 = 0,
;main.c: 2212: prefix2_step2,
;main.c: 2213: prefix2_step3,
;main.c: 2214: prefix2_step4,
;main.c: 2215: prefix2_step5,
;main.c: 2216: prefix2_step6,
;main.c: 2217: prefix2_step7,
;main.c: 2218: prefix2_step8,
;main.c: 2219: prefix2_step9,
;main.c: 2220: };
;main.c: 2226: static unsigned char ucTimerCntMore = 0, ucTimerCntLess = 0;
;main.c: 2228: static unsigned char ucTimerCntMoreFlag = 0, ucTimerCntLessFlag = 0;
;main.c: 2230: static unsigned char ucCompareStep = 0;
	goto	l5251
	line	2236
	
l5129:	
;main.c: 2235: {
;main.c: 2236: if((getAdOriginalCh2Value() > 1950))
	fcall	_getAdOriginalCh2Value
	movlw	high(079Fh)
	subwf	(1+(?_getAdOriginalCh2Value)),w
	movlw	low(079Fh)
	skipnz
	subwf	(0+(?_getAdOriginalCh2Value)),w
	skipc
	goto	u2201
	goto	u2200
u2201:
	goto	l5135
u2200:
	line	2238
	
l5131:	
;main.c: 2237: {
;main.c: 2238: ucTimerCntMore++;
	bsf	status, 5	;RP0=1, select bank1
	incf	(call_ADC4_STEP_FOURTH_PREFIX2@ucTimerCntMore)^080h,f
	line	2239
	
l5133:	
;main.c: 2239: ucTimerCntLess = 0;
	clrf	(call_ADC4_STEP_FOURTH_PREFIX2@ucTimerCntLess)^080h
	line	2240
;main.c: 2240: }
	goto	l5139
	line	2243
	
l5135:	
;main.c: 2241: else
;main.c: 2242: {
;main.c: 2243: ucTimerCntLess++;
	bsf	status, 5	;RP0=1, select bank1
	incf	(call_ADC4_STEP_FOURTH_PREFIX2@ucTimerCntLess)^080h,f
	line	2244
	
l5137:	
;main.c: 2244: ucTimerCntMore = 0;
	clrf	(call_ADC4_STEP_FOURTH_PREFIX2@ucTimerCntMore)^080h
	line	2247
	
l5139:	
;main.c: 2248: {
;main.c: 2249: ucTimerCntMoreFlag = 1;
	movlw	(02h)
	subwf	(call_ADC4_STEP_FOURTH_PREFIX2@ucTimerCntMore)^080h,w
	skipc
	goto	u2211
	goto	u2210
u2211:
	goto	l5143
u2210:
	line	2250
	
l5141:	
;main.c: 2250: ucCompareStep = 1;
	clrf	(call_ADC4_STEP_FOURTH_PREFIX2@ucCompareStep)^080h
	incf	(call_ADC4_STEP_FOURTH_PREFIX2@ucCompareStep)^080h,f
	line	2252
	
l5143:	
;main.c: 2253: {
;main.c: 2254: ucTimerCntLessFlag = 1;
	movlw	(02h)
	subwf	(call_ADC4_STEP_FOURTH_PREFIX2@ucTimerCntLess)^080h,w
	skipc
	goto	u2221
	goto	u2220
u2221:
	goto	l5253
u2220:
	line	2255
	
l5145:	
;main.c: 2255: ucCompareStep = 2;
	movlw	(02h)
	movwf	(call_ADC4_STEP_FOURTH_PREFIX2@ucCompareStep)^080h
	goto	l5253
	line	2267
	
l5147:	
;main.c: 2260: {
;main.c: 2261: static unsigned char ucMoreThanP8sCnt = 0;
;main.c: 2263: static unsigned char ucLessThanP8sCnt = 0;
;main.c: 2265: static unsigned char ucTimerCntN1 = 0;
;main.c: 2267: if((getAdOriginalCh2Value() < 1950))
	fcall	_getAdOriginalCh2Value
	movlw	high(079Eh)
	subwf	(1+(?_getAdOriginalCh2Value)),w
	movlw	low(079Eh)
	skipnz
	subwf	(0+(?_getAdOriginalCh2Value)),w
	skipnc
	goto	u2231
	goto	u2230
u2231:
	goto	l5157
u2230:
	line	2269
	
l5149:	
;main.c: 2268: {
;main.c: 2269: ucTimerCntN1++;
	bsf	status, 5	;RP0=1, select bank1
	incf	(call_ADC4_STEP_FOURTH_PREFIX2@ucTimerCntN1)^080h,f
	line	2270
	
l5151:	
;main.c: 2270: if(ucTimerCntN1 >= 2)
	movlw	(02h)
	subwf	(call_ADC4_STEP_FOURTH_PREFIX2@ucTimerCntN1)^080h,w
	skipc
	goto	u2241
	goto	u2240
u2241:
	goto	l5159
u2240:
	line	2272
	
l5153:	
;main.c: 2271: {
;main.c: 2272: ucTimerCntN1 = 0;
	clrf	(call_ADC4_STEP_FOURTH_PREFIX2@ucTimerCntN1)^080h
	line	2273
	
l5155:	
;main.c: 2273: ucCompareStep = 2;
	movlw	(02h)
	movwf	(call_ADC4_STEP_FOURTH_PREFIX2@ucCompareStep)^080h
	goto	l5159
	line	2277
	
l5157:	
;main.c: 2276: else
;main.c: 2277: ucTimerCntN1 = 0;
	bsf	status, 5	;RP0=1, select bank1
	clrf	(call_ADC4_STEP_FOURTH_PREFIX2@ucTimerCntN1)^080h
	line	2283
	
l5159:	
;main.c: 2283: if((getAdOriginalCh6Value() < 50))
	fcall	_getAdOriginalCh6Value
	movlw	high(032h)
	subwf	(1+(?_getAdOriginalCh6Value)),w
	movlw	low(032h)
	skipnz
	subwf	(0+(?_getAdOriginalCh6Value)),w
	skipnc
	goto	u2251
	goto	u2250
u2251:
	goto	l5169
u2250:
	line	2285
	
l5161:	
;main.c: 2284: {
;main.c: 2285: ucLessThanP8sCnt++;
	bsf	status, 5	;RP0=1, select bank1
	incf	(call_ADC4_STEP_FOURTH_PREFIX2@ucLessThanP8sCnt)^080h,f
	line	2286
	
l5163:	
;main.c: 2286: ucMoreThanP8sCnt = 0;
	clrf	(call_ADC4_STEP_FOURTH_PREFIX2@ucMoreThanP8sCnt)^080h
	line	2288
	
l5165:	
;main.c: 2288: ucLessThanP8sCnt = 0;
	clrf	(call_ADC4_STEP_FOURTH_PREFIX2@ucLessThanP8sCnt)^080h
	line	2289
;main.c: 2289: break;
	goto	l5253
	line	2293
	
l5169:	
;main.c: 2291: else
;main.c: 2292: {
;main.c: 2293: ucMoreThanP8sCnt++;
	bsf	status, 5	;RP0=1, select bank1
	incf	(call_ADC4_STEP_FOURTH_PREFIX2@ucMoreThanP8sCnt)^080h,f
	line	2294
	
l5171:	
;main.c: 2294: ucLessThanP8sCnt = 0;
	clrf	(call_ADC4_STEP_FOURTH_PREFIX2@ucLessThanP8sCnt)^080h
	line	2307
	
l5179:	
;main.c: 2307: else if( ucMoreThanP8sCnt >= 8 )
	movlw	(08h)
	subwf	(call_ADC4_STEP_FOURTH_PREFIX2@ucMoreThanP8sCnt)^080h,w
	skipc
	goto	u2261
	goto	u2260
u2261:
	goto	l5253
u2260:
	line	2309
	
l5181:	
;main.c: 2308: {
;main.c: 2309: ucLessThanP8sCnt = 0;
	clrf	(call_ADC4_STEP_FOURTH_PREFIX2@ucLessThanP8sCnt)^080h
	line	2310
;main.c: 2310: ucMoreThanP8sCnt = 0;
	clrf	(call_ADC4_STEP_FOURTH_PREFIX2@ucMoreThanP8sCnt)^080h
	line	2312
	
l5183:	
;main.c: 2312: enumMainLoopStep = MAIN_LOOP_STEP_THIRD;
	movlw	(03h)
	bcf	status, 5	;RP0=0, select bank0
	movwf	(_enumMainLoopStep)
	line	2313
	
l5185:	
;main.c: 2314: ucTimerCntMoreFlag = 0;
	clrf	(_ucADC4_Step)
	line	2316
;main.c: 2315: ;
;main.c: 2316: }
	goto	l5253
	line	2336
	
l5187:	
;main.c: 2332: {
;main.c: 2336: ucTimeCntP2s = 0;
	clrf	(call_ADC4_STEP_FOURTH_PREFIX2@ucTimeCntP2s)^080h
	line	2337
	
l5189:	
;main.c: 2337: setPA3(0);
	movlw	(0)
	fcall	_setPA3
	line	2338
	
l5191:	
;main.c: 2338: setPB6(0);
	movlw	(0)
	fcall	_setPB6
	line	2339
	
l5193:	
;main.c: 2339: ucPrefix2Step = prefix2_step2;
	bsf	status, 5	;RP0=1, select bank1
	clrf	(call_ADC4_STEP_FOURTH_PREFIX2@ucPrefix2Step)^080h
	incf	(call_ADC4_STEP_FOURTH_PREFIX2@ucPrefix2Step)^080h,f
	line	2340
;main.c: 2340: break;
	goto	l5253
	line	2348
	
l5195:	
;main.c: 2344: {
;main.c: 2348: if((getAdOriginalCh2Value() > 2300))
	fcall	_getAdOriginalCh2Value
	movlw	high(08FDh)
	subwf	(1+(?_getAdOriginalCh2Value)),w
	movlw	low(08FDh)
	skipnz
	subwf	(0+(?_getAdOriginalCh2Value)),w
	skipc
	goto	u2271
	goto	u2270
u2271:
	goto	l5199
u2270:
	line	2350
	
l5197:	
;main.c: 2349: {
;main.c: 2350: ucTimeCntP2s++;
	bsf	status, 5	;RP0=1, select bank1
	incf	(call_ADC4_STEP_FOURTH_PREFIX2@ucTimeCntP2s)^080h,f
	line	2351
;main.c: 2351: }
	goto	l5201
	line	2353
	
l5199:	
;main.c: 2352: else
;main.c: 2353: ucTimeCntP2s = 0;
	bsf	status, 5	;RP0=1, select bank1
	clrf	(call_ADC4_STEP_FOURTH_PREFIX2@ucTimeCntP2s)^080h
	line	2355
	
l5201:	
;main.c: 2355: if( ucTimeCntP2s >= 2)
	movlw	(02h)
	subwf	(call_ADC4_STEP_FOURTH_PREFIX2@ucTimeCntP2s)^080h,w
	skipc
	goto	u2281
	goto	u2280
u2281:
	goto	l5253
u2280:
	line	2357
	
l5203:	
;main.c: 2356: {
;main.c: 2357: ucTimeCntP2s = 0;
	clrf	(call_ADC4_STEP_FOURTH_PREFIX2@ucTimeCntP2s)^080h
	line	2358
	
l5205:	
;main.c: 2358: ucPrefix2Step = prefix2_step3;
	movlw	(02h)
	movwf	(call_ADC4_STEP_FOURTH_PREFIX2@ucPrefix2Step)^080h
	goto	l5253
	line	2370
	
l5207:	
;main.c: 2366: {
;main.c: 2370: setPA3(1);
	movlw	(01h)
	fcall	_setPA3
	line	2372
	
l5209:	
;main.c: 2372: setPB6AsInput();
	fcall	_setPB6AsInput
	line	2373
;main.c: 2373: ucPrefix2Step = prefix2_step4;
	movlw	(03h)
	movwf	(call_ADC4_STEP_FOURTH_PREFIX2@ucPrefix2Step)^080h
	line	2374
;main.c: 2374: break;
	goto	l5253
	line	2383
	
l5211:	
;main.c: 2378: {
;main.c: 2382: static unsigned char ucTimerCntP5s = 0;
;main.c: 2383: if( ucTimerCntP5s < 5)
	movlw	(05h)
	subwf	(call_ADC4_STEP_FOURTH_PREFIX2@ucTimerCntP5s)^080h,w
	skipnc
	goto	u2291
	goto	u2290
u2291:
	goto	l5215
u2290:
	line	2384
	
l5213:	
;main.c: 2384: ucTimerCntP5s++;
	incf	(call_ADC4_STEP_FOURTH_PREFIX2@ucTimerCntP5s)^080h,f
	goto	l5253
	line	2387
	
l5215:	
;main.c: 2385: else
;main.c: 2386: {
;main.c: 2387: ucTimerCntP5s = 0;
	clrf	(call_ADC4_STEP_FOURTH_PREFIX2@ucTimerCntP5s)^080h
	line	2388
	
l5217:	
;main.c: 2388: ucPrefix2Step = prefix2_step5;
	movlw	(04h)
	movwf	(call_ADC4_STEP_FOURTH_PREFIX2@ucPrefix2Step)^080h
	goto	l5253
	line	2402
	
l5219:	
;main.c: 2395: {
;main.c: 2399: static unsigned char ucMoreThanP3sCnt = 0;
;main.c: 2401: static unsigned char ucLessThanP3sCnt = 0;
;main.c: 2402: if((getAdOriginalCh6Value() < 50))
	fcall	_getAdOriginalCh6Value
	movlw	high(032h)
	subwf	(1+(?_getAdOriginalCh6Value)),w
	movlw	low(032h)
	skipnz
	subwf	(0+(?_getAdOriginalCh6Value)),w
	skipnc
	goto	u2301
	goto	u2300
u2301:
	goto	l5225
u2300:
	line	2404
	
l5221:	
;main.c: 2403: {
;main.c: 2404: ucLessThanP3sCnt++;
	bsf	status, 5	;RP0=1, select bank1
	incf	(call_ADC4_STEP_FOURTH_PREFIX2@ucLessThanP3sCnt)^080h,f
	line	2405
	
l5223:	
;main.c: 2405: ucMoreThanP3sCnt = 0;
	clrf	(call_ADC4_STEP_FOURTH_PREFIX2@ucMoreThanP3sCnt)^080h
	line	2406
;main.c: 2406: }
	goto	l5229
	line	2409
	
l5225:	
;main.c: 2407: else
;main.c: 2408: {
;main.c: 2409: ucMoreThanP3sCnt++;
	bsf	status, 5	;RP0=1, select bank1
	incf	(call_ADC4_STEP_FOURTH_PREFIX2@ucMoreThanP3sCnt)^080h,f
	line	2410
	
l5227:	
;main.c: 2410: ucLessThanP3sCnt = 0;
	clrf	(call_ADC4_STEP_FOURTH_PREFIX2@ucLessThanP3sCnt)^080h
	line	2413
	
l5229:	
;main.c: 2411: }
;main.c: 2413: if( ucLessThanP3sCnt >= 3)
	movlw	(03h)
	subwf	(call_ADC4_STEP_FOURTH_PREFIX2@ucLessThanP3sCnt)^080h,w
	skipc
	goto	u2311
	goto	u2310
u2311:
	goto	l5235
u2310:
	line	2415
	
l5231:	
;main.c: 2414: {
;main.c: 2415: ucLessThanP3sCnt = 0;
	clrf	(call_ADC4_STEP_FOURTH_PREFIX2@ucLessThanP3sCnt)^080h
	line	2416
;main.c: 2416: ucMoreThanP3sCnt = 0;
	clrf	(call_ADC4_STEP_FOURTH_PREFIX2@ucMoreThanP3sCnt)^080h
	line	2418
	
l5233:	
;main.c: 2418: enumMainLoopStep = MAIN_LOOP_STEP_FIRST;
	bcf	status, 5	;RP0=0, select bank0
	clrf	(_enumMainLoopStep)
	incf	(_enumMainLoopStep),f
	line	2419
;main.c: 2420: ucTimerCntMoreFlag = 0;
	clrf	(_ucADC4_Step)
	line	2422
;main.c: 2422: ucPrefix2Step = prefix2_step1;
	bsf	status, 5	;RP0=1, select bank1
	clrf	(call_ADC4_STEP_FOURTH_PREFIX2@ucPrefix2Step)^080h
	line	2425
	
l5235:	
;main.c: 2423: }
;main.c: 2425: if(ucMoreThanP3sCnt >= 3)
	movlw	(03h)
	subwf	(call_ADC4_STEP_FOURTH_PREFIX2@ucMoreThanP3sCnt)^080h,w
	skipc
	goto	u2321
	goto	u2320
u2321:
	goto	l5253
u2320:
	line	2427
	
l5237:	
;main.c: 2426: {
;main.c: 2427: ucLessThanP3sCnt = 0;
	clrf	(call_ADC4_STEP_FOURTH_PREFIX2@ucLessThanP3sCnt)^080h
	line	2428
;main.c: 2428: ucMoreThanP3sCnt = 0;
	clrf	(call_ADC4_STEP_FOURTH_PREFIX2@ucMoreThanP3sCnt)^080h
	line	2430
	
l5239:	
;main.c: 2430: enumMainLoopStep = MAIN_LOOP_STEP_THIRD;
	movlw	(03h)
	bcf	status, 5	;RP0=0, select bank0
	movwf	(_enumMainLoopStep)
	line	2431
	
l5241:	
;main.c: 2432: ucTimerCntMoreFlag = 0;
	clrf	(_ucADC4_Step)
	line	2434
	
l5243:	
;main.c: 2434: ucPrefix2Step = prefix2_step1;
	bsf	status, 5	;RP0=1, select bank1
	clrf	(call_ADC4_STEP_FOURTH_PREFIX2@ucPrefix2Step)^080h
	goto	l5253
	line	2329
	
l5247:	
	movf	(call_ADC4_STEP_FOURTH_PREFIX2@ucPrefix2Step)^080h,w
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
	goto	l5187
	xorlw	1^0	; case 1
	skipnz
	goto	l5195
	xorlw	2^1	; case 2
	skipnz
	goto	l5207
	xorlw	3^2	; case 3
	skipnz
	goto	l5211
	xorlw	4^3	; case 4
	skipnz
	goto	l5219
	goto	l5253
	opt asmopt_on

	line	2232
	
l5251:	
	bsf	status, 5	;RP0=1, select bank1
	movf	(call_ADC4_STEP_FOURTH_PREFIX2@ucCompareStep)^080h,w
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
	goto	l5129
	xorlw	1^0	; case 1
	skipnz
	goto	l5147
	xorlw	2^1	; case 2
	skipnz
	goto	l5247
	goto	l5253
	opt asmopt_on

	line	2634
	
l5253:	
;main.c: 2634: if(ADC4_STEP_INIT == ucADC4_Step)
	bcf	status, 5	;RP0=0, select bank0
	movf	(_ucADC4_Step),f
	skipz
	goto	u2331
	goto	u2330
u2331:
	goto	l1179
u2330:
	line	2636
	
l5255:	
;main.c: 2635: {
;main.c: 2636: ucTimerCntMore = 0;
	bsf	status, 5	;RP0=1, select bank1
	clrf	(call_ADC4_STEP_FOURTH_PREFIX2@ucTimerCntMore)^080h
	line	2637
;main.c: 2639: ucTimerCntLessFlag = 0;
	clrf	(call_ADC4_STEP_FOURTH_PREFIX2@ucTimerCntLess)^080h
	line	2642
	
l1179:	
	return
	opt stack 0
GLOBAL	__end_of_call_ADC4_STEP_FOURTH_PREFIX2
	__end_of_call_ADC4_STEP_FOURTH_PREFIX2:
;; =============== function _call_ADC4_STEP_FOURTH_PREFIX2 ends ============

	signat	_call_ADC4_STEP_FOURTH_PREFIX2,88
	global	_process_AD_Converter_Value
psect	text991,local,class=CODE,delta=2
global __ptext991
__ptext991:

;; *************** function _process_AD_Converter_Value *****************
;; Defined at:
;;		line 298 in file "C:\temp\dev\AK7030-OTP\common.c"
;; Parameters:    Size  Location     Type
;;		None
;; Auto vars:     Size  Location     Type
;;		None
;; Return value:  Size  Location     Type
;;		None               void
;; Registers used:
;;		wreg, status,2, status,0, pclath, cstack
;; Tracked objects:
;;		On entry : 0/20
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
psect	text991
	file	"C:\temp\dev\AK7030-OTP\common.c"
	line	298
	global	__size_of_process_AD_Converter_Value
	__size_of_process_AD_Converter_Value	equ	__end_of_process_AD_Converter_Value-_process_AD_Converter_Value
	
_process_AD_Converter_Value:	
	opt	stack 3
; Regs used in _process_AD_Converter_Value: [wreg+status,2+status,0+pclath+cstack]
	line	299
	
l5121:	
;common.c: 299: if(getAD_ConvertFlag())
	fcall	_getAD_ConvertFlag
	xorlw	0
	skipnz
	goto	u2191
	goto	u2190
u2191:
	goto	l1947
u2190:
	line	301
	
l5123:	
;common.c: 300: {
;common.c: 301: setAD_ConvertFlag(0);
	movlw	(0)
	fcall	_setAD_ConvertFlag
	line	302
;common.c: 302: AD_Sample();
	fcall	_AD_Sample
	line	314
	
l5125:	
;common.c: 314: adc_start();
	fcall	_adc_start
	line	316
	
l1947:	
	return
	opt stack 0
GLOBAL	__end_of_process_AD_Converter_Value
	__end_of_process_AD_Converter_Value:
;; =============== function _process_AD_Converter_Value ends ============

	signat	_process_AD_Converter_Value,88
	global	_clearParaFunction1
psect	text992,local,class=CODE,delta=2
global __ptext992
__ptext992:

;; *************** function _clearParaFunction1 *****************
;; Defined at:
;;		line 581 in file "C:\temp\dev\AK7030-OTP\main.c"
;; Parameters:    Size  Location     Type
;;		None
;; Auto vars:     Size  Location     Type
;;		None
;; Return value:  Size  Location     Type
;;		None               void
;; Registers used:
;;		wreg, status,2, status,0, pclath, cstack
;; Tracked objects:
;;		On entry : 140/0
;;		On exit  : 160/0
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
;;		_setPA1
;;		_setPA0
;;		_setPB0
;;		_setPB1
;;		_setPB2
;;		_clearAllTimer
;;		_setPA3
;;		_setPB4
;; This function is called by:
;;		_main
;; This function uses a non-reentrant model
;;
psect	text992
	file	"C:\temp\dev\AK7030-OTP\main.c"
	line	581
	global	__size_of_clearParaFunction1
	__size_of_clearParaFunction1	equ	__end_of_clearParaFunction1-_clearParaFunction1
	
_clearParaFunction1:	
	opt	stack 3
; Regs used in _clearParaFunction1: [wreg+status,2+status,0+pclath+cstack]
	line	582
	
l5113:	
;main.c: 582: setPA1(0);
	movlw	(0)
	fcall	_setPA1
	line	583
;main.c: 583: setPA0(0);
	movlw	(0)
	fcall	_setPA0
	line	585
;main.c: 585: setPB0(0);
	movlw	(0)
	fcall	_setPB0
	line	586
;main.c: 586: setPB1(0);
	movlw	(0)
	fcall	_setPB1
	line	587
;main.c: 587: setPB2(0);
	movlw	(0)
	fcall	_setPB2
	line	589
	
l5115:	
;main.c: 589: clearAllTimer();
	fcall	_clearAllTimer
	line	591
	
l5117:	
;main.c: 591: setPA3(0);
	movlw	(0)
	fcall	_setPA3
	line	592
	
l5119:	
;main.c: 592: setPB4(0);
	movlw	(0)
	fcall	_setPB4
	line	593
	
l758:	
	return
	opt stack 0
GLOBAL	__end_of_clearParaFunction1
	__end_of_clearParaFunction1:
;; =============== function _clearParaFunction1 ends ============

	signat	_clearParaFunction1,88
	global	_clearPinPortAndTimer
psect	text993,local,class=CODE,delta=2
global __ptext993
__ptext993:

;; *************** function _clearPinPortAndTimer *****************
;; Defined at:
;;		line 110 in file "C:\temp\dev\AK7030-OTP\main.c"
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
psect	text993
	file	"C:\temp\dev\AK7030-OTP\main.c"
	line	110
	global	__size_of_clearPinPortAndTimer
	__size_of_clearPinPortAndTimer	equ	__end_of_clearPinPortAndTimer-_clearPinPortAndTimer
	
_clearPinPortAndTimer:	
	opt	stack 3
; Regs used in _clearPinPortAndTimer: [status,2+status,0+pclath+cstack]
	line	112
	
l5109:	
;main.c: 112: PB0 = 0;
	bcf	(48/8),(48)&7
	line	113
;main.c: 113: PA0 = 0;
	bcf	(40/8),(40)&7
	line	114
;main.c: 114: PA1 = 0;
	bcf	(41/8),(41)&7
	line	115
;main.c: 115: PA2 = 0;
	bcf	(42/8),(42)&7
	line	116
;main.c: 116: PA3 = 0;
	bcf	(43/8),(43)&7
	line	119
;main.c: 119: PBOD7 = 0;
	bsf	status, 5	;RP0=1, select bank3
	bsf	status, 6	;RP1=1, select bank3
	bcf	(3143/8)^0180h,(3143)&7
	line	120
;main.c: 120: PB7 = 0;
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	bcf	(55/8),(55)&7
	line	121
	
l5111:	
;main.c: 121: clearAllTimer();
	fcall	_clearAllTimer
	line	125
	
l694:	
	return
	opt stack 0
GLOBAL	__end_of_clearPinPortAndTimer
	__end_of_clearPinPortAndTimer:
;; =============== function _clearPinPortAndTimer ends ============

	signat	_clearPinPortAndTimer,88
	global	_AD_Sample
psect	text994,local,class=CODE,delta=2
global __ptext994
__ptext994:

;; *************** function _AD_Sample *****************
;; Defined at:
;;		line 328 in file "C:\temp\dev\AK7030-OTP\common.c"
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
psect	text994
	file	"C:\temp\dev\AK7030-OTP\common.c"
	line	328
	global	__size_of_AD_Sample
	__size_of_AD_Sample	equ	__end_of_AD_Sample-_AD_Sample
	
_AD_Sample:	
	opt	stack 3
; Regs used in _AD_Sample: [wreg+status,2+status,0+pclath+cstack]
	line	329
	
l5085:	
;common.c: 329: if(sampleTimes < 12)
	movlw	(0Ch)
	bcf	status, 5	;RP0=0, select bank0
	subwf	(_sampleTimes),w
	skipnc
	goto	u2141
	goto	u2140
u2141:
	goto	l1958
u2140:
	line	332
	
l5087:	
;common.c: 330: {
;common.c: 332: sampleTimes++;
	incf	(_sampleTimes),f
	line	334
	
l5089:	
;common.c: 334: if(sampleTimes >= 12)
	movlw	(0Ch)
	subwf	(_sampleTimes),w
	skipc
	goto	u2151
	goto	u2150
u2151:
	goto	l1958
u2150:
	line	336
	
l5091:	
;common.c: 335: {
;common.c: 336: sampleTimes = 0;
	clrf	(_sampleTimes)
	line	338
	
l5093:	
;common.c: 338: if(sampleChannelSelect == 0)
	movf	(_sampleChannelSelect),f
	skipz
	goto	u2161
	goto	u2160
u2161:
	goto	l5097
u2160:
	line	342
	
l5095:	
;common.c: 339: {
;common.c: 342: sampleChannelSelect = 2;
	movlw	(02h)
	movwf	(_sampleChannelSelect)
	line	343
;common.c: 343: }
	goto	l5107
	line	344
	
l5097:	
;common.c: 344: else if(sampleChannelSelect == 2)
	movf	(_sampleChannelSelect),w
	xorlw	02h
	skipz
	goto	u2171
	goto	u2170
u2171:
	goto	l5101
u2170:
	line	347
	
l5099:	
;common.c: 345: {
;common.c: 347: sampleChannelSelect = 5;
	movlw	(05h)
	movwf	(_sampleChannelSelect)
	line	348
;common.c: 348: }
	goto	l5107
	line	349
	
l5101:	
;common.c: 349: else if(sampleChannelSelect == 5)
	movf	(_sampleChannelSelect),w
	xorlw	05h
	skipz
	goto	u2181
	goto	u2180
u2181:
	goto	l5105
u2180:
	line	352
	
l5103:	
;common.c: 350: {
;common.c: 352: sampleChannelSelect = 6;
	movlw	(06h)
	movwf	(_sampleChannelSelect)
	line	353
;common.c: 353: }
	goto	l5107
	line	357
	
l5105:	
;common.c: 354: else
;common.c: 355: {
;common.c: 357: sampleChannelSelect = 0;
	clrf	(_sampleChannelSelect)
	line	363
	
l5107:	
;common.c: 358: }
;common.c: 363: adc_test_init(sampleChannelSelect,3);
	movlw	(03h)
	movwf	(?_adc_test_init)
	movf	(_sampleChannelSelect),w
	fcall	_adc_test_init
	line	367
	
l1958:	
	return
	opt stack 0
GLOBAL	__end_of_AD_Sample
	__end_of_AD_Sample:
;; =============== function _AD_Sample ends ============

	signat	_AD_Sample,88
	global	_getAdOriginalCh2Value
psect	text995,local,class=CODE,delta=2
global __ptext995
__ptext995:

;; *************** function _getAdOriginalCh2Value *****************
;; Defined at:
;;		line 287 in file "C:\temp\dev\AK7030-OTP\common.c"
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
;;		_call_ADC4_STEP_FOURTH_PREFIX2
;; This function uses a non-reentrant model
;;
psect	text995
	file	"C:\temp\dev\AK7030-OTP\common.c"
	line	287
	global	__size_of_getAdOriginalCh2Value
	__size_of_getAdOriginalCh2Value	equ	__end_of_getAdOriginalCh2Value-_getAdOriginalCh2Value
	
_getAdOriginalCh2Value:	
	opt	stack 4
; Regs used in _getAdOriginalCh2Value: [wreg-fsr0h+status,2+status,0+btemp+1+pclath+cstack]
	line	289
	
l5081:	
;common.c: 289: return Filter(uiSampleChannelSecond);
	movlw	(_uiSampleChannelSecond&0ffh)
	bcf	status, 5	;RP0=0, select bank0
	movwf	(?_Filter)
	movlw	(0x3/2)
	movwf	(?_Filter+1)
	fcall	_Filter
	movf	(1+(?_Filter)),w
	movwf	(?_getAdOriginalCh2Value+1)
	movf	(0+(?_Filter)),w
	movwf	(?_getAdOriginalCh2Value)
	line	293
	
l1943:	
	return
	opt stack 0
GLOBAL	__end_of_getAdOriginalCh2Value
	__end_of_getAdOriginalCh2Value:
;; =============== function _getAdOriginalCh2Value ends ============

	signat	_getAdOriginalCh2Value,90
	global	_call_ADC4_STEP_FOURTH_PREFIX3
psect	text996,local,class=CODE,delta=2
global __ptext996
__ptext996:

;; *************** function _call_ADC4_STEP_FOURTH_PREFIX3 *****************
;; Defined at:
;;		line 2645 in file "C:\temp\dev\AK7030-OTP\main.c"
;; Parameters:    Size  Location     Type
;;  bClearStep      1    wreg     unsigned char 
;; Auto vars:     Size  Location     Type
;;  bClearStep      1    1[BANK0 ] unsigned char 
;; Return value:  Size  Location     Type
;;		None               void
;; Registers used:
;;		wreg, fsr0l, fsr0h, status,2, status,0, pclath, cstack
;; Tracked objects:
;;		On entry : 140/0
;;		On exit  : 160/20
;;		Unchanged: FFE9F/0
;; Data sizes:     COMMON   BANK0   BANK1   BANK3   BANK2
;;      Params:         0       0       0       0       0
;;      Locals:         0       1       0       0       0
;;      Temps:          0       0       0       0       0
;;      Totals:         0       1       0       0       0
;;Total ram usage:        1 bytes
;; Hardware stack levels used:    1
;; Hardware stack levels required when called:    3
;; This function calls:
;;		_setPA3
;;		_setPB4
;;		_setPB6
;;		_setPB6AsInput
;;		_clearTwentySecondsTimer
;; This function is called by:
;;		_main
;; This function uses a non-reentrant model
;;
psect	text996
	file	"C:\temp\dev\AK7030-OTP\main.c"
	line	2645
	global	__size_of_call_ADC4_STEP_FOURTH_PREFIX3
	__size_of_call_ADC4_STEP_FOURTH_PREFIX3	equ	__end_of_call_ADC4_STEP_FOURTH_PREFIX3-_call_ADC4_STEP_FOURTH_PREFIX3
	
_call_ADC4_STEP_FOURTH_PREFIX3:	
	opt	stack 4
; Regs used in _call_ADC4_STEP_FOURTH_PREFIX3: [wreg-fsr0h+status,2+status,0+pclath+cstack]
;call_ADC4_STEP_FOURTH_PREFIX3@bClearStep stored from wreg
	line	2650
	bcf	status, 5	;RP0=0, select bank0
	movwf	(call_ADC4_STEP_FOURTH_PREFIX3@bClearStep)
	
l5029:	
;main.c: 2646: static unsigned char ucPreFix3Step = 0;
;main.c: 2648: static unsigned char ucPrefix3Cnt = 0;
;main.c: 2650: if( 1 == bClearStep)
	decf	(call_ADC4_STEP_FOURTH_PREFIX3@bClearStep),w
	skipz
	goto	u2101
	goto	u2100
u2101:
	goto	l5079
u2100:
	line	2652
	
l5031:	
	line	2653
;main.c: 2653: ucPreFix3Step = 0;
	bsf	status, 5	;RP0=1, select bank1
	clrf	(call_ADC4_STEP_FOURTH_PREFIX3@ucPreFix3Step)^080h
	line	2654
;main.c: 2654: ucPrefix3Cnt = 0;
	clrf	(call_ADC4_STEP_FOURTH_PREFIX3@ucPrefix3Cnt)
	goto	l5079
	line	2665
	
l5033:	
;main.c: 2660: {
;main.c: 2665: setPA3(0);
	movlw	(0)
	fcall	_setPA3
	line	2666
;main.c: 2666: setPB4(0);
	movlw	(0)
	fcall	_setPB4
	line	2667
;main.c: 2667: setPB6(1);
	movlw	(01h)
	fcall	_setPB6
	line	2668
	
l5035:	
;main.c: 2668: ucPrefix3Cnt = 0;
	clrf	(call_ADC4_STEP_FOURTH_PREFIX3@ucPrefix3Cnt)
	line	2669
	
l5037:	
;main.c: 2669: ucPreFix3Step = 1;
	bsf	status, 5	;RP0=1, select bank1
	clrf	(call_ADC4_STEP_FOURTH_PREFIX3@ucPreFix3Step)^080h
	incf	(call_ADC4_STEP_FOURTH_PREFIX3@ucPreFix3Step)^080h,f
	line	2670
;main.c: 2670: break;
	goto	l1198
	line	2678
	
l5039:	
;main.c: 2674: {
;main.c: 2678: ucPrefix3Cnt++;
	incf	(call_ADC4_STEP_FOURTH_PREFIX3@ucPrefix3Cnt),f
	line	2680
	
l5041:	
;main.c: 2680: if( ucPrefix3Cnt >= 10)
	movlw	(0Ah)
	subwf	(call_ADC4_STEP_FOURTH_PREFIX3@ucPrefix3Cnt),w
	skipc
	goto	u2111
	goto	u2110
u2111:
	goto	l1198
u2110:
	line	2682
	
l5043:	
;main.c: 2681: {
;main.c: 2682: ucPrefix3Cnt = 0;
	clrf	(call_ADC4_STEP_FOURTH_PREFIX3@ucPrefix3Cnt)
	line	2683
	
l5045:	
;main.c: 2683: ucPreFix3Step = 2;
	movlw	(02h)
	movwf	(call_ADC4_STEP_FOURTH_PREFIX3@ucPreFix3Step)^080h
	goto	l1198
	line	2693
	
l5047:	
;main.c: 2689: {
;main.c: 2693: ucPrefix3Cnt++;
	incf	(call_ADC4_STEP_FOURTH_PREFIX3@ucPrefix3Cnt),f
	line	2695
	
l5049:	
;main.c: 2695: if( ucPrefix3Cnt >= 10)
	movlw	(0Ah)
	subwf	(call_ADC4_STEP_FOURTH_PREFIX3@ucPrefix3Cnt),w
	skipc
	goto	u2121
	goto	u2120
u2121:
	goto	l1198
u2120:
	line	2697
	
l5051:	
;main.c: 2696: {
;main.c: 2697: ucPrefix3Cnt = 0;
	clrf	(call_ADC4_STEP_FOURTH_PREFIX3@ucPrefix3Cnt)
	line	2699
	
l5053:	
;main.c: 2699: ucPreFix3Step = 3;
	movlw	(03h)
	movwf	(call_ADC4_STEP_FOURTH_PREFIX3@ucPreFix3Step)^080h
	goto	l1198
	line	2709
	
l5055:	
;main.c: 2705: {
;main.c: 2709: setPA3(1);
	movlw	(01h)
	fcall	_setPA3
	line	2710
;main.c: 2710: setPB4(1);
	movlw	(01h)
	fcall	_setPB4
	line	2712
	
l5057:	
;main.c: 2712: setPB6AsInput();
	fcall	_setPB6AsInput
	line	2713
	
l5059:	
;main.c: 2713: ucPrefix3Cnt = 0;
	clrf	(call_ADC4_STEP_FOURTH_PREFIX3@ucPrefix3Cnt)
	line	2715
	
l5061:	
;main.c: 2715: ucPreFix3Step = 4;
	movlw	(04h)
	movwf	(call_ADC4_STEP_FOURTH_PREFIX3@ucPreFix3Step)^080h
	line	2716
;main.c: 2716: break;
	goto	l1198
	line	2723
	
l5063:	
;main.c: 2719: {
;main.c: 2723: ucPrefix3Cnt++;
	incf	(call_ADC4_STEP_FOURTH_PREFIX3@ucPrefix3Cnt),f
	line	2725
	
l5065:	
;main.c: 2725: if( ucPrefix3Cnt >= 2)
	movlw	(02h)
	subwf	(call_ADC4_STEP_FOURTH_PREFIX3@ucPrefix3Cnt),w
	skipc
	goto	u2131
	goto	u2130
u2131:
	goto	l1198
u2130:
	line	2727
	
l5067:	
;main.c: 2726: {
;main.c: 2727: clearTwentySecondsTimer();
	fcall	_clearTwentySecondsTimer
	line	2729
	
l5069:	
;main.c: 2729: ucPrefix3Cnt = 0;
	clrf	(call_ADC4_STEP_FOURTH_PREFIX3@ucPrefix3Cnt)
	line	2731
	
l5071:	
;main.c: 2731: ucADC4_Step = ADC4_STEP_INIT;
	clrf	(_ucADC4_Step)
	line	2733
	
l5073:	
;main.c: 2733: enumMainLoopStep = MAIN_LOOP_STEP_THIRD;
	movlw	(03h)
	movwf	(_enumMainLoopStep)
	line	2735
	
l5075:	
;main.c: 2735: ucPreFix3Step = 0;
	bsf	status, 5	;RP0=1, select bank1
	clrf	(call_ADC4_STEP_FOURTH_PREFIX3@ucPreFix3Step)^080h
	goto	l1198
	line	2657
	
l5079:	
	bsf	status, 5	;RP0=1, select bank1
	movf	(call_ADC4_STEP_FOURTH_PREFIX3@ucPreFix3Step)^080h,w
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
	goto	l5033
	xorlw	1^0	; case 1
	skipnz
	goto	l5039
	xorlw	2^1	; case 2
	skipnz
	goto	l5047
	xorlw	3^2	; case 3
	skipnz
	goto	l5055
	xorlw	4^3	; case 4
	skipnz
	goto	l5063
	goto	l1198
	opt asmopt_on

	line	2744
	
l1198:	
	return
	opt stack 0
GLOBAL	__end_of_call_ADC4_STEP_FOURTH_PREFIX3
	__end_of_call_ADC4_STEP_FOURTH_PREFIX3:
;; =============== function _call_ADC4_STEP_FOURTH_PREFIX3 ends ============

	signat	_call_ADC4_STEP_FOURTH_PREFIX3,4216
	global	_getAdOriginalCh5Value
psect	text997,local,class=CODE,delta=2
global __ptext997
__ptext997:

;; *************** function _getAdOriginalCh5Value *****************
;; Defined at:
;;		line 268 in file "C:\temp\dev\AK7030-OTP\common.c"
;; Parameters:    Size  Location     Type
;;		None
;; Auto vars:     Size  Location     Type
;;		None
;; Return value:  Size  Location     Type
;;                  2   38[BANK0 ] unsigned int 
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
psect	text997
	file	"C:\temp\dev\AK7030-OTP\common.c"
	line	268
	global	__size_of_getAdOriginalCh5Value
	__size_of_getAdOriginalCh5Value	equ	__end_of_getAdOriginalCh5Value-_getAdOriginalCh5Value
	
_getAdOriginalCh5Value:	
	opt	stack 4
; Regs used in _getAdOriginalCh5Value: [wreg-fsr0h+status,2+status,0+btemp+1+pclath+cstack]
	line	270
	
l5025:	
;common.c: 270: return Filter(uiSampleChannelFifth);
	movlw	(_uiSampleChannelFifth&0ffh)
	movwf	(?_Filter)
	movlw	(0x3/2)
	movwf	(?_Filter+1)
	fcall	_Filter
	movf	(1+(?_Filter)),w
	movwf	(?_getAdOriginalCh5Value+1)
	movf	(0+(?_Filter)),w
	movwf	(?_getAdOriginalCh5Value)
	line	274
	
l1937:	
	return
	opt stack 0
GLOBAL	__end_of_getAdOriginalCh5Value
	__end_of_getAdOriginalCh5Value:
;; =============== function _getAdOriginalCh5Value ends ============

	signat	_getAdOriginalCh5Value,90
	global	_getAdOriginalCh6Value
psect	text998,local,class=CODE,delta=2
global __ptext998
__ptext998:

;; *************** function _getAdOriginalCh6Value *****************
;; Defined at:
;;		line 278 in file "C:\temp\dev\AK7030-OTP\common.c"
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
;;		_call_ADC4_STEP_FOURTH_PREFIX2
;; This function uses a non-reentrant model
;;
psect	text998
	file	"C:\temp\dev\AK7030-OTP\common.c"
	line	278
	global	__size_of_getAdOriginalCh6Value
	__size_of_getAdOriginalCh6Value	equ	__end_of_getAdOriginalCh6Value-_getAdOriginalCh6Value
	
_getAdOriginalCh6Value:	
	opt	stack 3
; Regs used in _getAdOriginalCh6Value: [wreg-fsr0h+status,2+status,0+btemp+1+pclath+cstack]
	line	280
	
l5021:	
;common.c: 280: return Filter(uiSampleChannelSixth);
	movlw	(_uiSampleChannelSixth&0ffh)
	bcf	status, 5	;RP0=0, select bank0
	movwf	(?_Filter)
	movlw	(0x3/2)
	movwf	(?_Filter+1)
	fcall	_Filter
	movf	(1+(?_Filter)),w
	movwf	(?_getAdOriginalCh6Value+1)
	movf	(0+(?_Filter)),w
	movwf	(?_getAdOriginalCh6Value)
	line	284
	
l1940:	
	return
	opt stack 0
GLOBAL	__end_of_getAdOriginalCh6Value
	__end_of_getAdOriginalCh6Value:
;; =============== function _getAdOriginalCh6Value ends ============

	signat	_getAdOriginalCh6Value,90
	global	_getAdOriginalCh0Value
psect	text999,local,class=CODE,delta=2
global __ptext999
__ptext999:

;; *************** function _getAdOriginalCh0Value *****************
;; Defined at:
;;		line 259 in file "C:\temp\dev\AK7030-OTP\common.c"
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
psect	text999
	file	"C:\temp\dev\AK7030-OTP\common.c"
	line	259
	global	__size_of_getAdOriginalCh0Value
	__size_of_getAdOriginalCh0Value	equ	__end_of_getAdOriginalCh0Value-_getAdOriginalCh0Value
	
_getAdOriginalCh0Value:	
	opt	stack 4
; Regs used in _getAdOriginalCh0Value: [wreg-fsr0h+status,2+status,0+btemp+1+pclath+cstack]
	line	261
	
l5017:	
;common.c: 261: return Filter(uiSampleChannelZero);
	movlw	(_uiSampleChannelZero&0ffh)
	bcf	status, 5	;RP0=0, select bank0
	movwf	(?_Filter)
	movlw	(0x1/2)
	movwf	(?_Filter+1)
	fcall	_Filter
	movf	(1+(?_Filter)),w
	movwf	(?_getAdOriginalCh0Value+1)
	movf	(0+(?_Filter)),w
	movwf	(?_getAdOriginalCh0Value)
	line	265
	
l1934:	
	return
	opt stack 0
GLOBAL	__end_of_getAdOriginalCh0Value
	__end_of_getAdOriginalCh0Value:
;; =============== function _getAdOriginalCh0Value ends ============

	signat	_getAdOriginalCh0Value,90
	global	_clearAllTimer
psect	text1000,local,class=CODE,delta=2
global __ptext1000
__ptext1000:

;; *************** function _clearAllTimer *****************
;; Defined at:
;;		line 100 in file "C:\temp\dev\AK7030-OTP\main.c"
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
;;		_clearTwentyMinuteTimer
;; This function is called by:
;;		_clearPinPortAndTimer
;;		_clearParaFunction1
;;		_main
;; This function uses a non-reentrant model
;;
psect	text1000
	file	"C:\temp\dev\AK7030-OTP\main.c"
	line	100
	global	__size_of_clearAllTimer
	__size_of_clearAllTimer	equ	__end_of_clearAllTimer-_clearAllTimer
	
_clearAllTimer:	
	opt	stack 4
; Regs used in _clearAllTimer: [status,2+status,0+pclath+cstack]
	line	101
	
l5015:	
;main.c: 101: clearTwelveHoursTimer();
	fcall	_clearTwelveHoursTimer
	line	102
;main.c: 102: clearThreeHoursTimer();
	fcall	_clearThreeHoursTimer
	line	103
;main.c: 103: clearTwentySecondsTimer();
	fcall	_clearTwentySecondsTimer
	line	104
;main.c: 104: clearTwentyMinuteTimer();
	fcall	_clearTwentyMinuteTimer
	line	105
	
l691:	
	return
	opt stack 0
GLOBAL	__end_of_clearAllTimer
	__end_of_clearAllTimer:
;; =============== function _clearAllTimer ends ============

	signat	_clearAllTimer,88
	global	_setAD_ConvertFlag
psect	text1001,local,class=CODE,delta=2
global __ptext1001
__ptext1001:

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
psect	text1001
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
	
l4981:	
;common.c: 236: adc_convert_flag = flag;
	movf	(setAD_ConvertFlag@flag),w
	bsf	status, 5	;RP0=1, select bank1
	movwf	(_adc_convert_flag)^080h
	line	237
	
l1928:	
	return
	opt stack 0
GLOBAL	__end_of_setAD_ConvertFlag
	__end_of_setAD_ConvertFlag:
;; =============== function _setAD_ConvertFlag ends ============

	signat	_setAD_ConvertFlag,4216
	global	_getAD_ConvertFlag
psect	text1002,local,class=CODE,delta=2
global __ptext1002
__ptext1002:

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
;;		On entry : 0/20
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
psect	text1002
	file	"C:\temp\dev\AK7030-OTP\common.c"
	line	229
	global	__size_of_getAD_ConvertFlag
	__size_of_getAD_ConvertFlag	equ	__end_of_getAD_ConvertFlag-_getAD_ConvertFlag
	
_getAD_ConvertFlag:	
	opt	stack 4
; Regs used in _getAD_ConvertFlag: [wreg]
	line	230
	
l4977:	
;common.c: 230: return adc_convert_flag;
	bsf	status, 5	;RP0=1, select bank1
	bcf	status, 6	;RP1=0, select bank1
	movf	(_adc_convert_flag)^080h,w
	line	231
	
l1925:	
	return
	opt stack 0
GLOBAL	__end_of_getAD_ConvertFlag
	__end_of_getAD_ConvertFlag:
;; =============== function _getAD_ConvertFlag ends ============

	signat	_getAD_ConvertFlag,89
	global	_Filter
psect	text1003,local,class=CODE,delta=2
global __ptext1003
__ptext1003:

;; *************** function _Filter *****************
;; Defined at:
;;		line 63 in file "C:\temp\dev\AK7030-OTP\common.c"
;; Parameters:    Size  Location     Type
;;  tmpValue        2    0[BANK0 ] PTR int 
;;		 -> uiSampleChannelSixth(24), uiSampleChannelFifth(24), uiSampleChannelSecond(24), uiSampleChannelZero(24), 
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
;;		_getAdOriginalCh0Value
;;		_getAdOriginalCh5Value
;;		_getAdOriginalCh6Value
;;		_getAdOriginalCh2Value
;; This function uses a non-reentrant model
;;
psect	text1003
	file	"C:\temp\dev\AK7030-OTP\common.c"
	line	63
	global	__size_of_Filter
	__size_of_Filter	equ	__end_of_Filter-_Filter
	
_Filter:	
	opt	stack 4
; Regs used in _Filter: [wreg-fsr0h+status,2+status,0+btemp+1]
	line	65
	
l4867:	
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
	
l4873:	
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
	
l4875:	
	movlw	02h
	addwf	(Filter@tmpValue),f
	skipnc
	incf	(Filter@tmpValue+1),f
	line	71
	
l4877:	
	incf	(Filter@cir),f
	skipnz
	incf	(Filter@cir+1),f
	
l4879:	
	movf	(Filter@cir+1),w
	xorlw	80h
	movwf	btemp+1
	movlw	(high(0Ch))^80h
	subwf	btemp+1,w
	skipz
	goto	u1905
	movlw	low(0Ch)
	subwf	(Filter@cir),w
u1905:

	skipc
	goto	u1901
	goto	u1900
u1901:
	goto	l4873
u1900:
	line	75
	
l4881:	
;common.c: 75: for(j = 0; j < 12 - 1; j++)
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	clrf	(Filter@j)
	line	77
	
l4887:	
;common.c: 76: {
;common.c: 77: for(i = 0; i < 12 - 1 - j; i++)
	clrf	(Filter@i)
	goto	l4895
	line	79
	
l4889:	
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
	goto	u1915
	movf	0+(??_Filter+0)+0,w
	subwf	0+(??_Filter+2)+0,w
u1915:
	skipnc
	goto	u1911
	goto	u1910
u1911:
	goto	l4893
u1910:
	line	82
	
l4891:	
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
	
l4893:	
	incf	(Filter@i),f
	
l4895:	
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
	goto	u1925
	movf	0+(??_Filter+0)+0,w
	subwf	(Filter@i),w
u1925:

	skipc
	goto	u1921
	goto	u1920
u1921:
	goto	l4889
u1920:
	line	75
	
l4897:	
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	incf	(Filter@j),f
	
l4899:	
	movlw	(0Bh)
	subwf	(Filter@j),w
	skipc
	goto	u1931
	goto	u1930
u1931:
	goto	l4887
u1930:
	line	91
	
l4901:	
;common.c: 87: }
;common.c: 88: }
;common.c: 89: }
;common.c: 91: for(i = 2; i < 12 - 2; i++)
	movlw	(02h)
	movwf	(Filter@i)
	line	93
	
l4905:	
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
	
l4907:	
	incf	(Filter@i),f
	
l4909:	
	movlw	(0Ah)
	subwf	(Filter@i),w
	skipc
	goto	u1941
	goto	u1940
u1941:
	goto	l4905
u1940:
	line	96
	
l4911:	
;common.c: 94: }
;common.c: 96: return (filter_sum >> 3);
	movf	(Filter@filter_sum+1),w
	movwf	(?_Filter+1)
	movf	(Filter@filter_sum),w
	movwf	(?_Filter)
	
l4913:	
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
	
l1881:	
	return
	opt stack 0
GLOBAL	__end_of_Filter
	__end_of_Filter:
;; =============== function _Filter ends ============

	signat	_Filter,4218
	global	_isFinishedThreeHoursTimer
psect	text1004,local,class=CODE,delta=2
global __ptext1004
__ptext1004:

;; *************** function _isFinishedThreeHoursTimer *****************
;; Defined at:
;;		line 498 in file "C:\temp\dev\AK7030-OTP\common.c"
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
psect	text1004
	file	"C:\temp\dev\AK7030-OTP\common.c"
	line	498
	global	__size_of_isFinishedThreeHoursTimer
	__size_of_isFinishedThreeHoursTimer	equ	__end_of_isFinishedThreeHoursTimer-_isFinishedThreeHoursTimer
	
_isFinishedThreeHoursTimer:	
	opt	stack 5
; Regs used in _isFinishedThreeHoursTimer: [wreg+status,2+status,0]
	line	499
	
l4851:	
;common.c: 499: if((uiSmallTimer == 0) && bSmallTimerStartFlag)
	bsf	status, 5	;RP0=1, select bank1
	movf	((_uiSmallTimer+1)^080h),w
	iorwf	((_uiSmallTimer)^080h),w
	skipz
	goto	u1881
	goto	u1880
u1881:
	goto	l4863
u1880:
	
l4853:	
	bcf	status, 5	;RP0=0, select bank0
	movf	(_bSmallTimerStartFlag),w
	skipz
	goto	u1890
	goto	l4863
u1890:
	line	501
	
l4855:	
;common.c: 500: {
;common.c: 501: bSmallTimerStartFlag = 0;
	clrf	(_bSmallTimerStartFlag)
	line	502
	
l4857:	
;common.c: 502: return 1;
	movlw	(01h)
	goto	l2008
	line	505
	
l4863:	
;common.c: 504: else
;common.c: 505: return 0;
	movlw	(0)
	line	506
	
l2008:	
	return
	opt stack 0
GLOBAL	__end_of_isFinishedThreeHoursTimer
	__end_of_isFinishedThreeHoursTimer:
;; =============== function _isFinishedThreeHoursTimer ends ============

	signat	_isFinishedThreeHoursTimer,89
	global	_startThreeHoursTimer
psect	text1005,local,class=CODE,delta=2
global __ptext1005
__ptext1005:

;; *************** function _startThreeHoursTimer *****************
;; Defined at:
;;		line 429 in file "C:\temp\dev\AK7030-OTP\common.c"
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
psect	text1005
	file	"C:\temp\dev\AK7030-OTP\common.c"
	line	429
	global	__size_of_startThreeHoursTimer
	__size_of_startThreeHoursTimer	equ	__end_of_startThreeHoursTimer-_startThreeHoursTimer
	
_startThreeHoursTimer:	
	opt	stack 5
; Regs used in _startThreeHoursTimer: [wreg+status,2+status,0]
	line	430
	
l4843:	
;common.c: 430: if(( 0 == uiSmallTimer ) && ( 0 == bSmallTimerStartFlag ))
	bsf	status, 5	;RP0=1, select bank1
	movf	((_uiSmallTimer+1)^080h),w
	iorwf	((_uiSmallTimer)^080h),w
	skipz
	goto	u1861
	goto	u1860
u1861:
	goto	l1981
u1860:
	
l4845:	
	bcf	status, 5	;RP0=0, select bank0
	movf	(_bSmallTimerStartFlag),f
	skipz
	goto	u1871
	goto	u1870
u1871:
	goto	l1981
u1870:
	line	432
	
l4847:	
;common.c: 431: {
;common.c: 432: uiSmallTimer = uiSetTime;
	movf	(startThreeHoursTimer@uiSetTime+1),w
	bsf	status, 5	;RP0=1, select bank1
	movwf	(_uiSmallTimer+1)^080h
	bcf	status, 5	;RP0=0, select bank0
	movf	(startThreeHoursTimer@uiSetTime),w
	bsf	status, 5	;RP0=1, select bank1
	movwf	(_uiSmallTimer)^080h
	line	433
	
l4849:	
;common.c: 433: bSmallTimerStartFlag = 1;
	bcf	status, 5	;RP0=0, select bank0
	clrf	(_bSmallTimerStartFlag)
	incf	(_bSmallTimerStartFlag),f
	line	439
	
l1981:	
	return
	opt stack 0
GLOBAL	__end_of_startThreeHoursTimer
	__end_of_startThreeHoursTimer:
;; =============== function _startThreeHoursTimer ends ============

	signat	_startThreeHoursTimer,4216
	global	_isFinishedTwentySecondsTimer
psect	text1006,local,class=CODE,delta=2
global __ptext1006
__ptext1006:

;; *************** function _isFinishedTwentySecondsTimer *****************
;; Defined at:
;;		line 463 in file "C:\temp\dev\AK7030-OTP\common.c"
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
psect	text1006
	file	"C:\temp\dev\AK7030-OTP\common.c"
	line	463
	global	__size_of_isFinishedTwentySecondsTimer
	__size_of_isFinishedTwentySecondsTimer	equ	__end_of_isFinishedTwentySecondsTimer-_isFinishedTwentySecondsTimer
	
_isFinishedTwentySecondsTimer:	
	opt	stack 5
; Regs used in _isFinishedTwentySecondsTimer: [wreg+status,2+status,0]
	line	464
	
l4827:	
;common.c: 464: if(( 0 == uiTwentySecondsTimer ) && bTwentySecStartFlag )
	bsf	status, 5	;RP0=1, select bank1
	movf	((_uiTwentySecondsTimer+1)^080h),w
	iorwf	((_uiTwentySecondsTimer)^080h),w
	skipz
	goto	u1841
	goto	u1840
u1841:
	goto	l4839
u1840:
	
l4829:	
	bcf	status, 5	;RP0=0, select bank0
	movf	(_bTwentySecStartFlag),w
	skipz
	goto	u1850
	goto	l4839
u1850:
	line	466
	
l4831:	
;common.c: 465: {
;common.c: 466: bTwentySecStartFlag = 0;
	clrf	(_bTwentySecStartFlag)
	line	467
	
l4833:	
;common.c: 467: return 1;
	movlw	(01h)
	goto	l1993
	line	470
	
l4839:	
;common.c: 469: else
;common.c: 470: return 0;
	movlw	(0)
	line	471
	
l1993:	
	return
	opt stack 0
GLOBAL	__end_of_isFinishedTwentySecondsTimer
	__end_of_isFinishedTwentySecondsTimer:
;; =============== function _isFinishedTwentySecondsTimer ends ============

	signat	_isFinishedTwentySecondsTimer,89
	global	_startTwentySecondsTimer
psect	text1007,local,class=CODE,delta=2
global __ptext1007
__ptext1007:

;; *************** function _startTwentySecondsTimer *****************
;; Defined at:
;;		line 443 in file "C:\temp\dev\AK7030-OTP\common.c"
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
psect	text1007
	file	"C:\temp\dev\AK7030-OTP\common.c"
	line	443
	global	__size_of_startTwentySecondsTimer
	__size_of_startTwentySecondsTimer	equ	__end_of_startTwentySecondsTimer-_startTwentySecondsTimer
	
_startTwentySecondsTimer:	
	opt	stack 5
; Regs used in _startTwentySecondsTimer: [wreg+status,2+status,0]
	line	444
	
l4819:	
;common.c: 444: if(( 0 == uiTwentySecondsTimer) && ( 0 == bTwentySecStartFlag))
	bsf	status, 5	;RP0=1, select bank1
	movf	((_uiTwentySecondsTimer+1)^080h),w
	iorwf	((_uiTwentySecondsTimer)^080h),w
	skipz
	goto	u1821
	goto	u1820
u1821:
	goto	l1985
u1820:
	
l4821:	
	bcf	status, 5	;RP0=0, select bank0
	movf	(_bTwentySecStartFlag),f
	skipz
	goto	u1831
	goto	u1830
u1831:
	goto	l1985
u1830:
	line	446
	
l4823:	
;common.c: 445: {
;common.c: 446: uiTwentySecondsTimer = 20;
	movlw	014h
	bsf	status, 5	;RP0=1, select bank1
	movwf	(_uiTwentySecondsTimer)^080h
	clrf	(_uiTwentySecondsTimer+1)^080h
	line	447
	
l4825:	
;common.c: 447: bTwentySecStartFlag = 1;
	bcf	status, 5	;RP0=0, select bank0
	clrf	(_bTwentySecStartFlag)
	incf	(_bTwentySecStartFlag),f
	line	449
	
l1985:	
	return
	opt stack 0
GLOBAL	__end_of_startTwentySecondsTimer
	__end_of_startTwentySecondsTimer:
;; =============== function _startTwentySecondsTimer ends ============

	signat	_startTwentySecondsTimer,88
	global	_isFinishedTwelveHoursTimer
psect	text1008,local,class=CODE,delta=2
global __ptext1008
__ptext1008:

;; *************** function _isFinishedTwelveHoursTimer *****************
;; Defined at:
;;		line 487 in file "C:\temp\dev\AK7030-OTP\common.c"
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
psect	text1008
	file	"C:\temp\dev\AK7030-OTP\common.c"
	line	487
	global	__size_of_isFinishedTwelveHoursTimer
	__size_of_isFinishedTwelveHoursTimer	equ	__end_of_isFinishedTwelveHoursTimer-_isFinishedTwelveHoursTimer
	
_isFinishedTwelveHoursTimer:	
	opt	stack 5
; Regs used in _isFinishedTwelveHoursTimer: [wreg+status,2+status,0]
	line	488
	
l4803:	
;common.c: 488: if(( uiBigTimer == 0 ) && bBigTimerStartFlag )
	bsf	status, 5	;RP0=1, select bank1
	movf	((_uiBigTimer+1)^080h),w
	iorwf	((_uiBigTimer)^080h),w
	skipz
	goto	u1801
	goto	u1800
u1801:
	goto	l4815
u1800:
	
l4805:	
	bcf	status, 5	;RP0=0, select bank0
	movf	(_bBigTimerStartFlag),w
	skipz
	goto	u1810
	goto	l4815
u1810:
	line	490
	
l4807:	
;common.c: 489: {
;common.c: 490: bBigTimerStartFlag = 0;
	clrf	(_bBigTimerStartFlag)
	line	491
	
l4809:	
;common.c: 491: return 1;
	movlw	(01h)
	goto	l2003
	line	494
	
l4815:	
;common.c: 493: else
;common.c: 494: return 0;
	movlw	(0)
	line	495
	
l2003:	
	return
	opt stack 0
GLOBAL	__end_of_isFinishedTwelveHoursTimer
	__end_of_isFinishedTwelveHoursTimer:
;; =============== function _isFinishedTwelveHoursTimer ends ============

	signat	_isFinishedTwelveHoursTimer,89
	global	_startTwelveHourTimer
psect	text1009,local,class=CODE,delta=2
global __ptext1009
__ptext1009:

;; *************** function _startTwelveHourTimer *****************
;; Defined at:
;;		line 388 in file "C:\temp\dev\AK7030-OTP\common.c"
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
psect	text1009
	file	"C:\temp\dev\AK7030-OTP\common.c"
	line	388
	global	__size_of_startTwelveHourTimer
	__size_of_startTwelveHourTimer	equ	__end_of_startTwelveHourTimer-_startTwelveHourTimer
	
_startTwelveHourTimer:	
	opt	stack 5
; Regs used in _startTwelveHourTimer: [wreg+status,2+status,0]
	line	389
	
l4795:	
;common.c: 389: if((0 == uiBigTimer) && ( 0 == bBigTimerStartFlag))
	bsf	status, 5	;RP0=1, select bank1
	movf	((_uiBigTimer+1)^080h),w
	iorwf	((_uiBigTimer)^080h),w
	skipz
	goto	u1781
	goto	u1780
u1781:
	goto	l1965
u1780:
	
l4797:	
	bcf	status, 5	;RP0=0, select bank0
	movf	(_bBigTimerStartFlag),f
	skipz
	goto	u1791
	goto	u1790
u1791:
	goto	l1965
u1790:
	line	391
	
l4799:	
;common.c: 390: {
;common.c: 391: uiBigTimer = uiSetTime;
	movf	(startTwelveHourTimer@uiSetTime+1),w
	bsf	status, 5	;RP0=1, select bank1
	movwf	(_uiBigTimer+1)^080h
	bcf	status, 5	;RP0=0, select bank0
	movf	(startTwelveHourTimer@uiSetTime),w
	bsf	status, 5	;RP0=1, select bank1
	movwf	(_uiBigTimer)^080h
	line	392
	
l4801:	
;common.c: 392: bBigTimerStartFlag = 1;
	bcf	status, 5	;RP0=0, select bank0
	clrf	(_bBigTimerStartFlag)
	incf	(_bBigTimerStartFlag),f
	line	399
	
l1965:	
	return
	opt stack 0
GLOBAL	__end_of_startTwelveHourTimer
	__end_of_startTwelveHourTimer:
;; =============== function _startTwelveHourTimer ends ============

	signat	_startTwelveHourTimer,4216
	global	_isFinishedTwentyMinuteTimer
psect	text1010,local,class=CODE,delta=2
global __ptext1010
__ptext1010:

;; *************** function _isFinishedTwentyMinuteTimer *****************
;; Defined at:
;;		line 475 in file "C:\temp\dev\AK7030-OTP\common.c"
;; Parameters:    Size  Location     Type
;;		None
;; Auto vars:     Size  Location     Type
;;		None
;; Return value:  Size  Location     Type
;;                  1    wreg      unsigned char 
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
psect	text1010
	file	"C:\temp\dev\AK7030-OTP\common.c"
	line	475
	global	__size_of_isFinishedTwentyMinuteTimer
	__size_of_isFinishedTwentyMinuteTimer	equ	__end_of_isFinishedTwentyMinuteTimer-_isFinishedTwentyMinuteTimer
	
_isFinishedTwentyMinuteTimer:	
	opt	stack 5
; Regs used in _isFinishedTwentyMinuteTimer: [wreg+status,2+status,0]
	line	476
	
l4779:	
;common.c: 476: if(( 0 == uiTwentyMinuteTimer ) && bTwentyMinStartFlag )
	bsf	status, 5	;RP0=1, select bank1
	movf	((_uiTwentyMinuteTimer+1)^080h),w
	iorwf	((_uiTwentyMinuteTimer)^080h),w
	skipz
	goto	u1761
	goto	u1760
u1761:
	goto	l4791
u1760:
	
l4781:	
	bcf	status, 5	;RP0=0, select bank0
	movf	(_bTwentyMinStartFlag),w
	skipz
	goto	u1770
	goto	l4791
u1770:
	line	478
	
l4783:	
;common.c: 477: {
;common.c: 478: bTwentyMinStartFlag = 0;
	clrf	(_bTwentyMinStartFlag)
	line	479
	
l4785:	
;common.c: 479: return 1;
	movlw	(01h)
	goto	l1998
	line	482
	
l4791:	
;common.c: 481: else
;common.c: 482: return 0;
	movlw	(0)
	line	483
	
l1998:	
	return
	opt stack 0
GLOBAL	__end_of_isFinishedTwentyMinuteTimer
	__end_of_isFinishedTwentyMinuteTimer:
;; =============== function _isFinishedTwentyMinuteTimer ends ============

	signat	_isFinishedTwentyMinuteTimer,89
	global	_clrSampeTime
psect	text1011,local,class=CODE,delta=2
global __ptext1011
__ptext1011:

;; *************** function _clrSampeTime *****************
;; Defined at:
;;		line 519 in file "C:\temp\dev\AK7030-OTP\common.c"
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
psect	text1011
	file	"C:\temp\dev\AK7030-OTP\common.c"
	line	519
	global	__size_of_clrSampeTime
	__size_of_clrSampeTime	equ	__end_of_clrSampeTime-_clrSampeTime
	
_clrSampeTime:	
	opt	stack 5
; Regs used in _clrSampeTime: [status,2]
	line	520
	
l4777:	
;common.c: 520: timer.timer10msStopWatch = 0;
	clrf	(_timer)^080h
	line	521
	
l2017:	
	return
	opt stack 0
GLOBAL	__end_of_clrSampeTime
	__end_of_clrSampeTime:
;; =============== function _clrSampeTime ends ============

	signat	_clrSampeTime,88
	global	_isPermitSampleTime
psect	text1012,local,class=CODE,delta=2
global __ptext1012
__ptext1012:

;; *************** function _isPermitSampleTime *****************
;; Defined at:
;;		line 509 in file "C:\temp\dev\AK7030-OTP\common.c"
;; Parameters:    Size  Location     Type
;;		None
;; Auto vars:     Size  Location     Type
;;		None
;; Return value:  Size  Location     Type
;;                  1    wreg      unsigned char 
;; Registers used:
;;		wreg
;; Tracked objects:
;;		On entry : 40/20
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
psect	text1012
	file	"C:\temp\dev\AK7030-OTP\common.c"
	line	509
	global	__size_of_isPermitSampleTime
	__size_of_isPermitSampleTime	equ	__end_of_isPermitSampleTime-_isPermitSampleTime
	
_isPermitSampleTime:	
	opt	stack 5
; Regs used in _isPermitSampleTime: [wreg]
	line	510
	
l4765:	
;common.c: 510: if(timer.timer10msStopWatch >= 10)
	movlw	(0Ah)
	bsf	status, 5	;RP0=1, select bank1
	subwf	(_timer)^080h,w
	skipc
	goto	u1751
	goto	u1750
u1751:
	goto	l4773
u1750:
	line	512
	
l4767:	
;common.c: 511: {
;common.c: 512: return 1;
	movlw	(01h)
	goto	l2013
	line	515
	
l4773:	
;common.c: 514: else
;common.c: 515: return 0;
	movlw	(0)
	line	516
	
l2013:	
	return
	opt stack 0
GLOBAL	__end_of_isPermitSampleTime
	__end_of_isPermitSampleTime:
;; =============== function _isPermitSampleTime ends ============

	signat	_isPermitSampleTime,89
	global	_startTwentyMinuteTimer
psect	text1013,local,class=CODE,delta=2
global __ptext1013
__ptext1013:

;; *************** function _startTwentyMinuteTimer *****************
;; Defined at:
;;		line 453 in file "C:\temp\dev\AK7030-OTP\common.c"
;; Parameters:    Size  Location     Type
;;  uiValue         2    0[BANK0 ] unsigned int 
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
psect	text1013
	file	"C:\temp\dev\AK7030-OTP\common.c"
	line	453
	global	__size_of_startTwentyMinuteTimer
	__size_of_startTwentyMinuteTimer	equ	__end_of_startTwentyMinuteTimer-_startTwentyMinuteTimer
	
_startTwentyMinuteTimer:	
	opt	stack 5
; Regs used in _startTwentyMinuteTimer: [wreg+status,2+status,0]
	line	454
	
l4757:	
;common.c: 454: if(( 0 == uiTwentyMinuteTimer) && ( 0 == bTwentyMinStartFlag))
	bsf	status, 5	;RP0=1, select bank1
	movf	((_uiTwentyMinuteTimer+1)^080h),w
	iorwf	((_uiTwentyMinuteTimer)^080h),w
	skipz
	goto	u1731
	goto	u1730
u1731:
	goto	l1989
u1730:
	
l4759:	
	bcf	status, 5	;RP0=0, select bank0
	movf	(_bTwentyMinStartFlag),f
	skipz
	goto	u1741
	goto	u1740
u1741:
	goto	l1989
u1740:
	line	456
	
l4761:	
;common.c: 455: {
;common.c: 456: uiTwentyMinuteTimer = uiValue;
	movf	(startTwentyMinuteTimer@uiValue+1),w
	bsf	status, 5	;RP0=1, select bank1
	movwf	(_uiTwentyMinuteTimer+1)^080h
	bcf	status, 5	;RP0=0, select bank0
	movf	(startTwentyMinuteTimer@uiValue),w
	bsf	status, 5	;RP0=1, select bank1
	movwf	(_uiTwentyMinuteTimer)^080h
	line	457
	
l4763:	
;common.c: 457: bTwentyMinStartFlag = 1;
	bcf	status, 5	;RP0=0, select bank0
	clrf	(_bTwentyMinStartFlag)
	incf	(_bTwentyMinStartFlag),f
	line	459
	
l1989:	
	return
	opt stack 0
GLOBAL	__end_of_startTwentyMinuteTimer
	__end_of_startTwentyMinuteTimer:
;; =============== function _startTwentyMinuteTimer ends ============

	signat	_startTwentyMinuteTimer,4216
	global	_adc_start
psect	text1014,local,class=CODE,delta=2
global __ptext1014
__ptext1014:

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
psect	text1014
	file	"C:\temp\dev\AK7030-OTP\periph.c"
	line	100
	global	__size_of_adc_start
	__size_of_adc_start	equ	__end_of_adc_start-_adc_start
	
_adc_start:	
	opt	stack 4
; Regs used in _adc_start: []
	line	101
	
l4755:	
;periph.c: 101: GO=1;
	bcf	status, 5	;RP0=0, select bank0
	bsf	(249/8),(249)&7
	line	102
	
l2681:	
	return
	opt stack 0
GLOBAL	__end_of_adc_start
	__end_of_adc_start:
;; =============== function _adc_start ends ============

	signat	_adc_start,88
	global	_adc_test_init
psect	text1015,local,class=CODE,delta=2
global __ptext1015
__ptext1015:

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
psect	text1015
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
	
l4745:	
;periph.c: 86: ADCON0 = 0x00;
	clrf	(31)	;volatile
	line	87
	
l4747:	
;periph.c: 87: ADCON0|=channel<<2;
	movf	(adc_test_init@channel),w
	movwf	(??_adc_test_init+0)+0
	clrc
	rlf	(??_adc_test_init+0)+0,f
	clrc
	rlf	(??_adc_test_init+0)+0,w
	iorwf	(31),f	;volatile
	line	88
	
l4749:	
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
	
l4751:	
;periph.c: 89: ADON=1;
	bcf	status, 5	;RP0=0, select bank0
	bsf	(248/8),(248)&7
	line	90
	
l4753:	
;periph.c: 90: ADIE=1;
	bsf	status, 5	;RP0=1, select bank1
	bsf	(1130/8)^080h,(1130)&7
	line	91
	
l2675:	
	return
	opt stack 0
GLOBAL	__end_of_adc_test_init
	__end_of_adc_test_init:
;; =============== function _adc_test_init ends ============

	signat	_adc_test_init,8312
	global	_timer1_interrupt_config
psect	text1016,local,class=CODE,delta=2
global __ptext1016
__ptext1016:

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
psect	text1016
	file	"C:\temp\dev\AK7030-OTP\common.c"
	line	221
	global	__size_of_timer1_interrupt_config
	__size_of_timer1_interrupt_config	equ	__end_of_timer1_interrupt_config-_timer1_interrupt_config
	
_timer1_interrupt_config:	
	opt	stack 5
; Regs used in _timer1_interrupt_config: []
	line	222
	
l4743:	
;common.c: 222: GIE = 1;
	bsf	(95/8),(95)&7
	line	223
;common.c: 223: PEIE = 1;
	bsf	(94/8),(94)&7
	line	224
	
l1922:	
	return
	opt stack 0
GLOBAL	__end_of_timer1_interrupt_config
	__end_of_timer1_interrupt_config:
;; =============== function _timer1_interrupt_config ends ============

	signat	_timer1_interrupt_config,88
	global	_timer1_config
psect	text1017,local,class=CODE,delta=2
global __ptext1017
__ptext1017:

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
psect	text1017
	file	"C:\temp\dev\AK7030-OTP\common.c"
	line	209
	global	__size_of_timer1_config
	__size_of_timer1_config	equ	__end_of_timer1_config-_timer1_config
	
_timer1_config:	
	opt	stack 5
; Regs used in _timer1_config: [wreg]
	line	211
	
l4739:	
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
	
l4741:	
;common.c: 214: TMR1IE=1;
	bsf	status, 5	;RP0=1, select bank1
	bsf	(1120/8)^080h,(1120)&7
	line	216
	
l1919:	
	return
	opt stack 0
GLOBAL	__end_of_timer1_config
	__end_of_timer1_config:
;; =============== function _timer1_config ends ============

	signat	_timer1_config,88
	global	_clock_config
psect	text1018,local,class=CODE,delta=2
global __ptext1018
__ptext1018:

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
psect	text1018
	file	"C:\temp\dev\AK7030-OTP\common.c"
	line	201
	global	__size_of_clock_config
	__size_of_clock_config	equ	__end_of_clock_config-_clock_config
	
_clock_config:	
	opt	stack 5
; Regs used in _clock_config: [wreg+status,2]
	line	203
	
l4735:	
;common.c: 203: CLKPR = 0x80;
	movlw	(080h)
	bcf	status, 5	;RP0=0, select bank2
	bsf	status, 6	;RP1=1, select bank2
	movwf	(264)^0100h	;volatile
	line	204
	
l4737:	
;common.c: 204: CLKPR = 0x00;
	clrf	(264)^0100h	;volatile
	line	205
;common.c: 205: while(CLKPCE);
	
l1913:	
	btfsc	(2119/8)^0100h,(2119)&7
	goto	u1721
	goto	u1720
u1721:
	goto	l1913
u1720:
	line	206
	
l1916:	
	return
	opt stack 0
GLOBAL	__end_of_clock_config
	__end_of_clock_config:
;; =============== function _clock_config ends ============

	signat	_clock_config,88
	global	_setPB6AsInput
psect	text1019,local,class=CODE,delta=2
global __ptext1019
__ptext1019:

;; *************** function _setPB6AsInput *****************
;; Defined at:
;;		line 372 in file "C:\temp\dev\AK7030-OTP\main.c"
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
;;		_call_ADC4_STEP_FOURTH_PREFIX2
;;		_call_ADC4_STEP_FOURTH_PREFIX3
;; This function uses a non-reentrant model
;;
psect	text1019
	file	"C:\temp\dev\AK7030-OTP\main.c"
	line	372
	global	__size_of_setPB6AsInput
	__size_of_setPB6AsInput	equ	__end_of_setPB6AsInput-_setPB6AsInput
	
_setPB6AsInput:	
	opt	stack 5
; Regs used in _setPB6AsInput: []
	line	374
	
l4733:	
;main.c: 374: TRISB6 = 1;
	bsf	status, 5	;RP0=1, select bank1
	bsf	(1078/8)^080h,(1078)&7
	line	379
	
l755:	
	return
	opt stack 0
GLOBAL	__end_of_setPB6AsInput
	__end_of_setPB6AsInput:
;; =============== function _setPB6AsInput ends ============

	signat	_setPB6AsInput,88
	global	_setPA6
psect	text1020,local,class=CODE,delta=2
global __ptext1020
__ptext1020:

;; *************** function _setPA6 *****************
;; Defined at:
;;		line 356 in file "C:\temp\dev\AK7030-OTP\main.c"
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
psect	text1020
	file	"C:\temp\dev\AK7030-OTP\main.c"
	line	356
	global	__size_of_setPA6
	__size_of_setPA6	equ	__end_of_setPA6-_setPA6
	
_setPA6:	
	opt	stack 5
; Regs used in _setPA6: [wreg]
;setPA6@bValue stored from wreg
	movwf	(setPA6@bValue)
	line	357
	
l4729:	
;main.c: 357: if( bValue )
	movf	(setPA6@bValue),w
	skipz
	goto	u1710
	goto	l750
u1710:
	line	359
	
l4731:	
;main.c: 359: PA6 = 1;
	bsf	(46/8),(46)&7
	goto	l752
	line	363
	
l750:	
	line	365
;main.c: 363: else
;main.c: 365: PA6= 0;
	bcf	(46/8),(46)&7
	line	369
	
l752:	
	return
	opt stack 0
GLOBAL	__end_of_setPA6
	__end_of_setPA6:
;; =============== function _setPA6 ends ============

	signat	_setPA6,4216
	global	_setPB4
psect	text1021,local,class=CODE,delta=2
global __ptext1021
__ptext1021:

;; *************** function _setPB4 *****************
;; Defined at:
;;		line 310 in file "C:\temp\dev\AK7030-OTP\main.c"
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
;;		_clearParaFunction1
;;		_main
;;		_call_ADC4_STEP_FOURTH_PREFIX3
;; This function uses a non-reentrant model
;;
psect	text1021
	file	"C:\temp\dev\AK7030-OTP\main.c"
	line	310
	global	__size_of_setPB4
	__size_of_setPB4	equ	__end_of_setPB4-_setPB4
	
_setPB4:	
	opt	stack 4
; Regs used in _setPB4: [wreg]
;setPB4@bValue stored from wreg
	movwf	(setPB4@bValue)
	line	311
	
l4725:	
;main.c: 311: if( bValue )
	movf	(setPB4@bValue),w
	skipz
	goto	u1700
	goto	l740
u1700:
	line	313
	
l4727:	
;main.c: 313: PB4 = 1;
	bsf	(52/8),(52)&7
	goto	l742
	line	317
	
l740:	
	line	319
;main.c: 317: else
;main.c: 319: PB4 = 0;
	bcf	(52/8),(52)&7
	line	323
	
l742:	
	return
	opt stack 0
GLOBAL	__end_of_setPB4
	__end_of_setPB4:
;; =============== function _setPB4 ends ============

	signat	_setPB4,4216
	global	_setPB6
psect	text1022,local,class=CODE,delta=2
global __ptext1022
__ptext1022:

;; *************** function _setPB6 *****************
;; Defined at:
;;		line 286 in file "C:\temp\dev\AK7030-OTP\main.c"
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
;;		_call_ADC4_STEP_FOURTH_PREFIX2
;;		_call_ADC4_STEP_FOURTH_PREFIX3
;; This function uses a non-reentrant model
;;
psect	text1022
	file	"C:\temp\dev\AK7030-OTP\main.c"
	line	286
	global	__size_of_setPB6
	__size_of_setPB6	equ	__end_of_setPB6-_setPB6
	
_setPB6:	
	opt	stack 5
; Regs used in _setPB6: [wreg]
;setPB6@bValue stored from wreg
	movwf	(setPB6@bValue)
	line	287
	
l4721:	
;main.c: 287: if( bValue )
	movf	(setPB6@bValue),w
	skipz
	goto	u1690
	goto	l735
u1690:
	line	290
	
l4723:	
;main.c: 289: {
;main.c: 290: TRISB6 = 0;
	bsf	status, 5	;RP0=1, select bank1
	bcf	(1078/8)^080h,(1078)&7
	line	291
;main.c: 291: PB6 = 1;
	bcf	status, 5	;RP0=0, select bank0
	bsf	(54/8),(54)&7
	line	292
;main.c: 292: }
	goto	l737
	line	296
	
l735:	
	line	299
;main.c: 296: else
;main.c: 298: {
;main.c: 299: TRISB6 = 0;
	bsf	status, 5	;RP0=1, select bank1
	bcf	(1078/8)^080h,(1078)&7
	line	300
;main.c: 300: PB6 = 0;
	bcf	status, 5	;RP0=0, select bank0
	bcf	(54/8),(54)&7
	line	305
	
l737:	
	return
	opt stack 0
GLOBAL	__end_of_setPB6
	__end_of_setPB6:
;; =============== function _setPB6 ends ============

	signat	_setPB6,4216
	global	_setPA3
psect	text1023,local,class=CODE,delta=2
global __ptext1023
__ptext1023:

;; *************** function _setPA3 *****************
;; Defined at:
;;		line 269 in file "C:\temp\dev\AK7030-OTP\main.c"
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
;;		_clearParaFunction1
;;		_main
;;		_call_ADC4_STEP_FOURTH_PREFIX2
;;		_call_ADC4_STEP_FOURTH_PREFIX3
;; This function uses a non-reentrant model
;;
psect	text1023
	file	"C:\temp\dev\AK7030-OTP\main.c"
	line	269
	global	__size_of_setPA3
	__size_of_setPA3	equ	__end_of_setPA3-_setPA3
	
_setPA3:	
	opt	stack 4
; Regs used in _setPA3: [wreg]
;setPA3@bValue stored from wreg
	bcf	status, 5	;RP0=0, select bank0
	movwf	(setPA3@bValue)
	line	270
	
l4717:	
;main.c: 270: if( bValue )
	movf	(setPA3@bValue),w
	skipz
	goto	u1680
	goto	l730
u1680:
	line	272
	
l4719:	
;main.c: 272: PA3 = 1;
	bsf	(43/8),(43)&7
	goto	l732
	line	276
	
l730:	
	line	278
;main.c: 276: else
;main.c: 278: PA3 = 0;
	bcf	(43/8),(43)&7
	line	282
	
l732:	
	return
	opt stack 0
GLOBAL	__end_of_setPA3
	__end_of_setPA3:
;; =============== function _setPA3 ends ============

	signat	_setPA3,4216
	global	_setPA2
psect	text1024,local,class=CODE,delta=2
global __ptext1024
__ptext1024:

;; *************** function _setPA2 *****************
;; Defined at:
;;		line 252 in file "C:\temp\dev\AK7030-OTP\main.c"
;; Parameters:    Size  Location     Type
;;  bValue          1    wreg     unsigned char 
;; Auto vars:     Size  Location     Type
;;  bValue          1    0[BANK0 ] unsigned char 
;; Return value:  Size  Location     Type
;;		None               void
;; Registers used:
;;		wreg
;; Tracked objects:
;;		On entry : 40/20
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
psect	text1024
	file	"C:\temp\dev\AK7030-OTP\main.c"
	line	252
	global	__size_of_setPA2
	__size_of_setPA2	equ	__end_of_setPA2-_setPA2
	
_setPA2:	
	opt	stack 5
; Regs used in _setPA2: [wreg]
;setPA2@bValue stored from wreg
	bcf	status, 5	;RP0=0, select bank0
	movwf	(setPA2@bValue)
	line	253
	
l4713:	
;main.c: 253: if( bValue )
	movf	(setPA2@bValue),w
	skipz
	goto	u1670
	goto	l725
u1670:
	line	255
	
l4715:	
;main.c: 255: PA2 = 1;
	bsf	(42/8),(42)&7
	goto	l727
	line	259
	
l725:	
	line	261
;main.c: 259: else
;main.c: 261: PA2 = 0;
	bcf	(42/8),(42)&7
	line	265
	
l727:	
	return
	opt stack 0
GLOBAL	__end_of_setPA2
	__end_of_setPA2:
;; =============== function _setPA2 ends ============

	signat	_setPA2,4216
	global	_setPA1
psect	text1025,local,class=CODE,delta=2
global __ptext1025
__ptext1025:

;; *************** function _setPA1 *****************
;; Defined at:
;;		line 234 in file "C:\temp\dev\AK7030-OTP\main.c"
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
;;		_clearParaFunction1
;;		_main
;; This function uses a non-reentrant model
;;
psect	text1025
	file	"C:\temp\dev\AK7030-OTP\main.c"
	line	234
	global	__size_of_setPA1
	__size_of_setPA1	equ	__end_of_setPA1-_setPA1
	
_setPA1:	
	opt	stack 5
; Regs used in _setPA1: [wreg]
;setPA1@bValue stored from wreg
	bcf	status, 5	;RP0=0, select bank0
	movwf	(setPA1@bValue)
	line	235
	
l4709:	
;main.c: 235: if( bValue )
	movf	(setPA1@bValue),w
	skipz
	goto	u1660
	goto	l720
u1660:
	line	237
	
l4711:	
;main.c: 237: PA1 = 1;
	bsf	(41/8),(41)&7
	goto	l722
	line	241
	
l720:	
	line	243
;main.c: 241: else
;main.c: 243: PA1 = 0;
	bcf	(41/8),(41)&7
	line	247
	
l722:	
	return
	opt stack 0
GLOBAL	__end_of_setPA1
	__end_of_setPA1:
;; =============== function _setPA1 ends ============

	signat	_setPA1,4216
	global	_setPA0
psect	text1026,local,class=CODE,delta=2
global __ptext1026
__ptext1026:

;; *************** function _setPA0 *****************
;; Defined at:
;;		line 217 in file "C:\temp\dev\AK7030-OTP\main.c"
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
;;		_clearParaFunction1
;;		_main
;; This function uses a non-reentrant model
;;
psect	text1026
	file	"C:\temp\dev\AK7030-OTP\main.c"
	line	217
	global	__size_of_setPA0
	__size_of_setPA0	equ	__end_of_setPA0-_setPA0
	
_setPA0:	
	opt	stack 5
; Regs used in _setPA0: [wreg]
;setPA0@bValue stored from wreg
	bcf	status, 5	;RP0=0, select bank0
	movwf	(setPA0@bValue)
	line	218
	
l4705:	
;main.c: 218: if( bValue )
	movf	(setPA0@bValue),w
	skipz
	goto	u1650
	goto	l715
u1650:
	line	220
	
l4707:	
;main.c: 220: PA0 = 1;
	bsf	(40/8),(40)&7
	goto	l717
	line	224
	
l715:	
	line	226
;main.c: 224: else
;main.c: 226: PA0 = 0;
	bcf	(40/8),(40)&7
	line	230
	
l717:	
	return
	opt stack 0
GLOBAL	__end_of_setPA0
	__end_of_setPA0:
;; =============== function _setPA0 ends ============

	signat	_setPA0,4216
	global	_setPB2
psect	text1027,local,class=CODE,delta=2
global __ptext1027
__ptext1027:

;; *************** function _setPB2 *****************
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
;;		_clearParaFunction1
;;		_main
;; This function uses a non-reentrant model
;;
psect	text1027
	file	"C:\temp\dev\AK7030-OTP\main.c"
	line	200
	global	__size_of_setPB2
	__size_of_setPB2	equ	__end_of_setPB2-_setPB2
	
_setPB2:	
	opt	stack 5
; Regs used in _setPB2: [wreg]
;setPB2@bValue stored from wreg
	movwf	(setPB2@bValue)
	line	201
	
l4701:	
;main.c: 201: if( bValue )
	movf	(setPB2@bValue),w
	skipz
	goto	u1640
	goto	l710
u1640:
	line	203
	
l4703:	
;main.c: 203: PB2 = 1;
	bsf	(50/8),(50)&7
	goto	l712
	line	207
	
l710:	
	line	209
;main.c: 207: else
;main.c: 209: PB2 = 0;
	bcf	(50/8),(50)&7
	line	213
	
l712:	
	return
	opt stack 0
GLOBAL	__end_of_setPB2
	__end_of_setPB2:
;; =============== function _setPB2 ends ============

	signat	_setPB2,4216
	global	_setPB1
psect	text1028,local,class=CODE,delta=2
global __ptext1028
__ptext1028:

;; *************** function _setPB1 *****************
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
;;		_clearParaFunction1
;;		_main
;; This function uses a non-reentrant model
;;
psect	text1028
	file	"C:\temp\dev\AK7030-OTP\main.c"
	line	183
	global	__size_of_setPB1
	__size_of_setPB1	equ	__end_of_setPB1-_setPB1
	
_setPB1:	
	opt	stack 5
; Regs used in _setPB1: [wreg]
;setPB1@bValue stored from wreg
	movwf	(setPB1@bValue)
	line	184
	
l4697:	
;main.c: 184: if( bValue )
	movf	(setPB1@bValue),w
	skipz
	goto	u1630
	goto	l705
u1630:
	line	186
	
l4699:	
;main.c: 186: PB1 = 1;
	bsf	(49/8),(49)&7
	goto	l707
	line	190
	
l705:	
	line	192
;main.c: 190: else
;main.c: 192: PB1 = 0;
	bcf	(49/8),(49)&7
	line	196
	
l707:	
	return
	opt stack 0
GLOBAL	__end_of_setPB1
	__end_of_setPB1:
;; =============== function _setPB1 ends ============

	signat	_setPB1,4216
	global	_setPB0
psect	text1029,local,class=CODE,delta=2
global __ptext1029
__ptext1029:

;; *************** function _setPB0 *****************
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
;;		_clearParaFunction1
;;		_main
;; This function uses a non-reentrant model
;;
psect	text1029
	file	"C:\temp\dev\AK7030-OTP\main.c"
	line	166
	global	__size_of_setPB0
	__size_of_setPB0	equ	__end_of_setPB0-_setPB0
	
_setPB0:	
	opt	stack 5
; Regs used in _setPB0: [wreg]
;setPB0@bValue stored from wreg
	movwf	(setPB0@bValue)
	line	167
	
l4693:	
;main.c: 167: if( bValue )
	movf	(setPB0@bValue),w
	skipz
	goto	u1620
	goto	l700
u1620:
	line	169
	
l4695:	
;main.c: 169: PB0 = 1;
	bsf	(48/8),(48)&7
	goto	l702
	line	173
	
l700:	
	line	175
;main.c: 173: else
;main.c: 175: PB0 = 0;
	bcf	(48/8),(48)&7
	line	179
	
l702:	
	return
	opt stack 0
GLOBAL	__end_of_setPB0
	__end_of_setPB0:
;; =============== function _setPB0 ends ============

	signat	_setPB0,4216
	global	_initPin
psect	text1030,local,class=CODE,delta=2
global __ptext1030
__ptext1030:

;; *************** function _initPin *****************
;; Defined at:
;;		line 129 in file "C:\temp\dev\AK7030-OTP\main.c"
;; Parameters:    Size  Location     Type
;;		None
;; Auto vars:     Size  Location     Type
;;		None
;; Return value:  Size  Location     Type
;;		None               void
;; Registers used:
;;		None
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
;;		_main
;; This function uses a non-reentrant model
;;
psect	text1030
	file	"C:\temp\dev\AK7030-OTP\main.c"
	line	129
	global	__size_of_initPin
	__size_of_initPin	equ	__end_of_initPin-_initPin
	
_initPin:	
	opt	stack 5
; Regs used in _initPin: []
	line	132
	
l4691:	
;main.c: 132: TRISB0 = 0;
	bsf	status, 5	;RP0=1, select bank1
	bcf	(1072/8)^080h,(1072)&7
	line	133
;main.c: 133: PB0 = 0;
	bcf	status, 5	;RP0=0, select bank0
	bcf	(48/8),(48)&7
	line	134
;main.c: 134: TRISB1 = 0;
	bsf	status, 5	;RP0=1, select bank1
	bcf	(1073/8)^080h,(1073)&7
	line	135
;main.c: 135: PB1 = 0;
	bcf	status, 5	;RP0=0, select bank0
	bcf	(49/8),(49)&7
	line	136
;main.c: 136: TRISB2 = 0;
	bsf	status, 5	;RP0=1, select bank1
	bcf	(1074/8)^080h,(1074)&7
	line	137
;main.c: 137: PB2 = 0;
	bcf	status, 5	;RP0=0, select bank0
	bcf	(50/8),(50)&7
	line	138
;main.c: 138: TRISA0 = 0;
	bsf	status, 5	;RP0=1, select bank1
	bcf	(1064/8)^080h,(1064)&7
	line	139
;main.c: 139: PA0 = 0;
	bcf	status, 5	;RP0=0, select bank0
	bcf	(40/8),(40)&7
	line	140
;main.c: 140: TRISA1 = 0;
	bsf	status, 5	;RP0=1, select bank1
	bcf	(1065/8)^080h,(1065)&7
	line	141
;main.c: 141: PA1 = 0;
	bcf	status, 5	;RP0=0, select bank0
	bcf	(41/8),(41)&7
	line	142
;main.c: 142: TRISA2 = 0;
	bsf	status, 5	;RP0=1, select bank1
	bcf	(1066/8)^080h,(1066)&7
	line	143
;main.c: 143: PA2 = 1;
	bcf	status, 5	;RP0=0, select bank0
	bsf	(42/8),(42)&7
	line	145
;main.c: 145: TRISA3 = 0;
	bsf	status, 5	;RP0=1, select bank1
	bcf	(1067/8)^080h,(1067)&7
	line	146
;main.c: 146: PA3 = 0;
	bcf	status, 5	;RP0=0, select bank0
	bcf	(43/8),(43)&7
	line	147
;main.c: 147: TRISB4 = 0;
	bsf	status, 5	;RP0=1, select bank1
	bcf	(1076/8)^080h,(1076)&7
	line	148
;main.c: 148: PB4 = 0;
	bcf	status, 5	;RP0=0, select bank0
	bcf	(52/8),(52)&7
	line	149
;main.c: 149: TRISB7 = 0;
	bsf	status, 5	;RP0=1, select bank1
	bcf	(1079/8)^080h,(1079)&7
	line	150
;main.c: 150: PB7 = 0;
	bcf	status, 5	;RP0=0, select bank0
	bcf	(55/8),(55)&7
	line	152
;main.c: 152: TRISB6 = 1;
	bsf	status, 5	;RP0=1, select bank1
	bsf	(1078/8)^080h,(1078)&7
	line	161
	
l697:	
	return
	opt stack 0
GLOBAL	__end_of_initPin
	__end_of_initPin:
;; =============== function _initPin ends ============

	signat	_initPin,88
	global	_clearTwentyMinuteTimer
psect	text1031,local,class=CODE,delta=2
global __ptext1031
__ptext1031:

;; *************** function _clearTwentyMinuteTimer *****************
;; Defined at:
;;		line 422 in file "C:\temp\dev\AK7030-OTP\common.c"
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
psect	text1031
	file	"C:\temp\dev\AK7030-OTP\common.c"
	line	422
	global	__size_of_clearTwentyMinuteTimer
	__size_of_clearTwentyMinuteTimer	equ	__end_of_clearTwentyMinuteTimer-_clearTwentyMinuteTimer
	
_clearTwentyMinuteTimer:	
	opt	stack 4
; Regs used in _clearTwentyMinuteTimer: [status,2]
	line	423
	
l4689:	
;common.c: 423: uiTwentyMinuteTimer = 0;
	bsf	status, 5	;RP0=1, select bank1
	clrf	(_uiTwentyMinuteTimer)^080h
	clrf	(_uiTwentyMinuteTimer+1)^080h
	line	424
;common.c: 424: bTwentyMinStartFlag = 0;
	bcf	status, 5	;RP0=0, select bank0
	clrf	(_bTwentyMinStartFlag)
	line	425
	
l1977:	
	return
	opt stack 0
GLOBAL	__end_of_clearTwentyMinuteTimer
	__end_of_clearTwentyMinuteTimer:
;; =============== function _clearTwentyMinuteTimer ends ============

	signat	_clearTwentyMinuteTimer,88
	global	_clearTwentySecondsTimer
psect	text1032,local,class=CODE,delta=2
global __ptext1032
__ptext1032:

;; *************** function _clearTwentySecondsTimer *****************
;; Defined at:
;;		line 415 in file "C:\temp\dev\AK7030-OTP\common.c"
;; Parameters:    Size  Location     Type
;;		None
;; Auto vars:     Size  Location     Type
;;		None
;; Return value:  Size  Location     Type
;;		None               void
;; Registers used:
;;		status,2
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
;; Hardware stack levels required when called:    2
;; This function calls:
;;		Nothing
;; This function is called by:
;;		_clearAllTimer
;;		_main
;;		_call_ADC4_STEP_FOURTH_PREFIX3
;; This function uses a non-reentrant model
;;
psect	text1032
	file	"C:\temp\dev\AK7030-OTP\common.c"
	line	415
	global	__size_of_clearTwentySecondsTimer
	__size_of_clearTwentySecondsTimer	equ	__end_of_clearTwentySecondsTimer-_clearTwentySecondsTimer
	
_clearTwentySecondsTimer:	
	opt	stack 4
; Regs used in _clearTwentySecondsTimer: [status,2]
	line	416
	
l4687:	
;common.c: 416: uiTwentySecondsTimer = 0;
	bsf	status, 5	;RP0=1, select bank1
	clrf	(_uiTwentySecondsTimer)^080h
	clrf	(_uiTwentySecondsTimer+1)^080h
	line	417
;common.c: 417: bTwentySecStartFlag = 0;
	bcf	status, 5	;RP0=0, select bank0
	clrf	(_bTwentySecStartFlag)
	line	418
	
l1974:	
	return
	opt stack 0
GLOBAL	__end_of_clearTwentySecondsTimer
	__end_of_clearTwentySecondsTimer:
;; =============== function _clearTwentySecondsTimer ends ============

	signat	_clearTwentySecondsTimer,88
	global	_clearThreeHoursTimer
psect	text1033,local,class=CODE,delta=2
global __ptext1033
__ptext1033:

;; *************** function _clearThreeHoursTimer *****************
;; Defined at:
;;		line 409 in file "C:\temp\dev\AK7030-OTP\common.c"
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
psect	text1033
	file	"C:\temp\dev\AK7030-OTP\common.c"
	line	409
	global	__size_of_clearThreeHoursTimer
	__size_of_clearThreeHoursTimer	equ	__end_of_clearThreeHoursTimer-_clearThreeHoursTimer
	
_clearThreeHoursTimer:	
	opt	stack 4
; Regs used in _clearThreeHoursTimer: [status,2]
	line	410
	
l4685:	
;common.c: 410: uiSmallTimer = 0;
	bsf	status, 5	;RP0=1, select bank1
	clrf	(_uiSmallTimer)^080h
	clrf	(_uiSmallTimer+1)^080h
	line	411
;common.c: 411: bSmallTimerStartFlag = 0;
	bcf	status, 5	;RP0=0, select bank0
	clrf	(_bSmallTimerStartFlag)
	line	412
	
l1971:	
	return
	opt stack 0
GLOBAL	__end_of_clearThreeHoursTimer
	__end_of_clearThreeHoursTimer:
;; =============== function _clearThreeHoursTimer ends ============

	signat	_clearThreeHoursTimer,88
	global	_clearTwelveHoursTimer
psect	text1034,local,class=CODE,delta=2
global __ptext1034
__ptext1034:

;; *************** function _clearTwelveHoursTimer *****************
;; Defined at:
;;		line 402 in file "C:\temp\dev\AK7030-OTP\common.c"
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
psect	text1034
	file	"C:\temp\dev\AK7030-OTP\common.c"
	line	402
	global	__size_of_clearTwelveHoursTimer
	__size_of_clearTwelveHoursTimer	equ	__end_of_clearTwelveHoursTimer-_clearTwelveHoursTimer
	
_clearTwelveHoursTimer:	
	opt	stack 4
; Regs used in _clearTwelveHoursTimer: [status,2]
	line	403
	
l4683:	
;common.c: 403: uiBigTimer = 0;
	bsf	status, 5	;RP0=1, select bank1
	clrf	(_uiBigTimer)^080h
	clrf	(_uiBigTimer+1)^080h
	line	404
;common.c: 404: bBigTimerStartFlag = 0;
	bcf	status, 5	;RP0=0, select bank0
	clrf	(_bBigTimerStartFlag)
	line	405
	
l1968:	
	return
	opt stack 0
GLOBAL	__end_of_clearTwelveHoursTimer
	__end_of_clearTwelveHoursTimer:
;; =============== function _clearTwelveHoursTimer ends ============

	signat	_clearTwelveHoursTimer,88
	global	_ISR
psect	text1035,local,class=CODE,delta=2
global __ptext1035
__ptext1035:

;; *************** function _ISR *****************
;; Defined at:
;;		line 524 in file "C:\temp\dev\AK7030-OTP\common.c"
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
psect	text1035
	file	"C:\temp\dev\AK7030-OTP\common.c"
	line	524
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
psect	text1035
	line	527
	
i1l4983:	
;common.c: 525: static unsigned char ucTimer1sCnt = 0;
;common.c: 527: if(TMR1IF == 1)
	btfss	(96/8),(96)&7
	goto	u204_21
	goto	u204_20
u204_21:
	goto	i1l5001
u204_20:
	line	529
	
i1l4985:	
;common.c: 528: {
;common.c: 529: TMR1IF = 0 ;
	bcf	(96/8),(96)&7
	line	530
	
i1l4987:	
;common.c: 530: timer.timer10msStopWatch++;
	bsf	status, 5	;RP0=1, select bank1
	incf	(_timer)^080h,f
	line	531
;common.c: 531: ucTimer1sCnt++;
	incf	(ISR@ucTimer1sCnt)^080h,f
	line	533
	
i1l4989:	
;common.c: 533: if(ucTimer1sCnt >= 100)
	movlw	(064h)
	subwf	(ISR@ucTimer1sCnt)^080h,w
	skipc
	goto	u205_21
	goto	u205_20
u205_21:
	goto	i1l5001
u205_20:
	line	535
	
i1l4991:	
;common.c: 534: {
;common.c: 535: ucTimer1sCnt = 0;
	clrf	(ISR@ucTimer1sCnt)^080h
	line	536
	
i1l4993:	
;common.c: 536: if(uiBigTimer > 0)
	movf	(_uiBigTimer+1)^080h,w
	iorwf	(_uiBigTimer)^080h,w
	skipnz
	goto	u206_21
	goto	u206_20
u206_21:
	goto	i1l2024
u206_20:
	line	537
	
i1l4995:	
;common.c: 537: uiBigTimer--;
	movlw	low(01h)
	subwf	(_uiBigTimer)^080h,f
	movlw	high(01h)
	skipc
	decf	(_uiBigTimer+1)^080h,f
	subwf	(_uiBigTimer+1)^080h,f
	
i1l2024:	
	line	539
;common.c: 539: if(uiSmallTimer)
	movf	(_uiSmallTimer+1)^080h,w
	iorwf	(_uiSmallTimer)^080h,w
	skipnz
	goto	u207_21
	goto	u207_20
u207_21:
	goto	i1l2025
u207_20:
	line	540
	
i1l4997:	
;common.c: 540: uiSmallTimer--;
	movlw	low(01h)
	subwf	(_uiSmallTimer)^080h,f
	movlw	high(01h)
	skipc
	decf	(_uiSmallTimer+1)^080h,f
	subwf	(_uiSmallTimer+1)^080h,f
	
i1l2025:	
	line	542
;common.c: 542: if(uiTwentySecondsTimer)
	movf	(_uiTwentySecondsTimer+1)^080h,w
	iorwf	(_uiTwentySecondsTimer)^080h,w
	skipnz
	goto	u208_21
	goto	u208_20
u208_21:
	goto	i1l5001
u208_20:
	line	543
	
i1l4999:	
;common.c: 543: uiTwentySecondsTimer--;
	movlw	low(01h)
	subwf	(_uiTwentySecondsTimer)^080h,f
	movlw	high(01h)
	skipc
	decf	(_uiTwentySecondsTimer+1)^080h,f
	subwf	(_uiTwentySecondsTimer+1)^080h,f
	line	547
	
i1l5001:	
;common.c: 544: }
;common.c: 545: }
;common.c: 547: if(ADIF)
	bcf	status, 5	;RP0=0, select bank0
	btfss	(106/8),(106)&7
	goto	u209_21
	goto	u209_20
u209_21:
	goto	i1l2028
u209_20:
	line	549
	
i1l5003:	
;common.c: 548: {
;common.c: 549: ADIF=0;
	bcf	(106/8),(106)&7
	line	550
	
i1l5005:	
;common.c: 550: setAD_ConvertFlag(1);
	movlw	(01h)
	fcall	i1_setAD_ConvertFlag
	line	551
	
i1l5007:	
;common.c: 551: vPutSampleDataIntoTable(adc_get(),sampleChannelSelect);
	fcall	_adc_get
	movf	(1+(?_adc_get)),w
	movwf	(?_vPutSampleDataIntoTable+1)
	movf	(0+(?_adc_get)),w
	movwf	(?_vPutSampleDataIntoTable)
	bcf	status, 5	;RP0=0, select bank0
	movf	(_sampleChannelSelect),w
	movwf	0+(?_vPutSampleDataIntoTable)+02h
	fcall	_vPutSampleDataIntoTable
	line	581
	
i1l2028:	
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
psect	text1036,local,class=CODE,delta=2
global __ptext1036
__ptext1036:

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
psect	text1036
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
	
i1l5013:	
;common.c: 236: adc_convert_flag = flag;
	movf	(i1setAD_ConvertFlag@flag),w
	bsf	status, 5	;RP0=1, select bank1
	movwf	(_adc_convert_flag)^080h
	line	237
	
i1l1928:	
	return
	opt stack 0
GLOBAL	__end_ofi1_setAD_ConvertFlag
	__end_ofi1_setAD_ConvertFlag:
;; =============== function i1_setAD_ConvertFlag ends ============

	signat	i1_setAD_ConvertFlag,88
	global	_adc_get
psect	text1037,local,class=CODE,delta=2
global __ptext1037
__ptext1037:

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
psect	text1037
	file	"C:\temp\dev\AK7030-OTP\periph.c"
	line	105
	global	__size_of_adc_get
	__size_of_adc_get	equ	__end_of_adc_get-_adc_get
	
_adc_get:	
	opt	stack 3
; Regs used in _adc_get: [wreg]
	line	107
	
i1l5009:	
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
	
i1l2684:	
	return
	opt stack 0
GLOBAL	__end_of_adc_get
	__end_of_adc_get:
;; =============== function _adc_get ends ============

	signat	_adc_get,90
	global	_vPutSampleDataIntoTable
psect	text1038,local,class=CODE,delta=2
global __ptext1038
__ptext1038:

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
psect	text1038
	file	"C:\temp\dev\AK7030-OTP\common.c"
	line	105
	global	__size_of_vPutSampleDataIntoTable
	__size_of_vPutSampleDataIntoTable	equ	__end_of_vPutSampleDataIntoTable-_vPutSampleDataIntoTable
	
_vPutSampleDataIntoTable:	
	opt	stack 3
; Regs used in _vPutSampleDataIntoTable: [wreg-fsr0h+status,2+status,0+btemp+1]
	line	115
	
i1l4917:	
;common.c: 107: static unsigned char ucChannelZeroLength = 0;
;common.c: 109: static unsigned char ucChannelSecondLength = 0;
;common.c: 111: static unsigned char ucChannelFifthLength = 0;
;common.c: 113: static unsigned char ucChannelSixthLength = 0;
;common.c: 115: if(channel == 0)
	movf	(vPutSampleDataIntoTable@channel),f
	skipz
	goto	u195_21
	goto	u195_20
u195_21:
	goto	i1l4929
u195_20:
	line	117
	
i1l4919:	
;common.c: 116: {
;common.c: 117: if(ucChannelZeroLength < 12)
	movlw	(0Ch)
	subwf	(vPutSampleDataIntoTable@ucChannelZeroLength),w
	skipnc
	goto	u196_21
	goto	u196_20
u196_21:
	goto	i1l4925
u196_20:
	line	119
	
i1l4921:	
;common.c: 118: {
;common.c: 119: uiSampleChannelZero[ucChannelZeroLength] = uiSampleData;
	clrc
	rlf	(vPutSampleDataIntoTable@ucChannelZeroLength),w
	addlw	_uiSampleChannelZero&0ffh
	movwf	fsr0
	movf	(vPutSampleDataIntoTable@uiSampleData),w
	bcf	status, 7	;select IRP bank1
	movwf	indf
	incf	fsr0,f
	movf	(vPutSampleDataIntoTable@uiSampleData+1),w
	movwf	indf
	line	121
	
i1l4923:	
;common.c: 121: ucChannelZeroLength++;
	incf	(vPutSampleDataIntoTable@ucChannelZeroLength),f
	line	122
;common.c: 122: }
	goto	i1l1910
	line	125
	
i1l4925:	
;common.c: 123: else
;common.c: 124: {
;common.c: 125: ucChannelZeroLength = 0;
	clrf	(vPutSampleDataIntoTable@ucChannelZeroLength)
	line	127
	
i1l4927:	
;common.c: 127: uiSampleChannelZero[ucChannelZeroLength] = uiSampleData;
	clrc
	rlf	(vPutSampleDataIntoTable@ucChannelZeroLength),w
	addlw	_uiSampleChannelZero&0ffh
	movwf	fsr0
	movf	(vPutSampleDataIntoTable@uiSampleData),w
	bcf	status, 7	;select IRP bank1
	movwf	indf
	incf	fsr0,f
	movf	(vPutSampleDataIntoTable@uiSampleData+1),w
	movwf	indf
	goto	i1l1910
	line	130
	
i1l4929:	
;common.c: 130: else if(channel == 2)
	movf	(vPutSampleDataIntoTable@channel),w
	xorlw	02h
	skipz
	goto	u197_21
	goto	u197_20
u197_21:
	goto	i1l4941
u197_20:
	line	132
	
i1l4931:	
;common.c: 131: {
;common.c: 132: if(ucChannelSecondLength < 12)
	movlw	(0Ch)
	subwf	(vPutSampleDataIntoTable@ucChannelSecondLength),w
	skipnc
	goto	u198_21
	goto	u198_20
u198_21:
	goto	i1l4937
u198_20:
	line	134
	
i1l4933:	
;common.c: 133: {
;common.c: 134: uiSampleChannelSecond[ucChannelSecondLength] = uiSampleData;
	clrc
	rlf	(vPutSampleDataIntoTable@ucChannelSecondLength),w
	addlw	_uiSampleChannelSecond&0ffh
	movwf	fsr0
	movf	(vPutSampleDataIntoTable@uiSampleData),w
	bsf	status, 7	;select IRP bank3
	movwf	indf
	incf	fsr0,f
	movf	(vPutSampleDataIntoTable@uiSampleData+1),w
	movwf	indf
	line	136
	
i1l4935:	
;common.c: 136: ucChannelSecondLength++;
	incf	(vPutSampleDataIntoTable@ucChannelSecondLength),f
	line	137
;common.c: 137: }
	goto	i1l1910
	line	140
	
i1l4937:	
;common.c: 138: else
;common.c: 139: {
;common.c: 140: ucChannelSecondLength = 0;
	clrf	(vPutSampleDataIntoTable@ucChannelSecondLength)
	line	142
	
i1l4939:	
;common.c: 142: uiSampleChannelSecond[ucChannelSecondLength] = uiSampleData;
	clrc
	rlf	(vPutSampleDataIntoTable@ucChannelSecondLength),w
	addlw	_uiSampleChannelSecond&0ffh
	movwf	fsr0
	movf	(vPutSampleDataIntoTable@uiSampleData),w
	bsf	status, 7	;select IRP bank3
	movwf	indf
	incf	fsr0,f
	movf	(vPutSampleDataIntoTable@uiSampleData+1),w
	movwf	indf
	goto	i1l1910
	line	145
	
i1l4941:	
;common.c: 145: else if(channel == 5)
	movf	(vPutSampleDataIntoTable@channel),w
	xorlw	05h
	skipz
	goto	u199_21
	goto	u199_20
u199_21:
	goto	i1l4953
u199_20:
	line	147
	
i1l4943:	
;common.c: 146: {
;common.c: 147: if(ucChannelFifthLength < 12)
	movlw	(0Ch)
	subwf	(vPutSampleDataIntoTable@ucChannelFifthLength),w
	skipnc
	goto	u200_21
	goto	u200_20
u200_21:
	goto	i1l4949
u200_20:
	line	149
	
i1l4945:	
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
	
i1l4947:	
;common.c: 151: ucChannelFifthLength++;
	incf	(vPutSampleDataIntoTable@ucChannelFifthLength),f
	line	152
;common.c: 152: }
	goto	i1l1910
	line	155
	
i1l4949:	
;common.c: 153: else
;common.c: 154: {
;common.c: 155: ucChannelFifthLength = 0;
	clrf	(vPutSampleDataIntoTable@ucChannelFifthLength)
	line	157
	
i1l4951:	
;common.c: 157: uiSampleChannelFifth[ucChannelFifthLength] = uiSampleData;
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
	goto	i1l1910
	line	160
	
i1l4953:	
;common.c: 160: else if(channel == 6)
	movf	(vPutSampleDataIntoTable@channel),w
	xorlw	06h
	skipz
	goto	u201_21
	goto	u201_20
u201_21:
	goto	i1l4965
u201_20:
	line	162
	
i1l4955:	
;common.c: 161: {
;common.c: 162: if(ucChannelSixthLength < 12)
	movlw	(0Ch)
	subwf	(vPutSampleDataIntoTable@ucChannelSixthLength),w
	skipnc
	goto	u202_21
	goto	u202_20
u202_21:
	goto	i1l4961
u202_20:
	line	164
	
i1l4957:	
;common.c: 163: {
;common.c: 164: uiSampleChannelSixth[ucChannelSixthLength] = uiSampleData;
	clrc
	rlf	(vPutSampleDataIntoTable@ucChannelSixthLength),w
	addlw	_uiSampleChannelSixth&0ffh
	movwf	fsr0
	movf	(vPutSampleDataIntoTable@uiSampleData),w
	bsf	status, 7	;select IRP bank3
	movwf	indf
	incf	fsr0,f
	movf	(vPutSampleDataIntoTable@uiSampleData+1),w
	movwf	indf
	line	166
	
i1l4959:	
;common.c: 166: ucChannelSixthLength++;
	incf	(vPutSampleDataIntoTable@ucChannelSixthLength),f
	line	167
;common.c: 167: }
	goto	i1l1910
	line	170
	
i1l4961:	
;common.c: 168: else
;common.c: 169: {
;common.c: 170: ucChannelSixthLength = 0;
	clrf	(vPutSampleDataIntoTable@ucChannelSixthLength)
	line	172
	
i1l4963:	
;common.c: 172: uiSampleChannelSixth[ucChannelSixthLength] = uiSampleData;
	clrc
	rlf	(vPutSampleDataIntoTable@ucChannelSixthLength),w
	addlw	_uiSampleChannelSixth&0ffh
	movwf	fsr0
	movf	(vPutSampleDataIntoTable@uiSampleData),w
	bsf	status, 7	;select IRP bank3
	movwf	indf
	incf	fsr0,f
	movf	(vPutSampleDataIntoTable@uiSampleData+1),w
	movwf	indf
	goto	i1l1910
	line	177
	
i1l4965:	
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
	
i1l4971:	
;common.c: 186: {
;common.c: 187: uiSampleChannelZero[i] = 0;
	clrc
	rlf	(vPutSampleDataIntoTable@i),w
	addlw	_uiSampleChannelZero&0ffh
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
	bsf	status, 7	;select IRP bank3
	clrf	indf
	incf	fsr0,f
	clrf	indf
	line	191
;common.c: 191: uiSampleChannelFifth[i] = 0;
	clrc
	rlf	(vPutSampleDataIntoTable@i),w
	addlw	_uiSampleChannelFifth&0ffh
	movwf	fsr0
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
	
i1l4973:	
	incf	(vPutSampleDataIntoTable@i),f
	skipnz
	incf	(vPutSampleDataIntoTable@i+1),f
	
i1l4975:	
	movf	(vPutSampleDataIntoTable@i+1),w
	xorlw	80h
	movwf	btemp+1
	movlw	(high(0Ch))^80h
	subwf	btemp+1,w
	skipz
	goto	u203_25
	movlw	low(0Ch)
	subwf	(vPutSampleDataIntoTable@i),w
u203_25:

	skipc
	goto	u203_21
	goto	u203_20
u203_21:
	goto	i1l4971
u203_20:
	line	197
	
i1l1910:	
	return
	opt stack 0
GLOBAL	__end_of_vPutSampleDataIntoTable
	__end_of_vPutSampleDataIntoTable:
;; =============== function _vPutSampleDataIntoTable ends ============

	signat	_vPutSampleDataIntoTable,8312
psect	text1039,local,class=CODE,delta=2
global __ptext1039
__ptext1039:
	global	btemp
	btemp set 07Eh

	DABS	1,126,2	;btemp
	global	wtemp0
	wtemp0 set btemp
	end
