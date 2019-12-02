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
	dw 0X3FFF & 0x3F7F & 0x3FFF & 0x3FF8 ;#
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
	FNCALL	_main,_resetAllTimer
	FNCALL	_main,_setWaitResetFlag
	FNCALL	_main,_reset
	FNCALL	_getAdOriginalCh13Value,_FilterCh13
	FNCALL	_process_AD_Converter_Value,_getAD_ConvertFlag
	FNCALL	_process_AD_Converter_Value,_setAD_ConvertFlag
	FNCALL	_process_AD_Converter_Value,_AD_Sample
	FNCALL	_process_AD_Converter_Value,_adc_test_init
	FNCALL	_process_AD_Converter_Value,_adc_start
	FNCALL	_resetAllTimer,_clearTwelveHoursTimer
	FNCALL	_resetAllTimer,_clearThreeHoursTimer
	FNCALL	_resetAllTimer,_clearOneHoursTimer
	FNCALL	_resetAllTimer,_clearTwentyMinTimer
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
	line	192

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
	global	main@cTimerP5s_786
	global	main@cTimerP5s_792
	global	main@ucStep
	global	main@ucTimerP3s
	global	main@ucTimerP5s
	global	vPutSampleDataIntoTable@ucCh13Length
	global	vPutSampleDataIntoTable@ucChannelFourteenthLength
	global	vPutSampleDataIntoTable@ucCh12Length
	global	_uiTwentySecondsTimer
	global	main@ucDelay1s
	global	main@uiTimerOneP5s
	global	main@uiTimerTwoP5s
	global	vPutSampleDataIntoTable@uiCalWidthCnt
	global	_uiSampleCh12
	global	_uiSampleCh13
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
	line	192
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

main@uiTimerTwoP5s:
       ds      2

vPutSampleDataIntoTable@uiCalWidthCnt:
       ds      2

_uiSampleCh12:
       ds      6

_uiSampleCh13:
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
	movlw	low((__pbssBANK0)+01Ch)
	fcall	clear_ram
; Clear objects allocated to BANK1
psect cinit,class=CODE,delta=2
	movlw	low(__pbssBANK1)
	movwf	fsr
	movlw	low((__pbssBANK1)+01Ch)
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
	global	??_main
??_main:	; 0 bytes @ 0xF
	ds	1
	global	main@ucChValue
main@ucChValue:	; 2 bytes @ 0x10
	ds	2
	global	main@uiCh13Value
main@uiCh13Value:	; 2 bytes @ 0x12
	ds	2
psect	cstackCOMMON,class=COMMON,space=1
global __pcstackCOMMON
__pcstackCOMMON:
	global	?_clearTwelveHoursTimer
?_clearTwelveHoursTimer:	; 0 bytes @ 0x0
	global	?_clearThreeHoursTimer
?_clearThreeHoursTimer:	; 0 bytes @ 0x0
	global	?_clearOneHoursTimer
?_clearOneHoursTimer:	; 0 bytes @ 0x0
	global	?_clearTwentyMinTimer
?_clearTwentyMinTimer:	; 0 bytes @ 0x0
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
	global	?_resetAllTimer
?_resetAllTimer:	; 0 bytes @ 0x0
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
	global	??_clearTwelveHoursTimer
??_clearTwelveHoursTimer:	; 0 bytes @ 0x15
	global	??_clearThreeHoursTimer
??_clearThreeHoursTimer:	; 0 bytes @ 0x15
	global	??_clearOneHoursTimer
??_clearOneHoursTimer:	; 0 bytes @ 0x15
	global	??_clearTwentyMinTimer
??_clearTwentyMinTimer:	; 0 bytes @ 0x15
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
	global	?_startTwelveHourTimer
?_startTwelveHourTimer:	; 0 bytes @ 0x15
	global	??_isFinishedTwelveHoursTimer
??_isFinishedTwelveHoursTimer:	; 0 bytes @ 0x15
	global	?_startThreeHoursTimer
?_startThreeHoursTimer:	; 0 bytes @ 0x15
	global	??_isFinishedThreeHoursTimer
??_isFinishedThreeHoursTimer:	; 0 bytes @ 0x15
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
	global	??_resetAllTimer
??_resetAllTimer:	; 0 bytes @ 0x15
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
	global	?_getAdOriginalCh13Value
?_getAdOriginalCh13Value:	; 2 bytes @ 0x1B
	ds	2
	global	??_getAdOriginalCh13Value
??_getAdOriginalCh13Value:	; 0 bytes @ 0x1D
;;Data sizes: Strings 0, constant 0, data 2, bss 57, persistent 0 stack 0
;;Auto spaces:   Size  Autos    Used
;; COMMON          14     13      14
;; BANK0           80     29      59
;; BANK1           80     20      48
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
;; Filter@tmpValue	PTR unsigned int  size(1) Largest target is 6
;;		 -> uiSampleChannelFourteenth(BANK1[6]), uiSampleCh12(BANK1[6]), 
;;
;; FilterCh13@tmpValue	PTR unsigned int  size(1) Largest target is 6
;;		 -> uiSampleCh13(BANK1[6]), 
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
;;   _main->_getAdOriginalCh13Value
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
;;                                             15 BANK1      5     5      0
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
;;                      _resetAllTimer
;;                   _setWaitResetFlag
;;                              _reset
;; ---------------------------------------------------------------------------------
;; (1) _getAdOriginalCh13Value                               2     0      2     915
;;                                             27 BANK0      2     0      2
;;                         _FilterCh13
;; ---------------------------------------------------------------------------------
;; (1) _process_AD_Converter_Value                           0     0      0      93
;;                  _getAD_ConvertFlag
;;                  _setAD_ConvertFlag
;;                          _AD_Sample
;;                      _adc_test_init
;;                          _adc_start
;; ---------------------------------------------------------------------------------
;; (1) _resetAllTimer                                        0     0      0       0
;;              _clearTwelveHoursTimer
;;               _clearThreeHoursTimer
;;                 _clearOneHoursTimer
;;                _clearTwentyMinTimer
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
;; (1) _isFinishedThreeHoursTimer                            0     0      0       0
;; ---------------------------------------------------------------------------------
;; (1) _startThreeHoursTimer                                 2     0      2      31
;;                                             21 BANK0      2     0      2
;; ---------------------------------------------------------------------------------
;; (1) _isFinishedTwelveHoursTimer                           0     0      0       0
;; ---------------------------------------------------------------------------------
;; (1) _startTwelveHourTimer                                 2     0      2      31
;;                                             21 BANK0      2     0      2
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
;; (2) _clearTwentyMinTimer                                  0     0      0       0
;; ---------------------------------------------------------------------------------
;; (2) _clearOneHoursTimer                                   0     0      0       0
;; ---------------------------------------------------------------------------------
;; (2) _clearThreeHoursTimer                                 0     0      0       0
;; ---------------------------------------------------------------------------------
;; (2) _clearTwelveHoursTimer                                0     0      0       0
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
;; (3) _ISR                                                  4     4      0    1163
;;                                              9 COMMON     4     4      0
;;                i1_setAD_ConvertFlag
;;                            _adc_get
;;            _vPutSampleDataIntoTable
;; ---------------------------------------------------------------------------------
;; (4) _vPutSampleDataIntoTable                              9     6      3    1066
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
;; (5) _setPWM_Width                                         1     1      0      33
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
;;   _resetAllTimer
;;     _clearTwelveHoursTimer
;;     _clearThreeHoursTimer
;;     _clearOneHoursTimer
;;     _clearTwentyMinTimer
;;   _setWaitResetFlag
;;   _reset
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
;;BANK1               50     14      30       8       60.0%
;;BITBANK1            50      0       0       7        0.0%
;;CODE                 0      0       0       0        0.0%
;;DATA                 0      0      81       6        0.0%
;;ABS                  0      0      79       3        0.0%
;;NULL                 0      0       0       0        0.0%
;;STACK                0      0       8       2        0.0%
;;BANK0               50     1D      3B       5       73.8%
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
;;		line 516 in file "D:\develop\AK7030-good\AK7030-OTP\main.c"
;; Parameters:    Size  Location     Type
;;		None
;; Auto vars:     Size  Location     Type
;;  ucChValue       2   16[BANK1 ] unsigned int 
;;  uiCh13Value     2   18[BANK1 ] unsigned int 
;; Return value:  Size  Location     Type
;;                  2  732[COMMON] int 
;; Registers used:
;;		wreg, fsr0l, fsr0h, status,2, status,0, btemp+1, pclath, cstack
;; Tracked objects:
;;		On entry : 17F/0
;;		On exit  : 40/0
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
;;		_resetAllTimer
;;		_setWaitResetFlag
;;		_reset
;; This function is called by:
;;		Startup code after reset
;; This function uses a non-reentrant model
;;
psect	maintext
	file	"D:\develop\AK7030-good\AK7030-OTP\main.c"
	line	516
	global	__size_of_main
	__size_of_main	equ	__end_of_main-_main
	
_main:	
	opt	stack 3
; Regs used in _main: [wreg-fsr0h+status,2+status,0+btemp+1+pclath+cstack]
	line	544
	
l4256:	
;main.c: 517: enum systemStep {
;main.c: 518: INIT_STEP = 0,
;main.c: 519: START_UP_PWM_STEP,
;main.c: 520: CHECK_10_HOUR_TIMER_STEP,
;main.c: 521: STARTUP_3_HOUR_TIMER_STEP,
;main.c: 522: CHECK_3_HOUR_TIMER_STEP,
;main.c: 523: STARTUP_1_HOUR_TIMER_STEP,
;main.c: 524: CHECK_1_HOUR_TIMER_STEP,
;main.c: 525: READY_FOR_RESET_STEP = 99,
;main.c: 526: DELAY_ONE_SECOND_FOR_PWM,
;main.c: 527: MEET_RESET_CONDITION_STEP,
;main.c: 528: RESET_STEP,
;main.c: 529: };
;main.c: 531: static enum systemStep ucStep = INIT_STEP;
	fcall	_initPin
	line	545
;main.c: 545: setPinInitVaule();
	fcall	_setPinInitVaule
	line	546
	
l4258:	
;main.c: 546: selectAdChannel();
	fcall	_selectAdChannel
	line	548
	
l4260:	
;main.c: 548: clock_config();
	fcall	_clock_config
	line	549
	
l4262:	
;main.c: 549: timer1_config();
	fcall	_timer1_config
	line	550
	
l4264:	
;main.c: 550: timer1_interrupt_config();
	fcall	_timer1_interrupt_config
	line	552
;main.c: 552: adc_test_init(12,3);
	movlw	(03h)
	bcf	status, 5	;RP0=0, select bank0
	movwf	(?_adc_test_init)
	movlw	(0Ch)
	fcall	_adc_test_init
	line	558
;main.c: 558: startTwentyMinTimer( 60 );
	movlw	03Ch
	bcf	status, 5	;RP0=0, select bank0
	movwf	(?_startTwentyMinTimer)
	clrf	(?_startTwentyMinTimer+1)
	fcall	_startTwentyMinTimer
	line	559
	
l4266:	
;main.c: 559: _delay(1000);
	opt asmopt_off
movlw	249
	bsf	status, 5	;RP0=1, select bank1
movwf	(??_main+0)^080h+0,f
u2217:
	clrwdt
decfsz	(??_main+0)^080h+0,f
	goto	u2217
	nop2	;nop
	clrwdt
opt asmopt_on

	line	560
;main.c: 560: adc_start();
	fcall	_adc_start
	line	571
	
l4268:	
# 571 "D:\develop\AK7030-good\AK7030-OTP\main.c"
 clrwdt ;#
psect	maintext
	line	573
	
l4270:	
;main.c: 573: process_AD_Converter_Value();
	fcall	_process_AD_Converter_Value
	line	575
	
l4272:	
;main.c: 575: if( isPermitSampleTime() )
	fcall	_isPermitSampleTime
	xorlw	0
	skipnz
	goto	u2011
	goto	u2010
u2011:
	goto	l4268
u2010:
	line	579
	
l4274:	
;main.c: 576: {
;main.c: 579: clrSampeTime();
	fcall	_clrSampeTime
	line	588
;main.c: 588: switch(ucStep)
	goto	l4420
	line	599
	
l4276:	
;main.c: 592: {
;main.c: 597: static unsigned char ucTimerP3s = 0;
;main.c: 599: if( isFinishedTwentyMinTimer() )
	fcall	_isFinishedTwentyMinTimer
	xorlw	0
	skipnz
	goto	u2021
	goto	u2020
u2021:
	goto	l4282
u2020:
	line	601
	
l4278:	
;main.c: 600: {
;main.c: 601: ucStep = READY_FOR_RESET_STEP;
	movlw	(063h)
	movwf	(main@ucStep)
	line	602
	
l4280:	
;main.c: 602: ucTimerP3s = 0;
	clrf	(main@ucTimerP3s)
	line	603
;main.c: 603: }
	goto	l4268
	line	606
	
l4282:	
;main.c: 604: else
;main.c: 605: {
;main.c: 606: if( getAdOriginalCh13Value() > 90 )
	fcall	_getAdOriginalCh13Value
	movlw	high(05Bh)
	subwf	(1+(?_getAdOriginalCh13Value)),w
	movlw	low(05Bh)
	skipnz
	subwf	(0+(?_getAdOriginalCh13Value)),w
	skipc
	goto	u2031
	goto	u2030
u2031:
	goto	l4286
u2030:
	line	608
	
l4284:	
;main.c: 607: {
;main.c: 608: ucTimerP3s++;
	incf	(main@ucTimerP3s),f
	line	609
;main.c: 609: }
	goto	l4288
	line	611
	
l4286:	
;main.c: 610: else
;main.c: 611: ucTimerP3s = 0;
	clrf	(main@ucTimerP3s)
	line	613
	
l4288:	
;main.c: 613: if( ucTimerP3s >= 30)
	movlw	(01Eh)
	subwf	(main@ucTimerP3s),w
	skipc
	goto	u2041
	goto	u2040
u2041:
	goto	l736
u2040:
	line	615
	
l4290:	
;main.c: 614: {
;main.c: 615: ucTimerP3s = 0;
	clrf	(main@ucTimerP3s)
	line	616
	
l4292:	
;main.c: 616: ucStep = START_UP_PWM_STEP;
	clrf	(main@ucStep)
	incf	(main@ucStep),f
	goto	l4268
	line	632
	
l4294:	
;main.c: 627: {
;main.c: 632: pwm_start(150,249);
	movlw	(0F9h)
	movwf	(?_pwm_start)
	movlw	(096h)
	fcall	_pwm_start
	line	634
;main.c: 634: setPB3(0);
	movlw	(0)
	fcall	_setPB3
	line	635
;main.c: 635: setPB4(1);
	movlw	(01h)
	fcall	_setPB4
	line	636
;main.c: 636: setPB5(0);
	movlw	(0)
	fcall	_setPB5
	line	637
	
l4296:	
;main.c: 637: clearTwentyMinTimer();
	fcall	_clearTwentyMinTimer
	line	638
	
l4298:	
;main.c: 638: startTwelveHourTimer( 240);
	movlw	0F0h
	movwf	(?_startTwelveHourTimer)
	clrf	(?_startTwelveHourTimer+1)
	fcall	_startTwelveHourTimer
	line	639
	
l4300:	
;main.c: 639: ucStep = CHECK_10_HOUR_TIMER_STEP;
	movlw	(02h)
	movwf	(main@ucStep)
	line	640
;main.c: 640: break;
	goto	l4268
	line	651
	
l4302:	
;main.c: 644: {
;main.c: 649: static unsigned char ucTimerP5s = 0;
;main.c: 651: if( isFinishedTwelveHoursTimer () )
	fcall	_isFinishedTwelveHoursTimer
	xorlw	0
	skipnz
	goto	u2051
	goto	u2050
u2051:
	goto	l4306
u2050:
	line	652
	
l4304:	
;main.c: 652: ucStep = READY_FOR_RESET_STEP;
	movlw	(063h)
	movwf	(main@ucStep)
	goto	l4268
	line	655
	
l4306:	
;main.c: 653: else
;main.c: 654: {
;main.c: 655: if( getAdOriginalCh13Value() < 200 )
	fcall	_getAdOriginalCh13Value
	movlw	high(0C8h)
	subwf	(1+(?_getAdOriginalCh13Value)),w
	movlw	low(0C8h)
	skipnz
	subwf	(0+(?_getAdOriginalCh13Value)),w
	skipnc
	goto	u2061
	goto	u2060
u2061:
	goto	l4310
u2060:
	line	656
	
l4308:	
;main.c: 656: ucTimerP5s++;
	incf	(main@ucTimerP5s),f
	goto	l4312
	line	658
	
l4310:	
;main.c: 657: else
;main.c: 658: ucTimerP5s = 0;
	clrf	(main@ucTimerP5s)
	line	660
	
l4312:	
;main.c: 660: if( ucTimerP5s >= 10)
	movlw	(0Ah)
	subwf	(main@ucTimerP5s),w
	skipc
	goto	u2071
	goto	u2070
u2071:
	goto	l736
u2070:
	line	662
	
l4314:	
;main.c: 661: {
;main.c: 662: ucTimerP5s = 0;
	clrf	(main@ucTimerP5s)
	line	663
	
l4316:	
;main.c: 663: ucStep = STARTUP_3_HOUR_TIMER_STEP;
	movlw	(03h)
	movwf	(main@ucStep)
	goto	l4268
	line	672
	
l4318:	
;main.c: 671: {
;main.c: 672: clearTwelveHoursTimer();
	fcall	_clearTwelveHoursTimer
	line	673
	
l4320:	
;main.c: 673: startThreeHoursTimer(180);
	movlw	0B4h
	movwf	(?_startThreeHoursTimer)
	clrf	(?_startThreeHoursTimer+1)
	fcall	_startThreeHoursTimer
	line	674
;main.c: 674: ucStep = CHECK_3_HOUR_TIMER_STEP;
	movlw	(04h)
	movwf	(main@ucStep)
	line	675
;main.c: 675: break;
	goto	l4268
	line	682
	
l4322:	
;main.c: 679: {
;main.c: 680: static unsigned char ucTimerP5s = 0;
;main.c: 682: if( isFinishedThreeHoursTimer() )
	fcall	_isFinishedThreeHoursTimer
	xorlw	0
	skipnz
	goto	u2081
	goto	u2080
u2081:
	goto	l4326
u2080:
	goto	l4304
	line	686
	
l4326:	
;main.c: 684: else
;main.c: 685: {
;main.c: 686: if( getAdOriginalCh13Value() < 65 )
	fcall	_getAdOriginalCh13Value
	movlw	high(041h)
	subwf	(1+(?_getAdOriginalCh13Value)),w
	movlw	low(041h)
	skipnz
	subwf	(0+(?_getAdOriginalCh13Value)),w
	skipnc
	goto	u2091
	goto	u2090
u2091:
	goto	l4330
u2090:
	line	687
	
l4328:	
;main.c: 687: ucTimerP5s++;
	incf	(main@cTimerP5s_786),f
	goto	l4332
	line	689
	
l4330:	
;main.c: 688: else
;main.c: 689: ucTimerP5s = 0;
	clrf	(main@cTimerP5s_786)
	line	691
	
l4332:	
;main.c: 691: if( ucTimerP5s >= 10)
	movlw	(0Ah)
	subwf	(main@cTimerP5s_786),w
	skipc
	goto	u2101
	goto	u2100
u2101:
	goto	l736
u2100:
	line	693
	
l4334:	
;main.c: 692: {
;main.c: 693: ucTimerP5s = 0;
	clrf	(main@cTimerP5s_786)
	line	694
	
l4336:	
;main.c: 694: ucStep = STARTUP_1_HOUR_TIMER_STEP;
	movlw	(05h)
	movwf	(main@ucStep)
	goto	l4268
	line	702
	
l4338:	
;main.c: 701: {
;main.c: 702: clearThreeHoursTimer();
	fcall	_clearThreeHoursTimer
	line	703
	
l4340:	
;main.c: 703: startOneHoursTimer( 120 );
	movlw	078h
	movwf	(?_startOneHoursTimer)
	clrf	(?_startOneHoursTimer+1)
	fcall	_startOneHoursTimer
	line	704
	
l4342:	
;main.c: 704: setPB3(1);
	movlw	(01h)
	fcall	_setPB3
	line	705
	
l4344:	
;main.c: 705: setPB4(0);
	movlw	(0)
	fcall	_setPB4
	line	706
	
l4346:	
;main.c: 706: setPB5(1);
	movlw	(01h)
	fcall	_setPB5
	line	707
	
l4348:	
;main.c: 707: ucStep = CHECK_1_HOUR_TIMER_STEP;
	movlw	(06h)
	movwf	(main@ucStep)
	line	708
;main.c: 708: break;
	goto	l4268
	line	721
	
l4350:	
;main.c: 712: {
;main.c: 717: static unsigned int uiTimerOneP5s = 0;
;main.c: 718: static unsigned int uiTimerTwoP5s = 0;
;main.c: 719: static unsigned int uiTimerThreeP5s = 0;
;main.c: 721: unsigned int uiCh13Value = getAdOriginalCh13Value();
	fcall	_getAdOriginalCh13Value
	movf	(1+(?_getAdOriginalCh13Value)),w
	bsf	status, 5	;RP0=1, select bank1
	movwf	(main@uiCh13Value+1)^080h
	bcf	status, 5	;RP0=0, select bank0
	movf	(0+(?_getAdOriginalCh13Value)),w
	bsf	status, 5	;RP0=1, select bank1
	movwf	(main@uiCh13Value)^080h
	line	724
	
l4352:	
;main.c: 724: if( isFinishedOneHoursTimer() )
	fcall	_isFinishedOneHoursTimer
	xorlw	0
	skipnz
	goto	u2111
	goto	u2110
u2111:
	goto	l4356
u2110:
	goto	l4304
	line	728
	
l4356:	
;main.c: 726: else
;main.c: 727: {
;main.c: 728: if( uiCh13Value > 90 )
	movlw	high(05Bh)
	bsf	status, 5	;RP0=1, select bank1
	subwf	(main@uiCh13Value+1)^080h,w
	movlw	low(05Bh)
	skipnz
	subwf	(main@uiCh13Value)^080h,w
	skipc
	goto	u2121
	goto	u2120
u2121:
	goto	l4364
u2120:
	line	730
	
l4358:	
;main.c: 729: {
;main.c: 730: if( uiTimerOneP5s <= 10 )
	movlw	high(0Bh)
	subwf	(main@uiTimerOneP5s+1)^080h,w
	movlw	low(0Bh)
	skipnz
	subwf	(main@uiTimerOneP5s)^080h,w
	skipnc
	goto	u2131
	goto	u2130
u2131:
	goto	l4362
u2130:
	line	731
	
l4360:	
;main.c: 731: uiTimerOneP5s++;
	incf	(main@uiTimerOneP5s)^080h,f
	skipnz
	incf	(main@uiTimerOneP5s+1)^080h,f
	line	732
	
l4362:	
;main.c: 733: uiTimerThreeP5s = 0;
	clrf	(main@uiTimerTwoP5s)^080h
	clrf	(main@uiTimerTwoP5s+1)^080h
	line	734
;main.c: 734: }
	goto	l4366
	line	737
	
l4364:	
;main.c: 735: else
;main.c: 736: {
;main.c: 737: uiTimerOneP5s = 0;
	clrf	(main@uiTimerOneP5s)^080h
	clrf	(main@uiTimerOneP5s+1)^080h
	line	741
	
l4366:	
;main.c: 738: }
;main.c: 741: if(uiTimerOneP5s > 10)
	movlw	high(0Bh)
	subwf	(main@uiTimerOneP5s+1)^080h,w
	movlw	low(0Bh)
	skipnz
	subwf	(main@uiTimerOneP5s)^080h,w
	skipc
	goto	u2141
	goto	u2140
u2141:
	goto	l4378
u2140:
	line	743
	
l4368:	
;main.c: 742: {
;main.c: 743: setPB3(0);
	movlw	(0)
	fcall	_setPB3
	line	744
;main.c: 744: setPB4(1);
	movlw	(01h)
	fcall	_setPB4
	line	745
;main.c: 745: setPB5(0);
	movlw	(0)
	fcall	_setPB5
	line	747
	
l4370:	
;main.c: 747: uiTimerOneP5s = 0;
	bsf	status, 5	;RP0=1, select bank1
	clrf	(main@uiTimerOneP5s)^080h
	clrf	(main@uiTimerOneP5s+1)^080h
	line	748
	
l4372:	
;main.c: 748: uiTimerTwoP5s = 0;
	clrf	(main@uiTimerTwoP5s)^080h
	clrf	(main@uiTimerTwoP5s+1)^080h
	line	750
	
l4374:	
;main.c: 750: resetAllTimer();
	fcall	_resetAllTimer
	goto	l4292
	line	756
	
l4378:	
;main.c: 754: else
;main.c: 755: {
;main.c: 756: if( uiCh13Value < 65 )
	movlw	high(041h)
	subwf	(main@uiCh13Value+1)^080h,w
	movlw	low(041h)
	skipnz
	subwf	(main@uiCh13Value)^080h,w
	skipnc
	goto	u2151
	goto	u2150
u2151:
	goto	l4384
u2150:
	line	759
	
l4380:	
;main.c: 757: {
;main.c: 759: if( uiTimerTwoP5s <= 10)
	movlw	high(0Bh)
	subwf	(main@uiTimerTwoP5s+1)^080h,w
	movlw	low(0Bh)
	skipnz
	subwf	(main@uiTimerTwoP5s)^080h,w
	skipnc
	goto	u2161
	goto	u2160
u2161:
	goto	l4386
u2160:
	line	760
	
l4382:	
;main.c: 760: uiTimerTwoP5s++;
	incf	(main@uiTimerTwoP5s)^080h,f
	skipnz
	incf	(main@uiTimerTwoP5s+1)^080h,f
	goto	l4386
	line	764
	
l4384:	
;main.c: 765: uiTimerThreeP5s = 0;
	clrf	(main@uiTimerTwoP5s)^080h
	clrf	(main@uiTimerTwoP5s+1)^080h
	line	768
	
l4386:	
;main.c: 766: }
;main.c: 768: if(uiTimerTwoP5s > 10)
	movlw	high(0Bh)
	subwf	(main@uiTimerTwoP5s+1)^080h,w
	movlw	low(0Bh)
	skipnz
	subwf	(main@uiTimerTwoP5s)^080h,w
	skipc
	goto	u2171
	goto	u2170
u2171:
	goto	l736
u2170:
	line	770
	
l4388:	
;main.c: 769: {
;main.c: 770: setPB3(1);
	movlw	(01h)
	fcall	_setPB3
	line	771
;main.c: 771: setPB4(0);
	movlw	(0)
	fcall	_setPB4
	line	772
;main.c: 772: setPB5(1);
	movlw	(01h)
	fcall	_setPB5
	goto	l4268
	line	792
	
l4390:	
;main.c: 791: {
;main.c: 792: setPB3(0);
	movlw	(0)
	fcall	_setPB3
	line	793
;main.c: 793: setPB4(0);
	movlw	(0)
	fcall	_setPB4
	line	794
;main.c: 794: setPB5(1);
	movlw	(01h)
	fcall	_setPB5
	line	797
;main.c: 797: setWaitResetFlag(1);
	movlw	(01h)
	fcall	_setWaitResetFlag
	line	798
;main.c: 798: pwm_start(150,249);
	movlw	(0F9h)
	movwf	(?_pwm_start)
	movlw	(096h)
	fcall	_pwm_start
	line	804
	
l4392:	
;main.c: 804: ucStep = DELAY_ONE_SECOND_FOR_PWM;
	movlw	(064h)
	movwf	(main@ucStep)
	line	805
;main.c: 805: break;
	goto	l4268
	line	811
	
l4394:	
;main.c: 809: {
;main.c: 810: static unsigned ucDelay1s = 0;
;main.c: 811: if(ucDelay1s <= 50)
	movlw	high(033h)
	bsf	status, 5	;RP0=1, select bank1
	subwf	(main@ucDelay1s+1)^080h,w
	movlw	low(033h)
	skipnz
	subwf	(main@ucDelay1s)^080h,w
	skipnc
	goto	u2181
	goto	u2180
u2181:
	goto	l4398
u2180:
	line	812
	
l4396:	
;main.c: 812: ucDelay1s++;
	incf	(main@ucDelay1s)^080h,f
	skipnz
	incf	(main@ucDelay1s+1)^080h,f
	goto	l4268
	line	815
	
l4398:	
;main.c: 813: else
;main.c: 814: {
;main.c: 815: ucDelay1s = 0;
	clrf	(main@ucDelay1s)^080h
	clrf	(main@ucDelay1s+1)^080h
	line	816
	
l4400:	
;main.c: 816: ucStep = MEET_RESET_CONDITION_STEP;
	movlw	(065h)
	bcf	status, 5	;RP0=0, select bank0
	movwf	(main@ucStep)
	goto	l4268
	line	828
	
l4402:	
;main.c: 826: {
;main.c: 827: static unsigned char ucTimerP5s = 0;
;main.c: 828: unsigned int ucChValue = getAdOriginalCh13Value();
	fcall	_getAdOriginalCh13Value
	movf	(1+(?_getAdOriginalCh13Value)),w
	bsf	status, 5	;RP0=1, select bank1
	movwf	(main@ucChValue+1)^080h
	bcf	status, 5	;RP0=0, select bank0
	movf	(0+(?_getAdOriginalCh13Value)),w
	bsf	status, 5	;RP0=1, select bank1
	movwf	(main@ucChValue)^080h
	line	830
	
l4404:	
;main.c: 830: if( ucChValue > 50 )
	movlw	high(033h)
	subwf	(main@ucChValue+1)^080h,w
	movlw	low(033h)
	skipnz
	subwf	(main@ucChValue)^080h,w
	skipc
	goto	u2191
	goto	u2190
u2191:
	goto	l4408
u2190:
	line	831
	
l4406:	
;main.c: 831: ucTimerP5s++;
	bcf	status, 5	;RP0=0, select bank0
	incf	(main@cTimerP5s_792),f
	goto	l4410
	line	833
	
l4408:	
;main.c: 832: else
;main.c: 833: ucTimerP5s = 0;
	bcf	status, 5	;RP0=0, select bank0
	clrf	(main@cTimerP5s_792)
	line	835
	
l4410:	
;main.c: 835: if(ucTimerP5s >= 50)
	movlw	(032h)
	subwf	(main@cTimerP5s_792),w
	skipc
	goto	u2201
	goto	u2200
u2201:
	goto	l736
u2200:
	line	836
	
l4412:	
;main.c: 836: ucStep = RESET_STEP;
	movlw	(066h)
	movwf	(main@ucStep)
	goto	l4268
	line	842
	
l4414:	
;main.c: 841: {
;main.c: 842: ucStep = INIT_STEP;
	clrf	(main@ucStep)
	line	843
	
l4416:	
;main.c: 843: reset();
	fcall	_reset
	line	844
;main.c: 844: break;
	goto	l4268
	line	588
	
l4420:	
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
	goto	l4276
	xorlw	1^0	; case 1
	skipnz
	goto	l4294
	xorlw	2^1	; case 2
	skipnz
	goto	l4302
	xorlw	3^2	; case 3
	skipnz
	goto	l4318
	xorlw	4^3	; case 4
	skipnz
	goto	l4322
	xorlw	5^4	; case 5
	skipnz
	goto	l4338
	xorlw	6^5	; case 6
	skipnz
	goto	l4350
	xorlw	99^6	; case 99
	skipnz
	goto	l4390
	xorlw	100^99	; case 100
	skipnz
	goto	l4394
	xorlw	101^100	; case 101
	skipnz
	goto	l4402
	xorlw	102^101	; case 102
	skipnz
	goto	l4414
	goto	l736
	opt asmopt_on

	line	852
	
l736:	
	goto	l4268
	global	start
	ljmp	start
	opt stack 0
psect	maintext
	line	855
GLOBAL	__end_of_main
	__end_of_main:
;; =============== function _main ends ============

	signat	_main,90
	global	_getAdOriginalCh13Value
psect	text1272,local,class=CODE,delta=2
global __ptext1272
__ptext1272:

;; *************** function _getAdOriginalCh13Value *****************
;; Defined at:
;;		line 372 in file "D:\develop\AK7030-good\AK7030-OTP\common.c"
;; Parameters:    Size  Location     Type
;;		None
;; Auto vars:     Size  Location     Type
;;		None
;; Return value:  Size  Location     Type
;;                  2   27[BANK0 ] unsigned int 
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
;; Hardware stack levels required when called:    4
;; This function calls:
;;		_FilterCh13
;; This function is called by:
;;		_main
;; This function uses a non-reentrant model
;;
psect	text1272
	file	"D:\develop\AK7030-good\AK7030-OTP\common.c"
	line	372
	global	__size_of_getAdOriginalCh13Value
	__size_of_getAdOriginalCh13Value	equ	__end_of_getAdOriginalCh13Value-_getAdOriginalCh13Value
	
_getAdOriginalCh13Value:	
	opt	stack 3
; Regs used in _getAdOriginalCh13Value: [wreg-fsr0h+status,2+status,0+btemp+1+pclath+cstack]
	line	374
	
l4252:	
;common.c: 374: return FilterCh13(uiSampleCh13);
	movlw	(_uiSampleCh13)&0ffh
	fcall	_FilterCh13
	movf	(1+(?_FilterCh13)),w
	movwf	(?_getAdOriginalCh13Value+1)
	movf	(0+(?_FilterCh13)),w
	movwf	(?_getAdOriginalCh13Value)
	line	379
	
l1581:	
	return
	opt stack 0
GLOBAL	__end_of_getAdOriginalCh13Value
	__end_of_getAdOriginalCh13Value:
;; =============== function _getAdOriginalCh13Value ends ============

	signat	_getAdOriginalCh13Value,90
	global	_process_AD_Converter_Value
psect	text1273,local,class=CODE,delta=2
global __ptext1273
__ptext1273:

;; *************** function _process_AD_Converter_Value *****************
;; Defined at:
;;		line 394 in file "D:\develop\AK7030-good\AK7030-OTP\common.c"
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
psect	text1273
	file	"D:\develop\AK7030-good\AK7030-OTP\common.c"
	line	394
	global	__size_of_process_AD_Converter_Value
	__size_of_process_AD_Converter_Value	equ	__end_of_process_AD_Converter_Value-_process_AD_Converter_Value
	
_process_AD_Converter_Value:	
	opt	stack 3
; Regs used in _process_AD_Converter_Value: [wreg+status,2+status,0+pclath+cstack]
	line	395
	
l4240:	
;common.c: 395: if(getAD_ConvertFlag())
	fcall	_getAD_ConvertFlag
	xorlw	0
	skipnz
	goto	u1991
	goto	u1990
u1991:
	goto	l1590
u1990:
	line	397
	
l4242:	
;common.c: 396: {
;common.c: 397: setAD_ConvertFlag(0);
	movlw	(0)
	fcall	_setAD_ConvertFlag
	line	398
;common.c: 398: AD_Sample();
	fcall	_AD_Sample
	line	399
	
l4244:	
;common.c: 399: if(12 == sampleChannelSelect)
	movf	(_sampleChannelSelect),w
	xorlw	0Ch
	skipz
	goto	u2001
	goto	u2000
u2001:
	goto	l4248
u2000:
	line	400
	
l4246:	
;common.c: 400: adc_test_init(12,3);
	movlw	(03h)
	movwf	(?_adc_test_init)
	movlw	(0Ch)
	fcall	_adc_test_init
	goto	l4250
	line	402
	
l4248:	
;common.c: 401: else
;common.c: 402: adc_test_init(13,3);
	movlw	(03h)
	movwf	(?_adc_test_init)
	movlw	(0Dh)
	fcall	_adc_test_init
	line	403
	
l4250:	
;common.c: 403: adc_start();
	fcall	_adc_start
	line	405
	
l1590:	
	return
	opt stack 0
GLOBAL	__end_of_process_AD_Converter_Value
	__end_of_process_AD_Converter_Value:
;; =============== function _process_AD_Converter_Value ends ============

	signat	_process_AD_Converter_Value,88
	global	_resetAllTimer
psect	text1274,local,class=CODE,delta=2
global __ptext1274
__ptext1274:

;; *************** function _resetAllTimer *****************
;; Defined at:
;;		line 481 in file "D:\develop\AK7030-good\AK7030-OTP\main.c"
;; Parameters:    Size  Location     Type
;;		None
;; Auto vars:     Size  Location     Type
;;		None
;; Return value:  Size  Location     Type
;;		None               void
;; Registers used:
;;		status,2, status,0, pclath, cstack
;; Tracked objects:
;;		On entry : 160/20
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
;;		_clearTwelveHoursTimer
;;		_clearThreeHoursTimer
;;		_clearOneHoursTimer
;;		_clearTwentyMinTimer
;; This function is called by:
;;		_main
;; This function uses a non-reentrant model
;;
psect	text1274
	file	"D:\develop\AK7030-good\AK7030-OTP\main.c"
	line	481
	global	__size_of_resetAllTimer
	__size_of_resetAllTimer	equ	__end_of_resetAllTimer-_resetAllTimer
	
_resetAllTimer:	
	opt	stack 3
; Regs used in _resetAllTimer: [status,2+status,0+pclath+cstack]
	line	482
	
l4238:	
;main.c: 482: clearTwelveHoursTimer();
	fcall	_clearTwelveHoursTimer
	line	483
;main.c: 483: clearThreeHoursTimer();
	fcall	_clearThreeHoursTimer
	line	484
;main.c: 484: clearOneHoursTimer();
	fcall	_clearOneHoursTimer
	line	485
;main.c: 485: clearTwentyMinTimer();
	fcall	_clearTwentyMinTimer
	line	486
	
l730:	
	return
	opt stack 0
GLOBAL	__end_of_resetAllTimer
	__end_of_resetAllTimer:
;; =============== function _resetAllTimer ends ============

	signat	_resetAllTimer,88
	global	_setPinInitVaule
psect	text1275,local,class=CODE,delta=2
global __ptext1275
__ptext1275:

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
psect	text1275
	file	"D:\develop\AK7030-good\AK7030-OTP\main.c"
	line	272
	global	__size_of_setPinInitVaule
	__size_of_setPinInitVaule	equ	__end_of_setPinInitVaule-_setPinInitVaule
	
_setPinInitVaule:	
	opt	stack 3
; Regs used in _setPinInitVaule: [wreg+status,2+status,0+pclath+cstack]
	line	274
	
l4236:	
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
	
l718:	
	return
	opt stack 0
GLOBAL	__end_of_setPinInitVaule
	__end_of_setPinInitVaule:
;; =============== function _setPinInitVaule ends ============

	signat	_setPinInitVaule,88
	global	_initPin
psect	text1276,local,class=CODE,delta=2
global __ptext1276
__ptext1276:

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
psect	text1276
	file	"D:\develop\AK7030-good\AK7030-OTP\main.c"
	line	256
	global	__size_of_initPin
	__size_of_initPin	equ	__end_of_initPin-_initPin
	
_initPin:	
	opt	stack 3
; Regs used in _initPin: [wreg+status,2+status,0+pclath+cstack]
	line	258
	
l4228:	
;main.c: 258: initPB2_AsHighResistence();
	fcall	_initPB2_AsHighResistence
	line	260
	
l4230:	
;main.c: 260: initPB3(0);
	movlw	(0)
	fcall	_initPB3
	line	262
	
l4232:	
;main.c: 262: initPB4(0);
	movlw	(0)
	fcall	_initPB4
	line	264
	
l4234:	
;main.c: 264: initPB5(0);
	movlw	(0)
	fcall	_initPB5
	line	269
	
l715:	
	return
	opt stack 0
GLOBAL	__end_of_initPin
	__end_of_initPin:
;; =============== function _initPin ends ============

	signat	_initPin,88
	global	_AD_Sample
psect	text1277,local,class=CODE,delta=2
global __ptext1277
__ptext1277:

;; *************** function _AD_Sample *****************
;; Defined at:
;;		line 417 in file "D:\develop\AK7030-good\AK7030-OTP\common.c"
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
psect	text1277
	file	"D:\develop\AK7030-good\AK7030-OTP\common.c"
	line	417
	global	__size_of_AD_Sample
	__size_of_AD_Sample	equ	__end_of_AD_Sample-_AD_Sample
	
_AD_Sample:	
	opt	stack 3
; Regs used in _AD_Sample: [wreg+status,2+status,0]
	line	418
	
l4214:	
;common.c: 418: if(sampleTimes < 3)
	movlw	(03h)
	subwf	(_sampleTimes),w
	skipnc
	goto	u1961
	goto	u1960
u1961:
	goto	l1597
u1960:
	line	420
	
l4216:	
;common.c: 419: {
;common.c: 420: sampleTimes++;
	incf	(_sampleTimes),f
	line	422
	
l4218:	
;common.c: 422: if(sampleTimes >= 3)
	movlw	(03h)
	subwf	(_sampleTimes),w
	skipc
	goto	u1971
	goto	u1970
u1971:
	goto	l1597
u1970:
	line	424
	
l4220:	
;common.c: 423: {
;common.c: 424: sampleTimes = 0;
	clrf	(_sampleTimes)
	line	426
	
l4222:	
;common.c: 426: if(sampleChannelSelect == 12)
	movf	(_sampleChannelSelect),w
	xorlw	0Ch
	skipz
	goto	u1981
	goto	u1980
u1981:
	goto	l4226
u1980:
	line	428
	
l4224:	
;common.c: 427: {
;common.c: 428: sampleChannelSelect = 13;
	movlw	(0Dh)
	movwf	(_sampleChannelSelect)
	line	429
;common.c: 429: }
	goto	l1597
	line	433
	
l4226:	
;common.c: 431: else
;common.c: 432: {
;common.c: 433: sampleChannelSelect = 12;
	movlw	(0Ch)
	movwf	(_sampleChannelSelect)
	line	437
	
l1597:	
	return
	opt stack 0
GLOBAL	__end_of_AD_Sample
	__end_of_AD_Sample:
;; =============== function _AD_Sample ends ============

	signat	_AD_Sample,88
	global	_setAD_ConvertFlag
psect	text1278,local,class=CODE,delta=2
global __ptext1278
__ptext1278:

;; *************** function _setAD_ConvertFlag *****************
;; Defined at:
;;		line 349 in file "D:\develop\AK7030-good\AK7030-OTP\common.c"
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
psect	text1278
	file	"D:\develop\AK7030-good\AK7030-OTP\common.c"
	line	349
	global	__size_of_setAD_ConvertFlag
	__size_of_setAD_ConvertFlag	equ	__end_of_setAD_ConvertFlag-_setAD_ConvertFlag
	
_setAD_ConvertFlag:	
	opt	stack 3
; Regs used in _setAD_ConvertFlag: [wreg]
;setAD_ConvertFlag@flag stored from wreg
	movwf	(setAD_ConvertFlag@flag)
	line	350
	
l4212:	
;common.c: 350: adc_convert_flag = flag;
	movf	(setAD_ConvertFlag@flag),w
	movwf	(_adc_convert_flag)
	line	351
	
l1575:	
	return
	opt stack 0
GLOBAL	__end_of_setAD_ConvertFlag
	__end_of_setAD_ConvertFlag:
;; =============== function _setAD_ConvertFlag ends ============

	signat	_setAD_ConvertFlag,4216
	global	_getAD_ConvertFlag
psect	text1279,local,class=CODE,delta=2
global __ptext1279
__ptext1279:

;; *************** function _getAD_ConvertFlag *****************
;; Defined at:
;;		line 343 in file "D:\develop\AK7030-good\AK7030-OTP\common.c"
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
psect	text1279
	file	"D:\develop\AK7030-good\AK7030-OTP\common.c"
	line	343
	global	__size_of_getAD_ConvertFlag
	__size_of_getAD_ConvertFlag	equ	__end_of_getAD_ConvertFlag-_getAD_ConvertFlag
	
_getAD_ConvertFlag:	
	opt	stack 3
; Regs used in _getAD_ConvertFlag: [wreg]
	line	344
	
l4208:	
;common.c: 344: return adc_convert_flag;
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	movf	(_adc_convert_flag),w
	line	345
	
l1572:	
	return
	opt stack 0
GLOBAL	__end_of_getAD_ConvertFlag
	__end_of_getAD_ConvertFlag:
;; =============== function _getAD_ConvertFlag ends ============

	signat	_getAD_ConvertFlag,89
	global	_FilterCh13
psect	text1280,local,class=CODE,delta=2
global __ptext1280
__ptext1280:

;; *************** function _FilterCh13 *****************
;; Defined at:
;;		line 76 in file "D:\develop\AK7030-good\AK7030-OTP\common.c"
;; Parameters:    Size  Location     Type
;;  tmpValue        1    wreg     PTR unsigned int 
;;		 -> uiSampleCh13(6), 
;; Auto vars:     Size  Location     Type
;;  tmpValue        1    0[BANK1 ] PTR unsigned int 
;;		 -> uiSampleCh13(6), 
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
;;		On exit  : 160/0
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
psect	text1280
	file	"D:\develop\AK7030-good\AK7030-OTP\common.c"
	line	76
	global	__size_of_FilterCh13
	__size_of_FilterCh13	equ	__end_of_FilterCh13-_FilterCh13
	
_FilterCh13:	
	opt	stack 3
; Regs used in _FilterCh13: [wreg-fsr0h+status,2+status,0+btemp+1]
;FilterCh13@tmpValue stored from wreg
	bsf	status, 5	;RP0=1, select bank1
	movwf	(FilterCh13@tmpValue)^080h
	line	77
	
l4160:	
	clrf	(FilterCh13@j)^080h
	line	79
;common.c: 79: unsigned int filter_temp = 0, filter_sum = 0;
	clrf	(FilterCh13@filter_temp)^080h
	clrf	(FilterCh13@filter_temp+1)^080h
	clrf	(FilterCh13@filter_sum)^080h
	clrf	(FilterCh13@filter_sum+1)^080h
	line	83
;common.c: 81: unsigned int filter_buf[3];
;common.c: 83: for(int cir = 0;cir < 3; cir++)
	clrf	(FilterCh13@cir)^080h
	clrf	(FilterCh13@cir+1)^080h
	line	84
	
l4166:	
;common.c: 84: filter_buf[cir] = *tmpValue++;
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
	
l4168:	
	bsf	status, 5	;RP0=1, select bank1
	incf	(FilterCh13@tmpValue)^080h,f
	incf	(FilterCh13@tmpValue)^080h,f
	line	83
	
l4170:	
	incf	(FilterCh13@cir)^080h,f
	skipnz
	incf	(FilterCh13@cir+1)^080h,f
	
l4172:	
	movf	(FilterCh13@cir+1)^080h,w
	xorlw	80h
	movwf	btemp+1
	movlw	(high(03h))^80h
	subwf	btemp+1,w
	skipz
	goto	u1915
	movlw	low(03h)
	subwf	(FilterCh13@cir)^080h,w
u1915:

	skipc
	goto	u1911
	goto	u1910
u1911:
	goto	l4166
u1910:
	line	88
	
l4174:	
;common.c: 88: for(j = 0; j < 3 - 1; j++)
	bsf	status, 5	;RP0=1, select bank1
	bcf	status, 6	;RP1=0, select bank1
	clrf	(FilterCh13@j)^080h
	line	90
	
l4180:	
;common.c: 89: {
;common.c: 90: for(i = 0; i < 3 - 1 - j; i++)
	clrf	(FilterCh13@i)^080h
	goto	l4188
	line	92
	
l4182:	
;common.c: 91: {
;common.c: 92: if(filter_buf[i] > filter_buf[i + 1])
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
	goto	u1925
	movf	0+(??_FilterCh13+0)+0,w
	subwf	0+(??_FilterCh13+2)+0,w
u1925:
	skipnc
	goto	u1921
	goto	u1920
u1921:
	goto	l4186
u1920:
	line	95
	
l4184:	
;common.c: 93: {
;common.c: 95: filter_temp = filter_buf[i];
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
	line	97
;common.c: 97: filter_buf[i] = filter_buf[i + 1];
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
	line	99
;common.c: 99: filter_buf[i + 1] = filter_temp;
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
	line	90
	
l4186:	
	bsf	status, 5	;RP0=1, select bank1
	incf	(FilterCh13@i)^080h,f
	
l4188:	
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
	goto	u1935
	movf	0+(??_FilterCh13+0)+0,w
	bsf	status, 5	;RP0=1, select bank1
	subwf	(FilterCh13@i)^080h,w
u1935:

	skipc
	goto	u1931
	goto	u1930
u1931:
	goto	l4182
u1930:
	line	88
	
l4190:	
	bsf	status, 5	;RP0=1, select bank1
	bcf	status, 6	;RP1=0, select bank1
	incf	(FilterCh13@j)^080h,f
	
l4192:	
	movlw	(02h)
	subwf	(FilterCh13@j)^080h,w
	skipc
	goto	u1941
	goto	u1940
u1941:
	goto	l4180
u1940:
	
l1490:	
	line	104
;common.c: 100: }
;common.c: 101: }
;common.c: 102: }
;common.c: 104: for(i = 1; i < 3 - 1; i++)
	clrf	(FilterCh13@i)^080h
	incf	(FilterCh13@i)^080h,f
	line	106
	
l4198:	
;common.c: 105: {
;common.c: 106: filter_sum += filter_buf[i];
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
	movf	0+(??_FilterCh13+0)+0,w
	bsf	status, 5	;RP0=1, select bank1
	addwf	(FilterCh13@filter_sum)^080h,f
	skipnc
	incf	(FilterCh13@filter_sum+1)^080h,f
	bcf	status, 5	;RP0=0, select bank0
	movf	1+(??_FilterCh13+0)+0,w
	bsf	status, 5	;RP0=1, select bank1
	addwf	(FilterCh13@filter_sum+1)^080h,f
	line	104
	
l4200:	
	incf	(FilterCh13@i)^080h,f
	
l4202:	
	movlw	(02h)
	subwf	(FilterCh13@i)^080h,w
	skipc
	goto	u1951
	goto	u1950
u1951:
	goto	l4198
u1950:
	line	110
	
l4204:	
;common.c: 107: }
;common.c: 110: return (filter_sum >> 0 );
	movf	(FilterCh13@filter_sum+1)^080h,w
	bcf	status, 5	;RP0=0, select bank0
	movwf	(?_FilterCh13+1)
	bsf	status, 5	;RP0=1, select bank1
	movf	(FilterCh13@filter_sum)^080h,w
	bcf	status, 5	;RP0=0, select bank0
	movwf	(?_FilterCh13)
	line	111
	
l1497:	
	return
	opt stack 0
GLOBAL	__end_of_FilterCh13
	__end_of_FilterCh13:
;; =============== function _FilterCh13 ends ============

	signat	_FilterCh13,4218
	global	_setWaitResetFlag
psect	text1281,local,class=CODE,delta=2
global __ptext1281
__ptext1281:

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
psect	text1281
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
	
l4158:	
;common.c: 56: bWaitResetFlag = bValue;
	movf	(setWaitResetFlag@bValue),w
	movwf	(_bWaitResetFlag)
	line	57
	
l1475:	
	return
	opt stack 0
GLOBAL	__end_of_setWaitResetFlag
	__end_of_setWaitResetFlag:
;; =============== function _setWaitResetFlag ends ============

	signat	_setWaitResetFlag,4216
	global	_isFinishedOneHoursTimer
psect	text1282,local,class=CODE,delta=2
global __ptext1282
__ptext1282:

;; *************** function _isFinishedOneHoursTimer *****************
;; Defined at:
;;		line 583 in file "D:\develop\AK7030-good\AK7030-OTP\common.c"
;; Parameters:    Size  Location     Type
;;		None
;; Auto vars:     Size  Location     Type
;;		None
;; Return value:  Size  Location     Type
;;                  1    wreg      unsigned char 
;; Registers used:
;;		wreg, status,2, status,0
;; Tracked objects:
;;		On entry : 160/20
;;		On exit  : 160/0
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
;;		Nothing
;; This function is called by:
;;		_main
;; This function uses a non-reentrant model
;;
psect	text1282
	file	"D:\develop\AK7030-good\AK7030-OTP\common.c"
	line	583
	global	__size_of_isFinishedOneHoursTimer
	__size_of_isFinishedOneHoursTimer	equ	__end_of_isFinishedOneHoursTimer-_isFinishedOneHoursTimer
	
_isFinishedOneHoursTimer:	
	opt	stack 4
; Regs used in _isFinishedOneHoursTimer: [wreg+status,2+status,0]
	line	584
	
l4142:	
;common.c: 584: if((uiOneHourTimer == 0) && bOneHourTimerStartFlag)
	bcf	status, 5	;RP0=0, select bank0
	movf	((_uiOneHourTimer+1)),w
	iorwf	((_uiOneHourTimer)),w
	skipz
	goto	u1891
	goto	u1890
u1891:
	goto	l4154
u1890:
	
l4144:	
	movf	(_bOneHourTimerStartFlag),w
	skipz
	goto	u1900
	goto	l4154
u1900:
	line	586
	
l4146:	
;common.c: 585: {
;common.c: 586: bOneHourTimerStartFlag = 0;
	clrf	(_bOneHourTimerStartFlag)
	line	587
	
l4148:	
;common.c: 587: return 1;
	movlw	(01h)
	goto	l1647
	line	590
	
l4154:	
;common.c: 589: else
;common.c: 590: return 0;
	movlw	(0)
	line	591
	
l1647:	
	return
	opt stack 0
GLOBAL	__end_of_isFinishedOneHoursTimer
	__end_of_isFinishedOneHoursTimer:
;; =============== function _isFinishedOneHoursTimer ends ============

	signat	_isFinishedOneHoursTimer,89
	global	_startOneHoursTimer
psect	text1283,local,class=CODE,delta=2
global __ptext1283
__ptext1283:

;; *************** function _startOneHoursTimer *****************
;; Defined at:
;;		line 500 in file "D:\develop\AK7030-good\AK7030-OTP\common.c"
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
psect	text1283
	file	"D:\develop\AK7030-good\AK7030-OTP\common.c"
	line	500
	global	__size_of_startOneHoursTimer
	__size_of_startOneHoursTimer	equ	__end_of_startOneHoursTimer-_startOneHoursTimer
	
_startOneHoursTimer:	
	opt	stack 4
; Regs used in _startOneHoursTimer: [wreg+status,2+status,0]
	line	501
	
l4134:	
;common.c: 501: if(( 0 == uiOneHourTimer ) && ( 0 == bOneHourTimerStartFlag ))
	movf	((_uiOneHourTimer+1)),w
	iorwf	((_uiOneHourTimer)),w
	skipz
	goto	u1871
	goto	u1870
u1871:
	goto	l1624
u1870:
	
l4136:	
	movf	(_bOneHourTimerStartFlag),f
	skipz
	goto	u1881
	goto	u1880
u1881:
	goto	l1624
u1880:
	line	503
	
l4138:	
;common.c: 502: {
;common.c: 503: uiOneHourTimer = uiSetTime;
	movf	(startOneHoursTimer@uiSetTime+1),w
	movwf	(_uiOneHourTimer+1)
	movf	(startOneHoursTimer@uiSetTime),w
	movwf	(_uiOneHourTimer)
	line	504
	
l4140:	
;common.c: 504: bOneHourTimerStartFlag = 1;
	clrf	(_bOneHourTimerStartFlag)
	incf	(_bOneHourTimerStartFlag),f
	line	510
	
l1624:	
	return
	opt stack 0
GLOBAL	__end_of_startOneHoursTimer
	__end_of_startOneHoursTimer:
;; =============== function _startOneHoursTimer ends ============

	signat	_startOneHoursTimer,4216
	global	_isFinishedThreeHoursTimer
psect	text1284,local,class=CODE,delta=2
global __ptext1284
__ptext1284:

;; *************** function _isFinishedThreeHoursTimer *****************
;; Defined at:
;;		line 570 in file "D:\develop\AK7030-good\AK7030-OTP\common.c"
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
psect	text1284
	file	"D:\develop\AK7030-good\AK7030-OTP\common.c"
	line	570
	global	__size_of_isFinishedThreeHoursTimer
	__size_of_isFinishedThreeHoursTimer	equ	__end_of_isFinishedThreeHoursTimer-_isFinishedThreeHoursTimer
	
_isFinishedThreeHoursTimer:	
	opt	stack 4
; Regs used in _isFinishedThreeHoursTimer: [wreg+status,2+status,0]
	line	571
	
l4118:	
;common.c: 571: if((uiSmallTimer == 0) && bSmallTimerStartFlag)
	movf	((_uiSmallTimer+1)),w
	iorwf	((_uiSmallTimer)),w
	skipz
	goto	u1851
	goto	u1850
u1851:
	goto	l4130
u1850:
	
l4120:	
	movf	(_bSmallTimerStartFlag),w
	skipz
	goto	u1860
	goto	l4130
u1860:
	line	573
	
l4122:	
;common.c: 572: {
;common.c: 573: bSmallTimerStartFlag = 0;
	clrf	(_bSmallTimerStartFlag)
	line	574
	
l4124:	
;common.c: 574: return 1;
	movlw	(01h)
	goto	l1642
	line	577
	
l4130:	
;common.c: 576: else
;common.c: 577: return 0;
	movlw	(0)
	line	578
	
l1642:	
	return
	opt stack 0
GLOBAL	__end_of_isFinishedThreeHoursTimer
	__end_of_isFinishedThreeHoursTimer:
;; =============== function _isFinishedThreeHoursTimer ends ============

	signat	_isFinishedThreeHoursTimer,89
	global	_startThreeHoursTimer
psect	text1285,local,class=CODE,delta=2
global __ptext1285
__ptext1285:

;; *************** function _startThreeHoursTimer *****************
;; Defined at:
;;		line 487 in file "D:\develop\AK7030-good\AK7030-OTP\common.c"
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
psect	text1285
	file	"D:\develop\AK7030-good\AK7030-OTP\common.c"
	line	487
	global	__size_of_startThreeHoursTimer
	__size_of_startThreeHoursTimer	equ	__end_of_startThreeHoursTimer-_startThreeHoursTimer
	
_startThreeHoursTimer:	
	opt	stack 4
; Regs used in _startThreeHoursTimer: [wreg+status,2+status,0]
	line	488
	
l4110:	
;common.c: 488: if(( 0 == uiSmallTimer ) && ( 0 == bSmallTimerStartFlag ))
	movf	((_uiSmallTimer+1)),w
	iorwf	((_uiSmallTimer)),w
	skipz
	goto	u1831
	goto	u1830
u1831:
	goto	l1620
u1830:
	
l4112:	
	movf	(_bSmallTimerStartFlag),f
	skipz
	goto	u1841
	goto	u1840
u1841:
	goto	l1620
u1840:
	line	490
	
l4114:	
;common.c: 489: {
;common.c: 490: uiSmallTimer = uiSetTime;
	movf	(startThreeHoursTimer@uiSetTime+1),w
	movwf	(_uiSmallTimer+1)
	movf	(startThreeHoursTimer@uiSetTime),w
	movwf	(_uiSmallTimer)
	line	491
	
l4116:	
;common.c: 491: bSmallTimerStartFlag = 1;
	clrf	(_bSmallTimerStartFlag)
	incf	(_bSmallTimerStartFlag),f
	line	497
	
l1620:	
	return
	opt stack 0
GLOBAL	__end_of_startThreeHoursTimer
	__end_of_startThreeHoursTimer:
;; =============== function _startThreeHoursTimer ends ============

	signat	_startThreeHoursTimer,4216
	global	_isFinishedTwelveHoursTimer
psect	text1286,local,class=CODE,delta=2
global __ptext1286
__ptext1286:

;; *************** function _isFinishedTwelveHoursTimer *****************
;; Defined at:
;;		line 559 in file "D:\develop\AK7030-good\AK7030-OTP\common.c"
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
psect	text1286
	file	"D:\develop\AK7030-good\AK7030-OTP\common.c"
	line	559
	global	__size_of_isFinishedTwelveHoursTimer
	__size_of_isFinishedTwelveHoursTimer	equ	__end_of_isFinishedTwelveHoursTimer-_isFinishedTwelveHoursTimer
	
_isFinishedTwelveHoursTimer:	
	opt	stack 4
; Regs used in _isFinishedTwelveHoursTimer: [wreg+status,2+status,0]
	line	560
	
l4094:	
;common.c: 560: if(( uiBigTimer == 0 ) && bBigTimerStartFlag )
	movf	((_uiBigTimer+1)),w
	iorwf	((_uiBigTimer)),w
	skipz
	goto	u1811
	goto	u1810
u1811:
	goto	l4106
u1810:
	
l4096:	
	movf	(_bBigTimerStartFlag),w
	skipz
	goto	u1820
	goto	l4106
u1820:
	line	562
	
l4098:	
;common.c: 561: {
;common.c: 562: bBigTimerStartFlag = 0;
	clrf	(_bBigTimerStartFlag)
	line	563
	
l4100:	
;common.c: 563: return 1;
	movlw	(01h)
	goto	l1637
	line	566
	
l4106:	
;common.c: 565: else
;common.c: 566: return 0;
	movlw	(0)
	line	567
	
l1637:	
	return
	opt stack 0
GLOBAL	__end_of_isFinishedTwelveHoursTimer
	__end_of_isFinishedTwelveHoursTimer:
;; =============== function _isFinishedTwelveHoursTimer ends ============

	signat	_isFinishedTwelveHoursTimer,89
	global	_startTwelveHourTimer
psect	text1287,local,class=CODE,delta=2
global __ptext1287
__ptext1287:

;; *************** function _startTwelveHourTimer *****************
;; Defined at:
;;		line 446 in file "D:\develop\AK7030-good\AK7030-OTP\common.c"
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
psect	text1287
	file	"D:\develop\AK7030-good\AK7030-OTP\common.c"
	line	446
	global	__size_of_startTwelveHourTimer
	__size_of_startTwelveHourTimer	equ	__end_of_startTwelveHourTimer-_startTwelveHourTimer
	
_startTwelveHourTimer:	
	opt	stack 4
; Regs used in _startTwelveHourTimer: [wreg+status,2+status,0]
	line	447
	
l4086:	
;common.c: 447: if((0 == uiBigTimer) && ( 0 == bBigTimerStartFlag))
	movf	((_uiBigTimer+1)),w
	iorwf	((_uiBigTimer)),w
	skipz
	goto	u1791
	goto	u1790
u1791:
	goto	l1604
u1790:
	
l4088:	
	movf	(_bBigTimerStartFlag),f
	skipz
	goto	u1801
	goto	u1800
u1801:
	goto	l1604
u1800:
	line	449
	
l4090:	
;common.c: 448: {
;common.c: 449: uiBigTimer = uiSetTime;
	movf	(startTwelveHourTimer@uiSetTime+1),w
	movwf	(_uiBigTimer+1)
	movf	(startTwelveHourTimer@uiSetTime),w
	movwf	(_uiBigTimer)
	line	450
	
l4092:	
;common.c: 450: bBigTimerStartFlag = 1;
	clrf	(_bBigTimerStartFlag)
	incf	(_bBigTimerStartFlag),f
	line	457
	
l1604:	
	return
	opt stack 0
GLOBAL	__end_of_startTwelveHourTimer
	__end_of_startTwelveHourTimer:
;; =============== function _startTwelveHourTimer ends ============

	signat	_startTwelveHourTimer,4216
	global	_isFinishedTwentyMinTimer
psect	text1288,local,class=CODE,delta=2
global __ptext1288
__ptext1288:

;; *************** function _isFinishedTwentyMinTimer *****************
;; Defined at:
;;		line 535 in file "D:\develop\AK7030-good\AK7030-OTP\common.c"
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
psect	text1288
	file	"D:\develop\AK7030-good\AK7030-OTP\common.c"
	line	535
	global	__size_of_isFinishedTwentyMinTimer
	__size_of_isFinishedTwentyMinTimer	equ	__end_of_isFinishedTwentyMinTimer-_isFinishedTwentyMinTimer
	
_isFinishedTwentyMinTimer:	
	opt	stack 4
; Regs used in _isFinishedTwentyMinTimer: [wreg+status,2+status,0]
	line	536
	
l4070:	
;common.c: 536: if(( 0 == uiTwentyMinTimer ) && bTwentyMinStartFlag )
	movf	((_uiTwentyMinTimer+1)),w
	iorwf	((_uiTwentyMinTimer)),w
	skipz
	goto	u1771
	goto	u1770
u1771:
	goto	l4082
u1770:
	
l4072:	
	movf	(_bTwentyMinStartFlag),w
	skipz
	goto	u1780
	goto	l4082
u1780:
	line	538
	
l4074:	
;common.c: 537: {
;common.c: 538: bTwentyMinStartFlag = 0;
	clrf	(_bTwentyMinStartFlag)
	line	539
	
l4076:	
;common.c: 539: return 1;
	movlw	(01h)
	goto	l1632
	line	542
	
l4082:	
;common.c: 541: else
;common.c: 542: return 0;
	movlw	(0)
	line	543
	
l1632:	
	return
	opt stack 0
GLOBAL	__end_of_isFinishedTwentyMinTimer
	__end_of_isFinishedTwentyMinTimer:
;; =============== function _isFinishedTwentyMinTimer ends ============

	signat	_isFinishedTwentyMinTimer,89
	global	_clrSampeTime
psect	text1289,local,class=CODE,delta=2
global __ptext1289
__ptext1289:

;; *************** function _clrSampeTime *****************
;; Defined at:
;;		line 605 in file "D:\develop\AK7030-good\AK7030-OTP\common.c"
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
psect	text1289
	file	"D:\develop\AK7030-good\AK7030-OTP\common.c"
	line	605
	global	__size_of_clrSampeTime
	__size_of_clrSampeTime	equ	__end_of_clrSampeTime-_clrSampeTime
	
_clrSampeTime:	
	opt	stack 4
; Regs used in _clrSampeTime: [status,2]
	line	606
	
l4068:	
;common.c: 606: timer.timer10msStopWatch = 0;
	clrf	(_timer)
	line	607
	
l1656:	
	return
	opt stack 0
GLOBAL	__end_of_clrSampeTime
	__end_of_clrSampeTime:
;; =============== function _clrSampeTime ends ============

	signat	_clrSampeTime,88
	global	_isPermitSampleTime
psect	text1290,local,class=CODE,delta=2
global __ptext1290
__ptext1290:

;; *************** function _isPermitSampleTime *****************
;; Defined at:
;;		line 595 in file "D:\develop\AK7030-good\AK7030-OTP\common.c"
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
psect	text1290
	file	"D:\develop\AK7030-good\AK7030-OTP\common.c"
	line	595
	global	__size_of_isPermitSampleTime
	__size_of_isPermitSampleTime	equ	__end_of_isPermitSampleTime-_isPermitSampleTime
	
_isPermitSampleTime:	
	opt	stack 4
; Regs used in _isPermitSampleTime: [wreg]
	line	596
	
l4056:	
;common.c: 596: if(timer.timer10msStopWatch >= 1)
	movf	(_timer),w
	skipz
	goto	u1760
	goto	l4064
u1760:
	line	598
	
l4058:	
;common.c: 597: {
;common.c: 598: return 1;
	movlw	(01h)
	goto	l1652
	line	601
	
l4064:	
;common.c: 600: else
;common.c: 601: return 0;
	movlw	(0)
	line	602
	
l1652:	
	return
	opt stack 0
GLOBAL	__end_of_isPermitSampleTime
	__end_of_isPermitSampleTime:
;; =============== function _isPermitSampleTime ends ============

	signat	_isPermitSampleTime,89
	global	_adc_start
psect	text1291,local,class=CODE,delta=2
global __ptext1291
__ptext1291:

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
psect	text1291
	file	"D:\develop\AK7030-good\AK7030-OTP\periph.c"
	line	101
	global	__size_of_adc_start
	__size_of_adc_start	equ	__end_of_adc_start-_adc_start
	
_adc_start:	
	opt	stack 3
; Regs used in _adc_start: []
	line	102
	
l4054:	
;periph.c: 102: GO=1;
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	bsf	(249/8),(249)&7
	line	103
	
l2324:	
	return
	opt stack 0
GLOBAL	__end_of_adc_start
	__end_of_adc_start:
;; =============== function _adc_start ends ============

	signat	_adc_start,88
	global	_startTwentyMinTimer
psect	text1292,local,class=CODE,delta=2
global __ptext1292
__ptext1292:

;; *************** function _startTwentyMinTimer *****************
;; Defined at:
;;		line 525 in file "D:\develop\AK7030-good\AK7030-OTP\common.c"
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
psect	text1292
	file	"D:\develop\AK7030-good\AK7030-OTP\common.c"
	line	525
	global	__size_of_startTwentyMinTimer
	__size_of_startTwentyMinTimer	equ	__end_of_startTwentyMinTimer-_startTwentyMinTimer
	
_startTwentyMinTimer:	
	opt	stack 4
; Regs used in _startTwentyMinTimer: [wreg+status,2+status,0]
	line	526
	
l4046:	
;common.c: 526: if(( 0 == uiTwentyMinTimer) && ( 0 == bTwentyMinStartFlag))
	movf	((_uiTwentyMinTimer+1)),w
	iorwf	((_uiTwentyMinTimer)),w
	skipz
	goto	u1741
	goto	u1740
u1741:
	goto	l1628
u1740:
	
l4048:	
	movf	(_bTwentyMinStartFlag),f
	skipz
	goto	u1751
	goto	u1750
u1751:
	goto	l1628
u1750:
	line	528
	
l4050:	
;common.c: 527: {
;common.c: 528: uiTwentyMinTimer = uiSetValue;
	movf	(startTwentyMinTimer@uiSetValue+1),w
	movwf	(_uiTwentyMinTimer+1)
	movf	(startTwentyMinTimer@uiSetValue),w
	movwf	(_uiTwentyMinTimer)
	line	529
	
l4052:	
;common.c: 529: bTwentyMinStartFlag = 1;
	clrf	(_bTwentyMinStartFlag)
	incf	(_bTwentyMinStartFlag),f
	line	531
	
l1628:	
	return
	opt stack 0
GLOBAL	__end_of_startTwentyMinTimer
	__end_of_startTwentyMinTimer:
;; =============== function _startTwentyMinTimer ends ============

	signat	_startTwentyMinTimer,4216
	global	_adc_test_init
psect	text1293,local,class=CODE,delta=2
global __ptext1293
__ptext1293:

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
psect	text1293
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
	
l4036:	
;periph.c: 86: ADCON0 = 0x40;
	movlw	(040h)
	movwf	(31)	;volatile
	line	87
	
l4038:	
;periph.c: 87: ADCON0|=channel<<2;
	movf	(adc_test_init@channel),w
	movwf	(??_adc_test_init+0)+0
	clrc
	rlf	(??_adc_test_init+0)+0,f
	clrc
	rlf	(??_adc_test_init+0)+0,w
	iorwf	(31),f	;volatile
	line	88
	
l4040:	
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
	
l4042:	
;periph.c: 90: ADON=1;
	bcf	status, 5	;RP0=0, select bank0
	bsf	(248/8),(248)&7
	line	91
	
l4044:	
;periph.c: 91: ADIE=1;
	bsf	status, 5	;RP0=1, select bank1
	bsf	(1130/8)^080h,(1130)&7
	line	92
	
l2318:	
	return
	opt stack 0
GLOBAL	__end_of_adc_test_init
	__end_of_adc_test_init:
;; =============== function _adc_test_init ends ============

	signat	_adc_test_init,8312
	global	_timer1_interrupt_config
psect	text1294,local,class=CODE,delta=2
global __ptext1294
__ptext1294:

;; *************** function _timer1_interrupt_config *****************
;; Defined at:
;;		line 335 in file "D:\develop\AK7030-good\AK7030-OTP\common.c"
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
psect	text1294
	file	"D:\develop\AK7030-good\AK7030-OTP\common.c"
	line	335
	global	__size_of_timer1_interrupt_config
	__size_of_timer1_interrupt_config	equ	__end_of_timer1_interrupt_config-_timer1_interrupt_config
	
_timer1_interrupt_config:	
	opt	stack 4
; Regs used in _timer1_interrupt_config: []
	line	336
	
l4034:	
;common.c: 336: GIE = 1;
	bsf	(95/8),(95)&7
	line	337
;common.c: 337: PEIE = 1;
	bsf	(94/8),(94)&7
	line	338
	
l1569:	
	return
	opt stack 0
GLOBAL	__end_of_timer1_interrupt_config
	__end_of_timer1_interrupt_config:
;; =============== function _timer1_interrupt_config ends ============

	signat	_timer1_interrupt_config,88
	global	_timer1_config
psect	text1295,local,class=CODE,delta=2
global __ptext1295
__ptext1295:

;; *************** function _timer1_config *****************
;; Defined at:
;;		line 323 in file "D:\develop\AK7030-good\AK7030-OTP\common.c"
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
psect	text1295
	file	"D:\develop\AK7030-good\AK7030-OTP\common.c"
	line	323
	global	__size_of_timer1_config
	__size_of_timer1_config	equ	__end_of_timer1_config-_timer1_config
	
_timer1_config:	
	opt	stack 4
; Regs used in _timer1_config: [wreg]
	line	325
	
l4030:	
;common.c: 325: TMR1H=0xCF;
	movlw	(0CFh)
	bcf	status, 6	;RP1=0, select bank0
	movwf	(15)	;volatile
	line	326
;common.c: 326: TMR1L=0x2C;
	movlw	(02Ch)
	movwf	(14)	;volatile
	line	327
;common.c: 327: T1CON=0xE1;
	movlw	(0E1h)
	movwf	(16)	;volatile
	line	328
	
l4032:	
;common.c: 328: TMR1IE=1;
	bsf	status, 5	;RP0=1, select bank1
	bsf	(1120/8)^080h,(1120)&7
	line	330
	
l1566:	
	return
	opt stack 0
GLOBAL	__end_of_timer1_config
	__end_of_timer1_config:
;; =============== function _timer1_config ends ============

	signat	_timer1_config,88
	global	_clock_config
psect	text1296,local,class=CODE,delta=2
global __ptext1296
__ptext1296:

;; *************** function _clock_config *****************
;; Defined at:
;;		line 315 in file "D:\develop\AK7030-good\AK7030-OTP\common.c"
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
psect	text1296
	file	"D:\develop\AK7030-good\AK7030-OTP\common.c"
	line	315
	global	__size_of_clock_config
	__size_of_clock_config	equ	__end_of_clock_config-_clock_config
	
_clock_config:	
	opt	stack 4
; Regs used in _clock_config: [wreg+status,2]
	line	317
	
l4026:	
;common.c: 317: CLKPR = 0x80;
	movlw	(080h)
	bcf	status, 5	;RP0=0, select bank2
	bsf	status, 6	;RP1=1, select bank2
	movwf	(264)^0100h	;volatile
	line	318
	
l4028:	
;common.c: 318: CLKPR = 0x00;
	clrf	(264)^0100h	;volatile
	line	319
;common.c: 319: while(CLKPCE);
	
l1560:	
	btfsc	(2119/8)^0100h,(2119)&7
	goto	u1731
	goto	u1730
u1731:
	goto	l1560
u1730:
	line	320
	
l1563:	
	return
	opt stack 0
GLOBAL	__end_of_clock_config
	__end_of_clock_config:
;; =============== function _clock_config ends ============

	signat	_clock_config,88
	global	_clearTwentyMinTimer
psect	text1297,local,class=CODE,delta=2
global __ptext1297
__ptext1297:

;; *************** function _clearTwentyMinTimer *****************
;; Defined at:
;;		line 480 in file "D:\develop\AK7030-good\AK7030-OTP\common.c"
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
;;		_resetAllTimer
;;		_main
;; This function uses a non-reentrant model
;;
psect	text1297
	file	"D:\develop\AK7030-good\AK7030-OTP\common.c"
	line	480
	global	__size_of_clearTwentyMinTimer
	__size_of_clearTwentyMinTimer	equ	__end_of_clearTwentyMinTimer-_clearTwentyMinTimer
	
_clearTwentyMinTimer:	
	opt	stack 3
; Regs used in _clearTwentyMinTimer: [status,2]
	line	481
	
l4024:	
;common.c: 481: uiTwentyMinTimer = 0;
	clrf	(_uiTwentyMinTimer)
	clrf	(_uiTwentyMinTimer+1)
	line	482
;common.c: 482: bTwentyMinStartFlag = 0;
	clrf	(_bTwentyMinStartFlag)
	line	483
	
l1616:	
	return
	opt stack 0
GLOBAL	__end_of_clearTwentyMinTimer
	__end_of_clearTwentyMinTimer:
;; =============== function _clearTwentyMinTimer ends ============

	signat	_clearTwentyMinTimer,88
	global	_clearOneHoursTimer
psect	text1298,local,class=CODE,delta=2
global __ptext1298
__ptext1298:

;; *************** function _clearOneHoursTimer *****************
;; Defined at:
;;		line 473 in file "D:\develop\AK7030-good\AK7030-OTP\common.c"
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
;; Hardware stack levels required when called:    3
;; This function calls:
;;		Nothing
;; This function is called by:
;;		_resetAllTimer
;; This function uses a non-reentrant model
;;
psect	text1298
	file	"D:\develop\AK7030-good\AK7030-OTP\common.c"
	line	473
	global	__size_of_clearOneHoursTimer
	__size_of_clearOneHoursTimer	equ	__end_of_clearOneHoursTimer-_clearOneHoursTimer
	
_clearOneHoursTimer:	
	opt	stack 3
; Regs used in _clearOneHoursTimer: [status,2]
	line	474
	
l4022:	
;common.c: 474: uiOneHourTimer = 0;
	clrf	(_uiOneHourTimer)
	clrf	(_uiOneHourTimer+1)
	line	475
;common.c: 475: bOneHourTimerStartFlag = 0;
	clrf	(_bOneHourTimerStartFlag)
	line	476
	
l1613:	
	return
	opt stack 0
GLOBAL	__end_of_clearOneHoursTimer
	__end_of_clearOneHoursTimer:
;; =============== function _clearOneHoursTimer ends ============

	signat	_clearOneHoursTimer,88
	global	_clearThreeHoursTimer
psect	text1299,local,class=CODE,delta=2
global __ptext1299
__ptext1299:

;; *************** function _clearThreeHoursTimer *****************
;; Defined at:
;;		line 467 in file "D:\develop\AK7030-good\AK7030-OTP\common.c"
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
;;		_resetAllTimer
;;		_main
;; This function uses a non-reentrant model
;;
psect	text1299
	file	"D:\develop\AK7030-good\AK7030-OTP\common.c"
	line	467
	global	__size_of_clearThreeHoursTimer
	__size_of_clearThreeHoursTimer	equ	__end_of_clearThreeHoursTimer-_clearThreeHoursTimer
	
_clearThreeHoursTimer:	
	opt	stack 3
; Regs used in _clearThreeHoursTimer: [status,2]
	line	468
	
l4020:	
;common.c: 468: uiSmallTimer = 0;
	clrf	(_uiSmallTimer)
	clrf	(_uiSmallTimer+1)
	line	469
;common.c: 469: bSmallTimerStartFlag = 0;
	clrf	(_bSmallTimerStartFlag)
	line	470
	
l1610:	
	return
	opt stack 0
GLOBAL	__end_of_clearThreeHoursTimer
	__end_of_clearThreeHoursTimer:
;; =============== function _clearThreeHoursTimer ends ============

	signat	_clearThreeHoursTimer,88
	global	_clearTwelveHoursTimer
psect	text1300,local,class=CODE,delta=2
global __ptext1300
__ptext1300:

;; *************** function _clearTwelveHoursTimer *****************
;; Defined at:
;;		line 460 in file "D:\develop\AK7030-good\AK7030-OTP\common.c"
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
;; Hardware stack levels required when called:    3
;; This function calls:
;;		Nothing
;; This function is called by:
;;		_resetAllTimer
;;		_main
;; This function uses a non-reentrant model
;;
psect	text1300
	file	"D:\develop\AK7030-good\AK7030-OTP\common.c"
	line	460
	global	__size_of_clearTwelveHoursTimer
	__size_of_clearTwelveHoursTimer	equ	__end_of_clearTwelveHoursTimer-_clearTwelveHoursTimer
	
_clearTwelveHoursTimer:	
	opt	stack 3
; Regs used in _clearTwelveHoursTimer: [status,2]
	line	461
	
l4018:	
;common.c: 461: uiBigTimer = 0;
	bcf	status, 5	;RP0=0, select bank0
	clrf	(_uiBigTimer)
	clrf	(_uiBigTimer+1)
	line	462
;common.c: 462: bBigTimerStartFlag = 0;
	clrf	(_bBigTimerStartFlag)
	line	463
	
l1607:	
	return
	opt stack 0
GLOBAL	__end_of_clearTwelveHoursTimer
	__end_of_clearTwelveHoursTimer:
;; =============== function _clearTwelveHoursTimer ends ============

	signat	_clearTwelveHoursTimer,88
	global	_reset
psect	text1301,local,class=CODE,delta=2
global __ptext1301
__ptext1301:

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
;;		On entry : 60/0
;;		On exit  : 60/0
;;		Unchanged: FFFFFF9F/0
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
psect	text1301
	file	"D:\develop\AK7030-good\AK7030-OTP\main.c"
	line	294
	global	__size_of_reset
	__size_of_reset	equ	__end_of_reset-_reset
	
_reset:	
	opt	stack 4
; Regs used in _reset: []
	line	296
;main.c: 296: while(1);
	
l724:	
	goto	l724
	return
	opt stack 0
psect	text1302,local,class=CODE,delta=2
global __ptext1302
__ptext1302:
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
psect	text1302
	file	"D:\develop\AK7030-good\AK7030-OTP\main.c"
	line	283
	global	__size_of_selectAdChannel
	__size_of_selectAdChannel	equ	__end_of_selectAdChannel-_selectAdChannel
	
_selectAdChannel:	
	opt	stack 4
; Regs used in _selectAdChannel: []
	line	285
	
l4016:	
;main.c: 285: TRISB0 = 1;
	bsf	status, 5	;RP0=1, select bank1
	bsf	(1072/8)^080h,(1072)&7
	line	286
;main.c: 286: TRISB1 = 1;
	bsf	(1073/8)^080h,(1073)&7
	line	290
	
l721:	
	return
	opt stack 0
GLOBAL	__end_of_selectAdChannel
	__end_of_selectAdChannel:
;; =============== function _selectAdChannel ends ============

	signat	_selectAdChannel,88
	global	_pwm_start
psect	text1303,local,class=CODE,delta=2
global __ptext1303
__ptext1303:

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
psect	text1303
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
	
l4000:	
;main.c: 233: CCP1CON&= 0xf0;
	movlw	(0F0h)
	andwf	(23),f	;volatile
	line	235
	
l4002:	
;main.c: 235: T2CON=0x04;
	movlw	(04h)
	movwf	(18)	;volatile
	line	236
	
l4004:	
;main.c: 236: PR2 = ucPulseFrequency;
	movf	(pwm_start@ucPulseFrequency),w
	bsf	status, 5	;RP0=1, select bank1
	movwf	(146)^080h	;volatile
	line	237
	
l4006:	
;main.c: 237: CCPR1L = ucPulseWidth;
	bcf	status, 5	;RP0=0, select bank0
	movf	(pwm_start@ucPulseWidth),w
	movwf	(21)	;volatile
	line	238
	
l4008:	
;main.c: 238: CCP1CON=0x00;
	clrf	(23)	;volatile
	line	240
	
l4010:	
;main.c: 240: TRISB2=0;
	bsf	status, 5	;RP0=1, select bank1
	bcf	(1074/8)^080h,(1074)&7
	line	241
	
l4012:	
;main.c: 241: PBOD2 = 0;
	bsf	status, 6	;RP1=1, select bank3
	bcf	(3138/8)^0180h,(3138)&7
	line	243
	
l4014:	
;main.c: 243: CCP1CON|= 0x0c;
	movlw	(0Ch)
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	iorwf	(23),f	;volatile
	line	252
	
l712:	
	return
	opt stack 0
GLOBAL	__end_of_pwm_start
	__end_of_pwm_start:
;; =============== function _pwm_start ends ============

	signat	_pwm_start,8312
	global	_initPB2_AsHighResistence
psect	text1304,local,class=CODE,delta=2
global __ptext1304
__ptext1304:

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
psect	text1304
	file	"D:\develop\AK7030-good\AK7030-OTP\main.c"
	line	219
	global	__size_of_initPB2_AsHighResistence
	__size_of_initPB2_AsHighResistence	equ	__end_of_initPB2_AsHighResistence-_initPB2_AsHighResistence
	
_initPB2_AsHighResistence:	
	opt	stack 3
; Regs used in _initPB2_AsHighResistence: []
	line	221
	
l3998:	
;main.c: 221: PB2 = 1;
	bsf	(50/8),(50)&7
	line	222
;main.c: 222: PBOD2 = 1;
	bsf	status, 5	;RP0=1, select bank3
	bsf	status, 6	;RP1=1, select bank3
	bsf	(3138/8)^0180h,(3138)&7
	line	226
	
l709:	
	return
	opt stack 0
GLOBAL	__end_of_initPB2_AsHighResistence
	__end_of_initPB2_AsHighResistence:
;; =============== function _initPB2_AsHighResistence ends ============

	signat	_initPB2_AsHighResistence,88
	global	_setPB5
psect	text1305,local,class=CODE,delta=2
global __ptext1305
__ptext1305:

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
psect	text1305
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
	
l3994:	
;main.c: 203: if( bValue )
	movf	(setPB5@bValue),w
	skipz
	goto	u1720
	goto	l704
u1720:
	line	205
	
l3996:	
;main.c: 205: PB5 = 1;
	bsf	(53/8),(53)&7
	goto	l706
	line	209
	
l704:	
	line	211
;main.c: 209: else
;main.c: 211: PB5= 0;
	bcf	(53/8),(53)&7
	line	215
	
l706:	
	return
	opt stack 0
GLOBAL	__end_of_setPB5
	__end_of_setPB5:
;; =============== function _setPB5 ends ============

	signat	_setPB5,4216
	global	_initPB5
psect	text1306,local,class=CODE,delta=2
global __ptext1306
__ptext1306:

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
psect	text1306
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
	
l3990:	
;main.c: 186: if( bValue )
	movf	(initPB5@bValue),w
	skipz
	goto	u1710
	goto	l699
u1710:
	line	188
	
l3992:	
;main.c: 188: TRISB5 = 1;
	bsf	status, 5	;RP0=1, select bank1
	bsf	(1077/8)^080h,(1077)&7
	goto	l701
	line	192
	
l699:	
	line	194
;main.c: 192: else
;main.c: 194: TRISB5= 0;
	bsf	status, 5	;RP0=1, select bank1
	bcf	(1077/8)^080h,(1077)&7
	line	198
	
l701:	
	return
	opt stack 0
GLOBAL	__end_of_initPB5
	__end_of_initPB5:
;; =============== function _initPB5 ends ============

	signat	_initPB5,4216
	global	_setPB4
psect	text1307,local,class=CODE,delta=2
global __ptext1307
__ptext1307:

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
psect	text1307
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
	
l3986:	
;main.c: 169: if( bValue )
	movf	(setPB4@bValue),w
	skipz
	goto	u1700
	goto	l694
u1700:
	line	171
	
l3988:	
;main.c: 171: PB4 = 1;
	bsf	(52/8),(52)&7
	goto	l696
	line	175
	
l694:	
	line	177
;main.c: 175: else
;main.c: 177: PB4= 0;
	bcf	(52/8),(52)&7
	line	181
	
l696:	
	return
	opt stack 0
GLOBAL	__end_of_setPB4
	__end_of_setPB4:
;; =============== function _setPB4 ends ============

	signat	_setPB4,4216
	global	_initPB4
psect	text1308,local,class=CODE,delta=2
global __ptext1308
__ptext1308:

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
psect	text1308
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
	
l3982:	
;main.c: 152: if( bValue )
	movf	(initPB4@bValue),w
	skipz
	goto	u1690
	goto	l689
u1690:
	line	154
	
l3984:	
;main.c: 154: TRISB4 = 1;
	bsf	status, 5	;RP0=1, select bank1
	bsf	(1076/8)^080h,(1076)&7
	goto	l691
	line	158
	
l689:	
	line	160
;main.c: 158: else
;main.c: 160: TRISB4= 0;
	bsf	status, 5	;RP0=1, select bank1
	bcf	(1076/8)^080h,(1076)&7
	line	164
	
l691:	
	return
	opt stack 0
GLOBAL	__end_of_initPB4
	__end_of_initPB4:
;; =============== function _initPB4 ends ============

	signat	_initPB4,4216
	global	_setPB3
psect	text1309,local,class=CODE,delta=2
global __ptext1309
__ptext1309:

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
psect	text1309
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
	
l3978:	
;main.c: 134: if( bValue )
	movf	(setPB3@bValue),w
	skipz
	goto	u1680
	goto	l684
u1680:
	line	136
	
l3980:	
;main.c: 136: PB3 = 1;
	bsf	(51/8),(51)&7
	goto	l686
	line	140
	
l684:	
	line	142
;main.c: 140: else
;main.c: 142: PB3= 0;
	bcf	(51/8),(51)&7
	line	146
	
l686:	
	return
	opt stack 0
GLOBAL	__end_of_setPB3
	__end_of_setPB3:
;; =============== function _setPB3 ends ============

	signat	_setPB3,4216
	global	_initPB3
psect	text1310,local,class=CODE,delta=2
global __ptext1310
__ptext1310:

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
psect	text1310
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
	
l3974:	
;main.c: 117: if( bValue )
	movf	(initPB3@bValue),w
	skipz
	goto	u1670
	goto	l679
u1670:
	line	119
	
l3976:	
;main.c: 119: TRISB3 = 1;
	bsf	status, 5	;RP0=1, select bank1
	bsf	(1075/8)^080h,(1075)&7
	goto	l681
	line	123
	
l679:	
	line	125
;main.c: 123: else
;main.c: 125: TRISB3 = 0;
	bsf	status, 5	;RP0=1, select bank1
	bcf	(1075/8)^080h,(1075)&7
	line	129
	
l681:	
	return
	opt stack 0
GLOBAL	__end_of_initPB3
	__end_of_initPB3:
;; =============== function _initPB3 ends ============

	signat	_initPB3,4216
	global	_ISR
psect	text1311,local,class=CODE,delta=2
global __ptext1311
__ptext1311:

;; *************** function _ISR *****************
;; Defined at:
;;		line 613 in file "D:\develop\AK7030-good\AK7030-OTP\common.c"
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
psect	text1311
	file	"D:\develop\AK7030-good\AK7030-OTP\common.c"
	line	613
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
psect	text1311
	line	617
	
i1l3740:	
;common.c: 614: static unsigned char ucTimer1sCnt = 0;
;common.c: 617: if(TMR1IF == 1)
	btfss	(96/8),(96)&7
	goto	u136_21
	goto	u136_20
u136_21:
	goto	i1l3762
u136_20:
	line	619
	
i1l3742:	
;common.c: 618: {
;common.c: 619: TMR1IF = 0 ;
	bcf	(96/8),(96)&7
	line	620
	
i1l3744:	
;common.c: 620: timer.timer10msStopWatch++;
	incf	(_timer),f
	line	621
;common.c: 621: ucTimer1sCnt++;
	incf	(ISR@ucTimer1sCnt),f
	line	625
	
i1l3746:	
;common.c: 625: if(ucTimer1sCnt >= 100)
	movlw	(064h)
	subwf	(ISR@ucTimer1sCnt),w
	skipc
	goto	u137_21
	goto	u137_20
u137_21:
	goto	i1l3762
u137_20:
	line	627
	
i1l3748:	
;common.c: 626: {
;common.c: 627: ucTimer1sCnt = 0;
	clrf	(ISR@ucTimer1sCnt)
	line	628
	
i1l3750:	
;common.c: 628: if(uiBigTimer > 0)
	movf	(_uiBigTimer+1),w
	iorwf	(_uiBigTimer),w
	skipnz
	goto	u138_21
	goto	u138_20
u138_21:
	goto	i1l1663
u138_20:
	line	629
	
i1l3752:	
;common.c: 629: uiBigTimer--;
	movlw	low(01h)
	subwf	(_uiBigTimer),f
	movlw	high(01h)
	skipc
	decf	(_uiBigTimer+1),f
	subwf	(_uiBigTimer+1),f
	
i1l1663:	
	line	631
;common.c: 631: if(uiSmallTimer)
	movf	(_uiSmallTimer+1),w
	iorwf	(_uiSmallTimer),w
	skipnz
	goto	u139_21
	goto	u139_20
u139_21:
	goto	i1l1664
u139_20:
	line	632
	
i1l3754:	
;common.c: 632: uiSmallTimer--;
	movlw	low(01h)
	subwf	(_uiSmallTimer),f
	movlw	high(01h)
	skipc
	decf	(_uiSmallTimer+1),f
	subwf	(_uiSmallTimer+1),f
	
i1l1664:	
	line	634
;common.c: 634: if(uiTwentySecondsTimer)
	bsf	status, 5	;RP0=1, select bank1
	movf	(_uiTwentySecondsTimer+1)^080h,w
	iorwf	(_uiTwentySecondsTimer)^080h,w
	skipnz
	goto	u140_21
	goto	u140_20
u140_21:
	goto	i1l1665
u140_20:
	line	635
	
i1l3756:	
;common.c: 635: uiTwentySecondsTimer--;
	movlw	low(01h)
	subwf	(_uiTwentySecondsTimer)^080h,f
	movlw	high(01h)
	skipc
	decf	(_uiTwentySecondsTimer+1)^080h,f
	subwf	(_uiTwentySecondsTimer+1)^080h,f
	
i1l1665:	
	line	637
;common.c: 637: if(uiTwentyMinTimer)
	bcf	status, 5	;RP0=0, select bank0
	movf	(_uiTwentyMinTimer+1),w
	iorwf	(_uiTwentyMinTimer),w
	skipnz
	goto	u141_21
	goto	u141_20
u141_21:
	goto	i1l1666
u141_20:
	line	638
	
i1l3758:	
;common.c: 638: uiTwentyMinTimer--;
	movlw	low(01h)
	subwf	(_uiTwentyMinTimer),f
	movlw	high(01h)
	skipc
	decf	(_uiTwentyMinTimer+1),f
	subwf	(_uiTwentyMinTimer+1),f
	
i1l1666:	
	line	640
;common.c: 640: if( uiOneHourTimer )
	movf	(_uiOneHourTimer+1),w
	iorwf	(_uiOneHourTimer),w
	skipnz
	goto	u142_21
	goto	u142_20
u142_21:
	goto	i1l3762
u142_20:
	line	641
	
i1l3760:	
;common.c: 641: uiOneHourTimer--;
	movlw	low(01h)
	subwf	(_uiOneHourTimer),f
	movlw	high(01h)
	skipc
	decf	(_uiOneHourTimer+1),f
	subwf	(_uiOneHourTimer+1),f
	line	645
	
i1l3762:	
;common.c: 642: }
;common.c: 643: }
;common.c: 645: if(ADIF)
	btfss	(106/8),(106)&7
	goto	u143_21
	goto	u143_20
u143_21:
	goto	i1l1671
u143_20:
	line	648
	
i1l3764:	
;common.c: 646: {
;common.c: 648: ADIF=0;
	bcf	(106/8),(106)&7
	line	649
	
i1l3766:	
;common.c: 649: setAD_ConvertFlag(1);
	movlw	(01h)
	fcall	i1_setAD_ConvertFlag
	line	651
	
i1l3768:	
;common.c: 651: if(sampleChannelSelect == 12)
	movf	(_sampleChannelSelect),w
	xorlw	0Ch
	skipz
	goto	u144_21
	goto	u144_20
u144_21:
	goto	i1l3772
u144_20:
	line	655
	
i1l3770:	
;common.c: 652: {
;common.c: 655: vPutSampleDataIntoTable(adc_get(),12);
	fcall	_adc_get
	movf	(1+(?_adc_get)),w
	movwf	(?_vPutSampleDataIntoTable+1)
	movf	(0+(?_adc_get)),w
	movwf	(?_vPutSampleDataIntoTable)
	movlw	(0Ch)
	movwf	0+(?_vPutSampleDataIntoTable)+02h
	fcall	_vPutSampleDataIntoTable
	line	659
;common.c: 659: }
	goto	i1l1671
	line	665
	
i1l3772:	
;common.c: 660: else
;common.c: 661: {
;common.c: 665: vPutSampleDataIntoTable(adc_get(),13);
	fcall	_adc_get
	movf	(1+(?_adc_get)),w
	movwf	(?_vPutSampleDataIntoTable+1)
	movf	(0+(?_adc_get)),w
	movwf	(?_vPutSampleDataIntoTable)
	movlw	(0Dh)
	movwf	0+(?_vPutSampleDataIntoTable)+02h
	fcall	_vPutSampleDataIntoTable
	line	670
	
i1l1671:	
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
psect	text1312,local,class=CODE,delta=2
global __ptext1312
__ptext1312:

;; *************** function _vPutSampleDataIntoTable *****************
;; Defined at:
;;		line 165 in file "D:\develop\AK7030-good\AK7030-OTP\common.c"
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
psect	text1312
	file	"D:\develop\AK7030-good\AK7030-OTP\common.c"
	line	165
	global	__size_of_vPutSampleDataIntoTable
	__size_of_vPutSampleDataIntoTable	equ	__end_of_vPutSampleDataIntoTable-_vPutSampleDataIntoTable
	
_vPutSampleDataIntoTable:	
	opt	stack 3
; Regs used in _vPutSampleDataIntoTable: [wreg-fsr0h+status,2+status,0+btemp+1+pclath+cstack]
	line	174
	
i1l3626:	
;common.c: 167: static unsigned char ucCh12Length = 0;
;common.c: 169: static unsigned char ucCh13Length = 0;
;common.c: 171: static unsigned char ucChannelFourteenthLength = 0;
;common.c: 172: static unsigned int uiCalWidthArrayNew = 0;
;common.c: 173: static unsigned int uiCalWidthArrayOld = 0;
;common.c: 174: if(channel == 12)
	movf	(vPutSampleDataIntoTable@channel),w
	xorlw	0Ch
	skipz
	goto	u118_21
	goto	u118_20
u118_21:
	goto	i1l3684
u118_20:
	line	176
	
i1l3628:	
;common.c: 175: {
;common.c: 176: if(ucCh12Length < 3)
	movlw	(03h)
	subwf	(vPutSampleDataIntoTable@ucCh12Length),w
	skipnc
	goto	u119_21
	goto	u119_20
u119_21:
	goto	i1l3680
u119_20:
	line	178
	
i1l3630:	
;common.c: 177: {
;common.c: 178: uiSampleCh12[ucCh12Length] = uiSampleData;
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
	line	180
	
i1l3632:	
;common.c: 180: ucCh12Length++;
	incf	(vPutSampleDataIntoTable@ucCh12Length),f
	line	182
	
i1l3634:	
;common.c: 182: if( 3 == ucCh12Length )
	movf	(vPutSampleDataIntoTable@ucCh12Length),w
	xorlw	03h
	skipz
	goto	u120_21
	goto	u120_20
u120_21:
	goto	i1l1557
u120_20:
	line	184
	
i1l3636:	
;common.c: 183: {
;common.c: 184: ucCh12Length = 0;
	clrf	(vPutSampleDataIntoTable@ucCh12Length)
	line	194
	
i1l3638:	
;common.c: 188: static unsigned char bInitArrayFlag = 0;
;common.c: 190: static unsigned int uiCalWidthArray[1],uiCalWidthCnt = 0;
;common.c: 192: static unsigned char uiInitWidth = 75;
;common.c: 194: uiCalWidthArrayNew = Filter(uiSampleCh12);
	movlw	(_uiSampleCh12)&0ffh
	fcall	_Filter
	movf	(1+(?_Filter)),w
	movwf	(vPutSampleDataIntoTable@uiCalWidthArrayNew+1)
	movf	(0+(?_Filter)),w
	movwf	(vPutSampleDataIntoTable@uiCalWidthArrayNew)
	line	196
	
i1l3640:	
	
i1l3642:	
	line	198
	
i1l3644:	
;common.c: 198: if( uiCalWidthArrayNew >= uiCalWidthArrayOld)
	movf	(vPutSampleDataIntoTable@uiCalWidthArrayOld+1),w
	subwf	(vPutSampleDataIntoTable@uiCalWidthArrayNew+1),w
	skipz
	goto	u121_25
	movf	(vPutSampleDataIntoTable@uiCalWidthArrayOld),w
	subwf	(vPutSampleDataIntoTable@uiCalWidthArrayNew),w
u121_25:
	skipc
	goto	u121_21
	goto	u121_20
u121_21:
	goto	i1l3652
u121_20:
	line	200
	
i1l3646:	
;common.c: 199: {
;common.c: 200: uiAbstractValue = uiCalWidthArrayNew - uiCalWidthArrayOld;
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
	line	201
;common.c: 201: uiDeviationValue = ((uiCalWidthArrayNew+uiCalWidthArrayOld)>>1) + uiAbstractValue;
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
	
i1l3648:	
	clrc
	rrf	(vPutSampleDataIntoTable@uiDeviationValue+1),f
	rrf	(vPutSampleDataIntoTable@uiDeviationValue),f
	
i1l3650:	
	movf	(vPutSampleDataIntoTable@uiAbstractValue),w
	addwf	(vPutSampleDataIntoTable@uiDeviationValue),f
	skipnc
	incf	(vPutSampleDataIntoTable@uiDeviationValue+1),f
	movf	(vPutSampleDataIntoTable@uiAbstractValue+1),w
	addwf	(vPutSampleDataIntoTable@uiDeviationValue+1),f
	line	202
;common.c: 202: }
	goto	i1l3658
	line	205
	
i1l3652:	
;common.c: 203: else
;common.c: 204: {
;common.c: 205: uiAbstractValue = uiCalWidthArrayOld - uiCalWidthArrayNew;
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
	line	206
;common.c: 206: uiDeviationValue = ((uiCalWidthArrayNew+uiCalWidthArrayOld)>>1) - uiAbstractValue;
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
	subwf	(vPutSampleDataIntoTable@uiDeviationValue),f
	movf	(vPutSampleDataIntoTable@uiAbstractValue+1),w
	skipc
	decf	(vPutSampleDataIntoTable@uiDeviationValue+1),f
	subwf	(vPutSampleDataIntoTable@uiDeviationValue+1),f
	line	212
	
i1l3658:	
;common.c: 208: }
;common.c: 212: if(uiCalWidthCnt>400)
	movlw	high(0191h)
	bsf	status, 5	;RP0=1, select bank1
	subwf	(vPutSampleDataIntoTable@uiCalWidthCnt+1)^080h,w
	movlw	low(0191h)
	skipnz
	subwf	(vPutSampleDataIntoTable@uiCalWidthCnt)^080h,w
	skipc
	goto	u122_21
	goto	u122_20
u122_21:
	goto	i1l1536
u122_20:
	line	213
	
i1l3660:	
;common.c: 213: uiDeviationValue =400;
	movlw	low(0190h)
	bcf	status, 5	;RP0=0, select bank0
	movwf	(vPutSampleDataIntoTable@uiDeviationValue)
	movlw	high(0190h)
	movwf	((vPutSampleDataIntoTable@uiDeviationValue))+1
	
i1l1536:	
	line	216
;common.c: 216: uiCalWidthArrayOld=uiCalWidthArrayNew;
	bcf	status, 5	;RP0=0, select bank0
	movf	(vPutSampleDataIntoTable@uiCalWidthArrayNew+1),w
	movwf	(vPutSampleDataIntoTable@uiCalWidthArrayOld+1)
	movf	(vPutSampleDataIntoTable@uiCalWidthArrayNew),w
	movwf	(vPutSampleDataIntoTable@uiCalWidthArrayOld)
	line	221
;common.c: 221: if(uiDeviationValue > (295))
	movlw	high(0128h)
	subwf	(vPutSampleDataIntoTable@uiDeviationValue+1),w
	movlw	low(0128h)
	skipnz
	subwf	(vPutSampleDataIntoTable@uiDeviationValue),w
	skipc
	goto	u123_21
	goto	u123_20
u123_21:
	goto	i1l3664
u123_20:
	line	225
	
i1l3662:	
;common.c: 222: {
;common.c: 225: uiInitWidth++;
	incf	(vPutSampleDataIntoTable@uiInitWidth),f
	line	227
;common.c: 227: }
	goto	i1l3668
	line	228
	
i1l3664:	
;common.c: 228: else if(uiDeviationValue < (295))
	movlw	high(0127h)
	subwf	(vPutSampleDataIntoTable@uiDeviationValue+1),w
	movlw	low(0127h)
	skipnz
	subwf	(vPutSampleDataIntoTable@uiDeviationValue),w
	skipnc
	goto	u124_21
	goto	u124_20
u124_21:
	goto	i1l3668
u124_20:
	line	232
	
i1l3666:	
;common.c: 229: {
;common.c: 232: uiInitWidth--;
	decf	(vPutSampleDataIntoTable@uiInitWidth),f
	line	238
;common.c: 234: }
	
i1l3668:	
;common.c: 238: if(uiInitWidth > 249)
	movlw	(0FAh)
	subwf	(vPutSampleDataIntoTable@uiInitWidth),w
	skipc
	goto	u125_21
	goto	u125_20
u125_21:
	goto	i1l1541
u125_20:
	line	239
	
i1l3670:	
;common.c: 239: uiInitWidth = 249;
	movlw	(0F9h)
	movwf	(vPutSampleDataIntoTable@uiInitWidth)
	
i1l1541:	
	line	241
;common.c: 241: if(uiInitWidth < 75)
	movlw	(04Bh)
	subwf	(vPutSampleDataIntoTable@uiInitWidth),w
	skipnc
	goto	u126_21
	goto	u126_20
u126_21:
	goto	i1l3674
u126_20:
	line	242
	
i1l3672:	
;common.c: 242: uiInitWidth = 75;
	movlw	(04Bh)
	movwf	(vPutSampleDataIntoTable@uiInitWidth)
	line	246
	
i1l3674:	
;common.c: 246: if( 1 == getWaitResetFlag())
	fcall	_getWaitResetFlag
	xorlw	01h
	skipz
	goto	u127_21
	goto	u127_20
u127_21:
	goto	i1l3678
u127_20:
	line	249
	
i1l3676:	
;common.c: 247: {
;common.c: 249: uiInitWidth = 150;
	movlw	(096h)
	movwf	(vPutSampleDataIntoTable@uiInitWidth)
	line	251
	
i1l3678:	
;common.c: 250: }
;common.c: 251: setPWM_Width(uiInitWidth);
	movf	(vPutSampleDataIntoTable@uiInitWidth),w
	fcall	_setPWM_Width
	goto	i1l1557
	line	258
	
i1l3680:	
;common.c: 256: else
;common.c: 257: {
;common.c: 258: ucCh12Length = 0;
	clrf	(vPutSampleDataIntoTable@ucCh12Length)
	line	260
	
i1l3682:	
;common.c: 260: uiSampleCh12[ucCh12Length] = uiSampleData;
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
	goto	i1l1557
	line	263
	
i1l3684:	
;common.c: 263: else if(channel == 13)
	movf	(vPutSampleDataIntoTable@channel),w
	xorlw	0Dh
	skipz
	goto	u128_21
	goto	u128_20
u128_21:
	goto	i1l3696
u128_20:
	line	265
	
i1l3686:	
;common.c: 264: {
;common.c: 265: if(ucCh13Length < 3)
	movlw	(03h)
	bcf	status, 5	;RP0=0, select bank0
	subwf	(vPutSampleDataIntoTable@ucCh13Length),w
	skipnc
	goto	u129_21
	goto	u129_20
u129_21:
	goto	i1l3692
u129_20:
	line	267
	
i1l3688:	
;common.c: 266: {
;common.c: 267: uiSampleCh13[ucCh13Length] = uiSampleData;
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
	line	269
	
i1l3690:	
;common.c: 269: ucCh13Length++;
	incf	(vPutSampleDataIntoTable@ucCh13Length),f
	line	270
;common.c: 270: }
	goto	i1l1557
	line	273
	
i1l3692:	
;common.c: 271: else
;common.c: 272: {
;common.c: 273: ucCh13Length = 0;
	clrf	(vPutSampleDataIntoTable@ucCh13Length)
	line	275
	
i1l3694:	
;common.c: 275: uiSampleCh13[ucCh13Length] = uiSampleData;
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
	goto	i1l1557
	line	278
	
i1l3696:	
;common.c: 278: else if(channel == 14)
	movf	(vPutSampleDataIntoTable@channel),w
	xorlw	0Eh
	skipz
	goto	u130_21
	goto	u130_20
u130_21:
	goto	i1l3708
u130_20:
	line	280
	
i1l3698:	
;common.c: 279: {
;common.c: 280: if(ucChannelFourteenthLength < 3)
	movlw	(03h)
	bcf	status, 5	;RP0=0, select bank0
	subwf	(vPutSampleDataIntoTable@ucChannelFourteenthLength),w
	skipnc
	goto	u131_21
	goto	u131_20
u131_21:
	goto	i1l3704
u131_20:
	line	282
	
i1l3700:	
;common.c: 281: {
;common.c: 282: uiSampleChannelFourteenth[ucChannelFourteenthLength] = uiSampleData;
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
	line	284
	
i1l3702:	
;common.c: 284: ucChannelFourteenthLength++;
	incf	(vPutSampleDataIntoTable@ucChannelFourteenthLength),f
	line	285
;common.c: 285: }
	goto	i1l1557
	line	288
	
i1l3704:	
;common.c: 286: else
;common.c: 287: {
;common.c: 288: ucChannelFourteenthLength = 0;
	clrf	(vPutSampleDataIntoTable@ucChannelFourteenthLength)
	line	290
	
i1l3706:	
;common.c: 290: uiSampleCh13[ucChannelFourteenthLength] = uiSampleData;
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
	goto	i1l1557
	line	295
	
i1l3708:	
;common.c: 293: else
;common.c: 294: {
;common.c: 295: ucCh12Length = 0;
	clrf	(vPutSampleDataIntoTable@ucCh12Length)
	line	297
;common.c: 297: ucCh13Length = 0;
	bcf	status, 5	;RP0=0, select bank0
	clrf	(vPutSampleDataIntoTable@ucCh13Length)
	line	299
;common.c: 299: ucChannelFourteenthLength = 0;
	clrf	(vPutSampleDataIntoTable@ucChannelFourteenthLength)
	line	301
;common.c: 301: for(int i = 0;i < 3; i++)
	clrf	(vPutSampleDataIntoTable@i)
	clrf	(vPutSampleDataIntoTable@i+1)
	line	303
	
i1l3714:	
;common.c: 302: {
;common.c: 303: uiSampleCh12[i] = 0;
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
	line	305
;common.c: 305: uiSampleCh13[i] = 0;
	clrc
	rlf	(vPutSampleDataIntoTable@i),w
	addlw	_uiSampleCh13&0ffh
	movwf	fsr0
	clrf	indf
	incf	fsr0,f
	clrf	indf
	line	307
;common.c: 307: uiSampleChannelFourteenth[i] = 0;
	clrc
	rlf	(vPutSampleDataIntoTable@i),w
	addlw	_uiSampleChannelFourteenth&0ffh
	movwf	fsr0
	clrf	indf
	incf	fsr0,f
	clrf	indf
	line	301
	
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
	goto	u132_25
	movlw	low(03h)
	subwf	(vPutSampleDataIntoTable@i),w
u132_25:

	skipc
	goto	u132_21
	goto	u132_20
u132_21:
	goto	i1l3714
u132_20:
	line	311
	
i1l1557:	
	return
	opt stack 0
GLOBAL	__end_of_vPutSampleDataIntoTable
	__end_of_vPutSampleDataIntoTable:
;; =============== function _vPutSampleDataIntoTable ends ============

	signat	_vPutSampleDataIntoTable,8312
	global	i1_setAD_ConvertFlag
psect	text1313,local,class=CODE,delta=2
global __ptext1313
__ptext1313:

;; *************** function i1_setAD_ConvertFlag *****************
;; Defined at:
;;		line 349 in file "D:\develop\AK7030-good\AK7030-OTP\common.c"
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
psect	text1313
	file	"D:\develop\AK7030-good\AK7030-OTP\common.c"
	line	349
	global	__size_ofi1_setAD_ConvertFlag
	__size_ofi1_setAD_ConvertFlag	equ	__end_ofi1_setAD_ConvertFlag-i1_setAD_ConvertFlag
	
i1_setAD_ConvertFlag:	
	opt	stack 4
; Regs used in i1_setAD_ConvertFlag: [wreg]
;i1setAD_ConvertFlag@flag stored from wreg
	movwf	(i1setAD_ConvertFlag@flag)
	line	350
	
i1l3778:	
;common.c: 350: adc_convert_flag = flag;
	movf	(i1setAD_ConvertFlag@flag),w
	movwf	(_adc_convert_flag)
	line	351
	
i1l1575:	
	return
	opt stack 0
GLOBAL	__end_ofi1_setAD_ConvertFlag
	__end_ofi1_setAD_ConvertFlag:
;; =============== function i1_setAD_ConvertFlag ends ============

	signat	i1_setAD_ConvertFlag,88
	global	_adc_get
psect	text1314,local,class=CODE,delta=2
global __ptext1314
__ptext1314:

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
psect	text1314
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
	
i1l2327:	
	return
	opt stack 0
GLOBAL	__end_of_adc_get
	__end_of_adc_get:
;; =============== function _adc_get ends ============

	signat	_adc_get,90
	global	_Filter
psect	text1315,local,class=CODE,delta=2
global __ptext1315
__ptext1315:

;; *************** function _Filter *****************
;; Defined at:
;;		line 117 in file "D:\develop\AK7030-good\AK7030-OTP\common.c"
;; Parameters:    Size  Location     Type
;;  tmpValue        1    wreg     PTR unsigned int 
;;		 -> uiSampleChannelFourteenth(6), uiSampleCh12(6), 
;; Auto vars:     Size  Location     Type
;;  tmpValue        1    4[BANK0 ] PTR unsigned int 
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
psect	text1315
	file	"D:\develop\AK7030-good\AK7030-OTP\common.c"
	line	117
	global	__size_of_Filter
	__size_of_Filter	equ	__end_of_Filter-_Filter
	
_Filter:	
	opt	stack 3
; Regs used in _Filter: [wreg-fsr0h+status,2+status,0+btemp+1]
;Filter@tmpValue stored from wreg
	line	119
	bcf	status, 5	;RP0=0, select bank0
	movwf	(Filter@tmpValue)
	
i1l3578:	
	clrf	(Filter@j)
	line	121
;common.c: 121: unsigned int filter_temp = 0, filter_sum = 0;
	clrf	(Filter@filter_temp)
	clrf	(Filter@filter_temp+1)
	clrf	(Filter@filter_sum)
	clrf	(Filter@filter_sum+1)
	line	125
;common.c: 123: unsigned int filter_buf[3];
;common.c: 125: for(int cir = 0;cir < 3; cir++)
	clrf	(Filter@cir)
	clrf	(Filter@cir+1)
	line	126
	
i1l3584:	
;common.c: 126: filter_buf[cir] = *tmpValue++;
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
	
i1l3586:	
	incf	(Filter@tmpValue),f
	incf	(Filter@tmpValue),f
	line	125
	
i1l3588:	
	incf	(Filter@cir),f
	skipnz
	incf	(Filter@cir+1),f
	
i1l3590:	
	movf	(Filter@cir+1),w
	xorlw	80h
	movwf	btemp+1
	movlw	(high(03h))^80h
	subwf	btemp+1,w
	skipz
	goto	u113_25
	movlw	low(03h)
	subwf	(Filter@cir),w
u113_25:

	skipc
	goto	u113_21
	goto	u113_20
u113_21:
	goto	i1l3584
u113_20:
	line	130
	
i1l3592:	
;common.c: 130: for(j = 0; j < 3 - 1; j++)
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	clrf	(Filter@j)
	line	132
	
i1l3598:	
;common.c: 131: {
;common.c: 132: for(i = 0; i < 3 - 1 - j; i++)
	clrf	(Filter@i)
	goto	i1l3606
	line	134
	
i1l3600:	
;common.c: 133: {
;common.c: 134: if(filter_buf[i] > filter_buf[i + 1])
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
	goto	u114_25
	movf	0+(??_Filter+0)+0,w
	subwf	0+(??_Filter+2)+0,w
u114_25:
	skipnc
	goto	u114_21
	goto	u114_20
u114_21:
	goto	i1l3604
u114_20:
	line	137
	
i1l3602:	
;common.c: 135: {
;common.c: 137: filter_temp = filter_buf[i];
	clrc
	rlf	(Filter@i),w
	addlw	Filter@filter_buf&0ffh
	movwf	fsr0
	movf	indf,w
	movwf	(Filter@filter_temp)
	incf	fsr0,f
	movf	indf,w
	movwf	(Filter@filter_temp+1)
	line	139
;common.c: 139: filter_buf[i] = filter_buf[i + 1];
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
	line	141
;common.c: 141: filter_buf[i + 1] = filter_temp;
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
	line	132
	
i1l3604:	
	incf	(Filter@i),f
	
i1l3606:	
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
	goto	u115_25
	movf	0+(??_Filter+0)+0,w
	subwf	(Filter@i),w
u115_25:

	skipc
	goto	u115_21
	goto	u115_20
u115_21:
	goto	i1l3600
u115_20:
	line	130
	
i1l3608:	
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	incf	(Filter@j),f
	
i1l3610:	
	movlw	(02h)
	subwf	(Filter@j),w
	skipc
	goto	u116_21
	goto	u116_20
u116_21:
	goto	i1l3598
u116_20:
	
i1l1503:	
	line	146
;common.c: 142: }
;common.c: 143: }
;common.c: 144: }
;common.c: 146: for(i = 1; i < 3 - 1; i++)
	clrf	(Filter@i)
	incf	(Filter@i),f
	line	148
	
i1l3616:	
;common.c: 147: {
;common.c: 148: filter_sum += filter_buf[i];
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
	line	146
	
i1l3618:	
	incf	(Filter@i),f
	
i1l3620:	
	movlw	(02h)
	subwf	(Filter@i),w
	skipc
	goto	u117_21
	goto	u117_20
u117_21:
	goto	i1l3616
u117_20:
	line	152
	
i1l3622:	
;common.c: 149: }
;common.c: 152: return (filter_sum );
	movf	(Filter@filter_sum+1),w
	movwf	(?_Filter+1)
	movf	(Filter@filter_sum),w
	movwf	(?_Filter)
	line	154
	
i1l1510:	
	return
	opt stack 0
GLOBAL	__end_of_Filter
	__end_of_Filter:
;; =============== function _Filter ends ============

	signat	_Filter,4218
	global	_setPWM_Width
psect	text1316,local,class=CODE,delta=2
global __ptext1316
__ptext1316:

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
psect	text1316
	file	"D:\develop\AK7030-good\AK7030-OTP\common.c"
	line	65
	global	__size_of_setPWM_Width
	__size_of_setPWM_Width	equ	__end_of_setPWM_Width-_setPWM_Width
	
_setPWM_Width:	
	opt	stack 3
; Regs used in _setPWM_Width: [wreg]
;setPWM_Width@ucWidth stored from wreg
	line	70
	movwf	(setPWM_Width@ucWidth)
	
i1l3528:	
;common.c: 71: ucOldWidth = ucWidth;
	movf	(setPWM_Width@ucWidth),w
	movwf	(21)	;volatile
	line	73
	
i1l1484:	
	return
	opt stack 0
GLOBAL	__end_of_setPWM_Width
	__end_of_setPWM_Width:
;; =============== function _setPWM_Width ends ============

	signat	_setPWM_Width,4216
	global	_getWaitResetFlag
psect	text1317,local,class=CODE,delta=2
global __ptext1317
__ptext1317:

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
psect	text1317
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
	
i1l1478:	
	return
	opt stack 0
GLOBAL	__end_of_getWaitResetFlag
	__end_of_getWaitResetFlag:
;; =============== function _getWaitResetFlag ends ============

	signat	_getWaitResetFlag,89
psect	text1318,local,class=CODE,delta=2
global __ptext1318
__ptext1318:
	global	btemp
	btemp set 07Eh

	DABS	1,126,2	;btemp
	global	wtemp0
	wtemp0 set btemp
	end
