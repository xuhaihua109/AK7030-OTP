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
# 100 "D:\develop\AK7030-OTP-191211-change-pin_bb_div2(two_filter)\AK7030-OTP\main.c"
	psect config,class=CONFIG,delta=2 ;#
# 100 "D:\develop\AK7030-OTP-191211-change-pin_bb_div2(two_filter)\AK7030-OTP\main.c"
	dw 0x0FFF & 0x3FFF & 0x3FFF & 0x3FFF & 0x3FFF & 0x3FFF ;#
# 101 "D:\develop\AK7030-OTP-191211-change-pin_bb_div2(two_filter)\AK7030-OTP\main.c"
	psect config,class=CONFIG,delta=2 ;#
# 101 "D:\develop\AK7030-OTP-191211-change-pin_bb_div2(two_filter)\AK7030-OTP\main.c"
	dw 0x3FFF & 0x3FDF & 0x3FFF & 0x3FFE ;#
# 102 "D:\develop\AK7030-OTP-191211-change-pin_bb_div2(two_filter)\AK7030-OTP\main.c"
	psect config,class=CONFIG,delta=2 ;#
# 102 "D:\develop\AK7030-OTP-191211-change-pin_bb_div2(two_filter)\AK7030-OTP\main.c"
	dw 0X3FFF & 0x3F7F & 0x3FFF & 0x3FF8 ;#
	FNCALL	_main,_initPin
	FNCALL	_main,_setPinInitVaule
	FNCALL	_main,_selectAdChannel
	FNCALL	_main,_clock_config
	FNCALL	_main,_timer1_config
	FNCALL	_main,_timer1_interrupt_config
	FNCALL	_main,_uid_get
	FNCALL	_main,_op1_init
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
	file	"D:\develop\AK7030-OTP-191211-change-pin_bb_div2(two_filter)\AK7030-OTP\common.c"
	line	24

;initializer for _sampleChannelSelect
	retlw	02h
	line	200

;initializer for vPutSampleDataIntoTable@uiInitWidth
	retlw	04Bh
	global	_uiBigTimer
	global	_uiOneHourTimer
	global	_uiSmallTimer
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
	global	main@cTimerP5s_795
	global	main@cTimerP5s_801
	global	main@ucStep
	global	main@ucTimerP3s
	global	main@ucTimerP5s
	global	vPutSampleDataIntoTable@ucCh13Length
	global	vPutSampleDataIntoTable@ucChannelFourteenthLength
	global	vPutSampleDataIntoTable@uiCalWidthArrayNew
	global	vPutSampleDataIntoTable@ucCh12Length
	global	_ad_offset
	global	_uiTwentyMinTimer
	global	_uiTwentySecondsTimer
	global	main@ucDelay1s
	global	main@uiTimerOneP5s
	global	main@uiTimerTwoP5s
	global	vPutSampleDataIntoTable@uiCalWidthCnt
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
vPutSampleDataIntoTable@uiCalWidthArrayNew:
       ds      2

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

vPutSampleDataIntoTable@ucCh13Length:
       ds      1

vPutSampleDataIntoTable@ucChannelFourteenthLength:
       ds      1

psect	dataBANK0,class=BANK0,space=1
global __pdataBANK0
__pdataBANK0:
	file	"D:\develop\AK7030-OTP-191211-change-pin_bb_div2(two_filter)\AK7030-OTP\common.c"
	line	24
_sampleChannelSelect:
       ds      1

psect	dataBANK0
	file	"D:\develop\AK7030-OTP-191211-change-pin_bb_div2(two_filter)\AK7030-OTP\common.c"
	line	200
vPutSampleDataIntoTable@uiInitWidth:
       ds      1

psect	bssBANK1,class=BANK1,space=1
global __pbssBANK1
__pbssBANK1:
_ad_offset:
       ds      2

_uiTwentyMinTimer:
       ds      2

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
	clrf	((__pbssCOMMON)+1)&07Fh
	clrf	((__pbssCOMMON)+2)&07Fh
; Clear objects allocated to BANK0
psect cinit,class=CODE,delta=2
	bcf	status, 7	;select IRP bank0
	movlw	low(__pbssBANK0)
	movwf	fsr
	movlw	low((__pbssBANK0)+018h)
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
	global	??_FilterCh13
??_FilterCh13:	; 0 bytes @ 0x0
	ds	4
	global	FilterCh13@tmpValue
FilterCh13@tmpValue:	; 1 bytes @ 0x4
	ds	1
	global	FilterCh13@filter_temp
FilterCh13@filter_temp:	; 2 bytes @ 0x5
	ds	2
	global	FilterCh13@filter_sum
FilterCh13@filter_sum:	; 2 bytes @ 0x7
	ds	2
	global	FilterCh13@filter_buf
FilterCh13@filter_buf:	; 6 bytes @ 0x9
	ds	6
	global	FilterCh13@cir
FilterCh13@cir:	; 2 bytes @ 0xF
	ds	2
	global	FilterCh13@j
FilterCh13@j:	; 1 bytes @ 0x11
	ds	1
	global	FilterCh13@i
FilterCh13@i:	; 1 bytes @ 0x12
	ds	1
	global	??_main
??_main:	; 0 bytes @ 0x13
	ds	1
	global	main@ucChValue
main@ucChValue:	; 2 bytes @ 0x14
	ds	2
	global	main@uiCh13Value
main@uiCh13Value:	; 2 bytes @ 0x16
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
	global	?_uid_get
?_uid_get:	; 0 bytes @ 0x0
	global	?_op1_init
?_op1_init:	; 0 bytes @ 0x0
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
	global	vPutSampleDataIntoTable@uiAbstractValue
vPutSampleDataIntoTable@uiAbstractValue:	; 2 bytes @ 0xF
	ds	2
	global	vPutSampleDataIntoTable@i
vPutSampleDataIntoTable@i:	; 2 bytes @ 0x11
	ds	2
	global	vPutSampleDataIntoTable@uiDeviationValue
vPutSampleDataIntoTable@uiDeviationValue:	; 2 bytes @ 0x13
	ds	2
	global	??_ISR
??_ISR:	; 0 bytes @ 0x15
	ds	4
	global	??_clearTwelveHoursTimer
??_clearTwelveHoursTimer:	; 0 bytes @ 0x19
	global	??_clearThreeHoursTimer
??_clearThreeHoursTimer:	; 0 bytes @ 0x19
	global	??_clearOneHoursTimer
??_clearOneHoursTimer:	; 0 bytes @ 0x19
	global	??_clearTwentyMinTimer
??_clearTwentyMinTimer:	; 0 bytes @ 0x19
	global	??_clock_config
??_clock_config:	; 0 bytes @ 0x19
	global	??_timer1_config
??_timer1_config:	; 0 bytes @ 0x19
	global	??_timer1_interrupt_config
??_timer1_interrupt_config:	; 0 bytes @ 0x19
	global	??_uid_get
??_uid_get:	; 0 bytes @ 0x19
	global	??_op1_init
??_op1_init:	; 0 bytes @ 0x19
	global	?_adc_test_init
?_adc_test_init:	; 0 bytes @ 0x19
	global	?_startTwentyMinTimer
?_startTwentyMinTimer:	; 0 bytes @ 0x19
	global	??_adc_start
??_adc_start:	; 0 bytes @ 0x19
	global	??_isPermitSampleTime
??_isPermitSampleTime:	; 0 bytes @ 0x19
	global	??_clrSampeTime
??_clrSampeTime:	; 0 bytes @ 0x19
	global	??_isFinishedTwentyMinTimer
??_isFinishedTwentyMinTimer:	; 0 bytes @ 0x19
	global	?_startTwelveHourTimer
?_startTwelveHourTimer:	; 0 bytes @ 0x19
	global	??_isFinishedTwelveHoursTimer
??_isFinishedTwelveHoursTimer:	; 0 bytes @ 0x19
	global	?_startThreeHoursTimer
?_startThreeHoursTimer:	; 0 bytes @ 0x19
	global	??_isFinishedThreeHoursTimer
??_isFinishedThreeHoursTimer:	; 0 bytes @ 0x19
	global	?_startOneHoursTimer
?_startOneHoursTimer:	; 0 bytes @ 0x19
	global	??_isFinishedOneHoursTimer
??_isFinishedOneHoursTimer:	; 0 bytes @ 0x19
	global	??_setWaitResetFlag
??_setWaitResetFlag:	; 0 bytes @ 0x19
	global	??_AD_Sample
??_AD_Sample:	; 0 bytes @ 0x19
	global	??_initPB3
??_initPB3:	; 0 bytes @ 0x19
	global	??_setPB3
??_setPB3:	; 0 bytes @ 0x19
	global	??_initPB4
??_initPB4:	; 0 bytes @ 0x19
	global	??_setPB4
??_setPB4:	; 0 bytes @ 0x19
	global	??_initPB5
??_initPB5:	; 0 bytes @ 0x19
	global	??_setPB5
??_setPB5:	; 0 bytes @ 0x19
	global	??_initPB2_AsHighResistence
??_initPB2_AsHighResistence:	; 0 bytes @ 0x19
	global	?_pwm_start
?_pwm_start:	; 0 bytes @ 0x19
	global	??_selectAdChannel
??_selectAdChannel:	; 0 bytes @ 0x19
	global	??_reset
??_reset:	; 0 bytes @ 0x19
	global	??_resetAllTimer
??_resetAllTimer:	; 0 bytes @ 0x19
	global	??_getAD_ConvertFlag
??_getAD_ConvertFlag:	; 0 bytes @ 0x19
	global	??_setAD_ConvertFlag
??_setAD_ConvertFlag:	; 0 bytes @ 0x19
	global	?_FilterCh13
?_FilterCh13:	; 2 bytes @ 0x19
	global	initPB3@bValue
initPB3@bValue:	; 1 bytes @ 0x19
	global	setPB3@bValue
setPB3@bValue:	; 1 bytes @ 0x19
	global	initPB4@bValue
initPB4@bValue:	; 1 bytes @ 0x19
	global	setPB4@bValue
setPB4@bValue:	; 1 bytes @ 0x19
	global	initPB5@bValue
initPB5@bValue:	; 1 bytes @ 0x19
	global	setPB5@bValue
setPB5@bValue:	; 1 bytes @ 0x19
	global	pwm_start@ucPulseFrequency
pwm_start@ucPulseFrequency:	; 1 bytes @ 0x19
	global	setWaitResetFlag@bValue
setWaitResetFlag@bValue:	; 1 bytes @ 0x19
	global	setAD_ConvertFlag@flag
setAD_ConvertFlag@flag:	; 1 bytes @ 0x19
	global	adc_test_init@ref
adc_test_init@ref:	; 1 bytes @ 0x19
	global	startTwelveHourTimer@uiSetTime
startTwelveHourTimer@uiSetTime:	; 2 bytes @ 0x19
	global	startThreeHoursTimer@uiSetTime
startThreeHoursTimer@uiSetTime:	; 2 bytes @ 0x19
	global	startOneHoursTimer@uiSetTime
startOneHoursTimer@uiSetTime:	; 2 bytes @ 0x19
	global	startTwentyMinTimer@uiSetValue
startTwentyMinTimer@uiSetValue:	; 2 bytes @ 0x19
	ds	1
	global	??_adc_test_init
??_adc_test_init:	; 0 bytes @ 0x1A
	global	??_pwm_start
??_pwm_start:	; 0 bytes @ 0x1A
	global	??_initPin
??_initPin:	; 0 bytes @ 0x1A
	global	??_setPinInitVaule
??_setPinInitVaule:	; 0 bytes @ 0x1A
	global	pwm_start@ucPulseWidth
pwm_start@ucPulseWidth:	; 1 bytes @ 0x1A
	ds	1
	global	??_startTwentyMinTimer
??_startTwentyMinTimer:	; 0 bytes @ 0x1B
	global	??_startTwelveHourTimer
??_startTwelveHourTimer:	; 0 bytes @ 0x1B
	global	??_startThreeHoursTimer
??_startThreeHoursTimer:	; 0 bytes @ 0x1B
	global	??_startOneHoursTimer
??_startOneHoursTimer:	; 0 bytes @ 0x1B
	global	?_getAdOriginalCh13Value
?_getAdOriginalCh13Value:	; 2 bytes @ 0x1B
	global	adc_test_init@channel
adc_test_init@channel:	; 1 bytes @ 0x1B
	ds	1
	global	??_process_AD_Converter_Value
??_process_AD_Converter_Value:	; 0 bytes @ 0x1C
	ds	1
	global	??_getAdOriginalCh13Value
??_getAdOriginalCh13Value:	; 0 bytes @ 0x1D
;;Data sizes: Strings 0, constant 0, data 2, bss 59, persistent 0 stack 0
;;Auto spaces:   Size  Autos    Used
;; COMMON          14     11      14
;; BANK0           80     29      55
;; BANK1           80     24      56
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
;;                                             19 BANK1      5     5      0
;;                            _initPin
;;                    _setPinInitVaule
;;                    _selectAdChannel
;;                       _clock_config
;;                      _timer1_config
;;            _timer1_interrupt_config
;;                            _uid_get
;;                           _op1_init
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
;;                                             25 BANK0      1     1      0
;; ---------------------------------------------------------------------------------
;; (2) _getAD_ConvertFlag                                    0     0      0       0
;; ---------------------------------------------------------------------------------
;; (2) _FilterCh13                                          21    19      2     915
;;                                             25 BANK0      2     0      2
;;                                              0 BANK1     19    19      0
;; ---------------------------------------------------------------------------------
;; (1) _setWaitResetFlag                                     1     1      0      31
;;                                             25 BANK0      1     1      0
;; ---------------------------------------------------------------------------------
;; (1) _isFinishedOneHoursTimer                              0     0      0       0
;; ---------------------------------------------------------------------------------
;; (1) _startOneHoursTimer                                   2     0      2      31
;;                                             25 BANK0      2     0      2
;; ---------------------------------------------------------------------------------
;; (1) _isFinishedThreeHoursTimer                            0     0      0       0
;; ---------------------------------------------------------------------------------
;; (1) _startThreeHoursTimer                                 2     0      2      31
;;                                             25 BANK0      2     0      2
;; ---------------------------------------------------------------------------------
;; (1) _isFinishedTwelveHoursTimer                           0     0      0       0
;; ---------------------------------------------------------------------------------
;; (1) _startTwelveHourTimer                                 2     0      2      31
;;                                             25 BANK0      2     0      2
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
;;                                             25 BANK0      2     0      2
;; ---------------------------------------------------------------------------------
;; (2) _adc_test_init                                        3     2      1      62
;;                                             25 BANK0      3     2      1
;; ---------------------------------------------------------------------------------
;; (1) _op1_init                                             0     0      0       0
;; ---------------------------------------------------------------------------------
;; (1) _uid_get                                              0     0      0       0
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
;;                                             25 BANK0      2     1      1
;; ---------------------------------------------------------------------------------
;; (2) _initPB2_AsHighResistence                             0     0      0       0
;; ---------------------------------------------------------------------------------
;; (1) _setPB5                                               1     1      0      31
;;                                             25 BANK0      1     1      0
;; ---------------------------------------------------------------------------------
;; (2) _initPB5                                              1     1      0      31
;;                                             25 BANK0      1     1      0
;; ---------------------------------------------------------------------------------
;; (1) _setPB4                                               1     1      0      31
;;                                             25 BANK0      1     1      0
;; ---------------------------------------------------------------------------------
;; (2) _initPB4                                              1     1      0      31
;;                                             25 BANK0      1     1      0
;; ---------------------------------------------------------------------------------
;; (1) _setPB3                                               1     1      0      31
;;                                             25 BANK0      1     1      0
;; ---------------------------------------------------------------------------------
;; (2) _initPB3                                              1     1      0      31
;;                                             25 BANK0      1     1      0
;; ---------------------------------------------------------------------------------
;; Estimated maximum stack depth 2
;; ---------------------------------------------------------------------------------
;; (Depth) Function   	        Calls       Base Space   Used Autos Params    Refs
;; ---------------------------------------------------------------------------------
;; (3) _ISR                                                  4     4      0    1208
;;                                             21 BANK0      4     4      0
;;                i1_setAD_ConvertFlag
;;                            _adc_get
;;            _vPutSampleDataIntoTable
;; ---------------------------------------------------------------------------------
;; (4) _vPutSampleDataIntoTable                             11     8      3    1110
;;                                              6 COMMON     5     2      3
;;                                             15 BANK0      6     6      0
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
;;   _uid_get
;;   _op1_init
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
;;BANK1               50     18      38       8       70.0%
;;BITBANK1            50      0       0       7        0.0%
;;CODE                 0      0       0       0        0.0%
;;DATA                 0      0      85       6        0.0%
;;ABS                  0      0      7D       3        0.0%
;;NULL                 0      0       0       0        0.0%
;;STACK                0      0       8       2        0.0%
;;BANK0               50     1D      37       5       68.8%
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
;;		line 529 in file "D:\develop\AK7030-OTP-191211-change-pin_bb_div2(two_filter)\AK7030-OTP\main.c"
;; Parameters:    Size  Location     Type
;;		None
;; Auto vars:     Size  Location     Type
;;  ucChValue       2   20[BANK1 ] unsigned int 
;;  uiCh13Value     2   22[BANK1 ] unsigned int 
;; Return value:  Size  Location     Type
;;                  2  738[COMMON] int 
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
;;		_uid_get
;;		_op1_init
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
	file	"D:\develop\AK7030-OTP-191211-change-pin_bb_div2(two_filter)\AK7030-OTP\main.c"
	line	529
	global	__size_of_main
	__size_of_main	equ	__end_of_main-_main
	
_main:	
	opt	stack 3
; Regs used in _main: [wreg-fsr0h+status,2+status,0+btemp+1+pclath+cstack]
	line	557
	
l4313:	
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
	
l4315:	
;main.c: 559: selectAdChannel();
	fcall	_selectAdChannel
	line	561
	
l4317:	
;main.c: 561: clock_config();
	fcall	_clock_config
	line	562
	
l4319:	
;main.c: 562: timer1_config();
	fcall	_timer1_config
	line	563
	
l4321:	
;main.c: 563: timer1_interrupt_config();
	fcall	_timer1_interrupt_config
	line	565
;main.c: 565: uid_get();
	fcall	_uid_get
	line	567
;main.c: 567: op1_init();
	fcall	_op1_init
	line	569
;main.c: 569: adc_test_init(2,0);
	clrf	(?_adc_test_init)
	movlw	(02h)
	fcall	_adc_test_init
	line	575
;main.c: 575: startTwentyMinTimer( 1200 );
	movlw	low(04B0h)
	bcf	status, 5	;RP0=0, select bank0
	movwf	(?_startTwentyMinTimer)
	movlw	high(04B0h)
	movwf	((?_startTwentyMinTimer))+1
	fcall	_startTwentyMinTimer
	line	576
	
l4323:	
;main.c: 576: _delay(1000);
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

	line	577
;main.c: 577: adc_start();
	fcall	_adc_start
	line	595
	
l4325:	
# 595 "D:\develop\AK7030-OTP-191211-change-pin_bb_div2(two_filter)\AK7030-OTP\main.c"
 clrwdt ;#
psect	maintext
	line	597
	
l4327:	
;main.c: 597: process_AD_Converter_Value();
	fcall	_process_AD_Converter_Value
	line	599
	
l4329:	
;main.c: 599: if( isPermitSampleTime() )
	fcall	_isPermitSampleTime
	xorlw	0
	skipnz
	goto	u2051
	goto	u2050
u2051:
	goto	l4325
u2050:
	line	603
	
l4331:	
;main.c: 600: {
;main.c: 603: clrSampeTime();
	fcall	_clrSampeTime
	line	612
;main.c: 612: switch(ucStep)
	goto	l4477
	line	623
	
l4333:	
;main.c: 616: {
;main.c: 621: static unsigned char ucTimerP3s = 0;
;main.c: 623: if( isFinishedTwentyMinTimer() )
	fcall	_isFinishedTwentyMinTimer
	xorlw	0
	skipnz
	goto	u2061
	goto	u2060
u2061:
	goto	l4339
u2060:
	line	625
	
l4335:	
;main.c: 624: {
;main.c: 625: ucStep = READY_FOR_RESET_STEP;
	movlw	(063h)
	bcf	status, 5	;RP0=0, select bank0
	movwf	(main@ucStep)
	line	626
	
l4337:	
;main.c: 626: ucTimerP3s = 0;
	clrf	(main@ucTimerP3s)
	line	627
;main.c: 627: }
	goto	l4325
	line	630
	
l4339:	
;main.c: 628: else
;main.c: 629: {
;main.c: 630: if( getAdOriginalCh13Value() > 145 )
	fcall	_getAdOriginalCh13Value
	movlw	high(092h)
	subwf	(1+(?_getAdOriginalCh13Value)),w
	movlw	low(092h)
	skipnz
	subwf	(0+(?_getAdOriginalCh13Value)),w
	skipc
	goto	u2071
	goto	u2070
u2071:
	goto	l4343
u2070:
	line	632
	
l4341:	
;main.c: 631: {
;main.c: 632: ucTimerP3s++;
	incf	(main@ucTimerP3s),f
	line	633
;main.c: 633: }
	goto	l4345
	line	635
	
l4343:	
;main.c: 634: else
;main.c: 635: ucTimerP3s = 0;
	clrf	(main@ucTimerP3s)
	line	637
	
l4345:	
;main.c: 637: if( ucTimerP3s >= 30)
	movlw	(01Eh)
	subwf	(main@ucTimerP3s),w
	skipc
	goto	u2081
	goto	u2080
u2081:
	goto	l742
u2080:
	line	639
	
l4347:	
;main.c: 638: {
;main.c: 639: ucTimerP3s = 0;
	clrf	(main@ucTimerP3s)
	line	640
	
l4349:	
;main.c: 640: ucStep = START_UP_PWM_STEP;
	clrf	(main@ucStep)
	incf	(main@ucStep),f
	goto	l4325
	line	656
	
l4351:	
;main.c: 651: {
;main.c: 656: pwm_start(150,249);
	movlw	(0F9h)
	movwf	(?_pwm_start)
	movlw	(096h)
	fcall	_pwm_start
	line	658
;main.c: 658: setPB3(0);
	movlw	(0)
	fcall	_setPB3
	line	659
;main.c: 659: setPB4(1);
	movlw	(01h)
	fcall	_setPB4
	line	660
;main.c: 660: setPB5(0);
	movlw	(0)
	fcall	_setPB5
	line	661
	
l4353:	
;main.c: 661: clearTwentyMinTimer();
	fcall	_clearTwentyMinTimer
	line	662
	
l4355:	
;main.c: 662: startTwelveHourTimer( 36000);
	movlw	low(08CA0h)
	movwf	(?_startTwelveHourTimer)
	movlw	high(08CA0h)
	movwf	((?_startTwelveHourTimer))+1
	fcall	_startTwelveHourTimer
	line	663
	
l4357:	
;main.c: 663: ucStep = CHECK_10_HOUR_TIMER_STEP;
	movlw	(02h)
	movwf	(main@ucStep)
	line	664
;main.c: 664: break;
	goto	l4325
	line	675
	
l4359:	
;main.c: 668: {
;main.c: 673: static unsigned char ucTimerP5s = 0;
;main.c: 675: if( isFinishedTwelveHoursTimer () )
	fcall	_isFinishedTwelveHoursTimer
	xorlw	0
	skipnz
	goto	u2091
	goto	u2090
u2091:
	goto	l4363
u2090:
	line	676
	
l4361:	
;main.c: 676: ucStep = READY_FOR_RESET_STEP;
	movlw	(063h)
	movwf	(main@ucStep)
	goto	l4325
	line	679
	
l4363:	
;main.c: 677: else
;main.c: 678: {
;main.c: 679: if( getAdOriginalCh13Value() < 322 )
	fcall	_getAdOriginalCh13Value
	movlw	high(0142h)
	subwf	(1+(?_getAdOriginalCh13Value)),w
	movlw	low(0142h)
	skipnz
	subwf	(0+(?_getAdOriginalCh13Value)),w
	skipnc
	goto	u2101
	goto	u2100
u2101:
	goto	l4367
u2100:
	line	680
	
l4365:	
;main.c: 680: ucTimerP5s++;
	incf	(main@ucTimerP5s),f
	goto	l4369
	line	682
	
l4367:	
;main.c: 681: else
;main.c: 682: ucTimerP5s = 0;
	clrf	(main@ucTimerP5s)
	line	684
	
l4369:	
;main.c: 684: if( ucTimerP5s >= 10)
	movlw	(0Ah)
	subwf	(main@ucTimerP5s),w
	skipc
	goto	u2111
	goto	u2110
u2111:
	goto	l742
u2110:
	line	686
	
l4371:	
;main.c: 685: {
;main.c: 686: ucTimerP5s = 0;
	clrf	(main@ucTimerP5s)
	line	687
	
l4373:	
;main.c: 687: ucStep = STARTUP_3_HOUR_TIMER_STEP;
	movlw	(03h)
	movwf	(main@ucStep)
	goto	l4325
	line	696
	
l4375:	
;main.c: 695: {
;main.c: 696: clearTwelveHoursTimer();
	fcall	_clearTwelveHoursTimer
	line	697
	
l4377:	
;main.c: 697: startThreeHoursTimer(10800);
	movlw	low(02A30h)
	movwf	(?_startThreeHoursTimer)
	movlw	high(02A30h)
	movwf	((?_startThreeHoursTimer))+1
	fcall	_startThreeHoursTimer
	line	698
;main.c: 698: ucStep = CHECK_3_HOUR_TIMER_STEP;
	movlw	(04h)
	movwf	(main@ucStep)
	line	699
;main.c: 699: break;
	goto	l4325
	line	706
	
l4379:	
;main.c: 703: {
;main.c: 704: static unsigned char ucTimerP5s = 0;
;main.c: 706: if( isFinishedThreeHoursTimer() )
	fcall	_isFinishedThreeHoursTimer
	xorlw	0
	skipnz
	goto	u2121
	goto	u2120
u2121:
	goto	l4383
u2120:
	goto	l4361
	line	710
	
l4383:	
;main.c: 708: else
;main.c: 709: {
;main.c: 710: if( getAdOriginalCh13Value() < 105 )
	fcall	_getAdOriginalCh13Value
	movlw	high(069h)
	subwf	(1+(?_getAdOriginalCh13Value)),w
	movlw	low(069h)
	skipnz
	subwf	(0+(?_getAdOriginalCh13Value)),w
	skipnc
	goto	u2131
	goto	u2130
u2131:
	goto	l4387
u2130:
	line	711
	
l4385:	
;main.c: 711: ucTimerP5s++;
	incf	(main@cTimerP5s_795),f
	goto	l4389
	line	713
	
l4387:	
;main.c: 712: else
;main.c: 713: ucTimerP5s = 0;
	clrf	(main@cTimerP5s_795)
	line	715
	
l4389:	
;main.c: 715: if( ucTimerP5s >= 10)
	movlw	(0Ah)
	subwf	(main@cTimerP5s_795),w
	skipc
	goto	u2141
	goto	u2140
u2141:
	goto	l742
u2140:
	line	717
	
l4391:	
;main.c: 716: {
;main.c: 717: ucTimerP5s = 0;
	clrf	(main@cTimerP5s_795)
	line	718
	
l4393:	
;main.c: 718: ucStep = STARTUP_1_HOUR_TIMER_STEP;
	movlw	(05h)
	movwf	(main@ucStep)
	goto	l4325
	line	726
	
l4395:	
;main.c: 725: {
;main.c: 726: clearThreeHoursTimer();
	fcall	_clearThreeHoursTimer
	line	727
	
l4397:	
;main.c: 727: startOneHoursTimer( 3600 );
	movlw	low(0E10h)
	movwf	(?_startOneHoursTimer)
	movlw	high(0E10h)
	movwf	((?_startOneHoursTimer))+1
	fcall	_startOneHoursTimer
	line	728
	
l4399:	
;main.c: 728: setPB3(1);
	movlw	(01h)
	fcall	_setPB3
	line	729
	
l4401:	
;main.c: 729: setPB4(0);
	movlw	(0)
	fcall	_setPB4
	line	730
	
l4403:	
;main.c: 730: setPB5(1);
	movlw	(01h)
	fcall	_setPB5
	line	731
	
l4405:	
;main.c: 731: ucStep = CHECK_1_HOUR_TIMER_STEP;
	movlw	(06h)
	movwf	(main@ucStep)
	line	732
;main.c: 732: break;
	goto	l4325
	line	745
	
l4407:	
;main.c: 736: {
;main.c: 741: static unsigned int uiTimerOneP5s = 0;
;main.c: 742: static unsigned int uiTimerTwoP5s = 0;
;main.c: 743: static unsigned int uiTimerThreeP5s = 0;
;main.c: 745: unsigned int uiCh13Value = getAdOriginalCh13Value();
	fcall	_getAdOriginalCh13Value
	movf	(1+(?_getAdOriginalCh13Value)),w
	bsf	status, 5	;RP0=1, select bank1
	movwf	(main@uiCh13Value+1)^080h
	bcf	status, 5	;RP0=0, select bank0
	movf	(0+(?_getAdOriginalCh13Value)),w
	bsf	status, 5	;RP0=1, select bank1
	movwf	(main@uiCh13Value)^080h
	line	748
	
l4409:	
;main.c: 748: if( isFinishedOneHoursTimer() )
	fcall	_isFinishedOneHoursTimer
	xorlw	0
	skipnz
	goto	u2151
	goto	u2150
u2151:
	goto	l4413
u2150:
	goto	l4361
	line	752
	
l4413:	
;main.c: 750: else
;main.c: 751: {
;main.c: 752: if( uiCh13Value > 105 )
	movlw	high(06Ah)
	bsf	status, 5	;RP0=1, select bank1
	subwf	(main@uiCh13Value+1)^080h,w
	movlw	low(06Ah)
	skipnz
	subwf	(main@uiCh13Value)^080h,w
	skipc
	goto	u2161
	goto	u2160
u2161:
	goto	l4421
u2160:
	line	754
	
l4415:	
;main.c: 753: {
;main.c: 754: if( uiTimerOneP5s <= 10 )
	movlw	high(0Bh)
	subwf	(main@uiTimerOneP5s+1)^080h,w
	movlw	low(0Bh)
	skipnz
	subwf	(main@uiTimerOneP5s)^080h,w
	skipnc
	goto	u2171
	goto	u2170
u2171:
	goto	l4419
u2170:
	line	755
	
l4417:	
;main.c: 755: uiTimerOneP5s++;
	incf	(main@uiTimerOneP5s)^080h,f
	skipnz
	incf	(main@uiTimerOneP5s+1)^080h,f
	line	756
	
l4419:	
;main.c: 757: uiTimerThreeP5s = 0;
	clrf	(main@uiTimerTwoP5s)^080h
	clrf	(main@uiTimerTwoP5s+1)^080h
	line	758
;main.c: 758: }
	goto	l4423
	line	761
	
l4421:	
;main.c: 759: else
;main.c: 760: {
;main.c: 761: uiTimerOneP5s = 0;
	clrf	(main@uiTimerOneP5s)^080h
	clrf	(main@uiTimerOneP5s+1)^080h
	line	765
	
l4423:	
;main.c: 762: }
;main.c: 765: if(uiTimerOneP5s > 10)
	movlw	high(0Bh)
	subwf	(main@uiTimerOneP5s+1)^080h,w
	movlw	low(0Bh)
	skipnz
	subwf	(main@uiTimerOneP5s)^080h,w
	skipc
	goto	u2181
	goto	u2180
u2181:
	goto	l4435
u2180:
	line	767
	
l4425:	
;main.c: 766: {
;main.c: 767: setPB3(0);
	movlw	(0)
	fcall	_setPB3
	line	768
;main.c: 768: setPB4(1);
	movlw	(01h)
	fcall	_setPB4
	line	769
;main.c: 769: setPB5(0);
	movlw	(0)
	fcall	_setPB5
	line	771
	
l4427:	
;main.c: 771: uiTimerOneP5s = 0;
	bsf	status, 5	;RP0=1, select bank1
	clrf	(main@uiTimerOneP5s)^080h
	clrf	(main@uiTimerOneP5s+1)^080h
	line	772
	
l4429:	
;main.c: 772: uiTimerTwoP5s = 0;
	clrf	(main@uiTimerTwoP5s)^080h
	clrf	(main@uiTimerTwoP5s+1)^080h
	line	774
	
l4431:	
;main.c: 774: resetAllTimer();
	fcall	_resetAllTimer
	goto	l4349
	line	780
	
l4435:	
;main.c: 778: else
;main.c: 779: {
;main.c: 780: if( uiCh13Value < 105 )
	movlw	high(069h)
	subwf	(main@uiCh13Value+1)^080h,w
	movlw	low(069h)
	skipnz
	subwf	(main@uiCh13Value)^080h,w
	skipnc
	goto	u2191
	goto	u2190
u2191:
	goto	l4441
u2190:
	line	783
	
l4437:	
;main.c: 781: {
;main.c: 783: if( uiTimerTwoP5s <= 10)
	movlw	high(0Bh)
	subwf	(main@uiTimerTwoP5s+1)^080h,w
	movlw	low(0Bh)
	skipnz
	subwf	(main@uiTimerTwoP5s)^080h,w
	skipnc
	goto	u2201
	goto	u2200
u2201:
	goto	l4443
u2200:
	line	784
	
l4439:	
;main.c: 784: uiTimerTwoP5s++;
	incf	(main@uiTimerTwoP5s)^080h,f
	skipnz
	incf	(main@uiTimerTwoP5s+1)^080h,f
	goto	l4443
	line	788
	
l4441:	
;main.c: 789: uiTimerThreeP5s = 0;
	clrf	(main@uiTimerTwoP5s)^080h
	clrf	(main@uiTimerTwoP5s+1)^080h
	line	792
	
l4443:	
;main.c: 790: }
;main.c: 792: if(uiTimerTwoP5s > 10)
	movlw	high(0Bh)
	subwf	(main@uiTimerTwoP5s+1)^080h,w
	movlw	low(0Bh)
	skipnz
	subwf	(main@uiTimerTwoP5s)^080h,w
	skipc
	goto	u2211
	goto	u2210
u2211:
	goto	l742
u2210:
	line	794
	
l4445:	
;main.c: 793: {
;main.c: 794: setPB3(1);
	movlw	(01h)
	fcall	_setPB3
	line	795
;main.c: 795: setPB4(0);
	movlw	(0)
	fcall	_setPB4
	line	796
;main.c: 796: setPB5(1);
	movlw	(01h)
	fcall	_setPB5
	goto	l4325
	line	816
	
l4447:	
;main.c: 815: {
;main.c: 816: setPB3(0);
	movlw	(0)
	fcall	_setPB3
	line	817
;main.c: 817: setPB4(0);
	movlw	(0)
	fcall	_setPB4
	line	818
;main.c: 818: setPB5(1);
	movlw	(01h)
	fcall	_setPB5
	line	821
;main.c: 821: setWaitResetFlag(1);
	movlw	(01h)
	fcall	_setWaitResetFlag
	line	822
;main.c: 822: pwm_start(150,249);
	movlw	(0F9h)
	movwf	(?_pwm_start)
	movlw	(096h)
	fcall	_pwm_start
	line	828
	
l4449:	
;main.c: 828: ucStep = DELAY_ONE_SECOND_FOR_PWM;
	movlw	(064h)
	movwf	(main@ucStep)
	line	829
;main.c: 829: break;
	goto	l4325
	line	835
	
l4451:	
;main.c: 833: {
;main.c: 834: static unsigned ucDelay1s = 0;
;main.c: 835: if(ucDelay1s <= 50)
	movlw	high(033h)
	bsf	status, 5	;RP0=1, select bank1
	subwf	(main@ucDelay1s+1)^080h,w
	movlw	low(033h)
	skipnz
	subwf	(main@ucDelay1s)^080h,w
	skipnc
	goto	u2221
	goto	u2220
u2221:
	goto	l4455
u2220:
	line	836
	
l4453:	
;main.c: 836: ucDelay1s++;
	incf	(main@ucDelay1s)^080h,f
	skipnz
	incf	(main@ucDelay1s+1)^080h,f
	goto	l4325
	line	839
	
l4455:	
;main.c: 837: else
;main.c: 838: {
;main.c: 839: ucDelay1s = 0;
	clrf	(main@ucDelay1s)^080h
	clrf	(main@ucDelay1s+1)^080h
	line	840
	
l4457:	
;main.c: 840: ucStep = MEET_RESET_CONDITION_STEP;
	movlw	(065h)
	bcf	status, 5	;RP0=0, select bank0
	movwf	(main@ucStep)
	goto	l4325
	line	852
	
l4459:	
;main.c: 850: {
;main.c: 851: static unsigned char ucTimerP5s = 0;
;main.c: 852: unsigned int ucChValue = getAdOriginalCh13Value();
	fcall	_getAdOriginalCh13Value
	movf	(1+(?_getAdOriginalCh13Value)),w
	bsf	status, 5	;RP0=1, select bank1
	movwf	(main@ucChValue+1)^080h
	bcf	status, 5	;RP0=0, select bank0
	movf	(0+(?_getAdOriginalCh13Value)),w
	bsf	status, 5	;RP0=1, select bank1
	movwf	(main@ucChValue)^080h
	line	854
	
l4461:	
;main.c: 854: if( ucChValue > 81 )
	movlw	high(052h)
	subwf	(main@ucChValue+1)^080h,w
	movlw	low(052h)
	skipnz
	subwf	(main@ucChValue)^080h,w
	skipc
	goto	u2231
	goto	u2230
u2231:
	goto	l4465
u2230:
	line	855
	
l4463:	
;main.c: 855: ucTimerP5s++;
	bcf	status, 5	;RP0=0, select bank0
	incf	(main@cTimerP5s_801),f
	goto	l4467
	line	857
	
l4465:	
;main.c: 856: else
;main.c: 857: ucTimerP5s = 0;
	bcf	status, 5	;RP0=0, select bank0
	clrf	(main@cTimerP5s_801)
	line	859
	
l4467:	
;main.c: 859: if(ucTimerP5s >= 50)
	movlw	(032h)
	subwf	(main@cTimerP5s_801),w
	skipc
	goto	u2241
	goto	u2240
u2241:
	goto	l742
u2240:
	line	860
	
l4469:	
;main.c: 860: ucStep = RESET_STEP;
	movlw	(066h)
	movwf	(main@ucStep)
	goto	l4325
	line	866
	
l4471:	
;main.c: 865: {
;main.c: 866: ucStep = INIT_STEP;
	clrf	(main@ucStep)
	line	867
	
l4473:	
;main.c: 867: reset();
	fcall	_reset
	line	868
;main.c: 868: break;
	goto	l4325
	line	612
	
l4477:	
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
	goto	l4333
	xorlw	1^0	; case 1
	skipnz
	goto	l4351
	xorlw	2^1	; case 2
	skipnz
	goto	l4359
	xorlw	3^2	; case 3
	skipnz
	goto	l4375
	xorlw	4^3	; case 4
	skipnz
	goto	l4379
	xorlw	5^4	; case 5
	skipnz
	goto	l4395
	xorlw	6^5	; case 6
	skipnz
	goto	l4407
	xorlw	99^6	; case 99
	skipnz
	goto	l4447
	xorlw	100^99	; case 100
	skipnz
	goto	l4451
	xorlw	101^100	; case 101
	skipnz
	goto	l4459
	xorlw	102^101	; case 102
	skipnz
	goto	l4471
	goto	l742
	opt asmopt_on

	line	876
	
l742:	
	goto	l4325
	global	start
	ljmp	start
	opt stack 0
psect	maintext
	line	879
GLOBAL	__end_of_main
	__end_of_main:
;; =============== function _main ends ============

	signat	_main,90
	global	_getAdOriginalCh13Value
psect	text1367,local,class=CODE,delta=2
global __ptext1367
__ptext1367:

;; *************** function _getAdOriginalCh13Value *****************
;; Defined at:
;;		line 410 in file "D:\develop\AK7030-OTP-191211-change-pin_bb_div2(two_filter)\AK7030-OTP\common.c"
;; Parameters:    Size  Location     Type
;;		None
;; Auto vars:     Size  Location     Type
;;		None
;; Return value:  Size  Location     Type
;;                  2   27[BANK0 ] unsigned int 
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
;; Hardware stack levels required when called:    4
;; This function calls:
;;		_FilterCh13
;; This function is called by:
;;		_main
;; This function uses a non-reentrant model
;;
psect	text1367
	file	"D:\develop\AK7030-OTP-191211-change-pin_bb_div2(two_filter)\AK7030-OTP\common.c"
	line	410
	global	__size_of_getAdOriginalCh13Value
	__size_of_getAdOriginalCh13Value	equ	__end_of_getAdOriginalCh13Value-_getAdOriginalCh13Value
	
_getAdOriginalCh13Value:	
	opt	stack 3
; Regs used in _getAdOriginalCh13Value: [wreg-fsr0h+status,2+status,0+btemp+1+pclath+cstack]
	line	412
	
l4309:	
;common.c: 412: return FilterCh13(uiSampleCh13);
	movlw	(_uiSampleCh13)&0ffh
	fcall	_FilterCh13
	movf	(1+(?_FilterCh13)),w
	movwf	(?_getAdOriginalCh13Value+1)
	movf	(0+(?_FilterCh13)),w
	movwf	(?_getAdOriginalCh13Value)
	line	417
	
l1595:	
	return
	opt stack 0
GLOBAL	__end_of_getAdOriginalCh13Value
	__end_of_getAdOriginalCh13Value:
;; =============== function _getAdOriginalCh13Value ends ============

	signat	_getAdOriginalCh13Value,90
	global	_process_AD_Converter_Value
psect	text1368,local,class=CODE,delta=2
global __ptext1368
__ptext1368:

;; *************** function _process_AD_Converter_Value *****************
;; Defined at:
;;		line 432 in file "D:\develop\AK7030-OTP-191211-change-pin_bb_div2(two_filter)\AK7030-OTP\common.c"
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
psect	text1368
	file	"D:\develop\AK7030-OTP-191211-change-pin_bb_div2(two_filter)\AK7030-OTP\common.c"
	line	432
	global	__size_of_process_AD_Converter_Value
	__size_of_process_AD_Converter_Value	equ	__end_of_process_AD_Converter_Value-_process_AD_Converter_Value
	
_process_AD_Converter_Value:	
	opt	stack 3
; Regs used in _process_AD_Converter_Value: [wreg+status,2+status,0+pclath+cstack]
	line	433
	
l4297:	
;common.c: 433: if(getAD_ConvertFlag())
	fcall	_getAD_ConvertFlag
	xorlw	0
	skipnz
	goto	u2031
	goto	u2030
u2031:
	goto	l1604
u2030:
	line	435
	
l4299:	
;common.c: 434: {
;common.c: 435: setAD_ConvertFlag(0);
	movlw	(0)
	fcall	_setAD_ConvertFlag
	line	436
;common.c: 436: AD_Sample();
	fcall	_AD_Sample
	line	437
	
l4301:	
;common.c: 437: if(2 == sampleChannelSelect)
	movf	(_sampleChannelSelect),w
	xorlw	02h
	skipz
	goto	u2041
	goto	u2040
u2041:
	goto	l4305
u2040:
	line	438
	
l4303:	
;common.c: 438: adc_test_init(2,0);
	clrf	(?_adc_test_init)
	movlw	(02h)
	fcall	_adc_test_init
	goto	l4307
	line	440
	
l4305:	
;common.c: 439: else
;common.c: 440: adc_test_init(1,0);
	clrf	(?_adc_test_init)
	movlw	(01h)
	fcall	_adc_test_init
	line	441
	
l4307:	
;common.c: 441: adc_start();
	fcall	_adc_start
	line	443
	
l1604:	
	return
	opt stack 0
GLOBAL	__end_of_process_AD_Converter_Value
	__end_of_process_AD_Converter_Value:
;; =============== function _process_AD_Converter_Value ends ============

	signat	_process_AD_Converter_Value,88
	global	_resetAllTimer
psect	text1369,local,class=CODE,delta=2
global __ptext1369
__ptext1369:

;; *************** function _resetAllTimer *****************
;; Defined at:
;;		line 494 in file "D:\develop\AK7030-OTP-191211-change-pin_bb_div2(two_filter)\AK7030-OTP\main.c"
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
psect	text1369
	file	"D:\develop\AK7030-OTP-191211-change-pin_bb_div2(two_filter)\AK7030-OTP\main.c"
	line	494
	global	__size_of_resetAllTimer
	__size_of_resetAllTimer	equ	__end_of_resetAllTimer-_resetAllTimer
	
_resetAllTimer:	
	opt	stack 3
; Regs used in _resetAllTimer: [status,2+status,0+pclath+cstack]
	line	495
	
l4295:	
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
psect	text1370,local,class=CODE,delta=2
global __ptext1370
__ptext1370:

;; *************** function _setPinInitVaule *****************
;; Defined at:
;;		line 285 in file "D:\develop\AK7030-OTP-191211-change-pin_bb_div2(two_filter)\AK7030-OTP\main.c"
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
psect	text1370
	file	"D:\develop\AK7030-OTP-191211-change-pin_bb_div2(two_filter)\AK7030-OTP\main.c"
	line	285
	global	__size_of_setPinInitVaule
	__size_of_setPinInitVaule	equ	__end_of_setPinInitVaule-_setPinInitVaule
	
_setPinInitVaule:	
	opt	stack 3
; Regs used in _setPinInitVaule: [wreg+status,2+status,0+pclath+cstack]
	line	287
	
l4293:	
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
psect	text1371,local,class=CODE,delta=2
global __ptext1371
__ptext1371:

;; *************** function _initPin *****************
;; Defined at:
;;		line 269 in file "D:\develop\AK7030-OTP-191211-change-pin_bb_div2(two_filter)\AK7030-OTP\main.c"
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
psect	text1371
	file	"D:\develop\AK7030-OTP-191211-change-pin_bb_div2(two_filter)\AK7030-OTP\main.c"
	line	269
	global	__size_of_initPin
	__size_of_initPin	equ	__end_of_initPin-_initPin
	
_initPin:	
	opt	stack 3
; Regs used in _initPin: [wreg+status,2+status,0+pclath+cstack]
	line	271
	
l4285:	
;main.c: 271: initPB2_AsHighResistence();
	fcall	_initPB2_AsHighResistence
	line	273
	
l4287:	
;main.c: 273: initPB3(0);
	movlw	(0)
	fcall	_initPB3
	line	275
	
l4289:	
;main.c: 275: initPB4(0);
	movlw	(0)
	fcall	_initPB4
	line	277
	
l4291:	
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
psect	text1372,local,class=CODE,delta=2
global __ptext1372
__ptext1372:

;; *************** function _AD_Sample *****************
;; Defined at:
;;		line 455 in file "D:\develop\AK7030-OTP-191211-change-pin_bb_div2(two_filter)\AK7030-OTP\common.c"
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
psect	text1372
	file	"D:\develop\AK7030-OTP-191211-change-pin_bb_div2(two_filter)\AK7030-OTP\common.c"
	line	455
	global	__size_of_AD_Sample
	__size_of_AD_Sample	equ	__end_of_AD_Sample-_AD_Sample
	
_AD_Sample:	
	opt	stack 3
; Regs used in _AD_Sample: [wreg+status,2+status,0]
	line	456
	
l4271:	
;common.c: 456: if(sampleTimes < 3)
	movlw	(03h)
	subwf	(_sampleTimes),w
	skipnc
	goto	u2001
	goto	u2000
u2001:
	goto	l1611
u2000:
	line	458
	
l4273:	
;common.c: 457: {
;common.c: 458: sampleTimes++;
	incf	(_sampleTimes),f
	line	460
	
l4275:	
;common.c: 460: if(sampleTimes >= 3)
	movlw	(03h)
	subwf	(_sampleTimes),w
	skipc
	goto	u2011
	goto	u2010
u2011:
	goto	l1611
u2010:
	line	462
	
l4277:	
;common.c: 461: {
;common.c: 462: sampleTimes = 0;
	clrf	(_sampleTimes)
	line	464
	
l4279:	
;common.c: 464: if(sampleChannelSelect == 2)
	movf	(_sampleChannelSelect),w
	xorlw	02h
	skipz
	goto	u2021
	goto	u2020
u2021:
	goto	l4283
u2020:
	line	466
	
l4281:	
;common.c: 465: {
;common.c: 466: sampleChannelSelect = 1;
	clrf	(_sampleChannelSelect)
	incf	(_sampleChannelSelect),f
	line	467
;common.c: 467: }
	goto	l1611
	line	471
	
l4283:	
;common.c: 469: else
;common.c: 470: {
;common.c: 471: sampleChannelSelect = 2;
	movlw	(02h)
	movwf	(_sampleChannelSelect)
	line	475
	
l1611:	
	return
	opt stack 0
GLOBAL	__end_of_AD_Sample
	__end_of_AD_Sample:
;; =============== function _AD_Sample ends ============

	signat	_AD_Sample,88
	global	_setAD_ConvertFlag
psect	text1373,local,class=CODE,delta=2
global __ptext1373
__ptext1373:

;; *************** function _setAD_ConvertFlag *****************
;; Defined at:
;;		line 387 in file "D:\develop\AK7030-OTP-191211-change-pin_bb_div2(two_filter)\AK7030-OTP\common.c"
;; Parameters:    Size  Location     Type
;;  flag            1    wreg     unsigned char 
;; Auto vars:     Size  Location     Type
;;  flag            1   25[BANK0 ] unsigned char 
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
psect	text1373
	file	"D:\develop\AK7030-OTP-191211-change-pin_bb_div2(two_filter)\AK7030-OTP\common.c"
	line	387
	global	__size_of_setAD_ConvertFlag
	__size_of_setAD_ConvertFlag	equ	__end_of_setAD_ConvertFlag-_setAD_ConvertFlag
	
_setAD_ConvertFlag:	
	opt	stack 3
; Regs used in _setAD_ConvertFlag: [wreg]
;setAD_ConvertFlag@flag stored from wreg
	movwf	(setAD_ConvertFlag@flag)
	line	388
	
l4269:	
;common.c: 388: adc_convert_flag = flag;
	movf	(setAD_ConvertFlag@flag),w
	movwf	(_adc_convert_flag)
	line	389
	
l1589:	
	return
	opt stack 0
GLOBAL	__end_of_setAD_ConvertFlag
	__end_of_setAD_ConvertFlag:
;; =============== function _setAD_ConvertFlag ends ============

	signat	_setAD_ConvertFlag,4216
	global	_getAD_ConvertFlag
psect	text1374,local,class=CODE,delta=2
global __ptext1374
__ptext1374:

;; *************** function _getAD_ConvertFlag *****************
;; Defined at:
;;		line 381 in file "D:\develop\AK7030-OTP-191211-change-pin_bb_div2(two_filter)\AK7030-OTP\common.c"
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
psect	text1374
	file	"D:\develop\AK7030-OTP-191211-change-pin_bb_div2(two_filter)\AK7030-OTP\common.c"
	line	381
	global	__size_of_getAD_ConvertFlag
	__size_of_getAD_ConvertFlag	equ	__end_of_getAD_ConvertFlag-_getAD_ConvertFlag
	
_getAD_ConvertFlag:	
	opt	stack 3
; Regs used in _getAD_ConvertFlag: [wreg]
	line	382
	
l4265:	
;common.c: 382: return adc_convert_flag;
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	movf	(_adc_convert_flag),w
	line	383
	
l1586:	
	return
	opt stack 0
GLOBAL	__end_of_getAD_ConvertFlag
	__end_of_getAD_ConvertFlag:
;; =============== function _getAD_ConvertFlag ends ============

	signat	_getAD_ConvertFlag,89
	global	_FilterCh13
psect	text1375,local,class=CODE,delta=2
global __ptext1375
__ptext1375:

;; *************** function _FilterCh13 *****************
;; Defined at:
;;		line 76 in file "D:\develop\AK7030-OTP-191211-change-pin_bb_div2(two_filter)\AK7030-OTP\common.c"
;; Parameters:    Size  Location     Type
;;  tmpValue        1    wreg     PTR unsigned int 
;;		 -> uiSampleCh13(6), 
;; Auto vars:     Size  Location     Type
;;  tmpValue        1    4[BANK1 ] PTR unsigned int 
;;		 -> uiSampleCh13(6), 
;;  cir             2   15[BANK1 ] int 
;;  filter_buf      6    9[BANK1 ] unsigned int [3]
;;  filter_sum      2    7[BANK1 ] unsigned int 
;;  filter_temp     2    5[BANK1 ] unsigned int 
;;  i               1   18[BANK1 ] unsigned char 
;;  j               1   17[BANK1 ] unsigned char 
;; Return value:  Size  Location     Type
;;                  2   25[BANK0 ] unsigned int 
;; Registers used:
;;		wreg, fsr0l, fsr0h, status,2, status,0, btemp+1
;; Tracked objects:
;;		On entry : 40/0
;;		On exit  : 160/0
;;		Unchanged: FFE00/0
;; Data sizes:     COMMON   BANK0   BANK1   BANK3   BANK2
;;      Params:         0       2       0       0       0
;;      Locals:         0       0      15       0       0
;;      Temps:          0       0       4       0       0
;;      Totals:         0       2      19       0       0
;;Total ram usage:       21 bytes
;; Hardware stack levels used:    1
;; Hardware stack levels required when called:    3
;; This function calls:
;;		Nothing
;; This function is called by:
;;		_getAdOriginalCh13Value
;; This function uses a non-reentrant model
;;
psect	text1375
	file	"D:\develop\AK7030-OTP-191211-change-pin_bb_div2(two_filter)\AK7030-OTP\common.c"
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
	
l4217:	
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
	
l4223:	
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
	
l4225:	
	incf	(FilterCh13@tmpValue)^080h,f
	incf	(FilterCh13@tmpValue)^080h,f
	line	83
	
l4227:	
	incf	(FilterCh13@cir)^080h,f
	skipnz
	incf	(FilterCh13@cir+1)^080h,f
	
l4229:	
	movf	(FilterCh13@cir+1)^080h,w
	xorlw	80h
	movwf	btemp+1
	movlw	(high(03h))^80h
	subwf	btemp+1,w
	skipz
	goto	u1955
	movlw	low(03h)
	subwf	(FilterCh13@cir)^080h,w
u1955:

	skipc
	goto	u1951
	goto	u1950
u1951:
	goto	l4223
u1950:
	line	88
	
l4231:	
;common.c: 88: for(j = 0; j < 3 - 1; j++)
	bsf	status, 5	;RP0=1, select bank1
	bcf	status, 6	;RP1=0, select bank1
	clrf	(FilterCh13@j)^080h
	line	90
	
l4237:	
;common.c: 89: {
;common.c: 90: for(i = 0; i < 3 - 1 - j; i++)
	clrf	(FilterCh13@i)^080h
	goto	l4245
	line	92
	
l4239:	
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
	goto	u1965
	movf	0+(??_FilterCh13+0)^080h+0,w
	subwf	0+(??_FilterCh13+2)^080h+0,w
u1965:
	skipnc
	goto	u1961
	goto	u1960
u1961:
	goto	l4243
u1960:
	line	95
	
l4241:	
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
	
l4243:	
	incf	(FilterCh13@i)^080h,f
	
l4245:	
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
	goto	u1975
	movf	0+(??_FilterCh13+0)^080h+0,w
	subwf	(FilterCh13@i)^080h,w
u1975:

	skipc
	goto	u1971
	goto	u1970
u1971:
	goto	l4239
u1970:
	line	88
	
l4247:	
	bsf	status, 5	;RP0=1, select bank1
	bcf	status, 6	;RP1=0, select bank1
	incf	(FilterCh13@j)^080h,f
	
l4249:	
	movlw	(02h)
	subwf	(FilterCh13@j)^080h,w
	skipc
	goto	u1981
	goto	u1980
u1981:
	goto	l4237
u1980:
	
l1498:	
	line	104
;common.c: 100: }
;common.c: 101: }
;common.c: 102: }
;common.c: 104: for(i = 1; i < 3 - 1; i++)
	clrf	(FilterCh13@i)^080h
	incf	(FilterCh13@i)^080h,f
	line	106
	
l4255:	
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
	
l4257:	
	incf	(FilterCh13@i)^080h,f
	
l4259:	
	movlw	(02h)
	subwf	(FilterCh13@i)^080h,w
	skipc
	goto	u1991
	goto	u1990
u1991:
	goto	l4255
u1990:
	line	110
	
l4261:	
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
	
l1505:	
	return
	opt stack 0
GLOBAL	__end_of_FilterCh13
	__end_of_FilterCh13:
;; =============== function _FilterCh13 ends ============

	signat	_FilterCh13,4218
	global	_setWaitResetFlag
psect	text1376,local,class=CODE,delta=2
global __ptext1376
__ptext1376:

;; *************** function _setWaitResetFlag *****************
;; Defined at:
;;		line 55 in file "D:\develop\AK7030-OTP-191211-change-pin_bb_div2(two_filter)\AK7030-OTP\common.c"
;; Parameters:    Size  Location     Type
;;  bValue          1    wreg     unsigned char 
;; Auto vars:     Size  Location     Type
;;  bValue          1   25[BANK0 ] unsigned char 
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
psect	text1376
	file	"D:\develop\AK7030-OTP-191211-change-pin_bb_div2(two_filter)\AK7030-OTP\common.c"
	line	55
	global	__size_of_setWaitResetFlag
	__size_of_setWaitResetFlag	equ	__end_of_setWaitResetFlag-_setWaitResetFlag
	
_setWaitResetFlag:	
	opt	stack 4
; Regs used in _setWaitResetFlag: [wreg]
;setWaitResetFlag@bValue stored from wreg
	movwf	(setWaitResetFlag@bValue)
	line	56
	
l4215:	
;common.c: 56: bWaitResetFlag = bValue;
	movf	(setWaitResetFlag@bValue),w
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
psect	text1377,local,class=CODE,delta=2
global __ptext1377
__ptext1377:

;; *************** function _isFinishedOneHoursTimer *****************
;; Defined at:
;;		line 621 in file "D:\develop\AK7030-OTP-191211-change-pin_bb_div2(two_filter)\AK7030-OTP\common.c"
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
psect	text1377
	file	"D:\develop\AK7030-OTP-191211-change-pin_bb_div2(two_filter)\AK7030-OTP\common.c"
	line	621
	global	__size_of_isFinishedOneHoursTimer
	__size_of_isFinishedOneHoursTimer	equ	__end_of_isFinishedOneHoursTimer-_isFinishedOneHoursTimer
	
_isFinishedOneHoursTimer:	
	opt	stack 4
; Regs used in _isFinishedOneHoursTimer: [wreg+status,2+status,0]
	line	622
	
l4199:	
;common.c: 622: if((uiOneHourTimer == 0) && bOneHourTimerStartFlag)
	bcf	status, 5	;RP0=0, select bank0
	movf	((_uiOneHourTimer+1)),w
	iorwf	((_uiOneHourTimer)),w
	skipz
	goto	u1931
	goto	u1930
u1931:
	goto	l4211
u1930:
	
l4201:	
	movf	(_bOneHourTimerStartFlag),w
	skipz
	goto	u1940
	goto	l4211
u1940:
	line	624
	
l4203:	
;common.c: 623: {
;common.c: 624: bOneHourTimerStartFlag = 0;
	clrf	(_bOneHourTimerStartFlag)
	line	625
	
l4205:	
;common.c: 625: return 1;
	movlw	(01h)
	goto	l1661
	line	628
	
l4211:	
;common.c: 627: else
;common.c: 628: return 0;
	movlw	(0)
	line	629
	
l1661:	
	return
	opt stack 0
GLOBAL	__end_of_isFinishedOneHoursTimer
	__end_of_isFinishedOneHoursTimer:
;; =============== function _isFinishedOneHoursTimer ends ============

	signat	_isFinishedOneHoursTimer,89
	global	_startOneHoursTimer
psect	text1378,local,class=CODE,delta=2
global __ptext1378
__ptext1378:

;; *************** function _startOneHoursTimer *****************
;; Defined at:
;;		line 538 in file "D:\develop\AK7030-OTP-191211-change-pin_bb_div2(two_filter)\AK7030-OTP\common.c"
;; Parameters:    Size  Location     Type
;;  uiSetTime       2   25[BANK0 ] unsigned int 
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
psect	text1378
	file	"D:\develop\AK7030-OTP-191211-change-pin_bb_div2(two_filter)\AK7030-OTP\common.c"
	line	538
	global	__size_of_startOneHoursTimer
	__size_of_startOneHoursTimer	equ	__end_of_startOneHoursTimer-_startOneHoursTimer
	
_startOneHoursTimer:	
	opt	stack 4
; Regs used in _startOneHoursTimer: [wreg+status,2+status,0]
	line	539
	
l4191:	
;common.c: 539: if(( 0 == uiOneHourTimer ) && ( 0 == bOneHourTimerStartFlag ))
	movf	((_uiOneHourTimer+1)),w
	iorwf	((_uiOneHourTimer)),w
	skipz
	goto	u1911
	goto	u1910
u1911:
	goto	l1638
u1910:
	
l4193:	
	movf	(_bOneHourTimerStartFlag),f
	skipz
	goto	u1921
	goto	u1920
u1921:
	goto	l1638
u1920:
	line	541
	
l4195:	
;common.c: 540: {
;common.c: 541: uiOneHourTimer = uiSetTime;
	movf	(startOneHoursTimer@uiSetTime+1),w
	movwf	(_uiOneHourTimer+1)
	movf	(startOneHoursTimer@uiSetTime),w
	movwf	(_uiOneHourTimer)
	line	542
	
l4197:	
;common.c: 542: bOneHourTimerStartFlag = 1;
	clrf	(_bOneHourTimerStartFlag)
	incf	(_bOneHourTimerStartFlag),f
	line	548
	
l1638:	
	return
	opt stack 0
GLOBAL	__end_of_startOneHoursTimer
	__end_of_startOneHoursTimer:
;; =============== function _startOneHoursTimer ends ============

	signat	_startOneHoursTimer,4216
	global	_isFinishedThreeHoursTimer
psect	text1379,local,class=CODE,delta=2
global __ptext1379
__ptext1379:

;; *************** function _isFinishedThreeHoursTimer *****************
;; Defined at:
;;		line 608 in file "D:\develop\AK7030-OTP-191211-change-pin_bb_div2(two_filter)\AK7030-OTP\common.c"
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
psect	text1379
	file	"D:\develop\AK7030-OTP-191211-change-pin_bb_div2(two_filter)\AK7030-OTP\common.c"
	line	608
	global	__size_of_isFinishedThreeHoursTimer
	__size_of_isFinishedThreeHoursTimer	equ	__end_of_isFinishedThreeHoursTimer-_isFinishedThreeHoursTimer
	
_isFinishedThreeHoursTimer:	
	opt	stack 4
; Regs used in _isFinishedThreeHoursTimer: [wreg+status,2+status,0]
	line	609
	
l4175:	
;common.c: 609: if((uiSmallTimer == 0) && bSmallTimerStartFlag)
	movf	((_uiSmallTimer+1)),w
	iorwf	((_uiSmallTimer)),w
	skipz
	goto	u1891
	goto	u1890
u1891:
	goto	l4187
u1890:
	
l4177:	
	movf	(_bSmallTimerStartFlag),w
	skipz
	goto	u1900
	goto	l4187
u1900:
	line	611
	
l4179:	
;common.c: 610: {
;common.c: 611: bSmallTimerStartFlag = 0;
	clrf	(_bSmallTimerStartFlag)
	line	612
	
l4181:	
;common.c: 612: return 1;
	movlw	(01h)
	goto	l1656
	line	615
	
l4187:	
;common.c: 614: else
;common.c: 615: return 0;
	movlw	(0)
	line	616
	
l1656:	
	return
	opt stack 0
GLOBAL	__end_of_isFinishedThreeHoursTimer
	__end_of_isFinishedThreeHoursTimer:
;; =============== function _isFinishedThreeHoursTimer ends ============

	signat	_isFinishedThreeHoursTimer,89
	global	_startThreeHoursTimer
psect	text1380,local,class=CODE,delta=2
global __ptext1380
__ptext1380:

;; *************** function _startThreeHoursTimer *****************
;; Defined at:
;;		line 525 in file "D:\develop\AK7030-OTP-191211-change-pin_bb_div2(two_filter)\AK7030-OTP\common.c"
;; Parameters:    Size  Location     Type
;;  uiSetTime       2   25[BANK0 ] unsigned int 
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
psect	text1380
	file	"D:\develop\AK7030-OTP-191211-change-pin_bb_div2(two_filter)\AK7030-OTP\common.c"
	line	525
	global	__size_of_startThreeHoursTimer
	__size_of_startThreeHoursTimer	equ	__end_of_startThreeHoursTimer-_startThreeHoursTimer
	
_startThreeHoursTimer:	
	opt	stack 4
; Regs used in _startThreeHoursTimer: [wreg+status,2+status,0]
	line	526
	
l4167:	
;common.c: 526: if(( 0 == uiSmallTimer ) && ( 0 == bSmallTimerStartFlag ))
	movf	((_uiSmallTimer+1)),w
	iorwf	((_uiSmallTimer)),w
	skipz
	goto	u1871
	goto	u1870
u1871:
	goto	l1634
u1870:
	
l4169:	
	movf	(_bSmallTimerStartFlag),f
	skipz
	goto	u1881
	goto	u1880
u1881:
	goto	l1634
u1880:
	line	528
	
l4171:	
;common.c: 527: {
;common.c: 528: uiSmallTimer = uiSetTime;
	movf	(startThreeHoursTimer@uiSetTime+1),w
	movwf	(_uiSmallTimer+1)
	movf	(startThreeHoursTimer@uiSetTime),w
	movwf	(_uiSmallTimer)
	line	529
	
l4173:	
;common.c: 529: bSmallTimerStartFlag = 1;
	clrf	(_bSmallTimerStartFlag)
	incf	(_bSmallTimerStartFlag),f
	line	535
	
l1634:	
	return
	opt stack 0
GLOBAL	__end_of_startThreeHoursTimer
	__end_of_startThreeHoursTimer:
;; =============== function _startThreeHoursTimer ends ============

	signat	_startThreeHoursTimer,4216
	global	_isFinishedTwelveHoursTimer
psect	text1381,local,class=CODE,delta=2
global __ptext1381
__ptext1381:

;; *************** function _isFinishedTwelveHoursTimer *****************
;; Defined at:
;;		line 597 in file "D:\develop\AK7030-OTP-191211-change-pin_bb_div2(two_filter)\AK7030-OTP\common.c"
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
psect	text1381
	file	"D:\develop\AK7030-OTP-191211-change-pin_bb_div2(two_filter)\AK7030-OTP\common.c"
	line	597
	global	__size_of_isFinishedTwelveHoursTimer
	__size_of_isFinishedTwelveHoursTimer	equ	__end_of_isFinishedTwelveHoursTimer-_isFinishedTwelveHoursTimer
	
_isFinishedTwelveHoursTimer:	
	opt	stack 4
; Regs used in _isFinishedTwelveHoursTimer: [wreg+status,2+status,0]
	line	598
	
l4151:	
;common.c: 598: if(( uiBigTimer == 0 ) && bBigTimerStartFlag )
	movf	((_uiBigTimer+1)),w
	iorwf	((_uiBigTimer)),w
	skipz
	goto	u1851
	goto	u1850
u1851:
	goto	l4163
u1850:
	
l4153:	
	movf	(_bBigTimerStartFlag),w
	skipz
	goto	u1860
	goto	l4163
u1860:
	line	600
	
l4155:	
;common.c: 599: {
;common.c: 600: bBigTimerStartFlag = 0;
	clrf	(_bBigTimerStartFlag)
	line	601
	
l4157:	
;common.c: 601: return 1;
	movlw	(01h)
	goto	l1651
	line	604
	
l4163:	
;common.c: 603: else
;common.c: 604: return 0;
	movlw	(0)
	line	605
	
l1651:	
	return
	opt stack 0
GLOBAL	__end_of_isFinishedTwelveHoursTimer
	__end_of_isFinishedTwelveHoursTimer:
;; =============== function _isFinishedTwelveHoursTimer ends ============

	signat	_isFinishedTwelveHoursTimer,89
	global	_startTwelveHourTimer
psect	text1382,local,class=CODE,delta=2
global __ptext1382
__ptext1382:

;; *************** function _startTwelveHourTimer *****************
;; Defined at:
;;		line 484 in file "D:\develop\AK7030-OTP-191211-change-pin_bb_div2(two_filter)\AK7030-OTP\common.c"
;; Parameters:    Size  Location     Type
;;  uiSetTime       2   25[BANK0 ] unsigned int 
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
psect	text1382
	file	"D:\develop\AK7030-OTP-191211-change-pin_bb_div2(two_filter)\AK7030-OTP\common.c"
	line	484
	global	__size_of_startTwelveHourTimer
	__size_of_startTwelveHourTimer	equ	__end_of_startTwelveHourTimer-_startTwelveHourTimer
	
_startTwelveHourTimer:	
	opt	stack 4
; Regs used in _startTwelveHourTimer: [wreg+status,2+status,0]
	line	485
	
l4143:	
;common.c: 485: if((0 == uiBigTimer) && ( 0 == bBigTimerStartFlag))
	movf	((_uiBigTimer+1)),w
	iorwf	((_uiBigTimer)),w
	skipz
	goto	u1831
	goto	u1830
u1831:
	goto	l1618
u1830:
	
l4145:	
	movf	(_bBigTimerStartFlag),f
	skipz
	goto	u1841
	goto	u1840
u1841:
	goto	l1618
u1840:
	line	487
	
l4147:	
;common.c: 486: {
;common.c: 487: uiBigTimer = uiSetTime;
	movf	(startTwelveHourTimer@uiSetTime+1),w
	movwf	(_uiBigTimer+1)
	movf	(startTwelveHourTimer@uiSetTime),w
	movwf	(_uiBigTimer)
	line	488
	
l4149:	
;common.c: 488: bBigTimerStartFlag = 1;
	clrf	(_bBigTimerStartFlag)
	incf	(_bBigTimerStartFlag),f
	line	495
	
l1618:	
	return
	opt stack 0
GLOBAL	__end_of_startTwelveHourTimer
	__end_of_startTwelveHourTimer:
;; =============== function _startTwelveHourTimer ends ============

	signat	_startTwelveHourTimer,4216
	global	_isFinishedTwentyMinTimer
psect	text1383,local,class=CODE,delta=2
global __ptext1383
__ptext1383:

;; *************** function _isFinishedTwentyMinTimer *****************
;; Defined at:
;;		line 573 in file "D:\develop\AK7030-OTP-191211-change-pin_bb_div2(two_filter)\AK7030-OTP\common.c"
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
;;		_main
;; This function uses a non-reentrant model
;;
psect	text1383
	file	"D:\develop\AK7030-OTP-191211-change-pin_bb_div2(two_filter)\AK7030-OTP\common.c"
	line	573
	global	__size_of_isFinishedTwentyMinTimer
	__size_of_isFinishedTwentyMinTimer	equ	__end_of_isFinishedTwentyMinTimer-_isFinishedTwentyMinTimer
	
_isFinishedTwentyMinTimer:	
	opt	stack 4
; Regs used in _isFinishedTwentyMinTimer: [wreg+status,2+status,0]
	line	574
	
l4127:	
;common.c: 574: if(( 0 == uiTwentyMinTimer ) && bTwentyMinStartFlag )
	bsf	status, 5	;RP0=1, select bank1
	movf	((_uiTwentyMinTimer+1)^080h),w
	iorwf	((_uiTwentyMinTimer)^080h),w
	skipz
	goto	u1811
	goto	u1810
u1811:
	goto	l4139
u1810:
	
l4129:	
	bcf	status, 5	;RP0=0, select bank0
	movf	(_bTwentyMinStartFlag),w
	skipz
	goto	u1820
	goto	l4139
u1820:
	line	576
	
l4131:	
;common.c: 575: {
;common.c: 576: bTwentyMinStartFlag = 0;
	clrf	(_bTwentyMinStartFlag)
	line	577
	
l4133:	
;common.c: 577: return 1;
	movlw	(01h)
	goto	l1646
	line	580
	
l4139:	
;common.c: 579: else
;common.c: 580: return 0;
	movlw	(0)
	line	581
	
l1646:	
	return
	opt stack 0
GLOBAL	__end_of_isFinishedTwentyMinTimer
	__end_of_isFinishedTwentyMinTimer:
;; =============== function _isFinishedTwentyMinTimer ends ============

	signat	_isFinishedTwentyMinTimer,89
	global	_clrSampeTime
psect	text1384,local,class=CODE,delta=2
global __ptext1384
__ptext1384:

;; *************** function _clrSampeTime *****************
;; Defined at:
;;		line 643 in file "D:\develop\AK7030-OTP-191211-change-pin_bb_div2(two_filter)\AK7030-OTP\common.c"
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
psect	text1384
	file	"D:\develop\AK7030-OTP-191211-change-pin_bb_div2(two_filter)\AK7030-OTP\common.c"
	line	643
	global	__size_of_clrSampeTime
	__size_of_clrSampeTime	equ	__end_of_clrSampeTime-_clrSampeTime
	
_clrSampeTime:	
	opt	stack 4
; Regs used in _clrSampeTime: [status,2]
	line	644
	
l4125:	
;common.c: 644: timer.timer10msStopWatch = 0;
	clrf	(_timer)
	line	645
	
l1670:	
	return
	opt stack 0
GLOBAL	__end_of_clrSampeTime
	__end_of_clrSampeTime:
;; =============== function _clrSampeTime ends ============

	signat	_clrSampeTime,88
	global	_isPermitSampleTime
psect	text1385,local,class=CODE,delta=2
global __ptext1385
__ptext1385:

;; *************** function _isPermitSampleTime *****************
;; Defined at:
;;		line 633 in file "D:\develop\AK7030-OTP-191211-change-pin_bb_div2(two_filter)\AK7030-OTP\common.c"
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
psect	text1385
	file	"D:\develop\AK7030-OTP-191211-change-pin_bb_div2(two_filter)\AK7030-OTP\common.c"
	line	633
	global	__size_of_isPermitSampleTime
	__size_of_isPermitSampleTime	equ	__end_of_isPermitSampleTime-_isPermitSampleTime
	
_isPermitSampleTime:	
	opt	stack 4
; Regs used in _isPermitSampleTime: [wreg]
	line	634
	
l4113:	
;common.c: 634: if(timer.timer10msStopWatch >= 1)
	movf	(_timer),w
	skipz
	goto	u1800
	goto	l4121
u1800:
	line	636
	
l4115:	
;common.c: 635: {
;common.c: 636: return 1;
	movlw	(01h)
	goto	l1666
	line	639
	
l4121:	
;common.c: 638: else
;common.c: 639: return 0;
	movlw	(0)
	line	640
	
l1666:	
	return
	opt stack 0
GLOBAL	__end_of_isPermitSampleTime
	__end_of_isPermitSampleTime:
;; =============== function _isPermitSampleTime ends ============

	signat	_isPermitSampleTime,89
	global	_adc_start
psect	text1386,local,class=CODE,delta=2
global __ptext1386
__ptext1386:

;; *************** function _adc_start *****************
;; Defined at:
;;		line 137 in file "D:\develop\AK7030-OTP-191211-change-pin_bb_div2(two_filter)\AK7030-OTP\periph.c"
;; Parameters:    Size  Location     Type
;;		None
;; Auto vars:     Size  Location     Type
;;		None
;; Return value:  Size  Location     Type
;;		None               void
;; Registers used:
;;		None
;; Tracked objects:
;;		On entry : 0/20
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
psect	text1386
	file	"D:\develop\AK7030-OTP-191211-change-pin_bb_div2(two_filter)\AK7030-OTP\periph.c"
	line	137
	global	__size_of_adc_start
	__size_of_adc_start	equ	__end_of_adc_start-_adc_start
	
_adc_start:	
	opt	stack 3
; Regs used in _adc_start: []
	line	138
	
l4111:	
;periph.c: 138: GO=1;
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	bsf	(249/8),(249)&7
	line	139
	
l2349:	
	return
	opt stack 0
GLOBAL	__end_of_adc_start
	__end_of_adc_start:
;; =============== function _adc_start ends ============

	signat	_adc_start,88
	global	_startTwentyMinTimer
psect	text1387,local,class=CODE,delta=2
global __ptext1387
__ptext1387:

;; *************** function _startTwentyMinTimer *****************
;; Defined at:
;;		line 563 in file "D:\develop\AK7030-OTP-191211-change-pin_bb_div2(two_filter)\AK7030-OTP\common.c"
;; Parameters:    Size  Location     Type
;;  uiSetValue      2   25[BANK0 ] unsigned int 
;; Auto vars:     Size  Location     Type
;;		None
;; Return value:  Size  Location     Type
;;		None               void
;; Registers used:
;;		wreg, status,2, status,0
;; Tracked objects:
;;		On entry : 17F/0
;;		On exit  : 15F/0
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
psect	text1387
	file	"D:\develop\AK7030-OTP-191211-change-pin_bb_div2(two_filter)\AK7030-OTP\common.c"
	line	563
	global	__size_of_startTwentyMinTimer
	__size_of_startTwentyMinTimer	equ	__end_of_startTwentyMinTimer-_startTwentyMinTimer
	
_startTwentyMinTimer:	
	opt	stack 4
; Regs used in _startTwentyMinTimer: [wreg+status,2+status,0]
	line	564
	
l4103:	
;common.c: 564: if(( 0 == uiTwentyMinTimer) && ( 0 == bTwentyMinStartFlag))
	bsf	status, 5	;RP0=1, select bank1
	movf	((_uiTwentyMinTimer+1)^080h),w
	iorwf	((_uiTwentyMinTimer)^080h),w
	skipz
	goto	u1781
	goto	u1780
u1781:
	goto	l1642
u1780:
	
l4105:	
	bcf	status, 5	;RP0=0, select bank0
	movf	(_bTwentyMinStartFlag),f
	skipz
	goto	u1791
	goto	u1790
u1791:
	goto	l1642
u1790:
	line	566
	
l4107:	
;common.c: 565: {
;common.c: 566: uiTwentyMinTimer = uiSetValue;
	movf	(startTwentyMinTimer@uiSetValue+1),w
	bsf	status, 5	;RP0=1, select bank1
	movwf	(_uiTwentyMinTimer+1)^080h
	bcf	status, 5	;RP0=0, select bank0
	movf	(startTwentyMinTimer@uiSetValue),w
	bsf	status, 5	;RP0=1, select bank1
	movwf	(_uiTwentyMinTimer)^080h
	line	567
	
l4109:	
;common.c: 567: bTwentyMinStartFlag = 1;
	bcf	status, 5	;RP0=0, select bank0
	clrf	(_bTwentyMinStartFlag)
	incf	(_bTwentyMinStartFlag),f
	line	569
	
l1642:	
	return
	opt stack 0
GLOBAL	__end_of_startTwentyMinTimer
	__end_of_startTwentyMinTimer:
;; =============== function _startTwentyMinTimer ends ============

	signat	_startTwentyMinTimer,4216
	global	_adc_test_init
psect	text1388,local,class=CODE,delta=2
global __ptext1388
__ptext1388:

;; *************** function _adc_test_init *****************
;; Defined at:
;;		line 121 in file "D:\develop\AK7030-OTP-191211-change-pin_bb_div2(two_filter)\AK7030-OTP\periph.c"
;; Parameters:    Size  Location     Type
;;  channel         1    wreg     unsigned char 
;;  ref             1   25[BANK0 ] unsigned char 
;; Auto vars:     Size  Location     Type
;;  channel         1   27[BANK0 ] unsigned char 
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
psect	text1388
	file	"D:\develop\AK7030-OTP-191211-change-pin_bb_div2(two_filter)\AK7030-OTP\periph.c"
	line	121
	global	__size_of_adc_test_init
	__size_of_adc_test_init	equ	__end_of_adc_test_init-_adc_test_init
	
_adc_test_init:	
	opt	stack 3
; Regs used in _adc_test_init: [wreg+status,2+status,0]
;adc_test_init@channel stored from wreg
	movwf	(adc_test_init@channel)
	line	122
	
l4093:	
;periph.c: 122: ADCON0 = 0x40;
	movlw	(040h)
	movwf	(31)	;volatile
	line	123
	
l4095:	
;periph.c: 123: ADCON0|=channel<<2;
	movf	(adc_test_init@channel),w
	movwf	(??_adc_test_init+0)+0
	clrc
	rlf	(??_adc_test_init+0)+0,f
	clrc
	rlf	(??_adc_test_init+0)+0,w
	iorwf	(31),f	;volatile
	line	124
	
l4097:	
;periph.c: 124: ADCON1 = 0x35;
	movlw	(035h)
	bsf	status, 5	;RP0=1, select bank1
	movwf	(159)^080h	;volatile
	line	125
;periph.c: 125: ADCON1|=ref<<6;
	bcf	status, 5	;RP0=0, select bank0
	movf	(adc_test_init@ref),w
	movwf	(??_adc_test_init+0)+0
	rrf	(??_adc_test_init+0)+0,f
	rrf	(??_adc_test_init+0)+0,f
	rrf	(??_adc_test_init+0)+0,w
	andlw	0c0h
	bsf	status, 5	;RP0=1, select bank1
	iorwf	(159)^080h,f	;volatile
	line	126
	
l4099:	
;periph.c: 126: ADON=1;
	bcf	status, 5	;RP0=0, select bank0
	bsf	(248/8),(248)&7
	line	127
	
l4101:	
;periph.c: 127: ADIE=1;
	bsf	status, 5	;RP0=1, select bank1
	bsf	(1130/8)^080h,(1130)&7
	line	128
	
l2343:	
	return
	opt stack 0
GLOBAL	__end_of_adc_test_init
	__end_of_adc_test_init:
;; =============== function _adc_test_init ends ============

	signat	_adc_test_init,8312
	global	_op1_init
psect	text1389,local,class=CODE,delta=2
global __ptext1389
__ptext1389:

;; *************** function _op1_init *****************
;; Defined at:
;;		line 63 in file "D:\develop\AK7030-OTP-191211-change-pin_bb_div2(two_filter)\AK7030-OTP\periph.c"
;; Parameters:    Size  Location     Type
;;		None
;; Auto vars:     Size  Location     Type
;;		None
;; Return value:  Size  Location     Type
;;		None               void
;; Registers used:
;;		wreg
;; Tracked objects:
;;		On entry : 17F/60
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
psect	text1389
	file	"D:\develop\AK7030-OTP-191211-change-pin_bb_div2(two_filter)\AK7030-OTP\periph.c"
	line	63
	global	__size_of_op1_init
	__size_of_op1_init	equ	__end_of_op1_init-_op1_init
	
_op1_init:	
	opt	stack 4
; Regs used in _op1_init: [wreg]
	line	69
	
l4091:	
;periph.c: 69: OP1CON1=0x13;
	movlw	(013h)
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	movwf	(28)	;volatile
	line	70
;periph.c: 70: OP1CON2=0x10;
	movlw	(010h)
	movwf	(29)	;volatile
	line	71
;periph.c: 71: OP1CON0=0x80;
	movlw	(080h)
	movwf	(27)	;volatile
	line	77
	
l2332:	
	return
	opt stack 0
GLOBAL	__end_of_op1_init
	__end_of_op1_init:
;; =============== function _op1_init ends ============

	signat	_op1_init,88
	global	_uid_get
psect	text1390,local,class=CODE,delta=2
global __ptext1390
__ptext1390:

;; *************** function _uid_get *****************
;; Defined at:
;;		line 31 in file "D:\develop\AK7030-OTP-191211-change-pin_bb_div2(two_filter)\AK7030-OTP\periph.c"
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
psect	text1390
	file	"D:\develop\AK7030-OTP-191211-change-pin_bb_div2(two_filter)\AK7030-OTP\periph.c"
	line	31
	global	__size_of_uid_get
	__size_of_uid_get	equ	__end_of_uid_get-_uid_get
	
_uid_get:	
	opt	stack 4
; Regs used in _uid_get: [wreg]
	line	33
	
l4085:	
;periph.c: 33: SRAM_MAP = 1;
	bsf	status, 6	;RP1=1, select bank3
	bsf	(3192/8)^0180h,(3192)&7
	line	35
	
l4087:	
;periph.c: 35: bgr_trim = key.u_1v2;
	movf	0+(480)^0180h+02h,w	;volatile
	movf	1+(480)^0180h+02h,w	;volatile
	line	36
;periph.c: 36: ad_offset = key.otp_uid&0xff;
	movf	1+(480)^0180h+06h,w	;volatile
	bcf	status, 6	;RP1=0, select bank1
	movwf	(_ad_offset+1)^080h	;volatile
	bsf	status, 6	;RP1=1, select bank3
	movf	0+(480)^0180h+06h,w	;volatile
	bcf	status, 6	;RP1=0, select bank1
	movwf	(_ad_offset)^080h	;volatile
	movlw	0FFh
	andwf	(_ad_offset)^080h,f
	clrf	(_ad_offset+1)^080h
	line	38
	
l4089:	
;periph.c: 38: SRAM_MAP = 0;
	bsf	status, 6	;RP1=1, select bank3
	bcf	(3192/8)^0180h,(3192)&7
	line	40
	
l2326:	
	return
	opt stack 0
GLOBAL	__end_of_uid_get
	__end_of_uid_get:
;; =============== function _uid_get ends ============

	signat	_uid_get,88
	global	_timer1_interrupt_config
psect	text1391,local,class=CODE,delta=2
global __ptext1391
__ptext1391:

;; *************** function _timer1_interrupt_config *****************
;; Defined at:
;;		line 373 in file "D:\develop\AK7030-OTP-191211-change-pin_bb_div2(two_filter)\AK7030-OTP\common.c"
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
psect	text1391
	file	"D:\develop\AK7030-OTP-191211-change-pin_bb_div2(two_filter)\AK7030-OTP\common.c"
	line	373
	global	__size_of_timer1_interrupt_config
	__size_of_timer1_interrupt_config	equ	__end_of_timer1_interrupt_config-_timer1_interrupt_config
	
_timer1_interrupt_config:	
	opt	stack 4
; Regs used in _timer1_interrupt_config: []
	line	374
	
l4083:	
;common.c: 374: GIE = 1;
	bsf	(95/8),(95)&7
	line	375
;common.c: 375: PEIE = 1;
	bsf	(94/8),(94)&7
	line	376
	
l1583:	
	return
	opt stack 0
GLOBAL	__end_of_timer1_interrupt_config
	__end_of_timer1_interrupt_config:
;; =============== function _timer1_interrupt_config ends ============

	signat	_timer1_interrupt_config,88
	global	_timer1_config
psect	text1392,local,class=CODE,delta=2
global __ptext1392
__ptext1392:

;; *************** function _timer1_config *****************
;; Defined at:
;;		line 361 in file "D:\develop\AK7030-OTP-191211-change-pin_bb_div2(two_filter)\AK7030-OTP\common.c"
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
psect	text1392
	file	"D:\develop\AK7030-OTP-191211-change-pin_bb_div2(two_filter)\AK7030-OTP\common.c"
	line	361
	global	__size_of_timer1_config
	__size_of_timer1_config	equ	__end_of_timer1_config-_timer1_config
	
_timer1_config:	
	opt	stack 4
; Regs used in _timer1_config: [wreg]
	line	363
	
l4079:	
;common.c: 363: TMR1H=0xCF;
	movlw	(0CFh)
	bcf	status, 6	;RP1=0, select bank0
	movwf	(15)	;volatile
	line	364
;common.c: 364: TMR1L=0x2C;
	movlw	(02Ch)
	movwf	(14)	;volatile
	line	365
;common.c: 365: T1CON=0xE1;
	movlw	(0E1h)
	movwf	(16)	;volatile
	line	366
	
l4081:	
;common.c: 366: TMR1IE=1;
	bsf	status, 5	;RP0=1, select bank1
	bsf	(1120/8)^080h,(1120)&7
	line	368
	
l1580:	
	return
	opt stack 0
GLOBAL	__end_of_timer1_config
	__end_of_timer1_config:
;; =============== function _timer1_config ends ============

	signat	_timer1_config,88
	global	_clock_config
psect	text1393,local,class=CODE,delta=2
global __ptext1393
__ptext1393:

;; *************** function _clock_config *****************
;; Defined at:
;;		line 353 in file "D:\develop\AK7030-OTP-191211-change-pin_bb_div2(two_filter)\AK7030-OTP\common.c"
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
psect	text1393
	file	"D:\develop\AK7030-OTP-191211-change-pin_bb_div2(two_filter)\AK7030-OTP\common.c"
	line	353
	global	__size_of_clock_config
	__size_of_clock_config	equ	__end_of_clock_config-_clock_config
	
_clock_config:	
	opt	stack 4
; Regs used in _clock_config: [wreg+status,2]
	line	355
	
l4075:	
;common.c: 355: CLKPR = 0x80;
	movlw	(080h)
	bcf	status, 5	;RP0=0, select bank2
	bsf	status, 6	;RP1=1, select bank2
	movwf	(264)^0100h	;volatile
	line	356
	
l4077:	
;common.c: 356: CLKPR = 0x00;
	clrf	(264)^0100h	;volatile
	line	357
;common.c: 357: while(CLKPCE);
	
l1574:	
	btfsc	(2119/8)^0100h,(2119)&7
	goto	u1771
	goto	u1770
u1771:
	goto	l1574
u1770:
	line	358
	
l1577:	
	return
	opt stack 0
GLOBAL	__end_of_clock_config
	__end_of_clock_config:
;; =============== function _clock_config ends ============

	signat	_clock_config,88
	global	_clearTwentyMinTimer
psect	text1394,local,class=CODE,delta=2
global __ptext1394
__ptext1394:

;; *************** function _clearTwentyMinTimer *****************
;; Defined at:
;;		line 518 in file "D:\develop\AK7030-OTP-191211-change-pin_bb_div2(two_filter)\AK7030-OTP\common.c"
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
psect	text1394
	file	"D:\develop\AK7030-OTP-191211-change-pin_bb_div2(two_filter)\AK7030-OTP\common.c"
	line	518
	global	__size_of_clearTwentyMinTimer
	__size_of_clearTwentyMinTimer	equ	__end_of_clearTwentyMinTimer-_clearTwentyMinTimer
	
_clearTwentyMinTimer:	
	opt	stack 3
; Regs used in _clearTwentyMinTimer: [status,2]
	line	519
	
l4073:	
;common.c: 519: uiTwentyMinTimer = 0;
	bsf	status, 5	;RP0=1, select bank1
	clrf	(_uiTwentyMinTimer)^080h
	clrf	(_uiTwentyMinTimer+1)^080h
	line	520
;common.c: 520: bTwentyMinStartFlag = 0;
	bcf	status, 5	;RP0=0, select bank0
	clrf	(_bTwentyMinStartFlag)
	line	521
	
l1630:	
	return
	opt stack 0
GLOBAL	__end_of_clearTwentyMinTimer
	__end_of_clearTwentyMinTimer:
;; =============== function _clearTwentyMinTimer ends ============

	signat	_clearTwentyMinTimer,88
	global	_clearOneHoursTimer
psect	text1395,local,class=CODE,delta=2
global __ptext1395
__ptext1395:

;; *************** function _clearOneHoursTimer *****************
;; Defined at:
;;		line 511 in file "D:\develop\AK7030-OTP-191211-change-pin_bb_div2(two_filter)\AK7030-OTP\common.c"
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
psect	text1395
	file	"D:\develop\AK7030-OTP-191211-change-pin_bb_div2(two_filter)\AK7030-OTP\common.c"
	line	511
	global	__size_of_clearOneHoursTimer
	__size_of_clearOneHoursTimer	equ	__end_of_clearOneHoursTimer-_clearOneHoursTimer
	
_clearOneHoursTimer:	
	opt	stack 3
; Regs used in _clearOneHoursTimer: [status,2]
	line	512
	
l4071:	
;common.c: 512: uiOneHourTimer = 0;
	clrf	(_uiOneHourTimer)
	clrf	(_uiOneHourTimer+1)
	line	513
;common.c: 513: bOneHourTimerStartFlag = 0;
	clrf	(_bOneHourTimerStartFlag)
	line	514
	
l1627:	
	return
	opt stack 0
GLOBAL	__end_of_clearOneHoursTimer
	__end_of_clearOneHoursTimer:
;; =============== function _clearOneHoursTimer ends ============

	signat	_clearOneHoursTimer,88
	global	_clearThreeHoursTimer
psect	text1396,local,class=CODE,delta=2
global __ptext1396
__ptext1396:

;; *************** function _clearThreeHoursTimer *****************
;; Defined at:
;;		line 505 in file "D:\develop\AK7030-OTP-191211-change-pin_bb_div2(two_filter)\AK7030-OTP\common.c"
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
psect	text1396
	file	"D:\develop\AK7030-OTP-191211-change-pin_bb_div2(two_filter)\AK7030-OTP\common.c"
	line	505
	global	__size_of_clearThreeHoursTimer
	__size_of_clearThreeHoursTimer	equ	__end_of_clearThreeHoursTimer-_clearThreeHoursTimer
	
_clearThreeHoursTimer:	
	opt	stack 3
; Regs used in _clearThreeHoursTimer: [status,2]
	line	506
	
l4069:	
;common.c: 506: uiSmallTimer = 0;
	clrf	(_uiSmallTimer)
	clrf	(_uiSmallTimer+1)
	line	507
;common.c: 507: bSmallTimerStartFlag = 0;
	clrf	(_bSmallTimerStartFlag)
	line	508
	
l1624:	
	return
	opt stack 0
GLOBAL	__end_of_clearThreeHoursTimer
	__end_of_clearThreeHoursTimer:
;; =============== function _clearThreeHoursTimer ends ============

	signat	_clearThreeHoursTimer,88
	global	_clearTwelveHoursTimer
psect	text1397,local,class=CODE,delta=2
global __ptext1397
__ptext1397:

;; *************** function _clearTwelveHoursTimer *****************
;; Defined at:
;;		line 498 in file "D:\develop\AK7030-OTP-191211-change-pin_bb_div2(two_filter)\AK7030-OTP\common.c"
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
psect	text1397
	file	"D:\develop\AK7030-OTP-191211-change-pin_bb_div2(two_filter)\AK7030-OTP\common.c"
	line	498
	global	__size_of_clearTwelveHoursTimer
	__size_of_clearTwelveHoursTimer	equ	__end_of_clearTwelveHoursTimer-_clearTwelveHoursTimer
	
_clearTwelveHoursTimer:	
	opt	stack 3
; Regs used in _clearTwelveHoursTimer: [status,2]
	line	499
	
l4067:	
;common.c: 499: uiBigTimer = 0;
	bcf	status, 5	;RP0=0, select bank0
	clrf	(_uiBigTimer)
	clrf	(_uiBigTimer+1)
	line	500
;common.c: 500: bBigTimerStartFlag = 0;
	clrf	(_bBigTimerStartFlag)
	line	501
	
l1621:	
	return
	opt stack 0
GLOBAL	__end_of_clearTwelveHoursTimer
	__end_of_clearTwelveHoursTimer:
;; =============== function _clearTwelveHoursTimer ends ============

	signat	_clearTwelveHoursTimer,88
	global	_reset
psect	text1398,local,class=CODE,delta=2
global __ptext1398
__ptext1398:

;; *************** function _reset *****************
;; Defined at:
;;		line 307 in file "D:\develop\AK7030-OTP-191211-change-pin_bb_div2(two_filter)\AK7030-OTP\main.c"
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
psect	text1398
	file	"D:\develop\AK7030-OTP-191211-change-pin_bb_div2(two_filter)\AK7030-OTP\main.c"
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
psect	text1399,local,class=CODE,delta=2
global __ptext1399
__ptext1399:
	line	313
GLOBAL	__end_of_reset
	__end_of_reset:
;; =============== function _reset ends ============

	signat	_reset,88
	global	_selectAdChannel

;; *************** function _selectAdChannel *****************
;; Defined at:
;;		line 296 in file "D:\develop\AK7030-OTP-191211-change-pin_bb_div2(two_filter)\AK7030-OTP\main.c"
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
psect	text1399
	file	"D:\develop\AK7030-OTP-191211-change-pin_bb_div2(two_filter)\AK7030-OTP\main.c"
	line	296
	global	__size_of_selectAdChannel
	__size_of_selectAdChannel	equ	__end_of_selectAdChannel-_selectAdChannel
	
_selectAdChannel:	
	opt	stack 4
; Regs used in _selectAdChannel: []
	line	298
	
l4065:	
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
psect	text1400,local,class=CODE,delta=2
global __ptext1400
__ptext1400:

;; *************** function _pwm_start *****************
;; Defined at:
;;		line 244 in file "D:\develop\AK7030-OTP-191211-change-pin_bb_div2(two_filter)\AK7030-OTP\main.c"
;; Parameters:    Size  Location     Type
;;  ucPulseWidth    1    wreg     unsigned char 
;;  ucPulseFrequ    1   25[BANK0 ] unsigned char 
;; Auto vars:     Size  Location     Type
;;  ucPulseWidth    1   26[BANK0 ] unsigned char 
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
psect	text1400
	file	"D:\develop\AK7030-OTP-191211-change-pin_bb_div2(two_filter)\AK7030-OTP\main.c"
	line	244
	global	__size_of_pwm_start
	__size_of_pwm_start	equ	__end_of_pwm_start-_pwm_start
	
_pwm_start:	
	opt	stack 4
; Regs used in _pwm_start: [wreg+status,2+status,0]
;pwm_start@ucPulseWidth stored from wreg
	line	246
	movwf	(pwm_start@ucPulseWidth)
	
l4049:	
;main.c: 246: CCP1CON&= 0xf0;
	movlw	(0F0h)
	andwf	(23),f	;volatile
	line	248
	
l4051:	
;main.c: 248: T2CON=0x04;
	movlw	(04h)
	movwf	(18)	;volatile
	line	249
	
l4053:	
;main.c: 249: PR2 = ucPulseFrequency;
	movf	(pwm_start@ucPulseFrequency),w
	bsf	status, 5	;RP0=1, select bank1
	movwf	(146)^080h	;volatile
	line	250
	
l4055:	
;main.c: 250: CCPR1L = ucPulseWidth;
	bcf	status, 5	;RP0=0, select bank0
	movf	(pwm_start@ucPulseWidth),w
	movwf	(21)	;volatile
	line	251
	
l4057:	
;main.c: 251: CCP1CON=0x00;
	clrf	(23)	;volatile
	line	253
	
l4059:	
;main.c: 253: TRISB2=0;
	bsf	status, 5	;RP0=1, select bank1
	bcf	(1074/8)^080h,(1074)&7
	line	254
	
l4061:	
;main.c: 254: PBOD2 = 0;
	bsf	status, 6	;RP1=1, select bank3
	bcf	(3138/8)^0180h,(3138)&7
	line	256
	
l4063:	
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
psect	text1401,local,class=CODE,delta=2
global __ptext1401
__ptext1401:

;; *************** function _initPB2_AsHighResistence *****************
;; Defined at:
;;		line 232 in file "D:\develop\AK7030-OTP-191211-change-pin_bb_div2(two_filter)\AK7030-OTP\main.c"
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
psect	text1401
	file	"D:\develop\AK7030-OTP-191211-change-pin_bb_div2(two_filter)\AK7030-OTP\main.c"
	line	232
	global	__size_of_initPB2_AsHighResistence
	__size_of_initPB2_AsHighResistence	equ	__end_of_initPB2_AsHighResistence-_initPB2_AsHighResistence
	
_initPB2_AsHighResistence:	
	opt	stack 3
; Regs used in _initPB2_AsHighResistence: []
	line	234
	
l4047:	
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
psect	text1402,local,class=CODE,delta=2
global __ptext1402
__ptext1402:

;; *************** function _setPB5 *****************
;; Defined at:
;;		line 212 in file "D:\develop\AK7030-OTP-191211-change-pin_bb_div2(two_filter)\AK7030-OTP\main.c"
;; Parameters:    Size  Location     Type
;;  bValue          1    wreg     unsigned char 
;; Auto vars:     Size  Location     Type
;;  bValue          1   25[BANK0 ] unsigned char 
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
psect	text1402
	file	"D:\develop\AK7030-OTP-191211-change-pin_bb_div2(two_filter)\AK7030-OTP\main.c"
	line	212
	global	__size_of_setPB5
	__size_of_setPB5	equ	__end_of_setPB5-_setPB5
	
_setPB5:	
	opt	stack 4
; Regs used in _setPB5: [wreg]
;setPB5@bValue stored from wreg
	movwf	(setPB5@bValue)
	line	213
	
l4043:	
;main.c: 213: if( bValue )
	movf	(setPB5@bValue),w
	skipz
	goto	u1760
	goto	l710
u1760:
	line	216
	
l4045:	
;main.c: 216: PB1 = 1;
	bsf	(49/8),(49)&7
	goto	l712
	line	221
	
l710:	
	line	224
;main.c: 221: else
;main.c: 224: PB1 = 0;
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
psect	text1403,local,class=CODE,delta=2
global __ptext1403
__ptext1403:

;; *************** function _initPB5 *****************
;; Defined at:
;;		line 193 in file "D:\develop\AK7030-OTP-191211-change-pin_bb_div2(two_filter)\AK7030-OTP\main.c"
;; Parameters:    Size  Location     Type
;;  bValue          1    wreg     unsigned char 
;; Auto vars:     Size  Location     Type
;;  bValue          1   25[BANK0 ] unsigned char 
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
psect	text1403
	file	"D:\develop\AK7030-OTP-191211-change-pin_bb_div2(two_filter)\AK7030-OTP\main.c"
	line	193
	global	__size_of_initPB5
	__size_of_initPB5	equ	__end_of_initPB5-_initPB5
	
_initPB5:	
	opt	stack 3
; Regs used in _initPB5: [wreg]
;initPB5@bValue stored from wreg
	bcf	status, 5	;RP0=0, select bank0
	movwf	(initPB5@bValue)
	line	194
	
l4039:	
;main.c: 194: if( bValue )
	movf	(initPB5@bValue),w
	skipz
	goto	u1750
	goto	l705
u1750:
	line	197
	
l4041:	
;main.c: 197: TRISB1 = 1;
	bsf	status, 5	;RP0=1, select bank1
	bsf	(1073/8)^080h,(1073)&7
	goto	l707
	line	201
	
l705:	
	line	204
;main.c: 201: else
;main.c: 204: TRISB1= 0;
	bsf	status, 5	;RP0=1, select bank1
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
psect	text1404,local,class=CODE,delta=2
global __ptext1404
__ptext1404:

;; *************** function _setPB4 *****************
;; Defined at:
;;		line 174 in file "D:\develop\AK7030-OTP-191211-change-pin_bb_div2(two_filter)\AK7030-OTP\main.c"
;; Parameters:    Size  Location     Type
;;  bValue          1    wreg     unsigned char 
;; Auto vars:     Size  Location     Type
;;  bValue          1   25[BANK0 ] unsigned char 
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
psect	text1404
	file	"D:\develop\AK7030-OTP-191211-change-pin_bb_div2(two_filter)\AK7030-OTP\main.c"
	line	174
	global	__size_of_setPB4
	__size_of_setPB4	equ	__end_of_setPB4-_setPB4
	
_setPB4:	
	opt	stack 4
; Regs used in _setPB4: [wreg]
;setPB4@bValue stored from wreg
	movwf	(setPB4@bValue)
	line	175
	
l4035:	
;main.c: 175: if( bValue )
	movf	(setPB4@bValue),w
	skipz
	goto	u1740
	goto	l700
u1740:
	line	178
	
l4037:	
;main.c: 178: PB3 = 1;
	bsf	(51/8),(51)&7
	goto	l702
	line	182
	
l700:	
	line	185
;main.c: 182: else
;main.c: 185: PB3 = 0;
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
psect	text1405,local,class=CODE,delta=2
global __ptext1405
__ptext1405:

;; *************** function _initPB4 *****************
;; Defined at:
;;		line 155 in file "D:\develop\AK7030-OTP-191211-change-pin_bb_div2(two_filter)\AK7030-OTP\main.c"
;; Parameters:    Size  Location     Type
;;  bValue          1    wreg     unsigned char 
;; Auto vars:     Size  Location     Type
;;  bValue          1   25[BANK0 ] unsigned char 
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
psect	text1405
	file	"D:\develop\AK7030-OTP-191211-change-pin_bb_div2(two_filter)\AK7030-OTP\main.c"
	line	155
	global	__size_of_initPB4
	__size_of_initPB4	equ	__end_of_initPB4-_initPB4
	
_initPB4:	
	opt	stack 3
; Regs used in _initPB4: [wreg]
;initPB4@bValue stored from wreg
	bcf	status, 5	;RP0=0, select bank0
	movwf	(initPB4@bValue)
	line	156
	
l4031:	
;main.c: 156: if( bValue )
	movf	(initPB4@bValue),w
	skipz
	goto	u1730
	goto	l695
u1730:
	line	159
	
l4033:	
;main.c: 159: TRISB3 = 1;
	bsf	status, 5	;RP0=1, select bank1
	bsf	(1075/8)^080h,(1075)&7
	goto	l697
	line	163
	
l695:	
	line	166
;main.c: 163: else
;main.c: 166: TRISB3 = 0;
	bsf	status, 5	;RP0=1, select bank1
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
psect	text1406,local,class=CODE,delta=2
global __ptext1406
__ptext1406:

;; *************** function _setPB3 *****************
;; Defined at:
;;		line 135 in file "D:\develop\AK7030-OTP-191211-change-pin_bb_div2(two_filter)\AK7030-OTP\main.c"
;; Parameters:    Size  Location     Type
;;  bValue          1    wreg     unsigned char 
;; Auto vars:     Size  Location     Type
;;  bValue          1   25[BANK0 ] unsigned char 
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
psect	text1406
	file	"D:\develop\AK7030-OTP-191211-change-pin_bb_div2(two_filter)\AK7030-OTP\main.c"
	line	135
	global	__size_of_setPB3
	__size_of_setPB3	equ	__end_of_setPB3-_setPB3
	
_setPB3:	
	opt	stack 4
; Regs used in _setPB3: [wreg]
;setPB3@bValue stored from wreg
	bcf	status, 5	;RP0=0, select bank0
	movwf	(setPB3@bValue)
	line	136
	
l4027:	
;main.c: 136: if( bValue )
	movf	(setPB3@bValue),w
	skipz
	goto	u1720
	goto	l690
u1720:
	line	139
	
l4029:	
;main.c: 139: PB0 = 1;
	bsf	(48/8),(48)&7
	goto	l692
	line	143
	
l690:	
	line	146
;main.c: 143: else
;main.c: 146: PB0 = 0;
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
psect	text1407,local,class=CODE,delta=2
global __ptext1407
__ptext1407:

;; *************** function _initPB3 *****************
;; Defined at:
;;		line 116 in file "D:\develop\AK7030-OTP-191211-change-pin_bb_div2(two_filter)\AK7030-OTP\main.c"
;; Parameters:    Size  Location     Type
;;  bValue          1    wreg     unsigned char 
;; Auto vars:     Size  Location     Type
;;  bValue          1   25[BANK0 ] unsigned char 
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
psect	text1407
	file	"D:\develop\AK7030-OTP-191211-change-pin_bb_div2(two_filter)\AK7030-OTP\main.c"
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
	
l4023:	
;main.c: 117: if( bValue )
	movf	(initPB3@bValue),w
	skipz
	goto	u1710
	goto	l685
u1710:
	line	120
	
l4025:	
;main.c: 120: TRISB0 = 1;
	bsf	status, 5	;RP0=1, select bank1
	bsf	(1072/8)^080h,(1072)&7
	goto	l687
	line	124
	
l685:	
	line	127
;main.c: 124: else
;main.c: 127: TRISB0 = 0;
	bsf	status, 5	;RP0=1, select bank1
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
psect	text1408,local,class=CODE,delta=2
global __ptext1408
__ptext1408:

;; *************** function _ISR *****************
;; Defined at:
;;		line 651 in file "D:\develop\AK7030-OTP-191211-change-pin_bb_div2(two_filter)\AK7030-OTP\common.c"
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
psect	text1408
	file	"D:\develop\AK7030-OTP-191211-change-pin_bb_div2(two_filter)\AK7030-OTP\common.c"
	line	651
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
psect	text1408
	line	655
	
i1l3789:	
;common.c: 652: static unsigned char ucTimer1sCnt = 0;
;common.c: 655: if(TMR1IF == 1)
	btfss	(96/8),(96)&7
	goto	u140_21
	goto	u140_20
u140_21:
	goto	i1l3811
u140_20:
	line	657
	
i1l3791:	
;common.c: 656: {
;common.c: 657: TMR1IF = 0 ;
	bcf	(96/8),(96)&7
	line	658
	
i1l3793:	
;common.c: 658: timer.timer10msStopWatch++;
	incf	(_timer),f
	line	659
;common.c: 659: ucTimer1sCnt++;
	incf	(ISR@ucTimer1sCnt),f
	line	663
	
i1l3795:	
;common.c: 663: if(ucTimer1sCnt >= 100)
	movlw	(064h)
	subwf	(ISR@ucTimer1sCnt),w
	skipc
	goto	u141_21
	goto	u141_20
u141_21:
	goto	i1l3811
u141_20:
	line	665
	
i1l3797:	
;common.c: 664: {
;common.c: 665: ucTimer1sCnt = 0;
	clrf	(ISR@ucTimer1sCnt)
	line	666
	
i1l3799:	
;common.c: 666: if(uiBigTimer > 0)
	movf	(_uiBigTimer+1),w
	iorwf	(_uiBigTimer),w
	skipnz
	goto	u142_21
	goto	u142_20
u142_21:
	goto	i1l1677
u142_20:
	line	667
	
i1l3801:	
;common.c: 667: uiBigTimer--;
	movlw	low(01h)
	subwf	(_uiBigTimer),f
	movlw	high(01h)
	skipc
	decf	(_uiBigTimer+1),f
	subwf	(_uiBigTimer+1),f
	
i1l1677:	
	line	669
;common.c: 669: if(uiSmallTimer)
	movf	(_uiSmallTimer+1),w
	iorwf	(_uiSmallTimer),w
	skipnz
	goto	u143_21
	goto	u143_20
u143_21:
	goto	i1l1678
u143_20:
	line	670
	
i1l3803:	
;common.c: 670: uiSmallTimer--;
	movlw	low(01h)
	subwf	(_uiSmallTimer),f
	movlw	high(01h)
	skipc
	decf	(_uiSmallTimer+1),f
	subwf	(_uiSmallTimer+1),f
	
i1l1678:	
	line	672
;common.c: 672: if(uiTwentySecondsTimer)
	bsf	status, 5	;RP0=1, select bank1
	movf	(_uiTwentySecondsTimer+1)^080h,w
	iorwf	(_uiTwentySecondsTimer)^080h,w
	skipnz
	goto	u144_21
	goto	u144_20
u144_21:
	goto	i1l1679
u144_20:
	line	673
	
i1l3805:	
;common.c: 673: uiTwentySecondsTimer--;
	movlw	low(01h)
	subwf	(_uiTwentySecondsTimer)^080h,f
	movlw	high(01h)
	skipc
	decf	(_uiTwentySecondsTimer+1)^080h,f
	subwf	(_uiTwentySecondsTimer+1)^080h,f
	
i1l1679:	
	line	675
;common.c: 675: if(uiTwentyMinTimer)
	movf	(_uiTwentyMinTimer+1)^080h,w
	iorwf	(_uiTwentyMinTimer)^080h,w
	skipnz
	goto	u145_21
	goto	u145_20
u145_21:
	goto	i1l1680
u145_20:
	line	676
	
i1l3807:	
;common.c: 676: uiTwentyMinTimer--;
	movlw	low(01h)
	subwf	(_uiTwentyMinTimer)^080h,f
	movlw	high(01h)
	skipc
	decf	(_uiTwentyMinTimer+1)^080h,f
	subwf	(_uiTwentyMinTimer+1)^080h,f
	
i1l1680:	
	line	678
;common.c: 678: if( uiOneHourTimer )
	bcf	status, 5	;RP0=0, select bank0
	movf	(_uiOneHourTimer+1),w
	iorwf	(_uiOneHourTimer),w
	skipnz
	goto	u146_21
	goto	u146_20
u146_21:
	goto	i1l3811
u146_20:
	line	679
	
i1l3809:	
;common.c: 679: uiOneHourTimer--;
	movlw	low(01h)
	subwf	(_uiOneHourTimer),f
	movlw	high(01h)
	skipc
	decf	(_uiOneHourTimer+1),f
	subwf	(_uiOneHourTimer+1),f
	line	683
	
i1l3811:	
;common.c: 680: }
;common.c: 681: }
;common.c: 683: if(ADIF)
	btfss	(106/8),(106)&7
	goto	u147_21
	goto	u147_20
u147_21:
	goto	i1l1685
u147_20:
	line	686
	
i1l3813:	
;common.c: 684: {
;common.c: 686: ADIF=0;
	bcf	(106/8),(106)&7
	line	687
	
i1l3815:	
;common.c: 687: setAD_ConvertFlag(1);
	movlw	(01h)
	fcall	i1_setAD_ConvertFlag
	line	689
	
i1l3817:	
;common.c: 689: if(sampleChannelSelect == 2)
	movf	(_sampleChannelSelect),w
	xorlw	02h
	skipz
	goto	u148_21
	goto	u148_20
u148_21:
	goto	i1l3821
u148_20:
	line	693
	
i1l3819:	
;common.c: 690: {
;common.c: 693: vPutSampleDataIntoTable(adc_get(),2);
	fcall	_adc_get
	movf	(1+(?_adc_get)),w
	movwf	(?_vPutSampleDataIntoTable+1)
	movf	(0+(?_adc_get)),w
	movwf	(?_vPutSampleDataIntoTable)
	movlw	(02h)
	movwf	0+(?_vPutSampleDataIntoTable)+02h
	fcall	_vPutSampleDataIntoTable
	line	697
;common.c: 697: }
	goto	i1l1685
	line	703
	
i1l3821:	
;common.c: 698: else
;common.c: 699: {
;common.c: 703: vPutSampleDataIntoTable(adc_get(),1);
	fcall	_adc_get
	movf	(1+(?_adc_get)),w
	movwf	(?_vPutSampleDataIntoTable+1)
	movf	(0+(?_adc_get)),w
	movwf	(?_vPutSampleDataIntoTable)
	clrf	0+(?_vPutSampleDataIntoTable)+02h
	incf	0+(?_vPutSampleDataIntoTable)+02h,f
	fcall	_vPutSampleDataIntoTable
	line	708
	
i1l1685:	
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
psect	text1409,local,class=CODE,delta=2
global __ptext1409
__ptext1409:

;; *************** function _vPutSampleDataIntoTable *****************
;; Defined at:
;;		line 165 in file "D:\develop\AK7030-OTP-191211-change-pin_bb_div2(two_filter)\AK7030-OTP\common.c"
;; Parameters:    Size  Location     Type
;;  uiSampleData    2    6[COMMON] unsigned int 
;;  channel         1    8[COMMON] unsigned char 
;; Auto vars:     Size  Location     Type
;;  uiDeviationV    2   19[BANK0 ] unsigned int 
;;  uiAbstractVa    2   15[BANK0 ] unsigned int 
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
;;      Locals:         0       6       0       0       0
;;      Temps:          2       0       0       0       0
;;      Totals:         5       6       0       0       0
;;Total ram usage:       11 bytes
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
psect	text1409
	file	"D:\develop\AK7030-OTP-191211-change-pin_bb_div2(two_filter)\AK7030-OTP\common.c"
	line	165
	global	__size_of_vPutSampleDataIntoTable
	__size_of_vPutSampleDataIntoTable	equ	__end_of_vPutSampleDataIntoTable-_vPutSampleDataIntoTable
	
_vPutSampleDataIntoTable:	
	opt	stack 3
; Regs used in _vPutSampleDataIntoTable: [wreg-fsr0h+status,2+status,0+btemp+1+pclath+cstack]
	line	182
	
i1l3671:	
;common.c: 167: static unsigned char ucCh12Length = 0;
;common.c: 169: static unsigned char ucCh13Length = 0;
;common.c: 171: static unsigned char ucChannelFourteenthLength = 0;
;common.c: 172: static unsigned int uiCalWidthArrayNew = 0;
;common.c: 173: static unsigned int uiCalWidthArrayOld = 0;
;common.c: 180: static unsigned char ucInitFlag = 0;
;common.c: 182: if(channel == 2)
	movf	(vPutSampleDataIntoTable@channel),w
	xorlw	02h
	skipz
	goto	u120_21
	goto	u120_20
u120_21:
	goto	i1l3733
u120_20:
	line	184
	
i1l3673:	
;common.c: 183: {
;common.c: 184: if(ucCh12Length < 3)
	movlw	(03h)
	subwf	(vPutSampleDataIntoTable@ucCh12Length),w
	skipnc
	goto	u121_21
	goto	u121_20
u121_21:
	goto	i1l3729
u121_20:
	line	186
	
i1l3675:	
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
	
i1l3677:	
;common.c: 188: ucCh12Length++;
	incf	(vPutSampleDataIntoTable@ucCh12Length),f
	line	190
	
i1l3679:	
;common.c: 190: if( 3 == ucCh12Length )
	movf	(vPutSampleDataIntoTable@ucCh12Length),w
	xorlw	03h
	skipz
	goto	u122_21
	goto	u122_20
u122_21:
	goto	i1l1571
u122_20:
	line	192
	
i1l3681:	
;common.c: 191: {
;common.c: 192: ucCh12Length = 0;
	clrf	(vPutSampleDataIntoTable@ucCh12Length)
	line	202
	
i1l3683:	
;common.c: 196: static unsigned char bInitArrayFlag = 0;
;common.c: 198: static unsigned int uiCalWidthArray[1],uiCalWidthCnt = 0;
;common.c: 200: static unsigned char uiInitWidth = 75;
;common.c: 202: uiCalWidthArrayNew = Filter(uiSampleCh12);
	movlw	(_uiSampleCh12)&0ffh
	fcall	_Filter
	movf	(1+(?_Filter)),w
	movwf	(vPutSampleDataIntoTable@uiCalWidthArrayNew+1)
	movf	(0+(?_Filter)),w
	movwf	(vPutSampleDataIntoTable@uiCalWidthArrayNew)
	line	215
	
i1l3685:	
	
i1l3687:	
	line	217
	
i1l3689:	
;common.c: 217: if( uiCalWidthArrayNew >= uiCalWidthArrayOld)
	movf	(vPutSampleDataIntoTable@uiCalWidthArrayOld+1),w
	subwf	(vPutSampleDataIntoTable@uiCalWidthArrayNew+1),w
	skipz
	goto	u123_25
	movf	(vPutSampleDataIntoTable@uiCalWidthArrayOld),w
	subwf	(vPutSampleDataIntoTable@uiCalWidthArrayNew),w
u123_25:
	skipc
	goto	u123_21
	goto	u123_20
u123_21:
	goto	i1l3695
u123_20:
	line	219
	
i1l3691:	
;common.c: 218: {
;common.c: 219: uiAbstractValue = uiCalWidthArrayNew - uiCalWidthArrayOld;
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
	line	220
;common.c: 220: uiDeviationValue = ((uiCalWidthArrayNew+uiCalWidthArrayOld)>>1) + (uiAbstractValue<<1);
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
	
i1l3693:	
	clrc
	rrf	(vPutSampleDataIntoTable@uiDeviationValue+1),f
	rrf	(vPutSampleDataIntoTable@uiDeviationValue),f
	movf	(vPutSampleDataIntoTable@uiAbstractValue+1),w
	movwf	(??_vPutSampleDataIntoTable+0)+0+1
	movf	(vPutSampleDataIntoTable@uiAbstractValue),w
	movwf	(??_vPutSampleDataIntoTable+0)+0
	clrc
	rlf	(??_vPutSampleDataIntoTable+0)+0,f
	rlf	(??_vPutSampleDataIntoTable+0)+1,f
	movf	0+(??_vPutSampleDataIntoTable+0)+0,w
	addwf	(vPutSampleDataIntoTable@uiDeviationValue),f
	skipnc
	incf	(vPutSampleDataIntoTable@uiDeviationValue+1),f
	movf	1+(??_vPutSampleDataIntoTable+0)+0,w
	addwf	(vPutSampleDataIntoTable@uiDeviationValue+1),f
	line	222
;common.c: 222: }
	goto	i1l3699
	line	225
	
i1l3695:	
;common.c: 223: else
;common.c: 224: {
;common.c: 225: uiAbstractValue = uiCalWidthArrayOld - uiCalWidthArrayNew;
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
	line	226
;common.c: 226: uiDeviationValue = ((uiCalWidthArrayNew+uiCalWidthArrayOld)>>1) - (uiAbstractValue<<1);
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
	
i1l3697:	
	clrc
	rrf	(vPutSampleDataIntoTable@uiDeviationValue+1),f
	rrf	(vPutSampleDataIntoTable@uiDeviationValue),f
	movf	(vPutSampleDataIntoTable@uiAbstractValue+1),w
	movwf	(??_vPutSampleDataIntoTable+0)+0+1
	movf	(vPutSampleDataIntoTable@uiAbstractValue),w
	movwf	(??_vPutSampleDataIntoTable+0)+0
	clrc
	rlf	(??_vPutSampleDataIntoTable+0)+0,f
	rlf	(??_vPutSampleDataIntoTable+0)+1,f
	movf	0+(??_vPutSampleDataIntoTable+0)+0,w
	subwf	(vPutSampleDataIntoTable@uiDeviationValue),f
	movf	1+(??_vPutSampleDataIntoTable+0)+0,w
	skipc
	decf	(vPutSampleDataIntoTable@uiDeviationValue+1),f
	subwf	(vPutSampleDataIntoTable@uiDeviationValue+1),f
	line	236
	
i1l3699:	
;common.c: 229: }
;common.c: 236: if(uiCalWidthCnt>400)
	movlw	high(0191h)
	bsf	status, 5	;RP0=1, select bank1
	subwf	(vPutSampleDataIntoTable@uiCalWidthCnt+1)^080h,w
	movlw	low(0191h)
	skipnz
	subwf	(vPutSampleDataIntoTable@uiCalWidthCnt)^080h,w
	skipc
	goto	u124_21
	goto	u124_20
u124_21:
	goto	i1l1546
u124_20:
	line	237
	
i1l3701:	
;common.c: 237: uiDeviationValue =400;
	movlw	low(0190h)
	bcf	status, 5	;RP0=0, select bank0
	movwf	(vPutSampleDataIntoTable@uiDeviationValue)
	movlw	high(0190h)
	movwf	((vPutSampleDataIntoTable@uiDeviationValue))+1
	
i1l1546:	
	line	244
;common.c: 244: uiCalWidthArrayOld=uiCalWidthArrayNew;
	movf	(vPutSampleDataIntoTable@uiCalWidthArrayNew+1),w
	bcf	status, 5	;RP0=0, select bank0
	movwf	(vPutSampleDataIntoTable@uiCalWidthArrayOld+1)
	movf	(vPutSampleDataIntoTable@uiCalWidthArrayNew),w
	movwf	(vPutSampleDataIntoTable@uiCalWidthArrayOld)
	line	249
;common.c: 249: if(uiDeviationValue > (470))
	movlw	high(01D7h)
	subwf	(vPutSampleDataIntoTable@uiDeviationValue+1),w
	movlw	low(01D7h)
	skipnz
	subwf	(vPutSampleDataIntoTable@uiDeviationValue),w
	skipc
	goto	u125_21
	goto	u125_20
u125_21:
	goto	i1l3709
u125_20:
	line	252
	
i1l3703:	
;common.c: 250: {
;common.c: 252: if(uiDeviationValue <= (470+5))
	movlw	high(01DCh)
	subwf	(vPutSampleDataIntoTable@uiDeviationValue+1),w
	movlw	low(01DCh)
	skipnz
	subwf	(vPutSampleDataIntoTable@uiDeviationValue),w
	skipnc
	goto	u126_21
	goto	u126_20
u126_21:
	goto	i1l3707
u126_20:
	line	253
	
i1l3705:	
;common.c: 253: {uiInitWidth++;
	incf	(vPutSampleDataIntoTable@uiInitWidth),f
	line	254
;common.c: 254: }
	goto	i1l3717
	line	256
	
i1l3707:	
;common.c: 255: else
;common.c: 256: {uiInitWidth=uiInitWidth+2;
	incf	(vPutSampleDataIntoTable@uiInitWidth),f
	incf	(vPutSampleDataIntoTable@uiInitWidth),f
	goto	i1l3717
	line	260
	
i1l3709:	
;common.c: 260: else if(uiDeviationValue < (470))
	movlw	high(01D6h)
	subwf	(vPutSampleDataIntoTable@uiDeviationValue+1),w
	movlw	low(01D6h)
	skipnz
	subwf	(vPutSampleDataIntoTable@uiDeviationValue),w
	skipnc
	goto	u127_21
	goto	u127_20
u127_21:
	goto	i1l3717
u127_20:
	line	264
	
i1l3711:	
;common.c: 261: {
;common.c: 264: if(uiDeviationValue >= (470+5))
	movlw	high(01DBh)
	subwf	(vPutSampleDataIntoTable@uiDeviationValue+1),w
	movlw	low(01DBh)
	skipnz
	subwf	(vPutSampleDataIntoTable@uiDeviationValue),w
	skipc
	goto	u128_21
	goto	u128_20
u128_21:
	goto	i1l3715
u128_20:
	line	265
	
i1l3713:	
;common.c: 265: {uiInitWidth--;
	decf	(vPutSampleDataIntoTable@uiInitWidth),f
	line	266
;common.c: 266: }
	goto	i1l3717
	line	268
	
i1l3715:	
;common.c: 267: else
;common.c: 268: {uiInitWidth=uiInitWidth-2;
	movlw	(0FEh)
	addwf	(vPutSampleDataIntoTable@uiInitWidth),f
	line	276
	
i1l3717:	
;common.c: 276: if(uiInitWidth > 249)
	movlw	(0FAh)
	subwf	(vPutSampleDataIntoTable@uiInitWidth),w
	skipc
	goto	u129_21
	goto	u129_20
u129_21:
	goto	i1l1555
u129_20:
	line	277
	
i1l3719:	
;common.c: 277: uiInitWidth = 249;
	movlw	(0F9h)
	movwf	(vPutSampleDataIntoTable@uiInitWidth)
	
i1l1555:	
	line	279
;common.c: 279: if(uiInitWidth < 75)
	movlw	(04Bh)
	subwf	(vPutSampleDataIntoTable@uiInitWidth),w
	skipnc
	goto	u130_21
	goto	u130_20
u130_21:
	goto	i1l3723
u130_20:
	line	280
	
i1l3721:	
;common.c: 280: uiInitWidth = 75;
	movlw	(04Bh)
	movwf	(vPutSampleDataIntoTable@uiInitWidth)
	line	284
	
i1l3723:	
;common.c: 284: if( 1 == getWaitResetFlag())
	fcall	_getWaitResetFlag
	xorlw	01h
	skipz
	goto	u131_21
	goto	u131_20
u131_21:
	goto	i1l3727
u131_20:
	line	287
	
i1l3725:	
;common.c: 285: {
;common.c: 287: uiInitWidth = 150;
	movlw	(096h)
	movwf	(vPutSampleDataIntoTable@uiInitWidth)
	line	289
	
i1l3727:	
;common.c: 288: }
;common.c: 289: setPWM_Width(uiInitWidth);
	movf	(vPutSampleDataIntoTable@uiInitWidth),w
	fcall	_setPWM_Width
	goto	i1l1571
	line	296
	
i1l3729:	
;common.c: 294: else
;common.c: 295: {
;common.c: 296: ucCh12Length = 0;
	clrf	(vPutSampleDataIntoTable@ucCh12Length)
	line	298
	
i1l3731:	
;common.c: 298: uiSampleCh12[ucCh12Length] = uiSampleData;
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
	goto	i1l1571
	line	301
	
i1l3733:	
;common.c: 301: else if(channel == 1)
	decf	(vPutSampleDataIntoTable@channel),w
	skipz
	goto	u132_21
	goto	u132_20
u132_21:
	goto	i1l3745
u132_20:
	line	303
	
i1l3735:	
;common.c: 302: {
;common.c: 303: if(ucCh13Length < 3)
	movlw	(03h)
	bcf	status, 5	;RP0=0, select bank0
	subwf	(vPutSampleDataIntoTable@ucCh13Length),w
	skipnc
	goto	u133_21
	goto	u133_20
u133_21:
	goto	i1l3741
u133_20:
	line	305
	
i1l3737:	
;common.c: 304: {
;common.c: 305: uiSampleCh13[ucCh13Length] = uiSampleData;
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
	line	307
	
i1l3739:	
;common.c: 307: ucCh13Length++;
	incf	(vPutSampleDataIntoTable@ucCh13Length),f
	line	308
;common.c: 308: }
	goto	i1l1571
	line	311
	
i1l3741:	
;common.c: 309: else
;common.c: 310: {
;common.c: 311: ucCh13Length = 0;
	clrf	(vPutSampleDataIntoTable@ucCh13Length)
	line	313
	
i1l3743:	
;common.c: 313: uiSampleCh13[ucCh13Length] = uiSampleData;
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
	goto	i1l1571
	line	316
	
i1l3745:	
;common.c: 316: else if(channel == 14)
	movf	(vPutSampleDataIntoTable@channel),w
	xorlw	0Eh
	skipz
	goto	u134_21
	goto	u134_20
u134_21:
	goto	i1l3757
u134_20:
	line	318
	
i1l3747:	
;common.c: 317: {
;common.c: 318: if(ucChannelFourteenthLength < 3)
	movlw	(03h)
	bcf	status, 5	;RP0=0, select bank0
	subwf	(vPutSampleDataIntoTable@ucChannelFourteenthLength),w
	skipnc
	goto	u135_21
	goto	u135_20
u135_21:
	goto	i1l3753
u135_20:
	line	320
	
i1l3749:	
;common.c: 319: {
;common.c: 320: uiSampleChannelFourteenth[ucChannelFourteenthLength] = uiSampleData;
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
	line	322
	
i1l3751:	
;common.c: 322: ucChannelFourteenthLength++;
	incf	(vPutSampleDataIntoTable@ucChannelFourteenthLength),f
	line	323
;common.c: 323: }
	goto	i1l1571
	line	326
	
i1l3753:	
;common.c: 324: else
;common.c: 325: {
;common.c: 326: ucChannelFourteenthLength = 0;
	clrf	(vPutSampleDataIntoTable@ucChannelFourteenthLength)
	line	328
	
i1l3755:	
;common.c: 328: uiSampleCh13[ucChannelFourteenthLength] = uiSampleData;
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
	goto	i1l1571
	line	333
	
i1l3757:	
;common.c: 331: else
;common.c: 332: {
;common.c: 333: ucCh12Length = 0;
	clrf	(vPutSampleDataIntoTable@ucCh12Length)
	line	335
;common.c: 335: ucCh13Length = 0;
	bcf	status, 5	;RP0=0, select bank0
	clrf	(vPutSampleDataIntoTable@ucCh13Length)
	line	337
;common.c: 337: ucChannelFourteenthLength = 0;
	clrf	(vPutSampleDataIntoTable@ucChannelFourteenthLength)
	line	339
;common.c: 339: for(int i = 0;i < 3; i++)
	clrf	(vPutSampleDataIntoTable@i)
	clrf	(vPutSampleDataIntoTable@i+1)
	line	341
	
i1l3763:	
;common.c: 340: {
;common.c: 341: uiSampleCh12[i] = 0;
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
	line	343
;common.c: 343: uiSampleCh13[i] = 0;
	clrc
	rlf	(vPutSampleDataIntoTable@i),w
	addlw	_uiSampleCh13&0ffh
	movwf	fsr0
	clrf	indf
	incf	fsr0,f
	clrf	indf
	line	345
;common.c: 345: uiSampleChannelFourteenth[i] = 0;
	clrc
	rlf	(vPutSampleDataIntoTable@i),w
	addlw	_uiSampleChannelFourteenth&0ffh
	movwf	fsr0
	clrf	indf
	incf	fsr0,f
	clrf	indf
	line	339
	
i1l3765:	
	incf	(vPutSampleDataIntoTable@i),f
	skipnz
	incf	(vPutSampleDataIntoTable@i+1),f
	
i1l3767:	
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
	goto	i1l3763
u136_20:
	line	349
	
i1l1571:	
	return
	opt stack 0
GLOBAL	__end_of_vPutSampleDataIntoTable
	__end_of_vPutSampleDataIntoTable:
;; =============== function _vPutSampleDataIntoTable ends ============

	signat	_vPutSampleDataIntoTable,8312
	global	i1_setAD_ConvertFlag
psect	text1410,local,class=CODE,delta=2
global __ptext1410
__ptext1410:

;; *************** function i1_setAD_ConvertFlag *****************
;; Defined at:
;;		line 387 in file "D:\develop\AK7030-OTP-191211-change-pin_bb_div2(two_filter)\AK7030-OTP\common.c"
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
psect	text1410
	file	"D:\develop\AK7030-OTP-191211-change-pin_bb_div2(two_filter)\AK7030-OTP\common.c"
	line	387
	global	__size_ofi1_setAD_ConvertFlag
	__size_ofi1_setAD_ConvertFlag	equ	__end_ofi1_setAD_ConvertFlag-i1_setAD_ConvertFlag
	
i1_setAD_ConvertFlag:	
	opt	stack 4
; Regs used in i1_setAD_ConvertFlag: [wreg]
;i1setAD_ConvertFlag@flag stored from wreg
	movwf	(i1setAD_ConvertFlag@flag)
	line	388
	
i1l3827:	
;common.c: 388: adc_convert_flag = flag;
	movf	(i1setAD_ConvertFlag@flag),w
	movwf	(_adc_convert_flag)
	line	389
	
i1l1589:	
	return
	opt stack 0
GLOBAL	__end_ofi1_setAD_ConvertFlag
	__end_ofi1_setAD_ConvertFlag:
;; =============== function i1_setAD_ConvertFlag ends ============

	signat	i1_setAD_ConvertFlag,88
	global	_adc_get
psect	text1411,local,class=CODE,delta=2
global __ptext1411
__ptext1411:

;; *************** function _adc_get *****************
;; Defined at:
;;		line 142 in file "D:\develop\AK7030-OTP-191211-change-pin_bb_div2(two_filter)\AK7030-OTP\periph.c"
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
psect	text1411
	file	"D:\develop\AK7030-OTP-191211-change-pin_bb_div2(two_filter)\AK7030-OTP\periph.c"
	line	142
	global	__size_of_adc_get
	__size_of_adc_get	equ	__end_of_adc_get-_adc_get
	
_adc_get:	
	opt	stack 4
; Regs used in _adc_get: [wreg]
	line	144
	
i1l3823:	
;periph.c: 143: unsigned int val;
;periph.c: 144: val = (ADRESH<<8) | ADRESL;
	movf	(30),w	;volatile
	movwf	(adc_get@val+1)
	clrf	(adc_get@val)
	bsf	status, 5	;RP0=1, select bank1
	movf	(158)^080h,w	;volatile
	iorwf	(adc_get@val),f
	line	146
;periph.c: 146: val = val + ad_offset;
	movf	(_ad_offset)^080h,w
	addwf	(adc_get@val),f
	skipnc
	incf	(adc_get@val+1),f
	movf	(_ad_offset+1)^080h,w
	addwf	(adc_get@val+1),f
	line	148
;periph.c: 148: return val;
	movf	(adc_get@val+1),w
	movwf	(?_adc_get+1)
	movf	(adc_get@val),w
	movwf	(?_adc_get)
	line	149
	
i1l2352:	
	return
	opt stack 0
GLOBAL	__end_of_adc_get
	__end_of_adc_get:
;; =============== function _adc_get ends ============

	signat	_adc_get,90
	global	_Filter
psect	text1412,local,class=CODE,delta=2
global __ptext1412
__ptext1412:

;; *************** function _Filter *****************
;; Defined at:
;;		line 117 in file "D:\develop\AK7030-OTP-191211-change-pin_bb_div2(two_filter)\AK7030-OTP\common.c"
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
psect	text1412
	file	"D:\develop\AK7030-OTP-191211-change-pin_bb_div2(two_filter)\AK7030-OTP\common.c"
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
	
i1l3623:	
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
	
i1l3629:	
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
	
i1l3631:	
	incf	(Filter@tmpValue),f
	incf	(Filter@tmpValue),f
	line	125
	
i1l3633:	
	incf	(Filter@cir),f
	skipnz
	incf	(Filter@cir+1),f
	
i1l3635:	
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
	goto	i1l3629
u115_20:
	line	130
	
i1l3637:	
;common.c: 130: for(j = 0; j < 3 - 1; j++)
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	clrf	(Filter@j)
	line	132
	
i1l3643:	
;common.c: 131: {
;common.c: 132: for(i = 0; i < 3 - 1 - j; i++)
	clrf	(Filter@i)
	goto	i1l3651
	line	134
	
i1l3645:	
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
	goto	u116_25
	movf	0+(??_Filter+0)+0,w
	subwf	0+(??_Filter+2)+0,w
u116_25:
	skipnc
	goto	u116_21
	goto	u116_20
u116_21:
	goto	i1l3649
u116_20:
	line	137
	
i1l3647:	
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
	
i1l3649:	
	incf	(Filter@i),f
	
i1l3651:	
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
	goto	i1l3645
u117_20:
	line	130
	
i1l3653:	
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	incf	(Filter@j),f
	
i1l3655:	
	movlw	(02h)
	subwf	(Filter@j),w
	skipc
	goto	u118_21
	goto	u118_20
u118_21:
	goto	i1l3643
u118_20:
	
i1l1511:	
	line	146
;common.c: 142: }
;common.c: 143: }
;common.c: 144: }
;common.c: 146: for(i = 1; i < 3 - 1; i++)
	clrf	(Filter@i)
	incf	(Filter@i),f
	line	148
	
i1l3661:	
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
	
i1l3663:	
	incf	(Filter@i),f
	
i1l3665:	
	movlw	(02h)
	subwf	(Filter@i),w
	skipc
	goto	u119_21
	goto	u119_20
u119_21:
	goto	i1l3661
u119_20:
	line	153
	
i1l3667:	
;common.c: 149: }
;common.c: 153: return (filter_sum );
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
psect	text1413,local,class=CODE,delta=2
global __ptext1413
__ptext1413:

;; *************** function _setPWM_Width *****************
;; Defined at:
;;		line 65 in file "D:\develop\AK7030-OTP-191211-change-pin_bb_div2(two_filter)\AK7030-OTP\common.c"
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
psect	text1413
	file	"D:\develop\AK7030-OTP-191211-change-pin_bb_div2(two_filter)\AK7030-OTP\common.c"
	line	65
	global	__size_of_setPWM_Width
	__size_of_setPWM_Width	equ	__end_of_setPWM_Width-_setPWM_Width
	
_setPWM_Width:	
	opt	stack 3
; Regs used in _setPWM_Width: [wreg]
;setPWM_Width@ucWidth stored from wreg
	line	70
	movwf	(setPWM_Width@ucWidth)
	
i1l3573:	
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
psect	text1414,local,class=CODE,delta=2
global __ptext1414
__ptext1414:

;; *************** function _getWaitResetFlag *****************
;; Defined at:
;;		line 60 in file "D:\develop\AK7030-OTP-191211-change-pin_bb_div2(two_filter)\AK7030-OTP\common.c"
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
psect	text1414
	file	"D:\develop\AK7030-OTP-191211-change-pin_bb_div2(two_filter)\AK7030-OTP\common.c"
	line	60
	global	__size_of_getWaitResetFlag
	__size_of_getWaitResetFlag	equ	__end_of_getWaitResetFlag-_getWaitResetFlag
	
_getWaitResetFlag:	
	opt	stack 3
; Regs used in _getWaitResetFlag: [wreg]
	line	61
	
i1l3569:	
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
psect	text1415,local,class=CODE,delta=2
global __ptext1415
__ptext1415:
	global	btemp
	btemp set 07Eh

	DABS	1,126,2	;btemp
	global	wtemp0
	wtemp0 set btemp
	end
