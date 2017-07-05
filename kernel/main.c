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
void handle_int()
{
    printf("hello irq\r\n");
    I2CIntHandle();
}

void arm_main()
{
    int i;
    char *str = "abcd";
    uart0_init();
    uprintf("%s\r\n", str);
    for (i = 0; i <= 4; i++) {
        putc(*(str+i));
    }
    while(1);
}
    //uprintf("%s\r\n", str);
