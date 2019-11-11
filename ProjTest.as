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
# 105 "D:\develop\190625\AK7030-OTP\main.c"
	psect config,class=CONFIG,delta=2 ;#
# 105 "D:\develop\190625\AK7030-OTP\main.c"
	dw 0x0FFF & 0x3FFF & 0x3FFF & 0x3FFF & 0x3FFF & 0x3FFF ;#
# 106 "D:\develop\190625\AK7030-OTP\main.c"
	psect config,class=CONFIG,delta=2 ;#
# 106 "D:\develop\190625\AK7030-OTP\main.c"
	dw 0x3FFF & 0x3FDF & 0x3FFF & 0x3FFE ;#
# 107 "D:\develop\190625\AK7030-OTP\main.c"
	psect config,class=CONFIG,delta=2 ;#
# 107 "D:\develop\190625\AK7030-OTP\main.c"
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
	FNCALL	_getAdOriginalCh13Value,_Filter
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
	FNCALL	_vPutSampleDataIntoTable,i1_Filter
	FNCALL	_vPutSampleDataIntoTable,_setPWM_Width
	FNCALL	intlevel1,_ISR
	global	intlevel1
	FNROOT	intlevel1
	global	vPutSampleDataIntoTable@uiInitWidth
	global	_sampleChannelSelect
psect	idataBANK0,class=CODE,space=0,delta=2
global __pidataBANK0
__pidataBANK0:
	file	"D:\develop\190625\AK7030-OTP\common.c"
	line	135

;initializer for vPutSampleDataIntoTable@uiInitWidth
	retlw	04Bh
psect	idataBANK1,class=CODE,space=0,delta=2
global __pidataBANK1
__pidataBANK1:
	line	24

;initializer for _sampleChannelSelect
	retlw	0Ch
	global	vPutSampleDataIntoTable@uiCalWidthArray
	global	_uiTwentySecondsTimer
	global	vPutSampleDataIntoTable@uiCalWidthCnt
	global	ISR@ucTimer1sCnt
	global	_adc_convert_flag
	global	_sampleTimes
	global	_timer
	global	setPWM_Width@ucOldWidth
	global	vPutSampleDataIntoTable@bInitArrayFlag
	global	vPutSampleDataIntoTable@ucChannelFirstLength
	global	vPutSampleDataIntoTable@ucChannelFourteenthLength
	global	vPutSampleDataIntoTable@ucChannelFourthLength
	global	_uiBigTimer
	global	_uiOneHourTimer
	global	_uiSmallTimer
	global	_uiTwentyMinTimer
	global	main@ucDelay1s
	global	main@uiTimerOneP5s
	global	main@uiTimerThreeP5s
	global	main@uiTimerTwoP5s
	global	_bBigTimerStartFlag
	global	_bOneHourTimerStartFlag
	global	_bSmallTimerStartFlag
	global	_bTwentyMinStartFlag
	global	main@cTimerP5s_791
	global	main@cTimerP5s_797
	global	main@ucStep
	global	main@ucTimerP3s
	global	main@ucTimerP5s
	global	_uiSampleChannelFourth
	global	_uiSampleChannelFirst
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
vPutSampleDataIntoTable@ucChannelFirstLength:
       ds      1

vPutSampleDataIntoTable@ucChannelFourteenthLength:
       ds      1

vPutSampleDataIntoTable@ucChannelFourthLength:
       ds      1

psect	bssBANK0,class=BANK0,space=1
global __pbssBANK0
__pbssBANK0:
vPutSampleDataIntoTable@uiCalWidthArray:
       ds      8

_uiTwentySecondsTimer:
       ds      2

vPutSampleDataIntoTable@uiCalWidthCnt:
       ds      2

ISR@ucTimer1sCnt:
       ds      1

_adc_convert_flag:
       ds      1

_sampleTimes:
       ds      1

_timer:
       ds      1

setPWM_Width@ucOldWidth:
       ds      1

vPutSampleDataIntoTable@bInitArrayFlag:
       ds      1

_uiSampleChannelFourth:
       ds      20

psect	dataBANK0,class=BANK0,space=1
global __pdataBANK0
__pdataBANK0:
	file	"D:\develop\190625\AK7030-OTP\common.c"
	line	135
vPutSampleDataIntoTable@uiInitWidth:
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

main@ucDelay1s:
       ds      2

main@uiTimerOneP5s:
       ds      2

main@uiTimerThreeP5s:
       ds      2

main@uiTimerTwoP5s:
       ds      2

_bBigTimerStartFlag:
       ds      1

_bOneHourTimerStartFlag:
       ds      1

_bSmallTimerStartFlag:
       ds      1

_bTwentyMinStartFlag:
       ds      1

main@cTimerP5s_791:
       ds      1

main@cTimerP5s_797:
       ds      1

main@ucStep:
       ds      1

main@ucTimerP3s:
       ds      1

main@ucTimerP5s:
       ds      1

psect	dataBANK1,class=BANK1,space=1
global __pdataBANK1
__pdataBANK1:
	file	"D:\develop\190625\AK7030-OTP\common.c"
	line	24
_sampleChannelSelect:
       ds      1

psect	bssBANK3,class=BANK3,space=1
global __pbssBANK3
__pbssBANK3:
_uiSampleChannelFirst:
       ds      20

_uiSampleChannelFourteenth:
       ds      20

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
	clrf	((__pbssCOMMON)+1)&07Fh
	clrf	((__pbssCOMMON)+2)&07Fh
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
	movlw	low((__pbssBANK1)+019h)
	fcall	clear_ram
; Clear objects allocated to BANK3
psect cinit,class=CODE,delta=2
	bsf	status, 7	;select IRP bank2
	movlw	low(__pbssBANK3)
	movwf	fsr
	movlw	low((__pbssBANK3)+028h)
	fcall	clear_ram
; Initialize objects allocated to BANK1
	global __pidataBANK1
psect cinit,class=CODE,delta=2
	bsf	status, 5	;RP0=1, select bank1
	fcall	__pidataBANK1+0		;fetch initializer
	movwf	__pdataBANK1+0&07fh		
; Initialize objects allocated to BANK0
	global __pidataBANK0
psect cinit,class=CODE,delta=2
	bcf	status, 5	;RP0=0, select bank0
	fcall	__pidataBANK0+0		;fetch initializer
	movwf	__pdataBANK0+0&07fh		
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
	global	?_pwm_start
?_pwm_start:	; 0 bytes @ 0x0
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
	global	pwm_start@ucPulseFrequency
pwm_start@ucPulseFrequency:	; 1 bytes @ 0x0
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
	global	??_Filter
??_Filter:	; 0 bytes @ 0x2
	global	adc_test_init@channel
adc_test_init@channel:	; 1 bytes @ 0x2
	ds	1
	global	??_process_AD_Converter_Value
??_process_AD_Converter_Value:	; 0 bytes @ 0x3
	ds	3
	global	Filter@filter_buf
Filter@filter_buf:	; 20 bytes @ 0x6
	ds	20
	global	Filter@filter_temp
Filter@filter_temp:	; 2 bytes @ 0x1A
	ds	2
	global	Filter@filter_sum
Filter@filter_sum:	; 2 bytes @ 0x1C
	ds	2
	global	Filter@cir
Filter@cir:	; 2 bytes @ 0x1E
	ds	2
	global	Filter@j
Filter@j:	; 1 bytes @ 0x20
	ds	1
	global	Filter@i
Filter@i:	; 1 bytes @ 0x21
	ds	1
	global	?_getAdOriginalCh13Value
?_getAdOriginalCh13Value:	; 2 bytes @ 0x22
	ds	2
	global	??_getAdOriginalCh13Value
??_getAdOriginalCh13Value:	; 0 bytes @ 0x24
	global	??_main
??_main:	; 0 bytes @ 0x24
	ds	1
	global	main@ucChValue
main@ucChValue:	; 2 bytes @ 0x25
	ds	2
	global	main@uiCh13Value
main@uiCh13Value:	; 2 bytes @ 0x27
	ds	2
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
	global	?i1_Filter
?i1_Filter:	; 2 bytes @ 0x0
	global	setPWM_Width@ucWidth
setPWM_Width@ucWidth:	; 1 bytes @ 0x0
	global	i1setAD_ConvertFlag@flag
i1setAD_ConvertFlag@flag:	; 1 bytes @ 0x0
	ds	2
	global	??_adc_get
??_adc_get:	; 0 bytes @ 0x2
	global	??i1_Filter
??i1_Filter:	; 0 bytes @ 0x2
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
	ds	2
psect	cstackBANK0,class=BANK0,space=1
global __pcstackBANK0
__pcstackBANK0:
	global	i1Filter@filter_buf
i1Filter@filter_buf:	; 20 bytes @ 0x0
	ds	20
	global	i1Filter@tmpValue
i1Filter@tmpValue:	; 1 bytes @ 0x14
	ds	1
	global	i1Filter@filter_temp
i1Filter@filter_temp:	; 2 bytes @ 0x15
	ds	2
	global	i1Filter@filter_sum
i1Filter@filter_sum:	; 2 bytes @ 0x17
	ds	2
	global	i1Filter@cir
i1Filter@cir:	; 2 bytes @ 0x19
	ds	2
	global	i1Filter@j
i1Filter@j:	; 1 bytes @ 0x1B
	ds	1
	global	i1Filter@i
i1Filter@i:	; 1 bytes @ 0x1C
	ds	1
	global	vPutSampleDataIntoTable@uiSum
vPutSampleDataIntoTable@uiSum:	; 2 bytes @ 0x1D
	ds	2
	global	vPutSampleDataIntoTable@uiCalWidth
vPutSampleDataIntoTable@uiCalWidth:	; 2 bytes @ 0x1F
	ds	2
	global	vPutSampleDataIntoTable@ucIndex
vPutSampleDataIntoTable@ucIndex:	; 1 bytes @ 0x21
	ds	1
	global	vPutSampleDataIntoTable@i
vPutSampleDataIntoTable@i:	; 2 bytes @ 0x22
	ds	2
	global	??_ISR
??_ISR:	; 0 bytes @ 0x24
	ds	4
;;Data sizes: Strings 0, constant 0, data 2, bss 106, persistent 0 stack 0
;;Auto spaces:   Size  Autos    Used
;; COMMON          14     11      14
;; BANK0           80     40      79
;; BANK1           80     41      67
;; BANK3           96      0      40
;; BANK2           96      0       0

;;
;; Pointer list with targets:

;; ?i1_Filter	unsigned int  size(1) Largest target is 0
;;
;; i1Filter@tmpValue	PTR int  size(1) Largest target is 20
;;		 -> uiSampleChannelFirst(BANK3[20]), 
;;
;; ?_adc_get	unsigned int  size(1) Largest target is 0
;;
;; ?_getAdOriginalCh13Value	unsigned int  size(1) Largest target is 0
;;
;; ?_Filter	unsigned int  size(1) Largest target is 0
;;
;; Filter@tmpValue	PTR int  size(2) Largest target is 20
;;		 -> uiSampleChannelFourteenth(BANK3[20]), uiSampleChannelFourth(BANK0[20]), uiSampleChannelFirst(BANK3[20]), 
;;


;;
;; Critical Paths under _main in COMMON
;;
;;   None.
;;
;; Critical Paths under _ISR in COMMON
;;
;;   _ISR->_vPutSampleDataIntoTable
;;   _vPutSampleDataIntoTable->i1_Filter
;;
;; Critical Paths under _main in BANK0
;;
;;   None.
;;
;; Critical Paths under _ISR in BANK0
;;
;;   _ISR->_vPutSampleDataIntoTable
;;   _vPutSampleDataIntoTable->i1_Filter
;;
;; Critical Paths under _main in BANK1
;;
;;   _main->_getAdOriginalCh13Value
;;   _getAdOriginalCh13Value->_Filter
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
;; (0) _main                                                 5     5      0    1334
;;                                             36 BANK1      5     5      0
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
;; (1) _getAdOriginalCh13Value                               2     0      2     620
;;                                             34 BANK1      2     0      2
;;                             _Filter
;; ---------------------------------------------------------------------------------
;; (1) _process_AD_Converter_Value                           0     0      0      75
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
;;                                              0 BANK1      1     1      0
;; ---------------------------------------------------------------------------------
;; (2) _getAD_ConvertFlag                                    0     0      0       0
;; ---------------------------------------------------------------------------------
;; (2) _Filter                                              34    32      2     620
;;                                              0 BANK1     34    32      2
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
;;                                              0 BANK1      2     0      2
;; ---------------------------------------------------------------------------------
;; (2) _adc_test_init                                        3     2      1      44
;;                                              0 BANK1      3     2      1
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
;; (1) _clearThreeHoursTimer                                 0     0      0       0
;; ---------------------------------------------------------------------------------
;; (1) _clearTwelveHoursTimer                                0     0      0       0
;; ---------------------------------------------------------------------------------
;; Estimated maximum stack depth 2
;; ---------------------------------------------------------------------------------
;; (Depth) Function   	        Calls       Base Space   Used Autos Params    Refs
;; ---------------------------------------------------------------------------------
;; (3) _ISR                                                  4     4      0    2635
;;                                             36 BANK0      4     4      0
;;                i1_setAD_ConvertFlag
;;                            _adc_get
;;            _vPutSampleDataIntoTable
;; ---------------------------------------------------------------------------------
;; (4) _vPutSampleDataIntoTable                             12     9      3    2538
;;                                              6 COMMON     5     2      3
;;                                             29 BANK0      7     7      0
;;                           i1_Filter
;;                       _setPWM_Width
;;                            _adc_get (ARG)
;; ---------------------------------------------------------------------------------
;; (4) i1_setAD_ConvertFlag                                  1     1      0      73
;;                                              0 COMMON     1     1      0
;; ---------------------------------------------------------------------------------
;; (5) i1_Filter                                            35    33      2    2023
;;                                              0 COMMON     6     4      2
;;                                              0 BANK0     29    29      0
;; ---------------------------------------------------------------------------------
;; (4) _adc_get                                              4     2      2      24
;;                                              0 COMMON     4     2      2
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
;;     i1_Filter
;;     _setPWM_Width
;;     _adc_get (ARG)
;;

;; Address spaces:

;;Name               Size   Autos  Total    Cost      Usage
;;BANK3               60      0      28      10       41.7%
;;BITBANK3            60      0       0       9        0.0%
;;SFR3                 0      0       0       4        0.0%
;;BITSFR3              0      0       0       4        0.0%
;;BANK2               60      0       0      12        0.0%
;;BITBANK2            60      0       0      11        0.0%
;;SFR2                 0      0       0       5        0.0%
;;BITSFR2              0      0       0       5        0.0%
;;SFR1                 0      0       0       2        0.0%
;;BITSFR1              0      0       0       2        0.0%
;;BANK1               50     29      43       8       83.8%
;;BITBANK1            50      0       0       7        0.0%
;;CODE                 0      0       0       0        0.0%
;;DATA                 0      0      D0       6        0.0%
;;ABS                  0      0      C8       3        0.0%
;;NULL                 0      0       0       0        0.0%
;;STACK                0      0       8       2        0.0%
;;BANK0               50     28      4F       5       98.8%
;;BITBANK0            50      0       0       4        0.0%
;;SFR0                 0      0       0       1        0.0%
;;BITSFR0              0      0       0       1        0.0%
;;COMMON               E      B       E       1      100.0%
;;BITCOMMON            E      0       0       0        0.0%

	global	_main
psect	maintext,global,class=CODE,delta=2
global __pmaintext
__pmaintext:

;; *************** function _main *****************
;; Defined at:
;;		line 593 in file "D:\develop\190625\AK7030-OTP\main.c"
;; Parameters:    Size  Location     Type
;;		None
;; Auto vars:     Size  Location     Type
;;  ucChValue       2   37[BANK1 ] unsigned int 
;;  uiCh13Value     2   39[BANK1 ] unsigned int 
;; Return value:  Size  Location     Type
;;                  2  748[COMMON] int 
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
	file	"D:\develop\190625\AK7030-OTP\main.c"
	line	593
	global	__size_of_main
	__size_of_main	equ	__end_of_main-_main
	
_main:	
	opt	stack 3
; Regs used in _main: [wreg-fsr0h+status,2+status,0+btemp+1+pclath+cstack]
	line	621
	
l4292:	
;main.c: 594: enum systemStep {
;main.c: 595: INIT_STEP = 0,
;main.c: 596: START_UP_PWM_STEP,
;main.c: 597: CHECK_10_HOUR_TIMER_STEP,
;main.c: 598: STARTUP_3_HOUR_TIMER_STEP,
;main.c: 599: CHECK_3_HOUR_TIMER_STEP,
;main.c: 600: STARTUP_1_HOUR_TIMER_STEP,
;main.c: 601: CHECK_1_HOUR_TIMER_STEP,
;main.c: 602: READY_FOR_RESET_STEP = 99,
;main.c: 603: DELAY_ONE_SECOND_FOR_PWM,
;main.c: 604: MEET_RESET_CONDITION_STEP,
;main.c: 605: RESET_STEP,
;main.c: 606: };
;main.c: 608: static enum systemStep ucStep = INIT_STEP;
	fcall	_initPin
	line	622
;main.c: 622: setPinInitVaule();
	fcall	_setPinInitVaule
	line	623
	
l4294:	
;main.c: 623: selectAdChannel();
	fcall	_selectAdChannel
	line	625
	
l4296:	
;main.c: 625: clock_config();
	fcall	_clock_config
	line	626
	
l4298:	
;main.c: 626: timer1_config();
	fcall	_timer1_config
	line	627
	
l4300:	
;main.c: 627: timer1_interrupt_config();
	fcall	_timer1_interrupt_config
	line	629
;main.c: 629: adc_test_init(12,3);
	movlw	(03h)
	movwf	(?_adc_test_init)^080h
	movlw	(0Ch)
	fcall	_adc_test_init
	line	641
;main.c: 641: startTwentyMinTimer( 60 );
	movlw	03Ch
	movwf	(?_startTwentyMinTimer)^080h
	clrf	(?_startTwentyMinTimer+1)^080h
	fcall	_startTwentyMinTimer
	line	642
;main.c: 642: pwm_start(75,249);
	movlw	(0F9h)
	movwf	(?_pwm_start)^080h
	movlw	(04Bh)
	fcall	_pwm_start
	line	643
	
l4302:	
;main.c: 643: _delay(1000);
	opt asmopt_off
movlw	249
	bsf	status, 5	;RP0=1, select bank1
movwf	(??_main+0)^080h+0,f
u2317:
	clrwdt
decfsz	(??_main+0)^080h+0,f
	goto	u2317
	nop2	;nop
	clrwdt
opt asmopt_on

	line	644
;main.c: 644: adc_start();
	fcall	_adc_start
	line	648
	
l4304:	
# 648 "D:\develop\190625\AK7030-OTP\main.c"
 clrwdt ;#
psect	maintext
	line	650
	
l4306:	
;main.c: 650: process_AD_Converter_Value();
	fcall	_process_AD_Converter_Value
	line	655
	
l4308:	
;main.c: 655: if( isPermitSampleTime() )
	fcall	_isPermitSampleTime
	xorlw	0
	skipnz
	goto	u2091
	goto	u2090
u2091:
	goto	l4304
u2090:
	line	659
	
l4310:	
;main.c: 656: {
;main.c: 659: clrSampeTime();
	fcall	_clrSampeTime
	line	668
;main.c: 668: switch(ucStep)
	goto	l4464
	line	679
	
l4312:	
;main.c: 672: {
;main.c: 677: static unsigned char ucTimerP3s = 0;
;main.c: 679: if( isFinishedTwentyMinTimer() )
	fcall	_isFinishedTwentyMinTimer
	xorlw	0
	skipnz
	goto	u2101
	goto	u2100
u2101:
	goto	l4318
u2100:
	line	681
	
l4314:	
;main.c: 680: {
;main.c: 681: ucStep = READY_FOR_RESET_STEP;
	movlw	(063h)
	movwf	(main@ucStep)^080h
	line	682
	
l4316:	
;main.c: 682: ucTimerP3s = 0;
	clrf	(main@ucTimerP3s)^080h
	line	683
;main.c: 683: }
	goto	l4304
	line	686
	
l4318:	
;main.c: 684: else
;main.c: 685: {
;main.c: 686: if( getAdOriginalCh13Value() > 90 )
	fcall	_getAdOriginalCh13Value
	movlw	high(05Bh)
	subwf	(1+(?_getAdOriginalCh13Value))^080h,w
	movlw	low(05Bh)
	skipnz
	subwf	(0+(?_getAdOriginalCh13Value))^080h,w
	skipc
	goto	u2111
	goto	u2110
u2111:
	goto	l4322
u2110:
	line	688
	
l4320:	
;main.c: 687: {
;main.c: 688: ucTimerP3s++;
	incf	(main@ucTimerP3s)^080h,f
	line	689
;main.c: 689: }
	goto	l4324
	line	691
	
l4322:	
;main.c: 690: else
;main.c: 691: ucTimerP3s = 0;
	clrf	(main@ucTimerP3s)^080h
	line	693
	
l4324:	
;main.c: 693: if( ucTimerP3s >= 3)
	movlw	(03h)
	subwf	(main@ucTimerP3s)^080h,w
	skipc
	goto	u2121
	goto	u2120
u2121:
	goto	l758
u2120:
	line	695
	
l4326:	
;main.c: 694: {
;main.c: 695: ucTimerP3s = 0;
	clrf	(main@ucTimerP3s)^080h
	line	696
	
l4328:	
;main.c: 696: ucStep = START_UP_PWM_STEP;
	clrf	(main@ucStep)^080h
	incf	(main@ucStep)^080h,f
	goto	l4304
	line	699
	
l758:	
	line	703
;main.c: 697: }
;main.c: 699: }
;main.c: 703: break;
	goto	l4304
	line	717
	
l4330:	
;main.c: 707: {
;main.c: 717: setPB3(0);
	movlw	(0)
	fcall	_setPB3
	line	718
;main.c: 718: setPB4(1);
	movlw	(01h)
	fcall	_setPB4
	line	719
;main.c: 719: setPB5(0);
	movlw	(0)
	fcall	_setPB5
	line	720
	
l4332:	
;main.c: 720: clearTwentyMinTimer();
	fcall	_clearTwentyMinTimer
	line	721
	
l4334:	
;main.c: 721: startTwelveHourTimer( 240);
	movlw	0F0h
	movwf	(?_startTwelveHourTimer)^080h
	clrf	(?_startTwelveHourTimer+1)^080h
	fcall	_startTwelveHourTimer
	line	722
	
l4336:	
;main.c: 722: ucStep = CHECK_10_HOUR_TIMER_STEP;
	movlw	(02h)
	movwf	(main@ucStep)^080h
	line	723
;main.c: 723: break;
	goto	l4304
	line	734
	
l4338:	
;main.c: 727: {
;main.c: 732: static unsigned char ucTimerP5s = 0;
;main.c: 734: if( isFinishedTwelveHoursTimer () )
	fcall	_isFinishedTwelveHoursTimer
	xorlw	0
	skipnz
	goto	u2131
	goto	u2130
u2131:
	goto	l4342
u2130:
	line	735
	
l4340:	
;main.c: 735: ucStep = READY_FOR_RESET_STEP;
	movlw	(063h)
	movwf	(main@ucStep)^080h
	goto	l4304
	line	738
	
l4342:	
;main.c: 736: else
;main.c: 737: {
;main.c: 738: if( getAdOriginalCh13Value() < 200 )
	fcall	_getAdOriginalCh13Value
	movlw	high(0C8h)
	subwf	(1+(?_getAdOriginalCh13Value))^080h,w
	movlw	low(0C8h)
	skipnz
	subwf	(0+(?_getAdOriginalCh13Value))^080h,w
	skipnc
	goto	u2141
	goto	u2140
u2141:
	goto	l4346
u2140:
	line	739
	
l4344:	
;main.c: 739: ucTimerP5s++;
	incf	(main@ucTimerP5s)^080h,f
	goto	l4348
	line	741
	
l4346:	
;main.c: 740: else
;main.c: 741: ucTimerP5s = 0;
	clrf	(main@ucTimerP5s)^080h
	line	743
	
l4348:	
;main.c: 743: if( ucTimerP5s > 5)
	movlw	(06h)
	subwf	(main@ucTimerP5s)^080h,w
	skipc
	goto	u2151
	goto	u2150
u2151:
	goto	l758
u2150:
	line	745
	
l4350:	
;main.c: 744: {
;main.c: 745: ucTimerP5s = 0;
	clrf	(main@ucTimerP5s)^080h
	line	746
	
l4352:	
;main.c: 746: ucStep = STARTUP_3_HOUR_TIMER_STEP;
	movlw	(03h)
	movwf	(main@ucStep)^080h
	goto	l4304
	line	755
	
l4354:	
;main.c: 754: {
;main.c: 755: clearTwelveHoursTimer();
	fcall	_clearTwelveHoursTimer
	line	756
	
l4356:	
;main.c: 756: startThreeHoursTimer(180);
	movlw	0B4h
	movwf	(?_startThreeHoursTimer)^080h
	clrf	(?_startThreeHoursTimer+1)^080h
	fcall	_startThreeHoursTimer
	line	757
;main.c: 757: ucStep = CHECK_3_HOUR_TIMER_STEP;
	movlw	(04h)
	movwf	(main@ucStep)^080h
	line	758
;main.c: 758: break;
	goto	l4304
	line	765
	
l4358:	
;main.c: 762: {
;main.c: 763: static unsigned char ucTimerP5s = 0;
;main.c: 765: if( isFinishedThreeHoursTimer() )
	fcall	_isFinishedThreeHoursTimer
	xorlw	0
	skipnz
	goto	u2161
	goto	u2160
u2161:
	goto	l4362
u2160:
	goto	l4340
	line	769
	
l4362:	
;main.c: 767: else
;main.c: 768: {
;main.c: 769: if( getAdOriginalCh13Value() < 85 )
	fcall	_getAdOriginalCh13Value
	movlw	high(055h)
	subwf	(1+(?_getAdOriginalCh13Value))^080h,w
	movlw	low(055h)
	skipnz
	subwf	(0+(?_getAdOriginalCh13Value))^080h,w
	skipnc
	goto	u2171
	goto	u2170
u2171:
	goto	l4366
u2170:
	line	770
	
l4364:	
;main.c: 770: ucTimerP5s++;
	incf	(main@cTimerP5s_791)^080h,f
	goto	l4368
	line	772
	
l4366:	
;main.c: 771: else
;main.c: 772: ucTimerP5s = 0;
	clrf	(main@cTimerP5s_791)^080h
	line	774
	
l4368:	
;main.c: 774: if( ucTimerP5s > 5)
	movlw	(06h)
	subwf	(main@cTimerP5s_791)^080h,w
	skipc
	goto	u2181
	goto	u2180
u2181:
	goto	l758
u2180:
	line	776
	
l4370:	
;main.c: 775: {
;main.c: 776: ucTimerP5s = 0;
	clrf	(main@cTimerP5s_791)^080h
	line	777
	
l4372:	
;main.c: 777: ucStep = STARTUP_1_HOUR_TIMER_STEP;
	movlw	(05h)
	movwf	(main@ucStep)^080h
	goto	l4304
	line	785
	
l4374:	
;main.c: 784: {
;main.c: 785: clearThreeHoursTimer();
	fcall	_clearThreeHoursTimer
	line	786
	
l4376:	
;main.c: 786: startOneHoursTimer( 120 );
	movlw	078h
	movwf	(?_startOneHoursTimer)^080h
	clrf	(?_startOneHoursTimer+1)^080h
	fcall	_startOneHoursTimer
	line	787
	
l4378:	
;main.c: 787: setPB3(1);
	movlw	(01h)
	fcall	_setPB3
	line	788
	
l4380:	
;main.c: 788: setPB4(0);
	movlw	(0)
	fcall	_setPB4
	line	789
	
l4382:	
;main.c: 789: setPB5(1);
	movlw	(01h)
	fcall	_setPB5
	line	790
	
l4384:	
;main.c: 790: ucStep = CHECK_1_HOUR_TIMER_STEP;
	movlw	(06h)
	bsf	status, 5	;RP0=1, select bank1
	movwf	(main@ucStep)^080h
	line	791
;main.c: 791: break;
	goto	l4304
	line	804
	
l4386:	
;main.c: 795: {
;main.c: 800: static unsigned int uiTimerOneP5s = 0;
;main.c: 801: static unsigned int uiTimerTwoP5s = 0;
;main.c: 802: static unsigned int uiTimerThreeP5s = 0;
;main.c: 804: unsigned int uiCh13Value = getAdOriginalCh13Value();
	fcall	_getAdOriginalCh13Value
	movf	(1+(?_getAdOriginalCh13Value))^080h,w
	movwf	(main@uiCh13Value+1)^080h
	movf	(0+(?_getAdOriginalCh13Value))^080h,w
	movwf	(main@uiCh13Value)^080h
	line	807
	
l4388:	
;main.c: 807: if( isFinishedOneHoursTimer() )
	fcall	_isFinishedOneHoursTimer
	xorlw	0
	skipnz
	goto	u2191
	goto	u2190
u2191:
	goto	l4392
u2190:
	goto	l4340
	line	811
	
l4392:	
;main.c: 809: else
;main.c: 810: {
;main.c: 811: if( uiCh13Value > 100 )
	movlw	high(065h)
	subwf	(main@uiCh13Value+1)^080h,w
	movlw	low(065h)
	skipnz
	subwf	(main@uiCh13Value)^080h,w
	skipc
	goto	u2201
	goto	u2200
u2201:
	goto	l4402
u2200:
	line	813
	
l4394:	
;main.c: 812: {
;main.c: 813: if( uiTimerOneP5s <= 5 )
	movlw	high(06h)
	subwf	(main@uiTimerOneP5s+1)^080h,w
	movlw	low(06h)
	skipnz
	subwf	(main@uiTimerOneP5s)^080h,w
	skipnc
	goto	u2211
	goto	u2210
u2211:
	goto	l4398
u2210:
	line	814
	
l4396:	
;main.c: 814: uiTimerOneP5s++;
	incf	(main@uiTimerOneP5s)^080h,f
	skipnz
	incf	(main@uiTimerOneP5s+1)^080h,f
	line	815
	
l4398:	
;main.c: 815: uiTimerTwoP5s = 0;
	clrf	(main@uiTimerTwoP5s)^080h
	clrf	(main@uiTimerTwoP5s+1)^080h
	line	816
	
l4400:	
;main.c: 816: uiTimerThreeP5s = 0;
	clrf	(main@uiTimerThreeP5s)^080h
	clrf	(main@uiTimerThreeP5s+1)^080h
	line	817
;main.c: 817: }
	goto	l4404
	line	820
	
l4402:	
;main.c: 818: else
;main.c: 819: {
;main.c: 820: uiTimerOneP5s = 0;
	clrf	(main@uiTimerOneP5s)^080h
	clrf	(main@uiTimerOneP5s+1)^080h
	line	824
	
l4404:	
;main.c: 821: }
;main.c: 824: if(uiTimerOneP5s > 5)
	movlw	high(06h)
	subwf	(main@uiTimerOneP5s+1)^080h,w
	movlw	low(06h)
	skipnz
	subwf	(main@uiTimerOneP5s)^080h,w
	skipc
	goto	u2221
	goto	u2220
u2221:
	goto	l4412
u2220:
	line	826
	
l4406:	
;main.c: 825: {
;main.c: 826: setPB3(0);
	movlw	(0)
	fcall	_setPB3
	line	827
;main.c: 827: setPB4(1);
	movlw	(01h)
	fcall	_setPB4
	line	828
;main.c: 828: setPB5(0);
	movlw	(0)
	fcall	_setPB5
	line	830
	
l4408:	
;main.c: 830: uiTimerOneP5s = 0;
	bsf	status, 5	;RP0=1, select bank1
	clrf	(main@uiTimerOneP5s)^080h
	clrf	(main@uiTimerOneP5s+1)^080h
	line	831
	
l4410:	
;main.c: 831: uiTimerTwoP5s = 0;
	clrf	(main@uiTimerTwoP5s)^080h
	clrf	(main@uiTimerTwoP5s+1)^080h
	line	832
;main.c: 832: }
	goto	l4304
	line	835
	
l4412:	
;main.c: 833: else
;main.c: 834: {
;main.c: 835: if( uiCh13Value < 90 )
	movlw	high(05Ah)
	subwf	(main@uiCh13Value+1)^080h,w
	movlw	low(05Ah)
	skipnz
	subwf	(main@uiCh13Value)^080h,w
	skipnc
	goto	u2231
	goto	u2230
u2231:
	goto	l4418
u2230:
	line	837
	
l4414:	
;main.c: 836: {
;main.c: 837: if( uiTimerTwoP5s <= 5)
	movlw	high(06h)
	subwf	(main@uiTimerTwoP5s+1)^080h,w
	movlw	low(06h)
	skipnz
	subwf	(main@uiTimerTwoP5s)^080h,w
	skipnc
	goto	u2241
	goto	u2240
u2241:
	goto	l4420
u2240:
	line	838
	
l4416:	
;main.c: 838: uiTimerTwoP5s++;
	incf	(main@uiTimerTwoP5s)^080h,f
	skipnz
	incf	(main@uiTimerTwoP5s+1)^080h,f
	goto	l4420
	line	842
	
l4418:	
;main.c: 840: else
;main.c: 841: {
;main.c: 842: uiTimerTwoP5s = 0;
	clrf	(main@uiTimerTwoP5s)^080h
	clrf	(main@uiTimerTwoP5s+1)^080h
	line	843
;main.c: 843: uiTimerThreeP5s = 0;
	clrf	(main@uiTimerThreeP5s)^080h
	clrf	(main@uiTimerThreeP5s+1)^080h
	line	846
	
l4420:	
;main.c: 844: }
;main.c: 846: if(uiTimerTwoP5s > 5)
	movlw	high(06h)
	subwf	(main@uiTimerTwoP5s+1)^080h,w
	movlw	low(06h)
	skipnz
	subwf	(main@uiTimerTwoP5s)^080h,w
	skipc
	goto	u2251
	goto	u2250
u2251:
	goto	l4304
u2250:
	line	848
	
l4422:	
;main.c: 847: {
;main.c: 848: setPB3(1);
	movlw	(01h)
	fcall	_setPB3
	line	849
;main.c: 849: setPB4(0);
	movlw	(0)
	fcall	_setPB4
	line	850
;main.c: 850: setPB5(1);
	movlw	(01h)
	fcall	_setPB5
	line	852
	
l4424:	
;main.c: 852: if(uiCh13Value < 25)
	movlw	high(019h)
	bsf	status, 5	;RP0=1, select bank1
	subwf	(main@uiCh13Value+1)^080h,w
	movlw	low(019h)
	skipnz
	subwf	(main@uiCh13Value)^080h,w
	skipnc
	goto	u2261
	goto	u2260
u2261:
	goto	l4428
u2260:
	line	853
	
l4426:	
;main.c: 853: uiTimerThreeP5s++;
	incf	(main@uiTimerThreeP5s)^080h,f
	skipnz
	incf	(main@uiTimerThreeP5s+1)^080h,f
	goto	l4430
	line	855
	
l4428:	
;main.c: 854: else
;main.c: 855: uiTimerThreeP5s = 0;
	clrf	(main@uiTimerThreeP5s)^080h
	clrf	(main@uiTimerThreeP5s+1)^080h
	line	857
	
l4430:	
;main.c: 857: if(uiTimerThreeP5s > 5)
	movlw	high(06h)
	subwf	(main@uiTimerThreeP5s+1)^080h,w
	movlw	low(06h)
	skipnz
	subwf	(main@uiTimerThreeP5s)^080h,w
	skipc
	goto	u2271
	goto	u2270
u2271:
	goto	l758
u2270:
	line	858
	
l4432:	
;main.c: 858: reset();
	fcall	_reset
	goto	l4304
	line	868
	
l4434:	
;main.c: 867: {
;main.c: 868: setPB3(0);
	movlw	(0)
	fcall	_setPB3
	line	869
;main.c: 869: setPB4(0);
	movlw	(0)
	fcall	_setPB4
	line	870
;main.c: 870: setPB5(1);
	movlw	(01h)
	fcall	_setPB5
	line	874
	
l4436:	
;main.c: 874: ucStep = DELAY_ONE_SECOND_FOR_PWM;
	movlw	(064h)
	bsf	status, 5	;RP0=1, select bank1
	movwf	(main@ucStep)^080h
	line	875
;main.c: 875: break;
	goto	l4304
	line	881
	
l4438:	
;main.c: 879: {
;main.c: 880: static unsigned ucDelay1s = 0;
;main.c: 881: if(ucDelay1s < 10)
	movlw	high(0Ah)
	subwf	(main@ucDelay1s+1)^080h,w
	movlw	low(0Ah)
	skipnz
	subwf	(main@ucDelay1s)^080h,w
	skipnc
	goto	u2281
	goto	u2280
u2281:
	goto	l4442
u2280:
	line	882
	
l4440:	
;main.c: 882: ucDelay1s++;
	incf	(main@ucDelay1s)^080h,f
	skipnz
	incf	(main@ucDelay1s+1)^080h,f
	goto	l4304
	line	885
	
l4442:	
;main.c: 883: else
;main.c: 884: {
;main.c: 885: ucDelay1s = 0;
	clrf	(main@ucDelay1s)^080h
	clrf	(main@ucDelay1s+1)^080h
	line	886
	
l4444:	
;main.c: 886: ucStep = MEET_RESET_CONDITION_STEP;
	movlw	(065h)
	movwf	(main@ucStep)^080h
	goto	l4304
	line	898
	
l4446:	
;main.c: 896: {
;main.c: 897: static unsigned char ucTimerP5s = 0;
;main.c: 898: unsigned int ucChValue = getAdOriginalCh13Value();
	fcall	_getAdOriginalCh13Value
	movf	(1+(?_getAdOriginalCh13Value))^080h,w
	movwf	(main@ucChValue+1)^080h
	movf	(0+(?_getAdOriginalCh13Value))^080h,w
	movwf	(main@ucChValue)^080h
	line	900
	
l4448:	
;main.c: 900: if( ucChValue > 50 )
	movlw	high(033h)
	subwf	(main@ucChValue+1)^080h,w
	movlw	low(033h)
	skipnz
	subwf	(main@ucChValue)^080h,w
	skipc
	goto	u2291
	goto	u2290
u2291:
	goto	l4452
u2290:
	line	901
	
l4450:	
;main.c: 901: ucTimerP5s++;
	incf	(main@cTimerP5s_797)^080h,f
	goto	l4454
	line	903
	
l4452:	
;main.c: 902: else
;main.c: 903: ucTimerP5s = 0;
	clrf	(main@cTimerP5s_797)^080h
	line	905
	
l4454:	
;main.c: 905: if(ucTimerP5s > 5)
	movlw	(06h)
	subwf	(main@cTimerP5s_797)^080h,w
	skipc
	goto	u2301
	goto	u2300
u2301:
	goto	l758
u2300:
	line	906
	
l4456:	
;main.c: 906: ucStep = RESET_STEP;
	movlw	(066h)
	movwf	(main@ucStep)^080h
	goto	l4304
	line	912
	
l4458:	
;main.c: 911: {
;main.c: 912: ucStep = INIT_STEP;
	clrf	(main@ucStep)^080h
	goto	l4432
	line	668
	
l4464:	
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
	goto	l4312
	xorlw	1^0	; case 1
	skipnz
	goto	l4330
	xorlw	2^1	; case 2
	skipnz
	goto	l4338
	xorlw	3^2	; case 3
	skipnz
	goto	l4354
	xorlw	4^3	; case 4
	skipnz
	goto	l4358
	xorlw	5^4	; case 5
	skipnz
	goto	l4374
	xorlw	6^5	; case 6
	skipnz
	goto	l4386
	xorlw	99^6	; case 99
	skipnz
	goto	l4434
	xorlw	100^99	; case 100
	skipnz
	goto	l4438
	xorlw	101^100	; case 101
	skipnz
	goto	l4446
	xorlw	102^101	; case 102
	skipnz
	goto	l4458
	goto	l758
	opt asmopt_on

	global	start
	ljmp	start
	opt stack 0
psect	maintext
	line	925
GLOBAL	__end_of_main
	__end_of_main:
;; =============== function _main ends ============

	signat	_main,90
	global	_getAdOriginalCh13Value
psect	text1231,local,class=CODE,delta=2
global __ptext1231
__ptext1231:

;; *************** function _getAdOriginalCh13Value *****************
;; Defined at:
;;		line 324 in file "D:\develop\190625\AK7030-OTP\common.c"
;; Parameters:    Size  Location     Type
;;		None
;; Auto vars:     Size  Location     Type
;;		None
;; Return value:  Size  Location     Type
;;                  2   34[BANK1 ] unsigned int 
;; Registers used:
;;		wreg, fsr0l, fsr0h, status,2, status,0, btemp+1, pclath, cstack
;; Tracked objects:
;;		On entry : 40/20
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
;;		_Filter
;; This function is called by:
;;		_main
;; This function uses a non-reentrant model
;;
psect	text1231
	file	"D:\develop\190625\AK7030-OTP\common.c"
	line	324
	global	__size_of_getAdOriginalCh13Value
	__size_of_getAdOriginalCh13Value	equ	__end_of_getAdOriginalCh13Value-_getAdOriginalCh13Value
	
_getAdOriginalCh13Value:	
	opt	stack 3
; Regs used in _getAdOriginalCh13Value: [wreg-fsr0h+status,2+status,0+btemp+1+pclath+cstack]
	line	326
	
l4288:	
;common.c: 326: return Filter(uiSampleChannelFourth);
	movlw	(_uiSampleChannelFourth&0ffh)
	bsf	status, 5	;RP0=1, select bank1
	movwf	(?_Filter)^080h
	movlw	(0x0/2)
	movwf	(?_Filter+1)^080h
	fcall	_Filter
	movf	(1+(?_Filter))^080h,w
	movwf	(?_getAdOriginalCh13Value+1)^080h
	movf	(0+(?_Filter))^080h,w
	movwf	(?_getAdOriginalCh13Value)^080h
	line	331
	
l1579:	
	return
	opt stack 0
GLOBAL	__end_of_getAdOriginalCh13Value
	__end_of_getAdOriginalCh13Value:
;; =============== function _getAdOriginalCh13Value ends ============

	signat	_getAdOriginalCh13Value,90
	global	_process_AD_Converter_Value
psect	text1232,local,class=CODE,delta=2
global __ptext1232
__ptext1232:

;; *************** function _process_AD_Converter_Value *****************
;; Defined at:
;;		line 346 in file "D:\develop\190625\AK7030-OTP\common.c"
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
psect	text1232
	file	"D:\develop\190625\AK7030-OTP\common.c"
	line	346
	global	__size_of_process_AD_Converter_Value
	__size_of_process_AD_Converter_Value	equ	__end_of_process_AD_Converter_Value-_process_AD_Converter_Value
	
_process_AD_Converter_Value:	
	opt	stack 3
; Regs used in _process_AD_Converter_Value: [wreg+status,2+status,0+pclath+cstack]
	line	347
	
l4276:	
;common.c: 347: if(getAD_ConvertFlag())
	fcall	_getAD_ConvertFlag
	xorlw	0
	skipnz
	goto	u2071
	goto	u2070
u2071:
	goto	l1588
u2070:
	line	349
	
l4278:	
;common.c: 348: {
;common.c: 349: setAD_ConvertFlag(0);
	movlw	(0)
	fcall	_setAD_ConvertFlag
	line	350
;common.c: 350: AD_Sample();
	fcall	_AD_Sample
	line	351
	
l4280:	
;common.c: 351: if(12 == sampleChannelSelect)
	bsf	status, 5	;RP0=1, select bank1
	movf	(_sampleChannelSelect)^080h,w
	xorlw	0Ch
	skipz
	goto	u2081
	goto	u2080
u2081:
	goto	l4284
u2080:
	line	352
	
l4282:	
;common.c: 352: adc_test_init(12,3);
	movlw	(03h)
	movwf	(?_adc_test_init)^080h
	movlw	(0Ch)
	fcall	_adc_test_init
	goto	l4286
	line	354
	
l4284:	
;common.c: 353: else
;common.c: 354: adc_test_init(13,3);
	movlw	(03h)
	movwf	(?_adc_test_init)^080h
	movlw	(0Dh)
	fcall	_adc_test_init
	line	355
	
l4286:	
;common.c: 355: adc_start();
	fcall	_adc_start
	line	357
	
l1588:	
	return
	opt stack 0
GLOBAL	__end_of_process_AD_Converter_Value
	__end_of_process_AD_Converter_Value:
;; =============== function _process_AD_Converter_Value ends ============

	signat	_process_AD_Converter_Value,88
	global	_setPinInitVaule
psect	text1233,local,class=CODE,delta=2
global __ptext1233
__ptext1233:

;; *************** function _setPinInitVaule *****************
;; Defined at:
;;		line 287 in file "D:\develop\190625\AK7030-OTP\main.c"
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
psect	text1233
	file	"D:\develop\190625\AK7030-OTP\main.c"
	line	287
	global	__size_of_setPinInitVaule
	__size_of_setPinInitVaule	equ	__end_of_setPinInitVaule-_setPinInitVaule
	
_setPinInitVaule:	
	opt	stack 3
; Regs used in _setPinInitVaule: [wreg+status,2+status,0+pclath+cstack]
	line	289
	
l4274:	
;main.c: 289: setPB3(1);
	movlw	(01h)
	fcall	_setPB3
	line	290
;main.c: 290: setPB4(0);
	movlw	(0)
	fcall	_setPB4
	line	291
;main.c: 291: setPB5(1);
	movlw	(01h)
	fcall	_setPB5
	line	295
	
l721:	
	return
	opt stack 0
GLOBAL	__end_of_setPinInitVaule
	__end_of_setPinInitVaule:
;; =============== function _setPinInitVaule ends ============

	signat	_setPinInitVaule,88
	global	_initPin
psect	text1234,local,class=CODE,delta=2
global __ptext1234
__ptext1234:

;; *************** function _initPin *****************
;; Defined at:
;;		line 271 in file "D:\develop\190625\AK7030-OTP\main.c"
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
psect	text1234
	file	"D:\develop\190625\AK7030-OTP\main.c"
	line	271
	global	__size_of_initPin
	__size_of_initPin	equ	__end_of_initPin-_initPin
	
_initPin:	
	opt	stack 3
; Regs used in _initPin: [wreg+status,2+status,0+pclath+cstack]
	line	273
	
l4266:	
;main.c: 273: initPB2_AsHighResistence();
	fcall	_initPB2_AsHighResistence
	line	275
	
l4268:	
;main.c: 275: initPB3(0);
	movlw	(0)
	fcall	_initPB3
	line	277
	
l4270:	
;main.c: 277: initPB4(0);
	movlw	(0)
	fcall	_initPB4
	line	279
	
l4272:	
;main.c: 279: initPB5(0);
	movlw	(0)
	fcall	_initPB5
	line	284
	
l718:	
	return
	opt stack 0
GLOBAL	__end_of_initPin
	__end_of_initPin:
;; =============== function _initPin ends ============

	signat	_initPin,88
	global	_AD_Sample
psect	text1235,local,class=CODE,delta=2
global __ptext1235
__ptext1235:

;; *************** function _AD_Sample *****************
;; Defined at:
;;		line 369 in file "D:\develop\190625\AK7030-OTP\common.c"
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
;;		Nothing
;; This function is called by:
;;		_process_AD_Converter_Value
;; This function uses a non-reentrant model
;;
psect	text1235
	file	"D:\develop\190625\AK7030-OTP\common.c"
	line	369
	global	__size_of_AD_Sample
	__size_of_AD_Sample	equ	__end_of_AD_Sample-_AD_Sample
	
_AD_Sample:	
	opt	stack 3
; Regs used in _AD_Sample: [wreg+status,2+status,0]
	line	370
	
l4252:	
;common.c: 370: if(sampleTimes < 10)
	movlw	(0Ah)
	subwf	(_sampleTimes),w
	skipnc
	goto	u2041
	goto	u2040
u2041:
	goto	l1595
u2040:
	line	372
	
l4254:	
;common.c: 371: {
;common.c: 372: sampleTimes++;
	incf	(_sampleTimes),f
	line	374
	
l4256:	
;common.c: 374: if(sampleTimes >= 10)
	movlw	(0Ah)
	subwf	(_sampleTimes),w
	skipc
	goto	u2051
	goto	u2050
u2051:
	goto	l1595
u2050:
	line	376
	
l4258:	
;common.c: 375: {
;common.c: 376: sampleTimes = 0;
	clrf	(_sampleTimes)
	line	378
	
l4260:	
;common.c: 378: if(sampleChannelSelect == 12)
	bsf	status, 5	;RP0=1, select bank1
	movf	(_sampleChannelSelect)^080h,w
	xorlw	0Ch
	skipz
	goto	u2061
	goto	u2060
u2061:
	goto	l4264
u2060:
	line	380
	
l4262:	
;common.c: 379: {
;common.c: 380: sampleChannelSelect = 13;
	movlw	(0Dh)
	movwf	(_sampleChannelSelect)^080h
	line	381
;common.c: 381: }
	goto	l1595
	line	385
	
l4264:	
;common.c: 383: else
;common.c: 384: {
;common.c: 385: sampleChannelSelect = 12;
	movlw	(0Ch)
	movwf	(_sampleChannelSelect)^080h
	line	389
	
l1595:	
	return
	opt stack 0
GLOBAL	__end_of_AD_Sample
	__end_of_AD_Sample:
;; =============== function _AD_Sample ends ============

	signat	_AD_Sample,88
	global	_setAD_ConvertFlag
psect	text1236,local,class=CODE,delta=2
global __ptext1236
__ptext1236:

;; *************** function _setAD_ConvertFlag *****************
;; Defined at:
;;		line 301 in file "D:\develop\190625\AK7030-OTP\common.c"
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
psect	text1236
	file	"D:\develop\190625\AK7030-OTP\common.c"
	line	301
	global	__size_of_setAD_ConvertFlag
	__size_of_setAD_ConvertFlag	equ	__end_of_setAD_ConvertFlag-_setAD_ConvertFlag
	
_setAD_ConvertFlag:	
	opt	stack 3
; Regs used in _setAD_ConvertFlag: [wreg]
;setAD_ConvertFlag@flag stored from wreg
	bsf	status, 5	;RP0=1, select bank1
	movwf	(setAD_ConvertFlag@flag)^080h
	line	302
	
l4250:	
;common.c: 302: adc_convert_flag = flag;
	movf	(setAD_ConvertFlag@flag)^080h,w
	bcf	status, 5	;RP0=0, select bank0
	movwf	(_adc_convert_flag)
	line	303
	
l1573:	
	return
	opt stack 0
GLOBAL	__end_of_setAD_ConvertFlag
	__end_of_setAD_ConvertFlag:
;; =============== function _setAD_ConvertFlag ends ============

	signat	_setAD_ConvertFlag,4216
	global	_getAD_ConvertFlag
psect	text1237,local,class=CODE,delta=2
global __ptext1237
__ptext1237:

;; *************** function _getAD_ConvertFlag *****************
;; Defined at:
;;		line 295 in file "D:\develop\190625\AK7030-OTP\common.c"
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
psect	text1237
	file	"D:\develop\190625\AK7030-OTP\common.c"
	line	295
	global	__size_of_getAD_ConvertFlag
	__size_of_getAD_ConvertFlag	equ	__end_of_getAD_ConvertFlag-_getAD_ConvertFlag
	
_getAD_ConvertFlag:	
	opt	stack 3
; Regs used in _getAD_ConvertFlag: [wreg]
	line	296
	
l4246:	
;common.c: 296: return adc_convert_flag;
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	movf	(_adc_convert_flag),w
	line	297
	
l1570:	
	return
	opt stack 0
GLOBAL	__end_of_getAD_ConvertFlag
	__end_of_getAD_ConvertFlag:
;; =============== function _getAD_ConvertFlag ends ============

	signat	_getAD_ConvertFlag,89
	global	_Filter
psect	text1238,local,class=CODE,delta=2
global __ptext1238
__ptext1238:

;; *************** function _Filter *****************
;; Defined at:
;;		line 64 in file "D:\develop\190625\AK7030-OTP\common.c"
;; Parameters:    Size  Location     Type
;;  tmpValue        2    0[BANK1 ] PTR int 
;;		 -> uiSampleChannelFourteenth(20), uiSampleChannelFourth(20), uiSampleChannelFirst(20), 
;; Auto vars:     Size  Location     Type
;;  cir             2   30[BANK1 ] int 
;;  filter_buf     20    6[BANK1 ] unsigned int [10]
;;  filter_sum      2   28[BANK1 ] unsigned int 
;;  filter_temp     2   26[BANK1 ] unsigned int 
;;  i               1   33[BANK1 ] unsigned char 
;;  j               1   32[BANK1 ] unsigned char 
;; Return value:  Size  Location     Type
;;                  2    0[BANK1 ] unsigned int 
;; Registers used:
;;		wreg, fsr0l, fsr0h, status,2, status,0, btemp+1
;; Tracked objects:
;;		On entry : 60/20
;;		On exit  : 160/20
;;		Unchanged: FFE00/0
;; Data sizes:     COMMON   BANK0   BANK1   BANK3   BANK2
;;      Params:         0       0       2       0       0
;;      Locals:         0       0      28       0       0
;;      Temps:          0       0       4       0       0
;;      Totals:         0       0      34       0       0
;;Total ram usage:       34 bytes
;; Hardware stack levels used:    1
;; Hardware stack levels required when called:    3
;; This function calls:
;;		Nothing
;; This function is called by:
;;		_getAdOriginalCh13Value
;; This function uses a non-reentrant model
;;
psect	text1238
	file	"D:\develop\190625\AK7030-OTP\common.c"
	line	64
	global	__size_of_Filter
	__size_of_Filter	equ	__end_of_Filter-_Filter
	
_Filter:	
	opt	stack 3
; Regs used in _Filter: [wreg-fsr0h+status,2+status,0+btemp+1]
	line	66
	
l3622:	
	clrf	(Filter@j)^080h
	line	68
;common.c: 68: unsigned int filter_temp = 0, filter_sum = 0;
	clrf	(Filter@filter_temp)^080h
	clrf	(Filter@filter_temp+1)^080h
	clrf	(Filter@filter_sum)^080h
	clrf	(Filter@filter_sum+1)^080h
	line	72
;common.c: 70: unsigned int filter_buf[10];
;common.c: 72: for(int cir = 0;cir < 10; cir++)
	clrf	(Filter@cir)^080h
	clrf	(Filter@cir+1)^080h
	line	73
	
l3628:	
;common.c: 73: filter_buf[cir] = *tmpValue++;
	bsf	status, 5	;RP0=1, select bank1
	bcf	status, 6	;RP1=0, select bank1
	movf	(Filter@tmpValue)^080h,w
	movwf	fsr0
	bsf	status,7
	btfss	(Filter@tmpValue+1)^080h,0
	bcf	status,7
	movf	indf,w
	movwf	(??_Filter+0)^080h+0+0
	incf	fsr0,f
	movf	indf,w
	movwf	(??_Filter+0)^080h+0+1
	clrc
	rlf	(Filter@cir)^080h,w
	addlw	Filter@filter_buf&0ffh
	movwf	fsr0
	movf	0+(??_Filter+0)^080h+0,w
	bcf	status, 7	;select IRP bank1
	movwf	indf
	incf	fsr0,f
	movf	1+(??_Filter+0)^080h+0,w
	movwf	indf
	
l3630:	
	movlw	02h
	addwf	(Filter@tmpValue)^080h,f
	skipnc
	incf	(Filter@tmpValue+1)^080h,f
	line	72
	
l3632:	
	incf	(Filter@cir)^080h,f
	skipnz
	incf	(Filter@cir+1)^080h,f
	
l3634:	
	movf	(Filter@cir+1)^080h,w
	xorlw	80h
	movwf	btemp+1
	movlw	(high(0Ah))^80h
	subwf	btemp+1,w
	skipz
	goto	u1185
	movlw	low(0Ah)
	subwf	(Filter@cir)^080h,w
u1185:

	skipc
	goto	u1181
	goto	u1180
u1181:
	goto	l3628
u1180:
	line	77
	
l3636:	
;common.c: 77: for(j = 0; j < 10 - 1; j++)
	bsf	status, 5	;RP0=1, select bank1
	bcf	status, 6	;RP1=0, select bank1
	clrf	(Filter@j)^080h
	line	79
	
l3642:	
;common.c: 78: {
;common.c: 79: for(i = 0; i < 10 - 1 - j; i++)
	clrf	(Filter@i)^080h
	goto	l3650
	line	81
	
l3644:	
;common.c: 80: {
;common.c: 81: if(filter_buf[i] > filter_buf[i + 1])
	bsf	status, 5	;RP0=1, select bank1
	bcf	status, 6	;RP1=0, select bank1
	clrc
	rlf	(Filter@i)^080h,w
	addlw	Filter@filter_buf&0ffh
	movwf	fsr0
	bcf	status, 7	;select IRP bank1
	movf	indf,w
	movwf	(??_Filter+0)^080h+0+0
	incf	fsr0,f
	movf	indf,w
	movwf	(??_Filter+0)^080h+0+1
	clrc
	rlf	(Filter@i)^080h,w
	addlw	02h
	addlw	Filter@filter_buf&0ffh
	movwf	fsr0
	movf	indf,w
	movwf	(??_Filter+2)^080h+0+0
	incf	fsr0,f
	movf	indf,w
	movwf	(??_Filter+2)^080h+0+1
	movf	1+(??_Filter+0)^080h+0,w
	subwf	1+(??_Filter+2)^080h+0,w
	skipz
	goto	u1195
	movf	0+(??_Filter+0)^080h+0,w
	subwf	0+(??_Filter+2)^080h+0,w
u1195:
	skipnc
	goto	u1191
	goto	u1190
u1191:
	goto	l3648
u1190:
	line	84
	
l3646:	
;common.c: 82: {
;common.c: 84: filter_temp = filter_buf[i];
	clrc
	rlf	(Filter@i)^080h,w
	addlw	Filter@filter_buf&0ffh
	movwf	fsr0
	movf	indf,w
	movwf	(Filter@filter_temp)^080h
	incf	fsr0,f
	movf	indf,w
	movwf	(Filter@filter_temp+1)^080h
	line	86
;common.c: 86: filter_buf[i] = filter_buf[i + 1];
	clrc
	rlf	(Filter@i)^080h,w
	addlw	02h
	addlw	Filter@filter_buf&0ffh
	movwf	fsr0
	movf	indf,w
	movwf	(??_Filter+0)^080h+0+0
	incf	fsr0,f
	movf	indf,w
	movwf	(??_Filter+0)^080h+0+1
	clrc
	rlf	(Filter@i)^080h,w
	addlw	Filter@filter_buf&0ffh
	movwf	fsr0
	movf	0+(??_Filter+0)^080h+0,w
	movwf	indf
	incf	fsr0,f
	movf	1+(??_Filter+0)^080h+0,w
	movwf	indf
	line	88
;common.c: 88: filter_buf[i + 1] = filter_temp;
	clrc
	rlf	(Filter@i)^080h,w
	addlw	02h
	addlw	Filter@filter_buf&0ffh
	movwf	fsr0
	movf	(Filter@filter_temp)^080h,w
	movwf	indf
	incf	fsr0,f
	movf	(Filter@filter_temp+1)^080h,w
	movwf	indf
	line	79
	
l3648:	
	incf	(Filter@i)^080h,f
	
l3650:	
	movlw	high(09h)
	movwf	(??_Filter+0)^080h+0+1
	movf	(Filter@j)^080h,w
	sublw	low(09h)
	movwf	(??_Filter+0)^080h+0
	skipc
	decf	(??_Filter+0)^080h+0+1,f
	movf	1+(??_Filter+0)^080h+0,w
	xorlw	80h
	sublw	080h
	skipz
	goto	u1205
	movf	0+(??_Filter+0)^080h+0,w
	subwf	(Filter@i)^080h,w
u1205:

	skipc
	goto	u1201
	goto	u1200
u1201:
	goto	l3644
u1200:
	line	77
	
l3652:	
	bsf	status, 5	;RP0=1, select bank1
	bcf	status, 6	;RP1=0, select bank1
	incf	(Filter@j)^080h,f
	
l3654:	
	movlw	(09h)
	subwf	(Filter@j)^080h,w
	skipc
	goto	u1211
	goto	u1210
u1211:
	goto	l3642
u1210:
	
l1503:	
	line	93
;common.c: 89: }
;common.c: 90: }
;common.c: 91: }
;common.c: 93: for(i = 1; i < 10 - 1; i++)
	clrf	(Filter@i)^080h
	incf	(Filter@i)^080h,f
	line	95
	
l3660:	
;common.c: 94: {
;common.c: 95: filter_sum += filter_buf[i];
	clrc
	rlf	(Filter@i)^080h,w
	addlw	Filter@filter_buf&0ffh
	movwf	fsr0
	bcf	status, 7	;select IRP bank1
	movf	indf,w
	movwf	(??_Filter+0)^080h+0+0
	incf	fsr0,f
	movf	indf,w
	movwf	(??_Filter+0)^080h+0+1
	movf	0+(??_Filter+0)^080h+0,w
	addwf	(Filter@filter_sum)^080h,f
	skipnc
	incf	(Filter@filter_sum+1)^080h,f
	movf	1+(??_Filter+0)^080h+0,w
	addwf	(Filter@filter_sum+1)^080h,f
	line	93
	
l3662:	
	incf	(Filter@i)^080h,f
	
l3664:	
	movlw	(09h)
	subwf	(Filter@i)^080h,w
	skipc
	goto	u1221
	goto	u1220
u1221:
	goto	l3660
u1220:
	line	98
	
l3666:	
;common.c: 96: }
;common.c: 98: return (filter_sum >> 3);
	movf	(Filter@filter_sum+1)^080h,w
	movwf	(?_Filter+1)^080h
	movf	(Filter@filter_sum)^080h,w
	movwf	(?_Filter)^080h
	
l3668:	
	clrc
	rrf	(?_Filter+1)^080h,f
	rrf	(?_Filter)^080h,f
	clrc
	rrf	(?_Filter+1)^080h,f
	rrf	(?_Filter)^080h,f
	clrc
	rrf	(?_Filter+1)^080h,f
	rrf	(?_Filter)^080h,f
	line	100
	
l1510:	
	return
	opt stack 0
GLOBAL	__end_of_Filter
	__end_of_Filter:
;; =============== function _Filter ends ============

	signat	_Filter,4218
	global	_isFinishedOneHoursTimer
psect	text1239,local,class=CODE,delta=2
global __ptext1239
__ptext1239:

;; *************** function _isFinishedOneHoursTimer *****************
;; Defined at:
;;		line 542 in file "D:\develop\190625\AK7030-OTP\common.c"
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
;;		Nothing
;; This function is called by:
;;		_main
;; This function uses a non-reentrant model
;;
psect	text1239
	file	"D:\develop\190625\AK7030-OTP\common.c"
	line	542
	global	__size_of_isFinishedOneHoursTimer
	__size_of_isFinishedOneHoursTimer	equ	__end_of_isFinishedOneHoursTimer-_isFinishedOneHoursTimer
	
_isFinishedOneHoursTimer:	
	opt	stack 4
; Regs used in _isFinishedOneHoursTimer: [wreg+status,2+status,0]
	line	543
	
l4230:	
;common.c: 543: if((uiOneHourTimer == 0) && bOneHourTimerStartFlag)
	movf	((_uiOneHourTimer+1)^080h),w
	iorwf	((_uiOneHourTimer)^080h),w
	skipz
	goto	u2021
	goto	u2020
u2021:
	goto	l4242
u2020:
	
l4232:	
	movf	(_bOneHourTimerStartFlag)^080h,w
	skipz
	goto	u2030
	goto	l4242
u2030:
	line	545
	
l4234:	
;common.c: 544: {
;common.c: 545: bOneHourTimerStartFlag = 0;
	clrf	(_bOneHourTimerStartFlag)^080h
	line	546
	
l4236:	
;common.c: 546: return 1;
	movlw	(01h)
	goto	l1657
	line	549
	
l4242:	
;common.c: 548: else
;common.c: 549: return 0;
	movlw	(0)
	line	550
	
l1657:	
	return
	opt stack 0
GLOBAL	__end_of_isFinishedOneHoursTimer
	__end_of_isFinishedOneHoursTimer:
;; =============== function _isFinishedOneHoursTimer ends ============

	signat	_isFinishedOneHoursTimer,89
	global	_startOneHoursTimer
psect	text1240,local,class=CODE,delta=2
global __ptext1240
__ptext1240:

;; *************** function _startOneHoursTimer *****************
;; Defined at:
;;		line 459 in file "D:\develop\190625\AK7030-OTP\common.c"
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
;;		On exit  : 60/20
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
psect	text1240
	file	"D:\develop\190625\AK7030-OTP\common.c"
	line	459
	global	__size_of_startOneHoursTimer
	__size_of_startOneHoursTimer	equ	__end_of_startOneHoursTimer-_startOneHoursTimer
	
_startOneHoursTimer:	
	opt	stack 4
; Regs used in _startOneHoursTimer: [wreg+status,2+status,0]
	line	460
	
l4222:	
;common.c: 460: if(( 0 == uiOneHourTimer ) && ( 0 == bOneHourTimerStartFlag ))
	movf	((_uiOneHourTimer+1)^080h),w
	iorwf	((_uiOneHourTimer)^080h),w
	skipz
	goto	u2001
	goto	u2000
u2001:
	goto	l1625
u2000:
	
l4224:	
	movf	(_bOneHourTimerStartFlag)^080h,f
	skipz
	goto	u2011
	goto	u2010
u2011:
	goto	l1625
u2010:
	line	462
	
l4226:	
;common.c: 461: {
;common.c: 462: uiOneHourTimer = uiSetTime;
	movf	(startOneHoursTimer@uiSetTime+1)^080h,w
	movwf	(_uiOneHourTimer+1)^080h
	movf	(startOneHoursTimer@uiSetTime)^080h,w
	movwf	(_uiOneHourTimer)^080h
	line	463
	
l4228:	
;common.c: 463: bOneHourTimerStartFlag = 1;
	clrf	(_bOneHourTimerStartFlag)^080h
	incf	(_bOneHourTimerStartFlag)^080h,f
	line	469
	
l1625:	
	return
	opt stack 0
GLOBAL	__end_of_startOneHoursTimer
	__end_of_startOneHoursTimer:
;; =============== function _startOneHoursTimer ends ============

	signat	_startOneHoursTimer,4216
	global	_isFinishedThreeHoursTimer
psect	text1241,local,class=CODE,delta=2
global __ptext1241
__ptext1241:

;; *************** function _isFinishedThreeHoursTimer *****************
;; Defined at:
;;		line 529 in file "D:\develop\190625\AK7030-OTP\common.c"
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
;;		Nothing
;; This function is called by:
;;		_main
;; This function uses a non-reentrant model
;;
psect	text1241
	file	"D:\develop\190625\AK7030-OTP\common.c"
	line	529
	global	__size_of_isFinishedThreeHoursTimer
	__size_of_isFinishedThreeHoursTimer	equ	__end_of_isFinishedThreeHoursTimer-_isFinishedThreeHoursTimer
	
_isFinishedThreeHoursTimer:	
	opt	stack 4
; Regs used in _isFinishedThreeHoursTimer: [wreg+status,2+status,0]
	line	530
	
l4206:	
;common.c: 530: if((uiSmallTimer == 0) && bSmallTimerStartFlag)
	bsf	status, 5	;RP0=1, select bank1
	movf	((_uiSmallTimer+1)^080h),w
	iorwf	((_uiSmallTimer)^080h),w
	skipz
	goto	u1981
	goto	u1980
u1981:
	goto	l4218
u1980:
	
l4208:	
	movf	(_bSmallTimerStartFlag)^080h,w
	skipz
	goto	u1990
	goto	l4218
u1990:
	line	532
	
l4210:	
;common.c: 531: {
;common.c: 532: bSmallTimerStartFlag = 0;
	clrf	(_bSmallTimerStartFlag)^080h
	line	533
	
l4212:	
;common.c: 533: return 1;
	movlw	(01h)
	goto	l1652
	line	536
	
l4218:	
;common.c: 535: else
;common.c: 536: return 0;
	movlw	(0)
	line	537
	
l1652:	
	return
	opt stack 0
GLOBAL	__end_of_isFinishedThreeHoursTimer
	__end_of_isFinishedThreeHoursTimer:
;; =============== function _isFinishedThreeHoursTimer ends ============

	signat	_isFinishedThreeHoursTimer,89
	global	_startThreeHoursTimer
psect	text1242,local,class=CODE,delta=2
global __ptext1242
__ptext1242:

;; *************** function _startThreeHoursTimer *****************
;; Defined at:
;;		line 446 in file "D:\develop\190625\AK7030-OTP\common.c"
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
;;		On exit  : 60/20
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
psect	text1242
	file	"D:\develop\190625\AK7030-OTP\common.c"
	line	446
	global	__size_of_startThreeHoursTimer
	__size_of_startThreeHoursTimer	equ	__end_of_startThreeHoursTimer-_startThreeHoursTimer
	
_startThreeHoursTimer:	
	opt	stack 4
; Regs used in _startThreeHoursTimer: [wreg+status,2+status,0]
	line	447
	
l4198:	
;common.c: 447: if(( 0 == uiSmallTimer ) && ( 0 == bSmallTimerStartFlag ))
	movf	((_uiSmallTimer+1)^080h),w
	iorwf	((_uiSmallTimer)^080h),w
	skipz
	goto	u1961
	goto	u1960
u1961:
	goto	l1621
u1960:
	
l4200:	
	movf	(_bSmallTimerStartFlag)^080h,f
	skipz
	goto	u1971
	goto	u1970
u1971:
	goto	l1621
u1970:
	line	449
	
l4202:	
;common.c: 448: {
;common.c: 449: uiSmallTimer = uiSetTime;
	movf	(startThreeHoursTimer@uiSetTime+1)^080h,w
	movwf	(_uiSmallTimer+1)^080h
	movf	(startThreeHoursTimer@uiSetTime)^080h,w
	movwf	(_uiSmallTimer)^080h
	line	450
	
l4204:	
;common.c: 450: bSmallTimerStartFlag = 1;
	clrf	(_bSmallTimerStartFlag)^080h
	incf	(_bSmallTimerStartFlag)^080h,f
	line	456
	
l1621:	
	return
	opt stack 0
GLOBAL	__end_of_startThreeHoursTimer
	__end_of_startThreeHoursTimer:
;; =============== function _startThreeHoursTimer ends ============

	signat	_startThreeHoursTimer,4216
	global	_isFinishedTwelveHoursTimer
psect	text1243,local,class=CODE,delta=2
global __ptext1243
__ptext1243:

;; *************** function _isFinishedTwelveHoursTimer *****************
;; Defined at:
;;		line 518 in file "D:\develop\190625\AK7030-OTP\common.c"
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
;;		Nothing
;; This function is called by:
;;		_main
;; This function uses a non-reentrant model
;;
psect	text1243
	file	"D:\develop\190625\AK7030-OTP\common.c"
	line	518
	global	__size_of_isFinishedTwelveHoursTimer
	__size_of_isFinishedTwelveHoursTimer	equ	__end_of_isFinishedTwelveHoursTimer-_isFinishedTwelveHoursTimer
	
_isFinishedTwelveHoursTimer:	
	opt	stack 4
; Regs used in _isFinishedTwelveHoursTimer: [wreg+status,2+status,0]
	line	519
	
l4182:	
;common.c: 519: if(( uiBigTimer == 0 ) && bBigTimerStartFlag )
	bsf	status, 5	;RP0=1, select bank1
	movf	((_uiBigTimer+1)^080h),w
	iorwf	((_uiBigTimer)^080h),w
	skipz
	goto	u1941
	goto	u1940
u1941:
	goto	l4194
u1940:
	
l4184:	
	movf	(_bBigTimerStartFlag)^080h,w
	skipz
	goto	u1950
	goto	l4194
u1950:
	line	521
	
l4186:	
;common.c: 520: {
;common.c: 521: bBigTimerStartFlag = 0;
	clrf	(_bBigTimerStartFlag)^080h
	line	522
	
l4188:	
;common.c: 522: return 1;
	movlw	(01h)
	goto	l1647
	line	525
	
l4194:	
;common.c: 524: else
;common.c: 525: return 0;
	movlw	(0)
	line	526
	
l1647:	
	return
	opt stack 0
GLOBAL	__end_of_isFinishedTwelveHoursTimer
	__end_of_isFinishedTwelveHoursTimer:
;; =============== function _isFinishedTwelveHoursTimer ends ============

	signat	_isFinishedTwelveHoursTimer,89
	global	_startTwelveHourTimer
psect	text1244,local,class=CODE,delta=2
global __ptext1244
__ptext1244:

;; *************** function _startTwelveHourTimer *****************
;; Defined at:
;;		line 398 in file "D:\develop\190625\AK7030-OTP\common.c"
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
;;		On exit  : 60/20
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
psect	text1244
	file	"D:\develop\190625\AK7030-OTP\common.c"
	line	398
	global	__size_of_startTwelveHourTimer
	__size_of_startTwelveHourTimer	equ	__end_of_startTwelveHourTimer-_startTwelveHourTimer
	
_startTwelveHourTimer:	
	opt	stack 4
; Regs used in _startTwelveHourTimer: [wreg+status,2+status,0]
	line	399
	
l4174:	
;common.c: 399: if((0 == uiBigTimer) && ( 0 == bBigTimerStartFlag))
	movf	((_uiBigTimer+1)^080h),w
	iorwf	((_uiBigTimer)^080h),w
	skipz
	goto	u1921
	goto	u1920
u1921:
	goto	l1602
u1920:
	
l4176:	
	movf	(_bBigTimerStartFlag)^080h,f
	skipz
	goto	u1931
	goto	u1930
u1931:
	goto	l1602
u1930:
	line	401
	
l4178:	
;common.c: 400: {
;common.c: 401: uiBigTimer = uiSetTime;
	movf	(startTwelveHourTimer@uiSetTime+1)^080h,w
	movwf	(_uiBigTimer+1)^080h
	movf	(startTwelveHourTimer@uiSetTime)^080h,w
	movwf	(_uiBigTimer)^080h
	line	402
	
l4180:	
;common.c: 402: bBigTimerStartFlag = 1;
	clrf	(_bBigTimerStartFlag)^080h
	incf	(_bBigTimerStartFlag)^080h,f
	line	409
	
l1602:	
	return
	opt stack 0
GLOBAL	__end_of_startTwelveHourTimer
	__end_of_startTwelveHourTimer:
;; =============== function _startTwelveHourTimer ends ============

	signat	_startTwelveHourTimer,4216
	global	_clearTwentyMinTimer
psect	text1245,local,class=CODE,delta=2
global __ptext1245
__ptext1245:

;; *************** function _clearTwentyMinTimer *****************
;; Defined at:
;;		line 439 in file "D:\develop\190625\AK7030-OTP\common.c"
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
;; Hardware stack levels required when called:    3
;; This function calls:
;;		Nothing
;; This function is called by:
;;		_main
;; This function uses a non-reentrant model
;;
psect	text1245
	file	"D:\develop\190625\AK7030-OTP\common.c"
	line	439
	global	__size_of_clearTwentyMinTimer
	__size_of_clearTwentyMinTimer	equ	__end_of_clearTwentyMinTimer-_clearTwentyMinTimer
	
_clearTwentyMinTimer:	
	opt	stack 4
; Regs used in _clearTwentyMinTimer: [status,2]
	line	440
	
l4172:	
;common.c: 440: uiTwentyMinTimer = 0;
	bsf	status, 5	;RP0=1, select bank1
	clrf	(_uiTwentyMinTimer)^080h
	clrf	(_uiTwentyMinTimer+1)^080h
	line	441
;common.c: 441: bTwentyMinStartFlag = 0;
	clrf	(_bTwentyMinStartFlag)^080h
	line	442
	
l1617:	
	return
	opt stack 0
GLOBAL	__end_of_clearTwentyMinTimer
	__end_of_clearTwentyMinTimer:
;; =============== function _clearTwentyMinTimer ends ============

	signat	_clearTwentyMinTimer,88
	global	_isFinishedTwentyMinTimer
psect	text1246,local,class=CODE,delta=2
global __ptext1246
__ptext1246:

;; *************** function _isFinishedTwentyMinTimer *****************
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
;;		Nothing
;; This function is called by:
;;		_main
;; This function uses a non-reentrant model
;;
psect	text1246
	file	"D:\develop\190625\AK7030-OTP\common.c"
	line	494
	global	__size_of_isFinishedTwentyMinTimer
	__size_of_isFinishedTwentyMinTimer	equ	__end_of_isFinishedTwentyMinTimer-_isFinishedTwentyMinTimer
	
_isFinishedTwentyMinTimer:	
	opt	stack 4
; Regs used in _isFinishedTwentyMinTimer: [wreg+status,2+status,0]
	line	495
	
l4156:	
;common.c: 495: if(( 0 == uiTwentyMinTimer ) && bTwentyMinStartFlag )
	bsf	status, 5	;RP0=1, select bank1
	movf	((_uiTwentyMinTimer+1)^080h),w
	iorwf	((_uiTwentyMinTimer)^080h),w
	skipz
	goto	u1901
	goto	u1900
u1901:
	goto	l4168
u1900:
	
l4158:	
	movf	(_bTwentyMinStartFlag)^080h,w
	skipz
	goto	u1910
	goto	l4168
u1910:
	line	497
	
l4160:	
;common.c: 496: {
;common.c: 497: bTwentyMinStartFlag = 0;
	clrf	(_bTwentyMinStartFlag)^080h
	line	498
	
l4162:	
;common.c: 498: return 1;
	movlw	(01h)
	goto	l1637
	line	501
	
l4168:	
;common.c: 500: else
;common.c: 501: return 0;
	movlw	(0)
	line	502
	
l1637:	
	return
	opt stack 0
GLOBAL	__end_of_isFinishedTwentyMinTimer
	__end_of_isFinishedTwentyMinTimer:
;; =============== function _isFinishedTwentyMinTimer ends ============

	signat	_isFinishedTwentyMinTimer,89
	global	_clrSampeTime
psect	text1247,local,class=CODE,delta=2
global __ptext1247
__ptext1247:

;; *************** function _clrSampeTime *****************
;; Defined at:
;;		line 564 in file "D:\develop\190625\AK7030-OTP\common.c"
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
psect	text1247
	file	"D:\develop\190625\AK7030-OTP\common.c"
	line	564
	global	__size_of_clrSampeTime
	__size_of_clrSampeTime	equ	__end_of_clrSampeTime-_clrSampeTime
	
_clrSampeTime:	
	opt	stack 4
; Regs used in _clrSampeTime: [status,2]
	line	565
	
l4154:	
;common.c: 565: timer.timer10msStopWatch = 0;
	clrf	(_timer)
	line	566
	
l1666:	
	return
	opt stack 0
GLOBAL	__end_of_clrSampeTime
	__end_of_clrSampeTime:
;; =============== function _clrSampeTime ends ============

	signat	_clrSampeTime,88
	global	_isPermitSampleTime
psect	text1248,local,class=CODE,delta=2
global __ptext1248
__ptext1248:

;; *************** function _isPermitSampleTime *****************
;; Defined at:
;;		line 554 in file "D:\develop\190625\AK7030-OTP\common.c"
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
psect	text1248
	file	"D:\develop\190625\AK7030-OTP\common.c"
	line	554
	global	__size_of_isPermitSampleTime
	__size_of_isPermitSampleTime	equ	__end_of_isPermitSampleTime-_isPermitSampleTime
	
_isPermitSampleTime:	
	opt	stack 4
; Regs used in _isPermitSampleTime: [wreg]
	line	555
	
l4142:	
;common.c: 555: if(timer.timer10msStopWatch >= 10)
	movlw	(0Ah)
	subwf	(_timer),w
	skipc
	goto	u1891
	goto	u1890
u1891:
	goto	l4150
u1890:
	line	557
	
l4144:	
;common.c: 556: {
;common.c: 557: return 1;
	movlw	(01h)
	goto	l1662
	line	560
	
l4150:	
;common.c: 559: else
;common.c: 560: return 0;
	movlw	(0)
	line	561
	
l1662:	
	return
	opt stack 0
GLOBAL	__end_of_isPermitSampleTime
	__end_of_isPermitSampleTime:
;; =============== function _isPermitSampleTime ends ============

	signat	_isPermitSampleTime,89
	global	_adc_start
psect	text1249,local,class=CODE,delta=2
global __ptext1249
__ptext1249:

;; *************** function _adc_start *****************
;; Defined at:
;;		line 101 in file "D:\develop\190625\AK7030-OTP\periph.c"
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
psect	text1249
	file	"D:\develop\190625\AK7030-OTP\periph.c"
	line	101
	global	__size_of_adc_start
	__size_of_adc_start	equ	__end_of_adc_start-_adc_start
	
_adc_start:	
	opt	stack 3
; Regs used in _adc_start: []
	line	102
	
l4140:	
;periph.c: 102: GO=1;
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	bsf	(249/8),(249)&7
	line	103
	
l2350:	
	return
	opt stack 0
GLOBAL	__end_of_adc_start
	__end_of_adc_start:
;; =============== function _adc_start ends ============

	signat	_adc_start,88
	global	_startTwentyMinTimer
psect	text1250,local,class=CODE,delta=2
global __ptext1250
__ptext1250:

;; *************** function _startTwentyMinTimer *****************
;; Defined at:
;;		line 484 in file "D:\develop\190625\AK7030-OTP\common.c"
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
;;		On exit  : 17F/20
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
psect	text1250
	file	"D:\develop\190625\AK7030-OTP\common.c"
	line	484
	global	__size_of_startTwentyMinTimer
	__size_of_startTwentyMinTimer	equ	__end_of_startTwentyMinTimer-_startTwentyMinTimer
	
_startTwentyMinTimer:	
	opt	stack 4
; Regs used in _startTwentyMinTimer: [wreg+status,2+status,0]
	line	485
	
l4132:	
;common.c: 485: if(( 0 == uiTwentyMinTimer) && ( 0 == bTwentyMinStartFlag))
	movf	((_uiTwentyMinTimer+1)^080h),w
	iorwf	((_uiTwentyMinTimer)^080h),w
	skipz
	goto	u1871
	goto	u1870
u1871:
	goto	l1633
u1870:
	
l4134:	
	movf	(_bTwentyMinStartFlag)^080h,f
	skipz
	goto	u1881
	goto	u1880
u1881:
	goto	l1633
u1880:
	line	487
	
l4136:	
;common.c: 486: {
;common.c: 487: uiTwentyMinTimer = uiSetValue;
	movf	(startTwentyMinTimer@uiSetValue+1)^080h,w
	movwf	(_uiTwentyMinTimer+1)^080h
	movf	(startTwentyMinTimer@uiSetValue)^080h,w
	movwf	(_uiTwentyMinTimer)^080h
	line	488
	
l4138:	
;common.c: 488: bTwentyMinStartFlag = 1;
	clrf	(_bTwentyMinStartFlag)^080h
	incf	(_bTwentyMinStartFlag)^080h,f
	line	490
	
l1633:	
	return
	opt stack 0
GLOBAL	__end_of_startTwentyMinTimer
	__end_of_startTwentyMinTimer:
;; =============== function _startTwentyMinTimer ends ============

	signat	_startTwentyMinTimer,4216
	global	_adc_test_init
psect	text1251,local,class=CODE,delta=2
global __ptext1251
__ptext1251:

;; *************** function _adc_test_init *****************
;; Defined at:
;;		line 85 in file "D:\develop\190625\AK7030-OTP\periph.c"
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
psect	text1251
	file	"D:\develop\190625\AK7030-OTP\periph.c"
	line	85
	global	__size_of_adc_test_init
	__size_of_adc_test_init	equ	__end_of_adc_test_init-_adc_test_init
	
_adc_test_init:	
	opt	stack 3
; Regs used in _adc_test_init: [wreg+status,2+status,0]
;adc_test_init@channel stored from wreg
	movwf	(adc_test_init@channel)^080h
	line	86
	
l3492:	
;periph.c: 86: ADCON0 = 0x00;
	bcf	status, 5	;RP0=0, select bank0
	clrf	(31)	;volatile
	line	87
	
l3494:	
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
	
l3496:	
;periph.c: 88: ADCON1 = 0x35;
	movlw	(035h)
	bsf	status, 5	;RP0=1, select bank1
	movwf	(159)^080h	;volatile
	line	89
	
l3498:	
;periph.c: 89: ADCON1|=ref<<6;
	movf	(adc_test_init@ref)^080h,w
	movwf	(??_adc_test_init+0)^080h+0
	rrf	(??_adc_test_init+0)^080h+0,f
	rrf	(??_adc_test_init+0)^080h+0,f
	rrf	(??_adc_test_init+0)^080h+0,w
	andlw	0c0h
	iorwf	(159)^080h,f	;volatile
	line	90
	
l3500:	
;periph.c: 90: ADON=1;
	bcf	status, 5	;RP0=0, select bank0
	bsf	(248/8),(248)&7
	line	91
	
l3502:	
;periph.c: 91: ADIE=1;
	bsf	status, 5	;RP0=1, select bank1
	bsf	(1130/8)^080h,(1130)&7
	line	92
	
l2344:	
	return
	opt stack 0
GLOBAL	__end_of_adc_test_init
	__end_of_adc_test_init:
;; =============== function _adc_test_init ends ============

	signat	_adc_test_init,8312
	global	_timer1_interrupt_config
psect	text1252,local,class=CODE,delta=2
global __ptext1252
__ptext1252:

;; *************** function _timer1_interrupt_config *****************
;; Defined at:
;;		line 287 in file "D:\develop\190625\AK7030-OTP\common.c"
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
psect	text1252
	file	"D:\develop\190625\AK7030-OTP\common.c"
	line	287
	global	__size_of_timer1_interrupt_config
	__size_of_timer1_interrupt_config	equ	__end_of_timer1_interrupt_config-_timer1_interrupt_config
	
_timer1_interrupt_config:	
	opt	stack 4
; Regs used in _timer1_interrupt_config: []
	line	288
	
l4130:	
;common.c: 288: GIE = 1;
	bsf	(95/8),(95)&7
	line	289
;common.c: 289: PEIE = 1;
	bsf	(94/8),(94)&7
	line	290
	
l1567:	
	return
	opt stack 0
GLOBAL	__end_of_timer1_interrupt_config
	__end_of_timer1_interrupt_config:
;; =============== function _timer1_interrupt_config ends ============

	signat	_timer1_interrupt_config,88
	global	_timer1_config
psect	text1253,local,class=CODE,delta=2
global __ptext1253
__ptext1253:

;; *************** function _timer1_config *****************
;; Defined at:
;;		line 275 in file "D:\develop\190625\AK7030-OTP\common.c"
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
psect	text1253
	file	"D:\develop\190625\AK7030-OTP\common.c"
	line	275
	global	__size_of_timer1_config
	__size_of_timer1_config	equ	__end_of_timer1_config-_timer1_config
	
_timer1_config:	
	opt	stack 4
; Regs used in _timer1_config: [wreg]
	line	277
	
l4126:	
;common.c: 277: TMR1H=0xCF;
	movlw	(0CFh)
	bcf	status, 6	;RP1=0, select bank0
	movwf	(15)	;volatile
	line	278
;common.c: 278: TMR1L=0x2C;
	movlw	(02Ch)
	movwf	(14)	;volatile
	line	279
;common.c: 279: T1CON=0xE1;
	movlw	(0E1h)
	movwf	(16)	;volatile
	line	280
	
l4128:	
;common.c: 280: TMR1IE=1;
	bsf	status, 5	;RP0=1, select bank1
	bsf	(1120/8)^080h,(1120)&7
	line	282
	
l1564:	
	return
	opt stack 0
GLOBAL	__end_of_timer1_config
	__end_of_timer1_config:
;; =============== function _timer1_config ends ============

	signat	_timer1_config,88
	global	_clock_config
psect	text1254,local,class=CODE,delta=2
global __ptext1254
__ptext1254:

;; *************** function _clock_config *****************
;; Defined at:
;;		line 267 in file "D:\develop\190625\AK7030-OTP\common.c"
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
psect	text1254
	file	"D:\develop\190625\AK7030-OTP\common.c"
	line	267
	global	__size_of_clock_config
	__size_of_clock_config	equ	__end_of_clock_config-_clock_config
	
_clock_config:	
	opt	stack 4
; Regs used in _clock_config: [wreg+status,2]
	line	269
	
l4122:	
;common.c: 269: CLKPR = 0x80;
	movlw	(080h)
	bcf	status, 5	;RP0=0, select bank2
	bsf	status, 6	;RP1=1, select bank2
	movwf	(264)^0100h	;volatile
	line	270
	
l4124:	
;common.c: 270: CLKPR = 0x00;
	clrf	(264)^0100h	;volatile
	line	271
;common.c: 271: while(CLKPCE);
	
l1558:	
	btfsc	(2119/8)^0100h,(2119)&7
	goto	u1861
	goto	u1860
u1861:
	goto	l1558
u1860:
	line	272
	
l1561:	
	return
	opt stack 0
GLOBAL	__end_of_clock_config
	__end_of_clock_config:
;; =============== function _clock_config ends ============

	signat	_clock_config,88
	global	_reset
psect	text1255,local,class=CODE,delta=2
global __ptext1255
__ptext1255:

;; *************** function _reset *****************
;; Defined at:
;;		line 309 in file "D:\develop\190625\AK7030-OTP\main.c"
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
psect	text1255
	file	"D:\develop\190625\AK7030-OTP\main.c"
	line	309
	global	__size_of_reset
	__size_of_reset	equ	__end_of_reset-_reset
	
_reset:	
	opt	stack 4
; Regs used in _reset: []
	line	311
;main.c: 311: while(1);
	
l727:	
	goto	l727
	return
	opt stack 0
psect	text1256,local,class=CODE,delta=2
global __ptext1256
__ptext1256:
	line	315
GLOBAL	__end_of_reset
	__end_of_reset:
;; =============== function _reset ends ============

	signat	_reset,88
	global	_selectAdChannel

;; *************** function _selectAdChannel *****************
;; Defined at:
;;		line 298 in file "D:\develop\190625\AK7030-OTP\main.c"
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
psect	text1256
	file	"D:\develop\190625\AK7030-OTP\main.c"
	line	298
	global	__size_of_selectAdChannel
	__size_of_selectAdChannel	equ	__end_of_selectAdChannel-_selectAdChannel
	
_selectAdChannel:	
	opt	stack 4
; Regs used in _selectAdChannel: []
	line	300
	
l4120:	
;main.c: 300: TRISB0 = 1;
	bsf	status, 5	;RP0=1, select bank1
	bsf	(1072/8)^080h,(1072)&7
	line	301
;main.c: 301: TRISB1 = 1;
	bsf	(1073/8)^080h,(1073)&7
	line	305
	
l724:	
	return
	opt stack 0
GLOBAL	__end_of_selectAdChannel
	__end_of_selectAdChannel:
;; =============== function _selectAdChannel ends ============

	signat	_selectAdChannel,88
	global	_pwm_start
psect	text1257,local,class=CODE,delta=2
global __ptext1257
__ptext1257:

;; *************** function _pwm_start *****************
;; Defined at:
;;		line 246 in file "D:\develop\190625\AK7030-OTP\main.c"
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
;;		On entry : 17F/20
;;		On exit  : 17F/0
;;		Unchanged: FFE80/0
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
psect	text1257
	file	"D:\develop\190625\AK7030-OTP\main.c"
	line	246
	global	__size_of_pwm_start
	__size_of_pwm_start	equ	__end_of_pwm_start-_pwm_start
	
_pwm_start:	
	opt	stack 4
; Regs used in _pwm_start: [wreg+status,2+status,0]
;pwm_start@ucPulseWidth stored from wreg
	line	248
	movwf	(pwm_start@ucPulseWidth)^080h
	
l4104:	
;main.c: 248: CCP1CON&= 0xf0;
	movlw	(0F0h)
	bcf	status, 5	;RP0=0, select bank0
	andwf	(23),f	;volatile
	line	250
	
l4106:	
;main.c: 250: T2CON=0x04;
	movlw	(04h)
	movwf	(18)	;volatile
	line	251
	
l4108:	
;main.c: 251: PR2 = ucPulseFrequency;
	bsf	status, 5	;RP0=1, select bank1
	movf	(pwm_start@ucPulseFrequency)^080h,w
	movwf	(146)^080h	;volatile
	line	252
	
l4110:	
;main.c: 252: CCPR1L = ucPulseWidth;
	movf	(pwm_start@ucPulseWidth)^080h,w
	bcf	status, 5	;RP0=0, select bank0
	movwf	(21)	;volatile
	line	253
	
l4112:	
;main.c: 253: CCP1CON=0x00;
	clrf	(23)	;volatile
	line	255
	
l4114:	
;main.c: 255: TRISB2=0;
	bsf	status, 5	;RP0=1, select bank1
	bcf	(1074/8)^080h,(1074)&7
	line	256
	
l4116:	
;main.c: 256: PBOD2 = 0;
	bsf	status, 6	;RP1=1, select bank3
	bcf	(3138/8)^0180h,(3138)&7
	line	258
	
l4118:	
;main.c: 258: CCP1CON|= 0x0c;
	movlw	(0Ch)
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	iorwf	(23),f	;volatile
	line	267
	
l715:	
	return
	opt stack 0
GLOBAL	__end_of_pwm_start
	__end_of_pwm_start:
;; =============== function _pwm_start ends ============

	signat	_pwm_start,8312
	global	_initPB2_AsHighResistence
psect	text1258,local,class=CODE,delta=2
global __ptext1258
__ptext1258:

;; *************** function _initPB2_AsHighResistence *****************
;; Defined at:
;;		line 234 in file "D:\develop\190625\AK7030-OTP\main.c"
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
psect	text1258
	file	"D:\develop\190625\AK7030-OTP\main.c"
	line	234
	global	__size_of_initPB2_AsHighResistence
	__size_of_initPB2_AsHighResistence	equ	__end_of_initPB2_AsHighResistence-_initPB2_AsHighResistence
	
_initPB2_AsHighResistence:	
	opt	stack 3
; Regs used in _initPB2_AsHighResistence: []
	line	236
	
l4102:	
;main.c: 236: PB2 = 1;
	bsf	(50/8),(50)&7
	line	237
;main.c: 237: PBOD2 = 1;
	bsf	status, 5	;RP0=1, select bank3
	bsf	status, 6	;RP1=1, select bank3
	bsf	(3138/8)^0180h,(3138)&7
	line	241
	
l712:	
	return
	opt stack 0
GLOBAL	__end_of_initPB2_AsHighResistence
	__end_of_initPB2_AsHighResistence:
;; =============== function _initPB2_AsHighResistence ends ============

	signat	_initPB2_AsHighResistence,88
	global	_setPB5
psect	text1259,local,class=CODE,delta=2
global __ptext1259
__ptext1259:

;; *************** function _setPB5 *****************
;; Defined at:
;;		line 217 in file "D:\develop\190625\AK7030-OTP\main.c"
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
psect	text1259
	file	"D:\develop\190625\AK7030-OTP\main.c"
	line	217
	global	__size_of_setPB5
	__size_of_setPB5	equ	__end_of_setPB5-_setPB5
	
_setPB5:	
	opt	stack 4
; Regs used in _setPB5: [wreg]
;setPB5@bValue stored from wreg
	bsf	status, 5	;RP0=1, select bank1
	movwf	(setPB5@bValue)^080h
	line	218
	
l4098:	
;main.c: 218: if( bValue )
	movf	(setPB5@bValue)^080h,w
	skipz
	goto	u1850
	goto	l707
u1850:
	line	220
	
l4100:	
;main.c: 220: PB5 = 1;
	bcf	status, 5	;RP0=0, select bank0
	bsf	(53/8),(53)&7
	goto	l709
	line	224
	
l707:	
	line	226
;main.c: 224: else
;main.c: 226: PB5= 0;
	bcf	status, 5	;RP0=0, select bank0
	bcf	(53/8),(53)&7
	line	230
	
l709:	
	return
	opt stack 0
GLOBAL	__end_of_setPB5
	__end_of_setPB5:
;; =============== function _setPB5 ends ============

	signat	_setPB5,4216
	global	_initPB5
psect	text1260,local,class=CODE,delta=2
global __ptext1260
__ptext1260:

;; *************** function _initPB5 *****************
;; Defined at:
;;		line 200 in file "D:\develop\190625\AK7030-OTP\main.c"
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
psect	text1260
	file	"D:\develop\190625\AK7030-OTP\main.c"
	line	200
	global	__size_of_initPB5
	__size_of_initPB5	equ	__end_of_initPB5-_initPB5
	
_initPB5:	
	opt	stack 3
; Regs used in _initPB5: [wreg]
;initPB5@bValue stored from wreg
	movwf	(initPB5@bValue)^080h
	line	201
	
l4094:	
;main.c: 201: if( bValue )
	movf	(initPB5@bValue)^080h,w
	skipz
	goto	u1840
	goto	l702
u1840:
	line	203
	
l4096:	
;main.c: 203: TRISB5 = 1;
	bsf	(1077/8)^080h,(1077)&7
	goto	l704
	line	207
	
l702:	
	line	209
;main.c: 207: else
;main.c: 209: TRISB5= 0;
	bcf	(1077/8)^080h,(1077)&7
	line	213
	
l704:	
	return
	opt stack 0
GLOBAL	__end_of_initPB5
	__end_of_initPB5:
;; =============== function _initPB5 ends ============

	signat	_initPB5,4216
	global	_setPB4
psect	text1261,local,class=CODE,delta=2
global __ptext1261
__ptext1261:

;; *************** function _setPB4 *****************
;; Defined at:
;;		line 183 in file "D:\develop\190625\AK7030-OTP\main.c"
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
psect	text1261
	file	"D:\develop\190625\AK7030-OTP\main.c"
	line	183
	global	__size_of_setPB4
	__size_of_setPB4	equ	__end_of_setPB4-_setPB4
	
_setPB4:	
	opt	stack 4
; Regs used in _setPB4: [wreg]
;setPB4@bValue stored from wreg
	bsf	status, 5	;RP0=1, select bank1
	movwf	(setPB4@bValue)^080h
	line	184
	
l4090:	
;main.c: 184: if( bValue )
	movf	(setPB4@bValue)^080h,w
	skipz
	goto	u1830
	goto	l697
u1830:
	line	186
	
l4092:	
;main.c: 186: PB4 = 1;
	bcf	status, 5	;RP0=0, select bank0
	bsf	(52/8),(52)&7
	goto	l699
	line	190
	
l697:	
	line	192
;main.c: 190: else
;main.c: 192: PB4= 0;
	bcf	status, 5	;RP0=0, select bank0
	bcf	(52/8),(52)&7
	line	196
	
l699:	
	return
	opt stack 0
GLOBAL	__end_of_setPB4
	__end_of_setPB4:
;; =============== function _setPB4 ends ============

	signat	_setPB4,4216
	global	_initPB4
psect	text1262,local,class=CODE,delta=2
global __ptext1262
__ptext1262:

;; *************** function _initPB4 *****************
;; Defined at:
;;		line 166 in file "D:\develop\190625\AK7030-OTP\main.c"
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
psect	text1262
	file	"D:\develop\190625\AK7030-OTP\main.c"
	line	166
	global	__size_of_initPB4
	__size_of_initPB4	equ	__end_of_initPB4-_initPB4
	
_initPB4:	
	opt	stack 3
; Regs used in _initPB4: [wreg]
;initPB4@bValue stored from wreg
	movwf	(initPB4@bValue)^080h
	line	167
	
l4086:	
;main.c: 167: if( bValue )
	movf	(initPB4@bValue)^080h,w
	skipz
	goto	u1820
	goto	l692
u1820:
	line	169
	
l4088:	
;main.c: 169: TRISB4 = 1;
	bsf	(1076/8)^080h,(1076)&7
	goto	l694
	line	173
	
l692:	
	line	175
;main.c: 173: else
;main.c: 175: TRISB4= 0;
	bcf	(1076/8)^080h,(1076)&7
	line	179
	
l694:	
	return
	opt stack 0
GLOBAL	__end_of_initPB4
	__end_of_initPB4:
;; =============== function _initPB4 ends ============

	signat	_initPB4,4216
	global	_setPB3
psect	text1263,local,class=CODE,delta=2
global __ptext1263
__ptext1263:

;; *************** function _setPB3 *****************
;; Defined at:
;;		line 148 in file "D:\develop\190625\AK7030-OTP\main.c"
;; Parameters:    Size  Location     Type
;;  bValue          1    wreg     unsigned char 
;; Auto vars:     Size  Location     Type
;;  bValue          1    0[BANK1 ] unsigned char 
;; Return value:  Size  Location     Type
;;		None               void
;; Registers used:
;;		wreg
;; Tracked objects:
;;		On entry : 40/20
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
psect	text1263
	file	"D:\develop\190625\AK7030-OTP\main.c"
	line	148
	global	__size_of_setPB3
	__size_of_setPB3	equ	__end_of_setPB3-_setPB3
	
_setPB3:	
	opt	stack 4
; Regs used in _setPB3: [wreg]
;setPB3@bValue stored from wreg
	bsf	status, 5	;RP0=1, select bank1
	movwf	(setPB3@bValue)^080h
	line	149
	
l4082:	
;main.c: 149: if( bValue )
	movf	(setPB3@bValue)^080h,w
	skipz
	goto	u1810
	goto	l687
u1810:
	line	151
	
l4084:	
;main.c: 151: PB3 = 1;
	bcf	status, 5	;RP0=0, select bank0
	bsf	(51/8),(51)&7
	goto	l689
	line	155
	
l687:	
	line	157
;main.c: 155: else
;main.c: 157: PB3= 0;
	bcf	status, 5	;RP0=0, select bank0
	bcf	(51/8),(51)&7
	line	161
	
l689:	
	return
	opt stack 0
GLOBAL	__end_of_setPB3
	__end_of_setPB3:
;; =============== function _setPB3 ends ============

	signat	_setPB3,4216
	global	_initPB3
psect	text1264,local,class=CODE,delta=2
global __ptext1264
__ptext1264:

;; *************** function _initPB3 *****************
;; Defined at:
;;		line 131 in file "D:\develop\190625\AK7030-OTP\main.c"
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
psect	text1264
	file	"D:\develop\190625\AK7030-OTP\main.c"
	line	131
	global	__size_of_initPB3
	__size_of_initPB3	equ	__end_of_initPB3-_initPB3
	
_initPB3:	
	opt	stack 3
; Regs used in _initPB3: [wreg]
;initPB3@bValue stored from wreg
	bcf	status, 6	;RP1=0, select bank1
	movwf	(initPB3@bValue)^080h
	line	132
	
l4078:	
;main.c: 132: if( bValue )
	movf	(initPB3@bValue)^080h,w
	skipz
	goto	u1800
	goto	l682
u1800:
	line	134
	
l4080:	
;main.c: 134: TRISB3 = 1;
	bsf	(1075/8)^080h,(1075)&7
	goto	l684
	line	138
	
l682:	
	line	140
;main.c: 138: else
;main.c: 140: TRISB3 = 0;
	bcf	(1075/8)^080h,(1075)&7
	line	144
	
l684:	
	return
	opt stack 0
GLOBAL	__end_of_initPB3
	__end_of_initPB3:
;; =============== function _initPB3 ends ============

	signat	_initPB3,4216
	global	_clearThreeHoursTimer
psect	text1265,local,class=CODE,delta=2
global __ptext1265
__ptext1265:

;; *************** function _clearThreeHoursTimer *****************
;; Defined at:
;;		line 419 in file "D:\develop\190625\AK7030-OTP\common.c"
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
;; Hardware stack levels required when called:    3
;; This function calls:
;;		Nothing
;; This function is called by:
;;		_main
;; This function uses a non-reentrant model
;;
psect	text1265
	file	"D:\develop\190625\AK7030-OTP\common.c"
	line	419
	global	__size_of_clearThreeHoursTimer
	__size_of_clearThreeHoursTimer	equ	__end_of_clearThreeHoursTimer-_clearThreeHoursTimer
	
_clearThreeHoursTimer:	
	opt	stack 4
; Regs used in _clearThreeHoursTimer: [status,2]
	line	420
	
l4076:	
;common.c: 420: uiSmallTimer = 0;
	bsf	status, 5	;RP0=1, select bank1
	clrf	(_uiSmallTimer)^080h
	clrf	(_uiSmallTimer+1)^080h
	line	421
;common.c: 421: bSmallTimerStartFlag = 0;
	clrf	(_bSmallTimerStartFlag)^080h
	line	422
	
l1608:	
	return
	opt stack 0
GLOBAL	__end_of_clearThreeHoursTimer
	__end_of_clearThreeHoursTimer:
;; =============== function _clearThreeHoursTimer ends ============

	signat	_clearThreeHoursTimer,88
	global	_clearTwelveHoursTimer
psect	text1266,local,class=CODE,delta=2
global __ptext1266
__ptext1266:

;; *************** function _clearTwelveHoursTimer *****************
;; Defined at:
;;		line 412 in file "D:\develop\190625\AK7030-OTP\common.c"
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
;; Hardware stack levels required when called:    3
;; This function calls:
;;		Nothing
;; This function is called by:
;;		_main
;; This function uses a non-reentrant model
;;
psect	text1266
	file	"D:\develop\190625\AK7030-OTP\common.c"
	line	412
	global	__size_of_clearTwelveHoursTimer
	__size_of_clearTwelveHoursTimer	equ	__end_of_clearTwelveHoursTimer-_clearTwelveHoursTimer
	
_clearTwelveHoursTimer:	
	opt	stack 4
; Regs used in _clearTwelveHoursTimer: [status,2]
	line	413
	
l4074:	
;common.c: 413: uiBigTimer = 0;
	bsf	status, 5	;RP0=1, select bank1
	clrf	(_uiBigTimer)^080h
	clrf	(_uiBigTimer+1)^080h
	line	414
;common.c: 414: bBigTimerStartFlag = 0;
	clrf	(_bBigTimerStartFlag)^080h
	line	415
	
l1605:	
	return
	opt stack 0
GLOBAL	__end_of_clearTwelveHoursTimer
	__end_of_clearTwelveHoursTimer:
;; =============== function _clearTwelveHoursTimer ends ============

	signat	_clearTwelveHoursTimer,88
	global	_ISR
psect	text1267,local,class=CODE,delta=2
global __ptext1267
__ptext1267:

;; *************** function _ISR *****************
;; Defined at:
;;		line 613 in file "D:\develop\190625\AK7030-OTP\common.c"
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
psect	text1267
	file	"D:\develop\190625\AK7030-OTP\common.c"
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
psect	text1267
	line	617
	
i1l3784:	
;common.c: 614: static unsigned char ucTimer1sCnt = 0;
;common.c: 617: if(TMR1IF == 1)
	btfss	(96/8),(96)&7
	goto	u142_21
	goto	u142_20
u142_21:
	goto	i1l3806
u142_20:
	line	619
	
i1l3786:	
;common.c: 618: {
;common.c: 619: TMR1IF = 0 ;
	bcf	(96/8),(96)&7
	line	620
	
i1l3788:	
;common.c: 620: timer.timer10msStopWatch++;
	incf	(_timer),f
	line	621
;common.c: 621: ucTimer1sCnt++;
	incf	(ISR@ucTimer1sCnt),f
	line	625
	
i1l3790:	
;common.c: 625: if(ucTimer1sCnt >= 100)
	movlw	(064h)
	subwf	(ISR@ucTimer1sCnt),w
	skipc
	goto	u143_21
	goto	u143_20
u143_21:
	goto	i1l3806
u143_20:
	line	627
	
i1l3792:	
;common.c: 626: {
;common.c: 627: ucTimer1sCnt = 0;
	clrf	(ISR@ucTimer1sCnt)
	line	628
	
i1l3794:	
;common.c: 628: if(uiBigTimer > 0)
	bsf	status, 5	;RP0=1, select bank1
	movf	(_uiBigTimer+1)^080h,w
	iorwf	(_uiBigTimer)^080h,w
	skipnz
	goto	u144_21
	goto	u144_20
u144_21:
	goto	i1l1689
u144_20:
	line	629
	
i1l3796:	
;common.c: 629: uiBigTimer--;
	movlw	low(01h)
	subwf	(_uiBigTimer)^080h,f
	movlw	high(01h)
	skipc
	decf	(_uiBigTimer+1)^080h,f
	subwf	(_uiBigTimer+1)^080h,f
	
i1l1689:	
	line	631
;common.c: 631: if(uiSmallTimer)
	movf	(_uiSmallTimer+1)^080h,w
	iorwf	(_uiSmallTimer)^080h,w
	skipnz
	goto	u145_21
	goto	u145_20
u145_21:
	goto	i1l1690
u145_20:
	line	632
	
i1l3798:	
;common.c: 632: uiSmallTimer--;
	movlw	low(01h)
	subwf	(_uiSmallTimer)^080h,f
	movlw	high(01h)
	skipc
	decf	(_uiSmallTimer+1)^080h,f
	subwf	(_uiSmallTimer+1)^080h,f
	
i1l1690:	
	line	634
;common.c: 634: if(uiTwentySecondsTimer)
	bcf	status, 5	;RP0=0, select bank0
	movf	(_uiTwentySecondsTimer+1),w
	iorwf	(_uiTwentySecondsTimer),w
	skipnz
	goto	u146_21
	goto	u146_20
u146_21:
	goto	i1l1691
u146_20:
	line	635
	
i1l3800:	
;common.c: 635: uiTwentySecondsTimer--;
	movlw	low(01h)
	subwf	(_uiTwentySecondsTimer),f
	movlw	high(01h)
	skipc
	decf	(_uiTwentySecondsTimer+1),f
	subwf	(_uiTwentySecondsTimer+1),f
	
i1l1691:	
	line	637
;common.c: 637: if(uiTwentyMinTimer)
	bsf	status, 5	;RP0=1, select bank1
	movf	(_uiTwentyMinTimer+1)^080h,w
	iorwf	(_uiTwentyMinTimer)^080h,w
	skipnz
	goto	u147_21
	goto	u147_20
u147_21:
	goto	i1l1692
u147_20:
	line	638
	
i1l3802:	
;common.c: 638: uiTwentyMinTimer--;
	movlw	low(01h)
	subwf	(_uiTwentyMinTimer)^080h,f
	movlw	high(01h)
	skipc
	decf	(_uiTwentyMinTimer+1)^080h,f
	subwf	(_uiTwentyMinTimer+1)^080h,f
	
i1l1692:	
	line	640
;common.c: 640: if( uiOneHourTimer )
	movf	(_uiOneHourTimer+1)^080h,w
	iorwf	(_uiOneHourTimer)^080h,w
	skipnz
	goto	u148_21
	goto	u148_20
u148_21:
	goto	i1l3806
u148_20:
	line	641
	
i1l3804:	
;common.c: 641: uiOneHourTimer--;
	movlw	low(01h)
	subwf	(_uiOneHourTimer)^080h,f
	movlw	high(01h)
	skipc
	decf	(_uiOneHourTimer+1)^080h,f
	subwf	(_uiOneHourTimer+1)^080h,f
	line	645
	
i1l3806:	
;common.c: 642: }
;common.c: 643: }
;common.c: 645: if(ADIF)
	bcf	status, 5	;RP0=0, select bank0
	btfss	(106/8),(106)&7
	goto	u149_21
	goto	u149_20
u149_21:
	goto	i1l1697
u149_20:
	line	648
	
i1l3808:	
;common.c: 646: {
;common.c: 648: ADIF=0;
	bcf	(106/8),(106)&7
	line	649
	
i1l3810:	
;common.c: 649: setAD_ConvertFlag(1);
	movlw	(01h)
	fcall	i1_setAD_ConvertFlag
	line	651
	
i1l3812:	
;common.c: 651: if(sampleChannelSelect == 12)
	bsf	status, 5	;RP0=1, select bank1
	movf	(_sampleChannelSelect)^080h,w
	xorlw	0Ch
	skipz
	goto	u150_21
	goto	u150_20
u150_21:
	goto	i1l3816
u150_20:
	line	655
	
i1l3814:	
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
	goto	i1l1697
	line	665
	
i1l3816:	
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
	
i1l1697:	
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
psect	text1268,local,class=CODE,delta=2
global __ptext1268
__ptext1268:

;; *************** function _vPutSampleDataIntoTable *****************
;; Defined at:
;;		line 111 in file "D:\develop\190625\AK7030-OTP\common.c"
;; Parameters:    Size  Location     Type
;;  uiSampleData    2    6[COMMON] unsigned int 
;;  channel         1    8[COMMON] unsigned char 
;; Auto vars:     Size  Location     Type
;;  ucIndex         1   33[BANK0 ] unsigned char 
;;  uiCalWidth      2   31[BANK0 ] unsigned int 
;;  uiSum           2   29[BANK0 ] unsigned int 
;;  i               2   34[BANK0 ] int 
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
;;      Locals:         0       7       0       0       0
;;      Temps:          2       0       0       0       0
;;      Totals:         5       7       0       0       0
;;Total ram usage:       12 bytes
;; Hardware stack levels used:    1
;; Hardware stack levels required when called:    1
;; This function calls:
;;		i1_Filter
;;		_setPWM_Width
;; This function is called by:
;;		_ISR
;; This function uses a non-reentrant model
;;
psect	text1268
	file	"D:\develop\190625\AK7030-OTP\common.c"
	line	111
	global	__size_of_vPutSampleDataIntoTable
	__size_of_vPutSampleDataIntoTable	equ	__end_of_vPutSampleDataIntoTable-_vPutSampleDataIntoTable
	
_vPutSampleDataIntoTable:	
	opt	stack 3
; Regs used in _vPutSampleDataIntoTable: [wreg-fsr0h+status,2+status,0+btemp+1+pclath+cstack]
	line	119
	
i1l3672:	
;common.c: 113: static unsigned char ucChannelFirstLength = 0;
;common.c: 115: static unsigned char ucChannelFourthLength = 0;
;common.c: 117: static unsigned char ucChannelFourteenthLength = 0;
;common.c: 119: if(channel == 12)
	movf	(vPutSampleDataIntoTable@channel),w
	xorlw	0Ch
	skipz
	goto	u123_21
	goto	u123_20
u123_21:
	goto	i1l3728
u123_20:
	line	121
	
i1l3674:	
;common.c: 120: {
;common.c: 121: if(ucChannelFirstLength < 10)
	movlw	(0Ah)
	subwf	(vPutSampleDataIntoTable@ucChannelFirstLength),w
	skipnc
	goto	u124_21
	goto	u124_20
u124_21:
	goto	i1l3724
u124_20:
	line	123
	
i1l3676:	
;common.c: 122: {
;common.c: 123: uiSampleChannelFirst[ucChannelFirstLength] = uiSampleData;
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
	line	125
	
i1l3678:	
;common.c: 125: ucChannelFirstLength++;
	incf	(vPutSampleDataIntoTable@ucChannelFirstLength),f
	line	127
	
i1l3680:	
;common.c: 127: if( 10 == ucChannelFirstLength )
	movf	(vPutSampleDataIntoTable@ucChannelFirstLength),w
	xorlw	0Ah
	skipz
	goto	u125_21
	goto	u125_20
u125_21:
	goto	i1l1555
u125_20:
	line	137
	
i1l3682:	
;common.c: 128: {
;common.c: 131: static unsigned char bInitArrayFlag = 0;
;common.c: 133: static unsigned int uiCalWidthArray[4],uiCalWidthCnt = 0;
;common.c: 135: static unsigned char uiInitWidth = 75;
;common.c: 137: uiCalWidthArray[uiCalWidthCnt++] = Filter(uiSampleChannelFirst);
	movlw	(_uiSampleChannelFirst)&0ffh
	fcall	i1_Filter
	clrc
	rlf	(vPutSampleDataIntoTable@uiCalWidthCnt),w
	addlw	vPutSampleDataIntoTable@uiCalWidthArray&0ffh
	movwf	fsr0
	movf	(0+(?i1_Filter)),w
	movwf	indf
	incf	fsr0,f
	movf	(1+(?i1_Filter)),w
	movwf	indf
	
i1l3684:	
	incf	(vPutSampleDataIntoTable@uiCalWidthCnt),f
	skipnz
	incf	(vPutSampleDataIntoTable@uiCalWidthCnt+1),f
	line	139
	
i1l3686:	
;common.c: 139: if(( 4 == uiCalWidthCnt ) || (1 == bInitArrayFlag))
		movf	(vPutSampleDataIntoTable@uiCalWidthCnt),w
	xorlw	4
	iorwf	(vPutSampleDataIntoTable@uiCalWidthCnt+1),w

	skipnz
	goto	u126_21
	goto	u126_20
u126_21:
	goto	i1l1532
u126_20:
	
i1l3688:	
	decf	(vPutSampleDataIntoTable@bInitArrayFlag),w
	skipz
	goto	u127_21
	goto	u127_20
u127_21:
	goto	i1l1543
u127_20:
	
i1l1532:	
	line	141
;common.c: 140: {
;common.c: 141: bInitArrayFlag = 1;
	clrf	(vPutSampleDataIntoTable@bInitArrayFlag)
	incf	(vPutSampleDataIntoTable@bInitArrayFlag),f
	line	143
	
i1l3690:	
;common.c: 143: if(uiCalWidthCnt >= uiCalWidthCnt)
	movf	(vPutSampleDataIntoTable@uiCalWidthCnt+1),w
	subwf	(vPutSampleDataIntoTable@uiCalWidthCnt+1),w
	skipz
	goto	u128_25
	movf	(vPutSampleDataIntoTable@uiCalWidthCnt),w
	subwf	(vPutSampleDataIntoTable@uiCalWidthCnt),w
u128_25:
	skipc
	goto	u128_21
	goto	u128_20
u128_21:
	goto	i1l1533
u128_20:
	line	144
	
i1l3692:	
;common.c: 144: uiCalWidthCnt = 0;
	clrf	(vPutSampleDataIntoTable@uiCalWidthCnt)
	clrf	(vPutSampleDataIntoTable@uiCalWidthCnt+1)
	
i1l1533:	
	line	146
	clrf	(vPutSampleDataIntoTable@uiSum)
	clrf	(vPutSampleDataIntoTable@uiSum+1)
	line	148
;common.c: 148: for(unsigned char ucIndex = 0; ucIndex < 4;ucIndex++)
	clrf	(vPutSampleDataIntoTable@ucIndex)
	line	150
	
i1l3698:	
;common.c: 149: {
;common.c: 150: uiSum += uiCalWidthArray[ucIndex];
	clrc
	rlf	(vPutSampleDataIntoTable@ucIndex),w
	addlw	vPutSampleDataIntoTable@uiCalWidthArray&0ffh
	movwf	fsr0
	movf	indf,w
	movwf	(??_vPutSampleDataIntoTable+0)+0+0
	incf	fsr0,f
	movf	indf,w
	movwf	(??_vPutSampleDataIntoTable+0)+0+1
	movf	0+(??_vPutSampleDataIntoTable+0)+0,w
	addwf	(vPutSampleDataIntoTable@uiSum),f
	skipnc
	incf	(vPutSampleDataIntoTable@uiSum+1),f
	movf	1+(??_vPutSampleDataIntoTable+0)+0,w
	addwf	(vPutSampleDataIntoTable@uiSum+1),f
	line	148
	
i1l3700:	
	incf	(vPutSampleDataIntoTable@ucIndex),f
	
i1l3702:	
	movlw	(04h)
	subwf	(vPutSampleDataIntoTable@ucIndex),w
	skipc
	goto	u129_21
	goto	u129_20
u129_21:
	goto	i1l3698
u129_20:
	line	154
	
i1l3704:	
;common.c: 152: }
;common.c: 154: uiCalWidth = uiSum >> 2;
	movf	(vPutSampleDataIntoTable@uiSum+1),w
	movwf	(vPutSampleDataIntoTable@uiCalWidth+1)
	movf	(vPutSampleDataIntoTable@uiSum),w
	movwf	(vPutSampleDataIntoTable@uiCalWidth)
	
i1l3706:	
	clrc
	rrf	(vPutSampleDataIntoTable@uiCalWidth+1),f
	rrf	(vPutSampleDataIntoTable@uiCalWidth),f
	clrc
	rrf	(vPutSampleDataIntoTable@uiCalWidth+1),f
	rrf	(vPutSampleDataIntoTable@uiCalWidth),f
	line	156
	
i1l3708:	
;common.c: 156: if(uiCalWidth > (312))
	movlw	high(0139h)
	subwf	(vPutSampleDataIntoTable@uiCalWidth+1),w
	movlw	low(0139h)
	skipnz
	subwf	(vPutSampleDataIntoTable@uiCalWidth),w
	skipc
	goto	u130_21
	goto	u130_20
u130_21:
	goto	i1l3712
u130_20:
	line	160
	
i1l3710:	
;common.c: 157: {
;common.c: 160: uiInitWidth++;
	incf	(vPutSampleDataIntoTable@uiInitWidth),f
	line	161
;common.c: 161: }
	goto	i1l3716
	line	162
	
i1l3712:	
;common.c: 162: else if(uiCalWidth < (312))
	movlw	high(0138h)
	subwf	(vPutSampleDataIntoTable@uiCalWidth+1),w
	movlw	low(0138h)
	skipnz
	subwf	(vPutSampleDataIntoTable@uiCalWidth),w
	skipnc
	goto	u131_21
	goto	u131_20
u131_21:
	goto	i1l3716
u131_20:
	line	166
	
i1l3714:	
;common.c: 163: {
;common.c: 166: uiInitWidth--;
	decf	(vPutSampleDataIntoTable@uiInitWidth),f
	line	171
;common.c: 167: }
	
i1l3716:	
;common.c: 171: if(uiInitWidth > 249)
	movlw	(0FAh)
	subwf	(vPutSampleDataIntoTable@uiInitWidth),w
	skipc
	goto	u132_21
	goto	u132_20
u132_21:
	goto	i1l1540
u132_20:
	line	172
	
i1l3718:	
;common.c: 172: uiInitWidth = 249;
	movlw	(0F9h)
	movwf	(vPutSampleDataIntoTable@uiInitWidth)
	
i1l1540:	
	line	174
;common.c: 174: if(uiInitWidth < 75)
	movlw	(04Bh)
	subwf	(vPutSampleDataIntoTable@uiInitWidth),w
	skipnc
	goto	u133_21
	goto	u133_20
u133_21:
	goto	i1l3722
u133_20:
	line	175
	
i1l3720:	
;common.c: 175: uiInitWidth = 75;
	movlw	(04Bh)
	movwf	(vPutSampleDataIntoTable@uiInitWidth)
	line	179
	
i1l3722:	
;common.c: 179: setPWM_Width(uiInitWidth);
	movf	(vPutSampleDataIntoTable@uiInitWidth),w
	fcall	_setPWM_Width
	goto	i1l1555
	line	210
	
i1l3724:	
;common.c: 208: else
;common.c: 209: {
;common.c: 210: ucChannelFirstLength = 0;
	clrf	(vPutSampleDataIntoTable@ucChannelFirstLength)
	line	212
	
i1l3726:	
;common.c: 212: uiSampleChannelFirst[ucChannelFirstLength] = uiSampleData;
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
	goto	i1l1555
	line	213
	
i1l1543:	
	line	214
;common.c: 213: }
;common.c: 214: }
	goto	i1l1555
	line	215
	
i1l3728:	
;common.c: 215: else if(channel == 13)
	movf	(vPutSampleDataIntoTable@channel),w
	xorlw	0Dh
	skipz
	goto	u134_21
	goto	u134_20
u134_21:
	goto	i1l3740
u134_20:
	line	217
	
i1l3730:	
;common.c: 216: {
;common.c: 217: if(ucChannelFourthLength < 10)
	movlw	(0Ah)
	subwf	(vPutSampleDataIntoTable@ucChannelFourthLength),w
	skipnc
	goto	u135_21
	goto	u135_20
u135_21:
	goto	i1l3736
u135_20:
	line	219
	
i1l3732:	
;common.c: 218: {
;common.c: 219: uiSampleChannelFourth[ucChannelFourthLength] = uiSampleData;
	clrc
	rlf	(vPutSampleDataIntoTable@ucChannelFourthLength),w
	addlw	_uiSampleChannelFourth&0ffh
	movwf	fsr0
	movf	(vPutSampleDataIntoTable@uiSampleData),w
	bcf	status, 7	;select IRP bank0
	movwf	indf
	incf	fsr0,f
	movf	(vPutSampleDataIntoTable@uiSampleData+1),w
	movwf	indf
	line	221
	
i1l3734:	
;common.c: 221: ucChannelFourthLength++;
	incf	(vPutSampleDataIntoTable@ucChannelFourthLength),f
	line	222
;common.c: 222: }
	goto	i1l1555
	line	225
	
i1l3736:	
;common.c: 223: else
;common.c: 224: {
;common.c: 225: ucChannelFourthLength = 0;
	clrf	(vPutSampleDataIntoTable@ucChannelFourthLength)
	line	227
	
i1l3738:	
;common.c: 227: uiSampleChannelFourth[ucChannelFourthLength] = uiSampleData;
	clrc
	rlf	(vPutSampleDataIntoTable@ucChannelFourthLength),w
	addlw	_uiSampleChannelFourth&0ffh
	movwf	fsr0
	movf	(vPutSampleDataIntoTable@uiSampleData),w
	bcf	status, 7	;select IRP bank0
	movwf	indf
	incf	fsr0,f
	movf	(vPutSampleDataIntoTable@uiSampleData+1),w
	movwf	indf
	goto	i1l1555
	line	230
	
i1l3740:	
;common.c: 230: else if(channel == 14)
	movf	(vPutSampleDataIntoTable@channel),w
	xorlw	0Eh
	skipz
	goto	u136_21
	goto	u136_20
u136_21:
	goto	i1l3752
u136_20:
	line	232
	
i1l3742:	
;common.c: 231: {
;common.c: 232: if(ucChannelFourteenthLength < 10)
	movlw	(0Ah)
	subwf	(vPutSampleDataIntoTable@ucChannelFourteenthLength),w
	skipnc
	goto	u137_21
	goto	u137_20
u137_21:
	goto	i1l3748
u137_20:
	line	234
	
i1l3744:	
;common.c: 233: {
;common.c: 234: uiSampleChannelFourteenth[ucChannelFourteenthLength] = uiSampleData;
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
	line	236
	
i1l3746:	
;common.c: 236: ucChannelFourteenthLength++;
	incf	(vPutSampleDataIntoTable@ucChannelFourteenthLength),f
	line	237
;common.c: 237: }
	goto	i1l1555
	line	240
	
i1l3748:	
;common.c: 238: else
;common.c: 239: {
;common.c: 240: ucChannelFourteenthLength = 0;
	clrf	(vPutSampleDataIntoTable@ucChannelFourteenthLength)
	line	242
	
i1l3750:	
;common.c: 242: uiSampleChannelFourth[ucChannelFourteenthLength] = uiSampleData;
	clrc
	rlf	(vPutSampleDataIntoTable@ucChannelFourteenthLength),w
	addlw	_uiSampleChannelFourth&0ffh
	movwf	fsr0
	movf	(vPutSampleDataIntoTable@uiSampleData),w
	bcf	status, 7	;select IRP bank0
	movwf	indf
	incf	fsr0,f
	movf	(vPutSampleDataIntoTable@uiSampleData+1),w
	movwf	indf
	goto	i1l1555
	line	247
	
i1l3752:	
;common.c: 245: else
;common.c: 246: {
;common.c: 247: ucChannelFirstLength = 0;
	clrf	(vPutSampleDataIntoTable@ucChannelFirstLength)
	line	249
;common.c: 249: ucChannelFourthLength = 0;
	clrf	(vPutSampleDataIntoTable@ucChannelFourthLength)
	line	251
;common.c: 251: ucChannelFourteenthLength = 0;
	clrf	(vPutSampleDataIntoTable@ucChannelFourteenthLength)
	line	253
;common.c: 253: for(int i = 0;i < 10; i++)
	bcf	status, 5	;RP0=0, select bank0
	clrf	(vPutSampleDataIntoTable@i)
	clrf	(vPutSampleDataIntoTable@i+1)
	line	255
	
i1l3758:	
;common.c: 254: {
;common.c: 255: uiSampleChannelFirst[i] = 0;
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	clrc
	rlf	(vPutSampleDataIntoTable@i),w
	addlw	_uiSampleChannelFirst&0ffh
	movwf	fsr0
	bsf	status, 7	;select IRP bank3
	clrf	indf
	incf	fsr0,f
	clrf	indf
	line	257
;common.c: 257: uiSampleChannelFourth[i] = 0;
	clrc
	rlf	(vPutSampleDataIntoTable@i),w
	addlw	_uiSampleChannelFourth&0ffh
	movwf	fsr0
	bcf	status, 7	;select IRP bank0
	clrf	indf
	incf	fsr0,f
	clrf	indf
	line	259
;common.c: 259: uiSampleChannelFourth[i] = 0;
	clrc
	rlf	(vPutSampleDataIntoTable@i),w
	addlw	_uiSampleChannelFourth&0ffh
	movwf	fsr0
	clrf	indf
	incf	fsr0,f
	clrf	indf
	line	253
	
i1l3760:	
	incf	(vPutSampleDataIntoTable@i),f
	skipnz
	incf	(vPutSampleDataIntoTable@i+1),f
	
i1l3762:	
	movf	(vPutSampleDataIntoTable@i+1),w
	xorlw	80h
	movwf	btemp+1
	movlw	(high(0Ah))^80h
	subwf	btemp+1,w
	skipz
	goto	u138_25
	movlw	low(0Ah)
	subwf	(vPutSampleDataIntoTable@i),w
u138_25:

	skipc
	goto	u138_21
	goto	u138_20
u138_21:
	goto	i1l3758
u138_20:
	line	263
	
i1l1555:	
	return
	opt stack 0
GLOBAL	__end_of_vPutSampleDataIntoTable
	__end_of_vPutSampleDataIntoTable:
;; =============== function _vPutSampleDataIntoTable ends ============

	signat	_vPutSampleDataIntoTable,8312
	global	i1_setAD_ConvertFlag
psect	text1269,local,class=CODE,delta=2
global __ptext1269
__ptext1269:

;; *************** function i1_setAD_ConvertFlag *****************
;; Defined at:
;;		line 301 in file "D:\develop\190625\AK7030-OTP\common.c"
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
psect	text1269
	file	"D:\develop\190625\AK7030-OTP\common.c"
	line	301
	global	__size_ofi1_setAD_ConvertFlag
	__size_ofi1_setAD_ConvertFlag	equ	__end_ofi1_setAD_ConvertFlag-i1_setAD_ConvertFlag
	
i1_setAD_ConvertFlag:	
	opt	stack 4
; Regs used in i1_setAD_ConvertFlag: [wreg]
;i1setAD_ConvertFlag@flag stored from wreg
	movwf	(i1setAD_ConvertFlag@flag)
	line	302
	
i1l3872:	
;common.c: 302: adc_convert_flag = flag;
	movf	(i1setAD_ConvertFlag@flag),w
	movwf	(_adc_convert_flag)
	line	303
	
i1l1573:	
	return
	opt stack 0
GLOBAL	__end_ofi1_setAD_ConvertFlag
	__end_ofi1_setAD_ConvertFlag:
;; =============== function i1_setAD_ConvertFlag ends ============

	signat	i1_setAD_ConvertFlag,88
	global	i1_Filter
psect	text1270,local,class=CODE,delta=2
global __ptext1270
__ptext1270:

;; *************** function i1_Filter *****************
;; Defined at:
;;		line 64 in file "D:\develop\190625\AK7030-OTP\common.c"
;; Parameters:    Size  Location     Type
;;  Filter          1    wreg     PTR int 
;;		 -> uiSampleChannelFirst(20), 
;; Auto vars:     Size  Location     Type
;;  Filter          1   20[BANK0 ] PTR int 
;;		 -> uiSampleChannelFirst(20), 
;;  Filter         20    0[BANK0 ] unsigned int [10]
;;  Filter          2   25[BANK0 ] int 
;;  Filter          2   23[BANK0 ] unsigned int 
;;  Filter          2   21[BANK0 ] unsigned int 
;;  Filter          1   28[BANK0 ] unsigned char 
;;  Filter          1   27[BANK0 ] unsigned char 
;; Return value:  Size  Location     Type
;;                  2    0[COMMON] unsigned int 
;; Registers used:
;;		wreg, fsr0l, fsr0h, status,2, status,0, btemp+1
;; Tracked objects:
;;		On entry : 160/120
;;		On exit  : 160/0
;;		Unchanged: FFE00/0
;; Data sizes:     COMMON   BANK0   BANK1   BANK3   BANK2
;;      Params:         2       0       0       0       0
;;      Locals:         0      29       0       0       0
;;      Temps:          4       0       0       0       0
;;      Totals:         6      29       0       0       0
;;Total ram usage:       35 bytes
;; Hardware stack levels used:    1
;; This function calls:
;;		Nothing
;; This function is called by:
;;		_vPutSampleDataIntoTable
;; This function uses a non-reentrant model
;;
psect	text1270
	file	"D:\develop\190625\AK7030-OTP\common.c"
	line	64
	global	__size_ofi1_Filter
	__size_ofi1_Filter	equ	__end_ofi1_Filter-i1_Filter
	
i1_Filter:	
	opt	stack 3
; Regs used in i1_Filter: [wreg-fsr0h+status,2+status,0+btemp+1]
;i1Filter@tmpValue stored from wreg
	line	66
	bcf	status, 5	;RP0=0, select bank0
	movwf	(i1Filter@tmpValue)
	
i1l3822:	
	clrf	(i1Filter@j)
	line	68
;common.c: 68: unsigned int filter_temp = 0, filter_sum = 0;
	clrf	(i1Filter@filter_temp)
	clrf	(i1Filter@filter_temp+1)
	clrf	(i1Filter@filter_sum)
	clrf	(i1Filter@filter_sum+1)
	line	72
;common.c: 70: unsigned int filter_buf[10];
;common.c: 72: for(int cir = 0;cir < 10; cir++)
	clrf	(i1Filter@cir)
	clrf	(i1Filter@cir+1)
	line	73
	
i1l3828:	
;common.c: 73: filter_buf[cir] = *tmpValue++;
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	movf	(i1Filter@tmpValue),w
	movwf	fsr0
	bsf	status,7
	btfss	(i1Filter@tmpValue+1),0
	bcf	status,7
	movf	indf,w
	movwf	(??i1_Filter+0)+0+0
	incf	fsr0,f
	movf	indf,w
	movwf	(??i1_Filter+0)+0+1
	clrc
	rlf	(i1Filter@cir),w
	addlw	i1Filter@filter_buf&0ffh
	movwf	fsr0
	movf	0+(??i1_Filter+0)+0,w
	bcf	status, 7	;select IRP bank0
	movwf	indf
	incf	fsr0,f
	movf	1+(??i1_Filter+0)+0,w
	movwf	indf
	
i1l3830:	
	movlw	02h
	addwf	(i1Filter@tmpValue),f
	skipnc
	incf	(i1Filter@tmpValue+1),f
	line	72
	
i1l3832:	
	incf	(i1Filter@cir),f
	skipnz
	incf	(i1Filter@cir+1),f
	
i1l3834:	
	movf	(i1Filter@cir+1),w
	xorlw	80h
	movwf	btemp+1
	movlw	(high(0Ah))^80h
	subwf	btemp+1,w
	skipz
	goto	u151_25
	movlw	low(0Ah)
	subwf	(i1Filter@cir),w
u151_25:

	skipc
	goto	u151_21
	goto	u151_20
u151_21:
	goto	i1l3828
u151_20:
	line	77
	
i1l3836:	
;common.c: 77: for(j = 0; j < 10 - 1; j++)
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	clrf	(i1Filter@j)
	line	79
	
i1l3842:	
;common.c: 78: {
;common.c: 79: for(i = 0; i < 10 - 1 - j; i++)
	clrf	(i1Filter@i)
	goto	i1l3850
	line	81
	
i1l3844:	
;common.c: 80: {
;common.c: 81: if(filter_buf[i] > filter_buf[i + 1])
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	clrc
	rlf	(i1Filter@i),w
	addlw	i1Filter@filter_buf&0ffh
	movwf	fsr0
	bcf	status, 7	;select IRP bank0
	movf	indf,w
	movwf	(??i1_Filter+0)+0+0
	incf	fsr0,f
	movf	indf,w
	movwf	(??i1_Filter+0)+0+1
	clrc
	rlf	(i1Filter@i),w
	addlw	02h
	addlw	i1Filter@filter_buf&0ffh
	movwf	fsr0
	movf	indf,w
	movwf	(??i1_Filter+2)+0+0
	incf	fsr0,f
	movf	indf,w
	movwf	(??i1_Filter+2)+0+1
	movf	1+(??i1_Filter+0)+0,w
	subwf	1+(??i1_Filter+2)+0,w
	skipz
	goto	u152_25
	movf	0+(??i1_Filter+0)+0,w
	subwf	0+(??i1_Filter+2)+0,w
u152_25:
	skipnc
	goto	u152_21
	goto	u152_20
u152_21:
	goto	i1l3848
u152_20:
	line	84
	
i1l3846:	
;common.c: 82: {
;common.c: 84: filter_temp = filter_buf[i];
	clrc
	rlf	(i1Filter@i),w
	addlw	i1Filter@filter_buf&0ffh
	movwf	fsr0
	movf	indf,w
	movwf	(i1Filter@filter_temp)
	incf	fsr0,f
	movf	indf,w
	movwf	(i1Filter@filter_temp+1)
	line	86
;common.c: 86: filter_buf[i] = filter_buf[i + 1];
	clrc
	rlf	(i1Filter@i),w
	addlw	02h
	addlw	i1Filter@filter_buf&0ffh
	movwf	fsr0
	movf	indf,w
	movwf	(??i1_Filter+0)+0+0
	incf	fsr0,f
	movf	indf,w
	movwf	(??i1_Filter+0)+0+1
	clrc
	rlf	(i1Filter@i),w
	addlw	i1Filter@filter_buf&0ffh
	movwf	fsr0
	movf	0+(??i1_Filter+0)+0,w
	movwf	indf
	incf	fsr0,f
	movf	1+(??i1_Filter+0)+0,w
	movwf	indf
	line	88
;common.c: 88: filter_buf[i + 1] = filter_temp;
	clrc
	rlf	(i1Filter@i),w
	addlw	02h
	addlw	i1Filter@filter_buf&0ffh
	movwf	fsr0
	movf	(i1Filter@filter_temp),w
	movwf	indf
	incf	fsr0,f
	movf	(i1Filter@filter_temp+1),w
	movwf	indf
	line	79
	
i1l3848:	
	incf	(i1Filter@i),f
	
i1l3850:	
	movlw	high(09h)
	movwf	(??i1_Filter+0)+0+1
	movf	(i1Filter@j),w
	sublw	low(09h)
	movwf	(??i1_Filter+0)+0
	skipc
	decf	(??i1_Filter+0)+0+1,f
	movf	1+(??i1_Filter+0)+0,w
	xorlw	80h
	sublw	080h
	skipz
	goto	u153_25
	movf	0+(??i1_Filter+0)+0,w
	subwf	(i1Filter@i),w
u153_25:

	skipc
	goto	u153_21
	goto	u153_20
u153_21:
	goto	i1l3844
u153_20:
	line	77
	
i1l3852:	
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	incf	(i1Filter@j),f
	
i1l3854:	
	movlw	(09h)
	subwf	(i1Filter@j),w
	skipc
	goto	u154_21
	goto	u154_20
u154_21:
	goto	i1l3842
u154_20:
	
i1l1503:	
	line	93
;common.c: 89: }
;common.c: 90: }
;common.c: 91: }
;common.c: 93: for(i = 1; i < 10 - 1; i++)
	clrf	(i1Filter@i)
	incf	(i1Filter@i),f
	line	95
	
i1l3860:	
;common.c: 94: {
;common.c: 95: filter_sum += filter_buf[i];
	clrc
	rlf	(i1Filter@i),w
	addlw	i1Filter@filter_buf&0ffh
	movwf	fsr0
	bcf	status, 7	;select IRP bank0
	movf	indf,w
	movwf	(??i1_Filter+0)+0+0
	incf	fsr0,f
	movf	indf,w
	movwf	(??i1_Filter+0)+0+1
	movf	0+(??i1_Filter+0)+0,w
	addwf	(i1Filter@filter_sum),f
	skipnc
	incf	(i1Filter@filter_sum+1),f
	movf	1+(??i1_Filter+0)+0,w
	addwf	(i1Filter@filter_sum+1),f
	line	93
	
i1l3862:	
	incf	(i1Filter@i),f
	
i1l3864:	
	movlw	(09h)
	subwf	(i1Filter@i),w
	skipc
	goto	u155_21
	goto	u155_20
u155_21:
	goto	i1l3860
u155_20:
	line	98
	
i1l3866:	
;common.c: 96: }
;common.c: 98: return (filter_sum >> 3);
	movf	(i1Filter@filter_sum+1),w
	movwf	(?i1_Filter+1)
	movf	(i1Filter@filter_sum),w
	movwf	(?i1_Filter)
	
i1l3868:	
	clrc
	rrf	(?i1_Filter+1),f
	rrf	(?i1_Filter),f
	clrc
	rrf	(?i1_Filter+1),f
	rrf	(?i1_Filter),f
	clrc
	rrf	(?i1_Filter+1),f
	rrf	(?i1_Filter),f
	line	100
	
i1l1510:	
	return
	opt stack 0
GLOBAL	__end_ofi1_Filter
	__end_ofi1_Filter:
;; =============== function i1_Filter ends ============

	signat	i1_Filter,90
	global	_adc_get
psect	text1271,local,class=CODE,delta=2
global __ptext1271
__ptext1271:

;; *************** function _adc_get *****************
;; Defined at:
;;		line 106 in file "D:\develop\190625\AK7030-OTP\periph.c"
;; Parameters:    Size  Location     Type
;;		None
;; Auto vars:     Size  Location     Type
;;  val             2    2[COMMON] unsigned int 
;; Return value:  Size  Location     Type
;;                  2    0[COMMON] unsigned int 
;; Registers used:
;;		wreg
;; Tracked objects:
;;		On entry : 60/20
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
psect	text1271
	file	"D:\develop\190625\AK7030-OTP\periph.c"
	line	106
	global	__size_of_adc_get
	__size_of_adc_get	equ	__end_of_adc_get-_adc_get
	
_adc_get:	
	opt	stack 4
; Regs used in _adc_get: [wreg]
	line	108
	
i1l3818:	
;periph.c: 107: unsigned int val;
;periph.c: 108: val = (ADRESH<<8) | ADRESL;
	bcf	status, 5	;RP0=0, select bank0
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
	
i1l2353:	
	return
	opt stack 0
GLOBAL	__end_of_adc_get
	__end_of_adc_get:
;; =============== function _adc_get ends ============

	signat	_adc_get,90
	global	_setPWM_Width
psect	text1272,local,class=CODE,delta=2
global __ptext1272
__ptext1272:

;; *************** function _setPWM_Width *****************
;; Defined at:
;;		line 54 in file "D:\develop\190625\AK7030-OTP\common.c"
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
psect	text1272
	file	"D:\develop\190625\AK7030-OTP\common.c"
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
	
i1l3618:	
;common.c: 55: static unsigned char ucOldWidth = 0;
;common.c: 56: if( ucOldWidth != ucWidth)
	movf	(setPWM_Width@ucOldWidth),w
	xorwf	(setPWM_Width@ucWidth),w
	skipnz
	goto	u117_21
	goto	u117_20
u117_21:
	goto	i1l1497
u117_20:
	line	58
	
i1l3620:	
;common.c: 57: {
;common.c: 58: CCPR1L = ucWidth;
	movf	(setPWM_Width@ucWidth),w
	movwf	(21)	;volatile
	line	59
;common.c: 59: ucOldWidth = ucWidth;
	movf	(setPWM_Width@ucWidth),w
	movwf	(setPWM_Width@ucOldWidth)
	line	61
	
i1l1497:	
	return
	opt stack 0
GLOBAL	__end_of_setPWM_Width
	__end_of_setPWM_Width:
;; =============== function _setPWM_Width ends ============

	signat	_setPWM_Width,4216
psect	text1273,local,class=CODE,delta=2
global __ptext1273
__ptext1273:
	global	btemp
	btemp set 07Eh

	DABS	1,126,2	;btemp
	global	wtemp0
	wtemp0 set btemp
	end
