#include <stdio.h>
#include "yn8p520.h"
#include "periph.h"
#include "common.h"


volatile union {
    struct {
        volatile unsigned short freq;     //20MHz校准值
		volatile unsigned short u_1v2;    //1.2v
		volatile unsigned short u_2v1;    //2.15v
		volatile unsigned short otp_uid;
		volatile unsigned short uidd_h;   //批号
		volatile unsigned short uidd_l;
		volatile unsigned short uids_h;   //增量
		volatile unsigned short uids_l;
    };
    struct {
        unsigned char buf[16];
    };
} key @ 0x1e0;



unsigned short bgr_trim;
unsigned short ad_offset=0;


////////////////////////UID//////////////////////////////////
void uid_get(void)
{

	SRAM_MAP = 1;  //enable access uid region

	bgr_trim = key.u_1v2;
	ad_offset = key.otp_uid&0xff;

	ad_offset = 0;

	SRAM_MAP = 0;  //disable access uid region

}

///////////////////////////DAC//////////////////////////////////
//	 DAC输出电压= Vref*DACRn[5:0]/64	(n=0,1)
//	 DAC0电压分别可以通过OP1放大从PB5输出，或作为其他用途
//	 DAC1电压分别可以通过OP2放大从PA7输出，或作为其他用途
// （详见datasheet OPA部分框图）
///////////////////////////////////////////////////////////////////
void dac_init()
{
	DACCON|=1;     //选择OP2 的输出作为参考电压 2019/06/01 //参考电压选择VCC  00-VSS 01-OP2OUT 10-VCC 11-PB5
	
	DACR0=0x0F;     //DAC0输出OP2OUT(1.3V)*15/64=0.3V通过OP1缓冲从PB5输出
	DACCON|=(1)<<2; //使能DAC0

//	DACR1=0x06;     //DAC1输出VCC*6/64=0.3V通过OP1缓冲从PA7输出
//	DACCON|=(1)<<3; //使能DAC1
}

////////////////////OP1配置为放大模式将DAC0电压从A1E(PB5)输出///////////////////////
void op1_init()
{
    //配置：OP1正端选择DAC0=1.3V(内部管脚) ，OP1负端选择A1N(PB4)引脚
    //OP1CON1=0x20; //正沿负沿不中断 OP1 正端选择DAC0(内部管脚)引脚， OP1负端选择A1N(PB4)引脚    00100000B
	//OP1CON2=0xA0; //A1E(PB5)输出 负端MUX连接 其他用途                                        10100000B
	//OP1CON0=0x80; //OP1使能 正相输出 禁止滤波                                                10000000B
    
    //配置：OP1负端选择DAC0=1.3V(内部管脚) ，OP1正端选择A1P(PB3)引脚
    OP1CON1=0x13; // positive input is BGR(1.3v), negative input is AVss  added by xuhaihua on 2019/12/20
 	OP1CON2=0x10; //  set op1 as buffer, disconnect negative input  added by xuhaihua on 2019/12/20
	OP1CON0=0x90; //  enable op1 and filter  added by xuhaihua on 2019/12/20

	//OP1配置
//	TRISB3=1;	//PB3（A1P）输入
////	TRISB4=1;	//PB4（A1N）输入
//	TRISB5=0;	//PB5（A1E）输出  DAC0信号输出Pin
}

////////////////////OP2配置为放大模式将DAC1电压从A1E(PA7)输出///////////////////////
void op2_init()
{
    //配置：OP2正端选择DAC1=0.3V(内部管脚) , OP2负端选择A2N(PB7)引脚
    //OP2CON1=0x18; //正沿负沿不中断 OP2 正端选择DAC1(内部管脚)引脚， OP2负端选择A2N(PB7)引脚    00011000B
	//OP2CON2=0xA8; //A2E(PA7)输出 负端MUX连接 其他用途 增益放大使能 放大1倍                    10101000B
	//OP2CON0=0x80; //使能 OP2 正相输出 禁止滤波                                               10000000B   
    
    //配置：OP2负端选择DAC1=0.3V(内部管脚) , OP2正端选择A2P(PB6)引脚
    OP2CON1=0x14; // set PB6 as A2P, set PB7 as A2N
	//OP2CON2=0xA0; //A2E(PA7)输出 负端MUX连接 其他用途 增益放大使能 放大1倍                    10100000B
    OP2CON2=0x10; //disable A2E(PA7)输出 ,负端MUX连接, OP2 作为BUFFER      10010000B
	OP2CON0=0x80; //使能 OP2 正相输出 禁止滤波                                               10000000B 

	//OP2配置
//	TRISA7=0;	//PA7（A2E）输出	  DAC1信号输出Pin
//	TRISB6=1;	//PB6(A2P)设置为输入 相应位0-输出 1-输入（也可以整个TRISA/B赋值）
//	TRISB7 = 1; //PB7(A2N)设置为输入 相应位0-输出 1-输入（也可以整个TRISA/B赋值）
}

/********************************************************************
* 名称 :	int_enable(uchar mode)
* 功能 : 外部中断配置
* 输入 : mode--- mode=1 使能中断 0禁止中断
* 输出 : 无
********************************************************************/
void int_enable(uchar mode)
{
	if(mode)
	{
		PEIE=1;    // 外设中断使能
        GIE=1;     // 全局中断使能		
	}
	else
	{
		PEIE=0;    // 外设中断使能
        GIE=0;     // 全局中断使能			
	}
}


void adc_test_init(uchar channel,uchar ref)
{
	ADCON0 = 0x40;
	ADCON0|=channel<<2;//通道号
	ADCON1 = 0x35;
	ADCON1|=ref<<6;	//参考电压 0-OP1 1-VCC 2-PB5 3-2.1v
	ADON=1;	//启动ADC
	ADIE=1;	//使能中断
}


void setAdcSampleChannel(uchar ucChannel)
{
	ADCON0|=ucChannel<<2;//通道号
}

void adc_start()
{
	GO=1;
}

uint adc_get(void)
{
	uint val;
	val = (ADRESH<<8) | ADRESL;

	val = val + ad_offset;
	return val;
}



