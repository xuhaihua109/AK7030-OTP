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
	global	_sampleTimes
	global	main@enumBranchStep
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
	global	main@ucTimerForDACR0_CNT1
	global	main@ucTimerForDACR0_CNT1_f
	global	main@ucTimerForDACR0_CNT2
	global	main@ucTimerForDACR0_CNT2_f
	global	main@ucTimerLessADC1ZeroP5s
	global	main@ucTimerLessX1P5s
	global	main@ucTimerLessX2P5s
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
	global	_adc_convert_flag
	global	_timer
	global	main@cTimer1s_823
	global	main@enumInteralStep
	global	main@ucTimerP3s
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
_sampleTimes:
       ds      1

main@enumBranchStep:
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

main@ucTimerLessX2P5s:
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

_adc_convert_flag:
       ds      1

_timer:
       ds      1

main@cTimer1s_823:
       ds      1

main@enumInteralStep:
       ds      1

main@ucTimerP3s:
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
	movlw	low((__pbssBANK1)+03Ch)
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
;;Data sizes: Strings 0, constant 0, data 1, bss 123, persistent 0 stack 0
;;Auto spaces:   Size  Autos    Used
;; COMMON          14     13      14
;; BANK0           80     40      79
;; BANK1           80      0      60
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
;;BANK1               50      0      3C       8       75.0%
;;BITBANK1            50      0       0       7        0.0%
;;CODE                 0      0       0       0        0.0%
;;DATA                 0      0      B8       6        0.0%
;;ABS                  0      0      B1       3        0.0%
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
	
l4223:	
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
	
l4225:	
;main.c: 161: initPin();
	fcall	_initPin
	line	164
	
l4227:	
;main.c: 164: TRISB2 = 1;
	bcf	status, 6	;RP1=0, select bank1
	bsf	(1074/8)^080h,(1074)&7
	line	166
	
l4229:	
;main.c: 166: TRISB7 = 1;
	bsf	(1079/8)^080h,(1079)&7
	line	167
	
l4231:	
;main.c: 167: TRISB4 = 1;
	bsf	(1076/8)^080h,(1076)&7
	line	169
	
l4233:	
;main.c: 169: clock_config();
	fcall	_clock_config
	line	170
	
l4235:	
;main.c: 170: timer1_config();
	fcall	_timer1_config
	line	171
;main.c: 171: timer1_interrupt_config();
	fcall	_timer1_interrupt_config
	line	173
	
l4237:	
;main.c: 173: adc_test_init(14,3);
	movlw	(03h)
	bcf	status, 5	;RP0=0, select bank0
	movwf	(?_adc_test_init)
	movlw	(0Eh)
	fcall	_adc_test_init
	line	175
	
l4239:	
;main.c: 175: dac_init();
	fcall	_dac_init
	line	176
	
l4241:	
;main.c: 176: op1_init();
	fcall	_op1_init
	line	177
	
l4243:	
;main.c: 177: op2_init();
	fcall	_op2_init
	line	180
;main.c: 180: adc_start();
	fcall	_adc_start
	line	216
	
l4245:	
# 216 "D:\develop\190625\AK7030-OTP\main.c"
 clrwdt ;#
psect	maintext
	line	218
	
l4247:	
;main.c: 218: process_AD_Converter_Value();
	fcall	_process_AD_Converter_Value
	line	220
	
l4249:	
;main.c: 220: if(isPermitSampleTime())
	fcall	_isPermitSampleTime
	xorlw	0
	skipnz
	goto	u1371
	goto	u1370
u1371:
	goto	l4245
u1370:
	line	222
	
l4251:	
;main.c: 221: {
;main.c: 222: clrSampeTime();
	fcall	_clrSampeTime
	line	224
	
l4253:	
;main.c: 224: if(ucTimerPowerLed < 30)
	movlw	(01Eh)
	bcf	status, 5	;RP0=0, select bank0
	subwf	(main@ucTimerPowerLed),w
	skipnc
	goto	u1381
	goto	u1380
u1381:
	goto	l4257
u1380:
	line	226
	
l4255:	
;main.c: 225: {
;main.c: 226: ucTimerPowerLed ++;
	incf	(main@ucTimerPowerLed),f
	line	227
;main.c: 227: }
	goto	l4813
	line	230
	
l4257:	
;main.c: 228: else
;main.c: 229: {
;main.c: 230: ucTimerPowerLed = 0;
	clrf	(main@ucTimerPowerLed)
	line	231
	
l4259:	
;main.c: 231: PB1 = 0;
	bcf	(49/8),(49)&7
	goto	l4813
	line	240
	
l4261:	
;main.c: 238: {
;main.c: 239: static unsigned char ucTimerZeroPoint5s = 0;
;main.c: 240: if(getAdOriginalCh14Value() > 1950)
	fcall	_getAdOriginalCh14Value
	movlw	high(079Fh)
	subwf	(1+(?_getAdOriginalCh14Value)),w
	movlw	low(079Fh)
	skipnz
	subwf	(0+(?_getAdOriginalCh14Value)),w
	skipc
	goto	u1391
	goto	u1390
u1391:
	goto	l4265
u1390:
	line	242
	
l4263:	
;main.c: 241: {
;main.c: 242: ucTimerZeroPoint5s++;
	incf	(main@ucTimerZeroPoint5s),f
	line	243
;main.c: 243: }
	goto	l4267
	line	245
	
l4265:	
;main.c: 244: else
;main.c: 245: ucTimerZeroPoint5s = 0;
	clrf	(main@ucTimerZeroPoint5s)
	line	247
	
l4267:	
;main.c: 247: if(ucTimerZeroPoint5s >= 5)
	movlw	(05h)
	subwf	(main@ucTimerZeroPoint5s),w
	skipc
	goto	u1401
	goto	u1400
u1401:
	goto	l4245
u1400:
	line	249
	
l4269:	
;main.c: 248: {
;main.c: 249: ucTimerZeroPoint5s = 0;
	clrf	(main@ucTimerZeroPoint5s)
	line	250
	
l4271:	
;main.c: 250: enumMainLoopStep = MAIN_LOOP_STEP_FIRST;
	bcf	status, 5	;RP0=0, select bank0
	clrf	(main@enumMainLoopStep)
	incf	(main@enumMainLoopStep),f
	goto	l4245
	line	251
	
l710:	
	line	252
;main.c: 251: }
;main.c: 252: break;
	goto	l4245
	line	260
	
l4273:	
;main.c: 256: {
;main.c: 257: static unsigned char ucTimerZeroPoint3s = 0;
;main.c: 260: if(getAdOriginalCh14Value() > 1950)
	fcall	_getAdOriginalCh14Value
	movlw	high(079Fh)
	subwf	(1+(?_getAdOriginalCh14Value)),w
	movlw	low(079Fh)
	skipnz
	subwf	(0+(?_getAdOriginalCh14Value)),w
	skipc
	goto	u1411
	goto	u1410
u1411:
	goto	l4279
u1410:
	line	263
	
l4275:	
;main.c: 261: {
;main.c: 263: enumMainLoopStep = MAIN_LOOP_STEP_SECOND;
	movlw	(02h)
	movwf	(main@enumMainLoopStep)
	line	265
	
l4277:	
;main.c: 265: ucTimerZeroPoint3s = 0;
	clrf	(main@ucTimerZeroPoint3s)
	line	268
;main.c: 268: }
	goto	l4245
	line	271
	
l4279:	
;main.c: 269: else
;main.c: 270: {
;main.c: 271: ucTimerZeroPoint3s++;
	incf	(main@ucTimerZeroPoint3s),f
	line	273
	
l4281:	
;main.c: 273: if(ucTimerZeroPoint3s >= 3)
	movlw	(03h)
	subwf	(main@ucTimerZeroPoint3s),w
	skipc
	goto	u1421
	goto	u1420
u1421:
	goto	l710
u1420:
	line	275
	
l4283:	
;main.c: 274: {
;main.c: 275: ucTimerZeroPoint3s = 0;
	clrf	(main@ucTimerZeroPoint3s)
	line	277
	
l4285:	
;main.c: 277: clearPinPortAndTimer();
	fcall	_clearPinPortAndTimer
	goto	l4245
	line	285
;main.c: 283: }
;main.c: 285: case MAIN_LOOP_STEP_SECOND:
	
l718:	
	line	289
;main.c: 286: {
;main.c: 287: static unsigned char ucTimerP5s = 0;
;main.c: 289: PA6 = 1;
	bsf	(46/8),(46)&7
	line	291
	
l4287:	
;main.c: 291: if(ucTimerP5s < 5)
	movlw	(05h)
	subwf	(main@ucTimerP5s),w
	skipnc
	goto	u1431
	goto	u1430
u1431:
	goto	l4291
u1430:
	line	292
	
l4289:	
;main.c: 292: ucTimerP5s++;
	incf	(main@ucTimerP5s),f
	goto	l4245
	line	295
	
l4291:	
;main.c: 293: else
;main.c: 294: {
;main.c: 295: ucTimerP5s = 0;
	clrf	(main@ucTimerP5s)
	line	297
	
l4293:	
;main.c: 297: enumMainLoopStep = MAIN_LOOP_STEP_THIRD;
	movlw	(03h)
	movwf	(main@enumMainLoopStep)
	goto	l4245
	line	313
	
l4295:	
;main.c: 304: {
;main.c: 305: static unsigned char ucTimerADC1ZeroP5s = 0;
;main.c: 307: static unsigned char ucTimerLessADC1ZeroP5s = 0;
;main.c: 309: static unsigned char ucTimerLessADC1ZeroP5sFlag = 0;
;main.c: 311: static unsigned char ucTimerRightP5s = 0;
;main.c: 313: if(getAdOriginalCh1Value() < 115)
	fcall	_getAdOriginalCh1Value
	movlw	high(073h)
	subwf	(1+(?_getAdOriginalCh1Value)),w
	movlw	low(073h)
	skipnz
	subwf	(0+(?_getAdOriginalCh1Value)),w
	skipnc
	goto	u1441
	goto	u1440
u1441:
	goto	l4301
u1440:
	line	315
	
l4297:	
;main.c: 314: {
;main.c: 315: ucTimerADC1ZeroP5s = 0;
	clrf	(main@ucTimerADC1ZeroP5s)
	line	317
	
l4299:	
;main.c: 317: ucTimerLessADC1ZeroP5s++;
	incf	(main@ucTimerLessADC1ZeroP5s),f
	line	318
;main.c: 318: }
	goto	l4305
	line	321
	
l4301:	
;main.c: 319: else
;main.c: 320: {
;main.c: 321: ucTimerADC1ZeroP5s++;
	incf	(main@ucTimerADC1ZeroP5s),f
	line	323
	
l4303:	
;main.c: 323: ucTimerLessADC1ZeroP5s = 0;
	clrf	(main@ucTimerLessADC1ZeroP5s)
	line	326
	
l4305:	
;main.c: 324: }
;main.c: 326: if(ucTimerADC1ZeroP5s >= 5)
	movlw	(05h)
	subwf	(main@ucTimerADC1ZeroP5s),w
	skipc
	goto	u1451
	goto	u1450
u1451:
	goto	l4311
u1450:
	line	328
	
l4307:	
;main.c: 327: {
;main.c: 328: ucTimerADC1ZeroP5s = 0;
	clrf	(main@ucTimerADC1ZeroP5s)
	line	329
	
l4309:	
;main.c: 329: enumMainLoopStep = MAIN_LOOP_STEP_FOURTH;
	movlw	(04h)
	movwf	(main@enumMainLoopStep)
	line	330
;main.c: 330: }
	goto	l4325
	line	331
	
l4311:	
;main.c: 331: else if( ucTimerLessADC1ZeroP5s >= 5)
	movlw	(05h)
	subwf	(main@ucTimerLessADC1ZeroP5s),w
	skipc
	goto	u1461
	goto	u1460
u1461:
	goto	l4325
u1460:
	line	334
	
l4313:	
;main.c: 332: {
;main.c: 334: if(getAdOriginalCh1Value() < 105)
	fcall	_getAdOriginalCh1Value
	movlw	high(069h)
	subwf	(1+(?_getAdOriginalCh1Value)),w
	movlw	low(069h)
	skipnz
	subwf	(0+(?_getAdOriginalCh1Value)),w
	skipnc
	goto	u1471
	goto	u1470
u1471:
	goto	l4317
u1470:
	line	336
	
l4315:	
;main.c: 335: {
;main.c: 336: ucTimerRightP5s++;
	incf	(main@ucTimerRightP5s),f
	line	337
;main.c: 337: }
	goto	l4319
	line	340
	
l4317:	
;main.c: 338: else
;main.c: 339: {
;main.c: 340: ucTimerRightP5s = 0;
	clrf	(main@ucTimerRightP5s)
	line	343
	
l4319:	
;main.c: 341: }
;main.c: 343: if(ucTimerRightP5s >= 5)
	movlw	(05h)
	subwf	(main@ucTimerRightP5s),w
	skipc
	goto	u1481
	goto	u1480
u1481:
	goto	l741
u1480:
	line	345
	
l4321:	
;main.c: 344: {
;main.c: 345: ucTimerLessADC1ZeroP5s = 0;
	clrf	(main@ucTimerLessADC1ZeroP5s)
	line	346
;main.c: 346: ucTimerRightP5s = 0;
	clrf	(main@ucTimerRightP5s)
	line	347
	
l4323:	
;main.c: 347: enumMainLoopStep = MAIN_LOOP_STEP_3_HOUR_BRANCH;
	movlw	(08h)
	movwf	(main@enumMainLoopStep)
	line	348
;main.c: 348: }
	goto	l4325
	line	357
;main.c: 354: else
;main.c: 355: {
;main.c: 356: ;
	
l741:	
	line	359
	
l4325:	
;main.c: 357: }
;main.c: 359: if((MAIN_LOOP_STEP_3_HOUR_BRANCH == enumMainLoopStep) || (MAIN_LOOP_STEP_FOURTH == enumMainLoopStep))
	movf	(main@enumMainLoopStep),w
	xorlw	08h
	skipnz
	goto	u1491
	goto	u1490
u1491:
	goto	l4329
u1490:
	
l4327:	
	movf	(main@enumMainLoopStep),w
	xorlw	04h
	skipz
	goto	u1501
	goto	u1500
u1501:
	goto	l710
u1500:
	line	361
	
l4329:	
;main.c: 360: {
;main.c: 361: ucTimerRightP5s = 0;
	clrf	(main@ucTimerRightP5s)
	line	362
;main.c: 362: ucTimerADC1ZeroP5s = 0;
	clrf	(main@ucTimerADC1ZeroP5s)
	line	363
;main.c: 363: ucTimerLessADC1ZeroP5s = 0;
	clrf	(main@ucTimerLessADC1ZeroP5s)
	goto	l4245
	line	373
	
l4331:	
;main.c: 371: {
;main.c: 373: startTwelveHourTimer(600);
	movlw	low(0258h)
	movwf	(?_startTwelveHourTimer)
	movlw	high(0258h)
	movwf	((?_startTwelveHourTimer))+1
	fcall	_startTwelveHourTimer
	line	374
	
l4333:	
;main.c: 374: enumMainLoopStep = MAIN_LOOP_STEP_FIFTH;
	movlw	(05h)
	bcf	status, 5	;RP0=0, select bank0
	movwf	(main@enumMainLoopStep)
	line	376
;main.c: 376: break;
	goto	l4245
	line	382
	
l4335:	
;main.c: 380: {
;main.c: 382: if(isFinishedTwelveHoursTimer())
	fcall	_isFinishedTwelveHoursTimer
	xorlw	0
	skipnz
	goto	u1511
	goto	u1510
u1511:
	goto	l4695
u1510:
	line	384
	
l4337:	
;main.c: 383: {
;main.c: 384: enumMainLoopStep = MAIN_LOOP_STEP_12_HOUR_END;
	movlw	(09h)
	bcf	status, 5	;RP0=0, select bank0
	movwf	(main@enumMainLoopStep)
	line	385
;main.c: 385: }
	goto	l4245
	line	394
	
l4339:	
;main.c: 393: {
;main.c: 394: startTwentySecondsTimer();
	fcall	_startTwentySecondsTimer
	line	395
	
l4341:	
;main.c: 395: ucADC4_Step = ADC4_STEP_FIRST;
	bcf	status, 5	;RP0=0, select bank0
	clrf	(main@ucADC4_Step)
	incf	(main@ucADC4_Step),f
	line	396
;main.c: 396: break;
	goto	l4245
	line	401
	
l4343:	
;main.c: 400: {
;main.c: 401: if(getAdOriginaCh4Value() < 1911)
	fcall	_getAdOriginaCh4Value
	movlw	high(0777h)
	subwf	(1+(?_getAdOriginaCh4Value)),w
	movlw	low(0777h)
	skipnz
	subwf	(0+(?_getAdOriginaCh4Value)),w
	skipnc
	goto	u1521
	goto	u1520
u1521:
	goto	l4347
u1520:
	line	402
	
l4345:	
;main.c: 402: ucChannel4Type = LESS_THAN_1911;
	clrf	(main@ucChannel4Type)
	goto	l756
	line	403
	
l4347:	
;main.c: 403: else if(getAdOriginaCh4Value() < 2067)
	fcall	_getAdOriginaCh4Value
	movlw	high(0813h)
	subwf	(1+(?_getAdOriginaCh4Value)),w
	movlw	low(0813h)
	skipnz
	subwf	(0+(?_getAdOriginaCh4Value)),w
	skipnc
	goto	u1531
	goto	u1530
u1531:
	goto	l4351
u1530:
	line	404
	
l4349:	
;main.c: 404: ucChannel4Type = BETWEEN_1911_AND_2067;
	clrf	(main@ucChannel4Type)
	incf	(main@ucChannel4Type),f
	goto	l756
	line	405
	
l4351:	
;main.c: 405: else if(getAdOriginaCh4Value() < 2204)
	fcall	_getAdOriginaCh4Value
	movlw	high(089Ch)
	subwf	(1+(?_getAdOriginaCh4Value)),w
	movlw	low(089Ch)
	skipnz
	subwf	(0+(?_getAdOriginaCh4Value)),w
	skipnc
	goto	u1541
	goto	u1540
u1541:
	goto	l4355
u1540:
	line	406
	
l4353:	
;main.c: 406: ucChannel4Type = BETWEEN_2067_AND_2204;
	movlw	(02h)
	movwf	(main@ucChannel4Type)
	goto	l756
	line	407
	
l4355:	
;main.c: 407: else if(getAdOriginaCh4Value() < 2340)
	fcall	_getAdOriginaCh4Value
	movlw	high(0924h)
	subwf	(1+(?_getAdOriginaCh4Value)),w
	movlw	low(0924h)
	skipnz
	subwf	(0+(?_getAdOriginaCh4Value)),w
	skipnc
	goto	u1551
	goto	u1550
u1551:
	goto	l4359
u1550:
	line	408
	
l4357:	
;main.c: 408: ucChannel4Type = BETWEEN_2204_AND_2340;
	movlw	(03h)
	movwf	(main@ucChannel4Type)
	goto	l756
	line	410
	
l4359:	
;main.c: 409: else
;main.c: 410: ucChannel4Type = MORE_THAN_2340;
	movlw	(04h)
	movwf	(main@ucChannel4Type)
	
l756:	
	line	412
;main.c: 412: ucADC4_Step = ADC4_STEP_SECOND;
	movlw	(02h)
	movwf	(main@ucADC4_Step)
	line	413
;main.c: 413: break;
	goto	l4245
	line	428
;main.c: 427: {
;main.c: 428: case 0:
	
l771:	
	line	430
;main.c: 429: {
;main.c: 430: PB0 = 1;
	bsf	(48/8),(48)&7
	line	431
	
l4361:	
;main.c: 431: ucLoaderStep++;
	incf	(main@ucLoaderStep),f
	line	432
;main.c: 432: break;
	goto	l4245
	line	437
	
l4363:	
;main.c: 436: {
;main.c: 437: if(ucTimerDelay >= 5)
	movlw	(05h)
	subwf	(main@ucTimerDelay),w
	skipc
	goto	u1561
	goto	u1560
u1561:
	goto	l4371
u1560:
	line	439
	
l4365:	
;main.c: 438: {
;main.c: 439: PA0 = 1;
	bsf	(40/8),(40)&7
	line	440
	
l4367:	
;main.c: 440: ucTimerDelay = 0;
	clrf	(main@ucTimerDelay)
	goto	l4361
	line	444
	
l4371:	
;main.c: 443: else
;main.c: 444: ucTimerDelay++;
	incf	(main@ucTimerDelay),f
	goto	l4245
	line	450
	
l4373:	
;main.c: 449: {
;main.c: 450: if(ucTimerDelay >= 5)
	movlw	(05h)
	subwf	(main@ucTimerDelay),w
	skipc
	goto	u1571
	goto	u1570
u1571:
	goto	l4371
u1570:
	line	452
	
l4375:	
;main.c: 451: {
;main.c: 452: PA1= 1;
	bsf	(41/8),(41)&7
	goto	l4367
	line	464
	
l4383:	
;main.c: 463: {
;main.c: 464: if(ucTimerDelay >= 5)
	movlw	(05h)
	subwf	(main@ucTimerDelay),w
	skipc
	goto	u1581
	goto	u1580
u1581:
	goto	l4371
u1580:
	line	466
	
l4385:	
;main.c: 465: {
;main.c: 466: PA2= 1;
	bsf	(42/8),(42)&7
	goto	l4367
	line	477
	
l4393:	
;main.c: 476: {
;main.c: 477: if(ucTimerDelay >= 5)
	movlw	(05h)
	subwf	(main@ucTimerDelay),w
	skipc
	goto	u1591
	goto	u1590
u1591:
	goto	l4371
u1590:
	line	479
	
l4395:	
;main.c: 478: {
;main.c: 479: PA3 = 1;
	bsf	(43/8),(43)&7
	goto	l4367
	line	490
	
l4403:	
;main.c: 489: {
;main.c: 490: if(ucTimerDelay >= 5)
	movlw	(05h)
	subwf	(main@ucTimerDelay),w
	skipc
	goto	u1601
	goto	u1600
u1601:
	goto	l4371
u1600:
	line	492
	
l4405:	
;main.c: 491: {
;main.c: 492: PB0 = 0;
	bcf	(48/8),(48)&7
	line	493
;main.c: 493: PA0 = 0;
	bcf	(40/8),(40)&7
	line	494
;main.c: 494: PA1 = 0;
	bcf	(41/8),(41)&7
	line	495
;main.c: 495: PA2 = 0;
	bcf	(42/8),(42)&7
	line	496
;main.c: 496: PA3 = 0;
	bcf	(43/8),(43)&7
	goto	l4367
	line	507
	
l4413:	
;main.c: 506: {
;main.c: 507: if(ucTimerDelay >= 2)
	movlw	(02h)
	subwf	(main@ucTimerDelay),w
	skipc
	goto	u1611
	goto	u1610
u1611:
	goto	l4371
u1610:
	line	509
	
l4415:	
;main.c: 508: {
;main.c: 509: ucTimerDelay = 0;
	clrf	(main@ucTimerDelay)
	line	511
;main.c: 511: ucLoaderStep = 0;
	clrf	(main@ucLoaderStep)
	line	512
	
l4417:	
;main.c: 512: ucADC4_Step = ADC4_STEP_THIRD;
	movlw	(03h)
	movwf	(main@ucADC4_Step)
	line	513
;main.c: 513: }
	goto	l4245
	line	426
	
l4423:	
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
movlw high(S5031)
movwf pclath
	clrc
	rlf fsr,w
	addlw low(S5031)
	movwf pc
psect	swtext1,local,class=CONST,delta=2
global __pswtext1
__pswtext1:
S5031:
	ljmp	l771
	ljmp	l4363
	ljmp	l4373
	ljmp	l4383
	ljmp	l4393
	ljmp	l4403
	ljmp	l4413
psect	maintext

	line	533
;main.c: 532: {
;main.c: 533: case 0:
	
l799:	
	line	535
;main.c: 534: {
;main.c: 535: PB0 = 1;
	bsf	(48/8),(48)&7
	line	536
	
l4425:	
;main.c: 536: ucLoaderStep1++;
	incf	(main@ucLoaderStep1),f
	line	537
;main.c: 537: break;
	goto	l4245
	line	542
	
l4427:	
;main.c: 541: {
;main.c: 542: if(ucTimerDelay1 >= 5)
	movlw	(05h)
	subwf	(main@ucTimerDelay1),w
	skipc
	goto	u1621
	goto	u1620
u1621:
	goto	l4435
u1620:
	line	544
	
l4429:	
;main.c: 543: {
;main.c: 544: PA0 = 1;
	bsf	(40/8),(40)&7
	line	545
	
l4431:	
;main.c: 545: ucTimerDelay1 = 0;
	clrf	(main@ucTimerDelay1)
	goto	l4425
	line	549
	
l4435:	
;main.c: 548: else
;main.c: 549: ucTimerDelay1++;
	incf	(main@ucTimerDelay1),f
	goto	l4245
	line	555
	
l4437:	
;main.c: 554: {
;main.c: 555: if(ucTimerDelay1 >= 5)
	movlw	(05h)
	subwf	(main@ucTimerDelay1),w
	skipc
	goto	u1631
	goto	u1630
u1631:
	goto	l4435
u1630:
	line	557
	
l4439:	
;main.c: 556: {
;main.c: 557: PA1= 1;
	bsf	(41/8),(41)&7
	goto	l4431
	line	568
	
l4447:	
;main.c: 567: {
;main.c: 568: if(ucTimerDelay1 >= 5)
	movlw	(05h)
	subwf	(main@ucTimerDelay1),w
	skipc
	goto	u1641
	goto	u1640
u1641:
	goto	l4435
u1640:
	line	570
	
l4449:	
;main.c: 569: {
;main.c: 570: PA2 = 1;
	bsf	(42/8),(42)&7
	goto	l4431
	line	581
	
l4457:	
;main.c: 580: {
;main.c: 581: if(ucTimerDelay1 >= 5)
	movlw	(05h)
	subwf	(main@ucTimerDelay1),w
	skipc
	goto	u1651
	goto	u1650
u1651:
	goto	l4435
u1650:
	line	583
	
l4459:	
;main.c: 582: {
;main.c: 583: PA3 = 1;
	bsf	(43/8),(43)&7
	goto	l4431
	line	594
	
l4467:	
;main.c: 593: {
;main.c: 594: if(ucTimerDelay1 >= 5)
	movlw	(05h)
	subwf	(main@ucTimerDelay1),w
	skipc
	goto	u1661
	goto	u1660
u1661:
	goto	l4435
u1660:
	line	596
	
l4469:	
;main.c: 595: {
;main.c: 596: PA0 = 0;
	bcf	(40/8),(40)&7
	line	597
;main.c: 597: PA1 = 0;
	bcf	(41/8),(41)&7
	line	598
;main.c: 598: PA2 = 0;
	bcf	(42/8),(42)&7
	line	599
;main.c: 599: PA3 = 0;
	bcf	(43/8),(43)&7
	goto	l4431
	line	610
	
l4477:	
;main.c: 609: {
;main.c: 610: if(ucTimerDelay1 >= 2)
	movlw	(02h)
	subwf	(main@ucTimerDelay1),w
	skipc
	goto	u1671
	goto	u1670
u1671:
	goto	l4435
u1670:
	line	612
	
l4479:	
;main.c: 611: {
;main.c: 612: ucTimerDelay1 = 0;
	clrf	(main@ucTimerDelay1)
	line	614
;main.c: 614: ucLoaderStep1 = 0;
	clrf	(main@ucLoaderStep1)
	goto	l4417
	line	531
	
l4487:	
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
movlw high(S5033)
movwf pclath
	clrc
	rlf fsr,w
	addlw low(S5033)
	movwf pc
psect	swtext2,local,class=CONST,delta=2
global __pswtext2
__pswtext2:
S5033:
	ljmp	l799
	ljmp	l4427
	ljmp	l4437
	ljmp	l4447
	ljmp	l4457
	ljmp	l4467
	ljmp	l4477
psect	maintext

	line	637
;main.c: 636: {
;main.c: 637: case 0:
	
l826:	
	line	639
;main.c: 638: {
;main.c: 639: PB0 = 1;
	bsf	(48/8),(48)&7
	line	640
;main.c: 640: PA0 = 1;
	bsf	(40/8),(40)&7
	line	641
	
l4489:	
;main.c: 641: ucLoaderStep2++;
	incf	(main@ucLoaderStep2),f
	line	642
;main.c: 642: break;
	goto	l4245
	line	647
	
l4491:	
;main.c: 646: {
;main.c: 647: if(ucTimerDelay2 >= 5)
	movlw	(05h)
	subwf	(main@ucTimerDelay2),w
	skipc
	goto	u1681
	goto	u1680
u1681:
	goto	l4499
u1680:
	line	649
	
l4493:	
;main.c: 648: {
;main.c: 649: PA1 = 1;
	bsf	(41/8),(41)&7
	line	650
	
l4495:	
;main.c: 650: ucTimerDelay2 = 0;
	clrf	(main@ucTimerDelay2)
	goto	l4489
	line	654
	
l4499:	
;main.c: 653: else
;main.c: 654: ucTimerDelay2++;
	incf	(main@ucTimerDelay2),f
	goto	l4245
	line	660
	
l4501:	
;main.c: 659: {
;main.c: 660: if(ucTimerDelay2 >= 5)
	movlw	(05h)
	subwf	(main@ucTimerDelay2),w
	skipc
	goto	u1691
	goto	u1690
u1691:
	goto	l4499
u1690:
	line	662
	
l4503:	
;main.c: 661: {
;main.c: 662: PA2 = 1;
	bsf	(42/8),(42)&7
	goto	l4495
	line	673
	
l4511:	
;main.c: 672: {
;main.c: 673: if(ucTimerDelay2 >= 5)
	movlw	(05h)
	subwf	(main@ucTimerDelay2),w
	skipc
	goto	u1701
	goto	u1700
u1701:
	goto	l4499
u1700:
	line	675
	
l4513:	
;main.c: 674: {
;main.c: 675: PA3 = 1;
	bsf	(43/8),(43)&7
	goto	l4495
	line	686
	
l4521:	
;main.c: 685: {
;main.c: 686: if(ucTimerDelay2 >= 5)
	movlw	(05h)
	subwf	(main@ucTimerDelay2),w
	skipc
	goto	u1711
	goto	u1710
u1711:
	goto	l4499
u1710:
	line	689
	
l4523:	
;main.c: 687: {
;main.c: 689: PA1 = 0;
	bcf	(41/8),(41)&7
	line	690
;main.c: 690: PA2 = 0;
	bcf	(42/8),(42)&7
	line	691
;main.c: 691: PA3 = 0;
	bcf	(43/8),(43)&7
	goto	l4495
	line	702
	
l4531:	
;main.c: 701: {
;main.c: 702: if(ucTimerDelay2 >= 2)
	movlw	(02h)
	subwf	(main@ucTimerDelay2),w
	skipc
	goto	u1721
	goto	u1720
u1721:
	goto	l4499
u1720:
	line	704
	
l4533:	
;main.c: 703: {
;main.c: 704: ucTimerDelay2 = 0;
	clrf	(main@ucTimerDelay2)
	line	706
;main.c: 706: ucLoaderStep2 = 0;
	clrf	(main@ucLoaderStep2)
	goto	l4417
	line	635
	
l4541:	
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
movlw high(S5035)
movwf pclath
	clrc
	rlf fsr,w
	addlw low(S5035)
	movwf pc
psect	swtext3,local,class=CONST,delta=2
global __pswtext3
__pswtext3:
S5035:
	ljmp	l826
	ljmp	l4491
	ljmp	l4501
	ljmp	l4511
	ljmp	l4521
	ljmp	l4531
psect	maintext

	line	729
;main.c: 728: {
;main.c: 729: case 0:
	
l850:	
	line	731
;main.c: 730: {
;main.c: 731: PB0 = 1;
	bsf	(48/8),(48)&7
	line	732
;main.c: 732: PA0 = 1;
	bsf	(40/8),(40)&7
	line	733
;main.c: 733: PA1 = 1;
	bsf	(41/8),(41)&7
	line	734
	
l4543:	
;main.c: 734: ucLoaderStep3++;
	incf	(main@ucLoaderStep3),f
	line	735
;main.c: 735: break;
	goto	l4245
	line	740
	
l4545:	
;main.c: 739: {
;main.c: 740: if(ucTimerDelay3 >= 5)
	movlw	(05h)
	subwf	(main@ucTimerDelay3),w
	skipc
	goto	u1731
	goto	u1730
u1731:
	goto	l4553
u1730:
	line	742
	
l4547:	
;main.c: 741: {
;main.c: 742: PA2 = 1;
	bsf	(42/8),(42)&7
	line	743
	
l4549:	
;main.c: 743: ucTimerDelay3 = 0;
	clrf	(main@ucTimerDelay3)
	goto	l4543
	line	747
	
l4553:	
;main.c: 746: else
;main.c: 747: ucTimerDelay3++;
	incf	(main@ucTimerDelay3),f
	goto	l4245
	line	753
	
l4555:	
;main.c: 752: {
;main.c: 753: if(ucTimerDelay3 >= 5)
	movlw	(05h)
	subwf	(main@ucTimerDelay3),w
	skipc
	goto	u1741
	goto	u1740
u1741:
	goto	l4553
u1740:
	line	755
	
l4557:	
;main.c: 754: {
;main.c: 755: PA3 = 1;
	bsf	(43/8),(43)&7
	goto	l4549
	line	767
	
l4565:	
;main.c: 766: {
;main.c: 767: if(ucTimerDelay3 >= 5)
	movlw	(05h)
	subwf	(main@ucTimerDelay3),w
	skipc
	goto	u1751
	goto	u1750
u1751:
	goto	l4553
u1750:
	line	770
	
l4567:	
;main.c: 768: {
;main.c: 770: PA2 = 0;
	bcf	(42/8),(42)&7
	line	771
;main.c: 771: PA3 = 0;
	bcf	(43/8),(43)&7
	goto	l4549
	line	782
	
l4575:	
;main.c: 781: {
;main.c: 782: if(ucTimerDelay3 >= 2)
	movlw	(02h)
	subwf	(main@ucTimerDelay3),w
	skipc
	goto	u1761
	goto	u1760
u1761:
	goto	l4553
u1760:
	line	784
	
l4577:	
;main.c: 783: {
;main.c: 784: ucTimerDelay3 = 0;
	clrf	(main@ucTimerDelay3)
	line	786
;main.c: 786: ucLoaderStep3 = 0;
	clrf	(main@ucLoaderStep3)
	goto	l4417
	line	727
	
l4585:	
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
	goto	l850
	xorlw	1^0	; case 1
	skipnz
	goto	l4545
	xorlw	2^1	; case 2
	skipnz
	goto	l4555
	xorlw	3^2	; case 3
	skipnz
	goto	l4565
	xorlw	4^3	; case 4
	skipnz
	goto	l4575
	goto	l710
	opt asmopt_on

	line	809
;main.c: 808: {
;main.c: 809: case 0:
	
l871:	
	line	811
;main.c: 810: {
;main.c: 811: PB0 = 1;
	bsf	(48/8),(48)&7
	line	812
;main.c: 812: PA0 = 1;
	bsf	(40/8),(40)&7
	line	813
;main.c: 813: PA1 = 1;
	bsf	(41/8),(41)&7
	line	814
;main.c: 814: PA2 = 1;
	bsf	(42/8),(42)&7
	line	815
	
l4587:	
;main.c: 815: ucLoaderStep4++;
	incf	(main@ucLoaderStep4),f
	line	816
;main.c: 816: break;
	goto	l4245
	line	821
	
l4589:	
;main.c: 820: {
;main.c: 821: if(ucTimerDelay4 >= 5)
	movlw	(05h)
	subwf	(main@ucTimerDelay4),w
	skipc
	goto	u1771
	goto	u1770
u1771:
	goto	l4597
u1770:
	line	823
	
l4591:	
;main.c: 822: {
;main.c: 823: PA3 = 1;
	bsf	(43/8),(43)&7
	line	824
	
l4593:	
;main.c: 824: ucTimerDelay4 = 0;
	clrf	(main@ucTimerDelay4)
	goto	l4587
	line	828
	
l4597:	
;main.c: 827: else
;main.c: 828: ucTimerDelay4++;
	incf	(main@ucTimerDelay4),f
	goto	l4245
	line	834
	
l4599:	
;main.c: 833: {
;main.c: 834: if(ucTimerDelay4 >= 5)
	movlw	(05h)
	subwf	(main@ucTimerDelay4),w
	skipc
	goto	u1781
	goto	u1780
u1781:
	goto	l4597
u1780:
	line	836
	
l4601:	
;main.c: 835: {
;main.c: 836: PA3 = 0;
	bcf	(43/8),(43)&7
	goto	l4593
	line	847
	
l4609:	
;main.c: 846: {
;main.c: 847: if(ucTimerDelay4 >= 2)
	movlw	(02h)
	subwf	(main@ucTimerDelay4),w
	skipc
	goto	u1791
	goto	u1790
u1791:
	goto	l4597
u1790:
	line	849
	
l4611:	
;main.c: 848: {
;main.c: 849: ucTimerDelay4 = 0;
	clrf	(main@ucTimerDelay4)
	line	851
;main.c: 851: ucLoaderStep4 = 0;
	clrf	(main@ucLoaderStep4)
	goto	l4417
	line	807
	
l4619:	
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
	goto	l871
	xorlw	1^0	; case 1
	skipnz
	goto	l4589
	xorlw	2^1	; case 2
	skipnz
	goto	l4599
	xorlw	3^2	; case 3
	skipnz
	goto	l4609
	goto	l710
	opt asmopt_on

	line	418
	
l4623:	
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
	goto	l4423
	xorlw	1^0	; case 1
	skipnz
	goto	l4487
	xorlw	2^1	; case 2
	skipnz
	goto	l4541
	xorlw	3^2	; case 3
	skipnz
	goto	l4585
	xorlw	4^3	; case 4
	skipnz
	goto	l4619
	goto	l710
	opt asmopt_on

	line	882
	
l4625:	
;main.c: 875: {
;main.c: 876: static unsigned char ucTimerDelayP5s = 0;
;main.c: 878: static unsigned char ucTimerPA6DelayP1s = 0;
;main.c: 880: static unsigned char ucTimerPB6DelayP1s = 0;
;main.c: 882: if(isFinishedTwentySecondsTimer())
	fcall	_isFinishedTwentySecondsTimer
	xorlw	0
	skipnz
	goto	u1801
	goto	u1800
u1801:
	goto	l4341
u1800:
	line	884
	
l4627:	
;main.c: 883: {
;main.c: 884: if(ucTimerPA6DelayP1s < 1)
	bcf	status, 5	;RP0=0, select bank0
	movf	(main@ucTimerPA6DelayP1s),f
	skipz
	goto	u1811
	goto	u1810
u1811:
	goto	l4633
u1810:
	line	886
	
l4629:	
;main.c: 885: {
;main.c: 886: PA6 = 0;
	bcf	(46/8),(46)&7
	line	887
	
l4631:	
;main.c: 887: ucTimerPA6DelayP1s++;
	incf	(main@ucTimerPA6DelayP1s),f
	line	888
;main.c: 888: }
	goto	l4245
	line	891
	
l4633:	
;main.c: 889: else
;main.c: 890: {
;main.c: 891: if(ucTimerPB6DelayP1s < 1)
	movf	(main@ucTimerPB6DelayP1s),f
	skipz
	goto	u1821
	goto	u1820
u1821:
	goto	l4639
u1820:
	line	893
	
l4635:	
;main.c: 892: {
;main.c: 893: PBOD6 =0;
	bsf	status, 5	;RP0=1, select bank3
	bsf	status, 6	;RP1=1, select bank3
	bcf	(3142/8)^0180h,(3142)&7
	line	894
;main.c: 894: PB6 = 1;
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	bsf	(54/8),(54)&7
	line	895
	
l4637:	
;main.c: 895: ucTimerPB6DelayP1s++;
	incf	(main@ucTimerPB6DelayP1s),f
	line	896
;main.c: 896: }
	goto	l4245
	line	899
	
l4639:	
;main.c: 897: else
;main.c: 898: {
;main.c: 899: if(ucTimerDelayP5s < 3)
	movlw	(03h)
	subwf	(main@ucTimerDelayP5s),w
	skipnc
	goto	u1831
	goto	u1830
u1831:
	goto	l4643
u1830:
	line	901
	
l4641:	
;main.c: 900: {
;main.c: 901: ucTimerDelayP5s++;
	incf	(main@ucTimerDelayP5s),f
	line	902
;main.c: 902: }
	goto	l4245
	line	906
	
l4643:	
;main.c: 903: else
;main.c: 904: {
;main.c: 906: ucTimerDelayP5s = 0;
	clrf	(main@ucTimerDelayP5s)
	line	908
;main.c: 908: ucTimerPB6DelayP1s = 0;
	clrf	(main@ucTimerPB6DelayP1s)
	line	909
;main.c: 909: ucTimerPA6DelayP1s = 0;
	clrf	(main@ucTimerPA6DelayP1s)
	line	915
	
l4645:	
;main.c: 911: static unsigned char ucTimerForDACR0_CNT1 = 0, ucTimerForDACR0_CNT2 = 0;
;main.c: 913: static unsigned char ucTimerForDACR0_CNT1_f = 0, ucTimerForDACR0_CNT2_f = 0;
;main.c: 915: if((getAdOriginalCh14Value() > 2800))
	fcall	_getAdOriginalCh14Value
	movlw	high(0AF1h)
	subwf	(1+(?_getAdOriginalCh14Value)),w
	movlw	low(0AF1h)
	skipnz
	subwf	(0+(?_getAdOriginalCh14Value)),w
	skipc
	goto	u1841
	goto	u1840
u1841:
	goto	l4651
u1840:
	line	917
	
l4647:	
;main.c: 916: {
;main.c: 917: ucTimerForDACR0_CNT1++;
	incf	(main@ucTimerForDACR0_CNT1),f
	line	918
	
l4649:	
;main.c: 918: ucTimerForDACR0_CNT2 = 0;
	clrf	(main@ucTimerForDACR0_CNT2)
	line	919
;main.c: 919: }
	goto	l4655
	line	922
	
l4651:	
;main.c: 920: else
;main.c: 921: {
;main.c: 922: ucTimerForDACR0_CNT2 = 0;
	clrf	(main@ucTimerForDACR0_CNT2)
	line	923
	
l4653:	
;main.c: 923: ucTimerForDACR0_CNT1++;
	incf	(main@ucTimerForDACR0_CNT1),f
	line	926
	
l4655:	
;main.c: 924: }
;main.c: 926: if(ucTimerForDACR0_CNT1 >= 3)
	movlw	(03h)
	subwf	(main@ucTimerForDACR0_CNT1),w
	skipc
	goto	u1851
	goto	u1850
u1851:
	goto	l4659
u1850:
	line	927
	
l4657:	
;main.c: 927: ucTimerForDACR0_CNT1_f = 1;
	clrf	(main@ucTimerForDACR0_CNT1_f)
	incf	(main@ucTimerForDACR0_CNT1_f),f
	goto	l4663
	line	929
	
l4659:	
	line	932
	
l4663:	
;main.c: 932: if(ucTimerForDACR0_CNT1_f)
	movf	(main@ucTimerForDACR0_CNT1_f),w
	skipz
	goto	u1860
	goto	l4667
u1860:
	line	934
	
l4665:	
;main.c: 933: {
;main.c: 934: DACR0=0x0F;
	movlw	(0Fh)
	bsf	status, 5	;RP0=1, select bank1
	movwf	(136)^080h	;volatile
	line	935
;main.c: 935: ucADC4_Step = ADC4_STEP_FOURTH;
	movlw	(04h)
	bcf	status, 5	;RP0=0, select bank0
	movwf	(main@ucADC4_Step)
	line	936
;main.c: 936: }
	goto	l4671
	line	937
	
l4667:	
;main.c: 937: else if(ucTimerForDACR0_CNT2_f)
	movf	(main@ucTimerForDACR0_CNT2_f),w
	skipz
	goto	u1870
	goto	l4671
u1870:
	line	939
	
l4669:	
;main.c: 938: {
;main.c: 939: DACR0=0x07;
	movlw	(07h)
	bsf	status, 5	;RP0=1, select bank1
	movwf	(136)^080h	;volatile
	line	940
;main.c: 940: ucADC4_Step = ADC4_STEP_FOURTH;
	movlw	(04h)
	bcf	status, 5	;RP0=0, select bank0
	movwf	(main@ucADC4_Step)
	line	947
;main.c: 941: }
	
l4671:	
;main.c: 945: }
;main.c: 947: if(ADC4_STEP_FOURTH == ucADC4_Step)
	movf	(main@ucADC4_Step),w
	xorlw	04h
	skipz
	goto	u1881
	goto	u1880
u1881:
	goto	l710
u1880:
	line	949
	
l4673:	
;main.c: 948: {
;main.c: 949: ucTimerForDACR0_CNT1 = 0;
	clrf	(main@ucTimerForDACR0_CNT1)
	line	950
;main.c: 950: ucTimerForDACR0_CNT2 = 0;
	clrf	(main@ucTimerForDACR0_CNT2)
	line	951
;main.c: 951: ucTimerForDACR0_CNT1_f = 0;
	clrf	(main@ucTimerForDACR0_CNT1_f)
	line	952
;main.c: 952: ucTimerForDACR0_CNT2_f = 0;
	clrf	(main@ucTimerForDACR0_CNT2_f)
	goto	l4245
	line	970
	
l4675:	
;main.c: 965: {
;main.c: 966: static unsigned char ucTimer1s = 0;
;main.c: 968: static unsigned char ucTimerSeond1s = 0;
;main.c: 970: if(ucTimerSeond1s < 3)
	movlw	(03h)
	subwf	(main@ucTimerSeond1s),w
	skipnc
	goto	u1891
	goto	u1890
u1891:
	goto	l4679
u1890:
	line	972
	
l4677:	
;main.c: 971: {
;main.c: 972: ucTimerSeond1s++;
	incf	(main@ucTimerSeond1s),f
	line	973
;main.c: 973: }
	goto	l4245
	line	976
	
l4679:	
;main.c: 974: else
;main.c: 975: {
;main.c: 976: ucTimerSeond1s = 0;
	clrf	(main@ucTimerSeond1s)
	line	978
	
l4681:	
;main.c: 978: if(ucTimer1s < 3)
	movlw	(03h)
	subwf	(main@ucTimer1s),w
	skipnc
	goto	u1901
	goto	u1900
u1901:
	goto	l4689
u1900:
	line	980
	
l4683:	
;main.c: 979: {
;main.c: 980: ucTimer1s++;
	incf	(main@ucTimer1s),f
	line	981
	
l4685:	
;main.c: 981: PB6 = 1;
	bsf	(54/8),(54)&7
	line	982
	
l4687:	
;main.c: 982: PBOD6 = 1;
	bsf	status, 5	;RP0=1, select bank3
	bsf	status, 6	;RP1=1, select bank3
	bsf	(3142/8)^0180h,(3142)&7
	line	983
;main.c: 983: }
	goto	l4245
	line	986
	
l4689:	
;main.c: 984: else
;main.c: 985: {
;main.c: 986: ucTimer1s = 0;
	clrf	(main@ucTimer1s)
	line	988
	
l4691:	
;main.c: 988: enumMainLoopStep = MAIN_LOOP_STEP_FIRST;
	clrf	(main@enumMainLoopStep)
	incf	(main@enumMainLoopStep),f
	line	989
;main.c: 989: ucADC4_Step = ADC4_STEP_INIT;
	clrf	(main@ucADC4_Step)
	goto	l4245
	line	390
	
l4695:	
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
	goto	l4339
	xorlw	1^0	; case 1
	skipnz
	goto	l4343
	xorlw	2^1	; case 2
	skipnz
	goto	l4623
	xorlw	3^2	; case 3
	skipnz
	goto	l4625
	xorlw	4^3	; case 4
	skipnz
	goto	l4675
	goto	l710
	opt asmopt_on

	line	1017
;main.c: 1016: {
;main.c: 1017: case HOUR_3_BRANCH_STEP_FIRST:
	
l930:	
	line	1019
;main.c: 1018: {
;main.c: 1019: PA7 = 1;
	bsf	(47/8),(47)&7
	line	1020
;main.c: 1020: PAOD7 = 1;
	bsf	status, 5	;RP0=1, select bank3
	bsf	status, 6	;RP1=1, select bank3
	bsf	(3135/8)^0180h,(3135)&7
	line	1021
	
l4697:	
;main.c: 1021: startThreeHoursTimer(60);
	movlw	03Ch
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	movwf	(?_startThreeHoursTimer)
	clrf	(?_startThreeHoursTimer+1)
	fcall	_startThreeHoursTimer
	line	1023
	
l4699:	
;main.c: 1023: PB0 = 1;
	bcf	status, 5	;RP0=0, select bank0
	bsf	(48/8),(48)&7
	line	1024
	
l4701:	
;main.c: 1024: PA0 = 1;
	bsf	(40/8),(40)&7
	line	1025
	
l4703:	
;main.c: 1025: PA1 = 1;
	bsf	(41/8),(41)&7
	line	1026
	
l4705:	
;main.c: 1026: PA2 = 1;
	bsf	(42/8),(42)&7
	line	1027
	
l4707:	
;main.c: 1027: PA3 = 1;
	bsf	(43/8),(43)&7
	line	1029
	
l4709:	
;main.c: 1029: enumBranchStep = HOUR_3_BRANCH_STEP_SECOND;
	clrf	(main@enumBranchStep)
	incf	(main@enumBranchStep),f
	line	1030
;main.c: 1030: break;
	goto	l4245
	line	1037
	
l4711:	
;main.c: 1034: {
;main.c: 1035: static unsigned char ucTimer20s = 0;
;main.c: 1037: if(ucTimer20s < 200)
	movlw	(0C8h)
	subwf	(main@ucTimer20s),w
	skipnc
	goto	u1911
	goto	u1910
u1911:
	goto	l4715
u1910:
	line	1039
	
l4713:	
;main.c: 1038: {
;main.c: 1039: ucTimer20s++;
	incf	(main@ucTimer20s),f
	line	1041
;main.c: 1041: }
	goto	l4245
	line	1045
	
l4715:	
;main.c: 1042: else
;main.c: 1043: {
;main.c: 1045: ucTimer20s = 0;
	clrf	(main@ucTimer20s)
	line	1047
	
l4717:	
;main.c: 1047: enumBranchStep = HOUR_3_BRANCH_STEP_THIRD;
	movlw	(02h)
	movwf	(main@enumBranchStep)
	line	1049
	
l4719:	
;main.c: 1049: PA6 = 0;
	bcf	(46/8),(46)&7
	goto	l4245
	line	1056
	
l4721:	
;main.c: 1055: {
;main.c: 1056: if(isFinishedThreeHoursTimer())
	fcall	_isFinishedThreeHoursTimer
	xorlw	0
	skipnz
	goto	u1921
	goto	u1920
u1921:
	goto	l4727
u1920:
	line	1058
	
l4723:	
;main.c: 1057: {
;main.c: 1058: enumBranchStep = HOUR_3_BRANCH_STEP_FIRST;
	bcf	status, 5	;RP0=0, select bank0
	clrf	(main@enumBranchStep)
	goto	l4337
	line	1067
	
l4727:	
;main.c: 1061: else
;main.c: 1062: {
;main.c: 1063: static unsigned char ucTimerX1P5s = 0;
;main.c: 1065: static unsigned char ucTimerLessX1P5s = 0;
;main.c: 1067: if(getAdOriginalCh1Value() < 130)
	fcall	_getAdOriginalCh1Value
	movlw	high(082h)
	subwf	(1+(?_getAdOriginalCh1Value)),w
	movlw	low(082h)
	skipnz
	subwf	(0+(?_getAdOriginalCh1Value)),w
	skipnc
	goto	u1931
	goto	u1930
u1931:
	goto	l4733
u1930:
	line	1069
	
l4729:	
;main.c: 1068: {
;main.c: 1069: ucTimerX1P5s = 0;
	clrf	(main@ucTimerX1P5s)
	line	1070
	
l4731:	
;main.c: 1070: ucTimerLessX1P5s++;
	incf	(main@ucTimerLessX1P5s),f
	line	1071
;main.c: 1071: }
	goto	l4737
	line	1074
	
l4733:	
;main.c: 1072: else
;main.c: 1073: {
;main.c: 1074: ucTimerX1P5s++;
	incf	(main@ucTimerX1P5s),f
	line	1075
	
l4735:	
;main.c: 1075: ucTimerLessX1P5s = 0;
	clrf	(main@ucTimerLessX1P5s)
	line	1078
	
l4737:	
;main.c: 1076: }
;main.c: 1078: if(ucTimerX1P5s >= 5)
	movlw	(05h)
	subwf	(main@ucTimerX1P5s),w
	skipc
	goto	u1941
	goto	u1940
u1941:
	goto	l4751
u1940:
	line	1080
	
l4739:	
;main.c: 1079: {
;main.c: 1080: ucTimerX1P5s = 0;
	clrf	(main@ucTimerX1P5s)
	line	1081
	
l4741:	
;main.c: 1081: PAOD7 = 0;
	bsf	status, 5	;RP0=1, select bank3
	bsf	status, 6	;RP1=1, select bank3
	bcf	(3135/8)^0180h,(3135)&7
	line	1082
	
l4743:	
;main.c: 1082: PA7 = 0;
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	bcf	(47/8),(47)&7
	line	1083
	
l4745:	
;main.c: 1083: clearThreeHoursTimer();
	fcall	_clearThreeHoursTimer
	line	1085
	
l4747:	
;main.c: 1085: enumBranchStep = HOUR_3_BRANCH_STEP_FIRST;
	bcf	status, 5	;RP0=0, select bank0
	clrf	(main@enumBranchStep)
	line	1087
	
l4749:	
;main.c: 1087: enumMainLoopStep = MAIN_LOOP_STEP_SECOND;
	movlw	(02h)
	movwf	(main@enumMainLoopStep)
	line	1088
;main.c: 1088: }
	goto	l4245
	line	1089
	
l4751:	
;main.c: 1089: else if(ucTimerLessX1P5s >= 5)
	movlw	(05h)
	subwf	(main@ucTimerLessX1P5s),w
	skipc
	goto	u1951
	goto	u1950
u1951:
	goto	l710
u1950:
	line	1095
	
l4753:	
;main.c: 1090: {
;main.c: 1091: static unsigned char ucTimerX2P5s = 0;
;main.c: 1093: static unsigned char ucTimerLessX2P5s = 0;
;main.c: 1095: if(getAdOriginalCh14Value() >= 1950)
	fcall	_getAdOriginalCh14Value
	movlw	high(079Eh)
	subwf	(1+(?_getAdOriginalCh14Value)),w
	movlw	low(079Eh)
	skipnz
	subwf	(0+(?_getAdOriginalCh14Value)),w
	skipc
	goto	u1961
	goto	u1960
u1961:
	goto	l4759
u1960:
	line	1097
	
l4755:	
;main.c: 1096: {
;main.c: 1097: ucTimerX2P5s++;
	incf	(main@ucTimerX2P5s),f
	line	1098
	
l4757:	
;main.c: 1098: ucTimerLessX2P5s = 0;
	clrf	(main@ucTimerLessX2P5s)
	line	1099
;main.c: 1099: }
	goto	l4763
	line	1102
	
l4759:	
;main.c: 1100: else
;main.c: 1101: {
;main.c: 1102: ucTimerX2P5s = 0;
	clrf	(main@ucTimerX2P5s)
	line	1103
	
l4761:	
;main.c: 1103: ucTimerLessX2P5s++;
	incf	(main@ucTimerLessX2P5s),f
	line	1106
	
l4763:	
;main.c: 1104: }
;main.c: 1106: if(ucTimerX2P5s >= 5)
	movlw	(05h)
	subwf	(main@ucTimerX2P5s),w
	skipc
	goto	u1971
	goto	u1970
u1971:
	goto	l4767
u1970:
	line	1108
	
l4765:	
;main.c: 1107: {
;main.c: 1108: ucTimerX2P5s = 0;
	clrf	(main@ucTimerX2P5s)
	line	1109
;main.c: 1109: }
	goto	l4245
	line	1110
	
l4767:	
;main.c: 1110: else if(ucTimerLessX2P5s >= 5)
	movlw	(05h)
	subwf	(main@ucTimerLessX2P5s),w
	skipc
	goto	u1981
	goto	u1980
u1981:
	goto	l710
u1980:
	line	1112
	
l4769:	
;main.c: 1111: {
;main.c: 1112: clearPinPortAndTimer();
	fcall	_clearPinPortAndTimer
	goto	l4271
	line	1015
	
l4775:	
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
	goto	l930
	xorlw	1^0	; case 1
	skipnz
	goto	l4711
	xorlw	2^1	; case 2
	skipnz
	goto	l4721
	goto	l710
	opt asmopt_on

	line	1151
;main.c: 1150: {
;main.c: 1151: case INTERNAL_FIRST_STEP:
	
l965:	
	line	1153
;main.c: 1152: {
;main.c: 1153: PB0 = 0;
	bcf	status, 5	;RP0=0, select bank0
	bcf	(48/8),(48)&7
	line	1154
;main.c: 1154: PB1 = 0;
	bcf	(49/8),(49)&7
	line	1155
;main.c: 1155: PA0 = 0;
	bcf	(40/8),(40)&7
	line	1156
;main.c: 1156: PA1 = 0;
	bcf	(41/8),(41)&7
	line	1157
;main.c: 1157: PA2 = 0;
	bcf	(42/8),(42)&7
	line	1158
;main.c: 1158: PA3 = 0;
	bcf	(43/8),(43)&7
	line	1159
;main.c: 1159: PBOD6 = 0;
	bsf	status, 5	;RP0=1, select bank3
	bsf	status, 6	;RP1=1, select bank3
	bcf	(3142/8)^0180h,(3142)&7
	line	1160
;main.c: 1160: PB6 = 1;
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	bsf	(54/8),(54)&7
	line	1161
;main.c: 1161: PA6 =0;
	bcf	(46/8),(46)&7
	line	1163
;main.c: 1163: enumInteralStep = INTERNAL_SECOND_STEP;
	bsf	status, 5	;RP0=1, select bank1
	clrf	(main@enumInteralStep)^080h
	incf	(main@enumInteralStep)^080h,f
	line	1164
;main.c: 1164: break;
	goto	l4245
	line	1171
	
l4777:	
;main.c: 1168: {
;main.c: 1169: static unsigned char ucTimer1s = 0;
;main.c: 1171: if(getAdOriginalCh14Value() <= 1000)
	fcall	_getAdOriginalCh14Value
	movlw	high(03E9h)
	subwf	(1+(?_getAdOriginalCh14Value)),w
	movlw	low(03E9h)
	skipnz
	subwf	(0+(?_getAdOriginalCh14Value)),w
	skipnc
	goto	u1991
	goto	u1990
u1991:
	goto	l4781
u1990:
	line	1173
	
l4779:	
;main.c: 1172: {
;main.c: 1173: ucTimer1s++;
	bsf	status, 5	;RP0=1, select bank1
	incf	(main@cTimer1s_823)^080h,f
	line	1174
;main.c: 1174: }
	goto	l4783
	line	1176
	
l4781:	
;main.c: 1175: else
;main.c: 1176: ucTimer1s = 0;
	bsf	status, 5	;RP0=1, select bank1
	clrf	(main@cTimer1s_823)^080h
	line	1178
	
l4783:	
;main.c: 1178: if(ucTimer1s >= 10)
	movlw	(0Ah)
	subwf	(main@cTimer1s_823)^080h,w
	skipc
	goto	u2001
	goto	u2000
u2001:
	goto	l710
u2000:
	line	1180
	
l4785:	
;main.c: 1179: {
;main.c: 1180: enumInteralStep = INTERNAL_THIRD_STEP;
	movlw	(02h)
	movwf	(main@enumInteralStep)^080h
	line	1181
	
l4787:	
;main.c: 1181: ucTimer1s = 0;
	clrf	(main@cTimer1s_823)^080h
	goto	l4245
	line	1190
	
l4789:	
;main.c: 1187: {
;main.c: 1188: static unsigned char ucTimerP3s = 0;
;main.c: 1190: if(getAdOriginalCh14Value() >= 1950)
	fcall	_getAdOriginalCh14Value
	movlw	high(079Eh)
	subwf	(1+(?_getAdOriginalCh14Value)),w
	movlw	low(079Eh)
	skipnz
	subwf	(0+(?_getAdOriginalCh14Value)),w
	skipc
	goto	u2011
	goto	u2010
u2011:
	goto	l4793
u2010:
	line	1192
	
l4791:	
;main.c: 1191: {
;main.c: 1192: ucTimerP3s++;
	bsf	status, 5	;RP0=1, select bank1
	incf	(main@ucTimerP3s)^080h,f
	line	1193
;main.c: 1193: }
	goto	l4795
	line	1195
	
l4793:	
;main.c: 1194: else
;main.c: 1195: ucTimerP3s = 0;
	bsf	status, 5	;RP0=1, select bank1
	clrf	(main@ucTimerP3s)^080h
	line	1197
	
l4795:	
;main.c: 1197: if(ucTimerP3s >= 3)
	movlw	(03h)
	subwf	(main@ucTimerP3s)^080h,w
	skipc
	goto	u2021
	goto	u2020
u2021:
	goto	l710
u2020:
	line	1199
	
l4797:	
;main.c: 1198: {
;main.c: 1199: enumInteralStep = INTERNAL_FIRST_STEP;
	clrf	(main@enumInteralStep)^080h
	line	1200
;main.c: 1200: ucTimerP3s = 0;
	clrf	(main@ucTimerP3s)^080h
	line	1201
	
l4799:	
;main.c: 1201: clearAllTimer();
	fcall	_clearAllTimer
	line	1203
	
l4801:	
;main.c: 1203: DACR0=0x0F;
	movlw	(0Fh)
	movwf	(136)^080h	;volatile
	line	1204
	
l4803:	
;main.c: 1204: initPin();
	fcall	_initPin
	line	1207
	
l4805:	
;main.c: 1207: enumMainLoopStep = MAIN_LOOP_STEP_INIT;
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	clrf	(main@enumMainLoopStep)
	goto	l4245
	line	1149
	
l4809:	
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
	goto	l965
	xorlw	1^0	; case 1
	skipnz
	goto	l4777
	xorlw	2^1	; case 2
	skipnz
	goto	l4789
	goto	l710
	opt asmopt_on

	line	235
	
l4813:	
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
	goto	l4261
	xorlw	1^0	; case 1
	skipnz
	goto	l4273
	xorlw	2^1	; case 2
	skipnz
	goto	l718
	xorlw	3^2	; case 3
	skipnz
	goto	l4295
	xorlw	4^3	; case 4
	skipnz
	goto	l4331
	xorlw	5^4	; case 5
	skipnz
	goto	l4335
	xorlw	8^5	; case 8
	skipnz
	goto	l4775
	xorlw	9^8	; case 9
	skipnz
	goto	l4809
	goto	l710
	opt asmopt_on

	global	start
	ljmp	start
	opt stack 0
psect	maintext
	line	1228
GLOBAL	__end_of_main
	__end_of_main:
;; =============== function _main ends ============

	signat	_main,88
	global	_clearPinPortAndTimer
psect	text755,local,class=CODE,delta=2
global __ptext755
__ptext755:

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
psect	text755
	file	"D:\develop\190625\AK7030-OTP\main.c"
	line	92
	global	__size_of_clearPinPortAndTimer
	__size_of_clearPinPortAndTimer	equ	__end_of_clearPinPortAndTimer-_clearPinPortAndTimer
	
_clearPinPortAndTimer:	
	opt	stack 3
; Regs used in _clearPinPortAndTimer: [status,2+status,0+pclath+cstack]
	line	93
	
l4219:	
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
	
l4221:	
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
psect	text756,local,class=CODE,delta=2
global __ptext756
__ptext756:

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
psect	text756
	file	"D:\develop\190625\AK7030-OTP\common.c"
	line	229
	global	__size_of_getAdOriginaCh4Value
	__size_of_getAdOriginaCh4Value	equ	__end_of_getAdOriginaCh4Value-_getAdOriginaCh4Value
	
_getAdOriginaCh4Value:	
	opt	stack 4
; Regs used in _getAdOriginaCh4Value: [wreg-fsr0h+status,2+status,0+btemp+1+pclath+cstack]
	line	231
	
l4215:	
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
	
l1699:	
	return
	opt stack 0
GLOBAL	__end_of_getAdOriginaCh4Value
	__end_of_getAdOriginaCh4Value:
;; =============== function _getAdOriginaCh4Value ends ============

	signat	_getAdOriginaCh4Value,90
	global	_getAdOriginalCh1Value
psect	text757,local,class=CODE,delta=2
global __ptext757
__ptext757:

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
psect	text757
	file	"D:\develop\190625\AK7030-OTP\common.c"
	line	217
	global	__size_of_getAdOriginalCh1Value
	__size_of_getAdOriginalCh1Value	equ	__end_of_getAdOriginalCh1Value-_getAdOriginalCh1Value
	
_getAdOriginalCh1Value:	
	opt	stack 4
; Regs used in _getAdOriginalCh1Value: [wreg-fsr0h+status,2+status,0+btemp+1+pclath+cstack]
	line	220
	
l4211:	
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
	
l1696:	
	return
	opt stack 0
GLOBAL	__end_of_getAdOriginalCh1Value
	__end_of_getAdOriginalCh1Value:
;; =============== function _getAdOriginalCh1Value ends ============

	signat	_getAdOriginalCh1Value,90
	global	_getAdOriginalCh14Value
psect	text758,local,class=CODE,delta=2
global __ptext758
__ptext758:

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
psect	text758
	file	"D:\develop\190625\AK7030-OTP\common.c"
	line	240
	global	__size_of_getAdOriginalCh14Value
	__size_of_getAdOriginalCh14Value	equ	__end_of_getAdOriginalCh14Value-_getAdOriginalCh14Value
	
_getAdOriginalCh14Value:	
	opt	stack 4
; Regs used in _getAdOriginalCh14Value: [wreg-fsr0h+status,2+status,0+btemp+1+pclath+cstack]
	line	242
	
l4207:	
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
	
l1702:	
	return
	opt stack 0
GLOBAL	__end_of_getAdOriginalCh14Value
	__end_of_getAdOriginalCh14Value:
;; =============== function _getAdOriginalCh14Value ends ============

	signat	_getAdOriginalCh14Value,90
	global	_process_AD_Converter_Value
psect	text759,local,class=CODE,delta=2
global __ptext759
__ptext759:

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
psect	text759
	file	"D:\develop\190625\AK7030-OTP\common.c"
	line	251
	global	__size_of_process_AD_Converter_Value
	__size_of_process_AD_Converter_Value	equ	__end_of_process_AD_Converter_Value-_process_AD_Converter_Value
	
_process_AD_Converter_Value:	
	opt	stack 4
; Regs used in _process_AD_Converter_Value: [wreg+status,2+status,0+pclath+cstack]
	line	252
	
l4191:	
;common.c: 252: if(getAD_ConvertFlag())
	fcall	_getAD_ConvertFlag
	xorlw	0
	skipnz
	goto	u1341
	goto	u1340
u1341:
	goto	l1710
u1340:
	line	254
	
l4193:	
;common.c: 253: {
;common.c: 254: setAD_ConvertFlag(0);
	movlw	(0)
	fcall	_setAD_ConvertFlag
	line	255
;common.c: 255: AD_Sample();
	fcall	_AD_Sample
	line	256
	
l4195:	
;common.c: 256: if(4 == sampleChannelSelect)
	movf	(_sampleChannelSelect),w
	xorlw	04h
	skipz
	goto	u1351
	goto	u1350
u1351:
	goto	l4199
u1350:
	line	257
	
l4197:	
;common.c: 257: adc_test_init(4,3);
	movlw	(03h)
	movwf	(?_adc_test_init)
	movlw	(04h)
	fcall	_adc_test_init
	goto	l4205
	line	258
	
l4199:	
;common.c: 258: else if(1 == sampleChannelSelect)
	decf	(_sampleChannelSelect),w
	skipz
	goto	u1361
	goto	u1360
u1361:
	goto	l4203
u1360:
	line	259
	
l4201:	
;common.c: 259: adc_test_init(1,3);
	movlw	(03h)
	movwf	(?_adc_test_init)
	movlw	(01h)
	fcall	_adc_test_init
	goto	l4205
	line	261
	
l4203:	
;common.c: 260: else
;common.c: 261: adc_test_init(14,3);
	movlw	(03h)
	movwf	(?_adc_test_init)
	movlw	(0Eh)
	fcall	_adc_test_init
	line	263
	
l4205:	
;common.c: 263: adc_start();
	fcall	_adc_start
	line	265
	
l1710:	
	return
	opt stack 0
GLOBAL	__end_of_process_AD_Converter_Value
	__end_of_process_AD_Converter_Value:
;; =============== function _process_AD_Converter_Value ends ============

	signat	_process_AD_Converter_Value,88
	global	_clearAllTimer
psect	text760,local,class=CODE,delta=2
global __ptext760
__ptext760:

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
;;		On entry : 140/20
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
psect	text760
	file	"D:\develop\190625\AK7030-OTP\main.c"
	line	83
	global	__size_of_clearAllTimer
	__size_of_clearAllTimer	equ	__end_of_clearAllTimer-_clearAllTimer
	
_clearAllTimer:	
	opt	stack 4
; Regs used in _clearAllTimer: [status,2+status,0+pclath+cstack]
	line	84
	
l4189:	
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
psect	text761,local,class=CODE,delta=2
global __ptext761
__ptext761:

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
psect	text761
	file	"D:\develop\190625\AK7030-OTP\common.c"
	line	277
	global	__size_of_AD_Sample
	__size_of_AD_Sample	equ	__end_of_AD_Sample-_AD_Sample
	
_AD_Sample:	
	opt	stack 4
; Regs used in _AD_Sample: [wreg+status,2+status,0]
	line	278
	
l4127:	
;common.c: 278: if(sampleTimes < 12)
	movlw	(0Ch)
	bcf	status, 5	;RP0=0, select bank0
	subwf	(_sampleTimes),w
	skipnc
	goto	u1211
	goto	u1210
u1211:
	goto	l1721
u1210:
	line	300
	
l4129:	
;common.c: 279: {
;common.c: 300: sampleTimes++;
	incf	(_sampleTimes),f
	line	302
	
l4131:	
;common.c: 302: if(sampleTimes >= 12)
	movlw	(0Ch)
	subwf	(_sampleTimes),w
	skipc
	goto	u1221
	goto	u1220
u1221:
	goto	l1721
u1220:
	line	304
	
l4133:	
;common.c: 303: {
;common.c: 304: sampleTimes = 0;
	clrf	(_sampleTimes)
	line	306
	
l4135:	
;common.c: 306: if(sampleChannelSelect == 14)
	movf	(_sampleChannelSelect),w
	xorlw	0Eh
	skipz
	goto	u1231
	goto	u1230
u1231:
	goto	l4139
u1230:
	line	310
	
l4137:	
;common.c: 307: {
;common.c: 310: sampleChannelSelect = 1;
	clrf	(_sampleChannelSelect)
	incf	(_sampleChannelSelect),f
	line	311
;common.c: 311: }
	goto	l1721
	line	312
	
l4139:	
;common.c: 312: else if(sampleChannelSelect == 4)
	movf	(_sampleChannelSelect),w
	xorlw	04h
	skipz
	goto	u1241
	goto	u1240
u1241:
	goto	l4143
u1240:
	line	315
	
l4141:	
;common.c: 313: {
;common.c: 315: sampleChannelSelect = 14;
	movlw	(0Eh)
	movwf	(_sampleChannelSelect)
	line	316
;common.c: 316: }
	goto	l1721
	line	317
	
l4143:	
;common.c: 317: else if(sampleChannelSelect == 1)
	decf	(_sampleChannelSelect),w
	skipz
	goto	u1251
	goto	u1250
u1251:
	goto	l4141
u1250:
	line	320
	
l4145:	
;common.c: 318: {
;common.c: 320: sampleChannelSelect = 4;
	movlw	(04h)
	movwf	(_sampleChannelSelect)
	line	333
;common.c: 321: }
	
l1721:	
	return
	opt stack 0
GLOBAL	__end_of_AD_Sample
	__end_of_AD_Sample:
;; =============== function _AD_Sample ends ============

	signat	_AD_Sample,88
	global	_setAD_ConvertFlag
psect	text762,local,class=CODE,delta=2
global __ptext762
__ptext762:

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
psect	text762
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
	
l4125:	
;common.c: 207: adc_convert_flag = flag;
	movf	(setAD_ConvertFlag@flag),w
	bsf	status, 5	;RP0=1, select bank1
	movwf	(_adc_convert_flag)^080h
	line	208
	
l1693:	
	return
	opt stack 0
GLOBAL	__end_of_setAD_ConvertFlag
	__end_of_setAD_ConvertFlag:
;; =============== function _setAD_ConvertFlag ends ============

	signat	_setAD_ConvertFlag,4216
	global	_getAD_ConvertFlag
psect	text763,local,class=CODE,delta=2
global __ptext763
__ptext763:

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
psect	text763
	file	"D:\develop\190625\AK7030-OTP\common.c"
	line	200
	global	__size_of_getAD_ConvertFlag
	__size_of_getAD_ConvertFlag	equ	__end_of_getAD_ConvertFlag-_getAD_ConvertFlag
	
_getAD_ConvertFlag:	
	opt	stack 4
; Regs used in _getAD_ConvertFlag: [wreg]
	line	201
	
l4121:	
;common.c: 201: return adc_convert_flag;
	bsf	status, 5	;RP0=1, select bank1
	bcf	status, 6	;RP1=0, select bank1
	movf	(_adc_convert_flag)^080h,w
	line	202
	
l1690:	
	return
	opt stack 0
GLOBAL	__end_of_getAD_ConvertFlag
	__end_of_getAD_ConvertFlag:
;; =============== function _getAD_ConvertFlag ends ============

	signat	_getAD_ConvertFlag,89
	global	_Filter
psect	text764,local,class=CODE,delta=2
global __ptext764
__ptext764:

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
psect	text764
	file	"D:\develop\190625\AK7030-OTP\common.c"
	line	51
	global	__size_of_Filter
	__size_of_Filter	equ	__end_of_Filter-_Filter
	
_Filter:	
	opt	stack 4
; Regs used in _Filter: [wreg-fsr0h+status,2+status,0+btemp+1]
	line	53
	
l4023:	
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
	
l4029:	
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
	
l4031:	
	movlw	02h
	addwf	(Filter@tmpValue),f
	skipnc
	incf	(Filter@tmpValue+1),f
	line	59
	
l4033:	
	incf	(Filter@cir),f
	skipnz
	incf	(Filter@cir+1),f
	
l4035:	
	movf	(Filter@cir+1),w
	xorlw	80h
	movwf	btemp+1
	movlw	(high(0Ch))^80h
	subwf	btemp+1,w
	skipz
	goto	u1095
	movlw	low(0Ch)
	subwf	(Filter@cir),w
u1095:

	skipc
	goto	u1091
	goto	u1090
u1091:
	goto	l4029
u1090:
	line	63
	
l4037:	
;common.c: 63: for(j = 0; j < 12 - 1; j++)
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	clrf	(Filter@j)
	line	65
	
l4043:	
;common.c: 64: {
;common.c: 65: for(i = 0; i < 12 - 1 - j; i++)
	clrf	(Filter@i)
	goto	l4051
	line	67
	
l4045:	
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
	goto	u1105
	movf	0+(??_Filter+0)+0,w
	subwf	0+(??_Filter+2)+0,w
u1105:
	skipnc
	goto	u1101
	goto	u1100
u1101:
	goto	l4049
u1100:
	line	70
	
l4047:	
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
	
l4049:	
	incf	(Filter@i),f
	
l4051:	
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
	goto	u1115
	movf	0+(??_Filter+0)+0,w
	subwf	(Filter@i),w
u1115:

	skipc
	goto	u1111
	goto	u1110
u1111:
	goto	l4045
u1110:
	line	63
	
l4053:	
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	incf	(Filter@j),f
	
l4055:	
	movlw	(0Bh)
	subwf	(Filter@j),w
	skipc
	goto	u1121
	goto	u1120
u1121:
	goto	l4043
u1120:
	line	79
	
l4057:	
;common.c: 75: }
;common.c: 76: }
;common.c: 77: }
;common.c: 79: for(i = 2; i < 12 - 2; i++)
	movlw	(02h)
	movwf	(Filter@i)
	line	81
	
l4061:	
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
	
l4063:	
	incf	(Filter@i),f
	
l4065:	
	movlw	(0Ah)
	subwf	(Filter@i),w
	skipc
	goto	u1131
	goto	u1130
u1131:
	goto	l4061
u1130:
	line	84
	
l4067:	
;common.c: 82: }
;common.c: 84: return (filter_sum >> 3);
	movf	(Filter@filter_sum+1),w
	movwf	(?_Filter+1)
	movf	(Filter@filter_sum),w
	movwf	(?_Filter)
	
l4069:	
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
	
l1652:	
	return
	opt stack 0
GLOBAL	__end_of_Filter
	__end_of_Filter:
;; =============== function _Filter ends ============

	signat	_Filter,4218
	global	_isFinishedThreeHoursTimer
psect	text765,local,class=CODE,delta=2
global __ptext765
__ptext765:

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
psect	text765
	file	"D:\develop\190625\AK7030-OTP\common.c"
	line	416
	global	__size_of_isFinishedThreeHoursTimer
	__size_of_isFinishedThreeHoursTimer	equ	__end_of_isFinishedThreeHoursTimer-_isFinishedThreeHoursTimer
	
_isFinishedThreeHoursTimer:	
	opt	stack 5
; Regs used in _isFinishedThreeHoursTimer: [wreg+status,2+status,0]
	line	417
	
l4011:	
;common.c: 417: if(uiSmallTimer == 0)
	bsf	status, 5	;RP0=1, select bank1
	movf	((_uiSmallTimer+1)^080h),w
	iorwf	((_uiSmallTimer)^080h),w
	skipz
	goto	u1081
	goto	u1080
u1081:
	goto	l4019
u1080:
	line	418
	
l4013:	
;common.c: 418: return 1;
	movlw	(01h)
	goto	l1758
	line	420
	
l4019:	
;common.c: 419: else
;common.c: 420: return 0;
	movlw	(0)
	line	421
	
l1758:	
	return
	opt stack 0
GLOBAL	__end_of_isFinishedThreeHoursTimer
	__end_of_isFinishedThreeHoursTimer:
;; =============== function _isFinishedThreeHoursTimer ends ============

	signat	_isFinishedThreeHoursTimer,89
	global	_startThreeHoursTimer
psect	text766,local,class=CODE,delta=2
global __ptext766
__ptext766:

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
psect	text766
	file	"D:\develop\190625\AK7030-OTP\common.c"
	line	382
	global	__size_of_startThreeHoursTimer
	__size_of_startThreeHoursTimer	equ	__end_of_startThreeHoursTimer-_startThreeHoursTimer
	
_startThreeHoursTimer:	
	opt	stack 5
; Regs used in _startThreeHoursTimer: [wreg+status,2+status,0]
	line	383
	
l4007:	
;common.c: 383: if(0 == uiSmallTimer)
	bsf	status, 5	;RP0=1, select bank1
	movf	((_uiSmallTimer+1)^080h),w
	iorwf	((_uiSmallTimer)^080h),w
	skipz
	goto	u1071
	goto	u1070
u1071:
	goto	l1741
u1070:
	line	384
	
l4009:	
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
	
l1741:	
	return
	opt stack 0
GLOBAL	__end_of_startThreeHoursTimer
	__end_of_startThreeHoursTimer:
;; =============== function _startThreeHoursTimer ends ============

	signat	_startThreeHoursTimer,4216
	global	_isFinishedTwentySecondsTimer
psect	text767,local,class=CODE,delta=2
global __ptext767
__ptext767:

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
psect	text767
	file	"D:\develop\190625\AK7030-OTP\common.c"
	line	399
	global	__size_of_isFinishedTwentySecondsTimer
	__size_of_isFinishedTwentySecondsTimer	equ	__end_of_isFinishedTwentySecondsTimer-_isFinishedTwentySecondsTimer
	
_isFinishedTwentySecondsTimer:	
	opt	stack 5
; Regs used in _isFinishedTwentySecondsTimer: [wreg+status,2+status,0]
	line	400
	
l3995:	
;common.c: 400: if(0 == uiTwentySecondsTimer)
	bsf	status, 5	;RP0=1, select bank1
	movf	((_uiTwentySecondsTimer+1)^080h),w
	iorwf	((_uiTwentySecondsTimer)^080h),w
	skipz
	goto	u1061
	goto	u1060
u1061:
	goto	l4003
u1060:
	line	401
	
l3997:	
;common.c: 401: return 1;
	movlw	(01h)
	goto	l1748
	line	403
	
l4003:	
;common.c: 402: else
;common.c: 403: return 0;
	movlw	(0)
	line	404
	
l1748:	
	return
	opt stack 0
GLOBAL	__end_of_isFinishedTwentySecondsTimer
	__end_of_isFinishedTwentySecondsTimer:
;; =============== function _isFinishedTwentySecondsTimer ends ============

	signat	_isFinishedTwentySecondsTimer,89
	global	_startTwentySecondsTimer
psect	text768,local,class=CODE,delta=2
global __ptext768
__ptext768:

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
psect	text768
	file	"D:\develop\190625\AK7030-OTP\common.c"
	line	393
	global	__size_of_startTwentySecondsTimer
	__size_of_startTwentySecondsTimer	equ	__end_of_startTwentySecondsTimer-_startTwentySecondsTimer
	
_startTwentySecondsTimer:	
	opt	stack 5
; Regs used in _startTwentySecondsTimer: [wreg]
	line	394
	
l3993:	
;common.c: 394: uiTwentySecondsTimer = 20;
	movlw	014h
	bsf	status, 5	;RP0=1, select bank1
	movwf	(_uiTwentySecondsTimer)^080h
	clrf	(_uiTwentySecondsTimer+1)^080h
	line	395
	
l1744:	
	return
	opt stack 0
GLOBAL	__end_of_startTwentySecondsTimer
	__end_of_startTwentySecondsTimer:
;; =============== function _startTwentySecondsTimer ends ============

	signat	_startTwentySecondsTimer,88
	global	_isFinishedTwelveHoursTimer
psect	text769,local,class=CODE,delta=2
global __ptext769
__ptext769:

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
psect	text769
	file	"D:\develop\190625\AK7030-OTP\common.c"
	line	408
	global	__size_of_isFinishedTwelveHoursTimer
	__size_of_isFinishedTwelveHoursTimer	equ	__end_of_isFinishedTwelveHoursTimer-_isFinishedTwelveHoursTimer
	
_isFinishedTwelveHoursTimer:	
	opt	stack 5
; Regs used in _isFinishedTwelveHoursTimer: [wreg+status,2+status,0]
	line	409
	
l3981:	
;common.c: 409: if(uiBigTimer == 0)
	bsf	status, 5	;RP0=1, select bank1
	movf	((_uiBigTimer+1)^080h),w
	iorwf	((_uiBigTimer)^080h),w
	skipz
	goto	u1051
	goto	u1050
u1051:
	goto	l3989
u1050:
	line	410
	
l3983:	
;common.c: 410: return 1;
	movlw	(01h)
	goto	l1753
	line	412
	
l3989:	
;common.c: 411: else
;common.c: 412: return 0;
	movlw	(0)
	line	413
	
l1753:	
	return
	opt stack 0
GLOBAL	__end_of_isFinishedTwelveHoursTimer
	__end_of_isFinishedTwelveHoursTimer:
;; =============== function _isFinishedTwelveHoursTimer ends ============

	signat	_isFinishedTwelveHoursTimer,89
	global	_startTwelveHourTimer
psect	text770,local,class=CODE,delta=2
global __ptext770
__ptext770:

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
psect	text770
	file	"D:\develop\190625\AK7030-OTP\common.c"
	line	354
	global	__size_of_startTwelveHourTimer
	__size_of_startTwelveHourTimer	equ	__end_of_startTwelveHourTimer-_startTwelveHourTimer
	
_startTwelveHourTimer:	
	opt	stack 5
; Regs used in _startTwelveHourTimer: [wreg+status,2+status,0]
	line	355
	
l3977:	
;common.c: 355: if(0 == uiBigTimer)
	bsf	status, 5	;RP0=1, select bank1
	movf	((_uiBigTimer+1)^080h),w
	iorwf	((_uiBigTimer)^080h),w
	skipz
	goto	u1041
	goto	u1040
u1041:
	goto	l1728
u1040:
	line	356
	
l3979:	
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
	
l1728:	
	return
	opt stack 0
GLOBAL	__end_of_startTwelveHourTimer
	__end_of_startTwelveHourTimer:
;; =============== function _startTwelveHourTimer ends ============

	signat	_startTwelveHourTimer,4216
	global	_clrSampeTime
psect	text771,local,class=CODE,delta=2
global __ptext771
__ptext771:

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
psect	text771
	file	"D:\develop\190625\AK7030-OTP\common.c"
	line	434
	global	__size_of_clrSampeTime
	__size_of_clrSampeTime	equ	__end_of_clrSampeTime-_clrSampeTime
	
_clrSampeTime:	
	opt	stack 5
; Regs used in _clrSampeTime: [status,2]
	line	435
	
l3975:	
;common.c: 435: timer.timer10msStopWatch = 0;
	clrf	(_timer)^080h
	line	436
	
l1767:	
	return
	opt stack 0
GLOBAL	__end_of_clrSampeTime
	__end_of_clrSampeTime:
;; =============== function _clrSampeTime ends ============

	signat	_clrSampeTime,88
	global	_isPermitSampleTime
psect	text772,local,class=CODE,delta=2
global __ptext772
__ptext772:

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
psect	text772
	file	"D:\develop\190625\AK7030-OTP\common.c"
	line	424
	global	__size_of_isPermitSampleTime
	__size_of_isPermitSampleTime	equ	__end_of_isPermitSampleTime-_isPermitSampleTime
	
_isPermitSampleTime:	
	opt	stack 5
; Regs used in _isPermitSampleTime: [wreg]
	line	425
	
l3963:	
;common.c: 425: if(timer.timer10msStopWatch >= 10)
	movlw	(0Ah)
	bsf	status, 5	;RP0=1, select bank1
	subwf	(_timer)^080h,w
	skipc
	goto	u1031
	goto	u1030
u1031:
	goto	l3971
u1030:
	line	427
	
l3965:	
;common.c: 426: {
;common.c: 427: return 1;
	movlw	(01h)
	goto	l1763
	line	430
	
l3971:	
;common.c: 429: else
;common.c: 430: return 0;
	movlw	(0)
	line	431
	
l1763:	
	return
	opt stack 0
GLOBAL	__end_of_isPermitSampleTime
	__end_of_isPermitSampleTime:
;; =============== function _isPermitSampleTime ends ============

	signat	_isPermitSampleTime,89
	global	_adc_start
psect	text773,local,class=CODE,delta=2
global __ptext773
__ptext773:

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
psect	text773
	file	"D:\develop\190625\AK7030-OTP\periph.c"
	line	100
	global	__size_of_adc_start
	__size_of_adc_start	equ	__end_of_adc_start-_adc_start
	
_adc_start:	
	opt	stack 4
; Regs used in _adc_start: []
	line	101
	
l3961:	
;periph.c: 101: GO=1;
	bcf	status, 5	;RP0=0, select bank0
	bsf	(249/8),(249)&7
	line	102
	
l2433:	
	return
	opt stack 0
GLOBAL	__end_of_adc_start
	__end_of_adc_start:
;; =============== function _adc_start ends ============

	signat	_adc_start,88
	global	_op2_init
psect	text774,local,class=CODE,delta=2
global __ptext774
__ptext774:

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
psect	text774
	file	"D:\develop\190625\AK7030-OTP\periph.c"
	line	45
	global	__size_of_op2_init
	__size_of_op2_init	equ	__end_of_op2_init-_op2_init
	
_op2_init:	
	opt	stack 5
; Regs used in _op2_init: [wreg]
	line	52
	
l3955:	
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
	
l3957:	
;periph.c: 58: TRISA7=0;
	bcf	(1071/8)^080h,(1071)&7
	line	60
	
l3959:	
;periph.c: 60: TRISB7 = 1;
	bsf	(1079/8)^080h,(1079)&7
	line	61
	
l2419:	
	return
	opt stack 0
GLOBAL	__end_of_op2_init
	__end_of_op2_init:
;; =============== function _op2_init ends ============

	signat	_op2_init,88
	global	_op1_init
psect	text775,local,class=CODE,delta=2
global __ptext775
__ptext775:

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
psect	text775
	file	"D:\develop\190625\AK7030-OTP\periph.c"
	line	26
	global	__size_of_op1_init
	__size_of_op1_init	equ	__end_of_op1_init-_op1_init
	
_op1_init:	
	opt	stack 5
; Regs used in _op1_init: [wreg]
	line	33
	
l3949:	
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
	
l3951:	
;periph.c: 38: TRISB3=1;
	bsf	status, 5	;RP0=1, select bank1
	bsf	(1075/8)^080h,(1075)&7
	line	40
	
l3953:	
;periph.c: 40: TRISB5=0;
	bcf	(1077/8)^080h,(1077)&7
	line	41
	
l2416:	
	return
	opt stack 0
GLOBAL	__end_of_op1_init
	__end_of_op1_init:
;; =============== function _op1_init ends ============

	signat	_op1_init,88
	global	_dac_init
psect	text776,local,class=CODE,delta=2
global __ptext776
__ptext776:

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
psect	text776
	file	"D:\develop\190625\AK7030-OTP\periph.c"
	line	14
	global	__size_of_dac_init
	__size_of_dac_init	equ	__end_of_dac_init-_dac_init
	
_dac_init:	
	opt	stack 5
; Regs used in _dac_init: [wreg]
	line	15
	
l3943:	
;periph.c: 15: DACCON|=1;
	bsf	(135)^080h+(0/8),(0)&7	;volatile
	line	17
	
l3945:	
;periph.c: 17: DACR0=0x0F;
	movlw	(0Fh)
	movwf	(136)^080h	;volatile
	line	18
	
l3947:	
;periph.c: 18: DACCON|=(1)<<2;
	bsf	(135)^080h+(2/8),(2)&7	;volatile
	line	22
	
l2413:	
	return
	opt stack 0
GLOBAL	__end_of_dac_init
	__end_of_dac_init:
;; =============== function _dac_init ends ============

	signat	_dac_init,88
	global	_adc_test_init
psect	text777,local,class=CODE,delta=2
global __ptext777
__ptext777:

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
psect	text777
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
	
l3933:	
;periph.c: 86: ADCON0 = 0x00;
	clrf	(31)	;volatile
	line	87
	
l3935:	
;periph.c: 87: ADCON0|=channel<<2;
	movf	(adc_test_init@channel),w
	movwf	(??_adc_test_init+0)+0
	clrc
	rlf	(??_adc_test_init+0)+0,f
	clrc
	rlf	(??_adc_test_init+0)+0,w
	iorwf	(31),f	;volatile
	line	88
	
l3937:	
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
	
l3939:	
;periph.c: 89: ADON=1;
	bcf	status, 5	;RP0=0, select bank0
	bsf	(248/8),(248)&7
	line	90
	
l3941:	
;periph.c: 90: ADIE=1;
	bsf	status, 5	;RP0=1, select bank1
	bsf	(1130/8)^080h,(1130)&7
	line	91
	
l2427:	
	return
	opt stack 0
GLOBAL	__end_of_adc_test_init
	__end_of_adc_test_init:
;; =============== function _adc_test_init ends ============

	signat	_adc_test_init,8312
	global	_timer1_interrupt_config
psect	text778,local,class=CODE,delta=2
global __ptext778
__ptext778:

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
psect	text778
	file	"D:\develop\190625\AK7030-OTP\common.c"
	line	192
	global	__size_of_timer1_interrupt_config
	__size_of_timer1_interrupt_config	equ	__end_of_timer1_interrupt_config-_timer1_interrupt_config
	
_timer1_interrupt_config:	
	opt	stack 5
; Regs used in _timer1_interrupt_config: []
	line	193
	
l3931:	
;common.c: 193: GIE = 1;
	bsf	(95/8),(95)&7
	line	194
;common.c: 194: PEIE = 1;
	bsf	(94/8),(94)&7
	line	195
	
l1687:	
	return
	opt stack 0
GLOBAL	__end_of_timer1_interrupt_config
	__end_of_timer1_interrupt_config:
;; =============== function _timer1_interrupt_config ends ============

	signat	_timer1_interrupt_config,88
	global	_timer1_config
psect	text779,local,class=CODE,delta=2
global __ptext779
__ptext779:

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
psect	text779
	file	"D:\develop\190625\AK7030-OTP\common.c"
	line	180
	global	__size_of_timer1_config
	__size_of_timer1_config	equ	__end_of_timer1_config-_timer1_config
	
_timer1_config:	
	opt	stack 5
; Regs used in _timer1_config: [wreg]
	line	182
	
l3927:	
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
	
l3929:	
;common.c: 185: TMR1IE=1;
	bsf	status, 5	;RP0=1, select bank1
	bsf	(1120/8)^080h,(1120)&7
	line	187
	
l1684:	
	return
	opt stack 0
GLOBAL	__end_of_timer1_config
	__end_of_timer1_config:
;; =============== function _timer1_config ends ============

	signat	_timer1_config,88
	global	_clock_config
psect	text780,local,class=CODE,delta=2
global __ptext780
__ptext780:

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
psect	text780
	file	"D:\develop\190625\AK7030-OTP\common.c"
	line	172
	global	__size_of_clock_config
	__size_of_clock_config	equ	__end_of_clock_config-_clock_config
	
_clock_config:	
	opt	stack 5
; Regs used in _clock_config: [wreg+status,2]
	line	174
	
l3923:	
;common.c: 174: CLKPR = 0x80;
	movlw	(080h)
	bcf	status, 5	;RP0=0, select bank2
	bsf	status, 6	;RP1=1, select bank2
	movwf	(264)^0100h	;volatile
	line	175
	
l3925:	
;common.c: 175: CLKPR = 0x00;
	clrf	(264)^0100h	;volatile
	line	176
;common.c: 176: while(CLKPCE);
	
l1678:	
	btfsc	(2119/8)^0100h,(2119)&7
	goto	u1021
	goto	u1020
u1021:
	goto	l1678
u1020:
	line	177
	
l1681:	
	return
	opt stack 0
GLOBAL	__end_of_clock_config
	__end_of_clock_config:
;; =============== function _clock_config ends ============

	signat	_clock_config,88
	global	_initPin
psect	text781,local,class=CODE,delta=2
global __ptext781
__ptext781:

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
psect	text781
	file	"D:\develop\190625\AK7030-OTP\main.c"
	line	105
	global	__size_of_initPin
	__size_of_initPin	equ	__end_of_initPin-_initPin
	
_initPin:	
	opt	stack 5
; Regs used in _initPin: []
	line	106
	
l3921:	
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
psect	text782,local,class=CODE,delta=2
global __ptext782
__ptext782:

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
psect	text782
	file	"D:\develop\190625\AK7030-OTP\common.c"
	line	376
	global	__size_of_clearTwentySecondsTimer
	__size_of_clearTwentySecondsTimer	equ	__end_of_clearTwentySecondsTimer-_clearTwentySecondsTimer
	
_clearTwentySecondsTimer:	
	opt	stack 4
; Regs used in _clearTwentySecondsTimer: [status,2]
	line	377
	
l3919:	
;common.c: 377: uiTwentySecondsTimer = 0;
	clrf	(_uiTwentySecondsTimer)^080h
	clrf	(_uiTwentySecondsTimer+1)^080h
	line	378
	
l1737:	
	return
	opt stack 0
GLOBAL	__end_of_clearTwentySecondsTimer
	__end_of_clearTwentySecondsTimer:
;; =============== function _clearTwentySecondsTimer ends ============

	signat	_clearTwentySecondsTimer,88
	global	_clearThreeHoursTimer
psect	text783,local,class=CODE,delta=2
global __ptext783
__ptext783:

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
psect	text783
	file	"D:\develop\190625\AK7030-OTP\common.c"
	line	371
	global	__size_of_clearThreeHoursTimer
	__size_of_clearThreeHoursTimer	equ	__end_of_clearThreeHoursTimer-_clearThreeHoursTimer
	
_clearThreeHoursTimer:	
	opt	stack 4
; Regs used in _clearThreeHoursTimer: [status,2]
	line	372
	
l3917:	
;common.c: 372: uiSmallTimer = 0;
	bsf	status, 5	;RP0=1, select bank1
	clrf	(_uiSmallTimer)^080h
	clrf	(_uiSmallTimer+1)^080h
	line	373
	
l1734:	
	return
	opt stack 0
GLOBAL	__end_of_clearThreeHoursTimer
	__end_of_clearThreeHoursTimer:
;; =============== function _clearThreeHoursTimer ends ============

	signat	_clearThreeHoursTimer,88
	global	_clearTwelveHoursTimer
psect	text784,local,class=CODE,delta=2
global __ptext784
__ptext784:

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
;;		On entry : 140/20
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
psect	text784
	file	"D:\develop\190625\AK7030-OTP\common.c"
	line	365
	global	__size_of_clearTwelveHoursTimer
	__size_of_clearTwelveHoursTimer	equ	__end_of_clearTwelveHoursTimer-_clearTwelveHoursTimer
	
_clearTwelveHoursTimer:	
	opt	stack 4
; Regs used in _clearTwelveHoursTimer: [status,2]
	line	366
	
l3915:	
;common.c: 366: uiBigTimer = 0;
	bsf	status, 5	;RP0=1, select bank1
	clrf	(_uiBigTimer)^080h
	clrf	(_uiBigTimer+1)^080h
	line	367
	
l1731:	
	return
	opt stack 0
GLOBAL	__end_of_clearTwelveHoursTimer
	__end_of_clearTwelveHoursTimer:
;; =============== function _clearTwelveHoursTimer ends ============

	signat	_clearTwelveHoursTimer,88
	global	_ISR
psect	text785,local,class=CODE,delta=2
global __ptext785
__ptext785:

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
psect	text785
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
psect	text785
	line	442
	
i1l4149:	
;common.c: 440: static unsigned char ucTimer1sCnt = 0;
;common.c: 442: if(TMR1IF == 1)
	btfss	(96/8),(96)&7
	goto	u126_21
	goto	u126_20
u126_21:
	goto	i1l4167
u126_20:
	line	444
	
i1l4151:	
;common.c: 443: {
;common.c: 444: TMR1IF = 0 ;
	bcf	(96/8),(96)&7
	line	445
	
i1l4153:	
;common.c: 445: timer.timer10msStopWatch++;
	bsf	status, 5	;RP0=1, select bank1
	incf	(_timer)^080h,f
	line	446
;common.c: 446: ucTimer1sCnt++;
	incf	(ISR@ucTimer1sCnt)^080h,f
	line	448
	
i1l4155:	
;common.c: 448: if(ucTimer1sCnt >= 100)
	movlw	(064h)
	subwf	(ISR@ucTimer1sCnt)^080h,w
	skipc
	goto	u127_21
	goto	u127_20
u127_21:
	goto	i1l4167
u127_20:
	line	450
	
i1l4157:	
;common.c: 449: {
;common.c: 450: ucTimer1sCnt = 0;
	clrf	(ISR@ucTimer1sCnt)^080h
	line	451
	
i1l4159:	
;common.c: 451: if(uiBigTimer > 0)
	movf	(_uiBigTimer+1)^080h,w
	iorwf	(_uiBigTimer)^080h,w
	skipnz
	goto	u128_21
	goto	u128_20
u128_21:
	goto	i1l1774
u128_20:
	line	452
	
i1l4161:	
;common.c: 452: uiBigTimer--;
	movlw	low(01h)
	subwf	(_uiBigTimer)^080h,f
	movlw	high(01h)
	skipc
	decf	(_uiBigTimer+1)^080h,f
	subwf	(_uiBigTimer+1)^080h,f
	
i1l1774:	
	line	454
;common.c: 454: if(uiSmallTimer)
	movf	(_uiSmallTimer+1)^080h,w
	iorwf	(_uiSmallTimer)^080h,w
	skipnz
	goto	u129_21
	goto	u129_20
u129_21:
	goto	i1l1775
u129_20:
	line	455
	
i1l4163:	
;common.c: 455: uiSmallTimer--;
	movlw	low(01h)
	subwf	(_uiSmallTimer)^080h,f
	movlw	high(01h)
	skipc
	decf	(_uiSmallTimer+1)^080h,f
	subwf	(_uiSmallTimer+1)^080h,f
	
i1l1775:	
	line	457
;common.c: 457: if(uiTwentySecondsTimer)
	movf	(_uiTwentySecondsTimer+1)^080h,w
	iorwf	(_uiTwentySecondsTimer)^080h,w
	skipnz
	goto	u130_21
	goto	u130_20
u130_21:
	goto	i1l4167
u130_20:
	line	458
	
i1l4165:	
;common.c: 458: uiTwentySecondsTimer--;
	movlw	low(01h)
	subwf	(_uiTwentySecondsTimer)^080h,f
	movlw	high(01h)
	skipc
	decf	(_uiTwentySecondsTimer+1)^080h,f
	subwf	(_uiTwentySecondsTimer+1)^080h,f
	line	462
	
i1l4167:	
;common.c: 459: }
;common.c: 460: }
;common.c: 462: if(ADIF)
	bcf	status, 5	;RP0=0, select bank0
	btfss	(106/8),(106)&7
	goto	u131_21
	goto	u131_20
u131_21:
	goto	i1l1782
u131_20:
	line	464
	
i1l4169:	
;common.c: 463: {
;common.c: 464: ADIF=0;
	bcf	(106/8),(106)&7
	line	465
	
i1l4171:	
;common.c: 465: setAD_ConvertFlag(1);
	movlw	(01h)
	fcall	i1_setAD_ConvertFlag
	line	467
	
i1l4173:	
;common.c: 467: if(sampleChannelSelect == 4)
	bcf	status, 5	;RP0=0, select bank0
	movf	(_sampleChannelSelect),w
	xorlw	04h
	skipz
	goto	u132_21
	goto	u132_20
u132_21:
	goto	i1l4177
u132_20:
	line	471
	
i1l4175:	
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
	goto	i1l1782
	line	476
	
i1l4177:	
;common.c: 476: else if(sampleChannelSelect == 1)
	decf	(_sampleChannelSelect),w
	skipz
	goto	u133_21
	goto	u133_20
u133_21:
	goto	i1l4181
u133_20:
	line	479
	
i1l4179:	
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
	goto	i1l1782
	line	490
	
i1l4181:	
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
	
i1l1782:	
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
psect	text786,local,class=CODE,delta=2
global __ptext786
__ptext786:

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
psect	text786
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
	
i1l4187:	
;common.c: 207: adc_convert_flag = flag;
	movf	(i1setAD_ConvertFlag@flag),w
	bsf	status, 5	;RP0=1, select bank1
	movwf	(_adc_convert_flag)^080h
	line	208
	
i1l1693:	
	return
	opt stack 0
GLOBAL	__end_ofi1_setAD_ConvertFlag
	__end_ofi1_setAD_ConvertFlag:
;; =============== function i1_setAD_ConvertFlag ends ============

	signat	i1_setAD_ConvertFlag,88
	global	_adc_get
psect	text787,local,class=CODE,delta=2
global __ptext787
__ptext787:

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
psect	text787
	file	"D:\develop\190625\AK7030-OTP\periph.c"
	line	105
	global	__size_of_adc_get
	__size_of_adc_get	equ	__end_of_adc_get-_adc_get
	
_adc_get:	
	opt	stack 3
; Regs used in _adc_get: [wreg]
	line	107
	
i1l4183:	
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
	
i1l2436:	
	return
	opt stack 0
GLOBAL	__end_of_adc_get
	__end_of_adc_get:
;; =============== function _adc_get ends ============

	signat	_adc_get,90
	global	_vPutSampleDataIntoTable
psect	text788,local,class=CODE,delta=2
global __ptext788
__ptext788:

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
psect	text788
	file	"D:\develop\190625\AK7030-OTP\common.c"
	line	97
	global	__size_of_vPutSampleDataIntoTable
	__size_of_vPutSampleDataIntoTable	equ	__end_of_vPutSampleDataIntoTable-_vPutSampleDataIntoTable
	
_vPutSampleDataIntoTable:	
	opt	stack 3
; Regs used in _vPutSampleDataIntoTable: [wreg-fsr0h+status,2+status,0+btemp+1]
	line	105
	
i1l4073:	
;common.c: 99: static unsigned char ucChannelFirstLength = 0;
;common.c: 101: static unsigned char ucChannelFourthLength = 0;
;common.c: 103: static unsigned char ucChannelFourteenthLength = 0;
;common.c: 105: if(channel == 1)
	decf	(vPutSampleDataIntoTable@channel),w
	skipz
	goto	u114_21
	goto	u114_20
u114_21:
	goto	i1l4085
u114_20:
	line	107
	
i1l4075:	
;common.c: 106: {
;common.c: 107: if(ucChannelFirstLength < 12)
	movlw	(0Ch)
	subwf	(vPutSampleDataIntoTable@ucChannelFirstLength),w
	skipnc
	goto	u115_21
	goto	u115_20
u115_21:
	goto	i1l4081
u115_20:
	line	109
	
i1l4077:	
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
	
i1l4079:	
;common.c: 111: ucChannelFirstLength++;
	incf	(vPutSampleDataIntoTable@ucChannelFirstLength),f
	line	112
;common.c: 112: }
	goto	i1l1675
	line	115
	
i1l4081:	
;common.c: 113: else
;common.c: 114: {
;common.c: 115: ucChannelFirstLength = 0;
	clrf	(vPutSampleDataIntoTable@ucChannelFirstLength)
	line	117
	
i1l4083:	
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
	goto	i1l1675
	line	120
	
i1l4085:	
;common.c: 120: else if(channel == 4)
	movf	(vPutSampleDataIntoTable@channel),w
	xorlw	04h
	skipz
	goto	u116_21
	goto	u116_20
u116_21:
	goto	i1l4097
u116_20:
	line	122
	
i1l4087:	
;common.c: 121: {
;common.c: 122: if(ucChannelFourthLength < 12)
	movlw	(0Ch)
	bcf	status, 5	;RP0=0, select bank0
	subwf	(vPutSampleDataIntoTable@ucChannelFourthLength),w
	skipnc
	goto	u117_21
	goto	u117_20
u117_21:
	goto	i1l4093
u117_20:
	line	124
	
i1l4089:	
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
	
i1l4091:	
;common.c: 126: ucChannelFourthLength++;
	incf	(vPutSampleDataIntoTable@ucChannelFourthLength),f
	line	127
;common.c: 127: }
	goto	i1l1675
	line	130
	
i1l4093:	
;common.c: 128: else
;common.c: 129: {
;common.c: 130: ucChannelFourthLength = 0;
	clrf	(vPutSampleDataIntoTable@ucChannelFourthLength)
	line	132
	
i1l4095:	
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
	goto	i1l1675
	line	135
	
i1l4097:	
;common.c: 135: else if(channel == 14)
	movf	(vPutSampleDataIntoTable@channel),w
	xorlw	0Eh
	skipz
	goto	u118_21
	goto	u118_20
u118_21:
	goto	i1l4109
u118_20:
	line	137
	
i1l4099:	
;common.c: 136: {
;common.c: 137: if(ucChannelFourteenthLength < 12)
	movlw	(0Ch)
	bcf	status, 5	;RP0=0, select bank0
	subwf	(vPutSampleDataIntoTable@ucChannelFourteenthLength),w
	skipnc
	goto	u119_21
	goto	u119_20
u119_21:
	goto	i1l4105
u119_20:
	line	139
	
i1l4101:	
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
	
i1l4103:	
;common.c: 141: ucChannelFourteenthLength++;
	incf	(vPutSampleDataIntoTable@ucChannelFourteenthLength),f
	line	142
;common.c: 142: }
	goto	i1l1675
	line	145
	
i1l4105:	
;common.c: 143: else
;common.c: 144: {
;common.c: 145: ucChannelFourteenthLength = 0;
	clrf	(vPutSampleDataIntoTable@ucChannelFourteenthLength)
	line	147
	
i1l4107:	
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
	goto	i1l1675
	line	152
	
i1l4109:	
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
	
i1l4115:	
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
	
i1l4117:	
	incf	(vPutSampleDataIntoTable@i),f
	skipnz
	incf	(vPutSampleDataIntoTable@i+1),f
	
i1l4119:	
	movf	(vPutSampleDataIntoTable@i+1),w
	xorlw	80h
	movwf	btemp+1
	movlw	(high(0Ch))^80h
	subwf	btemp+1,w
	skipz
	goto	u120_25
	movlw	low(0Ch)
	subwf	(vPutSampleDataIntoTable@i),w
u120_25:

	skipc
	goto	u120_21
	goto	u120_20
u120_21:
	goto	i1l4115
u120_20:
	line	168
	
i1l1675:	
	return
	opt stack 0
GLOBAL	__end_of_vPutSampleDataIntoTable
	__end_of_vPutSampleDataIntoTable:
;; =============== function _vPutSampleDataIntoTable ends ============

	signat	_vPutSampleDataIntoTable,8312
psect	text789,local,class=CODE,delta=2
global __ptext789
__ptext789:
	global	btemp
	btemp set 07Eh

	DABS	1,126,2	;btemp
	global	wtemp0
	wtemp0 set btemp
	end
