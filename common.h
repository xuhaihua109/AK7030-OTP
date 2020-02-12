#ifndef __COMMON_H__
#define __COMMON_H__

#define uchar unsigned char
#define uint  unsigned int

#define  CLR      0
#define  ZERO     0
#define  SET      1

#define ON  1
#define OFF	0

//#define DEBUG_FUNCITON  1


#define USING_AD_FILTER_ALGORITHMN

#define AD_CHANNEL_0_CHANNEL            0

#define AD_CHANNEL_2_CHANNEL            2

#define AD_CHANNEL_5_CHANNEL            5

#define AD_CHANNEL_6_CHANNEL            6


void clock_config();
void timer1_config();
void timer1_interrupt_config();

void adConverter_config();

void setAdcSampleChannel(uchar ucChannel);


//unsigned int getAdOriginalValue();

void process_AD_Converter_Value();

//unsigned int getAdCh4Value();
//
//unsigned int getAdCh14Value();


unsigned int getAdOriginalCh1Value();
unsigned int getAdOriginaCh4Value();

unsigned int getAdOriginalCh14Value();

unsigned char isPermitSampleTime();

void clrSampeTime();

void setDAC0_ChannelValue(unsigned char ucValue);

void startTwelveHourTimer(unsigned int uiSetTime); //12 hours
void startThreeHoursTimer(unsigned int uiSetTime);// 3 hours


void startTwentySecondsTimer();//20s
unsigned char isFinishedTwentySecondsTimer();


void clearTwelveHoursTimer();
void clearThreeHoursTimer();
void clearTwentySecondsTimer();

unsigned char isFinishedTwelveHoursTimer();
unsigned char isFinishedThreeHoursTimer();

uchar getAD_ConvertFlag();
void  setAD_ConvertFlag(uchar flag);



#endif
