#include <stdio.h>
#include "yn8p520.h"
#include "common.h"


void clock_config()
{
	// Systen clock config
	CLKPR = 0x80; 		// divide 1  �������CLKPSλCLKPCE����ʱCLKPS[1:0]����ͬʱд�� 2��b00��4T���� ϵͳʱ��
	CLKPR = 0x00;		//��ֹ���� CLKPS λ	
}


