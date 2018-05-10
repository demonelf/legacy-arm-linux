.text
.global _ld_start
_ld_start:
	stmfd sp!, {r0-r12, lr}
    mov lr, pc
    mov pc, #0x00300000
	//bl app_addr              //跳到3M地址
    mcr p15,0,r0,c13,c0,0      //R0的值写入(p15->c13)中？
	ldmfd sp!, {r0-r12, pc}
