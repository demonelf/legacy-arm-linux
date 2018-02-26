/*
 * =====================================================================================
 *
 *       Filename:  lib.h
 *
 *    Description:  
 *
 *        Version:  1.0
 *        Created:  2018年02月24日 15时12分22秒
 *       Revision:  none
 *       Compiler:  gcc
 *
 *         Author:  YOUR NAME (), 
 *   Organization:  
 *
 * =====================================================================================
 */
#ifndef __LIB_H
#define __LIB_H

extern void delay(int n);
extern unsigned int exp16(unsigned int n);
/*把字符串转换为整数*/
/*"12345678"----->0x12345678*/
extern unsigned int atoi(char *arr);
extern char *strcpy(char * dest,const char *src);
extern int strcmp(const char * cs,const char * ct);
extern int strncmp(const char * cs,const char * ct,int count);
extern int strlen(const char * s);
extern int strnlen(const char * s, int count);
extern void * memset(void * s,int c,int count);
extern void * memcpy(void * dest,const void *src,int count);
extern int memcmp(const void *, const void *, int);

#endif




