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
	retlw	02h
	line	200

;initializer for vPutSampleDataIntoTable@uiInitWidth
	retlw	04Bh
	global	_uiBigTimer
	global	_uiOneHourTimer
	global	_uiSmallTimer
	global	_uiTwentyMinTimer
	global	_uiTwentySecondsTimer
	global	vPutSampleDataIntoTable@uiCalWidthArray1
	global	vPutSampleDataIntoTable@uiCalWidthArray2
	global	vPutSampleDataIntoTable@uiCalWidthArray3
	global	vPutSampleDataIntoTable@uiCalWidthArray4
	global	vPutSampleDataIntoTable@uiCalWidthCnt
	global	ISR@ucTimer1sCnt
	global	_adc_convert_flag
	global	_bBigTimerStartFlag
	global	_bOneHourTimerStartFlag
	global	_bSmallTimerStartFlag
	global	_bTwentyMinStartFlag
	global	_bWaitResetFlag
	global	_sampleTimes
	global	_timer
	global	vPutSampleDataIntoTable@ucCh13Length
	global	vPutSampleDataIntoTable@ucChannelFourteenthLength
	global	vPutSampleDataIntoTable@ucInitFlag
	global	vPutSampleDataIntoTable@ucCh12Length
	global	main@ucDelay1s
	global	main@uiTimerOneP5s
	global	main@uiTimerTwoP5s
	global	main@cTimerP5s_786
	global	main@cTimerP5s_792
	global	main@ucStep
	global	main@ucTimerP3s
	global	main@ucTimerP5s
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
	global	_PB0
_PB0	set	48
	global	_PB1
_PB1	set	49
	global	_PB2
_PB2	set	50
	global	_PB3
_PB3	set	51
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

_uiTwentySecondsTimer:
       ds      2

vPutSampleDataIntoTable@uiCalWidthArray1:
       ds      2

vPutSampleDataIntoTable@uiCalWidthArray2:
       ds      2

vPutSampleDataIntoTable@uiCalWidthArray3:
       ds      2

vPutSampleDataIntoTable@uiCalWidthArray4:
       ds      2

vPutSampleDataIntoTable@uiCalWidthCnt:
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

vPutSampleDataIntoTable@ucCh13Length:
       ds      1

vPutSampleDataIntoTable@ucChannelFourteenthLength:
       ds      1

vPutSampleDataIntoTable@ucInitFlag:
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
	line	200
vPutSampleDataIntoTable@uiInitWidth:
       ds      1

psect	bssBANK1,class=BANK1,space=1
global __pbssBANK1
__pbssBANK1:
main@ucDelay1s:
       ds      2

main@uiTimerOneP5s:
       ds      2

main@uiTimerTwoP5s:
       ds      2

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
	movlw	low((__pbssBANK0)+020h)
	fcall	clear_ram
; Clear objects allocated to BANK1
psect cinit,class=CODE,delta=2
	movlw	low(__pbssBANK1)
	movwf	fsr
	movlw	low((__pbssBANK1)+01Dh)
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
	global	??_clearTwelveHoursTimer
??_clearTwelveHoursTimer:	; 0 bytes @ 0x0
	global	??_clearThreeHoursTimer
??_clearThreeHoursTimer:	; 0 bytes @ 0x0
	global	??_clearOneHoursTimer
??_clearOneHoursTimer:	; 0 bytes @ 0x0
	global	??_clearTwentyMinTimer
??_clearTwentyMinTimer:	; 0 bytes @ 0x0
	global	??_clock_config
??_clock_config:	; 0 bytes @ 0x0
	global	??_timer1_config
??_timer1_config:	; 0 bytes @ 0x0
	global	??_timer1_interrupt_config
??_timer1_interrupt_config:	; 0 bytes @ 0x0
	global	?_adc_test_init
?_adc_test_init:	; 0 bytes @ 0x0
	global	?_startTwentyMinTimer
?_startTwentyMinTimer:	; 0 bytes @ 0x0
	global	??_adc_start
??_adc_start:	; 0 bytes @ 0x0
	global	??_isPermitSampleTime
??_isPermitSampleTime:	; 0 bytes @ 0x0
	global	??_clrSampeTime
??_clrSampeTime:	; 0 bytes @ 0x0
	global	??_isFinishedTwentyMinTimer
??_isFinishedTwentyMinTimer:	; 0 bytes @ 0x0
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
	global	??_setWaitResetFlag
??_setWaitResetFlag:	; 0 bytes @ 0x0
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
	global	?_pwm_start
?_pwm_start:	; 0 bytes @ 0x0
	global	??_selectAdChannel
??_selectAdChannel:	; 0 bytes @ 0x0
	global	??_reset
??_reset:	; 0 bytes @ 0x0
	global	??_resetAllTimer
??_resetAllTimer:	; 0 bytes @ 0x0
	global	??_getAD_ConvertFlag
??_getAD_ConvertFlag:	; 0 bytes @ 0x0
	global	??_setAD_ConvertFlag
??_setAD_ConvertFlag:	; 0 bytes @ 0x0
	global	?_FilterCh13
?_FilterCh13:	; 2 bytes @ 0x0
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
	global	pwm_start@ucPulseFrequency
pwm_start@ucPulseFrequency:	; 1 bytes @ 0x0
	global	setWaitResetFlag@bValue
setWaitResetFlag@bValue:	; 1 bytes @ 0x0
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
	global	??_pwm_start
??_pwm_start:	; 0 bytes @ 0x1
	global	??_initPin
??_initPin:	; 0 bytes @ 0x1
	global	??_setPinInitVaule
??_setPinInitVaule:	; 0 bytes @ 0x1
	global	pwm_start@ucPulseWidth
pwm_start@ucPulseWidth:	; 1 bytes @ 0x1
	ds	1
	global	??_startTwentyMinTimer
??_startTwentyMinTimer:	; 0 bytes @ 0x2
	global	??_startTwelveHourTimer
??_startTwelveHourTimer:	; 0 bytes @ 0x2
	global	??_startThreeHoursTimer
??_startThreeHoursTimer:	; 0 bytes @ 0x2
	global	??_startOneHoursTimer
??_startOneHoursTimer:	; 0 bytes @ 0x2
	global	??_FilterCh13
??_FilterCh13:	; 0 bytes @ 0x2
	global	adc_test_init@channel
adc_test_init@channel:	; 1 bytes @ 0x2
	ds	1
	global	??_process_AD_Converter_Value
??_process_AD_Converter_Value:	; 0 bytes @ 0x3
	ds	3
	global	FilterCh13@tmpValue
FilterCh13@tmpValue:	; 1 bytes @ 0x6
	ds	1
	global	FilterCh13@filter_temp
FilterCh13@filter_temp:	; 2 bytes @ 0x7
	ds	2
	global	FilterCh13@filter_sum
FilterCh13@filter_sum:	; 2 bytes @ 0x9
	ds	2
	global	FilterCh13@filter_buf
FilterCh13@filter_buf:	; 6 bytes @ 0xB
	ds	6
	global	FilterCh13@cir
FilterCh13@cir:	; 2 bytes @ 0x11
	ds	2
	global	FilterCh13@j
FilterCh13@j:	; 1 bytes @ 0x13
	ds	1
	global	FilterCh13@i
FilterCh13@i:	; 1 bytes @ 0x14
	ds	1
	global	?_getAdOriginalCh13Value
?_getAdOriginalCh13Value:	; 2 bytes @ 0x15
	ds	2
	global	??_getAdOriginalCh13Value
??_getAdOriginalCh13Value:	; 0 bytes @ 0x17
	global	??_main
??_main:	; 0 bytes @ 0x17
	ds	1
	global	main@ucChValue
main@ucChValue:	; 2 bytes @ 0x18
	ds	2
	global	main@uiCh13Value
main@uiCh13Value:	; 2 bytes @ 0x1A
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
	global	vPutSampleDataIntoTable@uiDeviationValue
vPutSampleDataIntoTable@uiDeviationValue:	; 2 bytes @ 0x9
	ds	2
	global	vPutSampleDataIntoTable@i
vPutSampleDataIntoTable@i:	; 2 bytes @ 0xB
	ds	2
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
	global	??_vPutSampleDataIntoTable
??_vPutSampleDataIntoTable:	; 0 bytes @ 0xF
	ds	16
	global	??_ISR
??_ISR:	; 0 bytes @ 0x1F
	ds	4
;;Data sizes: Strings 0, constant 0, data 2, bss 62, persistent 0 stack 0
;;Auto spaces:   Size  Autos    Used
;; COMMON          14     13      14
;; BANK0           80     35      69
;; BANK1           80     28      57
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
;;   None.
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
;;   _process_AD_Converter_Value->_adc_test_init
;;   _setPinInitVaule->_setPB3
;;   _setPinInitVaule->_setPB4
;;   _setPinInitVaule->_setPB5
;;   _initPin->_initPB3
;;   _initPin->_initPB4
;;   _initPin->_initPB5
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
;;                                             23 BANK1      5     5      0
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
;;                                             21 BANK1      2     0      2
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
;;                                              0 BANK1      1     1      0
;; ---------------------------------------------------------------------------------
;; (2) _getAD_ConvertFlag                                    0     0      0       0
;; ---------------------------------------------------------------------------------
;; (2) _FilterCh13                                          21    19      2     915
;;                                              0 BANK1     21    19      2
;; ---------------------------------------------------------------------------------
;; (1) _setWaitResetFlag                                     1     1      0      31
;;                                              0 BANK1      1     1      0
;; ---------------------------------------------------------------------------------
;; (1) _isFinishedOneHoursTimer                              0     0      0       0
;; ---------------------------------------------------------------------------------
;; (1) _startOneHoursTimer                                   2     0      2      31
;;                                              0 BANK1      2     0      2
;; ---------------------------------------------------------------------------------
;; (1) _isFinishedThreeHoursTimer                            0     0      0       0
;; ---------------------------------------------------------------------------------
;; (1) _startThreeHoursTimer                                 2     0      2      31
;;                                              0 BANK1      2     0      2
;; ---------------------------------------------------------------------------------
;; (1) _isFinishedTwelveHoursTimer                           0     0      0       0
;; ---------------------------------------------------------------------------------
;; (1) _startTwelveHourTimer                                 2     0      2      31
;;                                              0 BANK1      2     0      2
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
;;                                              0 BANK1      2     0      2
;; ---------------------------------------------------------------------------------
;; (2) _adc_test_init                                        3     2      1      62
;;                                              0 BANK1      3     2      1
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
;;                                              0 BANK1      2     1      1
;; ---------------------------------------------------------------------------------
;; (2) _initPB2_AsHighResistence                             0     0      0       0
;; ---------------------------------------------------------------------------------
;; (1) _setPB5                                               1     1      0      31
;;                                              0 BANK1      1     1      0
;; ---------------------------------------------------------------------------------
;; (2) _initPB5                                              1     1      0      31
;;                                              0 BANK1      1     1      0
;; ---------------------------------------------------------------------------------
;; (1) _setPB4                                               1     1      0      31
;;                                              0 BANK1      1     1      0
;; ---------------------------------------------------------------------------------
;; (2) _initPB4                                              1     1      0      31
;;                                              0 BANK1      1     1      0
;; ---------------------------------------------------------------------------------
;; (1) _setPB3                                               1     1      0      31
;;                                              0 BANK1      1     1      0
;; ---------------------------------------------------------------------------------
;; (2) _initPB3                                              1     1      0      31
;;                                              0 BANK1      1     1      0
;; ---------------------------------------------------------------------------------
;; Estimated maximum stack depth 2
;; ---------------------------------------------------------------------------------
;; (Depth) Function   	        Calls       Base Space   Used Autos Params    Refs
;; ---------------------------------------------------------------------------------
;; (3) _ISR                                                  4     4      0    1107
;;                                             31 BANK0      4     4      0
;;                i1_setAD_ConvertFlag
;;                            _adc_get
;;            _vPutSampleDataIntoTable
;; ---------------------------------------------------------------------------------
;; (4) _vPutSampleDataIntoTable                             25    22      3    1010
;;                                              6 COMMON     7     4      3
;;                                             15 BANK0     16    16      0
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
;;BANK1               50     1C      39       8       71.3%
;;BITBANK1            50      0       0       7        0.0%
;;CODE                 0      0       0       0        0.0%
;;DATA                 0      0      94       6        0.0%
;;ABS                  0      0      8C       3        0.0%
;;NULL                 0      0       0       0        0.0%
;;STACK                0      0       8       2        0.0%
;;BANK0               50     23      45       5       86.3%
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
;;		line 529 in file "D:\develop\AK7030-good\AK7030-OTP\main.c"
;; Parameters:    Size  Location     Type
;;		None
;; Auto vars:     Size  Location     Type
;;  ucChValue       2   24[BANK1 ] unsigned int 
;;  uiCh13Value     2   26[BANK1 ] unsigned int 
;; Return value:  Size  Location     Type
;;                  2  732[COMMON] int 
;; Registers used:
;;		wreg, fsr0l, fsr0h, status,2, status,0, btemp+1, pclath, cstack
;; Tracked objects:
;;		On entry : 17F/0
;;		On exit  : 60/20
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
	line	529
	global	__size_of_main
	__size_of_main	equ	__end_of_main-_main
	
_main:	
	opt	stack 3
; Regs used in _main: [wreg-fsr0h+status,2+status,0+btemp+1+pclath+cstack]
	line	557
	
l4249:	
;main.c: 530: enum systemStep {
;main.c: 531: INIT_STEP = 0,
;main.c: 532: START_UP_PWM_STEP,
;main.c: 533: CHECK_10_HOUR_TIMER_STEP,
;main.c: 534: STARTUP_3_HOUR_TIMER_STEP,
;main.c: 535: CHECK_3_HOUR_TIMER_STEP,
;main.c: 536: STARTUP_1_HOUR_TIMER_STEP,
;main.c: 537: CHECK_1_HOUR_TIMER_STEP,
;main.c: 538: READY_FOR_RESET_STEP = 99,
;main.c: 539: DELAY_ONE_SECOND_FOR_PWM,
;main.c: 540: MEET_RESET_CONDITION_STEP,
;main.c: 541: RESET_STEP,
;main.c: 542: };
;main.c: 544: static enum systemStep ucStep = INIT_STEP;
	fcall	_initPin
	line	558
;main.c: 558: setPinInitVaule();
	fcall	_setPinInitVaule
	line	559
	
l4251:	
;main.c: 559: selectAdChannel();
	fcall	_selectAdChannel
	line	561
	
l4253:	
;main.c: 561: clock_config();
	fcall	_clock_config
	line	562
	
l4255:	
;main.c: 562: timer1_config();
	fcall	_timer1_config
	line	563
	
l4257:	
;main.c: 563: timer1_interrupt_config();
	fcall	_timer1_interrupt_config
	line	565
;main.c: 565: adc_test_init(2,3);
	movlw	(03h)
	movwf	(?_adc_test_init)^080h
	movlw	(02h)
	fcall	_adc_test_init
	line	571
;main.c: 571: startTwentyMinTimer( 1200 );
	movlw	low(04B0h)
	movwf	(?_startTwentyMinTimer)^080h
	movlw	high(04B0h)
	movwf	((?_startTwentyMinTimer)^080h)+1
	fcall	_startTwentyMinTimer
	line	572
	
l4259:	
;main.c: 572: _delay(1000);
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

	line	573
;main.c: 573: adc_start();
	fcall	_adc_start
	line	584
	
l4261:	
# 584 "D:\develop\AK7030-good\AK7030-OTP\main.c"
 clrwdt ;#
psect	maintext
	line	586
	
l4263:	
;main.c: 586: process_AD_Converter_Value();
	fcall	_process_AD_Converter_Value
	line	588
	
l4265:	
;main.c: 588: if( isPermitSampleTime() )
	fcall	_isPermitSampleTime
	xorlw	0
	skipnz
	goto	u2011
	goto	u2010
u2011:
	goto	l4261
u2010:
	line	592
	
l4267:	
;main.c: 589: {
;main.c: 592: clrSampeTime();
	fcall	_clrSampeTime
	line	601
;main.c: 601: switch(ucStep)
	goto	l4413
	line	612
	
l4269:	
;main.c: 605: {
;main.c: 610: static unsigned char ucTimerP3s = 0;
;main.c: 612: if( isFinishedTwentyMinTimer() )
	fcall	_isFinishedTwentyMinTimer
	xorlw	0
	skipnz
	goto	u2021
	goto	u2020
u2021:
	goto	l4275
u2020:
	line	614
	
l4271:	
;main.c: 613: {
;main.c: 614: ucStep = READY_FOR_RESET_STEP;
	movlw	(063h)
	bsf	status, 5	;RP0=1, select bank1
	movwf	(main@ucStep)^080h
	line	615
	
l4273:	
;main.c: 615: ucTimerP3s = 0;
	clrf	(main@ucTimerP3s)^080h
	line	616
;main.c: 616: }
	goto	l4261
	line	619
	
l4275:	
;main.c: 617: else
;main.c: 618: {
;main.c: 619: if( getAdOriginalCh13Value() > 90 )
	fcall	_getAdOriginalCh13Value
	movlw	high(05Bh)
	subwf	(1+(?_getAdOriginalCh13Value))^080h,w
	movlw	low(05Bh)
	skipnz
	subwf	(0+(?_getAdOriginalCh13Value))^080h,w
	skipc
	goto	u2031
	goto	u2030
u2031:
	goto	l4279
u2030:
	line	621
	
l4277:	
;main.c: 620: {
;main.c: 621: ucTimerP3s++;
	incf	(main@ucTimerP3s)^080h,f
	line	622
;main.c: 622: }
	goto	l4281
	line	624
	
l4279:	
;main.c: 623: else
;main.c: 624: ucTimerP3s = 0;
	clrf	(main@ucTimerP3s)^080h
	line	626
	
l4281:	
;main.c: 626: if( ucTimerP3s >= 30)
	movlw	(01Eh)
	subwf	(main@ucTimerP3s)^080h,w
	skipc
	goto	u2041
	goto	u2040
u2041:
	goto	l736
u2040:
	line	628
	
l4283:	
;main.c: 627: {
;main.c: 628: ucTimerP3s = 0;
	clrf	(main@ucTimerP3s)^080h
	line	629
	
l4285:	
;main.c: 629: ucStep = START_UP_PWM_STEP;
	bsf	status, 5	;RP0=1, select bank1
	clrf	(main@ucStep)^080h
	incf	(main@ucStep)^080h,f
	goto	l4261
	line	645
	
l4287:	
;main.c: 640: {
;main.c: 645: pwm_start(150,249);
	movlw	(0F9h)
	movwf	(?_pwm_start)^080h
	movlw	(096h)
	fcall	_pwm_start
	line	647
;main.c: 647: setPB3(0);
	movlw	(0)
	fcall	_setPB3
	line	648
;main.c: 648: setPB4(1);
	movlw	(01h)
	fcall	_setPB4
	line	649
;main.c: 649: setPB5(0);
	movlw	(0)
	fcall	_setPB5
	line	650
	
l4289:	
;main.c: 650: clearTwentyMinTimer();
	fcall	_clearTwentyMinTimer
	line	651
	
l4291:	
;main.c: 651: startTwelveHourTimer( 36000);
	movlw	low(08CA0h)
	bsf	status, 5	;RP0=1, select bank1
	movwf	(?_startTwelveHourTimer)^080h
	movlw	high(08CA0h)
	movwf	((?_startTwelveHourTimer)^080h)+1
	fcall	_startTwelveHourTimer
	line	652
	
l4293:	
;main.c: 652: ucStep = CHECK_10_HOUR_TIMER_STEP;
	movlw	(02h)
	bsf	status, 5	;RP0=1, select bank1
	movwf	(main@ucStep)^080h
	line	653
;main.c: 653: break;
	goto	l4261
	line	664
	
l4295:	
;main.c: 657: {
;main.c: 662: static unsigned char ucTimerP5s = 0;
;main.c: 664: if( isFinishedTwelveHoursTimer () )
	fcall	_isFinishedTwelveHoursTimer
	xorlw	0
	skipnz
	goto	u2051
	goto	u2050
u2051:
	goto	l4299
u2050:
	line	665
	
l4297:	
;main.c: 665: ucStep = READY_FOR_RESET_STEP;
	movlw	(063h)
	bsf	status, 5	;RP0=1, select bank1
	movwf	(main@ucStep)^080h
	goto	l4261
	line	668
	
l4299:	
;main.c: 666: else
;main.c: 667: {
;main.c: 668: if( getAdOriginalCh13Value() < 200 )
	fcall	_getAdOriginalCh13Value
	movlw	high(0C8h)
	subwf	(1+(?_getAdOriginalCh13Value))^080h,w
	movlw	low(0C8h)
	skipnz
	subwf	(0+(?_getAdOriginalCh13Value))^080h,w
	skipnc
	goto	u2061
	goto	u2060
u2061:
	goto	l4303
u2060:
	line	669
	
l4301:	
;main.c: 669: ucTimerP5s++;
	incf	(main@ucTimerP5s)^080h,f
	goto	l4305
	line	671
	
l4303:	
;main.c: 670: else
;main.c: 671: ucTimerP5s = 0;
	clrf	(main@ucTimerP5s)^080h
	line	673
	
l4305:	
;main.c: 673: if( ucTimerP5s >= 10)
	movlw	(0Ah)
	subwf	(main@ucTimerP5s)^080h,w
	skipc
	goto	u2071
	goto	u2070
u2071:
	goto	l736
u2070:
	line	675
	
l4307:	
;main.c: 674: {
;main.c: 675: ucTimerP5s = 0;
	clrf	(main@ucTimerP5s)^080h
	line	676
	
l4309:	
;main.c: 676: ucStep = STARTUP_3_HOUR_TIMER_STEP;
	movlw	(03h)
	movwf	(main@ucStep)^080h
	goto	l4261
	line	685
	
l4311:	
;main.c: 684: {
;main.c: 685: clearTwelveHoursTimer();
	fcall	_clearTwelveHoursTimer
	line	686
	
l4313:	
;main.c: 686: startThreeHoursTimer(10800);
	movlw	low(02A30h)
	bsf	status, 5	;RP0=1, select bank1
	movwf	(?_startThreeHoursTimer)^080h
	movlw	high(02A30h)
	movwf	((?_startThreeHoursTimer)^080h)+1
	fcall	_startThreeHoursTimer
	line	687
;main.c: 687: ucStep = CHECK_3_HOUR_TIMER_STEP;
	movlw	(04h)
	bsf	status, 5	;RP0=1, select bank1
	movwf	(main@ucStep)^080h
	line	688
;main.c: 688: break;
	goto	l4261
	line	695
	
l4315:	
;main.c: 692: {
;main.c: 693: static unsigned char ucTimerP5s = 0;
;main.c: 695: if( isFinishedThreeHoursTimer() )
	fcall	_isFinishedThreeHoursTimer
	xorlw	0
	skipnz
	goto	u2081
	goto	u2080
u2081:
	goto	l4319
u2080:
	goto	l4297
	line	699
	
l4319:	
;main.c: 697: else
;main.c: 698: {
;main.c: 699: if( getAdOriginalCh13Value() < 65 )
	fcall	_getAdOriginalCh13Value
	movlw	high(041h)
	subwf	(1+(?_getAdOriginalCh13Value))^080h,w
	movlw	low(041h)
	skipnz
	subwf	(0+(?_getAdOriginalCh13Value))^080h,w
	skipnc
	goto	u2091
	goto	u2090
u2091:
	goto	l4323
u2090:
	line	700
	
l4321:	
;main.c: 700: ucTimerP5s++;
	incf	(main@cTimerP5s_786)^080h,f
	goto	l4325
	line	702
	
l4323:	
;main.c: 701: else
;main.c: 702: ucTimerP5s = 0;
	clrf	(main@cTimerP5s_786)^080h
	line	704
	
l4325:	
;main.c: 704: if( ucTimerP5s >= 10)
	movlw	(0Ah)
	subwf	(main@cTimerP5s_786)^080h,w
	skipc
	goto	u2101
	goto	u2100
u2101:
	goto	l736
u2100:
	line	706
	
l4327:	
;main.c: 705: {
;main.c: 706: ucTimerP5s = 0;
	clrf	(main@cTimerP5s_786)^080h
	line	707
	
l4329:	
;main.c: 707: ucStep = STARTUP_1_HOUR_TIMER_STEP;
	movlw	(05h)
	movwf	(main@ucStep)^080h
	goto	l4261
	line	715
	
l4331:	
;main.c: 714: {
;main.c: 715: clearThreeHoursTimer();
	fcall	_clearThreeHoursTimer
	line	716
	
l4333:	
;main.c: 716: startOneHoursTimer( 3600 );
	movlw	low(0E10h)
	bsf	status, 5	;RP0=1, select bank1
	movwf	(?_startOneHoursTimer)^080h
	movlw	high(0E10h)
	movwf	((?_startOneHoursTimer)^080h)+1
	fcall	_startOneHoursTimer
	line	717
	
l4335:	
;main.c: 717: setPB3(1);
	movlw	(01h)
	fcall	_setPB3
	line	718
	
l4337:	
;main.c: 718: setPB4(0);
	movlw	(0)
	fcall	_setPB4
	line	719
	
l4339:	
;main.c: 719: setPB5(1);
	movlw	(01h)
	fcall	_setPB5
	line	720
	
l4341:	
;main.c: 720: ucStep = CHECK_1_HOUR_TIMER_STEP;
	movlw	(06h)
	bsf	status, 5	;RP0=1, select bank1
	movwf	(main@ucStep)^080h
	line	721
;main.c: 721: break;
	goto	l4261
	line	734
	
l4343:	
;main.c: 725: {
;main.c: 730: static unsigned int uiTimerOneP5s = 0;
;main.c: 731: static unsigned int uiTimerTwoP5s = 0;
;main.c: 732: static unsigned int uiTimerThreeP5s = 0;
;main.c: 734: unsigned int uiCh13Value = getAdOriginalCh13Value();
	fcall	_getAdOriginalCh13Value
	movf	(1+(?_getAdOriginalCh13Value))^080h,w
	movwf	(main@uiCh13Value+1)^080h
	movf	(0+(?_getAdOriginalCh13Value))^080h,w
	movwf	(main@uiCh13Value)^080h
	line	737
	
l4345:	
;main.c: 737: if( isFinishedOneHoursTimer() )
	fcall	_isFinishedOneHoursTimer
	xorlw	0
	skipnz
	goto	u2111
	goto	u2110
u2111:
	goto	l4349
u2110:
	goto	l4297
	line	741
	
l4349:	
;main.c: 739: else
;main.c: 740: {
;main.c: 741: if( uiCh13Value > 90 )
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
	goto	l4357
u2120:
	line	743
	
l4351:	
;main.c: 742: {
;main.c: 743: if( uiTimerOneP5s <= 10 )
	movlw	high(0Bh)
	subwf	(main@uiTimerOneP5s+1)^080h,w
	movlw	low(0Bh)
	skipnz
	subwf	(main@uiTimerOneP5s)^080h,w
	skipnc
	goto	u2131
	goto	u2130
u2131:
	goto	l4355
u2130:
	line	744
	
l4353:	
;main.c: 744: uiTimerOneP5s++;
	incf	(main@uiTimerOneP5s)^080h,f
	skipnz
	incf	(main@uiTimerOneP5s+1)^080h,f
	line	745
	
l4355:	
;main.c: 746: uiTimerThreeP5s = 0;
	clrf	(main@uiTimerTwoP5s)^080h
	clrf	(main@uiTimerTwoP5s+1)^080h
	line	747
;main.c: 747: }
	goto	l4359
	line	750
	
l4357:	
;main.c: 748: else
;main.c: 749: {
;main.c: 750: uiTimerOneP5s = 0;
	clrf	(main@uiTimerOneP5s)^080h
	clrf	(main@uiTimerOneP5s+1)^080h
	line	754
	
l4359:	
;main.c: 751: }
;main.c: 754: if(uiTimerOneP5s > 10)
	movlw	high(0Bh)
	subwf	(main@uiTimerOneP5s+1)^080h,w
	movlw	low(0Bh)
	skipnz
	subwf	(main@uiTimerOneP5s)^080h,w
	skipc
	goto	u2141
	goto	u2140
u2141:
	goto	l4371
u2140:
	line	756
	
l4361:	
;main.c: 755: {
;main.c: 756: setPB3(0);
	movlw	(0)
	fcall	_setPB3
	line	757
;main.c: 757: setPB4(1);
	movlw	(01h)
	fcall	_setPB4
	line	758
;main.c: 758: setPB5(0);
	movlw	(0)
	fcall	_setPB5
	line	760
	
l4363:	
;main.c: 760: uiTimerOneP5s = 0;
	bsf	status, 5	;RP0=1, select bank1
	clrf	(main@uiTimerOneP5s)^080h
	clrf	(main@uiTimerOneP5s+1)^080h
	line	761
	
l4365:	
;main.c: 761: uiTimerTwoP5s = 0;
	clrf	(main@uiTimerTwoP5s)^080h
	clrf	(main@uiTimerTwoP5s+1)^080h
	line	763
	
l4367:	
;main.c: 763: resetAllTimer();
	fcall	_resetAllTimer
	goto	l4285
	line	769
	
l4371:	
;main.c: 767: else
;main.c: 768: {
;main.c: 769: if( uiCh13Value < 65 )
	movlw	high(041h)
	subwf	(main@uiCh13Value+1)^080h,w
	movlw	low(041h)
	skipnz
	subwf	(main@uiCh13Value)^080h,w
	skipnc
	goto	u2151
	goto	u2150
u2151:
	goto	l4377
u2150:
	line	772
	
l4373:	
;main.c: 770: {
;main.c: 772: if( uiTimerTwoP5s <= 10)
	movlw	high(0Bh)
	subwf	(main@uiTimerTwoP5s+1)^080h,w
	movlw	low(0Bh)
	skipnz
	subwf	(main@uiTimerTwoP5s)^080h,w
	skipnc
	goto	u2161
	goto	u2160
u2161:
	goto	l4379
u2160:
	line	773
	
l4375:	
;main.c: 773: uiTimerTwoP5s++;
	incf	(main@uiTimerTwoP5s)^080h,f
	skipnz
	incf	(main@uiTimerTwoP5s+1)^080h,f
	goto	l4379
	line	777
	
l4377:	
;main.c: 778: uiTimerThreeP5s = 0;
	clrf	(main@uiTimerTwoP5s)^080h
	clrf	(main@uiTimerTwoP5s+1)^080h
	line	781
	
l4379:	
;main.c: 779: }
;main.c: 781: if(uiTimerTwoP5s > 10)
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
	line	783
	
l4381:	
;main.c: 782: {
;main.c: 783: setPB3(1);
	movlw	(01h)
	fcall	_setPB3
	line	784
;main.c: 784: setPB4(0);
	movlw	(0)
	fcall	_setPB4
	line	785
;main.c: 785: setPB5(1);
	movlw	(01h)
	fcall	_setPB5
	goto	l4261
	line	805
	
l4383:	
;main.c: 804: {
;main.c: 805: setPB3(0);
	movlw	(0)
	fcall	_setPB3
	line	806
;main.c: 806: setPB4(0);
	movlw	(0)
	fcall	_setPB4
	line	807
;main.c: 807: setPB5(1);
	movlw	(01h)
	fcall	_setPB5
	line	810
;main.c: 810: setWaitResetFlag(1);
	movlw	(01h)
	fcall	_setWaitResetFlag
	line	811
;main.c: 811: pwm_start(150,249);
	movlw	(0F9h)
	bsf	status, 5	;RP0=1, select bank1
	movwf	(?_pwm_start)^080h
	movlw	(096h)
	fcall	_pwm_start
	line	817
	
l4385:	
;main.c: 817: ucStep = DELAY_ONE_SECOND_FOR_PWM;
	movlw	(064h)
	bsf	status, 5	;RP0=1, select bank1
	movwf	(main@ucStep)^080h
	line	818
;main.c: 818: break;
	goto	l4261
	line	824
	
l4387:	
;main.c: 822: {
;main.c: 823: static unsigned ucDelay1s = 0;
;main.c: 824: if(ucDelay1s <= 50)
	movlw	high(033h)
	subwf	(main@ucDelay1s+1)^080h,w
	movlw	low(033h)
	skipnz
	subwf	(main@ucDelay1s)^080h,w
	skipnc
	goto	u2181
	goto	u2180
u2181:
	goto	l4391
u2180:
	line	825
	
l4389:	
;main.c: 825: ucDelay1s++;
	incf	(main@ucDelay1s)^080h,f
	skipnz
	incf	(main@ucDelay1s+1)^080h,f
	goto	l4261
	line	828
	
l4391:	
;main.c: 826: else
;main.c: 827: {
;main.c: 828: ucDelay1s = 0;
	clrf	(main@ucDelay1s)^080h
	clrf	(main@ucDelay1s+1)^080h
	line	829
	
l4393:	
;main.c: 829: ucStep = MEET_RESET_CONDITION_STEP;
	movlw	(065h)
	movwf	(main@ucStep)^080h
	goto	l4261
	line	841
	
l4395:	
;main.c: 839: {
;main.c: 840: static unsigned char ucTimerP5s = 0;
;main.c: 841: unsigned int ucChValue = getAdOriginalCh13Value();
	fcall	_getAdOriginalCh13Value
	movf	(1+(?_getAdOriginalCh13Value))^080h,w
	movwf	(main@ucChValue+1)^080h
	movf	(0+(?_getAdOriginalCh13Value))^080h,w
	movwf	(main@ucChValue)^080h
	line	843
	
l4397:	
;main.c: 843: if( ucChValue > 50 )
	movlw	high(033h)
	subwf	(main@ucChValue+1)^080h,w
	movlw	low(033h)
	skipnz
	subwf	(main@ucChValue)^080h,w
	skipc
	goto	u2191
	goto	u2190
u2191:
	goto	l4401
u2190:
	line	844
	
l4399:	
;main.c: 844: ucTimerP5s++;
	incf	(main@cTimerP5s_792)^080h,f
	goto	l4403
	line	846
	
l4401:	
;main.c: 845: else
;main.c: 846: ucTimerP5s = 0;
	clrf	(main@cTimerP5s_792)^080h
	line	848
	
l4403:	
;main.c: 848: if(ucTimerP5s >= 50)
	movlw	(032h)
	subwf	(main@cTimerP5s_792)^080h,w
	skipc
	goto	u2201
	goto	u2200
u2201:
	goto	l736
u2200:
	line	849
	
l4405:	
;main.c: 849: ucStep = RESET_STEP;
	movlw	(066h)
	movwf	(main@ucStep)^080h
	goto	l4261
	line	855
	
l4407:	
;main.c: 854: {
;main.c: 855: ucStep = INIT_STEP;
	clrf	(main@ucStep)^080h
	line	856
	
l4409:	
;main.c: 856: reset();
	fcall	_reset
	line	857
;main.c: 857: break;
	goto	l4261
	line	601
	
l4413:	
	bsf	status, 5	;RP0=1, select bank1
	movf	(main@ucStep)^080h,w
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
	goto	l4269
	xorlw	1^0	; case 1
	skipnz
	goto	l4287
	xorlw	2^1	; case 2
	skipnz
	goto	l4295
	xorlw	3^2	; case 3
	skipnz
	goto	l4311
	xorlw	4^3	; case 4
	skipnz
	goto	l4315
	xorlw	5^4	; case 5
	skipnz
	goto	l4331
	xorlw	6^5	; case 6
	skipnz
	goto	l4343
	xorlw	99^6	; case 99
	skipnz
	goto	l4383
	xorlw	100^99	; case 100
	skipnz
	goto	l4387
	xorlw	101^100	; case 101
	skipnz
	goto	l4395
	xorlw	102^101	; case 102
	skipnz
	goto	l4407
	goto	l736
	opt asmopt_on

	line	865
	
l736:	
	goto	l4261
	global	start
	ljmp	start
	opt stack 0
psect	maintext
	line	868
GLOBAL	__end_of_main
	__end_of_main:
;; =============== function _main ends ============

	signat	_main,90
	global	_getAdOriginalCh13Value
psect	text1365,local,class=CODE,delta=2
global __ptext1365
__ptext1365:

;; *************** function _getAdOriginalCh13Value *****************
;; Defined at:
;;		line 397 in file "D:\develop\AK7030-good\AK7030-OTP\common.c"
;; Parameters:    Size  Location     Type
;;		None
;; Auto vars:     Size  Location     Type
;;		None
;; Return value:  Size  Location     Type
;;                  2   21[BANK1 ] unsigned int 
;; Registers used:
;;		wreg, fsr0l, fsr0h, status,2, status,0, btemp+1, pclath, cstack
;; Tracked objects:
;;		On entry : 40/0
;;		On exit  : 160/20
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
psect	text1365
	file	"D:\develop\AK7030-good\AK7030-OTP\common.c"
	line	397
	global	__size_of_getAdOriginalCh13Value
	__size_of_getAdOriginalCh13Value	equ	__end_of_getAdOriginalCh13Value-_getAdOriginalCh13Value
	
_getAdOriginalCh13Value:	
	opt	stack 3
; Regs used in _getAdOriginalCh13Value: [wreg-fsr0h+status,2+status,0+btemp+1+pclath+cstack]
	line	399
	
l4245:	
;common.c: 399: return FilterCh13(uiSampleCh13);
	movlw	(_uiSampleCh13)&0ffh
	fcall	_FilterCh13
	movf	(1+(?_FilterCh13))^080h,w
	movwf	(?_getAdOriginalCh13Value+1)^080h
	movf	(0+(?_FilterCh13))^080h,w
	movwf	(?_getAdOriginalCh13Value)^080h
	line	404
	
l1590:	
	return
	opt stack 0
GLOBAL	__end_of_getAdOriginalCh13Value
	__end_of_getAdOriginalCh13Value:
;; =============== function _getAdOriginalCh13Value ends ============

	signat	_getAdOriginalCh13Value,90
	global	_process_AD_Converter_Value
psect	text1366,local,class=CODE,delta=2
global __ptext1366
__ptext1366:

;; *************** function _process_AD_Converter_Value *****************
;; Defined at:
;;		line 419 in file "D:\develop\AK7030-good\AK7030-OTP\common.c"
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
psect	text1366
	file	"D:\develop\AK7030-good\AK7030-OTP\common.c"
	line	419
	global	__size_of_process_AD_Converter_Value
	__size_of_process_AD_Converter_Value	equ	__end_of_process_AD_Converter_Value-_process_AD_Converter_Value
	
_process_AD_Converter_Value:	
	opt	stack 3
; Regs used in _process_AD_Converter_Value: [wreg+status,2+status,0+pclath+cstack]
	line	420
	
l4233:	
;common.c: 420: if(getAD_ConvertFlag())
	fcall	_getAD_ConvertFlag
	xorlw	0
	skipnz
	goto	u1991
	goto	u1990
u1991:
	goto	l1599
u1990:
	line	422
	
l4235:	
;common.c: 421: {
;common.c: 422: setAD_ConvertFlag(0);
	movlw	(0)
	fcall	_setAD_ConvertFlag
	line	423
;common.c: 423: AD_Sample();
	fcall	_AD_Sample
	line	424
	
l4237:	
;common.c: 424: if(2 == sampleChannelSelect)
	movf	(_sampleChannelSelect),w
	xorlw	02h
	skipz
	goto	u2001
	goto	u2000
u2001:
	goto	l4241
u2000:
	line	425
	
l4239:	
;common.c: 425: adc_test_init(2,3);
	movlw	(03h)
	bsf	status, 5	;RP0=1, select bank1
	movwf	(?_adc_test_init)^080h
	movlw	(02h)
	fcall	_adc_test_init
	goto	l4243
	line	427
	
l4241:	
;common.c: 426: else
;common.c: 427: adc_test_init(1,3);
	movlw	(03h)
	bsf	status, 5	;RP0=1, select bank1
	movwf	(?_adc_test_init)^080h
	movlw	(01h)
	fcall	_adc_test_init
	line	428
	
l4243:	
;common.c: 428: adc_start();
	fcall	_adc_start
	line	430
	
l1599:	
	return
	opt stack 0
GLOBAL	__end_of_process_AD_Converter_Value
	__end_of_process_AD_Converter_Value:
;; =============== function _process_AD_Converter_Value ends ============

	signat	_process_AD_Converter_Value,88
	global	_resetAllTimer
psect	text1367,local,class=CODE,delta=2
global __ptext1367
__ptext1367:

;; *************** function _resetAllTimer *****************
;; Defined at:
;;		line 494 in file "D:\develop\AK7030-good\AK7030-OTP\main.c"
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
psect	text1367
	file	"D:\develop\AK7030-good\AK7030-OTP\main.c"
	line	494
	global	__size_of_resetAllTimer
	__size_of_resetAllTimer	equ	__end_of_resetAllTimer-_resetAllTimer
	
_resetAllTimer:	
	opt	stack 3
; Regs used in _resetAllTimer: [status,2+status,0+pclath+cstack]
	line	495
	
l4231:	
;main.c: 495: clearTwelveHoursTimer();
	fcall	_clearTwelveHoursTimer
	line	496
;main.c: 496: clearThreeHoursTimer();
	fcall	_clearThreeHoursTimer
	line	497
;main.c: 497: clearOneHoursTimer();
	fcall	_clearOneHoursTimer
	line	498
;main.c: 498: clearTwentyMinTimer();
	fcall	_clearTwentyMinTimer
	line	499
	
l730:	
	return
	opt stack 0
GLOBAL	__end_of_resetAllTimer
	__end_of_resetAllTimer:
;; =============== function _resetAllTimer ends ============

	signat	_resetAllTimer,88
	global	_setPinInitVaule
psect	text1368,local,class=CODE,delta=2
global __ptext1368
__ptext1368:

;; *************** function _setPinInitVaule *****************
;; Defined at:
;;		line 285 in file "D:\develop\AK7030-good\AK7030-OTP\main.c"
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
psect	text1368
	file	"D:\develop\AK7030-good\AK7030-OTP\main.c"
	line	285
	global	__size_of_setPinInitVaule
	__size_of_setPinInitVaule	equ	__end_of_setPinInitVaule-_setPinInitVaule
	
_setPinInitVaule:	
	opt	stack 3
; Regs used in _setPinInitVaule: [wreg+status,2+status,0+pclath+cstack]
	line	287
	
l4229:	
;main.c: 287: setPB3(1);
	movlw	(01h)
	fcall	_setPB3
	line	288
;main.c: 288: setPB4(0);
	movlw	(0)
	fcall	_setPB4
	line	289
;main.c: 289: setPB5(1);
	movlw	(01h)
	fcall	_setPB5
	line	293
	
l718:	
	return
	opt stack 0
GLOBAL	__end_of_setPinInitVaule
	__end_of_setPinInitVaule:
;; =============== function _setPinInitVaule ends ============

	signat	_setPinInitVaule,88
	global	_initPin
psect	text1369,local,class=CODE,delta=2
global __ptext1369
__ptext1369:

;; *************** function _initPin *****************
;; Defined at:
;;		line 269 in file "D:\develop\AK7030-good\AK7030-OTP\main.c"
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
psect	text1369
	file	"D:\develop\AK7030-good\AK7030-OTP\main.c"
	line	269
	global	__size_of_initPin
	__size_of_initPin	equ	__end_of_initPin-_initPin
	
_initPin:	
	opt	stack 3
; Regs used in _initPin: [wreg+status,2+status,0+pclath+cstack]
	line	271
	
l4221:	
;main.c: 271: initPB2_AsHighResistence();
	fcall	_initPB2_AsHighResistence
	line	273
	
l4223:	
;main.c: 273: initPB3(0);
	movlw	(0)
	fcall	_initPB3
	line	275
	
l4225:	
;main.c: 275: initPB4(0);
	movlw	(0)
	fcall	_initPB4
	line	277
	
l4227:	
;main.c: 277: initPB5(0);
	movlw	(0)
	fcall	_initPB5
	line	282
	
l715:	
	return
	opt stack 0
GLOBAL	__end_of_initPin
	__end_of_initPin:
;; =============== function _initPin ends ============

	signat	_initPin,88
	global	_AD_Sample
psect	text1370,local,class=CODE,delta=2
global __ptext1370
__ptext1370:

;; *************** function _AD_Sample *****************
;; Defined at:
;;		line 442 in file "D:\develop\AK7030-good\AK7030-OTP\common.c"
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
psect	text1370
	file	"D:\develop\AK7030-good\AK7030-OTP\common.c"
	line	442
	global	__size_of_AD_Sample
	__size_of_AD_Sample	equ	__end_of_AD_Sample-_AD_Sample
	
_AD_Sample:	
	opt	stack 3
; Regs used in _AD_Sample: [wreg+status,2+status,0]
	line	443
	
l4207:	
;common.c: 443: if(sampleTimes < 3)
	movlw	(03h)
	subwf	(_sampleTimes),w
	skipnc
	goto	u1961
	goto	u1960
u1961:
	goto	l1606
u1960:
	line	445
	
l4209:	
;common.c: 444: {
;common.c: 445: sampleTimes++;
	incf	(_sampleTimes),f
	line	447
	
l4211:	
;common.c: 447: if(sampleTimes >= 3)
	movlw	(03h)
	subwf	(_sampleTimes),w
	skipc
	goto	u1971
	goto	u1970
u1971:
	goto	l1606
u1970:
	line	449
	
l4213:	
;common.c: 448: {
;common.c: 449: sampleTimes = 0;
	clrf	(_sampleTimes)
	line	451
	
l4215:	
;common.c: 451: if(sampleChannelSelect == 2)
	movf	(_sampleChannelSelect),w
	xorlw	02h
	skipz
	goto	u1981
	goto	u1980
u1981:
	goto	l4219
u1980:
	line	453
	
l4217:	
;common.c: 452: {
;common.c: 453: sampleChannelSelect = 1;
	clrf	(_sampleChannelSelect)
	incf	(_sampleChannelSelect),f
	line	454
;common.c: 454: }
	goto	l1606
	line	458
	
l4219:	
;common.c: 456: else
;common.c: 457: {
;common.c: 458: sampleChannelSelect = 2;
	movlw	(02h)
	movwf	(_sampleChannelSelect)
	line	462
	
l1606:	
	return
	opt stack 0
GLOBAL	__end_of_AD_Sample
	__end_of_AD_Sample:
;; =============== function _AD_Sample ends ============

	signat	_AD_Sample,88
	global	_setAD_ConvertFlag
psect	text1371,local,class=CODE,delta=2
global __ptext1371
__ptext1371:

;; *************** function _setAD_ConvertFlag *****************
;; Defined at:
;;		line 374 in file "D:\develop\AK7030-good\AK7030-OTP\common.c"
;; Parameters:    Size  Location     Type
;;  flag            1    wreg     unsigned char 
;; Auto vars:     Size  Location     Type
;;  flag            1    0[BANK1 ] unsigned char 
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
;;      Locals:         0       0       1       0       0
;;      Temps:          0       0       0       0       0
;;      Totals:         0       0       1       0       0
;;Total ram usage:        1 bytes
;; Hardware stack levels used:    1
;; Hardware stack levels required when called:    3
;; This function calls:
;;		Nothing
;; This function is called by:
;;		_process_AD_Converter_Value
;; This function uses a non-reentrant model
;;
psect	text1371
	file	"D:\develop\AK7030-good\AK7030-OTP\common.c"
	line	374
	global	__size_of_setAD_ConvertFlag
	__size_of_setAD_ConvertFlag	equ	__end_of_setAD_ConvertFlag-_setAD_ConvertFlag
	
_setAD_ConvertFlag:	
	opt	stack 3
; Regs used in _setAD_ConvertFlag: [wreg]
;setAD_ConvertFlag@flag stored from wreg
	bsf	status, 5	;RP0=1, select bank1
	movwf	(setAD_ConvertFlag@flag)^080h
	line	375
	
l4205:	
;common.c: 375: adc_convert_flag = flag;
	movf	(setAD_ConvertFlag@flag)^080h,w
	bcf	status, 5	;RP0=0, select bank0
	movwf	(_adc_convert_flag)
	line	376
	
l1584:	
	return
	opt stack 0
GLOBAL	__end_of_setAD_ConvertFlag
	__end_of_setAD_ConvertFlag:
;; =============== function _setAD_ConvertFlag ends ============

	signat	_setAD_ConvertFlag,4216
	global	_getAD_ConvertFlag
psect	text1372,local,class=CODE,delta=2
global __ptext1372
__ptext1372:

;; *************** function _getAD_ConvertFlag *****************
;; Defined at:
;;		line 368 in file "D:\develop\AK7030-good\AK7030-OTP\common.c"
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
psect	text1372
	file	"D:\develop\AK7030-good\AK7030-OTP\common.c"
	line	368
	global	__size_of_getAD_ConvertFlag
	__size_of_getAD_ConvertFlag	equ	__end_of_getAD_ConvertFlag-_getAD_ConvertFlag
	
_getAD_ConvertFlag:	
	opt	stack 3
; Regs used in _getAD_ConvertFlag: [wreg]
	line	369
	
l4201:	
;common.c: 369: return adc_convert_flag;
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	movf	(_adc_convert_flag),w
	line	370
	
l1581:	
	return
	opt stack 0
GLOBAL	__end_of_getAD_ConvertFlag
	__end_of_getAD_ConvertFlag:
;; =============== function _getAD_ConvertFlag ends ============

	signat	_getAD_ConvertFlag,89
	global	_FilterCh13
psect	text1373,local,class=CODE,delta=2
global __ptext1373
__ptext1373:

;; *************** function _FilterCh13 *****************
;; Defined at:
;;		line 76 in file "D:\develop\AK7030-good\AK7030-OTP\common.c"
;; Parameters:    Size  Location     Type
;;  tmpValue        1    wreg     PTR unsigned int 
;;		 -> uiSampleCh13(6), 
;; Auto vars:     Size  Location     Type
;;  tmpValue        1    6[BANK1 ] PTR unsigned int 
;;		 -> uiSampleCh13(6), 
;;  cir             2   17[BANK1 ] int 
;;  filter_buf      6   11[BANK1 ] unsigned int [3]
;;  filter_sum      2    9[BANK1 ] unsigned int 
;;  filter_temp     2    7[BANK1 ] unsigned int 
;;  i               1   20[BANK1 ] unsigned char 
;;  j               1   19[BANK1 ] unsigned char 
;; Return value:  Size  Location     Type
;;                  2    0[BANK1 ] unsigned int 
;; Registers used:
;;		wreg, fsr0l, fsr0h, status,2, status,0, btemp+1
;; Tracked objects:
;;		On entry : 40/0
;;		On exit  : 160/20
;;		Unchanged: FFE00/0
;; Data sizes:     COMMON   BANK0   BANK1   BANK3   BANK2
;;      Params:         0       0       2       0       0
;;      Locals:         0       0      15       0       0
;;      Temps:          0       0       4       0       0
;;      Totals:         0       0      21       0       0
;;Total ram usage:       21 bytes
;; Hardware stack levels used:    1
;; Hardware stack levels required when called:    3
;; This function calls:
;;		Nothing
;; This function is called by:
;;		_getAdOriginalCh13Value
;; This function uses a non-reentrant model
;;
psect	text1373
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
	
l4153:	
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
	
l4159:	
;common.c: 84: filter_buf[cir] = *tmpValue++;
	bsf	status, 5	;RP0=1, select bank1
	bcf	status, 6	;RP1=0, select bank1
	movf	(FilterCh13@tmpValue)^080h,w
	movwf	fsr0
	bcf	status, 7	;select IRP bank0
	movf	indf,w
	movwf	(??_FilterCh13+0)^080h+0+0
	incf	fsr0,f
	movf	indf,w
	movwf	(??_FilterCh13+0)^080h+0+1
	clrc
	rlf	(FilterCh13@cir)^080h,w
	addlw	FilterCh13@filter_buf&0ffh
	movwf	fsr0
	movf	0+(??_FilterCh13+0)^080h+0,w
	movwf	indf
	incf	fsr0,f
	movf	1+(??_FilterCh13+0)^080h+0,w
	movwf	indf
	
l4161:	
	incf	(FilterCh13@tmpValue)^080h,f
	incf	(FilterCh13@tmpValue)^080h,f
	line	83
	
l4163:	
	incf	(FilterCh13@cir)^080h,f
	skipnz
	incf	(FilterCh13@cir+1)^080h,f
	
l4165:	
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
	goto	l4159
u1910:
	line	88
	
l4167:	
;common.c: 88: for(j = 0; j < 3 - 1; j++)
	bsf	status, 5	;RP0=1, select bank1
	bcf	status, 6	;RP1=0, select bank1
	clrf	(FilterCh13@j)^080h
	line	90
	
l4173:	
;common.c: 89: {
;common.c: 90: for(i = 0; i < 3 - 1 - j; i++)
	clrf	(FilterCh13@i)^080h
	goto	l4181
	line	92
	
l4175:	
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
	movwf	(??_FilterCh13+0)^080h+0+0
	incf	fsr0,f
	movf	indf,w
	movwf	(??_FilterCh13+0)^080h+0+1
	clrc
	rlf	(FilterCh13@i)^080h,w
	addlw	02h
	addlw	FilterCh13@filter_buf&0ffh
	movwf	fsr0
	movf	indf,w
	movwf	(??_FilterCh13+2)^080h+0+0
	incf	fsr0,f
	movf	indf,w
	movwf	(??_FilterCh13+2)^080h+0+1
	movf	1+(??_FilterCh13+0)^080h+0,w
	subwf	1+(??_FilterCh13+2)^080h+0,w
	skipz
	goto	u1925
	movf	0+(??_FilterCh13+0)^080h+0,w
	subwf	0+(??_FilterCh13+2)^080h+0,w
u1925:
	skipnc
	goto	u1921
	goto	u1920
u1921:
	goto	l4179
u1920:
	line	95
	
l4177:	
;common.c: 93: {
;common.c: 95: filter_temp = filter_buf[i];
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
	movwf	(??_FilterCh13+0)^080h+0+0
	incf	fsr0,f
	movf	indf,w
	movwf	(??_FilterCh13+0)^080h+0+1
	clrc
	rlf	(FilterCh13@i)^080h,w
	addlw	FilterCh13@filter_buf&0ffh
	movwf	fsr0
	movf	0+(??_FilterCh13+0)^080h+0,w
	movwf	indf
	incf	fsr0,f
	movf	1+(??_FilterCh13+0)^080h+0,w
	movwf	indf
	line	99
;common.c: 99: filter_buf[i + 1] = filter_temp;
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
	
l4179:	
	incf	(FilterCh13@i)^080h,f
	
l4181:	
	movlw	high(02h)
	movwf	(??_FilterCh13+0)^080h+0+1
	movf	(FilterCh13@j)^080h,w
	sublw	low(02h)
	movwf	(??_FilterCh13+0)^080h+0
	skipc
	decf	(??_FilterCh13+0)^080h+0+1,f
	movf	1+(??_FilterCh13+0)^080h+0,w
	xorlw	80h
	sublw	080h
	skipz
	goto	u1935
	movf	0+(??_FilterCh13+0)^080h+0,w
	subwf	(FilterCh13@i)^080h,w
u1935:

	skipc
	goto	u1931
	goto	u1930
u1931:
	goto	l4175
u1930:
	line	88
	
l4183:	
	bsf	status, 5	;RP0=1, select bank1
	bcf	status, 6	;RP1=0, select bank1
	incf	(FilterCh13@j)^080h,f
	
l4185:	
	movlw	(02h)
	subwf	(FilterCh13@j)^080h,w
	skipc
	goto	u1941
	goto	u1940
u1941:
	goto	l4173
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
	
l4191:	
;common.c: 105: {
;common.c: 106: filter_sum += filter_buf[i];
	clrc
	rlf	(FilterCh13@i)^080h,w
	addlw	FilterCh13@filter_buf&0ffh
	movwf	fsr0
	bcf	status, 7	;select IRP bank1
	movf	indf,w
	movwf	(??_FilterCh13+0)^080h+0+0
	incf	fsr0,f
	movf	indf,w
	movwf	(??_FilterCh13+0)^080h+0+1
	movf	0+(??_FilterCh13+0)^080h+0,w
	addwf	(FilterCh13@filter_sum)^080h,f
	skipnc
	incf	(FilterCh13@filter_sum+1)^080h,f
	movf	1+(??_FilterCh13+0)^080h+0,w
	addwf	(FilterCh13@filter_sum+1)^080h,f
	line	104
	
l4193:	
	incf	(FilterCh13@i)^080h,f
	
l4195:	
	movlw	(02h)
	subwf	(FilterCh13@i)^080h,w
	skipc
	goto	u1951
	goto	u1950
u1951:
	goto	l4191
u1950:
	line	110
	
l4197:	
;common.c: 107: }
;common.c: 110: return (filter_sum >> 0 );
	movf	(FilterCh13@filter_sum+1)^080h,w
	movwf	(?_FilterCh13+1)^080h
	movf	(FilterCh13@filter_sum)^080h,w
	movwf	(?_FilterCh13)^080h
	line	111
	
l1497:	
	return
	opt stack 0
GLOBAL	__end_of_FilterCh13
	__end_of_FilterCh13:
;; =============== function _FilterCh13 ends ============

	signat	_FilterCh13,4218
	global	_setWaitResetFlag
psect	text1374,local,class=CODE,delta=2
global __ptext1374
__ptext1374:

;; *************** function _setWaitResetFlag *****************
;; Defined at:
;;		line 55 in file "D:\develop\AK7030-good\AK7030-OTP\common.c"
;; Parameters:    Size  Location     Type
;;  bValue          1    wreg     unsigned char 
;; Auto vars:     Size  Location     Type
;;  bValue          1    0[BANK1 ] unsigned char 
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
;;      Locals:         0       0       1       0       0
;;      Temps:          0       0       0       0       0
;;      Totals:         0       0       1       0       0
;;Total ram usage:        1 bytes
;; Hardware stack levels used:    1
;; Hardware stack levels required when called:    3
;; This function calls:
;;		Nothing
;; This function is called by:
;;		_main
;; This function uses a non-reentrant model
;;
psect	text1374
	file	"D:\develop\AK7030-good\AK7030-OTP\common.c"
	line	55
	global	__size_of_setWaitResetFlag
	__size_of_setWaitResetFlag	equ	__end_of_setWaitResetFlag-_setWaitResetFlag
	
_setWaitResetFlag:	
	opt	stack 4
; Regs used in _setWaitResetFlag: [wreg]
;setWaitResetFlag@bValue stored from wreg
	bsf	status, 5	;RP0=1, select bank1
	movwf	(setWaitResetFlag@bValue)^080h
	line	56
	
l4151:	
;common.c: 56: bWaitResetFlag = bValue;
	movf	(setWaitResetFlag@bValue)^080h,w
	bcf	status, 5	;RP0=0, select bank0
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
psect	text1375,local,class=CODE,delta=2
global __ptext1375
__ptext1375:

;; *************** function _isFinishedOneHoursTimer *****************
;; Defined at:
;;		line 608 in file "D:\develop\AK7030-good\AK7030-OTP\common.c"
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
psect	text1375
	file	"D:\develop\AK7030-good\AK7030-OTP\common.c"
	line	608
	global	__size_of_isFinishedOneHoursTimer
	__size_of_isFinishedOneHoursTimer	equ	__end_of_isFinishedOneHoursTimer-_isFinishedOneHoursTimer
	
_isFinishedOneHoursTimer:	
	opt	stack 4
; Regs used in _isFinishedOneHoursTimer: [wreg+status,2+status,0]
	line	609
	
l4135:	
;common.c: 609: if((uiOneHourTimer == 0) && bOneHourTimerStartFlag)
	bcf	status, 5	;RP0=0, select bank0
	movf	((_uiOneHourTimer+1)),w
	iorwf	((_uiOneHourTimer)),w
	skipz
	goto	u1891
	goto	u1890
u1891:
	goto	l4147
u1890:
	
l4137:	
	movf	(_bOneHourTimerStartFlag),w
	skipz
	goto	u1900
	goto	l4147
u1900:
	line	611
	
l4139:	
;common.c: 610: {
;common.c: 611: bOneHourTimerStartFlag = 0;
	clrf	(_bOneHourTimerStartFlag)
	line	612
	
l4141:	
;common.c: 612: return 1;
	movlw	(01h)
	goto	l1656
	line	615
	
l4147:	
;common.c: 614: else
;common.c: 615: return 0;
	movlw	(0)
	line	616
	
l1656:	
	return
	opt stack 0
GLOBAL	__end_of_isFinishedOneHoursTimer
	__end_of_isFinishedOneHoursTimer:
;; =============== function _isFinishedOneHoursTimer ends ============

	signat	_isFinishedOneHoursTimer,89
	global	_startOneHoursTimer
psect	text1376,local,class=CODE,delta=2
global __ptext1376
__ptext1376:

;; *************** function _startOneHoursTimer *****************
;; Defined at:
;;		line 525 in file "D:\develop\AK7030-good\AK7030-OTP\common.c"
;; Parameters:    Size  Location     Type
;;  uiSetTime       2    0[BANK1 ] unsigned int 
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
;;      Params:         0       0       2       0       0
;;      Locals:         0       0       0       0       0
;;      Temps:          0       0       0       0       0
;;      Totals:         0       0       2       0       0
;;Total ram usage:        2 bytes
;; Hardware stack levels used:    1
;; Hardware stack levels required when called:    3
;; This function calls:
;;		Nothing
;; This function is called by:
;;		_main
;; This function uses a non-reentrant model
;;
psect	text1376
	file	"D:\develop\AK7030-good\AK7030-OTP\common.c"
	line	525
	global	__size_of_startOneHoursTimer
	__size_of_startOneHoursTimer	equ	__end_of_startOneHoursTimer-_startOneHoursTimer
	
_startOneHoursTimer:	
	opt	stack 4
; Regs used in _startOneHoursTimer: [wreg+status,2+status,0]
	line	526
	
l4127:	
;common.c: 526: if(( 0 == uiOneHourTimer ) && ( 0 == bOneHourTimerStartFlag ))
	bcf	status, 5	;RP0=0, select bank0
	movf	((_uiOneHourTimer+1)),w
	iorwf	((_uiOneHourTimer)),w
	skipz
	goto	u1871
	goto	u1870
u1871:
	goto	l1633
u1870:
	
l4129:	
	movf	(_bOneHourTimerStartFlag),f
	skipz
	goto	u1881
	goto	u1880
u1881:
	goto	l1633
u1880:
	line	528
	
l4131:	
;common.c: 527: {
;common.c: 528: uiOneHourTimer = uiSetTime;
	bsf	status, 5	;RP0=1, select bank1
	movf	(startOneHoursTimer@uiSetTime+1)^080h,w
	bcf	status, 5	;RP0=0, select bank0
	movwf	(_uiOneHourTimer+1)
	bsf	status, 5	;RP0=1, select bank1
	movf	(startOneHoursTimer@uiSetTime)^080h,w
	bcf	status, 5	;RP0=0, select bank0
	movwf	(_uiOneHourTimer)
	line	529
	
l4133:	
;common.c: 529: bOneHourTimerStartFlag = 1;
	clrf	(_bOneHourTimerStartFlag)
	incf	(_bOneHourTimerStartFlag),f
	line	535
	
l1633:	
	return
	opt stack 0
GLOBAL	__end_of_startOneHoursTimer
	__end_of_startOneHoursTimer:
;; =============== function _startOneHoursTimer ends ============

	signat	_startOneHoursTimer,4216
	global	_isFinishedThreeHoursTimer
psect	text1377,local,class=CODE,delta=2
global __ptext1377
__ptext1377:

;; *************** function _isFinishedThreeHoursTimer *****************
;; Defined at:
;;		line 595 in file "D:\develop\AK7030-good\AK7030-OTP\common.c"
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
psect	text1377
	file	"D:\develop\AK7030-good\AK7030-OTP\common.c"
	line	595
	global	__size_of_isFinishedThreeHoursTimer
	__size_of_isFinishedThreeHoursTimer	equ	__end_of_isFinishedThreeHoursTimer-_isFinishedThreeHoursTimer
	
_isFinishedThreeHoursTimer:	
	opt	stack 4
; Regs used in _isFinishedThreeHoursTimer: [wreg+status,2+status,0]
	line	596
	
l4111:	
;common.c: 596: if((uiSmallTimer == 0) && bSmallTimerStartFlag)
	bcf	status, 5	;RP0=0, select bank0
	movf	((_uiSmallTimer+1)),w
	iorwf	((_uiSmallTimer)),w
	skipz
	goto	u1851
	goto	u1850
u1851:
	goto	l4123
u1850:
	
l4113:	
	movf	(_bSmallTimerStartFlag),w
	skipz
	goto	u1860
	goto	l4123
u1860:
	line	598
	
l4115:	
;common.c: 597: {
;common.c: 598: bSmallTimerStartFlag = 0;
	clrf	(_bSmallTimerStartFlag)
	line	599
	
l4117:	
;common.c: 599: return 1;
	movlw	(01h)
	goto	l1651
	line	602
	
l4123:	
;common.c: 601: else
;common.c: 602: return 0;
	movlw	(0)
	line	603
	
l1651:	
	return
	opt stack 0
GLOBAL	__end_of_isFinishedThreeHoursTimer
	__end_of_isFinishedThreeHoursTimer:
;; =============== function _isFinishedThreeHoursTimer ends ============

	signat	_isFinishedThreeHoursTimer,89
	global	_startThreeHoursTimer
psect	text1378,local,class=CODE,delta=2
global __ptext1378
__ptext1378:

;; *************** function _startThreeHoursTimer *****************
;; Defined at:
;;		line 512 in file "D:\develop\AK7030-good\AK7030-OTP\common.c"
;; Parameters:    Size  Location     Type
;;  uiSetTime       2    0[BANK1 ] unsigned int 
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
;;      Params:         0       0       2       0       0
;;      Locals:         0       0       0       0       0
;;      Temps:          0       0       0       0       0
;;      Totals:         0       0       2       0       0
;;Total ram usage:        2 bytes
;; Hardware stack levels used:    1
;; Hardware stack levels required when called:    3
;; This function calls:
;;		Nothing
;; This function is called by:
;;		_main
;; This function uses a non-reentrant model
;;
psect	text1378
	file	"D:\develop\AK7030-good\AK7030-OTP\common.c"
	line	512
	global	__size_of_startThreeHoursTimer
	__size_of_startThreeHoursTimer	equ	__end_of_startThreeHoursTimer-_startThreeHoursTimer
	
_startThreeHoursTimer:	
	opt	stack 4
; Regs used in _startThreeHoursTimer: [wreg+status,2+status,0]
	line	513
	
l4103:	
;common.c: 513: if(( 0 == uiSmallTimer ) && ( 0 == bSmallTimerStartFlag ))
	bcf	status, 5	;RP0=0, select bank0
	movf	((_uiSmallTimer+1)),w
	iorwf	((_uiSmallTimer)),w
	skipz
	goto	u1831
	goto	u1830
u1831:
	goto	l1629
u1830:
	
l4105:	
	movf	(_bSmallTimerStartFlag),f
	skipz
	goto	u1841
	goto	u1840
u1841:
	goto	l1629
u1840:
	line	515
	
l4107:	
;common.c: 514: {
;common.c: 515: uiSmallTimer = uiSetTime;
	bsf	status, 5	;RP0=1, select bank1
	movf	(startThreeHoursTimer@uiSetTime+1)^080h,w
	bcf	status, 5	;RP0=0, select bank0
	movwf	(_uiSmallTimer+1)
	bsf	status, 5	;RP0=1, select bank1
	movf	(startThreeHoursTimer@uiSetTime)^080h,w
	bcf	status, 5	;RP0=0, select bank0
	movwf	(_uiSmallTimer)
	line	516
	
l4109:	
;common.c: 516: bSmallTimerStartFlag = 1;
	clrf	(_bSmallTimerStartFlag)
	incf	(_bSmallTimerStartFlag),f
	line	522
	
l1629:	
	return
	opt stack 0
GLOBAL	__end_of_startThreeHoursTimer
	__end_of_startThreeHoursTimer:
;; =============== function _startThreeHoursTimer ends ============

	signat	_startThreeHoursTimer,4216
	global	_isFinishedTwelveHoursTimer
psect	text1379,local,class=CODE,delta=2
global __ptext1379
__ptext1379:

;; *************** function _isFinishedTwelveHoursTimer *****************
;; Defined at:
;;		line 584 in file "D:\develop\AK7030-good\AK7030-OTP\common.c"
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
psect	text1379
	file	"D:\develop\AK7030-good\AK7030-OTP\common.c"
	line	584
	global	__size_of_isFinishedTwelveHoursTimer
	__size_of_isFinishedTwelveHoursTimer	equ	__end_of_isFinishedTwelveHoursTimer-_isFinishedTwelveHoursTimer
	
_isFinishedTwelveHoursTimer:	
	opt	stack 4
; Regs used in _isFinishedTwelveHoursTimer: [wreg+status,2+status,0]
	line	585
	
l4087:	
;common.c: 585: if(( uiBigTimer == 0 ) && bBigTimerStartFlag )
	bcf	status, 5	;RP0=0, select bank0
	movf	((_uiBigTimer+1)),w
	iorwf	((_uiBigTimer)),w
	skipz
	goto	u1811
	goto	u1810
u1811:
	goto	l4099
u1810:
	
l4089:	
	movf	(_bBigTimerStartFlag),w
	skipz
	goto	u1820
	goto	l4099
u1820:
	line	587
	
l4091:	
;common.c: 586: {
;common.c: 587: bBigTimerStartFlag = 0;
	clrf	(_bBigTimerStartFlag)
	line	588
	
l4093:	
;common.c: 588: return 1;
	movlw	(01h)
	goto	l1646
	line	591
	
l4099:	
;common.c: 590: else
;common.c: 591: return 0;
	movlw	(0)
	line	592
	
l1646:	
	return
	opt stack 0
GLOBAL	__end_of_isFinishedTwelveHoursTimer
	__end_of_isFinishedTwelveHoursTimer:
;; =============== function _isFinishedTwelveHoursTimer ends ============

	signat	_isFinishedTwelveHoursTimer,89
	global	_startTwelveHourTimer
psect	text1380,local,class=CODE,delta=2
global __ptext1380
__ptext1380:

;; *************** function _startTwelveHourTimer *****************
;; Defined at:
;;		line 471 in file "D:\develop\AK7030-good\AK7030-OTP\common.c"
;; Parameters:    Size  Location     Type
;;  uiSetTime       2    0[BANK1 ] unsigned int 
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
;;      Params:         0       0       2       0       0
;;      Locals:         0       0       0       0       0
;;      Temps:          0       0       0       0       0
;;      Totals:         0       0       2       0       0
;;Total ram usage:        2 bytes
;; Hardware stack levels used:    1
;; Hardware stack levels required when called:    3
;; This function calls:
;;		Nothing
;; This function is called by:
;;		_main
;; This function uses a non-reentrant model
;;
psect	text1380
	file	"D:\develop\AK7030-good\AK7030-OTP\common.c"
	line	471
	global	__size_of_startTwelveHourTimer
	__size_of_startTwelveHourTimer	equ	__end_of_startTwelveHourTimer-_startTwelveHourTimer
	
_startTwelveHourTimer:	
	opt	stack 4
; Regs used in _startTwelveHourTimer: [wreg+status,2+status,0]
	line	472
	
l4079:	
;common.c: 472: if((0 == uiBigTimer) && ( 0 == bBigTimerStartFlag))
	bcf	status, 5	;RP0=0, select bank0
	movf	((_uiBigTimer+1)),w
	iorwf	((_uiBigTimer)),w
	skipz
	goto	u1791
	goto	u1790
u1791:
	goto	l1613
u1790:
	
l4081:	
	movf	(_bBigTimerStartFlag),f
	skipz
	goto	u1801
	goto	u1800
u1801:
	goto	l1613
u1800:
	line	474
	
l4083:	
;common.c: 473: {
;common.c: 474: uiBigTimer = uiSetTime;
	bsf	status, 5	;RP0=1, select bank1
	movf	(startTwelveHourTimer@uiSetTime+1)^080h,w
	bcf	status, 5	;RP0=0, select bank0
	movwf	(_uiBigTimer+1)
	bsf	status, 5	;RP0=1, select bank1
	movf	(startTwelveHourTimer@uiSetTime)^080h,w
	bcf	status, 5	;RP0=0, select bank0
	movwf	(_uiBigTimer)
	line	475
	
l4085:	
;common.c: 475: bBigTimerStartFlag = 1;
	clrf	(_bBigTimerStartFlag)
	incf	(_bBigTimerStartFlag),f
	line	482
	
l1613:	
	return
	opt stack 0
GLOBAL	__end_of_startTwelveHourTimer
	__end_of_startTwelveHourTimer:
;; =============== function _startTwelveHourTimer ends ============

	signat	_startTwelveHourTimer,4216
	global	_isFinishedTwentyMinTimer
psect	text1381,local,class=CODE,delta=2
global __ptext1381
__ptext1381:

;; *************** function _isFinishedTwentyMinTimer *****************
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
;;		Nothing
;; This function is called by:
;;		_main
;; This function uses a non-reentrant model
;;
psect	text1381
	file	"D:\develop\AK7030-good\AK7030-OTP\common.c"
	line	560
	global	__size_of_isFinishedTwentyMinTimer
	__size_of_isFinishedTwentyMinTimer	equ	__end_of_isFinishedTwentyMinTimer-_isFinishedTwentyMinTimer
	
_isFinishedTwentyMinTimer:	
	opt	stack 4
; Regs used in _isFinishedTwentyMinTimer: [wreg+status,2+status,0]
	line	561
	
l4063:	
;common.c: 561: if(( 0 == uiTwentyMinTimer ) && bTwentyMinStartFlag )
	bcf	status, 5	;RP0=0, select bank0
	movf	((_uiTwentyMinTimer+1)),w
	iorwf	((_uiTwentyMinTimer)),w
	skipz
	goto	u1771
	goto	u1770
u1771:
	goto	l4075
u1770:
	
l4065:	
	movf	(_bTwentyMinStartFlag),w
	skipz
	goto	u1780
	goto	l4075
u1780:
	line	563
	
l4067:	
;common.c: 562: {
;common.c: 563: bTwentyMinStartFlag = 0;
	clrf	(_bTwentyMinStartFlag)
	line	564
	
l4069:	
;common.c: 564: return 1;
	movlw	(01h)
	goto	l1641
	line	567
	
l4075:	
;common.c: 566: else
;common.c: 567: return 0;
	movlw	(0)
	line	568
	
l1641:	
	return
	opt stack 0
GLOBAL	__end_of_isFinishedTwentyMinTimer
	__end_of_isFinishedTwentyMinTimer:
;; =============== function _isFinishedTwentyMinTimer ends ============

	signat	_isFinishedTwentyMinTimer,89
	global	_clrSampeTime
psect	text1382,local,class=CODE,delta=2
global __ptext1382
__ptext1382:

;; *************** function _clrSampeTime *****************
;; Defined at:
;;		line 630 in file "D:\develop\AK7030-good\AK7030-OTP\common.c"
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
psect	text1382
	file	"D:\develop\AK7030-good\AK7030-OTP\common.c"
	line	630
	global	__size_of_clrSampeTime
	__size_of_clrSampeTime	equ	__end_of_clrSampeTime-_clrSampeTime
	
_clrSampeTime:	
	opt	stack 4
; Regs used in _clrSampeTime: [status,2]
	line	631
	
l4061:	
;common.c: 631: timer.timer10msStopWatch = 0;
	clrf	(_timer)
	line	632
	
l1665:	
	return
	opt stack 0
GLOBAL	__end_of_clrSampeTime
	__end_of_clrSampeTime:
;; =============== function _clrSampeTime ends ============

	signat	_clrSampeTime,88
	global	_isPermitSampleTime
psect	text1383,local,class=CODE,delta=2
global __ptext1383
__ptext1383:

;; *************** function _isPermitSampleTime *****************
;; Defined at:
;;		line 620 in file "D:\develop\AK7030-good\AK7030-OTP\common.c"
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
psect	text1383
	file	"D:\develop\AK7030-good\AK7030-OTP\common.c"
	line	620
	global	__size_of_isPermitSampleTime
	__size_of_isPermitSampleTime	equ	__end_of_isPermitSampleTime-_isPermitSampleTime
	
_isPermitSampleTime:	
	opt	stack 4
; Regs used in _isPermitSampleTime: [wreg]
	line	621
	
l4049:	
;common.c: 621: if(timer.timer10msStopWatch >= 1)
	movf	(_timer),w
	skipz
	goto	u1760
	goto	l4057
u1760:
	line	623
	
l4051:	
;common.c: 622: {
;common.c: 623: return 1;
	movlw	(01h)
	goto	l1661
	line	626
	
l4057:	
;common.c: 625: else
;common.c: 626: return 0;
	movlw	(0)
	line	627
	
l1661:	
	return
	opt stack 0
GLOBAL	__end_of_isPermitSampleTime
	__end_of_isPermitSampleTime:
;; =============== function _isPermitSampleTime ends ============

	signat	_isPermitSampleTime,89
	global	_adc_start
psect	text1384,local,class=CODE,delta=2
global __ptext1384
__ptext1384:

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
psect	text1384
	file	"D:\develop\AK7030-good\AK7030-OTP\periph.c"
	line	101
	global	__size_of_adc_start
	__size_of_adc_start	equ	__end_of_adc_start-_adc_start
	
_adc_start:	
	opt	stack 3
; Regs used in _adc_start: []
	line	102
	
l4047:	
;periph.c: 102: GO=1;
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	bsf	(249/8),(249)&7
	line	103
	
l2333:	
	return
	opt stack 0
GLOBAL	__end_of_adc_start
	__end_of_adc_start:
;; =============== function _adc_start ends ============

	signat	_adc_start,88
	global	_startTwentyMinTimer
psect	text1385,local,class=CODE,delta=2
global __ptext1385
__ptext1385:

;; *************** function _startTwentyMinTimer *****************
;; Defined at:
;;		line 550 in file "D:\develop\AK7030-good\AK7030-OTP\common.c"
;; Parameters:    Size  Location     Type
;;  uiSetValue      2    0[BANK1 ] unsigned int 
;; Auto vars:     Size  Location     Type
;;		None
;; Return value:  Size  Location     Type
;;		None               void
;; Registers used:
;;		wreg, status,2, status,0
;; Tracked objects:
;;		On entry : 17F/20
;;		On exit  : 17F/0
;;		Unchanged: FFE80/0
;; Data sizes:     COMMON   BANK0   BANK1   BANK3   BANK2
;;      Params:         0       0       2       0       0
;;      Locals:         0       0       0       0       0
;;      Temps:          0       0       0       0       0
;;      Totals:         0       0       2       0       0
;;Total ram usage:        2 bytes
;; Hardware stack levels used:    1
;; Hardware stack levels required when called:    3
;; This function calls:
;;		Nothing
;; This function is called by:
;;		_main
;; This function uses a non-reentrant model
;;
psect	text1385
	file	"D:\develop\AK7030-good\AK7030-OTP\common.c"
	line	550
	global	__size_of_startTwentyMinTimer
	__size_of_startTwentyMinTimer	equ	__end_of_startTwentyMinTimer-_startTwentyMinTimer
	
_startTwentyMinTimer:	
	opt	stack 4
; Regs used in _startTwentyMinTimer: [wreg+status,2+status,0]
	line	551
	
l4039:	
;common.c: 551: if(( 0 == uiTwentyMinTimer) && ( 0 == bTwentyMinStartFlag))
	bcf	status, 5	;RP0=0, select bank0
	movf	((_uiTwentyMinTimer+1)),w
	iorwf	((_uiTwentyMinTimer)),w
	skipz
	goto	u1741
	goto	u1740
u1741:
	goto	l1637
u1740:
	
l4041:	
	movf	(_bTwentyMinStartFlag),f
	skipz
	goto	u1751
	goto	u1750
u1751:
	goto	l1637
u1750:
	line	553
	
l4043:	
;common.c: 552: {
;common.c: 553: uiTwentyMinTimer = uiSetValue;
	bsf	status, 5	;RP0=1, select bank1
	movf	(startTwentyMinTimer@uiSetValue+1)^080h,w
	bcf	status, 5	;RP0=0, select bank0
	movwf	(_uiTwentyMinTimer+1)
	bsf	status, 5	;RP0=1, select bank1
	movf	(startTwentyMinTimer@uiSetValue)^080h,w
	bcf	status, 5	;RP0=0, select bank0
	movwf	(_uiTwentyMinTimer)
	line	554
	
l4045:	
;common.c: 554: bTwentyMinStartFlag = 1;
	clrf	(_bTwentyMinStartFlag)
	incf	(_bTwentyMinStartFlag),f
	line	556
	
l1637:	
	return
	opt stack 0
GLOBAL	__end_of_startTwentyMinTimer
	__end_of_startTwentyMinTimer:
;; =============== function _startTwentyMinTimer ends ============

	signat	_startTwentyMinTimer,4216
	global	_adc_test_init
psect	text1386,local,class=CODE,delta=2
global __ptext1386
__ptext1386:

;; *************** function _adc_test_init *****************
;; Defined at:
;;		line 85 in file "D:\develop\AK7030-good\AK7030-OTP\periph.c"
;; Parameters:    Size  Location     Type
;;  channel         1    wreg     unsigned char 
;;  ref             1    0[BANK1 ] unsigned char 
;; Auto vars:     Size  Location     Type
;;  channel         1    2[BANK1 ] unsigned char 
;; Return value:  Size  Location     Type
;;		None               void
;; Registers used:
;;		wreg, status,2, status,0
;; Tracked objects:
;;		On entry : 60/20
;;		On exit  : 60/20
;;		Unchanged: FFF9F/0
;; Data sizes:     COMMON   BANK0   BANK1   BANK3   BANK2
;;      Params:         0       0       1       0       0
;;      Locals:         0       0       1       0       0
;;      Temps:          0       0       1       0       0
;;      Totals:         0       0       3       0       0
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
psect	text1386
	file	"D:\develop\AK7030-good\AK7030-OTP\periph.c"
	line	85
	global	__size_of_adc_test_init
	__size_of_adc_test_init	equ	__end_of_adc_test_init-_adc_test_init
	
_adc_test_init:	
	opt	stack 3
; Regs used in _adc_test_init: [wreg+status,2+status,0]
;adc_test_init@channel stored from wreg
	movwf	(adc_test_init@channel)^080h
	line	86
	
l4029:	
;periph.c: 86: ADCON0 = 0x40;
	movlw	(040h)
	bcf	status, 5	;RP0=0, select bank0
	movwf	(31)	;volatile
	line	87
	
l4031:	
;periph.c: 87: ADCON0|=channel<<2;
	bsf	status, 5	;RP0=1, select bank1
	movf	(adc_test_init@channel)^080h,w
	movwf	(??_adc_test_init+0)^080h+0
	clrc
	rlf	(??_adc_test_init+0)^080h+0,f
	clrc
	rlf	(??_adc_test_init+0)^080h+0,w
	bcf	status, 5	;RP0=0, select bank0
	iorwf	(31),f	;volatile
	line	88
	
l4033:	
;periph.c: 88: ADCON1 = 0x35;
	movlw	(035h)
	bsf	status, 5	;RP0=1, select bank1
	movwf	(159)^080h	;volatile
	line	89
;periph.c: 89: ADCON1|=ref<<6;
	movf	(adc_test_init@ref)^080h,w
	movwf	(??_adc_test_init+0)^080h+0
	rrf	(??_adc_test_init+0)^080h+0,f
	rrf	(??_adc_test_init+0)^080h+0,f
	rrf	(??_adc_test_init+0)^080h+0,w
	andlw	0c0h
	iorwf	(159)^080h,f	;volatile
	line	90
	
l4035:	
;periph.c: 90: ADON=1;
	bcf	status, 5	;RP0=0, select bank0
	bsf	(248/8),(248)&7
	line	91
	
l4037:	
;periph.c: 91: ADIE=1;
	bsf	status, 5	;RP0=1, select bank1
	bsf	(1130/8)^080h,(1130)&7
	line	92
	
l2327:	
	return
	opt stack 0
GLOBAL	__end_of_adc_test_init
	__end_of_adc_test_init:
;; =============== function _adc_test_init ends ============

	signat	_adc_test_init,8312
	global	_timer1_interrupt_config
psect	text1387,local,class=CODE,delta=2
global __ptext1387
__ptext1387:

;; *************** function _timer1_interrupt_config *****************
;; Defined at:
;;		line 360 in file "D:\develop\AK7030-good\AK7030-OTP\common.c"
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
psect	text1387
	file	"D:\develop\AK7030-good\AK7030-OTP\common.c"
	line	360
	global	__size_of_timer1_interrupt_config
	__size_of_timer1_interrupt_config	equ	__end_of_timer1_interrupt_config-_timer1_interrupt_config
	
_timer1_interrupt_config:	
	opt	stack 4
; Regs used in _timer1_interrupt_config: []
	line	361
	
l4027:	
;common.c: 361: GIE = 1;
	bsf	(95/8),(95)&7
	line	362
;common.c: 362: PEIE = 1;
	bsf	(94/8),(94)&7
	line	363
	
l1578:	
	return
	opt stack 0
GLOBAL	__end_of_timer1_interrupt_config
	__end_of_timer1_interrupt_config:
;; =============== function _timer1_interrupt_config ends ============

	signat	_timer1_interrupt_config,88
	global	_timer1_config
psect	text1388,local,class=CODE,delta=2
global __ptext1388
__ptext1388:

;; *************** function _timer1_config *****************
;; Defined at:
;;		line 348 in file "D:\develop\AK7030-good\AK7030-OTP\common.c"
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
psect	text1388
	file	"D:\develop\AK7030-good\AK7030-OTP\common.c"
	line	348
	global	__size_of_timer1_config
	__size_of_timer1_config	equ	__end_of_timer1_config-_timer1_config
	
_timer1_config:	
	opt	stack 4
; Regs used in _timer1_config: [wreg]
	line	350
	
l4023:	
;common.c: 350: TMR1H=0xCF;
	movlw	(0CFh)
	bcf	status, 6	;RP1=0, select bank0
	movwf	(15)	;volatile
	line	351
;common.c: 351: TMR1L=0x2C;
	movlw	(02Ch)
	movwf	(14)	;volatile
	line	352
;common.c: 352: T1CON=0xE1;
	movlw	(0E1h)
	movwf	(16)	;volatile
	line	353
	
l4025:	
;common.c: 353: TMR1IE=1;
	bsf	status, 5	;RP0=1, select bank1
	bsf	(1120/8)^080h,(1120)&7
	line	355
	
l1575:	
	return
	opt stack 0
GLOBAL	__end_of_timer1_config
	__end_of_timer1_config:
;; =============== function _timer1_config ends ============

	signat	_timer1_config,88
	global	_clock_config
psect	text1389,local,class=CODE,delta=2
global __ptext1389
__ptext1389:

;; *************** function _clock_config *****************
;; Defined at:
;;		line 340 in file "D:\develop\AK7030-good\AK7030-OTP\common.c"
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
psect	text1389
	file	"D:\develop\AK7030-good\AK7030-OTP\common.c"
	line	340
	global	__size_of_clock_config
	__size_of_clock_config	equ	__end_of_clock_config-_clock_config
	
_clock_config:	
	opt	stack 4
; Regs used in _clock_config: [wreg+status,2]
	line	342
	
l4019:	
;common.c: 342: CLKPR = 0x80;
	movlw	(080h)
	bcf	status, 5	;RP0=0, select bank2
	bsf	status, 6	;RP1=1, select bank2
	movwf	(264)^0100h	;volatile
	line	343
	
l4021:	
;common.c: 343: CLKPR = 0x00;
	clrf	(264)^0100h	;volatile
	line	344
;common.c: 344: while(CLKPCE);
	
l1569:	
	btfsc	(2119/8)^0100h,(2119)&7
	goto	u1731
	goto	u1730
u1731:
	goto	l1569
u1730:
	line	345
	
l1572:	
	return
	opt stack 0
GLOBAL	__end_of_clock_config
	__end_of_clock_config:
;; =============== function _clock_config ends ============

	signat	_clock_config,88
	global	_clearTwentyMinTimer
psect	text1390,local,class=CODE,delta=2
global __ptext1390
__ptext1390:

;; *************** function _clearTwentyMinTimer *****************
;; Defined at:
;;		line 505 in file "D:\develop\AK7030-good\AK7030-OTP\common.c"
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
psect	text1390
	file	"D:\develop\AK7030-good\AK7030-OTP\common.c"
	line	505
	global	__size_of_clearTwentyMinTimer
	__size_of_clearTwentyMinTimer	equ	__end_of_clearTwentyMinTimer-_clearTwentyMinTimer
	
_clearTwentyMinTimer:	
	opt	stack 3
; Regs used in _clearTwentyMinTimer: [status,2]
	line	506
	
l4017:	
;common.c: 506: uiTwentyMinTimer = 0;
	clrf	(_uiTwentyMinTimer)
	clrf	(_uiTwentyMinTimer+1)
	line	507
;common.c: 507: bTwentyMinStartFlag = 0;
	clrf	(_bTwentyMinStartFlag)
	line	508
	
l1625:	
	return
	opt stack 0
GLOBAL	__end_of_clearTwentyMinTimer
	__end_of_clearTwentyMinTimer:
;; =============== function _clearTwentyMinTimer ends ============

	signat	_clearTwentyMinTimer,88
	global	_clearOneHoursTimer
psect	text1391,local,class=CODE,delta=2
global __ptext1391
__ptext1391:

;; *************** function _clearOneHoursTimer *****************
;; Defined at:
;;		line 498 in file "D:\develop\AK7030-good\AK7030-OTP\common.c"
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
psect	text1391
	file	"D:\develop\AK7030-good\AK7030-OTP\common.c"
	line	498
	global	__size_of_clearOneHoursTimer
	__size_of_clearOneHoursTimer	equ	__end_of_clearOneHoursTimer-_clearOneHoursTimer
	
_clearOneHoursTimer:	
	opt	stack 3
; Regs used in _clearOneHoursTimer: [status,2]
	line	499
	
l4015:	
;common.c: 499: uiOneHourTimer = 0;
	clrf	(_uiOneHourTimer)
	clrf	(_uiOneHourTimer+1)
	line	500
;common.c: 500: bOneHourTimerStartFlag = 0;
	clrf	(_bOneHourTimerStartFlag)
	line	501
	
l1622:	
	return
	opt stack 0
GLOBAL	__end_of_clearOneHoursTimer
	__end_of_clearOneHoursTimer:
;; =============== function _clearOneHoursTimer ends ============

	signat	_clearOneHoursTimer,88
	global	_clearThreeHoursTimer
psect	text1392,local,class=CODE,delta=2
global __ptext1392
__ptext1392:

;; *************** function _clearThreeHoursTimer *****************
;; Defined at:
;;		line 492 in file "D:\develop\AK7030-good\AK7030-OTP\common.c"
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
;; Hardware stack levels required when called:    3
;; This function calls:
;;		Nothing
;; This function is called by:
;;		_resetAllTimer
;;		_main
;; This function uses a non-reentrant model
;;
psect	text1392
	file	"D:\develop\AK7030-good\AK7030-OTP\common.c"
	line	492
	global	__size_of_clearThreeHoursTimer
	__size_of_clearThreeHoursTimer	equ	__end_of_clearThreeHoursTimer-_clearThreeHoursTimer
	
_clearThreeHoursTimer:	
	opt	stack 3
; Regs used in _clearThreeHoursTimer: [status,2]
	line	493
	
l4013:	
;common.c: 493: uiSmallTimer = 0;
	bcf	status, 5	;RP0=0, select bank0
	clrf	(_uiSmallTimer)
	clrf	(_uiSmallTimer+1)
	line	494
;common.c: 494: bSmallTimerStartFlag = 0;
	clrf	(_bSmallTimerStartFlag)
	line	495
	
l1619:	
	return
	opt stack 0
GLOBAL	__end_of_clearThreeHoursTimer
	__end_of_clearThreeHoursTimer:
;; =============== function _clearThreeHoursTimer ends ============

	signat	_clearThreeHoursTimer,88
	global	_clearTwelveHoursTimer
psect	text1393,local,class=CODE,delta=2
global __ptext1393
__ptext1393:

;; *************** function _clearTwelveHoursTimer *****************
;; Defined at:
;;		line 485 in file "D:\develop\AK7030-good\AK7030-OTP\common.c"
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
;; Hardware stack levels required when called:    3
;; This function calls:
;;		Nothing
;; This function is called by:
;;		_resetAllTimer
;;		_main
;; This function uses a non-reentrant model
;;
psect	text1393
	file	"D:\develop\AK7030-good\AK7030-OTP\common.c"
	line	485
	global	__size_of_clearTwelveHoursTimer
	__size_of_clearTwelveHoursTimer	equ	__end_of_clearTwelveHoursTimer-_clearTwelveHoursTimer
	
_clearTwelveHoursTimer:	
	opt	stack 3
; Regs used in _clearTwelveHoursTimer: [status,2]
	line	486
	
l4011:	
;common.c: 486: uiBigTimer = 0;
	bcf	status, 5	;RP0=0, select bank0
	clrf	(_uiBigTimer)
	clrf	(_uiBigTimer+1)
	line	487
;common.c: 487: bBigTimerStartFlag = 0;
	clrf	(_bBigTimerStartFlag)
	line	488
	
l1616:	
	return
	opt stack 0
GLOBAL	__end_of_clearTwelveHoursTimer
	__end_of_clearTwelveHoursTimer:
;; =============== function _clearTwelveHoursTimer ends ============

	signat	_clearTwelveHoursTimer,88
	global	_reset
psect	text1394,local,class=CODE,delta=2
global __ptext1394
__ptext1394:

;; *************** function _reset *****************
;; Defined at:
;;		line 307 in file "D:\develop\AK7030-good\AK7030-OTP\main.c"
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
;;		On exit  : 60/20
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
psect	text1394
	file	"D:\develop\AK7030-good\AK7030-OTP\main.c"
	line	307
	global	__size_of_reset
	__size_of_reset	equ	__end_of_reset-_reset
	
_reset:	
	opt	stack 4
; Regs used in _reset: []
	line	309
;main.c: 309: while(1);
	
l724:	
	goto	l724
	return
	opt stack 0
psect	text1395,local,class=CODE,delta=2
global __ptext1395
__ptext1395:
	line	313
GLOBAL	__end_of_reset
	__end_of_reset:
;; =============== function _reset ends ============

	signat	_reset,88
	global	_selectAdChannel

;; *************** function _selectAdChannel *****************
;; Defined at:
;;		line 296 in file "D:\develop\AK7030-good\AK7030-OTP\main.c"
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
psect	text1395
	file	"D:\develop\AK7030-good\AK7030-OTP\main.c"
	line	296
	global	__size_of_selectAdChannel
	__size_of_selectAdChannel	equ	__end_of_selectAdChannel-_selectAdChannel
	
_selectAdChannel:	
	opt	stack 4
; Regs used in _selectAdChannel: []
	line	298
	
l4009:	
;main.c: 298: TRISB4 = 1;
	bsf	status, 5	;RP0=1, select bank1
	bsf	(1076/8)^080h,(1076)&7
	line	299
;main.c: 299: TRISB5 = 1;
	bsf	(1077/8)^080h,(1077)&7
	line	303
	
l721:	
	return
	opt stack 0
GLOBAL	__end_of_selectAdChannel
	__end_of_selectAdChannel:
;; =============== function _selectAdChannel ends ============

	signat	_selectAdChannel,88
	global	_pwm_start
psect	text1396,local,class=CODE,delta=2
global __ptext1396
__ptext1396:

;; *************** function _pwm_start *****************
;; Defined at:
;;		line 244 in file "D:\develop\AK7030-good\AK7030-OTP\main.c"
;; Parameters:    Size  Location     Type
;;  ucPulseWidth    1    wreg     unsigned char 
;;  ucPulseFrequ    1    0[BANK1 ] unsigned char 
;; Auto vars:     Size  Location     Type
;;  ucPulseWidth    1    1[BANK1 ] unsigned char 
;; Return value:  Size  Location     Type
;;		None               void
;; Registers used:
;;		wreg, status,2, status,0
;; Tracked objects:
;;		On entry : 60/20
;;		On exit  : 60/0
;;		Unchanged: FFF9F/0
;; Data sizes:     COMMON   BANK0   BANK1   BANK3   BANK2
;;      Params:         0       0       1       0       0
;;      Locals:         0       0       1       0       0
;;      Temps:          0       0       0       0       0
;;      Totals:         0       0       2       0       0
;;Total ram usage:        2 bytes
;; Hardware stack levels used:    1
;; Hardware stack levels required when called:    3
;; This function calls:
;;		Nothing
;; This function is called by:
;;		_main
;; This function uses a non-reentrant model
;;
psect	text1396
	file	"D:\develop\AK7030-good\AK7030-OTP\main.c"
	line	244
	global	__size_of_pwm_start
	__size_of_pwm_start	equ	__end_of_pwm_start-_pwm_start
	
_pwm_start:	
	opt	stack 4
; Regs used in _pwm_start: [wreg+status,2+status,0]
;pwm_start@ucPulseWidth stored from wreg
	line	246
	movwf	(pwm_start@ucPulseWidth)^080h
	
l3993:	
;main.c: 246: CCP1CON&= 0xf0;
	movlw	(0F0h)
	bcf	status, 5	;RP0=0, select bank0
	andwf	(23),f	;volatile
	line	248
	
l3995:	
;main.c: 248: T2CON=0x04;
	movlw	(04h)
	movwf	(18)	;volatile
	line	249
	
l3997:	
;main.c: 249: PR2 = ucPulseFrequency;
	bsf	status, 5	;RP0=1, select bank1
	movf	(pwm_start@ucPulseFrequency)^080h,w
	movwf	(146)^080h	;volatile
	line	250
	
l3999:	
;main.c: 250: CCPR1L = ucPulseWidth;
	movf	(pwm_start@ucPulseWidth)^080h,w
	bcf	status, 5	;RP0=0, select bank0
	movwf	(21)	;volatile
	line	251
	
l4001:	
;main.c: 251: CCP1CON=0x00;
	clrf	(23)	;volatile
	line	253
	
l4003:	
;main.c: 253: TRISB2=0;
	bsf	status, 5	;RP0=1, select bank1
	bcf	(1074/8)^080h,(1074)&7
	line	254
	
l4005:	
;main.c: 254: PBOD2 = 0;
	bsf	status, 6	;RP1=1, select bank3
	bcf	(3138/8)^0180h,(3138)&7
	line	256
	
l4007:	
;main.c: 256: CCP1CON|= 0x0c;
	movlw	(0Ch)
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	iorwf	(23),f	;volatile
	line	265
	
l712:	
	return
	opt stack 0
GLOBAL	__end_of_pwm_start
	__end_of_pwm_start:
;; =============== function _pwm_start ends ============

	signat	_pwm_start,8312
	global	_initPB2_AsHighResistence
psect	text1397,local,class=CODE,delta=2
global __ptext1397
__ptext1397:

;; *************** function _initPB2_AsHighResistence *****************
;; Defined at:
;;		line 232 in file "D:\develop\AK7030-good\AK7030-OTP\main.c"
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
psect	text1397
	file	"D:\develop\AK7030-good\AK7030-OTP\main.c"
	line	232
	global	__size_of_initPB2_AsHighResistence
	__size_of_initPB2_AsHighResistence	equ	__end_of_initPB2_AsHighResistence-_initPB2_AsHighResistence
	
_initPB2_AsHighResistence:	
	opt	stack 3
; Regs used in _initPB2_AsHighResistence: []
	line	234
	
l3991:	
;main.c: 234: PB2 = 1;
	bsf	(50/8),(50)&7
	line	235
;main.c: 235: PBOD2 = 1;
	bsf	status, 5	;RP0=1, select bank3
	bsf	status, 6	;RP1=1, select bank3
	bsf	(3138/8)^0180h,(3138)&7
	line	239
	
l709:	
	return
	opt stack 0
GLOBAL	__end_of_initPB2_AsHighResistence
	__end_of_initPB2_AsHighResistence:
;; =============== function _initPB2_AsHighResistence ends ============

	signat	_initPB2_AsHighResistence,88
	global	_setPB5
psect	text1398,local,class=CODE,delta=2
global __ptext1398
__ptext1398:

;; *************** function _setPB5 *****************
;; Defined at:
;;		line 212 in file "D:\develop\AK7030-good\AK7030-OTP\main.c"
;; Parameters:    Size  Location     Type
;;  bValue          1    wreg     unsigned char 
;; Auto vars:     Size  Location     Type
;;  bValue          1    0[BANK1 ] unsigned char 
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
;;      Locals:         0       0       1       0       0
;;      Temps:          0       0       0       0       0
;;      Totals:         0       0       1       0       0
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
psect	text1398
	file	"D:\develop\AK7030-good\AK7030-OTP\main.c"
	line	212
	global	__size_of_setPB5
	__size_of_setPB5	equ	__end_of_setPB5-_setPB5
	
_setPB5:	
	opt	stack 4
; Regs used in _setPB5: [wreg]
;setPB5@bValue stored from wreg
	bsf	status, 5	;RP0=1, select bank1
	movwf	(setPB5@bValue)^080h
	line	213
	
l3987:	
;main.c: 213: if( bValue )
	movf	(setPB5@bValue)^080h,w
	skipz
	goto	u1720
	goto	l704
u1720:
	line	216
	
l3989:	
;main.c: 216: PB1 = 1;
	bcf	status, 5	;RP0=0, select bank0
	bsf	(49/8),(49)&7
	goto	l706
	line	221
	
l704:	
	line	224
;main.c: 221: else
;main.c: 224: PB1 = 0;
	bcf	status, 5	;RP0=0, select bank0
	bcf	(49/8),(49)&7
	line	228
	
l706:	
	return
	opt stack 0
GLOBAL	__end_of_setPB5
	__end_of_setPB5:
;; =============== function _setPB5 ends ============

	signat	_setPB5,4216
	global	_initPB5
psect	text1399,local,class=CODE,delta=2
global __ptext1399
__ptext1399:

;; *************** function _initPB5 *****************
;; Defined at:
;;		line 193 in file "D:\develop\AK7030-good\AK7030-OTP\main.c"
;; Parameters:    Size  Location     Type
;;  bValue          1    wreg     unsigned char 
;; Auto vars:     Size  Location     Type
;;  bValue          1    0[BANK1 ] unsigned char 
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
;;      Locals:         0       0       1       0       0
;;      Temps:          0       0       0       0       0
;;      Totals:         0       0       1       0       0
;;Total ram usage:        1 bytes
;; Hardware stack levels used:    1
;; Hardware stack levels required when called:    3
;; This function calls:
;;		Nothing
;; This function is called by:
;;		_initPin
;; This function uses a non-reentrant model
;;
psect	text1399
	file	"D:\develop\AK7030-good\AK7030-OTP\main.c"
	line	193
	global	__size_of_initPB5
	__size_of_initPB5	equ	__end_of_initPB5-_initPB5
	
_initPB5:	
	opt	stack 3
; Regs used in _initPB5: [wreg]
;initPB5@bValue stored from wreg
	movwf	(initPB5@bValue)^080h
	line	194
	
l3983:	
;main.c: 194: if( bValue )
	movf	(initPB5@bValue)^080h,w
	skipz
	goto	u1710
	goto	l699
u1710:
	line	197
	
l3985:	
;main.c: 197: TRISB1 = 1;
	bsf	(1073/8)^080h,(1073)&7
	goto	l701
	line	201
	
l699:	
	line	204
;main.c: 201: else
;main.c: 204: TRISB1= 0;
	bcf	(1073/8)^080h,(1073)&7
	line	208
	
l701:	
	return
	opt stack 0
GLOBAL	__end_of_initPB5
	__end_of_initPB5:
;; =============== function _initPB5 ends ============

	signat	_initPB5,4216
	global	_setPB4
psect	text1400,local,class=CODE,delta=2
global __ptext1400
__ptext1400:

;; *************** function _setPB4 *****************
;; Defined at:
;;		line 174 in file "D:\develop\AK7030-good\AK7030-OTP\main.c"
;; Parameters:    Size  Location     Type
;;  bValue          1    wreg     unsigned char 
;; Auto vars:     Size  Location     Type
;;  bValue          1    0[BANK1 ] unsigned char 
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
;;      Locals:         0       0       1       0       0
;;      Temps:          0       0       0       0       0
;;      Totals:         0       0       1       0       0
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
psect	text1400
	file	"D:\develop\AK7030-good\AK7030-OTP\main.c"
	line	174
	global	__size_of_setPB4
	__size_of_setPB4	equ	__end_of_setPB4-_setPB4
	
_setPB4:	
	opt	stack 4
; Regs used in _setPB4: [wreg]
;setPB4@bValue stored from wreg
	bsf	status, 5	;RP0=1, select bank1
	movwf	(setPB4@bValue)^080h
	line	175
	
l3979:	
;main.c: 175: if( bValue )
	movf	(setPB4@bValue)^080h,w
	skipz
	goto	u1700
	goto	l694
u1700:
	line	178
	
l3981:	
;main.c: 178: PB3 = 1;
	bcf	status, 5	;RP0=0, select bank0
	bsf	(51/8),(51)&7
	goto	l696
	line	182
	
l694:	
	line	185
;main.c: 182: else
;main.c: 185: PB3 = 0;
	bcf	status, 5	;RP0=0, select bank0
	bcf	(51/8),(51)&7
	line	189
	
l696:	
	return
	opt stack 0
GLOBAL	__end_of_setPB4
	__end_of_setPB4:
;; =============== function _setPB4 ends ============

	signat	_setPB4,4216
	global	_initPB4
psect	text1401,local,class=CODE,delta=2
global __ptext1401
__ptext1401:

;; *************** function _initPB4 *****************
;; Defined at:
;;		line 155 in file "D:\develop\AK7030-good\AK7030-OTP\main.c"
;; Parameters:    Size  Location     Type
;;  bValue          1    wreg     unsigned char 
;; Auto vars:     Size  Location     Type
;;  bValue          1    0[BANK1 ] unsigned char 
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
;;      Locals:         0       0       1       0       0
;;      Temps:          0       0       0       0       0
;;      Totals:         0       0       1       0       0
;;Total ram usage:        1 bytes
;; Hardware stack levels used:    1
;; Hardware stack levels required when called:    3
;; This function calls:
;;		Nothing
;; This function is called by:
;;		_initPin
;; This function uses a non-reentrant model
;;
psect	text1401
	file	"D:\develop\AK7030-good\AK7030-OTP\main.c"
	line	155
	global	__size_of_initPB4
	__size_of_initPB4	equ	__end_of_initPB4-_initPB4
	
_initPB4:	
	opt	stack 3
; Regs used in _initPB4: [wreg]
;initPB4@bValue stored from wreg
	movwf	(initPB4@bValue)^080h
	line	156
	
l3975:	
;main.c: 156: if( bValue )
	movf	(initPB4@bValue)^080h,w
	skipz
	goto	u1690
	goto	l689
u1690:
	line	159
	
l3977:	
;main.c: 159: TRISB3 = 1;
	bsf	(1075/8)^080h,(1075)&7
	goto	l691
	line	163
	
l689:	
	line	166
;main.c: 163: else
;main.c: 166: TRISB3 = 0;
	bcf	(1075/8)^080h,(1075)&7
	line	170
	
l691:	
	return
	opt stack 0
GLOBAL	__end_of_initPB4
	__end_of_initPB4:
;; =============== function _initPB4 ends ============

	signat	_initPB4,4216
	global	_setPB3
psect	text1402,local,class=CODE,delta=2
global __ptext1402
__ptext1402:

;; *************** function _setPB3 *****************
;; Defined at:
;;		line 135 in file "D:\develop\AK7030-good\AK7030-OTP\main.c"
;; Parameters:    Size  Location     Type
;;  bValue          1    wreg     unsigned char 
;; Auto vars:     Size  Location     Type
;;  bValue          1    0[BANK1 ] unsigned char 
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
;;      Locals:         0       0       1       0       0
;;      Temps:          0       0       0       0       0
;;      Totals:         0       0       1       0       0
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
psect	text1402
	file	"D:\develop\AK7030-good\AK7030-OTP\main.c"
	line	135
	global	__size_of_setPB3
	__size_of_setPB3	equ	__end_of_setPB3-_setPB3
	
_setPB3:	
	opt	stack 4
; Regs used in _setPB3: [wreg]
;setPB3@bValue stored from wreg
	bsf	status, 5	;RP0=1, select bank1
	movwf	(setPB3@bValue)^080h
	line	136
	
l3971:	
;main.c: 136: if( bValue )
	movf	(setPB3@bValue)^080h,w
	skipz
	goto	u1680
	goto	l684
u1680:
	line	139
	
l3973:	
;main.c: 139: PB0 = 1;
	bcf	status, 5	;RP0=0, select bank0
	bsf	(48/8),(48)&7
	goto	l686
	line	143
	
l684:	
	line	146
;main.c: 143: else
;main.c: 146: PB0 = 0;
	bcf	status, 5	;RP0=0, select bank0
	bcf	(48/8),(48)&7
	line	150
	
l686:	
	return
	opt stack 0
GLOBAL	__end_of_setPB3
	__end_of_setPB3:
;; =============== function _setPB3 ends ============

	signat	_setPB3,4216
	global	_initPB3
psect	text1403,local,class=CODE,delta=2
global __ptext1403
__ptext1403:

;; *************** function _initPB3 *****************
;; Defined at:
;;		line 116 in file "D:\develop\AK7030-good\AK7030-OTP\main.c"
;; Parameters:    Size  Location     Type
;;  bValue          1    wreg     unsigned char 
;; Auto vars:     Size  Location     Type
;;  bValue          1    0[BANK1 ] unsigned char 
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
;;      Locals:         0       0       1       0       0
;;      Temps:          0       0       0       0       0
;;      Totals:         0       0       1       0       0
;;Total ram usage:        1 bytes
;; Hardware stack levels used:    1
;; Hardware stack levels required when called:    3
;; This function calls:
;;		Nothing
;; This function is called by:
;;		_initPin
;; This function uses a non-reentrant model
;;
psect	text1403
	file	"D:\develop\AK7030-good\AK7030-OTP\main.c"
	line	116
	global	__size_of_initPB3
	__size_of_initPB3	equ	__end_of_initPB3-_initPB3
	
_initPB3:	
	opt	stack 3
; Regs used in _initPB3: [wreg]
;initPB3@bValue stored from wreg
	bcf	status, 6	;RP1=0, select bank1
	movwf	(initPB3@bValue)^080h
	line	117
	
l3967:	
;main.c: 117: if( bValue )
	movf	(initPB3@bValue)^080h,w
	skipz
	goto	u1670
	goto	l679
u1670:
	line	120
	
l3969:	
;main.c: 120: TRISB0 = 1;
	bsf	(1072/8)^080h,(1072)&7
	goto	l681
	line	124
	
l679:	
	line	127
;main.c: 124: else
;main.c: 127: TRISB0 = 0;
	bcf	(1072/8)^080h,(1072)&7
	line	131
	
l681:	
	return
	opt stack 0
GLOBAL	__end_of_initPB3
	__end_of_initPB3:
;; =============== function _initPB3 ends ============

	signat	_initPB3,4216
	global	_ISR
psect	text1404,local,class=CODE,delta=2
global __ptext1404
__ptext1404:

;; *************** function _ISR *****************
;; Defined at:
;;		line 638 in file "D:\develop\AK7030-good\AK7030-OTP\common.c"
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
psect	text1404
	file	"D:\develop\AK7030-good\AK7030-OTP\common.c"
	line	638
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
psect	text1404
	line	642
	
i1l3733:	
;common.c: 639: static unsigned char ucTimer1sCnt = 0;
;common.c: 642: if(TMR1IF == 1)
	btfss	(96/8),(96)&7
	goto	u136_21
	goto	u136_20
u136_21:
	goto	i1l3755
u136_20:
	line	644
	
i1l3735:	
;common.c: 643: {
;common.c: 644: TMR1IF = 0 ;
	bcf	(96/8),(96)&7
	line	645
	
i1l3737:	
;common.c: 645: timer.timer10msStopWatch++;
	incf	(_timer),f
	line	646
;common.c: 646: ucTimer1sCnt++;
	incf	(ISR@ucTimer1sCnt),f
	line	650
	
i1l3739:	
;common.c: 650: if(ucTimer1sCnt >= 100)
	movlw	(064h)
	subwf	(ISR@ucTimer1sCnt),w
	skipc
	goto	u137_21
	goto	u137_20
u137_21:
	goto	i1l3755
u137_20:
	line	652
	
i1l3741:	
;common.c: 651: {
;common.c: 652: ucTimer1sCnt = 0;
	clrf	(ISR@ucTimer1sCnt)
	line	653
	
i1l3743:	
;common.c: 653: if(uiBigTimer > 0)
	movf	(_uiBigTimer+1),w
	iorwf	(_uiBigTimer),w
	skipnz
	goto	u138_21
	goto	u138_20
u138_21:
	goto	i1l1672
u138_20:
	line	654
	
i1l3745:	
;common.c: 654: uiBigTimer--;
	movlw	low(01h)
	subwf	(_uiBigTimer),f
	movlw	high(01h)
	skipc
	decf	(_uiBigTimer+1),f
	subwf	(_uiBigTimer+1),f
	
i1l1672:	
	line	656
;common.c: 656: if(uiSmallTimer)
	movf	(_uiSmallTimer+1),w
	iorwf	(_uiSmallTimer),w
	skipnz
	goto	u139_21
	goto	u139_20
u139_21:
	goto	i1l1673
u139_20:
	line	657
	
i1l3747:	
;common.c: 657: uiSmallTimer--;
	movlw	low(01h)
	subwf	(_uiSmallTimer),f
	movlw	high(01h)
	skipc
	decf	(_uiSmallTimer+1),f
	subwf	(_uiSmallTimer+1),f
	
i1l1673:	
	line	659
;common.c: 659: if(uiTwentySecondsTimer)
	movf	(_uiTwentySecondsTimer+1),w
	iorwf	(_uiTwentySecondsTimer),w
	skipnz
	goto	u140_21
	goto	u140_20
u140_21:
	goto	i1l1674
u140_20:
	line	660
	
i1l3749:	
;common.c: 660: uiTwentySecondsTimer--;
	movlw	low(01h)
	subwf	(_uiTwentySecondsTimer),f
	movlw	high(01h)
	skipc
	decf	(_uiTwentySecondsTimer+1),f
	subwf	(_uiTwentySecondsTimer+1),f
	
i1l1674:	
	line	662
;common.c: 662: if(uiTwentyMinTimer)
	movf	(_uiTwentyMinTimer+1),w
	iorwf	(_uiTwentyMinTimer),w
	skipnz
	goto	u141_21
	goto	u141_20
u141_21:
	goto	i1l1675
u141_20:
	line	663
	
i1l3751:	
;common.c: 663: uiTwentyMinTimer--;
	movlw	low(01h)
	subwf	(_uiTwentyMinTimer),f
	movlw	high(01h)
	skipc
	decf	(_uiTwentyMinTimer+1),f
	subwf	(_uiTwentyMinTimer+1),f
	
i1l1675:	
	line	665
;common.c: 665: if( uiOneHourTimer )
	movf	(_uiOneHourTimer+1),w
	iorwf	(_uiOneHourTimer),w
	skipnz
	goto	u142_21
	goto	u142_20
u142_21:
	goto	i1l3755
u142_20:
	line	666
	
i1l3753:	
;common.c: 666: uiOneHourTimer--;
	movlw	low(01h)
	subwf	(_uiOneHourTimer),f
	movlw	high(01h)
	skipc
	decf	(_uiOneHourTimer+1),f
	subwf	(_uiOneHourTimer+1),f
	line	670
	
i1l3755:	
;common.c: 667: }
;common.c: 668: }
;common.c: 670: if(ADIF)
	btfss	(106/8),(106)&7
	goto	u143_21
	goto	u143_20
u143_21:
	goto	i1l1680
u143_20:
	line	673
	
i1l3757:	
;common.c: 671: {
;common.c: 673: ADIF=0;
	bcf	(106/8),(106)&7
	line	674
	
i1l3759:	
;common.c: 674: setAD_ConvertFlag(1);
	movlw	(01h)
	fcall	i1_setAD_ConvertFlag
	line	676
	
i1l3761:	
;common.c: 676: if(sampleChannelSelect == 2)
	movf	(_sampleChannelSelect),w
	xorlw	02h
	skipz
	goto	u144_21
	goto	u144_20
u144_21:
	goto	i1l3765
u144_20:
	line	680
	
i1l3763:	
;common.c: 677: {
;common.c: 680: vPutSampleDataIntoTable(adc_get(),2);
	fcall	_adc_get
	movf	(1+(?_adc_get)),w
	movwf	(?_vPutSampleDataIntoTable+1)
	movf	(0+(?_adc_get)),w
	movwf	(?_vPutSampleDataIntoTable)
	movlw	(02h)
	movwf	0+(?_vPutSampleDataIntoTable)+02h
	fcall	_vPutSampleDataIntoTable
	line	684
;common.c: 684: }
	goto	i1l1680
	line	690
	
i1l3765:	
;common.c: 685: else
;common.c: 686: {
;common.c: 690: vPutSampleDataIntoTable(adc_get(),1);
	fcall	_adc_get
	movf	(1+(?_adc_get)),w
	movwf	(?_vPutSampleDataIntoTable+1)
	movf	(0+(?_adc_get)),w
	movwf	(?_vPutSampleDataIntoTable)
	clrf	0+(?_vPutSampleDataIntoTable)+02h
	incf	0+(?_vPutSampleDataIntoTable)+02h,f
	fcall	_vPutSampleDataIntoTable
	line	695
	
i1l1680:	
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
psect	text1405,local,class=CODE,delta=2
global __ptext1405
__ptext1405:

;; *************** function _vPutSampleDataIntoTable *****************
;; Defined at:
;;		line 165 in file "D:\develop\AK7030-good\AK7030-OTP\common.c"
;; Parameters:    Size  Location     Type
;;  uiSampleData    2    6[COMMON] unsigned int 
;;  channel         1    8[COMMON] unsigned char 
;; Auto vars:     Size  Location     Type
;;  uiDeviationV    2    9[COMMON] unsigned int 
;;  uiAbstractVa    2    0        unsigned int 
;;  i               2   11[COMMON] int 
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
;;      Locals:         4       0       0       0       0
;;      Temps:          0      16       0       0       0
;;      Totals:         7      16       0       0       0
;;Total ram usage:       23 bytes
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
psect	text1405
	file	"D:\develop\AK7030-good\AK7030-OTP\common.c"
	line	165
	global	__size_of_vPutSampleDataIntoTable
	__size_of_vPutSampleDataIntoTable	equ	__end_of_vPutSampleDataIntoTable-_vPutSampleDataIntoTable
	
_vPutSampleDataIntoTable:	
	opt	stack 3
; Regs used in _vPutSampleDataIntoTable: [wreg-fsr0h+status,2+status,0+btemp+1+pclath+cstack]
	line	182
	
i1l3627:	
;common.c: 167: static unsigned char ucCh12Length = 0;
;common.c: 169: static unsigned char ucCh13Length = 0;
;common.c: 171: static unsigned char ucChannelFourteenthLength = 0;
;common.c: 172: static unsigned int uiCalWidthArrayNew = 0;
;common.c: 173: static unsigned int uiCalWidthArrayOld = 0;
;common.c: 175: static unsigned int uiCalWidthArray1 = 0;
;common.c: 176: static unsigned int uiCalWidthArray2 = 0;
;common.c: 177: static unsigned int uiCalWidthArray3 = 0;
;common.c: 178: static unsigned int uiCalWidthArray4 = 0;
	movf	(vPutSampleDataIntoTable@channel),w
	xorlw	02h
	skipz
	goto	u118_21
	goto	u118_20
u118_21:
	goto	i1l3677
u118_20:
	line	184
	
i1l3629:	
;common.c: 183: {
;common.c: 184: if(ucCh12Length < 3)
	movlw	(03h)
	subwf	(vPutSampleDataIntoTable@ucCh12Length),w
	skipnc
	goto	u119_21
	goto	u119_20
u119_21:
	goto	i1l3673
u119_20:
	line	186
	
i1l3631:	
;common.c: 185: {
;common.c: 186: uiSampleCh12[ucCh12Length] = uiSampleData;
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
	line	188
	
i1l3633:	
;common.c: 188: ucCh12Length++;
	incf	(vPutSampleDataIntoTable@ucCh12Length),f
	line	190
	
i1l3635:	
;common.c: 190: if( 3 == ucCh12Length )
	movf	(vPutSampleDataIntoTable@ucCh12Length),w
	xorlw	03h
	skipz
	goto	u120_21
	goto	u120_20
u120_21:
	goto	i1l1566
u120_20:
	line	192
	
i1l3637:	
;common.c: 191: {
;common.c: 192: ucCh12Length = 0;
	clrf	(vPutSampleDataIntoTable@ucCh12Length)
	line	203
	
i1l3639:	
;common.c: 196: static unsigned char bInitArrayFlag = 0;
;common.c: 198: static unsigned int uiCalWidthArray[1],uiCalWidthCnt = 0;
;common.c: 200: static unsigned char uiInitWidth = 75;
;common.c: 203: uiCalWidthArray1 = Filter(uiSampleCh12);
	movlw	(_uiSampleCh12)&0ffh
	fcall	_Filter
	movf	(1+(?_Filter)),w
	movwf	(vPutSampleDataIntoTable@uiCalWidthArray1+1)
	movf	(0+(?_Filter)),w
	movwf	(vPutSampleDataIntoTable@uiCalWidthArray1)
	line	205
	
i1l3641:	
;common.c: 205: if( 0 == ucInitFlag)
	movf	(vPutSampleDataIntoTable@ucInitFlag),f
	skipz
	goto	u121_21
	goto	u121_20
u121_21:
	goto	i1l3647
u121_20:
	line	207
	
i1l3643:	
;common.c: 206: {
;common.c: 207: ucInitFlag = 1;
	clrf	(vPutSampleDataIntoTable@ucInitFlag)
	incf	(vPutSampleDataIntoTable@ucInitFlag),f
	line	209
	
i1l3645:	
;common.c: 209: uiCalWidthArray2 = uiCalWidthArray1;
	movf	(vPutSampleDataIntoTable@uiCalWidthArray1+1),w
	movwf	(vPutSampleDataIntoTable@uiCalWidthArray2+1)
	movf	(vPutSampleDataIntoTable@uiCalWidthArray1),w
	movwf	(vPutSampleDataIntoTable@uiCalWidthArray2)
	line	210
;common.c: 210: uiCalWidthArray3 = uiCalWidthArray1;
	movf	(vPutSampleDataIntoTable@uiCalWidthArray1+1),w
	movwf	(vPutSampleDataIntoTable@uiCalWidthArray3+1)
	movf	(vPutSampleDataIntoTable@uiCalWidthArray1),w
	movwf	(vPutSampleDataIntoTable@uiCalWidthArray3)
	line	211
;common.c: 211: uiCalWidthArray4 = uiCalWidthArray1;
	movf	(vPutSampleDataIntoTable@uiCalWidthArray1+1),w
	movwf	(vPutSampleDataIntoTable@uiCalWidthArray4+1)
	movf	(vPutSampleDataIntoTable@uiCalWidthArray1),w
	movwf	(vPutSampleDataIntoTable@uiCalWidthArray4)
	line	214
	
i1l3647:	
	line	229
	
i1l3649:	
;common.c: 228: uiDeviationValue = (uiCalWidthArray1 >> 2) + (uiCalWidthArray2 >> 2)
;common.c: 229: + (uiCalWidthArray3 >> 2) + (uiCalWidthArray4 >> 2) + uiCalWidthArray4 - uiCalWidthArray3;
	movf	(vPutSampleDataIntoTable@uiCalWidthArray4+1),w
	movwf	(??_vPutSampleDataIntoTable+0)+0+1
	movf	(vPutSampleDataIntoTable@uiCalWidthArray4),w
	movwf	(??_vPutSampleDataIntoTable+0)+0
	clrc
	rrf	(??_vPutSampleDataIntoTable+0)+1,f
	rrf	(??_vPutSampleDataIntoTable+0)+0,f
	clrc
	rrf	(??_vPutSampleDataIntoTable+0)+1,f
	rrf	(??_vPutSampleDataIntoTable+0)+0,f
	movf	(vPutSampleDataIntoTable@uiCalWidthArray3+1),w
	movwf	(??_vPutSampleDataIntoTable+2)+0+1
	movf	(vPutSampleDataIntoTable@uiCalWidthArray3),w
	movwf	(??_vPutSampleDataIntoTable+2)+0
	clrc
	rrf	(??_vPutSampleDataIntoTable+2)+1,f
	rrf	(??_vPutSampleDataIntoTable+2)+0,f
	clrc
	rrf	(??_vPutSampleDataIntoTable+2)+1,f
	rrf	(??_vPutSampleDataIntoTable+2)+0,f
	movf	(vPutSampleDataIntoTable@uiCalWidthArray2+1),w
	movwf	(??_vPutSampleDataIntoTable+4)+0+1
	movf	(vPutSampleDataIntoTable@uiCalWidthArray2),w
	movwf	(??_vPutSampleDataIntoTable+4)+0
	clrc
	rrf	(??_vPutSampleDataIntoTable+4)+1,f
	rrf	(??_vPutSampleDataIntoTable+4)+0,f
	clrc
	rrf	(??_vPutSampleDataIntoTable+4)+1,f
	rrf	(??_vPutSampleDataIntoTable+4)+0,f
	movf	(vPutSampleDataIntoTable@uiCalWidthArray1+1),w
	movwf	(??_vPutSampleDataIntoTable+6)+0+1
	movf	(vPutSampleDataIntoTable@uiCalWidthArray1),w
	movwf	(??_vPutSampleDataIntoTable+6)+0
	clrc
	rrf	(??_vPutSampleDataIntoTable+6)+1,f
	rrf	(??_vPutSampleDataIntoTable+6)+0,f
	clrc
	rrf	(??_vPutSampleDataIntoTable+6)+1,f
	rrf	(??_vPutSampleDataIntoTable+6)+0,f
	movf	0+(??_vPutSampleDataIntoTable+4)+0,w
	addwf	0+(??_vPutSampleDataIntoTable+6)+0,w
	movwf	(??_vPutSampleDataIntoTable+8)+0
	movf	1+(??_vPutSampleDataIntoTable+4)+0,w
	skipnc
	incf	1+(??_vPutSampleDataIntoTable+4)+0,w
	addwf	1+(??_vPutSampleDataIntoTable+6)+0,w
	movwf	1+(??_vPutSampleDataIntoTable+8)+0
	movf	0+(??_vPutSampleDataIntoTable+2)+0,w
	addwf	0+(??_vPutSampleDataIntoTable+8)+0,w
	movwf	(??_vPutSampleDataIntoTable+10)+0
	movf	1+(??_vPutSampleDataIntoTable+2)+0,w
	skipnc
	incf	1+(??_vPutSampleDataIntoTable+2)+0,w
	addwf	1+(??_vPutSampleDataIntoTable+8)+0,w
	movwf	1+(??_vPutSampleDataIntoTable+10)+0
	movf	0+(??_vPutSampleDataIntoTable+0)+0,w
	addwf	0+(??_vPutSampleDataIntoTable+10)+0,w
	movwf	(??_vPutSampleDataIntoTable+12)+0
	movf	1+(??_vPutSampleDataIntoTable+0)+0,w
	skipnc
	incf	1+(??_vPutSampleDataIntoTable+0)+0,w
	addwf	1+(??_vPutSampleDataIntoTable+10)+0,w
	movwf	1+(??_vPutSampleDataIntoTable+12)+0
	movf	(vPutSampleDataIntoTable@uiCalWidthArray3),w
	subwf	0+(??_vPutSampleDataIntoTable+12)+0,w
	movwf	(??_vPutSampleDataIntoTable+14)+0
	movf	(vPutSampleDataIntoTable@uiCalWidthArray3+1),w
	skipc
	incf	(vPutSampleDataIntoTable@uiCalWidthArray3+1),w
	subwf	1+(??_vPutSampleDataIntoTable+12)+0,w
	movwf	1+(??_vPutSampleDataIntoTable+14)+0
	movf	(vPutSampleDataIntoTable@uiCalWidthArray4),w
	addwf	0+(??_vPutSampleDataIntoTable+14)+0,w
	movwf	(vPutSampleDataIntoTable@uiDeviationValue)
	movf	(vPutSampleDataIntoTable@uiCalWidthArray4+1),w
	skipnc
	incf	(vPutSampleDataIntoTable@uiCalWidthArray4+1),w
	addwf	1+(??_vPutSampleDataIntoTable+14)+0,w
	movwf	1+(vPutSampleDataIntoTable@uiDeviationValue)
	line	233
	
i1l3651:	
;common.c: 233: if(uiCalWidthCnt>400)
	movlw	high(0191h)
	subwf	(vPutSampleDataIntoTable@uiCalWidthCnt+1),w
	movlw	low(0191h)
	skipnz
	subwf	(vPutSampleDataIntoTable@uiCalWidthCnt),w
	skipc
	goto	u122_21
	goto	u122_20
u122_21:
	goto	i1l1545
u122_20:
	line	234
	
i1l3653:	
;common.c: 234: uiDeviationValue =400;
	movlw	low(0190h)
	movwf	(vPutSampleDataIntoTable@uiDeviationValue)
	movlw	high(0190h)
	movwf	((vPutSampleDataIntoTable@uiDeviationValue))+1
	
i1l1545:	
	line	236
;common.c: 236: uiCalWidthArray4 = uiCalWidthArray3;
	movf	(vPutSampleDataIntoTable@uiCalWidthArray3+1),w
	movwf	(vPutSampleDataIntoTable@uiCalWidthArray4+1)
	movf	(vPutSampleDataIntoTable@uiCalWidthArray3),w
	movwf	(vPutSampleDataIntoTable@uiCalWidthArray4)
	line	237
;common.c: 237: uiCalWidthArray3 = uiCalWidthArray2;
	movf	(vPutSampleDataIntoTable@uiCalWidthArray2+1),w
	movwf	(vPutSampleDataIntoTable@uiCalWidthArray3+1)
	movf	(vPutSampleDataIntoTable@uiCalWidthArray2),w
	movwf	(vPutSampleDataIntoTable@uiCalWidthArray3)
	line	238
;common.c: 241: uiCalWidthArrayOld=uiCalWidthArrayNew;
	movf	(vPutSampleDataIntoTable@uiCalWidthArray1+1),w
	movwf	(vPutSampleDataIntoTable@uiCalWidthArray2+1)
	movf	(vPutSampleDataIntoTable@uiCalWidthArray1),w
	movwf	(vPutSampleDataIntoTable@uiCalWidthArray2)
	line	246
;common.c: 246: if(uiDeviationValue > (295))
	movlw	high(0128h)
	subwf	(vPutSampleDataIntoTable@uiDeviationValue+1),w
	movlw	low(0128h)
	skipnz
	subwf	(vPutSampleDataIntoTable@uiDeviationValue),w
	skipc
	goto	u123_21
	goto	u123_20
u123_21:
	goto	i1l3657
u123_20:
	line	250
	
i1l3655:	
;common.c: 247: {
;common.c: 250: uiInitWidth++;
	incf	(vPutSampleDataIntoTable@uiInitWidth),f
	line	252
;common.c: 252: }
	goto	i1l3661
	line	253
	
i1l3657:	
;common.c: 253: else if(uiDeviationValue < (295))
	movlw	high(0127h)
	subwf	(vPutSampleDataIntoTable@uiDeviationValue+1),w
	movlw	low(0127h)
	skipnz
	subwf	(vPutSampleDataIntoTable@uiDeviationValue),w
	skipnc
	goto	u124_21
	goto	u124_20
u124_21:
	goto	i1l3661
u124_20:
	line	257
	
i1l3659:	
;common.c: 254: {
;common.c: 257: uiInitWidth--;
	decf	(vPutSampleDataIntoTable@uiInitWidth),f
	line	263
;common.c: 259: }
	
i1l3661:	
;common.c: 263: if(uiInitWidth > 249)
	movlw	(0FAh)
	subwf	(vPutSampleDataIntoTable@uiInitWidth),w
	skipc
	goto	u125_21
	goto	u125_20
u125_21:
	goto	i1l1550
u125_20:
	line	264
	
i1l3663:	
;common.c: 264: uiInitWidth = 249;
	movlw	(0F9h)
	movwf	(vPutSampleDataIntoTable@uiInitWidth)
	
i1l1550:	
	line	266
;common.c: 266: if(uiInitWidth < 75)
	movlw	(04Bh)
	subwf	(vPutSampleDataIntoTable@uiInitWidth),w
	skipnc
	goto	u126_21
	goto	u126_20
u126_21:
	goto	i1l3667
u126_20:
	line	267
	
i1l3665:	
;common.c: 267: uiInitWidth = 75;
	movlw	(04Bh)
	movwf	(vPutSampleDataIntoTable@uiInitWidth)
	line	271
	
i1l3667:	
;common.c: 271: if( 1 == getWaitResetFlag())
	fcall	_getWaitResetFlag
	xorlw	01h
	skipz
	goto	u127_21
	goto	u127_20
u127_21:
	goto	i1l3671
u127_20:
	line	274
	
i1l3669:	
;common.c: 272: {
;common.c: 274: uiInitWidth = 150;
	movlw	(096h)
	movwf	(vPutSampleDataIntoTable@uiInitWidth)
	line	276
	
i1l3671:	
;common.c: 275: }
;common.c: 276: setPWM_Width(uiInitWidth);
	movf	(vPutSampleDataIntoTable@uiInitWidth),w
	fcall	_setPWM_Width
	goto	i1l1566
	line	283
	
i1l3673:	
;common.c: 281: else
;common.c: 282: {
;common.c: 283: ucCh12Length = 0;
	clrf	(vPutSampleDataIntoTable@ucCh12Length)
	line	285
	
i1l3675:	
;common.c: 285: uiSampleCh12[ucCh12Length] = uiSampleData;
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
	goto	i1l1566
	line	288
	
i1l3677:	
;common.c: 288: else if(channel == 1)
	decf	(vPutSampleDataIntoTable@channel),w
	skipz
	goto	u128_21
	goto	u128_20
u128_21:
	goto	i1l3689
u128_20:
	line	290
	
i1l3679:	
;common.c: 289: {
;common.c: 290: if(ucCh13Length < 3)
	movlw	(03h)
	bcf	status, 5	;RP0=0, select bank0
	subwf	(vPutSampleDataIntoTable@ucCh13Length),w
	skipnc
	goto	u129_21
	goto	u129_20
u129_21:
	goto	i1l3685
u129_20:
	line	292
	
i1l3681:	
;common.c: 291: {
;common.c: 292: uiSampleCh13[ucCh13Length] = uiSampleData;
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
	line	294
	
i1l3683:	
;common.c: 294: ucCh13Length++;
	incf	(vPutSampleDataIntoTable@ucCh13Length),f
	line	295
;common.c: 295: }
	goto	i1l1566
	line	298
	
i1l3685:	
;common.c: 296: else
;common.c: 297: {
;common.c: 298: ucCh13Length = 0;
	clrf	(vPutSampleDataIntoTable@ucCh13Length)
	line	300
	
i1l3687:	
;common.c: 300: uiSampleCh13[ucCh13Length] = uiSampleData;
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
	goto	i1l1566
	line	303
	
i1l3689:	
;common.c: 303: else if(channel == 14)
	movf	(vPutSampleDataIntoTable@channel),w
	xorlw	0Eh
	skipz
	goto	u130_21
	goto	u130_20
u130_21:
	goto	i1l3701
u130_20:
	line	305
	
i1l3691:	
;common.c: 304: {
;common.c: 305: if(ucChannelFourteenthLength < 3)
	movlw	(03h)
	bcf	status, 5	;RP0=0, select bank0
	subwf	(vPutSampleDataIntoTable@ucChannelFourteenthLength),w
	skipnc
	goto	u131_21
	goto	u131_20
u131_21:
	goto	i1l3697
u131_20:
	line	307
	
i1l3693:	
;common.c: 306: {
;common.c: 307: uiSampleChannelFourteenth[ucChannelFourteenthLength] = uiSampleData;
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
	line	309
	
i1l3695:	
;common.c: 309: ucChannelFourteenthLength++;
	incf	(vPutSampleDataIntoTable@ucChannelFourteenthLength),f
	line	310
;common.c: 310: }
	goto	i1l1566
	line	313
	
i1l3697:	
;common.c: 311: else
;common.c: 312: {
;common.c: 313: ucChannelFourteenthLength = 0;
	clrf	(vPutSampleDataIntoTable@ucChannelFourteenthLength)
	line	315
	
i1l3699:	
;common.c: 315: uiSampleCh13[ucChannelFourteenthLength] = uiSampleData;
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
	goto	i1l1566
	line	320
	
i1l3701:	
;common.c: 318: else
;common.c: 319: {
;common.c: 320: ucCh12Length = 0;
	clrf	(vPutSampleDataIntoTable@ucCh12Length)
	line	322
;common.c: 322: ucCh13Length = 0;
	bcf	status, 5	;RP0=0, select bank0
	clrf	(vPutSampleDataIntoTable@ucCh13Length)
	line	324
;common.c: 324: ucChannelFourteenthLength = 0;
	clrf	(vPutSampleDataIntoTable@ucChannelFourteenthLength)
	line	326
;common.c: 326: for(int i = 0;i < 3; i++)
	clrf	(vPutSampleDataIntoTable@i)
	clrf	(vPutSampleDataIntoTable@i+1)
	line	328
	
i1l3707:	
;common.c: 327: {
;common.c: 328: uiSampleCh12[i] = 0;
	clrc
	rlf	(vPutSampleDataIntoTable@i),w
	addlw	_uiSampleCh12&0ffh
	movwf	fsr0
	bcf	status, 7	;select IRP bank1
	clrf	indf
	incf	fsr0,f
	clrf	indf
	line	330
;common.c: 330: uiSampleCh13[i] = 0;
	clrc
	rlf	(vPutSampleDataIntoTable@i),w
	addlw	_uiSampleCh13&0ffh
	movwf	fsr0
	clrf	indf
	incf	fsr0,f
	clrf	indf
	line	332
;common.c: 332: uiSampleChannelFourteenth[i] = 0;
	clrc
	rlf	(vPutSampleDataIntoTable@i),w
	addlw	_uiSampleChannelFourteenth&0ffh
	movwf	fsr0
	clrf	indf
	incf	fsr0,f
	clrf	indf
	line	326
	
i1l3709:	
	incf	(vPutSampleDataIntoTable@i),f
	skipnz
	incf	(vPutSampleDataIntoTable@i+1),f
	
i1l3711:	
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
	goto	i1l3707
u132_20:
	line	336
	
i1l1566:	
	return
	opt stack 0
GLOBAL	__end_of_vPutSampleDataIntoTable
	__end_of_vPutSampleDataIntoTable:
;; =============== function _vPutSampleDataIntoTable ends ============

	signat	_vPutSampleDataIntoTable,8312
	global	i1_setAD_ConvertFlag
psect	text1406,local,class=CODE,delta=2
global __ptext1406
__ptext1406:

;; *************** function i1_setAD_ConvertFlag *****************
;; Defined at:
;;		line 374 in file "D:\develop\AK7030-good\AK7030-OTP\common.c"
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
psect	text1406
	file	"D:\develop\AK7030-good\AK7030-OTP\common.c"
	line	374
	global	__size_ofi1_setAD_ConvertFlag
	__size_ofi1_setAD_ConvertFlag	equ	__end_ofi1_setAD_ConvertFlag-i1_setAD_ConvertFlag
	
i1_setAD_ConvertFlag:	
	opt	stack 4
; Regs used in i1_setAD_ConvertFlag: [wreg]
;i1setAD_ConvertFlag@flag stored from wreg
	movwf	(i1setAD_ConvertFlag@flag)
	line	375
	
i1l3771:	
;common.c: 375: adc_convert_flag = flag;
	movf	(i1setAD_ConvertFlag@flag),w
	movwf	(_adc_convert_flag)
	line	376
	
i1l1584:	
	return
	opt stack 0
GLOBAL	__end_ofi1_setAD_ConvertFlag
	__end_ofi1_setAD_ConvertFlag:
;; =============== function i1_setAD_ConvertFlag ends ============

	signat	i1_setAD_ConvertFlag,88
	global	_adc_get
psect	text1407,local,class=CODE,delta=2
global __ptext1407
__ptext1407:

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
psect	text1407
	file	"D:\develop\AK7030-good\AK7030-OTP\periph.c"
	line	106
	global	__size_of_adc_get
	__size_of_adc_get	equ	__end_of_adc_get-_adc_get
	
_adc_get:	
	opt	stack 4
; Regs used in _adc_get: [wreg]
	line	108
	
i1l3767:	
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
	
i1l2336:	
	return
	opt stack 0
GLOBAL	__end_of_adc_get
	__end_of_adc_get:
;; =============== function _adc_get ends ============

	signat	_adc_get,90
	global	_Filter
psect	text1408,local,class=CODE,delta=2
global __ptext1408
__ptext1408:

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
psect	text1408
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
	
i1l3579:	
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
	
i1l3585:	
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
	
i1l3587:	
	incf	(Filter@tmpValue),f
	incf	(Filter@tmpValue),f
	line	125
	
i1l3589:	
	incf	(Filter@cir),f
	skipnz
	incf	(Filter@cir+1),f
	
i1l3591:	
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
	goto	i1l3585
u113_20:
	line	130
	
i1l3593:	
;common.c: 130: for(j = 0; j < 3 - 1; j++)
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	clrf	(Filter@j)
	line	132
	
i1l3599:	
;common.c: 131: {
;common.c: 132: for(i = 0; i < 3 - 1 - j; i++)
	clrf	(Filter@i)
	goto	i1l3607
	line	134
	
i1l3601:	
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
	goto	i1l3605
u114_20:
	line	137
	
i1l3603:	
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
	
i1l3605:	
	incf	(Filter@i),f
	
i1l3607:	
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
	goto	i1l3601
u115_20:
	line	130
	
i1l3609:	
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	incf	(Filter@j),f
	
i1l3611:	
	movlw	(02h)
	subwf	(Filter@j),w
	skipc
	goto	u116_21
	goto	u116_20
u116_21:
	goto	i1l3599
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
	
i1l3617:	
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
	
i1l3619:	
	incf	(Filter@i),f
	
i1l3621:	
	movlw	(02h)
	subwf	(Filter@i),w
	skipc
	goto	u117_21
	goto	u117_20
u117_21:
	goto	i1l3617
u117_20:
	line	152
	
i1l3623:	
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
psect	text1409,local,class=CODE,delta=2
global __ptext1409
__ptext1409:

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
psect	text1409
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
	
i1l3529:	
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
psect	text1410,local,class=CODE,delta=2
global __ptext1410
__ptext1410:

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
psect	text1410
	file	"D:\develop\AK7030-good\AK7030-OTP\common.c"
	line	60
	global	__size_of_getWaitResetFlag
	__size_of_getWaitResetFlag	equ	__end_of_getWaitResetFlag-_getWaitResetFlag
	
_getWaitResetFlag:	
	opt	stack 3
; Regs used in _getWaitResetFlag: [wreg]
	line	61
	
i1l3525:	
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
psect	text1411,local,class=CODE,delta=2
global __ptext1411
__ptext1411:
	global	btemp
	btemp set 07Eh

	DABS	1,126,2	;btemp
	global	wtemp0
	wtemp0 set btemp
	end
