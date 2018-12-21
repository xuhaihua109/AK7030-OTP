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
# 70 "C:\sw_dev\AK7030-OTP\main.c"
	psect config,class=CONFIG,delta=2 ;#
# 70 "C:\sw_dev\AK7030-OTP\main.c"
	dw 0x2FFF & 0x3FFF & 0x3FFF & 0x3FFF & 0x3FFF & 0x3FFF ;#
# 71 "C:\sw_dev\AK7030-OTP\main.c"
	psect config,class=CONFIG,delta=2 ;#
# 71 "C:\sw_dev\AK7030-OTP\main.c"
	dw 0x3FFF & 0x3FDF & 0x3FFF & 0x3FFE ;#
# 72 "C:\sw_dev\AK7030-OTP\main.c"
	psect config,class=CONFIG,delta=2 ;#
# 72 "C:\sw_dev\AK7030-OTP\main.c"
	dw 0X3FFF & 0x3FFF & 0x3FFF & 0x3FF8 ;#
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
	FNCALL	_main,_clearBigTimer
	FNCALL	_main,_clearSmallTimer
	FNCALL	_main,_getAdOriginalCh13Value
	FNCALL	_main,_setDAC0_ChannelValue
	FNCALL	_main,_startBigTimer
	FNCALL	_main,_startSmallTimer
	FNCALL	_main,_isFinishedBigTimer
	FNCALL	_main,_isFinishedSmallTimer
	FNCALL	_process_AD_Converter_Value,_getAD_ConvertFlag
	FNCALL	_process_AD_Converter_Value,_setAD_ConvertFlag
	FNCALL	_process_AD_Converter_Value,_AD_Sample
	FNCALL	_process_AD_Converter_Value,_adc_start
	FNCALL	_AD_Sample,_getAdOriginalValue
	FNROOT	_main
	FNCALL	_ISR,i1_setAD_ConvertFlag
	FNCALL	_ISR,_adc_get
	FNCALL	intlevel1,_ISR
	global	intlevel1
	FNROOT	intlevel1
	global	_sampleChannelSelect
psect	idataBANK0,class=CODE,space=0,delta=2
global __pidataBANK0
__pidataBANK0:
	file	"C:\sw_dev\AK7030-OTP\common.c"
	line	18

;initializer for _sampleChannelSelect
	retlw	0Dh
	global	_buffer_Sample_AD_Value
	global	_adc_original_CH13_value
	global	_adc_original_value
	global	_multiFilterMaxValue
	global	_multiFilterMinValue
	global	_uiSmallTimer
	global	_sampleTimes
	global	main@ampStep
	global	main@tDA_timer
	global	main@ucBigTimerActionFlag
	global	main@ucCheckBatteryCnt
	global	main@ucConfirmTimer1S
	global	main@ucConfirmTimerZptS
	global	main@ucInit
	global	main@ucInstalledBatteryCnt
	global	main@ucWaitTime1S
	global	_uiBigTimer
	global	ISR@ucTimer1sCnt
	global	_adc_convert_flag
	global	_timer
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
	global	_PB2
_PB2	set	50
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
	file	"ProjTest.as"
	line	#
psect cinit,class=CODE,delta=2
global start_initialization
start_initialization:

psect	bssCOMMON,class=COMMON,space=1
global __pbssCOMMON
__pbssCOMMON:
_uiBigTimer:
       ds      2

ISR@ucTimer1sCnt:
       ds      1

_adc_convert_flag:
       ds      1

_timer:
       ds      1

psect	bssBANK0,class=BANK0,space=1
global __pbssBANK0
__pbssBANK0:
_buffer_Sample_AD_Value:
       ds      12

_adc_original_CH13_value:
       ds      2

_adc_original_value:
       ds      2

_multiFilterMaxValue:
       ds      2

_multiFilterMinValue:
       ds      2

_uiSmallTimer:
       ds      2

_sampleTimes:
       ds      1

main@ampStep:
       ds      1

main@tDA_timer:
       ds      1

main@ucBigTimerActionFlag:
       ds      1

main@ucCheckBatteryCnt:
       ds      1

main@ucConfirmTimer1S:
       ds      1

main@ucConfirmTimerZptS:
       ds      1

main@ucInit:
       ds      1

main@ucInstalledBatteryCnt:
       ds      1

main@ucWaitTime1S:
       ds      1

psect	dataBANK0,class=BANK0,space=1
global __pdataBANK0
__pdataBANK0:
	file	"C:\sw_dev\AK7030-OTP\common.c"
_sampleChannelSelect:
       ds      1

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
	clrf	((__pbssCOMMON)+3)&07Fh
	clrf	((__pbssCOMMON)+4)&07Fh
; Clear objects allocated to BANK0
psect cinit,class=CODE,delta=2
	bcf	status, 7	;select IRP bank0
	movlw	low(__pbssBANK0)
	movwf	fsr
	movlw	low((__pbssBANK0)+020h)
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
	global	?_clearBigTimer
?_clearBigTimer:	; 0 bytes @ 0x0
	global	?_clearSmallTimer
?_clearSmallTimer:	; 0 bytes @ 0x0
	global	?_setDAC0_ChannelValue
?_setDAC0_ChannelValue:	; 0 bytes @ 0x0
	global	?_startBigTimer
?_startBigTimer:	; 0 bytes @ 0x0
	global	?_startSmallTimer
?_startSmallTimer:	; 0 bytes @ 0x0
	global	?_AD_Sample
?_AD_Sample:	; 0 bytes @ 0x0
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
	global	?_isFinishedBigTimer
?_isFinishedBigTimer:	; 1 bytes @ 0x0
	global	?_isFinishedSmallTimer
?_isFinishedSmallTimer:	; 1 bytes @ 0x0
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
	global	??_ISR
??_ISR:	; 0 bytes @ 0x4
	ds	2
psect	cstackBANK0,class=BANK0,space=1
global __pcstackBANK0
__pcstackBANK0:
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
	global	??_clearBigTimer
??_clearBigTimer:	; 0 bytes @ 0x0
	global	??_clearSmallTimer
??_clearSmallTimer:	; 0 bytes @ 0x0
	global	??_setDAC0_ChannelValue
??_setDAC0_ChannelValue:	; 0 bytes @ 0x0
	global	??_startBigTimer
??_startBigTimer:	; 0 bytes @ 0x0
	global	??_startSmallTimer
??_startSmallTimer:	; 0 bytes @ 0x0
	global	??_isFinishedBigTimer
??_isFinishedBigTimer:	; 0 bytes @ 0x0
	global	??_isFinishedSmallTimer
??_isFinishedSmallTimer:	; 0 bytes @ 0x0
	global	??_getAD_ConvertFlag
??_getAD_ConvertFlag:	; 0 bytes @ 0x0
	global	??_setAD_ConvertFlag
??_setAD_ConvertFlag:	; 0 bytes @ 0x0
	global	?_getAdOriginalCh13Value
?_getAdOriginalCh13Value:	; 2 bytes @ 0x0
	global	?_getAdOriginalValue
?_getAdOriginalValue:	; 2 bytes @ 0x0
	global	setAD_ConvertFlag@flag
setAD_ConvertFlag@flag:	; 1 bytes @ 0x0
	global	setDAC0_ChannelValue@ucValue
setDAC0_ChannelValue@ucValue:	; 1 bytes @ 0x0
	global	adc_test_init@ref
adc_test_init@ref:	; 1 bytes @ 0x0
	ds	1
	global	??_adc_test_init
??_adc_test_init:	; 0 bytes @ 0x1
	ds	1
	global	??_getAdOriginalCh13Value
??_getAdOriginalCh13Value:	; 0 bytes @ 0x2
	global	??_AD_Sample
??_AD_Sample:	; 0 bytes @ 0x2
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
	global	??_main
??_main:	; 0 bytes @ 0x5
;;Data sizes: Strings 0, constant 0, data 1, bss 37, persistent 0 stack 0
;;Auto spaces:   Size  Autos    Used
;; COMMON          14      6      11
;; BANK0           80      5      38
;; BANK1           80      0       0
;; BANK3           96      0       0
;; BANK2           96      0       0

;;
;; Pointer list with targets:

;; ?_adc_get	unsigned int  size(1) Largest target is 0
;;
;; ?_getAdOriginalCh13Value	unsigned int  size(1) Largest target is 0
;;
;; ?_getAdOriginalValue	unsigned int  size(1) Largest target is 0
;;


;;
;; Critical Paths under _main in COMMON
;;
;;   None.
;;
;; Critical Paths under _ISR in COMMON
;;
;;   _ISR->_adc_get
;;
;; Critical Paths under _main in BANK0
;;
;;   _process_AD_Converter_Value->_AD_Sample
;;   _AD_Sample->_getAdOriginalValue
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
;; (0) _main                                                 0     0      0     156
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
;;                      _clearBigTimer
;;                    _clearSmallTimer
;;             _getAdOriginalCh13Value
;;               _setDAC0_ChannelValue
;;                      _startBigTimer
;;                    _startSmallTimer
;;                 _isFinishedBigTimer
;;               _isFinishedSmallTimer
;; ---------------------------------------------------------------------------------
;; (1) _process_AD_Converter_Value                           0     0      0      90
;;                  _getAD_ConvertFlag
;;                  _setAD_ConvertFlag
;;                          _AD_Sample
;;                          _adc_start
;; ---------------------------------------------------------------------------------
;; (2) _AD_Sample                                            3     3      0      68
;;                                              2 BANK0      3     3      0
;;                 _getAdOriginalValue
;; ---------------------------------------------------------------------------------
;; (3) _getAdOriginalValue                                   2     0      2       0
;;                                              0 BANK0      2     0      2
;; ---------------------------------------------------------------------------------
;; (2) _setAD_ConvertFlag                                    1     1      0      22
;;                                              0 BANK0      1     1      0
;; ---------------------------------------------------------------------------------
;; (2) _getAD_ConvertFlag                                    0     0      0       0
;; ---------------------------------------------------------------------------------
;; (1) _isFinishedSmallTimer                                 0     0      0       0
;; ---------------------------------------------------------------------------------
;; (1) _isFinishedBigTimer                                   0     0      0       0
;; ---------------------------------------------------------------------------------
;; (1) _startSmallTimer                                      0     0      0       0
;; ---------------------------------------------------------------------------------
;; (1) _startBigTimer                                        0     0      0       0
;; ---------------------------------------------------------------------------------
;; (1) _setDAC0_ChannelValue                                 1     1      0      22
;;                                              0 BANK0      1     1      0
;; ---------------------------------------------------------------------------------
;; (1) _getAdOriginalCh13Value                               2     0      2       0
;;                                              0 BANK0      2     0      2
;; ---------------------------------------------------------------------------------
;; (1) _clearSmallTimer                                      0     0      0       0
;; ---------------------------------------------------------------------------------
;; (1) _clearBigTimer                                        0     0      0       0
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
;; (1) _adc_test_init                                        3     2      1      44
;;                                              0 BANK0      3     2      1
;; ---------------------------------------------------------------------------------
;; (1) _timer1_interrupt_config                              0     0      0       0
;; ---------------------------------------------------------------------------------
;; (1) _timer1_config                                        0     0      0       0
;; ---------------------------------------------------------------------------------
;; (1) _clock_config                                         0     0      0       0
;; ---------------------------------------------------------------------------------
;; Estimated maximum stack depth 3
;; ---------------------------------------------------------------------------------
;; (Depth) Function   	        Calls       Base Space   Used Autos Params    Refs
;; ---------------------------------------------------------------------------------
;; (4) _ISR                                                  2     2      0      97
;;                                              4 COMMON     2     2      0
;;                i1_setAD_ConvertFlag
;;                            _adc_get
;; ---------------------------------------------------------------------------------
;; (5) i1_setAD_ConvertFlag                                  1     1      0      73
;;                                              0 COMMON     1     1      0
;; ---------------------------------------------------------------------------------
;; (5) _adc_get                                              4     2      2      24
;;                                              0 COMMON     4     2      2
;; ---------------------------------------------------------------------------------
;; Estimated maximum stack depth 5
;; ---------------------------------------------------------------------------------

;; Call Graph Graphs:

;; _main (ROOT)
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
;;     _adc_start
;;   _clearBigTimer
;;   _clearSmallTimer
;;   _getAdOriginalCh13Value
;;   _setDAC0_ChannelValue
;;   _startBigTimer
;;   _startSmallTimer
;;   _isFinishedBigTimer
;;   _isFinishedSmallTimer
;;
;; _ISR (ROOT)
;;   i1_setAD_ConvertFlag
;;   _adc_get
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
;;BANK1               50      0       0       8        0.0%
;;BITBANK1            50      0       0       7        0.0%
;;CODE                 0      0       0       0        0.0%
;;DATA                 0      0      38       6        0.0%
;;ABS                  0      0      31       3        0.0%
;;NULL                 0      0       0       0        0.0%
;;STACK                0      0       7       2        0.0%
;;BANK0               50      5      26       5       47.5%
;;BITBANK0            50      0       0       4        0.0%
;;SFR0                 0      0       0       1        0.0%
;;BITSFR0              0      0       0       1        0.0%
;;COMMON               E      6       B       1       78.6%
;;BITCOMMON            E      0       0       0        0.0%

	global	_main
psect	maintext,global,class=CODE,delta=2
global __pmaintext
__pmaintext:

;; *************** function _main *****************
;; Defined at:
;;		line 84 in file "C:\sw_dev\AK7030-OTP\main.c"
;; Parameters:    Size  Location     Type
;;		None
;; Auto vars:     Size  Location     Type
;;		None
;; Return value:  Size  Location     Type
;;		None               void
;; Registers used:
;;		wreg, fsr0l, fsr0h, status,2, status,0, pclath, cstack
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
;;		_clearBigTimer
;;		_clearSmallTimer
;;		_getAdOriginalCh13Value
;;		_setDAC0_ChannelValue
;;		_startBigTimer
;;		_startSmallTimer
;;		_isFinishedBigTimer
;;		_isFinishedSmallTimer
;; This function is called by:
;;		Startup code after reset
;; This function uses a non-reentrant model
;;
psect	maintext
	file	"C:\sw_dev\AK7030-OTP\main.c"
	line	84
	global	__size_of_main
	__size_of_main	equ	__end_of_main-_main
	
_main:	
	opt	stack 3
; Regs used in _main: [wreg-fsr0h+status,2+status,0+pclath+cstack]
	line	111
	
l3112:	
;main.c: 85: enum step
;main.c: 86: {
;main.c: 87: SENSE_PB2_INPUT_VOLTAGE = 0,
;main.c: 88: SENSE_PB2_DURATION_ONE_SECOND,
;main.c: 89: SENSE_PB2_INPUT_VOLTAGE__AGAIN,
;main.c: 90: SENSE_PB2_DURATION__SECOND,
;main.c: 91: SET_PA2_VALUE,
;main.c: 92: PROCESS_AD_VALUE,
;main.c: 93: WAIT_SET_TIME_FINISHED,
;main.c: 94: SET_TIME_BE_FINISHED,
;main.c: 95: CHECKING_PULL_OUT_BATTERY,
;main.c: 96: CHECKING_INSTALLED_BATTERY,
;main.c: 97: };
;main.c: 99: enum workTimerType
;main.c: 100: {
;main.c: 101: BIG_TIMER_WORK = 0,
	bsf	status, 5	;RP0=1, select bank1
	bcf	(1064/8)^080h,(1064)&7
	line	112
;main.c: 112: TRISA1 = 0;
	bcf	(1065/8)^080h,(1065)&7
	line	113
;main.c: 113: TRISA3 = 0;
	bcf	(1067/8)^080h,(1067)&7
	line	114
;main.c: 114: TRISA2 = 0;
	bcf	(1066/8)^080h,(1066)&7
	line	115
;main.c: 115: PA2 = 1;
	bcf	status, 5	;RP0=0, select bank0
	bsf	(42/8),(42)&7
	line	116
;main.c: 116: PA0 = 1;
	bsf	(40/8),(40)&7
	line	118
;main.c: 118: TRISB2 = 1;
	bsf	status, 5	;RP0=1, select bank1
	bsf	(1074/8)^080h,(1074)&7
	line	120
;main.c: 120: TRISB1 = 1;
	bsf	(1073/8)^080h,(1073)&7
	line	121
;main.c: 121: TRISB0 = 1;
	bsf	(1072/8)^080h,(1072)&7
	line	123
	
l3114:	
;main.c: 123: clock_config();
	fcall	_clock_config
	line	124
;main.c: 124: timer1_config();
	fcall	_timer1_config
	line	125
	
l3116:	
;main.c: 125: timer1_interrupt_config();
	fcall	_timer1_interrupt_config
	line	127
	
l3118:	
;main.c: 127: adc_test_init(13,3);
	movlw	(03h)
	bcf	status, 5	;RP0=0, select bank0
	movwf	(?_adc_test_init)
	movlw	(0Dh)
	fcall	_adc_test_init
	line	129
	
l3120:	
;main.c: 129: dac_init();
	fcall	_dac_init
	line	130
	
l3122:	
;main.c: 130: op1_init();
	fcall	_op1_init
	line	131
	
l3124:	
;main.c: 131: op2_init();
	fcall	_op2_init
	line	134
	
l3126:	
;main.c: 134: adc_start();
	fcall	_adc_start
	line	141
	
l3128:	
# 141 "C:\sw_dev\AK7030-OTP\main.c"
 clrwdt ;#
psect	maintext
	line	142
	
l3130:	
;main.c: 142: if(isPermitSampleTime())
	fcall	_isPermitSampleTime
	xorlw	0
	skipnz
	goto	u611
	goto	u610
u611:
	goto	l3128
u610:
	line	144
	
l3132:	
;main.c: 143: {
;main.c: 144: clrSampeTime();
	fcall	_clrSampeTime
	line	145
	
l3134:	
;main.c: 145: process_AD_Converter_Value();
	fcall	_process_AD_Converter_Value
	line	147
;main.c: 147: switch(ampStep)
	goto	l3272
	line	151
	
l3136:	
;main.c: 150: {
;main.c: 151: ucBigTimerActionFlag = 0;
	clrf	(main@ucBigTimerActionFlag)
	line	152
	
l3138:	
;main.c: 152: clearBigTimer();
	fcall	_clearBigTimer
	line	153
	
l3140:	
;main.c: 153: clearSmallTimer();
	fcall	_clearSmallTimer
	line	154
	
l3142:	
;main.c: 154: if(!PB2)
	btfsc	(50/8),(50)&7
	goto	u621
	goto	u620
u621:
	goto	l3128
u620:
	line	155
	
l3144:	
;main.c: 155: ampStep++;
	bcf	status, 5	;RP0=0, select bank0
	incf	(main@ampStep),f
	goto	l3128
	line	159
;main.c: 157: }
;main.c: 159: case SENSE_PB2_DURATION_ONE_SECOND:
	
l679:	
	line	162
;main.c: 160: {
;main.c: 161: static unsigned char ucConfirmTimer1S = 0;
;main.c: 162: if(!PB2)
	btfsc	(50/8),(50)&7
	goto	u631
	goto	u630
u631:
	goto	l3148
u630:
	line	164
	
l3146:	
;main.c: 163: {
;main.c: 164: ucConfirmTimer1S++;
	incf	(main@ucConfirmTimer1S),f
	line	165
;main.c: 165: }
	goto	l3150
	line	168
	
l3148:	
;main.c: 166: else
;main.c: 167: {
;main.c: 168: ucConfirmTimer1S = 0;
	clrf	(main@ucConfirmTimer1S)
	line	171
	
l3150:	
;main.c: 169: }
;main.c: 171: if(ucConfirmTimer1S >= 10)
	movlw	(0Ah)
	subwf	(main@ucConfirmTimer1S),w
	skipc
	goto	u641
	goto	u640
u641:
	goto	l674
u640:
	line	173
	
l3152:	
;main.c: 172: {
;main.c: 173: ucConfirmTimer1S = 0;
	clrf	(main@ucConfirmTimer1S)
	goto	l3144
	line	180
;main.c: 178: }
;main.c: 180: case SENSE_PB2_INPUT_VOLTAGE__AGAIN:
	
l685:	
	line	182
;main.c: 181: {
;main.c: 182: if(!PB2)
	btfsc	(50/8),(50)&7
	goto	u651
	goto	u650
u651:
	goto	l674
u650:
	goto	l3144
	line	187
;main.c: 185: }
;main.c: 187: case SENSE_PB2_DURATION__SECOND:
	
l687:	
	line	190
;main.c: 188: {
;main.c: 189: static unsigned char ucConfirmTimerZptS = 0;
;main.c: 190: if(!PB2)
	btfsc	(50/8),(50)&7
	goto	u661
	goto	u660
u661:
	goto	l3160
u660:
	line	192
	
l3158:	
;main.c: 191: {
;main.c: 192: ucConfirmTimerZptS++;
	incf	(main@ucConfirmTimerZptS),f
	line	193
;main.c: 193: }
	goto	l3162
	line	196
	
l3160:	
;main.c: 194: else
;main.c: 195: {
;main.c: 196: ucConfirmTimerZptS = 0;
	clrf	(main@ucConfirmTimerZptS)
	line	199
	
l3162:	
;main.c: 197: }
;main.c: 199: if(ucConfirmTimerZptS >= 3)
	movlw	(03h)
	subwf	(main@ucConfirmTimerZptS),w
	skipc
	goto	u671
	goto	u670
u671:
	goto	l674
u670:
	line	201
	
l3164:	
;main.c: 200: {
;main.c: 201: ucConfirmTimerZptS = 0;
	clrf	(main@ucConfirmTimerZptS)
	goto	l3144
	line	208
;main.c: 206: }
;main.c: 208: case SET_PA2_VALUE:
	
l693:	
	line	210
;main.c: 209: {
;main.c: 210: PA2 = 0;
	bcf	(42/8),(42)&7
	goto	l3144
	line	218
	
l3170:	
;main.c: 216: {
;main.c: 217: static unsigned char ucInit = 0;
;main.c: 218: if(getAdOriginalCh13Value() > 40)
	fcall	_getAdOriginalCh13Value
	movlw	high(029h)
	subwf	(1+(?_getAdOriginalCh13Value)),w
	movlw	low(029h)
	skipnz
	subwf	(0+(?_getAdOriginalCh13Value)),w
	skipc
	goto	u681
	goto	u680
u681:
	goto	l3184
u680:
	line	220
	
l3172:	
;main.c: 219: {
;main.c: 220: ucInit = 1;
	clrf	(main@ucInit)
	incf	(main@ucInit),f
	line	221
;main.c: 221: PA0 = 0;
	bcf	(40/8),(40)&7
	line	222
;main.c: 222: PA1 = 1;
	bsf	(41/8),(41)&7
	line	224
	
l3174:	
;main.c: 224: tDA_timer = BIG_TIMER_WORK;
	clrf	(main@tDA_timer)
	line	225
	
l3176:	
;main.c: 225: setDAC0_ChannelValue(27);
	movlw	(01Bh)
	fcall	_setDAC0_ChannelValue
	line	226
	
l3178:	
;main.c: 226: if(!ucBigTimerActionFlag)
	bcf	status, 5	;RP0=0, select bank0
	movf	(main@ucBigTimerActionFlag),f
	skipz
	goto	u691
	goto	u690
u691:
	goto	l3204
u690:
	line	228
	
l3180:	
;main.c: 227: {
;main.c: 228: startBigTimer();
	fcall	_startBigTimer
	line	229
	
l3182:	
;main.c: 229: ucBigTimerActionFlag = 1;
	clrf	(main@ucBigTimerActionFlag)
	incf	(main@ucBigTimerActionFlag),f
	goto	l3204
	line	232
	
l3184:	
;main.c: 232: else if(getAdOriginalCh13Value() <35)
	fcall	_getAdOriginalCh13Value
	movlw	high(023h)
	subwf	(1+(?_getAdOriginalCh13Value)),w
	movlw	low(023h)
	skipnz
	subwf	(0+(?_getAdOriginalCh13Value)),w
	skipnc
	goto	u701
	goto	u700
u701:
	goto	l3190
u700:
	line	234
	
l3186:	
;main.c: 233: {
;main.c: 234: ucInit = 1;
	clrf	(main@ucInit)
	incf	(main@ucInit),f
	line	235
;main.c: 235: PA0 = 1;
	bsf	(40/8),(40)&7
	line	236
;main.c: 236: PA1 = 0;
	bcf	(41/8),(41)&7
	line	237
;main.c: 237: PA3 = 0;
	bcf	(43/8),(43)&7
	line	238
;main.c: 238: tDA_timer = SMALL_TIMER_WORK;
	clrf	(main@tDA_timer)
	incf	(main@tDA_timer),f
	line	239
	
l3188:	
;main.c: 239: setDAC0_ChannelValue(25);
	movlw	(019h)
	fcall	_setDAC0_ChannelValue
	line	240
;main.c: 240: startSmallTimer();
	fcall	_startSmallTimer
	line	241
;main.c: 241: }
	goto	l3204
	line	244
	
l3190:	
;main.c: 242: else
;main.c: 243: {
;main.c: 244: if(!ucInit)
	movf	(main@ucInit),f
	skipz
	goto	u711
	goto	u710
u711:
	goto	l3204
u710:
	line	246
	
l3192:	
;main.c: 245: {
;main.c: 246: ucInit = 1;
	clrf	(main@ucInit)
	incf	(main@ucInit),f
	line	247
;main.c: 247: PA0 = 0;
	bcf	(40/8),(40)&7
	line	248
;main.c: 248: PA1 = 1;
	bsf	(41/8),(41)&7
	line	250
	
l3194:	
;main.c: 250: tDA_timer = BIG_TIMER_WORK;
	clrf	(main@tDA_timer)
	line	251
	
l3196:	
;main.c: 251: setDAC0_ChannelValue(27);
	movlw	(01Bh)
	fcall	_setDAC0_ChannelValue
	line	252
	
l3198:	
;main.c: 252: if(!ucBigTimerActionFlag)
	bcf	status, 5	;RP0=0, select bank0
	movf	(main@ucBigTimerActionFlag),f
	skipz
	goto	u721
	goto	u720
u721:
	goto	l3204
u720:
	goto	l3180
	line	260
	
l3204:	
;main.c: 256: }
;main.c: 257: }
;main.c: 258: }
;main.c: 260: if(BIG_TIMER_WORK == tDA_timer)
	movf	(main@tDA_timer),f
	skipz
	goto	u731
	goto	u730
u731:
	goto	l704
u730:
	line	262
	
l3206:	
;main.c: 261: {
;main.c: 262: if(!PA3)
	btfsc	(43/8),(43)&7
	goto	u741
	goto	u740
u741:
	goto	l3144
u740:
	line	264
	
l3208:	
;main.c: 263: {
;main.c: 264: ucWaitTime1S++;
	incf	(main@ucWaitTime1S),f
	line	265
	
l3210:	
;main.c: 265: if(ucWaitTime1S >= 5)
	movlw	(05h)
	subwf	(main@ucWaitTime1S),w
	skipc
	goto	u751
	goto	u750
u751:
	goto	l3144
u750:
	line	267
	
l3212:	
;main.c: 266: {
;main.c: 267: PA3 = 1;
	bsf	(43/8),(43)&7
	line	268
	
l3214:	
;main.c: 268: ucWaitTime1S = 0;
	clrf	(main@ucWaitTime1S)
	goto	l3144
	line	272
	
l704:	
	line	274
;main.c: 272: else
;main.c: 273: {
;main.c: 274: PA3 = 0;
	bcf	(43/8),(43)&7
	goto	l3214
	line	288
	
l3220:	
;main.c: 287: {
;main.c: 288: if(!isFinishedBigTimer())
	fcall	_isFinishedBigTimer
	iorlw	0
	skipz
	goto	u761
	goto	u760
u761:
	goto	l3144
u760:
	line	290
	
l3222:	
;main.c: 289: {
;main.c: 290: ampStep = PROCESS_AD_VALUE;
	movlw	(05h)
	movwf	(main@ampStep)
	line	291
;main.c: 291: }
	goto	l3128
	line	301
	
l3226:	
;main.c: 300: {
;main.c: 301: if((ucBigTimerActionFlag == 1) && isFinishedBigTimer())
	decf	(main@ucBigTimerActionFlag),w
	skipz
	goto	u771
	goto	u770
u771:
	goto	l3232
u770:
	
l3228:	
	fcall	_isFinishedBigTimer
	xorlw	0
	skipnz
	goto	u781
	goto	u780
u781:
	goto	l3232
u780:
	goto	l3144
	line	305
	
l3232:	
;main.c: 305: else if(!isFinishedSmallTimer())
	fcall	_isFinishedSmallTimer
	iorlw	0
	skipz
	goto	u791
	goto	u790
u791:
	goto	l3144
u790:
	line	307
	
l3234:	
;main.c: 306: {
;main.c: 307: if(getAdOriginalCh13Value() > 40)
	fcall	_getAdOriginalCh13Value
	movlw	high(029h)
	subwf	(1+(?_getAdOriginalCh13Value)),w
	movlw	low(029h)
	skipnz
	subwf	(0+(?_getAdOriginalCh13Value)),w
	skipc
	goto	u801
	goto	u800
u801:
	goto	l674
u800:
	line	309
	
l3236:	
;main.c: 308: {
;main.c: 309: ucWaitTime1S = 0;
	clrf	(main@ucWaitTime1S)
	goto	l3222
	line	284
	
l3244:	
	movf	(main@tDA_timer),w
	; Switch size 1, requested type "space"
; Number of cases is 2, Range of values is 0 to 1
; switch strategies available:
; Name         Instructions Cycles
; simple_byte            7     4 (average)
; direct_byte           11     7 (fixed)
; jumptable            260     6 (fixed)
; rangetable             6     6 (fixed)
; spacedrange           10     9 (fixed)
; locatedrange           2     3 (fixed)
;	Chosen strategy is simple_byte

	opt asmopt_off
	xorlw	0^0	; case 0
	skipnz
	goto	l3220
	xorlw	1^0	; case 1
	skipnz
	goto	l3226
	goto	l674
	opt asmopt_on

	line	327
;main.c: 325: }
;main.c: 327: case SET_TIME_BE_FINISHED:
	
l721:	
	line	329
;main.c: 328: {
;main.c: 329: PA2 = 1;
	bsf	(42/8),(42)&7
	line	330
;main.c: 330: PA0 = 0;
	bcf	(40/8),(40)&7
	line	331
;main.c: 331: PA1 = 0;
	bcf	(41/8),(41)&7
	line	332
;main.c: 332: PA3 = 0;
	bcf	(43/8),(43)&7
	line	333
	
l3246:	
;main.c: 333: ucWaitTime1S = 0;
	clrf	(main@ucWaitTime1S)
	line	334
	
l3248:	
;main.c: 334: setDAC0_ChannelValue(25);
	movlw	(019h)
	fcall	_setDAC0_ChannelValue
	goto	l3144
	line	339
;main.c: 337: }
;main.c: 339: case CHECKING_PULL_OUT_BATTERY:
	
l722:	
	line	342
;main.c: 340: {
;main.c: 341: static unsigned char ucCheckBatteryCnt = 0;
;main.c: 342: if(PB2)
	btfss	(50/8),(50)&7
	goto	u811
	goto	u810
u811:
	goto	l3254
u810:
	line	343
	
l3252:	
;main.c: 343: ucCheckBatteryCnt++;
	incf	(main@ucCheckBatteryCnt),f
	goto	l3256
	line	345
	
l3254:	
;main.c: 344: else
;main.c: 345: ucCheckBatteryCnt = 0;
	clrf	(main@ucCheckBatteryCnt)
	line	347
	
l3256:	
;main.c: 347: if(ucCheckBatteryCnt > 2)
	movlw	(03h)
	subwf	(main@ucCheckBatteryCnt),w
	skipc
	goto	u821
	goto	u820
u821:
	goto	l674
u820:
	line	349
	
l3258:	
;main.c: 348: {
;main.c: 349: ucCheckBatteryCnt = 0;
	clrf	(main@ucCheckBatteryCnt)
	goto	l3144
	line	355
;main.c: 353: }
;main.c: 355: case CHECKING_INSTALLED_BATTERY:
	
l728:	
	line	358
;main.c: 356: {
;main.c: 357: static unsigned char ucInstalledBatteryCnt = 0;
;main.c: 358: if(!PB2)
	btfsc	(50/8),(50)&7
	goto	u831
	goto	u830
u831:
	goto	l3264
u830:
	line	359
	
l3262:	
;main.c: 359: ucInstalledBatteryCnt++;
	incf	(main@ucInstalledBatteryCnt),f
	goto	l3266
	line	361
	
l3264:	
;main.c: 360: else
;main.c: 361: ucInstalledBatteryCnt = 0;
	clrf	(main@ucInstalledBatteryCnt)
	line	363
	
l3266:	
;main.c: 363: if(ucInstalledBatteryCnt > 10)
	movlw	(0Bh)
	subwf	(main@ucInstalledBatteryCnt),w
	skipc
	goto	u841
	goto	u840
u841:
	goto	l674
u840:
	line	365
	
l3268:	
;main.c: 364: {
;main.c: 365: ucInstalledBatteryCnt = 0;
	clrf	(main@ucInstalledBatteryCnt)
	line	366
;main.c: 366: ampStep = SENSE_PB2_INPUT_VOLTAGE;
	clrf	(main@ampStep)
	goto	l3128
	line	147
	
l3272:	
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	movf	(main@ampStep),w
	; Switch size 1, requested type "space"
; Number of cases is 10, Range of values is 0 to 9
; switch strategies available:
; Name         Instructions Cycles
; direct_byte           27     7 (fixed)
; simple_byte           31    16 (average)
; jumptable            260     6 (fixed)
; rangetable            14     6 (fixed)
; spacedrange           26     9 (fixed)
; locatedrange          10     3 (fixed)
;	Chosen strategy is direct_byte

	movwf fsr
	movlw	10
	subwf	fsr,w
skipnc
goto l674
movlw high(S3322)
movwf pclath
	clrc
	rlf fsr,w
	addlw low(S3322)
	movwf pc
psect	swtext1,local,class=CONST,delta=2
global __pswtext1
__pswtext1:
S3322:
	ljmp	l3136
	ljmp	l679
	ljmp	l685
	ljmp	l687
	ljmp	l693
	ljmp	l3170
	ljmp	l3244
	ljmp	l721
	ljmp	l722
	ljmp	l728
psect	maintext

	line	375
	
l674:	
	goto	l3128
	global	start
	ljmp	start
	opt stack 0
psect	maintext
	line	377
GLOBAL	__end_of_main
	__end_of_main:
;; =============== function _main ends ============

	signat	_main,88
	global	_process_AD_Converter_Value
psect	text498,local,class=CODE,delta=2
global __ptext498
__ptext498:

;; *************** function _process_AD_Converter_Value *****************
;; Defined at:
;;		line 94 in file "C:\sw_dev\AK7030-OTP\common.c"
;; Parameters:    Size  Location     Type
;;		None
;; Auto vars:     Size  Location     Type
;;		None
;; Return value:  Size  Location     Type
;;		None               void
;; Registers used:
;;		wreg, fsr0l, fsr0h, status,2, status,0, pclath, cstack
;; Tracked objects:
;;		On entry : 0/0
;;		On exit  : 0/0
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
;;		_adc_start
;; This function is called by:
;;		_main
;; This function uses a non-reentrant model
;;
psect	text498
	file	"C:\sw_dev\AK7030-OTP\common.c"
	line	94
	global	__size_of_process_AD_Converter_Value
	__size_of_process_AD_Converter_Value	equ	__end_of_process_AD_Converter_Value-_process_AD_Converter_Value
	
_process_AD_Converter_Value:	
	opt	stack 3
; Regs used in _process_AD_Converter_Value: [wreg-fsr0h+status,2+status,0+pclath+cstack]
	line	95
	
l3104:	
;common.c: 95: if(getAD_ConvertFlag())
	fcall	_getAD_ConvertFlag
	xorlw	0
	skipnz
	goto	u601
	goto	u600
u601:
	goto	l1426
u600:
	line	97
	
l3106:	
;common.c: 96: {
;common.c: 97: setAD_ConvertFlag(0);
	movlw	(0)
	fcall	_setAD_ConvertFlag
	line	98
	
l3108:	
;common.c: 98: AD_Sample();
	fcall	_AD_Sample
	line	100
	
l3110:	
;common.c: 100: adc_start();
	fcall	_adc_start
	line	102
	
l1426:	
	return
	opt stack 0
GLOBAL	__end_of_process_AD_Converter_Value
	__end_of_process_AD_Converter_Value:
;; =============== function _process_AD_Converter_Value ends ============

	signat	_process_AD_Converter_Value,88
	global	_AD_Sample
psect	text499,local,class=CODE,delta=2
global __ptext499
__ptext499:

;; *************** function _AD_Sample *****************
;; Defined at:
;;		line 114 in file "C:\sw_dev\AK7030-OTP\common.c"
;; Parameters:    Size  Location     Type
;;		None
;; Auto vars:     Size  Location     Type
;;  index           1    4[BANK0 ] unsigned char 
;; Return value:  Size  Location     Type
;;		None               void
;; Registers used:
;;		wreg, fsr0l, fsr0h, status,2, status,0, pclath, cstack
;; Tracked objects:
;;		On entry : 60/0
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
psect	text499
	file	"C:\sw_dev\AK7030-OTP\common.c"
	line	114
	global	__size_of_AD_Sample
	__size_of_AD_Sample	equ	__end_of_AD_Sample-_AD_Sample
	
_AD_Sample:	
	opt	stack 3
; Regs used in _AD_Sample: [wreg-fsr0h+status,2+status,0+pclath+cstack]
	line	115
	
l3062:	
;common.c: 115: if(sampleTimes < 6)
	movlw	(06h)
	subwf	(_sampleTimes),w
	skipnc
	goto	u531
	goto	u530
u531:
	goto	l1440
u530:
	line	118
	
l3064:	
;common.c: 116: {
;common.c: 118: buffer_Sample_AD_Value[sampleTimes] = getAdOriginalValue();
	fcall	_getAdOriginalValue
	clrc
	rlf	(_sampleTimes),w
	addlw	_buffer_Sample_AD_Value&0ffh
	movwf	fsr0
	movf	(0+(?_getAdOriginalValue)),w
	bcf	status, 7	;select IRP bank0
	movwf	indf
	incf	fsr0,f
	movf	(1+(?_getAdOriginalValue)),w
	movwf	indf
	line	120
	
l3066:	
;common.c: 120: if(sampleTimes == 0)
	movf	(_sampleTimes),f
	skipz
	goto	u541
	goto	u540
u541:
	goto	l3070
u540:
	line	122
	
l3068:	
;common.c: 121: {
;common.c: 122: multiFilterMaxValue = buffer_Sample_AD_Value[0];
	movf	(_buffer_Sample_AD_Value+1),w
	movwf	(_multiFilterMaxValue+1)
	movf	(_buffer_Sample_AD_Value),w
	movwf	(_multiFilterMaxValue)
	line	123
;common.c: 123: multiFilterMinValue = buffer_Sample_AD_Value[0];
	movf	(_buffer_Sample_AD_Value+1),w
	movwf	(_multiFilterMinValue+1)
	movf	(_buffer_Sample_AD_Value),w
	movwf	(_multiFilterMinValue)
	line	126
	
l3070:	
;common.c: 124: }
;common.c: 126: if(multiFilterMaxValue < buffer_Sample_AD_Value[sampleTimes])
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
	subwf	(_multiFilterMaxValue+1),w
	skipz
	goto	u555
	movf	0+(??_AD_Sample+0)+0,w
	subwf	(_multiFilterMaxValue),w
u555:
	skipnc
	goto	u551
	goto	u550
u551:
	goto	l1431
u550:
	line	128
	
l3072:	
;common.c: 127: {
;common.c: 128: multiFilterMaxValue = buffer_Sample_AD_Value[sampleTimes];
	clrc
	rlf	(_sampleTimes),w
	addlw	_buffer_Sample_AD_Value&0ffh
	movwf	fsr0
	movf	indf,w
	movwf	(_multiFilterMaxValue)
	incf	fsr0,f
	movf	indf,w
	movwf	(_multiFilterMaxValue+1)
	line	129
	
l1431:	
	line	130
;common.c: 129: }
;common.c: 130: if(multiFilterMinValue > buffer_Sample_AD_Value[sampleTimes])
	clrc
	rlf	(_sampleTimes),w
	addlw	_buffer_Sample_AD_Value&0ffh
	movwf	fsr0
	movf	indf,w
	movwf	(??_AD_Sample+0)+0+0
	incf	fsr0,f
	movf	indf,w
	movwf	(??_AD_Sample+0)+0+1
	movf	(_multiFilterMinValue+1),w
	subwf	1+(??_AD_Sample+0)+0,w
	skipz
	goto	u565
	movf	(_multiFilterMinValue),w
	subwf	0+(??_AD_Sample+0)+0,w
u565:
	skipnc
	goto	u561
	goto	u560
u561:
	goto	l3076
u560:
	line	132
	
l3074:	
;common.c: 131: {
;common.c: 132: multiFilterMinValue = buffer_Sample_AD_Value[sampleTimes];
	clrc
	rlf	(_sampleTimes),w
	addlw	_buffer_Sample_AD_Value&0ffh
	movwf	fsr0
	movf	indf,w
	movwf	(_multiFilterMinValue)
	incf	fsr0,f
	movf	indf,w
	movwf	(_multiFilterMinValue+1)
	line	137
	
l3076:	
;common.c: 137: sampleTimes++;
	incf	(_sampleTimes),f
	line	139
	
l3078:	
;common.c: 139: if(sampleTimes >= 6)
	movlw	(06h)
	subwf	(_sampleTimes),w
	skipc
	goto	u571
	goto	u570
u571:
	goto	l1440
u570:
	line	141
	
l3080:	
;common.c: 140: {
;common.c: 141: sampleTimes = 0;
	clrf	(_sampleTimes)
	line	143
	
l3082:	
;common.c: 144: {
;common.c: 146: sampleCH13Value = ((multiFilterSumValue - multiFilterMaxValue - multiFilterMinValue))>> 2;
	movf	(_sampleChannelSelect),w
	xorlw	0Dh
	skipz
	goto	u581
	goto	u580
u581:
	goto	l3086
u580:
	line	147
	
l3084:	
;common.c: 147: sampleChannelSelect = 13;
	movlw	(0Dh)
	movwf	(_sampleChannelSelect)
	line	148
;common.c: 148: }
	goto	l3092
	line	149
	
l3086:	
	goto	l3084
	line	160
	
l3092:	
;common.c: 158: }
;common.c: 160: for(unsigned char index = 0; index < 6;index++)
	clrf	(AD_Sample@index)
	line	161
	
l3098:	
;common.c: 161: buffer_Sample_AD_Value[index] = 0;
	clrc
	rlf	(AD_Sample@index),w
	addlw	_buffer_Sample_AD_Value&0ffh
	movwf	fsr0
	clrf	indf
	incf	fsr0,f
	clrf	indf
	line	160
	
l3100:	
	incf	(AD_Sample@index),f
	
l3102:	
	movlw	(06h)
	subwf	(AD_Sample@index),w
	skipc
	goto	u591
	goto	u590
u591:
	goto	l3098
u590:
	line	165
	
l1440:	
	return
	opt stack 0
GLOBAL	__end_of_AD_Sample
	__end_of_AD_Sample:
;; =============== function _AD_Sample ends ============

	signat	_AD_Sample,88
	global	_getAdOriginalValue
psect	text500,local,class=CODE,delta=2
global __ptext500
__ptext500:

;; *************** function _getAdOriginalValue *****************
;; Defined at:
;;		line 76 in file "C:\sw_dev\AK7030-OTP\common.c"
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
psect	text500
	file	"C:\sw_dev\AK7030-OTP\common.c"
	line	76
	global	__size_of_getAdOriginalValue
	__size_of_getAdOriginalValue	equ	__end_of_getAdOriginalValue-_getAdOriginalValue
	
_getAdOriginalValue:	
	opt	stack 3
; Regs used in _getAdOriginalValue: [wreg]
	line	77
	
l3022:	
;common.c: 77: return adc_original_value;
	movf	(_adc_original_value+1),w
	movwf	(?_getAdOriginalValue+1)
	movf	(_adc_original_value),w
	movwf	(?_getAdOriginalValue)
	line	78
	
l1416:	
	return
	opt stack 0
GLOBAL	__end_of_getAdOriginalValue
	__end_of_getAdOriginalValue:
;; =============== function _getAdOriginalValue ends ============

	signat	_getAdOriginalValue,90
	global	_setAD_ConvertFlag
psect	text501,local,class=CODE,delta=2
global __ptext501
__ptext501:

;; *************** function _setAD_ConvertFlag *****************
;; Defined at:
;;		line 70 in file "C:\sw_dev\AK7030-OTP\common.c"
;; Parameters:    Size  Location     Type
;;  flag            1    wreg     unsigned char 
;; Auto vars:     Size  Location     Type
;;  flag            1    0[BANK0 ] unsigned char 
;; Return value:  Size  Location     Type
;;		None               void
;; Registers used:
;;		wreg
;; Tracked objects:
;;		On entry : 0/0
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
psect	text501
	file	"C:\sw_dev\AK7030-OTP\common.c"
	line	70
	global	__size_of_setAD_ConvertFlag
	__size_of_setAD_ConvertFlag	equ	__end_of_setAD_ConvertFlag-_setAD_ConvertFlag
	
_setAD_ConvertFlag:	
	opt	stack 4
; Regs used in _setAD_ConvertFlag: [wreg]
;setAD_ConvertFlag@flag stored from wreg
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	movwf	(setAD_ConvertFlag@flag)
	line	71
	
l3020:	
;common.c: 71: adc_convert_flag = flag;
	movf	(setAD_ConvertFlag@flag),w
	movwf	(_adc_convert_flag)
	line	72
	
l1413:	
	return
	opt stack 0
GLOBAL	__end_of_setAD_ConvertFlag
	__end_of_setAD_ConvertFlag:
;; =============== function _setAD_ConvertFlag ends ============

	signat	_setAD_ConvertFlag,4216
	global	_getAD_ConvertFlag
psect	text502,local,class=CODE,delta=2
global __ptext502
__ptext502:

;; *************** function _getAD_ConvertFlag *****************
;; Defined at:
;;		line 64 in file "C:\sw_dev\AK7030-OTP\common.c"
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
;;		On exit  : 0/0
;;		Unchanged: FFFFF/0
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
psect	text502
	file	"C:\sw_dev\AK7030-OTP\common.c"
	line	64
	global	__size_of_getAD_ConvertFlag
	__size_of_getAD_ConvertFlag	equ	__end_of_getAD_ConvertFlag-_getAD_ConvertFlag
	
_getAD_ConvertFlag:	
	opt	stack 4
; Regs used in _getAD_ConvertFlag: [wreg]
	line	65
	
l3016:	
;common.c: 65: return adc_convert_flag;
	movf	(_adc_convert_flag),w
	line	66
	
l1410:	
	return
	opt stack 0
GLOBAL	__end_of_getAD_ConvertFlag
	__end_of_getAD_ConvertFlag:
;; =============== function _getAD_ConvertFlag ends ============

	signat	_getAD_ConvertFlag,89
	global	_isFinishedSmallTimer
psect	text503,local,class=CODE,delta=2
global __ptext503
__ptext503:

;; *************** function _isFinishedSmallTimer *****************
;; Defined at:
;;		line 226 in file "C:\sw_dev\AK7030-OTP\common.c"
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
psect	text503
	file	"C:\sw_dev\AK7030-OTP\common.c"
	line	226
	global	__size_of_isFinishedSmallTimer
	__size_of_isFinishedSmallTimer	equ	__end_of_isFinishedSmallTimer-_isFinishedSmallTimer
	
_isFinishedSmallTimer:	
	opt	stack 5
; Regs used in _isFinishedSmallTimer: [wreg+status,2+status,0]
	line	227
	
l3004:	
;common.c: 227: if(uiSmallTimer == 0)
	movf	((_uiSmallTimer+1)),w
	iorwf	((_uiSmallTimer)),w
	skipz
	goto	u461
	goto	u460
u461:
	goto	l3012
u460:
	line	228
	
l3006:	
;common.c: 228: return 1;
	movlw	(01h)
	goto	l1470
	line	230
	
l3012:	
;common.c: 229: else
;common.c: 230: return 0;
	movlw	(0)
	line	231
	
l1470:	
	return
	opt stack 0
GLOBAL	__end_of_isFinishedSmallTimer
	__end_of_isFinishedSmallTimer:
;; =============== function _isFinishedSmallTimer ends ============

	signat	_isFinishedSmallTimer,89
	global	_isFinishedBigTimer
psect	text504,local,class=CODE,delta=2
global __ptext504
__ptext504:

;; *************** function _isFinishedBigTimer *****************
;; Defined at:
;;		line 218 in file "C:\sw_dev\AK7030-OTP\common.c"
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
psect	text504
	file	"C:\sw_dev\AK7030-OTP\common.c"
	line	218
	global	__size_of_isFinishedBigTimer
	__size_of_isFinishedBigTimer	equ	__end_of_isFinishedBigTimer-_isFinishedBigTimer
	
_isFinishedBigTimer:	
	opt	stack 5
; Regs used in _isFinishedBigTimer: [wreg+status,2+status,0]
	line	219
	
l2992:	
;common.c: 219: if(uiBigTimer == 0)
	movf	((_uiBigTimer+1)),w
	iorwf	((_uiBigTimer)),w
	skipz
	goto	u451
	goto	u450
u451:
	goto	l3000
u450:
	line	220
	
l2994:	
;common.c: 220: return 1;
	movlw	(01h)
	goto	l1465
	line	222
	
l3000:	
;common.c: 221: else
;common.c: 222: return 0;
	movlw	(0)
	line	223
	
l1465:	
	return
	opt stack 0
GLOBAL	__end_of_isFinishedBigTimer
	__end_of_isFinishedBigTimer:
;; =============== function _isFinishedBigTimer ends ============

	signat	_isFinishedBigTimer,89
	global	_startSmallTimer
psect	text505,local,class=CODE,delta=2
global __ptext505
__ptext505:

;; *************** function _startSmallTimer *****************
;; Defined at:
;;		line 208 in file "C:\sw_dev\AK7030-OTP\common.c"
;; Parameters:    Size  Location     Type
;;		None
;; Auto vars:     Size  Location     Type
;;		None
;; Return value:  Size  Location     Type
;;		None               void
;; Registers used:
;;		wreg
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
;; This function uses a non-reentrant model
;;
psect	text505
	file	"C:\sw_dev\AK7030-OTP\common.c"
	line	208
	global	__size_of_startSmallTimer
	__size_of_startSmallTimer	equ	__end_of_startSmallTimer-_startSmallTimer
	
_startSmallTimer:	
	opt	stack 5
; Regs used in _startSmallTimer: [wreg]
	line	209
	
l2990:	
;common.c: 209: uiSmallTimer = 10800;
	movlw	low(02A30h)
	bcf	status, 5	;RP0=0, select bank0
	movwf	(_uiSmallTimer)
	movlw	high(02A30h)
	movwf	((_uiSmallTimer))+1
	line	214
	
l1461:	
	return
	opt stack 0
GLOBAL	__end_of_startSmallTimer
	__end_of_startSmallTimer:
;; =============== function _startSmallTimer ends ============

	signat	_startSmallTimer,88
	global	_startBigTimer
psect	text506,local,class=CODE,delta=2
global __ptext506
__ptext506:

;; *************** function _startBigTimer *****************
;; Defined at:
;;		line 186 in file "C:\sw_dev\AK7030-OTP\common.c"
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
psect	text506
	file	"C:\sw_dev\AK7030-OTP\common.c"
	line	186
	global	__size_of_startBigTimer
	__size_of_startBigTimer	equ	__end_of_startBigTimer-_startBigTimer
	
_startBigTimer:	
	opt	stack 5
; Regs used in _startBigTimer: [wreg]
	line	187
	
l2988:	
;common.c: 187: uiBigTimer = 34200;
	movlw	low(08598h)
	movwf	(_uiBigTimer)
	movlw	high(08598h)
	movwf	((_uiBigTimer))+1
	line	193
	
l1452:	
	return
	opt stack 0
GLOBAL	__end_of_startBigTimer
	__end_of_startBigTimer:
;; =============== function _startBigTimer ends ============

	signat	_startBigTimer,88
	global	_setDAC0_ChannelValue
psect	text507,local,class=CODE,delta=2
global __ptext507
__ptext507:

;; *************** function _setDAC0_ChannelValue *****************
;; Defined at:
;;		line 181 in file "C:\sw_dev\AK7030-OTP\common.c"
;; Parameters:    Size  Location     Type
;;  ucValue         1    wreg     unsigned char 
;; Auto vars:     Size  Location     Type
;;  ucValue         1    0[BANK0 ] unsigned char 
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
;;      Locals:         0       1       0       0       0
;;      Temps:          0       0       0       0       0
;;      Totals:         0       1       0       0       0
;;Total ram usage:        1 bytes
;; Hardware stack levels used:    1
;; Hardware stack levels required when called:    2
;; This function calls:
;;		Nothing
;; This function is called by:
;;		_main
;; This function uses a non-reentrant model
;;
psect	text507
	file	"C:\sw_dev\AK7030-OTP\common.c"
	line	181
	global	__size_of_setDAC0_ChannelValue
	__size_of_setDAC0_ChannelValue	equ	__end_of_setDAC0_ChannelValue-_setDAC0_ChannelValue
	
_setDAC0_ChannelValue:	
	opt	stack 5
; Regs used in _setDAC0_ChannelValue: [wreg]
;setDAC0_ChannelValue@ucValue stored from wreg
	movwf	(setDAC0_ChannelValue@ucValue)
	line	182
	
l2986:	
;common.c: 182: DACR0=ucValue;
	movf	(setDAC0_ChannelValue@ucValue),w
	bsf	status, 5	;RP0=1, select bank1
	movwf	(136)^080h	;volatile
	line	183
	
l1449:	
	return
	opt stack 0
GLOBAL	__end_of_setDAC0_ChannelValue
	__end_of_setDAC0_ChannelValue:
;; =============== function _setDAC0_ChannelValue ends ============

	signat	_setDAC0_ChannelValue,4216
	global	_getAdOriginalCh13Value
psect	text508,local,class=CODE,delta=2
global __ptext508
__ptext508:

;; *************** function _getAdOriginalCh13Value *****************
;; Defined at:
;;		line 87 in file "C:\sw_dev\AK7030-OTP\common.c"
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
;;		_main
;; This function uses a non-reentrant model
;;
psect	text508
	file	"C:\sw_dev\AK7030-OTP\common.c"
	line	87
	global	__size_of_getAdOriginalCh13Value
	__size_of_getAdOriginalCh13Value	equ	__end_of_getAdOriginalCh13Value-_getAdOriginalCh13Value
	
_getAdOriginalCh13Value:	
	opt	stack 5
; Regs used in _getAdOriginalCh13Value: [wreg]
	line	88
	
l2982:	
;common.c: 88: return adc_original_CH13_value;
	movf	(_adc_original_CH13_value+1),w
	movwf	(?_getAdOriginalCh13Value+1)
	movf	(_adc_original_CH13_value),w
	movwf	(?_getAdOriginalCh13Value)
	line	89
	
l1422:	
	return
	opt stack 0
GLOBAL	__end_of_getAdOriginalCh13Value
	__end_of_getAdOriginalCh13Value:
;; =============== function _getAdOriginalCh13Value ends ============

	signat	_getAdOriginalCh13Value,90
	global	_clearSmallTimer
psect	text509,local,class=CODE,delta=2
global __ptext509
__ptext509:

;; *************** function _clearSmallTimer *****************
;; Defined at:
;;		line 202 in file "C:\sw_dev\AK7030-OTP\common.c"
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
psect	text509
	file	"C:\sw_dev\AK7030-OTP\common.c"
	line	202
	global	__size_of_clearSmallTimer
	__size_of_clearSmallTimer	equ	__end_of_clearSmallTimer-_clearSmallTimer
	
_clearSmallTimer:	
	opt	stack 5
; Regs used in _clearSmallTimer: [status,2]
	line	203
	
l2980:	
;common.c: 203: uiSmallTimer = 0;
	clrf	(_uiSmallTimer)
	clrf	(_uiSmallTimer+1)
	line	204
	
l1458:	
	return
	opt stack 0
GLOBAL	__end_of_clearSmallTimer
	__end_of_clearSmallTimer:
;; =============== function _clearSmallTimer ends ============

	signat	_clearSmallTimer,88
	global	_clearBigTimer
psect	text510,local,class=CODE,delta=2
global __ptext510
__ptext510:

;; *************** function _clearBigTimer *****************
;; Defined at:
;;		line 196 in file "C:\sw_dev\AK7030-OTP\common.c"
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
psect	text510
	file	"C:\sw_dev\AK7030-OTP\common.c"
	line	196
	global	__size_of_clearBigTimer
	__size_of_clearBigTimer	equ	__end_of_clearBigTimer-_clearBigTimer
	
_clearBigTimer:	
	opt	stack 5
; Regs used in _clearBigTimer: [status,2]
	line	197
	
l2978:	
;common.c: 197: uiBigTimer = 0;
	clrf	(_uiBigTimer)
	clrf	(_uiBigTimer+1)
	line	198
	
l1455:	
	return
	opt stack 0
GLOBAL	__end_of_clearBigTimer
	__end_of_clearBigTimer:
;; =============== function _clearBigTimer ends ============

	signat	_clearBigTimer,88
	global	_clrSampeTime
psect	text511,local,class=CODE,delta=2
global __ptext511
__ptext511:

;; *************** function _clrSampeTime *****************
;; Defined at:
;;		line 244 in file "C:\sw_dev\AK7030-OTP\common.c"
;; Parameters:    Size  Location     Type
;;		None
;; Auto vars:     Size  Location     Type
;;		None
;; Return value:  Size  Location     Type
;;		None               void
;; Registers used:
;;		status,2
;; Tracked objects:
;;		On entry : 0/0
;;		On exit  : 0/0
;;		Unchanged: FFFFF/0
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
psect	text511
	file	"C:\sw_dev\AK7030-OTP\common.c"
	line	244
	global	__size_of_clrSampeTime
	__size_of_clrSampeTime	equ	__end_of_clrSampeTime-_clrSampeTime
	
_clrSampeTime:	
	opt	stack 5
; Regs used in _clrSampeTime: [status,2]
	line	245
	
l2976:	
;common.c: 245: timer.timer10msStopWatch = 0;
	clrf	(_timer)
	line	246
	
l1479:	
	return
	opt stack 0
GLOBAL	__end_of_clrSampeTime
	__end_of_clrSampeTime:
;; =============== function _clrSampeTime ends ============

	signat	_clrSampeTime,88
	global	_isPermitSampleTime
psect	text512,local,class=CODE,delta=2
global __ptext512
__ptext512:

;; *************** function _isPermitSampleTime *****************
;; Defined at:
;;		line 234 in file "C:\sw_dev\AK7030-OTP\common.c"
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
;;		On exit  : 0/0
;;		Unchanged: FFFFF/0
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
psect	text512
	file	"C:\sw_dev\AK7030-OTP\common.c"
	line	234
	global	__size_of_isPermitSampleTime
	__size_of_isPermitSampleTime	equ	__end_of_isPermitSampleTime-_isPermitSampleTime
	
_isPermitSampleTime:	
	opt	stack 5
; Regs used in _isPermitSampleTime: [wreg]
	line	235
	
l2964:	
;common.c: 235: if(timer.timer10msStopWatch > 10)
	movlw	(0Bh)
	subwf	(_timer),w
	skipc
	goto	u441
	goto	u440
u441:
	goto	l2972
u440:
	line	237
	
l2966:	
;common.c: 236: {
;common.c: 237: return 1;
	movlw	(01h)
	goto	l1475
	line	240
	
l2972:	
;common.c: 239: else
;common.c: 240: return 0;
	movlw	(0)
	line	241
	
l1475:	
	return
	opt stack 0
GLOBAL	__end_of_isPermitSampleTime
	__end_of_isPermitSampleTime:
;; =============== function _isPermitSampleTime ends ============

	signat	_isPermitSampleTime,89
	global	_adc_start
psect	text513,local,class=CODE,delta=2
global __ptext513
__ptext513:

;; *************** function _adc_start *****************
;; Defined at:
;;		line 99 in file "C:\sw_dev\AK7030-OTP\periph.c"
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
psect	text513
	file	"C:\sw_dev\AK7030-OTP\periph.c"
	line	99
	global	__size_of_adc_start
	__size_of_adc_start	equ	__end_of_adc_start-_adc_start
	
_adc_start:	
	opt	stack 4
; Regs used in _adc_start: []
	line	100
	
l2962:	
;periph.c: 100: GO=1;
	bcf	status, 5	;RP0=0, select bank0
	bsf	(249/8),(249)&7
	line	101
	
l2136:	
	return
	opt stack 0
GLOBAL	__end_of_adc_start
	__end_of_adc_start:
;; =============== function _adc_start ends ============

	signat	_adc_start,88
	global	_op2_init
psect	text514,local,class=CODE,delta=2
global __ptext514
__ptext514:

;; *************** function _op2_init *****************
;; Defined at:
;;		line 45 in file "C:\sw_dev\AK7030-OTP\periph.c"
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
psect	text514
	file	"C:\sw_dev\AK7030-OTP\periph.c"
	line	45
	global	__size_of_op2_init
	__size_of_op2_init	equ	__end_of_op2_init-_op2_init
	
_op2_init:	
	opt	stack 5
; Regs used in _op2_init: [wreg+status,2]
	line	52
	
l2950:	
;periph.c: 52: OP2CON1=0x00;
	clrf	(156)^080h	;volatile
	line	54
	
l2952:	
;periph.c: 54: OP2CON2=0xA0;
	movlw	(0A0h)
	movwf	(157)^080h	;volatile
	line	55
	
l2954:	
;periph.c: 55: OP2CON0=0x80;
	movlw	(080h)
	movwf	(155)^080h	;volatile
	line	58
	
l2956:	
;periph.c: 58: TRISA7=0;
	bcf	(1071/8)^080h,(1071)&7
	line	59
	
l2958:	
;periph.c: 59: TRISB6=1;
	bsf	(1078/8)^080h,(1078)&7
	line	60
	
l2960:	
;periph.c: 60: TRISB7 = 1;
	bsf	(1079/8)^080h,(1079)&7
	line	61
	
l2122:	
	return
	opt stack 0
GLOBAL	__end_of_op2_init
	__end_of_op2_init:
;; =============== function _op2_init ends ============

	signat	_op2_init,88
	global	_op1_init
psect	text515,local,class=CODE,delta=2
global __ptext515
__ptext515:

;; *************** function _op1_init *****************
;; Defined at:
;;		line 26 in file "C:\sw_dev\AK7030-OTP\periph.c"
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
psect	text515
	file	"C:\sw_dev\AK7030-OTP\periph.c"
	line	26
	global	__size_of_op1_init
	__size_of_op1_init	equ	__end_of_op1_init-_op1_init
	
_op1_init:	
	opt	stack 5
; Regs used in _op1_init: [wreg]
	line	33
	
l2942:	
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
	
l2944:	
;periph.c: 38: TRISB3=1;
	bsf	status, 5	;RP0=1, select bank1
	bsf	(1075/8)^080h,(1075)&7
	line	39
	
l2946:	
;periph.c: 39: TRISB4=1;
	bsf	(1076/8)^080h,(1076)&7
	line	40
	
l2948:	
;periph.c: 40: TRISB5=0;
	bcf	(1077/8)^080h,(1077)&7
	line	41
	
l2119:	
	return
	opt stack 0
GLOBAL	__end_of_op1_init
	__end_of_op1_init:
;; =============== function _op1_init ends ============

	signat	_op1_init,88
	global	_dac_init
psect	text516,local,class=CODE,delta=2
global __ptext516
__ptext516:

;; *************** function _dac_init *****************
;; Defined at:
;;		line 14 in file "C:\sw_dev\AK7030-OTP\periph.c"
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
psect	text516
	file	"C:\sw_dev\AK7030-OTP\periph.c"
	line	14
	global	__size_of_dac_init
	__size_of_dac_init	equ	__end_of_dac_init-_dac_init
	
_dac_init:	
	opt	stack 5
; Regs used in _dac_init: [wreg]
	line	15
	
l2936:	
;periph.c: 15: DACCON|=2;
	bsf	(135)^080h+(1/8),(1)&7	;volatile
	line	17
	
l2938:	
;periph.c: 17: DACR0=0x19;
	movlw	(019h)
	movwf	(136)^080h	;volatile
	line	18
	
l2940:	
;periph.c: 18: DACCON|=(1)<<2;
	bsf	(135)^080h+(2/8),(2)&7	;volatile
	line	22
	
l2116:	
	return
	opt stack 0
GLOBAL	__end_of_dac_init
	__end_of_dac_init:
;; =============== function _dac_init ends ============

	signat	_dac_init,88
	global	_adc_test_init
psect	text517,local,class=CODE,delta=2
global __ptext517
__ptext517:

;; *************** function _adc_test_init *****************
;; Defined at:
;;		line 85 in file "C:\sw_dev\AK7030-OTP\periph.c"
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
;; Hardware stack levels required when called:    2
;; This function calls:
;;		Nothing
;; This function is called by:
;;		_main
;; This function uses a non-reentrant model
;;
psect	text517
	file	"C:\sw_dev\AK7030-OTP\periph.c"
	line	85
	global	__size_of_adc_test_init
	__size_of_adc_test_init	equ	__end_of_adc_test_init-_adc_test_init
	
_adc_test_init:	
	opt	stack 5
; Regs used in _adc_test_init: [wreg+status,2+status,0]
;adc_test_init@channel stored from wreg
	movwf	(adc_test_init@channel)
	line	86
	
l2930:	
;periph.c: 86: ADCON0|=channel<<2;
	movf	(adc_test_init@channel),w
	movwf	(??_adc_test_init+0)+0
	clrc
	rlf	(??_adc_test_init+0)+0,f
	clrc
	rlf	(??_adc_test_init+0)+0,w
	iorwf	(31),f	;volatile
	line	87
;periph.c: 87: ADCON1|=ref<<6;
	movf	(adc_test_init@ref),w
	movwf	(??_adc_test_init+0)+0
	rrf	(??_adc_test_init+0)+0,f
	rrf	(??_adc_test_init+0)+0,f
	rrf	(??_adc_test_init+0)+0,w
	andlw	0c0h
	bsf	status, 5	;RP0=1, select bank1
	iorwf	(159)^080h,f	;volatile
	line	88
	
l2932:	
;periph.c: 88: ADON=1;
	bcf	status, 5	;RP0=0, select bank0
	bsf	(248/8),(248)&7
	line	89
	
l2934:	
;periph.c: 89: ADIE=1;
	bsf	status, 5	;RP0=1, select bank1
	bsf	(1130/8)^080h,(1130)&7
	line	90
	
l2130:	
	return
	opt stack 0
GLOBAL	__end_of_adc_test_init
	__end_of_adc_test_init:
;; =============== function _adc_test_init ends ============

	signat	_adc_test_init,8312
	global	_timer1_interrupt_config
psect	text518,local,class=CODE,delta=2
global __ptext518
__ptext518:

;; *************** function _timer1_interrupt_config *****************
;; Defined at:
;;		line 56 in file "C:\sw_dev\AK7030-OTP\common.c"
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
psect	text518
	file	"C:\sw_dev\AK7030-OTP\common.c"
	line	56
	global	__size_of_timer1_interrupt_config
	__size_of_timer1_interrupt_config	equ	__end_of_timer1_interrupt_config-_timer1_interrupt_config
	
_timer1_interrupt_config:	
	opt	stack 5
; Regs used in _timer1_interrupt_config: []
	line	57
	
l2928:	
;common.c: 57: GIE = 1;
	bsf	(95/8),(95)&7
	line	58
;common.c: 58: PEIE = 1;
	bsf	(94/8),(94)&7
	line	59
	
l1407:	
	return
	opt stack 0
GLOBAL	__end_of_timer1_interrupt_config
	__end_of_timer1_interrupt_config:
;; =============== function _timer1_interrupt_config ends ============

	signat	_timer1_interrupt_config,88
	global	_timer1_config
psect	text519,local,class=CODE,delta=2
global __ptext519
__ptext519:

;; *************** function _timer1_config *****************
;; Defined at:
;;		line 44 in file "C:\sw_dev\AK7030-OTP\common.c"
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
psect	text519
	file	"C:\sw_dev\AK7030-OTP\common.c"
	line	44
	global	__size_of_timer1_config
	__size_of_timer1_config	equ	__end_of_timer1_config-_timer1_config
	
_timer1_config:	
	opt	stack 5
; Regs used in _timer1_config: [wreg]
	line	46
	
l2924:	
;common.c: 46: TMR1H=0xCF;
	movlw	(0CFh)
	bcf	status, 6	;RP1=0, select bank0
	movwf	(15)	;volatile
	line	47
;common.c: 47: TMR1L=0x2C;
	movlw	(02Ch)
	movwf	(14)	;volatile
	line	48
;common.c: 48: T1CON=0xE1;
	movlw	(0E1h)
	movwf	(16)	;volatile
	line	49
	
l2926:	
;common.c: 49: TMR1IE=1;
	bsf	status, 5	;RP0=1, select bank1
	bsf	(1120/8)^080h,(1120)&7
	line	51
	
l1404:	
	return
	opt stack 0
GLOBAL	__end_of_timer1_config
	__end_of_timer1_config:
;; =============== function _timer1_config ends ============

	signat	_timer1_config,88
	global	_clock_config
psect	text520,local,class=CODE,delta=2
global __ptext520
__ptext520:

;; *************** function _clock_config *****************
;; Defined at:
;;		line 36 in file "C:\sw_dev\AK7030-OTP\common.c"
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
psect	text520
	file	"C:\sw_dev\AK7030-OTP\common.c"
	line	36
	global	__size_of_clock_config
	__size_of_clock_config	equ	__end_of_clock_config-_clock_config
	
_clock_config:	
	opt	stack 5
; Regs used in _clock_config: [wreg+status,2]
	line	38
	
l2920:	
;common.c: 38: CLKPR = 0x80;
	movlw	(080h)
	bcf	status, 5	;RP0=0, select bank2
	bsf	status, 6	;RP1=1, select bank2
	movwf	(264)^0100h	;volatile
	line	39
	
l2922:	
;common.c: 39: CLKPR = 0x00;
	clrf	(264)^0100h	;volatile
	line	40
;common.c: 40: while(CLKPCE);
	
l1398:	
	btfsc	(2119/8)^0100h,(2119)&7
	goto	u431
	goto	u430
u431:
	goto	l1398
u430:
	line	41
	
l1401:	
	return
	opt stack 0
GLOBAL	__end_of_clock_config
	__end_of_clock_config:
;; =============== function _clock_config ends ============

	signat	_clock_config,88
	global	_ISR
psect	text521,local,class=CODE,delta=2
global __ptext521
__ptext521:

;; *************** function _ISR *****************
;; Defined at:
;;		line 249 in file "C:\sw_dev\AK7030-OTP\common.c"
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
;;		On exit  : 40/0
;;		Unchanged: FFF9F/0
;; Data sizes:     COMMON   BANK0   BANK1   BANK3   BANK2
;;      Params:         0       0       0       0       0
;;      Locals:         0       0       0       0       0
;;      Temps:          2       0       0       0       0
;;      Totals:         2       0       0       0       0
;;Total ram usage:        2 bytes
;; Hardware stack levels used:    1
;; Hardware stack levels required when called:    1
;; This function calls:
;;		i1_setAD_ConvertFlag
;;		_adc_get
;; This function is called by:
;;		Interrupt level 1
;; This function uses a non-reentrant model
;;
psect	text521
	file	"C:\sw_dev\AK7030-OTP\common.c"
	line	249
	global	__size_of_ISR
	__size_of_ISR	equ	__end_of_ISR-_ISR
	
_ISR:	
	opt	stack 3
; Regs used in _ISR: [wreg+status,2+status,0+pclath+cstack]
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
	movf	pclath,w
	movwf	(??_ISR+1)
	ljmp	_ISR
psect	text521
	line	252
	
i1l3026:	
;common.c: 250: static unsigned char ucTimer1sCnt = 0;
;common.c: 252: if(TMR1IF == 1)
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	btfss	(96/8),(96)&7
	goto	u47_21
	goto	u47_20
u47_21:
	goto	i1l3042
u47_20:
	line	254
	
i1l3028:	
;common.c: 253: {
;common.c: 254: TMR1IF = 0 ;
	bcf	(96/8),(96)&7
	line	255
	
i1l3030:	
;common.c: 255: timer.timer10msStopWatch++;
	incf	(_timer),f
	line	256
;common.c: 256: ucTimer1sCnt++;
	incf	(ISR@ucTimer1sCnt),f
	line	258
	
i1l3032:	
;common.c: 258: if(ucTimer1sCnt >= 100)
	movlw	(064h)
	subwf	(ISR@ucTimer1sCnt),w
	skipc
	goto	u48_21
	goto	u48_20
u48_21:
	goto	i1l3042
u48_20:
	line	260
	
i1l3034:	
;common.c: 259: {
;common.c: 260: ucTimer1sCnt = 0;
	clrf	(ISR@ucTimer1sCnt)
	line	261
	
i1l3036:	
;common.c: 261: if(uiBigTimer > 0)
	movf	(_uiBigTimer+1),w
	iorwf	(_uiBigTimer),w
	skipnz
	goto	u49_21
	goto	u49_20
u49_21:
	goto	i1l1486
u49_20:
	line	262
	
i1l3038:	
;common.c: 262: uiBigTimer--;
	movlw	low(01h)
	subwf	(_uiBigTimer),f
	movlw	high(01h)
	skipc
	decf	(_uiBigTimer+1),f
	subwf	(_uiBigTimer+1),f
	
i1l1486:	
	line	264
;common.c: 264: if(uiSmallTimer)
	movf	(_uiSmallTimer+1),w
	iorwf	(_uiSmallTimer),w
	skipnz
	goto	u50_21
	goto	u50_20
u50_21:
	goto	i1l3042
u50_20:
	line	265
	
i1l3040:	
;common.c: 265: uiSmallTimer--;
	movlw	low(01h)
	subwf	(_uiSmallTimer),f
	movlw	high(01h)
	skipc
	decf	(_uiSmallTimer+1),f
	subwf	(_uiSmallTimer+1),f
	line	269
	
i1l3042:	
;common.c: 266: }
;common.c: 267: }
;common.c: 269: if(ADIF)
	btfss	(106/8),(106)&7
	goto	u51_21
	goto	u51_20
u51_21:
	goto	i1l1491
u51_20:
	line	271
	
i1l3044:	
;common.c: 270: {
;common.c: 271: ADIF=0;
	bcf	(106/8),(106)&7
	line	272
	
i1l3046:	
;common.c: 272: setAD_ConvertFlag(1);
	movlw	(01h)
	fcall	i1_setAD_ConvertFlag
	line	273
	
i1l3048:	
;common.c: 273: adc_original_value = adc_get();
	fcall	_adc_get
	movf	(1+(?_adc_get)),w
	bcf	status, 5	;RP0=0, select bank0
	movwf	(_adc_original_value+1)
	movf	(0+(?_adc_get)),w
	movwf	(_adc_original_value)
	line	274
	
i1l3050:	
;common.c: 274: if(sampleChannelSelect == 12)
	movf	(_sampleChannelSelect),w
	xorlw	0Ch
	skipz
	goto	u52_21
	goto	u52_20
u52_21:
	goto	i1l3054
u52_20:
	line	275
	
i1l3052:	
;common.c: 275: adc_original_CH12_value = adc_get();
	fcall	_adc_get
	goto	i1l1491
	line	277
	
i1l3054:	
;common.c: 276: else
;common.c: 277: adc_original_CH13_value = adc_get();
	fcall	_adc_get
	movf	(1+(?_adc_get)),w
	bcf	status, 5	;RP0=0, select bank0
	movwf	(_adc_original_CH13_value+1)
	movf	(0+(?_adc_get)),w
	movwf	(_adc_original_CH13_value)
	line	280
	
i1l1491:	
	movf	(??_ISR+1),w
	movwf	pclath
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
psect	text522,local,class=CODE,delta=2
global __ptext522
__ptext522:

;; *************** function i1_setAD_ConvertFlag *****************
;; Defined at:
;;		line 70 in file "C:\sw_dev\AK7030-OTP\common.c"
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
psect	text522
	file	"C:\sw_dev\AK7030-OTP\common.c"
	line	70
	global	__size_ofi1_setAD_ConvertFlag
	__size_ofi1_setAD_ConvertFlag	equ	__end_ofi1_setAD_ConvertFlag-i1_setAD_ConvertFlag
	
i1_setAD_ConvertFlag:	
	opt	stack 3
; Regs used in i1_setAD_ConvertFlag: [wreg]
;i1setAD_ConvertFlag@flag stored from wreg
	movwf	(i1setAD_ConvertFlag@flag)
	line	71
	
i1l3060:	
;common.c: 71: adc_convert_flag = flag;
	movf	(i1setAD_ConvertFlag@flag),w
	movwf	(_adc_convert_flag)
	line	72
	
i1l1413:	
	return
	opt stack 0
GLOBAL	__end_ofi1_setAD_ConvertFlag
	__end_ofi1_setAD_ConvertFlag:
;; =============== function i1_setAD_ConvertFlag ends ============

	signat	i1_setAD_ConvertFlag,88
	global	_adc_get
psect	text523,local,class=CODE,delta=2
global __ptext523
__ptext523:

;; *************** function _adc_get *****************
;; Defined at:
;;		line 104 in file "C:\sw_dev\AK7030-OTP\periph.c"
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
psect	text523
	file	"C:\sw_dev\AK7030-OTP\periph.c"
	line	104
	global	__size_of_adc_get
	__size_of_adc_get	equ	__end_of_adc_get-_adc_get
	
_adc_get:	
	opt	stack 3
; Regs used in _adc_get: [wreg]
	line	106
	
i1l3056:	
;periph.c: 105: unsigned int val;
;periph.c: 106: val = (ADRESH<<8) | ADRESL;
	movf	(30),w	;volatile
	movwf	(adc_get@val+1)
	clrf	(adc_get@val)
	bsf	status, 5	;RP0=1, select bank1
	movf	(158)^080h,w	;volatile
	iorwf	(adc_get@val),f
	line	107
;periph.c: 107: return val;
	movf	(adc_get@val+1),w
	movwf	(?_adc_get+1)
	movf	(adc_get@val),w
	movwf	(?_adc_get)
	line	108
	
i1l2139:	
	return
	opt stack 0
GLOBAL	__end_of_adc_get
	__end_of_adc_get:
;; =============== function _adc_get ends ============

	signat	_adc_get,90
psect	text524,local,class=CODE,delta=2
global __ptext524
__ptext524:
	global	btemp
	btemp set 07Eh

	DABS	1,126,2	;btemp
	global	wtemp0
	wtemp0 set btemp
	end
