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
	FNCALL	_main,_vHandle20sTimeron
	FNCALL	_main,_vHandle20sTimerOut
	FNCALL	_main,_setPA6
	FNCALL	_main,_clearPinPortAndTimer
	FNCALL	_main,_startThreeHoursTimer
	FNCALL	_main,_isFinishedThreeHoursTimer
	FNCALL	_main,_clearThreeHoursTimer
	FNCALL	_main,_setPA2
	FNCALL	_main,_setPB6
	FNCALL	_main,_clearAllTimer
	FNCALL	_vHandle20sTimeron,_getAdOriginalCh2Value
	FNCALL	_vHandle20sTimeron,_getAdOriginalCh6Value
	FNCALL	_vHandle20sTimeron,_vPause20sTimer
	FNCALL	_vHandle20sTimeron,_setPA3
	FNCALL	_vHandle20sTimeron,_setPB6
	FNCALL	_vHandle20sTimeron,_setPB6AsInput
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
	FNCALL	_vHandle20sTimerOut,_setPA3
	FNCALL	_vHandle20sTimerOut,_setPB4
	FNCALL	_vHandle20sTimerOut,_setPB6
	FNCALL	_vHandle20sTimerOut,_setPB6AsInput
	FNCALL	_vHandle20sTimerOut,_clearTwentySecondsTimer
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
	global	main@ucFourthSuffix1TimerP3s
	global	main@ucLoaderStep
	global	main@ucLoaderStep1
	global	main@ucLoaderStep2
	global	main@ucLoaderStep3
	global	main@ucLoaderStep4
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
	global	vHandle20sTimerOut@ucTimeCnt
	global	_uiBigTimer
	global	_uiSmallTimer
	global	_uiTwentyMinuteTimer
	global	_uiTwentySecondsTimer
	global	main@uiMaxValue
	global	main@uiMinValue
	global	ISR@ucTimer1sCnt
	global	_adc_convert_flag
	global	_bPause20secTimer
	global	_timer
	global	main@enumBranchStep
	global	main@enumInteralStep
	global	main@ucTimer1s
	global	main@ucTimerLessX1P5s
	global	main@ucTimerLessX2P5s
	global	main@ucTimerP3s
	global	main@ucTimerX1P5s
	global	main@ucTimerX2P5s
	global	vHandle20sTimerOut@ucTimerOnBehaviorStep
	global	vHandle20sTimeron@ucCompareStep
	global	vHandle20sTimeron@ucLessThanP3sCnt
	global	vHandle20sTimeron@ucLessThanP8sCnt
	global	vHandle20sTimeron@ucMoreThanP3sCnt
	global	vHandle20sTimeron@ucMoreThanP8sCnt
	global	vHandle20sTimeron@ucTimeCntP2s
	global	vHandle20sTimeron@ucTimerCntLess
	global	vHandle20sTimeron@ucTimerCntMore
	global	vHandle20sTimeron@ucTimerCntN1
	global	vHandle20sTimeron@ucTimerCntP5s
	global	vHandle20sTimeron@waitLoopStep
	global	_uiSampleChannelFifth
	global	_uiSampleChannelSecond
	global	_uiSampleChannelSixth
	global	_uiSampleChannelZero
	global	_ADCON0
psect	text1003,local,class=CODE,delta=2
global __ptext1003
__ptext1003:
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
vHandle20sTimerOut@ucTimeCnt:
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

main@ucFourthSuffix1TimerP3s:
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

_bPause20secTimer:
       ds      1

_timer:
       ds      1

main@enumBranchStep:
       ds      1

main@enumInteralStep:
       ds      1

main@ucTimer1s:
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

vHandle20sTimerOut@ucTimerOnBehaviorStep:
       ds      1

vHandle20sTimeron@ucCompareStep:
       ds      1

vHandle20sTimeron@ucLessThanP3sCnt:
       ds      1

vHandle20sTimeron@ucLessThanP8sCnt:
       ds      1

vHandle20sTimeron@ucMoreThanP3sCnt:
       ds      1

vHandle20sTimeron@ucMoreThanP8sCnt:
       ds      1

vHandle20sTimeron@ucTimeCntP2s:
       ds      1

vHandle20sTimeron@ucTimerCntLess:
       ds      1

vHandle20sTimeron@ucTimerCntMore:
       ds      1

vHandle20sTimeron@ucTimerCntN1:
       ds      1

vHandle20sTimeron@ucTimerCntP5s:
       ds      1

vHandle20sTimeron@waitLoopStep:
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
	movlw	low((__pbssBANK1)+03Ch)
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
	global	?_vHandle20sTimeron
?_vHandle20sTimeron:	; 0 bytes @ 0x0
	global	?_vHandle20sTimerOut
?_vHandle20sTimerOut:	; 0 bytes @ 0x0
	global	?_vPause20sTimer
?_vPause20sTimer:	; 0 bytes @ 0x0
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
	global	??_vPause20sTimer
??_vPause20sTimer:	; 0 bytes @ 0x0
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
	global	vPause20sTimer@bValue
vPause20sTimer@bValue:	; 1 bytes @ 0x0
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
	global	??_vHandle20sTimerOut
??_vHandle20sTimerOut:	; 0 bytes @ 0x1
	global	??_clearParaFunction1
??_clearParaFunction1:	; 0 bytes @ 0x1
	global	vHandle20sTimerOut@bClearStep
vHandle20sTimerOut@bClearStep:	; 1 bytes @ 0x1
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
	global	??_vHandle20sTimeron
??_vHandle20sTimeron:	; 0 bytes @ 0x28
	global	??_getAdOriginalCh2Value
??_getAdOriginalCh2Value:	; 0 bytes @ 0x28
	global	??_main
??_main:	; 0 bytes @ 0x28
	global	main@uiCh5Value
main@uiCh5Value:	; 2 bytes @ 0x28
	ds	2
;;Data sizes: Strings 0, constant 0, data 0, bss 170, persistent 0 stack 0
;;Auto spaces:   Size  Autos    Used
;; COMMON          14     13      14
;; BANK0           80     42      79
;; BANK1           80      0      60
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
;;   _vHandle20sTimeron->_getAdOriginalCh2Value
;;   _vHandle20sTimeron->_getAdOriginalCh6Value
;;   _clearParaFunction1->_setPA1
;;   _clearParaFunction1->_setPA0
;;   _clearParaFunction1->_setPB0
;;   _clearParaFunction1->_setPB1
;;   _clearParaFunction1->_setPB2
;;   _clearParaFunction1->_setPA3
;;   _clearParaFunction1->_setPB4
;;   _AD_Sample->_adc_test_init
;;   _getAdOriginalCh2Value->_Filter
;;   _vHandle20sTimerOut->_setPA3
;;   _vHandle20sTimerOut->_setPB4
;;   _vHandle20sTimerOut->_setPB6
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
;; (0) _main                                                 2     2      0    3895
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
;;                  _vHandle20sTimeron
;;                 _vHandle20sTimerOut
;;                             _setPA6
;;               _clearPinPortAndTimer
;;               _startThreeHoursTimer
;;          _isFinishedThreeHoursTimer
;;               _clearThreeHoursTimer
;;                             _setPA2
;;                             _setPB6
;;                      _clearAllTimer
;; ---------------------------------------------------------------------------------
;; (1) _vHandle20sTimeron                                    0     0      0    1306
;;              _getAdOriginalCh2Value
;;              _getAdOriginalCh6Value
;;                     _vPause20sTimer
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
;; (2) _getAdOriginalCh2Value                                2     0      2     620
;;                                             38 BANK0      2     0      2
;;                             _Filter
;; ---------------------------------------------------------------------------------
;; (1) _vHandle20sTimerOut                                   1     1      0      89
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
;; (3) _Filter                                              38    36      2     620
;;                                              0 BANK0     38    36      2
;; ---------------------------------------------------------------------------------
;; (2) _vPause20sTimer                                       1     1      0      22
;;                                              0 BANK0      1     1      0
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
;; (2) _setPB6AsInput                                        0     0      0       0
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
;;   _vHandle20sTimeron
;;     _getAdOriginalCh2Value
;;       _Filter
;;     _getAdOriginalCh6Value
;;       _Filter
;;     _vPause20sTimer
;;     _setPA3
;;     _setPB6
;;     _setPB6AsInput
;;   _vHandle20sTimerOut
;;     _setPA3
;;     _setPB4
;;     _setPB6
;;     _setPB6AsInput
;;     _clearTwentySecondsTimer
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
;;   _setPB6
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
;;ABS                  0      0      E1       3        0.0%
;;BITBANK0            50      0       0       4        0.0%
;;BITSFR3              0      0       0       4        0.0%
;;SFR3                 0      0       0       4        0.0%
;;BANK0               50     2A      4F       5       98.8%
;;BITSFR2              0      0       0       5        0.0%
;;SFR2                 0      0       0       5        0.0%
;;DATA                 0      0      E8       6        0.0%
;;BITBANK1            50      0       0       7        0.0%
;;BANK1               50      0      3C       8       75.0%
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
;;		_vHandle20sTimeron
;;		_vHandle20sTimerOut
;;		_setPA6
;;		_clearPinPortAndTimer
;;		_startThreeHoursTimer
;;		_isFinishedThreeHoursTimer
;;		_clearThreeHoursTimer
;;		_setPA2
;;		_setPB6
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
	
l4999:	
;main.c: 682: static unsigned char bCheckTweHour = 0;
;main.c: 688: initPin();
	fcall	_initPin
	line	691
	
l5001:	
;main.c: 691: TRISB3 = 1;
	bsf	(1075/8)^080h,(1075)&7
	line	693
	
l5003:	
;main.c: 693: TRISB5 = 1;
	bsf	(1077/8)^080h,(1077)&7
	line	695
	
l5005:	
;main.c: 695: TRISA7 = 1;
	bsf	(1071/8)^080h,(1071)&7
	line	697
	
l5007:	
;main.c: 697: TRISA6 = 1;
	bsf	(1070/8)^080h,(1070)&7
	line	699
	
l5009:	
;main.c: 699: clock_config();
	fcall	_clock_config
	line	700
	
l5011:	
;main.c: 700: timer1_config();
	fcall	_timer1_config
	line	701
;main.c: 701: timer1_interrupt_config();
	fcall	_timer1_interrupt_config
	line	703
	
l5013:	
;main.c: 703: adc_test_init(0,3);
	movlw	(03h)
	bcf	status, 5	;RP0=0, select bank0
	movwf	(?_adc_test_init)
	movlw	(0)
	fcall	_adc_test_init
	line	710
	
l5015:	
;main.c: 710: adc_start();
	fcall	_adc_start
	line	723
;main.c: 723: startTwentyMinuteTimer(1200);
	movlw	low(04B0h)
	movwf	(?_startTwentyMinuteTimer)
	movlw	high(04B0h)
	movwf	((?_startTwentyMinuteTimer))+1
	fcall	_startTwentyMinuteTimer
	line	728
	
l5017:	
# 728 "C:\temp\dev\AK7030-OTP\main.c"
 clrwdt ;#
psect	maintext
	line	730
;main.c: 730: process_AD_Converter_Value();
	fcall	_process_AD_Converter_Value
	line	732
	
l5019:	
;main.c: 732: if( isPermitSampleTime() )
	fcall	_isPermitSampleTime
	xorlw	0
	skipnz
	goto	u2181
	goto	u2180
u2181:
	goto	l5017
u2180:
	line	736
	
l5021:	
;main.c: 733: {
;main.c: 736: clrSampeTime();
	fcall	_clrSampeTime
	line	751
;main.c: 751: switch(enumMainLoopStep)
	goto	l5601
	line	761
	
l5023:	
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
	goto	u2191
	goto	u2190
u2191:
	goto	l5027
u2190:
	line	763
	
l5025:	
;main.c: 762: {
;main.c: 763: ucTimerZeroPoint5s++;
	incf	(main@ucTimerZeroPoint5s),f
	line	764
;main.c: 764: }
	goto	l5029
	line	766
	
l5027:	
;main.c: 765: else
;main.c: 766: ucTimerZeroPoint5s = 0;
	clrf	(main@ucTimerZeroPoint5s)
	line	768
	
l5029:	
;main.c: 768: if(ucTimerZeroPoint5s >= 5)
	movlw	(05h)
	subwf	(main@ucTimerZeroPoint5s),w
	skipc
	goto	u2201
	goto	u2200
u2201:
	goto	l5035
u2200:
	line	770
	
l5031:	
;main.c: 769: {
;main.c: 770: ucTimerZeroPoint5s = 0;
	clrf	(main@ucTimerZeroPoint5s)
	line	771
	
l5033:	
;main.c: 771: enumMainLoopStep = MAIN_LOOP_STEP_FIRST;
	clrf	(_enumMainLoopStep)
	incf	(_enumMainLoopStep),f
	line	774
	
l5035:	
;main.c: 772: }
;main.c: 774: if(isFinishedTwentyMinuteTimer())
	fcall	_isFinishedTwentyMinuteTimer
	xorlw	0
	skipnz
	goto	u2211
	goto	u2210
u2211:
	goto	l5017
u2210:
	line	775
	
l5037:	
;main.c: 775: enumMainLoopStep = MAIN_LOOP_STEP_10_HOUR_END;
	movlw	(09h)
	bcf	status, 5	;RP0=0, select bank0
	movwf	(_enumMainLoopStep)
	goto	l5017
	
l774:	
	line	776
;main.c: 776: break;
	goto	l5017
	line	790
	
l5039:	
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
	goto	u2221
	goto	u2220
u2221:
	goto	l5051
u2220:
	line	792
	
l5041:	
;main.c: 791: {
;main.c: 792: ucTimerCntP3s++;
	incf	(main@ucTimerCntP3s),f
	line	793
	
l5043:	
;main.c: 793: if(ucTimerCntP3s >= 3)
	movlw	(03h)
	subwf	(main@ucTimerCntP3s),w
	skipc
	goto	u2231
	goto	u2230
u2231:
	goto	l774
u2230:
	line	795
	
l5045:	
;main.c: 794: {
;main.c: 795: ucTimerCntP3s = 0;
	clrf	(main@ucTimerCntP3s)
	line	797
	
l5047:	
;main.c: 797: enumMainLoopStep = MAIN_LOOP_STEP_SECOND;
	movlw	(02h)
	movwf	(_enumMainLoopStep)
	line	799
	
l5049:	
;main.c: 799: ucTimerZeroPoint3s = 0;
	clrf	(main@ucTimerZeroPoint3s)
	goto	l5017
	line	805
	
l5051:	
;main.c: 803: else
;main.c: 804: {
;main.c: 805: ucTimerZeroPoint3s++;
	incf	(main@ucTimerZeroPoint3s),f
	line	807
	
l5053:	
;main.c: 807: if(ucTimerZeroPoint3s >= 3)
	movlw	(03h)
	subwf	(main@ucTimerZeroPoint3s),w
	skipc
	goto	u2241
	goto	u2240
u2241:
	goto	l774
u2240:
	line	809
	
l5055:	
;main.c: 808: {
;main.c: 809: ucTimerZeroPoint3s = 0;
	clrf	(main@ucTimerZeroPoint3s)
	line	811
	
l5057:	
;main.c: 811: clearParaFunction1();
	fcall	_clearParaFunction1
	goto	l5017
	line	826
	
l5059:	
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
	
l5061:	
;main.c: 829: if(ucTimerP5s < 5)
	movlw	(05h)
	subwf	(main@ucTimerP5s),w
	skipnc
	goto	u2251
	goto	u2250
u2251:
	goto	l5065
u2250:
	line	830
	
l5063:	
;main.c: 830: ucTimerP5s++;
	incf	(main@ucTimerP5s),f
	goto	l5017
	line	833
	
l5065:	
;main.c: 831: else
;main.c: 832: {
;main.c: 833: ucTimerP5s = 0;
	clrf	(main@ucTimerP5s)
	line	835
	
l5067:	
;main.c: 835: startTwentyMinuteTimer(1200);
	movlw	low(04B0h)
	movwf	(?_startTwentyMinuteTimer)
	movlw	high(04B0h)
	movwf	((?_startTwentyMinuteTimer))+1
	fcall	_startTwentyMinuteTimer
	line	837
	
l5069:	
;main.c: 837: enumMainLoopStep = MAIN_LOOP_STEP_THIRD;
	movlw	(03h)
	bcf	status, 5	;RP0=0, select bank0
	movwf	(_enumMainLoopStep)
	goto	l5017
	line	856
	
l5071:	
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
	goto	u2261
	goto	u2260
u2261:
	goto	l5077
u2260:
	line	858
	
l5073:	
;main.c: 857: {
;main.c: 858: ucTimerLargeZeroP5s = 0;
	clrf	(main@ucTimerLargeZeroP5s)
	line	860
	
l5075:	
;main.c: 860: ucTimerLessZeroP5s++;
	incf	(main@ucTimerLessZeroP5s),f
	line	861
;main.c: 861: }
	goto	l5083
	line	864
	
l5077:	
;main.c: 862: else
;main.c: 863: {
;main.c: 864: ucTimerLargeZeroP5s++;
	incf	(main@ucTimerLargeZeroP5s),f
	line	866
	
l5079:	
;main.c: 866: ucTimerLessZeroP5s = 0;
	clrf	(main@ucTimerLessZeroP5s)
	line	868
	
l5081:	
;main.c: 868: ucTimerRightP5s = 0;
	clrf	(main@ucTimerRightP5s)
	line	871
	
l5083:	
;main.c: 869: }
;main.c: 871: if(ucTimerLargeZeroP5s >= 3)
	movlw	(03h)
	subwf	(main@ucTimerLargeZeroP5s),w
	skipc
	goto	u2271
	goto	u2270
u2271:
	goto	l5089
u2270:
	line	873
	
l5085:	
;main.c: 872: {
;main.c: 873: ucTimerLargeZeroP5s = 0;
	clrf	(main@ucTimerLargeZeroP5s)
	line	874
	
l5087:	
;main.c: 874: enumMainLoopStep = MAIN_LOOP_STEP_FOURTH;
	movlw	(04h)
	movwf	(_enumMainLoopStep)
	line	875
;main.c: 875: }
	goto	l5103
	line	876
	
l5089:	
;main.c: 876: else if( ucTimerLessZeroP5s >= 3)
	movlw	(03h)
	subwf	(main@ucTimerLessZeroP5s),w
	skipc
	goto	u2281
	goto	u2280
u2281:
	goto	l5103
u2280:
	line	879
	
l5091:	
;main.c: 877: {
;main.c: 879: if(getAdOriginalCh6Value() < 65)
	fcall	_getAdOriginalCh6Value
	movlw	high(041h)
	subwf	(1+(?_getAdOriginalCh6Value)),w
	movlw	low(041h)
	skipnz
	subwf	(0+(?_getAdOriginalCh6Value)),w
	skipnc
	goto	u2291
	goto	u2290
u2291:
	goto	l5095
u2290:
	line	881
	
l5093:	
;main.c: 880: {
;main.c: 881: ucTimerRightP5s++;
	incf	(main@ucTimerRightP5s),f
	line	882
;main.c: 882: }
	goto	l5097
	line	885
	
l5095:	
;main.c: 883: else
;main.c: 884: {
;main.c: 885: ucTimerRightP5s = 0;
	clrf	(main@ucTimerRightP5s)
	line	888
	
l5097:	
;main.c: 886: }
;main.c: 888: if(ucTimerRightP5s >= 3)
	movlw	(03h)
	subwf	(main@ucTimerRightP5s),w
	skipc
	goto	u2301
	goto	u2300
u2301:
	goto	l806
u2300:
	line	890
	
l5099:	
;main.c: 889: {
;main.c: 890: ucTimerLargeZeroP5s = 0;
	clrf	(main@ucTimerLargeZeroP5s)
	line	891
;main.c: 891: ucTimerRightP5s = 0;
	clrf	(main@ucTimerRightP5s)
	line	892
	
l5101:	
;main.c: 892: enumMainLoopStep = MAIN_LOOP_STEP_3_HOUR_BRANCH;
	movlw	(08h)
	movwf	(_enumMainLoopStep)
	line	893
;main.c: 893: }
	goto	l5103
	line	902
;main.c: 899: else
;main.c: 900: {
;main.c: 901: ;
	
l806:	
	line	904
	
l5103:	
;main.c: 902: }
;main.c: 904: if((MAIN_LOOP_STEP_3_HOUR_BRANCH == enumMainLoopStep) || (MAIN_LOOP_STEP_FOURTH == enumMainLoopStep))
	movf	(_enumMainLoopStep),w
	xorlw	08h
	skipnz
	goto	u2311
	goto	u2310
u2311:
	goto	l5107
u2310:
	
l5105:	
	movf	(_enumMainLoopStep),w
	xorlw	04h
	skipz
	goto	u2321
	goto	u2320
u2321:
	goto	l774
u2320:
	line	906
	
l5107:	
;main.c: 905: {
;main.c: 906: ucTimerRightP5s = 0;
	clrf	(main@ucTimerRightP5s)
	line	907
;main.c: 907: ucTimerLargeZeroP5s = 0;
	clrf	(main@ucTimerLargeZeroP5s)
	line	908
;main.c: 908: ucTimerLessZeroP5s = 0;
	clrf	(main@ucTimerLessZeroP5s)
	goto	l5017
	line	922
	
l5109:	
;main.c: 916: {
;main.c: 922: startTwelveHourTimer(36000);
	movlw	low(08CA0h)
	movwf	(?_startTwelveHourTimer)
	movlw	high(08CA0h)
	movwf	((?_startTwelveHourTimer))+1
	fcall	_startTwelveHourTimer
	line	923
	
l5111:	
;main.c: 923: enumMainLoopStep = MAIN_LOOP_STEP_FIFTH;
	movlw	(05h)
	bcf	status, 5	;RP0=0, select bank0
	movwf	(_enumMainLoopStep)
	line	925
	
l5113:	
;main.c: 925: bCheckTweHour = 0;
	clrf	(main@bCheckTweHour)
	line	927
;main.c: 927: break;
	goto	l5017
	line	935
	
l5115:	
;main.c: 931: {
;main.c: 935: if(( isFinishedTwelveHoursTimer() && (! bCheckTweHour)))
	fcall	_isFinishedTwelveHoursTimer
	xorlw	0
	skipnz
	goto	u2331
	goto	u2330
u2331:
	goto	l5495
u2330:
	
l5117:	
	bcf	status, 5	;RP0=0, select bank0
	movf	(main@bCheckTweHour),f
	skipz
	goto	u2341
	goto	u2340
u2341:
	goto	l5495
u2340:
	line	937
	
l5119:	
;main.c: 936: {
;main.c: 937: enumMainLoopStep = MAIN_LOOP_STEP_10_HOUR_END;
	movlw	(09h)
	movwf	(_enumMainLoopStep)
	line	938
	
l5121:	
;main.c: 938: bCheckTweHour = 1;
	clrf	(main@bCheckTweHour)
	incf	(main@bCheckTweHour),f
	line	939
;main.c: 939: }
	goto	l5017
	line	945
;main.c: 944: {
;main.c: 945: case ADC4_STEP_INIT:
	
l815:	
	line	951
;main.c: 946: {
;main.c: 951: ucADC4_Step = ADC4_STEP_FIRST;
	clrf	(_ucADC4_Step)
	incf	(_ucADC4_Step),f
	line	952
;main.c: 952: break;
	goto	l5017
	line	964
	
l5123:	
	line	966
	
l5125:	
;main.c: 966: uiCh5Value = getAdOriginalCh5Value();
	fcall	_getAdOriginalCh5Value
	movf	(1+(?_getAdOriginalCh5Value)),w
	movwf	(main@uiCh5Value+1)
	movf	(0+(?_getAdOriginalCh5Value)),w
	movwf	(main@uiCh5Value)
	line	968
	
l5127:	
;main.c: 968: if( 0 == bInitFlag)
	movf	(main@bInitFlag),f
	skipz
	goto	u2351
	goto	u2350
u2351:
	goto	l5133
u2350:
	line	970
	
l5129:	
;main.c: 969: {
;main.c: 970: bInitFlag = 1;
	clrf	(main@bInitFlag)
	incf	(main@bInitFlag),f
	line	971
	
l5131:	
;main.c: 971: uiOldValue = uiCh5Value;
	movf	(main@uiCh5Value+1),w
	movwf	(main@uiOldValue+1)
	movf	(main@uiCh5Value),w
	movwf	(main@uiOldValue)
	line	981
	
l5133:	
;main.c: 972: }
;main.c: 981: if(LESS_THAN_1911 == ucChannel5Type)
	movf	(_ucChannel5Type),f
	skipz
	goto	u2361
	goto	u2360
u2361:
	goto	l5139
u2360:
	line	983
	
l5135:	
;main.c: 982: {
;main.c: 983: uiMinValue = 0;
	bsf	status, 5	;RP0=1, select bank1
	clrf	(main@uiMinValue)^080h
	clrf	(main@uiMinValue+1)^080h
	line	984
	
l5137:	
;main.c: 984: uiMaxValue = 1931;
	movlw	low(078Bh)
	movwf	(main@uiMaxValue)^080h
	movlw	high(078Bh)
	movwf	((main@uiMaxValue)^080h)+1
	line	985
;main.c: 985: }
	goto	l828
	line	986
	
l5139:	
;main.c: 986: else if(BETWEEN_1911_AND_2067 == ucChannel5Type)
	decf	(_ucChannel5Type),w
	skipz
	goto	u2371
	goto	u2370
u2371:
	goto	l5143
u2370:
	line	988
	
l5141:	
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
	goto	l828
	line	991
	
l5143:	
;main.c: 991: else if(BETWEEN_2067_AND_2204 == ucChannel5Type)
	movf	(_ucChannel5Type),w
	xorlw	02h
	skipz
	goto	u2381
	goto	u2380
u2381:
	goto	l5147
u2380:
	line	993
	
l5145:	
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
	goto	l828
	line	996
	
l5147:	
;main.c: 996: else if(BETWEEN_2204_AND_2340 == ucChannel5Type)
	movf	(_ucChannel5Type),w
	xorlw	03h
	skipz
	goto	u2391
	goto	u2390
u2391:
	goto	l5151
u2390:
	line	998
	
l5149:	
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
	goto	l828
	line	1003
	
l5151:	
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
	
l828:	
	line	1009
;main.c: 1005: }
;main.c: 1008: if(( uiCh5Value < uiMinValue )
;main.c: 1009: || ( uiCh5Value > uiMaxValue ))
	movf	(main@uiMinValue+1)^080h,w
	bcf	status, 5	;RP0=0, select bank0
	subwf	(main@uiCh5Value+1),w
	skipz
	goto	u2405
	bsf	status, 5	;RP0=1, select bank1
	movf	(main@uiMinValue)^080h,w
	bcf	status, 5	;RP0=0, select bank0
	subwf	(main@uiCh5Value),w
u2405:
	skipc
	goto	u2401
	goto	u2400
u2401:
	goto	l5155
u2400:
	
l5153:	
	movf	(main@uiCh5Value+1),w
	bsf	status, 5	;RP0=1, select bank1
	subwf	(main@uiMaxValue+1)^080h,w
	skipz
	goto	u2415
	bcf	status, 5	;RP0=0, select bank0
	movf	(main@uiCh5Value),w
	bsf	status, 5	;RP0=1, select bank1
	subwf	(main@uiMaxValue)^080h,w
u2415:
	skipnc
	goto	u2411
	goto	u2410
u2411:
	goto	l835
u2410:
	line	1011
	
l5155:	
;main.c: 1010: {
;main.c: 1011: uiOldValue = uiCh5Value;
	bcf	status, 5	;RP0=0, select bank0
	movf	(main@uiCh5Value+1),w
	movwf	(main@uiOldValue+1)
	movf	(main@uiCh5Value),w
	movwf	(main@uiOldValue)
	line	1012
	
l835:	
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
	goto	u2421
	goto	u2420
u2421:
	goto	l5159
u2420:
	line	1015
	
l5157:	
;main.c: 1015: ucChannel5Type = LESS_THAN_1911;
	clrf	(_ucChannel5Type)
	goto	l839
	line	1016
	
l5159:	
;main.c: 1016: else if( uiOldValue < 2047 )
	movlw	high(07FFh)
	subwf	(main@uiOldValue+1),w
	movlw	low(07FFh)
	skipnz
	subwf	(main@uiOldValue),w
	skipnc
	goto	u2431
	goto	u2430
u2431:
	goto	l5163
u2430:
	line	1017
	
l5161:	
;main.c: 1017: ucChannel5Type = BETWEEN_1911_AND_2067;
	clrf	(_ucChannel5Type)
	incf	(_ucChannel5Type),f
	goto	l839
	line	1018
	
l5163:	
;main.c: 1018: else if( uiOldValue < 2164 )
	movlw	high(0874h)
	subwf	(main@uiOldValue+1),w
	movlw	low(0874h)
	skipnz
	subwf	(main@uiOldValue),w
	skipnc
	goto	u2441
	goto	u2440
u2441:
	goto	l5167
u2440:
	line	1019
	
l5165:	
;main.c: 1019: ucChannel5Type = BETWEEN_2067_AND_2204;
	movlw	(02h)
	movwf	(_ucChannel5Type)
	goto	l839
	line	1020
	
l5167:	
;main.c: 1020: else if( uiOldValue < 2281 )
	movlw	high(08E9h)
	subwf	(main@uiOldValue+1),w
	movlw	low(08E9h)
	skipnz
	subwf	(main@uiOldValue),w
	skipnc
	goto	u2451
	goto	u2450
u2451:
	goto	l5171
u2450:
	line	1021
	
l5169:	
;main.c: 1021: ucChannel5Type = BETWEEN_2204_AND_2340;
	movlw	(03h)
	movwf	(_ucChannel5Type)
	goto	l839
	line	1023
	
l5171:	
;main.c: 1022: else
;main.c: 1023: ucChannel5Type = MORE_THAN_2340;
	movlw	(04h)
	movwf	(_ucChannel5Type)
	
l839:	
	line	1025
;main.c: 1025: ucADC4_Step = ADC4_STEP_SECOND;
	movlw	(02h)
	movwf	(_ucADC4_Step)
	line	1026
;main.c: 1026: break;
	goto	l5017
	line	1046
	
l5173:	
;main.c: 1045: {
;main.c: 1046: setPA1(1);
	movlw	(01h)
	fcall	_setPA1
	line	1047
	
l5175:	
;main.c: 1047: ucLoaderStep++;
	incf	(main@ucLoaderStep),f
	line	1048
;main.c: 1048: break;
	goto	l5017
	line	1053
	
l5177:	
;main.c: 1052: {
;main.c: 1053: if(ucTimerDelay >= 5)
	movlw	(05h)
	subwf	(main@ucTimerDelay),w
	skipc
	goto	u2461
	goto	u2460
u2461:
	goto	l5185
u2460:
	line	1055
	
l5179:	
;main.c: 1054: {
;main.c: 1055: setPA0(1);
	movlw	(01h)
	fcall	_setPA0
	line	1056
	
l5181:	
;main.c: 1056: ucTimerDelay = 0;
	clrf	(main@ucTimerDelay)
	goto	l5175
	line	1060
	
l5185:	
;main.c: 1059: else
;main.c: 1060: ucTimerDelay++;
	incf	(main@ucTimerDelay),f
	goto	l5017
	line	1066
	
l5187:	
;main.c: 1065: {
;main.c: 1066: if(ucTimerDelay >= 5)
	movlw	(05h)
	subwf	(main@ucTimerDelay),w
	skipc
	goto	u2471
	goto	u2470
u2471:
	goto	l5185
u2470:
	line	1068
	
l5189:	
;main.c: 1067: {
;main.c: 1068: setPB0(1);
	movlw	(01h)
	fcall	_setPB0
	goto	l5181
	line	1080
	
l5197:	
;main.c: 1079: {
;main.c: 1080: if(ucTimerDelay >= 5)
	movlw	(05h)
	subwf	(main@ucTimerDelay),w
	skipc
	goto	u2481
	goto	u2480
u2481:
	goto	l5185
u2480:
	line	1082
	
l5199:	
;main.c: 1081: {
;main.c: 1082: setPB1(1);
	movlw	(01h)
	fcall	_setPB1
	goto	l5181
	line	1093
	
l5207:	
;main.c: 1092: {
;main.c: 1093: if(ucTimerDelay >= 5)
	movlw	(05h)
	subwf	(main@ucTimerDelay),w
	skipc
	goto	u2491
	goto	u2490
u2491:
	goto	l5185
u2490:
	line	1095
	
l5209:	
;main.c: 1094: {
;main.c: 1095: setPB2(1);
	movlw	(01h)
	fcall	_setPB2
	goto	l5181
	line	1106
	
l5217:	
;main.c: 1105: {
;main.c: 1106: if(ucTimerDelay >= 5)
	movlw	(05h)
	subwf	(main@ucTimerDelay),w
	skipc
	goto	u2501
	goto	u2500
u2501:
	goto	l5185
u2500:
	line	1108
	
l5219:	
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
	goto	l5181
	line	1123
	
l5227:	
;main.c: 1122: {
;main.c: 1123: if(ucTimerDelay >= 1)
	movf	(main@ucTimerDelay),w
	skipz
	goto	u2510
	goto	l5185
u2510:
	line	1125
	
l5229:	
;main.c: 1124: {
;main.c: 1125: ucTimerDelay = 0;
	clrf	(main@ucTimerDelay)
	line	1127
;main.c: 1127: ucLoaderStep = 0;
	clrf	(main@ucLoaderStep)
	line	1128
	
l5231:	
;main.c: 1128: ucADC4_Step = ADC4_STEP_THIRD;
	movlw	(03h)
	movwf	(_ucADC4_Step)
	line	1129
;main.c: 1129: }
	goto	l5017
	line	1042
	
l5237:	
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
goto l774
movlw high(S5819)
movwf pclath
	clrc
	rlf fsr,w
	addlw low(S5819)
	movwf pc
psect	swtext1,local,class=CONST,delta=2
global __pswtext1
__pswtext1:
S5819:
	ljmp	l5173
	ljmp	l5177
	ljmp	l5187
	ljmp	l5197
	ljmp	l5207
	ljmp	l5217
	ljmp	l5227
psect	maintext

	line	1151
	
l5239:	
;main.c: 1150: {
;main.c: 1151: setPA1(1);
	movlw	(01h)
	fcall	_setPA1
	line	1152
	
l5241:	
;main.c: 1152: ucLoaderStep1++;
	incf	(main@ucLoaderStep1),f
	line	1153
;main.c: 1153: break;
	goto	l5017
	line	1158
	
l5243:	
;main.c: 1157: {
;main.c: 1158: if(ucTimerDelay1 >= 5)
	movlw	(05h)
	subwf	(main@ucTimerDelay1),w
	skipc
	goto	u2521
	goto	u2520
u2521:
	goto	l5251
u2520:
	line	1160
	
l5245:	
;main.c: 1159: {
;main.c: 1160: setPA0(1);
	movlw	(01h)
	fcall	_setPA0
	line	1161
	
l5247:	
;main.c: 1161: ucTimerDelay1 = 0;
	clrf	(main@ucTimerDelay1)
	goto	l5241
	line	1165
	
l5251:	
;main.c: 1164: else
;main.c: 1165: ucTimerDelay1++;
	incf	(main@ucTimerDelay1),f
	goto	l5017
	line	1171
	
l5253:	
;main.c: 1170: {
;main.c: 1171: if(ucTimerDelay1 >= 5)
	movlw	(05h)
	subwf	(main@ucTimerDelay1),w
	skipc
	goto	u2531
	goto	u2530
u2531:
	goto	l5251
u2530:
	line	1173
	
l5255:	
;main.c: 1172: {
;main.c: 1173: setPB0(1);
	movlw	(01h)
	fcall	_setPB0
	goto	l5247
	line	1184
	
l5263:	
;main.c: 1183: {
;main.c: 1184: if(ucTimerDelay1 >= 5)
	movlw	(05h)
	subwf	(main@ucTimerDelay1),w
	skipc
	goto	u2541
	goto	u2540
u2541:
	goto	l5251
u2540:
	line	1187
	
l5265:	
;main.c: 1185: {
;main.c: 1187: setPB1(1);
	movlw	(01h)
	fcall	_setPB1
	goto	l5247
	line	1198
	
l5273:	
;main.c: 1197: {
;main.c: 1198: if(ucTimerDelay1 >= 5)
	movlw	(05h)
	subwf	(main@ucTimerDelay1),w
	skipc
	goto	u2551
	goto	u2550
u2551:
	goto	l5251
u2550:
	line	1201
	
l5275:	
;main.c: 1199: {
;main.c: 1201: setPB2(1);
	movlw	(01h)
	fcall	_setPB2
	goto	l5247
	line	1212
	
l5283:	
;main.c: 1211: {
;main.c: 1212: if(ucTimerDelay1 >= 5)
	movlw	(05h)
	subwf	(main@ucTimerDelay1),w
	skipc
	goto	u2561
	goto	u2560
u2561:
	goto	l5251
u2560:
	line	1214
	
l5285:	
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
	goto	l5247
	line	1231
	
l5293:	
;main.c: 1230: {
;main.c: 1231: if(ucTimerDelay1 >= 1)
	movf	(main@ucTimerDelay1),w
	skipz
	goto	u2570
	goto	l5251
u2570:
	line	1233
	
l5295:	
;main.c: 1232: {
;main.c: 1233: ucTimerDelay1 = 0;
	clrf	(main@ucTimerDelay1)
	line	1235
;main.c: 1235: ucLoaderStep1 = 0;
	clrf	(main@ucLoaderStep1)
	goto	l5231
	line	1147
	
l5303:	
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
goto l774
movlw high(S5821)
movwf pclath
	clrc
	rlf fsr,w
	addlw low(S5821)
	movwf pc
psect	swtext2,local,class=CONST,delta=2
global __pswtext2
__pswtext2:
S5821:
	ljmp	l5239
	ljmp	l5243
	ljmp	l5253
	ljmp	l5263
	ljmp	l5273
	ljmp	l5283
	ljmp	l5293
psect	maintext

	line	1261
	
l5305:	
;main.c: 1259: {
;main.c: 1261: setPA1(1);
	movlw	(01h)
	fcall	_setPA1
	line	1263
;main.c: 1263: setPA0(1);
	movlw	(01h)
	fcall	_setPA0
	line	1264
	
l5307:	
;main.c: 1264: ucLoaderStep2++;
	incf	(main@ucLoaderStep2),f
	line	1265
;main.c: 1265: break;
	goto	l5017
	line	1270
	
l5309:	
;main.c: 1269: {
;main.c: 1270: if(ucTimerDelay2 >= 5)
	movlw	(05h)
	subwf	(main@ucTimerDelay2),w
	skipc
	goto	u2581
	goto	u2580
u2581:
	goto	l5317
u2580:
	line	1273
	
l5311:	
;main.c: 1271: {
;main.c: 1273: setPB0(1);
	movlw	(01h)
	fcall	_setPB0
	line	1274
	
l5313:	
;main.c: 1274: ucTimerDelay2 = 0;
	clrf	(main@ucTimerDelay2)
	goto	l5307
	line	1278
	
l5317:	
;main.c: 1277: else
;main.c: 1278: ucTimerDelay2++;
	incf	(main@ucTimerDelay2),f
	goto	l5017
	line	1284
	
l5319:	
;main.c: 1283: {
;main.c: 1284: if(ucTimerDelay2 >= 5)
	movlw	(05h)
	subwf	(main@ucTimerDelay2),w
	skipc
	goto	u2591
	goto	u2590
u2591:
	goto	l5317
u2590:
	line	1287
	
l5321:	
;main.c: 1285: {
;main.c: 1287: setPB1(1);
	movlw	(01h)
	fcall	_setPB1
	goto	l5313
	line	1298
	
l5329:	
;main.c: 1297: {
;main.c: 1298: if(ucTimerDelay2 >= 5)
	movlw	(05h)
	subwf	(main@ucTimerDelay2),w
	skipc
	goto	u2601
	goto	u2600
u2601:
	goto	l5317
u2600:
	line	1301
	
l5331:	
;main.c: 1299: {
;main.c: 1301: setPB2(1);
	movlw	(01h)
	fcall	_setPB2
	goto	l5313
	line	1312
	
l5339:	
;main.c: 1311: {
;main.c: 1312: if(ucTimerDelay2 >= 5)
	movlw	(05h)
	subwf	(main@ucTimerDelay2),w
	skipc
	goto	u2611
	goto	u2610
u2611:
	goto	l5317
u2610:
	line	1316
	
l5341:	
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
	goto	l5313
	line	1331
	
l5349:	
;main.c: 1330: {
;main.c: 1331: if(ucTimerDelay2 >= 1)
	movf	(main@ucTimerDelay2),w
	skipz
	goto	u2620
	goto	l5317
u2620:
	line	1333
	
l5351:	
;main.c: 1332: {
;main.c: 1333: ucTimerDelay2 = 0;
	clrf	(main@ucTimerDelay2)
	line	1335
;main.c: 1335: ucLoaderStep2 = 0;
	clrf	(main@ucLoaderStep2)
	goto	l5231
	line	1256
	
l5359:	
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
goto l774
movlw high(S5823)
movwf pclath
	clrc
	rlf fsr,w
	addlw low(S5823)
	movwf pc
psect	swtext3,local,class=CONST,delta=2
global __pswtext3
__pswtext3:
S5823:
	ljmp	l5305
	ljmp	l5309
	ljmp	l5319
	ljmp	l5329
	ljmp	l5339
	ljmp	l5349
psect	maintext

	line	1361
	
l5361:	
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
	
l5363:	
;main.c: 1366: ucLoaderStep3++;
	incf	(main@ucLoaderStep3),f
	line	1367
;main.c: 1367: break;
	goto	l5017
	line	1372
	
l5365:	
;main.c: 1371: {
;main.c: 1372: if(ucTimerDelay3 >= 5)
	movlw	(05h)
	subwf	(main@ucTimerDelay3),w
	skipc
	goto	u2631
	goto	u2630
u2631:
	goto	l5373
u2630:
	line	1375
	
l5367:	
;main.c: 1373: {
;main.c: 1375: setPB1(1);
	movlw	(01h)
	fcall	_setPB1
	line	1376
	
l5369:	
;main.c: 1376: ucTimerDelay3 = 0;
	clrf	(main@ucTimerDelay3)
	goto	l5363
	line	1380
	
l5373:	
;main.c: 1379: else
;main.c: 1380: ucTimerDelay3++;
	incf	(main@ucTimerDelay3),f
	goto	l5017
	line	1386
	
l5375:	
;main.c: 1385: {
;main.c: 1386: if(ucTimerDelay3 >= 5)
	movlw	(05h)
	subwf	(main@ucTimerDelay3),w
	skipc
	goto	u2641
	goto	u2640
u2641:
	goto	l5373
u2640:
	line	1389
	
l5377:	
;main.c: 1387: {
;main.c: 1389: setPB2(1);
	movlw	(01h)
	fcall	_setPB2
	goto	l5369
	line	1401
	
l5385:	
;main.c: 1400: {
;main.c: 1401: if(ucTimerDelay3 >= 5)
	movlw	(05h)
	subwf	(main@ucTimerDelay3),w
	skipc
	goto	u2651
	goto	u2650
u2651:
	goto	l5373
u2650:
	line	1405
	
l5387:	
;main.c: 1402: {
;main.c: 1405: setPB1(0);
	movlw	(0)
	fcall	_setPB1
	line	1407
;main.c: 1407: setPB2(0);
	movlw	(0)
	fcall	_setPB2
	goto	l5369
	line	1418
	
l5395:	
;main.c: 1417: {
;main.c: 1418: if(ucTimerDelay3 >= 1)
	movf	(main@ucTimerDelay3),w
	skipz
	goto	u2660
	goto	l5373
u2660:
	line	1420
	
l5397:	
;main.c: 1419: {
;main.c: 1420: ucTimerDelay3 = 0;
	clrf	(main@ucTimerDelay3)
	line	1422
;main.c: 1422: ucLoaderStep3 = 0;
	clrf	(main@ucLoaderStep3)
	goto	l5231
	line	1356
	
l5405:	
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
	goto	l5361
	xorlw	1^0	; case 1
	skipnz
	goto	l5365
	xorlw	2^1	; case 2
	skipnz
	goto	l5375
	xorlw	3^2	; case 3
	skipnz
	goto	l5385
	xorlw	4^3	; case 4
	skipnz
	goto	l5395
	goto	l774
	opt asmopt_on

	line	1448
	
l5407:	
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
	
l5409:	
;main.c: 1455: ucLoaderStep4++;
	incf	(main@ucLoaderStep4),f
	line	1456
;main.c: 1456: break;
	goto	l5017
	line	1461
	
l5411:	
;main.c: 1460: {
;main.c: 1461: if(ucTimerDelay4 >= 5)
	movlw	(05h)
	subwf	(main@ucTimerDelay4),w
	skipc
	goto	u2671
	goto	u2670
u2671:
	goto	l5419
u2670:
	line	1464
	
l5413:	
;main.c: 1462: {
;main.c: 1464: setPB2(1);
	movlw	(01h)
	fcall	_setPB2
	line	1465
	
l5415:	
;main.c: 1465: ucTimerDelay4 = 0;
	clrf	(main@ucTimerDelay4)
	goto	l5409
	line	1469
	
l5419:	
;main.c: 1468: else
;main.c: 1469: ucTimerDelay4++;
	incf	(main@ucTimerDelay4),f
	goto	l5017
	line	1475
	
l5421:	
;main.c: 1474: {
;main.c: 1475: if(ucTimerDelay4 >= 5)
	movlw	(05h)
	subwf	(main@ucTimerDelay4),w
	skipc
	goto	u2681
	goto	u2680
u2681:
	goto	l5419
u2680:
	line	1478
	
l5423:	
;main.c: 1476: {
;main.c: 1478: setPB2(0);
	movlw	(0)
	fcall	_setPB2
	goto	l5415
	line	1489
	
l5431:	
;main.c: 1488: {
;main.c: 1489: if(ucTimerDelay4 >= 1)
	movf	(main@ucTimerDelay4),w
	skipz
	goto	u2690
	goto	l5419
u2690:
	line	1491
	
l5433:	
;main.c: 1490: {
;main.c: 1491: ucTimerDelay4 = 0;
	clrf	(main@ucTimerDelay4)
	line	1493
;main.c: 1493: ucLoaderStep4 = 0;
	clrf	(main@ucLoaderStep4)
	goto	l5231
	line	1443
	
l5441:	
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
	goto	l5407
	xorlw	1^0	; case 1
	skipnz
	goto	l5411
	xorlw	2^1	; case 2
	skipnz
	goto	l5421
	xorlw	3^2	; case 3
	skipnz
	goto	l5431
	goto	l774
	opt asmopt_on

	line	1035
	
l5445:	
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
	goto	l5237
	xorlw	1^0	; case 1
	skipnz
	goto	l5303
	xorlw	2^1	; case 2
	skipnz
	goto	l5359
	xorlw	3^2	; case 3
	skipnz
	goto	l5405
	xorlw	4^3	; case 4
	skipnz
	goto	l5441
	goto	l774
	opt asmopt_on

	line	1525
	
l5447:	
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
	goto	u2701
	goto	u2700
u2701:
	goto	l5451
u2700:
	line	1528
	
l5449:	
;main.c: 1526: {
;main.c: 1528: ucTimerDelayP2sLess = 0;
	clrf	(main@ucTimerDelayP2sLess)
	line	1529
;main.c: 1529: ucTimerDelayP2sMore = 0;
	clrf	(main@ucTimerDelayP2sMore)
	line	1530
;main.c: 1530: }
	goto	l974
	line	1533
	
l5451:	
;main.c: 1531: else
;main.c: 1532: {
;main.c: 1533: ucTimerDelayP2sMore++;
	incf	(main@ucTimerDelayP2sMore),f
	line	1534
	
l5453:	
;main.c: 1534: ucTimerDelayP2sLess = 0;
	clrf	(main@ucTimerDelayP2sLess)
	line	1538
	
l974:	
	line	1541
;main.c: 1541: if(ucTimerDelayP2sMore > 200)
	movlw	(0C9h)
	subwf	(main@ucTimerDelayP2sMore),w
	skipc
	goto	u2711
	goto	u2710
u2711:
	goto	l5471
u2710:
	line	1542
	
l5459:	
;main.c: 1542: ucTimerDelayP2sMore = 2;
	movlw	(02h)
	movwf	(main@ucTimerDelayP2sMore)
	goto	l5471
	line	1557
	
l5467:	
;main.c: 1552: {
;main.c: 1557: vHandle20sTimeron();
	fcall	_vHandle20sTimeron
	line	1558
;main.c: 1558: }
	goto	l5017
	line	1568
	
l5471:	
;main.c: 1568: else if(ucTimerDelayP2sMore >= 2)
	movlw	(02h)
	subwf	(main@ucTimerDelayP2sMore),w
	skipc
	goto	u2721
	goto	u2720
u2721:
	goto	l774
u2720:
	line	1570
	
l5473:	
;main.c: 1569: {
;main.c: 1570: ucTimerDelayP2sMore = 0;
	clrf	(main@ucTimerDelayP2sMore)
	line	1571
;main.c: 1571: ucTimerDelayP2sLess = 0;
	clrf	(main@ucTimerDelayP2sLess)
	goto	l5467
	line	1906
	
l5477:	
;main.c: 1900: {
;main.c: 1904: static unsigned char ucFourthSuffix1TimerP3s = 0;
;main.c: 1906: ucFourthSuffix1TimerP3s++;
	incf	(main@ucFourthSuffix1TimerP3s),f
	line	1908
	
l5479:	
;main.c: 1908: if( ucFourthSuffix1TimerP3s > 3)
	movlw	(04h)
	subwf	(main@ucFourthSuffix1TimerP3s),w
	skipc
	goto	u2731
	goto	u2730
u2731:
	goto	l774
u2730:
	line	1910
	
l5481:	
;main.c: 1909: {
;main.c: 1910: ucFourthSuffix1TimerP3s = 0;
	clrf	(main@ucFourthSuffix1TimerP3s)
	line	1911
	
l5483:	
;main.c: 1911: ucADC4_Step = ADC4_STEP_FOURTH_SUFFIX2;
	movlw	(0Ch)
	movwf	(_ucADC4_Step)
	goto	l5017
	line	1923
	
l5485:	
;main.c: 1918: {
;main.c: 1923: setPA6(0);
	movlw	(0)
	fcall	_setPA6
	line	1925
	
l5487:	
;main.c: 1925: clearPinPortAndTimer();
	fcall	_clearPinPortAndTimer
	line	1926
	
l5489:	
;main.c: 1926: ucADC4_Step = ADC4_STEP_INIT;
	clrf	(_ucADC4_Step)
	line	1928
	
l5491:	
;main.c: 1928: enumMainLoopStep = MAIN_LOOP_STEP_FIRST;
	clrf	(_enumMainLoopStep)
	incf	(_enumMainLoopStep),f
	line	1929
;main.c: 1929: break;
	goto	l5017
	line	943
	
l5495:	
	bcf	status, 5	;RP0=0, select bank0
	movf	(_ucADC4_Step),w
	; Switch size 1, requested type "space"
; Number of cases is 7, Range of values is 0 to 12
; switch strategies available:
; Name         Instructions Cycles
; simple_byte           22    12 (average)
; direct_byte           33     7 (fixed)
; jumptable            260     6 (fixed)
; rangetable            17     6 (fixed)
; spacedrange           32     9 (fixed)
; locatedrange          13     3 (fixed)
;	Chosen strategy is simple_byte

	opt asmopt_off
	xorlw	0^0	; case 0
	skipnz
	goto	l815
	xorlw	1^0	; case 1
	skipnz
	goto	l5123
	xorlw	2^1	; case 2
	skipnz
	goto	l5445
	xorlw	3^2	; case 3
	skipnz
	goto	l5447
	xorlw	10^3	; case 10
	skipnz
	goto	l774
	xorlw	11^10	; case 11
	skipnz
	goto	l5477
	xorlw	12^11	; case 12
	skipnz
	goto	l5485
	goto	l774
	opt asmopt_on

	line	1956
;main.c: 1955: {
;main.c: 1956: case HOUR_3_BRANCH_STEP_FIRST:
	
l993:	
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
	
l5497:	
;main.c: 1965: startThreeHoursTimer(10800);
	movlw	low(02A30h)
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	movwf	(?_startThreeHoursTimer)
	movlw	high(02A30h)
	movwf	((?_startThreeHoursTimer))+1
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
	
l5499:	
;main.c: 1981: enumBranchStep = HOUR_3_BRANCH_STEP_SECOND;
	bsf	status, 5	;RP0=1, select bank1
	clrf	(main@enumBranchStep)^080h
	incf	(main@enumBranchStep)^080h,f
	line	1982
;main.c: 1982: break;
	goto	l5017
	line	1991
	
l5501:	
;main.c: 1986: {
;main.c: 1991: enumBranchStep = HOUR_3_BRANCH_STEP_THIRD;
	movlw	(02h)
	movwf	(main@enumBranchStep)^080h
	line	1992
;main.c: 1992: break;
	goto	l5017
	line	2000
	
l5503:	
;main.c: 1996: {
;main.c: 2000: if( (isFinishedTwelveHoursTimer()) || (isFinishedThreeHoursTimer()))
	fcall	_isFinishedTwelveHoursTimer
	iorlw	0
	skipz
	goto	u2741
	goto	u2740
u2741:
	goto	l5507
u2740:
	
l5505:	
	fcall	_isFinishedThreeHoursTimer
	xorlw	0
	skipnz
	goto	u2751
	goto	u2750
u2751:
	goto	l5511
u2750:
	line	2002
	
l5507:	
;main.c: 2001: {
;main.c: 2002: enumBranchStep = HOUR_3_BRANCH_STEP_FIRST;
	bsf	status, 5	;RP0=1, select bank1
	clrf	(main@enumBranchStep)^080h
	goto	l5037
	line	2011
	
l5511:	
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
	goto	u2761
	goto	u2760
u2761:
	goto	l5517
u2760:
	line	2013
	
l5513:	
;main.c: 2012: {
;main.c: 2013: ucTimerX1P5s = 0;
	bsf	status, 5	;RP0=1, select bank1
	clrf	(main@ucTimerX1P5s)^080h
	line	2014
	
l5515:	
;main.c: 2014: ucTimerLessX1P5s++;
	incf	(main@ucTimerLessX1P5s)^080h,f
	line	2015
;main.c: 2015: }
	goto	l5521
	line	2018
	
l5517:	
;main.c: 2016: else
;main.c: 2017: {
;main.c: 2018: ucTimerX1P5s++;
	bsf	status, 5	;RP0=1, select bank1
	incf	(main@ucTimerX1P5s)^080h,f
	line	2019
	
l5519:	
;main.c: 2019: ucTimerLessX1P5s = 0;
	clrf	(main@ucTimerLessX1P5s)^080h
	line	2022
	
l5521:	
;main.c: 2020: }
;main.c: 2022: if(ucTimerX1P5s >= 5)
	movlw	(05h)
	subwf	(main@ucTimerX1P5s)^080h,w
	skipc
	goto	u2771
	goto	u2770
u2771:
	goto	l5535
u2770:
	line	2024
	
l5523:	
;main.c: 2023: {
;main.c: 2024: ucTimerX1P5s = 0;
	clrf	(main@ucTimerX1P5s)^080h
	line	2026
;main.c: 2026: ucTimerLessX1P5s = 0;
	clrf	(main@ucTimerLessX1P5s)^080h
	line	2030
	
l5525:	
;main.c: 2030: PBOD7 = 0;
	bsf	status, 6	;RP1=1, select bank3
	bcf	(3143/8)^0180h,(3143)&7
	line	2031
	
l5527:	
;main.c: 2031: PB7 = 0;
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	bcf	(55/8),(55)&7
	line	2036
	
l5529:	
;main.c: 2036: clearThreeHoursTimer();
	fcall	_clearThreeHoursTimer
	line	2038
	
l5531:	
;main.c: 2038: enumBranchStep = HOUR_3_BRANCH_STEP_FIRST;
	bsf	status, 5	;RP0=1, select bank1
	clrf	(main@enumBranchStep)^080h
	line	2040
	
l5533:	
;main.c: 2040: enumMainLoopStep = MAIN_LOOP_STEP_SECOND;
	movlw	(02h)
	bcf	status, 5	;RP0=0, select bank0
	movwf	(_enumMainLoopStep)
	line	2041
;main.c: 2041: }
	goto	l5017
	line	2042
	
l5535:	
;main.c: 2042: else if(ucTimerLessX1P5s >= 5)
	movlw	(05h)
	subwf	(main@ucTimerLessX1P5s)^080h,w
	skipc
	goto	u2781
	goto	u2780
u2781:
	goto	l774
u2780:
	line	2048
	
l5537:	
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
	goto	u2791
	goto	u2790
u2791:
	goto	l5543
u2790:
	line	2050
	
l5539:	
;main.c: 2049: {
;main.c: 2050: ucTimerX2P5s++;
	bsf	status, 5	;RP0=1, select bank1
	incf	(main@ucTimerX2P5s)^080h,f
	line	2051
	
l5541:	
;main.c: 2051: ucTimerLessX2P5s = 0;
	clrf	(main@ucTimerLessX2P5s)^080h
	line	2052
;main.c: 2052: }
	goto	l5545
	line	2055
	
l5543:	
;main.c: 2053: else
;main.c: 2054: {
;main.c: 2055: ucTimerX2P5s = 0;
	bsf	status, 5	;RP0=1, select bank1
	clrf	(main@ucTimerX2P5s)^080h
	line	2057
;main.c: 2057: ucTimerLessX2P5s = 0;
	clrf	(main@ucTimerLessX2P5s)^080h
	line	2061
	
l5545:	
;main.c: 2059: }
;main.c: 2061: if(ucTimerX2P5s >= 5)
	movlw	(05h)
	subwf	(main@ucTimerX2P5s)^080h,w
	skipc
	goto	u2801
	goto	u2800
u2801:
	goto	l774
u2800:
	line	2063
	
l5547:	
;main.c: 2062: {
;main.c: 2063: ucTimerX2P5s = 0;
	clrf	(main@ucTimerX2P5s)^080h
	line	2064
;main.c: 2064: }
	goto	l5017
	line	1954
	
l5563:	
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
	goto	l993
	xorlw	1^0	; case 1
	skipnz
	goto	l5501
	xorlw	2^1	; case 2
	skipnz
	goto	l5503
	goto	l774
	opt asmopt_on

	line	2120
	
l5565:	
;main.c: 2115: {
;main.c: 2120: setPA2(0);
	movlw	(0)
	fcall	_setPA2
	line	2121
;main.c: 2121: setPA1(0);
	movlw	(0)
	fcall	_setPA1
	line	2122
;main.c: 2122: setPA0(0);
	movlw	(0)
	fcall	_setPA0
	line	2123
;main.c: 2123: setPB0(0);
	movlw	(0)
	fcall	_setPB0
	line	2124
;main.c: 2124: setPB1(0);
	movlw	(0)
	fcall	_setPB1
	line	2125
;main.c: 2125: setPB2(0);
	movlw	(0)
	fcall	_setPB2
	line	2126
;main.c: 2126: setPA3(0);
	movlw	(0)
	fcall	_setPA3
	line	2127
;main.c: 2127: setPB4(0);
	movlw	(0)
	fcall	_setPB4
	line	2128
;main.c: 2128: setPB6(1);
	movlw	(01h)
	fcall	_setPB6
	line	2130
	
l5567:	
;main.c: 2130: enumInteralStep = INTERNAL_SECOND_STEP;
	bsf	status, 5	;RP0=1, select bank1
	clrf	(main@enumInteralStep)^080h
	incf	(main@enumInteralStep)^080h,f
	line	2131
;main.c: 2131: break;
	goto	l5017
	line	2141
	
l5569:	
;main.c: 2135: {
;main.c: 2139: static unsigned char ucTimer1s = 0;
;main.c: 2141: if(getAdOriginalCh0Value() >= 2500)
	fcall	_getAdOriginalCh0Value
	movlw	high(09C4h)
	subwf	(1+(?_getAdOriginalCh0Value)),w
	movlw	low(09C4h)
	skipnz
	subwf	(0+(?_getAdOriginalCh0Value)),w
	skipc
	goto	u2811
	goto	u2810
u2811:
	goto	l5573
u2810:
	line	2143
	
l5571:	
;main.c: 2142: {
;main.c: 2143: ucTimer1s++;
	bsf	status, 5	;RP0=1, select bank1
	incf	(main@ucTimer1s)^080h,f
	line	2144
;main.c: 2144: }
	goto	l5575
	line	2146
	
l5573:	
;main.c: 2145: else
;main.c: 2146: ucTimer1s = 0;
	bsf	status, 5	;RP0=1, select bank1
	clrf	(main@ucTimer1s)^080h
	line	2148
	
l5575:	
;main.c: 2148: if(ucTimer1s >= 10)
	movlw	(0Ah)
	subwf	(main@ucTimer1s)^080h,w
	skipc
	goto	u2821
	goto	u2820
u2821:
	goto	l774
u2820:
	line	2150
	
l5577:	
;main.c: 2149: {
;main.c: 2150: enumInteralStep = INTERNAL_THIRD_STEP;
	movlw	(02h)
	movwf	(main@enumInteralStep)^080h
	line	2151
	
l5579:	
;main.c: 2151: ucTimer1s = 0;
	clrf	(main@ucTimer1s)^080h
	goto	l5017
	line	2163
	
l5581:	
;main.c: 2157: {
;main.c: 2161: static unsigned char ucTimerP3s = 0;
;main.c: 2163: if(getAdOriginalCh0Value() <= 1950)
	fcall	_getAdOriginalCh0Value
	movlw	high(079Fh)
	subwf	(1+(?_getAdOriginalCh0Value)),w
	movlw	low(079Fh)
	skipnz
	subwf	(0+(?_getAdOriginalCh0Value)),w
	skipnc
	goto	u2831
	goto	u2830
u2831:
	goto	l5585
u2830:
	line	2165
	
l5583:	
;main.c: 2164: {
;main.c: 2165: ucTimerP3s++;
	bsf	status, 5	;RP0=1, select bank1
	incf	(main@ucTimerP3s)^080h,f
	line	2166
;main.c: 2166: }
	goto	l5587
	line	2168
	
l5585:	
;main.c: 2167: else
;main.c: 2168: ucTimerP3s = 0;
	bsf	status, 5	;RP0=1, select bank1
	clrf	(main@ucTimerP3s)^080h
	line	2170
	
l5587:	
;main.c: 2170: if(ucTimerP3s >= 3)
	movlw	(03h)
	subwf	(main@ucTimerP3s)^080h,w
	skipc
	goto	u2841
	goto	u2840
u2841:
	goto	l774
u2840:
	line	2172
	
l5589:	
;main.c: 2171: {
;main.c: 2172: enumInteralStep = INTERNAL_FIRST_STEP;
	clrf	(main@enumInteralStep)^080h
	line	2173
;main.c: 2173: ucTimerP3s = 0;
	clrf	(main@ucTimerP3s)^080h
	line	2175
	
l5591:	
;main.c: 2175: clearAllTimer();
	fcall	_clearAllTimer
	line	2177
	
l5593:	
;main.c: 2177: initPin();
	fcall	_initPin
	line	2180
;main.c: 2180: enumMainLoopStep = MAIN_LOOP_STEP_INIT;
	bcf	status, 5	;RP0=0, select bank0
	clrf	(_enumMainLoopStep)
	line	2182
	
l1041:	
	goto	l1041
	line	2112
	
l5597:	
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
	goto	l5565
	xorlw	1^0	; case 1
	skipnz
	goto	l5569
	xorlw	2^1	; case 2
	skipnz
	goto	l5581
	goto	l774
	opt asmopt_on

	line	751
	
l5601:	
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
	goto	l5023
	xorlw	1^0	; case 1
	skipnz
	goto	l5039
	xorlw	2^1	; case 2
	skipnz
	goto	l5059
	xorlw	3^2	; case 3
	skipnz
	goto	l5071
	xorlw	4^3	; case 4
	skipnz
	goto	l5109
	xorlw	5^4	; case 5
	skipnz
	goto	l5115
	xorlw	8^5	; case 8
	skipnz
	goto	l5563
	xorlw	9^8	; case 9
	skipnz
	goto	l5597
	goto	l774
	opt asmopt_on

	global	start
	ljmp	start
	opt stack 0
psect	maintext
	line	2207
GLOBAL	__end_of_main
	__end_of_main:
;; =============== function _main ends ============

	signat	_main,88
	global	_vHandle20sTimeron
psect	text1004,local,class=CODE,delta=2
global __ptext1004
__ptext1004:

;; *************** function _vHandle20sTimeron *****************
;; Defined at:
;;		line 2211 in file "C:\temp\dev\AK7030-OTP\main.c"
;; Parameters:    Size  Location     Type
;;		None
;; Auto vars:     Size  Location     Type
;;		None
;; Return value:  Size  Location     Type
;;		None               void
;; Registers used:
;;		wreg, fsr0l, fsr0h, status,2, status,0, btemp+1, pclath, cstack
;; Tracked objects:
;;		On entry : 160/0
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
;;		_vPause20sTimer
;;		_setPA3
;;		_setPB6
;;		_setPB6AsInput
;; This function is called by:
;;		_main
;; This function uses a non-reentrant model
;;
psect	text1004
	file	"C:\temp\dev\AK7030-OTP\main.c"
	line	2211
	global	__size_of_vHandle20sTimeron
	__size_of_vHandle20sTimeron	equ	__end_of_vHandle20sTimeron-_vHandle20sTimeron
	
_vHandle20sTimeron:	
	opt	stack 3
; Regs used in _vHandle20sTimeron: [wreg-fsr0h+status,2+status,0+btemp+1+pclath+cstack]
	line	2243
	
l4855:	
;main.c: 2212: enum enum_waiting_loop_step
;main.c: 2213: {
;main.c: 2214: WAITING_LOOP_STEP1 = 0,
;main.c: 2215: WAITING_LOOP_STEP2,
;main.c: 2216: WAITING_LOOP_STEP3,
;main.c: 2217: WAITING_LOOP_STEP4,
;main.c: 2218: WAITING_LOOP_STEP5,
;main.c: 2219: WAITING_LOOP_STEP6,
;main.c: 2220: WAITING_LOOP_STEP7,
;main.c: 2221: WAITING_LOOP_STEP8,
;main.c: 2222: WAITING_LOOP_STEP9,
;main.c: 2223: };
;main.c: 2225: enum enumCmpStep
;main.c: 2226: {
;main.c: 2227: COMPARE_STEP0 = 0,
;main.c: 2228: COMPARE_STEP1,
;main.c: 2229: COMPARE_STEP2,
	goto	l4991
	line	2247
	
l4857:	
;main.c: 2246: {
;main.c: 2247: if((getAdOriginalCh2Value() > 1950))
	fcall	_getAdOriginalCh2Value
	movlw	high(079Fh)
	subwf	(1+(?_getAdOriginalCh2Value)),w
	movlw	low(079Fh)
	skipnz
	subwf	(0+(?_getAdOriginalCh2Value)),w
	skipc
	goto	u2031
	goto	u2030
u2031:
	goto	l4863
u2030:
	line	2249
	
l4859:	
;main.c: 2248: {
;main.c: 2249: ucTimerCntMore++;
	bsf	status, 5	;RP0=1, select bank1
	incf	(vHandle20sTimeron@ucTimerCntMore)^080h,f
	line	2250
	
l4861:	
;main.c: 2250: ucTimerCntLess = 0;
	clrf	(vHandle20sTimeron@ucTimerCntLess)^080h
	line	2251
;main.c: 2251: }
	goto	l4867
	line	2254
	
l4863:	
;main.c: 2252: else
;main.c: 2253: {
;main.c: 2254: ucTimerCntLess++;
	bsf	status, 5	;RP0=1, select bank1
	incf	(vHandle20sTimeron@ucTimerCntLess)^080h,f
	line	2255
	
l4865:	
;main.c: 2255: ucTimerCntMore = 0;
	clrf	(vHandle20sTimeron@ucTimerCntMore)^080h
	line	2258
	
l4867:	
;main.c: 2256: }
;main.c: 2258: if(ucTimerCntMore >= 2)
	movlw	(02h)
	subwf	(vHandle20sTimeron@ucTimerCntMore)^080h,w
	skipc
	goto	u2041
	goto	u2040
u2041:
	goto	l4873
u2040:
	line	2260
	
l4869:	
;main.c: 2259: {
;main.c: 2260: ucCompareStep = COMPARE_STEP1;
	clrf	(vHandle20sTimeron@ucCompareStep)^080h
	incf	(vHandle20sTimeron@ucCompareStep)^080h,f
	line	2261
	
l4871:	
;main.c: 2261: ucTimerCntMore = 0;
	clrf	(vHandle20sTimeron@ucTimerCntMore)^080h
	line	2264
	
l4873:	
;main.c: 2262: }
;main.c: 2264: if(ucTimerCntLess >= 2)
	movlw	(02h)
	subwf	(vHandle20sTimeron@ucTimerCntLess)^080h,w
	skipc
	goto	u2051
	goto	u2050
u2051:
	goto	l4993
u2050:
	line	2266
	
l4875:	
;main.c: 2265: {
;main.c: 2266: ucCompareStep = COMPARE_STEP2;
	movlw	(02h)
	movwf	(vHandle20sTimeron@ucCompareStep)^080h
	line	2267
	
l4877:	
;main.c: 2267: ucTimerCntLess = 0;
	clrf	(vHandle20sTimeron@ucTimerCntLess)^080h
	goto	l4993
	line	2283
	
l4879:	
;main.c: 2276: {
;main.c: 2277: static unsigned char ucMoreThanP8sCnt = 0;
;main.c: 2279: static unsigned char ucLessThanP8sCnt = 0;
;main.c: 2281: static unsigned char ucTimerCntN1 = 0;
;main.c: 2283: if((getAdOriginalCh2Value() < 1950))
	fcall	_getAdOriginalCh2Value
	movlw	high(079Eh)
	subwf	(1+(?_getAdOriginalCh2Value)),w
	movlw	low(079Eh)
	skipnz
	subwf	(0+(?_getAdOriginalCh2Value)),w
	skipnc
	goto	u2061
	goto	u2060
u2061:
	goto	l4895
u2060:
	line	2285
	
l4881:	
;main.c: 2284: {
;main.c: 2285: ucTimerCntN1++;
	bsf	status, 5	;RP0=1, select bank1
	incf	(vHandle20sTimeron@ucTimerCntN1)^080h,f
	line	2286
	
l4883:	
;main.c: 2286: if(ucTimerCntN1 >= 2)
	movlw	(02h)
	subwf	(vHandle20sTimeron@ucTimerCntN1)^080h,w
	skipc
	goto	u2071
	goto	u2070
u2071:
	goto	l4993
u2070:
	line	2288
	
l4885:	
;main.c: 2287: {
;main.c: 2288: ucTimerCntN1 = 0;
	clrf	(vHandle20sTimeron@ucTimerCntN1)^080h
	line	2289
	
l4887:	
;main.c: 2289: ucCompareStep = COMPARE_STEP2;
	movlw	(02h)
	movwf	(vHandle20sTimeron@ucCompareStep)^080h
	line	2291
	
l4889:	
;main.c: 2291: ucLessThanP8sCnt = 0;
	clrf	(vHandle20sTimeron@ucLessThanP8sCnt)^080h
	line	2293
	
l4891:	
;main.c: 2293: ucMoreThanP8sCnt = 0;
	clrf	(vHandle20sTimeron@ucMoreThanP8sCnt)^080h
	goto	l4993
	line	2298
	
l4895:	
;main.c: 2297: else
;main.c: 2298: ucTimerCntN1 = 0;
	bsf	status, 5	;RP0=1, select bank1
	clrf	(vHandle20sTimeron@ucTimerCntN1)^080h
	line	2304
	
l4897:	
;main.c: 2304: if((getAdOriginalCh6Value() < 50))
	fcall	_getAdOriginalCh6Value
	movlw	high(032h)
	subwf	(1+(?_getAdOriginalCh6Value)),w
	movlw	low(032h)
	skipnz
	subwf	(0+(?_getAdOriginalCh6Value)),w
	skipnc
	goto	u2081
	goto	u2080
u2081:
	goto	l4903
u2080:
	line	2306
	
l4899:	
;main.c: 2305: {
;main.c: 2306: ucLessThanP8sCnt++;
	bsf	status, 5	;RP0=1, select bank1
	incf	(vHandle20sTimeron@ucLessThanP8sCnt)^080h,f
	line	2307
	
l4901:	
;main.c: 2307: ucMoreThanP8sCnt = 0;
	clrf	(vHandle20sTimeron@ucMoreThanP8sCnt)^080h
	line	2308
;main.c: 2308: }
	goto	l4907
	line	2311
	
l4903:	
;main.c: 2309: else
;main.c: 2310: {
;main.c: 2311: ucMoreThanP8sCnt++;
	bsf	status, 5	;RP0=1, select bank1
	incf	(vHandle20sTimeron@ucMoreThanP8sCnt)^080h,f
	line	2312
	
l4905:	
;main.c: 2312: ucLessThanP8sCnt = 0;
	clrf	(vHandle20sTimeron@ucLessThanP8sCnt)^080h
	line	2315
	
l4907:	
;main.c: 2313: }
;main.c: 2315: if( ucLessThanP8sCnt >= 8)
	movlw	(08h)
	subwf	(vHandle20sTimeron@ucLessThanP8sCnt)^080h,w
	skipc
	goto	u2091
	goto	u2090
u2091:
	goto	l4913
u2090:
	line	2317
	
l4909:	
;main.c: 2316: {
;main.c: 2317: ucLessThanP8sCnt = 0;
	clrf	(vHandle20sTimeron@ucLessThanP8sCnt)^080h
	line	2318
;main.c: 2318: ucMoreThanP8sCnt = 0;
	clrf	(vHandle20sTimeron@ucMoreThanP8sCnt)^080h
	line	2320
	
l4911:	
;main.c: 2320: enumMainLoopStep = MAIN_LOOP_STEP_FIRST;
	bcf	status, 5	;RP0=0, select bank0
	clrf	(_enumMainLoopStep)
	incf	(_enumMainLoopStep),f
	line	2321
;main.c: 2321: ucADC4_Step = ADC4_STEP_INIT;
	clrf	(_ucADC4_Step)
	line	2323
;main.c: 2323: ucCompareStep = COMPARE_STEP0;
	bsf	status, 5	;RP0=1, select bank1
	clrf	(vHandle20sTimeron@ucCompareStep)^080h
	line	2325
;main.c: 2324: ;
;main.c: 2325: }
	goto	l4993
	line	2326
	
l4913:	
;main.c: 2326: else if( ucMoreThanP8sCnt >= 8 )
	movlw	(08h)
	subwf	(vHandle20sTimeron@ucMoreThanP8sCnt)^080h,w
	skipc
	goto	u2101
	goto	u2100
u2101:
	goto	l4993
u2100:
	line	2328
	
l4915:	
;main.c: 2327: {
;main.c: 2328: ucLessThanP8sCnt = 0;
	clrf	(vHandle20sTimeron@ucLessThanP8sCnt)^080h
	line	2329
;main.c: 2329: ucMoreThanP8sCnt = 0;
	clrf	(vHandle20sTimeron@ucMoreThanP8sCnt)^080h
	line	2331
	
l4917:	
;main.c: 2331: enumMainLoopStep = MAIN_LOOP_STEP_THIRD;
	movlw	(03h)
	bcf	status, 5	;RP0=0, select bank0
	movwf	(_enumMainLoopStep)
	line	2332
	
l4919:	
;main.c: 2332: ucADC4_Step = ADC4_STEP_INIT;
	clrf	(_ucADC4_Step)
	line	2334
	
l4921:	
;main.c: 2334: ucCompareStep = COMPARE_STEP0;
	bsf	status, 5	;RP0=1, select bank1
	clrf	(vHandle20sTimeron@ucCompareStep)^080h
	line	2336
;main.c: 2335: ;
;main.c: 2336: }
	goto	l4993
	line	2363
	
l4923:	
;main.c: 2359: {
;main.c: 2363: vPause20sTimer(1);
	movlw	(01h)
	fcall	_vPause20sTimer
	line	2364
	
l4925:	
;main.c: 2364: ucTimeCntP2s = 0;
	clrf	(vHandle20sTimeron@ucTimeCntP2s)^080h
	line	2365
	
l4927:	
;main.c: 2365: setPA3(0);
	movlw	(0)
	fcall	_setPA3
	line	2366
	
l4929:	
;main.c: 2366: setPB6(1);
	movlw	(01h)
	fcall	_setPB6
	line	2367
	
l4931:	
;main.c: 2367: waitLoopStep = WAITING_LOOP_STEP2;
	bsf	status, 5	;RP0=1, select bank1
	clrf	(vHandle20sTimeron@waitLoopStep)^080h
	incf	(vHandle20sTimeron@waitLoopStep)^080h,f
	line	2368
;main.c: 2368: break;
	goto	l4993
	line	2376
	
l4933:	
;main.c: 2372: {
;main.c: 2376: if((getAdOriginalCh2Value() > 2300))
	fcall	_getAdOriginalCh2Value
	movlw	high(08FDh)
	subwf	(1+(?_getAdOriginalCh2Value)),w
	movlw	low(08FDh)
	skipnz
	subwf	(0+(?_getAdOriginalCh2Value)),w
	skipc
	goto	u2111
	goto	u2110
u2111:
	goto	l4937
u2110:
	line	2378
	
l4935:	
;main.c: 2377: {
;main.c: 2378: ucTimeCntP2s++;
	bsf	status, 5	;RP0=1, select bank1
	incf	(vHandle20sTimeron@ucTimeCntP2s)^080h,f
	line	2379
;main.c: 2379: }
	goto	l4939
	line	2381
	
l4937:	
;main.c: 2380: else
;main.c: 2381: ucTimeCntP2s = 0;
	bsf	status, 5	;RP0=1, select bank1
	clrf	(vHandle20sTimeron@ucTimeCntP2s)^080h
	line	2383
	
l4939:	
;main.c: 2383: if( ucTimeCntP2s >= 2)
	movlw	(02h)
	subwf	(vHandle20sTimeron@ucTimeCntP2s)^080h,w
	skipc
	goto	u2121
	goto	u2120
u2121:
	goto	l4993
u2120:
	line	2385
	
l4941:	
;main.c: 2384: {
;main.c: 2385: ucTimeCntP2s = 0;
	clrf	(vHandle20sTimeron@ucTimeCntP2s)^080h
	line	2386
	
l4943:	
;main.c: 2386: waitLoopStep = WAITING_LOOP_STEP3;
	movlw	(02h)
	movwf	(vHandle20sTimeron@waitLoopStep)^080h
	goto	l4993
	line	2396
	
l4945:	
;main.c: 2392: {
;main.c: 2396: setPA3(1);
	movlw	(01h)
	fcall	_setPA3
	line	2398
	
l4947:	
;main.c: 2398: setPB6AsInput();
	fcall	_setPB6AsInput
	line	2399
;main.c: 2399: waitLoopStep = WAITING_LOOP_STEP4;
	movlw	(03h)
	movwf	(vHandle20sTimeron@waitLoopStep)^080h
	line	2400
;main.c: 2400: break;
	goto	l4993
	line	2409
	
l4949:	
;main.c: 2404: {
;main.c: 2408: static unsigned char ucTimerCntP5s = 0;
;main.c: 2409: if( ucTimerCntP5s < 5)
	movlw	(05h)
	subwf	(vHandle20sTimeron@ucTimerCntP5s)^080h,w
	skipnc
	goto	u2131
	goto	u2130
u2131:
	goto	l4953
u2130:
	line	2410
	
l4951:	
;main.c: 2410: ucTimerCntP5s++;
	incf	(vHandle20sTimeron@ucTimerCntP5s)^080h,f
	goto	l4993
	line	2413
	
l4953:	
;main.c: 2411: else
;main.c: 2412: {
;main.c: 2413: ucTimerCntP5s = 0;
	clrf	(vHandle20sTimeron@ucTimerCntP5s)^080h
	line	2414
	
l4955:	
;main.c: 2414: waitLoopStep = WAITING_LOOP_STEP5;
	movlw	(04h)
	movwf	(vHandle20sTimeron@waitLoopStep)^080h
	goto	l4993
	line	2428
	
l4957:	
;main.c: 2421: {
;main.c: 2425: static unsigned char ucMoreThanP3sCnt = 0;
;main.c: 2427: static unsigned char ucLessThanP3sCnt = 0;
;main.c: 2428: if((getAdOriginalCh6Value() < 50))
	fcall	_getAdOriginalCh6Value
	movlw	high(032h)
	subwf	(1+(?_getAdOriginalCh6Value)),w
	movlw	low(032h)
	skipnz
	subwf	(0+(?_getAdOriginalCh6Value)),w
	skipnc
	goto	u2141
	goto	u2140
u2141:
	goto	l4963
u2140:
	line	2430
	
l4959:	
;main.c: 2429: {
;main.c: 2430: ucLessThanP3sCnt++;
	bsf	status, 5	;RP0=1, select bank1
	incf	(vHandle20sTimeron@ucLessThanP3sCnt)^080h,f
	line	2431
	
l4961:	
;main.c: 2431: ucMoreThanP3sCnt = 0;
	clrf	(vHandle20sTimeron@ucMoreThanP3sCnt)^080h
	line	2432
;main.c: 2432: }
	goto	l4967
	line	2435
	
l4963:	
;main.c: 2433: else
;main.c: 2434: {
;main.c: 2435: ucMoreThanP3sCnt++;
	bsf	status, 5	;RP0=1, select bank1
	incf	(vHandle20sTimeron@ucMoreThanP3sCnt)^080h,f
	line	2436
	
l4965:	
;main.c: 2436: ucLessThanP3sCnt = 0;
	clrf	(vHandle20sTimeron@ucLessThanP3sCnt)^080h
	line	2439
	
l4967:	
;main.c: 2437: }
;main.c: 2439: if( ucLessThanP3sCnt >= 3)
	movlw	(03h)
	subwf	(vHandle20sTimeron@ucLessThanP3sCnt)^080h,w
	skipc
	goto	u2151
	goto	u2150
u2151:
	goto	l4973
u2150:
	line	2441
	
l4969:	
;main.c: 2440: {
;main.c: 2441: ucLessThanP3sCnt = 0;
	clrf	(vHandle20sTimeron@ucLessThanP3sCnt)^080h
	line	2442
;main.c: 2442: ucMoreThanP3sCnt = 0;
	clrf	(vHandle20sTimeron@ucMoreThanP3sCnt)^080h
	line	2444
	
l4971:	
;main.c: 2444: enumMainLoopStep = MAIN_LOOP_STEP_FIRST;
	bcf	status, 5	;RP0=0, select bank0
	clrf	(_enumMainLoopStep)
	incf	(_enumMainLoopStep),f
	line	2445
;main.c: 2445: ucADC4_Step = ADC4_STEP_INIT;
	clrf	(_ucADC4_Step)
	line	2447
;main.c: 2447: waitLoopStep = WAITING_LOOP_STEP1;
	bsf	status, 5	;RP0=1, select bank1
	clrf	(vHandle20sTimeron@waitLoopStep)^080h
	line	2449
;main.c: 2449: ucCompareStep = COMPARE_STEP0;
	clrf	(vHandle20sTimeron@ucCompareStep)^080h
	line	2452
	
l4973:	
;main.c: 2450: }
;main.c: 2452: if(ucMoreThanP3sCnt >= 3)
	movlw	(03h)
	subwf	(vHandle20sTimeron@ucMoreThanP3sCnt)^080h,w
	skipc
	goto	u2161
	goto	u2160
u2161:
	goto	l4993
u2160:
	line	2454
	
l4975:	
;main.c: 2453: {
;main.c: 2454: ucLessThanP3sCnt = 0;
	clrf	(vHandle20sTimeron@ucLessThanP3sCnt)^080h
	line	2455
;main.c: 2455: ucMoreThanP3sCnt = 0;
	clrf	(vHandle20sTimeron@ucMoreThanP3sCnt)^080h
	line	2457
	
l4977:	
;main.c: 2457: enumMainLoopStep = MAIN_LOOP_STEP_THIRD;
	movlw	(03h)
	bcf	status, 5	;RP0=0, select bank0
	movwf	(_enumMainLoopStep)
	line	2458
	
l4979:	
;main.c: 2458: ucADC4_Step = ADC4_STEP_INIT;
	clrf	(_ucADC4_Step)
	line	2460
	
l4981:	
;main.c: 2460: waitLoopStep = WAITING_LOOP_STEP1;
	bsf	status, 5	;RP0=1, select bank1
	clrf	(vHandle20sTimeron@waitLoopStep)^080h
	goto	l4921
	line	2356
	
l4987:	
	movf	(vHandle20sTimeron@waitLoopStep)^080h,w
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
	goto	l4923
	xorlw	1^0	; case 1
	skipnz
	goto	l4933
	xorlw	2^1	; case 2
	skipnz
	goto	l4945
	xorlw	3^2	; case 3
	skipnz
	goto	l4949
	xorlw	4^3	; case 4
	skipnz
	goto	l4957
	goto	l4993
	opt asmopt_on

	line	2243
	
l4991:	
	bsf	status, 5	;RP0=1, select bank1
	movf	(vHandle20sTimeron@ucCompareStep)^080h,w
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
	goto	l4857
	xorlw	1^0	; case 1
	skipnz
	goto	l4879
	xorlw	2^1	; case 2
	skipnz
	goto	l4987
	goto	l4993
	opt asmopt_on

	line	2477
	
l4993:	
;main.c: 2477: if(ADC4_STEP_INIT == ucADC4_Step)
	bcf	status, 5	;RP0=0, select bank0
	movf	(_ucADC4_Step),f
	skipz
	goto	u2171
	goto	u2170
u2171:
	goto	l1109
u2170:
	line	2479
	
l4995:	
;main.c: 2478: {
;main.c: 2479: ucTimerCntMore = 0;
	bsf	status, 5	;RP0=1, select bank1
	clrf	(vHandle20sTimeron@ucTimerCntMore)^080h
	line	2480
;main.c: 2480: ucTimerCntLess = 0;
	clrf	(vHandle20sTimeron@ucTimerCntLess)^080h
	line	2481
;main.c: 2481: ucCompareStep = COMPARE_STEP0;
	clrf	(vHandle20sTimeron@ucCompareStep)^080h
	line	2483
	
l4997:	
;main.c: 2483: vPause20sTimer(0);
	movlw	(0)
	fcall	_vPause20sTimer
	line	2485
	
l1109:	
	return
	opt stack 0
GLOBAL	__end_of_vHandle20sTimeron
	__end_of_vHandle20sTimeron:
;; =============== function _vHandle20sTimeron ends ============

	signat	_vHandle20sTimeron,88
	global	_process_AD_Converter_Value
psect	text1005,local,class=CODE,delta=2
global __ptext1005
__ptext1005:

;; *************** function _process_AD_Converter_Value *****************
;; Defined at:
;;		line 302 in file "C:\temp\dev\AK7030-OTP\common.c"
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
psect	text1005
	file	"C:\temp\dev\AK7030-OTP\common.c"
	line	302
	global	__size_of_process_AD_Converter_Value
	__size_of_process_AD_Converter_Value	equ	__end_of_process_AD_Converter_Value-_process_AD_Converter_Value
	
_process_AD_Converter_Value:	
	opt	stack 3
; Regs used in _process_AD_Converter_Value: [wreg+status,2+status,0+pclath+cstack]
	line	303
	
l4849:	
;common.c: 303: if(getAD_ConvertFlag())
	fcall	_getAD_ConvertFlag
	xorlw	0
	skipnz
	goto	u2021
	goto	u2020
u2021:
	goto	l1882
u2020:
	line	305
	
l4851:	
;common.c: 304: {
;common.c: 305: setAD_ConvertFlag(0);
	movlw	(0)
	fcall	_setAD_ConvertFlag
	line	306
;common.c: 306: AD_Sample();
	fcall	_AD_Sample
	line	318
	
l4853:	
;common.c: 318: adc_start();
	fcall	_adc_start
	line	320
	
l1882:	
	return
	opt stack 0
GLOBAL	__end_of_process_AD_Converter_Value
	__end_of_process_AD_Converter_Value:
;; =============== function _process_AD_Converter_Value ends ============

	signat	_process_AD_Converter_Value,88
	global	_clearParaFunction1
psect	text1006,local,class=CODE,delta=2
global __ptext1006
__ptext1006:

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
psect	text1006
	file	"C:\temp\dev\AK7030-OTP\main.c"
	line	581
	global	__size_of_clearParaFunction1
	__size_of_clearParaFunction1	equ	__end_of_clearParaFunction1-_clearParaFunction1
	
_clearParaFunction1:	
	opt	stack 3
; Regs used in _clearParaFunction1: [wreg+status,2+status,0+pclath+cstack]
	line	582
	
l4841:	
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
	
l4843:	
;main.c: 589: clearAllTimer();
	fcall	_clearAllTimer
	line	591
	
l4845:	
;main.c: 591: setPA3(0);
	movlw	(0)
	fcall	_setPA3
	line	592
	
l4847:	
;main.c: 592: setPB4(0);
	movlw	(0)
	fcall	_setPB4
	line	593
	
l760:	
	return
	opt stack 0
GLOBAL	__end_of_clearParaFunction1
	__end_of_clearParaFunction1:
;; =============== function _clearParaFunction1 ends ============

	signat	_clearParaFunction1,88
	global	_clearPinPortAndTimer
psect	text1007,local,class=CODE,delta=2
global __ptext1007
__ptext1007:

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
psect	text1007
	file	"C:\temp\dev\AK7030-OTP\main.c"
	line	110
	global	__size_of_clearPinPortAndTimer
	__size_of_clearPinPortAndTimer	equ	__end_of_clearPinPortAndTimer-_clearPinPortAndTimer
	
_clearPinPortAndTimer:	
	opt	stack 3
; Regs used in _clearPinPortAndTimer: [status,2+status,0+pclath+cstack]
	line	112
	
l4837:	
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
	
l4839:	
;main.c: 121: clearAllTimer();
	fcall	_clearAllTimer
	line	125
	
l696:	
	return
	opt stack 0
GLOBAL	__end_of_clearPinPortAndTimer
	__end_of_clearPinPortAndTimer:
;; =============== function _clearPinPortAndTimer ends ============

	signat	_clearPinPortAndTimer,88
	global	_AD_Sample
psect	text1008,local,class=CODE,delta=2
global __ptext1008
__ptext1008:

;; *************** function _AD_Sample *****************
;; Defined at:
;;		line 332 in file "C:\temp\dev\AK7030-OTP\common.c"
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
psect	text1008
	file	"C:\temp\dev\AK7030-OTP\common.c"
	line	332
	global	__size_of_AD_Sample
	__size_of_AD_Sample	equ	__end_of_AD_Sample-_AD_Sample
	
_AD_Sample:	
	opt	stack 3
; Regs used in _AD_Sample: [wreg+status,2+status,0+pclath+cstack]
	line	333
	
l4813:	
;common.c: 333: if(sampleTimes < 12)
	movlw	(0Ch)
	bcf	status, 5	;RP0=0, select bank0
	subwf	(_sampleTimes),w
	skipnc
	goto	u1971
	goto	u1970
u1971:
	goto	l1893
u1970:
	line	336
	
l4815:	
;common.c: 334: {
;common.c: 336: sampleTimes++;
	incf	(_sampleTimes),f
	line	338
	
l4817:	
;common.c: 338: if(sampleTimes >= 12)
	movlw	(0Ch)
	subwf	(_sampleTimes),w
	skipc
	goto	u1981
	goto	u1980
u1981:
	goto	l1893
u1980:
	line	340
	
l4819:	
;common.c: 339: {
;common.c: 340: sampleTimes = 0;
	clrf	(_sampleTimes)
	line	342
	
l4821:	
;common.c: 342: if(sampleChannelSelect == 0)
	movf	(_sampleChannelSelect),f
	skipz
	goto	u1991
	goto	u1990
u1991:
	goto	l4825
u1990:
	line	346
	
l4823:	
;common.c: 343: {
;common.c: 346: sampleChannelSelect = 2;
	movlw	(02h)
	movwf	(_sampleChannelSelect)
	line	347
;common.c: 347: }
	goto	l4835
	line	348
	
l4825:	
;common.c: 348: else if(sampleChannelSelect == 2)
	movf	(_sampleChannelSelect),w
	xorlw	02h
	skipz
	goto	u2001
	goto	u2000
u2001:
	goto	l4829
u2000:
	line	351
	
l4827:	
;common.c: 349: {
;common.c: 351: sampleChannelSelect = 5;
	movlw	(05h)
	movwf	(_sampleChannelSelect)
	line	352
;common.c: 352: }
	goto	l4835
	line	353
	
l4829:	
;common.c: 353: else if(sampleChannelSelect == 5)
	movf	(_sampleChannelSelect),w
	xorlw	05h
	skipz
	goto	u2011
	goto	u2010
u2011:
	goto	l4833
u2010:
	line	356
	
l4831:	
;common.c: 354: {
;common.c: 356: sampleChannelSelect = 6;
	movlw	(06h)
	movwf	(_sampleChannelSelect)
	line	357
;common.c: 357: }
	goto	l4835
	line	361
	
l4833:	
;common.c: 358: else
;common.c: 359: {
;common.c: 361: sampleChannelSelect = 0;
	clrf	(_sampleChannelSelect)
	line	367
	
l4835:	
;common.c: 362: }
;common.c: 367: adc_test_init(sampleChannelSelect,3);
	movlw	(03h)
	movwf	(?_adc_test_init)
	movf	(_sampleChannelSelect),w
	fcall	_adc_test_init
	line	371
	
l1893:	
	return
	opt stack 0
GLOBAL	__end_of_AD_Sample
	__end_of_AD_Sample:
;; =============== function _AD_Sample ends ============

	signat	_AD_Sample,88
	global	_getAdOriginalCh2Value
psect	text1009,local,class=CODE,delta=2
global __ptext1009
__ptext1009:

;; *************** function _getAdOriginalCh2Value *****************
;; Defined at:
;;		line 291 in file "C:\temp\dev\AK7030-OTP\common.c"
;; Parameters:    Size  Location     Type
;;		None
;; Auto vars:     Size  Location     Type
;;		None
;; Return value:  Size  Location     Type
;;                  2   38[BANK0 ] unsigned int 
;; Registers used:
;;		wreg, fsr0l, fsr0h, status,2, status,0, btemp+1, pclath, cstack
;; Tracked objects:
;;		On entry : 140/20
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
;;		_vHandle20sTimeron
;; This function uses a non-reentrant model
;;
psect	text1009
	file	"C:\temp\dev\AK7030-OTP\common.c"
	line	291
	global	__size_of_getAdOriginalCh2Value
	__size_of_getAdOriginalCh2Value	equ	__end_of_getAdOriginalCh2Value-_getAdOriginalCh2Value
	
_getAdOriginalCh2Value:	
	opt	stack 3
; Regs used in _getAdOriginalCh2Value: [wreg-fsr0h+status,2+status,0+btemp+1+pclath+cstack]
	line	293
	
l4809:	
;common.c: 293: return Filter(uiSampleChannelSecond);
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
	line	297
	
l1878:	
	return
	opt stack 0
GLOBAL	__end_of_getAdOriginalCh2Value
	__end_of_getAdOriginalCh2Value:
;; =============== function _getAdOriginalCh2Value ends ============

	signat	_getAdOriginalCh2Value,90
	global	_vHandle20sTimerOut
psect	text1010,local,class=CODE,delta=2
global __ptext1010
__ptext1010:

;; *************** function _vHandle20sTimerOut *****************
;; Defined at:
;;		line 2488 in file "C:\temp\dev\AK7030-OTP\main.c"
;; Parameters:    Size  Location     Type
;;  bClearStep      1    wreg     unsigned char 
;; Auto vars:     Size  Location     Type
;;  bClearStep      1    1[BANK0 ] unsigned char 
;; Return value:  Size  Location     Type
;;		None               void
;; Registers used:
;;		wreg, fsr0l, fsr0h, status,2, status,0, pclath, cstack
;; Tracked objects:
;;		On entry : 0/0
;;		On exit  : 60/20
;;		Unchanged: FFF9F/0
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
psect	text1010
	file	"C:\temp\dev\AK7030-OTP\main.c"
	line	2488
	global	__size_of_vHandle20sTimerOut
	__size_of_vHandle20sTimerOut	equ	__end_of_vHandle20sTimerOut-_vHandle20sTimerOut
	
_vHandle20sTimerOut:	
	opt	stack 4
; Regs used in _vHandle20sTimerOut: [wreg-fsr0h+status,2+status,0+pclath+cstack]
;vHandle20sTimerOut@bClearStep stored from wreg
	line	2493
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	movwf	(vHandle20sTimerOut@bClearStep)
	
l4757:	
;main.c: 2489: static unsigned char ucTimerOnBehaviorStep = 0;
;main.c: 2491: static unsigned char ucTimeCnt = 0;
;main.c: 2493: if( 1 == bClearStep)
	decf	(vHandle20sTimerOut@bClearStep),w
	skipz
	goto	u1931
	goto	u1930
u1931:
	goto	l4807
u1930:
	line	2495
	
l4759:	
	line	2496
;main.c: 2496: ucTimerOnBehaviorStep = 0;
	bsf	status, 5	;RP0=1, select bank1
	clrf	(vHandle20sTimerOut@ucTimerOnBehaviorStep)^080h
	line	2497
;main.c: 2497: ucTimeCnt = 0;
	clrf	(vHandle20sTimerOut@ucTimeCnt)
	goto	l4807
	line	2508
	
l4761:	
;main.c: 2503: {
;main.c: 2508: setPA3(0);
	movlw	(0)
	fcall	_setPA3
	line	2509
;main.c: 2509: setPB4(0);
	movlw	(0)
	fcall	_setPB4
	line	2510
;main.c: 2510: setPB6(1);
	movlw	(01h)
	fcall	_setPB6
	line	2511
	
l4763:	
;main.c: 2511: ucTimeCnt = 0;
	clrf	(vHandle20sTimerOut@ucTimeCnt)
	line	2512
	
l4765:	
;main.c: 2512: ucTimerOnBehaviorStep = 1;
	bsf	status, 5	;RP0=1, select bank1
	clrf	(vHandle20sTimerOut@ucTimerOnBehaviorStep)^080h
	incf	(vHandle20sTimerOut@ucTimerOnBehaviorStep)^080h,f
	line	2513
;main.c: 2513: break;
	goto	l1128
	line	2521
	
l4767:	
;main.c: 2517: {
;main.c: 2521: ucTimeCnt++;
	incf	(vHandle20sTimerOut@ucTimeCnt),f
	line	2523
	
l4769:	
;main.c: 2523: if( ucTimeCnt >= 10)
	movlw	(0Ah)
	subwf	(vHandle20sTimerOut@ucTimeCnt),w
	skipc
	goto	u1941
	goto	u1940
u1941:
	goto	l1128
u1940:
	line	2525
	
l4771:	
;main.c: 2524: {
;main.c: 2525: ucTimeCnt = 0;
	clrf	(vHandle20sTimerOut@ucTimeCnt)
	line	2526
	
l4773:	
;main.c: 2526: ucTimerOnBehaviorStep = 2;
	movlw	(02h)
	movwf	(vHandle20sTimerOut@ucTimerOnBehaviorStep)^080h
	goto	l1128
	line	2536
	
l4775:	
;main.c: 2532: {
;main.c: 2536: ucTimeCnt++;
	incf	(vHandle20sTimerOut@ucTimeCnt),f
	line	2538
	
l4777:	
;main.c: 2538: if( ucTimeCnt >= 1)
	movf	(vHandle20sTimerOut@ucTimeCnt),w
	skipz
	goto	u1950
	goto	l1128
u1950:
	line	2540
	
l4779:	
;main.c: 2539: {
;main.c: 2540: ucTimeCnt = 0;
	clrf	(vHandle20sTimerOut@ucTimeCnt)
	line	2542
	
l4781:	
;main.c: 2542: ucTimerOnBehaviorStep = 3;
	movlw	(03h)
	movwf	(vHandle20sTimerOut@ucTimerOnBehaviorStep)^080h
	goto	l1128
	line	2552
	
l4783:	
;main.c: 2548: {
;main.c: 2552: setPA3(1);
	movlw	(01h)
	fcall	_setPA3
	line	2553
;main.c: 2553: setPB4(1);
	movlw	(01h)
	fcall	_setPB4
	line	2555
	
l4785:	
;main.c: 2555: setPB6AsInput();
	fcall	_setPB6AsInput
	line	2556
	
l4787:	
;main.c: 2556: ucTimeCnt = 0;
	clrf	(vHandle20sTimerOut@ucTimeCnt)
	line	2558
	
l4789:	
;main.c: 2558: ucTimerOnBehaviorStep = 4;
	movlw	(04h)
	movwf	(vHandle20sTimerOut@ucTimerOnBehaviorStep)^080h
	line	2559
;main.c: 2559: break;
	goto	l1128
	line	2566
	
l4791:	
;main.c: 2562: {
;main.c: 2566: ucTimeCnt++;
	incf	(vHandle20sTimerOut@ucTimeCnt),f
	line	2568
	
l4793:	
;main.c: 2568: if( ucTimeCnt >= 2)
	movlw	(02h)
	subwf	(vHandle20sTimerOut@ucTimeCnt),w
	skipc
	goto	u1961
	goto	u1960
u1961:
	goto	l1128
u1960:
	line	2570
	
l4795:	
;main.c: 2569: {
;main.c: 2570: clearTwentySecondsTimer();
	fcall	_clearTwentySecondsTimer
	line	2572
	
l4797:	
;main.c: 2572: ucTimeCnt = 0;
	clrf	(vHandle20sTimerOut@ucTimeCnt)
	line	2574
	
l4799:	
;main.c: 2574: ucADC4_Step = ADC4_STEP_INIT;
	bcf	status, 5	;RP0=0, select bank0
	clrf	(_ucADC4_Step)
	line	2576
	
l4801:	
;main.c: 2576: enumMainLoopStep = MAIN_LOOP_STEP_THIRD;
	movlw	(03h)
	movwf	(_enumMainLoopStep)
	line	2578
	
l4803:	
;main.c: 2578: ucTimerOnBehaviorStep = 0;
	bsf	status, 5	;RP0=1, select bank1
	clrf	(vHandle20sTimerOut@ucTimerOnBehaviorStep)^080h
	goto	l1128
	line	2500
	
l4807:	
	bsf	status, 5	;RP0=1, select bank1
	movf	(vHandle20sTimerOut@ucTimerOnBehaviorStep)^080h,w
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
	goto	l4761
	xorlw	1^0	; case 1
	skipnz
	goto	l4767
	xorlw	2^1	; case 2
	skipnz
	goto	l4775
	xorlw	3^2	; case 3
	skipnz
	goto	l4783
	xorlw	4^3	; case 4
	skipnz
	goto	l4791
	goto	l1128
	opt asmopt_on

	line	2587
	
l1128:	
	return
	opt stack 0
GLOBAL	__end_of_vHandle20sTimerOut
	__end_of_vHandle20sTimerOut:
;; =============== function _vHandle20sTimerOut ends ============

	signat	_vHandle20sTimerOut,4216
	global	_getAdOriginalCh5Value
psect	text1011,local,class=CODE,delta=2
global __ptext1011
__ptext1011:

;; *************** function _getAdOriginalCh5Value *****************
;; Defined at:
;;		line 272 in file "C:\temp\dev\AK7030-OTP\common.c"
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
psect	text1011
	file	"C:\temp\dev\AK7030-OTP\common.c"
	line	272
	global	__size_of_getAdOriginalCh5Value
	__size_of_getAdOriginalCh5Value	equ	__end_of_getAdOriginalCh5Value-_getAdOriginalCh5Value
	
_getAdOriginalCh5Value:	
	opt	stack 4
; Regs used in _getAdOriginalCh5Value: [wreg-fsr0h+status,2+status,0+btemp+1+pclath+cstack]
	line	274
	
l4753:	
;common.c: 274: return Filter(uiSampleChannelFifth);
	movlw	(_uiSampleChannelFifth&0ffh)
	movwf	(?_Filter)
	movlw	(0x3/2)
	movwf	(?_Filter+1)
	fcall	_Filter
	movf	(1+(?_Filter)),w
	movwf	(?_getAdOriginalCh5Value+1)
	movf	(0+(?_Filter)),w
	movwf	(?_getAdOriginalCh5Value)
	line	278
	
l1872:	
	return
	opt stack 0
GLOBAL	__end_of_getAdOriginalCh5Value
	__end_of_getAdOriginalCh5Value:
;; =============== function _getAdOriginalCh5Value ends ============

	signat	_getAdOriginalCh5Value,90
	global	_getAdOriginalCh6Value
psect	text1012,local,class=CODE,delta=2
global __ptext1012
__ptext1012:

;; *************** function _getAdOriginalCh6Value *****************
;; Defined at:
;;		line 282 in file "C:\temp\dev\AK7030-OTP\common.c"
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
;;		_vHandle20sTimeron
;; This function uses a non-reentrant model
;;
psect	text1012
	file	"C:\temp\dev\AK7030-OTP\common.c"
	line	282
	global	__size_of_getAdOriginalCh6Value
	__size_of_getAdOriginalCh6Value	equ	__end_of_getAdOriginalCh6Value-_getAdOriginalCh6Value
	
_getAdOriginalCh6Value:	
	opt	stack 3
; Regs used in _getAdOriginalCh6Value: [wreg-fsr0h+status,2+status,0+btemp+1+pclath+cstack]
	line	284
	
l4749:	
;common.c: 284: return Filter(uiSampleChannelSixth);
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
	line	288
	
l1875:	
	return
	opt stack 0
GLOBAL	__end_of_getAdOriginalCh6Value
	__end_of_getAdOriginalCh6Value:
;; =============== function _getAdOriginalCh6Value ends ============

	signat	_getAdOriginalCh6Value,90
	global	_getAdOriginalCh0Value
psect	text1013,local,class=CODE,delta=2
global __ptext1013
__ptext1013:

;; *************** function _getAdOriginalCh0Value *****************
;; Defined at:
;;		line 263 in file "C:\temp\dev\AK7030-OTP\common.c"
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
psect	text1013
	file	"C:\temp\dev\AK7030-OTP\common.c"
	line	263
	global	__size_of_getAdOriginalCh0Value
	__size_of_getAdOriginalCh0Value	equ	__end_of_getAdOriginalCh0Value-_getAdOriginalCh0Value
	
_getAdOriginalCh0Value:	
	opt	stack 4
; Regs used in _getAdOriginalCh0Value: [wreg-fsr0h+status,2+status,0+btemp+1+pclath+cstack]
	line	265
	
l4745:	
;common.c: 265: return Filter(uiSampleChannelZero);
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
	line	269
	
l1869:	
	return
	opt stack 0
GLOBAL	__end_of_getAdOriginalCh0Value
	__end_of_getAdOriginalCh0Value:
;; =============== function _getAdOriginalCh0Value ends ============

	signat	_getAdOriginalCh0Value,90
	global	_clearAllTimer
psect	text1014,local,class=CODE,delta=2
global __ptext1014
__ptext1014:

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
psect	text1014
	file	"C:\temp\dev\AK7030-OTP\main.c"
	line	100
	global	__size_of_clearAllTimer
	__size_of_clearAllTimer	equ	__end_of_clearAllTimer-_clearAllTimer
	
_clearAllTimer:	
	opt	stack 4
; Regs used in _clearAllTimer: [status,2+status,0+pclath+cstack]
	line	101
	
l4743:	
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
	
l693:	
	return
	opt stack 0
GLOBAL	__end_of_clearAllTimer
	__end_of_clearAllTimer:
;; =============== function _clearAllTimer ends ============

	signat	_clearAllTimer,88
	global	_setAD_ConvertFlag
psect	text1015,local,class=CODE,delta=2
global __ptext1015
__ptext1015:

;; *************** function _setAD_ConvertFlag *****************
;; Defined at:
;;		line 239 in file "C:\temp\dev\AK7030-OTP\common.c"
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
psect	text1015
	file	"C:\temp\dev\AK7030-OTP\common.c"
	line	239
	global	__size_of_setAD_ConvertFlag
	__size_of_setAD_ConvertFlag	equ	__end_of_setAD_ConvertFlag-_setAD_ConvertFlag
	
_setAD_ConvertFlag:	
	opt	stack 4
; Regs used in _setAD_ConvertFlag: [wreg]
;setAD_ConvertFlag@flag stored from wreg
	bcf	status, 5	;RP0=0, select bank0
	movwf	(setAD_ConvertFlag@flag)
	line	240
	
l4705:	
;common.c: 240: adc_convert_flag = flag;
	movf	(setAD_ConvertFlag@flag),w
	bsf	status, 5	;RP0=1, select bank1
	movwf	(_adc_convert_flag)^080h
	line	241
	
l1863:	
	return
	opt stack 0
GLOBAL	__end_of_setAD_ConvertFlag
	__end_of_setAD_ConvertFlag:
;; =============== function _setAD_ConvertFlag ends ============

	signat	_setAD_ConvertFlag,4216
	global	_getAD_ConvertFlag
psect	text1016,local,class=CODE,delta=2
global __ptext1016
__ptext1016:

;; *************** function _getAD_ConvertFlag *****************
;; Defined at:
;;		line 233 in file "C:\temp\dev\AK7030-OTP\common.c"
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
psect	text1016
	file	"C:\temp\dev\AK7030-OTP\common.c"
	line	233
	global	__size_of_getAD_ConvertFlag
	__size_of_getAD_ConvertFlag	equ	__end_of_getAD_ConvertFlag-_getAD_ConvertFlag
	
_getAD_ConvertFlag:	
	opt	stack 4
; Regs used in _getAD_ConvertFlag: [wreg]
	line	234
	
l4701:	
;common.c: 234: return adc_convert_flag;
	bsf	status, 5	;RP0=1, select bank1
	bcf	status, 6	;RP1=0, select bank1
	movf	(_adc_convert_flag)^080h,w
	line	235
	
l1860:	
	return
	opt stack 0
GLOBAL	__end_of_getAD_ConvertFlag
	__end_of_getAD_ConvertFlag:
;; =============== function _getAD_ConvertFlag ends ============

	signat	_getAD_ConvertFlag,89
	global	_Filter
psect	text1017,local,class=CODE,delta=2
global __ptext1017
__ptext1017:

;; *************** function _Filter *****************
;; Defined at:
;;		line 67 in file "C:\temp\dev\AK7030-OTP\common.c"
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
psect	text1017
	file	"C:\temp\dev\AK7030-OTP\common.c"
	line	67
	global	__size_of_Filter
	__size_of_Filter	equ	__end_of_Filter-_Filter
	
_Filter:	
	opt	stack 3
; Regs used in _Filter: [wreg-fsr0h+status,2+status,0+btemp+1]
	line	69
	
l4591:	
	clrf	(Filter@j)
	line	71
;common.c: 71: unsigned int filter_temp = 0, filter_sum = 0;
	clrf	(Filter@filter_temp)
	clrf	(Filter@filter_temp+1)
	clrf	(Filter@filter_sum)
	clrf	(Filter@filter_sum+1)
	line	75
;common.c: 73: unsigned int filter_buf[12];
;common.c: 75: for(int cir = 0;cir < 12; cir++)
	clrf	(Filter@cir)
	clrf	(Filter@cir+1)
	line	76
	
l4597:	
;common.c: 76: filter_buf[cir] = *tmpValue++;
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
	
l4599:	
	movlw	02h
	addwf	(Filter@tmpValue),f
	skipnc
	incf	(Filter@tmpValue+1),f
	line	75
	
l4601:	
	incf	(Filter@cir),f
	skipnz
	incf	(Filter@cir+1),f
	
l4603:	
	movf	(Filter@cir+1),w
	xorlw	80h
	movwf	btemp+1
	movlw	(high(0Ch))^80h
	subwf	btemp+1,w
	skipz
	goto	u1715
	movlw	low(0Ch)
	subwf	(Filter@cir),w
u1715:

	skipc
	goto	u1711
	goto	u1710
u1711:
	goto	l4597
u1710:
	line	79
	
l4605:	
;common.c: 79: for(j = 0; j < 12 - 1; j++)
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	clrf	(Filter@j)
	line	81
	
l4611:	
;common.c: 80: {
;common.c: 81: for(i = 0; i < 12 - 1 - j; i++)
	clrf	(Filter@i)
	goto	l4619
	line	83
	
l4613:	
;common.c: 82: {
;common.c: 83: if(filter_buf[i] > filter_buf[i + 1])
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
	goto	u1725
	movf	0+(??_Filter+0)+0,w
	subwf	0+(??_Filter+2)+0,w
u1725:
	skipnc
	goto	u1721
	goto	u1720
u1721:
	goto	l4617
u1720:
	line	86
	
l4615:	
;common.c: 84: {
;common.c: 86: filter_temp = filter_buf[i];
	clrc
	rlf	(Filter@i),w
	addlw	Filter@filter_buf&0ffh
	movwf	fsr0
	movf	indf,w
	movwf	(Filter@filter_temp)
	incf	fsr0,f
	movf	indf,w
	movwf	(Filter@filter_temp+1)
	line	88
;common.c: 88: filter_buf[i] = filter_buf[i + 1];
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
	line	90
;common.c: 90: filter_buf[i + 1] = filter_temp;
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
	line	81
	
l4617:	
	incf	(Filter@i),f
	
l4619:	
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
	goto	u1735
	movf	0+(??_Filter+0)+0,w
	subwf	(Filter@i),w
u1735:

	skipc
	goto	u1731
	goto	u1730
u1731:
	goto	l4613
u1730:
	line	79
	
l4621:	
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	incf	(Filter@j),f
	
l4623:	
	movlw	(0Bh)
	subwf	(Filter@j),w
	skipc
	goto	u1741
	goto	u1740
u1741:
	goto	l4611
u1740:
	line	95
	
l4625:	
;common.c: 91: }
;common.c: 92: }
;common.c: 93: }
;common.c: 95: for(i = 2; i < 12 - 2; i++)
	movlw	(02h)
	movwf	(Filter@i)
	line	97
	
l4629:	
;common.c: 96: {
;common.c: 97: filter_sum += filter_buf[i];
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
	line	95
	
l4631:	
	incf	(Filter@i),f
	
l4633:	
	movlw	(0Ah)
	subwf	(Filter@i),w
	skipc
	goto	u1751
	goto	u1750
u1751:
	goto	l4629
u1750:
	line	100
	
l4635:	
;common.c: 98: }
;common.c: 100: return (filter_sum >> 3);
	movf	(Filter@filter_sum+1),w
	movwf	(?_Filter+1)
	movf	(Filter@filter_sum),w
	movwf	(?_Filter)
	
l4637:	
	clrc
	rrf	(?_Filter+1),f
	rrf	(?_Filter),f
	clrc
	rrf	(?_Filter+1),f
	rrf	(?_Filter),f
	clrc
	rrf	(?_Filter+1),f
	rrf	(?_Filter),f
	line	102
	
l1816:	
	return
	opt stack 0
GLOBAL	__end_of_Filter
	__end_of_Filter:
;; =============== function _Filter ends ============

	signat	_Filter,4218
	global	_vPause20sTimer
psect	text1018,local,class=CODE,delta=2
global __ptext1018
__ptext1018:

;; *************** function _vPause20sTimer *****************
;; Defined at:
;;		line 59 in file "C:\temp\dev\AK7030-OTP\common.c"
;; Parameters:    Size  Location     Type
;;  bValue          1    wreg     unsigned char 
;; Auto vars:     Size  Location     Type
;;  bValue          1    0[BANK0 ] unsigned char 
;; Return value:  Size  Location     Type
;;		None               void
;; Registers used:
;;		wreg
;; Tracked objects:
;;		On entry : 140/20
;;		On exit  : 160/20
;;		Unchanged: FFE9F/0
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
;;		_vHandle20sTimeron
;; This function uses a non-reentrant model
;;
psect	text1018
	file	"C:\temp\dev\AK7030-OTP\common.c"
	line	59
	global	__size_of_vPause20sTimer
	__size_of_vPause20sTimer	equ	__end_of_vPause20sTimer-_vPause20sTimer
	
_vPause20sTimer:	
	opt	stack 4
; Regs used in _vPause20sTimer: [wreg]
;vPause20sTimer@bValue stored from wreg
	bcf	status, 5	;RP0=0, select bank0
	movwf	(vPause20sTimer@bValue)
	line	60
	
l4589:	
;common.c: 60: bPause20secTimer = bValue;
	movf	(vPause20sTimer@bValue),w
	bsf	status, 5	;RP0=1, select bank1
	movwf	(_bPause20secTimer)^080h
	line	61
	
l1803:	
	return
	opt stack 0
GLOBAL	__end_of_vPause20sTimer
	__end_of_vPause20sTimer:
;; =============== function _vPause20sTimer ends ============

	signat	_vPause20sTimer,4216
	global	_isFinishedThreeHoursTimer
psect	text1019,local,class=CODE,delta=2
global __ptext1019
__ptext1019:

;; *************** function _isFinishedThreeHoursTimer *****************
;; Defined at:
;;		line 503 in file "C:\temp\dev\AK7030-OTP\common.c"
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
psect	text1019
	file	"C:\temp\dev\AK7030-OTP\common.c"
	line	503
	global	__size_of_isFinishedThreeHoursTimer
	__size_of_isFinishedThreeHoursTimer	equ	__end_of_isFinishedThreeHoursTimer-_isFinishedThreeHoursTimer
	
_isFinishedThreeHoursTimer:	
	opt	stack 5
; Regs used in _isFinishedThreeHoursTimer: [wreg+status,2+status,0]
	line	504
	
l4573:	
;common.c: 504: if((uiSmallTimer == 0) && bSmallTimerStartFlag)
	bsf	status, 5	;RP0=1, select bank1
	movf	((_uiSmallTimer+1)^080h),w
	iorwf	((_uiSmallTimer)^080h),w
	skipz
	goto	u1691
	goto	u1690
u1691:
	goto	l4585
u1690:
	
l4575:	
	bcf	status, 5	;RP0=0, select bank0
	movf	(_bSmallTimerStartFlag),w
	skipz
	goto	u1700
	goto	l4585
u1700:
	line	506
	
l4577:	
;common.c: 505: {
;common.c: 506: bSmallTimerStartFlag = 0;
	clrf	(_bSmallTimerStartFlag)
	line	507
	
l4579:	
;common.c: 507: return 1;
	movlw	(01h)
	goto	l1943
	line	510
	
l4585:	
;common.c: 509: else
;common.c: 510: return 0;
	movlw	(0)
	line	511
	
l1943:	
	return
	opt stack 0
GLOBAL	__end_of_isFinishedThreeHoursTimer
	__end_of_isFinishedThreeHoursTimer:
;; =============== function _isFinishedThreeHoursTimer ends ============

	signat	_isFinishedThreeHoursTimer,89
	global	_startThreeHoursTimer
psect	text1020,local,class=CODE,delta=2
global __ptext1020
__ptext1020:

;; *************** function _startThreeHoursTimer *****************
;; Defined at:
;;		line 434 in file "C:\temp\dev\AK7030-OTP\common.c"
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
psect	text1020
	file	"C:\temp\dev\AK7030-OTP\common.c"
	line	434
	global	__size_of_startThreeHoursTimer
	__size_of_startThreeHoursTimer	equ	__end_of_startThreeHoursTimer-_startThreeHoursTimer
	
_startThreeHoursTimer:	
	opt	stack 5
; Regs used in _startThreeHoursTimer: [wreg+status,2+status,0]
	line	435
	
l4565:	
;common.c: 435: if(( 0 == uiSmallTimer ) && ( 0 == bSmallTimerStartFlag ))
	bsf	status, 5	;RP0=1, select bank1
	movf	((_uiSmallTimer+1)^080h),w
	iorwf	((_uiSmallTimer)^080h),w
	skipz
	goto	u1671
	goto	u1670
u1671:
	goto	l1916
u1670:
	
l4567:	
	bcf	status, 5	;RP0=0, select bank0
	movf	(_bSmallTimerStartFlag),f
	skipz
	goto	u1681
	goto	u1680
u1681:
	goto	l1916
u1680:
	line	437
	
l4569:	
;common.c: 436: {
;common.c: 437: uiSmallTimer = uiSetTime;
	movf	(startThreeHoursTimer@uiSetTime+1),w
	bsf	status, 5	;RP0=1, select bank1
	movwf	(_uiSmallTimer+1)^080h
	bcf	status, 5	;RP0=0, select bank0
	movf	(startThreeHoursTimer@uiSetTime),w
	bsf	status, 5	;RP0=1, select bank1
	movwf	(_uiSmallTimer)^080h
	line	438
	
l4571:	
;common.c: 438: bSmallTimerStartFlag = 1;
	bcf	status, 5	;RP0=0, select bank0
	clrf	(_bSmallTimerStartFlag)
	incf	(_bSmallTimerStartFlag),f
	line	444
	
l1916:	
	return
	opt stack 0
GLOBAL	__end_of_startThreeHoursTimer
	__end_of_startThreeHoursTimer:
;; =============== function _startThreeHoursTimer ends ============

	signat	_startThreeHoursTimer,4216
	global	_isFinishedTwentySecondsTimer
psect	text1021,local,class=CODE,delta=2
global __ptext1021
__ptext1021:

;; *************** function _isFinishedTwentySecondsTimer *****************
;; Defined at:
;;		line 468 in file "C:\temp\dev\AK7030-OTP\common.c"
;; Parameters:    Size  Location     Type
;;		None
;; Auto vars:     Size  Location     Type
;;		None
;; Return value:  Size  Location     Type
;;                  1    wreg      unsigned char 
;; Registers used:
;;		wreg, status,2, status,0
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
;; Hardware stack levels required when called:    2
;; This function calls:
;;		Nothing
;; This function is called by:
;;		_main
;; This function uses a non-reentrant model
;;
psect	text1021
	file	"C:\temp\dev\AK7030-OTP\common.c"
	line	468
	global	__size_of_isFinishedTwentySecondsTimer
	__size_of_isFinishedTwentySecondsTimer	equ	__end_of_isFinishedTwentySecondsTimer-_isFinishedTwentySecondsTimer
	
_isFinishedTwentySecondsTimer:	
	opt	stack 5
; Regs used in _isFinishedTwentySecondsTimer: [wreg+status,2+status,0]
	line	469
	
l4551:	
;common.c: 469: if(( 0 == uiTwentySecondsTimer ) && bTwentySecStartFlag )
	bsf	status, 5	;RP0=1, select bank1
	bcf	status, 6	;RP1=0, select bank1
	movf	((_uiTwentySecondsTimer+1)^080h),w
	iorwf	((_uiTwentySecondsTimer)^080h),w
	skipz
	goto	u1651
	goto	u1650
u1651:
	goto	l4561
u1650:
	
l4553:	
	bcf	status, 5	;RP0=0, select bank0
	movf	(_bTwentySecStartFlag),w
	skipz
	goto	u1660
	goto	l4561
u1660:
	line	472
	
l4555:	
;common.c: 470: {
;common.c: 472: return 1;
	movlw	(01h)
	goto	l1928
	line	475
	
l4561:	
;common.c: 474: else
;common.c: 475: return 0;
	movlw	(0)
	line	476
	
l1928:	
	return
	opt stack 0
GLOBAL	__end_of_isFinishedTwentySecondsTimer
	__end_of_isFinishedTwentySecondsTimer:
;; =============== function _isFinishedTwentySecondsTimer ends ============

	signat	_isFinishedTwentySecondsTimer,89
	global	_startTwentySecondsTimer
psect	text1022,local,class=CODE,delta=2
global __ptext1022
__ptext1022:

;; *************** function _startTwentySecondsTimer *****************
;; Defined at:
;;		line 448 in file "C:\temp\dev\AK7030-OTP\common.c"
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
psect	text1022
	file	"C:\temp\dev\AK7030-OTP\common.c"
	line	448
	global	__size_of_startTwentySecondsTimer
	__size_of_startTwentySecondsTimer	equ	__end_of_startTwentySecondsTimer-_startTwentySecondsTimer
	
_startTwentySecondsTimer:	
	opt	stack 5
; Regs used in _startTwentySecondsTimer: [wreg+status,2+status,0]
	line	449
	
l4543:	
;common.c: 449: if(( 0 == uiTwentySecondsTimer) && ( 0 == bTwentySecStartFlag))
	bsf	status, 5	;RP0=1, select bank1
	bcf	status, 6	;RP1=0, select bank1
	movf	((_uiTwentySecondsTimer+1)^080h),w
	iorwf	((_uiTwentySecondsTimer)^080h),w
	skipz
	goto	u1631
	goto	u1630
u1631:
	goto	l1920
u1630:
	
l4545:	
	bcf	status, 5	;RP0=0, select bank0
	movf	(_bTwentySecStartFlag),f
	skipz
	goto	u1641
	goto	u1640
u1641:
	goto	l1920
u1640:
	line	451
	
l4547:	
;common.c: 450: {
;common.c: 451: uiTwentySecondsTimer = 20;
	movlw	014h
	bsf	status, 5	;RP0=1, select bank1
	movwf	(_uiTwentySecondsTimer)^080h
	clrf	(_uiTwentySecondsTimer+1)^080h
	line	452
	
l4549:	
;common.c: 452: bTwentySecStartFlag = 1;
	bcf	status, 5	;RP0=0, select bank0
	clrf	(_bTwentySecStartFlag)
	incf	(_bTwentySecStartFlag),f
	line	454
	
l1920:	
	return
	opt stack 0
GLOBAL	__end_of_startTwentySecondsTimer
	__end_of_startTwentySecondsTimer:
;; =============== function _startTwentySecondsTimer ends ============

	signat	_startTwentySecondsTimer,88
	global	_isFinishedTwelveHoursTimer
psect	text1023,local,class=CODE,delta=2
global __ptext1023
__ptext1023:

;; *************** function _isFinishedTwelveHoursTimer *****************
;; Defined at:
;;		line 492 in file "C:\temp\dev\AK7030-OTP\common.c"
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
psect	text1023
	file	"C:\temp\dev\AK7030-OTP\common.c"
	line	492
	global	__size_of_isFinishedTwelveHoursTimer
	__size_of_isFinishedTwelveHoursTimer	equ	__end_of_isFinishedTwelveHoursTimer-_isFinishedTwelveHoursTimer
	
_isFinishedTwelveHoursTimer:	
	opt	stack 5
; Regs used in _isFinishedTwelveHoursTimer: [wreg+status,2+status,0]
	line	493
	
l4527:	
;common.c: 493: if(( uiBigTimer == 0 ) && bBigTimerStartFlag )
	bsf	status, 5	;RP0=1, select bank1
	movf	((_uiBigTimer+1)^080h),w
	iorwf	((_uiBigTimer)^080h),w
	skipz
	goto	u1611
	goto	u1610
u1611:
	goto	l4539
u1610:
	
l4529:	
	bcf	status, 5	;RP0=0, select bank0
	movf	(_bBigTimerStartFlag),w
	skipz
	goto	u1620
	goto	l4539
u1620:
	line	495
	
l4531:	
;common.c: 494: {
;common.c: 495: bBigTimerStartFlag = 0;
	clrf	(_bBigTimerStartFlag)
	line	496
	
l4533:	
;common.c: 496: return 1;
	movlw	(01h)
	goto	l1938
	line	499
	
l4539:	
;common.c: 498: else
;common.c: 499: return 0;
	movlw	(0)
	line	500
	
l1938:	
	return
	opt stack 0
GLOBAL	__end_of_isFinishedTwelveHoursTimer
	__end_of_isFinishedTwelveHoursTimer:
;; =============== function _isFinishedTwelveHoursTimer ends ============

	signat	_isFinishedTwelveHoursTimer,89
	global	_startTwelveHourTimer
psect	text1024,local,class=CODE,delta=2
global __ptext1024
__ptext1024:

;; *************** function _startTwelveHourTimer *****************
;; Defined at:
;;		line 392 in file "C:\temp\dev\AK7030-OTP\common.c"
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
psect	text1024
	file	"C:\temp\dev\AK7030-OTP\common.c"
	line	392
	global	__size_of_startTwelveHourTimer
	__size_of_startTwelveHourTimer	equ	__end_of_startTwelveHourTimer-_startTwelveHourTimer
	
_startTwelveHourTimer:	
	opt	stack 5
; Regs used in _startTwelveHourTimer: [wreg+status,2+status,0]
	line	393
	
l4519:	
;common.c: 393: if((0 == uiBigTimer) && ( 0 == bBigTimerStartFlag))
	bsf	status, 5	;RP0=1, select bank1
	movf	((_uiBigTimer+1)^080h),w
	iorwf	((_uiBigTimer)^080h),w
	skipz
	goto	u1591
	goto	u1590
u1591:
	goto	l1900
u1590:
	
l4521:	
	bcf	status, 5	;RP0=0, select bank0
	movf	(_bBigTimerStartFlag),f
	skipz
	goto	u1601
	goto	u1600
u1601:
	goto	l1900
u1600:
	line	395
	
l4523:	
;common.c: 394: {
;common.c: 395: uiBigTimer = uiSetTime;
	movf	(startTwelveHourTimer@uiSetTime+1),w
	bsf	status, 5	;RP0=1, select bank1
	movwf	(_uiBigTimer+1)^080h
	bcf	status, 5	;RP0=0, select bank0
	movf	(startTwelveHourTimer@uiSetTime),w
	bsf	status, 5	;RP0=1, select bank1
	movwf	(_uiBigTimer)^080h
	line	396
	
l4525:	
;common.c: 396: bBigTimerStartFlag = 1;
	bcf	status, 5	;RP0=0, select bank0
	clrf	(_bBigTimerStartFlag)
	incf	(_bBigTimerStartFlag),f
	line	403
	
l1900:	
	return
	opt stack 0
GLOBAL	__end_of_startTwelveHourTimer
	__end_of_startTwelveHourTimer:
;; =============== function _startTwelveHourTimer ends ============

	signat	_startTwelveHourTimer,4216
	global	_isFinishedTwentyMinuteTimer
psect	text1025,local,class=CODE,delta=2
global __ptext1025
__ptext1025:

;; *************** function _isFinishedTwentyMinuteTimer *****************
;; Defined at:
;;		line 480 in file "C:\temp\dev\AK7030-OTP\common.c"
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
psect	text1025
	file	"C:\temp\dev\AK7030-OTP\common.c"
	line	480
	global	__size_of_isFinishedTwentyMinuteTimer
	__size_of_isFinishedTwentyMinuteTimer	equ	__end_of_isFinishedTwentyMinuteTimer-_isFinishedTwentyMinuteTimer
	
_isFinishedTwentyMinuteTimer:	
	opt	stack 5
; Regs used in _isFinishedTwentyMinuteTimer: [wreg+status,2+status,0]
	line	481
	
l4503:	
;common.c: 481: if(( 0 == uiTwentyMinuteTimer ) && bTwentyMinStartFlag )
	bsf	status, 5	;RP0=1, select bank1
	movf	((_uiTwentyMinuteTimer+1)^080h),w
	iorwf	((_uiTwentyMinuteTimer)^080h),w
	skipz
	goto	u1571
	goto	u1570
u1571:
	goto	l4515
u1570:
	
l4505:	
	bcf	status, 5	;RP0=0, select bank0
	movf	(_bTwentyMinStartFlag),w
	skipz
	goto	u1580
	goto	l4515
u1580:
	line	483
	
l4507:	
;common.c: 482: {
;common.c: 483: bTwentyMinStartFlag = 0;
	clrf	(_bTwentyMinStartFlag)
	line	484
	
l4509:	
;common.c: 484: return 1;
	movlw	(01h)
	goto	l1933
	line	487
	
l4515:	
;common.c: 486: else
;common.c: 487: return 0;
	movlw	(0)
	line	488
	
l1933:	
	return
	opt stack 0
GLOBAL	__end_of_isFinishedTwentyMinuteTimer
	__end_of_isFinishedTwentyMinuteTimer:
;; =============== function _isFinishedTwentyMinuteTimer ends ============

	signat	_isFinishedTwentyMinuteTimer,89
	global	_clrSampeTime
psect	text1026,local,class=CODE,delta=2
global __ptext1026
__ptext1026:

;; *************** function _clrSampeTime *****************
;; Defined at:
;;		line 524 in file "C:\temp\dev\AK7030-OTP\common.c"
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
psect	text1026
	file	"C:\temp\dev\AK7030-OTP\common.c"
	line	524
	global	__size_of_clrSampeTime
	__size_of_clrSampeTime	equ	__end_of_clrSampeTime-_clrSampeTime
	
_clrSampeTime:	
	opt	stack 5
; Regs used in _clrSampeTime: [status,2]
	line	525
	
l4501:	
;common.c: 525: timer.timer10msStopWatch = 0;
	clrf	(_timer)^080h
	line	526
	
l1952:	
	return
	opt stack 0
GLOBAL	__end_of_clrSampeTime
	__end_of_clrSampeTime:
;; =============== function _clrSampeTime ends ============

	signat	_clrSampeTime,88
	global	_isPermitSampleTime
psect	text1027,local,class=CODE,delta=2
global __ptext1027
__ptext1027:

;; *************** function _isPermitSampleTime *****************
;; Defined at:
;;		line 514 in file "C:\temp\dev\AK7030-OTP\common.c"
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
psect	text1027
	file	"C:\temp\dev\AK7030-OTP\common.c"
	line	514
	global	__size_of_isPermitSampleTime
	__size_of_isPermitSampleTime	equ	__end_of_isPermitSampleTime-_isPermitSampleTime
	
_isPermitSampleTime:	
	opt	stack 5
; Regs used in _isPermitSampleTime: [wreg]
	line	515
	
l4489:	
;common.c: 515: if(timer.timer10msStopWatch >= 10)
	movlw	(0Ah)
	bsf	status, 5	;RP0=1, select bank1
	subwf	(_timer)^080h,w
	skipc
	goto	u1561
	goto	u1560
u1561:
	goto	l4497
u1560:
	line	517
	
l4491:	
;common.c: 516: {
;common.c: 517: return 1;
	movlw	(01h)
	goto	l1948
	line	520
	
l4497:	
;common.c: 519: else
;common.c: 520: return 0;
	movlw	(0)
	line	521
	
l1948:	
	return
	opt stack 0
GLOBAL	__end_of_isPermitSampleTime
	__end_of_isPermitSampleTime:
;; =============== function _isPermitSampleTime ends ============

	signat	_isPermitSampleTime,89
	global	_startTwentyMinuteTimer
psect	text1028,local,class=CODE,delta=2
global __ptext1028
__ptext1028:

;; *************** function _startTwentyMinuteTimer *****************
;; Defined at:
;;		line 458 in file "C:\temp\dev\AK7030-OTP\common.c"
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
psect	text1028
	file	"C:\temp\dev\AK7030-OTP\common.c"
	line	458
	global	__size_of_startTwentyMinuteTimer
	__size_of_startTwentyMinuteTimer	equ	__end_of_startTwentyMinuteTimer-_startTwentyMinuteTimer
	
_startTwentyMinuteTimer:	
	opt	stack 5
; Regs used in _startTwentyMinuteTimer: [wreg+status,2+status,0]
	line	459
	
l4481:	
;common.c: 459: if(( 0 == uiTwentyMinuteTimer) && ( 0 == bTwentyMinStartFlag))
	bsf	status, 5	;RP0=1, select bank1
	movf	((_uiTwentyMinuteTimer+1)^080h),w
	iorwf	((_uiTwentyMinuteTimer)^080h),w
	skipz
	goto	u1541
	goto	u1540
u1541:
	goto	l1924
u1540:
	
l4483:	
	bcf	status, 5	;RP0=0, select bank0
	movf	(_bTwentyMinStartFlag),f
	skipz
	goto	u1551
	goto	u1550
u1551:
	goto	l1924
u1550:
	line	461
	
l4485:	
;common.c: 460: {
;common.c: 461: uiTwentyMinuteTimer = uiValue;
	movf	(startTwentyMinuteTimer@uiValue+1),w
	bsf	status, 5	;RP0=1, select bank1
	movwf	(_uiTwentyMinuteTimer+1)^080h
	bcf	status, 5	;RP0=0, select bank0
	movf	(startTwentyMinuteTimer@uiValue),w
	bsf	status, 5	;RP0=1, select bank1
	movwf	(_uiTwentyMinuteTimer)^080h
	line	462
	
l4487:	
;common.c: 462: bTwentyMinStartFlag = 1;
	bcf	status, 5	;RP0=0, select bank0
	clrf	(_bTwentyMinStartFlag)
	incf	(_bTwentyMinStartFlag),f
	line	464
	
l1924:	
	return
	opt stack 0
GLOBAL	__end_of_startTwentyMinuteTimer
	__end_of_startTwentyMinuteTimer:
;; =============== function _startTwentyMinuteTimer ends ============

	signat	_startTwentyMinuteTimer,4216
	global	_adc_start
psect	text1029,local,class=CODE,delta=2
global __ptext1029
__ptext1029:

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
psect	text1029
	file	"C:\temp\dev\AK7030-OTP\periph.c"
	line	100
	global	__size_of_adc_start
	__size_of_adc_start	equ	__end_of_adc_start-_adc_start
	
_adc_start:	
	opt	stack 4
; Regs used in _adc_start: []
	line	101
	
l4479:	
;periph.c: 101: GO=1;
	bcf	status, 5	;RP0=0, select bank0
	bsf	(249/8),(249)&7
	line	102
	
l2617:	
	return
	opt stack 0
GLOBAL	__end_of_adc_start
	__end_of_adc_start:
;; =============== function _adc_start ends ============

	signat	_adc_start,88
	global	_adc_test_init
psect	text1030,local,class=CODE,delta=2
global __ptext1030
__ptext1030:

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
psect	text1030
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
	
l4469:	
;periph.c: 86: ADCON0 = 0x00;
	clrf	(31)	;volatile
	line	87
	
l4471:	
;periph.c: 87: ADCON0|=channel<<2;
	movf	(adc_test_init@channel),w
	movwf	(??_adc_test_init+0)+0
	clrc
	rlf	(??_adc_test_init+0)+0,f
	clrc
	rlf	(??_adc_test_init+0)+0,w
	iorwf	(31),f	;volatile
	line	88
	
l4473:	
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
	
l4475:	
;periph.c: 89: ADON=1;
	bcf	status, 5	;RP0=0, select bank0
	bsf	(248/8),(248)&7
	line	90
	
l4477:	
;periph.c: 90: ADIE=1;
	bsf	status, 5	;RP0=1, select bank1
	bsf	(1130/8)^080h,(1130)&7
	line	91
	
l2611:	
	return
	opt stack 0
GLOBAL	__end_of_adc_test_init
	__end_of_adc_test_init:
;; =============== function _adc_test_init ends ============

	signat	_adc_test_init,8312
	global	_timer1_interrupt_config
psect	text1031,local,class=CODE,delta=2
global __ptext1031
__ptext1031:

;; *************** function _timer1_interrupt_config *****************
;; Defined at:
;;		line 225 in file "C:\temp\dev\AK7030-OTP\common.c"
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
psect	text1031
	file	"C:\temp\dev\AK7030-OTP\common.c"
	line	225
	global	__size_of_timer1_interrupt_config
	__size_of_timer1_interrupt_config	equ	__end_of_timer1_interrupt_config-_timer1_interrupt_config
	
_timer1_interrupt_config:	
	opt	stack 5
; Regs used in _timer1_interrupt_config: []
	line	226
	
l4467:	
;common.c: 226: GIE = 1;
	bsf	(95/8),(95)&7
	line	227
;common.c: 227: PEIE = 1;
	bsf	(94/8),(94)&7
	line	228
	
l1857:	
	return
	opt stack 0
GLOBAL	__end_of_timer1_interrupt_config
	__end_of_timer1_interrupt_config:
;; =============== function _timer1_interrupt_config ends ============

	signat	_timer1_interrupt_config,88
	global	_timer1_config
psect	text1032,local,class=CODE,delta=2
global __ptext1032
__ptext1032:

;; *************** function _timer1_config *****************
;; Defined at:
;;		line 213 in file "C:\temp\dev\AK7030-OTP\common.c"
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
psect	text1032
	file	"C:\temp\dev\AK7030-OTP\common.c"
	line	213
	global	__size_of_timer1_config
	__size_of_timer1_config	equ	__end_of_timer1_config-_timer1_config
	
_timer1_config:	
	opt	stack 5
; Regs used in _timer1_config: [wreg]
	line	215
	
l4463:	
;common.c: 215: TMR1H=0xCF;
	movlw	(0CFh)
	bcf	status, 6	;RP1=0, select bank0
	movwf	(15)	;volatile
	line	216
;common.c: 216: TMR1L=0x2C;
	movlw	(02Ch)
	movwf	(14)	;volatile
	line	217
;common.c: 217: T1CON=0xE1;
	movlw	(0E1h)
	movwf	(16)	;volatile
	line	218
	
l4465:	
;common.c: 218: TMR1IE=1;
	bsf	status, 5	;RP0=1, select bank1
	bsf	(1120/8)^080h,(1120)&7
	line	220
	
l1854:	
	return
	opt stack 0
GLOBAL	__end_of_timer1_config
	__end_of_timer1_config:
;; =============== function _timer1_config ends ============

	signat	_timer1_config,88
	global	_clock_config
psect	text1033,local,class=CODE,delta=2
global __ptext1033
__ptext1033:

;; *************** function _clock_config *****************
;; Defined at:
;;		line 205 in file "C:\temp\dev\AK7030-OTP\common.c"
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
psect	text1033
	file	"C:\temp\dev\AK7030-OTP\common.c"
	line	205
	global	__size_of_clock_config
	__size_of_clock_config	equ	__end_of_clock_config-_clock_config
	
_clock_config:	
	opt	stack 5
; Regs used in _clock_config: [wreg+status,2]
	line	207
	
l4459:	
;common.c: 207: CLKPR = 0x80;
	movlw	(080h)
	bcf	status, 5	;RP0=0, select bank2
	bsf	status, 6	;RP1=1, select bank2
	movwf	(264)^0100h	;volatile
	line	208
	
l4461:	
;common.c: 208: CLKPR = 0x00;
	clrf	(264)^0100h	;volatile
	line	209
;common.c: 209: while(CLKPCE);
	
l1848:	
	btfsc	(2119/8)^0100h,(2119)&7
	goto	u1531
	goto	u1530
u1531:
	goto	l1848
u1530:
	line	210
	
l1851:	
	return
	opt stack 0
GLOBAL	__end_of_clock_config
	__end_of_clock_config:
;; =============== function _clock_config ends ============

	signat	_clock_config,88
	global	_setPB6AsInput
psect	text1034,local,class=CODE,delta=2
global __ptext1034
__ptext1034:

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
;;		_vHandle20sTimeron
;;		_vHandle20sTimerOut
;; This function uses a non-reentrant model
;;
psect	text1034
	file	"C:\temp\dev\AK7030-OTP\main.c"
	line	372
	global	__size_of_setPB6AsInput
	__size_of_setPB6AsInput	equ	__end_of_setPB6AsInput-_setPB6AsInput
	
_setPB6AsInput:	
	opt	stack 4
; Regs used in _setPB6AsInput: []
	line	374
	
l4457:	
;main.c: 374: TRISB6 = 1;
	bsf	status, 5	;RP0=1, select bank1
	bsf	(1078/8)^080h,(1078)&7
	line	379
	
l757:	
	return
	opt stack 0
GLOBAL	__end_of_setPB6AsInput
	__end_of_setPB6AsInput:
;; =============== function _setPB6AsInput ends ============

	signat	_setPB6AsInput,88
	global	_setPA6
psect	text1035,local,class=CODE,delta=2
global __ptext1035
__ptext1035:

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
psect	text1035
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
	
l4453:	
;main.c: 357: if( bValue )
	movf	(setPA6@bValue),w
	skipz
	goto	u1520
	goto	l752
u1520:
	line	359
	
l4455:	
;main.c: 359: PA6 = 1;
	bsf	(46/8),(46)&7
	goto	l754
	line	363
	
l752:	
	line	365
;main.c: 363: else
;main.c: 365: PA6= 0;
	bcf	(46/8),(46)&7
	line	369
	
l754:	
	return
	opt stack 0
GLOBAL	__end_of_setPA6
	__end_of_setPA6:
;; =============== function _setPA6 ends ============

	signat	_setPA6,4216
	global	_setPB4
psect	text1036,local,class=CODE,delta=2
global __ptext1036
__ptext1036:

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
;;		_vHandle20sTimerOut
;; This function uses a non-reentrant model
;;
psect	text1036
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
	
l4449:	
;main.c: 311: if( bValue )
	movf	(setPB4@bValue),w
	skipz
	goto	u1510
	goto	l742
u1510:
	line	313
	
l4451:	
;main.c: 313: PB4 = 1;
	bsf	(52/8),(52)&7
	goto	l744
	line	317
	
l742:	
	line	319
;main.c: 317: else
;main.c: 319: PB4 = 0;
	bcf	(52/8),(52)&7
	line	323
	
l744:	
	return
	opt stack 0
GLOBAL	__end_of_setPB4
	__end_of_setPB4:
;; =============== function _setPB4 ends ============

	signat	_setPB4,4216
	global	_setPB6
psect	text1037,local,class=CODE,delta=2
global __ptext1037
__ptext1037:

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
;;		_vHandle20sTimeron
;;		_vHandle20sTimerOut
;; This function uses a non-reentrant model
;;
psect	text1037
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
	
l4445:	
;main.c: 287: if( bValue )
	movf	(setPB6@bValue),w
	skipz
	goto	u1500
	goto	l737
u1500:
	line	290
	
l4447:	
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
	goto	l739
	line	296
	
l737:	
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
	
l739:	
	return
	opt stack 0
GLOBAL	__end_of_setPB6
	__end_of_setPB6:
;; =============== function _setPB6 ends ============

	signat	_setPB6,4216
	global	_setPA3
psect	text1038,local,class=CODE,delta=2
global __ptext1038
__ptext1038:

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
;;		_vHandle20sTimeron
;;		_vHandle20sTimerOut
;; This function uses a non-reentrant model
;;
psect	text1038
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
	
l4441:	
;main.c: 270: if( bValue )
	movf	(setPA3@bValue),w
	skipz
	goto	u1490
	goto	l732
u1490:
	line	272
	
l4443:	
;main.c: 272: PA3 = 1;
	bsf	(43/8),(43)&7
	goto	l734
	line	276
	
l732:	
	line	278
;main.c: 276: else
;main.c: 278: PA3 = 0;
	bcf	(43/8),(43)&7
	line	282
	
l734:	
	return
	opt stack 0
GLOBAL	__end_of_setPA3
	__end_of_setPA3:
;; =============== function _setPA3 ends ============

	signat	_setPA3,4216
	global	_setPA2
psect	text1039,local,class=CODE,delta=2
global __ptext1039
__ptext1039:

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
psect	text1039
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
	
l4437:	
;main.c: 253: if( bValue )
	movf	(setPA2@bValue),w
	skipz
	goto	u1480
	goto	l727
u1480:
	line	255
	
l4439:	
;main.c: 255: PA2 = 1;
	bsf	(42/8),(42)&7
	goto	l729
	line	259
	
l727:	
	line	261
;main.c: 259: else
;main.c: 261: PA2 = 0;
	bcf	(42/8),(42)&7
	line	265
	
l729:	
	return
	opt stack 0
GLOBAL	__end_of_setPA2
	__end_of_setPA2:
;; =============== function _setPA2 ends ============

	signat	_setPA2,4216
	global	_setPA1
psect	text1040,local,class=CODE,delta=2
global __ptext1040
__ptext1040:

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
psect	text1040
	file	"C:\temp\dev\AK7030-OTP\main.c"
	line	234
	global	__size_of_setPA1
	__size_of_setPA1	equ	__end_of_setPA1-_setPA1
	
_setPA1:	
	opt	stack 5
; Regs used in _setPA1: [wreg]
;setPA1@bValue stored from wreg
	movwf	(setPA1@bValue)
	line	235
	
l4433:	
;main.c: 235: if( bValue )
	movf	(setPA1@bValue),w
	skipz
	goto	u1470
	goto	l722
u1470:
	line	237
	
l4435:	
;main.c: 237: PA1 = 1;
	bsf	(41/8),(41)&7
	goto	l724
	line	241
	
l722:	
	line	243
;main.c: 241: else
;main.c: 243: PA1 = 0;
	bcf	(41/8),(41)&7
	line	247
	
l724:	
	return
	opt stack 0
GLOBAL	__end_of_setPA1
	__end_of_setPA1:
;; =============== function _setPA1 ends ============

	signat	_setPA1,4216
	global	_setPA0
psect	text1041,local,class=CODE,delta=2
global __ptext1041
__ptext1041:

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
psect	text1041
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
	
l4429:	
;main.c: 218: if( bValue )
	movf	(setPA0@bValue),w
	skipz
	goto	u1460
	goto	l717
u1460:
	line	220
	
l4431:	
;main.c: 220: PA0 = 1;
	bsf	(40/8),(40)&7
	goto	l719
	line	224
	
l717:	
	line	226
;main.c: 224: else
;main.c: 226: PA0 = 0;
	bcf	(40/8),(40)&7
	line	230
	
l719:	
	return
	opt stack 0
GLOBAL	__end_of_setPA0
	__end_of_setPA0:
;; =============== function _setPA0 ends ============

	signat	_setPA0,4216
	global	_setPB2
psect	text1042,local,class=CODE,delta=2
global __ptext1042
__ptext1042:

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
psect	text1042
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
	
l4425:	
;main.c: 201: if( bValue )
	movf	(setPB2@bValue),w
	skipz
	goto	u1450
	goto	l712
u1450:
	line	203
	
l4427:	
;main.c: 203: PB2 = 1;
	bsf	(50/8),(50)&7
	goto	l714
	line	207
	
l712:	
	line	209
;main.c: 207: else
;main.c: 209: PB2 = 0;
	bcf	(50/8),(50)&7
	line	213
	
l714:	
	return
	opt stack 0
GLOBAL	__end_of_setPB2
	__end_of_setPB2:
;; =============== function _setPB2 ends ============

	signat	_setPB2,4216
	global	_setPB1
psect	text1043,local,class=CODE,delta=2
global __ptext1043
__ptext1043:

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
psect	text1043
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
	
l4421:	
;main.c: 184: if( bValue )
	movf	(setPB1@bValue),w
	skipz
	goto	u1440
	goto	l707
u1440:
	line	186
	
l4423:	
;main.c: 186: PB1 = 1;
	bsf	(49/8),(49)&7
	goto	l709
	line	190
	
l707:	
	line	192
;main.c: 190: else
;main.c: 192: PB1 = 0;
	bcf	(49/8),(49)&7
	line	196
	
l709:	
	return
	opt stack 0
GLOBAL	__end_of_setPB1
	__end_of_setPB1:
;; =============== function _setPB1 ends ============

	signat	_setPB1,4216
	global	_setPB0
psect	text1044,local,class=CODE,delta=2
global __ptext1044
__ptext1044:

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
psect	text1044
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
	
l4417:	
;main.c: 167: if( bValue )
	movf	(setPB0@bValue),w
	skipz
	goto	u1430
	goto	l702
u1430:
	line	169
	
l4419:	
;main.c: 169: PB0 = 1;
	bsf	(48/8),(48)&7
	goto	l704
	line	173
	
l702:	
	line	175
;main.c: 173: else
;main.c: 175: PB0 = 0;
	bcf	(48/8),(48)&7
	line	179
	
l704:	
	return
	opt stack 0
GLOBAL	__end_of_setPB0
	__end_of_setPB0:
;; =============== function _setPB0 ends ============

	signat	_setPB0,4216
	global	_initPin
psect	text1045,local,class=CODE,delta=2
global __ptext1045
__ptext1045:

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
psect	text1045
	file	"C:\temp\dev\AK7030-OTP\main.c"
	line	129
	global	__size_of_initPin
	__size_of_initPin	equ	__end_of_initPin-_initPin
	
_initPin:	
	opt	stack 5
; Regs used in _initPin: []
	line	132
	
l4415:	
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
	
l699:	
	return
	opt stack 0
GLOBAL	__end_of_initPin
	__end_of_initPin:
;; =============== function _initPin ends ============

	signat	_initPin,88
	global	_clearTwentyMinuteTimer
psect	text1046,local,class=CODE,delta=2
global __ptext1046
__ptext1046:

;; *************** function _clearTwentyMinuteTimer *****************
;; Defined at:
;;		line 427 in file "C:\temp\dev\AK7030-OTP\common.c"
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
psect	text1046
	file	"C:\temp\dev\AK7030-OTP\common.c"
	line	427
	global	__size_of_clearTwentyMinuteTimer
	__size_of_clearTwentyMinuteTimer	equ	__end_of_clearTwentyMinuteTimer-_clearTwentyMinuteTimer
	
_clearTwentyMinuteTimer:	
	opt	stack 4
; Regs used in _clearTwentyMinuteTimer: [status,2]
	line	428
	
l4413:	
;common.c: 428: uiTwentyMinuteTimer = 0;
	clrf	(_uiTwentyMinuteTimer)^080h
	clrf	(_uiTwentyMinuteTimer+1)^080h
	line	429
;common.c: 429: bTwentyMinStartFlag = 0;
	bcf	status, 5	;RP0=0, select bank0
	clrf	(_bTwentyMinStartFlag)
	line	430
	
l1912:	
	return
	opt stack 0
GLOBAL	__end_of_clearTwentyMinuteTimer
	__end_of_clearTwentyMinuteTimer:
;; =============== function _clearTwentyMinuteTimer ends ============

	signat	_clearTwentyMinuteTimer,88
	global	_clearTwentySecondsTimer
psect	text1047,local,class=CODE,delta=2
global __ptext1047
__ptext1047:

;; *************** function _clearTwentySecondsTimer *****************
;; Defined at:
;;		line 419 in file "C:\temp\dev\AK7030-OTP\common.c"
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
;;		_clearAllTimer
;;		_vHandle20sTimerOut
;; This function uses a non-reentrant model
;;
psect	text1047
	file	"C:\temp\dev\AK7030-OTP\common.c"
	line	419
	global	__size_of_clearTwentySecondsTimer
	__size_of_clearTwentySecondsTimer	equ	__end_of_clearTwentySecondsTimer-_clearTwentySecondsTimer
	
_clearTwentySecondsTimer:	
	opt	stack 4
; Regs used in _clearTwentySecondsTimer: [status,2]
	line	420
	
l4411:	
;common.c: 420: uiTwentySecondsTimer = 0;
	bsf	status, 5	;RP0=1, select bank1
	clrf	(_uiTwentySecondsTimer)^080h
	clrf	(_uiTwentySecondsTimer+1)^080h
	line	421
;common.c: 421: bTwentySecStartFlag = 0;
	bcf	status, 5	;RP0=0, select bank0
	clrf	(_bTwentySecStartFlag)
	line	422
;common.c: 422: bPause20secTimer = 0;
	bsf	status, 5	;RP0=1, select bank1
	clrf	(_bPause20secTimer)^080h
	line	423
	
l1909:	
	return
	opt stack 0
GLOBAL	__end_of_clearTwentySecondsTimer
	__end_of_clearTwentySecondsTimer:
;; =============== function _clearTwentySecondsTimer ends ============

	signat	_clearTwentySecondsTimer,88
	global	_clearThreeHoursTimer
psect	text1048,local,class=CODE,delta=2
global __ptext1048
__ptext1048:

;; *************** function _clearThreeHoursTimer *****************
;; Defined at:
;;		line 413 in file "C:\temp\dev\AK7030-OTP\common.c"
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
psect	text1048
	file	"C:\temp\dev\AK7030-OTP\common.c"
	line	413
	global	__size_of_clearThreeHoursTimer
	__size_of_clearThreeHoursTimer	equ	__end_of_clearThreeHoursTimer-_clearThreeHoursTimer
	
_clearThreeHoursTimer:	
	opt	stack 4
; Regs used in _clearThreeHoursTimer: [status,2]
	line	414
	
l4409:	
;common.c: 414: uiSmallTimer = 0;
	bsf	status, 5	;RP0=1, select bank1
	clrf	(_uiSmallTimer)^080h
	clrf	(_uiSmallTimer+1)^080h
	line	415
;common.c: 415: bSmallTimerStartFlag = 0;
	bcf	status, 5	;RP0=0, select bank0
	clrf	(_bSmallTimerStartFlag)
	line	416
	
l1906:	
	return
	opt stack 0
GLOBAL	__end_of_clearThreeHoursTimer
	__end_of_clearThreeHoursTimer:
;; =============== function _clearThreeHoursTimer ends ============

	signat	_clearThreeHoursTimer,88
	global	_clearTwelveHoursTimer
psect	text1049,local,class=CODE,delta=2
global __ptext1049
__ptext1049:

;; *************** function _clearTwelveHoursTimer *****************
;; Defined at:
;;		line 406 in file "C:\temp\dev\AK7030-OTP\common.c"
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
psect	text1049
	file	"C:\temp\dev\AK7030-OTP\common.c"
	line	406
	global	__size_of_clearTwelveHoursTimer
	__size_of_clearTwelveHoursTimer	equ	__end_of_clearTwelveHoursTimer-_clearTwelveHoursTimer
	
_clearTwelveHoursTimer:	
	opt	stack 4
; Regs used in _clearTwelveHoursTimer: [status,2]
	line	407
	
l4407:	
;common.c: 407: uiBigTimer = 0;
	bsf	status, 5	;RP0=1, select bank1
	clrf	(_uiBigTimer)^080h
	clrf	(_uiBigTimer+1)^080h
	line	408
;common.c: 408: bBigTimerStartFlag = 0;
	bcf	status, 5	;RP0=0, select bank0
	clrf	(_bBigTimerStartFlag)
	line	409
	
l1903:	
	return
	opt stack 0
GLOBAL	__end_of_clearTwelveHoursTimer
	__end_of_clearTwelveHoursTimer:
;; =============== function _clearTwelveHoursTimer ends ============

	signat	_clearTwelveHoursTimer,88
	global	_ISR
psect	text1050,local,class=CODE,delta=2
global __ptext1050
__ptext1050:

;; *************** function _ISR *****************
;; Defined at:
;;		line 529 in file "C:\temp\dev\AK7030-OTP\common.c"
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
psect	text1050
	file	"C:\temp\dev\AK7030-OTP\common.c"
	line	529
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
psect	text1050
	line	532
	
i1l4707:	
;common.c: 530: static unsigned char ucTimer1sCnt = 0;
;common.c: 532: if(TMR1IF == 1)
	btfss	(96/8),(96)&7
	goto	u185_21
	goto	u185_20
u185_21:
	goto	i1l4729
u185_20:
	line	534
	
i1l4709:	
;common.c: 533: {
;common.c: 534: TMR1IF = 0 ;
	bcf	(96/8),(96)&7
	line	535
	
i1l4711:	
;common.c: 535: timer.timer10msStopWatch++;
	bsf	status, 5	;RP0=1, select bank1
	incf	(_timer)^080h,f
	line	536
;common.c: 536: ucTimer1sCnt++;
	incf	(ISR@ucTimer1sCnt)^080h,f
	line	538
	
i1l4713:	
;common.c: 538: if(ucTimer1sCnt >= 100)
	movlw	(064h)
	subwf	(ISR@ucTimer1sCnt)^080h,w
	skipc
	goto	u186_21
	goto	u186_20
u186_21:
	goto	i1l4729
u186_20:
	line	540
	
i1l4715:	
;common.c: 539: {
;common.c: 540: ucTimer1sCnt = 0;
	clrf	(ISR@ucTimer1sCnt)^080h
	line	541
	
i1l4717:	
;common.c: 541: if(uiBigTimer > 0)
	movf	(_uiBigTimer+1)^080h,w
	iorwf	(_uiBigTimer)^080h,w
	skipnz
	goto	u187_21
	goto	u187_20
u187_21:
	goto	i1l1959
u187_20:
	line	542
	
i1l4719:	
;common.c: 542: uiBigTimer--;
	movlw	low(01h)
	subwf	(_uiBigTimer)^080h,f
	movlw	high(01h)
	skipc
	decf	(_uiBigTimer+1)^080h,f
	subwf	(_uiBigTimer+1)^080h,f
	
i1l1959:	
	line	544
;common.c: 544: if(uiSmallTimer)
	movf	(_uiSmallTimer+1)^080h,w
	iorwf	(_uiSmallTimer)^080h,w
	skipnz
	goto	u188_21
	goto	u188_20
u188_21:
	goto	i1l1960
u188_20:
	line	545
	
i1l4721:	
;common.c: 545: uiSmallTimer--;
	movlw	low(01h)
	subwf	(_uiSmallTimer)^080h,f
	movlw	high(01h)
	skipc
	decf	(_uiSmallTimer+1)^080h,f
	subwf	(_uiSmallTimer+1)^080h,f
	
i1l1960:	
	line	547
;common.c: 547: if((uiTwentySecondsTimer)&& (0 == bPause20secTimer))
	movf	(_uiTwentySecondsTimer+1)^080h,w
	iorwf	(_uiTwentySecondsTimer)^080h,w
	skipnz
	goto	u189_21
	goto	u189_20
u189_21:
	goto	i1l1961
u189_20:
	
i1l4723:	
	movf	(_bPause20secTimer)^080h,f
	skipz
	goto	u190_21
	goto	u190_20
u190_21:
	goto	i1l1961
u190_20:
	line	548
	
i1l4725:	
;common.c: 548: uiTwentySecondsTimer--;
	movlw	low(01h)
	subwf	(_uiTwentySecondsTimer)^080h,f
	movlw	high(01h)
	skipc
	decf	(_uiTwentySecondsTimer+1)^080h,f
	subwf	(_uiTwentySecondsTimer+1)^080h,f
	
i1l1961:	
	line	550
;common.c: 550: if((uiTwentyMinuteTimer))
	movf	(_uiTwentyMinuteTimer+1)^080h,w
	iorwf	(_uiTwentyMinuteTimer)^080h,w
	skipnz
	goto	u191_21
	goto	u191_20
u191_21:
	goto	i1l4729
u191_20:
	line	551
	
i1l4727:	
;common.c: 551: uiTwentyMinuteTimer--;
	movlw	low(01h)
	subwf	(_uiTwentyMinuteTimer)^080h,f
	movlw	high(01h)
	skipc
	decf	(_uiTwentyMinuteTimer+1)^080h,f
	subwf	(_uiTwentyMinuteTimer+1)^080h,f
	line	555
	
i1l4729:	
;common.c: 552: }
;common.c: 553: }
;common.c: 555: if(ADIF)
	bcf	status, 5	;RP0=0, select bank0
	btfss	(106/8),(106)&7
	goto	u192_21
	goto	u192_20
u192_21:
	goto	i1l1964
u192_20:
	line	557
	
i1l4731:	
;common.c: 556: {
;common.c: 557: ADIF=0;
	bcf	(106/8),(106)&7
	line	558
	
i1l4733:	
;common.c: 558: setAD_ConvertFlag(1);
	movlw	(01h)
	fcall	i1_setAD_ConvertFlag
	line	559
	
i1l4735:	
;common.c: 559: vPutSampleDataIntoTable(adc_get(),sampleChannelSelect);
	fcall	_adc_get
	movf	(1+(?_adc_get)),w
	movwf	(?_vPutSampleDataIntoTable+1)
	movf	(0+(?_adc_get)),w
	movwf	(?_vPutSampleDataIntoTable)
	bcf	status, 5	;RP0=0, select bank0
	movf	(_sampleChannelSelect),w
	movwf	0+(?_vPutSampleDataIntoTable)+02h
	fcall	_vPutSampleDataIntoTable
	line	589
	
i1l1964:	
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
psect	text1051,local,class=CODE,delta=2
global __ptext1051
__ptext1051:

;; *************** function i1_setAD_ConvertFlag *****************
;; Defined at:
;;		line 239 in file "C:\temp\dev\AK7030-OTP\common.c"
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
psect	text1051
	file	"C:\temp\dev\AK7030-OTP\common.c"
	line	239
	global	__size_ofi1_setAD_ConvertFlag
	__size_ofi1_setAD_ConvertFlag	equ	__end_ofi1_setAD_ConvertFlag-i1_setAD_ConvertFlag
	
i1_setAD_ConvertFlag:	
	opt	stack 3
; Regs used in i1_setAD_ConvertFlag: [wreg]
;i1setAD_ConvertFlag@flag stored from wreg
	movwf	(i1setAD_ConvertFlag@flag)
	line	240
	
i1l4741:	
;common.c: 240: adc_convert_flag = flag;
	movf	(i1setAD_ConvertFlag@flag),w
	bsf	status, 5	;RP0=1, select bank1
	movwf	(_adc_convert_flag)^080h
	line	241
	
i1l1863:	
	return
	opt stack 0
GLOBAL	__end_ofi1_setAD_ConvertFlag
	__end_ofi1_setAD_ConvertFlag:
;; =============== function i1_setAD_ConvertFlag ends ============

	signat	i1_setAD_ConvertFlag,88
	global	_adc_get
psect	text1052,local,class=CODE,delta=2
global __ptext1052
__ptext1052:

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
psect	text1052
	file	"C:\temp\dev\AK7030-OTP\periph.c"
	line	105
	global	__size_of_adc_get
	__size_of_adc_get	equ	__end_of_adc_get-_adc_get
	
_adc_get:	
	opt	stack 3
; Regs used in _adc_get: [wreg]
	line	107
	
i1l4737:	
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
	
i1l2620:	
	return
	opt stack 0
GLOBAL	__end_of_adc_get
	__end_of_adc_get:
;; =============== function _adc_get ends ============

	signat	_adc_get,90
	global	_vPutSampleDataIntoTable
psect	text1053,local,class=CODE,delta=2
global __ptext1053
__ptext1053:

;; *************** function _vPutSampleDataIntoTable *****************
;; Defined at:
;;		line 109 in file "C:\temp\dev\AK7030-OTP\common.c"
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
psect	text1053
	file	"C:\temp\dev\AK7030-OTP\common.c"
	global	__size_of_vPutSampleDataIntoTable
	__size_of_vPutSampleDataIntoTable	equ	__end_of_vPutSampleDataIntoTable-_vPutSampleDataIntoTable
	
_vPutSampleDataIntoTable:	
	opt	stack 3
; Regs used in _vPutSampleDataIntoTable: [wreg-fsr0h+status,2+status,0+btemp+1]
	line	119
	
i1l4641:	
;common.c: 111: static unsigned char ucChannelZeroLength = 0;
;common.c: 113: static unsigned char ucChannelSecondLength = 0;
;common.c: 115: static unsigned char ucChannelFifthLength = 0;
;common.c: 117: static unsigned char ucChannelSixthLength = 0;
;common.c: 119: if(channel == 0)
	movf	(vPutSampleDataIntoTable@channel),f
	skipz
	goto	u176_21
	goto	u176_20
u176_21:
	goto	i1l4653
u176_20:
	line	121
	
i1l4643:	
;common.c: 120: {
;common.c: 121: if(ucChannelZeroLength < 12)
	movlw	(0Ch)
	subwf	(vPutSampleDataIntoTable@ucChannelZeroLength),w
	skipnc
	goto	u177_21
	goto	u177_20
u177_21:
	goto	i1l4649
u177_20:
	line	123
	
i1l4645:	
;common.c: 122: {
;common.c: 123: uiSampleChannelZero[ucChannelZeroLength] = uiSampleData;
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
	line	125
	
i1l4647:	
;common.c: 125: ucChannelZeroLength++;
	incf	(vPutSampleDataIntoTable@ucChannelZeroLength),f
	line	126
;common.c: 126: }
	goto	i1l1845
	line	129
	
i1l4649:	
;common.c: 127: else
;common.c: 128: {
;common.c: 129: ucChannelZeroLength = 0;
	clrf	(vPutSampleDataIntoTable@ucChannelZeroLength)
	line	131
	
i1l4651:	
;common.c: 131: uiSampleChannelZero[ucChannelZeroLength] = uiSampleData;
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
	goto	i1l1845
	line	134
	
i1l4653:	
;common.c: 134: else if(channel == 2)
	movf	(vPutSampleDataIntoTable@channel),w
	xorlw	02h
	skipz
	goto	u178_21
	goto	u178_20
u178_21:
	goto	i1l4665
u178_20:
	line	136
	
i1l4655:	
;common.c: 135: {
;common.c: 136: if(ucChannelSecondLength < 12)
	movlw	(0Ch)
	subwf	(vPutSampleDataIntoTable@ucChannelSecondLength),w
	skipnc
	goto	u179_21
	goto	u179_20
u179_21:
	goto	i1l4661
u179_20:
	line	138
	
i1l4657:	
;common.c: 137: {
;common.c: 138: uiSampleChannelSecond[ucChannelSecondLength] = uiSampleData;
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
	line	140
	
i1l4659:	
;common.c: 140: ucChannelSecondLength++;
	incf	(vPutSampleDataIntoTable@ucChannelSecondLength),f
	line	141
;common.c: 141: }
	goto	i1l1845
	line	144
	
i1l4661:	
;common.c: 142: else
;common.c: 143: {
;common.c: 144: ucChannelSecondLength = 0;
	clrf	(vPutSampleDataIntoTable@ucChannelSecondLength)
	line	146
	
i1l4663:	
;common.c: 146: uiSampleChannelSecond[ucChannelSecondLength] = uiSampleData;
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
	goto	i1l1845
	line	149
	
i1l4665:	
;common.c: 149: else if(channel == 5)
	movf	(vPutSampleDataIntoTable@channel),w
	xorlw	05h
	skipz
	goto	u180_21
	goto	u180_20
u180_21:
	goto	i1l4677
u180_20:
	line	151
	
i1l4667:	
;common.c: 150: {
;common.c: 151: if(ucChannelFifthLength < 12)
	movlw	(0Ch)
	subwf	(vPutSampleDataIntoTable@ucChannelFifthLength),w
	skipnc
	goto	u181_21
	goto	u181_20
u181_21:
	goto	i1l4673
u181_20:
	line	153
	
i1l4669:	
;common.c: 152: {
;common.c: 153: uiSampleChannelFifth[ucChannelFifthLength] = uiSampleData;
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
	line	155
	
i1l4671:	
;common.c: 155: ucChannelFifthLength++;
	incf	(vPutSampleDataIntoTable@ucChannelFifthLength),f
	line	156
;common.c: 156: }
	goto	i1l1845
	line	159
	
i1l4673:	
;common.c: 157: else
;common.c: 158: {
;common.c: 159: ucChannelFifthLength = 0;
	clrf	(vPutSampleDataIntoTable@ucChannelFifthLength)
	line	161
	
i1l4675:	
;common.c: 161: uiSampleChannelFifth[ucChannelFifthLength] = uiSampleData;
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
	goto	i1l1845
	line	164
	
i1l4677:	
;common.c: 164: else if(channel == 6)
	movf	(vPutSampleDataIntoTable@channel),w
	xorlw	06h
	skipz
	goto	u182_21
	goto	u182_20
u182_21:
	goto	i1l4689
u182_20:
	line	166
	
i1l4679:	
;common.c: 165: {
;common.c: 166: if(ucChannelSixthLength < 12)
	movlw	(0Ch)
	subwf	(vPutSampleDataIntoTable@ucChannelSixthLength),w
	skipnc
	goto	u183_21
	goto	u183_20
u183_21:
	goto	i1l4685
u183_20:
	line	168
	
i1l4681:	
;common.c: 167: {
;common.c: 168: uiSampleChannelSixth[ucChannelSixthLength] = uiSampleData;
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
	line	170
	
i1l4683:	
;common.c: 170: ucChannelSixthLength++;
	incf	(vPutSampleDataIntoTable@ucChannelSixthLength),f
	line	171
;common.c: 171: }
	goto	i1l1845
	line	174
	
i1l4685:	
;common.c: 172: else
;common.c: 173: {
;common.c: 174: ucChannelSixthLength = 0;
	clrf	(vPutSampleDataIntoTable@ucChannelSixthLength)
	line	176
	
i1l4687:	
;common.c: 176: uiSampleChannelSixth[ucChannelSixthLength] = uiSampleData;
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
	goto	i1l1845
	line	181
	
i1l4689:	
;common.c: 179: else
;common.c: 180: {
;common.c: 181: ucChannelZeroLength = 0;
	clrf	(vPutSampleDataIntoTable@ucChannelZeroLength)
	line	183
;common.c: 183: ucChannelSecondLength = 0;
	clrf	(vPutSampleDataIntoTable@ucChannelSecondLength)
	line	185
;common.c: 185: ucChannelFifthLength = 0;
	clrf	(vPutSampleDataIntoTable@ucChannelFifthLength)
	line	187
;common.c: 187: ucChannelSixthLength = 0;
	clrf	(vPutSampleDataIntoTable@ucChannelSixthLength)
	line	189
;common.c: 189: for(int i = 0;i < 12; i++)
	clrf	(vPutSampleDataIntoTable@i)
	clrf	(vPutSampleDataIntoTable@i+1)
	line	191
	
i1l4695:	
;common.c: 190: {
;common.c: 191: uiSampleChannelZero[i] = 0;
	clrc
	rlf	(vPutSampleDataIntoTable@i),w
	addlw	_uiSampleChannelZero&0ffh
	movwf	fsr0
	bcf	status, 7	;select IRP bank1
	clrf	indf
	incf	fsr0,f
	clrf	indf
	line	193
;common.c: 193: uiSampleChannelSecond[i] = 0;
	clrc
	rlf	(vPutSampleDataIntoTable@i),w
	addlw	_uiSampleChannelSecond&0ffh
	movwf	fsr0
	bsf	status, 7	;select IRP bank3
	clrf	indf
	incf	fsr0,f
	clrf	indf
	line	195
;common.c: 195: uiSampleChannelFifth[i] = 0;
	clrc
	rlf	(vPutSampleDataIntoTable@i),w
	addlw	_uiSampleChannelFifth&0ffh
	movwf	fsr0
	clrf	indf
	incf	fsr0,f
	clrf	indf
	line	197
;common.c: 197: uiSampleChannelSixth[i] = 0;
	clrc
	rlf	(vPutSampleDataIntoTable@i),w
	addlw	_uiSampleChannelSixth&0ffh
	movwf	fsr0
	clrf	indf
	incf	fsr0,f
	clrf	indf
	line	189
	
i1l4697:	
	incf	(vPutSampleDataIntoTable@i),f
	skipnz
	incf	(vPutSampleDataIntoTable@i+1),f
	
i1l4699:	
	movf	(vPutSampleDataIntoTable@i+1),w
	xorlw	80h
	movwf	btemp+1
	movlw	(high(0Ch))^80h
	subwf	btemp+1,w
	skipz
	goto	u184_25
	movlw	low(0Ch)
	subwf	(vPutSampleDataIntoTable@i),w
u184_25:

	skipc
	goto	u184_21
	goto	u184_20
u184_21:
	goto	i1l4695
u184_20:
	line	201
	
i1l1845:	
	return
	opt stack 0
GLOBAL	__end_of_vPutSampleDataIntoTable
	__end_of_vPutSampleDataIntoTable:
;; =============== function _vPutSampleDataIntoTable ends ============

	signat	_vPutSampleDataIntoTable,8312
psect	text1054,local,class=CODE,delta=2
global __ptext1054
__ptext1054:
	global	btemp
	btemp set 07Eh

	DABS	1,126,2	;btemp
	global	wtemp0
	wtemp0 set btemp
	end
