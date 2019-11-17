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
# 100 "D:\develop\AK7030-good\AK7030-OTP\main.c"
	psect config,class=CONFIG,delta=2 ;#
# 100 "D:\develop\AK7030-good\AK7030-OTP\main.c"
	dw 0x0FFF & 0x3FFF & 0x3FFF & 0x3FFF & 0x3FFF & 0x3FFF ;#
# 101 "D:\develop\AK7030-good\AK7030-OTP\main.c"
	psect config,class=CONFIG,delta=2 ;#
# 101 "D:\develop\AK7030-good\AK7030-OTP\main.c"
	dw 0x3FFF & 0x3FDF & 0x3FFF & 0x3FFE ;#
# 102 "D:\develop\AK7030-good\AK7030-OTP\main.c"
	psect config,class=CONFIG,delta=2 ;#
# 102 "D:\develop\AK7030-good\AK7030-OTP\main.c"
	dw 0X3FFF & 0x3FFF & 0x3FFF & 0x3FF8 ;#
	FNCALL	_main,_initPin
	FNCALL	_main,_setPinInitVaule
	FNCALL	_main,_selectAdChannel
	FNCALL	_main,_clock_config
	FNCALL	_main,_timer1_config
	FNCALL	_main,_timer1_interrupt_config
	FNCALL	_main,_adc_test_init
	FNCALL	_main,_startTwentyMinTimer
	FNCALL	_main,_adc_start
	FNCALL	_main,_process_AD_Converter_Value
	FNCALL	_main,_isPermitSampleTime
	FNCALL	_main,_clrSampeTime
	FNCALL	_main,_isFinishedTwentyMinTimer
	FNCALL	_main,_getAdOriginalCh13Value
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
	FNCALL	_main,_setWaitResetFlag
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
	FNCALL	_vPutSampleDataIntoTable,_getWaitResetFlag
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
	line	191

;initializer for vPutSampleDataIntoTable@uiInitWidth
	retlw	04Bh
	global	_uiBigTimer
	global	_uiOneHourTimer
	global	_uiSmallTimer
	global	_uiTwentyMinTimer
	global	vPutSampleDataIntoTable@uiCalWidthArrayNew
	global	vPutSampleDataIntoTable@uiCalWidthArrayOld
	global	ISR@ucTimer1sCnt
	global	_adc_convert_flag
	global	_bBigTimerStartFlag
	global	_bOneHourTimerStartFlag
	global	_bSmallTimerStartFlag
	global	_bTwentyMinStartFlag
	global	_bWaitResetFlag
	global	_sampleTimes
	global	_timer
	global	main@cTimerP5s_781
	global	main@cTimerP5s_787
	global	main@ucStep
	global	main@ucTimerP3s
	global	main@ucTimerP5s
	global	setPWM_Width@ucOldWidth
	global	vPutSampleDataIntoTable@ucCh13Length
	global	vPutSampleDataIntoTable@ucChannelFourteenthLength
	global	vPutSampleDataIntoTable@ucCh12Length
	global	_uiTwentySecondsTimer
	global	main@ucDelay1s
	global	main@uiTimerOneP5s
	global	main@uiTimerThreeP5s
	global	main@uiTimerTwoP5s
	global	vPutSampleDataIntoTable@uiCalWidthCnt
	global	_uiSampleCh13
	global	_uiSampleCh12
	global	_uiSampleChannelFourteenth
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
vPutSampleDataIntoTable@ucCh12Length:
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

vPutSampleDataIntoTable@uiCalWidthArrayOld:
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

_bWaitResetFlag:
       ds      1

_sampleTimes:
       ds      1

_timer:
       ds      1

main@cTimerP5s_781:
       ds      1

main@cTimerP5s_787:
       ds      1

main@ucStep:
       ds      1

main@ucTimerP3s:
       ds      1

main@ucTimerP5s:
       ds      1

setPWM_Width@ucOldWidth:
       ds      1

vPutSampleDataIntoTable@ucCh13Length:
       ds      1

vPutSampleDataIntoTable@ucChannelFourteenthLength:
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
	line	191
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

vPutSampleDataIntoTable@uiCalWidthCnt:
       ds      2

_uiSampleCh13:
       ds      16

_uiSampleCh12:
       ds      6

_uiSampleChannelFourteenth:
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
	movlw	low((__pbssBANK0)+01Dh)
	fcall	clear_ram
; Clear objects allocated to BANK1
psect cinit,class=CODE,delta=2
	movlw	low(__pbssBANK1)
	movwf	fsr
	movlw	low((__pbssBANK1)+028h)
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
	global	main@ucChValue
main@ucChValue:	; 2 bytes @ 0x11
	ds	2
	global	main@uiCh13Value
main@uiCh13Value:	; 2 bytes @ 0x13
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
	global	?_setWaitResetFlag
?_setWaitResetFlag:	; 0 bytes @ 0x0
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
	global	??_getWaitResetFlag
??_getWaitResetFlag:	; 0 bytes @ 0x0
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
	global	?_getWaitResetFlag
?_getWaitResetFlag:	; 1 bytes @ 0x0
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
	global	??_ISR
??_ISR:	; 0 bytes @ 0x9
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
	global	vPutSampleDataIntoTable@uiAbstractValue
vPutSampleDataIntoTable@uiAbstractValue:	; 2 bytes @ 0xF
	ds	2
	global	vPutSampleDataIntoTable@uiDeviationValue
vPutSampleDataIntoTable@uiDeviationValue:	; 2 bytes @ 0x11
	ds	2
	global	vPutSampleDataIntoTable@i
vPutSampleDataIntoTable@i:	; 2 bytes @ 0x13
	ds	2
	global	??_clock_config
??_clock_config:	; 0 bytes @ 0x15
	global	??_timer1_config
??_timer1_config:	; 0 bytes @ 0x15
	global	??_timer1_interrupt_config
??_timer1_interrupt_config:	; 0 bytes @ 0x15
	global	?_adc_test_init
?_adc_test_init:	; 0 bytes @ 0x15
	global	?_startTwentyMinTimer
?_startTwentyMinTimer:	; 0 bytes @ 0x15
	global	??_adc_start
??_adc_start:	; 0 bytes @ 0x15
	global	??_isPermitSampleTime
??_isPermitSampleTime:	; 0 bytes @ 0x15
	global	??_clrSampeTime
??_clrSampeTime:	; 0 bytes @ 0x15
	global	??_isFinishedTwentyMinTimer
??_isFinishedTwentyMinTimer:	; 0 bytes @ 0x15
	global	??_clearTwentyMinTimer
??_clearTwentyMinTimer:	; 0 bytes @ 0x15
	global	?_startTwelveHourTimer
?_startTwelveHourTimer:	; 0 bytes @ 0x15
	global	??_isFinishedTwelveHoursTimer
??_isFinishedTwelveHoursTimer:	; 0 bytes @ 0x15
	global	??_clearTwelveHoursTimer
??_clearTwelveHoursTimer:	; 0 bytes @ 0x15
	global	?_startThreeHoursTimer
?_startThreeHoursTimer:	; 0 bytes @ 0x15
	global	??_isFinishedThreeHoursTimer
??_isFinishedThreeHoursTimer:	; 0 bytes @ 0x15
	global	??_clearThreeHoursTimer
??_clearThreeHoursTimer:	; 0 bytes @ 0x15
	global	?_startOneHoursTimer
?_startOneHoursTimer:	; 0 bytes @ 0x15
	global	??_isFinishedOneHoursTimer
??_isFinishedOneHoursTimer:	; 0 bytes @ 0x15
	global	??_setWaitResetFlag
??_setWaitResetFlag:	; 0 bytes @ 0x15
	global	??_AD_Sample
??_AD_Sample:	; 0 bytes @ 0x15
	global	??_initPB3
??_initPB3:	; 0 bytes @ 0x15
	global	??_setPB3
??_setPB3:	; 0 bytes @ 0x15
	global	??_initPB4
??_initPB4:	; 0 bytes @ 0x15
	global	??_setPB4
??_setPB4:	; 0 bytes @ 0x15
	global	??_initPB5
??_initPB5:	; 0 bytes @ 0x15
	global	??_setPB5
??_setPB5:	; 0 bytes @ 0x15
	global	??_initPB2_AsHighResistence
??_initPB2_AsHighResistence:	; 0 bytes @ 0x15
	global	?_pwm_start
?_pwm_start:	; 0 bytes @ 0x15
	global	??_selectAdChannel
??_selectAdChannel:	; 0 bytes @ 0x15
	global	??_reset
??_reset:	; 0 bytes @ 0x15
	global	??_getAD_ConvertFlag
??_getAD_ConvertFlag:	; 0 bytes @ 0x15
	global	??_setAD_ConvertFlag
??_setAD_ConvertFlag:	; 0 bytes @ 0x15
	global	?_FilterCh13
?_FilterCh13:	; 2 bytes @ 0x15
	global	initPB3@bValue
initPB3@bValue:	; 1 bytes @ 0x15
	global	setPB3@bValue
setPB3@bValue:	; 1 bytes @ 0x15
	global	initPB4@bValue
initPB4@bValue:	; 1 bytes @ 0x15
	global	setPB4@bValue
setPB4@bValue:	; 1 bytes @ 0x15
	global	initPB5@bValue
initPB5@bValue:	; 1 bytes @ 0x15
	global	setPB5@bValue
setPB5@bValue:	; 1 bytes @ 0x15
	global	pwm_start@ucPulseFrequency
pwm_start@ucPulseFrequency:	; 1 bytes @ 0x15
	global	setWaitResetFlag@bValue
setWaitResetFlag@bValue:	; 1 bytes @ 0x15
	global	setAD_ConvertFlag@flag
setAD_ConvertFlag@flag:	; 1 bytes @ 0x15
	global	adc_test_init@ref
adc_test_init@ref:	; 1 bytes @ 0x15
	global	startTwelveHourTimer@uiSetTime
startTwelveHourTimer@uiSetTime:	; 2 bytes @ 0x15
	global	startThreeHoursTimer@uiSetTime
startThreeHoursTimer@uiSetTime:	; 2 bytes @ 0x15
	global	startOneHoursTimer@uiSetTime
startOneHoursTimer@uiSetTime:	; 2 bytes @ 0x15
	global	startTwentyMinTimer@uiSetValue
startTwentyMinTimer@uiSetValue:	; 2 bytes @ 0x15
	ds	1
	global	??_adc_test_init
??_adc_test_init:	; 0 bytes @ 0x16
	global	??_pwm_start
??_pwm_start:	; 0 bytes @ 0x16
	global	??_initPin
??_initPin:	; 0 bytes @ 0x16
	global	??_setPinInitVaule
??_setPinInitVaule:	; 0 bytes @ 0x16
	global	pwm_start@ucPulseWidth
pwm_start@ucPulseWidth:	; 1 bytes @ 0x16
	ds	1
	global	??_startTwentyMinTimer
??_startTwentyMinTimer:	; 0 bytes @ 0x17
	global	??_startTwelveHourTimer
??_startTwelveHourTimer:	; 0 bytes @ 0x17
	global	??_startThreeHoursTimer
??_startThreeHoursTimer:	; 0 bytes @ 0x17
	global	??_startOneHoursTimer
??_startOneHoursTimer:	; 0 bytes @ 0x17
	global	??_FilterCh13
??_FilterCh13:	; 0 bytes @ 0x17
	global	adc_test_init@channel
adc_test_init@channel:	; 1 bytes @ 0x17
	ds	1
	global	??_process_AD_Converter_Value
??_process_AD_Converter_Value:	; 0 bytes @ 0x18
	ds	3
	global	??_getAdOriginalCh13Value
??_getAdOriginalCh13Value:	; 0 bytes @ 0x1B
	global	??_main
??_main:	; 0 bytes @ 0x1B
	ds	1
;;Data sizes: Strings 0, constant 0, data 2, bss 70, persistent 0 stack 0
;;Auto spaces:   Size  Autos    Used
;; COMMON          14     13      14
;; BANK0           80     28      59
;; BANK1           80     21      61
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
;;		 -> uiSampleChannelFourteenth(BANK1[6]), uiSampleCh12(BANK1[6]), 
;;
;; FilterCh13@tmpValue	PTR int  size(1) Largest target is 16
;;		 -> uiSampleCh13(BANK1[16]), 
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
;; (0) _main                                                 5     5      0    1696
;;                                             27 BANK0      1     1      0
;;                                             17 BANK1      4     4      0
;;                            _initPin
;;                    _setPinInitVaule
;;                    _selectAdChannel
;;                       _clock_config
;;                      _timer1_config
;;            _timer1_interrupt_config
;;                      _adc_test_init
;;                _startTwentyMinTimer
;;                          _adc_start
;;         _process_AD_Converter_Value
;;                 _isPermitSampleTime
;;                       _clrSampeTime
;;           _isFinishedTwentyMinTimer
;;             _getAdOriginalCh13Value
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
;;                   _setWaitResetFlag
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
;;                                             21 BANK0      1     1      0
;; ---------------------------------------------------------------------------------
;; (2) _getAD_ConvertFlag                                    0     0      0       0
;; ---------------------------------------------------------------------------------
;; (2) _FilterCh13                                          21    19      2     915
;;                                             21 BANK0      6     4      2
;;                                              0 BANK1     15    15      0
;; ---------------------------------------------------------------------------------
;; (1) _setWaitResetFlag                                     1     1      0      31
;;                                             21 BANK0      1     1      0
;; ---------------------------------------------------------------------------------
;; (1) _isFinishedOneHoursTimer                              0     0      0       0
;; ---------------------------------------------------------------------------------
;; (1) _startOneHoursTimer                                   2     0      2      31
;;                                             21 BANK0      2     0      2
;; ---------------------------------------------------------------------------------
;; (1) _clearThreeHoursTimer                                 0     0      0       0
;; ---------------------------------------------------------------------------------
;; (1) _isFinishedThreeHoursTimer                            0     0      0       0
;; ---------------------------------------------------------------------------------
;; (1) _startThreeHoursTimer                                 2     0      2      31
;;                                             21 BANK0      2     0      2
;; ---------------------------------------------------------------------------------
;; (1) _clearTwelveHoursTimer                                0     0      0       0
;; ---------------------------------------------------------------------------------
;; (1) _isFinishedTwelveHoursTimer                           0     0      0       0
;; ---------------------------------------------------------------------------------
;; (1) _startTwelveHourTimer                                 2     0      2      31
;;                                             21 BANK0      2     0      2
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
;;                                             21 BANK0      2     0      2
;; ---------------------------------------------------------------------------------
;; (2) _adc_test_init                                        3     2      1      62
;;                                             21 BANK0      3     2      1
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
;;                                             21 BANK0      2     1      1
;; ---------------------------------------------------------------------------------
;; (2) _initPB2_AsHighResistence                             0     0      0       0
;; ---------------------------------------------------------------------------------
;; (1) _setPB5                                               1     1      0      31
;;                                             21 BANK0      1     1      0
;; ---------------------------------------------------------------------------------
;; (2) _initPB5                                              1     1      0      31
;;                                             21 BANK0      1     1      0
;; ---------------------------------------------------------------------------------
;; (1) _setPB4                                               1     1      0      31
;;                                             21 BANK0      1     1      0
;; ---------------------------------------------------------------------------------
;; (2) _initPB4                                              1     1      0      31
;;                                             21 BANK0      1     1      0
;; ---------------------------------------------------------------------------------
;; (1) _setPB3                                               1     1      0      31
;;                                             21 BANK0      1     1      0
;; ---------------------------------------------------------------------------------
;; (2) _initPB3                                              1     1      0      31
;;                                             21 BANK0      1     1      0
;; ---------------------------------------------------------------------------------
;; Estimated maximum stack depth 2
;; ---------------------------------------------------------------------------------
;; (Depth) Function   	        Calls       Base Space   Used Autos Params    Refs
;; ---------------------------------------------------------------------------------
;; (3) _ISR                                                  4     4      0    1170
;;                                              9 COMMON     4     4      0
;;                i1_setAD_ConvertFlag
;;                            _adc_get
;;            _vPutSampleDataIntoTable
;; ---------------------------------------------------------------------------------
;; (4) _vPutSampleDataIntoTable                              9     6      3    1073
;;                                              6 COMMON     3     0      3
;;                                             15 BANK0      6     6      0
;;                             _Filter
;;                   _getWaitResetFlag
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
;; (5) _getWaitResetFlag                                     0     0      0       0
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
;;   _setWaitResetFlag
;;
;; _ISR (ROOT)
;;   i1_setAD_ConvertFlag
;;   _adc_get
;;   _vPutSampleDataIntoTable
;;     _Filter
;;     _getWaitResetFlag
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
;;BANK1               50     15      3D       8       76.3%
;;BITBANK1            50      0       0       7        0.0%
;;CODE                 0      0       0       0        0.0%
;;DATA                 0      0      8E       6        0.0%
;;ABS                  0      0      86       3        0.0%
;;NULL                 0      0       0       0        0.0%
;;STACK                0      0       8       2        0.0%
;;BANK0               50     1C      3B       5       73.8%
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
;;		line 498 in file "D:\develop\AK7030-good\AK7030-OTP\main.c"
;; Parameters:    Size  Location     Type
;;		None
;; Auto vars:     Size  Location     Type
;;  ucChValue       2   17[BANK1 ] unsigned int 
;;  uiCh13Value     2   19[BANK1 ] unsigned int 
;; Return value:  Size  Location     Type
;;                  2  727[COMMON] int 
;; Registers used:
;;		wreg, fsr0l, fsr0h, status,2, status,0, btemp+1, pclath, cstack
;; Tracked objects:
;;		On entry : 17F/0
;;		On exit  : 60/0
;;		Unchanged: 0/0
;; Data sizes:     COMMON   BANK0   BANK1   BANK3   BANK2
;;      Params:         0       0       0       0       0
;;      Locals:         0       0       4       0       0
;;      Temps:          0       1       0       0       0
;;      Totals:         0       1       4       0       0
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
;;		_adc_start
;;		_process_AD_Converter_Value
;;		_isPermitSampleTime
;;		_clrSampeTime
;;		_isFinishedTwentyMinTimer
;;		_getAdOriginalCh13Value
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
;;		_setWaitResetFlag
;; This function is called by:
;;		Startup code after reset
;; This function uses a non-reentrant model
;;
psect	maintext
	file	"D:\develop\AK7030-good\AK7030-OTP\main.c"
	line	498
	global	__size_of_main
	__size_of_main	equ	__end_of_main-_main
	
_main:	
	opt	stack 3
; Regs used in _main: [wreg-fsr0h+status,2+status,0+btemp+1+pclath+cstack]
	line	526
	
l4260:	
;main.c: 499: enum systemStep {
;main.c: 500: INIT_STEP = 0,
;main.c: 501: START_UP_PWM_STEP,
;main.c: 502: CHECK_10_HOUR_TIMER_STEP,
;main.c: 503: STARTUP_3_HOUR_TIMER_STEP,
;main.c: 504: CHECK_3_HOUR_TIMER_STEP,
;main.c: 505: STARTUP_1_HOUR_TIMER_STEP,
;main.c: 506: CHECK_1_HOUR_TIMER_STEP,
;main.c: 507: READY_FOR_RESET_STEP = 99,
;main.c: 508: DELAY_ONE_SECOND_FOR_PWM,
;main.c: 509: MEET_RESET_CONDITION_STEP,
;main.c: 510: RESET_STEP,
;main.c: 511: };
;main.c: 513: static enum systemStep ucStep = INIT_STEP;
	fcall	_initPin
	line	527
;main.c: 527: setPinInitVaule();
	fcall	_setPinInitVaule
	line	528
	
l4262:	
;main.c: 528: selectAdChannel();
	fcall	_selectAdChannel
	line	530
	
l4264:	
;main.c: 530: clock_config();
	fcall	_clock_config
	line	531
	
l4266:	
;main.c: 531: timer1_config();
	fcall	_timer1_config
	line	532
	
l4268:	
;main.c: 532: timer1_interrupt_config();
	fcall	_timer1_interrupt_config
	line	534
;main.c: 534: adc_test_init(12,3);
	movlw	(03h)
	bcf	status, 5	;RP0=0, select bank0
	movwf	(?_adc_test_init)
	movlw	(0Ch)
	fcall	_adc_test_init
	line	540
;main.c: 540: startTwentyMinTimer( 60 );
	movlw	03Ch
	bcf	status, 5	;RP0=0, select bank0
	movwf	(?_startTwentyMinTimer)
	clrf	(?_startTwentyMinTimer+1)
	fcall	_startTwentyMinTimer
	line	541
	
l4270:	
;main.c: 541: _delay(1000);
	opt asmopt_off
movlw	249
movwf	(??_main+0)+0,f
u2297:
	clrwdt
decfsz	(??_main+0)+0,f
	goto	u2297
	nop2	;nop
	clrwdt
opt asmopt_on

	line	542
;main.c: 542: adc_start();
	fcall	_adc_start
	line	553
	
l4272:	
# 553 "D:\develop\AK7030-good\AK7030-OTP\main.c"
 clrwdt ;#
psect	maintext
	line	555
	
l4274:	
;main.c: 555: process_AD_Converter_Value();
	fcall	_process_AD_Converter_Value
	line	557
	
l4276:	
;main.c: 557: if( isPermitSampleTime() )
	fcall	_isPermitSampleTime
	xorlw	0
	skipnz
	goto	u2071
	goto	u2070
u2071:
	goto	l4272
u2070:
	line	561
	
l4278:	
;main.c: 558: {
;main.c: 561: clrSampeTime();
	fcall	_clrSampeTime
	line	570
;main.c: 570: switch(ucStep)
	goto	l4432
	line	581
	
l4280:	
;main.c: 574: {
;main.c: 579: static unsigned char ucTimerP3s = 0;
;main.c: 581: if( isFinishedTwentyMinTimer() )
	fcall	_isFinishedTwentyMinTimer
	xorlw	0
	skipnz
	goto	u2081
	goto	u2080
u2081:
	goto	l4286
u2080:
	line	583
	
l4282:	
;main.c: 582: {
;main.c: 583: ucStep = READY_FOR_RESET_STEP;
	movlw	(063h)
	movwf	(main@ucStep)
	line	584
	
l4284:	
;main.c: 584: ucTimerP3s = 0;
	clrf	(main@ucTimerP3s)
	line	585
;main.c: 585: }
	goto	l4272
	line	588
	
l4286:	
;main.c: 586: else
;main.c: 587: {
;main.c: 588: if( getAdOriginalCh13Value() > 90 )
	fcall	_getAdOriginalCh13Value
	movlw	high(05Bh)
	subwf	(1+(?_getAdOriginalCh13Value))^080h,w
	movlw	low(05Bh)
	skipnz
	subwf	(0+(?_getAdOriginalCh13Value))^080h,w
	skipc
	goto	u2091
	goto	u2090
u2091:
	goto	l4290
u2090:
	line	590
	
l4288:	
;main.c: 589: {
;main.c: 590: ucTimerP3s++;
	bcf	status, 5	;RP0=0, select bank0
	incf	(main@ucTimerP3s),f
	line	591
;main.c: 591: }
	goto	l4292
	line	593
	
l4290:	
;main.c: 592: else
;main.c: 593: ucTimerP3s = 0;
	bcf	status, 5	;RP0=0, select bank0
	clrf	(main@ucTimerP3s)
	line	595
	
l4292:	
;main.c: 595: if( ucTimerP3s >= 3)
	movlw	(03h)
	subwf	(main@ucTimerP3s),w
	skipc
	goto	u2101
	goto	u2100
u2101:
	goto	l737
u2100:
	line	597
	
l4294:	
;main.c: 596: {
;main.c: 597: ucTimerP3s = 0;
	clrf	(main@ucTimerP3s)
	line	598
	
l4296:	
;main.c: 598: ucStep = START_UP_PWM_STEP;
	clrf	(main@ucStep)
	incf	(main@ucStep),f
	goto	l4272
	line	601
	
l737:	
	line	605
;main.c: 599: }
;main.c: 601: }
;main.c: 605: break;
	goto	l4272
	line	614
	
l4298:	
;main.c: 609: {
;main.c: 614: pwm_start(75,249);
	movlw	(0F9h)
	movwf	(?_pwm_start)
	movlw	(04Bh)
	fcall	_pwm_start
	line	616
;main.c: 616: setPB3(0);
	movlw	(0)
	fcall	_setPB3
	line	617
;main.c: 617: setPB4(1);
	movlw	(01h)
	fcall	_setPB4
	line	618
;main.c: 618: setPB5(0);
	movlw	(0)
	fcall	_setPB5
	line	619
	
l4300:	
;main.c: 619: clearTwentyMinTimer();
	fcall	_clearTwentyMinTimer
	line	620
	
l4302:	
;main.c: 620: startTwelveHourTimer( 240);
	movlw	0F0h
	movwf	(?_startTwelveHourTimer)
	clrf	(?_startTwelveHourTimer+1)
	fcall	_startTwelveHourTimer
	line	621
	
l4304:	
;main.c: 621: ucStep = CHECK_10_HOUR_TIMER_STEP;
	movlw	(02h)
	movwf	(main@ucStep)
	line	622
;main.c: 622: break;
	goto	l4272
	line	633
	
l4306:	
;main.c: 626: {
;main.c: 631: static unsigned char ucTimerP5s = 0;
;main.c: 633: if( isFinishedTwelveHoursTimer () )
	fcall	_isFinishedTwelveHoursTimer
	xorlw	0
	skipnz
	goto	u2111
	goto	u2110
u2111:
	goto	l4310
u2110:
	line	634
	
l4308:	
;main.c: 634: ucStep = READY_FOR_RESET_STEP;
	movlw	(063h)
	movwf	(main@ucStep)
	goto	l4272
	line	637
	
l4310:	
;main.c: 635: else
;main.c: 636: {
;main.c: 637: if( getAdOriginalCh13Value() < 200 )
	fcall	_getAdOriginalCh13Value
	movlw	high(0C8h)
	subwf	(1+(?_getAdOriginalCh13Value))^080h,w
	movlw	low(0C8h)
	skipnz
	subwf	(0+(?_getAdOriginalCh13Value))^080h,w
	skipnc
	goto	u2121
	goto	u2120
u2121:
	goto	l4314
u2120:
	line	638
	
l4312:	
;main.c: 638: ucTimerP5s++;
	bcf	status, 5	;RP0=0, select bank0
	incf	(main@ucTimerP5s),f
	goto	l4316
	line	640
	
l4314:	
;main.c: 639: else
;main.c: 640: ucTimerP5s = 0;
	bcf	status, 5	;RP0=0, select bank0
	clrf	(main@ucTimerP5s)
	line	642
	
l4316:	
;main.c: 642: if( ucTimerP5s >= 2)
	movlw	(02h)
	subwf	(main@ucTimerP5s),w
	skipc
	goto	u2131
	goto	u2130
u2131:
	goto	l737
u2130:
	line	644
	
l4318:	
;main.c: 643: {
;main.c: 644: ucTimerP5s = 0;
	clrf	(main@ucTimerP5s)
	line	645
	
l4320:	
;main.c: 645: ucStep = STARTUP_3_HOUR_TIMER_STEP;
	movlw	(03h)
	movwf	(main@ucStep)
	goto	l4272
	line	654
	
l4322:	
;main.c: 653: {
;main.c: 654: clearTwelveHoursTimer();
	fcall	_clearTwelveHoursTimer
	line	655
	
l4324:	
;main.c: 655: startThreeHoursTimer(180);
	movlw	0B4h
	movwf	(?_startThreeHoursTimer)
	clrf	(?_startThreeHoursTimer+1)
	fcall	_startThreeHoursTimer
	line	656
;main.c: 656: ucStep = CHECK_3_HOUR_TIMER_STEP;
	movlw	(04h)
	movwf	(main@ucStep)
	line	657
;main.c: 657: break;
	goto	l4272
	line	664
	
l4326:	
;main.c: 661: {
;main.c: 662: static unsigned char ucTimerP5s = 0;
;main.c: 664: if( isFinishedThreeHoursTimer() )
	fcall	_isFinishedThreeHoursTimer
	xorlw	0
	skipnz
	goto	u2141
	goto	u2140
u2141:
	goto	l4330
u2140:
	goto	l4308
	line	668
	
l4330:	
;main.c: 666: else
;main.c: 667: {
;main.c: 668: if( getAdOriginalCh13Value() < 75 )
	fcall	_getAdOriginalCh13Value
	movlw	high(04Bh)
	subwf	(1+(?_getAdOriginalCh13Value))^080h,w
	movlw	low(04Bh)
	skipnz
	subwf	(0+(?_getAdOriginalCh13Value))^080h,w
	skipnc
	goto	u2151
	goto	u2150
u2151:
	goto	l4334
u2150:
	line	669
	
l4332:	
;main.c: 669: ucTimerP5s++;
	bcf	status, 5	;RP0=0, select bank0
	incf	(main@cTimerP5s_781),f
	goto	l4336
	line	671
	
l4334:	
;main.c: 670: else
;main.c: 671: ucTimerP5s = 0;
	bcf	status, 5	;RP0=0, select bank0
	clrf	(main@cTimerP5s_781)
	line	673
	
l4336:	
;main.c: 673: if( ucTimerP5s >= 2)
	movlw	(02h)
	subwf	(main@cTimerP5s_781),w
	skipc
	goto	u2161
	goto	u2160
u2161:
	goto	l737
u2160:
	line	675
	
l4338:	
;main.c: 674: {
;main.c: 675: ucTimerP5s = 0;
	clrf	(main@cTimerP5s_781)
	line	676
	
l4340:	
;main.c: 676: ucStep = STARTUP_1_HOUR_TIMER_STEP;
	movlw	(05h)
	movwf	(main@ucStep)
	goto	l4272
	line	684
	
l4342:	
;main.c: 683: {
;main.c: 684: clearThreeHoursTimer();
	fcall	_clearThreeHoursTimer
	line	685
	
l4344:	
;main.c: 685: startOneHoursTimer( 120 );
	movlw	078h
	movwf	(?_startOneHoursTimer)
	clrf	(?_startOneHoursTimer+1)
	fcall	_startOneHoursTimer
	line	686
	
l4346:	
;main.c: 686: setPB3(1);
	movlw	(01h)
	fcall	_setPB3
	line	687
	
l4348:	
;main.c: 687: setPB4(0);
	movlw	(0)
	fcall	_setPB4
	line	688
	
l4350:	
;main.c: 688: setPB5(1);
	movlw	(01h)
	fcall	_setPB5
	line	689
	
l4352:	
;main.c: 689: ucStep = CHECK_1_HOUR_TIMER_STEP;
	movlw	(06h)
	movwf	(main@ucStep)
	line	690
;main.c: 690: break;
	goto	l4272
	line	703
	
l4354:	
;main.c: 694: {
;main.c: 699: static unsigned int uiTimerOneP5s = 0;
;main.c: 700: static unsigned int uiTimerTwoP5s = 0;
;main.c: 701: static unsigned int uiTimerThreeP5s = 0;
;main.c: 703: unsigned int uiCh13Value = getAdOriginalCh13Value();
	fcall	_getAdOriginalCh13Value
	movf	(1+(?_getAdOriginalCh13Value))^080h,w
	movwf	(main@uiCh13Value+1)^080h
	movf	(0+(?_getAdOriginalCh13Value))^080h,w
	movwf	(main@uiCh13Value)^080h
	line	706
	
l4356:	
;main.c: 706: if( isFinishedOneHoursTimer() )
	fcall	_isFinishedOneHoursTimer
	xorlw	0
	skipnz
	goto	u2171
	goto	u2170
u2171:
	goto	l4360
u2170:
	goto	l4308
	line	710
	
l4360:	
;main.c: 708: else
;main.c: 709: {
;main.c: 710: if( uiCh13Value > 85 )
	movlw	high(056h)
	bsf	status, 5	;RP0=1, select bank1
	subwf	(main@uiCh13Value+1)^080h,w
	movlw	low(056h)
	skipnz
	subwf	(main@uiCh13Value)^080h,w
	skipc
	goto	u2181
	goto	u2180
u2181:
	goto	l4370
u2180:
	line	712
	
l4362:	
;main.c: 711: {
;main.c: 712: if( uiTimerOneP5s <= 1 )
	movlw	high(02h)
	subwf	(main@uiTimerOneP5s+1)^080h,w
	movlw	low(02h)
	skipnz
	subwf	(main@uiTimerOneP5s)^080h,w
	skipnc
	goto	u2191
	goto	u2190
u2191:
	goto	l4366
u2190:
	line	713
	
l4364:	
;main.c: 713: uiTimerOneP5s++;
	incf	(main@uiTimerOneP5s)^080h,f
	skipnz
	incf	(main@uiTimerOneP5s+1)^080h,f
	line	714
	
l4366:	
;main.c: 714: uiTimerTwoP5s = 0;
	clrf	(main@uiTimerTwoP5s)^080h
	clrf	(main@uiTimerTwoP5s+1)^080h
	line	715
	
l4368:	
;main.c: 715: uiTimerThreeP5s = 0;
	clrf	(main@uiTimerThreeP5s)^080h
	clrf	(main@uiTimerThreeP5s+1)^080h
	line	716
;main.c: 716: }
	goto	l4372
	line	719
	
l4370:	
;main.c: 717: else
;main.c: 718: {
;main.c: 719: uiTimerOneP5s = 0;
	clrf	(main@uiTimerOneP5s)^080h
	clrf	(main@uiTimerOneP5s+1)^080h
	line	723
	
l4372:	
;main.c: 720: }
;main.c: 723: if(uiTimerOneP5s > 1)
	movlw	high(02h)
	subwf	(main@uiTimerOneP5s+1)^080h,w
	movlw	low(02h)
	skipnz
	subwf	(main@uiTimerOneP5s)^080h,w
	skipc
	goto	u2201
	goto	u2200
u2201:
	goto	l4380
u2200:
	line	725
	
l4374:	
;main.c: 724: {
;main.c: 725: setPB3(0);
	movlw	(0)
	fcall	_setPB3
	line	726
;main.c: 726: setPB4(1);
	movlw	(01h)
	fcall	_setPB4
	line	727
;main.c: 727: setPB5(0);
	movlw	(0)
	fcall	_setPB5
	line	729
	
l4376:	
;main.c: 729: uiTimerOneP5s = 0;
	bsf	status, 5	;RP0=1, select bank1
	clrf	(main@uiTimerOneP5s)^080h
	clrf	(main@uiTimerOneP5s+1)^080h
	line	730
	
l4378:	
;main.c: 730: uiTimerTwoP5s = 0;
	clrf	(main@uiTimerTwoP5s)^080h
	clrf	(main@uiTimerTwoP5s+1)^080h
	line	731
;main.c: 731: }
	goto	l4272
	line	734
	
l4380:	
;main.c: 732: else
;main.c: 733: {
;main.c: 734: if( uiCh13Value < 75 )
	movlw	high(04Bh)
	subwf	(main@uiCh13Value+1)^080h,w
	movlw	low(04Bh)
	skipnz
	subwf	(main@uiCh13Value)^080h,w
	skipnc
	goto	u2211
	goto	u2210
u2211:
	goto	l4386
u2210:
	line	736
	
l4382:	
;main.c: 735: {
;main.c: 736: if( uiTimerTwoP5s <= 1)
	movlw	high(02h)
	subwf	(main@uiTimerTwoP5s+1)^080h,w
	movlw	low(02h)
	skipnz
	subwf	(main@uiTimerTwoP5s)^080h,w
	skipnc
	goto	u2221
	goto	u2220
u2221:
	goto	l4388
u2220:
	line	737
	
l4384:	
;main.c: 737: uiTimerTwoP5s++;
	incf	(main@uiTimerTwoP5s)^080h,f
	skipnz
	incf	(main@uiTimerTwoP5s+1)^080h,f
	goto	l4388
	line	741
	
l4386:	
;main.c: 739: else
;main.c: 740: {
;main.c: 741: uiTimerTwoP5s = 0;
	clrf	(main@uiTimerTwoP5s)^080h
	clrf	(main@uiTimerTwoP5s+1)^080h
	line	742
;main.c: 742: uiTimerThreeP5s = 0;
	clrf	(main@uiTimerThreeP5s)^080h
	clrf	(main@uiTimerThreeP5s+1)^080h
	line	745
	
l4388:	
;main.c: 743: }
;main.c: 745: if(uiTimerTwoP5s > 1)
	movlw	high(02h)
	subwf	(main@uiTimerTwoP5s+1)^080h,w
	movlw	low(02h)
	skipnz
	subwf	(main@uiTimerTwoP5s)^080h,w
	skipc
	goto	u2231
	goto	u2230
u2231:
	goto	l4272
u2230:
	line	747
	
l4390:	
;main.c: 746: {
;main.c: 747: setPB3(1);
	movlw	(01h)
	fcall	_setPB3
	line	748
;main.c: 748: setPB4(0);
	movlw	(0)
	fcall	_setPB4
	line	749
;main.c: 749: setPB5(1);
	movlw	(01h)
	fcall	_setPB5
	line	751
	
l4392:	
;main.c: 751: if(uiCh13Value < 25)
	movlw	high(019h)
	bsf	status, 5	;RP0=1, select bank1
	subwf	(main@uiCh13Value+1)^080h,w
	movlw	low(019h)
	skipnz
	subwf	(main@uiCh13Value)^080h,w
	skipnc
	goto	u2241
	goto	u2240
u2241:
	goto	l4396
u2240:
	line	752
	
l4394:	
;main.c: 752: uiTimerThreeP5s++;
	incf	(main@uiTimerThreeP5s)^080h,f
	skipnz
	incf	(main@uiTimerThreeP5s+1)^080h,f
	goto	l4398
	line	754
	
l4396:	
;main.c: 753: else
;main.c: 754: uiTimerThreeP5s = 0;
	clrf	(main@uiTimerThreeP5s)^080h
	clrf	(main@uiTimerThreeP5s+1)^080h
	line	756
	
l4398:	
;main.c: 756: if(uiTimerThreeP5s > 5)
	movlw	high(06h)
	subwf	(main@uiTimerThreeP5s+1)^080h,w
	movlw	low(06h)
	skipnz
	subwf	(main@uiTimerThreeP5s)^080h,w
	skipc
	goto	u2251
	goto	u2250
u2251:
	goto	l737
u2250:
	line	757
	
l4400:	
;main.c: 757: reset();
	fcall	_reset
	goto	l4272
	line	767
	
l4402:	
;main.c: 766: {
;main.c: 767: setPB3(0);
	movlw	(0)
	fcall	_setPB3
	line	768
;main.c: 768: setPB4(0);
	movlw	(0)
	fcall	_setPB4
	line	769
;main.c: 769: setPB5(1);
	movlw	(01h)
	fcall	_setPB5
	line	772
;main.c: 772: setWaitResetFlag(1);
	movlw	(01h)
	fcall	_setWaitResetFlag
	line	778
	
l4404:	
;main.c: 778: ucStep = DELAY_ONE_SECOND_FOR_PWM;
	movlw	(064h)
	movwf	(main@ucStep)
	line	779
;main.c: 779: break;
	goto	l4272
	line	785
	
l4406:	
;main.c: 783: {
;main.c: 784: static unsigned ucDelay1s = 0;
;main.c: 785: if(ucDelay1s <= 5)
	movlw	high(06h)
	bsf	status, 5	;RP0=1, select bank1
	subwf	(main@ucDelay1s+1)^080h,w
	movlw	low(06h)
	skipnz
	subwf	(main@ucDelay1s)^080h,w
	skipnc
	goto	u2261
	goto	u2260
u2261:
	goto	l4410
u2260:
	line	786
	
l4408:	
;main.c: 786: ucDelay1s++;
	incf	(main@ucDelay1s)^080h,f
	skipnz
	incf	(main@ucDelay1s+1)^080h,f
	goto	l4272
	line	789
	
l4410:	
;main.c: 787: else
;main.c: 788: {
;main.c: 789: ucDelay1s = 0;
	clrf	(main@ucDelay1s)^080h
	clrf	(main@ucDelay1s+1)^080h
	line	790
	
l4412:	
;main.c: 790: ucStep = MEET_RESET_CONDITION_STEP;
	movlw	(065h)
	bcf	status, 5	;RP0=0, select bank0
	movwf	(main@ucStep)
	goto	l4272
	line	802
	
l4414:	
;main.c: 800: {
;main.c: 801: static unsigned char ucTimerP5s = 0;
;main.c: 802: unsigned int ucChValue = getAdOriginalCh13Value();
	fcall	_getAdOriginalCh13Value
	movf	(1+(?_getAdOriginalCh13Value))^080h,w
	movwf	(main@ucChValue+1)^080h
	movf	(0+(?_getAdOriginalCh13Value))^080h,w
	movwf	(main@ucChValue)^080h
	line	804
	
l4416:	
;main.c: 804: if( ucChValue > 50 )
	movlw	high(033h)
	subwf	(main@ucChValue+1)^080h,w
	movlw	low(033h)
	skipnz
	subwf	(main@ucChValue)^080h,w
	skipc
	goto	u2271
	goto	u2270
u2271:
	goto	l4420
u2270:
	line	805
	
l4418:	
;main.c: 805: ucTimerP5s++;
	bcf	status, 5	;RP0=0, select bank0
	incf	(main@cTimerP5s_787),f
	goto	l4422
	line	807
	
l4420:	
;main.c: 806: else
;main.c: 807: ucTimerP5s = 0;
	bcf	status, 5	;RP0=0, select bank0
	clrf	(main@cTimerP5s_787)
	line	809
	
l4422:	
;main.c: 809: if(ucTimerP5s >= 5)
	movlw	(05h)
	subwf	(main@cTimerP5s_787),w
	skipc
	goto	u2281
	goto	u2280
u2281:
	goto	l737
u2280:
	line	810
	
l4424:	
;main.c: 810: ucStep = RESET_STEP;
	movlw	(066h)
	movwf	(main@ucStep)
	goto	l4272
	line	816
	
l4426:	
;main.c: 815: {
;main.c: 816: ucStep = INIT_STEP;
	clrf	(main@ucStep)
	goto	l4400
	line	570
	
l4432:	
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
	goto	l4280
	xorlw	1^0	; case 1
	skipnz
	goto	l4298
	xorlw	2^1	; case 2
	skipnz
	goto	l4306
	xorlw	3^2	; case 3
	skipnz
	goto	l4322
	xorlw	4^3	; case 4
	skipnz
	goto	l4326
	xorlw	5^4	; case 5
	skipnz
	goto	l4342
	xorlw	6^5	; case 6
	skipnz
	goto	l4354
	xorlw	99^6	; case 99
	skipnz
	goto	l4402
	xorlw	100^99	; case 100
	skipnz
	goto	l4406
	xorlw	101^100	; case 101
	skipnz
	goto	l4414
	xorlw	102^101	; case 102
	skipnz
	goto	l4426
	goto	l737
	opt asmopt_on

	global	start
	ljmp	start
	opt stack 0
psect	maintext
	line	829
GLOBAL	__end_of_main
	__end_of_main:
;; =============== function _main ends ============

	signat	_main,90
	global	_getAdOriginalCh13Value
psect	text1214,local,class=CODE,delta=2
global __ptext1214
__ptext1214:

;; *************** function _getAdOriginalCh13Value *****************
;; Defined at:
;;		line 362 in file "D:\develop\AK7030-good\AK7030-OTP\common.c"
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
psect	text1214
	file	"D:\develop\AK7030-good\AK7030-OTP\common.c"
	line	362
	global	__size_of_getAdOriginalCh13Value
	__size_of_getAdOriginalCh13Value	equ	__end_of_getAdOriginalCh13Value-_getAdOriginalCh13Value
	
_getAdOriginalCh13Value:	
	opt	stack 3
; Regs used in _getAdOriginalCh13Value: [wreg-fsr0h+status,2+status,0+btemp+1+pclath+cstack]
	line	364
	
l4256:	
;common.c: 364: return FilterCh13(uiSampleCh13);
	movlw	(_uiSampleCh13)&0ffh
	fcall	_FilterCh13
	movf	(1+(?_FilterCh13)),w
	bsf	status, 5	;RP0=1, select bank1
	movwf	(?_getAdOriginalCh13Value+1)^080h
	bcf	status, 5	;RP0=0, select bank0
	movf	(0+(?_FilterCh13)),w
	bsf	status, 5	;RP0=1, select bank1
	movwf	(?_getAdOriginalCh13Value)^080h
	line	369
	
l1579:	
	return
	opt stack 0
GLOBAL	__end_of_getAdOriginalCh13Value
	__end_of_getAdOriginalCh13Value:
;; =============== function _getAdOriginalCh13Value ends ============

	signat	_getAdOriginalCh13Value,90
	global	_process_AD_Converter_Value
psect	text1215,local,class=CODE,delta=2
global __ptext1215
__ptext1215:

;; *************** function _process_AD_Converter_Value *****************
;; Defined at:
;;		line 384 in file "D:\develop\AK7030-good\AK7030-OTP\common.c"
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
psect	text1215
	file	"D:\develop\AK7030-good\AK7030-OTP\common.c"
	line	384
	global	__size_of_process_AD_Converter_Value
	__size_of_process_AD_Converter_Value	equ	__end_of_process_AD_Converter_Value-_process_AD_Converter_Value
	
_process_AD_Converter_Value:	
	opt	stack 3
; Regs used in _process_AD_Converter_Value: [wreg+status,2+status,0+pclath+cstack]
	line	385
	
l4244:	
;common.c: 385: if(getAD_ConvertFlag())
	fcall	_getAD_ConvertFlag
	xorlw	0
	skipnz
	goto	u2051
	goto	u2050
u2051:
	goto	l1588
u2050:
	line	387
	
l4246:	
;common.c: 386: {
;common.c: 387: setAD_ConvertFlag(0);
	movlw	(0)
	fcall	_setAD_ConvertFlag
	line	388
;common.c: 388: AD_Sample();
	fcall	_AD_Sample
	line	389
	
l4248:	
;common.c: 389: if(12 == sampleChannelSelect)
	movf	(_sampleChannelSelect),w
	xorlw	0Ch
	skipz
	goto	u2061
	goto	u2060
u2061:
	goto	l4252
u2060:
	line	390
	
l4250:	
;common.c: 390: adc_test_init(12,3);
	movlw	(03h)
	movwf	(?_adc_test_init)
	movlw	(0Ch)
	fcall	_adc_test_init
	goto	l4254
	line	392
	
l4252:	
;common.c: 391: else
;common.c: 392: adc_test_init(13,3);
	movlw	(03h)
	movwf	(?_adc_test_init)
	movlw	(0Dh)
	fcall	_adc_test_init
	line	393
	
l4254:	
;common.c: 393: adc_start();
	fcall	_adc_start
	line	395
	
l1588:	
	return
	opt stack 0
GLOBAL	__end_of_process_AD_Converter_Value
	__end_of_process_AD_Converter_Value:
;; =============== function _process_AD_Converter_Value ends ============

	signat	_process_AD_Converter_Value,88
	global	_setPinInitVaule
psect	text1216,local,class=CODE,delta=2
global __ptext1216
__ptext1216:

;; *************** function _setPinInitVaule *****************
;; Defined at:
;;		line 272 in file "D:\develop\AK7030-good\AK7030-OTP\main.c"
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
psect	text1216
	file	"D:\develop\AK7030-good\AK7030-OTP\main.c"
	line	272
	global	__size_of_setPinInitVaule
	__size_of_setPinInitVaule	equ	__end_of_setPinInitVaule-_setPinInitVaule
	
_setPinInitVaule:	
	opt	stack 3
; Regs used in _setPinInitVaule: [wreg+status,2+status,0+pclath+cstack]
	line	274
	
l4242:	
;main.c: 274: setPB3(1);
	movlw	(01h)
	fcall	_setPB3
	line	275
;main.c: 275: setPB4(0);
	movlw	(0)
	fcall	_setPB4
	line	276
;main.c: 276: setPB5(1);
	movlw	(01h)
	fcall	_setPB5
	line	280
	
l716:	
	return
	opt stack 0
GLOBAL	__end_of_setPinInitVaule
	__end_of_setPinInitVaule:
;; =============== function _setPinInitVaule ends ============

	signat	_setPinInitVaule,88
	global	_initPin
psect	text1217,local,class=CODE,delta=2
global __ptext1217
__ptext1217:

;; *************** function _initPin *****************
;; Defined at:
;;		line 256 in file "D:\develop\AK7030-good\AK7030-OTP\main.c"
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
psect	text1217
	file	"D:\develop\AK7030-good\AK7030-OTP\main.c"
	line	256
	global	__size_of_initPin
	__size_of_initPin	equ	__end_of_initPin-_initPin
	
_initPin:	
	opt	stack 3
; Regs used in _initPin: [wreg+status,2+status,0+pclath+cstack]
	line	258
	
l4234:	
;main.c: 258: initPB2_AsHighResistence();
	fcall	_initPB2_AsHighResistence
	line	260
	
l4236:	
;main.c: 260: initPB3(0);
	movlw	(0)
	fcall	_initPB3
	line	262
	
l4238:	
;main.c: 262: initPB4(0);
	movlw	(0)
	fcall	_initPB4
	line	264
	
l4240:	
;main.c: 264: initPB5(0);
	movlw	(0)
	fcall	_initPB5
	line	269
	
l713:	
	return
	opt stack 0
GLOBAL	__end_of_initPin
	__end_of_initPin:
;; =============== function _initPin ends ============

	signat	_initPin,88
	global	_AD_Sample
psect	text1218,local,class=CODE,delta=2
global __ptext1218
__ptext1218:

;; *************** function _AD_Sample *****************
;; Defined at:
;;		line 407 in file "D:\develop\AK7030-good\AK7030-OTP\common.c"
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
psect	text1218
	file	"D:\develop\AK7030-good\AK7030-OTP\common.c"
	line	407
	global	__size_of_AD_Sample
	__size_of_AD_Sample	equ	__end_of_AD_Sample-_AD_Sample
	
_AD_Sample:	
	opt	stack 3
; Regs used in _AD_Sample: [wreg+status,2+status,0]
	line	408
	
l4220:	
;common.c: 408: if(sampleTimes < 3)
	movlw	(03h)
	subwf	(_sampleTimes),w
	skipnc
	goto	u2021
	goto	u2020
u2021:
	goto	l1595
u2020:
	line	410
	
l4222:	
;common.c: 409: {
;common.c: 410: sampleTimes++;
	incf	(_sampleTimes),f
	line	412
	
l4224:	
;common.c: 412: if(sampleTimes >= 3)
	movlw	(03h)
	subwf	(_sampleTimes),w
	skipc
	goto	u2031
	goto	u2030
u2031:
	goto	l1595
u2030:
	line	414
	
l4226:	
;common.c: 413: {
;common.c: 414: sampleTimes = 0;
	clrf	(_sampleTimes)
	line	416
	
l4228:	
;common.c: 416: if(sampleChannelSelect == 12)
	movf	(_sampleChannelSelect),w
	xorlw	0Ch
	skipz
	goto	u2041
	goto	u2040
u2041:
	goto	l4232
u2040:
	line	418
	
l4230:	
;common.c: 417: {
;common.c: 418: sampleChannelSelect = 13;
	movlw	(0Dh)
	movwf	(_sampleChannelSelect)
	line	419
;common.c: 419: }
	goto	l1595
	line	423
	
l4232:	
;common.c: 421: else
;common.c: 422: {
;common.c: 423: sampleChannelSelect = 12;
	movlw	(0Ch)
	movwf	(_sampleChannelSelect)
	line	427
	
l1595:	
	return
	opt stack 0
GLOBAL	__end_of_AD_Sample
	__end_of_AD_Sample:
;; =============== function _AD_Sample ends ============

	signat	_AD_Sample,88
	global	_setAD_ConvertFlag
psect	text1219,local,class=CODE,delta=2
global __ptext1219
__ptext1219:

;; *************** function _setAD_ConvertFlag *****************
;; Defined at:
;;		line 339 in file "D:\develop\AK7030-good\AK7030-OTP\common.c"
;; Parameters:    Size  Location     Type
;;  flag            1    wreg     unsigned char 
;; Auto vars:     Size  Location     Type
;;  flag            1   21[BANK0 ] unsigned char 
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
psect	text1219
	file	"D:\develop\AK7030-good\AK7030-OTP\common.c"
	line	339
	global	__size_of_setAD_ConvertFlag
	__size_of_setAD_ConvertFlag	equ	__end_of_setAD_ConvertFlag-_setAD_ConvertFlag
	
_setAD_ConvertFlag:	
	opt	stack 3
; Regs used in _setAD_ConvertFlag: [wreg]
;setAD_ConvertFlag@flag stored from wreg
	movwf	(setAD_ConvertFlag@flag)
	line	340
	
l4218:	
;common.c: 340: adc_convert_flag = flag;
	movf	(setAD_ConvertFlag@flag),w
	movwf	(_adc_convert_flag)
	line	341
	
l1573:	
	return
	opt stack 0
GLOBAL	__end_of_setAD_ConvertFlag
	__end_of_setAD_ConvertFlag:
;; =============== function _setAD_ConvertFlag ends ============

	signat	_setAD_ConvertFlag,4216
	global	_getAD_ConvertFlag
psect	text1220,local,class=CODE,delta=2
global __ptext1220
__ptext1220:

;; *************** function _getAD_ConvertFlag *****************
;; Defined at:
;;		line 333 in file "D:\develop\AK7030-good\AK7030-OTP\common.c"
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
psect	text1220
	file	"D:\develop\AK7030-good\AK7030-OTP\common.c"
	line	333
	global	__size_of_getAD_ConvertFlag
	__size_of_getAD_ConvertFlag	equ	__end_of_getAD_ConvertFlag-_getAD_ConvertFlag
	
_getAD_ConvertFlag:	
	opt	stack 3
; Regs used in _getAD_ConvertFlag: [wreg]
	line	334
	
l4214:	
;common.c: 334: return adc_convert_flag;
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	movf	(_adc_convert_flag),w
	line	335
	
l1570:	
	return
	opt stack 0
GLOBAL	__end_of_getAD_ConvertFlag
	__end_of_getAD_ConvertFlag:
;; =============== function _getAD_ConvertFlag ends ============

	signat	_getAD_ConvertFlag,89
	global	_FilterCh13
psect	text1221,local,class=CODE,delta=2
global __ptext1221
__ptext1221:

;; *************** function _FilterCh13 *****************
;; Defined at:
;;		line 75 in file "D:\develop\AK7030-good\AK7030-OTP\common.c"
;; Parameters:    Size  Location     Type
;;  tmpValue        1    wreg     PTR int 
;;		 -> uiSampleCh13(16), 
;; Auto vars:     Size  Location     Type
;;  tmpValue        1    0[BANK1 ] PTR int 
;;		 -> uiSampleCh13(16), 
;;  cir             2   11[BANK1 ] int 
;;  filter_buf      6    5[BANK1 ] unsigned int [3]
;;  filter_sum      2    3[BANK1 ] unsigned int 
;;  filter_temp     2    1[BANK1 ] unsigned int 
;;  i               1   14[BANK1 ] unsigned char 
;;  j               1   13[BANK1 ] unsigned char 
;; Return value:  Size  Location     Type
;;                  2   21[BANK0 ] unsigned int 
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
psect	text1221
	file	"D:\develop\AK7030-good\AK7030-OTP\common.c"
	line	75
	global	__size_of_FilterCh13
	__size_of_FilterCh13	equ	__end_of_FilterCh13-_FilterCh13
	
_FilterCh13:	
	opt	stack 3
; Regs used in _FilterCh13: [wreg-fsr0h+status,2+status,0+btemp+1]
;FilterCh13@tmpValue stored from wreg
	bsf	status, 5	;RP0=1, select bank1
	movwf	(FilterCh13@tmpValue)^080h
	line	76
	
l4164:	
	clrf	(FilterCh13@j)^080h
	line	78
;common.c: 78: unsigned int filter_temp = 0, filter_sum = 0;
	clrf	(FilterCh13@filter_temp)^080h
	clrf	(FilterCh13@filter_temp+1)^080h
	clrf	(FilterCh13@filter_sum)^080h
	clrf	(FilterCh13@filter_sum+1)^080h
	line	82
;common.c: 80: unsigned int filter_buf[3];
;common.c: 82: for(int cir = 0;cir < 3; cir++)
	clrf	(FilterCh13@cir)^080h
	clrf	(FilterCh13@cir+1)^080h
	line	83
	
l4170:	
;common.c: 83: filter_buf[cir] = *tmpValue++;
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
	
l4172:	
	bsf	status, 5	;RP0=1, select bank1
	incf	(FilterCh13@tmpValue)^080h,f
	incf	(FilterCh13@tmpValue)^080h,f
	line	82
	
l4174:	
	incf	(FilterCh13@cir)^080h,f
	skipnz
	incf	(FilterCh13@cir+1)^080h,f
	
l4176:	
	movf	(FilterCh13@cir+1)^080h,w
	xorlw	80h
	movwf	btemp+1
	movlw	(high(03h))^80h
	subwf	btemp+1,w
	skipz
	goto	u1975
	movlw	low(03h)
	subwf	(FilterCh13@cir)^080h,w
u1975:

	skipc
	goto	u1971
	goto	u1970
u1971:
	goto	l4170
u1970:
	line	87
	
l4178:	
;common.c: 87: for(j = 0; j < 3 - 1; j++)
	bsf	status, 5	;RP0=1, select bank1
	bcf	status, 6	;RP1=0, select bank1
	clrf	(FilterCh13@j)^080h
	line	89
	
l4184:	
;common.c: 88: {
;common.c: 89: for(i = 0; i < 3 - 1 - j; i++)
	clrf	(FilterCh13@i)^080h
	goto	l4192
	line	91
	
l4186:	
;common.c: 90: {
;common.c: 91: if(filter_buf[i] > filter_buf[i + 1])
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
	goto	u1985
	movf	0+(??_FilterCh13+0)+0,w
	subwf	0+(??_FilterCh13+2)+0,w
u1985:
	skipnc
	goto	u1981
	goto	u1980
u1981:
	goto	l4190
u1980:
	line	94
	
l4188:	
;common.c: 92: {
;common.c: 94: filter_temp = filter_buf[i];
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
	line	96
;common.c: 96: filter_buf[i] = filter_buf[i + 1];
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
	line	98
;common.c: 98: filter_buf[i + 1] = filter_temp;
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
	line	89
	
l4190:	
	bsf	status, 5	;RP0=1, select bank1
	incf	(FilterCh13@i)^080h,f
	
l4192:	
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
	goto	u1995
	movf	0+(??_FilterCh13+0)+0,w
	bsf	status, 5	;RP0=1, select bank1
	subwf	(FilterCh13@i)^080h,w
u1995:

	skipc
	goto	u1991
	goto	u1990
u1991:
	goto	l4186
u1990:
	line	87
	
l4194:	
	bsf	status, 5	;RP0=1, select bank1
	bcf	status, 6	;RP1=0, select bank1
	incf	(FilterCh13@j)^080h,f
	
l4196:	
	movlw	(02h)
	subwf	(FilterCh13@j)^080h,w
	skipc
	goto	u2001
	goto	u2000
u2001:
	goto	l4184
u2000:
	line	103
	
l4198:	
	goto	l4208
	line	105
	
l4202:	
;common.c: 104: {
;common.c: 105: filter_sum += filter_buf[i];
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
	line	103
	
l4204:	
	incf	(FilterCh13@i)^080h,f
	
l4206:	
	movf	(FilterCh13@i)^080h,w
	skipz
	goto	u2010
	goto	l4202
u2010:
	line	109
	
l4208:	
;common.c: 106: }
;common.c: 109: return (filter_sum >> 2 );
	movf	(FilterCh13@filter_sum+1)^080h,w
	bcf	status, 5	;RP0=0, select bank0
	movwf	(?_FilterCh13+1)
	bsf	status, 5	;RP0=1, select bank1
	movf	(FilterCh13@filter_sum)^080h,w
	bcf	status, 5	;RP0=0, select bank0
	movwf	(?_FilterCh13)
	
l4210:	
	clrc
	rrf	(?_FilterCh13+1),f
	rrf	(?_FilterCh13),f
	clrc
	rrf	(?_FilterCh13+1),f
	rrf	(?_FilterCh13),f
	line	110
	
l1495:	
	return
	opt stack 0
GLOBAL	__end_of_FilterCh13
	__end_of_FilterCh13:
;; =============== function _FilterCh13 ends ============

	signat	_FilterCh13,4218
	global	_setWaitResetFlag
psect	text1222,local,class=CODE,delta=2
global __ptext1222
__ptext1222:

;; *************** function _setWaitResetFlag *****************
;; Defined at:
;;		line 55 in file "D:\develop\AK7030-good\AK7030-OTP\common.c"
;; Parameters:    Size  Location     Type
;;  bValue          1    wreg     unsigned char 
;; Auto vars:     Size  Location     Type
;;  bValue          1   21[BANK0 ] unsigned char 
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
;;		_main
;; This function uses a non-reentrant model
;;
psect	text1222
	file	"D:\develop\AK7030-good\AK7030-OTP\common.c"
	line	55
	global	__size_of_setWaitResetFlag
	__size_of_setWaitResetFlag	equ	__end_of_setWaitResetFlag-_setWaitResetFlag
	
_setWaitResetFlag:	
	opt	stack 4
; Regs used in _setWaitResetFlag: [wreg]
;setWaitResetFlag@bValue stored from wreg
	movwf	(setWaitResetFlag@bValue)
	line	56
	
l4162:	
;common.c: 56: bWaitResetFlag = bValue;
	movf	(setWaitResetFlag@bValue),w
	movwf	(_bWaitResetFlag)
	line	57
	
l1473:	
	return
	opt stack 0
GLOBAL	__end_of_setWaitResetFlag
	__end_of_setWaitResetFlag:
;; =============== function _setWaitResetFlag ends ============

	signat	_setWaitResetFlag,4216
	global	_isFinishedOneHoursTimer
psect	text1223,local,class=CODE,delta=2
global __ptext1223
__ptext1223:

;; *************** function _isFinishedOneHoursTimer *****************
;; Defined at:
;;		line 573 in file "D:\develop\AK7030-good\AK7030-OTP\common.c"
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
psect	text1223
	file	"D:\develop\AK7030-good\AK7030-OTP\common.c"
	line	573
	global	__size_of_isFinishedOneHoursTimer
	__size_of_isFinishedOneHoursTimer	equ	__end_of_isFinishedOneHoursTimer-_isFinishedOneHoursTimer
	
_isFinishedOneHoursTimer:	
	opt	stack 4
; Regs used in _isFinishedOneHoursTimer: [wreg+status,2+status,0]
	line	574
	
l4146:	
;common.c: 574: if((uiOneHourTimer == 0) && bOneHourTimerStartFlag)
	bcf	status, 5	;RP0=0, select bank0
	movf	((_uiOneHourTimer+1)),w
	iorwf	((_uiOneHourTimer)),w
	skipz
	goto	u1951
	goto	u1950
u1951:
	goto	l4158
u1950:
	
l4148:	
	movf	(_bOneHourTimerStartFlag),w
	skipz
	goto	u1960
	goto	l4158
u1960:
	line	576
	
l4150:	
;common.c: 575: {
;common.c: 576: bOneHourTimerStartFlag = 0;
	clrf	(_bOneHourTimerStartFlag)
	line	577
	
l4152:	
;common.c: 577: return 1;
	movlw	(01h)
	goto	l1645
	line	580
	
l4158:	
;common.c: 579: else
;common.c: 580: return 0;
	movlw	(0)
	line	581
	
l1645:	
	return
	opt stack 0
GLOBAL	__end_of_isFinishedOneHoursTimer
	__end_of_isFinishedOneHoursTimer:
;; =============== function _isFinishedOneHoursTimer ends ============

	signat	_isFinishedOneHoursTimer,89
	global	_startOneHoursTimer
psect	text1224,local,class=CODE,delta=2
global __ptext1224
__ptext1224:

;; *************** function _startOneHoursTimer *****************
;; Defined at:
;;		line 490 in file "D:\develop\AK7030-good\AK7030-OTP\common.c"
;; Parameters:    Size  Location     Type
;;  uiSetTime       2   21[BANK0 ] unsigned int 
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
psect	text1224
	file	"D:\develop\AK7030-good\AK7030-OTP\common.c"
	line	490
	global	__size_of_startOneHoursTimer
	__size_of_startOneHoursTimer	equ	__end_of_startOneHoursTimer-_startOneHoursTimer
	
_startOneHoursTimer:	
	opt	stack 4
; Regs used in _startOneHoursTimer: [wreg+status,2+status,0]
	line	491
	
l4138:	
;common.c: 491: if(( 0 == uiOneHourTimer ) && ( 0 == bOneHourTimerStartFlag ))
	movf	((_uiOneHourTimer+1)),w
	iorwf	((_uiOneHourTimer)),w
	skipz
	goto	u1931
	goto	u1930
u1931:
	goto	l1622
u1930:
	
l4140:	
	movf	(_bOneHourTimerStartFlag),f
	skipz
	goto	u1941
	goto	u1940
u1941:
	goto	l1622
u1940:
	line	493
	
l4142:	
;common.c: 492: {
;common.c: 493: uiOneHourTimer = uiSetTime;
	movf	(startOneHoursTimer@uiSetTime+1),w
	movwf	(_uiOneHourTimer+1)
	movf	(startOneHoursTimer@uiSetTime),w
	movwf	(_uiOneHourTimer)
	line	494
	
l4144:	
;common.c: 494: bOneHourTimerStartFlag = 1;
	clrf	(_bOneHourTimerStartFlag)
	incf	(_bOneHourTimerStartFlag),f
	line	500
	
l1622:	
	return
	opt stack 0
GLOBAL	__end_of_startOneHoursTimer
	__end_of_startOneHoursTimer:
;; =============== function _startOneHoursTimer ends ============

	signat	_startOneHoursTimer,4216
	global	_clearThreeHoursTimer
psect	text1225,local,class=CODE,delta=2
global __ptext1225
__ptext1225:

;; *************** function _clearThreeHoursTimer *****************
;; Defined at:
;;		line 457 in file "D:\develop\AK7030-good\AK7030-OTP\common.c"
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
psect	text1225
	file	"D:\develop\AK7030-good\AK7030-OTP\common.c"
	line	457
	global	__size_of_clearThreeHoursTimer
	__size_of_clearThreeHoursTimer	equ	__end_of_clearThreeHoursTimer-_clearThreeHoursTimer
	
_clearThreeHoursTimer:	
	opt	stack 4
; Regs used in _clearThreeHoursTimer: [status,2]
	line	458
	
l4136:	
;common.c: 458: uiSmallTimer = 0;
	clrf	(_uiSmallTimer)
	clrf	(_uiSmallTimer+1)
	line	459
;common.c: 459: bSmallTimerStartFlag = 0;
	clrf	(_bSmallTimerStartFlag)
	line	460
	
l1608:	
	return
	opt stack 0
GLOBAL	__end_of_clearThreeHoursTimer
	__end_of_clearThreeHoursTimer:
;; =============== function _clearThreeHoursTimer ends ============

	signat	_clearThreeHoursTimer,88
	global	_isFinishedThreeHoursTimer
psect	text1226,local,class=CODE,delta=2
global __ptext1226
__ptext1226:

;; *************** function _isFinishedThreeHoursTimer *****************
;; Defined at:
;;		line 560 in file "D:\develop\AK7030-good\AK7030-OTP\common.c"
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
psect	text1226
	file	"D:\develop\AK7030-good\AK7030-OTP\common.c"
	line	560
	global	__size_of_isFinishedThreeHoursTimer
	__size_of_isFinishedThreeHoursTimer	equ	__end_of_isFinishedThreeHoursTimer-_isFinishedThreeHoursTimer
	
_isFinishedThreeHoursTimer:	
	opt	stack 4
; Regs used in _isFinishedThreeHoursTimer: [wreg+status,2+status,0]
	line	561
	
l4120:	
;common.c: 561: if((uiSmallTimer == 0) && bSmallTimerStartFlag)
	movf	((_uiSmallTimer+1)),w
	iorwf	((_uiSmallTimer)),w
	skipz
	goto	u1911
	goto	u1910
u1911:
	goto	l4132
u1910:
	
l4122:	
	movf	(_bSmallTimerStartFlag),w
	skipz
	goto	u1920
	goto	l4132
u1920:
	line	563
	
l4124:	
;common.c: 562: {
;common.c: 563: bSmallTimerStartFlag = 0;
	clrf	(_bSmallTimerStartFlag)
	line	564
	
l4126:	
;common.c: 564: return 1;
	movlw	(01h)
	goto	l1640
	line	567
	
l4132:	
;common.c: 566: else
;common.c: 567: return 0;
	movlw	(0)
	line	568
	
l1640:	
	return
	opt stack 0
GLOBAL	__end_of_isFinishedThreeHoursTimer
	__end_of_isFinishedThreeHoursTimer:
;; =============== function _isFinishedThreeHoursTimer ends ============

	signat	_isFinishedThreeHoursTimer,89
	global	_startThreeHoursTimer
psect	text1227,local,class=CODE,delta=2
global __ptext1227
__ptext1227:

;; *************** function _startThreeHoursTimer *****************
;; Defined at:
;;		line 477 in file "D:\develop\AK7030-good\AK7030-OTP\common.c"
;; Parameters:    Size  Location     Type
;;  uiSetTime       2   21[BANK0 ] unsigned int 
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
psect	text1227
	file	"D:\develop\AK7030-good\AK7030-OTP\common.c"
	line	477
	global	__size_of_startThreeHoursTimer
	__size_of_startThreeHoursTimer	equ	__end_of_startThreeHoursTimer-_startThreeHoursTimer
	
_startThreeHoursTimer:	
	opt	stack 4
; Regs used in _startThreeHoursTimer: [wreg+status,2+status,0]
	line	478
	
l4112:	
;common.c: 478: if(( 0 == uiSmallTimer ) && ( 0 == bSmallTimerStartFlag ))
	movf	((_uiSmallTimer+1)),w
	iorwf	((_uiSmallTimer)),w
	skipz
	goto	u1891
	goto	u1890
u1891:
	goto	l1618
u1890:
	
l4114:	
	movf	(_bSmallTimerStartFlag),f
	skipz
	goto	u1901
	goto	u1900
u1901:
	goto	l1618
u1900:
	line	480
	
l4116:	
;common.c: 479: {
;common.c: 480: uiSmallTimer = uiSetTime;
	movf	(startThreeHoursTimer@uiSetTime+1),w
	movwf	(_uiSmallTimer+1)
	movf	(startThreeHoursTimer@uiSetTime),w
	movwf	(_uiSmallTimer)
	line	481
	
l4118:	
;common.c: 481: bSmallTimerStartFlag = 1;
	clrf	(_bSmallTimerStartFlag)
	incf	(_bSmallTimerStartFlag),f
	line	487
	
l1618:	
	return
	opt stack 0
GLOBAL	__end_of_startThreeHoursTimer
	__end_of_startThreeHoursTimer:
;; =============== function _startThreeHoursTimer ends ============

	signat	_startThreeHoursTimer,4216
	global	_clearTwelveHoursTimer
psect	text1228,local,class=CODE,delta=2
global __ptext1228
__ptext1228:

;; *************** function _clearTwelveHoursTimer *****************
;; Defined at:
;;		line 450 in file "D:\develop\AK7030-good\AK7030-OTP\common.c"
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
psect	text1228
	file	"D:\develop\AK7030-good\AK7030-OTP\common.c"
	line	450
	global	__size_of_clearTwelveHoursTimer
	__size_of_clearTwelveHoursTimer	equ	__end_of_clearTwelveHoursTimer-_clearTwelveHoursTimer
	
_clearTwelveHoursTimer:	
	opt	stack 4
; Regs used in _clearTwelveHoursTimer: [status,2]
	line	451
	
l4110:	
;common.c: 451: uiBigTimer = 0;
	clrf	(_uiBigTimer)
	clrf	(_uiBigTimer+1)
	line	452
;common.c: 452: bBigTimerStartFlag = 0;
	clrf	(_bBigTimerStartFlag)
	line	453
	
l1605:	
	return
	opt stack 0
GLOBAL	__end_of_clearTwelveHoursTimer
	__end_of_clearTwelveHoursTimer:
;; =============== function _clearTwelveHoursTimer ends ============

	signat	_clearTwelveHoursTimer,88
	global	_isFinishedTwelveHoursTimer
psect	text1229,local,class=CODE,delta=2
global __ptext1229
__ptext1229:

;; *************** function _isFinishedTwelveHoursTimer *****************
;; Defined at:
;;		line 549 in file "D:\develop\AK7030-good\AK7030-OTP\common.c"
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
psect	text1229
	file	"D:\develop\AK7030-good\AK7030-OTP\common.c"
	line	549
	global	__size_of_isFinishedTwelveHoursTimer
	__size_of_isFinishedTwelveHoursTimer	equ	__end_of_isFinishedTwelveHoursTimer-_isFinishedTwelveHoursTimer
	
_isFinishedTwelveHoursTimer:	
	opt	stack 4
; Regs used in _isFinishedTwelveHoursTimer: [wreg+status,2+status,0]
	line	550
	
l4094:	
;common.c: 550: if(( uiBigTimer == 0 ) && bBigTimerStartFlag )
	movf	((_uiBigTimer+1)),w
	iorwf	((_uiBigTimer)),w
	skipz
	goto	u1871
	goto	u1870
u1871:
	goto	l4106
u1870:
	
l4096:	
	movf	(_bBigTimerStartFlag),w
	skipz
	goto	u1880
	goto	l4106
u1880:
	line	552
	
l4098:	
;common.c: 551: {
;common.c: 552: bBigTimerStartFlag = 0;
	clrf	(_bBigTimerStartFlag)
	line	553
	
l4100:	
;common.c: 553: return 1;
	movlw	(01h)
	goto	l1635
	line	556
	
l4106:	
;common.c: 555: else
;common.c: 556: return 0;
	movlw	(0)
	line	557
	
l1635:	
	return
	opt stack 0
GLOBAL	__end_of_isFinishedTwelveHoursTimer
	__end_of_isFinishedTwelveHoursTimer:
;; =============== function _isFinishedTwelveHoursTimer ends ============

	signat	_isFinishedTwelveHoursTimer,89
	global	_startTwelveHourTimer
psect	text1230,local,class=CODE,delta=2
global __ptext1230
__ptext1230:

;; *************** function _startTwelveHourTimer *****************
;; Defined at:
;;		line 436 in file "D:\develop\AK7030-good\AK7030-OTP\common.c"
;; Parameters:    Size  Location     Type
;;  uiSetTime       2   21[BANK0 ] unsigned int 
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
psect	text1230
	file	"D:\develop\AK7030-good\AK7030-OTP\common.c"
	line	436
	global	__size_of_startTwelveHourTimer
	__size_of_startTwelveHourTimer	equ	__end_of_startTwelveHourTimer-_startTwelveHourTimer
	
_startTwelveHourTimer:	
	opt	stack 4
; Regs used in _startTwelveHourTimer: [wreg+status,2+status,0]
	line	437
	
l4086:	
;common.c: 437: if((0 == uiBigTimer) && ( 0 == bBigTimerStartFlag))
	movf	((_uiBigTimer+1)),w
	iorwf	((_uiBigTimer)),w
	skipz
	goto	u1851
	goto	u1850
u1851:
	goto	l1602
u1850:
	
l4088:	
	movf	(_bBigTimerStartFlag),f
	skipz
	goto	u1861
	goto	u1860
u1861:
	goto	l1602
u1860:
	line	439
	
l4090:	
;common.c: 438: {
;common.c: 439: uiBigTimer = uiSetTime;
	movf	(startTwelveHourTimer@uiSetTime+1),w
	movwf	(_uiBigTimer+1)
	movf	(startTwelveHourTimer@uiSetTime),w
	movwf	(_uiBigTimer)
	line	440
	
l4092:	
;common.c: 440: bBigTimerStartFlag = 1;
	clrf	(_bBigTimerStartFlag)
	incf	(_bBigTimerStartFlag),f
	line	447
	
l1602:	
	return
	opt stack 0
GLOBAL	__end_of_startTwelveHourTimer
	__end_of_startTwelveHourTimer:
;; =============== function _startTwelveHourTimer ends ============

	signat	_startTwelveHourTimer,4216
	global	_clearTwentyMinTimer
psect	text1231,local,class=CODE,delta=2
global __ptext1231
__ptext1231:

;; *************** function _clearTwentyMinTimer *****************
;; Defined at:
;;		line 470 in file "D:\develop\AK7030-good\AK7030-OTP\common.c"
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
psect	text1231
	file	"D:\develop\AK7030-good\AK7030-OTP\common.c"
	line	470
	global	__size_of_clearTwentyMinTimer
	__size_of_clearTwentyMinTimer	equ	__end_of_clearTwentyMinTimer-_clearTwentyMinTimer
	
_clearTwentyMinTimer:	
	opt	stack 4
; Regs used in _clearTwentyMinTimer: [status,2]
	line	471
	
l4084:	
;common.c: 471: uiTwentyMinTimer = 0;
	clrf	(_uiTwentyMinTimer)
	clrf	(_uiTwentyMinTimer+1)
	line	472
;common.c: 472: bTwentyMinStartFlag = 0;
	clrf	(_bTwentyMinStartFlag)
	line	473
	
l1614:	
	return
	opt stack 0
GLOBAL	__end_of_clearTwentyMinTimer
	__end_of_clearTwentyMinTimer:
;; =============== function _clearTwentyMinTimer ends ============

	signat	_clearTwentyMinTimer,88
	global	_isFinishedTwentyMinTimer
psect	text1232,local,class=CODE,delta=2
global __ptext1232
__ptext1232:

;; *************** function _isFinishedTwentyMinTimer *****************
;; Defined at:
;;		line 525 in file "D:\develop\AK7030-good\AK7030-OTP\common.c"
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
psect	text1232
	file	"D:\develop\AK7030-good\AK7030-OTP\common.c"
	line	525
	global	__size_of_isFinishedTwentyMinTimer
	__size_of_isFinishedTwentyMinTimer	equ	__end_of_isFinishedTwentyMinTimer-_isFinishedTwentyMinTimer
	
_isFinishedTwentyMinTimer:	
	opt	stack 4
; Regs used in _isFinishedTwentyMinTimer: [wreg+status,2+status,0]
	line	526
	
l4068:	
;common.c: 526: if(( 0 == uiTwentyMinTimer ) && bTwentyMinStartFlag )
	movf	((_uiTwentyMinTimer+1)),w
	iorwf	((_uiTwentyMinTimer)),w
	skipz
	goto	u1831
	goto	u1830
u1831:
	goto	l4080
u1830:
	
l4070:	
	movf	(_bTwentyMinStartFlag),w
	skipz
	goto	u1840
	goto	l4080
u1840:
	line	528
	
l4072:	
;common.c: 527: {
;common.c: 528: bTwentyMinStartFlag = 0;
	clrf	(_bTwentyMinStartFlag)
	line	529
	
l4074:	
;common.c: 529: return 1;
	movlw	(01h)
	goto	l1630
	line	532
	
l4080:	
;common.c: 531: else
;common.c: 532: return 0;
	movlw	(0)
	line	533
	
l1630:	
	return
	opt stack 0
GLOBAL	__end_of_isFinishedTwentyMinTimer
	__end_of_isFinishedTwentyMinTimer:
;; =============== function _isFinishedTwentyMinTimer ends ============

	signat	_isFinishedTwentyMinTimer,89
	global	_clrSampeTime
psect	text1233,local,class=CODE,delta=2
global __ptext1233
__ptext1233:

;; *************** function _clrSampeTime *****************
;; Defined at:
;;		line 595 in file "D:\develop\AK7030-good\AK7030-OTP\common.c"
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
psect	text1233
	file	"D:\develop\AK7030-good\AK7030-OTP\common.c"
	line	595
	global	__size_of_clrSampeTime
	__size_of_clrSampeTime	equ	__end_of_clrSampeTime-_clrSampeTime
	
_clrSampeTime:	
	opt	stack 4
; Regs used in _clrSampeTime: [status,2]
	line	596
	
l4066:	
;common.c: 596: timer.timer10msStopWatch = 0;
	clrf	(_timer)
	line	597
	
l1654:	
	return
	opt stack 0
GLOBAL	__end_of_clrSampeTime
	__end_of_clrSampeTime:
;; =============== function _clrSampeTime ends ============

	signat	_clrSampeTime,88
	global	_isPermitSampleTime
psect	text1234,local,class=CODE,delta=2
global __ptext1234
__ptext1234:

;; *************** function _isPermitSampleTime *****************
;; Defined at:
;;		line 585 in file "D:\develop\AK7030-good\AK7030-OTP\common.c"
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
psect	text1234
	file	"D:\develop\AK7030-good\AK7030-OTP\common.c"
	line	585
	global	__size_of_isPermitSampleTime
	__size_of_isPermitSampleTime	equ	__end_of_isPermitSampleTime-_isPermitSampleTime
	
_isPermitSampleTime:	
	opt	stack 4
; Regs used in _isPermitSampleTime: [wreg]
	line	586
	
l4054:	
;common.c: 586: if(timer.timer10msStopWatch >= 10)
	movlw	(0Ah)
	subwf	(_timer),w
	skipc
	goto	u1821
	goto	u1820
u1821:
	goto	l4062
u1820:
	line	588
	
l4056:	
;common.c: 587: {
;common.c: 588: return 1;
	movlw	(01h)
	goto	l1650
	line	591
	
l4062:	
;common.c: 590: else
;common.c: 591: return 0;
	movlw	(0)
	line	592
	
l1650:	
	return
	opt stack 0
GLOBAL	__end_of_isPermitSampleTime
	__end_of_isPermitSampleTime:
;; =============== function _isPermitSampleTime ends ============

	signat	_isPermitSampleTime,89
	global	_adc_start
psect	text1235,local,class=CODE,delta=2
global __ptext1235
__ptext1235:

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
psect	text1235
	file	"D:\develop\AK7030-good\AK7030-OTP\periph.c"
	line	101
	global	__size_of_adc_start
	__size_of_adc_start	equ	__end_of_adc_start-_adc_start
	
_adc_start:	
	opt	stack 3
; Regs used in _adc_start: []
	line	102
	
l4052:	
;periph.c: 102: GO=1;
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	bsf	(249/8),(249)&7
	line	103
	
l2322:	
	return
	opt stack 0
GLOBAL	__end_of_adc_start
	__end_of_adc_start:
;; =============== function _adc_start ends ============

	signat	_adc_start,88
	global	_startTwentyMinTimer
psect	text1236,local,class=CODE,delta=2
global __ptext1236
__ptext1236:

;; *************** function _startTwentyMinTimer *****************
;; Defined at:
;;		line 515 in file "D:\develop\AK7030-good\AK7030-OTP\common.c"
;; Parameters:    Size  Location     Type
;;  uiSetValue      2   21[BANK0 ] unsigned int 
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
psect	text1236
	file	"D:\develop\AK7030-good\AK7030-OTP\common.c"
	line	515
	global	__size_of_startTwentyMinTimer
	__size_of_startTwentyMinTimer	equ	__end_of_startTwentyMinTimer-_startTwentyMinTimer
	
_startTwentyMinTimer:	
	opt	stack 4
; Regs used in _startTwentyMinTimer: [wreg+status,2+status,0]
	line	516
	
l4044:	
;common.c: 516: if(( 0 == uiTwentyMinTimer) && ( 0 == bTwentyMinStartFlag))
	movf	((_uiTwentyMinTimer+1)),w
	iorwf	((_uiTwentyMinTimer)),w
	skipz
	goto	u1801
	goto	u1800
u1801:
	goto	l1626
u1800:
	
l4046:	
	movf	(_bTwentyMinStartFlag),f
	skipz
	goto	u1811
	goto	u1810
u1811:
	goto	l1626
u1810:
	line	518
	
l4048:	
;common.c: 517: {
;common.c: 518: uiTwentyMinTimer = uiSetValue;
	movf	(startTwentyMinTimer@uiSetValue+1),w
	movwf	(_uiTwentyMinTimer+1)
	movf	(startTwentyMinTimer@uiSetValue),w
	movwf	(_uiTwentyMinTimer)
	line	519
	
l4050:	
;common.c: 519: bTwentyMinStartFlag = 1;
	clrf	(_bTwentyMinStartFlag)
	incf	(_bTwentyMinStartFlag),f
	line	521
	
l1626:	
	return
	opt stack 0
GLOBAL	__end_of_startTwentyMinTimer
	__end_of_startTwentyMinTimer:
;; =============== function _startTwentyMinTimer ends ============

	signat	_startTwentyMinTimer,4216
	global	_adc_test_init
psect	text1237,local,class=CODE,delta=2
global __ptext1237
__ptext1237:

;; *************** function _adc_test_init *****************
;; Defined at:
;;		line 85 in file "D:\develop\AK7030-good\AK7030-OTP\periph.c"
;; Parameters:    Size  Location     Type
;;  channel         1    wreg     unsigned char 
;;  ref             1   21[BANK0 ] unsigned char 
;; Auto vars:     Size  Location     Type
;;  channel         1   23[BANK0 ] unsigned char 
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
psect	text1237
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
	
l4034:	
;periph.c: 86: ADCON0 = 0x40;
	movlw	(040h)
	movwf	(31)	;volatile
	line	87
	
l4036:	
;periph.c: 87: ADCON0|=channel<<2;
	movf	(adc_test_init@channel),w
	movwf	(??_adc_test_init+0)+0
	clrc
	rlf	(??_adc_test_init+0)+0,f
	clrc
	rlf	(??_adc_test_init+0)+0,w
	iorwf	(31),f	;volatile
	line	88
	
l4038:	
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
	
l4040:	
;periph.c: 90: ADON=1;
	bcf	status, 5	;RP0=0, select bank0
	bsf	(248/8),(248)&7
	line	91
	
l4042:	
;periph.c: 91: ADIE=1;
	bsf	status, 5	;RP0=1, select bank1
	bsf	(1130/8)^080h,(1130)&7
	line	92
	
l2316:	
	return
	opt stack 0
GLOBAL	__end_of_adc_test_init
	__end_of_adc_test_init:
;; =============== function _adc_test_init ends ============

	signat	_adc_test_init,8312
	global	_timer1_interrupt_config
psect	text1238,local,class=CODE,delta=2
global __ptext1238
__ptext1238:

;; *************** function _timer1_interrupt_config *****************
;; Defined at:
;;		line 325 in file "D:\develop\AK7030-good\AK7030-OTP\common.c"
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
psect	text1238
	file	"D:\develop\AK7030-good\AK7030-OTP\common.c"
	line	325
	global	__size_of_timer1_interrupt_config
	__size_of_timer1_interrupt_config	equ	__end_of_timer1_interrupt_config-_timer1_interrupt_config
	
_timer1_interrupt_config:	
	opt	stack 4
; Regs used in _timer1_interrupt_config: []
	line	326
	
l4032:	
;common.c: 326: GIE = 1;
	bsf	(95/8),(95)&7
	line	327
;common.c: 327: PEIE = 1;
	bsf	(94/8),(94)&7
	line	328
	
l1567:	
	return
	opt stack 0
GLOBAL	__end_of_timer1_interrupt_config
	__end_of_timer1_interrupt_config:
;; =============== function _timer1_interrupt_config ends ============

	signat	_timer1_interrupt_config,88
	global	_timer1_config
psect	text1239,local,class=CODE,delta=2
global __ptext1239
__ptext1239:

;; *************** function _timer1_config *****************
;; Defined at:
;;		line 313 in file "D:\develop\AK7030-good\AK7030-OTP\common.c"
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
psect	text1239
	file	"D:\develop\AK7030-good\AK7030-OTP\common.c"
	line	313
	global	__size_of_timer1_config
	__size_of_timer1_config	equ	__end_of_timer1_config-_timer1_config
	
_timer1_config:	
	opt	stack 4
; Regs used in _timer1_config: [wreg]
	line	315
	
l4028:	
;common.c: 315: TMR1H=0xCF;
	movlw	(0CFh)
	bcf	status, 6	;RP1=0, select bank0
	movwf	(15)	;volatile
	line	316
;common.c: 316: TMR1L=0x2C;
	movlw	(02Ch)
	movwf	(14)	;volatile
	line	317
;common.c: 317: T1CON=0xE1;
	movlw	(0E1h)
	movwf	(16)	;volatile
	line	318
	
l4030:	
;common.c: 318: TMR1IE=1;
	bsf	status, 5	;RP0=1, select bank1
	bsf	(1120/8)^080h,(1120)&7
	line	320
	
l1564:	
	return
	opt stack 0
GLOBAL	__end_of_timer1_config
	__end_of_timer1_config:
;; =============== function _timer1_config ends ============

	signat	_timer1_config,88
	global	_clock_config
psect	text1240,local,class=CODE,delta=2
global __ptext1240
__ptext1240:

;; *************** function _clock_config *****************
;; Defined at:
;;		line 305 in file "D:\develop\AK7030-good\AK7030-OTP\common.c"
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
psect	text1240
	file	"D:\develop\AK7030-good\AK7030-OTP\common.c"
	line	305
	global	__size_of_clock_config
	__size_of_clock_config	equ	__end_of_clock_config-_clock_config
	
_clock_config:	
	opt	stack 4
; Regs used in _clock_config: [wreg+status,2]
	line	307
	
l4024:	
;common.c: 307: CLKPR = 0x80;
	movlw	(080h)
	bcf	status, 5	;RP0=0, select bank2
	bsf	status, 6	;RP1=1, select bank2
	movwf	(264)^0100h	;volatile
	line	308
	
l4026:	
;common.c: 308: CLKPR = 0x00;
	clrf	(264)^0100h	;volatile
	line	309
;common.c: 309: while(CLKPCE);
	
l1558:	
	btfsc	(2119/8)^0100h,(2119)&7
	goto	u1791
	goto	u1790
u1791:
	goto	l1558
u1790:
	line	310
	
l1561:	
	return
	opt stack 0
GLOBAL	__end_of_clock_config
	__end_of_clock_config:
;; =============== function _clock_config ends ============

	signat	_clock_config,88
	global	_reset
psect	text1241,local,class=CODE,delta=2
global __ptext1241
__ptext1241:

;; *************** function _reset *****************
;; Defined at:
;;		line 294 in file "D:\develop\AK7030-good\AK7030-OTP\main.c"
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
psect	text1241
	file	"D:\develop\AK7030-good\AK7030-OTP\main.c"
	line	294
	global	__size_of_reset
	__size_of_reset	equ	__end_of_reset-_reset
	
_reset:	
	opt	stack 4
; Regs used in _reset: []
	line	296
;main.c: 296: while(1);
	
l722:	
	goto	l722
	return
	opt stack 0
psect	text1242,local,class=CODE,delta=2
global __ptext1242
__ptext1242:
	line	300
GLOBAL	__end_of_reset
	__end_of_reset:
;; =============== function _reset ends ============

	signat	_reset,88
	global	_selectAdChannel

;; *************** function _selectAdChannel *****************
;; Defined at:
;;		line 283 in file "D:\develop\AK7030-good\AK7030-OTP\main.c"
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
psect	text1242
	file	"D:\develop\AK7030-good\AK7030-OTP\main.c"
	line	283
	global	__size_of_selectAdChannel
	__size_of_selectAdChannel	equ	__end_of_selectAdChannel-_selectAdChannel
	
_selectAdChannel:	
	opt	stack 4
; Regs used in _selectAdChannel: []
	line	285
	
l4022:	
;main.c: 285: TRISB0 = 1;
	bsf	status, 5	;RP0=1, select bank1
	bsf	(1072/8)^080h,(1072)&7
	line	286
;main.c: 286: TRISB1 = 1;
	bsf	(1073/8)^080h,(1073)&7
	line	290
	
l719:	
	return
	opt stack 0
GLOBAL	__end_of_selectAdChannel
	__end_of_selectAdChannel:
;; =============== function _selectAdChannel ends ============

	signat	_selectAdChannel,88
	global	_pwm_start
psect	text1243,local,class=CODE,delta=2
global __ptext1243
__ptext1243:

;; *************** function _pwm_start *****************
;; Defined at:
;;		line 231 in file "D:\develop\AK7030-good\AK7030-OTP\main.c"
;; Parameters:    Size  Location     Type
;;  ucPulseWidth    1    wreg     unsigned char 
;;  ucPulseFrequ    1   21[BANK0 ] unsigned char 
;; Auto vars:     Size  Location     Type
;;  ucPulseWidth    1   22[BANK0 ] unsigned char 
;; Return value:  Size  Location     Type
;;		None               void
;; Registers used:
;;		wreg, status,2, status,0
;; Tracked objects:
;;		On entry : 60/0
;;		On exit  : 60/0
;;		Unchanged: FFF9F/0
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
psect	text1243
	file	"D:\develop\AK7030-good\AK7030-OTP\main.c"
	line	231
	global	__size_of_pwm_start
	__size_of_pwm_start	equ	__end_of_pwm_start-_pwm_start
	
_pwm_start:	
	opt	stack 4
; Regs used in _pwm_start: [wreg+status,2+status,0]
;pwm_start@ucPulseWidth stored from wreg
	line	233
	movwf	(pwm_start@ucPulseWidth)
	
l4006:	
;main.c: 233: CCP1CON&= 0xf0;
	movlw	(0F0h)
	andwf	(23),f	;volatile
	line	235
	
l4008:	
;main.c: 235: T2CON=0x04;
	movlw	(04h)
	movwf	(18)	;volatile
	line	236
	
l4010:	
;main.c: 236: PR2 = ucPulseFrequency;
	movf	(pwm_start@ucPulseFrequency),w
	bsf	status, 5	;RP0=1, select bank1
	movwf	(146)^080h	;volatile
	line	237
	
l4012:	
;main.c: 237: CCPR1L = ucPulseWidth;
	bcf	status, 5	;RP0=0, select bank0
	movf	(pwm_start@ucPulseWidth),w
	movwf	(21)	;volatile
	line	238
	
l4014:	
;main.c: 238: CCP1CON=0x00;
	clrf	(23)	;volatile
	line	240
	
l4016:	
;main.c: 240: TRISB2=0;
	bsf	status, 5	;RP0=1, select bank1
	bcf	(1074/8)^080h,(1074)&7
	line	241
	
l4018:	
;main.c: 241: PBOD2 = 0;
	bsf	status, 6	;RP1=1, select bank3
	bcf	(3138/8)^0180h,(3138)&7
	line	243
	
l4020:	
;main.c: 243: CCP1CON|= 0x0c;
	movlw	(0Ch)
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	iorwf	(23),f	;volatile
	line	252
	
l710:	
	return
	opt stack 0
GLOBAL	__end_of_pwm_start
	__end_of_pwm_start:
;; =============== function _pwm_start ends ============

	signat	_pwm_start,8312
	global	_initPB2_AsHighResistence
psect	text1244,local,class=CODE,delta=2
global __ptext1244
__ptext1244:

;; *************** function _initPB2_AsHighResistence *****************
;; Defined at:
;;		line 219 in file "D:\develop\AK7030-good\AK7030-OTP\main.c"
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
psect	text1244
	file	"D:\develop\AK7030-good\AK7030-OTP\main.c"
	line	219
	global	__size_of_initPB2_AsHighResistence
	__size_of_initPB2_AsHighResistence	equ	__end_of_initPB2_AsHighResistence-_initPB2_AsHighResistence
	
_initPB2_AsHighResistence:	
	opt	stack 3
; Regs used in _initPB2_AsHighResistence: []
	line	221
	
l4004:	
;main.c: 221: PB2 = 1;
	bsf	(50/8),(50)&7
	line	222
;main.c: 222: PBOD2 = 1;
	bsf	status, 5	;RP0=1, select bank3
	bsf	status, 6	;RP1=1, select bank3
	bsf	(3138/8)^0180h,(3138)&7
	line	226
	
l707:	
	return
	opt stack 0
GLOBAL	__end_of_initPB2_AsHighResistence
	__end_of_initPB2_AsHighResistence:
;; =============== function _initPB2_AsHighResistence ends ============

	signat	_initPB2_AsHighResistence,88
	global	_setPB5
psect	text1245,local,class=CODE,delta=2
global __ptext1245
__ptext1245:

;; *************** function _setPB5 *****************
;; Defined at:
;;		line 202 in file "D:\develop\AK7030-good\AK7030-OTP\main.c"
;; Parameters:    Size  Location     Type
;;  bValue          1    wreg     unsigned char 
;; Auto vars:     Size  Location     Type
;;  bValue          1   21[BANK0 ] unsigned char 
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
psect	text1245
	file	"D:\develop\AK7030-good\AK7030-OTP\main.c"
	line	202
	global	__size_of_setPB5
	__size_of_setPB5	equ	__end_of_setPB5-_setPB5
	
_setPB5:	
	opt	stack 4
; Regs used in _setPB5: [wreg]
;setPB5@bValue stored from wreg
	movwf	(setPB5@bValue)
	line	203
	
l4000:	
;main.c: 203: if( bValue )
	movf	(setPB5@bValue),w
	skipz
	goto	u1780
	goto	l702
u1780:
	line	205
	
l4002:	
;main.c: 205: PB5 = 1;
	bsf	(53/8),(53)&7
	goto	l704
	line	209
	
l702:	
	line	211
;main.c: 209: else
;main.c: 211: PB5= 0;
	bcf	(53/8),(53)&7
	line	215
	
l704:	
	return
	opt stack 0
GLOBAL	__end_of_setPB5
	__end_of_setPB5:
;; =============== function _setPB5 ends ============

	signat	_setPB5,4216
	global	_initPB5
psect	text1246,local,class=CODE,delta=2
global __ptext1246
__ptext1246:

;; *************** function _initPB5 *****************
;; Defined at:
;;		line 185 in file "D:\develop\AK7030-good\AK7030-OTP\main.c"
;; Parameters:    Size  Location     Type
;;  bValue          1    wreg     unsigned char 
;; Auto vars:     Size  Location     Type
;;  bValue          1   21[BANK0 ] unsigned char 
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
psect	text1246
	file	"D:\develop\AK7030-good\AK7030-OTP\main.c"
	line	185
	global	__size_of_initPB5
	__size_of_initPB5	equ	__end_of_initPB5-_initPB5
	
_initPB5:	
	opt	stack 3
; Regs used in _initPB5: [wreg]
;initPB5@bValue stored from wreg
	bcf	status, 5	;RP0=0, select bank0
	movwf	(initPB5@bValue)
	line	186
	
l3996:	
;main.c: 186: if( bValue )
	movf	(initPB5@bValue),w
	skipz
	goto	u1770
	goto	l697
u1770:
	line	188
	
l3998:	
;main.c: 188: TRISB5 = 1;
	bsf	status, 5	;RP0=1, select bank1
	bsf	(1077/8)^080h,(1077)&7
	goto	l699
	line	192
	
l697:	
	line	194
;main.c: 192: else
;main.c: 194: TRISB5= 0;
	bsf	status, 5	;RP0=1, select bank1
	bcf	(1077/8)^080h,(1077)&7
	line	198
	
l699:	
	return
	opt stack 0
GLOBAL	__end_of_initPB5
	__end_of_initPB5:
;; =============== function _initPB5 ends ============

	signat	_initPB5,4216
	global	_setPB4
psect	text1247,local,class=CODE,delta=2
global __ptext1247
__ptext1247:

;; *************** function _setPB4 *****************
;; Defined at:
;;		line 168 in file "D:\develop\AK7030-good\AK7030-OTP\main.c"
;; Parameters:    Size  Location     Type
;;  bValue          1    wreg     unsigned char 
;; Auto vars:     Size  Location     Type
;;  bValue          1   21[BANK0 ] unsigned char 
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
psect	text1247
	file	"D:\develop\AK7030-good\AK7030-OTP\main.c"
	line	168
	global	__size_of_setPB4
	__size_of_setPB4	equ	__end_of_setPB4-_setPB4
	
_setPB4:	
	opt	stack 4
; Regs used in _setPB4: [wreg]
;setPB4@bValue stored from wreg
	movwf	(setPB4@bValue)
	line	169
	
l3992:	
;main.c: 169: if( bValue )
	movf	(setPB4@bValue),w
	skipz
	goto	u1760
	goto	l692
u1760:
	line	171
	
l3994:	
;main.c: 171: PB4 = 1;
	bsf	(52/8),(52)&7
	goto	l694
	line	175
	
l692:	
	line	177
;main.c: 175: else
;main.c: 177: PB4= 0;
	bcf	(52/8),(52)&7
	line	181
	
l694:	
	return
	opt stack 0
GLOBAL	__end_of_setPB4
	__end_of_setPB4:
;; =============== function _setPB4 ends ============

	signat	_setPB4,4216
	global	_initPB4
psect	text1248,local,class=CODE,delta=2
global __ptext1248
__ptext1248:

;; *************** function _initPB4 *****************
;; Defined at:
;;		line 151 in file "D:\develop\AK7030-good\AK7030-OTP\main.c"
;; Parameters:    Size  Location     Type
;;  bValue          1    wreg     unsigned char 
;; Auto vars:     Size  Location     Type
;;  bValue          1   21[BANK0 ] unsigned char 
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
psect	text1248
	file	"D:\develop\AK7030-good\AK7030-OTP\main.c"
	line	151
	global	__size_of_initPB4
	__size_of_initPB4	equ	__end_of_initPB4-_initPB4
	
_initPB4:	
	opt	stack 3
; Regs used in _initPB4: [wreg]
;initPB4@bValue stored from wreg
	bcf	status, 5	;RP0=0, select bank0
	movwf	(initPB4@bValue)
	line	152
	
l3988:	
;main.c: 152: if( bValue )
	movf	(initPB4@bValue),w
	skipz
	goto	u1750
	goto	l687
u1750:
	line	154
	
l3990:	
;main.c: 154: TRISB4 = 1;
	bsf	status, 5	;RP0=1, select bank1
	bsf	(1076/8)^080h,(1076)&7
	goto	l689
	line	158
	
l687:	
	line	160
;main.c: 158: else
;main.c: 160: TRISB4= 0;
	bsf	status, 5	;RP0=1, select bank1
	bcf	(1076/8)^080h,(1076)&7
	line	164
	
l689:	
	return
	opt stack 0
GLOBAL	__end_of_initPB4
	__end_of_initPB4:
;; =============== function _initPB4 ends ============

	signat	_initPB4,4216
	global	_setPB3
psect	text1249,local,class=CODE,delta=2
global __ptext1249
__ptext1249:

;; *************** function _setPB3 *****************
;; Defined at:
;;		line 133 in file "D:\develop\AK7030-good\AK7030-OTP\main.c"
;; Parameters:    Size  Location     Type
;;  bValue          1    wreg     unsigned char 
;; Auto vars:     Size  Location     Type
;;  bValue          1   21[BANK0 ] unsigned char 
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
psect	text1249
	file	"D:\develop\AK7030-good\AK7030-OTP\main.c"
	line	133
	global	__size_of_setPB3
	__size_of_setPB3	equ	__end_of_setPB3-_setPB3
	
_setPB3:	
	opt	stack 4
; Regs used in _setPB3: [wreg]
;setPB3@bValue stored from wreg
	bcf	status, 5	;RP0=0, select bank0
	movwf	(setPB3@bValue)
	line	134
	
l3984:	
;main.c: 134: if( bValue )
	movf	(setPB3@bValue),w
	skipz
	goto	u1740
	goto	l682
u1740:
	line	136
	
l3986:	
;main.c: 136: PB3 = 1;
	bsf	(51/8),(51)&7
	goto	l684
	line	140
	
l682:	
	line	142
;main.c: 140: else
;main.c: 142: PB3= 0;
	bcf	(51/8),(51)&7
	line	146
	
l684:	
	return
	opt stack 0
GLOBAL	__end_of_setPB3
	__end_of_setPB3:
;; =============== function _setPB3 ends ============

	signat	_setPB3,4216
	global	_initPB3
psect	text1250,local,class=CODE,delta=2
global __ptext1250
__ptext1250:

;; *************** function _initPB3 *****************
;; Defined at:
;;		line 116 in file "D:\develop\AK7030-good\AK7030-OTP\main.c"
;; Parameters:    Size  Location     Type
;;  bValue          1    wreg     unsigned char 
;; Auto vars:     Size  Location     Type
;;  bValue          1   21[BANK0 ] unsigned char 
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
psect	text1250
	file	"D:\develop\AK7030-good\AK7030-OTP\main.c"
	line	116
	global	__size_of_initPB3
	__size_of_initPB3	equ	__end_of_initPB3-_initPB3
	
_initPB3:	
	opt	stack 3
; Regs used in _initPB3: [wreg]
;initPB3@bValue stored from wreg
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	movwf	(initPB3@bValue)
	line	117
	
l3980:	
;main.c: 117: if( bValue )
	movf	(initPB3@bValue),w
	skipz
	goto	u1730
	goto	l677
u1730:
	line	119
	
l3982:	
;main.c: 119: TRISB3 = 1;
	bsf	status, 5	;RP0=1, select bank1
	bsf	(1075/8)^080h,(1075)&7
	goto	l679
	line	123
	
l677:	
	line	125
;main.c: 123: else
;main.c: 125: TRISB3 = 0;
	bsf	status, 5	;RP0=1, select bank1
	bcf	(1075/8)^080h,(1075)&7
	line	129
	
l679:	
	return
	opt stack 0
GLOBAL	__end_of_initPB3
	__end_of_initPB3:
;; =============== function _initPB3 ends ============

	signat	_initPB3,4216
	global	_ISR
psect	text1251,local,class=CODE,delta=2
global __ptext1251
__ptext1251:

;; *************** function _ISR *****************
;; Defined at:
;;		line 603 in file "D:\develop\AK7030-good\AK7030-OTP\common.c"
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
;; Hardware stack levels required when called:    2
;; This function calls:
;;		i1_setAD_ConvertFlag
;;		_adc_get
;;		_vPutSampleDataIntoTable
;; This function is called by:
;;		Interrupt level 1
;; This function uses a non-reentrant model
;;
psect	text1251
	file	"D:\develop\AK7030-good\AK7030-OTP\common.c"
	line	603
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
psect	text1251
	line	607
	
i1l3740:	
;common.c: 604: static unsigned char ucTimer1sCnt = 0;
;common.c: 607: if(TMR1IF == 1)
	btfss	(96/8),(96)&7
	goto	u140_21
	goto	u140_20
u140_21:
	goto	i1l3762
u140_20:
	line	609
	
i1l3742:	
;common.c: 608: {
;common.c: 609: TMR1IF = 0 ;
	bcf	(96/8),(96)&7
	line	610
	
i1l3744:	
;common.c: 610: timer.timer10msStopWatch++;
	incf	(_timer),f
	line	611
;common.c: 611: ucTimer1sCnt++;
	incf	(ISR@ucTimer1sCnt),f
	line	615
	
i1l3746:	
;common.c: 615: if(ucTimer1sCnt >= 100)
	movlw	(064h)
	subwf	(ISR@ucTimer1sCnt),w
	skipc
	goto	u141_21
	goto	u141_20
u141_21:
	goto	i1l3762
u141_20:
	line	617
	
i1l3748:	
;common.c: 616: {
;common.c: 617: ucTimer1sCnt = 0;
	clrf	(ISR@ucTimer1sCnt)
	line	618
	
i1l3750:	
;common.c: 618: if(uiBigTimer > 0)
	movf	(_uiBigTimer+1),w
	iorwf	(_uiBigTimer),w
	skipnz
	goto	u142_21
	goto	u142_20
u142_21:
	goto	i1l1661
u142_20:
	line	619
	
i1l3752:	
;common.c: 619: uiBigTimer--;
	movlw	low(01h)
	subwf	(_uiBigTimer),f
	movlw	high(01h)
	skipc
	decf	(_uiBigTimer+1),f
	subwf	(_uiBigTimer+1),f
	
i1l1661:	
	line	621
;common.c: 621: if(uiSmallTimer)
	movf	(_uiSmallTimer+1),w
	iorwf	(_uiSmallTimer),w
	skipnz
	goto	u143_21
	goto	u143_20
u143_21:
	goto	i1l1662
u143_20:
	line	622
	
i1l3754:	
;common.c: 622: uiSmallTimer--;
	movlw	low(01h)
	subwf	(_uiSmallTimer),f
	movlw	high(01h)
	skipc
	decf	(_uiSmallTimer+1),f
	subwf	(_uiSmallTimer+1),f
	
i1l1662:	
	line	624
;common.c: 624: if(uiTwentySecondsTimer)
	bsf	status, 5	;RP0=1, select bank1
	movf	(_uiTwentySecondsTimer+1)^080h,w
	iorwf	(_uiTwentySecondsTimer)^080h,w
	skipnz
	goto	u144_21
	goto	u144_20
u144_21:
	goto	i1l1663
u144_20:
	line	625
	
i1l3756:	
;common.c: 625: uiTwentySecondsTimer--;
	movlw	low(01h)
	subwf	(_uiTwentySecondsTimer)^080h,f
	movlw	high(01h)
	skipc
	decf	(_uiTwentySecondsTimer+1)^080h,f
	subwf	(_uiTwentySecondsTimer+1)^080h,f
	
i1l1663:	
	line	627
;common.c: 627: if(uiTwentyMinTimer)
	bcf	status, 5	;RP0=0, select bank0
	movf	(_uiTwentyMinTimer+1),w
	iorwf	(_uiTwentyMinTimer),w
	skipnz
	goto	u145_21
	goto	u145_20
u145_21:
	goto	i1l1664
u145_20:
	line	628
	
i1l3758:	
;common.c: 628: uiTwentyMinTimer--;
	movlw	low(01h)
	subwf	(_uiTwentyMinTimer),f
	movlw	high(01h)
	skipc
	decf	(_uiTwentyMinTimer+1),f
	subwf	(_uiTwentyMinTimer+1),f
	
i1l1664:	
	line	630
;common.c: 630: if( uiOneHourTimer )
	movf	(_uiOneHourTimer+1),w
	iorwf	(_uiOneHourTimer),w
	skipnz
	goto	u146_21
	goto	u146_20
u146_21:
	goto	i1l3762
u146_20:
	line	631
	
i1l3760:	
;common.c: 631: uiOneHourTimer--;
	movlw	low(01h)
	subwf	(_uiOneHourTimer),f
	movlw	high(01h)
	skipc
	decf	(_uiOneHourTimer+1),f
	subwf	(_uiOneHourTimer+1),f
	line	635
	
i1l3762:	
;common.c: 632: }
;common.c: 633: }
;common.c: 635: if(ADIF)
	btfss	(106/8),(106)&7
	goto	u147_21
	goto	u147_20
u147_21:
	goto	i1l1669
u147_20:
	line	638
	
i1l3764:	
;common.c: 636: {
;common.c: 638: ADIF=0;
	bcf	(106/8),(106)&7
	line	639
	
i1l3766:	
;common.c: 639: setAD_ConvertFlag(1);
	movlw	(01h)
	fcall	i1_setAD_ConvertFlag
	line	641
	
i1l3768:	
;common.c: 641: if(sampleChannelSelect == 12)
	movf	(_sampleChannelSelect),w
	xorlw	0Ch
	skipz
	goto	u148_21
	goto	u148_20
u148_21:
	goto	i1l3772
u148_20:
	line	645
	
i1l3770:	
;common.c: 642: {
;common.c: 645: vPutSampleDataIntoTable(adc_get(),12);
	fcall	_adc_get
	movf	(1+(?_adc_get)),w
	movwf	(?_vPutSampleDataIntoTable+1)
	movf	(0+(?_adc_get)),w
	movwf	(?_vPutSampleDataIntoTable)
	movlw	(0Ch)
	movwf	0+(?_vPutSampleDataIntoTable)+02h
	fcall	_vPutSampleDataIntoTable
	line	649
;common.c: 649: }
	goto	i1l1669
	line	655
	
i1l3772:	
;common.c: 650: else
;common.c: 651: {
;common.c: 655: vPutSampleDataIntoTable(adc_get(),13);
	fcall	_adc_get
	movf	(1+(?_adc_get)),w
	movwf	(?_vPutSampleDataIntoTable+1)
	movf	(0+(?_adc_get)),w
	movwf	(?_vPutSampleDataIntoTable)
	movlw	(0Dh)
	movwf	0+(?_vPutSampleDataIntoTable)+02h
	fcall	_vPutSampleDataIntoTable
	line	660
	
i1l1669:	
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
	global	_vPutSampleDataIntoTable
psect	text1252,local,class=CODE,delta=2
global __ptext1252
__ptext1252:

;; *************** function _vPutSampleDataIntoTable *****************
;; Defined at:
;;		line 164 in file "D:\develop\AK7030-good\AK7030-OTP\common.c"
;; Parameters:    Size  Location     Type
;;  uiSampleData    2    6[COMMON] unsigned int 
;;  channel         1    8[COMMON] unsigned char 
;; Auto vars:     Size  Location     Type
;;  uiDeviationV    2   17[BANK0 ] unsigned int 
;;  uiAbstractVa    2   15[BANK0 ] unsigned int 
;;  i               2   19[BANK0 ] int 
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
;;      Locals:         0       6       0       0       0
;;      Temps:          0       0       0       0       0
;;      Totals:         3       6       0       0       0
;;Total ram usage:        9 bytes
;; Hardware stack levels used:    1
;; Hardware stack levels required when called:    1
;; This function calls:
;;		_Filter
;;		_getWaitResetFlag
;;		_setPWM_Width
;; This function is called by:
;;		_ISR
;; This function uses a non-reentrant model
;;
psect	text1252
	file	"D:\develop\AK7030-good\AK7030-OTP\common.c"
	line	164
	global	__size_of_vPutSampleDataIntoTable
	__size_of_vPutSampleDataIntoTable	equ	__end_of_vPutSampleDataIntoTable-_vPutSampleDataIntoTable
	
_vPutSampleDataIntoTable:	
	opt	stack 3
; Regs used in _vPutSampleDataIntoTable: [wreg-fsr0h+status,2+status,0+btemp+1+pclath+cstack]
	line	173
	
i1l3630:	
;common.c: 166: static unsigned char ucCh12Length = 0;
;common.c: 168: static unsigned char ucCh13Length = 0;
;common.c: 170: static unsigned char ucChannelFourteenthLength = 0;
;common.c: 171: static unsigned int uiCalWidthArrayNew = 0;
;common.c: 172: static unsigned int uiCalWidthArrayOld = 0;
;common.c: 173: if(channel == 12)
	movf	(vPutSampleDataIntoTable@channel),w
	xorlw	0Ch
	skipz
	goto	u122_21
	goto	u122_20
u122_21:
	goto	i1l3684
u122_20:
	line	175
	
i1l3632:	
;common.c: 174: {
;common.c: 175: if(ucCh12Length < 3)
	movlw	(03h)
	subwf	(vPutSampleDataIntoTable@ucCh12Length),w
	skipnc
	goto	u123_21
	goto	u123_20
u123_21:
	goto	i1l3680
u123_20:
	line	177
	
i1l3634:	
;common.c: 176: {
;common.c: 177: uiSampleCh12[ucCh12Length] = uiSampleData;
	clrc
	rlf	(vPutSampleDataIntoTable@ucCh12Length),w
	addlw	_uiSampleCh12&0ffh
	movwf	fsr0
	movf	(vPutSampleDataIntoTable@uiSampleData),w
	bcf	status, 7	;select IRP bank1
	movwf	indf
	incf	fsr0,f
	movf	(vPutSampleDataIntoTable@uiSampleData+1),w
	movwf	indf
	line	179
	
i1l3636:	
;common.c: 179: ucCh12Length++;
	incf	(vPutSampleDataIntoTable@ucCh12Length),f
	line	181
	
i1l3638:	
;common.c: 181: if( 3 == ucCh12Length )
	movf	(vPutSampleDataIntoTable@ucCh12Length),w
	xorlw	03h
	skipz
	goto	u124_21
	goto	u124_20
u124_21:
	goto	i1l1555
u124_20:
	line	183
	
i1l3640:	
;common.c: 182: {
;common.c: 183: ucCh12Length = 0;
	clrf	(vPutSampleDataIntoTable@ucCh12Length)
	line	193
	
i1l3642:	
;common.c: 187: static unsigned char bInitArrayFlag = 0;
;common.c: 189: static unsigned int uiCalWidthArray[1],uiCalWidthCnt = 0;
;common.c: 191: static unsigned char uiInitWidth = 75;
;common.c: 193: uiCalWidthArrayNew = Filter(uiSampleCh12);
	movlw	(_uiSampleCh12)&0ffh
	fcall	_Filter
	movf	(1+(?_Filter)),w
	movwf	(vPutSampleDataIntoTable@uiCalWidthArrayNew+1)
	movf	(0+(?_Filter)),w
	movwf	(vPutSampleDataIntoTable@uiCalWidthArrayNew)
	line	195
	
i1l3644:	
	
i1l3646:	
	line	197
	
i1l3648:	
;common.c: 197: if( uiCalWidthArrayNew >= uiCalWidthArrayOld)
	movf	(vPutSampleDataIntoTable@uiCalWidthArrayOld+1),w
	subwf	(vPutSampleDataIntoTable@uiCalWidthArrayNew+1),w
	skipz
	goto	u125_25
	movf	(vPutSampleDataIntoTable@uiCalWidthArrayOld),w
	subwf	(vPutSampleDataIntoTable@uiCalWidthArrayNew),w
u125_25:
	skipc
	goto	u125_21
	goto	u125_20
u125_21:
	goto	i1l3652
u125_20:
	line	198
	
i1l3650:	
;common.c: 198: uiAbstractValue = uiCalWidthArrayNew - uiCalWidthArrayOld;
	movf	(vPutSampleDataIntoTable@uiCalWidthArrayNew+1),w
	movwf	(vPutSampleDataIntoTable@uiAbstractValue+1)
	movf	(vPutSampleDataIntoTable@uiCalWidthArrayNew),w
	movwf	(vPutSampleDataIntoTable@uiAbstractValue)
	movf	(vPutSampleDataIntoTable@uiCalWidthArrayOld),w
	subwf	(vPutSampleDataIntoTable@uiAbstractValue),f
	movf	(vPutSampleDataIntoTable@uiCalWidthArrayOld+1),w
	skipc
	decf	(vPutSampleDataIntoTable@uiAbstractValue+1),f
	subwf	(vPutSampleDataIntoTable@uiAbstractValue+1),f
	goto	i1l1533
	line	200
	
i1l3652:	
;common.c: 199: else
;common.c: 200: uiAbstractValue = uiCalWidthArrayOld - uiCalWidthArrayNew;
	movf	(vPutSampleDataIntoTable@uiCalWidthArrayOld+1),w
	movwf	(vPutSampleDataIntoTable@uiAbstractValue+1)
	movf	(vPutSampleDataIntoTable@uiCalWidthArrayOld),w
	movwf	(vPutSampleDataIntoTable@uiAbstractValue)
	movf	(vPutSampleDataIntoTable@uiCalWidthArrayNew),w
	subwf	(vPutSampleDataIntoTable@uiAbstractValue),f
	movf	(vPutSampleDataIntoTable@uiCalWidthArrayNew+1),w
	skipc
	decf	(vPutSampleDataIntoTable@uiAbstractValue+1),f
	subwf	(vPutSampleDataIntoTable@uiAbstractValue+1),f
	
i1l1533:	
	line	202
;common.c: 202: uiDeviationValue = ((uiCalWidthArrayNew+uiCalWidthArrayOld)>>1)+ uiAbstractValue;
	movf	(vPutSampleDataIntoTable@uiCalWidthArrayNew+1),w
	movwf	(vPutSampleDataIntoTable@uiDeviationValue+1)
	movf	(vPutSampleDataIntoTable@uiCalWidthArrayNew),w
	movwf	(vPutSampleDataIntoTable@uiDeviationValue)
	movf	(vPutSampleDataIntoTable@uiCalWidthArrayOld),w
	addwf	(vPutSampleDataIntoTable@uiDeviationValue),f
	skipnc
	incf	(vPutSampleDataIntoTable@uiDeviationValue+1),f
	movf	(vPutSampleDataIntoTable@uiCalWidthArrayOld+1),w
	addwf	(vPutSampleDataIntoTable@uiDeviationValue+1),f
	
i1l3654:	
	clrc
	rrf	(vPutSampleDataIntoTable@uiDeviationValue+1),f
	rrf	(vPutSampleDataIntoTable@uiDeviationValue),f
	
i1l3656:	
	movf	(vPutSampleDataIntoTable@uiAbstractValue),w
	addwf	(vPutSampleDataIntoTable@uiDeviationValue),f
	skipnc
	incf	(vPutSampleDataIntoTable@uiDeviationValue+1),f
	movf	(vPutSampleDataIntoTable@uiAbstractValue+1),w
	addwf	(vPutSampleDataIntoTable@uiDeviationValue+1),f
	line	204
	
i1l3658:	
;common.c: 204: if(uiCalWidthCnt>400)
	movlw	high(0191h)
	bsf	status, 5	;RP0=1, select bank1
	subwf	(vPutSampleDataIntoTable@uiCalWidthCnt+1)^080h,w
	movlw	low(0191h)
	skipnz
	subwf	(vPutSampleDataIntoTable@uiCalWidthCnt)^080h,w
	skipc
	goto	u126_21
	goto	u126_20
u126_21:
	goto	i1l1534
u126_20:
	line	205
	
i1l3660:	
;common.c: 205: uiDeviationValue =400;
	movlw	low(0190h)
	bcf	status, 5	;RP0=0, select bank0
	movwf	(vPutSampleDataIntoTable@uiDeviationValue)
	movlw	high(0190h)
	movwf	((vPutSampleDataIntoTable@uiDeviationValue))+1
	
i1l1534:	
	line	208
;common.c: 208: uiCalWidthArrayOld=uiCalWidthArrayNew;
	bcf	status, 5	;RP0=0, select bank0
	movf	(vPutSampleDataIntoTable@uiCalWidthArrayNew+1),w
	movwf	(vPutSampleDataIntoTable@uiCalWidthArrayOld+1)
	movf	(vPutSampleDataIntoTable@uiCalWidthArrayNew),w
	movwf	(vPutSampleDataIntoTable@uiCalWidthArrayOld)
	line	213
;common.c: 213: if(uiDeviationValue > (312))
	movlw	high(0139h)
	subwf	(vPutSampleDataIntoTable@uiDeviationValue+1),w
	movlw	low(0139h)
	skipnz
	subwf	(vPutSampleDataIntoTable@uiDeviationValue),w
	skipc
	goto	u127_21
	goto	u127_20
u127_21:
	goto	i1l3664
u127_20:
	line	217
	
i1l3662:	
;common.c: 214: {
;common.c: 217: uiInitWidth++;
	incf	(vPutSampleDataIntoTable@uiInitWidth),f
	line	219
;common.c: 219: }
	goto	i1l3668
	line	220
	
i1l3664:	
;common.c: 220: else if(uiDeviationValue < (312))
	movlw	high(0138h)
	subwf	(vPutSampleDataIntoTable@uiDeviationValue+1),w
	movlw	low(0138h)
	skipnz
	subwf	(vPutSampleDataIntoTable@uiDeviationValue),w
	skipnc
	goto	u128_21
	goto	u128_20
u128_21:
	goto	i1l3668
u128_20:
	line	224
	
i1l3666:	
;common.c: 221: {
;common.c: 224: uiInitWidth--;
	decf	(vPutSampleDataIntoTable@uiInitWidth),f
	line	230
;common.c: 226: }
	
i1l3668:	
;common.c: 230: if(uiInitWidth > 249)
	movlw	(0FAh)
	subwf	(vPutSampleDataIntoTable@uiInitWidth),w
	skipc
	goto	u129_21
	goto	u129_20
u129_21:
	goto	i1l1539
u129_20:
	line	231
	
i1l3670:	
;common.c: 231: uiInitWidth = 249;
	movlw	(0F9h)
	movwf	(vPutSampleDataIntoTable@uiInitWidth)
	
i1l1539:	
	line	233
;common.c: 233: if(uiInitWidth < 75)
	movlw	(04Bh)
	subwf	(vPutSampleDataIntoTable@uiInitWidth),w
	skipnc
	goto	u130_21
	goto	u130_20
u130_21:
	goto	i1l3674
u130_20:
	line	234
	
i1l3672:	
;common.c: 234: uiInitWidth = 75;
	movlw	(04Bh)
	movwf	(vPutSampleDataIntoTable@uiInitWidth)
	line	238
	
i1l3674:	
;common.c: 238: if( 1 == getWaitResetFlag())
	fcall	_getWaitResetFlag
	xorlw	01h
	skipz
	goto	u131_21
	goto	u131_20
u131_21:
	goto	i1l3678
u131_20:
	line	239
	
i1l3676:	
;common.c: 239: uiInitWidth = 150;
	movlw	(096h)
	movwf	(vPutSampleDataIntoTable@uiInitWidth)
	line	241
	
i1l3678:	
;common.c: 241: setPWM_Width(uiInitWidth);
	movf	(vPutSampleDataIntoTable@uiInitWidth),w
	fcall	_setPWM_Width
	goto	i1l1555
	line	248
	
i1l3680:	
;common.c: 246: else
;common.c: 247: {
;common.c: 248: ucCh12Length = 0;
	clrf	(vPutSampleDataIntoTable@ucCh12Length)
	line	250
	
i1l3682:	
;common.c: 250: uiSampleCh12[ucCh12Length] = uiSampleData;
	clrc
	rlf	(vPutSampleDataIntoTable@ucCh12Length),w
	addlw	_uiSampleCh12&0ffh
	movwf	fsr0
	movf	(vPutSampleDataIntoTable@uiSampleData),w
	bcf	status, 7	;select IRP bank1
	movwf	indf
	incf	fsr0,f
	movf	(vPutSampleDataIntoTable@uiSampleData+1),w
	movwf	indf
	goto	i1l1555
	line	253
	
i1l3684:	
;common.c: 253: else if(channel == 13)
	movf	(vPutSampleDataIntoTable@channel),w
	xorlw	0Dh
	skipz
	goto	u132_21
	goto	u132_20
u132_21:
	goto	i1l3696
u132_20:
	line	255
	
i1l3686:	
;common.c: 254: {
;common.c: 255: if(ucCh13Length < 8)
	movlw	(08h)
	bcf	status, 5	;RP0=0, select bank0
	subwf	(vPutSampleDataIntoTable@ucCh13Length),w
	skipnc
	goto	u133_21
	goto	u133_20
u133_21:
	goto	i1l3692
u133_20:
	line	257
	
i1l3688:	
;common.c: 256: {
;common.c: 257: uiSampleCh13[ucCh13Length] = uiSampleData;
	clrc
	rlf	(vPutSampleDataIntoTable@ucCh13Length),w
	addlw	_uiSampleCh13&0ffh
	movwf	fsr0
	movf	(vPutSampleDataIntoTable@uiSampleData),w
	bcf	status, 7	;select IRP bank1
	movwf	indf
	incf	fsr0,f
	movf	(vPutSampleDataIntoTable@uiSampleData+1),w
	movwf	indf
	line	259
	
i1l3690:	
;common.c: 259: ucCh13Length++;
	incf	(vPutSampleDataIntoTable@ucCh13Length),f
	line	260
;common.c: 260: }
	goto	i1l1555
	line	263
	
i1l3692:	
;common.c: 261: else
;common.c: 262: {
;common.c: 263: ucCh13Length = 0;
	clrf	(vPutSampleDataIntoTable@ucCh13Length)
	line	265
	
i1l3694:	
;common.c: 265: uiSampleCh13[ucCh13Length] = uiSampleData;
	clrc
	rlf	(vPutSampleDataIntoTable@ucCh13Length),w
	addlw	_uiSampleCh13&0ffh
	movwf	fsr0
	movf	(vPutSampleDataIntoTable@uiSampleData),w
	bcf	status, 7	;select IRP bank1
	movwf	indf
	incf	fsr0,f
	movf	(vPutSampleDataIntoTable@uiSampleData+1),w
	movwf	indf
	goto	i1l1555
	line	268
	
i1l3696:	
;common.c: 268: else if(channel == 14)
	movf	(vPutSampleDataIntoTable@channel),w
	xorlw	0Eh
	skipz
	goto	u134_21
	goto	u134_20
u134_21:
	goto	i1l3708
u134_20:
	line	270
	
i1l3698:	
;common.c: 269: {
;common.c: 270: if(ucChannelFourteenthLength < 3)
	movlw	(03h)
	bcf	status, 5	;RP0=0, select bank0
	subwf	(vPutSampleDataIntoTable@ucChannelFourteenthLength),w
	skipnc
	goto	u135_21
	goto	u135_20
u135_21:
	goto	i1l3704
u135_20:
	line	272
	
i1l3700:	
;common.c: 271: {
;common.c: 272: uiSampleChannelFourteenth[ucChannelFourteenthLength] = uiSampleData;
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
	line	274
	
i1l3702:	
;common.c: 274: ucChannelFourteenthLength++;
	incf	(vPutSampleDataIntoTable@ucChannelFourteenthLength),f
	line	275
;common.c: 275: }
	goto	i1l1555
	line	278
	
i1l3704:	
;common.c: 276: else
;common.c: 277: {
;common.c: 278: ucChannelFourteenthLength = 0;
	clrf	(vPutSampleDataIntoTable@ucChannelFourteenthLength)
	line	280
	
i1l3706:	
;common.c: 280: uiSampleCh13[ucChannelFourteenthLength] = uiSampleData;
	clrc
	rlf	(vPutSampleDataIntoTable@ucChannelFourteenthLength),w
	addlw	_uiSampleCh13&0ffh
	movwf	fsr0
	movf	(vPutSampleDataIntoTable@uiSampleData),w
	bcf	status, 7	;select IRP bank1
	movwf	indf
	incf	fsr0,f
	movf	(vPutSampleDataIntoTable@uiSampleData+1),w
	movwf	indf
	goto	i1l1555
	line	285
	
i1l3708:	
;common.c: 283: else
;common.c: 284: {
;common.c: 285: ucCh12Length = 0;
	clrf	(vPutSampleDataIntoTable@ucCh12Length)
	line	287
;common.c: 287: ucCh13Length = 0;
	bcf	status, 5	;RP0=0, select bank0
	clrf	(vPutSampleDataIntoTable@ucCh13Length)
	line	289
;common.c: 289: ucChannelFourteenthLength = 0;
	clrf	(vPutSampleDataIntoTable@ucChannelFourteenthLength)
	line	291
;common.c: 291: for(int i = 0;i < 3; i++)
	clrf	(vPutSampleDataIntoTable@i)
	clrf	(vPutSampleDataIntoTable@i+1)
	line	293
	
i1l3714:	
;common.c: 292: {
;common.c: 293: uiSampleCh12[i] = 0;
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	clrc
	rlf	(vPutSampleDataIntoTable@i),w
	addlw	_uiSampleCh12&0ffh
	movwf	fsr0
	bcf	status, 7	;select IRP bank1
	clrf	indf
	incf	fsr0,f
	clrf	indf
	line	295
;common.c: 295: uiSampleCh13[i] = 0;
	clrc
	rlf	(vPutSampleDataIntoTable@i),w
	addlw	_uiSampleCh13&0ffh
	movwf	fsr0
	clrf	indf
	incf	fsr0,f
	clrf	indf
	line	297
;common.c: 297: uiSampleChannelFourteenth[i] = 0;
	clrc
	rlf	(vPutSampleDataIntoTable@i),w
	addlw	_uiSampleChannelFourteenth&0ffh
	movwf	fsr0
	clrf	indf
	incf	fsr0,f
	clrf	indf
	line	291
	
i1l3716:	
	incf	(vPutSampleDataIntoTable@i),f
	skipnz
	incf	(vPutSampleDataIntoTable@i+1),f
	
i1l3718:	
	movf	(vPutSampleDataIntoTable@i+1),w
	xorlw	80h
	movwf	btemp+1
	movlw	(high(03h))^80h
	subwf	btemp+1,w
	skipz
	goto	u136_25
	movlw	low(03h)
	subwf	(vPutSampleDataIntoTable@i),w
u136_25:

	skipc
	goto	u136_21
	goto	u136_20
u136_21:
	goto	i1l3714
u136_20:
	line	301
	
i1l1555:	
	return
	opt stack 0
GLOBAL	__end_of_vPutSampleDataIntoTable
	__end_of_vPutSampleDataIntoTable:
;; =============== function _vPutSampleDataIntoTable ends ============

	signat	_vPutSampleDataIntoTable,8312
	global	i1_setAD_ConvertFlag
psect	text1253,local,class=CODE,delta=2
global __ptext1253
__ptext1253:

;; *************** function i1_setAD_ConvertFlag *****************
;; Defined at:
;;		line 339 in file "D:\develop\AK7030-good\AK7030-OTP\common.c"
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
psect	text1253
	file	"D:\develop\AK7030-good\AK7030-OTP\common.c"
	line	339
	global	__size_ofi1_setAD_ConvertFlag
	__size_ofi1_setAD_ConvertFlag	equ	__end_ofi1_setAD_ConvertFlag-i1_setAD_ConvertFlag
	
i1_setAD_ConvertFlag:	
	opt	stack 4
; Regs used in i1_setAD_ConvertFlag: [wreg]
;i1setAD_ConvertFlag@flag stored from wreg
	movwf	(i1setAD_ConvertFlag@flag)
	line	340
	
i1l3778:	
;common.c: 340: adc_convert_flag = flag;
	movf	(i1setAD_ConvertFlag@flag),w
	movwf	(_adc_convert_flag)
	line	341
	
i1l1573:	
	return
	opt stack 0
GLOBAL	__end_ofi1_setAD_ConvertFlag
	__end_ofi1_setAD_ConvertFlag:
;; =============== function i1_setAD_ConvertFlag ends ============

	signat	i1_setAD_ConvertFlag,88
	global	_adc_get
psect	text1254,local,class=CODE,delta=2
global __ptext1254
__ptext1254:

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
psect	text1254
	file	"D:\develop\AK7030-good\AK7030-OTP\periph.c"
	line	106
	global	__size_of_adc_get
	__size_of_adc_get	equ	__end_of_adc_get-_adc_get
	
_adc_get:	
	opt	stack 4
; Regs used in _adc_get: [wreg]
	line	108
	
i1l3774:	
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
	
i1l2325:	
	return
	opt stack 0
GLOBAL	__end_of_adc_get
	__end_of_adc_get:
;; =============== function _adc_get ends ============

	signat	_adc_get,90
	global	_Filter
psect	text1255,local,class=CODE,delta=2
global __ptext1255
__ptext1255:

;; *************** function _Filter *****************
;; Defined at:
;;		line 116 in file "D:\develop\AK7030-good\AK7030-OTP\common.c"
;; Parameters:    Size  Location     Type
;;  tmpValue        1    wreg     PTR int 
;;		 -> uiSampleChannelFourteenth(6), uiSampleCh12(6), 
;; Auto vars:     Size  Location     Type
;;  tmpValue        1    4[BANK0 ] PTR int 
;;		 -> uiSampleChannelFourteenth(6), uiSampleCh12(6), 
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
psect	text1255
	file	"D:\develop\AK7030-good\AK7030-OTP\common.c"
	line	116
	global	__size_of_Filter
	__size_of_Filter	equ	__end_of_Filter-_Filter
	
_Filter:	
	opt	stack 3
; Regs used in _Filter: [wreg-fsr0h+status,2+status,0+btemp+1]
;Filter@tmpValue stored from wreg
	line	118
	bcf	status, 5	;RP0=0, select bank0
	movwf	(Filter@tmpValue)
	
i1l3582:	
	clrf	(Filter@j)
	line	120
;common.c: 120: unsigned int filter_temp = 0, filter_sum = 0;
	clrf	(Filter@filter_temp)
	clrf	(Filter@filter_temp+1)
	clrf	(Filter@filter_sum)
	clrf	(Filter@filter_sum+1)
	line	124
;common.c: 122: unsigned int filter_buf[3];
;common.c: 124: for(int cir = 0;cir < 3; cir++)
	clrf	(Filter@cir)
	clrf	(Filter@cir+1)
	line	125
	
i1l3588:	
;common.c: 125: filter_buf[cir] = *tmpValue++;
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
	
i1l3590:	
	incf	(Filter@tmpValue),f
	incf	(Filter@tmpValue),f
	line	124
	
i1l3592:	
	incf	(Filter@cir),f
	skipnz
	incf	(Filter@cir+1),f
	
i1l3594:	
	movf	(Filter@cir+1),w
	xorlw	80h
	movwf	btemp+1
	movlw	(high(03h))^80h
	subwf	btemp+1,w
	skipz
	goto	u117_25
	movlw	low(03h)
	subwf	(Filter@cir),w
u117_25:

	skipc
	goto	u117_21
	goto	u117_20
u117_21:
	goto	i1l3588
u117_20:
	line	129
	
i1l3596:	
;common.c: 129: for(j = 0; j < 3 - 1; j++)
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	clrf	(Filter@j)
	line	131
	
i1l3602:	
;common.c: 130: {
;common.c: 131: for(i = 0; i < 3 - 1 - j; i++)
	clrf	(Filter@i)
	goto	i1l3610
	line	133
	
i1l3604:	
;common.c: 132: {
;common.c: 133: if(filter_buf[i] > filter_buf[i + 1])
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
	goto	u118_25
	movf	0+(??_Filter+0)+0,w
	subwf	0+(??_Filter+2)+0,w
u118_25:
	skipnc
	goto	u118_21
	goto	u118_20
u118_21:
	goto	i1l3608
u118_20:
	line	136
	
i1l3606:	
;common.c: 134: {
;common.c: 136: filter_temp = filter_buf[i];
	clrc
	rlf	(Filter@i),w
	addlw	Filter@filter_buf&0ffh
	movwf	fsr0
	movf	indf,w
	movwf	(Filter@filter_temp)
	incf	fsr0,f
	movf	indf,w
	movwf	(Filter@filter_temp+1)
	line	138
;common.c: 138: filter_buf[i] = filter_buf[i + 1];
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
	line	140
;common.c: 140: filter_buf[i + 1] = filter_temp;
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
	line	131
	
i1l3608:	
	incf	(Filter@i),f
	
i1l3610:	
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
	goto	u119_25
	movf	0+(??_Filter+0)+0,w
	subwf	(Filter@i),w
u119_25:

	skipc
	goto	u119_21
	goto	u119_20
u119_21:
	goto	i1l3604
u119_20:
	line	129
	
i1l3612:	
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	incf	(Filter@j),f
	
i1l3614:	
	movlw	(02h)
	subwf	(Filter@j),w
	skipc
	goto	u120_21
	goto	u120_20
u120_21:
	goto	i1l3602
u120_20:
	
i1l1501:	
	line	145
;common.c: 141: }
;common.c: 142: }
;common.c: 143: }
;common.c: 145: for(i = 1; i < 3 - 1; i++)
	clrf	(Filter@i)
	incf	(Filter@i),f
	line	147
	
i1l3620:	
;common.c: 146: {
;common.c: 147: filter_sum += filter_buf[i];
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
	line	145
	
i1l3622:	
	incf	(Filter@i),f
	
i1l3624:	
	movlw	(02h)
	subwf	(Filter@i),w
	skipc
	goto	u121_21
	goto	u121_20
u121_21:
	goto	i1l3620
u121_20:
	line	151
	
i1l3626:	
;common.c: 148: }
;common.c: 151: return (filter_sum );
	movf	(Filter@filter_sum+1),w
	movwf	(?_Filter+1)
	movf	(Filter@filter_sum),w
	movwf	(?_Filter)
	line	153
	
i1l1508:	
	return
	opt stack 0
GLOBAL	__end_of_Filter
	__end_of_Filter:
;; =============== function _Filter ends ============

	signat	_Filter,4218
	global	_setPWM_Width
psect	text1256,local,class=CODE,delta=2
global __ptext1256
__ptext1256:

;; *************** function _setPWM_Width *****************
;; Defined at:
;;		line 65 in file "D:\develop\AK7030-good\AK7030-OTP\common.c"
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
psect	text1256
	file	"D:\develop\AK7030-good\AK7030-OTP\common.c"
	line	65
	global	__size_of_setPWM_Width
	__size_of_setPWM_Width	equ	__end_of_setPWM_Width-_setPWM_Width
	
_setPWM_Width:	
	opt	stack 3
; Regs used in _setPWM_Width: [wreg]
;setPWM_Width@ucWidth stored from wreg
	line	66
	movwf	(setPWM_Width@ucWidth)
	line	67
	
i1l3528:	
;common.c: 66: static unsigned char ucOldWidth = 0;
;common.c: 67: if( ucOldWidth != ucWidth)
	movf	(setPWM_Width@ucOldWidth),w
	xorwf	(setPWM_Width@ucWidth),w
	skipnz
	goto	u111_21
	goto	u111_20
u111_21:
	goto	i1l1482
u111_20:
	line	69
	
i1l3530:	
;common.c: 68: {
;common.c: 69: CCPR1L = ucWidth;
	movf	(setPWM_Width@ucWidth),w
	movwf	(21)	;volatile
	line	70
;common.c: 70: ucOldWidth = ucWidth;
	movf	(setPWM_Width@ucWidth),w
	movwf	(setPWM_Width@ucOldWidth)
	line	72
	
i1l1482:	
	return
	opt stack 0
GLOBAL	__end_of_setPWM_Width
	__end_of_setPWM_Width:
;; =============== function _setPWM_Width ends ============

	signat	_setPWM_Width,4216
	global	_getWaitResetFlag
psect	text1257,local,class=CODE,delta=2
global __ptext1257
__ptext1257:

;; *************** function _getWaitResetFlag *****************
;; Defined at:
;;		line 60 in file "D:\develop\AK7030-good\AK7030-OTP\common.c"
;; Parameters:    Size  Location     Type
;;		None
;; Auto vars:     Size  Location     Type
;;		None
;; Return value:  Size  Location     Type
;;                  1    wreg      unsigned char 
;; Registers used:
;;		wreg
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
;; This function calls:
;;		Nothing
;; This function is called by:
;;		_vPutSampleDataIntoTable
;; This function uses a non-reentrant model
;;
psect	text1257
	file	"D:\develop\AK7030-good\AK7030-OTP\common.c"
	line	60
	global	__size_of_getWaitResetFlag
	__size_of_getWaitResetFlag	equ	__end_of_getWaitResetFlag-_getWaitResetFlag
	
_getWaitResetFlag:	
	opt	stack 3
; Regs used in _getWaitResetFlag: [wreg]
	line	61
	
i1l3524:	
;common.c: 61: return bWaitResetFlag;
	movf	(_bWaitResetFlag),w
	line	62
	
i1l1476:	
	return
	opt stack 0
GLOBAL	__end_of_getWaitResetFlag
	__end_of_getWaitResetFlag:
;; =============== function _getWaitResetFlag ends ============

	signat	_getWaitResetFlag,89
psect	text1258,local,class=CODE,delta=2
global __ptext1258
__ptext1258:
	global	btemp
	btemp set 07Eh

	DABS	1,126,2	;btemp
	global	wtemp0
	wtemp0 set btemp
	end
