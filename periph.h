#ifndef __PERIPH_H__
#define __PERIPH_H__
#define uchar unsigned char
#define uint  unsigned int

void dac_init();
void op1_init();
void op2_init();
void int_enable(uchar mode);//mode--- mode=1 使能中断 0禁止中断

#endif