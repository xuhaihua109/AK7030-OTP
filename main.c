//////////////////////////////////////////////////////////////////////////////////
//               【程序说明】：DAC0输出VCC*25/64=1.3V通过OP1放大从PB5输出           //
//                             DAC1输出VCC*6/64=0.3V通过OP2放大从PA7输出            //
//////////////////////////////////////////////////////////////////////////////////


///////////////////////////////////////////////////////////////////////////////////////////////////////////
//  【程序说明】：本程序将OP1和OP2配置成放大器,将同相端的输入电压进行放大。                                  //
//                                                                                                       //
//                                  同相端（IN+）   反相端(IN-)         输出(VO)        增益                         //
//                      OP1          PB3               PB4              PB5     1+R2/R1                  //
//                      OP2          PB6               PB7              PA7      8                       //
//                                                                                                       //
//                      OP1需要配合外部电阻进行放大,放大倍数    Av=1+R2/R1                                   //
//                      R1为A1N(PB4)与AVSS间电阻,R2为A1E(PB5)与A1N(PB4)间电阻                                //
//                      具体配置见datasheet;                                                                 //
///////////////////////////////////////////////////////////////////////////////////////////////////////////


//#define    USE_SOFTWARE_SIMULATION_TEST                1


#define    TIMR_CONDITION_OK   1


#define  SET_PIN_AS_OUTPUT   0
#define  SET_PIN_AS_INPUT    1

#define  SET_PIN_HIGH    1
#define  SET_PIN_LOW     0


#define  LETE_BRANCH_COMMON_STAY_TIME     1



#ifndef USE_SOFTWARE_SIMULATION_TEST

#define _XTAL_FREQ 20000000

#include <stdio.h>
#include "yn8p520.h"    //系统头文件
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


//调试说明：
//DAC0输出VCC*25/64=1.3V通过OP1缓冲从PB5输出
//DAC1输出VCC*6/64 =0.3V通过OP2缓冲从PA7输出


/***************************************************************************
*   常用配置字功能说明：
*
*   IO_MODE16   :为芯片封装信息 可设为IO_MODE8/16/18 分别对应SOP8/16/18
*   WDTE_OFF        :看门狗关闭 打开时改为WDT_ON
*   OTP_MOD4K   ：为芯片烧写模式 总空间为4K,可设置为OTP_MOD1/2/4K分别为
*                     每次烧录使用空间占用1/2/4K,当程序较小时可用于设置多次烧录
*                       相应芯片型号如上说明
*   OTP_4K_0        ：OTP_mK_n 在mK模式下第n个空间  m(1/2/4) 烧写时 n值需从0开始
*                       4K只可设为0 2K可设为0/1/2 1K可设为 0/1/2/3
*   FOSC_RC20M  ：系统时钟选择 可设为
*                       配置        ：  FOSC_RC20M FOSC_RC10M FOSC_RC10M FOSC_RC5M  FOSC_RC1P25M
*                       对应时钟    ：          20MHZ       10MHZ           5MHZ          2.5MHZ            1.25MHZ
*   WDTPS_128   ：看门狗定时器时钟分频
*
*
*   注意：1.配置字若无特别需求请勿修改；
*           2.其他配置字及相应功能见Datasheet及头文件；
*           2.仿真器支持20M时钟模式，且无上下拉电阻测试时应注意；
*
****************************************************************************/
#ifndef USE_SOFTWARE_SIMULATION_TEST

#define CONFIG1 IO_MODE8   & PWRTE_ON   & LVTEN_ON    & WDTE_ON    &  RDSEL_ON & SMT_ON
#define CONFIG2 OTP_MOD4K  & BOR26V      & FOSC_RC20M  & RESETE_OFF
#define CONFIG3 OTP_4K_0  & WDTPS_8   & SUT_ON      & SUT_0


__CONFIG(CONFIG1);
__CONFIG(CONFIG2);
__CONFIG(CONFIG3);

#define SLEEP_PWIDLE() SMCR = 0X01; SLEEP()
#define SLEEP_PWSAVE() SMCR = 0X07; SLEEP()
#define SLEEP_PWADC()  SMCR = 0X05; SLEEP()
#define SLEEP_PWOFF()  SMCR = 0X09; SLEEP()

#endif

//#define CHANGE_PIN_DEFINAITION   1



void initPB3(unsigned char bValue)
{
    if( bValue )
#ifndef USE_SOFTWARE_SIMULATION_TEST
    //    TRISB3 = 1;
    	TRISB0 = 1;
#else
       cout <<"set PB3 as input pin."<<endl;
#endif
    else
#ifndef USE_SOFTWARE_SIMULATION_TEST
    //    TRISB3 = 0;
    	TRISB0 = 0;
#else
       cout <<"set PB3 as output pin."<<endl;
#endif
}


void setPB3(unsigned char bValue)
{
    if( bValue )
#ifndef USE_SOFTWARE_SIMULATION_TEST
    //    PB3 = 1;
    	PB0 = 1;
#else
       cout <<"set PB3 output 1"<<endl;
#endif
    else
#ifndef USE_SOFTWARE_SIMULATION_TEST
      //  PB3= 0;
    	PB0 = 0;
#else
       cout <<"set PB3 output 0"<<endl;
#endif
}



void initPB4(unsigned char bValue)
{
    if( bValue )
#ifndef USE_SOFTWARE_SIMULATION_TEST
    //    TRISB4 = 1;
    	TRISB3 = 1;
#else
       cout <<"set PB4 as input pin."<<endl;
#endif
    else
#ifndef USE_SOFTWARE_SIMULATION_TEST
      //  TRISB4= 0;
    	TRISB3 = 0;
#else
       cout <<"set PB4 as output pin."<<endl;
#endif
}


void setPB4(unsigned char bValue)
{
    if( bValue )
#ifndef USE_SOFTWARE_SIMULATION_TEST
      //  PB4 = 1;
    	PB3 = 1;
#else
       cout <<"set PB4 output 1."<<endl;
#endif
    else
#ifndef USE_SOFTWARE_SIMULATION_TEST
      //  PB4= 0;
    	PB3 = 0;
#else
       cout <<"set PB4 as output 0."<<endl;
#endif
}


void initPB5(unsigned char bValue)
{
    if( bValue )
#ifndef USE_SOFTWARE_SIMULATION_TEST
     //   TRISB5 = 1;
    	TRISB1 = 1;
#else
       cout <<"set PB5 as input pin."<<endl;
#endif
    else
#ifndef USE_SOFTWARE_SIMULATION_TEST
     //   TRISB5= 0;
    	 TRISB1= 0;
#else
       cout <<"set PB5 as output pin."<<endl;
#endif
}


void setPB5(unsigned char bValue)
{
    if( bValue )
#ifndef USE_SOFTWARE_SIMULATION_TEST
     //   PB5 = 1;
    	PB1 = 1;

#else
       cout <<"set PB5 output 1."<<endl;
#endif
    else
#ifndef USE_SOFTWARE_SIMULATION_TEST
     //   PB5= 0;
    	PB1 = 0;
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


//pwm初始化
void pwm_start( unsigned char ucPulseWidth,unsigned char ucPulseFrequency)
{
#ifndef     USE_SOFTWARE_SIMULATION_TEST
	CCP1CON&= 0xf0;//disable PWM

    T2CON=0x04;         //使能T2，后分频值1 预分频值1
    PR2 = ucPulseFrequency;           //T2周期寄存器，   100kHZ f=20M/(4*(PR2+1))
    CCPR1L = ucPulseWidth;      //pwm高8位  占空比50% =【CCPR1L:CCP1CON[5:4]】/((PR2+1)*4)
    CCP1CON=0x00;       //外部CCP1引脚输入  pwm低两位为00，启动 PWM模式， e PWM 默认输出为 1, d 0

    TRISB2=0;           //pb2设为输出
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
    TRISB4 = 1; //AD 12 CHANNEL
    TRISB5 = 1; // AD 13 CHANNEL
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


static void resetAllTimer()
{
	clearTwelveHoursTimer();
	clearThreeHoursTimer();
	clearOneHoursTimer();
	clearTwentyMinTimer();
}

//#define USE_DEDUG_TIMER   1

#ifndef  USE_DEDUG_TIMER
#define   TIMER_20MIN       1200
#define   TIMER_3HOUR       10800
#define   TIMER_10HOUR      36000
#define   TIMER_1HOUR       3600
#else
#define   TIMER_20MIN       60
#define   TIMER_3HOUR       180
#define   TIMER_10HOUR      240
#define   TIMER_1HOUR       120

#endif
#ifndef  USE_SOFTWARE_SIMULATION_TEST

#else
#define   CONFIRMATION_COUT    1
#endif


#define   CONFIRMATION_COUT_0P5_SECOND    50
#define   CONFIRMATION_COUT_0P3_SECOND    30
#define   CONFIRMATION_COUT_0P2_SECOND    20
#define   CONFIRMATION_COUT_0P1_SECOND    10


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
        clock_config(); //使系统时钟稳定
        timer1_config();
        timer1_interrupt_config();
        op1_init(); //OP1初始化

        uid_get();	//获取校准电压

        adc_test_init(AD_CHANNEL_12_CHANNEL,ADC_REF_OP1);//ADC初始化 通道12 PB0，2.1V 电压为参考源

//      dac_init(); //DAC0/1初始化
//      op1_init(); //OP1初始化
//      op2_init(); //OP2初始化

        startTwentyMinTimer( TIMER_20MIN );
		_delay(1000);
		adc_start();    //ADC启动


#else
        cout << "initialization after power on" << endl;
#endif


        while(1)
        {
#ifndef USE_SOFTWARE_SIMULATION_TEST
           CLRWDT();//feed watch dog

           process_AD_Converter_Value();
#endif
           if( isPermitSampleTime() )   // this function is called every 100ms
            {

#ifndef USE_SOFTWARE_SIMULATION_TEST
               clrSampeTime();
#endif

    #ifdef SET_PB4_AS_RESET_DEBUG_PIN
               chipResetDebug();

    #endif

#define      INIT_STEP_CH13_AD_VALUE                         145 // 90
#define      CHECK_10_HOUR_TIMER_STEP_CH13_AD_VALUE          322 //200
#define      CHECK_3_HOUR_TIMER_STEP_CH13_AD_VALUE           105 //65
#define      CHECK_1_HOUR_TIMER_STEP_CH13_AD_VALUE_FIRST           145// 90
#define      CHECK_1_HOUR_TIMER_STEP_CH13_AD_VALUE_SECOND           105// 65
#define      MEET_RESET_CONDITION_STEP_CH13_AD_VALUE         81 //50

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
                    if( getAdOriginalCh13Value() > INIT_STEP_CH13_AD_VALUE) //90 )
                    {
                        ucTimerP3s++;
                    }
                    else
                        ucTimerP3s = 0;

                    if( ucTimerP3s >= CONFIRMATION_COUT_0P3_SECOND)
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
                    cout <<"pwm_start(PWM_DEFAULT_THIRTY_WIDTH,PWM_FREQUENCY);"<<endl;
#else
                    pwm_start(PWM_SIXTY_WIDTH,PWM_FREQUENCY);
#endif
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
                        if( getAdOriginalCh13Value() < CHECK_10_HOUR_TIMER_STEP_CH13_AD_VALUE) //200 )
                            ucTimerP5s++;
                        else
                            ucTimerP5s = 0;

                        if( ucTimerP5s >= CONFIRMATION_COUT_0P1_SECOND)
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
                        if( getAdOriginalCh13Value() < CHECK_3_HOUR_TIMER_STEP_CH13_AD_VALUE) //65 )
                            ucTimerP5s++;
                        else
                            ucTimerP5s = 0;

                        if( ucTimerP5s >= CONFIRMATION_COUT_0P1_SECOND)
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
                        if( uiCh13Value > CHECK_1_HOUR_TIMER_STEP_CH13_AD_VALUE_FIRST)//90 )
                        {
                            if( uiTimerOneP5s <= CONFIRMATION_COUT_0P1_SECOND )
                                uiTimerOneP5s++;
                            uiTimerTwoP5s = 0; // need clear it because value is less than 25.
                            uiTimerThreeP5s = 0;
                        }
                        else
                        {
                            uiTimerOneP5s = 0;
                        }


                        if(uiTimerOneP5s > CONFIRMATION_COUT_0P1_SECOND)
                        {
                            setPB3(SET_PIN_LOW);
                            setPB4(SET_PIN_HIGH);
                            setPB5(SET_PIN_LOW);

                            uiTimerOneP5s = 0;
                            uiTimerTwoP5s = 0;

                            resetAllTimer();

                            ucStep = START_UP_PWM_STEP;
                        }
                        else
                        {
                            if( uiCh13Value < CHECK_1_HOUR_TIMER_STEP_CH13_AD_VALUE_SECOND)// 65 )
                            {
                           // 	PB4 = 1;
                                if( uiTimerTwoP5s <= CONFIRMATION_COUT_0P1_SECOND)
                                    uiTimerTwoP5s++;
                            }
                            else
                            {
                                uiTimerTwoP5s = 0;
                                uiTimerThreeP5s = 0;//in this case ,value of AD is more than 25, so clear this timer
                            }

                            if(uiTimerTwoP5s > CONFIRMATION_COUT_0P1_SECOND)
                            {
                                setPB3(SET_PIN_HIGH);
                                setPB4(SET_PIN_LOW);
                                setPB5(SET_PIN_HIGH);

//                                if(uiCh13Value < 25)
//                                    uiTimerThreeP5s++;
//                                else
//                                    uiTimerThreeP5s = 0;
//
//                                if(uiTimerThreeP5s > CONFIRMATION_COUT_0P3_SECOND)
//                                {
//                                    reset();
//                                }
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
#ifndef USE_SOFTWARE_SIMULATION_TEST
                    setWaitResetFlag(TRUE);
                    pwm_start(PWM_SIXTY_WIDTH,PWM_FREQUENCY);
               //     pwm_start(PWM_SIXTY_WIDTH,PWM_FREQUENCY);
#else
                    cout <<"pwm_start(PWM_SIXTY_WIDTH,PWM_FREQUENCY);"<<endl;
#endif
                 //   pwm_config(1);
                    ucStep = DELAY_ONE_SECOND_FOR_PWM;
                    break;
                }

                case DELAY_ONE_SECOND_FOR_PWM:
                {
                	static unsigned ucDelay1s = 0;
                	if(ucDelay1s <= CONFIRMATION_COUT_0P5_SECOND)
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

                    if( ucChValue > MEET_RESET_CONDITION_STEP_CH13_AD_VALUE)//50 )
                        ucTimerP5s++;
                    else
                        ucTimerP5s = 0;

                    if(ucTimerP5s >= CONFIRMATION_COUT_0P5_SECOND)
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
