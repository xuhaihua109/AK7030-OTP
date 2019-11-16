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
# 107 "D:\develop\AK7030-good\AK7030-OTP\main.c"
	psect config,class=CONFIG,delta=2 ;#
# 107 "D:\develop\AK7030-good\AK7030-OTP\main.c"
	dw 0x0FFF & 0x3FFF & 0x3FFF & 0x3FFF & 0x3FFF & 0x3FFF ;#
# 108 "D:\develop\AK7030-good\AK7030-OTP\main.c"
	psect config,class=CONFIG,delta=2 ;#
# 108 "D:\develop\AK7030-good\AK7030-OTP\main.c"
	dw 0x3FFF & 0x3FDF & 0x3FFF & 0x3FFE ;#
# 109 "D:\develop\AK7030-good\AK7030-OTP\main.c"
	psect config,class=CONFIG,delta=2 ;#
# 109 "D:\develop\AK7030-good\AK7030-OTP\main.c"
	dw 0X3FFF & 0x3FFF & 0x3FFF & 0x3FF8 ;#
	FNCALL	_main,_initPin
	FNCALL	_main,_setPinInitVaule
	FNCALL	_main,_selectAdChannel
	FNCALL	_main,_clock_config
	FNCALL	_main,_timer1_config
	FNCALL	_main,_timer1_interrupt_config
	FNCALL	_main,_adc_test_init
	FNCALL	_main,_startTwentyMinTimer
	FNCALL	_main,_pwm_start
	FNCALL	_main,_adc_start
	FNCALL	_main,_process_AD_Converter_Value
	FNCALL	_main,_isPermitSampleTime
	FNCALL	_main,_clrSampeTime
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
	FNCALL	_getAdOriginalCh13Value,_FilterCh13
	FNCALL	_process_AD_Converter_Value,_getAD_ConvertFlag
	FNCALL	_process_AD_Converter_Value,_setAD_ConvertFlag
	FNCALL	_process_AD_Converter_Value,_AD_Sample
	FNCALL	_process_AD_Converter_Value,_adc_test_init
	FNCALL	_process_AD_Converter_Value,_adc_start
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
	FNCALL	_vPutSampleDataIntoTable,_Filter
	FNCALL	_vPutSampleDataIntoTable,_setPWM_Width
	FNCALL	intlevel1,_ISR
	global	intlevel1
	FNROOT	intlevel1
	global	_sampleChannelSelect
	global	vPutSampleDataIntoTable@uiInitWidth
psect	idataBANK0,class=CODE,space=0,delta=2
global __pidataBANK0
__pidataBANK0:
	file	"D:\develop\AK7030-good\AK7030-OTP\common.c"
	line	24

;initializer for _sampleChannelSelect
	retlw	0Ch
	line	181

;initializer for vPutSampleDataIntoTable@uiInitWidth
	retlw	04Bh
	global	_uiBigTimer
	global	_uiOneHourTimer
	global	_uiSmallTimer
	global	_uiTwentyMinTimer
	global	vPutSampleDataIntoTable@uiCalWidthArrayNew
	global	ISR@ucTimer1sCnt
	global	_adc_convert_flag
	global	_bBigTimerStartFlag
	global	_bOneHourTimerStartFlag
	global	_bSmallTimerStartFlag
	global	_bTwentyMinStartFlag
	global	_sampleTimes
	global	_timer
	global	main@cTimerP5s_786
	global	main@cTimerP5s_792
	global	main@ucStep
	global	main@ucTimerP3s
	global	main@ucTimerP5s
	global	setPWM_Width@ucOldWidth
	global	vPutSampleDataIntoTable@ucChannelFourteenthLength
	global	vPutSampleDataIntoTable@ucChannelFourthLength
	global	vPutSampleDataIntoTable@ucChannelFirstLength
	global	_uiTwentySecondsTimer
	global	main@ucDelay1s
	global	main@uiTimerOneP5s
	global	main@uiTimerThreeP5s
	global	main@uiTimerTwoP5s
	global	vPutSampleDataIntoTable@uiCalWidthArrayOld
	global	vPutSampleDataIntoTable@uiCalWidthCnt
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

vPutSampleDataIntoTable@uiCalWidthArrayNew:
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

main@cTimerP5s_786:
       ds      1

main@cTimerP5s_792:
       ds      1

main@ucStep:
       ds      1

main@ucTimerP3s:
       ds      1

main@ucTimerP5s:
       ds      1

setPWM_Width@ucOldWidth:
       ds      1

vPutSampleDataIntoTable@ucChannelFourteenthLength:
       ds      1

vPutSampleDataIntoTable@ucChannelFourthLength:
       ds      1

psect	dataBANK0,class=BANK0,space=1
global __pdataBANK0
__pdataBANK0:
	file	"D:\develop\AK7030-good\AK7030-OTP\common.c"
	line	24
_sampleChannelSelect:
       ds      1

psect	dataBANK0
	file	"D:\develop\AK7030-good\AK7030-OTP\common.c"
	line	181
vPutSampleDataIntoTable@uiInitWidth:
       ds      1

psect	bssBANK1,class=BANK1,space=1
global __pbssBANK1
__pbssBANK1:
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

vPutSampleDataIntoTable@uiCalWidthArrayOld:
       ds      2

vPutSampleDataIntoTable@uiCalWidthCnt:
       ds      2

_uiSampleChannelFirst:
       ds      6

_uiSampleChannelFourteenth:
       ds      6

_uiSampleChannelFourth:
       ds      6

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
	movlw	low((__pbssBANK0)+01Ah)
	fcall	clear_ram
; Clear objects allocated to BANK1
psect cinit,class=CODE,delta=2
	movlw	low(__pbssBANK1)
	movwf	fsr
	movlw	low((__pbssBANK1)+020h)
	fcall	clear_ram
; Initialize objects allocated to BANK0
	global __pidataBANK0
psect cinit,class=CODE,delta=2
	fcall	__pidataBANK0+0		;fetch initializer
	movwf	__pdataBANK0+0&07fh		
	fcall	__pidataBANK0+1		;fetch initializer
	movwf	__pdataBANK0+1&07fh		
psect cinit,class=CODE,delta=2
global end_of_initialization

;End of C runtime variable initialization code

end_of_initialization:
clrf status
ljmp _main	;jump to C main() function
psect	cstackBANK1,class=BANK1,space=1
global __pcstackBANK1
__pcstackBANK1:
	global	FilterCh13@tmpValue
FilterCh13@tmpValue:	; 1 bytes @ 0x0
	ds	1
	global	FilterCh13@filter_temp
FilterCh13@filter_temp:	; 2 bytes @ 0x1
	ds	2
	global	FilterCh13@filter_sum
FilterCh13@filter_sum:	; 2 bytes @ 0x3
	ds	2
	global	FilterCh13@filter_buf
FilterCh13@filter_buf:	; 6 bytes @ 0x5
	ds	6
	global	FilterCh13@cir
FilterCh13@cir:	; 2 bytes @ 0xB
	ds	2
	global	FilterCh13@j
FilterCh13@j:	; 1 bytes @ 0xD
	ds	1
	global	FilterCh13@i
FilterCh13@i:	; 1 bytes @ 0xE
	ds	1
	global	?_getAdOriginalCh13Value
?_getAdOriginalCh13Value:	; 2 bytes @ 0xF
	ds	2
	global	??_main
??_main:	; 0 bytes @ 0x11
	ds	1
	global	main@ucChValue
main@ucChValue:	; 2 bytes @ 0x12
	ds	2
	global	main@uiCh13Value
main@uiCh13Value:	; 2 bytes @ 0x14
	ds	2
psect	cstackCOMMON,class=COMMON,space=1
global __pcstackCOMMON
__pcstackCOMMON:
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
	global	?_clearTwelveHoursTimer
?_clearTwelveHoursTimer:	; 0 bytes @ 0x0
	global	?_clearThreeHoursTimer
?_clearThreeHoursTimer:	; 0 bytes @ 0x0
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
	global	?_initPin
?_initPin:	; 0 bytes @ 0x0
	global	?_setPinInitVaule
?_setPinInitVaule:	; 0 bytes @ 0x0
	global	?_selectAdChannel
?_selectAdChannel:	; 0 bytes @ 0x0
	global	?_reset
?_reset:	; 0 bytes @ 0x0
	global	?_setPWM_Width
?_setPWM_Width:	; 0 bytes @ 0x0
	global	??_setPWM_Width
??_setPWM_Width:	; 0 bytes @ 0x0
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
	global	?_getAD_ConvertFlag
?_getAD_ConvertFlag:	; 1 bytes @ 0x0
	global	?_adc_get
?_adc_get:	; 2 bytes @ 0x0
	global	?_main
?_main:	; 2 bytes @ 0x0
	global	?_Filter
?_Filter:	; 2 bytes @ 0x0
	global	setPWM_Width@ucWidth
setPWM_Width@ucWidth:	; 1 bytes @ 0x0
	global	i1setAD_ConvertFlag@flag
i1setAD_ConvertFlag@flag:	; 1 bytes @ 0x0
	ds	2
	global	??_adc_get
??_adc_get:	; 0 bytes @ 0x2
	global	??_Filter
??_Filter:	; 0 bytes @ 0x2
	global	adc_get@val
adc_get@val:	; 2 bytes @ 0x2
	ds	4
	global	?_vPutSampleDataIntoTable
?_vPutSampleDataIntoTable:	; 0 bytes @ 0x6
	global	vPutSampleDataIntoTable@uiSampleData
vPutSampleDataIntoTable@uiSampleData:	; 2 bytes @ 0x6
	ds	2
	global	vPutSampleDataIntoTable@channel
vPutSampleDataIntoTable@channel:	; 1 bytes @ 0x8
	ds	1
	global	??_vPutSampleDataIntoTable
??_vPutSampleDataIntoTable:	; 0 bytes @ 0x9
	ds	4
psect	cstackBANK0,class=BANK0,space=1
global __pcstackBANK0
__pcstackBANK0:
	global	Filter@filter_temp
Filter@filter_temp:	; 2 bytes @ 0x0
	ds	2
	global	Filter@filter_sum
Filter@filter_sum:	; 2 bytes @ 0x2
	ds	2
	global	Filter@tmpValue
Filter@tmpValue:	; 1 bytes @ 0x4
	ds	1
	global	Filter@filter_buf
Filter@filter_buf:	; 6 bytes @ 0x5
	ds	6
	global	Filter@cir
Filter@cir:	; 2 bytes @ 0xB
	ds	2
	global	Filter@j
Filter@j:	; 1 bytes @ 0xD
	ds	1
	global	Filter@i
Filter@i:	; 1 bytes @ 0xE
	ds	1
	global	vPutSampleDataIntoTable@uiDeviationValue
vPutSampleDataIntoTable@uiDeviationValue:	; 2 bytes @ 0xF
	ds	2
	global	vPutSampleDataIntoTable@i
vPutSampleDataIntoTable@i:	; 2 bytes @ 0x11
	ds	2
	global	??_ISR
??_ISR:	; 0 bytes @ 0x13
	ds	4
	global	??_clock_config
??_clock_config:	; 0 bytes @ 0x17
	global	??_timer1_config
??_timer1_config:	; 0 bytes @ 0x17
	global	??_timer1_interrupt_config
??_timer1_interrupt_config:	; 0 bytes @ 0x17
	global	?_adc_test_init
?_adc_test_init:	; 0 bytes @ 0x17
	global	?_startTwentyMinTimer
?_startTwentyMinTimer:	; 0 bytes @ 0x17
	global	??_adc_start
??_adc_start:	; 0 bytes @ 0x17
	global	??_isPermitSampleTime
??_isPermitSampleTime:	; 0 bytes @ 0x17
	global	??_clrSampeTime
??_clrSampeTime:	; 0 bytes @ 0x17
	global	??_isFinishedTwentyMinTimer
??_isFinishedTwentyMinTimer:	; 0 bytes @ 0x17
	global	??_clearTwentyMinTimer
??_clearTwentyMinTimer:	; 0 bytes @ 0x17
	global	?_startTwelveHourTimer
?_startTwelveHourTimer:	; 0 bytes @ 0x17
	global	??_isFinishedTwelveHoursTimer
??_isFinishedTwelveHoursTimer:	; 0 bytes @ 0x17
	global	??_clearTwelveHoursTimer
??_clearTwelveHoursTimer:	; 0 bytes @ 0x17
	global	?_startThreeHoursTimer
?_startThreeHoursTimer:	; 0 bytes @ 0x17
	global	??_isFinishedThreeHoursTimer
??_isFinishedThreeHoursTimer:	; 0 bytes @ 0x17
	global	??_clearThreeHoursTimer
??_clearThreeHoursTimer:	; 0 bytes @ 0x17
	global	?_startOneHoursTimer
?_startOneHoursTimer:	; 0 bytes @ 0x17
	global	??_isFinishedOneHoursTimer
??_isFinishedOneHoursTimer:	; 0 bytes @ 0x17
	global	??_AD_Sample
??_AD_Sample:	; 0 bytes @ 0x17
	global	??_initPB3
??_initPB3:	; 0 bytes @ 0x17
	global	??_setPB3
??_setPB3:	; 0 bytes @ 0x17
	global	??_initPB4
??_initPB4:	; 0 bytes @ 0x17
	global	??_setPB4
??_setPB4:	; 0 bytes @ 0x17
	global	??_initPB5
??_initPB5:	; 0 bytes @ 0x17
	global	??_setPB5
??_setPB5:	; 0 bytes @ 0x17
	global	??_initPB2_AsHighResistence
??_initPB2_AsHighResistence:	; 0 bytes @ 0x17
	global	?_pwm_start
?_pwm_start:	; 0 bytes @ 0x17
	global	??_selectAdChannel
??_selectAdChannel:	; 0 bytes @ 0x17
	global	??_reset
??_reset:	; 0 bytes @ 0x17
	global	??_getAD_ConvertFlag
??_getAD_ConvertFlag:	; 0 bytes @ 0x17
	global	??_setAD_ConvertFlag
??_setAD_ConvertFlag:	; 0 bytes @ 0x17
	global	?_FilterCh13
?_FilterCh13:	; 2 bytes @ 0x17
	global	initPB3@bValue
initPB3@bValue:	; 1 bytes @ 0x17
	global	setPB3@bValue
setPB3@bValue:	; 1 bytes @ 0x17
	global	initPB4@bValue
initPB4@bValue:	; 1 bytes @ 0x17
	global	setPB4@bValue
setPB4@bValue:	; 1 bytes @ 0x17
	global	initPB5@bValue
initPB5@bValue:	; 1 bytes @ 0x17
	global	setPB5@bValue
setPB5@bValue:	; 1 bytes @ 0x17
	global	pwm_start@ucPulseFrequency
pwm_start@ucPulseFrequency:	; 1 bytes @ 0x17
	global	setAD_ConvertFlag@flag
setAD_ConvertFlag@flag:	; 1 bytes @ 0x17
	global	adc_test_init@ref
adc_test_init@ref:	; 1 bytes @ 0x17
	global	startTwelveHourTimer@uiSetTime
startTwelveHourTimer@uiSetTime:	; 2 bytes @ 0x17
	global	startThreeHoursTimer@uiSetTime
startThreeHoursTimer@uiSetTime:	; 2 bytes @ 0x17
	global	startOneHoursTimer@uiSetTime
startOneHoursTimer@uiSetTime:	; 2 bytes @ 0x17
	global	startTwentyMinTimer@uiSetValue
startTwentyMinTimer@uiSetValue:	; 2 bytes @ 0x17
	ds	1
	global	??_adc_test_init
??_adc_test_init:	; 0 bytes @ 0x18
	global	??_pwm_start
??_pwm_start:	; 0 bytes @ 0x18
	global	??_initPin
??_initPin:	; 0 bytes @ 0x18
	global	??_setPinInitVaule
??_setPinInitVaule:	; 0 bytes @ 0x18
	global	pwm_start@ucPulseWidth
pwm_start@ucPulseWidth:	; 1 bytes @ 0x18
	ds	1
	global	??_startTwentyMinTimer
??_startTwentyMinTimer:	; 0 bytes @ 0x19
	global	??_startTwelveHourTimer
??_startTwelveHourTimer:	; 0 bytes @ 0x19
	global	??_startThreeHoursTimer
??_startThreeHoursTimer:	; 0 bytes @ 0x19
	global	??_startOneHoursTimer
??_startOneHoursTimer:	; 0 bytes @ 0x19
	global	??_FilterCh13
??_FilterCh13:	; 0 bytes @ 0x19
	global	adc_test_init@channel
adc_test_init@channel:	; 1 bytes @ 0x19
	ds	1
	global	??_process_AD_Converter_Value
??_process_AD_Converter_Value:	; 0 bytes @ 0x1A
	ds	3
	global	??_getAdOriginalCh13Value
??_getAdOriginalCh13Value:	; 0 bytes @ 0x1D
;;Data sizes: Strings 0, constant 0, data 2, bss 59, persistent 0 stack 0
;;Auto spaces:   Size  Autos    Used
;; COMMON          14     13      14
;; BANK0           80     29      57
;; BANK1           80     22      54
;; BANK3           96      0       0
;; BANK2           96      0       0

;;
;; Pointer list with targets:

;; ?_adc_get	unsigned int  size(1) Largest target is 0
;;
;; ?_getAdOriginalCh13Value	unsigned int  size(1) Largest target is 0
;;
;; ?_Filter	unsigned int  size(1) Largest target is 0
;;
;; ?_FilterCh13	unsigned int  size(1) Largest target is 0
;;
;; Filter@tmpValue	PTR int  size(1) Largest target is 6
;;		 -> uiSampleChannelFourteenth(BANK1[6]), uiSampleChannelFirst(BANK1[6]), 
;;
;; FilterCh13@tmpValue	PTR int  size(1) Largest target is 6
;;		 -> uiSampleChannelFourth(BANK1[6]), 
;;


;;
;; Critical Paths under _main in COMMON
;;
;;   None.
;;
;; Critical Paths under _ISR in COMMON
;;
;;   _ISR->_vPutSampleDataIntoTable
;;   _vPutSampleDataIntoTable->_Filter
;;
;; Critical Paths under _main in BANK0
;;
;;   _getAdOriginalCh13Value->_FilterCh13
;;   _process_AD_Converter_Value->_adc_test_init
;;   _setPinInitVaule->_setPB3
;;   _setPinInitVaule->_setPB4
;;   _setPinInitVaule->_setPB5
;;   _initPin->_initPB3
;;   _initPin->_initPB4
;;   _initPin->_initPB5
;;
;; Critical Paths under _ISR in BANK0
;;
;;   _ISR->_vPutSampleDataIntoTable
;;   _vPutSampleDataIntoTable->_Filter
;;
;; Critical Paths under _main in BANK1
;;
;;   _main->_getAdOriginalCh13Value
;;   _getAdOriginalCh13Value->_FilterCh13
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
;;Main: autosize = 0, tempsize = 1, incstack = 0, save=0
;;

;;
;;Call Graph Tables:
;;
;; ---------------------------------------------------------------------------------
;; (Depth) Function   	        Calls       Base Space   Used Autos Params    Refs
;; ---------------------------------------------------------------------------------
;; (0) _main                                                 5     5      0    1665
;;                                             17 BANK1      5     5      0
;;                            _initPin
;;                    _setPinInitVaule
;;                    _selectAdChannel
;;                       _clock_config
;;                      _timer1_config
;;            _timer1_interrupt_config
;;                      _adc_test_init
;;                _startTwentyMinTimer
;;                          _pwm_start
;;                          _adc_start
;;         _process_AD_Converter_Value
;;                 _isPermitSampleTime
;;                       _clrSampeTime
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
;; (1) _getAdOriginalCh13Value                               2     0      2     915
;;                                             15 BANK1      2     0      2
;;                         _FilterCh13
;; ---------------------------------------------------------------------------------
;; (1) _process_AD_Converter_Value                           0     0      0      93
;;                  _getAD_ConvertFlag
;;                  _setAD_ConvertFlag
;;                          _AD_Sample
;;                      _adc_test_init
;;                          _adc_start
;; ---------------------------------------------------------------------------------
;; (1) _setPinInitVaule                                      0     0      0      93
;;                             _setPB3
;;                             _setPB4
;;                             _setPB5
;; ---------------------------------------------------------------------------------
;; (1) _initPin                                              0     0      0      93
;;           _initPB2_AsHighResistence
;;                            _initPB3
;;                            _initPB4
;;                            _initPB5
;; ---------------------------------------------------------------------------------
;; (2) _AD_Sample                                            0     0      0       0
;; ---------------------------------------------------------------------------------
;; (2) _setAD_ConvertFlag                                    1     1      0      31
;;                                             23 BANK0      1     1      0
;; ---------------------------------------------------------------------------------
;; (2) _getAD_ConvertFlag                                    0     0      0       0
;; ---------------------------------------------------------------------------------
;; (2) _FilterCh13                                          21    19      2     915
;;                                             23 BANK0      6     4      2
;;                                              0 BANK1     15    15      0
;; ---------------------------------------------------------------------------------
;; (1) _isFinishedOneHoursTimer                              0     0      0       0
;; ---------------------------------------------------------------------------------
;; (1) _startOneHoursTimer                                   2     0      2      31
;;                                             23 BANK0      2     0      2
;; ---------------------------------------------------------------------------------
;; (1) _clearThreeHoursTimer                                 0     0      0       0
;; ---------------------------------------------------------------------------------
;; (1) _isFinishedThreeHoursTimer                            0     0      0       0
;; ---------------------------------------------------------------------------------
;; (1) _startThreeHoursTimer                                 2     0      2      31
;;                                             23 BANK0      2     0      2
;; ---------------------------------------------------------------------------------
;; (1) _clearTwelveHoursTimer                                0     0      0       0
;; ---------------------------------------------------------------------------------
;; (1) _isFinishedTwelveHoursTimer                           0     0      0       0
;; ---------------------------------------------------------------------------------
;; (1) _startTwelveHourTimer                                 2     0      2      31
;;                                             23 BANK0      2     0      2
;; ---------------------------------------------------------------------------------
;; (1) _clearTwentyMinTimer                                  0     0      0       0
;; ---------------------------------------------------------------------------------
;; (1) _isFinishedTwentyMinTimer                             0     0      0       0
;; ---------------------------------------------------------------------------------
;; (1) _clrSampeTime                                         0     0      0       0
;; ---------------------------------------------------------------------------------
;; (1) _isPermitSampleTime                                   0     0      0       0
;; ---------------------------------------------------------------------------------
;; (2) _adc_start                                            0     0      0       0
;; ---------------------------------------------------------------------------------
;; (1) _startTwentyMinTimer                                  2     0      2      31
;;                                             23 BANK0      2     0      2
;; ---------------------------------------------------------------------------------
;; (2) _adc_test_init                                        3     2      1      62
;;                                             23 BANK0      3     2      1
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
;; (1) _pwm_start                                            2     1      1      62
;;                                             23 BANK0      2     1      1
;; ---------------------------------------------------------------------------------
;; (2) _initPB2_AsHighResistence                             0     0      0       0
;; ---------------------------------------------------------------------------------
;; (1) _setPB5                                               1     1      0      31
;;                                             23 BANK0      1     1      0
;; ---------------------------------------------------------------------------------
;; (2) _initPB5                                              1     1      0      31
;;                                             23 BANK0      1     1      0
;; ---------------------------------------------------------------------------------
;; (1) _setPB4                                               1     1      0      31
;;                                             23 BANK0      1     1      0
;; ---------------------------------------------------------------------------------
;; (2) _initPB4                                              1     1      0      31
;;                                             23 BANK0      1     1      0
;; ---------------------------------------------------------------------------------
;; (1) _setPB3                                               1     1      0      31
;;                                             23 BANK0      1     1      0
;; ---------------------------------------------------------------------------------
;; (2) _initPB3                                              1     1      0      31
;;                                             23 BANK0      1     1      0
;; ---------------------------------------------------------------------------------
;; Estimated maximum stack depth 2
;; ---------------------------------------------------------------------------------
;; (Depth) Function   	        Calls       Base Space   Used Autos Params    Refs
;; ---------------------------------------------------------------------------------
;; (3) _ISR                                                  4     4      0    1140
;;                                             19 BANK0      4     4      0
;;                i1_setAD_ConvertFlag
;;                            _adc_get
;;            _vPutSampleDataIntoTable
;; ---------------------------------------------------------------------------------
;; (4) _vPutSampleDataIntoTable                             11     8      3    1043
;;                                              6 COMMON     7     4      3
;;                                             15 BANK0      4     4      0
;;                             _Filter
;;                       _setPWM_Width
;;                            _adc_get (ARG)
;; ---------------------------------------------------------------------------------
;; (4) i1_setAD_ConvertFlag                                  1     1      0      73
;;                                              0 COMMON     1     1      0
;; ---------------------------------------------------------------------------------
;; (4) _adc_get                                              4     2      2      24
;;                                              0 COMMON     4     2      2
;; ---------------------------------------------------------------------------------
;; (5) _Filter                                              21    19      2     620
;;                                              0 COMMON     6     4      2
;;                                              0 BANK0     15    15      0
;; ---------------------------------------------------------------------------------
;; (5) _setPWM_Width                                         1     1      0      66
;;                                              0 COMMON     1     1      0
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
;;   _startTwentyMinTimer
;;   _pwm_start
;;   _adc_start
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
;;     _FilterCh13
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
;;     _Filter
;;     _setPWM_Width
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
;;BANK1               50     16      36       8       67.5%
;;BITBANK1            50      0       0       7        0.0%
;;CODE                 0      0       0       0        0.0%
;;DATA                 0      0      85       6        0.0%
;;ABS                  0      0      7D       3        0.0%
;;NULL                 0      0       0       0        0.0%
;;STACK                0      0       8       2        0.0%
;;BANK0               50     1D      39       5       71.3%
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
;;		line 588 in file "D:\develop\AK7030-good\AK7030-OTP\main.c"
;; Parameters:    Size  Location     Type
;;		None
;; Auto vars:     Size  Location     Type
;;  ucChValue       2   18[BANK1 ] unsigned int 
;;  uiCh13Value     2   20[BANK1 ] unsigned int 
;; Return value:  Size  Location     Type
;;                  2  743[COMMON] int 
;; Registers used:
;;		wreg, fsr0l, fsr0h, status,2, status,0, btemp+1, pclath, cstack
;; Tracked objects:
;;		On entry : 17F/0
;;		On exit  : 60/0
;;		Unchanged: 0/0
;; Data sizes:     COMMON   BANK0   BANK1   BANK3   BANK2
;;      Params:         0       0       0       0       0
;;      Locals:         0       0       4       0       0
;;      Temps:          0       0       1       0       0
;;      Totals:         0       0       5       0       0
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
;;		_startTwentyMinTimer
;;		_pwm_start
;;		_adc_start
;;		_process_AD_Converter_Value
;;		_isPermitSampleTime
;;		_clrSampeTime
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
	file	"D:\develop\AK7030-good\AK7030-OTP\main.c"
	line	588
	global	__size_of_main
	__size_of_main	equ	__end_of_main-_main
	
_main:	
	opt	stack 3
; Regs used in _main: [wreg-fsr0h+status,2+status,0+btemp+1+pclath+cstack]
	line	616
	
l4223:	
;main.c: 589: enum systemStep {
;main.c: 590: INIT_STEP = 0,
;main.c: 591: START_UP_PWM_STEP,
;main.c: 592: CHECK_10_HOUR_TIMER_STEP,
;main.c: 593: STARTUP_3_HOUR_TIMER_STEP,
;main.c: 594: CHECK_3_HOUR_TIMER_STEP,
;main.c: 595: STARTUP_1_HOUR_TIMER_STEP,
;main.c: 596: CHECK_1_HOUR_TIMER_STEP,
;main.c: 597: READY_FOR_RESET_STEP = 99,
;main.c: 598: DELAY_ONE_SECOND_FOR_PWM,
;main.c: 599: MEET_RESET_CONDITION_STEP,
;main.c: 600: RESET_STEP,
;main.c: 601: };
;main.c: 603: static enum systemStep ucStep = INIT_STEP;
	fcall	_initPin
	line	617
;main.c: 617: setPinInitVaule();
	fcall	_setPinInitVaule
	line	618
	
l4225:	
;main.c: 618: selectAdChannel();
	fcall	_selectAdChannel
	line	620
	
l4227:	
;main.c: 620: clock_config();
	fcall	_clock_config
	line	621
	
l4229:	
;main.c: 621: timer1_config();
	fcall	_timer1_config
	line	622
	
l4231:	
;main.c: 622: timer1_interrupt_config();
	fcall	_timer1_interrupt_config
	line	624
;main.c: 624: adc_test_init(12,3);
	movlw	(03h)
	bcf	status, 5	;RP0=0, select bank0
	movwf	(?_adc_test_init)
	movlw	(0Ch)
	fcall	_adc_test_init
	line	636
;main.c: 636: startTwentyMinTimer( 60 );
	movlw	03Ch
	bcf	status, 5	;RP0=0, select bank0
	movwf	(?_startTwentyMinTimer)
	clrf	(?_startTwentyMinTimer+1)
	fcall	_startTwentyMinTimer
	line	637
;main.c: 637: pwm_start(75,249);
	movlw	(0F9h)
	movwf	(?_pwm_start)
	movlw	(04Bh)
	fcall	_pwm_start
	line	638
	
l4233:	
;main.c: 638: _delay(1000);
	opt asmopt_off
movlw	249
	bsf	status, 5	;RP0=1, select bank1
movwf	(??_main+0)^080h+0,f
u2257:
	clrwdt
decfsz	(??_main+0)^080h+0,f
	goto	u2257
	nop2	;nop
	clrwdt
opt asmopt_on

	line	639
;main.c: 639: adc_start();
	fcall	_adc_start
	line	643
	
l4235:	
# 643 "D:\develop\AK7030-good\AK7030-OTP\main.c"
 clrwdt ;#
psect	maintext
	line	645
	
l4237:	
;main.c: 645: process_AD_Converter_Value();
	fcall	_process_AD_Converter_Value
	line	647
	
l4239:	
;main.c: 647: if( isPermitSampleTime() )
	fcall	_isPermitSampleTime
	xorlw	0
	skipnz
	goto	u2031
	goto	u2030
u2031:
	goto	l4235
u2030:
	line	651
	
l4241:	
;main.c: 648: {
;main.c: 651: clrSampeTime();
	fcall	_clrSampeTime
	line	660
;main.c: 660: switch(ucStep)
	goto	l4395
	line	671
	
l4243:	
;main.c: 664: {
;main.c: 669: static unsigned char ucTimerP3s = 0;
;main.c: 671: if( isFinishedTwentyMinTimer() )
	fcall	_isFinishedTwentyMinTimer
	xorlw	0
	skipnz
	goto	u2041
	goto	u2040
u2041:
	goto	l4249
u2040:
	line	673
	
l4245:	
;main.c: 672: {
;main.c: 673: ucStep = READY_FOR_RESET_STEP;
	movlw	(063h)
	movwf	(main@ucStep)
	line	674
	
l4247:	
;main.c: 674: ucTimerP3s = 0;
	clrf	(main@ucTimerP3s)
	line	675
;main.c: 675: }
	goto	l4235
	line	678
	
l4249:	
;main.c: 676: else
;main.c: 677: {
;main.c: 678: if( getAdOriginalCh13Value() > 90 )
	fcall	_getAdOriginalCh13Value
	movlw	high(05Bh)
	subwf	(1+(?_getAdOriginalCh13Value))^080h,w
	movlw	low(05Bh)
	skipnz
	subwf	(0+(?_getAdOriginalCh13Value))^080h,w
	skipc
	goto	u2051
	goto	u2050
u2051:
	goto	l4253
u2050:
	line	680
	
l4251:	
;main.c: 679: {
;main.c: 680: ucTimerP3s++;
	bcf	status, 5	;RP0=0, select bank0
	incf	(main@ucTimerP3s),f
	line	681
;main.c: 681: }
	goto	l4255
	line	683
	
l4253:	
;main.c: 682: else
;main.c: 683: ucTimerP3s = 0;
	bcf	status, 5	;RP0=0, select bank0
	clrf	(main@ucTimerP3s)
	line	685
	
l4255:	
;main.c: 685: if( ucTimerP3s >= 3)
	movlw	(03h)
	subwf	(main@ucTimerP3s),w
	skipc
	goto	u2061
	goto	u2060
u2061:
	goto	l753
u2060:
	line	687
	
l4257:	
;main.c: 686: {
;main.c: 687: ucTimerP3s = 0;
	clrf	(main@ucTimerP3s)
	line	688
	
l4259:	
;main.c: 688: ucStep = START_UP_PWM_STEP;
	clrf	(main@ucStep)
	incf	(main@ucStep),f
	goto	l4235
	line	691
	
l753:	
	line	695
;main.c: 689: }
;main.c: 691: }
;main.c: 695: break;
	goto	l4235
	line	709
	
l4261:	
;main.c: 699: {
;main.c: 709: setPB3(0);
	movlw	(0)
	fcall	_setPB3
	line	710
;main.c: 710: setPB4(1);
	movlw	(01h)
	fcall	_setPB4
	line	711
;main.c: 711: setPB5(0);
	movlw	(0)
	fcall	_setPB5
	line	712
	
l4263:	
;main.c: 712: clearTwentyMinTimer();
	fcall	_clearTwentyMinTimer
	line	713
	
l4265:	
;main.c: 713: startTwelveHourTimer( 240);
	movlw	0F0h
	movwf	(?_startTwelveHourTimer)
	clrf	(?_startTwelveHourTimer+1)
	fcall	_startTwelveHourTimer
	line	714
	
l4267:	
;main.c: 714: ucStep = CHECK_10_HOUR_TIMER_STEP;
	movlw	(02h)
	movwf	(main@ucStep)
	line	715
;main.c: 715: break;
	goto	l4235
	line	726
	
l4269:	
;main.c: 719: {
;main.c: 724: static unsigned char ucTimerP5s = 0;
;main.c: 726: if( isFinishedTwelveHoursTimer () )
	fcall	_isFinishedTwelveHoursTimer
	xorlw	0
	skipnz
	goto	u2071
	goto	u2070
u2071:
	goto	l4273
u2070:
	line	727
	
l4271:	
;main.c: 727: ucStep = READY_FOR_RESET_STEP;
	movlw	(063h)
	movwf	(main@ucStep)
	goto	l4235
	line	730
	
l4273:	
;main.c: 728: else
;main.c: 729: {
;main.c: 730: if( getAdOriginalCh13Value() < 200 )
	fcall	_getAdOriginalCh13Value
	movlw	high(0C8h)
	subwf	(1+(?_getAdOriginalCh13Value))^080h,w
	movlw	low(0C8h)
	skipnz
	subwf	(0+(?_getAdOriginalCh13Value))^080h,w
	skipnc
	goto	u2081
	goto	u2080
u2081:
	goto	l4277
u2080:
	line	731
	
l4275:	
;main.c: 731: ucTimerP5s++;
	bcf	status, 5	;RP0=0, select bank0
	incf	(main@ucTimerP5s),f
	goto	l4279
	line	733
	
l4277:	
;main.c: 732: else
;main.c: 733: ucTimerP5s = 0;
	bcf	status, 5	;RP0=0, select bank0
	clrf	(main@ucTimerP5s)
	line	735
	
l4279:	
;main.c: 735: if( ucTimerP5s >= 2)
	movlw	(02h)
	subwf	(main@ucTimerP5s),w
	skipc
	goto	u2091
	goto	u2090
u2091:
	goto	l753
u2090:
	line	737
	
l4281:	
;main.c: 736: {
;main.c: 737: ucTimerP5s = 0;
	clrf	(main@ucTimerP5s)
	line	738
	
l4283:	
;main.c: 738: ucStep = STARTUP_3_HOUR_TIMER_STEP;
	movlw	(03h)
	movwf	(main@ucStep)
	goto	l4235
	line	747
	
l4285:	
;main.c: 746: {
;main.c: 747: clearTwelveHoursTimer();
	fcall	_clearTwelveHoursTimer
	line	748
	
l4287:	
;main.c: 748: startThreeHoursTimer(180);
	movlw	0B4h
	movwf	(?_startThreeHoursTimer)
	clrf	(?_startThreeHoursTimer+1)
	fcall	_startThreeHoursTimer
	line	749
;main.c: 749: ucStep = CHECK_3_HOUR_TIMER_STEP;
	movlw	(04h)
	movwf	(main@ucStep)
	line	750
;main.c: 750: break;
	goto	l4235
	line	757
	
l4289:	
;main.c: 754: {
;main.c: 755: static unsigned char ucTimerP5s = 0;
;main.c: 757: if( isFinishedThreeHoursTimer() )
	fcall	_isFinishedThreeHoursTimer
	xorlw	0
	skipnz
	goto	u2101
	goto	u2100
u2101:
	goto	l4293
u2100:
	goto	l4271
	line	761
	
l4293:	
;main.c: 759: else
;main.c: 760: {
;main.c: 761: if( getAdOriginalCh13Value() < 75 )
	fcall	_getAdOriginalCh13Value
	movlw	high(04Bh)
	subwf	(1+(?_getAdOriginalCh13Value))^080h,w
	movlw	low(04Bh)
	skipnz
	subwf	(0+(?_getAdOriginalCh13Value))^080h,w
	skipnc
	goto	u2111
	goto	u2110
u2111:
	goto	l4297
u2110:
	line	762
	
l4295:	
;main.c: 762: ucTimerP5s++;
	bcf	status, 5	;RP0=0, select bank0
	incf	(main@cTimerP5s_786),f
	goto	l4299
	line	764
	
l4297:	
;main.c: 763: else
;main.c: 764: ucTimerP5s = 0;
	bcf	status, 5	;RP0=0, select bank0
	clrf	(main@cTimerP5s_786)
	line	766
	
l4299:	
;main.c: 766: if( ucTimerP5s >= 2)
	movlw	(02h)
	subwf	(main@cTimerP5s_786),w
	skipc
	goto	u2121
	goto	u2120
u2121:
	goto	l753
u2120:
	line	768
	
l4301:	
;main.c: 767: {
;main.c: 768: ucTimerP5s = 0;
	clrf	(main@cTimerP5s_786)
	line	769
	
l4303:	
;main.c: 769: ucStep = STARTUP_1_HOUR_TIMER_STEP;
	movlw	(05h)
	movwf	(main@ucStep)
	goto	l4235
	line	777
	
l4305:	
;main.c: 776: {
;main.c: 777: clearThreeHoursTimer();
	fcall	_clearThreeHoursTimer
	line	778
	
l4307:	
;main.c: 778: startOneHoursTimer( 120 );
	movlw	078h
	movwf	(?_startOneHoursTimer)
	clrf	(?_startOneHoursTimer+1)
	fcall	_startOneHoursTimer
	line	779
	
l4309:	
;main.c: 779: setPB3(1);
	movlw	(01h)
	fcall	_setPB3
	line	780
	
l4311:	
;main.c: 780: setPB4(0);
	movlw	(0)
	fcall	_setPB4
	line	781
	
l4313:	
;main.c: 781: setPB5(1);
	movlw	(01h)
	fcall	_setPB5
	line	782
	
l4315:	
;main.c: 782: ucStep = CHECK_1_HOUR_TIMER_STEP;
	movlw	(06h)
	movwf	(main@ucStep)
	line	783
;main.c: 783: break;
	goto	l4235
	line	796
	
l4317:	
;main.c: 787: {
;main.c: 792: static unsigned int uiTimerOneP5s = 0;
;main.c: 793: static unsigned int uiTimerTwoP5s = 0;
;main.c: 794: static unsigned int uiTimerThreeP5s = 0;
;main.c: 796: unsigned int uiCh13Value = getAdOriginalCh13Value();
	fcall	_getAdOriginalCh13Value
	movf	(1+(?_getAdOriginalCh13Value))^080h,w
	movwf	(main@uiCh13Value+1)^080h
	movf	(0+(?_getAdOriginalCh13Value))^080h,w
	movwf	(main@uiCh13Value)^080h
	line	799
	
l4319:	
;main.c: 799: if( isFinishedOneHoursTimer() )
	fcall	_isFinishedOneHoursTimer
	xorlw	0
	skipnz
	goto	u2131
	goto	u2130
u2131:
	goto	l4323
u2130:
	goto	l4271
	line	803
	
l4323:	
;main.c: 801: else
;main.c: 802: {
;main.c: 803: if( uiCh13Value > 85 )
	movlw	high(056h)
	bsf	status, 5	;RP0=1, select bank1
	subwf	(main@uiCh13Value+1)^080h,w
	movlw	low(056h)
	skipnz
	subwf	(main@uiCh13Value)^080h,w
	skipc
	goto	u2141
	goto	u2140
u2141:
	goto	l4333
u2140:
	line	805
	
l4325:	
;main.c: 804: {
;main.c: 805: if( uiTimerOneP5s <= 1 )
	movlw	high(02h)
	subwf	(main@uiTimerOneP5s+1)^080h,w
	movlw	low(02h)
	skipnz
	subwf	(main@uiTimerOneP5s)^080h,w
	skipnc
	goto	u2151
	goto	u2150
u2151:
	goto	l4329
u2150:
	line	806
	
l4327:	
;main.c: 806: uiTimerOneP5s++;
	incf	(main@uiTimerOneP5s)^080h,f
	skipnz
	incf	(main@uiTimerOneP5s+1)^080h,f
	line	807
	
l4329:	
;main.c: 807: uiTimerTwoP5s = 0;
	clrf	(main@uiTimerTwoP5s)^080h
	clrf	(main@uiTimerTwoP5s+1)^080h
	line	808
	
l4331:	
;main.c: 808: uiTimerThreeP5s = 0;
	clrf	(main@uiTimerThreeP5s)^080h
	clrf	(main@uiTimerThreeP5s+1)^080h
	line	809
;main.c: 809: }
	goto	l4335
	line	812
	
l4333:	
;main.c: 810: else
;main.c: 811: {
;main.c: 812: uiTimerOneP5s = 0;
	clrf	(main@uiTimerOneP5s)^080h
	clrf	(main@uiTimerOneP5s+1)^080h
	line	816
	
l4335:	
;main.c: 813: }
;main.c: 816: if(uiTimerOneP5s > 1)
	movlw	high(02h)
	subwf	(main@uiTimerOneP5s+1)^080h,w
	movlw	low(02h)
	skipnz
	subwf	(main@uiTimerOneP5s)^080h,w
	skipc
	goto	u2161
	goto	u2160
u2161:
	goto	l4343
u2160:
	line	818
	
l4337:	
;main.c: 817: {
;main.c: 818: setPB3(0);
	movlw	(0)
	fcall	_setPB3
	line	819
;main.c: 819: setPB4(1);
	movlw	(01h)
	fcall	_setPB4
	line	820
;main.c: 820: setPB5(0);
	movlw	(0)
	fcall	_setPB5
	line	822
	
l4339:	
;main.c: 822: uiTimerOneP5s = 0;
	bsf	status, 5	;RP0=1, select bank1
	clrf	(main@uiTimerOneP5s)^080h
	clrf	(main@uiTimerOneP5s+1)^080h
	line	823
	
l4341:	
;main.c: 823: uiTimerTwoP5s = 0;
	clrf	(main@uiTimerTwoP5s)^080h
	clrf	(main@uiTimerTwoP5s+1)^080h
	line	824
;main.c: 824: }
	goto	l4235
	line	827
	
l4343:	
;main.c: 825: else
;main.c: 826: {
;main.c: 827: if( uiCh13Value < 75 )
	movlw	high(04Bh)
	subwf	(main@uiCh13Value+1)^080h,w
	movlw	low(04Bh)
	skipnz
	subwf	(main@uiCh13Value)^080h,w
	skipnc
	goto	u2171
	goto	u2170
u2171:
	goto	l4349
u2170:
	line	829
	
l4345:	
;main.c: 828: {
;main.c: 829: if( uiTimerTwoP5s <= 1)
	movlw	high(02h)
	subwf	(main@uiTimerTwoP5s+1)^080h,w
	movlw	low(02h)
	skipnz
	subwf	(main@uiTimerTwoP5s)^080h,w
	skipnc
	goto	u2181
	goto	u2180
u2181:
	goto	l4351
u2180:
	line	830
	
l4347:	
;main.c: 830: uiTimerTwoP5s++;
	incf	(main@uiTimerTwoP5s)^080h,f
	skipnz
	incf	(main@uiTimerTwoP5s+1)^080h,f
	goto	l4351
	line	834
	
l4349:	
;main.c: 832: else
;main.c: 833: {
;main.c: 834: uiTimerTwoP5s = 0;
	clrf	(main@uiTimerTwoP5s)^080h
	clrf	(main@uiTimerTwoP5s+1)^080h
	line	835
;main.c: 835: uiTimerThreeP5s = 0;
	clrf	(main@uiTimerThreeP5s)^080h
	clrf	(main@uiTimerThreeP5s+1)^080h
	line	838
	
l4351:	
;main.c: 836: }
;main.c: 838: if(uiTimerTwoP5s > 1)
	movlw	high(02h)
	subwf	(main@uiTimerTwoP5s+1)^080h,w
	movlw	low(02h)
	skipnz
	subwf	(main@uiTimerTwoP5s)^080h,w
	skipc
	goto	u2191
	goto	u2190
u2191:
	goto	l4235
u2190:
	line	840
	
l4353:	
;main.c: 839: {
;main.c: 840: setPB3(1);
	movlw	(01h)
	fcall	_setPB3
	line	841
;main.c: 841: setPB4(0);
	movlw	(0)
	fcall	_setPB4
	line	842
;main.c: 842: setPB5(1);
	movlw	(01h)
	fcall	_setPB5
	line	844
	
l4355:	
;main.c: 844: if(uiCh13Value < 25)
	movlw	high(019h)
	bsf	status, 5	;RP0=1, select bank1
	subwf	(main@uiCh13Value+1)^080h,w
	movlw	low(019h)
	skipnz
	subwf	(main@uiCh13Value)^080h,w
	skipnc
	goto	u2201
	goto	u2200
u2201:
	goto	l4359
u2200:
	line	845
	
l4357:	
;main.c: 845: uiTimerThreeP5s++;
	incf	(main@uiTimerThreeP5s)^080h,f
	skipnz
	incf	(main@uiTimerThreeP5s+1)^080h,f
	goto	l4361
	line	847
	
l4359:	
;main.c: 846: else
;main.c: 847: uiTimerThreeP5s = 0;
	clrf	(main@uiTimerThreeP5s)^080h
	clrf	(main@uiTimerThreeP5s+1)^080h
	line	849
	
l4361:	
;main.c: 849: if(uiTimerThreeP5s > 5)
	movlw	high(06h)
	subwf	(main@uiTimerThreeP5s+1)^080h,w
	movlw	low(06h)
	skipnz
	subwf	(main@uiTimerThreeP5s)^080h,w
	skipc
	goto	u2211
	goto	u2210
u2211:
	goto	l753
u2210:
	line	850
	
l4363:	
;main.c: 850: reset();
	fcall	_reset
	goto	l4235
	line	860
	
l4365:	
;main.c: 859: {
;main.c: 860: setPB3(0);
	movlw	(0)
	fcall	_setPB3
	line	861
;main.c: 861: setPB4(0);
	movlw	(0)
	fcall	_setPB4
	line	862
;main.c: 862: setPB5(1);
	movlw	(01h)
	fcall	_setPB5
	line	866
	
l4367:	
;main.c: 866: ucStep = DELAY_ONE_SECOND_FOR_PWM;
	movlw	(064h)
	movwf	(main@ucStep)
	line	867
;main.c: 867: break;
	goto	l4235
	line	873
	
l4369:	
;main.c: 871: {
;main.c: 872: static unsigned ucDelay1s = 0;
;main.c: 873: if(ucDelay1s <= 5)
	movlw	high(06h)
	bsf	status, 5	;RP0=1, select bank1
	subwf	(main@ucDelay1s+1)^080h,w
	movlw	low(06h)
	skipnz
	subwf	(main@ucDelay1s)^080h,w
	skipnc
	goto	u2221
	goto	u2220
u2221:
	goto	l4373
u2220:
	line	874
	
l4371:	
;main.c: 874: ucDelay1s++;
	incf	(main@ucDelay1s)^080h,f
	skipnz
	incf	(main@ucDelay1s+1)^080h,f
	goto	l4235
	line	877
	
l4373:	
;main.c: 875: else
;main.c: 876: {
;main.c: 877: ucDelay1s = 0;
	clrf	(main@ucDelay1s)^080h
	clrf	(main@ucDelay1s+1)^080h
	line	878
	
l4375:	
;main.c: 878: ucStep = MEET_RESET_CONDITION_STEP;
	movlw	(065h)
	bcf	status, 5	;RP0=0, select bank0
	movwf	(main@ucStep)
	goto	l4235
	line	890
	
l4377:	
;main.c: 888: {
;main.c: 889: static unsigned char ucTimerP5s = 0;
;main.c: 890: unsigned int ucChValue = getAdOriginalCh13Value();
	fcall	_getAdOriginalCh13Value
	movf	(1+(?_getAdOriginalCh13Value))^080h,w
	movwf	(main@ucChValue+1)^080h
	movf	(0+(?_getAdOriginalCh13Value))^080h,w
	movwf	(main@ucChValue)^080h
	line	892
	
l4379:	
;main.c: 892: if( ucChValue > 50 )
	movlw	high(033h)
	subwf	(main@ucChValue+1)^080h,w
	movlw	low(033h)
	skipnz
	subwf	(main@ucChValue)^080h,w
	skipc
	goto	u2231
	goto	u2230
u2231:
	goto	l4383
u2230:
	line	893
	
l4381:	
;main.c: 893: ucTimerP5s++;
	bcf	status, 5	;RP0=0, select bank0
	incf	(main@cTimerP5s_792),f
	goto	l4385
	line	895
	
l4383:	
;main.c: 894: else
;main.c: 895: ucTimerP5s = 0;
	bcf	status, 5	;RP0=0, select bank0
	clrf	(main@cTimerP5s_792)
	line	897
	
l4385:	
;main.c: 897: if(ucTimerP5s >= 5)
	movlw	(05h)
	subwf	(main@cTimerP5s_792),w
	skipc
	goto	u2241
	goto	u2240
u2241:
	goto	l753
u2240:
	line	898
	
l4387:	
;main.c: 898: ucStep = RESET_STEP;
	movlw	(066h)
	movwf	(main@ucStep)
	goto	l4235
	line	904
	
l4389:	
;main.c: 903: {
;main.c: 904: ucStep = INIT_STEP;
	clrf	(main@ucStep)
	goto	l4363
	line	660
	
l4395:	
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
	goto	l4243
	xorlw	1^0	; case 1
	skipnz
	goto	l4261
	xorlw	2^1	; case 2
	skipnz
	goto	l4269
	xorlw	3^2	; case 3
	skipnz
	goto	l4285
	xorlw	4^3	; case 4
	skipnz
	goto	l4289
	xorlw	5^4	; case 5
	skipnz
	goto	l4305
	xorlw	6^5	; case 6
	skipnz
	goto	l4317
	xorlw	99^6	; case 99
	skipnz
	goto	l4365
	xorlw	100^99	; case 100
	skipnz
	goto	l4369
	xorlw	101^100	; case 101
	skipnz
	goto	l4377
	xorlw	102^101	; case 102
	skipnz
	goto	l4389
	goto	l753
	opt asmopt_on

	global	start
	ljmp	start
	opt stack 0
psect	maintext
	line	917
GLOBAL	__end_of_main
	__end_of_main:
;; =============== function _main ends ============

	signat	_main,90
	global	_getAdOriginalCh13Value
psect	text1179,local,class=CODE,delta=2
global __ptext1179
__ptext1179:

;; *************** function _getAdOriginalCh13Value *****************
;; Defined at:
;;		line 344 in file "D:\develop\AK7030-good\AK7030-OTP\common.c"
;; Parameters:    Size  Location     Type
;;		None
;; Auto vars:     Size  Location     Type
;;		None
;; Return value:  Size  Location     Type
;;                  2   15[BANK1 ] unsigned int 
;; Registers used:
;;		wreg, fsr0l, fsr0h, status,2, status,0, btemp+1, pclath, cstack
;; Tracked objects:
;;		On entry : 60/0
;;		On exit  : 60/20
;;		Unchanged: FFE00/0
;; Data sizes:     COMMON   BANK0   BANK1   BANK3   BANK2
;;      Params:         0       0       2       0       0
;;      Locals:         0       0       0       0       0
;;      Temps:          0       0       0       0       0
;;      Totals:         0       0       2       0       0
;;Total ram usage:        2 bytes
;; Hardware stack levels used:    1
;; Hardware stack levels required when called:    4
;; This function calls:
;;		_FilterCh13
;; This function is called by:
;;		_main
;; This function uses a non-reentrant model
;;
psect	text1179
	file	"D:\develop\AK7030-good\AK7030-OTP\common.c"
	line	344
	global	__size_of_getAdOriginalCh13Value
	__size_of_getAdOriginalCh13Value	equ	__end_of_getAdOriginalCh13Value-_getAdOriginalCh13Value
	
_getAdOriginalCh13Value:	
	opt	stack 3
; Regs used in _getAdOriginalCh13Value: [wreg-fsr0h+status,2+status,0+btemp+1+pclath+cstack]
	line	346
	
l4219:	
;common.c: 346: return FilterCh13(uiSampleChannelFourth);
	movlw	(_uiSampleChannelFourth)&0ffh
	fcall	_FilterCh13
	movf	(1+(?_FilterCh13)),w
	bsf	status, 5	;RP0=1, select bank1
	movwf	(?_getAdOriginalCh13Value+1)^080h
	bcf	status, 5	;RP0=0, select bank0
	movf	(0+(?_FilterCh13)),w
	bsf	status, 5	;RP0=1, select bank1
	movwf	(?_getAdOriginalCh13Value)^080h
	line	351
	
l1584:	
	return
	opt stack 0
GLOBAL	__end_of_getAdOriginalCh13Value
	__end_of_getAdOriginalCh13Value:
;; =============== function _getAdOriginalCh13Value ends ============

	signat	_getAdOriginalCh13Value,90
	global	_process_AD_Converter_Value
psect	text1180,local,class=CODE,delta=2
global __ptext1180
__ptext1180:

;; *************** function _process_AD_Converter_Value *****************
;; Defined at:
;;		line 366 in file "D:\develop\AK7030-good\AK7030-OTP\common.c"
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
;; Hardware stack levels required when called:    4
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
psect	text1180
	file	"D:\develop\AK7030-good\AK7030-OTP\common.c"
	line	366
	global	__size_of_process_AD_Converter_Value
	__size_of_process_AD_Converter_Value	equ	__end_of_process_AD_Converter_Value-_process_AD_Converter_Value
	
_process_AD_Converter_Value:	
	opt	stack 3
; Regs used in _process_AD_Converter_Value: [wreg+status,2+status,0+pclath+cstack]
	line	367
	
l4207:	
;common.c: 367: if(getAD_ConvertFlag())
	fcall	_getAD_ConvertFlag
	xorlw	0
	skipnz
	goto	u2011
	goto	u2010
u2011:
	goto	l1593
u2010:
	line	369
	
l4209:	
;common.c: 368: {
;common.c: 369: setAD_ConvertFlag(0);
	movlw	(0)
	fcall	_setAD_ConvertFlag
	line	370
;common.c: 370: AD_Sample();
	fcall	_AD_Sample
	line	371
	
l4211:	
;common.c: 371: if(12 == sampleChannelSelect)
	movf	(_sampleChannelSelect),w
	xorlw	0Ch
	skipz
	goto	u2021
	goto	u2020
u2021:
	goto	l4215
u2020:
	line	372
	
l4213:	
;common.c: 372: adc_test_init(12,3);
	movlw	(03h)
	movwf	(?_adc_test_init)
	movlw	(0Ch)
	fcall	_adc_test_init
	goto	l4217
	line	374
	
l4215:	
;common.c: 373: else
;common.c: 374: adc_test_init(13,3);
	movlw	(03h)
	movwf	(?_adc_test_init)
	movlw	(0Dh)
	fcall	_adc_test_init
	line	375
	
l4217:	
;common.c: 375: adc_start();
	fcall	_adc_start
	line	377
	
l1593:	
	return
	opt stack 0
GLOBAL	__end_of_process_AD_Converter_Value
	__end_of_process_AD_Converter_Value:
;; =============== function _process_AD_Converter_Value ends ============

	signat	_process_AD_Converter_Value,88
	global	_setPinInitVaule
psect	text1181,local,class=CODE,delta=2
global __ptext1181
__ptext1181:

;; *************** function _setPinInitVaule *****************
;; Defined at:
;;		line 279 in file "D:\develop\AK7030-good\AK7030-OTP\main.c"
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
;; Hardware stack levels required when called:    4
;; This function calls:
;;		_setPB3
;;		_setPB4
;;		_setPB5
;; This function is called by:
;;		_main
;; This function uses a non-reentrant model
;;
psect	text1181
	file	"D:\develop\AK7030-good\AK7030-OTP\main.c"
	line	279
	global	__size_of_setPinInitVaule
	__size_of_setPinInitVaule	equ	__end_of_setPinInitVaule-_setPinInitVaule
	
_setPinInitVaule:	
	opt	stack 3
; Regs used in _setPinInitVaule: [wreg+status,2+status,0+pclath+cstack]
	line	281
	
l4205:	
;main.c: 281: setPB3(1);
	movlw	(01h)
	fcall	_setPB3
	line	282
;main.c: 282: setPB4(0);
	movlw	(0)
	fcall	_setPB4
	line	283
;main.c: 283: setPB5(1);
	movlw	(01h)
	fcall	_setPB5
	line	287
	
l716:	
	return
	opt stack 0
GLOBAL	__end_of_setPinInitVaule
	__end_of_setPinInitVaule:
;; =============== function _setPinInitVaule ends ============

	signat	_setPinInitVaule,88
	global	_initPin
psect	text1182,local,class=CODE,delta=2
global __ptext1182
__ptext1182:

;; *************** function _initPin *****************
;; Defined at:
;;		line 263 in file "D:\develop\AK7030-good\AK7030-OTP\main.c"
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
;; Hardware stack levels required when called:    4
;; This function calls:
;;		_initPB2_AsHighResistence
;;		_initPB3
;;		_initPB4
;;		_initPB5
;; This function is called by:
;;		_main
;; This function uses a non-reentrant model
;;
psect	text1182
	file	"D:\develop\AK7030-good\AK7030-OTP\main.c"
	line	263
	global	__size_of_initPin
	__size_of_initPin	equ	__end_of_initPin-_initPin
	
_initPin:	
	opt	stack 3
; Regs used in _initPin: [wreg+status,2+status,0+pclath+cstack]
	line	265
	
l4197:	
;main.c: 265: initPB2_AsHighResistence();
	fcall	_initPB2_AsHighResistence
	line	267
	
l4199:	
;main.c: 267: initPB3(0);
	movlw	(0)
	fcall	_initPB3
	line	269
	
l4201:	
;main.c: 269: initPB4(0);
	movlw	(0)
	fcall	_initPB4
	line	271
	
l4203:	
;main.c: 271: initPB5(0);
	movlw	(0)
	fcall	_initPB5
	line	276
	
l713:	
	return
	opt stack 0
GLOBAL	__end_of_initPin
	__end_of_initPin:
;; =============== function _initPin ends ============

	signat	_initPin,88
	global	_AD_Sample
psect	text1183,local,class=CODE,delta=2
global __ptext1183
__ptext1183:

;; *************** function _AD_Sample *****************
;; Defined at:
;;		line 389 in file "D:\develop\AK7030-good\AK7030-OTP\common.c"
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
;; Hardware stack levels required when called:    3
;; This function calls:
;;		Nothing
;; This function is called by:
;;		_process_AD_Converter_Value
;; This function uses a non-reentrant model
;;
psect	text1183
	file	"D:\develop\AK7030-good\AK7030-OTP\common.c"
	line	389
	global	__size_of_AD_Sample
	__size_of_AD_Sample	equ	__end_of_AD_Sample-_AD_Sample
	
_AD_Sample:	
	opt	stack 3
; Regs used in _AD_Sample: [wreg+status,2+status,0]
	line	390
	
l4183:	
;common.c: 390: if(sampleTimes < 3)
	movlw	(03h)
	subwf	(_sampleTimes),w
	skipnc
	goto	u1981
	goto	u1980
u1981:
	goto	l1600
u1980:
	line	392
	
l4185:	
;common.c: 391: {
;common.c: 392: sampleTimes++;
	incf	(_sampleTimes),f
	line	394
	
l4187:	
;common.c: 394: if(sampleTimes >= 3)
	movlw	(03h)
	subwf	(_sampleTimes),w
	skipc
	goto	u1991
	goto	u1990
u1991:
	goto	l1600
u1990:
	line	396
	
l4189:	
;common.c: 395: {
;common.c: 396: sampleTimes = 0;
	clrf	(_sampleTimes)
	line	398
	
l4191:	
;common.c: 398: if(sampleChannelSelect == 12)
	movf	(_sampleChannelSelect),w
	xorlw	0Ch
	skipz
	goto	u2001
	goto	u2000
u2001:
	goto	l4195
u2000:
	line	400
	
l4193:	
;common.c: 399: {
;common.c: 400: sampleChannelSelect = 13;
	movlw	(0Dh)
	movwf	(_sampleChannelSelect)
	line	401
;common.c: 401: }
	goto	l1600
	line	405
	
l4195:	
;common.c: 403: else
;common.c: 404: {
;common.c: 405: sampleChannelSelect = 12;
	movlw	(0Ch)
	movwf	(_sampleChannelSelect)
	line	409
	
l1600:	
	return
	opt stack 0
GLOBAL	__end_of_AD_Sample
	__end_of_AD_Sample:
;; =============== function _AD_Sample ends ============

	signat	_AD_Sample,88
	global	_setAD_ConvertFlag
psect	text1184,local,class=CODE,delta=2
global __ptext1184
__ptext1184:

;; *************** function _setAD_ConvertFlag *****************
;; Defined at:
;;		line 321 in file "D:\develop\AK7030-good\AK7030-OTP\common.c"
;; Parameters:    Size  Location     Type
;;  flag            1    wreg     unsigned char 
;; Auto vars:     Size  Location     Type
;;  flag            1   23[BANK0 ] unsigned char 
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
;; Hardware stack levels required when called:    3
;; This function calls:
;;		Nothing
;; This function is called by:
;;		_process_AD_Converter_Value
;; This function uses a non-reentrant model
;;
psect	text1184
	file	"D:\develop\AK7030-good\AK7030-OTP\common.c"
	line	321
	global	__size_of_setAD_ConvertFlag
	__size_of_setAD_ConvertFlag	equ	__end_of_setAD_ConvertFlag-_setAD_ConvertFlag
	
_setAD_ConvertFlag:	
	opt	stack 3
; Regs used in _setAD_ConvertFlag: [wreg]
;setAD_ConvertFlag@flag stored from wreg
	movwf	(setAD_ConvertFlag@flag)
	line	322
	
l4181:	
;common.c: 322: adc_convert_flag = flag;
	movf	(setAD_ConvertFlag@flag),w
	movwf	(_adc_convert_flag)
	line	323
	
l1578:	
	return
	opt stack 0
GLOBAL	__end_of_setAD_ConvertFlag
	__end_of_setAD_ConvertFlag:
;; =============== function _setAD_ConvertFlag ends ============

	signat	_setAD_ConvertFlag,4216
	global	_getAD_ConvertFlag
psect	text1185,local,class=CODE,delta=2
global __ptext1185
__ptext1185:

;; *************** function _getAD_ConvertFlag *****************
;; Defined at:
;;		line 315 in file "D:\develop\AK7030-good\AK7030-OTP\common.c"
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
;; Hardware stack levels required when called:    3
;; This function calls:
;;		Nothing
;; This function is called by:
;;		_process_AD_Converter_Value
;; This function uses a non-reentrant model
;;
psect	text1185
	file	"D:\develop\AK7030-good\AK7030-OTP\common.c"
	line	315
	global	__size_of_getAD_ConvertFlag
	__size_of_getAD_ConvertFlag	equ	__end_of_getAD_ConvertFlag-_getAD_ConvertFlag
	
_getAD_ConvertFlag:	
	opt	stack 3
; Regs used in _getAD_ConvertFlag: [wreg]
	line	316
	
l4177:	
;common.c: 316: return adc_convert_flag;
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	movf	(_adc_convert_flag),w
	line	317
	
l1575:	
	return
	opt stack 0
GLOBAL	__end_of_getAD_ConvertFlag
	__end_of_getAD_ConvertFlag:
;; =============== function _getAD_ConvertFlag ends ============

	signat	_getAD_ConvertFlag,89
	global	_FilterCh13
psect	text1186,local,class=CODE,delta=2
global __ptext1186
__ptext1186:

;; *************** function _FilterCh13 *****************
;; Defined at:
;;		line 64 in file "D:\develop\AK7030-good\AK7030-OTP\common.c"
;; Parameters:    Size  Location     Type
;;  tmpValue        1    wreg     PTR int 
;;		 -> uiSampleChannelFourth(6), 
;; Auto vars:     Size  Location     Type
;;  tmpValue        1    0[BANK1 ] PTR int 
;;		 -> uiSampleChannelFourth(6), 
;;  cir             2   11[BANK1 ] int 
;;  filter_buf      6    5[BANK1 ] unsigned int [3]
;;  filter_sum      2    3[BANK1 ] unsigned int 
;;  filter_temp     2    1[BANK1 ] unsigned int 
;;  i               1   14[BANK1 ] unsigned char 
;;  j               1   13[BANK1 ] unsigned char 
;; Return value:  Size  Location     Type
;;                  2   23[BANK0 ] unsigned int 
;; Registers used:
;;		wreg, fsr0l, fsr0h, status,2, status,0, btemp+1
;; Tracked objects:
;;		On entry : 60/0
;;		On exit  : 60/0
;;		Unchanged: FFE00/0
;; Data sizes:     COMMON   BANK0   BANK1   BANK3   BANK2
;;      Params:         0       2       0       0       0
;;      Locals:         0       0      15       0       0
;;      Temps:          0       4       0       0       0
;;      Totals:         0       6      15       0       0
;;Total ram usage:       21 bytes
;; Hardware stack levels used:    1
;; Hardware stack levels required when called:    3
;; This function calls:
;;		Nothing
;; This function is called by:
;;		_getAdOriginalCh13Value
;; This function uses a non-reentrant model
;;
psect	text1186
	file	"D:\develop\AK7030-good\AK7030-OTP\common.c"
	line	64
	global	__size_of_FilterCh13
	__size_of_FilterCh13	equ	__end_of_FilterCh13-_FilterCh13
	
_FilterCh13:	
	opt	stack 3
; Regs used in _FilterCh13: [wreg-fsr0h+status,2+status,0+btemp+1]
;FilterCh13@tmpValue stored from wreg
	bsf	status, 5	;RP0=1, select bank1
	movwf	(FilterCh13@tmpValue)^080h
	line	65
	
l4127:	
	clrf	(FilterCh13@j)^080h
	line	67
;common.c: 67: unsigned int filter_temp = 0, filter_sum = 0;
	clrf	(FilterCh13@filter_temp)^080h
	clrf	(FilterCh13@filter_temp+1)^080h
	clrf	(FilterCh13@filter_sum)^080h
	clrf	(FilterCh13@filter_sum+1)^080h
	line	71
;common.c: 69: unsigned int filter_buf[3];
;common.c: 71: for(int cir = 0;cir < 3; cir++)
	clrf	(FilterCh13@cir)^080h
	clrf	(FilterCh13@cir+1)^080h
	line	72
	
l4133:	
;common.c: 72: filter_buf[cir] = *tmpValue++;
	bsf	status, 5	;RP0=1, select bank1
	bcf	status, 6	;RP1=0, select bank1
	movf	(FilterCh13@tmpValue)^080h,w
	movwf	fsr0
	bcf	status, 7	;select IRP bank0
	movf	indf,w
	bcf	status, 5	;RP0=0, select bank0
	movwf	(??_FilterCh13+0)+0+0
	incf	fsr0,f
	movf	indf,w
	movwf	(??_FilterCh13+0)+0+1
	bsf	status, 5	;RP0=1, select bank1
	clrc
	rlf	(FilterCh13@cir)^080h,w
	addlw	FilterCh13@filter_buf&0ffh
	movwf	fsr0
	bcf	status, 5	;RP0=0, select bank0
	movf	0+(??_FilterCh13+0)+0,w
	movwf	indf
	incf	fsr0,f
	movf	1+(??_FilterCh13+0)+0,w
	movwf	indf
	
l4135:	
	bsf	status, 5	;RP0=1, select bank1
	incf	(FilterCh13@tmpValue)^080h,f
	incf	(FilterCh13@tmpValue)^080h,f
	line	71
	
l4137:	
	incf	(FilterCh13@cir)^080h,f
	skipnz
	incf	(FilterCh13@cir+1)^080h,f
	
l4139:	
	movf	(FilterCh13@cir+1)^080h,w
	xorlw	80h
	movwf	btemp+1
	movlw	(high(03h))^80h
	subwf	btemp+1,w
	skipz
	goto	u1935
	movlw	low(03h)
	subwf	(FilterCh13@cir)^080h,w
u1935:

	skipc
	goto	u1931
	goto	u1930
u1931:
	goto	l4133
u1930:
	line	76
	
l4141:	
;common.c: 76: for(j = 0; j < 3 - 1; j++)
	bsf	status, 5	;RP0=1, select bank1
	bcf	status, 6	;RP1=0, select bank1
	clrf	(FilterCh13@j)^080h
	line	78
	
l4147:	
;common.c: 77: {
;common.c: 78: for(i = 0; i < 3 - 1 - j; i++)
	clrf	(FilterCh13@i)^080h
	goto	l4155
	line	80
	
l4149:	
;common.c: 79: {
;common.c: 80: if(filter_buf[i] > filter_buf[i + 1])
	bsf	status, 5	;RP0=1, select bank1
	bcf	status, 6	;RP1=0, select bank1
	clrc
	rlf	(FilterCh13@i)^080h,w
	addlw	FilterCh13@filter_buf&0ffh
	movwf	fsr0
	bcf	status, 7	;select IRP bank1
	movf	indf,w
	bcf	status, 5	;RP0=0, select bank0
	movwf	(??_FilterCh13+0)+0+0
	incf	fsr0,f
	movf	indf,w
	movwf	(??_FilterCh13+0)+0+1
	bsf	status, 5	;RP0=1, select bank1
	clrc
	rlf	(FilterCh13@i)^080h,w
	addlw	02h
	addlw	FilterCh13@filter_buf&0ffh
	movwf	fsr0
	movf	indf,w
	bcf	status, 5	;RP0=0, select bank0
	movwf	(??_FilterCh13+2)+0+0
	incf	fsr0,f
	movf	indf,w
	movwf	(??_FilterCh13+2)+0+1
	movf	1+(??_FilterCh13+0)+0,w
	subwf	1+(??_FilterCh13+2)+0,w
	skipz
	goto	u1945
	movf	0+(??_FilterCh13+0)+0,w
	subwf	0+(??_FilterCh13+2)+0,w
u1945:
	skipnc
	goto	u1941
	goto	u1940
u1941:
	goto	l4153
u1940:
	line	83
	
l4151:	
;common.c: 81: {
;common.c: 83: filter_temp = filter_buf[i];
	bsf	status, 5	;RP0=1, select bank1
	clrc
	rlf	(FilterCh13@i)^080h,w
	addlw	FilterCh13@filter_buf&0ffh
	movwf	fsr0
	movf	indf,w
	movwf	(FilterCh13@filter_temp)^080h
	incf	fsr0,f
	movf	indf,w
	movwf	(FilterCh13@filter_temp+1)^080h
	line	85
;common.c: 85: filter_buf[i] = filter_buf[i + 1];
	clrc
	rlf	(FilterCh13@i)^080h,w
	addlw	02h
	addlw	FilterCh13@filter_buf&0ffh
	movwf	fsr0
	movf	indf,w
	bcf	status, 5	;RP0=0, select bank0
	movwf	(??_FilterCh13+0)+0+0
	incf	fsr0,f
	movf	indf,w
	movwf	(??_FilterCh13+0)+0+1
	bsf	status, 5	;RP0=1, select bank1
	clrc
	rlf	(FilterCh13@i)^080h,w
	addlw	FilterCh13@filter_buf&0ffh
	movwf	fsr0
	bcf	status, 5	;RP0=0, select bank0
	movf	0+(??_FilterCh13+0)+0,w
	movwf	indf
	incf	fsr0,f
	movf	1+(??_FilterCh13+0)+0,w
	movwf	indf
	line	87
;common.c: 87: filter_buf[i + 1] = filter_temp;
	bsf	status, 5	;RP0=1, select bank1
	clrc
	rlf	(FilterCh13@i)^080h,w
	addlw	02h
	addlw	FilterCh13@filter_buf&0ffh
	movwf	fsr0
	movf	(FilterCh13@filter_temp)^080h,w
	movwf	indf
	incf	fsr0,f
	movf	(FilterCh13@filter_temp+1)^080h,w
	movwf	indf
	line	78
	
l4153:	
	bsf	status, 5	;RP0=1, select bank1
	incf	(FilterCh13@i)^080h,f
	
l4155:	
	movlw	high(02h)
	bcf	status, 5	;RP0=0, select bank0
	movwf	(??_FilterCh13+0)+0+1
	bsf	status, 5	;RP0=1, select bank1
	movf	(FilterCh13@j)^080h,w
	sublw	low(02h)
	bcf	status, 5	;RP0=0, select bank0
	movwf	(??_FilterCh13+0)+0
	skipc
	decf	(??_FilterCh13+0)+0+1,f
	movf	1+(??_FilterCh13+0)+0,w
	xorlw	80h
	sublw	080h
	skipz
	goto	u1955
	movf	0+(??_FilterCh13+0)+0,w
	bsf	status, 5	;RP0=1, select bank1
	subwf	(FilterCh13@i)^080h,w
u1955:

	skipc
	goto	u1951
	goto	u1950
u1951:
	goto	l4149
u1950:
	line	76
	
l4157:	
	bsf	status, 5	;RP0=1, select bank1
	bcf	status, 6	;RP1=0, select bank1
	incf	(FilterCh13@j)^080h,f
	
l4159:	
	movlw	(02h)
	subwf	(FilterCh13@j)^080h,w
	skipc
	goto	u1961
	goto	u1960
u1961:
	goto	l4147
u1960:
	line	92
	
l4161:	
	goto	l4171
	line	94
	
l4165:	
;common.c: 93: {
;common.c: 94: filter_sum += filter_buf[i];
	clrc
	rlf	(FilterCh13@i)^080h,w
	addlw	FilterCh13@filter_buf&0ffh
	movwf	fsr0
	movf	indf,w
	bcf	status, 5	;RP0=0, select bank0
	movwf	(??_FilterCh13+0)+0+0
	incf	fsr0,f
	movf	indf,w
	movwf	(??_FilterCh13+0)+0+1
	movf	0+(??_FilterCh13+0)+0,w
	bsf	status, 5	;RP0=1, select bank1
	addwf	(FilterCh13@filter_sum)^080h,f
	skipnc
	incf	(FilterCh13@filter_sum+1)^080h,f
	bcf	status, 5	;RP0=0, select bank0
	movf	1+(??_FilterCh13+0)+0,w
	bsf	status, 5	;RP0=1, select bank1
	addwf	(FilterCh13@filter_sum+1)^080h,f
	line	92
	
l4167:	
	incf	(FilterCh13@i)^080h,f
	
l4169:	
	movf	(FilterCh13@i)^080h,w
	skipz
	goto	u1970
	goto	l4165
u1970:
	line	98
	
l4171:	
;common.c: 95: }
;common.c: 98: return (filter_sum >> 2 );
	movf	(FilterCh13@filter_sum+1)^080h,w
	bcf	status, 5	;RP0=0, select bank0
	movwf	(?_FilterCh13+1)
	bsf	status, 5	;RP0=1, select bank1
	movf	(FilterCh13@filter_sum)^080h,w
	bcf	status, 5	;RP0=0, select bank0
	movwf	(?_FilterCh13)
	
l4173:	
	clrc
	rrf	(?_FilterCh13+1),f
	rrf	(?_FilterCh13),f
	clrc
	rrf	(?_FilterCh13+1),f
	rrf	(?_FilterCh13),f
	line	99
	
l1503:	
	return
	opt stack 0
GLOBAL	__end_of_FilterCh13
	__end_of_FilterCh13:
;; =============== function _FilterCh13 ends ============

	signat	_FilterCh13,4218
	global	_isFinishedOneHoursTimer
psect	text1187,local,class=CODE,delta=2
global __ptext1187
__ptext1187:

;; *************** function _isFinishedOneHoursTimer *****************
;; Defined at:
;;		line 555 in file "D:\develop\AK7030-good\AK7030-OTP\common.c"
;; Parameters:    Size  Location     Type
;;		None
;; Auto vars:     Size  Location     Type
;;		None
;; Return value:  Size  Location     Type
;;                  1    wreg      unsigned char 
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
;; Hardware stack levels required when called:    3
;; This function calls:
;;		Nothing
;; This function is called by:
;;		_main
;; This function uses a non-reentrant model
;;
psect	text1187
	file	"D:\develop\AK7030-good\AK7030-OTP\common.c"
	line	555
	global	__size_of_isFinishedOneHoursTimer
	__size_of_isFinishedOneHoursTimer	equ	__end_of_isFinishedOneHoursTimer-_isFinishedOneHoursTimer
	
_isFinishedOneHoursTimer:	
	opt	stack 4
; Regs used in _isFinishedOneHoursTimer: [wreg+status,2+status,0]
	line	556
	
l4111:	
;common.c: 556: if((uiOneHourTimer == 0) && bOneHourTimerStartFlag)
	bcf	status, 5	;RP0=0, select bank0
	movf	((_uiOneHourTimer+1)),w
	iorwf	((_uiOneHourTimer)),w
	skipz
	goto	u1911
	goto	u1910
u1911:
	goto	l4123
u1910:
	
l4113:	
	movf	(_bOneHourTimerStartFlag),w
	skipz
	goto	u1920
	goto	l4123
u1920:
	line	558
	
l4115:	
;common.c: 557: {
;common.c: 558: bOneHourTimerStartFlag = 0;
	clrf	(_bOneHourTimerStartFlag)
	line	559
	
l4117:	
;common.c: 559: return 1;
	movlw	(01h)
	goto	l1650
	line	562
	
l4123:	
;common.c: 561: else
;common.c: 562: return 0;
	movlw	(0)
	line	563
	
l1650:	
	return
	opt stack 0
GLOBAL	__end_of_isFinishedOneHoursTimer
	__end_of_isFinishedOneHoursTimer:
;; =============== function _isFinishedOneHoursTimer ends ============

	signat	_isFinishedOneHoursTimer,89
	global	_startOneHoursTimer
psect	text1188,local,class=CODE,delta=2
global __ptext1188
__ptext1188:

;; *************** function _startOneHoursTimer *****************
;; Defined at:
;;		line 472 in file "D:\develop\AK7030-good\AK7030-OTP\common.c"
;; Parameters:    Size  Location     Type
;;  uiSetTime       2   23[BANK0 ] unsigned int 
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
;; Hardware stack levels required when called:    3
;; This function calls:
;;		Nothing
;; This function is called by:
;;		_main
;; This function uses a non-reentrant model
;;
psect	text1188
	file	"D:\develop\AK7030-good\AK7030-OTP\common.c"
	line	472
	global	__size_of_startOneHoursTimer
	__size_of_startOneHoursTimer	equ	__end_of_startOneHoursTimer-_startOneHoursTimer
	
_startOneHoursTimer:	
	opt	stack 4
; Regs used in _startOneHoursTimer: [wreg+status,2+status,0]
	line	473
	
l4103:	
;common.c: 473: if(( 0 == uiOneHourTimer ) && ( 0 == bOneHourTimerStartFlag ))
	movf	((_uiOneHourTimer+1)),w
	iorwf	((_uiOneHourTimer)),w
	skipz
	goto	u1891
	goto	u1890
u1891:
	goto	l1627
u1890:
	
l4105:	
	movf	(_bOneHourTimerStartFlag),f
	skipz
	goto	u1901
	goto	u1900
u1901:
	goto	l1627
u1900:
	line	475
	
l4107:	
;common.c: 474: {
;common.c: 475: uiOneHourTimer = uiSetTime;
	movf	(startOneHoursTimer@uiSetTime+1),w
	movwf	(_uiOneHourTimer+1)
	movf	(startOneHoursTimer@uiSetTime),w
	movwf	(_uiOneHourTimer)
	line	476
	
l4109:	
;common.c: 476: bOneHourTimerStartFlag = 1;
	clrf	(_bOneHourTimerStartFlag)
	incf	(_bOneHourTimerStartFlag),f
	line	482
	
l1627:	
	return
	opt stack 0
GLOBAL	__end_of_startOneHoursTimer
	__end_of_startOneHoursTimer:
;; =============== function _startOneHoursTimer ends ============

	signat	_startOneHoursTimer,4216
	global	_clearThreeHoursTimer
psect	text1189,local,class=CODE,delta=2
global __ptext1189
__ptext1189:

;; *************** function _clearThreeHoursTimer *****************
;; Defined at:
;;		line 439 in file "D:\develop\AK7030-good\AK7030-OTP\common.c"
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
;; Hardware stack levels required when called:    3
;; This function calls:
;;		Nothing
;; This function is called by:
;;		_main
;; This function uses a non-reentrant model
;;
psect	text1189
	file	"D:\develop\AK7030-good\AK7030-OTP\common.c"
	line	439
	global	__size_of_clearThreeHoursTimer
	__size_of_clearThreeHoursTimer	equ	__end_of_clearThreeHoursTimer-_clearThreeHoursTimer
	
_clearThreeHoursTimer:	
	opt	stack 4
; Regs used in _clearThreeHoursTimer: [status,2]
	line	440
	
l4101:	
;common.c: 440: uiSmallTimer = 0;
	clrf	(_uiSmallTimer)
	clrf	(_uiSmallTimer+1)
	line	441
;common.c: 441: bSmallTimerStartFlag = 0;
	clrf	(_bSmallTimerStartFlag)
	line	442
	
l1613:	
	return
	opt stack 0
GLOBAL	__end_of_clearThreeHoursTimer
	__end_of_clearThreeHoursTimer:
;; =============== function _clearThreeHoursTimer ends ============

	signat	_clearThreeHoursTimer,88
	global	_isFinishedThreeHoursTimer
psect	text1190,local,class=CODE,delta=2
global __ptext1190
__ptext1190:

;; *************** function _isFinishedThreeHoursTimer *****************
;; Defined at:
;;		line 542 in file "D:\develop\AK7030-good\AK7030-OTP\common.c"
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
;; Hardware stack levels required when called:    3
;; This function calls:
;;		Nothing
;; This function is called by:
;;		_main
;; This function uses a non-reentrant model
;;
psect	text1190
	file	"D:\develop\AK7030-good\AK7030-OTP\common.c"
	line	542
	global	__size_of_isFinishedThreeHoursTimer
	__size_of_isFinishedThreeHoursTimer	equ	__end_of_isFinishedThreeHoursTimer-_isFinishedThreeHoursTimer
	
_isFinishedThreeHoursTimer:	
	opt	stack 4
; Regs used in _isFinishedThreeHoursTimer: [wreg+status,2+status,0]
	line	543
	
l4085:	
;common.c: 543: if((uiSmallTimer == 0) && bSmallTimerStartFlag)
	movf	((_uiSmallTimer+1)),w
	iorwf	((_uiSmallTimer)),w
	skipz
	goto	u1871
	goto	u1870
u1871:
	goto	l4097
u1870:
	
l4087:	
	movf	(_bSmallTimerStartFlag),w
	skipz
	goto	u1880
	goto	l4097
u1880:
	line	545
	
l4089:	
;common.c: 544: {
;common.c: 545: bSmallTimerStartFlag = 0;
	clrf	(_bSmallTimerStartFlag)
	line	546
	
l4091:	
;common.c: 546: return 1;
	movlw	(01h)
	goto	l1645
	line	549
	
l4097:	
;common.c: 548: else
;common.c: 549: return 0;
	movlw	(0)
	line	550
	
l1645:	
	return
	opt stack 0
GLOBAL	__end_of_isFinishedThreeHoursTimer
	__end_of_isFinishedThreeHoursTimer:
;; =============== function _isFinishedThreeHoursTimer ends ============

	signat	_isFinishedThreeHoursTimer,89
	global	_startThreeHoursTimer
psect	text1191,local,class=CODE,delta=2
global __ptext1191
__ptext1191:

;; *************** function _startThreeHoursTimer *****************
;; Defined at:
;;		line 459 in file "D:\develop\AK7030-good\AK7030-OTP\common.c"
;; Parameters:    Size  Location     Type
;;  uiSetTime       2   23[BANK0 ] unsigned int 
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
;; Hardware stack levels required when called:    3
;; This function calls:
;;		Nothing
;; This function is called by:
;;		_main
;; This function uses a non-reentrant model
;;
psect	text1191
	file	"D:\develop\AK7030-good\AK7030-OTP\common.c"
	line	459
	global	__size_of_startThreeHoursTimer
	__size_of_startThreeHoursTimer	equ	__end_of_startThreeHoursTimer-_startThreeHoursTimer
	
_startThreeHoursTimer:	
	opt	stack 4
; Regs used in _startThreeHoursTimer: [wreg+status,2+status,0]
	line	460
	
l4077:	
;common.c: 460: if(( 0 == uiSmallTimer ) && ( 0 == bSmallTimerStartFlag ))
	movf	((_uiSmallTimer+1)),w
	iorwf	((_uiSmallTimer)),w
	skipz
	goto	u1851
	goto	u1850
u1851:
	goto	l1623
u1850:
	
l4079:	
	movf	(_bSmallTimerStartFlag),f
	skipz
	goto	u1861
	goto	u1860
u1861:
	goto	l1623
u1860:
	line	462
	
l4081:	
;common.c: 461: {
;common.c: 462: uiSmallTimer = uiSetTime;
	movf	(startThreeHoursTimer@uiSetTime+1),w
	movwf	(_uiSmallTimer+1)
	movf	(startThreeHoursTimer@uiSetTime),w
	movwf	(_uiSmallTimer)
	line	463
	
l4083:	
;common.c: 463: bSmallTimerStartFlag = 1;
	clrf	(_bSmallTimerStartFlag)
	incf	(_bSmallTimerStartFlag),f
	line	469
	
l1623:	
	return
	opt stack 0
GLOBAL	__end_of_startThreeHoursTimer
	__end_of_startThreeHoursTimer:
;; =============== function _startThreeHoursTimer ends ============

	signat	_startThreeHoursTimer,4216
	global	_clearTwelveHoursTimer
psect	text1192,local,class=CODE,delta=2
global __ptext1192
__ptext1192:

;; *************** function _clearTwelveHoursTimer *****************
;; Defined at:
;;		line 432 in file "D:\develop\AK7030-good\AK7030-OTP\common.c"
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
;; Hardware stack levels required when called:    3
;; This function calls:
;;		Nothing
;; This function is called by:
;;		_main
;; This function uses a non-reentrant model
;;
psect	text1192
	file	"D:\develop\AK7030-good\AK7030-OTP\common.c"
	line	432
	global	__size_of_clearTwelveHoursTimer
	__size_of_clearTwelveHoursTimer	equ	__end_of_clearTwelveHoursTimer-_clearTwelveHoursTimer
	
_clearTwelveHoursTimer:	
	opt	stack 4
; Regs used in _clearTwelveHoursTimer: [status,2]
	line	433
	
l4075:	
;common.c: 433: uiBigTimer = 0;
	clrf	(_uiBigTimer)
	clrf	(_uiBigTimer+1)
	line	434
;common.c: 434: bBigTimerStartFlag = 0;
	clrf	(_bBigTimerStartFlag)
	line	435
	
l1610:	
	return
	opt stack 0
GLOBAL	__end_of_clearTwelveHoursTimer
	__end_of_clearTwelveHoursTimer:
;; =============== function _clearTwelveHoursTimer ends ============

	signat	_clearTwelveHoursTimer,88
	global	_isFinishedTwelveHoursTimer
psect	text1193,local,class=CODE,delta=2
global __ptext1193
__ptext1193:

;; *************** function _isFinishedTwelveHoursTimer *****************
;; Defined at:
;;		line 531 in file "D:\develop\AK7030-good\AK7030-OTP\common.c"
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
;; Hardware stack levels required when called:    3
;; This function calls:
;;		Nothing
;; This function is called by:
;;		_main
;; This function uses a non-reentrant model
;;
psect	text1193
	file	"D:\develop\AK7030-good\AK7030-OTP\common.c"
	line	531
	global	__size_of_isFinishedTwelveHoursTimer
	__size_of_isFinishedTwelveHoursTimer	equ	__end_of_isFinishedTwelveHoursTimer-_isFinishedTwelveHoursTimer
	
_isFinishedTwelveHoursTimer:	
	opt	stack 4
; Regs used in _isFinishedTwelveHoursTimer: [wreg+status,2+status,0]
	line	532
	
l4059:	
;common.c: 532: if(( uiBigTimer == 0 ) && bBigTimerStartFlag )
	movf	((_uiBigTimer+1)),w
	iorwf	((_uiBigTimer)),w
	skipz
	goto	u1831
	goto	u1830
u1831:
	goto	l4071
u1830:
	
l4061:	
	movf	(_bBigTimerStartFlag),w
	skipz
	goto	u1840
	goto	l4071
u1840:
	line	534
	
l4063:	
;common.c: 533: {
;common.c: 534: bBigTimerStartFlag = 0;
	clrf	(_bBigTimerStartFlag)
	line	535
	
l4065:	
;common.c: 535: return 1;
	movlw	(01h)
	goto	l1640
	line	538
	
l4071:	
;common.c: 537: else
;common.c: 538: return 0;
	movlw	(0)
	line	539
	
l1640:	
	return
	opt stack 0
GLOBAL	__end_of_isFinishedTwelveHoursTimer
	__end_of_isFinishedTwelveHoursTimer:
;; =============== function _isFinishedTwelveHoursTimer ends ============

	signat	_isFinishedTwelveHoursTimer,89
	global	_startTwelveHourTimer
psect	text1194,local,class=CODE,delta=2
global __ptext1194
__ptext1194:

;; *************** function _startTwelveHourTimer *****************
;; Defined at:
;;		line 418 in file "D:\develop\AK7030-good\AK7030-OTP\common.c"
;; Parameters:    Size  Location     Type
;;  uiSetTime       2   23[BANK0 ] unsigned int 
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
;; Hardware stack levels required when called:    3
;; This function calls:
;;		Nothing
;; This function is called by:
;;		_main
;; This function uses a non-reentrant model
;;
psect	text1194
	file	"D:\develop\AK7030-good\AK7030-OTP\common.c"
	line	418
	global	__size_of_startTwelveHourTimer
	__size_of_startTwelveHourTimer	equ	__end_of_startTwelveHourTimer-_startTwelveHourTimer
	
_startTwelveHourTimer:	
	opt	stack 4
; Regs used in _startTwelveHourTimer: [wreg+status,2+status,0]
	line	419
	
l4051:	
;common.c: 419: if((0 == uiBigTimer) && ( 0 == bBigTimerStartFlag))
	movf	((_uiBigTimer+1)),w
	iorwf	((_uiBigTimer)),w
	skipz
	goto	u1811
	goto	u1810
u1811:
	goto	l1607
u1810:
	
l4053:	
	movf	(_bBigTimerStartFlag),f
	skipz
	goto	u1821
	goto	u1820
u1821:
	goto	l1607
u1820:
	line	421
	
l4055:	
;common.c: 420: {
;common.c: 421: uiBigTimer = uiSetTime;
	movf	(startTwelveHourTimer@uiSetTime+1),w
	movwf	(_uiBigTimer+1)
	movf	(startTwelveHourTimer@uiSetTime),w
	movwf	(_uiBigTimer)
	line	422
	
l4057:	
;common.c: 422: bBigTimerStartFlag = 1;
	clrf	(_bBigTimerStartFlag)
	incf	(_bBigTimerStartFlag),f
	line	429
	
l1607:	
	return
	opt stack 0
GLOBAL	__end_of_startTwelveHourTimer
	__end_of_startTwelveHourTimer:
;; =============== function _startTwelveHourTimer ends ============

	signat	_startTwelveHourTimer,4216
	global	_clearTwentyMinTimer
psect	text1195,local,class=CODE,delta=2
global __ptext1195
__ptext1195:

;; *************** function _clearTwentyMinTimer *****************
;; Defined at:
;;		line 452 in file "D:\develop\AK7030-good\AK7030-OTP\common.c"
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
;; Hardware stack levels required when called:    3
;; This function calls:
;;		Nothing
;; This function is called by:
;;		_main
;; This function uses a non-reentrant model
;;
psect	text1195
	file	"D:\develop\AK7030-good\AK7030-OTP\common.c"
	line	452
	global	__size_of_clearTwentyMinTimer
	__size_of_clearTwentyMinTimer	equ	__end_of_clearTwentyMinTimer-_clearTwentyMinTimer
	
_clearTwentyMinTimer:	
	opt	stack 4
; Regs used in _clearTwentyMinTimer: [status,2]
	line	453
	
l4049:	
;common.c: 453: uiTwentyMinTimer = 0;
	clrf	(_uiTwentyMinTimer)
	clrf	(_uiTwentyMinTimer+1)
	line	454
;common.c: 454: bTwentyMinStartFlag = 0;
	clrf	(_bTwentyMinStartFlag)
	line	455
	
l1619:	
	return
	opt stack 0
GLOBAL	__end_of_clearTwentyMinTimer
	__end_of_clearTwentyMinTimer:
;; =============== function _clearTwentyMinTimer ends ============

	signat	_clearTwentyMinTimer,88
	global	_isFinishedTwentyMinTimer
psect	text1196,local,class=CODE,delta=2
global __ptext1196
__ptext1196:

;; *************** function _isFinishedTwentyMinTimer *****************
;; Defined at:
;;		line 507 in file "D:\develop\AK7030-good\AK7030-OTP\common.c"
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
;; Hardware stack levels required when called:    3
;; This function calls:
;;		Nothing
;; This function is called by:
;;		_main
;; This function uses a non-reentrant model
;;
psect	text1196
	file	"D:\develop\AK7030-good\AK7030-OTP\common.c"
	line	507
	global	__size_of_isFinishedTwentyMinTimer
	__size_of_isFinishedTwentyMinTimer	equ	__end_of_isFinishedTwentyMinTimer-_isFinishedTwentyMinTimer
	
_isFinishedTwentyMinTimer:	
	opt	stack 4
; Regs used in _isFinishedTwentyMinTimer: [wreg+status,2+status,0]
	line	508
	
l4033:	
;common.c: 508: if(( 0 == uiTwentyMinTimer ) && bTwentyMinStartFlag )
	movf	((_uiTwentyMinTimer+1)),w
	iorwf	((_uiTwentyMinTimer)),w
	skipz
	goto	u1791
	goto	u1790
u1791:
	goto	l4045
u1790:
	
l4035:	
	movf	(_bTwentyMinStartFlag),w
	skipz
	goto	u1800
	goto	l4045
u1800:
	line	510
	
l4037:	
;common.c: 509: {
;common.c: 510: bTwentyMinStartFlag = 0;
	clrf	(_bTwentyMinStartFlag)
	line	511
	
l4039:	
;common.c: 511: return 1;
	movlw	(01h)
	goto	l1635
	line	514
	
l4045:	
;common.c: 513: else
;common.c: 514: return 0;
	movlw	(0)
	line	515
	
l1635:	
	return
	opt stack 0
GLOBAL	__end_of_isFinishedTwentyMinTimer
	__end_of_isFinishedTwentyMinTimer:
;; =============== function _isFinishedTwentyMinTimer ends ============

	signat	_isFinishedTwentyMinTimer,89
	global	_clrSampeTime
psect	text1197,local,class=CODE,delta=2
global __ptext1197
__ptext1197:

;; *************** function _clrSampeTime *****************
;; Defined at:
;;		line 577 in file "D:\develop\AK7030-good\AK7030-OTP\common.c"
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
;; Hardware stack levels required when called:    3
;; This function calls:
;;		Nothing
;; This function is called by:
;;		_main
;; This function uses a non-reentrant model
;;
psect	text1197
	file	"D:\develop\AK7030-good\AK7030-OTP\common.c"
	line	577
	global	__size_of_clrSampeTime
	__size_of_clrSampeTime	equ	__end_of_clrSampeTime-_clrSampeTime
	
_clrSampeTime:	
	opt	stack 4
; Regs used in _clrSampeTime: [status,2]
	line	578
	
l4031:	
;common.c: 578: timer.timer10msStopWatch = 0;
	clrf	(_timer)
	line	579
	
l1659:	
	return
	opt stack 0
GLOBAL	__end_of_clrSampeTime
	__end_of_clrSampeTime:
;; =============== function _clrSampeTime ends ============

	signat	_clrSampeTime,88
	global	_isPermitSampleTime
psect	text1198,local,class=CODE,delta=2
global __ptext1198
__ptext1198:

;; *************** function _isPermitSampleTime *****************
;; Defined at:
;;		line 567 in file "D:\develop\AK7030-good\AK7030-OTP\common.c"
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
;; Hardware stack levels required when called:    3
;; This function calls:
;;		Nothing
;; This function is called by:
;;		_main
;; This function uses a non-reentrant model
;;
psect	text1198
	file	"D:\develop\AK7030-good\AK7030-OTP\common.c"
	line	567
	global	__size_of_isPermitSampleTime
	__size_of_isPermitSampleTime	equ	__end_of_isPermitSampleTime-_isPermitSampleTime
	
_isPermitSampleTime:	
	opt	stack 4
; Regs used in _isPermitSampleTime: [wreg]
	line	568
	
l4019:	
;common.c: 568: if(timer.timer10msStopWatch >= 10)
	movlw	(0Ah)
	subwf	(_timer),w
	skipc
	goto	u1781
	goto	u1780
u1781:
	goto	l4027
u1780:
	line	570
	
l4021:	
;common.c: 569: {
;common.c: 570: return 1;
	movlw	(01h)
	goto	l1655
	line	573
	
l4027:	
;common.c: 572: else
;common.c: 573: return 0;
	movlw	(0)
	line	574
	
l1655:	
	return
	opt stack 0
GLOBAL	__end_of_isPermitSampleTime
	__end_of_isPermitSampleTime:
;; =============== function _isPermitSampleTime ends ============

	signat	_isPermitSampleTime,89
	global	_adc_start
psect	text1199,local,class=CODE,delta=2
global __ptext1199
__ptext1199:

;; *************** function _adc_start *****************
;; Defined at:
;;		line 101 in file "D:\develop\AK7030-good\AK7030-OTP\periph.c"
;; Parameters:    Size  Location     Type
;;		None
;; Auto vars:     Size  Location     Type
;;		None
;; Return value:  Size  Location     Type
;;		None               void
;; Registers used:
;;		None
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
;;		Nothing
;; This function is called by:
;;		_main
;;		_process_AD_Converter_Value
;; This function uses a non-reentrant model
;;
psect	text1199
	file	"D:\develop\AK7030-good\AK7030-OTP\periph.c"
	line	101
	global	__size_of_adc_start
	__size_of_adc_start	equ	__end_of_adc_start-_adc_start
	
_adc_start:	
	opt	stack 3
; Regs used in _adc_start: []
	line	102
	
l4017:	
;periph.c: 102: GO=1;
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	bsf	(249/8),(249)&7
	line	103
	
l2327:	
	return
	opt stack 0
GLOBAL	__end_of_adc_start
	__end_of_adc_start:
;; =============== function _adc_start ends ============

	signat	_adc_start,88
	global	_startTwentyMinTimer
psect	text1200,local,class=CODE,delta=2
global __ptext1200
__ptext1200:

;; *************** function _startTwentyMinTimer *****************
;; Defined at:
;;		line 497 in file "D:\develop\AK7030-good\AK7030-OTP\common.c"
;; Parameters:    Size  Location     Type
;;  uiSetValue      2   23[BANK0 ] unsigned int 
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
;; Hardware stack levels required when called:    3
;; This function calls:
;;		Nothing
;; This function is called by:
;;		_main
;; This function uses a non-reentrant model
;;
psect	text1200
	file	"D:\develop\AK7030-good\AK7030-OTP\common.c"
	line	497
	global	__size_of_startTwentyMinTimer
	__size_of_startTwentyMinTimer	equ	__end_of_startTwentyMinTimer-_startTwentyMinTimer
	
_startTwentyMinTimer:	
	opt	stack 4
; Regs used in _startTwentyMinTimer: [wreg+status,2+status,0]
	line	498
	
l4009:	
;common.c: 498: if(( 0 == uiTwentyMinTimer) && ( 0 == bTwentyMinStartFlag))
	movf	((_uiTwentyMinTimer+1)),w
	iorwf	((_uiTwentyMinTimer)),w
	skipz
	goto	u1761
	goto	u1760
u1761:
	goto	l1631
u1760:
	
l4011:	
	movf	(_bTwentyMinStartFlag),f
	skipz
	goto	u1771
	goto	u1770
u1771:
	goto	l1631
u1770:
	line	500
	
l4013:	
;common.c: 499: {
;common.c: 500: uiTwentyMinTimer = uiSetValue;
	movf	(startTwentyMinTimer@uiSetValue+1),w
	movwf	(_uiTwentyMinTimer+1)
	movf	(startTwentyMinTimer@uiSetValue),w
	movwf	(_uiTwentyMinTimer)
	line	501
	
l4015:	
;common.c: 501: bTwentyMinStartFlag = 1;
	clrf	(_bTwentyMinStartFlag)
	incf	(_bTwentyMinStartFlag),f
	line	503
	
l1631:	
	return
	opt stack 0
GLOBAL	__end_of_startTwentyMinTimer
	__end_of_startTwentyMinTimer:
;; =============== function _startTwentyMinTimer ends ============

	signat	_startTwentyMinTimer,4216
	global	_adc_test_init
psect	text1201,local,class=CODE,delta=2
global __ptext1201
__ptext1201:

;; *************** function _adc_test_init *****************
;; Defined at:
;;		line 85 in file "D:\develop\AK7030-good\AK7030-OTP\periph.c"
;; Parameters:    Size  Location     Type
;;  channel         1    wreg     unsigned char 
;;  ref             1   23[BANK0 ] unsigned char 
;; Auto vars:     Size  Location     Type
;;  channel         1   25[BANK0 ] unsigned char 
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
;; Hardware stack levels required when called:    3
;; This function calls:
;;		Nothing
;; This function is called by:
;;		_main
;;		_process_AD_Converter_Value
;; This function uses a non-reentrant model
;;
psect	text1201
	file	"D:\develop\AK7030-good\AK7030-OTP\periph.c"
	line	85
	global	__size_of_adc_test_init
	__size_of_adc_test_init	equ	__end_of_adc_test_init-_adc_test_init
	
_adc_test_init:	
	opt	stack 3
; Regs used in _adc_test_init: [wreg+status,2+status,0]
;adc_test_init@channel stored from wreg
	movwf	(adc_test_init@channel)
	line	86
	
l3999:	
;periph.c: 86: ADCON0 = 0x40;
	movlw	(040h)
	movwf	(31)	;volatile
	line	87
	
l4001:	
;periph.c: 87: ADCON0|=channel<<2;
	movf	(adc_test_init@channel),w
	movwf	(??_adc_test_init+0)+0
	clrc
	rlf	(??_adc_test_init+0)+0,f
	clrc
	rlf	(??_adc_test_init+0)+0,w
	iorwf	(31),f	;volatile
	line	88
	
l4003:	
;periph.c: 88: ADCON1 = 0x35;
	movlw	(035h)
	bsf	status, 5	;RP0=1, select bank1
	movwf	(159)^080h	;volatile
	line	89
;periph.c: 89: ADCON1|=ref<<6;
	bcf	status, 5	;RP0=0, select bank0
	movf	(adc_test_init@ref),w
	movwf	(??_adc_test_init+0)+0
	rrf	(??_adc_test_init+0)+0,f
	rrf	(??_adc_test_init+0)+0,f
	rrf	(??_adc_test_init+0)+0,w
	andlw	0c0h
	bsf	status, 5	;RP0=1, select bank1
	iorwf	(159)^080h,f	;volatile
	line	90
	
l4005:	
;periph.c: 90: ADON=1;
	bcf	status, 5	;RP0=0, select bank0
	bsf	(248/8),(248)&7
	line	91
	
l4007:	
;periph.c: 91: ADIE=1;
	bsf	status, 5	;RP0=1, select bank1
	bsf	(1130/8)^080h,(1130)&7
	line	92
	
l2321:	
	return
	opt stack 0
GLOBAL	__end_of_adc_test_init
	__end_of_adc_test_init:
;; =============== function _adc_test_init ends ============

	signat	_adc_test_init,8312
	global	_timer1_interrupt_config
psect	text1202,local,class=CODE,delta=2
global __ptext1202
__ptext1202:

;; *************** function _timer1_interrupt_config *****************
;; Defined at:
;;		line 307 in file "D:\develop\AK7030-good\AK7030-OTP\common.c"
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
;; Hardware stack levels required when called:    3
;; This function calls:
;;		Nothing
;; This function is called by:
;;		_main
;; This function uses a non-reentrant model
;;
psect	text1202
	file	"D:\develop\AK7030-good\AK7030-OTP\common.c"
	line	307
	global	__size_of_timer1_interrupt_config
	__size_of_timer1_interrupt_config	equ	__end_of_timer1_interrupt_config-_timer1_interrupt_config
	
_timer1_interrupt_config:	
	opt	stack 4
; Regs used in _timer1_interrupt_config: []
	line	308
	
l3997:	
;common.c: 308: GIE = 1;
	bsf	(95/8),(95)&7
	line	309
;common.c: 309: PEIE = 1;
	bsf	(94/8),(94)&7
	line	310
	
l1572:	
	return
	opt stack 0
GLOBAL	__end_of_timer1_interrupt_config
	__end_of_timer1_interrupt_config:
;; =============== function _timer1_interrupt_config ends ============

	signat	_timer1_interrupt_config,88
	global	_timer1_config
psect	text1203,local,class=CODE,delta=2
global __ptext1203
__ptext1203:

;; *************** function _timer1_config *****************
;; Defined at:
;;		line 295 in file "D:\develop\AK7030-good\AK7030-OTP\common.c"
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
;; Hardware stack levels required when called:    3
;; This function calls:
;;		Nothing
;; This function is called by:
;;		_main
;; This function uses a non-reentrant model
;;
psect	text1203
	file	"D:\develop\AK7030-good\AK7030-OTP\common.c"
	line	295
	global	__size_of_timer1_config
	__size_of_timer1_config	equ	__end_of_timer1_config-_timer1_config
	
_timer1_config:	
	opt	stack 4
; Regs used in _timer1_config: [wreg]
	line	297
	
l3993:	
;common.c: 297: TMR1H=0xCF;
	movlw	(0CFh)
	bcf	status, 6	;RP1=0, select bank0
	movwf	(15)	;volatile
	line	298
;common.c: 298: TMR1L=0x2C;
	movlw	(02Ch)
	movwf	(14)	;volatile
	line	299
;common.c: 299: T1CON=0xE1;
	movlw	(0E1h)
	movwf	(16)	;volatile
	line	300
	
l3995:	
;common.c: 300: TMR1IE=1;
	bsf	status, 5	;RP0=1, select bank1
	bsf	(1120/8)^080h,(1120)&7
	line	302
	
l1569:	
	return
	opt stack 0
GLOBAL	__end_of_timer1_config
	__end_of_timer1_config:
;; =============== function _timer1_config ends ============

	signat	_timer1_config,88
	global	_clock_config
psect	text1204,local,class=CODE,delta=2
global __ptext1204
__ptext1204:

;; *************** function _clock_config *****************
;; Defined at:
;;		line 287 in file "D:\develop\AK7030-good\AK7030-OTP\common.c"
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
;; Hardware stack levels required when called:    3
;; This function calls:
;;		Nothing
;; This function is called by:
;;		_main
;; This function uses a non-reentrant model
;;
psect	text1204
	file	"D:\develop\AK7030-good\AK7030-OTP\common.c"
	line	287
	global	__size_of_clock_config
	__size_of_clock_config	equ	__end_of_clock_config-_clock_config
	
_clock_config:	
	opt	stack 4
; Regs used in _clock_config: [wreg+status,2]
	line	289
	
l3989:	
;common.c: 289: CLKPR = 0x80;
	movlw	(080h)
	bcf	status, 5	;RP0=0, select bank2
	bsf	status, 6	;RP1=1, select bank2
	movwf	(264)^0100h	;volatile
	line	290
	
l3991:	
;common.c: 290: CLKPR = 0x00;
	clrf	(264)^0100h	;volatile
	line	291
;common.c: 291: while(CLKPCE);
	
l1563:	
	btfsc	(2119/8)^0100h,(2119)&7
	goto	u1751
	goto	u1750
u1751:
	goto	l1563
u1750:
	line	292
	
l1566:	
	return
	opt stack 0
GLOBAL	__end_of_clock_config
	__end_of_clock_config:
;; =============== function _clock_config ends ============

	signat	_clock_config,88
	global	_reset
psect	text1205,local,class=CODE,delta=2
global __ptext1205
__ptext1205:

;; *************** function _reset *****************
;; Defined at:
;;		line 301 in file "D:\develop\AK7030-good\AK7030-OTP\main.c"
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
;; Hardware stack levels required when called:    3
;; This function calls:
;;		Nothing
;; This function is called by:
;;		_main
;; This function uses a non-reentrant model
;;
psect	text1205
	file	"D:\develop\AK7030-good\AK7030-OTP\main.c"
	line	301
	global	__size_of_reset
	__size_of_reset	equ	__end_of_reset-_reset
	
_reset:	
	opt	stack 4
; Regs used in _reset: []
	line	303
;main.c: 303: while(1);
	
l722:	
	goto	l722
	return
	opt stack 0
psect	text1206,local,class=CODE,delta=2
global __ptext1206
__ptext1206:
	line	307
GLOBAL	__end_of_reset
	__end_of_reset:
;; =============== function _reset ends ============

	signat	_reset,88
	global	_selectAdChannel

;; *************** function _selectAdChannel *****************
;; Defined at:
;;		line 290 in file "D:\develop\AK7030-good\AK7030-OTP\main.c"
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
;; Hardware stack levels required when called:    3
;; This function calls:
;;		Nothing
;; This function is called by:
;;		_main
;; This function uses a non-reentrant model
;;
psect	text1206
	file	"D:\develop\AK7030-good\AK7030-OTP\main.c"
	line	290
	global	__size_of_selectAdChannel
	__size_of_selectAdChannel	equ	__end_of_selectAdChannel-_selectAdChannel
	
_selectAdChannel:	
	opt	stack 4
; Regs used in _selectAdChannel: []
	line	292
	
l3987:	
;main.c: 292: TRISB0 = 1;
	bsf	status, 5	;RP0=1, select bank1
	bsf	(1072/8)^080h,(1072)&7
	line	293
;main.c: 293: TRISB1 = 1;
	bsf	(1073/8)^080h,(1073)&7
	line	297
	
l719:	
	return
	opt stack 0
GLOBAL	__end_of_selectAdChannel
	__end_of_selectAdChannel:
;; =============== function _selectAdChannel ends ============

	signat	_selectAdChannel,88
	global	_pwm_start
psect	text1207,local,class=CODE,delta=2
global __ptext1207
__ptext1207:

;; *************** function _pwm_start *****************
;; Defined at:
;;		line 238 in file "D:\develop\AK7030-good\AK7030-OTP\main.c"
;; Parameters:    Size  Location     Type
;;  ucPulseWidth    1    wreg     unsigned char 
;;  ucPulseFrequ    1   23[BANK0 ] unsigned char 
;; Auto vars:     Size  Location     Type
;;  ucPulseWidth    1   24[BANK0 ] unsigned char 
;; Return value:  Size  Location     Type
;;		None               void
;; Registers used:
;;		wreg, status,2, status,0
;; Tracked objects:
;;		On entry : 17F/0
;;		On exit  : 17F/0
;;		Unchanged: FFE80/0
;; Data sizes:     COMMON   BANK0   BANK1   BANK3   BANK2
;;      Params:         0       1       0       0       0
;;      Locals:         0       1       0       0       0
;;      Temps:          0       0       0       0       0
;;      Totals:         0       2       0       0       0
;;Total ram usage:        2 bytes
;; Hardware stack levels used:    1
;; Hardware stack levels required when called:    3
;; This function calls:
;;		Nothing
;; This function is called by:
;;		_main
;; This function uses a non-reentrant model
;;
psect	text1207
	file	"D:\develop\AK7030-good\AK7030-OTP\main.c"
	line	238
	global	__size_of_pwm_start
	__size_of_pwm_start	equ	__end_of_pwm_start-_pwm_start
	
_pwm_start:	
	opt	stack 4
; Regs used in _pwm_start: [wreg+status,2+status,0]
;pwm_start@ucPulseWidth stored from wreg
	line	240
	movwf	(pwm_start@ucPulseWidth)
	
l3971:	
;main.c: 240: CCP1CON&= 0xf0;
	movlw	(0F0h)
	andwf	(23),f	;volatile
	line	242
	
l3973:	
;main.c: 242: T2CON=0x04;
	movlw	(04h)
	movwf	(18)	;volatile
	line	243
	
l3975:	
;main.c: 243: PR2 = ucPulseFrequency;
	movf	(pwm_start@ucPulseFrequency),w
	bsf	status, 5	;RP0=1, select bank1
	movwf	(146)^080h	;volatile
	line	244
	
l3977:	
;main.c: 244: CCPR1L = ucPulseWidth;
	bcf	status, 5	;RP0=0, select bank0
	movf	(pwm_start@ucPulseWidth),w
	movwf	(21)	;volatile
	line	245
	
l3979:	
;main.c: 245: CCP1CON=0x00;
	clrf	(23)	;volatile
	line	247
	
l3981:	
;main.c: 247: TRISB2=0;
	bsf	status, 5	;RP0=1, select bank1
	bcf	(1074/8)^080h,(1074)&7
	line	248
	
l3983:	
;main.c: 248: PBOD2 = 0;
	bsf	status, 6	;RP1=1, select bank3
	bcf	(3138/8)^0180h,(3138)&7
	line	250
	
l3985:	
;main.c: 250: CCP1CON|= 0x0c;
	movlw	(0Ch)
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	iorwf	(23),f	;volatile
	line	259
	
l710:	
	return
	opt stack 0
GLOBAL	__end_of_pwm_start
	__end_of_pwm_start:
;; =============== function _pwm_start ends ============

	signat	_pwm_start,8312
	global	_initPB2_AsHighResistence
psect	text1208,local,class=CODE,delta=2
global __ptext1208
__ptext1208:

;; *************** function _initPB2_AsHighResistence *****************
;; Defined at:
;;		line 226 in file "D:\develop\AK7030-good\AK7030-OTP\main.c"
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
;; Hardware stack levels required when called:    3
;; This function calls:
;;		Nothing
;; This function is called by:
;;		_initPin
;; This function uses a non-reentrant model
;;
psect	text1208
	file	"D:\develop\AK7030-good\AK7030-OTP\main.c"
	line	226
	global	__size_of_initPB2_AsHighResistence
	__size_of_initPB2_AsHighResistence	equ	__end_of_initPB2_AsHighResistence-_initPB2_AsHighResistence
	
_initPB2_AsHighResistence:	
	opt	stack 3
; Regs used in _initPB2_AsHighResistence: []
	line	228
	
l3969:	
;main.c: 228: PB2 = 1;
	bsf	(50/8),(50)&7
	line	229
;main.c: 229: PBOD2 = 1;
	bsf	status, 5	;RP0=1, select bank3
	bsf	status, 6	;RP1=1, select bank3
	bsf	(3138/8)^0180h,(3138)&7
	line	233
	
l707:	
	return
	opt stack 0
GLOBAL	__end_of_initPB2_AsHighResistence
	__end_of_initPB2_AsHighResistence:
;; =============== function _initPB2_AsHighResistence ends ============

	signat	_initPB2_AsHighResistence,88
	global	_setPB5
psect	text1209,local,class=CODE,delta=2
global __ptext1209
__ptext1209:

;; *************** function _setPB5 *****************
;; Defined at:
;;		line 209 in file "D:\develop\AK7030-good\AK7030-OTP\main.c"
;; Parameters:    Size  Location     Type
;;  bValue          1    wreg     unsigned char 
;; Auto vars:     Size  Location     Type
;;  bValue          1   23[BANK0 ] unsigned char 
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
;; Hardware stack levels required when called:    3
;; This function calls:
;;		Nothing
;; This function is called by:
;;		_setPinInitVaule
;;		_main
;; This function uses a non-reentrant model
;;
psect	text1209
	file	"D:\develop\AK7030-good\AK7030-OTP\main.c"
	line	209
	global	__size_of_setPB5
	__size_of_setPB5	equ	__end_of_setPB5-_setPB5
	
_setPB5:	
	opt	stack 4
; Regs used in _setPB5: [wreg]
;setPB5@bValue stored from wreg
	movwf	(setPB5@bValue)
	line	210
	
l3965:	
;main.c: 210: if( bValue )
	movf	(setPB5@bValue),w
	skipz
	goto	u1740
	goto	l702
u1740:
	line	212
	
l3967:	
;main.c: 212: PB5 = 1;
	bsf	(53/8),(53)&7
	goto	l704
	line	216
	
l702:	
	line	218
;main.c: 216: else
;main.c: 218: PB5= 0;
	bcf	(53/8),(53)&7
	line	222
	
l704:	
	return
	opt stack 0
GLOBAL	__end_of_setPB5
	__end_of_setPB5:
;; =============== function _setPB5 ends ============

	signat	_setPB5,4216
	global	_initPB5
psect	text1210,local,class=CODE,delta=2
global __ptext1210
__ptext1210:

;; *************** function _initPB5 *****************
;; Defined at:
;;		line 192 in file "D:\develop\AK7030-good\AK7030-OTP\main.c"
;; Parameters:    Size  Location     Type
;;  bValue          1    wreg     unsigned char 
;; Auto vars:     Size  Location     Type
;;  bValue          1   23[BANK0 ] unsigned char 
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
;; Hardware stack levels required when called:    3
;; This function calls:
;;		Nothing
;; This function is called by:
;;		_initPin
;; This function uses a non-reentrant model
;;
psect	text1210
	file	"D:\develop\AK7030-good\AK7030-OTP\main.c"
	line	192
	global	__size_of_initPB5
	__size_of_initPB5	equ	__end_of_initPB5-_initPB5
	
_initPB5:	
	opt	stack 3
; Regs used in _initPB5: [wreg]
;initPB5@bValue stored from wreg
	bcf	status, 5	;RP0=0, select bank0
	movwf	(initPB5@bValue)
	line	193
	
l3961:	
;main.c: 193: if( bValue )
	movf	(initPB5@bValue),w
	skipz
	goto	u1730
	goto	l697
u1730:
	line	195
	
l3963:	
;main.c: 195: TRISB5 = 1;
	bsf	status, 5	;RP0=1, select bank1
	bsf	(1077/8)^080h,(1077)&7
	goto	l699
	line	199
	
l697:	
	line	201
;main.c: 199: else
;main.c: 201: TRISB5= 0;
	bsf	status, 5	;RP0=1, select bank1
	bcf	(1077/8)^080h,(1077)&7
	line	205
	
l699:	
	return
	opt stack 0
GLOBAL	__end_of_initPB5
	__end_of_initPB5:
;; =============== function _initPB5 ends ============

	signat	_initPB5,4216
	global	_setPB4
psect	text1211,local,class=CODE,delta=2
global __ptext1211
__ptext1211:

;; *************** function _setPB4 *****************
;; Defined at:
;;		line 175 in file "D:\develop\AK7030-good\AK7030-OTP\main.c"
;; Parameters:    Size  Location     Type
;;  bValue          1    wreg     unsigned char 
;; Auto vars:     Size  Location     Type
;;  bValue          1   23[BANK0 ] unsigned char 
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
;; Hardware stack levels required when called:    3
;; This function calls:
;;		Nothing
;; This function is called by:
;;		_setPinInitVaule
;;		_main
;; This function uses a non-reentrant model
;;
psect	text1211
	file	"D:\develop\AK7030-good\AK7030-OTP\main.c"
	line	175
	global	__size_of_setPB4
	__size_of_setPB4	equ	__end_of_setPB4-_setPB4
	
_setPB4:	
	opt	stack 4
; Regs used in _setPB4: [wreg]
;setPB4@bValue stored from wreg
	movwf	(setPB4@bValue)
	line	176
	
l3957:	
;main.c: 176: if( bValue )
	movf	(setPB4@bValue),w
	skipz
	goto	u1720
	goto	l692
u1720:
	line	178
	
l3959:	
;main.c: 178: PB4 = 1;
	bsf	(52/8),(52)&7
	goto	l694
	line	182
	
l692:	
	line	184
;main.c: 182: else
;main.c: 184: PB4= 0;
	bcf	(52/8),(52)&7
	line	188
	
l694:	
	return
	opt stack 0
GLOBAL	__end_of_setPB4
	__end_of_setPB4:
;; =============== function _setPB4 ends ============

	signat	_setPB4,4216
	global	_initPB4
psect	text1212,local,class=CODE,delta=2
global __ptext1212
__ptext1212:

;; *************** function _initPB4 *****************
;; Defined at:
;;		line 158 in file "D:\develop\AK7030-good\AK7030-OTP\main.c"
;; Parameters:    Size  Location     Type
;;  bValue          1    wreg     unsigned char 
;; Auto vars:     Size  Location     Type
;;  bValue          1   23[BANK0 ] unsigned char 
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
;; Hardware stack levels required when called:    3
;; This function calls:
;;		Nothing
;; This function is called by:
;;		_initPin
;; This function uses a non-reentrant model
;;
psect	text1212
	file	"D:\develop\AK7030-good\AK7030-OTP\main.c"
	line	158
	global	__size_of_initPB4
	__size_of_initPB4	equ	__end_of_initPB4-_initPB4
	
_initPB4:	
	opt	stack 3
; Regs used in _initPB4: [wreg]
;initPB4@bValue stored from wreg
	bcf	status, 5	;RP0=0, select bank0
	movwf	(initPB4@bValue)
	line	159
	
l3953:	
;main.c: 159: if( bValue )
	movf	(initPB4@bValue),w
	skipz
	goto	u1710
	goto	l687
u1710:
	line	161
	
l3955:	
;main.c: 161: TRISB4 = 1;
	bsf	status, 5	;RP0=1, select bank1
	bsf	(1076/8)^080h,(1076)&7
	goto	l689
	line	165
	
l687:	
	line	167
;main.c: 165: else
;main.c: 167: TRISB4= 0;
	bsf	status, 5	;RP0=1, select bank1
	bcf	(1076/8)^080h,(1076)&7
	line	171
	
l689:	
	return
	opt stack 0
GLOBAL	__end_of_initPB4
	__end_of_initPB4:
;; =============== function _initPB4 ends ============

	signat	_initPB4,4216
	global	_setPB3
psect	text1213,local,class=CODE,delta=2
global __ptext1213
__ptext1213:

;; *************** function _setPB3 *****************
;; Defined at:
;;		line 140 in file "D:\develop\AK7030-good\AK7030-OTP\main.c"
;; Parameters:    Size  Location     Type
;;  bValue          1    wreg     unsigned char 
;; Auto vars:     Size  Location     Type
;;  bValue          1   23[BANK0 ] unsigned char 
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
;; Hardware stack levels required when called:    3
;; This function calls:
;;		Nothing
;; This function is called by:
;;		_setPinInitVaule
;;		_main
;; This function uses a non-reentrant model
;;
psect	text1213
	file	"D:\develop\AK7030-good\AK7030-OTP\main.c"
	line	140
	global	__size_of_setPB3
	__size_of_setPB3	equ	__end_of_setPB3-_setPB3
	
_setPB3:	
	opt	stack 4
; Regs used in _setPB3: [wreg]
;setPB3@bValue stored from wreg
	bcf	status, 5	;RP0=0, select bank0
	movwf	(setPB3@bValue)
	line	141
	
l3949:	
;main.c: 141: if( bValue )
	movf	(setPB3@bValue),w
	skipz
	goto	u1700
	goto	l682
u1700:
	line	143
	
l3951:	
;main.c: 143: PB3 = 1;
	bsf	(51/8),(51)&7
	goto	l684
	line	147
	
l682:	
	line	149
;main.c: 147: else
;main.c: 149: PB3= 0;
	bcf	(51/8),(51)&7
	line	153
	
l684:	
	return
	opt stack 0
GLOBAL	__end_of_setPB3
	__end_of_setPB3:
;; =============== function _setPB3 ends ============

	signat	_setPB3,4216
	global	_initPB3
psect	text1214,local,class=CODE,delta=2
global __ptext1214
__ptext1214:

;; *************** function _initPB3 *****************
;; Defined at:
;;		line 123 in file "D:\develop\AK7030-good\AK7030-OTP\main.c"
;; Parameters:    Size  Location     Type
;;  bValue          1    wreg     unsigned char 
;; Auto vars:     Size  Location     Type
;;  bValue          1   23[BANK0 ] unsigned char 
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
;; Hardware stack levels required when called:    3
;; This function calls:
;;		Nothing
;; This function is called by:
;;		_initPin
;; This function uses a non-reentrant model
;;
psect	text1214
	file	"D:\develop\AK7030-good\AK7030-OTP\main.c"
	line	123
	global	__size_of_initPB3
	__size_of_initPB3	equ	__end_of_initPB3-_initPB3
	
_initPB3:	
	opt	stack 3
; Regs used in _initPB3: [wreg]
;initPB3@bValue stored from wreg
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	movwf	(initPB3@bValue)
	line	124
	
l3945:	
;main.c: 124: if( bValue )
	movf	(initPB3@bValue),w
	skipz
	goto	u1690
	goto	l677
u1690:
	line	126
	
l3947:	
;main.c: 126: TRISB3 = 1;
	bsf	status, 5	;RP0=1, select bank1
	bsf	(1075/8)^080h,(1075)&7
	goto	l679
	line	130
	
l677:	
	line	132
;main.c: 130: else
;main.c: 132: TRISB3 = 0;
	bsf	status, 5	;RP0=1, select bank1
	bcf	(1075/8)^080h,(1075)&7
	line	136
	
l679:	
	return
	opt stack 0
GLOBAL	__end_of_initPB3
	__end_of_initPB3:
;; =============== function _initPB3 ends ============

	signat	_initPB3,4216
	global	_ISR
psect	text1215,local,class=CODE,delta=2
global __ptext1215
__ptext1215:

;; *************** function _ISR *****************
;; Defined at:
;;		line 585 in file "D:\develop\AK7030-good\AK7030-OTP\common.c"
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
;;      Temps:          0       4       0       0       0
;;      Totals:         0       4       0       0       0
;;Total ram usage:        4 bytes
;; Hardware stack levels used:    1
;; Hardware stack levels required when called:    2
;; This function calls:
;;		i1_setAD_ConvertFlag
;;		_adc_get
;;		_vPutSampleDataIntoTable
;; This function is called by:
;;		Interrupt level 1
;; This function uses a non-reentrant model
;;
psect	text1215
	file	"D:\develop\AK7030-good\AK7030-OTP\common.c"
	line	585
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
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	movwf	(??_ISR+0)
	movf	fsr0,w
	movwf	(??_ISR+1)
	movf	pclath,w
	movwf	(??_ISR+2)
	movf	btemp+1,w
	movwf	(??_ISR+3)
	ljmp	_ISR
psect	text1215
	line	589
	
i1l3705:	
;common.c: 586: static unsigned char ucTimer1sCnt = 0;
;common.c: 589: if(TMR1IF == 1)
	btfss	(96/8),(96)&7
	goto	u136_21
	goto	u136_20
u136_21:
	goto	i1l3727
u136_20:
	line	591
	
i1l3707:	
;common.c: 590: {
;common.c: 591: TMR1IF = 0 ;
	bcf	(96/8),(96)&7
	line	592
	
i1l3709:	
;common.c: 592: timer.timer10msStopWatch++;
	incf	(_timer),f
	line	593
;common.c: 593: ucTimer1sCnt++;
	incf	(ISR@ucTimer1sCnt),f
	line	597
	
i1l3711:	
;common.c: 597: if(ucTimer1sCnt >= 100)
	movlw	(064h)
	subwf	(ISR@ucTimer1sCnt),w
	skipc
	goto	u137_21
	goto	u137_20
u137_21:
	goto	i1l3727
u137_20:
	line	599
	
i1l3713:	
;common.c: 598: {
;common.c: 599: ucTimer1sCnt = 0;
	clrf	(ISR@ucTimer1sCnt)
	line	600
	
i1l3715:	
;common.c: 600: if(uiBigTimer > 0)
	movf	(_uiBigTimer+1),w
	iorwf	(_uiBigTimer),w
	skipnz
	goto	u138_21
	goto	u138_20
u138_21:
	goto	i1l1666
u138_20:
	line	601
	
i1l3717:	
;common.c: 601: uiBigTimer--;
	movlw	low(01h)
	subwf	(_uiBigTimer),f
	movlw	high(01h)
	skipc
	decf	(_uiBigTimer+1),f
	subwf	(_uiBigTimer+1),f
	
i1l1666:	
	line	603
;common.c: 603: if(uiSmallTimer)
	movf	(_uiSmallTimer+1),w
	iorwf	(_uiSmallTimer),w
	skipnz
	goto	u139_21
	goto	u139_20
u139_21:
	goto	i1l1667
u139_20:
	line	604
	
i1l3719:	
;common.c: 604: uiSmallTimer--;
	movlw	low(01h)
	subwf	(_uiSmallTimer),f
	movlw	high(01h)
	skipc
	decf	(_uiSmallTimer+1),f
	subwf	(_uiSmallTimer+1),f
	
i1l1667:	
	line	606
;common.c: 606: if(uiTwentySecondsTimer)
	bsf	status, 5	;RP0=1, select bank1
	movf	(_uiTwentySecondsTimer+1)^080h,w
	iorwf	(_uiTwentySecondsTimer)^080h,w
	skipnz
	goto	u140_21
	goto	u140_20
u140_21:
	goto	i1l1668
u140_20:
	line	607
	
i1l3721:	
;common.c: 607: uiTwentySecondsTimer--;
	movlw	low(01h)
	subwf	(_uiTwentySecondsTimer)^080h,f
	movlw	high(01h)
	skipc
	decf	(_uiTwentySecondsTimer+1)^080h,f
	subwf	(_uiTwentySecondsTimer+1)^080h,f
	
i1l1668:	
	line	609
;common.c: 609: if(uiTwentyMinTimer)
	bcf	status, 5	;RP0=0, select bank0
	movf	(_uiTwentyMinTimer+1),w
	iorwf	(_uiTwentyMinTimer),w
	skipnz
	goto	u141_21
	goto	u141_20
u141_21:
	goto	i1l1669
u141_20:
	line	610
	
i1l3723:	
;common.c: 610: uiTwentyMinTimer--;
	movlw	low(01h)
	subwf	(_uiTwentyMinTimer),f
	movlw	high(01h)
	skipc
	decf	(_uiTwentyMinTimer+1),f
	subwf	(_uiTwentyMinTimer+1),f
	
i1l1669:	
	line	612
;common.c: 612: if( uiOneHourTimer )
	movf	(_uiOneHourTimer+1),w
	iorwf	(_uiOneHourTimer),w
	skipnz
	goto	u142_21
	goto	u142_20
u142_21:
	goto	i1l3727
u142_20:
	line	613
	
i1l3725:	
;common.c: 613: uiOneHourTimer--;
	movlw	low(01h)
	subwf	(_uiOneHourTimer),f
	movlw	high(01h)
	skipc
	decf	(_uiOneHourTimer+1),f
	subwf	(_uiOneHourTimer+1),f
	line	617
	
i1l3727:	
;common.c: 614: }
;common.c: 615: }
;common.c: 617: if(ADIF)
	btfss	(106/8),(106)&7
	goto	u143_21
	goto	u143_20
u143_21:
	goto	i1l1674
u143_20:
	line	620
	
i1l3729:	
;common.c: 618: {
;common.c: 620: ADIF=0;
	bcf	(106/8),(106)&7
	line	621
	
i1l3731:	
;common.c: 621: setAD_ConvertFlag(1);
	movlw	(01h)
	fcall	i1_setAD_ConvertFlag
	line	623
	
i1l3733:	
;common.c: 623: if(sampleChannelSelect == 12)
	movf	(_sampleChannelSelect),w
	xorlw	0Ch
	skipz
	goto	u144_21
	goto	u144_20
u144_21:
	goto	i1l3737
u144_20:
	line	627
	
i1l3735:	
;common.c: 624: {
;common.c: 627: vPutSampleDataIntoTable(adc_get(),12);
	fcall	_adc_get
	movf	(1+(?_adc_get)),w
	movwf	(?_vPutSampleDataIntoTable+1)
	movf	(0+(?_adc_get)),w
	movwf	(?_vPutSampleDataIntoTable)
	movlw	(0Ch)
	movwf	0+(?_vPutSampleDataIntoTable)+02h
	fcall	_vPutSampleDataIntoTable
	line	631
;common.c: 631: }
	goto	i1l1674
	line	637
	
i1l3737:	
;common.c: 632: else
;common.c: 633: {
;common.c: 637: vPutSampleDataIntoTable(adc_get(),13);
	fcall	_adc_get
	movf	(1+(?_adc_get)),w
	movwf	(?_vPutSampleDataIntoTable+1)
	movf	(0+(?_adc_get)),w
	movwf	(?_vPutSampleDataIntoTable)
	movlw	(0Dh)
	movwf	0+(?_vPutSampleDataIntoTable)+02h
	fcall	_vPutSampleDataIntoTable
	line	642
	
i1l1674:	
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	movf	(??_ISR+3),w
	movwf	btemp+1
	movf	(??_ISR+2),w
	movwf	pclath
	movf	(??_ISR+1),w
	movwf	fsr0
	swapf	(??_ISR+0)^00h,w
	movwf	status
	swapf	saved_w,f
	swapf	saved_w,w
	retfie
	opt stack 0
GLOBAL	__end_of_ISR
	__end_of_ISR:
;; =============== function _ISR ends ============

	signat	_ISR,88
	global	_vPutSampleDataIntoTable
psect	text1216,local,class=CODE,delta=2
global __ptext1216
__ptext1216:

;; *************** function _vPutSampleDataIntoTable *****************
;; Defined at:
;;		line 153 in file "D:\develop\AK7030-good\AK7030-OTP\common.c"
;; Parameters:    Size  Location     Type
;;  uiSampleData    2    6[COMMON] unsigned int 
;;  channel         1    8[COMMON] unsigned char 
;; Auto vars:     Size  Location     Type
;;  uiDeviationV    2   15[BANK0 ] unsigned int 
;;  i               2   17[BANK0 ] int 
;; Return value:  Size  Location     Type
;;		None               void
;; Registers used:
;;		wreg, fsr0l, fsr0h, status,2, status,0, btemp+1, pclath, cstack
;; Tracked objects:
;;		On entry : 60/20
;;		On exit  : 0/0
;;		Unchanged: FFE00/0
;; Data sizes:     COMMON   BANK0   BANK1   BANK3   BANK2
;;      Params:         3       0       0       0       0
;;      Locals:         0       4       0       0       0
;;      Temps:          4       0       0       0       0
;;      Totals:         7       4       0       0       0
;;Total ram usage:       11 bytes
;; Hardware stack levels used:    1
;; Hardware stack levels required when called:    1
;; This function calls:
;;		_Filter
;;		_setPWM_Width
;; This function is called by:
;;		_ISR
;; This function uses a non-reentrant model
;;
psect	text1216
	file	"D:\develop\AK7030-good\AK7030-OTP\common.c"
	line	153
	global	__size_of_vPutSampleDataIntoTable
	__size_of_vPutSampleDataIntoTable	equ	__end_of_vPutSampleDataIntoTable-_vPutSampleDataIntoTable
	
_vPutSampleDataIntoTable:	
	opt	stack 3
; Regs used in _vPutSampleDataIntoTable: [wreg-fsr0h+status,2+status,0+btemp+1+pclath+cstack]
	line	162
	
i1l3609:	
;common.c: 155: static unsigned char ucChannelFirstLength = 0;
;common.c: 157: static unsigned char ucChannelFourthLength = 0;
;common.c: 159: static unsigned char ucChannelFourteenthLength = 0;
;common.c: 160: static unsigned int uiCalWidthArrayNew = 0;
;common.c: 161: static unsigned int uiCalWidthArrayOld = 0;
;common.c: 162: if(channel == 12)
	movf	(vPutSampleDataIntoTable@channel),w
	xorlw	0Ch
	skipz
	goto	u120_21
	goto	u120_20
u120_21:
	goto	i1l3649
u120_20:
	line	164
	
i1l3611:	
;common.c: 163: {
;common.c: 164: if(ucChannelFirstLength < 3)
	movlw	(03h)
	subwf	(vPutSampleDataIntoTable@ucChannelFirstLength),w
	skipnc
	goto	u121_21
	goto	u121_20
u121_21:
	goto	i1l3645
u121_20:
	line	167
	
i1l3613:	
;common.c: 165: {
;common.c: 167: uiSampleChannelFirst[ucChannelFirstLength] = uiSampleData;
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
	line	169
	
i1l3615:	
;common.c: 169: ucChannelFirstLength++;
	incf	(vPutSampleDataIntoTable@ucChannelFirstLength),f
	line	171
	
i1l3617:	
;common.c: 171: if( 3 == ucChannelFirstLength )
	movf	(vPutSampleDataIntoTable@ucChannelFirstLength),w
	xorlw	03h
	skipz
	goto	u122_21
	goto	u122_20
u122_21:
	goto	i1l1560
u122_20:
	line	173
	
i1l3619:	
;common.c: 172: {
;common.c: 173: ucChannelFirstLength = 0;
	clrf	(vPutSampleDataIntoTable@ucChannelFirstLength)
	line	183
	
i1l3621:	
;common.c: 177: static unsigned char bInitArrayFlag = 0;
;common.c: 179: static unsigned int uiCalWidthArray[1],uiCalWidthCnt = 0;
;common.c: 181: static unsigned char uiInitWidth = 75;
;common.c: 183: uiCalWidthArrayNew = Filter(uiSampleChannelFirst);
	movlw	(_uiSampleChannelFirst)&0ffh
	fcall	_Filter
	movf	(1+(?_Filter)),w
	movwf	(vPutSampleDataIntoTable@uiCalWidthArrayNew+1)
	movf	(0+(?_Filter)),w
	movwf	(vPutSampleDataIntoTable@uiCalWidthArrayNew)
	line	187
	
i1l3623:	
	line	188
	
i1l3625:	
;common.c: 188: uiDeviationValue = ((uiCalWidthArrayNew+uiCalWidthArrayOld)>>1)+(uiCalWidthArrayNew-uiCalWidthArrayOld);
	bsf	status, 5	;RP0=1, select bank1
	movf	(vPutSampleDataIntoTable@uiCalWidthArrayOld)^080h,w
	bcf	status, 5	;RP0=0, select bank0
	addwf	(vPutSampleDataIntoTable@uiCalWidthArrayNew),w
	movwf	(??_vPutSampleDataIntoTable+0)+0
	bsf	status, 5	;RP0=1, select bank1
	movf	(vPutSampleDataIntoTable@uiCalWidthArrayOld+1)^080h,w
	skipnc
	incf	(vPutSampleDataIntoTable@uiCalWidthArrayOld+1)^080h,w
	bcf	status, 5	;RP0=0, select bank0
	addwf	(vPutSampleDataIntoTable@uiCalWidthArrayNew+1),w
	movwf	1+(??_vPutSampleDataIntoTable+0)+0
	clrc
	rrf	(??_vPutSampleDataIntoTable+0)+1,f
	rrf	(??_vPutSampleDataIntoTable+0)+0,f
	bsf	status, 5	;RP0=1, select bank1
	movf	(vPutSampleDataIntoTable@uiCalWidthArrayOld)^080h,w
	subwf	0+(??_vPutSampleDataIntoTable+0)+0,w
	movwf	(??_vPutSampleDataIntoTable+2)+0
	movf	(vPutSampleDataIntoTable@uiCalWidthArrayOld+1)^080h,w
	skipc
	incf	(vPutSampleDataIntoTable@uiCalWidthArrayOld+1)^080h,w
	subwf	1+(??_vPutSampleDataIntoTable+0)+0,w
	movwf	1+(??_vPutSampleDataIntoTable+2)+0
	bcf	status, 5	;RP0=0, select bank0
	movf	(vPutSampleDataIntoTable@uiCalWidthArrayNew),w
	addwf	0+(??_vPutSampleDataIntoTable+2)+0,w
	movwf	(vPutSampleDataIntoTable@uiDeviationValue)
	movf	(vPutSampleDataIntoTable@uiCalWidthArrayNew+1),w
	skipnc
	incf	(vPutSampleDataIntoTable@uiCalWidthArrayNew+1),w
	addwf	1+(??_vPutSampleDataIntoTable+2)+0,w
	movwf	1+(vPutSampleDataIntoTable@uiDeviationValue)
	line	189
	
i1l3627:	
;common.c: 189: if(uiCalWidthCnt>400)
	movlw	high(0191h)
	bsf	status, 5	;RP0=1, select bank1
	subwf	(vPutSampleDataIntoTable@uiCalWidthCnt+1)^080h,w
	movlw	low(0191h)
	skipnz
	subwf	(vPutSampleDataIntoTable@uiCalWidthCnt)^080h,w
	skipc
	goto	u123_21
	goto	u123_20
u123_21:
	goto	i1l1540
u123_20:
	line	190
	
i1l3629:	
;common.c: 190: uiDeviationValue =400;
	movlw	low(0190h)
	bcf	status, 5	;RP0=0, select bank0
	movwf	(vPutSampleDataIntoTable@uiDeviationValue)
	movlw	high(0190h)
	movwf	((vPutSampleDataIntoTable@uiDeviationValue))+1
	
i1l1540:	
	line	193
;common.c: 193: uiCalWidthArrayOld=uiCalWidthArrayNew;
	bcf	status, 5	;RP0=0, select bank0
	movf	(vPutSampleDataIntoTable@uiCalWidthArrayNew+1),w
	bsf	status, 5	;RP0=1, select bank1
	movwf	(vPutSampleDataIntoTable@uiCalWidthArrayOld+1)^080h
	bcf	status, 5	;RP0=0, select bank0
	movf	(vPutSampleDataIntoTable@uiCalWidthArrayNew),w
	bsf	status, 5	;RP0=1, select bank1
	movwf	(vPutSampleDataIntoTable@uiCalWidthArrayOld)^080h
	line	198
;common.c: 198: if(uiDeviationValue > (312))
	movlw	high(0139h)
	bcf	status, 5	;RP0=0, select bank0
	subwf	(vPutSampleDataIntoTable@uiDeviationValue+1),w
	movlw	low(0139h)
	skipnz
	subwf	(vPutSampleDataIntoTable@uiDeviationValue),w
	skipc
	goto	u124_21
	goto	u124_20
u124_21:
	goto	i1l3633
u124_20:
	line	202
	
i1l3631:	
;common.c: 199: {
;common.c: 202: uiInitWidth++;
	incf	(vPutSampleDataIntoTable@uiInitWidth),f
	line	204
;common.c: 204: }
	goto	i1l3637
	line	205
	
i1l3633:	
;common.c: 205: else if(uiDeviationValue < (312))
	movlw	high(0138h)
	subwf	(vPutSampleDataIntoTable@uiDeviationValue+1),w
	movlw	low(0138h)
	skipnz
	subwf	(vPutSampleDataIntoTable@uiDeviationValue),w
	skipnc
	goto	u125_21
	goto	u125_20
u125_21:
	goto	i1l3637
u125_20:
	line	209
	
i1l3635:	
;common.c: 206: {
;common.c: 209: uiInitWidth--;
	decf	(vPutSampleDataIntoTable@uiInitWidth),f
	line	215
;common.c: 211: }
	
i1l3637:	
;common.c: 215: if(uiInitWidth > 249)
	movlw	(0FAh)
	subwf	(vPutSampleDataIntoTable@uiInitWidth),w
	skipc
	goto	u126_21
	goto	u126_20
u126_21:
	goto	i1l1545
u126_20:
	line	216
	
i1l3639:	
;common.c: 216: uiInitWidth = 249;
	movlw	(0F9h)
	movwf	(vPutSampleDataIntoTable@uiInitWidth)
	
i1l1545:	
	line	218
;common.c: 218: if(uiInitWidth < 75)
	movlw	(04Bh)
	subwf	(vPutSampleDataIntoTable@uiInitWidth),w
	skipnc
	goto	u127_21
	goto	u127_20
u127_21:
	goto	i1l3643
u127_20:
	line	219
	
i1l3641:	
;common.c: 219: uiInitWidth = 75;
	movlw	(04Bh)
	movwf	(vPutSampleDataIntoTable@uiInitWidth)
	line	223
	
i1l3643:	
;common.c: 223: setPWM_Width(uiInitWidth);
	movf	(vPutSampleDataIntoTable@uiInitWidth),w
	fcall	_setPWM_Width
	goto	i1l1560
	line	230
	
i1l3645:	
;common.c: 228: else
;common.c: 229: {
;common.c: 230: ucChannelFirstLength = 0;
	clrf	(vPutSampleDataIntoTable@ucChannelFirstLength)
	line	232
	
i1l3647:	
;common.c: 232: uiSampleChannelFirst[ucChannelFirstLength] = uiSampleData;
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
	goto	i1l1560
	line	235
	
i1l3649:	
;common.c: 235: else if(channel == 13)
	movf	(vPutSampleDataIntoTable@channel),w
	xorlw	0Dh
	skipz
	goto	u128_21
	goto	u128_20
u128_21:
	goto	i1l3661
u128_20:
	line	237
	
i1l3651:	
;common.c: 236: {
;common.c: 237: if(ucChannelFourthLength < 8)
	movlw	(08h)
	bcf	status, 5	;RP0=0, select bank0
	subwf	(vPutSampleDataIntoTable@ucChannelFourthLength),w
	skipnc
	goto	u129_21
	goto	u129_20
u129_21:
	goto	i1l3657
u129_20:
	line	239
	
i1l3653:	
;common.c: 238: {
;common.c: 239: uiSampleChannelFourth[ucChannelFourthLength] = uiSampleData;
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
	line	241
	
i1l3655:	
;common.c: 241: ucChannelFourthLength++;
	incf	(vPutSampleDataIntoTable@ucChannelFourthLength),f
	line	242
;common.c: 242: }
	goto	i1l1560
	line	245
	
i1l3657:	
;common.c: 243: else
;common.c: 244: {
;common.c: 245: ucChannelFourthLength = 0;
	clrf	(vPutSampleDataIntoTable@ucChannelFourthLength)
	line	247
	
i1l3659:	
;common.c: 247: uiSampleChannelFourth[ucChannelFourthLength] = uiSampleData;
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
	goto	i1l1560
	line	250
	
i1l3661:	
;common.c: 250: else if(channel == 14)
	movf	(vPutSampleDataIntoTable@channel),w
	xorlw	0Eh
	skipz
	goto	u130_21
	goto	u130_20
u130_21:
	goto	i1l3673
u130_20:
	line	252
	
i1l3663:	
;common.c: 251: {
;common.c: 252: if(ucChannelFourteenthLength < 3)
	movlw	(03h)
	bcf	status, 5	;RP0=0, select bank0
	subwf	(vPutSampleDataIntoTable@ucChannelFourteenthLength),w
	skipnc
	goto	u131_21
	goto	u131_20
u131_21:
	goto	i1l3669
u131_20:
	line	254
	
i1l3665:	
;common.c: 253: {
;common.c: 254: uiSampleChannelFourteenth[ucChannelFourteenthLength] = uiSampleData;
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
	line	256
	
i1l3667:	
;common.c: 256: ucChannelFourteenthLength++;
	incf	(vPutSampleDataIntoTable@ucChannelFourteenthLength),f
	line	257
;common.c: 257: }
	goto	i1l1560
	line	260
	
i1l3669:	
;common.c: 258: else
;common.c: 259: {
;common.c: 260: ucChannelFourteenthLength = 0;
	clrf	(vPutSampleDataIntoTable@ucChannelFourteenthLength)
	line	262
	
i1l3671:	
;common.c: 262: uiSampleChannelFourth[ucChannelFourteenthLength] = uiSampleData;
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
	goto	i1l1560
	line	267
	
i1l3673:	
;common.c: 265: else
;common.c: 266: {
;common.c: 267: ucChannelFirstLength = 0;
	clrf	(vPutSampleDataIntoTable@ucChannelFirstLength)
	line	269
;common.c: 269: ucChannelFourthLength = 0;
	bcf	status, 5	;RP0=0, select bank0
	clrf	(vPutSampleDataIntoTable@ucChannelFourthLength)
	line	271
;common.c: 271: ucChannelFourteenthLength = 0;
	clrf	(vPutSampleDataIntoTable@ucChannelFourteenthLength)
	line	273
;common.c: 273: for(int i = 0;i < 3; i++)
	clrf	(vPutSampleDataIntoTable@i)
	clrf	(vPutSampleDataIntoTable@i+1)
	line	275
	
i1l3679:	
;common.c: 274: {
;common.c: 275: uiSampleChannelFirst[i] = 0;
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	clrc
	rlf	(vPutSampleDataIntoTable@i),w
	addlw	_uiSampleChannelFirst&0ffh
	movwf	fsr0
	bcf	status, 7	;select IRP bank1
	clrf	indf
	incf	fsr0,f
	clrf	indf
	line	277
;common.c: 277: uiSampleChannelFourth[i] = 0;
	clrc
	rlf	(vPutSampleDataIntoTable@i),w
	addlw	_uiSampleChannelFourth&0ffh
	movwf	fsr0
	clrf	indf
	incf	fsr0,f
	clrf	indf
	line	279
;common.c: 279: uiSampleChannelFourth[i] = 0;
	clrc
	rlf	(vPutSampleDataIntoTable@i),w
	addlw	_uiSampleChannelFourth&0ffh
	movwf	fsr0
	clrf	indf
	incf	fsr0,f
	clrf	indf
	line	273
	
i1l3681:	
	incf	(vPutSampleDataIntoTable@i),f
	skipnz
	incf	(vPutSampleDataIntoTable@i+1),f
	
i1l3683:	
	movf	(vPutSampleDataIntoTable@i+1),w
	xorlw	80h
	movwf	btemp+1
	movlw	(high(03h))^80h
	subwf	btemp+1,w
	skipz
	goto	u132_25
	movlw	low(03h)
	subwf	(vPutSampleDataIntoTable@i),w
u132_25:

	skipc
	goto	u132_21
	goto	u132_20
u132_21:
	goto	i1l3679
u132_20:
	line	283
	
i1l1560:	
	return
	opt stack 0
GLOBAL	__end_of_vPutSampleDataIntoTable
	__end_of_vPutSampleDataIntoTable:
;; =============== function _vPutSampleDataIntoTable ends ============

	signat	_vPutSampleDataIntoTable,8312
	global	i1_setAD_ConvertFlag
psect	text1217,local,class=CODE,delta=2
global __ptext1217
__ptext1217:

;; *************** function i1_setAD_ConvertFlag *****************
;; Defined at:
;;		line 321 in file "D:\develop\AK7030-good\AK7030-OTP\common.c"
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
psect	text1217
	file	"D:\develop\AK7030-good\AK7030-OTP\common.c"
	line	321
	global	__size_ofi1_setAD_ConvertFlag
	__size_ofi1_setAD_ConvertFlag	equ	__end_ofi1_setAD_ConvertFlag-i1_setAD_ConvertFlag
	
i1_setAD_ConvertFlag:	
	opt	stack 4
; Regs used in i1_setAD_ConvertFlag: [wreg]
;i1setAD_ConvertFlag@flag stored from wreg
	movwf	(i1setAD_ConvertFlag@flag)
	line	322
	
i1l3743:	
;common.c: 322: adc_convert_flag = flag;
	movf	(i1setAD_ConvertFlag@flag),w
	movwf	(_adc_convert_flag)
	line	323
	
i1l1578:	
	return
	opt stack 0
GLOBAL	__end_ofi1_setAD_ConvertFlag
	__end_ofi1_setAD_ConvertFlag:
;; =============== function i1_setAD_ConvertFlag ends ============

	signat	i1_setAD_ConvertFlag,88
	global	_adc_get
psect	text1218,local,class=CODE,delta=2
global __ptext1218
__ptext1218:

;; *************** function _adc_get *****************
;; Defined at:
;;		line 106 in file "D:\develop\AK7030-good\AK7030-OTP\periph.c"
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
psect	text1218
	file	"D:\develop\AK7030-good\AK7030-OTP\periph.c"
	line	106
	global	__size_of_adc_get
	__size_of_adc_get	equ	__end_of_adc_get-_adc_get
	
_adc_get:	
	opt	stack 4
; Regs used in _adc_get: [wreg]
	line	108
	
i1l3739:	
;periph.c: 107: unsigned int val;
;periph.c: 108: val = (ADRESH<<8) | ADRESL;
	movf	(30),w	;volatile
	movwf	(adc_get@val+1)
	clrf	(adc_get@val)
	bsf	status, 5	;RP0=1, select bank1
	movf	(158)^080h,w	;volatile
	iorwf	(adc_get@val),f
	line	109
;periph.c: 109: return val;
	movf	(adc_get@val+1),w
	movwf	(?_adc_get+1)
	movf	(adc_get@val),w
	movwf	(?_adc_get)
	line	110
	
i1l2330:	
	return
	opt stack 0
GLOBAL	__end_of_adc_get
	__end_of_adc_get:
;; =============== function _adc_get ends ============

	signat	_adc_get,90
	global	_Filter
psect	text1219,local,class=CODE,delta=2
global __ptext1219
__ptext1219:

;; *************** function _Filter *****************
;; Defined at:
;;		line 105 in file "D:\develop\AK7030-good\AK7030-OTP\common.c"
;; Parameters:    Size  Location     Type
;;  tmpValue        1    wreg     PTR int 
;;		 -> uiSampleChannelFourteenth(6), uiSampleChannelFirst(6), 
;; Auto vars:     Size  Location     Type
;;  tmpValue        1    4[BANK0 ] PTR int 
;;		 -> uiSampleChannelFourteenth(6), uiSampleChannelFirst(6), 
;;  cir             2   11[BANK0 ] int 
;;  filter_buf      6    5[BANK0 ] unsigned int [3]
;;  filter_sum      2    2[BANK0 ] unsigned int 
;;  filter_temp     2    0[BANK0 ] unsigned int 
;;  i               1   14[BANK0 ] unsigned char 
;;  j               1   13[BANK0 ] unsigned char 
;; Return value:  Size  Location     Type
;;                  2    0[COMMON] unsigned int 
;; Registers used:
;;		wreg, fsr0l, fsr0h, status,2, status,0, btemp+1
;; Tracked objects:
;;		On entry : 160/20
;;		On exit  : 160/0
;;		Unchanged: FFE00/0
;; Data sizes:     COMMON   BANK0   BANK1   BANK3   BANK2
;;      Params:         2       0       0       0       0
;;      Locals:         0      15       0       0       0
;;      Temps:          4       0       0       0       0
;;      Totals:         6      15       0       0       0
;;Total ram usage:       21 bytes
;; Hardware stack levels used:    1
;; This function calls:
;;		Nothing
;; This function is called by:
;;		_vPutSampleDataIntoTable
;; This function uses a non-reentrant model
;;
psect	text1219
	file	"D:\develop\AK7030-good\AK7030-OTP\common.c"
	line	105
	global	__size_of_Filter
	__size_of_Filter	equ	__end_of_Filter-_Filter
	
_Filter:	
	opt	stack 3
; Regs used in _Filter: [wreg-fsr0h+status,2+status,0+btemp+1]
;Filter@tmpValue stored from wreg
	line	107
	bcf	status, 5	;RP0=0, select bank0
	movwf	(Filter@tmpValue)
	
i1l3561:	
	clrf	(Filter@j)
	line	109
;common.c: 109: unsigned int filter_temp = 0, filter_sum = 0;
	clrf	(Filter@filter_temp)
	clrf	(Filter@filter_temp+1)
	clrf	(Filter@filter_sum)
	clrf	(Filter@filter_sum+1)
	line	113
;common.c: 111: unsigned int filter_buf[3];
;common.c: 113: for(int cir = 0;cir < 3; cir++)
	clrf	(Filter@cir)
	clrf	(Filter@cir+1)
	line	114
	
i1l3567:	
;common.c: 114: filter_buf[cir] = *tmpValue++;
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
	
i1l3569:	
	incf	(Filter@tmpValue),f
	incf	(Filter@tmpValue),f
	line	113
	
i1l3571:	
	incf	(Filter@cir),f
	skipnz
	incf	(Filter@cir+1),f
	
i1l3573:	
	movf	(Filter@cir+1),w
	xorlw	80h
	movwf	btemp+1
	movlw	(high(03h))^80h
	subwf	btemp+1,w
	skipz
	goto	u115_25
	movlw	low(03h)
	subwf	(Filter@cir),w
u115_25:

	skipc
	goto	u115_21
	goto	u115_20
u115_21:
	goto	i1l3567
u115_20:
	line	118
	
i1l3575:	
;common.c: 118: for(j = 0; j < 3 - 1; j++)
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	clrf	(Filter@j)
	line	120
	
i1l3581:	
;common.c: 119: {
;common.c: 120: for(i = 0; i < 3 - 1 - j; i++)
	clrf	(Filter@i)
	goto	i1l3589
	line	122
	
i1l3583:	
;common.c: 121: {
;common.c: 122: if(filter_buf[i] > filter_buf[i + 1])
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
	goto	u116_25
	movf	0+(??_Filter+0)+0,w
	subwf	0+(??_Filter+2)+0,w
u116_25:
	skipnc
	goto	u116_21
	goto	u116_20
u116_21:
	goto	i1l3587
u116_20:
	line	125
	
i1l3585:	
;common.c: 123: {
;common.c: 125: filter_temp = filter_buf[i];
	clrc
	rlf	(Filter@i),w
	addlw	Filter@filter_buf&0ffh
	movwf	fsr0
	movf	indf,w
	movwf	(Filter@filter_temp)
	incf	fsr0,f
	movf	indf,w
	movwf	(Filter@filter_temp+1)
	line	127
;common.c: 127: filter_buf[i] = filter_buf[i + 1];
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
	line	129
;common.c: 129: filter_buf[i + 1] = filter_temp;
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
	line	120
	
i1l3587:	
	incf	(Filter@i),f
	
i1l3589:	
	movlw	high(02h)
	movwf	(??_Filter+0)+0+1
	movf	(Filter@j),w
	sublw	low(02h)
	movwf	(??_Filter+0)+0
	skipc
	decf	(??_Filter+0)+0+1,f
	movf	1+(??_Filter+0)+0,w
	xorlw	80h
	sublw	080h
	skipz
	goto	u117_25
	movf	0+(??_Filter+0)+0,w
	subwf	(Filter@i),w
u117_25:

	skipc
	goto	u117_21
	goto	u117_20
u117_21:
	goto	i1l3583
u117_20:
	line	118
	
i1l3591:	
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	incf	(Filter@j),f
	
i1l3593:	
	movlw	(02h)
	subwf	(Filter@j),w
	skipc
	goto	u118_21
	goto	u118_20
u118_21:
	goto	i1l3581
u118_20:
	
i1l1509:	
	line	134
;common.c: 130: }
;common.c: 131: }
;common.c: 132: }
;common.c: 134: for(i = 1; i < 3 - 1; i++)
	clrf	(Filter@i)
	incf	(Filter@i),f
	line	136
	
i1l3599:	
;common.c: 135: {
;common.c: 136: filter_sum += filter_buf[i];
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
	line	134
	
i1l3601:	
	incf	(Filter@i),f
	
i1l3603:	
	movlw	(02h)
	subwf	(Filter@i),w
	skipc
	goto	u119_21
	goto	u119_20
u119_21:
	goto	i1l3599
u119_20:
	line	140
	
i1l3605:	
;common.c: 137: }
;common.c: 140: return (filter_sum );
	movf	(Filter@filter_sum+1),w
	movwf	(?_Filter+1)
	movf	(Filter@filter_sum),w
	movwf	(?_Filter)
	line	142
	
i1l1516:	
	return
	opt stack 0
GLOBAL	__end_of_Filter
	__end_of_Filter:
;; =============== function _Filter ends ============

	signat	_Filter,4218
	global	_setPWM_Width
psect	text1220,local,class=CODE,delta=2
global __ptext1220
__ptext1220:

;; *************** function _setPWM_Width *****************
;; Defined at:
;;		line 54 in file "D:\develop\AK7030-good\AK7030-OTP\common.c"
;; Parameters:    Size  Location     Type
;;  ucWidth         1    wreg     unsigned char 
;; Auto vars:     Size  Location     Type
;;  ucWidth         1    0[COMMON] unsigned char 
;; Return value:  Size  Location     Type
;;		None               void
;; Registers used:
;;		wreg
;; Tracked objects:
;;		On entry : 160/0
;;		On exit  : 160/0
;;		Unchanged: FFE9F/0
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
;;		_vPutSampleDataIntoTable
;; This function uses a non-reentrant model
;;
psect	text1220
	file	"D:\develop\AK7030-good\AK7030-OTP\common.c"
	line	54
	global	__size_of_setPWM_Width
	__size_of_setPWM_Width	equ	__end_of_setPWM_Width-_setPWM_Width
	
_setPWM_Width:	
	opt	stack 3
; Regs used in _setPWM_Width: [wreg]
;setPWM_Width@ucWidth stored from wreg
	line	55
	movwf	(setPWM_Width@ucWidth)
	line	56
	
i1l3507:	
;common.c: 55: static unsigned char ucOldWidth = 0;
;common.c: 56: if( ucOldWidth != ucWidth)
	movf	(setPWM_Width@ucOldWidth),w
	xorwf	(setPWM_Width@ucWidth),w
	skipnz
	goto	u109_21
	goto	u109_20
u109_21:
	goto	i1l1490
u109_20:
	line	58
	
i1l3509:	
;common.c: 57: {
;common.c: 58: CCPR1L = ucWidth;
	movf	(setPWM_Width@ucWidth),w
	movwf	(21)	;volatile
	line	59
;common.c: 59: ucOldWidth = ucWidth;
	movf	(setPWM_Width@ucWidth),w
	movwf	(setPWM_Width@ucOldWidth)
	line	61
	
i1l1490:	
	return
	opt stack 0
GLOBAL	__end_of_setPWM_Width
	__end_of_setPWM_Width:
;; =============== function _setPWM_Width ends ============

	signat	_setPWM_Width,4216
psect	text1221,local,class=CODE,delta=2
global __ptext1221
__ptext1221:
	global	btemp
	btemp set 07Eh

	DABS	1,126,2	;btemp
	global	wtemp0
	wtemp0 set btemp
	end
