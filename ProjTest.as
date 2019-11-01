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
# 101 "D:\develop\190625\AK7030-OTP\main.c"
	psect config,class=CONFIG,delta=2 ;#
# 101 "D:\develop\190625\AK7030-OTP\main.c"
	dw 0x0FFF & 0x3FFF & 0x3FFF & 0x3FFF & 0x3FFF & 0x3FFF ;#
# 102 "D:\develop\190625\AK7030-OTP\main.c"
	psect config,class=CONFIG,delta=2 ;#
# 102 "D:\develop\190625\AK7030-OTP\main.c"
	dw 0x3FFF & 0x3FDF & 0x3FFF & 0x3FFE ;#
# 103 "D:\develop\190625\AK7030-OTP\main.c"
	psect config,class=CONFIG,delta=2 ;#
# 103 "D:\develop\190625\AK7030-OTP\main.c"
	dw 0X3FFF & 0x3FFF & 0x3FFF & 0x3FF8 ;#
	FNCALL	_main,_initPin
	FNCALL	_main,_setPinInitVaule
	FNCALL	_main,_selectAdChannel
	FNCALL	_main,_clock_config
	FNCALL	_main,_timer1_config
	FNCALL	_main,_timer1_interrupt_config
	FNCALL	_main,_adc_test_init
	FNCALL	_main,_adc_start
	FNCALL	_main,_startTwentyMinTimer
	FNCALL	_main,_process_AD_Converter_Value
	FNCALL	_main,_isPermitSampleTime
	FNCALL	_main,_clrSampeTime
	FNCALL	_main,_isFinishedTwentyMinTimer
	FNCALL	_main,_getAdOriginalCh13Value
	FNCALL	_main,_calPulseWidth
	FNCALL	_main,_pwm_start
	FNCALL	_main,_setPB3
	FNCALL	_main,_setPB4
	FNCALL	_main,_setPB5
	FNCALL	_main,_clearTwentyMinTimer
	FNCALL	_main,_startTwelveHourTimer
	FNCALL	_main,_isFinishedTwelveHoursTimer
	FNCALL	_main,_clearTwelveHoursTimer
	FNCALL	_main,_startThreeHoursTimer
	FNCALL	_main,_isFinishedThreeHoursTimer
	FNCALL	_main,_clearThreeHoursTimer
	FNCALL	_main,_startOneHoursTimer
	FNCALL	_main,_isFinishedOneHoursTimer
	FNCALL	_main,_reset
	FNCALL	_main,_pwm_config
	FNCALL	_calPulseWidth,_getAdOriginalCh12Value
	FNCALL	_getAdOriginalCh13Value,_Filter
	FNCALL	_process_AD_Converter_Value,_getAD_ConvertFlag
	FNCALL	_process_AD_Converter_Value,_setAD_ConvertFlag
	FNCALL	_process_AD_Converter_Value,_AD_Sample
	FNCALL	_process_AD_Converter_Value,_adc_test_init
	FNCALL	_process_AD_Converter_Value,_adc_start
	FNCALL	_getAdOriginalCh12Value,_Filter
	FNCALL	_setPinInitVaule,_setPB3
	FNCALL	_setPinInitVaule,_setPB4
	FNCALL	_setPinInitVaule,_setPB5
	FNCALL	_initPin,_initPB2_AsHighResistence
	FNCALL	_initPin,_initPB3
	FNCALL	_initPin,_initPB4
	FNCALL	_initPin,_initPB5
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
	retlw	0Ch
	global	_uiBigTimer
	global	_uiOneHourTimer
	global	_uiSmallTimer
	global	_uiTwentyMinTimer
	global	main@uiTimerOneP5s
	global	ISR@ucTimer1sCnt
	global	_adc_convert_flag
	global	_bBigTimerStartFlag
	global	_bOneHourTimerStartFlag
	global	_bSmallTimerStartFlag
	global	_bTwentyMinStartFlag
	global	_sampleTimes
	global	_timer
	global	main@cTimerP5s_792
	global	main@cTimerP5s_797
	global	main@ucStep
	global	main@ucTimerP3s
	global	main@ucTimerP5s
	global	vPutSampleDataIntoTable@ucChannelFourteenthLength
	global	vPutSampleDataIntoTable@ucChannelFourthLength
	global	vPutSampleDataIntoTable@ucChannelFirstLength
	global	_uiTwentySecondsTimer
	global	main@uiTimerThreeP5s
	global	main@uiTimerTwoP5s
	global	_uiSampleChannelFirst
	global	_uiSampleChannelFourteenth
	global	_uiSampleChannelFourth
	global	_ADCON0
_ADCON0	set	31
	global	_ADRESH
_ADRESH	set	30
	global	_CCP1CON
_CCP1CON	set	23
	global	_CCPR1L
_CCPR1L	set	21
	global	_T1CON
_T1CON	set	16
	global	_T2CON
_T2CON	set	18
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
	global	_PB2
_PB2	set	50
	global	_PB3
_PB3	set	51
	global	_PB4
_PB4	set	52
	global	_PB5
_PB5	set	53
	global	_PEIE
_PEIE	set	94
	global	_TMR1IF
_TMR1IF	set	96
	global	_ADCON1
_ADCON1	set	159
	global	_ADRESL
_ADRESL	set	158
	global	_PR2
_PR2	set	146
	global	_ADIE
_ADIE	set	1130
	global	_TMR1IE
_TMR1IE	set	1120
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
	global	_CLKPR
_CLKPR	set	264
	global	_CLKPCE
_CLKPCE	set	2119
	global	_PBOD2
_PBOD2	set	3138
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

_uiOneHourTimer:
       ds      2

_uiSmallTimer:
       ds      2

_uiTwentyMinTimer:
       ds      2

main@uiTimerOneP5s:
       ds      2

ISR@ucTimer1sCnt:
       ds      1

_adc_convert_flag:
       ds      1

_bBigTimerStartFlag:
       ds      1

_bOneHourTimerStartFlag:
       ds      1

_bSmallTimerStartFlag:
       ds      1

_bTwentyMinStartFlag:
       ds      1

_sampleTimes:
       ds      1

_timer:
       ds      1

main@cTimerP5s_792:
       ds      1

main@cTimerP5s_797:
       ds      1

main@ucStep:
       ds      1

main@ucTimerP3s:
       ds      1

main@ucTimerP5s:
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
_uiTwentySecondsTimer:
       ds      2

main@uiTimerThreeP5s:
       ds      2

main@uiTimerTwoP5s:
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
	movlw	low((__pbssBANK0)+019h)
	fcall	clear_ram
; Clear objects allocated to BANK1
psect cinit,class=CODE,delta=2
	movlw	low(__pbssBANK1)
	movwf	fsr
	movlw	low((__pbssBANK1)+04Eh)
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
	global	?_clearTwentyMinTimer
?_clearTwentyMinTimer:	; 0 bytes @ 0x0
	global	?_AD_Sample
?_AD_Sample:	; 0 bytes @ 0x0
	global	?_initPB3
?_initPB3:	; 0 bytes @ 0x0
	global	?_setPB3
?_setPB3:	; 0 bytes @ 0x0
	global	?_initPB4
?_initPB4:	; 0 bytes @ 0x0
	global	?_setPB4
?_setPB4:	; 0 bytes @ 0x0
	global	?_initPB5
?_initPB5:	; 0 bytes @ 0x0
	global	?_setPB5
?_setPB5:	; 0 bytes @ 0x0
	global	?_initPB2_AsHighResistence
?_initPB2_AsHighResistence:	; 0 bytes @ 0x0
	global	?_pwm_start
?_pwm_start:	; 0 bytes @ 0x0
	global	?_pwm_config
?_pwm_config:	; 0 bytes @ 0x0
	global	?_initPin
?_initPin:	; 0 bytes @ 0x0
	global	?_setPinInitVaule
?_setPinInitVaule:	; 0 bytes @ 0x0
	global	?_selectAdChannel
?_selectAdChannel:	; 0 bytes @ 0x0
	global	?_reset
?_reset:	; 0 bytes @ 0x0
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
	global	?_isFinishedThreeHoursTimer
?_isFinishedThreeHoursTimer:	; 1 bytes @ 0x0
	global	?_isFinishedOneHoursTimer
?_isFinishedOneHoursTimer:	; 1 bytes @ 0x0
	global	?_calPulseWidth
?_calPulseWidth:	; 1 bytes @ 0x0
	global	?_getAD_ConvertFlag
?_getAD_ConvertFlag:	; 1 bytes @ 0x0
	global	?_adc_get
?_adc_get:	; 2 bytes @ 0x0
	global	?_main
?_main:	; 2 bytes @ 0x0
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
	global	?_startTwentyMinTimer
?_startTwentyMinTimer:	; 0 bytes @ 0x0
	global	??_isPermitSampleTime
??_isPermitSampleTime:	; 0 bytes @ 0x0
	global	??_clrSampeTime
??_clrSampeTime:	; 0 bytes @ 0x0
	global	??_isFinishedTwentyMinTimer
??_isFinishedTwentyMinTimer:	; 0 bytes @ 0x0
	global	??_clearTwentyMinTimer
??_clearTwentyMinTimer:	; 0 bytes @ 0x0
	global	?_startTwelveHourTimer
?_startTwelveHourTimer:	; 0 bytes @ 0x0
	global	??_isFinishedTwelveHoursTimer
??_isFinishedTwelveHoursTimer:	; 0 bytes @ 0x0
	global	?_startThreeHoursTimer
?_startThreeHoursTimer:	; 0 bytes @ 0x0
	global	??_isFinishedThreeHoursTimer
??_isFinishedThreeHoursTimer:	; 0 bytes @ 0x0
	global	?_startOneHoursTimer
?_startOneHoursTimer:	; 0 bytes @ 0x0
	global	??_isFinishedOneHoursTimer
??_isFinishedOneHoursTimer:	; 0 bytes @ 0x0
	global	??_AD_Sample
??_AD_Sample:	; 0 bytes @ 0x0
	global	??_initPB3
??_initPB3:	; 0 bytes @ 0x0
	global	??_setPB3
??_setPB3:	; 0 bytes @ 0x0
	global	??_initPB4
??_initPB4:	; 0 bytes @ 0x0
	global	??_setPB4
??_setPB4:	; 0 bytes @ 0x0
	global	??_initPB5
??_initPB5:	; 0 bytes @ 0x0
	global	??_setPB5
??_setPB5:	; 0 bytes @ 0x0
	global	??_initPB2_AsHighResistence
??_initPB2_AsHighResistence:	; 0 bytes @ 0x0
	global	??_pwm_start
??_pwm_start:	; 0 bytes @ 0x0
	global	??_pwm_config
??_pwm_config:	; 0 bytes @ 0x0
	global	??_selectAdChannel
??_selectAdChannel:	; 0 bytes @ 0x0
	global	??_reset
??_reset:	; 0 bytes @ 0x0
	global	??_getAD_ConvertFlag
??_getAD_ConvertFlag:	; 0 bytes @ 0x0
	global	??_setAD_ConvertFlag
??_setAD_ConvertFlag:	; 0 bytes @ 0x0
	global	?_Filter
?_Filter:	; 2 bytes @ 0x0
	global	initPB3@bValue
initPB3@bValue:	; 1 bytes @ 0x0
	global	setPB3@bValue
setPB3@bValue:	; 1 bytes @ 0x0
	global	initPB4@bValue
initPB4@bValue:	; 1 bytes @ 0x0
	global	setPB4@bValue
setPB4@bValue:	; 1 bytes @ 0x0
	global	initPB5@bValue
initPB5@bValue:	; 1 bytes @ 0x0
	global	setPB5@bValue
setPB5@bValue:	; 1 bytes @ 0x0
	global	pwm_start@ucCCP1CON_Value
pwm_start@ucCCP1CON_Value:	; 1 bytes @ 0x0
	global	pwm_config@state
pwm_config@state:	; 1 bytes @ 0x0
	global	setAD_ConvertFlag@flag
setAD_ConvertFlag@flag:	; 1 bytes @ 0x0
	global	adc_test_init@ref
adc_test_init@ref:	; 1 bytes @ 0x0
	global	startTwelveHourTimer@uiSetTime
startTwelveHourTimer@uiSetTime:	; 2 bytes @ 0x0
	global	startThreeHoursTimer@uiSetTime
startThreeHoursTimer@uiSetTime:	; 2 bytes @ 0x0
	global	startOneHoursTimer@uiSetTime
startOneHoursTimer@uiSetTime:	; 2 bytes @ 0x0
	global	startTwentyMinTimer@uiSetValue
startTwentyMinTimer@uiSetValue:	; 2 bytes @ 0x0
	ds	1
	global	??_adc_test_init
??_adc_test_init:	; 0 bytes @ 0x1
	global	??_initPin
??_initPin:	; 0 bytes @ 0x1
	global	??_setPinInitVaule
??_setPinInitVaule:	; 0 bytes @ 0x1
	global	pwm_start@ucGetLowestTwoValue
pwm_start@ucGetLowestTwoValue:	; 1 bytes @ 0x1
	ds	1
	global	??_startTwentyMinTimer
??_startTwentyMinTimer:	; 0 bytes @ 0x2
	global	??_startTwelveHourTimer
??_startTwelveHourTimer:	; 0 bytes @ 0x2
	global	??_startThreeHoursTimer
??_startThreeHoursTimer:	; 0 bytes @ 0x2
	global	??_startOneHoursTimer
??_startOneHoursTimer:	; 0 bytes @ 0x2
	global	??_Filter
??_Filter:	; 0 bytes @ 0x2
	global	pwm_start@ucGeHighestSixValue
pwm_start@ucGeHighestSixValue:	; 1 bytes @ 0x2
	global	adc_test_init@channel
adc_test_init@channel:	; 1 bytes @ 0x2
	ds	1
	global	??_process_AD_Converter_Value
??_process_AD_Converter_Value:	; 0 bytes @ 0x3
	global	pwm_start@ucConvertRealPulseWidth
pwm_start@ucConvertRealPulseWidth:	; 1 bytes @ 0x3
	ds	1
	global	pwm_start@ucPulseWidth
pwm_start@ucPulseWidth:	; 1 bytes @ 0x4
	ds	2
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
	global	?_getAdOriginalCh12Value
?_getAdOriginalCh12Value:	; 2 bytes @ 0x27
	global	?_getAdOriginalCh13Value
?_getAdOriginalCh13Value:	; 2 bytes @ 0x27
	ds	2
	global	??_getAdOriginalCh12Value
??_getAdOriginalCh12Value:	; 0 bytes @ 0x29
	global	??_getAdOriginalCh13Value
??_getAdOriginalCh13Value:	; 0 bytes @ 0x29
	global	??_calPulseWidth
??_calPulseWidth:	; 0 bytes @ 0x29
	global	calPulseWidth@uiGapValue
calPulseWidth@uiGapValue:	; 2 bytes @ 0x29
	ds	2
	global	calPulseWidth@ucThreeTimesValue
calPulseWidth@ucThreeTimesValue:	; 1 bytes @ 0x2B
	ds	1
	global	calPulseWidth@ucHalfValue
calPulseWidth@ucHalfValue:	; 1 bytes @ 0x2C
	ds	1
	global	calPulseWidth@ucPulseWidth
calPulseWidth@ucPulseWidth:	; 1 bytes @ 0x2D
	ds	1
	global	calPulseWidth@ucGapValue
calPulseWidth@ucGapValue:	; 1 bytes @ 0x2E
	ds	1
	global	calPulseWidth@uiChannel2Value
calPulseWidth@uiChannel2Value:	; 2 bytes @ 0x2F
	ds	2
	global	??_main
??_main:	; 0 bytes @ 0x31
	global	main@ucChValue
main@ucChValue:	; 2 bytes @ 0x31
	ds	2
	global	main@ucPulseWidth
main@ucPulseWidth:	; 1 bytes @ 0x33
	ds	1
	global	main@uiCh13Value
main@uiCh13Value:	; 2 bytes @ 0x34
	ds	2
;;Data sizes: Strings 0, constant 0, data 1, bss 104, persistent 0 stack 0
;;Auto spaces:   Size  Autos    Used
;; COMMON          14     13      14
;; BANK0           80     54      80
;; BANK1           80      0      78
;; BANK3           96      0       0
;; BANK2           96      0       0

;;
;; Pointer list with targets:

;; ?_adc_get	unsigned int  size(1) Largest target is 0
;;
;; ?_getAdOriginalCh13Value	unsigned int  size(1) Largest target is 0
;;
;; ?_getAdOriginalCh12Value	unsigned int  size(1) Largest target is 0
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
;;   _main->_calPulseWidth
;;   _calPulseWidth->_getAdOriginalCh12Value
;;   _getAdOriginalCh13Value->_Filter
;;   _process_AD_Converter_Value->_adc_test_init
;;   _getAdOriginalCh12Value->_Filter
;;   _setPinInitVaule->_setPB3
;;   _setPinInitVaule->_setPB4
;;   _setPinInitVaule->_setPB5
;;   _initPin->_initPB3
;;   _initPin->_initPB4
;;   _initPin->_initPB5
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
;; (0) _main                                                 5     5      0    2194
;;                                             49 BANK0      5     5      0
;;                            _initPin
;;                    _setPinInitVaule
;;                    _selectAdChannel
;;                       _clock_config
;;                      _timer1_config
;;            _timer1_interrupt_config
;;                      _adc_test_init
;;                          _adc_start
;;                _startTwentyMinTimer
;;         _process_AD_Converter_Value
;;                 _isPermitSampleTime
;;                       _clrSampeTime
;;           _isFinishedTwentyMinTimer
;;             _getAdOriginalCh13Value
;;                      _calPulseWidth
;;                          _pwm_start
;;                             _setPB3
;;                             _setPB4
;;                             _setPB5
;;                _clearTwentyMinTimer
;;               _startTwelveHourTimer
;;         _isFinishedTwelveHoursTimer
;;              _clearTwelveHoursTimer
;;               _startThreeHoursTimer
;;          _isFinishedThreeHoursTimer
;;               _clearThreeHoursTimer
;;                 _startOneHoursTimer
;;            _isFinishedOneHoursTimer
;;                              _reset
;;                         _pwm_config
;; ---------------------------------------------------------------------------------
;; (1) _calPulseWidth                                        8     8      0     832
;;                                             41 BANK0      8     8      0
;;             _getAdOriginalCh12Value
;; ---------------------------------------------------------------------------------
;; (1) _getAdOriginalCh13Value                               2     0      2     620
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
;; (2) _getAdOriginalCh12Value                               2     0      2     620
;;                                             39 BANK0      2     0      2
;;                             _Filter
;; ---------------------------------------------------------------------------------
;; (1) _setPinInitVaule                                      0     0      0      66
;;                             _setPB3
;;                             _setPB4
;;                             _setPB5
;; ---------------------------------------------------------------------------------
;; (1) _initPin                                              0     0      0      66
;;           _initPB2_AsHighResistence
;;                            _initPB3
;;                            _initPB4
;;                            _initPB5
;; ---------------------------------------------------------------------------------
;; (2) _AD_Sample                                            0     0      0       0
;; ---------------------------------------------------------------------------------
;; (2) _setAD_ConvertFlag                                    1     1      0      22
;;                                              0 BANK0      1     1      0
;; ---------------------------------------------------------------------------------
;; (2) _getAD_ConvertFlag                                    0     0      0       0
;; ---------------------------------------------------------------------------------
;; (3) _Filter                                              39    37      2     620
;;                                              0 BANK0     39    37      2
;; ---------------------------------------------------------------------------------
;; (1) _isFinishedOneHoursTimer                              0     0      0       0
;; ---------------------------------------------------------------------------------
;; (1) _startOneHoursTimer                                   2     0      2      22
;;                                              0 BANK0      2     0      2
;; ---------------------------------------------------------------------------------
;; (1) _isFinishedThreeHoursTimer                            0     0      0       0
;; ---------------------------------------------------------------------------------
;; (1) _startThreeHoursTimer                                 2     0      2      22
;;                                              0 BANK0      2     0      2
;; ---------------------------------------------------------------------------------
;; (1) _isFinishedTwelveHoursTimer                           0     0      0       0
;; ---------------------------------------------------------------------------------
;; (1) _startTwelveHourTimer                                 2     0      2      22
;;                                              0 BANK0      2     0      2
;; ---------------------------------------------------------------------------------
;; (1) _clearTwentyMinTimer                                  0     0      0       0
;; ---------------------------------------------------------------------------------
;; (1) _isFinishedTwentyMinTimer                             0     0      0       0
;; ---------------------------------------------------------------------------------
;; (1) _clrSampeTime                                         0     0      0       0
;; ---------------------------------------------------------------------------------
;; (1) _isPermitSampleTime                                   0     0      0       0
;; ---------------------------------------------------------------------------------
;; (1) _startTwentyMinTimer                                  2     0      2      22
;;                                              0 BANK0      2     0      2
;; ---------------------------------------------------------------------------------
;; (2) _adc_start                                            0     0      0       0
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
;; (1) _reset                                                0     0      0       0
;; ---------------------------------------------------------------------------------
;; (1) _selectAdChannel                                      0     0      0       0
;; ---------------------------------------------------------------------------------
;; (1) _pwm_config                                           1     1      0      22
;;                                              0 BANK0      1     1      0
;; ---------------------------------------------------------------------------------
;; (1) _pwm_start                                            5     5      0     210
;;                                              0 BANK0      5     5      0
;; ---------------------------------------------------------------------------------
;; (2) _initPB2_AsHighResistence                             0     0      0       0
;; ---------------------------------------------------------------------------------
;; (1) _setPB5                                               1     1      0      22
;;                                              0 BANK0      1     1      0
;; ---------------------------------------------------------------------------------
;; (2) _initPB5                                              1     1      0      22
;;                                              0 BANK0      1     1      0
;; ---------------------------------------------------------------------------------
;; (1) _setPB4                                               1     1      0      22
;;                                              0 BANK0      1     1      0
;; ---------------------------------------------------------------------------------
;; (2) _initPB4                                              1     1      0      22
;;                                              0 BANK0      1     1      0
;; ---------------------------------------------------------------------------------
;; (1) _setPB3                                               1     1      0      22
;;                                              0 BANK0      1     1      0
;; ---------------------------------------------------------------------------------
;; (2) _initPB3                                              1     1      0      22
;;                                              0 BANK0      1     1      0
;; ---------------------------------------------------------------------------------
;; (1) _clearThreeHoursTimer                                 0     0      0       0
;; ---------------------------------------------------------------------------------
;; (1) _clearTwelveHoursTimer                                0     0      0       0
;; ---------------------------------------------------------------------------------
;; Estimated maximum stack depth 3
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
;;     _initPB2_AsHighResistence
;;     _initPB3
;;     _initPB4
;;     _initPB5
;;   _setPinInitVaule
;;     _setPB3
;;     _setPB4
;;     _setPB5
;;   _selectAdChannel
;;   _clock_config
;;   _timer1_config
;;   _timer1_interrupt_config
;;   _adc_test_init
;;   _adc_start
;;   _startTwentyMinTimer
;;   _process_AD_Converter_Value
;;     _getAD_ConvertFlag
;;     _setAD_ConvertFlag
;;     _AD_Sample
;;     _adc_test_init
;;     _adc_start
;;   _isPermitSampleTime
;;   _clrSampeTime
;;   _isFinishedTwentyMinTimer
;;   _getAdOriginalCh13Value
;;     _Filter
;;   _calPulseWidth
;;     _getAdOriginalCh12Value
;;       _Filter
;;   _pwm_start
;;   _setPB3
;;   _setPB4
;;   _setPB5
;;   _clearTwentyMinTimer
;;   _startTwelveHourTimer
;;   _isFinishedTwelveHoursTimer
;;   _clearTwelveHoursTimer
;;   _startThreeHoursTimer
;;   _isFinishedThreeHoursTimer
;;   _clearThreeHoursTimer
;;   _startOneHoursTimer
;;   _isFinishedOneHoursTimer
;;   _reset
;;   _pwm_config
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
;;BANK1               50      0      4E       8       97.5%
;;BITBANK1            50      0       0       7        0.0%
;;CODE                 0      0       0       0        0.0%
;;DATA                 0      0      B3       6        0.0%
;;ABS                  0      0      AC       3        0.0%
;;NULL                 0      0       0       0        0.0%
;;STACK                0      0       7       2        0.0%
;;BANK0               50     36      50       5      100.0%
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
;;		line 594 in file "D:\develop\190625\AK7030-OTP\main.c"
;; Parameters:    Size  Location     Type
;;		None
;; Auto vars:     Size  Location     Type
;;  ucChValue       2   49[BANK0 ] unsigned int 
;;  uiCh13Value     2   52[BANK0 ] unsigned int 
;;  ucPulseWidth    1   51[BANK0 ] unsigned char 
;; Return value:  Size  Location     Type
;;                  2  746[COMMON] int 
;; Registers used:
;;		wreg, fsr0l, fsr0h, status,2, status,0, btemp+1, pclath, cstack
;; Tracked objects:
;;		On entry : 17F/0
;;		On exit  : 60/0
;;		Unchanged: FFE00/0
;; Data sizes:     COMMON   BANK0   BANK1   BANK3   BANK2
;;      Params:         0       0       0       0       0
;;      Locals:         0       5       0       0       0
;;      Temps:          0       0       0       0       0
;;      Totals:         0       5       0       0       0
;;Total ram usage:        5 bytes
;; Hardware stack levels required when called:    5
;; This function calls:
;;		_initPin
;;		_setPinInitVaule
;;		_selectAdChannel
;;		_clock_config
;;		_timer1_config
;;		_timer1_interrupt_config
;;		_adc_test_init
;;		_adc_start
;;		_startTwentyMinTimer
;;		_process_AD_Converter_Value
;;		_isPermitSampleTime
;;		_clrSampeTime
;;		_isFinishedTwentyMinTimer
;;		_getAdOriginalCh13Value
;;		_calPulseWidth
;;		_pwm_start
;;		_setPB3
;;		_setPB4
;;		_setPB5
;;		_clearTwentyMinTimer
;;		_startTwelveHourTimer
;;		_isFinishedTwelveHoursTimer
;;		_clearTwelveHoursTimer
;;		_startThreeHoursTimer
;;		_isFinishedThreeHoursTimer
;;		_clearThreeHoursTimer
;;		_startOneHoursTimer
;;		_isFinishedOneHoursTimer
;;		_reset
;;		_pwm_config
;; This function is called by:
;;		Startup code after reset
;; This function uses a non-reentrant model
;;
psect	maintext
	file	"D:\develop\190625\AK7030-OTP\main.c"
	line	594
	global	__size_of_main
	__size_of_main	equ	__end_of_main-_main
	
_main:	
	opt	stack 3
; Regs used in _main: [wreg-fsr0h+status,2+status,0+btemp+1+pclath+cstack]
	line	605
	
l3699:	
;main.c: 605: initPin();
	fcall	_initPin
	line	606
;main.c: 606: setPinInitVaule();
	fcall	_setPinInitVaule
	line	607
	
l3701:	
;main.c: 607: selectAdChannel();
	fcall	_selectAdChannel
	line	609
	
l3703:	
;main.c: 609: clock_config();
	fcall	_clock_config
	line	610
	
l3705:	
;main.c: 610: timer1_config();
	fcall	_timer1_config
	line	611
	
l3707:	
;main.c: 611: timer1_interrupt_config();
	fcall	_timer1_interrupt_config
	line	613
;main.c: 613: adc_test_init(12,3);
	movlw	(03h)
	bcf	status, 5	;RP0=0, select bank0
	movwf	(?_adc_test_init)
	movlw	(0Ch)
	fcall	_adc_test_init
	line	620
	
l3709:	
;main.c: 620: adc_start();
	fcall	_adc_start
	line	627
	
l3711:	
;main.c: 627: startTwentyMinTimer( 60 );
	movlw	03Ch
	movwf	(?_startTwentyMinTimer)
	clrf	(?_startTwentyMinTimer+1)
	fcall	_startTwentyMinTimer
	line	632
	
l3713:	
# 632 "D:\develop\190625\AK7030-OTP\main.c"
 clrwdt ;#
psect	maintext
	line	634
	
l3715:	
;main.c: 634: process_AD_Converter_Value();
	fcall	_process_AD_Converter_Value
	line	636
	
l3717:	
;main.c: 636: if( isPermitSampleTime() )
	fcall	_isPermitSampleTime
	xorlw	0
	skipnz
	goto	u1341
	goto	u1340
u1341:
	goto	l3713
u1340:
	line	640
	
l3719:	
;main.c: 637: {
;main.c: 640: clrSampeTime();
	fcall	_clrSampeTime
	line	663
;main.c: 648: enum systemStep {
;main.c: 649: INIT_STEP = 0,
;main.c: 650: START_UP_PWM_STEP,
;main.c: 651: CHECK_10_HOUR_TIMER_STEP,
;main.c: 652: STARTUP_3_HOUR_TIMER_STEP,
;main.c: 653: CHECK_3_HOUR_TIMER_STEP,
;main.c: 654: STARTUP_1_HOUR_TIMER_STEP,
;main.c: 655: CHECK_1_HOUR_TIMER_STEP,
;main.c: 656: READY_FOR_RESET_STEP = 99,
;main.c: 657: MEET_RESET_CONDITION_STEP,
;main.c: 658: RESET_STEP,
;main.c: 659: };
;main.c: 661: static enum systemStep ucStep = INIT_STEP;
;main.c: 663: switch(ucStep)
	goto	l3875
	line	674
	
l3721:	
;main.c: 667: {
;main.c: 672: static unsigned char ucTimerP3s = 0;
;main.c: 674: if( isFinishedTwentyMinTimer() )
	fcall	_isFinishedTwentyMinTimer
	xorlw	0
	skipnz
	goto	u1351
	goto	u1350
u1351:
	goto	l3727
u1350:
	line	676
	
l3723:	
;main.c: 675: {
;main.c: 676: ucStep = READY_FOR_RESET_STEP;
	movlw	(063h)
	movwf	(main@ucStep)
	line	677
	
l3725:	
;main.c: 677: ucTimerP3s = 0;
	clrf	(main@ucTimerP3s)
	line	678
;main.c: 678: }
	goto	l3713
	line	681
	
l3727:	
;main.c: 679: else
;main.c: 680: {
;main.c: 681: if( getAdOriginalCh13Value() > 90 )
	fcall	_getAdOriginalCh13Value
	movlw	high(05Bh)
	subwf	(1+(?_getAdOriginalCh13Value)),w
	movlw	low(05Bh)
	skipnz
	subwf	(0+(?_getAdOriginalCh13Value)),w
	skipc
	goto	u1361
	goto	u1360
u1361:
	goto	l3731
u1360:
	line	683
	
l3729:	
;main.c: 682: {
;main.c: 683: ucTimerP3s++;
	incf	(main@ucTimerP3s),f
	line	684
;main.c: 684: }
	goto	l3733
	line	686
	
l3731:	
;main.c: 685: else
;main.c: 686: ucTimerP3s = 0;
	clrf	(main@ucTimerP3s)
	line	688
	
l3733:	
;main.c: 688: if( ucTimerP3s >= 3)
	movlw	(03h)
	subwf	(main@ucTimerP3s),w
	skipc
	goto	u1371
	goto	u1370
u1371:
	goto	l756
u1370:
	line	690
	
l3735:	
;main.c: 689: {
;main.c: 690: ucTimerP3s = 0;
	clrf	(main@ucTimerP3s)
	line	691
	
l3737:	
;main.c: 691: ucStep = START_UP_PWM_STEP;
	clrf	(main@ucStep)
	incf	(main@ucStep),f
	goto	l3713
	line	694
	
l756:	
	line	698
;main.c: 692: }
;main.c: 694: }
;main.c: 698: break;
	goto	l3713
	line	706
	
l3739:	
	line	708
	
l3741:	
;main.c: 708: ucPulseWidth = calPulseWidth();
	fcall	_calPulseWidth
	movwf	(main@ucPulseWidth)
	line	710
	
l3743:	
;main.c: 710: pwm_start( ucPulseWidth );
	movf	(main@ucPulseWidth),w
	fcall	_pwm_start
	line	712
	
l3745:	
;main.c: 712: setPB3(0);
	movlw	(0)
	fcall	_setPB3
	line	713
	
l3747:	
;main.c: 713: setPB4(1);
	movlw	(01h)
	fcall	_setPB4
	line	714
	
l3749:	
;main.c: 714: setPB5(0);
	movlw	(0)
	fcall	_setPB5
	line	715
	
l3751:	
;main.c: 715: clearTwentyMinTimer();
	fcall	_clearTwentyMinTimer
	line	716
	
l3753:	
;main.c: 716: startTwelveHourTimer( 240);
	movlw	0F0h
	movwf	(?_startTwelveHourTimer)
	clrf	(?_startTwelveHourTimer+1)
	fcall	_startTwelveHourTimer
	line	717
	
l3755:	
;main.c: 717: ucStep = CHECK_10_HOUR_TIMER_STEP;
	movlw	(02h)
	movwf	(main@ucStep)
	line	718
;main.c: 718: break;
	goto	l3713
	line	729
	
l3757:	
;main.c: 722: {
;main.c: 727: static unsigned char ucTimerP5s = 0;
;main.c: 729: if( isFinishedTwelveHoursTimer () )
	fcall	_isFinishedTwelveHoursTimer
	xorlw	0
	skipnz
	goto	u1381
	goto	u1380
u1381:
	goto	l3761
u1380:
	line	730
	
l3759:	
;main.c: 730: ucStep = READY_FOR_RESET_STEP;
	movlw	(063h)
	movwf	(main@ucStep)
	goto	l3713
	line	733
	
l3761:	
;main.c: 731: else
;main.c: 732: {
;main.c: 733: if( getAdOriginalCh13Value() < 200 )
	fcall	_getAdOriginalCh13Value
	movlw	high(0C8h)
	subwf	(1+(?_getAdOriginalCh13Value)),w
	movlw	low(0C8h)
	skipnz
	subwf	(0+(?_getAdOriginalCh13Value)),w
	skipnc
	goto	u1391
	goto	u1390
u1391:
	goto	l3765
u1390:
	line	734
	
l3763:	
;main.c: 734: ucTimerP5s++;
	incf	(main@ucTimerP5s),f
	goto	l3767
	line	736
	
l3765:	
;main.c: 735: else
;main.c: 736: ucTimerP5s = 0;
	clrf	(main@ucTimerP5s)
	line	738
	
l3767:	
;main.c: 738: if( ucTimerP5s > 5)
	movlw	(06h)
	subwf	(main@ucTimerP5s),w
	skipc
	goto	u1401
	goto	u1400
u1401:
	goto	l756
u1400:
	line	740
	
l3769:	
;main.c: 739: {
;main.c: 740: ucTimerP5s = 0;
	clrf	(main@ucTimerP5s)
	line	741
	
l3771:	
;main.c: 741: ucStep = STARTUP_3_HOUR_TIMER_STEP;
	movlw	(03h)
	movwf	(main@ucStep)
	goto	l3713
	line	750
	
l3773:	
;main.c: 749: {
;main.c: 750: clearTwelveHoursTimer();
	fcall	_clearTwelveHoursTimer
	line	751
	
l3775:	
;main.c: 751: startThreeHoursTimer(180);
	movlw	0B4h
	movwf	(?_startThreeHoursTimer)
	clrf	(?_startThreeHoursTimer+1)
	fcall	_startThreeHoursTimer
	line	752
;main.c: 752: ucStep = CHECK_3_HOUR_TIMER_STEP;
	movlw	(04h)
	movwf	(main@ucStep)
	line	753
;main.c: 753: break;
	goto	l3713
	line	760
	
l3777:	
;main.c: 757: {
;main.c: 758: static unsigned char ucTimerP5s = 0;
;main.c: 760: if( isFinishedThreeHoursTimer() )
	fcall	_isFinishedThreeHoursTimer
	xorlw	0
	skipnz
	goto	u1411
	goto	u1410
u1411:
	goto	l3781
u1410:
	goto	l3759
	line	764
	
l3781:	
;main.c: 762: else
;main.c: 763: {
;main.c: 764: if( getAdOriginalCh13Value() < 85 )
	fcall	_getAdOriginalCh13Value
	movlw	high(055h)
	subwf	(1+(?_getAdOriginalCh13Value)),w
	movlw	low(055h)
	skipnz
	subwf	(0+(?_getAdOriginalCh13Value)),w
	skipnc
	goto	u1421
	goto	u1420
u1421:
	goto	l3785
u1420:
	line	765
	
l3783:	
;main.c: 765: ucTimerP5s++;
	incf	(main@cTimerP5s_792),f
	goto	l3787
	line	767
	
l3785:	
;main.c: 766: else
;main.c: 767: ucTimerP5s = 0;
	clrf	(main@cTimerP5s_792)
	line	769
	
l3787:	
;main.c: 769: if( ucTimerP5s > 5)
	movlw	(06h)
	subwf	(main@cTimerP5s_792),w
	skipc
	goto	u1431
	goto	u1430
u1431:
	goto	l756
u1430:
	line	771
	
l3789:	
;main.c: 770: {
;main.c: 771: ucTimerP5s = 0;
	clrf	(main@cTimerP5s_792)
	line	772
	
l3791:	
;main.c: 772: ucStep = STARTUP_1_HOUR_TIMER_STEP;
	movlw	(05h)
	movwf	(main@ucStep)
	goto	l3713
	line	780
	
l3793:	
;main.c: 779: {
;main.c: 780: clearThreeHoursTimer();
	fcall	_clearThreeHoursTimer
	line	781
	
l3795:	
;main.c: 781: startOneHoursTimer( 120 );
	movlw	078h
	movwf	(?_startOneHoursTimer)
	clrf	(?_startOneHoursTimer+1)
	fcall	_startOneHoursTimer
	line	782
	
l3797:	
;main.c: 782: setPB3(1);
	movlw	(01h)
	fcall	_setPB3
	line	783
	
l3799:	
;main.c: 783: setPB4(0);
	movlw	(0)
	fcall	_setPB4
	line	784
	
l3801:	
;main.c: 784: setPB5(1);
	movlw	(01h)
	fcall	_setPB5
	line	785
	
l3803:	
;main.c: 785: ucStep = CHECK_1_HOUR_TIMER_STEP;
	movlw	(06h)
	movwf	(main@ucStep)
	line	786
;main.c: 786: break;
	goto	l3713
	line	799
	
l3805:	
;main.c: 790: {
;main.c: 795: static unsigned int uiTimerOneP5s = 0;
;main.c: 796: static unsigned int uiTimerTwoP5s = 0;
;main.c: 797: static unsigned int uiTimerThreeP5s = 0;
;main.c: 799: unsigned int uiCh13Value = getAdOriginalCh13Value();
	fcall	_getAdOriginalCh13Value
	movf	(1+(?_getAdOriginalCh13Value)),w
	movwf	(main@uiCh13Value+1)
	movf	(0+(?_getAdOriginalCh13Value)),w
	movwf	(main@uiCh13Value)
	line	802
	
l3807:	
;main.c: 802: if( isFinishedOneHoursTimer() )
	fcall	_isFinishedOneHoursTimer
	xorlw	0
	skipnz
	goto	u1441
	goto	u1440
u1441:
	goto	l3811
u1440:
	goto	l3759
	line	806
	
l3811:	
;main.c: 804: else
;main.c: 805: {
;main.c: 806: if( uiCh13Value > 100 )
	movlw	high(065h)
	subwf	(main@uiCh13Value+1),w
	movlw	low(065h)
	skipnz
	subwf	(main@uiCh13Value),w
	skipc
	goto	u1451
	goto	u1450
u1451:
	goto	l3821
u1450:
	line	808
	
l3813:	
;main.c: 807: {
;main.c: 808: if( uiTimerOneP5s <= 5 )
	movlw	high(06h)
	subwf	(main@uiTimerOneP5s+1),w
	movlw	low(06h)
	skipnz
	subwf	(main@uiTimerOneP5s),w
	skipnc
	goto	u1461
	goto	u1460
u1461:
	goto	l3817
u1460:
	line	809
	
l3815:	
;main.c: 809: uiTimerOneP5s++;
	incf	(main@uiTimerOneP5s),f
	skipnz
	incf	(main@uiTimerOneP5s+1),f
	line	810
	
l3817:	
;main.c: 810: uiTimerTwoP5s = 0;
	bsf	status, 5	;RP0=1, select bank1
	clrf	(main@uiTimerTwoP5s)^080h
	clrf	(main@uiTimerTwoP5s+1)^080h
	line	811
	
l3819:	
;main.c: 811: uiTimerThreeP5s = 0;
	clrf	(main@uiTimerThreeP5s)^080h
	clrf	(main@uiTimerThreeP5s+1)^080h
	line	812
;main.c: 812: }
	goto	l3823
	line	815
	
l3821:	
;main.c: 813: else
;main.c: 814: {
;main.c: 815: uiTimerOneP5s = 0;
	clrf	(main@uiTimerOneP5s)
	clrf	(main@uiTimerOneP5s+1)
	line	819
	
l3823:	
;main.c: 816: }
;main.c: 819: if(uiTimerOneP5s > 5)
	movlw	high(06h)
	bcf	status, 5	;RP0=0, select bank0
	subwf	(main@uiTimerOneP5s+1),w
	movlw	low(06h)
	skipnz
	subwf	(main@uiTimerOneP5s),w
	skipc
	goto	u1471
	goto	u1470
u1471:
	goto	l3831
u1470:
	line	821
	
l3825:	
;main.c: 820: {
;main.c: 821: setPB3(0);
	movlw	(0)
	fcall	_setPB3
	line	822
;main.c: 822: setPB4(1);
	movlw	(01h)
	fcall	_setPB4
	line	823
;main.c: 823: setPB5(0);
	movlw	(0)
	fcall	_setPB5
	line	825
	
l3827:	
;main.c: 825: uiTimerOneP5s = 0;
	clrf	(main@uiTimerOneP5s)
	clrf	(main@uiTimerOneP5s+1)
	line	826
	
l3829:	
;main.c: 826: uiTimerTwoP5s = 0;
	bsf	status, 5	;RP0=1, select bank1
	clrf	(main@uiTimerTwoP5s)^080h
	clrf	(main@uiTimerTwoP5s+1)^080h
	line	827
;main.c: 827: }
	goto	l3713
	line	830
	
l3831:	
;main.c: 828: else
;main.c: 829: {
;main.c: 830: if( uiCh13Value < 90 )
	movlw	high(05Ah)
	subwf	(main@uiCh13Value+1),w
	movlw	low(05Ah)
	skipnz
	subwf	(main@uiCh13Value),w
	skipnc
	goto	u1481
	goto	u1480
u1481:
	goto	l3837
u1480:
	line	832
	
l3833:	
;main.c: 831: {
;main.c: 832: if( uiTimerTwoP5s <= 5)
	movlw	high(06h)
	bsf	status, 5	;RP0=1, select bank1
	subwf	(main@uiTimerTwoP5s+1)^080h,w
	movlw	low(06h)
	skipnz
	subwf	(main@uiTimerTwoP5s)^080h,w
	skipnc
	goto	u1491
	goto	u1490
u1491:
	goto	l3839
u1490:
	line	833
	
l3835:	
;main.c: 833: uiTimerTwoP5s++;
	incf	(main@uiTimerTwoP5s)^080h,f
	skipnz
	incf	(main@uiTimerTwoP5s+1)^080h,f
	goto	l3839
	line	837
	
l3837:	
;main.c: 835: else
;main.c: 836: {
;main.c: 837: uiTimerTwoP5s = 0;
	bsf	status, 5	;RP0=1, select bank1
	clrf	(main@uiTimerTwoP5s)^080h
	clrf	(main@uiTimerTwoP5s+1)^080h
	line	838
;main.c: 838: uiTimerThreeP5s = 0;
	clrf	(main@uiTimerThreeP5s)^080h
	clrf	(main@uiTimerThreeP5s+1)^080h
	line	841
	
l3839:	
;main.c: 839: }
;main.c: 841: if(uiTimerTwoP5s > 5)
	movlw	high(06h)
	subwf	(main@uiTimerTwoP5s+1)^080h,w
	movlw	low(06h)
	skipnz
	subwf	(main@uiTimerTwoP5s)^080h,w
	skipc
	goto	u1501
	goto	u1500
u1501:
	goto	l3713
u1500:
	line	843
	
l3841:	
;main.c: 842: {
;main.c: 843: setPB3(1);
	movlw	(01h)
	fcall	_setPB3
	line	844
;main.c: 844: setPB4(0);
	movlw	(0)
	fcall	_setPB4
	line	845
;main.c: 845: setPB5(1);
	movlw	(01h)
	fcall	_setPB5
	line	847
	
l3843:	
;main.c: 847: if(uiCh13Value < 25)
	movlw	high(019h)
	subwf	(main@uiCh13Value+1),w
	movlw	low(019h)
	skipnz
	subwf	(main@uiCh13Value),w
	skipnc
	goto	u1511
	goto	u1510
u1511:
	goto	l3847
u1510:
	line	848
	
l3845:	
;main.c: 848: uiTimerThreeP5s++;
	bsf	status, 5	;RP0=1, select bank1
	incf	(main@uiTimerThreeP5s)^080h,f
	skipnz
	incf	(main@uiTimerThreeP5s+1)^080h,f
	goto	l3849
	line	850
	
l3847:	
;main.c: 849: else
;main.c: 850: uiTimerThreeP5s = 0;
	bsf	status, 5	;RP0=1, select bank1
	clrf	(main@uiTimerThreeP5s)^080h
	clrf	(main@uiTimerThreeP5s+1)^080h
	line	852
	
l3849:	
;main.c: 852: if(uiTimerThreeP5s > 5)
	movlw	high(06h)
	subwf	(main@uiTimerThreeP5s+1)^080h,w
	movlw	low(06h)
	skipnz
	subwf	(main@uiTimerThreeP5s)^080h,w
	skipc
	goto	u1521
	goto	u1520
u1521:
	goto	l756
u1520:
	line	853
	
l3851:	
;main.c: 853: reset();
	fcall	_reset
	goto	l3713
	line	863
	
l3853:	
;main.c: 862: {
;main.c: 863: setPB3(0);
	movlw	(0)
	fcall	_setPB3
	line	864
;main.c: 864: setPB4(0);
	movlw	(0)
	fcall	_setPB4
	line	865
;main.c: 865: setPB5(1);
	movlw	(01h)
	fcall	_setPB5
	line	866
;main.c: 866: pwm_config(0);
	movlw	(0)
	fcall	_pwm_config
	line	867
;main.c: 867: pwm_start(60);
	movlw	(03Ch)
	fcall	_pwm_start
	line	868
;main.c: 868: pwm_config(1);
	movlw	(01h)
	fcall	_pwm_config
	line	869
	
l3855:	
;main.c: 869: ucStep = MEET_RESET_CONDITION_STEP;
	movlw	(064h)
	movwf	(main@ucStep)
	line	870
;main.c: 870: break;
	goto	l3713
	line	876
	
l3857:	
;main.c: 874: {
;main.c: 875: static unsigned char ucTimerP5s = 0;
;main.c: 876: unsigned int ucChValue = getAdOriginalCh13Value();
	fcall	_getAdOriginalCh13Value
	movf	(1+(?_getAdOriginalCh13Value)),w
	movwf	(main@ucChValue+1)
	movf	(0+(?_getAdOriginalCh13Value)),w
	movwf	(main@ucChValue)
	line	878
	
l3859:	
;main.c: 878: if( ucChValue > 50 )
	movlw	high(033h)
	subwf	(main@ucChValue+1),w
	movlw	low(033h)
	skipnz
	subwf	(main@ucChValue),w
	skipc
	goto	u1531
	goto	u1530
u1531:
	goto	l3863
u1530:
	line	879
	
l3861:	
;main.c: 879: ucTimerP5s++;
	incf	(main@cTimerP5s_797),f
	goto	l3865
	line	881
	
l3863:	
;main.c: 880: else
;main.c: 881: ucTimerP5s = 0;
	clrf	(main@cTimerP5s_797)
	line	883
	
l3865:	
;main.c: 883: if(ucTimerP5s > 5)
	movlw	(06h)
	subwf	(main@cTimerP5s_797),w
	skipc
	goto	u1541
	goto	u1540
u1541:
	goto	l756
u1540:
	line	884
	
l3867:	
;main.c: 884: ucStep = RESET_STEP;
	movlw	(065h)
	movwf	(main@ucStep)
	goto	l3713
	line	890
	
l3869:	
;main.c: 889: {
;main.c: 890: ucStep = INIT_STEP;
	clrf	(main@ucStep)
	goto	l3851
	line	663
	
l3875:	
	movf	(main@ucStep),w
	; Switch size 1, requested type "space"
; Number of cases is 10, Range of values is 0 to 101
; switch strategies available:
; Name         Instructions Cycles
; simple_byte           31    16 (average)
; direct_byte          211     7 (fixed)
; jumptable            260     6 (fixed)
; rangetable           106     6 (fixed)
; spacedrange          210     9 (fixed)
; locatedrange         102     3 (fixed)
;	Chosen strategy is simple_byte

	opt asmopt_off
	xorlw	0^0	; case 0
	skipnz
	goto	l3721
	xorlw	1^0	; case 1
	skipnz
	goto	l3739
	xorlw	2^1	; case 2
	skipnz
	goto	l3757
	xorlw	3^2	; case 3
	skipnz
	goto	l3773
	xorlw	4^3	; case 4
	skipnz
	goto	l3777
	xorlw	5^4	; case 5
	skipnz
	goto	l3793
	xorlw	6^5	; case 6
	skipnz
	goto	l3805
	xorlw	99^6	; case 99
	skipnz
	goto	l3853
	xorlw	100^99	; case 100
	skipnz
	goto	l3857
	xorlw	101^100	; case 101
	skipnz
	goto	l3869
	goto	l756
	opt asmopt_on

	global	start
	ljmp	start
	opt stack 0
psect	maintext
	line	903
GLOBAL	__end_of_main
	__end_of_main:
;; =============== function _main ends ============

	signat	_main,90
	global	_calPulseWidth
psect	text834,local,class=CODE,delta=2
global __ptext834
__ptext834:

;; *************** function _calPulseWidth *****************
;; Defined at:
;;		line 526 in file "D:\develop\190625\AK7030-OTP\main.c"
;; Parameters:    Size  Location     Type
;;		None
;; Auto vars:     Size  Location     Type
;;  uiGapValue      2   41[BANK0 ] unsigned int 
;;  ucGapValue      1   46[BANK0 ] unsigned char 
;;  ucHalfValue     1   44[BANK0 ] unsigned char 
;;  ucThreeTimes    1   43[BANK0 ] unsigned char 
;;  uiChannel2Va    2   47[BANK0 ] unsigned int 
;;  ucPulseWidth    1   45[BANK0 ] unsigned char 
;; Return value:  Size  Location     Type
;;                  1    wreg      unsigned char 
;; Registers used:
;;		wreg, fsr0l, fsr0h, status,2, status,0, btemp+1, pclath, cstack
;; Tracked objects:
;;		On entry : 60/0
;;		On exit  : 160/0
;;		Unchanged: FFE00/0
;; Data sizes:     COMMON   BANK0   BANK1   BANK3   BANK2
;;      Params:         0       0       0       0       0
;;      Locals:         0       8       0       0       0
;;      Temps:          0       0       0       0       0
;;      Totals:         0       8       0       0       0
;;Total ram usage:        8 bytes
;; Hardware stack levels used:    1
;; Hardware stack levels required when called:    4
;; This function calls:
;;		_getAdOriginalCh12Value
;; This function is called by:
;;		_main
;; This function uses a non-reentrant model
;;
psect	text834
	file	"D:\develop\190625\AK7030-OTP\main.c"
	line	526
	global	__size_of_calPulseWidth
	__size_of_calPulseWidth	equ	__end_of_calPulseWidth-_calPulseWidth
	
_calPulseWidth:	
	opt	stack 3
; Regs used in _calPulseWidth: [wreg-fsr0h+status,2+status,0+btemp+1+pclath+cstack]
	line	527
	
l3669:	
	line	531
	
l3671:	
;main.c: 531: unsigned int uiChannel2Value = getAdOriginalCh12Value();
	fcall	_getAdOriginalCh12Value
	movf	(1+(?_getAdOriginalCh12Value)),w
	movwf	(calPulseWidth@uiChannel2Value+1)
	movf	(0+(?_getAdOriginalCh12Value)),w
	movwf	(calPulseWidth@uiChannel2Value)
	line	533
	
l3673:	
;main.c: 533: if( uiChannel2Value >= 332 )
	movlw	high(014Ch)
	subwf	(calPulseWidth@uiChannel2Value+1),w
	movlw	low(014Ch)
	skipnz
	subwf	(calPulseWidth@uiChannel2Value),w
	skipc
	goto	u1321
	goto	u1320
u1321:
	goto	l3677
u1320:
	line	534
	
l3675:	
;main.c: 534: ucPulseWidth = 100;
	movlw	(064h)
	movwf	(calPulseWidth@ucPulseWidth)
	goto	l3695
	line	535
	
l3677:	
;main.c: 535: else if( uiChannel2Value <= 312)
	movlw	high(0139h)
	subwf	(calPulseWidth@uiChannel2Value+1),w
	movlw	low(0139h)
	skipnz
	subwf	(calPulseWidth@uiChannel2Value),w
	skipnc
	goto	u1331
	goto	u1330
u1331:
	goto	l3681
u1330:
	line	536
	
l3679:	
;main.c: 536: ucPulseWidth = 30;
	movlw	(01Eh)
	movwf	(calPulseWidth@ucPulseWidth)
	goto	l3695
	line	539
	
l3681:	
	line	541
;main.c: 541: unsigned char ucGapValue = 0;
	clrf	(calPulseWidth@ucGapValue)
	line	543
;main.c: 543: unsigned char ucThreeTimesValue = 0;
	clrf	(calPulseWidth@ucThreeTimesValue)
	line	544
;main.c: 544: unsigned char ucHalfValue = 0;
	clrf	(calPulseWidth@ucHalfValue)
	line	546
	
l3683:	
;main.c: 546: uiGapValue = uiChannel2Value - 312;
	movf	(calPulseWidth@uiChannel2Value+1),w
	movwf	(calPulseWidth@uiGapValue+1)
	movf	(calPulseWidth@uiChannel2Value),w
	movwf	(calPulseWidth@uiGapValue)
	
l3685:	
	movlw	low(0FEC8h)
	addwf	(calPulseWidth@uiGapValue),f
	skipnc
	incf	(calPulseWidth@uiGapValue+1),f
	movlw	high(0FEC8h)
	addwf	(calPulseWidth@uiGapValue+1),f
	line	548
	
l3687:	
;main.c: 548: ucGapValue = uiGapValue;
	movf	(calPulseWidth@uiGapValue),w
	movwf	(calPulseWidth@ucGapValue)
	line	550
	
l3689:	
;main.c: 550: ucThreeTimesValue = ucGapValue*3;
	movf	(calPulseWidth@ucGapValue),w
	addwf	(calPulseWidth@ucGapValue),w
	addwf	(calPulseWidth@ucGapValue),w
	movwf	(calPulseWidth@ucThreeTimesValue)
	line	552
	
l3691:	
;main.c: 552: ucHalfValue = ucGapValue >> 1;
	clrc
	rrf	(calPulseWidth@ucGapValue),w
	movwf	(calPulseWidth@ucHalfValue)
	line	554
	
l3693:	
;main.c: 554: ucPulseWidth = 30 + ucThreeTimesValue + ucHalfValue;
	movf	(calPulseWidth@ucHalfValue),w
	addwf	(calPulseWidth@ucThreeTimesValue),w
	addlw	01Eh
	movwf	(calPulseWidth@ucPulseWidth)
	line	560
	
l3695:	
;main.c: 556: }
;main.c: 560: return ucPulseWidth;
	movf	(calPulseWidth@ucPulseWidth),w
	line	561
	
l744:	
	return
	opt stack 0
GLOBAL	__end_of_calPulseWidth
	__end_of_calPulseWidth:
;; =============== function _calPulseWidth ends ============

	signat	_calPulseWidth,89
	global	_getAdOriginalCh13Value
psect	text835,local,class=CODE,delta=2
global __ptext835
__ptext835:

;; *************** function _getAdOriginalCh13Value *****************
;; Defined at:
;;		line 238 in file "D:\develop\190625\AK7030-OTP\common.c"
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
psect	text835
	file	"D:\develop\190625\AK7030-OTP\common.c"
	line	238
	global	__size_of_getAdOriginalCh13Value
	__size_of_getAdOriginalCh13Value	equ	__end_of_getAdOriginalCh13Value-_getAdOriginalCh13Value
	
_getAdOriginalCh13Value:	
	opt	stack 4
; Regs used in _getAdOriginalCh13Value: [wreg-fsr0h+status,2+status,0+btemp+1+pclath+cstack]
	line	240
	
l3665:	
;common.c: 240: return Filter(uiSampleChannelFourth);
	movlw	(_uiSampleChannelFourth)&0ffh
	fcall	_Filter
	movf	(1+(?_Filter)),w
	movwf	(?_getAdOriginalCh13Value+1)
	movf	(0+(?_Filter)),w
	movwf	(?_getAdOriginalCh13Value)
	line	245
	
l1544:	
	return
	opt stack 0
GLOBAL	__end_of_getAdOriginalCh13Value
	__end_of_getAdOriginalCh13Value:
;; =============== function _getAdOriginalCh13Value ends ============

	signat	_getAdOriginalCh13Value,90
	global	_process_AD_Converter_Value
psect	text836,local,class=CODE,delta=2
global __ptext836
__ptext836:

;; *************** function _process_AD_Converter_Value *****************
;; Defined at:
;;		line 260 in file "D:\develop\190625\AK7030-OTP\common.c"
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
psect	text836
	file	"D:\develop\190625\AK7030-OTP\common.c"
	line	260
	global	__size_of_process_AD_Converter_Value
	__size_of_process_AD_Converter_Value	equ	__end_of_process_AD_Converter_Value-_process_AD_Converter_Value
	
_process_AD_Converter_Value:	
	opt	stack 4
; Regs used in _process_AD_Converter_Value: [wreg+status,2+status,0+pclath+cstack]
	line	261
	
l3653:	
;common.c: 261: if(getAD_ConvertFlag())
	fcall	_getAD_ConvertFlag
	xorlw	0
	skipnz
	goto	u1301
	goto	u1300
u1301:
	goto	l1553
u1300:
	line	263
	
l3655:	
;common.c: 262: {
;common.c: 263: setAD_ConvertFlag(0);
	movlw	(0)
	fcall	_setAD_ConvertFlag
	line	264
;common.c: 264: AD_Sample();
	fcall	_AD_Sample
	line	265
	
l3657:	
;common.c: 265: if(12 == sampleChannelSelect)
	movf	(_sampleChannelSelect),w
	xorlw	0Ch
	skipz
	goto	u1311
	goto	u1310
u1311:
	goto	l3661
u1310:
	line	266
	
l3659:	
;common.c: 266: adc_test_init(12,3);
	movlw	(03h)
	movwf	(?_adc_test_init)
	movlw	(0Ch)
	fcall	_adc_test_init
	goto	l3663
	line	270
	
l3661:	
;common.c: 269: else
;common.c: 270: adc_test_init(13,3);
	movlw	(03h)
	movwf	(?_adc_test_init)
	movlw	(0Dh)
	fcall	_adc_test_init
	line	272
	
l3663:	
;common.c: 272: adc_start();
	fcall	_adc_start
	line	274
	
l1553:	
	return
	opt stack 0
GLOBAL	__end_of_process_AD_Converter_Value
	__end_of_process_AD_Converter_Value:
;; =============== function _process_AD_Converter_Value ends ============

	signat	_process_AD_Converter_Value,88
	global	_getAdOriginalCh12Value
psect	text837,local,class=CODE,delta=2
global __ptext837
__ptext837:

;; *************** function _getAdOriginalCh12Value *****************
;; Defined at:
;;		line 226 in file "D:\develop\190625\AK7030-OTP\common.c"
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
;;		_calPulseWidth
;; This function uses a non-reentrant model
;;
psect	text837
	file	"D:\develop\190625\AK7030-OTP\common.c"
	line	226
	global	__size_of_getAdOriginalCh12Value
	__size_of_getAdOriginalCh12Value	equ	__end_of_getAdOriginalCh12Value-_getAdOriginalCh12Value
	
_getAdOriginalCh12Value:	
	opt	stack 3
; Regs used in _getAdOriginalCh12Value: [wreg-fsr0h+status,2+status,0+btemp+1+pclath+cstack]
	line	229
	
l3649:	
;common.c: 229: return Filter(uiSampleChannelFirst);
	movlw	(_uiSampleChannelFirst)&0ffh
	fcall	_Filter
	movf	(1+(?_Filter)),w
	movwf	(?_getAdOriginalCh12Value+1)
	movf	(0+(?_Filter)),w
	movwf	(?_getAdOriginalCh12Value)
	line	234
	
l1541:	
	return
	opt stack 0
GLOBAL	__end_of_getAdOriginalCh12Value
	__end_of_getAdOriginalCh12Value:
;; =============== function _getAdOriginalCh12Value ends ============

	signat	_getAdOriginalCh12Value,90
	global	_setPinInitVaule
psect	text838,local,class=CODE,delta=2
global __ptext838
__ptext838:

;; *************** function _setPinInitVaule *****************
;; Defined at:
;;		line 333 in file "D:\develop\190625\AK7030-OTP\main.c"
;; Parameters:    Size  Location     Type
;;		None
;; Auto vars:     Size  Location     Type
;;		None
;; Return value:  Size  Location     Type
;;		None               void
;; Registers used:
;;		wreg, status,2, status,0, pclath, cstack
;; Tracked objects:
;;		On entry : 17F/20
;;		On exit  : 17F/0
;;		Unchanged: FFE80/0
;; Data sizes:     COMMON   BANK0   BANK1   BANK3   BANK2
;;      Params:         0       0       0       0       0
;;      Locals:         0       0       0       0       0
;;      Temps:          0       0       0       0       0
;;      Totals:         0       0       0       0       0
;;Total ram usage:        0 bytes
;; Hardware stack levels used:    1
;; Hardware stack levels required when called:    3
;; This function calls:
;;		_setPB3
;;		_setPB4
;;		_setPB5
;; This function is called by:
;;		_main
;; This function uses a non-reentrant model
;;
psect	text838
	file	"D:\develop\190625\AK7030-OTP\main.c"
	line	333
	global	__size_of_setPinInitVaule
	__size_of_setPinInitVaule	equ	__end_of_setPinInitVaule-_setPinInitVaule
	
_setPinInitVaule:	
	opt	stack 4
; Regs used in _setPinInitVaule: [wreg+status,2+status,0+pclath+cstack]
	line	335
	
l3647:	
;main.c: 335: setPB3(1);
	movlw	(01h)
	fcall	_setPB3
	line	336
;main.c: 336: setPB4(0);
	movlw	(0)
	fcall	_setPB4
	line	337
;main.c: 337: setPB5(1);
	movlw	(01h)
	fcall	_setPB5
	line	341
	
l728:	
	return
	opt stack 0
GLOBAL	__end_of_setPinInitVaule
	__end_of_setPinInitVaule:
;; =============== function _setPinInitVaule ends ============

	signat	_setPinInitVaule,88
	global	_initPin
psect	text839,local,class=CODE,delta=2
global __ptext839
__ptext839:

;; *************** function _initPin *****************
;; Defined at:
;;		line 317 in file "D:\develop\190625\AK7030-OTP\main.c"
;; Parameters:    Size  Location     Type
;;		None
;; Auto vars:     Size  Location     Type
;;		None
;; Return value:  Size  Location     Type
;;		None               void
;; Registers used:
;;		wreg, status,2, status,0, pclath, cstack
;; Tracked objects:
;;		On entry : 17F/0
;;		On exit  : 17F/20
;;		Unchanged: FFE80/0
;; Data sizes:     COMMON   BANK0   BANK1   BANK3   BANK2
;;      Params:         0       0       0       0       0
;;      Locals:         0       0       0       0       0
;;      Temps:          0       0       0       0       0
;;      Totals:         0       0       0       0       0
;;Total ram usage:        0 bytes
;; Hardware stack levels used:    1
;; Hardware stack levels required when called:    3
;; This function calls:
;;		_initPB2_AsHighResistence
;;		_initPB3
;;		_initPB4
;;		_initPB5
;; This function is called by:
;;		_main
;; This function uses a non-reentrant model
;;
psect	text839
	file	"D:\develop\190625\AK7030-OTP\main.c"
	line	317
	global	__size_of_initPin
	__size_of_initPin	equ	__end_of_initPin-_initPin
	
_initPin:	
	opt	stack 4
; Regs used in _initPin: [wreg+status,2+status,0+pclath+cstack]
	line	319
	
l3639:	
;main.c: 319: initPB2_AsHighResistence();
	fcall	_initPB2_AsHighResistence
	line	321
	
l3641:	
;main.c: 321: initPB3(0);
	movlw	(0)
	fcall	_initPB3
	line	323
	
l3643:	
;main.c: 323: initPB4(0);
	movlw	(0)
	fcall	_initPB4
	line	325
	
l3645:	
;main.c: 325: initPB5(0);
	movlw	(0)
	fcall	_initPB5
	line	330
	
l725:	
	return
	opt stack 0
GLOBAL	__end_of_initPin
	__end_of_initPin:
;; =============== function _initPin ends ============

	signat	_initPin,88
	global	_AD_Sample
psect	text840,local,class=CODE,delta=2
global __ptext840
__ptext840:

;; *************** function _AD_Sample *****************
;; Defined at:
;;		line 286 in file "D:\develop\190625\AK7030-OTP\common.c"
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
psect	text840
	file	"D:\develop\190625\AK7030-OTP\common.c"
	line	286
	global	__size_of_AD_Sample
	__size_of_AD_Sample	equ	__end_of_AD_Sample-_AD_Sample
	
_AD_Sample:	
	opt	stack 4
; Regs used in _AD_Sample: [wreg+status,2+status,0]
	line	287
	
l3585:	
;common.c: 287: if(sampleTimes < 12)
	movlw	(0Ch)
	subwf	(_sampleTimes),w
	skipnc
	goto	u1181
	goto	u1180
u1181:
	goto	l1560
u1180:
	line	309
	
l3587:	
;common.c: 288: {
;common.c: 309: sampleTimes++;
	incf	(_sampleTimes),f
	line	311
	
l3589:	
;common.c: 311: if(sampleTimes >= 12)
	movlw	(0Ch)
	subwf	(_sampleTimes),w
	skipc
	goto	u1191
	goto	u1190
u1191:
	goto	l1560
u1190:
	line	313
	
l3591:	
;common.c: 312: {
;common.c: 313: sampleTimes = 0;
	clrf	(_sampleTimes)
	line	315
	
l3593:	
;common.c: 315: if(sampleChannelSelect == 12)
	movf	(_sampleChannelSelect),w
	xorlw	0Ch
	skipz
	goto	u1201
	goto	u1200
u1201:
	goto	l3597
u1200:
	line	319
	
l3595:	
;common.c: 316: {
;common.c: 319: sampleChannelSelect = 13;
	movlw	(0Dh)
	movwf	(_sampleChannelSelect)
	line	320
;common.c: 320: }
	goto	l1560
	line	334
	
l3597:	
;common.c: 331: else
;common.c: 332: {
;common.c: 334: sampleChannelSelect = 12;
	movlw	(0Ch)
	movwf	(_sampleChannelSelect)
	line	342
	
l1560:	
	return
	opt stack 0
GLOBAL	__end_of_AD_Sample
	__end_of_AD_Sample:
;; =============== function _AD_Sample ends ============

	signat	_AD_Sample,88
	global	_setAD_ConvertFlag
psect	text841,local,class=CODE,delta=2
global __ptext841
__ptext841:

;; *************** function _setAD_ConvertFlag *****************
;; Defined at:
;;		line 215 in file "D:\develop\190625\AK7030-OTP\common.c"
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
psect	text841
	file	"D:\develop\190625\AK7030-OTP\common.c"
	line	215
	global	__size_of_setAD_ConvertFlag
	__size_of_setAD_ConvertFlag	equ	__end_of_setAD_ConvertFlag-_setAD_ConvertFlag
	
_setAD_ConvertFlag:	
	opt	stack 4
; Regs used in _setAD_ConvertFlag: [wreg]
;setAD_ConvertFlag@flag stored from wreg
	movwf	(setAD_ConvertFlag@flag)
	line	216
	
l3583:	
;common.c: 216: adc_convert_flag = flag;
	movf	(setAD_ConvertFlag@flag),w
	movwf	(_adc_convert_flag)
	line	217
	
l1538:	
	return
	opt stack 0
GLOBAL	__end_of_setAD_ConvertFlag
	__end_of_setAD_ConvertFlag:
;; =============== function _setAD_ConvertFlag ends ============

	signat	_setAD_ConvertFlag,4216
	global	_getAD_ConvertFlag
psect	text842,local,class=CODE,delta=2
global __ptext842
__ptext842:

;; *************** function _getAD_ConvertFlag *****************
;; Defined at:
;;		line 209 in file "D:\develop\190625\AK7030-OTP\common.c"
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
psect	text842
	file	"D:\develop\190625\AK7030-OTP\common.c"
	line	209
	global	__size_of_getAD_ConvertFlag
	__size_of_getAD_ConvertFlag	equ	__end_of_getAD_ConvertFlag-_getAD_ConvertFlag
	
_getAD_ConvertFlag:	
	opt	stack 4
; Regs used in _getAD_ConvertFlag: [wreg]
	line	210
	
l3579:	
;common.c: 210: return adc_convert_flag;
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	movf	(_adc_convert_flag),w
	line	211
	
l1535:	
	return
	opt stack 0
GLOBAL	__end_of_getAD_ConvertFlag
	__end_of_getAD_ConvertFlag:
;; =============== function _getAD_ConvertFlag ends ============

	signat	_getAD_ConvertFlag,89
	global	_Filter
psect	text843,local,class=CODE,delta=2
global __ptext843
__ptext843:

;; *************** function _Filter *****************
;; Defined at:
;;		line 60 in file "D:\develop\190625\AK7030-OTP\common.c"
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
;;		_getAdOriginalCh12Value
;;		_getAdOriginalCh13Value
;; This function uses a non-reentrant model
;;
psect	text843
	file	"D:\develop\190625\AK7030-OTP\common.c"
	line	60
	global	__size_of_Filter
	__size_of_Filter	equ	__end_of_Filter-_Filter
	
_Filter:	
	opt	stack 3
; Regs used in _Filter: [wreg-fsr0h+status,2+status,0+btemp+1]
;Filter@tmpValue stored from wreg
	line	62
	movwf	(Filter@tmpValue)
	
l3481:	
	clrf	(Filter@j)
	line	64
;common.c: 64: unsigned int filter_temp = 0, filter_sum = 0;
	clrf	(Filter@filter_temp)
	clrf	(Filter@filter_temp+1)
	clrf	(Filter@filter_sum)
	clrf	(Filter@filter_sum+1)
	line	68
;common.c: 66: unsigned int filter_buf[12];
;common.c: 68: for(int cir = 0;cir < 12; cir++)
	clrf	(Filter@cir)
	clrf	(Filter@cir+1)
	line	69
	
l3487:	
;common.c: 69: filter_buf[cir] = *tmpValue++;
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
	
l3489:	
	incf	(Filter@tmpValue),f
	incf	(Filter@tmpValue),f
	line	68
	
l3491:	
	incf	(Filter@cir),f
	skipnz
	incf	(Filter@cir+1),f
	
l3493:	
	movf	(Filter@cir+1),w
	xorlw	80h
	movwf	btemp+1
	movlw	(high(0Ch))^80h
	subwf	btemp+1,w
	skipz
	goto	u1065
	movlw	low(0Ch)
	subwf	(Filter@cir),w
u1065:

	skipc
	goto	u1061
	goto	u1060
u1061:
	goto	l3487
u1060:
	line	72
	
l3495:	
;common.c: 72: for(j = 0; j < 12 - 1; j++)
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	clrf	(Filter@j)
	line	74
	
l3501:	
;common.c: 73: {
;common.c: 74: for(i = 0; i < 12 - 1 - j; i++)
	clrf	(Filter@i)
	goto	l3509
	line	76
	
l3503:	
;common.c: 75: {
;common.c: 76: if(filter_buf[i] > filter_buf[i + 1])
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
	goto	u1075
	movf	0+(??_Filter+0)+0,w
	subwf	0+(??_Filter+2)+0,w
u1075:
	skipnc
	goto	u1071
	goto	u1070
u1071:
	goto	l3507
u1070:
	line	79
	
l3505:	
;common.c: 77: {
;common.c: 79: filter_temp = filter_buf[i];
	clrc
	rlf	(Filter@i),w
	addlw	Filter@filter_buf&0ffh
	movwf	fsr0
	movf	indf,w
	movwf	(Filter@filter_temp)
	incf	fsr0,f
	movf	indf,w
	movwf	(Filter@filter_temp+1)
	line	81
;common.c: 81: filter_buf[i] = filter_buf[i + 1];
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
	line	83
;common.c: 83: filter_buf[i + 1] = filter_temp;
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
	line	74
	
l3507:	
	incf	(Filter@i),f
	
l3509:	
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
	goto	u1085
	movf	0+(??_Filter+0)+0,w
	subwf	(Filter@i),w
u1085:

	skipc
	goto	u1081
	goto	u1080
u1081:
	goto	l3503
u1080:
	line	72
	
l3511:	
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	incf	(Filter@j),f
	
l3513:	
	movlw	(0Bh)
	subwf	(Filter@j),w
	skipc
	goto	u1091
	goto	u1090
u1091:
	goto	l3501
u1090:
	line	88
	
l3515:	
;common.c: 84: }
;common.c: 85: }
;common.c: 86: }
;common.c: 88: for(i = 2; i < 12 - 2; i++)
	movlw	(02h)
	movwf	(Filter@i)
	line	90
	
l3519:	
;common.c: 89: {
;common.c: 90: filter_sum += filter_buf[i];
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
	line	88
	
l3521:	
	incf	(Filter@i),f
	
l3523:	
	movlw	(0Ah)
	subwf	(Filter@i),w
	skipc
	goto	u1101
	goto	u1100
u1101:
	goto	l3519
u1100:
	line	93
	
l3525:	
;common.c: 91: }
;common.c: 93: return (filter_sum >> 3);
	movf	(Filter@filter_sum+1),w
	movwf	(?_Filter+1)
	movf	(Filter@filter_sum),w
	movwf	(?_Filter)
	
l3527:	
	clrc
	rrf	(?_Filter+1),f
	rrf	(?_Filter),f
	clrc
	rrf	(?_Filter+1),f
	rrf	(?_Filter),f
	clrc
	rrf	(?_Filter+1),f
	rrf	(?_Filter),f
	line	95
	
l1497:	
	return
	opt stack 0
GLOBAL	__end_of_Filter
	__end_of_Filter:
;; =============== function _Filter ends ============

	signat	_Filter,4218
	global	_isFinishedOneHoursTimer
psect	text844,local,class=CODE,delta=2
global __ptext844
__ptext844:

;; *************** function _isFinishedOneHoursTimer *****************
;; Defined at:
;;		line 507 in file "D:\develop\190625\AK7030-OTP\common.c"
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
psect	text844
	file	"D:\develop\190625\AK7030-OTP\common.c"
	line	507
	global	__size_of_isFinishedOneHoursTimer
	__size_of_isFinishedOneHoursTimer	equ	__end_of_isFinishedOneHoursTimer-_isFinishedOneHoursTimer
	
_isFinishedOneHoursTimer:	
	opt	stack 5
; Regs used in _isFinishedOneHoursTimer: [wreg+status,2+status,0]
	line	508
	
l3465:	
;common.c: 508: if((uiOneHourTimer == 0) && bOneHourTimerStartFlag)
	movf	((_uiOneHourTimer+1)),w
	iorwf	((_uiOneHourTimer)),w
	skipz
	goto	u1041
	goto	u1040
u1041:
	goto	l3477
u1040:
	
l3467:	
	movf	(_bOneHourTimerStartFlag),w
	skipz
	goto	u1050
	goto	l3477
u1050:
	line	510
	
l3469:	
;common.c: 509: {
;common.c: 510: bOneHourTimerStartFlag = 0;
	clrf	(_bOneHourTimerStartFlag)
	line	511
	
l3471:	
;common.c: 511: return 1;
	movlw	(01h)
	goto	l1622
	line	514
	
l3477:	
;common.c: 513: else
;common.c: 514: return 0;
	movlw	(0)
	line	515
	
l1622:	
	return
	opt stack 0
GLOBAL	__end_of_isFinishedOneHoursTimer
	__end_of_isFinishedOneHoursTimer:
;; =============== function _isFinishedOneHoursTimer ends ============

	signat	_isFinishedOneHoursTimer,89
	global	_startOneHoursTimer
psect	text845,local,class=CODE,delta=2
global __ptext845
__ptext845:

;; *************** function _startOneHoursTimer *****************
;; Defined at:
;;		line 424 in file "D:\develop\190625\AK7030-OTP\common.c"
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
psect	text845
	file	"D:\develop\190625\AK7030-OTP\common.c"
	line	424
	global	__size_of_startOneHoursTimer
	__size_of_startOneHoursTimer	equ	__end_of_startOneHoursTimer-_startOneHoursTimer
	
_startOneHoursTimer:	
	opt	stack 5
; Regs used in _startOneHoursTimer: [wreg+status,2+status,0]
	line	425
	
l3457:	
;common.c: 425: if(( 0 == uiOneHourTimer ) && ( 0 == bOneHourTimerStartFlag ))
	movf	((_uiOneHourTimer+1)),w
	iorwf	((_uiOneHourTimer)),w
	skipz
	goto	u1021
	goto	u1020
u1021:
	goto	l1590
u1020:
	
l3459:	
	movf	(_bOneHourTimerStartFlag),f
	skipz
	goto	u1031
	goto	u1030
u1031:
	goto	l1590
u1030:
	line	427
	
l3461:	
;common.c: 426: {
;common.c: 427: uiOneHourTimer = uiSetTime;
	movf	(startOneHoursTimer@uiSetTime+1),w
	movwf	(_uiOneHourTimer+1)
	movf	(startOneHoursTimer@uiSetTime),w
	movwf	(_uiOneHourTimer)
	line	428
	
l3463:	
;common.c: 428: bOneHourTimerStartFlag = 1;
	clrf	(_bOneHourTimerStartFlag)
	incf	(_bOneHourTimerStartFlag),f
	line	434
	
l1590:	
	return
	opt stack 0
GLOBAL	__end_of_startOneHoursTimer
	__end_of_startOneHoursTimer:
;; =============== function _startOneHoursTimer ends ============

	signat	_startOneHoursTimer,4216
	global	_isFinishedThreeHoursTimer
psect	text846,local,class=CODE,delta=2
global __ptext846
__ptext846:

;; *************** function _isFinishedThreeHoursTimer *****************
;; Defined at:
;;		line 494 in file "D:\develop\190625\AK7030-OTP\common.c"
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
psect	text846
	file	"D:\develop\190625\AK7030-OTP\common.c"
	line	494
	global	__size_of_isFinishedThreeHoursTimer
	__size_of_isFinishedThreeHoursTimer	equ	__end_of_isFinishedThreeHoursTimer-_isFinishedThreeHoursTimer
	
_isFinishedThreeHoursTimer:	
	opt	stack 5
; Regs used in _isFinishedThreeHoursTimer: [wreg+status,2+status,0]
	line	495
	
l3441:	
;common.c: 495: if((uiSmallTimer == 0) && bSmallTimerStartFlag)
	movf	((_uiSmallTimer+1)),w
	iorwf	((_uiSmallTimer)),w
	skipz
	goto	u1001
	goto	u1000
u1001:
	goto	l3453
u1000:
	
l3443:	
	movf	(_bSmallTimerStartFlag),w
	skipz
	goto	u1010
	goto	l3453
u1010:
	line	497
	
l3445:	
;common.c: 496: {
;common.c: 497: bSmallTimerStartFlag = 0;
	clrf	(_bSmallTimerStartFlag)
	line	498
	
l3447:	
;common.c: 498: return 1;
	movlw	(01h)
	goto	l1617
	line	501
	
l3453:	
;common.c: 500: else
;common.c: 501: return 0;
	movlw	(0)
	line	502
	
l1617:	
	return
	opt stack 0
GLOBAL	__end_of_isFinishedThreeHoursTimer
	__end_of_isFinishedThreeHoursTimer:
;; =============== function _isFinishedThreeHoursTimer ends ============

	signat	_isFinishedThreeHoursTimer,89
	global	_startThreeHoursTimer
psect	text847,local,class=CODE,delta=2
global __ptext847
__ptext847:

;; *************** function _startThreeHoursTimer *****************
;; Defined at:
;;		line 411 in file "D:\develop\190625\AK7030-OTP\common.c"
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
psect	text847
	file	"D:\develop\190625\AK7030-OTP\common.c"
	line	411
	global	__size_of_startThreeHoursTimer
	__size_of_startThreeHoursTimer	equ	__end_of_startThreeHoursTimer-_startThreeHoursTimer
	
_startThreeHoursTimer:	
	opt	stack 5
; Regs used in _startThreeHoursTimer: [wreg+status,2+status,0]
	line	412
	
l3433:	
;common.c: 412: if(( 0 == uiSmallTimer ) && ( 0 == bSmallTimerStartFlag ))
	movf	((_uiSmallTimer+1)),w
	iorwf	((_uiSmallTimer)),w
	skipz
	goto	u981
	goto	u980
u981:
	goto	l1586
u980:
	
l3435:	
	movf	(_bSmallTimerStartFlag),f
	skipz
	goto	u991
	goto	u990
u991:
	goto	l1586
u990:
	line	414
	
l3437:	
;common.c: 413: {
;common.c: 414: uiSmallTimer = uiSetTime;
	movf	(startThreeHoursTimer@uiSetTime+1),w
	movwf	(_uiSmallTimer+1)
	movf	(startThreeHoursTimer@uiSetTime),w
	movwf	(_uiSmallTimer)
	line	415
	
l3439:	
;common.c: 415: bSmallTimerStartFlag = 1;
	clrf	(_bSmallTimerStartFlag)
	incf	(_bSmallTimerStartFlag),f
	line	421
	
l1586:	
	return
	opt stack 0
GLOBAL	__end_of_startThreeHoursTimer
	__end_of_startThreeHoursTimer:
;; =============== function _startThreeHoursTimer ends ============

	signat	_startThreeHoursTimer,4216
	global	_isFinishedTwelveHoursTimer
psect	text848,local,class=CODE,delta=2
global __ptext848
__ptext848:

;; *************** function _isFinishedTwelveHoursTimer *****************
;; Defined at:
;;		line 483 in file "D:\develop\190625\AK7030-OTP\common.c"
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
psect	text848
	file	"D:\develop\190625\AK7030-OTP\common.c"
	line	483
	global	__size_of_isFinishedTwelveHoursTimer
	__size_of_isFinishedTwelveHoursTimer	equ	__end_of_isFinishedTwelveHoursTimer-_isFinishedTwelveHoursTimer
	
_isFinishedTwelveHoursTimer:	
	opt	stack 5
; Regs used in _isFinishedTwelveHoursTimer: [wreg+status,2+status,0]
	line	484
	
l3417:	
;common.c: 484: if(( uiBigTimer == 0 ) && bBigTimerStartFlag )
	movf	((_uiBigTimer+1)),w
	iorwf	((_uiBigTimer)),w
	skipz
	goto	u961
	goto	u960
u961:
	goto	l3429
u960:
	
l3419:	
	movf	(_bBigTimerStartFlag),w
	skipz
	goto	u970
	goto	l3429
u970:
	line	486
	
l3421:	
;common.c: 485: {
;common.c: 486: bBigTimerStartFlag = 0;
	clrf	(_bBigTimerStartFlag)
	line	487
	
l3423:	
;common.c: 487: return 1;
	movlw	(01h)
	goto	l1612
	line	490
	
l3429:	
;common.c: 489: else
;common.c: 490: return 0;
	movlw	(0)
	line	491
	
l1612:	
	return
	opt stack 0
GLOBAL	__end_of_isFinishedTwelveHoursTimer
	__end_of_isFinishedTwelveHoursTimer:
;; =============== function _isFinishedTwelveHoursTimer ends ============

	signat	_isFinishedTwelveHoursTimer,89
	global	_startTwelveHourTimer
psect	text849,local,class=CODE,delta=2
global __ptext849
__ptext849:

;; *************** function _startTwelveHourTimer *****************
;; Defined at:
;;		line 363 in file "D:\develop\190625\AK7030-OTP\common.c"
;; Parameters:    Size  Location     Type
;;  uiSetTime       2    0[BANK0 ] unsigned int 
;; Auto vars:     Size  Location     Type
;;		None
;; Return value:  Size  Location     Type
;;		None               void
;; Registers used:
;;		wreg, status,2, status,0
;; Tracked objects:
;;		On entry : 160/0
;;		On exit  : 160/0
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
psect	text849
	file	"D:\develop\190625\AK7030-OTP\common.c"
	line	363
	global	__size_of_startTwelveHourTimer
	__size_of_startTwelveHourTimer	equ	__end_of_startTwelveHourTimer-_startTwelveHourTimer
	
_startTwelveHourTimer:	
	opt	stack 5
; Regs used in _startTwelveHourTimer: [wreg+status,2+status,0]
	line	364
	
l3409:	
;common.c: 364: if((0 == uiBigTimer) && ( 0 == bBigTimerStartFlag))
	movf	((_uiBigTimer+1)),w
	iorwf	((_uiBigTimer)),w
	skipz
	goto	u941
	goto	u940
u941:
	goto	l1567
u940:
	
l3411:	
	movf	(_bBigTimerStartFlag),f
	skipz
	goto	u951
	goto	u950
u951:
	goto	l1567
u950:
	line	366
	
l3413:	
;common.c: 365: {
;common.c: 366: uiBigTimer = uiSetTime;
	movf	(startTwelveHourTimer@uiSetTime+1),w
	movwf	(_uiBigTimer+1)
	movf	(startTwelveHourTimer@uiSetTime),w
	movwf	(_uiBigTimer)
	line	367
	
l3415:	
;common.c: 367: bBigTimerStartFlag = 1;
	clrf	(_bBigTimerStartFlag)
	incf	(_bBigTimerStartFlag),f
	line	374
	
l1567:	
	return
	opt stack 0
GLOBAL	__end_of_startTwelveHourTimer
	__end_of_startTwelveHourTimer:
;; =============== function _startTwelveHourTimer ends ============

	signat	_startTwelveHourTimer,4216
	global	_clearTwentyMinTimer
psect	text850,local,class=CODE,delta=2
global __ptext850
__ptext850:

;; *************** function _clearTwentyMinTimer *****************
;; Defined at:
;;		line 404 in file "D:\develop\190625\AK7030-OTP\common.c"
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
psect	text850
	file	"D:\develop\190625\AK7030-OTP\common.c"
	line	404
	global	__size_of_clearTwentyMinTimer
	__size_of_clearTwentyMinTimer	equ	__end_of_clearTwentyMinTimer-_clearTwentyMinTimer
	
_clearTwentyMinTimer:	
	opt	stack 5
; Regs used in _clearTwentyMinTimer: [status,2]
	line	405
	
l3407:	
;common.c: 405: uiTwentyMinTimer = 0;
	clrf	(_uiTwentyMinTimer)
	clrf	(_uiTwentyMinTimer+1)
	line	406
;common.c: 406: bTwentyMinStartFlag = 0;
	clrf	(_bTwentyMinStartFlag)
	line	407
	
l1582:	
	return
	opt stack 0
GLOBAL	__end_of_clearTwentyMinTimer
	__end_of_clearTwentyMinTimer:
;; =============== function _clearTwentyMinTimer ends ============

	signat	_clearTwentyMinTimer,88
	global	_isFinishedTwentyMinTimer
psect	text851,local,class=CODE,delta=2
global __ptext851
__ptext851:

;; *************** function _isFinishedTwentyMinTimer *****************
;; Defined at:
;;		line 459 in file "D:\develop\190625\AK7030-OTP\common.c"
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
psect	text851
	file	"D:\develop\190625\AK7030-OTP\common.c"
	line	459
	global	__size_of_isFinishedTwentyMinTimer
	__size_of_isFinishedTwentyMinTimer	equ	__end_of_isFinishedTwentyMinTimer-_isFinishedTwentyMinTimer
	
_isFinishedTwentyMinTimer:	
	opt	stack 5
; Regs used in _isFinishedTwentyMinTimer: [wreg+status,2+status,0]
	line	460
	
l3391:	
;common.c: 460: if(( 0 == uiTwentyMinTimer ) && bTwentyMinStartFlag )
	movf	((_uiTwentyMinTimer+1)),w
	iorwf	((_uiTwentyMinTimer)),w
	skipz
	goto	u921
	goto	u920
u921:
	goto	l3403
u920:
	
l3393:	
	movf	(_bTwentyMinStartFlag),w
	skipz
	goto	u930
	goto	l3403
u930:
	line	462
	
l3395:	
;common.c: 461: {
;common.c: 462: bTwentyMinStartFlag = 0;
	clrf	(_bTwentyMinStartFlag)
	line	463
	
l3397:	
;common.c: 463: return 1;
	movlw	(01h)
	goto	l1602
	line	466
	
l3403:	
;common.c: 465: else
;common.c: 466: return 0;
	movlw	(0)
	line	467
	
l1602:	
	return
	opt stack 0
GLOBAL	__end_of_isFinishedTwentyMinTimer
	__end_of_isFinishedTwentyMinTimer:
;; =============== function _isFinishedTwentyMinTimer ends ============

	signat	_isFinishedTwentyMinTimer,89
	global	_clrSampeTime
psect	text852,local,class=CODE,delta=2
global __ptext852
__ptext852:

;; *************** function _clrSampeTime *****************
;; Defined at:
;;		line 529 in file "D:\develop\190625\AK7030-OTP\common.c"
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
psect	text852
	file	"D:\develop\190625\AK7030-OTP\common.c"
	line	529
	global	__size_of_clrSampeTime
	__size_of_clrSampeTime	equ	__end_of_clrSampeTime-_clrSampeTime
	
_clrSampeTime:	
	opt	stack 5
; Regs used in _clrSampeTime: [status,2]
	line	530
	
l3389:	
;common.c: 530: timer.timer10msStopWatch = 0;
	clrf	(_timer)
	line	531
	
l1631:	
	return
	opt stack 0
GLOBAL	__end_of_clrSampeTime
	__end_of_clrSampeTime:
;; =============== function _clrSampeTime ends ============

	signat	_clrSampeTime,88
	global	_isPermitSampleTime
psect	text853,local,class=CODE,delta=2
global __ptext853
__ptext853:

;; *************** function _isPermitSampleTime *****************
;; Defined at:
;;		line 519 in file "D:\develop\190625\AK7030-OTP\common.c"
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
psect	text853
	file	"D:\develop\190625\AK7030-OTP\common.c"
	line	519
	global	__size_of_isPermitSampleTime
	__size_of_isPermitSampleTime	equ	__end_of_isPermitSampleTime-_isPermitSampleTime
	
_isPermitSampleTime:	
	opt	stack 5
; Regs used in _isPermitSampleTime: [wreg]
	line	520
	
l3377:	
;common.c: 520: if(timer.timer10msStopWatch >= 10)
	movlw	(0Ah)
	subwf	(_timer),w
	skipc
	goto	u911
	goto	u910
u911:
	goto	l3385
u910:
	line	522
	
l3379:	
;common.c: 521: {
;common.c: 522: return 1;
	movlw	(01h)
	goto	l1627
	line	525
	
l3385:	
;common.c: 524: else
;common.c: 525: return 0;
	movlw	(0)
	line	526
	
l1627:	
	return
	opt stack 0
GLOBAL	__end_of_isPermitSampleTime
	__end_of_isPermitSampleTime:
;; =============== function _isPermitSampleTime ends ============

	signat	_isPermitSampleTime,89
	global	_startTwentyMinTimer
psect	text854,local,class=CODE,delta=2
global __ptext854
__ptext854:

;; *************** function _startTwentyMinTimer *****************
;; Defined at:
;;		line 449 in file "D:\develop\190625\AK7030-OTP\common.c"
;; Parameters:    Size  Location     Type
;;  uiSetValue      2    0[BANK0 ] unsigned int 
;; Auto vars:     Size  Location     Type
;;		None
;; Return value:  Size  Location     Type
;;		None               void
;; Registers used:
;;		wreg, status,2, status,0
;; Tracked objects:
;;		On entry : 17F/0
;;		On exit  : 17F/0
;;		Unchanged: FFE80/0
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
psect	text854
	file	"D:\develop\190625\AK7030-OTP\common.c"
	line	449
	global	__size_of_startTwentyMinTimer
	__size_of_startTwentyMinTimer	equ	__end_of_startTwentyMinTimer-_startTwentyMinTimer
	
_startTwentyMinTimer:	
	opt	stack 5
; Regs used in _startTwentyMinTimer: [wreg+status,2+status,0]
	line	450
	
l3369:	
;common.c: 450: if(( 0 == uiTwentyMinTimer) && ( 0 == bTwentyMinStartFlag))
	movf	((_uiTwentyMinTimer+1)),w
	iorwf	((_uiTwentyMinTimer)),w
	skipz
	goto	u891
	goto	u890
u891:
	goto	l1598
u890:
	
l3371:	
	movf	(_bTwentyMinStartFlag),f
	skipz
	goto	u901
	goto	u900
u901:
	goto	l1598
u900:
	line	452
	
l3373:	
;common.c: 451: {
;common.c: 452: uiTwentyMinTimer = uiSetValue;
	movf	(startTwentyMinTimer@uiSetValue+1),w
	movwf	(_uiTwentyMinTimer+1)
	movf	(startTwentyMinTimer@uiSetValue),w
	movwf	(_uiTwentyMinTimer)
	line	453
	
l3375:	
;common.c: 453: bTwentyMinStartFlag = 1;
	clrf	(_bTwentyMinStartFlag)
	incf	(_bTwentyMinStartFlag),f
	line	455
	
l1598:	
	return
	opt stack 0
GLOBAL	__end_of_startTwentyMinTimer
	__end_of_startTwentyMinTimer:
;; =============== function _startTwentyMinTimer ends ============

	signat	_startTwentyMinTimer,4216
	global	_adc_start
psect	text855,local,class=CODE,delta=2
global __ptext855
__ptext855:

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
psect	text855
	file	"D:\develop\190625\AK7030-OTP\periph.c"
	line	100
	global	__size_of_adc_start
	__size_of_adc_start	equ	__end_of_adc_start-_adc_start
	
_adc_start:	
	opt	stack 4
; Regs used in _adc_start: []
	line	101
	
l3367:	
;periph.c: 101: GO=1;
	bcf	status, 5	;RP0=0, select bank0
	bsf	(249/8),(249)&7
	line	102
	
l2299:	
	return
	opt stack 0
GLOBAL	__end_of_adc_start
	__end_of_adc_start:
;; =============== function _adc_start ends ============

	signat	_adc_start,88
	global	_adc_test_init
psect	text856,local,class=CODE,delta=2
global __ptext856
__ptext856:

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
psect	text856
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
	
l3357:	
;periph.c: 86: ADCON0 = 0x00;
	clrf	(31)	;volatile
	line	87
	
l3359:	
;periph.c: 87: ADCON0|=channel<<2;
	movf	(adc_test_init@channel),w
	movwf	(??_adc_test_init+0)+0
	clrc
	rlf	(??_adc_test_init+0)+0,f
	clrc
	rlf	(??_adc_test_init+0)+0,w
	iorwf	(31),f	;volatile
	line	88
	
l3361:	
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
	
l3363:	
;periph.c: 89: ADON=1;
	bcf	status, 5	;RP0=0, select bank0
	bsf	(248/8),(248)&7
	line	90
	
l3365:	
;periph.c: 90: ADIE=1;
	bsf	status, 5	;RP0=1, select bank1
	bsf	(1130/8)^080h,(1130)&7
	line	91
	
l2293:	
	return
	opt stack 0
GLOBAL	__end_of_adc_test_init
	__end_of_adc_test_init:
;; =============== function _adc_test_init ends ============

	signat	_adc_test_init,8312
	global	_timer1_interrupt_config
psect	text857,local,class=CODE,delta=2
global __ptext857
__ptext857:

;; *************** function _timer1_interrupt_config *****************
;; Defined at:
;;		line 201 in file "D:\develop\190625\AK7030-OTP\common.c"
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
psect	text857
	file	"D:\develop\190625\AK7030-OTP\common.c"
	line	201
	global	__size_of_timer1_interrupt_config
	__size_of_timer1_interrupt_config	equ	__end_of_timer1_interrupt_config-_timer1_interrupt_config
	
_timer1_interrupt_config:	
	opt	stack 5
; Regs used in _timer1_interrupt_config: []
	line	202
	
l3355:	
;common.c: 202: GIE = 1;
	bsf	(95/8),(95)&7
	line	203
;common.c: 203: PEIE = 1;
	bsf	(94/8),(94)&7
	line	204
	
l1532:	
	return
	opt stack 0
GLOBAL	__end_of_timer1_interrupt_config
	__end_of_timer1_interrupt_config:
;; =============== function _timer1_interrupt_config ends ============

	signat	_timer1_interrupt_config,88
	global	_timer1_config
psect	text858,local,class=CODE,delta=2
global __ptext858
__ptext858:

;; *************** function _timer1_config *****************
;; Defined at:
;;		line 189 in file "D:\develop\190625\AK7030-OTP\common.c"
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
psect	text858
	file	"D:\develop\190625\AK7030-OTP\common.c"
	line	189
	global	__size_of_timer1_config
	__size_of_timer1_config	equ	__end_of_timer1_config-_timer1_config
	
_timer1_config:	
	opt	stack 5
; Regs used in _timer1_config: [wreg]
	line	191
	
l3351:	
;common.c: 191: TMR1H=0xCF;
	movlw	(0CFh)
	bcf	status, 6	;RP1=0, select bank0
	movwf	(15)	;volatile
	line	192
;common.c: 192: TMR1L=0x2C;
	movlw	(02Ch)
	movwf	(14)	;volatile
	line	193
;common.c: 193: T1CON=0xE1;
	movlw	(0E1h)
	movwf	(16)	;volatile
	line	194
	
l3353:	
;common.c: 194: TMR1IE=1;
	bsf	status, 5	;RP0=1, select bank1
	bsf	(1120/8)^080h,(1120)&7
	line	196
	
l1529:	
	return
	opt stack 0
GLOBAL	__end_of_timer1_config
	__end_of_timer1_config:
;; =============== function _timer1_config ends ============

	signat	_timer1_config,88
	global	_clock_config
psect	text859,local,class=CODE,delta=2
global __ptext859
__ptext859:

;; *************** function _clock_config *****************
;; Defined at:
;;		line 181 in file "D:\develop\190625\AK7030-OTP\common.c"
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
psect	text859
	file	"D:\develop\190625\AK7030-OTP\common.c"
	line	181
	global	__size_of_clock_config
	__size_of_clock_config	equ	__end_of_clock_config-_clock_config
	
_clock_config:	
	opt	stack 5
; Regs used in _clock_config: [wreg+status,2]
	line	183
	
l3347:	
;common.c: 183: CLKPR = 0x80;
	movlw	(080h)
	bcf	status, 5	;RP0=0, select bank2
	bsf	status, 6	;RP1=1, select bank2
	movwf	(264)^0100h	;volatile
	line	184
	
l3349:	
;common.c: 184: CLKPR = 0x00;
	clrf	(264)^0100h	;volatile
	line	185
;common.c: 185: while(CLKPCE);
	
l1523:	
	btfsc	(2119/8)^0100h,(2119)&7
	goto	u881
	goto	u880
u881:
	goto	l1523
u880:
	line	186
	
l1526:	
	return
	opt stack 0
GLOBAL	__end_of_clock_config
	__end_of_clock_config:
;; =============== function _clock_config ends ============

	signat	_clock_config,88
	global	_reset
psect	text860,local,class=CODE,delta=2
global __ptext860
__ptext860:

;; *************** function _reset *****************
;; Defined at:
;;		line 355 in file "D:\develop\190625\AK7030-OTP\main.c"
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
;;		On exit  : 40/20
;;		Unchanged: FFFFFFBF/0
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
psect	text860
	file	"D:\develop\190625\AK7030-OTP\main.c"
	line	355
	global	__size_of_reset
	__size_of_reset	equ	__end_of_reset-_reset
	
_reset:	
	opt	stack 5
; Regs used in _reset: []
	line	357
;main.c: 357: while(1);
	
l734:	
	goto	l734
	return
	opt stack 0
psect	text861,local,class=CODE,delta=2
global __ptext861
__ptext861:
	line	361
GLOBAL	__end_of_reset
	__end_of_reset:
;; =============== function _reset ends ============

	signat	_reset,88
	global	_selectAdChannel

;; *************** function _selectAdChannel *****************
;; Defined at:
;;		line 344 in file "D:\develop\190625\AK7030-OTP\main.c"
;; Parameters:    Size  Location     Type
;;		None
;; Auto vars:     Size  Location     Type
;;		None
;; Return value:  Size  Location     Type
;;		None               void
;; Registers used:
;;		None
;; Tracked objects:
;;		On entry : 17F/0
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
psect	text861
	file	"D:\develop\190625\AK7030-OTP\main.c"
	line	344
	global	__size_of_selectAdChannel
	__size_of_selectAdChannel	equ	__end_of_selectAdChannel-_selectAdChannel
	
_selectAdChannel:	
	opt	stack 5
; Regs used in _selectAdChannel: []
	line	346
	
l3345:	
;main.c: 346: TRISB0 = 1;
	bsf	status, 5	;RP0=1, select bank1
	bsf	(1072/8)^080h,(1072)&7
	line	347
;main.c: 347: TRISB1 = 1;
	bsf	(1073/8)^080h,(1073)&7
	line	351
	
l731:	
	return
	opt stack 0
GLOBAL	__end_of_selectAdChannel
	__end_of_selectAdChannel:
;; =============== function _selectAdChannel ends ============

	signat	_selectAdChannel,88
	global	_pwm_config
psect	text862,local,class=CODE,delta=2
global __ptext862
__ptext862:

;; *************** function _pwm_config *****************
;; Defined at:
;;		line 303 in file "D:\develop\190625\AK7030-OTP\main.c"
;; Parameters:    Size  Location     Type
;;  state           1    wreg     unsigned char 
;; Auto vars:     Size  Location     Type
;;  state           1    0[BANK0 ] unsigned char 
;; Return value:  Size  Location     Type
;;		None               void
;; Registers used:
;;		wreg, status,2, status,0
;; Tracked objects:
;;		On entry : 0/0
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
psect	text862
	file	"D:\develop\190625\AK7030-OTP\main.c"
	line	303
	global	__size_of_pwm_config
	__size_of_pwm_config	equ	__end_of_pwm_config-_pwm_config
	
_pwm_config:	
	opt	stack 5
; Regs used in _pwm_config: [wreg+status,2+status,0]
;pwm_config@state stored from wreg
	line	305
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	movwf	(pwm_config@state)
	
l3339:	
;main.c: 305: if( state )
	movf	(pwm_config@state),w
	skipz
	goto	u870
	goto	l3343
u870:
	line	306
	
l3341:	
;main.c: 306: CCP1CON|= 0x0c;
	movlw	(0Ch)
	iorwf	(23),f	;volatile
	goto	l722
	line	308
	
l3343:	
;main.c: 307: else
;main.c: 308: CCP1CON&= 0xf0;
	movlw	(0F0h)
	andwf	(23),f	;volatile
	line	312
	
l722:	
	return
	opt stack 0
GLOBAL	__end_of_pwm_config
	__end_of_pwm_config:
;; =============== function _pwm_config ends ============

	signat	_pwm_config,4216
	global	_pwm_start
psect	text863,local,class=CODE,delta=2
global __ptext863
__ptext863:

;; *************** function _pwm_start *****************
;; Defined at:
;;		line 242 in file "D:\develop\190625\AK7030-OTP\main.c"
;; Parameters:    Size  Location     Type
;;  ucPulseWidth    1    wreg     unsigned char 
;; Auto vars:     Size  Location     Type
;;  ucPulseWidth    1    4[BANK0 ] unsigned char 
;;  ucConvertRea    1    3[BANK0 ] unsigned char 
;;  ucGeHighestS    1    2[BANK0 ] unsigned char 
;;  ucGetLowestT    1    1[BANK0 ] unsigned char 
;;  ucCCP1CON_Va    1    0[BANK0 ] unsigned char 
;; Return value:  Size  Location     Type
;;		None               void
;; Registers used:
;;		wreg, status,2, status,0
;; Tracked objects:
;;		On entry : 60/0
;;		On exit  : 60/60
;;		Unchanged: FFF9F/0
;; Data sizes:     COMMON   BANK0   BANK1   BANK3   BANK2
;;      Params:         0       0       0       0       0
;;      Locals:         0       5       0       0       0
;;      Temps:          0       0       0       0       0
;;      Totals:         0       5       0       0       0
;;Total ram usage:        5 bytes
;; Hardware stack levels used:    1
;; Hardware stack levels required when called:    2
;; This function calls:
;;		Nothing
;; This function is called by:
;;		_main
;; This function uses a non-reentrant model
;;
psect	text863
	file	"D:\develop\190625\AK7030-OTP\main.c"
	line	242
	global	__size_of_pwm_start
	__size_of_pwm_start	equ	__end_of_pwm_start-_pwm_start
	
_pwm_start:	
	opt	stack 5
; Regs used in _pwm_start: [wreg+status,2+status,0]
;pwm_start@ucPulseWidth stored from wreg
	line	247
	movwf	(pwm_start@ucPulseWidth)
	line	245
	
l3307:	
	line	247
;main.c: 247: unsigned char ucGetLowestTwoValue = 0,ucGeHighestSixValue = 0;
	clrf	(pwm_start@ucGetLowestTwoValue)
	clrf	(pwm_start@ucGeHighestSixValue)
	line	249
;main.c: 249: unsigned char ucCCP1CON_Value = 0;
	clrf	(pwm_start@ucCCP1CON_Value)
	line	255
	
l3309:	
;main.c: 255: ucConvertRealPulseWidth = ucPulseWidth << 1;
	clrc
	rlf	(pwm_start@ucPulseWidth),w
	movwf	(pwm_start@ucConvertRealPulseWidth)
	line	261
	
l3311:	
;main.c: 261: ucGetLowestTwoValue = ucConvertRealPulseWidth & 0x03;
	movf	(pwm_start@ucConvertRealPulseWidth),w
	movwf	(pwm_start@ucGetLowestTwoValue)
	
l3313:	
	movlw	(03h)
	andwf	(pwm_start@ucGetLowestTwoValue),f
	line	267
	
l3315:	
;main.c: 267: ucCCP1CON_Value = ucGetLowestTwoValue << 4;
	swapf	(pwm_start@ucGetLowestTwoValue),w
	andlw	(0ffh shl 4) & 0ffh
	movwf	(pwm_start@ucCCP1CON_Value)
	line	273
	
l3317:	
	line	281
	
l3319:	
;main.c: 281: if( ucPulseWidth <= 30)
	movlw	(01Fh)
	subwf	(pwm_start@ucPulseWidth),w
	skipnc
	goto	u841
	goto	u840
u841:
	goto	l3323
u840:
	line	282
	
l3321:	
;main.c: 282: ucGeHighestSixValue = 0x19;
	movlw	(019h)
	movwf	(pwm_start@ucGeHighestSixValue)
	goto	l714
	line	283
	
l3323:	
;main.c: 283: else if((ucPulseWidth > 30) &&(ucPulseWidth < 90))
	movlw	(01Fh)
	subwf	(pwm_start@ucPulseWidth),w
	skipc
	goto	u851
	goto	u850
u851:
	goto	l3329
u850:
	
l3325:	
	movlw	(05Ah)
	subwf	(pwm_start@ucPulseWidth),w
	skipnc
	goto	u861
	goto	u860
u861:
	goto	l3329
u860:
	line	284
	
l3327:	
;main.c: 284: ucGeHighestSixValue = 0x25;
	movlw	(025h)
	movwf	(pwm_start@ucGeHighestSixValue)
	goto	l714
	line	286
	
l3329:	
;main.c: 285: else
;main.c: 286: ucGeHighestSixValue = 0x3F;;
	movlw	(03Fh)
	movwf	(pwm_start@ucGeHighestSixValue)
	
l714:	
	line	289
;main.c: 289: T2CON=0x04;
	movlw	(04h)
	movwf	(18)	;volatile
	line	290
;main.c: 290: PR2 = 49;
	movlw	(031h)
	bsf	status, 5	;RP0=1, select bank1
	movwf	(146)^080h	;volatile
	line	291
;main.c: 291: CCPR1L = ucGeHighestSixValue;
	bcf	status, 5	;RP0=0, select bank0
	movf	(pwm_start@ucGeHighestSixValue),w
	movwf	(21)	;volatile
	line	292
	
l3331:	
;main.c: 292: CCP1CON=0x00;
	clrf	(23)	;volatile
	line	293
	
l3333:	
;main.c: 293: CCP1CON = CCP1CON | ucCCP1CON_Value;
	movf	(pwm_start@ucCCP1CON_Value),w
	iorwf	(23),f	;volatile
	line	295
	
l3335:	
;main.c: 295: TRISB2=0;
	bsf	status, 5	;RP0=1, select bank1
	bcf	(1074/8)^080h,(1074)&7
	line	296
	
l3337:	
;main.c: 296: PBOD2 = 0;
	bsf	status, 6	;RP1=1, select bank3
	bcf	(3138/8)^0180h,(3138)&7
	line	300
	
l717:	
	return
	opt stack 0
GLOBAL	__end_of_pwm_start
	__end_of_pwm_start:
;; =============== function _pwm_start ends ============

	signat	_pwm_start,4216
	global	_initPB2_AsHighResistence
psect	text864,local,class=CODE,delta=2
global __ptext864
__ptext864:

;; *************** function _initPB2_AsHighResistence *****************
;; Defined at:
;;		line 230 in file "D:\develop\190625\AK7030-OTP\main.c"
;; Parameters:    Size  Location     Type
;;		None
;; Auto vars:     Size  Location     Type
;;		None
;; Return value:  Size  Location     Type
;;		None               void
;; Registers used:
;;		None
;; Tracked objects:
;;		On entry : 17F/0
;;		On exit  : 17F/60
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
;;		_initPin
;; This function uses a non-reentrant model
;;
psect	text864
	file	"D:\develop\190625\AK7030-OTP\main.c"
	line	230
	global	__size_of_initPB2_AsHighResistence
	__size_of_initPB2_AsHighResistence	equ	__end_of_initPB2_AsHighResistence-_initPB2_AsHighResistence
	
_initPB2_AsHighResistence:	
	opt	stack 4
; Regs used in _initPB2_AsHighResistence: []
	line	232
	
l3305:	
;main.c: 232: PB2 = 1;
	bsf	(50/8),(50)&7
	line	233
;main.c: 233: PBOD2 = 1;
	bsf	status, 5	;RP0=1, select bank3
	bsf	status, 6	;RP1=1, select bank3
	bsf	(3138/8)^0180h,(3138)&7
	line	237
	
l710:	
	return
	opt stack 0
GLOBAL	__end_of_initPB2_AsHighResistence
	__end_of_initPB2_AsHighResistence:
;; =============== function _initPB2_AsHighResistence ends ============

	signat	_initPB2_AsHighResistence,88
	global	_setPB5
psect	text865,local,class=CODE,delta=2
global __ptext865
__ptext865:

;; *************** function _setPB5 *****************
;; Defined at:
;;		line 213 in file "D:\develop\190625\AK7030-OTP\main.c"
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
;;		_setPinInitVaule
;;		_main
;; This function uses a non-reentrant model
;;
psect	text865
	file	"D:\develop\190625\AK7030-OTP\main.c"
	line	213
	global	__size_of_setPB5
	__size_of_setPB5	equ	__end_of_setPB5-_setPB5
	
_setPB5:	
	opt	stack 5
; Regs used in _setPB5: [wreg]
;setPB5@bValue stored from wreg
	movwf	(setPB5@bValue)
	line	214
	
l3301:	
;main.c: 214: if( bValue )
	movf	(setPB5@bValue),w
	skipz
	goto	u830
	goto	l705
u830:
	line	216
	
l3303:	
;main.c: 216: PB5 = 1;
	bsf	(53/8),(53)&7
	goto	l707
	line	220
	
l705:	
	line	222
;main.c: 220: else
;main.c: 222: PB5= 0;
	bcf	(53/8),(53)&7
	line	226
	
l707:	
	return
	opt stack 0
GLOBAL	__end_of_setPB5
	__end_of_setPB5:
;; =============== function _setPB5 ends ============

	signat	_setPB5,4216
	global	_initPB5
psect	text866,local,class=CODE,delta=2
global __ptext866
__ptext866:

;; *************** function _initPB5 *****************
;; Defined at:
;;		line 196 in file "D:\develop\190625\AK7030-OTP\main.c"
;; Parameters:    Size  Location     Type
;;  bValue          1    wreg     unsigned char 
;; Auto vars:     Size  Location     Type
;;  bValue          1    0[BANK0 ] unsigned char 
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
;;      Locals:         0       1       0       0       0
;;      Temps:          0       0       0       0       0
;;      Totals:         0       1       0       0       0
;;Total ram usage:        1 bytes
;; Hardware stack levels used:    1
;; Hardware stack levels required when called:    2
;; This function calls:
;;		Nothing
;; This function is called by:
;;		_initPin
;; This function uses a non-reentrant model
;;
psect	text866
	file	"D:\develop\190625\AK7030-OTP\main.c"
	line	196
	global	__size_of_initPB5
	__size_of_initPB5	equ	__end_of_initPB5-_initPB5
	
_initPB5:	
	opt	stack 4
; Regs used in _initPB5: [wreg]
;initPB5@bValue stored from wreg
	bcf	status, 5	;RP0=0, select bank0
	movwf	(initPB5@bValue)
	line	197
	
l3297:	
;main.c: 197: if( bValue )
	movf	(initPB5@bValue),w
	skipz
	goto	u820
	goto	l700
u820:
	line	199
	
l3299:	
;main.c: 199: TRISB5 = 1;
	bsf	status, 5	;RP0=1, select bank1
	bsf	(1077/8)^080h,(1077)&7
	goto	l702
	line	203
	
l700:	
	line	205
;main.c: 203: else
;main.c: 205: TRISB5= 0;
	bsf	status, 5	;RP0=1, select bank1
	bcf	(1077/8)^080h,(1077)&7
	line	209
	
l702:	
	return
	opt stack 0
GLOBAL	__end_of_initPB5
	__end_of_initPB5:
;; =============== function _initPB5 ends ============

	signat	_initPB5,4216
	global	_setPB4
psect	text867,local,class=CODE,delta=2
global __ptext867
__ptext867:

;; *************** function _setPB4 *****************
;; Defined at:
;;		line 179 in file "D:\develop\190625\AK7030-OTP\main.c"
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
;;		_setPinInitVaule
;;		_main
;; This function uses a non-reentrant model
;;
psect	text867
	file	"D:\develop\190625\AK7030-OTP\main.c"
	line	179
	global	__size_of_setPB4
	__size_of_setPB4	equ	__end_of_setPB4-_setPB4
	
_setPB4:	
	opt	stack 5
; Regs used in _setPB4: [wreg]
;setPB4@bValue stored from wreg
	movwf	(setPB4@bValue)
	line	180
	
l3293:	
;main.c: 180: if( bValue )
	movf	(setPB4@bValue),w
	skipz
	goto	u810
	goto	l695
u810:
	line	182
	
l3295:	
;main.c: 182: PB4 = 1;
	bsf	(52/8),(52)&7
	goto	l697
	line	186
	
l695:	
	line	188
;main.c: 186: else
;main.c: 188: PB4= 0;
	bcf	(52/8),(52)&7
	line	192
	
l697:	
	return
	opt stack 0
GLOBAL	__end_of_setPB4
	__end_of_setPB4:
;; =============== function _setPB4 ends ============

	signat	_setPB4,4216
	global	_initPB4
psect	text868,local,class=CODE,delta=2
global __ptext868
__ptext868:

;; *************** function _initPB4 *****************
;; Defined at:
;;		line 162 in file "D:\develop\190625\AK7030-OTP\main.c"
;; Parameters:    Size  Location     Type
;;  bValue          1    wreg     unsigned char 
;; Auto vars:     Size  Location     Type
;;  bValue          1    0[BANK0 ] unsigned char 
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
;;      Locals:         0       1       0       0       0
;;      Temps:          0       0       0       0       0
;;      Totals:         0       1       0       0       0
;;Total ram usage:        1 bytes
;; Hardware stack levels used:    1
;; Hardware stack levels required when called:    2
;; This function calls:
;;		Nothing
;; This function is called by:
;;		_initPin
;; This function uses a non-reentrant model
;;
psect	text868
	file	"D:\develop\190625\AK7030-OTP\main.c"
	line	162
	global	__size_of_initPB4
	__size_of_initPB4	equ	__end_of_initPB4-_initPB4
	
_initPB4:	
	opt	stack 4
; Regs used in _initPB4: [wreg]
;initPB4@bValue stored from wreg
	bcf	status, 5	;RP0=0, select bank0
	movwf	(initPB4@bValue)
	line	163
	
l3289:	
;main.c: 163: if( bValue )
	movf	(initPB4@bValue),w
	skipz
	goto	u800
	goto	l690
u800:
	line	165
	
l3291:	
;main.c: 165: TRISB4 = 1;
	bsf	status, 5	;RP0=1, select bank1
	bsf	(1076/8)^080h,(1076)&7
	goto	l692
	line	169
	
l690:	
	line	171
;main.c: 169: else
;main.c: 171: TRISB4= 0;
	bsf	status, 5	;RP0=1, select bank1
	bcf	(1076/8)^080h,(1076)&7
	line	175
	
l692:	
	return
	opt stack 0
GLOBAL	__end_of_initPB4
	__end_of_initPB4:
;; =============== function _initPB4 ends ============

	signat	_initPB4,4216
	global	_setPB3
psect	text869,local,class=CODE,delta=2
global __ptext869
__ptext869:

;; *************** function _setPB3 *****************
;; Defined at:
;;		line 144 in file "D:\develop\190625\AK7030-OTP\main.c"
;; Parameters:    Size  Location     Type
;;  bValue          1    wreg     unsigned char 
;; Auto vars:     Size  Location     Type
;;  bValue          1    0[BANK0 ] unsigned char 
;; Return value:  Size  Location     Type
;;		None               void
;; Registers used:
;;		wreg
;; Tracked objects:
;;		On entry : 0/60
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
;;		_setPinInitVaule
;;		_main
;; This function uses a non-reentrant model
;;
psect	text869
	file	"D:\develop\190625\AK7030-OTP\main.c"
	line	144
	global	__size_of_setPB3
	__size_of_setPB3	equ	__end_of_setPB3-_setPB3
	
_setPB3:	
	opt	stack 5
; Regs used in _setPB3: [wreg]
;setPB3@bValue stored from wreg
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	movwf	(setPB3@bValue)
	line	145
	
l3285:	
;main.c: 145: if( bValue )
	movf	(setPB3@bValue),w
	skipz
	goto	u790
	goto	l685
u790:
	line	147
	
l3287:	
;main.c: 147: PB3 = 1;
	bsf	(51/8),(51)&7
	goto	l687
	line	151
	
l685:	
	line	153
;main.c: 151: else
;main.c: 153: PB3= 0;
	bcf	(51/8),(51)&7
	line	157
	
l687:	
	return
	opt stack 0
GLOBAL	__end_of_setPB3
	__end_of_setPB3:
;; =============== function _setPB3 ends ============

	signat	_setPB3,4216
	global	_initPB3
psect	text870,local,class=CODE,delta=2
global __ptext870
__ptext870:

;; *************** function _initPB3 *****************
;; Defined at:
;;		line 127 in file "D:\develop\190625\AK7030-OTP\main.c"
;; Parameters:    Size  Location     Type
;;  bValue          1    wreg     unsigned char 
;; Auto vars:     Size  Location     Type
;;  bValue          1    0[BANK0 ] unsigned char 
;; Return value:  Size  Location     Type
;;		None               void
;; Registers used:
;;		wreg
;; Tracked objects:
;;		On entry : 17F/60
;;		On exit  : 17F/20
;;		Unchanged: FFE80/0
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
;;		_initPin
;; This function uses a non-reentrant model
;;
psect	text870
	file	"D:\develop\190625\AK7030-OTP\main.c"
	line	127
	global	__size_of_initPB3
	__size_of_initPB3	equ	__end_of_initPB3-_initPB3
	
_initPB3:	
	opt	stack 4
; Regs used in _initPB3: [wreg]
;initPB3@bValue stored from wreg
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	movwf	(initPB3@bValue)
	line	128
	
l3281:	
;main.c: 128: if( bValue )
	movf	(initPB3@bValue),w
	skipz
	goto	u780
	goto	l680
u780:
	line	130
	
l3283:	
;main.c: 130: TRISB3 = 1;
	bsf	status, 5	;RP0=1, select bank1
	bsf	(1075/8)^080h,(1075)&7
	goto	l682
	line	134
	
l680:	
	line	136
;main.c: 134: else
;main.c: 136: TRISB3 = 0;
	bsf	status, 5	;RP0=1, select bank1
	bcf	(1075/8)^080h,(1075)&7
	line	140
	
l682:	
	return
	opt stack 0
GLOBAL	__end_of_initPB3
	__end_of_initPB3:
;; =============== function _initPB3 ends ============

	signat	_initPB3,4216
	global	_clearThreeHoursTimer
psect	text871,local,class=CODE,delta=2
global __ptext871
__ptext871:

;; *************** function _clearThreeHoursTimer *****************
;; Defined at:
;;		line 384 in file "D:\develop\190625\AK7030-OTP\common.c"
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
psect	text871
	file	"D:\develop\190625\AK7030-OTP\common.c"
	line	384
	global	__size_of_clearThreeHoursTimer
	__size_of_clearThreeHoursTimer	equ	__end_of_clearThreeHoursTimer-_clearThreeHoursTimer
	
_clearThreeHoursTimer:	
	opt	stack 5
; Regs used in _clearThreeHoursTimer: [status,2]
	line	385
	
l3279:	
;common.c: 385: uiSmallTimer = 0;
	clrf	(_uiSmallTimer)
	clrf	(_uiSmallTimer+1)
	line	386
;common.c: 386: bSmallTimerStartFlag = 0;
	clrf	(_bSmallTimerStartFlag)
	line	387
	
l1573:	
	return
	opt stack 0
GLOBAL	__end_of_clearThreeHoursTimer
	__end_of_clearThreeHoursTimer:
;; =============== function _clearThreeHoursTimer ends ============

	signat	_clearThreeHoursTimer,88
	global	_clearTwelveHoursTimer
psect	text872,local,class=CODE,delta=2
global __ptext872
__ptext872:

;; *************** function _clearTwelveHoursTimer *****************
;; Defined at:
;;		line 377 in file "D:\develop\190625\AK7030-OTP\common.c"
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
psect	text872
	file	"D:\develop\190625\AK7030-OTP\common.c"
	line	377
	global	__size_of_clearTwelveHoursTimer
	__size_of_clearTwelveHoursTimer	equ	__end_of_clearTwelveHoursTimer-_clearTwelveHoursTimer
	
_clearTwelveHoursTimer:	
	opt	stack 5
; Regs used in _clearTwelveHoursTimer: [status,2]
	line	378
	
l3277:	
;common.c: 378: uiBigTimer = 0;
	clrf	(_uiBigTimer)
	clrf	(_uiBigTimer+1)
	line	379
;common.c: 379: bBigTimerStartFlag = 0;
	clrf	(_bBigTimerStartFlag)
	line	380
	
l1570:	
	return
	opt stack 0
GLOBAL	__end_of_clearTwelveHoursTimer
	__end_of_clearTwelveHoursTimer:
;; =============== function _clearTwelveHoursTimer ends ============

	signat	_clearTwelveHoursTimer,88
	global	_ISR
psect	text873,local,class=CODE,delta=2
global __ptext873
__ptext873:

;; *************** function _ISR *****************
;; Defined at:
;;		line 534 in file "D:\develop\190625\AK7030-OTP\common.c"
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
psect	text873
	file	"D:\develop\190625\AK7030-OTP\common.c"
	line	534
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
psect	text873
	line	537
	
i1l3599:	
;common.c: 535: static unsigned char ucTimer1sCnt = 0;
;common.c: 537: if(TMR1IF == 1)
	btfss	(96/8),(96)&7
	goto	u121_21
	goto	u121_20
u121_21:
	goto	i1l3621
u121_20:
	line	539
	
i1l3601:	
;common.c: 538: {
;common.c: 539: TMR1IF = 0 ;
	bcf	(96/8),(96)&7
	line	540
	
i1l3603:	
;common.c: 540: timer.timer10msStopWatch++;
	incf	(_timer),f
	line	541
;common.c: 541: ucTimer1sCnt++;
	incf	(ISR@ucTimer1sCnt),f
	line	543
	
i1l3605:	
;common.c: 543: if(ucTimer1sCnt >= 100)
	movlw	(064h)
	subwf	(ISR@ucTimer1sCnt),w
	skipc
	goto	u122_21
	goto	u122_20
u122_21:
	goto	i1l3621
u122_20:
	line	545
	
i1l3607:	
;common.c: 544: {
;common.c: 545: ucTimer1sCnt = 0;
	clrf	(ISR@ucTimer1sCnt)
	line	546
	
i1l3609:	
;common.c: 546: if(uiBigTimer > 0)
	movf	(_uiBigTimer+1),w
	iorwf	(_uiBigTimer),w
	skipnz
	goto	u123_21
	goto	u123_20
u123_21:
	goto	i1l1638
u123_20:
	line	547
	
i1l3611:	
;common.c: 547: uiBigTimer--;
	movlw	low(01h)
	subwf	(_uiBigTimer),f
	movlw	high(01h)
	skipc
	decf	(_uiBigTimer+1),f
	subwf	(_uiBigTimer+1),f
	
i1l1638:	
	line	549
;common.c: 549: if(uiSmallTimer)
	movf	(_uiSmallTimer+1),w
	iorwf	(_uiSmallTimer),w
	skipnz
	goto	u124_21
	goto	u124_20
u124_21:
	goto	i1l1639
u124_20:
	line	550
	
i1l3613:	
;common.c: 550: uiSmallTimer--;
	movlw	low(01h)
	subwf	(_uiSmallTimer),f
	movlw	high(01h)
	skipc
	decf	(_uiSmallTimer+1),f
	subwf	(_uiSmallTimer+1),f
	
i1l1639:	
	line	552
;common.c: 552: if(uiTwentySecondsTimer)
	bsf	status, 5	;RP0=1, select bank1
	movf	(_uiTwentySecondsTimer+1)^080h,w
	iorwf	(_uiTwentySecondsTimer)^080h,w
	skipnz
	goto	u125_21
	goto	u125_20
u125_21:
	goto	i1l1640
u125_20:
	line	553
	
i1l3615:	
;common.c: 553: uiTwentySecondsTimer--;
	movlw	low(01h)
	subwf	(_uiTwentySecondsTimer)^080h,f
	movlw	high(01h)
	skipc
	decf	(_uiTwentySecondsTimer+1)^080h,f
	subwf	(_uiTwentySecondsTimer+1)^080h,f
	
i1l1640:	
	line	555
;common.c: 555: if(uiTwentyMinTimer)
	bcf	status, 5	;RP0=0, select bank0
	movf	(_uiTwentyMinTimer+1),w
	iorwf	(_uiTwentyMinTimer),w
	skipnz
	goto	u126_21
	goto	u126_20
u126_21:
	goto	i1l1641
u126_20:
	line	556
	
i1l3617:	
;common.c: 556: uiTwentyMinTimer--;
	movlw	low(01h)
	subwf	(_uiTwentyMinTimer),f
	movlw	high(01h)
	skipc
	decf	(_uiTwentyMinTimer+1),f
	subwf	(_uiTwentyMinTimer+1),f
	
i1l1641:	
	line	558
;common.c: 558: if( uiOneHourTimer )
	movf	(_uiOneHourTimer+1),w
	iorwf	(_uiOneHourTimer),w
	skipnz
	goto	u127_21
	goto	u127_20
u127_21:
	goto	i1l3621
u127_20:
	line	559
	
i1l3619:	
;common.c: 559: uiOneHourTimer--;
	movlw	low(01h)
	subwf	(_uiOneHourTimer),f
	movlw	high(01h)
	skipc
	decf	(_uiOneHourTimer+1),f
	subwf	(_uiOneHourTimer+1),f
	line	563
	
i1l3621:	
;common.c: 560: }
;common.c: 561: }
;common.c: 563: if(ADIF)
	btfss	(106/8),(106)&7
	goto	u128_21
	goto	u128_20
u128_21:
	goto	i1l1646
u128_20:
	line	566
	
i1l3623:	
;common.c: 564: {
;common.c: 566: ADIF=0;
	bcf	(106/8),(106)&7
	line	567
	
i1l3625:	
;common.c: 567: setAD_ConvertFlag(1);
	movlw	(01h)
	fcall	i1_setAD_ConvertFlag
	line	569
	
i1l3627:	
;common.c: 569: if(sampleChannelSelect == 12)
	movf	(_sampleChannelSelect),w
	xorlw	0Ch
	skipz
	goto	u129_21
	goto	u129_20
u129_21:
	goto	i1l3631
u129_20:
	line	573
	
i1l3629:	
;common.c: 570: {
;common.c: 573: vPutSampleDataIntoTable(adc_get(),12);
	fcall	_adc_get
	movf	(1+(?_adc_get)),w
	movwf	(?_vPutSampleDataIntoTable+1)
	movf	(0+(?_adc_get)),w
	movwf	(?_vPutSampleDataIntoTable)
	movlw	(0Ch)
	movwf	0+(?_vPutSampleDataIntoTable)+02h
	fcall	_vPutSampleDataIntoTable
	line	577
;common.c: 577: }
	goto	i1l1646
	line	583
	
i1l3631:	
;common.c: 578: else
;common.c: 579: {
;common.c: 583: vPutSampleDataIntoTable(adc_get(),13);
	fcall	_adc_get
	movf	(1+(?_adc_get)),w
	movwf	(?_vPutSampleDataIntoTable+1)
	movf	(0+(?_adc_get)),w
	movwf	(?_vPutSampleDataIntoTable)
	movlw	(0Dh)
	movwf	0+(?_vPutSampleDataIntoTable)+02h
	fcall	_vPutSampleDataIntoTable
	line	588
	
i1l1646:	
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
psect	text874,local,class=CODE,delta=2
global __ptext874
__ptext874:

;; *************** function i1_setAD_ConvertFlag *****************
;; Defined at:
;;		line 215 in file "D:\develop\190625\AK7030-OTP\common.c"
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
psect	text874
	file	"D:\develop\190625\AK7030-OTP\common.c"
	line	215
	global	__size_ofi1_setAD_ConvertFlag
	__size_ofi1_setAD_ConvertFlag	equ	__end_ofi1_setAD_ConvertFlag-i1_setAD_ConvertFlag
	
i1_setAD_ConvertFlag:	
	opt	stack 3
; Regs used in i1_setAD_ConvertFlag: [wreg]
;i1setAD_ConvertFlag@flag stored from wreg
	movwf	(i1setAD_ConvertFlag@flag)
	line	216
	
i1l3637:	
;common.c: 216: adc_convert_flag = flag;
	movf	(i1setAD_ConvertFlag@flag),w
	movwf	(_adc_convert_flag)
	line	217
	
i1l1538:	
	return
	opt stack 0
GLOBAL	__end_ofi1_setAD_ConvertFlag
	__end_ofi1_setAD_ConvertFlag:
;; =============== function i1_setAD_ConvertFlag ends ============

	signat	i1_setAD_ConvertFlag,88
	global	_adc_get
psect	text875,local,class=CODE,delta=2
global __ptext875
__ptext875:

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
psect	text875
	file	"D:\develop\190625\AK7030-OTP\periph.c"
	line	105
	global	__size_of_adc_get
	__size_of_adc_get	equ	__end_of_adc_get-_adc_get
	
_adc_get:	
	opt	stack 3
; Regs used in _adc_get: [wreg]
	line	107
	
i1l3633:	
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
	
i1l2302:	
	return
	opt stack 0
GLOBAL	__end_of_adc_get
	__end_of_adc_get:
;; =============== function _adc_get ends ============

	signat	_adc_get,90
	global	_vPutSampleDataIntoTable
psect	text876,local,class=CODE,delta=2
global __ptext876
__ptext876:

;; *************** function _vPutSampleDataIntoTable *****************
;; Defined at:
;;		line 106 in file "D:\develop\190625\AK7030-OTP\common.c"
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
psect	text876
	file	"D:\develop\190625\AK7030-OTP\common.c"
	line	106
	global	__size_of_vPutSampleDataIntoTable
	__size_of_vPutSampleDataIntoTable	equ	__end_of_vPutSampleDataIntoTable-_vPutSampleDataIntoTable
	
_vPutSampleDataIntoTable:	
	opt	stack 3
; Regs used in _vPutSampleDataIntoTable: [wreg-fsr0h+status,2+status,0+btemp+1]
	line	114
	
i1l3531:	
;common.c: 108: static unsigned char ucChannelFirstLength = 0;
;common.c: 110: static unsigned char ucChannelFourthLength = 0;
;common.c: 112: static unsigned char ucChannelFourteenthLength = 0;
;common.c: 114: if(channel == 12)
	movf	(vPutSampleDataIntoTable@channel),w
	xorlw	0Ch
	skipz
	goto	u111_21
	goto	u111_20
u111_21:
	goto	i1l3543
u111_20:
	line	116
	
i1l3533:	
;common.c: 115: {
;common.c: 116: if(ucChannelFirstLength < 12)
	movlw	(0Ch)
	subwf	(vPutSampleDataIntoTable@ucChannelFirstLength),w
	skipnc
	goto	u112_21
	goto	u112_20
u112_21:
	goto	i1l3539
u112_20:
	line	118
	
i1l3535:	
;common.c: 117: {
;common.c: 118: uiSampleChannelFirst[ucChannelFirstLength] = uiSampleData;
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
	line	120
	
i1l3537:	
;common.c: 120: ucChannelFirstLength++;
	incf	(vPutSampleDataIntoTable@ucChannelFirstLength),f
	line	121
;common.c: 121: }
	goto	i1l1520
	line	124
	
i1l3539:	
;common.c: 122: else
;common.c: 123: {
;common.c: 124: ucChannelFirstLength = 0;
	clrf	(vPutSampleDataIntoTable@ucChannelFirstLength)
	line	126
	
i1l3541:	
;common.c: 126: uiSampleChannelFirst[ucChannelFirstLength] = uiSampleData;
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
	goto	i1l1520
	line	129
	
i1l3543:	
;common.c: 129: else if(channel == 13)
	movf	(vPutSampleDataIntoTable@channel),w
	xorlw	0Dh
	skipz
	goto	u113_21
	goto	u113_20
u113_21:
	goto	i1l3555
u113_20:
	line	131
	
i1l3545:	
;common.c: 130: {
;common.c: 131: if(ucChannelFourthLength < 12)
	movlw	(0Ch)
	bcf	status, 5	;RP0=0, select bank0
	subwf	(vPutSampleDataIntoTable@ucChannelFourthLength),w
	skipnc
	goto	u114_21
	goto	u114_20
u114_21:
	goto	i1l3551
u114_20:
	line	133
	
i1l3547:	
;common.c: 132: {
;common.c: 133: uiSampleChannelFourth[ucChannelFourthLength] = uiSampleData;
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
	line	135
	
i1l3549:	
;common.c: 135: ucChannelFourthLength++;
	incf	(vPutSampleDataIntoTable@ucChannelFourthLength),f
	line	136
;common.c: 136: }
	goto	i1l1520
	line	139
	
i1l3551:	
;common.c: 137: else
;common.c: 138: {
;common.c: 139: ucChannelFourthLength = 0;
	clrf	(vPutSampleDataIntoTable@ucChannelFourthLength)
	line	141
	
i1l3553:	
;common.c: 141: uiSampleChannelFourth[ucChannelFourthLength] = uiSampleData;
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
	goto	i1l1520
	line	144
	
i1l3555:	
;common.c: 144: else if(channel == 14)
	movf	(vPutSampleDataIntoTable@channel),w
	xorlw	0Eh
	skipz
	goto	u115_21
	goto	u115_20
u115_21:
	goto	i1l3567
u115_20:
	line	146
	
i1l3557:	
;common.c: 145: {
;common.c: 146: if(ucChannelFourteenthLength < 12)
	movlw	(0Ch)
	bcf	status, 5	;RP0=0, select bank0
	subwf	(vPutSampleDataIntoTable@ucChannelFourteenthLength),w
	skipnc
	goto	u116_21
	goto	u116_20
u116_21:
	goto	i1l3563
u116_20:
	line	148
	
i1l3559:	
;common.c: 147: {
;common.c: 148: uiSampleChannelFourteenth[ucChannelFourteenthLength] = uiSampleData;
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
	line	150
	
i1l3561:	
;common.c: 150: ucChannelFourteenthLength++;
	incf	(vPutSampleDataIntoTable@ucChannelFourteenthLength),f
	line	151
;common.c: 151: }
	goto	i1l1520
	line	154
	
i1l3563:	
;common.c: 152: else
;common.c: 153: {
;common.c: 154: ucChannelFourteenthLength = 0;
	clrf	(vPutSampleDataIntoTable@ucChannelFourteenthLength)
	line	156
	
i1l3565:	
;common.c: 156: uiSampleChannelFourth[ucChannelFourteenthLength] = uiSampleData;
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
	goto	i1l1520
	line	161
	
i1l3567:	
;common.c: 159: else
;common.c: 160: {
;common.c: 161: ucChannelFirstLength = 0;
	clrf	(vPutSampleDataIntoTable@ucChannelFirstLength)
	line	163
;common.c: 163: ucChannelFourthLength = 0;
	bcf	status, 5	;RP0=0, select bank0
	clrf	(vPutSampleDataIntoTable@ucChannelFourthLength)
	line	165
;common.c: 165: ucChannelFourteenthLength = 0;
	clrf	(vPutSampleDataIntoTable@ucChannelFourteenthLength)
	line	167
;common.c: 167: for(int i = 0;i < 12; i++)
	clrf	(vPutSampleDataIntoTable@i)
	clrf	(vPutSampleDataIntoTable@i+1)
	line	169
	
i1l3573:	
;common.c: 168: {
;common.c: 169: uiSampleChannelFirst[i] = 0;
	clrc
	rlf	(vPutSampleDataIntoTable@i),w
	addlw	_uiSampleChannelFirst&0ffh
	movwf	fsr0
	bcf	status, 7	;select IRP bank1
	clrf	indf
	incf	fsr0,f
	clrf	indf
	line	171
;common.c: 171: uiSampleChannelFourth[i] = 0;
	clrc
	rlf	(vPutSampleDataIntoTable@i),w
	addlw	_uiSampleChannelFourth&0ffh
	movwf	fsr0
	clrf	indf
	incf	fsr0,f
	clrf	indf
	line	173
;common.c: 173: uiSampleChannelFourth[i] = 0;
	clrc
	rlf	(vPutSampleDataIntoTable@i),w
	addlw	_uiSampleChannelFourth&0ffh
	movwf	fsr0
	clrf	indf
	incf	fsr0,f
	clrf	indf
	line	167
	
i1l3575:	
	incf	(vPutSampleDataIntoTable@i),f
	skipnz
	incf	(vPutSampleDataIntoTable@i+1),f
	
i1l3577:	
	movf	(vPutSampleDataIntoTable@i+1),w
	xorlw	80h
	movwf	btemp+1
	movlw	(high(0Ch))^80h
	subwf	btemp+1,w
	skipz
	goto	u117_25
	movlw	low(0Ch)
	subwf	(vPutSampleDataIntoTable@i),w
u117_25:

	skipc
	goto	u117_21
	goto	u117_20
u117_21:
	goto	i1l3573
u117_20:
	line	177
	
i1l1520:	
	return
	opt stack 0
GLOBAL	__end_of_vPutSampleDataIntoTable
	__end_of_vPutSampleDataIntoTable:
;; =============== function _vPutSampleDataIntoTable ends ============

	signat	_vPutSampleDataIntoTable,8312
psect	text877,local,class=CODE,delta=2
global __ptext877
__ptext877:
	global	btemp
	btemp set 07Eh

	DABS	1,126,2	;btemp
	global	wtemp0
	wtemp0 set btemp
	end
