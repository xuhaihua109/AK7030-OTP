
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


// #define    USE_SOFTWARE_SIMULATION_TEST                1

#ifndef USE_SOFTWARE_SIMULATION_TEST


#define  SET_PIN_AS_OUTPUT   0
#define  SET_PIN_AS_INPUT    1

#define  SET_PIN_HIGH    1
#define  SET_PIN_LOW     0


#define   BIG_TIME_SECONDS         36000
#define   SMALL_TIME_SECONDS       10800

#define   TIMER_20MIN       1200

#define  LETE_BRANCH_COMMON_STAY_TIME     1

#define    TRUE   1
#define    FALSE  0





#define _XTAL_FREQ 20000000

#include <stdio.h>
#include "yn8p520.h"	//ϵͳͷ�ļ�
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
#ifndef USE_SOFTWARE_SIMULATION_TEST

#define CONFIG1 IO_MODE8   & PWRTE_ON   & LVTEN_ON    & WDTE_ON    &  RDSEL_ON & SMT_ON
#define CONFIG2 OTP_MOD2K  & BOR22V      & FOSC_RC20M  & RESETE_OFF
#define CONFIG3 OTP_2K_1  & WDTPS_128   & SUT_ON      & SUT_0


__CONFIG(CONFIG1);
__CONFIG(CONFIG2);
__CONFIG(CONFIG3);

#define SLEEP_PWIDLE() SMCR = 0X01; SLEEP()
#define SLEEP_PWSAVE() SMCR = 0X07; SLEEP()
#define SLEEP_PWADC()  SMCR = 0X05; SLEEP()
#define SLEEP_PWOFF()  SMCR = 0X09; SLEEP()

#endif

//#define CHANGE_PIN_DEFINAITION   1



#ifndef USE_SOFTWARE_SIMULATION_TEST
static void clearAllTimer(void)
{
	clearTwelveHoursTimer();
	clearThreeHoursTimer();
	clearTwentySecondsTimer();
}
#endif


void initPB3(unsigned char bValue)
{
	if( bValue )
#ifndef USE_SOFTWARE_SIMULATION_TEST
		TRISB3 = 1;
#else
	   cout <<"set PB3 as input pin."<<endl;
#endif
	else
#ifndef USE_SOFTWARE_SIMULATION_TEST
		TRISB3 = 0;
#else
	   cout <<"set PB3 as output pin."<<endl;
#endif
}


void setPB3(unsigned char bValue)
{
	if( bValue )
#ifndef USE_SOFTWARE_SIMULATION_TEST
		PB3 = 1;
#else
	   cout <<"set PB3 output 1"<<endl;
#endif
	else
#ifndef USE_SOFTWARE_SIMULATION_TEST
		PB3= 0;
#else
	   cout <<"set PB3 output 0"<<endl;
#endif
}



void initPB4(unsigned char bValue)
{
	if( bValue )
#ifndef USE_SOFTWARE_SIMULATION_TEST
		TRISB4 = 1;
#else
	   cout <<"set PB4 as input pin."<<endl;
#endif
	else
#ifndef USE_SOFTWARE_SIMULATION_TEST
		TRISB4= 0;
#else
	   cout <<"set PB4 as output pin."<<endl;
#endif
}


void setPB4(unsigned char bValue)
{
	if( bValue )
#ifndef USE_SOFTWARE_SIMULATION_TEST
		PB4 = 1;
#else
	   cout <<"set PB4 output 1."<<endl;
#endif
	else
#ifndef USE_SOFTWARE_SIMULATION_TEST
		PB4= 0;
#else
	   cout <<"set PB4 as output 0."<<endl;
#endif
}


void initPB5(unsigned char bValue)
{
	if( bValue )
#ifndef USE_SOFTWARE_SIMULATION_TEST
		TRISB5 = 1;
#else
	   cout <<"set PB5 as input pin."<<endl;
#endif
	else
#ifndef USE_SOFTWARE_SIMULATION_TEST
		TRISB5= 0;
#else
	   cout <<"set PB5 as output pin."<<endl;
#endif
}


void setPB5(unsigned char bValue)
{
	if( bValue )
#ifndef USE_SOFTWARE_SIMULATION_TEST
		PB5 = 1;
#else
	   cout <<"set PB5 output 1."<<endl;
#endif
	else
#ifndef USE_SOFTWARE_SIMULATION_TEST
		PB5= 0;
#else
	   cout <<"set PB5 output 0."<<endl;
#endif
}


void initPB2_AsHighResistence( void )
{ // in 8 pin chip, PB2 is the fifth pin
#ifndef 	USE_SOFTWARE_SIMULATION_TEST
	PB2 = 1;
	PBOD2 = 1; //set PB2 as high resistance
#else
	cout << "set PB2 as high resistance"<< endl;
#endif
}

//void initCCP1PWM_Mode( void )
//{
//	 CCP1CON = 0x10 ; // 0101 0101 OP1 ������� PWM ����رգ�����������ʱ�� PWM �Զ����� OP2 ������� PWM ����رգ�����ͨ��������������� ��PWM ������ʹ�ܣ�1�� OP1 ����ᵼ�� PWM �Զ��ر�,op2����; PWM �Զ��ر�ʹ��
//	 PR2 = 4 ;     //T2���ڼĴ���
//	 T2CON = 0x04 ;   //ʹ��TMR2�����Ƶֵ1 Ԥ��Ƶֵ1
//	 CCPR1L = 0x02 ;
//	 PWMCON1 = 0x55;   // �Ĵ�����ֵ��datasheed���治һ������Ӧ��ΪPWM1CON1�Ĵ���
//
//}
//
//void startPWM_Mode (void)
//{
//	CCP1CON |= 0x0e ;    //��pwmģʽ
//	TRISB2=0;	//���
//}


static void clearPinPortAndTimer(void)
{
#ifndef 	USE_SOFTWARE_SIMULATION_TEST

	setPB3(0);
	setPB4(0);
	setPB5(0);
	setPB2_AsHighResistence();
	clearAllTimer();
#else
	cout << "clearPinPortAndTimer(void)" << endl;
#endif
}


//pwm��ʼ��
void pwm_start(unsigned char ucPulseWidth)
{
#ifndef 	USE_SOFTWARE_SIMULATION_TEST
// //CCP1CON is at 348 line in yn8p520.h file
// CCP1CON = 0x10 ; // 0101 0101 OP1 ������� PWM ����رգ�����������ʱ�� PWM �Զ����� OP2 ������� PWM ����رգ�����ͨ��������������� ��PWM ������ʹ�ܣ�1�� OP1 ����ᵼ�� PWM �Զ��ر�,op2����; PWM �Զ��ر�ʹ��
// PR2 = 4 ;     //T2���ڼĴ���   // it is at 649 line in yn8p520.h file
// T2CON = 0x04 ;   //ʹ��TMR2�����Ƶֵ1 Ԥ��Ƶֵ1
// CCPR1L = 0x02 ;
// PWMCON1 = 0x55;   // �Ĵ�����ֵ��datasheed���治һ������Ӧ��ΪPWM1CON1�Ĵ���
//
// TRISB2=0;	//���
//
// CCP1CON |= 0x0e ;    //��pwmģʽ


	T2CON=0x04;			//ʹ��T2�����Ƶֵ1 Ԥ��Ƶֵ1
	PR2 = 49;   		//T2���ڼĴ�����   100kHZ f=20M/(4*(PR2+1))
	CCPR1L = ucPulseWidth;	   //pwm��8λ  ռ�ձ�50% =��CCPR1L:CCP1CON[5:4]��/((PR2+1)*4)
	CCP1CON=0x00;		//�ⲿCCP1��������  pwm����λΪ00������ PWMģʽ�� e PWM Ĭ�����Ϊ 1, d 0

	TRISB2=0;			//pb2��Ϊ���
	PBOD2 = 0;
#else
 	 cout << "pwm_start();" <<endl;
#endif
}


void pwm_config(unsigned char state)
{
	if( state )
		CCP1CON|= 0x0c;		//�ⲿCCP1��������  pwm����λΪ01������ PWMģʽ�� e PWM Ĭ�����Ϊ 1, d 0
	else
		CCP1CON&= 0xf0;		//��ֹpwm
}

static void initPin(void)
{
#ifndef 	USE_SOFTWARE_SIMULATION_TEST
	initPB2_AsHighResistence();

	initPB3(SET_PIN_AS_OUTPUT);

	initPB4(SET_PIN_AS_OUTPUT);

	initPB5(SET_PIN_AS_OUTPUT);
#else
	cout << "initPin(void)" << endl;
#endif

}

static void setPinInitVaule( void )
{
#ifndef 	USE_SOFTWARE_SIMULATION_TEST
	setPB3(SET_PIN_HIGH);
	setPB4(SET_PIN_LOW);
	setPB5(SET_PIN_HIGH);
#else
	cout << "setPinInitVaule(void)" << endl;
#endif
}

static void selectAdChannel( void )
{
#ifndef 	USE_SOFTWARE_SIMULATION_TEST
	TRISB0 = 1; //AD 12 CHANNEL
	TRISB1 = 1; // AD 13 CHANNEL
#else
	cout << "selectAdChannel(void)" << endl;
#endif
}

static void setPulseWidth( void )
{
#ifndef 	USE_SOFTWARE_SIMULATION_TEST
	;//wait to develop.
#else
	cout << "setPulseWidth();"<<endl;
#endif
}

static void reset( void )
{
#ifndef 	USE_SOFTWARE_SIMULATION_TEST
	while(1);
#else
	cout << "while(1);" <<endl;
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

	cout <<"please input value of ch14:"<< endl;

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


void main (void)
{

#ifdef		USE_SOFTWARE_SIMULATION_TEST
	cout << "!!!Hello World!!!" << endl; // prints !!!Hello World!!!
#endif


		static unsigned char ucWaitTime1S = 0;

		static unsigned char ucWaitTimeO3s = 0;

		static unsigned char ucSmallTimerActionFlag = 0;

		static unsigned char ucSetSmallActionFlag = 0;

		static unsigned char bCheckTweHour = 0;

		static unsigned char bCheckTheHour = 0;


#ifndef		USE_SOFTWARE_SIMULATION_TEST
//		TRISA0 = 0; //SET PA0,PA1,PA2,PA3 as output
//		TRISA1 = 0;
//		TRISA2 = 0;
//		TRISA3 = 0;
//		TRISB0 = 0;
//		TRISB1 = 0;
//		TRISA6 = 0;
//	//	TRISA7 = 0;
//		TRISB7 = 0;// PB7 instead of PA7
//		TRISB6 = 0;


		initPin();
		setPinInitVaule();
		selectAdChannel();


		clock_config();	//ʹϵͳʱ���ȶ�
		timer1_config();
		timer1_interrupt_config();

		adc_test_init(AD_CHANNEL_12_CHANNEL,ADC_REF_2P1);//ADC��ʼ�� ͨ��12 PB0��2.1V ��ѹΪ�ο�Դ

//		dac_init(); //DAC0/1��ʼ��
//		op1_init(); //OP1��ʼ��
//		op2_init(); //OP2��ʼ��


		adc_start();	//ADC����
#else
		cout << "initialization after power on" << endl;
#endif


	#ifdef SET_PB1_AS_RESET_DEBUG_PIN
		static unsigned char ucTimerPowerLed = FALSE;
	#endif

		startTwentyMinTimer( TIMER_20MIN );

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
			static unsigned char ucStep = 0;
			switch(ucStep)
			{
				case 0:
				{
					static unsigned char ucTimerP3s = 0;

					if( isFinishedTwentyMinTimer() )
						;// wait to develop
					else
					{
						if( getAdOriginalCh13Value() > 1000 )
						{
							setPB5(SET_PIN_HIGH);
							ucTimerP3s++;
						}
						else
						{
							ucTimerP3s = 0;
							setPB5(SET_PIN_LOW);
						}


						if( getAdOriginalCh12Value() > 1000 )
						{
							setPB4(SET_PIN_HIGH);
							ucTimerP3s++;

						}
						else
						{
							ucTimerP3s = 0;
							setPB4(SET_PIN_LOW);
						}

						static unsigned char ucDebug1 = 0;

						static unsigned char ucDebug2 = 0;

						ucDebug1++;

						if( ucDebug1 < 10 )
							setPB3(SET_PIN_HIGH);
						else if((ucDebug1 >= 10) && ( ucDebug1 < 20))
						{
							setPB3(SET_PIN_LOW);
						}
						else
						{
							ucDebug1 = 0;
						}

						ucDebug2++;
						if(ucDebug2 > 150) //100 *100ms = 15s
							ucStep++;
					}
					break;
				}

				case 1:
				{
					if( getAdOriginalCh12Value() > 1000 )
						pwm_start(0x19); //100/200 50%
					else
						pwm_start(0x02); //32/200 = 16%
				//	setPulseWidth();
					pwm_config(1);
					setPB3(SET_PIN_LOW);
					setPB4(SET_PIN_HIGH);
					setPB5(SET_PIN_LOW);
					clearTwentyMinTimer();
					startTwelveHourTimer( 36000); //10 hours timer
					ucStep++;
					break;
				}

				case 2:
				{
					static unsigned char ucTimerP5s = 0;

					if( isFinishedTwelveHoursTimer () )
						ucStep = 99;
					else
					{
						if( getAdOriginalCh13Value() < 200 )
							ucTimerP5s++;
						else
							ucTimerP5s = 0;

						if( ucTimerP5s > 5)
						{
							ucTimerP5s = 0;
					//		ucStep++;
						}
					}
					break;
				}

				case 3:
				{
					clearTwelveHoursTimer();
					startThreeHoursTimer(10800);//3 hours
					ucStep++;
					break;
				}

				case 4:
				{
					static unsigned char ucTimerP5s = 0;

					if( isFinishedThreeHoursTimer() )
						ucStep = 99;
					else
					{
						if( getAdOriginalCh13Value() < 85 )
							ucTimerP5s++;
						else
							ucTimerP5s = 0;

						if( ucTimerP5s > 5)
						{
							ucTimerP5s = 0;
							ucStep++;
						}
					}
					break;
				}

				case 5:
				{
					clearThreeHoursTimer();
					startOneHoursTimer( 3600 );
					setPB3(SET_PIN_HIGH);
					setPB4(SET_PIN_LOW);
					setPB5(SET_PIN_HIGH);
					ucStep++;
					break;
				}

				case 6:
				{
					static unsigned int uiTimerOneP5s = 0;
					static unsigned int uiTimerTwoP5s = 0;


					if( isFinishedOneHoursTimer() )
						ucStep = 99;
					else
					{
						if( getAdOriginalCh13Value() > 100 )
						{
							uiTimerOneP5s++;
							uiTimerTwoP5s = 0; // need clear it because value is less than 25.
						}
						else
						 uiTimerOneP5s = 0;

						if(uiTimerOneP5s > 5)
						{
							setPB3(SET_PIN_LOW);
							setPB4(SET_PIN_HIGH);
							setPB5(SET_PIN_LOW);

							uiTimerOneP5s = 0;
							uiTimerTwoP5s = 0;
							ucStep++;
						}
						else
						{
							if( getAdOriginalCh13Value() < 25 )
								uiTimerTwoP5s++;
							else
								uiTimerTwoP5s = 0;

							if(uiTimerTwoP5s > 5)
								reset();
						}
					}
					break;
				}

				case 7:
				{
					static unsigned int uiTimerP5s = 0;
					if( getAdOriginalCh13Value() < 25 )
						uiTimerP5s++;
					else
						uiTimerP5s = 0;

					if(uiTimerP5s > 5)
					{
						uiTimerP5s = 0;
						setPB3(SET_PIN_HIGH);
						setPB4(SET_PIN_LOW);
						setPB5(SET_PIN_HIGH);
						ucStep  = 99;
					}


					break;
				}


				case 99:
				{
					setPB3(SET_PIN_LOW);
					setPB4(SET_PIN_LOW);
					setPB5(SET_PIN_HIGH);
					setPulseWidth();// need to set 60% pulse width
					ucStep++;
					break;
				}

				case 100:
				{
					static unsigned char ucTimerP5s = 0;
					if( getAdOriginalCh13Value() >50 )
						ucTimerP5s++;
					else
						ucTimerP5s = 0;

					if(ucTimerP5s > 5)
						ucStep++;
					break;
				}

				case 101:
				{
					reset();
					break;
				}


				default:
					break;
			}




			}
		}
//	return 0;
}


