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
# 70 "C:\190604\AK7030-OTP\main.c"
	psect config,class=CONFIG,delta=2 ;#
# 70 "C:\190604\AK7030-OTP\main.c"
	dw 0x2FFF & 0x3FFF & 0x3FFF & 0x3FFF & 0x3FFF & 0x3FFF ;#
# 71 "C:\190604\AK7030-OTP\main.c"
	psect config,class=CONFIG,delta=2 ;#
# 71 "C:\190604\AK7030-OTP\main.c"
	dw 0x3FFF & 0x3FDF & 0x3FFF & 0x3FFE ;#
# 72 "C:\190604\AK7030-OTP\main.c"
	psect config,class=CONFIG,delta=2 ;#
# 72 "C:\190604\AK7030-OTP\main.c"
	dw 0X3FFF & 0x3FFF & 0x3FFF & 0x3FF8 ;#
	FNCALL	_main,_initPin
	FNCALL	_main,_clock_config
	FNCALL	_main,_timer1_config
	FNCALL	_main,_timer1_interrupt_config
	FNCALL	_main,_adc_test_init
	FNCALL	_main,_dac_init
	FNCALL	_main,_op1_init
	FNCALL	_main,_op2_init
	FNCALL	_main,_adc_start
	FNCALL	_main,_isPermitSampleTime
	FNCALL	_main,_clrSampeTime
	FNCALL	_main,_process_AD_Converter_Value
	FNCALL	_main,_getAdOriginalCh14Value
	FNCALL	_main,_clearPinPortAndTimer
	FNCALL	_main,_getAdOriginalCh1Value
	FNCALL	_main,_startTwelveHourTimer
	FNCALL	_main,_isFinishedTwelveHoursTimer
	FNCALL	_main,_startTwentySecondsTimer
	FNCALL	_main,_getAdOriginaCh4Value
	FNCALL	_main,_isFinishedTwentySecondsTimer
	FNCALL	_main,_startThreeHoursTimer
	FNCALL	_main,_isFinishedThreeHoursTimer
	FNCALL	_main,_clearThreeHoursTimer
	FNCALL	_main,_clearAllTimer
	FNCALL	_process_AD_Converter_Value,_getAD_ConvertFlag
	FNCALL	_process_AD_Converter_Value,_setAD_ConvertFlag
	FNCALL	_process_AD_Converter_Value,_AD_Sample
	FNCALL	_process_AD_Converter_Value,_adc_test_init
	FNCALL	_process_AD_Converter_Value,_setAdcSampleChannel
	FNCALL	_process_AD_Converter_Value,_adc_start
	FNCALL	_clearPinPortAndTimer,_clearAllTimer
	FNCALL	_AD_Sample,_getAdOriginalValue
	FNCALL	_getAdOriginaCh4Value,_Filter
	FNCALL	_getAdOriginalCh1Value,_Filter
	FNCALL	_getAdOriginalCh14Value,_Filter
	FNCALL	_clearAllTimer,_clearTwelveHoursTimer
	FNCALL	_clearAllTimer,_clearThreeHoursTimer
	FNCALL	_clearAllTimer,_clearTwentySecondsTimer
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
	file	"C:\190604\AK7030-OTP\common.c"
	line	22

;initializer for _sampleChannelSelect
	retlw	0Eh
	global	_sampleTimes
	global	main@enumBranchStep
	global	main@enumMainLoopStep
	global	main@ucADC4_Step
	global	main@ucChannel4Type
	global	main@ucLoaderStep
	global	main@ucLoaderStep1
	global	main@ucLoaderStep2
	global	main@ucLoaderStep3
	global	main@ucLoaderStep4
	global	main@ucTimer1s
	global	main@ucTimerADC1ZeroP5s
	global	main@ucTimerDelay
	global	main@ucTimerDelay1
	global	main@ucTimerDelay2
	global	main@ucTimerDelay3
	global	main@ucTimerDelay4
	global	main@ucTimerRightP5s
	global	main@ucTimerZeroPoint3s
	global	main@ucTimerZeroPoint5s
	global	vPutSampleDataIntoTable@ucChannelFourteenthLength
	global	vPutSampleDataIntoTable@ucChannelFourthLength
	global	vPutSampleDataIntoTable@ucChannelFirstLength
	global	_buffer_Sample_AD_Value
	global	_adc_original_value
	global	_multiFilterMaxValue
	global	_multiFilterMinValue
	global	_uiBigTimer
	global	_uiSmallTimer
	global	_uiTwentySecondsTimer
	global	ISR@ucTimer1sCnt
	global	_adc_convert_flag
	global	_timer
	global	main@cTimer1s_809
	global	main@enumInteralStep
	global	main@ucTimer20s
	global	main@ucTimerP3s
	global	main@ucTimerX1P5s
	global	main@ucTimerX2P5s
	global	_uiSampleChannelFirst
	global	_uiSampleChannelFourteenth
	global	_uiSampleChannelFourth
	global	_ADCON0
_ADCON0	set	31
	global	_ADRESH
_ADRESH	set	30
	global	_OP1CON0
_OP1CON0	set	27
	global	_OP1CON1
_OP1CON1	set	28
	global	_OP1CON2
_OP1CON2	set	29
	global	_T1CON
_T1CON	set	16
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
	global	_PA0
_PA0	set	40
	global	_PA1
_PA1	set	41
	global	_PA2
_PA2	set	42
	global	_PA3
_PA3	set	43
	global	_PA6
_PA6	set	46
	global	_PA7
_PA7	set	47
	global	_PB0
_PB0	set	48
	global	_PB1
_PB1	set	49
	global	_PB6
_PB6	set	54
	global	_PEIE
_PEIE	set	94
	global	_TMR1IF
_TMR1IF	set	96
	global	_ADCON1
_ADCON1	set	159
	global	_ADRESL
_ADRESL	set	158
	global	_DACCON
_DACCON	set	135
	global	_DACR0
_DACR0	set	136
	global	_OP2CON0
_OP2CON0	set	155
	global	_OP2CON1
_OP2CON1	set	156
	global	_OP2CON2
_OP2CON2	set	157
	global	_ADIE
_ADIE	set	1130
	global	_TMR1IE
_TMR1IE	set	1120
	global	_TRISA0
_TRISA0	set	1064
	global	_TRISA1
_TRISA1	set	1065
	global	_TRISA2
_TRISA2	set	1066
	global	_TRISA3
_TRISA3	set	1067
	global	_TRISA6
_TRISA6	set	1070
	global	_TRISA7
_TRISA7	set	1071
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
	global	_TRISB6
_TRISB6	set	1078
	global	_TRISB7
_TRISB7	set	1079
	global	_CLKPR
_CLKPR	set	264
	global	_CLKPCE
_CLKPCE	set	2119
	global	_PAOD7
_PAOD7	set	3135
	global	_PBOD6
_PBOD6	set	3142
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
_sampleTimes:
       ds      1

main@enumBranchStep:
       ds      1

main@enumMainLoopStep:
       ds      1

main@ucADC4_Step:
       ds      1

main@ucChannel4Type:
       ds      1

main@ucLoaderStep:
       ds      1

main@ucLoaderStep1:
       ds      1

main@ucLoaderStep2:
       ds      1

main@ucLoaderStep3:
       ds      1

main@ucLoaderStep4:
       ds      1

main@ucTimer1s:
       ds      1

main@ucTimerADC1ZeroP5s:
       ds      1

main@ucTimerDelay:
       ds      1

main@ucTimerDelay1:
       ds      1

main@ucTimerDelay2:
       ds      1

main@ucTimerDelay3:
       ds      1

main@ucTimerDelay4:
       ds      1

main@ucTimerRightP5s:
       ds      1

main@ucTimerZeroPoint3s:
       ds      1

main@ucTimerZeroPoint5s:
       ds      1

vPutSampleDataIntoTable@ucChannelFourteenthLength:
       ds      1

vPutSampleDataIntoTable@ucChannelFourthLength:
       ds      1

psect	dataBANK0,class=BANK0,space=1
global __pdataBANK0
__pdataBANK0:
	file	"C:\190604\AK7030-OTP\common.c"
_sampleChannelSelect:
       ds      1

psect	bssBANK1,class=BANK1,space=1
global __pbssBANK1
__pbssBANK1:
_buffer_Sample_AD_Value:
       ds      12

_adc_original_value:
       ds      2

_multiFilterMaxValue:
       ds      2

_multiFilterMinValue:
       ds      2

_uiBigTimer:
       ds      2

_uiSmallTimer:
       ds      2

_uiTwentySecondsTimer:
       ds      2

ISR@ucTimer1sCnt:
       ds      1

_adc_convert_flag:
       ds      1

_timer:
       ds      1

main@cTimer1s_809:
       ds      1

main@enumInteralStep:
       ds      1

main@ucTimer20s:
       ds      1

main@ucTimerP3s:
       ds      1

main@ucTimerX1P5s:
       ds      1

main@ucTimerX2P5s:
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
	bcf	status, 7	;select IRP bank0
	movlw	low(__pbssBANK0)
	movwf	fsr
	movlw	low((__pbssBANK0)+016h)
	fcall	clear_ram
; Clear objects allocated to BANK1
psect cinit,class=CODE,delta=2
	movlw	low(__pbssBANK1)
	movwf	fsr
	movlw	low((__pbssBANK1)+049h)
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
	global	?_clearTwentySecondsTimer
?_clearTwentySecondsTimer:	; 0 bytes @ 0x0
	global	?_clock_config
?_clock_config:	; 0 bytes @ 0x0
	global	?_timer1_config
?_timer1_config:	; 0 bytes @ 0x0
	global	?_timer1_interrupt_config
?_timer1_interrupt_config:	; 0 bytes @ 0x0
	global	?_dac_init
?_dac_init:	; 0 bytes @ 0x0
	global	?_op1_init
?_op1_init:	; 0 bytes @ 0x0
	global	?_op2_init
?_op2_init:	; 0 bytes @ 0x0
	global	?_adc_start
?_adc_start:	; 0 bytes @ 0x0
	global	?_clrSampeTime
?_clrSampeTime:	; 0 bytes @ 0x0
	global	?_process_AD_Converter_Value
?_process_AD_Converter_Value:	; 0 bytes @ 0x0
	global	?_startTwentySecondsTimer
?_startTwentySecondsTimer:	; 0 bytes @ 0x0
	global	?_AD_Sample
?_AD_Sample:	; 0 bytes @ 0x0
	global	?_setAdcSampleChannel
?_setAdcSampleChannel:	; 0 bytes @ 0x0
	global	?_clearAllTimer
?_clearAllTimer:	; 0 bytes @ 0x0
	global	?_clearPinPortAndTimer
?_clearPinPortAndTimer:	; 0 bytes @ 0x0
	global	?_initPin
?_initPin:	; 0 bytes @ 0x0
	global	?_main
?_main:	; 0 bytes @ 0x0
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
	global	?_isFinishedTwelveHoursTimer
?_isFinishedTwelveHoursTimer:	; 1 bytes @ 0x0
	global	?_isFinishedTwentySecondsTimer
?_isFinishedTwentySecondsTimer:	; 1 bytes @ 0x0
	global	?_isFinishedThreeHoursTimer
?_isFinishedThreeHoursTimer:	; 1 bytes @ 0x0
	global	?_getAD_ConvertFlag
?_getAD_ConvertFlag:	; 1 bytes @ 0x0
	global	?_adc_get
?_adc_get:	; 2 bytes @ 0x0
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
	global	??_clearTwentySecondsTimer
??_clearTwentySecondsTimer:	; 0 bytes @ 0x0
	global	??_clock_config
??_clock_config:	; 0 bytes @ 0x0
	global	??_timer1_config
??_timer1_config:	; 0 bytes @ 0x0
	global	??_timer1_interrupt_config
??_timer1_interrupt_config:	; 0 bytes @ 0x0
	global	?_adc_test_init
?_adc_test_init:	; 0 bytes @ 0x0
	global	??_dac_init
??_dac_init:	; 0 bytes @ 0x0
	global	??_op1_init
??_op1_init:	; 0 bytes @ 0x0
	global	??_op2_init
??_op2_init:	; 0 bytes @ 0x0
	global	??_adc_start
??_adc_start:	; 0 bytes @ 0x0
	global	??_isPermitSampleTime
??_isPermitSampleTime:	; 0 bytes @ 0x0
	global	??_clrSampeTime
??_clrSampeTime:	; 0 bytes @ 0x0
	global	?_startTwelveHourTimer
?_startTwelveHourTimer:	; 0 bytes @ 0x0
	global	??_isFinishedTwelveHoursTimer
??_isFinishedTwelveHoursTimer:	; 0 bytes @ 0x0
	global	??_startTwentySecondsTimer
??_startTwentySecondsTimer:	; 0 bytes @ 0x0
	global	??_isFinishedTwentySecondsTimer
??_isFinishedTwentySecondsTimer:	; 0 bytes @ 0x0
	global	?_startThreeHoursTimer
?_startThreeHoursTimer:	; 0 bytes @ 0x0
	global	??_isFinishedThreeHoursTimer
??_isFinishedThreeHoursTimer:	; 0 bytes @ 0x0
	global	??_setAdcSampleChannel
??_setAdcSampleChannel:	; 0 bytes @ 0x0
	global	??_clearAllTimer
??_clearAllTimer:	; 0 bytes @ 0x0
	global	??_clearPinPortAndTimer
??_clearPinPortAndTimer:	; 0 bytes @ 0x0
	global	??_initPin
??_initPin:	; 0 bytes @ 0x0
	global	??_getAD_ConvertFlag
??_getAD_ConvertFlag:	; 0 bytes @ 0x0
	global	??_setAD_ConvertFlag
??_setAD_ConvertFlag:	; 0 bytes @ 0x0
	global	?_Filter
?_Filter:	; 2 bytes @ 0x0
	global	?_getAdOriginalValue
?_getAdOriginalValue:	; 2 bytes @ 0x0
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
	ds	1
	global	??_adc_test_init
??_adc_test_init:	; 0 bytes @ 0x1
	global	setAdcSampleChannel@ucChannel
setAdcSampleChannel@ucChannel:	; 1 bytes @ 0x1
	ds	1
	global	??_startTwelveHourTimer
??_startTwelveHourTimer:	; 0 bytes @ 0x2
	global	??_startThreeHoursTimer
??_startThreeHoursTimer:	; 0 bytes @ 0x2
	global	??_AD_Sample
??_AD_Sample:	; 0 bytes @ 0x2
	global	??_Filter
??_Filter:	; 0 bytes @ 0x2
	global	??_getAdOriginalValue
??_getAdOriginalValue:	; 0 bytes @ 0x2
	global	adc_test_init@channel
adc_test_init@channel:	; 1 bytes @ 0x2
	ds	2
	global	AD_Sample@index
AD_Sample@index:	; 1 bytes @ 0x4
	ds	1
	global	??_process_AD_Converter_Value
??_process_AD_Converter_Value:	; 0 bytes @ 0x5
	ds	1
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
	global	?_getAdOriginalCh14Value
?_getAdOriginalCh14Value:	; 2 bytes @ 0x36
	global	?_getAdOriginalCh1Value
?_getAdOriginalCh1Value:	; 2 bytes @ 0x36
	global	?_getAdOriginaCh4Value
?_getAdOriginaCh4Value:	; 2 bytes @ 0x36
	ds	2
	global	??_getAdOriginalCh14Value
??_getAdOriginalCh14Value:	; 0 bytes @ 0x38
	global	??_getAdOriginalCh1Value
??_getAdOriginalCh1Value:	; 0 bytes @ 0x38
	global	??_getAdOriginaCh4Value
??_getAdOriginaCh4Value:	; 0 bytes @ 0x38
	global	??_main
??_main:	; 0 bytes @ 0x38
;;Data sizes: Strings 0, constant 0, data 1, bss 176, persistent 0 stack 0
;;Auto spaces:   Size  Autos    Used
;; COMMON          14     13      14
;; BANK0           80     56      79
;; BANK1           80      0      73
;; BANK3           96      0      80
;; BANK2           96      0       0

;;
;; Pointer list with targets:

;; ?_adc_get	unsigned int  size(1) Largest target is 0
;;
;; ?_getAdOriginalCh14Value	unsigned int  size(1) Largest target is 0
;;
;; ?_getAdOriginaCh4Value	unsigned int  size(1) Largest target is 0
;;
;; ?_getAdOriginalCh1Value	unsigned int  size(1) Largest target is 0
;;
;; ?_getAdOriginalValue	unsigned int  size(1) Largest target is 0
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
;;   _main->_getAdOriginalCh14Value
;;   _main->_getAdOriginalCh1Value
;;   _main->_getAdOriginaCh4Value
;;   _process_AD_Converter_Value->_AD_Sample
;;   _AD_Sample->_getAdOriginalValue
;;   _getAdOriginaCh4Value->_Filter
;;   _getAdOriginalCh1Value->_Filter
;;   _getAdOriginalCh14Value->_Filter
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
;; (0) _main                                                 0     0      0    2104
;;                            _initPin
;;                       _clock_config
;;                      _timer1_config
;;            _timer1_interrupt_config
;;                      _adc_test_init
;;                           _dac_init
;;                           _op1_init
;;                           _op2_init
;;                          _adc_start
;;                 _isPermitSampleTime
;;                       _clrSampeTime
;;         _process_AD_Converter_Value
;;             _getAdOriginalCh14Value
;;               _clearPinPortAndTimer
;;              _getAdOriginalCh1Value
;;               _startTwelveHourTimer
;;         _isFinishedTwelveHoursTimer
;;            _startTwentySecondsTimer
;;               _getAdOriginaCh4Value
;;       _isFinishedTwentySecondsTimer
;;               _startThreeHoursTimer
;;          _isFinishedThreeHoursTimer
;;               _clearThreeHoursTimer
;;                      _clearAllTimer
;; ---------------------------------------------------------------------------------
;; (1) _process_AD_Converter_Value                           0     0      0     156
;;                  _getAD_ConvertFlag
;;                  _setAD_ConvertFlag
;;                          _AD_Sample
;;                      _adc_test_init
;;                _setAdcSampleChannel
;;                          _adc_start
;; ---------------------------------------------------------------------------------
;; (1) _clearPinPortAndTimer                                 0     0      0       0
;;                      _clearAllTimer
;; ---------------------------------------------------------------------------------
;; (2) _AD_Sample                                            3     3      0      68
;;                                              2 BANK0      3     3      0
;;                 _getAdOriginalValue
;; ---------------------------------------------------------------------------------
;; (1) _getAdOriginaCh4Value                                 2     0      2     620
;;                                             54 BANK0      2     0      2
;;                             _Filter
;; ---------------------------------------------------------------------------------
;; (1) _getAdOriginalCh1Value                                2     0      2     620
;;                                             54 BANK0      2     0      2
;;                             _Filter
;; ---------------------------------------------------------------------------------
;; (1) _getAdOriginalCh14Value                               2     0      2     620
;;                                             54 BANK0      2     0      2
;;                             _Filter
;; ---------------------------------------------------------------------------------
;; (1) _clearAllTimer                                        0     0      0       0
;;              _clearTwelveHoursTimer
;;               _clearThreeHoursTimer
;;            _clearTwentySecondsTimer
;; ---------------------------------------------------------------------------------
;; (2) _setAdcSampleChannel                                  2     2      0      22
;;                                              0 BANK0      2     2      0
;; ---------------------------------------------------------------------------------
;; (3) _getAdOriginalValue                                   2     0      2       0
;;                                              0 BANK0      2     0      2
;; ---------------------------------------------------------------------------------
;; (2) _setAD_ConvertFlag                                    1     1      0      22
;;                                              0 BANK0      1     1      0
;; ---------------------------------------------------------------------------------
;; (2) _getAD_ConvertFlag                                    0     0      0       0
;; ---------------------------------------------------------------------------------
;; (2) _Filter                                              54    52      2     620
;;                                              0 BANK0     54    52      2
;; ---------------------------------------------------------------------------------
;; (1) _isFinishedThreeHoursTimer                            0     0      0       0
;; ---------------------------------------------------------------------------------
;; (1) _startThreeHoursTimer                                 2     0      2      22
;;                                              0 BANK0      2     0      2
;; ---------------------------------------------------------------------------------
;; (1) _isFinishedTwentySecondsTimer                         0     0      0       0
;; ---------------------------------------------------------------------------------
;; (1) _startTwentySecondsTimer                              0     0      0       0
;; ---------------------------------------------------------------------------------
;; (1) _isFinishedTwelveHoursTimer                           0     0      0       0
;; ---------------------------------------------------------------------------------
;; (1) _startTwelveHourTimer                                 2     0      2      22
;;                                              0 BANK0      2     0      2
;; ---------------------------------------------------------------------------------
;; (1) _clrSampeTime                                         0     0      0       0
;; ---------------------------------------------------------------------------------
;; (1) _isPermitSampleTime                                   0     0      0       0
;; ---------------------------------------------------------------------------------
;; (2) _adc_start                                            0     0      0       0
;; ---------------------------------------------------------------------------------
;; (1) _op2_init                                             0     0      0       0
;; ---------------------------------------------------------------------------------
;; (1) _op1_init                                             0     0      0       0
;; ---------------------------------------------------------------------------------
;; (1) _dac_init                                             0     0      0       0
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
;; (1) _initPin                                              0     0      0       0
;; ---------------------------------------------------------------------------------
;; (2) _clearTwentySecondsTimer                              0     0      0       0
;; ---------------------------------------------------------------------------------
;; (2) _clearThreeHoursTimer                                 0     0      0       0
;; ---------------------------------------------------------------------------------
;; (2) _clearTwelveHoursTimer                                0     0      0       0
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
;;   _clock_config
;;   _timer1_config
;;   _timer1_interrupt_config
;;   _adc_test_init
;;   _dac_init
;;   _op1_init
;;   _op2_init
;;   _adc_start
;;   _isPermitSampleTime
;;   _clrSampeTime
;;   _process_AD_Converter_Value
;;     _getAD_ConvertFlag
;;     _setAD_ConvertFlag
;;     _AD_Sample
;;       _getAdOriginalValue
;;     _adc_test_init
;;     _setAdcSampleChannel
;;     _adc_start
;;   _getAdOriginalCh14Value
;;     _Filter
;;   _clearPinPortAndTimer
;;     _clearAllTimer
;;       _clearTwelveHoursTimer
;;       _clearThreeHoursTimer
;;       _clearTwentySecondsTimer
;;   _getAdOriginalCh1Value
;;     _Filter
;;   _startTwelveHourTimer
;;   _isFinishedTwelveHoursTimer
;;   _startTwentySecondsTimer
;;   _getAdOriginaCh4Value
;;     _Filter
;;   _isFinishedTwentySecondsTimer
;;   _startThreeHoursTimer
;;   _isFinishedThreeHoursTimer
;;   _clearThreeHoursTimer
;;   _clearAllTimer
;;     _clearTwelveHoursTimer
;;     _clearThreeHoursTimer
;;     _clearTwentySecondsTimer
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
;;BANK1               50      0      49       8       91.3%
;;BITBANK1            50      0       0       7        0.0%
;;CODE                 0      0       0       0        0.0%
;;DATA                 0      0      FD       6        0.0%
;;ABS                  0      0      F6       3        0.0%
;;NULL                 0      0       0       0        0.0%
;;STACK                0      0       7       2        0.0%
;;BANK0               50     38      4F       5       98.8%
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
;;		line 129 in file "C:\190604\AK7030-OTP\main.c"
;; Parameters:    Size  Location     Type
;;		None
;; Auto vars:     Size  Location     Type
;;		None
;; Return value:  Size  Location     Type
;;		None               void
;; Registers used:
;;		wreg, fsr0l, fsr0h, status,2, status,0, btemp+1, pclath, cstack
;; Tracked objects:
;;		On entry : 17F/0
;;		On exit  : 60/0
;;		Unchanged: FFE00/0
;; Data sizes:     COMMON   BANK0   BANK1   BANK3   BANK2
;;      Params:         0       0       0       0       0
;;      Locals:         0       0       0       0       0
;;      Temps:          0       0       0       0       0
;;      Totals:         0       0       0       0       0
;;Total ram usage:        0 bytes
;; Hardware stack levels required when called:    5
;; This function calls:
;;		_initPin
;;		_clock_config
;;		_timer1_config
;;		_timer1_interrupt_config
;;		_adc_test_init
;;		_dac_init
;;		_op1_init
;;		_op2_init
;;		_adc_start
;;		_isPermitSampleTime
;;		_clrSampeTime
;;		_process_AD_Converter_Value
;;		_getAdOriginalCh14Value
;;		_clearPinPortAndTimer
;;		_getAdOriginalCh1Value
;;		_startTwelveHourTimer
;;		_isFinishedTwelveHoursTimer
;;		_startTwentySecondsTimer
;;		_getAdOriginaCh4Value
;;		_isFinishedTwentySecondsTimer
;;		_startThreeHoursTimer
;;		_isFinishedThreeHoursTimer
;;		_clearThreeHoursTimer
;;		_clearAllTimer
;; This function is called by:
;;		Startup code after reset
;; This function uses a non-reentrant model
;;
psect	maintext
	file	"C:\190604\AK7030-OTP\main.c"
	line	129
	global	__size_of_main
	__size_of_main	equ	__end_of_main-_main
	
_main:	
	opt	stack 3
; Regs used in _main: [wreg-fsr0h+status,2+status,0+btemp+1+pclath+cstack]
	line	150
	
l4188:	
;main.c: 130: enum setp_Adc4
;main.c: 131: {
;main.c: 132: ADC4_STEP_INIT = 0,
;main.c: 133: ADC4_STEP_FIRST,
;main.c: 134: ADC4_STEP_SECOND,
;main.c: 135: ADC4_STEP_THIRD,
;main.c: 136: ADC4_STEP_FOURTH,
;main.c: 137: ADC4_STEP_FIFTH,
;main.c: 138: ADC4_STEP_SIXTH,
;main.c: 139: };
;main.c: 142: static unsigned char ucWaitTime1S = 0;
;main.c: 144: static unsigned char ucWaitTimeO3s = 0;
;main.c: 146: static unsigned char ucSmallTimerActionFlag = 0;
;main.c: 148: static unsigned char ucSetSmallActionFlag = 0;
	bsf	status, 5	;RP0=1, select bank1
	bcf	(1064/8)^080h,(1064)&7
	line	151
;main.c: 151: TRISA1 = 0;
	bcf	(1065/8)^080h,(1065)&7
	line	152
;main.c: 152: TRISA2 = 0;
	bcf	(1066/8)^080h,(1066)&7
	line	153
;main.c: 153: TRISA3 = 0;
	bcf	(1067/8)^080h,(1067)&7
	line	154
;main.c: 154: TRISB0 = 0;
	bcf	(1072/8)^080h,(1072)&7
	line	155
;main.c: 155: TRISB1 = 0;
	bcf	(1073/8)^080h,(1073)&7
	line	156
;main.c: 156: TRISA6 = 0;
	bcf	(1070/8)^080h,(1070)&7
	line	157
;main.c: 157: TRISA7 = 0;
	bcf	(1071/8)^080h,(1071)&7
	line	158
;main.c: 158: TRISB6 = 0;
	bcf	(1078/8)^080h,(1078)&7
	line	161
	
l4190:	
;main.c: 161: initPin();
	fcall	_initPin
	line	164
	
l4192:	
;main.c: 164: TRISB2 = 1;
	bcf	status, 6	;RP1=0, select bank1
	bsf	(1074/8)^080h,(1074)&7
	line	166
	
l4194:	
;main.c: 166: TRISB7 = 1;
	bsf	(1079/8)^080h,(1079)&7
	line	167
	
l4196:	
;main.c: 167: TRISB4 = 1;
	bsf	(1076/8)^080h,(1076)&7
	line	169
	
l4198:	
;main.c: 169: clock_config();
	fcall	_clock_config
	line	170
	
l4200:	
;main.c: 170: timer1_config();
	fcall	_timer1_config
	line	171
;main.c: 171: timer1_interrupt_config();
	fcall	_timer1_interrupt_config
	line	173
	
l4202:	
;main.c: 173: adc_test_init(14,3);
	movlw	(03h)
	bcf	status, 5	;RP0=0, select bank0
	movwf	(?_adc_test_init)
	movlw	(0Eh)
	fcall	_adc_test_init
	line	175
	
l4204:	
;main.c: 175: dac_init();
	fcall	_dac_init
	line	176
	
l4206:	
;main.c: 176: op1_init();
	fcall	_op1_init
	line	177
	
l4208:	
;main.c: 177: op2_init();
	fcall	_op2_init
	line	180
;main.c: 180: adc_start();
	fcall	_adc_start
	line	213
	
l4210:	
# 213 "C:\190604\AK7030-OTP\main.c"
 clrwdt ;#
psect	maintext
	line	215
	
l4212:	
;main.c: 215: if(isPermitSampleTime())
	fcall	_isPermitSampleTime
	xorlw	0
	skipnz
	goto	u1281
	goto	u1280
u1281:
	goto	l4210
u1280:
	line	217
	
l4214:	
;main.c: 216: {
;main.c: 217: clrSampeTime();
	fcall	_clrSampeTime
	line	218
	
l4216:	
;main.c: 218: process_AD_Converter_Value();
	fcall	_process_AD_Converter_Value
	line	220
;main.c: 220: switch(enumMainLoopStep)
	goto	l4690
	line	225
	
l4218:	
;main.c: 223: {
;main.c: 224: static unsigned char ucTimerZeroPoint5s = 0;
;main.c: 225: if(getAdOriginalCh14Value() > 1950)
	fcall	_getAdOriginalCh14Value
	movlw	high(079Fh)
	subwf	(1+(?_getAdOriginalCh14Value)),w
	movlw	low(079Fh)
	skipnz
	subwf	(0+(?_getAdOriginalCh14Value)),w
	skipc
	goto	u1291
	goto	u1290
u1291:
	goto	l4222
u1290:
	line	227
	
l4220:	
;main.c: 226: {
;main.c: 227: ucTimerZeroPoint5s++;
	incf	(main@ucTimerZeroPoint5s),f
	line	228
;main.c: 228: }
	goto	l4224
	line	230
	
l4222:	
;main.c: 229: else
;main.c: 230: ucTimerZeroPoint5s = 0;
	clrf	(main@ucTimerZeroPoint5s)
	line	232
	
l4224:	
;main.c: 232: if(ucTimerZeroPoint5s >= 5)
	movlw	(05h)
	subwf	(main@ucTimerZeroPoint5s),w
	skipc
	goto	u1301
	goto	u1300
u1301:
	goto	l4210
u1300:
	line	234
	
l4226:	
;main.c: 233: {
;main.c: 234: ucTimerZeroPoint5s = 0;
	clrf	(main@ucTimerZeroPoint5s)
	line	235
	
l4228:	
;main.c: 235: enumMainLoopStep = MAIN_LOOP_STEP_FIRST;
	bcf	status, 5	;RP0=0, select bank0
	clrf	(main@enumMainLoopStep)
	incf	(main@enumMainLoopStep),f
	goto	l4210
	line	236
	
l706:	
	line	237
;main.c: 236: }
;main.c: 237: break;
	goto	l4210
	line	244
	
l4230:	
;main.c: 241: {
;main.c: 242: static unsigned char ucTimerZeroPoint3s = 0;
;main.c: 244: if(ucTimerZeroPoint3s < 3)
	movlw	(03h)
	subwf	(main@ucTimerZeroPoint3s),w
	skipnc
	goto	u1311
	goto	u1310
u1311:
	goto	l4234
u1310:
	line	246
	
l4232:	
;main.c: 245: {
;main.c: 246: ucTimerZeroPoint3s++;
	incf	(main@ucTimerZeroPoint3s),f
	line	247
;main.c: 247: }
	goto	l4210
	line	250
	
l4234:	
;main.c: 248: else
;main.c: 249: {
;main.c: 250: ucTimerZeroPoint3s = 0;
	clrf	(main@ucTimerZeroPoint3s)
	line	252
	
l4236:	
;main.c: 252: if(getAdOriginalCh14Value() > 1950)
	fcall	_getAdOriginalCh14Value
	movlw	high(079Fh)
	subwf	(1+(?_getAdOriginalCh14Value)),w
	movlw	low(079Fh)
	skipnz
	subwf	(0+(?_getAdOriginalCh14Value)),w
	skipc
	goto	u1321
	goto	u1320
u1321:
	goto	l4240
u1320:
	line	255
	
l4238:	
;main.c: 253: {
;main.c: 255: enumMainLoopStep = MAIN_LOOP_STEP_SECOND;
	movlw	(02h)
	movwf	(main@enumMainLoopStep)
	line	256
;main.c: 256: }
	goto	l4210
	line	259
	
l4240:	
;main.c: 257: else
;main.c: 258: {
;main.c: 259: clearPinPortAndTimer();
	fcall	_clearPinPortAndTimer
	goto	l4210
	line	265
;main.c: 263: }
;main.c: 265: case MAIN_LOOP_STEP_SECOND:
	
l715:	
	line	268
;main.c: 266: {
;main.c: 268: PA6 = 1;
	bsf	(46/8),(46)&7
	line	269
	
l4242:	
;main.c: 269: enumMainLoopStep = MAIN_LOOP_STEP_THIRD;
	movlw	(03h)
	movwf	(main@enumMainLoopStep)
	line	271
;main.c: 271: break;
	goto	l4210
	line	278
	
l4244:	
;main.c: 275: {
;main.c: 276: static unsigned char ucTimerADC1ZeroP5s = 0;
;main.c: 278: if(getAdOriginalCh1Value() < 130)
	fcall	_getAdOriginalCh1Value
	movlw	high(082h)
	subwf	(1+(?_getAdOriginalCh1Value)),w
	movlw	low(082h)
	skipnz
	subwf	(0+(?_getAdOriginalCh1Value)),w
	skipnc
	goto	u1331
	goto	u1330
u1331:
	goto	l4248
u1330:
	line	280
	
l4246:	
;main.c: 279: {
;main.c: 280: ucTimerADC1ZeroP5s = 0;
	clrf	(main@ucTimerADC1ZeroP5s)
	line	282
;main.c: 282: }
	goto	l4250
	line	285
	
l4248:	
;main.c: 283: else
;main.c: 284: {
;main.c: 285: ucTimerADC1ZeroP5s++;
	incf	(main@ucTimerADC1ZeroP5s),f
	line	288
	
l4250:	
;main.c: 286: }
;main.c: 288: if(ucTimerADC1ZeroP5s >= 1)
	movf	(main@ucTimerADC1ZeroP5s),w
	skipz
	goto	u1340
	goto	l4256
u1340:
	line	290
	
l4252:	
;main.c: 289: {
;main.c: 290: ucTimerADC1ZeroP5s = 0;
	clrf	(main@ucTimerADC1ZeroP5s)
	line	291
	
l4254:	
;main.c: 291: enumMainLoopStep = MAIN_LOOP_STEP_FOURTH;
	movlw	(04h)
	movwf	(main@enumMainLoopStep)
	line	292
;main.c: 292: }
	goto	l4210
	line	297
	
l4256:	
;main.c: 293: else
;main.c: 294: {
;main.c: 295: static unsigned char ucTimerRightP5s = 0;
;main.c: 297: if(getAdOriginalCh1Value() < 117)
	fcall	_getAdOriginalCh1Value
	movlw	high(075h)
	subwf	(1+(?_getAdOriginalCh1Value)),w
	movlw	low(075h)
	skipnz
	subwf	(0+(?_getAdOriginalCh1Value)),w
	skipnc
	goto	u1351
	goto	u1350
u1351:
	goto	l4260
u1350:
	line	299
	
l4258:	
;main.c: 298: {
;main.c: 299: ucTimerRightP5s++;
	incf	(main@ucTimerRightP5s),f
	line	300
;main.c: 300: }
	goto	l4262
	line	303
	
l4260:	
;main.c: 301: else
;main.c: 302: {
;main.c: 303: ucTimerRightP5s = 0;
	clrf	(main@ucTimerRightP5s)
	line	306
	
l4262:	
;main.c: 304: }
;main.c: 306: if(ucTimerRightP5s >= 1)
	movf	(main@ucTimerRightP5s),w
	skipz
	goto	u1360
	goto	l706
u1360:
	line	308
	
l4264:	
;main.c: 307: {
;main.c: 308: ucTimerRightP5s = 0;
	clrf	(main@ucTimerRightP5s)
	line	309
	
l4266:	
;main.c: 309: enumMainLoopStep = MAIN_LOOP_STEP_3_HOUR_BRANCH;
	movlw	(08h)
	movwf	(main@enumMainLoopStep)
	line	310
;main.c: 310: }
	goto	l4210
	line	323
	
l4268:	
;main.c: 321: {
;main.c: 323: startTwelveHourTimer(180);
	movlw	0B4h
	movwf	(?_startTwelveHourTimer)
	clrf	(?_startTwelveHourTimer+1)
	fcall	_startTwelveHourTimer
	line	324
	
l4270:	
;main.c: 324: enumMainLoopStep = MAIN_LOOP_STEP_FIFTH;
	movlw	(05h)
	bcf	status, 5	;RP0=0, select bank0
	movwf	(main@enumMainLoopStep)
	line	326
;main.c: 326: break;
	goto	l4210
	line	332
	
l4272:	
;main.c: 330: {
;main.c: 332: if(isFinishedTwelveHoursTimer())
	fcall	_isFinishedTwelveHoursTimer
	xorlw	0
	skipnz
	goto	u1371
	goto	u1370
u1371:
	goto	l4586
u1370:
	line	334
	
l4274:	
;main.c: 333: {
;main.c: 334: enumMainLoopStep = MAIN_LOOP_STEP_12_HOUR_END;
	movlw	(09h)
	bcf	status, 5	;RP0=0, select bank0
	movwf	(main@enumMainLoopStep)
	line	335
;main.c: 335: }
	goto	l4210
	line	344
	
l4276:	
;main.c: 343: {
;main.c: 344: startTwentySecondsTimer();
	fcall	_startTwentySecondsTimer
	line	345
	
l4278:	
;main.c: 345: ucADC4_Step = ADC4_STEP_FIRST;
	bcf	status, 5	;RP0=0, select bank0
	clrf	(main@ucADC4_Step)
	incf	(main@ucADC4_Step),f
	line	346
;main.c: 346: break;
	goto	l4210
	line	351
	
l4280:	
;main.c: 350: {
;main.c: 351: if(getAdOriginaCh4Value() < 1911)
	fcall	_getAdOriginaCh4Value
	movlw	high(0777h)
	subwf	(1+(?_getAdOriginaCh4Value)),w
	movlw	low(0777h)
	skipnz
	subwf	(0+(?_getAdOriginaCh4Value)),w
	skipnc
	goto	u1381
	goto	u1380
u1381:
	goto	l4284
u1380:
	line	352
	
l4282:	
;main.c: 352: ucChannel4Type = LESS_THAN_1911;
	clrf	(main@ucChannel4Type)
	goto	l740
	line	353
	
l4284:	
;main.c: 353: else if(getAdOriginaCh4Value() < 2067)
	fcall	_getAdOriginaCh4Value
	movlw	high(0813h)
	subwf	(1+(?_getAdOriginaCh4Value)),w
	movlw	low(0813h)
	skipnz
	subwf	(0+(?_getAdOriginaCh4Value)),w
	skipnc
	goto	u1391
	goto	u1390
u1391:
	goto	l4288
u1390:
	line	354
	
l4286:	
;main.c: 354: ucChannel4Type = BETWEEN_1911_AND_2067;
	clrf	(main@ucChannel4Type)
	incf	(main@ucChannel4Type),f
	goto	l740
	line	355
	
l4288:	
;main.c: 355: else if(getAdOriginaCh4Value() < 2204)
	fcall	_getAdOriginaCh4Value
	movlw	high(089Ch)
	subwf	(1+(?_getAdOriginaCh4Value)),w
	movlw	low(089Ch)
	skipnz
	subwf	(0+(?_getAdOriginaCh4Value)),w
	skipnc
	goto	u1401
	goto	u1400
u1401:
	goto	l4292
u1400:
	line	356
	
l4290:	
;main.c: 356: ucChannel4Type = BETWEEN_2067_AND_2204;
	movlw	(02h)
	movwf	(main@ucChannel4Type)
	goto	l740
	line	357
	
l4292:	
;main.c: 357: else if(getAdOriginaCh4Value() < 2340)
	fcall	_getAdOriginaCh4Value
	movlw	high(0924h)
	subwf	(1+(?_getAdOriginaCh4Value)),w
	movlw	low(0924h)
	skipnz
	subwf	(0+(?_getAdOriginaCh4Value)),w
	skipnc
	goto	u1411
	goto	u1410
u1411:
	goto	l4296
u1410:
	line	358
	
l4294:	
;main.c: 358: ucChannel4Type = BETWEEN_2204_AND_2340;
	movlw	(03h)
	movwf	(main@ucChannel4Type)
	goto	l740
	line	360
	
l4296:	
;main.c: 359: else
;main.c: 360: ucChannel4Type = MORE_THAN_2340;
	movlw	(04h)
	movwf	(main@ucChannel4Type)
	
l740:	
	line	362
;main.c: 362: ucADC4_Step = ADC4_STEP_SECOND;
	movlw	(02h)
	movwf	(main@ucADC4_Step)
	line	363
;main.c: 363: break;
	goto	l4210
	line	378
;main.c: 377: {
;main.c: 378: case 0:
	
l755:	
	line	380
;main.c: 379: {
;main.c: 380: PB0 = 1;
	bsf	(48/8),(48)&7
	line	381
	
l4298:	
;main.c: 381: ucLoaderStep++;
	incf	(main@ucLoaderStep),f
	line	382
;main.c: 382: break;
	goto	l4210
	line	387
	
l4300:	
;main.c: 386: {
;main.c: 387: if(ucTimerDelay >= 5)
	movlw	(05h)
	subwf	(main@ucTimerDelay),w
	skipc
	goto	u1421
	goto	u1420
u1421:
	goto	l4308
u1420:
	line	389
	
l4302:	
;main.c: 388: {
;main.c: 389: PA0 = 1;
	bsf	(40/8),(40)&7
	line	390
	
l4304:	
;main.c: 390: ucTimerDelay = 0;
	clrf	(main@ucTimerDelay)
	goto	l4298
	line	394
	
l4308:	
;main.c: 393: else
;main.c: 394: ucTimerDelay++;
	incf	(main@ucTimerDelay),f
	goto	l4210
	line	400
	
l4310:	
;main.c: 399: {
;main.c: 400: if(ucTimerDelay >= 5)
	movlw	(05h)
	subwf	(main@ucTimerDelay),w
	skipc
	goto	u1431
	goto	u1430
u1431:
	goto	l4308
u1430:
	line	402
	
l4312:	
;main.c: 401: {
;main.c: 402: PA1= 1;
	bsf	(41/8),(41)&7
	goto	l4304
	line	414
	
l4320:	
;main.c: 413: {
;main.c: 414: if(ucTimerDelay >= 5)
	movlw	(05h)
	subwf	(main@ucTimerDelay),w
	skipc
	goto	u1441
	goto	u1440
u1441:
	goto	l4308
u1440:
	line	416
	
l4322:	
;main.c: 415: {
;main.c: 416: PA2= 1;
	bsf	(42/8),(42)&7
	goto	l4304
	line	427
	
l4330:	
;main.c: 426: {
;main.c: 427: if(ucTimerDelay >= 5)
	movlw	(05h)
	subwf	(main@ucTimerDelay),w
	skipc
	goto	u1451
	goto	u1450
u1451:
	goto	l4308
u1450:
	line	429
	
l4332:	
;main.c: 428: {
;main.c: 429: PA3 = 1;
	bsf	(43/8),(43)&7
	goto	l4304
	line	440
	
l4340:	
;main.c: 439: {
;main.c: 440: if(ucTimerDelay >= 5)
	movlw	(05h)
	subwf	(main@ucTimerDelay),w
	skipc
	goto	u1461
	goto	u1460
u1461:
	goto	l4308
u1460:
	line	442
	
l4342:	
;main.c: 441: {
;main.c: 442: PB0 = 0;
	bcf	(48/8),(48)&7
	line	443
;main.c: 443: PA0 = 0;
	bcf	(40/8),(40)&7
	line	444
;main.c: 444: PA1 = 0;
	bcf	(41/8),(41)&7
	line	445
;main.c: 445: PA2 = 0;
	bcf	(42/8),(42)&7
	line	446
;main.c: 446: PA3 = 0;
	bcf	(43/8),(43)&7
	goto	l4304
	line	457
	
l4350:	
;main.c: 456: {
;main.c: 457: if(ucTimerDelay >= 2)
	movlw	(02h)
	subwf	(main@ucTimerDelay),w
	skipc
	goto	u1471
	goto	u1470
u1471:
	goto	l4308
u1470:
	line	459
	
l4352:	
;main.c: 458: {
;main.c: 459: ucTimerDelay = 0;
	clrf	(main@ucTimerDelay)
	line	461
;main.c: 461: ucLoaderStep = 0;
	clrf	(main@ucLoaderStep)
	line	462
	
l4354:	
;main.c: 462: ucADC4_Step = ADC4_STEP_THIRD;
	movlw	(03h)
	movwf	(main@ucADC4_Step)
	line	463
;main.c: 463: }
	goto	l4210
	line	376
	
l4360:	
	movf	(main@ucLoaderStep),w
	; Switch size 1, requested type "space"
; Number of cases is 7, Range of values is 0 to 6
; switch strategies available:
; Name         Instructions Cycles
; direct_byte           21     7 (fixed)
; simple_byte           22    12 (average)
; jumptable            260     6 (fixed)
; rangetable            11     6 (fixed)
; spacedrange           20     9 (fixed)
; locatedrange           7     3 (fixed)
;	Chosen strategy is direct_byte

	movwf fsr
	movlw	7
	subwf	fsr,w
skipnc
goto l706
movlw high(S4908)
movwf pclath
	clrc
	rlf fsr,w
	addlw low(S4908)
	movwf pc
psect	swtext1,local,class=CONST,delta=2
global __pswtext1
__pswtext1:
S4908:
	ljmp	l755
	ljmp	l4300
	ljmp	l4310
	ljmp	l4320
	ljmp	l4330
	ljmp	l4340
	ljmp	l4350
psect	maintext

	line	483
;main.c: 482: {
;main.c: 483: case 0:
	
l783:	
	line	485
;main.c: 484: {
;main.c: 485: PB0 = 1;
	bsf	(48/8),(48)&7
	line	486
	
l4362:	
;main.c: 486: ucLoaderStep1++;
	incf	(main@ucLoaderStep1),f
	line	487
;main.c: 487: break;
	goto	l4210
	line	492
	
l4364:	
;main.c: 491: {
;main.c: 492: if(ucTimerDelay1 >= 5)
	movlw	(05h)
	subwf	(main@ucTimerDelay1),w
	skipc
	goto	u1481
	goto	u1480
u1481:
	goto	l4372
u1480:
	line	494
	
l4366:	
;main.c: 493: {
;main.c: 494: PA0 = 1;
	bsf	(40/8),(40)&7
	line	495
	
l4368:	
;main.c: 495: ucTimerDelay1 = 0;
	clrf	(main@ucTimerDelay1)
	goto	l4362
	line	499
	
l4372:	
;main.c: 498: else
;main.c: 499: ucTimerDelay1++;
	incf	(main@ucTimerDelay1),f
	goto	l4210
	line	505
	
l4374:	
;main.c: 504: {
;main.c: 505: if(ucTimerDelay1 >= 5)
	movlw	(05h)
	subwf	(main@ucTimerDelay1),w
	skipc
	goto	u1491
	goto	u1490
u1491:
	goto	l4372
u1490:
	line	507
	
l4376:	
;main.c: 506: {
;main.c: 507: PA1= 1;
	bsf	(41/8),(41)&7
	goto	l4368
	line	518
	
l4384:	
;main.c: 517: {
;main.c: 518: if(ucTimerDelay1 >= 5)
	movlw	(05h)
	subwf	(main@ucTimerDelay1),w
	skipc
	goto	u1501
	goto	u1500
u1501:
	goto	l4372
u1500:
	line	520
	
l4386:	
;main.c: 519: {
;main.c: 520: PA2 = 1;
	bsf	(42/8),(42)&7
	goto	l4368
	line	531
	
l4394:	
;main.c: 530: {
;main.c: 531: if(ucTimerDelay1 >= 5)
	movlw	(05h)
	subwf	(main@ucTimerDelay1),w
	skipc
	goto	u1511
	goto	u1510
u1511:
	goto	l4372
u1510:
	line	533
	
l4396:	
;main.c: 532: {
;main.c: 533: PA3 = 1;
	bsf	(43/8),(43)&7
	goto	l4368
	line	544
	
l4404:	
;main.c: 543: {
;main.c: 544: if(ucTimerDelay1 >= 5)
	movlw	(05h)
	subwf	(main@ucTimerDelay1),w
	skipc
	goto	u1521
	goto	u1520
u1521:
	goto	l4372
u1520:
	line	546
	
l4406:	
;main.c: 545: {
;main.c: 546: PA0 = 0;
	bcf	(40/8),(40)&7
	line	547
;main.c: 547: PA1 = 0;
	bcf	(41/8),(41)&7
	line	548
;main.c: 548: PA2 = 0;
	bcf	(42/8),(42)&7
	line	549
;main.c: 549: PA3 = 0;
	bcf	(43/8),(43)&7
	goto	l4368
	line	560
	
l4414:	
;main.c: 559: {
;main.c: 560: if(ucTimerDelay1 >= 2)
	movlw	(02h)
	subwf	(main@ucTimerDelay1),w
	skipc
	goto	u1531
	goto	u1530
u1531:
	goto	l4372
u1530:
	line	562
	
l4416:	
;main.c: 561: {
;main.c: 562: ucTimerDelay1 = 0;
	clrf	(main@ucTimerDelay1)
	line	564
;main.c: 564: ucLoaderStep1 = 0;
	clrf	(main@ucLoaderStep1)
	goto	l4354
	line	481
	
l4424:	
	movf	(main@ucLoaderStep1),w
	; Switch size 1, requested type "space"
; Number of cases is 7, Range of values is 0 to 6
; switch strategies available:
; Name         Instructions Cycles
; direct_byte           21     7 (fixed)
; simple_byte           22    12 (average)
; jumptable            260     6 (fixed)
; rangetable            11     6 (fixed)
; spacedrange           20     9 (fixed)
; locatedrange           7     3 (fixed)
;	Chosen strategy is direct_byte

	movwf fsr
	movlw	7
	subwf	fsr,w
skipnc
goto l706
movlw high(S4910)
movwf pclath
	clrc
	rlf fsr,w
	addlw low(S4910)
	movwf pc
psect	swtext2,local,class=CONST,delta=2
global __pswtext2
__pswtext2:
S4910:
	ljmp	l783
	ljmp	l4364
	ljmp	l4374
	ljmp	l4384
	ljmp	l4394
	ljmp	l4404
	ljmp	l4414
psect	maintext

	line	587
;main.c: 586: {
;main.c: 587: case 0:
	
l810:	
	line	589
;main.c: 588: {
;main.c: 589: PB0 = 1;
	bsf	(48/8),(48)&7
	line	590
;main.c: 590: PA0 = 1;
	bsf	(40/8),(40)&7
	line	591
	
l4426:	
;main.c: 591: ucLoaderStep2++;
	incf	(main@ucLoaderStep2),f
	line	592
;main.c: 592: break;
	goto	l4210
	line	597
	
l4428:	
;main.c: 596: {
;main.c: 597: if(ucTimerDelay2 >= 5)
	movlw	(05h)
	subwf	(main@ucTimerDelay2),w
	skipc
	goto	u1541
	goto	u1540
u1541:
	goto	l4436
u1540:
	line	599
	
l4430:	
;main.c: 598: {
;main.c: 599: PA1 = 1;
	bsf	(41/8),(41)&7
	line	600
	
l4432:	
;main.c: 600: ucTimerDelay2 = 0;
	clrf	(main@ucTimerDelay2)
	goto	l4426
	line	604
	
l4436:	
;main.c: 603: else
;main.c: 604: ucTimerDelay2++;
	incf	(main@ucTimerDelay2),f
	goto	l4210
	line	610
	
l4438:	
;main.c: 609: {
;main.c: 610: if(ucTimerDelay2 >= 5)
	movlw	(05h)
	subwf	(main@ucTimerDelay2),w
	skipc
	goto	u1551
	goto	u1550
u1551:
	goto	l4436
u1550:
	line	612
	
l4440:	
;main.c: 611: {
;main.c: 612: PA2 = 1;
	bsf	(42/8),(42)&7
	goto	l4432
	line	623
	
l4448:	
;main.c: 622: {
;main.c: 623: if(ucTimerDelay2 >= 5)
	movlw	(05h)
	subwf	(main@ucTimerDelay2),w
	skipc
	goto	u1561
	goto	u1560
u1561:
	goto	l4436
u1560:
	line	625
	
l4450:	
;main.c: 624: {
;main.c: 625: PA3 = 1;
	bsf	(43/8),(43)&7
	goto	l4432
	line	636
	
l4458:	
;main.c: 635: {
;main.c: 636: if(ucTimerDelay2 >= 5)
	movlw	(05h)
	subwf	(main@ucTimerDelay2),w
	skipc
	goto	u1571
	goto	u1570
u1571:
	goto	l4436
u1570:
	line	639
	
l4460:	
;main.c: 637: {
;main.c: 639: PA1 = 0;
	bcf	(41/8),(41)&7
	line	640
;main.c: 640: PA2 = 0;
	bcf	(42/8),(42)&7
	line	641
;main.c: 641: PA3 = 0;
	bcf	(43/8),(43)&7
	goto	l4432
	line	652
	
l4468:	
;main.c: 651: {
;main.c: 652: if(ucTimerDelay2 >= 2)
	movlw	(02h)
	subwf	(main@ucTimerDelay2),w
	skipc
	goto	u1581
	goto	u1580
u1581:
	goto	l4436
u1580:
	line	654
	
l4470:	
;main.c: 653: {
;main.c: 654: ucTimerDelay2 = 0;
	clrf	(main@ucTimerDelay2)
	line	656
;main.c: 656: ucLoaderStep2 = 0;
	clrf	(main@ucLoaderStep2)
	goto	l4354
	line	585
	
l4478:	
	movf	(main@ucLoaderStep2),w
	; Switch size 1, requested type "space"
; Number of cases is 6, Range of values is 0 to 5
; switch strategies available:
; Name         Instructions Cycles
; direct_byte           19     7 (fixed)
; simple_byte           19    10 (average)
; jumptable            260     6 (fixed)
; rangetable            10     6 (fixed)
; spacedrange           18     9 (fixed)
; locatedrange           6     3 (fixed)
;	Chosen strategy is direct_byte

	movwf fsr
	movlw	6
	subwf	fsr,w
skipnc
goto l706
movlw high(S4912)
movwf pclath
	clrc
	rlf fsr,w
	addlw low(S4912)
	movwf pc
psect	swtext3,local,class=CONST,delta=2
global __pswtext3
__pswtext3:
S4912:
	ljmp	l810
	ljmp	l4428
	ljmp	l4438
	ljmp	l4448
	ljmp	l4458
	ljmp	l4468
psect	maintext

	line	679
;main.c: 678: {
;main.c: 679: case 0:
	
l834:	
	line	681
;main.c: 680: {
;main.c: 681: PB0 = 1;
	bsf	(48/8),(48)&7
	line	682
;main.c: 682: PA0 = 1;
	bsf	(40/8),(40)&7
	line	683
;main.c: 683: PA1 = 1;
	bsf	(41/8),(41)&7
	line	684
	
l4480:	
;main.c: 684: ucLoaderStep3++;
	incf	(main@ucLoaderStep3),f
	line	685
;main.c: 685: break;
	goto	l4210
	line	690
	
l4482:	
;main.c: 689: {
;main.c: 690: if(ucTimerDelay3 >= 5)
	movlw	(05h)
	subwf	(main@ucTimerDelay3),w
	skipc
	goto	u1591
	goto	u1590
u1591:
	goto	l4490
u1590:
	line	692
	
l4484:	
;main.c: 691: {
;main.c: 692: PA2 = 1;
	bsf	(42/8),(42)&7
	line	693
	
l4486:	
;main.c: 693: ucTimerDelay3 = 0;
	clrf	(main@ucTimerDelay3)
	goto	l4480
	line	697
	
l4490:	
;main.c: 696: else
;main.c: 697: ucTimerDelay3++;
	incf	(main@ucTimerDelay3),f
	goto	l4210
	line	703
	
l4492:	
;main.c: 702: {
;main.c: 703: if(ucTimerDelay3 >= 5)
	movlw	(05h)
	subwf	(main@ucTimerDelay3),w
	skipc
	goto	u1601
	goto	u1600
u1601:
	goto	l4490
u1600:
	line	705
	
l4494:	
;main.c: 704: {
;main.c: 705: PA3 = 1;
	bsf	(43/8),(43)&7
	goto	l4486
	line	717
	
l4502:	
;main.c: 716: {
;main.c: 717: if(ucTimerDelay3 >= 5)
	movlw	(05h)
	subwf	(main@ucTimerDelay3),w
	skipc
	goto	u1611
	goto	u1610
u1611:
	goto	l4490
u1610:
	line	720
	
l4504:	
;main.c: 718: {
;main.c: 720: PA2 = 0;
	bcf	(42/8),(42)&7
	line	721
;main.c: 721: PA3 = 0;
	bcf	(43/8),(43)&7
	goto	l4486
	line	732
	
l4512:	
;main.c: 731: {
;main.c: 732: if(ucTimerDelay3 >= 2)
	movlw	(02h)
	subwf	(main@ucTimerDelay3),w
	skipc
	goto	u1621
	goto	u1620
u1621:
	goto	l4490
u1620:
	line	734
	
l4514:	
;main.c: 733: {
;main.c: 734: ucTimerDelay3 = 0;
	clrf	(main@ucTimerDelay3)
	line	736
;main.c: 736: ucLoaderStep3 = 0;
	clrf	(main@ucLoaderStep3)
	goto	l4354
	line	677
	
l4522:	
	movf	(main@ucLoaderStep3),w
	; Switch size 1, requested type "space"
; Number of cases is 5, Range of values is 0 to 4
; switch strategies available:
; Name         Instructions Cycles
; simple_byte           16     9 (average)
; direct_byte           17     7 (fixed)
; jumptable            260     6 (fixed)
; rangetable             9     6 (fixed)
; spacedrange           16     9 (fixed)
; locatedrange           5     3 (fixed)
;	Chosen strategy is simple_byte

	opt asmopt_off
	xorlw	0^0	; case 0
	skipnz
	goto	l834
	xorlw	1^0	; case 1
	skipnz
	goto	l4482
	xorlw	2^1	; case 2
	skipnz
	goto	l4492
	xorlw	3^2	; case 3
	skipnz
	goto	l4502
	xorlw	4^3	; case 4
	skipnz
	goto	l4512
	goto	l706
	opt asmopt_on

	line	759
;main.c: 758: {
;main.c: 759: case 0:
	
l855:	
	line	761
;main.c: 760: {
;main.c: 761: PB0 = 1;
	bsf	(48/8),(48)&7
	line	762
;main.c: 762: PA0 = 1;
	bsf	(40/8),(40)&7
	line	763
;main.c: 763: PA1 = 1;
	bsf	(41/8),(41)&7
	line	764
;main.c: 764: PA2 = 1;
	bsf	(42/8),(42)&7
	line	765
	
l4524:	
;main.c: 765: ucLoaderStep4++;
	incf	(main@ucLoaderStep4),f
	line	766
;main.c: 766: break;
	goto	l4210
	line	771
	
l4526:	
;main.c: 770: {
;main.c: 771: if(ucTimerDelay4 >= 5)
	movlw	(05h)
	subwf	(main@ucTimerDelay4),w
	skipc
	goto	u1631
	goto	u1630
u1631:
	goto	l4534
u1630:
	line	773
	
l4528:	
;main.c: 772: {
;main.c: 773: PA3 = 1;
	bsf	(43/8),(43)&7
	line	774
	
l4530:	
;main.c: 774: ucTimerDelay4 = 0;
	clrf	(main@ucTimerDelay4)
	goto	l4524
	line	778
	
l4534:	
;main.c: 777: else
;main.c: 778: ucTimerDelay4++;
	incf	(main@ucTimerDelay4),f
	goto	l4210
	line	784
	
l4536:	
;main.c: 783: {
;main.c: 784: if(ucTimerDelay4 >= 5)
	movlw	(05h)
	subwf	(main@ucTimerDelay4),w
	skipc
	goto	u1641
	goto	u1640
u1641:
	goto	l4534
u1640:
	line	786
	
l4538:	
;main.c: 785: {
;main.c: 786: PA3 = 0;
	bcf	(43/8),(43)&7
	goto	l4530
	line	797
	
l4546:	
;main.c: 796: {
;main.c: 797: if(ucTimerDelay4 >= 2)
	movlw	(02h)
	subwf	(main@ucTimerDelay4),w
	skipc
	goto	u1651
	goto	u1650
u1651:
	goto	l4534
u1650:
	line	799
	
l4548:	
;main.c: 798: {
;main.c: 799: ucTimerDelay4 = 0;
	clrf	(main@ucTimerDelay4)
	line	801
;main.c: 801: ucLoaderStep4 = 0;
	clrf	(main@ucLoaderStep4)
	goto	l4354
	line	757
	
l4556:	
	movf	(main@ucLoaderStep4),w
	; Switch size 1, requested type "space"
; Number of cases is 4, Range of values is 0 to 3
; switch strategies available:
; Name         Instructions Cycles
; simple_byte           13     7 (average)
; direct_byte           15     7 (fixed)
; jumptable            260     6 (fixed)
; rangetable             8     6 (fixed)
; spacedrange           14     9 (fixed)
; locatedrange           4     3 (fixed)
;	Chosen strategy is simple_byte

	opt asmopt_off
	xorlw	0^0	; case 0
	skipnz
	goto	l855
	xorlw	1^0	; case 1
	skipnz
	goto	l4526
	xorlw	2^1	; case 2
	skipnz
	goto	l4536
	xorlw	3^2	; case 3
	skipnz
	goto	l4546
	goto	l706
	opt asmopt_on

	line	368
	
l4560:	
	movf	(main@ucChannel4Type),w
	; Switch size 1, requested type "space"
; Number of cases is 5, Range of values is 0 to 4
; switch strategies available:
; Name         Instructions Cycles
; simple_byte           16     9 (average)
; direct_byte           17     7 (fixed)
; jumptable            260     6 (fixed)
; rangetable             9     6 (fixed)
; spacedrange           16     9 (fixed)
; locatedrange           5     3 (fixed)
;	Chosen strategy is simple_byte

	opt asmopt_off
	xorlw	0^0	; case 0
	skipnz
	goto	l4360
	xorlw	1^0	; case 1
	skipnz
	goto	l4424
	xorlw	2^1	; case 2
	skipnz
	goto	l4478
	xorlw	3^2	; case 3
	skipnz
	goto	l4522
	xorlw	4^3	; case 4
	skipnz
	goto	l4556
	goto	l706
	opt asmopt_on

	line	826
	
l4562:	
;main.c: 825: {
;main.c: 826: if(isFinishedTwentySecondsTimer())
	fcall	_isFinishedTwentySecondsTimer
	xorlw	0
	skipnz
	goto	u1661
	goto	u1660
u1661:
	goto	l4278
u1660:
	line	828
	
l4564:	
;main.c: 827: {
;main.c: 828: PBOD6 =0;
	bsf	status, 6	;RP1=1, select bank3
	bcf	(3142/8)^0180h,(3142)&7
	line	829
;main.c: 829: PB6 = 1;
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	bsf	(54/8),(54)&7
	line	830
;main.c: 830: PA6 = 0;
	bcf	(46/8),(46)&7
	line	837
	
l4566:	
;main.c: 837: if((getAdOriginalCh14Value() > 2800))
	fcall	_getAdOriginalCh14Value
	movlw	high(0AF1h)
	subwf	(1+(?_getAdOriginalCh14Value)),w
	movlw	low(0AF1h)
	skipnz
	subwf	(0+(?_getAdOriginalCh14Value)),w
	skipc
	goto	u1671
	goto	u1670
u1671:
	goto	l4570
u1670:
	line	838
	
l4568:	
;main.c: 838: DACR0=0x0F;
	movlw	(0Fh)
	bsf	status, 5	;RP0=1, select bank1
	movwf	(136)^080h	;volatile
	goto	l871
	line	840
	
l4570:	
;main.c: 839: else
;main.c: 840: DACR0=0x07;
	movlw	(07h)
	bsf	status, 5	;RP0=1, select bank1
	movwf	(136)^080h	;volatile
	
l871:	
	line	842
;main.c: 842: ucADC4_Step = ADC4_STEP_FOURTH;
	movlw	(04h)
	bcf	status, 5	;RP0=0, select bank0
	movwf	(main@ucADC4_Step)
	line	843
;main.c: 843: }
	goto	l4210
	line	853
	
l4572:	
;main.c: 851: {
;main.c: 852: static unsigned char ucTimer1s = 0;
;main.c: 853: if(ucTimer1s < 5)
	movlw	(05h)
	subwf	(main@ucTimer1s),w
	skipnc
	goto	u1681
	goto	u1680
u1681:
	goto	l4576
u1680:
	line	855
	
l4574:	
;main.c: 854: {
;main.c: 855: ucTimer1s++;
	incf	(main@ucTimer1s),f
	line	856
;main.c: 856: }
	goto	l4210
	line	859
	
l4576:	
;main.c: 857: else
;main.c: 858: {
;main.c: 859: ucTimer1s = 0;
	clrf	(main@ucTimer1s)
	line	860
	
l4578:	
;main.c: 860: PB6 = 1;
	bsf	(54/8),(54)&7
	line	861
	
l4580:	
;main.c: 861: PBOD6 = 1;
	bsf	status, 5	;RP0=1, select bank3
	bsf	status, 6	;RP1=1, select bank3
	bsf	(3142/8)^0180h,(3142)&7
	line	862
	
l4582:	
;main.c: 862: enumMainLoopStep = MAIN_LOOP_STEP_FIRST;
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	clrf	(main@enumMainLoopStep)
	incf	(main@enumMainLoopStep),f
	line	863
;main.c: 863: ucADC4_Step = ADC4_STEP_INIT;
	clrf	(main@ucADC4_Step)
	goto	l4210
	line	340
	
l4586:	
	bcf	status, 5	;RP0=0, select bank0
	movf	(main@ucADC4_Step),w
	; Switch size 1, requested type "space"
; Number of cases is 5, Range of values is 0 to 4
; switch strategies available:
; Name         Instructions Cycles
; simple_byte           16     9 (average)
; direct_byte           17     7 (fixed)
; jumptable            260     6 (fixed)
; rangetable             9     6 (fixed)
; spacedrange           16     9 (fixed)
; locatedrange           5     3 (fixed)
;	Chosen strategy is simple_byte

	opt asmopt_off
	xorlw	0^0	; case 0
	skipnz
	goto	l4276
	xorlw	1^0	; case 1
	skipnz
	goto	l4280
	xorlw	2^1	; case 2
	skipnz
	goto	l4560
	xorlw	3^2	; case 3
	skipnz
	goto	l4562
	xorlw	4^3	; case 4
	skipnz
	goto	l4572
	goto	l706
	opt asmopt_on

	line	890
;main.c: 889: {
;main.c: 890: case HOUR_3_BRANCH_STEP_FIRST:
	
l883:	
	line	892
;main.c: 891: {
;main.c: 892: PA7 = 1;
	bsf	(47/8),(47)&7
	line	893
;main.c: 893: PAOD7 = 1;
	bsf	status, 5	;RP0=1, select bank3
	bsf	status, 6	;RP1=1, select bank3
	bsf	(3135/8)^0180h,(3135)&7
	line	894
	
l4588:	
;main.c: 894: startThreeHoursTimer(60);
	movlw	03Ch
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	movwf	(?_startThreeHoursTimer)
	clrf	(?_startThreeHoursTimer+1)
	fcall	_startThreeHoursTimer
	line	896
	
l4590:	
;main.c: 896: enumBranchStep = HOUR_3_BRANCH_STEP_SECOND;
	bcf	status, 5	;RP0=0, select bank0
	clrf	(main@enumBranchStep)
	incf	(main@enumBranchStep),f
	line	897
;main.c: 897: break;
	goto	l4210
	line	904
	
l4592:	
;main.c: 901: {
;main.c: 902: static unsigned char ucTimer20s = 0;
;main.c: 904: if(ucTimer20s < 200)
	movlw	(0C8h)
	bsf	status, 5	;RP0=1, select bank1
	subwf	(main@ucTimer20s)^080h,w
	skipnc
	goto	u1691
	goto	u1690
u1691:
	goto	l4606
u1690:
	line	906
	
l4594:	
;main.c: 905: {
;main.c: 906: ucTimer20s++;
	incf	(main@ucTimer20s)^080h,f
	line	907
	
l4596:	
;main.c: 907: PB0 = 1;
	bcf	status, 5	;RP0=0, select bank0
	bsf	(48/8),(48)&7
	line	908
	
l4598:	
;main.c: 908: PA0 = 1;
	bsf	(40/8),(40)&7
	line	909
	
l4600:	
;main.c: 909: PA1 = 1;
	bsf	(41/8),(41)&7
	line	910
	
l4602:	
;main.c: 910: PA2 = 1;
	bsf	(42/8),(42)&7
	line	911
	
l4604:	
;main.c: 911: PA3 = 1;
	bsf	(43/8),(43)&7
	line	912
;main.c: 912: }
	goto	l4210
	line	916
	
l4606:	
;main.c: 913: else
;main.c: 914: {
;main.c: 916: ucTimer20s = 0;
	clrf	(main@ucTimer20s)^080h
	line	919
	
l4608:	
;main.c: 919: enumBranchStep = HOUR_3_BRANCH_STEP_THIRD;
	movlw	(02h)
	bcf	status, 5	;RP0=0, select bank0
	movwf	(main@enumBranchStep)
	goto	l4210
	line	924
;main.c: 922: }
;main.c: 924: case HOUR_3_BRANCH_STEP_THIRD:
	
l890:	
	line	926
;main.c: 925: {
;main.c: 926: PA6 = 0;
	bcf	(46/8),(46)&7
	line	928
	
l4610:	
;main.c: 928: if(isFinishedThreeHoursTimer())
	fcall	_isFinishedThreeHoursTimer
	xorlw	0
	skipnz
	goto	u1701
	goto	u1700
u1701:
	goto	l4616
u1700:
	line	930
	
l4612:	
;main.c: 929: {
;main.c: 930: enumBranchStep = HOUR_3_BRANCH_STEP_FIRST;
	bcf	status, 5	;RP0=0, select bank0
	clrf	(main@enumBranchStep)
	goto	l4274
	line	937
	
l4616:	
;main.c: 933: else
;main.c: 934: {
;main.c: 935: static unsigned char ucTimerX1P5s = 0;
;main.c: 937: if(getAdOriginalCh1Value() < 130)
	fcall	_getAdOriginalCh1Value
	movlw	high(082h)
	subwf	(1+(?_getAdOriginalCh1Value)),w
	movlw	low(082h)
	skipnz
	subwf	(0+(?_getAdOriginalCh1Value)),w
	skipnc
	goto	u1711
	goto	u1710
u1711:
	goto	l4620
u1710:
	line	939
	
l4618:	
;main.c: 938: {
;main.c: 939: ucTimerX1P5s = 0;
	bsf	status, 5	;RP0=1, select bank1
	clrf	(main@ucTimerX1P5s)^080h
	line	940
;main.c: 940: }
	goto	l4622
	line	943
	
l4620:	
;main.c: 941: else
;main.c: 942: {
;main.c: 943: ucTimerX1P5s++;
	bsf	status, 5	;RP0=1, select bank1
	incf	(main@ucTimerX1P5s)^080h,f
	line	946
	
l4622:	
;main.c: 944: }
;main.c: 946: if(ucTimerX1P5s >= 1)
	movf	(main@ucTimerX1P5s)^080h,w
	skipz
	goto	u1720
	goto	l4636
u1720:
	line	948
	
l4624:	
;main.c: 947: {
;main.c: 948: ucTimerX1P5s = 0;
	clrf	(main@ucTimerX1P5s)^080h
	line	949
	
l4626:	
;main.c: 949: PAOD7 = 0;
	bsf	status, 6	;RP1=1, select bank3
	bcf	(3135/8)^0180h,(3135)&7
	line	950
	
l4628:	
;main.c: 950: PA7 = 0;
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	bcf	(47/8),(47)&7
	line	951
	
l4630:	
;main.c: 951: clearThreeHoursTimer();
	fcall	_clearThreeHoursTimer
	line	953
	
l4632:	
;main.c: 953: enumBranchStep = HOUR_3_BRANCH_STEP_FIRST;
	bcf	status, 5	;RP0=0, select bank0
	clrf	(main@enumBranchStep)
	goto	l4238
	line	961
	
l4636:	
;main.c: 957: else
;main.c: 958: {
;main.c: 959: static unsigned char ucTimerX2P5s = 0;
;main.c: 961: if(getAdOriginalCh14Value() >= 1950)
	fcall	_getAdOriginalCh14Value
	movlw	high(079Eh)
	subwf	(1+(?_getAdOriginalCh14Value)),w
	movlw	low(079Eh)
	skipnz
	subwf	(0+(?_getAdOriginalCh14Value)),w
	skipc
	goto	u1731
	goto	u1730
u1731:
	goto	l4640
u1730:
	line	963
	
l4638:	
;main.c: 962: {
;main.c: 963: ucTimerX2P5s++;
	bsf	status, 5	;RP0=1, select bank1
	incf	(main@ucTimerX2P5s)^080h,f
	line	964
;main.c: 964: }
	goto	l4642
	line	967
	
l4640:	
;main.c: 965: else
;main.c: 966: {
;main.c: 967: ucTimerX2P5s = 0;
	bsf	status, 5	;RP0=1, select bank1
	clrf	(main@ucTimerX2P5s)^080h
	line	970
	
l4642:	
;main.c: 968: }
;main.c: 970: if(ucTimerX2P5s >= 1)
	movf	(main@ucTimerX2P5s)^080h,w
	skipz
	goto	u1740
	goto	l4646
u1740:
	line	972
	
l4644:	
;main.c: 971: {
;main.c: 972: ucTimerX2P5s = 0;
	clrf	(main@ucTimerX2P5s)^080h
	line	973
;main.c: 973: }
	goto	l4210
	line	976
	
l4646:	
;main.c: 974: else
;main.c: 975: {
;main.c: 976: clearPinPortAndTimer();
	fcall	_clearPinPortAndTimer
	goto	l4228
	line	888
	
l4652:	
	movf	(main@enumBranchStep),w
	; Switch size 1, requested type "space"
; Number of cases is 3, Range of values is 0 to 2
; switch strategies available:
; Name         Instructions Cycles
; simple_byte           10     6 (average)
; direct_byte           13     7 (fixed)
; jumptable            260     6 (fixed)
; rangetable             7     6 (fixed)
; spacedrange           12     9 (fixed)
; locatedrange           3     3 (fixed)
;	Chosen strategy is simple_byte

	opt asmopt_off
	xorlw	0^0	; case 0
	skipnz
	goto	l883
	xorlw	1^0	; case 1
	skipnz
	goto	l4592
	xorlw	2^1	; case 2
	skipnz
	goto	l890
	goto	l706
	opt asmopt_on

	line	1007
;main.c: 1006: {
;main.c: 1007: case INTERNAL_FIRST_STEP:
	
l910:	
	line	1009
;main.c: 1008: {
;main.c: 1009: PB0 = 0;
	bcf	status, 5	;RP0=0, select bank0
	bcf	(48/8),(48)&7
	line	1010
;main.c: 1010: PB1 = 0;
	bcf	(49/8),(49)&7
	line	1011
;main.c: 1011: PA0 = 0;
	bcf	(40/8),(40)&7
	line	1012
;main.c: 1012: PA1 = 0;
	bcf	(41/8),(41)&7
	line	1013
;main.c: 1013: PA2 = 0;
	bcf	(42/8),(42)&7
	line	1014
;main.c: 1014: PA3 = 0;
	bcf	(43/8),(43)&7
	line	1015
;main.c: 1015: PBOD6 = 0;
	bsf	status, 5	;RP0=1, select bank3
	bsf	status, 6	;RP1=1, select bank3
	bcf	(3142/8)^0180h,(3142)&7
	line	1016
;main.c: 1016: PB6 = 1;
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	bsf	(54/8),(54)&7
	line	1017
;main.c: 1017: PA6 =0;
	bcf	(46/8),(46)&7
	line	1019
;main.c: 1019: enumInteralStep = INTERNAL_SECOND_STEP;
	bsf	status, 5	;RP0=1, select bank1
	clrf	(main@enumInteralStep)^080h
	incf	(main@enumInteralStep)^080h,f
	line	1020
;main.c: 1020: break;
	goto	l4210
	line	1027
	
l4654:	
;main.c: 1024: {
;main.c: 1025: static unsigned char ucTimer1s = 0;
;main.c: 1027: if(getAdOriginalCh14Value() <= 1000)
	fcall	_getAdOriginalCh14Value
	movlw	high(03E9h)
	subwf	(1+(?_getAdOriginalCh14Value)),w
	movlw	low(03E9h)
	skipnz
	subwf	(0+(?_getAdOriginalCh14Value)),w
	skipnc
	goto	u1751
	goto	u1750
u1751:
	goto	l4658
u1750:
	line	1029
	
l4656:	
;main.c: 1028: {
;main.c: 1029: ucTimer1s++;
	bsf	status, 5	;RP0=1, select bank1
	incf	(main@cTimer1s_809)^080h,f
	line	1030
;main.c: 1030: }
	goto	l4660
	line	1032
	
l4658:	
;main.c: 1031: else
;main.c: 1032: ucTimer1s = 0;
	bsf	status, 5	;RP0=1, select bank1
	clrf	(main@cTimer1s_809)^080h
	line	1034
	
l4660:	
;main.c: 1034: if(ucTimer1s >= 10)
	movlw	(0Ah)
	subwf	(main@cTimer1s_809)^080h,w
	skipc
	goto	u1761
	goto	u1760
u1761:
	goto	l706
u1760:
	line	1036
	
l4662:	
;main.c: 1035: {
;main.c: 1036: enumInteralStep = INTERNAL_THIRD_STEP;
	movlw	(02h)
	movwf	(main@enumInteralStep)^080h
	line	1037
	
l4664:	
;main.c: 1037: ucTimer1s = 0;
	clrf	(main@cTimer1s_809)^080h
	goto	l4210
	line	1046
	
l4666:	
;main.c: 1043: {
;main.c: 1044: static unsigned char ucTimerP3s = 0;
;main.c: 1046: if(getAdOriginalCh14Value() >= 1950)
	fcall	_getAdOriginalCh14Value
	movlw	high(079Eh)
	subwf	(1+(?_getAdOriginalCh14Value)),w
	movlw	low(079Eh)
	skipnz
	subwf	(0+(?_getAdOriginalCh14Value)),w
	skipc
	goto	u1771
	goto	u1770
u1771:
	goto	l4670
u1770:
	line	1048
	
l4668:	
;main.c: 1047: {
;main.c: 1048: ucTimerP3s++;
	bsf	status, 5	;RP0=1, select bank1
	incf	(main@ucTimerP3s)^080h,f
	line	1049
;main.c: 1049: }
	goto	l4672
	line	1051
	
l4670:	
;main.c: 1050: else
;main.c: 1051: ucTimerP3s = 0;
	bsf	status, 5	;RP0=1, select bank1
	clrf	(main@ucTimerP3s)^080h
	line	1053
	
l4672:	
;main.c: 1053: if(ucTimerP3s >= 3)
	movlw	(03h)
	subwf	(main@ucTimerP3s)^080h,w
	skipc
	goto	u1781
	goto	u1780
u1781:
	goto	l706
u1780:
	line	1055
	
l4674:	
;main.c: 1054: {
;main.c: 1055: enumInteralStep = INTERNAL_FIRST_STEP;
	clrf	(main@enumInteralStep)^080h
	line	1056
;main.c: 1056: ucTimerP3s = 0;
	clrf	(main@ucTimerP3s)^080h
	line	1057
	
l4676:	
;main.c: 1057: clearAllTimer();
	fcall	_clearAllTimer
	line	1059
	
l4678:	
;main.c: 1059: DACR0=0x0F;
	movlw	(0Fh)
	movwf	(136)^080h	;volatile
	line	1060
	
l4680:	
;main.c: 1060: initPin();
	fcall	_initPin
	line	1063
	
l4682:	
;main.c: 1063: enumMainLoopStep = MAIN_LOOP_STEP_INIT;
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	clrf	(main@enumMainLoopStep)
	goto	l4210
	line	1005
	
l4686:	
	bsf	status, 5	;RP0=1, select bank1
	movf	(main@enumInteralStep)^080h,w
	; Switch size 1, requested type "space"
; Number of cases is 3, Range of values is 0 to 2
; switch strategies available:
; Name         Instructions Cycles
; simple_byte           10     6 (average)
; direct_byte           13     7 (fixed)
; jumptable            260     6 (fixed)
; rangetable             7     6 (fixed)
; spacedrange           12     9 (fixed)
; locatedrange           3     3 (fixed)
;	Chosen strategy is simple_byte

	opt asmopt_off
	xorlw	0^0	; case 0
	skipnz
	goto	l910
	xorlw	1^0	; case 1
	skipnz
	goto	l4654
	xorlw	2^1	; case 2
	skipnz
	goto	l4666
	goto	l706
	opt asmopt_on

	line	220
	
l4690:	
	bcf	status, 5	;RP0=0, select bank0
	movf	(main@enumMainLoopStep),w
	; Switch size 1, requested type "space"
; Number of cases is 8, Range of values is 0 to 9
; switch strategies available:
; Name         Instructions Cycles
; simple_byte           25    13 (average)
; direct_byte           27     7 (fixed)
; jumptable            260     6 (fixed)
; rangetable            14     6 (fixed)
; spacedrange           26     9 (fixed)
; locatedrange          10     3 (fixed)
;	Chosen strategy is simple_byte

	opt asmopt_off
	xorlw	0^0	; case 0
	skipnz
	goto	l4218
	xorlw	1^0	; case 1
	skipnz
	goto	l4230
	xorlw	2^1	; case 2
	skipnz
	goto	l715
	xorlw	3^2	; case 3
	skipnz
	goto	l4244
	xorlw	4^3	; case 4
	skipnz
	goto	l4268
	xorlw	5^4	; case 5
	skipnz
	goto	l4272
	xorlw	8^5	; case 8
	skipnz
	goto	l4652
	xorlw	9^8	; case 9
	skipnz
	goto	l4686
	goto	l706
	opt asmopt_on

	global	start
	ljmp	start
	opt stack 0
psect	maintext
	line	1084
GLOBAL	__end_of_main
	__end_of_main:
;; =============== function _main ends ============

	signat	_main,88
	global	_process_AD_Converter_Value
psect	text778,local,class=CODE,delta=2
global __ptext778
__ptext778:

;; *************** function _process_AD_Converter_Value *****************
;; Defined at:
;;		line 249 in file "C:\190604\AK7030-OTP\common.c"
;; Parameters:    Size  Location     Type
;;		None
;; Auto vars:     Size  Location     Type
;;		None
;; Return value:  Size  Location     Type
;;		None               void
;; Registers used:
;;		wreg, fsr0l, fsr0h, status,2, status,0, pclath, cstack
;; Tracked objects:
;;		On entry : 60/20
;;		On exit  : 40/0
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
;;		_getAD_ConvertFlag
;;		_setAD_ConvertFlag
;;		_AD_Sample
;;		_adc_test_init
;;		_setAdcSampleChannel
;;		_adc_start
;; This function is called by:
;;		_main
;; This function uses a non-reentrant model
;;
psect	text778
	file	"C:\190604\AK7030-OTP\common.c"
	line	249
	global	__size_of_process_AD_Converter_Value
	__size_of_process_AD_Converter_Value	equ	__end_of_process_AD_Converter_Value-_process_AD_Converter_Value
	
_process_AD_Converter_Value:	
	opt	stack 3
; Regs used in _process_AD_Converter_Value: [wreg-fsr0h+status,2+status,0+pclath+cstack]
	line	250
	
l4170:	
;common.c: 250: if(getAD_ConvertFlag())
	fcall	_getAD_ConvertFlag
	xorlw	0
	skipnz
	goto	u1251
	goto	u1250
u1251:
	goto	l1682
u1250:
	line	252
	
l4172:	
;common.c: 251: {
;common.c: 252: setAD_ConvertFlag(0);
	movlw	(0)
	fcall	_setAD_ConvertFlag
	line	253
	
l4174:	
;common.c: 253: AD_Sample();
	fcall	_AD_Sample
	line	254
	
l4176:	
;common.c: 254: if(4 == sampleChannelSelect)
	movf	(_sampleChannelSelect),w
	xorlw	04h
	skipz
	goto	u1261
	goto	u1260
u1261:
	goto	l4180
u1260:
	line	255
	
l4178:	
;common.c: 255: adc_test_init(4,3);
	movlw	(03h)
	movwf	(?_adc_test_init)
	movlw	(04h)
	fcall	_adc_test_init
	goto	l1679
	line	256
	
l4180:	
;common.c: 256: else if(1 == sampleChannelSelect)
	decf	(_sampleChannelSelect),w
	skipz
	goto	u1271
	goto	u1270
u1271:
	goto	l4184
u1270:
	line	257
	
l4182:	
;common.c: 257: adc_test_init(1,3);
	movlw	(03h)
	movwf	(?_adc_test_init)
	movlw	(01h)
	fcall	_adc_test_init
	goto	l1679
	line	259
	
l4184:	
;common.c: 258: else
;common.c: 259: adc_test_init(14,3);
	movlw	(03h)
	movwf	(?_adc_test_init)
	movlw	(0Eh)
	fcall	_adc_test_init
	
l1679:	
	line	260
;common.c: 260: setAdcSampleChannel(sampleChannelSelect);
	bcf	status, 5	;RP0=0, select bank0
	movf	(_sampleChannelSelect),w
	fcall	_setAdcSampleChannel
	line	261
	
l4186:	
;common.c: 261: adc_start();
	fcall	_adc_start
	line	263
	
l1682:	
	return
	opt stack 0
GLOBAL	__end_of_process_AD_Converter_Value
	__end_of_process_AD_Converter_Value:
;; =============== function _process_AD_Converter_Value ends ============

	signat	_process_AD_Converter_Value,88
	global	_clearPinPortAndTimer
psect	text779,local,class=CODE,delta=2
global __ptext779
__ptext779:

;; *************** function _clearPinPortAndTimer *****************
;; Defined at:
;;		line 92 in file "C:\190604\AK7030-OTP\main.c"
;; Parameters:    Size  Location     Type
;;		None
;; Auto vars:     Size  Location     Type
;;		None
;; Return value:  Size  Location     Type
;;		None               void
;; Registers used:
;;		status,2, status,0, pclath, cstack
;; Tracked objects:
;;		On entry : 140/0
;;		On exit  : 160/20
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
;;		_clearAllTimer
;; This function is called by:
;;		_main
;; This function uses a non-reentrant model
;;
psect	text779
	file	"C:\190604\AK7030-OTP\main.c"
	line	92
	global	__size_of_clearPinPortAndTimer
	__size_of_clearPinPortAndTimer	equ	__end_of_clearPinPortAndTimer-_clearPinPortAndTimer
	
_clearPinPortAndTimer:	
	opt	stack 3
; Regs used in _clearPinPortAndTimer: [status,2+status,0+pclath+cstack]
	line	93
	
l4166:	
;main.c: 93: PB0 = 0;
	bcf	status, 5	;RP0=0, select bank0
	bcf	(48/8),(48)&7
	line	94
;main.c: 94: PA0 = 0;
	bcf	(40/8),(40)&7
	line	95
;main.c: 95: PA1 = 0;
	bcf	(41/8),(41)&7
	line	96
;main.c: 96: PA2 = 0;
	bcf	(42/8),(42)&7
	line	97
;main.c: 97: PA3 = 0;
	bcf	(43/8),(43)&7
	line	98
;main.c: 98: PAOD7 = 0;
	bsf	status, 5	;RP0=1, select bank3
	bsf	status, 6	;RP1=1, select bank3
	bcf	(3135/8)^0180h,(3135)&7
	line	99
;main.c: 99: PA7 = 0;
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	bcf	(47/8),(47)&7
	line	100
	
l4168:	
;main.c: 100: clearAllTimer();
	fcall	_clearAllTimer
	line	101
	
l680:	
	return
	opt stack 0
GLOBAL	__end_of_clearPinPortAndTimer
	__end_of_clearPinPortAndTimer:
;; =============== function _clearPinPortAndTimer ends ============

	signat	_clearPinPortAndTimer,88
	global	_AD_Sample
psect	text780,local,class=CODE,delta=2
global __ptext780
__ptext780:

;; *************** function _AD_Sample *****************
;; Defined at:
;;		line 275 in file "C:\190604\AK7030-OTP\common.c"
;; Parameters:    Size  Location     Type
;;		None
;; Auto vars:     Size  Location     Type
;;  index           1    4[BANK0 ] unsigned char 
;; Return value:  Size  Location     Type
;;		None               void
;; Registers used:
;;		wreg, fsr0l, fsr0h, status,2, status,0, pclath, cstack
;; Tracked objects:
;;		On entry : 60/20
;;		On exit  : 60/0
;;		Unchanged: FFE9F/0
;; Data sizes:     COMMON   BANK0   BANK1   BANK3   BANK2
;;      Params:         0       0       0       0       0
;;      Locals:         0       1       0       0       0
;;      Temps:          0       2       0       0       0
;;      Totals:         0       3       0       0       0
;;Total ram usage:        3 bytes
;; Hardware stack levels used:    1
;; Hardware stack levels required when called:    3
;; This function calls:
;;		_getAdOriginalValue
;; This function is called by:
;;		_process_AD_Converter_Value
;; This function uses a non-reentrant model
;;
psect	text780
	file	"C:\190604\AK7030-OTP\common.c"
	line	275
	global	__size_of_AD_Sample
	__size_of_AD_Sample	equ	__end_of_AD_Sample-_AD_Sample
	
_AD_Sample:	
	opt	stack 3
; Regs used in _AD_Sample: [wreg-fsr0h+status,2+status,0+pclath+cstack]
	line	276
	
l4120:	
;common.c: 276: if(sampleTimes < 6)
	movlw	(06h)
	bcf	status, 5	;RP0=0, select bank0
	subwf	(_sampleTimes),w
	skipnc
	goto	u1171
	goto	u1170
u1171:
	goto	l1698
u1170:
	line	279
	
l4122:	
;common.c: 277: {
;common.c: 279: buffer_Sample_AD_Value[sampleTimes] = getAdOriginalValue();
	fcall	_getAdOriginalValue
	clrc
	rlf	(_sampleTimes),w
	addlw	_buffer_Sample_AD_Value&0ffh
	movwf	fsr0
	movf	(0+(?_getAdOriginalValue)),w
	bcf	status, 7	;select IRP bank1
	movwf	indf
	incf	fsr0,f
	movf	(1+(?_getAdOriginalValue)),w
	movwf	indf
	line	281
	
l4124:	
;common.c: 281: if(sampleTimes == 0)
	movf	(_sampleTimes),f
	skipz
	goto	u1181
	goto	u1180
u1181:
	goto	l4128
u1180:
	line	283
	
l4126:	
;common.c: 282: {
;common.c: 283: multiFilterMaxValue = buffer_Sample_AD_Value[0];
	bsf	status, 5	;RP0=1, select bank1
	movf	(_buffer_Sample_AD_Value+1)^080h,w
	movwf	(_multiFilterMaxValue+1)^080h
	movf	(_buffer_Sample_AD_Value)^080h,w
	movwf	(_multiFilterMaxValue)^080h
	line	284
;common.c: 284: multiFilterMinValue = buffer_Sample_AD_Value[0];
	movf	(_buffer_Sample_AD_Value+1)^080h,w
	movwf	(_multiFilterMinValue+1)^080h
	movf	(_buffer_Sample_AD_Value)^080h,w
	movwf	(_multiFilterMinValue)^080h
	line	287
	
l4128:	
;common.c: 285: }
;common.c: 287: if(multiFilterMaxValue < buffer_Sample_AD_Value[sampleTimes])
	bcf	status, 5	;RP0=0, select bank0
	clrc
	rlf	(_sampleTimes),w
	addlw	_buffer_Sample_AD_Value&0ffh
	movwf	fsr0
	movf	indf,w
	movwf	(??_AD_Sample+0)+0+0
	incf	fsr0,f
	movf	indf,w
	movwf	(??_AD_Sample+0)+0+1
	movf	1+(??_AD_Sample+0)+0,w
	bsf	status, 5	;RP0=1, select bank1
	subwf	(_multiFilterMaxValue+1)^080h,w
	skipz
	goto	u1195
	bcf	status, 5	;RP0=0, select bank0
	movf	0+(??_AD_Sample+0)+0,w
	bsf	status, 5	;RP0=1, select bank1
	subwf	(_multiFilterMaxValue)^080h,w
u1195:
	skipnc
	goto	u1191
	goto	u1190
u1191:
	goto	l1687
u1190:
	line	289
	
l4130:	
;common.c: 288: {
;common.c: 289: multiFilterMaxValue = buffer_Sample_AD_Value[sampleTimes];
	bcf	status, 5	;RP0=0, select bank0
	clrc
	rlf	(_sampleTimes),w
	addlw	_buffer_Sample_AD_Value&0ffh
	movwf	fsr0
	movf	indf,w
	bsf	status, 5	;RP0=1, select bank1
	movwf	(_multiFilterMaxValue)^080h
	incf	fsr0,f
	movf	indf,w
	movwf	(_multiFilterMaxValue+1)^080h
	line	290
	
l1687:	
	line	291
;common.c: 290: }
;common.c: 291: if(multiFilterMinValue > buffer_Sample_AD_Value[sampleTimes])
	bcf	status, 5	;RP0=0, select bank0
	clrc
	rlf	(_sampleTimes),w
	addlw	_buffer_Sample_AD_Value&0ffh
	movwf	fsr0
	movf	indf,w
	movwf	(??_AD_Sample+0)+0+0
	incf	fsr0,f
	movf	indf,w
	movwf	(??_AD_Sample+0)+0+1
	bsf	status, 5	;RP0=1, select bank1
	movf	(_multiFilterMinValue+1)^080h,w
	bcf	status, 5	;RP0=0, select bank0
	subwf	1+(??_AD_Sample+0)+0,w
	skipz
	goto	u1205
	bsf	status, 5	;RP0=1, select bank1
	movf	(_multiFilterMinValue)^080h,w
	bcf	status, 5	;RP0=0, select bank0
	subwf	0+(??_AD_Sample+0)+0,w
u1205:
	skipnc
	goto	u1201
	goto	u1200
u1201:
	goto	l4134
u1200:
	line	293
	
l4132:	
;common.c: 292: {
;common.c: 293: multiFilterMinValue = buffer_Sample_AD_Value[sampleTimes];
	clrc
	rlf	(_sampleTimes),w
	addlw	_buffer_Sample_AD_Value&0ffh
	movwf	fsr0
	movf	indf,w
	bsf	status, 5	;RP0=1, select bank1
	movwf	(_multiFilterMinValue)^080h
	incf	fsr0,f
	movf	indf,w
	movwf	(_multiFilterMinValue+1)^080h
	line	298
	
l4134:	
;common.c: 298: sampleTimes++;
	bcf	status, 5	;RP0=0, select bank0
	incf	(_sampleTimes),f
	line	300
	
l4136:	
;common.c: 300: if(sampleTimes >= 6)
	movlw	(06h)
	subwf	(_sampleTimes),w
	skipc
	goto	u1211
	goto	u1210
u1211:
	goto	l1698
u1210:
	line	302
	
l4138:	
;common.c: 301: {
;common.c: 302: sampleTimes = 0;
	clrf	(_sampleTimes)
	line	304
	
l4140:	
;common.c: 305: {
;common.c: 307: sampleCH14Value = ((multiFilterSumValue - multiFilterMaxValue - multiFilterMinValue))>> 2;
	movf	(_sampleChannelSelect),w
	xorlw	0Eh
	skipz
	goto	u1221
	goto	u1220
u1221:
	goto	l4144
u1220:
	line	308
	
l4142:	
;common.c: 308: sampleChannelSelect = 4;
	movlw	(04h)
	movwf	(_sampleChannelSelect)
	line	309
;common.c: 309: }
	goto	l4154
	line	310
	
l4144:	
;common.c: 311: {
;common.c: 312: sampleCH4Value = ((multiFilterSumValue - multiFilterMaxValue - multiFilterMinValue))>> 2;
	movf	(_sampleChannelSelect),w
	xorlw	04h
	skipz
	goto	u1231
	goto	u1230
u1231:
	goto	l4148
u1230:
	line	313
	
l4146:	
;common.c: 313: sampleChannelSelect = 1;
	clrf	(_sampleChannelSelect)
	incf	(_sampleChannelSelect),f
	line	314
;common.c: 314: }
	goto	l4154
	line	315
	
l4148:	
	line	318
	
l4150:	
;common.c: 318: sampleChannelSelect = 14;
	movlw	(0Eh)
	movwf	(_sampleChannelSelect)
	line	326
;common.c: 319: }
	
l4154:	
;common.c: 324: }
;common.c: 326: for(unsigned char index = 0; index < 6;index++)
	clrf	(AD_Sample@index)
	line	327
	
l4160:	
;common.c: 327: buffer_Sample_AD_Value[index] = 0;
	clrc
	rlf	(AD_Sample@index),w
	addlw	_buffer_Sample_AD_Value&0ffh
	movwf	fsr0
	clrf	indf
	incf	fsr0,f
	clrf	indf
	line	326
	
l4162:	
	incf	(AD_Sample@index),f
	
l4164:	
	movlw	(06h)
	subwf	(AD_Sample@index),w
	skipc
	goto	u1241
	goto	u1240
u1241:
	goto	l4160
u1240:
	line	331
	
l1698:	
	return
	opt stack 0
GLOBAL	__end_of_AD_Sample
	__end_of_AD_Sample:
;; =============== function _AD_Sample ends ============

	signat	_AD_Sample,88
	global	_getAdOriginaCh4Value
psect	text781,local,class=CODE,delta=2
global __ptext781
__ptext781:

;; *************** function _getAdOriginaCh4Value *****************
;; Defined at:
;;		line 227 in file "C:\190604\AK7030-OTP\common.c"
;; Parameters:    Size  Location     Type
;;		None
;; Auto vars:     Size  Location     Type
;;		None
;; Return value:  Size  Location     Type
;;                  2   54[BANK0 ] unsigned int 
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
psect	text781
	file	"C:\190604\AK7030-OTP\common.c"
	line	227
	global	__size_of_getAdOriginaCh4Value
	__size_of_getAdOriginaCh4Value	equ	__end_of_getAdOriginaCh4Value-_getAdOriginaCh4Value
	
_getAdOriginaCh4Value:	
	opt	stack 4
; Regs used in _getAdOriginaCh4Value: [wreg-fsr0h+status,2+status,0+btemp+1+pclath+cstack]
	line	229
	
l4116:	
;common.c: 229: return Filter(uiSampleChannelFourth);
	movlw	(_uiSampleChannelFourth&0ffh)
	movwf	(?_Filter)
	movlw	(0x1/2)
	movwf	(?_Filter+1)
	fcall	_Filter
	movf	(1+(?_Filter)),w
	movwf	(?_getAdOriginaCh4Value+1)
	movf	(0+(?_Filter)),w
	movwf	(?_getAdOriginaCh4Value)
	line	234
	
l1671:	
	return
	opt stack 0
GLOBAL	__end_of_getAdOriginaCh4Value
	__end_of_getAdOriginaCh4Value:
;; =============== function _getAdOriginaCh4Value ends ============

	signat	_getAdOriginaCh4Value,90
	global	_getAdOriginalCh1Value
psect	text782,local,class=CODE,delta=2
global __ptext782
__ptext782:

;; *************** function _getAdOriginalCh1Value *****************
;; Defined at:
;;		line 215 in file "C:\190604\AK7030-OTP\common.c"
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
;;		_main
;; This function uses a non-reentrant model
;;
psect	text782
	file	"C:\190604\AK7030-OTP\common.c"
	line	215
	global	__size_of_getAdOriginalCh1Value
	__size_of_getAdOriginalCh1Value	equ	__end_of_getAdOriginalCh1Value-_getAdOriginalCh1Value
	
_getAdOriginalCh1Value:	
	opt	stack 4
; Regs used in _getAdOriginalCh1Value: [wreg-fsr0h+status,2+status,0+btemp+1+pclath+cstack]
	line	218
	
l4112:	
;common.c: 218: return Filter(uiSampleChannelFirst);
	movlw	(_uiSampleChannelFirst&0ffh)
	bcf	status, 5	;RP0=0, select bank0
	movwf	(?_Filter)
	movlw	(0x3/2)
	movwf	(?_Filter+1)
	fcall	_Filter
	movf	(1+(?_Filter)),w
	movwf	(?_getAdOriginalCh1Value+1)
	movf	(0+(?_Filter)),w
	movwf	(?_getAdOriginalCh1Value)
	line	223
	
l1668:	
	return
	opt stack 0
GLOBAL	__end_of_getAdOriginalCh1Value
	__end_of_getAdOriginalCh1Value:
;; =============== function _getAdOriginalCh1Value ends ============

	signat	_getAdOriginalCh1Value,90
	global	_getAdOriginalCh14Value
psect	text783,local,class=CODE,delta=2
global __ptext783
__ptext783:

;; *************** function _getAdOriginalCh14Value *****************
;; Defined at:
;;		line 238 in file "C:\190604\AK7030-OTP\common.c"
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
;;		_main
;; This function uses a non-reentrant model
;;
psect	text783
	file	"C:\190604\AK7030-OTP\common.c"
	line	238
	global	__size_of_getAdOriginalCh14Value
	__size_of_getAdOriginalCh14Value	equ	__end_of_getAdOriginalCh14Value-_getAdOriginalCh14Value
	
_getAdOriginalCh14Value:	
	opt	stack 4
; Regs used in _getAdOriginalCh14Value: [wreg-fsr0h+status,2+status,0+btemp+1+pclath+cstack]
	line	240
	
l4108:	
;common.c: 240: return Filter(uiSampleChannelFourteenth);
	movlw	(_uiSampleChannelFourteenth&0ffh)
	bcf	status, 5	;RP0=0, select bank0
	movwf	(?_Filter)
	movlw	(0x3/2)
	movwf	(?_Filter+1)
	fcall	_Filter
	movf	(1+(?_Filter)),w
	movwf	(?_getAdOriginalCh14Value+1)
	movf	(0+(?_Filter)),w
	movwf	(?_getAdOriginalCh14Value)
	line	244
	
l1674:	
	return
	opt stack 0
GLOBAL	__end_of_getAdOriginalCh14Value
	__end_of_getAdOriginalCh14Value:
;; =============== function _getAdOriginalCh14Value ends ============

	signat	_getAdOriginalCh14Value,90
	global	_clearAllTimer
psect	text784,local,class=CODE,delta=2
global __ptext784
__ptext784:

;; *************** function _clearAllTimer *****************
;; Defined at:
;;		line 83 in file "C:\190604\AK7030-OTP\main.c"
;; Parameters:    Size  Location     Type
;;		None
;; Auto vars:     Size  Location     Type
;;		None
;; Return value:  Size  Location     Type
;;		None               void
;; Registers used:
;;		status,2, status,0, pclath, cstack
;; Tracked objects:
;;		On entry : 140/20
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
;;		_clearTwelveHoursTimer
;;		_clearThreeHoursTimer
;;		_clearTwentySecondsTimer
;; This function is called by:
;;		_clearPinPortAndTimer
;;		_main
;; This function uses a non-reentrant model
;;
psect	text784
	file	"C:\190604\AK7030-OTP\main.c"
	line	83
	global	__size_of_clearAllTimer
	__size_of_clearAllTimer	equ	__end_of_clearAllTimer-_clearAllTimer
	
_clearAllTimer:	
	opt	stack 4
; Regs used in _clearAllTimer: [status,2+status,0+pclath+cstack]
	line	84
	
l4106:	
;main.c: 84: clearTwelveHoursTimer();
	fcall	_clearTwelveHoursTimer
	line	85
;main.c: 85: clearThreeHoursTimer();
	fcall	_clearThreeHoursTimer
	line	86
;main.c: 86: clearTwentySecondsTimer();
	fcall	_clearTwentySecondsTimer
	line	87
	
l677:	
	return
	opt stack 0
GLOBAL	__end_of_clearAllTimer
	__end_of_clearAllTimer:
;; =============== function _clearAllTimer ends ============

	signat	_clearAllTimer,88
	global	_setAdcSampleChannel
psect	text785,local,class=CODE,delta=2
global __ptext785
__ptext785:

;; *************** function _setAdcSampleChannel *****************
;; Defined at:
;;		line 95 in file "C:\190604\AK7030-OTP\periph.c"
;; Parameters:    Size  Location     Type
;;  ucChannel       1    wreg     unsigned char 
;; Auto vars:     Size  Location     Type
;;  ucChannel       1    1[BANK0 ] unsigned char 
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
;;      Temps:          0       1       0       0       0
;;      Totals:         0       2       0       0       0
;;Total ram usage:        2 bytes
;; Hardware stack levels used:    1
;; Hardware stack levels required when called:    2
;; This function calls:
;;		Nothing
;; This function is called by:
;;		_process_AD_Converter_Value
;; This function uses a non-reentrant model
;;
psect	text785
	file	"C:\190604\AK7030-OTP\periph.c"
	line	95
	global	__size_of_setAdcSampleChannel
	__size_of_setAdcSampleChannel	equ	__end_of_setAdcSampleChannel-_setAdcSampleChannel
	
_setAdcSampleChannel:	
	opt	stack 4
; Regs used in _setAdcSampleChannel: [wreg+status,2+status,0]
;setAdcSampleChannel@ucChannel stored from wreg
	movwf	(setAdcSampleChannel@ucChannel)
	line	96
	
l4056:	
;periph.c: 96: ADCON0|=ucChannel<<2;
	movf	(setAdcSampleChannel@ucChannel),w
	movwf	(??_setAdcSampleChannel+0)+0
	clrc
	rlf	(??_setAdcSampleChannel+0)+0,f
	clrc
	rlf	(??_setAdcSampleChannel+0)+0,w
	iorwf	(31),f	;volatile
	line	97
	
l2413:	
	return
	opt stack 0
GLOBAL	__end_of_setAdcSampleChannel
	__end_of_setAdcSampleChannel:
;; =============== function _setAdcSampleChannel ends ============

	signat	_setAdcSampleChannel,4216
	global	_getAdOriginalValue
psect	text786,local,class=CODE,delta=2
global __ptext786
__ptext786:

;; *************** function _getAdOriginalValue *****************
;; Defined at:
;;		line 210 in file "C:\190604\AK7030-OTP\common.c"
;; Parameters:    Size  Location     Type
;;		None
;; Auto vars:     Size  Location     Type
;;		None
;; Return value:  Size  Location     Type
;;                  2    0[BANK0 ] unsigned int 
;; Registers used:
;;		wreg
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
;;		_AD_Sample
;; This function uses a non-reentrant model
;;
psect	text786
	file	"C:\190604\AK7030-OTP\common.c"
	line	210
	global	__size_of_getAdOriginalValue
	__size_of_getAdOriginalValue	equ	__end_of_getAdOriginalValue-_getAdOriginalValue
	
_getAdOriginalValue:	
	opt	stack 3
; Regs used in _getAdOriginalValue: [wreg]
	line	211
	
l4052:	
;common.c: 211: return adc_original_value;
	bsf	status, 5	;RP0=1, select bank1
	movf	(_adc_original_value+1)^080h,w
	bcf	status, 5	;RP0=0, select bank0
	movwf	(?_getAdOriginalValue+1)
	bsf	status, 5	;RP0=1, select bank1
	movf	(_adc_original_value)^080h,w
	bcf	status, 5	;RP0=0, select bank0
	movwf	(?_getAdOriginalValue)
	line	212
	
l1665:	
	return
	opt stack 0
GLOBAL	__end_of_getAdOriginalValue
	__end_of_getAdOriginalValue:
;; =============== function _getAdOriginalValue ends ============

	signat	_getAdOriginalValue,90
	global	_setAD_ConvertFlag
psect	text787,local,class=CODE,delta=2
global __ptext787
__ptext787:

;; *************** function _setAD_ConvertFlag *****************
;; Defined at:
;;		line 204 in file "C:\190604\AK7030-OTP\common.c"
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
psect	text787
	file	"C:\190604\AK7030-OTP\common.c"
	line	204
	global	__size_of_setAD_ConvertFlag
	__size_of_setAD_ConvertFlag	equ	__end_of_setAD_ConvertFlag-_setAD_ConvertFlag
	
_setAD_ConvertFlag:	
	opt	stack 4
; Regs used in _setAD_ConvertFlag: [wreg]
;setAD_ConvertFlag@flag stored from wreg
	bcf	status, 5	;RP0=0, select bank0
	movwf	(setAD_ConvertFlag@flag)
	line	205
	
l4050:	
;common.c: 205: adc_convert_flag = flag;
	movf	(setAD_ConvertFlag@flag),w
	bsf	status, 5	;RP0=1, select bank1
	movwf	(_adc_convert_flag)^080h
	line	206
	
l1662:	
	return
	opt stack 0
GLOBAL	__end_of_setAD_ConvertFlag
	__end_of_setAD_ConvertFlag:
;; =============== function _setAD_ConvertFlag ends ============

	signat	_setAD_ConvertFlag,4216
	global	_getAD_ConvertFlag
psect	text788,local,class=CODE,delta=2
global __ptext788
__ptext788:

;; *************** function _getAD_ConvertFlag *****************
;; Defined at:
;;		line 198 in file "C:\190604\AK7030-OTP\common.c"
;; Parameters:    Size  Location     Type
;;		None
;; Auto vars:     Size  Location     Type
;;		None
;; Return value:  Size  Location     Type
;;                  1    wreg      unsigned char 
;; Registers used:
;;		wreg
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
;;		_process_AD_Converter_Value
;; This function uses a non-reentrant model
;;
psect	text788
	file	"C:\190604\AK7030-OTP\common.c"
	line	198
	global	__size_of_getAD_ConvertFlag
	__size_of_getAD_ConvertFlag	equ	__end_of_getAD_ConvertFlag-_getAD_ConvertFlag
	
_getAD_ConvertFlag:	
	opt	stack 4
; Regs used in _getAD_ConvertFlag: [wreg]
	line	199
	
l4046:	
;common.c: 199: return adc_convert_flag;
	movf	(_adc_convert_flag)^080h,w
	line	200
	
l1659:	
	return
	opt stack 0
GLOBAL	__end_of_getAD_ConvertFlag
	__end_of_getAD_ConvertFlag:
;; =============== function _getAD_ConvertFlag ends ============

	signat	_getAD_ConvertFlag,89
	global	_Filter
psect	text789,local,class=CODE,delta=2
global __ptext789
__ptext789:

;; *************** function _Filter *****************
;; Defined at:
;;		line 49 in file "C:\190604\AK7030-OTP\common.c"
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
;;		_getAdOriginalCh1Value
;;		_getAdOriginaCh4Value
;;		_getAdOriginalCh14Value
;; This function uses a non-reentrant model
;;
psect	text789
	file	"C:\190604\AK7030-OTP\common.c"
	line	49
	global	__size_of_Filter
	__size_of_Filter	equ	__end_of_Filter-_Filter
	
_Filter:	
	opt	stack 4
; Regs used in _Filter: [wreg-fsr0h+status,2+status,0+btemp+1]
	line	51
	
l3950:	
	clrf	(Filter@j)
	line	53
;common.c: 53: unsigned int filter_temp = 0, filter_sum = 0;
	clrf	(Filter@filter_temp)
	clrf	(Filter@filter_temp+1)
	clrf	(Filter@filter_sum)
	clrf	(Filter@filter_sum+1)
	line	57
;common.c: 55: unsigned int filter_buf[20];
;common.c: 57: for(int cir = 0;cir < 20; cir++)
	clrf	(Filter@cir)
	clrf	(Filter@cir+1)
	line	58
	
l3956:	
;common.c: 58: filter_buf[cir] = *tmpValue++;
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
	
l3958:	
	movlw	02h
	addwf	(Filter@tmpValue),f
	skipnc
	incf	(Filter@tmpValue+1),f
	line	57
	
l3960:	
	incf	(Filter@cir),f
	skipnz
	incf	(Filter@cir+1),f
	
l3962:	
	movf	(Filter@cir+1),w
	xorlw	80h
	movwf	btemp+1
	movlw	(high(014h))^80h
	subwf	btemp+1,w
	skipz
	goto	u975
	movlw	low(014h)
	subwf	(Filter@cir),w
u975:

	skipc
	goto	u971
	goto	u970
u971:
	goto	l3956
u970:
	line	61
	
l3964:	
;common.c: 61: for(j = 0; j < 20 - 1; j++)
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	clrf	(Filter@j)
	line	63
	
l3970:	
;common.c: 62: {
;common.c: 63: for(i = 0; i < 20 - 1 - j; i++)
	clrf	(Filter@i)
	goto	l3978
	line	65
	
l3972:	
;common.c: 64: {
;common.c: 65: if(filter_buf[i] > filter_buf[i + 1])
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
	goto	u985
	movf	0+(??_Filter+0)+0,w
	subwf	0+(??_Filter+2)+0,w
u985:
	skipnc
	goto	u981
	goto	u980
u981:
	goto	l3976
u980:
	line	68
	
l3974:	
;common.c: 66: {
;common.c: 68: filter_temp = filter_buf[i];
	clrc
	rlf	(Filter@i),w
	addlw	Filter@filter_buf&0ffh
	movwf	fsr0
	movf	indf,w
	movwf	(Filter@filter_temp)
	incf	fsr0,f
	movf	indf,w
	movwf	(Filter@filter_temp+1)
	line	70
;common.c: 70: filter_buf[i] = filter_buf[i + 1];
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
	line	72
;common.c: 72: filter_buf[i + 1] = filter_temp;
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
	line	63
	
l3976:	
	incf	(Filter@i),f
	
l3978:	
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
	goto	u995
	movf	0+(??_Filter+0)+0,w
	subwf	(Filter@i),w
u995:

	skipc
	goto	u991
	goto	u990
u991:
	goto	l3972
u990:
	line	61
	
l3980:	
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	incf	(Filter@j),f
	
l3982:	
	movlw	(013h)
	subwf	(Filter@j),w
	skipc
	goto	u1001
	goto	u1000
u1001:
	goto	l3970
u1000:
	line	77
	
l3984:	
;common.c: 73: }
;common.c: 74: }
;common.c: 75: }
;common.c: 77: for(i = 2; i < 20 - 2; i++)
	movlw	(02h)
	movwf	(Filter@i)
	line	79
	
l3988:	
;common.c: 78: {
;common.c: 79: filter_sum += filter_buf[i];
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
	line	77
	
l3990:	
	incf	(Filter@i),f
	
l3992:	
	movlw	(012h)
	subwf	(Filter@i),w
	skipc
	goto	u1011
	goto	u1010
u1011:
	goto	l3988
u1010:
	line	82
	
l3994:	
;common.c: 80: }
;common.c: 82: return (filter_sum >> 4);
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
	line	84
	
l1621:	
	return
	opt stack 0
GLOBAL	__end_of_Filter
	__end_of_Filter:
;; =============== function _Filter ends ============

	signat	_Filter,4218
	global	_isFinishedThreeHoursTimer
psect	text790,local,class=CODE,delta=2
global __ptext790
__ptext790:

;; *************** function _isFinishedThreeHoursTimer *****************
;; Defined at:
;;		line 414 in file "C:\190604\AK7030-OTP\common.c"
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
psect	text790
	file	"C:\190604\AK7030-OTP\common.c"
	line	414
	global	__size_of_isFinishedThreeHoursTimer
	__size_of_isFinishedThreeHoursTimer	equ	__end_of_isFinishedThreeHoursTimer-_isFinishedThreeHoursTimer
	
_isFinishedThreeHoursTimer:	
	opt	stack 5
; Regs used in _isFinishedThreeHoursTimer: [wreg+status,2+status,0]
	line	415
	
l3938:	
;common.c: 415: if(uiSmallTimer == 0)
	bsf	status, 5	;RP0=1, select bank1
	movf	((_uiSmallTimer+1)^080h),w
	iorwf	((_uiSmallTimer)^080h),w
	skipz
	goto	u961
	goto	u960
u961:
	goto	l3946
u960:
	line	416
	
l3940:	
;common.c: 416: return 1;
	movlw	(01h)
	goto	l1741
	line	418
	
l3946:	
;common.c: 417: else
;common.c: 418: return 0;
	movlw	(0)
	line	419
	
l1741:	
	return
	opt stack 0
GLOBAL	__end_of_isFinishedThreeHoursTimer
	__end_of_isFinishedThreeHoursTimer:
;; =============== function _isFinishedThreeHoursTimer ends ============

	signat	_isFinishedThreeHoursTimer,89
	global	_startThreeHoursTimer
psect	text791,local,class=CODE,delta=2
global __ptext791
__ptext791:

;; *************** function _startThreeHoursTimer *****************
;; Defined at:
;;		line 380 in file "C:\190604\AK7030-OTP\common.c"
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
psect	text791
	file	"C:\190604\AK7030-OTP\common.c"
	line	380
	global	__size_of_startThreeHoursTimer
	__size_of_startThreeHoursTimer	equ	__end_of_startThreeHoursTimer-_startThreeHoursTimer
	
_startThreeHoursTimer:	
	opt	stack 5
; Regs used in _startThreeHoursTimer: [wreg+status,2+status,0]
	line	381
	
l3934:	
;common.c: 381: if(0 == uiSmallTimer)
	bsf	status, 5	;RP0=1, select bank1
	movf	((_uiSmallTimer+1)^080h),w
	iorwf	((_uiSmallTimer)^080h),w
	skipz
	goto	u951
	goto	u950
u951:
	goto	l1724
u950:
	line	382
	
l3936:	
;common.c: 382: uiSmallTimer = uiSetTime;
	bcf	status, 5	;RP0=0, select bank0
	movf	(startThreeHoursTimer@uiSetTime+1),w
	bsf	status, 5	;RP0=1, select bank1
	movwf	(_uiSmallTimer+1)^080h
	bcf	status, 5	;RP0=0, select bank0
	movf	(startThreeHoursTimer@uiSetTime),w
	bsf	status, 5	;RP0=1, select bank1
	movwf	(_uiSmallTimer)^080h
	line	387
	
l1724:	
	return
	opt stack 0
GLOBAL	__end_of_startThreeHoursTimer
	__end_of_startThreeHoursTimer:
;; =============== function _startThreeHoursTimer ends ============

	signat	_startThreeHoursTimer,4216
	global	_isFinishedTwentySecondsTimer
psect	text792,local,class=CODE,delta=2
global __ptext792
__ptext792:

;; *************** function _isFinishedTwentySecondsTimer *****************
;; Defined at:
;;		line 397 in file "C:\190604\AK7030-OTP\common.c"
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
psect	text792
	file	"C:\190604\AK7030-OTP\common.c"
	line	397
	global	__size_of_isFinishedTwentySecondsTimer
	__size_of_isFinishedTwentySecondsTimer	equ	__end_of_isFinishedTwentySecondsTimer-_isFinishedTwentySecondsTimer
	
_isFinishedTwentySecondsTimer:	
	opt	stack 5
; Regs used in _isFinishedTwentySecondsTimer: [wreg+status,2+status,0]
	line	398
	
l3922:	
;common.c: 398: if(0 == uiTwentySecondsTimer)
	bsf	status, 5	;RP0=1, select bank1
	movf	((_uiTwentySecondsTimer+1)^080h),w
	iorwf	((_uiTwentySecondsTimer)^080h),w
	skipz
	goto	u941
	goto	u940
u941:
	goto	l3930
u940:
	line	399
	
l3924:	
;common.c: 399: return 1;
	movlw	(01h)
	goto	l1731
	line	401
	
l3930:	
;common.c: 400: else
;common.c: 401: return 0;
	movlw	(0)
	line	402
	
l1731:	
	return
	opt stack 0
GLOBAL	__end_of_isFinishedTwentySecondsTimer
	__end_of_isFinishedTwentySecondsTimer:
;; =============== function _isFinishedTwentySecondsTimer ends ============

	signat	_isFinishedTwentySecondsTimer,89
	global	_startTwentySecondsTimer
psect	text793,local,class=CODE,delta=2
global __ptext793
__ptext793:

;; *************** function _startTwentySecondsTimer *****************
;; Defined at:
;;		line 391 in file "C:\190604\AK7030-OTP\common.c"
;; Parameters:    Size  Location     Type
;;		None
;; Auto vars:     Size  Location     Type
;;		None
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
psect	text793
	file	"C:\190604\AK7030-OTP\common.c"
	line	391
	global	__size_of_startTwentySecondsTimer
	__size_of_startTwentySecondsTimer	equ	__end_of_startTwentySecondsTimer-_startTwentySecondsTimer
	
_startTwentySecondsTimer:	
	opt	stack 5
; Regs used in _startTwentySecondsTimer: [wreg]
	line	392
	
l3920:	
;common.c: 392: uiTwentySecondsTimer = 20;
	movlw	014h
	bsf	status, 5	;RP0=1, select bank1
	movwf	(_uiTwentySecondsTimer)^080h
	clrf	(_uiTwentySecondsTimer+1)^080h
	line	393
	
l1727:	
	return
	opt stack 0
GLOBAL	__end_of_startTwentySecondsTimer
	__end_of_startTwentySecondsTimer:
;; =============== function _startTwentySecondsTimer ends ============

	signat	_startTwentySecondsTimer,88
	global	_isFinishedTwelveHoursTimer
psect	text794,local,class=CODE,delta=2
global __ptext794
__ptext794:

;; *************** function _isFinishedTwelveHoursTimer *****************
;; Defined at:
;;		line 406 in file "C:\190604\AK7030-OTP\common.c"
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
psect	text794
	file	"C:\190604\AK7030-OTP\common.c"
	line	406
	global	__size_of_isFinishedTwelveHoursTimer
	__size_of_isFinishedTwelveHoursTimer	equ	__end_of_isFinishedTwelveHoursTimer-_isFinishedTwelveHoursTimer
	
_isFinishedTwelveHoursTimer:	
	opt	stack 5
; Regs used in _isFinishedTwelveHoursTimer: [wreg+status,2+status,0]
	line	407
	
l3908:	
;common.c: 407: if(uiBigTimer == 0)
	bsf	status, 5	;RP0=1, select bank1
	movf	((_uiBigTimer+1)^080h),w
	iorwf	((_uiBigTimer)^080h),w
	skipz
	goto	u931
	goto	u930
u931:
	goto	l3916
u930:
	line	408
	
l3910:	
;common.c: 408: return 1;
	movlw	(01h)
	goto	l1736
	line	410
	
l3916:	
;common.c: 409: else
;common.c: 410: return 0;
	movlw	(0)
	line	411
	
l1736:	
	return
	opt stack 0
GLOBAL	__end_of_isFinishedTwelveHoursTimer
	__end_of_isFinishedTwelveHoursTimer:
;; =============== function _isFinishedTwelveHoursTimer ends ============

	signat	_isFinishedTwelveHoursTimer,89
	global	_startTwelveHourTimer
psect	text795,local,class=CODE,delta=2
global __ptext795
__ptext795:

;; *************** function _startTwelveHourTimer *****************
;; Defined at:
;;		line 352 in file "C:\190604\AK7030-OTP\common.c"
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
psect	text795
	file	"C:\190604\AK7030-OTP\common.c"
	line	352
	global	__size_of_startTwelveHourTimer
	__size_of_startTwelveHourTimer	equ	__end_of_startTwelveHourTimer-_startTwelveHourTimer
	
_startTwelveHourTimer:	
	opt	stack 5
; Regs used in _startTwelveHourTimer: [wreg+status,2+status,0]
	line	353
	
l3904:	
;common.c: 353: if(0 == uiBigTimer)
	bsf	status, 5	;RP0=1, select bank1
	movf	((_uiBigTimer+1)^080h),w
	iorwf	((_uiBigTimer)^080h),w
	skipz
	goto	u921
	goto	u920
u921:
	goto	l1711
u920:
	line	354
	
l3906:	
;common.c: 354: uiBigTimer = uiSetTime;
	bcf	status, 5	;RP0=0, select bank0
	movf	(startTwelveHourTimer@uiSetTime+1),w
	bsf	status, 5	;RP0=1, select bank1
	movwf	(_uiBigTimer+1)^080h
	bcf	status, 5	;RP0=0, select bank0
	movf	(startTwelveHourTimer@uiSetTime),w
	bsf	status, 5	;RP0=1, select bank1
	movwf	(_uiBigTimer)^080h
	line	360
	
l1711:	
	return
	opt stack 0
GLOBAL	__end_of_startTwelveHourTimer
	__end_of_startTwelveHourTimer:
;; =============== function _startTwelveHourTimer ends ============

	signat	_startTwelveHourTimer,4216
	global	_clrSampeTime
psect	text796,local,class=CODE,delta=2
global __ptext796
__ptext796:

;; *************** function _clrSampeTime *****************
;; Defined at:
;;		line 432 in file "C:\190604\AK7030-OTP\common.c"
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
psect	text796
	file	"C:\190604\AK7030-OTP\common.c"
	line	432
	global	__size_of_clrSampeTime
	__size_of_clrSampeTime	equ	__end_of_clrSampeTime-_clrSampeTime
	
_clrSampeTime:	
	opt	stack 5
; Regs used in _clrSampeTime: [status,2]
	line	433
	
l3902:	
;common.c: 433: timer.timer10msStopWatch = 0;
	clrf	(_timer)^080h
	line	434
	
l1750:	
	return
	opt stack 0
GLOBAL	__end_of_clrSampeTime
	__end_of_clrSampeTime:
;; =============== function _clrSampeTime ends ============

	signat	_clrSampeTime,88
	global	_isPermitSampleTime
psect	text797,local,class=CODE,delta=2
global __ptext797
__ptext797:

;; *************** function _isPermitSampleTime *****************
;; Defined at:
;;		line 422 in file "C:\190604\AK7030-OTP\common.c"
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
psect	text797
	file	"C:\190604\AK7030-OTP\common.c"
	line	422
	global	__size_of_isPermitSampleTime
	__size_of_isPermitSampleTime	equ	__end_of_isPermitSampleTime-_isPermitSampleTime
	
_isPermitSampleTime:	
	opt	stack 5
; Regs used in _isPermitSampleTime: [wreg]
	line	423
	
l3890:	
;common.c: 423: if(timer.timer10msStopWatch >= 10)
	movlw	(0Ah)
	bsf	status, 5	;RP0=1, select bank1
	bcf	status, 6	;RP1=0, select bank1
	subwf	(_timer)^080h,w
	skipc
	goto	u911
	goto	u910
u911:
	goto	l3898
u910:
	line	425
	
l3892:	
;common.c: 424: {
;common.c: 425: return 1;
	movlw	(01h)
	goto	l1746
	line	428
	
l3898:	
;common.c: 427: else
;common.c: 428: return 0;
	movlw	(0)
	line	429
	
l1746:	
	return
	opt stack 0
GLOBAL	__end_of_isPermitSampleTime
	__end_of_isPermitSampleTime:
;; =============== function _isPermitSampleTime ends ============

	signat	_isPermitSampleTime,89
	global	_adc_start
psect	text798,local,class=CODE,delta=2
global __ptext798
__ptext798:

;; *************** function _adc_start *****************
;; Defined at:
;;		line 100 in file "C:\190604\AK7030-OTP\periph.c"
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
psect	text798
	file	"C:\190604\AK7030-OTP\periph.c"
	line	100
	global	__size_of_adc_start
	__size_of_adc_start	equ	__end_of_adc_start-_adc_start
	
_adc_start:	
	opt	stack 4
; Regs used in _adc_start: []
	line	101
	
l3888:	
;periph.c: 101: GO=1;
	bcf	status, 5	;RP0=0, select bank0
	bsf	(249/8),(249)&7
	line	102
	
l2416:	
	return
	opt stack 0
GLOBAL	__end_of_adc_start
	__end_of_adc_start:
;; =============== function _adc_start ends ============

	signat	_adc_start,88
	global	_op2_init
psect	text799,local,class=CODE,delta=2
global __ptext799
__ptext799:

;; *************** function _op2_init *****************
;; Defined at:
;;		line 45 in file "C:\190604\AK7030-OTP\periph.c"
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
psect	text799
	file	"C:\190604\AK7030-OTP\periph.c"
	line	45
	global	__size_of_op2_init
	__size_of_op2_init	equ	__end_of_op2_init-_op2_init
	
_op2_init:	
	opt	stack 5
; Regs used in _op2_init: [wreg]
	line	52
	
l3882:	
;periph.c: 52: OP2CON1=0x10;
	movlw	(010h)
	movwf	(156)^080h	;volatile
	line	54
;periph.c: 54: OP2CON2=0x10;
	movlw	(010h)
	movwf	(157)^080h	;volatile
	line	55
;periph.c: 55: OP2CON0=0x80;
	movlw	(080h)
	movwf	(155)^080h	;volatile
	line	58
	
l3884:	
;periph.c: 58: TRISA7=0;
	bcf	(1071/8)^080h,(1071)&7
	line	60
	
l3886:	
;periph.c: 60: TRISB7 = 1;
	bsf	(1079/8)^080h,(1079)&7
	line	61
	
l2402:	
	return
	opt stack 0
GLOBAL	__end_of_op2_init
	__end_of_op2_init:
;; =============== function _op2_init ends ============

	signat	_op2_init,88
	global	_op1_init
psect	text800,local,class=CODE,delta=2
global __ptext800
__ptext800:

;; *************** function _op1_init *****************
;; Defined at:
;;		line 26 in file "C:\190604\AK7030-OTP\periph.c"
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
psect	text800
	file	"C:\190604\AK7030-OTP\periph.c"
	line	26
	global	__size_of_op1_init
	__size_of_op1_init	equ	__end_of_op1_init-_op1_init
	
_op1_init:	
	opt	stack 5
; Regs used in _op1_init: [wreg]
	line	33
	
l3876:	
;periph.c: 33: OP1CON1=0x02;
	movlw	(02h)
	bcf	status, 5	;RP0=0, select bank0
	movwf	(28)	;volatile
	line	34
;periph.c: 34: OP1CON2=0xA0;
	movlw	(0A0h)
	movwf	(29)	;volatile
	line	35
;periph.c: 35: OP1CON0=0x80;
	movlw	(080h)
	movwf	(27)	;volatile
	line	38
	
l3878:	
;periph.c: 38: TRISB3=1;
	bsf	status, 5	;RP0=1, select bank1
	bsf	(1075/8)^080h,(1075)&7
	line	40
	
l3880:	
;periph.c: 40: TRISB5=0;
	bcf	(1077/8)^080h,(1077)&7
	line	41
	
l2399:	
	return
	opt stack 0
GLOBAL	__end_of_op1_init
	__end_of_op1_init:
;; =============== function _op1_init ends ============

	signat	_op1_init,88
	global	_dac_init
psect	text801,local,class=CODE,delta=2
global __ptext801
__ptext801:

;; *************** function _dac_init *****************
;; Defined at:
;;		line 14 in file "C:\190604\AK7030-OTP\periph.c"
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
psect	text801
	file	"C:\190604\AK7030-OTP\periph.c"
	line	14
	global	__size_of_dac_init
	__size_of_dac_init	equ	__end_of_dac_init-_dac_init
	
_dac_init:	
	opt	stack 5
; Regs used in _dac_init: [wreg]
	line	15
	
l3870:	
;periph.c: 15: DACCON|=1;
	bsf	(135)^080h+(0/8),(0)&7	;volatile
	line	17
	
l3872:	
;periph.c: 17: DACR0=0x0F;
	movlw	(0Fh)
	movwf	(136)^080h	;volatile
	line	18
	
l3874:	
;periph.c: 18: DACCON|=(1)<<2;
	bsf	(135)^080h+(2/8),(2)&7	;volatile
	line	22
	
l2396:	
	return
	opt stack 0
GLOBAL	__end_of_dac_init
	__end_of_dac_init:
;; =============== function _dac_init ends ============

	signat	_dac_init,88
	global	_adc_test_init
psect	text802,local,class=CODE,delta=2
global __ptext802
__ptext802:

;; *************** function _adc_test_init *****************
;; Defined at:
;;		line 85 in file "C:\190604\AK7030-OTP\periph.c"
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
psect	text802
	file	"C:\190604\AK7030-OTP\periph.c"
	line	85
	global	__size_of_adc_test_init
	__size_of_adc_test_init	equ	__end_of_adc_test_init-_adc_test_init
	
_adc_test_init:	
	opt	stack 4
; Regs used in _adc_test_init: [wreg+status,2+status,0]
;adc_test_init@channel stored from wreg
	movwf	(adc_test_init@channel)
	line	86
	
l3860:	
;periph.c: 86: ADCON0 = 0x00;
	clrf	(31)	;volatile
	line	87
	
l3862:	
;periph.c: 87: ADCON0|=channel<<2;
	movf	(adc_test_init@channel),w
	movwf	(??_adc_test_init+0)+0
	clrc
	rlf	(??_adc_test_init+0)+0,f
	clrc
	rlf	(??_adc_test_init+0)+0,w
	iorwf	(31),f	;volatile
	line	88
	
l3864:	
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
	
l3866:	
;periph.c: 89: ADON=1;
	bcf	status, 5	;RP0=0, select bank0
	bsf	(248/8),(248)&7
	line	90
	
l3868:	
;periph.c: 90: ADIE=1;
	bsf	status, 5	;RP0=1, select bank1
	bsf	(1130/8)^080h,(1130)&7
	line	91
	
l2410:	
	return
	opt stack 0
GLOBAL	__end_of_adc_test_init
	__end_of_adc_test_init:
;; =============== function _adc_test_init ends ============

	signat	_adc_test_init,8312
	global	_timer1_interrupt_config
psect	text803,local,class=CODE,delta=2
global __ptext803
__ptext803:

;; *************** function _timer1_interrupt_config *****************
;; Defined at:
;;		line 190 in file "C:\190604\AK7030-OTP\common.c"
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
psect	text803
	file	"C:\190604\AK7030-OTP\common.c"
	line	190
	global	__size_of_timer1_interrupt_config
	__size_of_timer1_interrupt_config	equ	__end_of_timer1_interrupt_config-_timer1_interrupt_config
	
_timer1_interrupt_config:	
	opt	stack 5
; Regs used in _timer1_interrupt_config: []
	line	191
	
l3858:	
;common.c: 191: GIE = 1;
	bsf	(95/8),(95)&7
	line	192
;common.c: 192: PEIE = 1;
	bsf	(94/8),(94)&7
	line	193
	
l1656:	
	return
	opt stack 0
GLOBAL	__end_of_timer1_interrupt_config
	__end_of_timer1_interrupt_config:
;; =============== function _timer1_interrupt_config ends ============

	signat	_timer1_interrupt_config,88
	global	_timer1_config
psect	text804,local,class=CODE,delta=2
global __ptext804
__ptext804:

;; *************** function _timer1_config *****************
;; Defined at:
;;		line 178 in file "C:\190604\AK7030-OTP\common.c"
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
psect	text804
	file	"C:\190604\AK7030-OTP\common.c"
	line	178
	global	__size_of_timer1_config
	__size_of_timer1_config	equ	__end_of_timer1_config-_timer1_config
	
_timer1_config:	
	opt	stack 5
; Regs used in _timer1_config: [wreg]
	line	180
	
l3854:	
;common.c: 180: TMR1H=0xCF;
	movlw	(0CFh)
	bcf	status, 6	;RP1=0, select bank0
	movwf	(15)	;volatile
	line	181
;common.c: 181: TMR1L=0x2C;
	movlw	(02Ch)
	movwf	(14)	;volatile
	line	182
;common.c: 182: T1CON=0xE1;
	movlw	(0E1h)
	movwf	(16)	;volatile
	line	183
	
l3856:	
;common.c: 183: TMR1IE=1;
	bsf	status, 5	;RP0=1, select bank1
	bsf	(1120/8)^080h,(1120)&7
	line	185
	
l1653:	
	return
	opt stack 0
GLOBAL	__end_of_timer1_config
	__end_of_timer1_config:
;; =============== function _timer1_config ends ============

	signat	_timer1_config,88
	global	_clock_config
psect	text805,local,class=CODE,delta=2
global __ptext805
__ptext805:

;; *************** function _clock_config *****************
;; Defined at:
;;		line 170 in file "C:\190604\AK7030-OTP\common.c"
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
psect	text805
	file	"C:\190604\AK7030-OTP\common.c"
	line	170
	global	__size_of_clock_config
	__size_of_clock_config	equ	__end_of_clock_config-_clock_config
	
_clock_config:	
	opt	stack 5
; Regs used in _clock_config: [wreg+status,2]
	line	172
	
l3850:	
;common.c: 172: CLKPR = 0x80;
	movlw	(080h)
	bcf	status, 5	;RP0=0, select bank2
	bsf	status, 6	;RP1=1, select bank2
	movwf	(264)^0100h	;volatile
	line	173
	
l3852:	
;common.c: 173: CLKPR = 0x00;
	clrf	(264)^0100h	;volatile
	line	174
;common.c: 174: while(CLKPCE);
	
l1647:	
	btfsc	(2119/8)^0100h,(2119)&7
	goto	u901
	goto	u900
u901:
	goto	l1647
u900:
	line	175
	
l1650:	
	return
	opt stack 0
GLOBAL	__end_of_clock_config
	__end_of_clock_config:
;; =============== function _clock_config ends ============

	signat	_clock_config,88
	global	_initPin
psect	text806,local,class=CODE,delta=2
global __ptext806
__ptext806:

;; *************** function _initPin *****************
;; Defined at:
;;		line 105 in file "C:\190604\AK7030-OTP\main.c"
;; Parameters:    Size  Location     Type
;;		None
;; Auto vars:     Size  Location     Type
;;		None
;; Return value:  Size  Location     Type
;;		None               void
;; Registers used:
;;		None
;; Tracked objects:
;;		On entry : 160/20
;;		On exit  : 160/60
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
psect	text806
	file	"C:\190604\AK7030-OTP\main.c"
	line	105
	global	__size_of_initPin
	__size_of_initPin	equ	__end_of_initPin-_initPin
	
_initPin:	
	opt	stack 5
; Regs used in _initPin: []
	line	106
	
l3848:	
;main.c: 106: PB6 = 1;
	bcf	status, 5	;RP0=0, select bank0
	bsf	(54/8),(54)&7
	line	107
;main.c: 107: PBOD6 = 1;
	bsf	status, 5	;RP0=1, select bank3
	bsf	status, 6	;RP1=1, select bank3
	bsf	(3142/8)^0180h,(3142)&7
	line	111
;main.c: 111: PA0 = 0;
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	bcf	(40/8),(40)&7
	line	112
;main.c: 112: PA1 = 0;
	bcf	(41/8),(41)&7
	line	113
;main.c: 113: PA2 = 0;
	bcf	(42/8),(42)&7
	line	114
;main.c: 114: PA3 = 0;
	bcf	(43/8),(43)&7
	line	115
;main.c: 115: PB0 = 0;
	bcf	(48/8),(48)&7
	line	116
;main.c: 116: PB1 = 1;
	bsf	(49/8),(49)&7
	line	117
;main.c: 117: PA6 = 0;
	bcf	(46/8),(46)&7
	line	118
;main.c: 118: PA7 = 0;
	bcf	(47/8),(47)&7
	line	119
;main.c: 119: PAOD7 = 0;
	bsf	status, 5	;RP0=1, select bank3
	bsf	status, 6	;RP1=1, select bank3
	bcf	(3135/8)^0180h,(3135)&7
	line	121
	
l683:	
	return
	opt stack 0
GLOBAL	__end_of_initPin
	__end_of_initPin:
;; =============== function _initPin ends ============

	signat	_initPin,88
	global	_clearTwentySecondsTimer
psect	text807,local,class=CODE,delta=2
global __ptext807
__ptext807:

;; *************** function _clearTwentySecondsTimer *****************
;; Defined at:
;;		line 374 in file "C:\190604\AK7030-OTP\common.c"
;; Parameters:    Size  Location     Type
;;		None
;; Auto vars:     Size  Location     Type
;;		None
;; Return value:  Size  Location     Type
;;		None               void
;; Registers used:
;;		status,2
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
;; Hardware stack levels required when called:    2
;; This function calls:
;;		Nothing
;; This function is called by:
;;		_clearAllTimer
;; This function uses a non-reentrant model
;;
psect	text807
	file	"C:\190604\AK7030-OTP\common.c"
	line	374
	global	__size_of_clearTwentySecondsTimer
	__size_of_clearTwentySecondsTimer	equ	__end_of_clearTwentySecondsTimer-_clearTwentySecondsTimer
	
_clearTwentySecondsTimer:	
	opt	stack 4
; Regs used in _clearTwentySecondsTimer: [status,2]
	line	375
	
l3846:	
;common.c: 375: uiTwentySecondsTimer = 0;
	clrf	(_uiTwentySecondsTimer)^080h
	clrf	(_uiTwentySecondsTimer+1)^080h
	line	376
	
l1720:	
	return
	opt stack 0
GLOBAL	__end_of_clearTwentySecondsTimer
	__end_of_clearTwentySecondsTimer:
;; =============== function _clearTwentySecondsTimer ends ============

	signat	_clearTwentySecondsTimer,88
	global	_clearThreeHoursTimer
psect	text808,local,class=CODE,delta=2
global __ptext808
__ptext808:

;; *************** function _clearThreeHoursTimer *****************
;; Defined at:
;;		line 369 in file "C:\190604\AK7030-OTP\common.c"
;; Parameters:    Size  Location     Type
;;		None
;; Auto vars:     Size  Location     Type
;;		None
;; Return value:  Size  Location     Type
;;		None               void
;; Registers used:
;;		status,2
;; Tracked objects:
;;		On entry : 140/0
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
;;		_clearAllTimer
;;		_main
;; This function uses a non-reentrant model
;;
psect	text808
	file	"C:\190604\AK7030-OTP\common.c"
	line	369
	global	__size_of_clearThreeHoursTimer
	__size_of_clearThreeHoursTimer	equ	__end_of_clearThreeHoursTimer-_clearThreeHoursTimer
	
_clearThreeHoursTimer:	
	opt	stack 4
; Regs used in _clearThreeHoursTimer: [status,2]
	line	370
	
l3844:	
;common.c: 370: uiSmallTimer = 0;
	bsf	status, 5	;RP0=1, select bank1
	clrf	(_uiSmallTimer)^080h
	clrf	(_uiSmallTimer+1)^080h
	line	371
	
l1717:	
	return
	opt stack 0
GLOBAL	__end_of_clearThreeHoursTimer
	__end_of_clearThreeHoursTimer:
;; =============== function _clearThreeHoursTimer ends ============

	signat	_clearThreeHoursTimer,88
	global	_clearTwelveHoursTimer
psect	text809,local,class=CODE,delta=2
global __ptext809
__ptext809:

;; *************** function _clearTwelveHoursTimer *****************
;; Defined at:
;;		line 363 in file "C:\190604\AK7030-OTP\common.c"
;; Parameters:    Size  Location     Type
;;		None
;; Auto vars:     Size  Location     Type
;;		None
;; Return value:  Size  Location     Type
;;		None               void
;; Registers used:
;;		status,2
;; Tracked objects:
;;		On entry : 140/20
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
;;		_clearAllTimer
;; This function uses a non-reentrant model
;;
psect	text809
	file	"C:\190604\AK7030-OTP\common.c"
	line	363
	global	__size_of_clearTwelveHoursTimer
	__size_of_clearTwelveHoursTimer	equ	__end_of_clearTwelveHoursTimer-_clearTwelveHoursTimer
	
_clearTwelveHoursTimer:	
	opt	stack 4
; Regs used in _clearTwelveHoursTimer: [status,2]
	line	364
	
l3842:	
;common.c: 364: uiBigTimer = 0;
	bsf	status, 5	;RP0=1, select bank1
	clrf	(_uiBigTimer)^080h
	clrf	(_uiBigTimer+1)^080h
	line	365
	
l1714:	
	return
	opt stack 0
GLOBAL	__end_of_clearTwelveHoursTimer
	__end_of_clearTwelveHoursTimer:
;; =============== function _clearTwelveHoursTimer ends ============

	signat	_clearTwelveHoursTimer,88
	global	_ISR
psect	text810,local,class=CODE,delta=2
global __ptext810
__ptext810:

;; *************** function _ISR *****************
;; Defined at:
;;		line 437 in file "C:\190604\AK7030-OTP\common.c"
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
psect	text810
	file	"C:\190604\AK7030-OTP\common.c"
	line	437
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
psect	text810
	line	440
	
i1l4058:	
;common.c: 438: static unsigned char ucTimer1sCnt = 0;
;common.c: 440: if(TMR1IF == 1)
	btfss	(96/8),(96)&7
	goto	u109_21
	goto	u109_20
u109_21:
	goto	i1l4076
u109_20:
	line	442
	
i1l4060:	
;common.c: 441: {
;common.c: 442: TMR1IF = 0 ;
	bcf	(96/8),(96)&7
	line	443
	
i1l4062:	
;common.c: 443: timer.timer10msStopWatch++;
	bsf	status, 5	;RP0=1, select bank1
	incf	(_timer)^080h,f
	line	444
;common.c: 444: ucTimer1sCnt++;
	incf	(ISR@ucTimer1sCnt)^080h,f
	line	446
	
i1l4064:	
;common.c: 446: if(ucTimer1sCnt >= 100)
	movlw	(064h)
	subwf	(ISR@ucTimer1sCnt)^080h,w
	skipc
	goto	u110_21
	goto	u110_20
u110_21:
	goto	i1l4076
u110_20:
	line	448
	
i1l4066:	
;common.c: 447: {
;common.c: 448: ucTimer1sCnt = 0;
	clrf	(ISR@ucTimer1sCnt)^080h
	line	449
	
i1l4068:	
;common.c: 449: if(uiBigTimer > 0)
	movf	(_uiBigTimer+1)^080h,w
	iorwf	(_uiBigTimer)^080h,w
	skipnz
	goto	u111_21
	goto	u111_20
u111_21:
	goto	i1l1757
u111_20:
	line	450
	
i1l4070:	
;common.c: 450: uiBigTimer--;
	movlw	low(01h)
	subwf	(_uiBigTimer)^080h,f
	movlw	high(01h)
	skipc
	decf	(_uiBigTimer+1)^080h,f
	subwf	(_uiBigTimer+1)^080h,f
	
i1l1757:	
	line	452
;common.c: 452: if(uiSmallTimer)
	movf	(_uiSmallTimer+1)^080h,w
	iorwf	(_uiSmallTimer)^080h,w
	skipnz
	goto	u112_21
	goto	u112_20
u112_21:
	goto	i1l1758
u112_20:
	line	453
	
i1l4072:	
;common.c: 453: uiSmallTimer--;
	movlw	low(01h)
	subwf	(_uiSmallTimer)^080h,f
	movlw	high(01h)
	skipc
	decf	(_uiSmallTimer+1)^080h,f
	subwf	(_uiSmallTimer+1)^080h,f
	
i1l1758:	
	line	455
;common.c: 455: if(uiTwentySecondsTimer)
	movf	(_uiTwentySecondsTimer+1)^080h,w
	iorwf	(_uiTwentySecondsTimer)^080h,w
	skipnz
	goto	u113_21
	goto	u113_20
u113_21:
	goto	i1l4076
u113_20:
	line	456
	
i1l4074:	
;common.c: 456: uiTwentySecondsTimer--;
	movlw	low(01h)
	subwf	(_uiTwentySecondsTimer)^080h,f
	movlw	high(01h)
	skipc
	decf	(_uiTwentySecondsTimer+1)^080h,f
	subwf	(_uiTwentySecondsTimer+1)^080h,f
	line	460
	
i1l4076:	
;common.c: 457: }
;common.c: 458: }
;common.c: 460: if(ADIF)
	bcf	status, 5	;RP0=0, select bank0
	btfss	(106/8),(106)&7
	goto	u114_21
	goto	u114_20
u114_21:
	goto	i1l1765
u114_20:
	line	462
	
i1l4078:	
;common.c: 461: {
;common.c: 462: ADIF=0;
	bcf	(106/8),(106)&7
	line	463
	
i1l4080:	
;common.c: 463: setAD_ConvertFlag(1);
	movlw	(01h)
	fcall	i1_setAD_ConvertFlag
	line	464
	
i1l4082:	
;common.c: 464: adc_original_value = adc_get();
	fcall	_adc_get
	movf	(1+(?_adc_get)),w
	movwf	(_adc_original_value+1)^080h
	movf	(0+(?_adc_get)),w
	movwf	(_adc_original_value)^080h
	line	465
	
i1l4084:	
;common.c: 465: if(sampleChannelSelect == 4)
	bcf	status, 5	;RP0=0, select bank0
	movf	(_sampleChannelSelect),w
	xorlw	04h
	skipz
	goto	u115_21
	goto	u115_20
u115_21:
	goto	i1l4090
u115_20:
	line	467
	
i1l4086:	
;common.c: 466: {
;common.c: 467: adc_original_CH4_value = adc_get();
	fcall	_adc_get
	line	468
	
i1l4088:	
;common.c: 468: vPutSampleDataIntoTable(adc_get(),4);
	fcall	_adc_get
	movf	(1+(?_adc_get)),w
	movwf	(?_vPutSampleDataIntoTable+1)
	movf	(0+(?_adc_get)),w
	movwf	(?_vPutSampleDataIntoTable)
	movlw	(04h)
	movwf	0+(?_vPutSampleDataIntoTable)+02h
	fcall	_vPutSampleDataIntoTable
	line	470
;common.c: 470: }
	goto	i1l1765
	line	471
	
i1l4090:	
;common.c: 471: else if(sampleChannelSelect == 1)
	decf	(_sampleChannelSelect),w
	skipz
	goto	u116_21
	goto	u116_20
u116_21:
	goto	i1l4096
u116_20:
	line	473
	
i1l4092:	
;common.c: 472: {
;common.c: 473: adc_original_CH1_value = adc_get();
	fcall	_adc_get
	line	474
	
i1l4094:	
;common.c: 474: vPutSampleDataIntoTable(adc_get(),1);
	fcall	_adc_get
	movf	(1+(?_adc_get)),w
	movwf	(?_vPutSampleDataIntoTable+1)
	movf	(0+(?_adc_get)),w
	movwf	(?_vPutSampleDataIntoTable)
	clrf	0+(?_vPutSampleDataIntoTable)+02h
	incf	0+(?_vPutSampleDataIntoTable)+02h,f
	fcall	_vPutSampleDataIntoTable
	line	475
;common.c: 475: }
	goto	i1l1765
	line	478
	
i1l4096:	
;common.c: 476: else
;common.c: 477: {
;common.c: 478: adc_original_CH14_value = adc_get();
	fcall	_adc_get
	line	479
	
i1l4098:	
;common.c: 479: vPutSampleDataIntoTable(adc_get(),14);
	fcall	_adc_get
	movf	(1+(?_adc_get)),w
	movwf	(?_vPutSampleDataIntoTable+1)
	movf	(0+(?_adc_get)),w
	movwf	(?_vPutSampleDataIntoTable)
	movlw	(0Eh)
	movwf	0+(?_vPutSampleDataIntoTable)+02h
	fcall	_vPutSampleDataIntoTable
	line	483
	
i1l1765:	
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
psect	text811,local,class=CODE,delta=2
global __ptext811
__ptext811:

;; *************** function i1_setAD_ConvertFlag *****************
;; Defined at:
;;		line 204 in file "C:\190604\AK7030-OTP\common.c"
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
psect	text811
	file	"C:\190604\AK7030-OTP\common.c"
	line	204
	global	__size_ofi1_setAD_ConvertFlag
	__size_ofi1_setAD_ConvertFlag	equ	__end_ofi1_setAD_ConvertFlag-i1_setAD_ConvertFlag
	
i1_setAD_ConvertFlag:	
	opt	stack 3
; Regs used in i1_setAD_ConvertFlag: [wreg]
;i1setAD_ConvertFlag@flag stored from wreg
	movwf	(i1setAD_ConvertFlag@flag)
	line	205
	
i1l4104:	
;common.c: 205: adc_convert_flag = flag;
	movf	(i1setAD_ConvertFlag@flag),w
	bsf	status, 5	;RP0=1, select bank1
	movwf	(_adc_convert_flag)^080h
	line	206
	
i1l1662:	
	return
	opt stack 0
GLOBAL	__end_ofi1_setAD_ConvertFlag
	__end_ofi1_setAD_ConvertFlag:
;; =============== function i1_setAD_ConvertFlag ends ============

	signat	i1_setAD_ConvertFlag,88
	global	_adc_get
psect	text812,local,class=CODE,delta=2
global __ptext812
__ptext812:

;; *************** function _adc_get *****************
;; Defined at:
;;		line 105 in file "C:\190604\AK7030-OTP\periph.c"
;; Parameters:    Size  Location     Type
;;		None
;; Auto vars:     Size  Location     Type
;;  val             2    2[COMMON] unsigned int 
;; Return value:  Size  Location     Type
;;                  2    0[COMMON] unsigned int 
;; Registers used:
;;		wreg
;; Tracked objects:
;;		On entry : 40/20
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
psect	text812
	file	"C:\190604\AK7030-OTP\periph.c"
	line	105
	global	__size_of_adc_get
	__size_of_adc_get	equ	__end_of_adc_get-_adc_get
	
_adc_get:	
	opt	stack 3
; Regs used in _adc_get: [wreg]
	line	107
	
i1l4100:	
;periph.c: 106: unsigned int val;
;periph.c: 107: val = (ADRESH<<8) | ADRESL;
	bcf	status, 5	;RP0=0, select bank0
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
	
i1l2419:	
	return
	opt stack 0
GLOBAL	__end_of_adc_get
	__end_of_adc_get:
;; =============== function _adc_get ends ============

	signat	_adc_get,90
	global	_vPutSampleDataIntoTable
psect	text813,local,class=CODE,delta=2
global __ptext813
__ptext813:

;; *************** function _vPutSampleDataIntoTable *****************
;; Defined at:
;;		line 95 in file "C:\190604\AK7030-OTP\common.c"
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
psect	text813
	file	"C:\190604\AK7030-OTP\common.c"
	line	95
	global	__size_of_vPutSampleDataIntoTable
	__size_of_vPutSampleDataIntoTable	equ	__end_of_vPutSampleDataIntoTable-_vPutSampleDataIntoTable
	
_vPutSampleDataIntoTable:	
	opt	stack 3
; Regs used in _vPutSampleDataIntoTable: [wreg-fsr0h+status,2+status,0+btemp+1]
	line	103
	
i1l3998:	
;common.c: 97: static unsigned char ucChannelFirstLength = 0;
;common.c: 99: static unsigned char ucChannelFourthLength = 0;
;common.c: 101: static unsigned char ucChannelFourteenthLength = 0;
;common.c: 103: if(channel == 1)
	decf	(vPutSampleDataIntoTable@channel),w
	skipz
	goto	u102_21
	goto	u102_20
u102_21:
	goto	i1l4010
u102_20:
	line	105
	
i1l4000:	
;common.c: 104: {
;common.c: 105: if(ucChannelFirstLength < 20)
	movlw	(014h)
	subwf	(vPutSampleDataIntoTable@ucChannelFirstLength),w
	skipnc
	goto	u103_21
	goto	u103_20
u103_21:
	goto	i1l4006
u103_20:
	line	107
	
i1l4002:	
;common.c: 106: {
;common.c: 107: uiSampleChannelFirst[ucChannelFirstLength] = uiSampleData;
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
	line	109
	
i1l4004:	
;common.c: 109: ucChannelFirstLength++;
	incf	(vPutSampleDataIntoTable@ucChannelFirstLength),f
	line	110
;common.c: 110: }
	goto	i1l1644
	line	113
	
i1l4006:	
;common.c: 111: else
;common.c: 112: {
;common.c: 113: ucChannelFirstLength = 0;
	clrf	(vPutSampleDataIntoTable@ucChannelFirstLength)
	line	115
	
i1l4008:	
;common.c: 115: uiSampleChannelFirst[ucChannelFirstLength] = uiSampleData;
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
	goto	i1l1644
	line	118
	
i1l4010:	
;common.c: 118: else if(channel == 4)
	movf	(vPutSampleDataIntoTable@channel),w
	xorlw	04h
	skipz
	goto	u104_21
	goto	u104_20
u104_21:
	goto	i1l4022
u104_20:
	line	120
	
i1l4012:	
;common.c: 119: {
;common.c: 120: if(ucChannelFourthLength < 20)
	movlw	(014h)
	bcf	status, 5	;RP0=0, select bank0
	subwf	(vPutSampleDataIntoTable@ucChannelFourthLength),w
	skipnc
	goto	u105_21
	goto	u105_20
u105_21:
	goto	i1l4018
u105_20:
	line	122
	
i1l4014:	
;common.c: 121: {
;common.c: 122: uiSampleChannelFourth[ucChannelFourthLength] = uiSampleData;
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
	line	124
	
i1l4016:	
;common.c: 124: ucChannelFourthLength++;
	incf	(vPutSampleDataIntoTable@ucChannelFourthLength),f
	line	125
;common.c: 125: }
	goto	i1l1644
	line	128
	
i1l4018:	
;common.c: 126: else
;common.c: 127: {
;common.c: 128: ucChannelFourthLength = 0;
	clrf	(vPutSampleDataIntoTable@ucChannelFourthLength)
	line	130
	
i1l4020:	
;common.c: 130: uiSampleChannelFourth[ucChannelFourthLength] = uiSampleData;
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
	goto	i1l1644
	line	133
	
i1l4022:	
;common.c: 133: else if(channel == 14)
	movf	(vPutSampleDataIntoTable@channel),w
	xorlw	0Eh
	skipz
	goto	u106_21
	goto	u106_20
u106_21:
	goto	i1l4034
u106_20:
	line	135
	
i1l4024:	
;common.c: 134: {
;common.c: 135: if(ucChannelFourteenthLength < 20)
	movlw	(014h)
	bcf	status, 5	;RP0=0, select bank0
	subwf	(vPutSampleDataIntoTable@ucChannelFourteenthLength),w
	skipnc
	goto	u107_21
	goto	u107_20
u107_21:
	goto	i1l4030
u107_20:
	line	137
	
i1l4026:	
;common.c: 136: {
;common.c: 137: uiSampleChannelFourteenth[ucChannelFourteenthLength] = uiSampleData;
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
	line	139
	
i1l4028:	
;common.c: 139: ucChannelFourteenthLength++;
	incf	(vPutSampleDataIntoTable@ucChannelFourteenthLength),f
	line	140
;common.c: 140: }
	goto	i1l1644
	line	143
	
i1l4030:	
;common.c: 141: else
;common.c: 142: {
;common.c: 143: ucChannelFourteenthLength = 0;
	clrf	(vPutSampleDataIntoTable@ucChannelFourteenthLength)
	line	145
	
i1l4032:	
;common.c: 145: uiSampleChannelFourth[ucChannelFourteenthLength] = uiSampleData;
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
	goto	i1l1644
	line	150
	
i1l4034:	
;common.c: 148: else
;common.c: 149: {
;common.c: 150: ucChannelFirstLength = 0;
	clrf	(vPutSampleDataIntoTable@ucChannelFirstLength)
	line	152
;common.c: 152: ucChannelFourthLength = 0;
	bcf	status, 5	;RP0=0, select bank0
	clrf	(vPutSampleDataIntoTable@ucChannelFourthLength)
	line	154
;common.c: 154: ucChannelFourteenthLength = 0;
	clrf	(vPutSampleDataIntoTable@ucChannelFourteenthLength)
	line	156
;common.c: 156: for(int i = 0;i < 20; i++)
	clrf	(vPutSampleDataIntoTable@i)
	clrf	(vPutSampleDataIntoTable@i+1)
	line	158
	
i1l4040:	
;common.c: 157: {
;common.c: 158: uiSampleChannelFirst[i] = 0;
	clrc
	rlf	(vPutSampleDataIntoTable@i),w
	addlw	_uiSampleChannelFirst&0ffh
	movwf	fsr0
	bsf	status, 7	;select IRP bank3
	clrf	indf
	incf	fsr0,f
	clrf	indf
	line	160
;common.c: 160: uiSampleChannelFourth[i] = 0;
	clrc
	rlf	(vPutSampleDataIntoTable@i),w
	addlw	_uiSampleChannelFourth&0ffh
	movwf	fsr0
	bcf	status, 7	;select IRP bank1
	clrf	indf
	incf	fsr0,f
	clrf	indf
	line	162
;common.c: 162: uiSampleChannelFourth[i] = 0;
	clrc
	rlf	(vPutSampleDataIntoTable@i),w
	addlw	_uiSampleChannelFourth&0ffh
	movwf	fsr0
	clrf	indf
	incf	fsr0,f
	clrf	indf
	line	156
	
i1l4042:	
	incf	(vPutSampleDataIntoTable@i),f
	skipnz
	incf	(vPutSampleDataIntoTable@i+1),f
	
i1l4044:	
	movf	(vPutSampleDataIntoTable@i+1),w
	xorlw	80h
	movwf	btemp+1
	movlw	(high(014h))^80h
	subwf	btemp+1,w
	skipz
	goto	u108_25
	movlw	low(014h)
	subwf	(vPutSampleDataIntoTable@i),w
u108_25:

	skipc
	goto	u108_21
	goto	u108_20
u108_21:
	goto	i1l4040
u108_20:
	line	166
	
i1l1644:	
	return
	opt stack 0
GLOBAL	__end_of_vPutSampleDataIntoTable
	__end_of_vPutSampleDataIntoTable:
;; =============== function _vPutSampleDataIntoTable ends ============

	signat	_vPutSampleDataIntoTable,8312
psect	text814,local,class=CODE,delta=2
global __ptext814
__ptext814:
	global	btemp
	btemp set 07Eh

	DABS	1,126,2	;btemp
	global	wtemp0
	wtemp0 set btemp
	end
