
miniboot.elf:     file format elf32-littlearm


Disassembly of section .text:

30008000 <_start>:
30008000:	ea000010 	b	30008048 <Reset>
30008004:	ea000005 	b	30008020 <Undef>
30008008:	ea000005 	b	30008024 <SWI>
3000800c:	ea000005 	b	30008028 <P_abort>
30008010:	ea000005 	b	3000802c <D_abort>
30008014:	ea000005 	b	30008030 <Reserved>
30008018:	ea000005 	b	30008034 <irq>
3000801c:	ea000008 	b	30008044 <fiq>

30008020 <Undef>:
30008020:	e1a00000 	nop			; (mov r0, r0)

30008024 <SWI>:
30008024:	e1a00000 	nop			; (mov r0, r0)

30008028 <P_abort>:
30008028:	e1a00000 	nop			; (mov r0, r0)

3000802c <D_abort>:
3000802c:	e1a00000 	nop			; (mov r0, r0)

30008030 <Reserved>:
30008030:	e1a00000 	nop			; (mov r0, r0)

30008034 <irq>:
30008034:	e24ee004 	sub	lr, lr, #4
30008038:	e92d5fff 	push	{r0, r1, r2, r3, r4, r5, r6, r7, r8, r9, sl, fp, ip, lr}
3000803c:	eb00012a 	bl	300084ec <handle_int>

30008040 <int_return>:
30008040:	e8fd9fff 	ldm	sp!, {r0, r1, r2, r3, r4, r5, r6, r7, r8, r9, sl, fp, ip, pc}^

30008044 <fiq>:
30008044:	e1a00000 	nop			; (mov r0, r0)

30008048 <Reset>:
30008048:	eb000009 	bl	30008074 <set_cpu_mode>
3000804c:	eb00000d 	bl	30008088 <turn_off_watchdog>
30008050:	eb000010 	bl	30008098 <mask_irqs>
30008054:	eb000013 	bl	300080a8 <set_clock>
30008058:	eb00001c 	bl	300080d0 <disable_caches>
3000805c:	eb000020 	bl	300080e4 <init_sram>
30008060:	eb00003f 	bl	30008164 <init_stack>
30008064:	eb000043 	bl	30008178 <clean_bss>
30008068:	eb000185 	bl	30008684 <nand_init>
3000806c:	eb000034 	bl	30008144 <copy_to_ram>
30008070:	e59ff124 	ldr	pc, [pc, #292]	; 3000819c <clean_loop+0x14>

30008074 <set_cpu_mode>:
30008074:	e10f0000 	mrs	r0, CPSR
30008078:	e3c0001f 	bic	r0, r0, #31
3000807c:	e38000d3 	orr	r0, r0, #211	; 0xd3
30008080:	e129f000 	msr	CPSR_fc, r0
30008084:	e1a0f00e 	mov	pc, lr

30008088 <turn_off_watchdog>:
30008088:	e3a00453 	mov	r0, #1392508928	; 0x53000000
3000808c:	e3a01000 	mov	r1, #0
30008090:	e5801000 	str	r1, [r0]
30008094:	e1a0f00e 	mov	pc, lr

30008098 <mask_irqs>:
30008098:	e3e00000 	mvn	r0, #0
3000809c:	e59f10fc 	ldr	r1, [pc, #252]	; 300081a0 <clean_loop+0x18>
300080a0:	e5810000 	str	r0, [r1]
300080a4:	e1a0f00e 	mov	pc, lr

300080a8 <set_clock>:
300080a8:	e59f00f4 	ldr	r0, [pc, #244]	; 300081a4 <clean_loop+0x1c>
300080ac:	e3a01005 	mov	r1, #5
300080b0:	e5801000 	str	r1, [r0]
300080b4:	ee110f10 	mrc	15, 0, r0, cr1, cr0, {0}
300080b8:	e3800103 	orr	r0, r0, #-1073741824	; 0xc0000000
300080bc:	ee010f10 	mcr	15, 0, r0, cr1, cr0, {0}
300080c0:	e59f00e0 	ldr	r0, [pc, #224]	; 300081a8 <clean_loop+0x20>
300080c4:	e59f10e0 	ldr	r1, [pc, #224]	; 300081ac <clean_loop+0x24>
300080c8:	e5801000 	str	r1, [r0]
300080cc:	e1a0f00e 	mov	pc, lr

300080d0 <disable_caches>:
300080d0:	ee070f17 	mcr	15, 0, r0, cr7, cr7, {0}
300080d4:	ee110f10 	mrc	15, 0, r0, cr1, cr0, {0}
300080d8:	e3c00007 	bic	r0, r0, #7
300080dc:	ee010f10 	mcr	15, 0, r0, cr1, cr0, {0}
300080e0:	e1a0f00e 	mov	pc, lr

300080e4 <init_sram>:
300080e4:	e3a01312 	mov	r1, #1207959552	; 0x48000000
300080e8:	e28f2020 	add	r2, pc, #32
300080ec:	e1a00000 	nop			; (mov r0, r0)
300080f0:	e2813034 	add	r3, r1, #52	; 0x34
300080f4:	e4924004 	ldr	r4, [r2], #4
300080f8:	e4814004 	str	r4, [r1], #4
300080fc:	e1510003 	cmp	r1, r3
30008100:	1afffffb 	bne	300080f4 <init_sram+0x10>
30008104:	e1a0f00e 	mov	pc, lr
30008108:	e1a00000 	nop			; (mov r0, r0)
3000810c:	e1a00000 	nop			; (mov r0, r0)

30008110 <mem_cfg_val>:
30008110:	22011110 	andcs	r1, r1, #4
30008114:	00000700 	andeq	r0, r0, r0, lsl #14
30008118:	00000700 	andeq	r0, r0, r0, lsl #14
3000811c:	00000700 	andeq	r0, r0, r0, lsl #14
30008120:	00000700 	andeq	r0, r0, r0, lsl #14
30008124:	00000700 	andeq	r0, r0, r0, lsl #14
30008128:	00000700 	andeq	r0, r0, r0, lsl #14
3000812c:	00018005 	andeq	r8, r1, r5
30008130:	00018005 	andeq	r8, r1, r5
30008134:	008c04ec 	addeq	r0, ip, ip, ror #9
30008138:	000000b1 	strheq	r0, [r0], -r1
3000813c:	00000030 	andeq	r0, r0, r0, lsr r0
30008140:	00000030 	andeq	r0, r0, r0, lsr r0

30008144 <copy_to_ram>:
30008144:	e3a00000 	mov	r0, #0
30008148:	e59f1060 	ldr	r1, [pc, #96]	; 300081b0 <clean_loop+0x28>
3000814c:	e59f2060 	ldr	r2, [pc, #96]	; 300081b4 <clean_loop+0x2c>
30008150:	e0422001 	sub	r2, r2, r1
30008154:	e1a0c00e 	mov	ip, lr
30008158:	eb0001ce 	bl	30008898 <nand_to_ram>
3000815c:	e1a0e00c 	mov	lr, ip
30008160:	e1a0f00e 	mov	pc, lr

30008164 <init_stack>:
30008164:	e321f0d2 	msr	CPSR_c, #210	; 0xd2
30008168:	e3a0d433 	mov	sp, #855638016	; 0x33000000
3000816c:	e321f0d3 	msr	CPSR_c, #211	; 0xd3
30008170:	e3a0d30d 	mov	sp, #872415232	; 0x34000000
30008174:	e1a0f00e 	mov	pc, lr

30008178 <clean_bss>:
30008178:	e59f0038 	ldr	r0, [pc, #56]	; 300081b8 <clean_loop+0x30>
3000817c:	e59f1030 	ldr	r1, [pc, #48]	; 300081b4 <clean_loop+0x2c>
30008180:	e1500001 	cmp	r0, r1
30008184:	01a0f00e 	moveq	pc, lr

30008188 <clean_loop>:
30008188:	e3a02000 	mov	r2, #0
3000818c:	e4802004 	str	r2, [r0], #4
30008190:	e1500001 	cmp	r0, r1
30008194:	1afffffb 	bne	30008188 <clean_loop>
30008198:	e1a0f00e 	mov	pc, lr
3000819c:	300082dc 	ldrdcc	r8, [r0], -ip
300081a0:	4a000008 	bmi	300081c8 <shell_led+0x8>
300081a4:	4c000014 	stcmi	0, cr0, [r0], {20}
300081a8:	4c000004 	stcmi	0, cr0, [r0], {4}
300081ac:	0007f021 	andeq	pc, r7, r1, lsr #32
300081b0:	30008000 	andcc	r8, r0, r0
300081b4:	3000a02c 	andcc	sl, r0, ip, lsr #32
300081b8:	3000a02c 	andcc	sl, r0, ip, lsr #32
300081bc:	e1a00000 	nop			; (mov r0, r0)

300081c0 <shell_led>:
300081c0:	e92d4810 	push	{r4, fp, lr}
300081c4:	e28db008 	add	fp, sp, #8
300081c8:	e24dd01c 	sub	sp, sp, #28
300081cc:	e50b0020 	str	r0, [fp, #-32]
300081d0:	e50b1024 	str	r1, [fp, #-36]	; 0x24
300081d4:	e3a03000 	mov	r3, #0
300081d8:	e50b3018 	str	r3, [fp, #-24]
300081dc:	ea00001e 	b	3000825c <shell_led+0x9c>
300081e0:	e51b3024 	ldr	r3, [fp, #-36]	; 0x24
300081e4:	e2832010 	add	r2, r3, #16
300081e8:	e51b3018 	ldr	r3, [fp, #-24]
300081ec:	e7d23003 	ldrb	r3, [r2, r3]
300081f0:	e1a04003 	mov	r4, r3
300081f4:	e51b2024 	ldr	r2, [fp, #-36]	; 0x24
300081f8:	e51b3018 	ldr	r3, [fp, #-24]
300081fc:	e2833010 	add	r3, r3, #16
30008200:	e0823003 	add	r3, r2, r3
30008204:	e1a00003 	mov	r0, r3
30008208:	eb00047b 	bl	300093fc <atoi>
3000820c:	e1a03000 	mov	r3, r0
30008210:	e59f005c 	ldr	r0, [pc, #92]	; 30008274 <shell_led+0xb4>
30008214:	e1a01004 	mov	r1, r4
30008218:	e1a02003 	mov	r2, r3
3000821c:	eb000355 	bl	30008f78 <uprintf>
30008220:	e51b2024 	ldr	r2, [fp, #-36]	; 0x24
30008224:	e51b3018 	ldr	r3, [fp, #-24]
30008228:	e2833010 	add	r3, r3, #16
3000822c:	e0823003 	add	r3, r2, r3
30008230:	e1a00003 	mov	r0, r3
30008234:	eb000470 	bl	300093fc <atoi>
30008238:	e1a03000 	mov	r3, r0
3000823c:	e3530000 	cmp	r3, #0
30008240:	0a000001 	beq	3000824c <shell_led+0x8c>
30008244:	eb0003ef 	bl	30009208 <led_on>
30008248:	ea000000 	b	30008250 <shell_led+0x90>
3000824c:	eb0003f6 	bl	3000922c <led_off>
30008250:	e51b3018 	ldr	r3, [fp, #-24]
30008254:	e2833001 	add	r3, r3, #1
30008258:	e50b3018 	str	r3, [fp, #-24]
3000825c:	e51b3018 	ldr	r3, [fp, #-24]
30008260:	e3530003 	cmp	r3, #3
30008264:	daffffdd 	ble	300081e0 <shell_led+0x20>
30008268:	e24bd008 	sub	sp, fp, #8
3000826c:	e8bd4810 	pop	{r4, fp, lr}
30008270:	e12fff1e 	bx	lr
30008274:	30009fd4 	ldrdcc	r9, [r0], -r4

30008278 <shell_common>:
30008278:	e92d4800 	push	{fp, lr}
3000827c:	e28db004 	add	fp, sp, #4
30008280:	e24dd008 	sub	sp, sp, #8
30008284:	e50b0008 	str	r0, [fp, #-8]
30008288:	e50b100c 	str	r1, [fp, #-12]
3000828c:	e51b300c 	ldr	r3, [fp, #-12]
30008290:	e1a00003 	mov	r0, r3
30008294:	e59f1038 	ldr	r1, [pc, #56]	; 300082d4 <shell_common+0x5c>
30008298:	eb000527 	bl	3000973c <strcmp>
3000829c:	e1a03000 	mov	r3, r0
300082a0:	e3530000 	cmp	r3, #0
300082a4:	1a000003 	bne	300082b8 <shell_common+0x40>
300082a8:	e51b0008 	ldr	r0, [fp, #-8]
300082ac:	e51b100c 	ldr	r1, [fp, #-12]
300082b0:	ebffffc2 	bl	300081c0 <shell_led>
300082b4:	ea000003 	b	300082c8 <shell_common+0x50>
300082b8:	e51b300c 	ldr	r3, [fp, #-12]
300082bc:	e59f0014 	ldr	r0, [pc, #20]	; 300082d8 <shell_common+0x60>
300082c0:	e1a01003 	mov	r1, r3
300082c4:	eb00032b 	bl	30008f78 <uprintf>
300082c8:	e24bd004 	sub	sp, fp, #4
300082cc:	e8bd4800 	pop	{fp, lr}
300082d0:	e12fff1e 	bx	lr
300082d4:	30009fe0 	andcc	r9, r0, r0, ror #31
300082d8:	30009fe4 	andcc	r9, r0, r4, ror #31

300082dc <arm_main>:
300082dc:	e92d4800 	push	{fp, lr}
300082e0:	e28db004 	add	fp, sp, #4
300082e4:	e24dde47 	sub	sp, sp, #1136	; 0x470
300082e8:	e3a03000 	mov	r3, #0
300082ec:	e50b3010 	str	r3, [fp, #-16]
300082f0:	e3a03000 	mov	r3, #0
300082f4:	e50b300c 	str	r3, [fp, #-12]
300082f8:	e3a03000 	mov	r3, #0
300082fc:	e50b3008 	str	r3, [fp, #-8]
30008300:	eb0003b3 	bl	300091d4 <led_init>
30008304:	eb000203 	bl	30008b18 <uart0_init>
30008308:	e1a0300f 	mov	r3, pc
3000830c:	e59f01c8 	ldr	r0, [pc, #456]	; 300084dc <arm_main+0x200>
30008310:	e1a01003 	mov	r1, r3
30008314:	eb000317 	bl	30008f78 <uprintf>
30008318:	e59f01c0 	ldr	r0, [pc, #448]	; 300084e0 <arm_main+0x204>
3000831c:	eb000315 	bl	30008f78 <uprintf>
30008320:	e24b3b01 	sub	r3, fp, #1024	; 0x400
30008324:	e2433004 	sub	r3, r3, #4
30008328:	e243300c 	sub	r3, r3, #12
3000832c:	e1a00003 	mov	r0, r3
30008330:	eb00024c 	bl	30008c68 <ugets>
30008334:	e3a03000 	mov	r3, #0
30008338:	e50b3010 	str	r3, [fp, #-16]
3000833c:	e3a03000 	mov	r3, #0
30008340:	e50b300c 	str	r3, [fp, #-12]
30008344:	e3a03000 	mov	r3, #0
30008348:	e50b3008 	str	r3, [fp, #-8]
3000834c:	ea000046 	b	3000846c <arm_main+0x190>
30008350:	e51b2010 	ldr	r2, [fp, #-16]
30008354:	e59f3188 	ldr	r3, [pc, #392]	; 300084e4 <arm_main+0x208>
30008358:	e24b0004 	sub	r0, fp, #4
3000835c:	e0802002 	add	r2, r0, r2
30008360:	e0823003 	add	r3, r2, r3
30008364:	e5d33000 	ldrb	r3, [r3]
30008368:	e3530020 	cmp	r3, #32
3000836c:	0a00001a 	beq	300083dc <arm_main+0x100>
30008370:	e51b2010 	ldr	r2, [fp, #-16]
30008374:	e59f3168 	ldr	r3, [pc, #360]	; 300084e4 <arm_main+0x208>
30008378:	e24b1004 	sub	r1, fp, #4
3000837c:	e0812002 	add	r2, r1, r2
30008380:	e0823003 	add	r3, r2, r3
30008384:	e5d33000 	ldrb	r3, [r3]
30008388:	e3530009 	cmp	r3, #9
3000838c:	0a000012 	beq	300083dc <arm_main+0x100>
30008390:	e51b000c 	ldr	r0, [fp, #-12]
30008394:	e51b1008 	ldr	r1, [fp, #-8]
30008398:	e51b2010 	ldr	r2, [fp, #-16]
3000839c:	e59f3140 	ldr	r3, [pc, #320]	; 300084e4 <arm_main+0x208>
300083a0:	e24bc004 	sub	ip, fp, #4
300083a4:	e08c2002 	add	r2, ip, r2
300083a8:	e0823003 	add	r3, r2, r3
300083ac:	e5d32000 	ldrb	r2, [r3]
300083b0:	e59f3130 	ldr	r3, [pc, #304]	; 300084e8 <arm_main+0x20c>
300083b4:	e1a00200 	lsl	r0, r0, #4
300083b8:	e24bc004 	sub	ip, fp, #4
300083bc:	e08c0000 	add	r0, ip, r0
300083c0:	e0801001 	add	r1, r0, r1
300083c4:	e0813003 	add	r3, r1, r3
300083c8:	e5c32000 	strb	r2, [r3]
300083cc:	e51b3008 	ldr	r3, [fp, #-8]
300083d0:	e2833001 	add	r3, r3, #1
300083d4:	e50b3008 	str	r3, [fp, #-8]
300083d8:	ea000020 	b	30008460 <arm_main+0x184>
300083dc:	e51b3010 	ldr	r3, [fp, #-16]
300083e0:	e2432001 	sub	r2, r3, #1
300083e4:	e59f30f8 	ldr	r3, [pc, #248]	; 300084e4 <arm_main+0x208>
300083e8:	e24b0004 	sub	r0, fp, #4
300083ec:	e0802002 	add	r2, r0, r2
300083f0:	e0823003 	add	r3, r2, r3
300083f4:	e5d33000 	ldrb	r3, [r3]
300083f8:	e3530020 	cmp	r3, #32
300083fc:	0a000017 	beq	30008460 <arm_main+0x184>
30008400:	e51b3010 	ldr	r3, [fp, #-16]
30008404:	e2432001 	sub	r2, r3, #1
30008408:	e59f30d4 	ldr	r3, [pc, #212]	; 300084e4 <arm_main+0x208>
3000840c:	e24b1004 	sub	r1, fp, #4
30008410:	e0812002 	add	r2, r1, r2
30008414:	e0823003 	add	r3, r2, r3
30008418:	e5d33000 	ldrb	r3, [r3]
3000841c:	e3530009 	cmp	r3, #9
30008420:	0a00000e 	beq	30008460 <arm_main+0x184>
30008424:	e51b100c 	ldr	r1, [fp, #-12]
30008428:	e51b2008 	ldr	r2, [fp, #-8]
3000842c:	e59f30b4 	ldr	r3, [pc, #180]	; 300084e8 <arm_main+0x20c>
30008430:	e1a01201 	lsl	r1, r1, #4
30008434:	e24bc004 	sub	ip, fp, #4
30008438:	e08c1001 	add	r1, ip, r1
3000843c:	e0812002 	add	r2, r1, r2
30008440:	e0823003 	add	r3, r2, r3
30008444:	e3a02000 	mov	r2, #0
30008448:	e5c32000 	strb	r2, [r3]
3000844c:	e51b300c 	ldr	r3, [fp, #-12]
30008450:	e2833001 	add	r3, r3, #1
30008454:	e50b300c 	str	r3, [fp, #-12]
30008458:	e3a03000 	mov	r3, #0
3000845c:	e50b3008 	str	r3, [fp, #-8]
30008460:	e51b3010 	ldr	r3, [fp, #-16]
30008464:	e2833001 	add	r3, r3, #1
30008468:	e50b3010 	str	r3, [fp, #-16]
3000846c:	e51b2010 	ldr	r2, [fp, #-16]
30008470:	e59f306c 	ldr	r3, [pc, #108]	; 300084e4 <arm_main+0x208>
30008474:	e24b0004 	sub	r0, fp, #4
30008478:	e0802002 	add	r2, r0, r2
3000847c:	e0823003 	add	r3, r2, r3
30008480:	e5d33000 	ldrb	r3, [r3]
30008484:	e3530000 	cmp	r3, #0
30008488:	1affffb0 	bne	30008350 <arm_main+0x74>
3000848c:	e51b100c 	ldr	r1, [fp, #-12]
30008490:	e51b2008 	ldr	r2, [fp, #-8]
30008494:	e59f304c 	ldr	r3, [pc, #76]	; 300084e8 <arm_main+0x20c>
30008498:	e1a01201 	lsl	r1, r1, #4
3000849c:	e24bc004 	sub	ip, fp, #4
300084a0:	e08c1001 	add	r1, ip, r1
300084a4:	e0812002 	add	r2, r1, r2
300084a8:	e0823003 	add	r3, r2, r3
300084ac:	e3a02000 	mov	r2, #0
300084b0:	e5c32000 	strb	r2, [r3]
300084b4:	e51b300c 	ldr	r3, [fp, #-12]
300084b8:	e2833002 	add	r3, r3, #2
300084bc:	e50b300c 	str	r3, [fp, #-12]
300084c0:	e24b3e46 	sub	r3, fp, #1120	; 0x460
300084c4:	e2433004 	sub	r3, r3, #4
300084c8:	e243300c 	sub	r3, r3, #12
300084cc:	e51b000c 	ldr	r0, [fp, #-12]
300084d0:	e1a01003 	mov	r1, r3
300084d4:	ebffff67 	bl	30008278 <shell_common>
300084d8:	eaffff8e 	b	30008318 <arm_main+0x3c>
300084dc:	3000a000 	andcc	sl, r0, r0
300084e0:	3000a008 	andcc	sl, r0, r8
300084e4:	fffffbf4 	undefined instruction 0xfffffbf4
300084e8:	fffffb94 	undefined instruction 0xfffffb94

300084ec <handle_int>:
300084ec:	e92d4800 	push	{fp, lr}
300084f0:	e28db004 	add	fp, sp, #4
300084f4:	e59f3020 	ldr	r3, [pc, #32]	; 3000851c <handle_int+0x30>
300084f8:	e59f0020 	ldr	r0, [pc, #32]	; 30008520 <handle_int+0x34>
300084fc:	e1a0e00f 	mov	lr, pc
30008500:	e12fff13 	bx	r3
30008504:	e59f3018 	ldr	r3, [pc, #24]	; 30008524 <handle_int+0x38>
30008508:	e1a0e00f 	mov	lr, pc
3000850c:	e12fff13 	bx	r3
30008510:	e24bd004 	sub	sp, fp, #4
30008514:	e8bd4800 	pop	{fp, lr}
30008518:	e12fff1e 	bx	lr
3000851c:	33f963a4 	mvnscc	r6, #-1879048190	; 0x90000002
30008520:	3000a020 	andcc	sl, r0, r0, lsr #32
30008524:	30008374 	andcc	r8, r0, r4, ror r3

30008528 <main>:
30008528:	e52db004 	push	{fp}		; (str fp, [sp, #-4]!)
3000852c:	e28db000 	add	fp, sp, #0
30008530:	e28bd000 	add	sp, fp, #0
30008534:	e8bd0800 	pop	{fp}
30008538:	e12fff1e 	bx	lr

3000853c <select_chip>:
3000853c:	e52db004 	push	{fp}		; (str fp, [sp, #-4]!)
30008540:	e28db000 	add	fp, sp, #0
30008544:	e59f3018 	ldr	r3, [pc, #24]	; 30008564 <select_chip+0x28>
30008548:	e59f2014 	ldr	r2, [pc, #20]	; 30008564 <select_chip+0x28>
3000854c:	e5922000 	ldr	r2, [r2]
30008550:	e3c22002 	bic	r2, r2, #2
30008554:	e5832000 	str	r2, [r3]
30008558:	e28bd000 	add	sp, fp, #0
3000855c:	e8bd0800 	pop	{fp}
30008560:	e12fff1e 	bx	lr
30008564:	4e000004 	cdpmi	0, 0, cr0, cr0, cr4, {0}

30008568 <diselect_chip>:
30008568:	e52db004 	push	{fp}		; (str fp, [sp, #-4]!)
3000856c:	e28db000 	add	fp, sp, #0
30008570:	e59f3018 	ldr	r3, [pc, #24]	; 30008590 <diselect_chip+0x28>
30008574:	e59f2014 	ldr	r2, [pc, #20]	; 30008590 <diselect_chip+0x28>
30008578:	e5922000 	ldr	r2, [r2]
3000857c:	e3822002 	orr	r2, r2, #2
30008580:	e5832000 	str	r2, [r3]
30008584:	e28bd000 	add	sp, fp, #0
30008588:	e8bd0800 	pop	{fp}
3000858c:	e12fff1e 	bx	lr
30008590:	4e000004 	cdpmi	0, 0, cr0, cr0, cr4, {0}

30008594 <clear_RnB>:
30008594:	e52db004 	push	{fp}		; (str fp, [sp, #-4]!)
30008598:	e28db000 	add	fp, sp, #0
3000859c:	e59f3020 	ldr	r3, [pc, #32]	; 300085c4 <clear_RnB+0x30>
300085a0:	e59f201c 	ldr	r2, [pc, #28]	; 300085c4 <clear_RnB+0x30>
300085a4:	e5d22000 	ldrb	r2, [r2]
300085a8:	e20220ff 	and	r2, r2, #255	; 0xff
300085ac:	e3822004 	orr	r2, r2, #4
300085b0:	e20220ff 	and	r2, r2, #255	; 0xff
300085b4:	e5c32000 	strb	r2, [r3]
300085b8:	e28bd000 	add	sp, fp, #0
300085bc:	e8bd0800 	pop	{fp}
300085c0:	e12fff1e 	bx	lr
300085c4:	4e000020 	cdpmi	0, 0, cr0, cr0, cr0, {1}

300085c8 <send_cmmd>:
300085c8:	e52db004 	push	{fp}		; (str fp, [sp, #-4]!)
300085cc:	e28db000 	add	fp, sp, #0
300085d0:	e24dd00c 	sub	sp, sp, #12
300085d4:	e50b0008 	str	r0, [fp, #-8]
300085d8:	e59f3014 	ldr	r3, [pc, #20]	; 300085f4 <send_cmmd+0x2c>
300085dc:	e51b2008 	ldr	r2, [fp, #-8]
300085e0:	e20220ff 	and	r2, r2, #255	; 0xff
300085e4:	e5c32000 	strb	r2, [r3]
300085e8:	e28bd000 	add	sp, fp, #0
300085ec:	e8bd0800 	pop	{fp}
300085f0:	e12fff1e 	bx	lr
300085f4:	4e000008 	cdpmi	0, 0, cr0, cr0, cr8, {0}

300085f8 <send_addr>:
300085f8:	e52db004 	push	{fp}		; (str fp, [sp, #-4]!)
300085fc:	e28db000 	add	fp, sp, #0
30008600:	e24dd00c 	sub	sp, sp, #12
30008604:	e50b0008 	str	r0, [fp, #-8]
30008608:	e59f3014 	ldr	r3, [pc, #20]	; 30008624 <send_addr+0x2c>
3000860c:	e51b2008 	ldr	r2, [fp, #-8]
30008610:	e20220ff 	and	r2, r2, #255	; 0xff
30008614:	e5c32000 	strb	r2, [r3]
30008618:	e28bd000 	add	sp, fp, #0
3000861c:	e8bd0800 	pop	{fp}
30008620:	e12fff1e 	bx	lr
30008624:	4e00000c 	cdpmi	0, 0, cr0, cr0, cr12, {0}

30008628 <wait_RnB>:
30008628:	e52db004 	push	{fp}		; (str fp, [sp, #-4]!)
3000862c:	e28db000 	add	fp, sp, #0
30008630:	e59f301c 	ldr	r3, [pc, #28]	; 30008654 <wait_RnB+0x2c>
30008634:	e5d33000 	ldrb	r3, [r3]
30008638:	e20330ff 	and	r3, r3, #255	; 0xff
3000863c:	e2033004 	and	r3, r3, #4
30008640:	e3530000 	cmp	r3, #0
30008644:	0afffff9 	beq	30008630 <wait_RnB+0x8>
30008648:	e28bd000 	add	sp, fp, #0
3000864c:	e8bd0800 	pop	{fp}
30008650:	e12fff1e 	bx	lr
30008654:	4e000020 	cdpmi	0, 0, cr0, cr0, cr0, {1}

30008658 <nand_reset>:
30008658:	e92d4800 	push	{fp, lr}
3000865c:	e28db004 	add	fp, sp, #4
30008660:	ebffffb5 	bl	3000853c <select_chip>
30008664:	ebffffca 	bl	30008594 <clear_RnB>
30008668:	e3a000ff 	mov	r0, #255	; 0xff
3000866c:	ebffffd5 	bl	300085c8 <send_cmmd>
30008670:	ebffffec 	bl	30008628 <wait_RnB>
30008674:	ebffffbb 	bl	30008568 <diselect_chip>
30008678:	e24bd004 	sub	sp, fp, #4
3000867c:	e8bd4800 	pop	{fp, lr}
30008680:	e12fff1e 	bx	lr

30008684 <nand_init>:
30008684:	e92d4800 	push	{fp, lr}
30008688:	e28db004 	add	fp, sp, #4
3000868c:	e3a0344e 	mov	r3, #1308622848	; 0x4e000000
30008690:	e59f201c 	ldr	r2, [pc, #28]	; 300086b4 <nand_init+0x30>
30008694:	e5832000 	str	r2, [r3]
30008698:	e59f3018 	ldr	r3, [pc, #24]	; 300086b8 <nand_init+0x34>
3000869c:	e3a02003 	mov	r2, #3
300086a0:	e5832000 	str	r2, [r3]
300086a4:	ebffffeb 	bl	30008658 <nand_reset>
300086a8:	e24bd004 	sub	sp, fp, #4
300086ac:	e8bd4800 	pop	{fp, lr}
300086b0:	e12fff1e 	bx	lr
300086b4:	00001210 	andeq	r1, r0, r0, lsl r2
300086b8:	4e000004 	cdpmi	0, 0, cr0, cr0, cr4, {0}

300086bc <nand_PageRead>:
300086bc:	e92d4800 	push	{fp, lr}
300086c0:	e28db004 	add	fp, sp, #4
300086c4:	e24dd010 	sub	sp, sp, #16
300086c8:	e50b0010 	str	r0, [fp, #-16]
300086cc:	e50b1014 	str	r1, [fp, #-20]
300086d0:	e3a03000 	mov	r3, #0
300086d4:	e50b3008 	str	r3, [fp, #-8]
300086d8:	ebffff97 	bl	3000853c <select_chip>
300086dc:	ebffffac 	bl	30008594 <clear_RnB>
300086e0:	e3a00000 	mov	r0, #0
300086e4:	ebffffb7 	bl	300085c8 <send_cmmd>
300086e8:	e3a00000 	mov	r0, #0
300086ec:	ebffffc1 	bl	300085f8 <send_addr>
300086f0:	e3a00000 	mov	r0, #0
300086f4:	ebffffbf 	bl	300085f8 <send_addr>
300086f8:	e51b3010 	ldr	r3, [fp, #-16]
300086fc:	e20330ff 	and	r3, r3, #255	; 0xff
30008700:	e1a00003 	mov	r0, r3
30008704:	ebffffbb 	bl	300085f8 <send_addr>
30008708:	e51b3010 	ldr	r3, [fp, #-16]
3000870c:	e1a03423 	lsr	r3, r3, #8
30008710:	e20330ff 	and	r3, r3, #255	; 0xff
30008714:	e1a00003 	mov	r0, r3
30008718:	ebffffb6 	bl	300085f8 <send_addr>
3000871c:	e51b3010 	ldr	r3, [fp, #-16]
30008720:	e1a03823 	lsr	r3, r3, #16
30008724:	e20330ff 	and	r3, r3, #255	; 0xff
30008728:	e1a00003 	mov	r0, r3
3000872c:	ebffffb1 	bl	300085f8 <send_addr>
30008730:	e3a00030 	mov	r0, #48	; 0x30
30008734:	ebffffa3 	bl	300085c8 <send_cmmd>
30008738:	ebffffba 	bl	30008628 <wait_RnB>
3000873c:	e3a03000 	mov	r3, #0
30008740:	e50b3008 	str	r3, [fp, #-8]
30008744:	ea000009 	b	30008770 <nand_PageRead+0xb4>
30008748:	e51b3008 	ldr	r3, [fp, #-8]
3000874c:	e51b2014 	ldr	r2, [fp, #-20]
30008750:	e0823003 	add	r3, r2, r3
30008754:	e59f2034 	ldr	r2, [pc, #52]	; 30008790 <nand_PageRead+0xd4>
30008758:	e5d22000 	ldrb	r2, [r2]
3000875c:	e20220ff 	and	r2, r2, #255	; 0xff
30008760:	e5c32000 	strb	r2, [r3]
30008764:	e51b3008 	ldr	r3, [fp, #-8]
30008768:	e2833001 	add	r3, r3, #1
3000876c:	e50b3008 	str	r3, [fp, #-8]
30008770:	e51b2008 	ldr	r2, [fp, #-8]
30008774:	e59f3018 	ldr	r3, [pc, #24]	; 30008794 <nand_PageRead+0xd8>
30008778:	e1520003 	cmp	r2, r3
3000877c:	dafffff1 	ble	30008748 <nand_PageRead+0x8c>
30008780:	ebffff78 	bl	30008568 <diselect_chip>
30008784:	e24bd004 	sub	sp, fp, #4
30008788:	e8bd4800 	pop	{fp, lr}
3000878c:	e12fff1e 	bx	lr
30008790:	4e000010 	mcrmi	0, 0, r0, cr0, cr0, {0}
30008794:	000007ff 	strdeq	r0, [r0], -pc

30008798 <nand_PageWrite>:
30008798:	e92d4800 	push	{fp, lr}
3000879c:	e28db004 	add	fp, sp, #4
300087a0:	e24dd010 	sub	sp, sp, #16
300087a4:	e50b0010 	str	r0, [fp, #-16]
300087a8:	e50b1014 	str	r1, [fp, #-20]
300087ac:	e3a03000 	mov	r3, #0
300087b0:	e50b300c 	str	r3, [fp, #-12]
300087b4:	e3a03000 	mov	r3, #0
300087b8:	e50b3008 	str	r3, [fp, #-8]
300087bc:	ebffff5e 	bl	3000853c <select_chip>
300087c0:	ebffff73 	bl	30008594 <clear_RnB>
300087c4:	e3a00080 	mov	r0, #128	; 0x80
300087c8:	ebffff7e 	bl	300085c8 <send_cmmd>
300087cc:	e3a00000 	mov	r0, #0
300087d0:	ebffff88 	bl	300085f8 <send_addr>
300087d4:	e3a00000 	mov	r0, #0
300087d8:	ebffff86 	bl	300085f8 <send_addr>
300087dc:	e51b3010 	ldr	r3, [fp, #-16]
300087e0:	e20330ff 	and	r3, r3, #255	; 0xff
300087e4:	e1a00003 	mov	r0, r3
300087e8:	ebffff82 	bl	300085f8 <send_addr>
300087ec:	e51b3010 	ldr	r3, [fp, #-16]
300087f0:	e1a03423 	lsr	r3, r3, #8
300087f4:	e20330ff 	and	r3, r3, #255	; 0xff
300087f8:	e1a00003 	mov	r0, r3
300087fc:	ebffff7d 	bl	300085f8 <send_addr>
30008800:	e51b3010 	ldr	r3, [fp, #-16]
30008804:	e1a03823 	lsr	r3, r3, #16
30008808:	e20330ff 	and	r3, r3, #255	; 0xff
3000880c:	e1a00003 	mov	r0, r3
30008810:	ebffff78 	bl	300085f8 <send_addr>
30008814:	e3a03000 	mov	r3, #0
30008818:	e50b300c 	str	r3, [fp, #-12]
3000881c:	ea000008 	b	30008844 <nand_PageWrite+0xac>
30008820:	e59f3068 	ldr	r3, [pc, #104]	; 30008890 <nand_PageWrite+0xf8>
30008824:	e51b200c 	ldr	r2, [fp, #-12]
30008828:	e51b1014 	ldr	r1, [fp, #-20]
3000882c:	e0812002 	add	r2, r1, r2
30008830:	e5d22000 	ldrb	r2, [r2]
30008834:	e5c32000 	strb	r2, [r3]
30008838:	e51b300c 	ldr	r3, [fp, #-12]
3000883c:	e2833001 	add	r3, r3, #1
30008840:	e50b300c 	str	r3, [fp, #-12]
30008844:	e51b200c 	ldr	r2, [fp, #-12]
30008848:	e59f3044 	ldr	r3, [pc, #68]	; 30008894 <nand_PageWrite+0xfc>
3000884c:	e1520003 	cmp	r2, r3
30008850:	dafffff2 	ble	30008820 <nand_PageWrite+0x88>
30008854:	e3a00010 	mov	r0, #16
30008858:	ebffff5a 	bl	300085c8 <send_cmmd>
3000885c:	ebffff71 	bl	30008628 <wait_RnB>
30008860:	e3a00070 	mov	r0, #112	; 0x70
30008864:	ebffff57 	bl	300085c8 <send_cmmd>
30008868:	e59f3020 	ldr	r3, [pc, #32]	; 30008890 <nand_PageWrite+0xf8>
3000886c:	e5d33000 	ldrb	r3, [r3]
30008870:	e20330ff 	and	r3, r3, #255	; 0xff
30008874:	e50b3008 	str	r3, [fp, #-8]
30008878:	ebffff3a 	bl	30008568 <diselect_chip>
3000887c:	e51b3008 	ldr	r3, [fp, #-8]
30008880:	e1a00003 	mov	r0, r3
30008884:	e24bd004 	sub	sp, fp, #4
30008888:	e8bd4800 	pop	{fp, lr}
3000888c:	e12fff1e 	bx	lr
30008890:	4e000010 	mcrmi	0, 0, r0, cr0, cr0, {0}
30008894:	000007ff 	strdeq	r0, [r0], -pc

30008898 <nand_to_ram>:
30008898:	e92d4800 	push	{fp, lr}
3000889c:	e28db004 	add	fp, sp, #4
300088a0:	e24dd018 	sub	sp, sp, #24
300088a4:	e50b0010 	str	r0, [fp, #-16]
300088a8:	e50b1014 	str	r1, [fp, #-20]
300088ac:	e50b2018 	str	r2, [fp, #-24]
300088b0:	e3a03000 	mov	r3, #0
300088b4:	e50b3008 	str	r3, [fp, #-8]
300088b8:	e51b3010 	ldr	r3, [fp, #-16]
300088bc:	e1a035a3 	lsr	r3, r3, #11
300088c0:	e50b3008 	str	r3, [fp, #-8]
300088c4:	ea00000c 	b	300088fc <nand_to_ram+0x64>
300088c8:	e51b3008 	ldr	r3, [fp, #-8]
300088cc:	e1a00003 	mov	r0, r3
300088d0:	e51b1014 	ldr	r1, [fp, #-20]
300088d4:	ebffff78 	bl	300086bc <nand_PageRead>
300088d8:	e51b3018 	ldr	r3, [fp, #-24]
300088dc:	e2433b02 	sub	r3, r3, #2048	; 0x800
300088e0:	e50b3018 	str	r3, [fp, #-24]
300088e4:	e51b3014 	ldr	r3, [fp, #-20]
300088e8:	e2833b02 	add	r3, r3, #2048	; 0x800
300088ec:	e50b3014 	str	r3, [fp, #-20]
300088f0:	e51b3008 	ldr	r3, [fp, #-8]
300088f4:	e2833001 	add	r3, r3, #1
300088f8:	e50b3008 	str	r3, [fp, #-8]
300088fc:	e51b3018 	ldr	r3, [fp, #-24]
30008900:	e3530000 	cmp	r3, #0
30008904:	caffffef 	bgt	300088c8 <nand_to_ram+0x30>
30008908:	e24bd004 	sub	sp, fp, #4
3000890c:	e8bd4800 	pop	{fp, lr}
30008910:	e12fff1e 	bx	lr

30008914 <nand_erase>:
30008914:	e92d4800 	push	{fp, lr}
30008918:	e28db004 	add	fp, sp, #4
3000891c:	e24dd010 	sub	sp, sp, #16
30008920:	e50b0010 	str	r0, [fp, #-16]
30008924:	e3a03000 	mov	r3, #0
30008928:	e50b3008 	str	r3, [fp, #-8]
3000892c:	ebffff02 	bl	3000853c <select_chip>
30008930:	ebffff17 	bl	30008594 <clear_RnB>
30008934:	e3a0003c 	mov	r0, #60	; 0x3c
30008938:	ebffff22 	bl	300085c8 <send_cmmd>
3000893c:	e51b3010 	ldr	r3, [fp, #-16]
30008940:	e20330ff 	and	r3, r3, #255	; 0xff
30008944:	e1a00003 	mov	r0, r3
30008948:	ebffff2a 	bl	300085f8 <send_addr>
3000894c:	e51b3010 	ldr	r3, [fp, #-16]
30008950:	e1a03423 	lsr	r3, r3, #8
30008954:	e20330ff 	and	r3, r3, #255	; 0xff
30008958:	e1a00003 	mov	r0, r3
3000895c:	ebffff25 	bl	300085f8 <send_addr>
30008960:	e51b3010 	ldr	r3, [fp, #-16]
30008964:	e1a03823 	lsr	r3, r3, #16
30008968:	e20330ff 	and	r3, r3, #255	; 0xff
3000896c:	e1a00003 	mov	r0, r3
30008970:	ebffff20 	bl	300085f8 <send_addr>
30008974:	e3a000d0 	mov	r0, #208	; 0xd0
30008978:	ebffff12 	bl	300085c8 <send_cmmd>
3000897c:	ebffff29 	bl	30008628 <wait_RnB>
30008980:	e3a00070 	mov	r0, #112	; 0x70
30008984:	ebffff0f 	bl	300085c8 <send_cmmd>
30008988:	e59f3020 	ldr	r3, [pc, #32]	; 300089b0 <nand_erase+0x9c>
3000898c:	e5d33000 	ldrb	r3, [r3]
30008990:	e20330ff 	and	r3, r3, #255	; 0xff
30008994:	e50b3008 	str	r3, [fp, #-8]
30008998:	ebfffef2 	bl	30008568 <diselect_chip>
3000899c:	e51b3008 	ldr	r3, [fp, #-8]
300089a0:	e1a00003 	mov	r0, r3
300089a4:	e24bd004 	sub	sp, fp, #4
300089a8:	e8bd4800 	pop	{fp, lr}
300089ac:	e12fff1e 	bx	lr
300089b0:	4e000010 	mcrmi	0, 0, r0, cr0, cr0, {0}

300089b4 <create_page_table>:
300089b4:	e52db004 	push	{fp}		; (str fp, [sp, #-4]!)
300089b8:	e28db000 	add	fp, sp, #0
300089bc:	e24dd014 	sub	sp, sp, #20
300089c0:	e3a03203 	mov	r3, #805306368	; 0x30000000
300089c4:	e50b3008 	str	r3, [fp, #-8]
300089c8:	e3a03000 	mov	r3, #0
300089cc:	e50b3010 	str	r3, [fp, #-16]
300089d0:	e3a03000 	mov	r3, #0
300089d4:	e50b300c 	str	r3, [fp, #-12]
300089d8:	e51b3010 	ldr	r3, [fp, #-16]
300089dc:	e1a03a23 	lsr	r3, r3, #20
300089e0:	e1a03103 	lsl	r3, r3, #2
300089e4:	e51b2008 	ldr	r2, [fp, #-8]
300089e8:	e0822003 	add	r2, r2, r3
300089ec:	e51b300c 	ldr	r3, [fp, #-12]
300089f0:	e1a03a23 	lsr	r3, r3, #20
300089f4:	e1a03a03 	lsl	r3, r3, #20
300089f8:	e3833ec1 	orr	r3, r3, #3088	; 0xc10
300089fc:	e383300e 	orr	r3, r3, #14
30008a00:	e5823000 	str	r3, [r2]
30008a04:	e3a0320a 	mov	r3, #-1610612736	; 0xa0000000
30008a08:	e50b3010 	str	r3, [fp, #-16]
30008a0c:	e3a03456 	mov	r3, #1442840576	; 0x56000000
30008a10:	e50b300c 	str	r3, [fp, #-12]
30008a14:	e51b3010 	ldr	r3, [fp, #-16]
30008a18:	e1a03a23 	lsr	r3, r3, #20
30008a1c:	e1a03103 	lsl	r3, r3, #2
30008a20:	e51b2008 	ldr	r2, [fp, #-8]
30008a24:	e0822003 	add	r2, r2, r3
30008a28:	e51b300c 	ldr	r3, [fp, #-12]
30008a2c:	e1a03a23 	lsr	r3, r3, #20
30008a30:	e1a03a03 	lsl	r3, r3, #20
30008a34:	e3833ec1 	orr	r3, r3, #3088	; 0xc10
30008a38:	e3833002 	orr	r3, r3, #2
30008a3c:	e5823000 	str	r3, [r2]
30008a40:	e3a0320b 	mov	r3, #-1342177280	; 0xb0000000
30008a44:	e50b3010 	str	r3, [fp, #-16]
30008a48:	e3a03203 	mov	r3, #805306368	; 0x30000000
30008a4c:	e50b300c 	str	r3, [fp, #-12]
30008a50:	ea000010 	b	30008a98 <create_page_table+0xe4>
30008a54:	e51b3010 	ldr	r3, [fp, #-16]
30008a58:	e1a03a23 	lsr	r3, r3, #20
30008a5c:	e1a03103 	lsl	r3, r3, #2
30008a60:	e51b2008 	ldr	r2, [fp, #-8]
30008a64:	e0822003 	add	r2, r2, r3
30008a68:	e51b300c 	ldr	r3, [fp, #-12]
30008a6c:	e1a03a23 	lsr	r3, r3, #20
30008a70:	e1a03a03 	lsl	r3, r3, #20
30008a74:	e3833ec1 	orr	r3, r3, #3088	; 0xc10
30008a78:	e383300e 	orr	r3, r3, #14
30008a7c:	e5823000 	str	r3, [r2]
30008a80:	e51b3010 	ldr	r3, [fp, #-16]
30008a84:	e2833601 	add	r3, r3, #1048576	; 0x100000
30008a88:	e50b3010 	str	r3, [fp, #-16]
30008a8c:	e51b300c 	ldr	r3, [fp, #-12]
30008a90:	e2833601 	add	r3, r3, #1048576	; 0x100000
30008a94:	e50b300c 	str	r3, [fp, #-12]
30008a98:	e51b3010 	ldr	r3, [fp, #-16]
30008a9c:	e3730353 	cmn	r3, #1275068417	; 0x4c000001
30008aa0:	9affffeb 	bls	30008a54 <create_page_table+0xa0>
30008aa4:	e28bd000 	add	sp, fp, #0
30008aa8:	e8bd0800 	pop	{fp}
30008aac:	e12fff1e 	bx	lr

30008ab0 <mmu_init>:
30008ab0:	e52db004 	push	{fp}		; (str fp, [sp, #-4]!)
30008ab4:	e28db000 	add	fp, sp, #0
30008ab8:	e24dd00c 	sub	sp, sp, #12
30008abc:	e3a03203 	mov	r3, #805306368	; 0x30000000
30008ac0:	e50b3008 	str	r3, [fp, #-8]
30008ac4:	e51b3008 	ldr	r3, [fp, #-8]
30008ac8:	e3a00000 	mov	r0, #0
30008acc:	ee070f17 	mcr	15, 0, r0, cr7, cr7, {0}
30008ad0:	ee070f9a 	mcr	15, 0, r0, cr7, cr10, {4}
30008ad4:	ee080f17 	mcr	15, 0, r0, cr8, cr7, {0}
30008ad8:	e1a04003 	mov	r4, r3
30008adc:	ee024f10 	mcr	15, 0, r4, cr2, cr0, {0}
30008ae0:	e3e00000 	mvn	r0, #0
30008ae4:	ee030f10 	mcr	15, 0, r0, cr3, cr0, {0}
30008ae8:	ee110f10 	mrc	15, 0, r0, cr1, cr0, {0}
30008aec:	e3c00a03 	bic	r0, r0, #12288	; 0x3000
30008af0:	e3c00c03 	bic	r0, r0, #768	; 0x300
30008af4:	e3c00087 	bic	r0, r0, #135	; 0x87
30008af8:	e3800002 	orr	r0, r0, #2
30008afc:	e3800004 	orr	r0, r0, #4
30008b00:	e3800a01 	orr	r0, r0, #4096	; 0x1000
30008b04:	e3800001 	orr	r0, r0, #1
30008b08:	ee010f10 	mcr	15, 0, r0, cr1, cr0, {0}
30008b0c:	e28bd000 	add	sp, fp, #0
30008b10:	e8bd0800 	pop	{fp}
30008b14:	e12fff1e 	bx	lr

30008b18 <uart0_init>:
30008b18:	e52db004 	push	{fp}		; (str fp, [sp, #-4]!)
30008b1c:	e28db000 	add	fp, sp, #0
30008b20:	e59f3060 	ldr	r3, [pc, #96]	; 30008b88 <uart0_init+0x70>
30008b24:	e59f205c 	ldr	r2, [pc, #92]	; 30008b88 <uart0_init+0x70>
30008b28:	e5922000 	ldr	r2, [r2]
30008b2c:	e38220a0 	orr	r2, r2, #160	; 0xa0
30008b30:	e5832000 	str	r2, [r3]
30008b34:	e59f3050 	ldr	r3, [pc, #80]	; 30008b8c <uart0_init+0x74>
30008b38:	e3a0200c 	mov	r2, #12
30008b3c:	e5832000 	str	r2, [r3]
30008b40:	e3a03205 	mov	r3, #1342177280	; 0x50000000
30008b44:	e3a02003 	mov	r2, #3
30008b48:	e5832000 	str	r2, [r3]
30008b4c:	e3a03245 	mov	r3, #1342177284	; 0x50000004
30008b50:	e3a02005 	mov	r2, #5
30008b54:	e5832000 	str	r2, [r3]
30008b58:	e3a03285 	mov	r3, #1342177288	; 0x50000008
30008b5c:	e3a02000 	mov	r2, #0
30008b60:	e5832000 	str	r2, [r3]
30008b64:	e3a032c5 	mov	r3, #1342177292	; 0x5000000c
30008b68:	e3a02000 	mov	r2, #0
30008b6c:	e5832000 	str	r2, [r3]
30008b70:	e59f3018 	ldr	r3, [pc, #24]	; 30008b90 <uart0_init+0x78>
30008b74:	e3a0201a 	mov	r2, #26
30008b78:	e5832000 	str	r2, [r3]
30008b7c:	e28bd000 	add	sp, fp, #0
30008b80:	e8bd0800 	pop	{fp}
30008b84:	e12fff1e 	bx	lr
30008b88:	56000070 	undefined instruction 0x56000070
30008b8c:	56000078 	undefined instruction 0x56000078
30008b90:	50000028 	andpl	r0, r0, r8, lsr #32

30008b94 <putc>:
30008b94:	e52db004 	push	{fp}		; (str fp, [sp, #-4]!)
30008b98:	e28db000 	add	fp, sp, #0
30008b9c:	e24dd00c 	sub	sp, sp, #12
30008ba0:	e1a03000 	mov	r3, r0
30008ba4:	e54b3005 	strb	r3, [fp, #-5]
30008ba8:	e59f3024 	ldr	r3, [pc, #36]	; 30008bd4 <putc+0x40>
30008bac:	e5933000 	ldr	r3, [r3]
30008bb0:	e2033004 	and	r3, r3, #4
30008bb4:	e3530000 	cmp	r3, #0
30008bb8:	0afffffa 	beq	30008ba8 <putc+0x14>
30008bbc:	e59f3014 	ldr	r3, [pc, #20]	; 30008bd8 <putc+0x44>
30008bc0:	e55b2005 	ldrb	r2, [fp, #-5]
30008bc4:	e5c32000 	strb	r2, [r3]
30008bc8:	e28bd000 	add	sp, fp, #0
30008bcc:	e8bd0800 	pop	{fp}
30008bd0:	e12fff1e 	bx	lr
30008bd4:	50000010 	andpl	r0, r0, r0, lsl r0
30008bd8:	50000020 	andpl	r0, r0, r0, lsr #32

30008bdc <getc>:
30008bdc:	e52db004 	push	{fp}		; (str fp, [sp, #-4]!)
30008be0:	e28db000 	add	fp, sp, #0
30008be4:	e59f3028 	ldr	r3, [pc, #40]	; 30008c14 <getc+0x38>
30008be8:	e5933000 	ldr	r3, [r3]
30008bec:	e2033001 	and	r3, r3, #1
30008bf0:	e3530000 	cmp	r3, #0
30008bf4:	0afffffa 	beq	30008be4 <getc+0x8>
30008bf8:	e59f3018 	ldr	r3, [pc, #24]	; 30008c18 <getc+0x3c>
30008bfc:	e5d33000 	ldrb	r3, [r3]
30008c00:	e20330ff 	and	r3, r3, #255	; 0xff
30008c04:	e1a00003 	mov	r0, r3
30008c08:	e28bd000 	add	sp, fp, #0
30008c0c:	e8bd0800 	pop	{fp}
30008c10:	e12fff1e 	bx	lr
30008c14:	50000010 	andpl	r0, r0, r0, lsl r0
30008c18:	50000024 	andpl	r0, r0, r4, lsr #32

30008c1c <uputs>:
30008c1c:	e92d4800 	push	{fp, lr}
30008c20:	e28db004 	add	fp, sp, #4
30008c24:	e24dd008 	sub	sp, sp, #8
30008c28:	e50b0008 	str	r0, [fp, #-8]
30008c2c:	ea000006 	b	30008c4c <uputs+0x30>
30008c30:	e51b3008 	ldr	r3, [fp, #-8]
30008c34:	e5d33000 	ldrb	r3, [r3]
30008c38:	e1a00003 	mov	r0, r3
30008c3c:	ebffffd4 	bl	30008b94 <putc>
30008c40:	e51b3008 	ldr	r3, [fp, #-8]
30008c44:	e2833001 	add	r3, r3, #1
30008c48:	e50b3008 	str	r3, [fp, #-8]
30008c4c:	e51b3008 	ldr	r3, [fp, #-8]
30008c50:	e5d33000 	ldrb	r3, [r3]
30008c54:	e3530000 	cmp	r3, #0
30008c58:	1afffff4 	bne	30008c30 <uputs+0x14>
30008c5c:	e24bd004 	sub	sp, fp, #4
30008c60:	e8bd4800 	pop	{fp, lr}
30008c64:	e12fff1e 	bx	lr

30008c68 <ugets>:
30008c68:	e92d4800 	push	{fp, lr}
30008c6c:	e28db004 	add	fp, sp, #4
30008c70:	e24dd010 	sub	sp, sp, #16
30008c74:	e50b0010 	str	r0, [fp, #-16]
30008c78:	e51b3010 	ldr	r3, [fp, #-16]
30008c7c:	e50b300c 	str	r3, [fp, #-12]
30008c80:	ea000009 	b	30008cac <ugets+0x44>
30008c84:	e51b3010 	ldr	r3, [fp, #-16]
30008c88:	e55b2005 	ldrb	r2, [fp, #-5]
30008c8c:	e5c32000 	strb	r2, [r3]
30008c90:	e51b3010 	ldr	r3, [fp, #-16]
30008c94:	e5d33000 	ldrb	r3, [r3]
30008c98:	e1a00003 	mov	r0, r3
30008c9c:	ebffffbc 	bl	30008b94 <putc>
30008ca0:	e51b3010 	ldr	r3, [fp, #-16]
30008ca4:	e2833001 	add	r3, r3, #1
30008ca8:	e50b3010 	str	r3, [fp, #-16]
30008cac:	ebffffca 	bl	30008bdc <getc>
30008cb0:	e1a03000 	mov	r3, r0
30008cb4:	e54b3005 	strb	r3, [fp, #-5]
30008cb8:	e55b3005 	ldrb	r3, [fp, #-5]
30008cbc:	e353000d 	cmp	r3, #13
30008cc0:	1affffef 	bne	30008c84 <ugets+0x1c>
30008cc4:	e51b3010 	ldr	r3, [fp, #-16]
30008cc8:	e3a02000 	mov	r2, #0
30008ccc:	e5c32000 	strb	r2, [r3]
30008cd0:	e3a0000d 	mov	r0, #13
30008cd4:	ebffffae 	bl	30008b94 <putc>
30008cd8:	e3a0000a 	mov	r0, #10
30008cdc:	ebffffac 	bl	30008b94 <putc>
30008ce0:	e51b300c 	ldr	r3, [fp, #-12]
30008ce4:	e1a00003 	mov	r0, r3
30008ce8:	e24bd004 	sub	sp, fp, #4
30008cec:	e8bd4800 	pop	{fp, lr}
30008cf0:	e12fff1e 	bx	lr

30008cf4 <itoa>:
30008cf4:	e92d4800 	push	{fp, lr}
30008cf8:	e28db004 	add	fp, sp, #4
30008cfc:	e24dd010 	sub	sp, sp, #16
30008d00:	e50b0010 	str	r0, [fp, #-16]
30008d04:	e50b1014 	str	r1, [fp, #-20]
30008d08:	e51b3010 	ldr	r3, [fp, #-16]
30008d0c:	e3530009 	cmp	r3, #9
30008d10:	ca00000a 	bgt	30008d40 <itoa+0x4c>
30008d14:	e51b3010 	ldr	r3, [fp, #-16]
30008d18:	e20330ff 	and	r3, r3, #255	; 0xff
30008d1c:	e2833030 	add	r3, r3, #48	; 0x30
30008d20:	e20320ff 	and	r2, r3, #255	; 0xff
30008d24:	e51b3014 	ldr	r3, [fp, #-20]
30008d28:	e5c32000 	strb	r2, [r3]
30008d2c:	e51b3014 	ldr	r3, [fp, #-20]
30008d30:	e2833001 	add	r3, r3, #1
30008d34:	e3a02000 	mov	r2, #0
30008d38:	e5c32000 	strb	r2, [r3]
30008d3c:	ea00002c 	b	30008df4 <itoa+0x100>
30008d40:	e51b3010 	ldr	r3, [fp, #-16]
30008d44:	e59f10b4 	ldr	r1, [pc, #180]	; 30008e00 <itoa+0x10c>
30008d48:	e0c20391 	smull	r0, r2, r1, r3
30008d4c:	e1a02142 	asr	r2, r2, #2
30008d50:	e1a03fc3 	asr	r3, r3, #31
30008d54:	e0633002 	rsb	r3, r3, r2
30008d58:	e1a00003 	mov	r0, r3
30008d5c:	e51b1014 	ldr	r1, [fp, #-20]
30008d60:	ebffffe3 	bl	30008cf4 <itoa>
30008d64:	e3a03000 	mov	r3, #0
30008d68:	e50b3008 	str	r3, [fp, #-8]
30008d6c:	ea000002 	b	30008d7c <itoa+0x88>
30008d70:	e51b3008 	ldr	r3, [fp, #-8]
30008d74:	e2833001 	add	r3, r3, #1
30008d78:	e50b3008 	str	r3, [fp, #-8]
30008d7c:	e51b3008 	ldr	r3, [fp, #-8]
30008d80:	e51b2014 	ldr	r2, [fp, #-20]
30008d84:	e0823003 	add	r3, r2, r3
30008d88:	e5d33000 	ldrb	r3, [r3]
30008d8c:	e3530000 	cmp	r3, #0
30008d90:	1afffff6 	bne	30008d70 <itoa+0x7c>
30008d94:	e51b3008 	ldr	r3, [fp, #-8]
30008d98:	e51b2014 	ldr	r2, [fp, #-20]
30008d9c:	e0820003 	add	r0, r2, r3
30008da0:	e51b1010 	ldr	r1, [fp, #-16]
30008da4:	e59f2054 	ldr	r2, [pc, #84]	; 30008e00 <itoa+0x10c>
30008da8:	e0c3c192 	smull	ip, r3, r2, r1
30008dac:	e1a02143 	asr	r2, r3, #2
30008db0:	e1a03fc1 	asr	r3, r1, #31
30008db4:	e0632002 	rsb	r2, r3, r2
30008db8:	e1a03002 	mov	r3, r2
30008dbc:	e1a03103 	lsl	r3, r3, #2
30008dc0:	e0833002 	add	r3, r3, r2
30008dc4:	e1a03083 	lsl	r3, r3, #1
30008dc8:	e0632001 	rsb	r2, r3, r1
30008dcc:	e20230ff 	and	r3, r2, #255	; 0xff
30008dd0:	e2833030 	add	r3, r3, #48	; 0x30
30008dd4:	e20330ff 	and	r3, r3, #255	; 0xff
30008dd8:	e5c03000 	strb	r3, [r0]
30008ddc:	e51b3008 	ldr	r3, [fp, #-8]
30008de0:	e2833001 	add	r3, r3, #1
30008de4:	e51b2014 	ldr	r2, [fp, #-20]
30008de8:	e0823003 	add	r3, r2, r3
30008dec:	e3a02000 	mov	r2, #0
30008df0:	e5c32000 	strb	r2, [r3]
30008df4:	e24bd004 	sub	sp, fp, #4
30008df8:	e8bd4800 	pop	{fp, lr}
30008dfc:	e12fff1e 	bx	lr
30008e00:	66666667 	strbtvs	r6, [r6], -r7, ror #12

30008e04 <xtoa>:
30008e04:	e92d4800 	push	{fp, lr}
30008e08:	e28db004 	add	fp, sp, #4
30008e0c:	e24dd010 	sub	sp, sp, #16
30008e10:	e50b0010 	str	r0, [fp, #-16]
30008e14:	e50b1014 	str	r1, [fp, #-20]
30008e18:	e51b3010 	ldr	r3, [fp, #-16]
30008e1c:	e353000f 	cmp	r3, #15
30008e20:	ca000014 	bgt	30008e78 <xtoa+0x74>
30008e24:	e51b3010 	ldr	r3, [fp, #-16]
30008e28:	e3530009 	cmp	r3, #9
30008e2c:	ca000006 	bgt	30008e4c <xtoa+0x48>
30008e30:	e51b3010 	ldr	r3, [fp, #-16]
30008e34:	e20330ff 	and	r3, r3, #255	; 0xff
30008e38:	e2833030 	add	r3, r3, #48	; 0x30
30008e3c:	e20320ff 	and	r2, r3, #255	; 0xff
30008e40:	e51b3014 	ldr	r3, [fp, #-20]
30008e44:	e5c32000 	strb	r2, [r3]
30008e48:	ea000005 	b	30008e64 <xtoa+0x60>
30008e4c:	e51b3010 	ldr	r3, [fp, #-16]
30008e50:	e20330ff 	and	r3, r3, #255	; 0xff
30008e54:	e2833057 	add	r3, r3, #87	; 0x57
30008e58:	e20320ff 	and	r2, r3, #255	; 0xff
30008e5c:	e51b3014 	ldr	r3, [fp, #-20]
30008e60:	e5c32000 	strb	r2, [r3]
30008e64:	e51b3014 	ldr	r3, [fp, #-20]
30008e68:	e2833001 	add	r3, r3, #1
30008e6c:	e3a02000 	mov	r2, #0
30008e70:	e5c32000 	strb	r2, [r3]
30008e74:	ea00003c 	b	30008f6c <xtoa+0x168>
30008e78:	e51b3010 	ldr	r3, [fp, #-16]
30008e7c:	e283200f 	add	r2, r3, #15
30008e80:	e3530000 	cmp	r3, #0
30008e84:	b1a03002 	movlt	r3, r2
30008e88:	e1a03243 	asr	r3, r3, #4
30008e8c:	e1a00003 	mov	r0, r3
30008e90:	e51b1014 	ldr	r1, [fp, #-20]
30008e94:	ebffffda 	bl	30008e04 <xtoa>
30008e98:	e3a03000 	mov	r3, #0
30008e9c:	e50b3008 	str	r3, [fp, #-8]
30008ea0:	ea000002 	b	30008eb0 <xtoa+0xac>
30008ea4:	e51b3008 	ldr	r3, [fp, #-8]
30008ea8:	e2833001 	add	r3, r3, #1
30008eac:	e50b3008 	str	r3, [fp, #-8]
30008eb0:	e51b3008 	ldr	r3, [fp, #-8]
30008eb4:	e51b2014 	ldr	r2, [fp, #-20]
30008eb8:	e0823003 	add	r3, r2, r3
30008ebc:	e5d33000 	ldrb	r3, [r3]
30008ec0:	e3530000 	cmp	r3, #0
30008ec4:	1afffff6 	bne	30008ea4 <xtoa+0xa0>
30008ec8:	e51b2010 	ldr	r2, [fp, #-16]
30008ecc:	e1a03fc2 	asr	r3, r2, #31
30008ed0:	e1a03e23 	lsr	r3, r3, #28
30008ed4:	e0822003 	add	r2, r2, r3
30008ed8:	e202200f 	and	r2, r2, #15
30008edc:	e0633002 	rsb	r3, r3, r2
30008ee0:	e3530009 	cmp	r3, #9
30008ee4:	ca00000d 	bgt	30008f20 <xtoa+0x11c>
30008ee8:	e51b3008 	ldr	r3, [fp, #-8]
30008eec:	e51b2014 	ldr	r2, [fp, #-20]
30008ef0:	e0821003 	add	r1, r2, r3
30008ef4:	e51b2010 	ldr	r2, [fp, #-16]
30008ef8:	e1a03fc2 	asr	r3, r2, #31
30008efc:	e1a03e23 	lsr	r3, r3, #28
30008f00:	e0822003 	add	r2, r2, r3
30008f04:	e202200f 	and	r2, r2, #15
30008f08:	e0633002 	rsb	r3, r3, r2
30008f0c:	e20330ff 	and	r3, r3, #255	; 0xff
30008f10:	e2833030 	add	r3, r3, #48	; 0x30
30008f14:	e20330ff 	and	r3, r3, #255	; 0xff
30008f18:	e5c13000 	strb	r3, [r1]
30008f1c:	ea00000c 	b	30008f54 <xtoa+0x150>
30008f20:	e51b3008 	ldr	r3, [fp, #-8]
30008f24:	e51b2014 	ldr	r2, [fp, #-20]
30008f28:	e0821003 	add	r1, r2, r3
30008f2c:	e51b2010 	ldr	r2, [fp, #-16]
30008f30:	e1a03fc2 	asr	r3, r2, #31
30008f34:	e1a03e23 	lsr	r3, r3, #28
30008f38:	e0822003 	add	r2, r2, r3
30008f3c:	e202200f 	and	r2, r2, #15
30008f40:	e0633002 	rsb	r3, r3, r2
30008f44:	e20330ff 	and	r3, r3, #255	; 0xff
30008f48:	e2833057 	add	r3, r3, #87	; 0x57
30008f4c:	e20330ff 	and	r3, r3, #255	; 0xff
30008f50:	e5c13000 	strb	r3, [r1]
30008f54:	e51b3008 	ldr	r3, [fp, #-8]
30008f58:	e2833001 	add	r3, r3, #1
30008f5c:	e51b2014 	ldr	r2, [fp, #-20]
30008f60:	e0823003 	add	r3, r2, r3
30008f64:	e3a02000 	mov	r2, #0
30008f68:	e5c32000 	strb	r2, [r3]
30008f6c:	e24bd004 	sub	sp, fp, #4
30008f70:	e8bd4800 	pop	{fp, lr}
30008f74:	e12fff1e 	bx	lr

30008f78 <uprintf>:
30008f78:	e92d000f 	push	{r0, r1, r2, r3}
30008f7c:	e92d4800 	push	{fp, lr}
30008f80:	e28db004 	add	fp, sp, #4
30008f84:	e24dd030 	sub	sp, sp, #48	; 0x30
30008f88:	e28b3008 	add	r3, fp, #8
30008f8c:	e50b3014 	str	r3, [fp, #-20]
30008f90:	ea000065 	b	3000912c <uprintf+0x1b4>
30008f94:	e59b3004 	ldr	r3, [fp, #4]
30008f98:	e5d33000 	ldrb	r3, [r3]
30008f9c:	e3530025 	cmp	r3, #37	; 0x25
30008fa0:	1a000052 	bne	300090f0 <uprintf+0x178>
30008fa4:	e59b3004 	ldr	r3, [fp, #4]
30008fa8:	e2833001 	add	r3, r3, #1
30008fac:	e58b3004 	str	r3, [fp, #4]
30008fb0:	e59b3004 	ldr	r3, [fp, #4]
30008fb4:	e5d33000 	ldrb	r3, [r3]
30008fb8:	e2433063 	sub	r3, r3, #99	; 0x63
30008fbc:	e3530015 	cmp	r3, #21
30008fc0:	979ff103 	ldrls	pc, [pc, r3, lsl #2]
30008fc4:	ea000054 	b	3000911c <uprintf+0x1a4>
30008fc8:	30009020 	andcc	r9, r0, r0, lsr #32
30008fcc:	30009064 	andcc	r9, r0, r4, rrx
30008fd0:	3000911c 	andcc	r9, r0, ip, lsl r1
30008fd4:	3000911c 	andcc	r9, r0, ip, lsl r1
30008fd8:	3000911c 	andcc	r9, r0, ip, lsl r1
30008fdc:	3000911c 	andcc	r9, r0, ip, lsl r1
30008fe0:	3000911c 	andcc	r9, r0, ip, lsl r1
30008fe4:	3000911c 	andcc	r9, r0, ip, lsl r1
30008fe8:	3000911c 	andcc	r9, r0, ip, lsl r1
30008fec:	3000911c 	andcc	r9, r0, ip, lsl r1
30008ff0:	3000911c 	andcc	r9, r0, ip, lsl r1
30008ff4:	3000911c 	andcc	r9, r0, ip, lsl r1
30008ff8:	3000911c 	andcc	r9, r0, ip, lsl r1
30008ffc:	3000911c 	andcc	r9, r0, ip, lsl r1
30009000:	3000911c 	andcc	r9, r0, ip, lsl r1
30009004:	3000911c 	andcc	r9, r0, ip, lsl r1
30009008:	30009044 	andcc	r9, r0, r4, asr #32
3000900c:	3000911c 	andcc	r9, r0, ip, lsl r1
30009010:	3000911c 	andcc	r9, r0, ip, lsl r1
30009014:	3000911c 	andcc	r9, r0, ip, lsl r1
30009018:	3000911c 	andcc	r9, r0, ip, lsl r1
3000901c:	300090bc 	strhcc	r9, [r0], -ip
30009020:	e51b3014 	ldr	r3, [fp, #-20]
30009024:	e2832004 	add	r2, r3, #4
30009028:	e50b2014 	str	r2, [fp, #-20]
3000902c:	e5933000 	ldr	r3, [r3]
30009030:	e54b300d 	strb	r3, [fp, #-13]
30009034:	e55b300d 	ldrb	r3, [fp, #-13]
30009038:	e1a00003 	mov	r0, r3
3000903c:	ebfffed4 	bl	30008b94 <putc>
30009040:	ea000036 	b	30009120 <uprintf+0x1a8>
30009044:	e51b3014 	ldr	r3, [fp, #-20]
30009048:	e2832004 	add	r2, r3, #4
3000904c:	e50b2014 	str	r2, [fp, #-20]
30009050:	e5933000 	ldr	r3, [r3]
30009054:	e50b3008 	str	r3, [fp, #-8]
30009058:	e51b0008 	ldr	r0, [fp, #-8]
3000905c:	ebfffeee 	bl	30008c1c <uputs>
30009060:	ea00002e 	b	30009120 <uprintf+0x1a8>
30009064:	e51b3014 	ldr	r3, [fp, #-20]
30009068:	e2832004 	add	r2, r3, #4
3000906c:	e50b2014 	str	r2, [fp, #-20]
30009070:	e5933000 	ldr	r3, [r3]
30009074:	e50b300c 	str	r3, [fp, #-12]
30009078:	e51b300c 	ldr	r3, [fp, #-12]
3000907c:	e3530000 	cmp	r3, #0
30009080:	aa000004 	bge	30009098 <uprintf+0x120>
30009084:	e3a0002d 	mov	r0, #45	; 0x2d
30009088:	ebfffec1 	bl	30008b94 <putc>
3000908c:	e51b300c 	ldr	r3, [fp, #-12]
30009090:	e2633000 	rsb	r3, r3, #0
30009094:	e50b300c 	str	r3, [fp, #-12]
30009098:	e24b3034 	sub	r3, fp, #52	; 0x34
3000909c:	e51b000c 	ldr	r0, [fp, #-12]
300090a0:	e1a01003 	mov	r1, r3
300090a4:	ebffff12 	bl	30008cf4 <itoa>
300090a8:	e24b3034 	sub	r3, fp, #52	; 0x34
300090ac:	e1a00003 	mov	r0, r3
300090b0:	ebfffed9 	bl	30008c1c <uputs>
300090b4:	e1a00000 	nop			; (mov r0, r0)
300090b8:	ea000018 	b	30009120 <uprintf+0x1a8>
300090bc:	e51b3014 	ldr	r3, [fp, #-20]
300090c0:	e2832004 	add	r2, r3, #4
300090c4:	e50b2014 	str	r2, [fp, #-20]
300090c8:	e5933000 	ldr	r3, [r3]
300090cc:	e50b300c 	str	r3, [fp, #-12]
300090d0:	e24b3034 	sub	r3, fp, #52	; 0x34
300090d4:	e51b000c 	ldr	r0, [fp, #-12]
300090d8:	e1a01003 	mov	r1, r3
300090dc:	ebffff48 	bl	30008e04 <xtoa>
300090e0:	e24b3034 	sub	r3, fp, #52	; 0x34
300090e4:	e1a00003 	mov	r0, r3
300090e8:	ebfffecb 	bl	30008c1c <uputs>
300090ec:	ea00000b 	b	30009120 <uprintf+0x1a8>
300090f0:	e59b3004 	ldr	r3, [fp, #4]
300090f4:	e5d33000 	ldrb	r3, [r3]
300090f8:	e1a00003 	mov	r0, r3
300090fc:	ebfffea4 	bl	30008b94 <putc>
30009100:	e59b3004 	ldr	r3, [fp, #4]
30009104:	e5d33000 	ldrb	r3, [r3]
30009108:	e353000a 	cmp	r3, #10
3000910c:	1a000003 	bne	30009120 <uprintf+0x1a8>
30009110:	e3a0000d 	mov	r0, #13
30009114:	ebfffe9e 	bl	30008b94 <putc>
30009118:	ea000000 	b	30009120 <uprintf+0x1a8>
3000911c:	e1a00000 	nop			; (mov r0, r0)
30009120:	e59b3004 	ldr	r3, [fp, #4]
30009124:	e2833001 	add	r3, r3, #1
30009128:	e58b3004 	str	r3, [fp, #4]
3000912c:	e59b3004 	ldr	r3, [fp, #4]
30009130:	e5d33000 	ldrb	r3, [r3]
30009134:	e3530000 	cmp	r3, #0
30009138:	1affff95 	bne	30008f94 <uprintf+0x1c>
3000913c:	e3a03000 	mov	r3, #0
30009140:	e1a00003 	mov	r0, r3
30009144:	e24bd004 	sub	sp, fp, #4
30009148:	e8bd4800 	pop	{fp, lr}
3000914c:	e28dd010 	add	sp, sp, #16
30009150:	e12fff1e 	bx	lr

30009154 <beep_init>:
30009154:	e52db004 	push	{fp}		; (str fp, [sp, #-4]!)
30009158:	e28db000 	add	fp, sp, #0
3000915c:	e59f302c 	ldr	r3, [pc, #44]	; 30009190 <beep_init+0x3c>
30009160:	e59f2028 	ldr	r2, [pc, #40]	; 30009190 <beep_init+0x3c>
30009164:	e5922000 	ldr	r2, [r2]
30009168:	e3c22003 	bic	r2, r2, #3
3000916c:	e5832000 	str	r2, [r3]
30009170:	e59f3018 	ldr	r3, [pc, #24]	; 30009190 <beep_init+0x3c>
30009174:	e59f2014 	ldr	r2, [pc, #20]	; 30009190 <beep_init+0x3c>
30009178:	e5922000 	ldr	r2, [r2]
3000917c:	e3822001 	orr	r2, r2, #1
30009180:	e5832000 	str	r2, [r3]
30009184:	e28bd000 	add	sp, fp, #0
30009188:	e8bd0800 	pop	{fp}
3000918c:	e12fff1e 	bx	lr
30009190:	56000010 	undefined instruction 0x56000010

30009194 <beep_run>:
30009194:	e52db004 	push	{fp}		; (str fp, [sp, #-4]!)
30009198:	e28db000 	add	fp, sp, #0
3000919c:	e59f302c 	ldr	r3, [pc, #44]	; 300091d0 <beep_run+0x3c>
300091a0:	e59f2028 	ldr	r2, [pc, #40]	; 300091d0 <beep_run+0x3c>
300091a4:	e5922000 	ldr	r2, [r2]
300091a8:	e3822001 	orr	r2, r2, #1
300091ac:	e5832000 	str	r2, [r3]
300091b0:	e59f3018 	ldr	r3, [pc, #24]	; 300091d0 <beep_run+0x3c>
300091b4:	e5933000 	ldr	r3, [r3]
300091b8:	e59f3010 	ldr	r3, [pc, #16]	; 300091d0 <beep_run+0x3c>
300091bc:	e3a02000 	mov	r2, #0
300091c0:	e5832000 	str	r2, [r3]
300091c4:	e28bd000 	add	sp, fp, #0
300091c8:	e8bd0800 	pop	{fp}
300091cc:	e12fff1e 	bx	lr
300091d0:	56000014 	undefined instruction 0x56000014

300091d4 <led_init>:
300091d4:	e52db004 	push	{fp}		; (str fp, [sp, #-4]!)
300091d8:	e28db000 	add	fp, sp, #0
300091dc:	e59f301c 	ldr	r3, [pc, #28]	; 30009200 <led_init+0x2c>
300091e0:	e3a02b55 	mov	r2, #87040	; 0x15400
300091e4:	e5832000 	str	r2, [r3]
300091e8:	e59f3014 	ldr	r3, [pc, #20]	; 30009204 <led_init+0x30>
300091ec:	e3e02000 	mvn	r2, #0
300091f0:	e5832000 	str	r2, [r3]
300091f4:	e28bd000 	add	sp, fp, #0
300091f8:	e8bd0800 	pop	{fp}
300091fc:	e12fff1e 	bx	lr
30009200:	56000010 	undefined instruction 0x56000010
30009204:	56000014 	undefined instruction 0x56000014

30009208 <led_on>:
30009208:	e52db004 	push	{fp}		; (str fp, [sp, #-4]!)
3000920c:	e28db000 	add	fp, sp, #0
30009210:	e59f3010 	ldr	r3, [pc, #16]	; 30009228 <led_on+0x20>
30009214:	e3a02d05 	mov	r2, #320	; 0x140
30009218:	e5832000 	str	r2, [r3]
3000921c:	e28bd000 	add	sp, fp, #0
30009220:	e8bd0800 	pop	{fp}
30009224:	e12fff1e 	bx	lr
30009228:	56000014 	undefined instruction 0x56000014

3000922c <led_off>:
3000922c:	e52db004 	push	{fp}		; (str fp, [sp, #-4]!)
30009230:	e28db000 	add	fp, sp, #0
30009234:	e59f3010 	ldr	r3, [pc, #16]	; 3000924c <led_off+0x20>
30009238:	e3e02000 	mvn	r2, #0
3000923c:	e5832000 	str	r2, [r3]
30009240:	e28bd000 	add	sp, fp, #0
30009244:	e8bd0800 	pop	{fp}
30009248:	e12fff1e 	bx	lr
3000924c:	56000014 	undefined instruction 0x56000014

30009250 <delay>:
30009250:	e52db004 	push	{fp}		; (str fp, [sp, #-4]!)
30009254:	e28db000 	add	fp, sp, #0
30009258:	e24dd014 	sub	sp, sp, #20
3000925c:	e50b0010 	str	r0, [fp, #-16]
30009260:	e3a03000 	mov	r3, #0
30009264:	e50b300c 	str	r3, [fp, #-12]
30009268:	ea00000c 	b	300092a0 <delay+0x50>
3000926c:	e3a03000 	mov	r3, #0
30009270:	e50b3008 	str	r3, [fp, #-8]
30009274:	ea000002 	b	30009284 <delay+0x34>
30009278:	e51b3008 	ldr	r3, [fp, #-8]
3000927c:	e2833001 	add	r3, r3, #1
30009280:	e50b3008 	str	r3, [fp, #-8]
30009284:	e51b2008 	ldr	r2, [fp, #-8]
30009288:	e59f302c 	ldr	r3, [pc, #44]	; 300092bc <delay+0x6c>
3000928c:	e1520003 	cmp	r2, r3
30009290:	dafffff8 	ble	30009278 <delay+0x28>
30009294:	e51b300c 	ldr	r3, [fp, #-12]
30009298:	e2833001 	add	r3, r3, #1
3000929c:	e50b300c 	str	r3, [fp, #-12]
300092a0:	e51b200c 	ldr	r2, [fp, #-12]
300092a4:	e51b3010 	ldr	r3, [fp, #-16]
300092a8:	e1520003 	cmp	r2, r3
300092ac:	baffffee 	blt	3000926c <delay+0x1c>
300092b0:	e28bd000 	add	sp, fp, #0
300092b4:	e8bd0800 	pop	{fp}
300092b8:	e12fff1e 	bx	lr
300092bc:	0000270f 	andeq	r2, r0, pc, lsl #14

300092c0 <exp16>:
300092c0:	e52db004 	push	{fp}		; (str fp, [sp, #-4]!)
300092c4:	e28db000 	add	fp, sp, #0
300092c8:	e24dd014 	sub	sp, sp, #20
300092cc:	e50b0010 	str	r0, [fp, #-16]
300092d0:	e3a03000 	mov	r3, #0
300092d4:	e50b300c 	str	r3, [fp, #-12]
300092d8:	e3a03001 	mov	r3, #1
300092dc:	e50b3008 	str	r3, [fp, #-8]
300092e0:	e3a03000 	mov	r3, #0
300092e4:	e50b300c 	str	r3, [fp, #-12]
300092e8:	ea000005 	b	30009304 <exp16+0x44>
300092ec:	e51b3008 	ldr	r3, [fp, #-8]
300092f0:	e1a03203 	lsl	r3, r3, #4
300092f4:	e50b3008 	str	r3, [fp, #-8]
300092f8:	e51b300c 	ldr	r3, [fp, #-12]
300092fc:	e2833001 	add	r3, r3, #1
30009300:	e50b300c 	str	r3, [fp, #-12]
30009304:	e51b200c 	ldr	r2, [fp, #-12]
30009308:	e51b3010 	ldr	r3, [fp, #-16]
3000930c:	e1520003 	cmp	r2, r3
30009310:	3afffff5 	bcc	300092ec <exp16+0x2c>
30009314:	e51b3008 	ldr	r3, [fp, #-8]
30009318:	e1a00003 	mov	r0, r3
3000931c:	e28bd000 	add	sp, fp, #0
30009320:	e8bd0800 	pop	{fp}
30009324:	e12fff1e 	bx	lr

30009328 <atox>:
30009328:	e92d4810 	push	{r4, fp, lr}
3000932c:	e28db008 	add	fp, sp, #8
30009330:	e24dd01c 	sub	sp, sp, #28
30009334:	e50b0020 	str	r0, [fp, #-32]
30009338:	e3a03000 	mov	r3, #0
3000933c:	e50b3018 	str	r3, [fp, #-24]
30009340:	e3a03000 	mov	r3, #0
30009344:	e50b3014 	str	r3, [fp, #-20]
30009348:	e3a03000 	mov	r3, #0
3000934c:	e50b3010 	str	r3, [fp, #-16]
30009350:	ea000005 	b	3000936c <atox+0x44>
30009354:	e51b3020 	ldr	r3, [fp, #-32]
30009358:	e2833001 	add	r3, r3, #1
3000935c:	e50b3020 	str	r3, [fp, #-32]
30009360:	e51b3014 	ldr	r3, [fp, #-20]
30009364:	e2833001 	add	r3, r3, #1
30009368:	e50b3014 	str	r3, [fp, #-20]
3000936c:	e51b3020 	ldr	r3, [fp, #-32]
30009370:	e5d33000 	ldrb	r3, [r3]
30009374:	e3530000 	cmp	r3, #0
30009378:	1afffff5 	bne	30009354 <atox+0x2c>
3000937c:	e51b3020 	ldr	r3, [fp, #-32]
30009380:	e2433001 	sub	r3, r3, #1
30009384:	e50b3020 	str	r3, [fp, #-32]
30009388:	e3a03000 	mov	r3, #0
3000938c:	e50b3010 	str	r3, [fp, #-16]
30009390:	ea000010 	b	300093d8 <atox+0xb0>
30009394:	e51b3020 	ldr	r3, [fp, #-32]
30009398:	e5d33000 	ldrb	r3, [r3]
3000939c:	e2433030 	sub	r3, r3, #48	; 0x30
300093a0:	e1a04003 	mov	r4, r3
300093a4:	e51b0010 	ldr	r0, [fp, #-16]
300093a8:	ebffffc4 	bl	300092c0 <exp16>
300093ac:	e1a02000 	mov	r2, r0
300093b0:	e0030492 	mul	r3, r2, r4
300093b4:	e51b2018 	ldr	r2, [fp, #-24]
300093b8:	e0823003 	add	r3, r2, r3
300093bc:	e50b3018 	str	r3, [fp, #-24]
300093c0:	e51b3020 	ldr	r3, [fp, #-32]
300093c4:	e2433001 	sub	r3, r3, #1
300093c8:	e50b3020 	str	r3, [fp, #-32]
300093cc:	e51b3010 	ldr	r3, [fp, #-16]
300093d0:	e2833001 	add	r3, r3, #1
300093d4:	e50b3010 	str	r3, [fp, #-16]
300093d8:	e51b2010 	ldr	r2, [fp, #-16]
300093dc:	e51b3014 	ldr	r3, [fp, #-20]
300093e0:	e1520003 	cmp	r2, r3
300093e4:	3affffea 	bcc	30009394 <atox+0x6c>
300093e8:	e51b3018 	ldr	r3, [fp, #-24]
300093ec:	e1a00003 	mov	r0, r3
300093f0:	e24bd008 	sub	sp, fp, #8
300093f4:	e8bd4810 	pop	{r4, fp, lr}
300093f8:	e12fff1e 	bx	lr

300093fc <atoi>:
300093fc:	e52db004 	push	{fp}		; (str fp, [sp, #-4]!)
30009400:	e28db000 	add	fp, sp, #0
30009404:	e24dd01c 	sub	sp, sp, #28
30009408:	e50b0018 	str	r0, [fp, #-24]
3000940c:	e51b3018 	ldr	r3, [fp, #-24]
30009410:	e50b3010 	str	r3, [fp, #-16]
30009414:	e3a03000 	mov	r3, #0
30009418:	e50b3008 	str	r3, [fp, #-8]
3000941c:	ea000012 	b	3000946c <atoi+0x70>
30009420:	e55b3009 	ldrb	r3, [fp, #-9]
30009424:	e353002f 	cmp	r3, #47	; 0x2f
30009428:	9a00000d 	bls	30009464 <atoi+0x68>
3000942c:	e55b3009 	ldrb	r3, [fp, #-9]
30009430:	e3530039 	cmp	r3, #57	; 0x39
30009434:	8a00000a 	bhi	30009464 <atoi+0x68>
30009438:	e51b2008 	ldr	r2, [fp, #-8]
3000943c:	e1a03002 	mov	r3, r2
30009440:	e1a03103 	lsl	r3, r3, #2
30009444:	e0833002 	add	r3, r3, r2
30009448:	e1a03083 	lsl	r3, r3, #1
3000944c:	e1a02003 	mov	r2, r3
30009450:	e55b3009 	ldrb	r3, [fp, #-9]
30009454:	e2433030 	sub	r3, r3, #48	; 0x30
30009458:	e0823003 	add	r3, r2, r3
3000945c:	e50b3008 	str	r3, [fp, #-8]
30009460:	ea000001 	b	3000946c <atoi+0x70>
30009464:	e3e03000 	mvn	r3, #0
30009468:	ea00000d 	b	300094a4 <atoi+0xa8>
3000946c:	e51b3010 	ldr	r3, [fp, #-16]
30009470:	e5d33000 	ldrb	r3, [r3]
30009474:	e54b3009 	strb	r3, [fp, #-9]
30009478:	e55b3009 	ldrb	r3, [fp, #-9]
3000947c:	e3530000 	cmp	r3, #0
30009480:	03a03000 	moveq	r3, #0
30009484:	13a03001 	movne	r3, #1
30009488:	e20330ff 	and	r3, r3, #255	; 0xff
3000948c:	e51b2010 	ldr	r2, [fp, #-16]
30009490:	e2822001 	add	r2, r2, #1
30009494:	e50b2010 	str	r2, [fp, #-16]
30009498:	e3530000 	cmp	r3, #0
3000949c:	1affffdf 	bne	30009420 <atoi+0x24>
300094a0:	e51b3008 	ldr	r3, [fp, #-8]
300094a4:	e1a00003 	mov	r0, r3
300094a8:	e28bd000 	add	sp, fp, #0
300094ac:	e8bd0800 	pop	{fp}
300094b0:	e12fff1e 	bx	lr

300094b4 <strcpy>:
300094b4:	e52db004 	push	{fp}		; (str fp, [sp, #-4]!)
300094b8:	e28db000 	add	fp, sp, #0
300094bc:	e24dd014 	sub	sp, sp, #20
300094c0:	e50b0010 	str	r0, [fp, #-16]
300094c4:	e50b1014 	str	r1, [fp, #-20]
300094c8:	e51b3010 	ldr	r3, [fp, #-16]
300094cc:	e50b3008 	str	r3, [fp, #-8]
300094d0:	e51b3014 	ldr	r3, [fp, #-20]
300094d4:	e5d32000 	ldrb	r2, [r3]
300094d8:	e51b3010 	ldr	r3, [fp, #-16]
300094dc:	e5c32000 	strb	r2, [r3]
300094e0:	e51b3010 	ldr	r3, [fp, #-16]
300094e4:	e5d33000 	ldrb	r3, [r3]
300094e8:	e3530000 	cmp	r3, #0
300094ec:	03a03000 	moveq	r3, #0
300094f0:	13a03001 	movne	r3, #1
300094f4:	e20330ff 	and	r3, r3, #255	; 0xff
300094f8:	e51b2010 	ldr	r2, [fp, #-16]
300094fc:	e2822001 	add	r2, r2, #1
30009500:	e50b2010 	str	r2, [fp, #-16]
30009504:	e51b2014 	ldr	r2, [fp, #-20]
30009508:	e2822001 	add	r2, r2, #1
3000950c:	e50b2014 	str	r2, [fp, #-20]
30009510:	e3530000 	cmp	r3, #0
30009514:	1affffed 	bne	300094d0 <strcpy+0x1c>
30009518:	e51b3008 	ldr	r3, [fp, #-8]
3000951c:	e1a00003 	mov	r0, r3
30009520:	e28bd000 	add	sp, fp, #0
30009524:	e8bd0800 	pop	{fp}
30009528:	e12fff1e 	bx	lr

3000952c <strncpy>:
3000952c:	e52db004 	push	{fp}		; (str fp, [sp, #-4]!)
30009530:	e28db000 	add	fp, sp, #0
30009534:	e24dd01c 	sub	sp, sp, #28
30009538:	e50b0010 	str	r0, [fp, #-16]
3000953c:	e50b1014 	str	r1, [fp, #-20]
30009540:	e50b2018 	str	r2, [fp, #-24]
30009544:	e51b3010 	ldr	r3, [fp, #-16]
30009548:	e50b3008 	str	r3, [fp, #-8]
3000954c:	e51b3018 	ldr	r3, [fp, #-24]
30009550:	e3530000 	cmp	r3, #0
30009554:	03a03000 	moveq	r3, #0
30009558:	13a03001 	movne	r3, #1
3000955c:	e20330ff 	and	r3, r3, #255	; 0xff
30009560:	e51b2018 	ldr	r2, [fp, #-24]
30009564:	e2422001 	sub	r2, r2, #1
30009568:	e50b2018 	str	r2, [fp, #-24]
3000956c:	e3530000 	cmp	r3, #0
30009570:	0a000011 	beq	300095bc <strncpy+0x90>
30009574:	e51b3014 	ldr	r3, [fp, #-20]
30009578:	e5d32000 	ldrb	r2, [r3]
3000957c:	e51b3010 	ldr	r3, [fp, #-16]
30009580:	e5c32000 	strb	r2, [r3]
30009584:	e51b3010 	ldr	r3, [fp, #-16]
30009588:	e5d33000 	ldrb	r3, [r3]
3000958c:	e3530000 	cmp	r3, #0
30009590:	03a03000 	moveq	r3, #0
30009594:	13a03001 	movne	r3, #1
30009598:	e20330ff 	and	r3, r3, #255	; 0xff
3000959c:	e51b2010 	ldr	r2, [fp, #-16]
300095a0:	e2822001 	add	r2, r2, #1
300095a4:	e50b2010 	str	r2, [fp, #-16]
300095a8:	e51b2014 	ldr	r2, [fp, #-20]
300095ac:	e2822001 	add	r2, r2, #1
300095b0:	e50b2014 	str	r2, [fp, #-20]
300095b4:	e3530000 	cmp	r3, #0
300095b8:	1affffe3 	bne	3000954c <strncpy+0x20>
300095bc:	e51b3008 	ldr	r3, [fp, #-8]
300095c0:	e1a00003 	mov	r0, r3
300095c4:	e28bd000 	add	sp, fp, #0
300095c8:	e8bd0800 	pop	{fp}
300095cc:	e12fff1e 	bx	lr

300095d0 <strcat>:
300095d0:	e52db004 	push	{fp}		; (str fp, [sp, #-4]!)
300095d4:	e28db000 	add	fp, sp, #0
300095d8:	e24dd014 	sub	sp, sp, #20
300095dc:	e50b0010 	str	r0, [fp, #-16]
300095e0:	e50b1014 	str	r1, [fp, #-20]
300095e4:	e51b3010 	ldr	r3, [fp, #-16]
300095e8:	e50b3008 	str	r3, [fp, #-8]
300095ec:	ea000002 	b	300095fc <strcat+0x2c>
300095f0:	e51b3010 	ldr	r3, [fp, #-16]
300095f4:	e2833001 	add	r3, r3, #1
300095f8:	e50b3010 	str	r3, [fp, #-16]
300095fc:	e51b3010 	ldr	r3, [fp, #-16]
30009600:	e5d33000 	ldrb	r3, [r3]
30009604:	e3530000 	cmp	r3, #0
30009608:	1afffff8 	bne	300095f0 <strcat+0x20>
3000960c:	e51b3014 	ldr	r3, [fp, #-20]
30009610:	e5d32000 	ldrb	r2, [r3]
30009614:	e51b3010 	ldr	r3, [fp, #-16]
30009618:	e5c32000 	strb	r2, [r3]
3000961c:	e51b3010 	ldr	r3, [fp, #-16]
30009620:	e5d33000 	ldrb	r3, [r3]
30009624:	e3530000 	cmp	r3, #0
30009628:	03a03000 	moveq	r3, #0
3000962c:	13a03001 	movne	r3, #1
30009630:	e20330ff 	and	r3, r3, #255	; 0xff
30009634:	e51b2010 	ldr	r2, [fp, #-16]
30009638:	e2822001 	add	r2, r2, #1
3000963c:	e50b2010 	str	r2, [fp, #-16]
30009640:	e51b2014 	ldr	r2, [fp, #-20]
30009644:	e2822001 	add	r2, r2, #1
30009648:	e50b2014 	str	r2, [fp, #-20]
3000964c:	e3530000 	cmp	r3, #0
30009650:	1affffed 	bne	3000960c <strcat+0x3c>
30009654:	e51b3008 	ldr	r3, [fp, #-8]
30009658:	e1a00003 	mov	r0, r3
3000965c:	e28bd000 	add	sp, fp, #0
30009660:	e8bd0800 	pop	{fp}
30009664:	e12fff1e 	bx	lr

30009668 <strncat>:
30009668:	e52db004 	push	{fp}		; (str fp, [sp, #-4]!)
3000966c:	e28db000 	add	fp, sp, #0
30009670:	e24dd01c 	sub	sp, sp, #28
30009674:	e50b0010 	str	r0, [fp, #-16]
30009678:	e50b1014 	str	r1, [fp, #-20]
3000967c:	e50b2018 	str	r2, [fp, #-24]
30009680:	e51b3010 	ldr	r3, [fp, #-16]
30009684:	e50b3008 	str	r3, [fp, #-8]
30009688:	e51b3018 	ldr	r3, [fp, #-24]
3000968c:	e3530000 	cmp	r3, #0
30009690:	0a000024 	beq	30009728 <strncat+0xc0>
30009694:	ea000002 	b	300096a4 <strncat+0x3c>
30009698:	e51b3010 	ldr	r3, [fp, #-16]
3000969c:	e2833001 	add	r3, r3, #1
300096a0:	e50b3010 	str	r3, [fp, #-16]
300096a4:	e51b3010 	ldr	r3, [fp, #-16]
300096a8:	e5d33000 	ldrb	r3, [r3]
300096ac:	e3530000 	cmp	r3, #0
300096b0:	1afffff8 	bne	30009698 <strncat+0x30>
300096b4:	ea000009 	b	300096e0 <strncat+0x78>
300096b8:	e51b3018 	ldr	r3, [fp, #-24]
300096bc:	e2433001 	sub	r3, r3, #1
300096c0:	e50b3018 	str	r3, [fp, #-24]
300096c4:	e51b3018 	ldr	r3, [fp, #-24]
300096c8:	e3530000 	cmp	r3, #0
300096cc:	1a000003 	bne	300096e0 <strncat+0x78>
300096d0:	e51b3010 	ldr	r3, [fp, #-16]
300096d4:	e3a02000 	mov	r2, #0
300096d8:	e5c32000 	strb	r2, [r3]
300096dc:	ea000011 	b	30009728 <strncat+0xc0>
300096e0:	e51b3014 	ldr	r3, [fp, #-20]
300096e4:	e5d32000 	ldrb	r2, [r3]
300096e8:	e51b3010 	ldr	r3, [fp, #-16]
300096ec:	e5c32000 	strb	r2, [r3]
300096f0:	e51b3010 	ldr	r3, [fp, #-16]
300096f4:	e5d33000 	ldrb	r3, [r3]
300096f8:	e3530000 	cmp	r3, #0
300096fc:	03a03000 	moveq	r3, #0
30009700:	13a03001 	movne	r3, #1
30009704:	e20330ff 	and	r3, r3, #255	; 0xff
30009708:	e51b2010 	ldr	r2, [fp, #-16]
3000970c:	e2822001 	add	r2, r2, #1
30009710:	e50b2010 	str	r2, [fp, #-16]
30009714:	e51b2014 	ldr	r2, [fp, #-20]
30009718:	e2822001 	add	r2, r2, #1
3000971c:	e50b2014 	str	r2, [fp, #-20]
30009720:	e3530000 	cmp	r3, #0
30009724:	1affffe3 	bne	300096b8 <strncat+0x50>
30009728:	e51b3008 	ldr	r3, [fp, #-8]
3000972c:	e1a00003 	mov	r0, r3
30009730:	e28bd000 	add	sp, fp, #0
30009734:	e8bd0800 	pop	{fp}
30009738:	e12fff1e 	bx	lr

3000973c <strcmp>:
3000973c:	e92d0810 	push	{r4, fp}
30009740:	e28db004 	add	fp, sp, #4
30009744:	e24dd008 	sub	sp, sp, #8
30009748:	e50b0008 	str	r0, [fp, #-8]
3000974c:	e50b100c 	str	r1, [fp, #-12]
30009750:	ea000000 	b	30009758 <strcmp+0x1c>
30009754:	e1a00000 	nop			; (mov r0, r0)
30009758:	e51b3008 	ldr	r3, [fp, #-8]
3000975c:	e5d32000 	ldrb	r2, [r3]
30009760:	e51b300c 	ldr	r3, [fp, #-12]
30009764:	e5d33000 	ldrb	r3, [r3]
30009768:	e0633002 	rsb	r3, r3, r2
3000976c:	e20330ff 	and	r3, r3, #255	; 0xff
30009770:	e1a04003 	mov	r4, r3
30009774:	e1a03c04 	lsl	r3, r4, #24
30009778:	e1a03c43 	asr	r3, r3, #24
3000977c:	e3530000 	cmp	r3, #0
30009780:	03a03000 	moveq	r3, #0
30009784:	13a03001 	movne	r3, #1
30009788:	e20330ff 	and	r3, r3, #255	; 0xff
3000978c:	e51b200c 	ldr	r2, [fp, #-12]
30009790:	e2822001 	add	r2, r2, #1
30009794:	e50b200c 	str	r2, [fp, #-12]
30009798:	e3530000 	cmp	r3, #0
3000979c:	1a00000a 	bne	300097cc <strcmp+0x90>
300097a0:	e51b3008 	ldr	r3, [fp, #-8]
300097a4:	e5d33000 	ldrb	r3, [r3]
300097a8:	e3530000 	cmp	r3, #0
300097ac:	13a03000 	movne	r3, #0
300097b0:	03a03001 	moveq	r3, #1
300097b4:	e20330ff 	and	r3, r3, #255	; 0xff
300097b8:	e51b2008 	ldr	r2, [fp, #-8]
300097bc:	e2822001 	add	r2, r2, #1
300097c0:	e50b2008 	str	r2, [fp, #-8]
300097c4:	e3530000 	cmp	r3, #0
300097c8:	0affffe1 	beq	30009754 <strcmp+0x18>
300097cc:	e1a03c04 	lsl	r3, r4, #24
300097d0:	e1a03c43 	asr	r3, r3, #24
300097d4:	e1a00003 	mov	r0, r3
300097d8:	e24bd004 	sub	sp, fp, #4
300097dc:	e8bd0810 	pop	{r4, fp}
300097e0:	e12fff1e 	bx	lr

300097e4 <strncmp>:
300097e4:	e92d0810 	push	{r4, fp}
300097e8:	e28db004 	add	fp, sp, #4
300097ec:	e24dd010 	sub	sp, sp, #16
300097f0:	e50b0008 	str	r0, [fp, #-8]
300097f4:	e50b100c 	str	r1, [fp, #-12]
300097f8:	e50b2010 	str	r2, [fp, #-16]
300097fc:	e3a04000 	mov	r4, #0
30009800:	ea00001f 	b	30009884 <strncmp+0xa0>
30009804:	e51b3008 	ldr	r3, [fp, #-8]
30009808:	e5d32000 	ldrb	r2, [r3]
3000980c:	e51b300c 	ldr	r3, [fp, #-12]
30009810:	e5d33000 	ldrb	r3, [r3]
30009814:	e0633002 	rsb	r3, r3, r2
30009818:	e20330ff 	and	r3, r3, #255	; 0xff
3000981c:	e1a04003 	mov	r4, r3
30009820:	e1a03c04 	lsl	r3, r4, #24
30009824:	e1a03c43 	asr	r3, r3, #24
30009828:	e3530000 	cmp	r3, #0
3000982c:	03a03000 	moveq	r3, #0
30009830:	13a03001 	movne	r3, #1
30009834:	e20330ff 	and	r3, r3, #255	; 0xff
30009838:	e51b200c 	ldr	r2, [fp, #-12]
3000983c:	e2822001 	add	r2, r2, #1
30009840:	e50b200c 	str	r2, [fp, #-12]
30009844:	e3530000 	cmp	r3, #0
30009848:	1a000010 	bne	30009890 <strncmp+0xac>
3000984c:	e51b3008 	ldr	r3, [fp, #-8]
30009850:	e5d33000 	ldrb	r3, [r3]
30009854:	e3530000 	cmp	r3, #0
30009858:	13a03000 	movne	r3, #0
3000985c:	03a03001 	moveq	r3, #1
30009860:	e20330ff 	and	r3, r3, #255	; 0xff
30009864:	e51b2008 	ldr	r2, [fp, #-8]
30009868:	e2822001 	add	r2, r2, #1
3000986c:	e50b2008 	str	r2, [fp, #-8]
30009870:	e3530000 	cmp	r3, #0
30009874:	1a000005 	bne	30009890 <strncmp+0xac>
30009878:	e51b3010 	ldr	r3, [fp, #-16]
3000987c:	e2433001 	sub	r3, r3, #1
30009880:	e50b3010 	str	r3, [fp, #-16]
30009884:	e51b3010 	ldr	r3, [fp, #-16]
30009888:	e3530000 	cmp	r3, #0
3000988c:	1affffdc 	bne	30009804 <strncmp+0x20>
30009890:	e1a03c04 	lsl	r3, r4, #24
30009894:	e1a03c43 	asr	r3, r3, #24
30009898:	e1a00003 	mov	r0, r3
3000989c:	e24bd004 	sub	sp, fp, #4
300098a0:	e8bd0810 	pop	{r4, fp}
300098a4:	e12fff1e 	bx	lr

300098a8 <strchr>:
300098a8:	e52db004 	push	{fp}		; (str fp, [sp, #-4]!)
300098ac:	e28db000 	add	fp, sp, #0
300098b0:	e24dd00c 	sub	sp, sp, #12
300098b4:	e50b0008 	str	r0, [fp, #-8]
300098b8:	e50b100c 	str	r1, [fp, #-12]
300098bc:	ea000008 	b	300098e4 <strchr+0x3c>
300098c0:	e51b3008 	ldr	r3, [fp, #-8]
300098c4:	e5d33000 	ldrb	r3, [r3]
300098c8:	e3530000 	cmp	r3, #0
300098cc:	1a000001 	bne	300098d8 <strchr+0x30>
300098d0:	e3a03000 	mov	r3, #0
300098d4:	ea000009 	b	30009900 <strchr+0x58>
300098d8:	e51b3008 	ldr	r3, [fp, #-8]
300098dc:	e2833001 	add	r3, r3, #1
300098e0:	e50b3008 	str	r3, [fp, #-8]
300098e4:	e51b3008 	ldr	r3, [fp, #-8]
300098e8:	e5d32000 	ldrb	r2, [r3]
300098ec:	e51b300c 	ldr	r3, [fp, #-12]
300098f0:	e20330ff 	and	r3, r3, #255	; 0xff
300098f4:	e1520003 	cmp	r2, r3
300098f8:	1afffff0 	bne	300098c0 <strchr+0x18>
300098fc:	e51b3008 	ldr	r3, [fp, #-8]
30009900:	e1a00003 	mov	r0, r3
30009904:	e28bd000 	add	sp, fp, #0
30009908:	e8bd0800 	pop	{fp}
3000990c:	e12fff1e 	bx	lr

30009910 <strlen>:
30009910:	e52db004 	push	{fp}		; (str fp, [sp, #-4]!)
30009914:	e28db000 	add	fp, sp, #0
30009918:	e24dd014 	sub	sp, sp, #20
3000991c:	e50b0010 	str	r0, [fp, #-16]
30009920:	e51b3010 	ldr	r3, [fp, #-16]
30009924:	e50b3008 	str	r3, [fp, #-8]
30009928:	ea000002 	b	30009938 <strlen+0x28>
3000992c:	e51b3008 	ldr	r3, [fp, #-8]
30009930:	e2833001 	add	r3, r3, #1
30009934:	e50b3008 	str	r3, [fp, #-8]
30009938:	e51b3008 	ldr	r3, [fp, #-8]
3000993c:	e5d33000 	ldrb	r3, [r3]
30009940:	e3530000 	cmp	r3, #0
30009944:	1afffff8 	bne	3000992c <strlen+0x1c>
30009948:	e51b2008 	ldr	r2, [fp, #-8]
3000994c:	e51b3010 	ldr	r3, [fp, #-16]
30009950:	e0633002 	rsb	r3, r3, r2
30009954:	e1a00003 	mov	r0, r3
30009958:	e28bd000 	add	sp, fp, #0
3000995c:	e8bd0800 	pop	{fp}
30009960:	e12fff1e 	bx	lr

30009964 <strnlen>:
30009964:	e52db004 	push	{fp}		; (str fp, [sp, #-4]!)
30009968:	e28db000 	add	fp, sp, #0
3000996c:	e24dd014 	sub	sp, sp, #20
30009970:	e50b0010 	str	r0, [fp, #-16]
30009974:	e50b1014 	str	r1, [fp, #-20]
30009978:	e51b3010 	ldr	r3, [fp, #-16]
3000997c:	e50b3008 	str	r3, [fp, #-8]
30009980:	ea000002 	b	30009990 <strnlen+0x2c>
30009984:	e51b3008 	ldr	r3, [fp, #-8]
30009988:	e2833001 	add	r3, r3, #1
3000998c:	e50b3008 	str	r3, [fp, #-8]
30009990:	e51b3014 	ldr	r3, [fp, #-20]
30009994:	e3530000 	cmp	r3, #0
30009998:	03a03000 	moveq	r3, #0
3000999c:	13a03001 	movne	r3, #1
300099a0:	e20330ff 	and	r3, r3, #255	; 0xff
300099a4:	e51b2014 	ldr	r2, [fp, #-20]
300099a8:	e2422001 	sub	r2, r2, #1
300099ac:	e50b2014 	str	r2, [fp, #-20]
300099b0:	e3530000 	cmp	r3, #0
300099b4:	0a000003 	beq	300099c8 <strnlen+0x64>
300099b8:	e51b3008 	ldr	r3, [fp, #-8]
300099bc:	e5d33000 	ldrb	r3, [r3]
300099c0:	e3530000 	cmp	r3, #0
300099c4:	1affffee 	bne	30009984 <strnlen+0x20>
300099c8:	e51b2008 	ldr	r2, [fp, #-8]
300099cc:	e51b3010 	ldr	r3, [fp, #-16]
300099d0:	e0633002 	rsb	r3, r3, r2
300099d4:	e1a00003 	mov	r0, r3
300099d8:	e28bd000 	add	sp, fp, #0
300099dc:	e8bd0800 	pop	{fp}
300099e0:	e12fff1e 	bx	lr

300099e4 <strspn>:
300099e4:	e52db004 	push	{fp}		; (str fp, [sp, #-4]!)
300099e8:	e28db000 	add	fp, sp, #0
300099ec:	e24dd01c 	sub	sp, sp, #28
300099f0:	e50b0018 	str	r0, [fp, #-24]
300099f4:	e50b101c 	str	r1, [fp, #-28]
300099f8:	e3a03000 	mov	r3, #0
300099fc:	e50b3008 	str	r3, [fp, #-8]
30009a00:	e51b3018 	ldr	r3, [fp, #-24]
30009a04:	e50b3010 	str	r3, [fp, #-16]
30009a08:	ea00001d 	b	30009a84 <strspn+0xa0>
30009a0c:	e51b301c 	ldr	r3, [fp, #-28]
30009a10:	e50b300c 	str	r3, [fp, #-12]
30009a14:	ea000008 	b	30009a3c <strspn+0x58>
30009a18:	e51b3010 	ldr	r3, [fp, #-16]
30009a1c:	e5d32000 	ldrb	r2, [r3]
30009a20:	e51b300c 	ldr	r3, [fp, #-12]
30009a24:	e5d33000 	ldrb	r3, [r3]
30009a28:	e1520003 	cmp	r2, r3
30009a2c:	0a000007 	beq	30009a50 <strspn+0x6c>
30009a30:	e51b300c 	ldr	r3, [fp, #-12]
30009a34:	e2833001 	add	r3, r3, #1
30009a38:	e50b300c 	str	r3, [fp, #-12]
30009a3c:	e51b300c 	ldr	r3, [fp, #-12]
30009a40:	e5d33000 	ldrb	r3, [r3]
30009a44:	e3530000 	cmp	r3, #0
30009a48:	1afffff2 	bne	30009a18 <strspn+0x34>
30009a4c:	ea000000 	b	30009a54 <strspn+0x70>
30009a50:	e1a00000 	nop			; (mov r0, r0)
30009a54:	e51b300c 	ldr	r3, [fp, #-12]
30009a58:	e5d33000 	ldrb	r3, [r3]
30009a5c:	e3530000 	cmp	r3, #0
30009a60:	1a000001 	bne	30009a6c <strspn+0x88>
30009a64:	e51b3008 	ldr	r3, [fp, #-8]
30009a68:	ea00000a 	b	30009a98 <strspn+0xb4>
30009a6c:	e51b3008 	ldr	r3, [fp, #-8]
30009a70:	e2833001 	add	r3, r3, #1
30009a74:	e50b3008 	str	r3, [fp, #-8]
30009a78:	e51b3010 	ldr	r3, [fp, #-16]
30009a7c:	e2833001 	add	r3, r3, #1
30009a80:	e50b3010 	str	r3, [fp, #-16]
30009a84:	e51b3010 	ldr	r3, [fp, #-16]
30009a88:	e5d33000 	ldrb	r3, [r3]
30009a8c:	e3530000 	cmp	r3, #0
30009a90:	1affffdd 	bne	30009a0c <strspn+0x28>
30009a94:	e51b3008 	ldr	r3, [fp, #-8]
30009a98:	e1a00003 	mov	r0, r3
30009a9c:	e28bd000 	add	sp, fp, #0
30009aa0:	e8bd0800 	pop	{fp}
30009aa4:	e12fff1e 	bx	lr

30009aa8 <strpbrk>:
30009aa8:	e52db004 	push	{fp}		; (str fp, [sp, #-4]!)
30009aac:	e28db000 	add	fp, sp, #0
30009ab0:	e24dd014 	sub	sp, sp, #20
30009ab4:	e50b0010 	str	r0, [fp, #-16]
30009ab8:	e50b1014 	str	r1, [fp, #-20]
30009abc:	e51b3010 	ldr	r3, [fp, #-16]
30009ac0:	e50b300c 	str	r3, [fp, #-12]
30009ac4:	ea000014 	b	30009b1c <strpbrk+0x74>
30009ac8:	e51b3014 	ldr	r3, [fp, #-20]
30009acc:	e50b3008 	str	r3, [fp, #-8]
30009ad0:	ea00000a 	b	30009b00 <strpbrk+0x58>
30009ad4:	e51b300c 	ldr	r3, [fp, #-12]
30009ad8:	e5d32000 	ldrb	r2, [r3]
30009adc:	e51b3008 	ldr	r3, [fp, #-8]
30009ae0:	e5d33000 	ldrb	r3, [r3]
30009ae4:	e1520003 	cmp	r2, r3
30009ae8:	1a000001 	bne	30009af4 <strpbrk+0x4c>
30009aec:	e51b300c 	ldr	r3, [fp, #-12]
30009af0:	ea00000e 	b	30009b30 <strpbrk+0x88>
30009af4:	e51b3008 	ldr	r3, [fp, #-8]
30009af8:	e2833001 	add	r3, r3, #1
30009afc:	e50b3008 	str	r3, [fp, #-8]
30009b00:	e51b3008 	ldr	r3, [fp, #-8]
30009b04:	e5d33000 	ldrb	r3, [r3]
30009b08:	e3530000 	cmp	r3, #0
30009b0c:	1afffff0 	bne	30009ad4 <strpbrk+0x2c>
30009b10:	e51b300c 	ldr	r3, [fp, #-12]
30009b14:	e2833001 	add	r3, r3, #1
30009b18:	e50b300c 	str	r3, [fp, #-12]
30009b1c:	e51b300c 	ldr	r3, [fp, #-12]
30009b20:	e5d33000 	ldrb	r3, [r3]
30009b24:	e3530000 	cmp	r3, #0
30009b28:	1affffe6 	bne	30009ac8 <strpbrk+0x20>
30009b2c:	e3a03000 	mov	r3, #0
30009b30:	e1a00003 	mov	r0, r3
30009b34:	e28bd000 	add	sp, fp, #0
30009b38:	e8bd0800 	pop	{fp}
30009b3c:	e12fff1e 	bx	lr

30009b40 <memset>:
30009b40:	e52db004 	push	{fp}		; (str fp, [sp, #-4]!)
30009b44:	e28db000 	add	fp, sp, #0
30009b48:	e24dd01c 	sub	sp, sp, #28
30009b4c:	e50b0010 	str	r0, [fp, #-16]
30009b50:	e50b1014 	str	r1, [fp, #-20]
30009b54:	e50b2018 	str	r2, [fp, #-24]
30009b58:	e51b3010 	ldr	r3, [fp, #-16]
30009b5c:	e50b3008 	str	r3, [fp, #-8]
30009b60:	ea000006 	b	30009b80 <memset+0x40>
30009b64:	e51b3014 	ldr	r3, [fp, #-20]
30009b68:	e20320ff 	and	r2, r3, #255	; 0xff
30009b6c:	e51b3008 	ldr	r3, [fp, #-8]
30009b70:	e5c32000 	strb	r2, [r3]
30009b74:	e51b3008 	ldr	r3, [fp, #-8]
30009b78:	e2833001 	add	r3, r3, #1
30009b7c:	e50b3008 	str	r3, [fp, #-8]
30009b80:	e51b3018 	ldr	r3, [fp, #-24]
30009b84:	e3530000 	cmp	r3, #0
30009b88:	03a03000 	moveq	r3, #0
30009b8c:	13a03001 	movne	r3, #1
30009b90:	e20330ff 	and	r3, r3, #255	; 0xff
30009b94:	e51b2018 	ldr	r2, [fp, #-24]
30009b98:	e2422001 	sub	r2, r2, #1
30009b9c:	e50b2018 	str	r2, [fp, #-24]
30009ba0:	e3530000 	cmp	r3, #0
30009ba4:	1affffee 	bne	30009b64 <memset+0x24>
30009ba8:	e51b3010 	ldr	r3, [fp, #-16]
30009bac:	e1a00003 	mov	r0, r3
30009bb0:	e28bd000 	add	sp, fp, #0
30009bb4:	e8bd0800 	pop	{fp}
30009bb8:	e12fff1e 	bx	lr

30009bbc <memcpy>:
30009bbc:	e52db004 	push	{fp}		; (str fp, [sp, #-4]!)
30009bc0:	e28db000 	add	fp, sp, #0
30009bc4:	e24dd01c 	sub	sp, sp, #28
30009bc8:	e50b0010 	str	r0, [fp, #-16]
30009bcc:	e50b1014 	str	r1, [fp, #-20]
30009bd0:	e50b2018 	str	r2, [fp, #-24]
30009bd4:	e51b3010 	ldr	r3, [fp, #-16]
30009bd8:	e50b300c 	str	r3, [fp, #-12]
30009bdc:	e51b3014 	ldr	r3, [fp, #-20]
30009be0:	e50b3008 	str	r3, [fp, #-8]
30009be4:	ea000009 	b	30009c10 <memcpy+0x54>
30009be8:	e51b3008 	ldr	r3, [fp, #-8]
30009bec:	e5d32000 	ldrb	r2, [r3]
30009bf0:	e51b300c 	ldr	r3, [fp, #-12]
30009bf4:	e5c32000 	strb	r2, [r3]
30009bf8:	e51b300c 	ldr	r3, [fp, #-12]
30009bfc:	e2833001 	add	r3, r3, #1
30009c00:	e50b300c 	str	r3, [fp, #-12]
30009c04:	e51b3008 	ldr	r3, [fp, #-8]
30009c08:	e2833001 	add	r3, r3, #1
30009c0c:	e50b3008 	str	r3, [fp, #-8]
30009c10:	e51b3018 	ldr	r3, [fp, #-24]
30009c14:	e3530000 	cmp	r3, #0
30009c18:	03a03000 	moveq	r3, #0
30009c1c:	13a03001 	movne	r3, #1
30009c20:	e20330ff 	and	r3, r3, #255	; 0xff
30009c24:	e51b2018 	ldr	r2, [fp, #-24]
30009c28:	e2422001 	sub	r2, r2, #1
30009c2c:	e50b2018 	str	r2, [fp, #-24]
30009c30:	e3530000 	cmp	r3, #0
30009c34:	1affffeb 	bne	30009be8 <memcpy+0x2c>
30009c38:	e51b3010 	ldr	r3, [fp, #-16]
30009c3c:	e1a00003 	mov	r0, r3
30009c40:	e28bd000 	add	sp, fp, #0
30009c44:	e8bd0800 	pop	{fp}
30009c48:	e12fff1e 	bx	lr

30009c4c <memmove>:
30009c4c:	e52db004 	push	{fp}		; (str fp, [sp, #-4]!)
30009c50:	e28db000 	add	fp, sp, #0
30009c54:	e24dd01c 	sub	sp, sp, #28
30009c58:	e50b0010 	str	r0, [fp, #-16]
30009c5c:	e50b1014 	str	r1, [fp, #-20]
30009c60:	e50b2018 	str	r2, [fp, #-24]
30009c64:	e51b2010 	ldr	r2, [fp, #-16]
30009c68:	e51b3014 	ldr	r3, [fp, #-20]
30009c6c:	e1520003 	cmp	r2, r3
30009c70:	8a000019 	bhi	30009cdc <memmove+0x90>
30009c74:	e51b3010 	ldr	r3, [fp, #-16]
30009c78:	e50b300c 	str	r3, [fp, #-12]
30009c7c:	e51b3014 	ldr	r3, [fp, #-20]
30009c80:	e50b3008 	str	r3, [fp, #-8]
30009c84:	ea000009 	b	30009cb0 <memmove+0x64>
30009c88:	e51b3008 	ldr	r3, [fp, #-8]
30009c8c:	e5d32000 	ldrb	r2, [r3]
30009c90:	e51b300c 	ldr	r3, [fp, #-12]
30009c94:	e5c32000 	strb	r2, [r3]
30009c98:	e51b300c 	ldr	r3, [fp, #-12]
30009c9c:	e2833001 	add	r3, r3, #1
30009ca0:	e50b300c 	str	r3, [fp, #-12]
30009ca4:	e51b3008 	ldr	r3, [fp, #-8]
30009ca8:	e2833001 	add	r3, r3, #1
30009cac:	e50b3008 	str	r3, [fp, #-8]
30009cb0:	e51b3018 	ldr	r3, [fp, #-24]
30009cb4:	e3530000 	cmp	r3, #0
30009cb8:	03a03000 	moveq	r3, #0
30009cbc:	13a03001 	movne	r3, #1
30009cc0:	e20330ff 	and	r3, r3, #255	; 0xff
30009cc4:	e51b2018 	ldr	r2, [fp, #-24]
30009cc8:	e2422001 	sub	r2, r2, #1
30009ccc:	e50b2018 	str	r2, [fp, #-24]
30009cd0:	e3530000 	cmp	r3, #0
30009cd4:	1affffeb 	bne	30009c88 <memmove+0x3c>
30009cd8:	ea00001c 	b	30009d50 <memmove+0x104>
30009cdc:	e51b2010 	ldr	r2, [fp, #-16]
30009ce0:	e51b3018 	ldr	r3, [fp, #-24]
30009ce4:	e0823003 	add	r3, r2, r3
30009ce8:	e50b300c 	str	r3, [fp, #-12]
30009cec:	e51b2014 	ldr	r2, [fp, #-20]
30009cf0:	e51b3018 	ldr	r3, [fp, #-24]
30009cf4:	e0823003 	add	r3, r2, r3
30009cf8:	e50b3008 	str	r3, [fp, #-8]
30009cfc:	ea000009 	b	30009d28 <memmove+0xdc>
30009d00:	e51b300c 	ldr	r3, [fp, #-12]
30009d04:	e2433001 	sub	r3, r3, #1
30009d08:	e50b300c 	str	r3, [fp, #-12]
30009d0c:	e51b3008 	ldr	r3, [fp, #-8]
30009d10:	e2433001 	sub	r3, r3, #1
30009d14:	e50b3008 	str	r3, [fp, #-8]
30009d18:	e51b3008 	ldr	r3, [fp, #-8]
30009d1c:	e5d32000 	ldrb	r2, [r3]
30009d20:	e51b300c 	ldr	r3, [fp, #-12]
30009d24:	e5c32000 	strb	r2, [r3]
30009d28:	e51b3018 	ldr	r3, [fp, #-24]
30009d2c:	e3530000 	cmp	r3, #0
30009d30:	03a03000 	moveq	r3, #0
30009d34:	13a03001 	movne	r3, #1
30009d38:	e20330ff 	and	r3, r3, #255	; 0xff
30009d3c:	e51b2018 	ldr	r2, [fp, #-24]
30009d40:	e2422001 	sub	r2, r2, #1
30009d44:	e50b2018 	str	r2, [fp, #-24]
30009d48:	e3530000 	cmp	r3, #0
30009d4c:	1affffeb 	bne	30009d00 <memmove+0xb4>
30009d50:	e51b3010 	ldr	r3, [fp, #-16]
30009d54:	e1a00003 	mov	r0, r3
30009d58:	e28bd000 	add	sp, fp, #0
30009d5c:	e8bd0800 	pop	{fp}
30009d60:	e12fff1e 	bx	lr

30009d64 <memcmp>:
30009d64:	e52db004 	push	{fp}		; (str fp, [sp, #-4]!)
30009d68:	e28db000 	add	fp, sp, #0
30009d6c:	e24dd024 	sub	sp, sp, #36	; 0x24
30009d70:	e50b0018 	str	r0, [fp, #-24]
30009d74:	e50b101c 	str	r1, [fp, #-28]
30009d78:	e50b2020 	str	r2, [fp, #-32]
30009d7c:	e3a03000 	mov	r3, #0
30009d80:	e50b3008 	str	r3, [fp, #-8]
30009d84:	e51b3018 	ldr	r3, [fp, #-24]
30009d88:	e50b3010 	str	r3, [fp, #-16]
30009d8c:	e51b301c 	ldr	r3, [fp, #-28]
30009d90:	e50b300c 	str	r3, [fp, #-12]
30009d94:	ea000012 	b	30009de4 <memcmp+0x80>
30009d98:	e51b3010 	ldr	r3, [fp, #-16]
30009d9c:	e5d33000 	ldrb	r3, [r3]
30009da0:	e1a02003 	mov	r2, r3
30009da4:	e51b300c 	ldr	r3, [fp, #-12]
30009da8:	e5d33000 	ldrb	r3, [r3]
30009dac:	e0633002 	rsb	r3, r3, r2
30009db0:	e50b3008 	str	r3, [fp, #-8]
30009db4:	e51b3008 	ldr	r3, [fp, #-8]
30009db8:	e3530000 	cmp	r3, #0
30009dbc:	1a00000c 	bne	30009df4 <memcmp+0x90>
30009dc0:	e51b3010 	ldr	r3, [fp, #-16]
30009dc4:	e2833001 	add	r3, r3, #1
30009dc8:	e50b3010 	str	r3, [fp, #-16]
30009dcc:	e51b300c 	ldr	r3, [fp, #-12]
30009dd0:	e2833001 	add	r3, r3, #1
30009dd4:	e50b300c 	str	r3, [fp, #-12]
30009dd8:	e51b3020 	ldr	r3, [fp, #-32]
30009ddc:	e2433001 	sub	r3, r3, #1
30009de0:	e50b3020 	str	r3, [fp, #-32]
30009de4:	e51b3020 	ldr	r3, [fp, #-32]
30009de8:	e3530000 	cmp	r3, #0
30009dec:	caffffe9 	bgt	30009d98 <memcmp+0x34>
30009df0:	ea000000 	b	30009df8 <memcmp+0x94>
30009df4:	e1a00000 	nop			; (mov r0, r0)
30009df8:	e51b3008 	ldr	r3, [fp, #-8]
30009dfc:	e1a00003 	mov	r0, r3
30009e00:	e28bd000 	add	sp, fp, #0
30009e04:	e8bd0800 	pop	{fp}
30009e08:	e12fff1e 	bx	lr

30009e0c <memscan>:
30009e0c:	e52db004 	push	{fp}		; (str fp, [sp, #-4]!)
30009e10:	e28db000 	add	fp, sp, #0
30009e14:	e24dd01c 	sub	sp, sp, #28
30009e18:	e50b0010 	str	r0, [fp, #-16]
30009e1c:	e50b1014 	str	r1, [fp, #-20]
30009e20:	e50b2018 	str	r2, [fp, #-24]
30009e24:	e51b3010 	ldr	r3, [fp, #-16]
30009e28:	e50b3008 	str	r3, [fp, #-8]
30009e2c:	ea00000d 	b	30009e68 <memscan+0x5c>
30009e30:	e51b3008 	ldr	r3, [fp, #-8]
30009e34:	e5d33000 	ldrb	r3, [r3]
30009e38:	e1a02003 	mov	r2, r3
30009e3c:	e51b3014 	ldr	r3, [fp, #-20]
30009e40:	e1520003 	cmp	r2, r3
30009e44:	1a000001 	bne	30009e50 <memscan+0x44>
30009e48:	e51b3008 	ldr	r3, [fp, #-8]
30009e4c:	ea000009 	b	30009e78 <memscan+0x6c>
30009e50:	e51b3008 	ldr	r3, [fp, #-8]
30009e54:	e2833001 	add	r3, r3, #1
30009e58:	e50b3008 	str	r3, [fp, #-8]
30009e5c:	e51b3018 	ldr	r3, [fp, #-24]
30009e60:	e2433001 	sub	r3, r3, #1
30009e64:	e50b3018 	str	r3, [fp, #-24]
30009e68:	e51b3018 	ldr	r3, [fp, #-24]
30009e6c:	e3530000 	cmp	r3, #0
30009e70:	1affffee 	bne	30009e30 <memscan+0x24>
30009e74:	e51b3008 	ldr	r3, [fp, #-8]
30009e78:	e1a00003 	mov	r0, r3
30009e7c:	e28bd000 	add	sp, fp, #0
30009e80:	e8bd0800 	pop	{fp}
30009e84:	e12fff1e 	bx	lr

30009e88 <strstr>:
30009e88:	e92d4800 	push	{fp, lr}
30009e8c:	e28db004 	add	fp, sp, #4
30009e90:	e24dd010 	sub	sp, sp, #16
30009e94:	e50b0010 	str	r0, [fp, #-16]
30009e98:	e50b1014 	str	r1, [fp, #-20]
30009e9c:	e51b0014 	ldr	r0, [fp, #-20]
30009ea0:	ebfffe9a 	bl	30009910 <strlen>
30009ea4:	e1a03000 	mov	r3, r0
30009ea8:	e50b3008 	str	r3, [fp, #-8]
30009eac:	e51b3008 	ldr	r3, [fp, #-8]
30009eb0:	e3530000 	cmp	r3, #0
30009eb4:	1a000001 	bne	30009ec0 <strstr+0x38>
30009eb8:	e51b3010 	ldr	r3, [fp, #-16]
30009ebc:	ea000018 	b	30009f24 <strstr+0x9c>
30009ec0:	e51b0010 	ldr	r0, [fp, #-16]
30009ec4:	ebfffe91 	bl	30009910 <strlen>
30009ec8:	e1a03000 	mov	r3, r0
30009ecc:	e50b300c 	str	r3, [fp, #-12]
30009ed0:	ea00000e 	b	30009f10 <strstr+0x88>
30009ed4:	e51b300c 	ldr	r3, [fp, #-12]
30009ed8:	e2433001 	sub	r3, r3, #1
30009edc:	e50b300c 	str	r3, [fp, #-12]
30009ee0:	e51b0010 	ldr	r0, [fp, #-16]
30009ee4:	e51b1014 	ldr	r1, [fp, #-20]
30009ee8:	e51b2008 	ldr	r2, [fp, #-8]
30009eec:	ebffff9c 	bl	30009d64 <memcmp>
30009ef0:	e1a03000 	mov	r3, r0
30009ef4:	e3530000 	cmp	r3, #0
30009ef8:	1a000001 	bne	30009f04 <strstr+0x7c>
30009efc:	e51b3010 	ldr	r3, [fp, #-16]
30009f00:	ea000007 	b	30009f24 <strstr+0x9c>
30009f04:	e51b3010 	ldr	r3, [fp, #-16]
30009f08:	e2833001 	add	r3, r3, #1
30009f0c:	e50b3010 	str	r3, [fp, #-16]
30009f10:	e51b200c 	ldr	r2, [fp, #-12]
30009f14:	e51b3008 	ldr	r3, [fp, #-8]
30009f18:	e1520003 	cmp	r2, r3
30009f1c:	aaffffec 	bge	30009ed4 <strstr+0x4c>
30009f20:	e3a03000 	mov	r3, #0
30009f24:	e1a00003 	mov	r0, r3
30009f28:	e24bd004 	sub	sp, fp, #4
30009f2c:	e8bd4800 	pop	{fp, lr}
30009f30:	e12fff1e 	bx	lr

30009f34 <memchr>:
30009f34:	e52db004 	push	{fp}		; (str fp, [sp, #-4]!)
30009f38:	e28db000 	add	fp, sp, #0
30009f3c:	e24dd01c 	sub	sp, sp, #28
30009f40:	e50b0010 	str	r0, [fp, #-16]
30009f44:	e50b1014 	str	r1, [fp, #-20]
30009f48:	e50b2018 	str	r2, [fp, #-24]
30009f4c:	e51b3010 	ldr	r3, [fp, #-16]
30009f50:	e50b3008 	str	r3, [fp, #-8]
30009f54:	ea00000f 	b	30009f98 <memchr+0x64>
30009f58:	e51b3014 	ldr	r3, [fp, #-20]
30009f5c:	e20320ff 	and	r2, r3, #255	; 0xff
30009f60:	e51b3008 	ldr	r3, [fp, #-8]
30009f64:	e5d33000 	ldrb	r3, [r3]
30009f68:	e1520003 	cmp	r2, r3
30009f6c:	13a03000 	movne	r3, #0
30009f70:	03a03001 	moveq	r3, #1
30009f74:	e20330ff 	and	r3, r3, #255	; 0xff
30009f78:	e51b2008 	ldr	r2, [fp, #-8]
30009f7c:	e2822001 	add	r2, r2, #1
30009f80:	e50b2008 	str	r2, [fp, #-8]
30009f84:	e3530000 	cmp	r3, #0
30009f88:	0a000002 	beq	30009f98 <memchr+0x64>
30009f8c:	e51b3008 	ldr	r3, [fp, #-8]
30009f90:	e2433001 	sub	r3, r3, #1
30009f94:	ea00000a 	b	30009fc4 <memchr+0x90>
30009f98:	e51b3018 	ldr	r3, [fp, #-24]
30009f9c:	e3530000 	cmp	r3, #0
30009fa0:	03a03000 	moveq	r3, #0
30009fa4:	13a03001 	movne	r3, #1
30009fa8:	e20330ff 	and	r3, r3, #255	; 0xff
30009fac:	e51b2018 	ldr	r2, [fp, #-24]
30009fb0:	e2422001 	sub	r2, r2, #1
30009fb4:	e50b2018 	str	r2, [fp, #-24]
30009fb8:	e3530000 	cmp	r3, #0
30009fbc:	1affffe5 	bne	30009f58 <memchr+0x24>
30009fc0:	e3a03000 	mov	r3, #0
30009fc4:	e1a00003 	mov	r0, r3
30009fc8:	e28bd000 	add	sp, fp, #0
30009fcc:	e8bd0800 	pop	{fp}
30009fd0:	e12fff1e 	bx	lr

Disassembly of section .rodata:

30009fd4 <.rodata>:
30009fd4:	253d2069 	ldrcs	r2, [sp, #-105]!	; 0x69
30009fd8:	203a2063 	eorscs	r2, sl, r3, rrx
30009fdc:	000a6425 	andeq	r6, sl, r5, lsr #8
30009fe0:	0064656c 	rsbeq	r6, r4, ip, ror #10
30009fe4:	20646d63 	rsbcs	r6, r4, r3, ror #26
30009fe8:	69207325 	stmdbvs	r0!, {r0, r2, r5, r8, r9, ip, sp, lr}
30009fec:	6f6e2073 	svcvs	0x006e2073
30009ff0:	75732074 	ldrbvc	r2, [r3, #-116]!	; 0x74
30009ff4:	726f7070 	rsbvc	r7, pc, #112	; 0x70
30009ff8:	0a646574 	beq	319235d0 <bss_end+0x19195a4>
30009ffc:	00000000 	andeq	r0, r0, r0
3000a000:	253a4350 	ldrcs	r4, [sl, #-848]!	; 0x350
3000a004:	00000a78 	andeq	r0, r0, r8, ror sl
3000a008:	6d65645b 	cfstrdvs	mvd6, [r5, #-364]!	; 0xfffffe94
3000a00c:	6c656e6f 	stclvs	14, cr6, [r5], #-444	; 0xfffffe44
3000a010:	614d4066 	cmpvs	sp, r6, rrx
3000a014:	78654864 	stmdavc	r5!, {r2, r5, r6, fp, lr}^
3000a018:	20235d20 	eorcs	r5, r3, r0, lsr #26
3000a01c:	00000000 	andeq	r0, r0, r0
3000a020:	6c6c6568 	cfstr64vs	mvdx6, [ip], #-416	; 0xfffffe60
3000a024:	7269206f 	rsbvc	r2, r9, #111	; 0x6f
3000a028:	000a0d71 	andeq	r0, sl, r1, ror sp

Disassembly of section .ARM.attributes:

00000000 <.ARM.attributes>:
   0:	00002541 	andeq	r2, r0, r1, asr #10
   4:	61656100 	cmnvs	r5, r0, lsl #2
   8:	01006962 	tsteq	r0, r2, ror #18
   c:	0000001b 	andeq	r0, r0, fp, lsl r0
  10:	00543405 	subseq	r3, r4, r5, lsl #8
  14:	01080206 	tsteq	r8, r6, lsl #4
  18:	04120109 	ldreq	r0, [r2], #-265	; 0x109
  1c:	01150114 	tsteq	r5, r4, lsl r1
  20:	01180317 	tsteq	r8, r7, lsl r3
  24:	Address 0x00000024 is out of bounds.


Disassembly of section .comment:

00000000 <.comment>:
   0:	3a434347 	bcc	10d0d24 <_start-0x2ef372dc>
   4:	74632820 	strbtvc	r2, [r3], #-2080	; 0x820
   8:	312d676e 	teqcc	sp, lr, ror #14
   c:	312e362e 	teqcc	lr, lr, lsr #12
  10:	2e342029 	cdpcs	0, 3, cr2, cr4, cr9, {1}
  14:	00332e34 	eorseq	r2, r3, r4, lsr lr

Disassembly of section .debug_line:

00000000 <.debug_line>:
   0:	0000008f 	andeq	r0, r0, pc, lsl #1
   4:	00230002 	eoreq	r0, r3, r2
   8:	01020000 	tsteq	r2, r0
   c:	000d0efb 	strdeq	r0, [sp], -fp
  10:	01010101 	tsteq	r1, r1, lsl #2
  14:	01000000 	tsteq	r0, r0
  18:	62010000 	andvs	r0, r1, #0
  1c:	00746f6f 	rsbseq	r6, r4, pc, ror #30
  20:	61747300 	cmnvs	r4, r0, lsl #6
  24:	532e7472 	teqpl	lr, #1912602624	; 0x72000000
  28:	00000100 	andeq	r0, r0, r0, lsl #2
  2c:	02050000 	andeq	r0, r5, #0
  30:	30008000 	andcc	r8, r0, r0
  34:	2f2f2f16 	svccs	0x002f2f16
  38:	2f2f2f2f 	svccs	0x002f2f2f
  3c:	31313131 	teqcc	r1, r1, lsr r1
  40:	2f2f3131 	svccs	0x002f3131
  44:	2f343130 	svccs	0x00343130
  48:	2f2f2f2f 	svccs	0x002f2f2f
  4c:	2f2f2f2f 	svccs	0x002f2f2f
  50:	2f2f322f 	svccs	0x002f322f
  54:	2f332f2f 	svccs	0x00332f2f
  58:	2f322f2f 	svccs	0x00322f2f
  5c:	2f352f2f 	svccs	0x00352f2f
  60:	2f2f2f2f 	svccs	0x002f2f2f
  64:	2f2f2f30 	svccs	0x002f2f30
  68:	2f2f2f32 	svccs	0x002f2f32
  6c:	4b2f332f 	blmi	bccd30 <_start-0x2f43b2d0>
  70:	2f2f2f30 	svccs	0x002f2f30
  74:	0814032f 	ldmdaeq	r4, {r0, r1, r2, r3, r5, r8, r9}
  78:	2f2f2fe4 	svccs	0x002f2fe4
  7c:	2f2f2f2f 	svccs	0x002f2f2f
  80:	2f2f2f31 	svccs	0x002f2f31
  84:	2f2f322f 	svccs	0x002f322f
  88:	2f2f312f 	svccs	0x002f312f
  8c:	12022f2f 	andne	r2, r2, #188	; 0xbc
  90:	6f010100 	svcvs	0x00010100
  94:	02000000 	andeq	r0, r0, #0
  98:	00002200 	andeq	r2, r0, r0, lsl #4
  9c:	fb010200 	blx	408a6 <_start-0x2ffc775a>
  a0:	01000d0e 	tsteq	r0, lr, lsl #26
  a4:	00010101 	andeq	r0, r1, r1, lsl #2
  a8:	00010000 	andeq	r0, r1, r0
  ac:	6e690100 	powvse	f0, f1, f0
  b0:	00007469 	andeq	r7, r0, r9, ror #8
  b4:	6e69616d 	powvsez	f6, f1, #5.0
  b8:	0100632e 	tsteq	r0, lr, lsr #6
  bc:	00000000 	andeq	r0, r0, r0
  c0:	81c00205 	bichi	r0, r0, r5, lsl #4
  c4:	16033000 	strne	r3, [r3], -r0
  c8:	0868a001 	stmdaeq	r8!, {r0, sp, pc}^
  cc:	4c2108e5 	stcmi	8, cr0, [r1], #-916	; 0xfffffc6c
  d0:	c22e7a03 	eorgt	r7, lr, #12288	; 0x3000
  d4:	84d79f85 	ldrbhi	r9, [r7], #3973	; 0xf85
  d8:	4b69a083 	blmi	1a682ec <_start-0x2e59fd14>
  dc:	30304d4b 	eorscc	r4, r0, fp, asr #26
  e0:	d9a04b86 	stmible	r0!, {r1, r2, r7, r8, r9, fp, lr}
  e4:	2402e608 	strcs	lr, [r2], #-1544	; 0x608
  e8:	24023210 	strcs	r3, [r2], #-528	; 0x210
  ec:	673d0814 	undefined instruction 0x673d0814
  f0:	034a7503 	movteq	r7, #42243	; 0xa503
  f4:	0858080f 	ldmdaeq	r8, {r0, r1, r2, r3, fp}^
  f8:	a4bb673e 	ldrtge	r6, [fp], #1854	; 0x73e
  fc:	bd67834b 	stcllt	3, cr8, [r7, #-300]!	; 0xfffffed4
 100:	0006024c 	andeq	r0, r6, ip, asr #4
 104:	00940101 	addseq	r0, r4, r1, lsl #2
 108:	00020000 	andeq	r0, r2, r0
 10c:	00000022 	andeq	r0, r0, r2, lsr #32
 110:	0efb0102 	cdpeq	1, 15, cr0, cr11, cr2, {0}
 114:	0101000d 	tsteq	r1, sp
 118:	00000101 	andeq	r0, r0, r1, lsl #2
 11c:	00000100 	andeq	r0, r0, r0, lsl #2
 120:	696e6901 	stmdbvs	lr!, {r0, r8, fp, sp, lr}^
 124:	6e000074 	mcrvs	0, 0, r0, cr0, cr4, {3}
 128:	2e646e61 	cdpcs	14, 6, cr6, cr4, cr1, {3}
 12c:	00010063 	andeq	r0, r1, r3, rrx
 130:	05000000 	streq	r0, [r0]
 134:	00853c02 	addeq	r3, r5, r2, lsl #24
 138:	010e0330 	tsteq	lr, r0, lsr r3
 13c:	4b859f4b 	blmi	fe167e70 <bss_end+0xce15de44>
 140:	d74b859f 	undefined instruction 0xd74b859f
 144:	86838385 	strhi	r8, [r3], r5, lsl #7
 148:	4b868383 	blmi	fe1a0f5c <bss_end+0xce196f30>
 14c:	314c86bb 	strhcc	r8, [ip, #-107]	; 0xffffff95
 150:	2f314d31 	svccs	0x00314d31
 154:	68684b6a 	stmdavs	r8!, {r1, r3, r5, r6, r8, r9, fp, lr}^
 158:	4c9fa22f 	lfmmi	f2, 1, [pc], {47}	; (ldcmi 2, cr10, [pc], {47})	; 0x2f
 15c:	4b4d3131 	blmi	134c628 <_start-0x2ecbb9d8>
 160:	a19f834d 	orrsge	r8, pc, sp, asr #6
 164:	d468314d 	strbtle	r3, [r8], #-333	; 0x14d
 168:	9fa130dc 	svcls	0x00a130dc
 16c:	31314c4b 	teqcc	r1, fp, asr #24
 170:	834d4b4d 	movthi	r4, #56141	; 0xdb4d
 174:	b868a09f 	stmdalt	r8!, {r0, r1, r2, r3, r4, r7, sp, pc}^
 178:	4d314cdb 	ldcmi	12, cr4, [r1, #-876]!	; 0xfffffc94
 17c:	bd2f3085 	stclt	0, cr3, [pc, #-532]!	; 0xfffffdec
 180:	83854bbb 	orrhi	r4, r5, #191488	; 0x2ec00
 184:	7a036767 	bvc	d9f28 <_start-0x2ff2e0d8>
 188:	83696e66 	cmnhi	r9, #1632	; 0x660
 18c:	4d31314c 	ldfmis	f3, [r1, #-304]!	; 0xfffffed0
 190:	4da19f83 	stcmi	15, cr9, [r1, #524]!	; 0x20c
 194:	30844d31 	addcc	r4, r4, r1, lsr sp
 198:	000a0230 	andeq	r0, sl, r0, lsr r2
 19c:	00560101 	subseq	r0, r6, r1, lsl #2
 1a0:	00020000 	andeq	r0, r2, r0
 1a4:	00000023 	andeq	r0, r0, r3, lsr #32
 1a8:	0efb0102 	cdpeq	1, 15, cr0, cr11, cr2, {0}
 1ac:	0101000d 	tsteq	r1, sp
 1b0:	00000101 	andeq	r0, r0, r1, lsl #2
 1b4:	00000100 	andeq	r0, r0, r0, lsl #2
 1b8:	72656b01 	rsbvc	r6, r5, #1024	; 0x400
 1bc:	006c656e 	rsbeq	r6, ip, lr, ror #10
 1c0:	756d6d00 	strbvc	r6, [sp, #-3328]!	; 0xd00
 1c4:	0100632e 	tsteq	r0, lr, lsr #6
 1c8:	00000000 	andeq	r0, r0, r0
 1cc:	89b40205 	ldmibhi	r4!, {r0, r2, r9}
 1d0:	16033000 	strne	r3, [r3], -r0
 1d4:	66120301 	ldrvs	r0, [r2], -r1, lsl #6
 1d8:	034b4b51 	movteq	r4, #47953	; 0xbb51
 1dc:	4b580809 	blmi	1602208 <_start-0x2ea05df8>
 1e0:	4b60084b 	blmi	1802314 <_start-0x2e805cec>
 1e4:	5a08304b 	bpl	20c318 <_start-0x2fdfbce8>
 1e8:	696d6167 	stmdbvs	sp!, {r0, r1, r2, r5, r6, r8, sp, lr}^
 1ec:	34034c67 	strcc	r4, [r3], #-3175	; 0xc67
 1f0:	02012402 	andeq	r2, r1, #33554432	; 0x2000000
 1f4:	01010006 	tsteq	r1, r6
 1f8:	000000fc 	strdeq	r0, [r0], -ip
 1fc:	007f0002 	rsbseq	r0, pc, r2
 200:	01020000 	tsteq	r2, r0
 204:	000d0efb 	strdeq	r0, [sp], -fp
 208:	01010101 	tsteq	r1, r1, lsl #2
 20c:	01000000 	tsteq	r0, r0
 210:	6b010000 	blvs	40218 <_start-0x2ffc7de8>
 214:	656e7265 	strbvs	r7, [lr, #-613]!	; 0x265
 218:	6f2f006c 	svcvs	0x002f006c
 21c:	462f7470 	undefined instruction 0x462f7470
 220:	6e656972 	mcrvs	9, 3, r6, cr5, cr2, {3}
 224:	41796c64 	cmnmi	r9, r4, ror #24
 228:	742f4d52 	strtvc	r4, [pc], #3410	; 230 <_start-0x30007dd0>
 22c:	736c6f6f 	cmnvc	ip, #444	; 0x1bc
 230:	69616863 	stmdbvs	r1!, {r0, r1, r5, r6, fp, sp, lr}^
 234:	2e342f6e 	cdpcs	15, 3, cr2, cr4, cr14, {3}
 238:	2f332e34 	svccs	0x00332e34
 23c:	2f62696c 	svccs	0x0062696c
 240:	2f636367 	svccs	0x00636367
 244:	2d6d7261 	sfmcs	f7, 2, [sp, #-388]!	; (stclcs 2, cr7, [sp, #-388]!)	; 0xfffffe7c
 248:	656e6f6e 	strbvs	r6, [lr, #-3950]!	; 0xf6e
 24c:	6e696c2d 	cdpvs	12, 6, cr6, cr9, cr13, {1}
 250:	672d7875 	undefined instruction 0x672d7875
 254:	6165756e 	cmnvs	r5, lr, ror #10
 258:	342f6962 	strtcc	r6, [pc], #2402	; 260 <_start-0x30007da0>
 25c:	332e342e 	teqcc	lr, #771751936	; 0x2e000000
 260:	636e692f 	cmnvs	lr, #770048	; 0xbc000
 264:	6564756c 	strbvs	r7, [r4, #-1388]!	; 0x56c
 268:	61750000 	cmnvs	r5, r0
 26c:	632e7472 	teqvs	lr, #1912602624	; 0x72000000
 270:	00000100 	andeq	r0, r0, r0, lsl #2
 274:	61647473 	smcvs	18243	; 0x4743
 278:	682e6772 	stmdavs	lr!, {r1, r4, r5, r6, r8, r9, sl, sp, lr}
 27c:	00000200 	andeq	r0, r0, r0, lsl #4
 280:	02050000 	andeq	r0, r5, #0
 284:	30008b18 	andcc	r8, r0, r8, lsl fp
 288:	4b012303 	blmi	48e9c <_start-0x2ffbf164>
 28c:	6767679f 	undefined instruction 0x6767679f
 290:	c0676767 	rsbgt	r6, r7, r7, ror #14
 294:	a467a1a0 	strbtge	sl, [r7], #-416	; 0x1a0
 298:	bd67a14c 	stfltp	f2, [r7, #-304]!	; 0xfffffed0
 29c:	86d43083 	ldrbhi	r3, [r4], r3, lsl #1
 2a0:	2f4d8369 	svccs	0x004d8369
 2a4:	c0638367 	rsbgt	r8, r3, r7, ror #6
 2a8:	2f4b4b67 	svccs	0x004b4b67
 2ac:	bb67a186 	bllt	19e88cc <_start-0x2e61f734>
 2b0:	21083083 	smlabbcs	r8, r3, r0, r3
 2b4:	24027508 	strcs	r7, [r2], #-1288	; 0x508
 2b8:	a185bb13 	orrge	fp, r5, r3, lsl fp
 2bc:	bbd86767 	bllt	ff61a060 <bss_end+0xcf610034>
 2c0:	08f33083 	ldmeq	r3!, {r0, r1, r7, ip, sp}^
 2c4:	ae08f375 	mcrge	3, 0, pc, cr8, cr5, {3}
 2c8:	6abb9108 	bvs	feee46f0 <bss_end+0xceeda6c4>
 2cc:	832f4b89 	teqhi	pc, #140288	; 0x22400
 2d0:	14380267 	ldrtne	r0, [r8], #-615	; 0x267
 2d4:	9f30679f 	svcls	0x0030679f
 2d8:	679f304b 	ldrvs	r3, [pc, fp, asr #32]
 2dc:	6783684b 	strvs	r6, [r3, fp, asr #16]
 2e0:	88839f4c 	stmhi	r3, {r2, r3, r6, r8, r9, sl, fp, ip, pc}
 2e4:	78038383 	stmdavc	r3, {r0, r1, r7, r8, r9, pc}
 2e8:	2e0a0366 	cdpcs	3, 0, cr0, cr10, cr6, {3}
 2ec:	03665e03 	cmneq	r6, #48	; 0x30
 2f0:	022f8227 	eoreq	r8, pc, #1879048194	; 0x70000002
 2f4:	0101000a 	tsteq	r1, sl
 2f8:	00000049 	andeq	r0, r0, r9, asr #32
 2fc:	00230002 	eoreq	r0, r3, r2
 300:	01020000 	tsteq	r2, r0
 304:	000d0efb 	strdeq	r0, [sp], -fp
 308:	01010101 	tsteq	r1, r1, lsl #2
 30c:	01000000 	tsteq	r0, r0
 310:	6b010000 	blvs	40318 <_start-0x2ffc7ce8>
 314:	656e7265 	strbvs	r7, [lr, #-613]!	; 0x265
 318:	6c00006c 	stcvs	0, cr0, [r0], {108}	; 0x6c
 31c:	632e6465 	teqvs	lr, #1694498816	; 0x65000000
 320:	00000100 	andeq	r0, r0, r0, lsl #2
 324:	02050000 	andeq	r0, r5, #0
 328:	30009154 	andcc	r9, r0, r4, asr r1
 32c:	4e011603 	cfmadd32mi	mvax0, mvfx1, mvfx1, mvfx3
 330:	4b889f9f 	blmi	fe2281b4 <bss_end+0xce21e188>
 334:	4b85a0a0 	blmi	fe1685bc <bss_end+0xce15e590>
 338:	4ba16967 	blmi	fe85a8dc <bss_end+0xce8508b0>
 33c:	674b8567 	strbvs	r8, [fp, -r7, ror #10]
 340:	01000802 	tsteq	r0, r2, lsl #16
 344:	00011301 	andeq	r1, r1, r1, lsl #6
 348:	20000200 	andcs	r0, r0, r0, lsl #4
 34c:	02000000 	andeq	r0, r0, #0
 350:	0d0efb01 	vstreq	d15, [lr, #-4]
 354:	01010100 	tsteq	r1, r0, lsl #2
 358:	00000001 	andeq	r0, r0, r1
 35c:	01000001 	tsteq	r0, r1
 360:	0062696c 	rsbeq	r6, r2, ip, ror #18
 364:	62696c00 	rsbvs	r6, r9, #0
 368:	0100632e 	tsteq	r0, lr, lsr #6
 36c:	00000000 	andeq	r0, r0, r0
 370:	92500205 	subsls	r0, r0, #1342177280	; 0x50000000
 374:	12033000 	andne	r3, r3, #0
 378:	08678501 	stmdaeq	r7!, {r0, r8, sl, pc}^
 37c:	8386db3b 	orrhi	sp, r6, #60416	; 0xec00
 380:	da656784 	ble	195a198 <_start-0x2e6ade68>
 384:	bc83872f 	stclt	7, cr8, [r3], {47}	; 0x2f
 388:	8664672f 	strbthi	r6, [r4], -pc, lsr #14
 38c:	59086767 	stmdbpl	r8, {r0, r1, r2, r5, r6, r8, r9, sl, sp, lr}
 390:	852fdb64 	strhi	sp, [pc, #-2916]!	; fffff834 <bss_end+0xcfff5808>
 394:	304b4c83 	subcc	r4, fp, r3, lsl #25
 398:	333a08bc 	teqcc	sl, #12320768	; 0xbc0000
 39c:	034a7903 	movteq	r7, #43267	; 0xa903
 3a0:	2f900809 	svccs	0x00900809
 3a4:	024c9f87 	subeq	r9, ip, #540	; 0x21c
 3a8:	842f1424 	strthi	r1, [pc], #1060	; 3b0 <_start-0x30007c50>
 3ac:	38024cbb 	stmdacc	r2, {r0, r1, r3, r4, r5, r7, sl, fp, lr}
 3b0:	9f842f15 	svcls	0x00842f15
 3b4:	84652f4c 	strbthi	r2, [r5], #-3916	; 0xf4c
 3b8:	2f152402 	svccs	0x00152402
 3bc:	674cbb84 	strbvs	fp, [ip, -r4, lsl #23]
 3c0:	2f84652f 	svccs	0x0084652f
 3c4:	022b67bb 	eoreq	r6, fp, #49020928	; 0x2ec0000
 3c8:	842f1a24 	strthi	r1, [pc], #2596	; 3d0 <_start-0x30007c30>
 3cc:	3a022cc0 	bcc	8b6d4 <_start-0x2ff7c92c>
 3d0:	bb844b16 	bllt	fe113030 <bss_end+0xce109004>
 3d4:	3a022f30 	bcc	8c09c <_start-0x2ff7bf64>
 3d8:	4b6c6314 	blmi	1b19030 <_start-0x2e4eefd0>
 3dc:	832f9f84 	teqhi	pc, #528	; 0x210
 3e0:	2f230848 	svccs	0x00230848
 3e4:	3e088584 	cfsh32cc	mvfx8, mvfx8, #-60
 3e8:	02a18467 	adceq	r8, r1, #1728053248	; 0x67000000
 3ec:	84671428 	strbthi	r1, [r7], #-1064	; 0x428
 3f0:	67674ca1 	strbvs	r4, [r7, -r1, lsr #25]!
 3f4:	8330f4b9 	teqphi	r0, #-1191182336	; 0xb9000000
 3f8:	6679034b 	ldrbtvs	r0, [r9], -fp, asr #6
 3fc:	2fd60a03 	svccs	0x00d60a03
 400:	6767a184 	strbvs	sl, [r7, -r4, lsl #3]!
 404:	dcd548bb 	ldclle	8, cr4, [r5], {187}	; 0xbb
 408:	4cbb842f 	cfldrsmi	mvf8, [fp], #188	; 0xbc
 40c:	3f08d52f 	svccc	0x0008d52f
 410:	84bb842f 	ldrthi	r8, [fp], #1071	; 0x42f
 414:	083b082f 	ldmdaeq	fp!, {r0, r1, r2, r3, r5, fp}
 418:	bd842f3f 	stclt	15, cr2, [r4, #252]	; 0xfc
 41c:	2f4b4b83 	svccs	0x004b4b83
 420:	5c083b08 	stcpl	11, cr3, [r8], {8}
 424:	082f8383 	stmdaeq	pc!, {r0, r1, r7, r8, r9, pc}
 428:	2f40083b 	svccs	0x0040083b
 42c:	9f4cbc84 	svcls	0x004cbc84
 430:	92083b08 	andls	r3, r8, #8192	; 0x2000
 434:	bb842f2f 	bllt	fe10c0f8 <bss_end+0xce1020cc>
 438:	4bbb2f4c 	blmi	feecc170 <bss_end+0xceec2144>
 43c:	2f6c6267 	svccs	0x006c6267
 440:	6783a184 	strvs	sl, [r3, r4, lsl #3]
 444:	672f834b 	strvs	r8, [pc, -fp, asr #6]!
 448:	88624bd7 	stmdahi	r2!, {r0, r1, r2, r4, r6, r7, r8, r9, fp, lr}^
 44c:	4bbb842f 	blmi	feee1510 <bss_end+0xceed74e4>
 450:	6491082f 	ldrvs	r0, [r1], #2095	; 0x82f
 454:	022f4108 	eoreq	r4, pc, #2
 458:	01010008 	tsteq	r1, r8

Disassembly of section .debug_info:

00000000 <.debug_info>:
   0:	00000061 	andeq	r0, r0, r1, rrx
   4:	00000002 	andeq	r0, r0, r2
   8:	01040000 	tsteq	r4, r0
   c:	00000000 	andeq	r0, r0, r0
  10:	30008000 	andcc	r8, r0, r0
  14:	300081bc 	undefined instruction 0x300081bc
  18:	746f6f62 	strbtvc	r6, [pc], #3938	; 20 <_start-0x30007fe0>
  1c:	6174732f 	cmnvs	r4, pc, lsr #6
  20:	532e7472 	teqpl	lr, #1912602624	; 0x72000000
  24:	6f682f00 	svcvs	0x00682f00
  28:	642f656d 	strtvs	r6, [pc], #1389	; 30 <_start-0x30007fd0>
  2c:	6e6f6d65 	cdpvs	13, 6, cr6, cr15, cr5, {3}
  30:	2f666c65 	svccs	0x00666c65
  34:	6a6f7270 	bvs	1bdc9fc <_start-0x2e42b604>
  38:	2f746365 	svccs	0x00746365
  3c:	6d2e3030 	stcvs	0, cr3, [lr, #-192]!	; 0xffffff40
  40:	726f7779 	rsbvc	r7, pc, #31719424	; 0x1e40000
  44:	656c2f6b 	strbvs	r2, [ip, #-3947]!	; 0xf6b
  48:	79636167 	stmdbvc	r3!, {r0, r1, r2, r5, r6, r8, sp, lr}^
  4c:	6d72612d 	ldfvse	f6, [r2, #-180]!	; 0xffffff4c
  50:	6e696c2d 	cdpvs	12, 6, cr6, cr9, cr13, {1}
  54:	47007875 	smlsdxmi	r0, r5, r8, r7
  58:	4120554e 	teqmi	r0, lr, asr #10
  5c:	2e322053 	mrccs	0, 1, r2, cr2, cr3, {2}
  60:	01003032 	tsteq	r0, r2, lsr r0
  64:	00019680 	andeq	r9, r1, r0, lsl #13
  68:	14000200 	strne	r0, [r0], #-512	; 0x200
  6c:	04000000 	streq	r0, [r0]
  70:	00007901 	andeq	r7, r0, r1, lsl #18
  74:	00490100 	subeq	r0, r9, r0, lsl #2
  78:	00090000 	andeq	r0, r9, r0
  7c:	81c00000 	bichi	r0, r0, r0
  80:	853c3000 	ldrhi	r3, [ip]!
  84:	00933000 	addseq	r3, r3, r0
  88:	01020000 	tsteq	r2, r0
  8c:	0000006f 	andeq	r0, r0, pc, rrx
  90:	c0011601 	andgt	r1, r1, r1, lsl #12
  94:	78300081 	ldmdavc	r0!, {r0, r7}
  98:	00300082 	eorseq	r0, r0, r2, lsl #1
  9c:	7f000000 	svcvc	0x00000000
  a0:	03000000 	movweq	r0, #0
  a4:	00000044 	andeq	r0, r0, r4, asr #32
  a8:	007f1601 	rsbseq	r1, pc, r1, lsl #12
  ac:	91020000 	tstls	r2, r0
  b0:	005d035c 	subseq	r0, sp, ip, asr r3
  b4:	16010000 	strne	r0, [r1], -r0
  b8:	000000a0 	andeq	r0, r0, r0, lsr #1
  bc:	04589102 	ldrbeq	r9, [r8], #-258	; 0x102
  c0:	18010069 	stmdane	r1, {r0, r3, r5, r6}
  c4:	0000007f 	andeq	r0, r0, pc, ror r0
  c8:	04649102 	strbteq	r9, [r4], #-258	; 0x102
  cc:	18010061 	stmdane	r1, {r0, r5, r6}
  d0:	0000007f 	andeq	r0, r0, pc, ror r0
  d4:	04689102 	strbteq	r9, [r8], #-258	; 0x102
  d8:	18010062 	stmdane	r1, {r1, r5, r6}
  dc:	0000007f 	andeq	r0, r0, pc, ror r0
  e0:	006c9102 	rsbeq	r9, ip, r2, lsl #2
  e4:	69050405 	stmdbvs	r5, {r0, r2, sl}
  e8:	0600746e 	streq	r7, [r0], -lr, ror #8
  ec:	00000099 	muleq	r0, r9, r0
  f0:	00000096 	muleq	r0, r6, r0
  f4:	00009607 	andeq	r9, r0, r7, lsl #12
  f8:	08000f00 	stmdaeq	r0, {r8, r9, sl, fp}
  fc:	01090704 	tsteq	r9, r4, lsl #14
 100:	0000e508 	andeq	lr, r0, r8, lsl #10
 104:	86040a00 	strhi	r0, [r4], -r0, lsl #20
 108:	02000000 	andeq	r0, r0, #0
 10c:	00006201 	andeq	r6, r0, r1, lsl #4
 110:	01230100 	teqeq	r3, r0, lsl #2
 114:	30008278 	andcc	r8, r0, r8, ror r2
 118:	300082dc 	ldrdcc	r8, [r0], -ip
 11c:	0000002b 	andeq	r0, r0, fp, lsr #32
 120:	000000dc 	ldrdeq	r0, [r0], -ip
 124:	00004403 	andeq	r4, r0, r3, lsl #8
 128:	7f230100 	svcvc	0x00230100
 12c:	02000000 	andeq	r0, r0, #0
 130:	5d037491 	cfstrspl	mvf7, [r3, #-580]	; 0xfffffdbc
 134:	01000000 	tsteq	r0, r0
 138:	0000a023 	andeq	sl, r0, r3, lsr #32
 13c:	70910200 	addsvc	r0, r1, r0, lsl #4
 140:	3b010b00 	blcc	42d48 <_start-0x2ffc52b8>
 144:	01000000 	tsteq	r0, r0
 148:	0082dc2a 	addeq	sp, r2, sl, lsr #24
 14c:	0084ec30 	addeq	lr, r4, r0, lsr ip
 150:	00005630 	andeq	r5, r0, r0, lsr r6
 154:	00014300 	andeq	r4, r1, r0, lsl #6
 158:	63700400 	cmnvs	r0, #0
 15c:	432c0100 	teqmi	ip, #0
 160:	01000001 	tsteq	r0, r1
 164:	00550c5f 	subseq	r0, r5, pc, asr ip
 168:	2d010000 	stccs	0, cr0, [r1]
 16c:	0000014a 	andeq	r0, r0, sl, asr #2
 170:	77ec9103 	strbvc	r9, [ip, r3, lsl #2]!
 174:	01006904 	tsteq	r0, r4, lsl #18
 178:	00007f2e 	andeq	r7, r0, lr, lsr #30
 17c:	6c910200 	lfmvs	f0, 4, [r1], {0}	; (ldcvs 2, cr0, [r1], {0})
 180:	01006a04 	tsteq	r0, r4, lsl #20
 184:	00007f2f 	andeq	r7, r0, pc, lsr #30
 188:	70910200 	addsvc	r0, r1, r0, lsl #4
 18c:	01006b04 	tsteq	r0, r4, lsl #22
 190:	00007f30 	andeq	r7, r0, r0, lsr pc
 194:	74910200 	ldrvc	r0, [r1], #512	; 0x200
 198:	0000000c 	andeq	r0, r0, ip
 19c:	5b310100 	blpl	c405a4 <_start-0x2f3c7a5c>
 1a0:	03000001 	movweq	r0, #1
 1a4:	00778c91 	ldrbteq	r8, [r7], #-193	; 0xffffff3f
 1a8:	c0070409 	andgt	r0, r7, r9, lsl #8
 1ac:	06000000 	streq	r0, [r0], -r0
 1b0:	00000099 	muleq	r0, r9, r0
 1b4:	0000015b 	andeq	r0, r0, fp, asr r1
 1b8:	0000960d 	andeq	r9, r0, sp, lsl #12
 1bc:	0003ff00 	andeq	pc, r3, r0, lsl #30
 1c0:	00009906 	andeq	r9, r0, r6, lsl #18
 1c4:	00017100 	andeq	r7, r1, r0, lsl #2
 1c8:	00960700 	addseq	r0, r6, r0, lsl #14
 1cc:	07050000 	streq	r0, [r5, -r0]
 1d0:	00000096 	muleq	r0, r6, r0
 1d4:	010e000f 	tsteq	lr, pc
 1d8:	00000085 	andeq	r0, r0, r5, lsl #1
 1dc:	84ec5601 	strbthi	r5, [ip], #1537	; 0x601
 1e0:	85283000 	strhi	r3, [r8]!
 1e4:	00813000 	addeq	r3, r1, r0
 1e8:	010e0000 	tsteq	lr, r0
 1ec:	0000003f 	andeq	r0, r0, pc, lsr r0
 1f0:	85285c01 	strhi	r5, [r8, #-3073]!	; 0xc01
 1f4:	853c3000 	ldrhi	r3, [ip]!
 1f8:	00ac3000 	adceq	r3, ip, r0
 1fc:	28000000 	stmdacs	r0, {}
 200:	02000002 	andeq	r0, r0, #2
 204:	0000d700 	andeq	sp, r0, r0, lsl #14
 208:	79010400 	stmdbvc	r1, {sl}
 20c:	01000000 	tsteq	r0, r0
 210:	00000121 	andeq	r0, r0, r1, lsr #2
 214:	00000009 	andeq	r0, r0, r9
 218:	3000853c 	andcc	r8, r0, ip, lsr r5
 21c:	300089b4 	undefined instruction 0x300089b4
 220:	00000106 	andeq	r0, r0, r6, lsl #2
 224:	00fc0102 	rscseq	r0, ip, r2, lsl #2
 228:	0e010000 	cdpeq	0, 0, cr0, cr1, cr0, {0}
 22c:	3000853c 	andcc	r8, r0, ip, lsr r5
 230:	30008568 	andcc	r8, r0, r8, ror #10
 234:	000000d7 	ldrdeq	r0, [r0], -r7
 238:	00fa0102 	rscseq	r0, sl, r2, lsl #2
 23c:	13010000 	movwne	r0, #4096	; 0x1000
 240:	30008568 	andcc	r8, r0, r8, ror #10
 244:	30008594 	mulcc	r0, r4, r5
 248:	00000102 	andeq	r0, r0, r2, lsl #2
 24c:	009b0102 	addseq	r0, fp, r2, lsl #2
 250:	18010000 	stmdane	r1, {}
 254:	30008594 	mulcc	r0, r4, r5
 258:	300085c8 	andcc	r8, r0, r8, asr #11
 25c:	0000012d 	andeq	r0, r0, sp, lsr #2
 260:	014b0103 	cmpeq	fp, r3, lsl #2
 264:	1d010000 	stcne	0, cr0, [r1]
 268:	0085c801 	addeq	ip, r5, r1, lsl #16
 26c:	0085f830 	addeq	pc, r5, r0, lsr r8
 270:	00015830 	andeq	r5, r1, r0, lsr r8
 274:	00008900 	andeq	r8, r0, r0, lsl #18
 278:	01500400 	cmpeq	r0, r0, lsl #8
 27c:	1d010000 	stcne	0, cr0, [r1]
 280:	00000089 	andeq	r0, r0, r9, lsl #1
 284:	00749102 	rsbseq	r9, r4, r2, lsl #2
 288:	c0070405 	andgt	r0, r7, r5, lsl #8
 28c:	03000000 	movweq	r0, #0
 290:	00013801 	andeq	r3, r1, r1, lsl #16
 294:	01230100 	teqeq	r3, r0, lsl #2
 298:	300085f8 	strdcc	r8, [r0], -r8
 29c:	30008628 	andcc	r8, r0, r8, lsr #12
 2a0:	00000183 	andeq	r0, r0, r3, lsl #3
 2a4:	000000b8 	strheq	r0, [r0], -r8
 2a8:	00013d04 	andeq	r3, r1, r4, lsl #26
 2ac:	89230100 	stmdbhi	r3!, {r8}
 2b0:	02000000 	andeq	r0, r0, #0
 2b4:	02007491 	andeq	r7, r0, #-1862270976	; 0x91000000
 2b8:	00014201 	andeq	r4, r1, r1, lsl #4
 2bc:	28290100 	stmdacs	r9!, {r8}
 2c0:	58300086 	ldmdapl	r0!, {r1, r2, r7}
 2c4:	ae300086 	cdpge	0, 3, cr0, cr0, cr6, {4}
 2c8:	02000001 	andeq	r0, r0, #1
 2cc:	00009001 	andeq	r9, r0, r1
 2d0:	582f0100 	stmdapl	pc!, {r8}
 2d4:	84300086 	ldrthi	r0, [r0], #-134	; 0x86
 2d8:	d9300086 	ldmdble	r0!, {r1, r2, r7}
 2dc:	02000001 	andeq	r0, r0, #1
 2e0:	0000a501 	andeq	sl, r0, r1, lsl #10
 2e4:	84420100 	strbhi	r0, [r2], #-256	; 0x100
 2e8:	bc300086 	ldclt	0, cr0, [r0], #-536	; 0xfffffde8
 2ec:	04300086 	ldrteq	r0, [r0], #-134	; 0x86
 2f0:	03000002 	movweq	r0, #2
 2f4:	00010801 	andeq	r0, r1, r1, lsl #16
 2f8:	014c0100 	cmpeq	ip, r0, lsl #2
 2fc:	300086bc 	undefined instruction 0x300086bc
 300:	30008798 	mulcc	r0, r8, r7
 304:	0000022f 	andeq	r0, r0, pc, lsr #4
 308:	00000136 	andeq	r0, r0, r6, lsr r1
 30c:	00013d04 	andeq	r3, r1, r4, lsl #26
 310:	364c0100 	strbcc	r0, [ip], -r0, lsl #2
 314:	02000001 	andeq	r0, r0, #1
 318:	55046c91 	strpl	r6, [r4, #-3217]	; 0xc91
 31c:	01000001 	tsteq	r0, r1
 320:	00013d4c 	andeq	r3, r1, ip, asr #26
 324:	68910200 	ldmvs	r1, {r9}
 328:	01006906 	tsteq	r0, r6, lsl #18
 32c:	00014a4e 	andeq	r4, r1, lr, asr #20
 330:	74910200 	ldrvc	r0, [r1], #512	; 0x200
 334:	07040500 	streq	r0, [r4, -r0, lsl #10]
 338:	000000bb 	strheq	r0, [r0], -fp
 33c:	01430407 	cmpeq	r3, r7, lsl #8
 340:	01050000 	tsteq	r5, r0
 344:	0000dc08 	andeq	sp, r0, r8, lsl #24
 348:	05040800 	streq	r0, [r4, #-2048]	; 0x800
 34c:	00746e69 	rsbseq	r6, r4, r9, ror #28
 350:	00cd0109 	sbceq	r0, sp, r9, lsl #2
 354:	72010000 	andvc	r0, r1, #0
 358:	00013601 	andeq	r3, r1, r1, lsl #12
 35c:	00879800 	addeq	r9, r7, r0, lsl #16
 360:	00889830 	addeq	r9, r8, r0, lsr r8
 364:	00025a30 	andeq	r5, r2, r0, lsr sl
 368:	0001a500 	andeq	sl, r1, r0, lsl #10
 36c:	013d0400 	teqeq	sp, r0, lsl #8
 370:	72010000 	andvc	r0, r1, #0
 374:	00000136 	andeq	r0, r0, r6, lsr r1
 378:	046c9102 	strbteq	r9, [ip], #-258	; 0x102
 37c:	00000155 	andeq	r0, r0, r5, asr r1
 380:	013d7201 	teqeq	sp, r1, lsl #4
 384:	91020000 	tstls	r2, r0
 388:	00690668 	rsbeq	r0, r9, r8, ror #12
 38c:	014a7401 	cmpeq	sl, r1, lsl #8
 390:	91020000 	tstls	r2, r0
 394:	65720670 	ldrbvs	r0, [r2, #-1648]!	; 0x670
 398:	75010074 	strvc	r0, [r1, #-116]	; 0x74
 39c:	00000136 	andeq	r0, r0, r6, lsr r1
 3a0:	00749102 	rsbseq	r9, r4, r2, lsl #2
 3a4:	00af0103 	adceq	r0, pc, r3, lsl #2
 3a8:	9d010000 	stcls	0, cr0, [r1]
 3ac:	00889801 	addeq	r9, r8, r1, lsl #16
 3b0:	00891430 	addeq	r1, r9, r0, lsr r4
 3b4:	00028530 	andeq	r8, r2, r0, lsr r5
 3b8:	0001f500 	andeq	pc, r1, r0, lsl #10
 3bc:	01160400 	tsteq	r6, r0, lsl #8
 3c0:	9d010000 	stcls	0, cr0, [r1]
 3c4:	00000136 	andeq	r0, r0, r6, lsr r1
 3c8:	046c9102 	strbteq	r9, [ip], #-258	; 0x102
 3cc:	000000ef 	andeq	r0, r0, pc, ror #1
 3d0:	013d9d01 	teqeq	sp, r1, lsl #26
 3d4:	91020000 	tstls	r2, r0
 3d8:	00ea0468 	rsceq	r0, sl, r8, ror #8
 3dc:	9d010000 	stcls	0, cr0, [r1]
 3e0:	0000014a 	andeq	r0, r0, sl, asr #2
 3e4:	06649102 	strbteq	r9, [r4], -r2, lsl #2
 3e8:	9f010069 	svcls	0x00010069
 3ec:	0000014a 	andeq	r0, r0, sl, asr #2
 3f0:	00749102 	rsbseq	r9, r4, r2, lsl #2
 3f4:	012d010a 	teqeq	sp, sl, lsl #2
 3f8:	aa010000 	bge	40400 <_start-0x2ffc7c00>
 3fc:	00013601 	andeq	r3, r1, r1, lsl #12
 400:	00891400 	addeq	r1, r9, r0, lsl #8
 404:	0089b430 	addeq	fp, r9, r0, lsr r4
 408:	0002b030 	andeq	fp, r2, r0, lsr r0
 40c:	013d0400 	teqeq	sp, r0, lsl #8
 410:	aa010000 	bge	40418 <_start-0x2ffc7be8>
 414:	00000136 	andeq	r0, r0, r6, lsr r1
 418:	066c9102 	strbteq	r9, [ip], -r2, lsl #2
 41c:	00746572 	rsbseq	r6, r4, r2, ror r5
 420:	0136ac01 	teqeq	r6, r1, lsl #24
 424:	91020000 	tstls	r2, r0
 428:	97000074 	smlsdxls	r0, r4, r0, r0
 42c:	02000000 	andeq	r0, r0, #0
 430:	00018200 	andeq	r8, r1, r0, lsl #4
 434:	79010400 	stmdbvc	r1, {sl}
 438:	01000000 	tsteq	r0, r0
 43c:	0000018d 	andeq	r0, r0, sp, lsl #3
 440:	00000009 	andeq	r0, r0, r9
 444:	300089b4 	undefined instruction 0x300089b4
 448:	30008b18 	andcc	r8, r0, r8, lsl fp
 44c:	0000019e 	muleq	r0, lr, r1
 450:	015a0102 	cmpeq	sl, r2, lsl #2
 454:	16010000 	strne	r0, [r1], -r0
 458:	0089b401 	addeq	fp, r9, r1, lsl #8
 45c:	008ab030 	addeq	fp, sl, r0, lsr r0
 460:	0002db30 	andeq	sp, r2, r0, lsr fp
 464:	00006900 	andeq	r6, r0, r0, lsl #18
 468:	01750300 	cmneq	r5, r0, lsl #6
 46c:	28010000 	stmdacs	r1, {}
 470:	00000069 	andeq	r0, r0, r9, rrx
 474:	036c9102 	cmneq	ip, #-2147483648	; 0x80000000
 478:	00000180 	andeq	r0, r0, r0, lsl #3
 47c:	00692801 	rsbeq	r2, r9, r1, lsl #16
 480:	91020000 	tstls	r2, r0
 484:	019a0370 	orrseq	r0, sl, r0, ror r3
 488:	29010000 	stmdbcs	r1, {}
 48c:	00000070 	andeq	r0, r0, r0, ror r0
 490:	00749102 	rsbseq	r9, r4, r2, lsl #2
 494:	bb070404 	bllt	1c14ac <_start-0x2fe46b54>
 498:	05000000 	streq	r0, [r0]
 49c:	00006904 	andeq	r6, r0, r4, lsl #18
 4a0:	6c010600 	stcvs	6, cr0, [r1], {0}
 4a4:	01000001 	tsteq	r0, r1
 4a8:	8ab00150 	bhi	fec009f0 <bss_end+0xcebf69c4>
 4ac:	8b183000 	blhi	60c4b4 <_start-0x2f9fbb4c>
 4b0:	03063000 	movweq	r3, #24576	; 0x6000
 4b4:	74070000 	strvc	r0, [r7]
 4b8:	01006274 	tsteq	r0, r4, ror r2
 4bc:	00006952 	andeq	r6, r0, r2, asr r9
 4c0:	74910200 	ldrvc	r0, [r1], #512	; 0x200
 4c4:	023b0000 	eorseq	r0, fp, #0
 4c8:	00020000 	andeq	r0, r2, r0
 4cc:	000001f4 	strdeq	r0, [r0], -r4
 4d0:	00790104 	rsbseq	r0, r9, r4, lsl #2
 4d4:	ac010000 	stcge	0, cr0, [r1], {0}
 4d8:	09000001 	stmdbeq	r0, {r0}
 4dc:	18000000 	stmdane	r0, {}
 4e0:	5430008b 	ldrtpl	r0, [r0], #-139	; 0x8b
 4e4:	f8300091 	undefined instruction 0xf8300091
 4e8:	02000001 	andeq	r0, r0, #1
 4ec:	000001e7 	andeq	r0, r0, r7, ror #3
 4f0:	00302802 	eorseq	r2, r0, r2, lsl #16
 4f4:	c0030000 	andgt	r0, r3, r0
 4f8:	04000001 	streq	r0, [r0], #-1
 4fc:	00000048 	andeq	r0, r0, r8, asr #32
 500:	00020604 	andeq	r0, r2, r4, lsl #12
 504:	00004800 	andeq	r4, r0, r0, lsl #16
 508:	00230200 	eoreq	r0, r3, r0, lsl #4
 50c:	04050001 	streq	r0, [r5], #-1
 510:	0001c202 	andeq	ip, r1, r2, lsl #4
 514:	25660200 	strbcs	r0, [r6, #-512]!	; 0x200
 518:	06000000 	streq	r0, [r0], -r0
 51c:	0001dc01 	andeq	sp, r1, r1, lsl #24
 520:	01230100 	teqeq	r3, r0, lsl #2
 524:	30008b18 	andcc	r8, r0, r8, lsl fp
 528:	30008b94 	mulcc	r0, r4, fp
 52c:	00000331 	andeq	r0, r0, r1, lsr r3
 530:	01f60107 	mvnseq	r0, r7, lsl #2
 534:	31010000 	tstcc	r1, r0
 538:	008b9401 	addeq	r9, fp, r1, lsl #8
 53c:	008bdc30 	addeq	sp, fp, r0, lsr ip
 540:	00035c30 	andeq	r5, r3, r0, lsr ip
 544:	00009000 	andeq	r9, r0, r0
 548:	00630800 	rsbeq	r0, r3, r0, lsl #16
 54c:	00903101 	addseq	r3, r0, r1, lsl #2
 550:	91020000 	tstls	r2, r0
 554:	01090077 	tsteq	r9, r7, ror r0
 558:	0000dc08 	andeq	sp, r0, r8, lsl #24
 55c:	ca010a00 	bgt	42d64 <_start-0x2ffc529c>
 560:	01000001 	tsteq	r0, r1
 564:	0090013d 	addseq	r0, r0, sp, lsr r1
 568:	8bdc0000 	blhi	ff700570 <bss_end+0xcf6f6544>
 56c:	8c1c3000 	ldchi	0, cr3, [ip], {0}
 570:	03873000 	orreq	r3, r7, #0
 574:	01070000 	tsteq	r7, r0
 578:	000001fb 	strdeq	r0, [r0], -fp
 57c:	1c014601 	stcne	6, cr4, [r1], {1}
 580:	6830008c 	ldmdavs	r0!, {r2, r3, r7}
 584:	b230008c 	eorslt	r0, r0, #140	; 0x8c
 588:	d6000003 	strle	r0, [r0], -r3
 58c:	08000000 	stmdaeq	r0, {}
 590:	46010073 	undefined instruction 0x46010073
 594:	000000d6 	ldrdeq	r0, [r0], -r6
 598:	00749102 	rsbseq	r9, r4, r2, lsl #2
 59c:	0090040b 	addseq	r0, r0, fp, lsl #8
 5a0:	010c0000 	tsteq	ip, r0
 5a4:	000001ba 	undefined instruction 0x000001ba
 5a8:	20014e01 	andcs	r4, r1, r1, lsl #28
 5ac:	68000001 	stmdavs	r0, {r0}
 5b0:	f430008c 	undefined instruction 0xf430008c
 5b4:	dd30008c 	ldcle	0, cr0, [r0, #-560]!	; 0xfffffdd0
 5b8:	20000003 	andcs	r0, r0, r3
 5bc:	08000001 	stmdaeq	r0, {r0}
 5c0:	4e010073 	mcrmi	0, 0, r0, cr1, cr3, {3}
 5c4:	00000120 	andeq	r0, r0, r0, lsr #2
 5c8:	0d6c9102 	stfeqp	f1, [ip, #-8]!
 5cc:	00000201 	andeq	r0, r0, r1, lsl #4
 5d0:	01205001 	teqeq	r0, r1
 5d4:	91020000 	tstls	r2, r0
 5d8:	00630e70 	rsbeq	r0, r3, r0, ror lr
 5dc:	01265101 	teqeq	r6, r1, lsl #2
 5e0:	91020000 	tstls	r2, r0
 5e4:	040b0077 	streq	r0, [fp], #-119	; 0x77
 5e8:	00000126 	andeq	r0, r0, r6, lsr #2
 5ec:	e5080109 	str	r0, [r8, #-265]	; 0x109
 5f0:	07000000 	streq	r0, [r0, -r0]
 5f4:	0001a701 	andeq	sl, r1, r1, lsl #14
 5f8:	01600100 	cmneq	r0, r0, lsl #2
 5fc:	30008cf4 	strdcc	r8, [r0], -r4
 600:	30008e04 	andcc	r8, r0, r4, lsl #28
 604:	00000408 	andeq	r0, r0, r8, lsl #8
 608:	0000016d 	andeq	r0, r0, sp, ror #2
 60c:	01006e08 	tsteq	r0, r8, lsl #28
 610:	00016d60 	andeq	r6, r1, r0, ror #26
 614:	6c910200 	lfmvs	f0, 4, [r1], {0}	; (ldcvs 2, cr0, [r1], {0})
 618:	66756208 	ldrbtvs	r6, [r5], -r8, lsl #4
 61c:	20600100 	rsbcs	r0, r0, r0, lsl #2
 620:	02000001 	andeq	r0, r0, #1
 624:	690e6891 	stmdbvs	lr, {r0, r4, r7, fp, sp, lr}
 628:	6d620100 	stfvse	f0, [r2]
 62c:	02000001 	andeq	r0, r0, #1
 630:	0f007491 	svceq	0x00007491
 634:	6e690504 	cdpvs	5, 6, cr0, cr9, cr4, {0}
 638:	01070074 	tsteq	r7, r4, ror r0
 63c:	000001cf 	andeq	r0, r0, pc, asr #3
 640:	04016f01 	streq	r6, [r1], #-3841	; 0xf01
 644:	7830008e 	ldmdavc	r0!, {r1, r2, r3, r7}
 648:	3330008f 	teqcc	r0, #143	; 0x8f
 64c:	b4000004 	strlt	r0, [r0], #-4
 650:	08000001 	stmdaeq	r0, {r0}
 654:	6f01006e 	svcvs	0x0001006e
 658:	0000016d 	andeq	r0, r0, sp, ror #2
 65c:	086c9102 	stmdaeq	ip!, {r1, r8, ip, pc}^
 660:	00667562 	rsbeq	r7, r6, r2, ror #10
 664:	01206f01 	teqeq	r0, r1, lsl #30
 668:	91020000 	tstls	r2, r0
 66c:	00690e68 	rsbeq	r0, r9, r8, ror #28
 670:	016d7101 	cmneq	sp, r1, lsl #2
 674:	91020000 	tstls	r2, r0
 678:	010c0074 	tsteq	ip, r4, ror r0
 67c:	000001d4 	ldrdeq	r0, [r0], -r4
 680:	6d018501 	cfstr32vs	mvfx8, [r1, #-4]
 684:	78000001 	stmdavc	r0, {r0}
 688:	5430008f 	ldrtpl	r0, [r0], #-143	; 0x8f
 68c:	5e300091 	mrcpl	0, 1, r0, cr0, cr1, {4}
 690:	20000004 	andcs	r0, r0, r4
 694:	08000002 	stmdaeq	r0, {r1}
 698:	00746d66 	rsbseq	r6, r4, r6, ror #26
 69c:	02208501 	eoreq	r8, r0, #4194304	; 0x400000
 6a0:	91020000 	tstls	r2, r0
 6a4:	610e1000 	tstvs	lr, r0
 6a8:	87010070 	smlsdxhi	r1, r0, r0, r0
 6ac:	0000004a 	andeq	r0, r0, sl, asr #32
 6b0:	0e689102 	lgneqe	f1, f2
 6b4:	88010063 	stmdahi	r1, {r0, r1, r5, r6}
 6b8:	00000126 	andeq	r0, r0, r6, lsr #2
 6bc:	0e6f9102 	lgneqe	f1, f2
 6c0:	89010064 	stmdbhi	r1, {r2, r5, r6}
 6c4:	0000016d 	andeq	r0, r0, sp, ror #2
 6c8:	0e709102 	expeqs	f1, f2
 6cc:	8a010073 	bhi	408a0 <_start-0x2ffc7760>
 6d0:	00000120 	andeq	r0, r0, r0, lsr #2
 6d4:	0e749102 	expeqs	f1, f2
 6d8:	00667562 	rsbeq	r7, r6, r2, ror #10
 6dc:	022b8b01 	eoreq	r8, fp, #1024	; 0x400
 6e0:	91020000 	tstls	r2, r0
 6e4:	040b0048 	streq	r0, [fp], #-72	; 0x48
 6e8:	00000226 	andeq	r0, r0, r6, lsr #4
 6ec:	00012611 	andeq	r2, r1, r1, lsl r6
 6f0:	01261200 	teqeq	r6, r0, lsl #4
 6f4:	023b0000 	eorseq	r0, fp, #0
 6f8:	3b130000 	blcc	4c0700 <_start-0x2fb47900>
 6fc:	1f000002 	svcne	0x00000002
 700:	07041400 	streq	r1, [r4, -r0, lsl #8]
 704:	00009300 	andeq	r9, r0, r0, lsl #6
 708:	03000200 	movweq	r0, #512	; 0x200
 70c:	04000003 	streq	r0, [r0], #-3
 710:	00007901 	andeq	r7, r0, r1, lsl #18
 714:	02140100 	andseq	r0, r4, #0
 718:	00090000 	andeq	r0, r9, r0
 71c:	91540000 	cmpls	r4, r0
 720:	92503000 	subsls	r3, r0, #0
 724:	02f83000 	rscseq	r3, r8, #0
 728:	01020000 	tsteq	r2, r0
 72c:	00000221 	andeq	r0, r0, r1, lsr #4
 730:	54011601 	strpl	r1, [r1], #-1537	; 0x601
 734:	94300091 	ldrtls	r0, [r0], #-145	; 0x91
 738:	95300091 	ldrls	r0, [r0, #-145]!	; 0x91
 73c:	02000004 	andeq	r0, r0, #4
 740:	00022b01 	andeq	r2, r2, r1, lsl #22
 744:	01220100 	teqeq	r2, r0, lsl #2
 748:	30009194 	mulcc	r0, r4, r1
 74c:	300091d4 	ldrdcc	r9, [r0], -r4
 750:	000004c0 	andeq	r0, r0, r0, asr #9
 754:	020b0103 	andeq	r0, fp, #-1073741824	; 0xc0000000
 758:	2a010000 	bcs	40760 <_start-0x2ffc78a0>
 75c:	300091d4 	ldrdcc	r9, [r0], -r4
 760:	30009208 	andcc	r9, r0, r8, lsl #4
 764:	000004eb 	andeq	r0, r0, fp, ror #9
 768:	023c0104 	eorseq	r0, ip, #1
 76c:	32010000 	andcc	r0, r1, #0
 770:	0000007b 	andeq	r0, r0, fp, ror r0
 774:	30009208 	andcc	r9, r0, r8, lsl #4
 778:	3000922c 	andcc	r9, r0, ip, lsr #4
 77c:	00000516 	andeq	r0, r0, r6, lsl r5
 780:	69050405 	stmdbvs	r5, {r0, r2, sl}
 784:	0300746e 	movweq	r7, #1134	; 0x46e
 788:	00023401 	andeq	r3, r2, r1, lsl #8
 78c:	2c370100 	ldfcss	f0, [r7]
 790:	50300092 	mlaspl	r0, r2, r0, r0
 794:	41300092 	ldrbmi	r0, [r0, -r2]!
 798:	00000005 	andeq	r0, r0, r5
 79c:	00000747 	andeq	r0, r0, r7, asr #14
 7a0:	03600002 	cmneq	r0, #2
 7a4:	01040000 	tsteq	r4, r0
 7a8:	00000079 	andeq	r0, r0, r9, ror r0
 7ac:	0002f601 	andeq	pc, r2, r1, lsl #12
 7b0:	00000900 	andeq	r0, r0, r0, lsl #18
 7b4:	00925000 	addseq	r5, r2, r0
 7b8:	009fd430 	addseq	sp, pc, r0, lsr r4
 7bc:	00034530 	andeq	r4, r3, r0, lsr r5
 7c0:	88010200 	stmdahi	r1, {r9}
 7c4:	01000002 	tsteq	r0, r2
 7c8:	92500112 	subsls	r0, r0, #-2147483644	; 0x80000004
 7cc:	92c03000 	sbcls	r3, r0, #0
 7d0:	056c3000 	strbeq	r3, [ip]!
 7d4:	00630000 	rsbeq	r0, r3, r0
 7d8:	6e030000 	cdpvs	0, 0, cr0, cr3, cr0, {0}
 7dc:	63120100 	tstvs	r2, #0
 7e0:	02000000 	andeq	r0, r0, #0
 7e4:	69046c91 	stmdbvs	r4, {r0, r4, r7, sl, fp, sp, lr}
 7e8:	63140100 	tstvs	r4, #0
 7ec:	02000000 	andeq	r0, r0, #0
 7f0:	6a047091 	bvs	11ca3c <_start-0x2feeb5c4>
 7f4:	63140100 	tstvs	r4, #0
 7f8:	02000000 	andeq	r0, r0, #0
 7fc:	05007491 	streq	r7, [r0, #-1169]	; 0x491
 800:	6e690504 	cdpvs	5, 6, cr0, cr9, cr4, {0}
 804:	01060074 	tsteq	r6, r4, ror r0
 808:	00000259 	andeq	r0, r0, r9, asr r2
 80c:	ae011e01 	cdpge	14, 0, cr1, cr1, cr1, {0}
 810:	c0000000 	andgt	r0, r0, r0
 814:	28300092 	ldmdacs	r0!, {r1, r4, r7}
 818:	97300093 	undefined instruction 0x97300093
 81c:	ae000005 	cdpge	0, 0, cr0, cr0, cr5, {0}
 820:	03000000 	movweq	r0, #0
 824:	1e01006e 	cdpne	0, 0, cr0, cr1, cr14, {3}
 828:	000000ae 	andeq	r0, r0, lr, lsr #1
 82c:	046c9102 	strbteq	r9, [ip], #-258	; 0x102
 830:	20010069 	andcs	r0, r1, r9, rrx
 834:	00000063 	andeq	r0, r0, r3, rrx
 838:	04709102 	ldrbteq	r9, [r0], #-258	; 0x102
 83c:	006c756d 	rsbeq	r7, ip, sp, ror #10
 840:	00632001 	rsbeq	r2, r3, r1
 844:	91020000 	tstls	r2, r0
 848:	04070074 	streq	r0, [r7], #-116	; 0x74
 84c:	0000c007 	andeq	ip, r0, r7
 850:	cf010600 	svcgt	0x00010600
 854:	01000002 	tsteq	r0, r2
 858:	00ae012b 	adceq	r0, lr, fp, lsr #2
 85c:	93280000 	teqls	r8, #0
 860:	93fc3000 	mvnsls	r3, #0
 864:	05c23000 	strbeq	r3, [r2]
 868:	01070000 	tsteq	r7, r0
 86c:	61030000 	tstvs	r3, r0
 870:	01007272 	tsteq	r0, r2, ror r2
 874:	0001072b 	andeq	r0, r1, fp, lsr #14
 878:	5c910200 	lfmpl	f0, 4, [r1], {0}	; (ldcpl 2, cr0, [r1], {0})
 87c:	6d757304 	ldclvs	3, cr7, [r5, #-16]!
 880:	ae2d0100 	sufgee	f0, f5, f0
 884:	02000000 	andeq	r0, r0, #0
 888:	69046491 	stmdbvs	r4, {r0, r4, r7, sl, sp, lr}
 88c:	ae2d0100 	sufgee	f0, f5, f0
 890:	02000000 	andeq	r0, r0, #0
 894:	6a046891 	bvs	11aae0 <_start-0x2feed520>
 898:	ae2d0100 	sufgee	f0, f5, f0
 89c:	02000000 	andeq	r0, r0, #0
 8a0:	08006c91 	stmdaeq	r0, {r0, r4, r7, sl, fp, sp, lr}
 8a4:	00010d04 	andeq	r0, r1, r4, lsl #26
 8a8:	08010700 	stmdaeq	r1, {r8, r9, sl}
 8ac:	000000e5 	andeq	r0, r0, r5, ror #1
 8b0:	02b40106 	adcseq	r0, r4, #-2147483647	; 0x80000001
 8b4:	3c010000 	stccc	0, cr0, [r1], {0}
 8b8:	00006301 	andeq	r6, r0, r1, lsl #6
 8bc:	0093fc00 	addseq	pc, r3, r0, lsl #24
 8c0:	0094b430 	addseq	fp, r4, r0, lsr r4
 8c4:	0005ed30 	andeq	lr, r5, r0, lsr sp
 8c8:	00016200 	andeq	r6, r1, r0, lsl #4
 8cc:	00730300 	rsbseq	r0, r3, r0, lsl #6
 8d0:	01073c01 	tsteq	r7, r1, lsl #24
 8d4:	91020000 	tstls	r2, r0
 8d8:	00700464 	rsbseq	r0, r0, r4, ror #8
 8dc:	01073e01 	tsteq	r7, r1, lsl #28
 8e0:	91020000 	tstls	r2, r0
 8e4:	0063046c 	rsbeq	r0, r3, ip, ror #8
 8e8:	010d3f01 	tsteq	sp, r1, lsl #30
 8ec:	91020000 	tstls	r2, r0
 8f0:	00690473 	rsbeq	r0, r9, r3, ror r4
 8f4:	00634001 	rsbeq	r4, r3, r1
 8f8:	91020000 	tstls	r2, r0
 8fc:	01060074 	tsteq	r6, r4, ror r0
 900:	0000028e 	andeq	r0, r0, lr, lsl #5
 904:	07014f01 	streq	r4, [r1, -r1, lsl #30]
 908:	b4000001 	strlt	r0, [r0], #-1
 90c:	2c300094 	ldccs	0, cr0, [r0], #-592	; 0xfffffdb0
 910:	18300095 	ldmdane	r0!, {r0, r2, r4, r7}
 914:	aa000006 	bge	934 <_start-0x300076cc>
 918:	09000001 	stmdbeq	r0, {r0}
 91c:	00000283 	andeq	r0, r0, r3, lsl #5
 920:	01074f01 	tsteq	r7, r1, lsl #30
 924:	91020000 	tstls	r2, r0
 928:	7273036c 	rsbsvc	r0, r3, #-1342177279	; 0xb0000001
 92c:	4f010063 	svcmi	0x00010063
 930:	000001aa 	andeq	r0, r0, sl, lsr #3
 934:	04689102 	strbteq	r9, [r8], #-258	; 0x102
 938:	00706d74 	rsbseq	r6, r0, r4, ror sp
 93c:	01075101 	tsteq	r7, r1, lsl #2
 940:	91020000 	tstls	r2, r0
 944:	04080074 	streq	r0, [r8], #-116	; 0x74
 948:	000001b0 	undefined instruction 0x000001b0
 94c:	00010d0a 	andeq	r0, r1, sl, lsl #26
 950:	9c010600 	stcls	6, cr0, [r1], {0}
 954:	01000002 	tsteq	r0, r2
 958:	01070157 	tsteq	r7, r7, asr r1
 95c:	952c0000 	strls	r0, [ip]!
 960:	95d03000 	ldrbls	r3, [r0]
 964:	06433000 	strbeq	r3, [r3], -r0
 968:	020b0000 	andeq	r0, fp, #0
 96c:	83090000 	movwhi	r0, #36864	; 0x9000
 970:	01000002 	tsteq	r0, r2
 974:	00010757 	andeq	r0, r1, r7, asr r7
 978:	6c910200 	lfmvs	f0, 4, [r1], {0}	; (ldcvs 2, cr0, [r1], {0})
 97c:	63727303 	cmnvs	r2, #201326592	; 0xc000000
 980:	aa570100 	bge	15c0d88 <_start-0x2ea47278>
 984:	02000001 	andeq	r0, r0, #1
 988:	d4096891 	strle	r6, [r9], #-2193	; 0x891
 98c:	01000002 	tsteq	r0, r2
 990:	00006357 	andeq	r6, r0, r7, asr r3
 994:	64910200 	ldrvs	r0, [r1], #512	; 0x200
 998:	706d7404 	rsbvc	r7, sp, r4, lsl #8
 99c:	07590100 	ldrbeq	r0, [r9, -r0, lsl #2]
 9a0:	02000001 	andeq	r0, r0, #1
 9a4:	06007491 	undefined instruction 0x06007491
 9a8:	00029501 	andeq	r9, r2, r1, lsl #10
 9ac:	01600100 	cmneq	r0, r0, lsl #2
 9b0:	00000107 	andeq	r0, r0, r7, lsl #2
 9b4:	300095d0 	ldrdcc	r9, [r0], -r0
 9b8:	30009668 	andcc	r9, r0, r8, ror #12
 9bc:	0000066e 	andeq	r0, r0, lr, ror #12
 9c0:	00000253 	andeq	r0, r0, r3, asr r2
 9c4:	00028309 	andeq	r8, r2, r9, lsl #6
 9c8:	07600100 	strbeq	r0, [r0, -r0, lsl #2]!
 9cc:	02000001 	andeq	r0, r0, #1
 9d0:	73036c91 	movwvc	r6, #15505	; 0x3c91
 9d4:	01006372 	tsteq	r0, r2, ror r3
 9d8:	0001aa60 	andeq	sl, r1, r0, ror #20
 9dc:	68910200 	ldmvs	r1, {r9}
 9e0:	706d7404 	rsbvc	r7, sp, r4, lsl #8
 9e4:	07620100 	strbeq	r0, [r2, -r0, lsl #2]!
 9e8:	02000001 	andeq	r0, r0, #1
 9ec:	06007491 	undefined instruction 0x06007491
 9f0:	0002ac01 	andeq	sl, r2, r1, lsl #24
 9f4:	016b0100 	cmneq	fp, r0, lsl #2
 9f8:	00000107 	andeq	r0, r0, r7, lsl #2
 9fc:	30009668 	andcc	r9, r0, r8, ror #12
 a00:	3000973c 	andcc	r9, r0, ip, lsr r7
 a04:	00000699 	muleq	r0, r9, r6
 a08:	000002a9 	andeq	r0, r0, r9, lsr #5
 a0c:	00028309 	andeq	r8, r2, r9, lsl #6
 a10:	076b0100 	strbeq	r0, [fp, -r0, lsl #2]!
 a14:	02000001 	andeq	r0, r0, #1
 a18:	73036c91 	movwvc	r6, #15505	; 0x3c91
 a1c:	01006372 	tsteq	r0, r2, ror r3
 a20:	0001aa6b 	andeq	sl, r1, fp, ror #20
 a24:	68910200 	ldmvs	r1, {r9}
 a28:	0002d409 	andeq	sp, r2, r9, lsl #8
 a2c:	636b0100 	cmnvs	fp, #0
 a30:	02000000 	andeq	r0, r0, #0
 a34:	74046491 	strvc	r6, [r4], #-1169	; 0x491
 a38:	0100706d 	tsteq	r0, sp, rrx
 a3c:	0001076d 	andeq	r0, r1, sp, ror #14
 a40:	74910200 	ldrvc	r0, [r1], #512	; 0x200
 a44:	b9010600 	stmdblt	r1, {r9, sl}
 a48:	01000002 	tsteq	r0, r2
 a4c:	0063017c 	rsbeq	r0, r3, ip, ror r1
 a50:	973c0000 	ldrls	r0, [ip, -r0]!
 a54:	97e43000 	strbls	r3, [r4, r0]!
 a58:	06c43000 	strbeq	r3, [r4], r0
 a5c:	02ee0000 	rsceq	r0, lr, #0
 a60:	63030000 	movwvs	r0, #12288	; 0x3000
 a64:	7c010073 	stcvc	0, cr0, [r1], {115}	; 0x73
 a68:	000001aa 	andeq	r0, r0, sl, lsr #3
 a6c:	03749102 	cmneq	r4, #-2147483648	; 0x80000000
 a70:	01007463 	tsteq	r0, r3, ror #8
 a74:	0001aa7c 	andeq	sl, r1, ip, ror sl
 a78:	70910200 	addsvc	r0, r1, r0, lsl #4
 a7c:	0002e80b 	andeq	lr, r2, fp, lsl #16
 a80:	ee7e0100 	rpwe	f0, f6, f0
 a84:	01000002 	tsteq	r0, r2
 a88:	01070054 	qaddeq	r0, r4, r7
 a8c:	0000de06 	andeq	sp, r0, r6, lsl #28
 a90:	ee010600 	cfmadd32	mvax0, mvfx0, mvfx1, mvfx0
 a94:	01000002 	tsteq	r0, r2
 a98:	00630187 	rsbeq	r0, r3, r7, lsl #3
 a9c:	97e40000 	strbls	r0, [r4, r0]!
 aa0:	98a83000 	stmials	r8!, {ip, sp}
 aa4:	06ef3000 	strbteq	r3, [pc], r0
 aa8:	03480000 	movteq	r0, #32768	; 0x8000
 aac:	63030000 	movwvs	r0, #12288	; 0x3000
 ab0:	87010073 	smlsdxhi	r1, r3, r0, r0
 ab4:	000001aa 	andeq	r0, r0, sl, lsr #3
 ab8:	03749102 	cmneq	r4, #-2147483648	; 0x80000000
 abc:	01007463 	tsteq	r0, r3, ror #8
 ac0:	0001aa87 	andeq	sl, r1, r7, lsl #21
 ac4:	70910200 	addsvc	r0, r1, r0, lsl #4
 ac8:	0002d409 	andeq	sp, r2, r9, lsl #8
 acc:	63870100 	orrvs	r0, r7, #0
 ad0:	02000000 	andeq	r0, r0, #0
 ad4:	e80b6c91 	stmda	fp, {r0, r4, r7, sl, fp, sp, lr}
 ad8:	01000002 	tsteq	r0, r2
 adc:	0002ee89 	andeq	lr, r2, r9, lsl #29
 ae0:	00540100 	subseq	r0, r4, r0, lsl #2
 ae4:	02750106 	rsbseq	r0, r5, #-2147483647	; 0x80000001
 ae8:	93010000 	movwls	r0, #4096	; 0x1000
 aec:	00010701 	andeq	r0, r1, r1, lsl #14
 af0:	0098a800 	addseq	sl, r8, r0, lsl #16
 af4:	00991030 	addseq	r1, r9, r0, lsr r0
 af8:	00071a30 	andeq	r1, r7, r0, lsr sl
 afc:	00037e00 	andeq	r7, r3, r0, lsl #28
 b00:	00730300 	rsbseq	r0, r3, r0, lsl #6
 b04:	01aa9301 	undefined instruction 0x01aa9301
 b08:	91020000 	tstls	r2, r0
 b0c:	00630374 	rsbeq	r0, r3, r4, ror r3
 b10:	00639301 	rsbeq	r9, r3, r1, lsl #6
 b14:	91020000 	tstls	r2, r0
 b18:	01060070 	tsteq	r6, r0, ror r0
 b1c:	0000027c 	andeq	r0, r0, ip, ror r2
 b20:	63019a01 	movwvs	r9, #6657	; 0x1a01
 b24:	10000000 	andne	r0, r0, r0
 b28:	64300099 	ldrtvs	r0, [r0], #-153	; 0x99
 b2c:	45300099 	ldrmi	r0, [r0, #-153]!	; 0x99
 b30:	b5000007 	strlt	r0, [r0, #-7]
 b34:	03000003 	movweq	r0, #3
 b38:	9a010073 	bls	40d0c <_start-0x2ffc72f4>
 b3c:	000001aa 	andeq	r0, r0, sl, lsr #3
 b40:	046c9102 	strbteq	r9, [ip], #-258	; 0x102
 b44:	01006373 	tsteq	r0, r3, ror r3
 b48:	0001aa9c 	muleq	r1, ip, sl
 b4c:	74910200 	ldrvc	r0, [r1], #512	; 0x200
 b50:	c0010600 	andgt	r0, r1, r0, lsl #12
 b54:	01000002 	tsteq	r0, r2
 b58:	006301a2 	rsbeq	r0, r3, r2, lsr #3
 b5c:	99640000 	stmdbls	r4!, {}^
 b60:	99e43000 	stmibls	r4!, {ip, sp}^
 b64:	07703000 	ldrbeq	r3, [r0, -r0]!
 b68:	03fa0000 	mvnseq	r0, #0
 b6c:	73030000 	movwvc	r0, #12288	; 0x3000
 b70:	aaa20100 	bge	fe880f78 <bss_end+0xce876f4c>
 b74:	02000001 	andeq	r0, r0, #1
 b78:	d4096c91 	strle	r6, [r9], #-3217	; 0xc91
 b7c:	01000002 	tsteq	r0, r2
 b80:	000063a2 	andeq	r6, r0, r2, lsr #7
 b84:	68910200 	ldmvs	r1, {r9}
 b88:	00637304 	rsbeq	r7, r3, r4, lsl #6
 b8c:	01aaa401 	undefined instruction 0x01aaa401
 b90:	91020000 	tstls	r2, r0
 b94:	01060074 	tsteq	r6, r4, ror r0
 b98:	000002c8 	andeq	r0, r0, r8, asr #5
 b9c:	6301aa01 	movwvs	sl, #6657	; 0x1a01
 ba0:	e4000000 	str	r0, [r0]
 ba4:	a8300099 	ldmdage	r0!, {r0, r3, r4, r7}
 ba8:	9b30009a 	blls	c00e18 <_start-0x2f4071e8>
 bac:	58000007 	stmdapl	r0, {r0, r1, r2}
 bb0:	03000004 	movweq	r0, #4
 bb4:	aa010073 	bge	40d88 <_start-0x2ffc7278>
 bb8:	000001aa 	andeq	r0, r0, sl, lsr #3
 bbc:	09649102 	stmdbeq	r4!, {r1, r8, ip, pc}^
 bc0:	0000024b 	andeq	r0, r0, fp, asr #4
 bc4:	01aaaa01 	undefined instruction 0x01aaaa01
 bc8:	91020000 	tstls	r2, r0
 bcc:	00700460 	rsbseq	r0, r0, r0, ror #8
 bd0:	01aaac01 	undefined instruction 0x01aaac01
 bd4:	91020000 	tstls	r2, r0
 bd8:	0061046c 	rsbeq	r0, r1, ip, ror #8
 bdc:	01aaad01 	undefined instruction 0x01aaad01
 be0:	91020000 	tstls	r2, r0
 be4:	02d40b70 	sbcseq	r0, r4, #114688	; 0x1c000
 be8:	ae010000 	cdpge	0, 0, cr0, cr1, cr0, {0}
 bec:	00000063 	andeq	r0, r0, r3, rrx
 bf0:	00749102 	rsbseq	r9, r4, r2, lsl #2
 bf4:	02a40106 	adceq	r0, r4, #-2147483647	; 0x80000001
 bf8:	bc010000 	stclt	0, cr0, [r1], {0}
 bfc:	00010701 	andeq	r0, r1, r1, lsl #14
 c00:	009aa800 	addseq	sl, sl, r0, lsl #16
 c04:	009b4030 	addseq	r4, fp, r0, lsr r0
 c08:	0007c630 	andeq	ip, r7, r0, lsr r6
 c0c:	0004ac00 	andeq	sl, r4, r0, lsl #24
 c10:	73630300 	cmnvc	r3, #0
 c14:	aabc0100 	bge	fef0101c <bss_end+0xceef6ff0>
 c18:	02000001 	andeq	r0, r0, #1
 c1c:	63036c91 	movwvs	r6, #15505	; 0x3c91
 c20:	bc010074 	stclt	0, cr0, [r1], {116}	; 0x74
 c24:	000001aa 	andeq	r0, r0, sl, lsr #3
 c28:	04689102 	strbteq	r9, [r8], #-258	; 0x102
 c2c:	00316373 	eorseq	r6, r1, r3, ror r3
 c30:	01aabe01 	undefined instruction 0x01aabe01
 c34:	91020000 	tstls	r2, r0
 c38:	63730470 	cmnvs	r3, #1879048192	; 0x70000000
 c3c:	be010032 	mcrlt	0, 0, r0, cr1, cr2, {1}
 c40:	000001aa 	andeq	r0, r0, sl, lsr #3
 c44:	00749102 	rsbseq	r9, r4, r2, lsl #2
 c48:	025f0106 	subseq	r0, pc, #-2147483647	; 0x80000001
 c4c:	c8010000 	stmdagt	r1, {}
 c50:	0004fd01 	andeq	pc, r4, r1, lsl #26
 c54:	009b4000 	addseq	r4, fp, r0
 c58:	009bbc30 	addseq	fp, fp, r0, lsr ip
 c5c:	0007f130 	andeq	pc, r7, r0, lsr r1
 c60:	0004fd00 	andeq	pc, r4, r0, lsl #26
 c64:	00730300 	rsbseq	r0, r3, r0, lsl #6
 c68:	04fdc801 	ldrbteq	ip, [sp], #2049	; 0x801
 c6c:	91020000 	tstls	r2, r0
 c70:	0063036c 	rsbeq	r0, r3, ip, ror #6
 c74:	0063c801 	rsbeq	ip, r3, r1, lsl #16
 c78:	91020000 	tstls	r2, r0
 c7c:	02d40968 	sbcseq	r0, r4, #1703936	; 0x1a0000
 c80:	c8010000 	stmdagt	r1, {}
 c84:	00000063 	andeq	r0, r0, r3, rrx
 c88:	04649102 	strbteq	r9, [r4], #-258	; 0x102
 c8c:	01007378 	tsteq	r0, r8, ror r3
 c90:	000107ca 	andeq	r0, r1, sl, asr #15
 c94:	74910200 	ldrvc	r0, [r1], #512	; 0x200
 c98:	06040c00 	streq	r0, [r4], -r0, lsl #24
 c9c:	0002da01 	andeq	sp, r2, r1, lsl #20
 ca0:	01d10100 	bicseq	r0, r1, r0, lsl #2
 ca4:	000004fd 	strdeq	r0, [r0], -sp
 ca8:	30009bbc 	undefined instruction 0x30009bbc
 cac:	30009c4c 	andcc	r9, r0, ip, asr #24
 cb0:	0000081c 	andeq	r0, r0, ip, lsl r8
 cb4:	00000561 	andeq	r0, r0, r1, ror #10
 cb8:	00028309 	andeq	r8, r2, r9, lsl #6
 cbc:	fdd10100 	ldc2l	1, cr0, [r1]
 cc0:	02000004 	andeq	r0, r0, #4
 cc4:	73036c91 	movwvc	r6, #15505	; 0x3c91
 cc8:	01006372 	tsteq	r0, r2, ror r3
 ccc:	000561d1 	ldrdeq	r6, [r5], -r1
 cd0:	68910200 	ldmvs	r1, {r9}
 cd4:	0002d409 	andeq	sp, r2, r9, lsl #8
 cd8:	63d10100 	bicsvs	r0, r1, #0
 cdc:	02000000 	andeq	r0, r0, #0
 ce0:	74046491 	strvc	r6, [r4], #-1169	; 0x491
 ce4:	0100706d 	tsteq	r0, sp, rrx
 ce8:	000107d3 	ldrdeq	r0, [r1], -r3
 cec:	70910200 	addsvc	r0, r1, r0, lsl #4
 cf0:	01007304 	tsteq	r0, r4, lsl #6
 cf4:	000107d3 	ldrdeq	r0, [r1], -r3
 cf8:	74910200 	ldrvc	r0, [r1], #512	; 0x200
 cfc:	67040800 	strvs	r0, [r4, -r0, lsl #16]
 d00:	0d000005 	stceq	0, cr0, [r0, #-20]	; 0xffffffec
 d04:	02430106 	subeq	r0, r3, #-2147483647	; 0x80000001
 d08:	da010000 	ble	40d10 <_start-0x2ffc72f0>
 d0c:	0004fd01 	andeq	pc, r4, r1, lsl #26
 d10:	009c4c00 	addseq	r4, ip, r0, lsl #24
 d14:	009d6430 	addseq	r6, sp, r0, lsr r4
 d18:	00084730 	andeq	r4, r8, r0, lsr r7
 d1c:	0005ca00 	andeq	ip, r5, r0, lsl #20
 d20:	02830900 	addeq	r0, r3, #0
 d24:	da010000 	ble	40d2c <_start-0x2ffc72d4>
 d28:	000004fd 	strdeq	r0, [r0], -sp
 d2c:	036c9102 	cmneq	ip, #-2147483648	; 0x80000000
 d30:	00637273 	rsbeq	r7, r3, r3, ror r2
 d34:	0561da01 	strbeq	sp, [r1, #-2561]!	; 0xa01
 d38:	91020000 	tstls	r2, r0
 d3c:	02d40968 	sbcseq	r0, r4, #1703936	; 0x1a0000
 d40:	da010000 	ble	40d48 <_start-0x2ffc72b8>
 d44:	00000063 	andeq	r0, r0, r3, rrx
 d48:	04649102 	strbteq	r9, [r4], #-258	; 0x102
 d4c:	00706d74 	rsbseq	r6, r0, r4, ror sp
 d50:	0107dc01 	tsteq	r7, r1, lsl #24
 d54:	91020000 	tstls	r2, r0
 d58:	00730470 	rsbseq	r0, r3, r0, ror r4
 d5c:	0107dc01 	tsteq	r7, r1, lsl #24
 d60:	91020000 	tstls	r2, r0
 d64:	01060074 	tsteq	r6, r4, ror r0
 d68:	00000252 	andeq	r0, r0, r2, asr r2
 d6c:	6301ed01 	movwvs	lr, #7425	; 0x1d01
 d70:	64000000 	strvs	r0, [r0]
 d74:	0c30009d 	ldceq	0, cr0, [r0], #-628	; 0xfffffd8c
 d78:	7230009e 	eorsvc	r0, r0, #158	; 0x9e
 d7c:	3a000008 	bcc	da4 <_start-0x3000725c>
 d80:	03000006 	movweq	r0, #6
 d84:	01007363 	tsteq	r0, r3, ror #6
 d88:	000561ed 	andeq	r6, r5, sp, ror #3
 d8c:	64910200 	ldrvs	r0, [r1], #512	; 0x200
 d90:	00746303 	rsbseq	r6, r4, r3, lsl #6
 d94:	0561ed01 	strbeq	lr, [r1, #-3329]!	; 0xd01
 d98:	91020000 	tstls	r2, r0
 d9c:	02d40960 	sbcseq	r0, r4, #1572864	; 0x180000
 da0:	ed010000 	stc	0, cr0, [r1]
 da4:	00000063 	andeq	r0, r0, r3, rrx
 da8:	045c9102 	ldrbeq	r9, [ip], #-258	; 0x102
 dac:	00317573 	eorseq	r7, r1, r3, ror r5
 db0:	063aef01 	ldrteq	lr, [sl], -r1, lsl #30
 db4:	91020000 	tstls	r2, r0
 db8:	7573046c 	ldrbvc	r0, [r3, #-1132]!	; 0x46c
 dbc:	ef010032 	svc	0x00010032
 dc0:	0000063a 	andeq	r0, r0, sl, lsr r6
 dc4:	04709102 	ldrbteq	r9, [r0], #-258	; 0x102
 dc8:	00736572 	rsbseq	r6, r3, r2, ror r5
 dcc:	0063f001 	rsbeq	pc, r3, r1
 dd0:	91020000 	tstls	r2, r0
 dd4:	04080074 	streq	r0, [r8], #-116	; 0x74
 dd8:	00000640 	andeq	r0, r0, r0, asr #12
 ddc:	0006450a 	andeq	r4, r6, sl, lsl #10
 de0:	08010700 	stmdaeq	r1, {r8, r9, sl}
 de4:	000000dc 	ldrdeq	r0, [r0], -ip
 de8:	026d0106 	rsbeq	r0, sp, #-2147483647	; 0x80000001
 dec:	f7010000 	undefined instruction 0xf7010000
 df0:	0004fd01 	andeq	pc, r4, r1, lsl #26
 df4:	009e0c00 	addseq	r0, lr, r0, lsl #24
 df8:	009e8830 	addseq	r8, lr, r0, lsr r8
 dfc:	00089d30 	andeq	r9, r8, r0, lsr sp
 e00:	00069e00 	andeq	r9, r6, r0, lsl #28
 e04:	013d0900 	teqeq	sp, r0, lsl #18
 e08:	f7010000 	undefined instruction 0xf7010000
 e0c:	000004fd 	strdeq	r0, [r0], -sp
 e10:	036c9102 	cmneq	ip, #-2147483648	; 0x80000000
 e14:	f7010063 	undefined instruction 0xf7010063
 e18:	00000063 	andeq	r0, r0, r3, rrx
 e1c:	09689102 	stmdbeq	r8!, {r1, r8, ip, pc}^
 e20:	000000ea 	andeq	r0, r0, sl, ror #1
 e24:	0063f701 	rsbeq	pc, r3, r1, lsl #14
 e28:	91020000 	tstls	r2, r0
 e2c:	00700464 	rsbseq	r0, r0, r4, ror #8
 e30:	069ef901 	ldreq	pc, [lr], r1, lsl #18
 e34:	91020000 	tstls	r2, r0
 e38:	04080074 	streq	r0, [r8], #-116	; 0x74
 e3c:	00000645 	andeq	r0, r0, r5, asr #12
 e40:	02e1010e 	rsceq	r0, r1, #-2147483645	; 0x80000003
 e44:	03010000 	movweq	r0, #4096	; 0x1000
 e48:	01070101 	tsteq	r7, r1, lsl #2
 e4c:	9e880000 	cdpls	0, 8, cr0, cr8, cr0, {0}
 e50:	9f343000 	svcls	0x00343000
 e54:	08c83000 	stmiaeq	r8, {ip, sp}^
 e58:	06fb0000 	ldrbteq	r0, [fp], r0
 e5c:	730f0000 	movwvc	r0, #61440	; 0xf000
 e60:	03010031 	movweq	r0, #4145	; 0x1031
 e64:	0001aa01 	andeq	sl, r1, r1, lsl #20
 e68:	6c910200 	lfmvs	f0, 4, [r1], {0}	; (ldcvs 2, cr0, [r1], {0})
 e6c:	0032730f 	eorseq	r7, r2, pc, lsl #6
 e70:	aa010301 	bge	41a7c <_start-0x2ffc6584>
 e74:	02000001 	andeq	r0, r0, #1
 e78:	6c106891 	ldcvs	8, cr6, [r0], {145}	; 0x91
 e7c:	05010031 	streq	r0, [r1, #-49]	; 0x31
 e80:	00006301 	andeq	r6, r0, r1, lsl #6
 e84:	70910200 	addsvc	r0, r1, r0, lsl #4
 e88:	00326c10 	eorseq	r6, r2, r0, lsl ip
 e8c:	63010501 	movwvs	r0, #5377	; 0x1501
 e90:	02000000 	andeq	r0, r0, #0
 e94:	11007491 	undefined instruction 0x11007491
 e98:	00026601 	andeq	r6, r2, r1, lsl #12
 e9c:	01130100 	tsteq	r3, r0, lsl #2
 ea0:	0004fd01 	andeq	pc, r4, r1, lsl #26
 ea4:	009f3400 	addseq	r3, pc, r0, lsl #8
 ea8:	009fd430 	addseq	sp, pc, r0, lsr r4
 eac:	0008f330 	andeq	pc, r8, r0, lsr r3
 eb0:	00730f00 	rsbseq	r0, r3, r0, lsl #30
 eb4:	61011301 	tstvs	r1, r1, lsl #6
 eb8:	02000005 	andeq	r0, r0, #5
 ebc:	630f6c91 	movwvs	r6, #64657	; 0xfc91
 ec0:	01130100 	tsteq	r3, r0, lsl #2
 ec4:	00000063 	andeq	r0, r0, r3, rrx
 ec8:	0f689102 	svceq	0x00689102
 ecc:	1301006e 	movwne	r0, #4206	; 0x106e
 ed0:	00006301 	andeq	r6, r0, r1, lsl #6
 ed4:	64910200 	ldrvs	r0, [r1], #512	; 0x200
 ed8:	01007010 	tsteq	r0, r0, lsl r0
 edc:	063a0115 	undefined instruction 0x063a0115
 ee0:	91020000 	tstls	r2, r0
 ee4:	Address 0x00000ee4 is out of bounds.


Disassembly of section .debug_abbrev:

00000000 <.debug_abbrev>:
   0:	10001101 	andne	r1, r0, r1, lsl #2
   4:	12011106 	andne	r1, r1, #-2147483647	; 0x80000001
   8:	1b080301 	blne	200c14 <_start-0x2fe073ec>
   c:	13082508 	movwne	r2, #34056	; 0x8508
  10:	00000005 	andeq	r0, r0, r5
  14:	25011101 	strcs	r1, [r1, #-257]	; 0x101
  18:	030b130e 	movweq	r1, #45838	; 0xb30e
  1c:	110e1b0e 	tstne	lr, lr, lsl #22
  20:	10011201 	andne	r1, r1, r1, lsl #4
  24:	02000006 	andeq	r0, r0, #6
  28:	0c3f012e 	ldfeqs	f0, [pc], #-184	; 0xffffff48
  2c:	0b3a0e03 	bleq	e83840 <_start-0x2f1847c0>
  30:	0c270b3b 	stceq	11, cr0, [r7], #-236	; 0xffffff14
  34:	01120111 	tsteq	r2, r1, lsl r1
  38:	13010640 	movwne	r0, #5696	; 0x1640
  3c:	05030000 	streq	r0, [r3]
  40:	3a0e0300 	bcc	380c48 <_start-0x2fc873b8>
  44:	490b3b0b 	stmdbmi	fp, {r0, r1, r3, r8, r9, fp, ip, sp}
  48:	000a0213 	andeq	r0, sl, r3, lsl r2
  4c:	00340400 	eorseq	r0, r4, r0, lsl #8
  50:	0b3a0803 	bleq	e82064 <_start-0x2f185f9c>
  54:	13490b3b 	movtne	r0, #39739	; 0x9b3b
  58:	00000a02 	andeq	r0, r0, r2, lsl #20
  5c:	0b002405 	bleq	9078 <_start-0x2fffef88>
  60:	030b3e0b 	movweq	r3, #48651	; 0xbe0b
  64:	06000008 	streq	r0, [r0], -r8
  68:	13490101 	movtne	r0, #37121	; 0x9101
  6c:	00001301 	andeq	r1, r0, r1, lsl #6
  70:	49002107 	stmdbmi	r0, {r0, r1, r2, r8, sp}
  74:	000b2f13 	andeq	r2, fp, r3, lsl pc
  78:	00240800 	eoreq	r0, r4, r0, lsl #16
  7c:	0b3e0b0b 	bleq	f82cb0 <_start-0x2f085350>
  80:	24090000 	strcs	r0, [r9]
  84:	3e0b0b00 	vmlacc.f64	d0, d11, d0
  88:	000e030b 	andeq	r0, lr, fp, lsl #6
  8c:	000f0a00 	andeq	r0, pc, r0, lsl #20
  90:	13490b0b 	movtne	r0, #39691	; 0x9b0b
  94:	2e0b0000 	cdpcs	0, 0, cr0, cr11, cr0, {0}
  98:	030c3f01 	movweq	r3, #52993	; 0xcf01
  9c:	3b0b3a0e 	blcc	2ce8dc <_start-0x2fd39724>
  a0:	1201110b 	andne	r1, r1, #-1073741822	; 0xc0000002
  a4:	01064001 	tsteq	r6, r1
  a8:	0c000013 	stceq	0, cr0, [r0], {19}
  ac:	0e030034 	mcreq	0, 0, r0, cr3, cr4, {1}
  b0:	0b3b0b3a 	bleq	ec2da0 <_start-0x2f145260>
  b4:	0a021349 	beq	84de0 <_start-0x2ff83220>
  b8:	210d0000 	tstcs	sp, r0
  bc:	2f134900 	svccs	0x00134900
  c0:	0e000005 	cdpeq	0, 0, cr0, cr0, cr5, {0}
  c4:	0c3f002e 	ldceq	0, cr0, [pc], #-184	; 0xffffff48
  c8:	0b3a0e03 	bleq	e838dc <_start-0x2f184724>
  cc:	01110b3b 	tsteq	r1, fp, lsr fp
  d0:	06400112 	undefined instruction 0x06400112
  d4:	01000000 	tsteq	r0, r0
  d8:	0e250111 	mcreq	1, 1, r0, cr5, cr1, {0}
  dc:	0e030b13 	vmoveq.32	d3[0], r0
  e0:	01110e1b 	tsteq	r1, fp, lsl lr
  e4:	06100112 	undefined instruction 0x06100112
  e8:	2e020000 	cdpcs	0, 0, cr0, cr2, cr0, {0}
  ec:	030c3f00 	movweq	r3, #52992	; 0xcf00
  f0:	3b0b3a0e 	blcc	2ce930 <_start-0x2fd396d0>
  f4:	1201110b 	andne	r1, r1, #-1073741822	; 0xc0000002
  f8:	00064001 	andeq	r4, r6, r1
  fc:	012e0300 	teqeq	lr, r0, lsl #6
 100:	0e030c3f 	mcreq	12, 0, r0, cr3, cr15, {1}
 104:	0b3b0b3a 	bleq	ec2df4 <_start-0x2f14520c>
 108:	01110c27 	tsteq	r1, r7, lsr #24
 10c:	06400112 	undefined instruction 0x06400112
 110:	00001301 	andeq	r1, r0, r1, lsl #6
 114:	03000504 	movweq	r0, #1284	; 0x504
 118:	3b0b3a0e 	blcc	2ce958 <_start-0x2fd396a8>
 11c:	0213490b 	andseq	r4, r3, #180224	; 0x2c000
 120:	0500000a 	streq	r0, [r0, #-10]
 124:	0b0b0024 	bleq	2c01bc <_start-0x2fd47e44>
 128:	0e030b3e 	vmoveq.16	d3[0], r0
 12c:	34060000 	strcc	r0, [r6]
 130:	3a080300 	bcc	200d38 <_start-0x2fe072c8>
 134:	490b3b0b 	stmdbmi	fp, {r0, r1, r3, r8, r9, fp, ip, sp}
 138:	000a0213 	andeq	r0, sl, r3, lsl r2
 13c:	000f0700 	andeq	r0, pc, r0, lsl #14
 140:	13490b0b 	movtne	r0, #39691	; 0x9b0b
 144:	24080000 	strcs	r0, [r8]
 148:	3e0b0b00 	vmlacc.f64	d0, d11, d0
 14c:	0008030b 	andeq	r0, r8, fp, lsl #6
 150:	012e0900 	teqeq	lr, r0, lsl #18
 154:	0e030c3f 	mcreq	12, 0, r0, cr3, cr15, {1}
 158:	0b3b0b3a 	bleq	ec2e48 <_start-0x2f1451b8>
 15c:	13490c27 	movtne	r0, #39975	; 0x9c27
 160:	01120111 	tsteq	r2, r1, lsl r1
 164:	13010640 	movwne	r0, #5696	; 0x1640
 168:	2e0a0000 	cdpcs	0, 0, cr0, cr10, cr0, {0}
 16c:	030c3f01 	movweq	r3, #52993	; 0xcf01
 170:	3b0b3a0e 	blcc	2ce9b0 <_start-0x2fd39650>
 174:	490c270b 	stmdbmi	ip, {r0, r1, r3, r8, r9, sl, sp}
 178:	12011113 	andne	r1, r1, #-1073741820	; 0xc0000004
 17c:	00064001 	andeq	r4, r6, r1
 180:	11010000 	tstne	r1, r0
 184:	130e2501 	movwne	r2, #58625	; 0xe501
 188:	1b0e030b 	blne	380dbc <_start-0x2fc87244>
 18c:	1201110e 	andne	r1, r1, #-2147483645	; 0x80000003
 190:	00061001 	andeq	r1, r6, r1
 194:	012e0200 	teqeq	lr, r0, lsl #4
 198:	0e030c3f 	mcreq	12, 0, r0, cr3, cr15, {1}
 19c:	0b3b0b3a 	bleq	ec2e8c <_start-0x2f145174>
 1a0:	01110c27 	tsteq	r1, r7, lsr #24
 1a4:	06400112 	undefined instruction 0x06400112
 1a8:	00001301 	andeq	r1, r0, r1, lsl #6
 1ac:	03003403 	movweq	r3, #1027	; 0x403
 1b0:	3b0b3a0e 	blcc	2ce9f0 <_start-0x2fd39610>
 1b4:	0213490b 	andseq	r4, r3, #180224	; 0x2c000
 1b8:	0400000a 	streq	r0, [r0], #-10
 1bc:	0b0b0024 	bleq	2c0254 <_start-0x2fd47dac>
 1c0:	0e030b3e 	vmoveq.16	d3[0], r0
 1c4:	0f050000 	svceq	0x00050000
 1c8:	490b0b00 	stmdbmi	fp, {r8, r9, fp}
 1cc:	06000013 	undefined instruction 0x06000013
 1d0:	0c3f012e 	ldfeqs	f0, [pc], #-184	; 0xffffff48
 1d4:	0b3a0e03 	bleq	e839e8 <_start-0x2f184618>
 1d8:	0c270b3b 	stceq	11, cr0, [r7], #-236	; 0xffffff14
 1dc:	01120111 	tsteq	r2, r1, lsl r1
 1e0:	00000640 	andeq	r0, r0, r0, asr #12
 1e4:	03003407 	movweq	r3, #1031	; 0x407
 1e8:	3b0b3a08 	blcc	2cea10 <_start-0x2fd395f0>
 1ec:	0213490b 	andseq	r4, r3, #180224	; 0x2c000
 1f0:	0000000a 	andeq	r0, r0, sl
 1f4:	25011101 	strcs	r1, [r1, #-257]	; 0x101
 1f8:	030b130e 	movweq	r1, #45838	; 0xb30e
 1fc:	110e1b0e 	tstne	lr, lr, lsl #22
 200:	10011201 	andne	r1, r1, r1, lsl #4
 204:	02000006 	andeq	r0, r0, #6
 208:	0e030016 	mcreq	0, 0, r0, cr3, cr6, {0}
 20c:	0b3b0b3a 	bleq	ec2efc <_start-0x2f145104>
 210:	00001349 	andeq	r1, r0, r9, asr #6
 214:	03011303 	movweq	r1, #4867	; 0x1303
 218:	010b0b0e 	tsteq	fp, lr, lsl #22
 21c:	04000013 	streq	r0, [r0], #-19
 220:	0e03000d 	cdpeq	0, 0, cr0, cr3, cr13, {0}
 224:	0a381349 	beq	e04f50 <_start-0x2f2030b0>
 228:	00000c34 	andeq	r0, r0, r4, lsr ip
 22c:	0b000f05 	bleq	3e48 <_start-0x300041b8>
 230:	0600000b 	streq	r0, [r0], -fp
 234:	0c3f002e 	ldceq	0, cr0, [pc], #-184	; 0xffffff48
 238:	0b3a0e03 	bleq	e83a4c <_start-0x2f1845b4>
 23c:	0c270b3b 	stceq	11, cr0, [r7], #-236	; 0xffffff14
 240:	01120111 	tsteq	r2, r1, lsl r1
 244:	00000640 	andeq	r0, r0, r0, asr #12
 248:	3f012e07 	svccc	0x00012e07
 24c:	3a0e030c 	bcc	380e84 <_start-0x2fc8717c>
 250:	270b3b0b 	strcs	r3, [fp, -fp, lsl #22]
 254:	1201110c 	andne	r1, r1, #3
 258:	01064001 	tsteq	r6, r1
 25c:	08000013 	stmdaeq	r0, {r0, r1, r4}
 260:	08030005 	stmdaeq	r3, {r0, r2}
 264:	0b3b0b3a 	bleq	ec2f54 <_start-0x2f1450ac>
 268:	0a021349 	beq	84f94 <_start-0x2ff8306c>
 26c:	24090000 	strcs	r0, [r9]
 270:	3e0b0b00 	vmlacc.f64	d0, d11, d0
 274:	000e030b 	andeq	r0, lr, fp, lsl #6
 278:	002e0a00 	eoreq	r0, lr, r0, lsl #20
 27c:	0e030c3f 	mcreq	12, 0, r0, cr3, cr15, {1}
 280:	0b3b0b3a 	bleq	ec2f70 <_start-0x2f145090>
 284:	13490c27 	movtne	r0, #39975	; 0x9c27
 288:	01120111 	tsteq	r2, r1, lsl r1
 28c:	00000640 	andeq	r0, r0, r0, asr #12
 290:	0b000f0b 	bleq	3ec4 <_start-0x3000413c>
 294:	0013490b 	andseq	r4, r3, fp, lsl #18
 298:	012e0c00 	teqeq	lr, r0, lsl #24
 29c:	0e030c3f 	mcreq	12, 0, r0, cr3, cr15, {1}
 2a0:	0b3b0b3a 	bleq	ec2f90 <_start-0x2f145070>
 2a4:	13490c27 	movtne	r0, #39975	; 0x9c27
 2a8:	01120111 	tsteq	r2, r1, lsl r1
 2ac:	13010640 	movwne	r0, #5696	; 0x1640
 2b0:	340d0000 	strcc	r0, [sp]
 2b4:	3a0e0300 	bcc	380ebc <_start-0x2fc87144>
 2b8:	490b3b0b 	stmdbmi	fp, {r0, r1, r3, r8, r9, fp, ip, sp}
 2bc:	000a0213 	andeq	r0, sl, r3, lsl r2
 2c0:	00340e00 	eorseq	r0, r4, r0, lsl #28
 2c4:	0b3a0803 	bleq	e822d8 <_start-0x2f185d28>
 2c8:	13490b3b 	movtne	r0, #39739	; 0x9b3b
 2cc:	00000a02 	andeq	r0, r0, r2, lsl #20
 2d0:	0b00240f 	bleq	9314 <_start-0x2fffecec>
 2d4:	030b3e0b 	movweq	r3, #48651	; 0xbe0b
 2d8:	10000008 	andne	r0, r0, r8
 2dc:	00000018 	andeq	r0, r0, r8, lsl r0
 2e0:	49002611 	stmdbmi	r0, {r0, r4, r9, sl, sp}
 2e4:	12000013 	andne	r0, r0, #19
 2e8:	13490101 	movtne	r0, #37121	; 0x9101
 2ec:	00001301 	andeq	r1, r0, r1, lsl #6
 2f0:	49002113 	stmdbmi	r0, {r0, r1, r4, r8, sp}
 2f4:	000b2f13 	andeq	r2, fp, r3, lsl pc
 2f8:	00241400 	eoreq	r1, r4, r0, lsl #8
 2fc:	0b3e0b0b 	bleq	f82f30 <_start-0x2f0850d0>
 300:	01000000 	tsteq	r0, r0
 304:	0e250111 	mcreq	1, 1, r0, cr5, cr1, {0}
 308:	0e030b13 	vmoveq.32	d3[0], r0
 30c:	01110e1b 	tsteq	r1, fp, lsl lr
 310:	06100112 	undefined instruction 0x06100112
 314:	2e020000 	cdpcs	0, 0, cr0, cr2, cr0, {0}
 318:	030c3f00 	movweq	r3, #52992	; 0xcf00
 31c:	3b0b3a0e 	blcc	2ceb5c <_start-0x2fd394a4>
 320:	110c270b 	tstne	ip, fp, lsl #14
 324:	40011201 	andmi	r1, r1, r1, lsl #4
 328:	03000006 	movweq	r0, #6
 32c:	0c3f002e 	ldceq	0, cr0, [pc], #-184	; 0xffffff48
 330:	0b3a0e03 	bleq	e83b44 <_start-0x2f1844bc>
 334:	01110b3b 	tsteq	r1, fp, lsr fp
 338:	06400112 	undefined instruction 0x06400112
 33c:	2e040000 	cdpcs	0, 0, cr0, cr4, cr0, {0}
 340:	030c3f00 	movweq	r3, #52992	; 0xcf00
 344:	3b0b3a0e 	blcc	2ceb84 <_start-0x2fd3947c>
 348:	1113490b 	tstne	r3, fp, lsl #18
 34c:	40011201 	andmi	r1, r1, r1, lsl #4
 350:	05000006 	streq	r0, [r0, #-6]
 354:	0b0b0024 	bleq	2c03ec <_start-0x2fd47c14>
 358:	08030b3e 	stmdaeq	r3, {r1, r2, r3, r4, r5, r8, r9, fp}
 35c:	00000000 	andeq	r0, r0, r0
 360:	25011101 	strcs	r1, [r1, #-257]	; 0x101
 364:	030b130e 	movweq	r1, #45838	; 0xb30e
 368:	110e1b0e 	tstne	lr, lr, lsl #22
 36c:	10011201 	andne	r1, r1, r1, lsl #4
 370:	02000006 	andeq	r0, r0, #6
 374:	0c3f012e 	ldfeqs	f0, [pc], #-184	; 0xffffff48
 378:	0b3a0e03 	bleq	e83b8c <_start-0x2f184474>
 37c:	0c270b3b 	stceq	11, cr0, [r7], #-236	; 0xffffff14
 380:	01120111 	tsteq	r2, r1, lsl r1
 384:	13010640 	movwne	r0, #5696	; 0x1640
 388:	05030000 	streq	r0, [r3]
 38c:	3a080300 	bcc	200f94 <_start-0x2fe0706c>
 390:	490b3b0b 	stmdbmi	fp, {r0, r1, r3, r8, r9, fp, ip, sp}
 394:	000a0213 	andeq	r0, sl, r3, lsl r2
 398:	00340400 	eorseq	r0, r4, r0, lsl #8
 39c:	0b3a0803 	bleq	e823b0 <_start-0x2f185c50>
 3a0:	13490b3b 	movtne	r0, #39739	; 0x9b3b
 3a4:	00000a02 	andeq	r0, r0, r2, lsl #20
 3a8:	0b002405 	bleq	93c4 <_start-0x2fffec3c>
 3ac:	030b3e0b 	movweq	r3, #48651	; 0xbe0b
 3b0:	06000008 	streq	r0, [r0], -r8
 3b4:	0c3f012e 	ldfeqs	f0, [pc], #-184	; 0xffffff48
 3b8:	0b3a0e03 	bleq	e83bcc <_start-0x2f184434>
 3bc:	0c270b3b 	stceq	11, cr0, [r7], #-236	; 0xffffff14
 3c0:	01111349 	tsteq	r1, r9, asr #6
 3c4:	06400112 	undefined instruction 0x06400112
 3c8:	00001301 	andeq	r1, r0, r1, lsl #6
 3cc:	0b002407 	bleq	93f0 <_start-0x2fffec10>
 3d0:	030b3e0b 	movweq	r3, #48651	; 0xbe0b
 3d4:	0800000e 	stmdaeq	r0, {r1, r2, r3}
 3d8:	0b0b000f 	bleq	2c041c <_start-0x2fd47be4>
 3dc:	00001349 	andeq	r1, r0, r9, asr #6
 3e0:	03000509 	movweq	r0, #1289	; 0x509
 3e4:	3b0b3a0e 	blcc	2cec24 <_start-0x2fd393dc>
 3e8:	0213490b 	andseq	r4, r3, #180224	; 0x2c000
 3ec:	0a00000a 	beq	41c <_start-0x30007be4>
 3f0:	13490026 	movtne	r0, #36902	; 0x9026
 3f4:	340b0000 	strcc	r0, [fp]
 3f8:	3a0e0300 	bcc	381000 <_start-0x2fc87000>
 3fc:	490b3b0b 	stmdbmi	fp, {r0, r1, r3, r8, r9, fp, ip, sp}
 400:	000a0213 	andeq	r0, sl, r3, lsl r2
 404:	000f0c00 	andeq	r0, pc, r0, lsl #24
 408:	00000b0b 	andeq	r0, r0, fp, lsl #22
 40c:	0000260d 	andeq	r2, r0, sp, lsl #12
 410:	012e0e00 	teqeq	lr, r0, lsl #28
 414:	0e030c3f 	mcreq	12, 0, r0, cr3, cr15, {1}
 418:	053b0b3a 	ldreq	r0, [fp, #-2874]!	; 0xb3a
 41c:	13490c27 	movtne	r0, #39975	; 0x9c27
 420:	01120111 	tsteq	r2, r1, lsl r1
 424:	13010640 	movwne	r0, #5696	; 0x1640
 428:	050f0000 	streq	r0, [pc, #0]	; 430 <_start-0x30007bd0>
 42c:	3a080300 	bcc	201034 <_start-0x2fe06fcc>
 430:	49053b0b 	stmdbmi	r5, {r0, r1, r3, r8, r9, fp, ip, sp}
 434:	000a0213 	andeq	r0, sl, r3, lsl r2
 438:	00341000 	eorseq	r1, r4, r0
 43c:	0b3a0803 	bleq	e82450 <_start-0x2f185bb0>
 440:	1349053b 	movtne	r0, #38203	; 0x953b
 444:	00000a02 	andeq	r0, r0, r2, lsl #20
 448:	3f012e11 	svccc	0x00012e11
 44c:	3a0e030c 	bcc	381084 <_start-0x2fc86f7c>
 450:	27053b0b 	strcs	r3, [r5, -fp, lsl #22]
 454:	1113490c 	tstne	r3, ip, lsl #18
 458:	40011201 	andmi	r1, r1, r1, lsl #4
 45c:	00000006 	andeq	r0, r0, r6

Disassembly of section .debug_aranges:

00000000 <.debug_aranges>:
   0:	0000001c 	andeq	r0, r0, ip, lsl r0
   4:	00000002 	andeq	r0, r0, r2
   8:	00040000 	andeq	r0, r4, r0
   c:	00000000 	andeq	r0, r0, r0
  10:	30008000 	andcc	r8, r0, r0
  14:	000001bc 	undefined instruction 0x000001bc
	...
  20:	0000001c 	andeq	r0, r0, ip, lsl r0
  24:	00650002 	rsbeq	r0, r5, r2
  28:	00040000 	andeq	r0, r4, r0
  2c:	00000000 	andeq	r0, r0, r0
  30:	300081c0 	andcc	r8, r0, r0, asr #3
  34:	0000037c 	andeq	r0, r0, ip, ror r3
	...
  40:	0000001c 	andeq	r0, r0, ip, lsl r0
  44:	01ff0002 	mvnseq	r0, r2
  48:	00040000 	andeq	r0, r4, r0
  4c:	00000000 	andeq	r0, r0, r0
  50:	3000853c 	andcc	r8, r0, ip, lsr r5
  54:	00000478 	andeq	r0, r0, r8, ror r4
	...
  60:	0000001c 	andeq	r0, r0, ip, lsl r0
  64:	042b0002 	strteq	r0, [fp], #-2
  68:	00040000 	andeq	r0, r4, r0
  6c:	00000000 	andeq	r0, r0, r0
  70:	300089b4 	undefined instruction 0x300089b4
  74:	00000164 	andeq	r0, r0, r4, ror #2
	...
  80:	0000001c 	andeq	r0, r0, ip, lsl r0
  84:	04c60002 	strbeq	r0, [r6], #2
  88:	00040000 	andeq	r0, r4, r0
  8c:	00000000 	andeq	r0, r0, r0
  90:	30008b18 	andcc	r8, r0, r8, lsl fp
  94:	0000063c 	andeq	r0, r0, ip, lsr r6
	...
  a0:	0000001c 	andeq	r0, r0, ip, lsl r0
  a4:	07050002 	streq	r0, [r5, -r2]
  a8:	00040000 	andeq	r0, r4, r0
  ac:	00000000 	andeq	r0, r0, r0
  b0:	30009154 	andcc	r9, r0, r4, asr r1
  b4:	000000fc 	strdeq	r0, [r0], -ip
	...
  c0:	0000001c 	andeq	r0, r0, ip, lsl r0
  c4:	079c0002 	ldreq	r0, [ip, r2]
  c8:	00040000 	andeq	r0, r4, r0
  cc:	00000000 	andeq	r0, r0, r0
  d0:	30009250 	andcc	r9, r0, r0, asr r2
  d4:	00000d84 	andeq	r0, r0, r4, lsl #27
	...

Disassembly of section .debug_frame:

00000000 <.debug_frame>:
   0:	0000000c 	andeq	r0, r0, ip
   4:	ffffffff 	undefined instruction 0xffffffff
   8:	7c010001 	stcvc	0, cr0, [r1], {1}
   c:	000d0c0e 	andeq	r0, sp, lr, lsl #24
  10:	0000001c 	andeq	r0, r0, ip, lsl r0
  14:	00000000 	andeq	r0, r0, r0
  18:	300081c0 	andcc	r8, r0, r0, asr #3
  1c:	000000b8 	strheq	r0, [r0], -r8
  20:	110c0e44 	tstne	ip, r4, asr #28
  24:	0b11010e 	bleq	440464 <_start-0x2fbc7b9c>
  28:	03041102 	movweq	r1, #16642	; 0x4102
  2c:	040b0c44 	streq	r0, [fp], #-3140	; 0xc44
  30:	0000001c 	andeq	r0, r0, ip, lsl r0
  34:	00000000 	andeq	r0, r0, r0
  38:	30008278 	andcc	r8, r0, r8, ror r2
  3c:	00000064 	andeq	r0, r0, r4, rrx
  40:	11080e44 	tstne	r8, r4, asr #28
  44:	0b11010e 	bleq	440484 <_start-0x2fbc7b7c>
  48:	0b0c4402 	bleq	311058 <_start-0x2fcf6fa8>
  4c:	00000004 	andeq	r0, r0, r4
  50:	0000001c 	andeq	r0, r0, ip, lsl r0
  54:	00000000 	andeq	r0, r0, r0
  58:	300082dc 	ldrdcc	r8, [r0], -ip
  5c:	00000210 	andeq	r0, r0, r0, lsl r2
  60:	11080e44 	tstne	r8, r4, asr #28
  64:	0b11010e 	bleq	4404a4 <_start-0x2fbc7b5c>
  68:	0b0c4402 	bleq	311078 <_start-0x2fcf6f88>
  6c:	00000004 	andeq	r0, r0, r4
  70:	0000001c 	andeq	r0, r0, ip, lsl r0
  74:	00000000 	andeq	r0, r0, r0
  78:	300084ec 	andcc	r8, r0, ip, ror #9
  7c:	0000003c 	andeq	r0, r0, ip, lsr r0
  80:	11080e44 	tstne	r8, r4, asr #28
  84:	0b11010e 	bleq	4404c4 <_start-0x2fbc7b3c>
  88:	0b0c4402 	bleq	311098 <_start-0x2fcf6f68>
  8c:	00000004 	andeq	r0, r0, r4
  90:	00000018 	andeq	r0, r0, r8, lsl r0
  94:	00000000 	andeq	r0, r0, r0
  98:	30008528 	andcc	r8, r0, r8, lsr #10
  9c:	00000014 	andeq	r0, r0, r4, lsl r0
  a0:	11040e44 	tstne	r4, r4, asr #28
  a4:	0d44010b 	stfeqe	f0, [r4, #-44]	; 0xffffffd4
  a8:	0000000b 	andeq	r0, r0, fp
  ac:	0000000c 	andeq	r0, r0, ip
  b0:	ffffffff 	undefined instruction 0xffffffff
  b4:	7c010001 	stcvc	0, cr0, [r1], {1}
  b8:	000d0c0e 	andeq	r0, sp, lr, lsl #24
  bc:	00000018 	andeq	r0, r0, r8, lsl r0
  c0:	000000ac 	andeq	r0, r0, ip, lsr #1
  c4:	3000853c 	andcc	r8, r0, ip, lsr r5
  c8:	0000002c 	andeq	r0, r0, ip, lsr #32
  cc:	11040e44 	tstne	r4, r4, asr #28
  d0:	0d44010b 	stfeqe	f0, [r4, #-44]	; 0xffffffd4
  d4:	0000000b 	andeq	r0, r0, fp
  d8:	00000018 	andeq	r0, r0, r8, lsl r0
  dc:	000000ac 	andeq	r0, r0, ip, lsr #1
  e0:	30008568 	andcc	r8, r0, r8, ror #10
  e4:	0000002c 	andeq	r0, r0, ip, lsr #32
  e8:	11040e44 	tstne	r4, r4, asr #28
  ec:	0d44010b 	stfeqe	f0, [r4, #-44]	; 0xffffffd4
  f0:	0000000b 	andeq	r0, r0, fp
  f4:	00000018 	andeq	r0, r0, r8, lsl r0
  f8:	000000ac 	andeq	r0, r0, ip, lsr #1
  fc:	30008594 	mulcc	r0, r4, r5
 100:	00000034 	andeq	r0, r0, r4, lsr r0
 104:	11040e44 	tstne	r4, r4, asr #28
 108:	0d44010b 	stfeqe	f0, [r4, #-44]	; 0xffffffd4
 10c:	0000000b 	andeq	r0, r0, fp
 110:	00000018 	andeq	r0, r0, r8, lsl r0
 114:	000000ac 	andeq	r0, r0, ip, lsr #1
 118:	300085c8 	andcc	r8, r0, r8, asr #11
 11c:	00000030 	andeq	r0, r0, r0, lsr r0
 120:	11040e44 	tstne	r4, r4, asr #28
 124:	0d44010b 	stfeqe	f0, [r4, #-44]	; 0xffffffd4
 128:	0000000b 	andeq	r0, r0, fp
 12c:	00000018 	andeq	r0, r0, r8, lsl r0
 130:	000000ac 	andeq	r0, r0, ip, lsr #1
 134:	300085f8 	strdcc	r8, [r0], -r8
 138:	00000030 	andeq	r0, r0, r0, lsr r0
 13c:	11040e44 	tstne	r4, r4, asr #28
 140:	0d44010b 	stfeqe	f0, [r4, #-44]	; 0xffffffd4
 144:	0000000b 	andeq	r0, r0, fp
 148:	00000018 	andeq	r0, r0, r8, lsl r0
 14c:	000000ac 	andeq	r0, r0, ip, lsr #1
 150:	30008628 	andcc	r8, r0, r8, lsr #12
 154:	00000030 	andeq	r0, r0, r0, lsr r0
 158:	11040e44 	tstne	r4, r4, asr #28
 15c:	0d44010b 	stfeqe	f0, [r4, #-44]	; 0xffffffd4
 160:	0000000b 	andeq	r0, r0, fp
 164:	0000001c 	andeq	r0, r0, ip, lsl r0
 168:	000000ac 	andeq	r0, r0, ip, lsr #1
 16c:	30008658 	andcc	r8, r0, r8, asr r6
 170:	0000002c 	andeq	r0, r0, ip, lsr #32
 174:	11080e44 	tstne	r8, r4, asr #28
 178:	0b11010e 	bleq	4405b8 <_start-0x2fbc7a48>
 17c:	0b0c4402 	bleq	31118c <_start-0x2fcf6e74>
 180:	00000004 	andeq	r0, r0, r4
 184:	0000001c 	andeq	r0, r0, ip, lsl r0
 188:	000000ac 	andeq	r0, r0, ip, lsr #1
 18c:	30008684 	andcc	r8, r0, r4, lsl #13
 190:	00000038 	andeq	r0, r0, r8, lsr r0
 194:	11080e44 	tstne	r8, r4, asr #28
 198:	0b11010e 	bleq	4405d8 <_start-0x2fbc7a28>
 19c:	0b0c4402 	bleq	3111ac <_start-0x2fcf6e54>
 1a0:	00000004 	andeq	r0, r0, r4
 1a4:	0000001c 	andeq	r0, r0, ip, lsl r0
 1a8:	000000ac 	andeq	r0, r0, ip, lsr #1
 1ac:	300086bc 	undefined instruction 0x300086bc
 1b0:	000000dc 	ldrdeq	r0, [r0], -ip
 1b4:	11080e44 	tstne	r8, r4, asr #28
 1b8:	0b11010e 	bleq	4405f8 <_start-0x2fbc7a08>
 1bc:	0b0c4402 	bleq	3111cc <_start-0x2fcf6e34>
 1c0:	00000004 	andeq	r0, r0, r4
 1c4:	0000001c 	andeq	r0, r0, ip, lsl r0
 1c8:	000000ac 	andeq	r0, r0, ip, lsr #1
 1cc:	30008798 	mulcc	r0, r8, r7
 1d0:	00000100 	andeq	r0, r0, r0, lsl #2
 1d4:	11080e44 	tstne	r8, r4, asr #28
 1d8:	0b11010e 	bleq	440618 <_start-0x2fbc79e8>
 1dc:	0b0c4402 	bleq	3111ec <_start-0x2fcf6e14>
 1e0:	00000004 	andeq	r0, r0, r4
 1e4:	0000001c 	andeq	r0, r0, ip, lsl r0
 1e8:	000000ac 	andeq	r0, r0, ip, lsr #1
 1ec:	30008898 	mulcc	r0, r8, r8
 1f0:	0000007c 	andeq	r0, r0, ip, ror r0
 1f4:	11080e44 	tstne	r8, r4, asr #28
 1f8:	0b11010e 	bleq	440638 <_start-0x2fbc79c8>
 1fc:	0b0c4402 	bleq	31120c <_start-0x2fcf6df4>
 200:	00000004 	andeq	r0, r0, r4
 204:	0000001c 	andeq	r0, r0, ip, lsl r0
 208:	000000ac 	andeq	r0, r0, ip, lsr #1
 20c:	30008914 	andcc	r8, r0, r4, lsl r9
 210:	000000a0 	andeq	r0, r0, r0, lsr #1
 214:	11080e44 	tstne	r8, r4, asr #28
 218:	0b11010e 	bleq	440658 <_start-0x2fbc79a8>
 21c:	0b0c4402 	bleq	31122c <_start-0x2fcf6dd4>
 220:	00000004 	andeq	r0, r0, r4
 224:	0000000c 	andeq	r0, r0, ip
 228:	ffffffff 	undefined instruction 0xffffffff
 22c:	7c010001 	stcvc	0, cr0, [r1], {1}
 230:	000d0c0e 	andeq	r0, sp, lr, lsl #24
 234:	00000018 	andeq	r0, r0, r8, lsl r0
 238:	00000224 	andeq	r0, r0, r4, lsr #4
 23c:	300089b4 	undefined instruction 0x300089b4
 240:	000000fc 	strdeq	r0, [r0], -ip
 244:	11040e44 	tstne	r4, r4, asr #28
 248:	0d44010b 	stfeqe	f0, [r4, #-44]	; 0xffffffd4
 24c:	0000000b 	andeq	r0, r0, fp
 250:	00000018 	andeq	r0, r0, r8, lsl r0
 254:	00000224 	andeq	r0, r0, r4, lsr #4
 258:	30008ab0 	undefined instruction 0x30008ab0
 25c:	00000068 	andeq	r0, r0, r8, rrx
 260:	11040e44 	tstne	r4, r4, asr #28
 264:	0d44010b 	stfeqe	f0, [r4, #-44]	; 0xffffffd4
 268:	0000000b 	andeq	r0, r0, fp
 26c:	0000000c 	andeq	r0, r0, ip
 270:	ffffffff 	undefined instruction 0xffffffff
 274:	7c010001 	stcvc	0, cr0, [r1], {1}
 278:	000d0c0e 	andeq	r0, sp, lr, lsl #24
 27c:	00000018 	andeq	r0, r0, r8, lsl r0
 280:	0000026c 	andeq	r0, r0, ip, ror #4
 284:	30008b18 	andcc	r8, r0, r8, lsl fp
 288:	0000007c 	andeq	r0, r0, ip, ror r0
 28c:	11040e44 	tstne	r4, r4, asr #28
 290:	0d44010b 	stfeqe	f0, [r4, #-44]	; 0xffffffd4
 294:	0000000b 	andeq	r0, r0, fp
 298:	00000018 	andeq	r0, r0, r8, lsl r0
 29c:	0000026c 	andeq	r0, r0, ip, ror #4
 2a0:	30008b94 	mulcc	r0, r4, fp
 2a4:	00000048 	andeq	r0, r0, r8, asr #32
 2a8:	11040e44 	tstne	r4, r4, asr #28
 2ac:	0d44010b 	stfeqe	f0, [r4, #-44]	; 0xffffffd4
 2b0:	0000000b 	andeq	r0, r0, fp
 2b4:	00000018 	andeq	r0, r0, r8, lsl r0
 2b8:	0000026c 	andeq	r0, r0, ip, ror #4
 2bc:	30008bdc 	ldrdcc	r8, [r0], -ip
 2c0:	00000040 	andeq	r0, r0, r0, asr #32
 2c4:	11040e44 	tstne	r4, r4, asr #28
 2c8:	0d44010b 	stfeqe	f0, [r4, #-44]	; 0xffffffd4
 2cc:	0000000b 	andeq	r0, r0, fp
 2d0:	0000001c 	andeq	r0, r0, ip, lsl r0
 2d4:	0000026c 	andeq	r0, r0, ip, ror #4
 2d8:	30008c1c 	andcc	r8, r0, ip, lsl ip
 2dc:	0000004c 	andeq	r0, r0, ip, asr #32
 2e0:	11080e44 	tstne	r8, r4, asr #28
 2e4:	0b11010e 	bleq	440724 <_start-0x2fbc78dc>
 2e8:	0b0c4402 	bleq	3112f8 <_start-0x2fcf6d08>
 2ec:	00000004 	andeq	r0, r0, r4
 2f0:	0000001c 	andeq	r0, r0, ip, lsl r0
 2f4:	0000026c 	andeq	r0, r0, ip, ror #4
 2f8:	30008c68 	andcc	r8, r0, r8, ror #24
 2fc:	0000008c 	andeq	r0, r0, ip, lsl #1
 300:	11080e44 	tstne	r8, r4, asr #28
 304:	0b11010e 	bleq	440744 <_start-0x2fbc78bc>
 308:	0b0c4402 	bleq	311318 <_start-0x2fcf6ce8>
 30c:	00000004 	andeq	r0, r0, r4
 310:	0000001c 	andeq	r0, r0, ip, lsl r0
 314:	0000026c 	andeq	r0, r0, ip, ror #4
 318:	30008cf4 	strdcc	r8, [r0], -r4
 31c:	00000110 	andeq	r0, r0, r0, lsl r1
 320:	11080e44 	tstne	r8, r4, asr #28
 324:	0b11010e 	bleq	440764 <_start-0x2fbc789c>
 328:	0b0c4402 	bleq	311338 <_start-0x2fcf6cc8>
 32c:	00000004 	andeq	r0, r0, r4
 330:	0000001c 	andeq	r0, r0, ip, lsl r0
 334:	0000026c 	andeq	r0, r0, ip, ror #4
 338:	30008e04 	andcc	r8, r0, r4, lsl #28
 33c:	00000174 	andeq	r0, r0, r4, ror r1
 340:	11080e44 	tstne	r8, r4, asr #28
 344:	0b11010e 	bleq	440784 <_start-0x2fbc787c>
 348:	0b0c4402 	bleq	311358 <_start-0x2fcf6ca8>
 34c:	00000004 	andeq	r0, r0, r4
 350:	00000028 	andeq	r0, r0, r8, lsr #32
 354:	0000026c 	andeq	r0, r0, ip, ror #4
 358:	30008f78 	andcc	r8, r0, r8, ror pc
 35c:	000001dc 	ldrdeq	r0, [r0], -ip
 360:	44100e44 	ldrmi	r0, [r0], #-3652	; 0xe44
 364:	0e11180e 	cdpeq	8, 1, cr1, cr1, cr14, {0}
 368:	060b1105 	streq	r1, [fp], -r5, lsl #2
 36c:	11010311 	tstne	r1, r1, lsl r3
 370:	01110202 	tsteq	r1, r2, lsl #4
 374:	04001103 	streq	r1, [r0], #-259	; 0x103
 378:	140b0c44 	strne	r0, [fp], #-3140	; 0xc44
 37c:	0000000c 	andeq	r0, r0, ip
 380:	ffffffff 	undefined instruction 0xffffffff
 384:	7c010001 	stcvc	0, cr0, [r1], {1}
 388:	000d0c0e 	andeq	r0, sp, lr, lsl #24
 38c:	00000018 	andeq	r0, r0, r8, lsl r0
 390:	0000037c 	andeq	r0, r0, ip, ror r3
 394:	30009154 	andcc	r9, r0, r4, asr r1
 398:	00000040 	andeq	r0, r0, r0, asr #32
 39c:	11040e44 	tstne	r4, r4, asr #28
 3a0:	0d44010b 	stfeqe	f0, [r4, #-44]	; 0xffffffd4
 3a4:	0000000b 	andeq	r0, r0, fp
 3a8:	00000018 	andeq	r0, r0, r8, lsl r0
 3ac:	0000037c 	andeq	r0, r0, ip, ror r3
 3b0:	30009194 	mulcc	r0, r4, r1
 3b4:	00000040 	andeq	r0, r0, r0, asr #32
 3b8:	11040e44 	tstne	r4, r4, asr #28
 3bc:	0d44010b 	stfeqe	f0, [r4, #-44]	; 0xffffffd4
 3c0:	0000000b 	andeq	r0, r0, fp
 3c4:	00000018 	andeq	r0, r0, r8, lsl r0
 3c8:	0000037c 	andeq	r0, r0, ip, ror r3
 3cc:	300091d4 	ldrdcc	r9, [r0], -r4
 3d0:	00000034 	andeq	r0, r0, r4, lsr r0
 3d4:	11040e44 	tstne	r4, r4, asr #28
 3d8:	0d44010b 	stfeqe	f0, [r4, #-44]	; 0xffffffd4
 3dc:	0000000b 	andeq	r0, r0, fp
 3e0:	00000018 	andeq	r0, r0, r8, lsl r0
 3e4:	0000037c 	andeq	r0, r0, ip, ror r3
 3e8:	30009208 	andcc	r9, r0, r8, lsl #4
 3ec:	00000024 	andeq	r0, r0, r4, lsr #32
 3f0:	11040e44 	tstne	r4, r4, asr #28
 3f4:	0d44010b 	stfeqe	f0, [r4, #-44]	; 0xffffffd4
 3f8:	0000000b 	andeq	r0, r0, fp
 3fc:	00000018 	andeq	r0, r0, r8, lsl r0
 400:	0000037c 	andeq	r0, r0, ip, ror r3
 404:	3000922c 	andcc	r9, r0, ip, lsr #4
 408:	00000024 	andeq	r0, r0, r4, lsr #32
 40c:	11040e44 	tstne	r4, r4, asr #28
 410:	0d44010b 	stfeqe	f0, [r4, #-44]	; 0xffffffd4
 414:	0000000b 	andeq	r0, r0, fp
 418:	0000000c 	andeq	r0, r0, ip
 41c:	ffffffff 	undefined instruction 0xffffffff
 420:	7c010001 	stcvc	0, cr0, [r1], {1}
 424:	000d0c0e 	andeq	r0, sp, lr, lsl #24
 428:	00000018 	andeq	r0, r0, r8, lsl r0
 42c:	00000418 	andeq	r0, r0, r8, lsl r4
 430:	30009250 	andcc	r9, r0, r0, asr r2
 434:	00000070 	andeq	r0, r0, r0, ror r0
 438:	11040e44 	tstne	r4, r4, asr #28
 43c:	0d44010b 	stfeqe	f0, [r4, #-44]	; 0xffffffd4
 440:	0000000b 	andeq	r0, r0, fp
 444:	00000018 	andeq	r0, r0, r8, lsl r0
 448:	00000418 	andeq	r0, r0, r8, lsl r4
 44c:	300092c0 	andcc	r9, r0, r0, asr #5
 450:	00000068 	andeq	r0, r0, r8, rrx
 454:	11040e44 	tstne	r4, r4, asr #28
 458:	0d44010b 	stfeqe	f0, [r4, #-44]	; 0xffffffd4
 45c:	0000000b 	andeq	r0, r0, fp
 460:	0000001c 	andeq	r0, r0, ip, lsl r0
 464:	00000418 	andeq	r0, r0, r8, lsl r4
 468:	30009328 	andcc	r9, r0, r8, lsr #6
 46c:	000000d4 	ldrdeq	r0, [r0], -r4
 470:	110c0e44 	tstne	ip, r4, asr #28
 474:	0b11010e 	bleq	4408b4 <_start-0x2fbc774c>
 478:	03041102 	movweq	r1, #16642	; 0x4102
 47c:	040b0c44 	streq	r0, [fp], #-3140	; 0xc44
 480:	00000018 	andeq	r0, r0, r8, lsl r0
 484:	00000418 	andeq	r0, r0, r8, lsl r4
 488:	300093fc 	strdcc	r9, [r0], -ip
 48c:	000000b8 	strheq	r0, [r0], -r8
 490:	11040e44 	tstne	r4, r4, asr #28
 494:	0d44010b 	stfeqe	f0, [r4, #-44]	; 0xffffffd4
 498:	0000000b 	andeq	r0, r0, fp
 49c:	00000018 	andeq	r0, r0, r8, lsl r0
 4a0:	00000418 	andeq	r0, r0, r8, lsl r4
 4a4:	300094b4 	undefined instruction 0x300094b4
 4a8:	00000078 	andeq	r0, r0, r8, ror r0
 4ac:	11040e44 	tstne	r4, r4, asr #28
 4b0:	0d44010b 	stfeqe	f0, [r4, #-44]	; 0xffffffd4
 4b4:	0000000b 	andeq	r0, r0, fp
 4b8:	00000018 	andeq	r0, r0, r8, lsl r0
 4bc:	00000418 	andeq	r0, r0, r8, lsl r4
 4c0:	3000952c 	andcc	r9, r0, ip, lsr #10
 4c4:	000000a4 	andeq	r0, r0, r4, lsr #1
 4c8:	11040e44 	tstne	r4, r4, asr #28
 4cc:	0d44010b 	stfeqe	f0, [r4, #-44]	; 0xffffffd4
 4d0:	0000000b 	andeq	r0, r0, fp
 4d4:	00000018 	andeq	r0, r0, r8, lsl r0
 4d8:	00000418 	andeq	r0, r0, r8, lsl r4
 4dc:	300095d0 	ldrdcc	r9, [r0], -r0
 4e0:	00000098 	muleq	r0, r8, r0
 4e4:	11040e44 	tstne	r4, r4, asr #28
 4e8:	0d44010b 	stfeqe	f0, [r4, #-44]	; 0xffffffd4
 4ec:	0000000b 	andeq	r0, r0, fp
 4f0:	00000018 	andeq	r0, r0, r8, lsl r0
 4f4:	00000418 	andeq	r0, r0, r8, lsl r4
 4f8:	30009668 	andcc	r9, r0, r8, ror #12
 4fc:	000000d4 	ldrdeq	r0, [r0], -r4
 500:	11040e44 	tstne	r4, r4, asr #28
 504:	0d44010b 	stfeqe	f0, [r4, #-44]	; 0xffffffd4
 508:	0000000b 	andeq	r0, r0, fp
 50c:	0000001c 	andeq	r0, r0, ip, lsl r0
 510:	00000418 	andeq	r0, r0, r8, lsl r4
 514:	3000973c 	andcc	r9, r0, ip, lsr r7
 518:	000000a8 	andeq	r0, r0, r8, lsr #1
 51c:	11080e44 	tstne	r8, r4, asr #28
 520:	0411010b 	ldreq	r0, [r1], #-267	; 0x10b
 524:	0b0c4402 	bleq	311534 <_start-0x2fcf6acc>
 528:	00000004 	andeq	r0, r0, r4
 52c:	0000001c 	andeq	r0, r0, ip, lsl r0
 530:	00000418 	andeq	r0, r0, r8, lsl r4
 534:	300097e4 	andcc	r9, r0, r4, ror #15
 538:	000000c4 	andeq	r0, r0, r4, asr #1
 53c:	11080e44 	tstne	r8, r4, asr #28
 540:	0411010b 	ldreq	r0, [r1], #-267	; 0x10b
 544:	0b0c4402 	bleq	311554 <_start-0x2fcf6aac>
 548:	00000004 	andeq	r0, r0, r4
 54c:	00000018 	andeq	r0, r0, r8, lsl r0
 550:	00000418 	andeq	r0, r0, r8, lsl r4
 554:	300098a8 	andcc	r9, r0, r8, lsr #17
 558:	00000068 	andeq	r0, r0, r8, rrx
 55c:	11040e44 	tstne	r4, r4, asr #28
 560:	0d44010b 	stfeqe	f0, [r4, #-44]	; 0xffffffd4
 564:	0000000b 	andeq	r0, r0, fp
 568:	00000018 	andeq	r0, r0, r8, lsl r0
 56c:	00000418 	andeq	r0, r0, r8, lsl r4
 570:	30009910 	andcc	r9, r0, r0, lsl r9
 574:	00000054 	andeq	r0, r0, r4, asr r0
 578:	11040e44 	tstne	r4, r4, asr #28
 57c:	0d44010b 	stfeqe	f0, [r4, #-44]	; 0xffffffd4
 580:	0000000b 	andeq	r0, r0, fp
 584:	00000018 	andeq	r0, r0, r8, lsl r0
 588:	00000418 	andeq	r0, r0, r8, lsl r4
 58c:	30009964 	andcc	r9, r0, r4, ror #18
 590:	00000080 	andeq	r0, r0, r0, lsl #1
 594:	11040e44 	tstne	r4, r4, asr #28
 598:	0d44010b 	stfeqe	f0, [r4, #-44]	; 0xffffffd4
 59c:	0000000b 	andeq	r0, r0, fp
 5a0:	00000018 	andeq	r0, r0, r8, lsl r0
 5a4:	00000418 	andeq	r0, r0, r8, lsl r4
 5a8:	300099e4 	andcc	r9, r0, r4, ror #19
 5ac:	000000c4 	andeq	r0, r0, r4, asr #1
 5b0:	11040e44 	tstne	r4, r4, asr #28
 5b4:	0d44010b 	stfeqe	f0, [r4, #-44]	; 0xffffffd4
 5b8:	0000000b 	andeq	r0, r0, fp
 5bc:	00000018 	andeq	r0, r0, r8, lsl r0
 5c0:	00000418 	andeq	r0, r0, r8, lsl r4
 5c4:	30009aa8 	andcc	r9, r0, r8, lsr #21
 5c8:	00000098 	muleq	r0, r8, r0
 5cc:	11040e44 	tstne	r4, r4, asr #28
 5d0:	0d44010b 	stfeqe	f0, [r4, #-44]	; 0xffffffd4
 5d4:	0000000b 	andeq	r0, r0, fp
 5d8:	00000018 	andeq	r0, r0, r8, lsl r0
 5dc:	00000418 	andeq	r0, r0, r8, lsl r4
 5e0:	30009b40 	andcc	r9, r0, r0, asr #22
 5e4:	0000007c 	andeq	r0, r0, ip, ror r0
 5e8:	11040e44 	tstne	r4, r4, asr #28
 5ec:	0d44010b 	stfeqe	f0, [r4, #-44]	; 0xffffffd4
 5f0:	0000000b 	andeq	r0, r0, fp
 5f4:	00000018 	andeq	r0, r0, r8, lsl r0
 5f8:	00000418 	andeq	r0, r0, r8, lsl r4
 5fc:	30009bbc 	undefined instruction 0x30009bbc
 600:	00000090 	muleq	r0, r0, r0
 604:	11040e44 	tstne	r4, r4, asr #28
 608:	0d44010b 	stfeqe	f0, [r4, #-44]	; 0xffffffd4
 60c:	0000000b 	andeq	r0, r0, fp
 610:	00000018 	andeq	r0, r0, r8, lsl r0
 614:	00000418 	andeq	r0, r0, r8, lsl r4
 618:	30009c4c 	andcc	r9, r0, ip, asr #24
 61c:	00000118 	andeq	r0, r0, r8, lsl r1
 620:	11040e44 	tstne	r4, r4, asr #28
 624:	0d44010b 	stfeqe	f0, [r4, #-44]	; 0xffffffd4
 628:	0000000b 	andeq	r0, r0, fp
 62c:	00000018 	andeq	r0, r0, r8, lsl r0
 630:	00000418 	andeq	r0, r0, r8, lsl r4
 634:	30009d64 	andcc	r9, r0, r4, ror #26
 638:	000000a8 	andeq	r0, r0, r8, lsr #1
 63c:	11040e44 	tstne	r4, r4, asr #28
 640:	0d44010b 	stfeqe	f0, [r4, #-44]	; 0xffffffd4
 644:	0000000b 	andeq	r0, r0, fp
 648:	00000018 	andeq	r0, r0, r8, lsl r0
 64c:	00000418 	andeq	r0, r0, r8, lsl r4
 650:	30009e0c 	andcc	r9, r0, ip, lsl #28
 654:	0000007c 	andeq	r0, r0, ip, ror r0
 658:	11040e44 	tstne	r4, r4, asr #28
 65c:	0d44010b 	stfeqe	f0, [r4, #-44]	; 0xffffffd4
 660:	0000000b 	andeq	r0, r0, fp
 664:	0000001c 	andeq	r0, r0, ip, lsl r0
 668:	00000418 	andeq	r0, r0, r8, lsl r4
 66c:	30009e88 	andcc	r9, r0, r8, lsl #29
 670:	000000ac 	andeq	r0, r0, ip, lsr #1
 674:	11080e44 	tstne	r8, r4, asr #28
 678:	0b11010e 	bleq	440ab8 <_start-0x2fbc7548>
 67c:	0b0c4402 	bleq	31168c <_start-0x2fcf6974>
 680:	00000004 	andeq	r0, r0, r4
 684:	00000018 	andeq	r0, r0, r8, lsl r0
 688:	00000418 	andeq	r0, r0, r8, lsl r4
 68c:	30009f34 	andcc	r9, r0, r4, lsr pc
 690:	000000a0 	andeq	r0, r0, r0, lsr #1
 694:	11040e44 	tstne	r4, r4, asr #28
 698:	0d44010b 	stfeqe	f0, [r4, #-44]	; 0xffffffd4
 69c:	0000000b 	andeq	r0, r0, fp

Disassembly of section .debug_loc:

00000000 <.debug_loc>:
   0:	00000000 	andeq	r0, r0, r0
   4:	00000004 	andeq	r0, r0, r4
   8:	045d0001 	ldrbeq	r0, [sp], #-1
   c:	08000000 	stmdaeq	r0, {}
  10:	02000000 	andeq	r0, r0, #0
  14:	080c7d00 	stmdaeq	ip, {r8, sl, fp, ip, sp, lr}
  18:	b8000000 	stmdalt	r0, {}
  1c:	02000000 	andeq	r0, r0, #0
  20:	00047b00 	andeq	r7, r4, r0, lsl #22
  24:	00000000 	andeq	r0, r0, r0
  28:	b8000000 	stmdalt	r0, {}
  2c:	bc000000 	stclt	0, cr0, [r0], {0}
  30:	01000000 	tsteq	r0, r0
  34:	00bc5d00 	adcseq	r5, ip, r0, lsl #26
  38:	00c00000 	sbceq	r0, r0, r0
  3c:	00020000 	andeq	r0, r2, r0
  40:	00c0087d 	sbceq	r0, r0, sp, ror r8
  44:	011c0000 	tsteq	ip, r0
  48:	00020000 	andeq	r0, r2, r0
  4c:	0000047b 	andeq	r0, r0, fp, ror r4
  50:	00000000 	andeq	r0, r0, r0
  54:	011c0000 	tsteq	ip, r0
  58:	01200000 	teqeq	r0, r0
  5c:	00010000 	andeq	r0, r1, r0
  60:	0001205d 	andeq	r2, r1, sp, asr r0
  64:	00012400 	andeq	r2, r1, r0, lsl #8
  68:	7d000200 	sfmvc	f0, 4, [r0]	; (stcvc 2, cr0, [r0])
  6c:	00012408 	andeq	r2, r1, r8, lsl #8
  70:	00032c00 	andeq	r2, r3, r0, lsl #24
  74:	7b000200 	blvc	87c <_start-0x30007784>
  78:	00000004 	andeq	r0, r0, r4
  7c:	00000000 	andeq	r0, r0, r0
  80:	00032c00 	andeq	r2, r3, r0, lsl #24
  84:	00033000 	andeq	r3, r3, r0
  88:	5d000100 	stfpls	f0, [r0]
  8c:	00000330 	andeq	r0, r0, r0, lsr r3
  90:	00000334 	andeq	r0, r0, r4, lsr r3
  94:	087d0002 	ldmdaeq	sp!, {r1}^
  98:	00000334 	andeq	r0, r0, r4, lsr r3
  9c:	00000368 	andeq	r0, r0, r8, ror #6
  a0:	047b0002 	ldrbteq	r0, [fp], #-2
	...
  ac:	00000368 	andeq	r0, r0, r8, ror #6
  b0:	0000036c 	andeq	r0, r0, ip, ror #6
  b4:	6c5d0001 	mrrcvs	0, 0, r0, sp, cr1
  b8:	70000003 	andvc	r0, r0, r3
  bc:	02000003 	andeq	r0, r0, #3
  c0:	70047d00 	andvc	r7, r4, r0, lsl #26
  c4:	7c000003 	stcvc	0, cr0, [r0], {3}
  c8:	02000003 	andeq	r0, r0, #3
  cc:	00047b00 	andeq	r7, r4, r0, lsl #22
	...
  d8:	04000000 	streq	r0, [r0]
  dc:	01000000 	tsteq	r0, r0
  e0:	00045d00 	andeq	r5, r4, r0, lsl #26
  e4:	00080000 	andeq	r0, r8, r0
  e8:	00020000 	andeq	r0, r2, r0
  ec:	0008047d 	andeq	r0, r8, sp, ror r4
  f0:	002c0000 	eoreq	r0, ip, r0
  f4:	00020000 	andeq	r0, r2, r0
  f8:	0000047b 	andeq	r0, r0, fp, ror r4
  fc:	00000000 	andeq	r0, r0, r0
 100:	002c0000 	eoreq	r0, ip, r0
 104:	00300000 	eorseq	r0, r0, r0
 108:	00010000 	andeq	r0, r1, r0
 10c:	0000305d 	andeq	r3, r0, sp, asr r0
 110:	00003400 	andeq	r3, r0, r0, lsl #8
 114:	7d000200 	sfmvc	f0, 4, [r0]	; (stcvc 2, cr0, [r0])
 118:	00003404 	andeq	r3, r0, r4, lsl #8
 11c:	00005800 	andeq	r5, r0, r0, lsl #16
 120:	7b000200 	blvc	928 <_start-0x300076d8>
 124:	00000004 	andeq	r0, r0, r4
 128:	00000000 	andeq	r0, r0, r0
 12c:	00005800 	andeq	r5, r0, r0, lsl #16
 130:	00005c00 	andeq	r5, r0, r0, lsl #24
 134:	5d000100 	stfpls	f0, [r0]
 138:	0000005c 	andeq	r0, r0, ip, asr r0
 13c:	00000060 	andeq	r0, r0, r0, rrx
 140:	047d0002 	ldrbteq	r0, [sp], #-2
 144:	00000060 	andeq	r0, r0, r0, rrx
 148:	0000008c 	andeq	r0, r0, ip, lsl #1
 14c:	047b0002 	ldrbteq	r0, [fp], #-2
	...
 158:	0000008c 	andeq	r0, r0, ip, lsl #1
 15c:	00000090 	muleq	r0, r0, r0
 160:	905d0001 	subsls	r0, sp, r1
 164:	94000000 	strls	r0, [r0]
 168:	02000000 	andeq	r0, r0, #0
 16c:	94047d00 	strls	r7, [r4], #-3328	; 0xd00
 170:	bc000000 	stclt	0, cr0, [r0], {0}
 174:	02000000 	andeq	r0, r0, #0
 178:	00047b00 	andeq	r7, r4, r0, lsl #22
 17c:	00000000 	andeq	r0, r0, r0
 180:	bc000000 	stclt	0, cr0, [r0], {0}
 184:	c0000000 	andgt	r0, r0, r0
 188:	01000000 	tsteq	r0, r0
 18c:	00c05d00 	sbceq	r5, r0, r0, lsl #26
 190:	00c40000 	sbceq	r0, r4, r0
 194:	00020000 	andeq	r0, r2, r0
 198:	00c4047d 	sbceq	r0, r4, sp, ror r4
 19c:	00ec0000 	rsceq	r0, ip, r0
 1a0:	00020000 	andeq	r0, r2, r0
 1a4:	0000047b 	andeq	r0, r0, fp, ror r4
 1a8:	00000000 	andeq	r0, r0, r0
 1ac:	00ec0000 	rsceq	r0, ip, r0
 1b0:	00f00000 	rscseq	r0, r0, r0
 1b4:	00010000 	andeq	r0, r1, r0
 1b8:	0000f05d 	andeq	pc, r0, sp, asr r0
 1bc:	0000f400 	andeq	pc, r0, r0, lsl #8
 1c0:	7d000200 	sfmvc	f0, 4, [r0]	; (stcvc 2, cr0, [r0])
 1c4:	0000f404 	andeq	pc, r0, r4, lsl #8
 1c8:	00011c00 	andeq	r1, r1, r0, lsl #24
 1cc:	7b000200 	blvc	9d4 <_start-0x3000762c>
 1d0:	00000004 	andeq	r0, r0, r4
 1d4:	00000000 	andeq	r0, r0, r0
 1d8:	00011c00 	andeq	r1, r1, r0, lsl #24
 1dc:	00012000 	andeq	r2, r1, r0
 1e0:	5d000100 	stfpls	f0, [r0]
 1e4:	00000120 	andeq	r0, r0, r0, lsr #2
 1e8:	00000124 	andeq	r0, r0, r4, lsr #2
 1ec:	087d0002 	ldmdaeq	sp!, {r1}^
 1f0:	00000124 	andeq	r0, r0, r4, lsr #2
 1f4:	00000148 	andeq	r0, r0, r8, asr #2
 1f8:	047b0002 	ldrbteq	r0, [fp], #-2
	...
 204:	00000148 	andeq	r0, r0, r8, asr #2
 208:	0000014c 	andeq	r0, r0, ip, asr #2
 20c:	4c5d0001 	mrrcmi	0, 0, r0, sp, cr1
 210:	50000001 	andpl	r0, r0, r1
 214:	02000001 	andeq	r0, r0, #1
 218:	50087d00 	andpl	r7, r8, r0, lsl #26
 21c:	80000001 	andhi	r0, r0, r1
 220:	02000001 	andeq	r0, r0, #1
 224:	00047b00 	andeq	r7, r4, r0, lsl #22
 228:	00000000 	andeq	r0, r0, r0
 22c:	80000000 	andhi	r0, r0, r0
 230:	84000001 	strhi	r0, [r0], #-1
 234:	01000001 	tsteq	r0, r1
 238:	01845d00 	orreq	r5, r4, r0, lsl #26
 23c:	01880000 	orreq	r0, r8, r0
 240:	00020000 	andeq	r0, r2, r0
 244:	0188087d 	orreq	r0, r8, sp, ror r8
 248:	025c0000 	subseq	r0, ip, #0
 24c:	00020000 	andeq	r0, r2, r0
 250:	0000047b 	andeq	r0, r0, fp, ror r4
 254:	00000000 	andeq	r0, r0, r0
 258:	025c0000 	subseq	r0, ip, #0
 25c:	02600000 	rsbeq	r0, r0, #0
 260:	00010000 	andeq	r0, r1, r0
 264:	0002605d 	andeq	r6, r2, sp, asr r0
 268:	00026400 	andeq	r6, r2, r0, lsl #8
 26c:	7d000200 	sfmvc	f0, 4, [r0]	; (stcvc 2, cr0, [r0])
 270:	00026408 	andeq	r6, r2, r8, lsl #8
 274:	00035c00 	andeq	r5, r3, r0, lsl #24
 278:	7b000200 	blvc	a80 <_start-0x30007580>
 27c:	00000004 	andeq	r0, r0, r4
 280:	00000000 	andeq	r0, r0, r0
 284:	00035c00 	andeq	r5, r3, r0, lsl #24
 288:	00036000 	andeq	r6, r3, r0
 28c:	5d000100 	stfpls	f0, [r0]
 290:	00000360 	andeq	r0, r0, r0, ror #6
 294:	00000364 	andeq	r0, r0, r4, ror #6
 298:	087d0002 	ldmdaeq	sp!, {r1}^
 29c:	00000364 	andeq	r0, r0, r4, ror #6
 2a0:	000003d8 	ldrdeq	r0, [r0], -r8
 2a4:	047b0002 	ldrbteq	r0, [fp], #-2
	...
 2b0:	000003d8 	ldrdeq	r0, [r0], -r8
 2b4:	000003dc 	ldrdeq	r0, [r0], -ip
 2b8:	dc5d0001 	mrrcle	0, 0, r0, sp, cr1
 2bc:	e0000003 	and	r0, r0, r3
 2c0:	02000003 	andeq	r0, r0, #3
 2c4:	e0087d00 	and	r7, r8, r0, lsl #26
 2c8:	78000003 	stmdavc	r0, {r0, r1}
 2cc:	02000004 	andeq	r0, r0, #4
 2d0:	00047b00 	andeq	r7, r4, r0, lsl #22
	...
 2dc:	04000000 	streq	r0, [r0]
 2e0:	01000000 	tsteq	r0, r0
 2e4:	00045d00 	andeq	r5, r4, r0, lsl #26
 2e8:	00080000 	andeq	r0, r8, r0
 2ec:	00020000 	andeq	r0, r2, r0
 2f0:	0008047d 	andeq	r0, r8, sp, ror r4
 2f4:	00fc0000 	rscseq	r0, ip, r0
 2f8:	00020000 	andeq	r0, r2, r0
 2fc:	0000047b 	andeq	r0, r0, fp, ror r4
 300:	00000000 	andeq	r0, r0, r0
 304:	00fc0000 	rscseq	r0, ip, r0
 308:	01000000 	tsteq	r0, r0
 30c:	00010000 	andeq	r0, r1, r0
 310:	0001005d 	andeq	r0, r1, sp, asr r0
 314:	00010400 	andeq	r0, r1, r0, lsl #8
 318:	7d000200 	sfmvc	f0, 4, [r0]	; (stcvc 2, cr0, [r0])
 31c:	00010404 	andeq	r0, r1, r4, lsl #8
 320:	00016400 	andeq	r6, r1, r0, lsl #8
 324:	7b000200 	blvc	b2c <_start-0x300074d4>
 328:	00000004 	andeq	r0, r0, r4
	...
 334:	00000400 	andeq	r0, r0, r0, lsl #8
 338:	5d000100 	stfpls	f0, [r0]
 33c:	00000004 	andeq	r0, r0, r4
 340:	00000008 	andeq	r0, r0, r8
 344:	047d0002 	ldrbteq	r0, [sp], #-2
 348:	00000008 	andeq	r0, r0, r8
 34c:	0000007c 	andeq	r0, r0, ip, ror r0
 350:	047b0002 	ldrbteq	r0, [fp], #-2
	...
 35c:	0000007c 	andeq	r0, r0, ip, ror r0
 360:	00000080 	andeq	r0, r0, r0, lsl #1
 364:	805d0001 	subshi	r0, sp, r1
 368:	84000000 	strhi	r0, [r0]
 36c:	02000000 	andeq	r0, r0, #0
 370:	84047d00 	strhi	r7, [r4], #-3328	; 0xd00
 374:	c4000000 	strgt	r0, [r0]
 378:	02000000 	andeq	r0, r0, #0
 37c:	00047b00 	andeq	r7, r4, r0, lsl #22
 380:	00000000 	andeq	r0, r0, r0
 384:	c4000000 	strgt	r0, [r0]
 388:	c8000000 	stmdagt	r0, {}
 38c:	01000000 	tsteq	r0, r0
 390:	00c85d00 	sbceq	r5, r8, r0, lsl #26
 394:	00cc0000 	sbceq	r0, ip, r0
 398:	00020000 	andeq	r0, r2, r0
 39c:	00cc047d 	sbceq	r0, ip, sp, ror r4
 3a0:	01040000 	tsteq	r4, r0
 3a4:	00020000 	andeq	r0, r2, r0
 3a8:	0000047b 	andeq	r0, r0, fp, ror r4
 3ac:	00000000 	andeq	r0, r0, r0
 3b0:	01040000 	tsteq	r4, r0
 3b4:	01080000 	tsteq	r8, r0
 3b8:	00010000 	andeq	r0, r1, r0
 3bc:	0001085d 	andeq	r0, r1, sp, asr r8
 3c0:	00010c00 	andeq	r0, r1, r0, lsl #24
 3c4:	7d000200 	sfmvc	f0, 4, [r0]	; (stcvc 2, cr0, [r0])
 3c8:	00010c08 	andeq	r0, r1, r8, lsl #24
 3cc:	00015000 	andeq	r5, r1, r0
 3d0:	7b000200 	blvc	bd8 <_start-0x30007428>
 3d4:	00000004 	andeq	r0, r0, r4
 3d8:	00000000 	andeq	r0, r0, r0
 3dc:	00015000 	andeq	r5, r1, r0
 3e0:	00015400 	andeq	r5, r1, r0, lsl #8
 3e4:	5d000100 	stfpls	f0, [r0]
 3e8:	00000154 	andeq	r0, r0, r4, asr r1
 3ec:	00000158 	andeq	r0, r0, r8, asr r1
 3f0:	087d0002 	ldmdaeq	sp!, {r1}^
 3f4:	00000158 	andeq	r0, r0, r8, asr r1
 3f8:	000001dc 	ldrdeq	r0, [r0], -ip
 3fc:	047b0002 	ldrbteq	r0, [fp], #-2
	...
 408:	000001dc 	ldrdeq	r0, [r0], -ip
 40c:	000001e0 	andeq	r0, r0, r0, ror #3
 410:	e05d0001 	subs	r0, sp, r1
 414:	e4000001 	str	r0, [r0], #-1
 418:	02000001 	andeq	r0, r0, #1
 41c:	e4087d00 	str	r7, [r8], #-3328	; 0xd00
 420:	ec000001 	stc	0, cr0, [r0], {1}
 424:	02000002 	andeq	r0, r0, #2
 428:	00047b00 	andeq	r7, r4, r0, lsl #22
 42c:	00000000 	andeq	r0, r0, r0
 430:	ec000000 	stc	0, cr0, [r0], {0}
 434:	f0000002 	undefined instruction 0xf0000002
 438:	01000002 	tsteq	r0, r2
 43c:	02f05d00 	rscseq	r5, r0, #0
 440:	02f40000 	rscseq	r0, r4, #0
 444:	00020000 	andeq	r0, r2, r0
 448:	02f4087d 	rscseq	r0, r4, #8192000	; 0x7d0000
 44c:	04600000 	strbteq	r0, [r0]
 450:	00020000 	andeq	r0, r2, r0
 454:	0000047b 	andeq	r0, r0, fp, ror r4
 458:	00000000 	andeq	r0, r0, r0
 45c:	04600000 	strbteq	r0, [r0]
 460:	04640000 	strbteq	r0, [r4]
 464:	00010000 	andeq	r0, r1, r0
 468:	0004645d 	andeq	r6, r4, sp, asr r4
 46c:	00046800 	andeq	r6, r4, r0, lsl #16
 470:	7d000200 	sfmvc	f0, 4, [r0]	; (stcvc 2, cr0, [r0])
 474:	00046810 	andeq	r6, r4, r0, lsl r8
 478:	00046c00 	andeq	r6, r4, r0, lsl #24
 47c:	7d000200 	sfmvc	f0, 4, [r0]	; (stcvc 2, cr0, [r0])
 480:	00046c18 	andeq	r6, r4, r8, lsl ip
 484:	00063c00 	andeq	r3, r6, r0, lsl #24
 488:	7b000200 	blvc	c90 <_start-0x30007370>
 48c:	00000014 	andeq	r0, r0, r4, lsl r0
	...
 498:	00000400 	andeq	r0, r0, r0, lsl #8
 49c:	5d000100 	stfpls	f0, [r0]
 4a0:	00000004 	andeq	r0, r0, r4
 4a4:	00000008 	andeq	r0, r0, r8
 4a8:	047d0002 	ldrbteq	r0, [sp], #-2
 4ac:	00000008 	andeq	r0, r0, r8
 4b0:	00000040 	andeq	r0, r0, r0, asr #32
 4b4:	047b0002 	ldrbteq	r0, [fp], #-2
	...
 4c0:	00000040 	andeq	r0, r0, r0, asr #32
 4c4:	00000044 	andeq	r0, r0, r4, asr #32
 4c8:	445d0001 	ldrbmi	r0, [sp], #-1
 4cc:	48000000 	stmdami	r0, {}
 4d0:	02000000 	andeq	r0, r0, #0
 4d4:	48047d00 	stmdami	r4, {r8, sl, fp, ip, sp, lr}
 4d8:	80000000 	andhi	r0, r0, r0
 4dc:	02000000 	andeq	r0, r0, #0
 4e0:	00047b00 	andeq	r7, r4, r0, lsl #22
 4e4:	00000000 	andeq	r0, r0, r0
 4e8:	80000000 	andhi	r0, r0, r0
 4ec:	84000000 	strhi	r0, [r0]
 4f0:	01000000 	tsteq	r0, r0
 4f4:	00845d00 	addeq	r5, r4, r0, lsl #26
 4f8:	00880000 	addeq	r0, r8, r0
 4fc:	00020000 	andeq	r0, r2, r0
 500:	0088047d 	addeq	r0, r8, sp, ror r4
 504:	00b40000 	adcseq	r0, r4, r0
 508:	00020000 	andeq	r0, r2, r0
 50c:	0000047b 	andeq	r0, r0, fp, ror r4
 510:	00000000 	andeq	r0, r0, r0
 514:	00b40000 	adcseq	r0, r4, r0
 518:	00b80000 	adcseq	r0, r8, r0
 51c:	00010000 	andeq	r0, r1, r0
 520:	0000b85d 	andeq	fp, r0, sp, asr r8
 524:	0000bc00 	andeq	fp, r0, r0, lsl #24
 528:	7d000200 	sfmvc	f0, 4, [r0]	; (stcvc 2, cr0, [r0])
 52c:	0000bc04 	andeq	fp, r0, r4, lsl #24
 530:	0000d800 	andeq	sp, r0, r0, lsl #16
 534:	7b000200 	blvc	d3c <_start-0x300072c4>
 538:	00000004 	andeq	r0, r0, r4
 53c:	00000000 	andeq	r0, r0, r0
 540:	0000d800 	andeq	sp, r0, r0, lsl #16
 544:	0000dc00 	andeq	sp, r0, r0, lsl #24
 548:	5d000100 	stfpls	f0, [r0]
 54c:	000000dc 	ldrdeq	r0, [r0], -ip
 550:	000000e0 	andeq	r0, r0, r0, ror #1
 554:	047d0002 	ldrbteq	r0, [sp], #-2
 558:	000000e0 	andeq	r0, r0, r0, ror #1
 55c:	000000fc 	strdeq	r0, [r0], -ip
 560:	047b0002 	ldrbteq	r0, [fp], #-2
	...
 570:	00000004 	andeq	r0, r0, r4
 574:	045d0001 	ldrbeq	r0, [sp], #-1
 578:	08000000 	stmdaeq	r0, {}
 57c:	02000000 	andeq	r0, r0, #0
 580:	08047d00 	stmdaeq	r4, {r8, sl, fp, ip, sp, lr}
 584:	70000000 	andvc	r0, r0, r0
 588:	02000000 	andeq	r0, r0, #0
 58c:	00047b00 	andeq	r7, r4, r0, lsl #22
 590:	00000000 	andeq	r0, r0, r0
 594:	70000000 	andvc	r0, r0, r0
 598:	74000000 	strvc	r0, [r0]
 59c:	01000000 	tsteq	r0, r0
 5a0:	00745d00 	rsbseq	r5, r4, r0, lsl #26
 5a4:	00780000 	rsbseq	r0, r8, r0
 5a8:	00020000 	andeq	r0, r2, r0
 5ac:	0078047d 	rsbseq	r0, r8, sp, ror r4
 5b0:	00d80000 	sbcseq	r0, r8, r0
 5b4:	00020000 	andeq	r0, r2, r0
 5b8:	0000047b 	andeq	r0, r0, fp, ror r4
 5bc:	00000000 	andeq	r0, r0, r0
 5c0:	00d80000 	sbcseq	r0, r8, r0
 5c4:	00dc0000 	sbcseq	r0, ip, r0
 5c8:	00010000 	andeq	r0, r1, r0
 5cc:	0000dc5d 	andeq	sp, r0, sp, asr ip
 5d0:	0000e000 	andeq	lr, r0, r0
 5d4:	7d000200 	sfmvc	f0, 4, [r0]	; (stcvc 2, cr0, [r0])
 5d8:	0000e00c 	andeq	lr, r0, ip
 5dc:	0001ac00 	andeq	sl, r1, r0, lsl #24
 5e0:	7b000200 	blvc	de8 <_start-0x30007218>
 5e4:	00000004 	andeq	r0, r0, r4
 5e8:	00000000 	andeq	r0, r0, r0
 5ec:	0001ac00 	andeq	sl, r1, r0, lsl #24
 5f0:	0001b000 	andeq	fp, r1, r0
 5f4:	5d000100 	stfpls	f0, [r0]
 5f8:	000001b0 	undefined instruction 0x000001b0
 5fc:	000001b4 	undefined instruction 0x000001b4
 600:	047d0002 	ldrbteq	r0, [sp], #-2
 604:	000001b4 	undefined instruction 0x000001b4
 608:	00000264 	andeq	r0, r0, r4, ror #4
 60c:	047b0002 	ldrbteq	r0, [fp], #-2
	...
 618:	00000264 	andeq	r0, r0, r4, ror #4
 61c:	00000268 	andeq	r0, r0, r8, ror #4
 620:	685d0001 	ldmdavs	sp, {r0}^
 624:	6c000002 	stcvs	0, cr0, [r0], {2}
 628:	02000002 	andeq	r0, r0, #2
 62c:	6c047d00 	stcvs	13, cr7, [r4], {0}
 630:	dc000002 	stcle	0, cr0, [r0], {2}
 634:	02000002 	andeq	r0, r0, #2
 638:	00047b00 	andeq	r7, r4, r0, lsl #22
 63c:	00000000 	andeq	r0, r0, r0
 640:	dc000000 	stcle	0, cr0, [r0], {0}
 644:	e0000002 	and	r0, r0, r2
 648:	01000002 	tsteq	r0, r2
 64c:	02e05d00 	rsceq	r5, r0, #0
 650:	02e40000 	rsceq	r0, r4, #0
 654:	00020000 	andeq	r0, r2, r0
 658:	02e4047d 	rsceq	r0, r4, #2097152000	; 0x7d000000
 65c:	03800000 	orreq	r0, r0, #0
 660:	00020000 	andeq	r0, r2, r0
 664:	0000047b 	andeq	r0, r0, fp, ror r4
 668:	00000000 	andeq	r0, r0, r0
 66c:	03800000 	orreq	r0, r0, #0
 670:	03840000 	orreq	r0, r4, #0
 674:	00010000 	andeq	r0, r1, r0
 678:	0003845d 	andeq	r8, r3, sp, asr r4
 67c:	00038800 	andeq	r8, r3, r0, lsl #16
 680:	7d000200 	sfmvc	f0, 4, [r0]	; (stcvc 2, cr0, [r0])
 684:	00038804 	andeq	r8, r3, r4, lsl #16
 688:	00041800 	andeq	r1, r4, r0, lsl #16
 68c:	7b000200 	blvc	e94 <_start-0x3000716c>
 690:	00000004 	andeq	r0, r0, r4
 694:	00000000 	andeq	r0, r0, r0
 698:	00041800 	andeq	r1, r4, r0, lsl #16
 69c:	00041c00 	andeq	r1, r4, r0, lsl #24
 6a0:	5d000100 	stfpls	f0, [r0]
 6a4:	0000041c 	andeq	r0, r0, ip, lsl r4
 6a8:	00000420 	andeq	r0, r0, r0, lsr #8
 6ac:	047d0002 	ldrbteq	r0, [sp], #-2
 6b0:	00000420 	andeq	r0, r0, r0, lsr #8
 6b4:	000004ec 	andeq	r0, r0, ip, ror #9
 6b8:	047b0002 	ldrbteq	r0, [fp], #-2
	...
 6c4:	000004ec 	andeq	r0, r0, ip, ror #9
 6c8:	000004f0 	strdeq	r0, [r0], -r0
 6cc:	f05d0001 	undefined instruction 0xf05d0001
 6d0:	f4000004 	vst4.8	{d0-d3}, [r0], r4
 6d4:	02000004 	andeq	r0, r0, #4
 6d8:	f4087d00 	undefined instruction 0xf4087d00
 6dc:	94000004 	strls	r0, [r0], #-4
 6e0:	02000005 	andeq	r0, r0, #5
 6e4:	00047b00 	andeq	r7, r4, r0, lsl #22
 6e8:	00000000 	andeq	r0, r0, r0
 6ec:	94000000 	strls	r0, [r0]
 6f0:	98000005 	stmdals	r0, {r0, r2}
 6f4:	01000005 	tsteq	r0, r5
 6f8:	05985d00 	ldreq	r5, [r8, #3328]	; 0xd00
 6fc:	059c0000 	ldreq	r0, [ip]
 700:	00020000 	andeq	r0, r2, r0
 704:	059c087d 	ldreq	r0, [ip, #2173]	; 0x87d
 708:	06580000 	ldrbeq	r0, [r8], -r0
 70c:	00020000 	andeq	r0, r2, r0
 710:	0000047b 	andeq	r0, r0, fp, ror r4
 714:	00000000 	andeq	r0, r0, r0
 718:	06580000 	ldrbeq	r0, [r8], -r0
 71c:	065c0000 	ldrbeq	r0, [ip], -r0
 720:	00010000 	andeq	r0, r1, r0
 724:	00065c5d 	andeq	r5, r6, sp, asr ip
 728:	00066000 	andeq	r6, r6, r0
 72c:	7d000200 	sfmvc	f0, 4, [r0]	; (stcvc 2, cr0, [r0])
 730:	00066004 	andeq	r6, r6, r4
 734:	0006c000 	andeq	ip, r6, r0
 738:	7b000200 	blvc	f40 <_start-0x300070c0>
 73c:	00000004 	andeq	r0, r0, r4
 740:	00000000 	andeq	r0, r0, r0
 744:	0006c000 	andeq	ip, r6, r0
 748:	0006c400 	andeq	ip, r6, r0, lsl #8
 74c:	5d000100 	stfpls	f0, [r0]
 750:	000006c4 	andeq	r0, r0, r4, asr #13
 754:	000006c8 	andeq	r0, r0, r8, asr #13
 758:	047d0002 	ldrbteq	r0, [sp], #-2
 75c:	000006c8 	andeq	r0, r0, r8, asr #13
 760:	00000714 	andeq	r0, r0, r4, lsl r7
 764:	047b0002 	ldrbteq	r0, [fp], #-2
	...
 770:	00000714 	andeq	r0, r0, r4, lsl r7
 774:	00000718 	andeq	r0, r0, r8, lsl r7
 778:	185d0001 	ldmdane	sp, {r0}^
 77c:	1c000007 	stcne	0, cr0, [r0], {7}
 780:	02000007 	andeq	r0, r0, #7
 784:	1c047d00 	stcne	13, cr7, [r4], {0}
 788:	94000007 	strls	r0, [r0], #-7
 78c:	02000007 	andeq	r0, r0, #7
 790:	00047b00 	andeq	r7, r4, r0, lsl #22
 794:	00000000 	andeq	r0, r0, r0
 798:	94000000 	strls	r0, [r0]
 79c:	98000007 	stmdals	r0, {r0, r1, r2}
 7a0:	01000007 	tsteq	r0, r7
 7a4:	07985d00 	ldreq	r5, [r8, r0, lsl #26]
 7a8:	079c0000 	ldreq	r0, [ip, r0]
 7ac:	00020000 	andeq	r0, r2, r0
 7b0:	079c047d 	undefined instruction 0x079c047d
 7b4:	08580000 	ldmdaeq	r8, {}^
 7b8:	00020000 	andeq	r0, r2, r0
 7bc:	0000047b 	andeq	r0, r0, fp, ror r4
 7c0:	00000000 	andeq	r0, r0, r0
 7c4:	08580000 	ldmdaeq	r8, {}^
 7c8:	085c0000 	ldmdaeq	ip, {}^
 7cc:	00010000 	andeq	r0, r1, r0
 7d0:	00085c5d 	andeq	r5, r8, sp, asr ip
 7d4:	00086000 	andeq	r6, r8, r0
 7d8:	7d000200 	sfmvc	f0, 4, [r0]	; (stcvc 2, cr0, [r0])
 7dc:	00086004 	andeq	r6, r8, r4
 7e0:	0008f000 	andeq	pc, r8, r0
 7e4:	7b000200 	blvc	fec <_start-0x30007014>
 7e8:	00000004 	andeq	r0, r0, r4
 7ec:	00000000 	andeq	r0, r0, r0
 7f0:	0008f000 	andeq	pc, r8, r0
 7f4:	0008f400 	andeq	pc, r8, r0, lsl #8
 7f8:	5d000100 	stfpls	f0, [r0]
 7fc:	000008f4 	strdeq	r0, [r0], -r4
 800:	000008f8 	strdeq	r0, [r0], -r8
 804:	047d0002 	ldrbteq	r0, [sp], #-2
 808:	000008f8 	strdeq	r0, [r0], -r8
 80c:	0000096c 	andeq	r0, r0, ip, ror #18
 810:	047b0002 	ldrbteq	r0, [fp], #-2
	...
 81c:	0000096c 	andeq	r0, r0, ip, ror #18
 820:	00000970 	andeq	r0, r0, r0, ror r9
 824:	705d0001 	subsvc	r0, sp, r1
 828:	74000009 	strvc	r0, [r0], #-9
 82c:	02000009 	andeq	r0, r0, #9
 830:	74047d00 	strvc	r7, [r4], #-3328	; 0xd00
 834:	fc000009 	stc2	0, cr0, [r0], {9}
 838:	02000009 	andeq	r0, r0, #9
 83c:	00047b00 	andeq	r7, r4, r0, lsl #22
 840:	00000000 	andeq	r0, r0, r0
 844:	fc000000 	stc2	0, cr0, [r0], {0}
 848:	00000009 	andeq	r0, r0, r9
 84c:	0100000a 	tsteq	r0, sl
 850:	0a005d00 	beq	17c58 <_start-0x2fff03a8>
 854:	0a040000 	beq	10085c <_start-0x2ff077a4>
 858:	00020000 	andeq	r0, r2, r0
 85c:	0a04047d 	beq	101a58 <_start-0x2ff065a8>
 860:	0b140000 	bleq	500868 <_start-0x2fb07798>
 864:	00020000 	andeq	r0, r2, r0
 868:	0000047b 	andeq	r0, r0, fp, ror r4
 86c:	00000000 	andeq	r0, r0, r0
 870:	0b140000 	bleq	500878 <_start-0x2fb07788>
 874:	0b180000 	bleq	60087c <_start-0x2fa07784>
 878:	00010000 	andeq	r0, r1, r0
 87c:	000b185d 	andeq	r1, fp, sp, asr r8
 880:	000b1c00 	andeq	r1, fp, r0, lsl #24
 884:	7d000200 	sfmvc	f0, 4, [r0]	; (stcvc 2, cr0, [r0])
 888:	000b1c04 	andeq	r1, fp, r4, lsl #24
 88c:	000bbc00 	andeq	fp, fp, r0, lsl #24
 890:	7b000200 	blvc	1098 <_start-0x30006f68>
 894:	00000004 	andeq	r0, r0, r4
 898:	00000000 	andeq	r0, r0, r0
 89c:	000bbc00 	andeq	fp, fp, r0, lsl #24
 8a0:	000bc000 	andeq	ip, fp, r0
 8a4:	5d000100 	stfpls	f0, [r0]
 8a8:	00000bc0 	andeq	r0, r0, r0, asr #23
 8ac:	00000bc4 	andeq	r0, r0, r4, asr #23
 8b0:	047d0002 	ldrbteq	r0, [sp], #-2
 8b4:	00000bc4 	andeq	r0, r0, r4, asr #23
 8b8:	00000c38 	andeq	r0, r0, r8, lsr ip
 8bc:	047b0002 	ldrbteq	r0, [fp], #-2
	...
 8c8:	00000c38 	andeq	r0, r0, r8, lsr ip
 8cc:	00000c3c 	andeq	r0, r0, ip, lsr ip
 8d0:	3c5d0001 	mrrccc	0, 0, r0, sp, cr1
 8d4:	4000000c 	andmi	r0, r0, ip
 8d8:	0200000c 	andeq	r0, r0, #12
 8dc:	40087d00 	andmi	r7, r8, r0, lsl #26
 8e0:	e400000c 	str	r0, [r0], #-12
 8e4:	0200000c 	andeq	r0, r0, #12
 8e8:	00047b00 	andeq	r7, r4, r0, lsl #22
 8ec:	00000000 	andeq	r0, r0, r0
 8f0:	e4000000 	str	r0, [r0]
 8f4:	e800000c 	stmda	r0, {r2, r3}
 8f8:	0100000c 	tsteq	r0, ip
 8fc:	0ce85d00 	stcleq	13, cr5, [r8]
 900:	0cec0000 	stcleq	0, cr0, [ip]
 904:	00020000 	andeq	r0, r2, r0
 908:	0cec047d 	cfstrdeq	mvd0, [ip], #500	; 0x1f4
 90c:	0d840000 	stceq	0, cr0, [r4]
 910:	00020000 	andeq	r0, r2, r0
 914:	0000047b 	andeq	r0, r0, fp, ror r4
 918:	00000000 	andeq	r0, r0, r0
	...

Disassembly of section .debug_pubnames:

00000000 <.debug_pubnames>:
   0:	00000052 	andeq	r0, r0, r2, asr r0
   4:	00650002 	rsbeq	r0, r5, r2
   8:	019a0000 	orrseq	r0, sl, r0
   c:	00250000 	eoreq	r0, r5, r0
  10:	68730000 	ldmdavs	r3!, {}^
  14:	5f6c6c65 	svcpl	0x006c6c65
  18:	0064656c 	rsbeq	r6, r4, ip, ror #10
  1c:	000000a6 	andeq	r0, r0, r6, lsr #1
  20:	6c656873 	stclvs	8, cr6, [r5], #-460	; 0xfffffe34
  24:	6f635f6c 	svcvs	0x00635f6c
  28:	6e6f6d6d 	cdpvs	13, 6, cr6, cr15, cr13, {3}
  2c:	0000dc00 	andeq	sp, r0, r0, lsl #24
  30:	6d726100 	ldfvse	f6, [r2]
  34:	69616d5f 	stmdbvs	r1!, {r0, r1, r2, r3, r4, r6, r8, sl, fp, sp, lr}^
  38:	0171006e 	cmneq	r1, lr, rrx
  3c:	61680000 	cmnvs	r8, r0
  40:	656c646e 	strbvs	r6, [ip, #-1134]!	; 0x46e
  44:	746e695f 	strbtvc	r6, [lr], #-2399	; 0x95f
  48:	00018500 	andeq	r8, r1, r0, lsl #10
  4c:	69616d00 	stmdbvs	r1!, {r8, sl, fp, sp, lr}^
  50:	0000006e 	andeq	r0, r0, lr, rrx
  54:	00c80000 	sbceq	r0, r8, r0
  58:	00020000 	andeq	r0, r2, r0
  5c:	000001ff 	strdeq	r0, [r0], -pc
  60:	0000022c 	andeq	r0, r0, ip, lsr #4
  64:	00000025 	andeq	r0, r0, r5, lsr #32
  68:	656c6573 	strbvs	r6, [ip, #-1395]!	; 0x573
  6c:	635f7463 	cmpvs	pc, #1660944384	; 0x63000000
  70:	00706968 	rsbseq	r6, r0, r8, ror #18
  74:	00000039 	andeq	r0, r0, r9, lsr r0
  78:	65736964 	ldrbvs	r6, [r3, #-2404]!	; 0x964
  7c:	7463656c 	strbtvc	r6, [r3], #-1388	; 0x56c
  80:	6968635f 	stmdbvs	r8!, {r0, r1, r2, r3, r4, r6, r8, r9, sp, lr}^
  84:	004d0070 	subeq	r0, sp, r0, ror r0
  88:	6c630000 	stclvs	0, cr0, [r3]
  8c:	5f726165 	svcpl	0x00726165
  90:	00426e52 	subeq	r6, r2, r2, asr lr
  94:	00000061 	andeq	r0, r0, r1, rrx
  98:	646e6573 	strbtvs	r6, [lr], #-1395	; 0x573
  9c:	6d6d635f 	stclvs	3, cr6, [sp, #-380]!	; 0xfffffe84
  a0:	00900064 	addseq	r0, r0, r4, rrx
  a4:	65730000 	ldrbvs	r0, [r3]!
  a8:	615f646e 	cmpvs	pc, lr, ror #8
  ac:	00726464 	rsbseq	r6, r2, r4, ror #8
  b0:	000000b8 	strheq	r0, [r0], -r8
  b4:	74696177 	strbtvc	r6, [r9], #-375	; 0x177
  b8:	426e525f 	rsbmi	r5, lr, #-268435451	; 0xf0000005
  bc:	0000cc00 	andeq	ip, r0, r0, lsl #24
  c0:	6e616e00 	cdpvs	14, 6, cr6, cr1, cr0, {0}
  c4:	65725f64 	ldrbvs	r5, [r2, #-3940]!	; 0xf64
  c8:	00746573 	rsbseq	r6, r4, r3, ror r5
  cc:	000000e0 	andeq	r0, r0, r0, ror #1
  d0:	646e616e 	strbtvs	r6, [lr], #-366	; 0x16e
  d4:	696e695f 	stmdbvs	lr!, {r0, r1, r2, r3, r4, r6, r8, fp, sp, lr}^
  d8:	00f40074 	rscseq	r0, r4, r4, ror r0
  dc:	616e0000 	cmnvs	lr, r0
  e0:	505f646e 	subspl	r6, pc, lr, ror #8
  e4:	52656761 	rsbpl	r6, r5, #25427968	; 0x1840000
  e8:	00646165 	rsbeq	r6, r4, r5, ror #2
  ec:	00000151 	andeq	r0, r0, r1, asr r1
  f0:	646e616e 	strbtvs	r6, [lr], #-366	; 0x16e
  f4:	6761505f 	undefined instruction 0x6761505f
  f8:	69725765 	ldmdbvs	r2!, {r0, r2, r5, r6, r8, r9, sl, ip, lr}^
  fc:	a5006574 	strge	r6, [r0, #-1396]	; 0x574
 100:	6e000001 	cdpvs	0, 0, cr0, cr0, cr1, {0}
 104:	5f646e61 	svcpl	0x00646e61
 108:	725f6f74 	subsvc	r6, pc, #464	; 0x1d0
 10c:	f5006d61 	undefined instruction 0xf5006d61
 110:	6e000001 	cdpvs	0, 0, cr0, cr0, cr1, {0}
 114:	5f646e61 	svcpl	0x00646e61
 118:	73617265 	cmnvc	r1, #1342177286	; 0x50000006
 11c:	00000065 	andeq	r0, r0, r5, rrx
 120:	00310000 	eorseq	r0, r1, r0
 124:	00020000 	andeq	r0, r2, r0
 128:	0000042b 	andeq	r0, r0, fp, lsr #8
 12c:	0000009b 	muleq	r0, fp, r0
 130:	00000025 	andeq	r0, r0, r5, lsr #32
 134:	61657263 	cmnvs	r5, r3, ror #4
 138:	705f6574 	subsvc	r6, pc, r4, ror r5
 13c:	5f656761 	svcpl	0x00656761
 140:	6c626174 	stfvse	f6, [r2], #-464	; 0xfffffe30
 144:	00760065 	rsbseq	r0, r6, r5, rrx
 148:	6d6d0000 	stclvs	0, cr0, [sp]
 14c:	6e695f75 	mcrvs	15, 3, r5, cr9, cr5, {3}
 150:	00007469 	andeq	r7, r0, r9, ror #8
 154:	61000000 	tstvs	r0, r0
 158:	02000000 	andeq	r0, r0, #0
 15c:	0004c600 	andeq	ip, r4, r0, lsl #12
 160:	00023f00 	andeq	r3, r2, r0, lsl #30
 164:	00005500 	andeq	r5, r0, r0, lsl #10
 168:	72617500 	rsbvc	r7, r1, #0
 16c:	695f3074 	ldmdbvs	pc, {r2, r4, r5, r6, ip, sp}^
 170:	0074696e 	rsbseq	r6, r4, lr, ror #18
 174:	0000006a 	andeq	r0, r0, sl, rrx
 178:	63747570 	cmnvs	r4, #469762048	; 0x1c000000
 17c:	00009700 	andeq	r9, r0, r0, lsl #14
 180:	74656700 	strbtvc	r6, [r5], #-1792	; 0x700
 184:	00b00063 	adcseq	r0, r0, r3, rrx
 188:	70750000 	rsbsvc	r0, r5, r0
 18c:	00737475 	rsbseq	r7, r3, r5, ror r4
 190:	000000dc 	ldrdeq	r0, [r0], -ip
 194:	74656775 	strbtvc	r6, [r5], #-1909	; 0x775
 198:	012d0073 	teqeq	sp, r3, ror r0
 19c:	74690000 	strbtvc	r0, [r9]
 1a0:	7400616f 	strvc	r6, [r0], #-367	; 0x16f
 1a4:	78000001 	stmdavc	r0, {r0}
 1a8:	00616f74 	rsbeq	r6, r1, r4, ror pc
 1ac:	000001b4 	undefined instruction 0x000001b4
 1b0:	69727075 	ldmdbvs	r2!, {r0, r2, r4, r5, r6, ip, sp, lr}^
 1b4:	0066746e 	rsbeq	r7, r6, lr, ror #8
 1b8:	00000000 	andeq	r0, r0, r0
 1bc:	0000004d 	andeq	r0, r0, sp, asr #32
 1c0:	07050002 	streq	r0, [r5, -r2]
 1c4:	00970000 	addseq	r0, r7, r0
 1c8:	00250000 	eoreq	r0, r5, r0
 1cc:	65620000 	strbvs	r0, [r2]!
 1d0:	695f7065 	ldmdbvs	pc, {r0, r2, r5, r6, ip, sp, lr}^
 1d4:	0074696e 	rsbseq	r6, r4, lr, ror #18
 1d8:	0000003a 	andeq	r0, r0, sl, lsr r0
 1dc:	70656562 	rsbvc	r6, r5, r2, ror #10
 1e0:	6e75725f 	mrcvs	2, 3, r7, cr5, cr15, {2}
 1e4:	00004f00 	andeq	r4, r0, r0, lsl #30
 1e8:	64656c00 	strbtvs	r6, [r5], #-3072	; 0xc00
 1ec:	696e695f 	stmdbvs	lr!, {r0, r1, r2, r3, r4, r6, r8, fp, sp, lr}^
 1f0:	00630074 	rsbeq	r0, r3, r4, ror r0
 1f4:	656c0000 	strbvs	r0, [ip]!
 1f8:	6e6f5f64 	cdpvs	15, 6, cr5, cr15, cr4, {3}
 1fc:	00008200 	andeq	r8, r0, r0, lsl #4
 200:	64656c00 	strbtvs	r6, [r5], #-3072	; 0xc00
 204:	66666f5f 	uqsubaddxvs	r6, r6, pc
 208:	00000000 	andeq	r0, r0, r0
 20c:	00010100 	andeq	r0, r1, r0, lsl #2
 210:	9c000200 	sfmls	f0, 4, [r0], {0}	; (stcls 2, cr0, [r0], {0})
 214:	4b000007 	blmi	238 <_start-0x30007dc8>
 218:	25000007 	strcs	r0, [r0, #-7]
 21c:	64000000 	strvs	r0, [r0]
 220:	79616c65 	stmdbvc	r1!, {r0, r2, r5, r6, sl, fp, sp, lr}^
 224:	00006a00 	andeq	r6, r0, r0, lsl #20
 228:	70786500 	rsbsvc	r6, r8, r0, lsl #10
 22c:	b5003631 	strlt	r3, [r0, #-1585]	; 0x631
 230:	61000000 	tstvs	r0, r0
 234:	00786f74 	rsbseq	r6, r8, r4, ror pc
 238:	00000114 	andeq	r0, r0, r4, lsl r1
 23c:	696f7461 	stmdbvs	pc!, {r0, r5, r6, sl, ip, sp, lr}^
 240:	00016200 	andeq	r6, r1, r0, lsl #4
 244:	72747300 	rsbsvc	r7, r4, #0
 248:	00797063 	rsbseq	r7, r9, r3, rrx
 24c:	000001b5 	undefined instruction 0x000001b5
 250:	6e727473 	mrcvs	4, 3, r7, cr2, cr3, {3}
 254:	00797063 	rsbseq	r7, r9, r3, rrx
 258:	0000020b 	andeq	r0, r0, fp, lsl #4
 25c:	63727473 	cmnvs	r2, #1929379840	; 0x73000000
 260:	53007461 	movwpl	r7, #1121	; 0x461
 264:	73000002 	movwvc	r0, #2
 268:	636e7274 	cmnvs	lr, #1073741831	; 0x40000007
 26c:	a9007461 	stmdbge	r0, {r0, r5, r6, sl, ip, sp, lr}
 270:	73000002 	movwvc	r0, #2
 274:	6d637274 	sfmvs	f7, 2, [r3, #-464]!	; (stclvs 2, cr7, [r3, #-464]!)	; 0xfffffe30
 278:	02f50070 	rscseq	r0, r5, #112	; 0x70
 27c:	74730000 	ldrbtvc	r0, [r3]
 280:	6d636e72 	stclvs	14, cr6, [r3, #-456]!	; 0xfffffe38
 284:	03480070 	movteq	r0, #32880	; 0x8070
 288:	74730000 	ldrbtvc	r0, [r3]
 28c:	72686372 	rsbvc	r6, r8, #-939524095	; 0xc8000001
 290:	00037e00 	andeq	r7, r3, r0, lsl #28
 294:	72747300 	rsbsvc	r7, r4, #0
 298:	006e656c 	rsbeq	r6, lr, ip, ror #10
 29c:	000003b5 	undefined instruction 0x000003b5
 2a0:	6e727473 	mrcvs	4, 3, r7, cr2, cr3, {3}
 2a4:	006e656c 	rsbeq	r6, lr, ip, ror #10
 2a8:	000003fa 	strdeq	r0, [r0], -sl
 2ac:	73727473 	cmnvc	r2, #1929379840	; 0x73000000
 2b0:	58006e70 	stmdapl	r0, {r4, r5, r6, r9, sl, fp, sp, lr}
 2b4:	73000004 	movwvc	r0, #4
 2b8:	62707274 	rsbsvs	r7, r0, #1073741831	; 0x40000007
 2bc:	ac006b72 	stcge	11, cr6, [r0], {114}	; 0x72
 2c0:	6d000004 	stcvs	0, cr0, [r0, #-16]
 2c4:	65736d65 	ldrbvs	r6, [r3, #-3429]!	; 0xd65
 2c8:	04ff0074 	ldrbteq	r0, [pc], #116	; 2d0 <_start-0x30007d30>
 2cc:	656d0000 	strbvs	r0, [sp]!
 2d0:	7970636d 	ldmdbvc	r0!, {r0, r2, r3, r5, r6, r8, r9, sp, lr}^
 2d4:	00056800 	andeq	r6, r5, r0, lsl #16
 2d8:	6d656d00 	stclvs	13, cr6, [r5]
 2dc:	65766f6d 	ldrbvs	r6, [r6, #-3949]!	; 0xf6d
 2e0:	0005ca00 	andeq	ip, r5, r0, lsl #20
 2e4:	6d656d00 	stclvs	13, cr6, [r5]
 2e8:	00706d63 	rsbseq	r6, r0, r3, ror #26
 2ec:	0000064c 	andeq	r0, r0, ip, asr #12
 2f0:	736d656d 	cmnvc	sp, #457179136	; 0x1b400000
 2f4:	006e6163 	rsbeq	r6, lr, r3, ror #2
 2f8:	000006a4 	andeq	r0, r0, r4, lsr #13
 2fc:	73727473 	cmnvc	r2, #1929379840	; 0x73000000
 300:	fb007274 	blx	1ccda <_start-0x2ffeb326>
 304:	6d000006 	stcvs	0, cr0, [r0, #-24]	; 0xffffffe8
 308:	68636d65 	stmdavs	r3!, {r0, r2, r5, r6, r8, sl, fp, sp, lr}^
 30c:	00000072 	andeq	r0, r0, r2, ror r0
	...

Disassembly of section .debug_str:

00000000 <.debug_str>:
   0:	5f646d63 	svcpl	0x00646d63
   4:	76677261 	strbtvc	r7, [r7], -r1, ror #4
   8:	6f682f00 	svcvs	0x00682f00
   c:	642f656d 	strtvs	r6, [pc], #1389	; 14 <_start-0x30007fec>
  10:	6e6f6d65 	cdpvs	13, 6, cr6, cr15, cr5, {3}
  14:	2f666c65 	svccs	0x00666c65
  18:	6a6f7270 	bvs	1bdc9e0 <_start-0x2e42b620>
  1c:	2f746365 	svccs	0x00746365
  20:	6d2e3030 	stcvs	0, cr3, [lr, #-192]!	; 0xffffff40
  24:	726f7779 	rsbvc	r7, pc, #31719424	; 0x1e40000
  28:	656c2f6b 	strbvs	r2, [ip, #-3947]!	; 0xf6b
  2c:	79636167 	stmdbvc	r3!, {r0, r1, r2, r5, r6, r8, sp, lr}^
  30:	6d72612d 	ldfvse	f6, [r2, #-180]!	; 0xffffff4c
  34:	6e696c2d 	cdpvs	12, 6, cr6, cr9, cr13, {1}
  38:	61007875 	tstvs	r0, r5, ror r8
  3c:	6d5f6d72 	ldclvs	13, cr6, [pc, #-456]	; 0xfffffe38
  40:	006e6961 	rsbeq	r6, lr, r1, ror #18
  44:	63677261 	cmnvs	r7, #268435462	; 0x10000006
  48:	696e6900 	stmdbvs	lr!, {r8, fp, sp, lr}^
  4c:	616d2f74 	smcvs	54004	; 0xd2f4
  50:	632e6e69 	teqvs	lr, #1680	; 0x690
  54:	646d6300 	strbtvs	r6, [sp], #-768	; 0x300
  58:	6675625f 	undefined instruction 0x6675625f
  5c:	72676100 	rsbvc	r6, r7, #0
  60:	68730076 	ldmdavs	r3!, {r1, r2, r4, r5, r6}^
  64:	5f6c6c65 	svcpl	0x006c6c65
  68:	6d6d6f63 	stclvs	15, cr6, [sp, #-396]!	; 0xfffffe74
  6c:	73006e6f 	movwvc	r6, #3695	; 0xe6f
  70:	6c6c6568 	cfstr64vs	mvdx6, [ip], #-416	; 0xfffffe60
  74:	64656c5f 	strbtvs	r6, [r5], #-3167	; 0xc5f
  78:	554e4700 	strbpl	r4, [lr, #-1792]	; 0x700
  7c:	34204320 	strtcc	r4, [r0], #-800	; 0x320
  80:	332e342e 	teqcc	lr, #771751936	; 0x2e000000
  84:	6e616800 	cdpvs	8, 6, cr6, cr1, cr0, {0}
  88:	5f656c64 	svcpl	0x00656c64
  8c:	00746e69 	rsbseq	r6, r4, r9, ror #28
  90:	646e616e 	strbtvs	r6, [lr], #-366	; 0x16e
  94:	7365725f 	cmnvc	r5, #-268435451	; 0xf0000005
  98:	63007465 	movwvs	r7, #1125	; 0x465
  9c:	7261656c 	rsbvc	r6, r1, #452984832	; 0x1b000000
  a0:	426e525f 	rsbmi	r5, lr, #-268435451	; 0xf0000005
  a4:	6e616e00 	cdpvs	14, 6, cr6, cr1, cr0, {0}
  a8:	6e695f64 	cdpvs	15, 6, cr5, cr9, cr4, {3}
  ac:	6e007469 	cdpvs	4, 0, cr7, cr0, cr9, {3}
  b0:	5f646e61 	svcpl	0x00646e61
  b4:	725f6f74 	subsvc	r6, pc, #464	; 0x1d0
  b8:	6c006d61 	stcvs	13, cr6, [r0], {97}	; 0x61
  bc:	20676e6f 	rsbcs	r6, r7, pc, ror #28
  c0:	69736e75 	ldmdbvs	r3!, {r0, r2, r4, r5, r6, r9, sl, fp, sp, lr}^
  c4:	64656e67 	strbtvs	r6, [r5], #-3687	; 0xe67
  c8:	746e6920 	strbtvc	r6, [lr], #-2336	; 0x920
  cc:	6e616e00 	cdpvs	14, 6, cr6, cr1, cr0, {0}
  d0:	61505f64 	cmpvs	r0, r4, ror #30
  d4:	72576567 	subsvc	r6, r7, #432013312	; 0x19c00000
  d8:	00657469 	rsbeq	r7, r5, r9, ror #8
  dc:	69736e75 	ldmdbvs	r3!, {r0, r2, r4, r5, r6, r9, sl, fp, sp, lr}^
  e0:	64656e67 	strbtvs	r6, [r5], #-3687	; 0xe67
  e4:	61686320 	cmnvs	r8, r0, lsr #6
  e8:	69730072 	ldmdbvs	r3!, {r1, r4, r5, r6}^
  ec:	7300657a 	movwvc	r6, #1402	; 0x57a
  f0:	6d617264 	sfmvs	f7, 2, [r1, #-400]!	; (stclvs 2, cr7, [r1, #-400]!)	; 0xfffffe70
  f4:	6464615f 	strbtvs	r6, [r4], #-351	; 0x15f
  f8:	69640072 	stmdbvs	r4!, {r1, r4, r5, r6}^
  fc:	656c6573 	strbvs	r6, [ip, #-1395]!	; 0x573
 100:	635f7463 	cmpvs	pc, #1660944384	; 0x63000000
 104:	00706968 	rsbseq	r6, r0, r8, ror #18
 108:	646e616e 	strbtvs	r6, [lr], #-366	; 0x16e
 10c:	6761505f 	undefined instruction 0x6761505f
 110:	61655265 	cmnvs	r5, r5, ror #4
 114:	74730064 	ldrbtvc	r0, [r3], #-100	; 0x64
 118:	5f747261 	svcpl	0x00747261
 11c:	72646461 	rsbvc	r6, r4, #1627389952	; 0x61000000
 120:	696e6900 	stmdbvs	lr!, {r8, fp, sp, lr}^
 124:	616e2f74 	smcvs	58100	; 0xe2f4
 128:	632e646e 	teqvs	lr, #1845493760	; 0x6e000000
 12c:	6e616e00 	cdpvs	14, 6, cr6, cr1, cr0, {0}
 130:	72655f64 	rsbvc	r5, r5, #400	; 0x190
 134:	00657361 	rsbeq	r7, r5, r1, ror #6
 138:	646e6573 	strbtvs	r6, [lr], #-1395	; 0x573
 13c:	6464615f 	strbtvs	r6, [r4], #-351	; 0x15f
 140:	61770072 	cmnvs	r7, r2, ror r0
 144:	525f7469 	subspl	r7, pc, #1761607680	; 0x69000000
 148:	7300426e 	movwvc	r4, #622	; 0x26e
 14c:	5f646e65 	svcpl	0x00646e65
 150:	646d6d63 	strbtvs	r6, [sp], #-3427	; 0xd63
 154:	66756200 	ldrbtvs	r6, [r5], -r0, lsl #4
 158:	72630066 	rsbvc	r0, r3, #102	; 0x66
 15c:	65746165 	ldrbvs	r6, [r4, #-357]!	; 0x165
 160:	6761705f 	undefined instruction 0x6761705f
 164:	61745f65 	cmnvs	r4, r5, ror #30
 168:	00656c62 	rsbeq	r6, r5, r2, ror #24
 16c:	5f756d6d 	svcpl	0x00756d6d
 170:	74696e69 	strbtvc	r6, [r9], #-3689	; 0xe69
 174:	72697600 	rsbvc	r7, r9, #0
 178:	616c7574 	smcvs	51028	; 0xc754
 17c:	00726464 	rsbseq	r6, r2, r4, ror #8
 180:	73796870 	cmnvc	r9, #7340032	; 0x700000
 184:	6c616369 	stclvs	3, cr6, [r1], #-420	; 0xfffffe5c
 188:	72646461 	rsbvc	r6, r4, #1627389952	; 0x61000000
 18c:	72656b00 	rsbvc	r6, r5, #0
 190:	2f6c656e 	svccs	0x006c656e
 194:	2e756d6d 	cdpcs	13, 7, cr6, cr5, cr13, {3}
 198:	6d6d0063 	stclvs	0, cr0, [sp, #-396]!	; 0xfffffe74
 19c:	6c745f75 	ldclvs	15, cr5, [r4], #-468	; 0xfffffe2c
 1a0:	61625f62 	cmnvs	r2, r2, ror #30
 1a4:	69006573 	stmdbvs	r0, {r0, r1, r4, r5, r6, r8, sl, sp, lr}
 1a8:	00616f74 	rsbeq	r6, r1, r4, ror pc
 1ac:	6e72656b 	cdpvs	5, 7, cr6, cr2, cr11, {3}
 1b0:	752f6c65 	strvc	r6, [pc, #-3173]!	; fffff553 <bss_end+0xcfff5527>
 1b4:	2e747261 	cdpcs	2, 7, cr7, cr4, cr1, {3}
 1b8:	67750063 	ldrbvs	r0, [r5, -r3, rrx]!
 1bc:	00737465 	rsbseq	r7, r3, r5, ror #8
 1c0:	61765f5f 	cmnvs	r6, pc, asr pc
 1c4:	73696c5f 	cmnvc	r9, #24320	; 0x5f00
 1c8:	65670074 	strbvs	r0, [r7, #-116]!	; 0x74
 1cc:	78006374 	stmdavc	r0, {r2, r4, r5, r6, r8, r9, sp, lr}
 1d0:	00616f74 	rsbeq	r6, r1, r4, ror pc
 1d4:	69727075 	ldmdbvs	r2!, {r0, r2, r4, r5, r6, ip, sp, lr}^
 1d8:	0066746e 	rsbeq	r7, r6, lr, ror #8
 1dc:	74726175 	ldrbtvc	r6, [r2], #-373	; 0x175
 1e0:	6e695f30 	mcrvs	15, 3, r5, cr9, cr0, {1}
 1e4:	5f007469 	svcpl	0x00007469
 1e8:	756e675f 	strbvc	r6, [lr, #-1887]!	; 0x75f
 1ec:	61765f63 	cmnvs	r6, r3, ror #30
 1f0:	73696c5f 	cmnvc	r9, #24320	; 0x5f00
 1f4:	75700074 	ldrbvc	r0, [r0, #-116]!	; 0x74
 1f8:	75006374 	strvc	r6, [r0, #-884]	; 0x374
 1fc:	73747570 	cmnvc	r4, #469762048	; 0x1c000000
 200:	76617300 	strbtvc	r7, [r1], -r0, lsl #6
 204:	5f5f0065 	svcpl	0x005f0065
 208:	6c007061 	stcvs	0, cr7, [r0], {97}	; 0x61
 20c:	695f6465 	ldmdbvs	pc, {r0, r2, r5, r6, sl, sp, lr}^
 210:	0074696e 	rsbseq	r6, r4, lr, ror #18
 214:	6e72656b 	cdpvs	5, 7, cr6, cr2, cr11, {3}
 218:	6c2f6c65 	stcvs	12, cr6, [pc], #-404	; 0xfffffe6c
 21c:	632e6465 	teqvs	lr, #1694498816	; 0x65000000
 220:	65656200 	strbvs	r6, [r5, #-512]!	; 0x200
 224:	6e695f70 	mcrvs	15, 3, r5, cr9, cr0, {3}
 228:	62007469 	andvs	r7, r0, #1761607680	; 0x69000000
 22c:	5f706565 	svcpl	0x00706565
 230:	006e7572 	rsbeq	r7, lr, r2, ror r5
 234:	5f64656c 	svcpl	0x0064656c
 238:	0066666f 	rsbeq	r6, r6, pc, ror #12
 23c:	5f64656c 	svcpl	0x0064656c
 240:	6d006e6f 	stcvs	14, cr6, [r0, #-444]	; 0xfffffe44
 244:	6f6d6d65 	svcvs	0x006d6d65
 248:	61006576 	tstvs	r0, r6, ror r5
 24c:	70656363 	rsbvc	r6, r5, r3, ror #6
 250:	656d0074 	strbvs	r0, [sp, #-116]!	; 0x74
 254:	706d636d 	rsbvc	r6, sp, sp, ror #6
 258:	70786500 	rsbsvc	r6, r8, r0, lsl #10
 25c:	6d003631 	stcvs	6, cr3, [r0, #-196]	; 0xffffff3c
 260:	65736d65 	ldrbvs	r6, [r3, #-3429]!	; 0xd65
 264:	656d0074 	strbvs	r0, [sp, #-116]!	; 0x74
 268:	7268636d 	rsbvc	r6, r8, #-1275068415	; 0xb4000001
 26c:	6d656d00 	stclvs	13, cr6, [r5]
 270:	6e616373 	mcrvs	3, 3, r6, cr1, cr3, {3}
 274:	72747300 	rsbsvc	r7, r4, #0
 278:	00726863 	rsbseq	r6, r2, r3, ror #16
 27c:	6c727473 	cfldrdvs	mvd7, [r2], #-460	; 0xfffffe34
 280:	64006e65 	strvs	r6, [r0], #-3685	; 0xe65
 284:	00747365 	rsbseq	r7, r4, r5, ror #6
 288:	616c6564 	cmnvs	ip, r4, ror #10
 28c:	74730079 	ldrbtvc	r0, [r3], #-121	; 0x79
 290:	79706372 	ldmdbvc	r0!, {r1, r4, r5, r6, r8, r9, sp, lr}^
 294:	72747300 	rsbsvc	r7, r4, #0
 298:	00746163 	rsbseq	r6, r4, r3, ror #2
 29c:	6e727473 	mrcvs	4, 3, r7, cr2, cr3, {3}
 2a0:	00797063 	rsbseq	r7, r9, r3, rrx
 2a4:	70727473 	rsbsvc	r7, r2, r3, ror r4
 2a8:	006b7262 	rsbeq	r7, fp, r2, ror #4
 2ac:	6e727473 	mrcvs	4, 3, r7, cr2, cr3, {3}
 2b0:	00746163 	rsbseq	r6, r4, r3, ror #2
 2b4:	696f7461 	stmdbvs	pc!, {r0, r5, r6, sl, ip, sp, lr}^
 2b8:	72747300 	rsbsvc	r7, r4, #0
 2bc:	00706d63 	rsbseq	r6, r0, r3, ror #26
 2c0:	6e727473 	mrcvs	4, 3, r7, cr2, cr3, {3}
 2c4:	006e656c 	rsbeq	r6, lr, ip, ror #10
 2c8:	73727473 	cmnvc	r2, #1929379840	; 0x73000000
 2cc:	61006e70 	tstvs	r0, r0, ror lr
 2d0:	00786f74 	rsbseq	r6, r8, r4, ror pc
 2d4:	6e756f63 	cdpvs	15, 7, cr6, cr5, cr3, {3}
 2d8:	656d0074 	strbvs	r0, [sp, #-116]!	; 0x74
 2dc:	7970636d 	ldmdbvc	r0!, {r0, r2, r3, r5, r6, r8, r9, sp, lr}^
 2e0:	72747300 	rsbsvc	r7, r4, #0
 2e4:	00727473 	rsbseq	r7, r2, r3, ror r4
 2e8:	65725f5f 	ldrbvs	r5, [r2, #-3935]!	; 0xf5f
 2ec:	74730073 	ldrbtvc	r0, [r3], #-115	; 0x73
 2f0:	6d636e72 	stclvs	14, cr6, [r3, #-456]!	; 0xfffffe38
 2f4:	696c0070 	stmdbvs	ip!, {r4, r5, r6}^
 2f8:	696c2f62 	stmdbvs	ip!, {r1, r5, r6, r8, r9, sl, fp, sp}^
 2fc:	00632e62 	rsbeq	r2, r3, r2, ror #28
