#include <stdio.h>
#include "yn8p520.h"
#include "common.h"


void clock_config()
{
	// Systen clock config
	CLKPR = 0x80; 		// divide 1  允许更新CLKPS位CLKPCE更新时CLKPS[1:0]必须同时写入 2’b00，4T清零 系统时钟
	CLKPR = 0x00;		//禁止更新 CLKPS 位	
}


