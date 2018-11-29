#ifndef __COMMON_H__
#define __COMMON_H__

#define uchar unsigned char
#define uint  unsigned int

#define  CLR      0
#define  ZERO     0
#define  SET      1

#define ON  1
#define OFF	0

#define DEBUG_FUNCITON  1

#define AD_CHANNEL_13_CHANNEL            13

#define AD_CHANNEL_12_CHANNEL            12


void clock_config();
void timer1_config();
void timer1_interrupt_config();
void start_timer1();

void adConverter_config();

void start_AD_Converter();

void stop_AD_Converter();

unsigned char isAD_Completed();

void clearAdCompleteFalg();

unsigned int getAdValue();

void process_AD_Converter_Value();

unsigned int getAdCh12Value();

unsigned int getAdCh13Value();

unsigned char isPermitSampleTime();

void clrSampeTime();

void setDAC0_ChannelValue(unsigned char ucValue);

void startBigTimer(); //9.5 hours
void startSmallTimer();// 3 hours

unsigned char isFinishedBigTimer();
unsigned char isFinishedSmallTimer();



#endif
