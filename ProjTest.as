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
	FNCALL	_main,_op2_init
	FNCALL	_main,_adc_test_init
	FNCALL	_main,_op1_init
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
psect	text1040,local,class=CODE,delta=2
global __ptext1040
__ptext1040:
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
	global	?_op2_init
?_op2_init:	; 0 bytes @ 0x0
	global	?_op1_init
?_op1_init:	; 0 bytes @ 0x0
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
	global	??_op2_init
??_op2_init:	; 0 bytes @ 0x0
	global	?_adc_test_init
?_adc_test_init:	; 0 bytes @ 0x0
	global	??_op1_init
??_op1_init:	; 0 bytes @ 0x0
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
;;                           _op2_init
;;                      _adc_test_init
;;                           _op1_init
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
;; (1) _op1_init                                             0     0      0       0
;; ---------------------------------------------------------------------------------
;; (3) _adc_test_init                                        3     2      1      44
;;                                              0 BANK0      3     2      1
;; ---------------------------------------------------------------------------------
;; (1) _op2_init                                             0     0      0       0
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
;;   _op2_init
;;   _adc_test_init
;;   _op1_init
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
;;		line 714 in file "C:\temp\dev\AK7030-OTP\main.c"
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
;;		_op2_init
;;		_adc_test_init
;;		_op1_init
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
	line	714
	global	__size_of_main
	__size_of_main	equ	__end_of_main-_main
	
_main:	
	opt	stack 3
; Regs used in _main: [wreg-fsr0h+status,2+status,0+btemp+1+pclath+cstack]
	line	730
	
l5025:	
;main.c: 724: static unsigned char bCheckTweHour = 0;
;main.c: 730: initPin();
	fcall	_initPin
	line	733
	
l5027:	
;main.c: 733: TRISB3 = 1;
	bsf	(1075/8)^080h,(1075)&7
	line	735
	
l5029:	
;main.c: 735: TRISB5 = 1;
	bsf	(1077/8)^080h,(1077)&7
	line	737
	
l5031:	
;main.c: 737: TRISA7 = 1;
	bsf	(1071/8)^080h,(1071)&7
	line	739
	
l5033:	
;main.c: 739: TRISA6 = 1;
	bsf	(1070/8)^080h,(1070)&7
	line	741
	
l5035:	
;main.c: 741: clock_config();
	fcall	_clock_config
	line	742
	
l5037:	
;main.c: 742: timer1_config();
	fcall	_timer1_config
	line	743
;main.c: 743: timer1_interrupt_config();
	fcall	_timer1_interrupt_config
	line	744
	
l5039:	
;main.c: 744: op2_init();
	fcall	_op2_init
	line	746
	
l5041:	
;main.c: 746: adc_test_init(0,2);
	movlw	(02h)
	bcf	status, 5	;RP0=0, select bank0
	movwf	(?_adc_test_init)
	movlw	(0)
	fcall	_adc_test_init
	line	749
	
l5043:	
;main.c: 749: op1_init();
	fcall	_op1_init
	line	753
	
l5045:	
;main.c: 753: adc_start();
	fcall	_adc_start
	line	766
;main.c: 766: startTwentyMinuteTimer(1200);
	movlw	low(04B0h)
	movwf	(?_startTwentyMinuteTimer)
	movlw	high(04B0h)
	movwf	((?_startTwentyMinuteTimer))+1
	fcall	_startTwentyMinuteTimer
	line	771
	
l5047:	
# 771 "C:\temp\dev\AK7030-OTP\main.c"
 clrwdt ;#
psect	maintext
	line	773
;main.c: 773: process_AD_Converter_Value();
	fcall	_process_AD_Converter_Value
	line	775
	
l5049:	
;main.c: 775: if( isPermitSampleTime() )
	fcall	_isPermitSampleTime
	xorlw	0
	skipnz
	goto	u2211
	goto	u2210
u2211:
	goto	l5047
u2210:
	line	779
	
l5051:	
;main.c: 776: {
;main.c: 779: clrSampeTime();
	fcall	_clrSampeTime
	line	794
;main.c: 794: switch(enumMainLoopStep)
	goto	l5633
	line	804
	
l5053:	
;main.c: 797: {
;main.c: 802: static unsigned char ucTimerZeroPoint5s = 0;
;main.c: 804: if(getAdOriginalCh0Value() <= 3150)
	fcall	_getAdOriginalCh0Value
	movlw	high(0C4Fh)
	subwf	(1+(?_getAdOriginalCh0Value)),w
	movlw	low(0C4Fh)
	skipnz
	subwf	(0+(?_getAdOriginalCh0Value)),w
	skipnc
	goto	u2221
	goto	u2220
u2221:
	goto	l5057
u2220:
	line	806
	
l5055:	
;main.c: 805: {
;main.c: 806: ucTimerZeroPoint5s++;
	incf	(main@ucTimerZeroPoint5s),f
	line	807
;main.c: 807: }
	goto	l5059
	line	809
	
l5057:	
;main.c: 808: else
;main.c: 809: ucTimerZeroPoint5s = 0;
	clrf	(main@ucTimerZeroPoint5s)
	line	811
	
l5059:	
;main.c: 811: if(ucTimerZeroPoint5s >= 5)
	movlw	(05h)
	subwf	(main@ucTimerZeroPoint5s),w
	skipc
	goto	u2231
	goto	u2230
u2231:
	goto	l5065
u2230:
	line	813
	
l5061:	
;main.c: 812: {
;main.c: 813: ucTimerZeroPoint5s = 0;
	clrf	(main@ucTimerZeroPoint5s)
	line	814
	
l5063:	
;main.c: 814: enumMainLoopStep = MAIN_LOOP_STEP_FIRST;
	clrf	(_enumMainLoopStep)
	incf	(_enumMainLoopStep),f
	line	817
	
l5065:	
;main.c: 815: }
;main.c: 817: if(isFinishedTwentyMinuteTimer())
	fcall	_isFinishedTwentyMinuteTimer
	xorlw	0
	skipnz
	goto	u2241
	goto	u2240
u2241:
	goto	l5047
u2240:
	line	818
	
l5067:	
;main.c: 818: enumMainLoopStep = MAIN_LOOP_STEP_10_HOUR_END;
	movlw	(09h)
	bcf	status, 5	;RP0=0, select bank0
	movwf	(_enumMainLoopStep)
	goto	l5047
	
l778:	
	line	819
;main.c: 819: break;
	goto	l5047
	line	833
	
l5069:	
;main.c: 823: {
;main.c: 828: static unsigned char ucTimerZeroPoint3s = 0;
;main.c: 830: static unsigned char ucTimerCntP3s = 0;
;main.c: 833: if(getAdOriginalCh0Value() <= 3150)
	fcall	_getAdOriginalCh0Value
	movlw	high(0C4Fh)
	subwf	(1+(?_getAdOriginalCh0Value)),w
	movlw	low(0C4Fh)
	skipnz
	subwf	(0+(?_getAdOriginalCh0Value)),w
	skipnc
	goto	u2251
	goto	u2250
u2251:
	goto	l5081
u2250:
	line	835
	
l5071:	
;main.c: 834: {
;main.c: 835: ucTimerCntP3s++;
	incf	(main@ucTimerCntP3s),f
	line	836
	
l5073:	
;main.c: 836: if(ucTimerCntP3s >= 3)
	movlw	(03h)
	subwf	(main@ucTimerCntP3s),w
	skipc
	goto	u2261
	goto	u2260
u2261:
	goto	l778
u2260:
	line	838
	
l5075:	
;main.c: 837: {
;main.c: 838: ucTimerCntP3s = 0;
	clrf	(main@ucTimerCntP3s)
	line	840
	
l5077:	
;main.c: 840: enumMainLoopStep = MAIN_LOOP_STEP_SECOND;
	movlw	(02h)
	movwf	(_enumMainLoopStep)
	line	842
	
l5079:	
;main.c: 842: ucTimerZeroPoint3s = 0;
	clrf	(main@ucTimerZeroPoint3s)
	goto	l5047
	line	848
	
l5081:	
;main.c: 846: else
;main.c: 847: {
;main.c: 848: ucTimerZeroPoint3s++;
	incf	(main@ucTimerZeroPoint3s),f
	line	850
	
l5083:	
;main.c: 850: if(ucTimerZeroPoint3s >= 3)
	movlw	(03h)
	subwf	(main@ucTimerZeroPoint3s),w
	skipc
	goto	u2271
	goto	u2270
u2271:
	goto	l778
u2270:
	line	852
	
l5085:	
;main.c: 851: {
;main.c: 852: ucTimerZeroPoint3s = 0;
	clrf	(main@ucTimerZeroPoint3s)
	line	854
	
l5087:	
;main.c: 854: clearParaFunction1();
	fcall	_clearParaFunction1
	goto	l5047
	line	869
	
l5089:	
;main.c: 862: {
;main.c: 867: static unsigned char ucTimerP5s = 0;
;main.c: 869: setPA3(1);
	movlw	(01h)
	fcall	_setPA3
	line	870
;main.c: 870: setPB4(1);
	movlw	(01h)
	fcall	_setPB4
	line	872
	
l5091:	
;main.c: 872: if(ucTimerP5s < 5)
	movlw	(05h)
	subwf	(main@ucTimerP5s),w
	skipnc
	goto	u2281
	goto	u2280
u2281:
	goto	l5095
u2280:
	line	873
	
l5093:	
;main.c: 873: ucTimerP5s++;
	incf	(main@ucTimerP5s),f
	goto	l5047
	line	876
	
l5095:	
;main.c: 874: else
;main.c: 875: {
;main.c: 876: ucTimerP5s = 0;
	clrf	(main@ucTimerP5s)
	line	878
	
l5097:	
;main.c: 878: startTwentyMinuteTimer(1200);
	movlw	low(04B0h)
	movwf	(?_startTwentyMinuteTimer)
	movlw	high(04B0h)
	movwf	((?_startTwentyMinuteTimer))+1
	fcall	_startTwentyMinuteTimer
	line	880
	
l5099:	
;main.c: 880: enumMainLoopStep = MAIN_LOOP_STEP_THIRD;
	movlw	(03h)
	bcf	status, 5	;RP0=0, select bank0
	movwf	(_enumMainLoopStep)
	goto	l5047
	line	899
	
l5101:	
;main.c: 887: {
;main.c: 892: static unsigned char ucTimerLessZeroP5s = 0;
;main.c: 894: static unsigned char ucTimerLargeZeroP5s = 0;
;main.c: 897: static unsigned char ucTimerRightP5s = 0;
;main.c: 899: if(getAdOriginalCh6Value() <= 137)
	fcall	_getAdOriginalCh6Value
	movlw	high(08Ah)
	subwf	(1+(?_getAdOriginalCh6Value)),w
	movlw	low(08Ah)
	skipnz
	subwf	(0+(?_getAdOriginalCh6Value)),w
	skipnc
	goto	u2291
	goto	u2290
u2291:
	goto	l5107
u2290:
	line	901
	
l5103:	
;main.c: 900: {
;main.c: 901: ucTimerLargeZeroP5s = 0;
	clrf	(main@ucTimerLargeZeroP5s)
	line	903
	
l5105:	
;main.c: 903: ucTimerLessZeroP5s++;
	incf	(main@ucTimerLessZeroP5s),f
	line	904
;main.c: 904: }
	goto	l5113
	line	907
	
l5107:	
;main.c: 905: else
;main.c: 906: {
;main.c: 907: ucTimerLargeZeroP5s++;
	incf	(main@ucTimerLargeZeroP5s),f
	line	909
	
l5109:	
;main.c: 909: ucTimerLessZeroP5s = 0;
	clrf	(main@ucTimerLessZeroP5s)
	line	911
	
l5111:	
;main.c: 911: ucTimerRightP5s = 0;
	clrf	(main@ucTimerRightP5s)
	line	914
	
l5113:	
;main.c: 912: }
;main.c: 914: if(ucTimerLargeZeroP5s >= 3)
	movlw	(03h)
	subwf	(main@ucTimerLargeZeroP5s),w
	skipc
	goto	u2301
	goto	u2300
u2301:
	goto	l5119
u2300:
	line	916
	
l5115:	
;main.c: 915: {
;main.c: 916: ucTimerLargeZeroP5s = 0;
	clrf	(main@ucTimerLargeZeroP5s)
	line	917
	
l5117:	
;main.c: 917: enumMainLoopStep = MAIN_LOOP_STEP_FOURTH;
	movlw	(04h)
	movwf	(_enumMainLoopStep)
	line	918
;main.c: 918: }
	goto	l5133
	line	919
	
l5119:	
;main.c: 919: else if( ucTimerLessZeroP5s >= 3)
	movlw	(03h)
	subwf	(main@ucTimerLessZeroP5s),w
	skipc
	goto	u2311
	goto	u2310
u2311:
	goto	l5133
u2310:
	line	922
	
l5121:	
;main.c: 920: {
;main.c: 922: if(getAdOriginalCh6Value() < 105)
	fcall	_getAdOriginalCh6Value
	movlw	high(069h)
	subwf	(1+(?_getAdOriginalCh6Value)),w
	movlw	low(069h)
	skipnz
	subwf	(0+(?_getAdOriginalCh6Value)),w
	skipnc
	goto	u2321
	goto	u2320
u2321:
	goto	l5125
u2320:
	line	924
	
l5123:	
;main.c: 923: {
;main.c: 924: ucTimerRightP5s++;
	incf	(main@ucTimerRightP5s),f
	line	925
;main.c: 925: }
	goto	l5127
	line	928
	
l5125:	
;main.c: 926: else
;main.c: 927: {
;main.c: 928: ucTimerRightP5s = 0;
	clrf	(main@ucTimerRightP5s)
	line	931
	
l5127:	
;main.c: 929: }
;main.c: 931: if(ucTimerRightP5s >= 3)
	movlw	(03h)
	subwf	(main@ucTimerRightP5s),w
	skipc
	goto	u2331
	goto	u2330
u2331:
	goto	l810
u2330:
	line	933
	
l5129:	
;main.c: 932: {
;main.c: 933: ucTimerLargeZeroP5s = 0;
	clrf	(main@ucTimerLargeZeroP5s)
	line	934
;main.c: 934: ucTimerRightP5s = 0;
	clrf	(main@ucTimerRightP5s)
	line	935
	
l5131:	
;main.c: 935: enumMainLoopStep = MAIN_LOOP_STEP_3_HOUR_BRANCH;
	movlw	(08h)
	movwf	(_enumMainLoopStep)
	line	936
;main.c: 936: }
	goto	l5133
	line	945
;main.c: 942: else
;main.c: 943: {
;main.c: 944: ;
	
l810:	
	line	947
	
l5133:	
;main.c: 945: }
;main.c: 947: if((MAIN_LOOP_STEP_3_HOUR_BRANCH == enumMainLoopStep) || (MAIN_LOOP_STEP_FOURTH == enumMainLoopStep))
	movf	(_enumMainLoopStep),w
	xorlw	08h
	skipnz
	goto	u2341
	goto	u2340
u2341:
	goto	l5137
u2340:
	
l5135:	
	movf	(_enumMainLoopStep),w
	xorlw	04h
	skipz
	goto	u2351
	goto	u2350
u2351:
	goto	l778
u2350:
	line	949
	
l5137:	
;main.c: 948: {
;main.c: 949: ucTimerRightP5s = 0;
	clrf	(main@ucTimerRightP5s)
	line	950
;main.c: 950: ucTimerLargeZeroP5s = 0;
	clrf	(main@ucTimerLargeZeroP5s)
	line	951
;main.c: 951: ucTimerLessZeroP5s = 0;
	clrf	(main@ucTimerLessZeroP5s)
	goto	l5047
	line	965
	
l5139:	
;main.c: 959: {
;main.c: 965: startTwelveHourTimer(36000);
	movlw	low(08CA0h)
	movwf	(?_startTwelveHourTimer)
	movlw	high(08CA0h)
	movwf	((?_startTwelveHourTimer))+1
	fcall	_startTwelveHourTimer
	line	966
	
l5141:	
;main.c: 966: enumMainLoopStep = MAIN_LOOP_STEP_FIFTH;
	movlw	(05h)
	bcf	status, 5	;RP0=0, select bank0
	movwf	(_enumMainLoopStep)
	line	968
	
l5143:	
;main.c: 968: bCheckTweHour = 0;
	clrf	(main@bCheckTweHour)
	line	970
;main.c: 970: break;
	goto	l5047
	line	978
	
l5145:	
;main.c: 974: {
;main.c: 978: if(( isFinishedTwelveHoursTimer() && (! bCheckTweHour)))
	fcall	_isFinishedTwelveHoursTimer
	xorlw	0
	skipnz
	goto	u2361
	goto	u2360
u2361:
	goto	l5527
u2360:
	
l5147:	
	bcf	status, 5	;RP0=0, select bank0
	movf	(main@bCheckTweHour),f
	skipz
	goto	u2371
	goto	u2370
u2371:
	goto	l5527
u2370:
	line	980
	
l5149:	
;main.c: 979: {
;main.c: 980: enumMainLoopStep = MAIN_LOOP_STEP_10_HOUR_END;
	movlw	(09h)
	movwf	(_enumMainLoopStep)
	line	981
	
l5151:	
;main.c: 981: bCheckTweHour = 1;
	clrf	(main@bCheckTweHour)
	incf	(main@bCheckTweHour),f
	line	982
;main.c: 982: }
	goto	l5047
	line	988
;main.c: 987: {
;main.c: 988: case ADC4_STEP_INIT:
	
l819:	
	line	994
;main.c: 989: {
;main.c: 994: ucADC4_Step = ADC4_STEP_FIRST;
	clrf	(_ucADC4_Step)
	incf	(_ucADC4_Step),f
	line	995
;main.c: 995: break;
	goto	l5047
	line	1007
	
l5153:	
	line	1009
	
l5155:	
;main.c: 1009: uiCh5Value = getAdOriginalCh5Value();
	fcall	_getAdOriginalCh5Value
	movf	(1+(?_getAdOriginalCh5Value)),w
	movwf	(main@uiCh5Value+1)
	movf	(0+(?_getAdOriginalCh5Value)),w
	movwf	(main@uiCh5Value)
	line	1011
	
l5157:	
;main.c: 1011: if( 0 == bInitFlag)
	movf	(main@bInitFlag),f
	skipz
	goto	u2381
	goto	u2380
u2381:
	goto	l5163
u2380:
	line	1013
	
l5159:	
;main.c: 1012: {
;main.c: 1013: bInitFlag = 1;
	clrf	(main@bInitFlag)
	incf	(main@bInitFlag),f
	line	1014
	
l5161:	
;main.c: 1014: uiOldValue = uiCh5Value;
	movf	(main@uiCh5Value+1),w
	movwf	(main@uiOldValue+1)
	movf	(main@uiCh5Value),w
	movwf	(main@uiOldValue)
	line	1019
	
l5163:	
;main.c: 1015: }
;main.c: 1019: if(LESS_THAN_1911 == ucChannel5Type)
	movf	(_ucChannel5Type),f
	skipz
	goto	u2391
	goto	u2390
u2391:
	goto	l5169
u2390:
	line	1021
	
l5165:	
;main.c: 1020: {
;main.c: 1021: uiMinValue = 0;
	bsf	status, 5	;RP0=1, select bank1
	clrf	(main@uiMinValue)^080h
	clrf	(main@uiMinValue+1)^080h
	line	1022
	
l5167:	
;main.c: 1022: uiMaxValue = 3119;
	movlw	low(0C2Fh)
	movwf	(main@uiMaxValue)^080h
	movlw	high(0C2Fh)
	movwf	((main@uiMaxValue)^080h)+1
	line	1023
;main.c: 1023: }
	goto	l832
	line	1024
	
l5169:	
;main.c: 1024: else if(BETWEEN_1911_AND_2067 == ucChannel5Type)
	decf	(_ucChannel5Type),w
	skipz
	goto	u2401
	goto	u2400
u2401:
	goto	l5173
u2400:
	line	1026
	
l5171:	
;main.c: 1025: {
;main.c: 1026: uiMinValue = 3119 - 65;
	movlw	low(0BEEh)
	bsf	status, 5	;RP0=1, select bank1
	movwf	(main@uiMinValue)^080h
	movlw	high(0BEEh)
	movwf	((main@uiMinValue)^080h)+1
	line	1027
;main.c: 1027: uiMaxValue = 3306;
	movlw	low(0CEAh)
	movwf	(main@uiMaxValue)^080h
	movlw	high(0CEAh)
	movwf	((main@uiMaxValue)^080h)+1
	line	1028
;main.c: 1028: }
	goto	l832
	line	1029
	
l5173:	
;main.c: 1029: else if(BETWEEN_2067_AND_2204 == ucChannel5Type)
	movf	(_ucChannel5Type),w
	xorlw	02h
	skipz
	goto	u2411
	goto	u2410
u2411:
	goto	l5177
u2410:
	line	1031
	
l5175:	
;main.c: 1030: {
;main.c: 1031: uiMinValue = 3306 - 65;
	movlw	low(0CA9h)
	bsf	status, 5	;RP0=1, select bank1
	movwf	(main@uiMinValue)^080h
	movlw	high(0CA9h)
	movwf	((main@uiMinValue)^080h)+1
	line	1032
;main.c: 1032: uiMaxValue = 3495;
	movlw	low(0DA7h)
	movwf	(main@uiMaxValue)^080h
	movlw	high(0DA7h)
	movwf	((main@uiMaxValue)^080h)+1
	line	1033
;main.c: 1033: }
	goto	l832
	line	1034
	
l5177:	
;main.c: 1034: else if(BETWEEN_2204_AND_2340 == ucChannel5Type)
	movf	(_ucChannel5Type),w
	xorlw	03h
	skipz
	goto	u2421
	goto	u2420
u2421:
	goto	l5181
u2420:
	line	1036
	
l5179:	
;main.c: 1035: {
;main.c: 1036: uiMinValue = 3495 - 65;
	movlw	low(0D66h)
	bsf	status, 5	;RP0=1, select bank1
	movwf	(main@uiMinValue)^080h
	movlw	high(0D66h)
	movwf	((main@uiMinValue)^080h)+1
	line	1037
;main.c: 1037: uiMaxValue = 3684;
	movlw	low(0E64h)
	movwf	(main@uiMaxValue)^080h
	movlw	high(0E64h)
	movwf	((main@uiMaxValue)^080h)+1
	line	1038
;main.c: 1038: }
	goto	l832
	line	1041
	
l5181:	
;main.c: 1039: else
;main.c: 1040: {
;main.c: 1041: uiMinValue = 3684 - 65;
	movlw	low(0E23h)
	bsf	status, 5	;RP0=1, select bank1
	movwf	(main@uiMinValue)^080h
	movlw	high(0E23h)
	movwf	((main@uiMinValue)^080h)+1
	line	1042
;main.c: 1042: uiMaxValue = 3684;
	movlw	low(0E64h)
	movwf	(main@uiMaxValue)^080h
	movlw	high(0E64h)
	movwf	((main@uiMaxValue)^080h)+1
	line	1043
	
l832:	
	line	1047
;main.c: 1043: }
;main.c: 1046: if(( uiCh5Value < uiMinValue )
;main.c: 1047: || ( uiCh5Value > uiMaxValue ))
	movf	(main@uiMinValue+1)^080h,w
	bcf	status, 5	;RP0=0, select bank0
	subwf	(main@uiCh5Value+1),w
	skipz
	goto	u2435
	bsf	status, 5	;RP0=1, select bank1
	movf	(main@uiMinValue)^080h,w
	bcf	status, 5	;RP0=0, select bank0
	subwf	(main@uiCh5Value),w
u2435:
	skipc
	goto	u2431
	goto	u2430
u2431:
	goto	l5185
u2430:
	
l5183:	
	movf	(main@uiCh5Value+1),w
	bsf	status, 5	;RP0=1, select bank1
	subwf	(main@uiMaxValue+1)^080h,w
	skipz
	goto	u2445
	bcf	status, 5	;RP0=0, select bank0
	movf	(main@uiCh5Value),w
	bsf	status, 5	;RP0=1, select bank1
	subwf	(main@uiMaxValue)^080h,w
u2445:
	skipnc
	goto	u2441
	goto	u2440
u2441:
	goto	l839
u2440:
	line	1049
	
l5185:	
;main.c: 1048: {
;main.c: 1049: uiOldValue = uiCh5Value;
	bcf	status, 5	;RP0=0, select bank0
	movf	(main@uiCh5Value+1),w
	movwf	(main@uiOldValue+1)
	movf	(main@uiCh5Value),w
	movwf	(main@uiOldValue)
	line	1050
	
l839:	
	line	1052
;main.c: 1050: }
;main.c: 1052: if( uiOldValue < 3119 )
	movlw	high(0C2Fh)
	bcf	status, 5	;RP0=0, select bank0
	subwf	(main@uiOldValue+1),w
	movlw	low(0C2Fh)
	skipnz
	subwf	(main@uiOldValue),w
	skipnc
	goto	u2451
	goto	u2450
u2451:
	goto	l5189
u2450:
	line	1053
	
l5187:	
;main.c: 1053: ucChannel5Type = LESS_THAN_1911;
	clrf	(_ucChannel5Type)
	goto	l843
	line	1054
	
l5189:	
;main.c: 1054: else if( uiOldValue < 3306 )
	movlw	high(0CEAh)
	subwf	(main@uiOldValue+1),w
	movlw	low(0CEAh)
	skipnz
	subwf	(main@uiOldValue),w
	skipnc
	goto	u2461
	goto	u2460
u2461:
	goto	l5193
u2460:
	line	1055
	
l5191:	
;main.c: 1055: ucChannel5Type = BETWEEN_1911_AND_2067;
	clrf	(_ucChannel5Type)
	incf	(_ucChannel5Type),f
	goto	l843
	line	1056
	
l5193:	
;main.c: 1056: else if( uiOldValue < 3495 )
	movlw	high(0DA7h)
	subwf	(main@uiOldValue+1),w
	movlw	low(0DA7h)
	skipnz
	subwf	(main@uiOldValue),w
	skipnc
	goto	u2471
	goto	u2470
u2471:
	goto	l5197
u2470:
	line	1057
	
l5195:	
;main.c: 1057: ucChannel5Type = BETWEEN_2067_AND_2204;
	movlw	(02h)
	movwf	(_ucChannel5Type)
	goto	l843
	line	1058
	
l5197:	
;main.c: 1058: else if( uiOldValue < 3684 )
	movlw	high(0E64h)
	subwf	(main@uiOldValue+1),w
	movlw	low(0E64h)
	skipnz
	subwf	(main@uiOldValue),w
	skipnc
	goto	u2481
	goto	u2480
u2481:
	goto	l5201
u2480:
	line	1059
	
l5199:	
;main.c: 1059: ucChannel5Type = BETWEEN_2204_AND_2340;
	movlw	(03h)
	movwf	(_ucChannel5Type)
	goto	l843
	line	1061
	
l5201:	
;main.c: 1060: else
;main.c: 1061: ucChannel5Type = MORE_THAN_2340;
	movlw	(04h)
	movwf	(_ucChannel5Type)
	
l843:	
	line	1063
;main.c: 1063: ucADC4_Step = ADC4_STEP_SECOND;
	movlw	(02h)
	movwf	(_ucADC4_Step)
	line	1064
;main.c: 1064: break;
	goto	l5047
	line	1084
	
l5203:	
;main.c: 1083: {
;main.c: 1084: setPA1(1);
	movlw	(01h)
	fcall	_setPA1
	line	1085
	
l5205:	
;main.c: 1085: ucLoaderStep++;
	incf	(main@ucLoaderStep),f
	line	1086
;main.c: 1086: break;
	goto	l5047
	line	1091
	
l5207:	
;main.c: 1090: {
;main.c: 1091: if(ucTimerDelay >= 5)
	movlw	(05h)
	subwf	(main@ucTimerDelay),w
	skipc
	goto	u2491
	goto	u2490
u2491:
	goto	l5215
u2490:
	line	1093
	
l5209:	
;main.c: 1092: {
;main.c: 1093: setPA0(1);
	movlw	(01h)
	fcall	_setPA0
	line	1094
	
l5211:	
;main.c: 1094: ucTimerDelay = 0;
	clrf	(main@ucTimerDelay)
	goto	l5205
	line	1098
	
l5215:	
;main.c: 1097: else
;main.c: 1098: ucTimerDelay++;
	incf	(main@ucTimerDelay),f
	goto	l5047
	line	1104
	
l5217:	
;main.c: 1103: {
;main.c: 1104: if(ucTimerDelay >= 5)
	movlw	(05h)
	subwf	(main@ucTimerDelay),w
	skipc
	goto	u2501
	goto	u2500
u2501:
	goto	l5215
u2500:
	line	1106
	
l5219:	
;main.c: 1105: {
;main.c: 1106: setPB0(1);
	movlw	(01h)
	fcall	_setPB0
	goto	l5211
	line	1118
	
l5227:	
;main.c: 1117: {
;main.c: 1118: if(ucTimerDelay >= 5)
	movlw	(05h)
	subwf	(main@ucTimerDelay),w
	skipc
	goto	u2511
	goto	u2510
u2511:
	goto	l5215
u2510:
	line	1120
	
l5229:	
;main.c: 1119: {
;main.c: 1120: setPB1(1);
	movlw	(01h)
	fcall	_setPB1
	goto	l5211
	line	1131
	
l5237:	
;main.c: 1130: {
;main.c: 1131: if(ucTimerDelay >= 5)
	movlw	(05h)
	subwf	(main@ucTimerDelay),w
	skipc
	goto	u2521
	goto	u2520
u2521:
	goto	l5215
u2520:
	line	1133
	
l5239:	
;main.c: 1132: {
;main.c: 1133: setPB2(1);
	movlw	(01h)
	fcall	_setPB2
	goto	l5211
	line	1144
	
l5247:	
;main.c: 1143: {
;main.c: 1144: if(ucTimerDelay >= 5)
	movlw	(05h)
	subwf	(main@ucTimerDelay),w
	skipc
	goto	u2531
	goto	u2530
u2531:
	goto	l5215
u2530:
	line	1146
	
l5249:	
;main.c: 1145: {
;main.c: 1146: setPA1(0);
	movlw	(0)
	fcall	_setPA1
	line	1147
;main.c: 1147: setPA0(0);
	movlw	(0)
	fcall	_setPA0
	line	1148
;main.c: 1148: setPB0(0);
	movlw	(0)
	fcall	_setPB0
	line	1149
;main.c: 1149: setPB1(0);
	movlw	(0)
	fcall	_setPB1
	line	1150
;main.c: 1150: setPB2(0);
	movlw	(0)
	fcall	_setPB2
	goto	l5211
	line	1161
	
l5257:	
;main.c: 1160: {
;main.c: 1161: if(ucTimerDelay >= 1)
	movf	(main@ucTimerDelay),w
	skipz
	goto	u2540
	goto	l5215
u2540:
	line	1163
	
l5259:	
;main.c: 1162: {
;main.c: 1163: ucTimerDelay = 0;
	clrf	(main@ucTimerDelay)
	line	1165
;main.c: 1165: ucLoaderStep = 0;
	clrf	(main@ucLoaderStep)
	line	1166
	
l5261:	
;main.c: 1166: ucADC4_Step = ADC4_STEP_THIRD;
	movlw	(03h)
	movwf	(_ucADC4_Step)
	line	1167
;main.c: 1167: }
	goto	l5047
	line	1080
	
l5267:	
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
goto l778
movlw high(S5851)
movwf pclath
	clrc
	rlf fsr,w
	addlw low(S5851)
	movwf pc
psect	swtext1,local,class=CONST,delta=2
global __pswtext1
__pswtext1:
S5851:
	ljmp	l5203
	ljmp	l5207
	ljmp	l5217
	ljmp	l5227
	ljmp	l5237
	ljmp	l5247
	ljmp	l5257
psect	maintext

	line	1189
	
l5269:	
;main.c: 1188: {
;main.c: 1189: setPA1(1);
	movlw	(01h)
	fcall	_setPA1
	line	1190
	
l5271:	
;main.c: 1190: ucLoaderStep1++;
	incf	(main@ucLoaderStep1),f
	line	1191
;main.c: 1191: break;
	goto	l5047
	line	1196
	
l5273:	
;main.c: 1195: {
;main.c: 1196: if(ucTimerDelay1 >= 5)
	movlw	(05h)
	subwf	(main@ucTimerDelay1),w
	skipc
	goto	u2551
	goto	u2550
u2551:
	goto	l5281
u2550:
	line	1198
	
l5275:	
;main.c: 1197: {
;main.c: 1198: setPA0(1);
	movlw	(01h)
	fcall	_setPA0
	line	1199
	
l5277:	
;main.c: 1199: ucTimerDelay1 = 0;
	clrf	(main@ucTimerDelay1)
	goto	l5271
	line	1203
	
l5281:	
;main.c: 1202: else
;main.c: 1203: ucTimerDelay1++;
	incf	(main@ucTimerDelay1),f
	goto	l5047
	line	1209
	
l5283:	
;main.c: 1208: {
;main.c: 1209: if(ucTimerDelay1 >= 5)
	movlw	(05h)
	subwf	(main@ucTimerDelay1),w
	skipc
	goto	u2561
	goto	u2560
u2561:
	goto	l5281
u2560:
	line	1211
	
l5285:	
;main.c: 1210: {
;main.c: 1211: setPB0(1);
	movlw	(01h)
	fcall	_setPB0
	goto	l5277
	line	1222
	
l5293:	
;main.c: 1221: {
;main.c: 1222: if(ucTimerDelay1 >= 5)
	movlw	(05h)
	subwf	(main@ucTimerDelay1),w
	skipc
	goto	u2571
	goto	u2570
u2571:
	goto	l5281
u2570:
	line	1225
	
l5295:	
;main.c: 1223: {
;main.c: 1225: setPB1(1);
	movlw	(01h)
	fcall	_setPB1
	goto	l5277
	line	1236
	
l5303:	
;main.c: 1235: {
;main.c: 1236: if(ucTimerDelay1 >= 5)
	movlw	(05h)
	subwf	(main@ucTimerDelay1),w
	skipc
	goto	u2581
	goto	u2580
u2581:
	goto	l5281
u2580:
	line	1239
	
l5305:	
;main.c: 1237: {
;main.c: 1239: setPB2(1);
	movlw	(01h)
	fcall	_setPB2
	goto	l5277
	line	1250
	
l5313:	
;main.c: 1249: {
;main.c: 1250: if(ucTimerDelay1 >= 5)
	movlw	(05h)
	subwf	(main@ucTimerDelay1),w
	skipc
	goto	u2591
	goto	u2590
u2591:
	goto	l5281
u2590:
	line	1252
	
l5315:	
;main.c: 1251: {
;main.c: 1252: setPA0(0);
	movlw	(0)
	fcall	_setPA0
	line	1254
;main.c: 1254: setPB0(0);
	movlw	(0)
	fcall	_setPB0
	line	1256
;main.c: 1256: setPB1(0);
	movlw	(0)
	fcall	_setPB1
	line	1258
;main.c: 1258: setPB2(0);
	movlw	(0)
	fcall	_setPB2
	goto	l5277
	line	1269
	
l5323:	
;main.c: 1268: {
;main.c: 1269: if(ucTimerDelay1 >= 1)
	movf	(main@ucTimerDelay1),w
	skipz
	goto	u2600
	goto	l5281
u2600:
	line	1271
	
l5325:	
;main.c: 1270: {
;main.c: 1271: ucTimerDelay1 = 0;
	clrf	(main@ucTimerDelay1)
	line	1273
;main.c: 1273: ucLoaderStep1 = 0;
	clrf	(main@ucLoaderStep1)
	goto	l5261
	line	1185
	
l5333:	
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
goto l778
movlw high(S5853)
movwf pclath
	clrc
	rlf fsr,w
	addlw low(S5853)
	movwf pc
psect	swtext2,local,class=CONST,delta=2
global __pswtext2
__pswtext2:
S5853:
	ljmp	l5269
	ljmp	l5273
	ljmp	l5283
	ljmp	l5293
	ljmp	l5303
	ljmp	l5313
	ljmp	l5323
psect	maintext

	line	1299
	
l5335:	
;main.c: 1297: {
;main.c: 1299: setPA1(1);
	movlw	(01h)
	fcall	_setPA1
	line	1301
;main.c: 1301: setPA0(1);
	movlw	(01h)
	fcall	_setPA0
	line	1302
	
l5337:	
;main.c: 1302: ucLoaderStep2++;
	incf	(main@ucLoaderStep2),f
	line	1303
;main.c: 1303: break;
	goto	l5047
	line	1308
	
l5339:	
;main.c: 1307: {
;main.c: 1308: if(ucTimerDelay2 >= 5)
	movlw	(05h)
	subwf	(main@ucTimerDelay2),w
	skipc
	goto	u2611
	goto	u2610
u2611:
	goto	l5347
u2610:
	line	1311
	
l5341:	
;main.c: 1309: {
;main.c: 1311: setPB0(1);
	movlw	(01h)
	fcall	_setPB0
	line	1312
	
l5343:	
;main.c: 1312: ucTimerDelay2 = 0;
	clrf	(main@ucTimerDelay2)
	goto	l5337
	line	1316
	
l5347:	
;main.c: 1315: else
;main.c: 1316: ucTimerDelay2++;
	incf	(main@ucTimerDelay2),f
	goto	l5047
	line	1322
	
l5349:	
;main.c: 1321: {
;main.c: 1322: if(ucTimerDelay2 >= 5)
	movlw	(05h)
	subwf	(main@ucTimerDelay2),w
	skipc
	goto	u2621
	goto	u2620
u2621:
	goto	l5347
u2620:
	line	1325
	
l5351:	
;main.c: 1323: {
;main.c: 1325: setPB1(1);
	movlw	(01h)
	fcall	_setPB1
	goto	l5343
	line	1336
	
l5359:	
;main.c: 1335: {
;main.c: 1336: if(ucTimerDelay2 >= 5)
	movlw	(05h)
	subwf	(main@ucTimerDelay2),w
	skipc
	goto	u2631
	goto	u2630
u2631:
	goto	l5347
u2630:
	line	1339
	
l5361:	
;main.c: 1337: {
;main.c: 1339: setPB2(1);
	movlw	(01h)
	fcall	_setPB2
	goto	l5343
	line	1350
	
l5369:	
;main.c: 1349: {
;main.c: 1350: if(ucTimerDelay2 >= 5)
	movlw	(05h)
	subwf	(main@ucTimerDelay2),w
	skipc
	goto	u2641
	goto	u2640
u2641:
	goto	l5347
u2640:
	line	1354
	
l5371:	
;main.c: 1351: {
;main.c: 1354: setPB0(0);
	movlw	(0)
	fcall	_setPB0
	line	1356
;main.c: 1356: setPB1(0);
	movlw	(0)
	fcall	_setPB1
	line	1358
;main.c: 1358: setPB2(0);
	movlw	(0)
	fcall	_setPB2
	goto	l5343
	line	1369
	
l5379:	
;main.c: 1368: {
;main.c: 1369: if(ucTimerDelay2 >= 1)
	movf	(main@ucTimerDelay2),w
	skipz
	goto	u2650
	goto	l5347
u2650:
	line	1371
	
l5381:	
;main.c: 1370: {
;main.c: 1371: ucTimerDelay2 = 0;
	clrf	(main@ucTimerDelay2)
	line	1373
;main.c: 1373: ucLoaderStep2 = 0;
	clrf	(main@ucLoaderStep2)
	goto	l5261
	line	1294
	
l5389:	
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
goto l778
movlw high(S5855)
movwf pclath
	clrc
	rlf fsr,w
	addlw low(S5855)
	movwf pc
psect	swtext3,local,class=CONST,delta=2
global __pswtext3
__pswtext3:
S5855:
	ljmp	l5335
	ljmp	l5339
	ljmp	l5349
	ljmp	l5359
	ljmp	l5369
	ljmp	l5379
psect	maintext

	line	1399
	
l5391:	
;main.c: 1397: {
;main.c: 1399: setPB0(1);
	movlw	(01h)
	fcall	_setPB0
	line	1401
;main.c: 1401: setPA0(1);
	movlw	(01h)
	fcall	_setPA0
	line	1403
;main.c: 1403: setPA1(1);
	movlw	(01h)
	fcall	_setPA1
	line	1404
	
l5393:	
;main.c: 1404: ucLoaderStep3++;
	incf	(main@ucLoaderStep3),f
	line	1405
;main.c: 1405: break;
	goto	l5047
	line	1410
	
l5395:	
;main.c: 1409: {
;main.c: 1410: if(ucTimerDelay3 >= 5)
	movlw	(05h)
	subwf	(main@ucTimerDelay3),w
	skipc
	goto	u2661
	goto	u2660
u2661:
	goto	l5403
u2660:
	line	1413
	
l5397:	
;main.c: 1411: {
;main.c: 1413: setPB1(1);
	movlw	(01h)
	fcall	_setPB1
	line	1414
	
l5399:	
;main.c: 1414: ucTimerDelay3 = 0;
	clrf	(main@ucTimerDelay3)
	goto	l5393
	line	1418
	
l5403:	
;main.c: 1417: else
;main.c: 1418: ucTimerDelay3++;
	incf	(main@ucTimerDelay3),f
	goto	l5047
	line	1424
	
l5405:	
;main.c: 1423: {
;main.c: 1424: if(ucTimerDelay3 >= 5)
	movlw	(05h)
	subwf	(main@ucTimerDelay3),w
	skipc
	goto	u2671
	goto	u2670
u2671:
	goto	l5403
u2670:
	line	1427
	
l5407:	
;main.c: 1425: {
;main.c: 1427: setPB2(1);
	movlw	(01h)
	fcall	_setPB2
	goto	l5399
	line	1439
	
l5415:	
;main.c: 1438: {
;main.c: 1439: if(ucTimerDelay3 >= 5)
	movlw	(05h)
	subwf	(main@ucTimerDelay3),w
	skipc
	goto	u2681
	goto	u2680
u2681:
	goto	l5403
u2680:
	line	1443
	
l5417:	
;main.c: 1440: {
;main.c: 1443: setPB1(0);
	movlw	(0)
	fcall	_setPB1
	line	1445
;main.c: 1445: setPB2(0);
	movlw	(0)
	fcall	_setPB2
	goto	l5399
	line	1456
	
l5425:	
;main.c: 1455: {
;main.c: 1456: if(ucTimerDelay3 >= 1)
	movf	(main@ucTimerDelay3),w
	skipz
	goto	u2690
	goto	l5403
u2690:
	line	1458
	
l5427:	
;main.c: 1457: {
;main.c: 1458: ucTimerDelay3 = 0;
	clrf	(main@ucTimerDelay3)
	line	1460
;main.c: 1460: ucLoaderStep3 = 0;
	clrf	(main@ucLoaderStep3)
	goto	l5261
	line	1394
	
l5435:	
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
	goto	l5391
	xorlw	1^0	; case 1
	skipnz
	goto	l5395
	xorlw	2^1	; case 2
	skipnz
	goto	l5405
	xorlw	3^2	; case 3
	skipnz
	goto	l5415
	xorlw	4^3	; case 4
	skipnz
	goto	l5425
	goto	l778
	opt asmopt_on

	line	1486
	
l5437:	
;main.c: 1484: {
;main.c: 1486: setPB0(1);
	movlw	(01h)
	fcall	_setPB0
	line	1488
;main.c: 1488: setPA0(1);
	movlw	(01h)
	fcall	_setPA0
	line	1490
;main.c: 1490: setPA1(1);
	movlw	(01h)
	fcall	_setPA1
	line	1492
;main.c: 1492: setPB1(1);
	movlw	(01h)
	fcall	_setPB1
	line	1493
	
l5439:	
;main.c: 1493: ucLoaderStep4++;
	incf	(main@ucLoaderStep4),f
	line	1494
;main.c: 1494: break;
	goto	l5047
	line	1499
	
l5441:	
;main.c: 1498: {
;main.c: 1499: if(ucTimerDelay4 >= 5)
	movlw	(05h)
	subwf	(main@ucTimerDelay4),w
	skipc
	goto	u2701
	goto	u2700
u2701:
	goto	l5449
u2700:
	line	1502
	
l5443:	
;main.c: 1500: {
;main.c: 1502: setPB2(1);
	movlw	(01h)
	fcall	_setPB2
	line	1503
	
l5445:	
;main.c: 1503: ucTimerDelay4 = 0;
	clrf	(main@ucTimerDelay4)
	goto	l5439
	line	1507
	
l5449:	
;main.c: 1506: else
;main.c: 1507: ucTimerDelay4++;
	incf	(main@ucTimerDelay4),f
	goto	l5047
	line	1513
	
l5451:	
;main.c: 1512: {
;main.c: 1513: if(ucTimerDelay4 >= 5)
	movlw	(05h)
	subwf	(main@ucTimerDelay4),w
	skipc
	goto	u2711
	goto	u2710
u2711:
	goto	l5449
u2710:
	line	1516
	
l5453:	
;main.c: 1514: {
;main.c: 1516: setPB2(0);
	movlw	(0)
	fcall	_setPB2
	goto	l5445
	line	1527
	
l5461:	
;main.c: 1526: {
;main.c: 1527: if(ucTimerDelay4 >= 1)
	movf	(main@ucTimerDelay4),w
	skipz
	goto	u2720
	goto	l5449
u2720:
	line	1529
	
l5463:	
;main.c: 1528: {
;main.c: 1529: ucTimerDelay4 = 0;
	clrf	(main@ucTimerDelay4)
	line	1531
;main.c: 1531: ucLoaderStep4 = 0;
	clrf	(main@ucLoaderStep4)
	goto	l5261
	line	1481
	
l5471:	
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
	goto	l5437
	xorlw	1^0	; case 1
	skipnz
	goto	l5441
	xorlw	2^1	; case 2
	skipnz
	goto	l5451
	xorlw	3^2	; case 3
	skipnz
	goto	l5461
	goto	l778
	opt asmopt_on

	line	1073
	
l5475:	
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
	goto	l5267
	xorlw	1^0	; case 1
	skipnz
	goto	l5333
	xorlw	2^1	; case 2
	skipnz
	goto	l5389
	xorlw	3^2	; case 3
	skipnz
	goto	l5435
	xorlw	4^3	; case 4
	skipnz
	goto	l5471
	goto	l778
	opt asmopt_on

	line	1563
	
l5477:	
;main.c: 1555: {
;main.c: 1559: static unsigned char ucTimerDelayP2sLess = 0;
;main.c: 1561: static unsigned char ucTimerDelayP2sMore = 0;
;main.c: 1563: if( getAdOriginalCh6Value() <= 242 )
	fcall	_getAdOriginalCh6Value
	movlw	high(0F3h)
	subwf	(1+(?_getAdOriginalCh6Value)),w
	movlw	low(0F3h)
	skipnz
	subwf	(0+(?_getAdOriginalCh6Value)),w
	skipnc
	goto	u2731
	goto	u2730
u2731:
	goto	l5483
u2730:
	line	1565
	
l5479:	
;main.c: 1564: {
;main.c: 1565: ucTimerDelayP2sLess++;
	incf	(main@ucTimerDelayP2sLess),f
	line	1567
	
l5481:	
;main.c: 1567: ucTimerDelayP2sMore = 0;
	clrf	(main@ucTimerDelayP2sMore)
	line	1568
;main.c: 1568: }
	goto	l5487
	line	1571
	
l5483:	
;main.c: 1569: else
;main.c: 1570: {
;main.c: 1571: ucTimerDelayP2sMore++;
	incf	(main@ucTimerDelayP2sMore),f
	line	1572
	
l5485:	
;main.c: 1572: ucTimerDelayP2sLess = 0;
	clrf	(main@ucTimerDelayP2sLess)
	line	1575
	
l5487:	
;main.c: 1573: }
;main.c: 1575: if(ucTimerDelayP2sLess > 200)
	movlw	(0C9h)
	subwf	(main@ucTimerDelayP2sLess),w
	skipc
	goto	u2741
	goto	u2740
u2741:
	goto	l978
u2740:
	line	1576
	
l5489:	
;main.c: 1576: ucTimerDelayP2sLess = 2;
	movlw	(02h)
	movwf	(main@ucTimerDelayP2sLess)
	
l978:	
	line	1579
;main.c: 1579: if(ucTimerDelayP2sMore > 200)
	movlw	(0C9h)
	subwf	(main@ucTimerDelayP2sMore),w
	skipc
	goto	u2751
	goto	u2750
u2751:
	goto	l979
u2750:
	line	1580
	
l5491:	
;main.c: 1580: ucTimerDelayP2sMore = 2;
	movlw	(02h)
	movwf	(main@ucTimerDelayP2sMore)
	
l979:	
	line	1582
;main.c: 1582: if( ucTimerDelayP2sLess >= 2)
	movlw	(02h)
	subwf	(main@ucTimerDelayP2sLess),w
	skipc
	goto	u2761
	goto	u2760
u2761:
	goto	l5503
u2760:
	line	1584
	
l5493:	
;main.c: 1583: {
;main.c: 1584: ucTimerDelayP2sLess = 0;
	clrf	(main@ucTimerDelayP2sLess)
	line	1585
;main.c: 1585: ucTimerDelayP2sMore = 0;
	clrf	(main@ucTimerDelayP2sMore)
	line	1587
	
l5495:	
;main.c: 1587: startTwentySecondsTimer();
	fcall	_startTwentySecondsTimer
	line	1589
	
l5497:	
;main.c: 1589: if( !isFinishedTwentySecondsTimer() )
	fcall	_isFinishedTwentySecondsTimer
	iorlw	0
	skipz
	goto	u2771
	goto	u2770
u2771:
	goto	l5501
u2770:
	line	1595
	
l5499:	
;main.c: 1590: {
;main.c: 1595: vHandle20sTimeron();
	fcall	_vHandle20sTimeron
	line	1596
;main.c: 1596: }
	goto	l5047
	line	1603
	
l5501:	
;main.c: 1597: else
;main.c: 1599: {
;main.c: 1603: vHandle20sTimerOut(0);
	movlw	(0)
	fcall	_vHandle20sTimerOut
	goto	l5047
	line	1606
	
l5503:	
;main.c: 1606: else if(ucTimerDelayP2sMore >= 2)
	movlw	(02h)
	subwf	(main@ucTimerDelayP2sMore),w
	skipc
	goto	u2781
	goto	u2780
u2781:
	goto	l778
u2780:
	line	1608
	
l5505:	
;main.c: 1607: {
;main.c: 1608: ucTimerDelayP2sMore = 0;
	clrf	(main@ucTimerDelayP2sMore)
	line	1609
;main.c: 1609: ucTimerDelayP2sLess = 0;
	clrf	(main@ucTimerDelayP2sLess)
	goto	l5499
	line	1944
	
l5509:	
;main.c: 1938: {
;main.c: 1942: static unsigned char ucFourthSuffix1TimerP3s = 0;
;main.c: 1944: ucFourthSuffix1TimerP3s++;
	incf	(main@ucFourthSuffix1TimerP3s),f
	line	1946
	
l5511:	
;main.c: 1946: if( ucFourthSuffix1TimerP3s > 3)
	movlw	(04h)
	subwf	(main@ucFourthSuffix1TimerP3s),w
	skipc
	goto	u2791
	goto	u2790
u2791:
	goto	l778
u2790:
	line	1948
	
l5513:	
;main.c: 1947: {
;main.c: 1948: ucFourthSuffix1TimerP3s = 0;
	clrf	(main@ucFourthSuffix1TimerP3s)
	line	1949
	
l5515:	
;main.c: 1949: ucADC4_Step = ADC4_STEP_FOURTH_SUFFIX2;
	movlw	(0Ch)
	movwf	(_ucADC4_Step)
	goto	l5047
	line	1961
	
l5517:	
;main.c: 1956: {
;main.c: 1961: setPA6(0);
	movlw	(0)
	fcall	_setPA6
	line	1963
	
l5519:	
;main.c: 1963: clearPinPortAndTimer();
	fcall	_clearPinPortAndTimer
	line	1964
	
l5521:	
;main.c: 1964: ucADC4_Step = ADC4_STEP_INIT;
	clrf	(_ucADC4_Step)
	line	1966
	
l5523:	
;main.c: 1966: enumMainLoopStep = MAIN_LOOP_STEP_FIRST;
	clrf	(_enumMainLoopStep)
	incf	(_enumMainLoopStep),f
	line	1967
;main.c: 1967: break;
	goto	l5047
	line	986
	
l5527:	
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
	goto	l819
	xorlw	1^0	; case 1
	skipnz
	goto	l5153
	xorlw	2^1	; case 2
	skipnz
	goto	l5475
	xorlw	3^2	; case 3
	skipnz
	goto	l5477
	xorlw	10^3	; case 10
	skipnz
	goto	l778
	xorlw	11^10	; case 11
	skipnz
	goto	l5509
	xorlw	12^11	; case 12
	skipnz
	goto	l5517
	goto	l778
	opt asmopt_on

	line	1994
;main.c: 1993: {
;main.c: 1994: case HOUR_3_BRANCH_STEP_FIRST:
	
l997:	
	line	1997
;main.c: 1995: {
;main.c: 1997: PB7 = 1;
	bcf	status, 5	;RP0=0, select bank0
	bsf	(55/8),(55)&7
	line	1998
;main.c: 1998: PBOD7 = 1;
	bsf	status, 5	;RP0=1, select bank3
	bsf	status, 6	;RP1=1, select bank3
	bsf	(3143/8)^0180h,(3143)&7
	line	2003
	
l5529:	
;main.c: 2003: startThreeHoursTimer(10800);
	movlw	low(02A30h)
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	movwf	(?_startThreeHoursTimer)
	movlw	high(02A30h)
	movwf	((?_startThreeHoursTimer))+1
	fcall	_startThreeHoursTimer
	line	2007
;main.c: 2007: setPA0(1);
	movlw	(01h)
	fcall	_setPA0
	line	2009
;main.c: 2009: setPA1(1);
	movlw	(01h)
	fcall	_setPA1
	line	2011
;main.c: 2011: setPB0(1);
	movlw	(01h)
	fcall	_setPB0
	line	2013
;main.c: 2013: setPB1(1);
	movlw	(01h)
	fcall	_setPB1
	line	2015
;main.c: 2015: setPB2(1);
	movlw	(01h)
	fcall	_setPB2
	line	2017
;main.c: 2017: setPB4(0);
	movlw	(0)
	fcall	_setPB4
	line	2019
	
l5531:	
;main.c: 2019: enumBranchStep = HOUR_3_BRANCH_STEP_SECOND;
	bsf	status, 5	;RP0=1, select bank1
	clrf	(main@enumBranchStep)^080h
	incf	(main@enumBranchStep)^080h,f
	line	2020
;main.c: 2020: break;
	goto	l5047
	line	2029
	
l5533:	
;main.c: 2024: {
;main.c: 2029: enumBranchStep = HOUR_3_BRANCH_STEP_THIRD;
	movlw	(02h)
	movwf	(main@enumBranchStep)^080h
	line	2030
;main.c: 2030: break;
	goto	l5047
	line	2038
	
l5535:	
;main.c: 2034: {
;main.c: 2038: if( (isFinishedTwelveHoursTimer()) || (isFinishedThreeHoursTimer()))
	fcall	_isFinishedTwelveHoursTimer
	iorlw	0
	skipz
	goto	u2801
	goto	u2800
u2801:
	goto	l5539
u2800:
	
l5537:	
	fcall	_isFinishedThreeHoursTimer
	xorlw	0
	skipnz
	goto	u2811
	goto	u2810
u2811:
	goto	l5543
u2810:
	line	2040
	
l5539:	
;main.c: 2039: {
;main.c: 2040: enumBranchStep = HOUR_3_BRANCH_STEP_FIRST;
	bsf	status, 5	;RP0=1, select bank1
	clrf	(main@enumBranchStep)^080h
	goto	l5067
	line	2049
	
l5543:	
;main.c: 2043: else
;main.c: 2044: {
;main.c: 2045: static unsigned char ucTimerX1P5s = 0;
;main.c: 2047: static unsigned char ucTimerLessX1P5s = 0;
;main.c: 2049: if(getAdOriginalCh6Value() <= 137)
	fcall	_getAdOriginalCh6Value
	movlw	high(08Ah)
	subwf	(1+(?_getAdOriginalCh6Value)),w
	movlw	low(08Ah)
	skipnz
	subwf	(0+(?_getAdOriginalCh6Value)),w
	skipnc
	goto	u2821
	goto	u2820
u2821:
	goto	l5549
u2820:
	line	2051
	
l5545:	
;main.c: 2050: {
;main.c: 2051: ucTimerX1P5s = 0;
	bsf	status, 5	;RP0=1, select bank1
	clrf	(main@ucTimerX1P5s)^080h
	line	2052
	
l5547:	
;main.c: 2052: ucTimerLessX1P5s++;
	incf	(main@ucTimerLessX1P5s)^080h,f
	line	2053
;main.c: 2053: }
	goto	l5553
	line	2056
	
l5549:	
;main.c: 2054: else
;main.c: 2055: {
;main.c: 2056: ucTimerX1P5s++;
	bsf	status, 5	;RP0=1, select bank1
	incf	(main@ucTimerX1P5s)^080h,f
	line	2057
	
l5551:	
;main.c: 2057: ucTimerLessX1P5s = 0;
	clrf	(main@ucTimerLessX1P5s)^080h
	line	2060
	
l5553:	
;main.c: 2058: }
;main.c: 2060: if(ucTimerX1P5s >= 5)
	movlw	(05h)
	subwf	(main@ucTimerX1P5s)^080h,w
	skipc
	goto	u2831
	goto	u2830
u2831:
	goto	l5567
u2830:
	line	2062
	
l5555:	
;main.c: 2061: {
;main.c: 2062: ucTimerX1P5s = 0;
	clrf	(main@ucTimerX1P5s)^080h
	line	2064
;main.c: 2064: ucTimerLessX1P5s = 0;
	clrf	(main@ucTimerLessX1P5s)^080h
	line	2068
	
l5557:	
;main.c: 2068: PBOD7 = 0;
	bsf	status, 6	;RP1=1, select bank3
	bcf	(3143/8)^0180h,(3143)&7
	line	2069
	
l5559:	
;main.c: 2069: PB7 = 0;
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	bcf	(55/8),(55)&7
	line	2074
	
l5561:	
;main.c: 2074: clearThreeHoursTimer();
	fcall	_clearThreeHoursTimer
	line	2076
	
l5563:	
;main.c: 2076: enumBranchStep = HOUR_3_BRANCH_STEP_FIRST;
	bsf	status, 5	;RP0=1, select bank1
	clrf	(main@enumBranchStep)^080h
	line	2078
	
l5565:	
;main.c: 2078: enumMainLoopStep = MAIN_LOOP_STEP_SECOND;
	movlw	(02h)
	bcf	status, 5	;RP0=0, select bank0
	movwf	(_enumMainLoopStep)
	line	2079
;main.c: 2079: }
	goto	l5047
	line	2080
	
l5567:	
;main.c: 2080: else if(ucTimerLessX1P5s >= 5)
	movlw	(05h)
	subwf	(main@ucTimerLessX1P5s)^080h,w
	skipc
	goto	u2841
	goto	u2840
u2841:
	goto	l778
u2840:
	line	2086
	
l5569:	
;main.c: 2081: {
;main.c: 2082: static unsigned char ucTimerX2P5s = 0;
;main.c: 2084: static unsigned char ucTimerLessX2P5s = 0;
;main.c: 2086: if(getAdOriginalCh6Value() > 32)
	fcall	_getAdOriginalCh6Value
	movlw	high(021h)
	subwf	(1+(?_getAdOriginalCh6Value)),w
	movlw	low(021h)
	skipnz
	subwf	(0+(?_getAdOriginalCh6Value)),w
	skipc
	goto	u2851
	goto	u2850
u2851:
	goto	l5575
u2850:
	line	2088
	
l5571:	
;main.c: 2087: {
;main.c: 2088: ucTimerX2P5s++;
	bsf	status, 5	;RP0=1, select bank1
	incf	(main@ucTimerX2P5s)^080h,f
	line	2089
	
l5573:	
;main.c: 2089: ucTimerLessX2P5s = 0;
	clrf	(main@ucTimerLessX2P5s)^080h
	line	2090
;main.c: 2090: }
	goto	l5577
	line	2093
	
l5575:	
;main.c: 2091: else
;main.c: 2092: {
;main.c: 2093: ucTimerX2P5s = 0;
	bsf	status, 5	;RP0=1, select bank1
	clrf	(main@ucTimerX2P5s)^080h
	line	2095
;main.c: 2095: ucTimerLessX2P5s = 0;
	clrf	(main@ucTimerLessX2P5s)^080h
	line	2099
	
l5577:	
;main.c: 2097: }
;main.c: 2099: if(ucTimerX2P5s >= 5)
	movlw	(05h)
	subwf	(main@ucTimerX2P5s)^080h,w
	skipc
	goto	u2861
	goto	u2860
u2861:
	goto	l778
u2860:
	line	2101
	
l5579:	
;main.c: 2100: {
;main.c: 2101: ucTimerX2P5s = 0;
	clrf	(main@ucTimerX2P5s)^080h
	line	2102
;main.c: 2102: }
	goto	l5047
	line	1992
	
l5595:	
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
	goto	l997
	xorlw	1^0	; case 1
	skipnz
	goto	l5533
	xorlw	2^1	; case 2
	skipnz
	goto	l5535
	goto	l778
	opt asmopt_on

	line	2158
	
l5597:	
;main.c: 2153: {
;main.c: 2158: setPA2(0);
	movlw	(0)
	fcall	_setPA2
	line	2159
;main.c: 2159: setPA1(0);
	movlw	(0)
	fcall	_setPA1
	line	2160
;main.c: 2160: setPA0(0);
	movlw	(0)
	fcall	_setPA0
	line	2161
;main.c: 2161: setPB0(0);
	movlw	(0)
	fcall	_setPB0
	line	2162
;main.c: 2162: setPB1(0);
	movlw	(0)
	fcall	_setPB1
	line	2163
;main.c: 2163: setPB2(0);
	movlw	(0)
	fcall	_setPB2
	line	2164
;main.c: 2164: setPA3(0);
	movlw	(0)
	fcall	_setPA3
	line	2165
;main.c: 2165: setPB4(0);
	movlw	(0)
	fcall	_setPB4
	line	2166
;main.c: 2166: setPB6(1);
	movlw	(01h)
	fcall	_setPB6
	line	2168
	
l5599:	
;main.c: 2168: enumInteralStep = INTERNAL_SECOND_STEP;
	bsf	status, 5	;RP0=1, select bank1
	clrf	(main@enumInteralStep)^080h
	incf	(main@enumInteralStep)^080h,f
	line	2169
;main.c: 2169: break;
	goto	l5047
	line	2179
	
l5601:	
;main.c: 2173: {
;main.c: 2177: static unsigned char ucTimer1s = 0;
;main.c: 2179: if(getAdOriginalCh0Value() >= 4038)
	fcall	_getAdOriginalCh0Value
	movlw	high(0FC6h)
	subwf	(1+(?_getAdOriginalCh0Value)),w
	movlw	low(0FC6h)
	skipnz
	subwf	(0+(?_getAdOriginalCh0Value)),w
	skipc
	goto	u2871
	goto	u2870
u2871:
	goto	l5605
u2870:
	line	2181
	
l5603:	
;main.c: 2180: {
;main.c: 2181: ucTimer1s++;
	bsf	status, 5	;RP0=1, select bank1
	incf	(main@ucTimer1s)^080h,f
	line	2182
;main.c: 2182: }
	goto	l5607
	line	2184
	
l5605:	
;main.c: 2183: else
;main.c: 2184: ucTimer1s = 0;
	bsf	status, 5	;RP0=1, select bank1
	clrf	(main@ucTimer1s)^080h
	line	2186
	
l5607:	
;main.c: 2186: if(ucTimer1s >= 10)
	movlw	(0Ah)
	subwf	(main@ucTimer1s)^080h,w
	skipc
	goto	u2881
	goto	u2880
u2881:
	goto	l778
u2880:
	line	2188
	
l5609:	
;main.c: 2187: {
;main.c: 2188: enumInteralStep = INTERNAL_THIRD_STEP;
	movlw	(02h)
	movwf	(main@enumInteralStep)^080h
	line	2189
	
l5611:	
;main.c: 2189: ucTimer1s = 0;
	clrf	(main@ucTimer1s)^080h
	goto	l5047
	line	2201
	
l5613:	
;main.c: 2195: {
;main.c: 2199: static unsigned char ucTimerP3s = 0;
;main.c: 2201: if(getAdOriginalCh0Value() <= 3150)
	fcall	_getAdOriginalCh0Value
	movlw	high(0C4Fh)
	subwf	(1+(?_getAdOriginalCh0Value)),w
	movlw	low(0C4Fh)
	skipnz
	subwf	(0+(?_getAdOriginalCh0Value)),w
	skipnc
	goto	u2891
	goto	u2890
u2891:
	goto	l5617
u2890:
	line	2203
	
l5615:	
;main.c: 2202: {
;main.c: 2203: ucTimerP3s++;
	bsf	status, 5	;RP0=1, select bank1
	incf	(main@ucTimerP3s)^080h,f
	line	2204
;main.c: 2204: }
	goto	l5619
	line	2206
	
l5617:	
;main.c: 2205: else
;main.c: 2206: ucTimerP3s = 0;
	bsf	status, 5	;RP0=1, select bank1
	clrf	(main@ucTimerP3s)^080h
	line	2208
	
l5619:	
;main.c: 2208: if(ucTimerP3s >= 3)
	movlw	(03h)
	subwf	(main@ucTimerP3s)^080h,w
	skipc
	goto	u2901
	goto	u2900
u2901:
	goto	l778
u2900:
	line	2210
	
l5621:	
;main.c: 2209: {
;main.c: 2210: enumInteralStep = INTERNAL_FIRST_STEP;
	clrf	(main@enumInteralStep)^080h
	line	2211
;main.c: 2211: ucTimerP3s = 0;
	clrf	(main@ucTimerP3s)^080h
	line	2213
	
l5623:	
;main.c: 2213: clearAllTimer();
	fcall	_clearAllTimer
	line	2215
	
l5625:	
;main.c: 2215: initPin();
	fcall	_initPin
	line	2218
;main.c: 2218: enumMainLoopStep = MAIN_LOOP_STEP_INIT;
	bcf	status, 5	;RP0=0, select bank0
	clrf	(_enumMainLoopStep)
	line	2220
	
l1045:	
	goto	l1045
	line	2150
	
l5629:	
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
	goto	l5597
	xorlw	1^0	; case 1
	skipnz
	goto	l5601
	xorlw	2^1	; case 2
	skipnz
	goto	l5613
	goto	l778
	opt asmopt_on

	line	794
	
l5633:	
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
	goto	l5053
	xorlw	1^0	; case 1
	skipnz
	goto	l5069
	xorlw	2^1	; case 2
	skipnz
	goto	l5089
	xorlw	3^2	; case 3
	skipnz
	goto	l5101
	xorlw	4^3	; case 4
	skipnz
	goto	l5139
	xorlw	5^4	; case 5
	skipnz
	goto	l5145
	xorlw	8^5	; case 8
	skipnz
	goto	l5595
	xorlw	9^8	; case 9
	skipnz
	goto	l5629
	goto	l778
	opt asmopt_on

	global	start
	ljmp	start
	opt stack 0
psect	maintext
	line	2245
GLOBAL	__end_of_main
	__end_of_main:
;; =============== function _main ends ============

	signat	_main,88
	global	_vHandle20sTimeron
psect	text1041,local,class=CODE,delta=2
global __ptext1041
__ptext1041:

;; *************** function _vHandle20sTimeron *****************
;; Defined at:
;;		line 2249 in file "C:\temp\dev\AK7030-OTP\main.c"
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
;;		_vPause20sTimer
;;		_setPA3
;;		_setPB6
;;		_setPB6AsInput
;; This function is called by:
;;		_main
;; This function uses a non-reentrant model
;;
psect	text1041
	file	"C:\temp\dev\AK7030-OTP\main.c"
	line	2249
	global	__size_of_vHandle20sTimeron
	__size_of_vHandle20sTimeron	equ	__end_of_vHandle20sTimeron-_vHandle20sTimeron
	
_vHandle20sTimeron:	
	opt	stack 3
; Regs used in _vHandle20sTimeron: [wreg-fsr0h+status,2+status,0+btemp+1+pclath+cstack]
	line	2281
	
l4881:	
;main.c: 2250: enum enum_waiting_loop_step
;main.c: 2251: {
;main.c: 2252: WAITING_LOOP_STEP1 = 0,
;main.c: 2253: WAITING_LOOP_STEP2,
;main.c: 2254: WAITING_LOOP_STEP3,
;main.c: 2255: WAITING_LOOP_STEP4,
;main.c: 2256: WAITING_LOOP_STEP5,
;main.c: 2257: WAITING_LOOP_STEP6,
;main.c: 2258: WAITING_LOOP_STEP7,
;main.c: 2259: WAITING_LOOP_STEP8,
;main.c: 2260: WAITING_LOOP_STEP9,
;main.c: 2261: };
;main.c: 2263: enum enumCmpStep
;main.c: 2264: {
;main.c: 2265: COMPARE_STEP0 = 0,
;main.c: 2266: COMPARE_STEP1,
;main.c: 2267: COMPARE_STEP2,
	goto	l5017
	line	2285
	
l4883:	
;main.c: 2284: {
;main.c: 2285: if((getAdOriginalCh2Value() > 1950))
	fcall	_getAdOriginalCh2Value
	movlw	high(079Fh)
	subwf	(1+(?_getAdOriginalCh2Value)),w
	movlw	low(079Fh)
	skipnz
	subwf	(0+(?_getAdOriginalCh2Value)),w
	skipc
	goto	u2061
	goto	u2060
u2061:
	goto	l4889
u2060:
	line	2287
	
l4885:	
;main.c: 2286: {
;main.c: 2287: ucTimerCntMore++;
	bsf	status, 5	;RP0=1, select bank1
	incf	(vHandle20sTimeron@ucTimerCntMore)^080h,f
	line	2288
	
l4887:	
;main.c: 2288: ucTimerCntLess = 0;
	clrf	(vHandle20sTimeron@ucTimerCntLess)^080h
	line	2289
;main.c: 2289: }
	goto	l4893
	line	2292
	
l4889:	
;main.c: 2290: else
;main.c: 2291: {
;main.c: 2292: ucTimerCntLess++;
	bsf	status, 5	;RP0=1, select bank1
	incf	(vHandle20sTimeron@ucTimerCntLess)^080h,f
	line	2293
	
l4891:	
;main.c: 2293: ucTimerCntMore = 0;
	clrf	(vHandle20sTimeron@ucTimerCntMore)^080h
	line	2296
	
l4893:	
;main.c: 2294: }
;main.c: 2296: if(ucTimerCntMore >= 2)
	movlw	(02h)
	subwf	(vHandle20sTimeron@ucTimerCntMore)^080h,w
	skipc
	goto	u2071
	goto	u2070
u2071:
	goto	l4899
u2070:
	line	2298
	
l4895:	
;main.c: 2297: {
;main.c: 2298: ucCompareStep = COMPARE_STEP1;
	clrf	(vHandle20sTimeron@ucCompareStep)^080h
	incf	(vHandle20sTimeron@ucCompareStep)^080h,f
	line	2299
	
l4897:	
;main.c: 2299: ucTimerCntMore = 0;
	clrf	(vHandle20sTimeron@ucTimerCntMore)^080h
	line	2302
	
l4899:	
;main.c: 2300: }
;main.c: 2302: if(ucTimerCntLess >= 2)
	movlw	(02h)
	subwf	(vHandle20sTimeron@ucTimerCntLess)^080h,w
	skipc
	goto	u2081
	goto	u2080
u2081:
	goto	l5019
u2080:
	line	2304
	
l4901:	
;main.c: 2303: {
;main.c: 2304: ucCompareStep = COMPARE_STEP2;
	movlw	(02h)
	movwf	(vHandle20sTimeron@ucCompareStep)^080h
	line	2305
	
l4903:	
;main.c: 2305: ucTimerCntLess = 0;
	clrf	(vHandle20sTimeron@ucTimerCntLess)^080h
	goto	l5019
	line	2321
	
l4905:	
;main.c: 2314: {
;main.c: 2315: static unsigned char ucMoreThanP8sCnt = 0;
;main.c: 2317: static unsigned char ucLessThanP8sCnt = 0;
;main.c: 2319: static unsigned char ucTimerCntN1 = 0;
;main.c: 2321: if((getAdOriginalCh2Value() < 1950))
	fcall	_getAdOriginalCh2Value
	movlw	high(079Eh)
	subwf	(1+(?_getAdOriginalCh2Value)),w
	movlw	low(079Eh)
	skipnz
	subwf	(0+(?_getAdOriginalCh2Value)),w
	skipnc
	goto	u2091
	goto	u2090
u2091:
	goto	l4921
u2090:
	line	2323
	
l4907:	
;main.c: 2322: {
;main.c: 2323: ucTimerCntN1++;
	bsf	status, 5	;RP0=1, select bank1
	incf	(vHandle20sTimeron@ucTimerCntN1)^080h,f
	line	2324
	
l4909:	
;main.c: 2324: if(ucTimerCntN1 >= 2)
	movlw	(02h)
	subwf	(vHandle20sTimeron@ucTimerCntN1)^080h,w
	skipc
	goto	u2101
	goto	u2100
u2101:
	goto	l5019
u2100:
	line	2326
	
l4911:	
;main.c: 2325: {
;main.c: 2326: ucTimerCntN1 = 0;
	clrf	(vHandle20sTimeron@ucTimerCntN1)^080h
	line	2327
	
l4913:	
;main.c: 2327: ucCompareStep = COMPARE_STEP2;
	movlw	(02h)
	movwf	(vHandle20sTimeron@ucCompareStep)^080h
	line	2329
	
l4915:	
;main.c: 2329: ucLessThanP8sCnt = 0;
	clrf	(vHandle20sTimeron@ucLessThanP8sCnt)^080h
	line	2331
	
l4917:	
;main.c: 2331: ucMoreThanP8sCnt = 0;
	clrf	(vHandle20sTimeron@ucMoreThanP8sCnt)^080h
	goto	l5019
	line	2336
	
l4921:	
;main.c: 2335: else
;main.c: 2336: ucTimerCntN1 = 0;
	bsf	status, 5	;RP0=1, select bank1
	clrf	(vHandle20sTimeron@ucTimerCntN1)^080h
	line	2342
	
l4923:	
;main.c: 2342: if((getAdOriginalCh6Value() < 81))
	fcall	_getAdOriginalCh6Value
	movlw	high(051h)
	subwf	(1+(?_getAdOriginalCh6Value)),w
	movlw	low(051h)
	skipnz
	subwf	(0+(?_getAdOriginalCh6Value)),w
	skipnc
	goto	u2111
	goto	u2110
u2111:
	goto	l4929
u2110:
	line	2344
	
l4925:	
;main.c: 2343: {
;main.c: 2344: ucLessThanP8sCnt++;
	bsf	status, 5	;RP0=1, select bank1
	incf	(vHandle20sTimeron@ucLessThanP8sCnt)^080h,f
	line	2345
	
l4927:	
;main.c: 2345: ucMoreThanP8sCnt = 0;
	clrf	(vHandle20sTimeron@ucMoreThanP8sCnt)^080h
	line	2346
;main.c: 2346: }
	goto	l4933
	line	2349
	
l4929:	
;main.c: 2347: else
;main.c: 2348: {
;main.c: 2349: ucMoreThanP8sCnt++;
	bsf	status, 5	;RP0=1, select bank1
	incf	(vHandle20sTimeron@ucMoreThanP8sCnt)^080h,f
	line	2350
	
l4931:	
;main.c: 2350: ucLessThanP8sCnt = 0;
	clrf	(vHandle20sTimeron@ucLessThanP8sCnt)^080h
	line	2353
	
l4933:	
;main.c: 2351: }
;main.c: 2353: if( ucLessThanP8sCnt >= 8)
	movlw	(08h)
	subwf	(vHandle20sTimeron@ucLessThanP8sCnt)^080h,w
	skipc
	goto	u2121
	goto	u2120
u2121:
	goto	l4939
u2120:
	line	2355
	
l4935:	
;main.c: 2354: {
;main.c: 2355: ucLessThanP8sCnt = 0;
	clrf	(vHandle20sTimeron@ucLessThanP8sCnt)^080h
	line	2356
;main.c: 2356: ucMoreThanP8sCnt = 0;
	clrf	(vHandle20sTimeron@ucMoreThanP8sCnt)^080h
	line	2358
	
l4937:	
;main.c: 2358: enumMainLoopStep = MAIN_LOOP_STEP_FIRST;
	bcf	status, 5	;RP0=0, select bank0
	clrf	(_enumMainLoopStep)
	incf	(_enumMainLoopStep),f
	line	2359
;main.c: 2359: ucADC4_Step = ADC4_STEP_INIT;
	clrf	(_ucADC4_Step)
	line	2361
;main.c: 2361: ucCompareStep = COMPARE_STEP0;
	bsf	status, 5	;RP0=1, select bank1
	clrf	(vHandle20sTimeron@ucCompareStep)^080h
	line	2363
;main.c: 2362: ;
;main.c: 2363: }
	goto	l5019
	line	2364
	
l4939:	
;main.c: 2364: else if( ucMoreThanP8sCnt >= 8 )
	movlw	(08h)
	subwf	(vHandle20sTimeron@ucMoreThanP8sCnt)^080h,w
	skipc
	goto	u2131
	goto	u2130
u2131:
	goto	l5019
u2130:
	line	2366
	
l4941:	
;main.c: 2365: {
;main.c: 2366: ucLessThanP8sCnt = 0;
	clrf	(vHandle20sTimeron@ucLessThanP8sCnt)^080h
	line	2367
;main.c: 2367: ucMoreThanP8sCnt = 0;
	clrf	(vHandle20sTimeron@ucMoreThanP8sCnt)^080h
	line	2369
	
l4943:	
;main.c: 2369: enumMainLoopStep = MAIN_LOOP_STEP_THIRD;
	movlw	(03h)
	bcf	status, 5	;RP0=0, select bank0
	movwf	(_enumMainLoopStep)
	line	2370
	
l4945:	
;main.c: 2370: ucADC4_Step = ADC4_STEP_INIT;
	clrf	(_ucADC4_Step)
	line	2372
	
l4947:	
;main.c: 2372: ucCompareStep = COMPARE_STEP0;
	bsf	status, 5	;RP0=1, select bank1
	clrf	(vHandle20sTimeron@ucCompareStep)^080h
	line	2374
;main.c: 2373: ;
;main.c: 2374: }
	goto	l5019
	line	2401
	
l4949:	
;main.c: 2397: {
;main.c: 2401: vPause20sTimer(1);
	movlw	(01h)
	fcall	_vPause20sTimer
	line	2402
	
l4951:	
;main.c: 2402: ucTimeCntP2s = 0;
	clrf	(vHandle20sTimeron@ucTimeCntP2s)^080h
	line	2403
	
l4953:	
;main.c: 2403: setPA3(0);
	movlw	(0)
	fcall	_setPA3
	line	2404
	
l4955:	
;main.c: 2404: setPB6(1);
	movlw	(01h)
	fcall	_setPB6
	line	2405
	
l4957:	
;main.c: 2405: waitLoopStep = WAITING_LOOP_STEP2;
	bsf	status, 5	;RP0=1, select bank1
	clrf	(vHandle20sTimeron@waitLoopStep)^080h
	incf	(vHandle20sTimeron@waitLoopStep)^080h,f
	line	2406
;main.c: 2406: break;
	goto	l5019
	line	2414
	
l4959:	
;main.c: 2410: {
;main.c: 2414: if((getAdOriginalCh2Value() > 2300))
	fcall	_getAdOriginalCh2Value
	movlw	high(08FDh)
	subwf	(1+(?_getAdOriginalCh2Value)),w
	movlw	low(08FDh)
	skipnz
	subwf	(0+(?_getAdOriginalCh2Value)),w
	skipc
	goto	u2141
	goto	u2140
u2141:
	goto	l4963
u2140:
	line	2416
	
l4961:	
;main.c: 2415: {
;main.c: 2416: ucTimeCntP2s++;
	bsf	status, 5	;RP0=1, select bank1
	incf	(vHandle20sTimeron@ucTimeCntP2s)^080h,f
	line	2417
;main.c: 2417: }
	goto	l4965
	line	2419
	
l4963:	
;main.c: 2418: else
;main.c: 2419: ucTimeCntP2s = 0;
	bsf	status, 5	;RP0=1, select bank1
	clrf	(vHandle20sTimeron@ucTimeCntP2s)^080h
	line	2421
	
l4965:	
;main.c: 2421: if( ucTimeCntP2s >= 2)
	movlw	(02h)
	subwf	(vHandle20sTimeron@ucTimeCntP2s)^080h,w
	skipc
	goto	u2151
	goto	u2150
u2151:
	goto	l5019
u2150:
	line	2423
	
l4967:	
;main.c: 2422: {
;main.c: 2423: ucTimeCntP2s = 0;
	clrf	(vHandle20sTimeron@ucTimeCntP2s)^080h
	line	2424
	
l4969:	
;main.c: 2424: waitLoopStep = WAITING_LOOP_STEP3;
	movlw	(02h)
	movwf	(vHandle20sTimeron@waitLoopStep)^080h
	goto	l5019
	line	2434
	
l4971:	
;main.c: 2430: {
;main.c: 2434: setPA3(1);
	movlw	(01h)
	fcall	_setPA3
	line	2436
	
l4973:	
;main.c: 2436: setPB6AsInput();
	fcall	_setPB6AsInput
	line	2437
;main.c: 2437: waitLoopStep = WAITING_LOOP_STEP4;
	movlw	(03h)
	movwf	(vHandle20sTimeron@waitLoopStep)^080h
	line	2438
;main.c: 2438: break;
	goto	l5019
	line	2447
	
l4975:	
;main.c: 2442: {
;main.c: 2446: static unsigned char ucTimerCntP5s = 0;
;main.c: 2447: if( ucTimerCntP5s < 5)
	movlw	(05h)
	subwf	(vHandle20sTimeron@ucTimerCntP5s)^080h,w
	skipnc
	goto	u2161
	goto	u2160
u2161:
	goto	l4979
u2160:
	line	2448
	
l4977:	
;main.c: 2448: ucTimerCntP5s++;
	incf	(vHandle20sTimeron@ucTimerCntP5s)^080h,f
	goto	l5019
	line	2451
	
l4979:	
;main.c: 2449: else
;main.c: 2450: {
;main.c: 2451: ucTimerCntP5s = 0;
	clrf	(vHandle20sTimeron@ucTimerCntP5s)^080h
	line	2452
	
l4981:	
;main.c: 2452: waitLoopStep = WAITING_LOOP_STEP5;
	movlw	(04h)
	movwf	(vHandle20sTimeron@waitLoopStep)^080h
	goto	l5019
	line	2466
	
l4983:	
;main.c: 2459: {
;main.c: 2463: static unsigned char ucMoreThanP3sCnt = 0;
;main.c: 2465: static unsigned char ucLessThanP3sCnt = 0;
;main.c: 2466: if((getAdOriginalCh6Value() < 81))
	fcall	_getAdOriginalCh6Value
	movlw	high(051h)
	subwf	(1+(?_getAdOriginalCh6Value)),w
	movlw	low(051h)
	skipnz
	subwf	(0+(?_getAdOriginalCh6Value)),w
	skipnc
	goto	u2171
	goto	u2170
u2171:
	goto	l4989
u2170:
	line	2468
	
l4985:	
;main.c: 2467: {
;main.c: 2468: ucLessThanP3sCnt++;
	bsf	status, 5	;RP0=1, select bank1
	incf	(vHandle20sTimeron@ucLessThanP3sCnt)^080h,f
	line	2469
	
l4987:	
;main.c: 2469: ucMoreThanP3sCnt = 0;
	clrf	(vHandle20sTimeron@ucMoreThanP3sCnt)^080h
	line	2470
;main.c: 2470: }
	goto	l4993
	line	2473
	
l4989:	
;main.c: 2471: else
;main.c: 2472: {
;main.c: 2473: ucMoreThanP3sCnt++;
	bsf	status, 5	;RP0=1, select bank1
	incf	(vHandle20sTimeron@ucMoreThanP3sCnt)^080h,f
	line	2474
	
l4991:	
;main.c: 2474: ucLessThanP3sCnt = 0;
	clrf	(vHandle20sTimeron@ucLessThanP3sCnt)^080h
	line	2477
	
l4993:	
;main.c: 2475: }
;main.c: 2477: if( ucLessThanP3sCnt >= 3)
	movlw	(03h)
	subwf	(vHandle20sTimeron@ucLessThanP3sCnt)^080h,w
	skipc
	goto	u2181
	goto	u2180
u2181:
	goto	l4999
u2180:
	line	2479
	
l4995:	
;main.c: 2478: {
;main.c: 2479: ucLessThanP3sCnt = 0;
	clrf	(vHandle20sTimeron@ucLessThanP3sCnt)^080h
	line	2480
;main.c: 2480: ucMoreThanP3sCnt = 0;
	clrf	(vHandle20sTimeron@ucMoreThanP3sCnt)^080h
	line	2482
	
l4997:	
;main.c: 2482: enumMainLoopStep = MAIN_LOOP_STEP_FIRST;
	bcf	status, 5	;RP0=0, select bank0
	clrf	(_enumMainLoopStep)
	incf	(_enumMainLoopStep),f
	line	2483
;main.c: 2483: ucADC4_Step = ADC4_STEP_INIT;
	clrf	(_ucADC4_Step)
	line	2485
;main.c: 2485: waitLoopStep = WAITING_LOOP_STEP1;
	bsf	status, 5	;RP0=1, select bank1
	clrf	(vHandle20sTimeron@waitLoopStep)^080h
	line	2487
;main.c: 2487: ucCompareStep = COMPARE_STEP0;
	clrf	(vHandle20sTimeron@ucCompareStep)^080h
	line	2490
	
l4999:	
;main.c: 2488: }
;main.c: 2490: if(ucMoreThanP3sCnt >= 3)
	movlw	(03h)
	subwf	(vHandle20sTimeron@ucMoreThanP3sCnt)^080h,w
	skipc
	goto	u2191
	goto	u2190
u2191:
	goto	l5019
u2190:
	line	2492
	
l5001:	
;main.c: 2491: {
;main.c: 2492: ucLessThanP3sCnt = 0;
	clrf	(vHandle20sTimeron@ucLessThanP3sCnt)^080h
	line	2493
;main.c: 2493: ucMoreThanP3sCnt = 0;
	clrf	(vHandle20sTimeron@ucMoreThanP3sCnt)^080h
	line	2495
	
l5003:	
;main.c: 2495: enumMainLoopStep = MAIN_LOOP_STEP_THIRD;
	movlw	(03h)
	bcf	status, 5	;RP0=0, select bank0
	movwf	(_enumMainLoopStep)
	line	2496
	
l5005:	
;main.c: 2496: ucADC4_Step = ADC4_STEP_INIT;
	clrf	(_ucADC4_Step)
	line	2498
	
l5007:	
;main.c: 2498: waitLoopStep = WAITING_LOOP_STEP1;
	bsf	status, 5	;RP0=1, select bank1
	clrf	(vHandle20sTimeron@waitLoopStep)^080h
	goto	l4947
	line	2394
	
l5013:	
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
	goto	l4949
	xorlw	1^0	; case 1
	skipnz
	goto	l4959
	xorlw	2^1	; case 2
	skipnz
	goto	l4971
	xorlw	3^2	; case 3
	skipnz
	goto	l4975
	xorlw	4^3	; case 4
	skipnz
	goto	l4983
	goto	l5019
	opt asmopt_on

	line	2281
	
l5017:	
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
	goto	l4883
	xorlw	1^0	; case 1
	skipnz
	goto	l4905
	xorlw	2^1	; case 2
	skipnz
	goto	l5013
	goto	l5019
	opt asmopt_on

	line	2515
	
l5019:	
;main.c: 2515: if(ADC4_STEP_INIT == ucADC4_Step)
	bcf	status, 5	;RP0=0, select bank0
	movf	(_ucADC4_Step),f
	skipz
	goto	u2201
	goto	u2200
u2201:
	goto	l1113
u2200:
	line	2517
	
l5021:	
;main.c: 2516: {
;main.c: 2517: ucTimerCntMore = 0;
	bsf	status, 5	;RP0=1, select bank1
	clrf	(vHandle20sTimeron@ucTimerCntMore)^080h
	line	2518
;main.c: 2518: ucTimerCntLess = 0;
	clrf	(vHandle20sTimeron@ucTimerCntLess)^080h
	line	2519
;main.c: 2519: ucCompareStep = COMPARE_STEP0;
	clrf	(vHandle20sTimeron@ucCompareStep)^080h
	line	2521
	
l5023:	
;main.c: 2521: vPause20sTimer(0);
	movlw	(0)
	fcall	_vPause20sTimer
	line	2523
	
l1113:	
	return
	opt stack 0
GLOBAL	__end_of_vHandle20sTimeron
	__end_of_vHandle20sTimeron:
;; =============== function _vHandle20sTimeron ends ============

	signat	_vHandle20sTimeron,88
	global	_process_AD_Converter_Value
psect	text1042,local,class=CODE,delta=2
global __ptext1042
__ptext1042:

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
psect	text1042
	file	"C:\temp\dev\AK7030-OTP\common.c"
	line	302
	global	__size_of_process_AD_Converter_Value
	__size_of_process_AD_Converter_Value	equ	__end_of_process_AD_Converter_Value-_process_AD_Converter_Value
	
_process_AD_Converter_Value:	
	opt	stack 3
; Regs used in _process_AD_Converter_Value: [wreg+status,2+status,0+pclath+cstack]
	line	303
	
l4875:	
;common.c: 303: if(getAD_ConvertFlag())
	fcall	_getAD_ConvertFlag
	xorlw	0
	skipnz
	goto	u2051
	goto	u2050
u2051:
	goto	l1886
u2050:
	line	305
	
l4877:	
;common.c: 304: {
;common.c: 305: setAD_ConvertFlag(0);
	movlw	(0)
	fcall	_setAD_ConvertFlag
	line	306
;common.c: 306: AD_Sample();
	fcall	_AD_Sample
	line	318
	
l4879:	
;common.c: 318: adc_start();
	fcall	_adc_start
	line	320
	
l1886:	
	return
	opt stack 0
GLOBAL	__end_of_process_AD_Converter_Value
	__end_of_process_AD_Converter_Value:
;; =============== function _process_AD_Converter_Value ends ============

	signat	_process_AD_Converter_Value,88
	global	_clearParaFunction1
psect	text1043,local,class=CODE,delta=2
global __ptext1043
__ptext1043:

;; *************** function _clearParaFunction1 *****************
;; Defined at:
;;		line 623 in file "C:\temp\dev\AK7030-OTP\main.c"
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
psect	text1043
	file	"C:\temp\dev\AK7030-OTP\main.c"
	line	623
	global	__size_of_clearParaFunction1
	__size_of_clearParaFunction1	equ	__end_of_clearParaFunction1-_clearParaFunction1
	
_clearParaFunction1:	
	opt	stack 3
; Regs used in _clearParaFunction1: [wreg+status,2+status,0+pclath+cstack]
	line	624
	
l4867:	
;main.c: 624: setPA1(0);
	movlw	(0)
	fcall	_setPA1
	line	625
;main.c: 625: setPA0(0);
	movlw	(0)
	fcall	_setPA0
	line	627
;main.c: 627: setPB0(0);
	movlw	(0)
	fcall	_setPB0
	line	628
;main.c: 628: setPB1(0);
	movlw	(0)
	fcall	_setPB1
	line	629
;main.c: 629: setPB2(0);
	movlw	(0)
	fcall	_setPB2
	line	631
	
l4869:	
;main.c: 631: clearAllTimer();
	fcall	_clearAllTimer
	line	633
	
l4871:	
;main.c: 633: setPA3(0);
	movlw	(0)
	fcall	_setPA3
	line	634
	
l4873:	
;main.c: 634: setPB4(0);
	movlw	(0)
	fcall	_setPB4
	line	635
	
l764:	
	return
	opt stack 0
GLOBAL	__end_of_clearParaFunction1
	__end_of_clearParaFunction1:
;; =============== function _clearParaFunction1 ends ============

	signat	_clearParaFunction1,88
	global	_clearPinPortAndTimer
psect	text1044,local,class=CODE,delta=2
global __ptext1044
__ptext1044:

;; *************** function _clearPinPortAndTimer *****************
;; Defined at:
;;		line 111 in file "C:\temp\dev\AK7030-OTP\main.c"
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
psect	text1044
	file	"C:\temp\dev\AK7030-OTP\main.c"
	line	111
	global	__size_of_clearPinPortAndTimer
	__size_of_clearPinPortAndTimer	equ	__end_of_clearPinPortAndTimer-_clearPinPortAndTimer
	
_clearPinPortAndTimer:	
	opt	stack 3
; Regs used in _clearPinPortAndTimer: [status,2+status,0+pclath+cstack]
	line	113
	
l4863:	
;main.c: 113: PB0 = 0;
	bcf	(48/8),(48)&7
	line	114
;main.c: 114: PA0 = 0;
	bcf	(40/8),(40)&7
	line	115
;main.c: 115: PA1 = 0;
	bcf	(41/8),(41)&7
	line	116
;main.c: 116: PA2 = 0;
	bcf	(42/8),(42)&7
	line	117
;main.c: 117: PA3 = 0;
	bcf	(43/8),(43)&7
	line	120
;main.c: 120: PBOD7 = 0;
	bsf	status, 5	;RP0=1, select bank3
	bsf	status, 6	;RP1=1, select bank3
	bcf	(3143/8)^0180h,(3143)&7
	line	121
;main.c: 121: PB7 = 0;
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	bcf	(55/8),(55)&7
	line	122
	
l4865:	
;main.c: 122: clearAllTimer();
	fcall	_clearAllTimer
	line	126
	
l700:	
	return
	opt stack 0
GLOBAL	__end_of_clearPinPortAndTimer
	__end_of_clearPinPortAndTimer:
;; =============== function _clearPinPortAndTimer ends ============

	signat	_clearPinPortAndTimer,88
	global	_AD_Sample
psect	text1045,local,class=CODE,delta=2
global __ptext1045
__ptext1045:

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
psect	text1045
	file	"C:\temp\dev\AK7030-OTP\common.c"
	line	332
	global	__size_of_AD_Sample
	__size_of_AD_Sample	equ	__end_of_AD_Sample-_AD_Sample
	
_AD_Sample:	
	opt	stack 3
; Regs used in _AD_Sample: [wreg+status,2+status,0+pclath+cstack]
	line	333
	
l4839:	
;common.c: 333: if(sampleTimes < 12)
	movlw	(0Ch)
	bcf	status, 5	;RP0=0, select bank0
	subwf	(_sampleTimes),w
	skipnc
	goto	u2001
	goto	u2000
u2001:
	goto	l1897
u2000:
	line	336
	
l4841:	
;common.c: 334: {
;common.c: 336: sampleTimes++;
	incf	(_sampleTimes),f
	line	338
	
l4843:	
;common.c: 338: if(sampleTimes >= 12)
	movlw	(0Ch)
	subwf	(_sampleTimes),w
	skipc
	goto	u2011
	goto	u2010
u2011:
	goto	l1897
u2010:
	line	340
	
l4845:	
;common.c: 339: {
;common.c: 340: sampleTimes = 0;
	clrf	(_sampleTimes)
	line	342
	
l4847:	
;common.c: 342: if(sampleChannelSelect == 0)
	movf	(_sampleChannelSelect),f
	skipz
	goto	u2021
	goto	u2020
u2021:
	goto	l4851
u2020:
	line	346
	
l4849:	
;common.c: 343: {
;common.c: 346: sampleChannelSelect = 2;
	movlw	(02h)
	movwf	(_sampleChannelSelect)
	line	347
;common.c: 347: }
	goto	l4861
	line	348
	
l4851:	
;common.c: 348: else if(sampleChannelSelect == 2)
	movf	(_sampleChannelSelect),w
	xorlw	02h
	skipz
	goto	u2031
	goto	u2030
u2031:
	goto	l4855
u2030:
	line	351
	
l4853:	
;common.c: 349: {
;common.c: 351: sampleChannelSelect = 5;
	movlw	(05h)
	movwf	(_sampleChannelSelect)
	line	352
;common.c: 352: }
	goto	l4861
	line	353
	
l4855:	
;common.c: 353: else if(sampleChannelSelect == 5)
	movf	(_sampleChannelSelect),w
	xorlw	05h
	skipz
	goto	u2041
	goto	u2040
u2041:
	goto	l4859
u2040:
	line	356
	
l4857:	
;common.c: 354: {
;common.c: 356: sampleChannelSelect = 6;
	movlw	(06h)
	movwf	(_sampleChannelSelect)
	line	357
;common.c: 357: }
	goto	l4861
	line	361
	
l4859:	
;common.c: 358: else
;common.c: 359: {
;common.c: 361: sampleChannelSelect = 0;
	clrf	(_sampleChannelSelect)
	line	367
	
l4861:	
;common.c: 362: }
;common.c: 367: adc_test_init(sampleChannelSelect,3);
	movlw	(03h)
	movwf	(?_adc_test_init)
	movf	(_sampleChannelSelect),w
	fcall	_adc_test_init
	line	371
	
l1897:	
	return
	opt stack 0
GLOBAL	__end_of_AD_Sample
	__end_of_AD_Sample:
;; =============== function _AD_Sample ends ============

	signat	_AD_Sample,88
	global	_getAdOriginalCh2Value
psect	text1046,local,class=CODE,delta=2
global __ptext1046
__ptext1046:

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
psect	text1046
	file	"C:\temp\dev\AK7030-OTP\common.c"
	line	291
	global	__size_of_getAdOriginalCh2Value
	__size_of_getAdOriginalCh2Value	equ	__end_of_getAdOriginalCh2Value-_getAdOriginalCh2Value
	
_getAdOriginalCh2Value:	
	opt	stack 3
; Regs used in _getAdOriginalCh2Value: [wreg-fsr0h+status,2+status,0+btemp+1+pclath+cstack]
	line	293
	
l4835:	
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
	
l1882:	
	return
	opt stack 0
GLOBAL	__end_of_getAdOriginalCh2Value
	__end_of_getAdOriginalCh2Value:
;; =============== function _getAdOriginalCh2Value ends ============

	signat	_getAdOriginalCh2Value,90
	global	_vHandle20sTimerOut
psect	text1047,local,class=CODE,delta=2
global __ptext1047
__ptext1047:

;; *************** function _vHandle20sTimerOut *****************
;; Defined at:
;;		line 2526 in file "C:\temp\dev\AK7030-OTP\main.c"
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
psect	text1047
	file	"C:\temp\dev\AK7030-OTP\main.c"
	line	2526
	global	__size_of_vHandle20sTimerOut
	__size_of_vHandle20sTimerOut	equ	__end_of_vHandle20sTimerOut-_vHandle20sTimerOut
	
_vHandle20sTimerOut:	
	opt	stack 4
; Regs used in _vHandle20sTimerOut: [wreg-fsr0h+status,2+status,0+pclath+cstack]
;vHandle20sTimerOut@bClearStep stored from wreg
	line	2531
	bcf	status, 5	;RP0=0, select bank0
	movwf	(vHandle20sTimerOut@bClearStep)
	
l4783:	
;main.c: 2527: static unsigned char ucTimerOnBehaviorStep = 0;
;main.c: 2529: static unsigned char ucTimeCnt = 0;
;main.c: 2531: if( 1 == bClearStep)
	decf	(vHandle20sTimerOut@bClearStep),w
	skipz
	goto	u1961
	goto	u1960
u1961:
	goto	l4833
u1960:
	line	2533
	
l4785:	
	line	2534
;main.c: 2534: ucTimerOnBehaviorStep = 0;
	bsf	status, 5	;RP0=1, select bank1
	clrf	(vHandle20sTimerOut@ucTimerOnBehaviorStep)^080h
	line	2535
;main.c: 2535: ucTimeCnt = 0;
	clrf	(vHandle20sTimerOut@ucTimeCnt)
	goto	l4833
	line	2546
	
l4787:	
;main.c: 2541: {
;main.c: 2546: setPA3(0);
	movlw	(0)
	fcall	_setPA3
	line	2547
;main.c: 2547: setPB4(0);
	movlw	(0)
	fcall	_setPB4
	line	2548
;main.c: 2548: setPB6(1);
	movlw	(01h)
	fcall	_setPB6
	line	2549
	
l4789:	
;main.c: 2549: ucTimeCnt = 0;
	clrf	(vHandle20sTimerOut@ucTimeCnt)
	line	2550
	
l4791:	
;main.c: 2550: ucTimerOnBehaviorStep = 1;
	bsf	status, 5	;RP0=1, select bank1
	clrf	(vHandle20sTimerOut@ucTimerOnBehaviorStep)^080h
	incf	(vHandle20sTimerOut@ucTimerOnBehaviorStep)^080h,f
	line	2551
;main.c: 2551: break;
	goto	l1132
	line	2559
	
l4793:	
;main.c: 2555: {
;main.c: 2559: ucTimeCnt++;
	incf	(vHandle20sTimerOut@ucTimeCnt),f
	line	2561
	
l4795:	
;main.c: 2561: if( ucTimeCnt >= 10)
	movlw	(0Ah)
	subwf	(vHandle20sTimerOut@ucTimeCnt),w
	skipc
	goto	u1971
	goto	u1970
u1971:
	goto	l1132
u1970:
	line	2563
	
l4797:	
;main.c: 2562: {
;main.c: 2563: ucTimeCnt = 0;
	clrf	(vHandle20sTimerOut@ucTimeCnt)
	line	2564
	
l4799:	
;main.c: 2564: ucTimerOnBehaviorStep = 2;
	movlw	(02h)
	movwf	(vHandle20sTimerOut@ucTimerOnBehaviorStep)^080h
	goto	l1132
	line	2574
	
l4801:	
;main.c: 2570: {
;main.c: 2574: ucTimeCnt++;
	incf	(vHandle20sTimerOut@ucTimeCnt),f
	line	2576
	
l4803:	
;main.c: 2576: if( ucTimeCnt >= 1)
	movf	(vHandle20sTimerOut@ucTimeCnt),w
	skipz
	goto	u1980
	goto	l1132
u1980:
	line	2578
	
l4805:	
;main.c: 2577: {
;main.c: 2578: ucTimeCnt = 0;
	clrf	(vHandle20sTimerOut@ucTimeCnt)
	line	2580
	
l4807:	
;main.c: 2580: ucTimerOnBehaviorStep = 3;
	movlw	(03h)
	movwf	(vHandle20sTimerOut@ucTimerOnBehaviorStep)^080h
	goto	l1132
	line	2590
	
l4809:	
;main.c: 2586: {
;main.c: 2590: setPA3(1);
	movlw	(01h)
	fcall	_setPA3
	line	2591
;main.c: 2591: setPB4(1);
	movlw	(01h)
	fcall	_setPB4
	line	2593
	
l4811:	
;main.c: 2593: setPB6AsInput();
	fcall	_setPB6AsInput
	line	2594
	
l4813:	
;main.c: 2594: ucTimeCnt = 0;
	clrf	(vHandle20sTimerOut@ucTimeCnt)
	line	2596
	
l4815:	
;main.c: 2596: ucTimerOnBehaviorStep = 4;
	movlw	(04h)
	movwf	(vHandle20sTimerOut@ucTimerOnBehaviorStep)^080h
	line	2597
;main.c: 2597: break;
	goto	l1132
	line	2604
	
l4817:	
;main.c: 2600: {
;main.c: 2604: ucTimeCnt++;
	incf	(vHandle20sTimerOut@ucTimeCnt),f
	line	2606
	
l4819:	
;main.c: 2606: if( ucTimeCnt >= 2)
	movlw	(02h)
	subwf	(vHandle20sTimerOut@ucTimeCnt),w
	skipc
	goto	u1991
	goto	u1990
u1991:
	goto	l1132
u1990:
	line	2608
	
l4821:	
;main.c: 2607: {
;main.c: 2608: clearTwentySecondsTimer();
	fcall	_clearTwentySecondsTimer
	line	2610
	
l4823:	
;main.c: 2610: ucTimeCnt = 0;
	clrf	(vHandle20sTimerOut@ucTimeCnt)
	line	2612
	
l4825:	
;main.c: 2612: ucADC4_Step = ADC4_STEP_INIT;
	bcf	status, 5	;RP0=0, select bank0
	clrf	(_ucADC4_Step)
	line	2614
	
l4827:	
;main.c: 2614: enumMainLoopStep = MAIN_LOOP_STEP_THIRD;
	movlw	(03h)
	movwf	(_enumMainLoopStep)
	line	2616
	
l4829:	
;main.c: 2616: ucTimerOnBehaviorStep = 0;
	bsf	status, 5	;RP0=1, select bank1
	clrf	(vHandle20sTimerOut@ucTimerOnBehaviorStep)^080h
	goto	l1132
	line	2538
	
l4833:	
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
	goto	l4787
	xorlw	1^0	; case 1
	skipnz
	goto	l4793
	xorlw	2^1	; case 2
	skipnz
	goto	l4801
	xorlw	3^2	; case 3
	skipnz
	goto	l4809
	xorlw	4^3	; case 4
	skipnz
	goto	l4817
	goto	l1132
	opt asmopt_on

	line	2625
	
l1132:	
	return
	opt stack 0
GLOBAL	__end_of_vHandle20sTimerOut
	__end_of_vHandle20sTimerOut:
;; =============== function _vHandle20sTimerOut ends ============

	signat	_vHandle20sTimerOut,4216
	global	_getAdOriginalCh5Value
psect	text1048,local,class=CODE,delta=2
global __ptext1048
__ptext1048:

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
psect	text1048
	file	"C:\temp\dev\AK7030-OTP\common.c"
	line	272
	global	__size_of_getAdOriginalCh5Value
	__size_of_getAdOriginalCh5Value	equ	__end_of_getAdOriginalCh5Value-_getAdOriginalCh5Value
	
_getAdOriginalCh5Value:	
	opt	stack 4
; Regs used in _getAdOriginalCh5Value: [wreg-fsr0h+status,2+status,0+btemp+1+pclath+cstack]
	line	274
	
l4779:	
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
	
l1876:	
	return
	opt stack 0
GLOBAL	__end_of_getAdOriginalCh5Value
	__end_of_getAdOriginalCh5Value:
;; =============== function _getAdOriginalCh5Value ends ============

	signat	_getAdOriginalCh5Value,90
	global	_getAdOriginalCh6Value
psect	text1049,local,class=CODE,delta=2
global __ptext1049
__ptext1049:

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
psect	text1049
	file	"C:\temp\dev\AK7030-OTP\common.c"
	line	282
	global	__size_of_getAdOriginalCh6Value
	__size_of_getAdOriginalCh6Value	equ	__end_of_getAdOriginalCh6Value-_getAdOriginalCh6Value
	
_getAdOriginalCh6Value:	
	opt	stack 3
; Regs used in _getAdOriginalCh6Value: [wreg-fsr0h+status,2+status,0+btemp+1+pclath+cstack]
	line	284
	
l4775:	
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
	
l1879:	
	return
	opt stack 0
GLOBAL	__end_of_getAdOriginalCh6Value
	__end_of_getAdOriginalCh6Value:
;; =============== function _getAdOriginalCh6Value ends ============

	signat	_getAdOriginalCh6Value,90
	global	_getAdOriginalCh0Value
psect	text1050,local,class=CODE,delta=2
global __ptext1050
__ptext1050:

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
psect	text1050
	file	"C:\temp\dev\AK7030-OTP\common.c"
	line	263
	global	__size_of_getAdOriginalCh0Value
	__size_of_getAdOriginalCh0Value	equ	__end_of_getAdOriginalCh0Value-_getAdOriginalCh0Value
	
_getAdOriginalCh0Value:	
	opt	stack 4
; Regs used in _getAdOriginalCh0Value: [wreg-fsr0h+status,2+status,0+btemp+1+pclath+cstack]
	line	265
	
l4771:	
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
	
l1873:	
	return
	opt stack 0
GLOBAL	__end_of_getAdOriginalCh0Value
	__end_of_getAdOriginalCh0Value:
;; =============== function _getAdOriginalCh0Value ends ============

	signat	_getAdOriginalCh0Value,90
	global	_clearAllTimer
psect	text1051,local,class=CODE,delta=2
global __ptext1051
__ptext1051:

;; *************** function _clearAllTimer *****************
;; Defined at:
;;		line 101 in file "C:\temp\dev\AK7030-OTP\main.c"
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
psect	text1051
	file	"C:\temp\dev\AK7030-OTP\main.c"
	line	101
	global	__size_of_clearAllTimer
	__size_of_clearAllTimer	equ	__end_of_clearAllTimer-_clearAllTimer
	
_clearAllTimer:	
	opt	stack 4
; Regs used in _clearAllTimer: [status,2+status,0+pclath+cstack]
	line	102
	
l4769:	
;main.c: 102: clearTwelveHoursTimer();
	fcall	_clearTwelveHoursTimer
	line	103
;main.c: 103: clearThreeHoursTimer();
	fcall	_clearThreeHoursTimer
	line	104
;main.c: 104: clearTwentySecondsTimer();
	fcall	_clearTwentySecondsTimer
	line	105
;main.c: 105: clearTwentyMinuteTimer();
	fcall	_clearTwentyMinuteTimer
	line	106
	
l697:	
	return
	opt stack 0
GLOBAL	__end_of_clearAllTimer
	__end_of_clearAllTimer:
;; =============== function _clearAllTimer ends ============

	signat	_clearAllTimer,88
	global	_setAD_ConvertFlag
psect	text1052,local,class=CODE,delta=2
global __ptext1052
__ptext1052:

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
psect	text1052
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
	
l4731:	
;common.c: 240: adc_convert_flag = flag;
	movf	(setAD_ConvertFlag@flag),w
	bsf	status, 5	;RP0=1, select bank1
	movwf	(_adc_convert_flag)^080h
	line	241
	
l1867:	
	return
	opt stack 0
GLOBAL	__end_of_setAD_ConvertFlag
	__end_of_setAD_ConvertFlag:
;; =============== function _setAD_ConvertFlag ends ============

	signat	_setAD_ConvertFlag,4216
	global	_getAD_ConvertFlag
psect	text1053,local,class=CODE,delta=2
global __ptext1053
__ptext1053:

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
psect	text1053
	file	"C:\temp\dev\AK7030-OTP\common.c"
	line	233
	global	__size_of_getAD_ConvertFlag
	__size_of_getAD_ConvertFlag	equ	__end_of_getAD_ConvertFlag-_getAD_ConvertFlag
	
_getAD_ConvertFlag:	
	opt	stack 4
; Regs used in _getAD_ConvertFlag: [wreg]
	line	234
	
l4727:	
;common.c: 234: return adc_convert_flag;
	bsf	status, 5	;RP0=1, select bank1
	bcf	status, 6	;RP1=0, select bank1
	movf	(_adc_convert_flag)^080h,w
	line	235
	
l1864:	
	return
	opt stack 0
GLOBAL	__end_of_getAD_ConvertFlag
	__end_of_getAD_ConvertFlag:
;; =============== function _getAD_ConvertFlag ends ============

	signat	_getAD_ConvertFlag,89
	global	_Filter
psect	text1054,local,class=CODE,delta=2
global __ptext1054
__ptext1054:

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
psect	text1054
	file	"C:\temp\dev\AK7030-OTP\common.c"
	line	67
	global	__size_of_Filter
	__size_of_Filter	equ	__end_of_Filter-_Filter
	
_Filter:	
	opt	stack 3
; Regs used in _Filter: [wreg-fsr0h+status,2+status,0+btemp+1]
	line	69
	
l4617:	
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
	
l4623:	
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
	
l4625:	
	movlw	02h
	addwf	(Filter@tmpValue),f
	skipnc
	incf	(Filter@tmpValue+1),f
	line	75
	
l4627:	
	incf	(Filter@cir),f
	skipnz
	incf	(Filter@cir+1),f
	
l4629:	
	movf	(Filter@cir+1),w
	xorlw	80h
	movwf	btemp+1
	movlw	(high(0Ch))^80h
	subwf	btemp+1,w
	skipz
	goto	u1745
	movlw	low(0Ch)
	subwf	(Filter@cir),w
u1745:

	skipc
	goto	u1741
	goto	u1740
u1741:
	goto	l4623
u1740:
	line	79
	
l4631:	
;common.c: 79: for(j = 0; j < 12 - 1; j++)
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	clrf	(Filter@j)
	line	81
	
l4637:	
;common.c: 80: {
;common.c: 81: for(i = 0; i < 12 - 1 - j; i++)
	clrf	(Filter@i)
	goto	l4645
	line	83
	
l4639:	
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
	goto	u1755
	movf	0+(??_Filter+0)+0,w
	subwf	0+(??_Filter+2)+0,w
u1755:
	skipnc
	goto	u1751
	goto	u1750
u1751:
	goto	l4643
u1750:
	line	86
	
l4641:	
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
	
l4643:	
	incf	(Filter@i),f
	
l4645:	
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
	goto	u1765
	movf	0+(??_Filter+0)+0,w
	subwf	(Filter@i),w
u1765:

	skipc
	goto	u1761
	goto	u1760
u1761:
	goto	l4639
u1760:
	line	79
	
l4647:	
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	incf	(Filter@j),f
	
l4649:	
	movlw	(0Bh)
	subwf	(Filter@j),w
	skipc
	goto	u1771
	goto	u1770
u1771:
	goto	l4637
u1770:
	line	95
	
l4651:	
;common.c: 91: }
;common.c: 92: }
;common.c: 93: }
;common.c: 95: for(i = 2; i < 12 - 2; i++)
	movlw	(02h)
	movwf	(Filter@i)
	line	97
	
l4655:	
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
	
l4657:	
	incf	(Filter@i),f
	
l4659:	
	movlw	(0Ah)
	subwf	(Filter@i),w
	skipc
	goto	u1781
	goto	u1780
u1781:
	goto	l4655
u1780:
	line	100
	
l4661:	
;common.c: 98: }
;common.c: 100: return (filter_sum >> 3);
	movf	(Filter@filter_sum+1),w
	movwf	(?_Filter+1)
	movf	(Filter@filter_sum),w
	movwf	(?_Filter)
	
l4663:	
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
	
l1820:	
	return
	opt stack 0
GLOBAL	__end_of_Filter
	__end_of_Filter:
;; =============== function _Filter ends ============

	signat	_Filter,4218
	global	_vPause20sTimer
psect	text1055,local,class=CODE,delta=2
global __ptext1055
__ptext1055:

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
psect	text1055
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
	
l4615:	
;common.c: 60: bPause20secTimer = bValue;
	movf	(vPause20sTimer@bValue),w
	bsf	status, 5	;RP0=1, select bank1
	movwf	(_bPause20secTimer)^080h
	line	61
	
l1807:	
	return
	opt stack 0
GLOBAL	__end_of_vPause20sTimer
	__end_of_vPause20sTimer:
;; =============== function _vPause20sTimer ends ============

	signat	_vPause20sTimer,4216
	global	_isFinishedThreeHoursTimer
psect	text1056,local,class=CODE,delta=2
global __ptext1056
__ptext1056:

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
psect	text1056
	file	"C:\temp\dev\AK7030-OTP\common.c"
	line	503
	global	__size_of_isFinishedThreeHoursTimer
	__size_of_isFinishedThreeHoursTimer	equ	__end_of_isFinishedThreeHoursTimer-_isFinishedThreeHoursTimer
	
_isFinishedThreeHoursTimer:	
	opt	stack 5
; Regs used in _isFinishedThreeHoursTimer: [wreg+status,2+status,0]
	line	504
	
l4599:	
;common.c: 504: if((uiSmallTimer == 0) && bSmallTimerStartFlag)
	bsf	status, 5	;RP0=1, select bank1
	movf	((_uiSmallTimer+1)^080h),w
	iorwf	((_uiSmallTimer)^080h),w
	skipz
	goto	u1721
	goto	u1720
u1721:
	goto	l4611
u1720:
	
l4601:	
	bcf	status, 5	;RP0=0, select bank0
	movf	(_bSmallTimerStartFlag),w
	skipz
	goto	u1730
	goto	l4611
u1730:
	line	506
	
l4603:	
;common.c: 505: {
;common.c: 506: bSmallTimerStartFlag = 0;
	clrf	(_bSmallTimerStartFlag)
	line	507
	
l4605:	
;common.c: 507: return 1;
	movlw	(01h)
	goto	l1947
	line	510
	
l4611:	
;common.c: 509: else
;common.c: 510: return 0;
	movlw	(0)
	line	511
	
l1947:	
	return
	opt stack 0
GLOBAL	__end_of_isFinishedThreeHoursTimer
	__end_of_isFinishedThreeHoursTimer:
;; =============== function _isFinishedThreeHoursTimer ends ============

	signat	_isFinishedThreeHoursTimer,89
	global	_startThreeHoursTimer
psect	text1057,local,class=CODE,delta=2
global __ptext1057
__ptext1057:

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
psect	text1057
	file	"C:\temp\dev\AK7030-OTP\common.c"
	line	434
	global	__size_of_startThreeHoursTimer
	__size_of_startThreeHoursTimer	equ	__end_of_startThreeHoursTimer-_startThreeHoursTimer
	
_startThreeHoursTimer:	
	opt	stack 5
; Regs used in _startThreeHoursTimer: [wreg+status,2+status,0]
	line	435
	
l4591:	
;common.c: 435: if(( 0 == uiSmallTimer ) && ( 0 == bSmallTimerStartFlag ))
	bsf	status, 5	;RP0=1, select bank1
	movf	((_uiSmallTimer+1)^080h),w
	iorwf	((_uiSmallTimer)^080h),w
	skipz
	goto	u1701
	goto	u1700
u1701:
	goto	l1920
u1700:
	
l4593:	
	bcf	status, 5	;RP0=0, select bank0
	movf	(_bSmallTimerStartFlag),f
	skipz
	goto	u1711
	goto	u1710
u1711:
	goto	l1920
u1710:
	line	437
	
l4595:	
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
	
l4597:	
;common.c: 438: bSmallTimerStartFlag = 1;
	bcf	status, 5	;RP0=0, select bank0
	clrf	(_bSmallTimerStartFlag)
	incf	(_bSmallTimerStartFlag),f
	line	444
	
l1920:	
	return
	opt stack 0
GLOBAL	__end_of_startThreeHoursTimer
	__end_of_startThreeHoursTimer:
;; =============== function _startThreeHoursTimer ends ============

	signat	_startThreeHoursTimer,4216
	global	_isFinishedTwentySecondsTimer
psect	text1058,local,class=CODE,delta=2
global __ptext1058
__ptext1058:

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
;;		On entry : 140/0
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
psect	text1058
	file	"C:\temp\dev\AK7030-OTP\common.c"
	line	468
	global	__size_of_isFinishedTwentySecondsTimer
	__size_of_isFinishedTwentySecondsTimer	equ	__end_of_isFinishedTwentySecondsTimer-_isFinishedTwentySecondsTimer
	
_isFinishedTwentySecondsTimer:	
	opt	stack 5
; Regs used in _isFinishedTwentySecondsTimer: [wreg+status,2+status,0]
	line	469
	
l4577:	
;common.c: 469: if(( 0 == uiTwentySecondsTimer ) && bTwentySecStartFlag )
	bsf	status, 5	;RP0=1, select bank1
	movf	((_uiTwentySecondsTimer+1)^080h),w
	iorwf	((_uiTwentySecondsTimer)^080h),w
	skipz
	goto	u1681
	goto	u1680
u1681:
	goto	l4587
u1680:
	
l4579:	
	bcf	status, 5	;RP0=0, select bank0
	movf	(_bTwentySecStartFlag),w
	skipz
	goto	u1690
	goto	l4587
u1690:
	line	472
	
l4581:	
;common.c: 470: {
;common.c: 472: return 1;
	movlw	(01h)
	goto	l1932
	line	475
	
l4587:	
;common.c: 474: else
;common.c: 475: return 0;
	movlw	(0)
	line	476
	
l1932:	
	return
	opt stack 0
GLOBAL	__end_of_isFinishedTwentySecondsTimer
	__end_of_isFinishedTwentySecondsTimer:
;; =============== function _isFinishedTwentySecondsTimer ends ============

	signat	_isFinishedTwentySecondsTimer,89
	global	_startTwentySecondsTimer
psect	text1059,local,class=CODE,delta=2
global __ptext1059
__ptext1059:

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
psect	text1059
	file	"C:\temp\dev\AK7030-OTP\common.c"
	line	448
	global	__size_of_startTwentySecondsTimer
	__size_of_startTwentySecondsTimer	equ	__end_of_startTwentySecondsTimer-_startTwentySecondsTimer
	
_startTwentySecondsTimer:	
	opt	stack 5
; Regs used in _startTwentySecondsTimer: [wreg+status,2+status,0]
	line	449
	
l4569:	
;common.c: 449: if(( 0 == uiTwentySecondsTimer) && ( 0 == bTwentySecStartFlag))
	bsf	status, 5	;RP0=1, select bank1
	movf	((_uiTwentySecondsTimer+1)^080h),w
	iorwf	((_uiTwentySecondsTimer)^080h),w
	skipz
	goto	u1661
	goto	u1660
u1661:
	goto	l1924
u1660:
	
l4571:	
	bcf	status, 5	;RP0=0, select bank0
	movf	(_bTwentySecStartFlag),f
	skipz
	goto	u1671
	goto	u1670
u1671:
	goto	l1924
u1670:
	line	451
	
l4573:	
;common.c: 450: {
;common.c: 451: uiTwentySecondsTimer = 20;
	movlw	014h
	bsf	status, 5	;RP0=1, select bank1
	movwf	(_uiTwentySecondsTimer)^080h
	clrf	(_uiTwentySecondsTimer+1)^080h
	line	452
	
l4575:	
;common.c: 452: bTwentySecStartFlag = 1;
	bcf	status, 5	;RP0=0, select bank0
	clrf	(_bTwentySecStartFlag)
	incf	(_bTwentySecStartFlag),f
	line	454
	
l1924:	
	return
	opt stack 0
GLOBAL	__end_of_startTwentySecondsTimer
	__end_of_startTwentySecondsTimer:
;; =============== function _startTwentySecondsTimer ends ============

	signat	_startTwentySecondsTimer,88
	global	_isFinishedTwelveHoursTimer
psect	text1060,local,class=CODE,delta=2
global __ptext1060
__ptext1060:

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
psect	text1060
	file	"C:\temp\dev\AK7030-OTP\common.c"
	line	492
	global	__size_of_isFinishedTwelveHoursTimer
	__size_of_isFinishedTwelveHoursTimer	equ	__end_of_isFinishedTwelveHoursTimer-_isFinishedTwelveHoursTimer
	
_isFinishedTwelveHoursTimer:	
	opt	stack 5
; Regs used in _isFinishedTwelveHoursTimer: [wreg+status,2+status,0]
	line	493
	
l4553:	
;common.c: 493: if(( uiBigTimer == 0 ) && bBigTimerStartFlag )
	bsf	status, 5	;RP0=1, select bank1
	movf	((_uiBigTimer+1)^080h),w
	iorwf	((_uiBigTimer)^080h),w
	skipz
	goto	u1641
	goto	u1640
u1641:
	goto	l4565
u1640:
	
l4555:	
	bcf	status, 5	;RP0=0, select bank0
	movf	(_bBigTimerStartFlag),w
	skipz
	goto	u1650
	goto	l4565
u1650:
	line	495
	
l4557:	
;common.c: 494: {
;common.c: 495: bBigTimerStartFlag = 0;
	clrf	(_bBigTimerStartFlag)
	line	496
	
l4559:	
;common.c: 496: return 1;
	movlw	(01h)
	goto	l1942
	line	499
	
l4565:	
;common.c: 498: else
;common.c: 499: return 0;
	movlw	(0)
	line	500
	
l1942:	
	return
	opt stack 0
GLOBAL	__end_of_isFinishedTwelveHoursTimer
	__end_of_isFinishedTwelveHoursTimer:
;; =============== function _isFinishedTwelveHoursTimer ends ============

	signat	_isFinishedTwelveHoursTimer,89
	global	_startTwelveHourTimer
psect	text1061,local,class=CODE,delta=2
global __ptext1061
__ptext1061:

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
psect	text1061
	file	"C:\temp\dev\AK7030-OTP\common.c"
	line	392
	global	__size_of_startTwelveHourTimer
	__size_of_startTwelveHourTimer	equ	__end_of_startTwelveHourTimer-_startTwelveHourTimer
	
_startTwelveHourTimer:	
	opt	stack 5
; Regs used in _startTwelveHourTimer: [wreg+status,2+status,0]
	line	393
	
l4545:	
;common.c: 393: if((0 == uiBigTimer) && ( 0 == bBigTimerStartFlag))
	bsf	status, 5	;RP0=1, select bank1
	movf	((_uiBigTimer+1)^080h),w
	iorwf	((_uiBigTimer)^080h),w
	skipz
	goto	u1621
	goto	u1620
u1621:
	goto	l1904
u1620:
	
l4547:	
	bcf	status, 5	;RP0=0, select bank0
	movf	(_bBigTimerStartFlag),f
	skipz
	goto	u1631
	goto	u1630
u1631:
	goto	l1904
u1630:
	line	395
	
l4549:	
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
	
l4551:	
;common.c: 396: bBigTimerStartFlag = 1;
	bcf	status, 5	;RP0=0, select bank0
	clrf	(_bBigTimerStartFlag)
	incf	(_bBigTimerStartFlag),f
	line	403
	
l1904:	
	return
	opt stack 0
GLOBAL	__end_of_startTwelveHourTimer
	__end_of_startTwelveHourTimer:
;; =============== function _startTwelveHourTimer ends ============

	signat	_startTwelveHourTimer,4216
	global	_isFinishedTwentyMinuteTimer
psect	text1062,local,class=CODE,delta=2
global __ptext1062
__ptext1062:

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
psect	text1062
	file	"C:\temp\dev\AK7030-OTP\common.c"
	line	480
	global	__size_of_isFinishedTwentyMinuteTimer
	__size_of_isFinishedTwentyMinuteTimer	equ	__end_of_isFinishedTwentyMinuteTimer-_isFinishedTwentyMinuteTimer
	
_isFinishedTwentyMinuteTimer:	
	opt	stack 5
; Regs used in _isFinishedTwentyMinuteTimer: [wreg+status,2+status,0]
	line	481
	
l4529:	
;common.c: 481: if(( 0 == uiTwentyMinuteTimer ) && bTwentyMinStartFlag )
	bsf	status, 5	;RP0=1, select bank1
	movf	((_uiTwentyMinuteTimer+1)^080h),w
	iorwf	((_uiTwentyMinuteTimer)^080h),w
	skipz
	goto	u1601
	goto	u1600
u1601:
	goto	l4541
u1600:
	
l4531:	
	bcf	status, 5	;RP0=0, select bank0
	movf	(_bTwentyMinStartFlag),w
	skipz
	goto	u1610
	goto	l4541
u1610:
	line	483
	
l4533:	
;common.c: 482: {
;common.c: 483: bTwentyMinStartFlag = 0;
	clrf	(_bTwentyMinStartFlag)
	line	484
	
l4535:	
;common.c: 484: return 1;
	movlw	(01h)
	goto	l1937
	line	487
	
l4541:	
;common.c: 486: else
;common.c: 487: return 0;
	movlw	(0)
	line	488
	
l1937:	
	return
	opt stack 0
GLOBAL	__end_of_isFinishedTwentyMinuteTimer
	__end_of_isFinishedTwentyMinuteTimer:
;; =============== function _isFinishedTwentyMinuteTimer ends ============

	signat	_isFinishedTwentyMinuteTimer,89
	global	_clrSampeTime
psect	text1063,local,class=CODE,delta=2
global __ptext1063
__ptext1063:

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
psect	text1063
	file	"C:\temp\dev\AK7030-OTP\common.c"
	line	524
	global	__size_of_clrSampeTime
	__size_of_clrSampeTime	equ	__end_of_clrSampeTime-_clrSampeTime
	
_clrSampeTime:	
	opt	stack 5
; Regs used in _clrSampeTime: [status,2]
	line	525
	
l4527:	
;common.c: 525: timer.timer10msStopWatch = 0;
	clrf	(_timer)^080h
	line	526
	
l1956:	
	return
	opt stack 0
GLOBAL	__end_of_clrSampeTime
	__end_of_clrSampeTime:
;; =============== function _clrSampeTime ends ============

	signat	_clrSampeTime,88
	global	_isPermitSampleTime
psect	text1064,local,class=CODE,delta=2
global __ptext1064
__ptext1064:

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
psect	text1064
	file	"C:\temp\dev\AK7030-OTP\common.c"
	line	514
	global	__size_of_isPermitSampleTime
	__size_of_isPermitSampleTime	equ	__end_of_isPermitSampleTime-_isPermitSampleTime
	
_isPermitSampleTime:	
	opt	stack 5
; Regs used in _isPermitSampleTime: [wreg]
	line	515
	
l4515:	
;common.c: 515: if(timer.timer10msStopWatch >= 10)
	movlw	(0Ah)
	bsf	status, 5	;RP0=1, select bank1
	subwf	(_timer)^080h,w
	skipc
	goto	u1591
	goto	u1590
u1591:
	goto	l4523
u1590:
	line	517
	
l4517:	
;common.c: 516: {
;common.c: 517: return 1;
	movlw	(01h)
	goto	l1952
	line	520
	
l4523:	
;common.c: 519: else
;common.c: 520: return 0;
	movlw	(0)
	line	521
	
l1952:	
	return
	opt stack 0
GLOBAL	__end_of_isPermitSampleTime
	__end_of_isPermitSampleTime:
;; =============== function _isPermitSampleTime ends ============

	signat	_isPermitSampleTime,89
	global	_startTwentyMinuteTimer
psect	text1065,local,class=CODE,delta=2
global __ptext1065
__ptext1065:

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
psect	text1065
	file	"C:\temp\dev\AK7030-OTP\common.c"
	line	458
	global	__size_of_startTwentyMinuteTimer
	__size_of_startTwentyMinuteTimer	equ	__end_of_startTwentyMinuteTimer-_startTwentyMinuteTimer
	
_startTwentyMinuteTimer:	
	opt	stack 5
; Regs used in _startTwentyMinuteTimer: [wreg+status,2+status,0]
	line	459
	
l4507:	
;common.c: 459: if(( 0 == uiTwentyMinuteTimer) && ( 0 == bTwentyMinStartFlag))
	bsf	status, 5	;RP0=1, select bank1
	movf	((_uiTwentyMinuteTimer+1)^080h),w
	iorwf	((_uiTwentyMinuteTimer)^080h),w
	skipz
	goto	u1571
	goto	u1570
u1571:
	goto	l1928
u1570:
	
l4509:	
	bcf	status, 5	;RP0=0, select bank0
	movf	(_bTwentyMinStartFlag),f
	skipz
	goto	u1581
	goto	u1580
u1581:
	goto	l1928
u1580:
	line	461
	
l4511:	
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
	
l4513:	
;common.c: 462: bTwentyMinStartFlag = 1;
	bcf	status, 5	;RP0=0, select bank0
	clrf	(_bTwentyMinStartFlag)
	incf	(_bTwentyMinStartFlag),f
	line	464
	
l1928:	
	return
	opt stack 0
GLOBAL	__end_of_startTwentyMinuteTimer
	__end_of_startTwentyMinuteTimer:
;; =============== function _startTwentyMinuteTimer ends ============

	signat	_startTwentyMinuteTimer,4216
	global	_adc_start
psect	text1066,local,class=CODE,delta=2
global __ptext1066
__ptext1066:

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
psect	text1066
	file	"C:\temp\dev\AK7030-OTP\periph.c"
	line	100
	global	__size_of_adc_start
	__size_of_adc_start	equ	__end_of_adc_start-_adc_start
	
_adc_start:	
	opt	stack 4
; Regs used in _adc_start: []
	line	101
	
l4505:	
;periph.c: 101: GO=1;
	bcf	status, 5	;RP0=0, select bank0
	bsf	(249/8),(249)&7
	line	102
	
l2621:	
	return
	opt stack 0
GLOBAL	__end_of_adc_start
	__end_of_adc_start:
;; =============== function _adc_start ends ============

	signat	_adc_start,88
	global	_op1_init
psect	text1067,local,class=CODE,delta=2
global __ptext1067
__ptext1067:

;; *************** function _op1_init *****************
;; Defined at:
;;		line 26 in file "C:\temp\dev\AK7030-OTP\periph.c"
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
psect	text1067
	file	"C:\temp\dev\AK7030-OTP\periph.c"
	line	26
	global	__size_of_op1_init
	__size_of_op1_init	equ	__end_of_op1_init-_op1_init
	
_op1_init:	
	opt	stack 5
; Regs used in _op1_init: [wreg]
	line	33
	
l4499:	
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
	
l4501:	
;periph.c: 38: TRISB3=1;
	bsf	status, 5	;RP0=1, select bank1
	bsf	(1075/8)^080h,(1075)&7
	line	40
	
l4503:	
;periph.c: 40: TRISB5=0;
	bcf	(1077/8)^080h,(1077)&7
	line	41
	
l2604:	
	return
	opt stack 0
GLOBAL	__end_of_op1_init
	__end_of_op1_init:
;; =============== function _op1_init ends ============

	signat	_op1_init,88
	global	_adc_test_init
psect	text1068,local,class=CODE,delta=2
global __ptext1068
__ptext1068:

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
psect	text1068
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
	
l4489:	
;periph.c: 86: ADCON0 = 0x00;
	clrf	(31)	;volatile
	line	87
	
l4491:	
;periph.c: 87: ADCON0|=channel<<2;
	movf	(adc_test_init@channel),w
	movwf	(??_adc_test_init+0)+0
	clrc
	rlf	(??_adc_test_init+0)+0,f
	clrc
	rlf	(??_adc_test_init+0)+0,w
	iorwf	(31),f	;volatile
	line	88
	
l4493:	
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
	
l4495:	
;periph.c: 89: ADON=1;
	bcf	status, 5	;RP0=0, select bank0
	bsf	(248/8),(248)&7
	line	90
	
l4497:	
;periph.c: 90: ADIE=1;
	bsf	status, 5	;RP0=1, select bank1
	bsf	(1130/8)^080h,(1130)&7
	line	91
	
l2615:	
	return
	opt stack 0
GLOBAL	__end_of_adc_test_init
	__end_of_adc_test_init:
;; =============== function _adc_test_init ends ============

	signat	_adc_test_init,8312
	global	_op2_init
psect	text1069,local,class=CODE,delta=2
global __ptext1069
__ptext1069:

;; *************** function _op2_init *****************
;; Defined at:
;;		line 45 in file "C:\temp\dev\AK7030-OTP\periph.c"
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
psect	text1069
	file	"C:\temp\dev\AK7030-OTP\periph.c"
	line	45
	global	__size_of_op2_init
	__size_of_op2_init	equ	__end_of_op2_init-_op2_init
	
_op2_init:	
	opt	stack 5
; Regs used in _op2_init: [wreg]
	line	52
	
l4487:	
;periph.c: 52: OP2CON1=0x14;
	movlw	(014h)
	movwf	(156)^080h	;volatile
	line	54
;periph.c: 54: OP2CON2=0x10;
	movlw	(010h)
	movwf	(157)^080h	;volatile
	line	55
;periph.c: 55: OP2CON0=0x80;
	movlw	(080h)
	movwf	(155)^080h	;volatile
	line	61
	
l2607:	
	return
	opt stack 0
GLOBAL	__end_of_op2_init
	__end_of_op2_init:
;; =============== function _op2_init ends ============

	signat	_op2_init,88
	global	_timer1_interrupt_config
psect	text1070,local,class=CODE,delta=2
global __ptext1070
__ptext1070:

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
psect	text1070
	file	"C:\temp\dev\AK7030-OTP\common.c"
	line	225
	global	__size_of_timer1_interrupt_config
	__size_of_timer1_interrupt_config	equ	__end_of_timer1_interrupt_config-_timer1_interrupt_config
	
_timer1_interrupt_config:	
	opt	stack 5
; Regs used in _timer1_interrupt_config: []
	line	226
	
l4485:	
;common.c: 226: GIE = 1;
	bsf	(95/8),(95)&7
	line	227
;common.c: 227: PEIE = 1;
	bsf	(94/8),(94)&7
	line	228
	
l1861:	
	return
	opt stack 0
GLOBAL	__end_of_timer1_interrupt_config
	__end_of_timer1_interrupt_config:
;; =============== function _timer1_interrupt_config ends ============

	signat	_timer1_interrupt_config,88
	global	_timer1_config
psect	text1071,local,class=CODE,delta=2
global __ptext1071
__ptext1071:

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
psect	text1071
	file	"C:\temp\dev\AK7030-OTP\common.c"
	line	213
	global	__size_of_timer1_config
	__size_of_timer1_config	equ	__end_of_timer1_config-_timer1_config
	
_timer1_config:	
	opt	stack 5
; Regs used in _timer1_config: [wreg]
	line	215
	
l4481:	
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
	
l4483:	
;common.c: 218: TMR1IE=1;
	bsf	status, 5	;RP0=1, select bank1
	bsf	(1120/8)^080h,(1120)&7
	line	220
	
l1858:	
	return
	opt stack 0
GLOBAL	__end_of_timer1_config
	__end_of_timer1_config:
;; =============== function _timer1_config ends ============

	signat	_timer1_config,88
	global	_clock_config
psect	text1072,local,class=CODE,delta=2
global __ptext1072
__ptext1072:

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
psect	text1072
	file	"C:\temp\dev\AK7030-OTP\common.c"
	line	205
	global	__size_of_clock_config
	__size_of_clock_config	equ	__end_of_clock_config-_clock_config
	
_clock_config:	
	opt	stack 5
; Regs used in _clock_config: [wreg+status,2]
	line	207
	
l4477:	
;common.c: 207: CLKPR = 0x80;
	movlw	(080h)
	bcf	status, 5	;RP0=0, select bank2
	bsf	status, 6	;RP1=1, select bank2
	movwf	(264)^0100h	;volatile
	line	208
	
l4479:	
;common.c: 208: CLKPR = 0x00;
	clrf	(264)^0100h	;volatile
	line	209
;common.c: 209: while(CLKPCE);
	
l1852:	
	btfsc	(2119/8)^0100h,(2119)&7
	goto	u1561
	goto	u1560
u1561:
	goto	l1852
u1560:
	line	210
	
l1855:	
	return
	opt stack 0
GLOBAL	__end_of_clock_config
	__end_of_clock_config:
;; =============== function _clock_config ends ============

	signat	_clock_config,88
	global	_setPB6AsInput
psect	text1073,local,class=CODE,delta=2
global __ptext1073
__ptext1073:

;; *************** function _setPB6AsInput *****************
;; Defined at:
;;		line 373 in file "C:\temp\dev\AK7030-OTP\main.c"
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
;;		_vHandle20sTimeron
;;		_vHandle20sTimerOut
;; This function uses a non-reentrant model
;;
psect	text1073
	file	"C:\temp\dev\AK7030-OTP\main.c"
	line	373
	global	__size_of_setPB6AsInput
	__size_of_setPB6AsInput	equ	__end_of_setPB6AsInput-_setPB6AsInput
	
_setPB6AsInput:	
	opt	stack 4
; Regs used in _setPB6AsInput: []
	line	375
	
l4475:	
;main.c: 375: TRISB6 = 1;
	bsf	status, 5	;RP0=1, select bank1
	bsf	(1078/8)^080h,(1078)&7
	line	380
	
l761:	
	return
	opt stack 0
GLOBAL	__end_of_setPB6AsInput
	__end_of_setPB6AsInput:
;; =============== function _setPB6AsInput ends ============

	signat	_setPB6AsInput,88
	global	_setPA6
psect	text1074,local,class=CODE,delta=2
global __ptext1074
__ptext1074:

;; *************** function _setPA6 *****************
;; Defined at:
;;		line 357 in file "C:\temp\dev\AK7030-OTP\main.c"
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
psect	text1074
	file	"C:\temp\dev\AK7030-OTP\main.c"
	line	357
	global	__size_of_setPA6
	__size_of_setPA6	equ	__end_of_setPA6-_setPA6
	
_setPA6:	
	opt	stack 5
; Regs used in _setPA6: [wreg]
;setPA6@bValue stored from wreg
	movwf	(setPA6@bValue)
	line	358
	
l4471:	
;main.c: 358: if( bValue )
	movf	(setPA6@bValue),w
	skipz
	goto	u1550
	goto	l756
u1550:
	line	360
	
l4473:	
;main.c: 360: PA6 = 1;
	bsf	(46/8),(46)&7
	goto	l758
	line	364
	
l756:	
	line	366
;main.c: 364: else
;main.c: 366: PA6= 0;
	bcf	(46/8),(46)&7
	line	370
	
l758:	
	return
	opt stack 0
GLOBAL	__end_of_setPA6
	__end_of_setPA6:
;; =============== function _setPA6 ends ============

	signat	_setPA6,4216
	global	_setPB4
psect	text1075,local,class=CODE,delta=2
global __ptext1075
__ptext1075:

;; *************** function _setPB4 *****************
;; Defined at:
;;		line 311 in file "C:\temp\dev\AK7030-OTP\main.c"
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
psect	text1075
	file	"C:\temp\dev\AK7030-OTP\main.c"
	line	311
	global	__size_of_setPB4
	__size_of_setPB4	equ	__end_of_setPB4-_setPB4
	
_setPB4:	
	opt	stack 4
; Regs used in _setPB4: [wreg]
;setPB4@bValue stored from wreg
	movwf	(setPB4@bValue)
	line	312
	
l4467:	
;main.c: 312: if( bValue )
	movf	(setPB4@bValue),w
	skipz
	goto	u1540
	goto	l746
u1540:
	line	314
	
l4469:	
;main.c: 314: PB4 = 1;
	bsf	(52/8),(52)&7
	goto	l748
	line	318
	
l746:	
	line	320
;main.c: 318: else
;main.c: 320: PB4 = 0;
	bcf	(52/8),(52)&7
	line	324
	
l748:	
	return
	opt stack 0
GLOBAL	__end_of_setPB4
	__end_of_setPB4:
;; =============== function _setPB4 ends ============

	signat	_setPB4,4216
	global	_setPB6
psect	text1076,local,class=CODE,delta=2
global __ptext1076
__ptext1076:

;; *************** function _setPB6 *****************
;; Defined at:
;;		line 287 in file "C:\temp\dev\AK7030-OTP\main.c"
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
psect	text1076
	file	"C:\temp\dev\AK7030-OTP\main.c"
	line	287
	global	__size_of_setPB6
	__size_of_setPB6	equ	__end_of_setPB6-_setPB6
	
_setPB6:	
	opt	stack 5
; Regs used in _setPB6: [wreg]
;setPB6@bValue stored from wreg
	movwf	(setPB6@bValue)
	line	288
	
l4463:	
;main.c: 288: if( bValue )
	movf	(setPB6@bValue),w
	skipz
	goto	u1530
	goto	l741
u1530:
	line	291
	
l4465:	
;main.c: 290: {
;main.c: 291: TRISB6 = 0;
	bsf	status, 5	;RP0=1, select bank1
	bcf	(1078/8)^080h,(1078)&7
	line	292
;main.c: 292: PB6 = 1;
	bcf	status, 5	;RP0=0, select bank0
	bsf	(54/8),(54)&7
	line	293
;main.c: 293: }
	goto	l743
	line	297
	
l741:	
	line	300
;main.c: 297: else
;main.c: 299: {
;main.c: 300: TRISB6 = 0;
	bsf	status, 5	;RP0=1, select bank1
	bcf	(1078/8)^080h,(1078)&7
	line	301
;main.c: 301: PB6 = 0;
	bcf	status, 5	;RP0=0, select bank0
	bcf	(54/8),(54)&7
	line	306
	
l743:	
	return
	opt stack 0
GLOBAL	__end_of_setPB6
	__end_of_setPB6:
;; =============== function _setPB6 ends ============

	signat	_setPB6,4216
	global	_setPA3
psect	text1077,local,class=CODE,delta=2
global __ptext1077
__ptext1077:

;; *************** function _setPA3 *****************
;; Defined at:
;;		line 270 in file "C:\temp\dev\AK7030-OTP\main.c"
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
psect	text1077
	file	"C:\temp\dev\AK7030-OTP\main.c"
	line	270
	global	__size_of_setPA3
	__size_of_setPA3	equ	__end_of_setPA3-_setPA3
	
_setPA3:	
	opt	stack 4
; Regs used in _setPA3: [wreg]
;setPA3@bValue stored from wreg
	bcf	status, 5	;RP0=0, select bank0
	movwf	(setPA3@bValue)
	line	271
	
l4459:	
;main.c: 271: if( bValue )
	movf	(setPA3@bValue),w
	skipz
	goto	u1520
	goto	l736
u1520:
	line	273
	
l4461:	
;main.c: 273: PA3 = 1;
	bsf	(43/8),(43)&7
	goto	l738
	line	277
	
l736:	
	line	279
;main.c: 277: else
;main.c: 279: PA3 = 0;
	bcf	(43/8),(43)&7
	line	283
	
l738:	
	return
	opt stack 0
GLOBAL	__end_of_setPA3
	__end_of_setPA3:
;; =============== function _setPA3 ends ============

	signat	_setPA3,4216
	global	_setPA2
psect	text1078,local,class=CODE,delta=2
global __ptext1078
__ptext1078:

;; *************** function _setPA2 *****************
;; Defined at:
;;		line 253 in file "C:\temp\dev\AK7030-OTP\main.c"
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
psect	text1078
	file	"C:\temp\dev\AK7030-OTP\main.c"
	line	253
	global	__size_of_setPA2
	__size_of_setPA2	equ	__end_of_setPA2-_setPA2
	
_setPA2:	
	opt	stack 5
; Regs used in _setPA2: [wreg]
;setPA2@bValue stored from wreg
	bcf	status, 5	;RP0=0, select bank0
	movwf	(setPA2@bValue)
	line	254
	
l4455:	
;main.c: 254: if( bValue )
	movf	(setPA2@bValue),w
	skipz
	goto	u1510
	goto	l731
u1510:
	line	256
	
l4457:	
;main.c: 256: PA2 = 1;
	bsf	(42/8),(42)&7
	goto	l733
	line	260
	
l731:	
	line	262
;main.c: 260: else
;main.c: 262: PA2 = 0;
	bcf	(42/8),(42)&7
	line	266
	
l733:	
	return
	opt stack 0
GLOBAL	__end_of_setPA2
	__end_of_setPA2:
;; =============== function _setPA2 ends ============

	signat	_setPA2,4216
	global	_setPA1
psect	text1079,local,class=CODE,delta=2
global __ptext1079
__ptext1079:

;; *************** function _setPA1 *****************
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
;;		_clearParaFunction1
;;		_main
;; This function uses a non-reentrant model
;;
psect	text1079
	file	"C:\temp\dev\AK7030-OTP\main.c"
	line	235
	global	__size_of_setPA1
	__size_of_setPA1	equ	__end_of_setPA1-_setPA1
	
_setPA1:	
	opt	stack 5
; Regs used in _setPA1: [wreg]
;setPA1@bValue stored from wreg
	movwf	(setPA1@bValue)
	line	236
	
l4451:	
;main.c: 236: if( bValue )
	movf	(setPA1@bValue),w
	skipz
	goto	u1500
	goto	l726
u1500:
	line	238
	
l4453:	
;main.c: 238: PA1 = 1;
	bsf	(41/8),(41)&7
	goto	l728
	line	242
	
l726:	
	line	244
;main.c: 242: else
;main.c: 244: PA1 = 0;
	bcf	(41/8),(41)&7
	line	248
	
l728:	
	return
	opt stack 0
GLOBAL	__end_of_setPA1
	__end_of_setPA1:
;; =============== function _setPA1 ends ============

	signat	_setPA1,4216
	global	_setPA0
psect	text1080,local,class=CODE,delta=2
global __ptext1080
__ptext1080:

;; *************** function _setPA0 *****************
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
psect	text1080
	file	"C:\temp\dev\AK7030-OTP\main.c"
	line	218
	global	__size_of_setPA0
	__size_of_setPA0	equ	__end_of_setPA0-_setPA0
	
_setPA0:	
	opt	stack 5
; Regs used in _setPA0: [wreg]
;setPA0@bValue stored from wreg
	bcf	status, 5	;RP0=0, select bank0
	movwf	(setPA0@bValue)
	line	219
	
l4447:	
;main.c: 219: if( bValue )
	movf	(setPA0@bValue),w
	skipz
	goto	u1490
	goto	l721
u1490:
	line	221
	
l4449:	
;main.c: 221: PA0 = 1;
	bsf	(40/8),(40)&7
	goto	l723
	line	225
	
l721:	
	line	227
;main.c: 225: else
;main.c: 227: PA0 = 0;
	bcf	(40/8),(40)&7
	line	231
	
l723:	
	return
	opt stack 0
GLOBAL	__end_of_setPA0
	__end_of_setPA0:
;; =============== function _setPA0 ends ============

	signat	_setPA0,4216
	global	_setPB2
psect	text1081,local,class=CODE,delta=2
global __ptext1081
__ptext1081:

;; *************** function _setPB2 *****************
;; Defined at:
;;		line 201 in file "C:\temp\dev\AK7030-OTP\main.c"
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
psect	text1081
	file	"C:\temp\dev\AK7030-OTP\main.c"
	line	201
	global	__size_of_setPB2
	__size_of_setPB2	equ	__end_of_setPB2-_setPB2
	
_setPB2:	
	opt	stack 5
; Regs used in _setPB2: [wreg]
;setPB2@bValue stored from wreg
	movwf	(setPB2@bValue)
	line	202
	
l4443:	
;main.c: 202: if( bValue )
	movf	(setPB2@bValue),w
	skipz
	goto	u1480
	goto	l716
u1480:
	line	204
	
l4445:	
;main.c: 204: PB2 = 1;
	bsf	(50/8),(50)&7
	goto	l718
	line	208
	
l716:	
	line	210
;main.c: 208: else
;main.c: 210: PB2 = 0;
	bcf	(50/8),(50)&7
	line	214
	
l718:	
	return
	opt stack 0
GLOBAL	__end_of_setPB2
	__end_of_setPB2:
;; =============== function _setPB2 ends ============

	signat	_setPB2,4216
	global	_setPB1
psect	text1082,local,class=CODE,delta=2
global __ptext1082
__ptext1082:

;; *************** function _setPB1 *****************
;; Defined at:
;;		line 184 in file "C:\temp\dev\AK7030-OTP\main.c"
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
psect	text1082
	file	"C:\temp\dev\AK7030-OTP\main.c"
	line	184
	global	__size_of_setPB1
	__size_of_setPB1	equ	__end_of_setPB1-_setPB1
	
_setPB1:	
	opt	stack 5
; Regs used in _setPB1: [wreg]
;setPB1@bValue stored from wreg
	movwf	(setPB1@bValue)
	line	185
	
l4439:	
;main.c: 185: if( bValue )
	movf	(setPB1@bValue),w
	skipz
	goto	u1470
	goto	l711
u1470:
	line	187
	
l4441:	
;main.c: 187: PB1 = 1;
	bsf	(49/8),(49)&7
	goto	l713
	line	191
	
l711:	
	line	193
;main.c: 191: else
;main.c: 193: PB1 = 0;
	bcf	(49/8),(49)&7
	line	197
	
l713:	
	return
	opt stack 0
GLOBAL	__end_of_setPB1
	__end_of_setPB1:
;; =============== function _setPB1 ends ============

	signat	_setPB1,4216
	global	_setPB0
psect	text1083,local,class=CODE,delta=2
global __ptext1083
__ptext1083:

;; *************** function _setPB0 *****************
;; Defined at:
;;		line 167 in file "C:\temp\dev\AK7030-OTP\main.c"
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
psect	text1083
	file	"C:\temp\dev\AK7030-OTP\main.c"
	line	167
	global	__size_of_setPB0
	__size_of_setPB0	equ	__end_of_setPB0-_setPB0
	
_setPB0:	
	opt	stack 5
; Regs used in _setPB0: [wreg]
;setPB0@bValue stored from wreg
	movwf	(setPB0@bValue)
	line	168
	
l4435:	
;main.c: 168: if( bValue )
	movf	(setPB0@bValue),w
	skipz
	goto	u1460
	goto	l706
u1460:
	line	170
	
l4437:	
;main.c: 170: PB0 = 1;
	bsf	(48/8),(48)&7
	goto	l708
	line	174
	
l706:	
	line	176
;main.c: 174: else
;main.c: 176: PB0 = 0;
	bcf	(48/8),(48)&7
	line	180
	
l708:	
	return
	opt stack 0
GLOBAL	__end_of_setPB0
	__end_of_setPB0:
;; =============== function _setPB0 ends ============

	signat	_setPB0,4216
	global	_initPin
psect	text1084,local,class=CODE,delta=2
global __ptext1084
__ptext1084:

;; *************** function _initPin *****************
;; Defined at:
;;		line 130 in file "C:\temp\dev\AK7030-OTP\main.c"
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
psect	text1084
	file	"C:\temp\dev\AK7030-OTP\main.c"
	line	130
	global	__size_of_initPin
	__size_of_initPin	equ	__end_of_initPin-_initPin
	
_initPin:	
	opt	stack 5
; Regs used in _initPin: []
	line	133
	
l4433:	
;main.c: 133: TRISB0 = 0;
	bsf	status, 5	;RP0=1, select bank1
	bcf	(1072/8)^080h,(1072)&7
	line	134
;main.c: 134: PB0 = 0;
	bcf	status, 5	;RP0=0, select bank0
	bcf	(48/8),(48)&7
	line	135
;main.c: 135: TRISB1 = 0;
	bsf	status, 5	;RP0=1, select bank1
	bcf	(1073/8)^080h,(1073)&7
	line	136
;main.c: 136: PB1 = 0;
	bcf	status, 5	;RP0=0, select bank0
	bcf	(49/8),(49)&7
	line	137
;main.c: 137: TRISB2 = 0;
	bsf	status, 5	;RP0=1, select bank1
	bcf	(1074/8)^080h,(1074)&7
	line	138
;main.c: 138: PB2 = 0;
	bcf	status, 5	;RP0=0, select bank0
	bcf	(50/8),(50)&7
	line	139
;main.c: 139: TRISA0 = 0;
	bsf	status, 5	;RP0=1, select bank1
	bcf	(1064/8)^080h,(1064)&7
	line	140
;main.c: 140: PA0 = 0;
	bcf	status, 5	;RP0=0, select bank0
	bcf	(40/8),(40)&7
	line	141
;main.c: 141: TRISA1 = 0;
	bsf	status, 5	;RP0=1, select bank1
	bcf	(1065/8)^080h,(1065)&7
	line	142
;main.c: 142: PA1 = 0;
	bcf	status, 5	;RP0=0, select bank0
	bcf	(41/8),(41)&7
	line	143
;main.c: 143: TRISA2 = 0;
	bsf	status, 5	;RP0=1, select bank1
	bcf	(1066/8)^080h,(1066)&7
	line	144
;main.c: 144: PA2 = 1;
	bcf	status, 5	;RP0=0, select bank0
	bsf	(42/8),(42)&7
	line	146
;main.c: 146: TRISA3 = 0;
	bsf	status, 5	;RP0=1, select bank1
	bcf	(1067/8)^080h,(1067)&7
	line	147
;main.c: 147: PA3 = 0;
	bcf	status, 5	;RP0=0, select bank0
	bcf	(43/8),(43)&7
	line	148
;main.c: 148: TRISB4 = 0;
	bsf	status, 5	;RP0=1, select bank1
	bcf	(1076/8)^080h,(1076)&7
	line	149
;main.c: 149: PB4 = 0;
	bcf	status, 5	;RP0=0, select bank0
	bcf	(52/8),(52)&7
	line	150
;main.c: 150: TRISB7 = 0;
	bsf	status, 5	;RP0=1, select bank1
	bcf	(1079/8)^080h,(1079)&7
	line	151
;main.c: 151: PB7 = 0;
	bcf	status, 5	;RP0=0, select bank0
	bcf	(55/8),(55)&7
	line	153
;main.c: 153: TRISB6 = 1;
	bsf	status, 5	;RP0=1, select bank1
	bsf	(1078/8)^080h,(1078)&7
	line	162
	
l703:	
	return
	opt stack 0
GLOBAL	__end_of_initPin
	__end_of_initPin:
;; =============== function _initPin ends ============

	signat	_initPin,88
	global	_clearTwentyMinuteTimer
psect	text1085,local,class=CODE,delta=2
global __ptext1085
__ptext1085:

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
psect	text1085
	file	"C:\temp\dev\AK7030-OTP\common.c"
	line	427
	global	__size_of_clearTwentyMinuteTimer
	__size_of_clearTwentyMinuteTimer	equ	__end_of_clearTwentyMinuteTimer-_clearTwentyMinuteTimer
	
_clearTwentyMinuteTimer:	
	opt	stack 4
; Regs used in _clearTwentyMinuteTimer: [status,2]
	line	428
	
l4431:	
;common.c: 428: uiTwentyMinuteTimer = 0;
	clrf	(_uiTwentyMinuteTimer)^080h
	clrf	(_uiTwentyMinuteTimer+1)^080h
	line	429
;common.c: 429: bTwentyMinStartFlag = 0;
	bcf	status, 5	;RP0=0, select bank0
	clrf	(_bTwentyMinStartFlag)
	line	430
	
l1916:	
	return
	opt stack 0
GLOBAL	__end_of_clearTwentyMinuteTimer
	__end_of_clearTwentyMinuteTimer:
;; =============== function _clearTwentyMinuteTimer ends ============

	signat	_clearTwentyMinuteTimer,88
	global	_clearTwentySecondsTimer
psect	text1086,local,class=CODE,delta=2
global __ptext1086
__ptext1086:

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
psect	text1086
	file	"C:\temp\dev\AK7030-OTP\common.c"
	line	419
	global	__size_of_clearTwentySecondsTimer
	__size_of_clearTwentySecondsTimer	equ	__end_of_clearTwentySecondsTimer-_clearTwentySecondsTimer
	
_clearTwentySecondsTimer:	
	opt	stack 4
; Regs used in _clearTwentySecondsTimer: [status,2]
	line	420
	
l4429:	
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
	
l1913:	
	return
	opt stack 0
GLOBAL	__end_of_clearTwentySecondsTimer
	__end_of_clearTwentySecondsTimer:
;; =============== function _clearTwentySecondsTimer ends ============

	signat	_clearTwentySecondsTimer,88
	global	_clearThreeHoursTimer
psect	text1087,local,class=CODE,delta=2
global __ptext1087
__ptext1087:

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
psect	text1087
	file	"C:\temp\dev\AK7030-OTP\common.c"
	line	413
	global	__size_of_clearThreeHoursTimer
	__size_of_clearThreeHoursTimer	equ	__end_of_clearThreeHoursTimer-_clearThreeHoursTimer
	
_clearThreeHoursTimer:	
	opt	stack 4
; Regs used in _clearThreeHoursTimer: [status,2]
	line	414
	
l4427:	
;common.c: 414: uiSmallTimer = 0;
	bsf	status, 5	;RP0=1, select bank1
	clrf	(_uiSmallTimer)^080h
	clrf	(_uiSmallTimer+1)^080h
	line	415
;common.c: 415: bSmallTimerStartFlag = 0;
	bcf	status, 5	;RP0=0, select bank0
	clrf	(_bSmallTimerStartFlag)
	line	416
	
l1910:	
	return
	opt stack 0
GLOBAL	__end_of_clearThreeHoursTimer
	__end_of_clearThreeHoursTimer:
;; =============== function _clearThreeHoursTimer ends ============

	signat	_clearThreeHoursTimer,88
	global	_clearTwelveHoursTimer
psect	text1088,local,class=CODE,delta=2
global __ptext1088
__ptext1088:

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
psect	text1088
	file	"C:\temp\dev\AK7030-OTP\common.c"
	line	406
	global	__size_of_clearTwelveHoursTimer
	__size_of_clearTwelveHoursTimer	equ	__end_of_clearTwelveHoursTimer-_clearTwelveHoursTimer
	
_clearTwelveHoursTimer:	
	opt	stack 4
; Regs used in _clearTwelveHoursTimer: [status,2]
	line	407
	
l4425:	
;common.c: 407: uiBigTimer = 0;
	bsf	status, 5	;RP0=1, select bank1
	clrf	(_uiBigTimer)^080h
	clrf	(_uiBigTimer+1)^080h
	line	408
;common.c: 408: bBigTimerStartFlag = 0;
	bcf	status, 5	;RP0=0, select bank0
	clrf	(_bBigTimerStartFlag)
	line	409
	
l1907:	
	return
	opt stack 0
GLOBAL	__end_of_clearTwelveHoursTimer
	__end_of_clearTwelveHoursTimer:
;; =============== function _clearTwelveHoursTimer ends ============

	signat	_clearTwelveHoursTimer,88
	global	_ISR
psect	text1089,local,class=CODE,delta=2
global __ptext1089
__ptext1089:

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
psect	text1089
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
psect	text1089
	line	532
	
i1l4733:	
;common.c: 530: static unsigned char ucTimer1sCnt = 0;
;common.c: 532: if(TMR1IF == 1)
	btfss	(96/8),(96)&7
	goto	u188_21
	goto	u188_20
u188_21:
	goto	i1l4755
u188_20:
	line	534
	
i1l4735:	
;common.c: 533: {
;common.c: 534: TMR1IF = 0 ;
	bcf	(96/8),(96)&7
	line	535
	
i1l4737:	
;common.c: 535: timer.timer10msStopWatch++;
	bsf	status, 5	;RP0=1, select bank1
	incf	(_timer)^080h,f
	line	536
;common.c: 536: ucTimer1sCnt++;
	incf	(ISR@ucTimer1sCnt)^080h,f
	line	538
	
i1l4739:	
;common.c: 538: if(ucTimer1sCnt >= 100)
	movlw	(064h)
	subwf	(ISR@ucTimer1sCnt)^080h,w
	skipc
	goto	u189_21
	goto	u189_20
u189_21:
	goto	i1l4755
u189_20:
	line	540
	
i1l4741:	
;common.c: 539: {
;common.c: 540: ucTimer1sCnt = 0;
	clrf	(ISR@ucTimer1sCnt)^080h
	line	541
	
i1l4743:	
;common.c: 541: if(uiBigTimer > 0)
	movf	(_uiBigTimer+1)^080h,w
	iorwf	(_uiBigTimer)^080h,w
	skipnz
	goto	u190_21
	goto	u190_20
u190_21:
	goto	i1l1963
u190_20:
	line	542
	
i1l4745:	
;common.c: 542: uiBigTimer--;
	movlw	low(01h)
	subwf	(_uiBigTimer)^080h,f
	movlw	high(01h)
	skipc
	decf	(_uiBigTimer+1)^080h,f
	subwf	(_uiBigTimer+1)^080h,f
	
i1l1963:	
	line	544
;common.c: 544: if(uiSmallTimer)
	movf	(_uiSmallTimer+1)^080h,w
	iorwf	(_uiSmallTimer)^080h,w
	skipnz
	goto	u191_21
	goto	u191_20
u191_21:
	goto	i1l1964
u191_20:
	line	545
	
i1l4747:	
;common.c: 545: uiSmallTimer--;
	movlw	low(01h)
	subwf	(_uiSmallTimer)^080h,f
	movlw	high(01h)
	skipc
	decf	(_uiSmallTimer+1)^080h,f
	subwf	(_uiSmallTimer+1)^080h,f
	
i1l1964:	
	line	547
;common.c: 547: if((uiTwentySecondsTimer)&& (0 == bPause20secTimer))
	movf	(_uiTwentySecondsTimer+1)^080h,w
	iorwf	(_uiTwentySecondsTimer)^080h,w
	skipnz
	goto	u192_21
	goto	u192_20
u192_21:
	goto	i1l1965
u192_20:
	
i1l4749:	
	movf	(_bPause20secTimer)^080h,f
	skipz
	goto	u193_21
	goto	u193_20
u193_21:
	goto	i1l1965
u193_20:
	line	548
	
i1l4751:	
;common.c: 548: uiTwentySecondsTimer--;
	movlw	low(01h)
	subwf	(_uiTwentySecondsTimer)^080h,f
	movlw	high(01h)
	skipc
	decf	(_uiTwentySecondsTimer+1)^080h,f
	subwf	(_uiTwentySecondsTimer+1)^080h,f
	
i1l1965:	
	line	550
;common.c: 550: if((uiTwentyMinuteTimer))
	movf	(_uiTwentyMinuteTimer+1)^080h,w
	iorwf	(_uiTwentyMinuteTimer)^080h,w
	skipnz
	goto	u194_21
	goto	u194_20
u194_21:
	goto	i1l4755
u194_20:
	line	551
	
i1l4753:	
;common.c: 551: uiTwentyMinuteTimer--;
	movlw	low(01h)
	subwf	(_uiTwentyMinuteTimer)^080h,f
	movlw	high(01h)
	skipc
	decf	(_uiTwentyMinuteTimer+1)^080h,f
	subwf	(_uiTwentyMinuteTimer+1)^080h,f
	line	555
	
i1l4755:	
;common.c: 552: }
;common.c: 553: }
;common.c: 555: if(ADIF)
	bcf	status, 5	;RP0=0, select bank0
	btfss	(106/8),(106)&7
	goto	u195_21
	goto	u195_20
u195_21:
	goto	i1l1968
u195_20:
	line	557
	
i1l4757:	
;common.c: 556: {
;common.c: 557: ADIF=0;
	bcf	(106/8),(106)&7
	line	558
	
i1l4759:	
;common.c: 558: setAD_ConvertFlag(1);
	movlw	(01h)
	fcall	i1_setAD_ConvertFlag
	line	559
	
i1l4761:	
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
	
i1l1968:	
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
psect	text1090,local,class=CODE,delta=2
global __ptext1090
__ptext1090:

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
psect	text1090
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
	
i1l4767:	
;common.c: 240: adc_convert_flag = flag;
	movf	(i1setAD_ConvertFlag@flag),w
	bsf	status, 5	;RP0=1, select bank1
	movwf	(_adc_convert_flag)^080h
	line	241
	
i1l1867:	
	return
	opt stack 0
GLOBAL	__end_ofi1_setAD_ConvertFlag
	__end_ofi1_setAD_ConvertFlag:
;; =============== function i1_setAD_ConvertFlag ends ============

	signat	i1_setAD_ConvertFlag,88
	global	_adc_get
psect	text1091,local,class=CODE,delta=2
global __ptext1091
__ptext1091:

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
psect	text1091
	file	"C:\temp\dev\AK7030-OTP\periph.c"
	line	105
	global	__size_of_adc_get
	__size_of_adc_get	equ	__end_of_adc_get-_adc_get
	
_adc_get:	
	opt	stack 3
; Regs used in _adc_get: [wreg]
	line	107
	
i1l4763:	
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
	
i1l2624:	
	return
	opt stack 0
GLOBAL	__end_of_adc_get
	__end_of_adc_get:
;; =============== function _adc_get ends ============

	signat	_adc_get,90
	global	_vPutSampleDataIntoTable
psect	text1092,local,class=CODE,delta=2
global __ptext1092
__ptext1092:

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
psect	text1092
	file	"C:\temp\dev\AK7030-OTP\common.c"
	global	__size_of_vPutSampleDataIntoTable
	__size_of_vPutSampleDataIntoTable	equ	__end_of_vPutSampleDataIntoTable-_vPutSampleDataIntoTable
	
_vPutSampleDataIntoTable:	
	opt	stack 3
; Regs used in _vPutSampleDataIntoTable: [wreg-fsr0h+status,2+status,0+btemp+1]
	line	119
	
i1l4667:	
;common.c: 111: static unsigned char ucChannelZeroLength = 0;
;common.c: 113: static unsigned char ucChannelSecondLength = 0;
;common.c: 115: static unsigned char ucChannelFifthLength = 0;
;common.c: 117: static unsigned char ucChannelSixthLength = 0;
;common.c: 119: if(channel == 0)
	movf	(vPutSampleDataIntoTable@channel),f
	skipz
	goto	u179_21
	goto	u179_20
u179_21:
	goto	i1l4679
u179_20:
	line	121
	
i1l4669:	
;common.c: 120: {
;common.c: 121: if(ucChannelZeroLength < 12)
	movlw	(0Ch)
	subwf	(vPutSampleDataIntoTable@ucChannelZeroLength),w
	skipnc
	goto	u180_21
	goto	u180_20
u180_21:
	goto	i1l4675
u180_20:
	line	123
	
i1l4671:	
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
	
i1l4673:	
;common.c: 125: ucChannelZeroLength++;
	incf	(vPutSampleDataIntoTable@ucChannelZeroLength),f
	line	126
;common.c: 126: }
	goto	i1l1849
	line	129
	
i1l4675:	
;common.c: 127: else
;common.c: 128: {
;common.c: 129: ucChannelZeroLength = 0;
	clrf	(vPutSampleDataIntoTable@ucChannelZeroLength)
	line	131
	
i1l4677:	
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
	goto	i1l1849
	line	134
	
i1l4679:	
;common.c: 134: else if(channel == 2)
	movf	(vPutSampleDataIntoTable@channel),w
	xorlw	02h
	skipz
	goto	u181_21
	goto	u181_20
u181_21:
	goto	i1l4691
u181_20:
	line	136
	
i1l4681:	
;common.c: 135: {
;common.c: 136: if(ucChannelSecondLength < 12)
	movlw	(0Ch)
	subwf	(vPutSampleDataIntoTable@ucChannelSecondLength),w
	skipnc
	goto	u182_21
	goto	u182_20
u182_21:
	goto	i1l4687
u182_20:
	line	138
	
i1l4683:	
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
	
i1l4685:	
;common.c: 140: ucChannelSecondLength++;
	incf	(vPutSampleDataIntoTable@ucChannelSecondLength),f
	line	141
;common.c: 141: }
	goto	i1l1849
	line	144
	
i1l4687:	
;common.c: 142: else
;common.c: 143: {
;common.c: 144: ucChannelSecondLength = 0;
	clrf	(vPutSampleDataIntoTable@ucChannelSecondLength)
	line	146
	
i1l4689:	
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
	goto	i1l1849
	line	149
	
i1l4691:	
;common.c: 149: else if(channel == 5)
	movf	(vPutSampleDataIntoTable@channel),w
	xorlw	05h
	skipz
	goto	u183_21
	goto	u183_20
u183_21:
	goto	i1l4703
u183_20:
	line	151
	
i1l4693:	
;common.c: 150: {
;common.c: 151: if(ucChannelFifthLength < 12)
	movlw	(0Ch)
	subwf	(vPutSampleDataIntoTable@ucChannelFifthLength),w
	skipnc
	goto	u184_21
	goto	u184_20
u184_21:
	goto	i1l4699
u184_20:
	line	153
	
i1l4695:	
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
	
i1l4697:	
;common.c: 155: ucChannelFifthLength++;
	incf	(vPutSampleDataIntoTable@ucChannelFifthLength),f
	line	156
;common.c: 156: }
	goto	i1l1849
	line	159
	
i1l4699:	
;common.c: 157: else
;common.c: 158: {
;common.c: 159: ucChannelFifthLength = 0;
	clrf	(vPutSampleDataIntoTable@ucChannelFifthLength)
	line	161
	
i1l4701:	
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
	goto	i1l1849
	line	164
	
i1l4703:	
;common.c: 164: else if(channel == 6)
	movf	(vPutSampleDataIntoTable@channel),w
	xorlw	06h
	skipz
	goto	u185_21
	goto	u185_20
u185_21:
	goto	i1l4715
u185_20:
	line	166
	
i1l4705:	
;common.c: 165: {
;common.c: 166: if(ucChannelSixthLength < 12)
	movlw	(0Ch)
	subwf	(vPutSampleDataIntoTable@ucChannelSixthLength),w
	skipnc
	goto	u186_21
	goto	u186_20
u186_21:
	goto	i1l4711
u186_20:
	line	168
	
i1l4707:	
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
	
i1l4709:	
;common.c: 170: ucChannelSixthLength++;
	incf	(vPutSampleDataIntoTable@ucChannelSixthLength),f
	line	171
;common.c: 171: }
	goto	i1l1849
	line	174
	
i1l4711:	
;common.c: 172: else
;common.c: 173: {
;common.c: 174: ucChannelSixthLength = 0;
	clrf	(vPutSampleDataIntoTable@ucChannelSixthLength)
	line	176
	
i1l4713:	
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
	goto	i1l1849
	line	181
	
i1l4715:	
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
	
i1l4721:	
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
	
i1l4723:	
	incf	(vPutSampleDataIntoTable@i),f
	skipnz
	incf	(vPutSampleDataIntoTable@i+1),f
	
i1l4725:	
	movf	(vPutSampleDataIntoTable@i+1),w
	xorlw	80h
	movwf	btemp+1
	movlw	(high(0Ch))^80h
	subwf	btemp+1,w
	skipz
	goto	u187_25
	movlw	low(0Ch)
	subwf	(vPutSampleDataIntoTable@i),w
u187_25:

	skipc
	goto	u187_21
	goto	u187_20
u187_21:
	goto	i1l4721
u187_20:
	line	201
	
i1l1849:	
	return
	opt stack 0
GLOBAL	__end_of_vPutSampleDataIntoTable
	__end_of_vPutSampleDataIntoTable:
;; =============== function _vPutSampleDataIntoTable ends ============

	signat	_vPutSampleDataIntoTable,8312
psect	text1093,local,class=CODE,delta=2
global __ptext1093
__ptext1093:
	global	btemp
	btemp set 07Eh

	DABS	1,126,2	;btemp
	global	wtemp0
	wtemp0 set btemp
	end
