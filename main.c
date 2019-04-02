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

#define _XTAL_FREQ 20000000

#include <stdio.h>
#include "yn8p520.h"	//系统头文件
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





void main (void)
{	
	enum step
	{
		SENSE_PB2_INPUT_VOLTAGE = 0,
		SENSE_PB2_DURATION_ONE_SECOND,
		SENSE_PB2_INPUT_VOLTAGE__AGAIN,
		SENSE_PB2_DURATION__SECOND,
		SET_PA2_VALUE,
		ADC1_VALUE_MEET_CONDITION,
		PROCESS_AD_VALUE,
		WAIT_SET_TIME_FINISHED,
		SET_TIME_BE_FINISHED,
		CHECKING_PULL_OUT_BATTERY,
		CHECKING_INSTALLED_BATTERY,
	};

	enum workTimerType
	{
		BIG_TIMER_WORK = 0,
		SMALL_TIMER_WORK,
	};

	static enum step ampStep;

	static enum workTimerType tDA_timer;

	static unsigned char ucWaitTime1S = 0;

	static unsigned char ucWaitTimeO3s = 0;

	static unsigned char ucSmallTimerActionFlag = 0;

	static unsigned char ucSetSmallActionFlag = 0;

	TRISA0 = 0; //SET PA0,PA1,PA2,PA3 as output
	TRISA1 = 0;
	TRISA3 = 0;
	TRISA2 = 0;
	TRISA6 = 0;
	PA2 = 1;
	PA0 = 1;

	TRISB2 = 1;//SET PB2 as input

	TRISB1 = 1;// set AD sample Channel 13
	TRISB4 = 1;// set AD sample Channel 1

	clock_config();	//使系统时钟稳定
	timer1_config();
	timer1_interrupt_config();
	
	adc_test_init(AD_CHANNEL_13_CHANNEL,ADC_REF_2P1);//ADC初始化 通道0 PB3，2.1V 电压为参考源

	dac_init(); //DAC0/1初始化
	op1_init(); //OP1初始化
	op2_init(); //OP2初始化


	adc_start();	//ADC启动


	static unsigned char testStep;
	static unsigned char ucBigTimerActionFlag = 0;
	while(1)
    {	
       CLRWDT();//feed watch dog
       if(isPermitSampleTime())   // this function is called every 100ms
		{
    	   clrSampeTime();
    	   process_AD_Converter_Value();

    	   switch(ampStep)
		   {
    	   	   case SENSE_PB2_INPUT_VOLTAGE:
    	   	   {
    	   		   ucBigTimerActionFlag = 0;
    	   		   clearBigTimer();
    	   		   clearSmallTimer();
    	   		   if(!PB2)
    	   			ampStep++;
    	   			break;
    	   	   }

			   case SENSE_PB2_DURATION_ONE_SECOND:
			   {
				   static unsigned char ucConfirmTimer1S = 0;
					 if(!PB2)
					 {
						 ucConfirmTimer1S++;
					 }
					 else
					 {
						 ucConfirmTimer1S = 0;
					 }

					 if(ucConfirmTimer1S >= 10) //100ms*10 = 1s
					 {
						 ucConfirmTimer1S = 0;
						 ampStep++;
					 }

					 break;
			   }

			   case SENSE_PB2_INPUT_VOLTAGE__AGAIN:
			   {
				   if(!PB2)
					ampStep++;
					break;
			   }

			   case SENSE_PB2_DURATION__SECOND:
			   {
				   	 static unsigned char ucConfirmTimerZptS = 0;//ZptS = zero point three second
					 if(!PB2)
					 {
						 ucConfirmTimerZptS++;
					 }
					 else
					 {
						 ucConfirmTimerZptS = 0;
					 }

					 if(ucConfirmTimerZptS >= 10) //100ms*3 = 0.3s
					 {
						 ucConfirmTimerZptS = 0;
						 ampStep++;
					 }

					 break;
			   }

			   case SET_PA2_VALUE:
			   {
				   PA2 = 0;
				   ampStep++;
				   break;
			   }

			   case ADC1_VALUE_MEET_CONDITION:
			   {
				   static unsigned char ucConFirmationTime = 0;
				   if(getAdOriginalCh1Value() >= 2341)
				   {
					   if(ucConFirmationTime < 5)
						   ucConFirmationTime++;
					   else
					   {
						   PAOD6 = 1;
						   PA6 = 1;
					   }
				   }
				   else
				   {
					   ucConFirmationTime = 0;
					   PAOD6 = 0;
					   PA6 = 0;
				   }

				   ampStep++;
				   break;
			   }

			   case PROCESS_AD_VALUE:
			   {
				   static unsigned char ucInit = 0;
				   if(getAdOriginalCh13Value() > 36)
				   {
					   ucInit = 1;
					   PA0 = 0;
					   PA1 = 1;
					   PA3 = 1;
					   tDA_timer = BIG_TIMER_WORK;
					//   setDAC0_ChannelValue(27);// (27/64)*5v = 2.109v
					   if(!ucBigTimerActionFlag)
					   {
						   startBigTimer();
						   ucBigTimerActionFlag = 1;
					   }
				   }
				   else if(getAdOriginalCh13Value() <31)
				   {
					   ucInit = 1;
					   PA0 = 1;
					   PA1 = 0;
					   PA3 = 0;
					   tDA_timer = SMALL_TIMER_WORK;
					   ucSmallTimerActionFlag = 1;
					   ucWaitTimeO3s = 0;
					   ucSetSmallActionFlag = 1;
		//			   setDAC0_ChannelValue(25);// (25/64)*5v = 1.95v
					   startSmallTimer();
				   }
				   else
				   {
					   if(!ucInit)
					   {
						   ucInit = 1;
						   PA0 = 0;
						   PA1 = 1;
						   PA3 = 1;
						   tDA_timer = BIG_TIMER_WORK;
	//					   setDAC0_ChannelValue(27);// (27/64)*5v = 2.109v
						   if(!ucBigTimerActionFlag)
						   {
							   startBigTimer();
							   ucBigTimerActionFlag = 1;
						   }
					   }
				   }


				   ampStep++;
				   break;
			   }

			   case WAIT_SET_TIME_FINISHED:
			   {
				   switch(tDA_timer)
				   {
					   case BIG_TIMER_WORK:
					   {
						   if(!isFinishedBigTimer())
						   {
							   ampStep = ADC1_VALUE_MEET_CONDITION;
						   }
						   else
						   {
							   ampStep++;
						   }
						   break;
					   }

					   case SMALL_TIMER_WORK:
					   {
						   if((ucBigTimerActionFlag == 1) && isFinishedBigTimer())
						   {
							   ampStep++;
						   }
						   else if(!isFinishedSmallTimer())
						   {
							   if(getAdOriginalCh13Value() > 36)
								{
									ucWaitTime1S = 0;
									ucSmallTimerActionFlag = 0;
									ucSetSmallActionFlag = 0;
								    ampStep = ADC1_VALUE_MEET_CONDITION;
								}
						   }
						   else
						   {
							   ampStep++;
						   }

						   break;
					   }

					   default:
						   break;
				   }

				   break;
			   }

			   case SET_TIME_BE_FINISHED:
			   {
				   PA2 = 1;
				   PA0 = 0;
				   PA1 = 0;
				   PA3 = 0;
				   ucWaitTime1S = 0;
				   ucSmallTimerActionFlag = 0;
				   ucSetSmallActionFlag = 0;
//				   setDAC0_ChannelValue(25);// (25/64)*5v = 1.95v
				   ampStep++;
				   break;
			   }

			   case CHECKING_PULL_OUT_BATTERY:
			   {
				   static unsigned char ucCheckBatteryCnt = 0;
				   if(PB2)
					   ucCheckBatteryCnt++;
				   else
					   ucCheckBatteryCnt = 0;

				   if(ucCheckBatteryCnt > 2)
				   {
					   ucCheckBatteryCnt = 0;
					   ampStep++;
				   }
				   break;
			   }

			   case CHECKING_INSTALLED_BATTERY:
			   {
				   static unsigned char ucInstalledBatteryCnt = 0;
				   if(!PB2)
					   ucInstalledBatteryCnt++;
				   else
					   ucInstalledBatteryCnt = 0;

				   if(ucInstalledBatteryCnt > 10) //1s
				   {
					   ucInstalledBatteryCnt = 0;
					   ampStep = SENSE_PB2_INPUT_VOLTAGE;
				   }
				   break;
			   }

			   default:
				   break;

		   }
		}
	}
}

