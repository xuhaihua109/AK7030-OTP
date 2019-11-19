#ifndef __COMMON_H__
#define __COMMON_H__

#define FILTER_N   3
#define RIGHT_SHIFT_NUMBER    2   // 2^n = FILTER_N - 2


#define FILTER_N_CH13    3
#define FILTER_MAX_MIN_CNT    1
#define DIVIDER_NUMBER_CH13    0 // means to divide 4

#define PWM_FREQUENCY       249 //   f=20M/(4*(PWM_FREQUENCY+1)) = 20M/(4*(249+1)) = 20K
#define PWM_DEFAULT_THIRTY_WIDTH     75           // 30%, the width of PWM = PWM_DEFAULT_THIRTY_PERCENT/PWM_FREQUENCY
#define PWM_SIXTY_WIDTH           150

#define LOAD_PWM_STEP    2//  N*10ms, min steps is 10ms. 2*10ms = 20ms

#define COMPARE_REFERENCE_VALUE  312


#define uchar unsigned char
#define uint  unsigned int

#define  CLR      0
#define  ZERO     0
#define  SET      1

#define    TRUE   1
#define    FALSE  0

#define ON  1
#define OFF	0

//#define DEBUG_FUNCITON  1


#define USING_AD_FILTER_ALGORITHMN

#define AD_CHANNEL_12_CHANNEL            12

#define AD_CHANNEL_13_CHANNEL            13

#define AD_CHANNEL_14_CHANNEL            14

#define AD_CHANNEL_1_CHANNEL            1

#define AD_CHANNEL_5_CHANNEL            5


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


unsigned int getAdOriginalCh12Value();
unsigned int getAdOriginalCh13Value();

unsigned int getAdOriginalCh14Value();

unsigned char isPermitSampleTime();

void clrSampeTime();

void setDAC0_ChannelValue(unsigned char ucValue);

void startTwelveHourTimer(unsigned int uiSetTime); //12 hours
void startThreeHoursTimer(unsigned int uiSetTime);// 3 hours

void startOneHoursTimer(unsigned int uiSetTime);// 3 hours


//void startTwentySecondsTimer();//20s
//unsigned char isFinishedTwentySecondsTimer();


void startTwentyMinTimer(unsigned int uiSetValue);//20m
unsigned char isFinishedTwentyMinTimer();

void clearTwelveHoursTimer();
void clearThreeHoursTimer();
void clearOneHoursTimer();
void clearTwentyMinTimer();


unsigned char isFinishedTwelveHoursTimer();
unsigned char isFinishedThreeHoursTimer();
unsigned char isFinishedOneHoursTimer();

uchar getAD_ConvertFlag();
void  setAD_ConvertFlag(uchar flag);

void setWaitResetFlag(unsigned char bValue);



#endif
