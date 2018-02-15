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
#include "led.h"
void handle_int()
{
    printf("hello irq\r\n");
    I2CIntHandle();
}




int mem_test()
{
    char str[12] = "mem_test\r\n";
    int i;
    char *addr = 0x30000000;
    for(i = 0; i < 12; i++)
        *(addr + i) = str[i];

    for (i = 0; i <= 12; i++) {
        putc(*(addr+i));
    }
    return 1;
}
void arm_main()
{
    int i;
    char *str = "abcd";
    led_init();
    led_on();

    uart0_init();
    for (i = 0; i <= 4; i++) {
        putc(*(str+i));
    }
    uprintf("%s\r\n", str);
    for (i = 0; i <= 4; i++) {
        putc(*(str+i));
    }
    mem_test();
    while(1);
}
//uprintf("%s\r\n", str);
