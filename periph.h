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
void int_enable(uchar mode);//mode--- mode=1 使能中断 0禁止中断

void adc_test_init(uchar channel,uchar ref);//ADC初始化
//ref为参考电压 0-OP1 1-VCC 2-PB5 3-2.1V
void adc_start();	//启动ADC
uint adc_get(void);//获取采集结果
void uid_get(void);
#endif
