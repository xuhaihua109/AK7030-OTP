//////////////////////////////////////////////////////////////////////////////////
//               ������˵������DAC0���VCC*25/64=1.3Vͨ��OP1�Ŵ��PB5���           //
//                             DAC1���VCC*6/64=0.3Vͨ��OP2�Ŵ��PA7���            //
//////////////////////////////////////////////////////////////////////////////////


///////////////////////////////////////////////////////////////////////////////////////////////////////////
//  ������˵������������OP1��OP2���óɷŴ���,��ͬ��˵������ѹ���зŴ�                                  //
//                                                                                                       //
//                                  ͬ��ˣ�IN+��   �����(IN-)         ���(VO)        ����                         //
//                      OP1          PB3               PB4              PB5     1+R2/R1                  //
//                      OP2          PB6               PB7              PA7      8                       //
//                                                                                                       //
//                      OP1��Ҫ����ⲿ������зŴ�,�Ŵ���    Av=1+R2/R1                                   //
//                      R1ΪA1N(PB4)��AVSS�����,R2ΪA1E(PB5)��A1N(PB4)�����                                //
//                      �������ü�datasheet;                                                                 //
///////////////////////////////////////////////////////////////////////////////////////////////////////////


//#define    USE_SOFTWARE_SIMULATION_TEST                1
#define    TIMR_CONDITION_OK   1

#define AD_12_CHANNEL_MIN_VALUE          312
#define AD_CHANGE_THRESHOLD_VALUE        1

#define  SET_PIN_AS_OUTPUT   0
#define  SET_PIN_AS_INPUT    1

#define  SET_PIN_HIGH    1
#define  SET_PIN_LOW     0

#define   BIG_TIME_SECONDS         36000
#define   SMALL_TIME_SECONDS       10800



#define  LETE_BRANCH_COMMON_STAY_TIME     1

#define    TRUE   1
#define    FALSE  0

#ifndef USE_SOFTWARE_SIMULATION_TEST

#define _XTAL_FREQ 20000000

#include <stdio.h>
#include "yn8p520.h"    //ϵͳͷ�ļ�
#include "common.h"
#include "periph.h"



#pragma inline(_delay)
extern void _delay(unsigned long);
#define __delay_us(x) _delay((unsigned long)((x)*(_XTAL_FREQ/4000000.0)))

#endif

#ifdef USE_SOFTWARE_SIMULATION_TEST
#include <iostream>
#include <ctime>
using namespace std;
#endif

//OTP_MOD4K  : 4k --16c77
//OTP_MOD2K  : 2k --16c76
//OTP_MOD1K  : 1k --16c74a
//OTP_MOD512L: 512--16c73a
//OTP_MOD512H: 512--16c73a


//����˵����
//DAC0���VCC*25/64=1.3Vͨ��OP1�����PB5���
//DAC1���VCC*6/64 =0.3Vͨ��OP2�����PA7���


/***************************************************************************
*   ���������ֹ���˵����
*
*   IO_MODE16   :ΪоƬ��װ��Ϣ ����ΪIO_MODE8/16/18 �ֱ��ӦSOP8/16/18
*   WDTE_OFF        :���Ź��ر� ��ʱ��ΪWDT_ON
*   OTP_MOD4K   ��ΪоƬ��дģʽ �ܿռ�Ϊ4K,������ΪOTP_MOD1/2/4K�ֱ�Ϊ
*                     ÿ����¼ʹ�ÿռ�ռ��1/2/4K,�������Сʱ���������ö����¼
*                       ��ӦоƬ�ͺ�����˵��
*   OTP_4K_0        ��OTP_mK_n ��mKģʽ�µ�n���ռ�  m(1/2/4) ��дʱ nֵ���0��ʼ
*                       4Kֻ����Ϊ0 2K����Ϊ0/1/2 1K����Ϊ 0/1/2/3
*   FOSC_RC20M  ��ϵͳʱ��ѡ�� ����Ϊ
*                       ����        ��  FOSC_RC20M FOSC_RC10M FOSC_RC10M FOSC_RC5M  FOSC_RC1P25M
*                       ��Ӧʱ��    ��          20MHZ       10MHZ           5MHZ          2.5MHZ            1.25MHZ
*   WDTPS_128   �����Ź���ʱ��ʱ�ӷ�Ƶ
*
*
*   ע�⣺1.�����������ر����������޸ģ�
*           2.���������ּ���Ӧ���ܼ�Datasheet��ͷ�ļ���
*           2.������֧��20Mʱ��ģʽ�������������������ʱӦע�⣻
*
****************************************************************************/
#ifndef USE_SOFTWARE_SIMULATION_TEST

#define CONFIG1 IO_MODE8   & PWRTE_ON   & LVTEN_ON    & WDTE_ON    &  RDSEL_ON & SMT_ON
#define CONFIG2 OTP_MOD4K  & BOR26V      & FOSC_RC20M  & RESETE_OFF
#define CONFIG3 OTP_4K_0  & WDTPS_128   & SUT_ON      & SUT_0


__CONFIG(CONFIG1);
__CONFIG(CONFIG2);
__CONFIG(CONFIG3);

#define SLEEP_PWIDLE() SMCR = 0X01; SLEEP()
#define SLEEP_PWSAVE() SMCR = 0X07; SLEEP()
#define SLEEP_PWADC()  SMCR = 0X05; SLEEP()
#define SLEEP_PWOFF()  SMCR = 0X09; SLEEP()

#endif

//#define CHANGE_PIN_DEFINAITION   1



#ifndef USE_SOFTWARE_SIMULATION_TEST
static void clearAllTimer(void)
{
    clearTwelveHoursTimer();
    clearThreeHoursTimer();
    clearTwentySecondsTimer();
}
#endif


void initPB3(unsigned char bValue)
{
    if( bValue )
#ifndef USE_SOFTWARE_SIMULATION_TEST
        TRISB3 = 1;
#else
       cout <<"set PB3 as input pin."<<endl;
#endif
    else
#ifndef USE_SOFTWARE_SIMULATION_TEST
        TRISB3 = 0;
#else
       cout <<"set PB3 as output pin."<<endl;
#endif
}


void setPB3(unsigned char bValue)
{
    if( bValue )
#ifndef USE_SOFTWARE_SIMULATION_TEST
        PB3 = 1;
#else
       cout <<"set PB3 output 1"<<endl;
#endif
    else
#ifndef USE_SOFTWARE_SIMULATION_TEST
        PB3= 0;
#else
       cout <<"set PB3 output 0"<<endl;
#endif
}



void initPB4(unsigned char bValue)
{
    if( bValue )
#ifndef USE_SOFTWARE_SIMULATION_TEST
        TRISB4 = 1;
#else
       cout <<"set PB4 as input pin."<<endl;
#endif
    else
#ifndef USE_SOFTWARE_SIMULATION_TEST
        TRISB4= 0;
#else
       cout <<"set PB4 as output pin."<<endl;
#endif
}


void setPB4(unsigned char bValue)
{
    if( bValue )
#ifndef USE_SOFTWARE_SIMULATION_TEST
        PB4 = 1;
#else
       cout <<"set PB4 output 1."<<endl;
#endif
    else
#ifndef USE_SOFTWARE_SIMULATION_TEST
        PB4= 0;
#else
       cout <<"set PB4 as output 0."<<endl;
#endif
}


void initPB5(unsigned char bValue)
{
    if( bValue )
#ifndef USE_SOFTWARE_SIMULATION_TEST
        TRISB5 = 1;
#else
       cout <<"set PB5 as input pin."<<endl;
#endif
    else
#ifndef USE_SOFTWARE_SIMULATION_TEST
        TRISB5= 0;
#else
       cout <<"set PB5 as output pin."<<endl;
#endif
}


void setPB5(unsigned char bValue)
{
    if( bValue )
#ifndef USE_SOFTWARE_SIMULATION_TEST
        PB5 = 1;
#else
       cout <<"set PB5 output 1."<<endl;
#endif
    else
#ifndef USE_SOFTWARE_SIMULATION_TEST
        PB5= 0;
#else
       cout <<"set PB5 output 0."<<endl;
#endif
}


void initPB2_AsHighResistence( void )
{ // in 8 pin chip, PB2 is the fifth pin
#ifndef     USE_SOFTWARE_SIMULATION_TEST
    PB2 = 1;
    PBOD2 = 1; //set PB2 as high resistance
#else
    cout << "set PB2 as high resistance"<< endl;
#endif
}


//pwm��ʼ��
void pwm_start( unsigned char ucPulseWidth,unsigned char ucPulseFrequency)
{
#ifndef     USE_SOFTWARE_SIMULATION_TEST
	CCP1CON&= 0xf0;//disable PWM

    T2CON=0x04;         //ʹ��T2�����Ƶֵ1 Ԥ��Ƶֵ1
    PR2 = ucPulseFrequency;           //T2���ڼĴ�����   100kHZ f=20M/(4*(PR2+1))
    CCPR1L = ucPulseWidth;      //pwm��8λ  ռ�ձ�50% =��CCPR1L:CCP1CON[5:4]��/((PR2+1)*4)
    CCP1CON=0x00;       //�ⲿCCP1��������  pwm����λΪ00������ PWMģʽ�� e PWM Ĭ�����Ϊ 1, d 0

    TRISB2=0;           //pb2��Ϊ���
    PBOD2 = 0;

    CCP1CON|= 0x0c;//enable
#else

    cout<<"*********************************************"<<endl;
    cout << "pwm_start();" <<endl;
    unsigned int uiTempWidth = ucPulseWidth*100;
    cout << "width of PWM is:" <<  uiTempWidth/99 << endl;
    cout<<"*********************************************"<<endl;
#endif
}


static void initPin(void)
{
#ifndef     USE_SOFTWARE_SIMULATION_TEST
    initPB2_AsHighResistence();

    initPB3(SET_PIN_AS_OUTPUT);

    initPB4(SET_PIN_AS_OUTPUT);

    initPB5(SET_PIN_AS_OUTPUT);
#else
    cout << "initPin(void)" << endl;
#endif

}

static void setPinInitVaule( void )
{
#ifndef     USE_SOFTWARE_SIMULATION_TEST
    setPB3(SET_PIN_HIGH);
    setPB4(SET_PIN_LOW);
    setPB5(SET_PIN_HIGH);
#else
    cout << "setPinInitVaule(void)" << endl;
#endif
}

static void selectAdChannel( void )
{
#ifndef     USE_SOFTWARE_SIMULATION_TEST
    TRISB0 = 1; //AD 12 CHANNEL
    TRISB1 = 1; // AD 13 CHANNEL
#else
    cout << "selectAdChannel(void)" << endl;
#endif
}


static void reset( void )
{
#ifndef     USE_SOFTWARE_SIMULATION_TEST
    while(1);
#else
    cout << "while(1);" <<endl;
#endif
}

#ifdef USE_SOFTWARE_SIMULATION_TEST


bool isPermitSampleTime(void)
{

    static time_t old = time(0);

    if(( time(0)- old ) >= 1)
    {
        old = time(0);
     return true;
    }
    else
        return false;

}



unsigned int getAdOriginalCh12Value(void)
{
    unsigned int uiCh12Value = 0;

    cout <<"please input value of ch12:"<<endl;

    cin.sync();

    cin >> uiCh12Value;

    return uiCh12Value;

}


unsigned int getAdOriginalCh13Value(void)
{
    unsigned int uiCh13Value = 0;

    cout <<"please input value of ch13:"<< endl;

    cin.sync();

    cin >> uiCh13Value;

    return uiCh13Value;
}



unsigned int getAdOriginaCh4Value(void)
{
    unsigned int uiCh4Value = 0;

    cout <<"please input value of ch4:"<< endl;

    cin >> uiCh4Value;

    return uiCh4Value;
}



void startTwelveHourTimer(unsigned int uiTimeValue)
{
    cout << "startTwelveHourTimer(unsigned int uiTimeValue)" <<endl;
}


bool isFinishedTwelveHoursTimer(void)
{
	unsigned char bFinished = false;

	cout <<"isFinishedTwelveHoursTimer():"<< endl;

	cin.sync();

	cin >> bFinished;

	return 0;
}

 bool isFinishedTwentyMinTimer( void)
 {
     bool bTimerOut = false;
     cout << "isFinishedTwentyMinTimer()"<<endl;
     cin >> bTimerOut;
     return bTimerOut;
 }

 bool isFinishedOneHoursTimer(void)
 {
     bool bTimerOut = false;
     cout << "isFinishedOneHoursTimer()"<<endl;
     cin >> bTimerOut;
     return bTimerOut;
 }


void clearTwentyMinTimer( void )
{
    cout << "clearTwentyMinTimer()"<<endl;
}


void clearTwelveHoursTimer(void)
{
    cout <<" clearTweleveHoursTimer() "<<endl;
}

void startOneHoursTimer( unsigned int uiPara )
{
    cout <<" startOneHoursTimer() "<<endl;
}

void startTwentyMinTimer(unsigned int uiPara)
{
    cout << "startTwentyMinTimer();" << endl;
}


void clearTwentyHoursTimer(void)
{
    cout <<"clearTwentyMinTimer()"<<endl;
}


void startThreeHoursTimer(unsigned int uiTimeValue)
{
    cout <<"startThreeHoursTimer()"<<endl;
}

bool isFinishedThreeHoursTimer(void)
{
    bool bTimeOut = false;
    cout <<"please input running result for three hour timer"<<endl;

    cin >> bTimeOut;

    return bTimeOut;

}


void clearThreeHoursTimer(void)
{
    cout <<"clearThreeHoursTimer()"<<endl;
}


void clearAllTimer(void)
{
    cout <<"clearAllTimer();"<<endl;
}

#endif

static unsigned char calPulseWidth( void )
{
    static unsigned char ucPulseWidth = 30;

    unsigned int uiChannel2Value = 0;
    unsigned int uiNewValue = 0;
    static unsigned int uiOldValue = 0;

    static unsigned char bInitFlag = 0;

    uiNewValue = getAdOriginalCh12Value();

    if( 0 == bInitFlag )
    {
    	uiOldValue = getAdOriginalCh12Value();
    	bInitFlag = 1;
    }

//    if(uiNewValue != uiOldValue)
//    {
//    	if(uiNewValue > uiOldValue)
//    	{
//    		if((uiNewValue - uiOldValue) >= AD_CHANGE_THRESHOLD_VALUE)
//    			uiOldValue = uiNewValue;
//    		else
//    			;//do nothing,keep previous value
//    	}
//    	else
//    	{
//    		if((uiOldValue - uiNewValue) >= AD_CHANGE_THRESHOLD_VALUE)
//    			uiOldValue = uiNewValue;
//			else
//				;//do nothing,keep previous value
//    	}
//    }
//    else
//    {
//    	;//do nothing
//    }

    if( uiNewValue > 312 )
    	ucPulseWidth++;
    else
    	ucPulseWidth--;

    if(ucPulseWidth > 100)
    	ucPulseWidth = 100;
    else if(ucPulseWidth < 30)
    	ucPulseWidth = 30;
    else
    	;

    uiChannel2Value = uiOldValue;

//    if( uiChannel2Value >= 332 )
//        ucPulseWidth = 99;
//    else if( uiChannel2Value <= AD_12_CHANNEL_MIN_VALUE)
//        ucPulseWidth = 30;
//    else
//    {
//        unsigned int uiGapValue = 0;
//
//        unsigned char ucGapValue = 0;
//
//        unsigned char ucThreeTimesValue = 0;
//        unsigned char ucHalfValue = 0;
//
//        uiGapValue = uiChannel2Value - 312;
//
//        ucGapValue = uiGapValue;
//
//        ucThreeTimesValue = ucGapValue*3;
//
//        ucHalfValue = ucGapValue >> 1;
//
//        ucPulseWidth = 30 + ucThreeTimesValue +  ucHalfValue;
//
//        if(ucPulseWidth > 99)
//        	ucPulseWidth = 99;
//
//    }
#ifdef      USE_SOFTWARE_SIMULATION_TEST
    cout << (int) ucPulseWidth << endl;
#endif
    return  ucPulseWidth;
}

// #define  SET_PB4_AS_RESET_DEBUG_PIN   1

#ifdef SET_PB4_AS_RESET_DEBUG_PIN
static void chipResetDebug( void )
{
    static unsigned char ucTimerPowerLed = 0;
    if(ucTimerPowerLed < 30)
    {
        ucTimerPowerLed ++;
        PB4 = 1;
    }
    else
    {
        ucTimerPowerLed = 0;
        PB4 = 0;
    }
}
#endif

#define   TIMER_20MIN       60//1200
#define   TIMER_3HOUR       180//10800
#define   TIMER_10HOUR      240//36000
#define   TIMER_1HOUR       120//3600

#ifndef  USE_SOFTWARE_SIMULATION_TEST
#define   CONFIRMATION_COUT    5

#else
#define   CONFIRMATION_COUT    1
#endif

int main (void)
{
	enum  systemStep {
	                    INIT_STEP = 0,
	                    START_UP_PWM_STEP,
	                    CHECK_10_HOUR_TIMER_STEP,
	                    STARTUP_3_HOUR_TIMER_STEP,
	                    CHECK_3_HOUR_TIMER_STEP,
	                    STARTUP_1_HOUR_TIMER_STEP,
	                    CHECK_1_HOUR_TIMER_STEP,
	                    READY_FOR_RESET_STEP = 99,
						DELAY_ONE_SECOND_FOR_PWM,
	                    MEET_RESET_CONDITION_STEP,
	                    RESET_STEP,
	                };

	            static enum systemStep ucStep = INIT_STEP;




#ifdef      USE_SOFTWARE_SIMULATION_TEST
    cout << "!!!Hello World!!!" << endl; // prints !!!Hello World!!!
#endif





        initPin();
        setPinInitVaule();
        selectAdChannel();
#ifndef     USE_SOFTWARE_SIMULATION_TEST
        clock_config(); //ʹϵͳʱ���ȶ�
        timer1_config();
        timer1_interrupt_config();

        adc_test_init(AD_CHANNEL_12_CHANNEL,ADC_REF_2P1);//ADC��ʼ�� ͨ��12 PB0��2.1V ��ѹΪ�ο�Դ

//      dac_init(); //DAC0/1��ʼ��
//      op1_init(); //OP1��ʼ��
//      op2_init(); //OP2��ʼ��



#else
        cout << "initialization after power on" << endl;
#endif

        startTwentyMinTimer( TIMER_20MIN );
        pwm_start(PWM_DEFAULT_THIRTY_WIDTH,PWM_FREQUENCY);
        _delay(1000);
        adc_start();    //ADC����
        while(1)
        {
#ifndef USE_SOFTWARE_SIMULATION_TEST
           CLRWDT();//feed watch dog

           process_AD_Converter_Value();

       //    if(( ucStep > START_UP_PWM_STEP) && ( ucStep < READY_FOR_RESET_STEP))
      //   	    pwm_start( calPulseWidth() );
#endif
           if( isPermitSampleTime() )   // this function is called every 100ms
            {

#ifndef USE_SOFTWARE_SIMULATION_TEST
               clrSampeTime();
#endif

    #ifdef SET_PB4_AS_RESET_DEBUG_PIN
               chipResetDebug();

    #endif


            switch(ucStep)
            {

            case INIT_STEP:
            {
#ifdef USE_SOFTWARE_SIMULATION_TEST
          //      system("pause");
                cout << ucStep << endl;
#endif
                static unsigned char ucTimerP3s = 0;

                if( isFinishedTwentyMinTimer() )
                {
                    ucStep = READY_FOR_RESET_STEP;// wait to develop
                    ucTimerP3s = 0;
                }
                else
                {
                    if( getAdOriginalCh13Value() > 90 )
                    {
                        ucTimerP3s++;
                    }
                    else
                        ucTimerP3s = 0;

                    if( ucTimerP3s >= 3)
                    {
                        ucTimerP3s = 0;
                        ucStep = START_UP_PWM_STEP;
                    }

                }
#ifdef USE_SOFTWARE_SIMULATION_TEST
            //    system("pause");
#endif
                break;
            }

                case START_UP_PWM_STEP:
                {
#ifdef USE_SOFTWARE_SIMULATION_TEST
                    cout << "  case START_UP_PWM_STEP" << endl;
#endif
//                    unsigned char ucPulseWidth = 0;
//
//                    ucPulseWidth = calPulseWidth();
//
//                    pwm_start( ucPulseWidth );

                    setPB3(SET_PIN_LOW);
                    setPB4(SET_PIN_HIGH);
                    setPB5(SET_PIN_LOW);
                    clearTwentyMinTimer();
                    startTwelveHourTimer( TIMER_10HOUR); //10 hours timer
                    ucStep = CHECK_10_HOUR_TIMER_STEP;
                    break;
                }

                case CHECK_10_HOUR_TIMER_STEP:
                {
#ifdef USE_SOFTWARE_SIMULATION_TEST
                    cout << "CHECK_10_HOUR_TIMER_STEP" << endl;
               //     system("pause");
#endif
                    static unsigned char ucTimerP5s = 0;

                    if( isFinishedTwelveHoursTimer () )
                        ucStep = READY_FOR_RESET_STEP;
                    else
                    {
                        if( getAdOriginalCh13Value() < 200 )
                            ucTimerP5s++;
                        else
                            ucTimerP5s = 0;

                        if( ucTimerP5s > CONFIRMATION_COUT)
                        {
                            ucTimerP5s = 0;
                            ucStep = STARTUP_3_HOUR_TIMER_STEP;
                        }
                    }
                    break;
                }


                case STARTUP_3_HOUR_TIMER_STEP:
                {
                    clearTwelveHoursTimer();
                    startThreeHoursTimer(TIMER_3HOUR);//3 hours
                    ucStep = CHECK_3_HOUR_TIMER_STEP;
                    break;
                }

                case CHECK_3_HOUR_TIMER_STEP:
                {
                    static unsigned char ucTimerP5s = 0;

                    if( isFinishedThreeHoursTimer() )
                        ucStep = READY_FOR_RESET_STEP;
                    else
                    {
                        if( getAdOriginalCh13Value() < 85 )
                            ucTimerP5s++;
                        else
                            ucTimerP5s = 0;

                        if( ucTimerP5s > CONFIRMATION_COUT)
                        {
                            ucTimerP5s = 0;
                            ucStep = STARTUP_1_HOUR_TIMER_STEP;
                        }
                    }
                    break;
                }

                case STARTUP_1_HOUR_TIMER_STEP:
                {
                    clearThreeHoursTimer();
                    startOneHoursTimer( TIMER_1HOUR );
                    setPB3(SET_PIN_HIGH);
                    setPB4(SET_PIN_LOW);
                    setPB5(SET_PIN_HIGH);
                    ucStep = CHECK_1_HOUR_TIMER_STEP;
                    break;
                }

                case CHECK_1_HOUR_TIMER_STEP:
                {

#ifdef USE_SOFTWARE_SIMULATION_TEST
                    cout << " case CHECK_1_HOUR_TIMER_STEP: " << endl;
#endif
                    static unsigned int uiTimerOneP5s = 0;
                    static unsigned int uiTimerTwoP5s = 0;
                    static unsigned int uiTimerThreeP5s = 0;

                    unsigned int uiCh13Value = getAdOriginalCh13Value();


                    if( isFinishedOneHoursTimer() )
                        ucStep = READY_FOR_RESET_STEP;
                    else
                    {
                        if( uiCh13Value > 100 )
                        {
                            if( uiTimerOneP5s <= CONFIRMATION_COUT )
                                uiTimerOneP5s++;
                            uiTimerTwoP5s = 0; // need clear it because value is less than 25.
                            uiTimerThreeP5s = 0;
                        }
                        else
                        {
                            uiTimerOneP5s = 0;
                        }


                        if(uiTimerOneP5s > CONFIRMATION_COUT)
                        {
                            setPB3(SET_PIN_LOW);
                            setPB4(SET_PIN_HIGH);
                            setPB5(SET_PIN_LOW);

                            uiTimerOneP5s = 0;
                            uiTimerTwoP5s = 0;
                        }
                        else
                        {
                            if( uiCh13Value < 90 )
                            {
                                if( uiTimerTwoP5s <= CONFIRMATION_COUT)
                                    uiTimerTwoP5s++;
                            }
                            else
                            {
                                uiTimerTwoP5s = 0;
                                uiTimerThreeP5s = 0;//in this case ,value of AD is more than 25, so clear this timer
                            }

                            if(uiTimerTwoP5s > CONFIRMATION_COUT)
                            {
                                setPB3(SET_PIN_HIGH);
                                setPB4(SET_PIN_LOW);
                                setPB5(SET_PIN_HIGH);

                                if(uiCh13Value < 25)
                                    uiTimerThreeP5s++;
                                else
                                    uiTimerThreeP5s = 0;

                                if(uiTimerThreeP5s > CONFIRMATION_COUT)
                                    reset();
                            }

                        }
                    }
                    break;
                }

                case READY_FOR_RESET_STEP:
                {
                    setPB3(SET_PIN_LOW);
                    setPB4(SET_PIN_LOW);
                    setPB5(SET_PIN_HIGH);
                  //  pwm_config(0);
  //                  pwm_start(60);// need to set 60% pulse width
                 //   pwm_config(1);
                    ucStep = DELAY_ONE_SECOND_FOR_PWM;
                    break;
                }

                case DELAY_ONE_SECOND_FOR_PWM:
                {
                	static unsigned ucDelay1s = 0;
                	if(ucDelay1s < 10)
                		ucDelay1s++;
                	else
                	{
                		ucDelay1s = 0;
                		ucStep = MEET_RESET_CONDITION_STEP;
                	}

#ifdef USE_SOFTWARE_SIMULATION_TEST
                	cout << (int) (ucDelay1s) <<endl;
#endif
                	break;
                }

                case MEET_RESET_CONDITION_STEP:
                {
                    static unsigned char ucTimerP5s = 0;
                    unsigned int ucChValue = getAdOriginalCh13Value();

                    if( ucChValue > 50 )
                        ucTimerP5s++;
                    else
                        ucTimerP5s = 0;

                    if(ucTimerP5s > CONFIRMATION_COUT)
                        ucStep = RESET_STEP;
                    break;
                }

                case RESET_STEP:
                {
                    ucStep = INIT_STEP;
                    reset();
                    break;
                }


                default:
                    break;
            }

            }
        }
//  return 0;
}
