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

void led_init()
{
    GPBCON = (1<<10)|(1<<12)|(1<<14)|(1<<16);
    GPBDAT = 0xffffffff;
}

int led_on()
{
     GPBDAT = 0xa<<5; 	
}

void led_off()
{
    GPBDAT = 0xffffffff;	
}


