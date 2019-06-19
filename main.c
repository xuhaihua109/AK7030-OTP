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


#define   BIG_TIME_SECONDS   180
#define   SMALL_TIME_SECONDS  60


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

	while(1)
    {	
       CLRWDT();//feed watch dog

       if(isPermitSampleTime())   // this function is called every 100ms
		{
    	   clrSampeTime();
    	   process_AD_Converter_Value();
		   
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

					if(ucTimerZeroPoint3s < 3)
					{
						ucTimerZeroPoint3s++;
					}
					else
					{
						ucTimerZeroPoint3s = 0;

						if(getAdOriginalCh14Value() > 1950)//  AD value -> 2v
						{

							enumMainLoopStep = MAIN_LOOP_STEP_SECOND;
						}
						else
						{
							clearPinPortAndTimer();
						}
					}
					break;
				}

				case MAIN_LOOP_STEP_SECOND:
				{	
					
			   		PA6 = 1;
			   		enumMainLoopStep = MAIN_LOOP_STEP_THIRD;
					
			   		break;
				}
				
				case MAIN_LOOP_STEP_THIRD:
				{
					static unsigned char ucTimerADC1ZeroP5s = 0;

					if(getAdOriginalCh1Value() < 130)
					{
						ucTimerADC1ZeroP5s = 0;

					}
					else
					{
						ucTimerADC1ZeroP5s++;
					}

					if(ucTimerADC1ZeroP5s >= 1)
					{
						ucTimerADC1ZeroP5s = 0;
						enumMainLoopStep = MAIN_LOOP_STEP_FOURTH;
					}
					else
					{
						static unsigned char ucTimerRightP5s = 0;

						if(getAdOriginalCh1Value() < 117)//????// wait to be determined.
						{
							ucTimerRightP5s++;
						}
						else
						{
							ucTimerRightP5s = 0;
						}

						if(ucTimerRightP5s >= 1)
						{
							ucTimerRightP5s = 0;
							enumMainLoopStep =  MAIN_LOOP_STEP_3_HOUR_BRANCH;
						}
						else
						{
							;// always do the same thing in the MAIN_LOOP_STEP_THIRD
						}
					}

					break;
				}

				case MAIN_LOOP_STEP_FOURTH:
				{

					startTwelveHourTimer(BIG_TIME_SECONDS);
					enumMainLoopStep = MAIN_LOOP_STEP_FIFTH;

					break;
				}

				case MAIN_LOOP_STEP_FIFTH:
				{

					if(isFinishedTwelveHoursTimer())
					{
						enumMainLoopStep = MAIN_LOOP_STEP_12_HOUR_END;//???? wait to be determined
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
												if(ucTimerDelay >= 2)
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
												if(ucTimerDelay1 >= 2)
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
												if(ucTimerDelay2 >= 2)
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
												if(ucTimerDelay3 >= 2)
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
												if(ucTimerDelay4 >= 2)
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
								if(isFinishedTwentySecondsTimer())
								{
									PBOD6 =0;
									PB6 = 1;// how make PB6 ouput high level
									PA6 = 0;
//								    PB0 = 0;
//									PA0 = 0;
//									PA1 = 0;
//									PA2 = 0;
//									PA3 = 0;

									if((getAdOriginalCh14Value() > 2800))
										DACR0=0x0F;//set OP1 input 0.3v
									else
										DACR0=0x07;//set op1 input 0.14

									ucADC4_Step = ADC4_STEP_FOURTH;
								}
								else
									ucADC4_Step = ADC4_STEP_FIRST;

								break;
							}

							case ADC4_STEP_FOURTH:
							{
								static unsigned char ucTimer1s = 0;
								if(ucTimer1s < 5)
								{
									ucTimer1s++;
								}
								else
								{
									ucTimer1s = 0;
									PB6 = 1; // make sure PB6 can output Hign resistance
									PBOD6 = 1; //set PB6 as high resistance
									enumMainLoopStep = MAIN_LOOP_STEP_FIRST;
									ucADC4_Step = ADC4_STEP_INIT;
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

							enumBranchStep = HOUR_3_BRANCH_STEP_SECOND;
							break;
						}

						case HOUR_3_BRANCH_STEP_SECOND:
						{
							static unsigned char ucTimer20s = 0;

							if(ucTimer20s < 200)
							{
								ucTimer20s++;
								PB0 = 1;
								PA0 = 1;
								PA1 = 1;
								PA2 = 1;
								PA3 = 1;
							}
							else
							{

								ucTimer20s = 0;


								enumBranchStep = HOUR_3_BRANCH_STEP_THIRD;
							}
							break;
						}

						case HOUR_3_BRANCH_STEP_THIRD:
						{
							PA6 = 0;

							if(isFinishedThreeHoursTimer())
							{
								enumBranchStep = HOUR_3_BRANCH_STEP_FIRST;
								enumMainLoopStep =  MAIN_LOOP_STEP_12_HOUR_END;
							}
							else
							{
								static unsigned char ucTimerX1P5s = 0;

								if(getAdOriginalCh1Value() < 130)
								{
									ucTimerX1P5s = 0;
								}
								else
								{
									ucTimerX1P5s++;
								}

								if(ucTimerX1P5s >= 1)
								{
									ucTimerX1P5s = 0;
									PAOD7 = 0;
									PA7 = 0;
									clearThreeHoursTimer();

									enumBranchStep = HOUR_3_BRANCH_STEP_FIRST;

									enumMainLoopStep =  MAIN_LOOP_STEP_SECOND;
								}
								else
								{
									static unsigned char ucTimerX2P5s = 0;

									if(getAdOriginalCh14Value() >= 1950)
									{
										ucTimerX2P5s++;
									}
									else
									{
										ucTimerX2P5s = 0;
									}

									if(ucTimerX2P5s >= 1)
									{
										ucTimerX2P5s = 0;
									}
									else
									{
										clearPinPortAndTimer();
										enumMainLoopStep =  MAIN_LOOP_STEP_FIRST;
									}
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


