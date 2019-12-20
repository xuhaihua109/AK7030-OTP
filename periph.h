#ifndef __PERIPH_H__
#define __PERIPH_H__
#define uchar unsigned char
#define uint  unsigned int

#define ADC_REF_OP1 0
#define ADC_REF_VCC 1
#define ADC_REF_PB5 2
#define ADC_REF_2P1 3



void dac_init();
void op1_init();
void op2_init();
void int_enable(uchar mode);//mode--- mode=1 ʹ���ж� 0��ֹ�ж�

void adc_test_init(uchar channel,uchar ref);//ADC��ʼ��
//refΪ�ο���ѹ 0-OP1 1-VCC 2-PB5 3-2.1V
void adc_start();	//����ADC
uint adc_get(void);//��ȡ�ɼ����
void uid_get(void);
#endif
