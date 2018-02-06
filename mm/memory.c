/*
 * =====================================================================================
 *
 *       Filename:  memory.c
 *
 *    Description:  
 *
 *        Version:  1.0
 *        Created:  2018年01月23日 16时41分03秒
 *       Revision:  none
 *       Compiler:  gcc
 *
 *         Author:  YOUR NAME (), 
 *   Organization:  
 *
 * =====================================================================================
 */

/* these are not to be changed without changing head.s etc */
/* 下面定义若需要改动，则需要与head.s 等文件中的相关信息一起改变 */
/* linux 0.11 内核默认支持的最大内存容量是16M，可以修改这些定义以适合更多的内存。	*/
#define LOW_MEM 0x100000					/* 内存低端（1MB）。	*/
#define PAGING_MEMORY (63*1024*1024)		/* 分页内存15MB。主内存区最多15M。	*/
#define PAGING_PAGES (PAGING_MEMORY>>20)	/* 分页后的物理内存页数。	*/
#define MAP_NR(addr) (((addr)-LOW_MEM)>>20)	/* 指定内存地址映射为页号。	*/
#define USED 100							/* 页面被占用标志，参见405 行。	*/
/* CODE_SPACE(addr) ((((addr)+0xfff)&~0xfff) < current->start_code + current->end_code)。	*/
/* 该宏用于判断给定线性地址是否位于当前进程的代码段中，“（Gaddr）+4095}&~4095y”用于
 * 取得线性地址addr所在内存页面的末端地址。参见252行。*/
#define CODE_SPACE(addr) ((((addr)+4095)&~4095) < \
current->start_code + current->end_code)

static long HIGH_MEMORY = 0;				/* 全局变量，存放实际物理内存最高端地址。	*/
/* 复制1 页内存（4K 字节）。	*/
#define copy_page(from,to) \
__asm__( "cld ; rep ; movsl":: "S" (from), "D" (to), "c" (1024): "cx", "di", "si")
/* 物理内存映射字节图（1字节代表1页内存）。每个页面对应的字节用于标志页面当前被引用
 * (占用)次数。它最大可以映射15Mb的内存空间。在初始化函数mem—init()中，对于不能用
 * 作主内存区页面的位置均都预先被设置成USED(IOO)。
*/
static unsigned char mem_map[PAGING_PAGES] = { 0, };
/*
* Get physical address of first (actually last :-) free page, and mark it
* used. If no free pages left, return 0.
*/
/* 获取首个(实际上是最后1 个:-)空闲页面，并标记为已使用。如果没有空闲页面，就返回0。*/

/* 取空闲页面。如果已经没有可用内存了，则返回0。
 * 在主内存区中取空闲物理页面。如果已经没有可用物理内存页面，则返回0。
 * 输入：%l(ax=0) - 0;
 * %2(LOW—MEM)内存字节位图管理的起始位置；
 * %3(cx= PAGING—PAGES);
 * %4(edi=mem—map+PAGING—PAGES-l)。
 * 输出：返回%0(3义=物理页面起始地址)。
 * 上面%4寄存器实际指向mem—map□内存字节位图的最后一个字节。本函数从位图末端开始向
 * 前扫描所有页面标志（页面总数为PAGING—PAGES），若有页面空闲（内存位图字节为0）则
 * 返回页面地址。注意！本函数只是指出在主内存区的一页空闲物理页面，但并没有映射到某
 * 个进程的地址空间中去。后面的put—pageO函数即用于把指定页面映射到某个进程的地址
 * 空间中。当然对于内核使用本函数并不需要再使用put—pageO进行映射，因为内核代码和
 * 数据空间（16MB）已经对等地映射到物理地址空间。
 * 第65行定义了一个局部寄存器变量。该变量将被保存在eax寄存器中，以便于高效访问和
 * 操作。这种定义变量的方法主要用于内嵌汇编程序中。详细说明参见gcc手册“在指定寄存
 * 器中的变量”。
 */

unsigned long get_free_page(void)
{
	register unsigned long __res asm("ax");

	__asm__("std ; repne ; scasb\n\t"
			"jne 1f\n\t"
			"movb $1,1(%%edi)\n\t"
			"sall $12,%%ecx\n\t"
			"addl %2,%%ecx\n\t"
			"movl %%ecx,%%edx\n\t"
			"movl $1024,%%ecx\n\t"
			"leal 4092(%%edx),%%edi\n\t"
			"rep ; stosl\n\t"
			"movl %%edx,%%eax\n"
			"1:"
			:"=a" (__res)
			:"0" (0),"i" (LOW_MEM),"c" (PAGING_PAGES),
			"D" (mem_map+PAGING_PAGES-1)
			:"di","cx","dx");
	return __res;							/* 返回空闲页面地址（如果无空闲也则返回0）。	*/
}
/* 方向位置位，将al(0)与对应每个页面的(di)内容比较，	*/
/* 如果没有等于0 的字节，则跳转结束（返回0）。	*/
/* 将对应页面的内存映像位置1。	*/
/* 页面数*4K = 相对页面起始地址。	*/
/* 再加上低端内存地址，即获得页面实际物理起始地址。	*/
/* 将页面实际起始地址?edx 寄存器。	*/
/* 寄存器ecx 置计数值1024。	*/
/* 将4092+edx 的位置?edi(该页面的末端)。	*/
/* 将edi 所指内存清零（反方向，也即将该页面清零）。	*/
/* 将页面起始地址?eax（返回值）。	*/

/*
* Free a page of memory at physical address 'addr'. Used by
* 'free_page_tables()'
*/
/*
* 释放物理地址'addr'开始的一页内存。用于函数'free_page_tables()'。
*/
/* 释放物理地址addr 开始的一页面内存。	*/
/* 物理地址1MB以下的内存空间用于内核程序和缓冲，不作为分配页面的内存空间。因此
 * 参数addr需要大于1MB。*/
void free_page (unsigned long addr)
{
/* 首先判断参数给定的物理地址addr的合理性。如果物理地址addr小于内存低端（1MB），
 * 则表示在内核程序或高速缓冲中，对此不予处理。如果物理地址addr >=系统所含物理
 * 内存最高端，则显示出错信息并且内核停止工作。
 */
	if (addr < LOW_MEM)
		return;							/* 如果物理地址addr 小于内存低端（1MB），则返回。	*/
	if (addr >= HIGH_MEMORY)			/* 如果物理地址addr>=内存最高端，则显示出错信息。	*/
		panic ("trying to free nonexistent page");
/* 如果对参数addr验证通过，那么就根据这个物理地址换算出从内存低端开始计起的内存
 * 页面号。页面号=(addr - L0w—MEM)/4096。可见页面号从0号开始计起。此时addr
 * 中存放着页面号。如果该页面号对应的页面映射字节不等于0，则减1返回。此时该映射
 * 字节值应该为0，表示页面已释放。如果对应页面字节原本就是0，表示该物理页面本来
 * 就是空闲的，说明内核代码出问题。于是显示出错信息并停机。
 */
	addr -= LOW_MEM;					/* 物理地址减去低端内存位置，再除以4KB，得页面号。	*/
	addr >>= 12;
	if (mem_map[addr]--)
		return;							/* 如果对应内存页面映射字节不等于0，则减1 返回。	*/
	mem_map[addr] = 0;					/* 否则置对应页面映射字节为0，并显示出错信息，死机。	*/
	panic ("trying to free free page");
}

/*
* Get physical address of first (actually last :-) free page, and mark it
* used. If no free pages left, return 0.
*/
/* 获取首个(实际上是最后1 个:-)空闲页面，并标记为已使用。如果没有空闲页面，就返回0。*/

/* 取空闲页面。如果已经没有可用内存了，则返回0。
 * 在主内存区中取空闲物理页面。如果已经没有可用物理内存页面，则返回0。
 * 输入：%l(ax=0) - 0;
 * %2(LOW—MEM)内存字节位图管理的起始位置；
 * %3(cx= PAGING—PAGES);
 * %4(edi=mem—map+PAGING—PAGES-l)。
 * 输出：返回%0(3义=物理页面起始地址)。
 * 上面%4寄存器实际指向mem—map□内存字节位图的最后一个字节。本函数从位图末端开始向
 * 前扫描所有页面标志（页面总数为PAGING—PAGES），若有页面空闲（内存位图字节为0）则
 * 返回页面地址。注意！本函数只是指出在主内存区的一页空闲物理页面，但并没有映射到某
 * 个进程的地址空间中去。后面的put—pageO函数即用于把指定页面映射到某个进程的地址
 * 空间中。当然对于内核使用本函数并不需要再使用put—pageO进行映射，因为内核代码和
 * 数据空间（16MB）已经对等地映射到物理地址空间。
 * 第65行定义了一个局部寄存器变量。该变量将被保存在eax寄存器中，以便于高效访问和
 * 操作。这种定义变量的方法主要用于内嵌汇编程序中。详细说明参见gcc手册“在指定寄存
 * 器中的变量”。
 */


/* 物理内存管理初始化。
 * 该函数对1MB以上内存区域以页面为单位进行管理前的初始化设置工作。一个页面长度为
 * 4KB字节。该函数把1MB以上所有物理内存划分成一个个页面，并使用一个页面映射字节
 * 数组mem—map[]来管理所有这些页面。对于具有16MB内存容量的机器，该数组共有3840
 * 项（（16MB - 1MB）/4KB），即可管理3840个物理页面。每当一个物理内存页面被占用时就
 * 把mem—map□中对应的的字节值增1;若释放一个物理页面，就把对应字节值减1。若字
 * 节值为0，则表示对应页面空闲；若字节值大于或等于1，则表示对应页面被占用或被不
 * 同程序共享占用。
 * 在该版本的Linux内核中，最多能管理16MB的物理内存，大于16MB的内存将弃置不用。
 * 对于具有16MB内存的PC机系统，在没有设置虚拟盘RAMDISK的情况下start—mem通常
 * 是4MB，end—mem是16MB。因此此时主内存区范围是4MB—16MB，共有3072个_理页面可
 * 供分配。而范围0 - 1MB内存空间用于内核系统（其实内核只使用0 —640Kb，剩下的部
 * 分被部分高速缓冲和设备内存占用）。
 * 参数start—mem是可用作页面分配的主内存区起始地址（已去除RAMDISK所占内存空间）。
 * end—mem是实际物理内存最大地址。而地址范围start_mem到end_mem是主内存区。
 */
void
mem_init (long start_mem, long end_mem)
{
	int i;
/* 首先将1MB到16MB范围内所有内存页面对应的内存映射字节数组项置为已占用状态，即各
 * 项字节值全部设置成 USED(100)?PAGING—PAGES 被定义为(PAGING—MEM0RY>>12)，即 1MB 
 * 以上所有物理内存分页后的内存页面数（15MB/4KB = 3840）。
 */
	HIGH_MEMORY = end_mem;				/* 设置内存最高端。	*/
	for (i = 0; i < PAGING_PAGES; i++)	/* 首先置所有页面为已占用(USED=100)状态，	*/
		mem_map[i] = USED;				/* 即将页面映射数组全置成USED。	*/
/* 然后计算主内存区起始内存处页面对应内存映射字节数组中项号i和主内存区
 * 页面数。此时mem—map[]数组的第i项正对应主内存区中第1个页面。最后将主内存区中
 * 页面对应的数组项清零（表示空闲）。对于具有16MB物理内存的系统，mem—map[]中对应
 * 4Mb—16Mb主内存区的项被清零。
 */
	i = MAP_NR (start_mem);				/* 然后计算可使用起始内存的页面号。	*/
	end_mem -= start_mem;				/* 再计算可分页处理的内存块大小。	*/
	end_mem >>= 12;						/* 从而计算出可用于分页处理的页面数。	*/
	while (end_mem-- > 0)				/* 最后将这些可用页面对应的页面映射数组清零。	*/
		mem_map[i++] = 0;
}


