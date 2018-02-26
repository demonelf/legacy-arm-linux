/*
 * =====================================================================================
 *
 *       Filename:  led.c
 *
 *    Description:  
 *
 *        Version:  1.0
 *        Created:  2018年02月01日 14时02分34秒
 *       Revision:  none
 *       Compiler:  gcc
 *
 *         Author:  YOUR NAME (), 
 *   Organization:  
 *
 * =====================================================================================
 */

#define GPBCON    (*((volatile unsigned long*)0x56000010))
#define GPBDAT    (*((volatile unsigned long*)0x56000014))

void beep_init(void)//蜂鸣器初始化
{

   //GPBCON = 0x2;      // 设置GPB0为TOU0模式
   //GPBUP |=(1<<0);    //禁止GPB0上拉功能
   GPBCON &= ~(0x3<<0);
   GPBCON |= (0x1<<0);  
}

/*************************************************  
Description     : 运行蜂鸣器  
**************************************************/  
void beep_run(void)  
{  
    GPBDAT |= (0x1<<0);   
    //delay(50);  
    GPBDAT &= (0x0<<0);  
    //delay(50);  
}  

void led_init()
{
    GPBCON = (1<<10)|(1<<12)|(1<<14)|(1<<16);
    GPBDAT = 0xffffffff;
    //beep_init();
    //beep_run();
}

int led_on()
{
     GPBDAT = 0xa<<5; 	
}

void led_off()
{
    GPBDAT = 0xffffffff;	
}


