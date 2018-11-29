#include <stdio.h>
#include "yn8p520.h"
#include "common.h"

#define TEMP_MAX_CONTINOUS_SAMPLE_TIMES 10

#define TEMP_MAX_CONVERT_MACHINE_CYCLE  10

#define RIGHT_SHIFT_NUMBER    3    // mean to divide 8

static uint buffer_Sample_AD_Value[TEMP_MAX_CONTINOUS_SAMPLE_TIMES];
static uchar sampleTimes;
static uchar sampleChannelSelect = AD_CHANNEL_13_CHANNEL;
static uint multiFilterMaxValue,multiFilterMinValue,multiFilterSumValue;
static uchar sampleCount;
static uint sampleCH13Value,sampleCH12Value;

typedef struct
{
	unsigned char timer10msStopWatch;

}TimeStopWatch;

static  TimeStopWatch timer;


static unsigned char ucTimer1sCnt = 0;
static unsigned int uiBigTimer = 0,uiSmallTimer = 0;

static void SetTempThermistorChannel(void);

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
	T1CON = 0xC4;// set 16bit timer, load automatically, no prescale, disable Timer1 32K ULP OSC,select interal  timer source
	TMR1H = 0xC3;
	TMR1L = 0x50; //0xC350 = 50000  5M = 0.2us    0.2us * 50000 = 10ms

}

void start_timer1()
{
	TMR1ON = 1; // start timer1
}

void timer1_interrupt_config()
{
	GIE = 1; //enable global interrupt
	PEIE = 1; //enable
	TMR1IE = 1;// enable timer1 overflow interrupt;
}

void adConverter_config()
{
	TRISB0 = 1;//set input as AD input
	TRISB2 = 1; //set input as AD input
	ADCON0 = 0xC4;//set right align for value,low speed for AD converting,select channel 12
	ADCON1 = 0xFE; //set Vref = 2.1V, sample = 20 Tad, converting clock Fosc/256 (because ADSP is zero)
	ADIE = 0;// disable AD interupt.
}


void start_AD_Converter()
{
	ADON = 1; //enable AD converter
}

void stop_AD_Converter()
{
	ADON = 0; //stop AD converter
}

unsigned char isAD_Completed()
{
	if(ADIF) // AD convert result , 1 means to be completed
		return 1;
	else
		return 0;
}

void clearAdCompleteFalg()
{
	ADIF = 0;
}

unsigned int getAdValue()
{
	unsigned int AdValue = 0,AdHighValue = 0;
	if(isAD_Completed()!=0)
	{
		ADIF = 0;//
		AdValue = ADRESL; //low 8 bit
		AdHighValue = ADRESH;
		AdHighValue = AdHighValue << 8;
		AdValue = AdValue | AdHighValue;
	}

	return AdValue;
}

void process_AD_Converter_Value()
{
	AD_Sample();
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
	if(sampleTimes == CLR)
	{
		SetTempThermistorChannel();
		multiFilterMaxValue = CLR;
		multiFilterMinValue = CLR;
		multiFilterSumValue = CLR;
		sampleCount = SET;
		start_AD_Converter();		// start AD convertion
	}

	if(sampleTimes < TEMP_MAX_CONTINOUS_SAMPLE_TIMES)
	{
		while(isAD_Completed() == CLR)  //convert completed flag bit
		{
			if(sampleCount <= TEMP_MAX_CONVERT_MACHINE_CYCLE)
			{
				sampleCount ++;
				if(isAD_Completed())//convert complete
				{
					clearAdCompleteFalg();
					stop_AD_Converter();
					break;
				}
			}
			else
			{
				sampleCount = CLR;
				sampleTimes = CLR;
				break;
			}
		}

		if(sampleCount != CLR)
		{
			buffer_Sample_AD_Value[sampleTimes] = getAdValue();
		}
		else
		{
			buffer_Sample_AD_Value[sampleTimes] = 2048;// 2^12 = 4096 . 4096 half is 2028
		}

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

		if(sampleTimes < TEMP_MAX_CONTINOUS_SAMPLE_TIMES)
		{
			start_AD_Converter();
		}
	}
	else
	{
		sampleTimes = CLR;

		stop_AD_Converter();

		if(sampleChannelSelect == AD_CHANNEL_13_CHANNEL)
		{
			  //filter max and min value,then calculate average value
			sampleCH13Value = ((multiFilterSumValue - multiFilterMaxValue - multiFilterMinValue))>> RIGHT_SHIFT_NUMBER;
		}
		else if(sampleChannelSelect == AD_CHANNEL_12_CHANNEL)
		{
			sampleCH12Value = ((multiFilterSumValue - multiFilterMaxValue - multiFilterMinValue))>> RIGHT_SHIFT_NUMBER;
		}


		if(sampleChannelSelect == AD_CHANNEL_13_CHANNEL)
		{
			sampleChannelSelect = AD_CHANNEL_12_CHANNEL;
		}
		else
		{
			sampleChannelSelect = AD_CHANNEL_13_CHANNEL;
		}
	}
}


/******************************************************************
*  Name       :IntiTempThermistorChannel
*Description  :initialize AD before converting
* Arguments   :unsigned char
* Return      :none
*Created date :2011/09/01
*Modified date:
*   Notes     :
******************************************************************/
static void SetTempThermistorChannel(void)
{
//	ADDATAH= CLR;
//	ADDATAL = CLR;
	if(sampleChannelSelect == AD_CHANNEL_12_CHANNEL)
	{
		CHS3 = 1;
		CHS2 = 1;
		CHS1 = 0;
		CHS0 = 0;// select channel 12
	}
	else
	{
		CHS3 = 1;
		CHS2 = 1;
		CHS1 = 0;
		CHS0 = 1;// select channel 13
	}

}


unsigned int getAdCh12Value()
{
	return sampleCH12Value;
}


unsigned int getAdCh13Value()
{
	return sampleCH13Value;
}

void setDA_ConvertValue(unsigned char ucValue)
{
	DACR0=ucValue;
}

void startBigTimer()
{
	uiBigTimer = 34200; //34200s = 9.5h
}


void startSmallTimer()
{
	uiSmallTimer = 10800; //10800 = 3h
}


unsigned char isFinishedBigTimer()
{
	if(uiBigTimer == 0)
		return 1;
	else
		return 0;
}

unsigned char isFinishedSmallTimer()
{
	if(uiSmallTimer == 0)
		return 1;
	else
		return 0;
	return 0;
}

unsigned char isPermitSampleTime()
{
	if(timer.timer10msStopWatch > 10) //10*10ms = 100ms
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
		}

#ifdef DEBUG_FUNCITON
		static unsigned int flashCnt = 0;
		flashCnt++;
		if(flashCnt >  100) //100*10ms =1s
		{
			PA0 = ~PA0;
			flashCnt = 0;
		}
#endif
    }
}
