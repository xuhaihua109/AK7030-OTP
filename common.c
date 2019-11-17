#include <stdio.h>
#include "yn8p520.h"
#include "common.h"
#include "periph.h"





#define TEMP_MAX_CONTINOUS_SAMPLE_TIMES 12

#define TEMP_MAX_CONVERT_MACHINE_CYCLE  10



static uchar adc_convert_flag = 0;

#ifndef USING_AD_FILTER_ALGORITHMN
static uint adc_original_CH1_value = 0,adc_original_CH14_value = 0,adc_original_CH4_value = 0;
#endif

//static uint buffer_Sample_AD_Value[TEMP_MAX_CONTINOUS_SAMPLE_TIMES];
static uchar sampleTimes;
static uchar sampleChannelSelect = AD_CHANNEL_12_CHANNEL;
//static uint multiFilterMaxValue,multiFilterMinValue,multiFilterSumValue;
//static uint sampleCH14Value,sampleCH4Value,sampleCH1Value;

typedef struct
{
	unsigned char timer10msStopWatch;

}TimeStopWatch;

static  TimeStopWatch timer;

static unsigned int uiBigTimer = 0,uiSmallTimer = 0;

static unsigned int uiTwentySecondsTimer = 0;

static unsigned int uiOneHourTimer = 0;

static unsigned int uiTwentyMinTimer = 0;

static unsigned char  bBigTimerStartFlag = 0, bSmallTimerStartFlag = 0;

static unsigned char bOneHourTimerStartFlag = 0;

static unsigned char bTwentyMinStartFlag = 0;

static unsigned char bWaitResetFlag = 0;

static void AD_Sample(void);

void setWaitResetFlag(unsigned char bValue)
{
	bWaitResetFlag = bValue;
}

static unsigned char getWaitResetFlag(void)
{
	return bWaitResetFlag;
}

static void setPWM_Width(unsigned char ucWidth)
{
	static unsigned char ucOldWidth = 0;
	if( ucOldWidth !=  ucWidth)
	{
		CCPR1L = ucWidth;
		ucOldWidth = ucWidth;
	}
}

unsigned int FilterCh13(int *tmpValue)
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

for(i = FILTER_MAX_MIN_CNT; i < FILTER_N - FILTER_MAX_MIN_CNT; i++)
{
	  filter_sum += filter_buf[i];
}


return (filter_sum >> DIVIDER_NUMBER_CH13 );
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

  for(i = 1; i < FILTER_N - 1; i++)
  {
	  filter_sum += filter_buf[i];
  }

   
   return (filter_sum );

 }


 static  int uiSampleCh12[FILTER_N];

 static  int uiSampleCh13[FILTER_N_CH13];

 static  int uiSampleChannelFourteenth[FILTER_N];


 void vPutSampleDataIntoTable(unsigned int uiSampleData,unsigned char channel)
 {

	 static unsigned char ucCh12Length = 0;

	 static unsigned char ucCh13Length = 0;

	 static unsigned char ucChannelFourteenthLength = 0;
     static	unsigned int uiCalWidthArrayNew = 0;
     static	unsigned int uiCalWidthArrayOld = 0;
	 if(channel == AD_CHANNEL_12_CHANNEL)
	 {
		 if(ucCh12Length < FILTER_N)
		 {
			 uiSampleCh12[ucCh12Length] = uiSampleData;

			 ucCh12Length++;

			 if( FILTER_N == ucCh12Length )
			 {
				 ucCh12Length = 0;

				#define PWM_UPDATED_COUNT  1

				 static unsigned char bInitArrayFlag = 0;

				static	unsigned int uiCalWidthArray[PWM_UPDATED_COUNT],uiCalWidthCnt = 0;

				 static unsigned char uiInitWidth = PWM_DEFAULT_THIRTY_WIDTH;//width of PWM 30%

				 uiCalWidthArrayNew = Filter(uiSampleCh12);// when the value of AD12 is five, filter and calculate the average value.

				 unsigned int uiDeviationValue = 0,uiAbstractValue = 0;

				 if( uiCalWidthArrayNew >= uiCalWidthArrayOld)
					 uiAbstractValue = uiCalWidthArrayNew - uiCalWidthArrayOld;
				 else
					 uiAbstractValue = uiCalWidthArrayOld - uiCalWidthArrayNew;

				 uiDeviationValue = ((uiCalWidthArrayNew+uiCalWidthArrayOld)>>1)+ uiAbstractValue;

				 if(uiCalWidthCnt>400)
					uiDeviationValue =400;


				 uiCalWidthArrayOld=uiCalWidthArrayNew;
		//		 unsigned int uiCalWidth = 0,uiSum = 0;

				// uiCalWidth =  uiCalWidthArray[PWM_UPDATED_COUNT]+ uiCalWidthArray[PWM_UPDATED_COUNT]- uiCalWidthArray[PWM_UPDATED_COUNT-1];

				 if(uiDeviationValue > (COMPARE_REFERENCE_VALUE))
				 {
					 //unsigned int uiTmpValue =(uiDeviationValue - COMPARE_REFERENCE_VALUE)>> 2;

					 uiInitWidth++;
				   //uiInitWidth = uiInitWidth + uiTmpValue + 1;
				 }
				 else if(uiDeviationValue < (COMPARE_REFERENCE_VALUE))
				 {
					 //unsigned int uiTmpValue =  (COMPARE_REFERENCE_VALUE - uiDeviationValue)>> 2;

					 uiInitWidth--;
					//uiInitWidth = uiInitWidth - uiTmpValue - 1;
				 }
				 else
					 ;//do nothing

				 if(uiInitWidth > PWM_FREQUENCY)
					 uiInitWidth = PWM_FREQUENCY;

				 if(uiInitWidth < PWM_DEFAULT_THIRTY_WIDTH)
					 uiInitWidth = PWM_DEFAULT_THIRTY_WIDTH;
				 else
					 ;//do nothing

				 if( TRUE == getWaitResetFlag())
					 uiInitWidth = PWM_SIXTY_WIDTH;

				 setPWM_Width(uiInitWidth);
				 
				 
			 }
		 }
		 else
		 {
			 ucCh12Length = 0;

			 uiSampleCh12[ucCh12Length] = uiSampleData;
		 }
	 }
	 else if(channel == AD_CHANNEL_13_CHANNEL)
	 {
		 if(ucCh13Length < FILTER_N_CH13)
		 {
			 uiSampleCh13[ucCh13Length] = uiSampleData;

			 ucCh13Length++;
		 }
		 else
		 {
			 ucCh13Length = 0;

			uiSampleCh13[ucCh13Length] = uiSampleData;
		 }
	 }
	 else if(channel == AD_CHANNEL_14_CHANNEL)
	 {
		 if(ucChannelFourteenthLength < FILTER_N)
		 {
			 uiSampleChannelFourteenth[ucChannelFourteenthLength] = uiSampleData;

			 ucChannelFourteenthLength++;
		 }
		 else
		 {
			 ucChannelFourteenthLength = 0;

			 uiSampleCh13[ucChannelFourteenthLength] = uiSampleData;
		 }
	 }
	 else
	 {
		 ucCh12Length = 0;

		 ucCh13Length = 0;

		 ucChannelFourteenthLength = 0;

		 for(int i = 0;i < FILTER_N; i++)
		 {
			 uiSampleCh12[i] = 0;

			 uiSampleCh13[i] = 0;

			 uiSampleChannelFourteenth[i] = 0;

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

unsigned int getAdOriginalCh12Value()
{

#ifdef USING_AD_FILTER_ALGORITHMN
	return Filter(uiSampleCh12);

#else
	return  adc_original_CH1_value;
#endif
}


unsigned int getAdOriginalCh13Value()
{
#ifdef USING_AD_FILTER_ALGORITHMN
	return FilterCh13(uiSampleCh13);

#else
	return adc_original_CH4_value;
#endif
}


unsigned int getAdOriginalCh14Value()
{
#ifdef USING_AD_FILTER_ALGORITHMN
	return Filter(uiSampleChannelFourteenth);
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
		if(AD_CHANNEL_12_CHANNEL == sampleChannelSelect)
			adc_test_init(AD_CHANNEL_12_CHANNEL,ADC_REF_2P1);
		else
			adc_test_init(AD_CHANNEL_13_CHANNEL,ADC_REF_2P1);
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
	if(sampleTimes < FILTER_N)
	{
		sampleTimes++;

		if(sampleTimes >= FILTER_N)
		{
			sampleTimes = 0;

			if(sampleChannelSelect == AD_CHANNEL_12_CHANNEL)
			{
				sampleChannelSelect = AD_CHANNEL_13_CHANNEL;
			}

			else
			{
				sampleChannelSelect = AD_CHANNEL_12_CHANNEL;
			}
		}
	}
}


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

void clearOneHoursTimer()
{
	uiOneHourTimer = 0;
	bOneHourTimerStartFlag = 0;
}


void clearTwentyMinTimer()
{
	uiTwentyMinTimer = 0;
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

void startOneHoursTimer(unsigned int uiSetTime)
{
	if(( 0 == uiOneHourTimer ) && ( 0 == bOneHourTimerStartFlag ))
	{
		uiOneHourTimer = uiSetTime;//3600s = 1h
		bOneHourTimerStartFlag = 1;
	}
#ifdef DEBUG_FUNCITON

	uiOneHourTimer = 180;
#endif
}
//
//
//void startTwentySecondsTimer()
//{
//	if(( 0 == uiTwentySecondsTimer) && ( 0 == bTwentySecStartFlag))
//	{
//		uiTwentySecondsTimer = 20;
//		bTwentySecStartFlag = 1;
//	}
//}



void startTwentyMinTimer(unsigned int uiSetValue )
{
	if(( 0 == uiTwentyMinTimer) && ( 0 == bTwentyMinStartFlag))
	{
		uiTwentyMinTimer = uiSetValue;
		bTwentyMinStartFlag = 1;
	}
}


unsigned char isFinishedTwentyMinTimer()
{
	if(( 0 == uiTwentyMinTimer ) && bTwentyMinStartFlag )
	{
		bTwentyMinStartFlag = 0;
		return 1;
	}
	else
		return 0;
}
//
//
//unsigned char isFinishedTwentySecondsTimer()
//{
//	if(( 0 == uiTwentySecondsTimer ) && bTwentySecStartFlag )
//	{
//		bTwentySecStartFlag = 0;
//		return 1;
//	}
//	else
//		return 0;
//}


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



unsigned char isFinishedOneHoursTimer()
{
	if((uiOneHourTimer == 0) && bOneHourTimerStartFlag)
	{
		bOneHourTimerStartFlag = 0;
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

//		refreshWidth();

		if(ucTimer1sCnt >= 100)// 100*10ms = 1s
		{
			ucTimer1sCnt = 0;
			if(uiBigTimer > 0)
				uiBigTimer--;

			if(uiSmallTimer)
				uiSmallTimer--;

			if(uiTwentySecondsTimer)
				uiTwentySecondsTimer--;

			if(uiTwentyMinTimer)
				uiTwentyMinTimer--;

			if( uiOneHourTimer )
				uiOneHourTimer--;
		}
    }

	if(ADIF)
	   {

		ADIF=0;
		setAD_ConvertFlag(1);
//		adc_original_value = adc_get();
		if(sampleChannelSelect == AD_CHANNEL_12_CHANNEL)
		{

#ifdef USING_AD_FILTER_ALGORITHMN
			vPutSampleDataIntoTable(adc_get(),AD_CHANNEL_12_CHANNEL);
#else
			adc_original_CH4_value = adc_get();//getAdCh4Value();
#endif
		}
		else
		{
#ifndef USING_AD_FILTER_ALGORITHMN
			adc_original_CH14_value = adc_get();//getAdCh14Value();
#else
			vPutSampleDataIntoTable(adc_get(),AD_CHANNEL_13_CHANNEL);
#endif
		}

	   }
}
