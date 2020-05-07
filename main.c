


//#define    USE_SOFTWARE_SIMULATION_TEST                1


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


#ifndef USE_SOFTWARE_SIMULATION_TEST

#define _XTAL_FREQ 20000000

#include <stdio.h>
#include "yn8p520.h"    //系统头文件
#include "common.h"
#include "periph.h"

#pragma inline(_delay)
extern void _delay(unsigned long);
#define __delay_us(x) _delay((unsigned long)((x)*(_XTAL_FREQ/4000000.0)))
#else
#include <iostream>
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

#define CONFIG1 IO_MODE16   & PWRTE_ON   & LVTEN_ON    & WDTE_ON    &  RDSEL_ON & SMT_ON
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




#ifndef USE_SOFTWARE_SIMULATION_TEST
static void clearAllTimer(void)
{
    clearTwelveHoursTimer();
    clearThreeHoursTimer();
    clearTwentySecondsTimer();
    clearTwentyMinuteTimer();
}
#endif


static void clearPinPortAndTimer(void)
{
#ifndef     USE_SOFTWARE_SIMULATION_TEST
    PB0 = 0;
    PA0 = 0;
    PA1 = 0;
    PA2 = 0;
    PA3 = 0;
//  PAOD7 = 0;
//  PA7 = 0;
    PBOD7 = 0;
    PB7 = 0;
    clearAllTimer();
#else
    cout << "clearPinPortAndTimer(void)" << endl;
#endif
}


static void initPin(void)
{
#ifndef     USE_SOFTWARE_SIMULATION_TEST

    TRISB0 = 0; //SET PA0,PA1,PA2,PA3 as output
    PB0 = 0;
    TRISB1 = 0;
    PB1 = 0;
    TRISB2 = 0;
    PB2 = 0;
    TRISA0 = 0;
    PA0 = 0;
    TRISA1 = 0;
    PA1 = 0;
    TRISA2 = 0;
    PA2 = 1;

    TRISA3 = 0;
    PA3 = 0;
    TRISB4 = 0;
    PB4 = 0;
    TRISB7 = 0;
    PB7 = 0;

    TRISB6 = 1;// input

//  PB6 = 1;
//  PBOD6 = 1; //set PB6 as high resistance

#else
    cout << "initPin(void)" << endl;
#endif

}



void setPB0(unsigned char bValue)
{
    if( bValue )
#ifndef USE_SOFTWARE_SIMULATION_TEST
        PB0 = 1;
#else
       cout <<"PB0 = 1;"<<endl;
#endif
    else
#ifndef USE_SOFTWARE_SIMULATION_TEST
        PB0 = 0;
#else
       cout <<"PB0 = 0;"<<endl;
#endif
}


void setPB1(unsigned char bValue)
{
    if( bValue )
#ifndef USE_SOFTWARE_SIMULATION_TEST
        PB1 = 1;
#else
       cout <<"PB1 = 1;"<<endl;
#endif
    else
#ifndef USE_SOFTWARE_SIMULATION_TEST
        PB1 = 0;
#else
       cout <<"PB1 = 0;"<<endl;
#endif
}


void setPB2(unsigned char bValue)
{
    if( bValue )
#ifndef USE_SOFTWARE_SIMULATION_TEST
        PB2 = 1;
#else
       cout <<"PB2 = 1;"<<endl;
#endif
    else
#ifndef USE_SOFTWARE_SIMULATION_TEST
        PB2 = 0;
#else
       cout <<"PB2 = 0;"<<endl;
#endif
}


void setPA0(unsigned char bValue)
{
    if( bValue )
#ifndef USE_SOFTWARE_SIMULATION_TEST
        PA0 = 1;
#else
       cout <<"PA0 = 1;"<<endl;
#endif
    else
#ifndef USE_SOFTWARE_SIMULATION_TEST
        PA0 = 0;
#else
       cout <<"PA0 = 0;"<<endl;
#endif
}


void setPA1(unsigned char bValue)
{
    if( bValue )
#ifndef USE_SOFTWARE_SIMULATION_TEST
        PA1 = 1;
#else
       cout <<"PA1 = 1;"<<endl;
#endif
    else
#ifndef USE_SOFTWARE_SIMULATION_TEST
        PA1 = 0;
#else
       cout <<"PA1 = 0;"<<endl;
#endif
}



void setPA2(unsigned char bValue)
{
    if( bValue )
#ifndef USE_SOFTWARE_SIMULATION_TEST
        PA2 = 1;
#else
       cout <<"PA2 = 1;"<<endl;
#endif
    else
#ifndef USE_SOFTWARE_SIMULATION_TEST
        PA2 = 0;
#else
       cout <<"PA2 = 0;"<<endl;
#endif
}


void setPA3(unsigned char bValue)
{
    if( bValue )
#ifndef USE_SOFTWARE_SIMULATION_TEST
        PA3 = 1;
#else
       cout <<"PA3 = 1;"<<endl;
#endif
    else
#ifndef USE_SOFTWARE_SIMULATION_TEST
        PA3 = 0;
#else
       cout <<"PA3 = 0;"<<endl;
#endif
}


void setPB6(unsigned char bValue)
{
    if( bValue )
#ifndef USE_SOFTWARE_SIMULATION_TEST
    {
        TRISB6 = 0;
        PB6 = 1;
    }
#else
       cout <<"PB6 = 1;"<<endl;
#endif
    else
#ifndef USE_SOFTWARE_SIMULATION_TEST
    {
        TRISB6 = 0;
        PB6 = 0;
    }
#else
       cout <<"PB6 = 0;"<<endl;
#endif
}



void setPB4(unsigned char bValue)
{
    if( bValue )
#ifndef USE_SOFTWARE_SIMULATION_TEST
        PB4 = 1;
#else
       cout <<"PB4 = 1;"<<endl;
#endif
    else
#ifndef USE_SOFTWARE_SIMULATION_TEST
        PB4 = 0;
#else
       cout <<"PB4 = 0;"<<endl;
#endif
}


void setPB7(unsigned char bValue)
{
    if( bValue )
#ifndef USE_SOFTWARE_SIMULATION_TEST
    {
        PBOD7 = 1;
        PB7 = 1;
    }
#else
    {
       cout <<"PBOD7 = 1;"<<endl;
       cout <<"PB7 = 1;"<<endl;
    }
#endif
    else
#ifndef USE_SOFTWARE_SIMULATION_TEST
    {
        PBOD7 = 0;
        PB7 = 0;
    }
#else
    {
    cout <<"PBOD7 = 0;"<<endl;
    cout <<"PB7 = 0;"<<endl;
    }
#endif
}


void setPA6(unsigned char bValue)
{
    if( bValue )
#ifndef USE_SOFTWARE_SIMULATION_TEST
        PA6 = 1;
#else
       cout <<"PA6 = 1;"<<endl;
#endif
    else
#ifndef USE_SOFTWARE_SIMULATION_TEST
        PA6= 0;
#else
       cout <<"PA6 = 0;"<<endl;
#endif
}

void setPB6AsInput(void)
{
#ifndef USE_SOFTWARE_SIMULATION_TEST
        TRISB6 = 1;
#else
        cout <<"TRISB6 = 1;"<<endl;
#endif

}

#ifdef USE_SOFTWARE_SIMULATION_TEST
bool isPermitSampleTime(void)
{
//  unsigned int firstVariable = 0, secondVariable = 0;
//
//  bool bCompareResult = false;
//
//  cout <<"please input value of firstVariable: "<<endl;
//
//  cin >> firstVariable;
//
//  cout <<"please input value of secondVariable: "<<endl;
//
//  cin >> secondVariable;
//
//  if(secondVariable > firstVariable)
//      bCompareResult = true;
//  else
//      bCompareResult = false;
//
//  if(bCompareResult)
//      cout << "The condition is OK " << endl;
//  else
//      cout << "The condition is NG" << endl;

//  return bCompareResult;

    static unsigned int uiCounter = 0;

    uiCounter++;

    cout << uiCounter << ";" << endl;


    return true;

}


unsigned int getAdOriginalCh6Value(void)
{
    unsigned int uiCh6Value = 0;

    cout <<"please input value of ch6:"<<endl;

    cin >> uiCh6Value;

    return uiCh6Value;

}



unsigned int getAdOriginalCh0Value(void)
{
    unsigned int uiCh0Value = 0;

    cout <<"please input value of ch0:"<<endl;

    cin >> uiCh0Value;

    return uiCh0Value;

}


unsigned int getAdOriginalCh5Value(void)
{
    unsigned int uiCh5Value = 0;

    cout <<"please input value of ch5:"<< endl;

    cin >> uiCh5Value;

    return uiCh5Value;
}



unsigned int getAdOriginalCh2Value(void)
{
    unsigned int uiCh2Value = 0;

    cout <<"please input value of ch2:"<< endl;

    cin >> uiCh2Value;

    return uiCh2Value;
}



void startTwelveHourTimer(unsigned int uiTimeValue)
{
    cout << "startTwelveHourTimer(unsigned int uiTimeValue)" <<endl;
}


bool isFinishedTwelveHoursTimer(void)
{
    static bool bTimerOut = false;

    static bool bInit = 0;

    cout << "please input running result for ten hour timer" <<endl;

    if(!bInit)
    {
        cin >> bTimerOut;
        bInit = 1;
    }
    return bTimerOut;

}


void startTwentySecondsTimer( void )
{
    cout <<" startTwentySecondTimer() "<<endl;
}


void startTwentyMinuteTimer( unsigned char ucValue )
{
    cout <<" startTwentyMinuteTimer() "<<endl;
}


bool isFinishedTwentySecondsTimer(void)
{
    bool bTimeOut = false;

    cout << "please input running result for twenty seconds timer: "<< endl;

    cin >> bTimeOut;

    return bTimeOut;
}


bool isFinishedTwentyMinuteTimer(void)
{
    bool bTimeOut = false;

    cout << "please input running result for twenty minute timer: "<< endl;

    cin >> bTimeOut;

    return bTimeOut;
}

void clearTwentySecondsTimer(void)
{
    cout <<"clearTwentySecondsTimer()"<<endl;
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


#define   TEN_HOUR_TIMER         36000
#define   THREE_HOUR_TIMER       10800
#define   TWENTY_MINUTE_TIMER    1200

#define  LETE_BRANCH_COMMON_STAY_TIME     1

#define    TRUE   1
#define    FALSE  0




void clearParaFunction1(void)
{
    setPA1(0);
    setPA0(0);

    setPB0(0);
    setPB1(0);
    setPB2(0);

    clearAllTimer();

    setPA3(0);
    setPB4(0);
}

#ifndef USE_SOFTWARE_SIMULATION_TEST
#define     TIMER_CNT_ZERO_POINT_ONE_SECOND              1
#define     TIMER_CNT_ZERO_POINT_TWO_SECOND              2
#define     TIMER_CNT_ZERO_POINT_THREE_SECOND            3
#define     TIMER_CNT_ZERO_POINT_FIVE_SECOND             5
#define     TIMER_CNT_ZERO_POINT_EIGHT_SECOND            8
#define     TIMER_CNT_ONE_SECOND                         10
#else
#define     TIMER_CNT_ZERO_POINT_ONE_SECOND              1
#define     TIMER_CNT_ZERO_POINT_TWO_SECOND              1
#define     TIMER_CNT_ZERO_POINT_THREE_SECOND            1
#define     TIMER_CNT_ZERO_POINT_FIVE_SECOND             1
#define     TIMER_CNT_ZERO_POINT_EIGHT_SECOND            1
#define     TIMER_CNT_ONE_SECOND                         1
#endif


enum setp_Adc4
{
    ADC4_STEP_INIT = 0,
    ADC4_STEP_FIRST,
    ADC4_STEP_SECOND,
    ADC4_STEP_THIRD,
    ADC4_STEP_FOURTH_PREFIX1,
    ADC4_STEP_FOURTH_PREFIX2,
    ADC4_STEP_FOURTH_PREFIX3,
    ADC4_STEP_FOURTH_PREFIX4,
    ADC4_STEP_FOURTH_PREFIX5,
    ADC4_STEP_FOURTH_PREFIX6,
    ADC4_STEP_FOURTH,
    ADC4_STEP_FOURTH_SUFFIX1,
    ADC4_STEP_FOURTH_SUFFIX2,
    ADC4_STEP_FIFTH,
    ADC4_STEP_SIXTH,
};


enum AD_CHANNEL_4_VALUE_PATH
        {
            LESS_THAN_1911 = 0,
            BETWEEN_1911_AND_2067,
            BETWEEN_2067_AND_2204,
            BETWEEN_2204_AND_2340,
            MORE_THAN_2340,
        };

        enum MAIN_LOOP_STEP
        {
            MAIN_LOOP_STEP_INIT = 0,
            MAIN_LOOP_STEP_FIRST,
            MAIN_LOOP_STEP_SECOND,
            MAIN_LOOP_STEP_THIRD,
            MAIN_LOOP_STEP_FOURTH,
            MAIN_LOOP_STEP_FIFTH,
            MAIN_LOOP_STEP_SIXTH,
            MAIN_LOOP_STEP_SEVENTH,
            MAIN_LOOP_STEP_3_HOUR_BRANCH,
            MAIN_LOOP_STEP_10_HOUR_END,
        };


static enum MAIN_LOOP_STEP  enumMainLoopStep = MAIN_LOOP_STEP_INIT;

static enum AD_CHANNEL_4_VALUE_PATH ucChannel5Type = LESS_THAN_1911;


static enum setp_Adc4 ucADC4_Step = ADC4_STEP_INIT;


void vHandle20sTimeron();
void vHandle20sTimerOut(unsigned char bClearStep);

#ifdef USE_SOFTWARE_SIMULATION_TEST
int main (void)
#else
void main(void)
#endif
{

#ifdef      USE_SOFTWARE_SIMULATION_TEST
    cout << "!!!Hello World!!!" << endl; // prints !!!Hello World!!!
#endif





        static unsigned char bCheckTweHour = 0;



#ifndef     USE_SOFTWARE_SIMULATION_TEST

        initPin();


        TRISB3 = 1;//SET AD sample Channel 0

        TRISB5 = 1;// set AD sample channel 4

        TRISA7 = 1;// set AD sample Channel 5

        TRISA6 = 1;// set AD sample Channel 6

        clock_config(); //使系统时钟稳定
        timer1_config();
        timer1_interrupt_config();

        adc_test_init(AD_CHANNEL_0_CHANNEL,ADC_REF_2P1);//ADC初始化 通道0 PB3，2.1V 电压为参考源

//      dac_init(); //DAC0/1初始化
        op1_init(); //OP1初始化
//      op2_init(); //OP2初始化


        adc_start();    //ADC启动
#else
        cout << "initialization after power on" << endl;
#endif





    #ifdef SET_PB1_AS_RESET_DEBUG_PIN
        static unsigned char ucTimerPowerLed = FALSE;
    #endif

        startTwentyMinuteTimer(TWENTY_MINUTE_TIMER);

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

    #ifdef SET_PB1_AS_RESET_DEBUG_PIN
            if(ucTimerPowerLed < 30)
            {
                ucTimerPowerLed ++;
            }
            else
            {
            ucTimerPowerLed = 0;
            PB1 = 0;
            }
    #endif

               switch(enumMainLoopStep)
               {
                   case MAIN_LOOP_STEP_INIT:
                    {

#ifdef USE_SOFTWARE_SIMULATION_TEST
                        cout <<"I am in MAIN_LOOP_STEP_INIT "<<endl;
#endif
                        static unsigned char ucTimerZeroPoint5s = 0;

                        if(getAdOriginalCh0Value() <= 1950)//  AD value -> 2v
                        {
                            ucTimerZeroPoint5s++;
                        }
                        else
                            ucTimerZeroPoint5s = 0;

                        if(ucTimerZeroPoint5s >= TIMER_CNT_ZERO_POINT_FIVE_SECOND) //5*100ms = 0.5s
                        {
                            ucTimerZeroPoint5s = 0;
                            enumMainLoopStep = MAIN_LOOP_STEP_FIRST;
                        }

                        if(isFinishedTwentyMinuteTimer())
                            enumMainLoopStep =  MAIN_LOOP_STEP_10_HOUR_END;//jump
                        break;
                    }

                   case MAIN_LOOP_STEP_FIRST:
                    {

#ifdef USE_SOFTWARE_SIMULATION_TEST
                        cout <<"I am in MAIN_LOOP_STEP_FIRST "<<endl;
#endif
                        static unsigned char ucTimerZeroPoint3s = 0;

                        static unsigned char ucTimerCntP3s = 0;


                        if(getAdOriginalCh0Value() <= 1950)// AD value -> 2v
                        {
                            ucTimerCntP3s++;
                            if(ucTimerCntP3s >= TIMER_CNT_ZERO_POINT_THREE_SECOND)
                            {
                                ucTimerCntP3s = 0;

                                enumMainLoopStep = MAIN_LOOP_STEP_SECOND;

                                ucTimerZeroPoint3s = 0;
                            }

                        }
                        else   // AD0 >= 1950 && timer > 0.3s
                        {
                            ucTimerZeroPoint3s++;

                            if(ucTimerZeroPoint3s >= TIMER_CNT_ZERO_POINT_THREE_SECOND)//
                            {
                                ucTimerZeroPoint3s = 0;

                                clearParaFunction1();
                            }
                        }

                        break;
                    }

                    case MAIN_LOOP_STEP_SECOND:
                    {

#ifdef USE_SOFTWARE_SIMULATION_TEST
                        cout <<"I am in MAIN_LOOP_STEP_SECOND "<<endl;
#endif
                        static unsigned char ucTimerP5s = 0;

                        setPA3(1);
                        setPB4(1);

                        if(ucTimerP5s < TIMER_CNT_ZERO_POINT_FIVE_SECOND)
                            ucTimerP5s++;
                        else
                        {
                            ucTimerP5s = 0;

                            startTwentyMinuteTimer(TWENTY_MINUTE_TIMER);

                            enumMainLoopStep = MAIN_LOOP_STEP_THIRD;
                        }

                        break;
                    }

                    case MAIN_LOOP_STEP_THIRD:
                    {

#ifdef USE_SOFTWARE_SIMULATION_TEST
                        cout <<"I am in MAIN_LOOP_STEP_THIRD "<<endl;
#endif
                        static unsigned char ucTimerLessZeroP5s = 0;

                        static unsigned char ucTimerLargeZeroP5s = 0;


                        static unsigned char ucTimerRightP5s = 0;

                        if(getAdOriginalCh6Value() <= 85)
                        {
                            ucTimerLargeZeroP5s = 0;

                            ucTimerLessZeroP5s++;  // looking for questions，need consider AD1 value is again more than 130  after less than 130
                        }
                        else
                        {
                            ucTimerLargeZeroP5s++;

                            ucTimerLessZeroP5s = 0;

                            ucTimerRightP5s = 0;
                        }

                        if(ucTimerLargeZeroP5s >= TIMER_CNT_ZERO_POINT_THREE_SECOND) //AD6 > 85 && timer >= 0.3s
                        {
                            ucTimerLargeZeroP5s = 0;
                            enumMainLoopStep = MAIN_LOOP_STEP_FOURTH;
                        }
                        else if( ucTimerLessZeroP5s >= TIMER_CNT_ZERO_POINT_THREE_SECOND) //AD6 <= 85 && timer >= 0.3s
                        {

                            if(getAdOriginalCh6Value() < 65)//????// wait to be determined.
                            {
                                ucTimerRightP5s++;
                            }
                            else
                            {
                                ucTimerRightP5s = 0;
                            }

                            if(ucTimerRightP5s >= TIMER_CNT_ZERO_POINT_THREE_SECOND) //AD6 <65 && TIMER >= 0.3S
                            {
                                ucTimerLargeZeroP5s = 0; // clear it, make sure this value is always more than 5 before clearing it
                                ucTimerRightP5s = 0;
                                enumMainLoopStep =  MAIN_LOOP_STEP_3_HOUR_BRANCH;
                            }
                            else
                            {
                                ;// always do the same thing in the MAIN_LOOP_STEP_THIRD
                            }
                        }
                        else
                        {
                            ;//do nothing
                        }

                        if((MAIN_LOOP_STEP_3_HOUR_BRANCH == enumMainLoopStep) || (MAIN_LOOP_STEP_FOURTH == enumMainLoopStep))
                        {  // only to make sure clear timer when exit this case. no other attention
                            ucTimerRightP5s = 0;
                            ucTimerLargeZeroP5s = 0;
                            ucTimerLessZeroP5s = 0;
                        }


                        break;
                    }

                    case MAIN_LOOP_STEP_FOURTH:
                    {

#ifdef USE_SOFTWARE_SIMULATION_TEST
                        cout <<"I am in MAIN_LOOP_STEP_FOURTH "<<endl;
#endif

                        startTwelveHourTimer(TEN_HOUR_TIMER);
                        enumMainLoopStep = MAIN_LOOP_STEP_FIFTH;

                        bCheckTweHour = FALSE;

                        break;
                    }

                    case MAIN_LOOP_STEP_FIFTH:
                    {
#ifdef USE_SOFTWARE_SIMULATION_TEST
                        cout <<"I am in MAIN_LOOP_STEP_FIFTH "<<endl;
#endif
                        if(( isFinishedTwelveHoursTimer() && (! bCheckTweHour)))
                        {
                            enumMainLoopStep = MAIN_LOOP_STEP_10_HOUR_END;//???? wait to be determined
                            bCheckTweHour = TRUE;
                        }
                        else
                        {

                            switch(ucADC4_Step)
                            {
                                case ADC4_STEP_INIT:
                                {
                                //  startTwentySecondsTimer();
#ifdef USE_SOFTWARE_SIMULATION_TEST
                        cout <<"ucADC4_Step :: ADC4_STEP_INIT; "<<endl;
#endif
                                    ucADC4_Step = ADC4_STEP_FIRST;
                                    break;
                                }

                                case ADC4_STEP_FIRST:
                                {
#ifdef USE_SOFTWARE_SIMULATION_TEST
                        cout <<"ucADC4_Step :: ADC4_STEP_FIRST; "<<endl;
#endif
                                    static unsigned int uiOldValue = 0, uiMinValue = 0, uiMaxValue = 0;

                                    static unsigned char bInitFlag = 0;

                                    unsigned int uiCh5Value = 0;

                                    uiCh5Value = getAdOriginalCh5Value();

                                    if( 0 == bInitFlag)
                                    {
                                        bInitFlag = 1;
                                        uiOldValue = uiCh5Value;
                                    }

                #define             RANGE_FIRST_VALUE                1931
                #define             RANGE_SECOND_VALUE               2047
                #define             RANGE_THIRD_VALUE                2164
                #define             RANGE_FOURTH_VALUE               2281
                #define             HYSTERETIC_NEGATIVE_VALUE        40
                #define             HYSTERETIC_POSITIVE_VALUE        0

                                    if(LESS_THAN_1911 == ucChannel5Type)
                                    {
                                        uiMinValue = 0;
                                        uiMaxValue = RANGE_FIRST_VALUE;
                                    }
                                    else if(BETWEEN_1911_AND_2067 == ucChannel5Type)
                                    {
                                        uiMinValue = RANGE_FIRST_VALUE - HYSTERETIC_NEGATIVE_VALUE;
                                        uiMaxValue = RANGE_SECOND_VALUE;
                                    }
                                    else if(BETWEEN_2067_AND_2204 == ucChannel5Type)
                                    {
                                        uiMinValue = RANGE_SECOND_VALUE - HYSTERETIC_NEGATIVE_VALUE;
                                        uiMaxValue = RANGE_THIRD_VALUE;
                                    }
                                    else if(BETWEEN_2204_AND_2340 == ucChannel5Type)
                                    {
                                        uiMinValue = RANGE_THIRD_VALUE - HYSTERETIC_NEGATIVE_VALUE;
                                        uiMaxValue = RANGE_FOURTH_VALUE;
                                    }
                                    else
                                    {
                                        uiMinValue = RANGE_FOURTH_VALUE - HYSTERETIC_NEGATIVE_VALUE;
                                        uiMaxValue = RANGE_FOURTH_VALUE;
                                    }


                                    if(( uiCh5Value < uiMinValue )
                                        ||  ( uiCh5Value > uiMaxValue ))
                                    {
                                        uiOldValue =  uiCh5Value;
                                    }

                                    if( uiOldValue < RANGE_FIRST_VALUE )
                                        ucChannel5Type = LESS_THAN_1911;
                                    else if( uiOldValue < RANGE_SECOND_VALUE )
                                        ucChannel5Type = BETWEEN_1911_AND_2067;
                                    else if( uiOldValue < RANGE_THIRD_VALUE )
                                        ucChannel5Type = BETWEEN_2067_AND_2204;
                                    else if( uiOldValue < RANGE_FOURTH_VALUE )
                                        ucChannel5Type = BETWEEN_2204_AND_2340;
                                    else
                                        ucChannel5Type = MORE_THAN_2340;

                                    ucADC4_Step = ADC4_STEP_SECOND;
                                    break;
                                }

                                case ADC4_STEP_SECOND:
                                {
#ifdef USE_SOFTWARE_SIMULATION_TEST
                        cout <<"ucADC4_Step :: ADC4_STEP_SECOND; "<<endl;
                        cout <<"ucChannel5Type :: "<< int(ucChannel5Type)<<endl;
#endif
                                    switch(ucChannel5Type)
                                    {
                                        case LESS_THAN_1911:
                                        {
                                            static unsigned char ucTimerDelay = 0;
                                            static unsigned char ucLoaderStep = 0;

                                            switch(ucLoaderStep)
                                            {
                                                case 0:
                                                {
                                                    setPA1(1);
                                                    ucLoaderStep++;
                                                    break;
                                                }

                                                case 1:
                                                {
                                                    if(ucTimerDelay >= TIMER_CNT_ZERO_POINT_FIVE_SECOND)
                                                    {
                                                        setPA0(1);
                                                        ucTimerDelay = 0;
                                                        ucLoaderStep++;
                                                    }
                                                    else
                                                        ucTimerDelay++;
                                                    break;
                                                }

                                                case 2:
                                                {
                                                    if(ucTimerDelay >= TIMER_CNT_ZERO_POINT_FIVE_SECOND)
                                                    {
                                                        setPB0(1);
                                                        ucTimerDelay = 0;
                                                        ucLoaderStep++;
                                                    }
                                                    else
                                                        ucTimerDelay++;
                                                    break;
                                                }


                                                case 3:
                                                {
                                                    if(ucTimerDelay >= TIMER_CNT_ZERO_POINT_FIVE_SECOND)
                                                    {
                                                        setPB1(1);
                                                        ucTimerDelay = 0;
                                                        ucLoaderStep++;
                                                    }
                                                    else
                                                        ucTimerDelay++;
                                                    break;
                                                }

                                                case 4:
                                                {
                                                    if(ucTimerDelay >= TIMER_CNT_ZERO_POINT_FIVE_SECOND)
                                                    {
                                                        setPB2(1);
                                                        ucTimerDelay = 0;
                                                        ucLoaderStep++;
                                                    }
                                                    else
                                                        ucTimerDelay++;
                                                    break;
                                                }

                                                case 5:
                                                {
                                                    if(ucTimerDelay >= TIMER_CNT_ZERO_POINT_FIVE_SECOND)
                                                    {
                                                        setPA1(0);
                                                        setPA0(0);
                                                        setPB0(0);
                                                        setPB1(0);
                                                        setPB2(0);
                                                        ucTimerDelay = 0;
                                                        ucLoaderStep++;
                                                    }
                                                    else
                                                        ucTimerDelay++;
                                                    break;
                                                }

                                                case 6:
                                                {
                                                    if(ucTimerDelay >= LETE_BRANCH_COMMON_STAY_TIME)
                                                    {
                                                        ucTimerDelay = 0;
                                    //                  AD_sample_process_step = 2;
                                                        ucLoaderStep = 0;
                                                        ucADC4_Step = ADC4_STEP_THIRD;
                                                    }
                                                    else
                                                        ucTimerDelay++;
                                                    break;
                                                }


                                                default:
                                                break;
                                            }

                                             break;
                                        }

                                        case BETWEEN_1911_AND_2067:
                                        {
                                            static unsigned char ucTimerDelay1 = 0;
                                            static unsigned char ucLoaderStep1 = 0;
                                            switch(ucLoaderStep1)
                                            {
                                                case 0:
                                                {
                                                    setPA1(1);
                                                    ucLoaderStep1++;
                                                    break;
                                                }

                                                case 1:
                                                {
                                                    if(ucTimerDelay1 >= TIMER_CNT_ZERO_POINT_FIVE_SECOND)
                                                    {
                                                        setPA0(1);
                                                        ucTimerDelay1 = 0;
                                                        ucLoaderStep1++;
                                                    }
                                                    else
                                                        ucTimerDelay1++;
                                                    break;
                                                }

                                                case 2:
                                                {
                                                    if(ucTimerDelay1 >= TIMER_CNT_ZERO_POINT_FIVE_SECOND)
                                                    {
                                                        setPB0(1);
                                                        ucTimerDelay1 = 0;
                                                        ucLoaderStep1++;
                                                    }
                                                    else
                                                        ucTimerDelay1++;
                                                    break;
                                                }

                                                case 3:
                                                {
                                                    if(ucTimerDelay1 >= TIMER_CNT_ZERO_POINT_FIVE_SECOND)
                                                    {
                                                //      PA2 = 1;
                                                        setPB1(1);
                                                        ucTimerDelay1 = 0;
                                                        ucLoaderStep1++;
                                                    }
                                                    else
                                                        ucTimerDelay1++;
                                                    break;
                                                }

                                                case 4:
                                                {
                                                    if(ucTimerDelay1 >= TIMER_CNT_ZERO_POINT_FIVE_SECOND)
                                                    {
                                                //      PA3 = 1;
                                                        setPB2(1);
                                                        ucTimerDelay1 = 0;
                                                        ucLoaderStep1++;
                                                    }
                                                    else
                                                        ucTimerDelay1++;
                                                    break;
                                                }

                                                case 5:
                                                {
                                                    if(ucTimerDelay1 >= TIMER_CNT_ZERO_POINT_FIVE_SECOND)
                                                    {
                                                        setPA0(0);

                                                        setPB0(0);

                                                        setPB1(0);

                                                        setPB2(0);
                                                        ucTimerDelay1 = 0;
                                                        ucLoaderStep1++;
                                                    }
                                                    else
                                                        ucTimerDelay1++;
                                                    break;
                                                }

                                                case 6:
                                                {
                                                    if(ucTimerDelay1 >= LETE_BRANCH_COMMON_STAY_TIME)
                                                    {
                                                        ucTimerDelay1 = 0;
                                        //              AD_sample_process_step = 2;
                                                        ucLoaderStep1 = 0;
                                                        ucADC4_Step = ADC4_STEP_THIRD;
                                                    }
                                                    else
                                                        ucTimerDelay1++;
                                                    break;
                                                }


                                                default:
                                                break;
                                            }

                                             break;
                                        }


                                        case BETWEEN_2067_AND_2204: //third branch
                                        {
                                            static unsigned char ucTimerDelay2 = 0;
                                            static unsigned char ucLoaderStep2 = 0;
                                            switch(ucLoaderStep2)
                                            {
                                                case 0:
                                                {
                                                //  PB0 = 1;
                                                    setPA1(1);
                                                //  PA0 = 1;
                                                    setPA0(1);
                                                    ucLoaderStep2++;
                                                    break;
                                                }

                                                case 1:
                                                {
                                                    if(ucTimerDelay2 >= TIMER_CNT_ZERO_POINT_FIVE_SECOND)
                                                    {
                                                //      PA1 = 1;
                                                        setPB0(1);
                                                        ucTimerDelay2 = 0;
                                                        ucLoaderStep2++;
                                                    }
                                                    else
                                                        ucTimerDelay2++;
                                                    break;
                                                }

                                                case 2:
                                                {
                                                    if(ucTimerDelay2 >= TIMER_CNT_ZERO_POINT_FIVE_SECOND)
                                                    {
                                                    //  PA2 = 1;
                                                        setPB1(1);
                                                        ucTimerDelay2 = 0;
                                                        ucLoaderStep2++;
                                                    }
                                                    else
                                                        ucTimerDelay2++;
                                                    break;
                                                }

                                                case 3:
                                                {
                                                    if(ucTimerDelay2 >= TIMER_CNT_ZERO_POINT_FIVE_SECOND)
                                                    {
                                                //      PA3 = 1;
                                                        setPB2(1);
                                                        ucTimerDelay2 = 0;
                                                        ucLoaderStep2++;
                                                    }
                                                    else
                                                        ucTimerDelay2++;
                                                    break;
                                                }

                                                case 4:
                                                {
                                                    if(ucTimerDelay2 >= TIMER_CNT_ZERO_POINT_FIVE_SECOND)
                                                    {

                                                    //  PA1 = 0;
                                                        setPB0(0);
                                                //      PA2 = 0;
                                                        setPB1(0);
                                            //          PA3 = 0;
                                                        setPB2(0);
                                                        ucTimerDelay2 = 0;
                                                        ucLoaderStep2++;
                                                    }
                                                    else
                                                        ucTimerDelay2++;
                                                    break;
                                                }

                                                case 5:
                                                {
                                                    if(ucTimerDelay2 >= LETE_BRANCH_COMMON_STAY_TIME)
                                                    {
                                                        ucTimerDelay2 = 0;
                                            //          AD_sample_process_step = 2;
                                                        ucLoaderStep2 = 0;
                                                        ucADC4_Step = ADC4_STEP_THIRD;;
                                                    }
                                                    else
                                                        ucTimerDelay2++;
                                                    break;
                                                }


                                                default:
                                                break;
                                            }

                                             break;
                                        }


                                        case BETWEEN_2204_AND_2340://fourth branch
                                        {
                                            static unsigned char ucTimerDelay3 = 0;
                                            static unsigned char ucLoaderStep3 = 0;
                                            switch(ucLoaderStep3)
                                            {
                                                case 0:
                                                {
                                                //  PB0 = 1;
                                                    setPB0(1);
                                            //      PA0 = 1;
                                                    setPA0(1);
                                                //  PA1 = 1;
                                                    setPA1(1);
                                                    ucLoaderStep3++;
                                                    break;
                                                }

                                                case 1:
                                                {
                                                    if(ucTimerDelay3 >= TIMER_CNT_ZERO_POINT_FIVE_SECOND)
                                                    {
                                                    //  PA2 = 1;
                                                        setPB1(1);
                                                        ucTimerDelay3 = 0;
                                                        ucLoaderStep3++;
                                                    }
                                                    else
                                                        ucTimerDelay3++;
                                                    break;
                                                }

                                                case 2:
                                                {
                                                    if(ucTimerDelay3 >= TIMER_CNT_ZERO_POINT_FIVE_SECOND)
                                                    {
                                                //      PA3 = 1;
                                                        setPB2(1);
                                                        ucTimerDelay3 = 0;
                                                        ucLoaderStep3++;
                                                    }
                                                    else
                                                        ucTimerDelay3++;
                                                    break;
                                                }


                                                case 3:
                                                {
                                                    if(ucTimerDelay3 >= TIMER_CNT_ZERO_POINT_FIVE_SECOND)
                                                    {

                                                    //  PA2 = 0;
                                                        setPB1(0);
                                                    //  PA3 = 0;
                                                        setPB2(0);
                                                        ucTimerDelay3 = 0;
                                                        ucLoaderStep3++;
                                                    }
                                                    else
                                                        ucTimerDelay3++;
                                                    break;
                                                }

                                                case 4:
                                                {
                                                    if(ucTimerDelay3 >= LETE_BRANCH_COMMON_STAY_TIME)
                                                    {
                                                        ucTimerDelay3 = 0;
                                                //      AD_sample_process_step = 2;
                                                        ucLoaderStep3 = 0;
                                                        ucADC4_Step = ADC4_STEP_THIRD;;
                                                    }
                                                    else
                                                        ucTimerDelay3++;
                                                    break;
                                                }


                                                default:
                                                break;
                                            }

                                             break;
                                        }


                                        case MORE_THAN_2340:
                                        {
                                            static unsigned char ucTimerDelay4 = 0;
                                            static unsigned char ucLoaderStep4 = 0;
                                            switch(ucLoaderStep4)
                                            {
                                                case 0:
                                                {
                                                //  PB0 = 1;
                                                    setPB0(1);
                                               //       PA0 = 1;
                                                    setPA0(1);
                                                //  PA1 = 1;
                                                    setPA1(1);
                                                //  PA2 = 1;
                                                    setPB1(1);
                                                    ucLoaderStep4++;
                                                    break;
                                                }

                                                case 1:
                                                {
                                                    if(ucTimerDelay4 >= TIMER_CNT_ZERO_POINT_FIVE_SECOND)
                                                    {
                                                //      PA3 = 1;
                                                        setPB2(1);
                                                        ucTimerDelay4 = 0;
                                                        ucLoaderStep4++;
                                                    }
                                                    else
                                                        ucTimerDelay4++;
                                                    break;
                                                }

                                                case 2:
                                                {
                                                    if(ucTimerDelay4 >= TIMER_CNT_ZERO_POINT_FIVE_SECOND)
                                                    {
                                                //      PA3 = 0;
                                                        setPB2(0);
                                                        ucTimerDelay4 = 0;
                                                        ucLoaderStep4++;
                                                    }
                                                    else
                                                        ucTimerDelay4++;
                                                    break;
                                                }

                                                case 3:
                                                {
                                                    if(ucTimerDelay4 >= LETE_BRANCH_COMMON_STAY_TIME)
                                                    {
                                                        ucTimerDelay4 = 0;
                                                //      AD_sample_process_step = 2;
                                                        ucLoaderStep4 = 0;
                                                        ucADC4_Step = ADC4_STEP_THIRD;
                                                    }
                                                    else
                                                        ucTimerDelay4++;
                                                    break;
                                                }


                                                default:
                                                break;
                                            }

                                             break;
                                        }

                                        default:
                                        break;
                                    }

                                    break;
                                }

                                case ADC4_STEP_THIRD:  //
                                {
#ifdef USE_SOFTWARE_SIMULATION_TEST
                        cout <<"ucADC4_Step :: ADC4_STEP_THIRD; "<<endl;
#endif
                                    static unsigned char ucTimerDelayP2sLess = 0;

                                    static unsigned char ucTimerDelayP2sMore = 0;

                                    if( getAdOriginalCh6Value() <= 150 )
                                    {
                                        ucTimerDelayP2sLess++;
                                    //	ucTimerDelayP2sLess = 0;
                                        ucTimerDelayP2sMore = 0;
                                    }
                                    else
                                    {
                                        ucTimerDelayP2sMore++;  //if value is vibrating , will always stop here
                                        ucTimerDelayP2sLess = 0;
                                    }

                                    if(ucTimerDelayP2sLess > 200)
                                        ucTimerDelayP2sLess = TIMER_CNT_ZERO_POINT_TWO_SECOND;


                                    if(ucTimerDelayP2sMore > 200)
                                        ucTimerDelayP2sMore = TIMER_CNT_ZERO_POINT_TWO_SECOND;

                                    if( ucTimerDelayP2sLess >= TIMER_CNT_ZERO_POINT_TWO_SECOND) //AD6 <=150 && timer >=0.2s
                                    {
                                        ucTimerDelayP2sLess = 0;
                                        ucTimerDelayP2sMore = 0;

                                        startTwentySecondsTimer();

                                        if( !isFinishedTwentySecondsTimer() )
                                        {
                                        //  ucADC4_Step = ADC4_STEP_FOURTH_PREFIX2;
                                            #ifdef USE_SOFTWARE_SIMULATION_TEST
                                            cout <<"tag #1:"<<endl;
                                            #endif
                                            vHandle20sTimeron();
                                        }
                                        else
                                        //  ucADC4_Step = ADC4_STEP_FOURTH_PREFIX3;
                                        {
#ifdef USE_SOFTWARE_SIMULATION_TEST
                                            cout <<"tag #2:"<<endl;
#endif
                                            vHandle20sTimerOut(0);
                                        }
                                    }
                                    else if(ucTimerDelayP2sMore >= TIMER_CNT_ZERO_POINT_TWO_SECOND) //AD6 > 150
                                    {
                                        ucTimerDelayP2sMore = 0;
                                        ucTimerDelayP2sLess = 0;
                                    //  ucADC4_Step = ADC4_STEP_FOURTH_PREFIX2;
#ifdef USE_SOFTWARE_SIMULATION_TEST
                                            cout <<"tag #3:"<<endl;
#endif
                                        vHandle20sTimeron();
                                    }
                                    else
                                    {
                                        //do nothing;
                                    }


                                    break;
                            }

//                            case ADC4_STEP_FOURTH_PREFIX1:
//                            {
//#ifdef USE_SOFTWARE_SIMULATION_TEST
//                        cout <<"ucADC4_Step :: ADC4_STEP_FOURTH_PREFIX1; "<<endl;
//#endif
//                                if( !isFinishedTwentySecondsTimer() )
//                                    ucADC4_Step = ADC4_STEP_FOURTH_PREFIX2;
//
//                                else
//                                    ucADC4_Step = ADC4_STEP_FOURTH_PREFIX3;
//
//                                break;
//                            }


//                            case ADC4_STEP_FOURTH_PREFIX2:
//                            {
//#ifdef USE_SOFTWARE_SIMULATION_TEST
//                        cout <<"ucADC4_Step :: ADC4_STEP_FOURTH_PREFIX2; "<<endl;
//#endif
//                                static unsigned char ucTimerCntMore = 0, ucTimerCntLess = 0;
//
//                                static unsigned char ucTimerCntMoreFlag = 0, ucTimerCntLessFlag = 0;
//
//                                if((getAdOriginalCh2Value() > 1950))
//                                {
//                                    ucTimerCntMore++;
//                                    ucTimerCntLess = 0;
//                                }
//                                else
//                                {
//                                    ucTimerCntLess++;
//                                    ucTimerCntMore = 0;
//                                }
//
//                                if(ucTimerCntMore >= TIMER_CNT_ZERO_POINT_TWO_SECOND)
//                                    ucTimerCntMoreFlag = 1;
//
//                                if(ucTimerCntLess >= TIMER_CNT_ZERO_POINT_TWO_SECOND)
//                                    ucTimerCntLessFlag = 1;
//
//                                if( ucTimerCntLessFlag )
//                                {
//                                    static unsigned char ucPrefix2Step = 0;
//
//                                    static unsigned char ucTimeCntP2s = 0;
//
//                                    switch(ucPrefix2Step)
//                                    {
//                                        case 0:
//                                        {
//                                            ucTimeCntP2s = 0;
//                                            setPA3(0);
//                                            setPB6(0);
//                                            ucPrefix2Step++;
//                                            break;
//                                        }
//
//                                        case 1:
//                                        {
//                                            if((getAdOriginalCh2Value() > 2300))
//                                            {
//                                                ucTimeCntP2s++;
//                                            }
//                                            else
//                                                ucTimeCntP2s = 0;
//
//                                            if( ucTimeCntP2s >= TIMER_CNT_ZERO_POINT_TWO_SECOND)
//                                            {
//                                                ucTimeCntP2s = 0;
//                                                ucPrefix2Step++;
//                                            }
//                                            break;
//
//
//                                        }
//
//                                        case 2:
//                                        {
//                                            setPA3(1);
//                                        //  TRISB6 = 1;
//                                            setPB6AsInput();
//                                            ucPrefix2Step++;
//                                            break;
//                                        }
//
//                                        case 3:
//                                        {
//                                            static unsigned char ucTimerCntP5s = 0;
//                                            if( ucTimerCntP5s < TIMER_CNT_ZERO_POINT_FIVE_SECOND)
//                                                ucTimerCntP5s++;
//                                            else
//                                            {
//                                                ucTimerCntP5s = 0;
//                                                ucPrefix2Step++;
//
//                                            }
//                                            break;
//                                        }
//
//                                        case 4:
//                                        {
//                                            static unsigned char ucMoreThanP3sCnt = 0;
//
//                                            static unsigned char ucLessThanP3sCnt = 0;
//                                            if((getAdOriginalCh6Value() < 50))
//                                            {
//                                                ucLessThanP3sCnt++;
//                                                ucMoreThanP3sCnt = 0;
//                                            }
//                                            else
//                                            {
//                                                ucMoreThanP3sCnt++;
//                                                ucLessThanP3sCnt = 0;
//                                            }
//
//                                            if( ucLessThanP3sCnt >= TIMER_CNT_ZERO_POINT_THREE_SECOND) // AD6 < 50
//                                            {
//                                                ucLessThanP3sCnt = 0;
//                                                ucMoreThanP3sCnt = 0;
//
//                                                enumMainLoopStep = MAIN_LOOP_STEP_FIRST;
//                                                ucADC4_Step = ADC4_STEP_INIT;
//                                                ucTimerCntMoreFlag = 0;
//
//                                                ucPrefix2Step = 0;
//                                                ;// how to assure to clear other vaiables
//                                            }
//
//                                            if(ucMoreThanP3sCnt > TIMER_CNT_ZERO_POINT_THREE_SECOND) //AD6 >= 50
//                                            {
//                                                ucLessThanP3sCnt = 0;
//                                                ucMoreThanP3sCnt = 0;
//
//                                                enumMainLoopStep = MAIN_LOOP_STEP_THIRD;
//                                                ucADC4_Step = ADC4_STEP_INIT;
//                                                ucTimerCntMoreFlag = 0;
//
//                                                ucPrefix2Step = 0;
//                                                ;// how to assure to clear other vaiables
//                                            }
//                                            break;
//                                        }
//                                        default:
//                                            break;
//                                    }
//                                }
//                                else if( ucTimerCntMoreFlag )
//                                {
//                                    static unsigned char ucMoreThanP8sCnt = 0;
//
//                                    static unsigned char ucLessThanP8sCnt = 0;
//                                    if((getAdOriginalCh6Value() < 50))
//                                    {
//                                        ucLessThanP8sCnt++;
//                                        ucMoreThanP8sCnt = 0;
//                                    }
//                                    else
//                                    {
//                                        ucMoreThanP8sCnt++;
//                                        ucLessThanP8sCnt = 0;
//                                    }
//
//                                    if( ucLessThanP8sCnt >= TIMER_CNT_ZERO_POINT_EIGHT_SECOND) //AD6 >= 50 && timer >= 0.8s
//                                    {
//                                        ucLessThanP8sCnt = 0;
//                                        ucMoreThanP8sCnt = 0;
//
//                                        enumMainLoopStep = MAIN_LOOP_STEP_FIRST;
//                                        ucADC4_Step = ADC4_STEP_INIT;
//                                        ucTimerCntMoreFlag = 0;
//                                        ;// how to assure to clear other variables
//                                    }
//                                    else if( ucMoreThanP8sCnt >= TIMER_CNT_ZERO_POINT_EIGHT_SECOND ) //AD6 < 50 && timer >= 0.8s
//                                    {
//                                        ucLessThanP8sCnt = 0;
//                                        ucMoreThanP8sCnt = 0;
//
//                                        enumMainLoopStep = MAIN_LOOP_STEP_THIRD;
//                                        ucADC4_Step = ADC4_STEP_INIT;
//                                        ucTimerCntMoreFlag = 0;
//                                        ;// how to assure to clear other vaiables
//                                    }
//                                    else
//                                        ;//do nothing
//                                }
//                                else
//                                {
//                                    ;//do nothing, if this AD value vibrate in this scope, consider to always stay here.
//                                }
//
//                                if(ADC4_STEP_INIT == ucADC4_Step)
//                                {
//                                    ucTimerCntMore = 0;
//                                    ucTimerCntLess = 0;
//                                    ucTimerCntMoreFlag = 0;
//                                    ucTimerCntLessFlag = 0;
//
//                                }
//
//                                break;
//                            }

//                            case  ADC4_STEP_FOURTH_PREFIX3:
//                            {
//#ifdef USE_SOFTWARE_SIMULATION_TEST
//                        cout <<"ucADC4_Step :: ADC4_STEP_FOURTH_PREFIX3; "<<endl;
//#endif
//                                clearTwentySecondsTimer();
//
//                                setPA3(0);
//                                setPB4(0);
//                                setPB6(1);
//
//                                ucADC4_Step = ADC4_STEP_FOURTH_PREFIX4;
//                                break;
//
//                            }


//                            case  ADC4_STEP_FOURTH_PREFIX4:
//                            {
//#ifdef USE_SOFTWARE_SIMULATION_TEST
//                        cout <<"ucADC4_Step :: ADC4_STEP_FOURTH_PREFIX4; "<<endl;
//#endif
//
//                                static unsigned char ucDelayPrefix4TimerP5s;
//
//                                ucDelayPrefix4TimerP5s++;
//
//                                if( ucDelayPrefix4TimerP5s >= TIMER_CNT_ONE_SECOND)
//                                {
//                                    ucDelayPrefix4TimerP5s = 0;
//
//                                    ucADC4_Step = ADC4_STEP_FOURTH_PREFIX5;
//                                }
//                                break;
//                            }
//
//                            case  ADC4_STEP_FOURTH_PREFIX5:
//                            {
//                                setPA3(1);
//                                setPB4(1);
//                                //TRISB6 = 1;// set PB6 as input
//                                setPB6AsInput();
//                                ucADC4_Step = ADC4_STEP_FOURTH_PREFIX6;
//
//                                break;
//
//                            }
//
//                            case  ADC4_STEP_FOURTH_PREFIX6:
//                            {
//                                static unsigned char ucDelayPrefix6TimerP2s;
//
//                                ucDelayPrefix6TimerP2s++;
//
//                                if( ucDelayPrefix6TimerP2s >= TIMER_CNT_ZERO_POINT_TWO_SECOND)
//                                {
//                                    ucDelayPrefix6TimerP2s = 0;
//
//                                    ucADC4_Step = ADC4_STEP_INIT;
//
//                                    enumMainLoopStep = MAIN_LOOP_STEP_THIRD;
//                                }
//                                break;
//                            }


                                case ADC4_STEP_FOURTH:// this branch is not used
                                {
//#ifdef USE_SOFTWARE_SIMULATION_TEST
//                      cout <<"ucADC4_Step :: ADC4_STEP_FOURTH; "<<endl;
//#endif
//                                  static unsigned char ucCheckTimerP2sLess = 0;
//
//                                  static unsigned char ucCheckTimerP2sMore = 0;
//
//                                  if( getAdOriginalCh6Value() < 85)
//                                  {
//                                      ucCheckTimerP2sLess++;
//                                      ucCheckTimerP2sMore = 0;
//                                  }
//                                  else
//                                  {
//                                      ucCheckTimerP2sMore++;
//                                      ucCheckTimerP2sLess = 0;
//                                  }
//
//                                  if( ucCheckTimerP2sMore > 2)
//                                  {
//                                      ucCheckTimerP2sMore = 0;
//                                      ucCheckTimerP2sLess = 0;
//
//                                      ucADC4_Step = ADC4_STEP_INIT;
//
//                                      enumMainLoopStep = MAIN_LOOP_STEP_THIRD;
//                                  }
//
//                                  if( ucCheckTimerP2sLess > 2)
//                                  {
//                                      ucCheckTimerP2sMore = 0;
//                                      ucCheckTimerP2sLess = 0;
//
//                                      ucADC4_Step = ADC4_STEP_FOURTH_SUFFIX1;
//
//                                  }


                                    break;
                                }

                                case ADC4_STEP_FOURTH_SUFFIX1:
                                {
#ifdef USE_SOFTWARE_SIMULATION_TEST
                        cout <<"ucADC4_Step :: ADC4_STEP_FOURTH_SUFFIX1; "<<endl;
#endif
                                    static unsigned char ucFourthSuffix1TimerP3s = 0;

                                    ucFourthSuffix1TimerP3s++;

                                    if( ucFourthSuffix1TimerP3s > TIMER_CNT_ZERO_POINT_THREE_SECOND)
                                    {
                                        ucFourthSuffix1TimerP3s = 0;
                                        ucADC4_Step = ADC4_STEP_FOURTH_SUFFIX2;

                                    }
                                    break;
                                }

                                case ADC4_STEP_FOURTH_SUFFIX2:
                                {
#ifdef USE_SOFTWARE_SIMULATION_TEST
                        cout <<"ucADC4_Step :: ADC4_STEP_FOURTH_SUFFIX2; "<<endl;
#endif
                            //      PA6 = 0;
                                    setPA6(0);

                                    clearPinPortAndTimer();
                                    ucADC4_Step = ADC4_STEP_INIT;

                                    enumMainLoopStep = MAIN_LOOP_STEP_FIRST;
                                    break;
                                }

                                default:
                                    break;
                            }

                        }

                        break;
                    }

                    case MAIN_LOOP_STEP_3_HOUR_BRANCH:
                    {
#ifdef USE_SOFTWARE_SIMULATION_TEST
                        cout <<"I am in MAIN_LOOP_STEP_3_HOUR_BRANCH "<<endl;
#endif
                        enum hour_3_branch_step{
                            HOUR_3_BRANCH_STEP_FIRST,
                            HOUR_3_BRANCH_STEP_SECOND,
                            HOUR_3_BRANCH_STEP_THIRD,
                        };

                        static enum hour_3_branch_step  enumBranchStep = HOUR_3_BRANCH_STEP_FIRST;

                        switch(enumBranchStep)
                        {
                            case HOUR_3_BRANCH_STEP_FIRST:
                            {
#ifndef USE_SOFTWARE_SIMULATION_TEST
                                PB7 = 1;
                                PBOD7 = 1; //set PA7 AS hign resistence
#else
                                cout <<"PB7 = 1;"<<endl;
                                cout<<"PBOD7 = 1;"<<endl;
#endif
                                startThreeHoursTimer(THREE_HOUR_TIMER);



                                setPA0(1);

                                setPA1(1);

                                setPB0(1);

                                setPB1(1);

                                setPB2(1);

                                setPB4(0);

                                enumBranchStep = HOUR_3_BRANCH_STEP_SECOND;
                                break;
                            }

                            case HOUR_3_BRANCH_STEP_SECOND:
                            {
#ifdef USE_SOFTWARE_SIMULATION_TEST
                        cout <<"I am in HOUR_3_BRANCH_STEP_SECOND "<<endl;
#endif

                                enumBranchStep = HOUR_3_BRANCH_STEP_THIRD;
                                break;
                            }

                            case HOUR_3_BRANCH_STEP_THIRD:
                            {
#ifdef USE_SOFTWARE_SIMULATION_TEST
                        cout <<"I am in HOUR_3_BRANCH_STEP_THIRD "<<endl;
#endif
                                if( (isFinishedTwelveHoursTimer()) || (isFinishedThreeHoursTimer()))
                                {
                                    enumBranchStep = HOUR_3_BRANCH_STEP_FIRST;
                                    enumMainLoopStep =  MAIN_LOOP_STEP_10_HOUR_END;
                                }
                                else
                                {
                                    static unsigned char ucTimerX1P5s = 0;

                                    static unsigned char ucTimerLessX1P5s = 0;

                                    if(getAdOriginalCh6Value() <= 85)
                                    {
                                        ucTimerX1P5s = 0;
                                        ucTimerLessX1P5s++;
                                    }
                                    else
                                    {
                                        ucTimerX1P5s++;
                                        ucTimerLessX1P5s = 0;
                                    }

                                    if(ucTimerX1P5s >= TIMER_CNT_ZERO_POINT_FIVE_SECOND) // AD6 >= 85 && timer >= 0.5s
                                    {
                                        ucTimerX1P5s = 0;

                                        ucTimerLessX1P5s = 0;


#ifndef USE_SOFTWARE_SIMULATION_TEST
                                        PBOD7 = 0;
                                        PB7 = 0;
#else
                                        cout <<"PBOD7 = 0;"<<endl;
                                        cout <<"PB7 = 0;"<<endl;
#endif
                                        clearThreeHoursTimer();

                                        enumBranchStep = HOUR_3_BRANCH_STEP_FIRST;

                                        enumMainLoopStep =  MAIN_LOOP_STEP_SECOND;
                                    }
                                    else if(ucTimerLessX1P5s >= TIMER_CNT_ZERO_POINT_FIVE_SECOND) // AD6 < 85 && timer >= 0.5s
                                    {
                                        static unsigned char ucTimerX2P5s = 0;

                                        static unsigned char ucTimerLessX2P5s = 0;

                                        if(getAdOriginalCh6Value() > 20)
                                        {
                                            ucTimerX2P5s++;
                                            ucTimerLessX2P5s = 0;
                                        }
                                        else
                                        {
                                            ucTimerX2P5s = 0;
                                           // ucTimerLessX2P5s++;
                                            ucTimerLessX2P5s = 0;// this condition never meet

                                        }

                                        if(ucTimerX2P5s >= 5)
                                        {
                                            ucTimerX2P5s = 0;
                                        }
                                        else if(ucTimerLessX2P5s >= TIMER_CNT_ZERO_POINT_FIVE_SECOND) // AD6 < 20 && timer >= 0.5s
                                        {
                                            clearParaFunction1();
                                            enumMainLoopStep =  MAIN_LOOP_STEP_FIRST;
                                            enumBranchStep = HOUR_3_BRANCH_STEP_FIRST;

                                            ucTimerLessX2P5s = 0;

                                            ucTimerX2P5s = 0;
                                        }
                                        else
                                        {
                                            ;//do thing
                                        }
                                    }
                                    else
                                    {
                                        ;//do nothing
                                    }

                                }

                                break;
                            }


                            default:
                                break;
                        }

                        break;
                    }

                    case MAIN_LOOP_STEP_10_HOUR_END:
                    {
#ifdef USE_SOFTWARE_SIMULATION_TEST
                        cout <<"I am in MAIN_LOOP_STEP_10_HOUR_END "<<endl;
#endif
                        enum INTERNAL_STEP {
                            INTERNAL_FIRST_STEP,
                            INTERNAL_SECOND_STEP,
                            INTERNAL_THIRD_STEP,
                            INTERNAL_FOUTTH_STEP,
                        };

                        static enum INTERNAL_STEP enumInteralStep = INTERNAL_FIRST_STEP;

                        switch (enumInteralStep)
                        {
                            case INTERNAL_FIRST_STEP:
                            {
#ifdef USE_SOFTWARE_SIMULATION_TEST
                        cout <<"enumInteralStep :: INTERNAL_FIRST_STEP "<<endl;
#endif

                                setPA2(0);
                                setPA1(0);
                                setPA0(0);
                                setPB0(0);
                                setPB1(0);
                                setPB2(0);
                                setPA3(0);
                                setPB4(0);
                                setPB6(1);

                                enumInteralStep = INTERNAL_SECOND_STEP;
                                break;
                            }

                            case INTERNAL_SECOND_STEP:
                            {
#ifdef USE_SOFTWARE_SIMULATION_TEST
                        cout <<"enumInteralStep :: INTERNAL_SECOND_STEP "<<endl;
#endif
                                static unsigned char ucTimer1s = 0;

                                if(getAdOriginalCh0Value() >= 2500)
                                {
                                    ucTimer1s++;
                                }
                                else
                                    ucTimer1s = 0;

                                if(ucTimer1s >= 10)
                                {
                                    enumInteralStep = INTERNAL_THIRD_STEP;
                                    ucTimer1s = 0;
                                }
                                break;
                            }

                            case INTERNAL_THIRD_STEP:
                            {
#ifdef USE_SOFTWARE_SIMULATION_TEST
                        cout <<"enumInteralStep :: INTERNAL_THIRD_STEP "<<endl;
#endif
                                static unsigned char ucTimerP3s = 0;

                                if(getAdOriginalCh0Value() <= 1950)
                                {
                                    ucTimerP3s++;
                                }
                                else
                                    ucTimerP3s = 0;

                                if(ucTimerP3s >= TIMER_CNT_ZERO_POINT_THREE_SECOND)
                                {
                                    enumInteralStep = INTERNAL_FIRST_STEP;
                                    ucTimerP3s = 0;

                                    clearAllTimer();

                                    initPin();


                                    enumMainLoopStep =  MAIN_LOOP_STEP_INIT;
#ifndef USE_SOFTWARE_SIMULATION_TEST
                                    while(1);// as to reset MCU
#else
                                    cout<<"the software is reset;"<<endl;
#endif

                                }
                                break;
                            }

                            default:
                                break;
                        }

                        break;
                    }

                    default:
                        break;
               }

            }
        }
#ifdef USE_SOFTWARE_SIMULATION_TEST
    return 0;
#endif
}


void vHandle20sTimeron(void)
{
    enum enum_waiting_loop_step
    {
        WAITING_LOOP_STEP1 = 0,
        WAITING_LOOP_STEP2,
        WAITING_LOOP_STEP3,
        WAITING_LOOP_STEP4,
        WAITING_LOOP_STEP5,
        WAITING_LOOP_STEP6,
        WAITING_LOOP_STEP7,
        WAITING_LOOP_STEP8,
        WAITING_LOOP_STEP9,
    };

    enum enumCmpStep
    {
        COMPARE_STEP0 = 0,
        COMPARE_STEP1,
        COMPARE_STEP2,
        COMPARE_STEP3,
        COMPARE_STEP4,

    };


#ifdef USE_SOFTWARE_SIMULATION_TEST
        cout <<"ucADC4_Step :: ADC4_STEP_FOURTH_PREFIX2; "<<endl;
#endif
        static unsigned char ucTimerCntMore = 0, ucTimerCntLess = 0;

        static enum enumCmpStep ucCompareStep = COMPARE_STEP0;

        switch( ucCompareStep )
        {
            case COMPARE_STEP0:
            {
                if((getAdOriginalCh2Value() > 1950))
                {
                    ucTimerCntMore++;
                    ucTimerCntLess = 0;
                }
                else
                {
                    ucTimerCntLess++;
                    ucTimerCntMore = 0;
                }

                if(ucTimerCntMore >= TIMER_CNT_ZERO_POINT_TWO_SECOND)
                {
                    ucCompareStep = COMPARE_STEP1;
                    ucTimerCntMore = 0;
                }

                if(ucTimerCntLess >= TIMER_CNT_ZERO_POINT_TWO_SECOND)
                {
                    ucCompareStep = COMPARE_STEP2;
                    ucTimerCntLess = 0;
                }
#ifdef USE_SOFTWARE_SIMULATION_TEST
                cout <<"COMPARE_STEP0: "<<endl;
#endif

                break;
            }
            case COMPARE_STEP1: //ad > 1950
            {
                static unsigned char ucMoreThanP8sCnt = 0;

                static unsigned char ucLessThanP8sCnt = 0;

                static unsigned char ucTimerCntN1 = 0;

                if((getAdOriginalCh2Value() < 1950))
                {
                    ucTimerCntN1++;
                    if(ucTimerCntN1 >= TIMER_CNT_ZERO_POINT_TWO_SECOND)
                    {
                        ucTimerCntN1 = 0;
                        ucCompareStep = COMPARE_STEP2;

                        ucLessThanP8sCnt = 0;

                        ucMoreThanP8sCnt = 0;
                    }
                    break;//not nedd excute the sentence below
                }
                else
                    ucTimerCntN1 = 0;


    #ifdef USE_SOFTWARE_SIMULATION_TEST
                        cout <<"tag #9:"<<endl;
    #endif
                if((getAdOriginalCh6Value() < 50))
                {
                    ucLessThanP8sCnt++;
                    ucMoreThanP8sCnt = 0;
                }
                else
                {
                    ucMoreThanP8sCnt++;
                    ucLessThanP8sCnt = 0;
                }

                if( ucLessThanP8sCnt >= TIMER_CNT_ZERO_POINT_EIGHT_SECOND) //AD6 >= 50 && timer >= 0.8s
                {
                    ucLessThanP8sCnt = 0;
                    ucMoreThanP8sCnt = 0;

                    enumMainLoopStep = MAIN_LOOP_STEP_FIRST;
                    ucADC4_Step = ADC4_STEP_INIT;

                    ucCompareStep = COMPARE_STEP0;
                    ;// how to assure to clear other variables
                }
                else if( ucMoreThanP8sCnt >= TIMER_CNT_ZERO_POINT_EIGHT_SECOND ) //AD6 < 50 && timer >= 0.8s
                {
                    ucLessThanP8sCnt = 0;
                    ucMoreThanP8sCnt = 0;

                    enumMainLoopStep = MAIN_LOOP_STEP_THIRD;
                    ucADC4_Step = ADC4_STEP_INIT;

                    ucCompareStep = COMPARE_STEP0;
                    ;// how to assure to clear other vaiables
                }
                else
                    ;//do nothing
#ifdef USE_SOFTWARE_SIMULATION_TEST
                cout <<"COMPARE_STEP1: "<<endl;
#endif
                break;
            }

            case COMPARE_STEP2: // ad2 <= 1950
            {

                static enum enum_waiting_loop_step waitLoopStep = WAITING_LOOP_STEP1;

                static unsigned char ucTimeCntP2s = 0;

#ifdef USE_SOFTWARE_SIMULATION_TEST
                cout <<"COMPARE_STEP2: "<<endl;
#endif

                switch(waitLoopStep)
                {
                    case WAITING_LOOP_STEP1:
                    {
    #ifdef USE_SOFTWARE_SIMULATION_TEST
                        cout <<"tag #4:"<<endl;
    #endif
                        vPause20sTimer(TRUE);
                        ucTimeCntP2s = 0;
                        setPA3(0);
                        setPB6(1);
                        waitLoopStep = WAITING_LOOP_STEP2;
                        break;
                    }

                    case WAITING_LOOP_STEP2:
                    {
    #ifdef USE_SOFTWARE_SIMULATION_TEST
                        cout <<"tag #5:"<<endl;
    #endif
                        if((getAdOriginalCh2Value() > 2300))
                        {
                            ucTimeCntP2s++;
                        }
                        else
                            ucTimeCntP2s = 0;

                        if( ucTimeCntP2s >= TIMER_CNT_ZERO_POINT_TWO_SECOND)
                        {
                            ucTimeCntP2s = 0;
                            waitLoopStep = WAITING_LOOP_STEP3;
                        }
                        break;
                    }

                    case WAITING_LOOP_STEP3:
                    {
    #ifdef USE_SOFTWARE_SIMULATION_TEST
                        cout <<"tag #6:"<<endl;
    #endif
                        setPA3(1);
                    //  TRISB6 = 1;
                        setPB6AsInput();
                        waitLoopStep = WAITING_LOOP_STEP4;
                        break;
                    }

                    case WAITING_LOOP_STEP4:
                    {
    #ifdef USE_SOFTWARE_SIMULATION_TEST
                        cout <<"tag #7:"<<endl;
    #endif
                        static unsigned char ucTimerCntP5s = 0;
                        if( ucTimerCntP5s < TIMER_CNT_ZERO_POINT_FIVE_SECOND)
                            ucTimerCntP5s++;
                        else
                        {
                            ucTimerCntP5s = 0;
                            waitLoopStep = WAITING_LOOP_STEP5;

                        }
                        break;
                    }

                    case WAITING_LOOP_STEP5:
                    {
    #ifdef USE_SOFTWARE_SIMULATION_TEST
                        cout <<"tag #8:"<<endl;
    #endif
                        static unsigned char ucMoreThanP3sCnt = 0;

                        static unsigned char ucLessThanP3sCnt = 0;
                        if((getAdOriginalCh6Value() < 50))
                        {
                            ucLessThanP3sCnt++;
                            ucMoreThanP3sCnt = 0;
                        }
                        else
                        {
                            ucMoreThanP3sCnt++;
                            ucLessThanP3sCnt = 0;
                        }

                        if( ucLessThanP3sCnt >= TIMER_CNT_ZERO_POINT_THREE_SECOND) // AD6 < 50
                        {
                            ucLessThanP3sCnt = 0;
                            ucMoreThanP3sCnt = 0;

                            enumMainLoopStep = MAIN_LOOP_STEP_FIRST;
                            ucADC4_Step = ADC4_STEP_INIT;

                            waitLoopStep  = WAITING_LOOP_STEP1;

                            ucCompareStep = COMPARE_STEP0;
                        }

                        if(ucMoreThanP3sCnt >= TIMER_CNT_ZERO_POINT_THREE_SECOND) //AD6 >= 50
                        {
                            ucLessThanP3sCnt = 0;
                            ucMoreThanP3sCnt = 0;

                            enumMainLoopStep = MAIN_LOOP_STEP_THIRD;
                            ucADC4_Step = ADC4_STEP_INIT;

                            waitLoopStep = WAITING_LOOP_STEP1;

                            ucCompareStep = COMPARE_STEP0;
                            ;// how to assure to clear other vaiables
                        }
                        break;
                    }
                    default:
                        break;
                }

                break;
            }
            default:
                break;
        }

        if(ADC4_STEP_INIT == ucADC4_Step)
        {
            ucTimerCntMore = 0;
            ucTimerCntLess = 0;
            ucCompareStep = COMPARE_STEP0;

            vPause20sTimer(FALSE);
        }
}

void vHandle20sTimerOut(unsigned char bClearStep)
{
    static unsigned char ucTimerOnBehaviorStep = 0;

    static unsigned char ucTimeCnt = 0;

    if( 1 == bClearStep)
    {
        bClearStep = 0;
        ucTimerOnBehaviorStep = 0;
        ucTimeCnt = 0;
    }

    switch(ucTimerOnBehaviorStep)
    {
    case 0:
    {
#ifdef USE_SOFTWARE_SIMULATION_TEST
        cout <<"tag #10:"<<endl;
#endif

        setPA3(0);
        setPB4(0);
        setPB6(1);
        ucTimeCnt = 0;
        ucTimerOnBehaviorStep = 1;
        break;
    }

    case 1:
    {
#ifdef USE_SOFTWARE_SIMULATION_TEST
        cout <<"tag #11:"<<endl;
#endif
        ucTimeCnt++;

        if( ucTimeCnt >= TIMER_CNT_ONE_SECOND)
        {
            ucTimeCnt = 0;
            ucTimerOnBehaviorStep = 2;
        }
        break;
    }

    case 2:
        {
#ifdef USE_SOFTWARE_SIMULATION_TEST
        cout <<"tag #12:"<<endl;
#endif
            ucTimeCnt++;

            if( ucTimeCnt >= TIMER_CNT_ZERO_POINT_ONE_SECOND)
            {
                ucTimeCnt = 0;

                ucTimerOnBehaviorStep = 3;
            }
            break;
        }

    case 3:
        {
#ifdef USE_SOFTWARE_SIMULATION_TEST
        cout <<"tag #13:"<<endl;
#endif
            setPA3(1);
            setPB4(1);
            //TRISB6 = 1;// set PB6 as input
            setPB6AsInput();
            ucTimeCnt = 0;

            ucTimerOnBehaviorStep = 4;
            break;
        }
    case 4:
        {
#ifdef USE_SOFTWARE_SIMULATION_TEST
        cout <<"tag #14:"<<endl;
#endif
            ucTimeCnt++;

            if( ucTimeCnt >= TIMER_CNT_ZERO_POINT_TWO_SECOND)
            {
                clearTwentySecondsTimer();

                ucTimeCnt = 0;

                ucADC4_Step = ADC4_STEP_INIT;

                enumMainLoopStep = MAIN_LOOP_STEP_THIRD;

                ucTimerOnBehaviorStep = 0;
            }
            break;
        }

    default:
        break;
    }

}

