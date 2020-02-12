
//#define    USE_SOFTWARE_SIMULATION_TEST                1


//////////////////////////////////////////////////////////////////////////////////
//               【程序说明】：DAC0输出VCC*25/64=1.3V通过OP1放大从PB5输出		    //
//							   DAC1输出VCC*6/64=0.3V通过OP2放大从PA7输出		    //
//////////////////////////////////////////////////////////////////////////////////


///////////////////////////////////////////////////////////////////////////////////////////////////////////
//	【程序说明】：本程序将OP1和OP2配置成放大器,将同相端的输入电压进行放大。								     //
//																							             //				
//									同相端（IN+）	反相端(IN-) 	    输出(VO)		增益			 	         //
//						OP1		     PB3			   PB4				PB5		1+R2/R1		             //
//						OP2			 PB6               PB7    		    PA7		 8				   	     //
//																							             //
//						OP1需要配合外部电阻进行放大,放大倍数 	Av=1+R2/R1							         //
//						R1为A1N(PB4)与AVSS间电阻,R2为A1E(PB5)与A1N(PB4)间电阻				 		         //
//						具体配置见datasheet;	                  								             //
///////////////////////////////////////////////////////////////////////////////////////////////////////////


#ifndef USE_SOFTWARE_SIMULATION_TEST

#define _XTAL_FREQ 20000000

#include <stdio.h>
#include "yn8p520.h"	//系统头文件
#include "common.h"		
#include "periph.h"		

#pragma inline(_delay)
extern void _delay(unsigned long);
#define __delay_us(x) _delay((unsigned long)((x)*(_XTAL_FREQ/4000000.0)))

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
*	常用配置字功能说明：
*
*	IO_MODE16	:为芯片封装信息 可设为IO_MODE8/16/18 分别对应SOP8/16/18
*	WDTE_OFF		:看门狗关闭 打开时改为WDT_ON
*	OTP_MOD4K	：为芯片烧写模式 总空间为4K,可设置为OTP_MOD1/2/4K分别为
*					  每次烧录使用空间占用1/2/4K,当程序较小时可用于设置多次烧录
*						相应芯片型号如上说明
*	OTP_4K_0		：OTP_mK_n 在mK模式下第n个空间  m(1/2/4) 烧写时 n值需从0开始
*						4K只可设为0	2K可设为0/1/2 1K可设为 0/1/2/3
*	FOSC_RC20M	：系统时钟选择 可设为 
*						配置		：	FOSC_RC20M FOSC_RC10M FOSC_RC10M FOSC_RC5M	FOSC_RC1P25M
*						对应时钟	：			20MHZ		10MHZ			5MHZ		  2.5MHZ			1.25MHZ
*	WDTPS_128	：看门狗定时器时钟分频
*
*
*	注意：1.配置字若无特别需求请勿修改；
*			2.其他配置字及相应功能见Datasheet及头文件；	
*			2.仿真器支持20M时钟模式，且无上下拉电阻测试时应注意；
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

#endif




#ifndef USE_SOFTWARE_SIMULATION_TEST
static void clearAllTimer(void)
{
	clearTwelveHoursTimer();
	clearThreeHoursTimer();
	clearTwentySecondsTimer();
}
#endif


static void clearPinPortAndTimer(void)
{
#ifndef 	USE_SOFTWARE_SIMULATION_TEST
	PB0 = 0;
	PA0 = 0;
	PA1 = 0;
	PA2 = 0;
	PA3 = 0;
//	PAOD7 = 0;
//	PA7 = 0;
	PBOD7 = 0;
	PB7 = 0;
	clearAllTimer();
#else
	cout << "clearPinPortAndTimer(void)" << endl;
#endif
}


static void initPin(void)
{
#ifndef 	USE_SOFTWARE_SIMULATION_TEST
	PB6 = 1;
	PBOD6 = 1; //set PB6 as high resistance



	PA0 = 0;
	PA1 = 0;
	PA2 = 0;
	PA3 = 0;
	PB0 = 0;
	PB1 = 1;
	PA6 = 0;
//	PA7 = 0;
	PB7 = 0;
	PBOD7 = 0;
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

#ifdef USE_SOFTWARE_SIMULATION_TEST
bool isPermitSampleTime(void)
{
//	unsigned int firstVariable = 0, secondVariable = 0;
//
//	bool bCompareResult = false;
//
//	cout <<"please input value of firstVariable: "<<endl;
//
//	cin >> firstVariable;
//
//	cout <<"please input value of secondVariable: "<<endl;
//
//	cin >> secondVariable;
//
//	if(secondVariable > firstVariable)
//		bCompareResult = true;
//	else
//		bCompareResult = false;
//
//	if(bCompareResult)
//		cout << "The condition is OK " << endl;
//	else
//		cout << "The condition is NG" << endl;

//	return bCompareResult;

	static unsigned int uiCounter = 0;

	uiCounter++;

	cout << uiCounter << ";" << endl;


	return true;

}



unsigned int getAdOriginalCh14Value(void)
{
	unsigned int uiCh14Value = 0;

	cout <<"please input value of ch14:"<<endl;

	cin >> uiCh14Value;

	return uiCh14Value;

}


unsigned int getAdOriginalCh1Value(void)
{
	unsigned int uiCh1Value = 0;

	cout <<"please input value of ch1:"<< endl;

	cin >> uiCh1Value;

	return uiCh1Value;
}



unsigned int getAdOriginaCh4Value(void)
{
	unsigned int uiCh4Value = 0;

	cout <<"please input value of ch4:"<< endl;

	cin >> uiCh4Value;

	return uiCh4Value;
}



void startTwelveHourTimer(unsigned int uiTimeValue)
{
	cout << "startTwelveHourTimer(unsigned int uiTimeValue)" <<endl;
}


bool isFinishedTwelveHoursTimer(void)
{
//	bool bTimerOut = false;
//
//	cout << "please input running result for twelve hour timer" <<endl;
//
//	cin >> bTimerOut;

//	return bTimerOut;
	return false;
}


void startTwentySecondsTimer( void )
{
	cout <<" startTwentySecondTimer() "<<endl;
}


bool isFinishedTwentySecondsTimer(void)
{
	bool bTimeOut = false;

	cout << "please input running result for twenty seconds timer: "<< endl;

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


#define   BIG_TIME_SECONDS         36000
#define   SMALL_TIME_SECONDS       10800

#define  LETE_BRANCH_COMMON_STAY_TIME     1

#define    TRUE   1
#define    FALSE  0



void main (void)
{

#ifdef		USE_SOFTWARE_SIMULATION_TEST
	cout << "!!!Hello World!!!" << endl; // prints !!!Hello World!!!
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


		static unsigned char ucWaitTime1S = 0;

		static unsigned char ucWaitTimeO3s = 0;

		static unsigned char ucSmallTimerActionFlag = 0;

		static unsigned char ucSetSmallActionFlag = 0;

		static unsigned char bCheckTweHour = 0;

		static unsigned char bCheckTheHour = 0;


#ifndef		USE_SOFTWARE_SIMULATION_TEST
		TRISA0 = 0; //SET PA0,PA1,PA2,PA3 as output
		TRISA1 = 0;
		TRISA2 = 0;
		TRISA3 = 0;
		TRISB0 = 0;
		TRISB1 = 0;
		TRISA6 = 0;
	//	TRISA7 = 0;
		TRISB7 = 0;// PB7 instead of PA7
		TRISB6 = 0;


		initPin();


		TRISB2 = 1;//SET AD sample Channel 14

	//	TRISB7 = 1;// set AD sample Channel 4
		TRISA7 = 1;// set AD sample channel 5

		TRISB4 = 1;// set AD sample Channel 1

		clock_config();	//使系统时钟稳定
		timer1_config();
		timer1_interrupt_config();

		adc_test_init(AD_CHANNEL_0_CHANNEL,ADC_REF_2P1);//ADC初始化 通道0 PB3，2.1V 电压为参考源

		dac_init(); //DAC0/1初始化
//		op1_init(); //OP1初始化
//		op2_init(); //OP2初始化


		adc_start();	//ADC启动
#else
		cout << "initialization after power on" << endl;
#endif

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
			MAIN_LOOP_STEP_3_HOUR_BRANCH,
			MAIN_LOOP_STEP_12_HOUR_END,
		};


		static enum MAIN_LOOP_STEP  enumMainLoopStep = MAIN_LOOP_STEP_INIT;

		static enum AD_CHANNEL_4_VALUE_PATH ucChannel4Type = LESS_THAN_1911;


	#ifdef SET_PB1_AS_RESET_DEBUG_PIN
		static unsigned char ucTimerPowerLed = FALSE;
	#endif

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

			   switch(enumMainLoopStep)
			   {
				   case MAIN_LOOP_STEP_INIT:
					{

#ifdef USE_SOFTWARE_SIMULATION_TEST
						cout <<"I am in MAIN_LOOP_STEP_INIT "<<endl;
#endif
						static unsigned char ucTimerZeroPoint5s = 0;
				   		if(getAdOriginalCh14Value() > 1950)//  AD value -> 2v
						{
				   			ucTimerZeroPoint5s++;
						}
						else
							ucTimerZeroPoint5s = 0;

						if(ucTimerZeroPoint5s >= 5) //5*100ms = 0.5s
						{
							ucTimerZeroPoint5s = 0;
							enumMainLoopStep = MAIN_LOOP_STEP_FIRST;
						}
				   		break;
					}

				   case MAIN_LOOP_STEP_FIRST:
					{

#ifdef USE_SOFTWARE_SIMULATION_TEST
						cout <<"I am in MAIN_LOOP_STEP_FIRST "<<endl;
#endif
						static unsigned char ucTimerZeroPoint3s = 0;


						if(getAdOriginalCh14Value() > 1950)// AD value -> 2v
						{

							enumMainLoopStep = MAIN_LOOP_STEP_SECOND;

							ucTimerZeroPoint3s = 0;

						}
						else
						{
							ucTimerZeroPoint3s++;

							if(ucTimerZeroPoint3s >= 3)//
							{
								ucTimerZeroPoint3s = 0;

								clearPinPortAndTimer();
							}
						}

						break;
					}

					case MAIN_LOOP_STEP_SECOND:
					{

#ifdef USE_SOFTWARE_SIMULATION_TEST
						cout <<"I am in MAIN_LOOP_STEP_SECOND "<<endl;
#endif
						static unsigned char ucTimerP5s = 0;

					//	PA6 = 1;
						setPA6(1);

						if(ucTimerP5s < 5)
							ucTimerP5s++;
						else
						{
							ucTimerP5s = 0;

				   			enumMainLoopStep = MAIN_LOOP_STEP_THIRD;
						}

				   		break;
					}

					case MAIN_LOOP_STEP_THIRD:
					{

#ifdef USE_SOFTWARE_SIMULATION_TEST
						cout <<"I am in MAIN_LOOP_STEP_THIRD "<<endl;
#endif
						static unsigned char ucTimerADC1ZeroP5s = 0;

						static unsigned char ucTimerLessADC1ZeroP5s = 0;

						static unsigned char ucTimerLessADC1ZeroP5sFlag = 0;

						static unsigned char ucTimerRightP5s = 0;

						if(getAdOriginalCh1Value() < 115)
						{
							ucTimerADC1ZeroP5s = 0;

							ucTimerLessADC1ZeroP5s++;  // looking for questions，need consider AD1 value is again more than 130  after less than 130
						}
						else
						{
							ucTimerADC1ZeroP5s++;

							ucTimerLessADC1ZeroP5s = 0;
						}

						if(ucTimerADC1ZeroP5s >= 3)
						{
							ucTimerADC1ZeroP5s = 0;
							enumMainLoopStep = MAIN_LOOP_STEP_FOURTH;
						}
						else if( ucTimerLessADC1ZeroP5s >= 3)
						{

							if(getAdOriginalCh1Value() < 105)//????// wait to be determined.
							{
								ucTimerRightP5s++;
							}
							else
							{
								ucTimerRightP5s = 0;
							}

							if(ucTimerRightP5s >= 3)
							{
								ucTimerLessADC1ZeroP5s = 0; // clear it, make sure this value is always more than 5 before clearing it
								ucTimerRightP5s = 0;
								enumMainLoopStep =  MAIN_LOOP_STEP_3_HOUR_BRANCH;
							}
							else
							{
								;// always do the same thing in the MAIN_LOOP_STEP_THIRD
							}
						}
						else
						{
							;//do nothing
						}

						if((MAIN_LOOP_STEP_3_HOUR_BRANCH == enumMainLoopStep) || (MAIN_LOOP_STEP_FOURTH == enumMainLoopStep))
						{  // only to make sure clear timer when exit this case. no other attention
							ucTimerRightP5s = 0;
							ucTimerADC1ZeroP5s = 0;
							ucTimerLessADC1ZeroP5s = 0;
						}


						break;
					}

					case MAIN_LOOP_STEP_FOURTH:
					{

#ifdef USE_SOFTWARE_SIMULATION_TEST
						cout <<"I am in MAIN_LOOP_STEP_FOURTH "<<endl;
#endif

						startTwelveHourTimer(BIG_TIME_SECONDS);
						enumMainLoopStep = MAIN_LOOP_STEP_FIFTH;

						bCheckTweHour = FALSE;

						break;
					}

					case MAIN_LOOP_STEP_FIFTH:
					{
#ifdef USE_SOFTWARE_SIMULATION_TEST
						cout <<"I am in MAIN_LOOP_STEP_FIFTH "<<endl;
#endif
						if(( isFinishedTwelveHoursTimer() && (! bCheckTweHour)))
						{
							enumMainLoopStep = MAIN_LOOP_STEP_12_HOUR_END;//???? wait to be determined
							bCheckTweHour = TRUE;
						}
						else
						{
						    static enum setp_Adc4 ucADC4_Step = ADC4_STEP_INIT;

						    switch(ucADC4_Step)
						    {
								case ADC4_STEP_INIT:
								{
								//	startTwentySecondsTimer();
#ifdef USE_SOFTWARE_SIMULATION_TEST
						cout <<"ucADC4_Step :: ADC4_STEP_INIT; "<<endl;
#endif
									ucADC4_Step = ADC4_STEP_FIRST;
									break;
								}

								case ADC4_STEP_FIRST:
								{
#ifdef USE_SOFTWARE_SIMULATION_TEST
						cout <<"ucADC4_Step :: ADC4_STEP_FIRST; "<<endl;
#endif
									static unsigned int uiOldValue = 0, uiMinValue = 0, uiMaxValue = 0;

									static unsigned char bInitFlag = 0;

									if( 0 == bInitFlag)
									{
										bInitFlag = 1;
										uiOldValue = getAdOriginaCh4Value();
									}

				#define             RANGE_FIRST_VALUE                1931
				#define             RANGE_SECOND_VALUE               2047
				#define             RANGE_THIRD_VALUE                2164
				#define             RANGE_FOURTH_VALUE               2281
				#define             HYSTERETIC_NEGATIVE_VALUE        40
				#define             HYSTERETIC_POSITIVE_VALUE        0

									if(LESS_THAN_1911 == ucChannel4Type)
									{
										uiMinValue = 0;
										uiMaxValue = RANGE_FIRST_VALUE;
									}
									else if(BETWEEN_1911_AND_2067 == ucChannel4Type)
									{
										uiMinValue = RANGE_FIRST_VALUE - HYSTERETIC_NEGATIVE_VALUE;
										uiMaxValue = RANGE_SECOND_VALUE;
									}
									else if(BETWEEN_2067_AND_2204 == ucChannel4Type)
									{
										uiMinValue = RANGE_SECOND_VALUE - HYSTERETIC_NEGATIVE_VALUE;
										uiMaxValue = RANGE_THIRD_VALUE;
									}
									else if(BETWEEN_2204_AND_2340 == ucChannel4Type)
									{
										uiMinValue = RANGE_THIRD_VALUE - HYSTERETIC_NEGATIVE_VALUE;
										uiMaxValue = RANGE_FOURTH_VALUE;
									}
									else
									{
										uiMinValue = RANGE_FOURTH_VALUE - HYSTERETIC_NEGATIVE_VALUE;
										uiMaxValue = RANGE_FOURTH_VALUE;
									}


									if(( getAdOriginaCh4Value() < uiMinValue )
										|| 	(getAdOriginaCh4Value() > uiMaxValue ))
									{
										uiOldValue =  getAdOriginaCh4Value();
									}

									if( uiOldValue < RANGE_FIRST_VALUE )
										ucChannel4Type = LESS_THAN_1911;
									else if( uiOldValue < RANGE_SECOND_VALUE )
										ucChannel4Type = BETWEEN_1911_AND_2067;
									else if( uiOldValue < RANGE_THIRD_VALUE )
										ucChannel4Type = BETWEEN_2067_AND_2204;
									else if( uiOldValue < RANGE_FOURTH_VALUE )
										ucChannel4Type = BETWEEN_2204_AND_2340;
									else
										ucChannel4Type = MORE_THAN_2340;

									ucADC4_Step = ADC4_STEP_SECOND;
									break;
								}

								case ADC4_STEP_SECOND:
								{
#ifdef USE_SOFTWARE_SIMULATION_TEST
						cout <<"ucADC4_Step :: ADC4_STEP_SECOND; "<<endl;
#endif
									switch(ucChannel4Type)
									{

										case LESS_THAN_1911:
										{
											static unsigned char ucTimerDelay = 0;
											static unsigned char ucLoaderStep = 0;

											switch(ucLoaderStep)
											{
												case 0:
												{

#ifndef   USE_SOFTWARE_SIMULATION_TEST
													PB0 = 1;
#else
													cout<<"PB0 = 1;"<<endl;
#endif
													ucLoaderStep++;
													break;
												}

												case 1:
												{
													if(ucTimerDelay >= 5)
													{
#ifndef   USE_SOFTWARE_SIMULATION_TEST
														PA0 = 1;
#else
														cout <<"PA0 = 1;"<<endl;
#endif
														ucTimerDelay = 0;
														ucLoaderStep++;
													}
													else
														ucTimerDelay++;
													break;
												}

												case 2:
												{
													if(ucTimerDelay >= 5)
													{
#ifndef   USE_SOFTWARE_SIMULATION_TEST
														PA1= 1;
#else
														cout <<"PA1 = 1;"<<endl;
#endif
														ucTimerDelay = 0;
														ucLoaderStep++;
													}
													else
														ucTimerDelay++;
													break;
												}


												case 3:
												{
													if(ucTimerDelay >= 5)
													{
#ifndef   USE_SOFTWARE_SIMULATION_TEST
														PA2= 1;
#else
														cout<< "PA2 = 1;" <<endl;
#endif

														ucTimerDelay = 0;
														ucLoaderStep++;
													}
													else
														ucTimerDelay++;
													break;
												}

												case 4:
												{
													if(ucTimerDelay >= 5)
													{
#ifndef   USE_SOFTWARE_SIMULATION_TEST
														PA3 = 1;
#else
														cout << "PA3 = 1;"<<endl;
#endif
														ucTimerDelay = 0;
														ucLoaderStep++;
													}
													else
														ucTimerDelay++;
													break;
												}

												case 5:
												{
													if(ucTimerDelay >= 5)
													{
#ifndef   USE_SOFTWARE_SIMULATION_TEST
														PB0 = 0;
														PA0 = 0;
														PA1 = 0;
														PA2 = 0;
														PA3 = 0;
#else
														cout << "PB0 = 0;"<<endl;
														cout << "PA0 = 0;"<< endl;
														cout << "PA1 = 0;"<<endl;
														cout << "PA2 = 0;"<<endl;
														cout << "PA3 = 0;"<<endl;
#endif
														ucTimerDelay = 0;
														ucLoaderStep++;
													}
													else
														ucTimerDelay++;
													break;
												}

												case 6:
												{
													if(ucTimerDelay >= LETE_BRANCH_COMMON_STAY_TIME)
													{
														ucTimerDelay = 0;
									//					AD_sample_process_step = 2;
														ucLoaderStep = 0;
														ucADC4_Step = ADC4_STEP_THIRD;
													}
													else
														ucTimerDelay++;
													break;
												}


												default:
												break;
											}

											 break;
										}

										case BETWEEN_1911_AND_2067:
										{
											static unsigned char ucTimerDelay1 = 0;
											static unsigned char ucLoaderStep1 = 0;
											switch(ucLoaderStep1)
											{
												case 0:
												{
#ifndef   USE_SOFTWARE_SIMULATION_TEST
													PB0 = 1;
#else
													cout <<"PB0 = 1;"<<endl;
#endif
													ucLoaderStep1++;
													break;
												}

												case 1:
												{
													if(ucTimerDelay1 >= 5)
													{
#ifndef   USE_SOFTWARE_SIMULATION_TEST
														PA0 = 1;
#else
														cout <<"PA0 = 1;"<<endl;
#endif
														ucTimerDelay1 = 0;
														ucLoaderStep1++;
													}
													else
														ucTimerDelay1++;
													break;
												}

												case 2:
												{
													if(ucTimerDelay1 >= 5)
													{
#ifndef   USE_SOFTWARE_SIMULATION_TEST
														PA1= 1;
#else
														cout <<"PA1 = 1;"<<endl;
#endif
														ucTimerDelay1 = 0;
														ucLoaderStep1++;
													}
													else
														ucTimerDelay1++;
													break;
												}

												case 3:
												{
													if(ucTimerDelay1 >= 5)
													{
												//		PA2 = 1;
														setPA2(1);
														ucTimerDelay1 = 0;
														ucLoaderStep1++;
													}
													else
														ucTimerDelay1++;
													break;
												}

												case 4:
												{
													if(ucTimerDelay1 >= 5)
													{
												//		PA3 = 1;
														setPA3(1);
														ucTimerDelay1 = 0;
														ucLoaderStep1++;
													}
													else
														ucTimerDelay1++;
													break;
												}

												case 5:
												{
													if(ucTimerDelay1 >= 5)
													{
													//	PA0 = 0;
														setPA0(0);
													//	PA1 = 0;
														setPA1(0);
													//	PA2 = 0;
														setPA2(0);
													//	PA3 = 0;
														setPA3(0);
														ucTimerDelay1 = 0;
														ucLoaderStep1++;
													}
													else
														ucTimerDelay1++;
													break;
												}

												case 6:
												{
													if(ucTimerDelay1 >= LETE_BRANCH_COMMON_STAY_TIME)
													{
														ucTimerDelay1 = 0;
										//				AD_sample_process_step = 2;
														ucLoaderStep1 = 0;
														ucADC4_Step = ADC4_STEP_THIRD;
													}
													else
														ucTimerDelay1++;
													break;
												}


												default:
												break;
											}

											 break;
										}


										case BETWEEN_2067_AND_2204:
										{
											static unsigned char ucTimerDelay2 = 0;
											static unsigned char ucLoaderStep2 = 0;
											switch(ucLoaderStep2)
											{
												case 0:
												{
												//	PB0 = 1;
													setPB0(1);
												//	PA0 = 1;
													setPA0(1);
													ucLoaderStep2++;
													break;
												}

												case 1:
												{
													if(ucTimerDelay2 >= 5)
													{
												//		PA1 = 1;
														setPA1(1);
														ucTimerDelay2 = 0;
														ucLoaderStep2++;
													}
													else
														ucTimerDelay2++;
													break;
												}

												case 2:
												{
													if(ucTimerDelay2 >= 5)
													{
													//	PA2 = 1;
														setPA2(1);
														ucTimerDelay2 = 0;
														ucLoaderStep2++;
													}
													else
														ucTimerDelay2++;
													break;
												}

												case 3:
												{
													if(ucTimerDelay2 >= 5)
													{
												//		PA3 = 1;
														setPA3(1);
														ucTimerDelay2 = 0;
														ucLoaderStep2++;
													}
													else
														ucTimerDelay2++;
													break;
												}

												case 4:
												{
													if(ucTimerDelay2 >= 5)
													{

													//	PA1 = 0;
														setPA1(0);
												//		PA2 = 0;
														setPA2(0);
											//			PA3 = 0;
														setPA3(0);
														ucTimerDelay2 = 0;
														ucLoaderStep2++;
													}
													else
														ucTimerDelay2++;
													break;
												}

												case 5:
												{
													if(ucTimerDelay2 >= LETE_BRANCH_COMMON_STAY_TIME)
													{
														ucTimerDelay2 = 0;
											//			AD_sample_process_step = 2;
														ucLoaderStep2 = 0;
														ucADC4_Step = ADC4_STEP_THIRD;;
													}
													else
														ucTimerDelay2++;
													break;
												}


												default:
												break;
											}

											 break;
										}


										case BETWEEN_2204_AND_2340:
										{
											static unsigned char ucTimerDelay3 = 0;
											static unsigned char ucLoaderStep3 = 0;
											switch(ucLoaderStep3)
											{
												case 0:
												{
												//	PB0 = 1;
													setPB0(1);
											//		PA0 = 1;
													setPA0(1);
												//	PA1 = 1;
													setPA1(1);
													ucLoaderStep3++;
													break;
												}

												case 1:
												{
													if(ucTimerDelay3 >= 5)
													{
													//	PA2 = 1;
														setPA2(1);
														ucTimerDelay3 = 0;
														ucLoaderStep3++;
													}
													else
														ucTimerDelay3++;
													break;
												}

												case 2:
												{
													if(ucTimerDelay3 >= 5)
													{
												//		PA3 = 1;
														setPA3(1);
														ucTimerDelay3 = 0;
														ucLoaderStep3++;
													}
													else
														ucTimerDelay3++;
													break;
												}


												case 3:
												{
													if(ucTimerDelay3 >= 5)
													{

													//	PA2 = 0;
														setPA2(0);
													//	PA3 = 0;
														setPA3(0);
														ucTimerDelay3 = 0;
														ucLoaderStep3++;
													}
													else
														ucTimerDelay3++;
													break;
												}

												case 4:
												{
													if(ucTimerDelay3 >= LETE_BRANCH_COMMON_STAY_TIME)
													{
														ucTimerDelay3 = 0;
												//		AD_sample_process_step = 2;
														ucLoaderStep3 = 0;
														ucADC4_Step = ADC4_STEP_THIRD;;
													}
													else
														ucTimerDelay3++;
													break;
												}


												default:
												break;
											}

											 break;
										}


										case MORE_THAN_2340:
										{
											static unsigned char ucTimerDelay4 = 0;
											static unsigned char ucLoaderStep4 = 0;
											switch(ucLoaderStep4)
											{
												case 0:
												{
												//	PB0 = 1;
													setPB0(1);
											   //		PA0 = 1;
													setPA0(1);
												//	PA1 = 1;
													setPA1(1);
												//	PA2 = 1;
													setPA2(1);
													ucLoaderStep4++;
													break;
												}

												case 1:
												{
													if(ucTimerDelay4 >= 5)
													{
												//		PA3 = 1;
														setPA3(1);
														ucTimerDelay4 = 0;
														ucLoaderStep4++;
													}
													else
														ucTimerDelay4++;
													break;
												}

												case 2:
												{
													if(ucTimerDelay4 >= 5)
													{
												//		PA3 = 0;
														setPA3(0);
														ucTimerDelay4 = 0;
														ucLoaderStep4++;
													}
													else
														ucTimerDelay4++;
													break;
												}

												case 3:
												{
													if(ucTimerDelay4 >= LETE_BRANCH_COMMON_STAY_TIME)
													{
														ucTimerDelay4 = 0;
												//		AD_sample_process_step = 2;
														ucLoaderStep4 = 0;
														ucADC4_Step = ADC4_STEP_THIRD;
													}
													else
														ucTimerDelay4++;
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

									break;
								}

								case ADC4_STEP_THIRD:
								{
#ifdef USE_SOFTWARE_SIMULATION_TEST
						cout <<"ucADC4_Step :: ADC4_STEP_THIRD; "<<endl;
#endif
									static unsigned char ucTimerDelayP2sLess = 0;

									static unsigned char ucTimerDelayP2sMore = 0;

									if( getAdOriginalCh1Value() <= 220 )
									{
										ucTimerDelayP2sLess++;
										ucTimerDelayP2sMore = 0;
									}
									else
									{
										ucTimerDelayP2sMore++;  //if value is vibrating , will always stop here
										ucTimerDelayP2sLess = 0;
									}

									if( ucTimerDelayP2sLess >= 2)
									{
										ucTimerDelayP2sLess = 0;
										ucTimerDelayP2sMore = 0;

										startTwentySecondsTimer();

										ucADC4_Step = ADC4_STEP_FOURTH_PREFIX1;
									}

									if(ucTimerDelayP2sMore >= 2)
									{
										ucTimerDelayP2sMore = 0;
										ucTimerDelayP2sLess = 0;
										ucADC4_Step = ADC4_STEP_FOURTH_PREFIX2;
									}


									break;
							}

							case ADC4_STEP_FOURTH_PREFIX1:
							{
#ifdef USE_SOFTWARE_SIMULATION_TEST
						cout <<"ucADC4_Step :: ADC4_STEP_FOURTH_PREFIX1; "<<endl;
#endif
								if( !isFinishedTwentySecondsTimer() )
									ucADC4_Step = ADC4_STEP_FOURTH_PREFIX2;
								else
									ucADC4_Step = ADC4_STEP_FOURTH_PREFIX3;

								break;
							}


							case ADC4_STEP_FOURTH_PREFIX2:
							{
#ifdef USE_SOFTWARE_SIMULATION_TEST
						cout <<"ucADC4_Step :: ADC4_STEP_FOURTH_PREFIX2; "<<endl;
#endif
								static unsigned char ucTimerForDACR0_CNT1 = 0, ucTimerForDACR0_CNT2 = 0;

								static unsigned char ucTimerForDACR0_CNT1_f = 0, ucTimerForDACR0_CNT2_f = 0;

								if((getAdOriginalCh14Value() > 2800))
								{
									ucTimerForDACR0_CNT1++;
									ucTimerForDACR0_CNT2 = 0;
								}
								else
								{
									ucTimerForDACR0_CNT2++;
									ucTimerForDACR0_CNT1 = 0;
								}

								if(ucTimerForDACR0_CNT1 >= 2)
									ucTimerForDACR0_CNT1_f = 1;

								if(ucTimerForDACR0_CNT2 >= 2)
									ucTimerForDACR0_CNT2_f = 1;

								if(ucTimerForDACR0_CNT1_f)
								{
#ifndef USE_SOFTWARE_SIMULATION_TEST
									DACR0=0x0F;//set OP1 input 0.3v
#else
									cout <<"DACR0 = 0x0F;"<<endl;
#endif
									ucADC4_Step = ADC4_STEP_FOURTH;
								}
								else if(ucTimerForDACR0_CNT2_f)
								{
#ifndef USE_SOFTWARE_SIMULATION_TEST
									DACR0=0x09;//set op1 input 0.18v
#else
									cout <<"DACR0 = 0x09;"<<endl;
#endif
									ucADC4_Step = ADC4_STEP_FOURTH;
								}
								else
								{
									;//do nothing, if this AD value vibrate in this scope, consider to always stay here.
								}

								if(ADC4_STEP_FOURTH == ucADC4_Step)
								{
									ucTimerForDACR0_CNT1 = 0;
									ucTimerForDACR0_CNT2 = 0;
									ucTimerForDACR0_CNT1_f = 0;
									ucTimerForDACR0_CNT2_f = 0;

								}

								break;
							}

							case  ADC4_STEP_FOURTH_PREFIX3:
							{
#ifdef USE_SOFTWARE_SIMULATION_TEST
						cout <<"ucADC4_Step :: ADC4_STEP_FOURTH_PREFIX3; "<<endl;
#endif
								clearTwentySecondsTimer();
							//	PA6 = 0;
								setPA6(0);
#ifndef USE_SOFTWARE_SIMULATION_TEST
								PBOD6 = 0;
								PB6 = 1;
#else
								cout <<"PBOD6 = 0;"<<endl;
								cout <<"PB6 = 1;"<<endl;
#endif
								ucADC4_Step = ADC4_STEP_FOURTH_PREFIX4;
								break;

							}


							case  ADC4_STEP_FOURTH_PREFIX4:
							{
#ifdef USE_SOFTWARE_SIMULATION_TEST
						cout <<"ucADC4_Step :: ADC4_STEP_FOURTH_PREFIX4; "<<endl;
#endif

								static unsigned char ucDelayPrefix4TimerP5s;

								ucDelayPrefix4TimerP5s++;

								if( ucDelayPrefix4TimerP5s >= 5)
								{
									ucDelayPrefix4TimerP5s = 0;

									ucADC4_Step = ADC4_STEP_FOURTH_PREFIX5;
								}
								break;
							}

							case  ADC4_STEP_FOURTH_PREFIX5:
							{
#ifdef USE_SOFTWARE_SIMULATION_TEST
						cout <<"ucADC4_Step :: ADC4_STEP_FOURTH_PREFIX5; "<<endl;
#endif

#ifndef USE_SOFTWARE_SIMULATION_TEST
								PBOD6 = 1;
								PB6 = 1;
#else
								cout <<"PBOD6 = 1;"<<endl;
								cout <<"PB6 = 1;"<<endl;
#endif
								ucADC4_Step = ADC4_STEP_FOURTH_PREFIX6;

								break;

							}

							case  ADC4_STEP_FOURTH_PREFIX6:
							{
								static unsigned char ucDelayPrefix6TimerP2s;

								ucDelayPrefix6TimerP2s++;

								if( ucDelayPrefix6TimerP2s >= 2)
								{
									ucDelayPrefix6TimerP2s = 0;

									ucADC4_Step = ADC4_STEP_INIT;

									enumMainLoopStep = MAIN_LOOP_STEP_FIRST;
								}
								break;
							}


								case ADC4_STEP_FOURTH:
								{
#ifdef USE_SOFTWARE_SIMULATION_TEST
						cout <<"ucADC4_Step :: ADC4_STEP_FOURTH; "<<endl;
#endif
									static unsigned char ucCheckTimerP2sLess = 0;

									static unsigned char ucCheckTimerP2sMore = 0;

									if( getAdOriginalCh1Value() < 85)
									{
										ucCheckTimerP2sLess++;
										ucCheckTimerP2sMore = 0;
									}
									else
									{
										ucCheckTimerP2sMore++;
										ucCheckTimerP2sLess = 0;
									}

									if( ucCheckTimerP2sMore > 2)
									{
										ucCheckTimerP2sMore = 0;
										ucCheckTimerP2sLess = 0;

										ucADC4_Step = ADC4_STEP_INIT;

										enumMainLoopStep = MAIN_LOOP_STEP_THIRD;
									}

									if( ucCheckTimerP2sLess > 2)
									{
										ucCheckTimerP2sMore = 0;
										ucCheckTimerP2sLess = 0;

										ucADC4_Step = ADC4_STEP_FOURTH_SUFFIX1;

									}


									break;
								}

								case ADC4_STEP_FOURTH_SUFFIX1:
								{
#ifdef USE_SOFTWARE_SIMULATION_TEST
						cout <<"ucADC4_Step :: ADC4_STEP_FOURTH_SUFFIX1; "<<endl;
#endif
									static unsigned char ucFourthSuffix1TimerP3s = 0;

									ucFourthSuffix1TimerP3s++;

									if( ucFourthSuffix1TimerP3s > 3)
									{
										ucFourthSuffix1TimerP3s = 0;
										ucADC4_Step = ADC4_STEP_FOURTH_SUFFIX2;

									}
									break;
								}

								case ADC4_STEP_FOURTH_SUFFIX2:
								{
#ifdef USE_SOFTWARE_SIMULATION_TEST
						cout <<"ucADC4_Step :: ADC4_STEP_FOURTH_SUFFIX2; "<<endl;
#endif
							//		PA6 = 0;
									setPA6(0);

									clearPinPortAndTimer();
									ucADC4_Step = ADC4_STEP_INIT;

									enumMainLoopStep = MAIN_LOOP_STEP_FIRST;
									break;
								}

						    	default:
						    		break;
						    }

						}

						break;
					}

					case MAIN_LOOP_STEP_3_HOUR_BRANCH:
					{
#ifdef USE_SOFTWARE_SIMULATION_TEST
						cout <<"I am in MAIN_LOOP_STEP_3_HOUR_BRANCH "<<endl;
#endif
						enum hour_3_branch_step{
							HOUR_3_BRANCH_STEP_FIRST,
							HOUR_3_BRANCH_STEP_SECOND,
							HOUR_3_BRANCH_STEP_THIRD,
						};

						static enum hour_3_branch_step  enumBranchStep = HOUR_3_BRANCH_STEP_FIRST;

						switch(enumBranchStep)
						{
							case HOUR_3_BRANCH_STEP_FIRST:
							{
#ifndef USE_SOFTWARE_SIMULATION_TEST
								PB7 = 1;
								PBOD7 = 1; //set PA7 AS hign resistence
#else
								cout <<"PB7 = 1;"<<endl;
								cout<<"PBOD7 = 1;"<<endl;
#endif
								startThreeHoursTimer(SMALL_TIME_SECONDS);

							//	PB0 = 1;
								setPB0(1);
							//	PA0 = 1;
								setPA0(1);
							//	PA1 = 1;
								setPA1(1);
							//	PA2 = 1;
								setPA2(1);
							//	PA3 = 1;
								setPA3(1);

								enumBranchStep = HOUR_3_BRANCH_STEP_SECOND;
								break;
							}

							case HOUR_3_BRANCH_STEP_SECOND:
							{
#ifdef USE_SOFTWARE_SIMULATION_TEST
						cout <<"I am in HOUR_3_BRANCH_STEP_SECOND "<<endl;
#endif
								static unsigned char ucTimer20s = 0;

								if(ucTimer20s < 200)
								{
									ucTimer20s++;

								}
								else
								{

									ucTimer20s = 0;

									enumBranchStep = HOUR_3_BRANCH_STEP_THIRD;

								//	PA6 = 0;
									setPA6(0);
								}
								break;
							}

							case HOUR_3_BRANCH_STEP_THIRD:
							{
#ifdef USE_SOFTWARE_SIMULATION_TEST
						cout <<"I am in HOUR_3_BRANCH_STEP_THIRD "<<endl;
#endif
								if( (isFinishedTwelveHoursTimer()) || (isFinishedThreeHoursTimer()))
								{
									enumBranchStep = HOUR_3_BRANCH_STEP_FIRST;
									enumMainLoopStep =  MAIN_LOOP_STEP_12_HOUR_END;
								}
								else
								{
									static unsigned char ucTimerX1P5s = 0;

									static unsigned char ucTimerLessX1P5s = 0;

									if(getAdOriginalCh1Value() < 115)
									{
										ucTimerX1P5s = 0;
										ucTimerLessX1P5s++;
									}
									else
									{
										ucTimerX1P5s++;
										ucTimerLessX1P5s = 0;
									}

									if(ucTimerX1P5s >= 5)
									{
										ucTimerX1P5s = 0;


#ifndef USE_SOFTWARE_SIMULATION_TEST
										PBOD7 = 0;
										PB7 = 0;
#else
										cout <<"PBOD7 = 0;"<<endl;
										cout <<"PB7 = 0;"<<endl;
#endif
										clearThreeHoursTimer();

										enumBranchStep = HOUR_3_BRANCH_STEP_FIRST;

										enumMainLoopStep =  MAIN_LOOP_STEP_SECOND;
									}
									else if(ucTimerLessX1P5s >= 5)
									{
										static unsigned char ucTimerX2P5s = 0;

										static unsigned char ucTimerLessX2P5s = 0;

										if(getAdOriginalCh14Value() >= 1950)
										{
											ucTimerX2P5s++;
											ucTimerLessX2P5s = 0;
										}
										else
										{
											ucTimerX2P5s = 0;
											ucTimerLessX2P5s++;
										}

										if(ucTimerX2P5s >= 5)
										{
											ucTimerX2P5s = 0;
										}
										else if(ucTimerLessX2P5s >= 5)
										{
											clearPinPortAndTimer();
											enumMainLoopStep =  MAIN_LOOP_STEP_FIRST;
											enumBranchStep = HOUR_3_BRANCH_STEP_FIRST;
										}
										else
										{
											;//do thing
										}
									}
									else
									{
										;//do nothing
									}

								}

								break;
							}


							default:
								break;
						}

						break;
					}

					case MAIN_LOOP_STEP_12_HOUR_END:
					{
#ifdef USE_SOFTWARE_SIMULATION_TEST
						cout <<"I am in MAIN_LOOP_STEP_12_HOUR_END "<<endl;
#endif
						enum INTERNAL_STEP {
							INTERNAL_FIRST_STEP,
							INTERNAL_SECOND_STEP,
							INTERNAL_THIRD_STEP,
							INTERNAL_FOUTTH_STEP,
						};

						static enum INTERNAL_STEP enumInteralStep = INTERNAL_FIRST_STEP;

						switch (enumInteralStep)
						{
							case INTERNAL_FIRST_STEP:
							{
#ifdef USE_SOFTWARE_SIMULATION_TEST
						cout <<"enumInteralStep :: INTERNAL_FIRST_STEP "<<endl;
#endif
						//		PB0 = 0;
								setPB0(0);
					//			PB1 = 0;
								setPB1(0);
			//					PA0 = 0;
								setPA0(0);
					//			PA1 = 0;
								setPA1(0);
						//		PA2 = 0;
								setPA2(0);
						//		PA3 = 0;
								setPA3(0);

#ifndef USE_SOFTWARE_SIMULATION_TEST
								PBOD6 = 0;
								PB6 = 1;
#else
								cout <<"PBOD6 = 0;"<<endl;
								cout <<"PB6 = 1;"<<endl;
#endif
					//			PA6 =0;
								setPA6(0);

								enumInteralStep = INTERNAL_SECOND_STEP;
								break;
							}

							case INTERNAL_SECOND_STEP:
							{
#ifdef USE_SOFTWARE_SIMULATION_TEST
						cout <<"enumInteralStep :: INTERNAL_SECOND_STEP "<<endl;
#endif
								static unsigned char ucTimer1s = 0;

								if(getAdOriginalCh14Value() <= 1000)
								{
									ucTimer1s++;
								}
								else
									ucTimer1s = 0;

								if(ucTimer1s >= 10)
								{
									enumInteralStep = INTERNAL_THIRD_STEP;
									ucTimer1s = 0;
								}
								break;
							}

							case INTERNAL_THIRD_STEP:
							{
#ifdef USE_SOFTWARE_SIMULATION_TEST
						cout <<"enumInteralStep :: INTERNAL_THIRD_STEP "<<endl;
#endif
								static unsigned char ucTimerP3s = 0;

								if(getAdOriginalCh14Value() >= 1950)
								{
									ucTimerP3s++;
								}
								else
									ucTimerP3s = 0;

								if(ucTimerP3s >= 3)
								{
									enumInteralStep = INTERNAL_FIRST_STEP;
									ucTimerP3s = 0;

									clearAllTimer();
#ifndef USE_SOFTWARE_SIMULATION_TEST
									DACR0=0x0F;//set OP1 input 0.3v
#else
									cout <<"DACR0 = 0x0F;"<<endl;
#endif
									initPin();


									enumMainLoopStep =  MAIN_LOOP_STEP_INIT;
#ifndef USE_SOFTWARE_SIMULATION_TEST
									while(1);// as to reset MCU
#else
									cout<<"the software is reset;"<<endl;
#endif

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

			}
		}
//	return 0;
}


