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

static unsigned char bTwentySecStartFlag = 0, bBigTimerStartFlag = 0, bSmallTimerStartFlag = 0;

static unsigned char bOneHourTimerStartFlag = 0;

static unsigned char bTwentyMinStartFlag = 0;

static int uiSampleCh12[FILTER_N_CH12];

static  int uiSampleCh13[FILTER_N_CH13];



static void AD_Sample(void);

void switchSampleChannel(unsigned char ucCurrentChannel);


static void setPWM_Width(unsigned char ucWidth)
{
	static unsigned char ucOldWidth = 0;

	if( ucOldWidth !=  ucWidth)
	{
		CCPR1L = ucWidth;
		ucOldWidth = ucWidth;
	}
}

unsigned int FilterCh13()
 {
#ifdef DEBUG_CONFIRM_OK
	static  int uiSampleCh13[FILTER_N_CH13];

	 for(unsigned char ucValue = 0; ucValue < FILTER_N_CH13;ucValue++ )
	   {
		   unsigned int x = 0;
		   cout<<"请输入数组的值:"<<endl;
		   cin >> x;
		   uiSampleCh13[ucValue] = x;

	   }

#endif

   unsigned char i = 0, j = 0;

   unsigned  int filter_temp = 0, filter_sum = 0;



  for(j = 0; j < FILTER_N_CH13 - 1; j++)
  {
     for(i = 0; i < FILTER_N_CH13 - 1 - j; i++)
     {
       if(uiSampleCh13[i] > uiSampleCh13[i + 1])
       {

         filter_temp = uiSampleCh13[i];

         uiSampleCh13[i] = uiSampleCh13[i + 1];

         uiSampleCh13[i + 1] = filter_temp;
       }
     }
   }

#ifdef DEBUG_CONFIRM_OK
  for(unsigned char ucValue = 0; ucValue < FILTER_N_CH13;ucValue++ )
 {
   cout<<"输出数组的值:"<<endl;
   cout<<uiSampleCh13[ucValue]<<endl;
 }
#endif

  for(i = 2; i < FILTER_N_CH13 - 2; i++)
  {
	  filter_sum += uiSampleCh13[i];
  }

#ifdef DEBUG_CONFIRM_OK
  cout<<filter_sum<<endl;

  cout<<(filter_sum >> RIGHT_SHIFT_NUMBER_CH13)<<endl;
#endif
   return (filter_sum >> RIGHT_SHIFT_NUMBER_CH13);

 }


 unsigned int FilterCh12()//(int *tmpValue)
 {

#ifdef DEBUG_CONFIRM_OK
	static  int uiSampleCh12[FILTER_N];

	 for(unsigned char ucValue = 0; ucValue < FILTER_N;ucValue++ )
	   {
		   unsigned int x = 0;
		   cout<<"请输入数组的值:"<<endl;
		   cin >> x;
		   uiSampleCh12[ucValue] = x;
	   }

#endif

	   unsigned char i = 0, j = 0;

	   unsigned  int filter_temp = 0, filter_sum = 0;

	//   unsigned int filter_buf[FILTER_N];
	//
	//   for(int cir = 0;cir < FILTER_N; cir++)
	//	   filter_buf[cir] = *tmpValue++;



	  for(j = 0; j < FILTER_N_CH12 - 1; j++)
	  {
	     for(i = 0; i < FILTER_N_CH12 - 1 - j; i++)
	     {
	       if(uiSampleCh12[i] > uiSampleCh12[i + 1])
	       {

	         filter_temp = uiSampleCh12[i];

	         uiSampleCh12[i] = uiSampleCh12[i + 1];

	         uiSampleCh12[i + 1] = filter_temp;
	       }
	     }
	   }

#ifdef DEBUG_CONFIRM_OK
  for(unsigned char ucValue = 0; ucValue < FILTER_N;ucValue++ )
 {
   cout<<"输出数组的值:"<<endl;
   cout<<uiSampleCh12[ucValue]<<endl;
 }
#endif

	  for(i = FILTER_MAX_MIN_VALUE_CH12; i < FILTER_N_CH12 - FILTER_MAX_MIN_VALUE_CH12; i++)
	  {
		  filter_sum += uiSampleCh12[i];
	  }
#ifdef DEBUG_CONFIRM_OK
  cout<<filter_sum<<endl;

  cout<<(filter_sum >> RIGHT_SHIFT_NUMBER)<<endl;
#endif

	   return (filter_sum >> RIGHT_SHIFT_NUMBER);

}


 void vPutSampleDataIntoTable(unsigned int uiSampleData,unsigned char channel)
 {

	 static unsigned char ucCh12Length = 0;

	 static unsigned char ucCh13Length = 0;

	 if(channel == AD_CHANNEL_12_CHANNEL)
	 {
		 if(ucCh12Length < FILTER_N_CH12)
		 {
			 uiSampleCh12[ucCh12Length] = uiSampleData;

			 ucCh12Length++;

			 if( FILTER_N_CH12 == ucCh12Length )
			 {
				 ucCh12Length = 0;

				 unsigned int uiCalWidth = 0;

				 static unsigned char uiInitWidth = PWM_DEFAULT_THIRTY_WIDTH;//width of PWM 30%

				 disable_AD_interrupt();

				 uiCalWidth = FilterCh12();// when the value of AD12 is five, filter and calculate the average value.

				 if(uiCalWidth > COMPARE_REFERENCE_VALUE)
				 {
					// unsigned int uiTmpValue =(uiCalWidth - COMPARE_REFERENCE_VALUE)>> 3;

					 uiInitWidth++;// = uiInitWidth + uiTmpValue + 1;
				 }
				 else if(uiCalWidth < COMPARE_REFERENCE_VALUE)
				 {
				//	 unsigned int uiTmpValue =  (COMPARE_REFERENCE_VALUE - uiCalWidth)>> 3;

					 uiInitWidth--;// = uiInitWidth - uiTmpValue - 1;
				 }
				 else
					 ;//do nothing

				 if(uiInitWidth > PWM_FREQUENCY)
					 uiInitWidth = PWM_FREQUENCY;

				 if(uiInitWidth < PWM_DEFAULT_THIRTY_WIDTH)
					 uiInitWidth = PWM_DEFAULT_THIRTY_WIDTH;
				 else
					 ;//do nothing

				 setPWM_Width(uiInitWidth);
				 switchSampleChannel( AD_CHANNEL_12_CHANNEL );
				 enable_AD_interrupt();
			 }
		 }
	 }
	 else if(channel == AD_CHANNEL_13_CHANNEL)
	 {
		 if(ucCh13Length < FILTER_N_CH13)
		 {
			 uiSampleCh13[ucCh13Length] = uiSampleData;

			 ucCh13Length++;
			if( FILTER_N_CH13 == ucCh13Length)
			{
				ucCh13Length = 0;
				switchSampleChannel( AD_CHANNEL_13_CHANNEL );
			}
		 }
	 }
	 else
	 {
		 ucCh12Length = 0;

		 ucCh13Length = 0;

		 for(int i = 0;i < FILTER_N_CH12; i++)
		 {
			 uiSampleCh12[i] = 0;

			 uiSampleCh13[i] = 0;

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

//void disableAnalongSampeInterrupt( void)
//{
//	ADIE = 0;
//}
//
//void enableAnalongSampeInterrupt(void)
//{
//	ADIE = 1;
//}


//unsigned int getAdOriginalValue()
//{
//	return adc_original_value;
//}

unsigned int getAdOriginalCh12Value()
{

#ifdef USING_AD_FILTER_ALGORITHMN
	return FilterCh12();

#else
	return  adc_original_CH1_value;
#endif
}


unsigned int getAdOriginalCh13Value()
{
#ifdef USING_AD_FILTER_ALGORITHMN
	return FilterCh13();

#else
	return adc_original_CH4_value;
#endif
}


void switchSampleChannel(unsigned char ucCurrentChannel)
{
	if(AD_CHANNEL_12_CHANNEL == ucCurrentChannel)
	{
		sampleChannelSelect = AD_CHANNEL_13_CHANNEL;
		adc_test_init(AD_CHANNEL_13_CHANNEL,ADC_REF_2P1);
	}
	else
	{
		sampleChannelSelect = AD_CHANNEL_12_CHANNEL;
		adc_test_init(AD_CHANNEL_12_CHANNEL,ADC_REF_2P1);
	}

}

//void process_AD_Converter_Value()
//{
//	if(getAD_ConvertFlag())
//	{
//		setAD_ConvertFlag(0);
//		AD_Sample();
//		if(AD_CHANNEL_12_CHANNEL == sampleChannelSelect)
//			adc_test_init(AD_CHANNEL_12_CHANNEL,ADC_REF_2P1);
//		else
//			adc_test_init(AD_CHANNEL_13_CHANNEL,ADC_REF_2P1);
//		adc_start();	//ADC启动
//	}
//}

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
	if(sampleTimes < FILTER_N_CH12)
	{
		sampleTimes++;

		if(sampleTimes >= FILTER_N_CH12)
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


void clearTwentySecondsTimer()
{
	uiTwentySecondsTimer = 0;
	bTwentySecStartFlag = 0;
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


void startTwentySecondsTimer()
{
	if(( 0 == uiTwentySecondsTimer) && ( 0 == bTwentySecStartFlag))
	{
		uiTwentySecondsTimer = 20;
		bTwentySecStartFlag = 1;
	}
}



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


unsigned char isFinishedTwentySecondsTimer()
{
	if(( 0 == uiTwentySecondsTimer ) && bTwentySecStartFlag )
	{
		bTwentySecStartFlag = 0;
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

//static void refreshWidth(void)
//{
//	static uchar ucRefresh10ms = 0;
//
//	if(ucRefresh10ms < (LOAD_PWM_STEP -1))
//			ucRefresh10ms++;
//	else
//	{
//		ucRefresh10ms = 0;
//
//		 unsigned int uiCalWidth = 0;
//
//		 static unsigned char uiInitWidth = PWM_DEFAULT_THIRTY_WIDTH;//width of PWM 30%
//
//		 uiCalWidth = FilterCh12();//(uiSampleChannelFirst);// when the value of AD12 is five, filter and calculate the average value.
//
//		 if(uiCalWidth > COMPARE_REFERENCE_VALUE)
//		 {
//			 unsigned int uiTmpValue =  (uiCalWidth - COMPARE_REFERENCE_VALUE)/5;
//
//			 uiInitWidth = uiInitWidth + uiTmpValue + 1;
//		 }
//		 else if(uiCalWidth < COMPARE_REFERENCE_VALUE)
//		 {
//			 unsigned int uiTmpValue =  (COMPARE_REFERENCE_VALUE - uiCalWidth)/5;
//
//			 uiInitWidth = uiInitWidth - uiTmpValue - 1;
//		 }
//		 else
//			 ;//do nothing
//
//		 if(uiInitWidth > PWM_FREQUENCY)
//			 uiInitWidth = PWM_FREQUENCY;
//
//		 if(uiInitWidth < PWM_DEFAULT_THIRTY_WIDTH)
//			 uiInitWidth = PWM_DEFAULT_THIRTY_WIDTH;
//		 else
//			 ;//do nothing
//
//		 setPWM_Width(uiInitWidth);
//	}
//
//}

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
			vPutSampleDataIntoTable(adc_get(),AD_CHANNEL_12_CHANNEL);
		}
		else
		{
			vPutSampleDataIntoTable(adc_get(),AD_CHANNEL_13_CHANNEL);

		}
    }
}
