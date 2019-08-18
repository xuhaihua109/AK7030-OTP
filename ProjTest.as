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
# 79 "D:\develop\190625\AK7030-OTP\main.c"
	psect config,class=CONFIG,delta=2 ;#
# 79 "D:\develop\190625\AK7030-OTP\main.c"
	dw 0x2FFF & 0x3FFF & 0x3FFF & 0x3FFF & 0x3FFF & 0x3FFF ;#
# 80 "D:\develop\190625\AK7030-OTP\main.c"
	psect config,class=CONFIG,delta=2 ;#
# 80 "D:\develop\190625\AK7030-OTP\main.c"
	dw 0x3FFF & 0x3FDF & 0x3FFF & 0x3FFE ;#
# 81 "D:\develop\190625\AK7030-OTP\main.c"
	psect config,class=CONFIG,delta=2 ;#
# 81 "D:\develop\190625\AK7030-OTP\main.c"
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
	FNCALL	_main,_startTwentyMinTimer
	FNCALL	_main,_clearTwentyMinTimer
	FNCALL	_main,_isFinishedTwentyMinTimer
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
	global	main@uiOldValue
	global	_bBigTimerStartFlag
	global	_bSmallTimerStartFlag
	global	_bTwentyMinStartFlag
	global	_bTwentySecStartFlag
	global	_sampleTimes
	global	main@bCheckTweHour
	global	main@bInit20Min
	global	main@bInitFlag
	global	main@enumMainLoopStep
	global	main@ucADC4_Step
	global	main@ucChannel4Type
	global	main@ucDelayPrefix4TimerP5s
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
	global	vPutSampleDataIntoTable@ucChannelFourteenthLength
	global	vPutSampleDataIntoTable@ucChannelFourthLength
	global	vPutSampleDataIntoTable@ucChannelFirstLength
	global	_uiBigTimer
	global	_uiSmallTimer
	global	_uiTwentyMinTimer
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
	global	main@ucDelayPrefix6TimerP2s
	global	main@ucFourthSuffix1TimerP3s
	global	main@ucTimer1s
	global	main@ucTimer20s
	global	main@ucTimerLessX1P5s
	global	main@ucTimerLessX2P5s
	global	main@ucTimerP3s
	global	main@ucTimerX1P5s
	global	main@ucTimerX2P5s
	global	_uiSampleChannelFourteenth
	global	_uiSampleChannelFirst
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
vPutSampleDataIntoTable@ucChannelFirstLength:
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

_sampleTimes:
       ds      1

main@bCheckTweHour:
       ds      1

main@bInit20Min:
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

_uiTwentyMinTimer:
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

main@ucDelayPrefix6TimerP2s:
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

_uiSampleChannelFirst:
       ds      24

_uiSampleChannelFourth:
       ds      24

psect	bssBANK3,class=BANK3,space=1
global __pbssBANK3
__pbssBANK3:
_uiSampleChannelFourteenth:
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
	movlw	low((__pbssBANK1)+04Ch)
	fcall	clear_ram
; Clear objects allocated to BANK3
psect cinit,class=CODE,delta=2
	bsf	status, 7	;select IRP bank2
	movlw	low(__pbssBANK3)
	movwf	fsr
	movlw	low((__pbssBANK3)+018h)
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
	global	?_clearTwentyMinTimer
?_clearTwentyMinTimer:	; 0 bytes @ 0x0
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
	global	?_isFinishedTwentyMinTimer
?_isFinishedTwentyMinTimer:	; 1 bytes @ 0x0
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
	global	?_startTwentyMinTimer
?_startTwentyMinTimer:	; 0 bytes @ 0x0
	global	??_clearTwentyMinTimer
??_clearTwentyMinTimer:	; 0 bytes @ 0x0
	global	??_isFinishedTwentyMinTimer
??_isFinishedTwentyMinTimer:	; 0 bytes @ 0x0
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
	global	startTwentyMinTimer@uiSetValue
startTwentyMinTimer@uiSetValue:	; 2 bytes @ 0x0
	ds	1
	global	??_adc_test_init
??_adc_test_init:	; 0 bytes @ 0x1
	ds	1
	global	??_startTwentyMinTimer
??_startTwentyMinTimer:	; 0 bytes @ 0x2
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
;;Data sizes: Strings 0, constant 0, data 1, bss 139, persistent 0 stack 0
;;Auto spaces:   Size  Autos    Used
;; COMMON          14     13      14
;; BANK0           80     40      79
;; BANK1           80      0      76
;; BANK3           96      0      24
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
;;		 -> uiSampleChannelFourteenth(BANK3[24]), uiSampleChannelFourth(BANK1[24]), uiSampleChannelFirst(BANK1[24]), 
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
;; (0) _main                                                 0     0      0    2190
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
;;                _startTwentyMinTimer
;;                _clearTwentyMinTimer
;;           _isFinishedTwentyMinTimer
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
;; (1) _clearPinPortAndTimer                                 0     0      0       0
;;                      _clearAllTimer
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
;; (1) _isFinishedTwentyMinTimer                             0     0      0       0
;; ---------------------------------------------------------------------------------
;; (1) _clearTwentyMinTimer                                  0     0      0       0
;; ---------------------------------------------------------------------------------
;; (1) _startTwentyMinTimer                                  2     0      2      22
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
;;   _startTwentyMinTimer
;;   _clearTwentyMinTimer
;;   _isFinishedTwentyMinTimer
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
;;BANK3               60      0      18      10       25.0%
;;BITBANK3            60      0       0       9        0.0%
;;SFR3                 0      0       0       4        0.0%
;;BITSFR3              0      0       0       4        0.0%
;;BANK2               60      0       0      12        0.0%
;;BITBANK2            60      0       0      11        0.0%
;;SFR2                 0      0       0       5        0.0%
;;BITSFR2              0      0       0       5        0.0%
;;SFR1                 0      0       0       2        0.0%
;;BITSFR1              0      0       0       2        0.0%
;;BANK1               50      0      4C       8       95.0%
;;BITBANK1            50      0       0       7        0.0%
;;CODE                 0      0       0       0        0.0%
;;DATA                 0      0      C8       6        0.0%
;;ABS                  0      0      C1       3        0.0%
;;NULL                 0      0       0       0        0.0%
;;STACK                0      0       7       2        0.0%
;;BANK0               50     28      4F       5       98.8%
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
;;		line 461 in file "D:\develop\190625\AK7030-OTP\main.c"
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
;;		_startTwentyMinTimer
;;		_clearTwentyMinTimer
;;		_isFinishedTwentyMinTimer
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
	file	"D:\develop\190625\AK7030-OTP\main.c"
	line	461
	global	__size_of_main
	__size_of_main	equ	__end_of_main-_main
	
_main:	
	opt	stack 3
; Regs used in _main: [wreg-fsr0h+status,2+status,0+btemp+1+pclath+cstack]
	line	501
	
l4671:	
;main.c: 467: enum setp_Adc4
;main.c: 468: {
;main.c: 469: ADC4_STEP_INIT = 0,
;main.c: 470: ADC4_STEP_FIRST,
;main.c: 471: ADC4_STEP_SECOND,
;main.c: 472: ADC4_STEP_THIRD,
;main.c: 473: ADC4_STEP_FOURTH_PREFIX1,
;main.c: 474: ADC4_STEP_FOURTH_PREFIX2,
;main.c: 475: ADC4_STEP_FOURTH_PREFIX3,
;main.c: 476: ADC4_STEP_FOURTH_PREFIX4,
;main.c: 477: ADC4_STEP_FOURTH_PREFIX5,
;main.c: 478: ADC4_STEP_FOURTH_PREFIX6,
;main.c: 479: ADC4_STEP_FOURTH,
;main.c: 480: ADC4_STEP_FOURTH_SUFFIX1,
;main.c: 481: ADC4_STEP_FOURTH_SUFFIX2,
	bsf	status, 5	;RP0=1, select bank1
	bcf	(1064/8)^080h,(1064)&7
	line	502
;main.c: 502: TRISA1 = 0;
	bcf	(1065/8)^080h,(1065)&7
	line	503
;main.c: 503: TRISA2 = 0;
	bcf	(1066/8)^080h,(1066)&7
	line	504
;main.c: 504: TRISA3 = 0;
	bcf	(1067/8)^080h,(1067)&7
	line	505
;main.c: 505: TRISB0 = 0;
	bcf	(1072/8)^080h,(1072)&7
	line	506
;main.c: 506: TRISB1 = 0;
	bcf	(1073/8)^080h,(1073)&7
	line	507
;main.c: 507: TRISA6 = 0;
	bcf	(1070/8)^080h,(1070)&7
	line	509
;main.c: 509: TRISB7 = 0;
	bcf	(1079/8)^080h,(1079)&7
	line	510
;main.c: 510: TRISB6 = 0;
	bcf	(1078/8)^080h,(1078)&7
	line	513
	
l4673:	
;main.c: 513: initPin();
	fcall	_initPin
	line	516
	
l4675:	
;main.c: 516: TRISB2 = 1;
	bcf	status, 6	;RP1=0, select bank1
	bsf	(1074/8)^080h,(1074)&7
	line	519
	
l4677:	
;main.c: 519: TRISA7 = 1;
	bsf	(1071/8)^080h,(1071)&7
	line	521
	
l4679:	
;main.c: 521: TRISB4 = 1;
	bsf	(1076/8)^080h,(1076)&7
	line	523
	
l4681:	
;main.c: 523: clock_config();
	fcall	_clock_config
	line	524
	
l4683:	
;main.c: 524: timer1_config();
	fcall	_timer1_config
	line	525
;main.c: 525: timer1_interrupt_config();
	fcall	_timer1_interrupt_config
	line	527
	
l4685:	
;main.c: 527: adc_test_init(14,3);
	movlw	(03h)
	bcf	status, 5	;RP0=0, select bank0
	movwf	(?_adc_test_init)
	movlw	(0Eh)
	fcall	_adc_test_init
	line	529
	
l4687:	
;main.c: 529: dac_init();
	fcall	_dac_init
	line	530
	
l4689:	
;main.c: 530: op1_init();
	fcall	_op1_init
	line	531
	
l4691:	
;main.c: 531: op2_init();
	fcall	_op2_init
	line	534
;main.c: 534: adc_start();
	fcall	_adc_start
	line	575
	
l4693:	
# 575 "D:\develop\190625\AK7030-OTP\main.c"
 clrwdt ;#
psect	maintext
	line	577
	
l4695:	
;main.c: 577: process_AD_Converter_Value();
	fcall	_process_AD_Converter_Value
	line	579
	
l4697:	
;main.c: 579: if( isPermitSampleTime() )
	fcall	_isPermitSampleTime
	xorlw	0
	skipnz
	goto	u1901
	goto	u1900
u1901:
	goto	l4693
u1900:
	line	583
	
l4699:	
;main.c: 580: {
;main.c: 583: clrSampeTime();
	fcall	_clrSampeTime
	line	598
;main.c: 598: switch(enumMainLoopStep)
	goto	l5367
	line	607
	
l4701:	
;main.c: 601: {
;main.c: 606: static unsigned char ucTimerZeroPoint5s = 0;
;main.c: 607: if(getAdOriginalCh14Value() > 1950)
	fcall	_getAdOriginalCh14Value
	movlw	high(079Fh)
	subwf	(1+(?_getAdOriginalCh14Value)),w
	movlw	low(079Fh)
	skipnz
	subwf	(0+(?_getAdOriginalCh14Value)),w
	skipc
	goto	u1911
	goto	u1910
u1911:
	goto	l4705
u1910:
	line	609
	
l4703:	
;main.c: 608: {
;main.c: 609: ucTimerZeroPoint5s++;
	incf	(main@ucTimerZeroPoint5s),f
	line	610
;main.c: 610: }
	goto	l4713
	line	614
	
l4705:	
;main.c: 611: else
;main.c: 612: {
;main.c: 613: static unsigned char bInit20Min = 0;
;main.c: 614: if(!bInit20Min)
	movf	(main@bInit20Min),f
	skipz
	goto	u1921
	goto	u1920
u1921:
	goto	l4711
u1920:
	line	616
	
l4707:	
;main.c: 615: {
;main.c: 616: bInit20Min = 1;
	clrf	(main@bInit20Min)
	incf	(main@bInit20Min),f
	line	617
	
l4709:	
;main.c: 617: startTwentyMinTimer(1200);
	movlw	low(04B0h)
	movwf	(?_startTwentyMinTimer)
	movlw	high(04B0h)
	movwf	((?_startTwentyMinTimer))+1
	fcall	_startTwentyMinTimer
	line	619
	
l4711:	
;main.c: 618: }
;main.c: 619: ucTimerZeroPoint5s = 0;
	bcf	status, 5	;RP0=0, select bank0
	clrf	(main@ucTimerZeroPoint5s)
	line	622
	
l4713:	
;main.c: 620: }
;main.c: 622: if( ucTimerZeroPoint5s >= 5 )
	movlw	(05h)
	subwf	(main@ucTimerZeroPoint5s),w
	skipc
	goto	u1931
	goto	u1930
u1931:
	goto	l4721
u1930:
	line	624
	
l4715:	
;main.c: 623: {
;main.c: 624: ucTimerZeroPoint5s = 0;
	clrf	(main@ucTimerZeroPoint5s)
	line	625
	
l4717:	
;main.c: 625: clearTwentyMinTimer();
	fcall	_clearTwentyMinTimer
	line	626
	
l4719:	
;main.c: 626: enumMainLoopStep = MAIN_LOOP_STEP_FIRST;
	clrf	(main@enumMainLoopStep)
	incf	(main@enumMainLoopStep),f
	line	629
	
l4721:	
;main.c: 627: }
;main.c: 629: if( isFinishedTwentyMinTimer() )
	fcall	_isFinishedTwentyMinTimer
	xorlw	0
	skipnz
	goto	u1941
	goto	u1940
u1941:
	goto	l4693
u1940:
	line	631
	
l4723:	
;main.c: 630: {
;main.c: 631: enumMainLoopStep = MAIN_LOOP_STEP_12_HOUR_END;
	movlw	(09h)
	bcf	status, 5	;RP0=0, select bank0
	movwf	(main@enumMainLoopStep)
	line	632
	
l4725:	
;main.c: 632: ucTimerZeroPoint5s = 0;
	clrf	(main@ucTimerZeroPoint5s)
	goto	l4693
	line	633
	
l762:	
	line	634
;main.c: 633: }
;main.c: 634: break;
	goto	l4693
	line	646
	
l4727:	
;main.c: 638: {
;main.c: 643: static unsigned char ucTimerZeroPoint3s = 0;
;main.c: 646: if(getAdOriginalCh14Value() > 1950)
	fcall	_getAdOriginalCh14Value
	movlw	high(079Fh)
	subwf	(1+(?_getAdOriginalCh14Value)),w
	movlw	low(079Fh)
	skipnz
	subwf	(0+(?_getAdOriginalCh14Value)),w
	skipc
	goto	u1951
	goto	u1950
u1951:
	goto	l4733
u1950:
	line	649
	
l4729:	
;main.c: 647: {
;main.c: 649: enumMainLoopStep = MAIN_LOOP_STEP_SECOND;
	movlw	(02h)
	movwf	(main@enumMainLoopStep)
	line	651
	
l4731:	
;main.c: 651: ucTimerZeroPoint3s = 0;
	clrf	(main@ucTimerZeroPoint3s)
	line	653
;main.c: 653: }
	goto	l4693
	line	656
	
l4733:	
;main.c: 654: else
;main.c: 655: {
;main.c: 656: ucTimerZeroPoint3s++;
	incf	(main@ucTimerZeroPoint3s),f
	line	658
	
l4735:	
;main.c: 658: if(ucTimerZeroPoint3s >= 3)
	movlw	(03h)
	subwf	(main@ucTimerZeroPoint3s),w
	skipc
	goto	u1961
	goto	u1960
u1961:
	goto	l762
u1960:
	line	660
	
l4737:	
;main.c: 659: {
;main.c: 660: ucTimerZeroPoint3s = 0;
	clrf	(main@ucTimerZeroPoint3s)
	line	662
	
l4739:	
;main.c: 662: clearPinPortAndTimer();
	fcall	_clearPinPortAndTimer
	goto	l4693
	line	678
	
l4741:	
;main.c: 670: {
;main.c: 675: static unsigned char ucTimerP5s = 0;
;main.c: 678: setPA6(1);
	movlw	(01h)
	fcall	_setPA6
	line	680
	
l4743:	
;main.c: 680: if(ucTimerP5s < 5)
	movlw	(05h)
	subwf	(main@ucTimerP5s),w
	skipnc
	goto	u1971
	goto	u1970
u1971:
	goto	l4747
u1970:
	line	681
	
l4745:	
;main.c: 681: ucTimerP5s++;
	incf	(main@ucTimerP5s),f
	goto	l4693
	line	684
	
l4747:	
;main.c: 682: else
;main.c: 683: {
;main.c: 684: ucTimerP5s = 0;
	clrf	(main@ucTimerP5s)
	line	686
	
l4749:	
;main.c: 686: enumMainLoopStep = MAIN_LOOP_STEP_THIRD;
	movlw	(03h)
	movwf	(main@enumMainLoopStep)
	goto	l4693
	line	706
	
l4751:	
;main.c: 693: {
;main.c: 698: static unsigned char ucTimerADC1ZeroP5s = 0;
;main.c: 700: static unsigned char ucTimerLessADC1ZeroP5s = 0;
;main.c: 702: static unsigned char ucTimerLessADC1ZeroP5sFlag = 0;
;main.c: 704: static unsigned char ucTimerRightP5s = 0;
;main.c: 706: if(getAdOriginalCh1Value() < 115)
	fcall	_getAdOriginalCh1Value
	movlw	high(073h)
	subwf	(1+(?_getAdOriginalCh1Value)),w
	movlw	low(073h)
	skipnz
	subwf	(0+(?_getAdOriginalCh1Value)),w
	skipnc
	goto	u1981
	goto	u1980
u1981:
	goto	l4757
u1980:
	line	708
	
l4753:	
;main.c: 707: {
;main.c: 708: ucTimerADC1ZeroP5s = 0;
	clrf	(main@ucTimerADC1ZeroP5s)
	line	710
	
l4755:	
;main.c: 710: ucTimerLessADC1ZeroP5s++;
	incf	(main@ucTimerLessADC1ZeroP5s),f
	line	711
;main.c: 711: }
	goto	l4761
	line	714
	
l4757:	
;main.c: 712: else
;main.c: 713: {
;main.c: 714: ucTimerADC1ZeroP5s++;
	incf	(main@ucTimerADC1ZeroP5s),f
	line	716
	
l4759:	
;main.c: 716: ucTimerLessADC1ZeroP5s = 0;
	clrf	(main@ucTimerLessADC1ZeroP5s)
	line	719
	
l4761:	
;main.c: 717: }
;main.c: 719: if(ucTimerADC1ZeroP5s >= 3)
	movlw	(03h)
	subwf	(main@ucTimerADC1ZeroP5s),w
	skipc
	goto	u1991
	goto	u1990
u1991:
	goto	l4767
u1990:
	line	721
	
l4763:	
;main.c: 720: {
;main.c: 721: ucTimerADC1ZeroP5s = 0;
	clrf	(main@ucTimerADC1ZeroP5s)
	line	722
	
l4765:	
;main.c: 722: enumMainLoopStep = MAIN_LOOP_STEP_FOURTH;
	movlw	(04h)
	movwf	(main@enumMainLoopStep)
	line	723
;main.c: 723: }
	goto	l4781
	line	724
	
l4767:	
;main.c: 724: else if( ucTimerLessADC1ZeroP5s >= 3)
	movlw	(03h)
	subwf	(main@ucTimerLessADC1ZeroP5s),w
	skipc
	goto	u2001
	goto	u2000
u2001:
	goto	l4781
u2000:
	line	727
	
l4769:	
;main.c: 725: {
;main.c: 727: if(getAdOriginalCh1Value() < 105)
	fcall	_getAdOriginalCh1Value
	movlw	high(069h)
	subwf	(1+(?_getAdOriginalCh1Value)),w
	movlw	low(069h)
	skipnz
	subwf	(0+(?_getAdOriginalCh1Value)),w
	skipnc
	goto	u2011
	goto	u2010
u2011:
	goto	l4773
u2010:
	line	729
	
l4771:	
;main.c: 728: {
;main.c: 729: ucTimerRightP5s++;
	incf	(main@ucTimerRightP5s),f
	line	730
;main.c: 730: }
	goto	l4775
	line	733
	
l4773:	
;main.c: 731: else
;main.c: 732: {
;main.c: 733: ucTimerRightP5s = 0;
	clrf	(main@ucTimerRightP5s)
	line	736
	
l4775:	
;main.c: 734: }
;main.c: 736: if(ucTimerRightP5s >= 3)
	movlw	(03h)
	subwf	(main@ucTimerRightP5s),w
	skipc
	goto	u2021
	goto	u2020
u2021:
	goto	l793
u2020:
	line	738
	
l4777:	
;main.c: 737: {
;main.c: 738: ucTimerLessADC1ZeroP5s = 0;
	clrf	(main@ucTimerLessADC1ZeroP5s)
	line	739
;main.c: 739: ucTimerRightP5s = 0;
	clrf	(main@ucTimerRightP5s)
	line	740
	
l4779:	
;main.c: 740: enumMainLoopStep = MAIN_LOOP_STEP_3_HOUR_BRANCH;
	movlw	(08h)
	movwf	(main@enumMainLoopStep)
	line	741
;main.c: 741: }
	goto	l4781
	line	750
;main.c: 747: else
;main.c: 748: {
;main.c: 749: ;
	
l793:	
	line	752
	
l4781:	
;main.c: 750: }
;main.c: 752: if((MAIN_LOOP_STEP_3_HOUR_BRANCH == enumMainLoopStep) || (MAIN_LOOP_STEP_FOURTH == enumMainLoopStep))
	movf	(main@enumMainLoopStep),w
	xorlw	08h
	skipnz
	goto	u2031
	goto	u2030
u2031:
	goto	l4785
u2030:
	
l4783:	
	movf	(main@enumMainLoopStep),w
	xorlw	04h
	skipz
	goto	u2041
	goto	u2040
u2041:
	goto	l762
u2040:
	line	754
	
l4785:	
;main.c: 753: {
;main.c: 754: ucTimerRightP5s = 0;
	clrf	(main@ucTimerRightP5s)
	line	755
;main.c: 755: ucTimerADC1ZeroP5s = 0;
	clrf	(main@ucTimerADC1ZeroP5s)
	line	756
;main.c: 756: ucTimerLessADC1ZeroP5s = 0;
	clrf	(main@ucTimerLessADC1ZeroP5s)
	goto	l4693
	line	770
	
l4787:	
;main.c: 764: {
;main.c: 770: startTwelveHourTimer(36000);
	movlw	low(08CA0h)
	movwf	(?_startTwelveHourTimer)
	movlw	high(08CA0h)
	movwf	((?_startTwelveHourTimer))+1
	fcall	_startTwelveHourTimer
	line	771
	
l4789:	
;main.c: 771: enumMainLoopStep = MAIN_LOOP_STEP_FIFTH;
	movlw	(05h)
	bcf	status, 5	;RP0=0, select bank0
	movwf	(main@enumMainLoopStep)
	line	773
	
l4791:	
;main.c: 773: bCheckTweHour = 0;
	clrf	(main@bCheckTweHour)
	line	775
;main.c: 775: break;
	goto	l4693
	line	783
	
l4793:	
;main.c: 779: {
;main.c: 783: if(( isFinishedTwelveHoursTimer() && (! bCheckTweHour)))
	fcall	_isFinishedTwelveHoursTimer
	xorlw	0
	skipnz
	goto	u2051
	goto	u2050
u2051:
	goto	l5247
u2050:
	
l4795:	
	bcf	status, 5	;RP0=0, select bank0
	movf	(main@bCheckTweHour),f
	skipz
	goto	u2061
	goto	u2060
u2061:
	goto	l5247
u2060:
	line	785
	
l4797:	
;main.c: 784: {
;main.c: 785: enumMainLoopStep = MAIN_LOOP_STEP_12_HOUR_END;
	movlw	(09h)
	movwf	(main@enumMainLoopStep)
	line	786
	
l4799:	
;main.c: 786: bCheckTweHour = 1;
	clrf	(main@bCheckTweHour)
	incf	(main@bCheckTweHour),f
	line	787
;main.c: 787: }
	goto	l4693
	line	794
;main.c: 793: {
;main.c: 794: case ADC4_STEP_INIT:
	
l804:	
	line	800
;main.c: 795: {
;main.c: 800: ucADC4_Step = ADC4_STEP_FIRST;
	clrf	(main@ucADC4_Step)
	incf	(main@ucADC4_Step),f
	line	801
;main.c: 801: break;
	goto	l4693
	line	813
	
l4801:	
;main.c: 805: {
;main.c: 809: static unsigned int uiOldValue = 0, uiMinValue = 0, uiMaxValue = 0;
;main.c: 811: static unsigned char bInitFlag = 0;
;main.c: 813: if( 0 == bInitFlag)
	movf	(main@bInitFlag),f
	skipz
	goto	u2071
	goto	u2070
u2071:
	goto	l4807
u2070:
	line	815
	
l4803:	
;main.c: 814: {
;main.c: 815: bInitFlag = 1;
	clrf	(main@bInitFlag)
	incf	(main@bInitFlag),f
	line	816
	
l4805:	
;main.c: 816: uiOldValue = getAdOriginaCh4Value();
	fcall	_getAdOriginaCh4Value
	movf	(1+(?_getAdOriginaCh4Value)),w
	movwf	(main@uiOldValue+1)
	movf	(0+(?_getAdOriginaCh4Value)),w
	movwf	(main@uiOldValue)
	line	826
	
l4807:	
;main.c: 817: }
;main.c: 826: if(LESS_THAN_1911 == ucChannel4Type)
	movf	(main@ucChannel4Type),f
	skipz
	goto	u2081
	goto	u2080
u2081:
	goto	l4813
u2080:
	line	828
	
l4809:	
;main.c: 827: {
;main.c: 828: uiMinValue = 0;
	bsf	status, 5	;RP0=1, select bank1
	clrf	(main@uiMinValue)^080h
	clrf	(main@uiMinValue+1)^080h
	line	829
	
l4811:	
;main.c: 829: uiMaxValue = 1931;
	movlw	low(078Bh)
	movwf	(main@uiMaxValue)^080h
	movlw	high(078Bh)
	movwf	((main@uiMaxValue)^080h)+1
	line	830
;main.c: 830: }
	goto	l4827
	line	831
	
l4813:	
;main.c: 831: else if(BETWEEN_1911_AND_2067 == ucChannel4Type)
	decf	(main@ucChannel4Type),w
	skipz
	goto	u2091
	goto	u2090
u2091:
	goto	l4817
u2090:
	line	833
	
l4815:	
;main.c: 832: {
;main.c: 833: uiMinValue = 1931 - 40;
	movlw	low(0763h)
	bsf	status, 5	;RP0=1, select bank1
	movwf	(main@uiMinValue)^080h
	movlw	high(0763h)
	movwf	((main@uiMinValue)^080h)+1
	line	834
;main.c: 834: uiMaxValue = 2047;
	movlw	low(07FFh)
	movwf	(main@uiMaxValue)^080h
	movlw	high(07FFh)
	movwf	((main@uiMaxValue)^080h)+1
	line	835
;main.c: 835: }
	goto	l4827
	line	836
	
l4817:	
;main.c: 836: else if(BETWEEN_2067_AND_2204 == ucChannel4Type)
	movf	(main@ucChannel4Type),w
	xorlw	02h
	skipz
	goto	u2101
	goto	u2100
u2101:
	goto	l4821
u2100:
	line	838
	
l4819:	
;main.c: 837: {
;main.c: 838: uiMinValue = 2047 - 40;
	movlw	low(07D7h)
	bsf	status, 5	;RP0=1, select bank1
	movwf	(main@uiMinValue)^080h
	movlw	high(07D7h)
	movwf	((main@uiMinValue)^080h)+1
	line	839
;main.c: 839: uiMaxValue = 2164;
	movlw	low(0874h)
	movwf	(main@uiMaxValue)^080h
	movlw	high(0874h)
	movwf	((main@uiMaxValue)^080h)+1
	line	840
;main.c: 840: }
	goto	l4827
	line	841
	
l4821:	
;main.c: 841: else if(BETWEEN_2204_AND_2340 == ucChannel4Type)
	movf	(main@ucChannel4Type),w
	xorlw	03h
	skipz
	goto	u2111
	goto	u2110
u2111:
	goto	l4825
u2110:
	line	843
	
l4823:	
;main.c: 842: {
;main.c: 843: uiMinValue = 2164 - 40;
	movlw	low(084Ch)
	bsf	status, 5	;RP0=1, select bank1
	movwf	(main@uiMinValue)^080h
	movlw	high(084Ch)
	movwf	((main@uiMinValue)^080h)+1
	line	844
;main.c: 844: uiMaxValue = 2281;
	movlw	low(08E9h)
	movwf	(main@uiMaxValue)^080h
	movlw	high(08E9h)
	movwf	((main@uiMaxValue)^080h)+1
	line	845
;main.c: 845: }
	goto	l4827
	line	848
	
l4825:	
;main.c: 846: else
;main.c: 847: {
;main.c: 848: uiMinValue = 2281 - 40;
	movlw	low(08C1h)
	bsf	status, 5	;RP0=1, select bank1
	movwf	(main@uiMinValue)^080h
	movlw	high(08C1h)
	movwf	((main@uiMinValue)^080h)+1
	line	849
;main.c: 849: uiMaxValue = 2281;
	movlw	low(08E9h)
	movwf	(main@uiMaxValue)^080h
	movlw	high(08E9h)
	movwf	((main@uiMaxValue)^080h)+1
	line	854
	
l4827:	
;main.c: 850: }
;main.c: 853: if(( getAdOriginaCh4Value() < uiMinValue )
;main.c: 854: || (getAdOriginaCh4Value() > uiMaxValue ))
	fcall	_getAdOriginaCh4Value
	bsf	status, 5	;RP0=1, select bank1
	movf	(main@uiMinValue+1)^080h,w
	bcf	status, 5	;RP0=0, select bank0
	subwf	(1+(?_getAdOriginaCh4Value)),w
	skipz
	goto	u2125
	bsf	status, 5	;RP0=1, select bank1
	movf	(main@uiMinValue)^080h,w
	bcf	status, 5	;RP0=0, select bank0
	subwf	(0+(?_getAdOriginaCh4Value)),w
u2125:
	skipc
	goto	u2121
	goto	u2120
u2121:
	goto	l4831
u2120:
	
l4829:	
	fcall	_getAdOriginaCh4Value
	movf	(1+(?_getAdOriginaCh4Value)),w
	bsf	status, 5	;RP0=1, select bank1
	subwf	(main@uiMaxValue+1)^080h,w
	skipz
	goto	u2135
	bcf	status, 5	;RP0=0, select bank0
	movf	(0+(?_getAdOriginaCh4Value)),w
	bsf	status, 5	;RP0=1, select bank1
	subwf	(main@uiMaxValue)^080h,w
u2135:
	skipnc
	goto	u2131
	goto	u2130
u2131:
	goto	l4833
u2130:
	line	856
	
l4831:	
;main.c: 855: {
;main.c: 856: uiOldValue = getAdOriginaCh4Value();
	fcall	_getAdOriginaCh4Value
	movf	(1+(?_getAdOriginaCh4Value)),w
	movwf	(main@uiOldValue+1)
	movf	(0+(?_getAdOriginaCh4Value)),w
	movwf	(main@uiOldValue)
	line	859
	
l4833:	
;main.c: 857: }
;main.c: 859: if( uiOldValue < 1931 )
	movlw	high(078Bh)
	bcf	status, 5	;RP0=0, select bank0
	subwf	(main@uiOldValue+1),w
	movlw	low(078Bh)
	skipnz
	subwf	(main@uiOldValue),w
	skipnc
	goto	u2141
	goto	u2140
u2141:
	goto	l4837
u2140:
	line	860
	
l4835:	
;main.c: 860: ucChannel4Type = LESS_THAN_1911;
	clrf	(main@ucChannel4Type)
	goto	l828
	line	861
	
l4837:	
;main.c: 861: else if( uiOldValue < 2047 )
	movlw	high(07FFh)
	subwf	(main@uiOldValue+1),w
	movlw	low(07FFh)
	skipnz
	subwf	(main@uiOldValue),w
	skipnc
	goto	u2151
	goto	u2150
u2151:
	goto	l4841
u2150:
	line	862
	
l4839:	
;main.c: 862: ucChannel4Type = BETWEEN_1911_AND_2067;
	clrf	(main@ucChannel4Type)
	incf	(main@ucChannel4Type),f
	goto	l828
	line	863
	
l4841:	
;main.c: 863: else if( uiOldValue < 2164 )
	movlw	high(0874h)
	subwf	(main@uiOldValue+1),w
	movlw	low(0874h)
	skipnz
	subwf	(main@uiOldValue),w
	skipnc
	goto	u2161
	goto	u2160
u2161:
	goto	l4845
u2160:
	line	864
	
l4843:	
;main.c: 864: ucChannel4Type = BETWEEN_2067_AND_2204;
	movlw	(02h)
	movwf	(main@ucChannel4Type)
	goto	l828
	line	865
	
l4845:	
;main.c: 865: else if( uiOldValue < 2281 )
	movlw	high(08E9h)
	subwf	(main@uiOldValue+1),w
	movlw	low(08E9h)
	skipnz
	subwf	(main@uiOldValue),w
	skipnc
	goto	u2171
	goto	u2170
u2171:
	goto	l4849
u2170:
	line	866
	
l4847:	
;main.c: 866: ucChannel4Type = BETWEEN_2204_AND_2340;
	movlw	(03h)
	movwf	(main@ucChannel4Type)
	goto	l828
	line	868
	
l4849:	
;main.c: 867: else
;main.c: 868: ucChannel4Type = MORE_THAN_2340;
	movlw	(04h)
	movwf	(main@ucChannel4Type)
	
l828:	
	line	870
;main.c: 870: ucADC4_Step = ADC4_STEP_SECOND;
	movlw	(02h)
	movwf	(main@ucADC4_Step)
	line	871
;main.c: 871: break;
	goto	l4693
	line	889
;main.c: 888: {
;main.c: 889: case 0:
	
l843:	
	line	893
;main.c: 890: {
;main.c: 893: PB0 = 1;
	bsf	(48/8),(48)&7
	line	897
	
l4851:	
;main.c: 897: ucLoaderStep++;
	incf	(main@ucLoaderStep),f
	line	898
;main.c: 898: break;
	goto	l4693
	line	903
	
l4853:	
;main.c: 902: {
;main.c: 903: if(ucTimerDelay >= 5)
	movlw	(05h)
	subwf	(main@ucTimerDelay),w
	skipc
	goto	u2181
	goto	u2180
u2181:
	goto	l4861
u2180:
	line	906
	
l4855:	
;main.c: 904: {
;main.c: 906: PA0 = 1;
	bsf	(40/8),(40)&7
	line	910
	
l4857:	
;main.c: 910: ucTimerDelay = 0;
	clrf	(main@ucTimerDelay)
	goto	l4851
	line	914
	
l4861:	
;main.c: 913: else
;main.c: 914: ucTimerDelay++;
	incf	(main@ucTimerDelay),f
	goto	l4693
	line	920
	
l4863:	
;main.c: 919: {
;main.c: 920: if(ucTimerDelay >= 5)
	movlw	(05h)
	subwf	(main@ucTimerDelay),w
	skipc
	goto	u2191
	goto	u2190
u2191:
	goto	l4861
u2190:
	line	923
	
l4865:	
;main.c: 921: {
;main.c: 923: PA1= 1;
	bsf	(41/8),(41)&7
	goto	l4857
	line	938
	
l4873:	
;main.c: 937: {
;main.c: 938: if(ucTimerDelay >= 5)
	movlw	(05h)
	subwf	(main@ucTimerDelay),w
	skipc
	goto	u2201
	goto	u2200
u2201:
	goto	l4861
u2200:
	line	941
	
l4875:	
;main.c: 939: {
;main.c: 941: PA2= 1;
	bsf	(42/8),(42)&7
	goto	l4857
	line	956
	
l4883:	
;main.c: 955: {
;main.c: 956: if(ucTimerDelay >= 5)
	movlw	(05h)
	subwf	(main@ucTimerDelay),w
	skipc
	goto	u2211
	goto	u2210
u2211:
	goto	l4861
u2210:
	line	959
	
l4885:	
;main.c: 957: {
;main.c: 959: PA3 = 1;
	bsf	(43/8),(43)&7
	goto	l4857
	line	973
	
l4893:	
;main.c: 972: {
;main.c: 973: if(ucTimerDelay >= 5)
	movlw	(05h)
	subwf	(main@ucTimerDelay),w
	skipc
	goto	u2221
	goto	u2220
u2221:
	goto	l4861
u2220:
	line	976
	
l4895:	
;main.c: 974: {
;main.c: 976: PB0 = 0;
	bcf	(48/8),(48)&7
	line	977
;main.c: 977: PA0 = 0;
	bcf	(40/8),(40)&7
	line	978
;main.c: 978: PA1 = 0;
	bcf	(41/8),(41)&7
	line	979
;main.c: 979: PA2 = 0;
	bcf	(42/8),(42)&7
	line	980
;main.c: 980: PA3 = 0;
	bcf	(43/8),(43)&7
	goto	l4857
	line	998
	
l4903:	
;main.c: 997: {
;main.c: 998: if(ucTimerDelay >= 1)
	movf	(main@ucTimerDelay),w
	skipz
	goto	u2230
	goto	l4861
u2230:
	line	1000
	
l4905:	
;main.c: 999: {
;main.c: 1000: ucTimerDelay = 0;
	clrf	(main@ucTimerDelay)
	line	1002
;main.c: 1002: ucLoaderStep = 0;
	clrf	(main@ucLoaderStep)
	line	1003
	
l4907:	
;main.c: 1003: ucADC4_Step = ADC4_STEP_THIRD;
	movlw	(03h)
	movwf	(main@ucADC4_Step)
	line	1004
;main.c: 1004: }
	goto	l4693
	line	887
	
l4913:	
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
goto l762
movlw high(S5657)
movwf pclath
	clrc
	rlf fsr,w
	addlw low(S5657)
	movwf pc
psect	swtext1,local,class=CONST,delta=2
global __pswtext1
__pswtext1:
S5657:
	ljmp	l843
	ljmp	l4853
	ljmp	l4863
	ljmp	l4873
	ljmp	l4883
	ljmp	l4893
	ljmp	l4903
psect	maintext

	line	1024
;main.c: 1023: {
;main.c: 1024: case 0:
	
l871:	
	line	1027
;main.c: 1025: {
;main.c: 1027: PB0 = 1;
	bsf	(48/8),(48)&7
	line	1031
	
l4915:	
;main.c: 1031: ucLoaderStep1++;
	incf	(main@ucLoaderStep1),f
	line	1032
;main.c: 1032: break;
	goto	l4693
	line	1037
	
l4917:	
;main.c: 1036: {
;main.c: 1037: if(ucTimerDelay1 >= 5)
	movlw	(05h)
	subwf	(main@ucTimerDelay1),w
	skipc
	goto	u2241
	goto	u2240
u2241:
	goto	l4925
u2240:
	line	1040
	
l4919:	
;main.c: 1038: {
;main.c: 1040: PA0 = 1;
	bsf	(40/8),(40)&7
	line	1044
	
l4921:	
;main.c: 1044: ucTimerDelay1 = 0;
	clrf	(main@ucTimerDelay1)
	goto	l4915
	line	1048
	
l4925:	
;main.c: 1047: else
;main.c: 1048: ucTimerDelay1++;
	incf	(main@ucTimerDelay1),f
	goto	l4693
	line	1054
	
l4927:	
;main.c: 1053: {
;main.c: 1054: if(ucTimerDelay1 >= 5)
	movlw	(05h)
	subwf	(main@ucTimerDelay1),w
	skipc
	goto	u2251
	goto	u2250
u2251:
	goto	l4925
u2250:
	line	1057
	
l4929:	
;main.c: 1055: {
;main.c: 1057: PA1= 1;
	bsf	(41/8),(41)&7
	goto	l4921
	line	1071
	
l4937:	
;main.c: 1070: {
;main.c: 1071: if(ucTimerDelay1 >= 5)
	movlw	(05h)
	subwf	(main@ucTimerDelay1),w
	skipc
	goto	u2261
	goto	u2260
u2261:
	goto	l4925
u2260:
	line	1074
	
l4939:	
;main.c: 1072: {
;main.c: 1074: setPA2(1);
	movlw	(01h)
	fcall	_setPA2
	goto	l4921
	line	1085
	
l4947:	
;main.c: 1084: {
;main.c: 1085: if(ucTimerDelay1 >= 5)
	movlw	(05h)
	subwf	(main@ucTimerDelay1),w
	skipc
	goto	u2271
	goto	u2270
u2271:
	goto	l4925
u2270:
	line	1088
	
l4949:	
;main.c: 1086: {
;main.c: 1088: setPA3(1);
	movlw	(01h)
	fcall	_setPA3
	goto	l4921
	line	1099
	
l4957:	
;main.c: 1098: {
;main.c: 1099: if(ucTimerDelay1 >= 5)
	movlw	(05h)
	subwf	(main@ucTimerDelay1),w
	skipc
	goto	u2281
	goto	u2280
u2281:
	goto	l4925
u2280:
	line	1102
	
l4959:	
;main.c: 1100: {
;main.c: 1102: setPA0(0);
	movlw	(0)
	fcall	_setPA0
	line	1104
;main.c: 1104: setPA1(0);
	movlw	(0)
	fcall	_setPA1
	line	1106
;main.c: 1106: setPA2(0);
	movlw	(0)
	fcall	_setPA2
	line	1108
;main.c: 1108: setPA3(0);
	movlw	(0)
	fcall	_setPA3
	goto	l4921
	line	1119
	
l4967:	
;main.c: 1118: {
;main.c: 1119: if(ucTimerDelay1 >= 1)
	movf	(main@ucTimerDelay1),w
	skipz
	goto	u2290
	goto	l4925
u2290:
	line	1121
	
l4969:	
;main.c: 1120: {
;main.c: 1121: ucTimerDelay1 = 0;
	clrf	(main@ucTimerDelay1)
	line	1123
;main.c: 1123: ucLoaderStep1 = 0;
	clrf	(main@ucLoaderStep1)
	goto	l4907
	line	1022
	
l4977:	
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
goto l762
movlw high(S5659)
movwf pclath
	clrc
	rlf fsr,w
	addlw low(S5659)
	movwf pc
psect	swtext2,local,class=CONST,delta=2
global __pswtext2
__pswtext2:
S5659:
	ljmp	l871
	ljmp	l4917
	ljmp	l4927
	ljmp	l4937
	ljmp	l4947
	ljmp	l4957
	ljmp	l4967
psect	maintext

	line	1149
	
l4979:	
;main.c: 1147: {
;main.c: 1149: setPB0(1);
	movlw	(01h)
	fcall	_setPB0
	line	1151
;main.c: 1151: setPA0(1);
	movlw	(01h)
	fcall	_setPA0
	line	1152
	
l4981:	
;main.c: 1152: ucLoaderStep2++;
	incf	(main@ucLoaderStep2),f
	line	1153
;main.c: 1153: break;
	goto	l4693
	line	1158
	
l4983:	
;main.c: 1157: {
;main.c: 1158: if(ucTimerDelay2 >= 5)
	movlw	(05h)
	subwf	(main@ucTimerDelay2),w
	skipc
	goto	u2301
	goto	u2300
u2301:
	goto	l4991
u2300:
	line	1161
	
l4985:	
;main.c: 1159: {
;main.c: 1161: setPA1(1);
	movlw	(01h)
	fcall	_setPA1
	line	1162
	
l4987:	
;main.c: 1162: ucTimerDelay2 = 0;
	clrf	(main@ucTimerDelay2)
	goto	l4981
	line	1166
	
l4991:	
;main.c: 1165: else
;main.c: 1166: ucTimerDelay2++;
	incf	(main@ucTimerDelay2),f
	goto	l4693
	line	1172
	
l4993:	
;main.c: 1171: {
;main.c: 1172: if(ucTimerDelay2 >= 5)
	movlw	(05h)
	subwf	(main@ucTimerDelay2),w
	skipc
	goto	u2311
	goto	u2310
u2311:
	goto	l4991
u2310:
	line	1175
	
l4995:	
;main.c: 1173: {
;main.c: 1175: setPA2(1);
	movlw	(01h)
	fcall	_setPA2
	goto	l4987
	line	1186
	
l5003:	
;main.c: 1185: {
;main.c: 1186: if(ucTimerDelay2 >= 5)
	movlw	(05h)
	subwf	(main@ucTimerDelay2),w
	skipc
	goto	u2321
	goto	u2320
u2321:
	goto	l4991
u2320:
	line	1189
	
l5005:	
;main.c: 1187: {
;main.c: 1189: setPA3(1);
	movlw	(01h)
	fcall	_setPA3
	goto	l4987
	line	1200
	
l5013:	
;main.c: 1199: {
;main.c: 1200: if(ucTimerDelay2 >= 5)
	movlw	(05h)
	subwf	(main@ucTimerDelay2),w
	skipc
	goto	u2331
	goto	u2330
u2331:
	goto	l4991
u2330:
	line	1204
	
l5015:	
;main.c: 1201: {
;main.c: 1204: setPA1(0);
	movlw	(0)
	fcall	_setPA1
	line	1206
;main.c: 1206: setPA2(0);
	movlw	(0)
	fcall	_setPA2
	line	1208
;main.c: 1208: setPA3(0);
	movlw	(0)
	fcall	_setPA3
	goto	l4987
	line	1219
	
l5023:	
;main.c: 1218: {
;main.c: 1219: if(ucTimerDelay2 >= 1)
	movf	(main@ucTimerDelay2),w
	skipz
	goto	u2340
	goto	l4991
u2340:
	line	1221
	
l5025:	
;main.c: 1220: {
;main.c: 1221: ucTimerDelay2 = 0;
	clrf	(main@ucTimerDelay2)
	line	1223
;main.c: 1223: ucLoaderStep2 = 0;
	clrf	(main@ucLoaderStep2)
	goto	l4907
	line	1144
	
l5033:	
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
goto l762
movlw high(S5661)
movwf pclath
	clrc
	rlf fsr,w
	addlw low(S5661)
	movwf pc
psect	swtext3,local,class=CONST,delta=2
global __pswtext3
__pswtext3:
S5661:
	ljmp	l4979
	ljmp	l4983
	ljmp	l4993
	ljmp	l5003
	ljmp	l5013
	ljmp	l5023
psect	maintext

	line	1249
	
l5035:	
;main.c: 1247: {
;main.c: 1249: setPB0(1);
	movlw	(01h)
	fcall	_setPB0
	line	1251
;main.c: 1251: setPA0(1);
	movlw	(01h)
	fcall	_setPA0
	line	1253
;main.c: 1253: setPA1(1);
	movlw	(01h)
	fcall	_setPA1
	line	1254
	
l5037:	
;main.c: 1254: ucLoaderStep3++;
	incf	(main@ucLoaderStep3),f
	line	1255
;main.c: 1255: break;
	goto	l4693
	line	1260
	
l5039:	
;main.c: 1259: {
;main.c: 1260: if(ucTimerDelay3 >= 5)
	movlw	(05h)
	subwf	(main@ucTimerDelay3),w
	skipc
	goto	u2351
	goto	u2350
u2351:
	goto	l5047
u2350:
	line	1263
	
l5041:	
;main.c: 1261: {
;main.c: 1263: setPA2(1);
	movlw	(01h)
	fcall	_setPA2
	line	1264
	
l5043:	
;main.c: 1264: ucTimerDelay3 = 0;
	clrf	(main@ucTimerDelay3)
	goto	l5037
	line	1268
	
l5047:	
;main.c: 1267: else
;main.c: 1268: ucTimerDelay3++;
	incf	(main@ucTimerDelay3),f
	goto	l4693
	line	1274
	
l5049:	
;main.c: 1273: {
;main.c: 1274: if(ucTimerDelay3 >= 5)
	movlw	(05h)
	subwf	(main@ucTimerDelay3),w
	skipc
	goto	u2361
	goto	u2360
u2361:
	goto	l5047
u2360:
	line	1277
	
l5051:	
;main.c: 1275: {
;main.c: 1277: setPA3(1);
	movlw	(01h)
	fcall	_setPA3
	goto	l5043
	line	1289
	
l5059:	
;main.c: 1288: {
;main.c: 1289: if(ucTimerDelay3 >= 5)
	movlw	(05h)
	subwf	(main@ucTimerDelay3),w
	skipc
	goto	u2371
	goto	u2370
u2371:
	goto	l5047
u2370:
	line	1293
	
l5061:	
;main.c: 1290: {
;main.c: 1293: setPA2(0);
	movlw	(0)
	fcall	_setPA2
	line	1295
;main.c: 1295: setPA3(0);
	movlw	(0)
	fcall	_setPA3
	goto	l5043
	line	1306
	
l5069:	
;main.c: 1305: {
;main.c: 1306: if(ucTimerDelay3 >= 1)
	movf	(main@ucTimerDelay3),w
	skipz
	goto	u2380
	goto	l5047
u2380:
	line	1308
	
l5071:	
;main.c: 1307: {
;main.c: 1308: ucTimerDelay3 = 0;
	clrf	(main@ucTimerDelay3)
	line	1310
;main.c: 1310: ucLoaderStep3 = 0;
	clrf	(main@ucLoaderStep3)
	goto	l4907
	line	1244
	
l5079:	
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
	goto	l5035
	xorlw	1^0	; case 1
	skipnz
	goto	l5039
	xorlw	2^1	; case 2
	skipnz
	goto	l5049
	xorlw	3^2	; case 3
	skipnz
	goto	l5059
	xorlw	4^3	; case 4
	skipnz
	goto	l5069
	goto	l762
	opt asmopt_on

	line	1336
	
l5081:	
;main.c: 1334: {
;main.c: 1336: setPB0(1);
	movlw	(01h)
	fcall	_setPB0
	line	1338
;main.c: 1338: setPA0(1);
	movlw	(01h)
	fcall	_setPA0
	line	1340
;main.c: 1340: setPA1(1);
	movlw	(01h)
	fcall	_setPA1
	line	1342
;main.c: 1342: setPA2(1);
	movlw	(01h)
	fcall	_setPA2
	line	1343
	
l5083:	
;main.c: 1343: ucLoaderStep4++;
	incf	(main@ucLoaderStep4),f
	line	1344
;main.c: 1344: break;
	goto	l4693
	line	1349
	
l5085:	
;main.c: 1348: {
;main.c: 1349: if(ucTimerDelay4 >= 5)
	movlw	(05h)
	subwf	(main@ucTimerDelay4),w
	skipc
	goto	u2391
	goto	u2390
u2391:
	goto	l5093
u2390:
	line	1352
	
l5087:	
;main.c: 1350: {
;main.c: 1352: setPA3(1);
	movlw	(01h)
	fcall	_setPA3
	line	1353
	
l5089:	
;main.c: 1353: ucTimerDelay4 = 0;
	clrf	(main@ucTimerDelay4)
	goto	l5083
	line	1357
	
l5093:	
;main.c: 1356: else
;main.c: 1357: ucTimerDelay4++;
	incf	(main@ucTimerDelay4),f
	goto	l4693
	line	1363
	
l5095:	
;main.c: 1362: {
;main.c: 1363: if(ucTimerDelay4 >= 5)
	movlw	(05h)
	subwf	(main@ucTimerDelay4),w
	skipc
	goto	u2401
	goto	u2400
u2401:
	goto	l5093
u2400:
	line	1366
	
l5097:	
;main.c: 1364: {
;main.c: 1366: setPA3(0);
	movlw	(0)
	fcall	_setPA3
	goto	l5089
	line	1377
	
l5105:	
;main.c: 1376: {
;main.c: 1377: if(ucTimerDelay4 >= 1)
	movf	(main@ucTimerDelay4),w
	skipz
	goto	u2410
	goto	l5093
u2410:
	line	1379
	
l5107:	
;main.c: 1378: {
;main.c: 1379: ucTimerDelay4 = 0;
	clrf	(main@ucTimerDelay4)
	line	1381
;main.c: 1381: ucLoaderStep4 = 0;
	clrf	(main@ucLoaderStep4)
	goto	l4907
	line	1331
	
l5115:	
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
	goto	l5081
	xorlw	1^0	; case 1
	skipnz
	goto	l5085
	xorlw	2^1	; case 2
	skipnz
	goto	l5095
	xorlw	3^2	; case 3
	skipnz
	goto	l5105
	goto	l762
	opt asmopt_on

	line	879
	
l5119:	
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
	goto	l4913
	xorlw	1^0	; case 1
	skipnz
	goto	l4977
	xorlw	2^1	; case 2
	skipnz
	goto	l5033
	xorlw	3^2	; case 3
	skipnz
	goto	l5079
	xorlw	4^3	; case 4
	skipnz
	goto	l5115
	goto	l762
	opt asmopt_on

	line	1413
	
l5121:	
;main.c: 1405: {
;main.c: 1409: static unsigned char ucTimerDelayP2sLess = 0;
;main.c: 1411: static unsigned char ucTimerDelayP2sMore = 0;
;main.c: 1413: if( getAdOriginalCh1Value() <= 220 )
	fcall	_getAdOriginalCh1Value
	movlw	high(0DDh)
	subwf	(1+(?_getAdOriginalCh1Value)),w
	movlw	low(0DDh)
	skipnz
	subwf	(0+(?_getAdOriginalCh1Value)),w
	skipnc
	goto	u2421
	goto	u2420
u2421:
	goto	l5127
u2420:
	line	1415
	
l5123:	
;main.c: 1414: {
;main.c: 1415: ucTimerDelayP2sLess++;
	incf	(main@ucTimerDelayP2sLess),f
	line	1416
	
l5125:	
;main.c: 1416: ucTimerDelayP2sMore = 0;
	clrf	(main@ucTimerDelayP2sMore)
	line	1417
;main.c: 1417: }
	goto	l5131
	line	1420
	
l5127:	
;main.c: 1418: else
;main.c: 1419: {
;main.c: 1420: ucTimerDelayP2sMore++;
	incf	(main@ucTimerDelayP2sMore),f
	line	1421
	
l5129:	
;main.c: 1421: ucTimerDelayP2sLess = 0;
	clrf	(main@ucTimerDelayP2sLess)
	line	1424
	
l5131:	
;main.c: 1422: }
;main.c: 1424: if( ucTimerDelayP2sLess >= 2)
	movlw	(02h)
	subwf	(main@ucTimerDelayP2sLess),w
	skipc
	goto	u2431
	goto	u2430
u2431:
	goto	l5139
u2430:
	line	1426
	
l5133:	
;main.c: 1425: {
;main.c: 1426: ucTimerDelayP2sLess = 0;
	clrf	(main@ucTimerDelayP2sLess)
	line	1427
;main.c: 1427: ucTimerDelayP2sMore = 0;
	clrf	(main@ucTimerDelayP2sMore)
	line	1429
	
l5135:	
;main.c: 1429: startTwentySecondsTimer();
	fcall	_startTwentySecondsTimer
	line	1431
	
l5137:	
;main.c: 1431: ucADC4_Step = ADC4_STEP_FOURTH_PREFIX1;
	movlw	(04h)
	bcf	status, 5	;RP0=0, select bank0
	movwf	(main@ucADC4_Step)
	line	1434
	
l5139:	
;main.c: 1432: }
;main.c: 1434: if(ucTimerDelayP2sMore >= 2)
	movlw	(02h)
	subwf	(main@ucTimerDelayP2sMore),w
	skipc
	goto	u2441
	goto	u2440
u2441:
	goto	l762
u2440:
	line	1436
	
l5141:	
;main.c: 1435: {
;main.c: 1436: ucTimerDelayP2sMore = 0;
	clrf	(main@ucTimerDelayP2sMore)
	line	1437
;main.c: 1437: ucTimerDelayP2sLess = 0;
	clrf	(main@ucTimerDelayP2sLess)
	line	1438
	
l5143:	
;main.c: 1438: ucADC4_Step = ADC4_STEP_FOURTH_PREFIX2;
	movlw	(05h)
	bcf	status, 5	;RP0=0, select bank0
	movwf	(main@ucADC4_Step)
	goto	l4693
	line	1450
	
l5145:	
;main.c: 1446: {
;main.c: 1450: if( !isFinishedTwentySecondsTimer() )
	fcall	_isFinishedTwentySecondsTimer
	iorlw	0
	skipz
	goto	u2451
	goto	u2450
u2451:
	goto	l5149
u2450:
	goto	l5143
	line	1453
	
l5149:	
;main.c: 1452: else
;main.c: 1453: ucADC4_Step = ADC4_STEP_FOURTH_PREFIX3;
	movlw	(06h)
	bcf	status, 5	;RP0=0, select bank0
	movwf	(main@ucADC4_Step)
	goto	l4693
	line	1468
	
l5151:	
;main.c: 1460: {
;main.c: 1464: static unsigned char ucTimerForDACR0_CNT1 = 0, ucTimerForDACR0_CNT2 = 0;
;main.c: 1466: static unsigned char ucTimerForDACR0_CNT1_f = 0, ucTimerForDACR0_CNT2_f = 0;
;main.c: 1468: if((getAdOriginalCh14Value() > 2800))
	fcall	_getAdOriginalCh14Value
	movlw	high(0AF1h)
	subwf	(1+(?_getAdOriginalCh14Value)),w
	movlw	low(0AF1h)
	skipnz
	subwf	(0+(?_getAdOriginalCh14Value)),w
	skipc
	goto	u2461
	goto	u2460
u2461:
	goto	l5157
u2460:
	line	1470
	
l5153:	
;main.c: 1469: {
;main.c: 1470: ucTimerForDACR0_CNT1++;
	incf	(main@ucTimerForDACR0_CNT1),f
	line	1471
	
l5155:	
;main.c: 1471: ucTimerForDACR0_CNT2 = 0;
	clrf	(main@ucTimerForDACR0_CNT2)
	line	1472
;main.c: 1472: }
	goto	l5161
	line	1475
	
l5157:	
;main.c: 1473: else
;main.c: 1474: {
;main.c: 1475: ucTimerForDACR0_CNT2++;
	incf	(main@ucTimerForDACR0_CNT2),f
	line	1476
	
l5159:	
;main.c: 1476: ucTimerForDACR0_CNT1 = 0;
	clrf	(main@ucTimerForDACR0_CNT1)
	line	1479
	
l5161:	
;main.c: 1477: }
;main.c: 1479: if(ucTimerForDACR0_CNT1 >= 2)
	movlw	(02h)
	subwf	(main@ucTimerForDACR0_CNT1),w
	skipc
	goto	u2471
	goto	u2470
u2471:
	goto	l5165
u2470:
	line	1480
	
l5163:	
;main.c: 1480: ucTimerForDACR0_CNT1_f = 1;
	clrf	(main@ucTimerForDACR0_CNT1_f)
	incf	(main@ucTimerForDACR0_CNT1_f),f
	line	1482
	
l5165:	
;main.c: 1482: if(ucTimerForDACR0_CNT2 >= 2)
	movlw	(02h)
	subwf	(main@ucTimerForDACR0_CNT2),w
	skipc
	goto	u2481
	goto	u2480
u2481:
	goto	l5169
u2480:
	line	1483
	
l5167:	
;main.c: 1483: ucTimerForDACR0_CNT2_f = 1;
	clrf	(main@ucTimerForDACR0_CNT2_f)
	incf	(main@ucTimerForDACR0_CNT2_f),f
	line	1485
	
l5169:	
;main.c: 1485: if(ucTimerForDACR0_CNT1_f)
	movf	(main@ucTimerForDACR0_CNT1_f),w
	skipz
	goto	u2490
	goto	l5173
u2490:
	line	1488
	
l5171:	
;main.c: 1486: {
;main.c: 1488: DACR0=0x0F;
	movlw	(0Fh)
	bsf	status, 5	;RP0=1, select bank1
	movwf	(136)^080h	;volatile
	line	1492
;main.c: 1492: ucADC4_Step = ADC4_STEP_FOURTH;
	movlw	(0Ah)
	bcf	status, 5	;RP0=0, select bank0
	movwf	(main@ucADC4_Step)
	line	1493
;main.c: 1493: }
	goto	l5177
	line	1494
	
l5173:	
;main.c: 1494: else if(ucTimerForDACR0_CNT2_f)
	movf	(main@ucTimerForDACR0_CNT2_f),w
	skipz
	goto	u2500
	goto	l5177
u2500:
	line	1497
	
l5175:	
;main.c: 1495: {
;main.c: 1497: DACR0=0x09;
	movlw	(09h)
	bsf	status, 5	;RP0=1, select bank1
	movwf	(136)^080h	;volatile
	line	1501
;main.c: 1501: ucADC4_Step = ADC4_STEP_FOURTH;
	movlw	(0Ah)
	bcf	status, 5	;RP0=0, select bank0
	movwf	(main@ucADC4_Step)
	line	1508
;main.c: 1502: }
	
l5177:	
;main.c: 1506: }
;main.c: 1508: if(ADC4_STEP_FOURTH == ucADC4_Step)
	movf	(main@ucADC4_Step),w
	xorlw	0Ah
	skipz
	goto	u2511
	goto	u2510
u2511:
	goto	l762
u2510:
	line	1510
	
l5179:	
;main.c: 1509: {
;main.c: 1510: ucTimerForDACR0_CNT1 = 0;
	clrf	(main@ucTimerForDACR0_CNT1)
	line	1511
;main.c: 1511: ucTimerForDACR0_CNT2 = 0;
	clrf	(main@ucTimerForDACR0_CNT2)
	line	1512
;main.c: 1512: ucTimerForDACR0_CNT1_f = 0;
	clrf	(main@ucTimerForDACR0_CNT1_f)
	line	1513
;main.c: 1513: ucTimerForDACR0_CNT2_f = 0;
	clrf	(main@ucTimerForDACR0_CNT2_f)
	goto	l4693
	line	1525
	
l5181:	
;main.c: 1521: {
;main.c: 1525: clearTwentySecondsTimer();
	fcall	_clearTwentySecondsTimer
	line	1527
	
l5183:	
;main.c: 1527: setPA6(0);
	movlw	(0)
	fcall	_setPA6
	line	1529
	
l5185:	
;main.c: 1529: PBOD6 = 0;
	bsf	status, 5	;RP0=1, select bank3
	bsf	status, 6	;RP1=1, select bank3
	bcf	(3142/8)^0180h,(3142)&7
	line	1530
	
l5187:	
;main.c: 1530: PB6 = 1;
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	bsf	(54/8),(54)&7
	line	1535
;main.c: 1535: ucADC4_Step = ADC4_STEP_FOURTH_PREFIX4;
	movlw	(07h)
	movwf	(main@ucADC4_Step)
	line	1536
;main.c: 1536: break;
	goto	l4693
	line	1549
	
l5189:	
;main.c: 1542: {
;main.c: 1547: static unsigned char ucDelayPrefix4TimerP5s;
;main.c: 1549: ucDelayPrefix4TimerP5s++;
	incf	(main@ucDelayPrefix4TimerP5s),f
	line	1551
	
l5191:	
;main.c: 1551: if( ucDelayPrefix4TimerP5s >= 5)
	movlw	(05h)
	subwf	(main@ucDelayPrefix4TimerP5s),w
	skipc
	goto	u2521
	goto	u2520
u2521:
	goto	l762
u2520:
	line	1553
	
l5193:	
;main.c: 1552: {
;main.c: 1553: ucDelayPrefix4TimerP5s = 0;
	clrf	(main@ucDelayPrefix4TimerP5s)
	line	1555
	
l5195:	
;main.c: 1555: ucADC4_Step = ADC4_STEP_FOURTH_PREFIX5;
	movlw	(08h)
	movwf	(main@ucADC4_Step)
	goto	l4693
	line	1560
;main.c: 1558: }
;main.c: 1560: case ADC4_STEP_FOURTH_PREFIX5:
	
l991:	
	line	1567
;main.c: 1561: {
;main.c: 1567: PBOD6 = 1;
	bsf	status, 5	;RP0=1, select bank3
	bsf	status, 6	;RP1=1, select bank3
	bsf	(3142/8)^0180h,(3142)&7
	line	1568
;main.c: 1568: PB6 = 1;
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	bsf	(54/8),(54)&7
	line	1573
	
l5197:	
;main.c: 1573: ucADC4_Step = ADC4_STEP_FOURTH_PREFIX6;
	movlw	(09h)
	movwf	(main@ucADC4_Step)
	line	1575
;main.c: 1575: break;
	goto	l4693
	line	1583
	
l5199:	
;main.c: 1580: {
;main.c: 1581: static unsigned char ucDelayPrefix6TimerP2s;
;main.c: 1583: ucDelayPrefix6TimerP2s++;
	bsf	status, 5	;RP0=1, select bank1
	incf	(main@ucDelayPrefix6TimerP2s)^080h,f
	line	1585
	
l5201:	
;main.c: 1585: if( ucDelayPrefix6TimerP2s >= 2)
	movlw	(02h)
	subwf	(main@ucDelayPrefix6TimerP2s)^080h,w
	skipc
	goto	u2531
	goto	u2530
u2531:
	goto	l762
u2530:
	line	1587
	
l5203:	
;main.c: 1586: {
;main.c: 1587: ucDelayPrefix6TimerP2s = 0;
	clrf	(main@ucDelayPrefix6TimerP2s)^080h
	line	1589
;main.c: 1589: ucADC4_Step = ADC4_STEP_INIT;
	bcf	status, 5	;RP0=0, select bank0
	clrf	(main@ucADC4_Step)
	line	1591
	
l5205:	
;main.c: 1591: enumMainLoopStep = MAIN_LOOP_STEP_FIRST;
	clrf	(main@enumMainLoopStep)
	incf	(main@enumMainLoopStep),f
	goto	l4693
	line	1606
	
l5207:	
;main.c: 1598: {
;main.c: 1602: static unsigned char ucCheckTimerP2sLess = 0;
;main.c: 1604: static unsigned char ucCheckTimerP2sMore = 0;
;main.c: 1606: if( getAdOriginalCh1Value() < 85)
	fcall	_getAdOriginalCh1Value
	movlw	high(055h)
	subwf	(1+(?_getAdOriginalCh1Value)),w
	movlw	low(055h)
	skipnz
	subwf	(0+(?_getAdOriginalCh1Value)),w
	skipnc
	goto	u2541
	goto	u2540
u2541:
	goto	l5213
u2540:
	line	1608
	
l5209:	
;main.c: 1607: {
;main.c: 1608: ucCheckTimerP2sLess++;
	bsf	status, 5	;RP0=1, select bank1
	incf	(main@ucCheckTimerP2sLess)^080h,f
	line	1609
	
l5211:	
;main.c: 1609: ucCheckTimerP2sMore = 0;
	clrf	(main@ucCheckTimerP2sMore)^080h
	line	1610
;main.c: 1610: }
	goto	l5217
	line	1613
	
l5213:	
;main.c: 1611: else
;main.c: 1612: {
;main.c: 1613: ucCheckTimerP2sMore++;
	bsf	status, 5	;RP0=1, select bank1
	incf	(main@ucCheckTimerP2sMore)^080h,f
	line	1614
	
l5215:	
;main.c: 1614: ucCheckTimerP2sLess = 0;
	clrf	(main@ucCheckTimerP2sLess)^080h
	line	1617
	
l5217:	
;main.c: 1615: }
;main.c: 1617: if( ucCheckTimerP2sMore > 2)
	movlw	(03h)
	subwf	(main@ucCheckTimerP2sMore)^080h,w
	skipc
	goto	u2551
	goto	u2550
u2551:
	goto	l5223
u2550:
	line	1619
	
l5219:	
;main.c: 1618: {
;main.c: 1619: ucCheckTimerP2sMore = 0;
	clrf	(main@ucCheckTimerP2sMore)^080h
	line	1620
;main.c: 1620: ucCheckTimerP2sLess = 0;
	clrf	(main@ucCheckTimerP2sLess)^080h
	line	1622
;main.c: 1622: ucADC4_Step = ADC4_STEP_INIT;
	bcf	status, 5	;RP0=0, select bank0
	clrf	(main@ucADC4_Step)
	line	1624
	
l5221:	
;main.c: 1624: enumMainLoopStep = MAIN_LOOP_STEP_THIRD;
	movlw	(03h)
	movwf	(main@enumMainLoopStep)
	line	1627
	
l5223:	
;main.c: 1625: }
;main.c: 1627: if( ucCheckTimerP2sLess > 2)
	movlw	(03h)
	bsf	status, 5	;RP0=1, select bank1
	subwf	(main@ucCheckTimerP2sLess)^080h,w
	skipc
	goto	u2561
	goto	u2560
u2561:
	goto	l762
u2560:
	line	1629
	
l5225:	
;main.c: 1628: {
;main.c: 1629: ucCheckTimerP2sMore = 0;
	clrf	(main@ucCheckTimerP2sMore)^080h
	line	1630
;main.c: 1630: ucCheckTimerP2sLess = 0;
	clrf	(main@ucCheckTimerP2sLess)^080h
	line	1632
	
l5227:	
;main.c: 1632: ucADC4_Step = ADC4_STEP_FOURTH_SUFFIX1;
	movlw	(0Bh)
	bcf	status, 5	;RP0=0, select bank0
	movwf	(main@ucADC4_Step)
	goto	l4693
	line	1647
	
l5229:	
;main.c: 1641: {
;main.c: 1645: static unsigned char ucFourthSuffix1TimerP3s = 0;
;main.c: 1647: ucFourthSuffix1TimerP3s++;
	bsf	status, 5	;RP0=1, select bank1
	incf	(main@ucFourthSuffix1TimerP3s)^080h,f
	line	1649
	
l5231:	
;main.c: 1649: if( ucFourthSuffix1TimerP3s > 3)
	movlw	(04h)
	subwf	(main@ucFourthSuffix1TimerP3s)^080h,w
	skipc
	goto	u2571
	goto	u2570
u2571:
	goto	l762
u2570:
	line	1651
	
l5233:	
;main.c: 1650: {
;main.c: 1651: ucFourthSuffix1TimerP3s = 0;
	clrf	(main@ucFourthSuffix1TimerP3s)^080h
	line	1652
	
l5235:	
;main.c: 1652: ucADC4_Step = ADC4_STEP_FOURTH_SUFFIX2;
	movlw	(0Ch)
	bcf	status, 5	;RP0=0, select bank0
	movwf	(main@ucADC4_Step)
	goto	l4693
	line	1664
	
l5237:	
;main.c: 1659: {
;main.c: 1664: setPA6(0);
	movlw	(0)
	fcall	_setPA6
	line	1666
	
l5239:	
;main.c: 1666: clearPinPortAndTimer();
	fcall	_clearPinPortAndTimer
	line	1667
	
l5241:	
;main.c: 1667: ucADC4_Step = ADC4_STEP_INIT;
	clrf	(main@ucADC4_Step)
	goto	l5205
	line	792
	
l5247:	
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
goto l762
movlw high(S5663)
movwf pclath
	clrc
	rlf fsr,w
	addlw low(S5663)
	movwf pc
psect	swtext4,local,class=CONST,delta=2
global __pswtext4
__pswtext4:
S5663:
	ljmp	l804
	ljmp	l4801
	ljmp	l5119
	ljmp	l5121
	ljmp	l5145
	ljmp	l5151
	ljmp	l5181
	ljmp	l5189
	ljmp	l991
	ljmp	l5199
	ljmp	l5207
	ljmp	l5229
	ljmp	l5237
psect	maintext

	line	1697
;main.c: 1696: {
;main.c: 1697: case HOUR_3_BRANCH_STEP_FIRST:
	
l1015:	
	line	1700
;main.c: 1698: {
;main.c: 1700: PB7 = 1;
	bcf	status, 5	;RP0=0, select bank0
	bsf	(55/8),(55)&7
	line	1701
;main.c: 1701: PBOD7 = 1;
	bsf	status, 5	;RP0=1, select bank3
	bsf	status, 6	;RP1=1, select bank3
	bsf	(3143/8)^0180h,(3143)&7
	line	1706
	
l5249:	
;main.c: 1706: startThreeHoursTimer(10800);
	movlw	low(02A30h)
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	movwf	(?_startThreeHoursTimer)
	movlw	high(02A30h)
	movwf	((?_startThreeHoursTimer))+1
	fcall	_startThreeHoursTimer
	line	1709
;main.c: 1709: setPB0(1);
	movlw	(01h)
	fcall	_setPB0
	line	1711
;main.c: 1711: setPA0(1);
	movlw	(01h)
	fcall	_setPA0
	line	1713
;main.c: 1713: setPA1(1);
	movlw	(01h)
	fcall	_setPA1
	line	1715
;main.c: 1715: setPA2(1);
	movlw	(01h)
	fcall	_setPA2
	line	1717
;main.c: 1717: setPA3(1);
	movlw	(01h)
	fcall	_setPA3
	line	1719
	
l5251:	
;main.c: 1719: enumBranchStep = HOUR_3_BRANCH_STEP_SECOND;
	bsf	status, 5	;RP0=1, select bank1
	clrf	(main@enumBranchStep)^080h
	incf	(main@enumBranchStep)^080h,f
	line	1720
;main.c: 1720: break;
	goto	l4693
	line	1730
	
l5253:	
;main.c: 1724: {
;main.c: 1728: static unsigned char ucTimer20s = 0;
;main.c: 1730: if(ucTimer20s < 200)
	movlw	(0C8h)
	subwf	(main@ucTimer20s)^080h,w
	skipnc
	goto	u2581
	goto	u2580
u2581:
	goto	l5257
u2580:
	line	1732
	
l5255:	
;main.c: 1731: {
;main.c: 1732: ucTimer20s++;
	incf	(main@ucTimer20s)^080h,f
	line	1734
;main.c: 1734: }
	goto	l4693
	line	1738
	
l5257:	
;main.c: 1735: else
;main.c: 1736: {
;main.c: 1738: ucTimer20s = 0;
	clrf	(main@ucTimer20s)^080h
	line	1740
	
l5259:	
;main.c: 1740: enumBranchStep = HOUR_3_BRANCH_STEP_THIRD;
	movlw	(02h)
	movwf	(main@enumBranchStep)^080h
	line	1743
	
l5261:	
;main.c: 1743: setPA6(0);
	movlw	(0)
	fcall	_setPA6
	goto	l4693
	line	1753
	
l5263:	
;main.c: 1749: {
;main.c: 1753: if( (isFinishedTwelveHoursTimer()) || (isFinishedThreeHoursTimer()))
	fcall	_isFinishedTwelveHoursTimer
	iorlw	0
	skipz
	goto	u2591
	goto	u2590
u2591:
	goto	l5267
u2590:
	
l5265:	
	fcall	_isFinishedThreeHoursTimer
	xorlw	0
	skipnz
	goto	u2601
	goto	u2600
u2601:
	goto	l5271
u2600:
	line	1755
	
l5267:	
;main.c: 1754: {
;main.c: 1755: enumBranchStep = HOUR_3_BRANCH_STEP_FIRST;
	bsf	status, 5	;RP0=1, select bank1
	clrf	(main@enumBranchStep)^080h
	line	1756
	
l5269:	
;main.c: 1756: enumMainLoopStep = MAIN_LOOP_STEP_12_HOUR_END;
	movlw	(09h)
	bcf	status, 5	;RP0=0, select bank0
	movwf	(main@enumMainLoopStep)
	line	1757
;main.c: 1757: }
	goto	l4693
	line	1764
	
l5271:	
;main.c: 1758: else
;main.c: 1759: {
;main.c: 1760: static unsigned char ucTimerX1P5s = 0;
;main.c: 1762: static unsigned char ucTimerLessX1P5s = 0;
;main.c: 1764: if(getAdOriginalCh1Value() < 115)
	fcall	_getAdOriginalCh1Value
	movlw	high(073h)
	subwf	(1+(?_getAdOriginalCh1Value)),w
	movlw	low(073h)
	skipnz
	subwf	(0+(?_getAdOriginalCh1Value)),w
	skipnc
	goto	u2611
	goto	u2610
u2611:
	goto	l5277
u2610:
	line	1766
	
l5273:	
;main.c: 1765: {
;main.c: 1766: ucTimerX1P5s = 0;
	bsf	status, 5	;RP0=1, select bank1
	clrf	(main@ucTimerX1P5s)^080h
	line	1767
	
l5275:	
;main.c: 1767: ucTimerLessX1P5s++;
	incf	(main@ucTimerLessX1P5s)^080h,f
	line	1768
;main.c: 1768: }
	goto	l5281
	line	1771
	
l5277:	
;main.c: 1769: else
;main.c: 1770: {
;main.c: 1771: ucTimerX1P5s++;
	bsf	status, 5	;RP0=1, select bank1
	incf	(main@ucTimerX1P5s)^080h,f
	line	1772
	
l5279:	
;main.c: 1772: ucTimerLessX1P5s = 0;
	clrf	(main@ucTimerLessX1P5s)^080h
	line	1775
	
l5281:	
;main.c: 1773: }
;main.c: 1775: if(ucTimerX1P5s >= 5)
	movlw	(05h)
	subwf	(main@ucTimerX1P5s)^080h,w
	skipc
	goto	u2621
	goto	u2620
u2621:
	goto	l5295
u2620:
	line	1777
	
l5283:	
;main.c: 1776: {
;main.c: 1777: ucTimerX1P5s = 0;
	clrf	(main@ucTimerX1P5s)^080h
	line	1781
	
l5285:	
;main.c: 1781: PBOD7 = 0;
	bsf	status, 6	;RP1=1, select bank3
	bcf	(3143/8)^0180h,(3143)&7
	line	1782
	
l5287:	
;main.c: 1782: PB7 = 0;
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	bcf	(55/8),(55)&7
	line	1787
	
l5289:	
;main.c: 1787: clearThreeHoursTimer();
	fcall	_clearThreeHoursTimer
	line	1789
	
l5291:	
;main.c: 1789: enumBranchStep = HOUR_3_BRANCH_STEP_FIRST;
	bsf	status, 5	;RP0=1, select bank1
	clrf	(main@enumBranchStep)^080h
	line	1791
	
l5293:	
;main.c: 1791: enumMainLoopStep = MAIN_LOOP_STEP_SECOND;
	movlw	(02h)
	bcf	status, 5	;RP0=0, select bank0
	movwf	(main@enumMainLoopStep)
	line	1792
;main.c: 1792: }
	goto	l4693
	line	1793
	
l5295:	
;main.c: 1793: else if(ucTimerLessX1P5s >= 5)
	movlw	(05h)
	subwf	(main@ucTimerLessX1P5s)^080h,w
	skipc
	goto	u2631
	goto	u2630
u2631:
	goto	l762
u2630:
	line	1799
	
l5297:	
;main.c: 1794: {
;main.c: 1795: static unsigned char ucTimerX2P5s = 0;
;main.c: 1797: static unsigned char ucTimerLessX2P5s = 0;
;main.c: 1799: if(getAdOriginalCh14Value() >= 1950)
	fcall	_getAdOriginalCh14Value
	movlw	high(079Eh)
	subwf	(1+(?_getAdOriginalCh14Value)),w
	movlw	low(079Eh)
	skipnz
	subwf	(0+(?_getAdOriginalCh14Value)),w
	skipc
	goto	u2641
	goto	u2640
u2641:
	goto	l5303
u2640:
	line	1801
	
l5299:	
;main.c: 1800: {
;main.c: 1801: ucTimerX2P5s++;
	bsf	status, 5	;RP0=1, select bank1
	incf	(main@ucTimerX2P5s)^080h,f
	line	1802
	
l5301:	
;main.c: 1802: ucTimerLessX2P5s = 0;
	clrf	(main@ucTimerLessX2P5s)^080h
	line	1803
;main.c: 1803: }
	goto	l5307
	line	1806
	
l5303:	
;main.c: 1804: else
;main.c: 1805: {
;main.c: 1806: ucTimerX2P5s = 0;
	bsf	status, 5	;RP0=1, select bank1
	clrf	(main@ucTimerX2P5s)^080h
	line	1807
	
l5305:	
;main.c: 1807: ucTimerLessX2P5s++;
	incf	(main@ucTimerLessX2P5s)^080h,f
	line	1810
	
l5307:	
;main.c: 1808: }
;main.c: 1810: if(ucTimerX2P5s >= 5)
	movlw	(05h)
	subwf	(main@ucTimerX2P5s)^080h,w
	skipc
	goto	u2651
	goto	u2650
u2651:
	goto	l5311
u2650:
	line	1812
	
l5309:	
;main.c: 1811: {
;main.c: 1812: ucTimerX2P5s = 0;
	clrf	(main@ucTimerX2P5s)^080h
	line	1813
;main.c: 1813: }
	goto	l4693
	line	1814
	
l5311:	
;main.c: 1814: else if(ucTimerLessX2P5s >= 5)
	movlw	(05h)
	subwf	(main@ucTimerLessX2P5s)^080h,w
	skipc
	goto	u2661
	goto	u2660
u2661:
	goto	l762
u2660:
	line	1816
	
l5313:	
;main.c: 1815: {
;main.c: 1816: clearPinPortAndTimer();
	fcall	_clearPinPortAndTimer
	line	1817
	
l5315:	
;main.c: 1817: enumMainLoopStep = MAIN_LOOP_STEP_FIRST;
	clrf	(main@enumMainLoopStep)
	incf	(main@enumMainLoopStep),f
	line	1818
	
l5317:	
;main.c: 1818: enumBranchStep = HOUR_3_BRANCH_STEP_FIRST;
	bsf	status, 5	;RP0=1, select bank1
	clrf	(main@enumBranchStep)^080h
	line	1819
;main.c: 1819: }
	goto	l4693
	line	1695
	
l5321:	
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
	goto	l1015
	xorlw	1^0	; case 1
	skipnz
	goto	l5253
	xorlw	2^1	; case 2
	skipnz
	goto	l5263
	goto	l762
	opt asmopt_on

	line	1865
	
l5323:	
;main.c: 1860: {
;main.c: 1865: setPB0(0);
	movlw	(0)
	fcall	_setPB0
	line	1867
;main.c: 1867: setPB1(0);
	movlw	(0)
	fcall	_setPB1
	line	1869
;main.c: 1869: setPA0(0);
	movlw	(0)
	fcall	_setPA0
	line	1871
;main.c: 1871: setPA1(0);
	movlw	(0)
	fcall	_setPA1
	line	1873
;main.c: 1873: setPA2(0);
	movlw	(0)
	fcall	_setPA2
	line	1875
;main.c: 1875: setPA3(0);
	movlw	(0)
	fcall	_setPA3
	line	1878
	
l5325:	
;main.c: 1878: PBOD6 = 0;
	bsf	status, 5	;RP0=1, select bank3
	bsf	status, 6	;RP1=1, select bank3
	bcf	(3142/8)^0180h,(3142)&7
	line	1879
	
l5327:	
;main.c: 1879: PB6 = 1;
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	bsf	(54/8),(54)&7
	line	1885
;main.c: 1885: setPA6(0);
	movlw	(0)
	fcall	_setPA6
	line	1887
	
l5329:	
;main.c: 1887: enumInteralStep = INTERNAL_SECOND_STEP;
	bsf	status, 5	;RP0=1, select bank1
	clrf	(main@enumInteralStep)^080h
	incf	(main@enumInteralStep)^080h,f
	line	1888
;main.c: 1888: break;
	goto	l4693
	line	1898
	
l5331:	
;main.c: 1892: {
;main.c: 1896: static unsigned char ucTimer1s = 0;
;main.c: 1898: if(getAdOriginalCh14Value() <= 1000)
	fcall	_getAdOriginalCh14Value
	movlw	high(03E9h)
	subwf	(1+(?_getAdOriginalCh14Value)),w
	movlw	low(03E9h)
	skipnz
	subwf	(0+(?_getAdOriginalCh14Value)),w
	skipnc
	goto	u2671
	goto	u2670
u2671:
	goto	l5335
u2670:
	line	1900
	
l5333:	
;main.c: 1899: {
;main.c: 1900: ucTimer1s++;
	bsf	status, 5	;RP0=1, select bank1
	incf	(main@ucTimer1s)^080h,f
	line	1901
;main.c: 1901: }
	goto	l5337
	line	1903
	
l5335:	
;main.c: 1902: else
;main.c: 1903: ucTimer1s = 0;
	bsf	status, 5	;RP0=1, select bank1
	clrf	(main@ucTimer1s)^080h
	line	1905
	
l5337:	
;main.c: 1905: if(ucTimer1s >= 10)
	movlw	(0Ah)
	subwf	(main@ucTimer1s)^080h,w
	skipc
	goto	u2681
	goto	u2680
u2681:
	goto	l762
u2680:
	line	1907
	
l5339:	
;main.c: 1906: {
;main.c: 1907: enumInteralStep = INTERNAL_THIRD_STEP;
	movlw	(02h)
	movwf	(main@enumInteralStep)^080h
	line	1908
	
l5341:	
;main.c: 1908: ucTimer1s = 0;
	clrf	(main@ucTimer1s)^080h
	goto	l4693
	line	1920
	
l5343:	
;main.c: 1914: {
;main.c: 1918: static unsigned char ucTimerP3s = 0;
;main.c: 1920: if(getAdOriginalCh14Value() >= 1950)
	fcall	_getAdOriginalCh14Value
	movlw	high(079Eh)
	subwf	(1+(?_getAdOriginalCh14Value)),w
	movlw	low(079Eh)
	skipnz
	subwf	(0+(?_getAdOriginalCh14Value)),w
	skipc
	goto	u2691
	goto	u2690
u2691:
	goto	l5347
u2690:
	line	1922
	
l5345:	
;main.c: 1921: {
;main.c: 1922: ucTimerP3s++;
	bsf	status, 5	;RP0=1, select bank1
	incf	(main@ucTimerP3s)^080h,f
	line	1923
;main.c: 1923: }
	goto	l5349
	line	1925
	
l5347:	
;main.c: 1924: else
;main.c: 1925: ucTimerP3s = 0;
	bsf	status, 5	;RP0=1, select bank1
	clrf	(main@ucTimerP3s)^080h
	line	1927
	
l5349:	
;main.c: 1927: if(ucTimerP3s >= 3)
	movlw	(03h)
	subwf	(main@ucTimerP3s)^080h,w
	skipc
	goto	u2701
	goto	u2700
u2701:
	goto	l762
u2700:
	line	1929
	
l5351:	
;main.c: 1928: {
;main.c: 1929: enumInteralStep = INTERNAL_FIRST_STEP;
	clrf	(main@enumInteralStep)^080h
	line	1930
;main.c: 1930: ucTimerP3s = 0;
	clrf	(main@ucTimerP3s)^080h
	line	1932
	
l5353:	
;main.c: 1932: clearAllTimer();
	fcall	_clearAllTimer
	line	1934
	
l5355:	
;main.c: 1934: DACR0=0x0F;
	movlw	(0Fh)
	bsf	status, 5	;RP0=1, select bank1
	movwf	(136)^080h	;volatile
	line	1938
	
l5357:	
;main.c: 1938: initPin();
	fcall	_initPin
	line	1941
	
l5359:	
;main.c: 1941: enumMainLoopStep = MAIN_LOOP_STEP_INIT;
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	clrf	(main@enumMainLoopStep)
	line	1943
	
l1067:	
	goto	l1067
	line	1857
	
l5363:	
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
	goto	l5323
	xorlw	1^0	; case 1
	skipnz
	goto	l5331
	xorlw	2^1	; case 2
	skipnz
	goto	l5343
	goto	l762
	opt asmopt_on

	line	598
	
l5367:	
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
	goto	l4701
	xorlw	1^0	; case 1
	skipnz
	goto	l4727
	xorlw	2^1	; case 2
	skipnz
	goto	l4741
	xorlw	3^2	; case 3
	skipnz
	goto	l4751
	xorlw	4^3	; case 4
	skipnz
	goto	l4787
	xorlw	5^4	; case 5
	skipnz
	goto	l4793
	xorlw	8^5	; case 8
	skipnz
	goto	l5321
	xorlw	9^8	; case 9
	skipnz
	goto	l5363
	goto	l762
	opt asmopt_on

	global	start
	ljmp	start
	opt stack 0
psect	maintext
	line	1966
GLOBAL	__end_of_main
	__end_of_main:
;; =============== function _main ends ============

	signat	_main,88
	global	_clearPinPortAndTimer
psect	text879,local,class=CODE,delta=2
global __ptext879
__ptext879:

;; *************** function _clearPinPortAndTimer *****************
;; Defined at:
;;		line 104 in file "D:\develop\190625\AK7030-OTP\main.c"
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
psect	text879
	file	"D:\develop\190625\AK7030-OTP\main.c"
	line	104
	global	__size_of_clearPinPortAndTimer
	__size_of_clearPinPortAndTimer	equ	__end_of_clearPinPortAndTimer-_clearPinPortAndTimer
	
_clearPinPortAndTimer:	
	opt	stack 3
; Regs used in _clearPinPortAndTimer: [status,2+status,0+pclath+cstack]
	line	106
	
l4667:	
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
	
l4669:	
;main.c: 115: clearAllTimer();
	fcall	_clearAllTimer
	line	119
	
l688:	
	return
	opt stack 0
GLOBAL	__end_of_clearPinPortAndTimer
	__end_of_clearPinPortAndTimer:
;; =============== function _clearPinPortAndTimer ends ============

	signat	_clearPinPortAndTimer,88
	global	_getAdOriginaCh4Value
psect	text880,local,class=CODE,delta=2
global __ptext880
__ptext880:

;; *************** function _getAdOriginaCh4Value *****************
;; Defined at:
;;		line 235 in file "D:\develop\190625\AK7030-OTP\common.c"
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
psect	text880
	file	"D:\develop\190625\AK7030-OTP\common.c"
	line	235
	global	__size_of_getAdOriginaCh4Value
	__size_of_getAdOriginaCh4Value	equ	__end_of_getAdOriginaCh4Value-_getAdOriginaCh4Value
	
_getAdOriginaCh4Value:	
	opt	stack 4
; Regs used in _getAdOriginaCh4Value: [wreg-fsr0h+status,2+status,0+btemp+1+pclath+cstack]
	line	237
	
l4663:	
;common.c: 237: return Filter(uiSampleChannelFourth);
	movlw	(_uiSampleChannelFourth&0ffh)
	bcf	status, 5	;RP0=0, select bank0
	movwf	(?_Filter)
	movlw	(0x1/2)
	movwf	(?_Filter+1)
	fcall	_Filter
	movf	(1+(?_Filter)),w
	movwf	(?_getAdOriginaCh4Value+1)
	movf	(0+(?_Filter)),w
	movwf	(?_getAdOriginaCh4Value)
	line	242
	
l1801:	
	return
	opt stack 0
GLOBAL	__end_of_getAdOriginaCh4Value
	__end_of_getAdOriginaCh4Value:
;; =============== function _getAdOriginaCh4Value ends ============

	signat	_getAdOriginaCh4Value,90
	global	_getAdOriginalCh1Value
psect	text881,local,class=CODE,delta=2
global __ptext881
__ptext881:

;; *************** function _getAdOriginalCh1Value *****************
;; Defined at:
;;		line 223 in file "D:\develop\190625\AK7030-OTP\common.c"
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
psect	text881
	file	"D:\develop\190625\AK7030-OTP\common.c"
	line	223
	global	__size_of_getAdOriginalCh1Value
	__size_of_getAdOriginalCh1Value	equ	__end_of_getAdOriginalCh1Value-_getAdOriginalCh1Value
	
_getAdOriginalCh1Value:	
	opt	stack 4
; Regs used in _getAdOriginalCh1Value: [wreg-fsr0h+status,2+status,0+btemp+1+pclath+cstack]
	line	226
	
l4659:	
;common.c: 226: return Filter(uiSampleChannelFirst);
	movlw	(_uiSampleChannelFirst&0ffh)
	bcf	status, 5	;RP0=0, select bank0
	movwf	(?_Filter)
	movlw	(0x1/2)
	movwf	(?_Filter+1)
	fcall	_Filter
	movf	(1+(?_Filter)),w
	movwf	(?_getAdOriginalCh1Value+1)
	movf	(0+(?_Filter)),w
	movwf	(?_getAdOriginalCh1Value)
	line	231
	
l1798:	
	return
	opt stack 0
GLOBAL	__end_of_getAdOriginalCh1Value
	__end_of_getAdOriginalCh1Value:
;; =============== function _getAdOriginalCh1Value ends ============

	signat	_getAdOriginalCh1Value,90
	global	_getAdOriginalCh14Value
psect	text882,local,class=CODE,delta=2
global __ptext882
__ptext882:

;; *************** function _getAdOriginalCh14Value *****************
;; Defined at:
;;		line 246 in file "D:\develop\190625\AK7030-OTP\common.c"
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
psect	text882
	file	"D:\develop\190625\AK7030-OTP\common.c"
	line	246
	global	__size_of_getAdOriginalCh14Value
	__size_of_getAdOriginalCh14Value	equ	__end_of_getAdOriginalCh14Value-_getAdOriginalCh14Value
	
_getAdOriginalCh14Value:	
	opt	stack 4
; Regs used in _getAdOriginalCh14Value: [wreg-fsr0h+status,2+status,0+btemp+1+pclath+cstack]
	line	248
	
l4655:	
;common.c: 248: return Filter(uiSampleChannelFourteenth);
	movlw	(_uiSampleChannelFourteenth&0ffh)
	bcf	status, 5	;RP0=0, select bank0
	movwf	(?_Filter)
	movlw	(0x3/2)
	movwf	(?_Filter+1)
	fcall	_Filter
	movf	(1+(?_Filter)),w
	movwf	(?_getAdOriginalCh14Value+1)
	movf	(0+(?_Filter)),w
	movwf	(?_getAdOriginalCh14Value)
	line	252
	
l1804:	
	return
	opt stack 0
GLOBAL	__end_of_getAdOriginalCh14Value
	__end_of_getAdOriginalCh14Value:
;; =============== function _getAdOriginalCh14Value ends ============

	signat	_getAdOriginalCh14Value,90
	global	_process_AD_Converter_Value
psect	text883,local,class=CODE,delta=2
global __ptext883
__ptext883:

;; *************** function _process_AD_Converter_Value *****************
;; Defined at:
;;		line 257 in file "D:\develop\190625\AK7030-OTP\common.c"
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
psect	text883
	file	"D:\develop\190625\AK7030-OTP\common.c"
	line	257
	global	__size_of_process_AD_Converter_Value
	__size_of_process_AD_Converter_Value	equ	__end_of_process_AD_Converter_Value-_process_AD_Converter_Value
	
_process_AD_Converter_Value:	
	opt	stack 4
; Regs used in _process_AD_Converter_Value: [wreg+status,2+status,0+pclath+cstack]
	line	258
	
l4639:	
;common.c: 258: if(getAD_ConvertFlag())
	fcall	_getAD_ConvertFlag
	xorlw	0
	skipnz
	goto	u1871
	goto	u1870
u1871:
	goto	l1812
u1870:
	line	260
	
l4641:	
;common.c: 259: {
;common.c: 260: setAD_ConvertFlag(0);
	movlw	(0)
	fcall	_setAD_ConvertFlag
	line	261
;common.c: 261: AD_Sample();
	fcall	_AD_Sample
	line	262
	
l4643:	
;common.c: 262: if(5 == sampleChannelSelect)
	movf	(_sampleChannelSelect),w
	xorlw	05h
	skipz
	goto	u1881
	goto	u1880
u1881:
	goto	l4647
u1880:
	line	263
	
l4645:	
;common.c: 263: adc_test_init(5,3);
	movlw	(03h)
	movwf	(?_adc_test_init)
	movlw	(05h)
	fcall	_adc_test_init
	goto	l4653
	line	264
	
l4647:	
;common.c: 264: else if(1 == sampleChannelSelect)
	decf	(_sampleChannelSelect),w
	skipz
	goto	u1891
	goto	u1890
u1891:
	goto	l4651
u1890:
	line	265
	
l4649:	
;common.c: 265: adc_test_init(1,3);
	movlw	(03h)
	movwf	(?_adc_test_init)
	movlw	(01h)
	fcall	_adc_test_init
	goto	l4653
	line	267
	
l4651:	
;common.c: 266: else
;common.c: 267: adc_test_init(14,3);
	movlw	(03h)
	movwf	(?_adc_test_init)
	movlw	(0Eh)
	fcall	_adc_test_init
	line	269
	
l4653:	
;common.c: 269: adc_start();
	fcall	_adc_start
	line	271
	
l1812:	
	return
	opt stack 0
GLOBAL	__end_of_process_AD_Converter_Value
	__end_of_process_AD_Converter_Value:
;; =============== function _process_AD_Converter_Value ends ============

	signat	_process_AD_Converter_Value,88
	global	_clearAllTimer
psect	text884,local,class=CODE,delta=2
global __ptext884
__ptext884:

;; *************** function _clearAllTimer *****************
;; Defined at:
;;		line 95 in file "D:\develop\190625\AK7030-OTP\main.c"
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
psect	text884
	file	"D:\develop\190625\AK7030-OTP\main.c"
	line	95
	global	__size_of_clearAllTimer
	__size_of_clearAllTimer	equ	__end_of_clearAllTimer-_clearAllTimer
	
_clearAllTimer:	
	opt	stack 4
; Regs used in _clearAllTimer: [status,2+status,0+pclath+cstack]
	line	96
	
l4637:	
;main.c: 96: clearTwelveHoursTimer();
	fcall	_clearTwelveHoursTimer
	line	97
;main.c: 97: clearThreeHoursTimer();
	fcall	_clearThreeHoursTimer
	line	98
;main.c: 98: clearTwentySecondsTimer();
	fcall	_clearTwentySecondsTimer
	line	99
	
l685:	
	return
	opt stack 0
GLOBAL	__end_of_clearAllTimer
	__end_of_clearAllTimer:
;; =============== function _clearAllTimer ends ============

	signat	_clearAllTimer,88
	global	_AD_Sample
psect	text885,local,class=CODE,delta=2
global __ptext885
__ptext885:

;; *************** function _AD_Sample *****************
;; Defined at:
;;		line 283 in file "D:\develop\190625\AK7030-OTP\common.c"
;; Parameters:    Size  Location     Type
;;		None
;; Auto vars:     Size  Location     Type
;;		None
;; Return value:  Size  Location     Type
;;		None               void
;; Registers used:
;;		wreg, status,2, status,0
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
;;		_process_AD_Converter_Value
;; This function uses a non-reentrant model
;;
psect	text885
	file	"D:\develop\190625\AK7030-OTP\common.c"
	line	283
	global	__size_of_AD_Sample
	__size_of_AD_Sample	equ	__end_of_AD_Sample-_AD_Sample
	
_AD_Sample:	
	opt	stack 4
; Regs used in _AD_Sample: [wreg+status,2+status,0]
	line	284
	
l4573:	
;common.c: 284: if(sampleTimes < 12)
	movlw	(0Ch)
	bcf	status, 5	;RP0=0, select bank0
	subwf	(_sampleTimes),w
	skipnc
	goto	u1731
	goto	u1730
u1731:
	goto	l1823
u1730:
	line	306
	
l4575:	
;common.c: 285: {
;common.c: 306: sampleTimes++;
	incf	(_sampleTimes),f
	line	308
	
l4577:	
;common.c: 308: if(sampleTimes >= 12)
	movlw	(0Ch)
	subwf	(_sampleTimes),w
	skipc
	goto	u1741
	goto	u1740
u1741:
	goto	l1823
u1740:
	line	310
	
l4579:	
;common.c: 309: {
;common.c: 310: sampleTimes = 0;
	clrf	(_sampleTimes)
	line	312
	
l4581:	
;common.c: 312: if(sampleChannelSelect == 14)
	movf	(_sampleChannelSelect),w
	xorlw	0Eh
	skipz
	goto	u1751
	goto	u1750
u1751:
	goto	l4585
u1750:
	line	316
	
l4583:	
;common.c: 313: {
;common.c: 316: sampleChannelSelect = 1;
	clrf	(_sampleChannelSelect)
	incf	(_sampleChannelSelect),f
	line	317
;common.c: 317: }
	goto	l1823
	line	318
	
l4585:	
;common.c: 318: else if(sampleChannelSelect == 5)
	movf	(_sampleChannelSelect),w
	xorlw	05h
	skipz
	goto	u1761
	goto	u1760
u1761:
	goto	l4589
u1760:
	line	321
	
l4587:	
;common.c: 319: {
;common.c: 321: sampleChannelSelect = 14;
	movlw	(0Eh)
	movwf	(_sampleChannelSelect)
	line	322
;common.c: 322: }
	goto	l1823
	line	323
	
l4589:	
;common.c: 323: else if(sampleChannelSelect == 1)
	decf	(_sampleChannelSelect),w
	skipz
	goto	u1771
	goto	u1770
u1771:
	goto	l4587
u1770:
	line	326
	
l4591:	
;common.c: 324: {
;common.c: 326: sampleChannelSelect = 5;
	movlw	(05h)
	movwf	(_sampleChannelSelect)
	line	339
;common.c: 327: }
	
l1823:	
	return
	opt stack 0
GLOBAL	__end_of_AD_Sample
	__end_of_AD_Sample:
;; =============== function _AD_Sample ends ============

	signat	_AD_Sample,88
	global	_setAD_ConvertFlag
psect	text886,local,class=CODE,delta=2
global __ptext886
__ptext886:

;; *************** function _setAD_ConvertFlag *****************
;; Defined at:
;;		line 212 in file "D:\develop\190625\AK7030-OTP\common.c"
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
psect	text886
	file	"D:\develop\190625\AK7030-OTP\common.c"
	line	212
	global	__size_of_setAD_ConvertFlag
	__size_of_setAD_ConvertFlag	equ	__end_of_setAD_ConvertFlag-_setAD_ConvertFlag
	
_setAD_ConvertFlag:	
	opt	stack 4
; Regs used in _setAD_ConvertFlag: [wreg]
;setAD_ConvertFlag@flag stored from wreg
	bcf	status, 5	;RP0=0, select bank0
	movwf	(setAD_ConvertFlag@flag)
	line	213
	
l4571:	
;common.c: 213: adc_convert_flag = flag;
	movf	(setAD_ConvertFlag@flag),w
	bsf	status, 5	;RP0=1, select bank1
	movwf	(_adc_convert_flag)^080h
	line	214
	
l1795:	
	return
	opt stack 0
GLOBAL	__end_of_setAD_ConvertFlag
	__end_of_setAD_ConvertFlag:
;; =============== function _setAD_ConvertFlag ends ============

	signat	_setAD_ConvertFlag,4216
	global	_getAD_ConvertFlag
psect	text887,local,class=CODE,delta=2
global __ptext887
__ptext887:

;; *************** function _getAD_ConvertFlag *****************
;; Defined at:
;;		line 206 in file "D:\develop\190625\AK7030-OTP\common.c"
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
psect	text887
	file	"D:\develop\190625\AK7030-OTP\common.c"
	line	206
	global	__size_of_getAD_ConvertFlag
	__size_of_getAD_ConvertFlag	equ	__end_of_getAD_ConvertFlag-_getAD_ConvertFlag
	
_getAD_ConvertFlag:	
	opt	stack 4
; Regs used in _getAD_ConvertFlag: [wreg]
	line	207
	
l4567:	
;common.c: 207: return adc_convert_flag;
	bsf	status, 5	;RP0=1, select bank1
	bcf	status, 6	;RP1=0, select bank1
	movf	(_adc_convert_flag)^080h,w
	line	208
	
l1792:	
	return
	opt stack 0
GLOBAL	__end_of_getAD_ConvertFlag
	__end_of_getAD_ConvertFlag:
;; =============== function _getAD_ConvertFlag ends ============

	signat	_getAD_ConvertFlag,89
	global	_Filter
psect	text888,local,class=CODE,delta=2
global __ptext888
__ptext888:

;; *************** function _Filter *****************
;; Defined at:
;;		line 57 in file "D:\develop\190625\AK7030-OTP\common.c"
;; Parameters:    Size  Location     Type
;;  tmpValue        2    0[BANK0 ] PTR int 
;;		 -> uiSampleChannelFourteenth(24), uiSampleChannelFourth(24), uiSampleChannelFirst(24), 
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
psect	text888
	file	"D:\develop\190625\AK7030-OTP\common.c"
	line	57
	global	__size_of_Filter
	__size_of_Filter	equ	__end_of_Filter-_Filter
	
_Filter:	
	opt	stack 4
; Regs used in _Filter: [wreg-fsr0h+status,2+status,0+btemp+1]
	line	59
	
l4469:	
	clrf	(Filter@j)
	line	61
;common.c: 61: unsigned int filter_temp = 0, filter_sum = 0;
	clrf	(Filter@filter_temp)
	clrf	(Filter@filter_temp+1)
	clrf	(Filter@filter_sum)
	clrf	(Filter@filter_sum+1)
	line	65
;common.c: 63: unsigned int filter_buf[12];
;common.c: 65: for(int cir = 0;cir < 12; cir++)
	clrf	(Filter@cir)
	clrf	(Filter@cir+1)
	line	66
	
l4475:	
;common.c: 66: filter_buf[cir] = *tmpValue++;
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
	
l4477:	
	movlw	02h
	addwf	(Filter@tmpValue),f
	skipnc
	incf	(Filter@tmpValue+1),f
	line	65
	
l4479:	
	incf	(Filter@cir),f
	skipnz
	incf	(Filter@cir+1),f
	
l4481:	
	movf	(Filter@cir+1),w
	xorlw	80h
	movwf	btemp+1
	movlw	(high(0Ch))^80h
	subwf	btemp+1,w
	skipz
	goto	u1615
	movlw	low(0Ch)
	subwf	(Filter@cir),w
u1615:

	skipc
	goto	u1611
	goto	u1610
u1611:
	goto	l4475
u1610:
	line	69
	
l4483:	
;common.c: 69: for(j = 0; j < 12 - 1; j++)
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	clrf	(Filter@j)
	line	71
	
l4489:	
;common.c: 70: {
;common.c: 71: for(i = 0; i < 12 - 1 - j; i++)
	clrf	(Filter@i)
	goto	l4497
	line	73
	
l4491:	
;common.c: 72: {
;common.c: 73: if(filter_buf[i] > filter_buf[i + 1])
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
	goto	u1625
	movf	0+(??_Filter+0)+0,w
	subwf	0+(??_Filter+2)+0,w
u1625:
	skipnc
	goto	u1621
	goto	u1620
u1621:
	goto	l4495
u1620:
	line	76
	
l4493:	
;common.c: 74: {
;common.c: 76: filter_temp = filter_buf[i];
	clrc
	rlf	(Filter@i),w
	addlw	Filter@filter_buf&0ffh
	movwf	fsr0
	movf	indf,w
	movwf	(Filter@filter_temp)
	incf	fsr0,f
	movf	indf,w
	movwf	(Filter@filter_temp+1)
	line	78
;common.c: 78: filter_buf[i] = filter_buf[i + 1];
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
	line	80
;common.c: 80: filter_buf[i + 1] = filter_temp;
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
	line	71
	
l4495:	
	incf	(Filter@i),f
	
l4497:	
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
	goto	u1635
	movf	0+(??_Filter+0)+0,w
	subwf	(Filter@i),w
u1635:

	skipc
	goto	u1631
	goto	u1630
u1631:
	goto	l4491
u1630:
	line	69
	
l4499:	
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	incf	(Filter@j),f
	
l4501:	
	movlw	(0Bh)
	subwf	(Filter@j),w
	skipc
	goto	u1641
	goto	u1640
u1641:
	goto	l4489
u1640:
	line	85
	
l4503:	
;common.c: 81: }
;common.c: 82: }
;common.c: 83: }
;common.c: 85: for(i = 2; i < 12 - 2; i++)
	movlw	(02h)
	movwf	(Filter@i)
	line	87
	
l4507:	
;common.c: 86: {
;common.c: 87: filter_sum += filter_buf[i];
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
	line	85
	
l4509:	
	incf	(Filter@i),f
	
l4511:	
	movlw	(0Ah)
	subwf	(Filter@i),w
	skipc
	goto	u1651
	goto	u1650
u1651:
	goto	l4507
u1650:
	line	90
	
l4513:	
;common.c: 88: }
;common.c: 90: return (filter_sum >> 3);
	movf	(Filter@filter_sum+1),w
	movwf	(?_Filter+1)
	movf	(Filter@filter_sum),w
	movwf	(?_Filter)
	
l4515:	
	clrc
	rrf	(?_Filter+1),f
	rrf	(?_Filter),f
	clrc
	rrf	(?_Filter+1),f
	rrf	(?_Filter),f
	clrc
	rrf	(?_Filter+1),f
	rrf	(?_Filter),f
	line	92
	
l1754:	
	return
	opt stack 0
GLOBAL	__end_of_Filter
	__end_of_Filter:
;; =============== function _Filter ends ============

	signat	_Filter,4218
	global	_isFinishedThreeHoursTimer
psect	text889,local,class=CODE,delta=2
global __ptext889
__ptext889:

;; *************** function _isFinishedThreeHoursTimer *****************
;; Defined at:
;;		line 471 in file "D:\develop\190625\AK7030-OTP\common.c"
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
psect	text889
	file	"D:\develop\190625\AK7030-OTP\common.c"
	line	471
	global	__size_of_isFinishedThreeHoursTimer
	__size_of_isFinishedThreeHoursTimer	equ	__end_of_isFinishedThreeHoursTimer-_isFinishedThreeHoursTimer
	
_isFinishedThreeHoursTimer:	
	opt	stack 5
; Regs used in _isFinishedThreeHoursTimer: [wreg+status,2+status,0]
	line	472
	
l4453:	
;common.c: 472: if((uiSmallTimer == 0) && bSmallTimerStartFlag)
	bsf	status, 5	;RP0=1, select bank1
	movf	((_uiSmallTimer+1)^080h),w
	iorwf	((_uiSmallTimer)^080h),w
	skipz
	goto	u1591
	goto	u1590
u1591:
	goto	l4465
u1590:
	
l4455:	
	bcf	status, 5	;RP0=0, select bank0
	movf	(_bSmallTimerStartFlag),w
	skipz
	goto	u1600
	goto	l4465
u1600:
	line	474
	
l4457:	
;common.c: 473: {
;common.c: 474: bSmallTimerStartFlag = 0;
	clrf	(_bSmallTimerStartFlag)
	line	475
	
l4459:	
;common.c: 475: return 1;
	movlw	(01h)
	goto	l1873
	line	478
	
l4465:	
;common.c: 477: else
;common.c: 478: return 0;
	movlw	(0)
	line	479
	
l1873:	
	return
	opt stack 0
GLOBAL	__end_of_isFinishedThreeHoursTimer
	__end_of_isFinishedThreeHoursTimer:
;; =============== function _isFinishedThreeHoursTimer ends ============

	signat	_isFinishedThreeHoursTimer,89
	global	_startThreeHoursTimer
psect	text890,local,class=CODE,delta=2
global __ptext890
__ptext890:

;; *************** function _startThreeHoursTimer *****************
;; Defined at:
;;		line 401 in file "D:\develop\190625\AK7030-OTP\common.c"
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
psect	text890
	file	"D:\develop\190625\AK7030-OTP\common.c"
	line	401
	global	__size_of_startThreeHoursTimer
	__size_of_startThreeHoursTimer	equ	__end_of_startThreeHoursTimer-_startThreeHoursTimer
	
_startThreeHoursTimer:	
	opt	stack 5
; Regs used in _startThreeHoursTimer: [wreg+status,2+status,0]
	line	402
	
l4445:	
;common.c: 402: if(( 0 == uiSmallTimer ) && ( 0 == bSmallTimerStartFlag ))
	bsf	status, 5	;RP0=1, select bank1
	movf	((_uiSmallTimer+1)^080h),w
	iorwf	((_uiSmallTimer)^080h),w
	skipz
	goto	u1571
	goto	u1570
u1571:
	goto	l1846
u1570:
	
l4447:	
	bcf	status, 5	;RP0=0, select bank0
	movf	(_bSmallTimerStartFlag),f
	skipz
	goto	u1581
	goto	u1580
u1581:
	goto	l1846
u1580:
	line	404
	
l4449:	
;common.c: 403: {
;common.c: 404: uiSmallTimer = uiSetTime;
	movf	(startThreeHoursTimer@uiSetTime+1),w
	bsf	status, 5	;RP0=1, select bank1
	movwf	(_uiSmallTimer+1)^080h
	bcf	status, 5	;RP0=0, select bank0
	movf	(startThreeHoursTimer@uiSetTime),w
	bsf	status, 5	;RP0=1, select bank1
	movwf	(_uiSmallTimer)^080h
	line	405
	
l4451:	
;common.c: 405: bSmallTimerStartFlag = 1;
	bcf	status, 5	;RP0=0, select bank0
	clrf	(_bSmallTimerStartFlag)
	incf	(_bSmallTimerStartFlag),f
	line	411
	
l1846:	
	return
	opt stack 0
GLOBAL	__end_of_startThreeHoursTimer
	__end_of_startThreeHoursTimer:
;; =============== function _startThreeHoursTimer ends ============

	signat	_startThreeHoursTimer,4216
	global	_isFinishedTwentySecondsTimer
psect	text891,local,class=CODE,delta=2
global __ptext891
__ptext891:

;; *************** function _isFinishedTwentySecondsTimer *****************
;; Defined at:
;;		line 448 in file "D:\develop\190625\AK7030-OTP\common.c"
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
psect	text891
	file	"D:\develop\190625\AK7030-OTP\common.c"
	line	448
	global	__size_of_isFinishedTwentySecondsTimer
	__size_of_isFinishedTwentySecondsTimer	equ	__end_of_isFinishedTwentySecondsTimer-_isFinishedTwentySecondsTimer
	
_isFinishedTwentySecondsTimer:	
	opt	stack 5
; Regs used in _isFinishedTwentySecondsTimer: [wreg+status,2+status,0]
	line	449
	
l4429:	
;common.c: 449: if(( 0 == uiTwentySecondsTimer ) && bTwentySecStartFlag )
	bsf	status, 5	;RP0=1, select bank1
	movf	((_uiTwentySecondsTimer+1)^080h),w
	iorwf	((_uiTwentySecondsTimer)^080h),w
	skipz
	goto	u1551
	goto	u1550
u1551:
	goto	l4441
u1550:
	
l4431:	
	bcf	status, 5	;RP0=0, select bank0
	movf	(_bTwentySecStartFlag),w
	skipz
	goto	u1560
	goto	l4441
u1560:
	line	451
	
l4433:	
;common.c: 450: {
;common.c: 451: bTwentySecStartFlag = 0;
	clrf	(_bTwentySecStartFlag)
	line	452
	
l4435:	
;common.c: 452: return 1;
	movlw	(01h)
	goto	l1863
	line	455
	
l4441:	
;common.c: 454: else
;common.c: 455: return 0;
	movlw	(0)
	line	456
	
l1863:	
	return
	opt stack 0
GLOBAL	__end_of_isFinishedTwentySecondsTimer
	__end_of_isFinishedTwentySecondsTimer:
;; =============== function _isFinishedTwentySecondsTimer ends ============

	signat	_isFinishedTwentySecondsTimer,89
	global	_startTwentySecondsTimer
psect	text892,local,class=CODE,delta=2
global __ptext892
__ptext892:

;; *************** function _startTwentySecondsTimer *****************
;; Defined at:
;;		line 415 in file "D:\develop\190625\AK7030-OTP\common.c"
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
psect	text892
	file	"D:\develop\190625\AK7030-OTP\common.c"
	line	415
	global	__size_of_startTwentySecondsTimer
	__size_of_startTwentySecondsTimer	equ	__end_of_startTwentySecondsTimer-_startTwentySecondsTimer
	
_startTwentySecondsTimer:	
	opt	stack 5
; Regs used in _startTwentySecondsTimer: [wreg+status,2+status,0]
	line	416
	
l4421:	
;common.c: 416: if(( 0 == uiTwentySecondsTimer) && ( 0 == bTwentySecStartFlag))
	bsf	status, 5	;RP0=1, select bank1
	movf	((_uiTwentySecondsTimer+1)^080h),w
	iorwf	((_uiTwentySecondsTimer)^080h),w
	skipz
	goto	u1531
	goto	u1530
u1531:
	goto	l1850
u1530:
	
l4423:	
	bcf	status, 5	;RP0=0, select bank0
	movf	(_bTwentySecStartFlag),f
	skipz
	goto	u1541
	goto	u1540
u1541:
	goto	l1850
u1540:
	line	418
	
l4425:	
;common.c: 417: {
;common.c: 418: uiTwentySecondsTimer = 20;
	movlw	014h
	bsf	status, 5	;RP0=1, select bank1
	movwf	(_uiTwentySecondsTimer)^080h
	clrf	(_uiTwentySecondsTimer+1)^080h
	line	419
	
l4427:	
;common.c: 419: bTwentySecStartFlag = 1;
	bcf	status, 5	;RP0=0, select bank0
	clrf	(_bTwentySecStartFlag)
	incf	(_bTwentySecStartFlag),f
	line	421
	
l1850:	
	return
	opt stack 0
GLOBAL	__end_of_startTwentySecondsTimer
	__end_of_startTwentySecondsTimer:
;; =============== function _startTwentySecondsTimer ends ============

	signat	_startTwentySecondsTimer,88
	global	_isFinishedTwelveHoursTimer
psect	text893,local,class=CODE,delta=2
global __ptext893
__ptext893:

;; *************** function _isFinishedTwelveHoursTimer *****************
;; Defined at:
;;		line 460 in file "D:\develop\190625\AK7030-OTP\common.c"
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
psect	text893
	file	"D:\develop\190625\AK7030-OTP\common.c"
	line	460
	global	__size_of_isFinishedTwelveHoursTimer
	__size_of_isFinishedTwelveHoursTimer	equ	__end_of_isFinishedTwelveHoursTimer-_isFinishedTwelveHoursTimer
	
_isFinishedTwelveHoursTimer:	
	opt	stack 5
; Regs used in _isFinishedTwelveHoursTimer: [wreg+status,2+status,0]
	line	461
	
l4405:	
;common.c: 461: if(( uiBigTimer == 0 ) && bBigTimerStartFlag )
	bsf	status, 5	;RP0=1, select bank1
	movf	((_uiBigTimer+1)^080h),w
	iorwf	((_uiBigTimer)^080h),w
	skipz
	goto	u1511
	goto	u1510
u1511:
	goto	l4417
u1510:
	
l4407:	
	bcf	status, 5	;RP0=0, select bank0
	movf	(_bBigTimerStartFlag),w
	skipz
	goto	u1520
	goto	l4417
u1520:
	line	463
	
l4409:	
;common.c: 462: {
;common.c: 463: bBigTimerStartFlag = 0;
	clrf	(_bBigTimerStartFlag)
	line	464
	
l4411:	
;common.c: 464: return 1;
	movlw	(01h)
	goto	l1868
	line	467
	
l4417:	
;common.c: 466: else
;common.c: 467: return 0;
	movlw	(0)
	line	468
	
l1868:	
	return
	opt stack 0
GLOBAL	__end_of_isFinishedTwelveHoursTimer
	__end_of_isFinishedTwelveHoursTimer:
;; =============== function _isFinishedTwelveHoursTimer ends ============

	signat	_isFinishedTwelveHoursTimer,89
	global	_startTwelveHourTimer
psect	text894,local,class=CODE,delta=2
global __ptext894
__ptext894:

;; *************** function _startTwelveHourTimer *****************
;; Defined at:
;;		line 360 in file "D:\develop\190625\AK7030-OTP\common.c"
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
psect	text894
	file	"D:\develop\190625\AK7030-OTP\common.c"
	line	360
	global	__size_of_startTwelveHourTimer
	__size_of_startTwelveHourTimer	equ	__end_of_startTwelveHourTimer-_startTwelveHourTimer
	
_startTwelveHourTimer:	
	opt	stack 5
; Regs used in _startTwelveHourTimer: [wreg+status,2+status,0]
	line	361
	
l4397:	
;common.c: 361: if((0 == uiBigTimer) && ( 0 == bBigTimerStartFlag))
	bsf	status, 5	;RP0=1, select bank1
	movf	((_uiBigTimer+1)^080h),w
	iorwf	((_uiBigTimer)^080h),w
	skipz
	goto	u1491
	goto	u1490
u1491:
	goto	l1830
u1490:
	
l4399:	
	bcf	status, 5	;RP0=0, select bank0
	movf	(_bBigTimerStartFlag),f
	skipz
	goto	u1501
	goto	u1500
u1501:
	goto	l1830
u1500:
	line	363
	
l4401:	
;common.c: 362: {
;common.c: 363: uiBigTimer = uiSetTime;
	movf	(startTwelveHourTimer@uiSetTime+1),w
	bsf	status, 5	;RP0=1, select bank1
	movwf	(_uiBigTimer+1)^080h
	bcf	status, 5	;RP0=0, select bank0
	movf	(startTwelveHourTimer@uiSetTime),w
	bsf	status, 5	;RP0=1, select bank1
	movwf	(_uiBigTimer)^080h
	line	364
	
l4403:	
;common.c: 364: bBigTimerStartFlag = 1;
	bcf	status, 5	;RP0=0, select bank0
	clrf	(_bBigTimerStartFlag)
	incf	(_bBigTimerStartFlag),f
	line	371
	
l1830:	
	return
	opt stack 0
GLOBAL	__end_of_startTwelveHourTimer
	__end_of_startTwelveHourTimer:
;; =============== function _startTwelveHourTimer ends ============

	signat	_startTwelveHourTimer,4216
	global	_isFinishedTwentyMinTimer
psect	text895,local,class=CODE,delta=2
global __ptext895
__ptext895:

;; *************** function _isFinishedTwentyMinTimer *****************
;; Defined at:
;;		line 436 in file "D:\develop\190625\AK7030-OTP\common.c"
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
psect	text895
	file	"D:\develop\190625\AK7030-OTP\common.c"
	line	436
	global	__size_of_isFinishedTwentyMinTimer
	__size_of_isFinishedTwentyMinTimer	equ	__end_of_isFinishedTwentyMinTimer-_isFinishedTwentyMinTimer
	
_isFinishedTwentyMinTimer:	
	opt	stack 5
; Regs used in _isFinishedTwentyMinTimer: [wreg+status,2+status,0]
	line	437
	
l4381:	
;common.c: 437: if(( 0 == uiTwentyMinTimer ) && bTwentyMinStartFlag )
	bsf	status, 5	;RP0=1, select bank1
	movf	((_uiTwentyMinTimer+1)^080h),w
	iorwf	((_uiTwentyMinTimer)^080h),w
	skipz
	goto	u1471
	goto	u1470
u1471:
	goto	l4393
u1470:
	
l4383:	
	bcf	status, 5	;RP0=0, select bank0
	movf	(_bTwentyMinStartFlag),w
	skipz
	goto	u1480
	goto	l4393
u1480:
	line	439
	
l4385:	
;common.c: 438: {
;common.c: 439: bTwentyMinStartFlag = 0;
	clrf	(_bTwentyMinStartFlag)
	line	440
	
l4387:	
;common.c: 440: return 1;
	movlw	(01h)
	goto	l1858
	line	443
	
l4393:	
;common.c: 442: else
;common.c: 443: return 0;
	movlw	(0)
	line	444
	
l1858:	
	return
	opt stack 0
GLOBAL	__end_of_isFinishedTwentyMinTimer
	__end_of_isFinishedTwentyMinTimer:
;; =============== function _isFinishedTwentyMinTimer ends ============

	signat	_isFinishedTwentyMinTimer,89
	global	_clearTwentyMinTimer
psect	text896,local,class=CODE,delta=2
global __ptext896
__ptext896:

;; *************** function _clearTwentyMinTimer *****************
;; Defined at:
;;		line 394 in file "D:\develop\190625\AK7030-OTP\common.c"
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
;;		_main
;; This function uses a non-reentrant model
;;
psect	text896
	file	"D:\develop\190625\AK7030-OTP\common.c"
	line	394
	global	__size_of_clearTwentyMinTimer
	__size_of_clearTwentyMinTimer	equ	__end_of_clearTwentyMinTimer-_clearTwentyMinTimer
	
_clearTwentyMinTimer:	
	opt	stack 5
; Regs used in _clearTwentyMinTimer: [status,2]
	line	395
	
l4379:	
;common.c: 395: uiTwentyMinTimer = 0;
	bsf	status, 5	;RP0=1, select bank1
	clrf	(_uiTwentyMinTimer)^080h
	clrf	(_uiTwentyMinTimer+1)^080h
	line	396
;common.c: 396: bTwentyMinStartFlag = 0;
	bcf	status, 5	;RP0=0, select bank0
	clrf	(_bTwentyMinStartFlag)
	line	397
	
l1842:	
	return
	opt stack 0
GLOBAL	__end_of_clearTwentyMinTimer
	__end_of_clearTwentyMinTimer:
;; =============== function _clearTwentyMinTimer ends ============

	signat	_clearTwentyMinTimer,88
	global	_startTwentyMinTimer
psect	text897,local,class=CODE,delta=2
global __ptext897
__ptext897:

;; *************** function _startTwentyMinTimer *****************
;; Defined at:
;;		line 426 in file "D:\develop\190625\AK7030-OTP\common.c"
;; Parameters:    Size  Location     Type
;;  uiSetValue      2    0[BANK0 ] unsigned int 
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
psect	text897
	file	"D:\develop\190625\AK7030-OTP\common.c"
	line	426
	global	__size_of_startTwentyMinTimer
	__size_of_startTwentyMinTimer	equ	__end_of_startTwentyMinTimer-_startTwentyMinTimer
	
_startTwentyMinTimer:	
	opt	stack 5
; Regs used in _startTwentyMinTimer: [wreg+status,2+status,0]
	line	427
	
l4371:	
;common.c: 427: if(( 0 == uiTwentyMinTimer) && ( 0 == bTwentyMinStartFlag))
	bsf	status, 5	;RP0=1, select bank1
	movf	((_uiTwentyMinTimer+1)^080h),w
	iorwf	((_uiTwentyMinTimer)^080h),w
	skipz
	goto	u1451
	goto	u1450
u1451:
	goto	l1854
u1450:
	
l4373:	
	bcf	status, 5	;RP0=0, select bank0
	movf	(_bTwentyMinStartFlag),f
	skipz
	goto	u1461
	goto	u1460
u1461:
	goto	l1854
u1460:
	line	429
	
l4375:	
;common.c: 428: {
;common.c: 429: uiTwentyMinTimer = uiSetValue;
	movf	(startTwentyMinTimer@uiSetValue+1),w
	bsf	status, 5	;RP0=1, select bank1
	movwf	(_uiTwentyMinTimer+1)^080h
	bcf	status, 5	;RP0=0, select bank0
	movf	(startTwentyMinTimer@uiSetValue),w
	bsf	status, 5	;RP0=1, select bank1
	movwf	(_uiTwentyMinTimer)^080h
	line	430
	
l4377:	
;common.c: 430: bTwentyMinStartFlag = 1;
	bcf	status, 5	;RP0=0, select bank0
	clrf	(_bTwentyMinStartFlag)
	incf	(_bTwentyMinStartFlag),f
	line	432
	
l1854:	
	return
	opt stack 0
GLOBAL	__end_of_startTwentyMinTimer
	__end_of_startTwentyMinTimer:
;; =============== function _startTwentyMinTimer ends ============

	signat	_startTwentyMinTimer,4216
	global	_clrSampeTime
psect	text898,local,class=CODE,delta=2
global __ptext898
__ptext898:

;; *************** function _clrSampeTime *****************
;; Defined at:
;;		line 492 in file "D:\develop\190625\AK7030-OTP\common.c"
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
psect	text898
	file	"D:\develop\190625\AK7030-OTP\common.c"
	line	492
	global	__size_of_clrSampeTime
	__size_of_clrSampeTime	equ	__end_of_clrSampeTime-_clrSampeTime
	
_clrSampeTime:	
	opt	stack 5
; Regs used in _clrSampeTime: [status,2]
	line	493
	
l4369:	
;common.c: 493: timer.timer10msStopWatch = 0;
	clrf	(_timer)^080h
	line	494
	
l1882:	
	return
	opt stack 0
GLOBAL	__end_of_clrSampeTime
	__end_of_clrSampeTime:
;; =============== function _clrSampeTime ends ============

	signat	_clrSampeTime,88
	global	_isPermitSampleTime
psect	text899,local,class=CODE,delta=2
global __ptext899
__ptext899:

;; *************** function _isPermitSampleTime *****************
;; Defined at:
;;		line 482 in file "D:\develop\190625\AK7030-OTP\common.c"
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
psect	text899
	file	"D:\develop\190625\AK7030-OTP\common.c"
	line	482
	global	__size_of_isPermitSampleTime
	__size_of_isPermitSampleTime	equ	__end_of_isPermitSampleTime-_isPermitSampleTime
	
_isPermitSampleTime:	
	opt	stack 5
; Regs used in _isPermitSampleTime: [wreg]
	line	483
	
l4357:	
;common.c: 483: if(timer.timer10msStopWatch >= 10)
	movlw	(0Ah)
	bsf	status, 5	;RP0=1, select bank1
	subwf	(_timer)^080h,w
	skipc
	goto	u1441
	goto	u1440
u1441:
	goto	l4365
u1440:
	line	485
	
l4359:	
;common.c: 484: {
;common.c: 485: return 1;
	movlw	(01h)
	goto	l1878
	line	488
	
l4365:	
;common.c: 487: else
;common.c: 488: return 0;
	movlw	(0)
	line	489
	
l1878:	
	return
	opt stack 0
GLOBAL	__end_of_isPermitSampleTime
	__end_of_isPermitSampleTime:
;; =============== function _isPermitSampleTime ends ============

	signat	_isPermitSampleTime,89
	global	_adc_start
psect	text900,local,class=CODE,delta=2
global __ptext900
__ptext900:

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
psect	text900
	file	"D:\develop\190625\AK7030-OTP\periph.c"
	line	100
	global	__size_of_adc_start
	__size_of_adc_start	equ	__end_of_adc_start-_adc_start
	
_adc_start:	
	opt	stack 4
; Regs used in _adc_start: []
	line	101
	
l4355:	
;periph.c: 101: GO=1;
	bcf	status, 5	;RP0=0, select bank0
	bsf	(249/8),(249)&7
	line	102
	
l2551:	
	return
	opt stack 0
GLOBAL	__end_of_adc_start
	__end_of_adc_start:
;; =============== function _adc_start ends ============

	signat	_adc_start,88
	global	_op2_init
psect	text901,local,class=CODE,delta=2
global __ptext901
__ptext901:

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
psect	text901
	file	"D:\develop\190625\AK7030-OTP\periph.c"
	line	45
	global	__size_of_op2_init
	__size_of_op2_init	equ	__end_of_op2_init-_op2_init
	
_op2_init:	
	opt	stack 5
; Regs used in _op2_init: [wreg]
	line	52
	
l4353:	
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
	
l2537:	
	return
	opt stack 0
GLOBAL	__end_of_op2_init
	__end_of_op2_init:
;; =============== function _op2_init ends ============

	signat	_op2_init,88
	global	_op1_init
psect	text902,local,class=CODE,delta=2
global __ptext902
__ptext902:

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
psect	text902
	file	"D:\develop\190625\AK7030-OTP\periph.c"
	line	26
	global	__size_of_op1_init
	__size_of_op1_init	equ	__end_of_op1_init-_op1_init
	
_op1_init:	
	opt	stack 5
; Regs used in _op1_init: [wreg]
	line	33
	
l4347:	
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
	
l4349:	
;periph.c: 38: TRISB3=1;
	bsf	status, 5	;RP0=1, select bank1
	bsf	(1075/8)^080h,(1075)&7
	line	40
	
l4351:	
;periph.c: 40: TRISB5=0;
	bcf	(1077/8)^080h,(1077)&7
	line	41
	
l2534:	
	return
	opt stack 0
GLOBAL	__end_of_op1_init
	__end_of_op1_init:
;; =============== function _op1_init ends ============

	signat	_op1_init,88
	global	_dac_init
psect	text903,local,class=CODE,delta=2
global __ptext903
__ptext903:

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
psect	text903
	file	"D:\develop\190625\AK7030-OTP\periph.c"
	line	14
	global	__size_of_dac_init
	__size_of_dac_init	equ	__end_of_dac_init-_dac_init
	
_dac_init:	
	opt	stack 5
; Regs used in _dac_init: [wreg]
	line	15
	
l4341:	
;periph.c: 15: DACCON|=1;
	bsf	(135)^080h+(0/8),(0)&7	;volatile
	line	17
	
l4343:	
;periph.c: 17: DACR0=0x0F;
	movlw	(0Fh)
	movwf	(136)^080h	;volatile
	line	18
	
l4345:	
;periph.c: 18: DACCON|=(1)<<2;
	bsf	(135)^080h+(2/8),(2)&7	;volatile
	line	22
	
l2531:	
	return
	opt stack 0
GLOBAL	__end_of_dac_init
	__end_of_dac_init:
;; =============== function _dac_init ends ============

	signat	_dac_init,88
	global	_adc_test_init
psect	text904,local,class=CODE,delta=2
global __ptext904
__ptext904:

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
psect	text904
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
	
l4331:	
;periph.c: 86: ADCON0 = 0x00;
	clrf	(31)	;volatile
	line	87
	
l4333:	
;periph.c: 87: ADCON0|=channel<<2;
	movf	(adc_test_init@channel),w
	movwf	(??_adc_test_init+0)+0
	clrc
	rlf	(??_adc_test_init+0)+0,f
	clrc
	rlf	(??_adc_test_init+0)+0,w
	iorwf	(31),f	;volatile
	line	88
	
l4335:	
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
	
l4337:	
;periph.c: 89: ADON=1;
	bcf	status, 5	;RP0=0, select bank0
	bsf	(248/8),(248)&7
	line	90
	
l4339:	
;periph.c: 90: ADIE=1;
	bsf	status, 5	;RP0=1, select bank1
	bsf	(1130/8)^080h,(1130)&7
	line	91
	
l2545:	
	return
	opt stack 0
GLOBAL	__end_of_adc_test_init
	__end_of_adc_test_init:
;; =============== function _adc_test_init ends ============

	signat	_adc_test_init,8312
	global	_timer1_interrupt_config
psect	text905,local,class=CODE,delta=2
global __ptext905
__ptext905:

;; *************** function _timer1_interrupt_config *****************
;; Defined at:
;;		line 198 in file "D:\develop\190625\AK7030-OTP\common.c"
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
psect	text905
	file	"D:\develop\190625\AK7030-OTP\common.c"
	line	198
	global	__size_of_timer1_interrupt_config
	__size_of_timer1_interrupt_config	equ	__end_of_timer1_interrupt_config-_timer1_interrupt_config
	
_timer1_interrupt_config:	
	opt	stack 5
; Regs used in _timer1_interrupt_config: []
	line	199
	
l4329:	
;common.c: 199: GIE = 1;
	bsf	(95/8),(95)&7
	line	200
;common.c: 200: PEIE = 1;
	bsf	(94/8),(94)&7
	line	201
	
l1789:	
	return
	opt stack 0
GLOBAL	__end_of_timer1_interrupt_config
	__end_of_timer1_interrupt_config:
;; =============== function _timer1_interrupt_config ends ============

	signat	_timer1_interrupt_config,88
	global	_timer1_config
psect	text906,local,class=CODE,delta=2
global __ptext906
__ptext906:

;; *************** function _timer1_config *****************
;; Defined at:
;;		line 186 in file "D:\develop\190625\AK7030-OTP\common.c"
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
psect	text906
	file	"D:\develop\190625\AK7030-OTP\common.c"
	line	186
	global	__size_of_timer1_config
	__size_of_timer1_config	equ	__end_of_timer1_config-_timer1_config
	
_timer1_config:	
	opt	stack 5
; Regs used in _timer1_config: [wreg]
	line	188
	
l4325:	
;common.c: 188: TMR1H=0xCF;
	movlw	(0CFh)
	bcf	status, 6	;RP1=0, select bank0
	movwf	(15)	;volatile
	line	189
;common.c: 189: TMR1L=0x2C;
	movlw	(02Ch)
	movwf	(14)	;volatile
	line	190
;common.c: 190: T1CON=0xE1;
	movlw	(0E1h)
	movwf	(16)	;volatile
	line	191
	
l4327:	
;common.c: 191: TMR1IE=1;
	bsf	status, 5	;RP0=1, select bank1
	bsf	(1120/8)^080h,(1120)&7
	line	193
	
l1786:	
	return
	opt stack 0
GLOBAL	__end_of_timer1_config
	__end_of_timer1_config:
;; =============== function _timer1_config ends ============

	signat	_timer1_config,88
	global	_clock_config
psect	text907,local,class=CODE,delta=2
global __ptext907
__ptext907:

;; *************** function _clock_config *****************
;; Defined at:
;;		line 178 in file "D:\develop\190625\AK7030-OTP\common.c"
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
psect	text907
	file	"D:\develop\190625\AK7030-OTP\common.c"
	line	178
	global	__size_of_clock_config
	__size_of_clock_config	equ	__end_of_clock_config-_clock_config
	
_clock_config:	
	opt	stack 5
; Regs used in _clock_config: [wreg+status,2]
	line	180
	
l4321:	
;common.c: 180: CLKPR = 0x80;
	movlw	(080h)
	bcf	status, 5	;RP0=0, select bank2
	bsf	status, 6	;RP1=1, select bank2
	movwf	(264)^0100h	;volatile
	line	181
	
l4323:	
;common.c: 181: CLKPR = 0x00;
	clrf	(264)^0100h	;volatile
	line	182
;common.c: 182: while(CLKPCE);
	
l1780:	
	btfsc	(2119/8)^0100h,(2119)&7
	goto	u1431
	goto	u1430
u1431:
	goto	l1780
u1430:
	line	183
	
l1783:	
	return
	opt stack 0
GLOBAL	__end_of_clock_config
	__end_of_clock_config:
;; =============== function _clock_config ends ============

	signat	_clock_config,88
	global	_setPA6
psect	text908,local,class=CODE,delta=2
global __ptext908
__ptext908:

;; *************** function _setPA6 *****************
;; Defined at:
;;		line 281 in file "D:\develop\190625\AK7030-OTP\main.c"
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
psect	text908
	file	"D:\develop\190625\AK7030-OTP\main.c"
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
	
l4317:	
;main.c: 282: if( bValue )
	movf	(setPA6@bValue),w
	skipz
	goto	u1420
	goto	l729
u1420:
	line	284
	
l4319:	
;main.c: 284: PA6 = 1;
	bsf	(46/8),(46)&7
	goto	l731
	line	288
	
l729:	
	line	290
;main.c: 288: else
;main.c: 290: PA6= 0;
	bcf	(46/8),(46)&7
	line	294
	
l731:	
	return
	opt stack 0
GLOBAL	__end_of_setPA6
	__end_of_setPA6:
;; =============== function _setPA6 ends ============

	signat	_setPA6,4216
	global	_setPA3
psect	text909,local,class=CODE,delta=2
global __ptext909
__ptext909:

;; *************** function _setPA3 *****************
;; Defined at:
;;		line 235 in file "D:\develop\190625\AK7030-OTP\main.c"
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
psect	text909
	file	"D:\develop\190625\AK7030-OTP\main.c"
	line	235
	global	__size_of_setPA3
	__size_of_setPA3	equ	__end_of_setPA3-_setPA3
	
_setPA3:	
	opt	stack 5
; Regs used in _setPA3: [wreg]
;setPA3@bValue stored from wreg
	movwf	(setPA3@bValue)
	line	236
	
l4313:	
;main.c: 236: if( bValue )
	movf	(setPA3@bValue),w
	skipz
	goto	u1410
	goto	l719
u1410:
	line	238
	
l4315:	
;main.c: 238: PA3 = 1;
	bsf	(43/8),(43)&7
	goto	l721
	line	242
	
l719:	
	line	244
;main.c: 242: else
;main.c: 244: PA3 = 0;
	bcf	(43/8),(43)&7
	line	248
	
l721:	
	return
	opt stack 0
GLOBAL	__end_of_setPA3
	__end_of_setPA3:
;; =============== function _setPA3 ends ============

	signat	_setPA3,4216
	global	_setPA2
psect	text910,local,class=CODE,delta=2
global __ptext910
__ptext910:

;; *************** function _setPA2 *****************
;; Defined at:
;;		line 218 in file "D:\develop\190625\AK7030-OTP\main.c"
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
psect	text910
	file	"D:\develop\190625\AK7030-OTP\main.c"
	line	218
	global	__size_of_setPA2
	__size_of_setPA2	equ	__end_of_setPA2-_setPA2
	
_setPA2:	
	opt	stack 5
; Regs used in _setPA2: [wreg]
;setPA2@bValue stored from wreg
	movwf	(setPA2@bValue)
	line	219
	
l4309:	
;main.c: 219: if( bValue )
	movf	(setPA2@bValue),w
	skipz
	goto	u1400
	goto	l714
u1400:
	line	221
	
l4311:	
;main.c: 221: PA2 = 1;
	bsf	(42/8),(42)&7
	goto	l716
	line	225
	
l714:	
	line	227
;main.c: 225: else
;main.c: 227: PA2 = 0;
	bcf	(42/8),(42)&7
	line	231
	
l716:	
	return
	opt stack 0
GLOBAL	__end_of_setPA2
	__end_of_setPA2:
;; =============== function _setPA2 ends ============

	signat	_setPA2,4216
	global	_setPA1
psect	text911,local,class=CODE,delta=2
global __ptext911
__ptext911:

;; *************** function _setPA1 *****************
;; Defined at:
;;		line 200 in file "D:\develop\190625\AK7030-OTP\main.c"
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
psect	text911
	file	"D:\develop\190625\AK7030-OTP\main.c"
	line	200
	global	__size_of_setPA1
	__size_of_setPA1	equ	__end_of_setPA1-_setPA1
	
_setPA1:	
	opt	stack 5
; Regs used in _setPA1: [wreg]
;setPA1@bValue stored from wreg
	movwf	(setPA1@bValue)
	line	201
	
l4305:	
;main.c: 201: if( bValue )
	movf	(setPA1@bValue),w
	skipz
	goto	u1390
	goto	l709
u1390:
	line	203
	
l4307:	
;main.c: 203: PA1 = 1;
	bsf	(41/8),(41)&7
	goto	l711
	line	207
	
l709:	
	line	209
;main.c: 207: else
;main.c: 209: PA1 = 0;
	bcf	(41/8),(41)&7
	line	213
	
l711:	
	return
	opt stack 0
GLOBAL	__end_of_setPA1
	__end_of_setPA1:
;; =============== function _setPA1 ends ============

	signat	_setPA1,4216
	global	_setPA0
psect	text912,local,class=CODE,delta=2
global __ptext912
__ptext912:

;; *************** function _setPA0 *****************
;; Defined at:
;;		line 183 in file "D:\develop\190625\AK7030-OTP\main.c"
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
psect	text912
	file	"D:\develop\190625\AK7030-OTP\main.c"
	line	183
	global	__size_of_setPA0
	__size_of_setPA0	equ	__end_of_setPA0-_setPA0
	
_setPA0:	
	opt	stack 5
; Regs used in _setPA0: [wreg]
;setPA0@bValue stored from wreg
	movwf	(setPA0@bValue)
	line	184
	
l4301:	
;main.c: 184: if( bValue )
	movf	(setPA0@bValue),w
	skipz
	goto	u1380
	goto	l704
u1380:
	line	186
	
l4303:	
;main.c: 186: PA0 = 1;
	bsf	(40/8),(40)&7
	goto	l706
	line	190
	
l704:	
	line	192
;main.c: 190: else
;main.c: 192: PA0 = 0;
	bcf	(40/8),(40)&7
	line	196
	
l706:	
	return
	opt stack 0
GLOBAL	__end_of_setPA0
	__end_of_setPA0:
;; =============== function _setPA0 ends ============

	signat	_setPA0,4216
	global	_setPB1
psect	text913,local,class=CODE,delta=2
global __ptext913
__ptext913:

;; *************** function _setPB1 *****************
;; Defined at:
;;		line 166 in file "D:\develop\190625\AK7030-OTP\main.c"
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
psect	text913
	file	"D:\develop\190625\AK7030-OTP\main.c"
	line	166
	global	__size_of_setPB1
	__size_of_setPB1	equ	__end_of_setPB1-_setPB1
	
_setPB1:	
	opt	stack 5
; Regs used in _setPB1: [wreg]
;setPB1@bValue stored from wreg
	movwf	(setPB1@bValue)
	line	167
	
l4297:	
;main.c: 167: if( bValue )
	movf	(setPB1@bValue),w
	skipz
	goto	u1370
	goto	l699
u1370:
	line	169
	
l4299:	
;main.c: 169: PB1 = 1;
	bsf	(49/8),(49)&7
	goto	l701
	line	173
	
l699:	
	line	175
;main.c: 173: else
;main.c: 175: PB1 = 0;
	bcf	(49/8),(49)&7
	line	179
	
l701:	
	return
	opt stack 0
GLOBAL	__end_of_setPB1
	__end_of_setPB1:
;; =============== function _setPB1 ends ============

	signat	_setPB1,4216
	global	_setPB0
psect	text914,local,class=CODE,delta=2
global __ptext914
__ptext914:

;; *************** function _setPB0 *****************
;; Defined at:
;;		line 149 in file "D:\develop\190625\AK7030-OTP\main.c"
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
psect	text914
	file	"D:\develop\190625\AK7030-OTP\main.c"
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
	
l4293:	
;main.c: 150: if( bValue )
	movf	(setPB0@bValue),w
	skipz
	goto	u1360
	goto	l694
u1360:
	line	152
	
l4295:	
;main.c: 152: PB0 = 1;
	bsf	(48/8),(48)&7
	goto	l696
	line	156
	
l694:	
	line	158
;main.c: 156: else
;main.c: 158: PB0 = 0;
	bcf	(48/8),(48)&7
	line	162
	
l696:	
	return
	opt stack 0
GLOBAL	__end_of_setPB0
	__end_of_setPB0:
;; =============== function _setPB0 ends ============

	signat	_setPB0,4216
	global	_initPin
psect	text915,local,class=CODE,delta=2
global __ptext915
__ptext915:

;; *************** function _initPin *****************
;; Defined at:
;;		line 123 in file "D:\develop\190625\AK7030-OTP\main.c"
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
psect	text915
	file	"D:\develop\190625\AK7030-OTP\main.c"
	line	123
	global	__size_of_initPin
	__size_of_initPin	equ	__end_of_initPin-_initPin
	
_initPin:	
	opt	stack 5
; Regs used in _initPin: []
	line	125
	
l4291:	
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
	
l691:	
	return
	opt stack 0
GLOBAL	__end_of_initPin
	__end_of_initPin:
;; =============== function _initPin ends ============

	signat	_initPin,88
	global	_clearTwentySecondsTimer
psect	text916,local,class=CODE,delta=2
global __ptext916
__ptext916:

;; *************** function _clearTwentySecondsTimer *****************
;; Defined at:
;;		line 387 in file "D:\develop\190625\AK7030-OTP\common.c"
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
psect	text916
	file	"D:\develop\190625\AK7030-OTP\common.c"
	line	387
	global	__size_of_clearTwentySecondsTimer
	__size_of_clearTwentySecondsTimer	equ	__end_of_clearTwentySecondsTimer-_clearTwentySecondsTimer
	
_clearTwentySecondsTimer:	
	opt	stack 4
; Regs used in _clearTwentySecondsTimer: [status,2]
	line	388
	
l4289:	
;common.c: 388: uiTwentySecondsTimer = 0;
	bsf	status, 5	;RP0=1, select bank1
	clrf	(_uiTwentySecondsTimer)^080h
	clrf	(_uiTwentySecondsTimer+1)^080h
	line	389
;common.c: 389: bTwentySecStartFlag = 0;
	bcf	status, 5	;RP0=0, select bank0
	clrf	(_bTwentySecStartFlag)
	line	390
	
l1839:	
	return
	opt stack 0
GLOBAL	__end_of_clearTwentySecondsTimer
	__end_of_clearTwentySecondsTimer:
;; =============== function _clearTwentySecondsTimer ends ============

	signat	_clearTwentySecondsTimer,88
	global	_clearThreeHoursTimer
psect	text917,local,class=CODE,delta=2
global __ptext917
__ptext917:

;; *************** function _clearThreeHoursTimer *****************
;; Defined at:
;;		line 381 in file "D:\develop\190625\AK7030-OTP\common.c"
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
psect	text917
	file	"D:\develop\190625\AK7030-OTP\common.c"
	line	381
	global	__size_of_clearThreeHoursTimer
	__size_of_clearThreeHoursTimer	equ	__end_of_clearThreeHoursTimer-_clearThreeHoursTimer
	
_clearThreeHoursTimer:	
	opt	stack 4
; Regs used in _clearThreeHoursTimer: [status,2]
	line	382
	
l4287:	
;common.c: 382: uiSmallTimer = 0;
	bsf	status, 5	;RP0=1, select bank1
	clrf	(_uiSmallTimer)^080h
	clrf	(_uiSmallTimer+1)^080h
	line	383
;common.c: 383: bSmallTimerStartFlag = 0;
	bcf	status, 5	;RP0=0, select bank0
	clrf	(_bSmallTimerStartFlag)
	line	384
	
l1836:	
	return
	opt stack 0
GLOBAL	__end_of_clearThreeHoursTimer
	__end_of_clearThreeHoursTimer:
;; =============== function _clearThreeHoursTimer ends ============

	signat	_clearThreeHoursTimer,88
	global	_clearTwelveHoursTimer
psect	text918,local,class=CODE,delta=2
global __ptext918
__ptext918:

;; *************** function _clearTwelveHoursTimer *****************
;; Defined at:
;;		line 374 in file "D:\develop\190625\AK7030-OTP\common.c"
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
psect	text918
	file	"D:\develop\190625\AK7030-OTP\common.c"
	line	374
	global	__size_of_clearTwelveHoursTimer
	__size_of_clearTwelveHoursTimer	equ	__end_of_clearTwelveHoursTimer-_clearTwelveHoursTimer
	
_clearTwelveHoursTimer:	
	opt	stack 4
; Regs used in _clearTwelveHoursTimer: [status,2]
	line	375
	
l4285:	
;common.c: 375: uiBigTimer = 0;
	bsf	status, 5	;RP0=1, select bank1
	clrf	(_uiBigTimer)^080h
	clrf	(_uiBigTimer+1)^080h
	line	376
;common.c: 376: bBigTimerStartFlag = 0;
	bcf	status, 5	;RP0=0, select bank0
	clrf	(_bBigTimerStartFlag)
	line	377
	
l1833:	
	return
	opt stack 0
GLOBAL	__end_of_clearTwelveHoursTimer
	__end_of_clearTwelveHoursTimer:
;; =============== function _clearTwelveHoursTimer ends ============

	signat	_clearTwelveHoursTimer,88
	global	_ISR
psect	text919,local,class=CODE,delta=2
global __ptext919
__ptext919:

;; *************** function _ISR *****************
;; Defined at:
;;		line 497 in file "D:\develop\190625\AK7030-OTP\common.c"
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
psect	text919
	file	"D:\develop\190625\AK7030-OTP\common.c"
	line	497
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
psect	text919
	line	500
	
i1l4595:	
;common.c: 498: static unsigned char ucTimer1sCnt = 0;
;common.c: 500: if(TMR1IF == 1)
	btfss	(96/8),(96)&7
	goto	u178_21
	goto	u178_20
u178_21:
	goto	i1l4615
u178_20:
	line	502
	
i1l4597:	
;common.c: 501: {
;common.c: 502: TMR1IF = 0 ;
	bcf	(96/8),(96)&7
	line	503
	
i1l4599:	
;common.c: 503: timer.timer10msStopWatch++;
	bsf	status, 5	;RP0=1, select bank1
	incf	(_timer)^080h,f
	line	504
;common.c: 504: ucTimer1sCnt++;
	incf	(ISR@ucTimer1sCnt)^080h,f
	line	506
	
i1l4601:	
;common.c: 506: if(ucTimer1sCnt >= 100)
	movlw	(064h)
	subwf	(ISR@ucTimer1sCnt)^080h,w
	skipc
	goto	u179_21
	goto	u179_20
u179_21:
	goto	i1l4615
u179_20:
	line	508
	
i1l4603:	
;common.c: 507: {
;common.c: 508: ucTimer1sCnt = 0;
	clrf	(ISR@ucTimer1sCnt)^080h
	line	509
	
i1l4605:	
;common.c: 509: if(uiBigTimer > 0)
	movf	(_uiBigTimer+1)^080h,w
	iorwf	(_uiBigTimer)^080h,w
	skipnz
	goto	u180_21
	goto	u180_20
u180_21:
	goto	i1l1889
u180_20:
	line	510
	
i1l4607:	
;common.c: 510: uiBigTimer--;
	movlw	low(01h)
	subwf	(_uiBigTimer)^080h,f
	movlw	high(01h)
	skipc
	decf	(_uiBigTimer+1)^080h,f
	subwf	(_uiBigTimer+1)^080h,f
	
i1l1889:	
	line	512
;common.c: 512: if(uiSmallTimer)
	movf	(_uiSmallTimer+1)^080h,w
	iorwf	(_uiSmallTimer)^080h,w
	skipnz
	goto	u181_21
	goto	u181_20
u181_21:
	goto	i1l1890
u181_20:
	line	513
	
i1l4609:	
;common.c: 513: uiSmallTimer--;
	movlw	low(01h)
	subwf	(_uiSmallTimer)^080h,f
	movlw	high(01h)
	skipc
	decf	(_uiSmallTimer+1)^080h,f
	subwf	(_uiSmallTimer+1)^080h,f
	
i1l1890:	
	line	515
;common.c: 515: if(uiTwentySecondsTimer)
	movf	(_uiTwentySecondsTimer+1)^080h,w
	iorwf	(_uiTwentySecondsTimer)^080h,w
	skipnz
	goto	u182_21
	goto	u182_20
u182_21:
	goto	i1l1891
u182_20:
	line	516
	
i1l4611:	
;common.c: 516: uiTwentySecondsTimer--;
	movlw	low(01h)
	subwf	(_uiTwentySecondsTimer)^080h,f
	movlw	high(01h)
	skipc
	decf	(_uiTwentySecondsTimer+1)^080h,f
	subwf	(_uiTwentySecondsTimer+1)^080h,f
	
i1l1891:	
	line	518
;common.c: 518: if(uiTwentyMinTimer)
	movf	(_uiTwentyMinTimer+1)^080h,w
	iorwf	(_uiTwentyMinTimer)^080h,w
	skipnz
	goto	u183_21
	goto	u183_20
u183_21:
	goto	i1l4615
u183_20:
	line	519
	
i1l4613:	
;common.c: 519: uiTwentyMinTimer--;
	movlw	low(01h)
	subwf	(_uiTwentyMinTimer)^080h,f
	movlw	high(01h)
	skipc
	decf	(_uiTwentyMinTimer+1)^080h,f
	subwf	(_uiTwentyMinTimer+1)^080h,f
	line	523
	
i1l4615:	
;common.c: 520: }
;common.c: 521: }
;common.c: 523: if(ADIF)
	bcf	status, 5	;RP0=0, select bank0
	btfss	(106/8),(106)&7
	goto	u184_21
	goto	u184_20
u184_21:
	goto	i1l1898
u184_20:
	line	525
	
i1l4617:	
;common.c: 524: {
;common.c: 525: ADIF=0;
	bcf	(106/8),(106)&7
	line	526
	
i1l4619:	
;common.c: 526: setAD_ConvertFlag(1);
	movlw	(01h)
	fcall	i1_setAD_ConvertFlag
	line	528
	
i1l4621:	
;common.c: 528: if(sampleChannelSelect == 5)
	bcf	status, 5	;RP0=0, select bank0
	movf	(_sampleChannelSelect),w
	xorlw	05h
	skipz
	goto	u185_21
	goto	u185_20
u185_21:
	goto	i1l4625
u185_20:
	line	532
	
i1l4623:	
;common.c: 529: {
;common.c: 532: vPutSampleDataIntoTable(adc_get(),5);
	fcall	_adc_get
	movf	(1+(?_adc_get)),w
	movwf	(?_vPutSampleDataIntoTable+1)
	movf	(0+(?_adc_get)),w
	movwf	(?_vPutSampleDataIntoTable)
	movlw	(05h)
	movwf	0+(?_vPutSampleDataIntoTable)+02h
	fcall	_vPutSampleDataIntoTable
	line	536
;common.c: 536: }
	goto	i1l1898
	line	537
	
i1l4625:	
;common.c: 537: else if(sampleChannelSelect == 1)
	decf	(_sampleChannelSelect),w
	skipz
	goto	u186_21
	goto	u186_20
u186_21:
	goto	i1l4629
u186_20:
	line	540
	
i1l4627:	
;common.c: 538: {
;common.c: 540: vPutSampleDataIntoTable(adc_get(),1);
	fcall	_adc_get
	movf	(1+(?_adc_get)),w
	movwf	(?_vPutSampleDataIntoTable+1)
	movf	(0+(?_adc_get)),w
	movwf	(?_vPutSampleDataIntoTable)
	clrf	0+(?_vPutSampleDataIntoTable)+02h
	incf	0+(?_vPutSampleDataIntoTable)+02h,f
	fcall	_vPutSampleDataIntoTable
	line	545
;common.c: 545: }
	goto	i1l1898
	line	551
	
i1l4629:	
;common.c: 546: else
;common.c: 547: {
;common.c: 551: vPutSampleDataIntoTable(adc_get(),14);
	fcall	_adc_get
	movf	(1+(?_adc_get)),w
	movwf	(?_vPutSampleDataIntoTable+1)
	movf	(0+(?_adc_get)),w
	movwf	(?_vPutSampleDataIntoTable)
	movlw	(0Eh)
	movwf	0+(?_vPutSampleDataIntoTable)+02h
	fcall	_vPutSampleDataIntoTable
	line	556
	
i1l1898:	
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
psect	text920,local,class=CODE,delta=2
global __ptext920
__ptext920:

;; *************** function i1_setAD_ConvertFlag *****************
;; Defined at:
;;		line 212 in file "D:\develop\190625\AK7030-OTP\common.c"
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
psect	text920
	file	"D:\develop\190625\AK7030-OTP\common.c"
	line	212
	global	__size_ofi1_setAD_ConvertFlag
	__size_ofi1_setAD_ConvertFlag	equ	__end_ofi1_setAD_ConvertFlag-i1_setAD_ConvertFlag
	
i1_setAD_ConvertFlag:	
	opt	stack 3
; Regs used in i1_setAD_ConvertFlag: [wreg]
;i1setAD_ConvertFlag@flag stored from wreg
	movwf	(i1setAD_ConvertFlag@flag)
	line	213
	
i1l4635:	
;common.c: 213: adc_convert_flag = flag;
	movf	(i1setAD_ConvertFlag@flag),w
	bsf	status, 5	;RP0=1, select bank1
	movwf	(_adc_convert_flag)^080h
	line	214
	
i1l1795:	
	return
	opt stack 0
GLOBAL	__end_ofi1_setAD_ConvertFlag
	__end_ofi1_setAD_ConvertFlag:
;; =============== function i1_setAD_ConvertFlag ends ============

	signat	i1_setAD_ConvertFlag,88
	global	_adc_get
psect	text921,local,class=CODE,delta=2
global __ptext921
__ptext921:

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
psect	text921
	file	"D:\develop\190625\AK7030-OTP\periph.c"
	line	105
	global	__size_of_adc_get
	__size_of_adc_get	equ	__end_of_adc_get-_adc_get
	
_adc_get:	
	opt	stack 3
; Regs used in _adc_get: [wreg]
	line	107
	
i1l4631:	
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
	
i1l2554:	
	return
	opt stack 0
GLOBAL	__end_of_adc_get
	__end_of_adc_get:
;; =============== function _adc_get ends ============

	signat	_adc_get,90
	global	_vPutSampleDataIntoTable
psect	text922,local,class=CODE,delta=2
global __ptext922
__ptext922:

;; *************** function _vPutSampleDataIntoTable *****************
;; Defined at:
;;		line 103 in file "D:\develop\190625\AK7030-OTP\common.c"
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
psect	text922
	file	"D:\develop\190625\AK7030-OTP\common.c"
	line	103
	global	__size_of_vPutSampleDataIntoTable
	__size_of_vPutSampleDataIntoTable	equ	__end_of_vPutSampleDataIntoTable-_vPutSampleDataIntoTable
	
_vPutSampleDataIntoTable:	
	opt	stack 3
; Regs used in _vPutSampleDataIntoTable: [wreg-fsr0h+status,2+status,0+btemp+1]
	line	111
	
i1l4519:	
;common.c: 105: static unsigned char ucChannelFirstLength = 0;
;common.c: 107: static unsigned char ucChannelFourthLength = 0;
;common.c: 109: static unsigned char ucChannelFourteenthLength = 0;
;common.c: 111: if(channel == 1)
	decf	(vPutSampleDataIntoTable@channel),w
	skipz
	goto	u166_21
	goto	u166_20
u166_21:
	goto	i1l4531
u166_20:
	line	113
	
i1l4521:	
;common.c: 112: {
;common.c: 113: if(ucChannelFirstLength < 12)
	movlw	(0Ch)
	subwf	(vPutSampleDataIntoTable@ucChannelFirstLength),w
	skipnc
	goto	u167_21
	goto	u167_20
u167_21:
	goto	i1l4527
u167_20:
	line	115
	
i1l4523:	
;common.c: 114: {
;common.c: 115: uiSampleChannelFirst[ucChannelFirstLength] = uiSampleData;
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
	line	117
	
i1l4525:	
;common.c: 117: ucChannelFirstLength++;
	incf	(vPutSampleDataIntoTable@ucChannelFirstLength),f
	line	118
;common.c: 118: }
	goto	i1l1777
	line	121
	
i1l4527:	
;common.c: 119: else
;common.c: 120: {
;common.c: 121: ucChannelFirstLength = 0;
	clrf	(vPutSampleDataIntoTable@ucChannelFirstLength)
	line	123
	
i1l4529:	
;common.c: 123: uiSampleChannelFirst[ucChannelFirstLength] = uiSampleData;
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
	goto	i1l1777
	line	126
	
i1l4531:	
;common.c: 126: else if(channel == 5)
	movf	(vPutSampleDataIntoTable@channel),w
	xorlw	05h
	skipz
	goto	u168_21
	goto	u168_20
u168_21:
	goto	i1l4543
u168_20:
	line	128
	
i1l4533:	
;common.c: 127: {
;common.c: 128: if(ucChannelFourthLength < 12)
	movlw	(0Ch)
	bcf	status, 5	;RP0=0, select bank0
	subwf	(vPutSampleDataIntoTable@ucChannelFourthLength),w
	skipnc
	goto	u169_21
	goto	u169_20
u169_21:
	goto	i1l4539
u169_20:
	line	130
	
i1l4535:	
;common.c: 129: {
;common.c: 130: uiSampleChannelFourth[ucChannelFourthLength] = uiSampleData;
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
	line	132
	
i1l4537:	
;common.c: 132: ucChannelFourthLength++;
	incf	(vPutSampleDataIntoTable@ucChannelFourthLength),f
	line	133
;common.c: 133: }
	goto	i1l1777
	line	136
	
i1l4539:	
;common.c: 134: else
;common.c: 135: {
;common.c: 136: ucChannelFourthLength = 0;
	clrf	(vPutSampleDataIntoTable@ucChannelFourthLength)
	line	138
	
i1l4541:	
;common.c: 138: uiSampleChannelFourth[ucChannelFourthLength] = uiSampleData;
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
	goto	i1l1777
	line	141
	
i1l4543:	
;common.c: 141: else if(channel == 14)
	movf	(vPutSampleDataIntoTable@channel),w
	xorlw	0Eh
	skipz
	goto	u170_21
	goto	u170_20
u170_21:
	goto	i1l4555
u170_20:
	line	143
	
i1l4545:	
;common.c: 142: {
;common.c: 143: if(ucChannelFourteenthLength < 12)
	movlw	(0Ch)
	bcf	status, 5	;RP0=0, select bank0
	subwf	(vPutSampleDataIntoTable@ucChannelFourteenthLength),w
	skipnc
	goto	u171_21
	goto	u171_20
u171_21:
	goto	i1l4551
u171_20:
	line	145
	
i1l4547:	
;common.c: 144: {
;common.c: 145: uiSampleChannelFourteenth[ucChannelFourteenthLength] = uiSampleData;
	clrc
	rlf	(vPutSampleDataIntoTable@ucChannelFourteenthLength),w
	addlw	_uiSampleChannelFourteenth&0ffh
	movwf	fsr0
	movf	(vPutSampleDataIntoTable@uiSampleData),w
	bsf	status, 7	;select IRP bank3
	movwf	indf
	incf	fsr0,f
	movf	(vPutSampleDataIntoTable@uiSampleData+1),w
	movwf	indf
	line	147
	
i1l4549:	
;common.c: 147: ucChannelFourteenthLength++;
	incf	(vPutSampleDataIntoTable@ucChannelFourteenthLength),f
	line	148
;common.c: 148: }
	goto	i1l1777
	line	151
	
i1l4551:	
;common.c: 149: else
;common.c: 150: {
;common.c: 151: ucChannelFourteenthLength = 0;
	clrf	(vPutSampleDataIntoTable@ucChannelFourteenthLength)
	line	153
	
i1l4553:	
;common.c: 153: uiSampleChannelFourth[ucChannelFourteenthLength] = uiSampleData;
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
	goto	i1l1777
	line	158
	
i1l4555:	
;common.c: 156: else
;common.c: 157: {
;common.c: 158: ucChannelFirstLength = 0;
	clrf	(vPutSampleDataIntoTable@ucChannelFirstLength)
	line	160
;common.c: 160: ucChannelFourthLength = 0;
	bcf	status, 5	;RP0=0, select bank0
	clrf	(vPutSampleDataIntoTable@ucChannelFourthLength)
	line	162
;common.c: 162: ucChannelFourteenthLength = 0;
	clrf	(vPutSampleDataIntoTable@ucChannelFourteenthLength)
	line	164
;common.c: 164: for(int i = 0;i < 12; i++)
	clrf	(vPutSampleDataIntoTable@i)
	clrf	(vPutSampleDataIntoTable@i+1)
	line	166
	
i1l4561:	
;common.c: 165: {
;common.c: 166: uiSampleChannelFirst[i] = 0;
	clrc
	rlf	(vPutSampleDataIntoTable@i),w
	addlw	_uiSampleChannelFirst&0ffh
	movwf	fsr0
	bcf	status, 7	;select IRP bank1
	clrf	indf
	incf	fsr0,f
	clrf	indf
	line	168
;common.c: 168: uiSampleChannelFourth[i] = 0;
	clrc
	rlf	(vPutSampleDataIntoTable@i),w
	addlw	_uiSampleChannelFourth&0ffh
	movwf	fsr0
	clrf	indf
	incf	fsr0,f
	clrf	indf
	line	170
;common.c: 170: uiSampleChannelFourth[i] = 0;
	clrc
	rlf	(vPutSampleDataIntoTable@i),w
	addlw	_uiSampleChannelFourth&0ffh
	movwf	fsr0
	clrf	indf
	incf	fsr0,f
	clrf	indf
	line	164
	
i1l4563:	
	incf	(vPutSampleDataIntoTable@i),f
	skipnz
	incf	(vPutSampleDataIntoTable@i+1),f
	
i1l4565:	
	movf	(vPutSampleDataIntoTable@i+1),w
	xorlw	80h
	movwf	btemp+1
	movlw	(high(0Ch))^80h
	subwf	btemp+1,w
	skipz
	goto	u172_25
	movlw	low(0Ch)
	subwf	(vPutSampleDataIntoTable@i),w
u172_25:

	skipc
	goto	u172_21
	goto	u172_20
u172_21:
	goto	i1l4561
u172_20:
	line	174
	
i1l1777:	
	return
	opt stack 0
GLOBAL	__end_of_vPutSampleDataIntoTable
	__end_of_vPutSampleDataIntoTable:
;; =============== function _vPutSampleDataIntoTable ends ============

	signat	_vPutSampleDataIntoTable,8312
psect	text923,local,class=CODE,delta=2
global __ptext923
__ptext923:
	global	btemp
	btemp set 07Eh

	DABS	1,126,2	;btemp
	global	wtemp0
	wtemp0 set btemp
	end
