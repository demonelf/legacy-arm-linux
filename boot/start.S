.equ    MEM_CTL_BASE,   0x48000000
.equ    SDRAM_BASE,     0x30000000
.text
.global _start
#include "start.inc"
_start:
    b   Reset                   @0x00
    b   Undef                   @0x04
    b   SWI                     @0x08
    b   P_abort                 @0x0C
    b   D_abort                 @0x10
    b   Reserved                @0x14
    b   irq                     @0x18
    b   fiq

/*start code on reset*/
Reset:
    bl  set_cpu_mode             /*设置特权模式*/
    bl  turn_off_watchdog        /*关闭看门狗*/
    bl  mask_irqs                /*关闭中断*/
    bl  set_clock                /*设置时钟*/
    bl  disable_caches           /*关闭caches*/
    bl  init_sram                /*初始化sram*/
    bl  turn_on_led              /*利用led_debug*/
    bl  init_stack               /*初始化栈*/
    @bl  clean_bss                /*初始化bss*/
    @bl  nand_init               /*初始化nand*/
    @bl  copy_to_ram              /*复制自身到ram*/
    @bl  create_page_table        /*创建page_table*/
    @bl  mmu_init                 /*初始化mmu*/
    bl arm_main                  /*执行main函数*/

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
	@mov sp, #0x32000000
	sub lr, lr, #4
	stmfd sp!, {r0-r12, lr}
    @ldr lr, =int_return
	@ldr pc, =handle_int
    bl handle_int
    int_return:
	ldmfd sp!, {r0-r12, pc}^        

fiq:
        nop

/*******************reset********************/
set_cpu_mode:
    mrs r0, cpsr            /*获取cpsr*/
    bic r0, r0, #0x1f       /*清空后五位*/
    orr r0, r0, #0xd3       /*设置后五位*/
    msr cpsr, r0
    mov pc, lr

turn_off_watchdog:
    ldr r0, =WTCON
    mov r1, #0x0
    str r1, [r0]
    mov pc, lr

turn_on_led:
    LDR R0,=0x56000010      @ R0设为GPBCON寄存器。此寄存器
    MOV R1,#0x00000400        
    STR R1,[R0]             @ 设置GPB5为输出口, 位[10:9]=0b01
    LDR R0,=0x56000014      @ R0设为GPBDAT寄存器。此寄存器
    MOV R1,#0x00000000      @ 此值改为0x00000020,
    STR R1,[R0]             @ GPB5输出0，LED1点亮
    @b turn_on_led
    mov pc, lr

mask_irqs:
    mov r0, #0
    ldr r1, =0x4a000008
    str r0, [r1]
    mov pc, lr

set_clock:
    /*FCLK:HCLK:PCLK = 1:4:8*/
    ldr r0, =CLKDIVN
    mov r1, #0x5
    str r1, [r0]
    mrc p15, 0, r0,c1,c0,0
    orr r0,r0,#0xc0000000
    mcr p15,0,r0,c1,c0,0
    /*FCLK = 405MHZ*/
    ldr r0, =MPLLCON
    ldr r1, =MPLL_405M
    str r1, [r0]
    mov pc, lr

disable_caches:
    /*******flush I/Dcaches and mmu*****/
    mcr p15, 0, r0, c7, c7, 0
    mrc p15, 0, r0, c1, c0, 0
    bic r0, r0, #0x00000007 
    mcr p15, 0, r0, c1, c0, 0
    mov pc, lr

init_sram:
    @设置存储控制器以便使用SDRAM等外设
    mov r1, #MEM_CTL_BASE
    adrl r2, mem_cfg_val
    add r3, r1, #52
1:
    ldr r4, [r2], #4
    str r4, [r1], #4
    cmp r1, r3
    bne 1b
    mov pc, lr

nand_init:            /*初始化nand*/

init_stack:           /*初始化栈*/
    msr cpsr_c, #0xd2
    ldr sp, =0x33000000 /**R13_irq**/
    msr cpsr_c, #0xd3
    ldr sp, =0x34000000 /**R13_svc**/
    mov pc, lr

clean_bss:            /*初始化bss*/

copy_to_ram:          /*复制自身到ram*/

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

