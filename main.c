


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

#else
#endif
#define   AD6_75MV        225
#define   AD6_50MV        150
#define   AD6_30MV        90
#define   AD6_170MV       510


#define   AD5_1030MV        3090
#define   AD5_1098MV        3300
#define   AD5_990MV         2900
#define   AD5_1058MV        3180
#define   AD5_1126MV        3378
#define   AD5_1166MV        3498
#define   AD5_1180MV        3540


#define   AD2_1000MV        3000



#define  AD6_KEEP_TIME_200MS        200
#define  AD6_KEEP_TIME_100MS        100
#define  AD6_KEEP_TIME_500MS        5100


#define  AD5_KEEP_TIME_100MS        100


#define  AD2_KEEP_TIME_100MS        100



unsigned char ucGetResult( unsigned char ucSampleCh, unsigned int uiVoltageValue,unsigned char ucKeepTime )
{
	unsigned char bResult = 0;

	switch(ucSampleCh)
	{
		case AD_CHANNEL_2_CHANNEL:
		{
			bResult = 0;
			break;
		}

		case AD_CHANNEL_5_CHANNEL:
		{
			bResult = 0;
			break;
		}

		case AD_CHANNEL_6_CHANNEL:
		{
			bResult = 0;
			break;
		}

		default:
			bResult = 0;
			break;


	}

	return bResult;
}








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

#ifdef   USE_SOFTWARE_SIMULATION_TEST
void vPause20sTimer(unsigned char ucValue);
{
	;
}
#endif


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

#if USE_21V_AS_AD_REFERENCE_VOLTAGE

//AD0 channel
#define  AD0_COMPARE_VALUE_0    1950
#define  AD0_COMPARE_VALUE_1    2500

//AD5 channel
#define             RANGE_FIRST_VALUE                1931
#define             RANGE_SECOND_VALUE               2047
#define             RANGE_THIRD_VALUE                2164
#define             RANGE_FOURTH_VALUE               2281
#define             HYSTERETIC_NEGATIVE_VALUE        40
#define             HYSTERETIC_POSITIVE_VALUE        0
//AD6 channel
#define  AD6_COMPARE_VALUE_0    85
#define  AD6_COMPARE_VALUE_1    65
#define  AD6_COMPARE_VALUE_2    150
#define  AD6_COMPARE_VALUE_3    20
#define  AD6_COMPARE_VALUE_4    50
#else

// AD0 CHANNEL
 #define  AD0_COMPARE_VALUE_0    3150
 #define  AD0_COMPARE_VALUE_1    4038

// AD5 CHANNEL
#define             RANGE_FIRST_VALUE                3119
#define             RANGE_SECOND_VALUE               3306
#define             RANGE_THIRD_VALUE                3495
#define             RANGE_FOURTH_VALUE               3684
#define             HYSTERETIC_NEGATIVE_VALUE        65
#define             HYSTERETIC_POSITIVE_VALUE        0


//AD6 channel
#define  AD6_COMPARE_VALUE_0    137
#define  AD6_COMPARE_VALUE_1    105
#define  AD6_COMPARE_VALUE_2    242
#define  AD6_COMPARE_VALUE_3    32
#define  AD6_COMPARE_VALUE_4    81
#endif



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
			MAIN_LOOP_STEP_EIGHTTH,
			MAIN_LOOP_STEP_NINTH,
            MAIN_LOOP_STEP_3_HOUR_BRANCH,
            MAIN_LOOP_STEP_10_HOUR_END,
			MAIN_LOOP_STEP_MAX_STEP,
        };


static enum MAIN_LOOP_STEP  mainLoopStep = MAIN_LOOP_STEP_INIT;

static enum AD_CHANNEL_4_VALUE_PATH ucChannel5Type = LESS_THAN_1911;


static enum setp_Adc4 ucADC4_Step = ADC4_STEP_INIT;


void vHandle20sTimeron();
void vHandle20sTimerOut(unsigned char bClearStep);

void vFunA1(void)
{
	PA1 = 0;
	PB0 = 0;
	PB2 = 0;
	PB3 = 0;


	PA2 = 0;
	PA0 = 0;
	PB1 = 0;
	PB4 = 0;


	PA3 = 0;



	PB6 = 0;
	PB7 = 0;


}



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
        op2_init(); //OP2初始化

        adc_test_init(AD_CHANNEL_0_CHANNEL,ADC_REF_PB5);//ADC初始化 通道0 PB3，2.1V 电压为参考源

//      dac_init(); //DAC0/1初始化
        op1_init(); //OP1初始化



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

               switch(mainLoopStep)
               {
                   case MAIN_LOOP_STEP_INIT:
                    {

#ifdef USE_SOFTWARE_SIMULATION_TEST
                        cout <<"I am in MAIN_LOOP_STEP_INIT "<<endl;
#endif


                        if( ucGetResult(AD_CHANNEL_6_CHANNEL,AD6_75MV,AD6_KEEP_TIME_100MS) )
                        	mainLoopStep++;
                        else
                        {
                        	if(isFinishedTwentyMinuteTimer())
                        		mainLoopStep = MAIN_LOOP_STEP_MAX_STEP;
                        	else
                        		;
                        }


                        break;
                    }

                   case MAIN_LOOP_STEP_MAX_STEP:
                   {
                	   static unsigned char bInit = 0;

                	   vFunA1();

                	   if(!bInit)
                	   {
                		  if( ucGetResult(AD_CHANNEL_6_CHANNEL,AD6_30MV,AD6_KEEP_TIME_500MS))
                			  bInit = 1;
                	   }
                	   else
                	   {
                		   if(! ucGetResult(AD_CHANNEL_6_CHANNEL,AD6_30MV,AD6_KEEP_TIME_500MS))
                			   mainLoopStep = MAIN_LOOP_STEP_FIRST;
                		   else
                			   ;// keep waitting
                	   }

                	   break;
                   }

                   case MAIN_LOOP_STEP_FIRST:
                    {

#ifdef USE_SOFTWARE_SIMULATION_TEST
                        cout <<"I am in MAIN_LOOP_STEP_FIRST "<<endl;
#endif
                       PB6  = 1;
                       PB7 = 0;
                       startTwentyMinuteTimer(THREE_HOUR_TIMER);
                       startTwentyMinuteTimer(TEN_HOUR_TIMER);

                       mainLoopStep++;

                        break;
                    }

                    case MAIN_LOOP_STEP_SECOND:
                    {

#ifdef USE_SOFTWARE_SIMULATION_TEST
                        cout <<"I am in MAIN_LOOP_STEP_SECOND "<<endl;
#endif
                        static unsigned char ucTimerP1s = 0;
                        unsigned char ucTempValue = 0;

                        PA1 = 0;
                        PB0 = 0;
                        PB2 = 0;
                        PB3 = 0;

                        PA2 = 1;

                        ucTimerP1s++;

                        ucTempValue = ucTimerP1s/3;

                        if(ucTempValue == 1)
                        	PA0 = 1;
                        if(ucTempValue == 2)
                            PB1 = 1;
                        if(ucTempValue == 3)
                        	PB4 = 1;

                        if(ucTempValue == 4)
                        {

                        	PA2 = 0;
                        	PA0 = 0;
                        	PB1 = 0;
                        	PB4 = 0;

                        	ucTimerP1s = 0;
                        	mainLoopStep++;
                        }


                        break;
                    }

                    case MAIN_LOOP_STEP_THIRD:
                    {

#ifdef USE_SOFTWARE_SIMULATION_TEST
                        cout <<"I am in MAIN_LOOP_STEP_THIRD "<<endl;
#endif
                        if( ucGetResult(AD_CHANNEL_6_CHANNEL,AD6_50MV,AD6_KEEP_TIME_100MS))
                        	;//TBD
                        else
                        	mainLoopStep++;;
                        break;
                    }

                    case MAIN_LOOP_STEP_FOURTH:
                    {

#ifdef USE_SOFTWARE_SIMULATION_TEST
                        cout <<"I am in MAIN_LOOP_STEP_FOURTH "<<endl;
#endif

                        if( ucGetResult(AD_CHANNEL_5_CHANNEL,AD5_1030MV,AD5_KEEP_TIME_100MS))
                        	mainLoopStep++;
                        else
                        	;//TBD

                        break;
                    }

                    case MAIN_LOOP_STEP_FIFTH:
                    {
#ifdef USE_SOFTWARE_SIMULATION_TEST
                        cout <<"I am in MAIN_LOOP_STEP_FIFTH "<<endl;
#endif
                        if(isFinishedThreeHoursTimer())
                        {
                        	mainLoopStep = MAIN_LOOP_STEP_MAX_STEP;
                        }
                        else
                        {
                        	mainLoopStep++;
                        }

                        break;
                    }

                    case MAIN_LOOP_STEP_SIXTH:
                    {
                    	 static unsigned char ucDelayP1s = 0;
                    	 if( ucGetResult(AD_CHANNEL_2_CHANNEL,AD2_1000MV,AD2_KEEP_TIME_100MS))
                    	 {
                    		 PB6 = 1;
                    		 PB7 = 1;

                    		 ucDelayP1s++;

                    		 if(ucDelayP1s < 3)
                    		 {
                    			 PA1 = 1;
                    			 PB0 = 1;
                    			 PB2 = 1;
                    			 PB3 = 1;

                    			 PA2 = 0;
                    			 PA0 = 0;
                    			 PB1 = 0;
                    			 PB4 = 0;
                    		 }
                    		 else if(ucDelayP1s < 6)
                    		 {
								 PA1 = 0;
								 PB0 = 0;
								 PB2 = 0;
								 PB3 = 0;

								 PA2 = 1;
								 PA0 = 1;
								 PB1 = 1;
								 PB4 = 1;
							 }
                    		 else
                    		 {
                    			 ucDelayP1s = 0;
                    		 }
                    	 }
                    	 else
                    	 {
                    		 mainLoopStep = MAIN_LOOP_STEP_SECOND;

                    		 ucDelayP1s = 0;
                    	 }
                    	break;
                    }

                    case MAIN_LOOP_STEP_10_HOUR_END:
                    {
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
                if((getAdOriginalCh6Value() < AD6_COMPARE_VALUE_4))
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

                    mainLoopStep = MAIN_LOOP_STEP_FIRST;
                    ucADC4_Step = ADC4_STEP_INIT;

                    ucCompareStep = COMPARE_STEP0;
                    ;// how to assure to clear other variables
                }
                else if( ucMoreThanP8sCnt >= TIMER_CNT_ZERO_POINT_EIGHT_SECOND ) //AD6 < 50 && timer >= 0.8s
                {
                    ucLessThanP8sCnt = 0;
                    ucMoreThanP8sCnt = 0;

                    mainLoopStep = MAIN_LOOP_STEP_THIRD;
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
                        if((getAdOriginalCh6Value() < AD6_COMPARE_VALUE_4))
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

                            mainLoopStep = MAIN_LOOP_STEP_FIRST;
                            ucADC4_Step = ADC4_STEP_INIT;

                            waitLoopStep  = WAITING_LOOP_STEP1;

                            ucCompareStep = COMPARE_STEP0;
                        }

                        if(ucMoreThanP3sCnt >= TIMER_CNT_ZERO_POINT_THREE_SECOND) //AD6 >= 50
                        {
                            ucLessThanP3sCnt = 0;
                            ucMoreThanP3sCnt = 0;

                            mainLoopStep = MAIN_LOOP_STEP_THIRD;
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

                mainLoopStep = MAIN_LOOP_STEP_THIRD;

                ucTimerOnBehaviorStep = 0;
            }
            break;
        }

    default:
        break;
    }

}

