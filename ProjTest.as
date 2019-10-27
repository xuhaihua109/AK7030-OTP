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
# 100 "D:\develop\190625\AK7030-OTP\main.c"
	psect config,class=CONFIG,delta=2 ;#
# 100 "D:\develop\190625\AK7030-OTP\main.c"
	dw 0x2FFF & 0x3FFF & 0x3FFF & 0x3FFF & 0x3FFF & 0x3FFF ;#
# 101 "D:\develop\190625\AK7030-OTP\main.c"
	psect config,class=CONFIG,delta=2 ;#
# 101 "D:\develop\190625\AK7030-OTP\main.c"
	dw 0x3FFF & 0x3FDF & 0x3FFF & 0x3FFE ;#
# 102 "D:\develop\190625\AK7030-OTP\main.c"
	psect config,class=CONFIG,delta=2 ;#
# 102 "D:\develop\190625\AK7030-OTP\main.c"
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
	FNCALL	_main,_isFinishedTwentyMinTimer
	FNCALL	_main,_getAdOriginalCh13Value
	FNCALL	_main,_setPB3
	FNCALL	_main,_pwm_start
	FNCALL	_main,_setPulseWidth
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
	global	_uiBigTimer
	global	_uiOneHourTimer
	global	_uiSmallTimer
	global	_uiTwentyMinTimer
	global	_uiTwentySecondsTimer
	global	main@uiTimerOneP5s
	global	main@uiTimerP5s
	global	main@uiTimerTwoP5s
	global	ISR@ucTimer1sCnt
	global	_adc_convert_flag
	global	_bBigTimerStartFlag
	global	_bOneHourTimerStartFlag
	global	_bSmallTimerStartFlag
	global	_bTwentyMinStartFlag
	global	_sampleTimes
	global	_timer
	global	main@cTimerP5s_776
	global	main@cTimerP5s_780
	global	main@ucDebug1
	global	main@ucDebug2
	global	main@ucStep
	global	main@ucTimerP5s
	global	vPutSampleDataIntoTable@ucChannelFourteenthLength
	global	vPutSampleDataIntoTable@ucChannelFourthLength
	global	vPutSampleDataIntoTable@ucChannelFirstLength
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
	global	_PWMCON1
_PWMCON1	set	150
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

_uiTwentySecondsTimer:
       ds      2

main@uiTimerOneP5s:
       ds      2

main@uiTimerP5s:
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

main@cTimerP5s_776:
       ds      1

main@cTimerP5s_780:
       ds      1

main@ucDebug1:
       ds      1

main@ucDebug2:
       ds      1

main@ucStep:
       ds      1

main@ucTimerP5s:
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
_uiSampleChannelFirst:
       ds      24

_uiSampleChannelFourteenth:
       ds      24

_uiSampleChannelFourth:
       ds      24

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
	movlw	low((__pbssBANK1)+048h)
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
	global	?_setPulseWidth
?_setPulseWidth:	; 0 bytes @ 0x0
	global	?_reset
?_reset:	; 0 bytes @ 0x0
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
	global	??_setPulseWidth
??_setPulseWidth:	; 0 bytes @ 0x0
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
Filter@filter_buf:	; 24 bytes @ 0x6
	ds	24
	global	Filter@filter_temp
Filter@filter_temp:	; 2 bytes @ 0x1E
	ds	2
	global	Filter@filter_sum
Filter@filter_sum:	; 2 bytes @ 0x20
	ds	2
	global	Filter@tmpValue
Filter@tmpValue:	; 1 bytes @ 0x22
	ds	1
	global	Filter@cir
Filter@cir:	; 2 bytes @ 0x23
	ds	2
	global	Filter@j
Filter@j:	; 1 bytes @ 0x25
	ds	1
	global	Filter@i
Filter@i:	; 1 bytes @ 0x26
	ds	1
	global	?_getAdOriginalCh13Value
?_getAdOriginalCh13Value:	; 2 bytes @ 0x27
	ds	2
	global	??_getAdOriginalCh13Value
??_getAdOriginalCh13Value:	; 0 bytes @ 0x29
	global	??_main
??_main:	; 0 bytes @ 0x29
;;Data sizes: Strings 0, constant 0, data 1, bss 105, persistent 0 stack 0
;;Auto spaces:   Size  Autos    Used
;; COMMON          14     13      14
;; BANK0           80     41      74
;; BANK1           80      0      72
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
;; Filter@tmpValue	PTR int  size(1) Largest target is 24
;;		 -> uiSampleChannelFourteenth(BANK1[24]), uiSampleChannelFourth(BANK1[24]), uiSampleChannelFirst(BANK1[24]), 
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
;; (0) _main                                                 0     0      0    1016
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
;;           _isFinishedTwentyMinTimer
;;             _getAdOriginalCh13Value
;;                             _setPB3
;;                          _pwm_start
;;                      _setPulseWidth
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
;;                                             39 BANK0      2     0      2
;;                             _Filter
;; ---------------------------------------------------------------------------------
;; (1) _process_AD_Converter_Value                           0     0      0      66
;;                  _getAD_ConvertFlag
;;                  _setAD_ConvertFlag
;;                          _AD_Sample
;;                      _adc_test_init
;;                          _adc_start
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
;; (2) _Filter                                              39    37      2     620
;;                                              0 BANK0     39    37      2
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
;; (1) _setPulseWidth                                        0     0      0       0
;; ---------------------------------------------------------------------------------
;; (1) _selectAdChannel                                      0     0      0       0
;; ---------------------------------------------------------------------------------
;; (1) _pwm_start                                            0     0      0       0
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
;; (3) _ISR                                                  4     4      0     407
;;                                              9 COMMON     4     4      0
;;                i1_setAD_ConvertFlag
;;                            _adc_get
;;            _vPutSampleDataIntoTable
;; ---------------------------------------------------------------------------------
;; (4) i1_setAD_ConvertFlag                                  1     1      0      73
;;                                              0 COMMON     1     1      0
;; ---------------------------------------------------------------------------------
;; (4) _adc_get                                              4     2      2      24
;;                                              0 COMMON     4     2      2
;; ---------------------------------------------------------------------------------
;; (4) _vPutSampleDataIntoTable                              5     2      3     310
;;                                              4 COMMON     5     2      3
;;                            _adc_get (ARG)
;; ---------------------------------------------------------------------------------
;; Estimated maximum stack depth 4
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
;;   _isFinishedTwentyMinTimer
;;   _getAdOriginalCh13Value
;;     _Filter
;;   _setPB3
;;   _pwm_start
;;   _setPulseWidth
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
;;BANK1               50      0      48       8       90.0%
;;BITBANK1            50      0       0       7        0.0%
;;CODE                 0      0       0       0        0.0%
;;DATA                 0      0      A6       6        0.0%
;;ABS                  0      0      A0       3        0.0%
;;NULL                 0      0       0       0        0.0%
;;STACK                0      0       6       2        0.0%
;;BANK0               50     29      4A       5       92.5%
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
;;		line 497 in file "D:\develop\190625\AK7030-OTP\main.c"
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
;; Hardware stack levels required when called:    4
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
;;		_isFinishedTwentyMinTimer
;;		_getAdOriginalCh13Value
;;		_setPB3
;;		_pwm_start
;;		_setPulseWidth
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
	line	497
	global	__size_of_main
	__size_of_main	equ	__end_of_main-_main
	
_main:	
	opt	stack 4
; Regs used in _main: [wreg-fsr0h+status,2+status,0+btemp+1+pclath+cstack]
	line	530
	
l3582:	
;main.c: 504: static unsigned char ucWaitTime1S = 0;
;main.c: 506: static unsigned char ucWaitTimeO3s = 0;
;main.c: 508: static unsigned char ucSmallTimerActionFlag = 0;
;main.c: 510: static unsigned char ucSetSmallActionFlag = 0;
;main.c: 512: static unsigned char bCheckTweHour = 0;
;main.c: 514: static unsigned char bCheckTheHour = 0;
;main.c: 530: initPin();
	fcall	_initPin
	line	531
;main.c: 531: setPinInitVaule();
	fcall	_setPinInitVaule
	line	532
	
l3584:	
;main.c: 532: selectAdChannel();
	fcall	_selectAdChannel
	line	542
	
l3586:	
;main.c: 542: clock_config();
	fcall	_clock_config
	line	543
	
l3588:	
;main.c: 543: timer1_config();
	fcall	_timer1_config
	line	544
	
l3590:	
;main.c: 544: timer1_interrupt_config();
	fcall	_timer1_interrupt_config
	line	546
;main.c: 546: adc_test_init(12,3);
	movlw	(03h)
	bcf	status, 5	;RP0=0, select bank0
	movwf	(?_adc_test_init)
	movlw	(0Ch)
	fcall	_adc_test_init
	line	553
	
l3592:	
;main.c: 553: adc_start();
	fcall	_adc_start
	line	563
	
l3594:	
;main.c: 563: startTwentyMinTimer( 1200 );
	movlw	low(04B0h)
	movwf	(?_startTwentyMinTimer)
	movlw	high(04B0h)
	movwf	((?_startTwentyMinTimer))+1
	fcall	_startTwentyMinTimer
	line	568
	
l3596:	
# 568 "D:\develop\190625\AK7030-OTP\main.c"
 clrwdt ;#
psect	maintext
	line	570
	
l3598:	
;main.c: 570: process_AD_Converter_Value();
	fcall	_process_AD_Converter_Value
	line	572
	
l3600:	
;main.c: 572: if( isPermitSampleTime() )
	fcall	_isPermitSampleTime
	xorlw	0
	skipnz
	goto	u1221
	goto	u1220
u1221:
	goto	l3596
u1220:
	line	576
	
l3602:	
;main.c: 573: {
;main.c: 576: clrSampeTime();
	fcall	_clrSampeTime
	line	591
;main.c: 590: static unsigned char ucStep = 0;
;main.c: 591: switch(ucStep)
	goto	l3764
	line	597
	
l3604:	
;main.c: 594: {
;main.c: 595: static unsigned char ucTimerP3s = 0;
;main.c: 597: if( isFinishedTwentyMinTimer() )
	fcall	_isFinishedTwentyMinTimer
	xorlw	0
	skipnz
	goto	u1231
	goto	u1230
u1231:
	goto	l3608
u1230:
	goto	l3596
	line	601
	
l3608:	
;main.c: 602: {
;main.c: 603: ucTimerP3s++;
	fcall	_getAdOriginalCh13Value
	line	613
	
l3612:	
;main.c: 609: static unsigned char ucDebug1 = 0;
;main.c: 611: static unsigned char ucDebug2 = 0;
;main.c: 613: ucDebug1++;
	incf	(main@ucDebug1),f
	line	615
	
l3614:	
;main.c: 615: if( ucDebug1 < 10 )
	movlw	(0Ah)
	subwf	(main@ucDebug1),w
	skipnc
	goto	u1241
	goto	u1240
u1241:
	goto	l3618
u1240:
	line	616
	
l3616:	
;main.c: 616: setPB3(1);
	movlw	(01h)
	fcall	_setPB3
	goto	l3626
	line	617
	
l3618:	
;main.c: 617: else if((ucDebug1 > 10) && ( ucDebug1 < 20))
	movlw	(0Bh)
	subwf	(main@ucDebug1),w
	skipc
	goto	u1251
	goto	u1250
u1251:
	goto	l3624
u1250:
	
l3620:	
	movlw	(014h)
	subwf	(main@ucDebug1),w
	skipnc
	goto	u1261
	goto	u1260
u1261:
	goto	l3624
u1260:
	line	619
	
l3622:	
;main.c: 618: {
;main.c: 619: setPB3(0);
	movlw	(0)
	fcall	_setPB3
	line	620
;main.c: 620: }
	goto	l3626
	line	623
	
l3624:	
;main.c: 621: else
;main.c: 622: {
;main.c: 623: ucDebug1 = 0;
	clrf	(main@ucDebug1)
	line	626
	
l3626:	
;main.c: 624: }
;main.c: 626: ucDebug2++;
	incf	(main@ucDebug2),f
	line	627
	
l3628:	
;main.c: 627: if(ucDebug2 > 150)
	movlw	(097h)
	subwf	(main@ucDebug2),w
	skipc
	goto	u1271
	goto	u1270
u1271:
	goto	l750
u1270:
	line	628
	
l3630:	
;main.c: 628: ucStep++;
	incf	(main@ucStep),f
	goto	l3596
	line	635
	
l3632:	
;main.c: 634: {
;main.c: 635: pwm_start();
	fcall	_pwm_start
	line	636
	
l3634:	
;main.c: 636: setPulseWidth();
	fcall	_setPulseWidth
	line	637
	
l3636:	
;main.c: 637: setPB3(0);
	movlw	(0)
	fcall	_setPB3
	line	638
	
l3638:	
;main.c: 638: setPB4(1);
	movlw	(01h)
	fcall	_setPB4
	line	639
	
l3640:	
;main.c: 639: setPB5(0);
	movlw	(0)
	fcall	_setPB5
	line	640
;main.c: 640: clearTwentyMinTimer();
	fcall	_clearTwentyMinTimer
	line	641
	
l3642:	
;main.c: 641: startTwelveHourTimer( 36000);
	movlw	low(08CA0h)
	movwf	(?_startTwelveHourTimer)
	movlw	high(08CA0h)
	movwf	((?_startTwelveHourTimer))+1
	fcall	_startTwelveHourTimer
	goto	l3630
	line	650
	
l3646:	
;main.c: 647: {
;main.c: 648: static unsigned char ucTimerP5s = 0;
;main.c: 650: if( isFinishedTwelveHoursTimer () )
	fcall	_isFinishedTwelveHoursTimer
	xorlw	0
	skipnz
	goto	u1281
	goto	u1280
u1281:
	goto	l3650
u1280:
	line	651
	
l3648:	
;main.c: 651: ucStep = 99;
	movlw	(063h)
	movwf	(main@ucStep)
	goto	l3596
	line	654
	
l3650:	
;main.c: 652: else
;main.c: 653: {
;main.c: 654: if( getAdOriginalCh13Value() < 200 )
	fcall	_getAdOriginalCh13Value
	movlw	high(0C8h)
	subwf	(1+(?_getAdOriginalCh13Value)),w
	movlw	low(0C8h)
	skipnz
	subwf	(0+(?_getAdOriginalCh13Value)),w
	skipnc
	goto	u1291
	goto	u1290
u1291:
	goto	l3654
u1290:
	line	655
	
l3652:	
;main.c: 655: ucTimerP5s++;
	incf	(main@ucTimerP5s),f
	goto	l3656
	line	657
	
l3654:	
;main.c: 656: else
;main.c: 657: ucTimerP5s = 0;
	clrf	(main@ucTimerP5s)
	line	659
	
l3656:	
;main.c: 659: if( ucTimerP5s > 5)
	movlw	(06h)
	subwf	(main@ucTimerP5s),w
	skipc
	goto	u1301
	goto	u1300
u1301:
	goto	l750
u1300:
	line	661
	
l3658:	
;main.c: 660: {
;main.c: 661: ucTimerP5s = 0;
	clrf	(main@ucTimerP5s)
	goto	l3596
	line	670
	
l3660:	
;main.c: 669: {
;main.c: 670: clearTwelveHoursTimer();
	fcall	_clearTwelveHoursTimer
	line	671
	
l3662:	
;main.c: 671: startThreeHoursTimer(10800);
	movlw	low(02A30h)
	movwf	(?_startThreeHoursTimer)
	movlw	high(02A30h)
	movwf	((?_startThreeHoursTimer))+1
	fcall	_startThreeHoursTimer
	goto	l3630
	line	680
	
l3666:	
;main.c: 677: {
;main.c: 678: static unsigned char ucTimerP5s = 0;
;main.c: 680: if( isFinishedThreeHoursTimer() )
	fcall	_isFinishedThreeHoursTimer
	xorlw	0
	skipnz
	goto	u1311
	goto	u1310
u1311:
	goto	l3670
u1310:
	goto	l3648
	line	684
	
l3670:	
;main.c: 682: else
;main.c: 683: {
;main.c: 684: if( getAdOriginalCh13Value() < 85 )
	fcall	_getAdOriginalCh13Value
	movlw	high(055h)
	subwf	(1+(?_getAdOriginalCh13Value)),w
	movlw	low(055h)
	skipnz
	subwf	(0+(?_getAdOriginalCh13Value)),w
	skipnc
	goto	u1321
	goto	u1320
u1321:
	goto	l3674
u1320:
	line	685
	
l3672:	
;main.c: 685: ucTimerP5s++;
	incf	(main@cTimerP5s_776),f
	goto	l3676
	line	687
	
l3674:	
;main.c: 686: else
;main.c: 687: ucTimerP5s = 0;
	clrf	(main@cTimerP5s_776)
	line	689
	
l3676:	
;main.c: 689: if( ucTimerP5s > 5)
	movlw	(06h)
	subwf	(main@cTimerP5s_776),w
	skipc
	goto	u1331
	goto	u1330
u1331:
	goto	l750
u1330:
	line	691
	
l3678:	
;main.c: 690: {
;main.c: 691: ucTimerP5s = 0;
	clrf	(main@cTimerP5s_776)
	goto	l3630
	line	700
	
l3682:	
;main.c: 699: {
;main.c: 700: clearThreeHoursTimer();
	fcall	_clearThreeHoursTimer
	line	701
	
l3684:	
;main.c: 701: startOneHoursTimer( 3600 );
	movlw	low(0E10h)
	movwf	(?_startOneHoursTimer)
	movlw	high(0E10h)
	movwf	((?_startOneHoursTimer))+1
	fcall	_startOneHoursTimer
	line	702
	
l3686:	
;main.c: 702: setPB3(1);
	movlw	(01h)
	fcall	_setPB3
	line	703
	
l3688:	
;main.c: 703: setPB4(0);
	movlw	(0)
	fcall	_setPB4
	line	704
	
l3690:	
;main.c: 704: setPB5(1);
	movlw	(01h)
	fcall	_setPB5
	goto	l3630
	line	715
	
l3694:	
;main.c: 710: {
;main.c: 711: static unsigned int uiTimerOneP5s = 0;
;main.c: 712: static unsigned int uiTimerTwoP5s = 0;
;main.c: 715: if( isFinishedOneHoursTimer() )
	fcall	_isFinishedOneHoursTimer
	xorlw	0
	skipnz
	goto	u1341
	goto	u1340
u1341:
	goto	l3698
u1340:
	goto	l3648
	line	719
	
l3698:	
;main.c: 717: else
;main.c: 718: {
;main.c: 719: if( getAdOriginalCh13Value() > 100 )
	fcall	_getAdOriginalCh13Value
	movlw	high(065h)
	subwf	(1+(?_getAdOriginalCh13Value)),w
	movlw	low(065h)
	skipnz
	subwf	(0+(?_getAdOriginalCh13Value)),w
	skipc
	goto	u1351
	goto	u1350
u1351:
	goto	l3704
u1350:
	line	721
	
l3700:	
;main.c: 720: {
;main.c: 721: uiTimerOneP5s++;
	incf	(main@uiTimerOneP5s),f
	skipnz
	incf	(main@uiTimerOneP5s+1),f
	line	722
	
l3702:	
;main.c: 722: uiTimerTwoP5s = 0;
	clrf	(main@uiTimerTwoP5s)
	clrf	(main@uiTimerTwoP5s+1)
	line	723
;main.c: 723: }
	goto	l3706
	line	725
	
l3704:	
;main.c: 724: else
;main.c: 725: uiTimerOneP5s = 0;
	clrf	(main@uiTimerOneP5s)
	clrf	(main@uiTimerOneP5s+1)
	line	727
	
l3706:	
;main.c: 727: if(uiTimerOneP5s > 5)
	movlw	high(06h)
	subwf	(main@uiTimerOneP5s+1),w
	movlw	low(06h)
	skipnz
	subwf	(main@uiTimerOneP5s),w
	skipc
	goto	u1361
	goto	u1360
u1361:
	goto	l3716
u1360:
	line	729
	
l3708:	
;main.c: 728: {
;main.c: 729: setPB3(0);
	movlw	(0)
	fcall	_setPB3
	line	730
;main.c: 730: setPB4(1);
	movlw	(01h)
	fcall	_setPB4
	line	731
;main.c: 731: setPB5(0);
	movlw	(0)
	fcall	_setPB5
	line	733
	
l3710:	
;main.c: 733: uiTimerOneP5s = 0;
	clrf	(main@uiTimerOneP5s)
	clrf	(main@uiTimerOneP5s+1)
	line	734
	
l3712:	
;main.c: 734: uiTimerTwoP5s = 0;
	clrf	(main@uiTimerTwoP5s)
	clrf	(main@uiTimerTwoP5s+1)
	goto	l3630
	line	739
	
l3716:	
;main.c: 737: else
;main.c: 738: {
;main.c: 739: if( getAdOriginalCh13Value() < 25 )
	fcall	_getAdOriginalCh13Value
	movlw	high(019h)
	subwf	(1+(?_getAdOriginalCh13Value)),w
	movlw	low(019h)
	skipnz
	subwf	(0+(?_getAdOriginalCh13Value)),w
	skipnc
	goto	u1371
	goto	u1370
u1371:
	goto	l3720
u1370:
	line	740
	
l3718:	
;main.c: 740: uiTimerTwoP5s++;
	incf	(main@uiTimerTwoP5s),f
	skipnz
	incf	(main@uiTimerTwoP5s+1),f
	goto	l3722
	line	742
	
l3720:	
;main.c: 741: else
;main.c: 742: uiTimerTwoP5s = 0;
	clrf	(main@uiTimerTwoP5s)
	clrf	(main@uiTimerTwoP5s+1)
	line	744
	
l3722:	
;main.c: 744: if(uiTimerTwoP5s > 5)
	movlw	high(06h)
	subwf	(main@uiTimerTwoP5s+1),w
	movlw	low(06h)
	skipnz
	subwf	(main@uiTimerTwoP5s),w
	skipc
	goto	u1381
	goto	u1380
u1381:
	goto	l750
u1380:
	line	745
	
l3724:	
;main.c: 745: reset();
	fcall	_reset
	goto	l3596
	line	754
	
l3726:	
;main.c: 752: {
;main.c: 753: static unsigned int uiTimerP5s = 0;
;main.c: 754: if( getAdOriginalCh13Value() < 25 )
	fcall	_getAdOriginalCh13Value
	movlw	high(019h)
	subwf	(1+(?_getAdOriginalCh13Value)),w
	movlw	low(019h)
	skipnz
	subwf	(0+(?_getAdOriginalCh13Value)),w
	skipnc
	goto	u1391
	goto	u1390
u1391:
	goto	l3730
u1390:
	line	755
	
l3728:	
;main.c: 755: uiTimerP5s++;
	incf	(main@uiTimerP5s),f
	skipnz
	incf	(main@uiTimerP5s+1),f
	goto	l3732
	line	757
	
l3730:	
;main.c: 756: else
;main.c: 757: uiTimerP5s = 0;
	clrf	(main@uiTimerP5s)
	clrf	(main@uiTimerP5s+1)
	line	759
	
l3732:	
;main.c: 759: if(uiTimerP5s > 5)
	movlw	high(06h)
	subwf	(main@uiTimerP5s+1),w
	movlw	low(06h)
	skipnz
	subwf	(main@uiTimerP5s),w
	skipc
	goto	u1401
	goto	u1400
u1401:
	goto	l750
u1400:
	line	761
	
l3734:	
;main.c: 760: {
;main.c: 761: uiTimerP5s = 0;
	clrf	(main@uiTimerP5s)
	clrf	(main@uiTimerP5s+1)
	line	762
	
l3736:	
;main.c: 762: setPB3(1);
	movlw	(01h)
	fcall	_setPB3
	line	763
	
l3738:	
;main.c: 763: setPB4(0);
	movlw	(0)
	fcall	_setPB4
	line	764
	
l3740:	
;main.c: 764: setPB5(1);
	movlw	(01h)
	fcall	_setPB5
	goto	l3648
	line	775
	
l3744:	
;main.c: 774: {
;main.c: 775: setPB3(0);
	movlw	(0)
	fcall	_setPB3
	line	776
;main.c: 776: setPB4(0);
	movlw	(0)
	fcall	_setPB4
	line	777
;main.c: 777: setPB5(1);
	movlw	(01h)
	fcall	_setPB5
	line	778
	
l3746:	
;main.c: 778: setPulseWidth();
	fcall	_setPulseWidth
	goto	l3630
	line	786
	
l3750:	
;main.c: 784: {
;main.c: 785: static unsigned char ucTimerP5s = 0;
;main.c: 786: if( getAdOriginalCh13Value() >50 )
	fcall	_getAdOriginalCh13Value
	movlw	high(033h)
	subwf	(1+(?_getAdOriginalCh13Value)),w
	movlw	low(033h)
	skipnz
	subwf	(0+(?_getAdOriginalCh13Value)),w
	skipc
	goto	u1411
	goto	u1410
u1411:
	goto	l3754
u1410:
	line	787
	
l3752:	
;main.c: 787: ucTimerP5s++;
	incf	(main@cTimerP5s_780),f
	goto	l3756
	line	789
	
l3754:	
;main.c: 788: else
;main.c: 789: ucTimerP5s = 0;
	clrf	(main@cTimerP5s_780)
	line	791
	
l3756:	
;main.c: 791: if(ucTimerP5s > 5)
	movlw	(06h)
	subwf	(main@cTimerP5s_780),w
	skipc
	goto	u1421
	goto	u1420
u1421:
	goto	l750
u1420:
	goto	l3630
	line	591
	
l3764:	
	movf	(main@ucStep),w
	; Switch size 1, requested type "space"
; Number of cases is 11, Range of values is 0 to 101
; switch strategies available:
; Name         Instructions Cycles
; simple_byte           34    18 (average)
; direct_byte          211     7 (fixed)
; jumptable            260     6 (fixed)
; rangetable           106     6 (fixed)
; spacedrange          210     9 (fixed)
; locatedrange         102     3 (fixed)
;	Chosen strategy is simple_byte

	opt asmopt_off
	xorlw	0^0	; case 0
	skipnz
	goto	l3604
	xorlw	1^0	; case 1
	skipnz
	goto	l3632
	xorlw	2^1	; case 2
	skipnz
	goto	l3646
	xorlw	3^2	; case 3
	skipnz
	goto	l3660
	xorlw	4^3	; case 4
	skipnz
	goto	l3666
	xorlw	5^4	; case 5
	skipnz
	goto	l3682
	xorlw	6^5	; case 6
	skipnz
	goto	l3694
	xorlw	7^6	; case 7
	skipnz
	goto	l3726
	xorlw	99^7	; case 99
	skipnz
	goto	l3744
	xorlw	100^99	; case 100
	skipnz
	goto	l3750
	xorlw	101^100	; case 101
	skipnz
	goto	l3724
	goto	l750
	opt asmopt_on

	line	2186
	
l750:	
	goto	l3596
	global	start
	ljmp	start
	opt stack 0
psect	maintext
	line	2189
GLOBAL	__end_of_main
	__end_of_main:
;; =============== function _main ends ============

	signat	_main,88
	global	_getAdOriginalCh13Value
psect	text787,local,class=CODE,delta=2
global __ptext787
__ptext787:

;; *************** function _getAdOriginalCh13Value *****************
;; Defined at:
;;		line 238 in file "D:\develop\190625\AK7030-OTP\common.c"
;; Parameters:    Size  Location     Type
;;		None
;; Auto vars:     Size  Location     Type
;;		None
;; Return value:  Size  Location     Type
;;                  2   39[BANK0 ] unsigned int 
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
psect	text787
	file	"D:\develop\190625\AK7030-OTP\common.c"
	line	238
	global	__size_of_getAdOriginalCh13Value
	__size_of_getAdOriginalCh13Value	equ	__end_of_getAdOriginalCh13Value-_getAdOriginalCh13Value
	
_getAdOriginalCh13Value:	
	opt	stack 4
; Regs used in _getAdOriginalCh13Value: [wreg-fsr0h+status,2+status,0+btemp+1+pclath+cstack]
	line	240
	
l3578:	
;common.c: 240: return Filter(uiSampleChannelFourth);
	movlw	(_uiSampleChannelFourth)&0ffh
	fcall	_Filter
	movf	(1+(?_Filter)),w
	movwf	(?_getAdOriginalCh13Value+1)
	movf	(0+(?_Filter)),w
	movwf	(?_getAdOriginalCh13Value)
	line	245
	
l1553:	
	return
	opt stack 0
GLOBAL	__end_of_getAdOriginalCh13Value
	__end_of_getAdOriginalCh13Value:
;; =============== function _getAdOriginalCh13Value ends ============

	signat	_getAdOriginalCh13Value,90
	global	_process_AD_Converter_Value
psect	text788,local,class=CODE,delta=2
global __ptext788
__ptext788:

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
;;		_getAD_ConvertFlag
;;		_setAD_ConvertFlag
;;		_AD_Sample
;;		_adc_test_init
;;		_adc_start
;; This function is called by:
;;		_main
;; This function uses a non-reentrant model
;;
psect	text788
	file	"D:\develop\190625\AK7030-OTP\common.c"
	line	260
	global	__size_of_process_AD_Converter_Value
	__size_of_process_AD_Converter_Value	equ	__end_of_process_AD_Converter_Value-_process_AD_Converter_Value
	
_process_AD_Converter_Value:	
	opt	stack 4
; Regs used in _process_AD_Converter_Value: [wreg+status,2+status,0+pclath+cstack]
	line	261
	
l3566:	
;common.c: 261: if(getAD_ConvertFlag())
	fcall	_getAD_ConvertFlag
	xorlw	0
	skipnz
	goto	u1201
	goto	u1200
u1201:
	goto	l1562
u1200:
	line	263
	
l3568:	
;common.c: 262: {
;common.c: 263: setAD_ConvertFlag(0);
	movlw	(0)
	fcall	_setAD_ConvertFlag
	line	264
;common.c: 264: AD_Sample();
	fcall	_AD_Sample
	line	265
	
l3570:	
;common.c: 265: if(12 == sampleChannelSelect)
	movf	(_sampleChannelSelect),w
	xorlw	0Ch
	skipz
	goto	u1211
	goto	u1210
u1211:
	goto	l3574
u1210:
	line	266
	
l3572:	
;common.c: 266: adc_test_init(12,3);
	movlw	(03h)
	movwf	(?_adc_test_init)
	movlw	(0Ch)
	fcall	_adc_test_init
	goto	l3576
	line	270
	
l3574:	
;common.c: 269: else
;common.c: 270: adc_test_init(13,3);
	movlw	(03h)
	movwf	(?_adc_test_init)
	movlw	(0Dh)
	fcall	_adc_test_init
	line	272
	
l3576:	
;common.c: 272: adc_start();
	fcall	_adc_start
	line	274
	
l1562:	
	return
	opt stack 0
GLOBAL	__end_of_process_AD_Converter_Value
	__end_of_process_AD_Converter_Value:
;; =============== function _process_AD_Converter_Value ends ============

	signat	_process_AD_Converter_Value,88
	global	_setPinInitVaule
psect	text789,local,class=CODE,delta=2
global __ptext789
__ptext789:

;; *************** function _setPinInitVaule *****************
;; Defined at:
;;		line 306 in file "D:\develop\190625\AK7030-OTP\main.c"
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
psect	text789
	file	"D:\develop\190625\AK7030-OTP\main.c"
	line	306
	global	__size_of_setPinInitVaule
	__size_of_setPinInitVaule	equ	__end_of_setPinInitVaule-_setPinInitVaule
	
_setPinInitVaule:	
	opt	stack 4
; Regs used in _setPinInitVaule: [wreg+status,2+status,0+pclath+cstack]
	line	308
	
l3564:	
;main.c: 308: setPB3(1);
	movlw	(01h)
	fcall	_setPB3
	line	309
;main.c: 309: setPB4(0);
	movlw	(0)
	fcall	_setPB4
	line	310
;main.c: 310: setPB5(1);
	movlw	(01h)
	fcall	_setPB5
	line	314
	
l722:	
	return
	opt stack 0
GLOBAL	__end_of_setPinInitVaule
	__end_of_setPinInitVaule:
;; =============== function _setPinInitVaule ends ============

	signat	_setPinInitVaule,88
	global	_initPin
psect	text790,local,class=CODE,delta=2
global __ptext790
__ptext790:

;; *************** function _initPin *****************
;; Defined at:
;;		line 290 in file "D:\develop\190625\AK7030-OTP\main.c"
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
psect	text790
	file	"D:\develop\190625\AK7030-OTP\main.c"
	line	290
	global	__size_of_initPin
	__size_of_initPin	equ	__end_of_initPin-_initPin
	
_initPin:	
	opt	stack 4
; Regs used in _initPin: [wreg+status,2+status,0+pclath+cstack]
	line	292
	
l3556:	
;main.c: 292: initPB2_AsHighResistence();
	fcall	_initPB2_AsHighResistence
	line	294
	
l3558:	
;main.c: 294: initPB3(0);
	movlw	(0)
	fcall	_initPB3
	line	296
	
l3560:	
;main.c: 296: initPB4(0);
	movlw	(0)
	fcall	_initPB4
	line	298
	
l3562:	
;main.c: 298: initPB5(0);
	movlw	(0)
	fcall	_initPB5
	line	303
	
l719:	
	return
	opt stack 0
GLOBAL	__end_of_initPin
	__end_of_initPin:
;; =============== function _initPin ends ============

	signat	_initPin,88
	global	_AD_Sample
psect	text791,local,class=CODE,delta=2
global __ptext791
__ptext791:

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
;; Hardware stack levels required when called:    2
;; This function calls:
;;		Nothing
;; This function is called by:
;;		_process_AD_Converter_Value
;; This function uses a non-reentrant model
;;
psect	text791
	file	"D:\develop\190625\AK7030-OTP\common.c"
	line	286
	global	__size_of_AD_Sample
	__size_of_AD_Sample	equ	__end_of_AD_Sample-_AD_Sample
	
_AD_Sample:	
	opt	stack 4
; Regs used in _AD_Sample: [wreg+status,2+status,0]
	line	287
	
l3502:	
;common.c: 287: if(sampleTimes < 12)
	movlw	(0Ch)
	subwf	(_sampleTimes),w
	skipnc
	goto	u1081
	goto	u1080
u1081:
	goto	l1569
u1080:
	line	309
	
l3504:	
;common.c: 288: {
;common.c: 309: sampleTimes++;
	incf	(_sampleTimes),f
	line	311
	
l3506:	
;common.c: 311: if(sampleTimes >= 12)
	movlw	(0Ch)
	subwf	(_sampleTimes),w
	skipc
	goto	u1091
	goto	u1090
u1091:
	goto	l1569
u1090:
	line	313
	
l3508:	
;common.c: 312: {
;common.c: 313: sampleTimes = 0;
	clrf	(_sampleTimes)
	line	315
	
l3510:	
;common.c: 315: if(sampleChannelSelect == 12)
	movf	(_sampleChannelSelect),w
	xorlw	0Ch
	skipz
	goto	u1101
	goto	u1100
u1101:
	goto	l3514
u1100:
	line	319
	
l3512:	
;common.c: 316: {
;common.c: 319: sampleChannelSelect = 13;
	movlw	(0Dh)
	movwf	(_sampleChannelSelect)
	line	320
;common.c: 320: }
	goto	l1569
	line	334
	
l3514:	
;common.c: 331: else
;common.c: 332: {
;common.c: 334: sampleChannelSelect = 12;
	movlw	(0Ch)
	movwf	(_sampleChannelSelect)
	line	342
	
l1569:	
	return
	opt stack 0
GLOBAL	__end_of_AD_Sample
	__end_of_AD_Sample:
;; =============== function _AD_Sample ends ============

	signat	_AD_Sample,88
	global	_setAD_ConvertFlag
psect	text792,local,class=CODE,delta=2
global __ptext792
__ptext792:

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
;;		_process_AD_Converter_Value
;; This function uses a non-reentrant model
;;
psect	text792
	file	"D:\develop\190625\AK7030-OTP\common.c"
	line	215
	global	__size_of_setAD_ConvertFlag
	__size_of_setAD_ConvertFlag	equ	__end_of_setAD_ConvertFlag-_setAD_ConvertFlag
	
_setAD_ConvertFlag:	
	opt	stack 4
; Regs used in _setAD_ConvertFlag: [wreg]
;setAD_ConvertFlag@flag stored from wreg
	movwf	(setAD_ConvertFlag@flag)
	line	216
	
l3500:	
;common.c: 216: adc_convert_flag = flag;
	movf	(setAD_ConvertFlag@flag),w
	movwf	(_adc_convert_flag)
	line	217
	
l1547:	
	return
	opt stack 0
GLOBAL	__end_of_setAD_ConvertFlag
	__end_of_setAD_ConvertFlag:
;; =============== function _setAD_ConvertFlag ends ============

	signat	_setAD_ConvertFlag,4216
	global	_getAD_ConvertFlag
psect	text793,local,class=CODE,delta=2
global __ptext793
__ptext793:

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
;; Hardware stack levels required when called:    2
;; This function calls:
;;		Nothing
;; This function is called by:
;;		_process_AD_Converter_Value
;; This function uses a non-reentrant model
;;
psect	text793
	file	"D:\develop\190625\AK7030-OTP\common.c"
	line	209
	global	__size_of_getAD_ConvertFlag
	__size_of_getAD_ConvertFlag	equ	__end_of_getAD_ConvertFlag-_getAD_ConvertFlag
	
_getAD_ConvertFlag:	
	opt	stack 4
; Regs used in _getAD_ConvertFlag: [wreg]
	line	210
	
l3496:	
;common.c: 210: return adc_convert_flag;
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	movf	(_adc_convert_flag),w
	line	211
	
l1544:	
	return
	opt stack 0
GLOBAL	__end_of_getAD_ConvertFlag
	__end_of_getAD_ConvertFlag:
;; =============== function _getAD_ConvertFlag ends ============

	signat	_getAD_ConvertFlag,89
	global	_Filter
psect	text794,local,class=CODE,delta=2
global __ptext794
__ptext794:

;; *************** function _Filter *****************
;; Defined at:
;;		line 60 in file "D:\develop\190625\AK7030-OTP\common.c"
;; Parameters:    Size  Location     Type
;;  tmpValue        1    wreg     PTR int 
;;		 -> uiSampleChannelFourteenth(24), uiSampleChannelFourth(24), uiSampleChannelFirst(24), 
;; Auto vars:     Size  Location     Type
;;  tmpValue        1   34[BANK0 ] PTR int 
;;		 -> uiSampleChannelFourteenth(24), uiSampleChannelFourth(24), uiSampleChannelFirst(24), 
;;  cir             2   35[BANK0 ] int 
;;  filter_buf     24    6[BANK0 ] unsigned int [12]
;;  filter_sum      2   32[BANK0 ] unsigned int 
;;  filter_temp     2   30[BANK0 ] unsigned int 
;;  i               1   38[BANK0 ] unsigned char 
;;  j               1   37[BANK0 ] unsigned char 
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
;;      Locals:         0      33       0       0       0
;;      Temps:          0       4       0       0       0
;;      Totals:         0      39       0       0       0
;;Total ram usage:       39 bytes
;; Hardware stack levels used:    1
;; Hardware stack levels required when called:    2
;; This function calls:
;;		Nothing
;; This function is called by:
;;		_getAdOriginalCh13Value
;; This function uses a non-reentrant model
;;
psect	text794
	file	"D:\develop\190625\AK7030-OTP\common.c"
	line	60
	global	__size_of_Filter
	__size_of_Filter	equ	__end_of_Filter-_Filter
	
_Filter:	
	opt	stack 4
; Regs used in _Filter: [wreg-fsr0h+status,2+status,0+btemp+1]
;Filter@tmpValue stored from wreg
	line	62
	movwf	(Filter@tmpValue)
	
l3398:	
	clrf	(Filter@j)
	line	64
;common.c: 64: unsigned int filter_temp = 0, filter_sum = 0;
	clrf	(Filter@filter_temp)
	clrf	(Filter@filter_temp+1)
	clrf	(Filter@filter_sum)
	clrf	(Filter@filter_sum+1)
	line	68
;common.c: 66: unsigned int filter_buf[12];
;common.c: 68: for(int cir = 0;cir < 12; cir++)
	clrf	(Filter@cir)
	clrf	(Filter@cir+1)
	line	69
	
l3404:	
;common.c: 69: filter_buf[cir] = *tmpValue++;
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
	
l3406:	
	incf	(Filter@tmpValue),f
	incf	(Filter@tmpValue),f
	line	68
	
l3408:	
	incf	(Filter@cir),f
	skipnz
	incf	(Filter@cir+1),f
	
l3410:	
	movf	(Filter@cir+1),w
	xorlw	80h
	movwf	btemp+1
	movlw	(high(0Ch))^80h
	subwf	btemp+1,w
	skipz
	goto	u965
	movlw	low(0Ch)
	subwf	(Filter@cir),w
u965:

	skipc
	goto	u961
	goto	u960
u961:
	goto	l3404
u960:
	line	72
	
l3412:	
;common.c: 72: for(j = 0; j < 12 - 1; j++)
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	clrf	(Filter@j)
	line	74
	
l3418:	
;common.c: 73: {
;common.c: 74: for(i = 0; i < 12 - 1 - j; i++)
	clrf	(Filter@i)
	goto	l3426
	line	76
	
l3420:	
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
	goto	u975
	movf	0+(??_Filter+0)+0,w
	subwf	0+(??_Filter+2)+0,w
u975:
	skipnc
	goto	u971
	goto	u970
u971:
	goto	l3424
u970:
	line	79
	
l3422:	
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
	
l3424:	
	incf	(Filter@i),f
	
l3426:	
	movlw	high(0Bh)
	movwf	(??_Filter+0)+0+1
	movf	(Filter@j),w
	sublw	low(0Bh)
	movwf	(??_Filter+0)+0
	skipc
	decf	(??_Filter+0)+0+1,f
	movf	1+(??_Filter+0)+0,w
	xorlw	80h
	sublw	080h
	skipz
	goto	u985
	movf	0+(??_Filter+0)+0,w
	subwf	(Filter@i),w
u985:

	skipc
	goto	u981
	goto	u980
u981:
	goto	l3420
u980:
	line	72
	
l3428:	
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	incf	(Filter@j),f
	
l3430:	
	movlw	(0Bh)
	subwf	(Filter@j),w
	skipc
	goto	u991
	goto	u990
u991:
	goto	l3418
u990:
	line	88
	
l3432:	
;common.c: 84: }
;common.c: 85: }
;common.c: 86: }
;common.c: 88: for(i = 2; i < 12 - 2; i++)
	movlw	(02h)
	movwf	(Filter@i)
	line	90
	
l3436:	
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
	
l3438:	
	incf	(Filter@i),f
	
l3440:	
	movlw	(0Ah)
	subwf	(Filter@i),w
	skipc
	goto	u1001
	goto	u1000
u1001:
	goto	l3436
u1000:
	line	93
	
l3442:	
;common.c: 91: }
;common.c: 93: return (filter_sum >> 3);
	movf	(Filter@filter_sum+1),w
	movwf	(?_Filter+1)
	movf	(Filter@filter_sum),w
	movwf	(?_Filter)
	
l3444:	
	clrc
	rrf	(?_Filter+1),f
	rrf	(?_Filter),f
	clrc
	rrf	(?_Filter+1),f
	rrf	(?_Filter),f
	clrc
	rrf	(?_Filter+1),f
	rrf	(?_Filter),f
	line	95
	
l1506:	
	return
	opt stack 0
GLOBAL	__end_of_Filter
	__end_of_Filter:
;; =============== function _Filter ends ============

	signat	_Filter,4218
	global	_isFinishedOneHoursTimer
psect	text795,local,class=CODE,delta=2
global __ptext795
__ptext795:

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
;; Hardware stack levels required when called:    2
;; This function calls:
;;		Nothing
;; This function is called by:
;;		_main
;; This function uses a non-reentrant model
;;
psect	text795
	file	"D:\develop\190625\AK7030-OTP\common.c"
	line	507
	global	__size_of_isFinishedOneHoursTimer
	__size_of_isFinishedOneHoursTimer	equ	__end_of_isFinishedOneHoursTimer-_isFinishedOneHoursTimer
	
_isFinishedOneHoursTimer:	
	opt	stack 5
; Regs used in _isFinishedOneHoursTimer: [wreg+status,2+status,0]
	line	508
	
l3382:	
;common.c: 508: if((uiOneHourTimer == 0) && bOneHourTimerStartFlag)
	movf	((_uiOneHourTimer+1)),w
	iorwf	((_uiOneHourTimer)),w
	skipz
	goto	u941
	goto	u940
u941:
	goto	l3394
u940:
	
l3384:	
	movf	(_bOneHourTimerStartFlag),w
	skipz
	goto	u950
	goto	l3394
u950:
	line	510
	
l3386:	
;common.c: 509: {
;common.c: 510: bOneHourTimerStartFlag = 0;
	clrf	(_bOneHourTimerStartFlag)
	line	511
	
l3388:	
;common.c: 511: return 1;
	movlw	(01h)
	goto	l1631
	line	514
	
l3394:	
;common.c: 513: else
;common.c: 514: return 0;
	movlw	(0)
	line	515
	
l1631:	
	return
	opt stack 0
GLOBAL	__end_of_isFinishedOneHoursTimer
	__end_of_isFinishedOneHoursTimer:
;; =============== function _isFinishedOneHoursTimer ends ============

	signat	_isFinishedOneHoursTimer,89
	global	_startOneHoursTimer
psect	text796,local,class=CODE,delta=2
global __ptext796
__ptext796:

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
;;		_main
;; This function uses a non-reentrant model
;;
psect	text796
	file	"D:\develop\190625\AK7030-OTP\common.c"
	line	424
	global	__size_of_startOneHoursTimer
	__size_of_startOneHoursTimer	equ	__end_of_startOneHoursTimer-_startOneHoursTimer
	
_startOneHoursTimer:	
	opt	stack 5
; Regs used in _startOneHoursTimer: [wreg+status,2+status,0]
	line	425
	
l3374:	
;common.c: 425: if(( 0 == uiOneHourTimer ) && ( 0 == bOneHourTimerStartFlag ))
	movf	((_uiOneHourTimer+1)),w
	iorwf	((_uiOneHourTimer)),w
	skipz
	goto	u921
	goto	u920
u921:
	goto	l1599
u920:
	
l3376:	
	movf	(_bOneHourTimerStartFlag),f
	skipz
	goto	u931
	goto	u930
u931:
	goto	l1599
u930:
	line	427
	
l3378:	
;common.c: 426: {
;common.c: 427: uiOneHourTimer = uiSetTime;
	movf	(startOneHoursTimer@uiSetTime+1),w
	movwf	(_uiOneHourTimer+1)
	movf	(startOneHoursTimer@uiSetTime),w
	movwf	(_uiOneHourTimer)
	line	428
	
l3380:	
;common.c: 428: bOneHourTimerStartFlag = 1;
	clrf	(_bOneHourTimerStartFlag)
	incf	(_bOneHourTimerStartFlag),f
	line	434
	
l1599:	
	return
	opt stack 0
GLOBAL	__end_of_startOneHoursTimer
	__end_of_startOneHoursTimer:
;; =============== function _startOneHoursTimer ends ============

	signat	_startOneHoursTimer,4216
	global	_isFinishedThreeHoursTimer
psect	text797,local,class=CODE,delta=2
global __ptext797
__ptext797:

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
;; This function uses a non-reentrant model
;;
psect	text797
	file	"D:\develop\190625\AK7030-OTP\common.c"
	line	494
	global	__size_of_isFinishedThreeHoursTimer
	__size_of_isFinishedThreeHoursTimer	equ	__end_of_isFinishedThreeHoursTimer-_isFinishedThreeHoursTimer
	
_isFinishedThreeHoursTimer:	
	opt	stack 5
; Regs used in _isFinishedThreeHoursTimer: [wreg+status,2+status,0]
	line	495
	
l3358:	
;common.c: 495: if((uiSmallTimer == 0) && bSmallTimerStartFlag)
	movf	((_uiSmallTimer+1)),w
	iorwf	((_uiSmallTimer)),w
	skipz
	goto	u901
	goto	u900
u901:
	goto	l3370
u900:
	
l3360:	
	movf	(_bSmallTimerStartFlag),w
	skipz
	goto	u910
	goto	l3370
u910:
	line	497
	
l3362:	
;common.c: 496: {
;common.c: 497: bSmallTimerStartFlag = 0;
	clrf	(_bSmallTimerStartFlag)
	line	498
	
l3364:	
;common.c: 498: return 1;
	movlw	(01h)
	goto	l1626
	line	501
	
l3370:	
;common.c: 500: else
;common.c: 501: return 0;
	movlw	(0)
	line	502
	
l1626:	
	return
	opt stack 0
GLOBAL	__end_of_isFinishedThreeHoursTimer
	__end_of_isFinishedThreeHoursTimer:
;; =============== function _isFinishedThreeHoursTimer ends ============

	signat	_isFinishedThreeHoursTimer,89
	global	_startThreeHoursTimer
psect	text798,local,class=CODE,delta=2
global __ptext798
__ptext798:

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
;;		_main
;; This function uses a non-reentrant model
;;
psect	text798
	file	"D:\develop\190625\AK7030-OTP\common.c"
	line	411
	global	__size_of_startThreeHoursTimer
	__size_of_startThreeHoursTimer	equ	__end_of_startThreeHoursTimer-_startThreeHoursTimer
	
_startThreeHoursTimer:	
	opt	stack 5
; Regs used in _startThreeHoursTimer: [wreg+status,2+status,0]
	line	412
	
l3350:	
;common.c: 412: if(( 0 == uiSmallTimer ) && ( 0 == bSmallTimerStartFlag ))
	movf	((_uiSmallTimer+1)),w
	iorwf	((_uiSmallTimer)),w
	skipz
	goto	u881
	goto	u880
u881:
	goto	l1595
u880:
	
l3352:	
	movf	(_bSmallTimerStartFlag),f
	skipz
	goto	u891
	goto	u890
u891:
	goto	l1595
u890:
	line	414
	
l3354:	
;common.c: 413: {
;common.c: 414: uiSmallTimer = uiSetTime;
	movf	(startThreeHoursTimer@uiSetTime+1),w
	movwf	(_uiSmallTimer+1)
	movf	(startThreeHoursTimer@uiSetTime),w
	movwf	(_uiSmallTimer)
	line	415
	
l3356:	
;common.c: 415: bSmallTimerStartFlag = 1;
	clrf	(_bSmallTimerStartFlag)
	incf	(_bSmallTimerStartFlag),f
	line	421
	
l1595:	
	return
	opt stack 0
GLOBAL	__end_of_startThreeHoursTimer
	__end_of_startThreeHoursTimer:
;; =============== function _startThreeHoursTimer ends ============

	signat	_startThreeHoursTimer,4216
	global	_isFinishedTwelveHoursTimer
psect	text799,local,class=CODE,delta=2
global __ptext799
__ptext799:

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
;; This function uses a non-reentrant model
;;
psect	text799
	file	"D:\develop\190625\AK7030-OTP\common.c"
	line	483
	global	__size_of_isFinishedTwelveHoursTimer
	__size_of_isFinishedTwelveHoursTimer	equ	__end_of_isFinishedTwelveHoursTimer-_isFinishedTwelveHoursTimer
	
_isFinishedTwelveHoursTimer:	
	opt	stack 5
; Regs used in _isFinishedTwelveHoursTimer: [wreg+status,2+status,0]
	line	484
	
l3334:	
;common.c: 484: if(( uiBigTimer == 0 ) && bBigTimerStartFlag )
	movf	((_uiBigTimer+1)),w
	iorwf	((_uiBigTimer)),w
	skipz
	goto	u861
	goto	u860
u861:
	goto	l3346
u860:
	
l3336:	
	movf	(_bBigTimerStartFlag),w
	skipz
	goto	u870
	goto	l3346
u870:
	line	486
	
l3338:	
;common.c: 485: {
;common.c: 486: bBigTimerStartFlag = 0;
	clrf	(_bBigTimerStartFlag)
	line	487
	
l3340:	
;common.c: 487: return 1;
	movlw	(01h)
	goto	l1621
	line	490
	
l3346:	
;common.c: 489: else
;common.c: 490: return 0;
	movlw	(0)
	line	491
	
l1621:	
	return
	opt stack 0
GLOBAL	__end_of_isFinishedTwelveHoursTimer
	__end_of_isFinishedTwelveHoursTimer:
;; =============== function _isFinishedTwelveHoursTimer ends ============

	signat	_isFinishedTwelveHoursTimer,89
	global	_startTwelveHourTimer
psect	text800,local,class=CODE,delta=2
global __ptext800
__ptext800:

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
;;		_main
;; This function uses a non-reentrant model
;;
psect	text800
	file	"D:\develop\190625\AK7030-OTP\common.c"
	line	363
	global	__size_of_startTwelveHourTimer
	__size_of_startTwelveHourTimer	equ	__end_of_startTwelveHourTimer-_startTwelveHourTimer
	
_startTwelveHourTimer:	
	opt	stack 5
; Regs used in _startTwelveHourTimer: [wreg+status,2+status,0]
	line	364
	
l3326:	
;common.c: 364: if((0 == uiBigTimer) && ( 0 == bBigTimerStartFlag))
	movf	((_uiBigTimer+1)),w
	iorwf	((_uiBigTimer)),w
	skipz
	goto	u841
	goto	u840
u841:
	goto	l1576
u840:
	
l3328:	
	movf	(_bBigTimerStartFlag),f
	skipz
	goto	u851
	goto	u850
u851:
	goto	l1576
u850:
	line	366
	
l3330:	
;common.c: 365: {
;common.c: 366: uiBigTimer = uiSetTime;
	movf	(startTwelveHourTimer@uiSetTime+1),w
	movwf	(_uiBigTimer+1)
	movf	(startTwelveHourTimer@uiSetTime),w
	movwf	(_uiBigTimer)
	line	367
	
l3332:	
;common.c: 367: bBigTimerStartFlag = 1;
	clrf	(_bBigTimerStartFlag)
	incf	(_bBigTimerStartFlag),f
	line	374
	
l1576:	
	return
	opt stack 0
GLOBAL	__end_of_startTwelveHourTimer
	__end_of_startTwelveHourTimer:
;; =============== function _startTwelveHourTimer ends ============

	signat	_startTwelveHourTimer,4216
	global	_clearTwentyMinTimer
psect	text801,local,class=CODE,delta=2
global __ptext801
__ptext801:

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
;; Hardware stack levels required when called:    2
;; This function calls:
;;		Nothing
;; This function is called by:
;;		_main
;; This function uses a non-reentrant model
;;
psect	text801
	file	"D:\develop\190625\AK7030-OTP\common.c"
	line	404
	global	__size_of_clearTwentyMinTimer
	__size_of_clearTwentyMinTimer	equ	__end_of_clearTwentyMinTimer-_clearTwentyMinTimer
	
_clearTwentyMinTimer:	
	opt	stack 5
; Regs used in _clearTwentyMinTimer: [status,2]
	line	405
	
l3324:	
;common.c: 405: uiTwentyMinTimer = 0;
	clrf	(_uiTwentyMinTimer)
	clrf	(_uiTwentyMinTimer+1)
	line	406
;common.c: 406: bTwentyMinStartFlag = 0;
	clrf	(_bTwentyMinStartFlag)
	line	407
	
l1591:	
	return
	opt stack 0
GLOBAL	__end_of_clearTwentyMinTimer
	__end_of_clearTwentyMinTimer:
;; =============== function _clearTwentyMinTimer ends ============

	signat	_clearTwentyMinTimer,88
	global	_isFinishedTwentyMinTimer
psect	text802,local,class=CODE,delta=2
global __ptext802
__ptext802:

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
;; This function uses a non-reentrant model
;;
psect	text802
	file	"D:\develop\190625\AK7030-OTP\common.c"
	line	459
	global	__size_of_isFinishedTwentyMinTimer
	__size_of_isFinishedTwentyMinTimer	equ	__end_of_isFinishedTwentyMinTimer-_isFinishedTwentyMinTimer
	
_isFinishedTwentyMinTimer:	
	opt	stack 5
; Regs used in _isFinishedTwentyMinTimer: [wreg+status,2+status,0]
	line	460
	
l3308:	
;common.c: 460: if(( 0 == uiTwentyMinTimer ) && bTwentyMinStartFlag )
	movf	((_uiTwentyMinTimer+1)),w
	iorwf	((_uiTwentyMinTimer)),w
	skipz
	goto	u821
	goto	u820
u821:
	goto	l3320
u820:
	
l3310:	
	movf	(_bTwentyMinStartFlag),w
	skipz
	goto	u830
	goto	l3320
u830:
	line	462
	
l3312:	
;common.c: 461: {
;common.c: 462: bTwentyMinStartFlag = 0;
	clrf	(_bTwentyMinStartFlag)
	line	463
	
l3314:	
;common.c: 463: return 1;
	movlw	(01h)
	goto	l1611
	line	466
	
l3320:	
;common.c: 465: else
;common.c: 466: return 0;
	movlw	(0)
	line	467
	
l1611:	
	return
	opt stack 0
GLOBAL	__end_of_isFinishedTwentyMinTimer
	__end_of_isFinishedTwentyMinTimer:
;; =============== function _isFinishedTwentyMinTimer ends ============

	signat	_isFinishedTwentyMinTimer,89
	global	_clrSampeTime
psect	text803,local,class=CODE,delta=2
global __ptext803
__ptext803:

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
;; Hardware stack levels required when called:    2
;; This function calls:
;;		Nothing
;; This function is called by:
;;		_main
;; This function uses a non-reentrant model
;;
psect	text803
	file	"D:\develop\190625\AK7030-OTP\common.c"
	line	529
	global	__size_of_clrSampeTime
	__size_of_clrSampeTime	equ	__end_of_clrSampeTime-_clrSampeTime
	
_clrSampeTime:	
	opt	stack 5
; Regs used in _clrSampeTime: [status,2]
	line	530
	
l3306:	
;common.c: 530: timer.timer10msStopWatch = 0;
	clrf	(_timer)
	line	531
	
l1640:	
	return
	opt stack 0
GLOBAL	__end_of_clrSampeTime
	__end_of_clrSampeTime:
;; =============== function _clrSampeTime ends ============

	signat	_clrSampeTime,88
	global	_isPermitSampleTime
psect	text804,local,class=CODE,delta=2
global __ptext804
__ptext804:

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
;; Hardware stack levels required when called:    2
;; This function calls:
;;		Nothing
;; This function is called by:
;;		_main
;; This function uses a non-reentrant model
;;
psect	text804
	file	"D:\develop\190625\AK7030-OTP\common.c"
	line	519
	global	__size_of_isPermitSampleTime
	__size_of_isPermitSampleTime	equ	__end_of_isPermitSampleTime-_isPermitSampleTime
	
_isPermitSampleTime:	
	opt	stack 5
; Regs used in _isPermitSampleTime: [wreg]
	line	520
	
l3294:	
;common.c: 520: if(timer.timer10msStopWatch >= 10)
	movlw	(0Ah)
	subwf	(_timer),w
	skipc
	goto	u811
	goto	u810
u811:
	goto	l3302
u810:
	line	522
	
l3296:	
;common.c: 521: {
;common.c: 522: return 1;
	movlw	(01h)
	goto	l1636
	line	525
	
l3302:	
;common.c: 524: else
;common.c: 525: return 0;
	movlw	(0)
	line	526
	
l1636:	
	return
	opt stack 0
GLOBAL	__end_of_isPermitSampleTime
	__end_of_isPermitSampleTime:
;; =============== function _isPermitSampleTime ends ============

	signat	_isPermitSampleTime,89
	global	_startTwentyMinTimer
psect	text805,local,class=CODE,delta=2
global __ptext805
__ptext805:

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
;;		On exit  : 17F/0
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
psect	text805
	file	"D:\develop\190625\AK7030-OTP\common.c"
	line	449
	global	__size_of_startTwentyMinTimer
	__size_of_startTwentyMinTimer	equ	__end_of_startTwentyMinTimer-_startTwentyMinTimer
	
_startTwentyMinTimer:	
	opt	stack 5
; Regs used in _startTwentyMinTimer: [wreg+status,2+status,0]
	line	450
	
l3286:	
;common.c: 450: if(( 0 == uiTwentyMinTimer) && ( 0 == bTwentyMinStartFlag))
	movf	((_uiTwentyMinTimer+1)),w
	iorwf	((_uiTwentyMinTimer)),w
	skipz
	goto	u791
	goto	u790
u791:
	goto	l1607
u790:
	
l3288:	
	movf	(_bTwentyMinStartFlag),f
	skipz
	goto	u801
	goto	u800
u801:
	goto	l1607
u800:
	line	452
	
l3290:	
;common.c: 451: {
;common.c: 452: uiTwentyMinTimer = uiSetValue;
	movf	(startTwentyMinTimer@uiSetValue+1),w
	movwf	(_uiTwentyMinTimer+1)
	movf	(startTwentyMinTimer@uiSetValue),w
	movwf	(_uiTwentyMinTimer)
	line	453
	
l3292:	
;common.c: 453: bTwentyMinStartFlag = 1;
	clrf	(_bTwentyMinStartFlag)
	incf	(_bTwentyMinStartFlag),f
	line	455
	
l1607:	
	return
	opt stack 0
GLOBAL	__end_of_startTwentyMinTimer
	__end_of_startTwentyMinTimer:
;; =============== function _startTwentyMinTimer ends ============

	signat	_startTwentyMinTimer,4216
	global	_adc_start
psect	text806,local,class=CODE,delta=2
global __ptext806
__ptext806:

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
psect	text806
	file	"D:\develop\190625\AK7030-OTP\periph.c"
	line	100
	global	__size_of_adc_start
	__size_of_adc_start	equ	__end_of_adc_start-_adc_start
	
_adc_start:	
	opt	stack 4
; Regs used in _adc_start: []
	line	101
	
l3284:	
;periph.c: 101: GO=1;
	bcf	status, 5	;RP0=0, select bank0
	bsf	(249/8),(249)&7
	line	102
	
l2308:	
	return
	opt stack 0
GLOBAL	__end_of_adc_start
	__end_of_adc_start:
;; =============== function _adc_start ends ============

	signat	_adc_start,88
	global	_adc_test_init
psect	text807,local,class=CODE,delta=2
global __ptext807
__ptext807:

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
psect	text807
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
	
l3274:	
;periph.c: 86: ADCON0 = 0x00;
	clrf	(31)	;volatile
	line	87
	
l3276:	
;periph.c: 87: ADCON0|=channel<<2;
	movf	(adc_test_init@channel),w
	movwf	(??_adc_test_init+0)+0
	clrc
	rlf	(??_adc_test_init+0)+0,f
	clrc
	rlf	(??_adc_test_init+0)+0,w
	iorwf	(31),f	;volatile
	line	88
	
l3278:	
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
	
l3280:	
;periph.c: 89: ADON=1;
	bcf	status, 5	;RP0=0, select bank0
	bsf	(248/8),(248)&7
	line	90
	
l3282:	
;periph.c: 90: ADIE=1;
	bsf	status, 5	;RP0=1, select bank1
	bsf	(1130/8)^080h,(1130)&7
	line	91
	
l2302:	
	return
	opt stack 0
GLOBAL	__end_of_adc_test_init
	__end_of_adc_test_init:
;; =============== function _adc_test_init ends ============

	signat	_adc_test_init,8312
	global	_timer1_interrupt_config
psect	text808,local,class=CODE,delta=2
global __ptext808
__ptext808:

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
psect	text808
	file	"D:\develop\190625\AK7030-OTP\common.c"
	line	201
	global	__size_of_timer1_interrupt_config
	__size_of_timer1_interrupt_config	equ	__end_of_timer1_interrupt_config-_timer1_interrupt_config
	
_timer1_interrupt_config:	
	opt	stack 5
; Regs used in _timer1_interrupt_config: []
	line	202
	
l3272:	
;common.c: 202: GIE = 1;
	bsf	(95/8),(95)&7
	line	203
;common.c: 203: PEIE = 1;
	bsf	(94/8),(94)&7
	line	204
	
l1541:	
	return
	opt stack 0
GLOBAL	__end_of_timer1_interrupt_config
	__end_of_timer1_interrupt_config:
;; =============== function _timer1_interrupt_config ends ============

	signat	_timer1_interrupt_config,88
	global	_timer1_config
psect	text809,local,class=CODE,delta=2
global __ptext809
__ptext809:

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
psect	text809
	file	"D:\develop\190625\AK7030-OTP\common.c"
	line	189
	global	__size_of_timer1_config
	__size_of_timer1_config	equ	__end_of_timer1_config-_timer1_config
	
_timer1_config:	
	opt	stack 5
; Regs used in _timer1_config: [wreg]
	line	191
	
l3268:	
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
	
l3270:	
;common.c: 194: TMR1IE=1;
	bsf	status, 5	;RP0=1, select bank1
	bsf	(1120/8)^080h,(1120)&7
	line	196
	
l1538:	
	return
	opt stack 0
GLOBAL	__end_of_timer1_config
	__end_of_timer1_config:
;; =============== function _timer1_config ends ============

	signat	_timer1_config,88
	global	_clock_config
psect	text810,local,class=CODE,delta=2
global __ptext810
__ptext810:

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
psect	text810
	file	"D:\develop\190625\AK7030-OTP\common.c"
	line	181
	global	__size_of_clock_config
	__size_of_clock_config	equ	__end_of_clock_config-_clock_config
	
_clock_config:	
	opt	stack 5
; Regs used in _clock_config: [wreg+status,2]
	line	183
	
l3264:	
;common.c: 183: CLKPR = 0x80;
	movlw	(080h)
	bcf	status, 5	;RP0=0, select bank2
	bsf	status, 6	;RP1=1, select bank2
	movwf	(264)^0100h	;volatile
	line	184
	
l3266:	
;common.c: 184: CLKPR = 0x00;
	clrf	(264)^0100h	;volatile
	line	185
;common.c: 185: while(CLKPCE);
	
l1532:	
	btfsc	(2119/8)^0100h,(2119)&7
	goto	u781
	goto	u780
u781:
	goto	l1532
u780:
	line	186
	
l1535:	
	return
	opt stack 0
GLOBAL	__end_of_clock_config
	__end_of_clock_config:
;; =============== function _clock_config ends ============

	signat	_clock_config,88
	global	_reset
psect	text811,local,class=CODE,delta=2
global __ptext811
__ptext811:

;; *************** function _reset *****************
;; Defined at:
;;		line 336 in file "D:\develop\190625\AK7030-OTP\main.c"
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
;; Hardware stack levels required when called:    2
;; This function calls:
;;		Nothing
;; This function is called by:
;;		_main
;; This function uses a non-reentrant model
;;
psect	text811
	file	"D:\develop\190625\AK7030-OTP\main.c"
	line	336
	global	__size_of_reset
	__size_of_reset	equ	__end_of_reset-_reset
	
_reset:	
	opt	stack 5
; Regs used in _reset: []
	line	338
;main.c: 338: while(1);
	
l731:	
	goto	l731
	return
	opt stack 0
psect	text812,local,class=CODE,delta=2
global __ptext812
__ptext812:
	line	342
GLOBAL	__end_of_reset
	__end_of_reset:
;; =============== function _reset ends ============

	signat	_reset,88
	global	_setPulseWidth

;; *************** function _setPulseWidth *****************
;; Defined at:
;;		line 327 in file "D:\develop\190625\AK7030-OTP\main.c"
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
;; Hardware stack levels required when called:    2
;; This function calls:
;;		Nothing
;; This function is called by:
;;		_main
;; This function uses a non-reentrant model
;;
psect	text812
	file	"D:\develop\190625\AK7030-OTP\main.c"
	line	327
	global	__size_of_setPulseWidth
	__size_of_setPulseWidth	equ	__end_of_setPulseWidth-_setPulseWidth
	
_setPulseWidth:	
	opt	stack 5
; Regs used in _setPulseWidth: []
	line	333
	
l728:	
	return
	opt stack 0
GLOBAL	__end_of_setPulseWidth
	__end_of_setPulseWidth:
;; =============== function _setPulseWidth ends ============

	signat	_setPulseWidth,88
	global	_selectAdChannel
psect	text813,local,class=CODE,delta=2
global __ptext813
__ptext813:

;; *************** function _selectAdChannel *****************
;; Defined at:
;;		line 317 in file "D:\develop\190625\AK7030-OTP\main.c"
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
psect	text813
	file	"D:\develop\190625\AK7030-OTP\main.c"
	line	317
	global	__size_of_selectAdChannel
	__size_of_selectAdChannel	equ	__end_of_selectAdChannel-_selectAdChannel
	
_selectAdChannel:	
	opt	stack 5
; Regs used in _selectAdChannel: []
	line	319
	
l3262:	
;main.c: 319: TRISB0 = 1;
	bsf	status, 5	;RP0=1, select bank1
	bsf	(1072/8)^080h,(1072)&7
	line	320
;main.c: 320: TRISB1 = 1;
	bsf	(1073/8)^080h,(1073)&7
	line	324
	
l725:	
	return
	opt stack 0
GLOBAL	__end_of_selectAdChannel
	__end_of_selectAdChannel:
;; =============== function _selectAdChannel ends ============

	signat	_selectAdChannel,88
	global	_pwm_start
psect	text814,local,class=CODE,delta=2
global __ptext814
__ptext814:

;; *************** function _pwm_start *****************
;; Defined at:
;;		line 272 in file "D:\develop\190625\AK7030-OTP\main.c"
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
;; Hardware stack levels required when called:    2
;; This function calls:
;;		Nothing
;; This function is called by:
;;		_main
;; This function uses a non-reentrant model
;;
psect	text814
	file	"D:\develop\190625\AK7030-OTP\main.c"
	line	272
	global	__size_of_pwm_start
	__size_of_pwm_start	equ	__end_of_pwm_start-_pwm_start
	
_pwm_start:	
	opt	stack 5
; Regs used in _pwm_start: [wreg+status,2+status,0]
	line	275
	
l3256:	
;main.c: 275: CCP1CON = 0x10 ;
	movlw	(010h)
	movwf	(23)	;volatile
	line	276
;main.c: 276: PR2 = 4 ;
	movlw	(04h)
	bsf	status, 5	;RP0=1, select bank1
	movwf	(146)^080h	;volatile
	line	277
;main.c: 277: T2CON = 0x04 ;
	movlw	(04h)
	bcf	status, 5	;RP0=0, select bank0
	movwf	(18)	;volatile
	line	278
;main.c: 278: CCPR1L = 0x02 ;
	movlw	(02h)
	movwf	(21)	;volatile
	line	279
;main.c: 279: PWMCON1 = 0x55;
	movlw	(055h)
	bsf	status, 5	;RP0=1, select bank1
	movwf	(150)^080h	;volatile
	line	281
	
l3258:	
;main.c: 281: TRISB2=0;
	bcf	(1074/8)^080h,(1074)&7
	line	283
	
l3260:	
;main.c: 283: CCP1CON |= 0x0e ;
	movlw	(0Eh)
	bcf	status, 5	;RP0=0, select bank0
	iorwf	(23),f	;volatile
	line	287
	
l716:	
	return
	opt stack 0
GLOBAL	__end_of_pwm_start
	__end_of_pwm_start:
;; =============== function _pwm_start ends ============

	signat	_pwm_start,88
	global	_initPB2_AsHighResistence
psect	text815,local,class=CODE,delta=2
global __ptext815
__ptext815:

;; *************** function _initPB2_AsHighResistence *****************
;; Defined at:
;;		line 229 in file "D:\develop\190625\AK7030-OTP\main.c"
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
psect	text815
	file	"D:\develop\190625\AK7030-OTP\main.c"
	line	229
	global	__size_of_initPB2_AsHighResistence
	__size_of_initPB2_AsHighResistence	equ	__end_of_initPB2_AsHighResistence-_initPB2_AsHighResistence
	
_initPB2_AsHighResistence:	
	opt	stack 4
; Regs used in _initPB2_AsHighResistence: []
	line	231
	
l3254:	
;main.c: 231: PB2 = 1;
	bsf	(50/8),(50)&7
	line	232
;main.c: 232: PBOD2 = 1;
	bsf	status, 5	;RP0=1, select bank3
	bsf	status, 6	;RP1=1, select bank3
	bsf	(3138/8)^0180h,(3138)&7
	line	236
	
l710:	
	return
	opt stack 0
GLOBAL	__end_of_initPB2_AsHighResistence
	__end_of_initPB2_AsHighResistence:
;; =============== function _initPB2_AsHighResistence ends ============

	signat	_initPB2_AsHighResistence,88
	global	_setPB5
psect	text816,local,class=CODE,delta=2
global __ptext816
__ptext816:

;; *************** function _setPB5 *****************
;; Defined at:
;;		line 212 in file "D:\develop\190625\AK7030-OTP\main.c"
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
psect	text816
	file	"D:\develop\190625\AK7030-OTP\main.c"
	line	212
	global	__size_of_setPB5
	__size_of_setPB5	equ	__end_of_setPB5-_setPB5
	
_setPB5:	
	opt	stack 5
; Regs used in _setPB5: [wreg]
;setPB5@bValue stored from wreg
	movwf	(setPB5@bValue)
	line	213
	
l3250:	
;main.c: 213: if( bValue )
	movf	(setPB5@bValue),w
	skipz
	goto	u770
	goto	l705
u770:
	line	215
	
l3252:	
;main.c: 215: PB5 = 1;
	bsf	(53/8),(53)&7
	goto	l707
	line	219
	
l705:	
	line	221
;main.c: 219: else
;main.c: 221: PB5= 0;
	bcf	(53/8),(53)&7
	line	225
	
l707:	
	return
	opt stack 0
GLOBAL	__end_of_setPB5
	__end_of_setPB5:
;; =============== function _setPB5 ends ============

	signat	_setPB5,4216
	global	_initPB5
psect	text817,local,class=CODE,delta=2
global __ptext817
__ptext817:

;; *************** function _initPB5 *****************
;; Defined at:
;;		line 195 in file "D:\develop\190625\AK7030-OTP\main.c"
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
psect	text817
	file	"D:\develop\190625\AK7030-OTP\main.c"
	line	195
	global	__size_of_initPB5
	__size_of_initPB5	equ	__end_of_initPB5-_initPB5
	
_initPB5:	
	opt	stack 4
; Regs used in _initPB5: [wreg]
;initPB5@bValue stored from wreg
	bcf	status, 5	;RP0=0, select bank0
	movwf	(initPB5@bValue)
	line	196
	
l3246:	
;main.c: 196: if( bValue )
	movf	(initPB5@bValue),w
	skipz
	goto	u760
	goto	l700
u760:
	line	198
	
l3248:	
;main.c: 198: TRISB5 = 1;
	bsf	status, 5	;RP0=1, select bank1
	bsf	(1077/8)^080h,(1077)&7
	goto	l702
	line	202
	
l700:	
	line	204
;main.c: 202: else
;main.c: 204: TRISB5= 0;
	bsf	status, 5	;RP0=1, select bank1
	bcf	(1077/8)^080h,(1077)&7
	line	208
	
l702:	
	return
	opt stack 0
GLOBAL	__end_of_initPB5
	__end_of_initPB5:
;; =============== function _initPB5 ends ============

	signat	_initPB5,4216
	global	_setPB4
psect	text818,local,class=CODE,delta=2
global __ptext818
__ptext818:

;; *************** function _setPB4 *****************
;; Defined at:
;;		line 178 in file "D:\develop\190625\AK7030-OTP\main.c"
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
psect	text818
	file	"D:\develop\190625\AK7030-OTP\main.c"
	line	178
	global	__size_of_setPB4
	__size_of_setPB4	equ	__end_of_setPB4-_setPB4
	
_setPB4:	
	opt	stack 5
; Regs used in _setPB4: [wreg]
;setPB4@bValue stored from wreg
	movwf	(setPB4@bValue)
	line	179
	
l3242:	
;main.c: 179: if( bValue )
	movf	(setPB4@bValue),w
	skipz
	goto	u750
	goto	l695
u750:
	line	181
	
l3244:	
;main.c: 181: PB4 = 1;
	bsf	(52/8),(52)&7
	goto	l697
	line	185
	
l695:	
	line	187
;main.c: 185: else
;main.c: 187: PB4= 0;
	bcf	(52/8),(52)&7
	line	191
	
l697:	
	return
	opt stack 0
GLOBAL	__end_of_setPB4
	__end_of_setPB4:
;; =============== function _setPB4 ends ============

	signat	_setPB4,4216
	global	_initPB4
psect	text819,local,class=CODE,delta=2
global __ptext819
__ptext819:

;; *************** function _initPB4 *****************
;; Defined at:
;;		line 161 in file "D:\develop\190625\AK7030-OTP\main.c"
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
psect	text819
	file	"D:\develop\190625\AK7030-OTP\main.c"
	line	161
	global	__size_of_initPB4
	__size_of_initPB4	equ	__end_of_initPB4-_initPB4
	
_initPB4:	
	opt	stack 4
; Regs used in _initPB4: [wreg]
;initPB4@bValue stored from wreg
	bcf	status, 5	;RP0=0, select bank0
	movwf	(initPB4@bValue)
	line	162
	
l3238:	
;main.c: 162: if( bValue )
	movf	(initPB4@bValue),w
	skipz
	goto	u740
	goto	l690
u740:
	line	164
	
l3240:	
;main.c: 164: TRISB4 = 1;
	bsf	status, 5	;RP0=1, select bank1
	bsf	(1076/8)^080h,(1076)&7
	goto	l692
	line	168
	
l690:	
	line	170
;main.c: 168: else
;main.c: 170: TRISB4= 0;
	bsf	status, 5	;RP0=1, select bank1
	bcf	(1076/8)^080h,(1076)&7
	line	174
	
l692:	
	return
	opt stack 0
GLOBAL	__end_of_initPB4
	__end_of_initPB4:
;; =============== function _initPB4 ends ============

	signat	_initPB4,4216
	global	_setPB3
psect	text820,local,class=CODE,delta=2
global __ptext820
__ptext820:

;; *************** function _setPB3 *****************
;; Defined at:
;;		line 143 in file "D:\develop\190625\AK7030-OTP\main.c"
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
psect	text820
	file	"D:\develop\190625\AK7030-OTP\main.c"
	line	143
	global	__size_of_setPB3
	__size_of_setPB3	equ	__end_of_setPB3-_setPB3
	
_setPB3:	
	opt	stack 5
; Regs used in _setPB3: [wreg]
;setPB3@bValue stored from wreg
	bcf	status, 5	;RP0=0, select bank0
	movwf	(setPB3@bValue)
	line	144
	
l3234:	
;main.c: 144: if( bValue )
	movf	(setPB3@bValue),w
	skipz
	goto	u730
	goto	l685
u730:
	line	146
	
l3236:	
;main.c: 146: PB3 = 1;
	bsf	(51/8),(51)&7
	goto	l687
	line	150
	
l685:	
	line	152
;main.c: 150: else
;main.c: 152: PB3= 0;
	bcf	(51/8),(51)&7
	line	156
	
l687:	
	return
	opt stack 0
GLOBAL	__end_of_setPB3
	__end_of_setPB3:
;; =============== function _setPB3 ends ============

	signat	_setPB3,4216
	global	_initPB3
psect	text821,local,class=CODE,delta=2
global __ptext821
__ptext821:

;; *************** function _initPB3 *****************
;; Defined at:
;;		line 126 in file "D:\develop\190625\AK7030-OTP\main.c"
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
psect	text821
	file	"D:\develop\190625\AK7030-OTP\main.c"
	line	126
	global	__size_of_initPB3
	__size_of_initPB3	equ	__end_of_initPB3-_initPB3
	
_initPB3:	
	opt	stack 4
; Regs used in _initPB3: [wreg]
;initPB3@bValue stored from wreg
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	movwf	(initPB3@bValue)
	line	127
	
l3230:	
;main.c: 127: if( bValue )
	movf	(initPB3@bValue),w
	skipz
	goto	u720
	goto	l680
u720:
	line	129
	
l3232:	
;main.c: 129: TRISB3 = 1;
	bsf	status, 5	;RP0=1, select bank1
	bsf	(1075/8)^080h,(1075)&7
	goto	l682
	line	133
	
l680:	
	line	135
;main.c: 133: else
;main.c: 135: TRISB3 = 0;
	bsf	status, 5	;RP0=1, select bank1
	bcf	(1075/8)^080h,(1075)&7
	line	139
	
l682:	
	return
	opt stack 0
GLOBAL	__end_of_initPB3
	__end_of_initPB3:
;; =============== function _initPB3 ends ============

	signat	_initPB3,4216
	global	_clearThreeHoursTimer
psect	text822,local,class=CODE,delta=2
global __ptext822
__ptext822:

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
;; This function uses a non-reentrant model
;;
psect	text822
	file	"D:\develop\190625\AK7030-OTP\common.c"
	line	384
	global	__size_of_clearThreeHoursTimer
	__size_of_clearThreeHoursTimer	equ	__end_of_clearThreeHoursTimer-_clearThreeHoursTimer
	
_clearThreeHoursTimer:	
	opt	stack 5
; Regs used in _clearThreeHoursTimer: [status,2]
	line	385
	
l3228:	
;common.c: 385: uiSmallTimer = 0;
	clrf	(_uiSmallTimer)
	clrf	(_uiSmallTimer+1)
	line	386
;common.c: 386: bSmallTimerStartFlag = 0;
	clrf	(_bSmallTimerStartFlag)
	line	387
	
l1582:	
	return
	opt stack 0
GLOBAL	__end_of_clearThreeHoursTimer
	__end_of_clearThreeHoursTimer:
;; =============== function _clearThreeHoursTimer ends ============

	signat	_clearThreeHoursTimer,88
	global	_clearTwelveHoursTimer
psect	text823,local,class=CODE,delta=2
global __ptext823
__ptext823:

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
;; This function uses a non-reentrant model
;;
psect	text823
	file	"D:\develop\190625\AK7030-OTP\common.c"
	line	377
	global	__size_of_clearTwelveHoursTimer
	__size_of_clearTwelveHoursTimer	equ	__end_of_clearTwelveHoursTimer-_clearTwelveHoursTimer
	
_clearTwelveHoursTimer:	
	opt	stack 5
; Regs used in _clearTwelveHoursTimer: [status,2]
	line	378
	
l3226:	
;common.c: 378: uiBigTimer = 0;
	clrf	(_uiBigTimer)
	clrf	(_uiBigTimer+1)
	line	379
;common.c: 379: bBigTimerStartFlag = 0;
	clrf	(_bBigTimerStartFlag)
	line	380
	
l1579:	
	return
	opt stack 0
GLOBAL	__end_of_clearTwelveHoursTimer
	__end_of_clearTwelveHoursTimer:
;; =============== function _clearTwelveHoursTimer ends ============

	signat	_clearTwelveHoursTimer,88
	global	_ISR
psect	text824,local,class=CODE,delta=2
global __ptext824
__ptext824:

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
psect	text824
	file	"D:\develop\190625\AK7030-OTP\common.c"
	line	534
	global	__size_of_ISR
	__size_of_ISR	equ	__end_of_ISR-_ISR
	
_ISR:	
	opt	stack 4
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
psect	text824
	line	537
	
i1l3516:	
;common.c: 535: static unsigned char ucTimer1sCnt = 0;
;common.c: 537: if(TMR1IF == 1)
	btfss	(96/8),(96)&7
	goto	u111_21
	goto	u111_20
u111_21:
	goto	i1l3538
u111_20:
	line	539
	
i1l3518:	
;common.c: 538: {
;common.c: 539: TMR1IF = 0 ;
	bcf	(96/8),(96)&7
	line	540
	
i1l3520:	
;common.c: 540: timer.timer10msStopWatch++;
	incf	(_timer),f
	line	541
;common.c: 541: ucTimer1sCnt++;
	incf	(ISR@ucTimer1sCnt),f
	line	543
	
i1l3522:	
;common.c: 543: if(ucTimer1sCnt >= 100)
	movlw	(064h)
	subwf	(ISR@ucTimer1sCnt),w
	skipc
	goto	u112_21
	goto	u112_20
u112_21:
	goto	i1l3538
u112_20:
	line	545
	
i1l3524:	
;common.c: 544: {
;common.c: 545: ucTimer1sCnt = 0;
	clrf	(ISR@ucTimer1sCnt)
	line	546
	
i1l3526:	
;common.c: 546: if(uiBigTimer > 0)
	movf	(_uiBigTimer+1),w
	iorwf	(_uiBigTimer),w
	skipnz
	goto	u113_21
	goto	u113_20
u113_21:
	goto	i1l1647
u113_20:
	line	547
	
i1l3528:	
;common.c: 547: uiBigTimer--;
	movlw	low(01h)
	subwf	(_uiBigTimer),f
	movlw	high(01h)
	skipc
	decf	(_uiBigTimer+1),f
	subwf	(_uiBigTimer+1),f
	
i1l1647:	
	line	549
;common.c: 549: if(uiSmallTimer)
	movf	(_uiSmallTimer+1),w
	iorwf	(_uiSmallTimer),w
	skipnz
	goto	u114_21
	goto	u114_20
u114_21:
	goto	i1l1648
u114_20:
	line	550
	
i1l3530:	
;common.c: 550: uiSmallTimer--;
	movlw	low(01h)
	subwf	(_uiSmallTimer),f
	movlw	high(01h)
	skipc
	decf	(_uiSmallTimer+1),f
	subwf	(_uiSmallTimer+1),f
	
i1l1648:	
	line	552
;common.c: 552: if(uiTwentySecondsTimer)
	movf	(_uiTwentySecondsTimer+1),w
	iorwf	(_uiTwentySecondsTimer),w
	skipnz
	goto	u115_21
	goto	u115_20
u115_21:
	goto	i1l1649
u115_20:
	line	553
	
i1l3532:	
;common.c: 553: uiTwentySecondsTimer--;
	movlw	low(01h)
	subwf	(_uiTwentySecondsTimer),f
	movlw	high(01h)
	skipc
	decf	(_uiTwentySecondsTimer+1),f
	subwf	(_uiTwentySecondsTimer+1),f
	
i1l1649:	
	line	555
;common.c: 555: if(uiTwentyMinTimer)
	movf	(_uiTwentyMinTimer+1),w
	iorwf	(_uiTwentyMinTimer),w
	skipnz
	goto	u116_21
	goto	u116_20
u116_21:
	goto	i1l1650
u116_20:
	line	556
	
i1l3534:	
;common.c: 556: uiTwentyMinTimer--;
	movlw	low(01h)
	subwf	(_uiTwentyMinTimer),f
	movlw	high(01h)
	skipc
	decf	(_uiTwentyMinTimer+1),f
	subwf	(_uiTwentyMinTimer+1),f
	
i1l1650:	
	line	558
;common.c: 558: if( uiOneHourTimer )
	movf	(_uiOneHourTimer+1),w
	iorwf	(_uiOneHourTimer),w
	skipnz
	goto	u117_21
	goto	u117_20
u117_21:
	goto	i1l3538
u117_20:
	line	559
	
i1l3536:	
;common.c: 559: uiOneHourTimer--;
	movlw	low(01h)
	subwf	(_uiOneHourTimer),f
	movlw	high(01h)
	skipc
	decf	(_uiOneHourTimer+1),f
	subwf	(_uiOneHourTimer+1),f
	line	563
	
i1l3538:	
;common.c: 560: }
;common.c: 561: }
;common.c: 563: if(ADIF)
	btfss	(106/8),(106)&7
	goto	u118_21
	goto	u118_20
u118_21:
	goto	i1l1655
u118_20:
	line	566
	
i1l3540:	
;common.c: 564: {
;common.c: 566: ADIF=0;
	bcf	(106/8),(106)&7
	line	567
	
i1l3542:	
;common.c: 567: setAD_ConvertFlag(1);
	movlw	(01h)
	fcall	i1_setAD_ConvertFlag
	line	569
	
i1l3544:	
;common.c: 569: if(sampleChannelSelect == 12)
	movf	(_sampleChannelSelect),w
	xorlw	0Ch
	skipz
	goto	u119_21
	goto	u119_20
u119_21:
	goto	i1l3548
u119_20:
	line	573
	
i1l3546:	
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
	goto	i1l1655
	line	583
	
i1l3548:	
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
	
i1l1655:	
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
psect	text825,local,class=CODE,delta=2
global __ptext825
__ptext825:

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
psect	text825
	file	"D:\develop\190625\AK7030-OTP\common.c"
	line	215
	global	__size_ofi1_setAD_ConvertFlag
	__size_ofi1_setAD_ConvertFlag	equ	__end_ofi1_setAD_ConvertFlag-i1_setAD_ConvertFlag
	
i1_setAD_ConvertFlag:	
	opt	stack 4
; Regs used in i1_setAD_ConvertFlag: [wreg]
;i1setAD_ConvertFlag@flag stored from wreg
	movwf	(i1setAD_ConvertFlag@flag)
	line	216
	
i1l3554:	
;common.c: 216: adc_convert_flag = flag;
	movf	(i1setAD_ConvertFlag@flag),w
	movwf	(_adc_convert_flag)
	line	217
	
i1l1547:	
	return
	opt stack 0
GLOBAL	__end_ofi1_setAD_ConvertFlag
	__end_ofi1_setAD_ConvertFlag:
;; =============== function i1_setAD_ConvertFlag ends ============

	signat	i1_setAD_ConvertFlag,88
	global	_adc_get
psect	text826,local,class=CODE,delta=2
global __ptext826
__ptext826:

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
psect	text826
	file	"D:\develop\190625\AK7030-OTP\periph.c"
	line	105
	global	__size_of_adc_get
	__size_of_adc_get	equ	__end_of_adc_get-_adc_get
	
_adc_get:	
	opt	stack 4
; Regs used in _adc_get: [wreg]
	line	107
	
i1l3550:	
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
	
i1l2311:	
	return
	opt stack 0
GLOBAL	__end_of_adc_get
	__end_of_adc_get:
;; =============== function _adc_get ends ============

	signat	_adc_get,90
	global	_vPutSampleDataIntoTable
psect	text827,local,class=CODE,delta=2
global __ptext827
__ptext827:

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
psect	text827
	file	"D:\develop\190625\AK7030-OTP\common.c"
	line	106
	global	__size_of_vPutSampleDataIntoTable
	__size_of_vPutSampleDataIntoTable	equ	__end_of_vPutSampleDataIntoTable-_vPutSampleDataIntoTable
	
_vPutSampleDataIntoTable:	
	opt	stack 4
; Regs used in _vPutSampleDataIntoTable: [wreg-fsr0h+status,2+status,0+btemp+1]
	line	114
	
i1l3448:	
;common.c: 108: static unsigned char ucChannelFirstLength = 0;
;common.c: 110: static unsigned char ucChannelFourthLength = 0;
;common.c: 112: static unsigned char ucChannelFourteenthLength = 0;
;common.c: 114: if(channel == 12)
	movf	(vPutSampleDataIntoTable@channel),w
	xorlw	0Ch
	skipz
	goto	u101_21
	goto	u101_20
u101_21:
	goto	i1l3460
u101_20:
	line	116
	
i1l3450:	
;common.c: 115: {
;common.c: 116: if(ucChannelFirstLength < 12)
	movlw	(0Ch)
	subwf	(vPutSampleDataIntoTable@ucChannelFirstLength),w
	skipnc
	goto	u102_21
	goto	u102_20
u102_21:
	goto	i1l3456
u102_20:
	line	118
	
i1l3452:	
;common.c: 117: {
;common.c: 118: uiSampleChannelFirst[ucChannelFirstLength] = uiSampleData;
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
	line	120
	
i1l3454:	
;common.c: 120: ucChannelFirstLength++;
	incf	(vPutSampleDataIntoTable@ucChannelFirstLength),f
	line	121
;common.c: 121: }
	goto	i1l1529
	line	124
	
i1l3456:	
;common.c: 122: else
;common.c: 123: {
;common.c: 124: ucChannelFirstLength = 0;
	clrf	(vPutSampleDataIntoTable@ucChannelFirstLength)
	line	126
	
i1l3458:	
;common.c: 126: uiSampleChannelFirst[ucChannelFirstLength] = uiSampleData;
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
	goto	i1l1529
	line	129
	
i1l3460:	
;common.c: 129: else if(channel == 13)
	movf	(vPutSampleDataIntoTable@channel),w
	xorlw	0Dh
	skipz
	goto	u103_21
	goto	u103_20
u103_21:
	goto	i1l3472
u103_20:
	line	131
	
i1l3462:	
;common.c: 130: {
;common.c: 131: if(ucChannelFourthLength < 12)
	movlw	(0Ch)
	bcf	status, 5	;RP0=0, select bank0
	subwf	(vPutSampleDataIntoTable@ucChannelFourthLength),w
	skipnc
	goto	u104_21
	goto	u104_20
u104_21:
	goto	i1l3468
u104_20:
	line	133
	
i1l3464:	
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
	
i1l3466:	
;common.c: 135: ucChannelFourthLength++;
	incf	(vPutSampleDataIntoTable@ucChannelFourthLength),f
	line	136
;common.c: 136: }
	goto	i1l1529
	line	139
	
i1l3468:	
;common.c: 137: else
;common.c: 138: {
;common.c: 139: ucChannelFourthLength = 0;
	clrf	(vPutSampleDataIntoTable@ucChannelFourthLength)
	line	141
	
i1l3470:	
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
	goto	i1l1529
	line	144
	
i1l3472:	
;common.c: 144: else if(channel == 14)
	movf	(vPutSampleDataIntoTable@channel),w
	xorlw	0Eh
	skipz
	goto	u105_21
	goto	u105_20
u105_21:
	goto	i1l3484
u105_20:
	line	146
	
i1l3474:	
;common.c: 145: {
;common.c: 146: if(ucChannelFourteenthLength < 12)
	movlw	(0Ch)
	bcf	status, 5	;RP0=0, select bank0
	subwf	(vPutSampleDataIntoTable@ucChannelFourteenthLength),w
	skipnc
	goto	u106_21
	goto	u106_20
u106_21:
	goto	i1l3480
u106_20:
	line	148
	
i1l3476:	
;common.c: 147: {
;common.c: 148: uiSampleChannelFourteenth[ucChannelFourteenthLength] = uiSampleData;
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
	line	150
	
i1l3478:	
;common.c: 150: ucChannelFourteenthLength++;
	incf	(vPutSampleDataIntoTable@ucChannelFourteenthLength),f
	line	151
;common.c: 151: }
	goto	i1l1529
	line	154
	
i1l3480:	
;common.c: 152: else
;common.c: 153: {
;common.c: 154: ucChannelFourteenthLength = 0;
	clrf	(vPutSampleDataIntoTable@ucChannelFourteenthLength)
	line	156
	
i1l3482:	
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
	goto	i1l1529
	line	161
	
i1l3484:	
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
;common.c: 167: for(int i = 0;i < 12; i++)
	clrf	(vPutSampleDataIntoTable@i)
	clrf	(vPutSampleDataIntoTable@i+1)
	line	169
	
i1l3490:	
;common.c: 168: {
;common.c: 169: uiSampleChannelFirst[i] = 0;
	clrc
	rlf	(vPutSampleDataIntoTable@i),w
	addlw	_uiSampleChannelFirst&0ffh
	movwf	fsr0
	bcf	status, 7	;select IRP bank1
	clrf	indf
	incf	fsr0,f
	clrf	indf
	line	171
;common.c: 171: uiSampleChannelFourth[i] = 0;
	clrc
	rlf	(vPutSampleDataIntoTable@i),w
	addlw	_uiSampleChannelFourth&0ffh
	movwf	fsr0
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
	
i1l3492:	
	incf	(vPutSampleDataIntoTable@i),f
	skipnz
	incf	(vPutSampleDataIntoTable@i+1),f
	
i1l3494:	
	movf	(vPutSampleDataIntoTable@i+1),w
	xorlw	80h
	movwf	btemp+1
	movlw	(high(0Ch))^80h
	subwf	btemp+1,w
	skipz
	goto	u107_25
	movlw	low(0Ch)
	subwf	(vPutSampleDataIntoTable@i),w
u107_25:

	skipc
	goto	u107_21
	goto	u107_20
u107_21:
	goto	i1l3490
u107_20:
	line	177
	
i1l1529:	
	return
	opt stack 0
GLOBAL	__end_of_vPutSampleDataIntoTable
	__end_of_vPutSampleDataIntoTable:
;; =============== function _vPutSampleDataIntoTable ends ============

	signat	_vPutSampleDataIntoTable,8312
psect	text828,local,class=CODE,delta=2
global __ptext828
__ptext828:
	global	btemp
	btemp set 07Eh

	DABS	1,126,2	;btemp
	global	wtemp0
	wtemp0 set btemp
	end
