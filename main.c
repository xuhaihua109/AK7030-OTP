//////////////////////////////////////////////////////////////////////////////////
//               ������˵������DAC0���VCC*25/64=1.3Vͨ��OP1�Ŵ��PB5���		    //
//							   DAC1���VCC*6/64=0.3Vͨ��OP2�Ŵ��PA7���		    //
//////////////////////////////////////////////////////////////////////////////////


///////////////////////////////////////////////////////////////////////////////////////////////////////////
//	������˵������������OP1��OP2���óɷŴ���,��ͬ��˵������ѹ���зŴ�								     //
//																							             //				
//									ͬ��ˣ�IN+��	�����(IN-) 	    ���(VO)		����			 	         //
//						OP1		     PB3			   PB4				PB5		1+R2/R1		             //
//						OP2			 PB6               PB7    		    PA7		 8				   	     //
//																							             //
//						OP1��Ҫ����ⲿ������зŴ�,�Ŵ��� 	Av=1+R2/R1							         //
//						R1ΪA1N(PB4)��AVSS�����,R2ΪA1E(PB5)��A1N(PB4)�����				 		         //
//						�������ü�datasheet;	                  								             //
///////////////////////////////////////////////////////////////////////////////////////////////////////////

#define _XTAL_FREQ 20000000

#include <stdio.h>
#include "yn8p520.h"	//ϵͳͷ�ļ�
#include "common.h"		
#include "periph.h"		

#pragma inline(_delay)
extern void _delay(unsigned long);
#define __delay_us(x) _delay((unsigned long)((x)*(_XTAL_FREQ/4000000.0)))

//OTP_MOD4K  : 4k --16c77
//OTP_MOD2K  : 2k --16c76
//OTP_MOD1K  : 1k --16c74a
//OTP_MOD512L: 512--16c73a
//OTP_MOD512H: 512--16c73a


//����˵����
//DAC0���VCC*25/64=1.3Vͨ��OP1�����PB5���
//DAC1���VCC*6/64 =0.3Vͨ��OP2�����PA7���	        


/***************************************************************************
*	���������ֹ���˵����
*
*	IO_MODE16	:ΪоƬ��װ��Ϣ ����ΪIO_MODE8/16/18 �ֱ��ӦSOP8/16/18
*	WDTE_OFF		:���Ź��ر� ��ʱ��ΪWDT_ON
*	OTP_MOD4K	��ΪоƬ��дģʽ �ܿռ�Ϊ4K,������ΪOTP_MOD1/2/4K�ֱ�Ϊ
*					  ÿ����¼ʹ�ÿռ�ռ��1/2/4K,�������Сʱ���������ö����¼
*						��ӦоƬ�ͺ�����˵��
*	OTP_4K_0		��OTP_mK_n ��mKģʽ�µ�n���ռ�  m(1/2/4) ��дʱ nֵ���0��ʼ
*						4Kֻ����Ϊ0	2K����Ϊ0/1/2 1K����Ϊ 0/1/2/3
*	FOSC_RC20M	��ϵͳʱ��ѡ�� ����Ϊ 
*						����		��	FOSC_RC20M FOSC_RC10M FOSC_RC10M FOSC_RC5M	FOSC_RC1P25M
*						��Ӧʱ��	��			20MHZ		10MHZ			5MHZ		  2.5MHZ			1.25MHZ
*	WDTPS_128	�����Ź���ʱ��ʱ�ӷ�Ƶ
*
*
*	ע�⣺1.�����������ر����������޸ģ�
*			2.���������ּ���Ӧ���ܼ�Datasheet��ͷ�ļ���	
*			2.������֧��20Mʱ��ģʽ�������������������ʱӦע�⣻
*
****************************************************************************/


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




static void clearAllTimer(void)
{
	clearTwelveHoursTimer();
	clearThreeHoursTimer();
	clearTwentySecondsTimer();
}



static void clearPinPortAndTimer(void)
{
	PB0 = 0;
	PA0 = 0;
	PA1 = 0;
	PA2 = 0;
	PA3 = 0;
	PAOD7 = 0;
	PA7 = 0;
	clearAllTimer();
}


static void initPin(void)
{
	PB6 = 1;
	PBOD6 = 1; //set PB6 as high resistance



	PA0 = 0;
	PA1 = 0;
	PA2 = 0;
	PA3 = 0;
	PB0 = 0;
	PB1 = 1;
	PA6 = 0;
	PA7 = 0;
	PAOD7 = 0;

}


#define   BIG_TIME_SECONDS   43200
#define   SMALL_TIME_SECONDS  10800

#define  LETE_BRANCH_COMMON_STAY_TIME     1

#define    TRUE   1
#define    FALSE  0


void main (void)
{	
	enum setp_Adc4
	{
		ADC4_STEP_INIT = 0,
		ADC4_STEP_FIRST,
		ADC4_STEP_SECOND,
		ADC4_STEP_THIRD,
		ADC4_STEP_FOURTH,
		ADC4_STEP_FIFTH,
		ADC4_STEP_SIXTH,
	};


	static unsigned char ucWaitTime1S = 0;

	static unsigned char ucWaitTimeO3s = 0;

	static unsigned char ucSmallTimerActionFlag = 0;

	static unsigned char ucSetSmallActionFlag = 0;

	static unsigned char bCheckTweHour = 0;

	static unsigned char bCheckTheHour = 0;

	TRISA0 = 0; //SET PA0,PA1,PA2,PA3 as output
	TRISA1 = 0;
	TRISA2 = 0;
	TRISA3 = 0;
	TRISB0 = 0;
	TRISB1 = 0;
	TRISA6 = 0;
	TRISA7 = 0;
	TRISB6 = 0;


	initPin();


	TRISB2 = 1;//SET AD sample Channel 14

	TRISB7 = 1;// set AD sample Channel 4
	TRISB4 = 1;// set AD sample Channel 1

	clock_config();	//ʹϵͳʱ���ȶ�
	timer1_config();
	timer1_interrupt_config();
	
	adc_test_init(AD_CHANNEL_14_CHANNEL,ADC_REF_2P1);//ADC��ʼ�� ͨ��0 PB3��2.1V ��ѹΪ�ο�Դ

	dac_init(); //DAC0/1��ʼ��
	op1_init(); //OP1��ʼ��
	op2_init(); //OP2��ʼ��


	adc_start();	//ADC����


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
	}

	
	static enum MAIN_LOOP_STEP  enumMainLoopStep = MAIN_LOOP_STEP_INIT;
	
	static enum AD_CHANNEL_4_VALUE_PATH ucChannel4Type = 0;


#ifdef SET_PB1_AS_RESET_DEBUG_PIN
	static unsigned char ucTimerPowerLed = FALSE;
#endif

	while(1)
    {	
       CLRWDT();//feed watch dog

       process_AD_Converter_Value();

       if(isPermitSampleTime())   // this function is called every 100ms
		{
    	   clrSampeTime();

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
					static unsigned char ucTimerP5s = 0;

			   		PA6 = 1;

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
					static unsigned char ucTimerADC1ZeroP5s = 0;

					static unsigned char ucTimerLessADC1ZeroP5s = 0;

					static unsigned char ucTimerLessADC1ZeroP5sFlag = 0;

					static unsigned char ucTimerRightP5s = 0;

					if(getAdOriginalCh1Value() < 115)
					{
						ucTimerADC1ZeroP5s = 0;

						ucTimerLessADC1ZeroP5s++;  // looking for questions��need consider AD1 value is again more than 130  after less than 130
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

					startTwelveHourTimer(BIG_TIME_SECONDS);
					enumMainLoopStep = MAIN_LOOP_STEP_FIFTH;

					bCheckTweHour = FALSE;

					break;
				}

				case MAIN_LOOP_STEP_FIFTH:
				{

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
								startTwentySecondsTimer();
								ucADC4_Step = ADC4_STEP_FIRST;
								break;
							}

							case ADC4_STEP_FIRST:
							{
								if(getAdOriginaCh4Value() < 1911)
									ucChannel4Type = LESS_THAN_1911;
								else if(getAdOriginaCh4Value() < 2067)
									ucChannel4Type = BETWEEN_1911_AND_2067;
								else if(getAdOriginaCh4Value() < 2204)
									ucChannel4Type = BETWEEN_2067_AND_2204;
								else if(getAdOriginaCh4Value() < 2340)
									ucChannel4Type = BETWEEN_2204_AND_2340;
								else
									ucChannel4Type = MORE_THAN_2340;

								ucADC4_Step = ADC4_STEP_SECOND;
								break;
							}

							case ADC4_STEP_SECOND:
							{
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
												PB0 = 1;
												ucLoaderStep++;
												break;
											}

											case 1:
											{
												if(ucTimerDelay >= 5)
												{
													PA0 = 1;
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
													PA1= 1;
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
													PA2= 1;
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
													PA3 = 1;
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
													PB0 = 0;
													PA0 = 0;
													PA1 = 0;
													PA2 = 0;
													PA3 = 0;
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
												PB0 = 1;
												ucLoaderStep1++;
												break;
											}

											case 1:
											{
												if(ucTimerDelay1 >= 5)
												{
													PA0 = 1;
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
													PA1= 1;
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
													PA2 = 1;
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
													PA3 = 1;
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
													PA0 = 0;
													PA1 = 0;
													PA2 = 0;
													PA3 = 0;
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
												PB0 = 1;
												PA0 = 1;
												ucLoaderStep2++;
												break;
											}

											case 1:
											{
												if(ucTimerDelay2 >= 5)
												{
													PA1 = 1;
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
													PA2 = 1;
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
													PA3 = 1;
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

													PA1 = 0;
													PA2 = 0;
													PA3 = 0;
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
												PB0 = 1;
												PA0 = 1;
												PA1 = 1;
												ucLoaderStep3++;
												break;
											}

											case 1:
											{
												if(ucTimerDelay3 >= 5)
												{
													PA2 = 1;
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
													PA3 = 1;
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

													PA2 = 0;
													PA3 = 0;
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
												PB0 = 1;
												PA0 = 1;
												PA1 = 1;
												PA2 = 1;
												ucLoaderStep4++;
												break;
											}

											case 1:
											{
												if(ucTimerDelay4 >= 5)
												{
													PA3 = 1;
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
													PA3 = 0;
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
								static unsigned char ucTimerDelayP5s = 0;

								static unsigned char ucTimerPA6DelayP1s = 0;

								static unsigned char ucTimerPB6DelayP1s = 0;

								if(isFinishedTwentySecondsTimer())
								{
									if(ucTimerPA6DelayP1s < 1)
									{
										PA6 = 0;
										ucTimerPA6DelayP1s++;
									}
									else
									{
										if(ucTimerPB6DelayP1s < 1)
										{
											PBOD6 =0;
											PB6 = 1;// how make PB6 ouput high level
											ucTimerPB6DelayP1s++;
										}
										else
										{
											if(ucTimerDelayP5s < 3)
											{
												ucTimerDelayP5s++;
											}
											else
											{

												static unsigned char ucTimerForDACR0_CNT1 = 0, ucTimerForDACR0_CNT2 = 0;

												static unsigned char ucTimerForDACR0_CNT1_f = 0, ucTimerForDACR0_CNT2_f = 0;

												if((getAdOriginalCh14Value() > 2800))
												{
													ucTimerForDACR0_CNT1++;
													ucTimerForDACR0_CNT2 = 0;
												}
												else
												{
													ucTimerForDACR0_CNT2 = 0;
													ucTimerForDACR0_CNT1++;
												}

												if(ucTimerForDACR0_CNT1 >= 3)
													ucTimerForDACR0_CNT1_f = 1;

												if(ucTimerForDACR0_CNT2 >= 3)
													ucTimerForDACR0_CNT2_f = 1;

												if(ucTimerForDACR0_CNT1_f)
												{
													DACR0=0x0F;//set OP1 input 0.3v
													ucADC4_Step = ADC4_STEP_FOURTH;
												}
												else if(ucTimerForDACR0_CNT2_f)
												{
													DACR0=0x07;//set op1 input 0.14
													ucADC4_Step = ADC4_STEP_FOURTH;
												}
												else
												{
													;//do nothing, if this AD value vibrate in this scope, consider to alway stay here.
												}

												if(ADC4_STEP_FOURTH == ucADC4_Step)
												{
													ucTimerForDACR0_CNT1 = 0;
													ucTimerForDACR0_CNT2 = 0;
													ucTimerForDACR0_CNT1_f = 0;
													ucTimerForDACR0_CNT2_f = 0;

													ucTimerPB6DelayP1s = 0;
													ucTimerPA6DelayP1s = 0;

													ucTimerDelayP5s = 0;
												}
											}
										}
									}
								}
								else
									ucADC4_Step = ADC4_STEP_FIRST;

								break;
							}

							case ADC4_STEP_FOURTH:
							{
								static unsigned char ucTimer1s = 0;

								static unsigned char ucTimerSeond1s = 0;

								if(ucTimerSeond1s < 3)
								{
									ucTimerSeond1s++;
								}
								else
								{
									if(ucTimer1s < 3)
									{
										ucTimer1s++;
										PB6 = 1; // make sure PB6 can output Hign resistance
										PBOD6 = 1; //set PB6 as high resistance
									}
									else
									{
										ucTimer1s = 0;

										ucTimerSeond1s = 0;

										enumMainLoopStep = MAIN_LOOP_STEP_FIRST;

										ucADC4_Step = ADC4_STEP_INIT;
									}
								}

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
							PA7 = 1;
							PAOD7 = 1; //set PA7 AS hign resistence
							startThreeHoursTimer(SMALL_TIME_SECONDS);

							PB0 = 1;
							PA0 = 1;
							PA1 = 1;
							PA2 = 1;
							PA3 = 1;

							enumBranchStep = HOUR_3_BRANCH_STEP_SECOND;
							break;
						}

						case HOUR_3_BRANCH_STEP_SECOND:
						{
							static unsigned char ucTimer20s = 0;

							if(ucTimer20s < 200)
							{
								ucTimer20s++;

							}
							else
							{

								ucTimer20s = 0;

								enumBranchStep = HOUR_3_BRANCH_STEP_THIRD;

								PA6 = 0;
							}
							break;
						}

						case HOUR_3_BRANCH_STEP_THIRD:
						{
							if(isFinishedThreeHoursTimer())
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
									PAOD7 = 0;
									PA7 = 0;
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
							PB0 = 0;
							PB1 = 0;
							PA0 = 0;
							PA1 = 0;
							PA2 = 0;
							PA3 = 0;
							PBOD6 = 0;
							PB6 = 1;
							PA6 =0;

							enumInteralStep = INTERNAL_SECOND_STEP;
							break;
						}

						case INTERNAL_SECOND_STEP:
						{
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

								DACR0=0x0F;//set OP1 input 0.3v
								initPin();


								enumMainLoopStep =  MAIN_LOOP_STEP_INIT;

								while(1);// as to reset MCU

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
	

}


