#A  =b 延时变量	$(A) 
#A ?=b 延时变量 不覆盖
#A :=b 立即变量
#A +=b A=a A+=b A==a b 

#安装目录
prefix	?= /home/demonelf/project/3128/mytest/dev/ias3128/bin

#环境变量
export TOPDIR BOARD ARCH CPU
TOPDIR 	 = $(shell pwd)
BOARD 	 = mini2440
ARCH  	 = arm
CP		:= /bin/cp -rf
ECHO	:= echo

#编译工具
export GCC LD OBJCOPY CFLAGS
COMPILE  = arm-linux-
AS 		 = $(COMPILE)as
GCC 	 = $(COMPILE)gcc
LD  	 = $(COMPILE)ld
OBJCOPY  = $(COMPILE)objcopy
OBJDUMP  = $(COMPILE)objdump
CFLAGS   = -nostdinc -fno-builtin -I./include -I../include -I/opt/FriendlyARM/toolschain/4.4.3/include -I /opt/FriendlyARM/toolschain/4.4.3/lib/gcc/arm-none-linux-gnueabi/4.4.3/include

#编译目标
ELF 	 = miniboot.elf
BIN		 = u-boot.bin
OBJDIR	 = $(CURDIR)/objects
OBJECTS	 = $(patsubst %.S,%.o,$(wildcard *.S ./boot/*.S)) $(patsubst %.c,%.o,$(wildcard *.c ./init/*.c)) $(patsubst %.c,%.o,$(wildcard *.c ./kernel/*.c)) $(patsubst %.c,%.o,$(wildcard *.c ./lib/*.c)) $(patsubst %.c,%.o,$(wildcard *.c ./mm/*.c)) $(patsubst %.c,%.o,$(wildcard *.c ./app/*.c)) $(patsubst %.S,%.o,$(wildcard *.S ./app/*.S)) 


#编译规则
$(BIN)	: $(ELF)
	$(OBJCOPY) -O binary $^ $@
	$(OBJDUMP) -D $^ > dump.asm

$(ELF)	: $(OBJECTS)
	$(LD) -Tminiboot.lds -o $@ $^

%.o		: %.c
	$(GCC) $(CFLAGS) -g -c $^ -o $@

%.o		: %.S
	$(GCC) $(CFLAGS) -g -c $^ -o $@

clean:
	rm $(OBJECTS) $(BIN) $(ELF)

.PHONY:install
install:
	$(CP) $(BIN) $(prefix)
	$(ECHO) INSTALL	$(BIN) $(prefix) 

