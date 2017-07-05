/*
 * =====================================================================================
 *
 *       Filename:  iic.h
 *
 *    Description:  
 *
 *        Version:  1.0
 *        Created:  2016/9/13 15:04:13
 *       Revision:  none
 *       Compiler:  gcc
 *
 *         Author:  YOUR NAME (), 
 *   Organization:  
 *
 * =====================================================================================
 */

#define GPECON  (* (volatile unsigned long *)0x56000040) 
#define GPEDAT  (* (volatile unsigned long *)0x56000044)
#define GPEUP   (* (volatile unsigned long *)0x56000048)

#define IICCON  (* (volatile unsigned long *)0x54000000) 
#define IICSTAT (* (volatile unsigned long *)0x54000004)
#define IICADD  (* (volatile unsigned long *)0x54000008)
#define IICDS   (* (volatile unsigned long *)0x5400000C)

#define WRDATA      (1)
#define RDDATA      (2)
#define BIT_IIC		(0x1<<27)
void i2c_write(unsigned int slvAddr, unsigned char *buf, int len);
void i2c_read(unsigned int slvAddr, unsigned char *buf, int len);

typedef struct tI2C {
    unsigned char *pData;   /* 数据缓冲区 */
    volatile int DataCount; /* 等待传输的数据长度 */
    volatile int Status;    /* 状态 */
    volatile int Mode;      /* 模式：读/写 */
    volatile int Pt;        /* pData中待传输数据的位置 */
}tS3C24xx_I2C, *ptS3C24xx_I2C;

