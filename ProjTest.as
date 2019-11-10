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
	FNCALL	_setPinInitVaule,_setPB3
	FNCALL	_setPinInitVaule,_setPB4
	FNCALL	_setPinInitVaule,_setPB5
	FNCALL	_initPin,_initPB2_AsHighResistence
	FNCALL	_initPin,_initPB3
	FNCALL	_initPin,_initPB4
	FNCALL	_initPin,_initPB5
	FNROOT	_main
	FNCALL	_ISR,_setAD_ConvertFlag
	FNCALL	_ISR,_adc_get
	FNCALL	_ISR,_vPutSampleDataIntoTable
	FNCALL	_vPutSampleDataIntoTable,_disable_AD_interrupt
	FNCALL	_vPutSampleDataIntoTable,_FilterCh12
	FNCALL	_vPutSampleDataIntoTable,_setPWM_Width
	FNCALL	_vPutSampleDataIntoTable,_switchSampleChannel
	FNCALL	_vPutSampleDataIntoTable,_enable_AD_interrupt
	FNCALL	_switchSampleChannel,i1_adc_test_init
	FNCALL	intlevel1,_ISR
	global	intlevel1
	FNROOT	intlevel1
	global	_sampleChannelSelect
	global	vPutSampleDataIntoTable@uiInitWidth
psect	idataBANK0,class=CODE,space=0,delta=2
global __pidataBANK0
__pidataBANK0:
	file	"D:\develop\190625\AK7030-OTP\common.c"
	line	24

;initializer for _sampleChannelSelect
	retlw	0Ch
	line	220

;initializer for vPutSampleDataIntoTable@uiInitWidth
	retlw	04Bh
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
	global	_bBigTimerStartFlag
	global	_bOneHourTimerStartFlag
	global	_bSmallTimerStartFlag
	global	_bTwentyMinStartFlag
	global	_timer
	global	main@cTimerP5s_777
	global	main@cTimerP5s_783
	global	main@ucStep
	global	main@ucTimerP3s
	global	main@ucTimerP5s
	global	vPutSampleDataIntoTable@ucCh12Length
	global	vPutSampleDataIntoTable@ucCh13Length
	global	_uiSampleCh12
	global	setPWM_Width@ucOldWidth
	global	_uiSampleCh13
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
setPWM_Width@ucOldWidth:
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

_bBigTimerStartFlag:
       ds      1

_bOneHourTimerStartFlag:
       ds      1

_bSmallTimerStartFlag:
       ds      1

_bTwentyMinStartFlag:
       ds      1

_timer:
       ds      1

main@cTimerP5s_777:
       ds      1

main@cTimerP5s_783:
       ds      1

main@ucStep:
       ds      1

main@ucTimerP3s:
       ds      1

main@ucTimerP5s:
       ds      1

vPutSampleDataIntoTable@ucCh12Length:
       ds      1

vPutSampleDataIntoTable@ucCh13Length:
       ds      1

psect	dataBANK0,class=BANK0,space=1
global __pdataBANK0
__pdataBANK0:
	file	"D:\develop\190625\AK7030-OTP\common.c"
	line	24
_sampleChannelSelect:
       ds      1

psect	dataBANK0
	file	"D:\develop\190625\AK7030-OTP\common.c"
	line	220
vPutSampleDataIntoTable@uiInitWidth:
       ds      1

psect	bssBANK1,class=BANK1,space=1
global __pbssBANK1
__pbssBANK1:
_uiSampleCh13:
       ds      24

psect	bssBANK3,class=BANK3,space=1
global __pbssBANK3
__pbssBANK3:
_uiSampleCh12:
       ds      60

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
	movlw	low((__pbssBANK0)+01Fh)
	fcall	clear_ram
; Clear objects allocated to BANK1
psect cinit,class=CODE,delta=2
	movlw	low(__pbssBANK1)
	movwf	fsr
	movlw	low((__pbssBANK1)+018h)
	fcall	clear_ram
; Clear objects allocated to BANK3
psect cinit,class=CODE,delta=2
	bsf	status, 7	;select IRP bank2
	movlw	low(__pbssBANK3)
	movwf	fsr
	movlw	low((__pbssBANK3)+03Ch)
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
	global	?_clrSampeTime
?_clrSampeTime:	; 0 bytes @ 0x0
	global	?_clearTwentyMinTimer
?_clearTwentyMinTimer:	; 0 bytes @ 0x0
	global	?_disable_AD_interrupt
?_disable_AD_interrupt:	; 0 bytes @ 0x0
	global	??_disable_AD_interrupt
??_disable_AD_interrupt:	; 0 bytes @ 0x0
	global	?_switchSampleChannel
?_switchSampleChannel:	; 0 bytes @ 0x0
	global	?_enable_AD_interrupt
?_enable_AD_interrupt:	; 0 bytes @ 0x0
	global	??_enable_AD_interrupt
??_enable_AD_interrupt:	; 0 bytes @ 0x0
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
	global	??_setAD_ConvertFlag
??_setAD_ConvertFlag:	; 0 bytes @ 0x0
	global	?_ISR
?_ISR:	; 0 bytes @ 0x0
	global	?i1_adc_test_init
?i1_adc_test_init:	; 0 bytes @ 0x0
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
	global	?_adc_get
?_adc_get:	; 2 bytes @ 0x0
	global	?_main
?_main:	; 2 bytes @ 0x0
	global	?_FilterCh12
?_FilterCh12:	; 2 bytes @ 0x0
	global	setPWM_Width@ucWidth
setPWM_Width@ucWidth:	; 1 bytes @ 0x0
	global	setAD_ConvertFlag@flag
setAD_ConvertFlag@flag:	; 1 bytes @ 0x0
	global	i1adc_test_init@ref
i1adc_test_init@ref:	; 1 bytes @ 0x0
	ds	1
	global	??i1_adc_test_init
??i1_adc_test_init:	; 0 bytes @ 0x1
	ds	1
	global	??_adc_get
??_adc_get:	; 0 bytes @ 0x2
	global	??_FilterCh12
??_FilterCh12:	; 0 bytes @ 0x2
	global	i1adc_test_init@channel
i1adc_test_init@channel:	; 1 bytes @ 0x2
	global	adc_get@val
adc_get@val:	; 2 bytes @ 0x2
	ds	1
	global	??_switchSampleChannel
??_switchSampleChannel:	; 0 bytes @ 0x3
	global	switchSampleChannel@ucCurrentChannel
switchSampleChannel@ucCurrentChannel:	; 1 bytes @ 0x3
	ds	4
	global	FilterCh12@filter_temp
FilterCh12@filter_temp:	; 2 bytes @ 0x7
	ds	2
	global	FilterCh12@filter_sum
FilterCh12@filter_sum:	; 2 bytes @ 0x9
	ds	2
	global	FilterCh12@j
FilterCh12@j:	; 1 bytes @ 0xB
	ds	1
	global	FilterCh12@i
FilterCh12@i:	; 1 bytes @ 0xC
	ds	1
	global	??_vPutSampleDataIntoTable
??_vPutSampleDataIntoTable:	; 0 bytes @ 0xD
psect	cstackBANK0,class=BANK0,space=1
global __pcstackBANK0
__pcstackBANK0:
	global	?_vPutSampleDataIntoTable
?_vPutSampleDataIntoTable:	; 0 bytes @ 0x0
	global	vPutSampleDataIntoTable@uiSampleData
vPutSampleDataIntoTable@uiSampleData:	; 2 bytes @ 0x0
	ds	2
	global	vPutSampleDataIntoTable@channel
vPutSampleDataIntoTable@channel:	; 1 bytes @ 0x2
	ds	1
	global	vPutSampleDataIntoTable@uiCalWidth
vPutSampleDataIntoTable@uiCalWidth:	; 2 bytes @ 0x3
	ds	2
	global	vPutSampleDataIntoTable@i
vPutSampleDataIntoTable@i:	; 2 bytes @ 0x5
	ds	2
	global	??_ISR
??_ISR:	; 0 bytes @ 0x7
	ds	4
	global	??_clearTwelveHoursTimer
??_clearTwelveHoursTimer:	; 0 bytes @ 0xB
	global	??_clearThreeHoursTimer
??_clearThreeHoursTimer:	; 0 bytes @ 0xB
	global	??_clock_config
??_clock_config:	; 0 bytes @ 0xB
	global	??_timer1_config
??_timer1_config:	; 0 bytes @ 0xB
	global	??_timer1_interrupt_config
??_timer1_interrupt_config:	; 0 bytes @ 0xB
	global	?_adc_test_init
?_adc_test_init:	; 0 bytes @ 0xB
	global	?_startTwentyMinTimer
?_startTwentyMinTimer:	; 0 bytes @ 0xB
	global	??_adc_start
??_adc_start:	; 0 bytes @ 0xB
	global	??_isPermitSampleTime
??_isPermitSampleTime:	; 0 bytes @ 0xB
	global	??_clrSampeTime
??_clrSampeTime:	; 0 bytes @ 0xB
	global	??_isFinishedTwentyMinTimer
??_isFinishedTwentyMinTimer:	; 0 bytes @ 0xB
	global	??_clearTwentyMinTimer
??_clearTwentyMinTimer:	; 0 bytes @ 0xB
	global	?_startTwelveHourTimer
?_startTwelveHourTimer:	; 0 bytes @ 0xB
	global	??_isFinishedTwelveHoursTimer
??_isFinishedTwelveHoursTimer:	; 0 bytes @ 0xB
	global	?_startThreeHoursTimer
?_startThreeHoursTimer:	; 0 bytes @ 0xB
	global	??_isFinishedThreeHoursTimer
??_isFinishedThreeHoursTimer:	; 0 bytes @ 0xB
	global	?_startOneHoursTimer
?_startOneHoursTimer:	; 0 bytes @ 0xB
	global	??_isFinishedOneHoursTimer
??_isFinishedOneHoursTimer:	; 0 bytes @ 0xB
	global	??_initPB3
??_initPB3:	; 0 bytes @ 0xB
	global	??_setPB3
??_setPB3:	; 0 bytes @ 0xB
	global	??_initPB4
??_initPB4:	; 0 bytes @ 0xB
	global	??_setPB4
??_setPB4:	; 0 bytes @ 0xB
	global	??_initPB5
??_initPB5:	; 0 bytes @ 0xB
	global	??_setPB5
??_setPB5:	; 0 bytes @ 0xB
	global	??_initPB2_AsHighResistence
??_initPB2_AsHighResistence:	; 0 bytes @ 0xB
	global	?_pwm_start
?_pwm_start:	; 0 bytes @ 0xB
	global	??_selectAdChannel
??_selectAdChannel:	; 0 bytes @ 0xB
	global	??_reset
??_reset:	; 0 bytes @ 0xB
	global	?_FilterCh13
?_FilterCh13:	; 2 bytes @ 0xB
	global	initPB3@bValue
initPB3@bValue:	; 1 bytes @ 0xB
	global	setPB3@bValue
setPB3@bValue:	; 1 bytes @ 0xB
	global	initPB4@bValue
initPB4@bValue:	; 1 bytes @ 0xB
	global	setPB4@bValue
setPB4@bValue:	; 1 bytes @ 0xB
	global	initPB5@bValue
initPB5@bValue:	; 1 bytes @ 0xB
	global	setPB5@bValue
setPB5@bValue:	; 1 bytes @ 0xB
	global	pwm_start@ucPulseFrequency
pwm_start@ucPulseFrequency:	; 1 bytes @ 0xB
	global	adc_test_init@ref
adc_test_init@ref:	; 1 bytes @ 0xB
	global	startTwelveHourTimer@uiSetTime
startTwelveHourTimer@uiSetTime:	; 2 bytes @ 0xB
	global	startThreeHoursTimer@uiSetTime
startThreeHoursTimer@uiSetTime:	; 2 bytes @ 0xB
	global	startOneHoursTimer@uiSetTime
startOneHoursTimer@uiSetTime:	; 2 bytes @ 0xB
	global	startTwentyMinTimer@uiSetValue
startTwentyMinTimer@uiSetValue:	; 2 bytes @ 0xB
	ds	1
	global	??_adc_test_init
??_adc_test_init:	; 0 bytes @ 0xC
	global	??_pwm_start
??_pwm_start:	; 0 bytes @ 0xC
	global	??_initPin
??_initPin:	; 0 bytes @ 0xC
	global	??_setPinInitVaule
??_setPinInitVaule:	; 0 bytes @ 0xC
	global	pwm_start@ucPulseWidth
pwm_start@ucPulseWidth:	; 1 bytes @ 0xC
	ds	1
	global	??_startTwentyMinTimer
??_startTwentyMinTimer:	; 0 bytes @ 0xD
	global	??_startTwelveHourTimer
??_startTwelveHourTimer:	; 0 bytes @ 0xD
	global	??_startThreeHoursTimer
??_startThreeHoursTimer:	; 0 bytes @ 0xD
	global	??_startOneHoursTimer
??_startOneHoursTimer:	; 0 bytes @ 0xD
	global	??_FilterCh13
??_FilterCh13:	; 0 bytes @ 0xD
	global	adc_test_init@channel
adc_test_init@channel:	; 1 bytes @ 0xD
	ds	5
	global	FilterCh13@filter_temp
FilterCh13@filter_temp:	; 2 bytes @ 0x12
	ds	2
	global	FilterCh13@filter_sum
FilterCh13@filter_sum:	; 2 bytes @ 0x14
	ds	2
	global	FilterCh13@j
FilterCh13@j:	; 1 bytes @ 0x16
	ds	1
	global	FilterCh13@i
FilterCh13@i:	; 1 bytes @ 0x17
	ds	1
	global	?_getAdOriginalCh13Value
?_getAdOriginalCh13Value:	; 2 bytes @ 0x18
	ds	2
	global	??_getAdOriginalCh13Value
??_getAdOriginalCh13Value:	; 0 bytes @ 0x1A
	global	??_main
??_main:	; 0 bytes @ 0x1A
	ds	1
	global	main@ucChValue
main@ucChValue:	; 2 bytes @ 0x1B
	ds	2
	global	main@uiCh13Value
main@uiCh13Value:	; 2 bytes @ 0x1D
	ds	2
;;Data sizes: Strings 0, constant 0, data 2, bss 116, persistent 0 stack 0
;;Auto spaces:   Size  Autos    Used
;; COMMON          14     13      14
;; BANK0           80     31      64
;; BANK1           80      0      24
;; BANK3           96      0      60
;; BANK2           96      0       0

;;
;; Pointer list with targets:

;; ?_adc_get	unsigned int  size(1) Largest target is 0
;;
;; ?_getAdOriginalCh13Value	unsigned int  size(1) Largest target is 0
;;
;; ?_FilterCh12	unsigned int  size(1) Largest target is 0
;;
;; ?_FilterCh13	unsigned int  size(1) Largest target is 0
;;


;;
;; Critical Paths under _main in COMMON
;;
;;   None.
;;
;; Critical Paths under _ISR in COMMON
;;
;;   _vPutSampleDataIntoTable->_FilterCh12
;;   _switchSampleChannel->i1_adc_test_init
;;
;; Critical Paths under _main in BANK0
;;
;;   _main->_getAdOriginalCh13Value
;;   _getAdOriginalCh13Value->_FilterCh13
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
;;Main: autosize = 0, tempsize = 1, incstack = 0, save=0
;;

;;
;;Call Graph Tables:
;;
;; ---------------------------------------------------------------------------------
;; (Depth) Function   	        Calls       Base Space   Used Autos Params    Refs
;; ---------------------------------------------------------------------------------
;; (0) _main                                                 5     5      0     806
;;                                             26 BANK0      5     5      0
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
;; (1) _getAdOriginalCh13Value                               2     0      2     342
;;                                             24 BANK0      2     0      2
;;                         _FilterCh13
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
;; (2) _FilterCh13                                          13    11      2     342
;;                                             11 BANK0     13    11      2
;; ---------------------------------------------------------------------------------
;; (1) _isFinishedOneHoursTimer                              0     0      0       0
;; ---------------------------------------------------------------------------------
;; (1) _startOneHoursTimer                                   2     0      2      22
;;                                             11 BANK0      2     0      2
;; ---------------------------------------------------------------------------------
;; (1) _isFinishedThreeHoursTimer                            0     0      0       0
;; ---------------------------------------------------------------------------------
;; (1) _startThreeHoursTimer                                 2     0      2      22
;;                                             11 BANK0      2     0      2
;; ---------------------------------------------------------------------------------
;; (1) _isFinishedTwelveHoursTimer                           0     0      0       0
;; ---------------------------------------------------------------------------------
;; (1) _startTwelveHourTimer                                 2     0      2      22
;;                                             11 BANK0      2     0      2
;; ---------------------------------------------------------------------------------
;; (1) _clearTwentyMinTimer                                  0     0      0       0
;; ---------------------------------------------------------------------------------
;; (1) _isFinishedTwentyMinTimer                             0     0      0       0
;; ---------------------------------------------------------------------------------
;; (1) _clrSampeTime                                         0     0      0       0
;; ---------------------------------------------------------------------------------
;; (1) _isPermitSampleTime                                   0     0      0       0
;; ---------------------------------------------------------------------------------
;; (1) _adc_start                                            0     0      0       0
;; ---------------------------------------------------------------------------------
;; (1) _startTwentyMinTimer                                  2     0      2      22
;;                                             11 BANK0      2     0      2
;; ---------------------------------------------------------------------------------
;; (1) _adc_test_init                                        3     2      1      44
;;                                             11 BANK0      3     2      1
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
;; (1) _pwm_start                                            2     1      1      44
;;                                             11 BANK0      2     1      1
;; ---------------------------------------------------------------------------------
;; (2) _initPB2_AsHighResistence                             0     0      0       0
;; ---------------------------------------------------------------------------------
;; (1) _setPB5                                               1     1      0      22
;;                                             11 BANK0      1     1      0
;; ---------------------------------------------------------------------------------
;; (2) _initPB5                                              1     1      0      22
;;                                             11 BANK0      1     1      0
;; ---------------------------------------------------------------------------------
;; (1) _setPB4                                               1     1      0      22
;;                                             11 BANK0      1     1      0
;; ---------------------------------------------------------------------------------
;; (2) _initPB4                                              1     1      0      22
;;                                             11 BANK0      1     1      0
;; ---------------------------------------------------------------------------------
;; (1) _setPB3                                               1     1      0      22
;;                                             11 BANK0      1     1      0
;; ---------------------------------------------------------------------------------
;; (2) _initPB3                                              1     1      0      22
;;                                             11 BANK0      1     1      0
;; ---------------------------------------------------------------------------------
;; (1) _clearThreeHoursTimer                                 0     0      0       0
;; ---------------------------------------------------------------------------------
;; (1) _clearTwelveHoursTimer                                0     0      0       0
;; ---------------------------------------------------------------------------------
;; Estimated maximum stack depth 2
;; ---------------------------------------------------------------------------------
;; (Depth) Function   	        Calls       Base Space   Used Autos Params    Refs
;; ---------------------------------------------------------------------------------
;; (3) _ISR                                                  4     4      0     835
;;                                              7 BANK0      4     4      0
;;                  _setAD_ConvertFlag
;;                            _adc_get
;;            _vPutSampleDataIntoTable
;; ---------------------------------------------------------------------------------
;; (4) _vPutSampleDataIntoTable                              7     4      3     800
;;                                              0 BANK0      7     4      3
;;               _disable_AD_interrupt
;;                         _FilterCh12
;;                       _setPWM_Width
;;                _switchSampleChannel
;;                _enable_AD_interrupt
;;                            _adc_get (ARG)
;; ---------------------------------------------------------------------------------
;; (5) _switchSampleChannel                                  1     1      0     168
;;                                              3 COMMON     1     1      0
;;                    i1_adc_test_init
;; ---------------------------------------------------------------------------------
;; (6) i1_adc_test_init                                      3     2      1     146
;;                                              0 COMMON     3     2      1
;; ---------------------------------------------------------------------------------
;; (4) _adc_get                                              4     2      2      24
;;                                              0 COMMON     4     2      2
;; ---------------------------------------------------------------------------------
;; (4) _setAD_ConvertFlag                                    1     1      0      11
;;                                              0 COMMON     1     1      0
;; ---------------------------------------------------------------------------------
;; (5) _enable_AD_interrupt                                  0     0      0       0
;; ---------------------------------------------------------------------------------
;; (5) _disable_AD_interrupt                                 0     0      0       0
;; ---------------------------------------------------------------------------------
;; (5) _FilterCh12                                          13    11      2     342
;;                                              0 COMMON    13    11      2
;; ---------------------------------------------------------------------------------
;; (5) _setPWM_Width                                         1     1      0      66
;;                                              0 COMMON     1     1      0
;; ---------------------------------------------------------------------------------
;; Estimated maximum stack depth 6
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
;;   _setAD_ConvertFlag
;;   _adc_get
;;   _vPutSampleDataIntoTable
;;     _disable_AD_interrupt
;;     _FilterCh12
;;     _setPWM_Width
;;     _switchSampleChannel
;;       i1_adc_test_init
;;     _enable_AD_interrupt
;;     _adc_get (ARG)
;;

;; Address spaces:

;;Name               Size   Autos  Total    Cost      Usage
;;BANK3               60      0      3C      10       62.5%
;;BITBANK3            60      0       0       9        0.0%
;;SFR3                 0      0       0       4        0.0%
;;BITSFR3              0      0       0       4        0.0%
;;BANK2               60      0       0      12        0.0%
;;BITBANK2            60      0       0      11        0.0%
;;SFR2                 0      0       0       5        0.0%
;;BITSFR2              0      0       0       5        0.0%
;;SFR1                 0      0       0       2        0.0%
;;BITSFR1              0      0       0       2        0.0%
;;BANK1               50      0      18       8       30.0%
;;BITBANK1            50      0       0       7        0.0%
;;CODE                 0      0       0       0        0.0%
;;DATA                 0      0      AC       6        0.0%
;;ABS                  0      0      A2       3        0.0%
;;NULL                 0      0       0       0        0.0%
;;STACK                0      0       A       2        0.0%
;;BANK0               50     1F      40       5       80.0%
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
;;		line 593 in file "D:\develop\190625\AK7030-OTP\main.c"
;; Parameters:    Size  Location     Type
;;		None
;; Auto vars:     Size  Location     Type
;;  ucChValue       2   27[BANK0 ] unsigned int 
;;  uiCh13Value     2   29[BANK0 ] unsigned int 
;; Return value:  Size  Location     Type
;;                  2  728[COMMON] int 
;; Registers used:
;;		wreg, fsr0l, fsr0h, status,2, status,0, pclath, cstack
;; Tracked objects:
;;		On entry : 17F/0
;;		On exit  : 60/0
;;		Unchanged: 0/0
;; Data sizes:     COMMON   BANK0   BANK1   BANK3   BANK2
;;      Params:         0       0       0       0       0
;;      Locals:         0       4       0       0       0
;;      Temps:          0       1       0       0       0
;;      Totals:         0       5       0       0       0
;;Total ram usage:        5 bytes
;; Hardware stack levels required when called:    6
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
	opt	stack 2
; Regs used in _main: [wreg-fsr0h+status,2+status,0+pclath+cstack]
	line	621
	
l3646:	
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
	
l3648:	
;main.c: 623: selectAdChannel();
	fcall	_selectAdChannel
	line	625
	
l3650:	
;main.c: 625: clock_config();
	fcall	_clock_config
	line	626
	
l3652:	
;main.c: 626: timer1_config();
	fcall	_timer1_config
	line	627
	
l3654:	
;main.c: 627: timer1_interrupt_config();
	fcall	_timer1_interrupt_config
	line	629
;main.c: 629: adc_test_init(12,3);
	movlw	(03h)
	bcf	status, 5	;RP0=0, select bank0
	movwf	(?_adc_test_init)
	movlw	(0Ch)
	fcall	_adc_test_init
	line	641
;main.c: 641: startTwentyMinTimer( 60 );
	movlw	03Ch
	bcf	status, 5	;RP0=0, select bank0
	movwf	(?_startTwentyMinTimer)
	clrf	(?_startTwentyMinTimer+1)
	fcall	_startTwentyMinTimer
	line	642
;main.c: 642: pwm_start(75,249);
	movlw	(0F9h)
	movwf	(?_pwm_start)
	movlw	(04Bh)
	fcall	_pwm_start
	line	643
	
l3656:	
;main.c: 643: _delay(1000);
	opt asmopt_off
movlw	249
movwf	(??_main+0)+0,f
u1537:
	clrwdt
decfsz	(??_main+0)+0,f
	goto	u1537
	nop2	;nop
	clrwdt
opt asmopt_on

	line	644
;main.c: 644: adc_start();
	fcall	_adc_start
	line	648
	
l3658:	
# 648 "D:\develop\190625\AK7030-OTP\main.c"
 clrwdt ;#
psect	maintext
	line	655
	
l3660:	
;main.c: 655: if( isPermitSampleTime() )
	fcall	_isPermitSampleTime
	xorlw	0
	skipnz
	goto	u1311
	goto	u1310
u1311:
	goto	l3658
u1310:
	line	659
	
l3662:	
;main.c: 656: {
;main.c: 659: clrSampeTime();
	fcall	_clrSampeTime
	line	668
;main.c: 668: switch(ucStep)
	goto	l3816
	line	679
	
l3664:	
;main.c: 672: {
;main.c: 677: static unsigned char ucTimerP3s = 0;
;main.c: 679: if( isFinishedTwentyMinTimer() )
	fcall	_isFinishedTwentyMinTimer
	xorlw	0
	skipnz
	goto	u1321
	goto	u1320
u1321:
	goto	l3670
u1320:
	line	681
	
l3666:	
;main.c: 680: {
;main.c: 681: ucStep = READY_FOR_RESET_STEP;
	movlw	(063h)
	movwf	(main@ucStep)
	line	682
	
l3668:	
;main.c: 682: ucTimerP3s = 0;
	clrf	(main@ucTimerP3s)
	line	683
;main.c: 683: }
	goto	l3658
	line	686
	
l3670:	
;main.c: 684: else
;main.c: 685: {
;main.c: 686: if( getAdOriginalCh13Value() > 90 )
	fcall	_getAdOriginalCh13Value
	movlw	high(05Bh)
	subwf	(1+(?_getAdOriginalCh13Value)),w
	movlw	low(05Bh)
	skipnz
	subwf	(0+(?_getAdOriginalCh13Value)),w
	skipc
	goto	u1331
	goto	u1330
u1331:
	goto	l3674
u1330:
	line	688
	
l3672:	
;main.c: 687: {
;main.c: 688: ucTimerP3s++;
	incf	(main@ucTimerP3s),f
	line	689
;main.c: 689: }
	goto	l3676
	line	691
	
l3674:	
;main.c: 690: else
;main.c: 691: ucTimerP3s = 0;
	clrf	(main@ucTimerP3s)
	line	693
	
l3676:	
;main.c: 693: if( ucTimerP3s >= 3)
	movlw	(03h)
	subwf	(main@ucTimerP3s),w
	skipc
	goto	u1341
	goto	u1340
u1341:
	goto	l738
u1340:
	line	695
	
l3678:	
;main.c: 694: {
;main.c: 695: ucTimerP3s = 0;
	clrf	(main@ucTimerP3s)
	line	696
	
l3680:	
;main.c: 696: ucStep = START_UP_PWM_STEP;
	clrf	(main@ucStep)
	incf	(main@ucStep),f
	goto	l3658
	line	699
	
l738:	
	line	703
;main.c: 697: }
;main.c: 699: }
;main.c: 703: break;
	goto	l3658
	line	717
	
l3682:	
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
	
l3684:	
;main.c: 720: clearTwentyMinTimer();
	fcall	_clearTwentyMinTimer
	line	721
	
l3686:	
;main.c: 721: startTwelveHourTimer( 240);
	movlw	0F0h
	movwf	(?_startTwelveHourTimer)
	clrf	(?_startTwelveHourTimer+1)
	fcall	_startTwelveHourTimer
	line	722
	
l3688:	
;main.c: 722: ucStep = CHECK_10_HOUR_TIMER_STEP;
	movlw	(02h)
	movwf	(main@ucStep)
	line	723
;main.c: 723: break;
	goto	l3658
	line	734
	
l3690:	
;main.c: 727: {
;main.c: 732: static unsigned char ucTimerP5s = 0;
;main.c: 734: if( isFinishedTwelveHoursTimer () )
	fcall	_isFinishedTwelveHoursTimer
	xorlw	0
	skipnz
	goto	u1351
	goto	u1350
u1351:
	goto	l3694
u1350:
	line	735
	
l3692:	
;main.c: 735: ucStep = READY_FOR_RESET_STEP;
	movlw	(063h)
	movwf	(main@ucStep)
	goto	l3658
	line	738
	
l3694:	
;main.c: 736: else
;main.c: 737: {
;main.c: 738: if( getAdOriginalCh13Value() < 200 )
	fcall	_getAdOriginalCh13Value
	movlw	high(0C8h)
	subwf	(1+(?_getAdOriginalCh13Value)),w
	movlw	low(0C8h)
	skipnz
	subwf	(0+(?_getAdOriginalCh13Value)),w
	skipnc
	goto	u1361
	goto	u1360
u1361:
	goto	l3698
u1360:
	line	739
	
l3696:	
;main.c: 739: ucTimerP5s++;
	incf	(main@ucTimerP5s),f
	goto	l3700
	line	741
	
l3698:	
;main.c: 740: else
;main.c: 741: ucTimerP5s = 0;
	clrf	(main@ucTimerP5s)
	line	743
	
l3700:	
;main.c: 743: if( ucTimerP5s > 5)
	movlw	(06h)
	subwf	(main@ucTimerP5s),w
	skipc
	goto	u1371
	goto	u1370
u1371:
	goto	l738
u1370:
	line	745
	
l3702:	
;main.c: 744: {
;main.c: 745: ucTimerP5s = 0;
	clrf	(main@ucTimerP5s)
	line	746
	
l3704:	
;main.c: 746: ucStep = STARTUP_3_HOUR_TIMER_STEP;
	movlw	(03h)
	movwf	(main@ucStep)
	goto	l3658
	line	755
	
l3706:	
;main.c: 754: {
;main.c: 755: clearTwelveHoursTimer();
	fcall	_clearTwelveHoursTimer
	line	756
	
l3708:	
;main.c: 756: startThreeHoursTimer(180);
	movlw	0B4h
	movwf	(?_startThreeHoursTimer)
	clrf	(?_startThreeHoursTimer+1)
	fcall	_startThreeHoursTimer
	line	757
;main.c: 757: ucStep = CHECK_3_HOUR_TIMER_STEP;
	movlw	(04h)
	movwf	(main@ucStep)
	line	758
;main.c: 758: break;
	goto	l3658
	line	765
	
l3710:	
;main.c: 762: {
;main.c: 763: static unsigned char ucTimerP5s = 0;
;main.c: 765: if( isFinishedThreeHoursTimer() )
	fcall	_isFinishedThreeHoursTimer
	xorlw	0
	skipnz
	goto	u1381
	goto	u1380
u1381:
	goto	l3714
u1380:
	goto	l3692
	line	769
	
l3714:	
;main.c: 767: else
;main.c: 768: {
;main.c: 769: if( getAdOriginalCh13Value() < 85 )
	fcall	_getAdOriginalCh13Value
	movlw	high(055h)
	subwf	(1+(?_getAdOriginalCh13Value)),w
	movlw	low(055h)
	skipnz
	subwf	(0+(?_getAdOriginalCh13Value)),w
	skipnc
	goto	u1391
	goto	u1390
u1391:
	goto	l3718
u1390:
	line	770
	
l3716:	
;main.c: 770: ucTimerP5s++;
	incf	(main@cTimerP5s_777),f
	goto	l3720
	line	772
	
l3718:	
;main.c: 771: else
;main.c: 772: ucTimerP5s = 0;
	clrf	(main@cTimerP5s_777)
	line	774
	
l3720:	
;main.c: 774: if( ucTimerP5s > 5)
	movlw	(06h)
	subwf	(main@cTimerP5s_777),w
	skipc
	goto	u1401
	goto	u1400
u1401:
	goto	l738
u1400:
	line	776
	
l3722:	
;main.c: 775: {
;main.c: 776: ucTimerP5s = 0;
	clrf	(main@cTimerP5s_777)
	line	777
	
l3724:	
;main.c: 777: ucStep = STARTUP_1_HOUR_TIMER_STEP;
	movlw	(05h)
	movwf	(main@ucStep)
	goto	l3658
	line	785
	
l3726:	
;main.c: 784: {
;main.c: 785: clearThreeHoursTimer();
	fcall	_clearThreeHoursTimer
	line	786
	
l3728:	
;main.c: 786: startOneHoursTimer( 120 );
	movlw	078h
	movwf	(?_startOneHoursTimer)
	clrf	(?_startOneHoursTimer+1)
	fcall	_startOneHoursTimer
	line	787
	
l3730:	
;main.c: 787: setPB3(1);
	movlw	(01h)
	fcall	_setPB3
	line	788
	
l3732:	
;main.c: 788: setPB4(0);
	movlw	(0)
	fcall	_setPB4
	line	789
	
l3734:	
;main.c: 789: setPB5(1);
	movlw	(01h)
	fcall	_setPB5
	line	790
	
l3736:	
;main.c: 790: ucStep = CHECK_1_HOUR_TIMER_STEP;
	movlw	(06h)
	movwf	(main@ucStep)
	line	791
;main.c: 791: break;
	goto	l3658
	line	804
	
l3738:	
;main.c: 795: {
;main.c: 800: static unsigned int uiTimerOneP5s = 0;
;main.c: 801: static unsigned int uiTimerTwoP5s = 0;
;main.c: 802: static unsigned int uiTimerThreeP5s = 0;
;main.c: 804: unsigned int uiCh13Value = getAdOriginalCh13Value();
	fcall	_getAdOriginalCh13Value
	movf	(1+(?_getAdOriginalCh13Value)),w
	movwf	(main@uiCh13Value+1)
	movf	(0+(?_getAdOriginalCh13Value)),w
	movwf	(main@uiCh13Value)
	line	807
	
l3740:	
;main.c: 807: if( isFinishedOneHoursTimer() )
	fcall	_isFinishedOneHoursTimer
	xorlw	0
	skipnz
	goto	u1411
	goto	u1410
u1411:
	goto	l3744
u1410:
	goto	l3692
	line	811
	
l3744:	
;main.c: 809: else
;main.c: 810: {
;main.c: 811: if( uiCh13Value > 100 )
	movlw	high(065h)
	subwf	(main@uiCh13Value+1),w
	movlw	low(065h)
	skipnz
	subwf	(main@uiCh13Value),w
	skipc
	goto	u1421
	goto	u1420
u1421:
	goto	l3754
u1420:
	line	813
	
l3746:	
;main.c: 812: {
;main.c: 813: if( uiTimerOneP5s <= 5 )
	movlw	high(06h)
	subwf	(main@uiTimerOneP5s+1),w
	movlw	low(06h)
	skipnz
	subwf	(main@uiTimerOneP5s),w
	skipnc
	goto	u1431
	goto	u1430
u1431:
	goto	l3750
u1430:
	line	814
	
l3748:	
;main.c: 814: uiTimerOneP5s++;
	incf	(main@uiTimerOneP5s),f
	skipnz
	incf	(main@uiTimerOneP5s+1),f
	line	815
	
l3750:	
;main.c: 815: uiTimerTwoP5s = 0;
	clrf	(main@uiTimerTwoP5s)
	clrf	(main@uiTimerTwoP5s+1)
	line	816
	
l3752:	
;main.c: 816: uiTimerThreeP5s = 0;
	clrf	(main@uiTimerThreeP5s)
	clrf	(main@uiTimerThreeP5s+1)
	line	817
;main.c: 817: }
	goto	l3756
	line	820
	
l3754:	
;main.c: 818: else
;main.c: 819: {
;main.c: 820: uiTimerOneP5s = 0;
	clrf	(main@uiTimerOneP5s)
	clrf	(main@uiTimerOneP5s+1)
	line	824
	
l3756:	
;main.c: 821: }
;main.c: 824: if(uiTimerOneP5s > 5)
	movlw	high(06h)
	subwf	(main@uiTimerOneP5s+1),w
	movlw	low(06h)
	skipnz
	subwf	(main@uiTimerOneP5s),w
	skipc
	goto	u1441
	goto	u1440
u1441:
	goto	l3764
u1440:
	line	826
	
l3758:	
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
	
l3760:	
;main.c: 830: uiTimerOneP5s = 0;
	clrf	(main@uiTimerOneP5s)
	clrf	(main@uiTimerOneP5s+1)
	line	831
	
l3762:	
;main.c: 831: uiTimerTwoP5s = 0;
	clrf	(main@uiTimerTwoP5s)
	clrf	(main@uiTimerTwoP5s+1)
	line	832
;main.c: 832: }
	goto	l3658
	line	835
	
l3764:	
;main.c: 833: else
;main.c: 834: {
;main.c: 835: if( uiCh13Value < 90 )
	movlw	high(05Ah)
	subwf	(main@uiCh13Value+1),w
	movlw	low(05Ah)
	skipnz
	subwf	(main@uiCh13Value),w
	skipnc
	goto	u1451
	goto	u1450
u1451:
	goto	l3770
u1450:
	line	837
	
l3766:	
;main.c: 836: {
;main.c: 837: if( uiTimerTwoP5s <= 5)
	movlw	high(06h)
	subwf	(main@uiTimerTwoP5s+1),w
	movlw	low(06h)
	skipnz
	subwf	(main@uiTimerTwoP5s),w
	skipnc
	goto	u1461
	goto	u1460
u1461:
	goto	l3772
u1460:
	line	838
	
l3768:	
;main.c: 838: uiTimerTwoP5s++;
	incf	(main@uiTimerTwoP5s),f
	skipnz
	incf	(main@uiTimerTwoP5s+1),f
	goto	l3772
	line	842
	
l3770:	
;main.c: 840: else
;main.c: 841: {
;main.c: 842: uiTimerTwoP5s = 0;
	clrf	(main@uiTimerTwoP5s)
	clrf	(main@uiTimerTwoP5s+1)
	line	843
;main.c: 843: uiTimerThreeP5s = 0;
	clrf	(main@uiTimerThreeP5s)
	clrf	(main@uiTimerThreeP5s+1)
	line	846
	
l3772:	
;main.c: 844: }
;main.c: 846: if(uiTimerTwoP5s > 5)
	movlw	high(06h)
	subwf	(main@uiTimerTwoP5s+1),w
	movlw	low(06h)
	skipnz
	subwf	(main@uiTimerTwoP5s),w
	skipc
	goto	u1471
	goto	u1470
u1471:
	goto	l3658
u1470:
	line	848
	
l3774:	
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
	
l3776:	
;main.c: 852: if(uiCh13Value < 25)
	movlw	high(019h)
	subwf	(main@uiCh13Value+1),w
	movlw	low(019h)
	skipnz
	subwf	(main@uiCh13Value),w
	skipnc
	goto	u1481
	goto	u1480
u1481:
	goto	l3780
u1480:
	line	853
	
l3778:	
;main.c: 853: uiTimerThreeP5s++;
	incf	(main@uiTimerThreeP5s),f
	skipnz
	incf	(main@uiTimerThreeP5s+1),f
	goto	l3782
	line	855
	
l3780:	
;main.c: 854: else
;main.c: 855: uiTimerThreeP5s = 0;
	clrf	(main@uiTimerThreeP5s)
	clrf	(main@uiTimerThreeP5s+1)
	line	857
	
l3782:	
;main.c: 857: if(uiTimerThreeP5s > 5)
	movlw	high(06h)
	subwf	(main@uiTimerThreeP5s+1),w
	movlw	low(06h)
	skipnz
	subwf	(main@uiTimerThreeP5s),w
	skipc
	goto	u1491
	goto	u1490
u1491:
	goto	l738
u1490:
	line	858
	
l3784:	
;main.c: 858: reset();
	fcall	_reset
	goto	l3658
	line	868
	
l3786:	
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
	
l3788:	
;main.c: 874: ucStep = DELAY_ONE_SECOND_FOR_PWM;
	movlw	(064h)
	movwf	(main@ucStep)
	line	875
;main.c: 875: break;
	goto	l3658
	line	881
	
l3790:	
;main.c: 879: {
;main.c: 880: static unsigned ucDelay1s = 0;
;main.c: 881: if(ucDelay1s < 10)
	movlw	high(0Ah)
	subwf	(main@ucDelay1s+1),w
	movlw	low(0Ah)
	skipnz
	subwf	(main@ucDelay1s),w
	skipnc
	goto	u1501
	goto	u1500
u1501:
	goto	l3794
u1500:
	line	882
	
l3792:	
;main.c: 882: ucDelay1s++;
	incf	(main@ucDelay1s),f
	skipnz
	incf	(main@ucDelay1s+1),f
	goto	l3658
	line	885
	
l3794:	
;main.c: 883: else
;main.c: 884: {
;main.c: 885: ucDelay1s = 0;
	clrf	(main@ucDelay1s)
	clrf	(main@ucDelay1s+1)
	line	886
	
l3796:	
;main.c: 886: ucStep = MEET_RESET_CONDITION_STEP;
	movlw	(065h)
	movwf	(main@ucStep)
	goto	l3658
	line	898
	
l3798:	
;main.c: 896: {
;main.c: 897: static unsigned char ucTimerP5s = 0;
;main.c: 898: unsigned int ucChValue = getAdOriginalCh13Value();
	fcall	_getAdOriginalCh13Value
	movf	(1+(?_getAdOriginalCh13Value)),w
	movwf	(main@ucChValue+1)
	movf	(0+(?_getAdOriginalCh13Value)),w
	movwf	(main@ucChValue)
	line	900
	
l3800:	
;main.c: 900: if( ucChValue > 50 )
	movlw	high(033h)
	subwf	(main@ucChValue+1),w
	movlw	low(033h)
	skipnz
	subwf	(main@ucChValue),w
	skipc
	goto	u1511
	goto	u1510
u1511:
	goto	l3804
u1510:
	line	901
	
l3802:	
;main.c: 901: ucTimerP5s++;
	incf	(main@cTimerP5s_783),f
	goto	l3806
	line	903
	
l3804:	
;main.c: 902: else
;main.c: 903: ucTimerP5s = 0;
	clrf	(main@cTimerP5s_783)
	line	905
	
l3806:	
;main.c: 905: if(ucTimerP5s > 5)
	movlw	(06h)
	subwf	(main@cTimerP5s_783),w
	skipc
	goto	u1521
	goto	u1520
u1521:
	goto	l738
u1520:
	line	906
	
l3808:	
;main.c: 906: ucStep = RESET_STEP;
	movlw	(066h)
	movwf	(main@ucStep)
	goto	l3658
	line	912
	
l3810:	
;main.c: 911: {
;main.c: 912: ucStep = INIT_STEP;
	clrf	(main@ucStep)
	goto	l3784
	line	668
	
l3816:	
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
	goto	l3664
	xorlw	1^0	; case 1
	skipnz
	goto	l3682
	xorlw	2^1	; case 2
	skipnz
	goto	l3690
	xorlw	3^2	; case 3
	skipnz
	goto	l3706
	xorlw	4^3	; case 4
	skipnz
	goto	l3710
	xorlw	5^4	; case 5
	skipnz
	goto	l3726
	xorlw	6^5	; case 6
	skipnz
	goto	l3738
	xorlw	99^6	; case 99
	skipnz
	goto	l3786
	xorlw	100^99	; case 100
	skipnz
	goto	l3790
	xorlw	101^100	; case 101
	skipnz
	goto	l3798
	xorlw	102^101	; case 102
	skipnz
	goto	l3810
	goto	l738
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
psect	text833,local,class=CODE,delta=2
global __ptext833
__ptext833:

;; *************** function _getAdOriginalCh13Value *****************
;; Defined at:
;;		line 354 in file "D:\develop\190625\AK7030-OTP\common.c"
;; Parameters:    Size  Location     Type
;;		None
;; Auto vars:     Size  Location     Type
;;		None
;; Return value:  Size  Location     Type
;;                  2   24[BANK0 ] unsigned int 
;; Registers used:
;;		wreg, fsr0l, fsr0h, status,2, status,0, pclath, cstack
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
;; Hardware stack levels required when called:    5
;; This function calls:
;;		_FilterCh13
;; This function is called by:
;;		_main
;; This function uses a non-reentrant model
;;
psect	text833
	file	"D:\develop\190625\AK7030-OTP\common.c"
	line	354
	global	__size_of_getAdOriginalCh13Value
	__size_of_getAdOriginalCh13Value	equ	__end_of_getAdOriginalCh13Value-_getAdOriginalCh13Value
	
_getAdOriginalCh13Value:	
	opt	stack 2
; Regs used in _getAdOriginalCh13Value: [wreg-fsr0h+status,2+status,0+pclath+cstack]
	line	356
	
l3642:	
;common.c: 356: return FilterCh13();
	fcall	_FilterCh13
	movf	(1+(?_FilterCh13)),w
	movwf	(?_getAdOriginalCh13Value+1)
	movf	(0+(?_FilterCh13)),w
	movwf	(?_getAdOriginalCh13Value)
	line	361
	
l1549:	
	return
	opt stack 0
GLOBAL	__end_of_getAdOriginalCh13Value
	__end_of_getAdOriginalCh13Value:
;; =============== function _getAdOriginalCh13Value ends ============

	signat	_getAdOriginalCh13Value,90
	global	_setPinInitVaule
psect	text834,local,class=CODE,delta=2
global __ptext834
__ptext834:

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
;; Hardware stack levels required when called:    5
;; This function calls:
;;		_setPB3
;;		_setPB4
;;		_setPB5
;; This function is called by:
;;		_main
;; This function uses a non-reentrant model
;;
psect	text834
	file	"D:\develop\190625\AK7030-OTP\main.c"
	line	287
	global	__size_of_setPinInitVaule
	__size_of_setPinInitVaule	equ	__end_of_setPinInitVaule-_setPinInitVaule
	
_setPinInitVaule:	
	opt	stack 2
; Regs used in _setPinInitVaule: [wreg+status,2+status,0+pclath+cstack]
	line	289
	
l3640:	
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
	
l717:	
	return
	opt stack 0
GLOBAL	__end_of_setPinInitVaule
	__end_of_setPinInitVaule:
;; =============== function _setPinInitVaule ends ============

	signat	_setPinInitVaule,88
	global	_initPin
psect	text835,local,class=CODE,delta=2
global __ptext835
__ptext835:

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
;; Hardware stack levels required when called:    5
;; This function calls:
;;		_initPB2_AsHighResistence
;;		_initPB3
;;		_initPB4
;;		_initPB5
;; This function is called by:
;;		_main
;; This function uses a non-reentrant model
;;
psect	text835
	file	"D:\develop\190625\AK7030-OTP\main.c"
	line	271
	global	__size_of_initPin
	__size_of_initPin	equ	__end_of_initPin-_initPin
	
_initPin:	
	opt	stack 2
; Regs used in _initPin: [wreg+status,2+status,0+pclath+cstack]
	line	273
	
l3632:	
;main.c: 273: initPB2_AsHighResistence();
	fcall	_initPB2_AsHighResistence
	line	275
	
l3634:	
;main.c: 275: initPB3(0);
	movlw	(0)
	fcall	_initPB3
	line	277
	
l3636:	
;main.c: 277: initPB4(0);
	movlw	(0)
	fcall	_initPB4
	line	279
	
l3638:	
;main.c: 279: initPB5(0);
	movlw	(0)
	fcall	_initPB5
	line	284
	
l714:	
	return
	opt stack 0
GLOBAL	__end_of_initPin
	__end_of_initPin:
;; =============== function _initPin ends ============

	signat	_initPin,88
	global	_FilterCh13
psect	text836,local,class=CODE,delta=2
global __ptext836
__ptext836:

;; *************** function _FilterCh13 *****************
;; Defined at:
;;		line 73 in file "D:\develop\190625\AK7030-OTP\common.c"
;; Parameters:    Size  Location     Type
;;		None
;; Auto vars:     Size  Location     Type
;;  filter_sum      2   20[BANK0 ] unsigned int 
;;  filter_temp     2   18[BANK0 ] unsigned int 
;;  i               1   23[BANK0 ] unsigned char 
;;  j               1   22[BANK0 ] unsigned char 
;; Return value:  Size  Location     Type
;;                  2   11[BANK0 ] unsigned int 
;; Registers used:
;;		wreg, fsr0l, fsr0h, status,2, status,0
;; Tracked objects:
;;		On entry : 60/0
;;		On exit  : 160/0
;;		Unchanged: FFE00/0
;; Data sizes:     COMMON   BANK0   BANK1   BANK3   BANK2
;;      Params:         0       2       0       0       0
;;      Locals:         0       6       0       0       0
;;      Temps:          0       5       0       0       0
;;      Totals:         0      13       0       0       0
;;Total ram usage:       13 bytes
;; Hardware stack levels used:    1
;; Hardware stack levels required when called:    4
;; This function calls:
;;		Nothing
;; This function is called by:
;;		_getAdOriginalCh13Value
;; This function uses a non-reentrant model
;;
psect	text836
	file	"D:\develop\190625\AK7030-OTP\common.c"
	line	73
	global	__size_of_FilterCh13
	__size_of_FilterCh13	equ	__end_of_FilterCh13-_FilterCh13
	
_FilterCh13:	
	opt	stack 2
; Regs used in _FilterCh13: [wreg-fsr0h+status,2+status,0]
	line	88
	
l3440:	
	clrf	(FilterCh13@j)
	line	90
;common.c: 90: unsigned int filter_temp = 0, filter_sum = 0;
	clrf	(FilterCh13@filter_temp)
	clrf	(FilterCh13@filter_temp+1)
	clrf	(FilterCh13@filter_sum)
	clrf	(FilterCh13@filter_sum+1)
	line	94
;common.c: 94: for(j = 0; j < 12 - 1; j++)
	clrf	(FilterCh13@j)
	line	96
	
l3446:	
;common.c: 95: {
;common.c: 96: for(i = 0; i < 12 - 1 - j; i++)
	clrf	(FilterCh13@i)
	goto	l3454
	line	98
	
l3448:	
;common.c: 97: {
;common.c: 98: if(uiSampleCh13[i] > uiSampleCh13[i + 1])
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	clrc
	rlf	(FilterCh13@i),w
	addlw	_uiSampleCh13&0ffh
	movwf	fsr0
	bcf	status, 7	;select IRP bank1
	movf	indf,w
	movwf	(??_FilterCh13+0)+0+0
	incf	fsr0,f
	movf	indf,w
	movwf	(??_FilterCh13+0)+0+1
	clrc
	rlf	(FilterCh13@i),w
	addlw	_uiSampleCh13+02h&0ffh
	movwf	fsr0
	movf	indf,w
	movwf	(??_FilterCh13+2)+0+0
	incf	fsr0,f
	movf	indf,w
	movwf	(??_FilterCh13+2)+0+1
	movf	1+(??_FilterCh13+2)+0,w
	xorlw	80h
	movwf	(??_FilterCh13+4)+0
	movf	1+(??_FilterCh13+0)+0,w
	xorlw	80h
	subwf	(??_FilterCh13+4)+0,w
	skipz
	goto	u1025
	movf	0+(??_FilterCh13+0)+0,w
	subwf	0+(??_FilterCh13+2)+0,w
u1025:

	skipnc
	goto	u1021
	goto	u1020
u1021:
	goto	l3452
u1020:
	line	101
	
l3450:	
;common.c: 99: {
;common.c: 101: filter_temp = uiSampleCh13[i];
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	clrc
	rlf	(FilterCh13@i),w
	addlw	_uiSampleCh13&0ffh
	movwf	fsr0
	bcf	status, 7	;select IRP bank1
	movf	indf,w
	movwf	(FilterCh13@filter_temp)
	incf	fsr0,f
	movf	indf,w
	movwf	(FilterCh13@filter_temp+1)
	line	103
;common.c: 103: uiSampleCh13[i] = uiSampleCh13[i + 1];
	clrc
	rlf	(FilterCh13@i),w
	addlw	_uiSampleCh13+02h&0ffh
	movwf	fsr0
	movf	indf,w
	movwf	(??_FilterCh13+0)+0+0
	incf	fsr0,f
	movf	indf,w
	movwf	(??_FilterCh13+0)+0+1
	clrc
	rlf	(FilterCh13@i),w
	addlw	_uiSampleCh13&0ffh
	movwf	fsr0
	movf	0+(??_FilterCh13+0)+0,w
	movwf	indf
	incf	fsr0,f
	movf	1+(??_FilterCh13+0)+0,w
	movwf	indf
	line	105
;common.c: 105: uiSampleCh13[i + 1] = filter_temp;
	clrc
	rlf	(FilterCh13@i),w
	addlw	_uiSampleCh13+02h&0ffh
	movwf	fsr0
	movf	(FilterCh13@filter_temp),w
	movwf	indf
	incf	fsr0,f
	movf	(FilterCh13@filter_temp+1),w
	movwf	indf
	line	96
	
l3452:	
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	incf	(FilterCh13@i),f
	
l3454:	
	movlw	high(0Bh)
	movwf	(??_FilterCh13+0)+0+1
	movf	(FilterCh13@j),w
	sublw	low(0Bh)
	movwf	(??_FilterCh13+0)+0
	skipc
	decf	(??_FilterCh13+0)+0+1,f
	movf	1+(??_FilterCh13+0)+0,w
	xorlw	80h
	sublw	080h
	skipz
	goto	u1035
	movf	0+(??_FilterCh13+0)+0,w
	subwf	(FilterCh13@i),w
u1035:

	skipc
	goto	u1031
	goto	u1030
u1031:
	goto	l3448
u1030:
	line	94
	
l3456:	
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	incf	(FilterCh13@j),f
	
l3458:	
	movlw	(0Bh)
	subwf	(FilterCh13@j),w
	skipc
	goto	u1041
	goto	u1040
u1041:
	goto	l3446
u1040:
	line	118
	
l3460:	
;common.c: 106: }
;common.c: 107: }
;common.c: 108: }
;common.c: 118: for(i = 2; i < 12 - 2; i++)
	movlw	(02h)
	movwf	(FilterCh13@i)
	line	120
	
l3464:	
;common.c: 119: {
;common.c: 120: filter_sum += uiSampleCh13[i];
	clrc
	rlf	(FilterCh13@i),w
	addlw	_uiSampleCh13&0ffh
	movwf	fsr0
	bcf	status, 7	;select IRP bank1
	movf	indf,w
	movwf	(??_FilterCh13+0)+0+0
	incf	fsr0,f
	movf	indf,w
	movwf	(??_FilterCh13+0)+0+1
	movf	0+(??_FilterCh13+0)+0,w
	addwf	(FilterCh13@filter_sum),f
	skipnc
	incf	(FilterCh13@filter_sum+1),f
	movf	1+(??_FilterCh13+0)+0,w
	addwf	(FilterCh13@filter_sum+1),f
	line	118
	
l3466:	
	incf	(FilterCh13@i),f
	
l3468:	
	movlw	(0Ah)
	subwf	(FilterCh13@i),w
	skipc
	goto	u1051
	goto	u1050
u1051:
	goto	l3464
u1050:
	line	128
	
l3470:	
;common.c: 121: }
;common.c: 128: return (filter_sum >> 3);
	movf	(FilterCh13@filter_sum+1),w
	movwf	(?_FilterCh13+1)
	movf	(FilterCh13@filter_sum),w
	movwf	(?_FilterCh13)
	
l3472:	
	clrc
	rrf	(?_FilterCh13+1),f
	rrf	(?_FilterCh13),f
	clrc
	rrf	(?_FilterCh13+1),f
	rrf	(?_FilterCh13),f
	clrc
	rrf	(?_FilterCh13+1),f
	rrf	(?_FilterCh13),f
	line	130
	
l1488:	
	return
	opt stack 0
GLOBAL	__end_of_FilterCh13
	__end_of_FilterCh13:
;; =============== function _FilterCh13 ends ============

	signat	_FilterCh13,90
	global	_isFinishedOneHoursTimer
psect	text837,local,class=CODE,delta=2
global __ptext837
__ptext837:

;; *************** function _isFinishedOneHoursTimer *****************
;; Defined at:
;;		line 576 in file "D:\develop\190625\AK7030-OTP\common.c"
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
;; Hardware stack levels required when called:    4
;; This function calls:
;;		Nothing
;; This function is called by:
;;		_main
;; This function uses a non-reentrant model
;;
psect	text837
	file	"D:\develop\190625\AK7030-OTP\common.c"
	line	576
	global	__size_of_isFinishedOneHoursTimer
	__size_of_isFinishedOneHoursTimer	equ	__end_of_isFinishedOneHoursTimer-_isFinishedOneHoursTimer
	
_isFinishedOneHoursTimer:	
	opt	stack 3
; Regs used in _isFinishedOneHoursTimer: [wreg+status,2+status,0]
	line	577
	
l3420:	
;common.c: 577: if((uiOneHourTimer == 0) && bOneHourTimerStartFlag)
	movf	((_uiOneHourTimer+1)),w
	iorwf	((_uiOneHourTimer)),w
	skipz
	goto	u991
	goto	u990
u991:
	goto	l3432
u990:
	
l3422:	
	movf	(_bOneHourTimerStartFlag),w
	skipz
	goto	u1000
	goto	l3432
u1000:
	line	579
	
l3424:	
;common.c: 578: {
;common.c: 579: bOneHourTimerStartFlag = 0;
	clrf	(_bOneHourTimerStartFlag)
	line	580
	
l3426:	
;common.c: 580: return 1;
	movlw	(01h)
	goto	l1623
	line	583
	
l3432:	
;common.c: 582: else
;common.c: 583: return 0;
	movlw	(0)
	line	584
	
l1623:	
	return
	opt stack 0
GLOBAL	__end_of_isFinishedOneHoursTimer
	__end_of_isFinishedOneHoursTimer:
;; =============== function _isFinishedOneHoursTimer ends ============

	signat	_isFinishedOneHoursTimer,89
	global	_startOneHoursTimer
psect	text838,local,class=CODE,delta=2
global __ptext838
__ptext838:

;; *************** function _startOneHoursTimer *****************
;; Defined at:
;;		line 493 in file "D:\develop\190625\AK7030-OTP\common.c"
;; Parameters:    Size  Location     Type
;;  uiSetTime       2   11[BANK0 ] unsigned int 
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
;; Hardware stack levels required when called:    4
;; This function calls:
;;		Nothing
;; This function is called by:
;;		_main
;; This function uses a non-reentrant model
;;
psect	text838
	file	"D:\develop\190625\AK7030-OTP\common.c"
	line	493
	global	__size_of_startOneHoursTimer
	__size_of_startOneHoursTimer	equ	__end_of_startOneHoursTimer-_startOneHoursTimer
	
_startOneHoursTimer:	
	opt	stack 3
; Regs used in _startOneHoursTimer: [wreg+status,2+status,0]
	line	494
	
l3412:	
;common.c: 494: if(( 0 == uiOneHourTimer ) && ( 0 == bOneHourTimerStartFlag ))
	movf	((_uiOneHourTimer+1)),w
	iorwf	((_uiOneHourTimer)),w
	skipz
	goto	u971
	goto	u970
u971:
	goto	l1591
u970:
	
l3414:	
	movf	(_bOneHourTimerStartFlag),f
	skipz
	goto	u981
	goto	u980
u981:
	goto	l1591
u980:
	line	496
	
l3416:	
;common.c: 495: {
;common.c: 496: uiOneHourTimer = uiSetTime;
	movf	(startOneHoursTimer@uiSetTime+1),w
	movwf	(_uiOneHourTimer+1)
	movf	(startOneHoursTimer@uiSetTime),w
	movwf	(_uiOneHourTimer)
	line	497
	
l3418:	
;common.c: 497: bOneHourTimerStartFlag = 1;
	clrf	(_bOneHourTimerStartFlag)
	incf	(_bOneHourTimerStartFlag),f
	line	503
	
l1591:	
	return
	opt stack 0
GLOBAL	__end_of_startOneHoursTimer
	__end_of_startOneHoursTimer:
;; =============== function _startOneHoursTimer ends ============

	signat	_startOneHoursTimer,4216
	global	_isFinishedThreeHoursTimer
psect	text839,local,class=CODE,delta=2
global __ptext839
__ptext839:

;; *************** function _isFinishedThreeHoursTimer *****************
;; Defined at:
;;		line 563 in file "D:\develop\190625\AK7030-OTP\common.c"
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
;; Hardware stack levels required when called:    4
;; This function calls:
;;		Nothing
;; This function is called by:
;;		_main
;; This function uses a non-reentrant model
;;
psect	text839
	file	"D:\develop\190625\AK7030-OTP\common.c"
	line	563
	global	__size_of_isFinishedThreeHoursTimer
	__size_of_isFinishedThreeHoursTimer	equ	__end_of_isFinishedThreeHoursTimer-_isFinishedThreeHoursTimer
	
_isFinishedThreeHoursTimer:	
	opt	stack 3
; Regs used in _isFinishedThreeHoursTimer: [wreg+status,2+status,0]
	line	564
	
l3396:	
;common.c: 564: if((uiSmallTimer == 0) && bSmallTimerStartFlag)
	movf	((_uiSmallTimer+1)),w
	iorwf	((_uiSmallTimer)),w
	skipz
	goto	u951
	goto	u950
u951:
	goto	l3408
u950:
	
l3398:	
	movf	(_bSmallTimerStartFlag),w
	skipz
	goto	u960
	goto	l3408
u960:
	line	566
	
l3400:	
;common.c: 565: {
;common.c: 566: bSmallTimerStartFlag = 0;
	clrf	(_bSmallTimerStartFlag)
	line	567
	
l3402:	
;common.c: 567: return 1;
	movlw	(01h)
	goto	l1618
	line	570
	
l3408:	
;common.c: 569: else
;common.c: 570: return 0;
	movlw	(0)
	line	571
	
l1618:	
	return
	opt stack 0
GLOBAL	__end_of_isFinishedThreeHoursTimer
	__end_of_isFinishedThreeHoursTimer:
;; =============== function _isFinishedThreeHoursTimer ends ============

	signat	_isFinishedThreeHoursTimer,89
	global	_startThreeHoursTimer
psect	text840,local,class=CODE,delta=2
global __ptext840
__ptext840:

;; *************** function _startThreeHoursTimer *****************
;; Defined at:
;;		line 480 in file "D:\develop\190625\AK7030-OTP\common.c"
;; Parameters:    Size  Location     Type
;;  uiSetTime       2   11[BANK0 ] unsigned int 
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
;; Hardware stack levels required when called:    4
;; This function calls:
;;		Nothing
;; This function is called by:
;;		_main
;; This function uses a non-reentrant model
;;
psect	text840
	file	"D:\develop\190625\AK7030-OTP\common.c"
	line	480
	global	__size_of_startThreeHoursTimer
	__size_of_startThreeHoursTimer	equ	__end_of_startThreeHoursTimer-_startThreeHoursTimer
	
_startThreeHoursTimer:	
	opt	stack 3
; Regs used in _startThreeHoursTimer: [wreg+status,2+status,0]
	line	481
	
l3388:	
;common.c: 481: if(( 0 == uiSmallTimer ) && ( 0 == bSmallTimerStartFlag ))
	movf	((_uiSmallTimer+1)),w
	iorwf	((_uiSmallTimer)),w
	skipz
	goto	u931
	goto	u930
u931:
	goto	l1587
u930:
	
l3390:	
	movf	(_bSmallTimerStartFlag),f
	skipz
	goto	u941
	goto	u940
u941:
	goto	l1587
u940:
	line	483
	
l3392:	
;common.c: 482: {
;common.c: 483: uiSmallTimer = uiSetTime;
	movf	(startThreeHoursTimer@uiSetTime+1),w
	movwf	(_uiSmallTimer+1)
	movf	(startThreeHoursTimer@uiSetTime),w
	movwf	(_uiSmallTimer)
	line	484
	
l3394:	
;common.c: 484: bSmallTimerStartFlag = 1;
	clrf	(_bSmallTimerStartFlag)
	incf	(_bSmallTimerStartFlag),f
	line	490
	
l1587:	
	return
	opt stack 0
GLOBAL	__end_of_startThreeHoursTimer
	__end_of_startThreeHoursTimer:
;; =============== function _startThreeHoursTimer ends ============

	signat	_startThreeHoursTimer,4216
	global	_isFinishedTwelveHoursTimer
psect	text841,local,class=CODE,delta=2
global __ptext841
__ptext841:

;; *************** function _isFinishedTwelveHoursTimer *****************
;; Defined at:
;;		line 552 in file "D:\develop\190625\AK7030-OTP\common.c"
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
;; Hardware stack levels required when called:    4
;; This function calls:
;;		Nothing
;; This function is called by:
;;		_main
;; This function uses a non-reentrant model
;;
psect	text841
	file	"D:\develop\190625\AK7030-OTP\common.c"
	line	552
	global	__size_of_isFinishedTwelveHoursTimer
	__size_of_isFinishedTwelveHoursTimer	equ	__end_of_isFinishedTwelveHoursTimer-_isFinishedTwelveHoursTimer
	
_isFinishedTwelveHoursTimer:	
	opt	stack 3
; Regs used in _isFinishedTwelveHoursTimer: [wreg+status,2+status,0]
	line	553
	
l3372:	
;common.c: 553: if(( uiBigTimer == 0 ) && bBigTimerStartFlag )
	movf	((_uiBigTimer+1)),w
	iorwf	((_uiBigTimer)),w
	skipz
	goto	u911
	goto	u910
u911:
	goto	l3384
u910:
	
l3374:	
	movf	(_bBigTimerStartFlag),w
	skipz
	goto	u920
	goto	l3384
u920:
	line	555
	
l3376:	
;common.c: 554: {
;common.c: 555: bBigTimerStartFlag = 0;
	clrf	(_bBigTimerStartFlag)
	line	556
	
l3378:	
;common.c: 556: return 1;
	movlw	(01h)
	goto	l1613
	line	559
	
l3384:	
;common.c: 558: else
;common.c: 559: return 0;
	movlw	(0)
	line	560
	
l1613:	
	return
	opt stack 0
GLOBAL	__end_of_isFinishedTwelveHoursTimer
	__end_of_isFinishedTwelveHoursTimer:
;; =============== function _isFinishedTwelveHoursTimer ends ============

	signat	_isFinishedTwelveHoursTimer,89
	global	_startTwelveHourTimer
psect	text842,local,class=CODE,delta=2
global __ptext842
__ptext842:

;; *************** function _startTwelveHourTimer *****************
;; Defined at:
;;		line 432 in file "D:\develop\190625\AK7030-OTP\common.c"
;; Parameters:    Size  Location     Type
;;  uiSetTime       2   11[BANK0 ] unsigned int 
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
;; Hardware stack levels required when called:    4
;; This function calls:
;;		Nothing
;; This function is called by:
;;		_main
;; This function uses a non-reentrant model
;;
psect	text842
	file	"D:\develop\190625\AK7030-OTP\common.c"
	line	432
	global	__size_of_startTwelveHourTimer
	__size_of_startTwelveHourTimer	equ	__end_of_startTwelveHourTimer-_startTwelveHourTimer
	
_startTwelveHourTimer:	
	opt	stack 3
; Regs used in _startTwelveHourTimer: [wreg+status,2+status,0]
	line	433
	
l3364:	
;common.c: 433: if((0 == uiBigTimer) && ( 0 == bBigTimerStartFlag))
	movf	((_uiBigTimer+1)),w
	iorwf	((_uiBigTimer)),w
	skipz
	goto	u891
	goto	u890
u891:
	goto	l1568
u890:
	
l3366:	
	movf	(_bBigTimerStartFlag),f
	skipz
	goto	u901
	goto	u900
u901:
	goto	l1568
u900:
	line	435
	
l3368:	
;common.c: 434: {
;common.c: 435: uiBigTimer = uiSetTime;
	movf	(startTwelveHourTimer@uiSetTime+1),w
	movwf	(_uiBigTimer+1)
	movf	(startTwelveHourTimer@uiSetTime),w
	movwf	(_uiBigTimer)
	line	436
	
l3370:	
;common.c: 436: bBigTimerStartFlag = 1;
	clrf	(_bBigTimerStartFlag)
	incf	(_bBigTimerStartFlag),f
	line	443
	
l1568:	
	return
	opt stack 0
GLOBAL	__end_of_startTwelveHourTimer
	__end_of_startTwelveHourTimer:
;; =============== function _startTwelveHourTimer ends ============

	signat	_startTwelveHourTimer,4216
	global	_clearTwentyMinTimer
psect	text843,local,class=CODE,delta=2
global __ptext843
__ptext843:

;; *************** function _clearTwentyMinTimer *****************
;; Defined at:
;;		line 473 in file "D:\develop\190625\AK7030-OTP\common.c"
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
;; Hardware stack levels required when called:    4
;; This function calls:
;;		Nothing
;; This function is called by:
;;		_main
;; This function uses a non-reentrant model
;;
psect	text843
	file	"D:\develop\190625\AK7030-OTP\common.c"
	line	473
	global	__size_of_clearTwentyMinTimer
	__size_of_clearTwentyMinTimer	equ	__end_of_clearTwentyMinTimer-_clearTwentyMinTimer
	
_clearTwentyMinTimer:	
	opt	stack 3
; Regs used in _clearTwentyMinTimer: [status,2]
	line	474
	
l3362:	
;common.c: 474: uiTwentyMinTimer = 0;
	clrf	(_uiTwentyMinTimer)
	clrf	(_uiTwentyMinTimer+1)
	line	475
;common.c: 475: bTwentyMinStartFlag = 0;
	clrf	(_bTwentyMinStartFlag)
	line	476
	
l1583:	
	return
	opt stack 0
GLOBAL	__end_of_clearTwentyMinTimer
	__end_of_clearTwentyMinTimer:
;; =============== function _clearTwentyMinTimer ends ============

	signat	_clearTwentyMinTimer,88
	global	_isFinishedTwentyMinTimer
psect	text844,local,class=CODE,delta=2
global __ptext844
__ptext844:

;; *************** function _isFinishedTwentyMinTimer *****************
;; Defined at:
;;		line 528 in file "D:\develop\190625\AK7030-OTP\common.c"
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
;; Hardware stack levels required when called:    4
;; This function calls:
;;		Nothing
;; This function is called by:
;;		_main
;; This function uses a non-reentrant model
;;
psect	text844
	file	"D:\develop\190625\AK7030-OTP\common.c"
	line	528
	global	__size_of_isFinishedTwentyMinTimer
	__size_of_isFinishedTwentyMinTimer	equ	__end_of_isFinishedTwentyMinTimer-_isFinishedTwentyMinTimer
	
_isFinishedTwentyMinTimer:	
	opt	stack 3
; Regs used in _isFinishedTwentyMinTimer: [wreg+status,2+status,0]
	line	529
	
l3346:	
;common.c: 529: if(( 0 == uiTwentyMinTimer ) && bTwentyMinStartFlag )
	movf	((_uiTwentyMinTimer+1)),w
	iorwf	((_uiTwentyMinTimer)),w
	skipz
	goto	u871
	goto	u870
u871:
	goto	l3358
u870:
	
l3348:	
	movf	(_bTwentyMinStartFlag),w
	skipz
	goto	u880
	goto	l3358
u880:
	line	531
	
l3350:	
;common.c: 530: {
;common.c: 531: bTwentyMinStartFlag = 0;
	clrf	(_bTwentyMinStartFlag)
	line	532
	
l3352:	
;common.c: 532: return 1;
	movlw	(01h)
	goto	l1603
	line	535
	
l3358:	
;common.c: 534: else
;common.c: 535: return 0;
	movlw	(0)
	line	536
	
l1603:	
	return
	opt stack 0
GLOBAL	__end_of_isFinishedTwentyMinTimer
	__end_of_isFinishedTwentyMinTimer:
;; =============== function _isFinishedTwentyMinTimer ends ============

	signat	_isFinishedTwentyMinTimer,89
	global	_clrSampeTime
psect	text845,local,class=CODE,delta=2
global __ptext845
__ptext845:

;; *************** function _clrSampeTime *****************
;; Defined at:
;;		line 598 in file "D:\develop\190625\AK7030-OTP\common.c"
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
;; Hardware stack levels required when called:    4
;; This function calls:
;;		Nothing
;; This function is called by:
;;		_main
;; This function uses a non-reentrant model
;;
psect	text845
	file	"D:\develop\190625\AK7030-OTP\common.c"
	line	598
	global	__size_of_clrSampeTime
	__size_of_clrSampeTime	equ	__end_of_clrSampeTime-_clrSampeTime
	
_clrSampeTime:	
	opt	stack 3
; Regs used in _clrSampeTime: [status,2]
	line	599
	
l3344:	
;common.c: 599: timer.timer10msStopWatch = 0;
	clrf	(_timer)
	line	600
	
l1632:	
	return
	opt stack 0
GLOBAL	__end_of_clrSampeTime
	__end_of_clrSampeTime:
;; =============== function _clrSampeTime ends ============

	signat	_clrSampeTime,88
	global	_isPermitSampleTime
psect	text846,local,class=CODE,delta=2
global __ptext846
__ptext846:

;; *************** function _isPermitSampleTime *****************
;; Defined at:
;;		line 588 in file "D:\develop\190625\AK7030-OTP\common.c"
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
;; Hardware stack levels required when called:    4
;; This function calls:
;;		Nothing
;; This function is called by:
;;		_main
;; This function uses a non-reentrant model
;;
psect	text846
	file	"D:\develop\190625\AK7030-OTP\common.c"
	line	588
	global	__size_of_isPermitSampleTime
	__size_of_isPermitSampleTime	equ	__end_of_isPermitSampleTime-_isPermitSampleTime
	
_isPermitSampleTime:	
	opt	stack 3
; Regs used in _isPermitSampleTime: [wreg]
	line	589
	
l3332:	
;common.c: 589: if(timer.timer10msStopWatch >= 10)
	movlw	(0Ah)
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	subwf	(_timer),w
	skipc
	goto	u861
	goto	u860
u861:
	goto	l3340
u860:
	line	591
	
l3334:	
;common.c: 590: {
;common.c: 591: return 1;
	movlw	(01h)
	goto	l1628
	line	594
	
l3340:	
;common.c: 593: else
;common.c: 594: return 0;
	movlw	(0)
	line	595
	
l1628:	
	return
	opt stack 0
GLOBAL	__end_of_isPermitSampleTime
	__end_of_isPermitSampleTime:
;; =============== function _isPermitSampleTime ends ============

	signat	_isPermitSampleTime,89
	global	_adc_start
psect	text847,local,class=CODE,delta=2
global __ptext847
__ptext847:

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
;; Hardware stack levels required when called:    4
;; This function calls:
;;		Nothing
;; This function is called by:
;;		_main
;; This function uses a non-reentrant model
;;
psect	text847
	file	"D:\develop\190625\AK7030-OTP\periph.c"
	line	101
	global	__size_of_adc_start
	__size_of_adc_start	equ	__end_of_adc_start-_adc_start
	
_adc_start:	
	opt	stack 3
; Regs used in _adc_start: []
	line	102
	
l3330:	
;periph.c: 102: GO=1;
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	bsf	(249/8),(249)&7
	line	103
	
l2300:	
	return
	opt stack 0
GLOBAL	__end_of_adc_start
	__end_of_adc_start:
;; =============== function _adc_start ends ============

	signat	_adc_start,88
	global	_startTwentyMinTimer
psect	text848,local,class=CODE,delta=2
global __ptext848
__ptext848:

;; *************** function _startTwentyMinTimer *****************
;; Defined at:
;;		line 518 in file "D:\develop\190625\AK7030-OTP\common.c"
;; Parameters:    Size  Location     Type
;;  uiSetValue      2   11[BANK0 ] unsigned int 
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
;; Hardware stack levels required when called:    4
;; This function calls:
;;		Nothing
;; This function is called by:
;;		_main
;; This function uses a non-reentrant model
;;
psect	text848
	file	"D:\develop\190625\AK7030-OTP\common.c"
	line	518
	global	__size_of_startTwentyMinTimer
	__size_of_startTwentyMinTimer	equ	__end_of_startTwentyMinTimer-_startTwentyMinTimer
	
_startTwentyMinTimer:	
	opt	stack 3
; Regs used in _startTwentyMinTimer: [wreg+status,2+status,0]
	line	519
	
l3322:	
;common.c: 519: if(( 0 == uiTwentyMinTimer) && ( 0 == bTwentyMinStartFlag))
	movf	((_uiTwentyMinTimer+1)),w
	iorwf	((_uiTwentyMinTimer)),w
	skipz
	goto	u841
	goto	u840
u841:
	goto	l1599
u840:
	
l3324:	
	movf	(_bTwentyMinStartFlag),f
	skipz
	goto	u851
	goto	u850
u851:
	goto	l1599
u850:
	line	521
	
l3326:	
;common.c: 520: {
;common.c: 521: uiTwentyMinTimer = uiSetValue;
	movf	(startTwentyMinTimer@uiSetValue+1),w
	movwf	(_uiTwentyMinTimer+1)
	movf	(startTwentyMinTimer@uiSetValue),w
	movwf	(_uiTwentyMinTimer)
	line	522
	
l3328:	
;common.c: 522: bTwentyMinStartFlag = 1;
	clrf	(_bTwentyMinStartFlag)
	incf	(_bTwentyMinStartFlag),f
	line	524
	
l1599:	
	return
	opt stack 0
GLOBAL	__end_of_startTwentyMinTimer
	__end_of_startTwentyMinTimer:
;; =============== function _startTwentyMinTimer ends ============

	signat	_startTwentyMinTimer,4216
	global	_adc_test_init
psect	text849,local,class=CODE,delta=2
global __ptext849
__ptext849:

;; *************** function _adc_test_init *****************
;; Defined at:
;;		line 85 in file "D:\develop\190625\AK7030-OTP\periph.c"
;; Parameters:    Size  Location     Type
;;  channel         1    wreg     unsigned char 
;;  ref             1   11[BANK0 ] unsigned char 
;; Auto vars:     Size  Location     Type
;;  channel         1   13[BANK0 ] unsigned char 
;; Return value:  Size  Location     Type
;;		None               void
;; Registers used:
;;		wreg, status,2, status,0
;; Tracked objects:
;;		On entry : 17F/0
;;		On exit  : 17F/20
;;		Unchanged: FFE80/0
;; Data sizes:     COMMON   BANK0   BANK1   BANK3   BANK2
;;      Params:         0       1       0       0       0
;;      Locals:         0       1       0       0       0
;;      Temps:          0       1       0       0       0
;;      Totals:         0       3       0       0       0
;;Total ram usage:        3 bytes
;; Hardware stack levels used:    1
;; Hardware stack levels required when called:    4
;; This function calls:
;;		Nothing
;; This function is called by:
;;		_main
;; This function uses a non-reentrant model
;;
psect	text849
	file	"D:\develop\190625\AK7030-OTP\periph.c"
	line	85
	global	__size_of_adc_test_init
	__size_of_adc_test_init	equ	__end_of_adc_test_init-_adc_test_init
	
_adc_test_init:	
	opt	stack 3
; Regs used in _adc_test_init: [wreg+status,2+status,0]
;adc_test_init@channel stored from wreg
	movwf	(adc_test_init@channel)
	line	86
	
l3312:	
;periph.c: 86: ADCON0 = 0x00;
	clrf	(31)	;volatile
	line	87
	
l3314:	
;periph.c: 87: ADCON0|=channel<<2;
	movf	(adc_test_init@channel),w
	movwf	(??_adc_test_init+0)+0
	clrc
	rlf	(??_adc_test_init+0)+0,f
	clrc
	rlf	(??_adc_test_init+0)+0,w
	iorwf	(31),f	;volatile
	line	89
	
l3316:	
;periph.c: 89: ADCON1|=ref<<6;
	movf	(adc_test_init@ref),w
	movwf	(??_adc_test_init+0)+0
	rrf	(??_adc_test_init+0)+0,f
	rrf	(??_adc_test_init+0)+0,f
	rrf	(??_adc_test_init+0)+0,w
	andlw	0c0h
	bsf	status, 5	;RP0=1, select bank1
	iorwf	(159)^080h,f	;volatile
	line	90
	
l3318:	
;periph.c: 90: ADON=1;
	bcf	status, 5	;RP0=0, select bank0
	bsf	(248/8),(248)&7
	line	91
	
l3320:	
;periph.c: 91: ADIE=1;
	bsf	status, 5	;RP0=1, select bank1
	bsf	(1130/8)^080h,(1130)&7
	line	92
	
l2294:	
	return
	opt stack 0
GLOBAL	__end_of_adc_test_init
	__end_of_adc_test_init:
;; =============== function _adc_test_init ends ============

	signat	_adc_test_init,8312
	global	_timer1_interrupt_config
psect	text850,local,class=CODE,delta=2
global __ptext850
__ptext850:

;; *************** function _timer1_interrupt_config *****************
;; Defined at:
;;		line 307 in file "D:\develop\190625\AK7030-OTP\common.c"
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
;; Hardware stack levels required when called:    4
;; This function calls:
;;		Nothing
;; This function is called by:
;;		_main
;; This function uses a non-reentrant model
;;
psect	text850
	file	"D:\develop\190625\AK7030-OTP\common.c"
	line	307
	global	__size_of_timer1_interrupt_config
	__size_of_timer1_interrupt_config	equ	__end_of_timer1_interrupt_config-_timer1_interrupt_config
	
_timer1_interrupt_config:	
	opt	stack 3
; Regs used in _timer1_interrupt_config: []
	line	308
	
l3310:	
;common.c: 308: GIE = 1;
	bsf	(95/8),(95)&7
	line	309
;common.c: 309: PEIE = 1;
	bsf	(94/8),(94)&7
	line	310
	
l1537:	
	return
	opt stack 0
GLOBAL	__end_of_timer1_interrupt_config
	__end_of_timer1_interrupt_config:
;; =============== function _timer1_interrupt_config ends ============

	signat	_timer1_interrupt_config,88
	global	_timer1_config
psect	text851,local,class=CODE,delta=2
global __ptext851
__ptext851:

;; *************** function _timer1_config *****************
;; Defined at:
;;		line 295 in file "D:\develop\190625\AK7030-OTP\common.c"
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
;; Hardware stack levels required when called:    4
;; This function calls:
;;		Nothing
;; This function is called by:
;;		_main
;; This function uses a non-reentrant model
;;
psect	text851
	file	"D:\develop\190625\AK7030-OTP\common.c"
	line	295
	global	__size_of_timer1_config
	__size_of_timer1_config	equ	__end_of_timer1_config-_timer1_config
	
_timer1_config:	
	opt	stack 3
; Regs used in _timer1_config: [wreg]
	line	297
	
l3306:	
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
	
l3308:	
;common.c: 300: TMR1IE=1;
	bsf	status, 5	;RP0=1, select bank1
	bsf	(1120/8)^080h,(1120)&7
	line	302
	
l1534:	
	return
	opt stack 0
GLOBAL	__end_of_timer1_config
	__end_of_timer1_config:
;; =============== function _timer1_config ends ============

	signat	_timer1_config,88
	global	_clock_config
psect	text852,local,class=CODE,delta=2
global __ptext852
__ptext852:

;; *************** function _clock_config *****************
;; Defined at:
;;		line 287 in file "D:\develop\190625\AK7030-OTP\common.c"
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
;; Hardware stack levels required when called:    4
;; This function calls:
;;		Nothing
;; This function is called by:
;;		_main
;; This function uses a non-reentrant model
;;
psect	text852
	file	"D:\develop\190625\AK7030-OTP\common.c"
	line	287
	global	__size_of_clock_config
	__size_of_clock_config	equ	__end_of_clock_config-_clock_config
	
_clock_config:	
	opt	stack 3
; Regs used in _clock_config: [wreg+status,2]
	line	289
	
l3302:	
;common.c: 289: CLKPR = 0x80;
	movlw	(080h)
	bcf	status, 5	;RP0=0, select bank2
	bsf	status, 6	;RP1=1, select bank2
	movwf	(264)^0100h	;volatile
	line	290
	
l3304:	
;common.c: 290: CLKPR = 0x00;
	clrf	(264)^0100h	;volatile
	line	291
;common.c: 291: while(CLKPCE);
	
l1528:	
	btfsc	(2119/8)^0100h,(2119)&7
	goto	u831
	goto	u830
u831:
	goto	l1528
u830:
	line	292
	
l1531:	
	return
	opt stack 0
GLOBAL	__end_of_clock_config
	__end_of_clock_config:
;; =============== function _clock_config ends ============

	signat	_clock_config,88
	global	_reset
psect	text853,local,class=CODE,delta=2
global __ptext853
__ptext853:

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
;; Hardware stack levels required when called:    4
;; This function calls:
;;		Nothing
;; This function is called by:
;;		_main
;; This function uses a non-reentrant model
;;
psect	text853
	file	"D:\develop\190625\AK7030-OTP\main.c"
	line	309
	global	__size_of_reset
	__size_of_reset	equ	__end_of_reset-_reset
	
_reset:	
	opt	stack 3
; Regs used in _reset: []
	line	311
;main.c: 311: while(1);
	
l723:	
	goto	l723
	return
	opt stack 0
psect	text854,local,class=CODE,delta=2
global __ptext854
__ptext854:
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
;; Hardware stack levels required when called:    4
;; This function calls:
;;		Nothing
;; This function is called by:
;;		_main
;; This function uses a non-reentrant model
;;
psect	text854
	file	"D:\develop\190625\AK7030-OTP\main.c"
	line	298
	global	__size_of_selectAdChannel
	__size_of_selectAdChannel	equ	__end_of_selectAdChannel-_selectAdChannel
	
_selectAdChannel:	
	opt	stack 3
; Regs used in _selectAdChannel: []
	line	300
	
l3300:	
;main.c: 300: TRISB0 = 1;
	bsf	status, 5	;RP0=1, select bank1
	bsf	(1072/8)^080h,(1072)&7
	line	301
;main.c: 301: TRISB1 = 1;
	bsf	(1073/8)^080h,(1073)&7
	line	305
	
l720:	
	return
	opt stack 0
GLOBAL	__end_of_selectAdChannel
	__end_of_selectAdChannel:
;; =============== function _selectAdChannel ends ============

	signat	_selectAdChannel,88
	global	_pwm_start
psect	text855,local,class=CODE,delta=2
global __ptext855
__ptext855:

;; *************** function _pwm_start *****************
;; Defined at:
;;		line 246 in file "D:\develop\190625\AK7030-OTP\main.c"
;; Parameters:    Size  Location     Type
;;  ucPulseWidth    1    wreg     unsigned char 
;;  ucPulseFrequ    1   11[BANK0 ] unsigned char 
;; Auto vars:     Size  Location     Type
;;  ucPulseWidth    1   12[BANK0 ] unsigned char 
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
;; Hardware stack levels required when called:    4
;; This function calls:
;;		Nothing
;; This function is called by:
;;		_main
;; This function uses a non-reentrant model
;;
psect	text855
	file	"D:\develop\190625\AK7030-OTP\main.c"
	line	246
	global	__size_of_pwm_start
	__size_of_pwm_start	equ	__end_of_pwm_start-_pwm_start
	
_pwm_start:	
	opt	stack 3
; Regs used in _pwm_start: [wreg+status,2+status,0]
;pwm_start@ucPulseWidth stored from wreg
	line	248
	movwf	(pwm_start@ucPulseWidth)
	
l3284:	
;main.c: 248: CCP1CON&= 0xf0;
	movlw	(0F0h)
	andwf	(23),f	;volatile
	line	250
	
l3286:	
;main.c: 250: T2CON=0x04;
	movlw	(04h)
	movwf	(18)	;volatile
	line	251
	
l3288:	
;main.c: 251: PR2 = ucPulseFrequency;
	movf	(pwm_start@ucPulseFrequency),w
	bsf	status, 5	;RP0=1, select bank1
	movwf	(146)^080h	;volatile
	line	252
	
l3290:	
;main.c: 252: CCPR1L = ucPulseWidth;
	bcf	status, 5	;RP0=0, select bank0
	movf	(pwm_start@ucPulseWidth),w
	movwf	(21)	;volatile
	line	253
	
l3292:	
;main.c: 253: CCP1CON=0x00;
	clrf	(23)	;volatile
	line	255
	
l3294:	
;main.c: 255: TRISB2=0;
	bsf	status, 5	;RP0=1, select bank1
	bcf	(1074/8)^080h,(1074)&7
	line	256
	
l3296:	
;main.c: 256: PBOD2 = 0;
	bsf	status, 6	;RP1=1, select bank3
	bcf	(3138/8)^0180h,(3138)&7
	line	258
	
l3298:	
;main.c: 258: CCP1CON|= 0x0c;
	movlw	(0Ch)
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	iorwf	(23),f	;volatile
	line	267
	
l711:	
	return
	opt stack 0
GLOBAL	__end_of_pwm_start
	__end_of_pwm_start:
;; =============== function _pwm_start ends ============

	signat	_pwm_start,8312
	global	_initPB2_AsHighResistence
psect	text856,local,class=CODE,delta=2
global __ptext856
__ptext856:

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
;; Hardware stack levels required when called:    4
;; This function calls:
;;		Nothing
;; This function is called by:
;;		_initPin
;; This function uses a non-reentrant model
;;
psect	text856
	file	"D:\develop\190625\AK7030-OTP\main.c"
	line	234
	global	__size_of_initPB2_AsHighResistence
	__size_of_initPB2_AsHighResistence	equ	__end_of_initPB2_AsHighResistence-_initPB2_AsHighResistence
	
_initPB2_AsHighResistence:	
	opt	stack 2
; Regs used in _initPB2_AsHighResistence: []
	line	236
	
l3282:	
;main.c: 236: PB2 = 1;
	bsf	(50/8),(50)&7
	line	237
;main.c: 237: PBOD2 = 1;
	bsf	status, 5	;RP0=1, select bank3
	bsf	status, 6	;RP1=1, select bank3
	bsf	(3138/8)^0180h,(3138)&7
	line	241
	
l708:	
	return
	opt stack 0
GLOBAL	__end_of_initPB2_AsHighResistence
	__end_of_initPB2_AsHighResistence:
;; =============== function _initPB2_AsHighResistence ends ============

	signat	_initPB2_AsHighResistence,88
	global	_setPB5
psect	text857,local,class=CODE,delta=2
global __ptext857
__ptext857:

;; *************** function _setPB5 *****************
;; Defined at:
;;		line 217 in file "D:\develop\190625\AK7030-OTP\main.c"
;; Parameters:    Size  Location     Type
;;  bValue          1    wreg     unsigned char 
;; Auto vars:     Size  Location     Type
;;  bValue          1   11[BANK0 ] unsigned char 
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
;; Hardware stack levels required when called:    4
;; This function calls:
;;		Nothing
;; This function is called by:
;;		_setPinInitVaule
;;		_main
;; This function uses a non-reentrant model
;;
psect	text857
	file	"D:\develop\190625\AK7030-OTP\main.c"
	line	217
	global	__size_of_setPB5
	__size_of_setPB5	equ	__end_of_setPB5-_setPB5
	
_setPB5:	
	opt	stack 3
; Regs used in _setPB5: [wreg]
;setPB5@bValue stored from wreg
	movwf	(setPB5@bValue)
	line	218
	
l3278:	
;main.c: 218: if( bValue )
	movf	(setPB5@bValue),w
	skipz
	goto	u820
	goto	l703
u820:
	line	220
	
l3280:	
;main.c: 220: PB5 = 1;
	bsf	(53/8),(53)&7
	goto	l705
	line	224
	
l703:	
	line	226
;main.c: 224: else
;main.c: 226: PB5= 0;
	bcf	(53/8),(53)&7
	line	230
	
l705:	
	return
	opt stack 0
GLOBAL	__end_of_setPB5
	__end_of_setPB5:
;; =============== function _setPB5 ends ============

	signat	_setPB5,4216
	global	_initPB5
psect	text858,local,class=CODE,delta=2
global __ptext858
__ptext858:

;; *************** function _initPB5 *****************
;; Defined at:
;;		line 200 in file "D:\develop\190625\AK7030-OTP\main.c"
;; Parameters:    Size  Location     Type
;;  bValue          1    wreg     unsigned char 
;; Auto vars:     Size  Location     Type
;;  bValue          1   11[BANK0 ] unsigned char 
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
;; Hardware stack levels required when called:    4
;; This function calls:
;;		Nothing
;; This function is called by:
;;		_initPin
;; This function uses a non-reentrant model
;;
psect	text858
	file	"D:\develop\190625\AK7030-OTP\main.c"
	line	200
	global	__size_of_initPB5
	__size_of_initPB5	equ	__end_of_initPB5-_initPB5
	
_initPB5:	
	opt	stack 2
; Regs used in _initPB5: [wreg]
;initPB5@bValue stored from wreg
	bcf	status, 5	;RP0=0, select bank0
	movwf	(initPB5@bValue)
	line	201
	
l3274:	
;main.c: 201: if( bValue )
	movf	(initPB5@bValue),w
	skipz
	goto	u810
	goto	l698
u810:
	line	203
	
l3276:	
;main.c: 203: TRISB5 = 1;
	bsf	status, 5	;RP0=1, select bank1
	bsf	(1077/8)^080h,(1077)&7
	goto	l700
	line	207
	
l698:	
	line	209
;main.c: 207: else
;main.c: 209: TRISB5= 0;
	bsf	status, 5	;RP0=1, select bank1
	bcf	(1077/8)^080h,(1077)&7
	line	213
	
l700:	
	return
	opt stack 0
GLOBAL	__end_of_initPB5
	__end_of_initPB5:
;; =============== function _initPB5 ends ============

	signat	_initPB5,4216
	global	_setPB4
psect	text859,local,class=CODE,delta=2
global __ptext859
__ptext859:

;; *************** function _setPB4 *****************
;; Defined at:
;;		line 183 in file "D:\develop\190625\AK7030-OTP\main.c"
;; Parameters:    Size  Location     Type
;;  bValue          1    wreg     unsigned char 
;; Auto vars:     Size  Location     Type
;;  bValue          1   11[BANK0 ] unsigned char 
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
;; Hardware stack levels required when called:    4
;; This function calls:
;;		Nothing
;; This function is called by:
;;		_setPinInitVaule
;;		_main
;; This function uses a non-reentrant model
;;
psect	text859
	file	"D:\develop\190625\AK7030-OTP\main.c"
	line	183
	global	__size_of_setPB4
	__size_of_setPB4	equ	__end_of_setPB4-_setPB4
	
_setPB4:	
	opt	stack 3
; Regs used in _setPB4: [wreg]
;setPB4@bValue stored from wreg
	movwf	(setPB4@bValue)
	line	184
	
l3270:	
;main.c: 184: if( bValue )
	movf	(setPB4@bValue),w
	skipz
	goto	u800
	goto	l693
u800:
	line	186
	
l3272:	
;main.c: 186: PB4 = 1;
	bsf	(52/8),(52)&7
	goto	l695
	line	190
	
l693:	
	line	192
;main.c: 190: else
;main.c: 192: PB4= 0;
	bcf	(52/8),(52)&7
	line	196
	
l695:	
	return
	opt stack 0
GLOBAL	__end_of_setPB4
	__end_of_setPB4:
;; =============== function _setPB4 ends ============

	signat	_setPB4,4216
	global	_initPB4
psect	text860,local,class=CODE,delta=2
global __ptext860
__ptext860:

;; *************** function _initPB4 *****************
;; Defined at:
;;		line 166 in file "D:\develop\190625\AK7030-OTP\main.c"
;; Parameters:    Size  Location     Type
;;  bValue          1    wreg     unsigned char 
;; Auto vars:     Size  Location     Type
;;  bValue          1   11[BANK0 ] unsigned char 
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
;; Hardware stack levels required when called:    4
;; This function calls:
;;		Nothing
;; This function is called by:
;;		_initPin
;; This function uses a non-reentrant model
;;
psect	text860
	file	"D:\develop\190625\AK7030-OTP\main.c"
	line	166
	global	__size_of_initPB4
	__size_of_initPB4	equ	__end_of_initPB4-_initPB4
	
_initPB4:	
	opt	stack 2
; Regs used in _initPB4: [wreg]
;initPB4@bValue stored from wreg
	bcf	status, 5	;RP0=0, select bank0
	movwf	(initPB4@bValue)
	line	167
	
l3266:	
;main.c: 167: if( bValue )
	movf	(initPB4@bValue),w
	skipz
	goto	u790
	goto	l688
u790:
	line	169
	
l3268:	
;main.c: 169: TRISB4 = 1;
	bsf	status, 5	;RP0=1, select bank1
	bsf	(1076/8)^080h,(1076)&7
	goto	l690
	line	173
	
l688:	
	line	175
;main.c: 173: else
;main.c: 175: TRISB4= 0;
	bsf	status, 5	;RP0=1, select bank1
	bcf	(1076/8)^080h,(1076)&7
	line	179
	
l690:	
	return
	opt stack 0
GLOBAL	__end_of_initPB4
	__end_of_initPB4:
;; =============== function _initPB4 ends ============

	signat	_initPB4,4216
	global	_setPB3
psect	text861,local,class=CODE,delta=2
global __ptext861
__ptext861:

;; *************** function _setPB3 *****************
;; Defined at:
;;		line 148 in file "D:\develop\190625\AK7030-OTP\main.c"
;; Parameters:    Size  Location     Type
;;  bValue          1    wreg     unsigned char 
;; Auto vars:     Size  Location     Type
;;  bValue          1   11[BANK0 ] unsigned char 
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
;; Hardware stack levels required when called:    4
;; This function calls:
;;		Nothing
;; This function is called by:
;;		_setPinInitVaule
;;		_main
;; This function uses a non-reentrant model
;;
psect	text861
	file	"D:\develop\190625\AK7030-OTP\main.c"
	line	148
	global	__size_of_setPB3
	__size_of_setPB3	equ	__end_of_setPB3-_setPB3
	
_setPB3:	
	opt	stack 3
; Regs used in _setPB3: [wreg]
;setPB3@bValue stored from wreg
	bcf	status, 5	;RP0=0, select bank0
	movwf	(setPB3@bValue)
	line	149
	
l3262:	
;main.c: 149: if( bValue )
	movf	(setPB3@bValue),w
	skipz
	goto	u780
	goto	l683
u780:
	line	151
	
l3264:	
;main.c: 151: PB3 = 1;
	bsf	(51/8),(51)&7
	goto	l685
	line	155
	
l683:	
	line	157
;main.c: 155: else
;main.c: 157: PB3= 0;
	bcf	(51/8),(51)&7
	line	161
	
l685:	
	return
	opt stack 0
GLOBAL	__end_of_setPB3
	__end_of_setPB3:
;; =============== function _setPB3 ends ============

	signat	_setPB3,4216
	global	_initPB3
psect	text862,local,class=CODE,delta=2
global __ptext862
__ptext862:

;; *************** function _initPB3 *****************
;; Defined at:
;;		line 131 in file "D:\develop\190625\AK7030-OTP\main.c"
;; Parameters:    Size  Location     Type
;;  bValue          1    wreg     unsigned char 
;; Auto vars:     Size  Location     Type
;;  bValue          1   11[BANK0 ] unsigned char 
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
;; Hardware stack levels required when called:    4
;; This function calls:
;;		Nothing
;; This function is called by:
;;		_initPin
;; This function uses a non-reentrant model
;;
psect	text862
	file	"D:\develop\190625\AK7030-OTP\main.c"
	line	131
	global	__size_of_initPB3
	__size_of_initPB3	equ	__end_of_initPB3-_initPB3
	
_initPB3:	
	opt	stack 2
; Regs used in _initPB3: [wreg]
;initPB3@bValue stored from wreg
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	movwf	(initPB3@bValue)
	line	132
	
l3258:	
;main.c: 132: if( bValue )
	movf	(initPB3@bValue),w
	skipz
	goto	u770
	goto	l678
u770:
	line	134
	
l3260:	
;main.c: 134: TRISB3 = 1;
	bsf	status, 5	;RP0=1, select bank1
	bsf	(1075/8)^080h,(1075)&7
	goto	l680
	line	138
	
l678:	
	line	140
;main.c: 138: else
;main.c: 140: TRISB3 = 0;
	bsf	status, 5	;RP0=1, select bank1
	bcf	(1075/8)^080h,(1075)&7
	line	144
	
l680:	
	return
	opt stack 0
GLOBAL	__end_of_initPB3
	__end_of_initPB3:
;; =============== function _initPB3 ends ============

	signat	_initPB3,4216
	global	_clearThreeHoursTimer
psect	text863,local,class=CODE,delta=2
global __ptext863
__ptext863:

;; *************** function _clearThreeHoursTimer *****************
;; Defined at:
;;		line 453 in file "D:\develop\190625\AK7030-OTP\common.c"
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
;; Hardware stack levels required when called:    4
;; This function calls:
;;		Nothing
;; This function is called by:
;;		_main
;; This function uses a non-reentrant model
;;
psect	text863
	file	"D:\develop\190625\AK7030-OTP\common.c"
	line	453
	global	__size_of_clearThreeHoursTimer
	__size_of_clearThreeHoursTimer	equ	__end_of_clearThreeHoursTimer-_clearThreeHoursTimer
	
_clearThreeHoursTimer:	
	opt	stack 3
; Regs used in _clearThreeHoursTimer: [status,2]
	line	454
	
l3256:	
;common.c: 454: uiSmallTimer = 0;
	clrf	(_uiSmallTimer)
	clrf	(_uiSmallTimer+1)
	line	455
;common.c: 455: bSmallTimerStartFlag = 0;
	clrf	(_bSmallTimerStartFlag)
	line	456
	
l1574:	
	return
	opt stack 0
GLOBAL	__end_of_clearThreeHoursTimer
	__end_of_clearThreeHoursTimer:
;; =============== function _clearThreeHoursTimer ends ============

	signat	_clearThreeHoursTimer,88
	global	_clearTwelveHoursTimer
psect	text864,local,class=CODE,delta=2
global __ptext864
__ptext864:

;; *************** function _clearTwelveHoursTimer *****************
;; Defined at:
;;		line 446 in file "D:\develop\190625\AK7030-OTP\common.c"
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
;; Hardware stack levels required when called:    4
;; This function calls:
;;		Nothing
;; This function is called by:
;;		_main
;; This function uses a non-reentrant model
;;
psect	text864
	file	"D:\develop\190625\AK7030-OTP\common.c"
	line	446
	global	__size_of_clearTwelveHoursTimer
	__size_of_clearTwelveHoursTimer	equ	__end_of_clearTwelveHoursTimer-_clearTwelveHoursTimer
	
_clearTwelveHoursTimer:	
	opt	stack 3
; Regs used in _clearTwelveHoursTimer: [status,2]
	line	447
	
l3254:	
;common.c: 447: uiBigTimer = 0;
	clrf	(_uiBigTimer)
	clrf	(_uiBigTimer+1)
	line	448
;common.c: 448: bBigTimerStartFlag = 0;
	clrf	(_bBigTimerStartFlag)
	line	449
	
l1571:	
	return
	opt stack 0
GLOBAL	__end_of_clearTwelveHoursTimer
	__end_of_clearTwelveHoursTimer:
;; =============== function _clearTwelveHoursTimer ends ============

	signat	_clearTwelveHoursTimer,88
	global	_ISR
psect	text865,local,class=CODE,delta=2
global __ptext865
__ptext865:

;; *************** function _ISR *****************
;; Defined at:
;;		line 647 in file "D:\develop\190625\AK7030-OTP\common.c"
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
;; Hardware stack levels required when called:    3
;; This function calls:
;;		_setAD_ConvertFlag
;;		_adc_get
;;		_vPutSampleDataIntoTable
;; This function is called by:
;;		Interrupt level 1
;; This function uses a non-reentrant model
;;
psect	text865
	file	"D:\develop\190625\AK7030-OTP\common.c"
	line	647
	global	__size_of_ISR
	__size_of_ISR	equ	__end_of_ISR-_ISR
	
_ISR:	
	opt	stack 2
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
psect	text865
	line	651
	
i1l3584:	
;common.c: 648: static unsigned char ucTimer1sCnt = 0;
;common.c: 651: if(TMR1IF == 1)
	btfss	(96/8),(96)&7
	goto	u122_21
	goto	u122_20
u122_21:
	goto	i1l3606
u122_20:
	line	653
	
i1l3586:	
;common.c: 652: {
;common.c: 653: TMR1IF = 0 ;
	bcf	(96/8),(96)&7
	line	654
	
i1l3588:	
;common.c: 654: timer.timer10msStopWatch++;
	incf	(_timer),f
	line	655
;common.c: 655: ucTimer1sCnt++;
	incf	(ISR@ucTimer1sCnt),f
	line	659
	
i1l3590:	
;common.c: 659: if(ucTimer1sCnt >= 100)
	movlw	(064h)
	subwf	(ISR@ucTimer1sCnt),w
	skipc
	goto	u123_21
	goto	u123_20
u123_21:
	goto	i1l3606
u123_20:
	line	661
	
i1l3592:	
;common.c: 660: {
;common.c: 661: ucTimer1sCnt = 0;
	clrf	(ISR@ucTimer1sCnt)
	line	662
	
i1l3594:	
;common.c: 662: if(uiBigTimer > 0)
	movf	(_uiBigTimer+1),w
	iorwf	(_uiBigTimer),w
	skipnz
	goto	u124_21
	goto	u124_20
u124_21:
	goto	i1l1639
u124_20:
	line	663
	
i1l3596:	
;common.c: 663: uiBigTimer--;
	movlw	low(01h)
	subwf	(_uiBigTimer),f
	movlw	high(01h)
	skipc
	decf	(_uiBigTimer+1),f
	subwf	(_uiBigTimer+1),f
	
i1l1639:	
	line	665
;common.c: 665: if(uiSmallTimer)
	movf	(_uiSmallTimer+1),w
	iorwf	(_uiSmallTimer),w
	skipnz
	goto	u125_21
	goto	u125_20
u125_21:
	goto	i1l1640
u125_20:
	line	666
	
i1l3598:	
;common.c: 666: uiSmallTimer--;
	movlw	low(01h)
	subwf	(_uiSmallTimer),f
	movlw	high(01h)
	skipc
	decf	(_uiSmallTimer+1),f
	subwf	(_uiSmallTimer+1),f
	
i1l1640:	
	line	668
;common.c: 668: if(uiTwentySecondsTimer)
	movf	(_uiTwentySecondsTimer+1),w
	iorwf	(_uiTwentySecondsTimer),w
	skipnz
	goto	u126_21
	goto	u126_20
u126_21:
	goto	i1l1641
u126_20:
	line	669
	
i1l3600:	
;common.c: 669: uiTwentySecondsTimer--;
	movlw	low(01h)
	subwf	(_uiTwentySecondsTimer),f
	movlw	high(01h)
	skipc
	decf	(_uiTwentySecondsTimer+1),f
	subwf	(_uiTwentySecondsTimer+1),f
	
i1l1641:	
	line	671
;common.c: 671: if(uiTwentyMinTimer)
	movf	(_uiTwentyMinTimer+1),w
	iorwf	(_uiTwentyMinTimer),w
	skipnz
	goto	u127_21
	goto	u127_20
u127_21:
	goto	i1l1642
u127_20:
	line	672
	
i1l3602:	
;common.c: 672: uiTwentyMinTimer--;
	movlw	low(01h)
	subwf	(_uiTwentyMinTimer),f
	movlw	high(01h)
	skipc
	decf	(_uiTwentyMinTimer+1),f
	subwf	(_uiTwentyMinTimer+1),f
	
i1l1642:	
	line	674
;common.c: 674: if( uiOneHourTimer )
	movf	(_uiOneHourTimer+1),w
	iorwf	(_uiOneHourTimer),w
	skipnz
	goto	u128_21
	goto	u128_20
u128_21:
	goto	i1l3606
u128_20:
	line	675
	
i1l3604:	
;common.c: 675: uiOneHourTimer--;
	movlw	low(01h)
	subwf	(_uiOneHourTimer),f
	movlw	high(01h)
	skipc
	decf	(_uiOneHourTimer+1),f
	subwf	(_uiOneHourTimer+1),f
	line	679
	
i1l3606:	
;common.c: 676: }
;common.c: 677: }
;common.c: 679: if(ADIF)
	btfss	(106/8),(106)&7
	goto	u129_21
	goto	u129_20
u129_21:
	goto	i1l1647
u129_20:
	line	682
	
i1l3608:	
;common.c: 680: {
;common.c: 682: ADIF=0;
	bcf	(106/8),(106)&7
	line	683
	
i1l3610:	
;common.c: 683: setAD_ConvertFlag(1);
	movlw	(01h)
	fcall	_setAD_ConvertFlag
	line	685
	
i1l3612:	
;common.c: 685: if(sampleChannelSelect == 12)
	movf	(_sampleChannelSelect),w
	xorlw	0Ch
	skipz
	goto	u130_21
	goto	u130_20
u130_21:
	goto	i1l3616
u130_20:
	line	687
	
i1l3614:	
;common.c: 686: {
;common.c: 687: vPutSampleDataIntoTable(adc_get(),12);
	fcall	_adc_get
	movf	(1+(?_adc_get)),w
	bcf	status, 5	;RP0=0, select bank0
	movwf	(?_vPutSampleDataIntoTable+1)
	movf	(0+(?_adc_get)),w
	movwf	(?_vPutSampleDataIntoTable)
	movlw	(0Ch)
	movwf	0+(?_vPutSampleDataIntoTable)+02h
	fcall	_vPutSampleDataIntoTable
	line	688
;common.c: 688: }
	goto	i1l1647
	line	691
	
i1l3616:	
;common.c: 689: else
;common.c: 690: {
;common.c: 691: vPutSampleDataIntoTable(adc_get(),13);
	fcall	_adc_get
	movf	(1+(?_adc_get)),w
	bcf	status, 5	;RP0=0, select bank0
	movwf	(?_vPutSampleDataIntoTable+1)
	movf	(0+(?_adc_get)),w
	movwf	(?_vPutSampleDataIntoTable)
	movlw	(0Dh)
	movwf	0+(?_vPutSampleDataIntoTable)+02h
	fcall	_vPutSampleDataIntoTable
	line	695
	
i1l1647:	
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
psect	text866,local,class=CODE,delta=2
global __ptext866
__ptext866:

;; *************** function _vPutSampleDataIntoTable *****************
;; Defined at:
;;		line 200 in file "D:\develop\190625\AK7030-OTP\common.c"
;; Parameters:    Size  Location     Type
;;  uiSampleData    2    0[BANK0 ] unsigned int 
;;  channel         1    2[BANK0 ] unsigned char 
;; Auto vars:     Size  Location     Type
;;  uiCalWidth      2    3[BANK0 ] unsigned int 
;;  i               2    5[BANK0 ] int 
;; Return value:  Size  Location     Type
;;		None               void
;; Registers used:
;;		wreg, fsr0l, fsr0h, status,2, status,0, btemp+1, pclath, cstack
;; Tracked objects:
;;		On entry : 60/0
;;		On exit  : 0/0
;;		Unchanged: FFE00/0
;; Data sizes:     COMMON   BANK0   BANK1   BANK3   BANK2
;;      Params:         0       3       0       0       0
;;      Locals:         0       4       0       0       0
;;      Temps:          0       0       0       0       0
;;      Totals:         0       7       0       0       0
;;Total ram usage:        7 bytes
;; Hardware stack levels used:    1
;; Hardware stack levels required when called:    2
;; This function calls:
;;		_disable_AD_interrupt
;;		_FilterCh12
;;		_setPWM_Width
;;		_switchSampleChannel
;;		_enable_AD_interrupt
;; This function is called by:
;;		_ISR
;; This function uses a non-reentrant model
;;
psect	text866
	file	"D:\develop\190625\AK7030-OTP\common.c"
	line	200
	global	__size_of_vPutSampleDataIntoTable
	__size_of_vPutSampleDataIntoTable	equ	__end_of_vPutSampleDataIntoTable-_vPutSampleDataIntoTable
	
_vPutSampleDataIntoTable:	
	opt	stack 2
; Regs used in _vPutSampleDataIntoTable: [wreg-fsr0h+status,2+status,0+btemp+1+pclath+cstack]
	line	206
	
i1l3510:	
;common.c: 202: static unsigned char ucCh12Length = 0;
;common.c: 204: static unsigned char ucCh13Length = 0;
;common.c: 206: if(channel == 12)
	movf	(vPutSampleDataIntoTable@channel),w
	xorlw	0Ch
	skipz
	goto	u110_21
	goto	u110_20
u110_21:
	goto	i1l3544
u110_20:
	line	208
	
i1l3512:	
;common.c: 207: {
;common.c: 208: if(ucCh12Length < 30)
	movlw	(01Eh)
	subwf	(vPutSampleDataIntoTable@ucCh12Length),w
	skipnc
	goto	u111_21
	goto	u111_20
u111_21:
	goto	i1l1525
u111_20:
	line	210
	
i1l3514:	
;common.c: 209: {
;common.c: 210: uiSampleCh12[ucCh12Length] = uiSampleData;
	clrc
	rlf	(vPutSampleDataIntoTable@ucCh12Length),w
	addlw	_uiSampleCh12&0ffh
	movwf	fsr0
	movf	(vPutSampleDataIntoTable@uiSampleData),w
	bsf	status, 7	;select IRP bank3
	movwf	indf
	incf	fsr0,f
	movf	(vPutSampleDataIntoTable@uiSampleData+1),w
	movwf	indf
	line	212
	
i1l3516:	
;common.c: 212: ucCh12Length++;
	incf	(vPutSampleDataIntoTable@ucCh12Length),f
	line	214
	
i1l3518:	
;common.c: 214: if( 30 == ucCh12Length )
	movf	(vPutSampleDataIntoTable@ucCh12Length),w
	xorlw	01Eh
	skipz
	goto	u112_21
	goto	u112_20
u112_21:
	goto	i1l1525
u112_20:
	line	216
	
i1l3520:	
;common.c: 215: {
;common.c: 216: ucCh12Length = 0;
	clrf	(vPutSampleDataIntoTable@ucCh12Length)
	line	222
	
i1l3522:	
;common.c: 220: static unsigned char uiInitWidth = 75;
;common.c: 222: disable_AD_interrupt();
	fcall	_disable_AD_interrupt
	line	224
	
i1l3524:	
;common.c: 224: uiCalWidth = FilterCh12();
	fcall	_FilterCh12
	movf	(1+(?_FilterCh12)),w
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	movwf	(vPutSampleDataIntoTable@uiCalWidth+1)
	movf	(0+(?_FilterCh12)),w
	movwf	(vPutSampleDataIntoTable@uiCalWidth)
	line	226
	
i1l3526:	
;common.c: 226: if(uiCalWidth > 312)
	movlw	high(0139h)
	subwf	(vPutSampleDataIntoTable@uiCalWidth+1),w
	movlw	low(0139h)
	skipnz
	subwf	(vPutSampleDataIntoTable@uiCalWidth),w
	skipc
	goto	u113_21
	goto	u113_20
u113_21:
	goto	i1l3530
u113_20:
	line	230
	
i1l3528:	
;common.c: 227: {
;common.c: 230: uiInitWidth++;
	incf	(vPutSampleDataIntoTable@uiInitWidth),f
	line	231
;common.c: 231: }
	goto	i1l3534
	line	232
	
i1l3530:	
;common.c: 232: else if(uiCalWidth < 312)
	movlw	high(0138h)
	subwf	(vPutSampleDataIntoTable@uiCalWidth+1),w
	movlw	low(0138h)
	skipnz
	subwf	(vPutSampleDataIntoTable@uiCalWidth),w
	skipnc
	goto	u114_21
	goto	u114_20
u114_21:
	goto	i1l3534
u114_20:
	line	236
	
i1l3532:	
;common.c: 233: {
;common.c: 236: uiInitWidth--;
	decf	(vPutSampleDataIntoTable@uiInitWidth),f
	line	241
;common.c: 237: }
	
i1l3534:	
;common.c: 241: if(uiInitWidth > 249)
	movlw	(0FAh)
	subwf	(vPutSampleDataIntoTable@uiInitWidth),w
	skipc
	goto	u115_21
	goto	u115_20
u115_21:
	goto	i1l1515
u115_20:
	line	242
	
i1l3536:	
;common.c: 242: uiInitWidth = 249;
	movlw	(0F9h)
	movwf	(vPutSampleDataIntoTable@uiInitWidth)
	
i1l1515:	
	line	244
;common.c: 244: if(uiInitWidth < 75)
	movlw	(04Bh)
	subwf	(vPutSampleDataIntoTable@uiInitWidth),w
	skipnc
	goto	u116_21
	goto	u116_20
u116_21:
	goto	i1l3540
u116_20:
	line	245
	
i1l3538:	
;common.c: 245: uiInitWidth = 75;
	movlw	(04Bh)
	movwf	(vPutSampleDataIntoTable@uiInitWidth)
	line	249
	
i1l3540:	
;common.c: 249: setPWM_Width(uiInitWidth);
	movf	(vPutSampleDataIntoTable@uiInitWidth),w
	fcall	_setPWM_Width
	line	250
;common.c: 250: switchSampleChannel( 12 );
	movlw	(0Ch)
	fcall	_switchSampleChannel
	line	251
	
i1l3542:	
;common.c: 251: enable_AD_interrupt();
	fcall	_enable_AD_interrupt
	goto	i1l1525
	line	255
	
i1l3544:	
;common.c: 255: else if(channel == 13)
	movf	(vPutSampleDataIntoTable@channel),w
	xorlw	0Dh
	skipz
	goto	u117_21
	goto	u117_20
u117_21:
	goto	i1l3558
u117_20:
	line	257
	
i1l3546:	
;common.c: 256: {
;common.c: 257: if(ucCh13Length < 12)
	movlw	(0Ch)
	subwf	(vPutSampleDataIntoTable@ucCh13Length),w
	skipnc
	goto	u118_21
	goto	u118_20
u118_21:
	goto	i1l1525
u118_20:
	line	259
	
i1l3548:	
;common.c: 258: {
;common.c: 259: uiSampleCh13[ucCh13Length] = uiSampleData;
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
	line	261
	
i1l3550:	
;common.c: 261: ucCh13Length++;
	incf	(vPutSampleDataIntoTable@ucCh13Length),f
	line	262
	
i1l3552:	
;common.c: 262: if( 12 == ucCh13Length)
	movf	(vPutSampleDataIntoTable@ucCh13Length),w
	xorlw	0Ch
	skipz
	goto	u119_21
	goto	u119_20
u119_21:
	goto	i1l1525
u119_20:
	line	264
	
i1l3554:	
;common.c: 263: {
;common.c: 264: ucCh13Length = 0;
	clrf	(vPutSampleDataIntoTable@ucCh13Length)
	line	265
	
i1l3556:	
;common.c: 265: switchSampleChannel( 13 );
	movlw	(0Dh)
	fcall	_switchSampleChannel
	goto	i1l1525
	line	271
	
i1l3558:	
;common.c: 269: else
;common.c: 270: {
;common.c: 271: ucCh12Length = 0;
	clrf	(vPutSampleDataIntoTable@ucCh12Length)
	line	273
;common.c: 273: ucCh13Length = 0;
	clrf	(vPutSampleDataIntoTable@ucCh13Length)
	line	275
;common.c: 275: for(int i = 0;i < 30; i++)
	clrf	(vPutSampleDataIntoTable@i)
	clrf	(vPutSampleDataIntoTable@i+1)
	line	277
	
i1l3564:	
;common.c: 276: {
;common.c: 277: uiSampleCh12[i] = 0;
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	clrc
	rlf	(vPutSampleDataIntoTable@i),w
	addlw	_uiSampleCh12&0ffh
	movwf	fsr0
	bsf	status, 7	;select IRP bank3
	clrf	indf
	incf	fsr0,f
	clrf	indf
	line	279
;common.c: 279: uiSampleCh13[i] = 0;
	clrc
	rlf	(vPutSampleDataIntoTable@i),w
	addlw	_uiSampleCh13&0ffh
	movwf	fsr0
	bcf	status, 7	;select IRP bank1
	clrf	indf
	incf	fsr0,f
	clrf	indf
	line	275
	
i1l3566:	
	incf	(vPutSampleDataIntoTable@i),f
	skipnz
	incf	(vPutSampleDataIntoTable@i+1),f
	
i1l3568:	
	movf	(vPutSampleDataIntoTable@i+1),w
	xorlw	80h
	movwf	btemp+1
	movlw	(high(01Eh))^80h
	subwf	btemp+1,w
	skipz
	goto	u120_25
	movlw	low(01Eh)
	subwf	(vPutSampleDataIntoTable@i),w
u120_25:

	skipc
	goto	u120_21
	goto	u120_20
u120_21:
	goto	i1l3564
u120_20:
	line	283
	
i1l1525:	
	return
	opt stack 0
GLOBAL	__end_of_vPutSampleDataIntoTable
	__end_of_vPutSampleDataIntoTable:
;; =============== function _vPutSampleDataIntoTable ends ============

	signat	_vPutSampleDataIntoTable,8312
	global	_switchSampleChannel
psect	text867,local,class=CODE,delta=2
global __ptext867
__ptext867:

;; *************** function _switchSampleChannel *****************
;; Defined at:
;;		line 365 in file "D:\develop\190625\AK7030-OTP\common.c"
;; Parameters:    Size  Location     Type
;;  ucCurrentCha    1    wreg     unsigned char 
;; Auto vars:     Size  Location     Type
;;  ucCurrentCha    1    3[COMMON] unsigned char 
;; Return value:  Size  Location     Type
;;		None               void
;; Registers used:
;;		wreg, status,2, status,0, pclath, cstack
;; Tracked objects:
;;		On entry : 60/100
;;		On exit  : 60/120
;;		Unchanged: FFF9F/0
;; Data sizes:     COMMON   BANK0   BANK1   BANK3   BANK2
;;      Params:         0       0       0       0       0
;;      Locals:         1       0       0       0       0
;;      Temps:          0       0       0       0       0
;;      Totals:         1       0       0       0       0
;;Total ram usage:        1 bytes
;; Hardware stack levels used:    1
;; Hardware stack levels required when called:    1
;; This function calls:
;;		i1_adc_test_init
;; This function is called by:
;;		_vPutSampleDataIntoTable
;; This function uses a non-reentrant model
;;
psect	text867
	file	"D:\develop\190625\AK7030-OTP\common.c"
	line	365
	global	__size_of_switchSampleChannel
	__size_of_switchSampleChannel	equ	__end_of_switchSampleChannel-_switchSampleChannel
	
_switchSampleChannel:	
	opt	stack 2
; Regs used in _switchSampleChannel: [wreg+status,2+status,0+pclath+cstack]
;switchSampleChannel@ucCurrentChannel stored from wreg
	movwf	(switchSampleChannel@ucCurrentChannel)
	line	366
	
i1l3572:	
;common.c: 366: if(12 == ucCurrentChannel)
	movf	(switchSampleChannel@ucCurrentChannel),w
	xorlw	0Ch
	skipz
	goto	u121_21
	goto	u121_20
u121_21:
	goto	i1l3578
u121_20:
	line	368
	
i1l3574:	
;common.c: 367: {
;common.c: 368: sampleChannelSelect = 13;
	movlw	(0Dh)
	movwf	(_sampleChannelSelect)
	line	369
	
i1l3576:	
;common.c: 369: adc_test_init(13,3);
	movlw	(03h)
	movwf	(?i1_adc_test_init)
	movlw	(0Dh)
	fcall	i1_adc_test_init
	line	370
;common.c: 370: }
	goto	i1l1554
	line	373
	
i1l3578:	
;common.c: 371: else
;common.c: 372: {
;common.c: 373: sampleChannelSelect = 12;
	movlw	(0Ch)
	movwf	(_sampleChannelSelect)
	line	374
	
i1l3580:	
;common.c: 374: adc_test_init(12,3);
	movlw	(03h)
	movwf	(?i1_adc_test_init)
	movlw	(0Ch)
	fcall	i1_adc_test_init
	line	377
	
i1l1554:	
	return
	opt stack 0
GLOBAL	__end_of_switchSampleChannel
	__end_of_switchSampleChannel:
;; =============== function _switchSampleChannel ends ============

	signat	_switchSampleChannel,4216
	global	i1_adc_test_init
psect	text868,local,class=CODE,delta=2
global __ptext868
__ptext868:

;; *************** function i1_adc_test_init *****************
;; Defined at:
;;		line 85 in file "D:\develop\190625\AK7030-OTP\periph.c"
;; Parameters:    Size  Location     Type
;;  adc_test_ini    1    wreg     unsigned char 
;;  adc_test_ini    1    0[COMMON] unsigned char 
;; Auto vars:     Size  Location     Type
;;  adc_test_ini    1    2[COMMON] unsigned char 
;; Return value:  Size  Location     Type
;;		None               void
;; Registers used:
;;		wreg, status,2, status,0
;; Tracked objects:
;;		On entry : 60/100
;;		On exit  : 60/120
;;		Unchanged: FFF9F/0
;; Data sizes:     COMMON   BANK0   BANK1   BANK3   BANK2
;;      Params:         1       0       0       0       0
;;      Locals:         1       0       0       0       0
;;      Temps:          1       0       0       0       0
;;      Totals:         3       0       0       0       0
;;Total ram usage:        3 bytes
;; Hardware stack levels used:    1
;; This function calls:
;;		Nothing
;; This function is called by:
;;		_switchSampleChannel
;; This function uses a non-reentrant model
;;
psect	text868
	file	"D:\develop\190625\AK7030-OTP\periph.c"
	line	85
	global	__size_ofi1_adc_test_init
	__size_ofi1_adc_test_init	equ	__end_ofi1_adc_test_init-i1_adc_test_init
	
i1_adc_test_init:	
	opt	stack 2
; Regs used in i1_adc_test_init: [wreg+status,2+status,0]
;i1adc_test_init@channel stored from wreg
	movwf	(i1adc_test_init@channel)
	line	86
	
i1l3622:	
;periph.c: 86: ADCON0 = 0x00;
	clrf	(31)	;volatile
	line	87
	
i1l3624:	
;periph.c: 87: ADCON0|=channel<<2;
	movf	(i1adc_test_init@channel),w
	movwf	(??i1_adc_test_init+0)+0
	clrc
	rlf	(??i1_adc_test_init+0)+0,f
	clrc
	rlf	(??i1_adc_test_init+0)+0,w
	iorwf	(31),f	;volatile
	line	89
	
i1l3626:	
;periph.c: 89: ADCON1|=ref<<6;
	movf	(i1adc_test_init@ref),w
	movwf	(??i1_adc_test_init+0)+0
	rrf	(??i1_adc_test_init+0)+0,f
	rrf	(??i1_adc_test_init+0)+0,f
	rrf	(??i1_adc_test_init+0)+0,w
	andlw	0c0h
	bsf	status, 5	;RP0=1, select bank1
	iorwf	(159)^080h,f	;volatile
	line	90
	
i1l3628:	
;periph.c: 90: ADON=1;
	bcf	status, 5	;RP0=0, select bank0
	bsf	(248/8),(248)&7
	line	91
	
i1l3630:	
;periph.c: 91: ADIE=1;
	bsf	status, 5	;RP0=1, select bank1
	bsf	(1130/8)^080h,(1130)&7
	line	92
	
i1l2294:	
	return
	opt stack 0
GLOBAL	__end_ofi1_adc_test_init
	__end_ofi1_adc_test_init:
;; =============== function i1_adc_test_init ends ============

	signat	i1_adc_test_init,88
	global	_adc_get
psect	text869,local,class=CODE,delta=2
global __ptext869
__ptext869:

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
psect	text869
	file	"D:\develop\190625\AK7030-OTP\periph.c"
	line	106
	global	__size_of_adc_get
	__size_of_adc_get	equ	__end_of_adc_get-_adc_get
	
_adc_get:	
	opt	stack 4
; Regs used in _adc_get: [wreg]
	line	108
	
i1l3618:	
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
	
i1l2303:	
	return
	opt stack 0
GLOBAL	__end_of_adc_get
	__end_of_adc_get:
;; =============== function _adc_get ends ============

	signat	_adc_get,90
	global	_setAD_ConvertFlag
psect	text870,local,class=CODE,delta=2
global __ptext870
__ptext870:

;; *************** function _setAD_ConvertFlag *****************
;; Defined at:
;;		line 321 in file "D:\develop\190625\AK7030-OTP\common.c"
;; Parameters:    Size  Location     Type
;;  flag            1    wreg     unsigned char 
;; Auto vars:     Size  Location     Type
;;  flag            1    0[COMMON] unsigned char 
;; Return value:  Size  Location     Type
;;		None               void
;; Registers used:
;;		wreg
;; Tracked objects:
;;		On entry : 60/0
;;		On exit  : 60/0
;;		Unchanged: FFFFFF9F/0
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
psect	text870
	file	"D:\develop\190625\AK7030-OTP\common.c"
	line	321
	global	__size_of_setAD_ConvertFlag
	__size_of_setAD_ConvertFlag	equ	__end_of_setAD_ConvertFlag-_setAD_ConvertFlag
	
_setAD_ConvertFlag:	
	opt	stack 4
; Regs used in _setAD_ConvertFlag: [wreg]
	line	323
	
i1l1543:	
	return
	opt stack 0
GLOBAL	__end_of_setAD_ConvertFlag
	__end_of_setAD_ConvertFlag:
;; =============== function _setAD_ConvertFlag ends ============

	signat	_setAD_ConvertFlag,4216
	global	_enable_AD_interrupt
psect	text871,local,class=CODE,delta=2
global __ptext871
__ptext871:

;; *************** function _enable_AD_interrupt *****************
;; Defined at:
;;		line 118 in file "D:\develop\190625\AK7030-OTP\periph.c"
;; Parameters:    Size  Location     Type
;;		None
;; Auto vars:     Size  Location     Type
;;		None
;; Return value:  Size  Location     Type
;;		None               void
;; Registers used:
;;		None
;; Tracked objects:
;;		On entry : 160/120
;;		On exit  : 160/120
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
psect	text871
	file	"D:\develop\190625\AK7030-OTP\periph.c"
	line	118
	global	__size_of_enable_AD_interrupt
	__size_of_enable_AD_interrupt	equ	__end_of_enable_AD_interrupt-_enable_AD_interrupt
	
_enable_AD_interrupt:	
	opt	stack 3
; Regs used in _enable_AD_interrupt: []
	line	119
	
i1l3582:	
;periph.c: 119: ADIE = 1;
	bsf	(1130/8)^080h,(1130)&7
	line	120
	
i1l2309:	
	return
	opt stack 0
GLOBAL	__end_of_enable_AD_interrupt
	__end_of_enable_AD_interrupt:
;; =============== function _enable_AD_interrupt ends ============

	signat	_enable_AD_interrupt,88
	global	_disable_AD_interrupt
psect	text872,local,class=CODE,delta=2
global __ptext872
__ptext872:

;; *************** function _disable_AD_interrupt *****************
;; Defined at:
;;		line 113 in file "D:\develop\190625\AK7030-OTP\periph.c"
;; Parameters:    Size  Location     Type
;;		None
;; Auto vars:     Size  Location     Type
;;		None
;; Return value:  Size  Location     Type
;;		None               void
;; Registers used:
;;		None
;; Tracked objects:
;;		On entry : 160/100
;;		On exit  : 160/120
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
psect	text872
	file	"D:\develop\190625\AK7030-OTP\periph.c"
	line	113
	global	__size_of_disable_AD_interrupt
	__size_of_disable_AD_interrupt	equ	__end_of_disable_AD_interrupt-_disable_AD_interrupt
	
_disable_AD_interrupt:	
	opt	stack 3
; Regs used in _disable_AD_interrupt: []
	line	114
	
i1l3570:	
;periph.c: 114: ADIE = 0;
	bsf	status, 5	;RP0=1, select bank1
	bcf	(1130/8)^080h,(1130)&7
	line	115
	
i1l2306:	
	return
	opt stack 0
GLOBAL	__end_of_disable_AD_interrupt
	__end_of_disable_AD_interrupt:
;; =============== function _disable_AD_interrupt ends ============

	signat	_disable_AD_interrupt,88
	global	_FilterCh12
psect	text873,local,class=CODE,delta=2
global __ptext873
__ptext873:

;; *************** function _FilterCh12 *****************
;; Defined at:
;;		line 134 in file "D:\develop\190625\AK7030-OTP\common.c"
;; Parameters:    Size  Location     Type
;;		None
;; Auto vars:     Size  Location     Type
;;  filter_sum      2    9[COMMON] unsigned int 
;;  filter_temp     2    7[COMMON] unsigned int 
;;  i               1   12[COMMON] unsigned char 
;;  j               1   11[COMMON] unsigned char 
;; Return value:  Size  Location     Type
;;                  2    0[COMMON] unsigned int 
;; Registers used:
;;		wreg, fsr0l, fsr0h, status,2, status,0
;; Tracked objects:
;;		On entry : 160/120
;;		On exit  : 100/100
;;		Unchanged: FFE00/0
;; Data sizes:     COMMON   BANK0   BANK1   BANK3   BANK2
;;      Params:         2       0       0       0       0
;;      Locals:         6       0       0       0       0
;;      Temps:          5       0       0       0       0
;;      Totals:        13       0       0       0       0
;;Total ram usage:       13 bytes
;; Hardware stack levels used:    1
;; This function calls:
;;		Nothing
;; This function is called by:
;;		_vPutSampleDataIntoTable
;; This function uses a non-reentrant model
;;
psect	text873
	file	"D:\develop\190625\AK7030-OTP\common.c"
	line	134
	global	__size_of_FilterCh12
	__size_of_FilterCh12	equ	__end_of_FilterCh12-_FilterCh12
	
_FilterCh12:	
	opt	stack 3
; Regs used in _FilterCh12: [wreg-fsr0h+status,2+status,0]
	line	149
	
i1l3476:	
	clrf	(FilterCh12@j)
	line	151
;common.c: 151: unsigned int filter_temp = 0, filter_sum = 0;
	clrf	(FilterCh12@filter_temp)
	clrf	(FilterCh12@filter_temp+1)
	clrf	(FilterCh12@filter_sum)
	clrf	(FilterCh12@filter_sum+1)
	line	160
;common.c: 160: for(j = 0; j < 30 - 1; j++)
	clrf	(FilterCh12@j)
	line	162
	
i1l3482:	
;common.c: 161: {
;common.c: 162: for(i = 0; i < 30 - 1 - j; i++)
	clrf	(FilterCh12@i)
	goto	i1l3490
	line	164
	
i1l3484:	
;common.c: 163: {
;common.c: 164: if(uiSampleCh12[i] > uiSampleCh12[i + 1])
	clrc
	rlf	(FilterCh12@i),w
	addlw	_uiSampleCh12&0ffh
	movwf	fsr0
	bsf	status, 7	;select IRP bank3
	movf	indf,w
	movwf	(??_FilterCh12+0)+0+0
	incf	fsr0,f
	movf	indf,w
	movwf	(??_FilterCh12+0)+0+1
	clrc
	rlf	(FilterCh12@i),w
	addlw	_uiSampleCh12+02h&0ffh
	movwf	fsr0
	movf	indf,w
	movwf	(??_FilterCh12+2)+0+0
	incf	fsr0,f
	movf	indf,w
	movwf	(??_FilterCh12+2)+0+1
	movf	1+(??_FilterCh12+2)+0,w
	xorlw	80h
	movwf	(??_FilterCh12+4)+0
	movf	1+(??_FilterCh12+0)+0,w
	xorlw	80h
	subwf	(??_FilterCh12+4)+0,w
	skipz
	goto	u106_25
	movf	0+(??_FilterCh12+0)+0,w
	subwf	0+(??_FilterCh12+2)+0,w
u106_25:

	skipnc
	goto	u106_21
	goto	u106_20
u106_21:
	goto	i1l3488
u106_20:
	line	167
	
i1l3486:	
;common.c: 165: {
;common.c: 167: filter_temp = uiSampleCh12[i];
	clrc
	rlf	(FilterCh12@i),w
	addlw	_uiSampleCh12&0ffh
	movwf	fsr0
	bsf	status, 7	;select IRP bank3
	movf	indf,w
	movwf	(FilterCh12@filter_temp)
	incf	fsr0,f
	movf	indf,w
	movwf	(FilterCh12@filter_temp+1)
	line	169
;common.c: 169: uiSampleCh12[i] = uiSampleCh12[i + 1];
	clrc
	rlf	(FilterCh12@i),w
	addlw	_uiSampleCh12+02h&0ffh
	movwf	fsr0
	movf	indf,w
	movwf	(??_FilterCh12+0)+0+0
	incf	fsr0,f
	movf	indf,w
	movwf	(??_FilterCh12+0)+0+1
	clrc
	rlf	(FilterCh12@i),w
	addlw	_uiSampleCh12&0ffh
	movwf	fsr0
	movf	0+(??_FilterCh12+0)+0,w
	movwf	indf
	incf	fsr0,f
	movf	1+(??_FilterCh12+0)+0,w
	movwf	indf
	line	171
;common.c: 171: uiSampleCh12[i + 1] = filter_temp;
	clrc
	rlf	(FilterCh12@i),w
	addlw	_uiSampleCh12+02h&0ffh
	movwf	fsr0
	movf	(FilterCh12@filter_temp),w
	movwf	indf
	incf	fsr0,f
	movf	(FilterCh12@filter_temp+1),w
	movwf	indf
	line	162
	
i1l3488:	
	incf	(FilterCh12@i),f
	
i1l3490:	
	movlw	high(01Dh)
	movwf	(??_FilterCh12+0)+0+1
	movf	(FilterCh12@j),w
	sublw	low(01Dh)
	movwf	(??_FilterCh12+0)+0
	skipc
	decf	(??_FilterCh12+0)+0+1,f
	movf	1+(??_FilterCh12+0)+0,w
	xorlw	80h
	sublw	080h
	skipz
	goto	u107_25
	movf	0+(??_FilterCh12+0)+0,w
	subwf	(FilterCh12@i),w
u107_25:

	skipc
	goto	u107_21
	goto	u107_20
u107_21:
	goto	i1l3484
u107_20:
	line	160
	
i1l3492:	
	incf	(FilterCh12@j),f
	
i1l3494:	
	movlw	(01Dh)
	subwf	(FilterCh12@j),w
	skipc
	goto	u108_21
	goto	u108_20
u108_21:
	goto	i1l3482
u108_20:
	line	184
	
i1l3496:	
;common.c: 172: }
;common.c: 173: }
;common.c: 174: }
;common.c: 184: for(i = 7; i < 30 - 7; i++)
	movlw	(07h)
	movwf	(FilterCh12@i)
	line	186
	
i1l3500:	
;common.c: 185: {
;common.c: 186: filter_sum += uiSampleCh12[i];
	clrc
	rlf	(FilterCh12@i),w
	addlw	_uiSampleCh12&0ffh
	movwf	fsr0
	bsf	status, 7	;select IRP bank3
	movf	indf,w
	movwf	(??_FilterCh12+0)+0+0
	incf	fsr0,f
	movf	indf,w
	movwf	(??_FilterCh12+0)+0+1
	movf	0+(??_FilterCh12+0)+0,w
	addwf	(FilterCh12@filter_sum),f
	skipnc
	incf	(FilterCh12@filter_sum+1),f
	movf	1+(??_FilterCh12+0)+0,w
	addwf	(FilterCh12@filter_sum+1),f
	line	184
	
i1l3502:	
	incf	(FilterCh12@i),f
	
i1l3504:	
	movlw	(017h)
	subwf	(FilterCh12@i),w
	skipc
	goto	u109_21
	goto	u109_20
u109_21:
	goto	i1l3500
u109_20:
	line	194
	
i1l3506:	
;common.c: 187: }
;common.c: 194: return (filter_sum >> 4);
	movf	(FilterCh12@filter_sum+1),w
	movwf	(?_FilterCh12+1)
	movf	(FilterCh12@filter_sum),w
	movwf	(?_FilterCh12)
	swapf	(?_FilterCh12),f
	swapf	(?_FilterCh12+1),f
	movlw	0fh
	andwf	(?_FilterCh12),f
	movf	(?_FilterCh12+1),w
	andlw	0f0h
	iorwf	(?_FilterCh12),f
	movlw	0fh
	andwf	(?_FilterCh12+1),f
	line	196
	
i1l1499:	
	return
	opt stack 0
GLOBAL	__end_of_FilterCh12
	__end_of_FilterCh12:
;; =============== function _FilterCh12 ends ============

	signat	_FilterCh12,90
	global	_setPWM_Width
psect	text874,local,class=CODE,delta=2
global __ptext874
__ptext874:

;; *************** function _setPWM_Width *****************
;; Defined at:
;;		line 62 in file "D:\develop\190625\AK7030-OTP\common.c"
;; Parameters:    Size  Location     Type
;;  ucWidth         1    wreg     unsigned char 
;; Auto vars:     Size  Location     Type
;;  ucWidth         1    0[COMMON] unsigned char 
;; Return value:  Size  Location     Type
;;		None               void
;; Registers used:
;;		wreg
;; Tracked objects:
;;		On entry : 160/100
;;		On exit  : 160/100
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
psect	text874
	file	"D:\develop\190625\AK7030-OTP\common.c"
	line	62
	global	__size_of_setPWM_Width
	__size_of_setPWM_Width	equ	__end_of_setPWM_Width-_setPWM_Width
	
_setPWM_Width:	
	opt	stack 3
; Regs used in _setPWM_Width: [wreg]
;setPWM_Width@ucWidth stored from wreg
	line	65
	movwf	(setPWM_Width@ucWidth)
	
i1l3436:	
;common.c: 63: static unsigned char ucOldWidth = 0;
;common.c: 65: if( ucOldWidth != ucWidth)
	movf	(setPWM_Width@ucOldWidth),w
	xorwf	(setPWM_Width@ucWidth),w
	skipnz
	goto	u101_21
	goto	u101_20
u101_21:
	goto	i1l1477
u101_20:
	line	67
	
i1l3438:	
;common.c: 66: {
;common.c: 67: CCPR1L = ucWidth;
	movf	(setPWM_Width@ucWidth),w
	movwf	(21)	;volatile
	line	68
;common.c: 68: ucOldWidth = ucWidth;
	movf	(setPWM_Width@ucWidth),w
	movwf	(setPWM_Width@ucOldWidth)
	line	70
	
i1l1477:	
	return
	opt stack 0
GLOBAL	__end_of_setPWM_Width
	__end_of_setPWM_Width:
;; =============== function _setPWM_Width ends ============

	signat	_setPWM_Width,4216
psect	text875,local,class=CODE,delta=2
global __ptext875
__ptext875:
	global	btemp
	btemp set 07Eh

	DABS	1,126,2	;btemp
	global	wtemp0
	wtemp0 set btemp
	end
