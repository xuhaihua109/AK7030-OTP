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
# 82 "C:\temp\dev\AK7030-OTP\main.c"
	psect config,class=CONFIG,delta=2 ;#
# 82 "C:\temp\dev\AK7030-OTP\main.c"
	dw 0x2FFF & 0x3FFF & 0x3FFF & 0x3FFF & 0x3FFF & 0x3FFF ;#
# 83 "C:\temp\dev\AK7030-OTP\main.c"
	psect config,class=CONFIG,delta=2 ;#
# 83 "C:\temp\dev\AK7030-OTP\main.c"
	dw 0x3FFF & 0x3FDF & 0x3FFF & 0x3FFE ;#
# 84 "C:\temp\dev\AK7030-OTP\main.c"
	psect config,class=CONFIG,delta=2 ;#
# 84 "C:\temp\dev\AK7030-OTP\main.c"
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
	global	_uiSampleChannelSixth
	global	_uiSampleChannelZero
	global	_uiSampleChannelSecond
	global	_ADCON0
psect	text986,local,class=CODE,delta=2
global __ptext986
__ptext986:
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

_uiSampleChannelSecond:
       ds      24

psect	bssBANK3,class=BANK3,space=1
global __pbssBANK3
__pbssBANK3:
_uiSampleChannelFifth:
       ds      24

_uiSampleChannelSixth:
       ds      24

_uiSampleChannelZero:
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
	global	?_startTwentyMinuteTimer
?_startTwentyMinuteTimer:	; 0 bytes @ 0x0
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
	global	??_startTwentyMinuteTimer
??_startTwentyMinuteTimer:	; 0 bytes @ 0x0
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
;;		 -> uiSampleChannelSixth(BANK3[24]), uiSampleChannelFifth(BANK3[24]), uiSampleChannelSecond(BANK1[24]), uiSampleChannelZero(BANK3[24]), 
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
;; (0) _main                                                 2     2      0    4471
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
;; (1) _startTwentyMinuteTimer                               0     0      0       0
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
;;		line 669 in file "C:\temp\dev\AK7030-OTP\main.c"
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
	line	669
	global	__size_of_main
	__size_of_main	equ	__end_of_main-_main
	
_main:	
	opt	stack 3
; Regs used in _main: [wreg-fsr0h+status,2+status,0+btemp+1+pclath+cstack]
	line	685
	
l5241:	
;main.c: 679: static unsigned char bCheckTweHour = 0;
;main.c: 685: initPin();
	fcall	_initPin
	line	688
	
l5243:	
;main.c: 688: TRISB3 = 1;
	bsf	(1075/8)^080h,(1075)&7
	line	690
	
l5245:	
;main.c: 690: TRISB5 = 1;
	bsf	(1077/8)^080h,(1077)&7
	line	692
	
l5247:	
;main.c: 692: TRISA7 = 1;
	bsf	(1071/8)^080h,(1071)&7
	line	694
	
l5249:	
;main.c: 694: TRISA6 = 1;
	bsf	(1070/8)^080h,(1070)&7
	line	696
	
l5251:	
;main.c: 696: clock_config();
	fcall	_clock_config
	line	697
	
l5253:	
;main.c: 697: timer1_config();
	fcall	_timer1_config
	line	698
;main.c: 698: timer1_interrupt_config();
	fcall	_timer1_interrupt_config
	line	700
	
l5255:	
;main.c: 700: adc_test_init(0,3);
	movlw	(03h)
	bcf	status, 5	;RP0=0, select bank0
	movwf	(?_adc_test_init)
	movlw	(0)
	fcall	_adc_test_init
	line	707
	
l5257:	
;main.c: 707: adc_start();
	fcall	_adc_start
	line	720
;main.c: 720: startTwentyMinuteTimer();
	fcall	_startTwentyMinuteTimer
	line	725
	
l5259:	
# 725 "C:\temp\dev\AK7030-OTP\main.c"
 clrwdt ;#
psect	maintext
	line	727
;main.c: 727: process_AD_Converter_Value();
	fcall	_process_AD_Converter_Value
	line	729
	
l5261:	
;main.c: 729: if( isPermitSampleTime() )
	fcall	_isPermitSampleTime
	xorlw	0
	skipnz
	goto	u2341
	goto	u2340
u2341:
	goto	l5259
u2340:
	line	733
	
l5263:	
;main.c: 730: {
;main.c: 733: clrSampeTime();
	fcall	_clrSampeTime
	line	748
;main.c: 748: switch(enumMainLoopStep)
	goto	l6001
	line	758
	
l5265:	
;main.c: 751: {
;main.c: 756: static unsigned char ucTimerZeroPoint5s = 0;
;main.c: 758: if(getAdOriginalCh0Value() <= 1950)
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
	goto	l5269
u2350:
	line	760
	
l5267:	
;main.c: 759: {
;main.c: 760: ucTimerZeroPoint5s++;
	incf	(main@ucTimerZeroPoint5s),f
	line	761
;main.c: 761: }
	goto	l5271
	line	763
	
l5269:	
;main.c: 762: else
;main.c: 763: ucTimerZeroPoint5s = 0;
	clrf	(main@ucTimerZeroPoint5s)
	line	765
	
l5271:	
;main.c: 765: if(ucTimerZeroPoint5s >= 5)
	movlw	(05h)
	subwf	(main@ucTimerZeroPoint5s),w
	skipc
	goto	u2361
	goto	u2360
u2361:
	goto	l5277
u2360:
	line	767
	
l5273:	
;main.c: 766: {
;main.c: 767: ucTimerZeroPoint5s = 0;
	clrf	(main@ucTimerZeroPoint5s)
	line	768
	
l5275:	
;main.c: 768: enumMainLoopStep = MAIN_LOOP_STEP_FIRST;
	clrf	(_enumMainLoopStep)
	incf	(_enumMainLoopStep),f
	line	771
	
l5277:	
;main.c: 769: }
;main.c: 771: if(isFinishedTwentyMinuteTimer())
	fcall	_isFinishedTwentyMinuteTimer
	xorlw	0
	skipnz
	goto	u2371
	goto	u2370
u2371:
	goto	l5259
u2370:
	line	772
	
l5279:	
;main.c: 772: enumMainLoopStep = MAIN_LOOP_STEP_10_HOUR_END;
	movlw	(09h)
	bcf	status, 5	;RP0=0, select bank0
	movwf	(_enumMainLoopStep)
	goto	l5259
	
l772:	
	line	773
;main.c: 773: break;
	goto	l5259
	line	787
	
l5281:	
;main.c: 777: {
;main.c: 782: static unsigned char ucTimerZeroPoint3s = 0;
;main.c: 784: static unsigned char ucTimerCntP3s = 0;
;main.c: 787: if(getAdOriginalCh0Value() <= 1950)
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
	goto	l5293
u2380:
	line	789
	
l5283:	
;main.c: 788: {
;main.c: 789: ucTimerCntP3s++;
	incf	(main@ucTimerCntP3s),f
	line	790
	
l5285:	
;main.c: 790: if(ucTimerCntP3s >= 3)
	movlw	(03h)
	subwf	(main@ucTimerCntP3s),w
	skipc
	goto	u2391
	goto	u2390
u2391:
	goto	l772
u2390:
	line	792
	
l5287:	
;main.c: 791: {
;main.c: 792: ucTimerCntP3s = 0;
	clrf	(main@ucTimerCntP3s)
	line	794
	
l5289:	
;main.c: 794: enumMainLoopStep = MAIN_LOOP_STEP_SECOND;
	movlw	(02h)
	movwf	(_enumMainLoopStep)
	line	796
	
l5291:	
;main.c: 796: ucTimerZeroPoint3s = 0;
	clrf	(main@ucTimerZeroPoint3s)
	goto	l5259
	line	802
	
l5293:	
;main.c: 800: else
;main.c: 801: {
;main.c: 802: ucTimerZeroPoint3s++;
	incf	(main@ucTimerZeroPoint3s),f
	line	804
	
l5295:	
;main.c: 804: if(ucTimerZeroPoint3s >= 3)
	movlw	(03h)
	subwf	(main@ucTimerZeroPoint3s),w
	skipc
	goto	u2401
	goto	u2400
u2401:
	goto	l772
u2400:
	line	806
	
l5297:	
;main.c: 805: {
;main.c: 806: ucTimerZeroPoint3s = 0;
	clrf	(main@ucTimerZeroPoint3s)
	line	808
	
l5299:	
;main.c: 808: clearParaFunction1();
	fcall	_clearParaFunction1
	goto	l5259
	line	823
	
l5301:	
;main.c: 816: {
;main.c: 821: static unsigned char ucTimerP5s = 0;
;main.c: 823: setPA3(1);
	movlw	(01h)
	fcall	_setPA3
	line	824
;main.c: 824: setPB4(1);
	movlw	(01h)
	fcall	_setPB4
	line	826
	
l5303:	
;main.c: 826: if(ucTimerP5s < 5)
	movlw	(05h)
	subwf	(main@ucTimerP5s),w
	skipnc
	goto	u2411
	goto	u2410
u2411:
	goto	l5307
u2410:
	line	827
	
l5305:	
;main.c: 827: ucTimerP5s++;
	incf	(main@ucTimerP5s),f
	goto	l5259
	line	830
	
l5307:	
;main.c: 828: else
;main.c: 829: {
;main.c: 830: ucTimerP5s = 0;
	clrf	(main@ucTimerP5s)
	line	832
	
l5309:	
;main.c: 832: startTwentyMinuteTimer();
	fcall	_startTwentyMinuteTimer
	line	834
	
l5311:	
;main.c: 834: enumMainLoopStep = MAIN_LOOP_STEP_THIRD;
	movlw	(03h)
	bcf	status, 5	;RP0=0, select bank0
	movwf	(_enumMainLoopStep)
	goto	l5259
	line	853
	
l5313:	
;main.c: 841: {
;main.c: 846: static unsigned char ucTimerLessZeroP5s = 0;
;main.c: 848: static unsigned char ucTimerLargeZeroP5s = 0;
;main.c: 851: static unsigned char ucTimerRightP5s = 0;
;main.c: 853: if(getAdOriginalCh6Value() <= 85)
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
	goto	l5319
u2420:
	line	855
	
l5315:	
;main.c: 854: {
;main.c: 855: ucTimerLargeZeroP5s = 0;
	clrf	(main@ucTimerLargeZeroP5s)
	line	857
	
l5317:	
;main.c: 857: ucTimerLessZeroP5s++;
	incf	(main@ucTimerLessZeroP5s),f
	line	858
;main.c: 858: }
	goto	l5325
	line	861
	
l5319:	
;main.c: 859: else
;main.c: 860: {
;main.c: 861: ucTimerLargeZeroP5s++;
	incf	(main@ucTimerLargeZeroP5s),f
	line	863
	
l5321:	
;main.c: 863: ucTimerLessZeroP5s = 0;
	clrf	(main@ucTimerLessZeroP5s)
	line	865
	
l5323:	
;main.c: 865: ucTimerRightP5s = 0;
	clrf	(main@ucTimerRightP5s)
	line	868
	
l5325:	
;main.c: 866: }
;main.c: 868: if(ucTimerLargeZeroP5s >= 3)
	movlw	(03h)
	subwf	(main@ucTimerLargeZeroP5s),w
	skipc
	goto	u2431
	goto	u2430
u2431:
	goto	l5331
u2430:
	line	870
	
l5327:	
;main.c: 869: {
;main.c: 870: ucTimerLargeZeroP5s = 0;
	clrf	(main@ucTimerLargeZeroP5s)
	line	871
	
l5329:	
;main.c: 871: enumMainLoopStep = MAIN_LOOP_STEP_FOURTH;
	movlw	(04h)
	movwf	(_enumMainLoopStep)
	line	872
;main.c: 872: }
	goto	l5345
	line	873
	
l5331:	
;main.c: 873: else if( ucTimerLessZeroP5s >= 3)
	movlw	(03h)
	subwf	(main@ucTimerLessZeroP5s),w
	skipc
	goto	u2441
	goto	u2440
u2441:
	goto	l5345
u2440:
	line	876
	
l5333:	
;main.c: 874: {
;main.c: 876: if(getAdOriginalCh6Value() < 65)
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
	goto	l5337
u2450:
	line	878
	
l5335:	
;main.c: 877: {
;main.c: 878: ucTimerRightP5s++;
	incf	(main@ucTimerRightP5s),f
	line	879
;main.c: 879: }
	goto	l5339
	line	882
	
l5337:	
;main.c: 880: else
;main.c: 881: {
;main.c: 882: ucTimerRightP5s = 0;
	clrf	(main@ucTimerRightP5s)
	line	885
	
l5339:	
;main.c: 883: }
;main.c: 885: if(ucTimerRightP5s >= 3)
	movlw	(03h)
	subwf	(main@ucTimerRightP5s),w
	skipc
	goto	u2461
	goto	u2460
u2461:
	goto	l804
u2460:
	line	887
	
l5341:	
;main.c: 886: {
;main.c: 887: ucTimerLargeZeroP5s = 0;
	clrf	(main@ucTimerLargeZeroP5s)
	line	888
;main.c: 888: ucTimerRightP5s = 0;
	clrf	(main@ucTimerRightP5s)
	line	889
	
l5343:	
;main.c: 889: enumMainLoopStep = MAIN_LOOP_STEP_3_HOUR_BRANCH;
	movlw	(08h)
	movwf	(_enumMainLoopStep)
	line	890
;main.c: 890: }
	goto	l5345
	line	899
;main.c: 896: else
;main.c: 897: {
;main.c: 898: ;
	
l804:	
	line	901
	
l5345:	
;main.c: 899: }
;main.c: 901: if((MAIN_LOOP_STEP_3_HOUR_BRANCH == enumMainLoopStep) || (MAIN_LOOP_STEP_FOURTH == enumMainLoopStep))
	movf	(_enumMainLoopStep),w
	xorlw	08h
	skipnz
	goto	u2471
	goto	u2470
u2471:
	goto	l5349
u2470:
	
l5347:	
	movf	(_enumMainLoopStep),w
	xorlw	04h
	skipz
	goto	u2481
	goto	u2480
u2481:
	goto	l772
u2480:
	line	903
	
l5349:	
;main.c: 902: {
;main.c: 903: ucTimerRightP5s = 0;
	clrf	(main@ucTimerRightP5s)
	line	904
;main.c: 904: ucTimerLargeZeroP5s = 0;
	clrf	(main@ucTimerLargeZeroP5s)
	line	905
;main.c: 905: ucTimerLessZeroP5s = 0;
	clrf	(main@ucTimerLessZeroP5s)
	goto	l5259
	line	919
	
l5351:	
;main.c: 913: {
;main.c: 919: startTwelveHourTimer(36000);
	movlw	low(08CA0h)
	movwf	(?_startTwelveHourTimer)
	movlw	high(08CA0h)
	movwf	((?_startTwelveHourTimer))+1
	fcall	_startTwelveHourTimer
	line	920
	
l5353:	
;main.c: 920: enumMainLoopStep = MAIN_LOOP_STEP_FIFTH;
	movlw	(05h)
	bcf	status, 5	;RP0=0, select bank0
	movwf	(_enumMainLoopStep)
	line	922
	
l5355:	
;main.c: 922: bCheckTweHour = 0;
	clrf	(main@bCheckTweHour)
	line	924
;main.c: 924: break;
	goto	l5259
	line	932
	
l5357:	
;main.c: 928: {
;main.c: 932: if(( isFinishedTwelveHoursTimer() && (! bCheckTweHour)))
	fcall	_isFinishedTwelveHoursTimer
	xorlw	0
	skipnz
	goto	u2491
	goto	u2490
u2491:
	goto	l5893
u2490:
	
l5359:	
	bcf	status, 5	;RP0=0, select bank0
	movf	(main@bCheckTweHour),f
	skipz
	goto	u2501
	goto	u2500
u2501:
	goto	l5893
u2500:
	line	934
	
l5361:	
;main.c: 933: {
;main.c: 934: enumMainLoopStep = MAIN_LOOP_STEP_10_HOUR_END;
	movlw	(09h)
	movwf	(_enumMainLoopStep)
	line	935
	
l5363:	
;main.c: 935: bCheckTweHour = 1;
	clrf	(main@bCheckTweHour)
	incf	(main@bCheckTweHour),f
	line	936
;main.c: 936: }
	goto	l5259
	line	942
;main.c: 941: {
;main.c: 942: case ADC4_STEP_INIT:
	
l813:	
	line	948
;main.c: 943: {
;main.c: 948: ucADC4_Step = ADC4_STEP_FIRST;
	clrf	(_ucADC4_Step)
	incf	(_ucADC4_Step),f
	line	949
;main.c: 949: break;
	goto	l5259
	line	961
	
l5365:	
	line	963
	
l5367:	
;main.c: 963: uiCh5Value = getAdOriginalCh5Value();
	fcall	_getAdOriginalCh5Value
	movf	(1+(?_getAdOriginalCh5Value)),w
	movwf	(main@uiCh5Value+1)
	movf	(0+(?_getAdOriginalCh5Value)),w
	movwf	(main@uiCh5Value)
	line	965
	
l5369:	
;main.c: 965: if( 0 == bInitFlag)
	movf	(main@bInitFlag),f
	skipz
	goto	u2511
	goto	u2510
u2511:
	goto	l5375
u2510:
	line	967
	
l5371:	
;main.c: 966: {
;main.c: 967: bInitFlag = 1;
	clrf	(main@bInitFlag)
	incf	(main@bInitFlag),f
	line	968
	
l5373:	
;main.c: 968: uiOldValue = uiCh5Value;
	movf	(main@uiCh5Value+1),w
	movwf	(main@uiOldValue+1)
	movf	(main@uiCh5Value),w
	movwf	(main@uiOldValue)
	line	978
	
l5375:	
;main.c: 969: }
;main.c: 978: if(LESS_THAN_1911 == ucChannel5Type)
	movf	(_ucChannel5Type),f
	skipz
	goto	u2521
	goto	u2520
u2521:
	goto	l5381
u2520:
	line	980
	
l5377:	
;main.c: 979: {
;main.c: 980: uiMinValue = 0;
	bsf	status, 5	;RP0=1, select bank1
	clrf	(main@uiMinValue)^080h
	clrf	(main@uiMinValue+1)^080h
	line	981
	
l5379:	
;main.c: 981: uiMaxValue = 1931;
	movlw	low(078Bh)
	movwf	(main@uiMaxValue)^080h
	movlw	high(078Bh)
	movwf	((main@uiMaxValue)^080h)+1
	line	982
;main.c: 982: }
	goto	l826
	line	983
	
l5381:	
;main.c: 983: else if(BETWEEN_1911_AND_2067 == ucChannel5Type)
	decf	(_ucChannel5Type),w
	skipz
	goto	u2531
	goto	u2530
u2531:
	goto	l5385
u2530:
	line	985
	
l5383:	
;main.c: 984: {
;main.c: 985: uiMinValue = 1931 - 40;
	movlw	low(0763h)
	bsf	status, 5	;RP0=1, select bank1
	movwf	(main@uiMinValue)^080h
	movlw	high(0763h)
	movwf	((main@uiMinValue)^080h)+1
	line	986
;main.c: 986: uiMaxValue = 2047;
	movlw	low(07FFh)
	movwf	(main@uiMaxValue)^080h
	movlw	high(07FFh)
	movwf	((main@uiMaxValue)^080h)+1
	line	987
;main.c: 987: }
	goto	l826
	line	988
	
l5385:	
;main.c: 988: else if(BETWEEN_2067_AND_2204 == ucChannel5Type)
	movf	(_ucChannel5Type),w
	xorlw	02h
	skipz
	goto	u2541
	goto	u2540
u2541:
	goto	l5389
u2540:
	line	990
	
l5387:	
;main.c: 989: {
;main.c: 990: uiMinValue = 2047 - 40;
	movlw	low(07D7h)
	bsf	status, 5	;RP0=1, select bank1
	movwf	(main@uiMinValue)^080h
	movlw	high(07D7h)
	movwf	((main@uiMinValue)^080h)+1
	line	991
;main.c: 991: uiMaxValue = 2164;
	movlw	low(0874h)
	movwf	(main@uiMaxValue)^080h
	movlw	high(0874h)
	movwf	((main@uiMaxValue)^080h)+1
	line	992
;main.c: 992: }
	goto	l826
	line	993
	
l5389:	
;main.c: 993: else if(BETWEEN_2204_AND_2340 == ucChannel5Type)
	movf	(_ucChannel5Type),w
	xorlw	03h
	skipz
	goto	u2551
	goto	u2550
u2551:
	goto	l5393
u2550:
	line	995
	
l5391:	
;main.c: 994: {
;main.c: 995: uiMinValue = 2164 - 40;
	movlw	low(084Ch)
	bsf	status, 5	;RP0=1, select bank1
	movwf	(main@uiMinValue)^080h
	movlw	high(084Ch)
	movwf	((main@uiMinValue)^080h)+1
	line	996
;main.c: 996: uiMaxValue = 2281;
	movlw	low(08E9h)
	movwf	(main@uiMaxValue)^080h
	movlw	high(08E9h)
	movwf	((main@uiMaxValue)^080h)+1
	line	997
;main.c: 997: }
	goto	l826
	line	1000
	
l5393:	
;main.c: 998: else
;main.c: 999: {
;main.c: 1000: uiMinValue = 2281 - 40;
	movlw	low(08C1h)
	bsf	status, 5	;RP0=1, select bank1
	movwf	(main@uiMinValue)^080h
	movlw	high(08C1h)
	movwf	((main@uiMinValue)^080h)+1
	line	1001
;main.c: 1001: uiMaxValue = 2281;
	movlw	low(08E9h)
	movwf	(main@uiMaxValue)^080h
	movlw	high(08E9h)
	movwf	((main@uiMaxValue)^080h)+1
	line	1002
	
l826:	
	line	1006
;main.c: 1002: }
;main.c: 1005: if(( uiCh5Value < uiMinValue )
;main.c: 1006: || ( uiCh5Value > uiMaxValue ))
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
	goto	l5397
u2560:
	
l5395:	
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
	line	1008
	
l5397:	
;main.c: 1007: {
;main.c: 1008: uiOldValue = uiCh5Value;
	bcf	status, 5	;RP0=0, select bank0
	movf	(main@uiCh5Value+1),w
	movwf	(main@uiOldValue+1)
	movf	(main@uiCh5Value),w
	movwf	(main@uiOldValue)
	line	1009
	
l833:	
	line	1011
;main.c: 1009: }
;main.c: 1011: if( uiOldValue < 1931 )
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
	goto	l5401
u2580:
	line	1012
	
l5399:	
;main.c: 1012: ucChannel5Type = LESS_THAN_1911;
	clrf	(_ucChannel5Type)
	goto	l837
	line	1013
	
l5401:	
;main.c: 1013: else if( uiOldValue < 2047 )
	movlw	high(07FFh)
	subwf	(main@uiOldValue+1),w
	movlw	low(07FFh)
	skipnz
	subwf	(main@uiOldValue),w
	skipnc
	goto	u2591
	goto	u2590
u2591:
	goto	l5405
u2590:
	line	1014
	
l5403:	
;main.c: 1014: ucChannel5Type = BETWEEN_1911_AND_2067;
	clrf	(_ucChannel5Type)
	incf	(_ucChannel5Type),f
	goto	l837
	line	1015
	
l5405:	
;main.c: 1015: else if( uiOldValue < 2164 )
	movlw	high(0874h)
	subwf	(main@uiOldValue+1),w
	movlw	low(0874h)
	skipnz
	subwf	(main@uiOldValue),w
	skipnc
	goto	u2601
	goto	u2600
u2601:
	goto	l5409
u2600:
	line	1016
	
l5407:	
;main.c: 1016: ucChannel5Type = BETWEEN_2067_AND_2204;
	movlw	(02h)
	movwf	(_ucChannel5Type)
	goto	l837
	line	1017
	
l5409:	
;main.c: 1017: else if( uiOldValue < 2281 )
	movlw	high(08E9h)
	subwf	(main@uiOldValue+1),w
	movlw	low(08E9h)
	skipnz
	subwf	(main@uiOldValue),w
	skipnc
	goto	u2611
	goto	u2610
u2611:
	goto	l5413
u2610:
	line	1018
	
l5411:	
;main.c: 1018: ucChannel5Type = BETWEEN_2204_AND_2340;
	movlw	(03h)
	movwf	(_ucChannel5Type)
	goto	l837
	line	1020
	
l5413:	
;main.c: 1019: else
;main.c: 1020: ucChannel5Type = MORE_THAN_2340;
	movlw	(04h)
	movwf	(_ucChannel5Type)
	
l837:	
	line	1022
;main.c: 1022: ucADC4_Step = ADC4_STEP_SECOND;
	movlw	(02h)
	movwf	(_ucADC4_Step)
	line	1023
;main.c: 1023: break;
	goto	l5259
	line	1043
	
l5415:	
;main.c: 1042: {
;main.c: 1043: setPA1(1);
	movlw	(01h)
	fcall	_setPA1
	line	1044
	
l5417:	
;main.c: 1044: ucLoaderStep++;
	incf	(main@ucLoaderStep),f
	line	1045
;main.c: 1045: break;
	goto	l5259
	line	1050
	
l5419:	
;main.c: 1049: {
;main.c: 1050: if(ucTimerDelay >= 5)
	movlw	(05h)
	subwf	(main@ucTimerDelay),w
	skipc
	goto	u2621
	goto	u2620
u2621:
	goto	l5427
u2620:
	line	1052
	
l5421:	
;main.c: 1051: {
;main.c: 1052: setPA0(1);
	movlw	(01h)
	fcall	_setPA0
	line	1053
	
l5423:	
;main.c: 1053: ucTimerDelay = 0;
	clrf	(main@ucTimerDelay)
	goto	l5417
	line	1057
	
l5427:	
;main.c: 1056: else
;main.c: 1057: ucTimerDelay++;
	incf	(main@ucTimerDelay),f
	goto	l5259
	line	1063
	
l5429:	
;main.c: 1062: {
;main.c: 1063: if(ucTimerDelay >= 5)
	movlw	(05h)
	subwf	(main@ucTimerDelay),w
	skipc
	goto	u2631
	goto	u2630
u2631:
	goto	l5427
u2630:
	line	1065
	
l5431:	
;main.c: 1064: {
;main.c: 1065: setPB0(1);
	movlw	(01h)
	fcall	_setPB0
	goto	l5423
	line	1077
	
l5439:	
;main.c: 1076: {
;main.c: 1077: if(ucTimerDelay >= 5)
	movlw	(05h)
	subwf	(main@ucTimerDelay),w
	skipc
	goto	u2641
	goto	u2640
u2641:
	goto	l5427
u2640:
	line	1079
	
l5441:	
;main.c: 1078: {
;main.c: 1079: setPB1(1);
	movlw	(01h)
	fcall	_setPB1
	goto	l5423
	line	1090
	
l5449:	
;main.c: 1089: {
;main.c: 1090: if(ucTimerDelay >= 5)
	movlw	(05h)
	subwf	(main@ucTimerDelay),w
	skipc
	goto	u2651
	goto	u2650
u2651:
	goto	l5427
u2650:
	line	1092
	
l5451:	
;main.c: 1091: {
;main.c: 1092: setPB2(1);
	movlw	(01h)
	fcall	_setPB2
	goto	l5423
	line	1103
	
l5459:	
;main.c: 1102: {
;main.c: 1103: if(ucTimerDelay >= 5)
	movlw	(05h)
	subwf	(main@ucTimerDelay),w
	skipc
	goto	u2661
	goto	u2660
u2661:
	goto	l5427
u2660:
	line	1106
	
l5461:	
;main.c: 1104: {
;main.c: 1106: setPA0(0);
	movlw	(0)
	fcall	_setPA0
	line	1107
;main.c: 1107: setPB0(0);
	movlw	(0)
	fcall	_setPB0
	line	1108
;main.c: 1108: setPB1(0);
	movlw	(0)
	fcall	_setPB1
	line	1109
;main.c: 1109: setPB2(0);
	movlw	(0)
	fcall	_setPB2
	goto	l5423
	line	1120
	
l5469:	
;main.c: 1119: {
;main.c: 1120: if(ucTimerDelay >= 1)
	movf	(main@ucTimerDelay),w
	skipz
	goto	u2670
	goto	l5427
u2670:
	line	1122
	
l5471:	
;main.c: 1121: {
;main.c: 1122: ucTimerDelay = 0;
	clrf	(main@ucTimerDelay)
	line	1124
;main.c: 1124: ucLoaderStep = 0;
	clrf	(main@ucLoaderStep)
	line	1125
	
l5473:	
;main.c: 1125: ucADC4_Step = ADC4_STEP_THIRD;
	movlw	(03h)
	movwf	(_ucADC4_Step)
	line	1126
;main.c: 1126: }
	goto	l5259
	line	1039
	
l5479:	
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
movlw high(S6291)
movwf pclath
	clrc
	rlf fsr,w
	addlw low(S6291)
	movwf pc
psect	swtext1,local,class=CONST,delta=2
global __pswtext1
__pswtext1:
S6291:
	ljmp	l5415
	ljmp	l5419
	ljmp	l5429
	ljmp	l5439
	ljmp	l5449
	ljmp	l5459
	ljmp	l5469
psect	maintext

	line	1148
	
l5481:	
;main.c: 1147: {
;main.c: 1148: setPA1(1);
	movlw	(01h)
	fcall	_setPA1
	line	1149
	
l5483:	
;main.c: 1149: ucLoaderStep1++;
	incf	(main@ucLoaderStep1),f
	line	1150
;main.c: 1150: break;
	goto	l5259
	line	1155
	
l5485:	
;main.c: 1154: {
;main.c: 1155: if(ucTimerDelay1 >= 5)
	movlw	(05h)
	subwf	(main@ucTimerDelay1),w
	skipc
	goto	u2681
	goto	u2680
u2681:
	goto	l5493
u2680:
	line	1157
	
l5487:	
;main.c: 1156: {
;main.c: 1157: setPA0(1);
	movlw	(01h)
	fcall	_setPA0
	line	1158
	
l5489:	
;main.c: 1158: ucTimerDelay1 = 0;
	clrf	(main@ucTimerDelay1)
	goto	l5483
	line	1162
	
l5493:	
;main.c: 1161: else
;main.c: 1162: ucTimerDelay1++;
	incf	(main@ucTimerDelay1),f
	goto	l5259
	line	1168
	
l5495:	
;main.c: 1167: {
;main.c: 1168: if(ucTimerDelay1 >= 5)
	movlw	(05h)
	subwf	(main@ucTimerDelay1),w
	skipc
	goto	u2691
	goto	u2690
u2691:
	goto	l5493
u2690:
	line	1170
	
l5497:	
;main.c: 1169: {
;main.c: 1170: setPB0(1);
	movlw	(01h)
	fcall	_setPB0
	goto	l5489
	line	1181
	
l5505:	
;main.c: 1180: {
;main.c: 1181: if(ucTimerDelay1 >= 5)
	movlw	(05h)
	subwf	(main@ucTimerDelay1),w
	skipc
	goto	u2701
	goto	u2700
u2701:
	goto	l5493
u2700:
	line	1184
	
l5507:	
;main.c: 1182: {
;main.c: 1184: setPB1(1);
	movlw	(01h)
	fcall	_setPB1
	goto	l5489
	line	1195
	
l5515:	
;main.c: 1194: {
;main.c: 1195: if(ucTimerDelay1 >= 5)
	movlw	(05h)
	subwf	(main@ucTimerDelay1),w
	skipc
	goto	u2711
	goto	u2710
u2711:
	goto	l5493
u2710:
	line	1198
	
l5517:	
;main.c: 1196: {
;main.c: 1198: setPB2(1);
	movlw	(01h)
	fcall	_setPB2
	goto	l5489
	line	1209
	
l5525:	
;main.c: 1208: {
;main.c: 1209: if(ucTimerDelay1 >= 5)
	movlw	(05h)
	subwf	(main@ucTimerDelay1),w
	skipc
	goto	u2721
	goto	u2720
u2721:
	goto	l5493
u2720:
	line	1211
	
l5527:	
;main.c: 1210: {
;main.c: 1211: setPA0(0);
	movlw	(0)
	fcall	_setPA0
	line	1213
;main.c: 1213: setPB0(0);
	movlw	(0)
	fcall	_setPB0
	line	1215
;main.c: 1215: setPB1(0);
	movlw	(0)
	fcall	_setPB1
	line	1217
;main.c: 1217: setPB2(0);
	movlw	(0)
	fcall	_setPB2
	goto	l5489
	line	1228
	
l5535:	
;main.c: 1227: {
;main.c: 1228: if(ucTimerDelay1 >= 1)
	movf	(main@ucTimerDelay1),w
	skipz
	goto	u2730
	goto	l5493
u2730:
	line	1230
	
l5537:	
;main.c: 1229: {
;main.c: 1230: ucTimerDelay1 = 0;
	clrf	(main@ucTimerDelay1)
	line	1232
;main.c: 1232: ucLoaderStep1 = 0;
	clrf	(main@ucLoaderStep1)
	goto	l5473
	line	1144
	
l5545:	
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
movlw high(S6293)
movwf pclath
	clrc
	rlf fsr,w
	addlw low(S6293)
	movwf pc
psect	swtext2,local,class=CONST,delta=2
global __pswtext2
__pswtext2:
S6293:
	ljmp	l5481
	ljmp	l5485
	ljmp	l5495
	ljmp	l5505
	ljmp	l5515
	ljmp	l5525
	ljmp	l5535
psect	maintext

	line	1258
	
l5547:	
;main.c: 1256: {
;main.c: 1258: setPA1(1);
	movlw	(01h)
	fcall	_setPA1
	line	1260
;main.c: 1260: setPA0(1);
	movlw	(01h)
	fcall	_setPA0
	line	1261
	
l5549:	
;main.c: 1261: ucLoaderStep2++;
	incf	(main@ucLoaderStep2),f
	line	1262
;main.c: 1262: break;
	goto	l5259
	line	1267
	
l5551:	
;main.c: 1266: {
;main.c: 1267: if(ucTimerDelay2 >= 5)
	movlw	(05h)
	subwf	(main@ucTimerDelay2),w
	skipc
	goto	u2741
	goto	u2740
u2741:
	goto	l5559
u2740:
	line	1270
	
l5553:	
;main.c: 1268: {
;main.c: 1270: setPB0(1);
	movlw	(01h)
	fcall	_setPB0
	line	1271
	
l5555:	
;main.c: 1271: ucTimerDelay2 = 0;
	clrf	(main@ucTimerDelay2)
	goto	l5549
	line	1275
	
l5559:	
;main.c: 1274: else
;main.c: 1275: ucTimerDelay2++;
	incf	(main@ucTimerDelay2),f
	goto	l5259
	line	1281
	
l5561:	
;main.c: 1280: {
;main.c: 1281: if(ucTimerDelay2 >= 5)
	movlw	(05h)
	subwf	(main@ucTimerDelay2),w
	skipc
	goto	u2751
	goto	u2750
u2751:
	goto	l5559
u2750:
	line	1284
	
l5563:	
;main.c: 1282: {
;main.c: 1284: setPB1(1);
	movlw	(01h)
	fcall	_setPB1
	goto	l5555
	line	1295
	
l5571:	
;main.c: 1294: {
;main.c: 1295: if(ucTimerDelay2 >= 5)
	movlw	(05h)
	subwf	(main@ucTimerDelay2),w
	skipc
	goto	u2761
	goto	u2760
u2761:
	goto	l5559
u2760:
	line	1298
	
l5573:	
;main.c: 1296: {
;main.c: 1298: setPB2(1);
	movlw	(01h)
	fcall	_setPB2
	goto	l5555
	line	1309
	
l5581:	
;main.c: 1308: {
;main.c: 1309: if(ucTimerDelay2 >= 5)
	movlw	(05h)
	subwf	(main@ucTimerDelay2),w
	skipc
	goto	u2771
	goto	u2770
u2771:
	goto	l5559
u2770:
	line	1313
	
l5583:	
;main.c: 1310: {
;main.c: 1313: setPB0(0);
	movlw	(0)
	fcall	_setPB0
	line	1315
;main.c: 1315: setPB1(0);
	movlw	(0)
	fcall	_setPB1
	line	1317
;main.c: 1317: setPB2(0);
	movlw	(0)
	fcall	_setPB2
	goto	l5555
	line	1328
	
l5591:	
;main.c: 1327: {
;main.c: 1328: if(ucTimerDelay2 >= 1)
	movf	(main@ucTimerDelay2),w
	skipz
	goto	u2780
	goto	l5559
u2780:
	line	1330
	
l5593:	
;main.c: 1329: {
;main.c: 1330: ucTimerDelay2 = 0;
	clrf	(main@ucTimerDelay2)
	line	1332
;main.c: 1332: ucLoaderStep2 = 0;
	clrf	(main@ucLoaderStep2)
	goto	l5473
	line	1253
	
l5601:	
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
movlw high(S6295)
movwf pclath
	clrc
	rlf fsr,w
	addlw low(S6295)
	movwf pc
psect	swtext3,local,class=CONST,delta=2
global __pswtext3
__pswtext3:
S6295:
	ljmp	l5547
	ljmp	l5551
	ljmp	l5561
	ljmp	l5571
	ljmp	l5581
	ljmp	l5591
psect	maintext

	line	1358
	
l5603:	
;main.c: 1356: {
;main.c: 1358: setPB0(1);
	movlw	(01h)
	fcall	_setPB0
	line	1360
;main.c: 1360: setPA0(1);
	movlw	(01h)
	fcall	_setPA0
	line	1362
;main.c: 1362: setPA1(1);
	movlw	(01h)
	fcall	_setPA1
	line	1363
	
l5605:	
;main.c: 1363: ucLoaderStep3++;
	incf	(main@ucLoaderStep3),f
	line	1364
;main.c: 1364: break;
	goto	l5259
	line	1369
	
l5607:	
;main.c: 1368: {
;main.c: 1369: if(ucTimerDelay3 >= 5)
	movlw	(05h)
	subwf	(main@ucTimerDelay3),w
	skipc
	goto	u2791
	goto	u2790
u2791:
	goto	l5615
u2790:
	line	1372
	
l5609:	
;main.c: 1370: {
;main.c: 1372: setPB1(1);
	movlw	(01h)
	fcall	_setPB1
	line	1373
	
l5611:	
;main.c: 1373: ucTimerDelay3 = 0;
	clrf	(main@ucTimerDelay3)
	goto	l5605
	line	1377
	
l5615:	
;main.c: 1376: else
;main.c: 1377: ucTimerDelay3++;
	incf	(main@ucTimerDelay3),f
	goto	l5259
	line	1383
	
l5617:	
;main.c: 1382: {
;main.c: 1383: if(ucTimerDelay3 >= 5)
	movlw	(05h)
	subwf	(main@ucTimerDelay3),w
	skipc
	goto	u2801
	goto	u2800
u2801:
	goto	l5615
u2800:
	line	1386
	
l5619:	
;main.c: 1384: {
;main.c: 1386: setPB2(1);
	movlw	(01h)
	fcall	_setPB2
	goto	l5611
	line	1398
	
l5627:	
;main.c: 1397: {
;main.c: 1398: if(ucTimerDelay3 >= 5)
	movlw	(05h)
	subwf	(main@ucTimerDelay3),w
	skipc
	goto	u2811
	goto	u2810
u2811:
	goto	l5615
u2810:
	line	1402
	
l5629:	
;main.c: 1399: {
;main.c: 1402: setPB1(0);
	movlw	(0)
	fcall	_setPB1
	line	1404
;main.c: 1404: setPB2(0);
	movlw	(0)
	fcall	_setPB2
	goto	l5611
	line	1415
	
l5637:	
;main.c: 1414: {
;main.c: 1415: if(ucTimerDelay3 >= 1)
	movf	(main@ucTimerDelay3),w
	skipz
	goto	u2820
	goto	l5615
u2820:
	line	1417
	
l5639:	
;main.c: 1416: {
;main.c: 1417: ucTimerDelay3 = 0;
	clrf	(main@ucTimerDelay3)
	line	1419
;main.c: 1419: ucLoaderStep3 = 0;
	clrf	(main@ucLoaderStep3)
	goto	l5473
	line	1353
	
l5647:	
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
	goto	l5603
	xorlw	1^0	; case 1
	skipnz
	goto	l5607
	xorlw	2^1	; case 2
	skipnz
	goto	l5617
	xorlw	3^2	; case 3
	skipnz
	goto	l5627
	xorlw	4^3	; case 4
	skipnz
	goto	l5637
	goto	l772
	opt asmopt_on

	line	1445
	
l5649:	
;main.c: 1443: {
;main.c: 1445: setPB0(1);
	movlw	(01h)
	fcall	_setPB0
	line	1447
;main.c: 1447: setPA0(1);
	movlw	(01h)
	fcall	_setPA0
	line	1449
;main.c: 1449: setPA1(1);
	movlw	(01h)
	fcall	_setPA1
	line	1451
;main.c: 1451: setPB1(1);
	movlw	(01h)
	fcall	_setPB1
	line	1452
	
l5651:	
;main.c: 1452: ucLoaderStep4++;
	incf	(main@ucLoaderStep4),f
	line	1453
;main.c: 1453: break;
	goto	l5259
	line	1458
	
l5653:	
;main.c: 1457: {
;main.c: 1458: if(ucTimerDelay4 >= 5)
	movlw	(05h)
	subwf	(main@ucTimerDelay4),w
	skipc
	goto	u2831
	goto	u2830
u2831:
	goto	l5661
u2830:
	line	1461
	
l5655:	
;main.c: 1459: {
;main.c: 1461: setPB2(1);
	movlw	(01h)
	fcall	_setPB2
	line	1462
	
l5657:	
;main.c: 1462: ucTimerDelay4 = 0;
	clrf	(main@ucTimerDelay4)
	goto	l5651
	line	1466
	
l5661:	
;main.c: 1465: else
;main.c: 1466: ucTimerDelay4++;
	incf	(main@ucTimerDelay4),f
	goto	l5259
	line	1472
	
l5663:	
;main.c: 1471: {
;main.c: 1472: if(ucTimerDelay4 >= 5)
	movlw	(05h)
	subwf	(main@ucTimerDelay4),w
	skipc
	goto	u2841
	goto	u2840
u2841:
	goto	l5661
u2840:
	line	1475
	
l5665:	
;main.c: 1473: {
;main.c: 1475: setPB2(0);
	movlw	(0)
	fcall	_setPB2
	goto	l5657
	line	1486
	
l5673:	
;main.c: 1485: {
;main.c: 1486: if(ucTimerDelay4 >= 1)
	movf	(main@ucTimerDelay4),w
	skipz
	goto	u2850
	goto	l5661
u2850:
	line	1488
	
l5675:	
;main.c: 1487: {
;main.c: 1488: ucTimerDelay4 = 0;
	clrf	(main@ucTimerDelay4)
	line	1490
;main.c: 1490: ucLoaderStep4 = 0;
	clrf	(main@ucLoaderStep4)
	goto	l5473
	line	1440
	
l5683:	
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
	goto	l5649
	xorlw	1^0	; case 1
	skipnz
	goto	l5653
	xorlw	2^1	; case 2
	skipnz
	goto	l5663
	xorlw	3^2	; case 3
	skipnz
	goto	l5673
	goto	l772
	opt asmopt_on

	line	1032
	
l5687:	
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
	goto	l5479
	xorlw	1^0	; case 1
	skipnz
	goto	l5545
	xorlw	2^1	; case 2
	skipnz
	goto	l5601
	xorlw	3^2	; case 3
	skipnz
	goto	l5647
	xorlw	4^3	; case 4
	skipnz
	goto	l5683
	goto	l772
	opt asmopt_on

	line	1522
	
l5689:	
;main.c: 1514: {
;main.c: 1518: static unsigned char ucTimerDelayP2sLess = 0;
;main.c: 1520: static unsigned char ucTimerDelayP2sMore = 0;
;main.c: 1522: if( getAdOriginalCh6Value() <= 150 )
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
	goto	l5695
u2860:
	line	1524
	
l5691:	
;main.c: 1523: {
;main.c: 1524: ucTimerDelayP2sLess++;
	incf	(main@ucTimerDelayP2sLess),f
	line	1525
	
l5693:	
;main.c: 1525: ucTimerDelayP2sMore = 0;
	clrf	(main@ucTimerDelayP2sMore)
	line	1526
;main.c: 1526: }
	goto	l5699
	line	1529
	
l5695:	
;main.c: 1527: else
;main.c: 1528: {
;main.c: 1529: ucTimerDelayP2sMore++;
	incf	(main@ucTimerDelayP2sMore),f
	line	1530
	
l5697:	
;main.c: 1530: ucTimerDelayP2sLess = 0;
	clrf	(main@ucTimerDelayP2sLess)
	line	1533
	
l5699:	
;main.c: 1531: }
;main.c: 1533: if(ucTimerDelayP2sLess > 200)
	movlw	(0C9h)
	subwf	(main@ucTimerDelayP2sLess),w
	skipc
	goto	u2871
	goto	u2870
u2871:
	goto	l972
u2870:
	line	1534
	
l5701:	
;main.c: 1534: ucTimerDelayP2sLess = 2;
	movlw	(02h)
	movwf	(main@ucTimerDelayP2sLess)
	
l972:	
	line	1537
;main.c: 1537: if(ucTimerDelayP2sMore > 200)
	movlw	(0C9h)
	subwf	(main@ucTimerDelayP2sMore),w
	skipc
	goto	u2881
	goto	u2880
u2881:
	goto	l973
u2880:
	line	1538
	
l5703:	
;main.c: 1538: ucTimerDelayP2sMore = 2;
	movlw	(02h)
	movwf	(main@ucTimerDelayP2sMore)
	
l973:	
	line	1540
;main.c: 1540: if( ucTimerDelayP2sLess >= 2)
	movlw	(02h)
	subwf	(main@ucTimerDelayP2sLess),w
	skipc
	goto	u2891
	goto	u2890
u2891:
	goto	l5715
u2890:
	line	1542
	
l5705:	
;main.c: 1541: {
;main.c: 1542: ucTimerDelayP2sLess = 0;
	clrf	(main@ucTimerDelayP2sLess)
	line	1543
;main.c: 1543: ucTimerDelayP2sMore = 0;
	clrf	(main@ucTimerDelayP2sMore)
	line	1545
	
l5707:	
;main.c: 1545: startTwentySecondsTimer();
	fcall	_startTwentySecondsTimer
	line	1548
	
l5709:	
;main.c: 1548: if( !isFinishedTwentySecondsTimer() )
	fcall	_isFinishedTwentySecondsTimer
	iorlw	0
	skipz
	goto	u2901
	goto	u2900
u2901:
	goto	l5713
u2900:
	line	1554
	
l5711:	
;main.c: 1549: {
;main.c: 1554: call_ADC4_STEP_FOURTH_PREFIX2();
	fcall	_call_ADC4_STEP_FOURTH_PREFIX2
	line	1555
;main.c: 1555: }
	goto	l5259
	line	1562
	
l5713:	
;main.c: 1556: else
;main.c: 1558: {
;main.c: 1562: call_ADC4_STEP_FOURTH_PREFIX3(0);
	movlw	(0)
	fcall	_call_ADC4_STEP_FOURTH_PREFIX3
	goto	l5259
	line	1565
	
l5715:	
;main.c: 1565: else if(ucTimerDelayP2sMore >= 2)
	movlw	(02h)
	subwf	(main@ucTimerDelayP2sMore),w
	skipc
	goto	u2911
	goto	u2910
u2911:
	goto	l772
u2910:
	line	1567
	
l5717:	
;main.c: 1566: {
;main.c: 1567: ucTimerDelayP2sMore = 0;
	clrf	(main@ucTimerDelayP2sMore)
	line	1568
;main.c: 1568: ucTimerDelayP2sLess = 0;
	clrf	(main@ucTimerDelayP2sLess)
	goto	l5711
	line	1589
	
l5721:	
;main.c: 1585: {
;main.c: 1589: if( !isFinishedTwentySecondsTimer() )
	fcall	_isFinishedTwentySecondsTimer
	iorlw	0
	skipz
	goto	u2921
	goto	u2920
u2921:
	goto	l5725
u2920:
	line	1590
	
l5723:	
;main.c: 1590: ucADC4_Step = ADC4_STEP_FOURTH_PREFIX2;
	movlw	(05h)
	bcf	status, 5	;RP0=0, select bank0
	movwf	(_ucADC4_Step)
	goto	l5259
	line	1593
	
l5725:	
;main.c: 1592: else
;main.c: 1593: ucADC4_Step = ADC4_STEP_FOURTH_PREFIX3;
	movlw	(06h)
	bcf	status, 5	;RP0=0, select bank0
	movwf	(_ucADC4_Step)
	goto	l5259
	line	1608
	
l5727:	
;main.c: 1600: {
;main.c: 1604: static unsigned char ucTimerCntMore = 0, ucTimerCntLess = 0;
;main.c: 1606: static unsigned char ucTimerCntMoreFlag = 0, ucTimerCntLessFlag = 0;
;main.c: 1608: if((getAdOriginalCh2Value() > 1950))
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
	goto	l5733
u2930:
	line	1610
	
l5729:	
;main.c: 1609: {
;main.c: 1610: ucTimerCntMore++;
	incf	(main@ucTimerCntMore),f
	line	1611
	
l5731:	
;main.c: 1611: ucTimerCntLess = 0;
	bsf	status, 5	;RP0=1, select bank1
	clrf	(main@ucTimerCntLess)^080h
	line	1612
;main.c: 1612: }
	goto	l5737
	line	1615
	
l5733:	
;main.c: 1613: else
;main.c: 1614: {
;main.c: 1615: ucTimerCntLess++;
	bsf	status, 5	;RP0=1, select bank1
	incf	(main@ucTimerCntLess)^080h,f
	line	1616
	
l5735:	
;main.c: 1616: ucTimerCntMore = 0;
	bcf	status, 5	;RP0=0, select bank0
	clrf	(main@ucTimerCntMore)
	line	1619
	
l5737:	
;main.c: 1617: }
;main.c: 1619: if(ucTimerCntMore >= 2)
	movlw	(02h)
	bcf	status, 5	;RP0=0, select bank0
	subwf	(main@ucTimerCntMore),w
	skipc
	goto	u2941
	goto	u2940
u2941:
	goto	l5741
u2940:
	line	1620
	
l5739:	
;main.c: 1620: ucTimerCntMoreFlag = 1;
	bsf	status, 5	;RP0=1, select bank1
	clrf	(main@ucTimerCntMoreFlag)^080h
	incf	(main@ucTimerCntMoreFlag)^080h,f
	line	1622
	
l5741:	
;main.c: 1622: if(ucTimerCntLess >= 2)
	movlw	(02h)
	bsf	status, 5	;RP0=1, select bank1
	subwf	(main@ucTimerCntLess)^080h,w
	skipc
	goto	u2951
	goto	u2950
u2951:
	goto	l5745
u2950:
	line	1623
	
l5743:	
;main.c: 1623: ucTimerCntLessFlag = 1;
	clrf	(main@ucTimerCntLessFlag)^080h
	incf	(main@ucTimerCntLessFlag)^080h,f
	line	1625
	
l5745:	
;main.c: 1625: if( ucTimerCntLessFlag )
	movf	(main@ucTimerCntLessFlag)^080h,w
	skipz
	goto	u2960
	goto	l5815
u2960:
	goto	l5813
	line	1635
	
l5749:	
;main.c: 1634: {
;main.c: 1635: ucTimeCntP2s = 0;
	clrf	(main@ucTimeCntP2s)^080h
	line	1636
	
l5751:	
;main.c: 1636: setPA3(0);
	movlw	(0)
	fcall	_setPA3
	line	1637
	
l5753:	
;main.c: 1637: setPB6(0);
	movlw	(0)
	fcall	_setPB6
	line	1638
	
l5755:	
;main.c: 1638: ucPrefix2Step++;
	bsf	status, 5	;RP0=1, select bank1
	incf	(main@ucPrefix2Step)^080h,f
	line	1639
;main.c: 1639: break;
	goto	l5843
	line	1644
	
l5757:	
;main.c: 1643: {
;main.c: 1644: if((getAdOriginalCh2Value() > 2300))
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
	goto	l5761
u2970:
	line	1646
	
l5759:	
;main.c: 1645: {
;main.c: 1646: ucTimeCntP2s++;
	bsf	status, 5	;RP0=1, select bank1
	incf	(main@ucTimeCntP2s)^080h,f
	line	1647
;main.c: 1647: }
	goto	l5763
	line	1649
	
l5761:	
;main.c: 1648: else
;main.c: 1649: ucTimeCntP2s = 0;
	bsf	status, 5	;RP0=1, select bank1
	clrf	(main@ucTimeCntP2s)^080h
	line	1651
	
l5763:	
;main.c: 1651: if( ucTimeCntP2s >= 2)
	movlw	(02h)
	subwf	(main@ucTimeCntP2s)^080h,w
	skipc
	goto	u2981
	goto	u2980
u2981:
	goto	l5843
u2980:
	line	1653
	
l5765:	
;main.c: 1652: {
;main.c: 1653: ucTimeCntP2s = 0;
	clrf	(main@ucTimeCntP2s)^080h
	goto	l5755
	line	1663
	
l5769:	
;main.c: 1662: {
;main.c: 1663: setPA3(1);
	movlw	(01h)
	fcall	_setPA3
	line	1665
	
l5771:	
;main.c: 1665: setPB6AsInput();
	fcall	_setPB6AsInput
	goto	l5755
	line	1673
	
l5775:	
;main.c: 1671: {
;main.c: 1672: static unsigned char ucTimerCntP5s = 0;
;main.c: 1673: if( ucTimerCntP5s < 5)
	movlw	(05h)
	subwf	(main@ucTimerCntP5s)^080h,w
	skipnc
	goto	u2991
	goto	u2990
u2991:
	goto	l5779
u2990:
	line	1674
	
l5777:	
;main.c: 1674: ucTimerCntP5s++;
	incf	(main@ucTimerCntP5s)^080h,f
	goto	l5843
	line	1677
	
l5779:	
;main.c: 1675: else
;main.c: 1676: {
;main.c: 1677: ucTimerCntP5s = 0;
	clrf	(main@ucTimerCntP5s)^080h
	goto	l5755
	line	1689
	
l5783:	
;main.c: 1685: {
;main.c: 1686: static unsigned char ucMoreThanP3sCnt = 0;
;main.c: 1688: static unsigned char ucLessThanP3sCnt = 0;
;main.c: 1689: if((getAdOriginalCh6Value() < 50))
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
	goto	l5789
u3000:
	line	1691
	
l5785:	
;main.c: 1690: {
;main.c: 1691: ucLessThanP3sCnt++;
	bsf	status, 5	;RP0=1, select bank1
	incf	(main@ucLessThanP3sCnt)^080h,f
	line	1692
	
l5787:	
;main.c: 1692: ucMoreThanP3sCnt = 0;
	clrf	(main@ucMoreThanP3sCnt)^080h
	line	1693
;main.c: 1693: }
	goto	l5793
	line	1696
	
l5789:	
;main.c: 1694: else
;main.c: 1695: {
;main.c: 1696: ucMoreThanP3sCnt++;
	bsf	status, 5	;RP0=1, select bank1
	incf	(main@ucMoreThanP3sCnt)^080h,f
	line	1697
	
l5791:	
;main.c: 1697: ucLessThanP3sCnt = 0;
	clrf	(main@ucLessThanP3sCnt)^080h
	line	1700
	
l5793:	
;main.c: 1698: }
;main.c: 1700: if( ucLessThanP3sCnt >= 3)
	movlw	(03h)
	subwf	(main@ucLessThanP3sCnt)^080h,w
	skipc
	goto	u3011
	goto	u3010
u3011:
	goto	l5799
u3010:
	line	1702
	
l5795:	
;main.c: 1701: {
;main.c: 1702: ucLessThanP3sCnt = 0;
	clrf	(main@ucLessThanP3sCnt)^080h
	line	1703
;main.c: 1703: ucMoreThanP3sCnt = 0;
	clrf	(main@ucMoreThanP3sCnt)^080h
	line	1705
	
l5797:	
;main.c: 1705: enumMainLoopStep = MAIN_LOOP_STEP_FIRST;
	bcf	status, 5	;RP0=0, select bank0
	clrf	(_enumMainLoopStep)
	incf	(_enumMainLoopStep),f
	line	1706
;main.c: 1706: ucADC4_Step = ADC4_STEP_INIT;
	clrf	(_ucADC4_Step)
	line	1707
;main.c: 1707: ucTimerCntMoreFlag = 0;
	bsf	status, 5	;RP0=1, select bank1
	clrf	(main@ucTimerCntMoreFlag)^080h
	line	1709
;main.c: 1709: ucPrefix2Step = 0;
	clrf	(main@ucPrefix2Step)^080h
	line	1713
	
l5799:	
;main.c: 1711: }
;main.c: 1713: if(ucMoreThanP3sCnt > 3)
	movlw	(04h)
	subwf	(main@ucMoreThanP3sCnt)^080h,w
	skipc
	goto	u3021
	goto	u3020
u3021:
	goto	l5843
u3020:
	line	1715
	
l5801:	
;main.c: 1714: {
;main.c: 1715: ucLessThanP3sCnt = 0;
	clrf	(main@ucLessThanP3sCnt)^080h
	line	1716
;main.c: 1716: ucMoreThanP3sCnt = 0;
	clrf	(main@ucMoreThanP3sCnt)^080h
	line	1718
	
l5803:	
;main.c: 1718: enumMainLoopStep = MAIN_LOOP_STEP_THIRD;
	movlw	(03h)
	bcf	status, 5	;RP0=0, select bank0
	movwf	(_enumMainLoopStep)
	line	1719
	
l5805:	
;main.c: 1719: ucADC4_Step = ADC4_STEP_INIT;
	clrf	(_ucADC4_Step)
	line	1720
	
l5807:	
;main.c: 1720: ucTimerCntMoreFlag = 0;
	bsf	status, 5	;RP0=1, select bank1
	clrf	(main@ucTimerCntMoreFlag)^080h
	line	1722
	
l5809:	
;main.c: 1722: ucPrefix2Step = 0;
	clrf	(main@ucPrefix2Step)^080h
	goto	l5843
	line	1631
	
l5813:	
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
	goto	l5749
	xorlw	1^0	; case 1
	skipnz
	goto	l5757
	xorlw	2^1	; case 2
	skipnz
	goto	l5769
	xorlw	3^2	; case 3
	skipnz
	goto	l5775
	xorlw	4^3	; case 4
	skipnz
	goto	l5783
	goto	l5843
	opt asmopt_on

	line	1729
	
l1003:	
	line	1730
;main.c: 1730: }
	goto	l5843
	line	1731
	
l5815:	
;main.c: 1731: else if( ucTimerCntMoreFlag )
	movf	(main@ucTimerCntMoreFlag)^080h,w
	skipz
	goto	u3030
	goto	l5843
u3030:
	line	1736
	
l5817:	
;main.c: 1732: {
;main.c: 1733: static unsigned char ucMoreThanP8sCnt = 0;
;main.c: 1735: static unsigned char ucLessThanP8sCnt = 0;
;main.c: 1736: if((getAdOriginalCh6Value() < 50))
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
	goto	l5823
u3040:
	line	1738
	
l5819:	
;main.c: 1737: {
;main.c: 1738: ucLessThanP8sCnt++;
	bsf	status, 5	;RP0=1, select bank1
	incf	(main@ucLessThanP8sCnt)^080h,f
	line	1739
	
l5821:	
;main.c: 1739: ucMoreThanP8sCnt = 0;
	clrf	(main@ucMoreThanP8sCnt)^080h
	line	1740
;main.c: 1740: }
	goto	l5827
	line	1743
	
l5823:	
;main.c: 1741: else
;main.c: 1742: {
;main.c: 1743: ucMoreThanP8sCnt++;
	bsf	status, 5	;RP0=1, select bank1
	incf	(main@ucMoreThanP8sCnt)^080h,f
	line	1744
	
l5825:	
;main.c: 1744: ucLessThanP8sCnt = 0;
	clrf	(main@ucLessThanP8sCnt)^080h
	line	1747
	
l5827:	
;main.c: 1745: }
;main.c: 1747: if( ucLessThanP8sCnt >= 8)
	movlw	(08h)
	subwf	(main@ucLessThanP8sCnt)^080h,w
	skipc
	goto	u3051
	goto	u3050
u3051:
	goto	l5833
u3050:
	line	1749
	
l5829:	
;main.c: 1748: {
;main.c: 1749: ucLessThanP8sCnt = 0;
	clrf	(main@ucLessThanP8sCnt)^080h
	line	1750
;main.c: 1750: ucMoreThanP8sCnt = 0;
	clrf	(main@ucMoreThanP8sCnt)^080h
	line	1752
	
l5831:	
;main.c: 1752: enumMainLoopStep = MAIN_LOOP_STEP_FIRST;
	bcf	status, 5	;RP0=0, select bank0
	clrf	(_enumMainLoopStep)
	incf	(_enumMainLoopStep),f
	line	1753
;main.c: 1753: ucADC4_Step = ADC4_STEP_INIT;
	clrf	(_ucADC4_Step)
	line	1754
;main.c: 1754: ucTimerCntMoreFlag = 0;
	bsf	status, 5	;RP0=1, select bank1
	clrf	(main@ucTimerCntMoreFlag)^080h
	line	1756
;main.c: 1755: ;
;main.c: 1756: }
	goto	l5843
	line	1757
	
l5833:	
;main.c: 1757: else if( ucMoreThanP8sCnt >= 8 )
	movlw	(08h)
	subwf	(main@ucMoreThanP8sCnt)^080h,w
	skipc
	goto	u3061
	goto	u3060
u3061:
	goto	l1003
u3060:
	line	1759
	
l5835:	
;main.c: 1758: {
;main.c: 1759: ucLessThanP8sCnt = 0;
	clrf	(main@ucLessThanP8sCnt)^080h
	line	1760
;main.c: 1760: ucMoreThanP8sCnt = 0;
	clrf	(main@ucMoreThanP8sCnt)^080h
	line	1762
	
l5837:	
;main.c: 1762: enumMainLoopStep = MAIN_LOOP_STEP_THIRD;
	movlw	(03h)
	bcf	status, 5	;RP0=0, select bank0
	movwf	(_enumMainLoopStep)
	line	1763
	
l5839:	
;main.c: 1763: ucADC4_Step = ADC4_STEP_INIT;
	clrf	(_ucADC4_Step)
	line	1764
	
l5841:	
;main.c: 1764: ucTimerCntMoreFlag = 0;
	bsf	status, 5	;RP0=1, select bank1
	clrf	(main@ucTimerCntMoreFlag)^080h
	line	1775
;main.c: 1765: ;
;main.c: 1766: }
	
l5843:	
;main.c: 1773: }
;main.c: 1775: if(ADC4_STEP_INIT == ucADC4_Step)
	bcf	status, 5	;RP0=0, select bank0
	movf	(_ucADC4_Step),f
	skipz
	goto	u3071
	goto	u3070
u3071:
	goto	l772
u3070:
	line	1777
	
l5845:	
;main.c: 1776: {
;main.c: 1777: ucTimerCntMore = 0;
	clrf	(main@ucTimerCntMore)
	line	1778
;main.c: 1778: ucTimerCntLess = 0;
	bsf	status, 5	;RP0=1, select bank1
	clrf	(main@ucTimerCntLess)^080h
	line	1779
;main.c: 1779: ucTimerCntMoreFlag = 0;
	clrf	(main@ucTimerCntMoreFlag)^080h
	line	1780
;main.c: 1780: ucTimerCntLessFlag = 0;
	clrf	(main@ucTimerCntLessFlag)^080h
	goto	l5259
	line	1792
	
l5847:	
;main.c: 1788: {
;main.c: 1792: clearTwentySecondsTimer();
	fcall	_clearTwentySecondsTimer
	line	1794
	
l5849:	
;main.c: 1794: setPA3(0);
	movlw	(0)
	fcall	_setPA3
	line	1795
	
l5851:	
;main.c: 1795: setPB4(0);
	movlw	(0)
	fcall	_setPB4
	line	1796
	
l5853:	
;main.c: 1796: setPB6(1);
	movlw	(01h)
	fcall	_setPB6
	line	1798
;main.c: 1798: ucADC4_Step = ADC4_STEP_FOURTH_PREFIX4;
	movlw	(07h)
	movwf	(_ucADC4_Step)
	line	1799
;main.c: 1799: break;
	goto	l5259
	line	1812
	
l5855:	
;main.c: 1805: {
;main.c: 1810: static unsigned char ucDelayPrefix4TimerP5s;
;main.c: 1812: ucDelayPrefix4TimerP5s++;
	bsf	status, 5	;RP0=1, select bank1
	incf	(main@ucDelayPrefix4TimerP5s)^080h,f
	line	1814
	
l5857:	
;main.c: 1814: if( ucDelayPrefix4TimerP5s >= 10)
	movlw	(0Ah)
	subwf	(main@ucDelayPrefix4TimerP5s)^080h,w
	skipc
	goto	u3081
	goto	u3080
u3081:
	goto	l772
u3080:
	line	1816
	
l5859:	
;main.c: 1815: {
;main.c: 1816: ucDelayPrefix4TimerP5s = 0;
	clrf	(main@ucDelayPrefix4TimerP5s)^080h
	line	1818
	
l5861:	
;main.c: 1818: ucADC4_Step = ADC4_STEP_FOURTH_PREFIX5;
	movlw	(08h)
	bcf	status, 5	;RP0=0, select bank0
	movwf	(_ucADC4_Step)
	goto	l5259
	line	1825
	
l5863:	
;main.c: 1824: {
;main.c: 1825: setPA3(1);
	movlw	(01h)
	fcall	_setPA3
	line	1826
;main.c: 1826: setPB4(1);
	movlw	(01h)
	fcall	_setPB4
	line	1828
	
l5865:	
;main.c: 1828: setPB6AsInput();
	fcall	_setPB6AsInput
	line	1829
;main.c: 1829: ucADC4_Step = ADC4_STEP_FOURTH_PREFIX6;
	movlw	(09h)
	bcf	status, 5	;RP0=0, select bank0
	movwf	(_ucADC4_Step)
	line	1831
;main.c: 1831: break;
	goto	l5259
	line	1839
	
l5867:	
;main.c: 1836: {
;main.c: 1837: static unsigned char ucDelayPrefix6TimerP2s;
;main.c: 1839: ucDelayPrefix6TimerP2s++;
	bsf	status, 5	;RP0=1, select bank1
	incf	(main@ucDelayPrefix6TimerP2s)^080h,f
	line	1841
	
l5869:	
;main.c: 1841: if( ucDelayPrefix6TimerP2s >= 2)
	movlw	(02h)
	subwf	(main@ucDelayPrefix6TimerP2s)^080h,w
	skipc
	goto	u3091
	goto	u3090
u3091:
	goto	l772
u3090:
	line	1843
	
l5871:	
;main.c: 1842: {
;main.c: 1843: ucDelayPrefix6TimerP2s = 0;
	clrf	(main@ucDelayPrefix6TimerP2s)^080h
	line	1845
;main.c: 1845: ucADC4_Step = ADC4_STEP_INIT;
	bcf	status, 5	;RP0=0, select bank0
	clrf	(_ucADC4_Step)
	goto	l5311
	line	1903
	
l5875:	
;main.c: 1897: {
;main.c: 1901: static unsigned char ucFourthSuffix1TimerP3s = 0;
;main.c: 1903: ucFourthSuffix1TimerP3s++;
	bsf	status, 5	;RP0=1, select bank1
	incf	(main@ucFourthSuffix1TimerP3s)^080h,f
	line	1905
	
l5877:	
;main.c: 1905: if( ucFourthSuffix1TimerP3s > 3)
	movlw	(04h)
	subwf	(main@ucFourthSuffix1TimerP3s)^080h,w
	skipc
	goto	u3101
	goto	u3100
u3101:
	goto	l772
u3100:
	line	1907
	
l5879:	
;main.c: 1906: {
;main.c: 1907: ucFourthSuffix1TimerP3s = 0;
	clrf	(main@ucFourthSuffix1TimerP3s)^080h
	line	1908
	
l5881:	
;main.c: 1908: ucADC4_Step = ADC4_STEP_FOURTH_SUFFIX2;
	movlw	(0Ch)
	bcf	status, 5	;RP0=0, select bank0
	movwf	(_ucADC4_Step)
	goto	l5259
	line	1920
	
l5883:	
;main.c: 1915: {
;main.c: 1920: setPA6(0);
	movlw	(0)
	fcall	_setPA6
	line	1922
	
l5885:	
;main.c: 1922: clearPinPortAndTimer();
	fcall	_clearPinPortAndTimer
	line	1923
	
l5887:	
;main.c: 1923: ucADC4_Step = ADC4_STEP_INIT;
	clrf	(_ucADC4_Step)
	line	1925
	
l5889:	
;main.c: 1925: enumMainLoopStep = MAIN_LOOP_STEP_FIRST;
	clrf	(_enumMainLoopStep)
	incf	(_enumMainLoopStep),f
	line	1926
;main.c: 1926: break;
	goto	l5259
	line	940
	
l5893:	
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
movlw high(S6297)
movwf pclath
	clrc
	rlf fsr,w
	addlw low(S6297)
	movwf pc
psect	swtext4,local,class=CONST,delta=2
global __pswtext4
__pswtext4:
S6297:
	ljmp	l813
	ljmp	l5365
	ljmp	l5687
	ljmp	l5689
	ljmp	l5721
	ljmp	l5727
	ljmp	l5847
	ljmp	l5855
	ljmp	l5863
	ljmp	l5867
	ljmp	l772
	ljmp	l5875
	ljmp	l5883
psect	maintext

	line	1953
;main.c: 1952: {
;main.c: 1953: case HOUR_3_BRANCH_STEP_FIRST:
	
l1059:	
	line	1956
;main.c: 1954: {
;main.c: 1956: PB7 = 1;
	bcf	status, 5	;RP0=0, select bank0
	bsf	(55/8),(55)&7
	line	1957
;main.c: 1957: PBOD7 = 1;
	bsf	status, 5	;RP0=1, select bank3
	bsf	status, 6	;RP1=1, select bank3
	bsf	(3143/8)^0180h,(3143)&7
	line	1962
	
l5895:	
;main.c: 1962: startThreeHoursTimer(10800);
	movlw	low(02A30h)
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	movwf	(?_startThreeHoursTimer)
	movlw	high(02A30h)
	movwf	((?_startThreeHoursTimer))+1
	fcall	_startThreeHoursTimer
	line	1966
;main.c: 1966: setPA0(1);
	movlw	(01h)
	fcall	_setPA0
	line	1968
;main.c: 1968: setPA1(1);
	movlw	(01h)
	fcall	_setPA1
	line	1970
;main.c: 1970: setPB0(1);
	movlw	(01h)
	fcall	_setPB0
	line	1972
;main.c: 1972: setPB1(1);
	movlw	(01h)
	fcall	_setPB1
	line	1974
;main.c: 1974: setPB2(1);
	movlw	(01h)
	fcall	_setPB2
	line	1976
;main.c: 1976: setPB4(0);
	movlw	(0)
	fcall	_setPB4
	line	1978
	
l5897:	
;main.c: 1978: enumBranchStep = HOUR_3_BRANCH_STEP_SECOND;
	bsf	status, 5	;RP0=1, select bank1
	clrf	(main@enumBranchStep)^080h
	incf	(main@enumBranchStep)^080h,f
	line	1979
;main.c: 1979: break;
	goto	l5259
	line	1988
	
l5899:	
;main.c: 1983: {
;main.c: 1988: enumBranchStep = HOUR_3_BRANCH_STEP_THIRD;
	movlw	(02h)
	movwf	(main@enumBranchStep)^080h
	line	1989
;main.c: 1989: break;
	goto	l5259
	line	1997
	
l5901:	
;main.c: 1993: {
;main.c: 1997: if( (isFinishedTwelveHoursTimer()) || (isFinishedThreeHoursTimer()))
	fcall	_isFinishedTwelveHoursTimer
	iorlw	0
	skipz
	goto	u3111
	goto	u3110
u3111:
	goto	l5905
u3110:
	
l5903:	
	fcall	_isFinishedThreeHoursTimer
	xorlw	0
	skipnz
	goto	u3121
	goto	u3120
u3121:
	goto	l5909
u3120:
	line	1999
	
l5905:	
;main.c: 1998: {
;main.c: 1999: enumBranchStep = HOUR_3_BRANCH_STEP_FIRST;
	bsf	status, 5	;RP0=1, select bank1
	clrf	(main@enumBranchStep)^080h
	goto	l5279
	line	2008
	
l5909:	
;main.c: 2002: else
;main.c: 2003: {
;main.c: 2004: static unsigned char ucTimerX1P5s = 0;
;main.c: 2006: static unsigned char ucTimerLessX1P5s = 0;
;main.c: 2008: if(getAdOriginalCh6Value() <= 85)
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
	goto	l5915
u3130:
	line	2010
	
l5911:	
;main.c: 2009: {
;main.c: 2010: ucTimerX1P5s = 0;
	bsf	status, 5	;RP0=1, select bank1
	clrf	(main@ucTimerX1P5s)^080h
	line	2011
	
l5913:	
;main.c: 2011: ucTimerLessX1P5s++;
	incf	(main@ucTimerLessX1P5s)^080h,f
	line	2012
;main.c: 2012: }
	goto	l5919
	line	2015
	
l5915:	
;main.c: 2013: else
;main.c: 2014: {
;main.c: 2015: ucTimerX1P5s++;
	bsf	status, 5	;RP0=1, select bank1
	incf	(main@ucTimerX1P5s)^080h,f
	line	2016
	
l5917:	
;main.c: 2016: ucTimerLessX1P5s = 0;
	clrf	(main@ucTimerLessX1P5s)^080h
	line	2019
	
l5919:	
;main.c: 2017: }
;main.c: 2019: if(ucTimerX1P5s >= 5)
	movlw	(05h)
	subwf	(main@ucTimerX1P5s)^080h,w
	skipc
	goto	u3141
	goto	u3140
u3141:
	goto	l5933
u3140:
	line	2021
	
l5921:	
;main.c: 2020: {
;main.c: 2021: ucTimerX1P5s = 0;
	clrf	(main@ucTimerX1P5s)^080h
	line	2023
;main.c: 2023: ucTimerLessX1P5s = 0;
	clrf	(main@ucTimerLessX1P5s)^080h
	line	2027
	
l5923:	
;main.c: 2027: PBOD7 = 0;
	bsf	status, 6	;RP1=1, select bank3
	bcf	(3143/8)^0180h,(3143)&7
	line	2028
	
l5925:	
;main.c: 2028: PB7 = 0;
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	bcf	(55/8),(55)&7
	line	2033
	
l5927:	
;main.c: 2033: clearThreeHoursTimer();
	fcall	_clearThreeHoursTimer
	line	2035
	
l5929:	
;main.c: 2035: enumBranchStep = HOUR_3_BRANCH_STEP_FIRST;
	bsf	status, 5	;RP0=1, select bank1
	clrf	(main@enumBranchStep)^080h
	line	2037
	
l5931:	
;main.c: 2037: enumMainLoopStep = MAIN_LOOP_STEP_SECOND;
	movlw	(02h)
	bcf	status, 5	;RP0=0, select bank0
	movwf	(_enumMainLoopStep)
	line	2038
;main.c: 2038: }
	goto	l5259
	line	2039
	
l5933:	
;main.c: 2039: else if(ucTimerLessX1P5s >= 5)
	movlw	(05h)
	subwf	(main@ucTimerLessX1P5s)^080h,w
	skipc
	goto	u3151
	goto	u3150
u3151:
	goto	l772
u3150:
	line	2045
	
l5935:	
;main.c: 2040: {
;main.c: 2041: static unsigned char ucTimerX2P5s = 0;
;main.c: 2043: static unsigned char ucTimerLessX2P5s = 0;
;main.c: 2045: if(getAdOriginalCh6Value() > 20)
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
	goto	l5941
u3160:
	line	2047
	
l5937:	
;main.c: 2046: {
;main.c: 2047: ucTimerX2P5s++;
	bsf	status, 5	;RP0=1, select bank1
	incf	(main@ucTimerX2P5s)^080h,f
	line	2048
	
l5939:	
;main.c: 2048: ucTimerLessX2P5s = 0;
	clrf	(main@ucTimerLessX2P5s)^080h
	line	2049
;main.c: 2049: }
	goto	l5945
	line	2052
	
l5941:	
;main.c: 2050: else
;main.c: 2051: {
;main.c: 2052: ucTimerX2P5s = 0;
	bsf	status, 5	;RP0=1, select bank1
	clrf	(main@ucTimerX2P5s)^080h
	line	2053
	
l5943:	
;main.c: 2053: ucTimerLessX2P5s++;
	incf	(main@ucTimerLessX2P5s)^080h,f
	line	2056
	
l5945:	
;main.c: 2054: }
;main.c: 2056: if(ucTimerX2P5s >= 5)
	movlw	(05h)
	subwf	(main@ucTimerX2P5s)^080h,w
	skipc
	goto	u3171
	goto	u3170
u3171:
	goto	l5949
u3170:
	line	2058
	
l5947:	
;main.c: 2057: {
;main.c: 2058: ucTimerX2P5s = 0;
	clrf	(main@ucTimerX2P5s)^080h
	line	2059
;main.c: 2059: }
	goto	l5259
	line	2060
	
l5949:	
;main.c: 2060: else if(ucTimerLessX2P5s >= 5)
	movlw	(05h)
	subwf	(main@ucTimerLessX2P5s)^080h,w
	skipc
	goto	u3181
	goto	u3180
u3181:
	goto	l772
u3180:
	line	2062
	
l5951:	
;main.c: 2061: {
;main.c: 2062: clearParaFunction1();
	fcall	_clearParaFunction1
	line	2063
	
l5953:	
;main.c: 2063: enumMainLoopStep = MAIN_LOOP_STEP_FIRST;
	clrf	(_enumMainLoopStep)
	incf	(_enumMainLoopStep),f
	line	2064
	
l5955:	
;main.c: 2064: enumBranchStep = HOUR_3_BRANCH_STEP_FIRST;
	bsf	status, 5	;RP0=1, select bank1
	clrf	(main@enumBranchStep)^080h
	line	2066
	
l5957:	
;main.c: 2066: ucTimerLessX2P5s = 0;
	clrf	(main@ucTimerLessX2P5s)^080h
	goto	l5947
	line	1951
	
l5963:	
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
	goto	l5899
	xorlw	2^1	; case 2
	skipnz
	goto	l5901
	goto	l772
	opt asmopt_on

	line	2115
	
l5965:	
;main.c: 2110: {
;main.c: 2115: setPA2(0);
	movlw	(0)
	fcall	_setPA2
	line	2116
;main.c: 2116: setPA1(0);
	movlw	(0)
	fcall	_setPA1
	line	2117
;main.c: 2117: setPA0(0);
	movlw	(0)
	fcall	_setPA0
	line	2118
;main.c: 2118: setPB0(0);
	movlw	(0)
	fcall	_setPB0
	line	2119
;main.c: 2119: setPB1(0);
	movlw	(0)
	fcall	_setPB1
	line	2120
;main.c: 2120: setPB2(0);
	movlw	(0)
	fcall	_setPB2
	line	2121
;main.c: 2121: setPA3(0);
	movlw	(0)
	fcall	_setPA3
	line	2122
;main.c: 2122: setPB4(0);
	movlw	(0)
	fcall	_setPB4
	line	2124
	
l5967:	
;main.c: 2124: enumInteralStep = INTERNAL_SECOND_STEP;
	bsf	status, 5	;RP0=1, select bank1
	clrf	(main@enumInteralStep)^080h
	incf	(main@enumInteralStep)^080h,f
	line	2125
;main.c: 2125: break;
	goto	l5259
	line	2135
	
l5969:	
;main.c: 2129: {
;main.c: 2133: static unsigned char ucTimer1s = 0;
;main.c: 2135: if(getAdOriginalCh0Value() >= 2500)
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
	goto	l5973
u3190:
	line	2137
	
l5971:	
;main.c: 2136: {
;main.c: 2137: ucTimer1s++;
	bsf	status, 5	;RP0=1, select bank1
	incf	(main@ucTimer1s)^080h,f
	line	2138
;main.c: 2138: }
	goto	l5975
	line	2140
	
l5973:	
;main.c: 2139: else
;main.c: 2140: ucTimer1s = 0;
	bsf	status, 5	;RP0=1, select bank1
	clrf	(main@ucTimer1s)^080h
	line	2142
	
l5975:	
;main.c: 2142: if(ucTimer1s >= 10)
	movlw	(0Ah)
	subwf	(main@ucTimer1s)^080h,w
	skipc
	goto	u3201
	goto	u3200
u3201:
	goto	l772
u3200:
	line	2144
	
l5977:	
;main.c: 2143: {
;main.c: 2144: enumInteralStep = INTERNAL_THIRD_STEP;
	movlw	(02h)
	movwf	(main@enumInteralStep)^080h
	line	2145
	
l5979:	
;main.c: 2145: ucTimer1s = 0;
	clrf	(main@ucTimer1s)^080h
	goto	l5259
	line	2157
	
l5981:	
;main.c: 2151: {
;main.c: 2155: static unsigned char ucTimerP3s = 0;
;main.c: 2157: if(getAdOriginalCh0Value() <= 1950)
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
	goto	l5985
u3210:
	line	2159
	
l5983:	
;main.c: 2158: {
;main.c: 2159: ucTimerP3s++;
	bsf	status, 5	;RP0=1, select bank1
	incf	(main@ucTimerP3s)^080h,f
	line	2160
;main.c: 2160: }
	goto	l5987
	line	2162
	
l5985:	
;main.c: 2161: else
;main.c: 2162: ucTimerP3s = 0;
	bsf	status, 5	;RP0=1, select bank1
	clrf	(main@ucTimerP3s)^080h
	line	2164
	
l5987:	
;main.c: 2164: if(ucTimerP3s >= 3)
	movlw	(03h)
	subwf	(main@ucTimerP3s)^080h,w
	skipc
	goto	u3221
	goto	u3220
u3221:
	goto	l772
u3220:
	line	2166
	
l5989:	
;main.c: 2165: {
;main.c: 2166: enumInteralStep = INTERNAL_FIRST_STEP;
	clrf	(main@enumInteralStep)^080h
	line	2167
;main.c: 2167: ucTimerP3s = 0;
	clrf	(main@ucTimerP3s)^080h
	line	2169
	
l5991:	
;main.c: 2169: clearAllTimer();
	fcall	_clearAllTimer
	line	2171
	
l5993:	
;main.c: 2171: initPin();
	fcall	_initPin
	line	2174
;main.c: 2174: enumMainLoopStep = MAIN_LOOP_STEP_INIT;
	bcf	status, 5	;RP0=0, select bank0
	clrf	(_enumMainLoopStep)
	line	2176
	
l1107:	
	goto	l1107
	line	2107
	
l5997:	
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
	goto	l5965
	xorlw	1^0	; case 1
	skipnz
	goto	l5969
	xorlw	2^1	; case 2
	skipnz
	goto	l5981
	goto	l772
	opt asmopt_on

	line	748
	
l6001:	
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
	goto	l5265
	xorlw	1^0	; case 1
	skipnz
	goto	l5281
	xorlw	2^1	; case 2
	skipnz
	goto	l5301
	xorlw	3^2	; case 3
	skipnz
	goto	l5313
	xorlw	4^3	; case 4
	skipnz
	goto	l5351
	xorlw	5^4	; case 5
	skipnz
	goto	l5357
	xorlw	8^5	; case 8
	skipnz
	goto	l5963
	xorlw	9^8	; case 9
	skipnz
	goto	l5997
	goto	l772
	opt asmopt_on

	global	start
	ljmp	start
	opt stack 0
psect	maintext
	line	2201
GLOBAL	__end_of_main
	__end_of_main:
;; =============== function _main ends ============

	signat	_main,88
	global	_call_ADC4_STEP_FOURTH_PREFIX2
psect	text987,local,class=CODE,delta=2
global __ptext987
__ptext987:

;; *************** function _call_ADC4_STEP_FOURTH_PREFIX2 *****************
;; Defined at:
;;		line 2205 in file "C:\temp\dev\AK7030-OTP\main.c"
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
psect	text987
	file	"C:\temp\dev\AK7030-OTP\main.c"
	line	2205
	global	__size_of_call_ADC4_STEP_FOURTH_PREFIX2
	__size_of_call_ADC4_STEP_FOURTH_PREFIX2	equ	__end_of_call_ADC4_STEP_FOURTH_PREFIX2-_call_ADC4_STEP_FOURTH_PREFIX2
	
_call_ADC4_STEP_FOURTH_PREFIX2:	
	opt	stack 3
; Regs used in _call_ADC4_STEP_FOURTH_PREFIX2: [wreg-fsr0h+status,2+status,0+btemp+1+pclath+cstack]
	line	2229
	
l5111:	
;main.c: 2206: enum enum_prefix2_step
;main.c: 2207: {
;main.c: 2208: prefix2_step1 = 0,
;main.c: 2209: prefix2_step2,
;main.c: 2210: prefix2_step3,
;main.c: 2211: prefix2_step4,
;main.c: 2212: prefix2_step5,
;main.c: 2213: prefix2_step6,
;main.c: 2214: prefix2_step7,
;main.c: 2215: prefix2_step8,
;main.c: 2216: prefix2_step9,
;main.c: 2217: };
;main.c: 2223: static unsigned char ucTimerCntMore = 0, ucTimerCntLess = 0;
;main.c: 2225: static unsigned char ucTimerCntMoreFlag = 0, ucTimerCntLessFlag = 0;
;main.c: 2227: static unsigned char ucCompareStep = 0;
	goto	l5235
	line	2233
	
l5113:	
;main.c: 2232: {
;main.c: 2233: if((getAdOriginalCh2Value() > 1950))
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
	goto	l5119
u2200:
	line	2235
	
l5115:	
;main.c: 2234: {
;main.c: 2235: ucTimerCntMore++;
	bsf	status, 5	;RP0=1, select bank1
	incf	(call_ADC4_STEP_FOURTH_PREFIX2@ucTimerCntMore)^080h,f
	line	2236
	
l5117:	
;main.c: 2236: ucTimerCntLess = 0;
	clrf	(call_ADC4_STEP_FOURTH_PREFIX2@ucTimerCntLess)^080h
	line	2237
;main.c: 2237: }
	goto	l5123
	line	2240
	
l5119:	
;main.c: 2238: else
;main.c: 2239: {
;main.c: 2240: ucTimerCntLess++;
	bsf	status, 5	;RP0=1, select bank1
	incf	(call_ADC4_STEP_FOURTH_PREFIX2@ucTimerCntLess)^080h,f
	line	2241
	
l5121:	
;main.c: 2241: ucTimerCntMore = 0;
	clrf	(call_ADC4_STEP_FOURTH_PREFIX2@ucTimerCntMore)^080h
	line	2244
	
l5123:	
;main.c: 2245: {
;main.c: 2246: ucTimerCntMoreFlag = 1;
	movlw	(02h)
	subwf	(call_ADC4_STEP_FOURTH_PREFIX2@ucTimerCntMore)^080h,w
	skipc
	goto	u2211
	goto	u2210
u2211:
	goto	l5127
u2210:
	line	2247
	
l5125:	
;main.c: 2247: ucCompareStep = 1;
	clrf	(call_ADC4_STEP_FOURTH_PREFIX2@ucCompareStep)^080h
	incf	(call_ADC4_STEP_FOURTH_PREFIX2@ucCompareStep)^080h,f
	line	2249
	
l5127:	
;main.c: 2250: {
;main.c: 2251: ucTimerCntLessFlag = 1;
	movlw	(02h)
	subwf	(call_ADC4_STEP_FOURTH_PREFIX2@ucTimerCntLess)^080h,w
	skipc
	goto	u2221
	goto	u2220
u2221:
	goto	l5237
u2220:
	line	2252
	
l5129:	
;main.c: 2252: ucCompareStep = 2;
	movlw	(02h)
	movwf	(call_ADC4_STEP_FOURTH_PREFIX2@ucCompareStep)^080h
	goto	l5237
	line	2264
	
l5131:	
;main.c: 2257: {
;main.c: 2258: static unsigned char ucMoreThanP8sCnt = 0;
;main.c: 2260: static unsigned char ucLessThanP8sCnt = 0;
;main.c: 2262: static unsigned char ucTimerCntN1 = 0;
;main.c: 2264: if((getAdOriginalCh2Value() < 1950))
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
	goto	l5141
u2230:
	line	2266
	
l5133:	
;main.c: 2265: {
;main.c: 2266: ucTimerCntN1++;
	bsf	status, 5	;RP0=1, select bank1
	incf	(call_ADC4_STEP_FOURTH_PREFIX2@ucTimerCntN1)^080h,f
	line	2267
	
l5135:	
;main.c: 2267: if(ucTimerCntN1 >= 2)
	movlw	(02h)
	subwf	(call_ADC4_STEP_FOURTH_PREFIX2@ucTimerCntN1)^080h,w
	skipc
	goto	u2241
	goto	u2240
u2241:
	goto	l5143
u2240:
	line	2269
	
l5137:	
;main.c: 2268: {
;main.c: 2269: ucTimerCntN1 = 0;
	clrf	(call_ADC4_STEP_FOURTH_PREFIX2@ucTimerCntN1)^080h
	line	2270
	
l5139:	
;main.c: 2270: ucCompareStep = 2;
	movlw	(02h)
	movwf	(call_ADC4_STEP_FOURTH_PREFIX2@ucCompareStep)^080h
	goto	l5143
	line	2274
	
l5141:	
;main.c: 2273: else
;main.c: 2274: ucTimerCntN1 = 0;
	bsf	status, 5	;RP0=1, select bank1
	clrf	(call_ADC4_STEP_FOURTH_PREFIX2@ucTimerCntN1)^080h
	line	2280
	
l5143:	
;main.c: 2280: if((getAdOriginalCh6Value() < 50))
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
	goto	l5153
u2250:
	line	2282
	
l5145:	
;main.c: 2281: {
;main.c: 2282: ucLessThanP8sCnt++;
	bsf	status, 5	;RP0=1, select bank1
	incf	(call_ADC4_STEP_FOURTH_PREFIX2@ucLessThanP8sCnt)^080h,f
	line	2283
	
l5147:	
;main.c: 2283: ucMoreThanP8sCnt = 0;
	clrf	(call_ADC4_STEP_FOURTH_PREFIX2@ucMoreThanP8sCnt)^080h
	line	2285
	
l5149:	
;main.c: 2285: ucLessThanP8sCnt = 0;
	clrf	(call_ADC4_STEP_FOURTH_PREFIX2@ucLessThanP8sCnt)^080h
	line	2286
;main.c: 2286: break;
	goto	l5237
	line	2290
	
l5153:	
;main.c: 2288: else
;main.c: 2289: {
;main.c: 2290: ucMoreThanP8sCnt++;
	bsf	status, 5	;RP0=1, select bank1
	incf	(call_ADC4_STEP_FOURTH_PREFIX2@ucMoreThanP8sCnt)^080h,f
	line	2291
	
l5155:	
;main.c: 2291: ucLessThanP8sCnt = 0;
	clrf	(call_ADC4_STEP_FOURTH_PREFIX2@ucLessThanP8sCnt)^080h
	line	2304
	
l5163:	
;main.c: 2304: else if( ucMoreThanP8sCnt >= 8 )
	movlw	(08h)
	subwf	(call_ADC4_STEP_FOURTH_PREFIX2@ucMoreThanP8sCnt)^080h,w
	skipc
	goto	u2261
	goto	u2260
u2261:
	goto	l5237
u2260:
	line	2306
	
l5165:	
;main.c: 2305: {
;main.c: 2306: ucLessThanP8sCnt = 0;
	clrf	(call_ADC4_STEP_FOURTH_PREFIX2@ucLessThanP8sCnt)^080h
	line	2307
;main.c: 2307: ucMoreThanP8sCnt = 0;
	clrf	(call_ADC4_STEP_FOURTH_PREFIX2@ucMoreThanP8sCnt)^080h
	line	2309
	
l5167:	
;main.c: 2309: enumMainLoopStep = MAIN_LOOP_STEP_THIRD;
	movlw	(03h)
	bcf	status, 5	;RP0=0, select bank0
	movwf	(_enumMainLoopStep)
	line	2310
	
l5169:	
;main.c: 2311: ucTimerCntMoreFlag = 0;
	clrf	(_ucADC4_Step)
	line	2313
;main.c: 2312: ;
;main.c: 2313: }
	goto	l5237
	line	2333
	
l5171:	
;main.c: 2329: {
;main.c: 2333: ucTimeCntP2s = 0;
	clrf	(call_ADC4_STEP_FOURTH_PREFIX2@ucTimeCntP2s)^080h
	line	2334
	
l5173:	
;main.c: 2334: setPA3(0);
	movlw	(0)
	fcall	_setPA3
	line	2335
	
l5175:	
;main.c: 2335: setPB6(0);
	movlw	(0)
	fcall	_setPB6
	line	2336
	
l5177:	
;main.c: 2336: ucPrefix2Step = prefix2_step2;
	bsf	status, 5	;RP0=1, select bank1
	clrf	(call_ADC4_STEP_FOURTH_PREFIX2@ucPrefix2Step)^080h
	incf	(call_ADC4_STEP_FOURTH_PREFIX2@ucPrefix2Step)^080h,f
	line	2337
;main.c: 2337: break;
	goto	l5237
	line	2345
	
l5179:	
;main.c: 2341: {
;main.c: 2345: if((getAdOriginalCh2Value() > 2300))
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
	goto	l5183
u2270:
	line	2347
	
l5181:	
;main.c: 2346: {
;main.c: 2347: ucTimeCntP2s++;
	bsf	status, 5	;RP0=1, select bank1
	incf	(call_ADC4_STEP_FOURTH_PREFIX2@ucTimeCntP2s)^080h,f
	line	2348
;main.c: 2348: }
	goto	l5185
	line	2350
	
l5183:	
;main.c: 2349: else
;main.c: 2350: ucTimeCntP2s = 0;
	bsf	status, 5	;RP0=1, select bank1
	clrf	(call_ADC4_STEP_FOURTH_PREFIX2@ucTimeCntP2s)^080h
	line	2352
	
l5185:	
;main.c: 2352: if( ucTimeCntP2s >= 2)
	movlw	(02h)
	subwf	(call_ADC4_STEP_FOURTH_PREFIX2@ucTimeCntP2s)^080h,w
	skipc
	goto	u2281
	goto	u2280
u2281:
	goto	l5237
u2280:
	line	2354
	
l5187:	
;main.c: 2353: {
;main.c: 2354: ucTimeCntP2s = 0;
	clrf	(call_ADC4_STEP_FOURTH_PREFIX2@ucTimeCntP2s)^080h
	line	2355
	
l5189:	
;main.c: 2355: ucPrefix2Step = prefix2_step3;
	movlw	(02h)
	movwf	(call_ADC4_STEP_FOURTH_PREFIX2@ucPrefix2Step)^080h
	goto	l5237
	line	2367
	
l5191:	
;main.c: 2363: {
;main.c: 2367: setPA3(1);
	movlw	(01h)
	fcall	_setPA3
	line	2369
	
l5193:	
;main.c: 2369: setPB6AsInput();
	fcall	_setPB6AsInput
	line	2370
;main.c: 2370: ucPrefix2Step = prefix2_step4;
	movlw	(03h)
	movwf	(call_ADC4_STEP_FOURTH_PREFIX2@ucPrefix2Step)^080h
	line	2371
;main.c: 2371: break;
	goto	l5237
	line	2380
	
l5195:	
;main.c: 2375: {
;main.c: 2379: static unsigned char ucTimerCntP5s = 0;
;main.c: 2380: if( ucTimerCntP5s < 5)
	movlw	(05h)
	subwf	(call_ADC4_STEP_FOURTH_PREFIX2@ucTimerCntP5s)^080h,w
	skipnc
	goto	u2291
	goto	u2290
u2291:
	goto	l5199
u2290:
	line	2381
	
l5197:	
;main.c: 2381: ucTimerCntP5s++;
	incf	(call_ADC4_STEP_FOURTH_PREFIX2@ucTimerCntP5s)^080h,f
	goto	l5237
	line	2384
	
l5199:	
;main.c: 2382: else
;main.c: 2383: {
;main.c: 2384: ucTimerCntP5s = 0;
	clrf	(call_ADC4_STEP_FOURTH_PREFIX2@ucTimerCntP5s)^080h
	line	2385
	
l5201:	
;main.c: 2385: ucPrefix2Step = prefix2_step5;
	movlw	(04h)
	movwf	(call_ADC4_STEP_FOURTH_PREFIX2@ucPrefix2Step)^080h
	goto	l5237
	line	2399
	
l5203:	
;main.c: 2392: {
;main.c: 2396: static unsigned char ucMoreThanP3sCnt = 0;
;main.c: 2398: static unsigned char ucLessThanP3sCnt = 0;
;main.c: 2399: if((getAdOriginalCh6Value() < 50))
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
	goto	l5209
u2300:
	line	2401
	
l5205:	
;main.c: 2400: {
;main.c: 2401: ucLessThanP3sCnt++;
	bsf	status, 5	;RP0=1, select bank1
	incf	(call_ADC4_STEP_FOURTH_PREFIX2@ucLessThanP3sCnt)^080h,f
	line	2402
	
l5207:	
;main.c: 2402: ucMoreThanP3sCnt = 0;
	clrf	(call_ADC4_STEP_FOURTH_PREFIX2@ucMoreThanP3sCnt)^080h
	line	2403
;main.c: 2403: }
	goto	l5213
	line	2406
	
l5209:	
;main.c: 2404: else
;main.c: 2405: {
;main.c: 2406: ucMoreThanP3sCnt++;
	bsf	status, 5	;RP0=1, select bank1
	incf	(call_ADC4_STEP_FOURTH_PREFIX2@ucMoreThanP3sCnt)^080h,f
	line	2407
	
l5211:	
;main.c: 2407: ucLessThanP3sCnt = 0;
	clrf	(call_ADC4_STEP_FOURTH_PREFIX2@ucLessThanP3sCnt)^080h
	line	2410
	
l5213:	
;main.c: 2408: }
;main.c: 2410: if( ucLessThanP3sCnt >= 3)
	movlw	(03h)
	subwf	(call_ADC4_STEP_FOURTH_PREFIX2@ucLessThanP3sCnt)^080h,w
	skipc
	goto	u2311
	goto	u2310
u2311:
	goto	l5219
u2310:
	line	2412
	
l5215:	
;main.c: 2411: {
;main.c: 2412: ucLessThanP3sCnt = 0;
	clrf	(call_ADC4_STEP_FOURTH_PREFIX2@ucLessThanP3sCnt)^080h
	line	2413
;main.c: 2413: ucMoreThanP3sCnt = 0;
	clrf	(call_ADC4_STEP_FOURTH_PREFIX2@ucMoreThanP3sCnt)^080h
	line	2415
	
l5217:	
;main.c: 2415: enumMainLoopStep = MAIN_LOOP_STEP_FIRST;
	bcf	status, 5	;RP0=0, select bank0
	clrf	(_enumMainLoopStep)
	incf	(_enumMainLoopStep),f
	line	2416
;main.c: 2417: ucTimerCntMoreFlag = 0;
	clrf	(_ucADC4_Step)
	line	2419
;main.c: 2419: ucPrefix2Step = prefix2_step1;
	bsf	status, 5	;RP0=1, select bank1
	clrf	(call_ADC4_STEP_FOURTH_PREFIX2@ucPrefix2Step)^080h
	line	2422
	
l5219:	
;main.c: 2420: }
;main.c: 2422: if(ucMoreThanP3sCnt >= 3)
	movlw	(03h)
	subwf	(call_ADC4_STEP_FOURTH_PREFIX2@ucMoreThanP3sCnt)^080h,w
	skipc
	goto	u2321
	goto	u2320
u2321:
	goto	l5237
u2320:
	line	2424
	
l5221:	
;main.c: 2423: {
;main.c: 2424: ucLessThanP3sCnt = 0;
	clrf	(call_ADC4_STEP_FOURTH_PREFIX2@ucLessThanP3sCnt)^080h
	line	2425
;main.c: 2425: ucMoreThanP3sCnt = 0;
	clrf	(call_ADC4_STEP_FOURTH_PREFIX2@ucMoreThanP3sCnt)^080h
	line	2427
	
l5223:	
;main.c: 2427: enumMainLoopStep = MAIN_LOOP_STEP_THIRD;
	movlw	(03h)
	bcf	status, 5	;RP0=0, select bank0
	movwf	(_enumMainLoopStep)
	line	2428
	
l5225:	
;main.c: 2429: ucTimerCntMoreFlag = 0;
	clrf	(_ucADC4_Step)
	line	2431
	
l5227:	
;main.c: 2431: ucPrefix2Step = prefix2_step1;
	bsf	status, 5	;RP0=1, select bank1
	clrf	(call_ADC4_STEP_FOURTH_PREFIX2@ucPrefix2Step)^080h
	goto	l5237
	line	2326
	
l5231:	
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
	goto	l5171
	xorlw	1^0	; case 1
	skipnz
	goto	l5179
	xorlw	2^1	; case 2
	skipnz
	goto	l5191
	xorlw	3^2	; case 3
	skipnz
	goto	l5195
	xorlw	4^3	; case 4
	skipnz
	goto	l5203
	goto	l5237
	opt asmopt_on

	line	2229
	
l5235:	
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
	goto	l5113
	xorlw	1^0	; case 1
	skipnz
	goto	l5131
	xorlw	2^1	; case 2
	skipnz
	goto	l5231
	goto	l5237
	opt asmopt_on

	line	2631
	
l5237:	
;main.c: 2631: if(ADC4_STEP_INIT == ucADC4_Step)
	bcf	status, 5	;RP0=0, select bank0
	movf	(_ucADC4_Step),f
	skipz
	goto	u2331
	goto	u2330
u2331:
	goto	l1179
u2330:
	line	2633
	
l5239:	
;main.c: 2632: {
;main.c: 2633: ucTimerCntMore = 0;
	bsf	status, 5	;RP0=1, select bank1
	clrf	(call_ADC4_STEP_FOURTH_PREFIX2@ucTimerCntMore)^080h
	line	2634
;main.c: 2636: ucTimerCntLessFlag = 0;
	clrf	(call_ADC4_STEP_FOURTH_PREFIX2@ucTimerCntLess)^080h
	line	2639
	
l1179:	
	return
	opt stack 0
GLOBAL	__end_of_call_ADC4_STEP_FOURTH_PREFIX2
	__end_of_call_ADC4_STEP_FOURTH_PREFIX2:
;; =============== function _call_ADC4_STEP_FOURTH_PREFIX2 ends ============

	signat	_call_ADC4_STEP_FOURTH_PREFIX2,88
	global	_process_AD_Converter_Value
psect	text988,local,class=CODE,delta=2
global __ptext988
__ptext988:

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
psect	text988
	file	"C:\temp\dev\AK7030-OTP\common.c"
	line	298
	global	__size_of_process_AD_Converter_Value
	__size_of_process_AD_Converter_Value	equ	__end_of_process_AD_Converter_Value-_process_AD_Converter_Value
	
_process_AD_Converter_Value:	
	opt	stack 3
; Regs used in _process_AD_Converter_Value: [wreg+status,2+status,0+pclath+cstack]
	line	299
	
l5105:	
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
	
l5107:	
;common.c: 300: {
;common.c: 301: setAD_ConvertFlag(0);
	movlw	(0)
	fcall	_setAD_ConvertFlag
	line	302
;common.c: 302: AD_Sample();
	fcall	_AD_Sample
	line	314
	
l5109:	
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
psect	text989,local,class=CODE,delta=2
global __ptext989
__ptext989:

;; *************** function _clearParaFunction1 *****************
;; Defined at:
;;		line 578 in file "C:\temp\dev\AK7030-OTP\main.c"
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
psect	text989
	file	"C:\temp\dev\AK7030-OTP\main.c"
	line	578
	global	__size_of_clearParaFunction1
	__size_of_clearParaFunction1	equ	__end_of_clearParaFunction1-_clearParaFunction1
	
_clearParaFunction1:	
	opt	stack 3
; Regs used in _clearParaFunction1: [wreg+status,2+status,0+pclath+cstack]
	line	579
	
l5097:	
;main.c: 579: setPA1(0);
	movlw	(0)
	fcall	_setPA1
	line	580
;main.c: 580: setPA0(0);
	movlw	(0)
	fcall	_setPA0
	line	582
;main.c: 582: setPB0(0);
	movlw	(0)
	fcall	_setPB0
	line	583
;main.c: 583: setPB1(0);
	movlw	(0)
	fcall	_setPB1
	line	584
;main.c: 584: setPB2(0);
	movlw	(0)
	fcall	_setPB2
	line	586
	
l5099:	
;main.c: 586: clearAllTimer();
	fcall	_clearAllTimer
	line	588
	
l5101:	
;main.c: 588: setPA3(0);
	movlw	(0)
	fcall	_setPA3
	line	589
	
l5103:	
;main.c: 589: setPB4(0);
	movlw	(0)
	fcall	_setPB4
	line	590
	
l758:	
	return
	opt stack 0
GLOBAL	__end_of_clearParaFunction1
	__end_of_clearParaFunction1:
;; =============== function _clearParaFunction1 ends ============

	signat	_clearParaFunction1,88
	global	_clearPinPortAndTimer
psect	text990,local,class=CODE,delta=2
global __ptext990
__ptext990:

;; *************** function _clearPinPortAndTimer *****************
;; Defined at:
;;		line 108 in file "C:\temp\dev\AK7030-OTP\main.c"
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
psect	text990
	file	"C:\temp\dev\AK7030-OTP\main.c"
	line	108
	global	__size_of_clearPinPortAndTimer
	__size_of_clearPinPortAndTimer	equ	__end_of_clearPinPortAndTimer-_clearPinPortAndTimer
	
_clearPinPortAndTimer:	
	opt	stack 3
; Regs used in _clearPinPortAndTimer: [status,2+status,0+pclath+cstack]
	line	110
	
l5093:	
;main.c: 110: PB0 = 0;
	bcf	(48/8),(48)&7
	line	111
;main.c: 111: PA0 = 0;
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
	line	117
;main.c: 117: PBOD7 = 0;
	bsf	status, 5	;RP0=1, select bank3
	bsf	status, 6	;RP1=1, select bank3
	bcf	(3143/8)^0180h,(3143)&7
	line	118
;main.c: 118: PB7 = 0;
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	bcf	(55/8),(55)&7
	line	119
	
l5095:	
;main.c: 119: clearAllTimer();
	fcall	_clearAllTimer
	line	123
	
l694:	
	return
	opt stack 0
GLOBAL	__end_of_clearPinPortAndTimer
	__end_of_clearPinPortAndTimer:
;; =============== function _clearPinPortAndTimer ends ============

	signat	_clearPinPortAndTimer,88
	global	_AD_Sample
psect	text991,local,class=CODE,delta=2
global __ptext991
__ptext991:

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
psect	text991
	file	"C:\temp\dev\AK7030-OTP\common.c"
	line	328
	global	__size_of_AD_Sample
	__size_of_AD_Sample	equ	__end_of_AD_Sample-_AD_Sample
	
_AD_Sample:	
	opt	stack 3
; Regs used in _AD_Sample: [wreg+status,2+status,0+pclath+cstack]
	line	329
	
l5069:	
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
	
l5071:	
;common.c: 330: {
;common.c: 332: sampleTimes++;
	incf	(_sampleTimes),f
	line	334
	
l5073:	
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
	
l5075:	
;common.c: 335: {
;common.c: 336: sampleTimes = 0;
	clrf	(_sampleTimes)
	line	338
	
l5077:	
;common.c: 338: if(sampleChannelSelect == 0)
	movf	(_sampleChannelSelect),f
	skipz
	goto	u2161
	goto	u2160
u2161:
	goto	l5081
u2160:
	line	342
	
l5079:	
;common.c: 339: {
;common.c: 342: sampleChannelSelect = 2;
	movlw	(02h)
	movwf	(_sampleChannelSelect)
	line	343
;common.c: 343: }
	goto	l5091
	line	344
	
l5081:	
;common.c: 344: else if(sampleChannelSelect == 2)
	movf	(_sampleChannelSelect),w
	xorlw	02h
	skipz
	goto	u2171
	goto	u2170
u2171:
	goto	l5085
u2170:
	line	347
	
l5083:	
;common.c: 345: {
;common.c: 347: sampleChannelSelect = 5;
	movlw	(05h)
	movwf	(_sampleChannelSelect)
	line	348
;common.c: 348: }
	goto	l5091
	line	349
	
l5085:	
;common.c: 349: else if(sampleChannelSelect == 5)
	movf	(_sampleChannelSelect),w
	xorlw	05h
	skipz
	goto	u2181
	goto	u2180
u2181:
	goto	l5089
u2180:
	line	352
	
l5087:	
;common.c: 350: {
;common.c: 352: sampleChannelSelect = 6;
	movlw	(06h)
	movwf	(_sampleChannelSelect)
	line	353
;common.c: 353: }
	goto	l5091
	line	357
	
l5089:	
;common.c: 354: else
;common.c: 355: {
;common.c: 357: sampleChannelSelect = 0;
	clrf	(_sampleChannelSelect)
	line	363
	
l5091:	
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
psect	text992,local,class=CODE,delta=2
global __ptext992
__ptext992:

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
psect	text992
	file	"C:\temp\dev\AK7030-OTP\common.c"
	line	287
	global	__size_of_getAdOriginalCh2Value
	__size_of_getAdOriginalCh2Value	equ	__end_of_getAdOriginalCh2Value-_getAdOriginalCh2Value
	
_getAdOriginalCh2Value:	
	opt	stack 4
; Regs used in _getAdOriginalCh2Value: [wreg-fsr0h+status,2+status,0+btemp+1+pclath+cstack]
	line	289
	
l5065:	
;common.c: 289: return Filter(uiSampleChannelSecond);
	movlw	(_uiSampleChannelSecond&0ffh)
	bcf	status, 5	;RP0=0, select bank0
	movwf	(?_Filter)
	movlw	(0x1/2)
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
psect	text993,local,class=CODE,delta=2
global __ptext993
__ptext993:

;; *************** function _call_ADC4_STEP_FOURTH_PREFIX3 *****************
;; Defined at:
;;		line 2642 in file "C:\temp\dev\AK7030-OTP\main.c"
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
psect	text993
	file	"C:\temp\dev\AK7030-OTP\main.c"
	line	2642
	global	__size_of_call_ADC4_STEP_FOURTH_PREFIX3
	__size_of_call_ADC4_STEP_FOURTH_PREFIX3	equ	__end_of_call_ADC4_STEP_FOURTH_PREFIX3-_call_ADC4_STEP_FOURTH_PREFIX3
	
_call_ADC4_STEP_FOURTH_PREFIX3:	
	opt	stack 4
; Regs used in _call_ADC4_STEP_FOURTH_PREFIX3: [wreg-fsr0h+status,2+status,0+pclath+cstack]
;call_ADC4_STEP_FOURTH_PREFIX3@bClearStep stored from wreg
	line	2647
	bcf	status, 5	;RP0=0, select bank0
	movwf	(call_ADC4_STEP_FOURTH_PREFIX3@bClearStep)
	
l5013:	
;main.c: 2643: static unsigned char ucPreFix3Step = 0;
;main.c: 2645: static unsigned char ucPrefix3Cnt = 0;
;main.c: 2647: if( 1 == bClearStep)
	decf	(call_ADC4_STEP_FOURTH_PREFIX3@bClearStep),w
	skipz
	goto	u2101
	goto	u2100
u2101:
	goto	l5063
u2100:
	line	2649
	
l5015:	
	line	2650
;main.c: 2650: ucPreFix3Step = 0;
	bsf	status, 5	;RP0=1, select bank1
	clrf	(call_ADC4_STEP_FOURTH_PREFIX3@ucPreFix3Step)^080h
	line	2651
;main.c: 2651: ucPrefix3Cnt = 0;
	clrf	(call_ADC4_STEP_FOURTH_PREFIX3@ucPrefix3Cnt)
	goto	l5063
	line	2662
	
l5017:	
;main.c: 2657: {
;main.c: 2662: setPA3(0);
	movlw	(0)
	fcall	_setPA3
	line	2663
;main.c: 2663: setPB4(0);
	movlw	(0)
	fcall	_setPB4
	line	2664
;main.c: 2664: setPB6(1);
	movlw	(01h)
	fcall	_setPB6
	line	2665
	
l5019:	
;main.c: 2665: ucPrefix3Cnt = 0;
	clrf	(call_ADC4_STEP_FOURTH_PREFIX3@ucPrefix3Cnt)
	line	2666
	
l5021:	
;main.c: 2666: ucPreFix3Step = 1;
	bsf	status, 5	;RP0=1, select bank1
	clrf	(call_ADC4_STEP_FOURTH_PREFIX3@ucPreFix3Step)^080h
	incf	(call_ADC4_STEP_FOURTH_PREFIX3@ucPreFix3Step)^080h,f
	line	2667
;main.c: 2667: break;
	goto	l1198
	line	2675
	
l5023:	
;main.c: 2671: {
;main.c: 2675: ucPrefix3Cnt++;
	incf	(call_ADC4_STEP_FOURTH_PREFIX3@ucPrefix3Cnt),f
	line	2677
	
l5025:	
;main.c: 2677: if( ucPrefix3Cnt >= 10)
	movlw	(0Ah)
	subwf	(call_ADC4_STEP_FOURTH_PREFIX3@ucPrefix3Cnt),w
	skipc
	goto	u2111
	goto	u2110
u2111:
	goto	l1198
u2110:
	line	2679
	
l5027:	
;main.c: 2678: {
;main.c: 2679: ucPrefix3Cnt = 0;
	clrf	(call_ADC4_STEP_FOURTH_PREFIX3@ucPrefix3Cnt)
	line	2680
	
l5029:	
;main.c: 2680: ucPreFix3Step = 2;
	movlw	(02h)
	movwf	(call_ADC4_STEP_FOURTH_PREFIX3@ucPreFix3Step)^080h
	goto	l1198
	line	2690
	
l5031:	
;main.c: 2686: {
;main.c: 2690: ucPrefix3Cnt++;
	incf	(call_ADC4_STEP_FOURTH_PREFIX3@ucPrefix3Cnt),f
	line	2692
	
l5033:	
;main.c: 2692: if( ucPrefix3Cnt >= 10)
	movlw	(0Ah)
	subwf	(call_ADC4_STEP_FOURTH_PREFIX3@ucPrefix3Cnt),w
	skipc
	goto	u2121
	goto	u2120
u2121:
	goto	l1198
u2120:
	line	2694
	
l5035:	
;main.c: 2693: {
;main.c: 2694: ucPrefix3Cnt = 0;
	clrf	(call_ADC4_STEP_FOURTH_PREFIX3@ucPrefix3Cnt)
	line	2696
	
l5037:	
;main.c: 2696: ucPreFix3Step = 3;
	movlw	(03h)
	movwf	(call_ADC4_STEP_FOURTH_PREFIX3@ucPreFix3Step)^080h
	goto	l1198
	line	2706
	
l5039:	
;main.c: 2702: {
;main.c: 2706: setPA3(1);
	movlw	(01h)
	fcall	_setPA3
	line	2707
;main.c: 2707: setPB4(1);
	movlw	(01h)
	fcall	_setPB4
	line	2709
	
l5041:	
;main.c: 2709: setPB6AsInput();
	fcall	_setPB6AsInput
	line	2710
	
l5043:	
;main.c: 2710: ucPrefix3Cnt = 0;
	clrf	(call_ADC4_STEP_FOURTH_PREFIX3@ucPrefix3Cnt)
	line	2712
	
l5045:	
;main.c: 2712: ucPreFix3Step = 4;
	movlw	(04h)
	movwf	(call_ADC4_STEP_FOURTH_PREFIX3@ucPreFix3Step)^080h
	line	2713
;main.c: 2713: break;
	goto	l1198
	line	2720
	
l5047:	
;main.c: 2716: {
;main.c: 2720: ucPrefix3Cnt++;
	incf	(call_ADC4_STEP_FOURTH_PREFIX3@ucPrefix3Cnt),f
	line	2722
	
l5049:	
;main.c: 2722: if( ucPrefix3Cnt >= 2)
	movlw	(02h)
	subwf	(call_ADC4_STEP_FOURTH_PREFIX3@ucPrefix3Cnt),w
	skipc
	goto	u2131
	goto	u2130
u2131:
	goto	l1198
u2130:
	line	2724
	
l5051:	
;main.c: 2723: {
;main.c: 2724: clearTwentySecondsTimer();
	fcall	_clearTwentySecondsTimer
	line	2726
	
l5053:	
;main.c: 2726: ucPrefix3Cnt = 0;
	clrf	(call_ADC4_STEP_FOURTH_PREFIX3@ucPrefix3Cnt)
	line	2728
	
l5055:	
;main.c: 2728: ucADC4_Step = ADC4_STEP_INIT;
	clrf	(_ucADC4_Step)
	line	2730
	
l5057:	
;main.c: 2730: enumMainLoopStep = MAIN_LOOP_STEP_THIRD;
	movlw	(03h)
	movwf	(_enumMainLoopStep)
	line	2732
	
l5059:	
;main.c: 2732: ucPreFix3Step = 0;
	bsf	status, 5	;RP0=1, select bank1
	clrf	(call_ADC4_STEP_FOURTH_PREFIX3@ucPreFix3Step)^080h
	goto	l1198
	line	2654
	
l5063:	
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
	goto	l5017
	xorlw	1^0	; case 1
	skipnz
	goto	l5023
	xorlw	2^1	; case 2
	skipnz
	goto	l5031
	xorlw	3^2	; case 3
	skipnz
	goto	l5039
	xorlw	4^3	; case 4
	skipnz
	goto	l5047
	goto	l1198
	opt asmopt_on

	line	2741
	
l1198:	
	return
	opt stack 0
GLOBAL	__end_of_call_ADC4_STEP_FOURTH_PREFIX3
	__end_of_call_ADC4_STEP_FOURTH_PREFIX3:
;; =============== function _call_ADC4_STEP_FOURTH_PREFIX3 ends ============

	signat	_call_ADC4_STEP_FOURTH_PREFIX3,4216
	global	_getAdOriginalCh5Value
psect	text994,local,class=CODE,delta=2
global __ptext994
__ptext994:

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
psect	text994
	file	"C:\temp\dev\AK7030-OTP\common.c"
	line	268
	global	__size_of_getAdOriginalCh5Value
	__size_of_getAdOriginalCh5Value	equ	__end_of_getAdOriginalCh5Value-_getAdOriginalCh5Value
	
_getAdOriginalCh5Value:	
	opt	stack 4
; Regs used in _getAdOriginalCh5Value: [wreg-fsr0h+status,2+status,0+btemp+1+pclath+cstack]
	line	270
	
l5009:	
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
psect	text995,local,class=CODE,delta=2
global __ptext995
__ptext995:

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
psect	text995
	file	"C:\temp\dev\AK7030-OTP\common.c"
	line	278
	global	__size_of_getAdOriginalCh6Value
	__size_of_getAdOriginalCh6Value	equ	__end_of_getAdOriginalCh6Value-_getAdOriginalCh6Value
	
_getAdOriginalCh6Value:	
	opt	stack 3
; Regs used in _getAdOriginalCh6Value: [wreg-fsr0h+status,2+status,0+btemp+1+pclath+cstack]
	line	280
	
l5005:	
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
psect	text996,local,class=CODE,delta=2
global __ptext996
__ptext996:

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
psect	text996
	file	"C:\temp\dev\AK7030-OTP\common.c"
	line	259
	global	__size_of_getAdOriginalCh0Value
	__size_of_getAdOriginalCh0Value	equ	__end_of_getAdOriginalCh0Value-_getAdOriginalCh0Value
	
_getAdOriginalCh0Value:	
	opt	stack 4
; Regs used in _getAdOriginalCh0Value: [wreg-fsr0h+status,2+status,0+btemp+1+pclath+cstack]
	line	261
	
l5001:	
;common.c: 261: return Filter(uiSampleChannelZero);
	movlw	(_uiSampleChannelZero&0ffh)
	bcf	status, 5	;RP0=0, select bank0
	movwf	(?_Filter)
	movlw	(0x3/2)
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
psect	text997,local,class=CODE,delta=2
global __ptext997
__ptext997:

;; *************** function _clearAllTimer *****************
;; Defined at:
;;		line 98 in file "C:\temp\dev\AK7030-OTP\main.c"
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
psect	text997
	file	"C:\temp\dev\AK7030-OTP\main.c"
	line	98
	global	__size_of_clearAllTimer
	__size_of_clearAllTimer	equ	__end_of_clearAllTimer-_clearAllTimer
	
_clearAllTimer:	
	opt	stack 4
; Regs used in _clearAllTimer: [status,2+status,0+pclath+cstack]
	line	99
	
l4999:	
;main.c: 99: clearTwelveHoursTimer();
	fcall	_clearTwelveHoursTimer
	line	100
;main.c: 100: clearThreeHoursTimer();
	fcall	_clearThreeHoursTimer
	line	101
;main.c: 101: clearTwentySecondsTimer();
	fcall	_clearTwentySecondsTimer
	line	102
;main.c: 102: clearTwentyMinuteTimer();
	fcall	_clearTwentyMinuteTimer
	line	103
	
l691:	
	return
	opt stack 0
GLOBAL	__end_of_clearAllTimer
	__end_of_clearAllTimer:
;; =============== function _clearAllTimer ends ============

	signat	_clearAllTimer,88
	global	_setAD_ConvertFlag
psect	text998,local,class=CODE,delta=2
global __ptext998
__ptext998:

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
psect	text998
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
	
l4965:	
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
psect	text999,local,class=CODE,delta=2
global __ptext999
__ptext999:

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
psect	text999
	file	"C:\temp\dev\AK7030-OTP\common.c"
	line	229
	global	__size_of_getAD_ConvertFlag
	__size_of_getAD_ConvertFlag	equ	__end_of_getAD_ConvertFlag-_getAD_ConvertFlag
	
_getAD_ConvertFlag:	
	opt	stack 4
; Regs used in _getAD_ConvertFlag: [wreg]
	line	230
	
l4961:	
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
psect	text1000,local,class=CODE,delta=2
global __ptext1000
__ptext1000:

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
psect	text1000
	file	"C:\temp\dev\AK7030-OTP\common.c"
	line	63
	global	__size_of_Filter
	__size_of_Filter	equ	__end_of_Filter-_Filter
	
_Filter:	
	opt	stack 4
; Regs used in _Filter: [wreg-fsr0h+status,2+status,0+btemp+1]
	line	65
	
l4851:	
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
	
l4857:	
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
	
l4859:	
	movlw	02h
	addwf	(Filter@tmpValue),f
	skipnc
	incf	(Filter@tmpValue+1),f
	line	71
	
l4861:	
	incf	(Filter@cir),f
	skipnz
	incf	(Filter@cir+1),f
	
l4863:	
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
	goto	l4857
u1900:
	line	75
	
l4865:	
;common.c: 75: for(j = 0; j < 12 - 1; j++)
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	clrf	(Filter@j)
	line	77
	
l4871:	
;common.c: 76: {
;common.c: 77: for(i = 0; i < 12 - 1 - j; i++)
	clrf	(Filter@i)
	goto	l4879
	line	79
	
l4873:	
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
	goto	l4877
u1910:
	line	82
	
l4875:	
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
	
l4877:	
	incf	(Filter@i),f
	
l4879:	
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
	goto	l4873
u1920:
	line	75
	
l4881:	
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	incf	(Filter@j),f
	
l4883:	
	movlw	(0Bh)
	subwf	(Filter@j),w
	skipc
	goto	u1931
	goto	u1930
u1931:
	goto	l4871
u1930:
	line	91
	
l4885:	
;common.c: 87: }
;common.c: 88: }
;common.c: 89: }
;common.c: 91: for(i = 2; i < 12 - 2; i++)
	movlw	(02h)
	movwf	(Filter@i)
	line	93
	
l4889:	
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
	
l4891:	
	incf	(Filter@i),f
	
l4893:	
	movlw	(0Ah)
	subwf	(Filter@i),w
	skipc
	goto	u1941
	goto	u1940
u1941:
	goto	l4889
u1940:
	line	96
	
l4895:	
;common.c: 94: }
;common.c: 96: return (filter_sum >> 3);
	movf	(Filter@filter_sum+1),w
	movwf	(?_Filter+1)
	movf	(Filter@filter_sum),w
	movwf	(?_Filter)
	
l4897:	
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
psect	text1001,local,class=CODE,delta=2
global __ptext1001
__ptext1001:

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
psect	text1001
	file	"C:\temp\dev\AK7030-OTP\common.c"
	line	498
	global	__size_of_isFinishedThreeHoursTimer
	__size_of_isFinishedThreeHoursTimer	equ	__end_of_isFinishedThreeHoursTimer-_isFinishedThreeHoursTimer
	
_isFinishedThreeHoursTimer:	
	opt	stack 5
; Regs used in _isFinishedThreeHoursTimer: [wreg+status,2+status,0]
	line	499
	
l4835:	
;common.c: 499: if((uiSmallTimer == 0) && bSmallTimerStartFlag)
	bsf	status, 5	;RP0=1, select bank1
	movf	((_uiSmallTimer+1)^080h),w
	iorwf	((_uiSmallTimer)^080h),w
	skipz
	goto	u1881
	goto	u1880
u1881:
	goto	l4847
u1880:
	
l4837:	
	bcf	status, 5	;RP0=0, select bank0
	movf	(_bSmallTimerStartFlag),w
	skipz
	goto	u1890
	goto	l4847
u1890:
	line	501
	
l4839:	
;common.c: 500: {
;common.c: 501: bSmallTimerStartFlag = 0;
	clrf	(_bSmallTimerStartFlag)
	line	502
	
l4841:	
;common.c: 502: return 1;
	movlw	(01h)
	goto	l2008
	line	505
	
l4847:	
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
psect	text1002,local,class=CODE,delta=2
global __ptext1002
__ptext1002:

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
psect	text1002
	file	"C:\temp\dev\AK7030-OTP\common.c"
	line	429
	global	__size_of_startThreeHoursTimer
	__size_of_startThreeHoursTimer	equ	__end_of_startThreeHoursTimer-_startThreeHoursTimer
	
_startThreeHoursTimer:	
	opt	stack 5
; Regs used in _startThreeHoursTimer: [wreg+status,2+status,0]
	line	430
	
l4827:	
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
	
l4829:	
	bcf	status, 5	;RP0=0, select bank0
	movf	(_bSmallTimerStartFlag),f
	skipz
	goto	u1871
	goto	u1870
u1871:
	goto	l1981
u1870:
	line	432
	
l4831:	
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
	
l4833:	
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
psect	text1003,local,class=CODE,delta=2
global __ptext1003
__ptext1003:

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
psect	text1003
	file	"C:\temp\dev\AK7030-OTP\common.c"
	line	463
	global	__size_of_isFinishedTwentySecondsTimer
	__size_of_isFinishedTwentySecondsTimer	equ	__end_of_isFinishedTwentySecondsTimer-_isFinishedTwentySecondsTimer
	
_isFinishedTwentySecondsTimer:	
	opt	stack 5
; Regs used in _isFinishedTwentySecondsTimer: [wreg+status,2+status,0]
	line	464
	
l4811:	
;common.c: 464: if(( 0 == uiTwentySecondsTimer ) && bTwentySecStartFlag )
	bsf	status, 5	;RP0=1, select bank1
	movf	((_uiTwentySecondsTimer+1)^080h),w
	iorwf	((_uiTwentySecondsTimer)^080h),w
	skipz
	goto	u1841
	goto	u1840
u1841:
	goto	l4823
u1840:
	
l4813:	
	bcf	status, 5	;RP0=0, select bank0
	movf	(_bTwentySecStartFlag),w
	skipz
	goto	u1850
	goto	l4823
u1850:
	line	466
	
l4815:	
;common.c: 465: {
;common.c: 466: bTwentySecStartFlag = 0;
	clrf	(_bTwentySecStartFlag)
	line	467
	
l4817:	
;common.c: 467: return 1;
	movlw	(01h)
	goto	l1993
	line	470
	
l4823:	
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
psect	text1004,local,class=CODE,delta=2
global __ptext1004
__ptext1004:

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
psect	text1004
	file	"C:\temp\dev\AK7030-OTP\common.c"
	line	443
	global	__size_of_startTwentySecondsTimer
	__size_of_startTwentySecondsTimer	equ	__end_of_startTwentySecondsTimer-_startTwentySecondsTimer
	
_startTwentySecondsTimer:	
	opt	stack 5
; Regs used in _startTwentySecondsTimer: [wreg+status,2+status,0]
	line	444
	
l4803:	
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
	
l4805:	
	bcf	status, 5	;RP0=0, select bank0
	movf	(_bTwentySecStartFlag),f
	skipz
	goto	u1831
	goto	u1830
u1831:
	goto	l1985
u1830:
	line	446
	
l4807:	
;common.c: 445: {
;common.c: 446: uiTwentySecondsTimer = 20;
	movlw	014h
	bsf	status, 5	;RP0=1, select bank1
	movwf	(_uiTwentySecondsTimer)^080h
	clrf	(_uiTwentySecondsTimer+1)^080h
	line	447
	
l4809:	
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
psect	text1005,local,class=CODE,delta=2
global __ptext1005
__ptext1005:

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
psect	text1005
	file	"C:\temp\dev\AK7030-OTP\common.c"
	line	487
	global	__size_of_isFinishedTwelveHoursTimer
	__size_of_isFinishedTwelveHoursTimer	equ	__end_of_isFinishedTwelveHoursTimer-_isFinishedTwelveHoursTimer
	
_isFinishedTwelveHoursTimer:	
	opt	stack 5
; Regs used in _isFinishedTwelveHoursTimer: [wreg+status,2+status,0]
	line	488
	
l4787:	
;common.c: 488: if(( uiBigTimer == 0 ) && bBigTimerStartFlag )
	bsf	status, 5	;RP0=1, select bank1
	movf	((_uiBigTimer+1)^080h),w
	iorwf	((_uiBigTimer)^080h),w
	skipz
	goto	u1801
	goto	u1800
u1801:
	goto	l4799
u1800:
	
l4789:	
	bcf	status, 5	;RP0=0, select bank0
	movf	(_bBigTimerStartFlag),w
	skipz
	goto	u1810
	goto	l4799
u1810:
	line	490
	
l4791:	
;common.c: 489: {
;common.c: 490: bBigTimerStartFlag = 0;
	clrf	(_bBigTimerStartFlag)
	line	491
	
l4793:	
;common.c: 491: return 1;
	movlw	(01h)
	goto	l2003
	line	494
	
l4799:	
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
psect	text1006,local,class=CODE,delta=2
global __ptext1006
__ptext1006:

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
psect	text1006
	file	"C:\temp\dev\AK7030-OTP\common.c"
	line	388
	global	__size_of_startTwelveHourTimer
	__size_of_startTwelveHourTimer	equ	__end_of_startTwelveHourTimer-_startTwelveHourTimer
	
_startTwelveHourTimer:	
	opt	stack 5
; Regs used in _startTwelveHourTimer: [wreg+status,2+status,0]
	line	389
	
l4779:	
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
	
l4781:	
	bcf	status, 5	;RP0=0, select bank0
	movf	(_bBigTimerStartFlag),f
	skipz
	goto	u1791
	goto	u1790
u1791:
	goto	l1965
u1790:
	line	391
	
l4783:	
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
	
l4785:	
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
psect	text1007,local,class=CODE,delta=2
global __ptext1007
__ptext1007:

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
psect	text1007
	file	"C:\temp\dev\AK7030-OTP\common.c"
	line	475
	global	__size_of_isFinishedTwentyMinuteTimer
	__size_of_isFinishedTwentyMinuteTimer	equ	__end_of_isFinishedTwentyMinuteTimer-_isFinishedTwentyMinuteTimer
	
_isFinishedTwentyMinuteTimer:	
	opt	stack 5
; Regs used in _isFinishedTwentyMinuteTimer: [wreg+status,2+status,0]
	line	476
	
l4763:	
;common.c: 476: if(( 0 == uiTwentyMinuteTimer ) && bTwentyMinStartFlag )
	bsf	status, 5	;RP0=1, select bank1
	movf	((_uiTwentyMinuteTimer+1)^080h),w
	iorwf	((_uiTwentyMinuteTimer)^080h),w
	skipz
	goto	u1761
	goto	u1760
u1761:
	goto	l4775
u1760:
	
l4765:	
	bcf	status, 5	;RP0=0, select bank0
	movf	(_bTwentyMinStartFlag),w
	skipz
	goto	u1770
	goto	l4775
u1770:
	line	478
	
l4767:	
;common.c: 477: {
;common.c: 478: bTwentyMinStartFlag = 0;
	clrf	(_bTwentyMinStartFlag)
	line	479
	
l4769:	
;common.c: 479: return 1;
	movlw	(01h)
	goto	l1998
	line	482
	
l4775:	
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
psect	text1008,local,class=CODE,delta=2
global __ptext1008
__ptext1008:

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
psect	text1008
	file	"C:\temp\dev\AK7030-OTP\common.c"
	line	519
	global	__size_of_clrSampeTime
	__size_of_clrSampeTime	equ	__end_of_clrSampeTime-_clrSampeTime
	
_clrSampeTime:	
	opt	stack 5
; Regs used in _clrSampeTime: [status,2]
	line	520
	
l4761:	
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
psect	text1009,local,class=CODE,delta=2
global __ptext1009
__ptext1009:

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
psect	text1009
	file	"C:\temp\dev\AK7030-OTP\common.c"
	line	509
	global	__size_of_isPermitSampleTime
	__size_of_isPermitSampleTime	equ	__end_of_isPermitSampleTime-_isPermitSampleTime
	
_isPermitSampleTime:	
	opt	stack 5
; Regs used in _isPermitSampleTime: [wreg]
	line	510
	
l4749:	
;common.c: 510: if(timer.timer10msStopWatch >= 10)
	movlw	(0Ah)
	bsf	status, 5	;RP0=1, select bank1
	subwf	(_timer)^080h,w
	skipc
	goto	u1751
	goto	u1750
u1751:
	goto	l4757
u1750:
	line	512
	
l4751:	
;common.c: 511: {
;common.c: 512: return 1;
	movlw	(01h)
	goto	l2013
	line	515
	
l4757:	
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
psect	text1010,local,class=CODE,delta=2
global __ptext1010
__ptext1010:

;; *************** function _startTwentyMinuteTimer *****************
;; Defined at:
;;		line 453 in file "C:\temp\dev\AK7030-OTP\common.c"
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
psect	text1010
	file	"C:\temp\dev\AK7030-OTP\common.c"
	line	453
	global	__size_of_startTwentyMinuteTimer
	__size_of_startTwentyMinuteTimer	equ	__end_of_startTwentyMinuteTimer-_startTwentyMinuteTimer
	
_startTwentyMinuteTimer:	
	opt	stack 5
; Regs used in _startTwentyMinuteTimer: [wreg+status,2+status,0]
	line	454
	
l4741:	
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
	
l4743:	
	bcf	status, 5	;RP0=0, select bank0
	movf	(_bTwentyMinStartFlag),f
	skipz
	goto	u1741
	goto	u1740
u1741:
	goto	l1989
u1740:
	line	456
	
l4745:	
;common.c: 455: {
;common.c: 456: uiTwentyMinuteTimer = 1200;
	movlw	low(04B0h)
	bsf	status, 5	;RP0=1, select bank1
	movwf	(_uiTwentyMinuteTimer)^080h
	movlw	high(04B0h)
	movwf	((_uiTwentyMinuteTimer)^080h)+1
	line	457
	
l4747:	
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

	signat	_startTwentyMinuteTimer,88
	global	_adc_start
psect	text1011,local,class=CODE,delta=2
global __ptext1011
__ptext1011:

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
psect	text1011
	file	"C:\temp\dev\AK7030-OTP\periph.c"
	line	100
	global	__size_of_adc_start
	__size_of_adc_start	equ	__end_of_adc_start-_adc_start
	
_adc_start:	
	opt	stack 4
; Regs used in _adc_start: []
	line	101
	
l4739:	
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
psect	text1012,local,class=CODE,delta=2
global __ptext1012
__ptext1012:

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
psect	text1012
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
	
l4729:	
;periph.c: 86: ADCON0 = 0x00;
	clrf	(31)	;volatile
	line	87
	
l4731:	
;periph.c: 87: ADCON0|=channel<<2;
	movf	(adc_test_init@channel),w
	movwf	(??_adc_test_init+0)+0
	clrc
	rlf	(??_adc_test_init+0)+0,f
	clrc
	rlf	(??_adc_test_init+0)+0,w
	iorwf	(31),f	;volatile
	line	88
	
l4733:	
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
	
l4735:	
;periph.c: 89: ADON=1;
	bcf	status, 5	;RP0=0, select bank0
	bsf	(248/8),(248)&7
	line	90
	
l4737:	
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
psect	text1013,local,class=CODE,delta=2
global __ptext1013
__ptext1013:

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
psect	text1013
	file	"C:\temp\dev\AK7030-OTP\common.c"
	line	221
	global	__size_of_timer1_interrupt_config
	__size_of_timer1_interrupt_config	equ	__end_of_timer1_interrupt_config-_timer1_interrupt_config
	
_timer1_interrupt_config:	
	opt	stack 5
; Regs used in _timer1_interrupt_config: []
	line	222
	
l4727:	
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
psect	text1014,local,class=CODE,delta=2
global __ptext1014
__ptext1014:

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
psect	text1014
	file	"C:\temp\dev\AK7030-OTP\common.c"
	line	209
	global	__size_of_timer1_config
	__size_of_timer1_config	equ	__end_of_timer1_config-_timer1_config
	
_timer1_config:	
	opt	stack 5
; Regs used in _timer1_config: [wreg]
	line	211
	
l4723:	
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
	
l4725:	
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
psect	text1015,local,class=CODE,delta=2
global __ptext1015
__ptext1015:

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
psect	text1015
	file	"C:\temp\dev\AK7030-OTP\common.c"
	line	201
	global	__size_of_clock_config
	__size_of_clock_config	equ	__end_of_clock_config-_clock_config
	
_clock_config:	
	opt	stack 5
; Regs used in _clock_config: [wreg+status,2]
	line	203
	
l4719:	
;common.c: 203: CLKPR = 0x80;
	movlw	(080h)
	bcf	status, 5	;RP0=0, select bank2
	bsf	status, 6	;RP1=1, select bank2
	movwf	(264)^0100h	;volatile
	line	204
	
l4721:	
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
psect	text1016,local,class=CODE,delta=2
global __ptext1016
__ptext1016:

;; *************** function _setPB6AsInput *****************
;; Defined at:
;;		line 370 in file "C:\temp\dev\AK7030-OTP\main.c"
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
psect	text1016
	file	"C:\temp\dev\AK7030-OTP\main.c"
	line	370
	global	__size_of_setPB6AsInput
	__size_of_setPB6AsInput	equ	__end_of_setPB6AsInput-_setPB6AsInput
	
_setPB6AsInput:	
	opt	stack 5
; Regs used in _setPB6AsInput: []
	line	372
	
l4717:	
;main.c: 372: TRISB6 = 1;
	bsf	status, 5	;RP0=1, select bank1
	bsf	(1078/8)^080h,(1078)&7
	line	377
	
l755:	
	return
	opt stack 0
GLOBAL	__end_of_setPB6AsInput
	__end_of_setPB6AsInput:
;; =============== function _setPB6AsInput ends ============

	signat	_setPB6AsInput,88
	global	_setPA6
psect	text1017,local,class=CODE,delta=2
global __ptext1017
__ptext1017:

;; *************** function _setPA6 *****************
;; Defined at:
;;		line 354 in file "C:\temp\dev\AK7030-OTP\main.c"
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
psect	text1017
	file	"C:\temp\dev\AK7030-OTP\main.c"
	line	354
	global	__size_of_setPA6
	__size_of_setPA6	equ	__end_of_setPA6-_setPA6
	
_setPA6:	
	opt	stack 5
; Regs used in _setPA6: [wreg]
;setPA6@bValue stored from wreg
	movwf	(setPA6@bValue)
	line	355
	
l4713:	
;main.c: 355: if( bValue )
	movf	(setPA6@bValue),w
	skipz
	goto	u1710
	goto	l750
u1710:
	line	357
	
l4715:	
;main.c: 357: PA6 = 1;
	bsf	(46/8),(46)&7
	goto	l752
	line	361
	
l750:	
	line	363
;main.c: 361: else
;main.c: 363: PA6= 0;
	bcf	(46/8),(46)&7
	line	367
	
l752:	
	return
	opt stack 0
GLOBAL	__end_of_setPA6
	__end_of_setPA6:
;; =============== function _setPA6 ends ============

	signat	_setPA6,4216
	global	_setPB4
psect	text1018,local,class=CODE,delta=2
global __ptext1018
__ptext1018:

;; *************** function _setPB4 *****************
;; Defined at:
;;		line 308 in file "C:\temp\dev\AK7030-OTP\main.c"
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
psect	text1018
	file	"C:\temp\dev\AK7030-OTP\main.c"
	line	308
	global	__size_of_setPB4
	__size_of_setPB4	equ	__end_of_setPB4-_setPB4
	
_setPB4:	
	opt	stack 4
; Regs used in _setPB4: [wreg]
;setPB4@bValue stored from wreg
	movwf	(setPB4@bValue)
	line	309
	
l4709:	
;main.c: 309: if( bValue )
	movf	(setPB4@bValue),w
	skipz
	goto	u1700
	goto	l740
u1700:
	line	311
	
l4711:	
;main.c: 311: PB4 = 1;
	bsf	(52/8),(52)&7
	goto	l742
	line	315
	
l740:	
	line	317
;main.c: 315: else
;main.c: 317: PB4 = 0;
	bcf	(52/8),(52)&7
	line	321
	
l742:	
	return
	opt stack 0
GLOBAL	__end_of_setPB4
	__end_of_setPB4:
;; =============== function _setPB4 ends ============

	signat	_setPB4,4216
	global	_setPB6
psect	text1019,local,class=CODE,delta=2
global __ptext1019
__ptext1019:

;; *************** function _setPB6 *****************
;; Defined at:
;;		line 284 in file "C:\temp\dev\AK7030-OTP\main.c"
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
psect	text1019
	file	"C:\temp\dev\AK7030-OTP\main.c"
	line	284
	global	__size_of_setPB6
	__size_of_setPB6	equ	__end_of_setPB6-_setPB6
	
_setPB6:	
	opt	stack 5
; Regs used in _setPB6: [wreg]
;setPB6@bValue stored from wreg
	movwf	(setPB6@bValue)
	line	285
	
l4705:	
;main.c: 285: if( bValue )
	movf	(setPB6@bValue),w
	skipz
	goto	u1690
	goto	l735
u1690:
	line	288
	
l4707:	
;main.c: 287: {
;main.c: 288: TRISB6 = 0;
	bsf	status, 5	;RP0=1, select bank1
	bcf	(1078/8)^080h,(1078)&7
	line	289
;main.c: 289: PB6 = 1;
	bcf	status, 5	;RP0=0, select bank0
	bsf	(54/8),(54)&7
	line	290
;main.c: 290: }
	goto	l737
	line	294
	
l735:	
	line	297
;main.c: 294: else
;main.c: 296: {
;main.c: 297: TRISB6 = 0;
	bsf	status, 5	;RP0=1, select bank1
	bcf	(1078/8)^080h,(1078)&7
	line	298
;main.c: 298: PB6 = 0;
	bcf	status, 5	;RP0=0, select bank0
	bcf	(54/8),(54)&7
	line	303
	
l737:	
	return
	opt stack 0
GLOBAL	__end_of_setPB6
	__end_of_setPB6:
;; =============== function _setPB6 ends ============

	signat	_setPB6,4216
	global	_setPA3
psect	text1020,local,class=CODE,delta=2
global __ptext1020
__ptext1020:

;; *************** function _setPA3 *****************
;; Defined at:
;;		line 267 in file "C:\temp\dev\AK7030-OTP\main.c"
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
psect	text1020
	file	"C:\temp\dev\AK7030-OTP\main.c"
	line	267
	global	__size_of_setPA3
	__size_of_setPA3	equ	__end_of_setPA3-_setPA3
	
_setPA3:	
	opt	stack 4
; Regs used in _setPA3: [wreg]
;setPA3@bValue stored from wreg
	bcf	status, 5	;RP0=0, select bank0
	movwf	(setPA3@bValue)
	line	268
	
l4701:	
;main.c: 268: if( bValue )
	movf	(setPA3@bValue),w
	skipz
	goto	u1680
	goto	l730
u1680:
	line	270
	
l4703:	
;main.c: 270: PA3 = 1;
	bsf	(43/8),(43)&7
	goto	l732
	line	274
	
l730:	
	line	276
;main.c: 274: else
;main.c: 276: PA3 = 0;
	bcf	(43/8),(43)&7
	line	280
	
l732:	
	return
	opt stack 0
GLOBAL	__end_of_setPA3
	__end_of_setPA3:
;; =============== function _setPA3 ends ============

	signat	_setPA3,4216
	global	_setPA2
psect	text1021,local,class=CODE,delta=2
global __ptext1021
__ptext1021:

;; *************** function _setPA2 *****************
;; Defined at:
;;		line 250 in file "C:\temp\dev\AK7030-OTP\main.c"
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
psect	text1021
	file	"C:\temp\dev\AK7030-OTP\main.c"
	line	250
	global	__size_of_setPA2
	__size_of_setPA2	equ	__end_of_setPA2-_setPA2
	
_setPA2:	
	opt	stack 5
; Regs used in _setPA2: [wreg]
;setPA2@bValue stored from wreg
	bcf	status, 5	;RP0=0, select bank0
	movwf	(setPA2@bValue)
	line	251
	
l4697:	
;main.c: 251: if( bValue )
	movf	(setPA2@bValue),w
	skipz
	goto	u1670
	goto	l725
u1670:
	line	253
	
l4699:	
;main.c: 253: PA2 = 1;
	bsf	(42/8),(42)&7
	goto	l727
	line	257
	
l725:	
	line	259
;main.c: 257: else
;main.c: 259: PA2 = 0;
	bcf	(42/8),(42)&7
	line	263
	
l727:	
	return
	opt stack 0
GLOBAL	__end_of_setPA2
	__end_of_setPA2:
;; =============== function _setPA2 ends ============

	signat	_setPA2,4216
	global	_setPA1
psect	text1022,local,class=CODE,delta=2
global __ptext1022
__ptext1022:

;; *************** function _setPA1 *****************
;; Defined at:
;;		line 232 in file "C:\temp\dev\AK7030-OTP\main.c"
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
psect	text1022
	file	"C:\temp\dev\AK7030-OTP\main.c"
	line	232
	global	__size_of_setPA1
	__size_of_setPA1	equ	__end_of_setPA1-_setPA1
	
_setPA1:	
	opt	stack 5
; Regs used in _setPA1: [wreg]
;setPA1@bValue stored from wreg
	bcf	status, 5	;RP0=0, select bank0
	movwf	(setPA1@bValue)
	line	233
	
l4693:	
;main.c: 233: if( bValue )
	movf	(setPA1@bValue),w
	skipz
	goto	u1660
	goto	l720
u1660:
	line	235
	
l4695:	
;main.c: 235: PA1 = 1;
	bsf	(41/8),(41)&7
	goto	l722
	line	239
	
l720:	
	line	241
;main.c: 239: else
;main.c: 241: PA1 = 0;
	bcf	(41/8),(41)&7
	line	245
	
l722:	
	return
	opt stack 0
GLOBAL	__end_of_setPA1
	__end_of_setPA1:
;; =============== function _setPA1 ends ============

	signat	_setPA1,4216
	global	_setPA0
psect	text1023,local,class=CODE,delta=2
global __ptext1023
__ptext1023:

;; *************** function _setPA0 *****************
;; Defined at:
;;		line 215 in file "C:\temp\dev\AK7030-OTP\main.c"
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
psect	text1023
	file	"C:\temp\dev\AK7030-OTP\main.c"
	line	215
	global	__size_of_setPA0
	__size_of_setPA0	equ	__end_of_setPA0-_setPA0
	
_setPA0:	
	opt	stack 5
; Regs used in _setPA0: [wreg]
;setPA0@bValue stored from wreg
	bcf	status, 5	;RP0=0, select bank0
	movwf	(setPA0@bValue)
	line	216
	
l4689:	
;main.c: 216: if( bValue )
	movf	(setPA0@bValue),w
	skipz
	goto	u1650
	goto	l715
u1650:
	line	218
	
l4691:	
;main.c: 218: PA0 = 1;
	bsf	(40/8),(40)&7
	goto	l717
	line	222
	
l715:	
	line	224
;main.c: 222: else
;main.c: 224: PA0 = 0;
	bcf	(40/8),(40)&7
	line	228
	
l717:	
	return
	opt stack 0
GLOBAL	__end_of_setPA0
	__end_of_setPA0:
;; =============== function _setPA0 ends ============

	signat	_setPA0,4216
	global	_setPB2
psect	text1024,local,class=CODE,delta=2
global __ptext1024
__ptext1024:

;; *************** function _setPB2 *****************
;; Defined at:
;;		line 198 in file "C:\temp\dev\AK7030-OTP\main.c"
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
psect	text1024
	file	"C:\temp\dev\AK7030-OTP\main.c"
	line	198
	global	__size_of_setPB2
	__size_of_setPB2	equ	__end_of_setPB2-_setPB2
	
_setPB2:	
	opt	stack 5
; Regs used in _setPB2: [wreg]
;setPB2@bValue stored from wreg
	movwf	(setPB2@bValue)
	line	199
	
l4685:	
;main.c: 199: if( bValue )
	movf	(setPB2@bValue),w
	skipz
	goto	u1640
	goto	l710
u1640:
	line	201
	
l4687:	
;main.c: 201: PB2 = 1;
	bsf	(50/8),(50)&7
	goto	l712
	line	205
	
l710:	
	line	207
;main.c: 205: else
;main.c: 207: PB2 = 0;
	bcf	(50/8),(50)&7
	line	211
	
l712:	
	return
	opt stack 0
GLOBAL	__end_of_setPB2
	__end_of_setPB2:
;; =============== function _setPB2 ends ============

	signat	_setPB2,4216
	global	_setPB1
psect	text1025,local,class=CODE,delta=2
global __ptext1025
__ptext1025:

;; *************** function _setPB1 *****************
;; Defined at:
;;		line 181 in file "C:\temp\dev\AK7030-OTP\main.c"
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
psect	text1025
	file	"C:\temp\dev\AK7030-OTP\main.c"
	line	181
	global	__size_of_setPB1
	__size_of_setPB1	equ	__end_of_setPB1-_setPB1
	
_setPB1:	
	opt	stack 5
; Regs used in _setPB1: [wreg]
;setPB1@bValue stored from wreg
	movwf	(setPB1@bValue)
	line	182
	
l4681:	
;main.c: 182: if( bValue )
	movf	(setPB1@bValue),w
	skipz
	goto	u1630
	goto	l705
u1630:
	line	184
	
l4683:	
;main.c: 184: PB1 = 1;
	bsf	(49/8),(49)&7
	goto	l707
	line	188
	
l705:	
	line	190
;main.c: 188: else
;main.c: 190: PB1 = 0;
	bcf	(49/8),(49)&7
	line	194
	
l707:	
	return
	opt stack 0
GLOBAL	__end_of_setPB1
	__end_of_setPB1:
;; =============== function _setPB1 ends ============

	signat	_setPB1,4216
	global	_setPB0
psect	text1026,local,class=CODE,delta=2
global __ptext1026
__ptext1026:

;; *************** function _setPB0 *****************
;; Defined at:
;;		line 164 in file "C:\temp\dev\AK7030-OTP\main.c"
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
psect	text1026
	file	"C:\temp\dev\AK7030-OTP\main.c"
	line	164
	global	__size_of_setPB0
	__size_of_setPB0	equ	__end_of_setPB0-_setPB0
	
_setPB0:	
	opt	stack 5
; Regs used in _setPB0: [wreg]
;setPB0@bValue stored from wreg
	movwf	(setPB0@bValue)
	line	165
	
l4677:	
;main.c: 165: if( bValue )
	movf	(setPB0@bValue),w
	skipz
	goto	u1620
	goto	l700
u1620:
	line	167
	
l4679:	
;main.c: 167: PB0 = 1;
	bsf	(48/8),(48)&7
	goto	l702
	line	171
	
l700:	
	line	173
;main.c: 171: else
;main.c: 173: PB0 = 0;
	bcf	(48/8),(48)&7
	line	177
	
l702:	
	return
	opt stack 0
GLOBAL	__end_of_setPB0
	__end_of_setPB0:
;; =============== function _setPB0 ends ============

	signat	_setPB0,4216
	global	_initPin
psect	text1027,local,class=CODE,delta=2
global __ptext1027
__ptext1027:

;; *************** function _initPin *****************
;; Defined at:
;;		line 127 in file "C:\temp\dev\AK7030-OTP\main.c"
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
psect	text1027
	file	"C:\temp\dev\AK7030-OTP\main.c"
	line	127
	global	__size_of_initPin
	__size_of_initPin	equ	__end_of_initPin-_initPin
	
_initPin:	
	opt	stack 5
; Regs used in _initPin: []
	line	130
	
l4675:	
;main.c: 130: TRISB0 = 0;
	bsf	status, 5	;RP0=1, select bank1
	bcf	(1072/8)^080h,(1072)&7
	line	131
;main.c: 131: PB0 = 0;
	bcf	status, 5	;RP0=0, select bank0
	bcf	(48/8),(48)&7
	line	132
;main.c: 132: TRISB1 = 0;
	bsf	status, 5	;RP0=1, select bank1
	bcf	(1073/8)^080h,(1073)&7
	line	133
;main.c: 133: PB1 = 0;
	bcf	status, 5	;RP0=0, select bank0
	bcf	(49/8),(49)&7
	line	134
;main.c: 134: TRISB2 = 0;
	bsf	status, 5	;RP0=1, select bank1
	bcf	(1074/8)^080h,(1074)&7
	line	135
;main.c: 135: PB2 = 0;
	bcf	status, 5	;RP0=0, select bank0
	bcf	(50/8),(50)&7
	line	136
;main.c: 136: TRISA0 = 0;
	bsf	status, 5	;RP0=1, select bank1
	bcf	(1064/8)^080h,(1064)&7
	line	137
;main.c: 137: PA0 = 0;
	bcf	status, 5	;RP0=0, select bank0
	bcf	(40/8),(40)&7
	line	138
;main.c: 138: TRISA1 = 0;
	bsf	status, 5	;RP0=1, select bank1
	bcf	(1065/8)^080h,(1065)&7
	line	139
;main.c: 139: PA1 = 0;
	bcf	status, 5	;RP0=0, select bank0
	bcf	(41/8),(41)&7
	line	140
;main.c: 140: TRISA2 = 0;
	bsf	status, 5	;RP0=1, select bank1
	bcf	(1066/8)^080h,(1066)&7
	line	141
;main.c: 141: PA2 = 1;
	bcf	status, 5	;RP0=0, select bank0
	bsf	(42/8),(42)&7
	line	143
;main.c: 143: TRISA3 = 0;
	bsf	status, 5	;RP0=1, select bank1
	bcf	(1067/8)^080h,(1067)&7
	line	144
;main.c: 144: PA3 = 0;
	bcf	status, 5	;RP0=0, select bank0
	bcf	(43/8),(43)&7
	line	145
;main.c: 145: TRISB4 = 0;
	bsf	status, 5	;RP0=1, select bank1
	bcf	(1076/8)^080h,(1076)&7
	line	146
;main.c: 146: PB4 = 0;
	bcf	status, 5	;RP0=0, select bank0
	bcf	(52/8),(52)&7
	line	147
;main.c: 147: TRISB7 = 0;
	bsf	status, 5	;RP0=1, select bank1
	bcf	(1079/8)^080h,(1079)&7
	line	148
;main.c: 148: PB7 = 0;
	bcf	status, 5	;RP0=0, select bank0
	bcf	(55/8),(55)&7
	line	150
;main.c: 150: TRISB6 = 1;
	bsf	status, 5	;RP0=1, select bank1
	bsf	(1078/8)^080h,(1078)&7
	line	159
	
l697:	
	return
	opt stack 0
GLOBAL	__end_of_initPin
	__end_of_initPin:
;; =============== function _initPin ends ============

	signat	_initPin,88
	global	_clearTwentyMinuteTimer
psect	text1028,local,class=CODE,delta=2
global __ptext1028
__ptext1028:

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
psect	text1028
	file	"C:\temp\dev\AK7030-OTP\common.c"
	line	422
	global	__size_of_clearTwentyMinuteTimer
	__size_of_clearTwentyMinuteTimer	equ	__end_of_clearTwentyMinuteTimer-_clearTwentyMinuteTimer
	
_clearTwentyMinuteTimer:	
	opt	stack 4
; Regs used in _clearTwentyMinuteTimer: [status,2]
	line	423
	
l4673:	
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
psect	text1029,local,class=CODE,delta=2
global __ptext1029
__ptext1029:

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
psect	text1029
	file	"C:\temp\dev\AK7030-OTP\common.c"
	line	415
	global	__size_of_clearTwentySecondsTimer
	__size_of_clearTwentySecondsTimer	equ	__end_of_clearTwentySecondsTimer-_clearTwentySecondsTimer
	
_clearTwentySecondsTimer:	
	opt	stack 4
; Regs used in _clearTwentySecondsTimer: [status,2]
	line	416
	
l4671:	
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
psect	text1030,local,class=CODE,delta=2
global __ptext1030
__ptext1030:

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
psect	text1030
	file	"C:\temp\dev\AK7030-OTP\common.c"
	line	409
	global	__size_of_clearThreeHoursTimer
	__size_of_clearThreeHoursTimer	equ	__end_of_clearThreeHoursTimer-_clearThreeHoursTimer
	
_clearThreeHoursTimer:	
	opt	stack 4
; Regs used in _clearThreeHoursTimer: [status,2]
	line	410
	
l4669:	
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
psect	text1031,local,class=CODE,delta=2
global __ptext1031
__ptext1031:

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
psect	text1031
	file	"C:\temp\dev\AK7030-OTP\common.c"
	line	402
	global	__size_of_clearTwelveHoursTimer
	__size_of_clearTwelveHoursTimer	equ	__end_of_clearTwelveHoursTimer-_clearTwelveHoursTimer
	
_clearTwelveHoursTimer:	
	opt	stack 4
; Regs used in _clearTwelveHoursTimer: [status,2]
	line	403
	
l4667:	
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
psect	text1032,local,class=CODE,delta=2
global __ptext1032
__ptext1032:

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
psect	text1032
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
psect	text1032
	line	527
	
i1l4967:	
;common.c: 525: static unsigned char ucTimer1sCnt = 0;
;common.c: 527: if(TMR1IF == 1)
	btfss	(96/8),(96)&7
	goto	u204_21
	goto	u204_20
u204_21:
	goto	i1l4985
u204_20:
	line	529
	
i1l4969:	
;common.c: 528: {
;common.c: 529: TMR1IF = 0 ;
	bcf	(96/8),(96)&7
	line	530
	
i1l4971:	
;common.c: 530: timer.timer10msStopWatch++;
	bsf	status, 5	;RP0=1, select bank1
	incf	(_timer)^080h,f
	line	531
;common.c: 531: ucTimer1sCnt++;
	incf	(ISR@ucTimer1sCnt)^080h,f
	line	533
	
i1l4973:	
;common.c: 533: if(ucTimer1sCnt >= 100)
	movlw	(064h)
	subwf	(ISR@ucTimer1sCnt)^080h,w
	skipc
	goto	u205_21
	goto	u205_20
u205_21:
	goto	i1l4985
u205_20:
	line	535
	
i1l4975:	
;common.c: 534: {
;common.c: 535: ucTimer1sCnt = 0;
	clrf	(ISR@ucTimer1sCnt)^080h
	line	536
	
i1l4977:	
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
	
i1l4979:	
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
	
i1l4981:	
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
	goto	i1l4985
u208_20:
	line	543
	
i1l4983:	
;common.c: 543: uiTwentySecondsTimer--;
	movlw	low(01h)
	subwf	(_uiTwentySecondsTimer)^080h,f
	movlw	high(01h)
	skipc
	decf	(_uiTwentySecondsTimer+1)^080h,f
	subwf	(_uiTwentySecondsTimer+1)^080h,f
	line	547
	
i1l4985:	
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
	
i1l4987:	
;common.c: 548: {
;common.c: 549: ADIF=0;
	bcf	(106/8),(106)&7
	line	550
	
i1l4989:	
;common.c: 550: setAD_ConvertFlag(1);
	movlw	(01h)
	fcall	i1_setAD_ConvertFlag
	line	551
	
i1l4991:	
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
psect	text1033,local,class=CODE,delta=2
global __ptext1033
__ptext1033:

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
psect	text1033
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
	
i1l4997:	
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
psect	text1034,local,class=CODE,delta=2
global __ptext1034
__ptext1034:

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
psect	text1034
	file	"C:\temp\dev\AK7030-OTP\periph.c"
	line	105
	global	__size_of_adc_get
	__size_of_adc_get	equ	__end_of_adc_get-_adc_get
	
_adc_get:	
	opt	stack 3
; Regs used in _adc_get: [wreg]
	line	107
	
i1l4993:	
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
psect	text1035,local,class=CODE,delta=2
global __ptext1035
__ptext1035:

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
psect	text1035
	file	"C:\temp\dev\AK7030-OTP\common.c"
	line	105
	global	__size_of_vPutSampleDataIntoTable
	__size_of_vPutSampleDataIntoTable	equ	__end_of_vPutSampleDataIntoTable-_vPutSampleDataIntoTable
	
_vPutSampleDataIntoTable:	
	opt	stack 3
; Regs used in _vPutSampleDataIntoTable: [wreg-fsr0h+status,2+status,0+btemp+1]
	line	115
	
i1l4901:	
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
	goto	i1l4913
u195_20:
	line	117
	
i1l4903:	
;common.c: 116: {
;common.c: 117: if(ucChannelZeroLength < 12)
	movlw	(0Ch)
	subwf	(vPutSampleDataIntoTable@ucChannelZeroLength),w
	skipnc
	goto	u196_21
	goto	u196_20
u196_21:
	goto	i1l4909
u196_20:
	line	119
	
i1l4905:	
;common.c: 118: {
;common.c: 119: uiSampleChannelZero[ucChannelZeroLength] = uiSampleData;
	clrc
	rlf	(vPutSampleDataIntoTable@ucChannelZeroLength),w
	addlw	_uiSampleChannelZero&0ffh
	movwf	fsr0
	movf	(vPutSampleDataIntoTable@uiSampleData),w
	bsf	status, 7	;select IRP bank3
	movwf	indf
	incf	fsr0,f
	movf	(vPutSampleDataIntoTable@uiSampleData+1),w
	movwf	indf
	line	121
	
i1l4907:	
;common.c: 121: ucChannelZeroLength++;
	incf	(vPutSampleDataIntoTable@ucChannelZeroLength),f
	line	122
;common.c: 122: }
	goto	i1l1910
	line	125
	
i1l4909:	
;common.c: 123: else
;common.c: 124: {
;common.c: 125: ucChannelZeroLength = 0;
	clrf	(vPutSampleDataIntoTable@ucChannelZeroLength)
	line	127
	
i1l4911:	
;common.c: 127: uiSampleChannelZero[ucChannelZeroLength] = uiSampleData;
	clrc
	rlf	(vPutSampleDataIntoTable@ucChannelZeroLength),w
	addlw	_uiSampleChannelZero&0ffh
	movwf	fsr0
	movf	(vPutSampleDataIntoTable@uiSampleData),w
	bsf	status, 7	;select IRP bank3
	movwf	indf
	incf	fsr0,f
	movf	(vPutSampleDataIntoTable@uiSampleData+1),w
	movwf	indf
	goto	i1l1910
	line	130
	
i1l4913:	
;common.c: 130: else if(channel == 2)
	movf	(vPutSampleDataIntoTable@channel),w
	xorlw	02h
	skipz
	goto	u197_21
	goto	u197_20
u197_21:
	goto	i1l4925
u197_20:
	line	132
	
i1l4915:	
;common.c: 131: {
;common.c: 132: if(ucChannelSecondLength < 12)
	movlw	(0Ch)
	subwf	(vPutSampleDataIntoTable@ucChannelSecondLength),w
	skipnc
	goto	u198_21
	goto	u198_20
u198_21:
	goto	i1l4921
u198_20:
	line	134
	
i1l4917:	
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
	
i1l4919:	
;common.c: 136: ucChannelSecondLength++;
	incf	(vPutSampleDataIntoTable@ucChannelSecondLength),f
	line	137
;common.c: 137: }
	goto	i1l1910
	line	140
	
i1l4921:	
;common.c: 138: else
;common.c: 139: {
;common.c: 140: ucChannelSecondLength = 0;
	clrf	(vPutSampleDataIntoTable@ucChannelSecondLength)
	line	142
	
i1l4923:	
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
	goto	i1l1910
	line	145
	
i1l4925:	
;common.c: 145: else if(channel == 5)
	movf	(vPutSampleDataIntoTable@channel),w
	xorlw	05h
	skipz
	goto	u199_21
	goto	u199_20
u199_21:
	goto	i1l4937
u199_20:
	line	147
	
i1l4927:	
;common.c: 146: {
;common.c: 147: if(ucChannelFifthLength < 12)
	movlw	(0Ch)
	subwf	(vPutSampleDataIntoTable@ucChannelFifthLength),w
	skipnc
	goto	u200_21
	goto	u200_20
u200_21:
	goto	i1l4933
u200_20:
	line	149
	
i1l4929:	
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
	
i1l4931:	
;common.c: 151: ucChannelFifthLength++;
	incf	(vPutSampleDataIntoTable@ucChannelFifthLength),f
	line	152
;common.c: 152: }
	goto	i1l1910
	line	155
	
i1l4933:	
;common.c: 153: else
;common.c: 154: {
;common.c: 155: ucChannelFifthLength = 0;
	clrf	(vPutSampleDataIntoTable@ucChannelFifthLength)
	line	157
	
i1l4935:	
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
	goto	i1l1910
	line	160
	
i1l4937:	
;common.c: 160: else if(channel == 6)
	movf	(vPutSampleDataIntoTable@channel),w
	xorlw	06h
	skipz
	goto	u201_21
	goto	u201_20
u201_21:
	goto	i1l4949
u201_20:
	line	162
	
i1l4939:	
;common.c: 161: {
;common.c: 162: if(ucChannelSixthLength < 12)
	movlw	(0Ch)
	subwf	(vPutSampleDataIntoTable@ucChannelSixthLength),w
	skipnc
	goto	u202_21
	goto	u202_20
u202_21:
	goto	i1l4945
u202_20:
	line	164
	
i1l4941:	
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
	
i1l4943:	
;common.c: 166: ucChannelSixthLength++;
	incf	(vPutSampleDataIntoTable@ucChannelSixthLength),f
	line	167
;common.c: 167: }
	goto	i1l1910
	line	170
	
i1l4945:	
;common.c: 168: else
;common.c: 169: {
;common.c: 170: ucChannelSixthLength = 0;
	clrf	(vPutSampleDataIntoTable@ucChannelSixthLength)
	line	172
	
i1l4947:	
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
	goto	i1l1910
	line	177
	
i1l4949:	
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
	
i1l4955:	
;common.c: 186: {
;common.c: 187: uiSampleChannelZero[i] = 0;
	clrc
	rlf	(vPutSampleDataIntoTable@i),w
	addlw	_uiSampleChannelZero&0ffh
	movwf	fsr0
	bsf	status, 7	;select IRP bank3
	clrf	indf
	incf	fsr0,f
	clrf	indf
	line	189
;common.c: 189: uiSampleChannelSecond[i] = 0;
	clrc
	rlf	(vPutSampleDataIntoTable@i),w
	addlw	_uiSampleChannelSecond&0ffh
	movwf	fsr0
	bcf	status, 7	;select IRP bank1
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
	
i1l4957:	
	incf	(vPutSampleDataIntoTable@i),f
	skipnz
	incf	(vPutSampleDataIntoTable@i+1),f
	
i1l4959:	
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
	goto	i1l4955
u203_20:
	line	197
	
i1l1910:	
	return
	opt stack 0
GLOBAL	__end_of_vPutSampleDataIntoTable
	__end_of_vPutSampleDataIntoTable:
;; =============== function _vPutSampleDataIntoTable ends ============

	signat	_vPutSampleDataIntoTable,8312
psect	text1036,local,class=CODE,delta=2
global __ptext1036
__ptext1036:
	global	btemp
	btemp set 07Eh

	DABS	1,126,2	;btemp
	global	wtemp0
	wtemp0 set btemp
	end
