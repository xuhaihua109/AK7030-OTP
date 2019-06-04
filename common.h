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

#define AD_CHANNEL_14_CHANNEL            14

#define AD_CHANNEL_1_CHANNEL            1

#define AD_CHANNEL_4_CHANNEL            4


void clock_config();
void timer1_config();
void timer1_interrupt_config();

void adConverter_config();

void setAdcSampleChannel(uchar ucChannel);


unsigned int getAdOriginalValue();

void process_AD_Converter_Value();

unsigned int getAdCh4Value();

unsigned int getAdCh14Value();


unsigned int getAdOriginaCh4Value();

unsigned int getAdOriginalCh14Value();

unsigned char isPermitSampleTime();

void clrSampeTime();

void setDAC0_ChannelValue(unsigned char ucValue);

void startBigTimer(); //9.5 hours
void startSmallTimer();// 3 hours

void clearBigTimer();
void clearSmallTimer();

unsigned char isFinishedBigTimer();
unsigned char isFinishedSmallTimer();

uchar getAD_ConvertFlag();
void  setAD_ConvertFlag(uchar flag);



#endif
