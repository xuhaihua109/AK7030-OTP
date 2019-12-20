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
	FNCALL	_main,_op1_init
	FNCALL	_main,_uid_get
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
	global	_ad_offset
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
	global	main@cTimerP5s_795
	global	main@cTimerP5s_801
	global	main@ucStep
	global	main@ucTimerP3s
	global	main@ucTimerP5s
	global	_uiSampleCh12
	global	_uiSampleCh13
	global	_uiSampleChannelFourteenth
	global	_key
_key	set	480
	DABS	1,480,16	;_key

	global	_ADCON0
_ADCON0	set	31
	global	_ADRESH
_ADRESH	set	30
	global	_CCP1CON
_CCP1CON	set	23
	global	_CCPR1L
_CCPR1L	set	21
	global	_OP1CON0
_OP1CON0	set	27
	global	_OP1CON1
_OP1CON1	set	28
	global	_OP1CON2
_OP1CON2	set	29
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
	global	_SRAM_MAP
_SRAM_MAP	set	3192
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
_ad_offset:
       ds      2

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

main@cTimerP5s_795:
       ds      1

main@cTimerP5s_801:
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
	movlw	low((__pbssBANK0)+022h)
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
	global	??_op1_init
??_op1_init:	; 0 bytes @ 0x0
	global	??_uid_get
??_uid_get:	; 0 bytes @ 0x0
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
	global	?_op1_init
?_op1_init:	; 0 bytes @ 0x0
	global	?_uid_get
?_uid_get:	; 0 bytes @ 0x0
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
;;Data sizes: Strings 0, constant 0, data 2, bss 64, persistent 0 stack 0
;;Auto spaces:   Size  Autos    Used
;; COMMON          14     13      14
;; BANK0           80     35      71
;; BANK1           80     28      57
;; BANK3           80      0       0
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
;;                           _op1_init
;;                            _uid_get
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
;; (1) _uid_get                                              0     0      0       0
;; ---------------------------------------------------------------------------------
;; (1) _op1_init                                             0     0      0       0
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
;; (3) _ISR                                                  4     4      0    1108
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
;; (4) _adc_get                                              4     2      2      25
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
;;   _op1_init
;;   _uid_get
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
;;BANK3               50      0       0      10        0.0%
;;BITBANK3            50      0       0       9        0.0%
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
;;DATA                 0      0      96       6        0.0%
;;ABS                  0      0      8E       3        0.0%
;;NULL                 0      0       0       0        0.0%
;;STACK                0      0       8       2        0.0%
;;BANK0               50     23      47       5       88.8%
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
;;                  2  738[COMMON] int 
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
;;		_op1_init
;;		_uid_get
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
	
l4298:	
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
	
l4300:	
;main.c: 559: selectAdChannel();
	fcall	_selectAdChannel
	line	561
	
l4302:	
;main.c: 561: clock_config();
	fcall	_clock_config
	line	562
	
l4304:	
;main.c: 562: timer1_config();
	fcall	_timer1_config
	line	563
	
l4306:	
;main.c: 563: timer1_interrupt_config();
	fcall	_timer1_interrupt_config
	line	564
;main.c: 564: op1_init();
	fcall	_op1_init
	line	566
;main.c: 566: uid_get();
	fcall	_uid_get
	line	568
;main.c: 568: adc_test_init(2,0);
	bcf	status, 6	;RP1=0, select bank1
	clrf	(?_adc_test_init)^080h
	movlw	(02h)
	fcall	_adc_test_init
	line	574
;main.c: 574: startTwentyMinTimer( 1200 );
	movlw	low(04B0h)
	movwf	(?_startTwentyMinTimer)^080h
	movlw	high(04B0h)
	movwf	((?_startTwentyMinTimer)^080h)+1
	fcall	_startTwentyMinTimer
	line	575
	
l4308:	
;main.c: 575: _delay(1000);
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

	line	576
;main.c: 576: adc_start();
	fcall	_adc_start
	line	587
	
l4310:	
# 587 "D:\develop\AK7030-good\AK7030-OTP\main.c"
 clrwdt ;#
psect	maintext
	line	589
	
l4312:	
;main.c: 589: process_AD_Converter_Value();
	fcall	_process_AD_Converter_Value
	line	591
	
l4314:	
;main.c: 591: if( isPermitSampleTime() )
	fcall	_isPermitSampleTime
	xorlw	0
	skipnz
	goto	u2011
	goto	u2010
u2011:
	goto	l4310
u2010:
	line	595
	
l4316:	
;main.c: 592: {
;main.c: 595: clrSampeTime();
	fcall	_clrSampeTime
	line	610
;main.c: 610: switch(ucStep)
	goto	l4462
	line	621
	
l4318:	
;main.c: 614: {
;main.c: 619: static unsigned char ucTimerP3s = 0;
;main.c: 621: if( isFinishedTwentyMinTimer() )
	fcall	_isFinishedTwentyMinTimer
	xorlw	0
	skipnz
	goto	u2021
	goto	u2020
u2021:
	goto	l4324
u2020:
	line	623
	
l4320:	
;main.c: 622: {
;main.c: 623: ucStep = READY_FOR_RESET_STEP;
	movlw	(063h)
	bsf	status, 5	;RP0=1, select bank1
	movwf	(main@ucStep)^080h
	line	624
	
l4322:	
;main.c: 624: ucTimerP3s = 0;
	clrf	(main@ucTimerP3s)^080h
	line	625
;main.c: 625: }
	goto	l4310
	line	628
	
l4324:	
;main.c: 626: else
;main.c: 627: {
;main.c: 628: if( getAdOriginalCh13Value() > 145)
	fcall	_getAdOriginalCh13Value
	movlw	high(092h)
	subwf	(1+(?_getAdOriginalCh13Value))^080h,w
	movlw	low(092h)
	skipnz
	subwf	(0+(?_getAdOriginalCh13Value))^080h,w
	skipc
	goto	u2031
	goto	u2030
u2031:
	goto	l4328
u2030:
	line	630
	
l4326:	
;main.c: 629: {
;main.c: 630: ucTimerP3s++;
	incf	(main@ucTimerP3s)^080h,f
	line	631
;main.c: 631: }
	goto	l4330
	line	633
	
l4328:	
;main.c: 632: else
;main.c: 633: ucTimerP3s = 0;
	clrf	(main@ucTimerP3s)^080h
	line	635
	
l4330:	
;main.c: 635: if( ucTimerP3s >= 30)
	movlw	(01Eh)
	subwf	(main@ucTimerP3s)^080h,w
	skipc
	goto	u2041
	goto	u2040
u2041:
	goto	l742
u2040:
	line	637
	
l4332:	
;main.c: 636: {
;main.c: 637: ucTimerP3s = 0;
	clrf	(main@ucTimerP3s)^080h
	line	638
	
l4334:	
;main.c: 638: ucStep = START_UP_PWM_STEP;
	bsf	status, 5	;RP0=1, select bank1
	clrf	(main@ucStep)^080h
	incf	(main@ucStep)^080h,f
	goto	l4310
	line	654
	
l4336:	
;main.c: 649: {
;main.c: 654: pwm_start(150,249);
	movlw	(0F9h)
	movwf	(?_pwm_start)^080h
	movlw	(096h)
	fcall	_pwm_start
	line	656
;main.c: 656: setPB3(0);
	movlw	(0)
	fcall	_setPB3
	line	657
;main.c: 657: setPB4(1);
	movlw	(01h)
	fcall	_setPB4
	line	658
;main.c: 658: setPB5(0);
	movlw	(0)
	fcall	_setPB5
	line	659
	
l4338:	
;main.c: 659: clearTwentyMinTimer();
	fcall	_clearTwentyMinTimer
	line	660
	
l4340:	
;main.c: 660: startTwelveHourTimer( 36000);
	movlw	low(08CA0h)
	bsf	status, 5	;RP0=1, select bank1
	movwf	(?_startTwelveHourTimer)^080h
	movlw	high(08CA0h)
	movwf	((?_startTwelveHourTimer)^080h)+1
	fcall	_startTwelveHourTimer
	line	661
	
l4342:	
;main.c: 661: ucStep = CHECK_10_HOUR_TIMER_STEP;
	movlw	(02h)
	bsf	status, 5	;RP0=1, select bank1
	movwf	(main@ucStep)^080h
	line	662
;main.c: 662: break;
	goto	l4310
	line	673
	
l4344:	
;main.c: 666: {
;main.c: 671: static unsigned char ucTimerP5s = 0;
;main.c: 673: if( isFinishedTwelveHoursTimer () )
	fcall	_isFinishedTwelveHoursTimer
	xorlw	0
	skipnz
	goto	u2051
	goto	u2050
u2051:
	goto	l4348
u2050:
	line	674
	
l4346:	
;main.c: 674: ucStep = READY_FOR_RESET_STEP;
	movlw	(063h)
	bsf	status, 5	;RP0=1, select bank1
	movwf	(main@ucStep)^080h
	goto	l4310
	line	677
	
l4348:	
;main.c: 675: else
;main.c: 676: {
;main.c: 677: if( getAdOriginalCh13Value() < 322)
	fcall	_getAdOriginalCh13Value
	movlw	high(0142h)
	subwf	(1+(?_getAdOriginalCh13Value))^080h,w
	movlw	low(0142h)
	skipnz
	subwf	(0+(?_getAdOriginalCh13Value))^080h,w
	skipnc
	goto	u2061
	goto	u2060
u2061:
	goto	l4352
u2060:
	line	678
	
l4350:	
;main.c: 678: ucTimerP5s++;
	incf	(main@ucTimerP5s)^080h,f
	goto	l4354
	line	680
	
l4352:	
;main.c: 679: else
;main.c: 680: ucTimerP5s = 0;
	clrf	(main@ucTimerP5s)^080h
	line	682
	
l4354:	
;main.c: 682: if( ucTimerP5s >= 10)
	movlw	(0Ah)
	subwf	(main@ucTimerP5s)^080h,w
	skipc
	goto	u2071
	goto	u2070
u2071:
	goto	l742
u2070:
	line	684
	
l4356:	
;main.c: 683: {
;main.c: 684: ucTimerP5s = 0;
	clrf	(main@ucTimerP5s)^080h
	line	685
	
l4358:	
;main.c: 685: ucStep = STARTUP_3_HOUR_TIMER_STEP;
	movlw	(03h)
	movwf	(main@ucStep)^080h
	goto	l4310
	line	694
	
l4360:	
;main.c: 693: {
;main.c: 694: clearTwelveHoursTimer();
	fcall	_clearTwelveHoursTimer
	line	695
	
l4362:	
;main.c: 695: startThreeHoursTimer(10800);
	movlw	low(02A30h)
	bsf	status, 5	;RP0=1, select bank1
	movwf	(?_startThreeHoursTimer)^080h
	movlw	high(02A30h)
	movwf	((?_startThreeHoursTimer)^080h)+1
	fcall	_startThreeHoursTimer
	line	696
;main.c: 696: ucStep = CHECK_3_HOUR_TIMER_STEP;
	movlw	(04h)
	bsf	status, 5	;RP0=1, select bank1
	movwf	(main@ucStep)^080h
	line	697
;main.c: 697: break;
	goto	l4310
	line	704
	
l4364:	
;main.c: 701: {
;main.c: 702: static unsigned char ucTimerP5s = 0;
;main.c: 704: if( isFinishedThreeHoursTimer() )
	fcall	_isFinishedThreeHoursTimer
	xorlw	0
	skipnz
	goto	u2081
	goto	u2080
u2081:
	goto	l4368
u2080:
	goto	l4346
	line	708
	
l4368:	
;main.c: 706: else
;main.c: 707: {
;main.c: 708: if( getAdOriginalCh13Value() < 105)
	fcall	_getAdOriginalCh13Value
	movlw	high(069h)
	subwf	(1+(?_getAdOriginalCh13Value))^080h,w
	movlw	low(069h)
	skipnz
	subwf	(0+(?_getAdOriginalCh13Value))^080h,w
	skipnc
	goto	u2091
	goto	u2090
u2091:
	goto	l4372
u2090:
	line	709
	
l4370:	
;main.c: 709: ucTimerP5s++;
	incf	(main@cTimerP5s_795)^080h,f
	goto	l4374
	line	711
	
l4372:	
;main.c: 710: else
;main.c: 711: ucTimerP5s = 0;
	clrf	(main@cTimerP5s_795)^080h
	line	713
	
l4374:	
;main.c: 713: if( ucTimerP5s >= 10)
	movlw	(0Ah)
	subwf	(main@cTimerP5s_795)^080h,w
	skipc
	goto	u2101
	goto	u2100
u2101:
	goto	l742
u2100:
	line	715
	
l4376:	
;main.c: 714: {
;main.c: 715: ucTimerP5s = 0;
	clrf	(main@cTimerP5s_795)^080h
	line	716
	
l4378:	
;main.c: 716: ucStep = STARTUP_1_HOUR_TIMER_STEP;
	movlw	(05h)
	movwf	(main@ucStep)^080h
	goto	l4310
	line	724
	
l4380:	
;main.c: 723: {
;main.c: 724: clearThreeHoursTimer();
	fcall	_clearThreeHoursTimer
	line	725
	
l4382:	
;main.c: 725: startOneHoursTimer( 3600 );
	movlw	low(0E10h)
	bsf	status, 5	;RP0=1, select bank1
	movwf	(?_startOneHoursTimer)^080h
	movlw	high(0E10h)
	movwf	((?_startOneHoursTimer)^080h)+1
	fcall	_startOneHoursTimer
	line	726
	
l4384:	
;main.c: 726: setPB3(1);
	movlw	(01h)
	fcall	_setPB3
	line	727
	
l4386:	
;main.c: 727: setPB4(0);
	movlw	(0)
	fcall	_setPB4
	line	728
	
l4388:	
;main.c: 728: setPB5(1);
	movlw	(01h)
	fcall	_setPB5
	line	729
	
l4390:	
;main.c: 729: ucStep = CHECK_1_HOUR_TIMER_STEP;
	movlw	(06h)
	bsf	status, 5	;RP0=1, select bank1
	movwf	(main@ucStep)^080h
	line	730
;main.c: 730: break;
	goto	l4310
	line	743
	
l4392:	
;main.c: 734: {
;main.c: 739: static unsigned int uiTimerOneP5s = 0;
;main.c: 740: static unsigned int uiTimerTwoP5s = 0;
;main.c: 741: static unsigned int uiTimerThreeP5s = 0;
;main.c: 743: unsigned int uiCh13Value = getAdOriginalCh13Value();
	fcall	_getAdOriginalCh13Value
	movf	(1+(?_getAdOriginalCh13Value))^080h,w
	movwf	(main@uiCh13Value+1)^080h
	movf	(0+(?_getAdOriginalCh13Value))^080h,w
	movwf	(main@uiCh13Value)^080h
	line	746
	
l4394:	
;main.c: 746: if( isFinishedOneHoursTimer() )
	fcall	_isFinishedOneHoursTimer
	xorlw	0
	skipnz
	goto	u2111
	goto	u2110
u2111:
	goto	l4398
u2110:
	goto	l4346
	line	750
	
l4398:	
;main.c: 748: else
;main.c: 749: {
;main.c: 750: if( uiCh13Value > 105)
	movlw	high(06Ah)
	bsf	status, 5	;RP0=1, select bank1
	subwf	(main@uiCh13Value+1)^080h,w
	movlw	low(06Ah)
	skipnz
	subwf	(main@uiCh13Value)^080h,w
	skipc
	goto	u2121
	goto	u2120
u2121:
	goto	l4406
u2120:
	line	752
	
l4400:	
;main.c: 751: {
;main.c: 752: if( uiTimerOneP5s <= 10 )
	movlw	high(0Bh)
	subwf	(main@uiTimerOneP5s+1)^080h,w
	movlw	low(0Bh)
	skipnz
	subwf	(main@uiTimerOneP5s)^080h,w
	skipnc
	goto	u2131
	goto	u2130
u2131:
	goto	l4404
u2130:
	line	753
	
l4402:	
;main.c: 753: uiTimerOneP5s++;
	incf	(main@uiTimerOneP5s)^080h,f
	skipnz
	incf	(main@uiTimerOneP5s+1)^080h,f
	line	754
	
l4404:	
;main.c: 755: uiTimerThreeP5s = 0;
	clrf	(main@uiTimerTwoP5s)^080h
	clrf	(main@uiTimerTwoP5s+1)^080h
	line	756
;main.c: 756: }
	goto	l4408
	line	759
	
l4406:	
;main.c: 757: else
;main.c: 758: {
;main.c: 759: uiTimerOneP5s = 0;
	clrf	(main@uiTimerOneP5s)^080h
	clrf	(main@uiTimerOneP5s+1)^080h
	line	763
	
l4408:	
;main.c: 760: }
;main.c: 763: if(uiTimerOneP5s > 10)
	movlw	high(0Bh)
	subwf	(main@uiTimerOneP5s+1)^080h,w
	movlw	low(0Bh)
	skipnz
	subwf	(main@uiTimerOneP5s)^080h,w
	skipc
	goto	u2141
	goto	u2140
u2141:
	goto	l4420
u2140:
	line	765
	
l4410:	
;main.c: 764: {
;main.c: 765: setPB3(0);
	movlw	(0)
	fcall	_setPB3
	line	766
;main.c: 766: setPB4(1);
	movlw	(01h)
	fcall	_setPB4
	line	767
;main.c: 767: setPB5(0);
	movlw	(0)
	fcall	_setPB5
	line	769
	
l4412:	
;main.c: 769: uiTimerOneP5s = 0;
	bsf	status, 5	;RP0=1, select bank1
	clrf	(main@uiTimerOneP5s)^080h
	clrf	(main@uiTimerOneP5s+1)^080h
	line	770
	
l4414:	
;main.c: 770: uiTimerTwoP5s = 0;
	clrf	(main@uiTimerTwoP5s)^080h
	clrf	(main@uiTimerTwoP5s+1)^080h
	line	772
	
l4416:	
;main.c: 772: resetAllTimer();
	fcall	_resetAllTimer
	goto	l4334
	line	778
	
l4420:	
;main.c: 776: else
;main.c: 777: {
;main.c: 778: if( uiCh13Value < 105)
	movlw	high(069h)
	subwf	(main@uiCh13Value+1)^080h,w
	movlw	low(069h)
	skipnz
	subwf	(main@uiCh13Value)^080h,w
	skipnc
	goto	u2151
	goto	u2150
u2151:
	goto	l4426
u2150:
	line	781
	
l4422:	
;main.c: 779: {
;main.c: 781: if( uiTimerTwoP5s <= 10)
	movlw	high(0Bh)
	subwf	(main@uiTimerTwoP5s+1)^080h,w
	movlw	low(0Bh)
	skipnz
	subwf	(main@uiTimerTwoP5s)^080h,w
	skipnc
	goto	u2161
	goto	u2160
u2161:
	goto	l4428
u2160:
	line	782
	
l4424:	
;main.c: 782: uiTimerTwoP5s++;
	incf	(main@uiTimerTwoP5s)^080h,f
	skipnz
	incf	(main@uiTimerTwoP5s+1)^080h,f
	goto	l4428
	line	786
	
l4426:	
;main.c: 787: uiTimerThreeP5s = 0;
	clrf	(main@uiTimerTwoP5s)^080h
	clrf	(main@uiTimerTwoP5s+1)^080h
	line	790
	
l4428:	
;main.c: 788: }
;main.c: 790: if(uiTimerTwoP5s > 10)
	movlw	high(0Bh)
	subwf	(main@uiTimerTwoP5s+1)^080h,w
	movlw	low(0Bh)
	skipnz
	subwf	(main@uiTimerTwoP5s)^080h,w
	skipc
	goto	u2171
	goto	u2170
u2171:
	goto	l742
u2170:
	line	792
	
l4430:	
;main.c: 791: {
;main.c: 792: setPB3(1);
	movlw	(01h)
	fcall	_setPB3
	line	793
;main.c: 793: setPB4(0);
	movlw	(0)
	fcall	_setPB4
	line	794
;main.c: 794: setPB5(1);
	movlw	(01h)
	fcall	_setPB5
	goto	l4310
	line	814
	
l4432:	
;main.c: 813: {
;main.c: 814: setPB3(0);
	movlw	(0)
	fcall	_setPB3
	line	815
;main.c: 815: setPB4(0);
	movlw	(0)
	fcall	_setPB4
	line	816
;main.c: 816: setPB5(1);
	movlw	(01h)
	fcall	_setPB5
	line	819
;main.c: 819: setWaitResetFlag(1);
	movlw	(01h)
	fcall	_setWaitResetFlag
	line	820
;main.c: 820: pwm_start(150,249);
	movlw	(0F9h)
	bsf	status, 5	;RP0=1, select bank1
	movwf	(?_pwm_start)^080h
	movlw	(096h)
	fcall	_pwm_start
	line	826
	
l4434:	
;main.c: 826: ucStep = DELAY_ONE_SECOND_FOR_PWM;
	movlw	(064h)
	bsf	status, 5	;RP0=1, select bank1
	movwf	(main@ucStep)^080h
	line	827
;main.c: 827: break;
	goto	l4310
	line	833
	
l4436:	
;main.c: 831: {
;main.c: 832: static unsigned ucDelay1s = 0;
;main.c: 833: if(ucDelay1s <= 50)
	movlw	high(033h)
	subwf	(main@ucDelay1s+1)^080h,w
	movlw	low(033h)
	skipnz
	subwf	(main@ucDelay1s)^080h,w
	skipnc
	goto	u2181
	goto	u2180
u2181:
	goto	l4440
u2180:
	line	834
	
l4438:	
;main.c: 834: ucDelay1s++;
	incf	(main@ucDelay1s)^080h,f
	skipnz
	incf	(main@ucDelay1s+1)^080h,f
	goto	l4310
	line	837
	
l4440:	
;main.c: 835: else
;main.c: 836: {
;main.c: 837: ucDelay1s = 0;
	clrf	(main@ucDelay1s)^080h
	clrf	(main@ucDelay1s+1)^080h
	line	838
	
l4442:	
;main.c: 838: ucStep = MEET_RESET_CONDITION_STEP;
	movlw	(065h)
	movwf	(main@ucStep)^080h
	goto	l4310
	line	850
	
l4444:	
;main.c: 848: {
;main.c: 849: static unsigned char ucTimerP5s = 0;
;main.c: 850: unsigned int ucChValue = getAdOriginalCh13Value();
	fcall	_getAdOriginalCh13Value
	movf	(1+(?_getAdOriginalCh13Value))^080h,w
	movwf	(main@ucChValue+1)^080h
	movf	(0+(?_getAdOriginalCh13Value))^080h,w
	movwf	(main@ucChValue)^080h
	line	852
	
l4446:	
;main.c: 852: if( ucChValue > 81)
	movlw	high(052h)
	subwf	(main@ucChValue+1)^080h,w
	movlw	low(052h)
	skipnz
	subwf	(main@ucChValue)^080h,w
	skipc
	goto	u2191
	goto	u2190
u2191:
	goto	l4450
u2190:
	line	853
	
l4448:	
;main.c: 853: ucTimerP5s++;
	incf	(main@cTimerP5s_801)^080h,f
	goto	l4452
	line	855
	
l4450:	
;main.c: 854: else
;main.c: 855: ucTimerP5s = 0;
	clrf	(main@cTimerP5s_801)^080h
	line	857
	
l4452:	
;main.c: 857: if(ucTimerP5s >= 50)
	movlw	(032h)
	subwf	(main@cTimerP5s_801)^080h,w
	skipc
	goto	u2201
	goto	u2200
u2201:
	goto	l742
u2200:
	line	858
	
l4454:	
;main.c: 858: ucStep = RESET_STEP;
	movlw	(066h)
	movwf	(main@ucStep)^080h
	goto	l4310
	line	864
	
l4456:	
;main.c: 863: {
;main.c: 864: ucStep = INIT_STEP;
	clrf	(main@ucStep)^080h
	line	865
	
l4458:	
;main.c: 865: reset();
	fcall	_reset
	line	866
;main.c: 866: break;
	goto	l4310
	line	610
	
l4462:	
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
	goto	l4318
	xorlw	1^0	; case 1
	skipnz
	goto	l4336
	xorlw	2^1	; case 2
	skipnz
	goto	l4344
	xorlw	3^2	; case 3
	skipnz
	goto	l4360
	xorlw	4^3	; case 4
	skipnz
	goto	l4364
	xorlw	5^4	; case 5
	skipnz
	goto	l4380
	xorlw	6^5	; case 6
	skipnz
	goto	l4392
	xorlw	99^6	; case 99
	skipnz
	goto	l4432
	xorlw	100^99	; case 100
	skipnz
	goto	l4436
	xorlw	101^100	; case 101
	skipnz
	goto	l4444
	xorlw	102^101	; case 102
	skipnz
	goto	l4456
	goto	l742
	opt asmopt_on

	line	874
	
l742:	
	goto	l4310
	global	start
	ljmp	start
	opt stack 0
psect	maintext
	line	877
GLOBAL	__end_of_main
	__end_of_main:
;; =============== function _main ends ============

	signat	_main,90
	global	_getAdOriginalCh13Value
psect	text1427,local,class=CODE,delta=2
global __ptext1427
__ptext1427:

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
psect	text1427
	file	"D:\develop\AK7030-good\AK7030-OTP\common.c"
	line	397
	global	__size_of_getAdOriginalCh13Value
	__size_of_getAdOriginalCh13Value	equ	__end_of_getAdOriginalCh13Value-_getAdOriginalCh13Value
	
_getAdOriginalCh13Value:	
	opt	stack 3
; Regs used in _getAdOriginalCh13Value: [wreg-fsr0h+status,2+status,0+btemp+1+pclath+cstack]
	line	399
	
l4294:	
;common.c: 399: return FilterCh13(uiSampleCh13);
	movlw	(_uiSampleCh13)&0ffh
	fcall	_FilterCh13
	movf	(1+(?_FilterCh13))^080h,w
	movwf	(?_getAdOriginalCh13Value+1)^080h
	movf	(0+(?_FilterCh13))^080h,w
	movwf	(?_getAdOriginalCh13Value)^080h
	line	404
	
l1598:	
	return
	opt stack 0
GLOBAL	__end_of_getAdOriginalCh13Value
	__end_of_getAdOriginalCh13Value:
;; =============== function _getAdOriginalCh13Value ends ============

	signat	_getAdOriginalCh13Value,90
	global	_process_AD_Converter_Value
psect	text1428,local,class=CODE,delta=2
global __ptext1428
__ptext1428:

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
psect	text1428
	file	"D:\develop\AK7030-good\AK7030-OTP\common.c"
	line	419
	global	__size_of_process_AD_Converter_Value
	__size_of_process_AD_Converter_Value	equ	__end_of_process_AD_Converter_Value-_process_AD_Converter_Value
	
_process_AD_Converter_Value:	
	opt	stack 3
; Regs used in _process_AD_Converter_Value: [wreg+status,2+status,0+pclath+cstack]
	line	420
	
l4282:	
;common.c: 420: if(getAD_ConvertFlag())
	fcall	_getAD_ConvertFlag
	xorlw	0
	skipnz
	goto	u1991
	goto	u1990
u1991:
	goto	l1607
u1990:
	line	422
	
l4284:	
;common.c: 421: {
;common.c: 422: setAD_ConvertFlag(0);
	movlw	(0)
	fcall	_setAD_ConvertFlag
	line	423
;common.c: 423: AD_Sample();
	fcall	_AD_Sample
	line	424
	
l4286:	
;common.c: 424: if(2 == sampleChannelSelect)
	movf	(_sampleChannelSelect),w
	xorlw	02h
	skipz
	goto	u2001
	goto	u2000
u2001:
	goto	l4290
u2000:
	line	425
	
l4288:	
;common.c: 425: adc_test_init(2,3);
	movlw	(03h)
	bsf	status, 5	;RP0=1, select bank1
	movwf	(?_adc_test_init)^080h
	movlw	(02h)
	fcall	_adc_test_init
	goto	l4292
	line	427
	
l4290:	
;common.c: 426: else
;common.c: 427: adc_test_init(1,3);
	movlw	(03h)
	bsf	status, 5	;RP0=1, select bank1
	movwf	(?_adc_test_init)^080h
	movlw	(01h)
	fcall	_adc_test_init
	line	428
	
l4292:	
;common.c: 428: adc_start();
	fcall	_adc_start
	line	430
	
l1607:	
	return
	opt stack 0
GLOBAL	__end_of_process_AD_Converter_Value
	__end_of_process_AD_Converter_Value:
;; =============== function _process_AD_Converter_Value ends ============

	signat	_process_AD_Converter_Value,88
	global	_resetAllTimer
psect	text1429,local,class=CODE,delta=2
global __ptext1429
__ptext1429:

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
psect	text1429
	file	"D:\develop\AK7030-good\AK7030-OTP\main.c"
	line	494
	global	__size_of_resetAllTimer
	__size_of_resetAllTimer	equ	__end_of_resetAllTimer-_resetAllTimer
	
_resetAllTimer:	
	opt	stack 3
; Regs used in _resetAllTimer: [status,2+status,0+pclath+cstack]
	line	495
	
l4280:	
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
	
l736:	
	return
	opt stack 0
GLOBAL	__end_of_resetAllTimer
	__end_of_resetAllTimer:
;; =============== function _resetAllTimer ends ============

	signat	_resetAllTimer,88
	global	_setPinInitVaule
psect	text1430,local,class=CODE,delta=2
global __ptext1430
__ptext1430:

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
psect	text1430
	file	"D:\develop\AK7030-good\AK7030-OTP\main.c"
	line	285
	global	__size_of_setPinInitVaule
	__size_of_setPinInitVaule	equ	__end_of_setPinInitVaule-_setPinInitVaule
	
_setPinInitVaule:	
	opt	stack 3
; Regs used in _setPinInitVaule: [wreg+status,2+status,0+pclath+cstack]
	line	287
	
l4278:	
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
	
l724:	
	return
	opt stack 0
GLOBAL	__end_of_setPinInitVaule
	__end_of_setPinInitVaule:
;; =============== function _setPinInitVaule ends ============

	signat	_setPinInitVaule,88
	global	_initPin
psect	text1431,local,class=CODE,delta=2
global __ptext1431
__ptext1431:

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
psect	text1431
	file	"D:\develop\AK7030-good\AK7030-OTP\main.c"
	line	269
	global	__size_of_initPin
	__size_of_initPin	equ	__end_of_initPin-_initPin
	
_initPin:	
	opt	stack 3
; Regs used in _initPin: [wreg+status,2+status,0+pclath+cstack]
	line	271
	
l4270:	
;main.c: 271: initPB2_AsHighResistence();
	fcall	_initPB2_AsHighResistence
	line	273
	
l4272:	
;main.c: 273: initPB3(0);
	movlw	(0)
	fcall	_initPB3
	line	275
	
l4274:	
;main.c: 275: initPB4(0);
	movlw	(0)
	fcall	_initPB4
	line	277
	
l4276:	
;main.c: 277: initPB5(0);
	movlw	(0)
	fcall	_initPB5
	line	282
	
l721:	
	return
	opt stack 0
GLOBAL	__end_of_initPin
	__end_of_initPin:
;; =============== function _initPin ends ============

	signat	_initPin,88
	global	_AD_Sample
psect	text1432,local,class=CODE,delta=2
global __ptext1432
__ptext1432:

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
psect	text1432
	file	"D:\develop\AK7030-good\AK7030-OTP\common.c"
	line	442
	global	__size_of_AD_Sample
	__size_of_AD_Sample	equ	__end_of_AD_Sample-_AD_Sample
	
_AD_Sample:	
	opt	stack 3
; Regs used in _AD_Sample: [wreg+status,2+status,0]
	line	443
	
l4256:	
;common.c: 443: if(sampleTimes < 3)
	movlw	(03h)
	subwf	(_sampleTimes),w
	skipnc
	goto	u1961
	goto	u1960
u1961:
	goto	l1614
u1960:
	line	445
	
l4258:	
;common.c: 444: {
;common.c: 445: sampleTimes++;
	incf	(_sampleTimes),f
	line	447
	
l4260:	
;common.c: 447: if(sampleTimes >= 3)
	movlw	(03h)
	subwf	(_sampleTimes),w
	skipc
	goto	u1971
	goto	u1970
u1971:
	goto	l1614
u1970:
	line	449
	
l4262:	
;common.c: 448: {
;common.c: 449: sampleTimes = 0;
	clrf	(_sampleTimes)
	line	451
	
l4264:	
;common.c: 451: if(sampleChannelSelect == 2)
	movf	(_sampleChannelSelect),w
	xorlw	02h
	skipz
	goto	u1981
	goto	u1980
u1981:
	goto	l4268
u1980:
	line	453
	
l4266:	
;common.c: 452: {
;common.c: 453: sampleChannelSelect = 1;
	clrf	(_sampleChannelSelect)
	incf	(_sampleChannelSelect),f
	line	454
;common.c: 454: }
	goto	l1614
	line	458
	
l4268:	
;common.c: 456: else
;common.c: 457: {
;common.c: 458: sampleChannelSelect = 2;
	movlw	(02h)
	movwf	(_sampleChannelSelect)
	line	462
	
l1614:	
	return
	opt stack 0
GLOBAL	__end_of_AD_Sample
	__end_of_AD_Sample:
;; =============== function _AD_Sample ends ============

	signat	_AD_Sample,88
	global	_setAD_ConvertFlag
psect	text1433,local,class=CODE,delta=2
global __ptext1433
__ptext1433:

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
psect	text1433
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
	
l4254:	
;common.c: 375: adc_convert_flag = flag;
	movf	(setAD_ConvertFlag@flag)^080h,w
	bcf	status, 5	;RP0=0, select bank0
	movwf	(_adc_convert_flag)
	line	376
	
l1592:	
	return
	opt stack 0
GLOBAL	__end_of_setAD_ConvertFlag
	__end_of_setAD_ConvertFlag:
;; =============== function _setAD_ConvertFlag ends ============

	signat	_setAD_ConvertFlag,4216
	global	_getAD_ConvertFlag
psect	text1434,local,class=CODE,delta=2
global __ptext1434
__ptext1434:

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
psect	text1434
	file	"D:\develop\AK7030-good\AK7030-OTP\common.c"
	line	368
	global	__size_of_getAD_ConvertFlag
	__size_of_getAD_ConvertFlag	equ	__end_of_getAD_ConvertFlag-_getAD_ConvertFlag
	
_getAD_ConvertFlag:	
	opt	stack 3
; Regs used in _getAD_ConvertFlag: [wreg]
	line	369
	
l4250:	
;common.c: 369: return adc_convert_flag;
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	movf	(_adc_convert_flag),w
	line	370
	
l1589:	
	return
	opt stack 0
GLOBAL	__end_of_getAD_ConvertFlag
	__end_of_getAD_ConvertFlag:
;; =============== function _getAD_ConvertFlag ends ============

	signat	_getAD_ConvertFlag,89
	global	_FilterCh13
psect	text1435,local,class=CODE,delta=2
global __ptext1435
__ptext1435:

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
psect	text1435
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
	
l4202:	
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
	
l4208:	
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
	
l4210:	
	incf	(FilterCh13@tmpValue)^080h,f
	incf	(FilterCh13@tmpValue)^080h,f
	line	83
	
l4212:	
	incf	(FilterCh13@cir)^080h,f
	skipnz
	incf	(FilterCh13@cir+1)^080h,f
	
l4214:	
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
	goto	l4208
u1910:
	line	88
	
l4216:	
;common.c: 88: for(j = 0; j < 3 - 1; j++)
	bsf	status, 5	;RP0=1, select bank1
	bcf	status, 6	;RP1=0, select bank1
	clrf	(FilterCh13@j)^080h
	line	90
	
l4222:	
;common.c: 89: {
;common.c: 90: for(i = 0; i < 3 - 1 - j; i++)
	clrf	(FilterCh13@i)^080h
	goto	l4230
	line	92
	
l4224:	
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
	goto	l4228
u1920:
	line	95
	
l4226:	
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
	
l4228:	
	incf	(FilterCh13@i)^080h,f
	
l4230:	
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
	goto	l4224
u1930:
	line	88
	
l4232:	
	bsf	status, 5	;RP0=1, select bank1
	bcf	status, 6	;RP1=0, select bank1
	incf	(FilterCh13@j)^080h,f
	
l4234:	
	movlw	(02h)
	subwf	(FilterCh13@j)^080h,w
	skipc
	goto	u1941
	goto	u1940
u1941:
	goto	l4222
u1940:
	
l1498:	
	line	104
;common.c: 100: }
;common.c: 101: }
;common.c: 102: }
;common.c: 104: for(i = 1; i < 3 - 1; i++)
	clrf	(FilterCh13@i)^080h
	incf	(FilterCh13@i)^080h,f
	line	106
	
l4240:	
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
	
l4242:	
	incf	(FilterCh13@i)^080h,f
	
l4244:	
	movlw	(02h)
	subwf	(FilterCh13@i)^080h,w
	skipc
	goto	u1951
	goto	u1950
u1951:
	goto	l4240
u1950:
	line	110
	
l4246:	
;common.c: 107: }
;common.c: 110: return (filter_sum >> 0 );
	movf	(FilterCh13@filter_sum+1)^080h,w
	movwf	(?_FilterCh13+1)^080h
	movf	(FilterCh13@filter_sum)^080h,w
	movwf	(?_FilterCh13)^080h
	line	111
	
l1505:	
	return
	opt stack 0
GLOBAL	__end_of_FilterCh13
	__end_of_FilterCh13:
;; =============== function _FilterCh13 ends ============

	signat	_FilterCh13,4218
	global	_setWaitResetFlag
psect	text1436,local,class=CODE,delta=2
global __ptext1436
__ptext1436:

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
psect	text1436
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
	
l4200:	
;common.c: 56: bWaitResetFlag = bValue;
	movf	(setWaitResetFlag@bValue)^080h,w
	bcf	status, 5	;RP0=0, select bank0
	movwf	(_bWaitResetFlag)
	line	57
	
l1483:	
	return
	opt stack 0
GLOBAL	__end_of_setWaitResetFlag
	__end_of_setWaitResetFlag:
;; =============== function _setWaitResetFlag ends ============

	signat	_setWaitResetFlag,4216
	global	_isFinishedOneHoursTimer
psect	text1437,local,class=CODE,delta=2
global __ptext1437
__ptext1437:

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
psect	text1437
	file	"D:\develop\AK7030-good\AK7030-OTP\common.c"
	line	608
	global	__size_of_isFinishedOneHoursTimer
	__size_of_isFinishedOneHoursTimer	equ	__end_of_isFinishedOneHoursTimer-_isFinishedOneHoursTimer
	
_isFinishedOneHoursTimer:	
	opt	stack 4
; Regs used in _isFinishedOneHoursTimer: [wreg+status,2+status,0]
	line	609
	
l4184:	
;common.c: 609: if((uiOneHourTimer == 0) && bOneHourTimerStartFlag)
	bcf	status, 5	;RP0=0, select bank0
	movf	((_uiOneHourTimer+1)),w
	iorwf	((_uiOneHourTimer)),w
	skipz
	goto	u1891
	goto	u1890
u1891:
	goto	l4196
u1890:
	
l4186:	
	movf	(_bOneHourTimerStartFlag),w
	skipz
	goto	u1900
	goto	l4196
u1900:
	line	611
	
l4188:	
;common.c: 610: {
;common.c: 611: bOneHourTimerStartFlag = 0;
	clrf	(_bOneHourTimerStartFlag)
	line	612
	
l4190:	
;common.c: 612: return 1;
	movlw	(01h)
	goto	l1664
	line	615
	
l4196:	
;common.c: 614: else
;common.c: 615: return 0;
	movlw	(0)
	line	616
	
l1664:	
	return
	opt stack 0
GLOBAL	__end_of_isFinishedOneHoursTimer
	__end_of_isFinishedOneHoursTimer:
;; =============== function _isFinishedOneHoursTimer ends ============

	signat	_isFinishedOneHoursTimer,89
	global	_startOneHoursTimer
psect	text1438,local,class=CODE,delta=2
global __ptext1438
__ptext1438:

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
psect	text1438
	file	"D:\develop\AK7030-good\AK7030-OTP\common.c"
	line	525
	global	__size_of_startOneHoursTimer
	__size_of_startOneHoursTimer	equ	__end_of_startOneHoursTimer-_startOneHoursTimer
	
_startOneHoursTimer:	
	opt	stack 4
; Regs used in _startOneHoursTimer: [wreg+status,2+status,0]
	line	526
	
l4176:	
;common.c: 526: if(( 0 == uiOneHourTimer ) && ( 0 == bOneHourTimerStartFlag ))
	bcf	status, 5	;RP0=0, select bank0
	movf	((_uiOneHourTimer+1)),w
	iorwf	((_uiOneHourTimer)),w
	skipz
	goto	u1871
	goto	u1870
u1871:
	goto	l1641
u1870:
	
l4178:	
	movf	(_bOneHourTimerStartFlag),f
	skipz
	goto	u1881
	goto	u1880
u1881:
	goto	l1641
u1880:
	line	528
	
l4180:	
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
	
l4182:	
;common.c: 529: bOneHourTimerStartFlag = 1;
	clrf	(_bOneHourTimerStartFlag)
	incf	(_bOneHourTimerStartFlag),f
	line	535
	
l1641:	
	return
	opt stack 0
GLOBAL	__end_of_startOneHoursTimer
	__end_of_startOneHoursTimer:
;; =============== function _startOneHoursTimer ends ============

	signat	_startOneHoursTimer,4216
	global	_isFinishedThreeHoursTimer
psect	text1439,local,class=CODE,delta=2
global __ptext1439
__ptext1439:

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
psect	text1439
	file	"D:\develop\AK7030-good\AK7030-OTP\common.c"
	line	595
	global	__size_of_isFinishedThreeHoursTimer
	__size_of_isFinishedThreeHoursTimer	equ	__end_of_isFinishedThreeHoursTimer-_isFinishedThreeHoursTimer
	
_isFinishedThreeHoursTimer:	
	opt	stack 4
; Regs used in _isFinishedThreeHoursTimer: [wreg+status,2+status,0]
	line	596
	
l4160:	
;common.c: 596: if((uiSmallTimer == 0) && bSmallTimerStartFlag)
	bcf	status, 5	;RP0=0, select bank0
	movf	((_uiSmallTimer+1)),w
	iorwf	((_uiSmallTimer)),w
	skipz
	goto	u1851
	goto	u1850
u1851:
	goto	l4172
u1850:
	
l4162:	
	movf	(_bSmallTimerStartFlag),w
	skipz
	goto	u1860
	goto	l4172
u1860:
	line	598
	
l4164:	
;common.c: 597: {
;common.c: 598: bSmallTimerStartFlag = 0;
	clrf	(_bSmallTimerStartFlag)
	line	599
	
l4166:	
;common.c: 599: return 1;
	movlw	(01h)
	goto	l1659
	line	602
	
l4172:	
;common.c: 601: else
;common.c: 602: return 0;
	movlw	(0)
	line	603
	
l1659:	
	return
	opt stack 0
GLOBAL	__end_of_isFinishedThreeHoursTimer
	__end_of_isFinishedThreeHoursTimer:
;; =============== function _isFinishedThreeHoursTimer ends ============

	signat	_isFinishedThreeHoursTimer,89
	global	_startThreeHoursTimer
psect	text1440,local,class=CODE,delta=2
global __ptext1440
__ptext1440:

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
psect	text1440
	file	"D:\develop\AK7030-good\AK7030-OTP\common.c"
	line	512
	global	__size_of_startThreeHoursTimer
	__size_of_startThreeHoursTimer	equ	__end_of_startThreeHoursTimer-_startThreeHoursTimer
	
_startThreeHoursTimer:	
	opt	stack 4
; Regs used in _startThreeHoursTimer: [wreg+status,2+status,0]
	line	513
	
l4152:	
;common.c: 513: if(( 0 == uiSmallTimer ) && ( 0 == bSmallTimerStartFlag ))
	bcf	status, 5	;RP0=0, select bank0
	movf	((_uiSmallTimer+1)),w
	iorwf	((_uiSmallTimer)),w
	skipz
	goto	u1831
	goto	u1830
u1831:
	goto	l1637
u1830:
	
l4154:	
	movf	(_bSmallTimerStartFlag),f
	skipz
	goto	u1841
	goto	u1840
u1841:
	goto	l1637
u1840:
	line	515
	
l4156:	
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
	
l4158:	
;common.c: 516: bSmallTimerStartFlag = 1;
	clrf	(_bSmallTimerStartFlag)
	incf	(_bSmallTimerStartFlag),f
	line	522
	
l1637:	
	return
	opt stack 0
GLOBAL	__end_of_startThreeHoursTimer
	__end_of_startThreeHoursTimer:
;; =============== function _startThreeHoursTimer ends ============

	signat	_startThreeHoursTimer,4216
	global	_isFinishedTwelveHoursTimer
psect	text1441,local,class=CODE,delta=2
global __ptext1441
__ptext1441:

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
psect	text1441
	file	"D:\develop\AK7030-good\AK7030-OTP\common.c"
	line	584
	global	__size_of_isFinishedTwelveHoursTimer
	__size_of_isFinishedTwelveHoursTimer	equ	__end_of_isFinishedTwelveHoursTimer-_isFinishedTwelveHoursTimer
	
_isFinishedTwelveHoursTimer:	
	opt	stack 4
; Regs used in _isFinishedTwelveHoursTimer: [wreg+status,2+status,0]
	line	585
	
l4136:	
;common.c: 585: if(( uiBigTimer == 0 ) && bBigTimerStartFlag )
	bcf	status, 5	;RP0=0, select bank0
	movf	((_uiBigTimer+1)),w
	iorwf	((_uiBigTimer)),w
	skipz
	goto	u1811
	goto	u1810
u1811:
	goto	l4148
u1810:
	
l4138:	
	movf	(_bBigTimerStartFlag),w
	skipz
	goto	u1820
	goto	l4148
u1820:
	line	587
	
l4140:	
;common.c: 586: {
;common.c: 587: bBigTimerStartFlag = 0;
	clrf	(_bBigTimerStartFlag)
	line	588
	
l4142:	
;common.c: 588: return 1;
	movlw	(01h)
	goto	l1654
	line	591
	
l4148:	
;common.c: 590: else
;common.c: 591: return 0;
	movlw	(0)
	line	592
	
l1654:	
	return
	opt stack 0
GLOBAL	__end_of_isFinishedTwelveHoursTimer
	__end_of_isFinishedTwelveHoursTimer:
;; =============== function _isFinishedTwelveHoursTimer ends ============

	signat	_isFinishedTwelveHoursTimer,89
	global	_startTwelveHourTimer
psect	text1442,local,class=CODE,delta=2
global __ptext1442
__ptext1442:

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
psect	text1442
	file	"D:\develop\AK7030-good\AK7030-OTP\common.c"
	line	471
	global	__size_of_startTwelveHourTimer
	__size_of_startTwelveHourTimer	equ	__end_of_startTwelveHourTimer-_startTwelveHourTimer
	
_startTwelveHourTimer:	
	opt	stack 4
; Regs used in _startTwelveHourTimer: [wreg+status,2+status,0]
	line	472
	
l4128:	
;common.c: 472: if((0 == uiBigTimer) && ( 0 == bBigTimerStartFlag))
	bcf	status, 5	;RP0=0, select bank0
	movf	((_uiBigTimer+1)),w
	iorwf	((_uiBigTimer)),w
	skipz
	goto	u1791
	goto	u1790
u1791:
	goto	l1621
u1790:
	
l4130:	
	movf	(_bBigTimerStartFlag),f
	skipz
	goto	u1801
	goto	u1800
u1801:
	goto	l1621
u1800:
	line	474
	
l4132:	
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
	
l4134:	
;common.c: 475: bBigTimerStartFlag = 1;
	clrf	(_bBigTimerStartFlag)
	incf	(_bBigTimerStartFlag),f
	line	482
	
l1621:	
	return
	opt stack 0
GLOBAL	__end_of_startTwelveHourTimer
	__end_of_startTwelveHourTimer:
;; =============== function _startTwelveHourTimer ends ============

	signat	_startTwelveHourTimer,4216
	global	_isFinishedTwentyMinTimer
psect	text1443,local,class=CODE,delta=2
global __ptext1443
__ptext1443:

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
psect	text1443
	file	"D:\develop\AK7030-good\AK7030-OTP\common.c"
	line	560
	global	__size_of_isFinishedTwentyMinTimer
	__size_of_isFinishedTwentyMinTimer	equ	__end_of_isFinishedTwentyMinTimer-_isFinishedTwentyMinTimer
	
_isFinishedTwentyMinTimer:	
	opt	stack 4
; Regs used in _isFinishedTwentyMinTimer: [wreg+status,2+status,0]
	line	561
	
l4112:	
;common.c: 561: if(( 0 == uiTwentyMinTimer ) && bTwentyMinStartFlag )
	bcf	status, 5	;RP0=0, select bank0
	movf	((_uiTwentyMinTimer+1)),w
	iorwf	((_uiTwentyMinTimer)),w
	skipz
	goto	u1771
	goto	u1770
u1771:
	goto	l4124
u1770:
	
l4114:	
	movf	(_bTwentyMinStartFlag),w
	skipz
	goto	u1780
	goto	l4124
u1780:
	line	563
	
l4116:	
;common.c: 562: {
;common.c: 563: bTwentyMinStartFlag = 0;
	clrf	(_bTwentyMinStartFlag)
	line	564
	
l4118:	
;common.c: 564: return 1;
	movlw	(01h)
	goto	l1649
	line	567
	
l4124:	
;common.c: 566: else
;common.c: 567: return 0;
	movlw	(0)
	line	568
	
l1649:	
	return
	opt stack 0
GLOBAL	__end_of_isFinishedTwentyMinTimer
	__end_of_isFinishedTwentyMinTimer:
;; =============== function _isFinishedTwentyMinTimer ends ============

	signat	_isFinishedTwentyMinTimer,89
	global	_clrSampeTime
psect	text1444,local,class=CODE,delta=2
global __ptext1444
__ptext1444:

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
psect	text1444
	file	"D:\develop\AK7030-good\AK7030-OTP\common.c"
	line	630
	global	__size_of_clrSampeTime
	__size_of_clrSampeTime	equ	__end_of_clrSampeTime-_clrSampeTime
	
_clrSampeTime:	
	opt	stack 4
; Regs used in _clrSampeTime: [status,2]
	line	631
	
l4110:	
;common.c: 631: timer.timer10msStopWatch = 0;
	clrf	(_timer)
	line	632
	
l1673:	
	return
	opt stack 0
GLOBAL	__end_of_clrSampeTime
	__end_of_clrSampeTime:
;; =============== function _clrSampeTime ends ============

	signat	_clrSampeTime,88
	global	_isPermitSampleTime
psect	text1445,local,class=CODE,delta=2
global __ptext1445
__ptext1445:

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
psect	text1445
	file	"D:\develop\AK7030-good\AK7030-OTP\common.c"
	line	620
	global	__size_of_isPermitSampleTime
	__size_of_isPermitSampleTime	equ	__end_of_isPermitSampleTime-_isPermitSampleTime
	
_isPermitSampleTime:	
	opt	stack 4
; Regs used in _isPermitSampleTime: [wreg]
	line	621
	
l4098:	
;common.c: 621: if(timer.timer10msStopWatch >= 1)
	movf	(_timer),w
	skipz
	goto	u1760
	goto	l4106
u1760:
	line	623
	
l4100:	
;common.c: 622: {
;common.c: 623: return 1;
	movlw	(01h)
	goto	l1669
	line	626
	
l4106:	
;common.c: 625: else
;common.c: 626: return 0;
	movlw	(0)
	line	627
	
l1669:	
	return
	opt stack 0
GLOBAL	__end_of_isPermitSampleTime
	__end_of_isPermitSampleTime:
;; =============== function _isPermitSampleTime ends ============

	signat	_isPermitSampleTime,89
	global	_adc_start
psect	text1446,local,class=CODE,delta=2
global __ptext1446
__ptext1446:

;; *************** function _adc_start *****************
;; Defined at:
;;		line 138 in file "D:\develop\AK7030-good\AK7030-OTP\periph.c"
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
psect	text1446
	file	"D:\develop\AK7030-good\AK7030-OTP\periph.c"
	line	138
	global	__size_of_adc_start
	__size_of_adc_start	equ	__end_of_adc_start-_adc_start
	
_adc_start:	
	opt	stack 3
; Regs used in _adc_start: []
	line	139
	
l4096:	
;periph.c: 139: GO=1;
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	bsf	(249/8),(249)&7
	line	140
	
l2352:	
	return
	opt stack 0
GLOBAL	__end_of_adc_start
	__end_of_adc_start:
;; =============== function _adc_start ends ============

	signat	_adc_start,88
	global	_startTwentyMinTimer
psect	text1447,local,class=CODE,delta=2
global __ptext1447
__ptext1447:

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
psect	text1447
	file	"D:\develop\AK7030-good\AK7030-OTP\common.c"
	line	550
	global	__size_of_startTwentyMinTimer
	__size_of_startTwentyMinTimer	equ	__end_of_startTwentyMinTimer-_startTwentyMinTimer
	
_startTwentyMinTimer:	
	opt	stack 4
; Regs used in _startTwentyMinTimer: [wreg+status,2+status,0]
	line	551
	
l4088:	
;common.c: 551: if(( 0 == uiTwentyMinTimer) && ( 0 == bTwentyMinStartFlag))
	bcf	status, 5	;RP0=0, select bank0
	movf	((_uiTwentyMinTimer+1)),w
	iorwf	((_uiTwentyMinTimer)),w
	skipz
	goto	u1741
	goto	u1740
u1741:
	goto	l1645
u1740:
	
l4090:	
	movf	(_bTwentyMinStartFlag),f
	skipz
	goto	u1751
	goto	u1750
u1751:
	goto	l1645
u1750:
	line	553
	
l4092:	
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
	
l4094:	
;common.c: 554: bTwentyMinStartFlag = 1;
	clrf	(_bTwentyMinStartFlag)
	incf	(_bTwentyMinStartFlag),f
	line	556
	
l1645:	
	return
	opt stack 0
GLOBAL	__end_of_startTwentyMinTimer
	__end_of_startTwentyMinTimer:
;; =============== function _startTwentyMinTimer ends ============

	signat	_startTwentyMinTimer,4216
	global	_adc_test_init
psect	text1448,local,class=CODE,delta=2
global __ptext1448
__ptext1448:

;; *************** function _adc_test_init *****************
;; Defined at:
;;		line 122 in file "D:\develop\AK7030-good\AK7030-OTP\periph.c"
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
psect	text1448
	file	"D:\develop\AK7030-good\AK7030-OTP\periph.c"
	line	122
	global	__size_of_adc_test_init
	__size_of_adc_test_init	equ	__end_of_adc_test_init-_adc_test_init
	
_adc_test_init:	
	opt	stack 3
; Regs used in _adc_test_init: [wreg+status,2+status,0]
;adc_test_init@channel stored from wreg
	movwf	(adc_test_init@channel)^080h
	line	123
	
l4078:	
;periph.c: 123: ADCON0 = 0x40;
	movlw	(040h)
	bcf	status, 5	;RP0=0, select bank0
	movwf	(31)	;volatile
	line	124
	
l4080:	
;periph.c: 124: ADCON0|=channel<<2;
	bsf	status, 5	;RP0=1, select bank1
	movf	(adc_test_init@channel)^080h,w
	movwf	(??_adc_test_init+0)^080h+0
	clrc
	rlf	(??_adc_test_init+0)^080h+0,f
	clrc
	rlf	(??_adc_test_init+0)^080h+0,w
	bcf	status, 5	;RP0=0, select bank0
	iorwf	(31),f	;volatile
	line	125
	
l4082:	
;periph.c: 125: ADCON1 = 0x35;
	movlw	(035h)
	bsf	status, 5	;RP0=1, select bank1
	movwf	(159)^080h	;volatile
	line	126
;periph.c: 126: ADCON1|=ref<<6;
	movf	(adc_test_init@ref)^080h,w
	movwf	(??_adc_test_init+0)^080h+0
	rrf	(??_adc_test_init+0)^080h+0,f
	rrf	(??_adc_test_init+0)^080h+0,f
	rrf	(??_adc_test_init+0)^080h+0,w
	andlw	0c0h
	iorwf	(159)^080h,f	;volatile
	line	127
	
l4084:	
;periph.c: 127: ADON=1;
	bcf	status, 5	;RP0=0, select bank0
	bsf	(248/8),(248)&7
	line	128
	
l4086:	
;periph.c: 128: ADIE=1;
	bsf	status, 5	;RP0=1, select bank1
	bsf	(1130/8)^080h,(1130)&7
	line	129
	
l2346:	
	return
	opt stack 0
GLOBAL	__end_of_adc_test_init
	__end_of_adc_test_init:
;; =============== function _adc_test_init ends ============

	signat	_adc_test_init,8312
	global	_uid_get
psect	text1449,local,class=CODE,delta=2
global __ptext1449
__ptext1449:

;; *************** function _uid_get *****************
;; Defined at:
;;		line 31 in file "D:\develop\AK7030-good\AK7030-OTP\periph.c"
;; Parameters:    Size  Location     Type
;;		None
;; Auto vars:     Size  Location     Type
;;		None
;; Return value:  Size  Location     Type
;;		None               void
;; Registers used:
;;		wreg, status,2
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
;;		_main
;; This function uses a non-reentrant model
;;
psect	text1449
	file	"D:\develop\AK7030-good\AK7030-OTP\periph.c"
	line	31
	global	__size_of_uid_get
	__size_of_uid_get	equ	__end_of_uid_get-_uid_get
	
_uid_get:	
	opt	stack 4
; Regs used in _uid_get: [wreg+status,2]
	line	33
	
l4070:	
;periph.c: 33: SRAM_MAP = 1;
	bsf	status, 5	;RP0=1, select bank3
	bsf	status, 6	;RP1=1, select bank3
	bsf	(3192/8)^0180h,(3192)&7
	line	35
	
l4072:	
;periph.c: 35: bgr_trim = key.u_1v2;
	movf	0+(480)^0180h+02h,w	;volatile
	movf	1+(480)^0180h+02h,w	;volatile
	line	36
;periph.c: 36: ad_offset = key.otp_uid&0xff;
	movf	1+(480)^0180h+06h,w	;volatile
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	movwf	(_ad_offset+1)	;volatile
	bsf	status, 5	;RP0=1, select bank3
	bsf	status, 6	;RP1=1, select bank3
	movf	0+(480)^0180h+06h,w	;volatile
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	movwf	(_ad_offset)	;volatile
	movlw	0FFh
	andwf	(_ad_offset),f
	clrf	(_ad_offset+1)
	line	38
	
l4074:	
;periph.c: 38: ad_offset = 0;
	clrf	(_ad_offset)
	clrf	(_ad_offset+1)
	line	40
	
l4076:	
;periph.c: 40: SRAM_MAP = 0;
	bsf	status, 5	;RP0=1, select bank3
	bsf	status, 6	;RP1=1, select bank3
	bcf	(3192/8)^0180h,(3192)&7
	line	42
	
l2329:	
	return
	opt stack 0
GLOBAL	__end_of_uid_get
	__end_of_uid_get:
;; =============== function _uid_get ends ============

	signat	_uid_get,88
	global	_op1_init
psect	text1450,local,class=CODE,delta=2
global __ptext1450
__ptext1450:

;; *************** function _op1_init *****************
;; Defined at:
;;		line 63 in file "D:\develop\AK7030-good\AK7030-OTP\periph.c"
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
;;		Nothing
;; This function is called by:
;;		_main
;; This function uses a non-reentrant model
;;
psect	text1450
	file	"D:\develop\AK7030-good\AK7030-OTP\periph.c"
	line	63
	global	__size_of_op1_init
	__size_of_op1_init	equ	__end_of_op1_init-_op1_init
	
_op1_init:	
	opt	stack 4
; Regs used in _op1_init: [wreg]
	line	70
	
l4068:	
;periph.c: 70: OP1CON1=0x13;
	movlw	(013h)
	bcf	status, 5	;RP0=0, select bank0
	movwf	(28)	;volatile
	line	71
;periph.c: 71: OP1CON2=0x10;
	movlw	(010h)
	movwf	(29)	;volatile
	line	72
;periph.c: 72: OP1CON0=0x90;
	movlw	(090h)
	movwf	(27)	;volatile
	line	78
	
l2335:	
	return
	opt stack 0
GLOBAL	__end_of_op1_init
	__end_of_op1_init:
;; =============== function _op1_init ends ============

	signat	_op1_init,88
	global	_timer1_interrupt_config
psect	text1451,local,class=CODE,delta=2
global __ptext1451
__ptext1451:

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
psect	text1451
	file	"D:\develop\AK7030-good\AK7030-OTP\common.c"
	line	360
	global	__size_of_timer1_interrupt_config
	__size_of_timer1_interrupt_config	equ	__end_of_timer1_interrupt_config-_timer1_interrupt_config
	
_timer1_interrupt_config:	
	opt	stack 4
; Regs used in _timer1_interrupt_config: []
	line	361
	
l4066:	
;common.c: 361: GIE = 1;
	bsf	(95/8),(95)&7
	line	362
;common.c: 362: PEIE = 1;
	bsf	(94/8),(94)&7
	line	363
	
l1586:	
	return
	opt stack 0
GLOBAL	__end_of_timer1_interrupt_config
	__end_of_timer1_interrupt_config:
;; =============== function _timer1_interrupt_config ends ============

	signat	_timer1_interrupt_config,88
	global	_timer1_config
psect	text1452,local,class=CODE,delta=2
global __ptext1452
__ptext1452:

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
psect	text1452
	file	"D:\develop\AK7030-good\AK7030-OTP\common.c"
	line	348
	global	__size_of_timer1_config
	__size_of_timer1_config	equ	__end_of_timer1_config-_timer1_config
	
_timer1_config:	
	opt	stack 4
; Regs used in _timer1_config: [wreg]
	line	350
	
l4062:	
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
	
l4064:	
;common.c: 353: TMR1IE=1;
	bsf	status, 5	;RP0=1, select bank1
	bsf	(1120/8)^080h,(1120)&7
	line	355
	
l1583:	
	return
	opt stack 0
GLOBAL	__end_of_timer1_config
	__end_of_timer1_config:
;; =============== function _timer1_config ends ============

	signat	_timer1_config,88
	global	_clock_config
psect	text1453,local,class=CODE,delta=2
global __ptext1453
__ptext1453:

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
psect	text1453
	file	"D:\develop\AK7030-good\AK7030-OTP\common.c"
	line	340
	global	__size_of_clock_config
	__size_of_clock_config	equ	__end_of_clock_config-_clock_config
	
_clock_config:	
	opt	stack 4
; Regs used in _clock_config: [wreg+status,2]
	line	342
	
l4058:	
;common.c: 342: CLKPR = 0x80;
	movlw	(080h)
	bcf	status, 5	;RP0=0, select bank2
	bsf	status, 6	;RP1=1, select bank2
	movwf	(264)^0100h	;volatile
	line	343
	
l4060:	
;common.c: 343: CLKPR = 0x00;
	clrf	(264)^0100h	;volatile
	line	344
;common.c: 344: while(CLKPCE);
	
l1577:	
	btfsc	(2119/8)^0100h,(2119)&7
	goto	u1731
	goto	u1730
u1731:
	goto	l1577
u1730:
	line	345
	
l1580:	
	return
	opt stack 0
GLOBAL	__end_of_clock_config
	__end_of_clock_config:
;; =============== function _clock_config ends ============

	signat	_clock_config,88
	global	_clearTwentyMinTimer
psect	text1454,local,class=CODE,delta=2
global __ptext1454
__ptext1454:

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
psect	text1454
	file	"D:\develop\AK7030-good\AK7030-OTP\common.c"
	line	505
	global	__size_of_clearTwentyMinTimer
	__size_of_clearTwentyMinTimer	equ	__end_of_clearTwentyMinTimer-_clearTwentyMinTimer
	
_clearTwentyMinTimer:	
	opt	stack 3
; Regs used in _clearTwentyMinTimer: [status,2]
	line	506
	
l4056:	
;common.c: 506: uiTwentyMinTimer = 0;
	clrf	(_uiTwentyMinTimer)
	clrf	(_uiTwentyMinTimer+1)
	line	507
;common.c: 507: bTwentyMinStartFlag = 0;
	clrf	(_bTwentyMinStartFlag)
	line	508
	
l1633:	
	return
	opt stack 0
GLOBAL	__end_of_clearTwentyMinTimer
	__end_of_clearTwentyMinTimer:
;; =============== function _clearTwentyMinTimer ends ============

	signat	_clearTwentyMinTimer,88
	global	_clearOneHoursTimer
psect	text1455,local,class=CODE,delta=2
global __ptext1455
__ptext1455:

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
psect	text1455
	file	"D:\develop\AK7030-good\AK7030-OTP\common.c"
	line	498
	global	__size_of_clearOneHoursTimer
	__size_of_clearOneHoursTimer	equ	__end_of_clearOneHoursTimer-_clearOneHoursTimer
	
_clearOneHoursTimer:	
	opt	stack 3
; Regs used in _clearOneHoursTimer: [status,2]
	line	499
	
l4054:	
;common.c: 499: uiOneHourTimer = 0;
	clrf	(_uiOneHourTimer)
	clrf	(_uiOneHourTimer+1)
	line	500
;common.c: 500: bOneHourTimerStartFlag = 0;
	clrf	(_bOneHourTimerStartFlag)
	line	501
	
l1630:	
	return
	opt stack 0
GLOBAL	__end_of_clearOneHoursTimer
	__end_of_clearOneHoursTimer:
;; =============== function _clearOneHoursTimer ends ============

	signat	_clearOneHoursTimer,88
	global	_clearThreeHoursTimer
psect	text1456,local,class=CODE,delta=2
global __ptext1456
__ptext1456:

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
psect	text1456
	file	"D:\develop\AK7030-good\AK7030-OTP\common.c"
	line	492
	global	__size_of_clearThreeHoursTimer
	__size_of_clearThreeHoursTimer	equ	__end_of_clearThreeHoursTimer-_clearThreeHoursTimer
	
_clearThreeHoursTimer:	
	opt	stack 3
; Regs used in _clearThreeHoursTimer: [status,2]
	line	493
	
l4052:	
;common.c: 493: uiSmallTimer = 0;
	bcf	status, 5	;RP0=0, select bank0
	clrf	(_uiSmallTimer)
	clrf	(_uiSmallTimer+1)
	line	494
;common.c: 494: bSmallTimerStartFlag = 0;
	clrf	(_bSmallTimerStartFlag)
	line	495
	
l1627:	
	return
	opt stack 0
GLOBAL	__end_of_clearThreeHoursTimer
	__end_of_clearThreeHoursTimer:
;; =============== function _clearThreeHoursTimer ends ============

	signat	_clearThreeHoursTimer,88
	global	_clearTwelveHoursTimer
psect	text1457,local,class=CODE,delta=2
global __ptext1457
__ptext1457:

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
psect	text1457
	file	"D:\develop\AK7030-good\AK7030-OTP\common.c"
	line	485
	global	__size_of_clearTwelveHoursTimer
	__size_of_clearTwelveHoursTimer	equ	__end_of_clearTwelveHoursTimer-_clearTwelveHoursTimer
	
_clearTwelveHoursTimer:	
	opt	stack 3
; Regs used in _clearTwelveHoursTimer: [status,2]
	line	486
	
l4050:	
;common.c: 486: uiBigTimer = 0;
	bcf	status, 5	;RP0=0, select bank0
	clrf	(_uiBigTimer)
	clrf	(_uiBigTimer+1)
	line	487
;common.c: 487: bBigTimerStartFlag = 0;
	clrf	(_bBigTimerStartFlag)
	line	488
	
l1624:	
	return
	opt stack 0
GLOBAL	__end_of_clearTwelveHoursTimer
	__end_of_clearTwelveHoursTimer:
;; =============== function _clearTwelveHoursTimer ends ============

	signat	_clearTwelveHoursTimer,88
	global	_reset
psect	text1458,local,class=CODE,delta=2
global __ptext1458
__ptext1458:

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
psect	text1458
	file	"D:\develop\AK7030-good\AK7030-OTP\main.c"
	line	307
	global	__size_of_reset
	__size_of_reset	equ	__end_of_reset-_reset
	
_reset:	
	opt	stack 4
; Regs used in _reset: []
	line	309
;main.c: 309: while(1);
	
l730:	
	goto	l730
	return
	opt stack 0
psect	text1459,local,class=CODE,delta=2
global __ptext1459
__ptext1459:
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
psect	text1459
	file	"D:\develop\AK7030-good\AK7030-OTP\main.c"
	line	296
	global	__size_of_selectAdChannel
	__size_of_selectAdChannel	equ	__end_of_selectAdChannel-_selectAdChannel
	
_selectAdChannel:	
	opt	stack 4
; Regs used in _selectAdChannel: []
	line	298
	
l4048:	
;main.c: 298: TRISB4 = 1;
	bsf	status, 5	;RP0=1, select bank1
	bsf	(1076/8)^080h,(1076)&7
	line	299
;main.c: 299: TRISB5 = 1;
	bsf	(1077/8)^080h,(1077)&7
	line	303
	
l727:	
	return
	opt stack 0
GLOBAL	__end_of_selectAdChannel
	__end_of_selectAdChannel:
;; =============== function _selectAdChannel ends ============

	signat	_selectAdChannel,88
	global	_pwm_start
psect	text1460,local,class=CODE,delta=2
global __ptext1460
__ptext1460:

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
psect	text1460
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
	
l4032:	
;main.c: 246: CCP1CON&= 0xf0;
	movlw	(0F0h)
	bcf	status, 5	;RP0=0, select bank0
	andwf	(23),f	;volatile
	line	248
	
l4034:	
;main.c: 248: T2CON=0x04;
	movlw	(04h)
	movwf	(18)	;volatile
	line	249
	
l4036:	
;main.c: 249: PR2 = ucPulseFrequency;
	bsf	status, 5	;RP0=1, select bank1
	movf	(pwm_start@ucPulseFrequency)^080h,w
	movwf	(146)^080h	;volatile
	line	250
	
l4038:	
;main.c: 250: CCPR1L = ucPulseWidth;
	movf	(pwm_start@ucPulseWidth)^080h,w
	bcf	status, 5	;RP0=0, select bank0
	movwf	(21)	;volatile
	line	251
	
l4040:	
;main.c: 251: CCP1CON=0x00;
	clrf	(23)	;volatile
	line	253
	
l4042:	
;main.c: 253: TRISB2=0;
	bsf	status, 5	;RP0=1, select bank1
	bcf	(1074/8)^080h,(1074)&7
	line	254
	
l4044:	
;main.c: 254: PBOD2 = 0;
	bsf	status, 6	;RP1=1, select bank3
	bcf	(3138/8)^0180h,(3138)&7
	line	256
	
l4046:	
;main.c: 256: CCP1CON|= 0x0c;
	movlw	(0Ch)
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	iorwf	(23),f	;volatile
	line	265
	
l718:	
	return
	opt stack 0
GLOBAL	__end_of_pwm_start
	__end_of_pwm_start:
;; =============== function _pwm_start ends ============

	signat	_pwm_start,8312
	global	_initPB2_AsHighResistence
psect	text1461,local,class=CODE,delta=2
global __ptext1461
__ptext1461:

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
psect	text1461
	file	"D:\develop\AK7030-good\AK7030-OTP\main.c"
	line	232
	global	__size_of_initPB2_AsHighResistence
	__size_of_initPB2_AsHighResistence	equ	__end_of_initPB2_AsHighResistence-_initPB2_AsHighResistence
	
_initPB2_AsHighResistence:	
	opt	stack 3
; Regs used in _initPB2_AsHighResistence: []
	line	234
	
l4030:	
;main.c: 234: PB2 = 1;
	bsf	(50/8),(50)&7
	line	235
;main.c: 235: PBOD2 = 1;
	bsf	status, 5	;RP0=1, select bank3
	bsf	status, 6	;RP1=1, select bank3
	bsf	(3138/8)^0180h,(3138)&7
	line	239
	
l715:	
	return
	opt stack 0
GLOBAL	__end_of_initPB2_AsHighResistence
	__end_of_initPB2_AsHighResistence:
;; =============== function _initPB2_AsHighResistence ends ============

	signat	_initPB2_AsHighResistence,88
	global	_setPB5
psect	text1462,local,class=CODE,delta=2
global __ptext1462
__ptext1462:

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
psect	text1462
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
	
l4026:	
;main.c: 213: if( bValue )
	movf	(setPB5@bValue)^080h,w
	skipz
	goto	u1720
	goto	l710
u1720:
	line	216
	
l4028:	
;main.c: 216: PB1 = 1;
	bcf	status, 5	;RP0=0, select bank0
	bsf	(49/8),(49)&7
	goto	l712
	line	221
	
l710:	
	line	224
;main.c: 221: else
;main.c: 224: PB1 = 0;
	bcf	status, 5	;RP0=0, select bank0
	bcf	(49/8),(49)&7
	line	228
	
l712:	
	return
	opt stack 0
GLOBAL	__end_of_setPB5
	__end_of_setPB5:
;; =============== function _setPB5 ends ============

	signat	_setPB5,4216
	global	_initPB5
psect	text1463,local,class=CODE,delta=2
global __ptext1463
__ptext1463:

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
psect	text1463
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
	
l4022:	
;main.c: 194: if( bValue )
	movf	(initPB5@bValue)^080h,w
	skipz
	goto	u1710
	goto	l705
u1710:
	line	197
	
l4024:	
;main.c: 197: TRISB1 = 1;
	bsf	(1073/8)^080h,(1073)&7
	goto	l707
	line	201
	
l705:	
	line	204
;main.c: 201: else
;main.c: 204: TRISB1= 0;
	bcf	(1073/8)^080h,(1073)&7
	line	208
	
l707:	
	return
	opt stack 0
GLOBAL	__end_of_initPB5
	__end_of_initPB5:
;; =============== function _initPB5 ends ============

	signat	_initPB5,4216
	global	_setPB4
psect	text1464,local,class=CODE,delta=2
global __ptext1464
__ptext1464:

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
psect	text1464
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
	
l4018:	
;main.c: 175: if( bValue )
	movf	(setPB4@bValue)^080h,w
	skipz
	goto	u1700
	goto	l700
u1700:
	line	178
	
l4020:	
;main.c: 178: PB3 = 1;
	bcf	status, 5	;RP0=0, select bank0
	bsf	(51/8),(51)&7
	goto	l702
	line	182
	
l700:	
	line	185
;main.c: 182: else
;main.c: 185: PB3 = 0;
	bcf	status, 5	;RP0=0, select bank0
	bcf	(51/8),(51)&7
	line	189
	
l702:	
	return
	opt stack 0
GLOBAL	__end_of_setPB4
	__end_of_setPB4:
;; =============== function _setPB4 ends ============

	signat	_setPB4,4216
	global	_initPB4
psect	text1465,local,class=CODE,delta=2
global __ptext1465
__ptext1465:

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
psect	text1465
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
	
l4014:	
;main.c: 156: if( bValue )
	movf	(initPB4@bValue)^080h,w
	skipz
	goto	u1690
	goto	l695
u1690:
	line	159
	
l4016:	
;main.c: 159: TRISB3 = 1;
	bsf	(1075/8)^080h,(1075)&7
	goto	l697
	line	163
	
l695:	
	line	166
;main.c: 163: else
;main.c: 166: TRISB3 = 0;
	bcf	(1075/8)^080h,(1075)&7
	line	170
	
l697:	
	return
	opt stack 0
GLOBAL	__end_of_initPB4
	__end_of_initPB4:
;; =============== function _initPB4 ends ============

	signat	_initPB4,4216
	global	_setPB3
psect	text1466,local,class=CODE,delta=2
global __ptext1466
__ptext1466:

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
psect	text1466
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
	
l4010:	
;main.c: 136: if( bValue )
	movf	(setPB3@bValue)^080h,w
	skipz
	goto	u1680
	goto	l690
u1680:
	line	139
	
l4012:	
;main.c: 139: PB0 = 1;
	bcf	status, 5	;RP0=0, select bank0
	bsf	(48/8),(48)&7
	goto	l692
	line	143
	
l690:	
	line	146
;main.c: 143: else
;main.c: 146: PB0 = 0;
	bcf	status, 5	;RP0=0, select bank0
	bcf	(48/8),(48)&7
	line	150
	
l692:	
	return
	opt stack 0
GLOBAL	__end_of_setPB3
	__end_of_setPB3:
;; =============== function _setPB3 ends ============

	signat	_setPB3,4216
	global	_initPB3
psect	text1467,local,class=CODE,delta=2
global __ptext1467
__ptext1467:

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
psect	text1467
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
	
l4006:	
;main.c: 117: if( bValue )
	movf	(initPB3@bValue)^080h,w
	skipz
	goto	u1670
	goto	l685
u1670:
	line	120
	
l4008:	
;main.c: 120: TRISB0 = 1;
	bsf	(1072/8)^080h,(1072)&7
	goto	l687
	line	124
	
l685:	
	line	127
;main.c: 124: else
;main.c: 127: TRISB0 = 0;
	bcf	(1072/8)^080h,(1072)&7
	line	131
	
l687:	
	return
	opt stack 0
GLOBAL	__end_of_initPB3
	__end_of_initPB3:
;; =============== function _initPB3 ends ============

	signat	_initPB3,4216
	global	_ISR
psect	text1468,local,class=CODE,delta=2
global __ptext1468
__ptext1468:

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
psect	text1468
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
psect	text1468
	line	642
	
i1l3772:	
;common.c: 639: static unsigned char ucTimer1sCnt = 0;
;common.c: 642: if(TMR1IF == 1)
	btfss	(96/8),(96)&7
	goto	u136_21
	goto	u136_20
u136_21:
	goto	i1l3794
u136_20:
	line	644
	
i1l3774:	
;common.c: 643: {
;common.c: 644: TMR1IF = 0 ;
	bcf	(96/8),(96)&7
	line	645
	
i1l3776:	
;common.c: 645: timer.timer10msStopWatch++;
	incf	(_timer),f
	line	646
;common.c: 646: ucTimer1sCnt++;
	incf	(ISR@ucTimer1sCnt),f
	line	650
	
i1l3778:	
;common.c: 650: if(ucTimer1sCnt >= 100)
	movlw	(064h)
	subwf	(ISR@ucTimer1sCnt),w
	skipc
	goto	u137_21
	goto	u137_20
u137_21:
	goto	i1l3794
u137_20:
	line	652
	
i1l3780:	
;common.c: 651: {
;common.c: 652: ucTimer1sCnt = 0;
	clrf	(ISR@ucTimer1sCnt)
	line	653
	
i1l3782:	
;common.c: 653: if(uiBigTimer > 0)
	movf	(_uiBigTimer+1),w
	iorwf	(_uiBigTimer),w
	skipnz
	goto	u138_21
	goto	u138_20
u138_21:
	goto	i1l1680
u138_20:
	line	654
	
i1l3784:	
;common.c: 654: uiBigTimer--;
	movlw	low(01h)
	subwf	(_uiBigTimer),f
	movlw	high(01h)
	skipc
	decf	(_uiBigTimer+1),f
	subwf	(_uiBigTimer+1),f
	
i1l1680:	
	line	656
;common.c: 656: if(uiSmallTimer)
	movf	(_uiSmallTimer+1),w
	iorwf	(_uiSmallTimer),w
	skipnz
	goto	u139_21
	goto	u139_20
u139_21:
	goto	i1l1681
u139_20:
	line	657
	
i1l3786:	
;common.c: 657: uiSmallTimer--;
	movlw	low(01h)
	subwf	(_uiSmallTimer),f
	movlw	high(01h)
	skipc
	decf	(_uiSmallTimer+1),f
	subwf	(_uiSmallTimer+1),f
	
i1l1681:	
	line	659
;common.c: 659: if(uiTwentySecondsTimer)
	movf	(_uiTwentySecondsTimer+1),w
	iorwf	(_uiTwentySecondsTimer),w
	skipnz
	goto	u140_21
	goto	u140_20
u140_21:
	goto	i1l1682
u140_20:
	line	660
	
i1l3788:	
;common.c: 660: uiTwentySecondsTimer--;
	movlw	low(01h)
	subwf	(_uiTwentySecondsTimer),f
	movlw	high(01h)
	skipc
	decf	(_uiTwentySecondsTimer+1),f
	subwf	(_uiTwentySecondsTimer+1),f
	
i1l1682:	
	line	662
;common.c: 662: if(uiTwentyMinTimer)
	movf	(_uiTwentyMinTimer+1),w
	iorwf	(_uiTwentyMinTimer),w
	skipnz
	goto	u141_21
	goto	u141_20
u141_21:
	goto	i1l1683
u141_20:
	line	663
	
i1l3790:	
;common.c: 663: uiTwentyMinTimer--;
	movlw	low(01h)
	subwf	(_uiTwentyMinTimer),f
	movlw	high(01h)
	skipc
	decf	(_uiTwentyMinTimer+1),f
	subwf	(_uiTwentyMinTimer+1),f
	
i1l1683:	
	line	665
;common.c: 665: if( uiOneHourTimer )
	movf	(_uiOneHourTimer+1),w
	iorwf	(_uiOneHourTimer),w
	skipnz
	goto	u142_21
	goto	u142_20
u142_21:
	goto	i1l3794
u142_20:
	line	666
	
i1l3792:	
;common.c: 666: uiOneHourTimer--;
	movlw	low(01h)
	subwf	(_uiOneHourTimer),f
	movlw	high(01h)
	skipc
	decf	(_uiOneHourTimer+1),f
	subwf	(_uiOneHourTimer+1),f
	line	670
	
i1l3794:	
;common.c: 667: }
;common.c: 668: }
;common.c: 670: if(ADIF)
	btfss	(106/8),(106)&7
	goto	u143_21
	goto	u143_20
u143_21:
	goto	i1l1688
u143_20:
	line	673
	
i1l3796:	
;common.c: 671: {
;common.c: 673: ADIF=0;
	bcf	(106/8),(106)&7
	line	674
	
i1l3798:	
;common.c: 674: setAD_ConvertFlag(1);
	movlw	(01h)
	fcall	i1_setAD_ConvertFlag
	line	676
	
i1l3800:	
;common.c: 676: if(sampleChannelSelect == 2)
	movf	(_sampleChannelSelect),w
	xorlw	02h
	skipz
	goto	u144_21
	goto	u144_20
u144_21:
	goto	i1l3804
u144_20:
	line	680
	
i1l3802:	
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
	goto	i1l1688
	line	690
	
i1l3804:	
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
	
i1l1688:	
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
psect	text1469,local,class=CODE,delta=2
global __ptext1469
__ptext1469:

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
;;		On entry : 60/0
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
psect	text1469
	file	"D:\develop\AK7030-good\AK7030-OTP\common.c"
	line	165
	global	__size_of_vPutSampleDataIntoTable
	__size_of_vPutSampleDataIntoTable	equ	__end_of_vPutSampleDataIntoTable-_vPutSampleDataIntoTable
	
_vPutSampleDataIntoTable:	
	opt	stack 3
; Regs used in _vPutSampleDataIntoTable: [wreg-fsr0h+status,2+status,0+btemp+1+pclath+cstack]
	line	182
	
i1l3666:	
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
	goto	i1l3716
u118_20:
	line	184
	
i1l3668:	
;common.c: 183: {
;common.c: 184: if(ucCh12Length < 3)
	movlw	(03h)
	subwf	(vPutSampleDataIntoTable@ucCh12Length),w
	skipnc
	goto	u119_21
	goto	u119_20
u119_21:
	goto	i1l3712
u119_20:
	line	186
	
i1l3670:	
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
	
i1l3672:	
;common.c: 188: ucCh12Length++;
	incf	(vPutSampleDataIntoTable@ucCh12Length),f
	line	190
	
i1l3674:	
;common.c: 190: if( 3 == ucCh12Length )
	movf	(vPutSampleDataIntoTable@ucCh12Length),w
	xorlw	03h
	skipz
	goto	u120_21
	goto	u120_20
u120_21:
	goto	i1l1574
u120_20:
	line	192
	
i1l3676:	
;common.c: 191: {
;common.c: 192: ucCh12Length = 0;
	clrf	(vPutSampleDataIntoTable@ucCh12Length)
	line	203
	
i1l3678:	
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
	
i1l3680:	
;common.c: 205: if( 0 == ucInitFlag)
	movf	(vPutSampleDataIntoTable@ucInitFlag),f
	skipz
	goto	u121_21
	goto	u121_20
u121_21:
	goto	i1l3686
u121_20:
	line	207
	
i1l3682:	
;common.c: 206: {
;common.c: 207: ucInitFlag = 1;
	clrf	(vPutSampleDataIntoTable@ucInitFlag)
	incf	(vPutSampleDataIntoTable@ucInitFlag),f
	line	209
	
i1l3684:	
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
	
i1l3686:	
	line	229
	
i1l3688:	
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
	
i1l3690:	
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
	goto	i1l1553
u122_20:
	line	234
	
i1l3692:	
;common.c: 234: uiDeviationValue =400;
	movlw	low(0190h)
	movwf	(vPutSampleDataIntoTable@uiDeviationValue)
	movlw	high(0190h)
	movwf	((vPutSampleDataIntoTable@uiDeviationValue))+1
	
i1l1553:	
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
;common.c: 246: if(uiDeviationValue > (475))
	movlw	high(01DCh)
	subwf	(vPutSampleDataIntoTable@uiDeviationValue+1),w
	movlw	low(01DCh)
	skipnz
	subwf	(vPutSampleDataIntoTable@uiDeviationValue),w
	skipc
	goto	u123_21
	goto	u123_20
u123_21:
	goto	i1l3696
u123_20:
	line	250
	
i1l3694:	
;common.c: 247: {
;common.c: 250: uiInitWidth++;
	incf	(vPutSampleDataIntoTable@uiInitWidth),f
	line	252
;common.c: 252: }
	goto	i1l3700
	line	253
	
i1l3696:	
;common.c: 253: else if(uiDeviationValue < (475))
	movlw	high(01DBh)
	subwf	(vPutSampleDataIntoTable@uiDeviationValue+1),w
	movlw	low(01DBh)
	skipnz
	subwf	(vPutSampleDataIntoTable@uiDeviationValue),w
	skipnc
	goto	u124_21
	goto	u124_20
u124_21:
	goto	i1l3700
u124_20:
	line	257
	
i1l3698:	
;common.c: 254: {
;common.c: 257: uiInitWidth--;
	decf	(vPutSampleDataIntoTable@uiInitWidth),f
	line	263
;common.c: 259: }
	
i1l3700:	
;common.c: 263: if(uiInitWidth > 249)
	movlw	(0FAh)
	subwf	(vPutSampleDataIntoTable@uiInitWidth),w
	skipc
	goto	u125_21
	goto	u125_20
u125_21:
	goto	i1l1558
u125_20:
	line	264
	
i1l3702:	
;common.c: 264: uiInitWidth = 249;
	movlw	(0F9h)
	movwf	(vPutSampleDataIntoTable@uiInitWidth)
	
i1l1558:	
	line	266
;common.c: 266: if(uiInitWidth < 75)
	movlw	(04Bh)
	subwf	(vPutSampleDataIntoTable@uiInitWidth),w
	skipnc
	goto	u126_21
	goto	u126_20
u126_21:
	goto	i1l3706
u126_20:
	line	267
	
i1l3704:	
;common.c: 267: uiInitWidth = 75;
	movlw	(04Bh)
	movwf	(vPutSampleDataIntoTable@uiInitWidth)
	line	271
	
i1l3706:	
;common.c: 271: if( 1 == getWaitResetFlag())
	fcall	_getWaitResetFlag
	xorlw	01h
	skipz
	goto	u127_21
	goto	u127_20
u127_21:
	goto	i1l3710
u127_20:
	line	274
	
i1l3708:	
;common.c: 272: {
;common.c: 274: uiInitWidth = 150;
	movlw	(096h)
	movwf	(vPutSampleDataIntoTable@uiInitWidth)
	line	276
	
i1l3710:	
;common.c: 275: }
;common.c: 276: setPWM_Width(uiInitWidth);
	movf	(vPutSampleDataIntoTable@uiInitWidth),w
	fcall	_setPWM_Width
	goto	i1l1574
	line	283
	
i1l3712:	
;common.c: 281: else
;common.c: 282: {
;common.c: 283: ucCh12Length = 0;
	clrf	(vPutSampleDataIntoTable@ucCh12Length)
	line	285
	
i1l3714:	
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
	goto	i1l1574
	line	288
	
i1l3716:	
;common.c: 288: else if(channel == 1)
	decf	(vPutSampleDataIntoTable@channel),w
	skipz
	goto	u128_21
	goto	u128_20
u128_21:
	goto	i1l3728
u128_20:
	line	290
	
i1l3718:	
;common.c: 289: {
;common.c: 290: if(ucCh13Length < 3)
	movlw	(03h)
	subwf	(vPutSampleDataIntoTable@ucCh13Length),w
	skipnc
	goto	u129_21
	goto	u129_20
u129_21:
	goto	i1l3724
u129_20:
	line	292
	
i1l3720:	
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
	
i1l3722:	
;common.c: 294: ucCh13Length++;
	incf	(vPutSampleDataIntoTable@ucCh13Length),f
	line	295
;common.c: 295: }
	goto	i1l1574
	line	298
	
i1l3724:	
;common.c: 296: else
;common.c: 297: {
;common.c: 298: ucCh13Length = 0;
	clrf	(vPutSampleDataIntoTable@ucCh13Length)
	line	300
	
i1l3726:	
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
	goto	i1l1574
	line	303
	
i1l3728:	
;common.c: 303: else if(channel == 14)
	movf	(vPutSampleDataIntoTable@channel),w
	xorlw	0Eh
	skipz
	goto	u130_21
	goto	u130_20
u130_21:
	goto	i1l3740
u130_20:
	line	305
	
i1l3730:	
;common.c: 304: {
;common.c: 305: if(ucChannelFourteenthLength < 3)
	movlw	(03h)
	subwf	(vPutSampleDataIntoTable@ucChannelFourteenthLength),w
	skipnc
	goto	u131_21
	goto	u131_20
u131_21:
	goto	i1l3736
u131_20:
	line	307
	
i1l3732:	
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
	
i1l3734:	
;common.c: 309: ucChannelFourteenthLength++;
	incf	(vPutSampleDataIntoTable@ucChannelFourteenthLength),f
	line	310
;common.c: 310: }
	goto	i1l1574
	line	313
	
i1l3736:	
;common.c: 311: else
;common.c: 312: {
;common.c: 313: ucChannelFourteenthLength = 0;
	clrf	(vPutSampleDataIntoTable@ucChannelFourteenthLength)
	line	315
	
i1l3738:	
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
	goto	i1l1574
	line	320
	
i1l3740:	
;common.c: 318: else
;common.c: 319: {
;common.c: 320: ucCh12Length = 0;
	clrf	(vPutSampleDataIntoTable@ucCh12Length)
	line	322
;common.c: 322: ucCh13Length = 0;
	clrf	(vPutSampleDataIntoTable@ucCh13Length)
	line	324
;common.c: 324: ucChannelFourteenthLength = 0;
	clrf	(vPutSampleDataIntoTable@ucChannelFourteenthLength)
	line	326
;common.c: 326: for(int i = 0;i < 3; i++)
	clrf	(vPutSampleDataIntoTable@i)
	clrf	(vPutSampleDataIntoTable@i+1)
	line	328
	
i1l3746:	
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
	
i1l3748:	
	incf	(vPutSampleDataIntoTable@i),f
	skipnz
	incf	(vPutSampleDataIntoTable@i+1),f
	
i1l3750:	
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
	goto	i1l3746
u132_20:
	line	336
	
i1l1574:	
	return
	opt stack 0
GLOBAL	__end_of_vPutSampleDataIntoTable
	__end_of_vPutSampleDataIntoTable:
;; =============== function _vPutSampleDataIntoTable ends ============

	signat	_vPutSampleDataIntoTable,8312
	global	i1_setAD_ConvertFlag
psect	text1470,local,class=CODE,delta=2
global __ptext1470
__ptext1470:

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
psect	text1470
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
	
i1l3810:	
;common.c: 375: adc_convert_flag = flag;
	movf	(i1setAD_ConvertFlag@flag),w
	movwf	(_adc_convert_flag)
	line	376
	
i1l1592:	
	return
	opt stack 0
GLOBAL	__end_ofi1_setAD_ConvertFlag
	__end_ofi1_setAD_ConvertFlag:
;; =============== function i1_setAD_ConvertFlag ends ============

	signat	i1_setAD_ConvertFlag,88
	global	_adc_get
psect	text1471,local,class=CODE,delta=2
global __ptext1471
__ptext1471:

;; *************** function _adc_get *****************
;; Defined at:
;;		line 143 in file "D:\develop\AK7030-good\AK7030-OTP\periph.c"
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
;;		On exit  : 60/0
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
psect	text1471
	file	"D:\develop\AK7030-good\AK7030-OTP\periph.c"
	line	143
	global	__size_of_adc_get
	__size_of_adc_get	equ	__end_of_adc_get-_adc_get
	
_adc_get:	
	opt	stack 4
; Regs used in _adc_get: [wreg]
	line	145
	
i1l3806:	
;periph.c: 144: unsigned int val;
;periph.c: 145: val = (ADRESH<<8) | ADRESL;
	movf	(30),w	;volatile
	movwf	(adc_get@val+1)
	clrf	(adc_get@val)
	bsf	status, 5	;RP0=1, select bank1
	movf	(158)^080h,w	;volatile
	iorwf	(adc_get@val),f
	line	147
;periph.c: 147: val = val + ad_offset;
	bcf	status, 5	;RP0=0, select bank0
	movf	(_ad_offset),w
	addwf	(adc_get@val),f
	skipnc
	incf	(adc_get@val+1),f
	movf	(_ad_offset+1),w
	addwf	(adc_get@val+1),f
	line	148
;periph.c: 148: return val;
	movf	(adc_get@val+1),w
	movwf	(?_adc_get+1)
	movf	(adc_get@val),w
	movwf	(?_adc_get)
	line	149
	
i1l2355:	
	return
	opt stack 0
GLOBAL	__end_of_adc_get
	__end_of_adc_get:
;; =============== function _adc_get ends ============

	signat	_adc_get,90
	global	_Filter
psect	text1472,local,class=CODE,delta=2
global __ptext1472
__ptext1472:

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
;;		On entry : 160/0
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
psect	text1472
	file	"D:\develop\AK7030-good\AK7030-OTP\common.c"
	line	117
	global	__size_of_Filter
	__size_of_Filter	equ	__end_of_Filter-_Filter
	
_Filter:	
	opt	stack 3
; Regs used in _Filter: [wreg-fsr0h+status,2+status,0+btemp+1]
;Filter@tmpValue stored from wreg
	line	119
	movwf	(Filter@tmpValue)
	
i1l3618:	
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
	
i1l3624:	
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
	
i1l3626:	
	incf	(Filter@tmpValue),f
	incf	(Filter@tmpValue),f
	line	125
	
i1l3628:	
	incf	(Filter@cir),f
	skipnz
	incf	(Filter@cir+1),f
	
i1l3630:	
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
	goto	i1l3624
u113_20:
	line	130
	
i1l3632:	
;common.c: 130: for(j = 0; j < 3 - 1; j++)
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	clrf	(Filter@j)
	line	132
	
i1l3638:	
;common.c: 131: {
;common.c: 132: for(i = 0; i < 3 - 1 - j; i++)
	clrf	(Filter@i)
	goto	i1l3646
	line	134
	
i1l3640:	
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
	goto	i1l3644
u114_20:
	line	137
	
i1l3642:	
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
	
i1l3644:	
	incf	(Filter@i),f
	
i1l3646:	
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
	goto	i1l3640
u115_20:
	line	130
	
i1l3648:	
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	incf	(Filter@j),f
	
i1l3650:	
	movlw	(02h)
	subwf	(Filter@j),w
	skipc
	goto	u116_21
	goto	u116_20
u116_21:
	goto	i1l3638
u116_20:
	
i1l1511:	
	line	146
;common.c: 142: }
;common.c: 143: }
;common.c: 144: }
;common.c: 146: for(i = 1; i < 3 - 1; i++)
	clrf	(Filter@i)
	incf	(Filter@i),f
	line	148
	
i1l3656:	
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
	
i1l3658:	
	incf	(Filter@i),f
	
i1l3660:	
	movlw	(02h)
	subwf	(Filter@i),w
	skipc
	goto	u117_21
	goto	u117_20
u117_21:
	goto	i1l3656
u117_20:
	line	152
	
i1l3662:	
;common.c: 149: }
;common.c: 152: return (filter_sum );
	movf	(Filter@filter_sum+1),w
	movwf	(?_Filter+1)
	movf	(Filter@filter_sum),w
	movwf	(?_Filter)
	line	154
	
i1l1518:	
	return
	opt stack 0
GLOBAL	__end_of_Filter
	__end_of_Filter:
;; =============== function _Filter ends ============

	signat	_Filter,4218
	global	_setPWM_Width
psect	text1473,local,class=CODE,delta=2
global __ptext1473
__ptext1473:

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
psect	text1473
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
	
i1l3568:	
;common.c: 71: ucOldWidth = ucWidth;
	movf	(setPWM_Width@ucWidth),w
	movwf	(21)	;volatile
	line	73
	
i1l1492:	
	return
	opt stack 0
GLOBAL	__end_of_setPWM_Width
	__end_of_setPWM_Width:
;; =============== function _setPWM_Width ends ============

	signat	_setPWM_Width,4216
	global	_getWaitResetFlag
psect	text1474,local,class=CODE,delta=2
global __ptext1474
__ptext1474:

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
psect	text1474
	file	"D:\develop\AK7030-good\AK7030-OTP\common.c"
	line	60
	global	__size_of_getWaitResetFlag
	__size_of_getWaitResetFlag	equ	__end_of_getWaitResetFlag-_getWaitResetFlag
	
_getWaitResetFlag:	
	opt	stack 3
; Regs used in _getWaitResetFlag: [wreg]
	line	61
	
i1l3564:	
;common.c: 61: return bWaitResetFlag;
	movf	(_bWaitResetFlag),w
	line	62
	
i1l1486:	
	return
	opt stack 0
GLOBAL	__end_of_getWaitResetFlag
	__end_of_getWaitResetFlag:
;; =============== function _getWaitResetFlag ends ============

	signat	_getWaitResetFlag,89
psect	text1475,local,class=CODE,delta=2
global __ptext1475
__ptext1475:
	global	btemp
	btemp set 07Eh

	DABS	1,126,2	;btemp
	global	wtemp0
	wtemp0 set btemp
	end
