/*
 * =====================================================================================
 *
 *       Filename:  uart.h
 *
 *    Description:  
 *
 *        Version:  1.0
 *        Created:  2017/3/1 11:44:57
 *       Revision:  none
 *       Compiler:  gcc
 *
 *         Author:  YOUR NAME (), 
 *   Organization:  
 *
 * =====================================================================================
 */

#ifndef __INCLUDE_UART_H
#define __INCLUDE_UART_H

int uprintf(const char *fmt, ...);
void uputs(unsigned char *s);
char *ugets(char *s);

#endif
