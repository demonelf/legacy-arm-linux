/*
 * =====================================================================================
 *
 *       Filename:  gdt.c
 *
 *    Description:  
 *
 *        Version:  1.0
 *        Created:  2017/6/30 14:18:58
 *       Revision:  none
 *       Compiler:  gcc
 *
 *         Author:  YOUR NAME (), 
 *   Organization:  
 *
 * =====================================================================================
 */

/*
 * 设置页表
 */
void create_page_table(void)
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

    unsigned long virtuladdr, physicaladdr;
    unsigned long *mmu_tlb_base = (unsigned long *)0x30000000;
    
    //内核空间 1M
    virtuladdr = 0;
    physicaladdr = 0x31000000;
    //physicaladdr = 0x30008000;
    *(mmu_tlb_base + (virtuladdr >> 20)) = (physicaladdr & 0xFFF00000) | \
                                            MMU_SECDESC_WB;

#if 1
    /*
     * 0x56000000是GPIO寄存器的起始物理地址，
     * GPBCON和GPBDAT这两个寄存器的物理地址0x56000010、0x56000014，
     * 为了在第二部分程序中能以地址0xA0000010、0xA0000014来操作GPBCON、GPBDAT，
     * 把从0xA0000000开始的1M虚拟地址空间映射到从0x56000000开始的1M物理地址空间
     */
    virtuladdr = 0x56000000;
    physicaladdr = 0x56000000;
    *(mmu_tlb_base + (virtuladdr >> 20)) = (physicaladdr & 0xFFF00000) | \
                                            MMU_SECDESC;
    /*uart*/
    virtuladdr = 0x50000000;
    physicaladdr = 0x50000000;
    *(mmu_tlb_base + (virtuladdr >> 20)) = (physicaladdr & 0xFFF00000) | \
                                            MMU_SECDESC;
#endif

#if 0
    /*mmu_table_addr*/
    virtuladdr = 0x60000000;
    physicaladdr = 0x30000000;
    *(mmu_tlb_base + (virtuladdr >> 20)) = (physicaladdr & 0xFFF00000) | \
                                            MMU_SECDESC;
#endif

#if 0
    /*
     * 0x56000000是GPIO寄存器的起始物理地址，
     * GPBCON和GPBDAT这两个寄存器的物理地址0x56000010、0x56000014，
     * 为了在第二部分程序中能以地址0xA0000010、0xA0000014来操作GPBCON、GPBDAT，
     * 把从0xA0000000开始的1M虚拟地址空间映射到从0x56000000开始的1M物理地址空间
     */
    virtuladdr = 0xA0000000;
    physicaladdr = 0x56000000;
    *(mmu_tlb_base + (virtuladdr >> 20)) = (physicaladdr & 0xFFF00000) | \
                                            MMU_SECDESC;

    /*
     * SDRAM的物理地址范围是0x30000000～0x33FFFFFF，
     * 将虚拟地址0xB0000000～0xB3FFFFFF映射到物理地址0x30000000～0x33FFFFFF上，
     * 总共64M，涉及64个段描述符
     */
    virtuladdr = 0xB0000000;
    physicaladdr = 0x30000000;
    while (virtuladdr < 0xB4000000)
    {
        *(mmu_tlb_base + (virtuladdr >> 20)) = (physicaladdr & 0xFFF00000) | \
                                                MMU_SECDESC_WB;
        virtuladdr += 0x100000;
        physicaladdr += 0x100000;
    }
#endif
}

void mmu_init(void)
{
    unsigned long ttb = 0x30000000;

__asm__(
    "mov    r0, #0\n"
    "mcr    p15, 0, r0, c7, c7, 0\n"    /* 使无效ICaches和DCaches */
    
    "mcr    p15, 0, r0, c7, c10, 4\n"   /* drain write buffer on v4 */
    "mcr    p15, 0, r0, c8, c7, 0\n"    /* 使无效指令、数据TLB */
    
    "mov    r4, %0\n"                   /* r4 = 页表基址 */
    "mcr    p15, 0, r4, c2, c0, 0\n"    /* 设置页表基址寄存器 */
    
    "mvn    r0, #0\n"                   
    "mcr    p15, 0, r0, c3, c0, 0\n"    /* 域访问控制寄存器设为0xFFFFFFFF，
                                         * 不进行权限检查 
                                         */    
    /* 
     * 对于控制寄存器，先读出其值，在这基础上修改感兴趣的位，
     * 然后再写入
     */
    "mrc    p15, 0, r0, c1, c0, 0\n"    /* 读出控制寄存器的值 */
    
    /* 控制寄存器的低16位含义为：.RVI ..RS  /* 域访问控制寄存 B... .CAM
     * R : 表示换出Cache中的条目时使用的算法，
     *     0 = Random replacement；1 = Round robin replacement
     * V : 表示异常向量表所在的位置，
     *     0 = Low addresses = 0x00000000；1 = High addresses = 0xFFFF0000
     * I : 0 = 关闭ICaches；1 = 开启ICaches
     * R、S : 用来与页表中的描述符一起确定内存的访问权限
     * B : 0 = CPU为小字节序；1 = CPU为大字节序
     * C : 0 = 关闭DCaches；1 = 开启DCaches
     * A : 0 = 数据访问时不进行地址对齐检查；1 = 数据访问时进行地址对齐检查
     * M : 0 = 关闭MMU；1 = 开启MMU
     */
    
    /*  
     * 先清除不需要的位，往下若需要则重新设置它们    
     */
                                        /* .RVI ..RS B... .CAM */ 
    "bic    r0, r0, #0x3000\n"          /* ..11 .... .... .... 清除V、I位 */
    "bic    r0, r0, #0x0300\n"          /* .... ..11 .... .... 清除R、S位 */
    "bic    r0, r0, #0x0087\n"          /* .... .... 1... .111 清除B/C/A/M */

    /*
     * 设置需要的位
     */
    "orr    r0, r0, #0x0002\n"          /* .... .... .... ..1. 开启对齐检查 */
    "orr    r0, r0, #0x0004\n"          /* .... .... .... .1.. 开启DCaches */
    "orr    r0, r0, #0x1000\n"          /* ...1 .... .... .... 开启ICaches */
    "orr    r0, r0, #0x0001\n"          /* .... .... .... ...1 使能MMU */
    "mcr    p15, 0, r0, c1, c0, 0\n"    /* 将修改的值写入控制寄存器 */

#if 1
    "ldr    r0, =0x31000000\n"
    "sub    r0, fp, r0\n"
    "mov    fp, r0\n"
    "ldr    r0, =0x31000000\n"
    "sub    r0, sp, r0\n"
    "mov    sp, r0\n"                   /*重设栈指针，指向1M顶端(使用虚拟地址)*/
#endif
    : /* 无输出 */
    : "r" (ttb) );
}
