/*
 * =====================================================================================
 *
 *       Filename:  irq.h
 *
 *    Description:  
 *
 *        Version:  1.0
 *        Created:  2016/9/12 14:57:27
 *       Revision:  none
 *       Compiler:  gcc
 *
 *         Author:  YOUR NAME (), 
 *   Organization:  
 *
 * =====================================================================================
 */
#define SRCPND      (*(volatile unsigned long *)0X4A000000)
#define INTMOD      (*(volatile unsigned long *)0X4A000004)
#define INTMSK      (*(volatile unsigned long *)0X4A000008) 
#define PRIORITY    (*(volatile unsigned long *)0x4A00000C)
#define INTPND      (*(volatile unsigned long *)0X4A000010)
#define INTOFFSET   (*(volatile unsigned long *)0X4A000014)

#define INTSUBMSK   (*(volatile unsigned long *)0X4A00001C)
#define SUBSRCPND   (*(volatile unsigned long *)0X4A000018)

#define WTCON       (*(volatile unsigned long *)0x53000000) 
#define WTDAT       (*(volatile unsigned long *)0x53000004)
#define WTCNT       (*(volatile unsigned long *)0x53000008)

void irq_init();
void wdt_init();
void cpsr_irq_enable();

