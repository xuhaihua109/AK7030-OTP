

#ifndef __YN8P520_H__
#define __YN8P520_H__


#define SLEEP_PWIDLE() SMCR = 0X01; SLEEP()
#define SLEEP_PWSAVE() SMCR = 0X07; SLEEP()
#define SLEEP_PWADC()  SMCR = 0X05; SLEEP()
#define SLEEP_PWOFF()  SMCR = 0X09; SLEEP()


/*
#define _XTAL_FREQ 20000000
#pragma inline(_delay)
extern void _delay(unsigned long);
#define __delay_us(x) _delay((unsigned long)((x)*(_XTAL_FREQ/4000000.0)))
*/

/* C access to assembler insructions */
#define CLRWDT()        asm(" clrwdt")
#define NOP()           asm(" nop")
#define RESET()         asm(" reset")
#define SLEEP()         asm(" sleep")


/* common definitions */

#define	___mkstr1(x)	#x
#define	___mkstr(x)	___mkstr1(x)

#define	__CONFIG(x)	asm("\tpsect config,class=CONFIG,delta=2");\
			asm("\tdw "___mkstr(x));

//#define __intnop() asm("\tpsect myint,class=CODE,delta=2") \
//			asm("\tORG 300h"); \
//			asm("\tdw 0");

//#define	__CONFIG(x,y,z)	asm("\tpsect config,class=CONFIG,delta=2");\
//			asm("\tdw "___mkstr(x)); \
//			asm("\tdw "___mkstr(y)); \
//			asm("\tdw "___mkstr(z)); 

//
// Configuration mask definitions
//

// Config Register: CONFIG1
//#define CONFIG1              0x2000
//;----- CONFIG1 Options --------------------------------------------------
#define IO_MODE18           0x3FFF    // sop18 package
#define IO_MODE16           0x2FFF    // SOP16 PACKAGE
#define IO_MODE8            0x0FFF    // SOP8  PACKAGE

#define OSTE_OFF            0X37FF    //; OST Counter disable
#define OSTE_ON             0X3FFF    //; OST Counter enable

#define PWRTE_OFF           0X3BFF    //; PWRT enabled
#define PWRTE_ON            0x3FFF    //; PWRT disabled

#define SMT_OFF             0x3DFF    //; SCHEMIT input enabled
#define SMT_ON              0x3FFF    //; SCHEMIT input disabled

#define RDSEL_OFF           0x3EFF    //; read register input enabled
#define RDSEL_ON            0x3FFF    //; read pin input enable

#define POREN_ON            0X3fff    //; enable por
#define POREN_OFF           0x3fdf    //; diable por

#define BOREN_OFF           0x3FEF    //; BOR disabled
#define BODEN_OFF           0x3FEF    //; BOR disabled
#define LVTEN_OFF           0x3FEF    //; BOR disabled
#define BOREN_ON            0x3FFF    //; BOR enabled
#define BODEN_ON            0x3FFF    //; BOR enabled
#define LVTEN_ON            0x3FFF    //; BOR enabled

#define WDTE_OFF            0x3FFB    //; WDT disabled
#define WDT_OFF             0x3FFB    //; WDT disabled
#define WDTE_ON             0x3FFF    //; WDT enabled
#define WDT_ON              0x3FFF    //; WDT enabled

#define CRY_OFF             0x3FFF    //; Crystal disabled
#define CRY_ON              0x3FFE    //; Crystal enabled


//;----- CONFIG2 Options --------------------------------------------------
//#define CONFIG2              0x2001
#define FOSC_LP             0x3F7F    //; LP oscillator :Low-power crystal on PB5/OSCI and PB4/OSCO
#define FOSC_HS             0x3FFF    //; HS oscillator :High-power crystal on PB5/OSCI and PB4/OSCO

#define BOR20V              0x3FAF    //; Brown-out Reset set to 2.0V
#define BOR22V              0x3FBF    //; Brown-out Reset set to 2.2V
#define BOR24V              0x3FCF    //; Brown-out Reset set to 2.4V
#define BOR26V              0x3FDF    //; Brown-out Reset set to 2.6V
#define BOR30V              0x3FEF    //; Brown-out Reset set to 3.0V
#define BOR36V              0x3FFF    //; Brown-out Reset set to 3.6V

#define FOSC_RC20M          0x3FFF    //
#define FOSC_RC10M          0x3FFB    //
#define FOSC_RC5M           0x3FFD    //
#define FOSC_RC2P5M         0x3FF9    //
#define FOSC_RC1P25M        0x3FF5    //

#define RESETE_OFF          0x3FFE    // ; PB3/RSTB pin function is digital input, MCLR internally tied to VDD
#define RESETE_ON           0x3FFF    //; PB3/RSTB pin function is MCLR

//;----- CONFIG3 Options --------------------------------------------------
//#define CONFIG3              0x2002
#define WDTPS_128           0x3FFF    //; Watch Dog Timer PostScaler count
#define WDTPS_64            0x3FDF    //
#define WDTPS_32            0x3FBF    //
#define WDTPS_16            0x3F9F    //
#define WDTPS_8             0x3F7F    //
#define WDTPS_4             0x3F5F    //
#define WDTPS_2             0x3F3F    //
#define WDTPS_1             0x3F1F    //

#define CRYPT_ON            0x3FEF    //; Program memory code cryption protection is enabled
#define CRYPT_OFF           0x3FFF    //; Program memory code cryption protection is disabled

#define SUT_ON              0x3FFF    //
#define SUT_OFF             0x3FF7    //

#define SUT_7               0X3FFF
#define SUT_6               0x3FFE
#define SUT_5               0x3FFD
#define SUT_4               0x3FFC
#define SUT_3               0x3FFB
#define SUT_2               0x3FFA
#define SUT_1               0x3FF9
#define SUT_0               0x3FF8

//;----- CONFIG2 Options --------------------------------------------------
//;Configuration Byte 3H Options
#define OTP_MOD4K          0x3FFF		//
#define OTP_MOD2K          0x3BFF		//
#define OTP_MOD1K          0x39FF		//
#define OTP_MOD512L        0x38FF		// otp configuration as 512 SPACE, 0000-01FF,0200-03FF, 0400-05FF,0600-07FF
#define OTP_MOD512H        0x18FF		// otp configuration as 512 SPACE, 0800-09FF,0A00-0BFF, 0C00-0DFF,0E00-0FFF
//;----- CONFIG3 Options --------------------------------------------------
#define OTP_4K_0           0X3FFF 
#define OTP_2K_0           0X3FFF 
#define OTP_2K_1           0X3EFF 
#define OTP_1K_0           0X3FFF 
#define OTP_1K_1           0X3BFF 
#define OTP_1K_2           0X39FF 
#define OTP_1K_3           0X38FF 
#define OTP_512_0          0x3FFF		//otp configuration as 512 SPACE, 0000-01FF
#define OTP_512_1          0x1FFF		//otp configuration as 512 SPACE, 0200-03FF
#define OTP_512_2          0x0FFF		//otp configuration as 512 SPACE, 0400-05FF
#define OTP_512_3          0x07FF		//otp configuration as 512 SPACE, 0600-07FF
#define OTP_512_4          0x07FF		//otp configuration as 512 SPACE, 0800-09FF
#define OTP_512_5          0x03FF		//otp configuration as 512 SPACE, 0A00-0BFF
#define OTP_512_6          0x01FF		//otp configuration as 512 SPACE, 0C00-0DFF
#define OTP_512_7          0x00FF		//otp configuration as 512 SPACE, 0E00-0FFF


//
// Special function register definitions
//


// Register: INDF
volatile unsigned char           INDF                @ 0x000;
// bit and bitfield definitions

// Register: LVDCON
volatile unsigned char           LVDCON              @ 0x001;

// Register: PCL
volatile unsigned char           PCL                 @ 0x002;
// bit and bitfield definitions

// Register: STATUS
volatile unsigned char           STATUS              @ 0x003;
// bit and bitfield definitions
volatile bit CARRY               @ ((unsigned)&STATUS*8)+0;
volatile bit DC                  @ ((unsigned)&STATUS*8)+1;
volatile bit ZERO                @ ((unsigned)&STATUS*8)+2;
volatile bit nPD                 @ ((unsigned)&STATUS*8)+3;
volatile bit nTO                 @ ((unsigned)&STATUS*8)+4;
volatile bit IRP                 @ ((unsigned)&STATUS*8)+7;
volatile bit RP0                 @ ((unsigned)&STATUS*8)+5;
volatile bit RP1                 @ ((unsigned)&STATUS*8)+6;
#ifndef _LIB_BUILD
volatile union {
    struct {
        unsigned	C                   : 1;
        unsigned	DC                  : 1;
        unsigned	Z                   : 1;
        unsigned	nPD                 : 1;
        unsigned	nTO                 : 1;
        unsigned	RP                  : 2;
        unsigned	IRP                 : 1;
    };
    struct {
        unsigned	                    : 5;
        unsigned	RP0                 : 1;
        unsigned	RP1                 : 1;
    };
} STATUSbits @ 0x003;
#endif

// Register: FSR
volatile unsigned char           FSR                 @ 0x004;
// bit and bitfield definitions

// Register: PORTA
volatile unsigned char           PORTA               @ 0x005;
// bit and bitfield definitions
volatile bit PA0                 @ ((unsigned)&PORTA*8)+0;
volatile bit PA1                 @ ((unsigned)&PORTA*8)+1;
volatile bit PA2                 @ ((unsigned)&PORTA*8)+2;
volatile bit PA3                 @ ((unsigned)&PORTA*8)+3;
volatile bit PA4                 @ ((unsigned)&PORTA*8)+4;
volatile bit PA5                 @ ((unsigned)&PORTA*8)+5;
volatile bit PA6                 @ ((unsigned)&PORTA*8)+6;
volatile bit PA7                 @ ((unsigned)&PORTA*8)+7;

// Register: PORTB
volatile unsigned char           PORTB               @ 0x006;
// bit and bitfield definitions
volatile bit PB0                 @ ((unsigned)&PORTB*8)+0;
volatile bit PB1                 @ ((unsigned)&PORTB*8)+1;
volatile bit PB2                 @ ((unsigned)&PORTB*8)+2;
volatile bit PB3                 @ ((unsigned)&PORTB*8)+3;
volatile bit PB4                 @ ((unsigned)&PORTB*8)+4;
volatile bit PB5                 @ ((unsigned)&PORTB*8)+5;
volatile bit PB6                 @ ((unsigned)&PORTB*8)+6;
volatile bit PB7                 @ ((unsigned)&PORTB*8)+7;

// Register: TMR0
volatile unsigned char           TMR0L               @ 0x007;
volatile unsigned char           TMR0H               @ 0x008;
// bit and bitfield definitions

// Register: TMR0
volatile unsigned int            TMR0                @ 0x007;

// Register: T0CON
volatile unsigned int            T0CON               @ 0x009;

// bit and bitfield definitions
volatile bit T0PS0               @ ((unsigned)&T0CON*8)+0;
volatile bit T0PS1               @ ((unsigned)&T0CON*8)+1;
volatile bit T0PS2               @ ((unsigned)&T0CON*8)+2;
volatile bit PSA                 @ ((unsigned)&T0CON*8)+3;
volatile bit T0SE                @ ((unsigned)&T0CON*8)+4;
volatile bit T0CS                @ ((unsigned)&T0CON*8)+5;
volatile bit T08BIT              @ ((unsigned)&T0CON*8)+6;
volatile bit TMR0ON              @ ((unsigned)&T0CON*8)+7;

// Register: PCLATH
volatile unsigned char           PCLATH              @ 0x00A;
// bit and bitfield definitions
#ifndef _LIB_BUILD
volatile union {
    struct {
        unsigned	                    : 4;
    };
} PCLATHbits @ 0x00A;
#endif

// Register: INTCON
volatile unsigned char           INTCON              @ 0x00B;
// bit and bitfield definitions
volatile bit RBIF                @ ((unsigned)&INTCON*8)+0;
volatile bit INT0IF                @ ((unsigned)&INTCON*8)+1;
volatile bit T0IF                @ ((unsigned)&INTCON*8)+2;
volatile bit RBIE                @ ((unsigned)&INTCON*8)+3;
volatile bit INT0IE                @ ((unsigned)&INTCON*8)+4;
volatile bit T0IE                @ ((unsigned)&INTCON*8)+5;
volatile bit PEIE                @ ((unsigned)&INTCON*8)+6;
volatile bit GIE                 @ ((unsigned)&INTCON*8)+7;
volatile bit TMR0IF              @ ((unsigned)&INTCON*8)+2;
volatile bit TMR0IE              @ ((unsigned)&INTCON*8)+5;
#ifndef _LIB_BUILD
volatile union {
    struct {
        unsigned	RBIF                : 1;
        unsigned	INTF                : 1;
        unsigned	T0IF                : 1;
        unsigned	RBIE                : 1;
        unsigned	INTE                : 1;
        unsigned	T0IE                : 1;
        unsigned	PEIE                : 1;
        unsigned	GIE                 : 1;
    };
    struct {
        unsigned	                    : 2;
        unsigned	TMR0IF              : 1;
        unsigned	: 2;
        unsigned	TMR0IE              : 1;
    };
} INTCONbits @ 0x00B;
#endif


// Register: PIR1
volatile unsigned char           PIR1                @ 0x00C;
// bit and bitfield definitions
volatile bit TMR1IF              @ ((unsigned)&PIR1*8)+0;
volatile bit TMR2IF              @ ((unsigned)&PIR1*8)+1;
volatile bit CCP1IF              @ ((unsigned)&PIR1*8)+2;
volatile bit SSPIF               @ ((unsigned)&PIR1*8)+3;
volatile bit TXIF                @ ((unsigned)&PIR1*8)+4;
volatile bit RCIF                @ ((unsigned)&PIR1*8)+5;
volatile bit INT1IF              @ ((unsigned)&PIR1*8)+6;
volatile bit INT2IF              @ ((unsigned)&PIR1*8)+7;

// Register: PIR1
volatile unsigned char           PIR2                @ 0x00D;
// bit and bitfield definitions
volatile bit OP1IF               @ ((unsigned)&PIR2*8)+0;
volatile bit OP2IF               @ ((unsigned)&PIR2*8)+1;
volatile bit ADIF                @ ((unsigned)&PIR2*8)+2;
volatile bit LVDIF               @ ((unsigned)&PIR2*8)+3;
volatile bit PWMIF               @ ((unsigned)&PIR2*8)+4;
volatile bit BCLIF               @ ((unsigned)&PIR2*8)+5;


// Register: TMR1L
volatile unsigned char           TMR1L               @ 0x00E;
// bit and bitfield definitions

// Register: TMR1H
volatile unsigned char           TMR1H               @ 0x00F;
// bit and bitfield definitions

// Register: TMR1
volatile unsigned int            TMR1                @ 0x00E;

// Register: T1CON
volatile unsigned char           T1CON               @ 0x010;
// bit and bitfield definitions
volatile bit TMR1ON              @ ((unsigned)&T1CON*8)+0;
volatile bit TMR1CS              @ ((unsigned)&T1CON*8)+1;
volatile bit nT1SYNC             @ ((unsigned)&T1CON*8)+2;
volatile bit T1OSCEN             @ ((unsigned)&T1CON*8)+3;
volatile bit T1INSYNC            @ ((unsigned)&T1CON*8)+2;
volatile bit T1CKPS0             @ ((unsigned)&T1CON*8)+4;
volatile bit T1CKPS1             @ ((unsigned)&T1CON*8)+5;
volatile bit RD16                @ ((unsigned)&T1CON*8)+7;

// Register: TMR2
volatile unsigned char           TMR2                @ 0x011;
// bit and bitfield definitions

// Register: T2CON
volatile unsigned char           T2CON               @ 0x012;
// bit and bitfield definitions

volatile bit T2CKPS0             @ ((unsigned)&T2CON*8)+0;
volatile bit T2CKPS1             @ ((unsigned)&T2CON*8)+1;
volatile bit TMR2ON              @ ((unsigned)&T2CON*8)+2;
volatile bit TOUTPS0             @ ((unsigned)&T2CON*8)+3;
volatile bit TOUTPS1             @ ((unsigned)&T2CON*8)+4;
volatile bit TOUTPS2             @ ((unsigned)&T2CON*8)+5;
volatile bit TOUTPS3             @ ((unsigned)&T2CON*8)+6;

// Register: SSPBUF
volatile unsigned char           SSPBUF              @ 0x013;
// bit and bitfield definitions

// Register: SSPCON
volatile unsigned char           SSPCON              @ 0x014;
// bit and bitfield definitions
volatile bit CKP                 @ ((unsigned)&SSPCON*8)+4;
volatile bit SSPEN               @ ((unsigned)&SSPCON*8)+5;
volatile bit SSPOV               @ ((unsigned)&SSPCON*8)+6;
volatile bit WCOL                @ ((unsigned)&SSPCON*8)+7;
volatile bit SSPM0               @ ((unsigned)&SSPCON*8)+0;
volatile bit SSPM1               @ ((unsigned)&SSPCON*8)+1;
volatile bit SSPM2               @ ((unsigned)&SSPCON*8)+2;
volatile bit SSPM3               @ ((unsigned)&SSPCON*8)+3;

// Register: CCPR1L
volatile unsigned char           CCPR1L              @ 0x015;
// bit and bitfield definitions

// Register: CCPR1H
volatile unsigned char           CCPR1H              @ 0x016;
// bit and bitfield definitions

// Register: CCPR1
volatile unsigned int            CCPR1               @ 0x015;

// Register: CCP1CON
volatile unsigned char           CCP1CON             @ 0x017;
// bit and bitfield definitions
volatile bit CCP1M0              @ ((unsigned)&CCP1CON*8)+0;
volatile bit CCP1M1              @ ((unsigned)&CCP1CON*8)+1;
volatile bit CCP1M2              @ ((unsigned)&CCP1CON*8)+2;
volatile bit CCP1M3              @ ((unsigned)&CCP1CON*8)+3;
volatile bit CCP1Y               @ ((unsigned)&CCP1CON*8)+4;
volatile bit CCP1X               @ ((unsigned)&CCP1CON*8)+5;
#ifndef _LIB_BUILD
volatile union {
    struct {
        unsigned	CCP1M               : 4;
        unsigned	DC1B                : 2;
    };
    struct {
        unsigned	CCP1M0              : 1;
        unsigned	CCP1M1              : 1;
        unsigned	CCP1M2              : 1;
        unsigned	CCP1M3              : 1;
        unsigned	CCP1Y               : 1;
        unsigned	CCP1X               : 1;
    };
} CCP1CONbits @ 0x017;
#endif

// Register: RCSTA
volatile unsigned char           RCSTA               @ 0x018;
// bit and bitfield definitions
volatile bit RX9D                @ ((unsigned)&RCSTA*8)+0;
volatile bit OERR                @ ((unsigned)&RCSTA*8)+1;
volatile bit FERR                @ ((unsigned)&RCSTA*8)+2;
volatile bit RXPARITY            @ ((unsigned)&RCSTA*8)+3;
volatile bit CREN                @ ((unsigned)&RCSTA*8)+4;
volatile bit SREN                @ ((unsigned)&RCSTA*8)+5;
volatile bit RX9                 @ ((unsigned)&RCSTA*8)+6;
volatile bit SPEN                @ ((unsigned)&RCSTA*8)+7;
volatile bit RCD8                @ ((unsigned)&RCSTA*8)+0;
volatile bit RC9                 @ ((unsigned)&RCSTA*8)+6;
volatile bit nRC8                @ ((unsigned)&RCSTA*8)+6;
volatile bit RC8_9               @ ((unsigned)&RCSTA*8)+6;

// Register: TXREG
volatile unsigned char           TXREG               @ 0x019;
// bit and bitfield definitions

// Register: RCREG
volatile unsigned char           RCREG               @ 0x01A;
// bit and bitfield definitions

// Register: OP1CON0
volatile unsigned char           OP1CON0             @ 0x01B;
// bit and bitfield definitions
#ifndef _LIB_BUILD
volatile union {
    struct {
        unsigned	OP1F                : 4;
    };
    struct {
        unsigned	OP1F0              : 1;
        unsigned	OP1F1              : 1;
        unsigned	OP1F2              : 1;
        unsigned	OP1F3              : 1;
        unsigned	OP1ZLF             : 1;
        unsigned	OP1POL             : 1;
		unsigned	OP1OUT             : 1;
		unsigned	OP1ON              : 1;
    };
} OP1CON0bits @ 0x01B;
#endif

// Register: OP1CON2
volatile unsigned char           OP1CON1             @ 0x01C;
// bit and bitfield definitions
#ifndef _LIB_BUILD
volatile union {
    struct {
        unsigned	OP1NCH             : 2;
		unsigned	RSV                : 2;
		unsigned	OP1PCH             : 2;
    };
    struct {
        unsigned	OP1NCH0            : 1;
        unsigned	OP1NCH1            : 1;
        unsigned	RSV0               : 1;
        unsigned	RSV1               : 1;
        unsigned	OP1PCH0            : 1;
        unsigned	OP1PCH1            : 1;
		unsigned	OP1INTN            : 1;
		unsigned	OP1INTP            : 1;
    };
} OP1CON1bits @ 0x01C;
#endif

// Register: OP1CON2
volatile unsigned char           OP1CON2             @ 0x01D;
// bit and bitfield definitions
#ifndef _LIB_BUILD
volatile union {    
    struct {
        unsigned	RSV0               : 1;
        unsigned	RSV1               : 1;
        unsigned	RSV2               : 1;
        unsigned	RSV3               : 1;
        unsigned	A1O2N              : 1;
        unsigned	A1NS               : 1;
		unsigned	OP1A2DEN           : 1;
		unsigned	OP1OUTEN           : 1;
    };
} OP1CON2bits @ 0x01D;
#endif

// Register: ADRES
volatile unsigned char           ADRESH              @ 0x01E;
// bit and bitfield definitions

// Register: ADCON0
volatile unsigned char           ADCON0              @ 0x01F;
// bit and bitfield definitions
volatile bit ADON                @ ((unsigned)&ADCON0*8)+0;
volatile bit GO_nDONE            @ ((unsigned)&ADCON0*8)+1;
volatile bit GO                  @ ((unsigned)&ADCON0*8)+1;
volatile bit CHS0                @ ((unsigned)&ADCON0*8)+2;
volatile bit CHS1                @ ((unsigned)&ADCON0*8)+3;
volatile bit CHS2                @ ((unsigned)&ADCON0*8)+4;
volatile bit CHS3                @ ((unsigned)&ADCON0*8)+5;
volatile bit nDONE               @ ((unsigned)&ADCON0*8)+2;
volatile bit GO_DONE             @ ((unsigned)&ADCON0*8)+2;
#ifndef _LIB_BUILD
volatile union {
    struct {
        unsigned	ADON                : 1;
        unsigned	G0                  : 1;
		unsigned	CHS                 : 4;
    };
    struct {
        unsigned	ADON                : 1;
        unsigned	GO                  : 1;
        unsigned	CHS0                : 1;
        unsigned	CHS1                : 1;
        unsigned	CHS2                : 1;
        unsigned	CHS3                : 1;
    };
} ADCON0bits @ 0x01f;
#endif


//
// Special function register definitions: Bank 1
//


// Register: OPTION_REG
volatile unsigned char           WDTCON          @ 0x081;
// bit and bitfield definitions
volatile bit SWDTEN                 @ ((unsigned)&WDTCON*8)+0;
#ifndef _LIB_BUILD
volatile union {
    struct {
        unsigned	SWDTEN              : 1;
    };
} WDTCONbits @ 0x081;
#endif

// Register: TRISA
volatile unsigned char           TRISA               @ 0x085;
// bit and bitfield definitions
volatile bit TRISA0              @ ((unsigned)&TRISA*8)+0;
volatile bit TRISA1              @ ((unsigned)&TRISA*8)+1;
volatile bit TRISA2              @ ((unsigned)&TRISA*8)+2;
volatile bit TRISA3              @ ((unsigned)&TRISA*8)+3;
volatile bit TRISA4              @ ((unsigned)&TRISA*8)+4;
volatile bit TRISA5              @ ((unsigned)&TRISA*8)+5;
volatile bit TRISA6              @ ((unsigned)&TRISA*8)+6;
volatile bit TRISA7              @ ((unsigned)&TRISA*8)+7;

// Register: TRISB
volatile unsigned char           TRISB               @ 0x086;
// bit and bitfield definitions
volatile bit TRISB0              @ ((unsigned)&TRISB*8)+0;
volatile bit TRISB1              @ ((unsigned)&TRISB*8)+1;
volatile bit TRISB2              @ ((unsigned)&TRISB*8)+2;
volatile bit TRISB3              @ ((unsigned)&TRISB*8)+3;
volatile bit TRISB4              @ ((unsigned)&TRISB*8)+4;
volatile bit TRISB5              @ ((unsigned)&TRISB*8)+5;
volatile bit TRISB6              @ ((unsigned)&TRISB*8)+6;
volatile bit TRISB7              @ ((unsigned)&TRISB*8)+7;

volatile unsigned char           DACCON              @ 0x087;
// bit and bitfield definitions
#ifndef _LIB_BUILD
volatile union {
    struct {
        unsigned	DACCH              : 2;
    };
    struct {
        unsigned	DACCH0             : 1;
        unsigned	DACCH1             : 1;
        unsigned	DAC0EN             : 1;
        unsigned	DAC1EN             : 1;
    };
} DACCONbits @ 0x087;
#endif

volatile unsigned char           DACR0               @ 0x088;
volatile unsigned char           DACR1               @ 0x089;

// Register: PIE1
volatile unsigned char           PIE1                @ 0x08C;
// bit and bitfield definitions
volatile bit TMR1IE              @ ((unsigned)&PIE1*8)+0;
volatile bit TMR2IE              @ ((unsigned)&PIE1*8)+1;
volatile bit CCP1IE              @ ((unsigned)&PIE1*8)+2;
volatile bit SSPIE               @ ((unsigned)&PIE1*8)+3;
volatile bit TXIE                @ ((unsigned)&PIE1*8)+4;
volatile bit RCIE                @ ((unsigned)&PIE1*8)+5;
volatile bit INT1IE              @ ((unsigned)&PIE1*8)+6;
volatile bit INT2IE              @ ((unsigned)&PIE1*8)+7;

// Register: PIE1
volatile unsigned char           PIE2                @ 0x08D;
// bit and bitfield definitions
volatile bit OP1IE               @ ((unsigned)&PIE2*8)+0;
volatile bit OP2IE               @ ((unsigned)&PIE2*8)+1;
volatile bit ADIE                @ ((unsigned)&PIE2*8)+2;
volatile bit LVDIE               @ ((unsigned)&PIE2*8)+3;
volatile bit PWMIE               @ ((unsigned)&PIE2*8)+4;
volatile bit BCLIE               @ ((unsigned)&PIE2*8)+5;


// Register: PCON
volatile unsigned char           PCON                @ 0x08E;
// bit and bitfield definitions
volatile bit nBOR                @ ((unsigned)&PCON*8)+0;
volatile bit nPOR                @ ((unsigned)&PCON*8)+1;
volatile bit INTEDG2            @ ((unsigned)&PCON*8)+2;
volatile bit INTEDG1            @ ((unsigned)&PCON*8)+3;
volatile bit INTEDG0            @ ((unsigned)&PCON*8)+4;
volatile bit CKOE                @ ((unsigned)&PCON*8)+5;
volatile bit I2C_AUX             @ ((unsigned)&PCON*8)+6;
volatile bit nBO                 @ ((unsigned)&PCON*8)+0;


// Register: PWST
volatile unsigned char           PWST                @ 0x08F;

// Register: SPADD2
volatile unsigned char           SSPADD2             @ 0x090;

// Register: SSPCON2
volatile unsigned char           SSPCON2             @ 0x091;
volatile bit	SEN				@ ((unsigned)&SSPCON2*8)+0;
volatile bit	RSEN			@ ((unsigned)&SSPCON2*8)+1;
volatile bit	PEN				@ ((unsigned)&SSPCON2*8)+2;
volatile bit	RCEN			@ ((unsigned)&SSPCON2*8)+3;
volatile bit	ACKEN			@ ((unsigned)&SSPCON2*8)+4;
volatile bit	ACKDT			@ ((unsigned)&SSPCON2*8)+5;
volatile bit	ACKSTAT			@ ((unsigned)&SSPCON2*8)+6;
volatile bit	GCEN			@ ((unsigned)&SSPCON2*8)+7;

// Register: PR2
volatile unsigned char           PR2                 @ 0x092;

// Register: SPADD2
volatile unsigned char           SSPADD              @ 0x093;

// Register: SSPCON2
volatile unsigned char           SSPSTAT             @ 0x094;
// bit and bitfield definitions
volatile bit BF                  @ ((unsigned)&SSPSTAT*8)+0;
volatile bit UA                  @ ((unsigned)&SSPSTAT*8)+1;
volatile bit R_nW                @ ((unsigned)&SSPSTAT*8)+2;
volatile bit S                   @ ((unsigned)&SSPSTAT*8)+3;
volatile bit P                   @ ((unsigned)&SSPSTAT*8)+4;
volatile bit D_nA                @ ((unsigned)&SSPSTAT*8)+5;
volatile bit CKE                 @ ((unsigned)&SSPSTAT*8)+6;
volatile bit SMP                 @ ((unsigned)&SSPSTAT*8)+7;
volatile bit R                   @ ((unsigned)&SSPSTAT*8)+2;
volatile bit D                   @ ((unsigned)&SSPSTAT*8)+5;
volatile bit I2C_READ            @ ((unsigned)&SSPSTAT*8)+2;
volatile bit I2C_START           @ ((unsigned)&SSPSTAT*8)+3;
volatile bit I2C_STOP            @ ((unsigned)&SSPSTAT*8)+4;
volatile bit I2C_DATA            @ ((unsigned)&SSPSTAT*8)+5;
volatile bit R_W                 @ ((unsigned)&SSPSTAT*8)+2;
volatile bit D_A                 @ ((unsigned)&SSPSTAT*8)+5;
volatile bit READ_WRITE          @ ((unsigned)&SSPSTAT*8)+2;
volatile bit DATA_ADDRESS        @ ((unsigned)&SSPSTAT*8)+5;
volatile bit nW                  @ ((unsigned)&SSPSTAT*8)+2;
volatile bit nA                  @ ((unsigned)&SSPSTAT*8)+5;
volatile bit nWRITE              @ ((unsigned)&SSPSTAT*8)+2;
volatile bit nADDRESS            @ ((unsigned)&SSPSTAT*8)+5;

// Register: PWMCON1
volatile unsigned char           PWMCON1             @ 0x096;
// bit and bitfield definitions
volatile bit PWM1ASE             @ ((unsigned)&PWMCON1*8)+0;
volatile bit PWM1OP2ASEN         @ ((unsigned)&PWMCON1*8)+1;
volatile bit PWM1OP1ASEN         @ ((unsigned)&PWMCON1*8)+2;
volatile bit PWM1RSE             @ ((unsigned)&PWMCON1*8)+4;
volatile bit PWM1OP2RSEN         @ ((unsigned)&PWMCON1*8)+5;
volatile bit PWM1OP1RSEN         @ ((unsigned)&PWMCON1*8)+6;


// Register: PWMCON0
volatile unsigned char           PWMCON0             @ 0x097;
// bit and bitfield definitions
volatile bit PWM1S               @ ((unsigned)&PWMCON0*8)+6;


// Register: TXSTA
volatile unsigned char           TXSTA               @ 0x098;
// bit and bitfield definitions
volatile bit TX9D                @ ((unsigned)&TXSTA*8)+0;
volatile bit TRMT                @ ((unsigned)&TXSTA*8)+1;
volatile bit BRGH                @ ((unsigned)&TXSTA*8)+2;
volatile bit TXPARITY            @ ((unsigned)&TXSTA*8)+3;
volatile bit SYNC                @ ((unsigned)&TXSTA*8)+4;
volatile bit TXEN                @ ((unsigned)&TXSTA*8)+5;
volatile bit TX9                 @ ((unsigned)&TXSTA*8)+6;
volatile bit CSRC                @ ((unsigned)&TXSTA*8)+7;
volatile bit TXD8                @ ((unsigned)&TXSTA*8)+0;
volatile bit nTX8                @ ((unsigned)&TXSTA*8)+6;
volatile bit TX8_9               @ ((unsigned)&TXSTA*8)+6;

// Register: SPBRG
volatile unsigned char           SPBRG               @ 0x099;
// bit and bitfield definitions

// Register: UARTCON
volatile unsigned char           UARTCON             @ 0x09A;
// bit and bitfield definitions
volatile bit INVMODE             @ ((unsigned)&UARTCON*8)+0;
volatile bit PARITY              @ ((unsigned)&UARTCON*8)+1;
volatile bit RXODD_EVEN          @ ((unsigned)&UARTCON*8)+2;
volatile bit BOUD_CLK            @ ((unsigned)&UARTCON*8)+3;
volatile bit HALF_DUPLEX         @ ((unsigned)&UARTCON*8)+4;
volatile bit DLSB                @ ((unsigned)&UARTCON*8)+5;
volatile bit STOP_BIT1           @ ((unsigned)&UARTCON*8)+6;
volatile bit STOP_BIT0           @ ((unsigned)&UARTCON*8)+7;

// Register: OP2CON0
volatile unsigned char           OP2CON0             @ 0x09B;
// bit and bitfield definitions
#ifndef _LIB_BUILD
volatile union {
    struct {
        unsigned	OP2F                : 4;
    };
    struct {
        unsigned	OP2F0              : 1;
        unsigned	OP2F1              : 1;
        unsigned	OP2F2              : 1;
        unsigned	OP2F3              : 1;
        unsigned	OP2ZLF             : 1;
        unsigned	OP2POL             : 1;
		unsigned	OP2OUT             : 1;
		unsigned	OP2ON              : 1;
    };
} OP2CON0bits @ 0x09B;
#endif

// Register: OP2CON1
volatile unsigned char           OP2CON1             @ 0x09C;
// bit and bitfield definitions
#ifndef _LIB_BUILD
volatile union {
    struct {
        unsigned	OP2NCH             : 3;
		unsigned	OP2PCH             : 3;
    };
    struct {
        unsigned	OP2NCH0            : 1;
        unsigned	OP2NCH1            : 1;
        unsigned	OP2NCH2            : 1;
        unsigned	OP2PCH0            : 1;
        unsigned	OP2PCH1            : 1;
        unsigned	OP2PCH2            : 1;
		unsigned	OP2INTN            : 1;
		unsigned	OP2INTP            : 1;
    };
} OP2CON1bits @ 0x09C;
#endif

// Register: OP2CON2
volatile unsigned char           OP2CON2             @ 0x09D;
// bit and bitfield definitions
#ifndef _LIB_BUILD
volatile union {  
	struct {
		unsigned	PGA                : 3;
	};  
    struct {
        unsigned	PGA0               : 1;
        unsigned	PGA1               : 1;
        unsigned	PGA2               : 1;
        unsigned	PGAEN              : 1;
        unsigned	A2O2N              : 1;
        unsigned	A2NS               : 1;
		unsigned	OP2A2DEN           : 1;
		unsigned	OP2OUTEN           : 1;
    };
} OP2CON2bits @ 0x09D;
#endif

// Register: ADRESL
volatile unsigned char           ADRESL              @ 0x09E;
// bit and bitfield definitions

// Register: ADCON1
volatile unsigned char           ADCON1              @ 0x09F;
// bit and bitfield definitions
volatile bit ADCS0               @ ((unsigned)&ADCON1*8)+0;
volatile bit ADCS1               @ ((unsigned)&ADCON1*8)+1;
volatile bit ADCS2               @ ((unsigned)&ADCON1*8)+2;
volatile bit ACQT0               @ ((unsigned)&ADCON1*8)+3;
volatile bit ACQT1               @ ((unsigned)&ADCON1*8)+4;
volatile bit ACQT2               @ ((unsigned)&ADCON1*8)+5;
volatile bit ADVREF0             @ ((unsigned)&ADCON1*8)+4;
volatile bit ADVERF1             @ ((unsigned)&ADCON1*8)+5;
#ifndef _LIB_BUILD
volatile union {
    struct {
        unsigned	ADCS                : 3;
        unsigned	ACQT                : 3;
		unsigned	ADVREF              : 2;
    };
    struct {
        unsigned	ADCS0               : 1;
        unsigned	ADCS1               : 1;
        unsigned	ADCS2               : 1;
        unsigned	ACQT0               : 1;
        unsigned	ACQT1               : 1;
        unsigned	ACOT2               : 1;
		unsigned    ADVREF0             : 1;
		unsigned    ADVREF1             : 1;
    };
} ADCON1bits @ 0x09f;
#endif


//
// Special function register definitions: Bank 2
//

// Register: PAPU
volatile unsigned char           PAPU                @ 0x105;
// bit and bitfield definitions

// Register: PBPU
volatile unsigned char           PBPU                @ 0x106;
// bit and bitfield definitions

// Register: PBMASK
volatile unsigned char           PBMASK              @ 0x107;
// bit and bitfield definitions

// Register: CLKPR
volatile unsigned char           CLKPR               @ 0x108;
// bit and bitfield definitions
volatile bit CLKPS0              @ ((unsigned)&CLKPR*8)+0;
volatile bit CLKPS1              @ ((unsigned)&CLKPR*8)+1;
volatile bit CLKPCE              @ ((unsigned)&CLKPR*8)+7;

// Register: SMCR
volatile unsigned char           SMCR                @ 0x109;
// bit and bitfield definitions
volatile bit SE                  @ ((unsigned)&SMCR*8)+0;
volatile bit SM0                 @ ((unsigned)&SMCR*8)+1;
volatile bit SM1                 @ ((unsigned)&SMCR*8)+2;
volatile bit SM2                 @ ((unsigned)&SMCR*8)+3;

// Register: ALG0
volatile unsigned char           ALG0                @ 0x10C;
// bit and bitfield definitions
// bit and bitfield definitions
volatile bit DACBIASEN               @ ((unsigned)&ALG0*8)+4;
volatile bit IOVCCEN                 @ ((unsigned)&ALG0*8)+5;
volatile bit BIASEN                  @ ((unsigned)&ALG0*8)+6;
volatile bit LDO2P0EN                @ ((unsigned)&ALG0*8)+7;

// Register: ALG1
volatile unsigned char           ALG1                @ 0x10D;
// bit and bitfield definitions

// Register: ALG2
volatile unsigned char           ALG2                @ 0x10E;
// bit and bitfield definitions

// Register: ALG3
volatile unsigned char           ALG3                @ 0x10F;
// bit and bitfield definitions


//
// Special function register definitions: Bank 3
//
// Register: PAPD
volatile unsigned char           PAPD                @ 0x185;

// bit and bitfield definitions

// Register: PBPD
volatile unsigned char           PBPD                @ 0x186;
// bit and bitfield definitions

// Register: PAPD
volatile unsigned char           PAOD                @ 0x187;
volatile bit PAOD6               @ ((unsigned)&PAOD*8)+6;
volatile bit PAOD7               @ ((unsigned)&PAOD*8)+7;
// bit and bitfield definitions

// Register: PBPD
volatile unsigned char           PBOD                @ 0x188;
volatile bit PBOD2               @ ((unsigned)&PBOD*8)+2;
volatile bit PBOD7               @ ((unsigned)&PBOD*8)+7;
// bit and bitfield definitions

// Register: ALG4
volatile unsigned char           ALG4                @ 0x18C;
// bit and bitfield definitions

// Register: ALG5
volatile unsigned char           ALG5                @ 0x18D;
// bit and bitfield definitions

// Register: ALG5
volatile unsigned char           ALG6                @ 0x18E;
// bit and bitfield definitions

// Register: ALG5
volatile unsigned char           ALG7                @ 0x18F;
// bit and bitfield definitions




#endif
