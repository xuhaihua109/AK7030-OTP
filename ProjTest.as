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
	FNCALL	_main,_getAdOriginaCh4Value
	FNCALL	_main,_startTwentySecondsTimer
	FNCALL	_main,_isFinishedTwentySecondsTimer
	FNCALL	_main,_clearTwentySecondsTimer
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
	global	_sampleTimes
	global	main@bCheckTweHour
	global	main@enumBranchStep
	global	main@enumMainLoopStep
	global	main@ucADC4_Step
	global	main@ucChannel4Type
	global	main@ucCheckTimerP2sLess
	global	main@ucCheckTimerP2sMore
	global	main@ucDelayPrefix4TimerP5s
	global	main@ucDelayPrefix6TimerP2s
	global	main@ucFourthSuffix1TimerP3s
	global	main@ucLoaderStep
	global	main@ucLoaderStep1
	global	main@ucLoaderStep2
	global	main@ucLoaderStep3
	global	main@ucLoaderStep4
	global	main@ucTimer20s
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
	global	main@ucTimerLessX1P5s
	global	main@ucTimerP5s
	global	main@ucTimerRightP5s
	global	main@ucTimerX1P5s
	global	main@ucTimerZeroPoint3s
	global	main@ucTimerZeroPoint5s
	global	vPutSampleDataIntoTable@ucChannelFourteenthLength
	global	vPutSampleDataIntoTable@ucChannelFourthLength
	global	vPutSampleDataIntoTable@ucChannelFirstLength
	global	_uiBigTimer
	global	_uiSmallTimer
	global	_uiTwentySecondsTimer
	global	ISR@ucTimer1sCnt
	global	_adc_convert_flag
	global	_timer
	global	main@enumInteralStep
	global	main@ucTimer1s
	global	main@ucTimerLessX2P5s
	global	main@ucTimerP3s
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
_sampleTimes:
       ds      1

main@bCheckTweHour:
       ds      1

main@enumBranchStep:
       ds      1

main@enumMainLoopStep:
       ds      1

main@ucADC4_Step:
       ds      1

main@ucChannel4Type:
       ds      1

main@ucCheckTimerP2sLess:
       ds      1

main@ucCheckTimerP2sMore:
       ds      1

main@ucDelayPrefix4TimerP5s:
       ds      1

main@ucDelayPrefix6TimerP2s:
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

main@ucTimerLessX1P5s:
       ds      1

main@ucTimerP5s:
       ds      1

main@ucTimerRightP5s:
       ds      1

main@ucTimerX1P5s:
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

_adc_convert_flag:
       ds      1

_timer:
       ds      1

main@enumInteralStep:
       ds      1

main@ucTimer1s:
       ds      1

main@ucTimerLessX2P5s:
       ds      1

main@ucTimerP3s:
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
	movlw	low((__pbssBANK1)+03Eh)
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
;;Data sizes: Strings 0, constant 0, data 1, bss 125, persistent 0 stack 0
;;Auto spaces:   Size  Autos    Used
;; COMMON          14     13      14
;; BANK0           80     40      79
;; BANK1           80      0      62
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
;;               _getAdOriginaCh4Value
;;            _startTwentySecondsTimer
;;       _isFinishedTwentySecondsTimer
;;            _clearTwentySecondsTimer
;;               _startThreeHoursTimer
;;          _isFinishedThreeHoursTimer
;;               _clearThreeHoursTimer
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
;;   _getAdOriginaCh4Value
;;     _Filter
;;   _startTwentySecondsTimer
;;   _isFinishedTwentySecondsTimer
;;   _clearTwentySecondsTimer
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
;;BANK1               50      0      3E       8       77.5%
;;BITBANK1            50      0       0       7        0.0%
;;CODE                 0      0       0       0        0.0%
;;DATA                 0      0      BA       6        0.0%
;;ABS                  0      0      B3       3        0.0%
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
;;		line 137 in file "D:\develop\190625\AK7030-OTP\main.c"
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
;;		_getAdOriginaCh4Value
;;		_startTwentySecondsTimer
;;		_isFinishedTwentySecondsTimer
;;		_clearTwentySecondsTimer
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
	line	137
	global	__size_of_main
	__size_of_main	equ	__end_of_main-_main
	
_main:	
	opt	stack 3
; Regs used in _main: [wreg-fsr0h+status,2+status,0+btemp+1+pclath+cstack]
	line	170
	
l4357:	
;main.c: 138: enum setp_Adc4
;main.c: 139: {
;main.c: 140: ADC4_STEP_INIT = 0,
;main.c: 141: ADC4_STEP_FIRST,
;main.c: 142: ADC4_STEP_SECOND,
;main.c: 143: ADC4_STEP_THIRD,
;main.c: 144: ADC4_STEP_FOURTH_PREFIX1,
;main.c: 145: ADC4_STEP_FOURTH_PREFIX2,
;main.c: 146: ADC4_STEP_FOURTH_PREFIX3,
;main.c: 147: ADC4_STEP_FOURTH_PREFIX4,
;main.c: 148: ADC4_STEP_FOURTH_PREFIX5,
;main.c: 149: ADC4_STEP_FOURTH_PREFIX6,
;main.c: 150: ADC4_STEP_FOURTH,
;main.c: 151: ADC4_STEP_FOURTH_SUFFIX1,
;main.c: 152: ADC4_STEP_FOURTH_SUFFIX2,
	bsf	status, 5	;RP0=1, select bank1
	bcf	(1064/8)^080h,(1064)&7
	line	171
;main.c: 171: TRISA1 = 0;
	bcf	(1065/8)^080h,(1065)&7
	line	172
;main.c: 172: TRISA2 = 0;
	bcf	(1066/8)^080h,(1066)&7
	line	173
;main.c: 173: TRISA3 = 0;
	bcf	(1067/8)^080h,(1067)&7
	line	174
;main.c: 174: TRISB0 = 0;
	bcf	(1072/8)^080h,(1072)&7
	line	175
;main.c: 175: TRISB1 = 0;
	bcf	(1073/8)^080h,(1073)&7
	line	176
;main.c: 176: TRISA6 = 0;
	bcf	(1070/8)^080h,(1070)&7
	line	178
;main.c: 178: TRISB7 = 0;
	bcf	(1079/8)^080h,(1079)&7
	line	179
;main.c: 179: TRISB6 = 0;
	bcf	(1078/8)^080h,(1078)&7
	line	182
	
l4359:	
;main.c: 182: initPin();
	fcall	_initPin
	line	185
	
l4361:	
;main.c: 185: TRISB2 = 1;
	bcf	status, 6	;RP1=0, select bank1
	bsf	(1074/8)^080h,(1074)&7
	line	188
	
l4363:	
;main.c: 188: TRISA7 = 1;
	bsf	(1071/8)^080h,(1071)&7
	line	190
	
l4365:	
;main.c: 190: TRISB4 = 1;
	bsf	(1076/8)^080h,(1076)&7
	line	192
	
l4367:	
;main.c: 192: clock_config();
	fcall	_clock_config
	line	193
	
l4369:	
;main.c: 193: timer1_config();
	fcall	_timer1_config
	line	194
;main.c: 194: timer1_interrupt_config();
	fcall	_timer1_interrupt_config
	line	196
	
l4371:	
;main.c: 196: adc_test_init(14,3);
	movlw	(03h)
	bcf	status, 5	;RP0=0, select bank0
	movwf	(?_adc_test_init)
	movlw	(0Eh)
	fcall	_adc_test_init
	line	198
	
l4373:	
;main.c: 198: dac_init();
	fcall	_dac_init
	line	199
	
l4375:	
;main.c: 199: op1_init();
	fcall	_op1_init
	line	200
	
l4377:	
;main.c: 200: op2_init();
	fcall	_op2_init
	line	203
;main.c: 203: adc_start();
	fcall	_adc_start
	line	241
	
l4379:	
# 241 "D:\develop\190625\AK7030-OTP\main.c"
 clrwdt ;#
psect	maintext
	line	243
	
l4381:	
;main.c: 243: process_AD_Converter_Value();
	fcall	_process_AD_Converter_Value
	line	245
	
l4383:	
;main.c: 245: if(isPermitSampleTime())
	fcall	_isPermitSampleTime
	xorlw	0
	skipnz
	goto	u1421
	goto	u1420
u1421:
	goto	l4379
u1420:
	line	247
	
l4385:	
;main.c: 246: {
;main.c: 247: clrSampeTime();
	fcall	_clrSampeTime
	line	261
;main.c: 261: switch(enumMainLoopStep)
	goto	l4999
	line	266
	
l4387:	
;main.c: 264: {
;main.c: 265: static unsigned char ucTimerZeroPoint5s = 0;
;main.c: 266: if(getAdOriginalCh14Value() > 1950)
	fcall	_getAdOriginalCh14Value
	movlw	high(079Fh)
	subwf	(1+(?_getAdOriginalCh14Value)),w
	movlw	low(079Fh)
	skipnz
	subwf	(0+(?_getAdOriginalCh14Value)),w
	skipc
	goto	u1431
	goto	u1430
u1431:
	goto	l4391
u1430:
	line	268
	
l4389:	
;main.c: 267: {
;main.c: 268: ucTimerZeroPoint5s++;
	incf	(main@ucTimerZeroPoint5s),f
	line	269
;main.c: 269: }
	goto	l4393
	line	271
	
l4391:	
;main.c: 270: else
;main.c: 271: ucTimerZeroPoint5s = 0;
	clrf	(main@ucTimerZeroPoint5s)
	line	273
	
l4393:	
;main.c: 273: if(ucTimerZeroPoint5s >= 5)
	movlw	(05h)
	subwf	(main@ucTimerZeroPoint5s),w
	skipc
	goto	u1441
	goto	u1440
u1441:
	goto	l4379
u1440:
	line	275
	
l4395:	
;main.c: 274: {
;main.c: 275: ucTimerZeroPoint5s = 0;
	clrf	(main@ucTimerZeroPoint5s)
	line	276
	
l4397:	
;main.c: 276: enumMainLoopStep = MAIN_LOOP_STEP_FIRST;
	clrf	(main@enumMainLoopStep)
	incf	(main@enumMainLoopStep),f
	goto	l4379
	line	277
	
l712:	
	line	278
;main.c: 277: }
;main.c: 278: break;
	goto	l4379
	line	286
	
l4399:	
;main.c: 282: {
;main.c: 283: static unsigned char ucTimerZeroPoint3s = 0;
;main.c: 286: if(getAdOriginalCh14Value() > 1950)
	fcall	_getAdOriginalCh14Value
	movlw	high(079Fh)
	subwf	(1+(?_getAdOriginalCh14Value)),w
	movlw	low(079Fh)
	skipnz
	subwf	(0+(?_getAdOriginalCh14Value)),w
	skipc
	goto	u1451
	goto	u1450
u1451:
	goto	l4405
u1450:
	line	289
	
l4401:	
;main.c: 287: {
;main.c: 289: enumMainLoopStep = MAIN_LOOP_STEP_SECOND;
	movlw	(02h)
	movwf	(main@enumMainLoopStep)
	line	291
	
l4403:	
;main.c: 291: ucTimerZeroPoint3s = 0;
	clrf	(main@ucTimerZeroPoint3s)
	line	293
;main.c: 293: }
	goto	l4379
	line	296
	
l4405:	
;main.c: 294: else
;main.c: 295: {
;main.c: 296: ucTimerZeroPoint3s++;
	incf	(main@ucTimerZeroPoint3s),f
	line	298
	
l4407:	
;main.c: 298: if(ucTimerZeroPoint3s >= 3)
	movlw	(03h)
	subwf	(main@ucTimerZeroPoint3s),w
	skipc
	goto	u1461
	goto	u1460
u1461:
	goto	l712
u1460:
	line	300
	
l4409:	
;main.c: 299: {
;main.c: 300: ucTimerZeroPoint3s = 0;
	clrf	(main@ucTimerZeroPoint3s)
	line	302
	
l4411:	
;main.c: 302: clearPinPortAndTimer();
	fcall	_clearPinPortAndTimer
	goto	l4379
	line	309
;main.c: 307: }
;main.c: 309: case MAIN_LOOP_STEP_SECOND:
	
l720:	
	line	313
;main.c: 310: {
;main.c: 311: static unsigned char ucTimerP5s = 0;
;main.c: 313: PA6 = 1;
	bsf	(46/8),(46)&7
	line	315
	
l4413:	
;main.c: 315: if(ucTimerP5s < 5)
	movlw	(05h)
	subwf	(main@ucTimerP5s),w
	skipnc
	goto	u1471
	goto	u1470
u1471:
	goto	l4417
u1470:
	line	316
	
l4415:	
;main.c: 316: ucTimerP5s++;
	incf	(main@ucTimerP5s),f
	goto	l4379
	line	319
	
l4417:	
;main.c: 317: else
;main.c: 318: {
;main.c: 319: ucTimerP5s = 0;
	clrf	(main@ucTimerP5s)
	line	321
	
l4419:	
;main.c: 321: enumMainLoopStep = MAIN_LOOP_STEP_THIRD;
	movlw	(03h)
	movwf	(main@enumMainLoopStep)
	goto	l4379
	line	337
	
l4421:	
;main.c: 328: {
;main.c: 329: static unsigned char ucTimerADC1ZeroP5s = 0;
;main.c: 331: static unsigned char ucTimerLessADC1ZeroP5s = 0;
;main.c: 333: static unsigned char ucTimerLessADC1ZeroP5sFlag = 0;
;main.c: 335: static unsigned char ucTimerRightP5s = 0;
;main.c: 337: if(getAdOriginalCh1Value() < 115)
	fcall	_getAdOriginalCh1Value
	movlw	high(073h)
	subwf	(1+(?_getAdOriginalCh1Value)),w
	movlw	low(073h)
	skipnz
	subwf	(0+(?_getAdOriginalCh1Value)),w
	skipnc
	goto	u1481
	goto	u1480
u1481:
	goto	l4427
u1480:
	line	339
	
l4423:	
;main.c: 338: {
;main.c: 339: ucTimerADC1ZeroP5s = 0;
	clrf	(main@ucTimerADC1ZeroP5s)
	line	341
	
l4425:	
;main.c: 341: ucTimerLessADC1ZeroP5s++;
	incf	(main@ucTimerLessADC1ZeroP5s),f
	line	342
;main.c: 342: }
	goto	l4431
	line	345
	
l4427:	
;main.c: 343: else
;main.c: 344: {
;main.c: 345: ucTimerADC1ZeroP5s++;
	incf	(main@ucTimerADC1ZeroP5s),f
	line	347
	
l4429:	
;main.c: 347: ucTimerLessADC1ZeroP5s = 0;
	clrf	(main@ucTimerLessADC1ZeroP5s)
	line	350
	
l4431:	
;main.c: 348: }
;main.c: 350: if(ucTimerADC1ZeroP5s >= 3)
	movlw	(03h)
	subwf	(main@ucTimerADC1ZeroP5s),w
	skipc
	goto	u1491
	goto	u1490
u1491:
	goto	l4437
u1490:
	line	352
	
l4433:	
;main.c: 351: {
;main.c: 352: ucTimerADC1ZeroP5s = 0;
	clrf	(main@ucTimerADC1ZeroP5s)
	line	353
	
l4435:	
;main.c: 353: enumMainLoopStep = MAIN_LOOP_STEP_FOURTH;
	movlw	(04h)
	movwf	(main@enumMainLoopStep)
	line	354
;main.c: 354: }
	goto	l4451
	line	355
	
l4437:	
;main.c: 355: else if( ucTimerLessADC1ZeroP5s >= 3)
	movlw	(03h)
	subwf	(main@ucTimerLessADC1ZeroP5s),w
	skipc
	goto	u1501
	goto	u1500
u1501:
	goto	l4451
u1500:
	line	358
	
l4439:	
;main.c: 356: {
;main.c: 358: if(getAdOriginalCh1Value() < 105)
	fcall	_getAdOriginalCh1Value
	movlw	high(069h)
	subwf	(1+(?_getAdOriginalCh1Value)),w
	movlw	low(069h)
	skipnz
	subwf	(0+(?_getAdOriginalCh1Value)),w
	skipnc
	goto	u1511
	goto	u1510
u1511:
	goto	l4443
u1510:
	line	360
	
l4441:	
;main.c: 359: {
;main.c: 360: ucTimerRightP5s++;
	incf	(main@ucTimerRightP5s),f
	line	361
;main.c: 361: }
	goto	l4445
	line	364
	
l4443:	
;main.c: 362: else
;main.c: 363: {
;main.c: 364: ucTimerRightP5s = 0;
	clrf	(main@ucTimerRightP5s)
	line	367
	
l4445:	
;main.c: 365: }
;main.c: 367: if(ucTimerRightP5s >= 3)
	movlw	(03h)
	subwf	(main@ucTimerRightP5s),w
	skipc
	goto	u1521
	goto	u1520
u1521:
	goto	l743
u1520:
	line	369
	
l4447:	
;main.c: 368: {
;main.c: 369: ucTimerLessADC1ZeroP5s = 0;
	clrf	(main@ucTimerLessADC1ZeroP5s)
	line	370
;main.c: 370: ucTimerRightP5s = 0;
	clrf	(main@ucTimerRightP5s)
	line	371
	
l4449:	
;main.c: 371: enumMainLoopStep = MAIN_LOOP_STEP_3_HOUR_BRANCH;
	movlw	(08h)
	movwf	(main@enumMainLoopStep)
	line	372
;main.c: 372: }
	goto	l4451
	line	381
;main.c: 378: else
;main.c: 379: {
;main.c: 380: ;
	
l743:	
	line	383
	
l4451:	
;main.c: 381: }
;main.c: 383: if((MAIN_LOOP_STEP_3_HOUR_BRANCH == enumMainLoopStep) || (MAIN_LOOP_STEP_FOURTH == enumMainLoopStep))
	movf	(main@enumMainLoopStep),w
	xorlw	08h
	skipnz
	goto	u1531
	goto	u1530
u1531:
	goto	l4455
u1530:
	
l4453:	
	movf	(main@enumMainLoopStep),w
	xorlw	04h
	skipz
	goto	u1541
	goto	u1540
u1541:
	goto	l712
u1540:
	line	385
	
l4455:	
;main.c: 384: {
;main.c: 385: ucTimerRightP5s = 0;
	clrf	(main@ucTimerRightP5s)
	line	386
;main.c: 386: ucTimerADC1ZeroP5s = 0;
	clrf	(main@ucTimerADC1ZeroP5s)
	line	387
;main.c: 387: ucTimerLessADC1ZeroP5s = 0;
	clrf	(main@ucTimerLessADC1ZeroP5s)
	goto	l4379
	line	397
	
l4457:	
;main.c: 395: {
;main.c: 397: startTwelveHourTimer(43200);
	movlw	low(0A8C0h)
	movwf	(?_startTwelveHourTimer)
	movlw	high(0A8C0h)
	movwf	((?_startTwelveHourTimer))+1
	fcall	_startTwelveHourTimer
	line	398
	
l4459:	
;main.c: 398: enumMainLoopStep = MAIN_LOOP_STEP_FIFTH;
	movlw	(05h)
	bcf	status, 5	;RP0=0, select bank0
	movwf	(main@enumMainLoopStep)
	line	400
	
l4461:	
;main.c: 400: bCheckTweHour = 0;
	clrf	(main@bCheckTweHour)
	line	402
;main.c: 402: break;
	goto	l4379
	line	408
	
l4463:	
;main.c: 406: {
;main.c: 408: if(( isFinishedTwelveHoursTimer() && (! bCheckTweHour)))
	fcall	_isFinishedTwelveHoursTimer
	xorlw	0
	skipnz
	goto	u1551
	goto	u1550
u1551:
	goto	l4879
u1550:
	
l4465:	
	bcf	status, 5	;RP0=0, select bank0
	movf	(main@bCheckTweHour),f
	skipz
	goto	u1561
	goto	u1560
u1561:
	goto	l4879
u1560:
	line	410
	
l4467:	
;main.c: 409: {
;main.c: 410: enumMainLoopStep = MAIN_LOOP_STEP_12_HOUR_END;
	movlw	(09h)
	movwf	(main@enumMainLoopStep)
	line	411
	
l4469:	
;main.c: 411: bCheckTweHour = 1;
	clrf	(main@bCheckTweHour)
	incf	(main@bCheckTweHour),f
	line	412
;main.c: 412: }
	goto	l4379
	line	419
;main.c: 418: {
;main.c: 419: case ADC4_STEP_INIT:
	
l754:	
	line	422
;main.c: 420: {
;main.c: 422: ucADC4_Step = ADC4_STEP_FIRST;
	clrf	(main@ucADC4_Step)
	incf	(main@ucADC4_Step),f
	line	423
;main.c: 423: break;
	goto	l4379
	line	428
	
l4471:	
;main.c: 427: {
;main.c: 428: if(getAdOriginaCh4Value() < 1931)
	fcall	_getAdOriginaCh4Value
	movlw	high(078Bh)
	subwf	(1+(?_getAdOriginaCh4Value)),w
	movlw	low(078Bh)
	skipnz
	subwf	(0+(?_getAdOriginaCh4Value)),w
	skipnc
	goto	u1571
	goto	u1570
u1571:
	goto	l4475
u1570:
	line	429
	
l4473:	
;main.c: 429: ucChannel4Type = LESS_THAN_1911;
	clrf	(main@ucChannel4Type)
	goto	l758
	line	430
	
l4475:	
;main.c: 430: else if(getAdOriginaCh4Value() < 2047)
	fcall	_getAdOriginaCh4Value
	movlw	high(07FFh)
	subwf	(1+(?_getAdOriginaCh4Value)),w
	movlw	low(07FFh)
	skipnz
	subwf	(0+(?_getAdOriginaCh4Value)),w
	skipnc
	goto	u1581
	goto	u1580
u1581:
	goto	l4479
u1580:
	line	431
	
l4477:	
;main.c: 431: ucChannel4Type = BETWEEN_1911_AND_2067;
	clrf	(main@ucChannel4Type)
	incf	(main@ucChannel4Type),f
	goto	l758
	line	432
	
l4479:	
;main.c: 432: else if(getAdOriginaCh4Value() < 2164)
	fcall	_getAdOriginaCh4Value
	movlw	high(0874h)
	subwf	(1+(?_getAdOriginaCh4Value)),w
	movlw	low(0874h)
	skipnz
	subwf	(0+(?_getAdOriginaCh4Value)),w
	skipnc
	goto	u1591
	goto	u1590
u1591:
	goto	l4483
u1590:
	line	433
	
l4481:	
;main.c: 433: ucChannel4Type = BETWEEN_2067_AND_2204;
	movlw	(02h)
	movwf	(main@ucChannel4Type)
	goto	l758
	line	434
	
l4483:	
;main.c: 434: else if(getAdOriginaCh4Value() < 2281)
	fcall	_getAdOriginaCh4Value
	movlw	high(08E9h)
	subwf	(1+(?_getAdOriginaCh4Value)),w
	movlw	low(08E9h)
	skipnz
	subwf	(0+(?_getAdOriginaCh4Value)),w
	skipnc
	goto	u1601
	goto	u1600
u1601:
	goto	l4487
u1600:
	line	435
	
l4485:	
;main.c: 435: ucChannel4Type = BETWEEN_2204_AND_2340;
	movlw	(03h)
	movwf	(main@ucChannel4Type)
	goto	l758
	line	437
	
l4487:	
;main.c: 436: else
;main.c: 437: ucChannel4Type = MORE_THAN_2340;
	movlw	(04h)
	movwf	(main@ucChannel4Type)
	
l758:	
	line	439
;main.c: 439: ucADC4_Step = ADC4_STEP_SECOND;
	movlw	(02h)
	movwf	(main@ucADC4_Step)
	line	440
;main.c: 440: break;
	goto	l4379
	line	455
;main.c: 454: {
;main.c: 455: case 0:
	
l773:	
	line	457
;main.c: 456: {
;main.c: 457: PB0 = 1;
	bsf	(48/8),(48)&7
	line	458
	
l4489:	
;main.c: 458: ucLoaderStep++;
	incf	(main@ucLoaderStep),f
	line	459
;main.c: 459: break;
	goto	l4379
	line	464
	
l4491:	
;main.c: 463: {
;main.c: 464: if(ucTimerDelay >= 5)
	movlw	(05h)
	subwf	(main@ucTimerDelay),w
	skipc
	goto	u1611
	goto	u1610
u1611:
	goto	l4499
u1610:
	line	466
	
l4493:	
;main.c: 465: {
;main.c: 466: PA0 = 1;
	bsf	(40/8),(40)&7
	line	467
	
l4495:	
;main.c: 467: ucTimerDelay = 0;
	clrf	(main@ucTimerDelay)
	goto	l4489
	line	471
	
l4499:	
;main.c: 470: else
;main.c: 471: ucTimerDelay++;
	incf	(main@ucTimerDelay),f
	goto	l4379
	line	477
	
l4501:	
;main.c: 476: {
;main.c: 477: if(ucTimerDelay >= 5)
	movlw	(05h)
	subwf	(main@ucTimerDelay),w
	skipc
	goto	u1621
	goto	u1620
u1621:
	goto	l4499
u1620:
	line	479
	
l4503:	
;main.c: 478: {
;main.c: 479: PA1= 1;
	bsf	(41/8),(41)&7
	goto	l4495
	line	491
	
l4511:	
;main.c: 490: {
;main.c: 491: if(ucTimerDelay >= 5)
	movlw	(05h)
	subwf	(main@ucTimerDelay),w
	skipc
	goto	u1631
	goto	u1630
u1631:
	goto	l4499
u1630:
	line	493
	
l4513:	
;main.c: 492: {
;main.c: 493: PA2= 1;
	bsf	(42/8),(42)&7
	goto	l4495
	line	504
	
l4521:	
;main.c: 503: {
;main.c: 504: if(ucTimerDelay >= 5)
	movlw	(05h)
	subwf	(main@ucTimerDelay),w
	skipc
	goto	u1641
	goto	u1640
u1641:
	goto	l4499
u1640:
	line	506
	
l4523:	
;main.c: 505: {
;main.c: 506: PA3 = 1;
	bsf	(43/8),(43)&7
	goto	l4495
	line	517
	
l4531:	
;main.c: 516: {
;main.c: 517: if(ucTimerDelay >= 5)
	movlw	(05h)
	subwf	(main@ucTimerDelay),w
	skipc
	goto	u1651
	goto	u1650
u1651:
	goto	l4499
u1650:
	line	519
	
l4533:	
;main.c: 518: {
;main.c: 519: PB0 = 0;
	bcf	(48/8),(48)&7
	line	520
;main.c: 520: PA0 = 0;
	bcf	(40/8),(40)&7
	line	521
;main.c: 521: PA1 = 0;
	bcf	(41/8),(41)&7
	line	522
;main.c: 522: PA2 = 0;
	bcf	(42/8),(42)&7
	line	523
;main.c: 523: PA3 = 0;
	bcf	(43/8),(43)&7
	goto	l4495
	line	534
	
l4541:	
;main.c: 533: {
;main.c: 534: if(ucTimerDelay >= 1)
	movf	(main@ucTimerDelay),w
	skipz
	goto	u1660
	goto	l4499
u1660:
	line	536
	
l4543:	
;main.c: 535: {
;main.c: 536: ucTimerDelay = 0;
	clrf	(main@ucTimerDelay)
	line	538
;main.c: 538: ucLoaderStep = 0;
	clrf	(main@ucLoaderStep)
	line	539
	
l4545:	
;main.c: 539: ucADC4_Step = ADC4_STEP_THIRD;
	movlw	(03h)
	movwf	(main@ucADC4_Step)
	line	540
;main.c: 540: }
	goto	l4379
	line	453
	
l4551:	
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
goto l712
movlw high(S5289)
movwf pclath
	clrc
	rlf fsr,w
	addlw low(S5289)
	movwf pc
psect	swtext1,local,class=CONST,delta=2
global __pswtext1
__pswtext1:
S5289:
	ljmp	l773
	ljmp	l4491
	ljmp	l4501
	ljmp	l4511
	ljmp	l4521
	ljmp	l4531
	ljmp	l4541
psect	maintext

	line	560
;main.c: 559: {
;main.c: 560: case 0:
	
l801:	
	line	562
;main.c: 561: {
;main.c: 562: PB0 = 1;
	bsf	(48/8),(48)&7
	line	563
	
l4553:	
;main.c: 563: ucLoaderStep1++;
	incf	(main@ucLoaderStep1),f
	line	564
;main.c: 564: break;
	goto	l4379
	line	569
	
l4555:	
;main.c: 568: {
;main.c: 569: if(ucTimerDelay1 >= 5)
	movlw	(05h)
	subwf	(main@ucTimerDelay1),w
	skipc
	goto	u1671
	goto	u1670
u1671:
	goto	l4563
u1670:
	line	571
	
l4557:	
;main.c: 570: {
;main.c: 571: PA0 = 1;
	bsf	(40/8),(40)&7
	line	572
	
l4559:	
;main.c: 572: ucTimerDelay1 = 0;
	clrf	(main@ucTimerDelay1)
	goto	l4553
	line	576
	
l4563:	
;main.c: 575: else
;main.c: 576: ucTimerDelay1++;
	incf	(main@ucTimerDelay1),f
	goto	l4379
	line	582
	
l4565:	
;main.c: 581: {
;main.c: 582: if(ucTimerDelay1 >= 5)
	movlw	(05h)
	subwf	(main@ucTimerDelay1),w
	skipc
	goto	u1681
	goto	u1680
u1681:
	goto	l4563
u1680:
	line	584
	
l4567:	
;main.c: 583: {
;main.c: 584: PA1= 1;
	bsf	(41/8),(41)&7
	goto	l4559
	line	595
	
l4575:	
;main.c: 594: {
;main.c: 595: if(ucTimerDelay1 >= 5)
	movlw	(05h)
	subwf	(main@ucTimerDelay1),w
	skipc
	goto	u1691
	goto	u1690
u1691:
	goto	l4563
u1690:
	line	597
	
l4577:	
;main.c: 596: {
;main.c: 597: PA2 = 1;
	bsf	(42/8),(42)&7
	goto	l4559
	line	608
	
l4585:	
;main.c: 607: {
;main.c: 608: if(ucTimerDelay1 >= 5)
	movlw	(05h)
	subwf	(main@ucTimerDelay1),w
	skipc
	goto	u1701
	goto	u1700
u1701:
	goto	l4563
u1700:
	line	610
	
l4587:	
;main.c: 609: {
;main.c: 610: PA3 = 1;
	bsf	(43/8),(43)&7
	goto	l4559
	line	621
	
l4595:	
;main.c: 620: {
;main.c: 621: if(ucTimerDelay1 >= 5)
	movlw	(05h)
	subwf	(main@ucTimerDelay1),w
	skipc
	goto	u1711
	goto	u1710
u1711:
	goto	l4563
u1710:
	line	623
	
l4597:	
;main.c: 622: {
;main.c: 623: PA0 = 0;
	bcf	(40/8),(40)&7
	line	624
;main.c: 624: PA1 = 0;
	bcf	(41/8),(41)&7
	line	625
;main.c: 625: PA2 = 0;
	bcf	(42/8),(42)&7
	line	626
;main.c: 626: PA3 = 0;
	bcf	(43/8),(43)&7
	goto	l4559
	line	637
	
l4605:	
;main.c: 636: {
;main.c: 637: if(ucTimerDelay1 >= 1)
	movf	(main@ucTimerDelay1),w
	skipz
	goto	u1720
	goto	l4563
u1720:
	line	639
	
l4607:	
;main.c: 638: {
;main.c: 639: ucTimerDelay1 = 0;
	clrf	(main@ucTimerDelay1)
	line	641
;main.c: 641: ucLoaderStep1 = 0;
	clrf	(main@ucLoaderStep1)
	goto	l4545
	line	558
	
l4615:	
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
goto l712
movlw high(S5291)
movwf pclath
	clrc
	rlf fsr,w
	addlw low(S5291)
	movwf pc
psect	swtext2,local,class=CONST,delta=2
global __pswtext2
__pswtext2:
S5291:
	ljmp	l801
	ljmp	l4555
	ljmp	l4565
	ljmp	l4575
	ljmp	l4585
	ljmp	l4595
	ljmp	l4605
psect	maintext

	line	664
;main.c: 663: {
;main.c: 664: case 0:
	
l828:	
	line	666
;main.c: 665: {
;main.c: 666: PB0 = 1;
	bsf	(48/8),(48)&7
	line	667
;main.c: 667: PA0 = 1;
	bsf	(40/8),(40)&7
	line	668
	
l4617:	
;main.c: 668: ucLoaderStep2++;
	incf	(main@ucLoaderStep2),f
	line	669
;main.c: 669: break;
	goto	l4379
	line	674
	
l4619:	
;main.c: 673: {
;main.c: 674: if(ucTimerDelay2 >= 5)
	movlw	(05h)
	subwf	(main@ucTimerDelay2),w
	skipc
	goto	u1731
	goto	u1730
u1731:
	goto	l4627
u1730:
	line	676
	
l4621:	
;main.c: 675: {
;main.c: 676: PA1 = 1;
	bsf	(41/8),(41)&7
	line	677
	
l4623:	
;main.c: 677: ucTimerDelay2 = 0;
	clrf	(main@ucTimerDelay2)
	goto	l4617
	line	681
	
l4627:	
;main.c: 680: else
;main.c: 681: ucTimerDelay2++;
	incf	(main@ucTimerDelay2),f
	goto	l4379
	line	687
	
l4629:	
;main.c: 686: {
;main.c: 687: if(ucTimerDelay2 >= 5)
	movlw	(05h)
	subwf	(main@ucTimerDelay2),w
	skipc
	goto	u1741
	goto	u1740
u1741:
	goto	l4627
u1740:
	line	689
	
l4631:	
;main.c: 688: {
;main.c: 689: PA2 = 1;
	bsf	(42/8),(42)&7
	goto	l4623
	line	700
	
l4639:	
;main.c: 699: {
;main.c: 700: if(ucTimerDelay2 >= 5)
	movlw	(05h)
	subwf	(main@ucTimerDelay2),w
	skipc
	goto	u1751
	goto	u1750
u1751:
	goto	l4627
u1750:
	line	702
	
l4641:	
;main.c: 701: {
;main.c: 702: PA3 = 1;
	bsf	(43/8),(43)&7
	goto	l4623
	line	713
	
l4649:	
;main.c: 712: {
;main.c: 713: if(ucTimerDelay2 >= 5)
	movlw	(05h)
	subwf	(main@ucTimerDelay2),w
	skipc
	goto	u1761
	goto	u1760
u1761:
	goto	l4627
u1760:
	line	716
	
l4651:	
;main.c: 714: {
;main.c: 716: PA1 = 0;
	bcf	(41/8),(41)&7
	line	717
;main.c: 717: PA2 = 0;
	bcf	(42/8),(42)&7
	line	718
;main.c: 718: PA3 = 0;
	bcf	(43/8),(43)&7
	goto	l4623
	line	729
	
l4659:	
;main.c: 728: {
;main.c: 729: if(ucTimerDelay2 >= 1)
	movf	(main@ucTimerDelay2),w
	skipz
	goto	u1770
	goto	l4627
u1770:
	line	731
	
l4661:	
;main.c: 730: {
;main.c: 731: ucTimerDelay2 = 0;
	clrf	(main@ucTimerDelay2)
	line	733
;main.c: 733: ucLoaderStep2 = 0;
	clrf	(main@ucLoaderStep2)
	goto	l4545
	line	662
	
l4669:	
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
goto l712
movlw high(S5293)
movwf pclath
	clrc
	rlf fsr,w
	addlw low(S5293)
	movwf pc
psect	swtext3,local,class=CONST,delta=2
global __pswtext3
__pswtext3:
S5293:
	ljmp	l828
	ljmp	l4619
	ljmp	l4629
	ljmp	l4639
	ljmp	l4649
	ljmp	l4659
psect	maintext

	line	756
;main.c: 755: {
;main.c: 756: case 0:
	
l852:	
	line	758
;main.c: 757: {
;main.c: 758: PB0 = 1;
	bsf	(48/8),(48)&7
	line	759
;main.c: 759: PA0 = 1;
	bsf	(40/8),(40)&7
	line	760
;main.c: 760: PA1 = 1;
	bsf	(41/8),(41)&7
	line	761
	
l4671:	
;main.c: 761: ucLoaderStep3++;
	incf	(main@ucLoaderStep3),f
	line	762
;main.c: 762: break;
	goto	l4379
	line	767
	
l4673:	
;main.c: 766: {
;main.c: 767: if(ucTimerDelay3 >= 5)
	movlw	(05h)
	subwf	(main@ucTimerDelay3),w
	skipc
	goto	u1781
	goto	u1780
u1781:
	goto	l4681
u1780:
	line	769
	
l4675:	
;main.c: 768: {
;main.c: 769: PA2 = 1;
	bsf	(42/8),(42)&7
	line	770
	
l4677:	
;main.c: 770: ucTimerDelay3 = 0;
	clrf	(main@ucTimerDelay3)
	goto	l4671
	line	774
	
l4681:	
;main.c: 773: else
;main.c: 774: ucTimerDelay3++;
	incf	(main@ucTimerDelay3),f
	goto	l4379
	line	780
	
l4683:	
;main.c: 779: {
;main.c: 780: if(ucTimerDelay3 >= 5)
	movlw	(05h)
	subwf	(main@ucTimerDelay3),w
	skipc
	goto	u1791
	goto	u1790
u1791:
	goto	l4681
u1790:
	line	782
	
l4685:	
;main.c: 781: {
;main.c: 782: PA3 = 1;
	bsf	(43/8),(43)&7
	goto	l4677
	line	794
	
l4693:	
;main.c: 793: {
;main.c: 794: if(ucTimerDelay3 >= 5)
	movlw	(05h)
	subwf	(main@ucTimerDelay3),w
	skipc
	goto	u1801
	goto	u1800
u1801:
	goto	l4681
u1800:
	line	797
	
l4695:	
;main.c: 795: {
;main.c: 797: PA2 = 0;
	bcf	(42/8),(42)&7
	line	798
;main.c: 798: PA3 = 0;
	bcf	(43/8),(43)&7
	goto	l4677
	line	809
	
l4703:	
;main.c: 808: {
;main.c: 809: if(ucTimerDelay3 >= 1)
	movf	(main@ucTimerDelay3),w
	skipz
	goto	u1810
	goto	l4681
u1810:
	line	811
	
l4705:	
;main.c: 810: {
;main.c: 811: ucTimerDelay3 = 0;
	clrf	(main@ucTimerDelay3)
	line	813
;main.c: 813: ucLoaderStep3 = 0;
	clrf	(main@ucLoaderStep3)
	goto	l4545
	line	754
	
l4713:	
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
	goto	l852
	xorlw	1^0	; case 1
	skipnz
	goto	l4673
	xorlw	2^1	; case 2
	skipnz
	goto	l4683
	xorlw	3^2	; case 3
	skipnz
	goto	l4693
	xorlw	4^3	; case 4
	skipnz
	goto	l4703
	goto	l712
	opt asmopt_on

	line	836
;main.c: 835: {
;main.c: 836: case 0:
	
l873:	
	line	838
;main.c: 837: {
;main.c: 838: PB0 = 1;
	bsf	(48/8),(48)&7
	line	839
;main.c: 839: PA0 = 1;
	bsf	(40/8),(40)&7
	line	840
;main.c: 840: PA1 = 1;
	bsf	(41/8),(41)&7
	line	841
;main.c: 841: PA2 = 1;
	bsf	(42/8),(42)&7
	line	842
	
l4715:	
;main.c: 842: ucLoaderStep4++;
	incf	(main@ucLoaderStep4),f
	line	843
;main.c: 843: break;
	goto	l4379
	line	848
	
l4717:	
;main.c: 847: {
;main.c: 848: if(ucTimerDelay4 >= 5)
	movlw	(05h)
	subwf	(main@ucTimerDelay4),w
	skipc
	goto	u1821
	goto	u1820
u1821:
	goto	l4725
u1820:
	line	850
	
l4719:	
;main.c: 849: {
;main.c: 850: PA3 = 1;
	bsf	(43/8),(43)&7
	line	851
	
l4721:	
;main.c: 851: ucTimerDelay4 = 0;
	clrf	(main@ucTimerDelay4)
	goto	l4715
	line	855
	
l4725:	
;main.c: 854: else
;main.c: 855: ucTimerDelay4++;
	incf	(main@ucTimerDelay4),f
	goto	l4379
	line	861
	
l4727:	
;main.c: 860: {
;main.c: 861: if(ucTimerDelay4 >= 5)
	movlw	(05h)
	subwf	(main@ucTimerDelay4),w
	skipc
	goto	u1831
	goto	u1830
u1831:
	goto	l4725
u1830:
	line	863
	
l4729:	
;main.c: 862: {
;main.c: 863: PA3 = 0;
	bcf	(43/8),(43)&7
	goto	l4721
	line	874
	
l4737:	
;main.c: 873: {
;main.c: 874: if(ucTimerDelay4 >= 1)
	movf	(main@ucTimerDelay4),w
	skipz
	goto	u1840
	goto	l4725
u1840:
	line	876
	
l4739:	
;main.c: 875: {
;main.c: 876: ucTimerDelay4 = 0;
	clrf	(main@ucTimerDelay4)
	line	878
;main.c: 878: ucLoaderStep4 = 0;
	clrf	(main@ucLoaderStep4)
	goto	l4545
	line	834
	
l4747:	
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
	goto	l873
	xorlw	1^0	; case 1
	skipnz
	goto	l4717
	xorlw	2^1	; case 2
	skipnz
	goto	l4727
	xorlw	3^2	; case 3
	skipnz
	goto	l4737
	goto	l712
	opt asmopt_on

	line	445
	
l4751:	
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
	goto	l4551
	xorlw	1^0	; case 1
	skipnz
	goto	l4615
	xorlw	2^1	; case 2
	skipnz
	goto	l4669
	xorlw	3^2	; case 3
	skipnz
	goto	l4713
	xorlw	4^3	; case 4
	skipnz
	goto	l4747
	goto	l712
	opt asmopt_on

	line	907
	
l4753:	
;main.c: 902: {
;main.c: 903: static unsigned char ucTimerDelayP2sLess = 0;
;main.c: 905: static unsigned char ucTimerDelayP2sMore = 0;
;main.c: 907: if( getAdOriginalCh1Value() <= 200 )
	fcall	_getAdOriginalCh1Value
	movlw	high(0C9h)
	subwf	(1+(?_getAdOriginalCh1Value)),w
	movlw	low(0C9h)
	skipnz
	subwf	(0+(?_getAdOriginalCh1Value)),w
	skipnc
	goto	u1851
	goto	u1850
u1851:
	goto	l4759
u1850:
	line	909
	
l4755:	
;main.c: 908: {
;main.c: 909: ucTimerDelayP2sLess++;
	incf	(main@ucTimerDelayP2sLess),f
	line	910
	
l4757:	
;main.c: 910: ucTimerDelayP2sMore = 0;
	clrf	(main@ucTimerDelayP2sMore)
	line	911
;main.c: 911: }
	goto	l4763
	line	914
	
l4759:	
;main.c: 912: else
;main.c: 913: {
;main.c: 914: ucTimerDelayP2sMore++;
	incf	(main@ucTimerDelayP2sMore),f
	line	915
	
l4761:	
;main.c: 915: ucTimerDelayP2sLess = 0;
	clrf	(main@ucTimerDelayP2sLess)
	line	918
	
l4763:	
;main.c: 916: }
;main.c: 918: if( ucTimerDelayP2sLess >= 2)
	movlw	(02h)
	subwf	(main@ucTimerDelayP2sLess),w
	skipc
	goto	u1861
	goto	u1860
u1861:
	goto	l4771
u1860:
	line	920
	
l4765:	
;main.c: 919: {
;main.c: 920: ucTimerDelayP2sLess = 0;
	clrf	(main@ucTimerDelayP2sLess)
	line	921
;main.c: 921: ucTimerDelayP2sMore = 0;
	clrf	(main@ucTimerDelayP2sMore)
	line	923
	
l4767:	
;main.c: 923: startTwentySecondsTimer();
	fcall	_startTwentySecondsTimer
	line	925
	
l4769:	
;main.c: 925: ucADC4_Step = ADC4_STEP_FOURTH_PREFIX1;
	movlw	(04h)
	bcf	status, 5	;RP0=0, select bank0
	movwf	(main@ucADC4_Step)
	line	928
	
l4771:	
;main.c: 926: }
;main.c: 928: if(ucTimerDelayP2sMore >= 2)
	movlw	(02h)
	subwf	(main@ucTimerDelayP2sMore),w
	skipc
	goto	u1871
	goto	u1870
u1871:
	goto	l712
u1870:
	line	930
	
l4773:	
;main.c: 929: {
;main.c: 930: ucTimerDelayP2sMore = 0;
	clrf	(main@ucTimerDelayP2sMore)
	line	931
;main.c: 931: ucTimerDelayP2sLess = 0;
	clrf	(main@ucTimerDelayP2sLess)
	line	932
	
l4775:	
;main.c: 932: ucADC4_Step = ADC4_STEP_FOURTH_PREFIX2;
	movlw	(05h)
	bcf	status, 5	;RP0=0, select bank0
	movwf	(main@ucADC4_Step)
	goto	l4379
	line	941
	
l4777:	
;main.c: 940: {
;main.c: 941: if( !isFinishedTwentySecondsTimer() )
	fcall	_isFinishedTwentySecondsTimer
	iorlw	0
	skipz
	goto	u1881
	goto	u1880
u1881:
	goto	l4781
u1880:
	goto	l4775
	line	944
	
l4781:	
;main.c: 943: else
;main.c: 944: ucADC4_Step = ADC4_STEP_FOURTH_PREFIX3;
	movlw	(06h)
	bcf	status, 5	;RP0=0, select bank0
	movwf	(main@ucADC4_Step)
	goto	l4379
	line	957
	
l4783:	
;main.c: 951: {
;main.c: 953: static unsigned char ucTimerForDACR0_CNT1 = 0, ucTimerForDACR0_CNT2 = 0;
;main.c: 955: static unsigned char ucTimerForDACR0_CNT1_f = 0, ucTimerForDACR0_CNT2_f = 0;
;main.c: 957: if((getAdOriginalCh14Value() > 2800))
	fcall	_getAdOriginalCh14Value
	movlw	high(0AF1h)
	subwf	(1+(?_getAdOriginalCh14Value)),w
	movlw	low(0AF1h)
	skipnz
	subwf	(0+(?_getAdOriginalCh14Value)),w
	skipc
	goto	u1891
	goto	u1890
u1891:
	goto	l4789
u1890:
	line	959
	
l4785:	
;main.c: 958: {
;main.c: 959: ucTimerForDACR0_CNT1++;
	incf	(main@ucTimerForDACR0_CNT1),f
	line	960
	
l4787:	
;main.c: 960: ucTimerForDACR0_CNT2 = 0;
	clrf	(main@ucTimerForDACR0_CNT2)
	line	961
;main.c: 961: }
	goto	l4793
	line	964
	
l4789:	
;main.c: 962: else
;main.c: 963: {
;main.c: 964: ucTimerForDACR0_CNT2++;
	incf	(main@ucTimerForDACR0_CNT2),f
	line	965
	
l4791:	
;main.c: 965: ucTimerForDACR0_CNT1 = 0;
	clrf	(main@ucTimerForDACR0_CNT1)
	line	968
	
l4793:	
;main.c: 966: }
;main.c: 968: if(ucTimerForDACR0_CNT1 >= 2)
	movlw	(02h)
	subwf	(main@ucTimerForDACR0_CNT1),w
	skipc
	goto	u1901
	goto	u1900
u1901:
	goto	l4797
u1900:
	line	969
	
l4795:	
;main.c: 969: ucTimerForDACR0_CNT1_f = 1;
	clrf	(main@ucTimerForDACR0_CNT1_f)
	incf	(main@ucTimerForDACR0_CNT1_f),f
	line	971
	
l4797:	
;main.c: 971: if(ucTimerForDACR0_CNT2 >= 2)
	movlw	(02h)
	subwf	(main@ucTimerForDACR0_CNT2),w
	skipc
	goto	u1911
	goto	u1910
u1911:
	goto	l4801
u1910:
	line	972
	
l4799:	
;main.c: 972: ucTimerForDACR0_CNT2_f = 1;
	clrf	(main@ucTimerForDACR0_CNT2_f)
	incf	(main@ucTimerForDACR0_CNT2_f),f
	line	974
	
l4801:	
;main.c: 974: if(ucTimerForDACR0_CNT1_f)
	movf	(main@ucTimerForDACR0_CNT1_f),w
	skipz
	goto	u1920
	goto	l4805
u1920:
	line	976
	
l4803:	
;main.c: 975: {
;main.c: 976: DACR0=0x0F;
	movlw	(0Fh)
	bsf	status, 5	;RP0=1, select bank1
	movwf	(136)^080h	;volatile
	line	977
;main.c: 977: ucADC4_Step = ADC4_STEP_FOURTH;
	movlw	(0Ah)
	bcf	status, 5	;RP0=0, select bank0
	movwf	(main@ucADC4_Step)
	line	978
;main.c: 978: }
	goto	l4809
	line	979
	
l4805:	
;main.c: 979: else if(ucTimerForDACR0_CNT2_f)
	movf	(main@ucTimerForDACR0_CNT2_f),w
	skipz
	goto	u1930
	goto	l4809
u1930:
	line	981
	
l4807:	
;main.c: 980: {
;main.c: 981: DACR0=0x09;
	movlw	(09h)
	bsf	status, 5	;RP0=1, select bank1
	movwf	(136)^080h	;volatile
	line	982
;main.c: 982: ucADC4_Step = ADC4_STEP_FOURTH;
	movlw	(0Ah)
	bcf	status, 5	;RP0=0, select bank0
	movwf	(main@ucADC4_Step)
	line	989
;main.c: 983: }
	
l4809:	
;main.c: 987: }
;main.c: 989: if(ADC4_STEP_FOURTH == ucADC4_Step)
	movf	(main@ucADC4_Step),w
	xorlw	0Ah
	skipz
	goto	u1941
	goto	u1940
u1941:
	goto	l712
u1940:
	line	991
	
l4811:	
;main.c: 990: {
;main.c: 991: ucTimerForDACR0_CNT1 = 0;
	clrf	(main@ucTimerForDACR0_CNT1)
	line	992
;main.c: 992: ucTimerForDACR0_CNT2 = 0;
	clrf	(main@ucTimerForDACR0_CNT2)
	line	993
;main.c: 993: ucTimerForDACR0_CNT1_f = 0;
	clrf	(main@ucTimerForDACR0_CNT1_f)
	line	994
;main.c: 994: ucTimerForDACR0_CNT2_f = 0;
	clrf	(main@ucTimerForDACR0_CNT2_f)
	goto	l4379
	line	1003
	
l4813:	
;main.c: 1002: {
;main.c: 1003: clearTwentySecondsTimer();
	fcall	_clearTwentySecondsTimer
	line	1004
	
l4815:	
;main.c: 1004: PA6 = 1;
	bcf	status, 5	;RP0=0, select bank0
	bsf	(46/8),(46)&7
	line	1005
	
l4817:	
;main.c: 1005: PBOD6 = 0;
	bsf	status, 5	;RP0=1, select bank3
	bsf	status, 6	;RP1=1, select bank3
	bcf	(3142/8)^0180h,(3142)&7
	line	1006
	
l4819:	
;main.c: 1006: PB6 = 1;
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	bsf	(54/8),(54)&7
	line	1008
	
l4821:	
;main.c: 1008: ucADC4_Step = ADC4_STEP_FOURTH_PREFIX4;
	movlw	(07h)
	movwf	(main@ucADC4_Step)
	line	1009
;main.c: 1009: break;
	goto	l4379
	line	1018
	
l4823:	
;main.c: 1015: {
;main.c: 1016: static unsigned char ucDelayPrefix4TimerP5s;
;main.c: 1018: ucDelayPrefix4TimerP5s++;
	incf	(main@ucDelayPrefix4TimerP5s),f
	line	1020
	
l4825:	
;main.c: 1020: if( ucDelayPrefix4TimerP5s >= 5)
	movlw	(05h)
	subwf	(main@ucDelayPrefix4TimerP5s),w
	skipc
	goto	u1951
	goto	u1950
u1951:
	goto	l712
u1950:
	line	1022
	
l4827:	
;main.c: 1021: {
;main.c: 1022: ucDelayPrefix4TimerP5s = 0;
	clrf	(main@ucDelayPrefix4TimerP5s)
	line	1024
	
l4829:	
;main.c: 1024: ucADC4_Step = ADC4_STEP_FOURTH_PREFIX5;
	movlw	(08h)
	movwf	(main@ucADC4_Step)
	goto	l4379
	line	1029
;main.c: 1027: }
;main.c: 1029: case ADC4_STEP_FOURTH_PREFIX5:
	
l921:	
	line	1032
;main.c: 1030: {
;main.c: 1032: PBOD6 = 1;
	bsf	status, 5	;RP0=1, select bank3
	bsf	status, 6	;RP1=1, select bank3
	bsf	(3142/8)^0180h,(3142)&7
	line	1033
;main.c: 1033: PB6 = 1;
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	bsf	(54/8),(54)&7
	line	1034
	
l4831:	
;main.c: 1034: ucADC4_Step = ADC4_STEP_FOURTH_PREFIX6;
	movlw	(09h)
	movwf	(main@ucADC4_Step)
	line	1036
;main.c: 1036: break;
	goto	l4379
	line	1044
	
l4833:	
;main.c: 1041: {
;main.c: 1042: static unsigned char ucDelayPrefix6TimerP2s;
;main.c: 1044: ucDelayPrefix6TimerP2s++;
	incf	(main@ucDelayPrefix6TimerP2s),f
	line	1046
	
l4835:	
;main.c: 1046: if( ucDelayPrefix6TimerP2s >= 2)
	movlw	(02h)
	subwf	(main@ucDelayPrefix6TimerP2s),w
	skipc
	goto	u1961
	goto	u1960
u1961:
	goto	l712
u1960:
	line	1048
	
l4837:	
;main.c: 1047: {
;main.c: 1048: ucDelayPrefix6TimerP2s = 0;
	clrf	(main@ucDelayPrefix6TimerP2s)
	line	1050
;main.c: 1050: ucADC4_Step = ADC4_STEP_INIT;
	clrf	(main@ucADC4_Step)
	goto	l4419
	line	1064
	
l4841:	
;main.c: 1059: {
;main.c: 1060: static unsigned char ucCheckTimerP2sLess = 0;
;main.c: 1062: static unsigned char ucCheckTimerP2sMore = 0;
;main.c: 1064: if( getAdOriginalCh1Value() < 105)
	fcall	_getAdOriginalCh1Value
	movlw	high(069h)
	subwf	(1+(?_getAdOriginalCh1Value)),w
	movlw	low(069h)
	skipnz
	subwf	(0+(?_getAdOriginalCh1Value)),w
	skipnc
	goto	u1971
	goto	u1970
u1971:
	goto	l4847
u1970:
	line	1066
	
l4843:	
;main.c: 1065: {
;main.c: 1066: ucCheckTimerP2sLess++;
	incf	(main@ucCheckTimerP2sLess),f
	line	1067
	
l4845:	
;main.c: 1067: ucCheckTimerP2sMore = 0;
	clrf	(main@ucCheckTimerP2sMore)
	line	1068
;main.c: 1068: }
	goto	l4851
	line	1071
	
l4847:	
;main.c: 1069: else
;main.c: 1070: {
;main.c: 1071: ucCheckTimerP2sMore++;
	incf	(main@ucCheckTimerP2sMore),f
	line	1072
	
l4849:	
;main.c: 1072: ucCheckTimerP2sLess = 0;
	clrf	(main@ucCheckTimerP2sLess)
	line	1075
	
l4851:	
;main.c: 1073: }
;main.c: 1075: if( ucCheckTimerP2sMore > 2)
	movlw	(03h)
	subwf	(main@ucCheckTimerP2sMore),w
	skipc
	goto	u1981
	goto	u1980
u1981:
	goto	l4857
u1980:
	line	1077
	
l4853:	
;main.c: 1076: {
;main.c: 1077: ucCheckTimerP2sMore = 0;
	clrf	(main@ucCheckTimerP2sMore)
	line	1078
;main.c: 1078: ucCheckTimerP2sLess = 0;
	clrf	(main@ucCheckTimerP2sLess)
	line	1080
;main.c: 1080: ucADC4_Step = ADC4_STEP_INIT;
	clrf	(main@ucADC4_Step)
	line	1082
	
l4855:	
;main.c: 1082: enumMainLoopStep = MAIN_LOOP_STEP_THIRD;
	movlw	(03h)
	movwf	(main@enumMainLoopStep)
	line	1085
	
l4857:	
;main.c: 1083: }
;main.c: 1085: if( ucCheckTimerP2sLess > 2)
	movlw	(03h)
	subwf	(main@ucCheckTimerP2sLess),w
	skipc
	goto	u1991
	goto	u1990
u1991:
	goto	l712
u1990:
	line	1087
	
l4859:	
;main.c: 1086: {
;main.c: 1087: ucCheckTimerP2sMore = 0;
	clrf	(main@ucCheckTimerP2sMore)
	line	1088
;main.c: 1088: ucCheckTimerP2sLess = 0;
	clrf	(main@ucCheckTimerP2sLess)
	line	1090
	
l4861:	
;main.c: 1090: ucADC4_Step = ADC4_STEP_FOURTH_SUFFIX1;
	movlw	(0Bh)
	movwf	(main@ucADC4_Step)
	goto	l4379
	line	1102
	
l4863:	
;main.c: 1099: {
;main.c: 1100: static unsigned char ucFourthSuffix1TimerP3s = 0;
;main.c: 1102: ucFourthSuffix1TimerP3s++;
	incf	(main@ucFourthSuffix1TimerP3s),f
	line	1104
	
l4865:	
;main.c: 1104: if( ucFourthSuffix1TimerP3s > 3)
	movlw	(04h)
	subwf	(main@ucFourthSuffix1TimerP3s),w
	skipc
	goto	u2001
	goto	u2000
u2001:
	goto	l712
u2000:
	line	1106
	
l4867:	
;main.c: 1105: {
;main.c: 1106: ucFourthSuffix1TimerP3s = 0;
	clrf	(main@ucFourthSuffix1TimerP3s)
	line	1107
	
l4869:	
;main.c: 1107: ucADC4_Step = ADC4_STEP_FOURTH_SUFFIX2;
	movlw	(0Ch)
	movwf	(main@ucADC4_Step)
	goto	l4379
	line	1113
;main.c: 1111: }
;main.c: 1113: case ADC4_STEP_FOURTH_SUFFIX2:
	
l939:	
	line	1115
;main.c: 1114: {
;main.c: 1115: PA6 = 0;
	bcf	(46/8),(46)&7
	line	1117
	
l4871:	
;main.c: 1117: clearPinPortAndTimer();
	fcall	_clearPinPortAndTimer
	line	1118
	
l4873:	
;main.c: 1118: ucADC4_Step = ADC4_STEP_INIT;
	bcf	status, 5	;RP0=0, select bank0
	clrf	(main@ucADC4_Step)
	goto	l4397
	line	417
	
l4879:	
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
goto l712
movlw high(S5295)
movwf pclath
	clrc
	rlf fsr,w
	addlw low(S5295)
	movwf pc
psect	swtext4,local,class=CONST,delta=2
global __pswtext4
__pswtext4:
S5295:
	ljmp	l754
	ljmp	l4471
	ljmp	l4751
	ljmp	l4753
	ljmp	l4777
	ljmp	l4783
	ljmp	l4813
	ljmp	l4823
	ljmp	l921
	ljmp	l4833
	ljmp	l4841
	ljmp	l4863
	ljmp	l939
psect	maintext

	line	1145
;main.c: 1144: {
;main.c: 1145: case HOUR_3_BRANCH_STEP_FIRST:
	
l945:	
	line	1148
;main.c: 1146: {
;main.c: 1148: PB7 = 1;
	bsf	(55/8),(55)&7
	line	1149
;main.c: 1149: PBOD7 = 1;
	bsf	status, 5	;RP0=1, select bank3
	bsf	status, 6	;RP1=1, select bank3
	bsf	(3143/8)^0180h,(3143)&7
	line	1150
	
l4881:	
;main.c: 1150: startThreeHoursTimer(10800);
	movlw	low(02A30h)
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	movwf	(?_startThreeHoursTimer)
	movlw	high(02A30h)
	movwf	((?_startThreeHoursTimer))+1
	fcall	_startThreeHoursTimer
	line	1152
	
l4883:	
;main.c: 1152: PB0 = 1;
	bcf	status, 5	;RP0=0, select bank0
	bsf	(48/8),(48)&7
	line	1153
	
l4885:	
;main.c: 1153: PA0 = 1;
	bsf	(40/8),(40)&7
	line	1154
	
l4887:	
;main.c: 1154: PA1 = 1;
	bsf	(41/8),(41)&7
	line	1155
	
l4889:	
;main.c: 1155: PA2 = 1;
	bsf	(42/8),(42)&7
	line	1156
	
l4891:	
;main.c: 1156: PA3 = 1;
	bsf	(43/8),(43)&7
	line	1158
	
l4893:	
;main.c: 1158: enumBranchStep = HOUR_3_BRANCH_STEP_SECOND;
	clrf	(main@enumBranchStep)
	incf	(main@enumBranchStep),f
	line	1159
;main.c: 1159: break;
	goto	l4379
	line	1166
	
l4895:	
;main.c: 1163: {
;main.c: 1164: static unsigned char ucTimer20s = 0;
;main.c: 1166: if(ucTimer20s < 200)
	movlw	(0C8h)
	subwf	(main@ucTimer20s),w
	skipnc
	goto	u2011
	goto	u2010
u2011:
	goto	l4899
u2010:
	line	1168
	
l4897:	
;main.c: 1167: {
;main.c: 1168: ucTimer20s++;
	incf	(main@ucTimer20s),f
	line	1170
;main.c: 1170: }
	goto	l4379
	line	1174
	
l4899:	
;main.c: 1171: else
;main.c: 1172: {
;main.c: 1174: ucTimer20s = 0;
	clrf	(main@ucTimer20s)
	line	1176
	
l4901:	
;main.c: 1176: enumBranchStep = HOUR_3_BRANCH_STEP_THIRD;
	movlw	(02h)
	movwf	(main@enumBranchStep)
	line	1178
	
l4903:	
;main.c: 1178: PA6 = 0;
	bcf	(46/8),(46)&7
	goto	l4379
	line	1185
	
l4905:	
;main.c: 1184: {
;main.c: 1185: if(isFinishedThreeHoursTimer())
	fcall	_isFinishedThreeHoursTimer
	xorlw	0
	skipnz
	goto	u2021
	goto	u2020
u2021:
	goto	l4911
u2020:
	line	1187
	
l4907:	
;main.c: 1186: {
;main.c: 1187: enumBranchStep = HOUR_3_BRANCH_STEP_FIRST;
	bcf	status, 5	;RP0=0, select bank0
	clrf	(main@enumBranchStep)
	line	1188
	
l4909:	
;main.c: 1188: enumMainLoopStep = MAIN_LOOP_STEP_12_HOUR_END;
	movlw	(09h)
	movwf	(main@enumMainLoopStep)
	line	1189
;main.c: 1189: }
	goto	l4379
	line	1196
	
l4911:	
;main.c: 1190: else
;main.c: 1191: {
;main.c: 1192: static unsigned char ucTimerX1P5s = 0;
;main.c: 1194: static unsigned char ucTimerLessX1P5s = 0;
;main.c: 1196: if(getAdOriginalCh1Value() < 115)
	fcall	_getAdOriginalCh1Value
	movlw	high(073h)
	subwf	(1+(?_getAdOriginalCh1Value)),w
	movlw	low(073h)
	skipnz
	subwf	(0+(?_getAdOriginalCh1Value)),w
	skipnc
	goto	u2031
	goto	u2030
u2031:
	goto	l4917
u2030:
	line	1198
	
l4913:	
;main.c: 1197: {
;main.c: 1198: ucTimerX1P5s = 0;
	clrf	(main@ucTimerX1P5s)
	line	1199
	
l4915:	
;main.c: 1199: ucTimerLessX1P5s++;
	incf	(main@ucTimerLessX1P5s),f
	line	1200
;main.c: 1200: }
	goto	l4921
	line	1203
	
l4917:	
;main.c: 1201: else
;main.c: 1202: {
;main.c: 1203: ucTimerX1P5s++;
	incf	(main@ucTimerX1P5s),f
	line	1204
	
l4919:	
;main.c: 1204: ucTimerLessX1P5s = 0;
	clrf	(main@ucTimerLessX1P5s)
	line	1207
	
l4921:	
;main.c: 1205: }
;main.c: 1207: if(ucTimerX1P5s >= 5)
	movlw	(05h)
	subwf	(main@ucTimerX1P5s),w
	skipc
	goto	u2041
	goto	u2040
u2041:
	goto	l4935
u2040:
	line	1209
	
l4923:	
;main.c: 1208: {
;main.c: 1209: ucTimerX1P5s = 0;
	clrf	(main@ucTimerX1P5s)
	line	1212
	
l4925:	
;main.c: 1212: PBOD7 = 0;
	bsf	status, 5	;RP0=1, select bank3
	bsf	status, 6	;RP1=1, select bank3
	bcf	(3143/8)^0180h,(3143)&7
	line	1213
	
l4927:	
;main.c: 1213: PB7 = 0;
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	bcf	(55/8),(55)&7
	line	1214
	
l4929:	
;main.c: 1214: clearThreeHoursTimer();
	fcall	_clearThreeHoursTimer
	line	1216
	
l4931:	
;main.c: 1216: enumBranchStep = HOUR_3_BRANCH_STEP_FIRST;
	bcf	status, 5	;RP0=0, select bank0
	clrf	(main@enumBranchStep)
	line	1218
	
l4933:	
;main.c: 1218: enumMainLoopStep = MAIN_LOOP_STEP_SECOND;
	movlw	(02h)
	movwf	(main@enumMainLoopStep)
	line	1219
;main.c: 1219: }
	goto	l4379
	line	1220
	
l4935:	
;main.c: 1220: else if(ucTimerLessX1P5s >= 5)
	movlw	(05h)
	subwf	(main@ucTimerLessX1P5s),w
	skipc
	goto	u2051
	goto	u2050
u2051:
	goto	l712
u2050:
	line	1226
	
l4937:	
;main.c: 1221: {
;main.c: 1222: static unsigned char ucTimerX2P5s = 0;
;main.c: 1224: static unsigned char ucTimerLessX2P5s = 0;
;main.c: 1226: if(getAdOriginalCh14Value() >= 1950)
	fcall	_getAdOriginalCh14Value
	movlw	high(079Eh)
	subwf	(1+(?_getAdOriginalCh14Value)),w
	movlw	low(079Eh)
	skipnz
	subwf	(0+(?_getAdOriginalCh14Value)),w
	skipc
	goto	u2061
	goto	u2060
u2061:
	goto	l4943
u2060:
	line	1228
	
l4939:	
;main.c: 1227: {
;main.c: 1228: ucTimerX2P5s++;
	bsf	status, 5	;RP0=1, select bank1
	incf	(main@ucTimerX2P5s)^080h,f
	line	1229
	
l4941:	
;main.c: 1229: ucTimerLessX2P5s = 0;
	clrf	(main@ucTimerLessX2P5s)^080h
	line	1230
;main.c: 1230: }
	goto	l4947
	line	1233
	
l4943:	
;main.c: 1231: else
;main.c: 1232: {
;main.c: 1233: ucTimerX2P5s = 0;
	bsf	status, 5	;RP0=1, select bank1
	clrf	(main@ucTimerX2P5s)^080h
	line	1234
	
l4945:	
;main.c: 1234: ucTimerLessX2P5s++;
	incf	(main@ucTimerLessX2P5s)^080h,f
	line	1237
	
l4947:	
;main.c: 1235: }
;main.c: 1237: if(ucTimerX2P5s >= 5)
	movlw	(05h)
	subwf	(main@ucTimerX2P5s)^080h,w
	skipc
	goto	u2071
	goto	u2070
u2071:
	goto	l4951
u2070:
	line	1239
	
l4949:	
;main.c: 1238: {
;main.c: 1239: ucTimerX2P5s = 0;
	clrf	(main@ucTimerX2P5s)^080h
	line	1240
;main.c: 1240: }
	goto	l4379
	line	1241
	
l4951:	
;main.c: 1241: else if(ucTimerLessX2P5s >= 5)
	movlw	(05h)
	subwf	(main@ucTimerLessX2P5s)^080h,w
	skipc
	goto	u2081
	goto	u2080
u2081:
	goto	l712
u2080:
	line	1243
	
l4953:	
;main.c: 1242: {
;main.c: 1243: clearPinPortAndTimer();
	fcall	_clearPinPortAndTimer
	line	1244
	
l4955:	
;main.c: 1244: enumMainLoopStep = MAIN_LOOP_STEP_FIRST;
	bcf	status, 5	;RP0=0, select bank0
	clrf	(main@enumMainLoopStep)
	incf	(main@enumMainLoopStep),f
	line	1245
	
l4957:	
;main.c: 1245: enumBranchStep = HOUR_3_BRANCH_STEP_FIRST;
	clrf	(main@enumBranchStep)
	line	1246
;main.c: 1246: }
	goto	l4379
	line	1143
	
l4961:	
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
	goto	l945
	xorlw	1^0	; case 1
	skipnz
	goto	l4895
	xorlw	2^1	; case 2
	skipnz
	goto	l4905
	goto	l712
	opt asmopt_on

	line	1283
;main.c: 1282: {
;main.c: 1283: case INTERNAL_FIRST_STEP:
	
l980:	
	line	1285
;main.c: 1284: {
;main.c: 1285: PB0 = 0;
	bcf	status, 5	;RP0=0, select bank0
	bcf	(48/8),(48)&7
	line	1286
;main.c: 1286: PB1 = 0;
	bcf	(49/8),(49)&7
	line	1287
;main.c: 1287: PA0 = 0;
	bcf	(40/8),(40)&7
	line	1288
;main.c: 1288: PA1 = 0;
	bcf	(41/8),(41)&7
	line	1289
;main.c: 1289: PA2 = 0;
	bcf	(42/8),(42)&7
	line	1290
;main.c: 1290: PA3 = 0;
	bcf	(43/8),(43)&7
	line	1291
;main.c: 1291: PBOD6 = 0;
	bsf	status, 5	;RP0=1, select bank3
	bsf	status, 6	;RP1=1, select bank3
	bcf	(3142/8)^0180h,(3142)&7
	line	1292
;main.c: 1292: PB6 = 1;
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	bsf	(54/8),(54)&7
	line	1293
;main.c: 1293: PA6 =0;
	bcf	(46/8),(46)&7
	line	1295
;main.c: 1295: enumInteralStep = INTERNAL_SECOND_STEP;
	bsf	status, 5	;RP0=1, select bank1
	clrf	(main@enumInteralStep)^080h
	incf	(main@enumInteralStep)^080h,f
	line	1296
;main.c: 1296: break;
	goto	l4379
	line	1303
	
l4963:	
;main.c: 1300: {
;main.c: 1301: static unsigned char ucTimer1s = 0;
;main.c: 1303: if(getAdOriginalCh14Value() <= 1000)
	fcall	_getAdOriginalCh14Value
	movlw	high(03E9h)
	subwf	(1+(?_getAdOriginalCh14Value)),w
	movlw	low(03E9h)
	skipnz
	subwf	(0+(?_getAdOriginalCh14Value)),w
	skipnc
	goto	u2091
	goto	u2090
u2091:
	goto	l4967
u2090:
	line	1305
	
l4965:	
;main.c: 1304: {
;main.c: 1305: ucTimer1s++;
	bsf	status, 5	;RP0=1, select bank1
	incf	(main@ucTimer1s)^080h,f
	line	1306
;main.c: 1306: }
	goto	l4969
	line	1308
	
l4967:	
;main.c: 1307: else
;main.c: 1308: ucTimer1s = 0;
	bsf	status, 5	;RP0=1, select bank1
	clrf	(main@ucTimer1s)^080h
	line	1310
	
l4969:	
;main.c: 1310: if(ucTimer1s >= 10)
	movlw	(0Ah)
	subwf	(main@ucTimer1s)^080h,w
	skipc
	goto	u2101
	goto	u2100
u2101:
	goto	l712
u2100:
	line	1312
	
l4971:	
;main.c: 1311: {
;main.c: 1312: enumInteralStep = INTERNAL_THIRD_STEP;
	movlw	(02h)
	movwf	(main@enumInteralStep)^080h
	line	1313
	
l4973:	
;main.c: 1313: ucTimer1s = 0;
	clrf	(main@ucTimer1s)^080h
	goto	l4379
	line	1322
	
l4975:	
;main.c: 1319: {
;main.c: 1320: static unsigned char ucTimerP3s = 0;
;main.c: 1322: if(getAdOriginalCh14Value() >= 1950)
	fcall	_getAdOriginalCh14Value
	movlw	high(079Eh)
	subwf	(1+(?_getAdOriginalCh14Value)),w
	movlw	low(079Eh)
	skipnz
	subwf	(0+(?_getAdOriginalCh14Value)),w
	skipc
	goto	u2111
	goto	u2110
u2111:
	goto	l4979
u2110:
	line	1324
	
l4977:	
;main.c: 1323: {
;main.c: 1324: ucTimerP3s++;
	bsf	status, 5	;RP0=1, select bank1
	incf	(main@ucTimerP3s)^080h,f
	line	1325
;main.c: 1325: }
	goto	l4981
	line	1327
	
l4979:	
;main.c: 1326: else
;main.c: 1327: ucTimerP3s = 0;
	bsf	status, 5	;RP0=1, select bank1
	clrf	(main@ucTimerP3s)^080h
	line	1329
	
l4981:	
;main.c: 1329: if(ucTimerP3s >= 3)
	movlw	(03h)
	subwf	(main@ucTimerP3s)^080h,w
	skipc
	goto	u2121
	goto	u2120
u2121:
	goto	l712
u2120:
	line	1331
	
l4983:	
;main.c: 1330: {
;main.c: 1331: enumInteralStep = INTERNAL_FIRST_STEP;
	clrf	(main@enumInteralStep)^080h
	line	1332
;main.c: 1332: ucTimerP3s = 0;
	clrf	(main@ucTimerP3s)^080h
	line	1333
	
l4985:	
;main.c: 1333: clearAllTimer();
	fcall	_clearAllTimer
	line	1335
	
l4987:	
;main.c: 1335: DACR0=0x0F;
	movlw	(0Fh)
	movwf	(136)^080h	;volatile
	line	1336
	
l4989:	
;main.c: 1336: initPin();
	fcall	_initPin
	line	1339
	
l4991:	
;main.c: 1339: enumMainLoopStep = MAIN_LOOP_STEP_INIT;
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	clrf	(main@enumMainLoopStep)
	line	1341
	
l995:	
	goto	l995
	line	1281
	
l4995:	
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
	goto	l980
	xorlw	1^0	; case 1
	skipnz
	goto	l4963
	xorlw	2^1	; case 2
	skipnz
	goto	l4975
	goto	l712
	opt asmopt_on

	line	261
	
l4999:	
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
	goto	l4387
	xorlw	1^0	; case 1
	skipnz
	goto	l4399
	xorlw	2^1	; case 2
	skipnz
	goto	l720
	xorlw	3^2	; case 3
	skipnz
	goto	l4421
	xorlw	4^3	; case 4
	skipnz
	goto	l4457
	xorlw	5^4	; case 5
	skipnz
	goto	l4463
	xorlw	8^5	; case 8
	skipnz
	goto	l4961
	xorlw	9^8	; case 9
	skipnz
	goto	l4995
	goto	l712
	opt asmopt_on

	global	start
	ljmp	start
	opt stack 0
psect	maintext
	line	1362
GLOBAL	__end_of_main
	__end_of_main:
;; =============== function _main ends ============

	signat	_main,88
	global	_clearPinPortAndTimer
psect	text760,local,class=CODE,delta=2
global __ptext760
__ptext760:

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
;; Hardware stack levels required when called:    4
;; This function calls:
;;		_clearAllTimer
;; This function is called by:
;;		_main
;; This function uses a non-reentrant model
;;
psect	text760
	file	"D:\develop\190625\AK7030-OTP\main.c"
	line	92
	global	__size_of_clearPinPortAndTimer
	__size_of_clearPinPortAndTimer	equ	__end_of_clearPinPortAndTimer-_clearPinPortAndTimer
	
_clearPinPortAndTimer:	
	opt	stack 3
; Regs used in _clearPinPortAndTimer: [status,2+status,0+pclath+cstack]
	line	93
	
l4353:	
;main.c: 93: PB0 = 0;
	bcf	status, 5	;RP0=0, select bank0
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
	line	100
;main.c: 100: PBOD7 = 0;
	bsf	status, 5	;RP0=1, select bank3
	bsf	status, 6	;RP1=1, select bank3
	bcf	(3143/8)^0180h,(3143)&7
	line	101
;main.c: 101: PB7 = 0;
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	bcf	(55/8),(55)&7
	line	102
	
l4355:	
;main.c: 102: clearAllTimer();
	fcall	_clearAllTimer
	line	103
	
l682:	
	return
	opt stack 0
GLOBAL	__end_of_clearPinPortAndTimer
	__end_of_clearPinPortAndTimer:
;; =============== function _clearPinPortAndTimer ends ============

	signat	_clearPinPortAndTimer,88
	global	_getAdOriginaCh4Value
psect	text761,local,class=CODE,delta=2
global __ptext761
__ptext761:

;; *************** function _getAdOriginaCh4Value *****************
;; Defined at:
;;		line 229 in file "D:\develop\190625\AK7030-OTP\common.c"
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
psect	text761
	file	"D:\develop\190625\AK7030-OTP\common.c"
	line	229
	global	__size_of_getAdOriginaCh4Value
	__size_of_getAdOriginaCh4Value	equ	__end_of_getAdOriginaCh4Value-_getAdOriginaCh4Value
	
_getAdOriginaCh4Value:	
	opt	stack 4
; Regs used in _getAdOriginaCh4Value: [wreg-fsr0h+status,2+status,0+btemp+1+pclath+cstack]
	line	231
	
l4349:	
;common.c: 231: return Filter(uiSampleChannelFourth);
	movlw	(_uiSampleChannelFourth&0ffh)
	movwf	(?_Filter)
	movlw	(0x1/2)
	movwf	(?_Filter+1)
	fcall	_Filter
	movf	(1+(?_Filter)),w
	movwf	(?_getAdOriginaCh4Value+1)
	movf	(0+(?_Filter)),w
	movwf	(?_getAdOriginaCh4Value)
	line	236
	
l1719:	
	return
	opt stack 0
GLOBAL	__end_of_getAdOriginaCh4Value
	__end_of_getAdOriginaCh4Value:
;; =============== function _getAdOriginaCh4Value ends ============

	signat	_getAdOriginaCh4Value,90
	global	_getAdOriginalCh1Value
psect	text762,local,class=CODE,delta=2
global __ptext762
__ptext762:

;; *************** function _getAdOriginalCh1Value *****************
;; Defined at:
;;		line 217 in file "D:\develop\190625\AK7030-OTP\common.c"
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
psect	text762
	file	"D:\develop\190625\AK7030-OTP\common.c"
	line	217
	global	__size_of_getAdOriginalCh1Value
	__size_of_getAdOriginalCh1Value	equ	__end_of_getAdOriginalCh1Value-_getAdOriginalCh1Value
	
_getAdOriginalCh1Value:	
	opt	stack 4
; Regs used in _getAdOriginalCh1Value: [wreg-fsr0h+status,2+status,0+btemp+1+pclath+cstack]
	line	220
	
l4345:	
;common.c: 220: return Filter(uiSampleChannelFirst);
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
	line	225
	
l1716:	
	return
	opt stack 0
GLOBAL	__end_of_getAdOriginalCh1Value
	__end_of_getAdOriginalCh1Value:
;; =============== function _getAdOriginalCh1Value ends ============

	signat	_getAdOriginalCh1Value,90
	global	_getAdOriginalCh14Value
psect	text763,local,class=CODE,delta=2
global __ptext763
__ptext763:

;; *************** function _getAdOriginalCh14Value *****************
;; Defined at:
;;		line 240 in file "D:\develop\190625\AK7030-OTP\common.c"
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
psect	text763
	file	"D:\develop\190625\AK7030-OTP\common.c"
	line	240
	global	__size_of_getAdOriginalCh14Value
	__size_of_getAdOriginalCh14Value	equ	__end_of_getAdOriginalCh14Value-_getAdOriginalCh14Value
	
_getAdOriginalCh14Value:	
	opt	stack 4
; Regs used in _getAdOriginalCh14Value: [wreg-fsr0h+status,2+status,0+btemp+1+pclath+cstack]
	line	242
	
l4341:	
;common.c: 242: return Filter(uiSampleChannelFourteenth);
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
	line	246
	
l1722:	
	return
	opt stack 0
GLOBAL	__end_of_getAdOriginalCh14Value
	__end_of_getAdOriginalCh14Value:
;; =============== function _getAdOriginalCh14Value ends ============

	signat	_getAdOriginalCh14Value,90
	global	_process_AD_Converter_Value
psect	text764,local,class=CODE,delta=2
global __ptext764
__ptext764:

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
psect	text764
	file	"D:\develop\190625\AK7030-OTP\common.c"
	line	251
	global	__size_of_process_AD_Converter_Value
	__size_of_process_AD_Converter_Value	equ	__end_of_process_AD_Converter_Value-_process_AD_Converter_Value
	
_process_AD_Converter_Value:	
	opt	stack 4
; Regs used in _process_AD_Converter_Value: [wreg+status,2+status,0+pclath+cstack]
	line	252
	
l4325:	
;common.c: 252: if(getAD_ConvertFlag())
	fcall	_getAD_ConvertFlag
	xorlw	0
	skipnz
	goto	u1391
	goto	u1390
u1391:
	goto	l1730
u1390:
	line	254
	
l4327:	
;common.c: 253: {
;common.c: 254: setAD_ConvertFlag(0);
	movlw	(0)
	fcall	_setAD_ConvertFlag
	line	255
;common.c: 255: AD_Sample();
	fcall	_AD_Sample
	line	256
	
l4329:	
;common.c: 256: if(5 == sampleChannelSelect)
	movf	(_sampleChannelSelect),w
	xorlw	05h
	skipz
	goto	u1401
	goto	u1400
u1401:
	goto	l4333
u1400:
	line	257
	
l4331:	
;common.c: 257: adc_test_init(5,3);
	movlw	(03h)
	movwf	(?_adc_test_init)
	movlw	(05h)
	fcall	_adc_test_init
	goto	l4339
	line	258
	
l4333:	
;common.c: 258: else if(1 == sampleChannelSelect)
	decf	(_sampleChannelSelect),w
	skipz
	goto	u1411
	goto	u1410
u1411:
	goto	l4337
u1410:
	line	259
	
l4335:	
;common.c: 259: adc_test_init(1,3);
	movlw	(03h)
	movwf	(?_adc_test_init)
	movlw	(01h)
	fcall	_adc_test_init
	goto	l4339
	line	261
	
l4337:	
;common.c: 260: else
;common.c: 261: adc_test_init(14,3);
	movlw	(03h)
	movwf	(?_adc_test_init)
	movlw	(0Eh)
	fcall	_adc_test_init
	line	263
	
l4339:	
;common.c: 263: adc_start();
	fcall	_adc_start
	line	265
	
l1730:	
	return
	opt stack 0
GLOBAL	__end_of_process_AD_Converter_Value
	__end_of_process_AD_Converter_Value:
;; =============== function _process_AD_Converter_Value ends ============

	signat	_process_AD_Converter_Value,88
	global	_clearAllTimer
psect	text765,local,class=CODE,delta=2
global __ptext765
__ptext765:

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
psect	text765
	file	"D:\develop\190625\AK7030-OTP\main.c"
	line	83
	global	__size_of_clearAllTimer
	__size_of_clearAllTimer	equ	__end_of_clearAllTimer-_clearAllTimer
	
_clearAllTimer:	
	opt	stack 4
; Regs used in _clearAllTimer: [status,2+status,0+pclath+cstack]
	line	84
	
l4323:	
;main.c: 84: clearTwelveHoursTimer();
	fcall	_clearTwelveHoursTimer
	line	85
;main.c: 85: clearThreeHoursTimer();
	fcall	_clearThreeHoursTimer
	line	86
;main.c: 86: clearTwentySecondsTimer();
	fcall	_clearTwentySecondsTimer
	line	87
	
l679:	
	return
	opt stack 0
GLOBAL	__end_of_clearAllTimer
	__end_of_clearAllTimer:
;; =============== function _clearAllTimer ends ============

	signat	_clearAllTimer,88
	global	_AD_Sample
psect	text766,local,class=CODE,delta=2
global __ptext766
__ptext766:

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
psect	text766
	file	"D:\develop\190625\AK7030-OTP\common.c"
	line	277
	global	__size_of_AD_Sample
	__size_of_AD_Sample	equ	__end_of_AD_Sample-_AD_Sample
	
_AD_Sample:	
	opt	stack 4
; Regs used in _AD_Sample: [wreg+status,2+status,0]
	line	278
	
l4261:	
;common.c: 278: if(sampleTimes < 12)
	movlw	(0Ch)
	bcf	status, 5	;RP0=0, select bank0
	subwf	(_sampleTimes),w
	skipnc
	goto	u1261
	goto	u1260
u1261:
	goto	l1741
u1260:
	line	300
	
l4263:	
;common.c: 279: {
;common.c: 300: sampleTimes++;
	incf	(_sampleTimes),f
	line	302
	
l4265:	
;common.c: 302: if(sampleTimes >= 12)
	movlw	(0Ch)
	subwf	(_sampleTimes),w
	skipc
	goto	u1271
	goto	u1270
u1271:
	goto	l1741
u1270:
	line	304
	
l4267:	
;common.c: 303: {
;common.c: 304: sampleTimes = 0;
	clrf	(_sampleTimes)
	line	306
	
l4269:	
;common.c: 306: if(sampleChannelSelect == 14)
	movf	(_sampleChannelSelect),w
	xorlw	0Eh
	skipz
	goto	u1281
	goto	u1280
u1281:
	goto	l4273
u1280:
	line	310
	
l4271:	
;common.c: 307: {
;common.c: 310: sampleChannelSelect = 1;
	clrf	(_sampleChannelSelect)
	incf	(_sampleChannelSelect),f
	line	311
;common.c: 311: }
	goto	l1741
	line	312
	
l4273:	
;common.c: 312: else if(sampleChannelSelect == 5)
	movf	(_sampleChannelSelect),w
	xorlw	05h
	skipz
	goto	u1291
	goto	u1290
u1291:
	goto	l4277
u1290:
	line	315
	
l4275:	
;common.c: 313: {
;common.c: 315: sampleChannelSelect = 14;
	movlw	(0Eh)
	movwf	(_sampleChannelSelect)
	line	316
;common.c: 316: }
	goto	l1741
	line	317
	
l4277:	
;common.c: 317: else if(sampleChannelSelect == 1)
	decf	(_sampleChannelSelect),w
	skipz
	goto	u1301
	goto	u1300
u1301:
	goto	l4275
u1300:
	line	320
	
l4279:	
;common.c: 318: {
;common.c: 320: sampleChannelSelect = 5;
	movlw	(05h)
	movwf	(_sampleChannelSelect)
	line	333
;common.c: 321: }
	
l1741:	
	return
	opt stack 0
GLOBAL	__end_of_AD_Sample
	__end_of_AD_Sample:
;; =============== function _AD_Sample ends ============

	signat	_AD_Sample,88
	global	_setAD_ConvertFlag
psect	text767,local,class=CODE,delta=2
global __ptext767
__ptext767:

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
psect	text767
	file	"D:\develop\190625\AK7030-OTP\common.c"
	line	206
	global	__size_of_setAD_ConvertFlag
	__size_of_setAD_ConvertFlag	equ	__end_of_setAD_ConvertFlag-_setAD_ConvertFlag
	
_setAD_ConvertFlag:	
	opt	stack 4
; Regs used in _setAD_ConvertFlag: [wreg]
;setAD_ConvertFlag@flag stored from wreg
	bcf	status, 5	;RP0=0, select bank0
	movwf	(setAD_ConvertFlag@flag)
	line	207
	
l4259:	
;common.c: 207: adc_convert_flag = flag;
	movf	(setAD_ConvertFlag@flag),w
	bsf	status, 5	;RP0=1, select bank1
	movwf	(_adc_convert_flag)^080h
	line	208
	
l1713:	
	return
	opt stack 0
GLOBAL	__end_of_setAD_ConvertFlag
	__end_of_setAD_ConvertFlag:
;; =============== function _setAD_ConvertFlag ends ============

	signat	_setAD_ConvertFlag,4216
	global	_getAD_ConvertFlag
psect	text768,local,class=CODE,delta=2
global __ptext768
__ptext768:

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
psect	text768
	file	"D:\develop\190625\AK7030-OTP\common.c"
	line	200
	global	__size_of_getAD_ConvertFlag
	__size_of_getAD_ConvertFlag	equ	__end_of_getAD_ConvertFlag-_getAD_ConvertFlag
	
_getAD_ConvertFlag:	
	opt	stack 4
; Regs used in _getAD_ConvertFlag: [wreg]
	line	201
	
l4255:	
;common.c: 201: return adc_convert_flag;
	bsf	status, 5	;RP0=1, select bank1
	bcf	status, 6	;RP1=0, select bank1
	movf	(_adc_convert_flag)^080h,w
	line	202
	
l1710:	
	return
	opt stack 0
GLOBAL	__end_of_getAD_ConvertFlag
	__end_of_getAD_ConvertFlag:
;; =============== function _getAD_ConvertFlag ends ============

	signat	_getAD_ConvertFlag,89
	global	_Filter
psect	text769,local,class=CODE,delta=2
global __ptext769
__ptext769:

;; *************** function _Filter *****************
;; Defined at:
;;		line 51 in file "D:\develop\190625\AK7030-OTP\common.c"
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
psect	text769
	file	"D:\develop\190625\AK7030-OTP\common.c"
	line	51
	global	__size_of_Filter
	__size_of_Filter	equ	__end_of_Filter-_Filter
	
_Filter:	
	opt	stack 4
; Regs used in _Filter: [wreg-fsr0h+status,2+status,0+btemp+1]
	line	53
	
l4157:	
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
	
l4163:	
;common.c: 60: filter_buf[cir] = *tmpValue++;
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
	
l4165:	
	movlw	02h
	addwf	(Filter@tmpValue),f
	skipnc
	incf	(Filter@tmpValue+1),f
	line	59
	
l4167:	
	incf	(Filter@cir),f
	skipnz
	incf	(Filter@cir+1),f
	
l4169:	
	movf	(Filter@cir+1),w
	xorlw	80h
	movwf	btemp+1
	movlw	(high(0Ch))^80h
	subwf	btemp+1,w
	skipz
	goto	u1145
	movlw	low(0Ch)
	subwf	(Filter@cir),w
u1145:

	skipc
	goto	u1141
	goto	u1140
u1141:
	goto	l4163
u1140:
	line	63
	
l4171:	
;common.c: 63: for(j = 0; j < 12 - 1; j++)
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	clrf	(Filter@j)
	line	65
	
l4177:	
;common.c: 64: {
;common.c: 65: for(i = 0; i < 12 - 1 - j; i++)
	clrf	(Filter@i)
	goto	l4185
	line	67
	
l4179:	
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
	goto	u1155
	movf	0+(??_Filter+0)+0,w
	subwf	0+(??_Filter+2)+0,w
u1155:
	skipnc
	goto	u1151
	goto	u1150
u1151:
	goto	l4183
u1150:
	line	70
	
l4181:	
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
	
l4183:	
	incf	(Filter@i),f
	
l4185:	
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
	goto	u1165
	movf	0+(??_Filter+0)+0,w
	subwf	(Filter@i),w
u1165:

	skipc
	goto	u1161
	goto	u1160
u1161:
	goto	l4179
u1160:
	line	63
	
l4187:	
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	incf	(Filter@j),f
	
l4189:	
	movlw	(0Bh)
	subwf	(Filter@j),w
	skipc
	goto	u1171
	goto	u1170
u1171:
	goto	l4177
u1170:
	line	79
	
l4191:	
;common.c: 75: }
;common.c: 76: }
;common.c: 77: }
;common.c: 79: for(i = 2; i < 12 - 2; i++)
	movlw	(02h)
	movwf	(Filter@i)
	line	81
	
l4195:	
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
	
l4197:	
	incf	(Filter@i),f
	
l4199:	
	movlw	(0Ah)
	subwf	(Filter@i),w
	skipc
	goto	u1181
	goto	u1180
u1181:
	goto	l4195
u1180:
	line	84
	
l4201:	
;common.c: 82: }
;common.c: 84: return (filter_sum >> 3);
	movf	(Filter@filter_sum+1),w
	movwf	(?_Filter+1)
	movf	(Filter@filter_sum),w
	movwf	(?_Filter)
	
l4203:	
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
	
l1672:	
	return
	opt stack 0
GLOBAL	__end_of_Filter
	__end_of_Filter:
;; =============== function _Filter ends ============

	signat	_Filter,4218
	global	_isFinishedThreeHoursTimer
psect	text770,local,class=CODE,delta=2
global __ptext770
__ptext770:

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
psect	text770
	file	"D:\develop\190625\AK7030-OTP\common.c"
	line	416
	global	__size_of_isFinishedThreeHoursTimer
	__size_of_isFinishedThreeHoursTimer	equ	__end_of_isFinishedThreeHoursTimer-_isFinishedThreeHoursTimer
	
_isFinishedThreeHoursTimer:	
	opt	stack 5
; Regs used in _isFinishedThreeHoursTimer: [wreg+status,2+status,0]
	line	417
	
l4145:	
;common.c: 417: if(uiSmallTimer == 0)
	bsf	status, 5	;RP0=1, select bank1
	movf	((_uiSmallTimer+1)^080h),w
	iorwf	((_uiSmallTimer)^080h),w
	skipz
	goto	u1131
	goto	u1130
u1131:
	goto	l4153
u1130:
	line	418
	
l4147:	
;common.c: 418: return 1;
	movlw	(01h)
	goto	l1778
	line	420
	
l4153:	
;common.c: 419: else
;common.c: 420: return 0;
	movlw	(0)
	line	421
	
l1778:	
	return
	opt stack 0
GLOBAL	__end_of_isFinishedThreeHoursTimer
	__end_of_isFinishedThreeHoursTimer:
;; =============== function _isFinishedThreeHoursTimer ends ============

	signat	_isFinishedThreeHoursTimer,89
	global	_startThreeHoursTimer
psect	text771,local,class=CODE,delta=2
global __ptext771
__ptext771:

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
psect	text771
	file	"D:\develop\190625\AK7030-OTP\common.c"
	line	382
	global	__size_of_startThreeHoursTimer
	__size_of_startThreeHoursTimer	equ	__end_of_startThreeHoursTimer-_startThreeHoursTimer
	
_startThreeHoursTimer:	
	opt	stack 5
; Regs used in _startThreeHoursTimer: [wreg+status,2+status,0]
	line	383
	
l4141:	
;common.c: 383: if(0 == uiSmallTimer)
	bsf	status, 5	;RP0=1, select bank1
	movf	((_uiSmallTimer+1)^080h),w
	iorwf	((_uiSmallTimer)^080h),w
	skipz
	goto	u1121
	goto	u1120
u1121:
	goto	l1761
u1120:
	line	384
	
l4143:	
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
	
l1761:	
	return
	opt stack 0
GLOBAL	__end_of_startThreeHoursTimer
	__end_of_startThreeHoursTimer:
;; =============== function _startThreeHoursTimer ends ============

	signat	_startThreeHoursTimer,4216
	global	_isFinishedTwentySecondsTimer
psect	text772,local,class=CODE,delta=2
global __ptext772
__ptext772:

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
psect	text772
	file	"D:\develop\190625\AK7030-OTP\common.c"
	line	399
	global	__size_of_isFinishedTwentySecondsTimer
	__size_of_isFinishedTwentySecondsTimer	equ	__end_of_isFinishedTwentySecondsTimer-_isFinishedTwentySecondsTimer
	
_isFinishedTwentySecondsTimer:	
	opt	stack 5
; Regs used in _isFinishedTwentySecondsTimer: [wreg+status,2+status,0]
	line	400
	
l4129:	
;common.c: 400: if(0 == uiTwentySecondsTimer)
	bsf	status, 5	;RP0=1, select bank1
	movf	((_uiTwentySecondsTimer+1)^080h),w
	iorwf	((_uiTwentySecondsTimer)^080h),w
	skipz
	goto	u1111
	goto	u1110
u1111:
	goto	l4137
u1110:
	line	401
	
l4131:	
;common.c: 401: return 1;
	movlw	(01h)
	goto	l1768
	line	403
	
l4137:	
;common.c: 402: else
;common.c: 403: return 0;
	movlw	(0)
	line	404
	
l1768:	
	return
	opt stack 0
GLOBAL	__end_of_isFinishedTwentySecondsTimer
	__end_of_isFinishedTwentySecondsTimer:
;; =============== function _isFinishedTwentySecondsTimer ends ============

	signat	_isFinishedTwentySecondsTimer,89
	global	_startTwentySecondsTimer
psect	text773,local,class=CODE,delta=2
global __ptext773
__ptext773:

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
psect	text773
	file	"D:\develop\190625\AK7030-OTP\common.c"
	line	393
	global	__size_of_startTwentySecondsTimer
	__size_of_startTwentySecondsTimer	equ	__end_of_startTwentySecondsTimer-_startTwentySecondsTimer
	
_startTwentySecondsTimer:	
	opt	stack 5
; Regs used in _startTwentySecondsTimer: [wreg]
	line	394
	
l4127:	
;common.c: 394: uiTwentySecondsTimer = 20;
	movlw	014h
	bsf	status, 5	;RP0=1, select bank1
	movwf	(_uiTwentySecondsTimer)^080h
	clrf	(_uiTwentySecondsTimer+1)^080h
	line	395
	
l1764:	
	return
	opt stack 0
GLOBAL	__end_of_startTwentySecondsTimer
	__end_of_startTwentySecondsTimer:
;; =============== function _startTwentySecondsTimer ends ============

	signat	_startTwentySecondsTimer,88
	global	_isFinishedTwelveHoursTimer
psect	text774,local,class=CODE,delta=2
global __ptext774
__ptext774:

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
psect	text774
	file	"D:\develop\190625\AK7030-OTP\common.c"
	line	408
	global	__size_of_isFinishedTwelveHoursTimer
	__size_of_isFinishedTwelveHoursTimer	equ	__end_of_isFinishedTwelveHoursTimer-_isFinishedTwelveHoursTimer
	
_isFinishedTwelveHoursTimer:	
	opt	stack 5
; Regs used in _isFinishedTwelveHoursTimer: [wreg+status,2+status,0]
	line	409
	
l4115:	
;common.c: 409: if(uiBigTimer == 0)
	bsf	status, 5	;RP0=1, select bank1
	movf	((_uiBigTimer+1)^080h),w
	iorwf	((_uiBigTimer)^080h),w
	skipz
	goto	u1101
	goto	u1100
u1101:
	goto	l4123
u1100:
	line	410
	
l4117:	
;common.c: 410: return 1;
	movlw	(01h)
	goto	l1773
	line	412
	
l4123:	
;common.c: 411: else
;common.c: 412: return 0;
	movlw	(0)
	line	413
	
l1773:	
	return
	opt stack 0
GLOBAL	__end_of_isFinishedTwelveHoursTimer
	__end_of_isFinishedTwelveHoursTimer:
;; =============== function _isFinishedTwelveHoursTimer ends ============

	signat	_isFinishedTwelveHoursTimer,89
	global	_startTwelveHourTimer
psect	text775,local,class=CODE,delta=2
global __ptext775
__ptext775:

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
psect	text775
	file	"D:\develop\190625\AK7030-OTP\common.c"
	line	354
	global	__size_of_startTwelveHourTimer
	__size_of_startTwelveHourTimer	equ	__end_of_startTwelveHourTimer-_startTwelveHourTimer
	
_startTwelveHourTimer:	
	opt	stack 5
; Regs used in _startTwelveHourTimer: [wreg+status,2+status,0]
	line	355
	
l4111:	
;common.c: 355: if(0 == uiBigTimer)
	bsf	status, 5	;RP0=1, select bank1
	movf	((_uiBigTimer+1)^080h),w
	iorwf	((_uiBigTimer)^080h),w
	skipz
	goto	u1091
	goto	u1090
u1091:
	goto	l1748
u1090:
	line	356
	
l4113:	
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
	
l1748:	
	return
	opt stack 0
GLOBAL	__end_of_startTwelveHourTimer
	__end_of_startTwelveHourTimer:
;; =============== function _startTwelveHourTimer ends ============

	signat	_startTwelveHourTimer,4216
	global	_clrSampeTime
psect	text776,local,class=CODE,delta=2
global __ptext776
__ptext776:

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
psect	text776
	file	"D:\develop\190625\AK7030-OTP\common.c"
	line	434
	global	__size_of_clrSampeTime
	__size_of_clrSampeTime	equ	__end_of_clrSampeTime-_clrSampeTime
	
_clrSampeTime:	
	opt	stack 5
; Regs used in _clrSampeTime: [status,2]
	line	435
	
l4109:	
;common.c: 435: timer.timer10msStopWatch = 0;
	clrf	(_timer)^080h
	line	436
	
l1787:	
	return
	opt stack 0
GLOBAL	__end_of_clrSampeTime
	__end_of_clrSampeTime:
;; =============== function _clrSampeTime ends ============

	signat	_clrSampeTime,88
	global	_isPermitSampleTime
psect	text777,local,class=CODE,delta=2
global __ptext777
__ptext777:

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
psect	text777
	file	"D:\develop\190625\AK7030-OTP\common.c"
	line	424
	global	__size_of_isPermitSampleTime
	__size_of_isPermitSampleTime	equ	__end_of_isPermitSampleTime-_isPermitSampleTime
	
_isPermitSampleTime:	
	opt	stack 5
; Regs used in _isPermitSampleTime: [wreg]
	line	425
	
l4097:	
;common.c: 425: if(timer.timer10msStopWatch >= 10)
	movlw	(0Ah)
	bsf	status, 5	;RP0=1, select bank1
	subwf	(_timer)^080h,w
	skipc
	goto	u1081
	goto	u1080
u1081:
	goto	l4105
u1080:
	line	427
	
l4099:	
;common.c: 426: {
;common.c: 427: return 1;
	movlw	(01h)
	goto	l1783
	line	430
	
l4105:	
;common.c: 429: else
;common.c: 430: return 0;
	movlw	(0)
	line	431
	
l1783:	
	return
	opt stack 0
GLOBAL	__end_of_isPermitSampleTime
	__end_of_isPermitSampleTime:
;; =============== function _isPermitSampleTime ends ============

	signat	_isPermitSampleTime,89
	global	_adc_start
psect	text778,local,class=CODE,delta=2
global __ptext778
__ptext778:

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
psect	text778
	file	"D:\develop\190625\AK7030-OTP\periph.c"
	line	100
	global	__size_of_adc_start
	__size_of_adc_start	equ	__end_of_adc_start-_adc_start
	
_adc_start:	
	opt	stack 4
; Regs used in _adc_start: []
	line	101
	
l4095:	
;periph.c: 101: GO=1;
	bcf	status, 5	;RP0=0, select bank0
	bsf	(249/8),(249)&7
	line	102
	
l2455:	
	return
	opt stack 0
GLOBAL	__end_of_adc_start
	__end_of_adc_start:
;; =============== function _adc_start ends ============

	signat	_adc_start,88
	global	_op2_init
psect	text779,local,class=CODE,delta=2
global __ptext779
__ptext779:

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
psect	text779
	file	"D:\develop\190625\AK7030-OTP\periph.c"
	line	45
	global	__size_of_op2_init
	__size_of_op2_init	equ	__end_of_op2_init-_op2_init
	
_op2_init:	
	opt	stack 5
; Regs used in _op2_init: [wreg]
	line	52
	
l4093:	
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
	
l2441:	
	return
	opt stack 0
GLOBAL	__end_of_op2_init
	__end_of_op2_init:
;; =============== function _op2_init ends ============

	signat	_op2_init,88
	global	_op1_init
psect	text780,local,class=CODE,delta=2
global __ptext780
__ptext780:

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
psect	text780
	file	"D:\develop\190625\AK7030-OTP\periph.c"
	line	26
	global	__size_of_op1_init
	__size_of_op1_init	equ	__end_of_op1_init-_op1_init
	
_op1_init:	
	opt	stack 5
; Regs used in _op1_init: [wreg]
	line	33
	
l4087:	
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
	
l4089:	
;periph.c: 38: TRISB3=1;
	bsf	status, 5	;RP0=1, select bank1
	bsf	(1075/8)^080h,(1075)&7
	line	40
	
l4091:	
;periph.c: 40: TRISB5=0;
	bcf	(1077/8)^080h,(1077)&7
	line	41
	
l2438:	
	return
	opt stack 0
GLOBAL	__end_of_op1_init
	__end_of_op1_init:
;; =============== function _op1_init ends ============

	signat	_op1_init,88
	global	_dac_init
psect	text781,local,class=CODE,delta=2
global __ptext781
__ptext781:

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
psect	text781
	file	"D:\develop\190625\AK7030-OTP\periph.c"
	line	14
	global	__size_of_dac_init
	__size_of_dac_init	equ	__end_of_dac_init-_dac_init
	
_dac_init:	
	opt	stack 5
; Regs used in _dac_init: [wreg]
	line	15
	
l4081:	
;periph.c: 15: DACCON|=1;
	bsf	(135)^080h+(0/8),(0)&7	;volatile
	line	17
	
l4083:	
;periph.c: 17: DACR0=0x0F;
	movlw	(0Fh)
	movwf	(136)^080h	;volatile
	line	18
	
l4085:	
;periph.c: 18: DACCON|=(1)<<2;
	bsf	(135)^080h+(2/8),(2)&7	;volatile
	line	22
	
l2435:	
	return
	opt stack 0
GLOBAL	__end_of_dac_init
	__end_of_dac_init:
;; =============== function _dac_init ends ============

	signat	_dac_init,88
	global	_adc_test_init
psect	text782,local,class=CODE,delta=2
global __ptext782
__ptext782:

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
psect	text782
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
	
l4071:	
;periph.c: 86: ADCON0 = 0x00;
	clrf	(31)	;volatile
	line	87
	
l4073:	
;periph.c: 87: ADCON0|=channel<<2;
	movf	(adc_test_init@channel),w
	movwf	(??_adc_test_init+0)+0
	clrc
	rlf	(??_adc_test_init+0)+0,f
	clrc
	rlf	(??_adc_test_init+0)+0,w
	iorwf	(31),f	;volatile
	line	88
	
l4075:	
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
	
l4077:	
;periph.c: 89: ADON=1;
	bcf	status, 5	;RP0=0, select bank0
	bsf	(248/8),(248)&7
	line	90
	
l4079:	
;periph.c: 90: ADIE=1;
	bsf	status, 5	;RP0=1, select bank1
	bsf	(1130/8)^080h,(1130)&7
	line	91
	
l2449:	
	return
	opt stack 0
GLOBAL	__end_of_adc_test_init
	__end_of_adc_test_init:
;; =============== function _adc_test_init ends ============

	signat	_adc_test_init,8312
	global	_timer1_interrupt_config
psect	text783,local,class=CODE,delta=2
global __ptext783
__ptext783:

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
psect	text783
	file	"D:\develop\190625\AK7030-OTP\common.c"
	line	192
	global	__size_of_timer1_interrupt_config
	__size_of_timer1_interrupt_config	equ	__end_of_timer1_interrupt_config-_timer1_interrupt_config
	
_timer1_interrupt_config:	
	opt	stack 5
; Regs used in _timer1_interrupt_config: []
	line	193
	
l4069:	
;common.c: 193: GIE = 1;
	bsf	(95/8),(95)&7
	line	194
;common.c: 194: PEIE = 1;
	bsf	(94/8),(94)&7
	line	195
	
l1707:	
	return
	opt stack 0
GLOBAL	__end_of_timer1_interrupt_config
	__end_of_timer1_interrupt_config:
;; =============== function _timer1_interrupt_config ends ============

	signat	_timer1_interrupt_config,88
	global	_timer1_config
psect	text784,local,class=CODE,delta=2
global __ptext784
__ptext784:

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
psect	text784
	file	"D:\develop\190625\AK7030-OTP\common.c"
	line	180
	global	__size_of_timer1_config
	__size_of_timer1_config	equ	__end_of_timer1_config-_timer1_config
	
_timer1_config:	
	opt	stack 5
; Regs used in _timer1_config: [wreg]
	line	182
	
l4065:	
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
	
l4067:	
;common.c: 185: TMR1IE=1;
	bsf	status, 5	;RP0=1, select bank1
	bsf	(1120/8)^080h,(1120)&7
	line	187
	
l1704:	
	return
	opt stack 0
GLOBAL	__end_of_timer1_config
	__end_of_timer1_config:
;; =============== function _timer1_config ends ============

	signat	_timer1_config,88
	global	_clock_config
psect	text785,local,class=CODE,delta=2
global __ptext785
__ptext785:

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
psect	text785
	file	"D:\develop\190625\AK7030-OTP\common.c"
	line	172
	global	__size_of_clock_config
	__size_of_clock_config	equ	__end_of_clock_config-_clock_config
	
_clock_config:	
	opt	stack 5
; Regs used in _clock_config: [wreg+status,2]
	line	174
	
l4061:	
;common.c: 174: CLKPR = 0x80;
	movlw	(080h)
	bcf	status, 5	;RP0=0, select bank2
	bsf	status, 6	;RP1=1, select bank2
	movwf	(264)^0100h	;volatile
	line	175
	
l4063:	
;common.c: 175: CLKPR = 0x00;
	clrf	(264)^0100h	;volatile
	line	176
;common.c: 176: while(CLKPCE);
	
l1698:	
	btfsc	(2119/8)^0100h,(2119)&7
	goto	u1071
	goto	u1070
u1071:
	goto	l1698
u1070:
	line	177
	
l1701:	
	return
	opt stack 0
GLOBAL	__end_of_clock_config
	__end_of_clock_config:
;; =============== function _clock_config ends ============

	signat	_clock_config,88
	global	_initPin
psect	text786,local,class=CODE,delta=2
global __ptext786
__ptext786:

;; *************** function _initPin *****************
;; Defined at:
;;		line 107 in file "D:\develop\190625\AK7030-OTP\main.c"
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
psect	text786
	file	"D:\develop\190625\AK7030-OTP\main.c"
	line	107
	global	__size_of_initPin
	__size_of_initPin	equ	__end_of_initPin-_initPin
	
_initPin:	
	opt	stack 5
; Regs used in _initPin: []
	line	108
	
l4059:	
;main.c: 108: PB6 = 1;
	bcf	status, 5	;RP0=0, select bank0
	bsf	(54/8),(54)&7
	line	109
;main.c: 109: PBOD6 = 1;
	bsf	status, 5	;RP0=1, select bank3
	bsf	status, 6	;RP1=1, select bank3
	bsf	(3142/8)^0180h,(3142)&7
	line	113
;main.c: 113: PA0 = 0;
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
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
	line	117
;main.c: 117: PB0 = 0;
	bcf	(48/8),(48)&7
	line	118
;main.c: 118: PB1 = 1;
	bsf	(49/8),(49)&7
	line	119
;main.c: 119: PA6 = 0;
	bcf	(46/8),(46)&7
	line	121
;main.c: 121: PB7 = 0;
	bcf	(55/8),(55)&7
	line	122
;main.c: 122: PBOD7 = 0;
	bsf	status, 5	;RP0=1, select bank3
	bsf	status, 6	;RP1=1, select bank3
	bcf	(3143/8)^0180h,(3143)&7
	line	124
	
l685:	
	return
	opt stack 0
GLOBAL	__end_of_initPin
	__end_of_initPin:
;; =============== function _initPin ends ============

	signat	_initPin,88
	global	_clearTwentySecondsTimer
psect	text787,local,class=CODE,delta=2
global __ptext787
__ptext787:

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
;;		_clearAllTimer
;;		_main
;; This function uses a non-reentrant model
;;
psect	text787
	file	"D:\develop\190625\AK7030-OTP\common.c"
	line	376
	global	__size_of_clearTwentySecondsTimer
	__size_of_clearTwentySecondsTimer	equ	__end_of_clearTwentySecondsTimer-_clearTwentySecondsTimer
	
_clearTwentySecondsTimer:	
	opt	stack 4
; Regs used in _clearTwentySecondsTimer: [status,2]
	line	377
	
l4057:	
;common.c: 377: uiTwentySecondsTimer = 0;
	bsf	status, 5	;RP0=1, select bank1
	clrf	(_uiTwentySecondsTimer)^080h
	clrf	(_uiTwentySecondsTimer+1)^080h
	line	378
	
l1757:	
	return
	opt stack 0
GLOBAL	__end_of_clearTwentySecondsTimer
	__end_of_clearTwentySecondsTimer:
;; =============== function _clearTwentySecondsTimer ends ============

	signat	_clearTwentySecondsTimer,88
	global	_clearThreeHoursTimer
psect	text788,local,class=CODE,delta=2
global __ptext788
__ptext788:

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
;;		_clearAllTimer
;;		_main
;; This function uses a non-reentrant model
;;
psect	text788
	file	"D:\develop\190625\AK7030-OTP\common.c"
	line	371
	global	__size_of_clearThreeHoursTimer
	__size_of_clearThreeHoursTimer	equ	__end_of_clearThreeHoursTimer-_clearThreeHoursTimer
	
_clearThreeHoursTimer:	
	opt	stack 4
; Regs used in _clearThreeHoursTimer: [status,2]
	line	372
	
l4055:	
;common.c: 372: uiSmallTimer = 0;
	bsf	status, 5	;RP0=1, select bank1
	clrf	(_uiSmallTimer)^080h
	clrf	(_uiSmallTimer+1)^080h
	line	373
	
l1754:	
	return
	opt stack 0
GLOBAL	__end_of_clearThreeHoursTimer
	__end_of_clearThreeHoursTimer:
;; =============== function _clearThreeHoursTimer ends ============

	signat	_clearThreeHoursTimer,88
	global	_clearTwelveHoursTimer
psect	text789,local,class=CODE,delta=2
global __ptext789
__ptext789:

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
;; This function uses a non-reentrant model
;;
psect	text789
	file	"D:\develop\190625\AK7030-OTP\common.c"
	line	365
	global	__size_of_clearTwelveHoursTimer
	__size_of_clearTwelveHoursTimer	equ	__end_of_clearTwelveHoursTimer-_clearTwelveHoursTimer
	
_clearTwelveHoursTimer:	
	opt	stack 4
; Regs used in _clearTwelveHoursTimer: [status,2]
	line	366
	
l4053:	
;common.c: 366: uiBigTimer = 0;
	bsf	status, 5	;RP0=1, select bank1
	clrf	(_uiBigTimer)^080h
	clrf	(_uiBigTimer+1)^080h
	line	367
	
l1751:	
	return
	opt stack 0
GLOBAL	__end_of_clearTwelveHoursTimer
	__end_of_clearTwelveHoursTimer:
;; =============== function _clearTwelveHoursTimer ends ============

	signat	_clearTwelveHoursTimer,88
	global	_ISR
psect	text790,local,class=CODE,delta=2
global __ptext790
__ptext790:

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
psect	text790
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
psect	text790
	line	442
	
i1l4283:	
;common.c: 440: static unsigned char ucTimer1sCnt = 0;
;common.c: 442: if(TMR1IF == 1)
	btfss	(96/8),(96)&7
	goto	u131_21
	goto	u131_20
u131_21:
	goto	i1l4301
u131_20:
	line	444
	
i1l4285:	
;common.c: 443: {
;common.c: 444: TMR1IF = 0 ;
	bcf	(96/8),(96)&7
	line	445
	
i1l4287:	
;common.c: 445: timer.timer10msStopWatch++;
	bsf	status, 5	;RP0=1, select bank1
	incf	(_timer)^080h,f
	line	446
;common.c: 446: ucTimer1sCnt++;
	incf	(ISR@ucTimer1sCnt)^080h,f
	line	448
	
i1l4289:	
;common.c: 448: if(ucTimer1sCnt >= 100)
	movlw	(064h)
	subwf	(ISR@ucTimer1sCnt)^080h,w
	skipc
	goto	u132_21
	goto	u132_20
u132_21:
	goto	i1l4301
u132_20:
	line	450
	
i1l4291:	
;common.c: 449: {
;common.c: 450: ucTimer1sCnt = 0;
	clrf	(ISR@ucTimer1sCnt)^080h
	line	451
	
i1l4293:	
;common.c: 451: if(uiBigTimer > 0)
	movf	(_uiBigTimer+1)^080h,w
	iorwf	(_uiBigTimer)^080h,w
	skipnz
	goto	u133_21
	goto	u133_20
u133_21:
	goto	i1l1794
u133_20:
	line	452
	
i1l4295:	
;common.c: 452: uiBigTimer--;
	movlw	low(01h)
	subwf	(_uiBigTimer)^080h,f
	movlw	high(01h)
	skipc
	decf	(_uiBigTimer+1)^080h,f
	subwf	(_uiBigTimer+1)^080h,f
	
i1l1794:	
	line	454
;common.c: 454: if(uiSmallTimer)
	movf	(_uiSmallTimer+1)^080h,w
	iorwf	(_uiSmallTimer)^080h,w
	skipnz
	goto	u134_21
	goto	u134_20
u134_21:
	goto	i1l1795
u134_20:
	line	455
	
i1l4297:	
;common.c: 455: uiSmallTimer--;
	movlw	low(01h)
	subwf	(_uiSmallTimer)^080h,f
	movlw	high(01h)
	skipc
	decf	(_uiSmallTimer+1)^080h,f
	subwf	(_uiSmallTimer+1)^080h,f
	
i1l1795:	
	line	457
;common.c: 457: if(uiTwentySecondsTimer)
	movf	(_uiTwentySecondsTimer+1)^080h,w
	iorwf	(_uiTwentySecondsTimer)^080h,w
	skipnz
	goto	u135_21
	goto	u135_20
u135_21:
	goto	i1l4301
u135_20:
	line	458
	
i1l4299:	
;common.c: 458: uiTwentySecondsTimer--;
	movlw	low(01h)
	subwf	(_uiTwentySecondsTimer)^080h,f
	movlw	high(01h)
	skipc
	decf	(_uiTwentySecondsTimer+1)^080h,f
	subwf	(_uiTwentySecondsTimer+1)^080h,f
	line	462
	
i1l4301:	
;common.c: 459: }
;common.c: 460: }
;common.c: 462: if(ADIF)
	bcf	status, 5	;RP0=0, select bank0
	btfss	(106/8),(106)&7
	goto	u136_21
	goto	u136_20
u136_21:
	goto	i1l1802
u136_20:
	line	464
	
i1l4303:	
;common.c: 463: {
;common.c: 464: ADIF=0;
	bcf	(106/8),(106)&7
	line	465
	
i1l4305:	
;common.c: 465: setAD_ConvertFlag(1);
	movlw	(01h)
	fcall	i1_setAD_ConvertFlag
	line	467
	
i1l4307:	
;common.c: 467: if(sampleChannelSelect == 5)
	bcf	status, 5	;RP0=0, select bank0
	movf	(_sampleChannelSelect),w
	xorlw	05h
	skipz
	goto	u137_21
	goto	u137_20
u137_21:
	goto	i1l4311
u137_20:
	line	471
	
i1l4309:	
;common.c: 468: {
;common.c: 471: vPutSampleDataIntoTable(adc_get(),5);
	fcall	_adc_get
	movf	(1+(?_adc_get)),w
	movwf	(?_vPutSampleDataIntoTable+1)
	movf	(0+(?_adc_get)),w
	movwf	(?_vPutSampleDataIntoTable)
	movlw	(05h)
	movwf	0+(?_vPutSampleDataIntoTable)+02h
	fcall	_vPutSampleDataIntoTable
	line	475
;common.c: 475: }
	goto	i1l1802
	line	476
	
i1l4311:	
;common.c: 476: else if(sampleChannelSelect == 1)
	decf	(_sampleChannelSelect),w
	skipz
	goto	u138_21
	goto	u138_20
u138_21:
	goto	i1l4315
u138_20:
	line	479
	
i1l4313:	
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
	goto	i1l1802
	line	490
	
i1l4315:	
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
	
i1l1802:	
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
psect	text791,local,class=CODE,delta=2
global __ptext791
__ptext791:

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
psect	text791
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
	
i1l4321:	
;common.c: 207: adc_convert_flag = flag;
	movf	(i1setAD_ConvertFlag@flag),w
	bsf	status, 5	;RP0=1, select bank1
	movwf	(_adc_convert_flag)^080h
	line	208
	
i1l1713:	
	return
	opt stack 0
GLOBAL	__end_ofi1_setAD_ConvertFlag
	__end_ofi1_setAD_ConvertFlag:
;; =============== function i1_setAD_ConvertFlag ends ============

	signat	i1_setAD_ConvertFlag,88
	global	_adc_get
psect	text792,local,class=CODE,delta=2
global __ptext792
__ptext792:

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
psect	text792
	file	"D:\develop\190625\AK7030-OTP\periph.c"
	line	105
	global	__size_of_adc_get
	__size_of_adc_get	equ	__end_of_adc_get-_adc_get
	
_adc_get:	
	opt	stack 3
; Regs used in _adc_get: [wreg]
	line	107
	
i1l4317:	
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
	
i1l2458:	
	return
	opt stack 0
GLOBAL	__end_of_adc_get
	__end_of_adc_get:
;; =============== function _adc_get ends ============

	signat	_adc_get,90
	global	_vPutSampleDataIntoTable
psect	text793,local,class=CODE,delta=2
global __ptext793
__ptext793:

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
psect	text793
	file	"D:\develop\190625\AK7030-OTP\common.c"
	line	97
	global	__size_of_vPutSampleDataIntoTable
	__size_of_vPutSampleDataIntoTable	equ	__end_of_vPutSampleDataIntoTable-_vPutSampleDataIntoTable
	
_vPutSampleDataIntoTable:	
	opt	stack 3
; Regs used in _vPutSampleDataIntoTable: [wreg-fsr0h+status,2+status,0+btemp+1]
	line	105
	
i1l4207:	
;common.c: 99: static unsigned char ucChannelFirstLength = 0;
;common.c: 101: static unsigned char ucChannelFourthLength = 0;
;common.c: 103: static unsigned char ucChannelFourteenthLength = 0;
;common.c: 105: if(channel == 1)
	decf	(vPutSampleDataIntoTable@channel),w
	skipz
	goto	u119_21
	goto	u119_20
u119_21:
	goto	i1l4219
u119_20:
	line	107
	
i1l4209:	
;common.c: 106: {
;common.c: 107: if(ucChannelFirstLength < 12)
	movlw	(0Ch)
	subwf	(vPutSampleDataIntoTable@ucChannelFirstLength),w
	skipnc
	goto	u120_21
	goto	u120_20
u120_21:
	goto	i1l4215
u120_20:
	line	109
	
i1l4211:	
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
	
i1l4213:	
;common.c: 111: ucChannelFirstLength++;
	incf	(vPutSampleDataIntoTable@ucChannelFirstLength),f
	line	112
;common.c: 112: }
	goto	i1l1695
	line	115
	
i1l4215:	
;common.c: 113: else
;common.c: 114: {
;common.c: 115: ucChannelFirstLength = 0;
	clrf	(vPutSampleDataIntoTable@ucChannelFirstLength)
	line	117
	
i1l4217:	
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
	goto	i1l1695
	line	120
	
i1l4219:	
;common.c: 120: else if(channel == 5)
	movf	(vPutSampleDataIntoTable@channel),w
	xorlw	05h
	skipz
	goto	u121_21
	goto	u121_20
u121_21:
	goto	i1l4231
u121_20:
	line	122
	
i1l4221:	
;common.c: 121: {
;common.c: 122: if(ucChannelFourthLength < 12)
	movlw	(0Ch)
	bcf	status, 5	;RP0=0, select bank0
	subwf	(vPutSampleDataIntoTable@ucChannelFourthLength),w
	skipnc
	goto	u122_21
	goto	u122_20
u122_21:
	goto	i1l4227
u122_20:
	line	124
	
i1l4223:	
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
	
i1l4225:	
;common.c: 126: ucChannelFourthLength++;
	incf	(vPutSampleDataIntoTable@ucChannelFourthLength),f
	line	127
;common.c: 127: }
	goto	i1l1695
	line	130
	
i1l4227:	
;common.c: 128: else
;common.c: 129: {
;common.c: 130: ucChannelFourthLength = 0;
	clrf	(vPutSampleDataIntoTable@ucChannelFourthLength)
	line	132
	
i1l4229:	
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
	goto	i1l1695
	line	135
	
i1l4231:	
;common.c: 135: else if(channel == 14)
	movf	(vPutSampleDataIntoTable@channel),w
	xorlw	0Eh
	skipz
	goto	u123_21
	goto	u123_20
u123_21:
	goto	i1l4243
u123_20:
	line	137
	
i1l4233:	
;common.c: 136: {
;common.c: 137: if(ucChannelFourteenthLength < 12)
	movlw	(0Ch)
	bcf	status, 5	;RP0=0, select bank0
	subwf	(vPutSampleDataIntoTable@ucChannelFourteenthLength),w
	skipnc
	goto	u124_21
	goto	u124_20
u124_21:
	goto	i1l4239
u124_20:
	line	139
	
i1l4235:	
;common.c: 138: {
;common.c: 139: uiSampleChannelFourteenth[ucChannelFourteenthLength] = uiSampleData;
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
	line	141
	
i1l4237:	
;common.c: 141: ucChannelFourteenthLength++;
	incf	(vPutSampleDataIntoTable@ucChannelFourteenthLength),f
	line	142
;common.c: 142: }
	goto	i1l1695
	line	145
	
i1l4239:	
;common.c: 143: else
;common.c: 144: {
;common.c: 145: ucChannelFourteenthLength = 0;
	clrf	(vPutSampleDataIntoTable@ucChannelFourteenthLength)
	line	147
	
i1l4241:	
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
	goto	i1l1695
	line	152
	
i1l4243:	
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
	
i1l4249:	
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
	
i1l4251:	
	incf	(vPutSampleDataIntoTable@i),f
	skipnz
	incf	(vPutSampleDataIntoTable@i+1),f
	
i1l4253:	
	movf	(vPutSampleDataIntoTable@i+1),w
	xorlw	80h
	movwf	btemp+1
	movlw	(high(0Ch))^80h
	subwf	btemp+1,w
	skipz
	goto	u125_25
	movlw	low(0Ch)
	subwf	(vPutSampleDataIntoTable@i),w
u125_25:

	skipc
	goto	u125_21
	goto	u125_20
u125_21:
	goto	i1l4249
u125_20:
	line	168
	
i1l1695:	
	return
	opt stack 0
GLOBAL	__end_of_vPutSampleDataIntoTable
	__end_of_vPutSampleDataIntoTable:
;; =============== function _vPutSampleDataIntoTable ends ============

	signat	_vPutSampleDataIntoTable,8312
psect	text794,local,class=CODE,delta=2
global __ptext794
__ptext794:
	global	btemp
	btemp set 07Eh

	DABS	1,126,2	;btemp
	global	wtemp0
	wtemp0 set btemp
	end
