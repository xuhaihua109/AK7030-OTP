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
# 102 "D:\develop\190625\AK7030-OTP\main.c"
	psect config,class=CONFIG,delta=2 ;#
# 102 "D:\develop\190625\AK7030-OTP\main.c"
	dw 0x0FFF & 0x3FFF & 0x3FFF & 0x3FFF & 0x3FFF & 0x3FFF ;#
# 103 "D:\develop\190625\AK7030-OTP\main.c"
	psect config,class=CONFIG,delta=2 ;#
# 103 "D:\develop\190625\AK7030-OTP\main.c"
	dw 0x3FFF & 0x3FDF & 0x3FFF & 0x3FFE ;#
# 104 "D:\develop\190625\AK7030-OTP\main.c"
	psect config,class=CONFIG,delta=2 ;#
# 104 "D:\develop\190625\AK7030-OTP\main.c"
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
	FNCALL	_main,_calPulseWidth
	FNCALL	_main,_pwm_start
	FNCALL	_main,_isFinishedTwentyMinTimer
	FNCALL	_main,_getAdOriginalCh13Value
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
	global	calPulseWidth@uiOldValue
	global	main@ucStep
	global	vPutSampleDataIntoTable@ucChannelFourteenthLength
	global	vPutSampleDataIntoTable@ucChannelFourthLength
	global	vPutSampleDataIntoTable@ucChannelFirstLength
	global	_uiBigTimer
	global	_uiOneHourTimer
	global	_uiSmallTimer
	global	_uiTwentyMinTimer
	global	_uiTwentySecondsTimer
	global	main@ucDelay1s
	global	main@uiTimerOneP5s
	global	main@uiTimerThreeP5s
	global	main@uiTimerTwoP5s
	global	ISR@ucTimer1sCnt
	global	_adc_convert_flag
	global	_bBigTimerStartFlag
	global	_bOneHourTimerStartFlag
	global	_bSmallTimerStartFlag
	global	_bTwentyMinStartFlag
	global	_sampleTimes
	global	_timer
	global	calPulseWidth@bInitFlag
	global	main@cTimerP5s_790
	global	main@cTimerP5s_796
	global	main@ucTimerP3s
	global	main@ucTimerP5s
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
calPulseWidth@uiOldValue:
       ds      2

main@ucStep:
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

_uiOneHourTimer:
       ds      2

_uiSmallTimer:
       ds      2

_uiTwentyMinTimer:
       ds      2

_uiTwentySecondsTimer:
       ds      2

main@ucDelay1s:
       ds      2

main@uiTimerOneP5s:
       ds      2

main@uiTimerThreeP5s:
       ds      2

main@uiTimerTwoP5s:
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

calPulseWidth@bInitFlag:
       ds      1

main@cTimerP5s_790:
       ds      1

main@cTimerP5s_796:
       ds      1

main@ucTimerP3s:
       ds      1

main@ucTimerP5s:
       ds      1

_uiSampleChannelFourth:
       ds      40

psect	bssBANK3,class=BANK3,space=1
global __pbssBANK3
__pbssBANK3:
_uiSampleChannelFirst:
       ds      40

_uiSampleChannelFourteenth:
       ds      40

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
	clrf	((__pbssBANK0)+0)&07Fh
	clrf	((__pbssBANK0)+1)&07Fh
	clrf	((__pbssBANK0)+2)&07Fh
	clrf	((__pbssBANK0)+3)&07Fh
	clrf	((__pbssBANK0)+4)&07Fh
; Clear objects allocated to BANK1
psect cinit,class=CODE,delta=2
	bcf	status, 7	;select IRP bank0
	movlw	low(__pbssBANK1)
	movwf	fsr
	movlw	low((__pbssBANK1)+047h)
	fcall	clear_ram
; Clear objects allocated to BANK3
psect cinit,class=CODE,delta=2
	bsf	status, 7	;select IRP bank2
	movlw	low(__pbssBANK3)
	movwf	fsr
	movlw	low((__pbssBANK3)+050h)
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
	global	pwm_start@ucPulseWidth
pwm_start@ucPulseWidth:	; 1 bytes @ 0x0
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
	global	adc_test_init@channel
adc_test_init@channel:	; 1 bytes @ 0x2
	ds	1
	global	??_process_AD_Converter_Value
??_process_AD_Converter_Value:	; 0 bytes @ 0x3
	ds	3
	global	Filter@filter_buf
Filter@filter_buf:	; 40 bytes @ 0x6
	ds	40
	global	Filter@filter_temp
Filter@filter_temp:	; 2 bytes @ 0x2E
	ds	2
	global	Filter@filter_sum
Filter@filter_sum:	; 2 bytes @ 0x30
	ds	2
	global	Filter@cir
Filter@cir:	; 2 bytes @ 0x32
	ds	2
	global	Filter@j
Filter@j:	; 1 bytes @ 0x34
	ds	1
	global	Filter@i
Filter@i:	; 1 bytes @ 0x35
	ds	1
	global	?_getAdOriginalCh12Value
?_getAdOriginalCh12Value:	; 2 bytes @ 0x36
	global	?_getAdOriginalCh13Value
?_getAdOriginalCh13Value:	; 2 bytes @ 0x36
	ds	2
	global	??_getAdOriginalCh12Value
??_getAdOriginalCh12Value:	; 0 bytes @ 0x38
	global	??_getAdOriginalCh13Value
??_getAdOriginalCh13Value:	; 0 bytes @ 0x38
	global	??_calPulseWidth
??_calPulseWidth:	; 0 bytes @ 0x38
	ds	2
	global	calPulseWidth@uiGapValue
calPulseWidth@uiGapValue:	; 2 bytes @ 0x3A
	ds	2
	global	calPulseWidth@ucThreeTimesValue
calPulseWidth@ucThreeTimesValue:	; 1 bytes @ 0x3C
	ds	1
	global	calPulseWidth@ucHalfValue
calPulseWidth@ucHalfValue:	; 1 bytes @ 0x3D
	ds	1
	global	calPulseWidth@ucGapValue
calPulseWidth@ucGapValue:	; 1 bytes @ 0x3E
	ds	1
	global	calPulseWidth@uiChannel2Value
calPulseWidth@uiChannel2Value:	; 2 bytes @ 0x3F
	ds	2
	global	calPulseWidth@ucPulseWidth
calPulseWidth@ucPulseWidth:	; 1 bytes @ 0x41
	ds	1
	global	calPulseWidth@uiNewValue
calPulseWidth@uiNewValue:	; 2 bytes @ 0x42
	ds	2
	global	??_main
??_main:	; 0 bytes @ 0x44
	global	main@ucChValue
main@ucChValue:	; 2 bytes @ 0x44
	ds	2
	global	main@ucPulseWidth
main@ucPulseWidth:	; 1 bytes @ 0x46
	ds	1
	global	main@uiCh13Value
main@uiCh13Value:	; 2 bytes @ 0x47
	ds	2
;;Data sizes: Strings 0, constant 0, data 1, bss 157, persistent 0 stack 0
;;Auto spaces:   Size  Autos    Used
;; COMMON          14     13      14
;; BANK0           80     73      79
;; BANK1           80      0      71
;; BANK3           96      0      80
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
;; Filter@tmpValue	PTR int  size(2) Largest target is 40
;;		 -> uiSampleChannelFourteenth(BANK3[40]), uiSampleChannelFourth(BANK1[40]), uiSampleChannelFirst(BANK3[40]), 
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
;; (0) _main                                                 5     5      0    2142
;;                                             68 BANK0      5     5      0
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
;;                      _calPulseWidth
;;                          _pwm_start
;;           _isFinishedTwentyMinTimer
;;             _getAdOriginalCh13Value
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
;; ---------------------------------------------------------------------------------
;; (1) _calPulseWidth                                       12    12      0     990
;;                                             56 BANK0     12    12      0
;;             _getAdOriginalCh12Value
;; ---------------------------------------------------------------------------------
;; (1) _getAdOriginalCh13Value                               2     0      2     620
;;                                             54 BANK0      2     0      2
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
;;                                             54 BANK0      2     0      2
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
;; (2) _Filter                                              54    52      2     620
;;                                              0 BANK0     54    52      2
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
;; (1) _pwm_start                                            1     1      0      22
;;                                              0 BANK0      1     1      0
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
;;   _calPulseWidth
;;     _getAdOriginalCh12Value
;;       _Filter
;;   _pwm_start
;;   _isFinishedTwentyMinTimer
;;   _getAdOriginalCh13Value
;;     _Filter
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
;;
;; _ISR (ROOT)
;;   i1_setAD_ConvertFlag
;;   _adc_get
;;   _vPutSampleDataIntoTable
;;     _adc_get (ARG)
;;

;; Address spaces:

;;Name               Size   Autos  Total    Cost      Usage
;;BANK3               60      0      50      10       83.3%
;;BITBANK3            60      0       0       9        0.0%
;;SFR3                 0      0       0       4        0.0%
;;BITSFR3              0      0       0       4        0.0%
;;BANK2               60      0       0      12        0.0%
;;BITBANK2            60      0       0      11        0.0%
;;SFR2                 0      0       0       5        0.0%
;;BITSFR2              0      0       0       5        0.0%
;;SFR1                 0      0       0       2        0.0%
;;BITSFR1              0      0       0       2        0.0%
;;BANK1               50      0      47       8       88.8%
;;BITBANK1            50      0       0       7        0.0%
;;CODE                 0      0       0       0        0.0%
;;DATA                 0      0      FB       6        0.0%
;;ABS                  0      0      F4       3        0.0%
;;NULL                 0      0       0       0        0.0%
;;STACK                0      0       7       2        0.0%
;;BANK0               50     49      4F       5       98.8%
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
;;		line 581 in file "D:\develop\190625\AK7030-OTP\main.c"
;; Parameters:    Size  Location     Type
;;		None
;; Auto vars:     Size  Location     Type
;;  ucChValue       2   68[BANK0 ] unsigned int 
;;  uiCh13Value     2   71[BANK0 ] unsigned int 
;;  ucPulseWidth    1   70[BANK0 ] unsigned char 
;; Return value:  Size  Location     Type
;;                  2  751[COMMON] int 
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
;;		_calPulseWidth
;;		_pwm_start
;;		_isFinishedTwentyMinTimer
;;		_getAdOriginalCh13Value
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
;; This function is called by:
;;		Startup code after reset
;; This function uses a non-reentrant model
;;
psect	maintext
	file	"D:\develop\190625\AK7030-OTP\main.c"
	line	581
	global	__size_of_main
	__size_of_main	equ	__end_of_main-_main
	
_main:	
	opt	stack 3
; Regs used in _main: [wreg-fsr0h+status,2+status,0+btemp+1+pclath+cstack]
	line	592
	
l3716:	
;main.c: 592: initPin();
	fcall	_initPin
	line	593
;main.c: 593: setPinInitVaule();
	fcall	_setPinInitVaule
	line	594
	
l3718:	
;main.c: 594: selectAdChannel();
	fcall	_selectAdChannel
	line	596
	
l3720:	
;main.c: 596: clock_config();
	fcall	_clock_config
	line	597
	
l3722:	
;main.c: 597: timer1_config();
	fcall	_timer1_config
	line	598
	
l3724:	
;main.c: 598: timer1_interrupt_config();
	fcall	_timer1_interrupt_config
	line	600
;main.c: 600: adc_test_init(12,3);
	movlw	(03h)
	bcf	status, 5	;RP0=0, select bank0
	movwf	(?_adc_test_init)
	movlw	(0Ch)
	fcall	_adc_test_init
	line	607
	
l3726:	
;main.c: 607: adc_start();
	fcall	_adc_start
	line	614
	
l3728:	
;main.c: 614: startTwentyMinTimer( 60 );
	movlw	03Ch
	movwf	(?_startTwentyMinTimer)
	clrf	(?_startTwentyMinTimer+1)
	fcall	_startTwentyMinTimer
	line	619
	
l3730:	
# 619 "D:\develop\190625\AK7030-OTP\main.c"
 clrwdt ;#
psect	maintext
	line	621
	
l3732:	
;main.c: 621: process_AD_Converter_Value();
	fcall	_process_AD_Converter_Value
	line	623
	
l3734:	
;main.c: 623: if( isPermitSampleTime() )
	fcall	_isPermitSampleTime
	xorlw	0
	skipnz
	goto	u1411
	goto	u1410
u1411:
	goto	l3730
u1410:
	line	627
	
l3736:	
;main.c: 624: {
;main.c: 627: clrSampeTime();
	fcall	_clrSampeTime
	line	651
	
l3738:	
;main.c: 635: enum systemStep {
;main.c: 636: INIT_STEP = 0,
;main.c: 637: START_UP_PWM_STEP,
;main.c: 638: CHECK_10_HOUR_TIMER_STEP,
;main.c: 639: STARTUP_3_HOUR_TIMER_STEP,
;main.c: 640: CHECK_3_HOUR_TIMER_STEP,
;main.c: 641: STARTUP_1_HOUR_TIMER_STEP,
;main.c: 642: CHECK_1_HOUR_TIMER_STEP,
;main.c: 643: READY_FOR_RESET_STEP = 99,
;main.c: 644: DELAY_ONE_SECOND_FOR_PWM,
;main.c: 645: MEET_RESET_CONDITION_STEP,
;main.c: 646: RESET_STEP,
;main.c: 647: };
;main.c: 649: static enum systemStep ucStep = INIT_STEP;
	movlw	(02h)
	bcf	status, 5	;RP0=0, select bank0
	subwf	(main@ucStep),w
	skipc
	goto	u1421
	goto	u1420
u1421:
	goto	l3906
u1420:
	
l3740:	
	movlw	(063h)
	subwf	(main@ucStep),w
	skipnc
	goto	u1431
	goto	u1430
u1431:
	goto	l3906
u1430:
	line	652
	
l3742:	
;main.c: 652: pwm_start( calPulseWidth() );
	fcall	_calPulseWidth
	fcall	_pwm_start
	goto	l3906
	line	665
	
l3744:	
;main.c: 658: {
;main.c: 663: static unsigned char ucTimerP3s = 0;
;main.c: 665: if( isFinishedTwentyMinTimer() )
	fcall	_isFinishedTwentyMinTimer
	xorlw	0
	skipnz
	goto	u1441
	goto	u1440
u1441:
	goto	l3750
u1440:
	line	667
	
l3746:	
;main.c: 666: {
;main.c: 667: ucStep = READY_FOR_RESET_STEP;
	movlw	(063h)
	bcf	status, 5	;RP0=0, select bank0
	movwf	(main@ucStep)
	line	668
	
l3748:	
;main.c: 668: ucTimerP3s = 0;
	bsf	status, 5	;RP0=1, select bank1
	clrf	(main@ucTimerP3s)^080h
	line	669
;main.c: 669: }
	goto	l3730
	line	672
	
l3750:	
;main.c: 670: else
;main.c: 671: {
;main.c: 672: if( getAdOriginalCh13Value() > 90 )
	fcall	_getAdOriginalCh13Value
	movlw	high(05Bh)
	subwf	(1+(?_getAdOriginalCh13Value)),w
	movlw	low(05Bh)
	skipnz
	subwf	(0+(?_getAdOriginalCh13Value)),w
	skipc
	goto	u1451
	goto	u1450
u1451:
	goto	l3754
u1450:
	line	674
	
l3752:	
;main.c: 673: {
;main.c: 674: ucTimerP3s++;
	bsf	status, 5	;RP0=1, select bank1
	incf	(main@ucTimerP3s)^080h,f
	line	675
;main.c: 675: }
	goto	l3756
	line	677
	
l3754:	
;main.c: 676: else
;main.c: 677: ucTimerP3s = 0;
	bsf	status, 5	;RP0=1, select bank1
	clrf	(main@ucTimerP3s)^080h
	line	679
	
l3756:	
;main.c: 679: if( ucTimerP3s >= 3)
	movlw	(03h)
	subwf	(main@ucTimerP3s)^080h,w
	skipc
	goto	u1461
	goto	u1460
u1461:
	goto	l762
u1460:
	line	681
	
l3758:	
;main.c: 680: {
;main.c: 681: ucTimerP3s = 0;
	clrf	(main@ucTimerP3s)^080h
	line	682
	
l3760:	
;main.c: 682: ucStep = START_UP_PWM_STEP;
	bcf	status, 5	;RP0=0, select bank0
	clrf	(main@ucStep)
	incf	(main@ucStep),f
	goto	l3730
	line	685
	
l762:	
	line	689
;main.c: 683: }
;main.c: 685: }
;main.c: 689: break;
	goto	l3730
	line	697
	
l3762:	
	line	699
	
l3764:	
;main.c: 699: ucPulseWidth = calPulseWidth();
	fcall	_calPulseWidth
	movwf	(main@ucPulseWidth)
	line	701
	
l3766:	
;main.c: 701: pwm_start( ucPulseWidth );
	movf	(main@ucPulseWidth),w
	fcall	_pwm_start
	line	703
	
l3768:	
;main.c: 703: setPB3(0);
	movlw	(0)
	fcall	_setPB3
	line	704
	
l3770:	
;main.c: 704: setPB4(1);
	movlw	(01h)
	fcall	_setPB4
	line	705
	
l3772:	
;main.c: 705: setPB5(0);
	movlw	(0)
	fcall	_setPB5
	line	706
	
l3774:	
;main.c: 706: clearTwentyMinTimer();
	fcall	_clearTwentyMinTimer
	line	707
	
l3776:	
;main.c: 707: startTwelveHourTimer( 240);
	movlw	0F0h
	bcf	status, 5	;RP0=0, select bank0
	movwf	(?_startTwelveHourTimer)
	clrf	(?_startTwelveHourTimer+1)
	fcall	_startTwelveHourTimer
	line	708
	
l3778:	
;main.c: 708: ucStep = CHECK_10_HOUR_TIMER_STEP;
	movlw	(02h)
	bcf	status, 5	;RP0=0, select bank0
	movwf	(main@ucStep)
	line	709
;main.c: 709: break;
	goto	l3730
	line	720
	
l3780:	
;main.c: 713: {
;main.c: 718: static unsigned char ucTimerP5s = 0;
;main.c: 720: if( isFinishedTwelveHoursTimer () )
	fcall	_isFinishedTwelveHoursTimer
	xorlw	0
	skipnz
	goto	u1471
	goto	u1470
u1471:
	goto	l3784
u1470:
	line	721
	
l3782:	
;main.c: 721: ucStep = READY_FOR_RESET_STEP;
	movlw	(063h)
	bcf	status, 5	;RP0=0, select bank0
	movwf	(main@ucStep)
	goto	l3730
	line	724
	
l3784:	
;main.c: 722: else
;main.c: 723: {
;main.c: 724: if( getAdOriginalCh13Value() < 200 )
	fcall	_getAdOriginalCh13Value
	movlw	high(0C8h)
	subwf	(1+(?_getAdOriginalCh13Value)),w
	movlw	low(0C8h)
	skipnz
	subwf	(0+(?_getAdOriginalCh13Value)),w
	skipnc
	goto	u1481
	goto	u1480
u1481:
	goto	l3788
u1480:
	line	725
	
l3786:	
;main.c: 725: ucTimerP5s++;
	bsf	status, 5	;RP0=1, select bank1
	incf	(main@ucTimerP5s)^080h,f
	goto	l3790
	line	727
	
l3788:	
;main.c: 726: else
;main.c: 727: ucTimerP5s = 0;
	bsf	status, 5	;RP0=1, select bank1
	clrf	(main@ucTimerP5s)^080h
	line	729
	
l3790:	
;main.c: 729: if( ucTimerP5s > 5)
	movlw	(06h)
	subwf	(main@ucTimerP5s)^080h,w
	skipc
	goto	u1491
	goto	u1490
u1491:
	goto	l762
u1490:
	line	731
	
l3792:	
;main.c: 730: {
;main.c: 731: ucTimerP5s = 0;
	clrf	(main@ucTimerP5s)^080h
	line	732
	
l3794:	
;main.c: 732: ucStep = STARTUP_3_HOUR_TIMER_STEP;
	movlw	(03h)
	bcf	status, 5	;RP0=0, select bank0
	movwf	(main@ucStep)
	goto	l3730
	line	741
	
l3796:	
;main.c: 740: {
;main.c: 741: clearTwelveHoursTimer();
	fcall	_clearTwelveHoursTimer
	line	742
	
l3798:	
;main.c: 742: startThreeHoursTimer(180);
	movlw	0B4h
	bcf	status, 5	;RP0=0, select bank0
	movwf	(?_startThreeHoursTimer)
	clrf	(?_startThreeHoursTimer+1)
	fcall	_startThreeHoursTimer
	line	743
;main.c: 743: ucStep = CHECK_3_HOUR_TIMER_STEP;
	movlw	(04h)
	bcf	status, 5	;RP0=0, select bank0
	movwf	(main@ucStep)
	line	744
;main.c: 744: break;
	goto	l3730
	line	751
	
l3800:	
;main.c: 748: {
;main.c: 749: static unsigned char ucTimerP5s = 0;
;main.c: 751: if( isFinishedThreeHoursTimer() )
	fcall	_isFinishedThreeHoursTimer
	xorlw	0
	skipnz
	goto	u1501
	goto	u1500
u1501:
	goto	l3804
u1500:
	goto	l3782
	line	755
	
l3804:	
;main.c: 753: else
;main.c: 754: {
;main.c: 755: if( getAdOriginalCh13Value() < 85 )
	fcall	_getAdOriginalCh13Value
	movlw	high(055h)
	subwf	(1+(?_getAdOriginalCh13Value)),w
	movlw	low(055h)
	skipnz
	subwf	(0+(?_getAdOriginalCh13Value)),w
	skipnc
	goto	u1511
	goto	u1510
u1511:
	goto	l3808
u1510:
	line	756
	
l3806:	
;main.c: 756: ucTimerP5s++;
	bsf	status, 5	;RP0=1, select bank1
	incf	(main@cTimerP5s_790)^080h,f
	goto	l3810
	line	758
	
l3808:	
;main.c: 757: else
;main.c: 758: ucTimerP5s = 0;
	bsf	status, 5	;RP0=1, select bank1
	clrf	(main@cTimerP5s_790)^080h
	line	760
	
l3810:	
;main.c: 760: if( ucTimerP5s > 5)
	movlw	(06h)
	subwf	(main@cTimerP5s_790)^080h,w
	skipc
	goto	u1521
	goto	u1520
u1521:
	goto	l762
u1520:
	line	762
	
l3812:	
;main.c: 761: {
;main.c: 762: ucTimerP5s = 0;
	clrf	(main@cTimerP5s_790)^080h
	line	763
	
l3814:	
;main.c: 763: ucStep = STARTUP_1_HOUR_TIMER_STEP;
	movlw	(05h)
	bcf	status, 5	;RP0=0, select bank0
	movwf	(main@ucStep)
	goto	l3730
	line	771
	
l3816:	
;main.c: 770: {
;main.c: 771: clearThreeHoursTimer();
	fcall	_clearThreeHoursTimer
	line	772
	
l3818:	
;main.c: 772: startOneHoursTimer( 120 );
	movlw	078h
	bcf	status, 5	;RP0=0, select bank0
	movwf	(?_startOneHoursTimer)
	clrf	(?_startOneHoursTimer+1)
	fcall	_startOneHoursTimer
	line	773
	
l3820:	
;main.c: 773: setPB3(1);
	movlw	(01h)
	fcall	_setPB3
	line	774
	
l3822:	
;main.c: 774: setPB4(0);
	movlw	(0)
	fcall	_setPB4
	line	775
	
l3824:	
;main.c: 775: setPB5(1);
	movlw	(01h)
	fcall	_setPB5
	line	776
	
l3826:	
;main.c: 776: ucStep = CHECK_1_HOUR_TIMER_STEP;
	movlw	(06h)
	movwf	(main@ucStep)
	line	777
;main.c: 777: break;
	goto	l3730
	line	790
	
l3828:	
;main.c: 781: {
;main.c: 786: static unsigned int uiTimerOneP5s = 0;
;main.c: 787: static unsigned int uiTimerTwoP5s = 0;
;main.c: 788: static unsigned int uiTimerThreeP5s = 0;
;main.c: 790: unsigned int uiCh13Value = getAdOriginalCh13Value();
	fcall	_getAdOriginalCh13Value
	movf	(1+(?_getAdOriginalCh13Value)),w
	movwf	(main@uiCh13Value+1)
	movf	(0+(?_getAdOriginalCh13Value)),w
	movwf	(main@uiCh13Value)
	line	793
	
l3830:	
;main.c: 793: if( isFinishedOneHoursTimer() )
	fcall	_isFinishedOneHoursTimer
	xorlw	0
	skipnz
	goto	u1531
	goto	u1530
u1531:
	goto	l3834
u1530:
	goto	l3782
	line	797
	
l3834:	
;main.c: 795: else
;main.c: 796: {
;main.c: 797: if( uiCh13Value > 100 )
	movlw	high(065h)
	bcf	status, 5	;RP0=0, select bank0
	subwf	(main@uiCh13Value+1),w
	movlw	low(065h)
	skipnz
	subwf	(main@uiCh13Value),w
	skipc
	goto	u1541
	goto	u1540
u1541:
	goto	l3844
u1540:
	line	799
	
l3836:	
;main.c: 798: {
;main.c: 799: if( uiTimerOneP5s <= 5 )
	movlw	high(06h)
	bsf	status, 5	;RP0=1, select bank1
	subwf	(main@uiTimerOneP5s+1)^080h,w
	movlw	low(06h)
	skipnz
	subwf	(main@uiTimerOneP5s)^080h,w
	skipnc
	goto	u1551
	goto	u1550
u1551:
	goto	l3840
u1550:
	line	800
	
l3838:	
;main.c: 800: uiTimerOneP5s++;
	incf	(main@uiTimerOneP5s)^080h,f
	skipnz
	incf	(main@uiTimerOneP5s+1)^080h,f
	line	801
	
l3840:	
;main.c: 801: uiTimerTwoP5s = 0;
	clrf	(main@uiTimerTwoP5s)^080h
	clrf	(main@uiTimerTwoP5s+1)^080h
	line	802
	
l3842:	
;main.c: 802: uiTimerThreeP5s = 0;
	clrf	(main@uiTimerThreeP5s)^080h
	clrf	(main@uiTimerThreeP5s+1)^080h
	line	803
;main.c: 803: }
	goto	l3846
	line	806
	
l3844:	
;main.c: 804: else
;main.c: 805: {
;main.c: 806: uiTimerOneP5s = 0;
	bsf	status, 5	;RP0=1, select bank1
	clrf	(main@uiTimerOneP5s)^080h
	clrf	(main@uiTimerOneP5s+1)^080h
	line	810
	
l3846:	
;main.c: 807: }
;main.c: 810: if(uiTimerOneP5s > 5)
	movlw	high(06h)
	subwf	(main@uiTimerOneP5s+1)^080h,w
	movlw	low(06h)
	skipnz
	subwf	(main@uiTimerOneP5s)^080h,w
	skipc
	goto	u1561
	goto	u1560
u1561:
	goto	l3854
u1560:
	line	812
	
l3848:	
;main.c: 811: {
;main.c: 812: setPB3(0);
	movlw	(0)
	fcall	_setPB3
	line	813
;main.c: 813: setPB4(1);
	movlw	(01h)
	fcall	_setPB4
	line	814
;main.c: 814: setPB5(0);
	movlw	(0)
	fcall	_setPB5
	line	816
	
l3850:	
;main.c: 816: uiTimerOneP5s = 0;
	bsf	status, 5	;RP0=1, select bank1
	clrf	(main@uiTimerOneP5s)^080h
	clrf	(main@uiTimerOneP5s+1)^080h
	line	817
	
l3852:	
;main.c: 817: uiTimerTwoP5s = 0;
	clrf	(main@uiTimerTwoP5s)^080h
	clrf	(main@uiTimerTwoP5s+1)^080h
	line	818
;main.c: 818: }
	goto	l3730
	line	821
	
l3854:	
;main.c: 819: else
;main.c: 820: {
;main.c: 821: if( uiCh13Value < 90 )
	movlw	high(05Ah)
	bcf	status, 5	;RP0=0, select bank0
	subwf	(main@uiCh13Value+1),w
	movlw	low(05Ah)
	skipnz
	subwf	(main@uiCh13Value),w
	skipnc
	goto	u1571
	goto	u1570
u1571:
	goto	l3860
u1570:
	line	823
	
l3856:	
;main.c: 822: {
;main.c: 823: if( uiTimerTwoP5s <= 5)
	movlw	high(06h)
	bsf	status, 5	;RP0=1, select bank1
	subwf	(main@uiTimerTwoP5s+1)^080h,w
	movlw	low(06h)
	skipnz
	subwf	(main@uiTimerTwoP5s)^080h,w
	skipnc
	goto	u1581
	goto	u1580
u1581:
	goto	l3862
u1580:
	line	824
	
l3858:	
;main.c: 824: uiTimerTwoP5s++;
	incf	(main@uiTimerTwoP5s)^080h,f
	skipnz
	incf	(main@uiTimerTwoP5s+1)^080h,f
	goto	l3862
	line	828
	
l3860:	
;main.c: 826: else
;main.c: 827: {
;main.c: 828: uiTimerTwoP5s = 0;
	bsf	status, 5	;RP0=1, select bank1
	clrf	(main@uiTimerTwoP5s)^080h
	clrf	(main@uiTimerTwoP5s+1)^080h
	line	829
;main.c: 829: uiTimerThreeP5s = 0;
	clrf	(main@uiTimerThreeP5s)^080h
	clrf	(main@uiTimerThreeP5s+1)^080h
	line	832
	
l3862:	
;main.c: 830: }
;main.c: 832: if(uiTimerTwoP5s > 5)
	movlw	high(06h)
	subwf	(main@uiTimerTwoP5s+1)^080h,w
	movlw	low(06h)
	skipnz
	subwf	(main@uiTimerTwoP5s)^080h,w
	skipc
	goto	u1591
	goto	u1590
u1591:
	goto	l3730
u1590:
	line	834
	
l3864:	
;main.c: 833: {
;main.c: 834: setPB3(1);
	movlw	(01h)
	fcall	_setPB3
	line	835
;main.c: 835: setPB4(0);
	movlw	(0)
	fcall	_setPB4
	line	836
;main.c: 836: setPB5(1);
	movlw	(01h)
	fcall	_setPB5
	line	838
	
l3866:	
;main.c: 838: if(uiCh13Value < 25)
	movlw	high(019h)
	subwf	(main@uiCh13Value+1),w
	movlw	low(019h)
	skipnz
	subwf	(main@uiCh13Value),w
	skipnc
	goto	u1601
	goto	u1600
u1601:
	goto	l3870
u1600:
	line	839
	
l3868:	
;main.c: 839: uiTimerThreeP5s++;
	bsf	status, 5	;RP0=1, select bank1
	incf	(main@uiTimerThreeP5s)^080h,f
	skipnz
	incf	(main@uiTimerThreeP5s+1)^080h,f
	goto	l3872
	line	841
	
l3870:	
;main.c: 840: else
;main.c: 841: uiTimerThreeP5s = 0;
	bsf	status, 5	;RP0=1, select bank1
	clrf	(main@uiTimerThreeP5s)^080h
	clrf	(main@uiTimerThreeP5s+1)^080h
	line	843
	
l3872:	
;main.c: 843: if(uiTimerThreeP5s > 5)
	movlw	high(06h)
	subwf	(main@uiTimerThreeP5s+1)^080h,w
	movlw	low(06h)
	skipnz
	subwf	(main@uiTimerThreeP5s)^080h,w
	skipc
	goto	u1611
	goto	u1610
u1611:
	goto	l762
u1610:
	line	844
	
l3874:	
;main.c: 844: reset();
	fcall	_reset
	goto	l3730
	line	854
	
l3876:	
;main.c: 853: {
;main.c: 854: setPB3(0);
	movlw	(0)
	fcall	_setPB3
	line	855
;main.c: 855: setPB4(0);
	movlw	(0)
	fcall	_setPB4
	line	856
;main.c: 856: setPB5(1);
	movlw	(01h)
	fcall	_setPB5
	line	858
;main.c: 858: pwm_start(60);
	movlw	(03Ch)
	fcall	_pwm_start
	line	860
	
l3878:	
;main.c: 860: ucStep = DELAY_ONE_SECOND_FOR_PWM;
	movlw	(064h)
	movwf	(main@ucStep)
	line	861
;main.c: 861: break;
	goto	l3730
	line	867
	
l3880:	
;main.c: 865: {
;main.c: 866: static unsigned ucDelay1s = 0;
;main.c: 867: if(ucDelay1s < 10)
	movlw	high(0Ah)
	bsf	status, 5	;RP0=1, select bank1
	subwf	(main@ucDelay1s+1)^080h,w
	movlw	low(0Ah)
	skipnz
	subwf	(main@ucDelay1s)^080h,w
	skipnc
	goto	u1621
	goto	u1620
u1621:
	goto	l3884
u1620:
	line	868
	
l3882:	
;main.c: 868: ucDelay1s++;
	incf	(main@ucDelay1s)^080h,f
	skipnz
	incf	(main@ucDelay1s+1)^080h,f
	goto	l3730
	line	871
	
l3884:	
;main.c: 869: else
;main.c: 870: {
;main.c: 871: ucDelay1s = 0;
	clrf	(main@ucDelay1s)^080h
	clrf	(main@ucDelay1s+1)^080h
	line	872
	
l3886:	
;main.c: 872: ucStep = MEET_RESET_CONDITION_STEP;
	movlw	(065h)
	bcf	status, 5	;RP0=0, select bank0
	movwf	(main@ucStep)
	goto	l3730
	line	884
	
l3888:	
;main.c: 882: {
;main.c: 883: static unsigned char ucTimerP5s = 0;
;main.c: 884: unsigned int ucChValue = getAdOriginalCh13Value();
	fcall	_getAdOriginalCh13Value
	movf	(1+(?_getAdOriginalCh13Value)),w
	movwf	(main@ucChValue+1)
	movf	(0+(?_getAdOriginalCh13Value)),w
	movwf	(main@ucChValue)
	line	886
	
l3890:	
;main.c: 886: if( ucChValue > 50 )
	movlw	high(033h)
	subwf	(main@ucChValue+1),w
	movlw	low(033h)
	skipnz
	subwf	(main@ucChValue),w
	skipc
	goto	u1631
	goto	u1630
u1631:
	goto	l3894
u1630:
	line	887
	
l3892:	
;main.c: 887: ucTimerP5s++;
	bsf	status, 5	;RP0=1, select bank1
	incf	(main@cTimerP5s_796)^080h,f
	goto	l3896
	line	889
	
l3894:	
;main.c: 888: else
;main.c: 889: ucTimerP5s = 0;
	bsf	status, 5	;RP0=1, select bank1
	clrf	(main@cTimerP5s_796)^080h
	line	891
	
l3896:	
;main.c: 891: if(ucTimerP5s > 5)
	movlw	(06h)
	subwf	(main@cTimerP5s_796)^080h,w
	skipc
	goto	u1641
	goto	u1640
u1641:
	goto	l762
u1640:
	line	892
	
l3898:	
;main.c: 892: ucStep = RESET_STEP;
	movlw	(066h)
	bcf	status, 5	;RP0=0, select bank0
	movwf	(main@ucStep)
	goto	l3730
	line	898
	
l3900:	
;main.c: 897: {
;main.c: 898: ucStep = INIT_STEP;
	clrf	(main@ucStep)
	goto	l3874
	line	654
	
l3906:	
	movf	(main@ucStep),w
	; Switch size 1, requested type "space"
; Number of cases is 11, Range of values is 0 to 102
; switch strategies available:
; Name         Instructions Cycles
; simple_byte           34    18 (average)
; direct_byte          213     7 (fixed)
; jumptable            260     6 (fixed)
; rangetable           107     6 (fixed)
; spacedrange          212     9 (fixed)
; locatedrange         103     3 (fixed)
;	Chosen strategy is simple_byte

	opt asmopt_off
	xorlw	0^0	; case 0
	skipnz
	goto	l3744
	xorlw	1^0	; case 1
	skipnz
	goto	l3762
	xorlw	2^1	; case 2
	skipnz
	goto	l3780
	xorlw	3^2	; case 3
	skipnz
	goto	l3796
	xorlw	4^3	; case 4
	skipnz
	goto	l3800
	xorlw	5^4	; case 5
	skipnz
	goto	l3816
	xorlw	6^5	; case 6
	skipnz
	goto	l3828
	xorlw	99^6	; case 99
	skipnz
	goto	l3876
	xorlw	100^99	; case 100
	skipnz
	goto	l3880
	xorlw	101^100	; case 101
	skipnz
	goto	l3888
	xorlw	102^101	; case 102
	skipnz
	goto	l3900
	goto	l762
	opt asmopt_on

	global	start
	ljmp	start
	opt stack 0
psect	maintext
	line	911
GLOBAL	__end_of_main
	__end_of_main:
;; =============== function _main ends ============

	signat	_main,90
	global	_calPulseWidth
psect	text929,local,class=CODE,delta=2
global __ptext929
__ptext929:

;; *************** function _calPulseWidth *****************
;; Defined at:
;;		line 472 in file "D:\develop\190625\AK7030-OTP\main.c"
;; Parameters:    Size  Location     Type
;;		None
;; Auto vars:     Size  Location     Type
;;  uiGapValue      2   58[BANK0 ] unsigned int 
;;  ucGapValue      1   62[BANK0 ] unsigned char 
;;  ucHalfValue     1   61[BANK0 ] unsigned char 
;;  ucThreeTimes    1   60[BANK0 ] unsigned char 
;;  uiNewValue      2   66[BANK0 ] unsigned int 
;;  uiChannel2Va    2   63[BANK0 ] unsigned int 
;;  ucPulseWidth    1   65[BANK0 ] unsigned char 
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
;;      Locals:         0      10       0       0       0
;;      Temps:          0       2       0       0       0
;;      Totals:         0      12       0       0       0
;;Total ram usage:       12 bytes
;; Hardware stack levels used:    1
;; Hardware stack levels required when called:    4
;; This function calls:
;;		_getAdOriginalCh12Value
;; This function is called by:
;;		_main
;; This function uses a non-reentrant model
;;
psect	text929
	file	"D:\develop\190625\AK7030-OTP\main.c"
	line	472
	global	__size_of_calPulseWidth
	__size_of_calPulseWidth	equ	__end_of_calPulseWidth-_calPulseWidth
	
_calPulseWidth:	
	opt	stack 3
; Regs used in _calPulseWidth: [wreg-fsr0h+status,2+status,0+btemp+1+pclath+cstack]
	line	473
	
l3666:	
	line	478
;main.c: 478: unsigned int uiChannel2Value = 0;
	clrf	(calPulseWidth@uiChannel2Value)
	clrf	(calPulseWidth@uiChannel2Value+1)
	line	479
;main.c: 479: unsigned int uiNewValue = 0;
	clrf	(calPulseWidth@uiNewValue)
	clrf	(calPulseWidth@uiNewValue+1)
	line	484
	
l3668:	
;main.c: 480: static unsigned int uiOldValue = 0;
;main.c: 482: static unsigned char bInitFlag = 0;
;main.c: 484: uiNewValue = getAdOriginalCh12Value();
	fcall	_getAdOriginalCh12Value
	movf	(1+(?_getAdOriginalCh12Value)),w
	movwf	(calPulseWidth@uiNewValue+1)
	movf	(0+(?_getAdOriginalCh12Value)),w
	movwf	(calPulseWidth@uiNewValue)
	line	486
	
l3670:	
;main.c: 486: if( 0 == bInitFlag )
	bsf	status, 5	;RP0=1, select bank1
	movf	(calPulseWidth@bInitFlag)^080h,f
	skipz
	goto	u1331
	goto	u1330
u1331:
	goto	l3676
u1330:
	line	488
	
l3672:	
;main.c: 487: {
;main.c: 488: uiOldValue = getAdOriginalCh12Value();
	fcall	_getAdOriginalCh12Value
	movf	(1+(?_getAdOriginalCh12Value)),w
	movwf	(calPulseWidth@uiOldValue+1)
	movf	(0+(?_getAdOriginalCh12Value)),w
	movwf	(calPulseWidth@uiOldValue)
	line	489
	
l3674:	
;main.c: 489: bInitFlag = 1;
	bsf	status, 5	;RP0=1, select bank1
	clrf	(calPulseWidth@bInitFlag)^080h
	incf	(calPulseWidth@bInitFlag)^080h,f
	line	492
	
l3676:	
;main.c: 490: }
;main.c: 492: if(uiNewValue != uiOldValue)
	bcf	status, 5	;RP0=0, select bank0
	movf	(calPulseWidth@uiOldValue+1),w
	xorwf	(calPulseWidth@uiNewValue+1),w
	skipz
	goto	u1345
	movf	(calPulseWidth@uiOldValue),w
	xorwf	(calPulseWidth@uiNewValue),w
u1345:

	skipnz
	goto	u1341
	goto	u1340
u1341:
	goto	l3688
u1340:
	line	494
	
l3678:	
;main.c: 493: {
;main.c: 494: if(uiNewValue > uiOldValue)
	movf	(calPulseWidth@uiNewValue+1),w
	subwf	(calPulseWidth@uiOldValue+1),w
	skipz
	goto	u1355
	movf	(calPulseWidth@uiNewValue),w
	subwf	(calPulseWidth@uiOldValue),w
u1355:
	skipnc
	goto	u1351
	goto	u1350
u1351:
	goto	l3684
u1350:
	line	496
	
l3680:	
;main.c: 495: {
;main.c: 496: if((uiNewValue - uiOldValue) >= 5)
	movf	(calPulseWidth@uiOldValue),w
	subwf	(calPulseWidth@uiNewValue),w
	movwf	(??_calPulseWidth+0)+0
	movf	(calPulseWidth@uiOldValue+1),w
	skipc
	incf	(calPulseWidth@uiOldValue+1),w
	subwf	(calPulseWidth@uiNewValue+1),w
	movwf	1+(??_calPulseWidth+0)+0
	movlw	high(05h)
	subwf	1+(??_calPulseWidth+0)+0,w
	movlw	low(05h)
	skipnz
	subwf	0+(??_calPulseWidth+0)+0,w
	skipc
	goto	u1361
	goto	u1360
u1361:
	goto	l740
u1360:
	line	497
	
l3682:	
;main.c: 497: uiOldValue = uiNewValue;
	movf	(calPulseWidth@uiNewValue+1),w
	movwf	(calPulseWidth@uiOldValue+1)
	movf	(calPulseWidth@uiNewValue),w
	movwf	(calPulseWidth@uiOldValue)
	goto	l3688
	line	503
	
l3684:	
;main.c: 501: else
;main.c: 502: {
;main.c: 503: if((uiOldValue - uiNewValue) >= 5)
	movf	(calPulseWidth@uiNewValue),w
	subwf	(calPulseWidth@uiOldValue),w
	movwf	(??_calPulseWidth+0)+0
	movf	(calPulseWidth@uiNewValue+1),w
	skipc
	incf	(calPulseWidth@uiNewValue+1),w
	subwf	(calPulseWidth@uiOldValue+1),w
	movwf	1+(??_calPulseWidth+0)+0
	movlw	high(05h)
	subwf	1+(??_calPulseWidth+0)+0,w
	movlw	low(05h)
	skipnz
	subwf	0+(??_calPulseWidth+0)+0,w
	skipc
	goto	u1371
	goto	u1370
u1371:
	goto	l740
u1370:
	goto	l3682
	line	507
	
l740:	
	line	514
;main.c: 507: }
;main.c: 508: }
	
l3688:	
;main.c: 512: }
;main.c: 514: uiChannel2Value = uiOldValue;
	movf	(calPulseWidth@uiOldValue+1),w
	movwf	(calPulseWidth@uiChannel2Value+1)
	movf	(calPulseWidth@uiOldValue),w
	movwf	(calPulseWidth@uiChannel2Value)
	line	516
;main.c: 516: if( uiChannel2Value >= 332 )
	movlw	high(014Ch)
	subwf	(calPulseWidth@uiChannel2Value+1),w
	movlw	low(014Ch)
	skipnz
	subwf	(calPulseWidth@uiChannel2Value),w
	skipc
	goto	u1381
	goto	u1380
u1381:
	goto	l3692
u1380:
	line	517
	
l3690:	
;main.c: 517: ucPulseWidth = 99;
	movlw	(063h)
	movwf	(calPulseWidth@ucPulseWidth)
	goto	l745
	line	518
	
l3692:	
;main.c: 518: else if( uiChannel2Value <= 312)
	movlw	high(0139h)
	subwf	(calPulseWidth@uiChannel2Value+1),w
	movlw	low(0139h)
	skipnz
	subwf	(calPulseWidth@uiChannel2Value),w
	skipnc
	goto	u1391
	goto	u1390
u1391:
	goto	l3696
u1390:
	line	519
	
l3694:	
;main.c: 519: ucPulseWidth = 30;
	movlw	(01Eh)
	movwf	(calPulseWidth@ucPulseWidth)
	goto	l745
	line	522
	
l3696:	
	line	524
;main.c: 524: unsigned char ucGapValue = 0;
	clrf	(calPulseWidth@ucGapValue)
	line	526
;main.c: 526: unsigned char ucThreeTimesValue = 0;
	clrf	(calPulseWidth@ucThreeTimesValue)
	line	527
;main.c: 527: unsigned char ucHalfValue = 0;
	clrf	(calPulseWidth@ucHalfValue)
	line	529
	
l3698:	
;main.c: 529: uiGapValue = uiChannel2Value - 312;
	movf	(calPulseWidth@uiChannel2Value+1),w
	movwf	(calPulseWidth@uiGapValue+1)
	movf	(calPulseWidth@uiChannel2Value),w
	movwf	(calPulseWidth@uiGapValue)
	
l3700:	
	movlw	low(0FEC8h)
	addwf	(calPulseWidth@uiGapValue),f
	skipnc
	incf	(calPulseWidth@uiGapValue+1),f
	movlw	high(0FEC8h)
	addwf	(calPulseWidth@uiGapValue+1),f
	line	531
	
l3702:	
;main.c: 531: ucGapValue = uiGapValue;
	movf	(calPulseWidth@uiGapValue),w
	movwf	(calPulseWidth@ucGapValue)
	line	533
	
l3704:	
;main.c: 533: ucThreeTimesValue = ucGapValue*3;
	movf	(calPulseWidth@ucGapValue),w
	addwf	(calPulseWidth@ucGapValue),w
	addwf	(calPulseWidth@ucGapValue),w
	movwf	(calPulseWidth@ucThreeTimesValue)
	line	535
	
l3706:	
;main.c: 535: ucHalfValue = ucGapValue >> 1;
	clrc
	rrf	(calPulseWidth@ucGapValue),w
	movwf	(calPulseWidth@ucHalfValue)
	line	537
	
l3708:	
;main.c: 537: ucPulseWidth = 30 + ucThreeTimesValue + ucHalfValue;
	movf	(calPulseWidth@ucHalfValue),w
	addwf	(calPulseWidth@ucThreeTimesValue),w
	addlw	01Eh
	movwf	(calPulseWidth@ucPulseWidth)
	line	539
	
l3710:	
;main.c: 539: if(ucPulseWidth > 99)
	movlw	(064h)
	subwf	(calPulseWidth@ucPulseWidth),w
	skipc
	goto	u1401
	goto	u1400
u1401:
	goto	l745
u1400:
	goto	l3690
	line	542
	
l745:	
	line	546
;main.c: 542: }
;main.c: 546: return ucPulseWidth;
	movf	(calPulseWidth@ucPulseWidth),w
	line	547
	
l749:	
	return
	opt stack 0
GLOBAL	__end_of_calPulseWidth
	__end_of_calPulseWidth:
;; =============== function _calPulseWidth ends ============

	signat	_calPulseWidth,89
	global	_getAdOriginalCh13Value
psect	text930,local,class=CODE,delta=2
global __ptext930
__ptext930:

;; *************** function _getAdOriginalCh13Value *****************
;; Defined at:
;;		line 238 in file "D:\develop\190625\AK7030-OTP\common.c"
;; Parameters:    Size  Location     Type
;;		None
;; Auto vars:     Size  Location     Type
;;		None
;; Return value:  Size  Location     Type
;;                  2   54[BANK0 ] unsigned int 
;; Registers used:
;;		wreg, fsr0l, fsr0h, status,2, status,0, btemp+1, pclath, cstack
;; Tracked objects:
;;		On entry : 40/20
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
psect	text930
	file	"D:\develop\190625\AK7030-OTP\common.c"
	line	238
	global	__size_of_getAdOriginalCh13Value
	__size_of_getAdOriginalCh13Value	equ	__end_of_getAdOriginalCh13Value-_getAdOriginalCh13Value
	
_getAdOriginalCh13Value:	
	opt	stack 4
; Regs used in _getAdOriginalCh13Value: [wreg-fsr0h+status,2+status,0+btemp+1+pclath+cstack]
	line	240
	
l3662:	
;common.c: 240: return Filter(uiSampleChannelFourth);
	movlw	(_uiSampleChannelFourth&0ffh)
	bcf	status, 5	;RP0=0, select bank0
	movwf	(?_Filter)
	movlw	(0x1/2)
	movwf	(?_Filter+1)
	fcall	_Filter
	movf	(1+(?_Filter)),w
	movwf	(?_getAdOriginalCh13Value+1)
	movf	(0+(?_Filter)),w
	movwf	(?_getAdOriginalCh13Value)
	line	245
	
l1555:	
	return
	opt stack 0
GLOBAL	__end_of_getAdOriginalCh13Value
	__end_of_getAdOriginalCh13Value:
;; =============== function _getAdOriginalCh13Value ends ============

	signat	_getAdOriginalCh13Value,90
	global	_process_AD_Converter_Value
psect	text931,local,class=CODE,delta=2
global __ptext931
__ptext931:

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
psect	text931
	file	"D:\develop\190625\AK7030-OTP\common.c"
	line	260
	global	__size_of_process_AD_Converter_Value
	__size_of_process_AD_Converter_Value	equ	__end_of_process_AD_Converter_Value-_process_AD_Converter_Value
	
_process_AD_Converter_Value:	
	opt	stack 4
; Regs used in _process_AD_Converter_Value: [wreg+status,2+status,0+pclath+cstack]
	line	261
	
l3650:	
;common.c: 261: if(getAD_ConvertFlag())
	fcall	_getAD_ConvertFlag
	xorlw	0
	skipnz
	goto	u1311
	goto	u1310
u1311:
	goto	l1564
u1310:
	line	263
	
l3652:	
;common.c: 262: {
;common.c: 263: setAD_ConvertFlag(0);
	movlw	(0)
	fcall	_setAD_ConvertFlag
	line	264
;common.c: 264: AD_Sample();
	fcall	_AD_Sample
	line	265
	
l3654:	
;common.c: 265: if(12 == sampleChannelSelect)
	bcf	status, 5	;RP0=0, select bank0
	movf	(_sampleChannelSelect),w
	xorlw	0Ch
	skipz
	goto	u1321
	goto	u1320
u1321:
	goto	l3658
u1320:
	line	266
	
l3656:	
;common.c: 266: adc_test_init(12,3);
	movlw	(03h)
	movwf	(?_adc_test_init)
	movlw	(0Ch)
	fcall	_adc_test_init
	goto	l3660
	line	270
	
l3658:	
;common.c: 269: else
;common.c: 270: adc_test_init(13,3);
	movlw	(03h)
	movwf	(?_adc_test_init)
	movlw	(0Dh)
	fcall	_adc_test_init
	line	272
	
l3660:	
;common.c: 272: adc_start();
	fcall	_adc_start
	line	274
	
l1564:	
	return
	opt stack 0
GLOBAL	__end_of_process_AD_Converter_Value
	__end_of_process_AD_Converter_Value:
;; =============== function _process_AD_Converter_Value ends ============

	signat	_process_AD_Converter_Value,88
	global	_getAdOriginalCh12Value
psect	text932,local,class=CODE,delta=2
global __ptext932
__ptext932:

;; *************** function _getAdOriginalCh12Value *****************
;; Defined at:
;;		line 226 in file "D:\develop\190625\AK7030-OTP\common.c"
;; Parameters:    Size  Location     Type
;;		None
;; Auto vars:     Size  Location     Type
;;		None
;; Return value:  Size  Location     Type
;;                  2   54[BANK0 ] unsigned int 
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
;;		_calPulseWidth
;; This function uses a non-reentrant model
;;
psect	text932
	file	"D:\develop\190625\AK7030-OTP\common.c"
	line	226
	global	__size_of_getAdOriginalCh12Value
	__size_of_getAdOriginalCh12Value	equ	__end_of_getAdOriginalCh12Value-_getAdOriginalCh12Value
	
_getAdOriginalCh12Value:	
	opt	stack 3
; Regs used in _getAdOriginalCh12Value: [wreg-fsr0h+status,2+status,0+btemp+1+pclath+cstack]
	line	229
	
l3646:	
;common.c: 229: return Filter(uiSampleChannelFirst);
	movlw	(_uiSampleChannelFirst&0ffh)
	bcf	status, 5	;RP0=0, select bank0
	movwf	(?_Filter)
	movlw	(0x3/2)
	movwf	(?_Filter+1)
	fcall	_Filter
	movf	(1+(?_Filter)),w
	movwf	(?_getAdOriginalCh12Value+1)
	movf	(0+(?_Filter)),w
	movwf	(?_getAdOriginalCh12Value)
	line	234
	
l1552:	
	return
	opt stack 0
GLOBAL	__end_of_getAdOriginalCh12Value
	__end_of_getAdOriginalCh12Value:
;; =============== function _getAdOriginalCh12Value ends ============

	signat	_getAdOriginalCh12Value,90
	global	_setPinInitVaule
psect	text933,local,class=CODE,delta=2
global __ptext933
__ptext933:

;; *************** function _setPinInitVaule *****************
;; Defined at:
;;		line 284 in file "D:\develop\190625\AK7030-OTP\main.c"
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
psect	text933
	file	"D:\develop\190625\AK7030-OTP\main.c"
	line	284
	global	__size_of_setPinInitVaule
	__size_of_setPinInitVaule	equ	__end_of_setPinInitVaule-_setPinInitVaule
	
_setPinInitVaule:	
	opt	stack 4
; Regs used in _setPinInitVaule: [wreg+status,2+status,0+pclath+cstack]
	line	286
	
l3644:	
;main.c: 286: setPB3(1);
	movlw	(01h)
	fcall	_setPB3
	line	287
;main.c: 287: setPB4(0);
	movlw	(0)
	fcall	_setPB4
	line	288
;main.c: 288: setPB5(1);
	movlw	(01h)
	fcall	_setPB5
	line	292
	
l719:	
	return
	opt stack 0
GLOBAL	__end_of_setPinInitVaule
	__end_of_setPinInitVaule:
;; =============== function _setPinInitVaule ends ============

	signat	_setPinInitVaule,88
	global	_initPin
psect	text934,local,class=CODE,delta=2
global __ptext934
__ptext934:

;; *************** function _initPin *****************
;; Defined at:
;;		line 268 in file "D:\develop\190625\AK7030-OTP\main.c"
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
psect	text934
	file	"D:\develop\190625\AK7030-OTP\main.c"
	line	268
	global	__size_of_initPin
	__size_of_initPin	equ	__end_of_initPin-_initPin
	
_initPin:	
	opt	stack 4
; Regs used in _initPin: [wreg+status,2+status,0+pclath+cstack]
	line	270
	
l3636:	
;main.c: 270: initPB2_AsHighResistence();
	fcall	_initPB2_AsHighResistence
	line	272
	
l3638:	
;main.c: 272: initPB3(0);
	movlw	(0)
	fcall	_initPB3
	line	274
	
l3640:	
;main.c: 274: initPB4(0);
	movlw	(0)
	fcall	_initPB4
	line	276
	
l3642:	
;main.c: 276: initPB5(0);
	movlw	(0)
	fcall	_initPB5
	line	281
	
l716:	
	return
	opt stack 0
GLOBAL	__end_of_initPin
	__end_of_initPin:
;; =============== function _initPin ends ============

	signat	_initPin,88
	global	_AD_Sample
psect	text935,local,class=CODE,delta=2
global __ptext935
__ptext935:

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
;; Hardware stack levels required when called:    2
;; This function calls:
;;		Nothing
;; This function is called by:
;;		_process_AD_Converter_Value
;; This function uses a non-reentrant model
;;
psect	text935
	file	"D:\develop\190625\AK7030-OTP\common.c"
	line	286
	global	__size_of_AD_Sample
	__size_of_AD_Sample	equ	__end_of_AD_Sample-_AD_Sample
	
_AD_Sample:	
	opt	stack 4
; Regs used in _AD_Sample: [wreg+status,2+status,0]
	line	287
	
l3582:	
;common.c: 287: if(sampleTimes < 12)
	movlw	(0Ch)
	subwf	(_sampleTimes)^080h,w
	skipnc
	goto	u1191
	goto	u1190
u1191:
	goto	l1571
u1190:
	line	309
	
l3584:	
;common.c: 288: {
;common.c: 309: sampleTimes++;
	incf	(_sampleTimes)^080h,f
	line	311
	
l3586:	
;common.c: 311: if(sampleTimes >= 12)
	movlw	(0Ch)
	subwf	(_sampleTimes)^080h,w
	skipc
	goto	u1201
	goto	u1200
u1201:
	goto	l1571
u1200:
	line	313
	
l3588:	
;common.c: 312: {
;common.c: 313: sampleTimes = 0;
	clrf	(_sampleTimes)^080h
	line	315
	
l3590:	
;common.c: 315: if(sampleChannelSelect == 12)
	bcf	status, 5	;RP0=0, select bank0
	movf	(_sampleChannelSelect),w
	xorlw	0Ch
	skipz
	goto	u1211
	goto	u1210
u1211:
	goto	l3594
u1210:
	line	319
	
l3592:	
;common.c: 316: {
;common.c: 319: sampleChannelSelect = 13;
	movlw	(0Dh)
	movwf	(_sampleChannelSelect)
	line	320
;common.c: 320: }
	goto	l1571
	line	334
	
l3594:	
;common.c: 331: else
;common.c: 332: {
;common.c: 334: sampleChannelSelect = 12;
	movlw	(0Ch)
	movwf	(_sampleChannelSelect)
	line	342
	
l1571:	
	return
	opt stack 0
GLOBAL	__end_of_AD_Sample
	__end_of_AD_Sample:
;; =============== function _AD_Sample ends ============

	signat	_AD_Sample,88
	global	_setAD_ConvertFlag
psect	text936,local,class=CODE,delta=2
global __ptext936
__ptext936:

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
psect	text936
	file	"D:\develop\190625\AK7030-OTP\common.c"
	line	215
	global	__size_of_setAD_ConvertFlag
	__size_of_setAD_ConvertFlag	equ	__end_of_setAD_ConvertFlag-_setAD_ConvertFlag
	
_setAD_ConvertFlag:	
	opt	stack 4
; Regs used in _setAD_ConvertFlag: [wreg]
;setAD_ConvertFlag@flag stored from wreg
	bcf	status, 5	;RP0=0, select bank0
	movwf	(setAD_ConvertFlag@flag)
	line	216
	
l3580:	
;common.c: 216: adc_convert_flag = flag;
	movf	(setAD_ConvertFlag@flag),w
	bsf	status, 5	;RP0=1, select bank1
	movwf	(_adc_convert_flag)^080h
	line	217
	
l1549:	
	return
	opt stack 0
GLOBAL	__end_of_setAD_ConvertFlag
	__end_of_setAD_ConvertFlag:
;; =============== function _setAD_ConvertFlag ends ============

	signat	_setAD_ConvertFlag,4216
	global	_getAD_ConvertFlag
psect	text937,local,class=CODE,delta=2
global __ptext937
__ptext937:

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
psect	text937
	file	"D:\develop\190625\AK7030-OTP\common.c"
	line	209
	global	__size_of_getAD_ConvertFlag
	__size_of_getAD_ConvertFlag	equ	__end_of_getAD_ConvertFlag-_getAD_ConvertFlag
	
_getAD_ConvertFlag:	
	opt	stack 4
; Regs used in _getAD_ConvertFlag: [wreg]
	line	210
	
l3576:	
;common.c: 210: return adc_convert_flag;
	bsf	status, 5	;RP0=1, select bank1
	bcf	status, 6	;RP1=0, select bank1
	movf	(_adc_convert_flag)^080h,w
	line	211
	
l1546:	
	return
	opt stack 0
GLOBAL	__end_of_getAD_ConvertFlag
	__end_of_getAD_ConvertFlag:
;; =============== function _getAD_ConvertFlag ends ============

	signat	_getAD_ConvertFlag,89
	global	_Filter
psect	text938,local,class=CODE,delta=2
global __ptext938
__ptext938:

;; *************** function _Filter *****************
;; Defined at:
;;		line 60 in file "D:\develop\190625\AK7030-OTP\common.c"
;; Parameters:    Size  Location     Type
;;  tmpValue        2    0[BANK0 ] PTR int 
;;		 -> uiSampleChannelFourteenth(40), uiSampleChannelFourth(40), uiSampleChannelFirst(40), 
;; Auto vars:     Size  Location     Type
;;  cir             2   50[BANK0 ] int 
;;  filter_buf     40    6[BANK0 ] unsigned int [20]
;;  filter_sum      2   48[BANK0 ] unsigned int 
;;  filter_temp     2   46[BANK0 ] unsigned int 
;;  i               1   53[BANK0 ] unsigned char 
;;  j               1   52[BANK0 ] unsigned char 
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
;;      Locals:         0      48       0       0       0
;;      Temps:          0       4       0       0       0
;;      Totals:         0      54       0       0       0
;;Total ram usage:       54 bytes
;; Hardware stack levels used:    1
;; Hardware stack levels required when called:    2
;; This function calls:
;;		Nothing
;; This function is called by:
;;		_getAdOriginalCh12Value
;;		_getAdOriginalCh13Value
;; This function uses a non-reentrant model
;;
psect	text938
	file	"D:\develop\190625\AK7030-OTP\common.c"
	line	60
	global	__size_of_Filter
	__size_of_Filter	equ	__end_of_Filter-_Filter
	
_Filter:	
	opt	stack 4
; Regs used in _Filter: [wreg-fsr0h+status,2+status,0+btemp+1]
	line	62
	
l3480:	
	clrf	(Filter@j)
	line	64
;common.c: 64: unsigned int filter_temp = 0, filter_sum = 0;
	clrf	(Filter@filter_temp)
	clrf	(Filter@filter_temp+1)
	clrf	(Filter@filter_sum)
	clrf	(Filter@filter_sum+1)
	line	68
;common.c: 66: unsigned int filter_buf[20];
;common.c: 68: for(int cir = 0;cir < 20; cir++)
	clrf	(Filter@cir)
	clrf	(Filter@cir+1)
	line	69
	
l3486:	
;common.c: 69: filter_buf[cir] = *tmpValue++;
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
	
l3488:	
	movlw	02h
	addwf	(Filter@tmpValue),f
	skipnc
	incf	(Filter@tmpValue+1),f
	line	68
	
l3490:	
	incf	(Filter@cir),f
	skipnz
	incf	(Filter@cir+1),f
	
l3492:	
	movf	(Filter@cir+1),w
	xorlw	80h
	movwf	btemp+1
	movlw	(high(014h))^80h
	subwf	btemp+1,w
	skipz
	goto	u1075
	movlw	low(014h)
	subwf	(Filter@cir),w
u1075:

	skipc
	goto	u1071
	goto	u1070
u1071:
	goto	l3486
u1070:
	line	72
	
l3494:	
;common.c: 72: for(j = 0; j < 20 - 1; j++)
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	clrf	(Filter@j)
	line	74
	
l3500:	
;common.c: 73: {
;common.c: 74: for(i = 0; i < 20 - 1 - j; i++)
	clrf	(Filter@i)
	goto	l3508
	line	76
	
l3502:	
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
	goto	u1085
	movf	0+(??_Filter+0)+0,w
	subwf	0+(??_Filter+2)+0,w
u1085:
	skipnc
	goto	u1081
	goto	u1080
u1081:
	goto	l3506
u1080:
	line	79
	
l3504:	
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
	
l3506:	
	incf	(Filter@i),f
	
l3508:	
	movlw	high(013h)
	movwf	(??_Filter+0)+0+1
	movf	(Filter@j),w
	sublw	low(013h)
	movwf	(??_Filter+0)+0
	skipc
	decf	(??_Filter+0)+0+1,f
	movf	1+(??_Filter+0)+0,w
	xorlw	80h
	sublw	080h
	skipz
	goto	u1095
	movf	0+(??_Filter+0)+0,w
	subwf	(Filter@i),w
u1095:

	skipc
	goto	u1091
	goto	u1090
u1091:
	goto	l3502
u1090:
	line	72
	
l3510:	
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	incf	(Filter@j),f
	
l3512:	
	movlw	(013h)
	subwf	(Filter@j),w
	skipc
	goto	u1101
	goto	u1100
u1101:
	goto	l3500
u1100:
	line	88
	
l3514:	
;common.c: 84: }
;common.c: 85: }
;common.c: 86: }
;common.c: 88: for(i = 2; i < 20 - 2; i++)
	movlw	(02h)
	movwf	(Filter@i)
	line	90
	
l3518:	
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
	
l3520:	
	incf	(Filter@i),f
	
l3522:	
	movlw	(012h)
	subwf	(Filter@i),w
	skipc
	goto	u1111
	goto	u1110
u1111:
	goto	l3518
u1110:
	line	93
	
l3524:	
;common.c: 91: }
;common.c: 93: return (filter_sum >> 4);
	movf	(Filter@filter_sum+1),w
	movwf	(?_Filter+1)
	movf	(Filter@filter_sum),w
	movwf	(?_Filter)
	swapf	(?_Filter),f
	swapf	(?_Filter+1),f
	movlw	0fh
	andwf	(?_Filter),f
	movf	(?_Filter+1),w
	andlw	0f0h
	iorwf	(?_Filter),f
	movlw	0fh
	andwf	(?_Filter+1),f
	line	95
	
l1508:	
	return
	opt stack 0
GLOBAL	__end_of_Filter
	__end_of_Filter:
;; =============== function _Filter ends ============

	signat	_Filter,4218
	global	_isFinishedOneHoursTimer
psect	text939,local,class=CODE,delta=2
global __ptext939
__ptext939:

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
psect	text939
	file	"D:\develop\190625\AK7030-OTP\common.c"
	line	507
	global	__size_of_isFinishedOneHoursTimer
	__size_of_isFinishedOneHoursTimer	equ	__end_of_isFinishedOneHoursTimer-_isFinishedOneHoursTimer
	
_isFinishedOneHoursTimer:	
	opt	stack 5
; Regs used in _isFinishedOneHoursTimer: [wreg+status,2+status,0]
	line	508
	
l3464:	
;common.c: 508: if((uiOneHourTimer == 0) && bOneHourTimerStartFlag)
	bsf	status, 5	;RP0=1, select bank1
	movf	((_uiOneHourTimer+1)^080h),w
	iorwf	((_uiOneHourTimer)^080h),w
	skipz
	goto	u1051
	goto	u1050
u1051:
	goto	l3476
u1050:
	
l3466:	
	movf	(_bOneHourTimerStartFlag)^080h,w
	skipz
	goto	u1060
	goto	l3476
u1060:
	line	510
	
l3468:	
;common.c: 509: {
;common.c: 510: bOneHourTimerStartFlag = 0;
	clrf	(_bOneHourTimerStartFlag)^080h
	line	511
	
l3470:	
;common.c: 511: return 1;
	movlw	(01h)
	goto	l1633
	line	514
	
l3476:	
;common.c: 513: else
;common.c: 514: return 0;
	movlw	(0)
	line	515
	
l1633:	
	return
	opt stack 0
GLOBAL	__end_of_isFinishedOneHoursTimer
	__end_of_isFinishedOneHoursTimer:
;; =============== function _isFinishedOneHoursTimer ends ============

	signat	_isFinishedOneHoursTimer,89
	global	_startOneHoursTimer
psect	text940,local,class=CODE,delta=2
global __ptext940
__ptext940:

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
psect	text940
	file	"D:\develop\190625\AK7030-OTP\common.c"
	line	424
	global	__size_of_startOneHoursTimer
	__size_of_startOneHoursTimer	equ	__end_of_startOneHoursTimer-_startOneHoursTimer
	
_startOneHoursTimer:	
	opt	stack 5
; Regs used in _startOneHoursTimer: [wreg+status,2+status,0]
	line	425
	
l3456:	
;common.c: 425: if(( 0 == uiOneHourTimer ) && ( 0 == bOneHourTimerStartFlag ))
	bsf	status, 5	;RP0=1, select bank1
	movf	((_uiOneHourTimer+1)^080h),w
	iorwf	((_uiOneHourTimer)^080h),w
	skipz
	goto	u1031
	goto	u1030
u1031:
	goto	l1601
u1030:
	
l3458:	
	movf	(_bOneHourTimerStartFlag)^080h,f
	skipz
	goto	u1041
	goto	u1040
u1041:
	goto	l1601
u1040:
	line	427
	
l3460:	
;common.c: 426: {
;common.c: 427: uiOneHourTimer = uiSetTime;
	bcf	status, 5	;RP0=0, select bank0
	movf	(startOneHoursTimer@uiSetTime+1),w
	bsf	status, 5	;RP0=1, select bank1
	movwf	(_uiOneHourTimer+1)^080h
	bcf	status, 5	;RP0=0, select bank0
	movf	(startOneHoursTimer@uiSetTime),w
	bsf	status, 5	;RP0=1, select bank1
	movwf	(_uiOneHourTimer)^080h
	line	428
	
l3462:	
;common.c: 428: bOneHourTimerStartFlag = 1;
	clrf	(_bOneHourTimerStartFlag)^080h
	incf	(_bOneHourTimerStartFlag)^080h,f
	line	434
	
l1601:	
	return
	opt stack 0
GLOBAL	__end_of_startOneHoursTimer
	__end_of_startOneHoursTimer:
;; =============== function _startOneHoursTimer ends ============

	signat	_startOneHoursTimer,4216
	global	_isFinishedThreeHoursTimer
psect	text941,local,class=CODE,delta=2
global __ptext941
__ptext941:

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
psect	text941
	file	"D:\develop\190625\AK7030-OTP\common.c"
	line	494
	global	__size_of_isFinishedThreeHoursTimer
	__size_of_isFinishedThreeHoursTimer	equ	__end_of_isFinishedThreeHoursTimer-_isFinishedThreeHoursTimer
	
_isFinishedThreeHoursTimer:	
	opt	stack 5
; Regs used in _isFinishedThreeHoursTimer: [wreg+status,2+status,0]
	line	495
	
l3440:	
;common.c: 495: if((uiSmallTimer == 0) && bSmallTimerStartFlag)
	bsf	status, 5	;RP0=1, select bank1
	movf	((_uiSmallTimer+1)^080h),w
	iorwf	((_uiSmallTimer)^080h),w
	skipz
	goto	u1011
	goto	u1010
u1011:
	goto	l3452
u1010:
	
l3442:	
	movf	(_bSmallTimerStartFlag)^080h,w
	skipz
	goto	u1020
	goto	l3452
u1020:
	line	497
	
l3444:	
;common.c: 496: {
;common.c: 497: bSmallTimerStartFlag = 0;
	clrf	(_bSmallTimerStartFlag)^080h
	line	498
	
l3446:	
;common.c: 498: return 1;
	movlw	(01h)
	goto	l1628
	line	501
	
l3452:	
;common.c: 500: else
;common.c: 501: return 0;
	movlw	(0)
	line	502
	
l1628:	
	return
	opt stack 0
GLOBAL	__end_of_isFinishedThreeHoursTimer
	__end_of_isFinishedThreeHoursTimer:
;; =============== function _isFinishedThreeHoursTimer ends ============

	signat	_isFinishedThreeHoursTimer,89
	global	_startThreeHoursTimer
psect	text942,local,class=CODE,delta=2
global __ptext942
__ptext942:

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
psect	text942
	file	"D:\develop\190625\AK7030-OTP\common.c"
	line	411
	global	__size_of_startThreeHoursTimer
	__size_of_startThreeHoursTimer	equ	__end_of_startThreeHoursTimer-_startThreeHoursTimer
	
_startThreeHoursTimer:	
	opt	stack 5
; Regs used in _startThreeHoursTimer: [wreg+status,2+status,0]
	line	412
	
l3432:	
;common.c: 412: if(( 0 == uiSmallTimer ) && ( 0 == bSmallTimerStartFlag ))
	bsf	status, 5	;RP0=1, select bank1
	movf	((_uiSmallTimer+1)^080h),w
	iorwf	((_uiSmallTimer)^080h),w
	skipz
	goto	u991
	goto	u990
u991:
	goto	l1597
u990:
	
l3434:	
	movf	(_bSmallTimerStartFlag)^080h,f
	skipz
	goto	u1001
	goto	u1000
u1001:
	goto	l1597
u1000:
	line	414
	
l3436:	
;common.c: 413: {
;common.c: 414: uiSmallTimer = uiSetTime;
	bcf	status, 5	;RP0=0, select bank0
	movf	(startThreeHoursTimer@uiSetTime+1),w
	bsf	status, 5	;RP0=1, select bank1
	movwf	(_uiSmallTimer+1)^080h
	bcf	status, 5	;RP0=0, select bank0
	movf	(startThreeHoursTimer@uiSetTime),w
	bsf	status, 5	;RP0=1, select bank1
	movwf	(_uiSmallTimer)^080h
	line	415
	
l3438:	
;common.c: 415: bSmallTimerStartFlag = 1;
	clrf	(_bSmallTimerStartFlag)^080h
	incf	(_bSmallTimerStartFlag)^080h,f
	line	421
	
l1597:	
	return
	opt stack 0
GLOBAL	__end_of_startThreeHoursTimer
	__end_of_startThreeHoursTimer:
;; =============== function _startThreeHoursTimer ends ============

	signat	_startThreeHoursTimer,4216
	global	_isFinishedTwelveHoursTimer
psect	text943,local,class=CODE,delta=2
global __ptext943
__ptext943:

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
psect	text943
	file	"D:\develop\190625\AK7030-OTP\common.c"
	line	483
	global	__size_of_isFinishedTwelveHoursTimer
	__size_of_isFinishedTwelveHoursTimer	equ	__end_of_isFinishedTwelveHoursTimer-_isFinishedTwelveHoursTimer
	
_isFinishedTwelveHoursTimer:	
	opt	stack 5
; Regs used in _isFinishedTwelveHoursTimer: [wreg+status,2+status,0]
	line	484
	
l3416:	
;common.c: 484: if(( uiBigTimer == 0 ) && bBigTimerStartFlag )
	bsf	status, 5	;RP0=1, select bank1
	movf	((_uiBigTimer+1)^080h),w
	iorwf	((_uiBigTimer)^080h),w
	skipz
	goto	u971
	goto	u970
u971:
	goto	l3428
u970:
	
l3418:	
	movf	(_bBigTimerStartFlag)^080h,w
	skipz
	goto	u980
	goto	l3428
u980:
	line	486
	
l3420:	
;common.c: 485: {
;common.c: 486: bBigTimerStartFlag = 0;
	clrf	(_bBigTimerStartFlag)^080h
	line	487
	
l3422:	
;common.c: 487: return 1;
	movlw	(01h)
	goto	l1623
	line	490
	
l3428:	
;common.c: 489: else
;common.c: 490: return 0;
	movlw	(0)
	line	491
	
l1623:	
	return
	opt stack 0
GLOBAL	__end_of_isFinishedTwelveHoursTimer
	__end_of_isFinishedTwelveHoursTimer:
;; =============== function _isFinishedTwelveHoursTimer ends ============

	signat	_isFinishedTwelveHoursTimer,89
	global	_startTwelveHourTimer
psect	text944,local,class=CODE,delta=2
global __ptext944
__ptext944:

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
;;		On exit  : 160/20
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
psect	text944
	file	"D:\develop\190625\AK7030-OTP\common.c"
	line	363
	global	__size_of_startTwelveHourTimer
	__size_of_startTwelveHourTimer	equ	__end_of_startTwelveHourTimer-_startTwelveHourTimer
	
_startTwelveHourTimer:	
	opt	stack 5
; Regs used in _startTwelveHourTimer: [wreg+status,2+status,0]
	line	364
	
l3408:	
;common.c: 364: if((0 == uiBigTimer) && ( 0 == bBigTimerStartFlag))
	bsf	status, 5	;RP0=1, select bank1
	movf	((_uiBigTimer+1)^080h),w
	iorwf	((_uiBigTimer)^080h),w
	skipz
	goto	u951
	goto	u950
u951:
	goto	l1578
u950:
	
l3410:	
	movf	(_bBigTimerStartFlag)^080h,f
	skipz
	goto	u961
	goto	u960
u961:
	goto	l1578
u960:
	line	366
	
l3412:	
;common.c: 365: {
;common.c: 366: uiBigTimer = uiSetTime;
	bcf	status, 5	;RP0=0, select bank0
	movf	(startTwelveHourTimer@uiSetTime+1),w
	bsf	status, 5	;RP0=1, select bank1
	movwf	(_uiBigTimer+1)^080h
	bcf	status, 5	;RP0=0, select bank0
	movf	(startTwelveHourTimer@uiSetTime),w
	bsf	status, 5	;RP0=1, select bank1
	movwf	(_uiBigTimer)^080h
	line	367
	
l3414:	
;common.c: 367: bBigTimerStartFlag = 1;
	clrf	(_bBigTimerStartFlag)^080h
	incf	(_bBigTimerStartFlag)^080h,f
	line	374
	
l1578:	
	return
	opt stack 0
GLOBAL	__end_of_startTwelveHourTimer
	__end_of_startTwelveHourTimer:
;; =============== function _startTwelveHourTimer ends ============

	signat	_startTwelveHourTimer,4216
	global	_clearTwentyMinTimer
psect	text945,local,class=CODE,delta=2
global __ptext945
__ptext945:

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
psect	text945
	file	"D:\develop\190625\AK7030-OTP\common.c"
	line	404
	global	__size_of_clearTwentyMinTimer
	__size_of_clearTwentyMinTimer	equ	__end_of_clearTwentyMinTimer-_clearTwentyMinTimer
	
_clearTwentyMinTimer:	
	opt	stack 5
; Regs used in _clearTwentyMinTimer: [status,2]
	line	405
	
l3406:	
;common.c: 405: uiTwentyMinTimer = 0;
	bsf	status, 5	;RP0=1, select bank1
	clrf	(_uiTwentyMinTimer)^080h
	clrf	(_uiTwentyMinTimer+1)^080h
	line	406
;common.c: 406: bTwentyMinStartFlag = 0;
	clrf	(_bTwentyMinStartFlag)^080h
	line	407
	
l1593:	
	return
	opt stack 0
GLOBAL	__end_of_clearTwentyMinTimer
	__end_of_clearTwentyMinTimer:
;; =============== function _clearTwentyMinTimer ends ============

	signat	_clearTwentyMinTimer,88
	global	_isFinishedTwentyMinTimer
psect	text946,local,class=CODE,delta=2
global __ptext946
__ptext946:

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
psect	text946
	file	"D:\develop\190625\AK7030-OTP\common.c"
	line	459
	global	__size_of_isFinishedTwentyMinTimer
	__size_of_isFinishedTwentyMinTimer	equ	__end_of_isFinishedTwentyMinTimer-_isFinishedTwentyMinTimer
	
_isFinishedTwentyMinTimer:	
	opt	stack 5
; Regs used in _isFinishedTwentyMinTimer: [wreg+status,2+status,0]
	line	460
	
l3390:	
;common.c: 460: if(( 0 == uiTwentyMinTimer ) && bTwentyMinStartFlag )
	bsf	status, 5	;RP0=1, select bank1
	movf	((_uiTwentyMinTimer+1)^080h),w
	iorwf	((_uiTwentyMinTimer)^080h),w
	skipz
	goto	u931
	goto	u930
u931:
	goto	l3402
u930:
	
l3392:	
	movf	(_bTwentyMinStartFlag)^080h,w
	skipz
	goto	u940
	goto	l3402
u940:
	line	462
	
l3394:	
;common.c: 461: {
;common.c: 462: bTwentyMinStartFlag = 0;
	clrf	(_bTwentyMinStartFlag)^080h
	line	463
	
l3396:	
;common.c: 463: return 1;
	movlw	(01h)
	goto	l1613
	line	466
	
l3402:	
;common.c: 465: else
;common.c: 466: return 0;
	movlw	(0)
	line	467
	
l1613:	
	return
	opt stack 0
GLOBAL	__end_of_isFinishedTwentyMinTimer
	__end_of_isFinishedTwentyMinTimer:
;; =============== function _isFinishedTwentyMinTimer ends ============

	signat	_isFinishedTwentyMinTimer,89
	global	_clrSampeTime
psect	text947,local,class=CODE,delta=2
global __ptext947
__ptext947:

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
psect	text947
	file	"D:\develop\190625\AK7030-OTP\common.c"
	line	529
	global	__size_of_clrSampeTime
	__size_of_clrSampeTime	equ	__end_of_clrSampeTime-_clrSampeTime
	
_clrSampeTime:	
	opt	stack 5
; Regs used in _clrSampeTime: [status,2]
	line	530
	
l3388:	
;common.c: 530: timer.timer10msStopWatch = 0;
	clrf	(_timer)^080h
	line	531
	
l1642:	
	return
	opt stack 0
GLOBAL	__end_of_clrSampeTime
	__end_of_clrSampeTime:
;; =============== function _clrSampeTime ends ============

	signat	_clrSampeTime,88
	global	_isPermitSampleTime
psect	text948,local,class=CODE,delta=2
global __ptext948
__ptext948:

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
psect	text948
	file	"D:\develop\190625\AK7030-OTP\common.c"
	line	519
	global	__size_of_isPermitSampleTime
	__size_of_isPermitSampleTime	equ	__end_of_isPermitSampleTime-_isPermitSampleTime
	
_isPermitSampleTime:	
	opt	stack 5
; Regs used in _isPermitSampleTime: [wreg]
	line	520
	
l3376:	
;common.c: 520: if(timer.timer10msStopWatch >= 10)
	movlw	(0Ah)
	bsf	status, 5	;RP0=1, select bank1
	subwf	(_timer)^080h,w
	skipc
	goto	u921
	goto	u920
u921:
	goto	l3384
u920:
	line	522
	
l3378:	
;common.c: 521: {
;common.c: 522: return 1;
	movlw	(01h)
	goto	l1638
	line	525
	
l3384:	
;common.c: 524: else
;common.c: 525: return 0;
	movlw	(0)
	line	526
	
l1638:	
	return
	opt stack 0
GLOBAL	__end_of_isPermitSampleTime
	__end_of_isPermitSampleTime:
;; =============== function _isPermitSampleTime ends ============

	signat	_isPermitSampleTime,89
	global	_startTwentyMinTimer
psect	text949,local,class=CODE,delta=2
global __ptext949
__ptext949:

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
;;		On exit  : 17F/20
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
psect	text949
	file	"D:\develop\190625\AK7030-OTP\common.c"
	line	449
	global	__size_of_startTwentyMinTimer
	__size_of_startTwentyMinTimer	equ	__end_of_startTwentyMinTimer-_startTwentyMinTimer
	
_startTwentyMinTimer:	
	opt	stack 5
; Regs used in _startTwentyMinTimer: [wreg+status,2+status,0]
	line	450
	
l3368:	
;common.c: 450: if(( 0 == uiTwentyMinTimer) && ( 0 == bTwentyMinStartFlag))
	bsf	status, 5	;RP0=1, select bank1
	movf	((_uiTwentyMinTimer+1)^080h),w
	iorwf	((_uiTwentyMinTimer)^080h),w
	skipz
	goto	u901
	goto	u900
u901:
	goto	l1609
u900:
	
l3370:	
	movf	(_bTwentyMinStartFlag)^080h,f
	skipz
	goto	u911
	goto	u910
u911:
	goto	l1609
u910:
	line	452
	
l3372:	
;common.c: 451: {
;common.c: 452: uiTwentyMinTimer = uiSetValue;
	bcf	status, 5	;RP0=0, select bank0
	movf	(startTwentyMinTimer@uiSetValue+1),w
	bsf	status, 5	;RP0=1, select bank1
	movwf	(_uiTwentyMinTimer+1)^080h
	bcf	status, 5	;RP0=0, select bank0
	movf	(startTwentyMinTimer@uiSetValue),w
	bsf	status, 5	;RP0=1, select bank1
	movwf	(_uiTwentyMinTimer)^080h
	line	453
	
l3374:	
;common.c: 453: bTwentyMinStartFlag = 1;
	clrf	(_bTwentyMinStartFlag)^080h
	incf	(_bTwentyMinStartFlag)^080h,f
	line	455
	
l1609:	
	return
	opt stack 0
GLOBAL	__end_of_startTwentyMinTimer
	__end_of_startTwentyMinTimer:
;; =============== function _startTwentyMinTimer ends ============

	signat	_startTwentyMinTimer,4216
	global	_adc_start
psect	text950,local,class=CODE,delta=2
global __ptext950
__ptext950:

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
psect	text950
	file	"D:\develop\190625\AK7030-OTP\periph.c"
	line	100
	global	__size_of_adc_start
	__size_of_adc_start	equ	__end_of_adc_start-_adc_start
	
_adc_start:	
	opt	stack 4
; Regs used in _adc_start: []
	line	101
	
l3366:	
;periph.c: 101: GO=1;
	bcf	status, 5	;RP0=0, select bank0
	bsf	(249/8),(249)&7
	line	102
	
l2310:	
	return
	opt stack 0
GLOBAL	__end_of_adc_start
	__end_of_adc_start:
;; =============== function _adc_start ends ============

	signat	_adc_start,88
	global	_adc_test_init
psect	text951,local,class=CODE,delta=2
global __ptext951
__ptext951:

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
psect	text951
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
	
l3356:	
;periph.c: 86: ADCON0 = 0x00;
	clrf	(31)	;volatile
	line	87
	
l3358:	
;periph.c: 87: ADCON0|=channel<<2;
	movf	(adc_test_init@channel),w
	movwf	(??_adc_test_init+0)+0
	clrc
	rlf	(??_adc_test_init+0)+0,f
	clrc
	rlf	(??_adc_test_init+0)+0,w
	iorwf	(31),f	;volatile
	line	88
	
l3360:	
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
	
l3362:	
;periph.c: 89: ADON=1;
	bcf	status, 5	;RP0=0, select bank0
	bsf	(248/8),(248)&7
	line	90
	
l3364:	
;periph.c: 90: ADIE=1;
	bsf	status, 5	;RP0=1, select bank1
	bsf	(1130/8)^080h,(1130)&7
	line	91
	
l2304:	
	return
	opt stack 0
GLOBAL	__end_of_adc_test_init
	__end_of_adc_test_init:
;; =============== function _adc_test_init ends ============

	signat	_adc_test_init,8312
	global	_timer1_interrupt_config
psect	text952,local,class=CODE,delta=2
global __ptext952
__ptext952:

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
psect	text952
	file	"D:\develop\190625\AK7030-OTP\common.c"
	line	201
	global	__size_of_timer1_interrupt_config
	__size_of_timer1_interrupt_config	equ	__end_of_timer1_interrupt_config-_timer1_interrupt_config
	
_timer1_interrupt_config:	
	opt	stack 5
; Regs used in _timer1_interrupt_config: []
	line	202
	
l3354:	
;common.c: 202: GIE = 1;
	bsf	(95/8),(95)&7
	line	203
;common.c: 203: PEIE = 1;
	bsf	(94/8),(94)&7
	line	204
	
l1543:	
	return
	opt stack 0
GLOBAL	__end_of_timer1_interrupt_config
	__end_of_timer1_interrupt_config:
;; =============== function _timer1_interrupt_config ends ============

	signat	_timer1_interrupt_config,88
	global	_timer1_config
psect	text953,local,class=CODE,delta=2
global __ptext953
__ptext953:

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
psect	text953
	file	"D:\develop\190625\AK7030-OTP\common.c"
	line	189
	global	__size_of_timer1_config
	__size_of_timer1_config	equ	__end_of_timer1_config-_timer1_config
	
_timer1_config:	
	opt	stack 5
; Regs used in _timer1_config: [wreg]
	line	191
	
l3350:	
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
	
l3352:	
;common.c: 194: TMR1IE=1;
	bsf	status, 5	;RP0=1, select bank1
	bsf	(1120/8)^080h,(1120)&7
	line	196
	
l1540:	
	return
	opt stack 0
GLOBAL	__end_of_timer1_config
	__end_of_timer1_config:
;; =============== function _timer1_config ends ============

	signat	_timer1_config,88
	global	_clock_config
psect	text954,local,class=CODE,delta=2
global __ptext954
__ptext954:

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
psect	text954
	file	"D:\develop\190625\AK7030-OTP\common.c"
	line	181
	global	__size_of_clock_config
	__size_of_clock_config	equ	__end_of_clock_config-_clock_config
	
_clock_config:	
	opt	stack 5
; Regs used in _clock_config: [wreg+status,2]
	line	183
	
l3346:	
;common.c: 183: CLKPR = 0x80;
	movlw	(080h)
	bcf	status, 5	;RP0=0, select bank2
	bsf	status, 6	;RP1=1, select bank2
	movwf	(264)^0100h	;volatile
	line	184
	
l3348:	
;common.c: 184: CLKPR = 0x00;
	clrf	(264)^0100h	;volatile
	line	185
;common.c: 185: while(CLKPCE);
	
l1534:	
	btfsc	(2119/8)^0100h,(2119)&7
	goto	u891
	goto	u890
u891:
	goto	l1534
u890:
	line	186
	
l1537:	
	return
	opt stack 0
GLOBAL	__end_of_clock_config
	__end_of_clock_config:
;; =============== function _clock_config ends ============

	signat	_clock_config,88
	global	_reset
psect	text955,local,class=CODE,delta=2
global __ptext955
__ptext955:

;; *************** function _reset *****************
;; Defined at:
;;		line 306 in file "D:\develop\190625\AK7030-OTP\main.c"
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
psect	text955
	file	"D:\develop\190625\AK7030-OTP\main.c"
	line	306
	global	__size_of_reset
	__size_of_reset	equ	__end_of_reset-_reset
	
_reset:	
	opt	stack 5
; Regs used in _reset: []
	line	308
;main.c: 308: while(1);
	
l725:	
	goto	l725
	return
	opt stack 0
psect	text956,local,class=CODE,delta=2
global __ptext956
__ptext956:
	line	312
GLOBAL	__end_of_reset
	__end_of_reset:
;; =============== function _reset ends ============

	signat	_reset,88
	global	_selectAdChannel

;; *************** function _selectAdChannel *****************
;; Defined at:
;;		line 295 in file "D:\develop\190625\AK7030-OTP\main.c"
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
psect	text956
	file	"D:\develop\190625\AK7030-OTP\main.c"
	line	295
	global	__size_of_selectAdChannel
	__size_of_selectAdChannel	equ	__end_of_selectAdChannel-_selectAdChannel
	
_selectAdChannel:	
	opt	stack 5
; Regs used in _selectAdChannel: []
	line	297
	
l3344:	
;main.c: 297: TRISB0 = 1;
	bsf	status, 5	;RP0=1, select bank1
	bsf	(1072/8)^080h,(1072)&7
	line	298
;main.c: 298: TRISB1 = 1;
	bsf	(1073/8)^080h,(1073)&7
	line	302
	
l722:	
	return
	opt stack 0
GLOBAL	__end_of_selectAdChannel
	__end_of_selectAdChannel:
;; =============== function _selectAdChannel ends ============

	signat	_selectAdChannel,88
	global	_pwm_start
psect	text957,local,class=CODE,delta=2
global __ptext957
__ptext957:

;; *************** function _pwm_start *****************
;; Defined at:
;;		line 243 in file "D:\develop\190625\AK7030-OTP\main.c"
;; Parameters:    Size  Location     Type
;;  ucPulseWidth    1    wreg     unsigned char 
;; Auto vars:     Size  Location     Type
;;  ucPulseWidth    1    0[BANK0 ] unsigned char 
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
psect	text957
	file	"D:\develop\190625\AK7030-OTP\main.c"
	line	243
	global	__size_of_pwm_start
	__size_of_pwm_start	equ	__end_of_pwm_start-_pwm_start
	
_pwm_start:	
	opt	stack 5
; Regs used in _pwm_start: [wreg+status,2+status,0]
;pwm_start@ucPulseWidth stored from wreg
	line	245
	movwf	(pwm_start@ucPulseWidth)
	
l3328:	
;main.c: 245: CCP1CON&= 0xf0;
	movlw	(0F0h)
	andwf	(23),f	;volatile
	line	247
	
l3330:	
;main.c: 247: T2CON=0x04;
	movlw	(04h)
	movwf	(18)	;volatile
	line	248
	
l3332:	
;main.c: 248: PR2 = 99;
	movlw	(063h)
	bsf	status, 5	;RP0=1, select bank1
	movwf	(146)^080h	;volatile
	line	249
	
l3334:	
;main.c: 249: CCPR1L = ucPulseWidth;
	bcf	status, 5	;RP0=0, select bank0
	movf	(pwm_start@ucPulseWidth),w
	movwf	(21)	;volatile
	line	250
	
l3336:	
;main.c: 250: CCP1CON=0x00;
	clrf	(23)	;volatile
	line	252
	
l3338:	
;main.c: 252: TRISB2=0;
	bsf	status, 5	;RP0=1, select bank1
	bcf	(1074/8)^080h,(1074)&7
	line	253
	
l3340:	
;main.c: 253: PBOD2 = 0;
	bsf	status, 6	;RP1=1, select bank3
	bcf	(3138/8)^0180h,(3138)&7
	line	255
	
l3342:	
;main.c: 255: CCP1CON|= 0x0c;
	movlw	(0Ch)
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	iorwf	(23),f	;volatile
	line	264
	
l713:	
	return
	opt stack 0
GLOBAL	__end_of_pwm_start
	__end_of_pwm_start:
;; =============== function _pwm_start ends ============

	signat	_pwm_start,4216
	global	_initPB2_AsHighResistence
psect	text958,local,class=CODE,delta=2
global __ptext958
__ptext958:

;; *************** function _initPB2_AsHighResistence *****************
;; Defined at:
;;		line 231 in file "D:\develop\190625\AK7030-OTP\main.c"
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
psect	text958
	file	"D:\develop\190625\AK7030-OTP\main.c"
	line	231
	global	__size_of_initPB2_AsHighResistence
	__size_of_initPB2_AsHighResistence	equ	__end_of_initPB2_AsHighResistence-_initPB2_AsHighResistence
	
_initPB2_AsHighResistence:	
	opt	stack 4
; Regs used in _initPB2_AsHighResistence: []
	line	233
	
l3326:	
;main.c: 233: PB2 = 1;
	bsf	(50/8),(50)&7
	line	234
;main.c: 234: PBOD2 = 1;
	bsf	status, 5	;RP0=1, select bank3
	bsf	status, 6	;RP1=1, select bank3
	bsf	(3138/8)^0180h,(3138)&7
	line	238
	
l710:	
	return
	opt stack 0
GLOBAL	__end_of_initPB2_AsHighResistence
	__end_of_initPB2_AsHighResistence:
;; =============== function _initPB2_AsHighResistence ends ============

	signat	_initPB2_AsHighResistence,88
	global	_setPB5
psect	text959,local,class=CODE,delta=2
global __ptext959
__ptext959:

;; *************** function _setPB5 *****************
;; Defined at:
;;		line 214 in file "D:\develop\190625\AK7030-OTP\main.c"
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
psect	text959
	file	"D:\develop\190625\AK7030-OTP\main.c"
	line	214
	global	__size_of_setPB5
	__size_of_setPB5	equ	__end_of_setPB5-_setPB5
	
_setPB5:	
	opt	stack 5
; Regs used in _setPB5: [wreg]
;setPB5@bValue stored from wreg
	movwf	(setPB5@bValue)
	line	215
	
l3322:	
;main.c: 215: if( bValue )
	movf	(setPB5@bValue),w
	skipz
	goto	u880
	goto	l705
u880:
	line	217
	
l3324:	
;main.c: 217: PB5 = 1;
	bsf	(53/8),(53)&7
	goto	l707
	line	221
	
l705:	
	line	223
;main.c: 221: else
;main.c: 223: PB5= 0;
	bcf	(53/8),(53)&7
	line	227
	
l707:	
	return
	opt stack 0
GLOBAL	__end_of_setPB5
	__end_of_setPB5:
;; =============== function _setPB5 ends ============

	signat	_setPB5,4216
	global	_initPB5
psect	text960,local,class=CODE,delta=2
global __ptext960
__ptext960:

;; *************** function _initPB5 *****************
;; Defined at:
;;		line 197 in file "D:\develop\190625\AK7030-OTP\main.c"
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
psect	text960
	file	"D:\develop\190625\AK7030-OTP\main.c"
	line	197
	global	__size_of_initPB5
	__size_of_initPB5	equ	__end_of_initPB5-_initPB5
	
_initPB5:	
	opt	stack 4
; Regs used in _initPB5: [wreg]
;initPB5@bValue stored from wreg
	bcf	status, 5	;RP0=0, select bank0
	movwf	(initPB5@bValue)
	line	198
	
l3318:	
;main.c: 198: if( bValue )
	movf	(initPB5@bValue),w
	skipz
	goto	u870
	goto	l700
u870:
	line	200
	
l3320:	
;main.c: 200: TRISB5 = 1;
	bsf	status, 5	;RP0=1, select bank1
	bsf	(1077/8)^080h,(1077)&7
	goto	l702
	line	204
	
l700:	
	line	206
;main.c: 204: else
;main.c: 206: TRISB5= 0;
	bsf	status, 5	;RP0=1, select bank1
	bcf	(1077/8)^080h,(1077)&7
	line	210
	
l702:	
	return
	opt stack 0
GLOBAL	__end_of_initPB5
	__end_of_initPB5:
;; =============== function _initPB5 ends ============

	signat	_initPB5,4216
	global	_setPB4
psect	text961,local,class=CODE,delta=2
global __ptext961
__ptext961:

;; *************** function _setPB4 *****************
;; Defined at:
;;		line 180 in file "D:\develop\190625\AK7030-OTP\main.c"
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
psect	text961
	file	"D:\develop\190625\AK7030-OTP\main.c"
	line	180
	global	__size_of_setPB4
	__size_of_setPB4	equ	__end_of_setPB4-_setPB4
	
_setPB4:	
	opt	stack 5
; Regs used in _setPB4: [wreg]
;setPB4@bValue stored from wreg
	movwf	(setPB4@bValue)
	line	181
	
l3314:	
;main.c: 181: if( bValue )
	movf	(setPB4@bValue),w
	skipz
	goto	u860
	goto	l695
u860:
	line	183
	
l3316:	
;main.c: 183: PB4 = 1;
	bsf	(52/8),(52)&7
	goto	l697
	line	187
	
l695:	
	line	189
;main.c: 187: else
;main.c: 189: PB4= 0;
	bcf	(52/8),(52)&7
	line	193
	
l697:	
	return
	opt stack 0
GLOBAL	__end_of_setPB4
	__end_of_setPB4:
;; =============== function _setPB4 ends ============

	signat	_setPB4,4216
	global	_initPB4
psect	text962,local,class=CODE,delta=2
global __ptext962
__ptext962:

;; *************** function _initPB4 *****************
;; Defined at:
;;		line 163 in file "D:\develop\190625\AK7030-OTP\main.c"
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
psect	text962
	file	"D:\develop\190625\AK7030-OTP\main.c"
	line	163
	global	__size_of_initPB4
	__size_of_initPB4	equ	__end_of_initPB4-_initPB4
	
_initPB4:	
	opt	stack 4
; Regs used in _initPB4: [wreg]
;initPB4@bValue stored from wreg
	bcf	status, 5	;RP0=0, select bank0
	movwf	(initPB4@bValue)
	line	164
	
l3310:	
;main.c: 164: if( bValue )
	movf	(initPB4@bValue),w
	skipz
	goto	u850
	goto	l690
u850:
	line	166
	
l3312:	
;main.c: 166: TRISB4 = 1;
	bsf	status, 5	;RP0=1, select bank1
	bsf	(1076/8)^080h,(1076)&7
	goto	l692
	line	170
	
l690:	
	line	172
;main.c: 170: else
;main.c: 172: TRISB4= 0;
	bsf	status, 5	;RP0=1, select bank1
	bcf	(1076/8)^080h,(1076)&7
	line	176
	
l692:	
	return
	opt stack 0
GLOBAL	__end_of_initPB4
	__end_of_initPB4:
;; =============== function _initPB4 ends ============

	signat	_initPB4,4216
	global	_setPB3
psect	text963,local,class=CODE,delta=2
global __ptext963
__ptext963:

;; *************** function _setPB3 *****************
;; Defined at:
;;		line 145 in file "D:\develop\190625\AK7030-OTP\main.c"
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
;;		_setPinInitVaule
;;		_main
;; This function uses a non-reentrant model
;;
psect	text963
	file	"D:\develop\190625\AK7030-OTP\main.c"
	line	145
	global	__size_of_setPB3
	__size_of_setPB3	equ	__end_of_setPB3-_setPB3
	
_setPB3:	
	opt	stack 5
; Regs used in _setPB3: [wreg]
;setPB3@bValue stored from wreg
	bcf	status, 5	;RP0=0, select bank0
	movwf	(setPB3@bValue)
	line	146
	
l3306:	
;main.c: 146: if( bValue )
	movf	(setPB3@bValue),w
	skipz
	goto	u840
	goto	l685
u840:
	line	148
	
l3308:	
;main.c: 148: PB3 = 1;
	bsf	(51/8),(51)&7
	goto	l687
	line	152
	
l685:	
	line	154
;main.c: 152: else
;main.c: 154: PB3= 0;
	bcf	(51/8),(51)&7
	line	158
	
l687:	
	return
	opt stack 0
GLOBAL	__end_of_setPB3
	__end_of_setPB3:
;; =============== function _setPB3 ends ============

	signat	_setPB3,4216
	global	_initPB3
psect	text964,local,class=CODE,delta=2
global __ptext964
__ptext964:

;; *************** function _initPB3 *****************
;; Defined at:
;;		line 128 in file "D:\develop\190625\AK7030-OTP\main.c"
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
psect	text964
	file	"D:\develop\190625\AK7030-OTP\main.c"
	line	128
	global	__size_of_initPB3
	__size_of_initPB3	equ	__end_of_initPB3-_initPB3
	
_initPB3:	
	opt	stack 4
; Regs used in _initPB3: [wreg]
;initPB3@bValue stored from wreg
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	movwf	(initPB3@bValue)
	line	129
	
l3302:	
;main.c: 129: if( bValue )
	movf	(initPB3@bValue),w
	skipz
	goto	u830
	goto	l680
u830:
	line	131
	
l3304:	
;main.c: 131: TRISB3 = 1;
	bsf	status, 5	;RP0=1, select bank1
	bsf	(1075/8)^080h,(1075)&7
	goto	l682
	line	135
	
l680:	
	line	137
;main.c: 135: else
;main.c: 137: TRISB3 = 0;
	bsf	status, 5	;RP0=1, select bank1
	bcf	(1075/8)^080h,(1075)&7
	line	141
	
l682:	
	return
	opt stack 0
GLOBAL	__end_of_initPB3
	__end_of_initPB3:
;; =============== function _initPB3 ends ============

	signat	_initPB3,4216
	global	_clearThreeHoursTimer
psect	text965,local,class=CODE,delta=2
global __ptext965
__ptext965:

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
psect	text965
	file	"D:\develop\190625\AK7030-OTP\common.c"
	line	384
	global	__size_of_clearThreeHoursTimer
	__size_of_clearThreeHoursTimer	equ	__end_of_clearThreeHoursTimer-_clearThreeHoursTimer
	
_clearThreeHoursTimer:	
	opt	stack 5
; Regs used in _clearThreeHoursTimer: [status,2]
	line	385
	
l3300:	
;common.c: 385: uiSmallTimer = 0;
	bsf	status, 5	;RP0=1, select bank1
	clrf	(_uiSmallTimer)^080h
	clrf	(_uiSmallTimer+1)^080h
	line	386
;common.c: 386: bSmallTimerStartFlag = 0;
	clrf	(_bSmallTimerStartFlag)^080h
	line	387
	
l1584:	
	return
	opt stack 0
GLOBAL	__end_of_clearThreeHoursTimer
	__end_of_clearThreeHoursTimer:
;; =============== function _clearThreeHoursTimer ends ============

	signat	_clearThreeHoursTimer,88
	global	_clearTwelveHoursTimer
psect	text966,local,class=CODE,delta=2
global __ptext966
__ptext966:

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
psect	text966
	file	"D:\develop\190625\AK7030-OTP\common.c"
	line	377
	global	__size_of_clearTwelveHoursTimer
	__size_of_clearTwelveHoursTimer	equ	__end_of_clearTwelveHoursTimer-_clearTwelveHoursTimer
	
_clearTwelveHoursTimer:	
	opt	stack 5
; Regs used in _clearTwelveHoursTimer: [status,2]
	line	378
	
l3298:	
;common.c: 378: uiBigTimer = 0;
	bsf	status, 5	;RP0=1, select bank1
	clrf	(_uiBigTimer)^080h
	clrf	(_uiBigTimer+1)^080h
	line	379
;common.c: 379: bBigTimerStartFlag = 0;
	clrf	(_bBigTimerStartFlag)^080h
	line	380
	
l1581:	
	return
	opt stack 0
GLOBAL	__end_of_clearTwelveHoursTimer
	__end_of_clearTwelveHoursTimer:
;; =============== function _clearTwelveHoursTimer ends ============

	signat	_clearTwelveHoursTimer,88
	global	_ISR
psect	text967,local,class=CODE,delta=2
global __ptext967
__ptext967:

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
psect	text967
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
psect	text967
	line	537
	
i1l3596:	
;common.c: 535: static unsigned char ucTimer1sCnt = 0;
;common.c: 537: if(TMR1IF == 1)
	btfss	(96/8),(96)&7
	goto	u122_21
	goto	u122_20
u122_21:
	goto	i1l3618
u122_20:
	line	539
	
i1l3598:	
;common.c: 538: {
;common.c: 539: TMR1IF = 0 ;
	bcf	(96/8),(96)&7
	line	540
	
i1l3600:	
;common.c: 540: timer.timer10msStopWatch++;
	bsf	status, 5	;RP0=1, select bank1
	incf	(_timer)^080h,f
	line	541
;common.c: 541: ucTimer1sCnt++;
	incf	(ISR@ucTimer1sCnt)^080h,f
	line	543
	
i1l3602:	
;common.c: 543: if(ucTimer1sCnt >= 100)
	movlw	(064h)
	subwf	(ISR@ucTimer1sCnt)^080h,w
	skipc
	goto	u123_21
	goto	u123_20
u123_21:
	goto	i1l3618
u123_20:
	line	545
	
i1l3604:	
;common.c: 544: {
;common.c: 545: ucTimer1sCnt = 0;
	clrf	(ISR@ucTimer1sCnt)^080h
	line	546
	
i1l3606:	
;common.c: 546: if(uiBigTimer > 0)
	movf	(_uiBigTimer+1)^080h,w
	iorwf	(_uiBigTimer)^080h,w
	skipnz
	goto	u124_21
	goto	u124_20
u124_21:
	goto	i1l1649
u124_20:
	line	547
	
i1l3608:	
;common.c: 547: uiBigTimer--;
	movlw	low(01h)
	subwf	(_uiBigTimer)^080h,f
	movlw	high(01h)
	skipc
	decf	(_uiBigTimer+1)^080h,f
	subwf	(_uiBigTimer+1)^080h,f
	
i1l1649:	
	line	549
;common.c: 549: if(uiSmallTimer)
	movf	(_uiSmallTimer+1)^080h,w
	iorwf	(_uiSmallTimer)^080h,w
	skipnz
	goto	u125_21
	goto	u125_20
u125_21:
	goto	i1l1650
u125_20:
	line	550
	
i1l3610:	
;common.c: 550: uiSmallTimer--;
	movlw	low(01h)
	subwf	(_uiSmallTimer)^080h,f
	movlw	high(01h)
	skipc
	decf	(_uiSmallTimer+1)^080h,f
	subwf	(_uiSmallTimer+1)^080h,f
	
i1l1650:	
	line	552
;common.c: 552: if(uiTwentySecondsTimer)
	movf	(_uiTwentySecondsTimer+1)^080h,w
	iorwf	(_uiTwentySecondsTimer)^080h,w
	skipnz
	goto	u126_21
	goto	u126_20
u126_21:
	goto	i1l1651
u126_20:
	line	553
	
i1l3612:	
;common.c: 553: uiTwentySecondsTimer--;
	movlw	low(01h)
	subwf	(_uiTwentySecondsTimer)^080h,f
	movlw	high(01h)
	skipc
	decf	(_uiTwentySecondsTimer+1)^080h,f
	subwf	(_uiTwentySecondsTimer+1)^080h,f
	
i1l1651:	
	line	555
;common.c: 555: if(uiTwentyMinTimer)
	movf	(_uiTwentyMinTimer+1)^080h,w
	iorwf	(_uiTwentyMinTimer)^080h,w
	skipnz
	goto	u127_21
	goto	u127_20
u127_21:
	goto	i1l1652
u127_20:
	line	556
	
i1l3614:	
;common.c: 556: uiTwentyMinTimer--;
	movlw	low(01h)
	subwf	(_uiTwentyMinTimer)^080h,f
	movlw	high(01h)
	skipc
	decf	(_uiTwentyMinTimer+1)^080h,f
	subwf	(_uiTwentyMinTimer+1)^080h,f
	
i1l1652:	
	line	558
;common.c: 558: if( uiOneHourTimer )
	movf	(_uiOneHourTimer+1)^080h,w
	iorwf	(_uiOneHourTimer)^080h,w
	skipnz
	goto	u128_21
	goto	u128_20
u128_21:
	goto	i1l3618
u128_20:
	line	559
	
i1l3616:	
;common.c: 559: uiOneHourTimer--;
	movlw	low(01h)
	subwf	(_uiOneHourTimer)^080h,f
	movlw	high(01h)
	skipc
	decf	(_uiOneHourTimer+1)^080h,f
	subwf	(_uiOneHourTimer+1)^080h,f
	line	563
	
i1l3618:	
;common.c: 560: }
;common.c: 561: }
;common.c: 563: if(ADIF)
	bcf	status, 5	;RP0=0, select bank0
	btfss	(106/8),(106)&7
	goto	u129_21
	goto	u129_20
u129_21:
	goto	i1l1657
u129_20:
	line	566
	
i1l3620:	
;common.c: 564: {
;common.c: 566: ADIF=0;
	bcf	(106/8),(106)&7
	line	567
	
i1l3622:	
;common.c: 567: setAD_ConvertFlag(1);
	movlw	(01h)
	fcall	i1_setAD_ConvertFlag
	line	569
	
i1l3624:	
;common.c: 569: if(sampleChannelSelect == 12)
	bcf	status, 5	;RP0=0, select bank0
	movf	(_sampleChannelSelect),w
	xorlw	0Ch
	skipz
	goto	u130_21
	goto	u130_20
u130_21:
	goto	i1l3628
u130_20:
	line	573
	
i1l3626:	
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
	goto	i1l1657
	line	583
	
i1l3628:	
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
	
i1l1657:	
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
psect	text968,local,class=CODE,delta=2
global __ptext968
__ptext968:

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
psect	text968
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
	
i1l3634:	
;common.c: 216: adc_convert_flag = flag;
	movf	(i1setAD_ConvertFlag@flag),w
	bsf	status, 5	;RP0=1, select bank1
	movwf	(_adc_convert_flag)^080h
	line	217
	
i1l1549:	
	return
	opt stack 0
GLOBAL	__end_ofi1_setAD_ConvertFlag
	__end_ofi1_setAD_ConvertFlag:
;; =============== function i1_setAD_ConvertFlag ends ============

	signat	i1_setAD_ConvertFlag,88
	global	_adc_get
psect	text969,local,class=CODE,delta=2
global __ptext969
__ptext969:

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
psect	text969
	file	"D:\develop\190625\AK7030-OTP\periph.c"
	line	105
	global	__size_of_adc_get
	__size_of_adc_get	equ	__end_of_adc_get-_adc_get
	
_adc_get:	
	opt	stack 3
; Regs used in _adc_get: [wreg]
	line	107
	
i1l3630:	
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
	
i1l2313:	
	return
	opt stack 0
GLOBAL	__end_of_adc_get
	__end_of_adc_get:
;; =============== function _adc_get ends ============

	signat	_adc_get,90
	global	_vPutSampleDataIntoTable
psect	text970,local,class=CODE,delta=2
global __ptext970
__ptext970:

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
psect	text970
	file	"D:\develop\190625\AK7030-OTP\common.c"
	line	106
	global	__size_of_vPutSampleDataIntoTable
	__size_of_vPutSampleDataIntoTable	equ	__end_of_vPutSampleDataIntoTable-_vPutSampleDataIntoTable
	
_vPutSampleDataIntoTable:	
	opt	stack 3
; Regs used in _vPutSampleDataIntoTable: [wreg-fsr0h+status,2+status,0+btemp+1]
	line	114
	
i1l3528:	
;common.c: 108: static unsigned char ucChannelFirstLength = 0;
;common.c: 110: static unsigned char ucChannelFourthLength = 0;
;common.c: 112: static unsigned char ucChannelFourteenthLength = 0;
;common.c: 114: if(channel == 12)
	movf	(vPutSampleDataIntoTable@channel),w
	xorlw	0Ch
	skipz
	goto	u112_21
	goto	u112_20
u112_21:
	goto	i1l3540
u112_20:
	line	116
	
i1l3530:	
;common.c: 115: {
;common.c: 116: if(ucChannelFirstLength < 20)
	movlw	(014h)
	subwf	(vPutSampleDataIntoTable@ucChannelFirstLength),w
	skipnc
	goto	u113_21
	goto	u113_20
u113_21:
	goto	i1l3536
u113_20:
	line	118
	
i1l3532:	
;common.c: 117: {
;common.c: 118: uiSampleChannelFirst[ucChannelFirstLength] = uiSampleData;
	clrc
	rlf	(vPutSampleDataIntoTable@ucChannelFirstLength),w
	addlw	_uiSampleChannelFirst&0ffh
	movwf	fsr0
	movf	(vPutSampleDataIntoTable@uiSampleData),w
	bsf	status, 7	;select IRP bank3
	movwf	indf
	incf	fsr0,f
	movf	(vPutSampleDataIntoTable@uiSampleData+1),w
	movwf	indf
	line	120
	
i1l3534:	
;common.c: 120: ucChannelFirstLength++;
	incf	(vPutSampleDataIntoTable@ucChannelFirstLength),f
	line	121
;common.c: 121: }
	goto	i1l1531
	line	124
	
i1l3536:	
;common.c: 122: else
;common.c: 123: {
;common.c: 124: ucChannelFirstLength = 0;
	clrf	(vPutSampleDataIntoTable@ucChannelFirstLength)
	line	126
	
i1l3538:	
;common.c: 126: uiSampleChannelFirst[ucChannelFirstLength] = uiSampleData;
	clrc
	rlf	(vPutSampleDataIntoTable@ucChannelFirstLength),w
	addlw	_uiSampleChannelFirst&0ffh
	movwf	fsr0
	movf	(vPutSampleDataIntoTable@uiSampleData),w
	bsf	status, 7	;select IRP bank3
	movwf	indf
	incf	fsr0,f
	movf	(vPutSampleDataIntoTable@uiSampleData+1),w
	movwf	indf
	goto	i1l1531
	line	129
	
i1l3540:	
;common.c: 129: else if(channel == 13)
	movf	(vPutSampleDataIntoTable@channel),w
	xorlw	0Dh
	skipz
	goto	u114_21
	goto	u114_20
u114_21:
	goto	i1l3552
u114_20:
	line	131
	
i1l3542:	
;common.c: 130: {
;common.c: 131: if(ucChannelFourthLength < 20)
	movlw	(014h)
	bcf	status, 5	;RP0=0, select bank0
	subwf	(vPutSampleDataIntoTable@ucChannelFourthLength),w
	skipnc
	goto	u115_21
	goto	u115_20
u115_21:
	goto	i1l3548
u115_20:
	line	133
	
i1l3544:	
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
	
i1l3546:	
;common.c: 135: ucChannelFourthLength++;
	incf	(vPutSampleDataIntoTable@ucChannelFourthLength),f
	line	136
;common.c: 136: }
	goto	i1l1531
	line	139
	
i1l3548:	
;common.c: 137: else
;common.c: 138: {
;common.c: 139: ucChannelFourthLength = 0;
	clrf	(vPutSampleDataIntoTable@ucChannelFourthLength)
	line	141
	
i1l3550:	
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
	goto	i1l1531
	line	144
	
i1l3552:	
;common.c: 144: else if(channel == 14)
	movf	(vPutSampleDataIntoTable@channel),w
	xorlw	0Eh
	skipz
	goto	u116_21
	goto	u116_20
u116_21:
	goto	i1l3564
u116_20:
	line	146
	
i1l3554:	
;common.c: 145: {
;common.c: 146: if(ucChannelFourteenthLength < 20)
	movlw	(014h)
	bcf	status, 5	;RP0=0, select bank0
	subwf	(vPutSampleDataIntoTable@ucChannelFourteenthLength),w
	skipnc
	goto	u117_21
	goto	u117_20
u117_21:
	goto	i1l3560
u117_20:
	line	148
	
i1l3556:	
;common.c: 147: {
;common.c: 148: uiSampleChannelFourteenth[ucChannelFourteenthLength] = uiSampleData;
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
	line	150
	
i1l3558:	
;common.c: 150: ucChannelFourteenthLength++;
	incf	(vPutSampleDataIntoTable@ucChannelFourteenthLength),f
	line	151
;common.c: 151: }
	goto	i1l1531
	line	154
	
i1l3560:	
;common.c: 152: else
;common.c: 153: {
;common.c: 154: ucChannelFourteenthLength = 0;
	clrf	(vPutSampleDataIntoTable@ucChannelFourteenthLength)
	line	156
	
i1l3562:	
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
	goto	i1l1531
	line	161
	
i1l3564:	
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
;common.c: 167: for(int i = 0;i < 20; i++)
	clrf	(vPutSampleDataIntoTable@i)
	clrf	(vPutSampleDataIntoTable@i+1)
	line	169
	
i1l3570:	
;common.c: 168: {
;common.c: 169: uiSampleChannelFirst[i] = 0;
	clrc
	rlf	(vPutSampleDataIntoTable@i),w
	addlw	_uiSampleChannelFirst&0ffh
	movwf	fsr0
	bsf	status, 7	;select IRP bank3
	clrf	indf
	incf	fsr0,f
	clrf	indf
	line	171
;common.c: 171: uiSampleChannelFourth[i] = 0;
	clrc
	rlf	(vPutSampleDataIntoTable@i),w
	addlw	_uiSampleChannelFourth&0ffh
	movwf	fsr0
	bcf	status, 7	;select IRP bank1
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
	
i1l3572:	
	incf	(vPutSampleDataIntoTable@i),f
	skipnz
	incf	(vPutSampleDataIntoTable@i+1),f
	
i1l3574:	
	movf	(vPutSampleDataIntoTable@i+1),w
	xorlw	80h
	movwf	btemp+1
	movlw	(high(014h))^80h
	subwf	btemp+1,w
	skipz
	goto	u118_25
	movlw	low(014h)
	subwf	(vPutSampleDataIntoTable@i),w
u118_25:

	skipc
	goto	u118_21
	goto	u118_20
u118_21:
	goto	i1l3570
u118_20:
	line	177
	
i1l1531:	
	return
	opt stack 0
GLOBAL	__end_of_vPutSampleDataIntoTable
	__end_of_vPutSampleDataIntoTable:
;; =============== function _vPutSampleDataIntoTable ends ============

	signat	_vPutSampleDataIntoTable,8312
psect	text971,local,class=CODE,delta=2
global __ptext971
__ptext971:
	global	btemp
	btemp set 07Eh

	DABS	1,126,2	;btemp
	global	wtemp0
	wtemp0 set btemp
	end
