/*
 * =====================================================================================
 *
 *       Filename:  main.c
 *
 *    Description:  
 *
 *        Version:  1.0
 *        Created:  2016/9/12 17:19:13
 *       Revision:  none
 *       Compiler:  gcc
 *
 *         Author:  YOUR NAME (), 
 *   Organization:  
 *
 * =====================================================================================
 */
#include "common.h"
#include "lib.h"
#include "led.h"

void shell_led(int argc, char agrv[6][16])
{
	int i, a, b;
	for(i = 0; i < 4; i++)
	{
		uprintf("i =%c : %d\n", agrv[1][i] ,atoi(&agrv[1][i]));
		if(atoi(&agrv[1][i]))
			led_on();
		else
			led_off();
	}
}
#define SHELL "[demonelf@MadHex ]# "
void shell_common(int argc, char agrv[6][16])
{
	if(!strcmp(agrv[0], "led"))
		shell_led(argc, agrv);
	else
		uprintf("cmd %s is not supported\n", agrv[0]);
}
void arm_main()
{
  	unsigned int register pc asm("pc");
	char cmd_buf[1024];
	int i = 0;
	int j = 0;
	int k = 0;
	char cmd_argv[6][16];

    led_init();
    //led_off();
    uart0_init();

    uprintf("PC:%x\n", pc);

	while(1)
	{
		uprintf(SHELL);
		ugets(cmd_buf);
		
		for(i = 0, j = 0, k = 0; cmd_buf[i] != 0; i++)	
		{
			//合法参数
			if( cmd_buf[i] !=' ' && cmd_buf[i] !='	')
			{
				cmd_argv[j][k++] = cmd_buf[i];
			}
			else if(cmd_buf[i - 1] !=' ' && cmd_buf[i - 1] !='	')
			{
				cmd_argv[j][k] = 0;
				j++;
				k = 0;
			}
			
		}
		cmd_argv[j][k] = 0;

		j += 2;
		shell_common(j, cmd_argv);
	}	

    while(1);
}

void handle_int()
{
    printf("hello irq\r\n");
    I2CIntHandle();
}

void main()
{

}
