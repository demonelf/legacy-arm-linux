/*
 * =====================================================================================
 *
 *       Filename:  sched.c
 *
 *    Description:  
 *
 *        Version:  1.0
 *        Created:  2018年03月01日 13时13分22秒
 *       Revision:  none
 *       Compiler:  gcc
 *
 *         Author:  YOUR NAME (), 
 *   Organization:  
 *
 * =====================================================================================
 */

void create_kernel_table(unsigned long virtuladdr)
{
/* 
 * 用于段描述符的一些宏定义
 */ 
#define MMU_FULL_ACCESS     (3 << 10)   /* 访问权限 */
#define MMU_DOMAIN          (0 << 5)    /* 属于哪个域 */
#define MMU_SPECIAL         (1 << 4)    /* 必须是1 */
#define MMU_CACHEABLE       (1 << 3)    /* cacheable */
#define MMU_BUFFERABLE      (1 << 2)    /* bufferable */
#define MMU_SECTION         (2)         /* 表示这是段描述符 */
#define MMU_SECDESC         (MMU_FULL_ACCESS | MMU_DOMAIN | MMU_SPECIAL | \
                             MMU_SECTION)
#define MMU_SECDESC_WB      (MMU_FULL_ACCESS | MMU_DOMAIN | MMU_SPECIAL | \
                             MMU_CACHEABLE | MMU_BUFFERABLE | MMU_SECTION)
#define MMU_SECTION_SIZE    0x00100000

    unsigned long physicaladdr;
    unsigned long *mmu_tlb_base = (unsigned long *)0x60000000;
    
    //内核空间 1M
    physicaladdr = 0x30008000;
    *(mmu_tlb_base + (virtuladdr >> 20)) = (physicaladdr & 0xFFF00000) | \
                                            MMU_SECDESC_WB;
}

void load_app(unsigned int pid)
{
#if 0
    if(pid == 1)
        nand_to_ram(app1(), 0x00300000, 0x00100000); //1M
    else
        nand_to_ram(app2(), 0x00300000, 0x00100000); //1M
#endif
}

void create_app_table(unsigned int pid)
{
/* 
 * 用于段描述符的一些宏定义
 */ 
#define MMU_FULL_ACCESS     (3 << 10)   /* 访问权限 */
#define MMU_DOMAIN          (0 << 5)    /* 属于哪个域 */
#define MMU_SPECIAL         (1 << 4)    /* 必须是1 */
#define MMU_CACHEABLE       (1 << 3)    /* cacheable */
#define MMU_BUFFERABLE      (1 << 2)    /* bufferable */
#define MMU_SECTION         (2)         /* 表示这是段描述符 */
#define MMU_SECDESC         (MMU_FULL_ACCESS | MMU_DOMAIN | MMU_SPECIAL | \
                             MMU_SECTION)
#define MMU_SECDESC_WB      (MMU_FULL_ACCESS | MMU_DOMAIN | MMU_SPECIAL | \
                             MMU_CACHEABLE | MMU_BUFFERABLE | MMU_SECTION)
#define MMU_SECTION_SIZE    0x00100000

    unsigned long physicaladdr;
    unsigned long appaddr;
    unsigned long *mmu_tlb_base = (unsigned long *)0x60000000;
    

    //任务空间 32M - 1M (也就映射app 3M位置 1M大小
    if(pid == 1)
        appaddr = app1();
    else
        appaddr = app2();
    physicaladdr = 0x2380 + 0x30008000;
    *(mmu_tlb_base + (0x00300000 >> 20)) = (physicaladdr & 0xFFF00000) | \
                                           MMU_SECDESC_WB;
}


/*
 * 1. 映射内核空间到应用空间
 * 2. 设置pid后跳到_start
 */
void run_pid(unsigned int pid)
{
    create_kernel_table(pid * 0x02000000);
    /*加载任务*/
    create_app_table(pid);

    /*pid * 32M 切换到任务空间*/
    __asm__(
            "mov r0, %0\n"
            "mcr p15,0,r0,c13,c0,0\n"    //R0的值写入(p15->c13)中？
            //"mrc p15,0,R1,c13,c0,0\n"  //(p15->c13)中的值读入R1中？
            : /* 无输出 */
            : "r" (pid));
    /*执行任务*/
    __asm__(
            "bl _ld_start"
            : /* 无输出 */
            : "r" (pid));
}

void sched_init()
{
    while(1)
    {
        run_pid(1);
        delay(1);
        run_pid(2);
    }
}
