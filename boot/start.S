/*
bootsect.s  bootload
setup.s     初始化和设置中断描述符和全局描述符
head.s      做为system模块的开头
*/
.text
.global _start
/******************1. set exception vectors*******************/
_start:
    b   Reset                   @0x00
    b   Undef                   @0x04
    b   SWI                     @0x08
    b   P_abort                 @0x0C
    b   D_abort                 @0x10
    b   Reserved                @0x14
    b   irq                     @0x18
    b   fiq

Undef:
        nop

SWI:
        nop

P_abort:
        nop

D_abort:
        nop

Reserved:
        nop

irq:
	sub lr, lr, #4
	stmfd sp!, {r0-r12, lr}
    bl handle_int
    int_return:
	ldmfd sp!, {r0-r12, pc}^        

fiq:
        nop

/*************************************/
/*********start code on reset*********/
/*************************************/
Reset:
    bl  set_cpu_mode             /*设置特权模式*/
    bl  turn_off_watchdog        /*关闭看门狗*/
    bl  mask_irqs                /*关闭中断*/
    bl  set_clock                /*设置时钟*/
    bl  disable_caches           /*关闭caches*/
    bl  init_sram                /*初始化sram*/
    bl  init_stack               /*初始化栈*/
    bl  clean_bss                /*初始化bss*/
    bl  nand_init                /*初始化nand*/
    bl  copy_to_ram              /*复制自身到ram*/
    bl  create_page_table        /*创建page_table*/
    bl  mmu_init                 /*初始化mmu*/
    ldr pc, =main                /*启动main*/

set_cpu_mode:      
     /****** set to svc32 mode ******/
      mrs r0, cpsr
      bic r0, r0, #0x1f
      orr r0, r0, #0xd3
      msr cpsr, r0
      mov pc, lr

turn_off_watchdog:
     /*******turn off watchdog********/ 
#define WTCON 0x53000000
      ldr r0, =WTCON
      mov r1, #0x0
      str r1, [r0]
      mov pc, lr

mask_irqs:
     /*********mask all irqs**********/
      mvn r0, #0
      ldr r1, =0x4a000008
      str r0, [r1]
      mov pc,lr

#define CLKDIVN 0x4c000014
#define MPLLCON 0x4C000004
#define MPLL_405M ((0x7f<<12)|(2<<4)|(1<<0))
set_clock:
     /*****FCLK:HCLK:PCLK = 1:4:8*********/
      ldr r0, =CLKDIVN
      mov r1, #0x5
      str r1, [r0]
      mrc p15, 0, r0,c1,c0,0
      orr r0,r0,#0xc0000000
      mcr p15,0,r0,c1,c0,0
     /*******FCLK = 405MHZ************/
      ldr r0, =MPLLCON
      ldr r1, =MPLL_405M
      str r1, [r0]
      mov pc, lr

disable_caches:
      /*******flush I/Dcaches and mmu*****/
      mcr p15, 0, r0, c7, c7,0
      mrc p15, 0, r0, c1, c0,0
      bic r0, r0,#0x00000007 
      mcr p15, 0, r0, c1,c0, 0
      mov pc, lr
 
init_sram:  /*stepping 4K 0x30000000 ~ 0x37FFFFFF (7FFFFFF+1)*8/1000/1000 =64MB*/
#define MEM_CTL_BASE   #0x48000000
    @设置存储控制器以便使用SDRAM等外设
    mov r1, MEM_CTL_BASE
    adrl r2, mem_cfg_val
    add r3, r1, #52
1:
    ldr r4, [r2], #4
    str r4, [r1], #4
    cmp r1, r3
    bne 1b
    mov pc, lr

.align 4
mem_cfg_val:
    @存储控制器13个寄存器的设置值
    .long 0x22011110    @ BWSCON
    .long 0x00000700    @ BANKCON0
    .long 0x00000700    @ BANKCON1
    .long 0x00000700    @ BANKCON2
    .long 0x00000700    @ BANKCON3
    .long 0x00000700    @ BANKCON4
    .long 0x00000700    @ BANKCON5
    .long 0x00018005    @ BANKCON6
    .long 0x00018005    @ BANKCON7
    .long 0x008c04EC    @ REFRESH   R_CNT = 2^11 + 1 - (405 / 4)*7.8125 =1259.9375 = 0x4EC   2^11 + 1 - 12*7.8125 = 1955.2500 = 0x7A3
    .long 0x000000B1    @ BANKSIZE
    .long 0x00000030    @ MRSRB6
    .long 0x00000030    @ MRSRB7
copy_to_ram:
      /*0x30008000 0x8000=32k */
      /*0~0x4000存放Bootloader传递到Kernel的参数，
      /*0x4000~0x8000存放主页表*/
      /*PGD（arm页表项4byte，映射1M地址空间，4G空间大小需要4096个页表项，所以16k = 4byte * 4096）*/
      /*******copy datas to sdram from stepping stone*****/
      mov r0, #0
      //ldr r1, =_start
      ldr r1, =0x31000000
      ldr r2, =bss_end
      //sub r2, r2,r1
      mov ip, lr
      bl nand_to_ram
      mov lr,ip
      mov pc, lr
init_stack:
      /********initializing stack*********/
      //msr cpsr_c, #0xd2
      //ldr sp, =0x33000000 /**R13_irq**/
      msr cpsr_c, #0xd3
      //ldr sp, =0x34000000 /**R13_svc**/
      ldr sp, =(0x31000000 + 0x00010000) /**R13_svc**/
      mov pc, lr

 clean_bss:
      /********clearing bss section**********/
      ldr r0, =bss_start
      ldr r1, =bss_end
      cmp r0, r1
      moveq pc, lr
      
      clean_loop:
      mov r2, #0
      str r2, [r0], #4
      cmp r0, r1
      bne clean_loop
      mov pc, lr

