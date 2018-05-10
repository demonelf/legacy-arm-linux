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
#include "sched.h"

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
void init()
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

/*
 * This is set up by the setup-routine at boot-time
 */
//#define EXT_MEM_K (*(unsigned short *)0x90002)
#define EXT_MEM_K (64 * 1024)
#define DRIVE_INFO (*(struct drive_info *)0x90080)
#define ORIG_ROOT_DEV (*(unsigned short *)0x901FC)


static long memory_end = 0;
static long buffer_memory_end = 0;
static long main_memory_start = 0;

unsigned int register pc asm("pc");

void main(void)	
{
	memory_end = (1<<20) + (EXT_MEM_K<<10);
	memory_end &= 0xfffff000;
	if (memory_end > 16*1024*1024)
		memory_end = 16*1024*1024;
	if (memory_end > 12*1024*1024) 
		buffer_memory_end = 4*1024*1024;
	else if (memory_end > 6*1024*1024)
		buffer_memory_end = 2*1024*1024;
	else
		buffer_memory_end = 1*1024*1024;
	main_memory_start = buffer_memory_end;
#ifdef RAMDISK
	main_memory_start += rd_init(main_memory_start, RAMDISK*1024);
#endif
	mem_init(main_memory_start,memory_end);
	trap_init();
    led_init();
    uart0_init();
    while(1)
        uprintf("PC:%x uart init\n", pc);

#if 0
	blk_dev_init();
	chr_dev_init();
	tty_init();
	time_init();
#endif

	sched_init();

#if 0
	buffer_init(buffer_memory_end);
	hd_init();
	floppy_init();
	sti();
	move_to_user_mode();
	if (!fork()) {		/* we count on this going ok */
		init();
	}
	for(;;) pause();
#endif
    init();
}
