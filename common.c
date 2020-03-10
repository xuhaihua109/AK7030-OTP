#include <stdio.h>
#include "yn8p520.h"
#include "common.h"
#include "periph.h"





#define TEMP_MAX_CONTINOUS_SAMPLE_TIMES 12

#define TEMP_MAX_CONVERT_MACHINE_CYCLE  10

#define RIGHT_SHIFT_NUMBER    2    // mean to divide 4

static uchar adc_convert_flag = 0;

#define FILTER_N   12

#ifndef USING_AD_FILTER_ALGORITHMN
static uint adc_original_CH1_value = 0,adc_original_CH14_value = 0,adc_original_CH4_value = 0;
#endif

//static uint buffer_Sample_AD_Value[TEMP_MAX_CONTINOUS_SAMPLE_TIMES];
static uchar sampleTimes;
static uchar sampleChannelSelect = AD_CHANNEL_0_CHANNEL;
//static uint multiFilterMaxValue,multiFilterMinValue,multiFilterSumValue;
//static uint sampleCH14Value,sampleCH4Value,sampleCH1Value;

typedef struct
{
	unsigned char timer10msStopWatch;

}TimeStopWatch;

static unsigned char bPause20secTimer = 0;

static  TimeStopWatch timer;

static unsigned int uiBigTimer = 0,uiSmallTimer = 0;

static unsigned int uiTwentySecondsTimer = 0,uiTwentyMinuteTimer = 0;

static unsigned char bTwentyMinStartFlag= 0, bTwentySecStartFlag = 0, bBigTimerStartFlag = 0, bSmallTimerStartFlag = 0;

static  int uiSampleChannelZero[FILTER_N];

 static  int uiSampleChannelSecond[FILTER_N];

 static  int uiSampleChannelFifth[FILTER_N];

 static  int uiSampleChannelSixth[FILTER_N];


static void AD_Sample(void);


void vPause20sTimer(unsigned char bValue)
{
	bPause20secTimer = bValue;
}




 unsigned int Filter(int *tmpValue)
 {

   unsigned char i = 0, j = 0;

   unsigned  int filter_temp = 0, filter_sum = 0;

   unsigned int filter_buf[FILTER_N];

   for(int cir = 0;cir < FILTER_N; cir++)
	   filter_buf[cir] = *tmpValue++;


  for(j = 0; j < FILTER_N - 1; j++)
  {
     for(i = 0; i < FILTER_N - 1 - j; i++)
     {
       if(filter_buf[i] > filter_buf[i + 1])
       {

         filter_temp = filter_buf[i];

         filter_buf[i] = filter_buf[i + 1];

         filter_buf[i + 1] = filter_temp;
       }
     }
   }

  for(i = 2; i < FILTER_N - 2; i++)
  {
	  filter_sum += filter_buf[i];
  }

   return (filter_sum >> 3);

 }





 void vPutSampleDataIntoTable(unsigned int uiSampleData,unsigned char channel)
 {

	 static unsigned char ucChannelZeroLength = 0;

	 static unsigned char ucChannelSecondLength = 0;

	 static unsigned char ucChannelFifthLength = 0;

	 static unsigned char ucChannelSixthLength = 0;

	 if(channel == AD_CHANNEL_0_CHANNEL)
	 {
		 if(ucChannelZeroLength < FILTER_N)
		 {
			 uiSampleChannelZero[ucChannelZeroLength] = uiSampleData;

			 ucChannelZeroLength++;
		 }
		 else
		 {
			 ucChannelZeroLength = 0;

			 uiSampleChannelZero[ucChannelZeroLength] = uiSampleData;
		 }
	 }
	 else if(channel == AD_CHANNEL_2_CHANNEL)
	 {
		 if(ucChannelSecondLength < FILTER_N)
		 {
			 uiSampleChannelSecond[ucChannelSecondLength] = uiSampleData;

			ucChannelSecondLength++;
		 }
		 else
		 {
			ucChannelSecondLength = 0;

			 uiSampleChannelSecond[ucChannelSecondLength] = uiSampleData;
		 }
	 }
	 else if(channel == AD_CHANNEL_5_CHANNEL)
	 {
		 if(ucChannelFifthLength < FILTER_N)
		 {
			 uiSampleChannelFifth[ucChannelFifthLength] = uiSampleData;

			 ucChannelFifthLength++;
		 }
		 else
		 {
			 ucChannelFifthLength = 0;

			 uiSampleChannelFifth[ucChannelFifthLength] = uiSampleData;
		 }
	 }
	 else if(channel == AD_CHANNEL_6_CHANNEL)
	 {
		 if(ucChannelSixthLength < FILTER_N)
		 {
			 uiSampleChannelSixth[ucChannelSixthLength] = uiSampleData;

			 ucChannelSixthLength++;
		 }
		 else
		 {
			 ucChannelSixthLength = 0;

			 uiSampleChannelSixth[ucChannelSixthLength] = uiSampleData;
		 }
	 }
	 else
	 {
		 ucChannelZeroLength = 0;

		 ucChannelSecondLength = 0;

		 ucChannelFifthLength = 0;

		 ucChannelSixthLength = 0;

		 for(int i = 0;i < FILTER_N; i++)
		 {
			 uiSampleChannelZero[i] = 0;

			 uiSampleChannelSecond[i] = 0;

			 uiSampleChannelFifth[i] = 0;

			 uiSampleChannelSixth[i] = 0;

		 }
	 }
 }


void clock_config()
{
	// Systen clock config
	CLKPR = 0x80; 		// divide 1  允许更新CLKPS位CLKPCE更新时CLKPS[1:0]必须同时写入 2’b00，4T清零 系统时钟
	CLKPR = 0x00;		//禁止更新 CLKPS 位
	while(CLKPCE);
}

void timer1_config()
{
	//定时时间=(0XFFFF+1-TMR1H:TMR1L)*预分频值*4/Fosc
	TMR1H=0xCF;  // TIMER1高8bit设置初始值  5ms定时
	TMR1L=0x2C;  // TIMER1低8bit设置初始值
	T1CON=0xE1;  // TIMER1工作时钟为内部FOSC/4，预分频4，
	TMR1IE=1;    // TIMER1中断使能

}



void timer1_interrupt_config()
{
	GIE = 1; //enable global interrupt
	PEIE = 1; //enable
}



uchar getAD_ConvertFlag()
{
	return adc_convert_flag;
}


void  setAD_ConvertFlag(uchar flag)
{
	adc_convert_flag = flag;
}


//unsigned int getAdOriginalValue()
//{
//	return adc_original_value;
//}

unsigned int getAdOriginalCh1Value()
{

#ifdef USING_AD_FILTER_ALGORITHMN
	return Filter(uiSampleChannelZero);

#else
	return  adc_original_CH1_value;
#endif
}



unsigned int getAdOriginalCh0Value()
{
#ifdef USING_AD_FILTER_ALGORITHMN
	return Filter(uiSampleChannelZero);
#else
	return adc_original_CH14_value;
#endif
}

unsigned int getAdOriginalCh5Value()
{
#ifdef USING_AD_FILTER_ALGORITHMN
	return Filter(uiSampleChannelFifth);
#else
	return adc_original_CH14_value;
#endif
}


unsigned int getAdOriginalCh6Value()
{
#ifdef USING_AD_FILTER_ALGORITHMN
	return Filter(uiSampleChannelSixth);
#else
	return adc_original_CH14_value;
#endif
}

unsigned int getAdOriginalCh2Value()
{
#ifdef USING_AD_FILTER_ALGORITHMN
	return Filter(uiSampleChannelSecond);
#else
	return adc_original_CH14_value;
#endif
}



void process_AD_Converter_Value()
{
	if(getAD_ConvertFlag())
	{
		setAD_ConvertFlag(0);
		AD_Sample();
//		if(AD_CHANNEL_0_CHANNEL == sampleChannelSelect)
//			adc_test_init(AD_CHANNEL_5_CHANNEL,ADC_REF_2P1);
//		else if(AD_CHANNEL_2_CHANNEL == sampleChannelSelect)
//			adc_test_init(AD_CHANNEL_5_CHANNEL,ADC_REF_2P1);
//		else if(AD_CHANNEL_5_CHANNEL == sampleChannelSelect)
//					adc_test_init(AD_CHANNEL_6_CHANNEL,ADC_REF_2P1);
//		else
//			adc_test_init(AD_CHANNEL_0_CHANNEL,ADC_REF_2P1);
//		setAdcSampleChannel(sampleChannelSelect);


		adc_start();	//ADC启动
	}
}

/******************************************************************
*  Name        :void AD_Sample(void)
*Description   :AD sample for channel 1 and 2
* Arguments   :none
* Return        :none
*Created date :2011/08/19
*Modified date:
*   Notes     :
******************************************************************/
static void AD_Sample(void)
{
	if(sampleTimes < TEMP_MAX_CONTINOUS_SAMPLE_TIMES)
	{

		sampleTimes++;

		if(sampleTimes >= FILTER_N)
		{
			sampleTimes = 0;

			if(sampleChannelSelect == AD_CHANNEL_0_CHANNEL)
			{
				  //filter max and min value,then calculate average value
//				sampleCH14Value = ((multiFilterSumValue - multiFilterMaxValue - multiFilterMinValue))>> RIGHT_SHIFT_NUMBER;
				sampleChannelSelect = AD_CHANNEL_2_CHANNEL;
			}
			else if(sampleChannelSelect == AD_CHANNEL_2_CHANNEL)
			{
//				sampleCH4Value = ((multiFilterSumValue - multiFilterMaxValue - multiFilterMinValue))>> RIGHT_SHIFT_NUMBER;
				sampleChannelSelect = AD_CHANNEL_5_CHANNEL;
			}
			else if(sampleChannelSelect == AD_CHANNEL_5_CHANNEL)
			{
//				sampleCH1Value = ((multiFilterSumValue - multiFilterMaxValue - multiFilterMinValue))>> RIGHT_SHIFT_NUMBER;
				sampleChannelSelect = AD_CHANNEL_6_CHANNEL;
			}
			else
			{
//				sampleCH14Value = ((multiFilterSumValue - multiFilterMaxValue - multiFilterMinValue))>> RIGHT_SHIFT_NUMBER;
				sampleChannelSelect = AD_CHANNEL_0_CHANNEL;
			}

//			for(uchar index = 0; index < TEMP_MAX_CONTINOUS_SAMPLE_TIMES;index++)
//				buffer_Sample_AD_Value[index] = 0;

			adc_test_init(sampleChannelSelect,ADC_REF_2P1);

		}
	}
}



//unsigned int getAdCh4Value()
//{
//	return sampleCH4Value;
//}
//
//
//unsigned int getAdCh14Value()
//{
//	return sampleCH14Value;
//}

void setDAC0_ChannelValue(unsigned char ucValue)
{
	DACR0=ucValue;
}

void startTwelveHourTimer(unsigned int uiSetTime )
{
	if((0 == uiBigTimer) && ( 0 == bBigTimerStartFlag))
	{
	  uiBigTimer = uiSetTime;//43200; // 43200s = 12h
	  bBigTimerStartFlag = 1;
	}

#ifdef DEBUG_FUNCITON

	uiBigTimer = 570;
#endif
}

void clearTwelveHoursTimer()
{
	uiBigTimer = 0;
	bBigTimerStartFlag = 0;
}


void clearThreeHoursTimer()
{
	uiSmallTimer = 0;
	bSmallTimerStartFlag = 0;
}

void clearTwentySecondsTimer()
{
	uiTwentySecondsTimer = 0;
	bTwentySecStartFlag = 0;
	bPause20secTimer = 0;
}


void clearTwentyMinuteTimer()
{
	uiTwentyMinuteTimer = 0;
	bTwentyMinStartFlag = 0;
}


void startThreeHoursTimer(unsigned int uiSetTime)
{
	if(( 0 == uiSmallTimer ) && ( 0 == bSmallTimerStartFlag ))
	{
		uiSmallTimer = uiSetTime;//10800; //3600*3 = 3h
		bSmallTimerStartFlag = 1;
	}
#ifdef DEBUG_FUNCITON

	uiSmallTimer = 180;
#endif
}


void startTwentySecondsTimer()
{
	if(( 0 == uiTwentySecondsTimer) && ( 0 == bTwentySecStartFlag))
	{
		uiTwentySecondsTimer = 20;
		bTwentySecStartFlag = 1;
	}
}


void startTwentyMinuteTimer( unsigned int uiValue )
{
	if(( 0 == uiTwentyMinuteTimer) && ( 0 == bTwentyMinStartFlag))
	{
		uiTwentyMinuteTimer = uiValue;
		bTwentyMinStartFlag = 1;
	}
}


unsigned char isFinishedTwentySecondsTimer()
{
	if(( 0 == uiTwentySecondsTimer ) && bTwentySecStartFlag )
	{
//		bTwentySecStartFlag = 0;
		return 1;
	}
	else
		return 0;
}


unsigned char isFinishedTwentyMinuteTimer()
{
	if(( 0 == uiTwentyMinuteTimer ) && bTwentyMinStartFlag )
	{
		bTwentyMinStartFlag = 0;
		return 1;
	}
	else
		return 0;
}


unsigned char isFinishedTwelveHoursTimer()
{
	if(( uiBigTimer == 0 ) && bBigTimerStartFlag )
	{
		bBigTimerStartFlag = 0;
		return 1;
	}
	else
		return 0;
}

unsigned char isFinishedThreeHoursTimer()
{
	if((uiSmallTimer == 0) && bSmallTimerStartFlag)
	{
		bSmallTimerStartFlag = 0;
		return 1;
	}
	else
		return 0;
}

unsigned char isPermitSampleTime()
{
	if(timer.timer10msStopWatch >= 10) //10*10ms = 100ms
	{
		return 1;
	}
	else
		return 0;
}

void clrSampeTime()
{
	timer.timer10msStopWatch = 0;
}

void interrupt ISR(void)
{
	static uchar ucTimer1sCnt = 0;

	if(TMR1IF == 1)  //this is a timer interrupt for 10ms
    {
		TMR1IF = 0 ;
		timer.timer10msStopWatch++;
		ucTimer1sCnt++;

		if(ucTimer1sCnt >= 100)// 100*10ms = 1s
		{
			ucTimer1sCnt = 0;
			if(uiBigTimer > 0)
				uiBigTimer--;

			if(uiSmallTimer)
				uiSmallTimer--;

			if((uiTwentySecondsTimer)&& (0 == bPause20secTimer))
				uiTwentySecondsTimer--;

			if((uiTwentyMinuteTimer))
			    uiTwentyMinuteTimer--;
		}
    }

	if(ADIF)
	{
		ADIF=0;
		setAD_ConvertFlag(1);
		vPutSampleDataIntoTable(adc_get(),sampleChannelSelect);
//		adc_original_value = adc_get();
//		if(sampleChannelSelect == AD_CHANNEL_5_CHANNEL)
//		{
//
//#ifdef USING_AD_FILTER_ALGORITHMN
//			vPutSampleDataIntoTable(adc_get(),AD_CHANNEL_5_CHANNEL);
//#else
//			adc_original_CH4_value = adc_get();//getAdCh4Value();
//#endif
//		}
//		else if(sampleChannelSelect == AD_CHANNEL_1_CHANNEL)
//		{
//#ifdef USING_AD_FILTER_ALGORITHMN
//			vPutSampleDataIntoTable(adc_get(),AD_CHANNEL_1_CHANNEL);
//#else
//			adc_original_CH1_value = adc_get();//getAdCh1Value();
//#endif
//
//		}
//		else
//		{
//#ifndef USING_AD_FILTER_ALGORITHMN
//			adc_original_CH14_value = adc_get();//getAdCh14Value();
//#else
//			vPutSampleDataIntoTable(adc_get(),AD_CHANNEL_14_CHANNEL);
//#endif
//		}

	 }
}
