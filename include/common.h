#ifndef __COMMON_H
#define __COMMON_H

//int (*p)(const char *, ...) = (void *)0xc7e11d70;
//p("hello p %d\n", 100);
//int printf(const char *format, ...);
//int scanf (const char *format, ...);

#define printf(...) (((int (*)(const char *, ...))0x33f963a4)(__VA_ARGS__))
#define scanf(...)  (((int (*)(const char *, ...))0x33f963a4)(__VA_ARGS__))

#define I2CIntHandle() (((void (*)())0x30008374)())
#define NULL (void *)

#endif
