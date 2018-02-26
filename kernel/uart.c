/*
 * =====================================================================================
 *
 *       Filename:  uart.c
 *
 *    Description:  
 *
 *        Version:  1.0
 *        Created:  2017/2/28 15:54:11
 *       Revision:  none
 *       Compiler:  gcc
 *
 *         Author:  YOUR NAME (), 
 *   Organization:  
 *
 * =====================================================================================
 */
#include <stdarg.h>
#include "s3c24xx.h"
#include "uart.h"


#define TXD0READY   (1<<2)
#define RXD0READY   (1)

#define PCLK    50000000    //init.c中的clock_init函数设置PCLK为50MHz
#define UART_CLK    PCLK    //UART0的时钟源设为PCLK
#define UART_BAUD_RATE  115200 //波特率
#define UART_BRD    ((UART_CLK/(UART_BAUD_RATE*16))-1)

/*
 *初始化UART0
 *115200,8N1,无流控
 */
void uart0_init(void)
{
    GPHCON |= 0xa0;     //GPH2、GPH3用作TXD0、RXD0
    GPHUP   = 0x0c;     //GPH2、GPH3内部上拉
    ULCON0  = 0x03;     //波特率115200,数据格式为:8个数据位,没有流控,1个校验位
    UCON0   = 0x05;     //查询方式,UART时钟源为PCLK
    UFCON0  = 0x00;     //不适用FIFO
    UMCON0  = 0x00;     //不使用流控
    UBRDIV0 = UART_BRD; //波特率为115200
}

/*
 *发送一个字符
 */
void putc(unsigned char c)
{
    /*等待,知道发送缓冲区中的数据已经全部发送出去*/
    while(!(UTRSTAT0 & TXD0READY));

    /*向UTXH0寄存器中写入数据,UART即自动将它发送出去*/
    UTXH0 = c;
}

/*
 *接收字符
 */
unsigned char getc(void)
{
    /*等待,直到接收缓冲区中有数据*/
    while(!(UTRSTAT0 & RXD0READY));

    /*直接读取URXH0寄存器,即可获得接收到的数据*/
    return URXH0;
}

void uputs(unsigned char *s)
{
    while(*s)
    {
        putc(*s); s++;
    }
}

char *ugets(char *s)
{
	char *save = s;
	char c;
	
	while((c = getc()) != '\r'){
		*s = c;
		putc(*s);	
		s++;	
	}
	
	*s = '\0';
	putc('\r');
	putc('\n');
	return save;
}


void itoa(int n, char *buf)
{
	int i;

	if(n < 10){
		buf[0] = n + '0';
		buf[1] = '\0';
		return;
	}	
	itoa(n / 10, buf);
	for(i = 0; buf[i] != '\0'; i++);
	buf[i] = n % 10 + '0';
	buf[i + 1] = '\0';
}

void xtoa(int n, char *buf)
{
	int i;
	
	if(n < 16){
		if(n < 10)
			buf[0] = n + '0';
		else
			buf[0] = n + 'a' - 10;
		buf[1] = '\0';
		return;
	}
	xtoa(n / 16, buf);
	for(i = 0; buf[i] != '\0'; i++);
	if((n % 16) < 10)
		buf[i] = (n % 16) + '0';
	else
		buf[i] = (n % 16) + 'a' - 10;
	buf[i + 1] = '\0';
}

//printf("nihaodfsdf %d %c %s %x\n", 100, 'a', "nohao", 0x100);
int uprintf(const char *fmt, ...)
{
	va_list ap;
	char c;
	int d;
	char *s;
	char buf[32];

	va_start(ap, fmt);
	while(*fmt){
		if(*fmt == '%'){
			fmt++;
			switch(*fmt){
				case 'c':
					c = va_arg(ap, int);
					putc(c);
					break;
				case 's':
					s = va_arg(ap, char *);
					uputs(s);
					break;
				case 'd':
					d = va_arg(ap, int);	
					if(d < 0){
						putc('-');
						d = -d;
					}
					itoa(d, buf);
					uputs(buf);
					break;
				case 'x':
					d = va_arg(ap, int);
					xtoa(d, buf);
					uputs(buf);
					break;
				default:
					break;
			}
		}else{
			putc(*fmt);
			if(*fmt == '\n')
				putc('\r');
		}
		fmt++;
	}	

	va_end(ap);

	return 0;
}


