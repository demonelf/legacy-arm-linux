
miniboot.elf:     file format elf32-littlearm


Disassembly of section .text:

00000000 <_start>:
       0:	ea000010 	b	48 <Reset>
       4:	ea000005 	b	20 <Undef>
       8:	ea000005 	b	24 <SWI>
       c:	ea000005 	b	28 <P_abort>
      10:	ea000005 	b	2c <D_abort>
      14:	ea000005 	b	30 <Reserved>
      18:	ea000005 	b	34 <irq>
      1c:	ea000008 	b	44 <fiq>

00000020 <Undef>:
      20:	e1a00000 	nop			; (mov r0, r0)

00000024 <SWI>:
      24:	e1a00000 	nop			; (mov r0, r0)

00000028 <P_abort>:
      28:	e1a00000 	nop			; (mov r0, r0)

0000002c <D_abort>:
      2c:	e1a00000 	nop			; (mov r0, r0)

00000030 <Reserved>:
      30:	e1a00000 	nop			; (mov r0, r0)

00000034 <irq>:
      34:	e24ee004 	sub	lr, lr, #4
      38:	e92d5fff 	push	{r0, r1, r2, r3, r4, r5, r6, r7, r8, r9, sl, fp, ip, lr}
      3c:	eb00017b 	bl	630 <handle_int>

00000040 <int_return>:
      40:	e8fd9fff 	ldm	sp!, {r0, r1, r2, r3, r4, r5, r6, r7, r8, r9, sl, fp, ip, pc}^

00000044 <fiq>:
      44:	e1a00000 	nop			; (mov r0, r0)

00000048 <Reset>:
      48:	eb00000b 	bl	7c <set_cpu_mode>
      4c:	eb00000f 	bl	90 <turn_off_watchdog>
      50:	eb000012 	bl	a0 <mask_irqs>
      54:	eb000015 	bl	b0 <set_clock>
      58:	eb00001e 	bl	d8 <disable_caches>
      5c:	eb000022 	bl	ec <init_sram>
      60:	eb00003e 	bl	160 <init_stack>
      64:	eb000040 	bl	16c <clean_bss>
      68:	eb000217 	bl	8cc <nand_init>
      6c:	eb000034 	bl	144 <copy_to_ram>
      70:	eb00004e 	bl	1b0 <create_page_table>
      74:	eb000082 	bl	284 <mmu_init>
      78:	e59ff110 	ldr	pc, [pc, #272]	; 190 <clean_loop+0x14>

0000007c <set_cpu_mode>:
      7c:	e10f0000 	mrs	r0, CPSR
      80:	e3c0001f 	bic	r0, r0, #31
      84:	e38000d3 	orr	r0, r0, #211	; 0xd3
      88:	e129f000 	msr	CPSR_fc, r0
      8c:	e1a0f00e 	mov	pc, lr

00000090 <turn_off_watchdog>:
      90:	e3a00453 	mov	r0, #1392508928	; 0x53000000
      94:	e3a01000 	mov	r1, #0
      98:	e5801000 	str	r1, [r0]
      9c:	e1a0f00e 	mov	pc, lr

000000a0 <mask_irqs>:
      a0:	e3e00000 	mvn	r0, #0
      a4:	e59f10e8 	ldr	r1, [pc, #232]	; 194 <clean_loop+0x18>
      a8:	e5810000 	str	r0, [r1]
      ac:	e1a0f00e 	mov	pc, lr

000000b0 <set_clock>:
      b0:	e59f00e0 	ldr	r0, [pc, #224]	; 198 <clean_loop+0x1c>
      b4:	e3a01005 	mov	r1, #5
      b8:	e5801000 	str	r1, [r0]
      bc:	ee110f10 	mrc	15, 0, r0, cr1, cr0, {0}
      c0:	e3800103 	orr	r0, r0, #-1073741824	; 0xc0000000
      c4:	ee010f10 	mcr	15, 0, r0, cr1, cr0, {0}
      c8:	e59f00cc 	ldr	r0, [pc, #204]	; 19c <clean_loop+0x20>
      cc:	e59f10cc 	ldr	r1, [pc, #204]	; 1a0 <clean_loop+0x24>
      d0:	e5801000 	str	r1, [r0]
      d4:	e1a0f00e 	mov	pc, lr

000000d8 <disable_caches>:
      d8:	ee070f17 	mcr	15, 0, r0, cr7, cr7, {0}
      dc:	ee110f10 	mrc	15, 0, r0, cr1, cr0, {0}
      e0:	e3c00007 	bic	r0, r0, #7
      e4:	ee010f10 	mcr	15, 0, r0, cr1, cr0, {0}
      e8:	e1a0f00e 	mov	pc, lr

000000ec <init_sram>:
      ec:	e3a01312 	mov	r1, #1207959552	; 0x48000000
      f0:	e28f2018 	add	r2, pc, #24
      f4:	e1a00000 	nop			; (mov r0, r0)
      f8:	e2813034 	add	r3, r1, #52	; 0x34
      fc:	e4924004 	ldr	r4, [r2], #4
     100:	e4814004 	str	r4, [r1], #4
     104:	e1510003 	cmp	r1, r3
     108:	1afffffb 	bne	fc <init_sram+0x10>
     10c:	e1a0f00e 	mov	pc, lr

00000110 <mem_cfg_val>:
     110:	22011110 	andcs	r1, r1, #4
     114:	00000700 	andeq	r0, r0, r0, lsl #14
     118:	00000700 	andeq	r0, r0, r0, lsl #14
     11c:	00000700 	andeq	r0, r0, r0, lsl #14
     120:	00000700 	andeq	r0, r0, r0, lsl #14
     124:	00000700 	andeq	r0, r0, r0, lsl #14
     128:	00000700 	andeq	r0, r0, r0, lsl #14
     12c:	00018005 	andeq	r8, r1, r5
     130:	00018005 	andeq	r8, r1, r5
     134:	008c04ec 	addeq	r0, ip, ip, ror #9
     138:	000000b1 	strheq	r0, [r0], -r1
     13c:	00000030 	andeq	r0, r0, r0, lsr r0
     140:	00000030 	andeq	r0, r0, r0, lsr r0

00000144 <copy_to_ram>:
     144:	e3a00000 	mov	r0, #0
     148:	e3a01431 	mov	r1, #822083584	; 0x31000000
     14c:	e59f2050 	ldr	r2, [pc, #80]	; 1a4 <clean_loop+0x28>
     150:	e1a0c00e 	mov	ip, lr
     154:	eb000261 	bl	ae0 <nand_to_ram>
     158:	e1a0e00c 	mov	lr, ip
     15c:	e1a0f00e 	mov	pc, lr

00000160 <init_stack>:
     160:	e321f0d3 	msr	CPSR_c, #211	; 0xd3
     164:	e59fd03c 	ldr	sp, [pc, #60]	; 1a8 <clean_loop+0x2c>
     168:	e1a0f00e 	mov	pc, lr

0000016c <clean_bss>:
     16c:	e59f0038 	ldr	r0, [pc, #56]	; 1ac <clean_loop+0x30>
     170:	e59f102c 	ldr	r1, [pc, #44]	; 1a4 <clean_loop+0x28>
     174:	e1500001 	cmp	r0, r1
     178:	01a0f00e 	moveq	pc, lr

0000017c <clean_loop>:
     17c:	e3a02000 	mov	r2, #0
     180:	e4802004 	str	r2, [r0], #4
     184:	e1500001 	cmp	r0, r1
     188:	1afffffb 	bne	17c <clean_loop>
     18c:	e1a0f00e 	mov	pc, lr
     190:	0000066c 	andeq	r0, r0, ip, ror #12
     194:	4a000008 	bmi	1bc <create_page_table+0xc>
     198:	4c000014 	stcmi	0, cr0, [r0], {20}
     19c:	4c000004 	stcmi	0, cr0, [r0], {4}
     1a0:	0007f021 	andeq	pc, r7, r1, lsr #32
     1a4:	000032e8 	andeq	r3, r0, r8, ror #5
     1a8:	31010000 	tstcc	r1, r0
     1ac:	000023d8 	ldrdeq	r2, [r0], -r8

000001b0 <create_page_table>:
     1b0:	e52db004 	push	{fp}		; (str fp, [sp, #-4]!)
     1b4:	e28db000 	add	fp, sp, #0
     1b8:	e24dd014 	sub	sp, sp, #20
     1bc:	e3a03203 	mov	r3, #805306368	; 0x30000000
     1c0:	e50b3008 	str	r3, [fp, #-8]
     1c4:	e3a03000 	mov	r3, #0
     1c8:	e50b3010 	str	r3, [fp, #-16]
     1cc:	e3a03431 	mov	r3, #822083584	; 0x31000000
     1d0:	e50b300c 	str	r3, [fp, #-12]
     1d4:	e51b3010 	ldr	r3, [fp, #-16]
     1d8:	e1a03a23 	lsr	r3, r3, #20
     1dc:	e1a03103 	lsl	r3, r3, #2
     1e0:	e51b2008 	ldr	r2, [fp, #-8]
     1e4:	e0822003 	add	r2, r2, r3
     1e8:	e51b300c 	ldr	r3, [fp, #-12]
     1ec:	e1a03a23 	lsr	r3, r3, #20
     1f0:	e1a03a03 	lsl	r3, r3, #20
     1f4:	e3833ec1 	orr	r3, r3, #3088	; 0xc10
     1f8:	e383300e 	orr	r3, r3, #14
     1fc:	e5823000 	str	r3, [r2]
     200:	e3a03456 	mov	r3, #1442840576	; 0x56000000
     204:	e50b3010 	str	r3, [fp, #-16]
     208:	e3a03456 	mov	r3, #1442840576	; 0x56000000
     20c:	e50b300c 	str	r3, [fp, #-12]
     210:	e51b3010 	ldr	r3, [fp, #-16]
     214:	e1a03a23 	lsr	r3, r3, #20
     218:	e1a03103 	lsl	r3, r3, #2
     21c:	e51b2008 	ldr	r2, [fp, #-8]
     220:	e0822003 	add	r2, r2, r3
     224:	e51b300c 	ldr	r3, [fp, #-12]
     228:	e1a03a23 	lsr	r3, r3, #20
     22c:	e1a03a03 	lsl	r3, r3, #20
     230:	e3833ec1 	orr	r3, r3, #3088	; 0xc10
     234:	e3833002 	orr	r3, r3, #2
     238:	e5823000 	str	r3, [r2]
     23c:	e3a03205 	mov	r3, #1342177280	; 0x50000000
     240:	e50b3010 	str	r3, [fp, #-16]
     244:	e3a03205 	mov	r3, #1342177280	; 0x50000000
     248:	e50b300c 	str	r3, [fp, #-12]
     24c:	e51b3010 	ldr	r3, [fp, #-16]
     250:	e1a03a23 	lsr	r3, r3, #20
     254:	e1a03103 	lsl	r3, r3, #2
     258:	e51b2008 	ldr	r2, [fp, #-8]
     25c:	e0822003 	add	r2, r2, r3
     260:	e51b300c 	ldr	r3, [fp, #-12]
     264:	e1a03a23 	lsr	r3, r3, #20
     268:	e1a03a03 	lsl	r3, r3, #20
     26c:	e3833ec1 	orr	r3, r3, #3088	; 0xc10
     270:	e3833002 	orr	r3, r3, #2
     274:	e5823000 	str	r3, [r2]
     278:	e28bd000 	add	sp, fp, #0
     27c:	e8bd0800 	pop	{fp}
     280:	e12fff1e 	bx	lr

00000284 <mmu_init>:
     284:	e52db004 	push	{fp}		; (str fp, [sp, #-4]!)
     288:	e28db000 	add	fp, sp, #0
     28c:	e24dd00c 	sub	sp, sp, #12
     290:	e3a03203 	mov	r3, #805306368	; 0x30000000
     294:	e50b3008 	str	r3, [fp, #-8]
     298:	e51b3008 	ldr	r3, [fp, #-8]
     29c:	e3a00000 	mov	r0, #0
     2a0:	ee070f17 	mcr	15, 0, r0, cr7, cr7, {0}
     2a4:	ee070f9a 	mcr	15, 0, r0, cr7, cr10, {4}
     2a8:	ee080f17 	mcr	15, 0, r0, cr8, cr7, {0}
     2ac:	e1a04003 	mov	r4, r3
     2b0:	ee024f10 	mcr	15, 0, r4, cr2, cr0, {0}
     2b4:	e3e00000 	mvn	r0, #0
     2b8:	ee030f10 	mcr	15, 0, r0, cr3, cr0, {0}
     2bc:	ee110f10 	mrc	15, 0, r0, cr1, cr0, {0}
     2c0:	e3c00a03 	bic	r0, r0, #12288	; 0x3000
     2c4:	e3c00c03 	bic	r0, r0, #768	; 0x300
     2c8:	e3c00087 	bic	r0, r0, #135	; 0x87
     2cc:	e3800002 	orr	r0, r0, #2
     2d0:	e3800004 	orr	r0, r0, #4
     2d4:	e3800a01 	orr	r0, r0, #4096	; 0x1000
     2d8:	e3800001 	orr	r0, r0, #1
     2dc:	ee010f10 	mcr	15, 0, r0, cr1, cr0, {0}
     2e0:	e3a00431 	mov	r0, #822083584	; 0x31000000
     2e4:	e04b0000 	sub	r0, fp, r0
     2e8:	e1a0b000 	mov	fp, r0
     2ec:	e3a00431 	mov	r0, #822083584	; 0x31000000
     2f0:	e04d0000 	sub	r0, sp, r0
     2f4:	e1a0d000 	mov	sp, r0
     2f8:	e28bd000 	add	sp, fp, #0
     2fc:	e8bd0800 	pop	{fp}
     300:	e12fff1e 	bx	lr

00000304 <shell_led>:
     304:	e92d4810 	push	{r4, fp, lr}
     308:	e28db008 	add	fp, sp, #8
     30c:	e24dd01c 	sub	sp, sp, #28
     310:	e50b0020 	str	r0, [fp, #-32]
     314:	e50b1024 	str	r1, [fp, #-36]	; 0x24
     318:	e3a03000 	mov	r3, #0
     31c:	e50b3018 	str	r3, [fp, #-24]
     320:	ea00001e 	b	3a0 <shell_led+0x9c>
     324:	e51b3024 	ldr	r3, [fp, #-36]	; 0x24
     328:	e2832010 	add	r2, r3, #16
     32c:	e51b3018 	ldr	r3, [fp, #-24]
     330:	e7d23003 	ldrb	r3, [r2, r3]
     334:	e1a04003 	mov	r4, r3
     338:	e51b2024 	ldr	r2, [fp, #-36]	; 0x24
     33c:	e51b3018 	ldr	r3, [fp, #-24]
     340:	e2833010 	add	r3, r3, #16
     344:	e0823003 	add	r3, r2, r3
     348:	e1a00003 	mov	r0, r3
     34c:	eb0004bf 	bl	1650 <atoi>
     350:	e1a03000 	mov	r3, r0
     354:	e59f005c 	ldr	r0, [pc, #92]	; 3b8 <shell_led+0xb4>
     358:	e1a01004 	mov	r1, r4
     35c:	e1a02003 	mov	r2, r3
     360:	eb000342 	bl	1070 <uprintf>
     364:	e51b2024 	ldr	r2, [fp, #-36]	; 0x24
     368:	e51b3018 	ldr	r3, [fp, #-24]
     36c:	e2833010 	add	r3, r3, #16
     370:	e0823003 	add	r3, r2, r3
     374:	e1a00003 	mov	r0, r3
     378:	eb0004b4 	bl	1650 <atoi>
     37c:	e1a03000 	mov	r3, r0
     380:	e3530000 	cmp	r3, #0
     384:	0a000001 	beq	390 <shell_led+0x8c>
     388:	eb000433 	bl	145c <led_on>
     38c:	ea000000 	b	394 <shell_led+0x90>
     390:	eb00043a 	bl	1480 <led_off>
     394:	e51b3018 	ldr	r3, [fp, #-24]
     398:	e2833001 	add	r3, r3, #1
     39c:	e50b3018 	str	r3, [fp, #-24]
     3a0:	e51b3018 	ldr	r3, [fp, #-24]
     3a4:	e3530003 	cmp	r3, #3
     3a8:	daffffdd 	ble	324 <shell_led+0x20>
     3ac:	e24bd008 	sub	sp, fp, #8
     3b0:	e8bd4810 	pop	{r4, fp, lr}
     3b4:	e12fff1e 	bx	lr
     3b8:	00002360 	andeq	r2, r0, r0, ror #6

000003bc <shell_common>:
     3bc:	e92d4800 	push	{fp, lr}
     3c0:	e28db004 	add	fp, sp, #4
     3c4:	e24dd008 	sub	sp, sp, #8
     3c8:	e50b0008 	str	r0, [fp, #-8]
     3cc:	e50b100c 	str	r1, [fp, #-12]
     3d0:	e51b300c 	ldr	r3, [fp, #-12]
     3d4:	e1a00003 	mov	r0, r3
     3d8:	e59f1038 	ldr	r1, [pc, #56]	; 418 <shell_common+0x5c>
     3dc:	eb00056b 	bl	1990 <strcmp>
     3e0:	e1a03000 	mov	r3, r0
     3e4:	e3530000 	cmp	r3, #0
     3e8:	1a000003 	bne	3fc <shell_common+0x40>
     3ec:	e51b0008 	ldr	r0, [fp, #-8]
     3f0:	e51b100c 	ldr	r1, [fp, #-12]
     3f4:	ebffffc2 	bl	304 <shell_led>
     3f8:	ea000003 	b	40c <shell_common+0x50>
     3fc:	e51b300c 	ldr	r3, [fp, #-12]
     400:	e59f0014 	ldr	r0, [pc, #20]	; 41c <shell_common+0x60>
     404:	e1a01003 	mov	r1, r3
     408:	eb000318 	bl	1070 <uprintf>
     40c:	e24bd004 	sub	sp, fp, #4
     410:	e8bd4800 	pop	{fp, lr}
     414:	e12fff1e 	bx	lr
     418:	0000236c 	andeq	r2, r0, ip, ror #6
     41c:	00002370 	andeq	r2, r0, r0, ror r3

00000420 <init>:
     420:	e92d4800 	push	{fp, lr}
     424:	e28db004 	add	fp, sp, #4
     428:	e24dde47 	sub	sp, sp, #1136	; 0x470
     42c:	e3a03000 	mov	r3, #0
     430:	e50b3010 	str	r3, [fp, #-16]
     434:	e3a03000 	mov	r3, #0
     438:	e50b300c 	str	r3, [fp, #-12]
     43c:	e3a03000 	mov	r3, #0
     440:	e50b3008 	str	r3, [fp, #-8]
     444:	eb0003f7 	bl	1428 <led_init>
     448:	eb0001f0 	bl	c10 <uart0_init>
     44c:	e1a0300f 	mov	r3, pc
     450:	e59f01c8 	ldr	r0, [pc, #456]	; 620 <init+0x200>
     454:	e1a01003 	mov	r1, r3
     458:	eb000304 	bl	1070 <uprintf>
     45c:	e59f01c0 	ldr	r0, [pc, #448]	; 624 <init+0x204>
     460:	eb000302 	bl	1070 <uprintf>
     464:	e24b3b01 	sub	r3, fp, #1024	; 0x400
     468:	e2433004 	sub	r3, r3, #4
     46c:	e243300c 	sub	r3, r3, #12
     470:	e1a00003 	mov	r0, r3
     474:	eb000239 	bl	d60 <ugets>
     478:	e3a03000 	mov	r3, #0
     47c:	e50b3010 	str	r3, [fp, #-16]
     480:	e3a03000 	mov	r3, #0
     484:	e50b300c 	str	r3, [fp, #-12]
     488:	e3a03000 	mov	r3, #0
     48c:	e50b3008 	str	r3, [fp, #-8]
     490:	ea000046 	b	5b0 <init+0x190>
     494:	e51b2010 	ldr	r2, [fp, #-16]
     498:	e59f3188 	ldr	r3, [pc, #392]	; 628 <init+0x208>
     49c:	e24b0004 	sub	r0, fp, #4
     4a0:	e0802002 	add	r2, r0, r2
     4a4:	e0823003 	add	r3, r2, r3
     4a8:	e5d33000 	ldrb	r3, [r3]
     4ac:	e3530020 	cmp	r3, #32
     4b0:	0a00001a 	beq	520 <init+0x100>
     4b4:	e51b2010 	ldr	r2, [fp, #-16]
     4b8:	e59f3168 	ldr	r3, [pc, #360]	; 628 <init+0x208>
     4bc:	e24b1004 	sub	r1, fp, #4
     4c0:	e0812002 	add	r2, r1, r2
     4c4:	e0823003 	add	r3, r2, r3
     4c8:	e5d33000 	ldrb	r3, [r3]
     4cc:	e3530009 	cmp	r3, #9
     4d0:	0a000012 	beq	520 <init+0x100>
     4d4:	e51b000c 	ldr	r0, [fp, #-12]
     4d8:	e51b1008 	ldr	r1, [fp, #-8]
     4dc:	e51b2010 	ldr	r2, [fp, #-16]
     4e0:	e59f3140 	ldr	r3, [pc, #320]	; 628 <init+0x208>
     4e4:	e24bc004 	sub	ip, fp, #4
     4e8:	e08c2002 	add	r2, ip, r2
     4ec:	e0823003 	add	r3, r2, r3
     4f0:	e5d32000 	ldrb	r2, [r3]
     4f4:	e59f3130 	ldr	r3, [pc, #304]	; 62c <init+0x20c>
     4f8:	e1a00200 	lsl	r0, r0, #4
     4fc:	e24bc004 	sub	ip, fp, #4
     500:	e08c0000 	add	r0, ip, r0
     504:	e0801001 	add	r1, r0, r1
     508:	e0813003 	add	r3, r1, r3
     50c:	e5c32000 	strb	r2, [r3]
     510:	e51b3008 	ldr	r3, [fp, #-8]
     514:	e2833001 	add	r3, r3, #1
     518:	e50b3008 	str	r3, [fp, #-8]
     51c:	ea000020 	b	5a4 <init+0x184>
     520:	e51b3010 	ldr	r3, [fp, #-16]
     524:	e2432001 	sub	r2, r3, #1
     528:	e59f30f8 	ldr	r3, [pc, #248]	; 628 <init+0x208>
     52c:	e24b0004 	sub	r0, fp, #4
     530:	e0802002 	add	r2, r0, r2
     534:	e0823003 	add	r3, r2, r3
     538:	e5d33000 	ldrb	r3, [r3]
     53c:	e3530020 	cmp	r3, #32
     540:	0a000017 	beq	5a4 <init+0x184>
     544:	e51b3010 	ldr	r3, [fp, #-16]
     548:	e2432001 	sub	r2, r3, #1
     54c:	e59f30d4 	ldr	r3, [pc, #212]	; 628 <init+0x208>
     550:	e24b1004 	sub	r1, fp, #4
     554:	e0812002 	add	r2, r1, r2
     558:	e0823003 	add	r3, r2, r3
     55c:	e5d33000 	ldrb	r3, [r3]
     560:	e3530009 	cmp	r3, #9
     564:	0a00000e 	beq	5a4 <init+0x184>
     568:	e51b100c 	ldr	r1, [fp, #-12]
     56c:	e51b2008 	ldr	r2, [fp, #-8]
     570:	e59f30b4 	ldr	r3, [pc, #180]	; 62c <init+0x20c>
     574:	e1a01201 	lsl	r1, r1, #4
     578:	e24bc004 	sub	ip, fp, #4
     57c:	e08c1001 	add	r1, ip, r1
     580:	e0812002 	add	r2, r1, r2
     584:	e0823003 	add	r3, r2, r3
     588:	e3a02000 	mov	r2, #0
     58c:	e5c32000 	strb	r2, [r3]
     590:	e51b300c 	ldr	r3, [fp, #-12]
     594:	e2833001 	add	r3, r3, #1
     598:	e50b300c 	str	r3, [fp, #-12]
     59c:	e3a03000 	mov	r3, #0
     5a0:	e50b3008 	str	r3, [fp, #-8]
     5a4:	e51b3010 	ldr	r3, [fp, #-16]
     5a8:	e2833001 	add	r3, r3, #1
     5ac:	e50b3010 	str	r3, [fp, #-16]
     5b0:	e51b2010 	ldr	r2, [fp, #-16]
     5b4:	e59f306c 	ldr	r3, [pc, #108]	; 628 <init+0x208>
     5b8:	e24b0004 	sub	r0, fp, #4
     5bc:	e0802002 	add	r2, r0, r2
     5c0:	e0823003 	add	r3, r2, r3
     5c4:	e5d33000 	ldrb	r3, [r3]
     5c8:	e3530000 	cmp	r3, #0
     5cc:	1affffb0 	bne	494 <init+0x74>
     5d0:	e51b100c 	ldr	r1, [fp, #-12]
     5d4:	e51b2008 	ldr	r2, [fp, #-8]
     5d8:	e59f304c 	ldr	r3, [pc, #76]	; 62c <init+0x20c>
     5dc:	e1a01201 	lsl	r1, r1, #4
     5e0:	e24bc004 	sub	ip, fp, #4
     5e4:	e08c1001 	add	r1, ip, r1
     5e8:	e0812002 	add	r2, r1, r2
     5ec:	e0823003 	add	r3, r2, r3
     5f0:	e3a02000 	mov	r2, #0
     5f4:	e5c32000 	strb	r2, [r3]
     5f8:	e51b300c 	ldr	r3, [fp, #-12]
     5fc:	e2833002 	add	r3, r3, #2
     600:	e50b300c 	str	r3, [fp, #-12]
     604:	e24b3e46 	sub	r3, fp, #1120	; 0x460
     608:	e2433004 	sub	r3, r3, #4
     60c:	e243300c 	sub	r3, r3, #12
     610:	e51b000c 	ldr	r0, [fp, #-12]
     614:	e1a01003 	mov	r1, r3
     618:	ebffff67 	bl	3bc <shell_common>
     61c:	eaffff8e 	b	45c <init+0x3c>
     620:	0000238c 	andeq	r2, r0, ip, lsl #7
     624:	00002394 	muleq	r0, r4, r3
     628:	fffffbf4 	undefined instruction 0xfffffbf4
     62c:	fffffb94 	undefined instruction 0xfffffb94

00000630 <handle_int>:
     630:	e92d4800 	push	{fp, lr}
     634:	e28db004 	add	fp, sp, #4
     638:	e59f3020 	ldr	r3, [pc, #32]	; 660 <handle_int+0x30>
     63c:	e59f0020 	ldr	r0, [pc, #32]	; 664 <handle_int+0x34>
     640:	e1a0e00f 	mov	lr, pc
     644:	e12fff13 	bx	r3
     648:	e59f3018 	ldr	r3, [pc, #24]	; 668 <handle_int+0x38>
     64c:	e1a0e00f 	mov	lr, pc
     650:	e12fff13 	bx	r3
     654:	e24bd004 	sub	sp, fp, #4
     658:	e8bd4800 	pop	{fp, lr}
     65c:	e12fff1e 	bx	lr
     660:	33f963a4 	mvnscc	r6, #-1879048190	; 0x90000002
     664:	000023ac 	andeq	r2, r0, ip, lsr #7
     668:	30008374 	andcc	r8, r0, r4, ror r3

0000066c <main>:
     66c:	e92d4800 	push	{fp, lr}
     670:	e28db004 	add	fp, sp, #4
     674:	e24dde47 	sub	sp, sp, #1136	; 0x470
     678:	e3a03000 	mov	r3, #0
     67c:	e50b3010 	str	r3, [fp, #-16]
     680:	e3a03000 	mov	r3, #0
     684:	e50b300c 	str	r3, [fp, #-12]
     688:	e3a03000 	mov	r3, #0
     68c:	e50b3008 	str	r3, [fp, #-8]
     690:	e59f30dc 	ldr	r3, [pc, #220]	; 774 <main+0x108>
     694:	e3a02641 	mov	r2, #68157440	; 0x4100000
     698:	e5832000 	str	r2, [r3]
     69c:	e59f30d0 	ldr	r3, [pc, #208]	; 774 <main+0x108>
     6a0:	e5933000 	ldr	r3, [r3]
     6a4:	e3c33eff 	bic	r3, r3, #4080	; 0xff0
     6a8:	e3c3300f 	bic	r3, r3, #15
     6ac:	e59f20c0 	ldr	r2, [pc, #192]	; 774 <main+0x108>
     6b0:	e5823000 	str	r3, [r2]
     6b4:	e59f30b8 	ldr	r3, [pc, #184]	; 774 <main+0x108>
     6b8:	e5933000 	ldr	r3, [r3]
     6bc:	e3530401 	cmp	r3, #16777216	; 0x1000000
     6c0:	da000002 	ble	6d0 <main+0x64>
     6c4:	e59f30a8 	ldr	r3, [pc, #168]	; 774 <main+0x108>
     6c8:	e3a02401 	mov	r2, #16777216	; 0x1000000
     6cc:	e5832000 	str	r2, [r3]
     6d0:	e59f309c 	ldr	r3, [pc, #156]	; 774 <main+0x108>
     6d4:	e5933000 	ldr	r3, [r3]
     6d8:	e3530503 	cmp	r3, #12582912	; 0xc00000
     6dc:	da000003 	ble	6f0 <main+0x84>
     6e0:	e59f3090 	ldr	r3, [pc, #144]	; 778 <main+0x10c>
     6e4:	e3a02501 	mov	r2, #4194304	; 0x400000
     6e8:	e5832000 	str	r2, [r3]
     6ec:	ea00000a 	b	71c <main+0xb0>
     6f0:	e59f307c 	ldr	r3, [pc, #124]	; 774 <main+0x108>
     6f4:	e5933000 	ldr	r3, [r3]
     6f8:	e3530606 	cmp	r3, #6291456	; 0x600000
     6fc:	da000003 	ble	710 <main+0xa4>
     700:	e59f3070 	ldr	r3, [pc, #112]	; 778 <main+0x10c>
     704:	e3a02602 	mov	r2, #2097152	; 0x200000
     708:	e5832000 	str	r2, [r3]
     70c:	ea000002 	b	71c <main+0xb0>
     710:	e59f3060 	ldr	r3, [pc, #96]	; 778 <main+0x10c>
     714:	e3a02601 	mov	r2, #1048576	; 0x100000
     718:	e5832000 	str	r2, [r3]
     71c:	e59f3054 	ldr	r3, [pc, #84]	; 778 <main+0x10c>
     720:	e5932000 	ldr	r2, [r3]
     724:	e59f3050 	ldr	r3, [pc, #80]	; 77c <main+0x110>
     728:	e5832000 	str	r2, [r3]
     72c:	e59f3048 	ldr	r3, [pc, #72]	; 77c <main+0x110>
     730:	e5932000 	ldr	r2, [r3]
     734:	e59f3038 	ldr	r3, [pc, #56]	; 774 <main+0x108>
     738:	e5933000 	ldr	r3, [r3]
     73c:	e1a00002 	mov	r0, r2
     740:	e1a01003 	mov	r1, r3
     744:	eb0006b7 	bl	2228 <mem_init>
     748:	eb00012b 	bl	bfc <trap_init>
     74c:	eb000335 	bl	1428 <led_init>
     750:	eb00012e 	bl	c10 <uart0_init>
     754:	e59f0024 	ldr	r0, [pc, #36]	; 780 <main+0x114>
     758:	eb000244 	bl	1070 <uprintf>
     75c:	e24b3b01 	sub	r3, fp, #1024	; 0x400
     760:	e2433004 	sub	r3, r3, #4
     764:	e243300c 	sub	r3, r3, #12
     768:	e1a00003 	mov	r0, r3
     76c:	eb00017b 	bl	d60 <ugets>
     770:	eafffff7 	b	754 <main+0xe8>
     774:	000023d8 	ldrdeq	r2, [r0], -r8
     778:	000023dc 	ldrdeq	r2, [r0], -ip
     77c:	000023e0 	andeq	r2, r0, r0, ror #7
     780:	00002394 	muleq	r0, r4, r3

00000784 <select_chip>:
     784:	e52db004 	push	{fp}		; (str fp, [sp, #-4]!)
     788:	e28db000 	add	fp, sp, #0
     78c:	e59f3018 	ldr	r3, [pc, #24]	; 7ac <select_chip+0x28>
     790:	e59f2014 	ldr	r2, [pc, #20]	; 7ac <select_chip+0x28>
     794:	e5922000 	ldr	r2, [r2]
     798:	e3c22002 	bic	r2, r2, #2
     79c:	e5832000 	str	r2, [r3]
     7a0:	e28bd000 	add	sp, fp, #0
     7a4:	e8bd0800 	pop	{fp}
     7a8:	e12fff1e 	bx	lr
     7ac:	4e000004 	cdpmi	0, 0, cr0, cr0, cr4, {0}

000007b0 <diselect_chip>:
     7b0:	e52db004 	push	{fp}		; (str fp, [sp, #-4]!)
     7b4:	e28db000 	add	fp, sp, #0
     7b8:	e59f3018 	ldr	r3, [pc, #24]	; 7d8 <diselect_chip+0x28>
     7bc:	e59f2014 	ldr	r2, [pc, #20]	; 7d8 <diselect_chip+0x28>
     7c0:	e5922000 	ldr	r2, [r2]
     7c4:	e3822002 	orr	r2, r2, #2
     7c8:	e5832000 	str	r2, [r3]
     7cc:	e28bd000 	add	sp, fp, #0
     7d0:	e8bd0800 	pop	{fp}
     7d4:	e12fff1e 	bx	lr
     7d8:	4e000004 	cdpmi	0, 0, cr0, cr0, cr4, {0}

000007dc <clear_RnB>:
     7dc:	e52db004 	push	{fp}		; (str fp, [sp, #-4]!)
     7e0:	e28db000 	add	fp, sp, #0
     7e4:	e59f3020 	ldr	r3, [pc, #32]	; 80c <clear_RnB+0x30>
     7e8:	e59f201c 	ldr	r2, [pc, #28]	; 80c <clear_RnB+0x30>
     7ec:	e5d22000 	ldrb	r2, [r2]
     7f0:	e20220ff 	and	r2, r2, #255	; 0xff
     7f4:	e3822004 	orr	r2, r2, #4
     7f8:	e20220ff 	and	r2, r2, #255	; 0xff
     7fc:	e5c32000 	strb	r2, [r3]
     800:	e28bd000 	add	sp, fp, #0
     804:	e8bd0800 	pop	{fp}
     808:	e12fff1e 	bx	lr
     80c:	4e000020 	cdpmi	0, 0, cr0, cr0, cr0, {1}

00000810 <send_cmmd>:
     810:	e52db004 	push	{fp}		; (str fp, [sp, #-4]!)
     814:	e28db000 	add	fp, sp, #0
     818:	e24dd00c 	sub	sp, sp, #12
     81c:	e50b0008 	str	r0, [fp, #-8]
     820:	e59f3014 	ldr	r3, [pc, #20]	; 83c <send_cmmd+0x2c>
     824:	e51b2008 	ldr	r2, [fp, #-8]
     828:	e20220ff 	and	r2, r2, #255	; 0xff
     82c:	e5c32000 	strb	r2, [r3]
     830:	e28bd000 	add	sp, fp, #0
     834:	e8bd0800 	pop	{fp}
     838:	e12fff1e 	bx	lr
     83c:	4e000008 	cdpmi	0, 0, cr0, cr0, cr8, {0}

00000840 <send_addr>:
     840:	e52db004 	push	{fp}		; (str fp, [sp, #-4]!)
     844:	e28db000 	add	fp, sp, #0
     848:	e24dd00c 	sub	sp, sp, #12
     84c:	e50b0008 	str	r0, [fp, #-8]
     850:	e59f3014 	ldr	r3, [pc, #20]	; 86c <send_addr+0x2c>
     854:	e51b2008 	ldr	r2, [fp, #-8]
     858:	e20220ff 	and	r2, r2, #255	; 0xff
     85c:	e5c32000 	strb	r2, [r3]
     860:	e28bd000 	add	sp, fp, #0
     864:	e8bd0800 	pop	{fp}
     868:	e12fff1e 	bx	lr
     86c:	4e00000c 	cdpmi	0, 0, cr0, cr0, cr12, {0}

00000870 <wait_RnB>:
     870:	e52db004 	push	{fp}		; (str fp, [sp, #-4]!)
     874:	e28db000 	add	fp, sp, #0
     878:	e59f301c 	ldr	r3, [pc, #28]	; 89c <wait_RnB+0x2c>
     87c:	e5d33000 	ldrb	r3, [r3]
     880:	e20330ff 	and	r3, r3, #255	; 0xff
     884:	e2033004 	and	r3, r3, #4
     888:	e3530000 	cmp	r3, #0
     88c:	0afffff9 	beq	878 <wait_RnB+0x8>
     890:	e28bd000 	add	sp, fp, #0
     894:	e8bd0800 	pop	{fp}
     898:	e12fff1e 	bx	lr
     89c:	4e000020 	cdpmi	0, 0, cr0, cr0, cr0, {1}

000008a0 <nand_reset>:
     8a0:	e92d4800 	push	{fp, lr}
     8a4:	e28db004 	add	fp, sp, #4
     8a8:	ebffffb5 	bl	784 <select_chip>
     8ac:	ebffffca 	bl	7dc <clear_RnB>
     8b0:	e3a000ff 	mov	r0, #255	; 0xff
     8b4:	ebffffd5 	bl	810 <send_cmmd>
     8b8:	ebffffec 	bl	870 <wait_RnB>
     8bc:	ebffffbb 	bl	7b0 <diselect_chip>
     8c0:	e24bd004 	sub	sp, fp, #4
     8c4:	e8bd4800 	pop	{fp, lr}
     8c8:	e12fff1e 	bx	lr

000008cc <nand_init>:
     8cc:	e92d4800 	push	{fp, lr}
     8d0:	e28db004 	add	fp, sp, #4
     8d4:	e3a0344e 	mov	r3, #1308622848	; 0x4e000000
     8d8:	e59f201c 	ldr	r2, [pc, #28]	; 8fc <nand_init+0x30>
     8dc:	e5832000 	str	r2, [r3]
     8e0:	e59f3018 	ldr	r3, [pc, #24]	; 900 <nand_init+0x34>
     8e4:	e3a02003 	mov	r2, #3
     8e8:	e5832000 	str	r2, [r3]
     8ec:	ebffffeb 	bl	8a0 <nand_reset>
     8f0:	e24bd004 	sub	sp, fp, #4
     8f4:	e8bd4800 	pop	{fp, lr}
     8f8:	e12fff1e 	bx	lr
     8fc:	00001210 	andeq	r1, r0, r0, lsl r2
     900:	4e000004 	cdpmi	0, 0, cr0, cr0, cr4, {0}

00000904 <nand_PageRead>:
     904:	e92d4800 	push	{fp, lr}
     908:	e28db004 	add	fp, sp, #4
     90c:	e24dd010 	sub	sp, sp, #16
     910:	e50b0010 	str	r0, [fp, #-16]
     914:	e50b1014 	str	r1, [fp, #-20]
     918:	e3a03000 	mov	r3, #0
     91c:	e50b3008 	str	r3, [fp, #-8]
     920:	ebffff97 	bl	784 <select_chip>
     924:	ebffffac 	bl	7dc <clear_RnB>
     928:	e3a00000 	mov	r0, #0
     92c:	ebffffb7 	bl	810 <send_cmmd>
     930:	e3a00000 	mov	r0, #0
     934:	ebffffc1 	bl	840 <send_addr>
     938:	e3a00000 	mov	r0, #0
     93c:	ebffffbf 	bl	840 <send_addr>
     940:	e51b3010 	ldr	r3, [fp, #-16]
     944:	e20330ff 	and	r3, r3, #255	; 0xff
     948:	e1a00003 	mov	r0, r3
     94c:	ebffffbb 	bl	840 <send_addr>
     950:	e51b3010 	ldr	r3, [fp, #-16]
     954:	e1a03423 	lsr	r3, r3, #8
     958:	e20330ff 	and	r3, r3, #255	; 0xff
     95c:	e1a00003 	mov	r0, r3
     960:	ebffffb6 	bl	840 <send_addr>
     964:	e51b3010 	ldr	r3, [fp, #-16]
     968:	e1a03823 	lsr	r3, r3, #16
     96c:	e20330ff 	and	r3, r3, #255	; 0xff
     970:	e1a00003 	mov	r0, r3
     974:	ebffffb1 	bl	840 <send_addr>
     978:	e3a00030 	mov	r0, #48	; 0x30
     97c:	ebffffa3 	bl	810 <send_cmmd>
     980:	ebffffba 	bl	870 <wait_RnB>
     984:	e3a03000 	mov	r3, #0
     988:	e50b3008 	str	r3, [fp, #-8]
     98c:	ea000009 	b	9b8 <nand_PageRead+0xb4>
     990:	e51b3008 	ldr	r3, [fp, #-8]
     994:	e51b2014 	ldr	r2, [fp, #-20]
     998:	e0823003 	add	r3, r2, r3
     99c:	e59f2034 	ldr	r2, [pc, #52]	; 9d8 <nand_PageRead+0xd4>
     9a0:	e5d22000 	ldrb	r2, [r2]
     9a4:	e20220ff 	and	r2, r2, #255	; 0xff
     9a8:	e5c32000 	strb	r2, [r3]
     9ac:	e51b3008 	ldr	r3, [fp, #-8]
     9b0:	e2833001 	add	r3, r3, #1
     9b4:	e50b3008 	str	r3, [fp, #-8]
     9b8:	e51b2008 	ldr	r2, [fp, #-8]
     9bc:	e59f3018 	ldr	r3, [pc, #24]	; 9dc <nand_PageRead+0xd8>
     9c0:	e1520003 	cmp	r2, r3
     9c4:	dafffff1 	ble	990 <nand_PageRead+0x8c>
     9c8:	ebffff78 	bl	7b0 <diselect_chip>
     9cc:	e24bd004 	sub	sp, fp, #4
     9d0:	e8bd4800 	pop	{fp, lr}
     9d4:	e12fff1e 	bx	lr
     9d8:	4e000010 	mcrmi	0, 0, r0, cr0, cr0, {0}
     9dc:	000007ff 	strdeq	r0, [r0], -pc

000009e0 <nand_PageWrite>:
     9e0:	e92d4800 	push	{fp, lr}
     9e4:	e28db004 	add	fp, sp, #4
     9e8:	e24dd010 	sub	sp, sp, #16
     9ec:	e50b0010 	str	r0, [fp, #-16]
     9f0:	e50b1014 	str	r1, [fp, #-20]
     9f4:	e3a03000 	mov	r3, #0
     9f8:	e50b300c 	str	r3, [fp, #-12]
     9fc:	e3a03000 	mov	r3, #0
     a00:	e50b3008 	str	r3, [fp, #-8]
     a04:	ebffff5e 	bl	784 <select_chip>
     a08:	ebffff73 	bl	7dc <clear_RnB>
     a0c:	e3a00080 	mov	r0, #128	; 0x80
     a10:	ebffff7e 	bl	810 <send_cmmd>
     a14:	e3a00000 	mov	r0, #0
     a18:	ebffff88 	bl	840 <send_addr>
     a1c:	e3a00000 	mov	r0, #0
     a20:	ebffff86 	bl	840 <send_addr>
     a24:	e51b3010 	ldr	r3, [fp, #-16]
     a28:	e20330ff 	and	r3, r3, #255	; 0xff
     a2c:	e1a00003 	mov	r0, r3
     a30:	ebffff82 	bl	840 <send_addr>
     a34:	e51b3010 	ldr	r3, [fp, #-16]
     a38:	e1a03423 	lsr	r3, r3, #8
     a3c:	e20330ff 	and	r3, r3, #255	; 0xff
     a40:	e1a00003 	mov	r0, r3
     a44:	ebffff7d 	bl	840 <send_addr>
     a48:	e51b3010 	ldr	r3, [fp, #-16]
     a4c:	e1a03823 	lsr	r3, r3, #16
     a50:	e20330ff 	and	r3, r3, #255	; 0xff
     a54:	e1a00003 	mov	r0, r3
     a58:	ebffff78 	bl	840 <send_addr>
     a5c:	e3a03000 	mov	r3, #0
     a60:	e50b300c 	str	r3, [fp, #-12]
     a64:	ea000008 	b	a8c <nand_PageWrite+0xac>
     a68:	e59f3068 	ldr	r3, [pc, #104]	; ad8 <nand_PageWrite+0xf8>
     a6c:	e51b200c 	ldr	r2, [fp, #-12]
     a70:	e51b1014 	ldr	r1, [fp, #-20]
     a74:	e0812002 	add	r2, r1, r2
     a78:	e5d22000 	ldrb	r2, [r2]
     a7c:	e5c32000 	strb	r2, [r3]
     a80:	e51b300c 	ldr	r3, [fp, #-12]
     a84:	e2833001 	add	r3, r3, #1
     a88:	e50b300c 	str	r3, [fp, #-12]
     a8c:	e51b200c 	ldr	r2, [fp, #-12]
     a90:	e59f3044 	ldr	r3, [pc, #68]	; adc <nand_PageWrite+0xfc>
     a94:	e1520003 	cmp	r2, r3
     a98:	dafffff2 	ble	a68 <nand_PageWrite+0x88>
     a9c:	e3a00010 	mov	r0, #16
     aa0:	ebffff5a 	bl	810 <send_cmmd>
     aa4:	ebffff71 	bl	870 <wait_RnB>
     aa8:	e3a00070 	mov	r0, #112	; 0x70
     aac:	ebffff57 	bl	810 <send_cmmd>
     ab0:	e59f3020 	ldr	r3, [pc, #32]	; ad8 <nand_PageWrite+0xf8>
     ab4:	e5d33000 	ldrb	r3, [r3]
     ab8:	e20330ff 	and	r3, r3, #255	; 0xff
     abc:	e50b3008 	str	r3, [fp, #-8]
     ac0:	ebffff3a 	bl	7b0 <diselect_chip>
     ac4:	e51b3008 	ldr	r3, [fp, #-8]
     ac8:	e1a00003 	mov	r0, r3
     acc:	e24bd004 	sub	sp, fp, #4
     ad0:	e8bd4800 	pop	{fp, lr}
     ad4:	e12fff1e 	bx	lr
     ad8:	4e000010 	mcrmi	0, 0, r0, cr0, cr0, {0}
     adc:	000007ff 	strdeq	r0, [r0], -pc

00000ae0 <nand_to_ram>:
     ae0:	e92d4800 	push	{fp, lr}
     ae4:	e28db004 	add	fp, sp, #4
     ae8:	e24dd018 	sub	sp, sp, #24
     aec:	e50b0010 	str	r0, [fp, #-16]
     af0:	e50b1014 	str	r1, [fp, #-20]
     af4:	e50b2018 	str	r2, [fp, #-24]
     af8:	e3a03000 	mov	r3, #0
     afc:	e50b3008 	str	r3, [fp, #-8]
     b00:	e51b3010 	ldr	r3, [fp, #-16]
     b04:	e1a035a3 	lsr	r3, r3, #11
     b08:	e50b3008 	str	r3, [fp, #-8]
     b0c:	ea00000c 	b	b44 <nand_to_ram+0x64>
     b10:	e51b3008 	ldr	r3, [fp, #-8]
     b14:	e1a00003 	mov	r0, r3
     b18:	e51b1014 	ldr	r1, [fp, #-20]
     b1c:	ebffff78 	bl	904 <nand_PageRead>
     b20:	e51b3018 	ldr	r3, [fp, #-24]
     b24:	e2433b02 	sub	r3, r3, #2048	; 0x800
     b28:	e50b3018 	str	r3, [fp, #-24]
     b2c:	e51b3014 	ldr	r3, [fp, #-20]
     b30:	e2833b02 	add	r3, r3, #2048	; 0x800
     b34:	e50b3014 	str	r3, [fp, #-20]
     b38:	e51b3008 	ldr	r3, [fp, #-8]
     b3c:	e2833001 	add	r3, r3, #1
     b40:	e50b3008 	str	r3, [fp, #-8]
     b44:	e51b3018 	ldr	r3, [fp, #-24]
     b48:	e3530000 	cmp	r3, #0
     b4c:	caffffef 	bgt	b10 <nand_to_ram+0x30>
     b50:	e24bd004 	sub	sp, fp, #4
     b54:	e8bd4800 	pop	{fp, lr}
     b58:	e12fff1e 	bx	lr

00000b5c <nand_erase>:
     b5c:	e92d4800 	push	{fp, lr}
     b60:	e28db004 	add	fp, sp, #4
     b64:	e24dd010 	sub	sp, sp, #16
     b68:	e50b0010 	str	r0, [fp, #-16]
     b6c:	e3a03000 	mov	r3, #0
     b70:	e50b3008 	str	r3, [fp, #-8]
     b74:	ebffff02 	bl	784 <select_chip>
     b78:	ebffff17 	bl	7dc <clear_RnB>
     b7c:	e3a0003c 	mov	r0, #60	; 0x3c
     b80:	ebffff22 	bl	810 <send_cmmd>
     b84:	e51b3010 	ldr	r3, [fp, #-16]
     b88:	e20330ff 	and	r3, r3, #255	; 0xff
     b8c:	e1a00003 	mov	r0, r3
     b90:	ebffff2a 	bl	840 <send_addr>
     b94:	e51b3010 	ldr	r3, [fp, #-16]
     b98:	e1a03423 	lsr	r3, r3, #8
     b9c:	e20330ff 	and	r3, r3, #255	; 0xff
     ba0:	e1a00003 	mov	r0, r3
     ba4:	ebffff25 	bl	840 <send_addr>
     ba8:	e51b3010 	ldr	r3, [fp, #-16]
     bac:	e1a03823 	lsr	r3, r3, #16
     bb0:	e20330ff 	and	r3, r3, #255	; 0xff
     bb4:	e1a00003 	mov	r0, r3
     bb8:	ebffff20 	bl	840 <send_addr>
     bbc:	e3a000d0 	mov	r0, #208	; 0xd0
     bc0:	ebffff12 	bl	810 <send_cmmd>
     bc4:	ebffff29 	bl	870 <wait_RnB>
     bc8:	e3a00070 	mov	r0, #112	; 0x70
     bcc:	ebffff0f 	bl	810 <send_cmmd>
     bd0:	e59f3020 	ldr	r3, [pc, #32]	; bf8 <nand_erase+0x9c>
     bd4:	e5d33000 	ldrb	r3, [r3]
     bd8:	e20330ff 	and	r3, r3, #255	; 0xff
     bdc:	e50b3008 	str	r3, [fp, #-8]
     be0:	ebfffef2 	bl	7b0 <diselect_chip>
     be4:	e51b3008 	ldr	r3, [fp, #-8]
     be8:	e1a00003 	mov	r0, r3
     bec:	e24bd004 	sub	sp, fp, #4
     bf0:	e8bd4800 	pop	{fp, lr}
     bf4:	e12fff1e 	bx	lr
     bf8:	4e000010 	mcrmi	0, 0, r0, cr0, cr0, {0}

00000bfc <trap_init>:
     bfc:	e52db004 	push	{fp}		; (str fp, [sp, #-4]!)
     c00:	e28db000 	add	fp, sp, #0
     c04:	e28bd000 	add	sp, fp, #0
     c08:	e8bd0800 	pop	{fp}
     c0c:	e12fff1e 	bx	lr

00000c10 <uart0_init>:
     c10:	e52db004 	push	{fp}		; (str fp, [sp, #-4]!)
     c14:	e28db000 	add	fp, sp, #0
     c18:	e59f3060 	ldr	r3, [pc, #96]	; c80 <uart0_init+0x70>
     c1c:	e59f205c 	ldr	r2, [pc, #92]	; c80 <uart0_init+0x70>
     c20:	e5922000 	ldr	r2, [r2]
     c24:	e38220a0 	orr	r2, r2, #160	; 0xa0
     c28:	e5832000 	str	r2, [r3]
     c2c:	e59f3050 	ldr	r3, [pc, #80]	; c84 <uart0_init+0x74>
     c30:	e3a0200c 	mov	r2, #12
     c34:	e5832000 	str	r2, [r3]
     c38:	e3a03205 	mov	r3, #1342177280	; 0x50000000
     c3c:	e3a02003 	mov	r2, #3
     c40:	e5832000 	str	r2, [r3]
     c44:	e3a03245 	mov	r3, #1342177284	; 0x50000004
     c48:	e3a02005 	mov	r2, #5
     c4c:	e5832000 	str	r2, [r3]
     c50:	e3a03285 	mov	r3, #1342177288	; 0x50000008
     c54:	e3a02000 	mov	r2, #0
     c58:	e5832000 	str	r2, [r3]
     c5c:	e3a032c5 	mov	r3, #1342177292	; 0x5000000c
     c60:	e3a02000 	mov	r2, #0
     c64:	e5832000 	str	r2, [r3]
     c68:	e59f3018 	ldr	r3, [pc, #24]	; c88 <uart0_init+0x78>
     c6c:	e3a0201a 	mov	r2, #26
     c70:	e5832000 	str	r2, [r3]
     c74:	e28bd000 	add	sp, fp, #0
     c78:	e8bd0800 	pop	{fp}
     c7c:	e12fff1e 	bx	lr
     c80:	56000070 	undefined instruction 0x56000070
     c84:	56000078 	undefined instruction 0x56000078
     c88:	50000028 	andpl	r0, r0, r8, lsr #32

00000c8c <putc>:
     c8c:	e52db004 	push	{fp}		; (str fp, [sp, #-4]!)
     c90:	e28db000 	add	fp, sp, #0
     c94:	e24dd00c 	sub	sp, sp, #12
     c98:	e1a03000 	mov	r3, r0
     c9c:	e54b3005 	strb	r3, [fp, #-5]
     ca0:	e59f3024 	ldr	r3, [pc, #36]	; ccc <putc+0x40>
     ca4:	e5933000 	ldr	r3, [r3]
     ca8:	e2033004 	and	r3, r3, #4
     cac:	e3530000 	cmp	r3, #0
     cb0:	0afffffa 	beq	ca0 <putc+0x14>
     cb4:	e59f3014 	ldr	r3, [pc, #20]	; cd0 <putc+0x44>
     cb8:	e55b2005 	ldrb	r2, [fp, #-5]
     cbc:	e5c32000 	strb	r2, [r3]
     cc0:	e28bd000 	add	sp, fp, #0
     cc4:	e8bd0800 	pop	{fp}
     cc8:	e12fff1e 	bx	lr
     ccc:	50000010 	andpl	r0, r0, r0, lsl r0
     cd0:	50000020 	andpl	r0, r0, r0, lsr #32

00000cd4 <getc>:
     cd4:	e52db004 	push	{fp}		; (str fp, [sp, #-4]!)
     cd8:	e28db000 	add	fp, sp, #0
     cdc:	e59f3028 	ldr	r3, [pc, #40]	; d0c <getc+0x38>
     ce0:	e5933000 	ldr	r3, [r3]
     ce4:	e2033001 	and	r3, r3, #1
     ce8:	e3530000 	cmp	r3, #0
     cec:	0afffffa 	beq	cdc <getc+0x8>
     cf0:	e59f3018 	ldr	r3, [pc, #24]	; d10 <getc+0x3c>
     cf4:	e5d33000 	ldrb	r3, [r3]
     cf8:	e20330ff 	and	r3, r3, #255	; 0xff
     cfc:	e1a00003 	mov	r0, r3
     d00:	e28bd000 	add	sp, fp, #0
     d04:	e8bd0800 	pop	{fp}
     d08:	e12fff1e 	bx	lr
     d0c:	50000010 	andpl	r0, r0, r0, lsl r0
     d10:	50000024 	andpl	r0, r0, r4, lsr #32

00000d14 <uputs>:
     d14:	e92d4800 	push	{fp, lr}
     d18:	e28db004 	add	fp, sp, #4
     d1c:	e24dd008 	sub	sp, sp, #8
     d20:	e50b0008 	str	r0, [fp, #-8]
     d24:	ea000006 	b	d44 <uputs+0x30>
     d28:	e51b3008 	ldr	r3, [fp, #-8]
     d2c:	e5d33000 	ldrb	r3, [r3]
     d30:	e1a00003 	mov	r0, r3
     d34:	ebffffd4 	bl	c8c <putc>
     d38:	e51b3008 	ldr	r3, [fp, #-8]
     d3c:	e2833001 	add	r3, r3, #1
     d40:	e50b3008 	str	r3, [fp, #-8]
     d44:	e51b3008 	ldr	r3, [fp, #-8]
     d48:	e5d33000 	ldrb	r3, [r3]
     d4c:	e3530000 	cmp	r3, #0
     d50:	1afffff4 	bne	d28 <uputs+0x14>
     d54:	e24bd004 	sub	sp, fp, #4
     d58:	e8bd4800 	pop	{fp, lr}
     d5c:	e12fff1e 	bx	lr

00000d60 <ugets>:
     d60:	e92d4800 	push	{fp, lr}
     d64:	e28db004 	add	fp, sp, #4
     d68:	e24dd010 	sub	sp, sp, #16
     d6c:	e50b0010 	str	r0, [fp, #-16]
     d70:	e51b3010 	ldr	r3, [fp, #-16]
     d74:	e50b300c 	str	r3, [fp, #-12]
     d78:	ea000009 	b	da4 <ugets+0x44>
     d7c:	e51b3010 	ldr	r3, [fp, #-16]
     d80:	e55b2005 	ldrb	r2, [fp, #-5]
     d84:	e5c32000 	strb	r2, [r3]
     d88:	e51b3010 	ldr	r3, [fp, #-16]
     d8c:	e5d33000 	ldrb	r3, [r3]
     d90:	e1a00003 	mov	r0, r3
     d94:	ebffffbc 	bl	c8c <putc>
     d98:	e51b3010 	ldr	r3, [fp, #-16]
     d9c:	e2833001 	add	r3, r3, #1
     da0:	e50b3010 	str	r3, [fp, #-16]
     da4:	ebffffca 	bl	cd4 <getc>
     da8:	e1a03000 	mov	r3, r0
     dac:	e54b3005 	strb	r3, [fp, #-5]
     db0:	e55b3005 	ldrb	r3, [fp, #-5]
     db4:	e353000d 	cmp	r3, #13
     db8:	1affffef 	bne	d7c <ugets+0x1c>
     dbc:	e51b3010 	ldr	r3, [fp, #-16]
     dc0:	e3a02000 	mov	r2, #0
     dc4:	e5c32000 	strb	r2, [r3]
     dc8:	e3a0000d 	mov	r0, #13
     dcc:	ebffffae 	bl	c8c <putc>
     dd0:	e3a0000a 	mov	r0, #10
     dd4:	ebffffac 	bl	c8c <putc>
     dd8:	e51b300c 	ldr	r3, [fp, #-12]
     ddc:	e1a00003 	mov	r0, r3
     de0:	e24bd004 	sub	sp, fp, #4
     de4:	e8bd4800 	pop	{fp, lr}
     de8:	e12fff1e 	bx	lr

00000dec <itoa>:
     dec:	e92d4800 	push	{fp, lr}
     df0:	e28db004 	add	fp, sp, #4
     df4:	e24dd010 	sub	sp, sp, #16
     df8:	e50b0010 	str	r0, [fp, #-16]
     dfc:	e50b1014 	str	r1, [fp, #-20]
     e00:	e51b3010 	ldr	r3, [fp, #-16]
     e04:	e3530009 	cmp	r3, #9
     e08:	ca00000a 	bgt	e38 <itoa+0x4c>
     e0c:	e51b3010 	ldr	r3, [fp, #-16]
     e10:	e20330ff 	and	r3, r3, #255	; 0xff
     e14:	e2833030 	add	r3, r3, #48	; 0x30
     e18:	e20320ff 	and	r2, r3, #255	; 0xff
     e1c:	e51b3014 	ldr	r3, [fp, #-20]
     e20:	e5c32000 	strb	r2, [r3]
     e24:	e51b3014 	ldr	r3, [fp, #-20]
     e28:	e2833001 	add	r3, r3, #1
     e2c:	e3a02000 	mov	r2, #0
     e30:	e5c32000 	strb	r2, [r3]
     e34:	ea00002c 	b	eec <itoa+0x100>
     e38:	e51b3010 	ldr	r3, [fp, #-16]
     e3c:	e59f10b4 	ldr	r1, [pc, #180]	; ef8 <itoa+0x10c>
     e40:	e0c20391 	smull	r0, r2, r1, r3
     e44:	e1a02142 	asr	r2, r2, #2
     e48:	e1a03fc3 	asr	r3, r3, #31
     e4c:	e0633002 	rsb	r3, r3, r2
     e50:	e1a00003 	mov	r0, r3
     e54:	e51b1014 	ldr	r1, [fp, #-20]
     e58:	ebffffe3 	bl	dec <itoa>
     e5c:	e3a03000 	mov	r3, #0
     e60:	e50b3008 	str	r3, [fp, #-8]
     e64:	ea000002 	b	e74 <itoa+0x88>
     e68:	e51b3008 	ldr	r3, [fp, #-8]
     e6c:	e2833001 	add	r3, r3, #1
     e70:	e50b3008 	str	r3, [fp, #-8]
     e74:	e51b3008 	ldr	r3, [fp, #-8]
     e78:	e51b2014 	ldr	r2, [fp, #-20]
     e7c:	e0823003 	add	r3, r2, r3
     e80:	e5d33000 	ldrb	r3, [r3]
     e84:	e3530000 	cmp	r3, #0
     e88:	1afffff6 	bne	e68 <itoa+0x7c>
     e8c:	e51b3008 	ldr	r3, [fp, #-8]
     e90:	e51b2014 	ldr	r2, [fp, #-20]
     e94:	e0820003 	add	r0, r2, r3
     e98:	e51b1010 	ldr	r1, [fp, #-16]
     e9c:	e59f2054 	ldr	r2, [pc, #84]	; ef8 <itoa+0x10c>
     ea0:	e0c3c192 	smull	ip, r3, r2, r1
     ea4:	e1a02143 	asr	r2, r3, #2
     ea8:	e1a03fc1 	asr	r3, r1, #31
     eac:	e0632002 	rsb	r2, r3, r2
     eb0:	e1a03002 	mov	r3, r2
     eb4:	e1a03103 	lsl	r3, r3, #2
     eb8:	e0833002 	add	r3, r3, r2
     ebc:	e1a03083 	lsl	r3, r3, #1
     ec0:	e0632001 	rsb	r2, r3, r1
     ec4:	e20230ff 	and	r3, r2, #255	; 0xff
     ec8:	e2833030 	add	r3, r3, #48	; 0x30
     ecc:	e20330ff 	and	r3, r3, #255	; 0xff
     ed0:	e5c03000 	strb	r3, [r0]
     ed4:	e51b3008 	ldr	r3, [fp, #-8]
     ed8:	e2833001 	add	r3, r3, #1
     edc:	e51b2014 	ldr	r2, [fp, #-20]
     ee0:	e0823003 	add	r3, r2, r3
     ee4:	e3a02000 	mov	r2, #0
     ee8:	e5c32000 	strb	r2, [r3]
     eec:	e24bd004 	sub	sp, fp, #4
     ef0:	e8bd4800 	pop	{fp, lr}
     ef4:	e12fff1e 	bx	lr
     ef8:	66666667 	strbtvs	r6, [r6], -r7, ror #12

00000efc <xtoa>:
     efc:	e92d4800 	push	{fp, lr}
     f00:	e28db004 	add	fp, sp, #4
     f04:	e24dd010 	sub	sp, sp, #16
     f08:	e50b0010 	str	r0, [fp, #-16]
     f0c:	e50b1014 	str	r1, [fp, #-20]
     f10:	e51b3010 	ldr	r3, [fp, #-16]
     f14:	e353000f 	cmp	r3, #15
     f18:	ca000014 	bgt	f70 <xtoa+0x74>
     f1c:	e51b3010 	ldr	r3, [fp, #-16]
     f20:	e3530009 	cmp	r3, #9
     f24:	ca000006 	bgt	f44 <xtoa+0x48>
     f28:	e51b3010 	ldr	r3, [fp, #-16]
     f2c:	e20330ff 	and	r3, r3, #255	; 0xff
     f30:	e2833030 	add	r3, r3, #48	; 0x30
     f34:	e20320ff 	and	r2, r3, #255	; 0xff
     f38:	e51b3014 	ldr	r3, [fp, #-20]
     f3c:	e5c32000 	strb	r2, [r3]
     f40:	ea000005 	b	f5c <xtoa+0x60>
     f44:	e51b3010 	ldr	r3, [fp, #-16]
     f48:	e20330ff 	and	r3, r3, #255	; 0xff
     f4c:	e2833057 	add	r3, r3, #87	; 0x57
     f50:	e20320ff 	and	r2, r3, #255	; 0xff
     f54:	e51b3014 	ldr	r3, [fp, #-20]
     f58:	e5c32000 	strb	r2, [r3]
     f5c:	e51b3014 	ldr	r3, [fp, #-20]
     f60:	e2833001 	add	r3, r3, #1
     f64:	e3a02000 	mov	r2, #0
     f68:	e5c32000 	strb	r2, [r3]
     f6c:	ea00003c 	b	1064 <xtoa+0x168>
     f70:	e51b3010 	ldr	r3, [fp, #-16]
     f74:	e283200f 	add	r2, r3, #15
     f78:	e3530000 	cmp	r3, #0
     f7c:	b1a03002 	movlt	r3, r2
     f80:	e1a03243 	asr	r3, r3, #4
     f84:	e1a00003 	mov	r0, r3
     f88:	e51b1014 	ldr	r1, [fp, #-20]
     f8c:	ebffffda 	bl	efc <xtoa>
     f90:	e3a03000 	mov	r3, #0
     f94:	e50b3008 	str	r3, [fp, #-8]
     f98:	ea000002 	b	fa8 <xtoa+0xac>
     f9c:	e51b3008 	ldr	r3, [fp, #-8]
     fa0:	e2833001 	add	r3, r3, #1
     fa4:	e50b3008 	str	r3, [fp, #-8]
     fa8:	e51b3008 	ldr	r3, [fp, #-8]
     fac:	e51b2014 	ldr	r2, [fp, #-20]
     fb0:	e0823003 	add	r3, r2, r3
     fb4:	e5d33000 	ldrb	r3, [r3]
     fb8:	e3530000 	cmp	r3, #0
     fbc:	1afffff6 	bne	f9c <xtoa+0xa0>
     fc0:	e51b2010 	ldr	r2, [fp, #-16]
     fc4:	e1a03fc2 	asr	r3, r2, #31
     fc8:	e1a03e23 	lsr	r3, r3, #28
     fcc:	e0822003 	add	r2, r2, r3
     fd0:	e202200f 	and	r2, r2, #15
     fd4:	e0633002 	rsb	r3, r3, r2
     fd8:	e3530009 	cmp	r3, #9
     fdc:	ca00000d 	bgt	1018 <xtoa+0x11c>
     fe0:	e51b3008 	ldr	r3, [fp, #-8]
     fe4:	e51b2014 	ldr	r2, [fp, #-20]
     fe8:	e0821003 	add	r1, r2, r3
     fec:	e51b2010 	ldr	r2, [fp, #-16]
     ff0:	e1a03fc2 	asr	r3, r2, #31
     ff4:	e1a03e23 	lsr	r3, r3, #28
     ff8:	e0822003 	add	r2, r2, r3
     ffc:	e202200f 	and	r2, r2, #15
    1000:	e0633002 	rsb	r3, r3, r2
    1004:	e20330ff 	and	r3, r3, #255	; 0xff
    1008:	e2833030 	add	r3, r3, #48	; 0x30
    100c:	e20330ff 	and	r3, r3, #255	; 0xff
    1010:	e5c13000 	strb	r3, [r1]
    1014:	ea00000c 	b	104c <xtoa+0x150>
    1018:	e51b3008 	ldr	r3, [fp, #-8]
    101c:	e51b2014 	ldr	r2, [fp, #-20]
    1020:	e0821003 	add	r1, r2, r3
    1024:	e51b2010 	ldr	r2, [fp, #-16]
    1028:	e1a03fc2 	asr	r3, r2, #31
    102c:	e1a03e23 	lsr	r3, r3, #28
    1030:	e0822003 	add	r2, r2, r3
    1034:	e202200f 	and	r2, r2, #15
    1038:	e0633002 	rsb	r3, r3, r2
    103c:	e20330ff 	and	r3, r3, #255	; 0xff
    1040:	e2833057 	add	r3, r3, #87	; 0x57
    1044:	e20330ff 	and	r3, r3, #255	; 0xff
    1048:	e5c13000 	strb	r3, [r1]
    104c:	e51b3008 	ldr	r3, [fp, #-8]
    1050:	e2833001 	add	r3, r3, #1
    1054:	e51b2014 	ldr	r2, [fp, #-20]
    1058:	e0823003 	add	r3, r2, r3
    105c:	e3a02000 	mov	r2, #0
    1060:	e5c32000 	strb	r2, [r3]
    1064:	e24bd004 	sub	sp, fp, #4
    1068:	e8bd4800 	pop	{fp, lr}
    106c:	e12fff1e 	bx	lr

00001070 <uprintf>:
    1070:	e92d000f 	push	{r0, r1, r2, r3}
    1074:	e92d4800 	push	{fp, lr}
    1078:	e28db004 	add	fp, sp, #4
    107c:	e24dd030 	sub	sp, sp, #48	; 0x30
    1080:	e28b3008 	add	r3, fp, #8
    1084:	e50b3014 	str	r3, [fp, #-20]
    1088:	ea000065 	b	1224 <uprintf+0x1b4>
    108c:	e59b3004 	ldr	r3, [fp, #4]
    1090:	e5d33000 	ldrb	r3, [r3]
    1094:	e3530025 	cmp	r3, #37	; 0x25
    1098:	1a000052 	bne	11e8 <uprintf+0x178>
    109c:	e59b3004 	ldr	r3, [fp, #4]
    10a0:	e2833001 	add	r3, r3, #1
    10a4:	e58b3004 	str	r3, [fp, #4]
    10a8:	e59b3004 	ldr	r3, [fp, #4]
    10ac:	e5d33000 	ldrb	r3, [r3]
    10b0:	e2433063 	sub	r3, r3, #99	; 0x63
    10b4:	e3530015 	cmp	r3, #21
    10b8:	979ff103 	ldrls	pc, [pc, r3, lsl #2]
    10bc:	ea000054 	b	1214 <uprintf+0x1a4>
    10c0:	00001118 	andeq	r1, r0, r8, lsl r1
    10c4:	0000115c 	andeq	r1, r0, ip, asr r1
    10c8:	00001214 	andeq	r1, r0, r4, lsl r2
    10cc:	00001214 	andeq	r1, r0, r4, lsl r2
    10d0:	00001214 	andeq	r1, r0, r4, lsl r2
    10d4:	00001214 	andeq	r1, r0, r4, lsl r2
    10d8:	00001214 	andeq	r1, r0, r4, lsl r2
    10dc:	00001214 	andeq	r1, r0, r4, lsl r2
    10e0:	00001214 	andeq	r1, r0, r4, lsl r2
    10e4:	00001214 	andeq	r1, r0, r4, lsl r2
    10e8:	00001214 	andeq	r1, r0, r4, lsl r2
    10ec:	00001214 	andeq	r1, r0, r4, lsl r2
    10f0:	00001214 	andeq	r1, r0, r4, lsl r2
    10f4:	00001214 	andeq	r1, r0, r4, lsl r2
    10f8:	00001214 	andeq	r1, r0, r4, lsl r2
    10fc:	00001214 	andeq	r1, r0, r4, lsl r2
    1100:	0000113c 	andeq	r1, r0, ip, lsr r1
    1104:	00001214 	andeq	r1, r0, r4, lsl r2
    1108:	00001214 	andeq	r1, r0, r4, lsl r2
    110c:	00001214 	andeq	r1, r0, r4, lsl r2
    1110:	00001214 	andeq	r1, r0, r4, lsl r2
    1114:	000011b4 	undefined instruction 0x000011b4
    1118:	e51b3014 	ldr	r3, [fp, #-20]
    111c:	e2832004 	add	r2, r3, #4
    1120:	e50b2014 	str	r2, [fp, #-20]
    1124:	e5933000 	ldr	r3, [r3]
    1128:	e54b300d 	strb	r3, [fp, #-13]
    112c:	e55b300d 	ldrb	r3, [fp, #-13]
    1130:	e1a00003 	mov	r0, r3
    1134:	ebfffed4 	bl	c8c <putc>
    1138:	ea000036 	b	1218 <uprintf+0x1a8>
    113c:	e51b3014 	ldr	r3, [fp, #-20]
    1140:	e2832004 	add	r2, r3, #4
    1144:	e50b2014 	str	r2, [fp, #-20]
    1148:	e5933000 	ldr	r3, [r3]
    114c:	e50b3008 	str	r3, [fp, #-8]
    1150:	e51b0008 	ldr	r0, [fp, #-8]
    1154:	ebfffeee 	bl	d14 <uputs>
    1158:	ea00002e 	b	1218 <uprintf+0x1a8>
    115c:	e51b3014 	ldr	r3, [fp, #-20]
    1160:	e2832004 	add	r2, r3, #4
    1164:	e50b2014 	str	r2, [fp, #-20]
    1168:	e5933000 	ldr	r3, [r3]
    116c:	e50b300c 	str	r3, [fp, #-12]
    1170:	e51b300c 	ldr	r3, [fp, #-12]
    1174:	e3530000 	cmp	r3, #0
    1178:	aa000004 	bge	1190 <uprintf+0x120>
    117c:	e3a0002d 	mov	r0, #45	; 0x2d
    1180:	ebfffec1 	bl	c8c <putc>
    1184:	e51b300c 	ldr	r3, [fp, #-12]
    1188:	e2633000 	rsb	r3, r3, #0
    118c:	e50b300c 	str	r3, [fp, #-12]
    1190:	e24b3034 	sub	r3, fp, #52	; 0x34
    1194:	e51b000c 	ldr	r0, [fp, #-12]
    1198:	e1a01003 	mov	r1, r3
    119c:	ebffff12 	bl	dec <itoa>
    11a0:	e24b3034 	sub	r3, fp, #52	; 0x34
    11a4:	e1a00003 	mov	r0, r3
    11a8:	ebfffed9 	bl	d14 <uputs>
    11ac:	e1a00000 	nop			; (mov r0, r0)
    11b0:	ea000018 	b	1218 <uprintf+0x1a8>
    11b4:	e51b3014 	ldr	r3, [fp, #-20]
    11b8:	e2832004 	add	r2, r3, #4
    11bc:	e50b2014 	str	r2, [fp, #-20]
    11c0:	e5933000 	ldr	r3, [r3]
    11c4:	e50b300c 	str	r3, [fp, #-12]
    11c8:	e24b3034 	sub	r3, fp, #52	; 0x34
    11cc:	e51b000c 	ldr	r0, [fp, #-12]
    11d0:	e1a01003 	mov	r1, r3
    11d4:	ebffff48 	bl	efc <xtoa>
    11d8:	e24b3034 	sub	r3, fp, #52	; 0x34
    11dc:	e1a00003 	mov	r0, r3
    11e0:	ebfffecb 	bl	d14 <uputs>
    11e4:	ea00000b 	b	1218 <uprintf+0x1a8>
    11e8:	e59b3004 	ldr	r3, [fp, #4]
    11ec:	e5d33000 	ldrb	r3, [r3]
    11f0:	e1a00003 	mov	r0, r3
    11f4:	ebfffea4 	bl	c8c <putc>
    11f8:	e59b3004 	ldr	r3, [fp, #4]
    11fc:	e5d33000 	ldrb	r3, [r3]
    1200:	e353000a 	cmp	r3, #10
    1204:	1a000003 	bne	1218 <uprintf+0x1a8>
    1208:	e3a0000d 	mov	r0, #13
    120c:	ebfffe9e 	bl	c8c <putc>
    1210:	ea000000 	b	1218 <uprintf+0x1a8>
    1214:	e1a00000 	nop			; (mov r0, r0)
    1218:	e59b3004 	ldr	r3, [fp, #4]
    121c:	e2833001 	add	r3, r3, #1
    1220:	e58b3004 	str	r3, [fp, #4]
    1224:	e59b3004 	ldr	r3, [fp, #4]
    1228:	e5d33000 	ldrb	r3, [r3]
    122c:	e3530000 	cmp	r3, #0
    1230:	1affff95 	bne	108c <uprintf+0x1c>
    1234:	e3a03000 	mov	r3, #0
    1238:	e1a00003 	mov	r0, r3
    123c:	e24bd004 	sub	sp, fp, #4
    1240:	e8bd4800 	pop	{fp, lr}
    1244:	e28dd010 	add	sp, sp, #16
    1248:	e12fff1e 	bx	lr

0000124c <create_kernel_table>:
    124c:	e52db004 	push	{fp}		; (str fp, [sp, #-4]!)
    1250:	e28db000 	add	fp, sp, #0
    1254:	e24dd014 	sub	sp, sp, #20
    1258:	e50b0010 	str	r0, [fp, #-16]
    125c:	e3a03206 	mov	r3, #1610612736	; 0x60000000
    1260:	e50b3008 	str	r3, [fp, #-8]
    1264:	e59f3038 	ldr	r3, [pc, #56]	; 12a4 <create_kernel_table+0x58>
    1268:	e50b300c 	str	r3, [fp, #-12]
    126c:	e51b3010 	ldr	r3, [fp, #-16]
    1270:	e1a03a23 	lsr	r3, r3, #20
    1274:	e1a03103 	lsl	r3, r3, #2
    1278:	e51b2008 	ldr	r2, [fp, #-8]
    127c:	e0822003 	add	r2, r2, r3
    1280:	e51b300c 	ldr	r3, [fp, #-12]
    1284:	e1a03a23 	lsr	r3, r3, #20
    1288:	e1a03a03 	lsl	r3, r3, #20
    128c:	e3833ec1 	orr	r3, r3, #3088	; 0xc10
    1290:	e383300e 	orr	r3, r3, #14
    1294:	e5823000 	str	r3, [r2]
    1298:	e28bd000 	add	sp, fp, #0
    129c:	e8bd0800 	pop	{fp}
    12a0:	e12fff1e 	bx	lr
    12a4:	30008000 	andcc	r8, r0, r0

000012a8 <load_app>:
    12a8:	e52db004 	push	{fp}		; (str fp, [sp, #-4]!)
    12ac:	e28db000 	add	fp, sp, #0
    12b0:	e24dd00c 	sub	sp, sp, #12
    12b4:	e50b0008 	str	r0, [fp, #-8]
    12b8:	e28bd000 	add	sp, fp, #0
    12bc:	e8bd0800 	pop	{fp}
    12c0:	e12fff1e 	bx	lr

000012c4 <create_app_table>:
    12c4:	e92d4800 	push	{fp, lr}
    12c8:	e28db004 	add	fp, sp, #4
    12cc:	e24dd018 	sub	sp, sp, #24
    12d0:	e50b0018 	str	r0, [fp, #-24]
    12d4:	e3a03206 	mov	r3, #1610612736	; 0x60000000
    12d8:	e50b3008 	str	r3, [fp, #-8]
    12dc:	e51b3018 	ldr	r3, [fp, #-24]
    12e0:	e3530001 	cmp	r3, #1
    12e4:	1a000003 	bne	12f8 <create_app_table+0x34>
    12e8:	eb000407 	bl	230c <app1>
    12ec:	e1a03000 	mov	r3, r0
    12f0:	e50b300c 	str	r3, [fp, #-12]
    12f4:	ea000002 	b	1304 <create_app_table+0x40>
    12f8:	eb00040b 	bl	232c <app2>
    12fc:	e1a03000 	mov	r3, r0
    1300:	e50b300c 	str	r3, [fp, #-12]
    1304:	e59f302c 	ldr	r3, [pc, #44]	; 1338 <create_app_table+0x74>
    1308:	e50b3010 	str	r3, [fp, #-16]
    130c:	e51b3008 	ldr	r3, [fp, #-8]
    1310:	e283200c 	add	r2, r3, #12
    1314:	e51b3010 	ldr	r3, [fp, #-16]
    1318:	e1a03a23 	lsr	r3, r3, #20
    131c:	e1a03a03 	lsl	r3, r3, #20
    1320:	e3833ec1 	orr	r3, r3, #3088	; 0xc10
    1324:	e383300e 	orr	r3, r3, #14
    1328:	e5823000 	str	r3, [r2]
    132c:	e24bd004 	sub	sp, fp, #4
    1330:	e8bd4800 	pop	{fp, lr}
    1334:	e12fff1e 	bx	lr
    1338:	3000a380 	andcc	sl, r0, r0, lsl #7

0000133c <run_pid>:
    133c:	e92d4800 	push	{fp, lr}
    1340:	e28db004 	add	fp, sp, #4
    1344:	e24dd008 	sub	sp, sp, #8
    1348:	e50b0008 	str	r0, [fp, #-8]
    134c:	e51b3008 	ldr	r3, [fp, #-8]
    1350:	e1a03c83 	lsl	r3, r3, #25
    1354:	e1a00003 	mov	r0, r3
    1358:	ebffffbb 	bl	124c <create_kernel_table>
    135c:	e51b0008 	ldr	r0, [fp, #-8]
    1360:	ebffffd7 	bl	12c4 <create_app_table>
    1364:	e51b3008 	ldr	r3, [fp, #-8]
    1368:	e1a00003 	mov	r0, r3
    136c:	ee0d0f10 	mcr	15, 0, r0, cr13, cr0, {0}
    1370:	e51b3008 	ldr	r3, [fp, #-8]
    1374:	eb0003f4 	bl	234c <_ld_start>
    1378:	e24bd004 	sub	sp, fp, #4
    137c:	e8bd4800 	pop	{fp, lr}
    1380:	e12fff1e 	bx	lr

00001384 <sched_init>:
    1384:	e92d4800 	push	{fp, lr}
    1388:	e28db004 	add	fp, sp, #4
    138c:	e3a00001 	mov	r0, #1
    1390:	ebffffe9 	bl	133c <run_pid>
    1394:	e3a00001 	mov	r0, #1
    1398:	eb000041 	bl	14a4 <delay>
    139c:	e3a00002 	mov	r0, #2
    13a0:	ebffffe5 	bl	133c <run_pid>
    13a4:	eafffff8 	b	138c <sched_init+0x8>

000013a8 <beep_init>:
    13a8:	e52db004 	push	{fp}		; (str fp, [sp, #-4]!)
    13ac:	e28db000 	add	fp, sp, #0
    13b0:	e59f302c 	ldr	r3, [pc, #44]	; 13e4 <beep_init+0x3c>
    13b4:	e59f2028 	ldr	r2, [pc, #40]	; 13e4 <beep_init+0x3c>
    13b8:	e5922000 	ldr	r2, [r2]
    13bc:	e3c22003 	bic	r2, r2, #3
    13c0:	e5832000 	str	r2, [r3]
    13c4:	e59f3018 	ldr	r3, [pc, #24]	; 13e4 <beep_init+0x3c>
    13c8:	e59f2014 	ldr	r2, [pc, #20]	; 13e4 <beep_init+0x3c>
    13cc:	e5922000 	ldr	r2, [r2]
    13d0:	e3822001 	orr	r2, r2, #1
    13d4:	e5832000 	str	r2, [r3]
    13d8:	e28bd000 	add	sp, fp, #0
    13dc:	e8bd0800 	pop	{fp}
    13e0:	e12fff1e 	bx	lr
    13e4:	56000010 	undefined instruction 0x56000010

000013e8 <beep_run>:
    13e8:	e52db004 	push	{fp}		; (str fp, [sp, #-4]!)
    13ec:	e28db000 	add	fp, sp, #0
    13f0:	e59f302c 	ldr	r3, [pc, #44]	; 1424 <beep_run+0x3c>
    13f4:	e59f2028 	ldr	r2, [pc, #40]	; 1424 <beep_run+0x3c>
    13f8:	e5922000 	ldr	r2, [r2]
    13fc:	e3822001 	orr	r2, r2, #1
    1400:	e5832000 	str	r2, [r3]
    1404:	e59f3018 	ldr	r3, [pc, #24]	; 1424 <beep_run+0x3c>
    1408:	e5933000 	ldr	r3, [r3]
    140c:	e59f3010 	ldr	r3, [pc, #16]	; 1424 <beep_run+0x3c>
    1410:	e3a02000 	mov	r2, #0
    1414:	e5832000 	str	r2, [r3]
    1418:	e28bd000 	add	sp, fp, #0
    141c:	e8bd0800 	pop	{fp}
    1420:	e12fff1e 	bx	lr
    1424:	56000014 	undefined instruction 0x56000014

00001428 <led_init>:
    1428:	e52db004 	push	{fp}		; (str fp, [sp, #-4]!)
    142c:	e28db000 	add	fp, sp, #0
    1430:	e59f301c 	ldr	r3, [pc, #28]	; 1454 <led_init+0x2c>
    1434:	e3a02b55 	mov	r2, #87040	; 0x15400
    1438:	e5832000 	str	r2, [r3]
    143c:	e59f3014 	ldr	r3, [pc, #20]	; 1458 <led_init+0x30>
    1440:	e3e02000 	mvn	r2, #0
    1444:	e5832000 	str	r2, [r3]
    1448:	e28bd000 	add	sp, fp, #0
    144c:	e8bd0800 	pop	{fp}
    1450:	e12fff1e 	bx	lr
    1454:	56000010 	undefined instruction 0x56000010
    1458:	56000014 	undefined instruction 0x56000014

0000145c <led_on>:
    145c:	e52db004 	push	{fp}		; (str fp, [sp, #-4]!)
    1460:	e28db000 	add	fp, sp, #0
    1464:	e59f3010 	ldr	r3, [pc, #16]	; 147c <led_on+0x20>
    1468:	e3a02d05 	mov	r2, #320	; 0x140
    146c:	e5832000 	str	r2, [r3]
    1470:	e28bd000 	add	sp, fp, #0
    1474:	e8bd0800 	pop	{fp}
    1478:	e12fff1e 	bx	lr
    147c:	56000014 	undefined instruction 0x56000014

00001480 <led_off>:
    1480:	e52db004 	push	{fp}		; (str fp, [sp, #-4]!)
    1484:	e28db000 	add	fp, sp, #0
    1488:	e59f3010 	ldr	r3, [pc, #16]	; 14a0 <led_off+0x20>
    148c:	e3e02000 	mvn	r2, #0
    1490:	e5832000 	str	r2, [r3]
    1494:	e28bd000 	add	sp, fp, #0
    1498:	e8bd0800 	pop	{fp}
    149c:	e12fff1e 	bx	lr
    14a0:	56000014 	undefined instruction 0x56000014

000014a4 <delay>:
    14a4:	e52db004 	push	{fp}		; (str fp, [sp, #-4]!)
    14a8:	e28db000 	add	fp, sp, #0
    14ac:	e24dd014 	sub	sp, sp, #20
    14b0:	e50b0010 	str	r0, [fp, #-16]
    14b4:	e3a03000 	mov	r3, #0
    14b8:	e50b300c 	str	r3, [fp, #-12]
    14bc:	ea00000c 	b	14f4 <delay+0x50>
    14c0:	e3a03000 	mov	r3, #0
    14c4:	e50b3008 	str	r3, [fp, #-8]
    14c8:	ea000002 	b	14d8 <delay+0x34>
    14cc:	e51b3008 	ldr	r3, [fp, #-8]
    14d0:	e2833001 	add	r3, r3, #1
    14d4:	e50b3008 	str	r3, [fp, #-8]
    14d8:	e51b2008 	ldr	r2, [fp, #-8]
    14dc:	e59f302c 	ldr	r3, [pc, #44]	; 1510 <delay+0x6c>
    14e0:	e1520003 	cmp	r2, r3
    14e4:	dafffff8 	ble	14cc <delay+0x28>
    14e8:	e51b300c 	ldr	r3, [fp, #-12]
    14ec:	e2833001 	add	r3, r3, #1
    14f0:	e50b300c 	str	r3, [fp, #-12]
    14f4:	e51b200c 	ldr	r2, [fp, #-12]
    14f8:	e51b3010 	ldr	r3, [fp, #-16]
    14fc:	e1520003 	cmp	r2, r3
    1500:	baffffee 	blt	14c0 <delay+0x1c>
    1504:	e28bd000 	add	sp, fp, #0
    1508:	e8bd0800 	pop	{fp}
    150c:	e12fff1e 	bx	lr
    1510:	0000270f 	andeq	r2, r0, pc, lsl #14

00001514 <exp16>:
    1514:	e52db004 	push	{fp}		; (str fp, [sp, #-4]!)
    1518:	e28db000 	add	fp, sp, #0
    151c:	e24dd014 	sub	sp, sp, #20
    1520:	e50b0010 	str	r0, [fp, #-16]
    1524:	e3a03000 	mov	r3, #0
    1528:	e50b300c 	str	r3, [fp, #-12]
    152c:	e3a03001 	mov	r3, #1
    1530:	e50b3008 	str	r3, [fp, #-8]
    1534:	e3a03000 	mov	r3, #0
    1538:	e50b300c 	str	r3, [fp, #-12]
    153c:	ea000005 	b	1558 <exp16+0x44>
    1540:	e51b3008 	ldr	r3, [fp, #-8]
    1544:	e1a03203 	lsl	r3, r3, #4
    1548:	e50b3008 	str	r3, [fp, #-8]
    154c:	e51b300c 	ldr	r3, [fp, #-12]
    1550:	e2833001 	add	r3, r3, #1
    1554:	e50b300c 	str	r3, [fp, #-12]
    1558:	e51b200c 	ldr	r2, [fp, #-12]
    155c:	e51b3010 	ldr	r3, [fp, #-16]
    1560:	e1520003 	cmp	r2, r3
    1564:	3afffff5 	bcc	1540 <exp16+0x2c>
    1568:	e51b3008 	ldr	r3, [fp, #-8]
    156c:	e1a00003 	mov	r0, r3
    1570:	e28bd000 	add	sp, fp, #0
    1574:	e8bd0800 	pop	{fp}
    1578:	e12fff1e 	bx	lr

0000157c <atox>:
    157c:	e92d4810 	push	{r4, fp, lr}
    1580:	e28db008 	add	fp, sp, #8
    1584:	e24dd01c 	sub	sp, sp, #28
    1588:	e50b0020 	str	r0, [fp, #-32]
    158c:	e3a03000 	mov	r3, #0
    1590:	e50b3018 	str	r3, [fp, #-24]
    1594:	e3a03000 	mov	r3, #0
    1598:	e50b3014 	str	r3, [fp, #-20]
    159c:	e3a03000 	mov	r3, #0
    15a0:	e50b3010 	str	r3, [fp, #-16]
    15a4:	ea000005 	b	15c0 <atox+0x44>
    15a8:	e51b3020 	ldr	r3, [fp, #-32]
    15ac:	e2833001 	add	r3, r3, #1
    15b0:	e50b3020 	str	r3, [fp, #-32]
    15b4:	e51b3014 	ldr	r3, [fp, #-20]
    15b8:	e2833001 	add	r3, r3, #1
    15bc:	e50b3014 	str	r3, [fp, #-20]
    15c0:	e51b3020 	ldr	r3, [fp, #-32]
    15c4:	e5d33000 	ldrb	r3, [r3]
    15c8:	e3530000 	cmp	r3, #0
    15cc:	1afffff5 	bne	15a8 <atox+0x2c>
    15d0:	e51b3020 	ldr	r3, [fp, #-32]
    15d4:	e2433001 	sub	r3, r3, #1
    15d8:	e50b3020 	str	r3, [fp, #-32]
    15dc:	e3a03000 	mov	r3, #0
    15e0:	e50b3010 	str	r3, [fp, #-16]
    15e4:	ea000010 	b	162c <atox+0xb0>
    15e8:	e51b3020 	ldr	r3, [fp, #-32]
    15ec:	e5d33000 	ldrb	r3, [r3]
    15f0:	e2433030 	sub	r3, r3, #48	; 0x30
    15f4:	e1a04003 	mov	r4, r3
    15f8:	e51b0010 	ldr	r0, [fp, #-16]
    15fc:	ebffffc4 	bl	1514 <exp16>
    1600:	e1a02000 	mov	r2, r0
    1604:	e0030492 	mul	r3, r2, r4
    1608:	e51b2018 	ldr	r2, [fp, #-24]
    160c:	e0823003 	add	r3, r2, r3
    1610:	e50b3018 	str	r3, [fp, #-24]
    1614:	e51b3020 	ldr	r3, [fp, #-32]
    1618:	e2433001 	sub	r3, r3, #1
    161c:	e50b3020 	str	r3, [fp, #-32]
    1620:	e51b3010 	ldr	r3, [fp, #-16]
    1624:	e2833001 	add	r3, r3, #1
    1628:	e50b3010 	str	r3, [fp, #-16]
    162c:	e51b2010 	ldr	r2, [fp, #-16]
    1630:	e51b3014 	ldr	r3, [fp, #-20]
    1634:	e1520003 	cmp	r2, r3
    1638:	3affffea 	bcc	15e8 <atox+0x6c>
    163c:	e51b3018 	ldr	r3, [fp, #-24]
    1640:	e1a00003 	mov	r0, r3
    1644:	e24bd008 	sub	sp, fp, #8
    1648:	e8bd4810 	pop	{r4, fp, lr}
    164c:	e12fff1e 	bx	lr

00001650 <atoi>:
    1650:	e52db004 	push	{fp}		; (str fp, [sp, #-4]!)
    1654:	e28db000 	add	fp, sp, #0
    1658:	e24dd01c 	sub	sp, sp, #28
    165c:	e50b0018 	str	r0, [fp, #-24]
    1660:	e51b3018 	ldr	r3, [fp, #-24]
    1664:	e50b3010 	str	r3, [fp, #-16]
    1668:	e3a03000 	mov	r3, #0
    166c:	e50b3008 	str	r3, [fp, #-8]
    1670:	ea000012 	b	16c0 <atoi+0x70>
    1674:	e55b3009 	ldrb	r3, [fp, #-9]
    1678:	e353002f 	cmp	r3, #47	; 0x2f
    167c:	9a00000d 	bls	16b8 <atoi+0x68>
    1680:	e55b3009 	ldrb	r3, [fp, #-9]
    1684:	e3530039 	cmp	r3, #57	; 0x39
    1688:	8a00000a 	bhi	16b8 <atoi+0x68>
    168c:	e51b2008 	ldr	r2, [fp, #-8]
    1690:	e1a03002 	mov	r3, r2
    1694:	e1a03103 	lsl	r3, r3, #2
    1698:	e0833002 	add	r3, r3, r2
    169c:	e1a03083 	lsl	r3, r3, #1
    16a0:	e1a02003 	mov	r2, r3
    16a4:	e55b3009 	ldrb	r3, [fp, #-9]
    16a8:	e2433030 	sub	r3, r3, #48	; 0x30
    16ac:	e0823003 	add	r3, r2, r3
    16b0:	e50b3008 	str	r3, [fp, #-8]
    16b4:	ea000001 	b	16c0 <atoi+0x70>
    16b8:	e3e03000 	mvn	r3, #0
    16bc:	ea00000d 	b	16f8 <atoi+0xa8>
    16c0:	e51b3010 	ldr	r3, [fp, #-16]
    16c4:	e5d33000 	ldrb	r3, [r3]
    16c8:	e54b3009 	strb	r3, [fp, #-9]
    16cc:	e55b3009 	ldrb	r3, [fp, #-9]
    16d0:	e3530000 	cmp	r3, #0
    16d4:	03a03000 	moveq	r3, #0
    16d8:	13a03001 	movne	r3, #1
    16dc:	e20330ff 	and	r3, r3, #255	; 0xff
    16e0:	e51b2010 	ldr	r2, [fp, #-16]
    16e4:	e2822001 	add	r2, r2, #1
    16e8:	e50b2010 	str	r2, [fp, #-16]
    16ec:	e3530000 	cmp	r3, #0
    16f0:	1affffdf 	bne	1674 <atoi+0x24>
    16f4:	e51b3008 	ldr	r3, [fp, #-8]
    16f8:	e1a00003 	mov	r0, r3
    16fc:	e28bd000 	add	sp, fp, #0
    1700:	e8bd0800 	pop	{fp}
    1704:	e12fff1e 	bx	lr

00001708 <strcpy>:
    1708:	e52db004 	push	{fp}		; (str fp, [sp, #-4]!)
    170c:	e28db000 	add	fp, sp, #0
    1710:	e24dd014 	sub	sp, sp, #20
    1714:	e50b0010 	str	r0, [fp, #-16]
    1718:	e50b1014 	str	r1, [fp, #-20]
    171c:	e51b3010 	ldr	r3, [fp, #-16]
    1720:	e50b3008 	str	r3, [fp, #-8]
    1724:	e51b3014 	ldr	r3, [fp, #-20]
    1728:	e5d32000 	ldrb	r2, [r3]
    172c:	e51b3010 	ldr	r3, [fp, #-16]
    1730:	e5c32000 	strb	r2, [r3]
    1734:	e51b3010 	ldr	r3, [fp, #-16]
    1738:	e5d33000 	ldrb	r3, [r3]
    173c:	e3530000 	cmp	r3, #0
    1740:	03a03000 	moveq	r3, #0
    1744:	13a03001 	movne	r3, #1
    1748:	e20330ff 	and	r3, r3, #255	; 0xff
    174c:	e51b2010 	ldr	r2, [fp, #-16]
    1750:	e2822001 	add	r2, r2, #1
    1754:	e50b2010 	str	r2, [fp, #-16]
    1758:	e51b2014 	ldr	r2, [fp, #-20]
    175c:	e2822001 	add	r2, r2, #1
    1760:	e50b2014 	str	r2, [fp, #-20]
    1764:	e3530000 	cmp	r3, #0
    1768:	1affffed 	bne	1724 <strcpy+0x1c>
    176c:	e51b3008 	ldr	r3, [fp, #-8]
    1770:	e1a00003 	mov	r0, r3
    1774:	e28bd000 	add	sp, fp, #0
    1778:	e8bd0800 	pop	{fp}
    177c:	e12fff1e 	bx	lr

00001780 <strncpy>:
    1780:	e52db004 	push	{fp}		; (str fp, [sp, #-4]!)
    1784:	e28db000 	add	fp, sp, #0
    1788:	e24dd01c 	sub	sp, sp, #28
    178c:	e50b0010 	str	r0, [fp, #-16]
    1790:	e50b1014 	str	r1, [fp, #-20]
    1794:	e50b2018 	str	r2, [fp, #-24]
    1798:	e51b3010 	ldr	r3, [fp, #-16]
    179c:	e50b3008 	str	r3, [fp, #-8]
    17a0:	e51b3018 	ldr	r3, [fp, #-24]
    17a4:	e3530000 	cmp	r3, #0
    17a8:	03a03000 	moveq	r3, #0
    17ac:	13a03001 	movne	r3, #1
    17b0:	e20330ff 	and	r3, r3, #255	; 0xff
    17b4:	e51b2018 	ldr	r2, [fp, #-24]
    17b8:	e2422001 	sub	r2, r2, #1
    17bc:	e50b2018 	str	r2, [fp, #-24]
    17c0:	e3530000 	cmp	r3, #0
    17c4:	0a000011 	beq	1810 <strncpy+0x90>
    17c8:	e51b3014 	ldr	r3, [fp, #-20]
    17cc:	e5d32000 	ldrb	r2, [r3]
    17d0:	e51b3010 	ldr	r3, [fp, #-16]
    17d4:	e5c32000 	strb	r2, [r3]
    17d8:	e51b3010 	ldr	r3, [fp, #-16]
    17dc:	e5d33000 	ldrb	r3, [r3]
    17e0:	e3530000 	cmp	r3, #0
    17e4:	03a03000 	moveq	r3, #0
    17e8:	13a03001 	movne	r3, #1
    17ec:	e20330ff 	and	r3, r3, #255	; 0xff
    17f0:	e51b2010 	ldr	r2, [fp, #-16]
    17f4:	e2822001 	add	r2, r2, #1
    17f8:	e50b2010 	str	r2, [fp, #-16]
    17fc:	e51b2014 	ldr	r2, [fp, #-20]
    1800:	e2822001 	add	r2, r2, #1
    1804:	e50b2014 	str	r2, [fp, #-20]
    1808:	e3530000 	cmp	r3, #0
    180c:	1affffe3 	bne	17a0 <strncpy+0x20>
    1810:	e51b3008 	ldr	r3, [fp, #-8]
    1814:	e1a00003 	mov	r0, r3
    1818:	e28bd000 	add	sp, fp, #0
    181c:	e8bd0800 	pop	{fp}
    1820:	e12fff1e 	bx	lr

00001824 <strcat>:
    1824:	e52db004 	push	{fp}		; (str fp, [sp, #-4]!)
    1828:	e28db000 	add	fp, sp, #0
    182c:	e24dd014 	sub	sp, sp, #20
    1830:	e50b0010 	str	r0, [fp, #-16]
    1834:	e50b1014 	str	r1, [fp, #-20]
    1838:	e51b3010 	ldr	r3, [fp, #-16]
    183c:	e50b3008 	str	r3, [fp, #-8]
    1840:	ea000002 	b	1850 <strcat+0x2c>
    1844:	e51b3010 	ldr	r3, [fp, #-16]
    1848:	e2833001 	add	r3, r3, #1
    184c:	e50b3010 	str	r3, [fp, #-16]
    1850:	e51b3010 	ldr	r3, [fp, #-16]
    1854:	e5d33000 	ldrb	r3, [r3]
    1858:	e3530000 	cmp	r3, #0
    185c:	1afffff8 	bne	1844 <strcat+0x20>
    1860:	e51b3014 	ldr	r3, [fp, #-20]
    1864:	e5d32000 	ldrb	r2, [r3]
    1868:	e51b3010 	ldr	r3, [fp, #-16]
    186c:	e5c32000 	strb	r2, [r3]
    1870:	e51b3010 	ldr	r3, [fp, #-16]
    1874:	e5d33000 	ldrb	r3, [r3]
    1878:	e3530000 	cmp	r3, #0
    187c:	03a03000 	moveq	r3, #0
    1880:	13a03001 	movne	r3, #1
    1884:	e20330ff 	and	r3, r3, #255	; 0xff
    1888:	e51b2010 	ldr	r2, [fp, #-16]
    188c:	e2822001 	add	r2, r2, #1
    1890:	e50b2010 	str	r2, [fp, #-16]
    1894:	e51b2014 	ldr	r2, [fp, #-20]
    1898:	e2822001 	add	r2, r2, #1
    189c:	e50b2014 	str	r2, [fp, #-20]
    18a0:	e3530000 	cmp	r3, #0
    18a4:	1affffed 	bne	1860 <strcat+0x3c>
    18a8:	e51b3008 	ldr	r3, [fp, #-8]
    18ac:	e1a00003 	mov	r0, r3
    18b0:	e28bd000 	add	sp, fp, #0
    18b4:	e8bd0800 	pop	{fp}
    18b8:	e12fff1e 	bx	lr

000018bc <strncat>:
    18bc:	e52db004 	push	{fp}		; (str fp, [sp, #-4]!)
    18c0:	e28db000 	add	fp, sp, #0
    18c4:	e24dd01c 	sub	sp, sp, #28
    18c8:	e50b0010 	str	r0, [fp, #-16]
    18cc:	e50b1014 	str	r1, [fp, #-20]
    18d0:	e50b2018 	str	r2, [fp, #-24]
    18d4:	e51b3010 	ldr	r3, [fp, #-16]
    18d8:	e50b3008 	str	r3, [fp, #-8]
    18dc:	e51b3018 	ldr	r3, [fp, #-24]
    18e0:	e3530000 	cmp	r3, #0
    18e4:	0a000024 	beq	197c <strncat+0xc0>
    18e8:	ea000002 	b	18f8 <strncat+0x3c>
    18ec:	e51b3010 	ldr	r3, [fp, #-16]
    18f0:	e2833001 	add	r3, r3, #1
    18f4:	e50b3010 	str	r3, [fp, #-16]
    18f8:	e51b3010 	ldr	r3, [fp, #-16]
    18fc:	e5d33000 	ldrb	r3, [r3]
    1900:	e3530000 	cmp	r3, #0
    1904:	1afffff8 	bne	18ec <strncat+0x30>
    1908:	ea000009 	b	1934 <strncat+0x78>
    190c:	e51b3018 	ldr	r3, [fp, #-24]
    1910:	e2433001 	sub	r3, r3, #1
    1914:	e50b3018 	str	r3, [fp, #-24]
    1918:	e51b3018 	ldr	r3, [fp, #-24]
    191c:	e3530000 	cmp	r3, #0
    1920:	1a000003 	bne	1934 <strncat+0x78>
    1924:	e51b3010 	ldr	r3, [fp, #-16]
    1928:	e3a02000 	mov	r2, #0
    192c:	e5c32000 	strb	r2, [r3]
    1930:	ea000011 	b	197c <strncat+0xc0>
    1934:	e51b3014 	ldr	r3, [fp, #-20]
    1938:	e5d32000 	ldrb	r2, [r3]
    193c:	e51b3010 	ldr	r3, [fp, #-16]
    1940:	e5c32000 	strb	r2, [r3]
    1944:	e51b3010 	ldr	r3, [fp, #-16]
    1948:	e5d33000 	ldrb	r3, [r3]
    194c:	e3530000 	cmp	r3, #0
    1950:	03a03000 	moveq	r3, #0
    1954:	13a03001 	movne	r3, #1
    1958:	e20330ff 	and	r3, r3, #255	; 0xff
    195c:	e51b2010 	ldr	r2, [fp, #-16]
    1960:	e2822001 	add	r2, r2, #1
    1964:	e50b2010 	str	r2, [fp, #-16]
    1968:	e51b2014 	ldr	r2, [fp, #-20]
    196c:	e2822001 	add	r2, r2, #1
    1970:	e50b2014 	str	r2, [fp, #-20]
    1974:	e3530000 	cmp	r3, #0
    1978:	1affffe3 	bne	190c <strncat+0x50>
    197c:	e51b3008 	ldr	r3, [fp, #-8]
    1980:	e1a00003 	mov	r0, r3
    1984:	e28bd000 	add	sp, fp, #0
    1988:	e8bd0800 	pop	{fp}
    198c:	e12fff1e 	bx	lr

00001990 <strcmp>:
    1990:	e92d0810 	push	{r4, fp}
    1994:	e28db004 	add	fp, sp, #4
    1998:	e24dd008 	sub	sp, sp, #8
    199c:	e50b0008 	str	r0, [fp, #-8]
    19a0:	e50b100c 	str	r1, [fp, #-12]
    19a4:	ea000000 	b	19ac <strcmp+0x1c>
    19a8:	e1a00000 	nop			; (mov r0, r0)
    19ac:	e51b3008 	ldr	r3, [fp, #-8]
    19b0:	e5d32000 	ldrb	r2, [r3]
    19b4:	e51b300c 	ldr	r3, [fp, #-12]
    19b8:	e5d33000 	ldrb	r3, [r3]
    19bc:	e0633002 	rsb	r3, r3, r2
    19c0:	e20330ff 	and	r3, r3, #255	; 0xff
    19c4:	e1a04003 	mov	r4, r3
    19c8:	e1a03c04 	lsl	r3, r4, #24
    19cc:	e1a03c43 	asr	r3, r3, #24
    19d0:	e3530000 	cmp	r3, #0
    19d4:	03a03000 	moveq	r3, #0
    19d8:	13a03001 	movne	r3, #1
    19dc:	e20330ff 	and	r3, r3, #255	; 0xff
    19e0:	e51b200c 	ldr	r2, [fp, #-12]
    19e4:	e2822001 	add	r2, r2, #1
    19e8:	e50b200c 	str	r2, [fp, #-12]
    19ec:	e3530000 	cmp	r3, #0
    19f0:	1a00000a 	bne	1a20 <strcmp+0x90>
    19f4:	e51b3008 	ldr	r3, [fp, #-8]
    19f8:	e5d33000 	ldrb	r3, [r3]
    19fc:	e3530000 	cmp	r3, #0
    1a00:	13a03000 	movne	r3, #0
    1a04:	03a03001 	moveq	r3, #1
    1a08:	e20330ff 	and	r3, r3, #255	; 0xff
    1a0c:	e51b2008 	ldr	r2, [fp, #-8]
    1a10:	e2822001 	add	r2, r2, #1
    1a14:	e50b2008 	str	r2, [fp, #-8]
    1a18:	e3530000 	cmp	r3, #0
    1a1c:	0affffe1 	beq	19a8 <strcmp+0x18>
    1a20:	e1a03c04 	lsl	r3, r4, #24
    1a24:	e1a03c43 	asr	r3, r3, #24
    1a28:	e1a00003 	mov	r0, r3
    1a2c:	e24bd004 	sub	sp, fp, #4
    1a30:	e8bd0810 	pop	{r4, fp}
    1a34:	e12fff1e 	bx	lr

00001a38 <strncmp>:
    1a38:	e92d0810 	push	{r4, fp}
    1a3c:	e28db004 	add	fp, sp, #4
    1a40:	e24dd010 	sub	sp, sp, #16
    1a44:	e50b0008 	str	r0, [fp, #-8]
    1a48:	e50b100c 	str	r1, [fp, #-12]
    1a4c:	e50b2010 	str	r2, [fp, #-16]
    1a50:	e3a04000 	mov	r4, #0
    1a54:	ea00001f 	b	1ad8 <strncmp+0xa0>
    1a58:	e51b3008 	ldr	r3, [fp, #-8]
    1a5c:	e5d32000 	ldrb	r2, [r3]
    1a60:	e51b300c 	ldr	r3, [fp, #-12]
    1a64:	e5d33000 	ldrb	r3, [r3]
    1a68:	e0633002 	rsb	r3, r3, r2
    1a6c:	e20330ff 	and	r3, r3, #255	; 0xff
    1a70:	e1a04003 	mov	r4, r3
    1a74:	e1a03c04 	lsl	r3, r4, #24
    1a78:	e1a03c43 	asr	r3, r3, #24
    1a7c:	e3530000 	cmp	r3, #0
    1a80:	03a03000 	moveq	r3, #0
    1a84:	13a03001 	movne	r3, #1
    1a88:	e20330ff 	and	r3, r3, #255	; 0xff
    1a8c:	e51b200c 	ldr	r2, [fp, #-12]
    1a90:	e2822001 	add	r2, r2, #1
    1a94:	e50b200c 	str	r2, [fp, #-12]
    1a98:	e3530000 	cmp	r3, #0
    1a9c:	1a000010 	bne	1ae4 <strncmp+0xac>
    1aa0:	e51b3008 	ldr	r3, [fp, #-8]
    1aa4:	e5d33000 	ldrb	r3, [r3]
    1aa8:	e3530000 	cmp	r3, #0
    1aac:	13a03000 	movne	r3, #0
    1ab0:	03a03001 	moveq	r3, #1
    1ab4:	e20330ff 	and	r3, r3, #255	; 0xff
    1ab8:	e51b2008 	ldr	r2, [fp, #-8]
    1abc:	e2822001 	add	r2, r2, #1
    1ac0:	e50b2008 	str	r2, [fp, #-8]
    1ac4:	e3530000 	cmp	r3, #0
    1ac8:	1a000005 	bne	1ae4 <strncmp+0xac>
    1acc:	e51b3010 	ldr	r3, [fp, #-16]
    1ad0:	e2433001 	sub	r3, r3, #1
    1ad4:	e50b3010 	str	r3, [fp, #-16]
    1ad8:	e51b3010 	ldr	r3, [fp, #-16]
    1adc:	e3530000 	cmp	r3, #0
    1ae0:	1affffdc 	bne	1a58 <strncmp+0x20>
    1ae4:	e1a03c04 	lsl	r3, r4, #24
    1ae8:	e1a03c43 	asr	r3, r3, #24
    1aec:	e1a00003 	mov	r0, r3
    1af0:	e24bd004 	sub	sp, fp, #4
    1af4:	e8bd0810 	pop	{r4, fp}
    1af8:	e12fff1e 	bx	lr

00001afc <strchr>:
    1afc:	e52db004 	push	{fp}		; (str fp, [sp, #-4]!)
    1b00:	e28db000 	add	fp, sp, #0
    1b04:	e24dd00c 	sub	sp, sp, #12
    1b08:	e50b0008 	str	r0, [fp, #-8]
    1b0c:	e50b100c 	str	r1, [fp, #-12]
    1b10:	ea000008 	b	1b38 <strchr+0x3c>
    1b14:	e51b3008 	ldr	r3, [fp, #-8]
    1b18:	e5d33000 	ldrb	r3, [r3]
    1b1c:	e3530000 	cmp	r3, #0
    1b20:	1a000001 	bne	1b2c <strchr+0x30>
    1b24:	e3a03000 	mov	r3, #0
    1b28:	ea000009 	b	1b54 <strchr+0x58>
    1b2c:	e51b3008 	ldr	r3, [fp, #-8]
    1b30:	e2833001 	add	r3, r3, #1
    1b34:	e50b3008 	str	r3, [fp, #-8]
    1b38:	e51b3008 	ldr	r3, [fp, #-8]
    1b3c:	e5d32000 	ldrb	r2, [r3]
    1b40:	e51b300c 	ldr	r3, [fp, #-12]
    1b44:	e20330ff 	and	r3, r3, #255	; 0xff
    1b48:	e1520003 	cmp	r2, r3
    1b4c:	1afffff0 	bne	1b14 <strchr+0x18>
    1b50:	e51b3008 	ldr	r3, [fp, #-8]
    1b54:	e1a00003 	mov	r0, r3
    1b58:	e28bd000 	add	sp, fp, #0
    1b5c:	e8bd0800 	pop	{fp}
    1b60:	e12fff1e 	bx	lr

00001b64 <strlen>:
    1b64:	e52db004 	push	{fp}		; (str fp, [sp, #-4]!)
    1b68:	e28db000 	add	fp, sp, #0
    1b6c:	e24dd014 	sub	sp, sp, #20
    1b70:	e50b0010 	str	r0, [fp, #-16]
    1b74:	e51b3010 	ldr	r3, [fp, #-16]
    1b78:	e50b3008 	str	r3, [fp, #-8]
    1b7c:	ea000002 	b	1b8c <strlen+0x28>
    1b80:	e51b3008 	ldr	r3, [fp, #-8]
    1b84:	e2833001 	add	r3, r3, #1
    1b88:	e50b3008 	str	r3, [fp, #-8]
    1b8c:	e51b3008 	ldr	r3, [fp, #-8]
    1b90:	e5d33000 	ldrb	r3, [r3]
    1b94:	e3530000 	cmp	r3, #0
    1b98:	1afffff8 	bne	1b80 <strlen+0x1c>
    1b9c:	e51b2008 	ldr	r2, [fp, #-8]
    1ba0:	e51b3010 	ldr	r3, [fp, #-16]
    1ba4:	e0633002 	rsb	r3, r3, r2
    1ba8:	e1a00003 	mov	r0, r3
    1bac:	e28bd000 	add	sp, fp, #0
    1bb0:	e8bd0800 	pop	{fp}
    1bb4:	e12fff1e 	bx	lr

00001bb8 <strnlen>:
    1bb8:	e52db004 	push	{fp}		; (str fp, [sp, #-4]!)
    1bbc:	e28db000 	add	fp, sp, #0
    1bc0:	e24dd014 	sub	sp, sp, #20
    1bc4:	e50b0010 	str	r0, [fp, #-16]
    1bc8:	e50b1014 	str	r1, [fp, #-20]
    1bcc:	e51b3010 	ldr	r3, [fp, #-16]
    1bd0:	e50b3008 	str	r3, [fp, #-8]
    1bd4:	ea000002 	b	1be4 <strnlen+0x2c>
    1bd8:	e51b3008 	ldr	r3, [fp, #-8]
    1bdc:	e2833001 	add	r3, r3, #1
    1be0:	e50b3008 	str	r3, [fp, #-8]
    1be4:	e51b3014 	ldr	r3, [fp, #-20]
    1be8:	e3530000 	cmp	r3, #0
    1bec:	03a03000 	moveq	r3, #0
    1bf0:	13a03001 	movne	r3, #1
    1bf4:	e20330ff 	and	r3, r3, #255	; 0xff
    1bf8:	e51b2014 	ldr	r2, [fp, #-20]
    1bfc:	e2422001 	sub	r2, r2, #1
    1c00:	e50b2014 	str	r2, [fp, #-20]
    1c04:	e3530000 	cmp	r3, #0
    1c08:	0a000003 	beq	1c1c <strnlen+0x64>
    1c0c:	e51b3008 	ldr	r3, [fp, #-8]
    1c10:	e5d33000 	ldrb	r3, [r3]
    1c14:	e3530000 	cmp	r3, #0
    1c18:	1affffee 	bne	1bd8 <strnlen+0x20>
    1c1c:	e51b2008 	ldr	r2, [fp, #-8]
    1c20:	e51b3010 	ldr	r3, [fp, #-16]
    1c24:	e0633002 	rsb	r3, r3, r2
    1c28:	e1a00003 	mov	r0, r3
    1c2c:	e28bd000 	add	sp, fp, #0
    1c30:	e8bd0800 	pop	{fp}
    1c34:	e12fff1e 	bx	lr

00001c38 <strspn>:
    1c38:	e52db004 	push	{fp}		; (str fp, [sp, #-4]!)
    1c3c:	e28db000 	add	fp, sp, #0
    1c40:	e24dd01c 	sub	sp, sp, #28
    1c44:	e50b0018 	str	r0, [fp, #-24]
    1c48:	e50b101c 	str	r1, [fp, #-28]
    1c4c:	e3a03000 	mov	r3, #0
    1c50:	e50b3008 	str	r3, [fp, #-8]
    1c54:	e51b3018 	ldr	r3, [fp, #-24]
    1c58:	e50b3010 	str	r3, [fp, #-16]
    1c5c:	ea00001d 	b	1cd8 <strspn+0xa0>
    1c60:	e51b301c 	ldr	r3, [fp, #-28]
    1c64:	e50b300c 	str	r3, [fp, #-12]
    1c68:	ea000008 	b	1c90 <strspn+0x58>
    1c6c:	e51b3010 	ldr	r3, [fp, #-16]
    1c70:	e5d32000 	ldrb	r2, [r3]
    1c74:	e51b300c 	ldr	r3, [fp, #-12]
    1c78:	e5d33000 	ldrb	r3, [r3]
    1c7c:	e1520003 	cmp	r2, r3
    1c80:	0a000007 	beq	1ca4 <strspn+0x6c>
    1c84:	e51b300c 	ldr	r3, [fp, #-12]
    1c88:	e2833001 	add	r3, r3, #1
    1c8c:	e50b300c 	str	r3, [fp, #-12]
    1c90:	e51b300c 	ldr	r3, [fp, #-12]
    1c94:	e5d33000 	ldrb	r3, [r3]
    1c98:	e3530000 	cmp	r3, #0
    1c9c:	1afffff2 	bne	1c6c <strspn+0x34>
    1ca0:	ea000000 	b	1ca8 <strspn+0x70>
    1ca4:	e1a00000 	nop			; (mov r0, r0)
    1ca8:	e51b300c 	ldr	r3, [fp, #-12]
    1cac:	e5d33000 	ldrb	r3, [r3]
    1cb0:	e3530000 	cmp	r3, #0
    1cb4:	1a000001 	bne	1cc0 <strspn+0x88>
    1cb8:	e51b3008 	ldr	r3, [fp, #-8]
    1cbc:	ea00000a 	b	1cec <strspn+0xb4>
    1cc0:	e51b3008 	ldr	r3, [fp, #-8]
    1cc4:	e2833001 	add	r3, r3, #1
    1cc8:	e50b3008 	str	r3, [fp, #-8]
    1ccc:	e51b3010 	ldr	r3, [fp, #-16]
    1cd0:	e2833001 	add	r3, r3, #1
    1cd4:	e50b3010 	str	r3, [fp, #-16]
    1cd8:	e51b3010 	ldr	r3, [fp, #-16]
    1cdc:	e5d33000 	ldrb	r3, [r3]
    1ce0:	e3530000 	cmp	r3, #0
    1ce4:	1affffdd 	bne	1c60 <strspn+0x28>
    1ce8:	e51b3008 	ldr	r3, [fp, #-8]
    1cec:	e1a00003 	mov	r0, r3
    1cf0:	e28bd000 	add	sp, fp, #0
    1cf4:	e8bd0800 	pop	{fp}
    1cf8:	e12fff1e 	bx	lr

00001cfc <strpbrk>:
    1cfc:	e52db004 	push	{fp}		; (str fp, [sp, #-4]!)
    1d00:	e28db000 	add	fp, sp, #0
    1d04:	e24dd014 	sub	sp, sp, #20
    1d08:	e50b0010 	str	r0, [fp, #-16]
    1d0c:	e50b1014 	str	r1, [fp, #-20]
    1d10:	e51b3010 	ldr	r3, [fp, #-16]
    1d14:	e50b300c 	str	r3, [fp, #-12]
    1d18:	ea000014 	b	1d70 <strpbrk+0x74>
    1d1c:	e51b3014 	ldr	r3, [fp, #-20]
    1d20:	e50b3008 	str	r3, [fp, #-8]
    1d24:	ea00000a 	b	1d54 <strpbrk+0x58>
    1d28:	e51b300c 	ldr	r3, [fp, #-12]
    1d2c:	e5d32000 	ldrb	r2, [r3]
    1d30:	e51b3008 	ldr	r3, [fp, #-8]
    1d34:	e5d33000 	ldrb	r3, [r3]
    1d38:	e1520003 	cmp	r2, r3
    1d3c:	1a000001 	bne	1d48 <strpbrk+0x4c>
    1d40:	e51b300c 	ldr	r3, [fp, #-12]
    1d44:	ea00000e 	b	1d84 <strpbrk+0x88>
    1d48:	e51b3008 	ldr	r3, [fp, #-8]
    1d4c:	e2833001 	add	r3, r3, #1
    1d50:	e50b3008 	str	r3, [fp, #-8]
    1d54:	e51b3008 	ldr	r3, [fp, #-8]
    1d58:	e5d33000 	ldrb	r3, [r3]
    1d5c:	e3530000 	cmp	r3, #0
    1d60:	1afffff0 	bne	1d28 <strpbrk+0x2c>
    1d64:	e51b300c 	ldr	r3, [fp, #-12]
    1d68:	e2833001 	add	r3, r3, #1
    1d6c:	e50b300c 	str	r3, [fp, #-12]
    1d70:	e51b300c 	ldr	r3, [fp, #-12]
    1d74:	e5d33000 	ldrb	r3, [r3]
    1d78:	e3530000 	cmp	r3, #0
    1d7c:	1affffe6 	bne	1d1c <strpbrk+0x20>
    1d80:	e3a03000 	mov	r3, #0
    1d84:	e1a00003 	mov	r0, r3
    1d88:	e28bd000 	add	sp, fp, #0
    1d8c:	e8bd0800 	pop	{fp}
    1d90:	e12fff1e 	bx	lr

00001d94 <memset>:
    1d94:	e52db004 	push	{fp}		; (str fp, [sp, #-4]!)
    1d98:	e28db000 	add	fp, sp, #0
    1d9c:	e24dd01c 	sub	sp, sp, #28
    1da0:	e50b0010 	str	r0, [fp, #-16]
    1da4:	e50b1014 	str	r1, [fp, #-20]
    1da8:	e50b2018 	str	r2, [fp, #-24]
    1dac:	e51b3010 	ldr	r3, [fp, #-16]
    1db0:	e50b3008 	str	r3, [fp, #-8]
    1db4:	ea000006 	b	1dd4 <memset+0x40>
    1db8:	e51b3014 	ldr	r3, [fp, #-20]
    1dbc:	e20320ff 	and	r2, r3, #255	; 0xff
    1dc0:	e51b3008 	ldr	r3, [fp, #-8]
    1dc4:	e5c32000 	strb	r2, [r3]
    1dc8:	e51b3008 	ldr	r3, [fp, #-8]
    1dcc:	e2833001 	add	r3, r3, #1
    1dd0:	e50b3008 	str	r3, [fp, #-8]
    1dd4:	e51b3018 	ldr	r3, [fp, #-24]
    1dd8:	e3530000 	cmp	r3, #0
    1ddc:	03a03000 	moveq	r3, #0
    1de0:	13a03001 	movne	r3, #1
    1de4:	e20330ff 	and	r3, r3, #255	; 0xff
    1de8:	e51b2018 	ldr	r2, [fp, #-24]
    1dec:	e2422001 	sub	r2, r2, #1
    1df0:	e50b2018 	str	r2, [fp, #-24]
    1df4:	e3530000 	cmp	r3, #0
    1df8:	1affffee 	bne	1db8 <memset+0x24>
    1dfc:	e51b3010 	ldr	r3, [fp, #-16]
    1e00:	e1a00003 	mov	r0, r3
    1e04:	e28bd000 	add	sp, fp, #0
    1e08:	e8bd0800 	pop	{fp}
    1e0c:	e12fff1e 	bx	lr

00001e10 <memcpy>:
    1e10:	e52db004 	push	{fp}		; (str fp, [sp, #-4]!)
    1e14:	e28db000 	add	fp, sp, #0
    1e18:	e24dd01c 	sub	sp, sp, #28
    1e1c:	e50b0010 	str	r0, [fp, #-16]
    1e20:	e50b1014 	str	r1, [fp, #-20]
    1e24:	e50b2018 	str	r2, [fp, #-24]
    1e28:	e51b3010 	ldr	r3, [fp, #-16]
    1e2c:	e50b300c 	str	r3, [fp, #-12]
    1e30:	e51b3014 	ldr	r3, [fp, #-20]
    1e34:	e50b3008 	str	r3, [fp, #-8]
    1e38:	ea000009 	b	1e64 <memcpy+0x54>
    1e3c:	e51b3008 	ldr	r3, [fp, #-8]
    1e40:	e5d32000 	ldrb	r2, [r3]
    1e44:	e51b300c 	ldr	r3, [fp, #-12]
    1e48:	e5c32000 	strb	r2, [r3]
    1e4c:	e51b300c 	ldr	r3, [fp, #-12]
    1e50:	e2833001 	add	r3, r3, #1
    1e54:	e50b300c 	str	r3, [fp, #-12]
    1e58:	e51b3008 	ldr	r3, [fp, #-8]
    1e5c:	e2833001 	add	r3, r3, #1
    1e60:	e50b3008 	str	r3, [fp, #-8]
    1e64:	e51b3018 	ldr	r3, [fp, #-24]
    1e68:	e3530000 	cmp	r3, #0
    1e6c:	03a03000 	moveq	r3, #0
    1e70:	13a03001 	movne	r3, #1
    1e74:	e20330ff 	and	r3, r3, #255	; 0xff
    1e78:	e51b2018 	ldr	r2, [fp, #-24]
    1e7c:	e2422001 	sub	r2, r2, #1
    1e80:	e50b2018 	str	r2, [fp, #-24]
    1e84:	e3530000 	cmp	r3, #0
    1e88:	1affffeb 	bne	1e3c <memcpy+0x2c>
    1e8c:	e51b3010 	ldr	r3, [fp, #-16]
    1e90:	e1a00003 	mov	r0, r3
    1e94:	e28bd000 	add	sp, fp, #0
    1e98:	e8bd0800 	pop	{fp}
    1e9c:	e12fff1e 	bx	lr

00001ea0 <memmove>:
    1ea0:	e52db004 	push	{fp}		; (str fp, [sp, #-4]!)
    1ea4:	e28db000 	add	fp, sp, #0
    1ea8:	e24dd01c 	sub	sp, sp, #28
    1eac:	e50b0010 	str	r0, [fp, #-16]
    1eb0:	e50b1014 	str	r1, [fp, #-20]
    1eb4:	e50b2018 	str	r2, [fp, #-24]
    1eb8:	e51b2010 	ldr	r2, [fp, #-16]
    1ebc:	e51b3014 	ldr	r3, [fp, #-20]
    1ec0:	e1520003 	cmp	r2, r3
    1ec4:	8a000019 	bhi	1f30 <memmove+0x90>
    1ec8:	e51b3010 	ldr	r3, [fp, #-16]
    1ecc:	e50b300c 	str	r3, [fp, #-12]
    1ed0:	e51b3014 	ldr	r3, [fp, #-20]
    1ed4:	e50b3008 	str	r3, [fp, #-8]
    1ed8:	ea000009 	b	1f04 <memmove+0x64>
    1edc:	e51b3008 	ldr	r3, [fp, #-8]
    1ee0:	e5d32000 	ldrb	r2, [r3]
    1ee4:	e51b300c 	ldr	r3, [fp, #-12]
    1ee8:	e5c32000 	strb	r2, [r3]
    1eec:	e51b300c 	ldr	r3, [fp, #-12]
    1ef0:	e2833001 	add	r3, r3, #1
    1ef4:	e50b300c 	str	r3, [fp, #-12]
    1ef8:	e51b3008 	ldr	r3, [fp, #-8]
    1efc:	e2833001 	add	r3, r3, #1
    1f00:	e50b3008 	str	r3, [fp, #-8]
    1f04:	e51b3018 	ldr	r3, [fp, #-24]
    1f08:	e3530000 	cmp	r3, #0
    1f0c:	03a03000 	moveq	r3, #0
    1f10:	13a03001 	movne	r3, #1
    1f14:	e20330ff 	and	r3, r3, #255	; 0xff
    1f18:	e51b2018 	ldr	r2, [fp, #-24]
    1f1c:	e2422001 	sub	r2, r2, #1
    1f20:	e50b2018 	str	r2, [fp, #-24]
    1f24:	e3530000 	cmp	r3, #0
    1f28:	1affffeb 	bne	1edc <memmove+0x3c>
    1f2c:	ea00001c 	b	1fa4 <memmove+0x104>
    1f30:	e51b2010 	ldr	r2, [fp, #-16]
    1f34:	e51b3018 	ldr	r3, [fp, #-24]
    1f38:	e0823003 	add	r3, r2, r3
    1f3c:	e50b300c 	str	r3, [fp, #-12]
    1f40:	e51b2014 	ldr	r2, [fp, #-20]
    1f44:	e51b3018 	ldr	r3, [fp, #-24]
    1f48:	e0823003 	add	r3, r2, r3
    1f4c:	e50b3008 	str	r3, [fp, #-8]
    1f50:	ea000009 	b	1f7c <memmove+0xdc>
    1f54:	e51b300c 	ldr	r3, [fp, #-12]
    1f58:	e2433001 	sub	r3, r3, #1
    1f5c:	e50b300c 	str	r3, [fp, #-12]
    1f60:	e51b3008 	ldr	r3, [fp, #-8]
    1f64:	e2433001 	sub	r3, r3, #1
    1f68:	e50b3008 	str	r3, [fp, #-8]
    1f6c:	e51b3008 	ldr	r3, [fp, #-8]
    1f70:	e5d32000 	ldrb	r2, [r3]
    1f74:	e51b300c 	ldr	r3, [fp, #-12]
    1f78:	e5c32000 	strb	r2, [r3]
    1f7c:	e51b3018 	ldr	r3, [fp, #-24]
    1f80:	e3530000 	cmp	r3, #0
    1f84:	03a03000 	moveq	r3, #0
    1f88:	13a03001 	movne	r3, #1
    1f8c:	e20330ff 	and	r3, r3, #255	; 0xff
    1f90:	e51b2018 	ldr	r2, [fp, #-24]
    1f94:	e2422001 	sub	r2, r2, #1
    1f98:	e50b2018 	str	r2, [fp, #-24]
    1f9c:	e3530000 	cmp	r3, #0
    1fa0:	1affffeb 	bne	1f54 <memmove+0xb4>
    1fa4:	e51b3010 	ldr	r3, [fp, #-16]
    1fa8:	e1a00003 	mov	r0, r3
    1fac:	e28bd000 	add	sp, fp, #0
    1fb0:	e8bd0800 	pop	{fp}
    1fb4:	e12fff1e 	bx	lr

00001fb8 <memcmp>:
    1fb8:	e52db004 	push	{fp}		; (str fp, [sp, #-4]!)
    1fbc:	e28db000 	add	fp, sp, #0
    1fc0:	e24dd024 	sub	sp, sp, #36	; 0x24
    1fc4:	e50b0018 	str	r0, [fp, #-24]
    1fc8:	e50b101c 	str	r1, [fp, #-28]
    1fcc:	e50b2020 	str	r2, [fp, #-32]
    1fd0:	e3a03000 	mov	r3, #0
    1fd4:	e50b3008 	str	r3, [fp, #-8]
    1fd8:	e51b3018 	ldr	r3, [fp, #-24]
    1fdc:	e50b3010 	str	r3, [fp, #-16]
    1fe0:	e51b301c 	ldr	r3, [fp, #-28]
    1fe4:	e50b300c 	str	r3, [fp, #-12]
    1fe8:	ea000012 	b	2038 <memcmp+0x80>
    1fec:	e51b3010 	ldr	r3, [fp, #-16]
    1ff0:	e5d33000 	ldrb	r3, [r3]
    1ff4:	e1a02003 	mov	r2, r3
    1ff8:	e51b300c 	ldr	r3, [fp, #-12]
    1ffc:	e5d33000 	ldrb	r3, [r3]
    2000:	e0633002 	rsb	r3, r3, r2
    2004:	e50b3008 	str	r3, [fp, #-8]
    2008:	e51b3008 	ldr	r3, [fp, #-8]
    200c:	e3530000 	cmp	r3, #0
    2010:	1a00000c 	bne	2048 <memcmp+0x90>
    2014:	e51b3010 	ldr	r3, [fp, #-16]
    2018:	e2833001 	add	r3, r3, #1
    201c:	e50b3010 	str	r3, [fp, #-16]
    2020:	e51b300c 	ldr	r3, [fp, #-12]
    2024:	e2833001 	add	r3, r3, #1
    2028:	e50b300c 	str	r3, [fp, #-12]
    202c:	e51b3020 	ldr	r3, [fp, #-32]
    2030:	e2433001 	sub	r3, r3, #1
    2034:	e50b3020 	str	r3, [fp, #-32]
    2038:	e51b3020 	ldr	r3, [fp, #-32]
    203c:	e3530000 	cmp	r3, #0
    2040:	caffffe9 	bgt	1fec <memcmp+0x34>
    2044:	ea000000 	b	204c <memcmp+0x94>
    2048:	e1a00000 	nop			; (mov r0, r0)
    204c:	e51b3008 	ldr	r3, [fp, #-8]
    2050:	e1a00003 	mov	r0, r3
    2054:	e28bd000 	add	sp, fp, #0
    2058:	e8bd0800 	pop	{fp}
    205c:	e12fff1e 	bx	lr

00002060 <memscan>:
    2060:	e52db004 	push	{fp}		; (str fp, [sp, #-4]!)
    2064:	e28db000 	add	fp, sp, #0
    2068:	e24dd01c 	sub	sp, sp, #28
    206c:	e50b0010 	str	r0, [fp, #-16]
    2070:	e50b1014 	str	r1, [fp, #-20]
    2074:	e50b2018 	str	r2, [fp, #-24]
    2078:	e51b3010 	ldr	r3, [fp, #-16]
    207c:	e50b3008 	str	r3, [fp, #-8]
    2080:	ea00000d 	b	20bc <memscan+0x5c>
    2084:	e51b3008 	ldr	r3, [fp, #-8]
    2088:	e5d33000 	ldrb	r3, [r3]
    208c:	e1a02003 	mov	r2, r3
    2090:	e51b3014 	ldr	r3, [fp, #-20]
    2094:	e1520003 	cmp	r2, r3
    2098:	1a000001 	bne	20a4 <memscan+0x44>
    209c:	e51b3008 	ldr	r3, [fp, #-8]
    20a0:	ea000009 	b	20cc <memscan+0x6c>
    20a4:	e51b3008 	ldr	r3, [fp, #-8]
    20a8:	e2833001 	add	r3, r3, #1
    20ac:	e50b3008 	str	r3, [fp, #-8]
    20b0:	e51b3018 	ldr	r3, [fp, #-24]
    20b4:	e2433001 	sub	r3, r3, #1
    20b8:	e50b3018 	str	r3, [fp, #-24]
    20bc:	e51b3018 	ldr	r3, [fp, #-24]
    20c0:	e3530000 	cmp	r3, #0
    20c4:	1affffee 	bne	2084 <memscan+0x24>
    20c8:	e51b3008 	ldr	r3, [fp, #-8]
    20cc:	e1a00003 	mov	r0, r3
    20d0:	e28bd000 	add	sp, fp, #0
    20d4:	e8bd0800 	pop	{fp}
    20d8:	e12fff1e 	bx	lr

000020dc <strstr>:
    20dc:	e92d4800 	push	{fp, lr}
    20e0:	e28db004 	add	fp, sp, #4
    20e4:	e24dd010 	sub	sp, sp, #16
    20e8:	e50b0010 	str	r0, [fp, #-16]
    20ec:	e50b1014 	str	r1, [fp, #-20]
    20f0:	e51b0014 	ldr	r0, [fp, #-20]
    20f4:	ebfffe9a 	bl	1b64 <strlen>
    20f8:	e1a03000 	mov	r3, r0
    20fc:	e50b3008 	str	r3, [fp, #-8]
    2100:	e51b3008 	ldr	r3, [fp, #-8]
    2104:	e3530000 	cmp	r3, #0
    2108:	1a000001 	bne	2114 <strstr+0x38>
    210c:	e51b3010 	ldr	r3, [fp, #-16]
    2110:	ea000018 	b	2178 <strstr+0x9c>
    2114:	e51b0010 	ldr	r0, [fp, #-16]
    2118:	ebfffe91 	bl	1b64 <strlen>
    211c:	e1a03000 	mov	r3, r0
    2120:	e50b300c 	str	r3, [fp, #-12]
    2124:	ea00000e 	b	2164 <strstr+0x88>
    2128:	e51b300c 	ldr	r3, [fp, #-12]
    212c:	e2433001 	sub	r3, r3, #1
    2130:	e50b300c 	str	r3, [fp, #-12]
    2134:	e51b0010 	ldr	r0, [fp, #-16]
    2138:	e51b1014 	ldr	r1, [fp, #-20]
    213c:	e51b2008 	ldr	r2, [fp, #-8]
    2140:	ebffff9c 	bl	1fb8 <memcmp>
    2144:	e1a03000 	mov	r3, r0
    2148:	e3530000 	cmp	r3, #0
    214c:	1a000001 	bne	2158 <strstr+0x7c>
    2150:	e51b3010 	ldr	r3, [fp, #-16]
    2154:	ea000007 	b	2178 <strstr+0x9c>
    2158:	e51b3010 	ldr	r3, [fp, #-16]
    215c:	e2833001 	add	r3, r3, #1
    2160:	e50b3010 	str	r3, [fp, #-16]
    2164:	e51b200c 	ldr	r2, [fp, #-12]
    2168:	e51b3008 	ldr	r3, [fp, #-8]
    216c:	e1520003 	cmp	r2, r3
    2170:	aaffffec 	bge	2128 <strstr+0x4c>
    2174:	e3a03000 	mov	r3, #0
    2178:	e1a00003 	mov	r0, r3
    217c:	e24bd004 	sub	sp, fp, #4
    2180:	e8bd4800 	pop	{fp, lr}
    2184:	e12fff1e 	bx	lr

00002188 <memchr>:
    2188:	e52db004 	push	{fp}		; (str fp, [sp, #-4]!)
    218c:	e28db000 	add	fp, sp, #0
    2190:	e24dd01c 	sub	sp, sp, #28
    2194:	e50b0010 	str	r0, [fp, #-16]
    2198:	e50b1014 	str	r1, [fp, #-20]
    219c:	e50b2018 	str	r2, [fp, #-24]
    21a0:	e51b3010 	ldr	r3, [fp, #-16]
    21a4:	e50b3008 	str	r3, [fp, #-8]
    21a8:	ea00000f 	b	21ec <memchr+0x64>
    21ac:	e51b3014 	ldr	r3, [fp, #-20]
    21b0:	e20320ff 	and	r2, r3, #255	; 0xff
    21b4:	e51b3008 	ldr	r3, [fp, #-8]
    21b8:	e5d33000 	ldrb	r3, [r3]
    21bc:	e1520003 	cmp	r2, r3
    21c0:	13a03000 	movne	r3, #0
    21c4:	03a03001 	moveq	r3, #1
    21c8:	e20330ff 	and	r3, r3, #255	; 0xff
    21cc:	e51b2008 	ldr	r2, [fp, #-8]
    21d0:	e2822001 	add	r2, r2, #1
    21d4:	e50b2008 	str	r2, [fp, #-8]
    21d8:	e3530000 	cmp	r3, #0
    21dc:	0a000002 	beq	21ec <memchr+0x64>
    21e0:	e51b3008 	ldr	r3, [fp, #-8]
    21e4:	e2433001 	sub	r3, r3, #1
    21e8:	ea00000a 	b	2218 <memchr+0x90>
    21ec:	e51b3018 	ldr	r3, [fp, #-24]
    21f0:	e3530000 	cmp	r3, #0
    21f4:	03a03000 	moveq	r3, #0
    21f8:	13a03001 	movne	r3, #1
    21fc:	e20330ff 	and	r3, r3, #255	; 0xff
    2200:	e51b2018 	ldr	r2, [fp, #-24]
    2204:	e2422001 	sub	r2, r2, #1
    2208:	e50b2018 	str	r2, [fp, #-24]
    220c:	e3530000 	cmp	r3, #0
    2210:	1affffe5 	bne	21ac <memchr+0x24>
    2214:	e3a03000 	mov	r3, #0
    2218:	e1a00003 	mov	r0, r3
    221c:	e28bd000 	add	sp, fp, #0
    2220:	e8bd0800 	pop	{fp}
    2224:	e12fff1e 	bx	lr

00002228 <mem_init>:
    2228:	e52db004 	push	{fp}		; (str fp, [sp, #-4]!)
    222c:	e28db000 	add	fp, sp, #0
    2230:	e24dd014 	sub	sp, sp, #20
    2234:	e50b0010 	str	r0, [fp, #-16]
    2238:	e50b1014 	str	r1, [fp, #-20]
    223c:	e59f30bc 	ldr	r3, [pc, #188]	; 2300 <mem_init+0xd8>
    2240:	e51b2014 	ldr	r2, [fp, #-20]
    2244:	e5832000 	str	r2, [r3]
    2248:	e3a03000 	mov	r3, #0
    224c:	e50b3008 	str	r3, [fp, #-8]
    2250:	ea000006 	b	2270 <mem_init+0x48>
    2254:	e51b3008 	ldr	r3, [fp, #-8]
    2258:	e59f20a4 	ldr	r2, [pc, #164]	; 2304 <mem_init+0xdc>
    225c:	e3a01064 	mov	r1, #100	; 0x64
    2260:	e7c21003 	strb	r1, [r2, r3]
    2264:	e51b3008 	ldr	r3, [fp, #-8]
    2268:	e2833001 	add	r3, r3, #1
    226c:	e50b3008 	str	r3, [fp, #-8]
    2270:	e51b2008 	ldr	r2, [fp, #-8]
    2274:	e59f308c 	ldr	r3, [pc, #140]	; 2308 <mem_init+0xe0>
    2278:	e1520003 	cmp	r2, r3
    227c:	dafffff4 	ble	2254 <mem_init+0x2c>
    2280:	e51b3010 	ldr	r3, [fp, #-16]
    2284:	e2433601 	sub	r3, r3, #1048576	; 0x100000
    2288:	e1a03643 	asr	r3, r3, #12
    228c:	e50b3008 	str	r3, [fp, #-8]
    2290:	e51b2014 	ldr	r2, [fp, #-20]
    2294:	e51b3010 	ldr	r3, [fp, #-16]
    2298:	e0633002 	rsb	r3, r3, r2
    229c:	e50b3014 	str	r3, [fp, #-20]
    22a0:	e51b3014 	ldr	r3, [fp, #-20]
    22a4:	e1a03643 	asr	r3, r3, #12
    22a8:	e50b3014 	str	r3, [fp, #-20]
    22ac:	ea000006 	b	22cc <mem_init+0xa4>
    22b0:	e51b3008 	ldr	r3, [fp, #-8]
    22b4:	e59f2048 	ldr	r2, [pc, #72]	; 2304 <mem_init+0xdc>
    22b8:	e3a01000 	mov	r1, #0
    22bc:	e7c21003 	strb	r1, [r2, r3]
    22c0:	e51b3008 	ldr	r3, [fp, #-8]
    22c4:	e2833001 	add	r3, r3, #1
    22c8:	e50b3008 	str	r3, [fp, #-8]
    22cc:	e51b3014 	ldr	r3, [fp, #-20]
    22d0:	e3530000 	cmp	r3, #0
    22d4:	d3a03000 	movle	r3, #0
    22d8:	c3a03001 	movgt	r3, #1
    22dc:	e20330ff 	and	r3, r3, #255	; 0xff
    22e0:	e51b2014 	ldr	r2, [fp, #-20]
    22e4:	e2422001 	sub	r2, r2, #1
    22e8:	e50b2014 	str	r2, [fp, #-20]
    22ec:	e3530000 	cmp	r3, #0
    22f0:	1affffee 	bne	22b0 <mem_init+0x88>
    22f4:	e28bd000 	add	sp, fp, #0
    22f8:	e8bd0800 	pop	{fp}
    22fc:	e12fff1e 	bx	lr
    2300:	000023e4 	andeq	r2, r0, r4, ror #7
    2304:	000023e8 	andeq	r2, r0, r8, ror #7
    2308:	00000eff 	strdeq	r0, [r0], -pc

0000230c <app1>:
    230c:	e92d4800 	push	{fp, lr}
    2310:	e28db004 	add	fp, sp, #4
    2314:	e59f000c 	ldr	r0, [pc, #12]	; 2328 <app1+0x1c>
    2318:	ebfffb54 	bl	1070 <uprintf>
    231c:	e24bd004 	sub	sp, fp, #4
    2320:	e8bd4800 	pop	{fp, lr}
    2324:	e12fff1e 	bx	lr
    2328:	000023b8 	undefined instruction 0x000023b8

0000232c <app2>:
    232c:	e92d4800 	push	{fp, lr}
    2330:	e28db004 	add	fp, sp, #4
    2334:	e59f000c 	ldr	r0, [pc, #12]	; 2348 <app2+0x1c>
    2338:	ebfffb4c 	bl	1070 <uprintf>
    233c:	e24bd004 	sub	sp, fp, #4
    2340:	e8bd4800 	pop	{fp, lr}
    2344:	e12fff1e 	bx	lr
    2348:	000023c8 	andeq	r2, r0, r8, asr #7

0000234c <_ld_start>:
    234c:	e92d5fff 	push	{r0, r1, r2, r3, r4, r5, r6, r7, r8, r9, sl, fp, ip, lr}
    2350:	e1a0e00f 	mov	lr, pc
    2354:	e3a0f603 	mov	pc, #3145728	; 0x300000
    2358:	ee0d0f10 	mcr	15, 0, r0, cr13, cr0, {0}
    235c:	e8bd9fff 	pop	{r0, r1, r2, r3, r4, r5, r6, r7, r8, r9, sl, fp, ip, pc}

Disassembly of section .rodata:

00002360 <.rodata>:
    2360:	253d2069 	ldrcs	r2, [sp, #-105]!	; 0x69
    2364:	203a2063 	eorscs	r2, sl, r3, rrx
    2368:	000a6425 	andeq	r6, sl, r5, lsr #8
    236c:	0064656c 	rsbeq	r6, r4, ip, ror #10
    2370:	20646d63 	rsbcs	r6, r4, r3, ror #26
    2374:	69207325 	stmdbvs	r0!, {r0, r2, r5, r8, r9, ip, sp, lr}
    2378:	6f6e2073 	svcvs	0x006e2073
    237c:	75732074 	ldrbvc	r2, [r3, #-116]!	; 0x74
    2380:	726f7070 	rsbvc	r7, pc, #112	; 0x70
    2384:	0a646574 	beq	191b95c <bss_end+0x1918674>
    2388:	00000000 	andeq	r0, r0, r0
    238c:	253a4350 	ldrcs	r4, [sl, #-848]!	; 0x350
    2390:	00000a78 	andeq	r0, r0, r8, ror sl
    2394:	6d65645b 	cfstrdvs	mvd6, [r5, #-364]!	; 0xfffffe94
    2398:	6c656e6f 	stclvs	14, cr6, [r5], #-444	; 0xfffffe44
    239c:	614d4066 	cmpvs	sp, r6, rrx
    23a0:	78654864 	stmdavc	r5!, {r2, r5, r6, fp, lr}^
    23a4:	20235d20 	eorcs	r5, r3, r0, lsr #26
    23a8:	00000000 	andeq	r0, r0, r0
    23ac:	6c6c6568 	cfstr64vs	mvdx6, [ip], #-416	; 0xfffffe60
    23b0:	7269206f 	rsbvc	r2, r9, #111	; 0x6f
    23b4:	000a0d71 	andeq	r0, sl, r1, ror sp
    23b8:	6d612069 	stclvs	0, cr2, [r1, #-420]!	; 0xfffffe5c
    23bc:	73617420 	cmnvc	r1, #536870912	; 0x20000000
    23c0:	0a31206b 	beq	c4a574 <bss_end+0xc4728c>
    23c4:	00000000 	andeq	r0, r0, r0
    23c8:	6d612069 	stclvs	0, cr2, [r1, #-420]!	; 0xfffffe5c
    23cc:	73617420 	cmnvc	r1, #536870912	; 0x20000000
    23d0:	0a32206b 	beq	c8a584 <bss_end+0xc8729c>
    23d4:	00000000 	andeq	r0, r0, r0

Disassembly of section .bss:

000023d8 <memory_end>:
    23d8:	00000000 	andeq	r0, r0, r0

000023dc <buffer_memory_end>:
    23dc:	00000000 	andeq	r0, r0, r0

000023e0 <main_memory_start>:
    23e0:	00000000 	andeq	r0, r0, r0

000023e4 <HIGH_MEMORY>:
    23e4:	00000000 	andeq	r0, r0, r0

000023e8 <mem_map>:
	...

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
   0:	3a434347 	bcc	10d0d24 <bss_end+0x10cda3c>
   4:	74632820 	strbtvc	r2, [r3], #-2080	; 0x820
   8:	312d676e 	teqcc	sp, lr, ror #14
   c:	312e362e 	teqcc	lr, lr, lsr #12
  10:	2e342029 	cdpcs	0, 3, cr2, cr4, cr9, {1}
  14:	00332e34 	eorseq	r2, r3, r4, lsr lr

Disassembly of section .debug_line:

00000000 <.debug_line>:
   0:	00000090 	muleq	r0, r0, r0
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
  30:	00000000 	andeq	r0, r0, r0
  34:	2f010903 	svccs	0x00010903
  38:	2f2f2f2f 	svccs	0x002f2f2f
  3c:	31312f2f 	teqcc	r1, pc, lsr #30
  40:	31313131 	teqcc	r1, r1, lsr r1
  44:	31302f2f 	teqcc	r0, pc, lsr #30
  48:	2f2f2f34 	svccs	0x002f2f34
  4c:	2f2f2f2f 	svccs	0x002f2f2f
  50:	2f2f2f2f 	svccs	0x002f2f2f
  54:	2f2f322f 	svccs	0x002f322f
  58:	2f332f2f 	svccs	0x00332f2f
  5c:	2f322f2f 	svccs	0x00322f2f
  60:	2f352f2f 	svccs	0x00352f2f
  64:	2f2f2f2f 	svccs	0x002f2f2f
  68:	2f2f2f30 	svccs	0x002f2f30
  6c:	2f2f2f32 	svccs	0x002f2f32
  70:	4b2f332f 	blmi	bccd34 <bss_end+0xbc9a4c>
  74:	2f2f2f30 	svccs	0x002f2f30
  78:	0818032f 	ldmdaeq	r8, {r0, r1, r2, r3, r5, r8, r9}
  7c:	302f30ac 	eorcc	r3, pc, ip, lsr #1
  80:	332f2f2f 	teqcc	pc, #188	; 0xbc
  84:	2f322f30 	svccs	0x00322f30
  88:	2f312f2f 	svccs	0x00312f2f
  8c:	022f2f2f 	eoreq	r2, pc, #188	; 0xbc
  90:	01010012 	tsteq	r1, r2, lsl r0
  94:	00000052 	andeq	r0, r0, r2, asr r0
  98:	00210002 	eoreq	r0, r1, r2
  9c:	01020000 	tsteq	r2, r0
  a0:	000d0efb 	strdeq	r0, [sp], -fp
  a4:	01010101 	tsteq	r1, r1, lsl #2
  a8:	01000000 	tsteq	r0, r0
  ac:	69010000 	stmdbvs	r1, {}
  b0:	0074696e 	rsbseq	r6, r4, lr, ror #18
  b4:	756d6d00 	strbvc	r6, [sp, #-3328]!	; 0xd00
  b8:	0100632e 	tsteq	r0, lr, lsr #6
  bc:	00000000 	andeq	r0, r0, r0
  c0:	01b00205 	lslseq	r0, r5, #4
  c4:	16030000 	strne	r0, [r3], -r0
  c8:	66120301 	ldrvs	r0, [r2], -r1, lsl #6
  cc:	034c4b4d 	movteq	r4, #52045	; 0xcb4d
  d0:	4b58080a 	blmi	1602100 <bss_end+0x15fee18>
  d4:	4b5b084b 	blmi	16c2208 <bss_end+0x16bef20>
  d8:	0827034b 	stmdaeq	r7!, {r0, r1, r3, r6, r8, r9}
  dc:	4c676958 	stclmi	9, cr6, [r7], #-352	; 0xfffffea0
  e0:	30023c03 	andcc	r3, r2, r3, lsl #24
  e4:	00060201 	andeq	r0, r6, r1, lsl #4
  e8:	00860101 	addeq	r0, r6, r1, lsl #2
  ec:	00020000 	andeq	r0, r2, r0
  f0:	00000022 	andeq	r0, r0, r2, lsr #32
  f4:	0efb0102 	cdpeq	1, 15, cr0, cr11, cr2, {0}
  f8:	0101000d 	tsteq	r1, sp
  fc:	00000101 	andeq	r0, r0, r1, lsl #2
 100:	00000100 	andeq	r0, r0, r0, lsl #2
 104:	696e6901 	stmdbvs	lr!, {r0, r8, fp, sp, lr}^
 108:	6d000074 	stcvs	0, cr0, [r0, #-464]	; 0xfffffe30
 10c:	2e6e6961 	cdpcs	9, 6, cr6, cr14, cr1, {3}
 110:	00010063 	andeq	r0, r1, r3, rrx
 114:	05000000 	streq	r0, [r0]
 118:	00030402 	andeq	r0, r3, r2, lsl #8
 11c:	01170300 	tsteq	r7, r0, lsl #6
 120:	e50868a0 	str	r6, [r8, #-2208]	; 0x8a0
 124:	034c2108 	movteq	r2, #49416	; 0xc108
 128:	85c22e7a 	strbhi	r2, [r2, #3706]	; 0xe7a
 12c:	8384d79f 	orrhi	sp, r4, #41680896	; 0x27c0000
 130:	4b4b69a0 	blmi	12da7b8 <bss_end+0x12d74d0>
 134:	8630304d 	ldrthi	r3, [r0], -sp, asr #32
 138:	08d9a04b 	ldmeq	r9, {r0, r1, r3, r6, sp, pc}^
 13c:	102402e6 	eorne	r0, r4, r6, ror #5
 140:	14240232 	strtne	r0, [r4], #-562	; 0x232
 144:	03673d08 	cmneq	r7, #512	; 0x200
 148:	0f034a75 	svceq	0x00034a75
 14c:	3e085808 	cdpcc	8, 0, cr5, cr8, cr8, {0}
 150:	4ba4bb67 	blmi	fe92eef4 <bss_end+0xfe92bc0c>
 154:	12036783 	andne	r6, r3, #34340864	; 0x20c0000
 158:	4b4b69ba 	blmi	12da848 <bss_end+0x12d7560>
 15c:	83bb674d 	undefined instruction 0x83bb674d
 160:	83838367 	orrhi	r8, r3, #-1677721599	; 0x9c000001
 164:	d7866784 	strle	r6, [r6, r4, lsl #15]
 168:	4b312f2f 	blmi	c4be2c <bss_end+0xc48b44>
 16c:	029e1703 	addseq	r1, lr, #786432	; 0xc0000
 170:	0101000a 	tsteq	r1, sl
 174:	00000094 	muleq	r0, r4, r0
 178:	00220002 	eoreq	r0, r2, r2
 17c:	01020000 	tsteq	r2, r0
 180:	000d0efb 	strdeq	r0, [sp], -fp
 184:	01010101 	tsteq	r1, r1, lsl #2
 188:	01000000 	tsteq	r0, r0
 18c:	69010000 	stmdbvs	r1, {}
 190:	0074696e 	rsbseq	r6, r4, lr, ror #18
 194:	6e616e00 	cdpvs	14, 6, cr6, cr1, cr0, {0}
 198:	00632e64 	rsbeq	r2, r3, r4, ror #28
 19c:	00000001 	andeq	r0, r0, r1
 1a0:	84020500 	strhi	r0, [r2], #-1280	; 0x500
 1a4:	03000007 	movweq	r0, #7
 1a8:	9f4b010e 	svcls	0x004b010e
 1ac:	859f4b85 	ldrhi	r4, [pc, #2949]	; d39 <uputs+0x25>
 1b0:	8385d74b 	orrhi	sp, r5, #19660800	; 0x12c0000
 1b4:	83838683 	orrhi	r8, r3, #137363456	; 0x8300000
 1b8:	86bb4b86 	ldrthi	r4, [fp], r6, lsl #23
 1bc:	4d31314c 	ldfmis	f3, [r1, #-304]!	; 0xfffffed0
 1c0:	4b6a2f31 	blmi	1a8be8c <bss_end+0x1a88ba4>
 1c4:	a22f6868 	eorge	r6, pc, #6815744	; 0x680000
 1c8:	31314c9f 	undefined instruction 0x31314c9f
 1cc:	834d4b4d 	movthi	r4, #56141	; 0xdb4d
 1d0:	314da19f 	undefined instruction 0x314da19f
 1d4:	30dcd468 	sbcscc	sp, ip, r8, ror #8
 1d8:	4c4b9fa1 	mcrrmi	15, 10, r9, fp, cr1
 1dc:	4b4d3131 	blmi	134c6a8 <bss_end+0x13493c0>
 1e0:	a09f834d 	addsge	r8, pc, sp, asr #6
 1e4:	4cdbb868 	ldclmi	8, cr11, [fp], {104}	; 0x68
 1e8:	30854d31 	addcc	r4, r5, r1, lsr sp
 1ec:	4bbbbd2f 	blmi	feeef6b0 <bss_end+0xfeeec3c8>
 1f0:	67678385 	strbvs	r8, [r7, -r5, lsl #7]!
 1f4:	6e667a03 	vmulvs.f32	s15, s12, s6
 1f8:	314c8369 	cmpcc	ip, r9, ror #6
 1fc:	9f834d31 	svcls	0x00834d31
 200:	4d314da1 	ldcmi	13, cr4, [r1, #-644]!	; 0xfffffd7c
 204:	02303084 	eorseq	r3, r0, #132	; 0x84
 208:	0101000a 	tsteq	r1, sl
 20c:	0000003a 	andeq	r0, r0, sl, lsr r0
 210:	00240002 	eoreq	r0, r4, r2
 214:	01020000 	tsteq	r2, r0
 218:	000d0efb 	strdeq	r0, [sp], -fp
 21c:	01010101 	tsteq	r1, r1, lsl #2
 220:	01000000 	tsteq	r0, r0
 224:	6b010000 	blvs	4022c <bss_end+0x3cf44>
 228:	656e7265 	strbvs	r7, [lr, #-613]!	; 0x265
 22c:	7400006c 	strvc	r0, [r0], #-108	; 0x6c
 230:	2e706172 	mrccs	1, 3, r6, cr0, cr2, {3}
 234:	00010063 	andeq	r0, r1, r3, rrx
 238:	05000000 	streq	r0, [r0]
 23c:	000bfc02 	andeq	pc, fp, r2, lsl #24
 240:	01130300 	tsteq	r3, r0, lsl #6
 244:	0006024c 	andeq	r0, r6, ip, asr #4
 248:	00fc0101 	rscseq	r0, ip, r1, lsl #2
 24c:	00020000 	andeq	r0, r2, r0
 250:	0000007f 	andeq	r0, r0, pc, ror r0
 254:	0efb0102 	cdpeq	1, 15, cr0, cr11, cr2, {0}
 258:	0101000d 	tsteq	r1, sp
 25c:	00000101 	andeq	r0, r0, r1, lsl #2
 260:	00000100 	andeq	r0, r0, r0, lsl #2
 264:	72656b01 	rsbvc	r6, r5, #1024	; 0x400
 268:	006c656e 	rsbeq	r6, ip, lr, ror #10
 26c:	74706f2f 	ldrbtvc	r6, [r0], #-3887	; 0xf2f
 270:	6972462f 	ldmdbvs	r2!, {r0, r1, r2, r3, r5, r9, sl, lr}^
 274:	6c646e65 	stclvs	14, cr6, [r4], #-404	; 0xfffffe6c
 278:	4d524179 	ldfmie	f4, [r2, #-484]	; 0xfffffe1c
 27c:	6f6f742f 	svcvs	0x006f742f
 280:	6863736c 	stmdavs	r3!, {r2, r3, r5, r6, r8, r9, ip, sp, lr}^
 284:	2f6e6961 	svccs	0x006e6961
 288:	2e342e34 	mrccs	14, 1, r2, cr4, cr4, {1}
 28c:	696c2f33 	stmdbvs	ip!, {r0, r1, r4, r5, r8, r9, sl, fp, sp}^
 290:	63672f62 	cmnvs	r7, #392	; 0x188
 294:	72612f63 	rsbvc	r2, r1, #396	; 0x18c
 298:	6f6e2d6d 	svcvs	0x006e2d6d
 29c:	6c2d656e 	cfstr32vs	mvfx6, [sp], #-440	; 0xfffffe48
 2a0:	78756e69 	ldmdavc	r5!, {r0, r3, r5, r6, r9, sl, fp, sp, lr}^
 2a4:	756e672d 	strbvc	r6, [lr, #-1837]!	; 0x72d
 2a8:	69626165 	stmdbvs	r2!, {r0, r2, r5, r6, r8, sp, lr}^
 2ac:	342e342f 	strtcc	r3, [lr], #-1071	; 0x42f
 2b0:	692f332e 	stmdbvs	pc!, {r1, r2, r3, r5, r8, r9, ip, sp}
 2b4:	756c636e 	strbvc	r6, [ip, #-878]!	; 0x36e
 2b8:	00006564 	andeq	r6, r0, r4, ror #10
 2bc:	74726175 	ldrbtvc	r6, [r2], #-373	; 0x175
 2c0:	0100632e 	tsteq	r0, lr, lsr #6
 2c4:	74730000 	ldrbtvc	r0, [r3]
 2c8:	67726164 	ldrbvs	r6, [r2, -r4, ror #2]!
 2cc:	0200682e 	andeq	r6, r0, #3014656	; 0x2e0000
 2d0:	00000000 	andeq	r0, r0, r0
 2d4:	0c100205 	lfmeq	f0, 4, [r0], {5}	; (ldceq 2, cr0, [r0], {5})
 2d8:	23030000 	movwcs	r0, #12288	; 0x3000
 2dc:	679f4b01 	ldrvs	r4, [pc, r1, lsl #22]
 2e0:	67676767 	strbvs	r6, [r7, -r7, ror #14]!
 2e4:	a1a0c067 	rrxge	ip, r7
 2e8:	a14ca467 	cmpge	ip, r7, ror #8
 2ec:	3083bd67 	addcc	fp, r3, r7, ror #26
 2f0:	836986d4 	cmnhi	r9, #222298112	; 0xd400000
 2f4:	83672f4d 	cmnhi	r7, #308	; 0x134
 2f8:	4b67c063 	blmi	19f048c <bss_end+0x19ed1a4>
 2fc:	a1862f4b 	orrge	r2, r6, fp, asr #30
 300:	3083bb67 	addcc	fp, r3, r7, ror #22
 304:	75082108 	strvc	r2, [r8, #-264]	; 0x108
 308:	bb132402 	bllt	4c9318 <bss_end+0x4c6030>
 30c:	6767a185 	strbvs	sl, [r7, -r5, lsl #3]!
 310:	3083bbd8 	ldrdcc	fp, [r3], r8
 314:	f37508f3 	vceq.i<illegal width 64>	q8, <illegal reg q10.5>, <illegal reg q9.5>
 318:	9108ae08 	tstls	r8, r8, lsl #28
 31c:	4b896abb 	blmi	fe25ae10 <bss_end+0xfe257b28>
 320:	0267832f 	rsbeq	r8, r7, #-1140850688	; 0xbc000000
 324:	679f1438 	undefined instruction 0x679f1438
 328:	304b9f30 	subcc	r9, fp, r0, lsr pc
 32c:	684b679f 	stmdavs	fp, {r0, r1, r2, r3, r4, r7, r8, r9, sl, sp, lr}^
 330:	9f4c6783 	svcls	0x004c6783
 334:	83838883 	orrhi	r8, r3, #8585216	; 0x830000
 338:	03667803 	cmneq	r6, #196608	; 0x30000
 33c:	5e032e0a 	cdppl	14, 0, cr2, cr3, cr10, {0}
 340:	82270366 	eorhi	r0, r7, #-1744830463	; 0x98000001
 344:	000a022f 	andeq	r0, sl, pc, lsr #4
 348:	00580101 	subseq	r0, r8, r1, lsl #2
 34c:	00020000 	andeq	r0, r2, r0
 350:	00000025 	andeq	r0, r0, r5, lsr #32
 354:	0efb0102 	cdpeq	1, 15, cr0, cr11, cr2, {0}
 358:	0101000d 	tsteq	r1, sp
 35c:	00000101 	andeq	r0, r0, r1, lsl #2
 360:	00000100 	andeq	r0, r0, r0, lsl #2
 364:	72656b01 	rsbvc	r6, r5, #1024	; 0x400
 368:	006c656e 	rsbeq	r6, ip, lr, ror #10
 36c:	68637300 	stmdavs	r3!, {r8, r9, ip, sp, lr}^
 370:	632e6465 	teqvs	lr, #1694498816	; 0x65000000
 374:	00000100 	andeq	r0, r0, r0, lsl #2
 378:	02050000 	andeq	r0, r5, #0
 37c:	0000124c 	andeq	r1, r0, ip, asr #4
 380:	03011303 	movweq	r1, #4867	; 0x1303
 384:	4b4d8211 	blmi	1360bd0 <bss_end+0x135d8e8>
 388:	89855a08 	stmibhi	r5, {r3, r9, fp, ip, lr}
 38c:	82120369 	andshi	r0, r2, #-1543503871	; 0xa4000001
 390:	6784674e 	strvs	r6, [r4, lr, asr #14]
 394:	838af44b 	orrhi	pc, sl, #1258291200	; 0x4b000000
 398:	4e6d4d84 	cdpmi	13, 6, cr4, cr13, cr4, {4}
 39c:	4b4b4d69 	blmi	12d3948 <bss_end+0x12d0660>
 3a0:	0002024b 	andeq	r0, r2, fp, asr #4
 3a4:	00490101 	subeq	r0, r9, r1, lsl #2
 3a8:	00020000 	andeq	r0, r2, r0
 3ac:	00000023 	andeq	r0, r0, r3, lsr #32
 3b0:	0efb0102 	cdpeq	1, 15, cr0, cr11, cr2, {0}
 3b4:	0101000d 	tsteq	r1, sp
 3b8:	00000101 	andeq	r0, r0, r1, lsl #2
 3bc:	00000100 	andeq	r0, r0, r0, lsl #2
 3c0:	72656b01 	rsbvc	r6, r5, #1024	; 0x400
 3c4:	006c656e 	rsbeq	r6, ip, lr, ror #10
 3c8:	64656c00 	strbtvs	r6, [r5], #-3072	; 0xc00
 3cc:	0100632e 	tsteq	r0, lr, lsr #6
 3d0:	00000000 	andeq	r0, r0, r0
 3d4:	13a80205 	undefined instruction 0x13a80205
 3d8:	16030000 	strne	r0, [r3], -r0
 3dc:	9f9f4e01 	svcls	0x009f4e01
 3e0:	a0a04b88 	adcge	r4, r0, r8, lsl #23
 3e4:	69674b85 	stmdbvs	r7!, {r0, r2, r7, r8, r9, fp, lr}^
 3e8:	85674ba1 	strbhi	r4, [r7, #-2977]!	; 0xba1
 3ec:	0802674b 	stmdaeq	r2, {r0, r1, r3, r6, r8, r9, sl, sp, lr}
 3f0:	13010100 	movwne	r0, #4352	; 0x1100
 3f4:	02000001 	andeq	r0, r0, #1
 3f8:	00002000 	andeq	r2, r0, r0
 3fc:	fb010200 	blx	40c06 <bss_end+0x3d91e>
 400:	01000d0e 	tsteq	r0, lr, lsl #26
 404:	00010101 	andeq	r0, r1, r1, lsl #2
 408:	00010000 	andeq	r0, r1, r0
 40c:	696c0100 	stmdbvs	ip!, {r8}^
 410:	6c000062 	stcvs	0, cr0, [r0], {98}	; 0x62
 414:	632e6269 	teqvs	lr, #-1879048186	; 0x90000006
 418:	00000100 	andeq	r0, r0, r0, lsl #2
 41c:	02050000 	andeq	r0, r5, #0
 420:	000014a4 	andeq	r1, r0, r4, lsr #9
 424:	85011203 	strhi	r1, [r1, #-515]	; 0x203
 428:	db3b0867 	blle	ec25cc <bss_end+0xebf2e4>
 42c:	67848386 	strvs	r8, [r4, r6, lsl #7]
 430:	872fda65 	strhi	sp, [pc, -r5, ror #20]!
 434:	672fbc83 	strvs	fp, [pc, -r3, lsl #25]!
 438:	67678664 	strbvs	r8, [r7, -r4, ror #12]!
 43c:	db645908 	blle	1916864 <bss_end+0x191357c>
 440:	4c83852f 	cfstr32mi	mvfx8, [r3], {47}	; 0x2f
 444:	08bc304b 	ldmeq	ip!, {r0, r1, r3, r6, ip, sp}
 448:	7903333a 	stmdbvc	r3, {r1, r3, r4, r5, r8, r9, ip, sp}
 44c:	0809034a 	stmdaeq	r9, {r1, r3, r6, r8, r9}
 450:	9f872f90 	svcls	0x00872f90
 454:	1424024c 	strtne	r0, [r4], #-588	; 0x24c
 458:	4cbb842f 	cfldrsmi	mvf8, [fp], #188	; 0xbc
 45c:	2f153802 	svccs	0x00153802
 460:	2f4c9f84 	svccs	0x004c9f84
 464:	24028465 	strcs	r8, [r2], #-1125	; 0x465
 468:	bb842f15 	bllt	fe10c0c4 <bss_end+0xfe108ddc>
 46c:	652f674c 	strvs	r6, [pc, #-1868]!	; fffffd28 <bss_end+0xffffca40>
 470:	67bb2f84 	ldrvs	r2, [fp, r4, lsl #31]!
 474:	1a24022b 	bne	900d28 <bss_end+0x8fda40>
 478:	2cc0842f 	cfstrdcs	mvd8, [r0], {47}	; 0x2f
 47c:	4b163a02 	blmi	58ec8c <bss_end+0x58b9a4>
 480:	2f30bb84 	svccs	0x0030bb84
 484:	63143a02 	tstvs	r4, #8192	; 0x2000
 488:	9f844b6c 	svcls	0x00844b6c
 48c:	0848832f 	stmdaeq	r8, {r0, r1, r2, r3, r5, r8, r9, pc}^
 490:	85842f23 	strhi	r2, [r4, #3875]	; 0xf23
 494:	84673e08 	strbthi	r3, [r7], #-3592	; 0xe08
 498:	142802a1 	strtne	r0, [r8], #-673	; 0x2a1
 49c:	4ca18467 	cfstrsmi	mvf8, [r1], #412	; 0x19c
 4a0:	f4b96767 	undefined instruction 0xf4b96767
 4a4:	034b8330 	movteq	r8, #45872	; 0xb330
 4a8:	0a036679 	beq	d9e94 <bss_end+0xd6bac>
 4ac:	a1842fd6 	ldrdge	r2, [r4, r6]
 4b0:	48bb6767 	ldmmi	fp!, {r0, r1, r2, r5, r6, r8, r9, sl, sp, lr}
 4b4:	842fdcd5 	strthi	sp, [pc], #3285	; 4bc <init+0x9c>
 4b8:	d52f4cbb 	strle	r4, [pc, #-3259]!	; fffff805 <bss_end+0xffffc51d>
 4bc:	842f3f08 	strthi	r3, [pc], #3848	; 4c4 <init+0xa4>
 4c0:	082f84bb 	stmdaeq	pc!, {r0, r1, r3, r4, r5, r7, sl, pc}
 4c4:	2f3f083b 	svccs	0x003f083b
 4c8:	4b83bd84 	blmi	fe0efae0 <bss_end+0xfe0ec7f8>
 4cc:	3b082f4b 	blcc	20c200 <bss_end+0x208f18>
 4d0:	83835c08 	orrhi	r5, r3, #2048	; 0x800
 4d4:	083b082f 	ldmdaeq	fp!, {r0, r1, r2, r3, r5, fp}
 4d8:	bc842f40 	stclt	15, cr2, [r4], {64}	; 0x40
 4dc:	3b089f4c 	blcc	228214 <bss_end+0x224f2c>
 4e0:	2f2f9208 	svccs	0x002f9208
 4e4:	2f4cbb84 	svccs	0x004cbb84
 4e8:	62674bbb 	rsbvs	r4, r7, #191488	; 0x2ec00
 4ec:	a1842f6c 	orrge	r2, r4, ip, ror #30
 4f0:	834b6783 	movthi	r6, #46979	; 0xb783
 4f4:	4bd7672f 	blmi	ff5da1b8 <bss_end+0xff5d6ed0>
 4f8:	842f8862 	strthi	r8, [pc], #2146	; 500 <init+0xe0>
 4fc:	082f4bbb 	stmdaeq	pc!, {r0, r1, r3, r4, r5, r7, r8, r9, fp, lr}
 500:	41086491 	undefined instruction 0x41086491
 504:	0008022f 	andeq	r0, r8, pc, lsr #4
 508:	00430101 	subeq	r0, r3, r1, lsl #2
 50c:	00020000 	andeq	r0, r2, r0
 510:	00000022 	andeq	r0, r0, r2, lsr #32
 514:	0efb0102 	cdpeq	1, 15, cr0, cr11, cr2, {0}
 518:	0101000d 	tsteq	r1, sp
 51c:	00000101 	andeq	r0, r0, r1, lsl #2
 520:	00000100 	andeq	r0, r0, r0, lsl #2
 524:	006d6d01 	rsbeq	r6, sp, r1, lsl #26
 528:	6d656d00 	stclvs	13, cr6, [r5]
 52c:	2e79726f 	cdpcs	2, 7, cr7, cr9, cr15, {3}
 530:	00010063 	andeq	r0, r1, r3, rrx
 534:	05000000 	streq	r0, [r0]
 538:	00222802 	eoreq	r2, r2, r2, lsl #16
 53c:	01210300 	teqeq	r1, r0, lsl #6
 540:	816767a1 	cmnhi	r7, r1, lsr #15
 544:	678383d8 	undefined instruction 0x678383d8
 548:	3e08d52f 	cfsh32cc	mvfx13, mvfx8, #31
 54c:	01000c02 	tsteq	r0, r2, lsl #24
 550:	00003b01 	andeq	r3, r0, r1, lsl #22
 554:	21000200 	tstcs	r0, r0, lsl #4
 558:	02000000 	andeq	r0, r0, #0
 55c:	0d0efb01 	vstreq	d15, [lr, #-4]
 560:	01010100 	tsteq	r1, r0, lsl #2
 564:	00000001 	andeq	r0, r0, r1
 568:	01000001 	tsteq	r0, r1
 56c:	00707061 	rsbseq	r7, r0, r1, rrx
 570:	70706100 	rsbsvc	r6, r0, r0, lsl #2
 574:	00632e31 	rsbeq	r2, r3, r1, lsr lr
 578:	00000001 	andeq	r0, r0, r1
 57c:	0c020500 	cfstr32eq	mvfx0, [r2], {0}
 580:	03000023 	movweq	r0, #35	; 0x23
 584:	4b4b0113 	blmi	12c09d8 <bss_end+0x12bd6f0>
 588:	024b4b85 	subeq	r4, fp, #136192	; 0x21400
 58c:	01010008 	tsteq	r1, r8
 590:	0000003c 	andeq	r0, r0, ip, lsr r0
 594:	00250002 	eoreq	r0, r5, r2
 598:	01020000 	tsteq	r2, r0
 59c:	000d0efb 	strdeq	r0, [sp], -fp
 5a0:	01010101 	tsteq	r1, r1, lsl #2
 5a4:	01000000 	tsteq	r0, r0
 5a8:	61010000 	tstvs	r1, r0
 5ac:	00007070 	andeq	r7, r0, r0, ror r0
 5b0:	6c5f646c 	cfldrdvs	mvd6, [pc], {108}	; 0x6c
 5b4:	78756e69 	ldmdavc	r5!, {r0, r3, r5, r6, r9, sl, fp, sp, lr}^
 5b8:	0100532e 	tsteq	r0, lr, lsr #6
 5bc:	00000000 	andeq	r0, r0, r0
 5c0:	234c0205 	movtcs	r0, #49669	; 0xc205
 5c4:	2f150000 	svccs	0x00150000
 5c8:	022f302f 	eoreq	r3, pc, #47	; 0x2f
 5cc:	01010002 	tsteq	r1, r2

Disassembly of section .debug_info:

00000000 <.debug_info>:
       0:	00000061 	andeq	r0, r0, r1, rrx
       4:	00000002 	andeq	r0, r0, r2
       8:	01040000 	tsteq	r4, r0
	...
      14:	000001b0 	undefined instruction 0x000001b0
      18:	746f6f62 	strbtvc	r6, [pc], #3938	; 20 <Undef>
      1c:	6174732f 	cmnvs	r4, pc, lsr #6
      20:	532e7472 	teqpl	lr, #1912602624	; 0x72000000
      24:	6f682f00 	svcvs	0x00682f00
      28:	642f656d 	strtvs	r6, [pc], #1389	; 30 <Reserved>
      2c:	6e6f6d65 	cdpvs	13, 6, cr6, cr15, cr5, {3}
      30:	2f666c65 	svccs	0x00666c65
      34:	6a6f7270 	bvs	1bdc9fc <bss_end+0x1bd9714>
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
      64:	00009780 	andeq	r9, r0, r0, lsl #15
      68:	14000200 	strne	r0, [r0], #-512	; 0x200
      6c:	04000000 	streq	r0, [r0]
      70:	00005c01 	andeq	r5, r0, r1, lsl #24
      74:	00900100 	addseq	r0, r0, r0, lsl #2
      78:	00000000 	andeq	r0, r0, r0
      7c:	01b00000 	movseq	r0, r0
      80:	03040000 	movweq	r0, #16384	; 0x4000
      84:	00940000 	addseq	r0, r4, r0
      88:	01020000 	tsteq	r2, r0
      8c:	00000032 	andeq	r0, r0, r2, lsr r0
      90:	b0011601 	andlt	r1, r1, r1, lsl #12
      94:	84000001 	strhi	r0, [r0], #-1
      98:	00000002 	andeq	r0, r0, r2
      9c:	69000000 	stmdbvs	r0, {}
      a0:	03000000 	movweq	r0, #0
      a4:	00000051 	andeq	r0, r0, r1, asr r0
      a8:	00692801 	rsbeq	r2, r9, r1, lsl #16
      ac:	91020000 	tstls	r2, r0
      b0:	0083036c 	addeq	r0, r3, ip, ror #6
      b4:	28010000 	stmdacs	r1, {}
      b8:	00000069 	andeq	r0, r0, r9, rrx
      bc:	03709102 	cmneq	r0, #-2147483648	; 0x80000000
      c0:	00000044 	andeq	r0, r0, r4, asr #32
      c4:	00702901 	rsbseq	r2, r0, r1, lsl #18
      c8:	91020000 	tstls	r2, r0
      cc:	04040074 	streq	r0, [r4], #-116	; 0x74
      d0:	00007107 	andeq	r7, r0, r7, lsl #2
      d4:	69040500 	stmdbvs	r4, {r8, sl}
      d8:	06000000 	streq	r0, [r0], -r0
      dc:	00006801 	andeq	r6, r0, r1, lsl #16
      e0:	01690100 	cmneq	r9, r0, lsl #2
      e4:	00000284 	andeq	r0, r0, r4, lsl #5
      e8:	00000304 	andeq	r0, r0, r4, lsl #6
      ec:	0000002b 	andeq	r0, r0, fp, lsr #32
      f0:	62747407 	rsbsvs	r7, r4, #117440512	; 0x7000000
      f4:	696b0100 	stmdbvs	fp!, {r8}^
      f8:	02000000 	andeq	r0, r0, #0
      fc:	00007491 	muleq	r0, r1, r4
     100:	00000231 	andeq	r0, r0, r1, lsr r2
     104:	00860002 	addeq	r0, r6, r2
     108:	01040000 	tsteq	r4, r0
     10c:	0000005c 	andeq	r0, r0, ip, asr r0
     110:	0000b201 	andeq	fp, r0, r1, lsl #4
     114:	00000000 	andeq	r0, r0, r0
     118:	00030400 	andeq	r0, r3, r0, lsl #8
     11c:	00078400 	andeq	r8, r7, r0, lsl #8
     120:	0000ea00 	andeq	lr, r0, r0, lsl #20
     124:	a8010200 	stmdage	r1, {r9}
     128:	01000000 	tsteq	r0, r0
     12c:	03040117 	movweq	r0, #16663	; 0x4117
     130:	03bc0000 	undefined instruction 0x03bc0000
     134:	00560000 	subseq	r0, r6, r0
     138:	007f0000 	rsbseq	r0, pc, r0
     13c:	d7030000 	strle	r0, [r3, -r0]
     140:	01000000 	tsteq	r0, r0
     144:	00007f17 	andeq	r7, r0, r7, lsl pc
     148:	5c910200 	lfmpl	f0, 4, [r1], {0}	; (ldcpl 2, cr0, [r1], {0})
     14c:	0000be03 	andeq	fp, r0, r3, lsl #28
     150:	a0170100 	andsge	r0, r7, r0, lsl #2
     154:	02000000 	andeq	r0, r0, #0
     158:	69045891 	stmdbvs	r4, {r0, r4, r7, fp, ip, lr}
     15c:	7f190100 	svcvc	0x00190100
     160:	02000000 	andeq	r0, r0, #0
     164:	61046491 	undefined instruction 0x61046491
     168:	7f190100 	svcvc	0x00190100
     16c:	02000000 	andeq	r0, r0, #0
     170:	62046891 	andvs	r6, r4, #9502720	; 0x910000
     174:	7f190100 	svcvc	0x00190100
     178:	02000000 	andeq	r0, r0, #0
     17c:	05006c91 	streq	r6, [r0, #-3217]	; 0xc91
     180:	6e690504 	cdpvs	5, 6, cr0, cr9, cr4, {0}
     184:	99060074 	stmdbls	r6, {r2, r4, r5, r6}
     188:	96000000 	strls	r0, [r0], -r0
     18c:	07000000 	streq	r0, [r0, -r0]
     190:	00000096 	muleq	r0, r6, r0
     194:	0408000f 	streq	r0, [r8], #-15
     198:	08010907 	stmdaeq	r1, {r0, r1, r2, r8, fp}
     19c:	00000159 	andeq	r0, r0, r9, asr r1
     1a0:	0086040a 	addeq	r0, r6, sl, lsl #8
     1a4:	01020000 	tsteq	r2, r0
     1a8:	000000f7 	strdeq	r0, [r0], -r7
     1ac:	bc012401 	cfstrslt	mvf2, [r1], {1}
     1b0:	20000003 	andcs	r0, r0, r3
     1b4:	81000004 	tsthi	r0, r4
     1b8:	dc000000 	stcle	0, cr0, [r0], {0}
     1bc:	03000000 	movweq	r0, #0
     1c0:	000000d7 	ldrdeq	r0, [r0], -r7
     1c4:	007f2401 	rsbseq	r2, pc, r1, lsl #8
     1c8:	91020000 	tstls	r2, r0
     1cc:	00be0374 	adcseq	r0, lr, r4, ror r3
     1d0:	24010000 	strcs	r0, [r1]
     1d4:	000000a0 	andeq	r0, r0, r0, lsr #1
     1d8:	00709102 	rsbseq	r9, r0, r2, lsl #2
     1dc:	0221010b 	eoreq	r0, r1, #-1073741822	; 0xc0000002
     1e0:	2b010000 	blcs	401e8 <bss_end+0x3cf00>
     1e4:	00000420 	andeq	r0, r0, r0, lsr #8
     1e8:	00000630 	andeq	r0, r0, r0, lsr r6
     1ec:	000000ac 	andeq	r0, r0, ip, lsr #1
     1f0:	00000143 	andeq	r0, r0, r3, asr #2
     1f4:	00637004 	rsbeq	r7, r3, r4
     1f8:	01432d01 	cmpeq	r3, r1, lsl #26
     1fc:	5f010000 	svcpl	0x00010000
     200:	00009b0c 	andeq	r9, r0, ip, lsl #22
     204:	4a2e0100 	bmi	b8060c <bss_end+0xb7d324>
     208:	03000001 	movweq	r0, #1
     20c:	0477ec91 	ldrbteq	lr, [r7], #-3217	; 0xc91
     210:	2f010069 	svccs	0x00010069
     214:	0000007f 	andeq	r0, r0, pc, ror r0
     218:	046c9102 	strbteq	r9, [ip], #-258	; 0x102
     21c:	3001006a 	andcc	r0, r1, sl, rrx
     220:	0000007f 	andeq	r0, r0, pc, ror r0
     224:	04709102 	ldrbteq	r9, [r0], #-258	; 0x102
     228:	3101006b 	tstcc	r1, fp, rrx
     22c:	0000007f 	andeq	r0, r0, pc, ror r0
     230:	0c749102 	ldfeqp	f1, [r4], #-8
     234:	000000ee 	andeq	r0, r0, lr, ror #1
     238:	015b3201 	cmpeq	fp, r1, lsl #4
     23c:	91030000 	tstls	r3, r0
     240:	0900778c 	stmdbeq	r0, {r2, r3, r7, r8, r9, sl, ip, sp, lr}
     244:	00760704 	rsbseq	r0, r6, r4, lsl #14
     248:	99060000 	stmdbls	r6, {}
     24c:	5b000000 	blpl	254 <create_page_table+0xa4>
     250:	0d000001 	stceq	0, cr0, [r0, #-4]
     254:	00000096 	muleq	r0, r6, r0
     258:	060003ff 	undefined instruction 0x060003ff
     25c:	00000099 	muleq	r0, r9, r0
     260:	00000171 	andeq	r0, r0, r1, ror r1
     264:	00009607 	andeq	r9, r0, r7, lsl #12
     268:	96070500 	strls	r0, [r7], -r0, lsl #10
     26c:	0f000000 	svceq	0x00000000
     270:	c3010e00 	movwgt	r0, #7680	; 0x1e00
     274:	01000000 	tsteq	r0, r0
     278:	00063057 	andeq	r3, r6, r7, asr r0
     27c:	00066c00 	andeq	r6, r6, r0, lsl #24
     280:	0000d700 	andeq	sp, r0, r0, lsl #14
     284:	a3010200 	movwge	r0, #4608	; 0x1200
     288:	01000000 	tsteq	r0, r0
     28c:	066c016c 	strbteq	r0, [ip], -ip, ror #2
     290:	07840000 	streq	r0, [r4, r0]
     294:	01020000 	tsteq	r2, r0
     298:	01ed0000 	mvneq	r0, r0
     29c:	70040000 	andvc	r0, r4, r0
     2a0:	6e010063 	cdpvs	0, 0, cr0, cr1, cr3, {3}
     2a4:	00000143 	andeq	r0, r0, r3, asr #2
     2a8:	9b0c5f01 	blls	317eb4 <bss_end+0x314bcc>
     2ac:	01000000 	tsteq	r0, r0
     2b0:	00014a6f 	andeq	r4, r1, pc, ror #20
     2b4:	ec910300 	ldc	3, cr0, [r1], {0}
     2b8:	00690477 	rsbeq	r0, r9, r7, ror r4
     2bc:	007f7001 	rsbseq	r7, pc, r1
     2c0:	91020000 	tstls	r2, r0
     2c4:	006a046c 	rsbeq	r0, sl, ip, ror #8
     2c8:	007f7101 	rsbseq	r7, pc, r1, lsl #2
     2cc:	91020000 	tstls	r2, r0
     2d0:	006b0470 	rsbeq	r0, fp, r0, ror r4
     2d4:	007f7201 	rsbseq	r7, pc, r1, lsl #4
     2d8:	91020000 	tstls	r2, r0
     2dc:	00ee0c74 	rsceq	r0, lr, r4, ror ip
     2e0:	73010000 	movwvc	r0, #4096	; 0x1000
     2e4:	0000015b 	andeq	r0, r0, fp, asr r1
     2e8:	778c9103 	strvc	r9, [ip, r3, lsl #2]
     2ec:	010b0c00 	tsteq	fp, r0, lsl #24
     2f0:	66010000 	strvs	r0, [r1], -r0
     2f4:	000001fe 	strdeq	r0, [r0], -lr
     2f8:	23d80305 	bicscs	r0, r8, #335544320	; 0x14000000
     2fc:	04090000 	streq	r0, [r9]
     300:	0000ce05 	andeq	ip, r0, r5, lsl #28
     304:	01040c00 	tsteq	r4, r0, lsl #24
     308:	67010000 	strvs	r0, [r1, -r0]
     30c:	000001fe 	strdeq	r0, [r0], -lr
     310:	23dc0305 	bicscs	r0, ip, #335544320	; 0x14000000
     314:	dc0c0000 	stcle	0, cr0, [ip], {0}
     318:	01000000 	tsteq	r0, r0
     31c:	0001fe68 	andeq	pc, r1, r8, ror #28
     320:	e0030500 	and	r0, r3, r0, lsl #10
     324:	0f000023 	svceq	0x00000023
     328:	01006370 	tsteq	r0, r0, ror r3
     32c:	0001436a 	andeq	r4, r1, sl, ror #6
     330:	5f010100 	svcpl	0x00010100
     334:	00022800 	andeq	r2, r2, r0, lsl #16
     338:	5a000200 	bpl	b40 <nand_to_ram+0x60>
     33c:	04000001 	streq	r0, [r0], #-1
     340:	00005c01 	andeq	r5, r0, r1, lsl #24
     344:	01950100 	orrseq	r0, r5, r0, lsl #2
     348:	00000000 	andeq	r0, r0, r0
     34c:	07840000 	streq	r0, [r4, r0]
     350:	0bfc0000 	bleq	fff00358 <bss_end+0xffefd070>
     354:	01740000 	cmneq	r4, r0
     358:	01020000 	tsteq	r2, r0
     35c:	00000170 	andeq	r0, r0, r0, ror r1
     360:	07840e01 	streq	r0, [r4, r1, lsl #28]
     364:	07b00000 	ldreq	r0, [r0, r0]!
     368:	012d0000 	teqeq	sp, r0
     36c:	01020000 	tsteq	r2, r0
     370:	0000016e 	andeq	r0, r0, lr, ror #2
     374:	07b01301 	ldreq	r1, [r0, r1, lsl #6]!
     378:	07dc0000 	ldrbeq	r0, [ip, r0]
     37c:	01580000 	cmpeq	r8, r0
     380:	01020000 	tsteq	r2, r0
     384:	00000121 	andeq	r0, r0, r1, lsr #2
     388:	07dc1801 	ldrbeq	r1, [ip, r1, lsl #16]
     38c:	08100000 	ldmdaeq	r0, {}
     390:	01830000 	orreq	r0, r3, r0
     394:	01030000 	tsteq	r3, r0
     398:	000001bf 	undefined instruction 0x000001bf
     39c:	10011d01 	andne	r1, r1, r1, lsl #26
     3a0:	40000008 	andmi	r0, r0, r8
     3a4:	ae000008 	cdpge	0, 0, cr0, cr0, cr8, {0}
     3a8:	89000001 	stmdbhi	r0, {r0}
     3ac:	04000000 	streq	r0, [r0]
     3b0:	000001c4 	andeq	r0, r0, r4, asr #3
     3b4:	00891d01 	addeq	r1, r9, r1, lsl #26
     3b8:	91020000 	tstls	r2, r0
     3bc:	04050074 	streq	r0, [r5], #-116	; 0x74
     3c0:	00007607 	andeq	r7, r0, r7, lsl #12
     3c4:	ac010300 	stcge	3, cr0, [r1], {0}
     3c8:	01000001 	tsteq	r0, r1
     3cc:	08400123 	stmdaeq	r0, {r0, r1, r5, r8}^
     3d0:	08700000 	ldmdaeq	r0!, {}^
     3d4:	01d90000 	bicseq	r0, r9, r0
     3d8:	00b80000 	adcseq	r0, r8, r0
     3dc:	b1040000 	tstlt	r4, r0
     3e0:	01000001 	tsteq	r0, r1
     3e4:	00008923 	andeq	r8, r0, r3, lsr #18
     3e8:	74910200 	ldrvc	r0, [r1], #512	; 0x200
     3ec:	b6010200 	strlt	r0, [r1], -r0, lsl #4
     3f0:	01000001 	tsteq	r0, r1
     3f4:	00087029 	andeq	r7, r8, r9, lsr #32
     3f8:	0008a000 	andeq	sl, r8, r0
     3fc:	00020400 	andeq	r0, r2, r0, lsl #8
     400:	16010200 	strne	r0, [r1], -r0, lsl #4
     404:	01000001 	tsteq	r0, r1
     408:	0008a02f 	andeq	sl, r8, pc, lsr #32
     40c:	0008cc00 	andeq	ip, r8, r0, lsl #24
     410:	00022f00 	andeq	r2, r2, r0, lsl #30
     414:	2b010200 	blcs	40c1c <bss_end+0x3d934>
     418:	01000001 	tsteq	r0, r1
     41c:	0008cc42 	andeq	ip, r8, r2, asr #24
     420:	00090400 	andeq	r0, r9, r0, lsl #8
     424:	00025a00 	andeq	r5, r2, r0, lsl #20
     428:	7c010300 	stcvc	3, cr0, [r1], {0}
     42c:	01000001 	tsteq	r0, r1
     430:	0904014c 	stmdbeq	r4, {r2, r3, r6, r8}
     434:	09e00000 	stmibeq	r0!, {}^
     438:	02850000 	addeq	r0, r5, #0
     43c:	01360000 	teqeq	r6, r0
     440:	b1040000 	tstlt	r4, r0
     444:	01000001 	tsteq	r0, r1
     448:	0001364c 	andeq	r3, r1, ip, asr #12
     44c:	6c910200 	lfmvs	f0, 4, [r1], {0}	; (ldcvs 2, cr0, [r1], {0})
     450:	0001c904 	andeq	ip, r1, r4, lsl #18
     454:	3d4c0100 	stfcce	f0, [ip]
     458:	02000001 	andeq	r0, r0, #1
     45c:	69066891 	stmdbvs	r6, {r0, r4, r7, fp, sp, lr}
     460:	4a4e0100 	bmi	1380868 <bss_end+0x137d580>
     464:	02000001 	andeq	r0, r0, #1
     468:	05007491 	streq	r7, [r0, #-1169]	; 0x491
     46c:	00710704 	rsbseq	r0, r1, r4, lsl #14
     470:	04070000 	streq	r0, [r7]
     474:	00000143 	andeq	r0, r0, r3, asr #2
     478:	50080105 	andpl	r0, r8, r5, lsl #2
     47c:	08000001 	stmdaeq	r0, {r0}
     480:	6e690504 	cdpvs	5, 6, cr0, cr9, cr4, {0}
     484:	01090074 	tsteq	r9, r4, ror r0
     488:	00000141 	andeq	r0, r0, r1, asr #2
     48c:	36017201 	strcc	r7, [r1], -r1, lsl #4
     490:	e0000001 	and	r0, r0, r1
     494:	e0000009 	and	r0, r0, r9
     498:	b000000a 	andlt	r0, r0, sl
     49c:	a5000002 	strge	r0, [r0, #-2]
     4a0:	04000001 	streq	r0, [r0], #-1
     4a4:	000001b1 	undefined instruction 0x000001b1
     4a8:	01367201 	teqeq	r6, r1, lsl #4
     4ac:	91020000 	tstls	r2, r0
     4b0:	01c9046c 	biceq	r0, r9, ip, ror #8
     4b4:	72010000 	andvc	r0, r1, #0
     4b8:	0000013d 	andeq	r0, r0, sp, lsr r1
     4bc:	06689102 	strbteq	r9, [r8], -r2, lsl #2
     4c0:	74010069 	strvc	r0, [r1], #-105	; 0x69
     4c4:	0000014a 	andeq	r0, r0, sl, asr #2
     4c8:	06709102 	ldrbteq	r9, [r0], -r2, lsl #2
     4cc:	00746572 	rsbseq	r6, r4, r2, ror r5
     4d0:	01367501 	teqeq	r6, r1, lsl #10
     4d4:	91020000 	tstls	r2, r0
     4d8:	01030074 	tsteq	r3, r4, ror r0
     4dc:	00000135 	andeq	r0, r0, r5, lsr r1
     4e0:	e0019d01 	and	r9, r1, r1, lsl #26
     4e4:	5c00000a 	stcpl	0, cr0, [r0], {10}
     4e8:	db00000b 	blle	51c <init+0xfc>
     4ec:	f5000002 	undefined instruction 0xf5000002
     4f0:	04000001 	streq	r0, [r0], #-1
     4f4:	0000018a 	andeq	r0, r0, sl, lsl #3
     4f8:	01369d01 	teqeq	r6, r1, lsl #26
     4fc:	91020000 	tstls	r2, r0
     500:	0163046c 	cmneq	r3, ip, ror #8
     504:	9d010000 	stcls	0, cr0, [r1]
     508:	0000013d 	andeq	r0, r0, sp, lsr r1
     50c:	04689102 	strbteq	r9, [r8], #-258	; 0x102
     510:	0000015e 	andeq	r0, r0, lr, asr r1
     514:	014a9d01 	cmpeq	sl, r1, lsl #26
     518:	91020000 	tstls	r2, r0
     51c:	00690664 	rsbeq	r0, r9, r4, ror #12
     520:	014a9f01 	cmpeq	sl, r1, lsl #30
     524:	91020000 	tstls	r2, r0
     528:	010a0074 	tsteq	sl, r4, ror r0
     52c:	000001a1 	andeq	r0, r0, r1, lsr #3
     530:	3601aa01 	strcc	sl, [r1], -r1, lsl #20
     534:	5c000001 	stcpl	0, cr0, [r0], {1}
     538:	fc00000b 	stc2	0, cr0, [r0], {11}
     53c:	0600000b 	streq	r0, [r0], -fp
     540:	04000003 	streq	r0, [r0], #-3
     544:	000001b1 	undefined instruction 0x000001b1
     548:	0136aa01 	teqeq	r6, r1, lsl #20
     54c:	91020000 	tstls	r2, r0
     550:	6572066c 	ldrbvs	r0, [r2, #-1644]!	; 0x66c
     554:	ac010074 	stcge	0, cr0, [r1], {116}	; 0x74
     558:	00000136 	andeq	r0, r0, r6, lsr r1
     55c:	00749102 	rsbseq	r9, r4, r2, lsl #2
     560:	00003700 	andeq	r3, r0, r0, lsl #14
     564:	06000200 	streq	r0, [r0], -r0, lsl #4
     568:	04000002 	streq	r0, [r0], #-2
     56c:	00005c01 	andeq	r5, r0, r1, lsl #24
     570:	01d80100 	bicseq	r0, r8, r0, lsl #2
     574:	00000000 	andeq	r0, r0, r0
     578:	0bfc0000 	bleq	fff00580 <bss_end+0xffefd298>
     57c:	0c100000 	ldceq	0, cr0, [r0], {0}
     580:	020c0000 	andeq	r0, ip, #0
     584:	01020000 	tsteq	r2, r0
     588:	000001ce 	andeq	r0, r0, lr, asr #3
     58c:	fc011301 	stc2	3, cr1, [r1], {1}
     590:	1000000b 	andne	r0, r0, fp
     594:	3100000c 	tstcc	r0, ip
     598:	00000003 	andeq	r0, r0, r3
     59c:	0000023b 	andeq	r0, r0, fp, lsr r2
     5a0:	022f0002 	eoreq	r0, pc, #2
     5a4:	01040000 	tsteq	r4, r0
     5a8:	0000005c 	andeq	r0, r0, ip, asr r0
     5ac:	0001eb01 	andeq	lr, r1, r1, lsl #22
     5b0:	00000000 	andeq	r0, r0, r0
     5b4:	000c1000 	andeq	r1, ip, r0
     5b8:	00124c00 	andseq	r4, r2, r0, lsl #24
     5bc:	00024a00 	andeq	r4, r2, r0, lsl #20
     5c0:	02260200 	eoreq	r0, r6, #0
     5c4:	28020000 	stmdacs	r2, {}
     5c8:	00000030 	andeq	r0, r0, r0, lsr r0
     5cc:	0001ff03 	andeq	pc, r1, r3, lsl #30
     5d0:	00480400 	subeq	r0, r8, r0, lsl #8
     5d4:	45040000 	strmi	r0, [r4]
     5d8:	48000002 	stmdami	r0, {r1}
     5dc:	02000000 	andeq	r0, r0, #0
     5e0:	00010023 	andeq	r0, r1, r3, lsr #32
     5e4:	01020405 	tsteq	r2, r5, lsl #8
     5e8:	02000002 	andeq	r0, r0, #2
     5ec:	00002566 	andeq	r2, r0, r6, ror #10
     5f0:	1b010600 	blne	41df8 <bss_end+0x3eb10>
     5f4:	01000002 	tsteq	r0, r2
     5f8:	0c100123 	ldfeqs	f0, [r0], {35}	; 0x23
     5fc:	0c8c0000 	stceq	0, cr0, [ip], {0}
     600:	035c0000 	cmpeq	ip, #0
     604:	01070000 	tsteq	r7, r0
     608:	00000235 	andeq	r0, r0, r5, lsr r2
     60c:	8c013101 	stfhis	f3, [r1], {1}
     610:	d400000c 	strle	r0, [r0], #-12
     614:	8700000c 	strhi	r0, [r0, -ip]
     618:	90000003 	andls	r0, r0, r3
     61c:	08000000 	stmdaeq	r0, {}
     620:	31010063 	tstcc	r1, r3, rrx
     624:	00000090 	muleq	r0, r0, r0
     628:	00779102 	rsbseq	r9, r7, r2, lsl #2
     62c:	50080109 	andpl	r0, r8, r9, lsl #2
     630:	0a000001 	beq	63c <handle_int+0xc>
     634:	00020901 	andeq	r0, r2, r1, lsl #18
     638:	013d0100 	teqeq	sp, r0, lsl #2
     63c:	00000090 	muleq	r0, r0, r0
     640:	00000cd4 	ldrdeq	r0, [r0], -r4
     644:	00000d14 	andeq	r0, r0, r4, lsl sp
     648:	000003b2 	undefined instruction 0x000003b2
     64c:	023a0107 	eorseq	r0, sl, #-1073741823	; 0xc0000001
     650:	46010000 	strmi	r0, [r1], -r0
     654:	000d1401 	andeq	r1, sp, r1, lsl #8
     658:	000d6000 	andeq	r6, sp, r0
     65c:	0003dd00 	andeq	sp, r3, r0, lsl #26
     660:	0000d600 	andeq	sp, r0, r0, lsl #12
     664:	00730800 	rsbseq	r0, r3, r0, lsl #16
     668:	00d64601 	sbcseq	r4, r6, r1, lsl #12
     66c:	91020000 	tstls	r2, r0
     670:	040b0074 	streq	r0, [fp], #-116	; 0x74
     674:	00000090 	muleq	r0, r0, r0
     678:	01f9010c 	mvnseq	r0, ip, lsl #2
     67c:	4e010000 	cdpmi	0, 0, cr0, cr1, cr0, {0}
     680:	00012001 	andeq	r2, r1, r1
     684:	000d6000 	andeq	r6, sp, r0
     688:	000dec00 	andeq	lr, sp, r0, lsl #24
     68c:	00040800 	andeq	r0, r4, r0, lsl #16
     690:	00012000 	andeq	r2, r1, r0
     694:	00730800 	rsbseq	r0, r3, r0, lsl #16
     698:	01204e01 	teqeq	r0, r1, lsl #28
     69c:	91020000 	tstls	r2, r0
     6a0:	02400d6c 	subeq	r0, r0, #6912	; 0x1b00
     6a4:	50010000 	andpl	r0, r1, r0
     6a8:	00000120 	andeq	r0, r0, r0, lsr #2
     6ac:	0e709102 	expeqs	f1, f2
     6b0:	51010063 	tstpl	r1, r3, rrx
     6b4:	00000126 	andeq	r0, r0, r6, lsr #2
     6b8:	00779102 	rsbseq	r9, r7, r2, lsl #2
     6bc:	0126040b 	teqeq	r6, fp, lsl #8
     6c0:	01090000 	tsteq	r9, r0
     6c4:	00015908 	andeq	r5, r1, r8, lsl #18
     6c8:	e6010700 	str	r0, [r1], -r0, lsl #14
     6cc:	01000001 	tsteq	r0, r1
     6d0:	0dec0160 	stfeqe	f0, [ip, #384]!	; 0x180
     6d4:	0efc0000 	cdpeq	0, 15, cr0, cr12, cr0, {0}
     6d8:	04330000 	ldrteq	r0, [r3]
     6dc:	016d0000 	cmneq	sp, r0
     6e0:	6e080000 	cdpvs	0, 0, cr0, cr8, cr0, {0}
     6e4:	6d600100 	stfvse	f0, [r0]
     6e8:	02000001 	andeq	r0, r0, #1
     6ec:	62086c91 	andvs	r6, r8, #37120	; 0x9100
     6f0:	01006675 	tsteq	r0, r5, ror r6
     6f4:	00012060 	andeq	r2, r1, r0, rrx
     6f8:	68910200 	ldmvs	r1, {r9}
     6fc:	0100690e 	tsteq	r0, lr, lsl #18
     700:	00016d62 	andeq	r6, r1, r2, ror #26
     704:	74910200 	ldrvc	r0, [r1], #512	; 0x200
     708:	05040f00 	streq	r0, [r4, #-3840]	; 0xf00
     70c:	00746e69 	rsbseq	r6, r4, r9, ror #28
     710:	020e0107 	andeq	r0, lr, #-1073741823	; 0xc0000001
     714:	6f010000 	svcvs	0x00010000
     718:	000efc01 	andeq	pc, lr, r1, lsl #24
     71c:	00107000 	andseq	r7, r0, r0
     720:	00045e00 	andeq	r5, r4, r0, lsl #28
     724:	0001b400 	andeq	fp, r1, r0, lsl #8
     728:	006e0800 	rsbeq	r0, lr, r0, lsl #16
     72c:	016d6f01 	cmneq	sp, r1, lsl #30
     730:	91020000 	tstls	r2, r0
     734:	7562086c 	strbvc	r0, [r2, #-2156]!	; 0x86c
     738:	6f010066 	svcvs	0x00010066
     73c:	00000120 	andeq	r0, r0, r0, lsr #2
     740:	0e689102 	lgneqe	f1, f2
     744:	71010069 	tstvc	r1, r9, rrx
     748:	0000016d 	andeq	r0, r0, sp, ror #2
     74c:	00749102 	rsbseq	r9, r4, r2, lsl #2
     750:	0213010c 	andseq	r0, r3, #3
     754:	85010000 	strhi	r0, [r1]
     758:	00016d01 	andeq	r6, r1, r1, lsl #26
     75c:	00107000 	andseq	r7, r0, r0
     760:	00124c00 	andseq	r4, r2, r0, lsl #24
     764:	00048900 	andeq	r8, r4, r0, lsl #18
     768:	00022000 	andeq	r2, r2, r0
     76c:	6d660800 	stclvs	8, cr0, [r6]
     770:	85010074 	strhi	r0, [r1, #-116]	; 0x74
     774:	00000220 	andeq	r0, r0, r0, lsr #4
     778:	10009102 	andne	r9, r0, r2, lsl #2
     77c:	0070610e 	rsbseq	r6, r0, lr, lsl #2
     780:	004a8701 	subeq	r8, sl, r1, lsl #14
     784:	91020000 	tstls	r2, r0
     788:	00630e68 	rsbeq	r0, r3, r8, ror #28
     78c:	01268801 	teqeq	r6, r1, lsl #16
     790:	91020000 	tstls	r2, r0
     794:	00640e6f 	rsbeq	r0, r4, pc, ror #28
     798:	016d8901 	cmneq	sp, r1, lsl #18
     79c:	91020000 	tstls	r2, r0
     7a0:	00730e70 	rsbseq	r0, r3, r0, ror lr
     7a4:	01208a01 	teqeq	r0, r1, lsl #20
     7a8:	91020000 	tstls	r2, r0
     7ac:	75620e74 	strbvc	r0, [r2, #-3700]!	; 0xe74
     7b0:	8b010066 	blhi	40950 <bss_end+0x3d668>
     7b4:	0000022b 	andeq	r0, r0, fp, lsr #4
     7b8:	00489102 	subeq	r9, r8, r2, lsl #2
     7bc:	0226040b 	eoreq	r0, r6, #184549376	; 0xb000000
     7c0:	26110000 	ldrcs	r0, [r1], -r0
     7c4:	12000001 	andne	r0, r0, #1
     7c8:	00000126 	andeq	r0, r0, r6, lsr #2
     7cc:	0000023b 	andeq	r0, r0, fp, lsr r2
     7d0:	00023b13 	andeq	r3, r2, r3, lsl fp
     7d4:	14001f00 	strne	r1, [r0], #-3840	; 0xf00
     7d8:	30000704 	andcc	r0, r0, r4, lsl #14
     7dc:	02000001 	andeq	r0, r0, #1
     7e0:	00033e00 	andeq	r3, r3, r0, lsl #28
     7e4:	5c010400 	cfstrspl	mvf0, [r1], {0}
     7e8:	01000000 	tsteq	r0, r0
     7ec:	0000025b 	andeq	r0, r0, fp, asr r2
     7f0:	00000000 	andeq	r0, r0, r0
     7f4:	0000124c 	andeq	r1, r0, ip, asr #4
     7f8:	000013a8 	andeq	r1, r0, r8, lsr #7
     7fc:	0000034a 	andeq	r0, r0, sl, asr #6
     800:	028e0102 	addeq	r0, lr, #-2147483648	; 0x80000000
     804:	13010000 	movwne	r0, #4096	; 0x1000
     808:	00124c01 	andseq	r4, r2, r1, lsl #24
     80c:	0012a800 	andseq	sl, r2, r0, lsl #16
     810:	0004c000 	andeq	ip, r4, r0
     814:	00006900 	andeq	r6, r0, r0, lsl #18
     818:	00510300 	subseq	r0, r1, r0, lsl #6
     81c:	13010000 	movwne	r0, #4096	; 0x1000
     820:	00000069 	andeq	r0, r0, r9, rrx
     824:	046c9102 	strbteq	r9, [ip], #-258	; 0x102
     828:	00000083 	andeq	r0, r0, r3, lsl #1
     82c:	00692401 	rsbeq	r2, r9, r1, lsl #8
     830:	91020000 	tstls	r2, r0
     834:	00440470 	subeq	r0, r4, r0, ror r4
     838:	25010000 	strcs	r0, [r1]
     83c:	00000070 	andeq	r0, r0, r0, ror r0
     840:	00749102 	rsbseq	r9, r4, r2, lsl #2
     844:	71070405 	tstvc	r7, r5, lsl #8
     848:	06000000 	streq	r0, [r0], -r0
     84c:	00006904 	andeq	r6, r0, r4, lsl #18
     850:	75010200 	strvc	r0, [r1, #-512]	; 0x200
     854:	01000002 	tsteq	r0, r2
     858:	12a8012d 	adcne	r0, r8, #1073741835	; 0x4000000b
     85c:	12c40000 	sbcne	r0, r4, #0
     860:	04eb0000 	strbteq	r0, [fp]
     864:	009e0000 	addseq	r0, lr, r0
     868:	70070000 	andvc	r0, r7, r0
     86c:	01006469 	tsteq	r0, r9, ror #8
     870:	00009e2d 	andeq	r9, r0, sp, lsr #28
     874:	74910200 	ldrvc	r0, [r1], #512	; 0x200
     878:	07040500 	streq	r0, [r4, -r0, lsl #10]
     87c:	00000076 	andeq	r0, r0, r6, ror r0
     880:	024a0102 	subeq	r0, sl, #-2147483648	; 0x80000000
     884:	37010000 	strcc	r0, [r1, -r0]
     888:	0012c401 	andseq	ip, r2, r1, lsl #8
     88c:	00133c00 	andseq	r3, r3, r0, lsl #24
     890:	00051600 	andeq	r1, r5, r0, lsl #12
     894:	0000f700 	andeq	pc, r0, r0, lsl #14
     898:	69700700 	ldmdbvs	r0!, {r8, r9, sl}^
     89c:	37010064 	strcc	r0, [r1, -r4, rrx]
     8a0:	0000009e 	muleq	r0, lr, r0
     8a4:	04649102 	strbteq	r9, [r4], #-258	; 0x102
     8a8:	00000083 	andeq	r0, r0, r3, lsl #1
     8ac:	00694801 	rsbeq	r4, r9, r1, lsl #16
     8b0:	91020000 	tstls	r2, r0
     8b4:	027e046c 	rsbseq	r0, lr, #1811939328	; 0x6c000000
     8b8:	49010000 	stmdbmi	r1, {}
     8bc:	00000069 	andeq	r0, r0, r9, rrx
     8c0:	04709102 	ldrbteq	r9, [r0], #-258	; 0x102
     8c4:	00000044 	andeq	r0, r0, r4, asr #32
     8c8:	00704a01 	rsbseq	r4, r0, r1, lsl #20
     8cc:	91020000 	tstls	r2, r0
     8d0:	01020074 	tsteq	r2, r4, ror r0
     8d4:	00000286 	andeq	r0, r0, r6, lsl #5
     8d8:	3c015c01 	stccc	12, cr5, [r1], {1}
     8dc:	84000013 	strhi	r0, [r0], #-19
     8e0:	41000013 	tstmi	r0, r3, lsl r0
     8e4:	1f000005 	svcne	0x00000005
     8e8:	07000001 	streq	r0, [r0, -r1]
     8ec:	00646970 	rsbeq	r6, r4, r0, ror r9
     8f0:	009e5c01 	addseq	r5, lr, r1, lsl #24
     8f4:	91020000 	tstls	r2, r0
     8f8:	01080074 	tsteq	r8, r4, ror r0
     8fc:	0000026a 	andeq	r0, r0, sl, ror #4
     900:	13847001 	orrne	r7, r4, #1
     904:	13a80000 	undefined instruction 0x13a80000
     908:	056c0000 	strbeq	r0, [ip]!
     90c:	93000000 	movwls	r0, #0
     910:	02000000 	andeq	r0, r0, #0
     914:	0003bd00 	andeq	fp, r3, r0, lsl #26
     918:	5c010400 	cfstrspl	mvf0, [r1], {0}
     91c:	01000000 	tsteq	r0, r0
     920:	000002ab 	andeq	r0, r0, fp, lsr #5
     924:	00000000 	andeq	r0, r0, r0
     928:	000013a8 	andeq	r1, r0, r8, lsr #7
     92c:	000014a4 	andeq	r1, r0, r4, lsr #9
     930:	000003a6 	andeq	r0, r0, r6, lsr #7
     934:	02b80102 	adcseq	r0, r8, #-2147483648	; 0x80000000
     938:	16010000 	strne	r0, [r1], -r0
     93c:	0013a801 	andseq	sl, r3, r1, lsl #16
     940:	0013e800 	andseq	lr, r3, r0, lsl #16
     944:	00059700 	andeq	r9, r5, r0, lsl #14
     948:	c2010200 	andgt	r0, r1, #0
     94c:	01000002 	tsteq	r0, r2
     950:	13e80122 	mvnne	r0, #-2147483640	; 0x80000008
     954:	14280000 	strtne	r0, [r8]
     958:	05c20000 	strbeq	r0, [r2]
     95c:	01030000 	tsteq	r3, r0
     960:	000002a2 	andeq	r0, r0, r2, lsr #5
     964:	14282a01 	strtne	r2, [r8], #-2561	; 0xa01
     968:	145c0000 	ldrbne	r0, [ip]
     96c:	05ed0000 	strbeq	r0, [sp]!
     970:	01040000 	tsteq	r4, r0
     974:	000002d3 	ldrdeq	r0, [r0], -r3
     978:	007b3201 	rsbseq	r3, fp, r1, lsl #4
     97c:	145c0000 	ldrbne	r0, [ip]
     980:	14800000 	strne	r0, [r0]
     984:	06180000 	ldreq	r0, [r8], -r0
     988:	04050000 	streq	r0, [r5]
     98c:	746e6905 	strbtvc	r6, [lr], #-2309	; 0x905
     990:	cb010300 	blgt	41598 <bss_end+0x3e2b0>
     994:	01000002 	tsteq	r0, r2
     998:	00148037 	andseq	r8, r4, r7, lsr r0
     99c:	0014a400 	andseq	sl, r4, r0, lsl #8
     9a0:	00064300 	andeq	r4, r6, r0, lsl #6
     9a4:	07470000 	strbeq	r0, [r7, -r0]
     9a8:	00020000 	andeq	r0, r2, r0
     9ac:	00000419 	andeq	r0, r0, r9, lsl r4
     9b0:	005c0104 	subseq	r0, ip, r4, lsl #2
     9b4:	8d010000 	stchi	0, cr0, [r1]
     9b8:	00000003 	andeq	r0, r0, r3
     9bc:	a4000000 	strge	r0, [r0]
     9c0:	28000014 	stmdacs	r0, {r2, r4}
     9c4:	f3000022 	vhadd.u8	d0, d0, d18
     9c8:	02000003 	andeq	r0, r0, #3
     9cc:	00031f01 	andeq	r1, r3, r1, lsl #30
     9d0:	01120100 	tsteq	r2, r0, lsl #2
     9d4:	000014a4 	andeq	r1, r0, r4, lsr #9
     9d8:	00001514 	andeq	r1, r0, r4, lsl r5
     9dc:	0000066e 	andeq	r0, r0, lr, ror #12
     9e0:	00000063 	andeq	r0, r0, r3, rrx
     9e4:	01006e03 	tsteq	r0, r3, lsl #28
     9e8:	00006312 	andeq	r6, r0, r2, lsl r3
     9ec:	6c910200 	lfmvs	f0, 4, [r1], {0}	; (ldcvs 2, cr0, [r1], {0})
     9f0:	01006904 	tsteq	r0, r4, lsl #18
     9f4:	00006314 	andeq	r6, r0, r4, lsl r3
     9f8:	70910200 	addsvc	r0, r1, r0, lsl #4
     9fc:	01006a04 	tsteq	r0, r4, lsl #20
     a00:	00006314 	andeq	r6, r0, r4, lsl r3
     a04:	74910200 	ldrvc	r0, [r1], #512	; 0x200
     a08:	05040500 	streq	r0, [r4, #-1280]	; 0x500
     a0c:	00746e69 	rsbseq	r6, r4, r9, ror #28
     a10:	02f00106 	rscseq	r0, r0, #-2147483647	; 0x80000001
     a14:	1e010000 	cdpne	0, 0, cr0, cr1, cr0, {0}
     a18:	0000ae01 	andeq	sl, r0, r1, lsl #28
     a1c:	00151400 	andseq	r1, r5, r0, lsl #8
     a20:	00157c00 	andseq	r7, r5, r0, lsl #24
     a24:	00069900 	andeq	r9, r6, r0, lsl #18
     a28:	0000ae00 	andeq	sl, r0, r0, lsl #28
     a2c:	006e0300 	rsbeq	r0, lr, r0, lsl #6
     a30:	00ae1e01 	adceq	r1, lr, r1, lsl #28
     a34:	91020000 	tstls	r2, r0
     a38:	0069046c 	rsbeq	r0, r9, ip, ror #8
     a3c:	00632001 	rsbeq	r2, r3, r1
     a40:	91020000 	tstls	r2, r0
     a44:	756d0470 	strbvc	r0, [sp, #-1136]!	; 0x470
     a48:	2001006c 	andcs	r0, r1, ip, rrx
     a4c:	00000063 	andeq	r0, r0, r3, rrx
     a50:	00749102 	rsbseq	r9, r4, r2, lsl #2
     a54:	76070407 	strvc	r0, [r7], -r7, lsl #8
     a58:	06000000 	streq	r0, [r0], -r0
     a5c:	00036601 	andeq	r6, r3, r1, lsl #12
     a60:	012b0100 	teqeq	fp, r0, lsl #2
     a64:	000000ae 	andeq	r0, r0, lr, lsr #1
     a68:	0000157c 	andeq	r1, r0, ip, ror r5
     a6c:	00001650 	andeq	r1, r0, r0, asr r6
     a70:	000006c4 	andeq	r0, r0, r4, asr #13
     a74:	00000107 	andeq	r0, r0, r7, lsl #2
     a78:	72726103 	rsbsvc	r6, r2, #-1073741824	; 0xc0000000
     a7c:	072b0100 	streq	r0, [fp, -r0, lsl #2]!
     a80:	02000001 	andeq	r0, r0, #1
     a84:	73045c91 	movwvc	r5, #19601	; 0x4c91
     a88:	01006d75 	tsteq	r0, r5, ror sp
     a8c:	0000ae2d 	andeq	sl, r0, sp, lsr #28
     a90:	64910200 	ldrvs	r0, [r1], #512	; 0x200
     a94:	01006904 	tsteq	r0, r4, lsl #18
     a98:	0000ae2d 	andeq	sl, r0, sp, lsr #28
     a9c:	68910200 	ldmvs	r1, {r9}
     aa0:	01006a04 	tsteq	r0, r4, lsl #20
     aa4:	0000ae2d 	andeq	sl, r0, sp, lsr #28
     aa8:	6c910200 	lfmvs	f0, 4, [r1], {0}	; (ldcvs 2, cr0, [r1], {0})
     aac:	0d040800 	stceq	8, cr0, [r4]
     ab0:	07000001 	streq	r0, [r0, -r1]
     ab4:	01590801 	cmpeq	r9, r1, lsl #16
     ab8:	01060000 	tsteq	r6, r0
     abc:	0000034b 	andeq	r0, r0, fp, asr #6
     ac0:	63013c01 	movwvs	r3, #7169	; 0x1c01
     ac4:	50000000 	andpl	r0, r0, r0
     ac8:	08000016 	stmdaeq	r0, {r1, r2, r4}
     acc:	ef000017 	svc	0x00000017
     ad0:	62000006 	andvs	r0, r0, #6
     ad4:	03000001 	movweq	r0, #1
     ad8:	3c010073 	stccc	0, cr0, [r1], {115}	; 0x73
     adc:	00000107 	andeq	r0, r0, r7, lsl #2
     ae0:	04649102 	strbteq	r9, [r4], #-258	; 0x102
     ae4:	3e010070 	mcrcc	0, 0, r0, cr1, cr0, {3}
     ae8:	00000107 	andeq	r0, r0, r7, lsl #2
     aec:	046c9102 	strbteq	r9, [ip], #-258	; 0x102
     af0:	3f010063 	svccc	0x00010063
     af4:	0000010d 	andeq	r0, r0, sp, lsl #2
     af8:	04739102 	ldrbteq	r9, [r3], #-258	; 0x102
     afc:	40010069 	andmi	r0, r1, r9, rrx
     b00:	00000063 	andeq	r0, r0, r3, rrx
     b04:	00749102 	rsbseq	r9, r4, r2, lsl #2
     b08:	03250106 	teqeq	r5, #-2147483647	; 0x80000001
     b0c:	4f010000 	svcmi	0x00010000
     b10:	00010701 	andeq	r0, r1, r1, lsl #14
     b14:	00170800 	andseq	r0, r7, r0, lsl #16
     b18:	00178000 	andseq	r8, r7, r0
     b1c:	00071a00 	andeq	r1, r7, r0, lsl #20
     b20:	0001aa00 	andeq	sl, r1, r0, lsl #20
     b24:	031a0900 	tsteq	sl, #0
     b28:	4f010000 	svcmi	0x00010000
     b2c:	00000107 	andeq	r0, r0, r7, lsl #2
     b30:	036c9102 	cmneq	ip, #-2147483648	; 0x80000000
     b34:	00637273 	rsbeq	r7, r3, r3, ror r2
     b38:	01aa4f01 	undefined instruction 0x01aa4f01
     b3c:	91020000 	tstls	r2, r0
     b40:	6d740468 	cfldrdvs	mvd0, [r4, #-416]!	; 0xfffffe60
     b44:	51010070 	tstpl	r1, r0, ror r0
     b48:	00000107 	andeq	r0, r0, r7, lsl #2
     b4c:	00749102 	rsbseq	r9, r4, r2, lsl #2
     b50:	01b00408 	lslseq	r0, r8, #8
     b54:	0d0a0000 	stceq	0, cr0, [sl]
     b58:	06000001 	streq	r0, [r0], -r1
     b5c:	00033301 	andeq	r3, r3, r1, lsl #6
     b60:	01570100 	cmpeq	r7, r0, lsl #2
     b64:	00000107 	andeq	r0, r0, r7, lsl #2
     b68:	00001780 	andeq	r1, r0, r0, lsl #15
     b6c:	00001824 	andeq	r1, r0, r4, lsr #16
     b70:	00000745 	andeq	r0, r0, r5, asr #14
     b74:	0000020b 	andeq	r0, r0, fp, lsl #4
     b78:	00031a09 	andeq	r1, r3, r9, lsl #20
     b7c:	07570100 	ldrbeq	r0, [r7, -r0, lsl #2]
     b80:	02000001 	andeq	r0, r0, #1
     b84:	73036c91 	movwvc	r6, #15505	; 0x3c91
     b88:	01006372 	tsteq	r0, r2, ror r3
     b8c:	0001aa57 	andeq	sl, r1, r7, asr sl
     b90:	68910200 	ldmvs	r1, {r9}
     b94:	00036b09 	andeq	r6, r3, r9, lsl #22
     b98:	63570100 	cmpvs	r7, #0
     b9c:	02000000 	andeq	r0, r0, #0
     ba0:	74046491 	strvc	r6, [r4], #-1169	; 0x491
     ba4:	0100706d 	tsteq	r0, sp, rrx
     ba8:	00010759 	andeq	r0, r1, r9, asr r7
     bac:	74910200 	ldrvc	r0, [r1], #512	; 0x200
     bb0:	2c010600 	stccs	6, cr0, [r1], {0}
     bb4:	01000003 	tsteq	r0, r3
     bb8:	01070160 	tsteq	r7, r0, ror #2
     bbc:	18240000 	stmdane	r4!, {}
     bc0:	18bc0000 	ldmne	ip!, {}
     bc4:	07700000 	ldrbeq	r0, [r0, -r0]!
     bc8:	02530000 	subseq	r0, r3, #0
     bcc:	1a090000 	bne	240bd4 <bss_end+0x23d8ec>
     bd0:	01000003 	tsteq	r0, r3
     bd4:	00010760 	andeq	r0, r1, r0, ror #14
     bd8:	6c910200 	lfmvs	f0, 4, [r1], {0}	; (ldcvs 2, cr0, [r1], {0})
     bdc:	63727303 	cmnvs	r2, #201326592	; 0xc000000
     be0:	aa600100 	bge	1800fe8 <bss_end+0x17fdd00>
     be4:	02000001 	andeq	r0, r0, #1
     be8:	74046891 	strvc	r6, [r4], #-2193	; 0x891
     bec:	0100706d 	tsteq	r0, sp, rrx
     bf0:	00010762 	andeq	r0, r1, r2, ror #14
     bf4:	74910200 	ldrvc	r0, [r1], #512	; 0x200
     bf8:	43010600 	movwmi	r0, #5632	; 0x1600
     bfc:	01000003 	tsteq	r0, r3
     c00:	0107016b 	tsteq	r7, fp, ror #2
     c04:	18bc0000 	ldmne	ip!, {}
     c08:	19900000 	ldmibne	r0, {}
     c0c:	079b0000 	ldreq	r0, [fp, r0]
     c10:	02a90000 	adceq	r0, r9, #0
     c14:	1a090000 	bne	240c1c <bss_end+0x23d934>
     c18:	01000003 	tsteq	r0, r3
     c1c:	0001076b 	andeq	r0, r1, fp, ror #14
     c20:	6c910200 	lfmvs	f0, 4, [r1], {0}	; (ldcvs 2, cr0, [r1], {0})
     c24:	63727303 	cmnvs	r2, #201326592	; 0xc000000
     c28:	aa6b0100 	bge	1ac1030 <bss_end+0x1abdd48>
     c2c:	02000001 	andeq	r0, r0, #1
     c30:	6b096891 	blvs	25ae7c <bss_end+0x257b94>
     c34:	01000003 	tsteq	r0, r3
     c38:	0000636b 	andeq	r6, r0, fp, ror #6
     c3c:	64910200 	ldrvs	r0, [r1], #512	; 0x200
     c40:	706d7404 	rsbvc	r7, sp, r4, lsl #8
     c44:	076d0100 	strbeq	r0, [sp, -r0, lsl #2]!
     c48:	02000001 	andeq	r0, r0, #1
     c4c:	06007491 	undefined instruction 0x06007491
     c50:	00035001 	andeq	r5, r3, r1
     c54:	017c0100 	cmneq	ip, r0, lsl #2
     c58:	00000063 	andeq	r0, r0, r3, rrx
     c5c:	00001990 	muleq	r0, r0, r9
     c60:	00001a38 	andeq	r1, r0, r8, lsr sl
     c64:	000007c6 	andeq	r0, r0, r6, asr #15
     c68:	000002ee 	andeq	r0, r0, lr, ror #5
     c6c:	00736303 	rsbseq	r6, r3, r3, lsl #6
     c70:	01aa7c01 	undefined instruction 0x01aa7c01
     c74:	91020000 	tstls	r2, r0
     c78:	74630374 	strbtvc	r0, [r3], #-884	; 0x374
     c7c:	aa7c0100 	bge	1f01084 <bss_end+0x1efdd9c>
     c80:	02000001 	andeq	r0, r0, #1
     c84:	7f0b7091 	svcvc	0x000b7091
     c88:	01000003 	tsteq	r0, r3
     c8c:	0002ee7e 	andeq	lr, r2, lr, ror lr
     c90:	00540100 	subseq	r0, r4, r0, lsl #2
     c94:	52060107 	andpl	r0, r6, #-1073741823	; 0xc0000001
     c98:	06000001 	streq	r0, [r0], -r1
     c9c:	00038501 	andeq	r8, r3, r1, lsl #10
     ca0:	01870100 	orreq	r0, r7, r0, lsl #2
     ca4:	00000063 	andeq	r0, r0, r3, rrx
     ca8:	00001a38 	andeq	r1, r0, r8, lsr sl
     cac:	00001afc 	strdeq	r1, [r0], -ip
     cb0:	000007f1 	strdeq	r0, [r0], -r1
     cb4:	00000348 	andeq	r0, r0, r8, asr #6
     cb8:	00736303 	rsbseq	r6, r3, r3, lsl #6
     cbc:	01aa8701 	undefined instruction 0x01aa8701
     cc0:	91020000 	tstls	r2, r0
     cc4:	74630374 	strbtvc	r0, [r3], #-884	; 0x374
     cc8:	aa870100 	bge	fe1c10d0 <bss_end+0xfe1bdde8>
     ccc:	02000001 	andeq	r0, r0, #1
     cd0:	6b097091 	blvs	25cf1c <bss_end+0x259c34>
     cd4:	01000003 	tsteq	r0, r3
     cd8:	00006387 	andeq	r6, r0, r7, lsl #7
     cdc:	6c910200 	lfmvs	f0, 4, [r1], {0}	; (ldcvs 2, cr0, [r1], {0})
     ce0:	00037f0b 	andeq	r7, r3, fp, lsl #30
     ce4:	ee890100 	rmfe	f0, f1, f0
     ce8:	01000002 	tsteq	r0, r2
     cec:	01060054 	qaddeq	r0, r4, r6
     cf0:	0000030c 	andeq	r0, r0, ip, lsl #6
     cf4:	07019301 	streq	r9, [r1, -r1, lsl #6]
     cf8:	fc000001 	stc2	0, cr0, [r0], {1}
     cfc:	6400001a 	strvs	r0, [r0], #-26
     d00:	1c00001b 	stcne	0, cr0, [r0], {27}
     d04:	7e000008 	cdpvc	0, 0, cr0, cr0, cr8, {0}
     d08:	03000003 	movweq	r0, #3
     d0c:	93010073 	movwls	r0, #4211	; 0x1073
     d10:	000001aa 	andeq	r0, r0, sl, lsr #3
     d14:	03749102 	cmneq	r4, #-2147483648	; 0x80000000
     d18:	93010063 	movwls	r0, #4195	; 0x1063
     d1c:	00000063 	andeq	r0, r0, r3, rrx
     d20:	00709102 	rsbseq	r9, r0, r2, lsl #2
     d24:	03130106 	tsteq	r3, #-2147483647	; 0x80000001
     d28:	9a010000 	bls	40d30 <bss_end+0x3da48>
     d2c:	00006301 	andeq	r6, r0, r1, lsl #6
     d30:	001b6400 	andseq	r6, fp, r0, lsl #8
     d34:	001bb800 	andseq	fp, fp, r0, lsl #16
     d38:	00084700 	andeq	r4, r8, r0, lsl #14
     d3c:	0003b500 	andeq	fp, r3, r0, lsl #10
     d40:	00730300 	rsbseq	r0, r3, r0, lsl #6
     d44:	01aa9a01 	undefined instruction 0x01aa9a01
     d48:	91020000 	tstls	r2, r0
     d4c:	6373046c 	cmnvs	r3, #1811939328	; 0x6c000000
     d50:	aa9c0100 	bge	fe701158 <bss_end+0xfe6fde70>
     d54:	02000001 	andeq	r0, r0, #1
     d58:	06007491 	undefined instruction 0x06007491
     d5c:	00035701 	andeq	r5, r3, r1, lsl #14
     d60:	01a20100 	undefined instruction 0x01a20100
     d64:	00000063 	andeq	r0, r0, r3, rrx
     d68:	00001bb8 	undefined instruction 0x00001bb8
     d6c:	00001c38 	andeq	r1, r0, r8, lsr ip
     d70:	00000872 	andeq	r0, r0, r2, ror r8
     d74:	000003fa 	strdeq	r0, [r0], -sl
     d78:	01007303 	tsteq	r0, r3, lsl #6
     d7c:	0001aaa2 	andeq	sl, r1, r2, lsr #21
     d80:	6c910200 	lfmvs	f0, 4, [r1], {0}	; (ldcvs 2, cr0, [r1], {0})
     d84:	00036b09 	andeq	r6, r3, r9, lsl #22
     d88:	63a20100 	undefined instruction 0x63a20100
     d8c:	02000000 	andeq	r0, r0, #0
     d90:	73046891 	movwvc	r6, #18577	; 0x4891
     d94:	a4010063 	strge	r0, [r1], #-99	; 0x63
     d98:	000001aa 	andeq	r0, r0, sl, lsr #3
     d9c:	00749102 	rsbseq	r9, r4, r2, lsl #2
     da0:	035f0106 	cmpeq	pc, #-2147483647	; 0x80000001
     da4:	aa010000 	bge	40dac <bss_end+0x3dac4>
     da8:	00006301 	andeq	r6, r0, r1, lsl #6
     dac:	001c3800 	andseq	r3, ip, r0, lsl #16
     db0:	001cfc00 	andseq	pc, ip, r0, lsl #24
     db4:	00089d00 	andeq	r9, r8, r0, lsl #26
     db8:	00045800 	andeq	r5, r4, r0, lsl #16
     dbc:	00730300 	rsbseq	r0, r3, r0, lsl #6
     dc0:	01aaaa01 	undefined instruction 0x01aaaa01
     dc4:	91020000 	tstls	r2, r0
     dc8:	02e20964 	rsceq	r0, r2, #1638400	; 0x190000
     dcc:	aa010000 	bge	40dd4 <bss_end+0x3daec>
     dd0:	000001aa 	andeq	r0, r0, sl, lsr #3
     dd4:	04609102 	strbteq	r9, [r0], #-258	; 0x102
     dd8:	ac010070 	stcge	0, cr0, [r1], {112}	; 0x70
     ddc:	000001aa 	andeq	r0, r0, sl, lsr #3
     de0:	046c9102 	strbteq	r9, [ip], #-258	; 0x102
     de4:	ad010061 	stcge	0, cr0, [r1, #-388]	; 0xfffffe7c
     de8:	000001aa 	andeq	r0, r0, sl, lsr #3
     dec:	0b709102 	bleq	1c251fc <bss_end+0x1c21f14>
     df0:	0000036b 	andeq	r0, r0, fp, ror #6
     df4:	0063ae01 	rsbeq	sl, r3, r1, lsl #28
     df8:	91020000 	tstls	r2, r0
     dfc:	01060074 	tsteq	r6, r4, ror r0
     e00:	0000033b 	andeq	r0, r0, fp, lsr r3
     e04:	0701bc01 	streq	fp, [r1, -r1, lsl #24]
     e08:	fc000001 	stc2	0, cr0, [r0], {1}
     e0c:	9400001c 	strls	r0, [r0], #-28
     e10:	c800001d 	stmdagt	r0, {r0, r2, r3, r4}
     e14:	ac000008 	stcge	0, cr0, [r0], {8}
     e18:	03000004 	movweq	r0, #4
     e1c:	01007363 	tsteq	r0, r3, ror #6
     e20:	0001aabc 	undefined instruction 0x0001aabc
     e24:	6c910200 	lfmvs	f0, 4, [r1], {0}	; (ldcvs 2, cr0, [r1], {0})
     e28:	00746303 	rsbseq	r6, r4, r3, lsl #6
     e2c:	01aabc01 	undefined instruction 0x01aabc01
     e30:	91020000 	tstls	r2, r0
     e34:	63730468 	cmnvs	r3, #1744830464	; 0x68000000
     e38:	be010031 	mcrlt	0, 0, r0, cr1, cr1, {1}
     e3c:	000001aa 	andeq	r0, r0, sl, lsr #3
     e40:	04709102 	ldrbteq	r9, [r0], #-258	; 0x102
     e44:	00326373 	eorseq	r6, r2, r3, ror r3
     e48:	01aabe01 	undefined instruction 0x01aabe01
     e4c:	91020000 	tstls	r2, r0
     e50:	01060074 	tsteq	r6, r4, ror r0
     e54:	000002f6 	strdeq	r0, [r0], -r6
     e58:	fd01c801 	stc2	8, cr12, [r1, #-4]
     e5c:	94000004 	strls	r0, [r0], #-4
     e60:	1000001d 	andne	r0, r0, sp, lsl r0
     e64:	f300001e 	vqadd.u8	d0, d0, d14
     e68:	fd000008 	stc2	0, cr0, [r0, #-32]	; 0xffffffe0
     e6c:	03000004 	movweq	r0, #4
     e70:	c8010073 	stmdagt	r1, {r0, r1, r4, r5, r6}
     e74:	000004fd 	strdeq	r0, [r0], -sp
     e78:	036c9102 	cmneq	ip, #-2147483648	; 0x80000000
     e7c:	c8010063 	stmdagt	r1, {r0, r1, r5, r6}
     e80:	00000063 	andeq	r0, r0, r3, rrx
     e84:	09689102 	stmdbeq	r8!, {r1, r8, ip, pc}^
     e88:	0000036b 	andeq	r0, r0, fp, ror #6
     e8c:	0063c801 	rsbeq	ip, r3, r1, lsl #16
     e90:	91020000 	tstls	r2, r0
     e94:	73780464 	cmnvc	r8, #1677721600	; 0x64000000
     e98:	07ca0100 	strbeq	r0, [sl, r0, lsl #2]
     e9c:	02000001 	andeq	r0, r0, #1
     ea0:	0c007491 	cfstrseq	mvf7, [r0], {145}	; 0x91
     ea4:	71010604 	tstvc	r1, r4, lsl #12
     ea8:	01000003 	tsteq	r0, r3
     eac:	04fd01d1 	ldrbteq	r0, [sp], #465	; 0x1d1
     eb0:	1e100000 	cdpne	0, 1, cr0, cr0, cr0, {0}
     eb4:	1ea00000 	cdpne	0, 10, cr0, cr0, cr0, {0}
     eb8:	091e0000 	ldmdbeq	lr, {}
     ebc:	05610000 	strbeq	r0, [r1]!
     ec0:	1a090000 	bne	240ec8 <bss_end+0x23dbe0>
     ec4:	01000003 	tsteq	r0, r3
     ec8:	0004fdd1 	ldrdeq	pc, [r4], -r1
     ecc:	6c910200 	lfmvs	f0, 4, [r1], {0}	; (ldcvs 2, cr0, [r1], {0})
     ed0:	63727303 	cmnvs	r2, #201326592	; 0xc000000
     ed4:	61d10100 	bicsvs	r0, r1, r0, lsl #2
     ed8:	02000005 	andeq	r0, r0, #5
     edc:	6b096891 	blvs	25b128 <bss_end+0x257e40>
     ee0:	01000003 	tsteq	r0, r3
     ee4:	000063d1 	ldrdeq	r6, [r0], -r1
     ee8:	64910200 	ldrvs	r0, [r1], #512	; 0x200
     eec:	706d7404 	rsbvc	r7, sp, r4, lsl #8
     ef0:	07d30100 	ldrbeq	r0, [r3, r0, lsl #2]
     ef4:	02000001 	andeq	r0, r0, #1
     ef8:	73047091 	movwvc	r7, #16529	; 0x4091
     efc:	07d30100 	ldrbeq	r0, [r3, r0, lsl #2]
     f00:	02000001 	andeq	r0, r0, #1
     f04:	08007491 	stmdaeq	r0, {r0, r4, r7, sl, ip, sp, lr}
     f08:	00056704 	andeq	r6, r5, r4, lsl #14
     f0c:	01060d00 	tsteq	r6, r0, lsl #26
     f10:	000002da 	ldrdeq	r0, [r0], -sl
     f14:	fd01da01 	stc2	10, cr13, [r1, #-4]
     f18:	a0000004 	andge	r0, r0, r4
     f1c:	b800001e 	stmdalt	r0, {r1, r2, r3, r4}
     f20:	4900001f 	stmdbmi	r0, {r0, r1, r2, r3, r4}
     f24:	ca000009 	bgt	f50 <xtoa+0x54>
     f28:	09000005 	stmdbeq	r0, {r0, r2}
     f2c:	0000031a 	andeq	r0, r0, sl, lsl r3
     f30:	04fdda01 	ldrbteq	sp, [sp], #2561	; 0xa01
     f34:	91020000 	tstls	r2, r0
     f38:	7273036c 	rsbsvc	r0, r3, #-1342177279	; 0xb0000001
     f3c:	da010063 	ble	410d0 <bss_end+0x3dde8>
     f40:	00000561 	andeq	r0, r0, r1, ror #10
     f44:	09689102 	stmdbeq	r8!, {r1, r8, ip, pc}^
     f48:	0000036b 	andeq	r0, r0, fp, ror #6
     f4c:	0063da01 	rsbeq	sp, r3, r1, lsl #20
     f50:	91020000 	tstls	r2, r0
     f54:	6d740464 	cfldrdvs	mvd0, [r4, #-400]!	; 0xfffffe70
     f58:	dc010070 	stcle	0, cr0, [r1], {112}	; 0x70
     f5c:	00000107 	andeq	r0, r0, r7, lsl #2
     f60:	04709102 	ldrbteq	r9, [r0], #-258	; 0x102
     f64:	dc010073 	stcle	0, cr0, [r1], {115}	; 0x73
     f68:	00000107 	andeq	r0, r0, r7, lsl #2
     f6c:	00749102 	rsbseq	r9, r4, r2, lsl #2
     f70:	02e90106 	rsceq	r0, r9, #-2147483647	; 0x80000001
     f74:	ed010000 	stc	0, cr0, [r1]
     f78:	00006301 	andeq	r6, r0, r1, lsl #6
     f7c:	001fb800 	andseq	fp, pc, r0, lsl #16
     f80:	00206000 	eoreq	r6, r0, r0
     f84:	00097400 	andeq	r7, r9, r0, lsl #8
     f88:	00063a00 	andeq	r3, r6, r0, lsl #20
     f8c:	73630300 	cmnvc	r3, #0
     f90:	61ed0100 	mvnvs	r0, r0, lsl #2
     f94:	02000005 	andeq	r0, r0, #5
     f98:	63036491 	movwvs	r6, #13457	; 0x3491
     f9c:	ed010074 	stc	0, cr0, [r1, #-464]	; 0xfffffe30
     fa0:	00000561 	andeq	r0, r0, r1, ror #10
     fa4:	09609102 	stmdbeq	r0!, {r1, r8, ip, pc}^
     fa8:	0000036b 	andeq	r0, r0, fp, ror #6
     fac:	0063ed01 	rsbeq	lr, r3, r1, lsl #26
     fb0:	91020000 	tstls	r2, r0
     fb4:	7573045c 	ldrbvc	r0, [r3, #-1116]!	; 0x45c
     fb8:	ef010031 	svc	0x00010031
     fbc:	0000063a 	andeq	r0, r0, sl, lsr r6
     fc0:	046c9102 	strbteq	r9, [ip], #-258	; 0x102
     fc4:	00327573 	eorseq	r7, r2, r3, ror r5
     fc8:	063aef01 	ldrteq	lr, [sl], -r1, lsl #30
     fcc:	91020000 	tstls	r2, r0
     fd0:	65720470 	ldrbvs	r0, [r2, #-1136]!	; 0x470
     fd4:	f0010073 	undefined instruction 0xf0010073
     fd8:	00000063 	andeq	r0, r0, r3, rrx
     fdc:	00749102 	rsbseq	r9, r4, r2, lsl #2
     fe0:	06400408 	strbeq	r0, [r0], -r8, lsl #8
     fe4:	450a0000 	strmi	r0, [sl]
     fe8:	07000006 	streq	r0, [r0, -r6]
     fec:	01500801 	cmpeq	r0, r1, lsl #16
     ff0:	01060000 	tsteq	r6, r0
     ff4:	00000304 	andeq	r0, r0, r4, lsl #6
     ff8:	fd01f701 	stc2	7, cr15, [r1, #-4]
     ffc:	60000004 	andvs	r0, r0, r4
    1000:	dc000020 	stcle	0, cr0, [r0], {32}
    1004:	9f000020 	svcls	0x00000020
    1008:	9e000009 	cdpls	0, 0, cr0, cr0, cr9, {0}
    100c:	09000006 	stmdbeq	r0, {r1, r2}
    1010:	000001b1 	undefined instruction 0x000001b1
    1014:	04fdf701 	ldrbteq	pc, [sp], #1793	; 0x701
    1018:	91020000 	tstls	r2, r0
    101c:	0063036c 	rsbeq	r0, r3, ip, ror #6
    1020:	0063f701 	rsbeq	pc, r3, r1, lsl #14
    1024:	91020000 	tstls	r2, r0
    1028:	015e0968 	cmpeq	lr, r8, ror #18
    102c:	f7010000 	undefined instruction 0xf7010000
    1030:	00000063 	andeq	r0, r0, r3, rrx
    1034:	04649102 	strbteq	r9, [r4], #-258	; 0x102
    1038:	f9010070 	undefined instruction 0xf9010070
    103c:	0000069e 	muleq	r0, lr, r6
    1040:	00749102 	rsbseq	r9, r4, r2, lsl #2
    1044:	06450408 	strbeq	r0, [r5], -r8, lsl #8
    1048:	010e0000 	tsteq	lr, r0
    104c:	00000378 	andeq	r0, r0, r8, ror r3
    1050:	01010301 	tsteq	r1, r1, lsl #6
    1054:	00000107 	andeq	r0, r0, r7, lsl #2
    1058:	000020dc 	ldrdeq	r2, [r0], -ip
    105c:	00002188 	andeq	r2, r0, r8, lsl #3
    1060:	000009ca 	andeq	r0, r0, sl, asr #19
    1064:	000006fb 	strdeq	r0, [r0], -fp
    1068:	0031730f 	eorseq	r7, r1, pc, lsl #6
    106c:	aa010301 	bge	41c78 <bss_end+0x3e990>
    1070:	02000001 	andeq	r0, r0, #1
    1074:	730f6c91 	movwvc	r6, #64657	; 0xfc91
    1078:	03010032 	movweq	r0, #4146	; 0x1032
    107c:	0001aa01 	andeq	sl, r1, r1, lsl #20
    1080:	68910200 	ldmvs	r1, {r9}
    1084:	00316c10 	eorseq	r6, r1, r0, lsl ip
    1088:	63010501 	movwvs	r0, #5377	; 0x1501
    108c:	02000000 	andeq	r0, r0, #0
    1090:	6c107091 	ldcvs	0, cr7, [r0], {145}	; 0x91
    1094:	05010032 	streq	r0, [r1, #-50]	; 0x32
    1098:	00006301 	andeq	r6, r0, r1, lsl #6
    109c:	74910200 	ldrvc	r0, [r1], #512	; 0x200
    10a0:	fd011100 	stc2	1, cr1, [r1]
    10a4:	01000002 	tsteq	r0, r2
    10a8:	fd010113 	stc2	1, cr0, [r1, #-76]	; 0xffffffb4
    10ac:	88000004 	stmdahi	r0, {r2}
    10b0:	28000021 	stmdacs	r0, {r0, r5}
    10b4:	f5000022 	undefined instruction 0xf5000022
    10b8:	0f000009 	svceq	0x00000009
    10bc:	13010073 	movwne	r0, #4211	; 0x1073
    10c0:	00056101 	andeq	r6, r5, r1, lsl #2
    10c4:	6c910200 	lfmvs	f0, 4, [r1], {0}	; (ldcvs 2, cr0, [r1], {0})
    10c8:	0100630f 	tsteq	r0, pc, lsl #6
    10cc:	00630113 	rsbeq	r0, r3, r3, lsl r1
    10d0:	91020000 	tstls	r2, r0
    10d4:	006e0f68 	rsbeq	r0, lr, r8, ror #30
    10d8:	63011301 	movwvs	r1, #4865	; 0x1301
    10dc:	02000000 	andeq	r0, r0, #0
    10e0:	70106491 	mulsvc	r0, r1, r4
    10e4:	01150100 	tsteq	r5, r0, lsl #2
    10e8:	0000063a 	andeq	r0, r0, sl, lsr r6
    10ec:	00749102 	rsbseq	r9, r4, r2, lsl #2
    10f0:	0000af00 	andeq	sl, r0, r0, lsl #30
    10f4:	19000200 	stmdbne	r0, {r9}
    10f8:	04000005 	streq	r0, [r0], #-5
    10fc:	00005c01 	andeq	r5, r0, r1, lsl #24
    1100:	03c60100 	biceq	r0, r6, #0
    1104:	00000000 	andeq	r0, r0, r0
    1108:	22280000 	eorcs	r0, r8, #0
    110c:	230c0000 	movwcs	r0, #49152	; 0xc000
    1110:	050a0000 	streq	r0, [sl]
    1114:	01020000 	tsteq	r2, r0
    1118:	0000039f 	muleq	r0, pc, r3
    111c:	28012101 	stmdacs	r1, {r0, r8, sp}
    1120:	0c000022 	stceq	0, cr0, [r0], {34}	; 0x22
    1124:	20000023 	andcs	r0, r0, r3, lsr #32
    1128:	6700000a 	strvs	r0, [r0, -sl]
    112c:	03000000 	movweq	r0, #0
    1130:	000003bc 	undefined instruction 0x000003bc
    1134:	00672101 	rsbeq	r2, r7, r1, lsl #2
    1138:	91020000 	tstls	r2, r0
    113c:	0397036c 	orrseq	r0, r7, #-1342177279	; 0xb0000001
    1140:	21010000 	tstcs	r1, r0
    1144:	00000067 	andeq	r0, r0, r7, rrx
    1148:	04689102 	strbteq	r9, [r8], #-258	; 0x102
    114c:	23010069 	movwcs	r0, #4201	; 0x1069
    1150:	0000006e 	andeq	r0, r0, lr, rrx
    1154:	00749102 	rsbseq	r9, r4, r2, lsl #2
    1158:	ce050405 	cdpgt	4, 0, cr0, cr5, cr5, {0}
    115c:	06000000 	streq	r0, [r0], -r0
    1160:	6e690504 	cdpvs	5, 6, cr0, cr9, cr4, {0}
    1164:	a8070074 	stmdage	r7, {r2, r4, r5, r6}
    1168:	01000003 	tsteq	r0, r3
    116c:	0000671d 	andeq	r6, r0, sp, lsl r7
    1170:	e4030500 	str	r0, [r3], #-1280	; 0x500
    1174:	08000023 	stmdaeq	r0, {r0, r1, r5}
    1178:	0000009a 	muleq	r0, sl, r0
    117c:	00000097 	muleq	r0, r7, r0
    1180:	00009709 	andeq	r9, r0, r9, lsl #14
    1184:	000eff00 	andeq	pc, lr, r0, lsl #30
    1188:	0507040a 	streq	r0, [r7, #-1034]	; 0x40a
    118c:	01500801 	cmpeq	r0, r1, lsl #16
    1190:	b4070000 	strlt	r0, [r7]
    1194:	01000003 	tsteq	r0, r3
    1198:	0000861f 	andeq	r8, r0, pc, lsl r6
    119c:	e8030500 	stmda	r3, {r8, sl}
    11a0:	00000023 	andeq	r0, r0, r3, lsr #32
    11a4:	0000004a 	andeq	r0, r0, sl, asr #32
    11a8:	05a20002 	streq	r0, [r2, #2]!
    11ac:	01040000 	tsteq	r4, r0
    11b0:	0000005c 	andeq	r0, r0, ip, asr r0
    11b4:	0003dc01 	andeq	sp, r3, r1, lsl #24
    11b8:	00000000 	andeq	r0, r0, r0
    11bc:	00230c00 	eoreq	r0, r3, r0, lsl #24
    11c0:	00234c00 	eoreq	r4, r3, r0, lsl #24
    11c4:	00055100 	andeq	r5, r5, r0, lsl #2
    11c8:	d2010200 	andle	r0, r1, #0
    11cc:	01000003 	tsteq	r0, r3
    11d0:	00230c13 	eoreq	r0, r3, r3, lsl ip
    11d4:	00232c00 	eoreq	r2, r3, r0, lsl #24
    11d8:	000a4b00 	andeq	r4, sl, r0, lsl #22
    11dc:	d7010200 	strle	r0, [r1, -r0, lsl #4]
    11e0:	01000003 	tsteq	r0, r3
    11e4:	00232c18 	eoreq	r2, r3, r8, lsl ip
    11e8:	00234c00 	eoreq	r4, r3, r0, lsl #24
    11ec:	000a7600 	andeq	r7, sl, r0, lsl #12
    11f0:	00630000 	rsbeq	r0, r3, r0
    11f4:	00020000 	andeq	r0, r2, r0
    11f8:	000005c9 	andeq	r0, r0, r9, asr #11
    11fc:	05900104 	ldreq	r0, [r0, #260]	; 0x104
    1200:	234c0000 	movtcs	r0, #49152	; 0xc000
    1204:	23600000 	cmncs	r0, #0
    1208:	70610000 	rsbvc	r0, r1, r0
    120c:	646c2f70 	strbtvs	r2, [ip], #-3952	; 0xf70
    1210:	6e696c5f 	mcrvs	12, 3, r6, cr9, cr15, {2}
    1214:	532e7875 	teqpl	lr, #7667712	; 0x750000
    1218:	6f682f00 	svcvs	0x00682f00
    121c:	642f656d 	strtvs	r6, [pc], #1389	; 1224 <uprintf+0x1b4>
    1220:	6e6f6d65 	cdpvs	13, 6, cr6, cr15, cr5, {3}
    1224:	2f666c65 	svccs	0x00666c65
    1228:	6a6f7270 	bvs	1bddbf0 <bss_end+0x1bda908>
    122c:	2f746365 	svccs	0x00746365
    1230:	6d2e3030 	stcvs	0, cr3, [lr, #-192]!	; 0xffffff40
    1234:	726f7779 	rsbvc	r7, pc, #31719424	; 0x1e40000
    1238:	656c2f6b 	strbvs	r2, [ip, #-3947]!	; 0xf6b
    123c:	79636167 	stmdbvc	r3!, {r0, r1, r2, r5, r6, r8, sp, lr}^
    1240:	6d72612d 	ldfvse	f6, [r2, #-180]!	; 0xffffff4c
    1244:	6e696c2d 	cdpvs	12, 6, cr6, cr9, cr13, {1}
    1248:	47007875 	smlsdxmi	r0, r5, r8, r7
    124c:	4120554e 	teqmi	r0, lr, asr #10
    1250:	2e322053 	mrccs	0, 1, r2, cr2, cr3, {2}
    1254:	01003032 	tsteq	r0, r2, lsr r0
    1258:	Address 0x00001258 is out of bounds.


Disassembly of section .debug_abbrev:

00000000 <.debug_abbrev>:
   0:	10001101 	andne	r1, r0, r1, lsl #2
   4:	12011106 	andne	r1, r1, #-2147483647	; 0x80000001
   8:	1b080301 	blne	200c14 <bss_end+0x1fd92c>
   c:	13082508 	movwne	r2, #34056	; 0x8508
  10:	00000005 	andeq	r0, r0, r5
  14:	25011101 	strcs	r1, [r1, #-257]	; 0x101
  18:	030b130e 	movweq	r1, #45838	; 0xb30e
  1c:	110e1b0e 	tstne	lr, lr, lsl #22
  20:	10011201 	andne	r1, r1, r1, lsl #4
  24:	02000006 	andeq	r0, r0, #6
  28:	0c3f012e 	ldfeqs	f0, [pc], #-184	; 0xffffff48
  2c:	0b3a0e03 	bleq	e83840 <bss_end+0xe80558>
  30:	0c270b3b 	stceq	11, cr0, [r7], #-236	; 0xffffff14
  34:	01120111 	tsteq	r2, r1, lsl r1
  38:	13010640 	movwne	r0, #5696	; 0x1640
  3c:	34030000 	strcc	r0, [r3]
  40:	3a0e0300 	bcc	380c48 <bss_end+0x37d960>
  44:	490b3b0b 	stmdbmi	fp, {r0, r1, r3, r8, r9, fp, ip, sp}
  48:	000a0213 	andeq	r0, sl, r3, lsl r2
  4c:	00240400 	eoreq	r0, r4, r0, lsl #8
  50:	0b3e0b0b 	bleq	f82c84 <bss_end+0xf7f99c>
  54:	00000e03 	andeq	r0, r0, r3, lsl #28
  58:	0b000f05 	bleq	3c74 <bss_end+0x98c>
  5c:	0013490b 	andseq	r4, r3, fp, lsl #18
  60:	012e0600 	teqeq	lr, r0, lsl #12
  64:	0e030c3f 	mcreq	12, 0, r0, cr3, cr15, {1}
  68:	0b3b0b3a 	bleq	ec2d58 <bss_end+0xebfa70>
  6c:	01110c27 	tsteq	r1, r7, lsr #24
  70:	06400112 	undefined instruction 0x06400112
  74:	34070000 	strcc	r0, [r7]
  78:	3a080300 	bcc	200c80 <bss_end+0x1fd998>
  7c:	490b3b0b 	stmdbmi	fp, {r0, r1, r3, r8, r9, fp, ip, sp}
  80:	000a0213 	andeq	r0, sl, r3, lsl r2
  84:	11010000 	tstne	r1, r0
  88:	130e2501 	movwne	r2, #58625	; 0xe501
  8c:	1b0e030b 	blne	380cc0 <bss_end+0x37d9d8>
  90:	1201110e 	andne	r1, r1, #-2147483645	; 0x80000003
  94:	00061001 	andeq	r1, r6, r1
  98:	012e0200 	teqeq	lr, r0, lsl #4
  9c:	0e030c3f 	mcreq	12, 0, r0, cr3, cr15, {1}
  a0:	0b3b0b3a 	bleq	ec2d90 <bss_end+0xebfaa8>
  a4:	01110c27 	tsteq	r1, r7, lsr #24
  a8:	06400112 	undefined instruction 0x06400112
  ac:	00001301 	andeq	r1, r0, r1, lsl #6
  b0:	03000503 	movweq	r0, #1283	; 0x503
  b4:	3b0b3a0e 	blcc	2ce8f4 <bss_end+0x2cb60c>
  b8:	0213490b 	andseq	r4, r3, #180224	; 0x2c000
  bc:	0400000a 	streq	r0, [r0], #-10
  c0:	08030034 	stmdaeq	r3, {r2, r4, r5}
  c4:	0b3b0b3a 	bleq	ec2db4 <bss_end+0xebfacc>
  c8:	0a021349 	beq	84df4 <bss_end+0x81b0c>
  cc:	24050000 	strcs	r0, [r5]
  d0:	3e0b0b00 	vmlacc.f64	d0, d11, d0
  d4:	0008030b 	andeq	r0, r8, fp, lsl #6
  d8:	01010600 	tsteq	r1, r0, lsl #12
  dc:	13011349 	movwne	r1, #4937	; 0x1349
  e0:	21070000 	tstcs	r7, r0
  e4:	2f134900 	svccs	0x00134900
  e8:	0800000b 	stmdaeq	r0, {r0, r1, r3}
  ec:	0b0b0024 	bleq	2c0184 <bss_end+0x2bce9c>
  f0:	00000b3e 	andeq	r0, r0, lr, lsr fp
  f4:	0b002409 	bleq	9120 <bss_end+0x5e38>
  f8:	030b3e0b 	movweq	r3, #48651	; 0xbe0b
  fc:	0a00000e 	beq	13c <mem_cfg_val+0x2c>
 100:	0b0b000f 	bleq	2c0144 <bss_end+0x2bce5c>
 104:	00001349 	andeq	r1, r0, r9, asr #6
 108:	3f012e0b 	svccc	0x00012e0b
 10c:	3a0e030c 	bcc	380d44 <bss_end+0x37da5c>
 110:	110b3b0b 	tstne	fp, fp, lsl #22
 114:	40011201 	andmi	r1, r1, r1, lsl #4
 118:	00130106 	andseq	r0, r3, r6, lsl #2
 11c:	00340c00 	eorseq	r0, r4, r0, lsl #24
 120:	0b3a0e03 	bleq	e83934 <bss_end+0xe8064c>
 124:	13490b3b 	movtne	r0, #39739	; 0x9b3b
 128:	00000a02 	andeq	r0, r0, r2, lsl #20
 12c:	4900210d 	stmdbmi	r0, {r0, r2, r3, r8, sp}
 130:	00052f13 	andeq	r2, r5, r3, lsl pc
 134:	002e0e00 	eoreq	r0, lr, r0, lsl #28
 138:	0e030c3f 	mcreq	12, 0, r0, cr3, cr15, {1}
 13c:	0b3b0b3a 	bleq	ec2e2c <bss_end+0xebfb44>
 140:	01120111 	tsteq	r2, r1, lsl r1
 144:	00000640 	andeq	r0, r0, r0, asr #12
 148:	0300340f 	movweq	r3, #1039	; 0x40f
 14c:	3b0b3a08 	blcc	2ce974 <bss_end+0x2cb68c>
 150:	3f13490b 	svccc	0x0013490b
 154:	000a020c 	andeq	r0, sl, ip, lsl #4
 158:	11010000 	tstne	r1, r0
 15c:	130e2501 	movwne	r2, #58625	; 0xe501
 160:	1b0e030b 	blne	380d94 <bss_end+0x37daac>
 164:	1201110e 	andne	r1, r1, #-2147483645	; 0x80000003
 168:	00061001 	andeq	r1, r6, r1
 16c:	002e0200 	eoreq	r0, lr, r0, lsl #4
 170:	0e030c3f 	mcreq	12, 0, r0, cr3, cr15, {1}
 174:	0b3b0b3a 	bleq	ec2e64 <bss_end+0xebfb7c>
 178:	01120111 	tsteq	r2, r1, lsl r1
 17c:	00000640 	andeq	r0, r0, r0, asr #12
 180:	3f012e03 	svccc	0x00012e03
 184:	3a0e030c 	bcc	380dbc <bss_end+0x37dad4>
 188:	270b3b0b 	strcs	r3, [fp, -fp, lsl #22]
 18c:	1201110c 	andne	r1, r1, #3
 190:	01064001 	tsteq	r6, r1
 194:	04000013 	streq	r0, [r0], #-19
 198:	0e030005 	cdpeq	0, 0, cr0, cr3, cr5, {0}
 19c:	0b3b0b3a 	bleq	ec2e8c <bss_end+0xebfba4>
 1a0:	0a021349 	beq	84ecc <bss_end+0x81be4>
 1a4:	24050000 	strcs	r0, [r5]
 1a8:	3e0b0b00 	vmlacc.f64	d0, d11, d0
 1ac:	000e030b 	andeq	r0, lr, fp, lsl #6
 1b0:	00340600 	eorseq	r0, r4, r0, lsl #12
 1b4:	0b3a0803 	bleq	e821c8 <bss_end+0xe7eee0>
 1b8:	13490b3b 	movtne	r0, #39739	; 0x9b3b
 1bc:	00000a02 	andeq	r0, r0, r2, lsl #20
 1c0:	0b000f07 	bleq	3de4 <bss_end+0xafc>
 1c4:	0013490b 	andseq	r4, r3, fp, lsl #18
 1c8:	00240800 	eoreq	r0, r4, r0, lsl #16
 1cc:	0b3e0b0b 	bleq	f82e00 <bss_end+0xf7fb18>
 1d0:	00000803 	andeq	r0, r0, r3, lsl #16
 1d4:	3f012e09 	svccc	0x00012e09
 1d8:	3a0e030c 	bcc	380e10 <bss_end+0x37db28>
 1dc:	270b3b0b 	strcs	r3, [fp, -fp, lsl #22]
 1e0:	1113490c 	tstne	r3, ip, lsl #18
 1e4:	40011201 	andmi	r1, r1, r1, lsl #4
 1e8:	00130106 	andseq	r0, r3, r6, lsl #2
 1ec:	012e0a00 	teqeq	lr, r0, lsl #20
 1f0:	0e030c3f 	mcreq	12, 0, r0, cr3, cr15, {1}
 1f4:	0b3b0b3a 	bleq	ec2ee4 <bss_end+0xebfbfc>
 1f8:	13490c27 	movtne	r0, #39975	; 0x9c27
 1fc:	01120111 	tsteq	r2, r1, lsl r1
 200:	00000640 	andeq	r0, r0, r0, asr #12
 204:	11010000 	tstne	r1, r0
 208:	130e2501 	movwne	r2, #58625	; 0xe501
 20c:	1b0e030b 	blne	380e40 <bss_end+0x37db58>
 210:	1201110e 	andne	r1, r1, #-2147483645	; 0x80000003
 214:	00061001 	andeq	r1, r6, r1
 218:	002e0200 	eoreq	r0, lr, r0, lsl #4
 21c:	0e030c3f 	mcreq	12, 0, r0, cr3, cr15, {1}
 220:	0b3b0b3a 	bleq	ec2f10 <bss_end+0xebfc28>
 224:	01110c27 	tsteq	r1, r7, lsr #24
 228:	06400112 	undefined instruction 0x06400112
 22c:	01000000 	tsteq	r0, r0
 230:	0e250111 	mcreq	1, 1, r0, cr5, cr1, {0}
 234:	0e030b13 	vmoveq.32	d3[0], r0
 238:	01110e1b 	tsteq	r1, fp, lsl lr
 23c:	06100112 	undefined instruction 0x06100112
 240:	16020000 	strne	r0, [r2], -r0
 244:	3a0e0300 	bcc	380e4c <bss_end+0x37db64>
 248:	490b3b0b 	stmdbmi	fp, {r0, r1, r3, r8, r9, fp, ip, sp}
 24c:	03000013 	movweq	r0, #19
 250:	0e030113 	mcreq	1, 0, r0, cr3, cr3, {0}
 254:	13010b0b 	movwne	r0, #6923	; 0x1b0b
 258:	0d040000 	stceq	0, cr0, [r4]
 25c:	490e0300 	stmdbmi	lr, {r8, r9}
 260:	340a3813 	strcc	r3, [sl], #-2067	; 0x813
 264:	0500000c 	streq	r0, [r0, #-12]
 268:	0b0b000f 	bleq	2c02ac <bss_end+0x2bcfc4>
 26c:	2e060000 	cdpcs	0, 0, cr0, cr6, cr0, {0}
 270:	030c3f00 	movweq	r3, #52992	; 0xcf00
 274:	3b0b3a0e 	blcc	2ceab4 <bss_end+0x2cb7cc>
 278:	110c270b 	tstne	ip, fp, lsl #14
 27c:	40011201 	andmi	r1, r1, r1, lsl #4
 280:	07000006 	streq	r0, [r0, -r6]
 284:	0c3f012e 	ldfeqs	f0, [pc], #-184	; 0xffffff48
 288:	0b3a0e03 	bleq	e83a9c <bss_end+0xe807b4>
 28c:	0c270b3b 	stceq	11, cr0, [r7], #-236	; 0xffffff14
 290:	01120111 	tsteq	r2, r1, lsl r1
 294:	13010640 	movwne	r0, #5696	; 0x1640
 298:	05080000 	streq	r0, [r8]
 29c:	3a080300 	bcc	200ea4 <bss_end+0x1fdbbc>
 2a0:	490b3b0b 	stmdbmi	fp, {r0, r1, r3, r8, r9, fp, ip, sp}
 2a4:	000a0213 	andeq	r0, sl, r3, lsl r2
 2a8:	00240900 	eoreq	r0, r4, r0, lsl #18
 2ac:	0b3e0b0b 	bleq	f82ee0 <bss_end+0xf7fbf8>
 2b0:	00000e03 	andeq	r0, r0, r3, lsl #28
 2b4:	3f002e0a 	svccc	0x00002e0a
 2b8:	3a0e030c 	bcc	380ef0 <bss_end+0x37dc08>
 2bc:	270b3b0b 	strcs	r3, [fp, -fp, lsl #22]
 2c0:	1113490c 	tstne	r3, ip, lsl #18
 2c4:	40011201 	andmi	r1, r1, r1, lsl #4
 2c8:	0b000006 	bleq	2e8 <mmu_init+0x64>
 2cc:	0b0b000f 	bleq	2c0310 <bss_end+0x2bd028>
 2d0:	00001349 	andeq	r1, r0, r9, asr #6
 2d4:	3f012e0c 	svccc	0x00012e0c
 2d8:	3a0e030c 	bcc	380f10 <bss_end+0x37dc28>
 2dc:	270b3b0b 	strcs	r3, [fp, -fp, lsl #22]
 2e0:	1113490c 	tstne	r3, ip, lsl #18
 2e4:	40011201 	andmi	r1, r1, r1, lsl #4
 2e8:	00130106 	andseq	r0, r3, r6, lsl #2
 2ec:	00340d00 	eorseq	r0, r4, r0, lsl #26
 2f0:	0b3a0e03 	bleq	e83b04 <bss_end+0xe8081c>
 2f4:	13490b3b 	movtne	r0, #39739	; 0x9b3b
 2f8:	00000a02 	andeq	r0, r0, r2, lsl #20
 2fc:	0300340e 	movweq	r3, #1038	; 0x40e
 300:	3b0b3a08 	blcc	2ceb28 <bss_end+0x2cb840>
 304:	0213490b 	andseq	r4, r3, #180224	; 0x2c000
 308:	0f00000a 	svceq	0x0000000a
 30c:	0b0b0024 	bleq	2c03a4 <bss_end+0x2bd0bc>
 310:	08030b3e 	stmdaeq	r3, {r1, r2, r3, r4, r5, r8, r9, fp}
 314:	18100000 	ldmdane	r0, {}
 318:	11000000 	tstne	r0, r0
 31c:	13490026 	movtne	r0, #36902	; 0x9026
 320:	01120000 	tsteq	r2, r0
 324:	01134901 	tsteq	r3, r1, lsl #18
 328:	13000013 	movwne	r0, #19
 32c:	13490021 	movtne	r0, #36897	; 0x9021
 330:	00000b2f 	andeq	r0, r0, pc, lsr #22
 334:	0b002414 	bleq	938c <bss_end+0x60a4>
 338:	000b3e0b 	andeq	r3, fp, fp, lsl #28
 33c:	11010000 	tstne	r1, r0
 340:	130e2501 	movwne	r2, #58625	; 0xe501
 344:	1b0e030b 	blne	380f78 <bss_end+0x37dc90>
 348:	1201110e 	andne	r1, r1, #-2147483645	; 0x80000003
 34c:	00061001 	andeq	r1, r6, r1
 350:	012e0200 	teqeq	lr, r0, lsl #4
 354:	0e030c3f 	mcreq	12, 0, r0, cr3, cr15, {1}
 358:	0b3b0b3a 	bleq	ec3048 <bss_end+0xebfd60>
 35c:	01110c27 	tsteq	r1, r7, lsr #24
 360:	06400112 	undefined instruction 0x06400112
 364:	00001301 	andeq	r1, r0, r1, lsl #6
 368:	03000503 	movweq	r0, #1283	; 0x503
 36c:	3b0b3a0e 	blcc	2cebac <bss_end+0x2cb8c4>
 370:	0213490b 	andseq	r4, r3, #180224	; 0x2c000
 374:	0400000a 	streq	r0, [r0], #-10
 378:	0e030034 	mcreq	0, 0, r0, cr3, cr4, {1}
 37c:	0b3b0b3a 	bleq	ec306c <bss_end+0xebfd84>
 380:	0a021349 	beq	850ac <bss_end+0x81dc4>
 384:	24050000 	strcs	r0, [r5]
 388:	3e0b0b00 	vmlacc.f64	d0, d11, d0
 38c:	000e030b 	andeq	r0, lr, fp, lsl #6
 390:	000f0600 	andeq	r0, pc, r0, lsl #12
 394:	13490b0b 	movtne	r0, #39691	; 0x9b0b
 398:	05070000 	streq	r0, [r7]
 39c:	3a080300 	bcc	200fa4 <bss_end+0x1fdcbc>
 3a0:	490b3b0b 	stmdbmi	fp, {r0, r1, r3, r8, r9, fp, ip, sp}
 3a4:	000a0213 	andeq	r0, sl, r3, lsl r2
 3a8:	002e0800 	eoreq	r0, lr, r0, lsl #16
 3ac:	0e030c3f 	mcreq	12, 0, r0, cr3, cr15, {1}
 3b0:	0b3b0b3a 	bleq	ec30a0 <bss_end+0xebfdb8>
 3b4:	01120111 	tsteq	r2, r1, lsl r1
 3b8:	00000640 	andeq	r0, r0, r0, asr #12
 3bc:	01110100 	tsteq	r1, r0, lsl #2
 3c0:	0b130e25 	bleq	4c3c5c <bss_end+0x4c0974>
 3c4:	0e1b0e03 	cdpeq	14, 1, cr0, cr11, cr3, {0}
 3c8:	01120111 	tsteq	r2, r1, lsl r1
 3cc:	00000610 	andeq	r0, r0, r0, lsl r6
 3d0:	3f002e02 	svccc	0x00002e02
 3d4:	3a0e030c 	bcc	38100c <bss_end+0x37dd24>
 3d8:	270b3b0b 	strcs	r3, [fp, -fp, lsl #22]
 3dc:	1201110c 	andne	r1, r1, #3
 3e0:	00064001 	andeq	r4, r6, r1
 3e4:	002e0300 	eoreq	r0, lr, r0, lsl #6
 3e8:	0e030c3f 	mcreq	12, 0, r0, cr3, cr15, {1}
 3ec:	0b3b0b3a 	bleq	ec30dc <bss_end+0xebfdf4>
 3f0:	01120111 	tsteq	r2, r1, lsl r1
 3f4:	00000640 	andeq	r0, r0, r0, asr #12
 3f8:	3f002e04 	svccc	0x00002e04
 3fc:	3a0e030c 	bcc	381034 <bss_end+0x37dd4c>
 400:	490b3b0b 	stmdbmi	fp, {r0, r1, r3, r8, r9, fp, ip, sp}
 404:	12011113 	andne	r1, r1, #-1073741820	; 0xc0000004
 408:	00064001 	andeq	r4, r6, r1
 40c:	00240500 	eoreq	r0, r4, r0, lsl #10
 410:	0b3e0b0b 	bleq	f83044 <bss_end+0xf7fd5c>
 414:	00000803 	andeq	r0, r0, r3, lsl #16
 418:	01110100 	tsteq	r1, r0, lsl #2
 41c:	0b130e25 	bleq	4c3cb8 <bss_end+0x4c09d0>
 420:	0e1b0e03 	cdpeq	14, 1, cr0, cr11, cr3, {0}
 424:	01120111 	tsteq	r2, r1, lsl r1
 428:	00000610 	andeq	r0, r0, r0, lsl r6
 42c:	3f012e02 	svccc	0x00012e02
 430:	3a0e030c 	bcc	381068 <bss_end+0x37dd80>
 434:	270b3b0b 	strcs	r3, [fp, -fp, lsl #22]
 438:	1201110c 	andne	r1, r1, #3
 43c:	01064001 	tsteq	r6, r1
 440:	03000013 	movweq	r0, #19
 444:	08030005 	stmdaeq	r3, {r0, r2}
 448:	0b3b0b3a 	bleq	ec3138 <bss_end+0xebfe50>
 44c:	0a021349 	beq	85178 <bss_end+0x81e90>
 450:	34040000 	strcc	r0, [r4]
 454:	3a080300 	bcc	20105c <bss_end+0x1fdd74>
 458:	490b3b0b 	stmdbmi	fp, {r0, r1, r3, r8, r9, fp, ip, sp}
 45c:	000a0213 	andeq	r0, sl, r3, lsl r2
 460:	00240500 	eoreq	r0, r4, r0, lsl #10
 464:	0b3e0b0b 	bleq	f83098 <bss_end+0xf7fdb0>
 468:	00000803 	andeq	r0, r0, r3, lsl #16
 46c:	3f012e06 	svccc	0x00012e06
 470:	3a0e030c 	bcc	3810a8 <bss_end+0x37ddc0>
 474:	270b3b0b 	strcs	r3, [fp, -fp, lsl #22]
 478:	1113490c 	tstne	r3, ip, lsl #18
 47c:	40011201 	andmi	r1, r1, r1, lsl #4
 480:	00130106 	andseq	r0, r3, r6, lsl #2
 484:	00240700 	eoreq	r0, r4, r0, lsl #14
 488:	0b3e0b0b 	bleq	f830bc <bss_end+0xf7fdd4>
 48c:	00000e03 	andeq	r0, r0, r3, lsl #28
 490:	0b000f08 	bleq	40b8 <bss_end+0xdd0>
 494:	0013490b 	andseq	r4, r3, fp, lsl #18
 498:	00050900 	andeq	r0, r5, r0, lsl #18
 49c:	0b3a0e03 	bleq	e83cb0 <bss_end+0xe809c8>
 4a0:	13490b3b 	movtne	r0, #39739	; 0x9b3b
 4a4:	00000a02 	andeq	r0, r0, r2, lsl #20
 4a8:	4900260a 	stmdbmi	r0, {r1, r3, r9, sl, sp}
 4ac:	0b000013 	bleq	500 <init+0xe0>
 4b0:	0e030034 	mcreq	0, 0, r0, cr3, cr4, {1}
 4b4:	0b3b0b3a 	bleq	ec31a4 <bss_end+0xebfebc>
 4b8:	0a021349 	beq	851e4 <bss_end+0x81efc>
 4bc:	0f0c0000 	svceq	0x000c0000
 4c0:	000b0b00 	andeq	r0, fp, r0, lsl #22
 4c4:	00260d00 	eoreq	r0, r6, r0, lsl #26
 4c8:	2e0e0000 	cdpcs	0, 0, cr0, cr14, cr0, {0}
 4cc:	030c3f01 	movweq	r3, #52993	; 0xcf01
 4d0:	3b0b3a0e 	blcc	2ced10 <bss_end+0x2cba28>
 4d4:	490c2705 	stmdbmi	ip, {r0, r2, r8, r9, sl, sp}
 4d8:	12011113 	andne	r1, r1, #-1073741820	; 0xc0000004
 4dc:	01064001 	tsteq	r6, r1
 4e0:	0f000013 	svceq	0x00000013
 4e4:	08030005 	stmdaeq	r3, {r0, r2}
 4e8:	053b0b3a 	ldreq	r0, [fp, #-2874]!	; 0xb3a
 4ec:	0a021349 	beq	85218 <bss_end+0x81f30>
 4f0:	34100000 	ldrcc	r0, [r0]
 4f4:	3a080300 	bcc	2010fc <bss_end+0x1fde14>
 4f8:	49053b0b 	stmdbmi	r5, {r0, r1, r3, r8, r9, fp, ip, sp}
 4fc:	000a0213 	andeq	r0, sl, r3, lsl r2
 500:	012e1100 	teqeq	lr, r0, lsl #2
 504:	0e030c3f 	mcreq	12, 0, r0, cr3, cr15, {1}
 508:	053b0b3a 	ldreq	r0, [fp, #-2874]!	; 0xb3a
 50c:	13490c27 	movtne	r0, #39975	; 0x9c27
 510:	01120111 	tsteq	r2, r1, lsl r1
 514:	00000640 	andeq	r0, r0, r0, asr #12
 518:	01110100 	tsteq	r1, r0, lsl #2
 51c:	0b130e25 	bleq	4c3db8 <bss_end+0x4c0ad0>
 520:	0e1b0e03 	cdpeq	14, 1, cr0, cr11, cr3, {0}
 524:	01120111 	tsteq	r2, r1, lsl r1
 528:	00000610 	andeq	r0, r0, r0, lsl r6
 52c:	3f012e02 	svccc	0x00012e02
 530:	3a0e030c 	bcc	381168 <bss_end+0x37de80>
 534:	270b3b0b 	strcs	r3, [fp, -fp, lsl #22]
 538:	1201110c 	andne	r1, r1, #3
 53c:	01064001 	tsteq	r6, r1
 540:	03000013 	movweq	r0, #19
 544:	0e030005 	cdpeq	0, 0, cr0, cr3, cr5, {0}
 548:	0b3b0b3a 	bleq	ec3238 <bss_end+0xebff50>
 54c:	0a021349 	beq	85278 <bss_end+0x81f90>
 550:	34040000 	strcc	r0, [r4]
 554:	3a080300 	bcc	20115c <bss_end+0x1fde74>
 558:	490b3b0b 	stmdbmi	fp, {r0, r1, r3, r8, r9, fp, ip, sp}
 55c:	000a0213 	andeq	r0, sl, r3, lsl r2
 560:	00240500 	eoreq	r0, r4, r0, lsl #10
 564:	0b3e0b0b 	bleq	f83198 <bss_end+0xf7feb0>
 568:	00000e03 	andeq	r0, r0, r3, lsl #28
 56c:	0b002406 	bleq	958c <bss_end+0x62a4>
 570:	030b3e0b 	movweq	r3, #48651	; 0xbe0b
 574:	07000008 	streq	r0, [r0, -r8]
 578:	0e030034 	mcreq	0, 0, r0, cr3, cr4, {1}
 57c:	0b3b0b3a 	bleq	ec326c <bss_end+0xebff84>
 580:	0a021349 	beq	852ac <bss_end+0x81fc4>
 584:	01080000 	tsteq	r8, r0
 588:	01134901 	tsteq	r3, r1, lsl #18
 58c:	09000013 	stmdbeq	r0, {r0, r1, r4}
 590:	13490021 	movtne	r0, #36897	; 0x9021
 594:	0000052f 	andeq	r0, r0, pc, lsr #10
 598:	0b00240a 	bleq	95c8 <bss_end+0x62e0>
 59c:	000b3e0b 	andeq	r3, fp, fp, lsl #28
 5a0:	11010000 	tstne	r1, r0
 5a4:	130e2501 	movwne	r2, #58625	; 0xe501
 5a8:	1b0e030b 	blne	3811dc <bss_end+0x37def4>
 5ac:	1201110e 	andne	r1, r1, #-2147483645	; 0x80000003
 5b0:	00061001 	andeq	r1, r6, r1
 5b4:	002e0200 	eoreq	r0, lr, r0, lsl #4
 5b8:	0e030c3f 	mcreq	12, 0, r0, cr3, cr15, {1}
 5bc:	0b3b0b3a 	bleq	ec32ac <bss_end+0xebffc4>
 5c0:	01120111 	tsteq	r2, r1, lsl r1
 5c4:	00000640 	andeq	r0, r0, r0, asr #12
 5c8:	00110100 	andseq	r0, r1, r0, lsl #2
 5cc:	01110610 	tsteq	r1, r0, lsl r6
 5d0:	08030112 	stmdaeq	r3, {r1, r4, r8}
 5d4:	0825081b 	stmdaeq	r5!, {r0, r1, r3, r4, fp}
 5d8:	00000513 	andeq	r0, r0, r3, lsl r5
	...

Disassembly of section .debug_aranges:

00000000 <.debug_aranges>:
   0:	0000001c 	andeq	r0, r0, ip, lsl r0
   4:	00000002 	andeq	r0, r0, r2
   8:	00040000 	andeq	r0, r4, r0
	...
  14:	000001b0 	undefined instruction 0x000001b0
	...
  20:	0000001c 	andeq	r0, r0, ip, lsl r0
  24:	00650002 	rsbeq	r0, r5, r2
  28:	00040000 	andeq	r0, r4, r0
  2c:	00000000 	andeq	r0, r0, r0
  30:	000001b0 	undefined instruction 0x000001b0
  34:	00000154 	andeq	r0, r0, r4, asr r1
	...
  40:	0000001c 	andeq	r0, r0, ip, lsl r0
  44:	01000002 	tsteq	r0, r2
  48:	00040000 	andeq	r0, r4, r0
  4c:	00000000 	andeq	r0, r0, r0
  50:	00000304 	andeq	r0, r0, r4, lsl #6
  54:	00000480 	andeq	r0, r0, r0, lsl #9
	...
  60:	0000001c 	andeq	r0, r0, ip, lsl r0
  64:	03350002 	teqeq	r5, #2
  68:	00040000 	andeq	r0, r4, r0
  6c:	00000000 	andeq	r0, r0, r0
  70:	00000784 	andeq	r0, r0, r4, lsl #15
  74:	00000478 	andeq	r0, r0, r8, ror r4
	...
  80:	0000001c 	andeq	r0, r0, ip, lsl r0
  84:	05610002 	strbeq	r0, [r1, #-2]!
  88:	00040000 	andeq	r0, r4, r0
  8c:	00000000 	andeq	r0, r0, r0
  90:	00000bfc 	strdeq	r0, [r0], -ip
  94:	00000014 	andeq	r0, r0, r4, lsl r0
	...
  a0:	0000001c 	andeq	r0, r0, ip, lsl r0
  a4:	059c0002 	ldreq	r0, [ip, #2]
  a8:	00040000 	andeq	r0, r4, r0
  ac:	00000000 	andeq	r0, r0, r0
  b0:	00000c10 	andeq	r0, r0, r0, lsl ip
  b4:	0000063c 	andeq	r0, r0, ip, lsr r6
	...
  c0:	0000001c 	andeq	r0, r0, ip, lsl r0
  c4:	07db0002 	ldrbeq	r0, [fp, r2]
  c8:	00040000 	andeq	r0, r4, r0
  cc:	00000000 	andeq	r0, r0, r0
  d0:	0000124c 	andeq	r1, r0, ip, asr #4
  d4:	0000015c 	andeq	r0, r0, ip, asr r1
	...
  e0:	0000001c 	andeq	r0, r0, ip, lsl r0
  e4:	090f0002 	stmdbeq	pc, {r1}
  e8:	00040000 	andeq	r0, r4, r0
  ec:	00000000 	andeq	r0, r0, r0
  f0:	000013a8 	andeq	r1, r0, r8, lsr #7
  f4:	000000fc 	strdeq	r0, [r0], -ip
	...
 100:	0000001c 	andeq	r0, r0, ip, lsl r0
 104:	09a60002 	stmibeq	r6!, {r1}
 108:	00040000 	andeq	r0, r4, r0
 10c:	00000000 	andeq	r0, r0, r0
 110:	000014a4 	andeq	r1, r0, r4, lsr #9
 114:	00000d84 	andeq	r0, r0, r4, lsl #27
	...
 120:	0000001c 	andeq	r0, r0, ip, lsl r0
 124:	10f10002 	rscsne	r0, r1, r2
 128:	00040000 	andeq	r0, r4, r0
 12c:	00000000 	andeq	r0, r0, r0
 130:	00002228 	andeq	r2, r0, r8, lsr #4
 134:	000000e4 	andeq	r0, r0, r4, ror #1
	...
 140:	0000001c 	andeq	r0, r0, ip, lsl r0
 144:	11a40002 	undefined instruction 0x11a40002
 148:	00040000 	andeq	r0, r4, r0
 14c:	00000000 	andeq	r0, r0, r0
 150:	0000230c 	andeq	r2, r0, ip, lsl #6
 154:	00000040 	andeq	r0, r0, r0, asr #32
	...
 160:	0000001c 	andeq	r0, r0, ip, lsl r0
 164:	11f20002 	mvnsne	r0, r2
 168:	00040000 	andeq	r0, r4, r0
 16c:	00000000 	andeq	r0, r0, r0
 170:	0000234c 	andeq	r2, r0, ip, asr #6
 174:	00000014 	andeq	r0, r0, r4, lsl r0
	...

Disassembly of section .debug_frame:

00000000 <.debug_frame>:
   0:	0000000c 	andeq	r0, r0, ip
   4:	ffffffff 	undefined instruction 0xffffffff
   8:	7c010001 	stcvc	0, cr0, [r1], {1}
   c:	000d0c0e 	andeq	r0, sp, lr, lsl #24
  10:	00000018 	andeq	r0, r0, r8, lsl r0
  14:	00000000 	andeq	r0, r0, r0
  18:	000001b0 	undefined instruction 0x000001b0
  1c:	000000d4 	ldrdeq	r0, [r0], -r4
  20:	11040e44 	tstne	r4, r4, asr #28
  24:	0d44010b 	stfeqe	f0, [r4, #-44]	; 0xffffffd4
  28:	0000000b 	andeq	r0, r0, fp
  2c:	00000018 	andeq	r0, r0, r8, lsl r0
  30:	00000000 	andeq	r0, r0, r0
  34:	00000284 	andeq	r0, r0, r4, lsl #5
  38:	00000080 	andeq	r0, r0, r0, lsl #1
  3c:	11040e44 	tstne	r4, r4, asr #28
  40:	0d44010b 	stfeqe	f0, [r4, #-44]	; 0xffffffd4
  44:	0000000b 	andeq	r0, r0, fp
  48:	0000000c 	andeq	r0, r0, ip
  4c:	ffffffff 	undefined instruction 0xffffffff
  50:	7c010001 	stcvc	0, cr0, [r1], {1}
  54:	000d0c0e 	andeq	r0, sp, lr, lsl #24
  58:	0000001c 	andeq	r0, r0, ip, lsl r0
  5c:	00000048 	andeq	r0, r0, r8, asr #32
  60:	00000304 	andeq	r0, r0, r4, lsl #6
  64:	000000b8 	strheq	r0, [r0], -r8
  68:	110c0e44 	tstne	ip, r4, asr #28
  6c:	0b11010e 	bleq	4404ac <bss_end+0x43d1c4>
  70:	03041102 	movweq	r1, #16642	; 0x4102
  74:	040b0c44 	streq	r0, [fp], #-3140	; 0xc44
  78:	0000001c 	andeq	r0, r0, ip, lsl r0
  7c:	00000048 	andeq	r0, r0, r8, asr #32
  80:	000003bc 	undefined instruction 0x000003bc
  84:	00000064 	andeq	r0, r0, r4, rrx
  88:	11080e44 	tstne	r8, r4, asr #28
  8c:	0b11010e 	bleq	4404cc <bss_end+0x43d1e4>
  90:	0b0c4402 	bleq	3110a0 <bss_end+0x30ddb8>
  94:	00000004 	andeq	r0, r0, r4
  98:	0000001c 	andeq	r0, r0, ip, lsl r0
  9c:	00000048 	andeq	r0, r0, r8, asr #32
  a0:	00000420 	andeq	r0, r0, r0, lsr #8
  a4:	00000210 	andeq	r0, r0, r0, lsl r2
  a8:	11080e44 	tstne	r8, r4, asr #28
  ac:	0b11010e 	bleq	4404ec <bss_end+0x43d204>
  b0:	0b0c4402 	bleq	3110c0 <bss_end+0x30ddd8>
  b4:	00000004 	andeq	r0, r0, r4
  b8:	0000001c 	andeq	r0, r0, ip, lsl r0
  bc:	00000048 	andeq	r0, r0, r8, asr #32
  c0:	00000630 	andeq	r0, r0, r0, lsr r6
  c4:	0000003c 	andeq	r0, r0, ip, lsr r0
  c8:	11080e44 	tstne	r8, r4, asr #28
  cc:	0b11010e 	bleq	44050c <bss_end+0x43d224>
  d0:	0b0c4402 	bleq	3110e0 <bss_end+0x30ddf8>
  d4:	00000004 	andeq	r0, r0, r4
  d8:	0000001c 	andeq	r0, r0, ip, lsl r0
  dc:	00000048 	andeq	r0, r0, r8, asr #32
  e0:	0000066c 	andeq	r0, r0, ip, ror #12
  e4:	00000118 	andeq	r0, r0, r8, lsl r1
  e8:	11080e44 	tstne	r8, r4, asr #28
  ec:	0b11010e 	bleq	44052c <bss_end+0x43d244>
  f0:	0b0c4402 	bleq	311100 <bss_end+0x30de18>
  f4:	00000004 	andeq	r0, r0, r4
  f8:	0000000c 	andeq	r0, r0, ip
  fc:	ffffffff 	undefined instruction 0xffffffff
 100:	7c010001 	stcvc	0, cr0, [r1], {1}
 104:	000d0c0e 	andeq	r0, sp, lr, lsl #24
 108:	00000018 	andeq	r0, r0, r8, lsl r0
 10c:	000000f8 	strdeq	r0, [r0], -r8
 110:	00000784 	andeq	r0, r0, r4, lsl #15
 114:	0000002c 	andeq	r0, r0, ip, lsr #32
 118:	11040e44 	tstne	r4, r4, asr #28
 11c:	0d44010b 	stfeqe	f0, [r4, #-44]	; 0xffffffd4
 120:	0000000b 	andeq	r0, r0, fp
 124:	00000018 	andeq	r0, r0, r8, lsl r0
 128:	000000f8 	strdeq	r0, [r0], -r8
 12c:	000007b0 	undefined instruction 0x000007b0
 130:	0000002c 	andeq	r0, r0, ip, lsr #32
 134:	11040e44 	tstne	r4, r4, asr #28
 138:	0d44010b 	stfeqe	f0, [r4, #-44]	; 0xffffffd4
 13c:	0000000b 	andeq	r0, r0, fp
 140:	00000018 	andeq	r0, r0, r8, lsl r0
 144:	000000f8 	strdeq	r0, [r0], -r8
 148:	000007dc 	ldrdeq	r0, [r0], -ip
 14c:	00000034 	andeq	r0, r0, r4, lsr r0
 150:	11040e44 	tstne	r4, r4, asr #28
 154:	0d44010b 	stfeqe	f0, [r4, #-44]	; 0xffffffd4
 158:	0000000b 	andeq	r0, r0, fp
 15c:	00000018 	andeq	r0, r0, r8, lsl r0
 160:	000000f8 	strdeq	r0, [r0], -r8
 164:	00000810 	andeq	r0, r0, r0, lsl r8
 168:	00000030 	andeq	r0, r0, r0, lsr r0
 16c:	11040e44 	tstne	r4, r4, asr #28
 170:	0d44010b 	stfeqe	f0, [r4, #-44]	; 0xffffffd4
 174:	0000000b 	andeq	r0, r0, fp
 178:	00000018 	andeq	r0, r0, r8, lsl r0
 17c:	000000f8 	strdeq	r0, [r0], -r8
 180:	00000840 	andeq	r0, r0, r0, asr #16
 184:	00000030 	andeq	r0, r0, r0, lsr r0
 188:	11040e44 	tstne	r4, r4, asr #28
 18c:	0d44010b 	stfeqe	f0, [r4, #-44]	; 0xffffffd4
 190:	0000000b 	andeq	r0, r0, fp
 194:	00000018 	andeq	r0, r0, r8, lsl r0
 198:	000000f8 	strdeq	r0, [r0], -r8
 19c:	00000870 	andeq	r0, r0, r0, ror r8
 1a0:	00000030 	andeq	r0, r0, r0, lsr r0
 1a4:	11040e44 	tstne	r4, r4, asr #28
 1a8:	0d44010b 	stfeqe	f0, [r4, #-44]	; 0xffffffd4
 1ac:	0000000b 	andeq	r0, r0, fp
 1b0:	0000001c 	andeq	r0, r0, ip, lsl r0
 1b4:	000000f8 	strdeq	r0, [r0], -r8
 1b8:	000008a0 	andeq	r0, r0, r0, lsr #17
 1bc:	0000002c 	andeq	r0, r0, ip, lsr #32
 1c0:	11080e44 	tstne	r8, r4, asr #28
 1c4:	0b11010e 	bleq	440604 <bss_end+0x43d31c>
 1c8:	0b0c4402 	bleq	3111d8 <bss_end+0x30def0>
 1cc:	00000004 	andeq	r0, r0, r4
 1d0:	0000001c 	andeq	r0, r0, ip, lsl r0
 1d4:	000000f8 	strdeq	r0, [r0], -r8
 1d8:	000008cc 	andeq	r0, r0, ip, asr #17
 1dc:	00000038 	andeq	r0, r0, r8, lsr r0
 1e0:	11080e44 	tstne	r8, r4, asr #28
 1e4:	0b11010e 	bleq	440624 <bss_end+0x43d33c>
 1e8:	0b0c4402 	bleq	3111f8 <bss_end+0x30df10>
 1ec:	00000004 	andeq	r0, r0, r4
 1f0:	0000001c 	andeq	r0, r0, ip, lsl r0
 1f4:	000000f8 	strdeq	r0, [r0], -r8
 1f8:	00000904 	andeq	r0, r0, r4, lsl #18
 1fc:	000000dc 	ldrdeq	r0, [r0], -ip
 200:	11080e44 	tstne	r8, r4, asr #28
 204:	0b11010e 	bleq	440644 <bss_end+0x43d35c>
 208:	0b0c4402 	bleq	311218 <bss_end+0x30df30>
 20c:	00000004 	andeq	r0, r0, r4
 210:	0000001c 	andeq	r0, r0, ip, lsl r0
 214:	000000f8 	strdeq	r0, [r0], -r8
 218:	000009e0 	andeq	r0, r0, r0, ror #19
 21c:	00000100 	andeq	r0, r0, r0, lsl #2
 220:	11080e44 	tstne	r8, r4, asr #28
 224:	0b11010e 	bleq	440664 <bss_end+0x43d37c>
 228:	0b0c4402 	bleq	311238 <bss_end+0x30df50>
 22c:	00000004 	andeq	r0, r0, r4
 230:	0000001c 	andeq	r0, r0, ip, lsl r0
 234:	000000f8 	strdeq	r0, [r0], -r8
 238:	00000ae0 	andeq	r0, r0, r0, ror #21
 23c:	0000007c 	andeq	r0, r0, ip, ror r0
 240:	11080e44 	tstne	r8, r4, asr #28
 244:	0b11010e 	bleq	440684 <bss_end+0x43d39c>
 248:	0b0c4402 	bleq	311258 <bss_end+0x30df70>
 24c:	00000004 	andeq	r0, r0, r4
 250:	0000001c 	andeq	r0, r0, ip, lsl r0
 254:	000000f8 	strdeq	r0, [r0], -r8
 258:	00000b5c 	andeq	r0, r0, ip, asr fp
 25c:	000000a0 	andeq	r0, r0, r0, lsr #1
 260:	11080e44 	tstne	r8, r4, asr #28
 264:	0b11010e 	bleq	4406a4 <bss_end+0x43d3bc>
 268:	0b0c4402 	bleq	311278 <bss_end+0x30df90>
 26c:	00000004 	andeq	r0, r0, r4
 270:	0000000c 	andeq	r0, r0, ip
 274:	ffffffff 	undefined instruction 0xffffffff
 278:	7c010001 	stcvc	0, cr0, [r1], {1}
 27c:	000d0c0e 	andeq	r0, sp, lr, lsl #24
 280:	00000018 	andeq	r0, r0, r8, lsl r0
 284:	00000270 	andeq	r0, r0, r0, ror r2
 288:	00000bfc 	strdeq	r0, [r0], -ip
 28c:	00000014 	andeq	r0, r0, r4, lsl r0
 290:	11040e44 	tstne	r4, r4, asr #28
 294:	0d44010b 	stfeqe	f0, [r4, #-44]	; 0xffffffd4
 298:	0000000b 	andeq	r0, r0, fp
 29c:	0000000c 	andeq	r0, r0, ip
 2a0:	ffffffff 	undefined instruction 0xffffffff
 2a4:	7c010001 	stcvc	0, cr0, [r1], {1}
 2a8:	000d0c0e 	andeq	r0, sp, lr, lsl #24
 2ac:	00000018 	andeq	r0, r0, r8, lsl r0
 2b0:	0000029c 	muleq	r0, ip, r2
 2b4:	00000c10 	andeq	r0, r0, r0, lsl ip
 2b8:	0000007c 	andeq	r0, r0, ip, ror r0
 2bc:	11040e44 	tstne	r4, r4, asr #28
 2c0:	0d44010b 	stfeqe	f0, [r4, #-44]	; 0xffffffd4
 2c4:	0000000b 	andeq	r0, r0, fp
 2c8:	00000018 	andeq	r0, r0, r8, lsl r0
 2cc:	0000029c 	muleq	r0, ip, r2
 2d0:	00000c8c 	andeq	r0, r0, ip, lsl #25
 2d4:	00000048 	andeq	r0, r0, r8, asr #32
 2d8:	11040e44 	tstne	r4, r4, asr #28
 2dc:	0d44010b 	stfeqe	f0, [r4, #-44]	; 0xffffffd4
 2e0:	0000000b 	andeq	r0, r0, fp
 2e4:	00000018 	andeq	r0, r0, r8, lsl r0
 2e8:	0000029c 	muleq	r0, ip, r2
 2ec:	00000cd4 	ldrdeq	r0, [r0], -r4
 2f0:	00000040 	andeq	r0, r0, r0, asr #32
 2f4:	11040e44 	tstne	r4, r4, asr #28
 2f8:	0d44010b 	stfeqe	f0, [r4, #-44]	; 0xffffffd4
 2fc:	0000000b 	andeq	r0, r0, fp
 300:	0000001c 	andeq	r0, r0, ip, lsl r0
 304:	0000029c 	muleq	r0, ip, r2
 308:	00000d14 	andeq	r0, r0, r4, lsl sp
 30c:	0000004c 	andeq	r0, r0, ip, asr #32
 310:	11080e44 	tstne	r8, r4, asr #28
 314:	0b11010e 	bleq	440754 <bss_end+0x43d46c>
 318:	0b0c4402 	bleq	311328 <bss_end+0x30e040>
 31c:	00000004 	andeq	r0, r0, r4
 320:	0000001c 	andeq	r0, r0, ip, lsl r0
 324:	0000029c 	muleq	r0, ip, r2
 328:	00000d60 	andeq	r0, r0, r0, ror #26
 32c:	0000008c 	andeq	r0, r0, ip, lsl #1
 330:	11080e44 	tstne	r8, r4, asr #28
 334:	0b11010e 	bleq	440774 <bss_end+0x43d48c>
 338:	0b0c4402 	bleq	311348 <bss_end+0x30e060>
 33c:	00000004 	andeq	r0, r0, r4
 340:	0000001c 	andeq	r0, r0, ip, lsl r0
 344:	0000029c 	muleq	r0, ip, r2
 348:	00000dec 	andeq	r0, r0, ip, ror #27
 34c:	00000110 	andeq	r0, r0, r0, lsl r1
 350:	11080e44 	tstne	r8, r4, asr #28
 354:	0b11010e 	bleq	440794 <bss_end+0x43d4ac>
 358:	0b0c4402 	bleq	311368 <bss_end+0x30e080>
 35c:	00000004 	andeq	r0, r0, r4
 360:	0000001c 	andeq	r0, r0, ip, lsl r0
 364:	0000029c 	muleq	r0, ip, r2
 368:	00000efc 	strdeq	r0, [r0], -ip
 36c:	00000174 	andeq	r0, r0, r4, ror r1
 370:	11080e44 	tstne	r8, r4, asr #28
 374:	0b11010e 	bleq	4407b4 <bss_end+0x43d4cc>
 378:	0b0c4402 	bleq	311388 <bss_end+0x30e0a0>
 37c:	00000004 	andeq	r0, r0, r4
 380:	00000028 	andeq	r0, r0, r8, lsr #32
 384:	0000029c 	muleq	r0, ip, r2
 388:	00001070 	andeq	r1, r0, r0, ror r0
 38c:	000001dc 	ldrdeq	r0, [r0], -ip
 390:	44100e44 	ldrmi	r0, [r0], #-3652	; 0xe44
 394:	0e11180e 	cdpeq	8, 1, cr1, cr1, cr14, {0}
 398:	060b1105 	streq	r1, [fp], -r5, lsl #2
 39c:	11010311 	tstne	r1, r1, lsl r3
 3a0:	01110202 	tsteq	r1, r2, lsl #4
 3a4:	04001103 	streq	r1, [r0], #-259	; 0x103
 3a8:	140b0c44 	strne	r0, [fp], #-3140	; 0xc44
 3ac:	0000000c 	andeq	r0, r0, ip
 3b0:	ffffffff 	undefined instruction 0xffffffff
 3b4:	7c010001 	stcvc	0, cr0, [r1], {1}
 3b8:	000d0c0e 	andeq	r0, sp, lr, lsl #24
 3bc:	00000018 	andeq	r0, r0, r8, lsl r0
 3c0:	000003ac 	andeq	r0, r0, ip, lsr #7
 3c4:	0000124c 	andeq	r1, r0, ip, asr #4
 3c8:	0000005c 	andeq	r0, r0, ip, asr r0
 3cc:	11040e44 	tstne	r4, r4, asr #28
 3d0:	0d44010b 	stfeqe	f0, [r4, #-44]	; 0xffffffd4
 3d4:	0000000b 	andeq	r0, r0, fp
 3d8:	00000018 	andeq	r0, r0, r8, lsl r0
 3dc:	000003ac 	andeq	r0, r0, ip, lsr #7
 3e0:	000012a8 	andeq	r1, r0, r8, lsr #5
 3e4:	0000001c 	andeq	r0, r0, ip, lsl r0
 3e8:	11040e44 	tstne	r4, r4, asr #28
 3ec:	0d44010b 	stfeqe	f0, [r4, #-44]	; 0xffffffd4
 3f0:	0000000b 	andeq	r0, r0, fp
 3f4:	0000001c 	andeq	r0, r0, ip, lsl r0
 3f8:	000003ac 	andeq	r0, r0, ip, lsr #7
 3fc:	000012c4 	andeq	r1, r0, r4, asr #5
 400:	00000078 	andeq	r0, r0, r8, ror r0
 404:	11080e44 	tstne	r8, r4, asr #28
 408:	0b11010e 	bleq	440848 <bss_end+0x43d560>
 40c:	0b0c4402 	bleq	31141c <bss_end+0x30e134>
 410:	00000004 	andeq	r0, r0, r4
 414:	0000001c 	andeq	r0, r0, ip, lsl r0
 418:	000003ac 	andeq	r0, r0, ip, lsr #7
 41c:	0000133c 	andeq	r1, r0, ip, lsr r3
 420:	00000048 	andeq	r0, r0, r8, asr #32
 424:	11080e44 	tstne	r8, r4, asr #28
 428:	0b11010e 	bleq	440868 <bss_end+0x43d580>
 42c:	0b0c4402 	bleq	31143c <bss_end+0x30e154>
 430:	00000004 	andeq	r0, r0, r4
 434:	0000001c 	andeq	r0, r0, ip, lsl r0
 438:	000003ac 	andeq	r0, r0, ip, lsr #7
 43c:	00001384 	andeq	r1, r0, r4, lsl #7
 440:	00000024 	andeq	r0, r0, r4, lsr #32
 444:	11080e44 	tstne	r8, r4, asr #28
 448:	0b11010e 	bleq	440888 <bss_end+0x43d5a0>
 44c:	0b0c4402 	bleq	31145c <bss_end+0x30e174>
 450:	00000004 	andeq	r0, r0, r4
 454:	0000000c 	andeq	r0, r0, ip
 458:	ffffffff 	undefined instruction 0xffffffff
 45c:	7c010001 	stcvc	0, cr0, [r1], {1}
 460:	000d0c0e 	andeq	r0, sp, lr, lsl #24
 464:	00000018 	andeq	r0, r0, r8, lsl r0
 468:	00000454 	andeq	r0, r0, r4, asr r4
 46c:	000013a8 	andeq	r1, r0, r8, lsr #7
 470:	00000040 	andeq	r0, r0, r0, asr #32
 474:	11040e44 	tstne	r4, r4, asr #28
 478:	0d44010b 	stfeqe	f0, [r4, #-44]	; 0xffffffd4
 47c:	0000000b 	andeq	r0, r0, fp
 480:	00000018 	andeq	r0, r0, r8, lsl r0
 484:	00000454 	andeq	r0, r0, r4, asr r4
 488:	000013e8 	andeq	r1, r0, r8, ror #7
 48c:	00000040 	andeq	r0, r0, r0, asr #32
 490:	11040e44 	tstne	r4, r4, asr #28
 494:	0d44010b 	stfeqe	f0, [r4, #-44]	; 0xffffffd4
 498:	0000000b 	andeq	r0, r0, fp
 49c:	00000018 	andeq	r0, r0, r8, lsl r0
 4a0:	00000454 	andeq	r0, r0, r4, asr r4
 4a4:	00001428 	andeq	r1, r0, r8, lsr #8
 4a8:	00000034 	andeq	r0, r0, r4, lsr r0
 4ac:	11040e44 	tstne	r4, r4, asr #28
 4b0:	0d44010b 	stfeqe	f0, [r4, #-44]	; 0xffffffd4
 4b4:	0000000b 	andeq	r0, r0, fp
 4b8:	00000018 	andeq	r0, r0, r8, lsl r0
 4bc:	00000454 	andeq	r0, r0, r4, asr r4
 4c0:	0000145c 	andeq	r1, r0, ip, asr r4
 4c4:	00000024 	andeq	r0, r0, r4, lsr #32
 4c8:	11040e44 	tstne	r4, r4, asr #28
 4cc:	0d44010b 	stfeqe	f0, [r4, #-44]	; 0xffffffd4
 4d0:	0000000b 	andeq	r0, r0, fp
 4d4:	00000018 	andeq	r0, r0, r8, lsl r0
 4d8:	00000454 	andeq	r0, r0, r4, asr r4
 4dc:	00001480 	andeq	r1, r0, r0, lsl #9
 4e0:	00000024 	andeq	r0, r0, r4, lsr #32
 4e4:	11040e44 	tstne	r4, r4, asr #28
 4e8:	0d44010b 	stfeqe	f0, [r4, #-44]	; 0xffffffd4
 4ec:	0000000b 	andeq	r0, r0, fp
 4f0:	0000000c 	andeq	r0, r0, ip
 4f4:	ffffffff 	undefined instruction 0xffffffff
 4f8:	7c010001 	stcvc	0, cr0, [r1], {1}
 4fc:	000d0c0e 	andeq	r0, sp, lr, lsl #24
 500:	00000018 	andeq	r0, r0, r8, lsl r0
 504:	000004f0 	strdeq	r0, [r0], -r0
 508:	000014a4 	andeq	r1, r0, r4, lsr #9
 50c:	00000070 	andeq	r0, r0, r0, ror r0
 510:	11040e44 	tstne	r4, r4, asr #28
 514:	0d44010b 	stfeqe	f0, [r4, #-44]	; 0xffffffd4
 518:	0000000b 	andeq	r0, r0, fp
 51c:	00000018 	andeq	r0, r0, r8, lsl r0
 520:	000004f0 	strdeq	r0, [r0], -r0
 524:	00001514 	andeq	r1, r0, r4, lsl r5
 528:	00000068 	andeq	r0, r0, r8, rrx
 52c:	11040e44 	tstne	r4, r4, asr #28
 530:	0d44010b 	stfeqe	f0, [r4, #-44]	; 0xffffffd4
 534:	0000000b 	andeq	r0, r0, fp
 538:	0000001c 	andeq	r0, r0, ip, lsl r0
 53c:	000004f0 	strdeq	r0, [r0], -r0
 540:	0000157c 	andeq	r1, r0, ip, ror r5
 544:	000000d4 	ldrdeq	r0, [r0], -r4
 548:	110c0e44 	tstne	ip, r4, asr #28
 54c:	0b11010e 	bleq	44098c <bss_end+0x43d6a4>
 550:	03041102 	movweq	r1, #16642	; 0x4102
 554:	040b0c44 	streq	r0, [fp], #-3140	; 0xc44
 558:	00000018 	andeq	r0, r0, r8, lsl r0
 55c:	000004f0 	strdeq	r0, [r0], -r0
 560:	00001650 	andeq	r1, r0, r0, asr r6
 564:	000000b8 	strheq	r0, [r0], -r8
 568:	11040e44 	tstne	r4, r4, asr #28
 56c:	0d44010b 	stfeqe	f0, [r4, #-44]	; 0xffffffd4
 570:	0000000b 	andeq	r0, r0, fp
 574:	00000018 	andeq	r0, r0, r8, lsl r0
 578:	000004f0 	strdeq	r0, [r0], -r0
 57c:	00001708 	andeq	r1, r0, r8, lsl #14
 580:	00000078 	andeq	r0, r0, r8, ror r0
 584:	11040e44 	tstne	r4, r4, asr #28
 588:	0d44010b 	stfeqe	f0, [r4, #-44]	; 0xffffffd4
 58c:	0000000b 	andeq	r0, r0, fp
 590:	00000018 	andeq	r0, r0, r8, lsl r0
 594:	000004f0 	strdeq	r0, [r0], -r0
 598:	00001780 	andeq	r1, r0, r0, lsl #15
 59c:	000000a4 	andeq	r0, r0, r4, lsr #1
 5a0:	11040e44 	tstne	r4, r4, asr #28
 5a4:	0d44010b 	stfeqe	f0, [r4, #-44]	; 0xffffffd4
 5a8:	0000000b 	andeq	r0, r0, fp
 5ac:	00000018 	andeq	r0, r0, r8, lsl r0
 5b0:	000004f0 	strdeq	r0, [r0], -r0
 5b4:	00001824 	andeq	r1, r0, r4, lsr #16
 5b8:	00000098 	muleq	r0, r8, r0
 5bc:	11040e44 	tstne	r4, r4, asr #28
 5c0:	0d44010b 	stfeqe	f0, [r4, #-44]	; 0xffffffd4
 5c4:	0000000b 	andeq	r0, r0, fp
 5c8:	00000018 	andeq	r0, r0, r8, lsl r0
 5cc:	000004f0 	strdeq	r0, [r0], -r0
 5d0:	000018bc 	undefined instruction 0x000018bc
 5d4:	000000d4 	ldrdeq	r0, [r0], -r4
 5d8:	11040e44 	tstne	r4, r4, asr #28
 5dc:	0d44010b 	stfeqe	f0, [r4, #-44]	; 0xffffffd4
 5e0:	0000000b 	andeq	r0, r0, fp
 5e4:	0000001c 	andeq	r0, r0, ip, lsl r0
 5e8:	000004f0 	strdeq	r0, [r0], -r0
 5ec:	00001990 	muleq	r0, r0, r9
 5f0:	000000a8 	andeq	r0, r0, r8, lsr #1
 5f4:	11080e44 	tstne	r8, r4, asr #28
 5f8:	0411010b 	ldreq	r0, [r1], #-267	; 0x10b
 5fc:	0b0c4402 	bleq	31160c <bss_end+0x30e324>
 600:	00000004 	andeq	r0, r0, r4
 604:	0000001c 	andeq	r0, r0, ip, lsl r0
 608:	000004f0 	strdeq	r0, [r0], -r0
 60c:	00001a38 	andeq	r1, r0, r8, lsr sl
 610:	000000c4 	andeq	r0, r0, r4, asr #1
 614:	11080e44 	tstne	r8, r4, asr #28
 618:	0411010b 	ldreq	r0, [r1], #-267	; 0x10b
 61c:	0b0c4402 	bleq	31162c <bss_end+0x30e344>
 620:	00000004 	andeq	r0, r0, r4
 624:	00000018 	andeq	r0, r0, r8, lsl r0
 628:	000004f0 	strdeq	r0, [r0], -r0
 62c:	00001afc 	strdeq	r1, [r0], -ip
 630:	00000068 	andeq	r0, r0, r8, rrx
 634:	11040e44 	tstne	r4, r4, asr #28
 638:	0d44010b 	stfeqe	f0, [r4, #-44]	; 0xffffffd4
 63c:	0000000b 	andeq	r0, r0, fp
 640:	00000018 	andeq	r0, r0, r8, lsl r0
 644:	000004f0 	strdeq	r0, [r0], -r0
 648:	00001b64 	andeq	r1, r0, r4, ror #22
 64c:	00000054 	andeq	r0, r0, r4, asr r0
 650:	11040e44 	tstne	r4, r4, asr #28
 654:	0d44010b 	stfeqe	f0, [r4, #-44]	; 0xffffffd4
 658:	0000000b 	andeq	r0, r0, fp
 65c:	00000018 	andeq	r0, r0, r8, lsl r0
 660:	000004f0 	strdeq	r0, [r0], -r0
 664:	00001bb8 	undefined instruction 0x00001bb8
 668:	00000080 	andeq	r0, r0, r0, lsl #1
 66c:	11040e44 	tstne	r4, r4, asr #28
 670:	0d44010b 	stfeqe	f0, [r4, #-44]	; 0xffffffd4
 674:	0000000b 	andeq	r0, r0, fp
 678:	00000018 	andeq	r0, r0, r8, lsl r0
 67c:	000004f0 	strdeq	r0, [r0], -r0
 680:	00001c38 	andeq	r1, r0, r8, lsr ip
 684:	000000c4 	andeq	r0, r0, r4, asr #1
 688:	11040e44 	tstne	r4, r4, asr #28
 68c:	0d44010b 	stfeqe	f0, [r4, #-44]	; 0xffffffd4
 690:	0000000b 	andeq	r0, r0, fp
 694:	00000018 	andeq	r0, r0, r8, lsl r0
 698:	000004f0 	strdeq	r0, [r0], -r0
 69c:	00001cfc 	strdeq	r1, [r0], -ip
 6a0:	00000098 	muleq	r0, r8, r0
 6a4:	11040e44 	tstne	r4, r4, asr #28
 6a8:	0d44010b 	stfeqe	f0, [r4, #-44]	; 0xffffffd4
 6ac:	0000000b 	andeq	r0, r0, fp
 6b0:	00000018 	andeq	r0, r0, r8, lsl r0
 6b4:	000004f0 	strdeq	r0, [r0], -r0
 6b8:	00001d94 	muleq	r0, r4, sp
 6bc:	0000007c 	andeq	r0, r0, ip, ror r0
 6c0:	11040e44 	tstne	r4, r4, asr #28
 6c4:	0d44010b 	stfeqe	f0, [r4, #-44]	; 0xffffffd4
 6c8:	0000000b 	andeq	r0, r0, fp
 6cc:	00000018 	andeq	r0, r0, r8, lsl r0
 6d0:	000004f0 	strdeq	r0, [r0], -r0
 6d4:	00001e10 	andeq	r1, r0, r0, lsl lr
 6d8:	00000090 	muleq	r0, r0, r0
 6dc:	11040e44 	tstne	r4, r4, asr #28
 6e0:	0d44010b 	stfeqe	f0, [r4, #-44]	; 0xffffffd4
 6e4:	0000000b 	andeq	r0, r0, fp
 6e8:	00000018 	andeq	r0, r0, r8, lsl r0
 6ec:	000004f0 	strdeq	r0, [r0], -r0
 6f0:	00001ea0 	andeq	r1, r0, r0, lsr #29
 6f4:	00000118 	andeq	r0, r0, r8, lsl r1
 6f8:	11040e44 	tstne	r4, r4, asr #28
 6fc:	0d44010b 	stfeqe	f0, [r4, #-44]	; 0xffffffd4
 700:	0000000b 	andeq	r0, r0, fp
 704:	00000018 	andeq	r0, r0, r8, lsl r0
 708:	000004f0 	strdeq	r0, [r0], -r0
 70c:	00001fb8 	undefined instruction 0x00001fb8
 710:	000000a8 	andeq	r0, r0, r8, lsr #1
 714:	11040e44 	tstne	r4, r4, asr #28
 718:	0d44010b 	stfeqe	f0, [r4, #-44]	; 0xffffffd4
 71c:	0000000b 	andeq	r0, r0, fp
 720:	00000018 	andeq	r0, r0, r8, lsl r0
 724:	000004f0 	strdeq	r0, [r0], -r0
 728:	00002060 	andeq	r2, r0, r0, rrx
 72c:	0000007c 	andeq	r0, r0, ip, ror r0
 730:	11040e44 	tstne	r4, r4, asr #28
 734:	0d44010b 	stfeqe	f0, [r4, #-44]	; 0xffffffd4
 738:	0000000b 	andeq	r0, r0, fp
 73c:	0000001c 	andeq	r0, r0, ip, lsl r0
 740:	000004f0 	strdeq	r0, [r0], -r0
 744:	000020dc 	ldrdeq	r2, [r0], -ip
 748:	000000ac 	andeq	r0, r0, ip, lsr #1
 74c:	11080e44 	tstne	r8, r4, asr #28
 750:	0b11010e 	bleq	440b90 <bss_end+0x43d8a8>
 754:	0b0c4402 	bleq	311764 <bss_end+0x30e47c>
 758:	00000004 	andeq	r0, r0, r4
 75c:	00000018 	andeq	r0, r0, r8, lsl r0
 760:	000004f0 	strdeq	r0, [r0], -r0
 764:	00002188 	andeq	r2, r0, r8, lsl #3
 768:	000000a0 	andeq	r0, r0, r0, lsr #1
 76c:	11040e44 	tstne	r4, r4, asr #28
 770:	0d44010b 	stfeqe	f0, [r4, #-44]	; 0xffffffd4
 774:	0000000b 	andeq	r0, r0, fp
 778:	0000000c 	andeq	r0, r0, ip
 77c:	ffffffff 	undefined instruction 0xffffffff
 780:	7c010001 	stcvc	0, cr0, [r1], {1}
 784:	000d0c0e 	andeq	r0, sp, lr, lsl #24
 788:	00000018 	andeq	r0, r0, r8, lsl r0
 78c:	00000778 	andeq	r0, r0, r8, ror r7
 790:	00002228 	andeq	r2, r0, r8, lsr #4
 794:	000000e4 	andeq	r0, r0, r4, ror #1
 798:	11040e44 	tstne	r4, r4, asr #28
 79c:	0d44010b 	stfeqe	f0, [r4, #-44]	; 0xffffffd4
 7a0:	0000000b 	andeq	r0, r0, fp
 7a4:	0000000c 	andeq	r0, r0, ip
 7a8:	ffffffff 	undefined instruction 0xffffffff
 7ac:	7c010001 	stcvc	0, cr0, [r1], {1}
 7b0:	000d0c0e 	andeq	r0, sp, lr, lsl #24
 7b4:	0000001c 	andeq	r0, r0, ip, lsl r0
 7b8:	000007a4 	andeq	r0, r0, r4, lsr #15
 7bc:	0000230c 	andeq	r2, r0, ip, lsl #6
 7c0:	00000020 	andeq	r0, r0, r0, lsr #32
 7c4:	11080e44 	tstne	r8, r4, asr #28
 7c8:	0b11010e 	bleq	440c08 <bss_end+0x43d920>
 7cc:	0b0c4402 	bleq	3117dc <bss_end+0x30e4f4>
 7d0:	00000004 	andeq	r0, r0, r4
 7d4:	0000001c 	andeq	r0, r0, ip, lsl r0
 7d8:	000007a4 	andeq	r0, r0, r4, lsr #15
 7dc:	0000232c 	andeq	r2, r0, ip, lsr #6
 7e0:	00000020 	andeq	r0, r0, r0, lsr #32
 7e4:	11080e44 	tstne	r8, r4, asr #28
 7e8:	0b11010e 	bleq	440c28 <bss_end+0x43d940>
 7ec:	0b0c4402 	bleq	3117fc <bss_end+0x30e514>
 7f0:	00000004 	andeq	r0, r0, r4

Disassembly of section .debug_loc:

00000000 <.debug_loc>:
   0:	00000000 	andeq	r0, r0, r0
   4:	00000004 	andeq	r0, r0, r4
   8:	045d0001 	ldrbeq	r0, [sp], #-1
   c:	08000000 	stmdaeq	r0, {}
  10:	02000000 	andeq	r0, r0, #0
  14:	08047d00 	stmdaeq	r4, {r8, sl, fp, ip, sp, lr}
  18:	d4000000 	strle	r0, [r0]
  1c:	02000000 	andeq	r0, r0, #0
  20:	00047b00 	andeq	r7, r4, r0, lsl #22
  24:	00000000 	andeq	r0, r0, r0
  28:	d4000000 	strle	r0, [r0]
  2c:	d8000000 	stmdale	r0, {}
  30:	01000000 	tsteq	r0, r0
  34:	00d85d00 	sbcseq	r5, r8, r0, lsl #26
  38:	00dc0000 	sbcseq	r0, ip, r0
  3c:	00020000 	andeq	r0, r2, r0
  40:	00dc047d 	sbcseq	r0, ip, sp, ror r4
  44:	01540000 	cmpeq	r4, r0
  48:	00020000 	andeq	r0, r2, r0
  4c:	0000047b 	andeq	r0, r0, fp, ror r4
	...
  58:	00040000 	andeq	r0, r4, r0
  5c:	00010000 	andeq	r0, r1, r0
  60:	0000045d 	andeq	r0, r0, sp, asr r4
  64:	00000800 	andeq	r0, r0, r0, lsl #16
  68:	7d000200 	sfmvc	f0, 4, [r0]	; (stcvc 2, cr0, [r0])
  6c:	0000080c 	andeq	r0, r0, ip, lsl #16
  70:	0000b800 	andeq	fp, r0, r0, lsl #16
  74:	7b000200 	blvc	87c <wait_RnB+0xc>
  78:	00000004 	andeq	r0, r0, r4
  7c:	00000000 	andeq	r0, r0, r0
  80:	0000b800 	andeq	fp, r0, r0, lsl #16
  84:	0000bc00 	andeq	fp, r0, r0, lsl #24
  88:	5d000100 	stfpls	f0, [r0]
  8c:	000000bc 	strheq	r0, [r0], -ip
  90:	000000c0 	andeq	r0, r0, r0, asr #1
  94:	087d0002 	ldmdaeq	sp!, {r1}^
  98:	000000c0 	andeq	r0, r0, r0, asr #1
  9c:	0000011c 	andeq	r0, r0, ip, lsl r1
  a0:	047b0002 	ldrbteq	r0, [fp], #-2
	...
  ac:	0000011c 	andeq	r0, r0, ip, lsl r1
  b0:	00000120 	andeq	r0, r0, r0, lsr #2
  b4:	205d0001 	subscs	r0, sp, r1
  b8:	24000001 	strcs	r0, [r0], #-1
  bc:	02000001 	andeq	r0, r0, #1
  c0:	24087d00 	strcs	r7, [r8], #-3328	; 0xd00
  c4:	2c000001 	stccs	0, cr0, [r0], {1}
  c8:	02000003 	andeq	r0, r0, #3
  cc:	00047b00 	andeq	r7, r4, r0, lsl #22
  d0:	00000000 	andeq	r0, r0, r0
  d4:	2c000000 	stccs	0, cr0, [r0], {0}
  d8:	30000003 	andcc	r0, r0, r3
  dc:	01000003 	tsteq	r0, r3
  e0:	03305d00 	teqeq	r0, #0
  e4:	03340000 	teqeq	r4, #0
  e8:	00020000 	andeq	r0, r2, r0
  ec:	0334087d 	teqeq	r4, #8192000	; 0x7d0000
  f0:	03680000 	cmneq	r8, #0
  f4:	00020000 	andeq	r0, r2, r0
  f8:	0000047b 	andeq	r0, r0, fp, ror r4
  fc:	00000000 	andeq	r0, r0, r0
 100:	03680000 	cmneq	r8, #0
 104:	036c0000 	cmneq	ip, #0
 108:	00010000 	andeq	r0, r1, r0
 10c:	00036c5d 	andeq	r6, r3, sp, asr ip
 110:	00037000 	andeq	r7, r3, r0
 114:	7d000200 	sfmvc	f0, 4, [r0]	; (stcvc 2, cr0, [r0])
 118:	00037008 	andeq	r7, r3, r8
 11c:	00048000 	andeq	r8, r4, r0
 120:	7b000200 	blvc	928 <nand_PageRead+0x24>
 124:	00000004 	andeq	r0, r0, r4
	...
 130:	00000400 	andeq	r0, r0, r0, lsl #8
 134:	5d000100 	stfpls	f0, [r0]
 138:	00000004 	andeq	r0, r0, r4
 13c:	00000008 	andeq	r0, r0, r8
 140:	047d0002 	ldrbteq	r0, [sp], #-2
 144:	00000008 	andeq	r0, r0, r8
 148:	0000002c 	andeq	r0, r0, ip, lsr #32
 14c:	047b0002 	ldrbteq	r0, [fp], #-2
	...
 158:	0000002c 	andeq	r0, r0, ip, lsr #32
 15c:	00000030 	andeq	r0, r0, r0, lsr r0
 160:	305d0001 	subscc	r0, sp, r1
 164:	34000000 	strcc	r0, [r0]
 168:	02000000 	andeq	r0, r0, #0
 16c:	34047d00 	strcc	r7, [r4], #-3328	; 0xd00
 170:	58000000 	stmdapl	r0, {}
 174:	02000000 	andeq	r0, r0, #0
 178:	00047b00 	andeq	r7, r4, r0, lsl #22
 17c:	00000000 	andeq	r0, r0, r0
 180:	58000000 	stmdapl	r0, {}
 184:	5c000000 	stcpl	0, cr0, [r0], {0}
 188:	01000000 	tsteq	r0, r0
 18c:	005c5d00 	subseq	r5, ip, r0, lsl #26
 190:	00600000 	rsbeq	r0, r0, r0
 194:	00020000 	andeq	r0, r2, r0
 198:	0060047d 	rsbeq	r0, r0, sp, ror r4
 19c:	008c0000 	addeq	r0, ip, r0
 1a0:	00020000 	andeq	r0, r2, r0
 1a4:	0000047b 	andeq	r0, r0, fp, ror r4
 1a8:	00000000 	andeq	r0, r0, r0
 1ac:	008c0000 	addeq	r0, ip, r0
 1b0:	00900000 	addseq	r0, r0, r0
 1b4:	00010000 	andeq	r0, r1, r0
 1b8:	0000905d 	andeq	r9, r0, sp, asr r0
 1bc:	00009400 	andeq	r9, r0, r0, lsl #8
 1c0:	7d000200 	sfmvc	f0, 4, [r0]	; (stcvc 2, cr0, [r0])
 1c4:	00009404 	andeq	r9, r0, r4, lsl #8
 1c8:	0000bc00 	andeq	fp, r0, r0, lsl #24
 1cc:	7b000200 	blvc	9d4 <nand_PageRead+0xd0>
 1d0:	00000004 	andeq	r0, r0, r4
 1d4:	00000000 	andeq	r0, r0, r0
 1d8:	0000bc00 	andeq	fp, r0, r0, lsl #24
 1dc:	0000c000 	andeq	ip, r0, r0
 1e0:	5d000100 	stfpls	f0, [r0]
 1e4:	000000c0 	andeq	r0, r0, r0, asr #1
 1e8:	000000c4 	andeq	r0, r0, r4, asr #1
 1ec:	047d0002 	ldrbteq	r0, [sp], #-2
 1f0:	000000c4 	andeq	r0, r0, r4, asr #1
 1f4:	000000ec 	andeq	r0, r0, ip, ror #1
 1f8:	047b0002 	ldrbteq	r0, [fp], #-2
	...
 204:	000000ec 	andeq	r0, r0, ip, ror #1
 208:	000000f0 	strdeq	r0, [r0], -r0
 20c:	f05d0001 	undefined instruction 0xf05d0001
 210:	f4000000 	vst4.8	{d0-d3}, [r0], r0
 214:	02000000 	andeq	r0, r0, #0
 218:	f4047d00 	undefined instruction 0xf4047d00
 21c:	1c000000 	stcne	0, cr0, [r0], {0}
 220:	02000001 	andeq	r0, r0, #1
 224:	00047b00 	andeq	r7, r4, r0, lsl #22
 228:	00000000 	andeq	r0, r0, r0
 22c:	1c000000 	stcne	0, cr0, [r0], {0}
 230:	20000001 	andcs	r0, r0, r1
 234:	01000001 	tsteq	r0, r1
 238:	01205d00 	teqeq	r0, r0, lsl #26
 23c:	01240000 	teqeq	r4, r0
 240:	00020000 	andeq	r0, r2, r0
 244:	0124087d 	teqeq	r4, sp, ror r8
 248:	01480000 	cmpeq	r8, r0
 24c:	00020000 	andeq	r0, r2, r0
 250:	0000047b 	andeq	r0, r0, fp, ror r4
 254:	00000000 	andeq	r0, r0, r0
 258:	01480000 	cmpeq	r8, r0
 25c:	014c0000 	cmpeq	ip, r0
 260:	00010000 	andeq	r0, r1, r0
 264:	00014c5d 	andeq	r4, r1, sp, asr ip
 268:	00015000 	andeq	r5, r1, r0
 26c:	7d000200 	sfmvc	f0, 4, [r0]	; (stcvc 2, cr0, [r0])
 270:	00015008 	andeq	r5, r1, r8
 274:	00018000 	andeq	r8, r1, r0
 278:	7b000200 	blvc	a80 <nand_PageWrite+0xa0>
 27c:	00000004 	andeq	r0, r0, r4
 280:	00000000 	andeq	r0, r0, r0
 284:	00018000 	andeq	r8, r1, r0
 288:	00018400 	andeq	r8, r1, r0, lsl #8
 28c:	5d000100 	stfpls	f0, [r0]
 290:	00000184 	andeq	r0, r0, r4, lsl #3
 294:	00000188 	andeq	r0, r0, r8, lsl #3
 298:	087d0002 	ldmdaeq	sp!, {r1}^
 29c:	00000188 	andeq	r0, r0, r8, lsl #3
 2a0:	0000025c 	andeq	r0, r0, ip, asr r2
 2a4:	047b0002 	ldrbteq	r0, [fp], #-2
	...
 2b0:	0000025c 	andeq	r0, r0, ip, asr r2
 2b4:	00000260 	andeq	r0, r0, r0, ror #4
 2b8:	605d0001 	subsvs	r0, sp, r1
 2bc:	64000002 	strvs	r0, [r0], #-2
 2c0:	02000002 	andeq	r0, r0, #2
 2c4:	64087d00 	strvs	r7, [r8], #-3328	; 0xd00
 2c8:	5c000002 	stcpl	0, cr0, [r0], {2}
 2cc:	02000003 	andeq	r0, r0, #3
 2d0:	00047b00 	andeq	r7, r4, r0, lsl #22
 2d4:	00000000 	andeq	r0, r0, r0
 2d8:	5c000000 	stcpl	0, cr0, [r0], {0}
 2dc:	60000003 	andvs	r0, r0, r3
 2e0:	01000003 	tsteq	r0, r3
 2e4:	03605d00 	cmneq	r0, #0
 2e8:	03640000 	cmneq	r4, #0
 2ec:	00020000 	andeq	r0, r2, r0
 2f0:	0364087d 	cmneq	r4, #8192000	; 0x7d0000
 2f4:	03d80000 	bicseq	r0, r8, #0
 2f8:	00020000 	andeq	r0, r2, r0
 2fc:	0000047b 	andeq	r0, r0, fp, ror r4
 300:	00000000 	andeq	r0, r0, r0
 304:	03d80000 	bicseq	r0, r8, #0
 308:	03dc0000 	bicseq	r0, ip, #0
 30c:	00010000 	andeq	r0, r1, r0
 310:	0003dc5d 	andeq	sp, r3, sp, asr ip
 314:	0003e000 	andeq	lr, r3, r0
 318:	7d000200 	sfmvc	f0, 4, [r0]	; (stcvc 2, cr0, [r0])
 31c:	0003e008 	andeq	lr, r3, r8
 320:	00047800 	andeq	r7, r4, r0, lsl #16
 324:	7b000200 	blvc	b2c <nand_to_ram+0x4c>
 328:	00000004 	andeq	r0, r0, r4
	...
 334:	00000400 	andeq	r0, r0, r0, lsl #8
 338:	5d000100 	stfpls	f0, [r0]
 33c:	00000004 	andeq	r0, r0, r4
 340:	00000008 	andeq	r0, r0, r8
 344:	047d0002 	ldrbteq	r0, [sp], #-2
 348:	00000008 	andeq	r0, r0, r8
 34c:	00000014 	andeq	r0, r0, r4, lsl r0
 350:	047b0002 	ldrbteq	r0, [fp], #-2
	...
 360:	00000004 	andeq	r0, r0, r4
 364:	045d0001 	ldrbeq	r0, [sp], #-1
 368:	08000000 	stmdaeq	r0, {}
 36c:	02000000 	andeq	r0, r0, #0
 370:	08047d00 	stmdaeq	r4, {r8, sl, fp, ip, sp, lr}
 374:	7c000000 	stcvc	0, cr0, [r0], {0}
 378:	02000000 	andeq	r0, r0, #0
 37c:	00047b00 	andeq	r7, r4, r0, lsl #22
 380:	00000000 	andeq	r0, r0, r0
 384:	7c000000 	stcvc	0, cr0, [r0], {0}
 388:	80000000 	andhi	r0, r0, r0
 38c:	01000000 	tsteq	r0, r0
 390:	00805d00 	addeq	r5, r0, r0, lsl #26
 394:	00840000 	addeq	r0, r4, r0
 398:	00020000 	andeq	r0, r2, r0
 39c:	0084047d 	addeq	r0, r4, sp, ror r4
 3a0:	00c40000 	sbceq	r0, r4, r0
 3a4:	00020000 	andeq	r0, r2, r0
 3a8:	0000047b 	andeq	r0, r0, fp, ror r4
 3ac:	00000000 	andeq	r0, r0, r0
 3b0:	00c40000 	sbceq	r0, r4, r0
 3b4:	00c80000 	sbceq	r0, r8, r0
 3b8:	00010000 	andeq	r0, r1, r0
 3bc:	0000c85d 	andeq	ip, r0, sp, asr r8
 3c0:	0000cc00 	andeq	ip, r0, r0, lsl #24
 3c4:	7d000200 	sfmvc	f0, 4, [r0]	; (stcvc 2, cr0, [r0])
 3c8:	0000cc04 	andeq	ip, r0, r4, lsl #24
 3cc:	00010400 	andeq	r0, r1, r0, lsl #8
 3d0:	7b000200 	blvc	bd8 <nand_erase+0x7c>
 3d4:	00000004 	andeq	r0, r0, r4
 3d8:	00000000 	andeq	r0, r0, r0
 3dc:	00010400 	andeq	r0, r1, r0, lsl #8
 3e0:	00010800 	andeq	r0, r1, r0, lsl #16
 3e4:	5d000100 	stfpls	f0, [r0]
 3e8:	00000108 	andeq	r0, r0, r8, lsl #2
 3ec:	0000010c 	andeq	r0, r0, ip, lsl #2
 3f0:	087d0002 	ldmdaeq	sp!, {r1}^
 3f4:	0000010c 	andeq	r0, r0, ip, lsl #2
 3f8:	00000150 	andeq	r0, r0, r0, asr r1
 3fc:	047b0002 	ldrbteq	r0, [fp], #-2
	...
 408:	00000150 	andeq	r0, r0, r0, asr r1
 40c:	00000154 	andeq	r0, r0, r4, asr r1
 410:	545d0001 	ldrbpl	r0, [sp], #-1
 414:	58000001 	stmdapl	r0, {r0}
 418:	02000001 	andeq	r0, r0, #1
 41c:	58087d00 	stmdapl	r8, {r8, sl, fp, ip, sp, lr}
 420:	dc000001 	stcle	0, cr0, [r0], {1}
 424:	02000001 	andeq	r0, r0, #1
 428:	00047b00 	andeq	r7, r4, r0, lsl #22
 42c:	00000000 	andeq	r0, r0, r0
 430:	dc000000 	stcle	0, cr0, [r0], {0}
 434:	e0000001 	and	r0, r0, r1
 438:	01000001 	tsteq	r0, r1
 43c:	01e05d00 	mvneq	r5, r0, lsl #26
 440:	01e40000 	mvneq	r0, r0
 444:	00020000 	andeq	r0, r2, r0
 448:	01e4087d 	mvneq	r0, sp, ror r8
 44c:	02ec0000 	rsceq	r0, ip, #0
 450:	00020000 	andeq	r0, r2, r0
 454:	0000047b 	andeq	r0, r0, fp, ror r4
 458:	00000000 	andeq	r0, r0, r0
 45c:	02ec0000 	rsceq	r0, ip, #0
 460:	02f00000 	rscseq	r0, r0, #0
 464:	00010000 	andeq	r0, r1, r0
 468:	0002f05d 	andeq	pc, r2, sp, asr r0
 46c:	0002f400 	andeq	pc, r2, r0, lsl #8
 470:	7d000200 	sfmvc	f0, 4, [r0]	; (stcvc 2, cr0, [r0])
 474:	0002f408 	andeq	pc, r2, r8, lsl #8
 478:	00046000 	andeq	r6, r4, r0
 47c:	7b000200 	blvc	c84 <uart0_init+0x74>
 480:	00000004 	andeq	r0, r0, r4
 484:	00000000 	andeq	r0, r0, r0
 488:	00046000 	andeq	r6, r4, r0
 48c:	00046400 	andeq	r6, r4, r0, lsl #8
 490:	5d000100 	stfpls	f0, [r0]
 494:	00000464 	andeq	r0, r0, r4, ror #8
 498:	00000468 	andeq	r0, r0, r8, ror #8
 49c:	107d0002 	rsbsne	r0, sp, r2
 4a0:	00000468 	andeq	r0, r0, r8, ror #8
 4a4:	0000046c 	andeq	r0, r0, ip, ror #8
 4a8:	187d0002 	ldmdane	sp!, {r1}^
 4ac:	0000046c 	andeq	r0, r0, ip, ror #8
 4b0:	0000063c 	andeq	r0, r0, ip, lsr r6
 4b4:	147b0002 	ldrbtne	r0, [fp], #-2
	...
 4c4:	00000004 	andeq	r0, r0, r4
 4c8:	045d0001 	ldrbeq	r0, [sp], #-1
 4cc:	08000000 	stmdaeq	r0, {}
 4d0:	02000000 	andeq	r0, r0, #0
 4d4:	08047d00 	stmdaeq	r4, {r8, sl, fp, ip, sp, lr}
 4d8:	5c000000 	stcpl	0, cr0, [r0], {0}
 4dc:	02000000 	andeq	r0, r0, #0
 4e0:	00047b00 	andeq	r7, r4, r0, lsl #22
 4e4:	00000000 	andeq	r0, r0, r0
 4e8:	5c000000 	stcpl	0, cr0, [r0], {0}
 4ec:	60000000 	andvs	r0, r0, r0
 4f0:	01000000 	tsteq	r0, r0
 4f4:	00605d00 	rsbeq	r5, r0, r0, lsl #26
 4f8:	00640000 	rsbeq	r0, r4, r0
 4fc:	00020000 	andeq	r0, r2, r0
 500:	0064047d 	rsbeq	r0, r4, sp, ror r4
 504:	00780000 	rsbseq	r0, r8, r0
 508:	00020000 	andeq	r0, r2, r0
 50c:	0000047b 	andeq	r0, r0, fp, ror r4
 510:	00000000 	andeq	r0, r0, r0
 514:	00780000 	rsbseq	r0, r8, r0
 518:	007c0000 	rsbseq	r0, ip, r0
 51c:	00010000 	andeq	r0, r1, r0
 520:	00007c5d 	andeq	r7, r0, sp, asr ip
 524:	00008000 	andeq	r8, r0, r0
 528:	7d000200 	sfmvc	f0, 4, [r0]	; (stcvc 2, cr0, [r0])
 52c:	00008008 	andeq	r8, r0, r8
 530:	0000f000 	andeq	pc, r0, r0
 534:	7b000200 	blvc	d3c <uputs+0x28>
 538:	00000004 	andeq	r0, r0, r4
 53c:	00000000 	andeq	r0, r0, r0
 540:	0000f000 	andeq	pc, r0, r0
 544:	0000f400 	andeq	pc, r0, r0, lsl #8
 548:	5d000100 	stfpls	f0, [r0]
 54c:	000000f4 	strdeq	r0, [r0], -r4
 550:	000000f8 	strdeq	r0, [r0], -r8
 554:	087d0002 	ldmdaeq	sp!, {r1}^
 558:	000000f8 	strdeq	r0, [r0], -r8
 55c:	00000138 	andeq	r0, r0, r8, lsr r1
 560:	047b0002 	ldrbteq	r0, [fp], #-2
	...
 56c:	00000138 	andeq	r0, r0, r8, lsr r1
 570:	0000013c 	andeq	r0, r0, ip, lsr r1
 574:	3c5d0001 	mrrccc	0, 0, r0, sp, cr1
 578:	40000001 	andmi	r0, r0, r1
 57c:	02000001 	andeq	r0, r0, #1
 580:	40087d00 	andmi	r7, r8, r0, lsl #26
 584:	5c000001 	stcpl	0, cr0, [r0], {1}
 588:	02000001 	andeq	r0, r0, #1
 58c:	00047b00 	andeq	r7, r4, r0, lsl #22
	...
 598:	04000000 	streq	r0, [r0]
 59c:	01000000 	tsteq	r0, r0
 5a0:	00045d00 	andeq	r5, r4, r0, lsl #26
 5a4:	00080000 	andeq	r0, r8, r0
 5a8:	00020000 	andeq	r0, r2, r0
 5ac:	0008047d 	andeq	r0, r8, sp, ror r4
 5b0:	00400000 	subeq	r0, r0, r0
 5b4:	00020000 	andeq	r0, r2, r0
 5b8:	0000047b 	andeq	r0, r0, fp, ror r4
 5bc:	00000000 	andeq	r0, r0, r0
 5c0:	00400000 	subeq	r0, r0, r0
 5c4:	00440000 	subeq	r0, r4, r0
 5c8:	00010000 	andeq	r0, r1, r0
 5cc:	0000445d 	andeq	r4, r0, sp, asr r4
 5d0:	00004800 	andeq	r4, r0, r0, lsl #16
 5d4:	7d000200 	sfmvc	f0, 4, [r0]	; (stcvc 2, cr0, [r0])
 5d8:	00004804 	andeq	r4, r0, r4, lsl #16
 5dc:	00008000 	andeq	r8, r0, r0
 5e0:	7b000200 	blvc	de8 <ugets+0x88>
 5e4:	00000004 	andeq	r0, r0, r4
 5e8:	00000000 	andeq	r0, r0, r0
 5ec:	00008000 	andeq	r8, r0, r0
 5f0:	00008400 	andeq	r8, r0, r0, lsl #8
 5f4:	5d000100 	stfpls	f0, [r0]
 5f8:	00000084 	andeq	r0, r0, r4, lsl #1
 5fc:	00000088 	andeq	r0, r0, r8, lsl #1
 600:	047d0002 	ldrbteq	r0, [sp], #-2
 604:	00000088 	andeq	r0, r0, r8, lsl #1
 608:	000000b4 	strheq	r0, [r0], -r4
 60c:	047b0002 	ldrbteq	r0, [fp], #-2
	...
 618:	000000b4 	strheq	r0, [r0], -r4
 61c:	000000b8 	strheq	r0, [r0], -r8
 620:	b85d0001 	ldmdalt	sp, {r0}^
 624:	bc000000 	stclt	0, cr0, [r0], {0}
 628:	02000000 	andeq	r0, r0, #0
 62c:	bc047d00 	stclt	13, cr7, [r4], {0}
 630:	d8000000 	stmdale	r0, {}
 634:	02000000 	andeq	r0, r0, #0
 638:	00047b00 	andeq	r7, r4, r0, lsl #22
 63c:	00000000 	andeq	r0, r0, r0
 640:	d8000000 	stmdale	r0, {}
 644:	dc000000 	stcle	0, cr0, [r0], {0}
 648:	01000000 	tsteq	r0, r0
 64c:	00dc5d00 	sbcseq	r5, ip, r0, lsl #26
 650:	00e00000 	rsceq	r0, r0, r0
 654:	00020000 	andeq	r0, r2, r0
 658:	00e0047d 	rsceq	r0, r0, sp, ror r4
 65c:	00fc0000 	rscseq	r0, ip, r0
 660:	00020000 	andeq	r0, r2, r0
 664:	0000047b 	andeq	r0, r0, fp, ror r4
	...
 670:	00040000 	andeq	r0, r4, r0
 674:	00010000 	andeq	r0, r1, r0
 678:	0000045d 	andeq	r0, r0, sp, asr r4
 67c:	00000800 	andeq	r0, r0, r0, lsl #16
 680:	7d000200 	sfmvc	f0, 4, [r0]	; (stcvc 2, cr0, [r0])
 684:	00000804 	andeq	r0, r0, r4, lsl #16
 688:	00007000 	andeq	r7, r0, r0
 68c:	7b000200 	blvc	e94 <itoa+0xa8>
 690:	00000004 	andeq	r0, r0, r4
 694:	00000000 	andeq	r0, r0, r0
 698:	00007000 	andeq	r7, r0, r0
 69c:	00007400 	andeq	r7, r0, r0, lsl #8
 6a0:	5d000100 	stfpls	f0, [r0]
 6a4:	00000074 	andeq	r0, r0, r4, ror r0
 6a8:	00000078 	andeq	r0, r0, r8, ror r0
 6ac:	047d0002 	ldrbteq	r0, [sp], #-2
 6b0:	00000078 	andeq	r0, r0, r8, ror r0
 6b4:	000000d8 	ldrdeq	r0, [r0], -r8
 6b8:	047b0002 	ldrbteq	r0, [fp], #-2
	...
 6c4:	000000d8 	ldrdeq	r0, [r0], -r8
 6c8:	000000dc 	ldrdeq	r0, [r0], -ip
 6cc:	dc5d0001 	mrrcle	0, 0, r0, sp, cr1
 6d0:	e0000000 	and	r0, r0, r0
 6d4:	02000000 	andeq	r0, r0, #0
 6d8:	e00c7d00 	and	r7, ip, r0, lsl #26
 6dc:	ac000000 	stcge	0, cr0, [r0], {0}
 6e0:	02000001 	andeq	r0, r0, #1
 6e4:	00047b00 	andeq	r7, r4, r0, lsl #22
 6e8:	00000000 	andeq	r0, r0, r0
 6ec:	ac000000 	stcge	0, cr0, [r0], {0}
 6f0:	b0000001 	andlt	r0, r0, r1
 6f4:	01000001 	tsteq	r0, r1
 6f8:	01b05d00 	lslseq	r5, r0, #26
 6fc:	01b40000 	undefined instruction 0x01b40000
 700:	00020000 	andeq	r0, r2, r0
 704:	01b4047d 	undefined instruction 0x01b4047d
 708:	02640000 	rsbeq	r0, r4, #0
 70c:	00020000 	andeq	r0, r2, r0
 710:	0000047b 	andeq	r0, r0, fp, ror r4
 714:	00000000 	andeq	r0, r0, r0
 718:	02640000 	rsbeq	r0, r4, #0
 71c:	02680000 	rsbeq	r0, r8, #0
 720:	00010000 	andeq	r0, r1, r0
 724:	0002685d 	andeq	r6, r2, sp, asr r8
 728:	00026c00 	andeq	r6, r2, r0, lsl #24
 72c:	7d000200 	sfmvc	f0, 4, [r0]	; (stcvc 2, cr0, [r0])
 730:	00026c04 	andeq	r6, r2, r4, lsl #24
 734:	0002dc00 	andeq	sp, r2, r0, lsl #24
 738:	7b000200 	blvc	f40 <xtoa+0x44>
 73c:	00000004 	andeq	r0, r0, r4
 740:	00000000 	andeq	r0, r0, r0
 744:	0002dc00 	andeq	sp, r2, r0, lsl #24
 748:	0002e000 	andeq	lr, r2, r0
 74c:	5d000100 	stfpls	f0, [r0]
 750:	000002e0 	andeq	r0, r0, r0, ror #5
 754:	000002e4 	andeq	r0, r0, r4, ror #5
 758:	047d0002 	ldrbteq	r0, [sp], #-2
 75c:	000002e4 	andeq	r0, r0, r4, ror #5
 760:	00000380 	andeq	r0, r0, r0, lsl #7
 764:	047b0002 	ldrbteq	r0, [fp], #-2
	...
 770:	00000380 	andeq	r0, r0, r0, lsl #7
 774:	00000384 	andeq	r0, r0, r4, lsl #7
 778:	845d0001 	ldrbhi	r0, [sp], #-1
 77c:	88000003 	stmdahi	r0, {r0, r1}
 780:	02000003 	andeq	r0, r0, #3
 784:	88047d00 	stmdahi	r4, {r8, sl, fp, ip, sp, lr}
 788:	18000003 	stmdane	r0, {r0, r1}
 78c:	02000004 	andeq	r0, r0, #4
 790:	00047b00 	andeq	r7, r4, r0, lsl #22
 794:	00000000 	andeq	r0, r0, r0
 798:	18000000 	stmdane	r0, {}
 79c:	1c000004 	stcne	0, cr0, [r0], {4}
 7a0:	01000004 	tsteq	r0, r4
 7a4:	041c5d00 	ldreq	r5, [ip], #-3328	; 0xd00
 7a8:	04200000 	strteq	r0, [r0]
 7ac:	00020000 	andeq	r0, r2, r0
 7b0:	0420047d 	strteq	r0, [r0], #-1149	; 0x47d
 7b4:	04ec0000 	strbteq	r0, [ip]
 7b8:	00020000 	andeq	r0, r2, r0
 7bc:	0000047b 	andeq	r0, r0, fp, ror r4
 7c0:	00000000 	andeq	r0, r0, r0
 7c4:	04ec0000 	strbteq	r0, [ip]
 7c8:	04f00000 	ldrbteq	r0, [r0]
 7cc:	00010000 	andeq	r0, r1, r0
 7d0:	0004f05d 	andeq	pc, r4, sp, asr r0
 7d4:	0004f400 	andeq	pc, r4, r0, lsl #8
 7d8:	7d000200 	sfmvc	f0, 4, [r0]	; (stcvc 2, cr0, [r0])
 7dc:	0004f408 	andeq	pc, r4, r8, lsl #8
 7e0:	00059400 	andeq	r9, r5, r0, lsl #8
 7e4:	7b000200 	blvc	fec <xtoa+0xf0>
 7e8:	00000004 	andeq	r0, r0, r4
 7ec:	00000000 	andeq	r0, r0, r0
 7f0:	00059400 	andeq	r9, r5, r0, lsl #8
 7f4:	00059800 	andeq	r9, r5, r0, lsl #16
 7f8:	5d000100 	stfpls	f0, [r0]
 7fc:	00000598 	muleq	r0, r8, r5
 800:	0000059c 	muleq	r0, ip, r5
 804:	087d0002 	ldmdaeq	sp!, {r1}^
 808:	0000059c 	muleq	r0, ip, r5
 80c:	00000658 	andeq	r0, r0, r8, asr r6
 810:	047b0002 	ldrbteq	r0, [fp], #-2
	...
 81c:	00000658 	andeq	r0, r0, r8, asr r6
 820:	0000065c 	andeq	r0, r0, ip, asr r6
 824:	5c5d0001 	mrrcpl	0, 0, r0, sp, cr1
 828:	60000006 	andvs	r0, r0, r6
 82c:	02000006 	andeq	r0, r0, #6
 830:	60047d00 	andvs	r7, r4, r0, lsl #26
 834:	c0000006 	andgt	r0, r0, r6
 838:	02000006 	andeq	r0, r0, #6
 83c:	00047b00 	andeq	r7, r4, r0, lsl #22
 840:	00000000 	andeq	r0, r0, r0
 844:	c0000000 	andgt	r0, r0, r0
 848:	c4000006 	strgt	r0, [r0], #-6
 84c:	01000006 	tsteq	r0, r6
 850:	06c45d00 	strbeq	r5, [r4], r0, lsl #26
 854:	06c80000 	strbeq	r0, [r8], r0
 858:	00020000 	andeq	r0, r2, r0
 85c:	06c8047d 	uxtab16eq	r0, r8, sp, ror #8
 860:	07140000 	ldreq	r0, [r4, -r0]
 864:	00020000 	andeq	r0, r2, r0
 868:	0000047b 	andeq	r0, r0, fp, ror r4
 86c:	00000000 	andeq	r0, r0, r0
 870:	07140000 	ldreq	r0, [r4, -r0]
 874:	07180000 	ldreq	r0, [r8, -r0]
 878:	00010000 	andeq	r0, r1, r0
 87c:	0007185d 	andeq	r1, r7, sp, asr r8
 880:	00071c00 	andeq	r1, r7, r0, lsl #24
 884:	7d000200 	sfmvc	f0, 4, [r0]	; (stcvc 2, cr0, [r0])
 888:	00071c04 	andeq	r1, r7, r4, lsl #24
 88c:	00079400 	andeq	r9, r7, r0, lsl #8
 890:	7b000200 	blvc	1098 <uprintf+0x28>
 894:	00000004 	andeq	r0, r0, r4
 898:	00000000 	andeq	r0, r0, r0
 89c:	00079400 	andeq	r9, r7, r0, lsl #8
 8a0:	00079800 	andeq	r9, r7, r0, lsl #16
 8a4:	5d000100 	stfpls	f0, [r0]
 8a8:	00000798 	muleq	r0, r8, r7
 8ac:	0000079c 	muleq	r0, ip, r7
 8b0:	047d0002 	ldrbteq	r0, [sp], #-2
 8b4:	0000079c 	muleq	r0, ip, r7
 8b8:	00000858 	andeq	r0, r0, r8, asr r8
 8bc:	047b0002 	ldrbteq	r0, [fp], #-2
	...
 8c8:	00000858 	andeq	r0, r0, r8, asr r8
 8cc:	0000085c 	andeq	r0, r0, ip, asr r8
 8d0:	5c5d0001 	mrrcpl	0, 0, r0, sp, cr1
 8d4:	60000008 	andvs	r0, r0, r8
 8d8:	02000008 	andeq	r0, r0, #8
 8dc:	60047d00 	andvs	r7, r4, r0, lsl #26
 8e0:	f0000008 	undefined instruction 0xf0000008
 8e4:	02000008 	andeq	r0, r0, #8
 8e8:	00047b00 	andeq	r7, r4, r0, lsl #22
 8ec:	00000000 	andeq	r0, r0, r0
 8f0:	f0000000 	undefined instruction 0xf0000000
 8f4:	f4000008 	vst4.8	{d0-d3}, [r0], r8
 8f8:	01000008 	tsteq	r0, r8
 8fc:	08f45d00 	ldmeq	r4!, {r8, sl, fp, ip, lr}^
 900:	08f80000 	ldmeq	r8!, {}^
 904:	00020000 	andeq	r0, r2, r0
 908:	08f8047d 	ldmeq	r8!, {r0, r2, r3, r4, r5, r6, sl}^
 90c:	096c0000 	stmdbeq	ip!, {}^
 910:	00020000 	andeq	r0, r2, r0
 914:	0000047b 	andeq	r0, r0, fp, ror r4
 918:	00000000 	andeq	r0, r0, r0
 91c:	096c0000 	stmdbeq	ip!, {}^
 920:	09700000 	ldmdbeq	r0!, {}^
 924:	00010000 	andeq	r0, r1, r0
 928:	0009705d 	andeq	r7, r9, sp, asr r0
 92c:	00097400 	andeq	r7, r9, r0, lsl #8
 930:	7d000200 	sfmvc	f0, 4, [r0]	; (stcvc 2, cr0, [r0])
 934:	00097404 	andeq	r7, r9, r4, lsl #8
 938:	0009fc00 	andeq	pc, r9, r0, lsl #24
 93c:	7b000200 	blvc	1144 <uprintf+0xd4>
 940:	00000004 	andeq	r0, r0, r4
 944:	00000000 	andeq	r0, r0, r0
 948:	0009fc00 	andeq	pc, r9, r0, lsl #24
 94c:	000a0000 	andeq	r0, sl, r0
 950:	5d000100 	stfpls	f0, [r0]
 954:	00000a00 	andeq	r0, r0, r0, lsl #20
 958:	00000a04 	andeq	r0, r0, r4, lsl #20
 95c:	047d0002 	ldrbteq	r0, [sp], #-2
 960:	00000a04 	andeq	r0, r0, r4, lsl #20
 964:	00000b14 	andeq	r0, r0, r4, lsl fp
 968:	047b0002 	ldrbteq	r0, [fp], #-2
	...
 974:	00000b14 	andeq	r0, r0, r4, lsl fp
 978:	00000b18 	andeq	r0, r0, r8, lsl fp
 97c:	185d0001 	ldmdane	sp, {r0}^
 980:	1c00000b 	stcne	0, cr0, [r0], {11}
 984:	0200000b 	andeq	r0, r0, #11
 988:	1c047d00 	stcne	13, cr7, [r4], {0}
 98c:	bc00000b 	stclt	0, cr0, [r0], {11}
 990:	0200000b 	andeq	r0, r0, #11
 994:	00047b00 	andeq	r7, r4, r0, lsl #22
 998:	00000000 	andeq	r0, r0, r0
 99c:	bc000000 	stclt	0, cr0, [r0], {0}
 9a0:	c000000b 	andgt	r0, r0, fp
 9a4:	0100000b 	tsteq	r0, fp
 9a8:	0bc05d00 	bleq	ff017db0 <bss_end+0xff014ac8>
 9ac:	0bc40000 	bleq	ff1009b4 <bss_end+0xff0fd6cc>
 9b0:	00020000 	andeq	r0, r2, r0
 9b4:	0bc4047d 	bleq	ff101bb0 <bss_end+0xff0fe8c8>
 9b8:	0c380000 	ldceq	0, cr0, [r8]
 9bc:	00020000 	andeq	r0, r2, r0
 9c0:	0000047b 	andeq	r0, r0, fp, ror r4
 9c4:	00000000 	andeq	r0, r0, r0
 9c8:	0c380000 	ldceq	0, cr0, [r8]
 9cc:	0c3c0000 	ldceq	0, cr0, [ip]
 9d0:	00010000 	andeq	r0, r1, r0
 9d4:	000c3c5d 	andeq	r3, ip, sp, asr ip
 9d8:	000c4000 	andeq	r4, ip, r0
 9dc:	7d000200 	sfmvc	f0, 4, [r0]	; (stcvc 2, cr0, [r0])
 9e0:	000c4008 	andeq	r4, ip, r8
 9e4:	000ce400 	andeq	lr, ip, r0, lsl #8
 9e8:	7b000200 	blvc	11f0 <uprintf+0x180>
 9ec:	00000004 	andeq	r0, r0, r4
 9f0:	00000000 	andeq	r0, r0, r0
 9f4:	000ce400 	andeq	lr, ip, r0, lsl #8
 9f8:	000ce800 	andeq	lr, ip, r0, lsl #16
 9fc:	5d000100 	stfpls	f0, [r0]
 a00:	00000ce8 	andeq	r0, r0, r8, ror #25
 a04:	00000cec 	andeq	r0, r0, ip, ror #25
 a08:	047d0002 	ldrbteq	r0, [sp], #-2
 a0c:	00000cec 	andeq	r0, r0, ip, ror #25
 a10:	00000d84 	andeq	r0, r0, r4, lsl #27
 a14:	047b0002 	ldrbteq	r0, [fp], #-2
	...
 a24:	00000004 	andeq	r0, r0, r4
 a28:	045d0001 	ldrbeq	r0, [sp], #-1
 a2c:	08000000 	stmdaeq	r0, {}
 a30:	02000000 	andeq	r0, r0, #0
 a34:	08047d00 	stmdaeq	r4, {r8, sl, fp, ip, sp, lr}
 a38:	e4000000 	str	r0, [r0]
 a3c:	02000000 	andeq	r0, r0, #0
 a40:	00047b00 	andeq	r7, r4, r0, lsl #22
	...
 a4c:	04000000 	streq	r0, [r0]
 a50:	01000000 	tsteq	r0, r0
 a54:	00045d00 	andeq	r5, r4, r0, lsl #26
 a58:	00080000 	andeq	r0, r8, r0
 a5c:	00020000 	andeq	r0, r2, r0
 a60:	0008087d 	andeq	r0, r8, sp, ror r8
 a64:	00200000 	eoreq	r0, r0, r0
 a68:	00020000 	andeq	r0, r2, r0
 a6c:	0000047b 	andeq	r0, r0, fp, ror r4
 a70:	00000000 	andeq	r0, r0, r0
 a74:	00200000 	eoreq	r0, r0, r0
 a78:	00240000 	eoreq	r0, r4, r0
 a7c:	00010000 	andeq	r0, r1, r0
 a80:	0000245d 	andeq	r2, r0, sp, asr r4
 a84:	00002800 	andeq	r2, r0, r0, lsl #16
 a88:	7d000200 	sfmvc	f0, 4, [r0]	; (stcvc 2, cr0, [r0])
 a8c:	00002808 	andeq	r2, r0, r8, lsl #16
 a90:	00004000 	andeq	r4, r0, r0
 a94:	7b000200 	blvc	129c <create_kernel_table+0x50>
 a98:	00000004 	andeq	r0, r0, r4
 a9c:	00000000 	andeq	r0, r0, r0
	...

Disassembly of section .debug_pubnames:

00000000 <.debug_pubnames>:
   0:	00000031 	andeq	r0, r0, r1, lsr r0
   4:	00650002 	rsbeq	r0, r5, r2
   8:	009b0000 	addseq	r0, fp, r0
   c:	00250000 	eoreq	r0, r5, r0
  10:	72630000 	rsbvc	r0, r3, #0
  14:	65746165 	ldrbvs	r6, [r4, #-357]!	; 0x165
  18:	6761705f 	undefined instruction 0x6761705f
  1c:	61745f65 	cmnvs	r4, r5, ror #30
  20:	00656c62 	rsbeq	r6, r5, r2, ror #24
  24:	00000076 	andeq	r0, r0, r6, ror r0
  28:	5f756d6d 	svcpl	0x00756d6d
  2c:	74696e69 	strbtvc	r6, [r9], #-3689	; 0xe69
  30:	00000000 	andeq	r0, r0, r0
  34:	00005500 	andeq	r5, r0, r0, lsl #10
  38:	00000200 	andeq	r0, r0, r0, lsl #4
  3c:	35000001 	strcc	r0, [r0, #-1]
  40:	25000002 	strcs	r0, [r0, #-2]
  44:	73000000 	movwvc	r0, #0
  48:	6c6c6568 	cfstr64vs	mvdx6, [ip], #-416	; 0xfffffe60
  4c:	64656c5f 	strbtvs	r6, [r5], #-3167	; 0xc5f
  50:	0000a600 	andeq	sl, r0, r0, lsl #12
  54:	65687300 	strbvs	r7, [r8, #-768]!	; 0x300
  58:	635f6c6c 	cmpvs	pc, #27648	; 0x6c00
  5c:	6f6d6d6f 	svcvs	0x006d6d6f
  60:	00dc006e 	sbcseq	r0, ip, lr, rrx
  64:	6e690000 	cdpvs	0, 6, cr0, cr9, cr0, {0}
  68:	71007469 	tstvc	r0, r9, ror #8
  6c:	68000001 	stmdavs	r0, {r0}
  70:	6c646e61 	stclvs	14, cr6, [r4], #-388	; 0xfffffe7c
  74:	6e695f65 	cdpvs	15, 6, cr5, cr9, cr5, {3}
  78:	01850074 	orreq	r0, r5, r4, ror r0
  7c:	616d0000 	cmnvs	sp, r0
  80:	27006e69 	strcs	r6, [r0, -r9, ror #28]
  84:	70000002 	andvc	r0, r0, r2
  88:	00000063 	andeq	r0, r0, r3, rrx
  8c:	00c80000 	sbceq	r0, r8, r0
  90:	00020000 	andeq	r0, r2, r0
  94:	00000335 	andeq	r0, r0, r5, lsr r3
  98:	0000022c 	andeq	r0, r0, ip, lsr #4
  9c:	00000025 	andeq	r0, r0, r5, lsr #32
  a0:	656c6573 	strbvs	r6, [ip, #-1395]!	; 0x573
  a4:	635f7463 	cmpvs	pc, #1660944384	; 0x63000000
  a8:	00706968 	rsbseq	r6, r0, r8, ror #18
  ac:	00000039 	andeq	r0, r0, r9, lsr r0
  b0:	65736964 	ldrbvs	r6, [r3, #-2404]!	; 0x964
  b4:	7463656c 	strbtvc	r6, [r3], #-1388	; 0x56c
  b8:	6968635f 	stmdbvs	r8!, {r0, r1, r2, r3, r4, r6, r8, r9, sp, lr}^
  bc:	004d0070 	subeq	r0, sp, r0, ror r0
  c0:	6c630000 	stclvs	0, cr0, [r3]
  c4:	5f726165 	svcpl	0x00726165
  c8:	00426e52 	subeq	r6, r2, r2, asr lr
  cc:	00000061 	andeq	r0, r0, r1, rrx
  d0:	646e6573 	strbtvs	r6, [lr], #-1395	; 0x573
  d4:	6d6d635f 	stclvs	3, cr6, [sp, #-380]!	; 0xfffffe84
  d8:	00900064 	addseq	r0, r0, r4, rrx
  dc:	65730000 	ldrbvs	r0, [r3]!
  e0:	615f646e 	cmpvs	pc, lr, ror #8
  e4:	00726464 	rsbseq	r6, r2, r4, ror #8
  e8:	000000b8 	strheq	r0, [r0], -r8
  ec:	74696177 	strbtvc	r6, [r9], #-375	; 0x177
  f0:	426e525f 	rsbmi	r5, lr, #-268435451	; 0xf0000005
  f4:	0000cc00 	andeq	ip, r0, r0, lsl #24
  f8:	6e616e00 	cdpvs	14, 6, cr6, cr1, cr0, {0}
  fc:	65725f64 	ldrbvs	r5, [r2, #-3940]!	; 0xf64
 100:	00746573 	rsbseq	r6, r4, r3, ror r5
 104:	000000e0 	andeq	r0, r0, r0, ror #1
 108:	646e616e 	strbtvs	r6, [lr], #-366	; 0x16e
 10c:	696e695f 	stmdbvs	lr!, {r0, r1, r2, r3, r4, r6, r8, fp, sp, lr}^
 110:	00f40074 	rscseq	r0, r4, r4, ror r0
 114:	616e0000 	cmnvs	lr, r0
 118:	505f646e 	subspl	r6, pc, lr, ror #8
 11c:	52656761 	rsbpl	r6, r5, #25427968	; 0x1840000
 120:	00646165 	rsbeq	r6, r4, r5, ror #2
 124:	00000151 	andeq	r0, r0, r1, asr r1
 128:	646e616e 	strbtvs	r6, [lr], #-366	; 0x16e
 12c:	6761505f 	undefined instruction 0x6761505f
 130:	69725765 	ldmdbvs	r2!, {r0, r2, r5, r6, r8, r9, sl, ip, lr}^
 134:	a5006574 	strge	r6, [r0, #-1396]	; 0x574
 138:	6e000001 	cdpvs	0, 0, cr0, cr0, cr1, {0}
 13c:	5f646e61 	svcpl	0x00646e61
 140:	725f6f74 	subsvc	r6, pc, #464	; 0x1d0
 144:	f5006d61 	undefined instruction 0xf5006d61
 148:	6e000001 	cdpvs	0, 0, cr0, cr0, cr1, {0}
 14c:	5f646e61 	svcpl	0x00646e61
 150:	73617265 	cmnvc	r1, #1342177286	; 0x50000006
 154:	00000065 	andeq	r0, r0, r5, rrx
 158:	001c0000 	andseq	r0, ip, r0
 15c:	00020000 	andeq	r0, r2, r0
 160:	00000561 	andeq	r0, r0, r1, ror #10
 164:	0000003b 	andeq	r0, r0, fp, lsr r0
 168:	00000025 	andeq	r0, r0, r5, lsr #32
 16c:	70617274 	rsbvc	r7, r1, r4, ror r2
 170:	696e695f 	stmdbvs	lr!, {r0, r1, r2, r3, r4, r6, r8, fp, sp, lr}^
 174:	00000074 	andeq	r0, r0, r4, ror r0
 178:	00610000 	rsbeq	r0, r1, r0
 17c:	00020000 	andeq	r0, r2, r0
 180:	0000059c 	muleq	r0, ip, r5
 184:	0000023f 	andeq	r0, r0, pc, lsr r2
 188:	00000055 	andeq	r0, r0, r5, asr r0
 18c:	74726175 	ldrbtvc	r6, [r2], #-373	; 0x175
 190:	6e695f30 	mcrvs	15, 3, r5, cr9, cr0, {1}
 194:	6a007469 	bvs	1d340 <bss_end+0x1a058>
 198:	70000000 	andvc	r0, r0, r0
 19c:	00637475 	rsbeq	r7, r3, r5, ror r4
 1a0:	00000097 	muleq	r0, r7, r0
 1a4:	63746567 	cmnvs	r4, #432013312	; 0x19c00000
 1a8:	0000b000 	andeq	fp, r0, r0
 1ac:	75707500 	ldrbvc	r7, [r0, #-1280]!	; 0x500
 1b0:	dc007374 	stcle	3, cr7, [r0], {116}	; 0x74
 1b4:	75000000 	strvc	r0, [r0]
 1b8:	73746567 	cmnvc	r4, #432013312	; 0x19c00000
 1bc:	00012d00 	andeq	r2, r1, r0, lsl #26
 1c0:	6f746900 	svcvs	0x00746900
 1c4:	01740061 	cmneq	r4, r1, rrx
 1c8:	74780000 	ldrbtvc	r0, [r8]
 1cc:	b400616f 	strlt	r6, [r0], #-367	; 0x16f
 1d0:	75000001 	strvc	r0, [r0, #-1]
 1d4:	6e697270 	mcrvs	2, 3, r7, cr9, cr0, {3}
 1d8:	00006674 	andeq	r6, r0, r4, ror r6
 1dc:	63000000 	movwvs	r0, #0
 1e0:	02000000 	andeq	r0, r0, #0
 1e4:	0007db00 	andeq	sp, r7, r0, lsl #22
 1e8:	00013400 	andeq	r3, r1, r0, lsl #8
 1ec:	00002500 	andeq	r2, r0, r0, lsl #10
 1f0:	65726300 	ldrbvs	r6, [r2, #-768]!	; 0x300
 1f4:	5f657461 	svcpl	0x00657461
 1f8:	6e72656b 	cdpvs	5, 7, cr6, cr2, cr11, {3}
 1fc:	745f6c65 	ldrbvc	r6, [pc], #3173	; 204 <create_page_table+0x54>
 200:	656c6261 	strbvs	r6, [ip, #-609]!	; 0x261
 204:	00007600 	andeq	r7, r0, r0, lsl #12
 208:	616f6c00 	cmnvs	pc, r0, lsl #24
 20c:	70615f64 	rsbvc	r5, r1, r4, ror #30
 210:	00a50070 	adceq	r0, r5, r0, ror r0
 214:	72630000 	rsbvc	r0, r3, #0
 218:	65746165 	ldrbvs	r6, [r4, #-357]!	; 0x165
 21c:	7070615f 	rsbsvc	r6, r0, pc, asr r1
 220:	6261745f 	rsbvs	r7, r1, #1593835520	; 0x5f000000
 224:	f700656c 	undefined instruction 0xf700656c
 228:	72000000 	andvc	r0, r0, #0
 22c:	705f6e75 	subsvc	r6, pc, r5, ror lr
 230:	1f006469 	svcne	0x00006469
 234:	73000001 	movwvc	r0, #1
 238:	64656863 	strbtvs	r6, [r5], #-2147	; 0x863
 23c:	696e695f 	stmdbvs	lr!, {r0, r1, r2, r3, r4, r6, r8, fp, sp, lr}^
 240:	00000074 	andeq	r0, r0, r4, ror r0
 244:	004d0000 	subeq	r0, sp, r0
 248:	00020000 	andeq	r0, r2, r0
 24c:	0000090f 	andeq	r0, r0, pc, lsl #18
 250:	00000097 	muleq	r0, r7, r0
 254:	00000025 	andeq	r0, r0, r5, lsr #32
 258:	70656562 	rsbvc	r6, r5, r2, ror #10
 25c:	696e695f 	stmdbvs	lr!, {r0, r1, r2, r3, r4, r6, r8, fp, sp, lr}^
 260:	003a0074 	eorseq	r0, sl, r4, ror r0
 264:	65620000 	strbvs	r0, [r2]!
 268:	725f7065 	subsvc	r7, pc, #101	; 0x65
 26c:	4f006e75 	svcmi	0x00006e75
 270:	6c000000 	stcvs	0, cr0, [r0], {0}
 274:	695f6465 	ldmdbvs	pc, {r0, r2, r5, r6, sl, sp, lr}^
 278:	0074696e 	rsbseq	r6, r4, lr, ror #18
 27c:	00000063 	andeq	r0, r0, r3, rrx
 280:	5f64656c 	svcpl	0x0064656c
 284:	82006e6f 	andhi	r6, r0, #1776	; 0x6f0
 288:	6c000000 	stcvs	0, cr0, [r0], {0}
 28c:	6f5f6465 	svcvs	0x005f6465
 290:	00006666 	andeq	r6, r0, r6, ror #12
 294:	01000000 	tsteq	r0, r0
 298:	02000001 	andeq	r0, r0, #1
 29c:	0009a600 	andeq	sl, r9, r0, lsl #12
 2a0:	00074b00 	andeq	r4, r7, r0, lsl #22
 2a4:	00002500 	andeq	r2, r0, r0, lsl #10
 2a8:	6c656400 	cfstrdvs	mvd6, [r5]
 2ac:	6a007961 	bvs	1e838 <bss_end+0x1b550>
 2b0:	65000000 	strvs	r0, [r0]
 2b4:	36317078 	undefined instruction 0x36317078
 2b8:	0000b500 	andeq	fp, r0, r0, lsl #10
 2bc:	6f746100 	svcvs	0x00746100
 2c0:	01140078 	tsteq	r4, r8, ror r0
 2c4:	74610000 	strbtvc	r0, [r1]
 2c8:	6200696f 	andvs	r6, r0, #1818624	; 0x1bc000
 2cc:	73000001 	movwvc	r0, #1
 2d0:	70637274 	rsbvc	r7, r3, r4, ror r2
 2d4:	01b50079 	undefined instruction 0x01b50079
 2d8:	74730000 	ldrbtvc	r0, [r3]
 2dc:	70636e72 	rsbvc	r6, r3, r2, ror lr
 2e0:	020b0079 	andeq	r0, fp, #121	; 0x79
 2e4:	74730000 	ldrbtvc	r0, [r3]
 2e8:	74616372 	strbtvc	r6, [r1], #-882	; 0x372
 2ec:	00025300 	andeq	r5, r2, r0, lsl #6
 2f0:	72747300 	rsbsvc	r7, r4, #0
 2f4:	7461636e 	strbtvc	r6, [r1], #-878	; 0x36e
 2f8:	0002a900 	andeq	sl, r2, r0, lsl #18
 2fc:	72747300 	rsbsvc	r7, r4, #0
 300:	00706d63 	rsbseq	r6, r0, r3, ror #26
 304:	000002f5 	strdeq	r0, [r0], -r5
 308:	6e727473 	mrcvs	4, 3, r7, cr2, cr3, {3}
 30c:	00706d63 	rsbseq	r6, r0, r3, ror #26
 310:	00000348 	andeq	r0, r0, r8, asr #6
 314:	63727473 	cmnvs	r2, #1929379840	; 0x73000000
 318:	7e007268 	cdpvc	2, 0, cr7, cr0, cr8, {3}
 31c:	73000003 	movwvc	r0, #3
 320:	656c7274 	strbvs	r7, [ip, #-628]!	; 0x274
 324:	03b5006e 	undefined instruction 0x03b5006e
 328:	74730000 	ldrbtvc	r0, [r3]
 32c:	656c6e72 	strbvs	r6, [ip, #-3698]!	; 0xe72
 330:	03fa006e 	mvnseq	r0, #110	; 0x6e
 334:	74730000 	ldrbtvc	r0, [r3]
 338:	6e707372 	mrcvs	3, 3, r7, cr0, cr2, {3}
 33c:	00045800 	andeq	r5, r4, r0, lsl #16
 340:	72747300 	rsbsvc	r7, r4, #0
 344:	6b726270 	blvs	1c98d0c <bss_end+0x1c95a24>
 348:	0004ac00 	andeq	sl, r4, r0, lsl #24
 34c:	6d656d00 	stclvs	13, cr6, [r5]
 350:	00746573 	rsbseq	r6, r4, r3, ror r5
 354:	000004ff 	strdeq	r0, [r0], -pc
 358:	636d656d 	cmnvs	sp, #457179136	; 0x1b400000
 35c:	68007970 	stmdavs	r0, {r4, r5, r6, r8, fp, ip, sp, lr}
 360:	6d000005 	stcvs	0, cr0, [r0, #-20]	; 0xffffffec
 364:	6f6d6d65 	svcvs	0x006d6d65
 368:	ca006576 	bgt	19948 <bss_end+0x16660>
 36c:	6d000005 	stcvs	0, cr0, [r0, #-20]	; 0xffffffec
 370:	6d636d65 	stclvs	13, cr6, [r3, #-404]!	; 0xfffffe6c
 374:	064c0070 	undefined instruction 0x064c0070
 378:	656d0000 	strbvs	r0, [sp]!
 37c:	6163736d 	cmnvs	r3, sp, ror #6
 380:	06a4006e 	strteq	r0, [r4], lr, rrx
 384:	74730000 	ldrbtvc	r0, [r3]
 388:	72747372 	rsbsvc	r7, r4, #-939524095	; 0xc8000001
 38c:	0006fb00 	andeq	pc, r6, r0, lsl #22
 390:	6d656d00 	stclvs	13, cr6, [r5]
 394:	00726863 	rsbseq	r6, r2, r3, ror #16
 398:	00000000 	andeq	r0, r0, r0
 39c:	0000001b 	andeq	r0, r0, fp, lsl r0
 3a0:	10f10002 	rscsne	r0, r1, r2
 3a4:	00b30000 	adcseq	r0, r3, r0
 3a8:	00250000 	eoreq	r0, r5, r0
 3ac:	656d0000 	strbvs	r0, [sp]!
 3b0:	6e695f6d 	cdpvs	15, 6, cr5, cr9, cr13, {3}
 3b4:	00007469 	andeq	r7, r0, r9, ror #8
 3b8:	20000000 	andcs	r0, r0, r0
 3bc:	02000000 	andeq	r0, r0, #0
 3c0:	0011a400 	andseq	sl, r1, r0, lsl #8
 3c4:	00004e00 	andeq	r4, r0, r0, lsl #28
 3c8:	00002500 	andeq	r2, r0, r0, lsl #10
 3cc:	70706100 	rsbsvc	r6, r0, r0, lsl #2
 3d0:	00390031 	eorseq	r0, r9, r1, lsr r0
 3d4:	70610000 	rsbvc	r0, r1, r0
 3d8:	00003270 	andeq	r3, r0, r0, ror r2
 3dc:	Address 0x000003dc is out of bounds.


Disassembly of section .debug_str:

00000000 <.debug_str>:
   0:	6d6f682f 	stclvs	8, cr6, [pc, #-188]!	; 0xffffff44
   4:	65642f65 	strbvs	r2, [r4, #-3941]!	; 0xf65
   8:	656e6f6d 	strbvs	r6, [lr, #-3949]!	; 0xf6d
   c:	702f666c 	eorvc	r6, pc, ip, ror #12
  10:	656a6f72 	strbvs	r6, [sl, #-3954]!	; 0xf72
  14:	302f7463 	eorcc	r7, pc, r3, ror #8
  18:	796d2e30 	stmdbvc	sp!, {r4, r5, r9, sl, fp, sp}^
  1c:	6b726f77 	blvs	1c9be00 <bss_end+0x1c98b18>
  20:	67656c2f 	strbvs	r6, [r5, -pc, lsr #24]!
  24:	2d796361 	ldclcs	3, cr6, [r9, #-388]!	; 0xfffffe7c
  28:	2d6d7261 	sfmcs	f7, 2, [sp, #-388]!	; (stclcs 2, cr7, [sp, #-388]!)	; 0xfffffe7c
  2c:	756e696c 	strbvc	r6, [lr, #-2412]!	; 0x96c
  30:	72630078 	rsbvc	r0, r3, #120	; 0x78
  34:	65746165 	ldrbvs	r6, [r4, #-357]!	; 0x165
  38:	6761705f 	undefined instruction 0x6761705f
  3c:	61745f65 	cmnvs	r4, r5, ror #30
  40:	00656c62 	rsbeq	r6, r5, r2, ror #24
  44:	5f756d6d 	svcpl	0x00756d6d
  48:	5f626c74 	svcpl	0x00626c74
  4c:	65736162 	ldrbvs	r6, [r3, #-354]!	; 0x162
  50:	72697600 	rsbvc	r7, r9, #0
  54:	616c7574 	smcvs	51028	; 0xc754
  58:	00726464 	rsbseq	r6, r2, r4, ror #8
  5c:	20554e47 	subscs	r4, r5, r7, asr #28
  60:	2e342043 	cdpcs	0, 3, cr2, cr4, cr3, {2}
  64:	00332e34 	eorseq	r2, r3, r4, lsr lr
  68:	5f756d6d 	svcpl	0x00756d6d
  6c:	74696e69 	strbtvc	r6, [r9], #-3689	; 0xe69
  70:	6e6f6c00 	cdpvs	12, 6, cr6, cr15, cr0, {0}
  74:	6e752067 	cdpvs	0, 7, cr2, cr5, cr7, {3}
  78:	6e676973 	mcrvs	9, 3, r6, cr7, cr3, {3}
  7c:	69206465 	stmdbvs	r0!, {r0, r2, r5, r6, sl, sp, lr}
  80:	7000746e 	andvc	r7, r0, lr, ror #8
  84:	69737968 	ldmdbvs	r3!, {r3, r5, r6, r8, fp, ip, sp, lr}^
  88:	616c6163 	cmnvs	ip, r3, ror #2
  8c:	00726464 	rsbseq	r6, r2, r4, ror #8
  90:	74696e69 	strbtvc	r6, [r9], #-3689	; 0xe69
  94:	756d6d2f 	strbvc	r6, [sp, #-3375]!	; 0xd2f
  98:	6300632e 	movwvs	r6, #814	; 0x32e
  9c:	625f646d 	subsvs	r6, pc, #1828716544	; 0x6d000000
  a0:	6d006675 	stcvs	6, cr6, [r0, #-468]	; 0xfffffe2c
  a4:	006e6961 	rsbeq	r6, lr, r1, ror #18
  a8:	6c656873 	stclvs	8, cr6, [r5], #-460	; 0xfffffe34
  ac:	656c5f6c 	strbvs	r5, [ip, #-3948]!	; 0xf6c
  b0:	6e690064 	cdpvs	0, 6, cr0, cr9, cr4, {3}
  b4:	6d2f7469 	cfstrsvs	mvf7, [pc, #-420]!	; 0xfffffe5c
  b8:	2e6e6961 	cdpcs	9, 6, cr6, cr14, cr1, {3}
  bc:	67610063 	strbvs	r0, [r1, -r3, rrx]!
  c0:	68007672 	stmdavs	r0, {r1, r4, r5, r6, r9, sl, ip, sp, lr}
  c4:	6c646e61 	stclvs	14, cr6, [r4], #-388	; 0xfffffe7c
  c8:	6e695f65 	cdpvs	15, 6, cr5, cr9, cr5, {3}
  cc:	6f6c0074 	svcvs	0x006c0074
  d0:	6920676e 	stmdbvs	r0!, {r1, r2, r3, r5, r6, r8, r9, sl, sp, lr}
  d4:	6100746e 	tstvs	r0, lr, ror #8
  d8:	00636772 	rsbeq	r6, r3, r2, ror r7
  dc:	6e69616d 	powvsez	f6, f1, #5.0
  e0:	6d656d5f 	stclvs	13, cr6, [r5, #-380]!	; 0xfffffe84
  e4:	5f79726f 	svcpl	0x0079726f
  e8:	72617473 	rsbvc	r7, r1, #1929379840	; 0x73000000
  ec:	6d630074 	stclvs	0, cr0, [r3, #-464]!	; 0xfffffe30
  f0:	72615f64 	rsbvc	r5, r1, #400	; 0x190
  f4:	73007667 	movwvc	r7, #1639	; 0x667
  f8:	6c6c6568 	cfstr64vs	mvdx6, [ip], #-416	; 0xfffffe60
  fc:	6d6f635f 	stclvs	3, cr6, [pc, #-380]!	; 0xfffffe84
 100:	006e6f6d 	rsbeq	r6, lr, sp, ror #30
 104:	66667562 	strbtvs	r7, [r6], -r2, ror #10
 108:	6d5f7265 	lfmvs	f7, 2, [pc, #-404]	; (ldclvs 2, cr7, [pc, #-404])	; 0xfffffe6c
 10c:	726f6d65 	rsbvc	r6, pc, #6464	; 0x1940
 110:	6e655f79 	mcrvs	15, 3, r5, cr5, cr9, {3}
 114:	616e0064 	cmnvs	lr, r4, rrx
 118:	725f646e 	subsvc	r6, pc, #1845493760	; 0x6e000000
 11c:	74657365 	strbtvc	r7, [r5], #-869	; 0x365
 120:	656c6300 	strbvs	r6, [ip, #-768]!	; 0x300
 124:	525f7261 	subspl	r7, pc, #268435462	; 0x10000006
 128:	6e00426e 	cdpvs	2, 0, cr4, cr0, cr14, {3}
 12c:	5f646e61 	svcpl	0x00646e61
 130:	74696e69 	strbtvc	r6, [r9], #-3689	; 0xe69
 134:	6e616e00 	cdpvs	14, 6, cr6, cr1, cr0, {0}
 138:	6f745f64 	svcvs	0x00745f64
 13c:	6d61725f 	sfmvs	f7, 2, [r1, #-380]!	; (stclvs 2, cr7, [r1, #-380]!)	; 0xfffffe84
 140:	6e616e00 	cdpvs	14, 6, cr6, cr1, cr0, {0}
 144:	61505f64 	cmpvs	r0, r4, ror #30
 148:	72576567 	subsvc	r6, r7, #432013312	; 0x19c00000
 14c:	00657469 	rsbeq	r7, r5, r9, ror #8
 150:	69736e75 	ldmdbvs	r3!, {r0, r2, r4, r5, r6, r9, sl, fp, sp, lr}^
 154:	64656e67 	strbtvs	r6, [r5], #-3687	; 0xe67
 158:	61686320 	cmnvs	r8, r0, lsr #6
 15c:	69730072 	ldmdbvs	r3!, {r1, r4, r5, r6}^
 160:	7300657a 	movwvc	r6, #1402	; 0x57a
 164:	6d617264 	sfmvs	f7, 2, [r1, #-400]!	; (stclvs 2, cr7, [r1, #-400]!)	; 0xfffffe70
 168:	6464615f 	strbtvs	r6, [r4], #-351	; 0x15f
 16c:	69640072 	stmdbvs	r4!, {r1, r4, r5, r6}^
 170:	656c6573 	strbvs	r6, [ip, #-1395]!	; 0x573
 174:	635f7463 	cmpvs	pc, #1660944384	; 0x63000000
 178:	00706968 	rsbseq	r6, r0, r8, ror #18
 17c:	646e616e 	strbtvs	r6, [lr], #-366	; 0x16e
 180:	6761505f 	undefined instruction 0x6761505f
 184:	61655265 	cmnvs	r5, r5, ror #4
 188:	74730064 	ldrbtvc	r0, [r3], #-100	; 0x64
 18c:	5f747261 	svcpl	0x00747261
 190:	72646461 	rsbvc	r6, r4, #1627389952	; 0x61000000
 194:	696e6900 	stmdbvs	lr!, {r8, fp, sp, lr}^
 198:	616e2f74 	smcvs	58100	; 0xe2f4
 19c:	632e646e 	teqvs	lr, #1845493760	; 0x6e000000
 1a0:	6e616e00 	cdpvs	14, 6, cr6, cr1, cr0, {0}
 1a4:	72655f64 	rsbvc	r5, r5, #400	; 0x190
 1a8:	00657361 	rsbeq	r7, r5, r1, ror #6
 1ac:	646e6573 	strbtvs	r6, [lr], #-1395	; 0x573
 1b0:	6464615f 	strbtvs	r6, [r4], #-351	; 0x15f
 1b4:	61770072 	cmnvs	r7, r2, ror r0
 1b8:	525f7469 	subspl	r7, pc, #1761607680	; 0x69000000
 1bc:	7300426e 	movwvc	r4, #622	; 0x26e
 1c0:	5f646e65 	svcpl	0x00646e65
 1c4:	646d6d63 	strbtvs	r6, [sp], #-3427	; 0xd63
 1c8:	66756200 	ldrbtvs	r6, [r5], -r0, lsl #4
 1cc:	72740066 	rsbsvc	r0, r4, #102	; 0x66
 1d0:	695f7061 	ldmdbvs	pc, {r0, r5, r6, ip, sp, lr}^
 1d4:	0074696e 	rsbseq	r6, r4, lr, ror #18
 1d8:	6e72656b 	cdpvs	5, 7, cr6, cr2, cr11, {3}
 1dc:	742f6c65 	strtvc	r6, [pc], #3173	; 1e4 <create_page_table+0x34>
 1e0:	2e706172 	mrccs	1, 3, r6, cr0, cr2, {3}
 1e4:	74690063 	strbtvc	r0, [r9], #-99	; 0x63
 1e8:	6b00616f 	blvs	187ac <bss_end+0x154c4>
 1ec:	656e7265 	strbvs	r7, [lr, #-613]!	; 0x265
 1f0:	61752f6c 	cmnvs	r5, ip, ror #30
 1f4:	632e7472 	teqvs	lr, #1912602624	; 0x72000000
 1f8:	65677500 	strbvs	r7, [r7, #-1280]!	; 0x500
 1fc:	5f007374 	svcpl	0x00007374
 200:	5f61765f 	svcpl	0x0061765f
 204:	7473696c 	ldrbtvc	r6, [r3], #-2412	; 0x96c
 208:	74656700 	strbtvc	r6, [r5], #-1792	; 0x700
 20c:	74780063 	ldrbtvc	r0, [r8], #-99	; 0x63
 210:	7500616f 	strvc	r6, [r0, #-367]	; 0x16f
 214:	6e697270 	mcrvs	2, 3, r7, cr9, cr0, {3}
 218:	75006674 	strvc	r6, [r0, #-1652]	; 0x674
 21c:	30747261 	rsbscc	r7, r4, r1, ror #4
 220:	696e695f 	stmdbvs	lr!, {r0, r1, r2, r3, r4, r6, r8, fp, sp, lr}^
 224:	5f5f0074 	svcpl	0x005f0074
 228:	63756e67 	cmnvs	r5, #1648	; 0x670
 22c:	5f61765f 	svcpl	0x0061765f
 230:	7473696c 	ldrbtvc	r6, [r3], #-2412	; 0x96c
 234:	74757000 	ldrbtvc	r7, [r5]
 238:	70750063 	rsbsvc	r0, r5, r3, rrx
 23c:	00737475 	rsbseq	r7, r3, r5, ror r4
 240:	65766173 	ldrbvs	r6, [r6, #-371]!	; 0x173
 244:	615f5f00 	cmpvs	pc, r0, lsl #30
 248:	72630070 	rsbvc	r0, r3, #112	; 0x70
 24c:	65746165 	ldrbvs	r6, [r4, #-357]!	; 0x165
 250:	7070615f 	rsbsvc	r6, r0, pc, asr r1
 254:	6261745f 	rsbvs	r7, r1, #1593835520	; 0x5f000000
 258:	6b00656c 	blvs	19810 <bss_end+0x16528>
 25c:	656e7265 	strbvs	r7, [lr, #-613]!	; 0x265
 260:	63732f6c 	cmnvs	r3, #432	; 0x1b0
 264:	2e646568 	cdpcs	5, 6, cr6, cr4, cr8, {3}
 268:	63730063 	cmnvs	r3, #99	; 0x63
 26c:	5f646568 	svcpl	0x00646568
 270:	74696e69 	strbtvc	r6, [r9], #-3689	; 0xe69
 274:	616f6c00 	cmnvs	pc, r0, lsl #24
 278:	70615f64 	rsbvc	r5, r1, r4, ror #30
 27c:	70610070 	rsbvc	r0, r1, r0, ror r0
 280:	64646170 	strbtvs	r6, [r4], #-368	; 0x170
 284:	75720072 	ldrbvc	r0, [r2, #-114]!	; 0x72
 288:	69705f6e 	ldmdbvs	r0!, {r1, r2, r3, r5, r6, r8, r9, sl, fp, ip, lr}^
 28c:	72630064 	rsbvc	r0, r3, #100	; 0x64
 290:	65746165 	ldrbvs	r6, [r4, #-357]!	; 0x165
 294:	72656b5f 	rsbvc	r6, r5, #97280	; 0x17c00
 298:	5f6c656e 	svcpl	0x006c656e
 29c:	6c626174 	stfvse	f6, [r2], #-464	; 0xfffffe30
 2a0:	656c0065 	strbvs	r0, [ip, #-101]!	; 0x65
 2a4:	6e695f64 	cdpvs	15, 6, cr5, cr9, cr4, {3}
 2a8:	6b007469 	blvs	1d454 <bss_end+0x1a16c>
 2ac:	656e7265 	strbvs	r7, [lr, #-613]!	; 0x265
 2b0:	656c2f6c 	strbvs	r2, [ip, #-3948]!	; 0xf6c
 2b4:	00632e64 	rsbeq	r2, r3, r4, ror #28
 2b8:	70656562 	rsbvc	r6, r5, r2, ror #10
 2bc:	696e695f 	stmdbvs	lr!, {r0, r1, r2, r3, r4, r6, r8, fp, sp, lr}^
 2c0:	65620074 	strbvs	r0, [r2, #-116]!	; 0x74
 2c4:	725f7065 	subsvc	r7, pc, #101	; 0x65
 2c8:	6c006e75 	stcvs	14, cr6, [r0], {117}	; 0x75
 2cc:	6f5f6465 	svcvs	0x005f6465
 2d0:	6c006666 	stcvs	6, cr6, [r0], {102}	; 0x66
 2d4:	6f5f6465 	svcvs	0x005f6465
 2d8:	656d006e 	strbvs	r0, [sp, #-110]!	; 0x6e
 2dc:	766f6d6d 	strbtvc	r6, [pc], -sp, ror #26
 2e0:	63610065 	cmnvs	r1, #101	; 0x65
 2e4:	74706563 	ldrbtvc	r6, [r0], #-1379	; 0x563
 2e8:	6d656d00 	stclvs	13, cr6, [r5]
 2ec:	00706d63 	rsbseq	r6, r0, r3, ror #26
 2f0:	31707865 	cmncc	r0, r5, ror #16
 2f4:	656d0036 	strbvs	r0, [sp, #-54]!	; 0x36
 2f8:	7465736d 	strbtvc	r7, [r5], #-877	; 0x36d
 2fc:	6d656d00 	stclvs	13, cr6, [r5]
 300:	00726863 	rsbseq	r6, r2, r3, ror #16
 304:	736d656d 	cmnvc	sp, #457179136	; 0x1b400000
 308:	006e6163 	rsbeq	r6, lr, r3, ror #2
 30c:	63727473 	cmnvs	r2, #1929379840	; 0x73000000
 310:	73007268 	movwvc	r7, #616	; 0x268
 314:	656c7274 	strbvs	r7, [ip, #-628]!	; 0x274
 318:	6564006e 	strbvs	r0, [r4, #-110]!	; 0x6e
 31c:	64007473 	strvs	r7, [r0], #-1139	; 0x473
 320:	79616c65 	stmdbvc	r1!, {r0, r2, r5, r6, sl, fp, sp, lr}^
 324:	72747300 	rsbsvc	r7, r4, #0
 328:	00797063 	rsbseq	r7, r9, r3, rrx
 32c:	63727473 	cmnvs	r2, #1929379840	; 0x73000000
 330:	73007461 	movwvc	r7, #1121	; 0x461
 334:	636e7274 	cmnvs	lr, #1073741831	; 0x40000007
 338:	73007970 	movwvc	r7, #2416	; 0x970
 33c:	62707274 	rsbsvs	r7, r0, #1073741831	; 0x40000007
 340:	73006b72 	movwvc	r6, #2930	; 0xb72
 344:	636e7274 	cmnvs	lr, #1073741831	; 0x40000007
 348:	61007461 	tstvs	r0, r1, ror #8
 34c:	00696f74 	rsbeq	r6, r9, r4, ror pc
 350:	63727473 	cmnvs	r2, #1929379840	; 0x73000000
 354:	7300706d 	movwvc	r7, #109	; 0x6d
 358:	6c6e7274 	sfmvs	f7, 2, [lr], #-464	; (stclvs 2, cr7, [lr], #-464)	; 0xfffffe30
 35c:	73006e65 	movwvc	r6, #3685	; 0xe65
 360:	70737274 	rsbsvc	r7, r3, r4, ror r2
 364:	7461006e 	strbtvc	r0, [r1], #-110	; 0x6e
 368:	6300786f 	movwvs	r7, #2159	; 0x86f
 36c:	746e756f 	strbtvc	r7, [lr], #-1391	; 0x56f
 370:	6d656d00 	stclvs	13, cr6, [r5]
 374:	00797063 	rsbseq	r7, r9, r3, rrx
 378:	73727473 	cmnvc	r2, #1929379840	; 0x73000000
 37c:	5f007274 	svcpl	0x00007274
 380:	7365725f 	cmnvc	r5, #-268435451	; 0xf0000005
 384:	72747300 	rsbsvc	r7, r4, #0
 388:	706d636e 	rsbvc	r6, sp, lr, ror #6
 38c:	62696c00 	rsbvs	r6, r9, #0
 390:	62696c2f 	rsbvs	r6, r9, #12032	; 0x2f00
 394:	6500632e 	strvs	r6, [r0, #-814]	; 0x32e
 398:	6d5f646e 	cfldrdvs	mvd6, [pc, #-440]	; 0xfffffe48
 39c:	6d006d65 	stcvs	13, cr6, [r0, #-404]	; 0xfffffe6c
 3a0:	695f6d65 	ldmdbvs	pc, {r0, r2, r5, r6, r8, sl, fp, sp, lr}^
 3a4:	0074696e 	rsbseq	r6, r4, lr, ror #18
 3a8:	48474948 	stmdami	r7, {r3, r6, r8, fp, lr}^
 3ac:	4d454d5f 	stclmi	13, cr4, [r5, #-380]	; 0xfffffe84
 3b0:	0059524f 	subseq	r5, r9, pc, asr #4
 3b4:	5f6d656d 	svcpl	0x006d656d
 3b8:	0070616d 	rsbseq	r6, r0, sp, ror #2
 3bc:	72617473 	rsbvc	r7, r1, #1929379840	; 0x73000000
 3c0:	656d5f74 	strbvs	r5, [sp, #-3956]!	; 0xf74
 3c4:	6d6d006d 	stclvs	0, cr0, [sp, #-436]!	; 0xfffffe4c
 3c8:	6d656d2f 	stclvs	13, cr6, [r5, #-188]!	; 0xffffff44
 3cc:	2e79726f 	cdpcs	2, 7, cr7, cr9, cr15, {3}
 3d0:	70610063 	rsbvc	r0, r1, r3, rrx
 3d4:	61003170 	tstvs	r0, r0, ror r1
 3d8:	00327070 	eorseq	r7, r2, r0, ror r0
 3dc:	2f707061 	svccs	0x00707061
 3e0:	31707061 	cmncc	r0, r1, rrx
 3e4:	Address 0x000003e4 is out of bounds.

