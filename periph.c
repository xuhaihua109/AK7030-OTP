#include <stdio.h>
#include "yn8p520.h"
#include "periph.h"
#include "common.h"


volatile union {
    struct {
        volatile unsigned short freq;     //20MHzУ׼ֵ
		volatile unsigned short u_1v2;    //1.2v
		volatile unsigned short u_2v1;    //2.15v
		volatile unsigned short otp_uid;
		volatile unsigned short uidd_h;   //����
		volatile unsigned short uidd_l;
		volatile unsigned short uids_h;   //����
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
//	 DAC�����ѹ= Vref*DACRn[5:0]/64	(n=0,1)
//	 DAC0��ѹ�ֱ����ͨ��OP1�Ŵ��PB5���������Ϊ������;
//	 DAC1��ѹ�ֱ����ͨ��OP2�Ŵ��PA7���������Ϊ������;
// �����datasheet OPA���ֿ�ͼ��
///////////////////////////////////////////////////////////////////
void dac_init()
{
	DACCON|=1;     //ѡ��OP2 �������Ϊ�ο���ѹ 2019/06/01 //�ο���ѹѡ��VCC  00-VSS 01-OP2OUT 10-VCC 11-PB5
	
	DACR0=0x0F;     //DAC0���OP2OUT(1.3V)*15/64=0.3Vͨ��OP1�����PB5���
	DACCON|=(1)<<2; //ʹ��DAC0

//	DACR1=0x06;     //DAC1���VCC*6/64=0.3Vͨ��OP1�����PA7���
//	DACCON|=(1)<<3; //ʹ��DAC1
}

////////////////////OP1����Ϊ�Ŵ�ģʽ��DAC0��ѹ��A1E(PB5)���///////////////////////
void op1_init()
{
    //���ã�OP1����ѡ��DAC0=1.3V(�ڲ��ܽ�) ��OP1����ѡ��A1N(PB4)����
    //OP1CON1=0x20; //���ظ��ز��ж� OP1 ����ѡ��DAC0(�ڲ��ܽ�)���ţ� OP1����ѡ��A1N(PB4)����    00100000B
	//OP1CON2=0xA0; //A1E(PB5)��� ����MUX���� ������;                                        10100000B
	//OP1CON0=0x80; //OP1ʹ�� ������� ��ֹ�˲�                                                10000000B
    
    //���ã�OP1����ѡ��DAC0=1.3V(�ڲ��ܽ�) ��OP1����ѡ��A1P(PB3)����
    OP1CON1=0x13; // positive input is BGR(1.3v), negative input is AVss  added by xuhaihua on 2019/12/20
 	OP1CON2=0x10; //  set op1 as buffer, disconnect negative input  added by xuhaihua on 2019/12/20
	OP1CON0=0x90; //  enable op1 and filter  added by xuhaihua on 2019/12/20

	//OP1����
//	TRISB3=1;	//PB3��A1P������
////	TRISB4=1;	//PB4��A1N������
//	TRISB5=0;	//PB5��A1E�����  DAC0�ź����Pin
}

////////////////////OP2����Ϊ�Ŵ�ģʽ��DAC1��ѹ��A1E(PA7)���///////////////////////
void op2_init()
{
    //���ã�OP2����ѡ��DAC1=0.3V(�ڲ��ܽ�) , OP2����ѡ��A2N(PB7)����
    //OP2CON1=0x18; //���ظ��ز��ж� OP2 ����ѡ��DAC1(�ڲ��ܽ�)���ţ� OP2����ѡ��A2N(PB7)����    00011000B
	//OP2CON2=0xA8; //A2E(PA7)��� ����MUX���� ������; ����Ŵ�ʹ�� �Ŵ�1��                    10101000B
	//OP2CON0=0x80; //ʹ�� OP2 ������� ��ֹ�˲�                                               10000000B   
    
    //���ã�OP2����ѡ��DAC1=0.3V(�ڲ��ܽ�) , OP2����ѡ��A2P(PB6)����
    OP2CON1=0x14; // set PB6 as A2P, set PB7 as A2N
	//OP2CON2=0xA0; //A2E(PA7)��� ����MUX���� ������; ����Ŵ�ʹ�� �Ŵ�1��                    10100000B
    OP2CON2=0x10; //disable A2E(PA7)��� ,����MUX����, OP2 ��ΪBUFFER      10010000B
	OP2CON0=0x80; //ʹ�� OP2 ������� ��ֹ�˲�                                               10000000B 

	//OP2����
//	TRISA7=0;	//PA7��A2E�����	  DAC1�ź����Pin
//	TRISB6=1;	//PB6(A2P)����Ϊ���� ��Ӧλ0-��� 1-���루Ҳ��������TRISA/B��ֵ��
//	TRISB7 = 1; //PB7(A2N)����Ϊ���� ��Ӧλ0-��� 1-���루Ҳ��������TRISA/B��ֵ��
}

/********************************************************************
* ���� :	int_enable(uchar mode)
* ���� : �ⲿ�ж�����
* ���� : mode--- mode=1 ʹ���ж� 0��ֹ�ж�
* ��� : ��
********************************************************************/
void int_enable(uchar mode)
{
	if(mode)
	{
		PEIE=1;    // �����ж�ʹ��
        GIE=1;     // ȫ���ж�ʹ��		
	}
	else
	{
		PEIE=0;    // �����ж�ʹ��
        GIE=0;     // ȫ���ж�ʹ��			
	}
}


void adc_test_init(uchar channel,uchar ref)
{
	ADCON0 = 0x40;
	ADCON0|=channel<<2;//ͨ����
	ADCON1 = 0x35;
	ADCON1|=ref<<6;	//�ο���ѹ 0-OP1 1-VCC 2-PB5 3-2.1v
	ADON=1;	//����ADC
	ADIE=1;	//ʹ���ж�
}


void setAdcSampleChannel(uchar ucChannel)
{
	ADCON0|=ucChannel<<2;//ͨ����
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



