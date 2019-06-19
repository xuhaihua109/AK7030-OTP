#include <stdio.h>
#include "yn8p520.h"
#include "common.h"
#include "periph.h"

#define TEMP_MAX_CONTINOUS_SAMPLE_TIMES 6

#define TEMP_MAX_CONVERT_MACHINE_CYCLE  10

#define RIGHT_SHIFT_NUMBER    2    // mean to divide 4

static uchar adc_convert_flag = 0;

static uint adc_original_value = 0, adc_original_CH1_value = 0,adc_original_CH14_value = 0,adc_original_CH4_value = 0;

static uint buffer_Sample_AD_Value[TEMP_MAX_CONTINOUS_SAMPLE_TIMES];
static uchar sampleTimes;
static uchar sampleChannelSelect = AD_CHANNEL_14_CHANNEL;
static uint multiFilterMaxValue,multiFilterMinValue,multiFilterSumValue;
static uint sampleCH14Value,sampleCH4Value,sampleCH1Value;

typedef struct
{
	unsigned char timer10msStopWatch;

}TimeStopWatch;

static  TimeStopWatch timer;

static unsigned int uiBigTimer = 0,uiSmallTimer = 0;

static unsigned int uiTwentySecondsTimer = 0;


static void AD_Sample(void);

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


unsigned int getAdOriginalValue()
{
	return adc_original_value;
}

unsigned int getAdOriginalCh1Value()
{
	return adc_original_CH1_value;
}


unsigned int getAdOriginaCh4Value()
{
	return adc_original_CH4_value;
}


unsigned int getAdOriginalCh14Value()
{
	return adc_original_CH14_value;
}



void process_AD_Converter_Value()
{
	if(getAD_ConvertFlag())
	{
		setAD_ConvertFlag(0);
		AD_Sample();
		if(AD_CHANNEL_4_CHANNEL == sampleChannelSelect)
			adc_test_init(AD_CHANNEL_4_CHANNEL,ADC_REF_2P1);
		else if(AD_CHANNEL_1_CHANNEL == sampleChannelSelect)
			adc_test_init(AD_CHANNEL_1_CHANNEL,ADC_REF_2P1);
		else
			adc_test_init(AD_CHANNEL_14_CHANNEL,ADC_REF_2P1);
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

		buffer_Sample_AD_Value[sampleTimes] = getAdOriginalValue();

		if(sampleTimes == 0)
		{
			multiFilterMaxValue = buffer_Sample_AD_Value[0];
			multiFilterMinValue = buffer_Sample_AD_Value[0];
		}

		if(multiFilterMaxValue < buffer_Sample_AD_Value[sampleTimes])
		{
			multiFilterMaxValue = buffer_Sample_AD_Value[sampleTimes];
		}
		if(multiFilterMinValue > buffer_Sample_AD_Value[sampleTimes])
		{
			multiFilterMinValue = buffer_Sample_AD_Value[sampleTimes];
		}

		multiFilterSumValue = multiFilterSumValue + buffer_Sample_AD_Value[sampleTimes];

		sampleTimes++;

		if(sampleTimes >= TEMP_MAX_CONTINOUS_SAMPLE_TIMES)
		{
			sampleTimes = 0;

			if(sampleChannelSelect == AD_CHANNEL_14_CHANNEL)
			{
				  //filter max and min value,then calculate average value
				sampleCH14Value = ((multiFilterSumValue - multiFilterMaxValue - multiFilterMinValue))>> RIGHT_SHIFT_NUMBER;
				sampleChannelSelect = AD_CHANNEL_4_CHANNEL;
			}
			else if(sampleChannelSelect == AD_CHANNEL_4_CHANNEL)
			{
				sampleCH4Value = ((multiFilterSumValue - multiFilterMaxValue - multiFilterMinValue))>> RIGHT_SHIFT_NUMBER;
				sampleChannelSelect = AD_CHANNEL_1_CHANNEL;
			}
			else if(sampleChannelSelect == AD_CHANNEL_1_CHANNEL)
			{
				sampleCH1Value = ((multiFilterSumValue - multiFilterMaxValue - multiFilterMinValue))>> RIGHT_SHIFT_NUMBER;
				sampleChannelSelect = AD_CHANNEL_14_CHANNEL;
			}
			else
			{
				sampleCH14Value = ((multiFilterSumValue - multiFilterMaxValue - multiFilterMinValue))>> RIGHT_SHIFT_NUMBER;
				sampleChannelSelect = AD_CHANNEL_14_CHANNEL;
			}

			for(uchar index = 0; index < TEMP_MAX_CONTINOUS_SAMPLE_TIMES;index++)
				buffer_Sample_AD_Value[index] = 0;

		}
	}
}



unsigned int getAdCh4Value()
{
	return sampleCH4Value;
}


unsigned int getAdCh14Value()
{
	return sampleCH14Value;
}

void setDAC0_ChannelValue(unsigned char ucValue)
{
	DACR0=ucValue;
}

void startTwelveHourTimer(unsigned int uiSetTime )
{
	if(0 == uiBigTimer)
	  uiBigTimer = uiSetTime;//43200; // 43200s = 12h

#ifdef DEBUG_FUNCITON

	uiBigTimer = 570;
#endif
}

void clearTwelveHoursTimer()
{
	uiBigTimer = 0;
}


void clearThreeHoursTimer()
{
	uiSmallTimer = 0;
}

void clearTwentySecondsTimer()
{
	uiTwentySecondsTimer = 0;
}


void startThreeHoursTimer(unsigned int uiSetTime)
{
	if(0 == uiSmallTimer)
		uiSmallTimer = uiSetTime;//10800; //3600*3 = 3h
#ifdef DEBUG_FUNCITON

	uiSmallTimer = 180;
#endif
}


void startTwentySecondsTimer()
{
	uiTwentySecondsTimer = 20;
}


unsigned char isFinishedTwentySecondsTimer()
{
	if(0 == uiTwentySecondsTimer)
		return 1;
	else
		return 0;
}


unsigned char isFinishedTwelveHoursTimer()
{
	if(uiBigTimer == 0)
		return 1;
	else
		return 0;
}

unsigned char isFinishedThreeHoursTimer()
{
	if(uiSmallTimer == 0)
		return 1;
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

			if(uiTwentySecondsTimer)
				uiTwentySecondsTimer--;
		}
    }

	if(ADIF)
	   {
		ADIF=0;
		setAD_ConvertFlag(1);
		adc_original_value = adc_get();
		if(sampleChannelSelect == AD_CHANNEL_4_CHANNEL)
			adc_original_CH4_value = adc_get();//getAdCh4Value();
		else if(sampleChannelSelect == AD_CHANNEL_1_CHANNEL)
			adc_original_CH1_value = adc_get();//getAdCh4Value();
		else
			adc_original_CH14_value = adc_get();//getAdCh14Value();

	   }
}
