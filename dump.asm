
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
      3c:	eb00017c 	bl	634 <handle_int>

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
      68:	eb00020e 	bl	8a8 <nand_init>
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
     154:	eb000258 	bl	abc <nand_to_ram>
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
     190:	00000670 	andeq	r0, r0, r0, ror r6
     194:	4a000008 	bmi	1bc <create_page_table+0xc>
     198:	4c000014 	stcmi	0, cr0, [r0], {20}
     19c:	4c000004 	stcmi	0, cr0, [r0], {4}
     1a0:	0007f021 	andeq	pc, r7, r1, lsr #32
     1a4:	000032d8 	ldrdeq	r3, [r0], -r8
     1a8:	31010000 	tstcc	r1, r0
     1ac:	000023c8 	andeq	r2, r0, r8, asr #7

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
     2e0:	e59f001c 	ldr	r0, [pc, #28]	; 304 <mmu_init+0x80>
     2e4:	e04b0000 	sub	r0, fp, r0
     2e8:	e1a0b000 	mov	fp, r0
     2ec:	e59f0010 	ldr	r0, [pc, #16]	; 304 <mmu_init+0x80>
     2f0:	e04d0000 	sub	r0, sp, r0
     2f4:	e1a0d000 	mov	sp, r0
     2f8:	e28bd000 	add	sp, fp, #0
     2fc:	e8bd0800 	pop	{fp}
     300:	e12fff1e 	bx	lr
     304:	30008000 	andcc	r8, r0, r0

00000308 <shell_led>:
     308:	e92d4810 	push	{r4, fp, lr}
     30c:	e28db008 	add	fp, sp, #8
     310:	e24dd01c 	sub	sp, sp, #28
     314:	e50b0020 	str	r0, [fp, #-32]
     318:	e50b1024 	str	r1, [fp, #-36]	; 0x24
     31c:	e3a03000 	mov	r3, #0
     320:	e50b3018 	str	r3, [fp, #-24]
     324:	ea00001e 	b	3a4 <shell_led+0x9c>
     328:	e51b3024 	ldr	r3, [fp, #-36]	; 0x24
     32c:	e2832010 	add	r2, r3, #16
     330:	e51b3018 	ldr	r3, [fp, #-24]
     334:	e7d23003 	ldrb	r3, [r2, r3]
     338:	e1a04003 	mov	r4, r3
     33c:	e51b2024 	ldr	r2, [fp, #-36]	; 0x24
     340:	e51b3018 	ldr	r3, [fp, #-24]
     344:	e2833010 	add	r3, r3, #16
     348:	e0823003 	add	r3, r2, r3
     34c:	e1a00003 	mov	r0, r3
     350:	eb0004b5 	bl	162c <atoi>
     354:	e1a03000 	mov	r3, r0
     358:	e59f005c 	ldr	r0, [pc, #92]	; 3bc <shell_led+0xb4>
     35c:	e1a01004 	mov	r1, r4
     360:	e1a02003 	mov	r2, r3
     364:	eb000338 	bl	104c <uprintf>
     368:	e51b2024 	ldr	r2, [fp, #-36]	; 0x24
     36c:	e51b3018 	ldr	r3, [fp, #-24]
     370:	e2833010 	add	r3, r3, #16
     374:	e0823003 	add	r3, r2, r3
     378:	e1a00003 	mov	r0, r3
     37c:	eb0004aa 	bl	162c <atoi>
     380:	e1a03000 	mov	r3, r0
     384:	e3530000 	cmp	r3, #0
     388:	0a000001 	beq	394 <shell_led+0x8c>
     38c:	eb000429 	bl	1438 <led_on>
     390:	ea000000 	b	398 <shell_led+0x90>
     394:	eb000430 	bl	145c <led_off>
     398:	e51b3018 	ldr	r3, [fp, #-24]
     39c:	e2833001 	add	r3, r3, #1
     3a0:	e50b3018 	str	r3, [fp, #-24]
     3a4:	e51b3018 	ldr	r3, [fp, #-24]
     3a8:	e3530003 	cmp	r3, #3
     3ac:	daffffdd 	ble	328 <shell_led+0x20>
     3b0:	e24bd008 	sub	sp, fp, #8
     3b4:	e8bd4810 	pop	{r4, fp, lr}
     3b8:	e12fff1e 	bx	lr
     3bc:	0000233c 	andeq	r2, r0, ip, lsr r3

000003c0 <shell_common>:
     3c0:	e92d4800 	push	{fp, lr}
     3c4:	e28db004 	add	fp, sp, #4
     3c8:	e24dd008 	sub	sp, sp, #8
     3cc:	e50b0008 	str	r0, [fp, #-8]
     3d0:	e50b100c 	str	r1, [fp, #-12]
     3d4:	e51b300c 	ldr	r3, [fp, #-12]
     3d8:	e1a00003 	mov	r0, r3
     3dc:	e59f1038 	ldr	r1, [pc, #56]	; 41c <shell_common+0x5c>
     3e0:	eb000561 	bl	196c <strcmp>
     3e4:	e1a03000 	mov	r3, r0
     3e8:	e3530000 	cmp	r3, #0
     3ec:	1a000003 	bne	400 <shell_common+0x40>
     3f0:	e51b0008 	ldr	r0, [fp, #-8]
     3f4:	e51b100c 	ldr	r1, [fp, #-12]
     3f8:	ebffffc2 	bl	308 <shell_led>
     3fc:	ea000003 	b	410 <shell_common+0x50>
     400:	e51b300c 	ldr	r3, [fp, #-12]
     404:	e59f0014 	ldr	r0, [pc, #20]	; 420 <shell_common+0x60>
     408:	e1a01003 	mov	r1, r3
     40c:	eb00030e 	bl	104c <uprintf>
     410:	e24bd004 	sub	sp, fp, #4
     414:	e8bd4800 	pop	{fp, lr}
     418:	e12fff1e 	bx	lr
     41c:	00002348 	andeq	r2, r0, r8, asr #6
     420:	0000234c 	andeq	r2, r0, ip, asr #6

00000424 <init>:
     424:	e92d4800 	push	{fp, lr}
     428:	e28db004 	add	fp, sp, #4
     42c:	e24dde47 	sub	sp, sp, #1136	; 0x470
     430:	e3a03000 	mov	r3, #0
     434:	e50b3010 	str	r3, [fp, #-16]
     438:	e3a03000 	mov	r3, #0
     43c:	e50b300c 	str	r3, [fp, #-12]
     440:	e3a03000 	mov	r3, #0
     444:	e50b3008 	str	r3, [fp, #-8]
     448:	eb0003ed 	bl	1404 <led_init>
     44c:	eb0001e6 	bl	bec <uart0_init>
     450:	e1a0300f 	mov	r3, pc
     454:	e59f01c8 	ldr	r0, [pc, #456]	; 624 <init+0x200>
     458:	e1a01003 	mov	r1, r3
     45c:	eb0002fa 	bl	104c <uprintf>
     460:	e59f01c0 	ldr	r0, [pc, #448]	; 628 <init+0x204>
     464:	eb0002f8 	bl	104c <uprintf>
     468:	e24b3b01 	sub	r3, fp, #1024	; 0x400
     46c:	e2433004 	sub	r3, r3, #4
     470:	e243300c 	sub	r3, r3, #12
     474:	e1a00003 	mov	r0, r3
     478:	eb00022f 	bl	d3c <ugets>
     47c:	e3a03000 	mov	r3, #0
     480:	e50b3010 	str	r3, [fp, #-16]
     484:	e3a03000 	mov	r3, #0
     488:	e50b300c 	str	r3, [fp, #-12]
     48c:	e3a03000 	mov	r3, #0
     490:	e50b3008 	str	r3, [fp, #-8]
     494:	ea000046 	b	5b4 <init+0x190>
     498:	e51b2010 	ldr	r2, [fp, #-16]
     49c:	e59f3188 	ldr	r3, [pc, #392]	; 62c <init+0x208>
     4a0:	e24b0004 	sub	r0, fp, #4
     4a4:	e0802002 	add	r2, r0, r2
     4a8:	e0823003 	add	r3, r2, r3
     4ac:	e5d33000 	ldrb	r3, [r3]
     4b0:	e3530020 	cmp	r3, #32
     4b4:	0a00001a 	beq	524 <init+0x100>
     4b8:	e51b2010 	ldr	r2, [fp, #-16]
     4bc:	e59f3168 	ldr	r3, [pc, #360]	; 62c <init+0x208>
     4c0:	e24b1004 	sub	r1, fp, #4
     4c4:	e0812002 	add	r2, r1, r2
     4c8:	e0823003 	add	r3, r2, r3
     4cc:	e5d33000 	ldrb	r3, [r3]
     4d0:	e3530009 	cmp	r3, #9
     4d4:	0a000012 	beq	524 <init+0x100>
     4d8:	e51b000c 	ldr	r0, [fp, #-12]
     4dc:	e51b1008 	ldr	r1, [fp, #-8]
     4e0:	e51b2010 	ldr	r2, [fp, #-16]
     4e4:	e59f3140 	ldr	r3, [pc, #320]	; 62c <init+0x208>
     4e8:	e24bc004 	sub	ip, fp, #4
     4ec:	e08c2002 	add	r2, ip, r2
     4f0:	e0823003 	add	r3, r2, r3
     4f4:	e5d32000 	ldrb	r2, [r3]
     4f8:	e59f3130 	ldr	r3, [pc, #304]	; 630 <init+0x20c>
     4fc:	e1a00200 	lsl	r0, r0, #4
     500:	e24bc004 	sub	ip, fp, #4
     504:	e08c0000 	add	r0, ip, r0
     508:	e0801001 	add	r1, r0, r1
     50c:	e0813003 	add	r3, r1, r3
     510:	e5c32000 	strb	r2, [r3]
     514:	e51b3008 	ldr	r3, [fp, #-8]
     518:	e2833001 	add	r3, r3, #1
     51c:	e50b3008 	str	r3, [fp, #-8]
     520:	ea000020 	b	5a8 <init+0x184>
     524:	e51b3010 	ldr	r3, [fp, #-16]
     528:	e2432001 	sub	r2, r3, #1
     52c:	e59f30f8 	ldr	r3, [pc, #248]	; 62c <init+0x208>
     530:	e24b0004 	sub	r0, fp, #4
     534:	e0802002 	add	r2, r0, r2
     538:	e0823003 	add	r3, r2, r3
     53c:	e5d33000 	ldrb	r3, [r3]
     540:	e3530020 	cmp	r3, #32
     544:	0a000017 	beq	5a8 <init+0x184>
     548:	e51b3010 	ldr	r3, [fp, #-16]
     54c:	e2432001 	sub	r2, r3, #1
     550:	e59f30d4 	ldr	r3, [pc, #212]	; 62c <init+0x208>
     554:	e24b1004 	sub	r1, fp, #4
     558:	e0812002 	add	r2, r1, r2
     55c:	e0823003 	add	r3, r2, r3
     560:	e5d33000 	ldrb	r3, [r3]
     564:	e3530009 	cmp	r3, #9
     568:	0a00000e 	beq	5a8 <init+0x184>
     56c:	e51b100c 	ldr	r1, [fp, #-12]
     570:	e51b2008 	ldr	r2, [fp, #-8]
     574:	e59f30b4 	ldr	r3, [pc, #180]	; 630 <init+0x20c>
     578:	e1a01201 	lsl	r1, r1, #4
     57c:	e24bc004 	sub	ip, fp, #4
     580:	e08c1001 	add	r1, ip, r1
     584:	e0812002 	add	r2, r1, r2
     588:	e0823003 	add	r3, r2, r3
     58c:	e3a02000 	mov	r2, #0
     590:	e5c32000 	strb	r2, [r3]
     594:	e51b300c 	ldr	r3, [fp, #-12]
     598:	e2833001 	add	r3, r3, #1
     59c:	e50b300c 	str	r3, [fp, #-12]
     5a0:	e3a03000 	mov	r3, #0
     5a4:	e50b3008 	str	r3, [fp, #-8]
     5a8:	e51b3010 	ldr	r3, [fp, #-16]
     5ac:	e2833001 	add	r3, r3, #1
     5b0:	e50b3010 	str	r3, [fp, #-16]
     5b4:	e51b2010 	ldr	r2, [fp, #-16]
     5b8:	e59f306c 	ldr	r3, [pc, #108]	; 62c <init+0x208>
     5bc:	e24b0004 	sub	r0, fp, #4
     5c0:	e0802002 	add	r2, r0, r2
     5c4:	e0823003 	add	r3, r2, r3
     5c8:	e5d33000 	ldrb	r3, [r3]
     5cc:	e3530000 	cmp	r3, #0
     5d0:	1affffb0 	bne	498 <init+0x74>
     5d4:	e51b100c 	ldr	r1, [fp, #-12]
     5d8:	e51b2008 	ldr	r2, [fp, #-8]
     5dc:	e59f304c 	ldr	r3, [pc, #76]	; 630 <init+0x20c>
     5e0:	e1a01201 	lsl	r1, r1, #4
     5e4:	e24bc004 	sub	ip, fp, #4
     5e8:	e08c1001 	add	r1, ip, r1
     5ec:	e0812002 	add	r2, r1, r2
     5f0:	e0823003 	add	r3, r2, r3
     5f4:	e3a02000 	mov	r2, #0
     5f8:	e5c32000 	strb	r2, [r3]
     5fc:	e51b300c 	ldr	r3, [fp, #-12]
     600:	e2833002 	add	r3, r3, #2
     604:	e50b300c 	str	r3, [fp, #-12]
     608:	e24b3e46 	sub	r3, fp, #1120	; 0x460
     60c:	e2433004 	sub	r3, r3, #4
     610:	e243300c 	sub	r3, r3, #12
     614:	e51b000c 	ldr	r0, [fp, #-12]
     618:	e1a01003 	mov	r1, r3
     61c:	ebffff67 	bl	3c0 <shell_common>
     620:	eaffff8e 	b	460 <init+0x3c>
     624:	00002368 	andeq	r2, r0, r8, ror #6
     628:	00002370 	andeq	r2, r0, r0, ror r3
     62c:	fffffbf4 	undefined instruction 0xfffffbf4
     630:	fffffb94 	undefined instruction 0xfffffb94

00000634 <handle_int>:
     634:	e92d4800 	push	{fp, lr}
     638:	e28db004 	add	fp, sp, #4
     63c:	e59f3020 	ldr	r3, [pc, #32]	; 664 <handle_int+0x30>
     640:	e59f0020 	ldr	r0, [pc, #32]	; 668 <handle_int+0x34>
     644:	e1a0e00f 	mov	lr, pc
     648:	e12fff13 	bx	r3
     64c:	e59f3018 	ldr	r3, [pc, #24]	; 66c <handle_int+0x38>
     650:	e1a0e00f 	mov	lr, pc
     654:	e12fff13 	bx	r3
     658:	e24bd004 	sub	sp, fp, #4
     65c:	e8bd4800 	pop	{fp, lr}
     660:	e12fff1e 	bx	lr
     664:	33f963a4 	mvnscc	r6, #-1879048190	; 0x90000002
     668:	00002388 	andeq	r2, r0, r8, lsl #7
     66c:	30008374 	andcc	r8, r0, r4, ror r3

00000670 <main>:
     670:	e92d4800 	push	{fp, lr}
     674:	e28db004 	add	fp, sp, #4
     678:	e59f30d0 	ldr	r3, [pc, #208]	; 750 <main+0xe0>
     67c:	e3a02641 	mov	r2, #68157440	; 0x4100000
     680:	e5832000 	str	r2, [r3]
     684:	e59f30c4 	ldr	r3, [pc, #196]	; 750 <main+0xe0>
     688:	e5933000 	ldr	r3, [r3]
     68c:	e3c33eff 	bic	r3, r3, #4080	; 0xff0
     690:	e3c3300f 	bic	r3, r3, #15
     694:	e59f20b4 	ldr	r2, [pc, #180]	; 750 <main+0xe0>
     698:	e5823000 	str	r3, [r2]
     69c:	e59f30ac 	ldr	r3, [pc, #172]	; 750 <main+0xe0>
     6a0:	e5933000 	ldr	r3, [r3]
     6a4:	e3530401 	cmp	r3, #16777216	; 0x1000000
     6a8:	da000002 	ble	6b8 <main+0x48>
     6ac:	e59f309c 	ldr	r3, [pc, #156]	; 750 <main+0xe0>
     6b0:	e3a02401 	mov	r2, #16777216	; 0x1000000
     6b4:	e5832000 	str	r2, [r3]
     6b8:	e59f3090 	ldr	r3, [pc, #144]	; 750 <main+0xe0>
     6bc:	e5933000 	ldr	r3, [r3]
     6c0:	e3530503 	cmp	r3, #12582912	; 0xc00000
     6c4:	da000003 	ble	6d8 <main+0x68>
     6c8:	e59f3084 	ldr	r3, [pc, #132]	; 754 <main+0xe4>
     6cc:	e3a02501 	mov	r2, #4194304	; 0x400000
     6d0:	e5832000 	str	r2, [r3]
     6d4:	ea00000a 	b	704 <main+0x94>
     6d8:	e59f3070 	ldr	r3, [pc, #112]	; 750 <main+0xe0>
     6dc:	e5933000 	ldr	r3, [r3]
     6e0:	e3530606 	cmp	r3, #6291456	; 0x600000
     6e4:	da000003 	ble	6f8 <main+0x88>
     6e8:	e59f3064 	ldr	r3, [pc, #100]	; 754 <main+0xe4>
     6ec:	e3a02602 	mov	r2, #2097152	; 0x200000
     6f0:	e5832000 	str	r2, [r3]
     6f4:	ea000002 	b	704 <main+0x94>
     6f8:	e59f3054 	ldr	r3, [pc, #84]	; 754 <main+0xe4>
     6fc:	e3a02601 	mov	r2, #1048576	; 0x100000
     700:	e5832000 	str	r2, [r3]
     704:	e59f3048 	ldr	r3, [pc, #72]	; 754 <main+0xe4>
     708:	e5932000 	ldr	r2, [r3]
     70c:	e59f3044 	ldr	r3, [pc, #68]	; 758 <main+0xe8>
     710:	e5832000 	str	r2, [r3]
     714:	e59f303c 	ldr	r3, [pc, #60]	; 758 <main+0xe8>
     718:	e5932000 	ldr	r2, [r3]
     71c:	e59f302c 	ldr	r3, [pc, #44]	; 750 <main+0xe0>
     720:	e5933000 	ldr	r3, [r3]
     724:	e1a00002 	mov	r0, r2
     728:	e1a01003 	mov	r1, r3
     72c:	eb0006b4 	bl	2204 <mem_init>
     730:	eb000128 	bl	bd8 <trap_init>
     734:	eb000332 	bl	1404 <led_init>
     738:	eb00012b 	bl	bec <uart0_init>
     73c:	e1a0300f 	mov	r3, pc
     740:	e59f0014 	ldr	r0, [pc, #20]	; 75c <main+0xec>
     744:	e1a01003 	mov	r1, r3
     748:	eb00023f 	bl	104c <uprintf>
     74c:	eafffffa 	b	73c <main+0xcc>
     750:	000023c8 	andeq	r2, r0, r8, asr #7
     754:	000023cc 	andeq	r2, r0, ip, asr #7
     758:	000023d0 	ldrdeq	r2, [r0], -r0
     75c:	00002394 	muleq	r0, r4, r3

00000760 <select_chip>:
     760:	e52db004 	push	{fp}		; (str fp, [sp, #-4]!)
     764:	e28db000 	add	fp, sp, #0
     768:	e59f3018 	ldr	r3, [pc, #24]	; 788 <select_chip+0x28>
     76c:	e59f2014 	ldr	r2, [pc, #20]	; 788 <select_chip+0x28>
     770:	e5922000 	ldr	r2, [r2]
     774:	e3c22002 	bic	r2, r2, #2
     778:	e5832000 	str	r2, [r3]
     77c:	e28bd000 	add	sp, fp, #0
     780:	e8bd0800 	pop	{fp}
     784:	e12fff1e 	bx	lr
     788:	4e000004 	cdpmi	0, 0, cr0, cr0, cr4, {0}

0000078c <diselect_chip>:
     78c:	e52db004 	push	{fp}		; (str fp, [sp, #-4]!)
     790:	e28db000 	add	fp, sp, #0
     794:	e59f3018 	ldr	r3, [pc, #24]	; 7b4 <diselect_chip+0x28>
     798:	e59f2014 	ldr	r2, [pc, #20]	; 7b4 <diselect_chip+0x28>
     79c:	e5922000 	ldr	r2, [r2]
     7a0:	e3822002 	orr	r2, r2, #2
     7a4:	e5832000 	str	r2, [r3]
     7a8:	e28bd000 	add	sp, fp, #0
     7ac:	e8bd0800 	pop	{fp}
     7b0:	e12fff1e 	bx	lr
     7b4:	4e000004 	cdpmi	0, 0, cr0, cr0, cr4, {0}

000007b8 <clear_RnB>:
     7b8:	e52db004 	push	{fp}		; (str fp, [sp, #-4]!)
     7bc:	e28db000 	add	fp, sp, #0
     7c0:	e59f3020 	ldr	r3, [pc, #32]	; 7e8 <clear_RnB+0x30>
     7c4:	e59f201c 	ldr	r2, [pc, #28]	; 7e8 <clear_RnB+0x30>
     7c8:	e5d22000 	ldrb	r2, [r2]
     7cc:	e20220ff 	and	r2, r2, #255	; 0xff
     7d0:	e3822004 	orr	r2, r2, #4
     7d4:	e20220ff 	and	r2, r2, #255	; 0xff
     7d8:	e5c32000 	strb	r2, [r3]
     7dc:	e28bd000 	add	sp, fp, #0
     7e0:	e8bd0800 	pop	{fp}
     7e4:	e12fff1e 	bx	lr
     7e8:	4e000020 	cdpmi	0, 0, cr0, cr0, cr0, {1}

000007ec <send_cmmd>:
     7ec:	e52db004 	push	{fp}		; (str fp, [sp, #-4]!)
     7f0:	e28db000 	add	fp, sp, #0
     7f4:	e24dd00c 	sub	sp, sp, #12
     7f8:	e50b0008 	str	r0, [fp, #-8]
     7fc:	e59f3014 	ldr	r3, [pc, #20]	; 818 <send_cmmd+0x2c>
     800:	e51b2008 	ldr	r2, [fp, #-8]
     804:	e20220ff 	and	r2, r2, #255	; 0xff
     808:	e5c32000 	strb	r2, [r3]
     80c:	e28bd000 	add	sp, fp, #0
     810:	e8bd0800 	pop	{fp}
     814:	e12fff1e 	bx	lr
     818:	4e000008 	cdpmi	0, 0, cr0, cr0, cr8, {0}

0000081c <send_addr>:
     81c:	e52db004 	push	{fp}		; (str fp, [sp, #-4]!)
     820:	e28db000 	add	fp, sp, #0
     824:	e24dd00c 	sub	sp, sp, #12
     828:	e50b0008 	str	r0, [fp, #-8]
     82c:	e59f3014 	ldr	r3, [pc, #20]	; 848 <send_addr+0x2c>
     830:	e51b2008 	ldr	r2, [fp, #-8]
     834:	e20220ff 	and	r2, r2, #255	; 0xff
     838:	e5c32000 	strb	r2, [r3]
     83c:	e28bd000 	add	sp, fp, #0
     840:	e8bd0800 	pop	{fp}
     844:	e12fff1e 	bx	lr
     848:	4e00000c 	cdpmi	0, 0, cr0, cr0, cr12, {0}

0000084c <wait_RnB>:
     84c:	e52db004 	push	{fp}		; (str fp, [sp, #-4]!)
     850:	e28db000 	add	fp, sp, #0
     854:	e59f301c 	ldr	r3, [pc, #28]	; 878 <wait_RnB+0x2c>
     858:	e5d33000 	ldrb	r3, [r3]
     85c:	e20330ff 	and	r3, r3, #255	; 0xff
     860:	e2033004 	and	r3, r3, #4
     864:	e3530000 	cmp	r3, #0
     868:	0afffff9 	beq	854 <wait_RnB+0x8>
     86c:	e28bd000 	add	sp, fp, #0
     870:	e8bd0800 	pop	{fp}
     874:	e12fff1e 	bx	lr
     878:	4e000020 	cdpmi	0, 0, cr0, cr0, cr0, {1}

0000087c <nand_reset>:
     87c:	e92d4800 	push	{fp, lr}
     880:	e28db004 	add	fp, sp, #4
     884:	ebffffb5 	bl	760 <select_chip>
     888:	ebffffca 	bl	7b8 <clear_RnB>
     88c:	e3a000ff 	mov	r0, #255	; 0xff
     890:	ebffffd5 	bl	7ec <send_cmmd>
     894:	ebffffec 	bl	84c <wait_RnB>
     898:	ebffffbb 	bl	78c <diselect_chip>
     89c:	e24bd004 	sub	sp, fp, #4
     8a0:	e8bd4800 	pop	{fp, lr}
     8a4:	e12fff1e 	bx	lr

000008a8 <nand_init>:
     8a8:	e92d4800 	push	{fp, lr}
     8ac:	e28db004 	add	fp, sp, #4
     8b0:	e3a0344e 	mov	r3, #1308622848	; 0x4e000000
     8b4:	e59f201c 	ldr	r2, [pc, #28]	; 8d8 <nand_init+0x30>
     8b8:	e5832000 	str	r2, [r3]
     8bc:	e59f3018 	ldr	r3, [pc, #24]	; 8dc <nand_init+0x34>
     8c0:	e3a02003 	mov	r2, #3
     8c4:	e5832000 	str	r2, [r3]
     8c8:	ebffffeb 	bl	87c <nand_reset>
     8cc:	e24bd004 	sub	sp, fp, #4
     8d0:	e8bd4800 	pop	{fp, lr}
     8d4:	e12fff1e 	bx	lr
     8d8:	00001210 	andeq	r1, r0, r0, lsl r2
     8dc:	4e000004 	cdpmi	0, 0, cr0, cr0, cr4, {0}

000008e0 <nand_PageRead>:
     8e0:	e92d4800 	push	{fp, lr}
     8e4:	e28db004 	add	fp, sp, #4
     8e8:	e24dd010 	sub	sp, sp, #16
     8ec:	e50b0010 	str	r0, [fp, #-16]
     8f0:	e50b1014 	str	r1, [fp, #-20]
     8f4:	e3a03000 	mov	r3, #0
     8f8:	e50b3008 	str	r3, [fp, #-8]
     8fc:	ebffff97 	bl	760 <select_chip>
     900:	ebffffac 	bl	7b8 <clear_RnB>
     904:	e3a00000 	mov	r0, #0
     908:	ebffffb7 	bl	7ec <send_cmmd>
     90c:	e3a00000 	mov	r0, #0
     910:	ebffffc1 	bl	81c <send_addr>
     914:	e3a00000 	mov	r0, #0
     918:	ebffffbf 	bl	81c <send_addr>
     91c:	e51b3010 	ldr	r3, [fp, #-16]
     920:	e20330ff 	and	r3, r3, #255	; 0xff
     924:	e1a00003 	mov	r0, r3
     928:	ebffffbb 	bl	81c <send_addr>
     92c:	e51b3010 	ldr	r3, [fp, #-16]
     930:	e1a03423 	lsr	r3, r3, #8
     934:	e20330ff 	and	r3, r3, #255	; 0xff
     938:	e1a00003 	mov	r0, r3
     93c:	ebffffb6 	bl	81c <send_addr>
     940:	e51b3010 	ldr	r3, [fp, #-16]
     944:	e1a03823 	lsr	r3, r3, #16
     948:	e20330ff 	and	r3, r3, #255	; 0xff
     94c:	e1a00003 	mov	r0, r3
     950:	ebffffb1 	bl	81c <send_addr>
     954:	e3a00030 	mov	r0, #48	; 0x30
     958:	ebffffa3 	bl	7ec <send_cmmd>
     95c:	ebffffba 	bl	84c <wait_RnB>
     960:	e3a03000 	mov	r3, #0
     964:	e50b3008 	str	r3, [fp, #-8]
     968:	ea000009 	b	994 <nand_PageRead+0xb4>
     96c:	e51b3008 	ldr	r3, [fp, #-8]
     970:	e51b2014 	ldr	r2, [fp, #-20]
     974:	e0823003 	add	r3, r2, r3
     978:	e59f2034 	ldr	r2, [pc, #52]	; 9b4 <nand_PageRead+0xd4>
     97c:	e5d22000 	ldrb	r2, [r2]
     980:	e20220ff 	and	r2, r2, #255	; 0xff
     984:	e5c32000 	strb	r2, [r3]
     988:	e51b3008 	ldr	r3, [fp, #-8]
     98c:	e2833001 	add	r3, r3, #1
     990:	e50b3008 	str	r3, [fp, #-8]
     994:	e51b2008 	ldr	r2, [fp, #-8]
     998:	e59f3018 	ldr	r3, [pc, #24]	; 9b8 <nand_PageRead+0xd8>
     99c:	e1520003 	cmp	r2, r3
     9a0:	dafffff1 	ble	96c <nand_PageRead+0x8c>
     9a4:	ebffff78 	bl	78c <diselect_chip>
     9a8:	e24bd004 	sub	sp, fp, #4
     9ac:	e8bd4800 	pop	{fp, lr}
     9b0:	e12fff1e 	bx	lr
     9b4:	4e000010 	mcrmi	0, 0, r0, cr0, cr0, {0}
     9b8:	000007ff 	strdeq	r0, [r0], -pc

000009bc <nand_PageWrite>:
     9bc:	e92d4800 	push	{fp, lr}
     9c0:	e28db004 	add	fp, sp, #4
     9c4:	e24dd010 	sub	sp, sp, #16
     9c8:	e50b0010 	str	r0, [fp, #-16]
     9cc:	e50b1014 	str	r1, [fp, #-20]
     9d0:	e3a03000 	mov	r3, #0
     9d4:	e50b300c 	str	r3, [fp, #-12]
     9d8:	e3a03000 	mov	r3, #0
     9dc:	e50b3008 	str	r3, [fp, #-8]
     9e0:	ebffff5e 	bl	760 <select_chip>
     9e4:	ebffff73 	bl	7b8 <clear_RnB>
     9e8:	e3a00080 	mov	r0, #128	; 0x80
     9ec:	ebffff7e 	bl	7ec <send_cmmd>
     9f0:	e3a00000 	mov	r0, #0
     9f4:	ebffff88 	bl	81c <send_addr>
     9f8:	e3a00000 	mov	r0, #0
     9fc:	ebffff86 	bl	81c <send_addr>
     a00:	e51b3010 	ldr	r3, [fp, #-16]
     a04:	e20330ff 	and	r3, r3, #255	; 0xff
     a08:	e1a00003 	mov	r0, r3
     a0c:	ebffff82 	bl	81c <send_addr>
     a10:	e51b3010 	ldr	r3, [fp, #-16]
     a14:	e1a03423 	lsr	r3, r3, #8
     a18:	e20330ff 	and	r3, r3, #255	; 0xff
     a1c:	e1a00003 	mov	r0, r3
     a20:	ebffff7d 	bl	81c <send_addr>
     a24:	e51b3010 	ldr	r3, [fp, #-16]
     a28:	e1a03823 	lsr	r3, r3, #16
     a2c:	e20330ff 	and	r3, r3, #255	; 0xff
     a30:	e1a00003 	mov	r0, r3
     a34:	ebffff78 	bl	81c <send_addr>
     a38:	e3a03000 	mov	r3, #0
     a3c:	e50b300c 	str	r3, [fp, #-12]
     a40:	ea000008 	b	a68 <nand_PageWrite+0xac>
     a44:	e59f3068 	ldr	r3, [pc, #104]	; ab4 <nand_PageWrite+0xf8>
     a48:	e51b200c 	ldr	r2, [fp, #-12]
     a4c:	e51b1014 	ldr	r1, [fp, #-20]
     a50:	e0812002 	add	r2, r1, r2
     a54:	e5d22000 	ldrb	r2, [r2]
     a58:	e5c32000 	strb	r2, [r3]
     a5c:	e51b300c 	ldr	r3, [fp, #-12]
     a60:	e2833001 	add	r3, r3, #1
     a64:	e50b300c 	str	r3, [fp, #-12]
     a68:	e51b200c 	ldr	r2, [fp, #-12]
     a6c:	e59f3044 	ldr	r3, [pc, #68]	; ab8 <nand_PageWrite+0xfc>
     a70:	e1520003 	cmp	r2, r3
     a74:	dafffff2 	ble	a44 <nand_PageWrite+0x88>
     a78:	e3a00010 	mov	r0, #16
     a7c:	ebffff5a 	bl	7ec <send_cmmd>
     a80:	ebffff71 	bl	84c <wait_RnB>
     a84:	e3a00070 	mov	r0, #112	; 0x70
     a88:	ebffff57 	bl	7ec <send_cmmd>
     a8c:	e59f3020 	ldr	r3, [pc, #32]	; ab4 <nand_PageWrite+0xf8>
     a90:	e5d33000 	ldrb	r3, [r3]
     a94:	e20330ff 	and	r3, r3, #255	; 0xff
     a98:	e50b3008 	str	r3, [fp, #-8]
     a9c:	ebffff3a 	bl	78c <diselect_chip>
     aa0:	e51b3008 	ldr	r3, [fp, #-8]
     aa4:	e1a00003 	mov	r0, r3
     aa8:	e24bd004 	sub	sp, fp, #4
     aac:	e8bd4800 	pop	{fp, lr}
     ab0:	e12fff1e 	bx	lr
     ab4:	4e000010 	mcrmi	0, 0, r0, cr0, cr0, {0}
     ab8:	000007ff 	strdeq	r0, [r0], -pc

00000abc <nand_to_ram>:
     abc:	e92d4800 	push	{fp, lr}
     ac0:	e28db004 	add	fp, sp, #4
     ac4:	e24dd018 	sub	sp, sp, #24
     ac8:	e50b0010 	str	r0, [fp, #-16]
     acc:	e50b1014 	str	r1, [fp, #-20]
     ad0:	e50b2018 	str	r2, [fp, #-24]
     ad4:	e3a03000 	mov	r3, #0
     ad8:	e50b3008 	str	r3, [fp, #-8]
     adc:	e51b3010 	ldr	r3, [fp, #-16]
     ae0:	e1a035a3 	lsr	r3, r3, #11
     ae4:	e50b3008 	str	r3, [fp, #-8]
     ae8:	ea00000c 	b	b20 <nand_to_ram+0x64>
     aec:	e51b3008 	ldr	r3, [fp, #-8]
     af0:	e1a00003 	mov	r0, r3
     af4:	e51b1014 	ldr	r1, [fp, #-20]
     af8:	ebffff78 	bl	8e0 <nand_PageRead>
     afc:	e51b3018 	ldr	r3, [fp, #-24]
     b00:	e2433b02 	sub	r3, r3, #2048	; 0x800
     b04:	e50b3018 	str	r3, [fp, #-24]
     b08:	e51b3014 	ldr	r3, [fp, #-20]
     b0c:	e2833b02 	add	r3, r3, #2048	; 0x800
     b10:	e50b3014 	str	r3, [fp, #-20]
     b14:	e51b3008 	ldr	r3, [fp, #-8]
     b18:	e2833001 	add	r3, r3, #1
     b1c:	e50b3008 	str	r3, [fp, #-8]
     b20:	e51b3018 	ldr	r3, [fp, #-24]
     b24:	e3530000 	cmp	r3, #0
     b28:	caffffef 	bgt	aec <nand_to_ram+0x30>
     b2c:	e24bd004 	sub	sp, fp, #4
     b30:	e8bd4800 	pop	{fp, lr}
     b34:	e12fff1e 	bx	lr

00000b38 <nand_erase>:
     b38:	e92d4800 	push	{fp, lr}
     b3c:	e28db004 	add	fp, sp, #4
     b40:	e24dd010 	sub	sp, sp, #16
     b44:	e50b0010 	str	r0, [fp, #-16]
     b48:	e3a03000 	mov	r3, #0
     b4c:	e50b3008 	str	r3, [fp, #-8]
     b50:	ebffff02 	bl	760 <select_chip>
     b54:	ebffff17 	bl	7b8 <clear_RnB>
     b58:	e3a0003c 	mov	r0, #60	; 0x3c
     b5c:	ebffff22 	bl	7ec <send_cmmd>
     b60:	e51b3010 	ldr	r3, [fp, #-16]
     b64:	e20330ff 	and	r3, r3, #255	; 0xff
     b68:	e1a00003 	mov	r0, r3
     b6c:	ebffff2a 	bl	81c <send_addr>
     b70:	e51b3010 	ldr	r3, [fp, #-16]
     b74:	e1a03423 	lsr	r3, r3, #8
     b78:	e20330ff 	and	r3, r3, #255	; 0xff
     b7c:	e1a00003 	mov	r0, r3
     b80:	ebffff25 	bl	81c <send_addr>
     b84:	e51b3010 	ldr	r3, [fp, #-16]
     b88:	e1a03823 	lsr	r3, r3, #16
     b8c:	e20330ff 	and	r3, r3, #255	; 0xff
     b90:	e1a00003 	mov	r0, r3
     b94:	ebffff20 	bl	81c <send_addr>
     b98:	e3a000d0 	mov	r0, #208	; 0xd0
     b9c:	ebffff12 	bl	7ec <send_cmmd>
     ba0:	ebffff29 	bl	84c <wait_RnB>
     ba4:	e3a00070 	mov	r0, #112	; 0x70
     ba8:	ebffff0f 	bl	7ec <send_cmmd>
     bac:	e59f3020 	ldr	r3, [pc, #32]	; bd4 <nand_erase+0x9c>
     bb0:	e5d33000 	ldrb	r3, [r3]
     bb4:	e20330ff 	and	r3, r3, #255	; 0xff
     bb8:	e50b3008 	str	r3, [fp, #-8]
     bbc:	ebfffef2 	bl	78c <diselect_chip>
     bc0:	e51b3008 	ldr	r3, [fp, #-8]
     bc4:	e1a00003 	mov	r0, r3
     bc8:	e24bd004 	sub	sp, fp, #4
     bcc:	e8bd4800 	pop	{fp, lr}
     bd0:	e12fff1e 	bx	lr
     bd4:	4e000010 	mcrmi	0, 0, r0, cr0, cr0, {0}

00000bd8 <trap_init>:
     bd8:	e52db004 	push	{fp}		; (str fp, [sp, #-4]!)
     bdc:	e28db000 	add	fp, sp, #0
     be0:	e28bd000 	add	sp, fp, #0
     be4:	e8bd0800 	pop	{fp}
     be8:	e12fff1e 	bx	lr

00000bec <uart0_init>:
     bec:	e52db004 	push	{fp}		; (str fp, [sp, #-4]!)
     bf0:	e28db000 	add	fp, sp, #0
     bf4:	e59f3060 	ldr	r3, [pc, #96]	; c5c <uart0_init+0x70>
     bf8:	e59f205c 	ldr	r2, [pc, #92]	; c5c <uart0_init+0x70>
     bfc:	e5922000 	ldr	r2, [r2]
     c00:	e38220a0 	orr	r2, r2, #160	; 0xa0
     c04:	e5832000 	str	r2, [r3]
     c08:	e59f3050 	ldr	r3, [pc, #80]	; c60 <uart0_init+0x74>
     c0c:	e3a0200c 	mov	r2, #12
     c10:	e5832000 	str	r2, [r3]
     c14:	e3a03205 	mov	r3, #1342177280	; 0x50000000
     c18:	e3a02003 	mov	r2, #3
     c1c:	e5832000 	str	r2, [r3]
     c20:	e3a03245 	mov	r3, #1342177284	; 0x50000004
     c24:	e3a02005 	mov	r2, #5
     c28:	e5832000 	str	r2, [r3]
     c2c:	e3a03285 	mov	r3, #1342177288	; 0x50000008
     c30:	e3a02000 	mov	r2, #0
     c34:	e5832000 	str	r2, [r3]
     c38:	e3a032c5 	mov	r3, #1342177292	; 0x5000000c
     c3c:	e3a02000 	mov	r2, #0
     c40:	e5832000 	str	r2, [r3]
     c44:	e59f3018 	ldr	r3, [pc, #24]	; c64 <uart0_init+0x78>
     c48:	e3a0201a 	mov	r2, #26
     c4c:	e5832000 	str	r2, [r3]
     c50:	e28bd000 	add	sp, fp, #0
     c54:	e8bd0800 	pop	{fp}
     c58:	e12fff1e 	bx	lr
     c5c:	56000070 	undefined instruction 0x56000070
     c60:	56000078 	undefined instruction 0x56000078
     c64:	50000028 	andpl	r0, r0, r8, lsr #32

00000c68 <putc>:
     c68:	e52db004 	push	{fp}		; (str fp, [sp, #-4]!)
     c6c:	e28db000 	add	fp, sp, #0
     c70:	e24dd00c 	sub	sp, sp, #12
     c74:	e1a03000 	mov	r3, r0
     c78:	e54b3005 	strb	r3, [fp, #-5]
     c7c:	e59f3024 	ldr	r3, [pc, #36]	; ca8 <putc+0x40>
     c80:	e5933000 	ldr	r3, [r3]
     c84:	e2033004 	and	r3, r3, #4
     c88:	e3530000 	cmp	r3, #0
     c8c:	0afffffa 	beq	c7c <putc+0x14>
     c90:	e59f3014 	ldr	r3, [pc, #20]	; cac <putc+0x44>
     c94:	e55b2005 	ldrb	r2, [fp, #-5]
     c98:	e5c32000 	strb	r2, [r3]
     c9c:	e28bd000 	add	sp, fp, #0
     ca0:	e8bd0800 	pop	{fp}
     ca4:	e12fff1e 	bx	lr
     ca8:	50000010 	andpl	r0, r0, r0, lsl r0
     cac:	50000020 	andpl	r0, r0, r0, lsr #32

00000cb0 <getc>:
     cb0:	e52db004 	push	{fp}		; (str fp, [sp, #-4]!)
     cb4:	e28db000 	add	fp, sp, #0
     cb8:	e59f3028 	ldr	r3, [pc, #40]	; ce8 <getc+0x38>
     cbc:	e5933000 	ldr	r3, [r3]
     cc0:	e2033001 	and	r3, r3, #1
     cc4:	e3530000 	cmp	r3, #0
     cc8:	0afffffa 	beq	cb8 <getc+0x8>
     ccc:	e59f3018 	ldr	r3, [pc, #24]	; cec <getc+0x3c>
     cd0:	e5d33000 	ldrb	r3, [r3]
     cd4:	e20330ff 	and	r3, r3, #255	; 0xff
     cd8:	e1a00003 	mov	r0, r3
     cdc:	e28bd000 	add	sp, fp, #0
     ce0:	e8bd0800 	pop	{fp}
     ce4:	e12fff1e 	bx	lr
     ce8:	50000010 	andpl	r0, r0, r0, lsl r0
     cec:	50000024 	andpl	r0, r0, r4, lsr #32

00000cf0 <uputs>:
     cf0:	e92d4800 	push	{fp, lr}
     cf4:	e28db004 	add	fp, sp, #4
     cf8:	e24dd008 	sub	sp, sp, #8
     cfc:	e50b0008 	str	r0, [fp, #-8]
     d00:	ea000006 	b	d20 <uputs+0x30>
     d04:	e51b3008 	ldr	r3, [fp, #-8]
     d08:	e5d33000 	ldrb	r3, [r3]
     d0c:	e1a00003 	mov	r0, r3
     d10:	ebffffd4 	bl	c68 <putc>
     d14:	e51b3008 	ldr	r3, [fp, #-8]
     d18:	e2833001 	add	r3, r3, #1
     d1c:	e50b3008 	str	r3, [fp, #-8]
     d20:	e51b3008 	ldr	r3, [fp, #-8]
     d24:	e5d33000 	ldrb	r3, [r3]
     d28:	e3530000 	cmp	r3, #0
     d2c:	1afffff4 	bne	d04 <uputs+0x14>
     d30:	e24bd004 	sub	sp, fp, #4
     d34:	e8bd4800 	pop	{fp, lr}
     d38:	e12fff1e 	bx	lr

00000d3c <ugets>:
     d3c:	e92d4800 	push	{fp, lr}
     d40:	e28db004 	add	fp, sp, #4
     d44:	e24dd010 	sub	sp, sp, #16
     d48:	e50b0010 	str	r0, [fp, #-16]
     d4c:	e51b3010 	ldr	r3, [fp, #-16]
     d50:	e50b300c 	str	r3, [fp, #-12]
     d54:	ea000009 	b	d80 <ugets+0x44>
     d58:	e51b3010 	ldr	r3, [fp, #-16]
     d5c:	e55b2005 	ldrb	r2, [fp, #-5]
     d60:	e5c32000 	strb	r2, [r3]
     d64:	e51b3010 	ldr	r3, [fp, #-16]
     d68:	e5d33000 	ldrb	r3, [r3]
     d6c:	e1a00003 	mov	r0, r3
     d70:	ebffffbc 	bl	c68 <putc>
     d74:	e51b3010 	ldr	r3, [fp, #-16]
     d78:	e2833001 	add	r3, r3, #1
     d7c:	e50b3010 	str	r3, [fp, #-16]
     d80:	ebffffca 	bl	cb0 <getc>
     d84:	e1a03000 	mov	r3, r0
     d88:	e54b3005 	strb	r3, [fp, #-5]
     d8c:	e55b3005 	ldrb	r3, [fp, #-5]
     d90:	e353000d 	cmp	r3, #13
     d94:	1affffef 	bne	d58 <ugets+0x1c>
     d98:	e51b3010 	ldr	r3, [fp, #-16]
     d9c:	e3a02000 	mov	r2, #0
     da0:	e5c32000 	strb	r2, [r3]
     da4:	e3a0000d 	mov	r0, #13
     da8:	ebffffae 	bl	c68 <putc>
     dac:	e3a0000a 	mov	r0, #10
     db0:	ebffffac 	bl	c68 <putc>
     db4:	e51b300c 	ldr	r3, [fp, #-12]
     db8:	e1a00003 	mov	r0, r3
     dbc:	e24bd004 	sub	sp, fp, #4
     dc0:	e8bd4800 	pop	{fp, lr}
     dc4:	e12fff1e 	bx	lr

00000dc8 <itoa>:
     dc8:	e92d4800 	push	{fp, lr}
     dcc:	e28db004 	add	fp, sp, #4
     dd0:	e24dd010 	sub	sp, sp, #16
     dd4:	e50b0010 	str	r0, [fp, #-16]
     dd8:	e50b1014 	str	r1, [fp, #-20]
     ddc:	e51b3010 	ldr	r3, [fp, #-16]
     de0:	e3530009 	cmp	r3, #9
     de4:	ca00000a 	bgt	e14 <itoa+0x4c>
     de8:	e51b3010 	ldr	r3, [fp, #-16]
     dec:	e20330ff 	and	r3, r3, #255	; 0xff
     df0:	e2833030 	add	r3, r3, #48	; 0x30
     df4:	e20320ff 	and	r2, r3, #255	; 0xff
     df8:	e51b3014 	ldr	r3, [fp, #-20]
     dfc:	e5c32000 	strb	r2, [r3]
     e00:	e51b3014 	ldr	r3, [fp, #-20]
     e04:	e2833001 	add	r3, r3, #1
     e08:	e3a02000 	mov	r2, #0
     e0c:	e5c32000 	strb	r2, [r3]
     e10:	ea00002c 	b	ec8 <itoa+0x100>
     e14:	e51b3010 	ldr	r3, [fp, #-16]
     e18:	e59f10b4 	ldr	r1, [pc, #180]	; ed4 <itoa+0x10c>
     e1c:	e0c20391 	smull	r0, r2, r1, r3
     e20:	e1a02142 	asr	r2, r2, #2
     e24:	e1a03fc3 	asr	r3, r3, #31
     e28:	e0633002 	rsb	r3, r3, r2
     e2c:	e1a00003 	mov	r0, r3
     e30:	e51b1014 	ldr	r1, [fp, #-20]
     e34:	ebffffe3 	bl	dc8 <itoa>
     e38:	e3a03000 	mov	r3, #0
     e3c:	e50b3008 	str	r3, [fp, #-8]
     e40:	ea000002 	b	e50 <itoa+0x88>
     e44:	e51b3008 	ldr	r3, [fp, #-8]
     e48:	e2833001 	add	r3, r3, #1
     e4c:	e50b3008 	str	r3, [fp, #-8]
     e50:	e51b3008 	ldr	r3, [fp, #-8]
     e54:	e51b2014 	ldr	r2, [fp, #-20]
     e58:	e0823003 	add	r3, r2, r3
     e5c:	e5d33000 	ldrb	r3, [r3]
     e60:	e3530000 	cmp	r3, #0
     e64:	1afffff6 	bne	e44 <itoa+0x7c>
     e68:	e51b3008 	ldr	r3, [fp, #-8]
     e6c:	e51b2014 	ldr	r2, [fp, #-20]
     e70:	e0820003 	add	r0, r2, r3
     e74:	e51b1010 	ldr	r1, [fp, #-16]
     e78:	e59f2054 	ldr	r2, [pc, #84]	; ed4 <itoa+0x10c>
     e7c:	e0c3c192 	smull	ip, r3, r2, r1
     e80:	e1a02143 	asr	r2, r3, #2
     e84:	e1a03fc1 	asr	r3, r1, #31
     e88:	e0632002 	rsb	r2, r3, r2
     e8c:	e1a03002 	mov	r3, r2
     e90:	e1a03103 	lsl	r3, r3, #2
     e94:	e0833002 	add	r3, r3, r2
     e98:	e1a03083 	lsl	r3, r3, #1
     e9c:	e0632001 	rsb	r2, r3, r1
     ea0:	e20230ff 	and	r3, r2, #255	; 0xff
     ea4:	e2833030 	add	r3, r3, #48	; 0x30
     ea8:	e20330ff 	and	r3, r3, #255	; 0xff
     eac:	e5c03000 	strb	r3, [r0]
     eb0:	e51b3008 	ldr	r3, [fp, #-8]
     eb4:	e2833001 	add	r3, r3, #1
     eb8:	e51b2014 	ldr	r2, [fp, #-20]
     ebc:	e0823003 	add	r3, r2, r3
     ec0:	e3a02000 	mov	r2, #0
     ec4:	e5c32000 	strb	r2, [r3]
     ec8:	e24bd004 	sub	sp, fp, #4
     ecc:	e8bd4800 	pop	{fp, lr}
     ed0:	e12fff1e 	bx	lr
     ed4:	66666667 	strbtvs	r6, [r6], -r7, ror #12

00000ed8 <xtoa>:
     ed8:	e92d4800 	push	{fp, lr}
     edc:	e28db004 	add	fp, sp, #4
     ee0:	e24dd010 	sub	sp, sp, #16
     ee4:	e50b0010 	str	r0, [fp, #-16]
     ee8:	e50b1014 	str	r1, [fp, #-20]
     eec:	e51b3010 	ldr	r3, [fp, #-16]
     ef0:	e353000f 	cmp	r3, #15
     ef4:	ca000014 	bgt	f4c <xtoa+0x74>
     ef8:	e51b3010 	ldr	r3, [fp, #-16]
     efc:	e3530009 	cmp	r3, #9
     f00:	ca000006 	bgt	f20 <xtoa+0x48>
     f04:	e51b3010 	ldr	r3, [fp, #-16]
     f08:	e20330ff 	and	r3, r3, #255	; 0xff
     f0c:	e2833030 	add	r3, r3, #48	; 0x30
     f10:	e20320ff 	and	r2, r3, #255	; 0xff
     f14:	e51b3014 	ldr	r3, [fp, #-20]
     f18:	e5c32000 	strb	r2, [r3]
     f1c:	ea000005 	b	f38 <xtoa+0x60>
     f20:	e51b3010 	ldr	r3, [fp, #-16]
     f24:	e20330ff 	and	r3, r3, #255	; 0xff
     f28:	e2833057 	add	r3, r3, #87	; 0x57
     f2c:	e20320ff 	and	r2, r3, #255	; 0xff
     f30:	e51b3014 	ldr	r3, [fp, #-20]
     f34:	e5c32000 	strb	r2, [r3]
     f38:	e51b3014 	ldr	r3, [fp, #-20]
     f3c:	e2833001 	add	r3, r3, #1
     f40:	e3a02000 	mov	r2, #0
     f44:	e5c32000 	strb	r2, [r3]
     f48:	ea00003c 	b	1040 <xtoa+0x168>
     f4c:	e51b3010 	ldr	r3, [fp, #-16]
     f50:	e283200f 	add	r2, r3, #15
     f54:	e3530000 	cmp	r3, #0
     f58:	b1a03002 	movlt	r3, r2
     f5c:	e1a03243 	asr	r3, r3, #4
     f60:	e1a00003 	mov	r0, r3
     f64:	e51b1014 	ldr	r1, [fp, #-20]
     f68:	ebffffda 	bl	ed8 <xtoa>
     f6c:	e3a03000 	mov	r3, #0
     f70:	e50b3008 	str	r3, [fp, #-8]
     f74:	ea000002 	b	f84 <xtoa+0xac>
     f78:	e51b3008 	ldr	r3, [fp, #-8]
     f7c:	e2833001 	add	r3, r3, #1
     f80:	e50b3008 	str	r3, [fp, #-8]
     f84:	e51b3008 	ldr	r3, [fp, #-8]
     f88:	e51b2014 	ldr	r2, [fp, #-20]
     f8c:	e0823003 	add	r3, r2, r3
     f90:	e5d33000 	ldrb	r3, [r3]
     f94:	e3530000 	cmp	r3, #0
     f98:	1afffff6 	bne	f78 <xtoa+0xa0>
     f9c:	e51b2010 	ldr	r2, [fp, #-16]
     fa0:	e1a03fc2 	asr	r3, r2, #31
     fa4:	e1a03e23 	lsr	r3, r3, #28
     fa8:	e0822003 	add	r2, r2, r3
     fac:	e202200f 	and	r2, r2, #15
     fb0:	e0633002 	rsb	r3, r3, r2
     fb4:	e3530009 	cmp	r3, #9
     fb8:	ca00000d 	bgt	ff4 <xtoa+0x11c>
     fbc:	e51b3008 	ldr	r3, [fp, #-8]
     fc0:	e51b2014 	ldr	r2, [fp, #-20]
     fc4:	e0821003 	add	r1, r2, r3
     fc8:	e51b2010 	ldr	r2, [fp, #-16]
     fcc:	e1a03fc2 	asr	r3, r2, #31
     fd0:	e1a03e23 	lsr	r3, r3, #28
     fd4:	e0822003 	add	r2, r2, r3
     fd8:	e202200f 	and	r2, r2, #15
     fdc:	e0633002 	rsb	r3, r3, r2
     fe0:	e20330ff 	and	r3, r3, #255	; 0xff
     fe4:	e2833030 	add	r3, r3, #48	; 0x30
     fe8:	e20330ff 	and	r3, r3, #255	; 0xff
     fec:	e5c13000 	strb	r3, [r1]
     ff0:	ea00000c 	b	1028 <xtoa+0x150>
     ff4:	e51b3008 	ldr	r3, [fp, #-8]
     ff8:	e51b2014 	ldr	r2, [fp, #-20]
     ffc:	e0821003 	add	r1, r2, r3
    1000:	e51b2010 	ldr	r2, [fp, #-16]
    1004:	e1a03fc2 	asr	r3, r2, #31
    1008:	e1a03e23 	lsr	r3, r3, #28
    100c:	e0822003 	add	r2, r2, r3
    1010:	e202200f 	and	r2, r2, #15
    1014:	e0633002 	rsb	r3, r3, r2
    1018:	e20330ff 	and	r3, r3, #255	; 0xff
    101c:	e2833057 	add	r3, r3, #87	; 0x57
    1020:	e20330ff 	and	r3, r3, #255	; 0xff
    1024:	e5c13000 	strb	r3, [r1]
    1028:	e51b3008 	ldr	r3, [fp, #-8]
    102c:	e2833001 	add	r3, r3, #1
    1030:	e51b2014 	ldr	r2, [fp, #-20]
    1034:	e0823003 	add	r3, r2, r3
    1038:	e3a02000 	mov	r2, #0
    103c:	e5c32000 	strb	r2, [r3]
    1040:	e24bd004 	sub	sp, fp, #4
    1044:	e8bd4800 	pop	{fp, lr}
    1048:	e12fff1e 	bx	lr

0000104c <uprintf>:
    104c:	e92d000f 	push	{r0, r1, r2, r3}
    1050:	e92d4800 	push	{fp, lr}
    1054:	e28db004 	add	fp, sp, #4
    1058:	e24dd030 	sub	sp, sp, #48	; 0x30
    105c:	e28b3008 	add	r3, fp, #8
    1060:	e50b3014 	str	r3, [fp, #-20]
    1064:	ea000065 	b	1200 <uprintf+0x1b4>
    1068:	e59b3004 	ldr	r3, [fp, #4]
    106c:	e5d33000 	ldrb	r3, [r3]
    1070:	e3530025 	cmp	r3, #37	; 0x25
    1074:	1a000052 	bne	11c4 <uprintf+0x178>
    1078:	e59b3004 	ldr	r3, [fp, #4]
    107c:	e2833001 	add	r3, r3, #1
    1080:	e58b3004 	str	r3, [fp, #4]
    1084:	e59b3004 	ldr	r3, [fp, #4]
    1088:	e5d33000 	ldrb	r3, [r3]
    108c:	e2433063 	sub	r3, r3, #99	; 0x63
    1090:	e3530015 	cmp	r3, #21
    1094:	979ff103 	ldrls	pc, [pc, r3, lsl #2]
    1098:	ea000054 	b	11f0 <uprintf+0x1a4>
    109c:	000010f4 	strdeq	r1, [r0], -r4
    10a0:	00001138 	andeq	r1, r0, r8, lsr r1
    10a4:	000011f0 	strdeq	r1, [r0], -r0
    10a8:	000011f0 	strdeq	r1, [r0], -r0
    10ac:	000011f0 	strdeq	r1, [r0], -r0
    10b0:	000011f0 	strdeq	r1, [r0], -r0
    10b4:	000011f0 	strdeq	r1, [r0], -r0
    10b8:	000011f0 	strdeq	r1, [r0], -r0
    10bc:	000011f0 	strdeq	r1, [r0], -r0
    10c0:	000011f0 	strdeq	r1, [r0], -r0
    10c4:	000011f0 	strdeq	r1, [r0], -r0
    10c8:	000011f0 	strdeq	r1, [r0], -r0
    10cc:	000011f0 	strdeq	r1, [r0], -r0
    10d0:	000011f0 	strdeq	r1, [r0], -r0
    10d4:	000011f0 	strdeq	r1, [r0], -r0
    10d8:	000011f0 	strdeq	r1, [r0], -r0
    10dc:	00001118 	andeq	r1, r0, r8, lsl r1
    10e0:	000011f0 	strdeq	r1, [r0], -r0
    10e4:	000011f0 	strdeq	r1, [r0], -r0
    10e8:	000011f0 	strdeq	r1, [r0], -r0
    10ec:	000011f0 	strdeq	r1, [r0], -r0
    10f0:	00001190 	muleq	r0, r0, r1
    10f4:	e51b3014 	ldr	r3, [fp, #-20]
    10f8:	e2832004 	add	r2, r3, #4
    10fc:	e50b2014 	str	r2, [fp, #-20]
    1100:	e5933000 	ldr	r3, [r3]
    1104:	e54b300d 	strb	r3, [fp, #-13]
    1108:	e55b300d 	ldrb	r3, [fp, #-13]
    110c:	e1a00003 	mov	r0, r3
    1110:	ebfffed4 	bl	c68 <putc>
    1114:	ea000036 	b	11f4 <uprintf+0x1a8>
    1118:	e51b3014 	ldr	r3, [fp, #-20]
    111c:	e2832004 	add	r2, r3, #4
    1120:	e50b2014 	str	r2, [fp, #-20]
    1124:	e5933000 	ldr	r3, [r3]
    1128:	e50b3008 	str	r3, [fp, #-8]
    112c:	e51b0008 	ldr	r0, [fp, #-8]
    1130:	ebfffeee 	bl	cf0 <uputs>
    1134:	ea00002e 	b	11f4 <uprintf+0x1a8>
    1138:	e51b3014 	ldr	r3, [fp, #-20]
    113c:	e2832004 	add	r2, r3, #4
    1140:	e50b2014 	str	r2, [fp, #-20]
    1144:	e5933000 	ldr	r3, [r3]
    1148:	e50b300c 	str	r3, [fp, #-12]
    114c:	e51b300c 	ldr	r3, [fp, #-12]
    1150:	e3530000 	cmp	r3, #0
    1154:	aa000004 	bge	116c <uprintf+0x120>
    1158:	e3a0002d 	mov	r0, #45	; 0x2d
    115c:	ebfffec1 	bl	c68 <putc>
    1160:	e51b300c 	ldr	r3, [fp, #-12]
    1164:	e2633000 	rsb	r3, r3, #0
    1168:	e50b300c 	str	r3, [fp, #-12]
    116c:	e24b3034 	sub	r3, fp, #52	; 0x34
    1170:	e51b000c 	ldr	r0, [fp, #-12]
    1174:	e1a01003 	mov	r1, r3
    1178:	ebffff12 	bl	dc8 <itoa>
    117c:	e24b3034 	sub	r3, fp, #52	; 0x34
    1180:	e1a00003 	mov	r0, r3
    1184:	ebfffed9 	bl	cf0 <uputs>
    1188:	e1a00000 	nop			; (mov r0, r0)
    118c:	ea000018 	b	11f4 <uprintf+0x1a8>
    1190:	e51b3014 	ldr	r3, [fp, #-20]
    1194:	e2832004 	add	r2, r3, #4
    1198:	e50b2014 	str	r2, [fp, #-20]
    119c:	e5933000 	ldr	r3, [r3]
    11a0:	e50b300c 	str	r3, [fp, #-12]
    11a4:	e24b3034 	sub	r3, fp, #52	; 0x34
    11a8:	e51b000c 	ldr	r0, [fp, #-12]
    11ac:	e1a01003 	mov	r1, r3
    11b0:	ebffff48 	bl	ed8 <xtoa>
    11b4:	e24b3034 	sub	r3, fp, #52	; 0x34
    11b8:	e1a00003 	mov	r0, r3
    11bc:	ebfffecb 	bl	cf0 <uputs>
    11c0:	ea00000b 	b	11f4 <uprintf+0x1a8>
    11c4:	e59b3004 	ldr	r3, [fp, #4]
    11c8:	e5d33000 	ldrb	r3, [r3]
    11cc:	e1a00003 	mov	r0, r3
    11d0:	ebfffea4 	bl	c68 <putc>
    11d4:	e59b3004 	ldr	r3, [fp, #4]
    11d8:	e5d33000 	ldrb	r3, [r3]
    11dc:	e353000a 	cmp	r3, #10
    11e0:	1a000003 	bne	11f4 <uprintf+0x1a8>
    11e4:	e3a0000d 	mov	r0, #13
    11e8:	ebfffe9e 	bl	c68 <putc>
    11ec:	ea000000 	b	11f4 <uprintf+0x1a8>
    11f0:	e1a00000 	nop			; (mov r0, r0)
    11f4:	e59b3004 	ldr	r3, [fp, #4]
    11f8:	e2833001 	add	r3, r3, #1
    11fc:	e58b3004 	str	r3, [fp, #4]
    1200:	e59b3004 	ldr	r3, [fp, #4]
    1204:	e5d33000 	ldrb	r3, [r3]
    1208:	e3530000 	cmp	r3, #0
    120c:	1affff95 	bne	1068 <uprintf+0x1c>
    1210:	e3a03000 	mov	r3, #0
    1214:	e1a00003 	mov	r0, r3
    1218:	e24bd004 	sub	sp, fp, #4
    121c:	e8bd4800 	pop	{fp, lr}
    1220:	e28dd010 	add	sp, sp, #16
    1224:	e12fff1e 	bx	lr

00001228 <create_kernel_table>:
    1228:	e52db004 	push	{fp}		; (str fp, [sp, #-4]!)
    122c:	e28db000 	add	fp, sp, #0
    1230:	e24dd014 	sub	sp, sp, #20
    1234:	e50b0010 	str	r0, [fp, #-16]
    1238:	e3a03206 	mov	r3, #1610612736	; 0x60000000
    123c:	e50b3008 	str	r3, [fp, #-8]
    1240:	e59f3038 	ldr	r3, [pc, #56]	; 1280 <create_kernel_table+0x58>
    1244:	e50b300c 	str	r3, [fp, #-12]
    1248:	e51b3010 	ldr	r3, [fp, #-16]
    124c:	e1a03a23 	lsr	r3, r3, #20
    1250:	e1a03103 	lsl	r3, r3, #2
    1254:	e51b2008 	ldr	r2, [fp, #-8]
    1258:	e0822003 	add	r2, r2, r3
    125c:	e51b300c 	ldr	r3, [fp, #-12]
    1260:	e1a03a23 	lsr	r3, r3, #20
    1264:	e1a03a03 	lsl	r3, r3, #20
    1268:	e3833ec1 	orr	r3, r3, #3088	; 0xc10
    126c:	e383300e 	orr	r3, r3, #14
    1270:	e5823000 	str	r3, [r2]
    1274:	e28bd000 	add	sp, fp, #0
    1278:	e8bd0800 	pop	{fp}
    127c:	e12fff1e 	bx	lr
    1280:	30008000 	andcc	r8, r0, r0

00001284 <load_app>:
    1284:	e52db004 	push	{fp}		; (str fp, [sp, #-4]!)
    1288:	e28db000 	add	fp, sp, #0
    128c:	e24dd00c 	sub	sp, sp, #12
    1290:	e50b0008 	str	r0, [fp, #-8]
    1294:	e28bd000 	add	sp, fp, #0
    1298:	e8bd0800 	pop	{fp}
    129c:	e12fff1e 	bx	lr

000012a0 <create_app_table>:
    12a0:	e92d4800 	push	{fp, lr}
    12a4:	e28db004 	add	fp, sp, #4
    12a8:	e24dd018 	sub	sp, sp, #24
    12ac:	e50b0018 	str	r0, [fp, #-24]
    12b0:	e3a03206 	mov	r3, #1610612736	; 0x60000000
    12b4:	e50b3008 	str	r3, [fp, #-8]
    12b8:	e51b3018 	ldr	r3, [fp, #-24]
    12bc:	e3530001 	cmp	r3, #1
    12c0:	1a000003 	bne	12d4 <create_app_table+0x34>
    12c4:	eb000407 	bl	22e8 <app1>
    12c8:	e1a03000 	mov	r3, r0
    12cc:	e50b300c 	str	r3, [fp, #-12]
    12d0:	ea000002 	b	12e0 <create_app_table+0x40>
    12d4:	eb00040b 	bl	2308 <app2>
    12d8:	e1a03000 	mov	r3, r0
    12dc:	e50b300c 	str	r3, [fp, #-12]
    12e0:	e59f302c 	ldr	r3, [pc, #44]	; 1314 <create_app_table+0x74>
    12e4:	e50b3010 	str	r3, [fp, #-16]
    12e8:	e51b3008 	ldr	r3, [fp, #-8]
    12ec:	e283200c 	add	r2, r3, #12
    12f0:	e51b3010 	ldr	r3, [fp, #-16]
    12f4:	e1a03a23 	lsr	r3, r3, #20
    12f8:	e1a03a03 	lsl	r3, r3, #20
    12fc:	e3833ec1 	orr	r3, r3, #3088	; 0xc10
    1300:	e383300e 	orr	r3, r3, #14
    1304:	e5823000 	str	r3, [r2]
    1308:	e24bd004 	sub	sp, fp, #4
    130c:	e8bd4800 	pop	{fp, lr}
    1310:	e12fff1e 	bx	lr
    1314:	3000a380 	andcc	sl, r0, r0, lsl #7

00001318 <run_pid>:
    1318:	e92d4800 	push	{fp, lr}
    131c:	e28db004 	add	fp, sp, #4
    1320:	e24dd008 	sub	sp, sp, #8
    1324:	e50b0008 	str	r0, [fp, #-8]
    1328:	e51b3008 	ldr	r3, [fp, #-8]
    132c:	e1a03c83 	lsl	r3, r3, #25
    1330:	e1a00003 	mov	r0, r3
    1334:	ebffffbb 	bl	1228 <create_kernel_table>
    1338:	e51b0008 	ldr	r0, [fp, #-8]
    133c:	ebffffd7 	bl	12a0 <create_app_table>
    1340:	e51b3008 	ldr	r3, [fp, #-8]
    1344:	e1a00003 	mov	r0, r3
    1348:	ee0d0f10 	mcr	15, 0, r0, cr13, cr0, {0}
    134c:	e51b3008 	ldr	r3, [fp, #-8]
    1350:	eb0003f4 	bl	2328 <_ld_start>
    1354:	e24bd004 	sub	sp, fp, #4
    1358:	e8bd4800 	pop	{fp, lr}
    135c:	e12fff1e 	bx	lr

00001360 <sched_init>:
    1360:	e92d4800 	push	{fp, lr}
    1364:	e28db004 	add	fp, sp, #4
    1368:	e3a00001 	mov	r0, #1
    136c:	ebffffe9 	bl	1318 <run_pid>
    1370:	e3a00001 	mov	r0, #1
    1374:	eb000041 	bl	1480 <delay>
    1378:	e3a00002 	mov	r0, #2
    137c:	ebffffe5 	bl	1318 <run_pid>
    1380:	eafffff8 	b	1368 <sched_init+0x8>

00001384 <beep_init>:
    1384:	e52db004 	push	{fp}		; (str fp, [sp, #-4]!)
    1388:	e28db000 	add	fp, sp, #0
    138c:	e59f302c 	ldr	r3, [pc, #44]	; 13c0 <beep_init+0x3c>
    1390:	e59f2028 	ldr	r2, [pc, #40]	; 13c0 <beep_init+0x3c>
    1394:	e5922000 	ldr	r2, [r2]
    1398:	e3c22003 	bic	r2, r2, #3
    139c:	e5832000 	str	r2, [r3]
    13a0:	e59f3018 	ldr	r3, [pc, #24]	; 13c0 <beep_init+0x3c>
    13a4:	e59f2014 	ldr	r2, [pc, #20]	; 13c0 <beep_init+0x3c>
    13a8:	e5922000 	ldr	r2, [r2]
    13ac:	e3822001 	orr	r2, r2, #1
    13b0:	e5832000 	str	r2, [r3]
    13b4:	e28bd000 	add	sp, fp, #0
    13b8:	e8bd0800 	pop	{fp}
    13bc:	e12fff1e 	bx	lr
    13c0:	56000010 	undefined instruction 0x56000010

000013c4 <beep_run>:
    13c4:	e52db004 	push	{fp}		; (str fp, [sp, #-4]!)
    13c8:	e28db000 	add	fp, sp, #0
    13cc:	e59f302c 	ldr	r3, [pc, #44]	; 1400 <beep_run+0x3c>
    13d0:	e59f2028 	ldr	r2, [pc, #40]	; 1400 <beep_run+0x3c>
    13d4:	e5922000 	ldr	r2, [r2]
    13d8:	e3822001 	orr	r2, r2, #1
    13dc:	e5832000 	str	r2, [r3]
    13e0:	e59f3018 	ldr	r3, [pc, #24]	; 1400 <beep_run+0x3c>
    13e4:	e5933000 	ldr	r3, [r3]
    13e8:	e59f3010 	ldr	r3, [pc, #16]	; 1400 <beep_run+0x3c>
    13ec:	e3a02000 	mov	r2, #0
    13f0:	e5832000 	str	r2, [r3]
    13f4:	e28bd000 	add	sp, fp, #0
    13f8:	e8bd0800 	pop	{fp}
    13fc:	e12fff1e 	bx	lr
    1400:	56000014 	undefined instruction 0x56000014

00001404 <led_init>:
    1404:	e52db004 	push	{fp}		; (str fp, [sp, #-4]!)
    1408:	e28db000 	add	fp, sp, #0
    140c:	e59f301c 	ldr	r3, [pc, #28]	; 1430 <led_init+0x2c>
    1410:	e3a02b55 	mov	r2, #87040	; 0x15400
    1414:	e5832000 	str	r2, [r3]
    1418:	e59f3014 	ldr	r3, [pc, #20]	; 1434 <led_init+0x30>
    141c:	e3e02000 	mvn	r2, #0
    1420:	e5832000 	str	r2, [r3]
    1424:	e28bd000 	add	sp, fp, #0
    1428:	e8bd0800 	pop	{fp}
    142c:	e12fff1e 	bx	lr
    1430:	56000010 	undefined instruction 0x56000010
    1434:	56000014 	undefined instruction 0x56000014

00001438 <led_on>:
    1438:	e52db004 	push	{fp}		; (str fp, [sp, #-4]!)
    143c:	e28db000 	add	fp, sp, #0
    1440:	e59f3010 	ldr	r3, [pc, #16]	; 1458 <led_on+0x20>
    1444:	e3a02d05 	mov	r2, #320	; 0x140
    1448:	e5832000 	str	r2, [r3]
    144c:	e28bd000 	add	sp, fp, #0
    1450:	e8bd0800 	pop	{fp}
    1454:	e12fff1e 	bx	lr
    1458:	56000014 	undefined instruction 0x56000014

0000145c <led_off>:
    145c:	e52db004 	push	{fp}		; (str fp, [sp, #-4]!)
    1460:	e28db000 	add	fp, sp, #0
    1464:	e59f3010 	ldr	r3, [pc, #16]	; 147c <led_off+0x20>
    1468:	e3e02000 	mvn	r2, #0
    146c:	e5832000 	str	r2, [r3]
    1470:	e28bd000 	add	sp, fp, #0
    1474:	e8bd0800 	pop	{fp}
    1478:	e12fff1e 	bx	lr
    147c:	56000014 	undefined instruction 0x56000014

00001480 <delay>:
    1480:	e52db004 	push	{fp}		; (str fp, [sp, #-4]!)
    1484:	e28db000 	add	fp, sp, #0
    1488:	e24dd014 	sub	sp, sp, #20
    148c:	e50b0010 	str	r0, [fp, #-16]
    1490:	e3a03000 	mov	r3, #0
    1494:	e50b300c 	str	r3, [fp, #-12]
    1498:	ea00000c 	b	14d0 <delay+0x50>
    149c:	e3a03000 	mov	r3, #0
    14a0:	e50b3008 	str	r3, [fp, #-8]
    14a4:	ea000002 	b	14b4 <delay+0x34>
    14a8:	e51b3008 	ldr	r3, [fp, #-8]
    14ac:	e2833001 	add	r3, r3, #1
    14b0:	e50b3008 	str	r3, [fp, #-8]
    14b4:	e51b2008 	ldr	r2, [fp, #-8]
    14b8:	e59f302c 	ldr	r3, [pc, #44]	; 14ec <delay+0x6c>
    14bc:	e1520003 	cmp	r2, r3
    14c0:	dafffff8 	ble	14a8 <delay+0x28>
    14c4:	e51b300c 	ldr	r3, [fp, #-12]
    14c8:	e2833001 	add	r3, r3, #1
    14cc:	e50b300c 	str	r3, [fp, #-12]
    14d0:	e51b200c 	ldr	r2, [fp, #-12]
    14d4:	e51b3010 	ldr	r3, [fp, #-16]
    14d8:	e1520003 	cmp	r2, r3
    14dc:	baffffee 	blt	149c <delay+0x1c>
    14e0:	e28bd000 	add	sp, fp, #0
    14e4:	e8bd0800 	pop	{fp}
    14e8:	e12fff1e 	bx	lr
    14ec:	0000270f 	andeq	r2, r0, pc, lsl #14

000014f0 <exp16>:
    14f0:	e52db004 	push	{fp}		; (str fp, [sp, #-4]!)
    14f4:	e28db000 	add	fp, sp, #0
    14f8:	e24dd014 	sub	sp, sp, #20
    14fc:	e50b0010 	str	r0, [fp, #-16]
    1500:	e3a03000 	mov	r3, #0
    1504:	e50b300c 	str	r3, [fp, #-12]
    1508:	e3a03001 	mov	r3, #1
    150c:	e50b3008 	str	r3, [fp, #-8]
    1510:	e3a03000 	mov	r3, #0
    1514:	e50b300c 	str	r3, [fp, #-12]
    1518:	ea000005 	b	1534 <exp16+0x44>
    151c:	e51b3008 	ldr	r3, [fp, #-8]
    1520:	e1a03203 	lsl	r3, r3, #4
    1524:	e50b3008 	str	r3, [fp, #-8]
    1528:	e51b300c 	ldr	r3, [fp, #-12]
    152c:	e2833001 	add	r3, r3, #1
    1530:	e50b300c 	str	r3, [fp, #-12]
    1534:	e51b200c 	ldr	r2, [fp, #-12]
    1538:	e51b3010 	ldr	r3, [fp, #-16]
    153c:	e1520003 	cmp	r2, r3
    1540:	3afffff5 	bcc	151c <exp16+0x2c>
    1544:	e51b3008 	ldr	r3, [fp, #-8]
    1548:	e1a00003 	mov	r0, r3
    154c:	e28bd000 	add	sp, fp, #0
    1550:	e8bd0800 	pop	{fp}
    1554:	e12fff1e 	bx	lr

00001558 <atox>:
    1558:	e92d4810 	push	{r4, fp, lr}
    155c:	e28db008 	add	fp, sp, #8
    1560:	e24dd01c 	sub	sp, sp, #28
    1564:	e50b0020 	str	r0, [fp, #-32]
    1568:	e3a03000 	mov	r3, #0
    156c:	e50b3018 	str	r3, [fp, #-24]
    1570:	e3a03000 	mov	r3, #0
    1574:	e50b3014 	str	r3, [fp, #-20]
    1578:	e3a03000 	mov	r3, #0
    157c:	e50b3010 	str	r3, [fp, #-16]
    1580:	ea000005 	b	159c <atox+0x44>
    1584:	e51b3020 	ldr	r3, [fp, #-32]
    1588:	e2833001 	add	r3, r3, #1
    158c:	e50b3020 	str	r3, [fp, #-32]
    1590:	e51b3014 	ldr	r3, [fp, #-20]
    1594:	e2833001 	add	r3, r3, #1
    1598:	e50b3014 	str	r3, [fp, #-20]
    159c:	e51b3020 	ldr	r3, [fp, #-32]
    15a0:	e5d33000 	ldrb	r3, [r3]
    15a4:	e3530000 	cmp	r3, #0
    15a8:	1afffff5 	bne	1584 <atox+0x2c>
    15ac:	e51b3020 	ldr	r3, [fp, #-32]
    15b0:	e2433001 	sub	r3, r3, #1
    15b4:	e50b3020 	str	r3, [fp, #-32]
    15b8:	e3a03000 	mov	r3, #0
    15bc:	e50b3010 	str	r3, [fp, #-16]
    15c0:	ea000010 	b	1608 <atox+0xb0>
    15c4:	e51b3020 	ldr	r3, [fp, #-32]
    15c8:	e5d33000 	ldrb	r3, [r3]
    15cc:	e2433030 	sub	r3, r3, #48	; 0x30
    15d0:	e1a04003 	mov	r4, r3
    15d4:	e51b0010 	ldr	r0, [fp, #-16]
    15d8:	ebffffc4 	bl	14f0 <exp16>
    15dc:	e1a02000 	mov	r2, r0
    15e0:	e0030492 	mul	r3, r2, r4
    15e4:	e51b2018 	ldr	r2, [fp, #-24]
    15e8:	e0823003 	add	r3, r2, r3
    15ec:	e50b3018 	str	r3, [fp, #-24]
    15f0:	e51b3020 	ldr	r3, [fp, #-32]
    15f4:	e2433001 	sub	r3, r3, #1
    15f8:	e50b3020 	str	r3, [fp, #-32]
    15fc:	e51b3010 	ldr	r3, [fp, #-16]
    1600:	e2833001 	add	r3, r3, #1
    1604:	e50b3010 	str	r3, [fp, #-16]
    1608:	e51b2010 	ldr	r2, [fp, #-16]
    160c:	e51b3014 	ldr	r3, [fp, #-20]
    1610:	e1520003 	cmp	r2, r3
    1614:	3affffea 	bcc	15c4 <atox+0x6c>
    1618:	e51b3018 	ldr	r3, [fp, #-24]
    161c:	e1a00003 	mov	r0, r3
    1620:	e24bd008 	sub	sp, fp, #8
    1624:	e8bd4810 	pop	{r4, fp, lr}
    1628:	e12fff1e 	bx	lr

0000162c <atoi>:
    162c:	e52db004 	push	{fp}		; (str fp, [sp, #-4]!)
    1630:	e28db000 	add	fp, sp, #0
    1634:	e24dd01c 	sub	sp, sp, #28
    1638:	e50b0018 	str	r0, [fp, #-24]
    163c:	e51b3018 	ldr	r3, [fp, #-24]
    1640:	e50b3010 	str	r3, [fp, #-16]
    1644:	e3a03000 	mov	r3, #0
    1648:	e50b3008 	str	r3, [fp, #-8]
    164c:	ea000012 	b	169c <atoi+0x70>
    1650:	e55b3009 	ldrb	r3, [fp, #-9]
    1654:	e353002f 	cmp	r3, #47	; 0x2f
    1658:	9a00000d 	bls	1694 <atoi+0x68>
    165c:	e55b3009 	ldrb	r3, [fp, #-9]
    1660:	e3530039 	cmp	r3, #57	; 0x39
    1664:	8a00000a 	bhi	1694 <atoi+0x68>
    1668:	e51b2008 	ldr	r2, [fp, #-8]
    166c:	e1a03002 	mov	r3, r2
    1670:	e1a03103 	lsl	r3, r3, #2
    1674:	e0833002 	add	r3, r3, r2
    1678:	e1a03083 	lsl	r3, r3, #1
    167c:	e1a02003 	mov	r2, r3
    1680:	e55b3009 	ldrb	r3, [fp, #-9]
    1684:	e2433030 	sub	r3, r3, #48	; 0x30
    1688:	e0823003 	add	r3, r2, r3
    168c:	e50b3008 	str	r3, [fp, #-8]
    1690:	ea000001 	b	169c <atoi+0x70>
    1694:	e3e03000 	mvn	r3, #0
    1698:	ea00000d 	b	16d4 <atoi+0xa8>
    169c:	e51b3010 	ldr	r3, [fp, #-16]
    16a0:	e5d33000 	ldrb	r3, [r3]
    16a4:	e54b3009 	strb	r3, [fp, #-9]
    16a8:	e55b3009 	ldrb	r3, [fp, #-9]
    16ac:	e3530000 	cmp	r3, #0
    16b0:	03a03000 	moveq	r3, #0
    16b4:	13a03001 	movne	r3, #1
    16b8:	e20330ff 	and	r3, r3, #255	; 0xff
    16bc:	e51b2010 	ldr	r2, [fp, #-16]
    16c0:	e2822001 	add	r2, r2, #1
    16c4:	e50b2010 	str	r2, [fp, #-16]
    16c8:	e3530000 	cmp	r3, #0
    16cc:	1affffdf 	bne	1650 <atoi+0x24>
    16d0:	e51b3008 	ldr	r3, [fp, #-8]
    16d4:	e1a00003 	mov	r0, r3
    16d8:	e28bd000 	add	sp, fp, #0
    16dc:	e8bd0800 	pop	{fp}
    16e0:	e12fff1e 	bx	lr

000016e4 <strcpy>:
    16e4:	e52db004 	push	{fp}		; (str fp, [sp, #-4]!)
    16e8:	e28db000 	add	fp, sp, #0
    16ec:	e24dd014 	sub	sp, sp, #20
    16f0:	e50b0010 	str	r0, [fp, #-16]
    16f4:	e50b1014 	str	r1, [fp, #-20]
    16f8:	e51b3010 	ldr	r3, [fp, #-16]
    16fc:	e50b3008 	str	r3, [fp, #-8]
    1700:	e51b3014 	ldr	r3, [fp, #-20]
    1704:	e5d32000 	ldrb	r2, [r3]
    1708:	e51b3010 	ldr	r3, [fp, #-16]
    170c:	e5c32000 	strb	r2, [r3]
    1710:	e51b3010 	ldr	r3, [fp, #-16]
    1714:	e5d33000 	ldrb	r3, [r3]
    1718:	e3530000 	cmp	r3, #0
    171c:	03a03000 	moveq	r3, #0
    1720:	13a03001 	movne	r3, #1
    1724:	e20330ff 	and	r3, r3, #255	; 0xff
    1728:	e51b2010 	ldr	r2, [fp, #-16]
    172c:	e2822001 	add	r2, r2, #1
    1730:	e50b2010 	str	r2, [fp, #-16]
    1734:	e51b2014 	ldr	r2, [fp, #-20]
    1738:	e2822001 	add	r2, r2, #1
    173c:	e50b2014 	str	r2, [fp, #-20]
    1740:	e3530000 	cmp	r3, #0
    1744:	1affffed 	bne	1700 <strcpy+0x1c>
    1748:	e51b3008 	ldr	r3, [fp, #-8]
    174c:	e1a00003 	mov	r0, r3
    1750:	e28bd000 	add	sp, fp, #0
    1754:	e8bd0800 	pop	{fp}
    1758:	e12fff1e 	bx	lr

0000175c <strncpy>:
    175c:	e52db004 	push	{fp}		; (str fp, [sp, #-4]!)
    1760:	e28db000 	add	fp, sp, #0
    1764:	e24dd01c 	sub	sp, sp, #28
    1768:	e50b0010 	str	r0, [fp, #-16]
    176c:	e50b1014 	str	r1, [fp, #-20]
    1770:	e50b2018 	str	r2, [fp, #-24]
    1774:	e51b3010 	ldr	r3, [fp, #-16]
    1778:	e50b3008 	str	r3, [fp, #-8]
    177c:	e51b3018 	ldr	r3, [fp, #-24]
    1780:	e3530000 	cmp	r3, #0
    1784:	03a03000 	moveq	r3, #0
    1788:	13a03001 	movne	r3, #1
    178c:	e20330ff 	and	r3, r3, #255	; 0xff
    1790:	e51b2018 	ldr	r2, [fp, #-24]
    1794:	e2422001 	sub	r2, r2, #1
    1798:	e50b2018 	str	r2, [fp, #-24]
    179c:	e3530000 	cmp	r3, #0
    17a0:	0a000011 	beq	17ec <strncpy+0x90>
    17a4:	e51b3014 	ldr	r3, [fp, #-20]
    17a8:	e5d32000 	ldrb	r2, [r3]
    17ac:	e51b3010 	ldr	r3, [fp, #-16]
    17b0:	e5c32000 	strb	r2, [r3]
    17b4:	e51b3010 	ldr	r3, [fp, #-16]
    17b8:	e5d33000 	ldrb	r3, [r3]
    17bc:	e3530000 	cmp	r3, #0
    17c0:	03a03000 	moveq	r3, #0
    17c4:	13a03001 	movne	r3, #1
    17c8:	e20330ff 	and	r3, r3, #255	; 0xff
    17cc:	e51b2010 	ldr	r2, [fp, #-16]
    17d0:	e2822001 	add	r2, r2, #1
    17d4:	e50b2010 	str	r2, [fp, #-16]
    17d8:	e51b2014 	ldr	r2, [fp, #-20]
    17dc:	e2822001 	add	r2, r2, #1
    17e0:	e50b2014 	str	r2, [fp, #-20]
    17e4:	e3530000 	cmp	r3, #0
    17e8:	1affffe3 	bne	177c <strncpy+0x20>
    17ec:	e51b3008 	ldr	r3, [fp, #-8]
    17f0:	e1a00003 	mov	r0, r3
    17f4:	e28bd000 	add	sp, fp, #0
    17f8:	e8bd0800 	pop	{fp}
    17fc:	e12fff1e 	bx	lr

00001800 <strcat>:
    1800:	e52db004 	push	{fp}		; (str fp, [sp, #-4]!)
    1804:	e28db000 	add	fp, sp, #0
    1808:	e24dd014 	sub	sp, sp, #20
    180c:	e50b0010 	str	r0, [fp, #-16]
    1810:	e50b1014 	str	r1, [fp, #-20]
    1814:	e51b3010 	ldr	r3, [fp, #-16]
    1818:	e50b3008 	str	r3, [fp, #-8]
    181c:	ea000002 	b	182c <strcat+0x2c>
    1820:	e51b3010 	ldr	r3, [fp, #-16]
    1824:	e2833001 	add	r3, r3, #1
    1828:	e50b3010 	str	r3, [fp, #-16]
    182c:	e51b3010 	ldr	r3, [fp, #-16]
    1830:	e5d33000 	ldrb	r3, [r3]
    1834:	e3530000 	cmp	r3, #0
    1838:	1afffff8 	bne	1820 <strcat+0x20>
    183c:	e51b3014 	ldr	r3, [fp, #-20]
    1840:	e5d32000 	ldrb	r2, [r3]
    1844:	e51b3010 	ldr	r3, [fp, #-16]
    1848:	e5c32000 	strb	r2, [r3]
    184c:	e51b3010 	ldr	r3, [fp, #-16]
    1850:	e5d33000 	ldrb	r3, [r3]
    1854:	e3530000 	cmp	r3, #0
    1858:	03a03000 	moveq	r3, #0
    185c:	13a03001 	movne	r3, #1
    1860:	e20330ff 	and	r3, r3, #255	; 0xff
    1864:	e51b2010 	ldr	r2, [fp, #-16]
    1868:	e2822001 	add	r2, r2, #1
    186c:	e50b2010 	str	r2, [fp, #-16]
    1870:	e51b2014 	ldr	r2, [fp, #-20]
    1874:	e2822001 	add	r2, r2, #1
    1878:	e50b2014 	str	r2, [fp, #-20]
    187c:	e3530000 	cmp	r3, #0
    1880:	1affffed 	bne	183c <strcat+0x3c>
    1884:	e51b3008 	ldr	r3, [fp, #-8]
    1888:	e1a00003 	mov	r0, r3
    188c:	e28bd000 	add	sp, fp, #0
    1890:	e8bd0800 	pop	{fp}
    1894:	e12fff1e 	bx	lr

00001898 <strncat>:
    1898:	e52db004 	push	{fp}		; (str fp, [sp, #-4]!)
    189c:	e28db000 	add	fp, sp, #0
    18a0:	e24dd01c 	sub	sp, sp, #28
    18a4:	e50b0010 	str	r0, [fp, #-16]
    18a8:	e50b1014 	str	r1, [fp, #-20]
    18ac:	e50b2018 	str	r2, [fp, #-24]
    18b0:	e51b3010 	ldr	r3, [fp, #-16]
    18b4:	e50b3008 	str	r3, [fp, #-8]
    18b8:	e51b3018 	ldr	r3, [fp, #-24]
    18bc:	e3530000 	cmp	r3, #0
    18c0:	0a000024 	beq	1958 <strncat+0xc0>
    18c4:	ea000002 	b	18d4 <strncat+0x3c>
    18c8:	e51b3010 	ldr	r3, [fp, #-16]
    18cc:	e2833001 	add	r3, r3, #1
    18d0:	e50b3010 	str	r3, [fp, #-16]
    18d4:	e51b3010 	ldr	r3, [fp, #-16]
    18d8:	e5d33000 	ldrb	r3, [r3]
    18dc:	e3530000 	cmp	r3, #0
    18e0:	1afffff8 	bne	18c8 <strncat+0x30>
    18e4:	ea000009 	b	1910 <strncat+0x78>
    18e8:	e51b3018 	ldr	r3, [fp, #-24]
    18ec:	e2433001 	sub	r3, r3, #1
    18f0:	e50b3018 	str	r3, [fp, #-24]
    18f4:	e51b3018 	ldr	r3, [fp, #-24]
    18f8:	e3530000 	cmp	r3, #0
    18fc:	1a000003 	bne	1910 <strncat+0x78>
    1900:	e51b3010 	ldr	r3, [fp, #-16]
    1904:	e3a02000 	mov	r2, #0
    1908:	e5c32000 	strb	r2, [r3]
    190c:	ea000011 	b	1958 <strncat+0xc0>
    1910:	e51b3014 	ldr	r3, [fp, #-20]
    1914:	e5d32000 	ldrb	r2, [r3]
    1918:	e51b3010 	ldr	r3, [fp, #-16]
    191c:	e5c32000 	strb	r2, [r3]
    1920:	e51b3010 	ldr	r3, [fp, #-16]
    1924:	e5d33000 	ldrb	r3, [r3]
    1928:	e3530000 	cmp	r3, #0
    192c:	03a03000 	moveq	r3, #0
    1930:	13a03001 	movne	r3, #1
    1934:	e20330ff 	and	r3, r3, #255	; 0xff
    1938:	e51b2010 	ldr	r2, [fp, #-16]
    193c:	e2822001 	add	r2, r2, #1
    1940:	e50b2010 	str	r2, [fp, #-16]
    1944:	e51b2014 	ldr	r2, [fp, #-20]
    1948:	e2822001 	add	r2, r2, #1
    194c:	e50b2014 	str	r2, [fp, #-20]
    1950:	e3530000 	cmp	r3, #0
    1954:	1affffe3 	bne	18e8 <strncat+0x50>
    1958:	e51b3008 	ldr	r3, [fp, #-8]
    195c:	e1a00003 	mov	r0, r3
    1960:	e28bd000 	add	sp, fp, #0
    1964:	e8bd0800 	pop	{fp}
    1968:	e12fff1e 	bx	lr

0000196c <strcmp>:
    196c:	e92d0810 	push	{r4, fp}
    1970:	e28db004 	add	fp, sp, #4
    1974:	e24dd008 	sub	sp, sp, #8
    1978:	e50b0008 	str	r0, [fp, #-8]
    197c:	e50b100c 	str	r1, [fp, #-12]
    1980:	ea000000 	b	1988 <strcmp+0x1c>
    1984:	e1a00000 	nop			; (mov r0, r0)
    1988:	e51b3008 	ldr	r3, [fp, #-8]
    198c:	e5d32000 	ldrb	r2, [r3]
    1990:	e51b300c 	ldr	r3, [fp, #-12]
    1994:	e5d33000 	ldrb	r3, [r3]
    1998:	e0633002 	rsb	r3, r3, r2
    199c:	e20330ff 	and	r3, r3, #255	; 0xff
    19a0:	e1a04003 	mov	r4, r3
    19a4:	e1a03c04 	lsl	r3, r4, #24
    19a8:	e1a03c43 	asr	r3, r3, #24
    19ac:	e3530000 	cmp	r3, #0
    19b0:	03a03000 	moveq	r3, #0
    19b4:	13a03001 	movne	r3, #1
    19b8:	e20330ff 	and	r3, r3, #255	; 0xff
    19bc:	e51b200c 	ldr	r2, [fp, #-12]
    19c0:	e2822001 	add	r2, r2, #1
    19c4:	e50b200c 	str	r2, [fp, #-12]
    19c8:	e3530000 	cmp	r3, #0
    19cc:	1a00000a 	bne	19fc <strcmp+0x90>
    19d0:	e51b3008 	ldr	r3, [fp, #-8]
    19d4:	e5d33000 	ldrb	r3, [r3]
    19d8:	e3530000 	cmp	r3, #0
    19dc:	13a03000 	movne	r3, #0
    19e0:	03a03001 	moveq	r3, #1
    19e4:	e20330ff 	and	r3, r3, #255	; 0xff
    19e8:	e51b2008 	ldr	r2, [fp, #-8]
    19ec:	e2822001 	add	r2, r2, #1
    19f0:	e50b2008 	str	r2, [fp, #-8]
    19f4:	e3530000 	cmp	r3, #0
    19f8:	0affffe1 	beq	1984 <strcmp+0x18>
    19fc:	e1a03c04 	lsl	r3, r4, #24
    1a00:	e1a03c43 	asr	r3, r3, #24
    1a04:	e1a00003 	mov	r0, r3
    1a08:	e24bd004 	sub	sp, fp, #4
    1a0c:	e8bd0810 	pop	{r4, fp}
    1a10:	e12fff1e 	bx	lr

00001a14 <strncmp>:
    1a14:	e92d0810 	push	{r4, fp}
    1a18:	e28db004 	add	fp, sp, #4
    1a1c:	e24dd010 	sub	sp, sp, #16
    1a20:	e50b0008 	str	r0, [fp, #-8]
    1a24:	e50b100c 	str	r1, [fp, #-12]
    1a28:	e50b2010 	str	r2, [fp, #-16]
    1a2c:	e3a04000 	mov	r4, #0
    1a30:	ea00001f 	b	1ab4 <strncmp+0xa0>
    1a34:	e51b3008 	ldr	r3, [fp, #-8]
    1a38:	e5d32000 	ldrb	r2, [r3]
    1a3c:	e51b300c 	ldr	r3, [fp, #-12]
    1a40:	e5d33000 	ldrb	r3, [r3]
    1a44:	e0633002 	rsb	r3, r3, r2
    1a48:	e20330ff 	and	r3, r3, #255	; 0xff
    1a4c:	e1a04003 	mov	r4, r3
    1a50:	e1a03c04 	lsl	r3, r4, #24
    1a54:	e1a03c43 	asr	r3, r3, #24
    1a58:	e3530000 	cmp	r3, #0
    1a5c:	03a03000 	moveq	r3, #0
    1a60:	13a03001 	movne	r3, #1
    1a64:	e20330ff 	and	r3, r3, #255	; 0xff
    1a68:	e51b200c 	ldr	r2, [fp, #-12]
    1a6c:	e2822001 	add	r2, r2, #1
    1a70:	e50b200c 	str	r2, [fp, #-12]
    1a74:	e3530000 	cmp	r3, #0
    1a78:	1a000010 	bne	1ac0 <strncmp+0xac>
    1a7c:	e51b3008 	ldr	r3, [fp, #-8]
    1a80:	e5d33000 	ldrb	r3, [r3]
    1a84:	e3530000 	cmp	r3, #0
    1a88:	13a03000 	movne	r3, #0
    1a8c:	03a03001 	moveq	r3, #1
    1a90:	e20330ff 	and	r3, r3, #255	; 0xff
    1a94:	e51b2008 	ldr	r2, [fp, #-8]
    1a98:	e2822001 	add	r2, r2, #1
    1a9c:	e50b2008 	str	r2, [fp, #-8]
    1aa0:	e3530000 	cmp	r3, #0
    1aa4:	1a000005 	bne	1ac0 <strncmp+0xac>
    1aa8:	e51b3010 	ldr	r3, [fp, #-16]
    1aac:	e2433001 	sub	r3, r3, #1
    1ab0:	e50b3010 	str	r3, [fp, #-16]
    1ab4:	e51b3010 	ldr	r3, [fp, #-16]
    1ab8:	e3530000 	cmp	r3, #0
    1abc:	1affffdc 	bne	1a34 <strncmp+0x20>
    1ac0:	e1a03c04 	lsl	r3, r4, #24
    1ac4:	e1a03c43 	asr	r3, r3, #24
    1ac8:	e1a00003 	mov	r0, r3
    1acc:	e24bd004 	sub	sp, fp, #4
    1ad0:	e8bd0810 	pop	{r4, fp}
    1ad4:	e12fff1e 	bx	lr

00001ad8 <strchr>:
    1ad8:	e52db004 	push	{fp}		; (str fp, [sp, #-4]!)
    1adc:	e28db000 	add	fp, sp, #0
    1ae0:	e24dd00c 	sub	sp, sp, #12
    1ae4:	e50b0008 	str	r0, [fp, #-8]
    1ae8:	e50b100c 	str	r1, [fp, #-12]
    1aec:	ea000008 	b	1b14 <strchr+0x3c>
    1af0:	e51b3008 	ldr	r3, [fp, #-8]
    1af4:	e5d33000 	ldrb	r3, [r3]
    1af8:	e3530000 	cmp	r3, #0
    1afc:	1a000001 	bne	1b08 <strchr+0x30>
    1b00:	e3a03000 	mov	r3, #0
    1b04:	ea000009 	b	1b30 <strchr+0x58>
    1b08:	e51b3008 	ldr	r3, [fp, #-8]
    1b0c:	e2833001 	add	r3, r3, #1
    1b10:	e50b3008 	str	r3, [fp, #-8]
    1b14:	e51b3008 	ldr	r3, [fp, #-8]
    1b18:	e5d32000 	ldrb	r2, [r3]
    1b1c:	e51b300c 	ldr	r3, [fp, #-12]
    1b20:	e20330ff 	and	r3, r3, #255	; 0xff
    1b24:	e1520003 	cmp	r2, r3
    1b28:	1afffff0 	bne	1af0 <strchr+0x18>
    1b2c:	e51b3008 	ldr	r3, [fp, #-8]
    1b30:	e1a00003 	mov	r0, r3
    1b34:	e28bd000 	add	sp, fp, #0
    1b38:	e8bd0800 	pop	{fp}
    1b3c:	e12fff1e 	bx	lr

00001b40 <strlen>:
    1b40:	e52db004 	push	{fp}		; (str fp, [sp, #-4]!)
    1b44:	e28db000 	add	fp, sp, #0
    1b48:	e24dd014 	sub	sp, sp, #20
    1b4c:	e50b0010 	str	r0, [fp, #-16]
    1b50:	e51b3010 	ldr	r3, [fp, #-16]
    1b54:	e50b3008 	str	r3, [fp, #-8]
    1b58:	ea000002 	b	1b68 <strlen+0x28>
    1b5c:	e51b3008 	ldr	r3, [fp, #-8]
    1b60:	e2833001 	add	r3, r3, #1
    1b64:	e50b3008 	str	r3, [fp, #-8]
    1b68:	e51b3008 	ldr	r3, [fp, #-8]
    1b6c:	e5d33000 	ldrb	r3, [r3]
    1b70:	e3530000 	cmp	r3, #0
    1b74:	1afffff8 	bne	1b5c <strlen+0x1c>
    1b78:	e51b2008 	ldr	r2, [fp, #-8]
    1b7c:	e51b3010 	ldr	r3, [fp, #-16]
    1b80:	e0633002 	rsb	r3, r3, r2
    1b84:	e1a00003 	mov	r0, r3
    1b88:	e28bd000 	add	sp, fp, #0
    1b8c:	e8bd0800 	pop	{fp}
    1b90:	e12fff1e 	bx	lr

00001b94 <strnlen>:
    1b94:	e52db004 	push	{fp}		; (str fp, [sp, #-4]!)
    1b98:	e28db000 	add	fp, sp, #0
    1b9c:	e24dd014 	sub	sp, sp, #20
    1ba0:	e50b0010 	str	r0, [fp, #-16]
    1ba4:	e50b1014 	str	r1, [fp, #-20]
    1ba8:	e51b3010 	ldr	r3, [fp, #-16]
    1bac:	e50b3008 	str	r3, [fp, #-8]
    1bb0:	ea000002 	b	1bc0 <strnlen+0x2c>
    1bb4:	e51b3008 	ldr	r3, [fp, #-8]
    1bb8:	e2833001 	add	r3, r3, #1
    1bbc:	e50b3008 	str	r3, [fp, #-8]
    1bc0:	e51b3014 	ldr	r3, [fp, #-20]
    1bc4:	e3530000 	cmp	r3, #0
    1bc8:	03a03000 	moveq	r3, #0
    1bcc:	13a03001 	movne	r3, #1
    1bd0:	e20330ff 	and	r3, r3, #255	; 0xff
    1bd4:	e51b2014 	ldr	r2, [fp, #-20]
    1bd8:	e2422001 	sub	r2, r2, #1
    1bdc:	e50b2014 	str	r2, [fp, #-20]
    1be0:	e3530000 	cmp	r3, #0
    1be4:	0a000003 	beq	1bf8 <strnlen+0x64>
    1be8:	e51b3008 	ldr	r3, [fp, #-8]
    1bec:	e5d33000 	ldrb	r3, [r3]
    1bf0:	e3530000 	cmp	r3, #0
    1bf4:	1affffee 	bne	1bb4 <strnlen+0x20>
    1bf8:	e51b2008 	ldr	r2, [fp, #-8]
    1bfc:	e51b3010 	ldr	r3, [fp, #-16]
    1c00:	e0633002 	rsb	r3, r3, r2
    1c04:	e1a00003 	mov	r0, r3
    1c08:	e28bd000 	add	sp, fp, #0
    1c0c:	e8bd0800 	pop	{fp}
    1c10:	e12fff1e 	bx	lr

00001c14 <strspn>:
    1c14:	e52db004 	push	{fp}		; (str fp, [sp, #-4]!)
    1c18:	e28db000 	add	fp, sp, #0
    1c1c:	e24dd01c 	sub	sp, sp, #28
    1c20:	e50b0018 	str	r0, [fp, #-24]
    1c24:	e50b101c 	str	r1, [fp, #-28]
    1c28:	e3a03000 	mov	r3, #0
    1c2c:	e50b3008 	str	r3, [fp, #-8]
    1c30:	e51b3018 	ldr	r3, [fp, #-24]
    1c34:	e50b3010 	str	r3, [fp, #-16]
    1c38:	ea00001d 	b	1cb4 <strspn+0xa0>
    1c3c:	e51b301c 	ldr	r3, [fp, #-28]
    1c40:	e50b300c 	str	r3, [fp, #-12]
    1c44:	ea000008 	b	1c6c <strspn+0x58>
    1c48:	e51b3010 	ldr	r3, [fp, #-16]
    1c4c:	e5d32000 	ldrb	r2, [r3]
    1c50:	e51b300c 	ldr	r3, [fp, #-12]
    1c54:	e5d33000 	ldrb	r3, [r3]
    1c58:	e1520003 	cmp	r2, r3
    1c5c:	0a000007 	beq	1c80 <strspn+0x6c>
    1c60:	e51b300c 	ldr	r3, [fp, #-12]
    1c64:	e2833001 	add	r3, r3, #1
    1c68:	e50b300c 	str	r3, [fp, #-12]
    1c6c:	e51b300c 	ldr	r3, [fp, #-12]
    1c70:	e5d33000 	ldrb	r3, [r3]
    1c74:	e3530000 	cmp	r3, #0
    1c78:	1afffff2 	bne	1c48 <strspn+0x34>
    1c7c:	ea000000 	b	1c84 <strspn+0x70>
    1c80:	e1a00000 	nop			; (mov r0, r0)
    1c84:	e51b300c 	ldr	r3, [fp, #-12]
    1c88:	e5d33000 	ldrb	r3, [r3]
    1c8c:	e3530000 	cmp	r3, #0
    1c90:	1a000001 	bne	1c9c <strspn+0x88>
    1c94:	e51b3008 	ldr	r3, [fp, #-8]
    1c98:	ea00000a 	b	1cc8 <strspn+0xb4>
    1c9c:	e51b3008 	ldr	r3, [fp, #-8]
    1ca0:	e2833001 	add	r3, r3, #1
    1ca4:	e50b3008 	str	r3, [fp, #-8]
    1ca8:	e51b3010 	ldr	r3, [fp, #-16]
    1cac:	e2833001 	add	r3, r3, #1
    1cb0:	e50b3010 	str	r3, [fp, #-16]
    1cb4:	e51b3010 	ldr	r3, [fp, #-16]
    1cb8:	e5d33000 	ldrb	r3, [r3]
    1cbc:	e3530000 	cmp	r3, #0
    1cc0:	1affffdd 	bne	1c3c <strspn+0x28>
    1cc4:	e51b3008 	ldr	r3, [fp, #-8]
    1cc8:	e1a00003 	mov	r0, r3
    1ccc:	e28bd000 	add	sp, fp, #0
    1cd0:	e8bd0800 	pop	{fp}
    1cd4:	e12fff1e 	bx	lr

00001cd8 <strpbrk>:
    1cd8:	e52db004 	push	{fp}		; (str fp, [sp, #-4]!)
    1cdc:	e28db000 	add	fp, sp, #0
    1ce0:	e24dd014 	sub	sp, sp, #20
    1ce4:	e50b0010 	str	r0, [fp, #-16]
    1ce8:	e50b1014 	str	r1, [fp, #-20]
    1cec:	e51b3010 	ldr	r3, [fp, #-16]
    1cf0:	e50b300c 	str	r3, [fp, #-12]
    1cf4:	ea000014 	b	1d4c <strpbrk+0x74>
    1cf8:	e51b3014 	ldr	r3, [fp, #-20]
    1cfc:	e50b3008 	str	r3, [fp, #-8]
    1d00:	ea00000a 	b	1d30 <strpbrk+0x58>
    1d04:	e51b300c 	ldr	r3, [fp, #-12]
    1d08:	e5d32000 	ldrb	r2, [r3]
    1d0c:	e51b3008 	ldr	r3, [fp, #-8]
    1d10:	e5d33000 	ldrb	r3, [r3]
    1d14:	e1520003 	cmp	r2, r3
    1d18:	1a000001 	bne	1d24 <strpbrk+0x4c>
    1d1c:	e51b300c 	ldr	r3, [fp, #-12]
    1d20:	ea00000e 	b	1d60 <strpbrk+0x88>
    1d24:	e51b3008 	ldr	r3, [fp, #-8]
    1d28:	e2833001 	add	r3, r3, #1
    1d2c:	e50b3008 	str	r3, [fp, #-8]
    1d30:	e51b3008 	ldr	r3, [fp, #-8]
    1d34:	e5d33000 	ldrb	r3, [r3]
    1d38:	e3530000 	cmp	r3, #0
    1d3c:	1afffff0 	bne	1d04 <strpbrk+0x2c>
    1d40:	e51b300c 	ldr	r3, [fp, #-12]
    1d44:	e2833001 	add	r3, r3, #1
    1d48:	e50b300c 	str	r3, [fp, #-12]
    1d4c:	e51b300c 	ldr	r3, [fp, #-12]
    1d50:	e5d33000 	ldrb	r3, [r3]
    1d54:	e3530000 	cmp	r3, #0
    1d58:	1affffe6 	bne	1cf8 <strpbrk+0x20>
    1d5c:	e3a03000 	mov	r3, #0
    1d60:	e1a00003 	mov	r0, r3
    1d64:	e28bd000 	add	sp, fp, #0
    1d68:	e8bd0800 	pop	{fp}
    1d6c:	e12fff1e 	bx	lr

00001d70 <memset>:
    1d70:	e52db004 	push	{fp}		; (str fp, [sp, #-4]!)
    1d74:	e28db000 	add	fp, sp, #0
    1d78:	e24dd01c 	sub	sp, sp, #28
    1d7c:	e50b0010 	str	r0, [fp, #-16]
    1d80:	e50b1014 	str	r1, [fp, #-20]
    1d84:	e50b2018 	str	r2, [fp, #-24]
    1d88:	e51b3010 	ldr	r3, [fp, #-16]
    1d8c:	e50b3008 	str	r3, [fp, #-8]
    1d90:	ea000006 	b	1db0 <memset+0x40>
    1d94:	e51b3014 	ldr	r3, [fp, #-20]
    1d98:	e20320ff 	and	r2, r3, #255	; 0xff
    1d9c:	e51b3008 	ldr	r3, [fp, #-8]
    1da0:	e5c32000 	strb	r2, [r3]
    1da4:	e51b3008 	ldr	r3, [fp, #-8]
    1da8:	e2833001 	add	r3, r3, #1
    1dac:	e50b3008 	str	r3, [fp, #-8]
    1db0:	e51b3018 	ldr	r3, [fp, #-24]
    1db4:	e3530000 	cmp	r3, #0
    1db8:	03a03000 	moveq	r3, #0
    1dbc:	13a03001 	movne	r3, #1
    1dc0:	e20330ff 	and	r3, r3, #255	; 0xff
    1dc4:	e51b2018 	ldr	r2, [fp, #-24]
    1dc8:	e2422001 	sub	r2, r2, #1
    1dcc:	e50b2018 	str	r2, [fp, #-24]
    1dd0:	e3530000 	cmp	r3, #0
    1dd4:	1affffee 	bne	1d94 <memset+0x24>
    1dd8:	e51b3010 	ldr	r3, [fp, #-16]
    1ddc:	e1a00003 	mov	r0, r3
    1de0:	e28bd000 	add	sp, fp, #0
    1de4:	e8bd0800 	pop	{fp}
    1de8:	e12fff1e 	bx	lr

00001dec <memcpy>:
    1dec:	e52db004 	push	{fp}		; (str fp, [sp, #-4]!)
    1df0:	e28db000 	add	fp, sp, #0
    1df4:	e24dd01c 	sub	sp, sp, #28
    1df8:	e50b0010 	str	r0, [fp, #-16]
    1dfc:	e50b1014 	str	r1, [fp, #-20]
    1e00:	e50b2018 	str	r2, [fp, #-24]
    1e04:	e51b3010 	ldr	r3, [fp, #-16]
    1e08:	e50b300c 	str	r3, [fp, #-12]
    1e0c:	e51b3014 	ldr	r3, [fp, #-20]
    1e10:	e50b3008 	str	r3, [fp, #-8]
    1e14:	ea000009 	b	1e40 <memcpy+0x54>
    1e18:	e51b3008 	ldr	r3, [fp, #-8]
    1e1c:	e5d32000 	ldrb	r2, [r3]
    1e20:	e51b300c 	ldr	r3, [fp, #-12]
    1e24:	e5c32000 	strb	r2, [r3]
    1e28:	e51b300c 	ldr	r3, [fp, #-12]
    1e2c:	e2833001 	add	r3, r3, #1
    1e30:	e50b300c 	str	r3, [fp, #-12]
    1e34:	e51b3008 	ldr	r3, [fp, #-8]
    1e38:	e2833001 	add	r3, r3, #1
    1e3c:	e50b3008 	str	r3, [fp, #-8]
    1e40:	e51b3018 	ldr	r3, [fp, #-24]
    1e44:	e3530000 	cmp	r3, #0
    1e48:	03a03000 	moveq	r3, #0
    1e4c:	13a03001 	movne	r3, #1
    1e50:	e20330ff 	and	r3, r3, #255	; 0xff
    1e54:	e51b2018 	ldr	r2, [fp, #-24]
    1e58:	e2422001 	sub	r2, r2, #1
    1e5c:	e50b2018 	str	r2, [fp, #-24]
    1e60:	e3530000 	cmp	r3, #0
    1e64:	1affffeb 	bne	1e18 <memcpy+0x2c>
    1e68:	e51b3010 	ldr	r3, [fp, #-16]
    1e6c:	e1a00003 	mov	r0, r3
    1e70:	e28bd000 	add	sp, fp, #0
    1e74:	e8bd0800 	pop	{fp}
    1e78:	e12fff1e 	bx	lr

00001e7c <memmove>:
    1e7c:	e52db004 	push	{fp}		; (str fp, [sp, #-4]!)
    1e80:	e28db000 	add	fp, sp, #0
    1e84:	e24dd01c 	sub	sp, sp, #28
    1e88:	e50b0010 	str	r0, [fp, #-16]
    1e8c:	e50b1014 	str	r1, [fp, #-20]
    1e90:	e50b2018 	str	r2, [fp, #-24]
    1e94:	e51b2010 	ldr	r2, [fp, #-16]
    1e98:	e51b3014 	ldr	r3, [fp, #-20]
    1e9c:	e1520003 	cmp	r2, r3
    1ea0:	8a000019 	bhi	1f0c <memmove+0x90>
    1ea4:	e51b3010 	ldr	r3, [fp, #-16]
    1ea8:	e50b300c 	str	r3, [fp, #-12]
    1eac:	e51b3014 	ldr	r3, [fp, #-20]
    1eb0:	e50b3008 	str	r3, [fp, #-8]
    1eb4:	ea000009 	b	1ee0 <memmove+0x64>
    1eb8:	e51b3008 	ldr	r3, [fp, #-8]
    1ebc:	e5d32000 	ldrb	r2, [r3]
    1ec0:	e51b300c 	ldr	r3, [fp, #-12]
    1ec4:	e5c32000 	strb	r2, [r3]
    1ec8:	e51b300c 	ldr	r3, [fp, #-12]
    1ecc:	e2833001 	add	r3, r3, #1
    1ed0:	e50b300c 	str	r3, [fp, #-12]
    1ed4:	e51b3008 	ldr	r3, [fp, #-8]
    1ed8:	e2833001 	add	r3, r3, #1
    1edc:	e50b3008 	str	r3, [fp, #-8]
    1ee0:	e51b3018 	ldr	r3, [fp, #-24]
    1ee4:	e3530000 	cmp	r3, #0
    1ee8:	03a03000 	moveq	r3, #0
    1eec:	13a03001 	movne	r3, #1
    1ef0:	e20330ff 	and	r3, r3, #255	; 0xff
    1ef4:	e51b2018 	ldr	r2, [fp, #-24]
    1ef8:	e2422001 	sub	r2, r2, #1
    1efc:	e50b2018 	str	r2, [fp, #-24]
    1f00:	e3530000 	cmp	r3, #0
    1f04:	1affffeb 	bne	1eb8 <memmove+0x3c>
    1f08:	ea00001c 	b	1f80 <memmove+0x104>
    1f0c:	e51b2010 	ldr	r2, [fp, #-16]
    1f10:	e51b3018 	ldr	r3, [fp, #-24]
    1f14:	e0823003 	add	r3, r2, r3
    1f18:	e50b300c 	str	r3, [fp, #-12]
    1f1c:	e51b2014 	ldr	r2, [fp, #-20]
    1f20:	e51b3018 	ldr	r3, [fp, #-24]
    1f24:	e0823003 	add	r3, r2, r3
    1f28:	e50b3008 	str	r3, [fp, #-8]
    1f2c:	ea000009 	b	1f58 <memmove+0xdc>
    1f30:	e51b300c 	ldr	r3, [fp, #-12]
    1f34:	e2433001 	sub	r3, r3, #1
    1f38:	e50b300c 	str	r3, [fp, #-12]
    1f3c:	e51b3008 	ldr	r3, [fp, #-8]
    1f40:	e2433001 	sub	r3, r3, #1
    1f44:	e50b3008 	str	r3, [fp, #-8]
    1f48:	e51b3008 	ldr	r3, [fp, #-8]
    1f4c:	e5d32000 	ldrb	r2, [r3]
    1f50:	e51b300c 	ldr	r3, [fp, #-12]
    1f54:	e5c32000 	strb	r2, [r3]
    1f58:	e51b3018 	ldr	r3, [fp, #-24]
    1f5c:	e3530000 	cmp	r3, #0
    1f60:	03a03000 	moveq	r3, #0
    1f64:	13a03001 	movne	r3, #1
    1f68:	e20330ff 	and	r3, r3, #255	; 0xff
    1f6c:	e51b2018 	ldr	r2, [fp, #-24]
    1f70:	e2422001 	sub	r2, r2, #1
    1f74:	e50b2018 	str	r2, [fp, #-24]
    1f78:	e3530000 	cmp	r3, #0
    1f7c:	1affffeb 	bne	1f30 <memmove+0xb4>
    1f80:	e51b3010 	ldr	r3, [fp, #-16]
    1f84:	e1a00003 	mov	r0, r3
    1f88:	e28bd000 	add	sp, fp, #0
    1f8c:	e8bd0800 	pop	{fp}
    1f90:	e12fff1e 	bx	lr

00001f94 <memcmp>:
    1f94:	e52db004 	push	{fp}		; (str fp, [sp, #-4]!)
    1f98:	e28db000 	add	fp, sp, #0
    1f9c:	e24dd024 	sub	sp, sp, #36	; 0x24
    1fa0:	e50b0018 	str	r0, [fp, #-24]
    1fa4:	e50b101c 	str	r1, [fp, #-28]
    1fa8:	e50b2020 	str	r2, [fp, #-32]
    1fac:	e3a03000 	mov	r3, #0
    1fb0:	e50b3008 	str	r3, [fp, #-8]
    1fb4:	e51b3018 	ldr	r3, [fp, #-24]
    1fb8:	e50b3010 	str	r3, [fp, #-16]
    1fbc:	e51b301c 	ldr	r3, [fp, #-28]
    1fc0:	e50b300c 	str	r3, [fp, #-12]
    1fc4:	ea000012 	b	2014 <memcmp+0x80>
    1fc8:	e51b3010 	ldr	r3, [fp, #-16]
    1fcc:	e5d33000 	ldrb	r3, [r3]
    1fd0:	e1a02003 	mov	r2, r3
    1fd4:	e51b300c 	ldr	r3, [fp, #-12]
    1fd8:	e5d33000 	ldrb	r3, [r3]
    1fdc:	e0633002 	rsb	r3, r3, r2
    1fe0:	e50b3008 	str	r3, [fp, #-8]
    1fe4:	e51b3008 	ldr	r3, [fp, #-8]
    1fe8:	e3530000 	cmp	r3, #0
    1fec:	1a00000c 	bne	2024 <memcmp+0x90>
    1ff0:	e51b3010 	ldr	r3, [fp, #-16]
    1ff4:	e2833001 	add	r3, r3, #1
    1ff8:	e50b3010 	str	r3, [fp, #-16]
    1ffc:	e51b300c 	ldr	r3, [fp, #-12]
    2000:	e2833001 	add	r3, r3, #1
    2004:	e50b300c 	str	r3, [fp, #-12]
    2008:	e51b3020 	ldr	r3, [fp, #-32]
    200c:	e2433001 	sub	r3, r3, #1
    2010:	e50b3020 	str	r3, [fp, #-32]
    2014:	e51b3020 	ldr	r3, [fp, #-32]
    2018:	e3530000 	cmp	r3, #0
    201c:	caffffe9 	bgt	1fc8 <memcmp+0x34>
    2020:	ea000000 	b	2028 <memcmp+0x94>
    2024:	e1a00000 	nop			; (mov r0, r0)
    2028:	e51b3008 	ldr	r3, [fp, #-8]
    202c:	e1a00003 	mov	r0, r3
    2030:	e28bd000 	add	sp, fp, #0
    2034:	e8bd0800 	pop	{fp}
    2038:	e12fff1e 	bx	lr

0000203c <memscan>:
    203c:	e52db004 	push	{fp}		; (str fp, [sp, #-4]!)
    2040:	e28db000 	add	fp, sp, #0
    2044:	e24dd01c 	sub	sp, sp, #28
    2048:	e50b0010 	str	r0, [fp, #-16]
    204c:	e50b1014 	str	r1, [fp, #-20]
    2050:	e50b2018 	str	r2, [fp, #-24]
    2054:	e51b3010 	ldr	r3, [fp, #-16]
    2058:	e50b3008 	str	r3, [fp, #-8]
    205c:	ea00000d 	b	2098 <memscan+0x5c>
    2060:	e51b3008 	ldr	r3, [fp, #-8]
    2064:	e5d33000 	ldrb	r3, [r3]
    2068:	e1a02003 	mov	r2, r3
    206c:	e51b3014 	ldr	r3, [fp, #-20]
    2070:	e1520003 	cmp	r2, r3
    2074:	1a000001 	bne	2080 <memscan+0x44>
    2078:	e51b3008 	ldr	r3, [fp, #-8]
    207c:	ea000009 	b	20a8 <memscan+0x6c>
    2080:	e51b3008 	ldr	r3, [fp, #-8]
    2084:	e2833001 	add	r3, r3, #1
    2088:	e50b3008 	str	r3, [fp, #-8]
    208c:	e51b3018 	ldr	r3, [fp, #-24]
    2090:	e2433001 	sub	r3, r3, #1
    2094:	e50b3018 	str	r3, [fp, #-24]
    2098:	e51b3018 	ldr	r3, [fp, #-24]
    209c:	e3530000 	cmp	r3, #0
    20a0:	1affffee 	bne	2060 <memscan+0x24>
    20a4:	e51b3008 	ldr	r3, [fp, #-8]
    20a8:	e1a00003 	mov	r0, r3
    20ac:	e28bd000 	add	sp, fp, #0
    20b0:	e8bd0800 	pop	{fp}
    20b4:	e12fff1e 	bx	lr

000020b8 <strstr>:
    20b8:	e92d4800 	push	{fp, lr}
    20bc:	e28db004 	add	fp, sp, #4
    20c0:	e24dd010 	sub	sp, sp, #16
    20c4:	e50b0010 	str	r0, [fp, #-16]
    20c8:	e50b1014 	str	r1, [fp, #-20]
    20cc:	e51b0014 	ldr	r0, [fp, #-20]
    20d0:	ebfffe9a 	bl	1b40 <strlen>
    20d4:	e1a03000 	mov	r3, r0
    20d8:	e50b3008 	str	r3, [fp, #-8]
    20dc:	e51b3008 	ldr	r3, [fp, #-8]
    20e0:	e3530000 	cmp	r3, #0
    20e4:	1a000001 	bne	20f0 <strstr+0x38>
    20e8:	e51b3010 	ldr	r3, [fp, #-16]
    20ec:	ea000018 	b	2154 <strstr+0x9c>
    20f0:	e51b0010 	ldr	r0, [fp, #-16]
    20f4:	ebfffe91 	bl	1b40 <strlen>
    20f8:	e1a03000 	mov	r3, r0
    20fc:	e50b300c 	str	r3, [fp, #-12]
    2100:	ea00000e 	b	2140 <strstr+0x88>
    2104:	e51b300c 	ldr	r3, [fp, #-12]
    2108:	e2433001 	sub	r3, r3, #1
    210c:	e50b300c 	str	r3, [fp, #-12]
    2110:	e51b0010 	ldr	r0, [fp, #-16]
    2114:	e51b1014 	ldr	r1, [fp, #-20]
    2118:	e51b2008 	ldr	r2, [fp, #-8]
    211c:	ebffff9c 	bl	1f94 <memcmp>
    2120:	e1a03000 	mov	r3, r0
    2124:	e3530000 	cmp	r3, #0
    2128:	1a000001 	bne	2134 <strstr+0x7c>
    212c:	e51b3010 	ldr	r3, [fp, #-16]
    2130:	ea000007 	b	2154 <strstr+0x9c>
    2134:	e51b3010 	ldr	r3, [fp, #-16]
    2138:	e2833001 	add	r3, r3, #1
    213c:	e50b3010 	str	r3, [fp, #-16]
    2140:	e51b200c 	ldr	r2, [fp, #-12]
    2144:	e51b3008 	ldr	r3, [fp, #-8]
    2148:	e1520003 	cmp	r2, r3
    214c:	aaffffec 	bge	2104 <strstr+0x4c>
    2150:	e3a03000 	mov	r3, #0
    2154:	e1a00003 	mov	r0, r3
    2158:	e24bd004 	sub	sp, fp, #4
    215c:	e8bd4800 	pop	{fp, lr}
    2160:	e12fff1e 	bx	lr

00002164 <memchr>:
    2164:	e52db004 	push	{fp}		; (str fp, [sp, #-4]!)
    2168:	e28db000 	add	fp, sp, #0
    216c:	e24dd01c 	sub	sp, sp, #28
    2170:	e50b0010 	str	r0, [fp, #-16]
    2174:	e50b1014 	str	r1, [fp, #-20]
    2178:	e50b2018 	str	r2, [fp, #-24]
    217c:	e51b3010 	ldr	r3, [fp, #-16]
    2180:	e50b3008 	str	r3, [fp, #-8]
    2184:	ea00000f 	b	21c8 <memchr+0x64>
    2188:	e51b3014 	ldr	r3, [fp, #-20]
    218c:	e20320ff 	and	r2, r3, #255	; 0xff
    2190:	e51b3008 	ldr	r3, [fp, #-8]
    2194:	e5d33000 	ldrb	r3, [r3]
    2198:	e1520003 	cmp	r2, r3
    219c:	13a03000 	movne	r3, #0
    21a0:	03a03001 	moveq	r3, #1
    21a4:	e20330ff 	and	r3, r3, #255	; 0xff
    21a8:	e51b2008 	ldr	r2, [fp, #-8]
    21ac:	e2822001 	add	r2, r2, #1
    21b0:	e50b2008 	str	r2, [fp, #-8]
    21b4:	e3530000 	cmp	r3, #0
    21b8:	0a000002 	beq	21c8 <memchr+0x64>
    21bc:	e51b3008 	ldr	r3, [fp, #-8]
    21c0:	e2433001 	sub	r3, r3, #1
    21c4:	ea00000a 	b	21f4 <memchr+0x90>
    21c8:	e51b3018 	ldr	r3, [fp, #-24]
    21cc:	e3530000 	cmp	r3, #0
    21d0:	03a03000 	moveq	r3, #0
    21d4:	13a03001 	movne	r3, #1
    21d8:	e20330ff 	and	r3, r3, #255	; 0xff
    21dc:	e51b2018 	ldr	r2, [fp, #-24]
    21e0:	e2422001 	sub	r2, r2, #1
    21e4:	e50b2018 	str	r2, [fp, #-24]
    21e8:	e3530000 	cmp	r3, #0
    21ec:	1affffe5 	bne	2188 <memchr+0x24>
    21f0:	e3a03000 	mov	r3, #0
    21f4:	e1a00003 	mov	r0, r3
    21f8:	e28bd000 	add	sp, fp, #0
    21fc:	e8bd0800 	pop	{fp}
    2200:	e12fff1e 	bx	lr

00002204 <mem_init>:
    2204:	e52db004 	push	{fp}		; (str fp, [sp, #-4]!)
    2208:	e28db000 	add	fp, sp, #0
    220c:	e24dd014 	sub	sp, sp, #20
    2210:	e50b0010 	str	r0, [fp, #-16]
    2214:	e50b1014 	str	r1, [fp, #-20]
    2218:	e59f30bc 	ldr	r3, [pc, #188]	; 22dc <mem_init+0xd8>
    221c:	e51b2014 	ldr	r2, [fp, #-20]
    2220:	e5832000 	str	r2, [r3]
    2224:	e3a03000 	mov	r3, #0
    2228:	e50b3008 	str	r3, [fp, #-8]
    222c:	ea000006 	b	224c <mem_init+0x48>
    2230:	e51b3008 	ldr	r3, [fp, #-8]
    2234:	e59f20a4 	ldr	r2, [pc, #164]	; 22e0 <mem_init+0xdc>
    2238:	e3a01064 	mov	r1, #100	; 0x64
    223c:	e7c21003 	strb	r1, [r2, r3]
    2240:	e51b3008 	ldr	r3, [fp, #-8]
    2244:	e2833001 	add	r3, r3, #1
    2248:	e50b3008 	str	r3, [fp, #-8]
    224c:	e51b2008 	ldr	r2, [fp, #-8]
    2250:	e59f308c 	ldr	r3, [pc, #140]	; 22e4 <mem_init+0xe0>
    2254:	e1520003 	cmp	r2, r3
    2258:	dafffff4 	ble	2230 <mem_init+0x2c>
    225c:	e51b3010 	ldr	r3, [fp, #-16]
    2260:	e2433601 	sub	r3, r3, #1048576	; 0x100000
    2264:	e1a03643 	asr	r3, r3, #12
    2268:	e50b3008 	str	r3, [fp, #-8]
    226c:	e51b2014 	ldr	r2, [fp, #-20]
    2270:	e51b3010 	ldr	r3, [fp, #-16]
    2274:	e0633002 	rsb	r3, r3, r2
    2278:	e50b3014 	str	r3, [fp, #-20]
    227c:	e51b3014 	ldr	r3, [fp, #-20]
    2280:	e1a03643 	asr	r3, r3, #12
    2284:	e50b3014 	str	r3, [fp, #-20]
    2288:	ea000006 	b	22a8 <mem_init+0xa4>
    228c:	e51b3008 	ldr	r3, [fp, #-8]
    2290:	e59f2048 	ldr	r2, [pc, #72]	; 22e0 <mem_init+0xdc>
    2294:	e3a01000 	mov	r1, #0
    2298:	e7c21003 	strb	r1, [r2, r3]
    229c:	e51b3008 	ldr	r3, [fp, #-8]
    22a0:	e2833001 	add	r3, r3, #1
    22a4:	e50b3008 	str	r3, [fp, #-8]
    22a8:	e51b3014 	ldr	r3, [fp, #-20]
    22ac:	e3530000 	cmp	r3, #0
    22b0:	d3a03000 	movle	r3, #0
    22b4:	c3a03001 	movgt	r3, #1
    22b8:	e20330ff 	and	r3, r3, #255	; 0xff
    22bc:	e51b2014 	ldr	r2, [fp, #-20]
    22c0:	e2422001 	sub	r2, r2, #1
    22c4:	e50b2014 	str	r2, [fp, #-20]
    22c8:	e3530000 	cmp	r3, #0
    22cc:	1affffee 	bne	228c <mem_init+0x88>
    22d0:	e28bd000 	add	sp, fp, #0
    22d4:	e8bd0800 	pop	{fp}
    22d8:	e12fff1e 	bx	lr
    22dc:	000023d4 	ldrdeq	r2, [r0], -r4
    22e0:	000023d8 	ldrdeq	r2, [r0], -r8
    22e4:	00000eff 	strdeq	r0, [r0], -pc

000022e8 <app1>:
    22e8:	e92d4800 	push	{fp, lr}
    22ec:	e28db004 	add	fp, sp, #4
    22f0:	e59f000c 	ldr	r0, [pc, #12]	; 2304 <app1+0x1c>
    22f4:	ebfffb54 	bl	104c <uprintf>
    22f8:	e24bd004 	sub	sp, fp, #4
    22fc:	e8bd4800 	pop	{fp, lr}
    2300:	e12fff1e 	bx	lr
    2304:	000023a8 	andeq	r2, r0, r8, lsr #7

00002308 <app2>:
    2308:	e92d4800 	push	{fp, lr}
    230c:	e28db004 	add	fp, sp, #4
    2310:	e59f000c 	ldr	r0, [pc, #12]	; 2324 <app2+0x1c>
    2314:	ebfffb4c 	bl	104c <uprintf>
    2318:	e24bd004 	sub	sp, fp, #4
    231c:	e8bd4800 	pop	{fp, lr}
    2320:	e12fff1e 	bx	lr
    2324:	000023b8 	undefined instruction 0x000023b8

00002328 <_ld_start>:
    2328:	e92d5fff 	push	{r0, r1, r2, r3, r4, r5, r6, r7, r8, r9, sl, fp, ip, lr}
    232c:	e1a0e00f 	mov	lr, pc
    2330:	e3a0f603 	mov	pc, #3145728	; 0x300000
    2334:	ee0d0f10 	mcr	15, 0, r0, cr13, cr0, {0}
    2338:	e8bd9fff 	pop	{r0, r1, r2, r3, r4, r5, r6, r7, r8, r9, sl, fp, ip, pc}

Disassembly of section .rodata:

0000233c <.rodata>:
    233c:	253d2069 	ldrcs	r2, [sp, #-105]!	; 0x69
    2340:	203a2063 	eorscs	r2, sl, r3, rrx
    2344:	000a6425 	andeq	r6, sl, r5, lsr #8
    2348:	0064656c 	rsbeq	r6, r4, ip, ror #10
    234c:	20646d63 	rsbcs	r6, r4, r3, ror #26
    2350:	69207325 	stmdbvs	r0!, {r0, r2, r5, r8, r9, ip, sp, lr}
    2354:	6f6e2073 	svcvs	0x006e2073
    2358:	75732074 	ldrbvc	r2, [r3, #-116]!	; 0x74
    235c:	726f7070 	rsbvc	r7, pc, #112	; 0x70
    2360:	0a646574 	beq	191b938 <bss_end+0x1918660>
    2364:	00000000 	andeq	r0, r0, r0
    2368:	253a4350 	ldrcs	r4, [sl, #-848]!	; 0x350
    236c:	00000a78 	andeq	r0, r0, r8, ror sl
    2370:	6d65645b 	cfstrdvs	mvd6, [r5, #-364]!	; 0xfffffe94
    2374:	6c656e6f 	stclvs	14, cr6, [r5], #-444	; 0xfffffe44
    2378:	614d4066 	cmpvs	sp, r6, rrx
    237c:	78654864 	stmdavc	r5!, {r2, r5, r6, fp, lr}^
    2380:	20235d20 	eorcs	r5, r3, r0, lsr #26
    2384:	00000000 	andeq	r0, r0, r0
    2388:	6c6c6568 	cfstr64vs	mvdx6, [ip], #-416	; 0xfffffe60
    238c:	7269206f 	rsbvc	r2, r9, #111	; 0x6f
    2390:	000a0d71 	andeq	r0, sl, r1, ror sp
    2394:	253a4350 	ldrcs	r4, [sl, #-848]!	; 0x350
    2398:	61752078 	cmnvs	r5, r8, ror r0
    239c:	69207472 	stmdbvs	r0!, {r1, r4, r5, r6, sl, ip, sp, lr}
    23a0:	0a74696e 	beq	1d1c960 <bss_end+0x1d19688>
    23a4:	00000000 	andeq	r0, r0, r0
    23a8:	6d612069 	stclvs	0, cr2, [r1, #-420]!	; 0xfffffe5c
    23ac:	73617420 	cmnvc	r1, #536870912	; 0x20000000
    23b0:	0a31206b 	beq	c4a564 <bss_end+0xc4728c>
    23b4:	00000000 	andeq	r0, r0, r0
    23b8:	6d612069 	stclvs	0, cr2, [r1, #-420]!	; 0xfffffe5c
    23bc:	73617420 	cmnvc	r1, #536870912	; 0x20000000
    23c0:	0a32206b 	beq	c8a574 <bss_end+0xc8729c>
    23c4:	00000000 	andeq	r0, r0, r0

Disassembly of section .bss:

000023c8 <memory_end>:
    23c8:	00000000 	andeq	r0, r0, r0

000023cc <buffer_memory_end>:
    23cc:	00000000 	andeq	r0, r0, r0

000023d0 <main_memory_start>:
    23d0:	00000000 	andeq	r0, r0, r0

000023d4 <HIGH_MEMORY>:
    23d4:	00000000 	andeq	r0, r0, r0

000023d8 <mem_map>:
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
   0:	3a434347 	bcc	10d0d24 <bss_end+0x10cda4c>
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
  70:	4b2f332f 	blmi	bccd34 <bss_end+0xbc9a5c>
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
  d0:	4b58080a 	blmi	1602100 <bss_end+0x15fee28>
  d4:	4b5b084b 	blmi	16c2208 <bss_end+0x16bef30>
  d8:	0827034b 	stmdaeq	r7!, {r0, r1, r3, r6, r8, r9}
  dc:	4c676958 	stclmi	9, cr6, [r7], #-352	; 0xfffffea0
  e0:	30023c03 	andcc	r3, r2, r3, lsl #24
  e4:	00080201 	andeq	r0, r8, r1, lsl #4
  e8:	007f0101 	rsbseq	r0, pc, r1, lsl #2
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
 118:	00030802 	andeq	r0, r3, r2, lsl #16
 11c:	01170300 	tsteq	r7, r0, lsl #6
 120:	e50868a0 	str	r6, [r8, #-2208]	; 0x8a0
 124:	034c2108 	movteq	r2, #49416	; 0xc108
 128:	85c22e7a 	strbhi	r2, [r2, #3706]	; 0xe7a
 12c:	8384d79f 	orrhi	sp, r4, #41680896	; 0x27c0000
 130:	4b4b69a0 	blmi	12da7b8 <bss_end+0x12d74e0>
 134:	8630304d 	ldrthi	r3, [r0], -sp, asr #32
 138:	08d9a04b 	ldmeq	r9, {r0, r1, r3, r6, sp, pc}^
 13c:	102402e6 	eorne	r0, r4, r6, ror #5
 140:	14240232 	strtne	r0, [r4], #-562	; 0x232
 144:	03673d08 	cmneq	r7, #512	; 0x200
 148:	0f034a75 	svceq	0x00034a75
 14c:	3e085808 	cdpcc	8, 0, cr5, cr8, cr8, {0}
 150:	4ba4bb67 	blmi	fe92eef4 <bss_end+0xfe92bc1c>
 154:	12036783 	andne	r6, r3, #34340864	; 0x20c0000
 158:	bb674bba 	bllt	19d3048 <bss_end+0x19cfd70>
 15c:	83836783 	orrhi	r6, r3, #34340864	; 0x20c0000
 160:	86678483 	strbthi	r8, [r7], -r3, lsl #9
 164:	302f2fd7 	ldrdcc	r2, [pc], -r7
 168:	01001202 	tsteq	r0, r2, lsl #4
 16c:	00009401 	andeq	r9, r0, r1, lsl #8
 170:	22000200 	andcs	r0, r0, #0
 174:	02000000 	andeq	r0, r0, #0
 178:	0d0efb01 	vstreq	d15, [lr, #-4]
 17c:	01010100 	tsteq	r1, r0, lsl #2
 180:	00000001 	andeq	r0, r0, r1
 184:	01000001 	tsteq	r0, r1
 188:	74696e69 	strbtvc	r6, [r9], #-3689	; 0xe69
 18c:	616e0000 	cmnvs	lr, r0
 190:	632e646e 	teqvs	lr, #1845493760	; 0x6e000000
 194:	00000100 	andeq	r0, r0, r0, lsl #2
 198:	02050000 	andeq	r0, r5, #0
 19c:	00000760 	andeq	r0, r0, r0, ror #14
 1a0:	4b010e03 	blmi	439b4 <bss_end+0x406dc>
 1a4:	9f4b859f 	svcls	0x004b859f
 1a8:	85d74b85 	ldrbhi	r4, [r7, #2949]	; 0xb85
 1ac:	83868383 	orrhi	r8, r6, #201326594	; 0xc000002
 1b0:	bb4b8683 	bllt	12e1bc4 <bss_end+0x12de8ec>
 1b4:	31314c86 	teqcc	r1, r6, lsl #25
 1b8:	6a2f314d 	bvs	bcc6f4 <bss_end+0xbc941c>
 1bc:	2f68684b 	svccs	0x0068684b
 1c0:	314c9fa2 	smlaltbcc	r9, ip, r2, pc
 1c4:	4d4b4d31 	stclmi	13, cr4, [fp, #-196]	; 0xffffff3c
 1c8:	4da19f83 	stcmi	15, cr9, [r1, #524]!	; 0x20c
 1cc:	dcd46831 	ldclle	8, cr6, [r4], {49}	; 0x31
 1d0:	4b9fa130 	blmi	fe7e8698 <bss_end+0xfe7e53c0>
 1d4:	4d31314c 	ldfmis	f3, [r1, #-304]!	; 0xfffffed0
 1d8:	9f834d4b 	svcls	0x00834d4b
 1dc:	dbb868a0 	blle	fee1a464 <bss_end+0xfee1718c>
 1e0:	854d314c 	strbhi	r3, [sp, #-332]	; 0x14c
 1e4:	bbbd2f30 	bllt	fef4beac <bss_end+0xfef48bd4>
 1e8:	6783854b 	strvs	r8, [r3, fp, asr #10]
 1ec:	667a0367 	ldrbtvs	r0, [sl], -r7, ror #6
 1f0:	4c83696e 	stcmi	9, cr6, [r3], {110}	; 0x6e
 1f4:	834d3131 	movthi	r3, #53553	; 0xd131
 1f8:	314da19f 	undefined instruction 0x314da19f
 1fc:	3030844d 	eorscc	r8, r0, sp, asr #8
 200:	01000a02 	tsteq	r0, r2, lsl #20
 204:	00003a01 	andeq	r3, r0, r1, lsl #20
 208:	24000200 	strcs	r0, [r0], #-512	; 0x200
 20c:	02000000 	andeq	r0, r0, #0
 210:	0d0efb01 	vstreq	d15, [lr, #-4]
 214:	01010100 	tsteq	r1, r0, lsl #2
 218:	00000001 	andeq	r0, r0, r1
 21c:	01000001 	tsteq	r0, r1
 220:	6e72656b 	cdpvs	5, 7, cr6, cr2, cr11, {3}
 224:	00006c65 	andeq	r6, r0, r5, ror #24
 228:	70617274 	rsbvc	r7, r1, r4, ror r2
 22c:	0100632e 	tsteq	r0, lr, lsr #6
 230:	00000000 	andeq	r0, r0, r0
 234:	0bd80205 	bleq	ff600a50 <bss_end+0xff5fd778>
 238:	13030000 	movwne	r0, #12288	; 0x3000
 23c:	06024c01 	streq	r4, [r2], -r1, lsl #24
 240:	fc010100 	stc2	1, cr0, [r1], {0}
 244:	02000000 	andeq	r0, r0, #0
 248:	00007f00 	andeq	r7, r0, r0, lsl #30
 24c:	fb010200 	blx	40a56 <bss_end+0x3d77e>
 250:	01000d0e 	tsteq	r0, lr, lsl #26
 254:	00010101 	andeq	r0, r1, r1, lsl #2
 258:	00010000 	andeq	r0, r1, r0
 25c:	656b0100 	strbvs	r0, [fp, #-256]!	; 0x100
 260:	6c656e72 	stclvs	14, cr6, [r5], #-456	; 0xfffffe38
 264:	706f2f00 	rsbvc	r2, pc, r0, lsl #30
 268:	72462f74 	subvc	r2, r6, #464	; 0x1d0
 26c:	646e6569 	strbtvs	r6, [lr], #-1385	; 0x569
 270:	5241796c 	subpl	r7, r1, #1769472	; 0x1b0000
 274:	6f742f4d 	svcvs	0x00742f4d
 278:	63736c6f 	cmnvs	r3, #28416	; 0x6f00
 27c:	6e696168 	powvsez	f6, f1, #0.0
 280:	342e342f 	strtcc	r3, [lr], #-1071	; 0x42f
 284:	6c2f332e 	stcvs	3, cr3, [pc], #-184	; 0xffffff48
 288:	672f6269 	strvs	r6, [pc, -r9, ror #4]!
 28c:	612f6363 	teqvs	pc, r3, ror #6
 290:	6e2d6d72 	mcrvs	13, 1, r6, cr13, cr2, {3}
 294:	2d656e6f 	stclcs	14, cr6, [r5, #-444]!	; 0xfffffe44
 298:	756e696c 	strbvc	r6, [lr, #-2412]!	; 0x96c
 29c:	6e672d78 	mcrvs	13, 3, r2, cr7, cr8, {3}
 2a0:	62616575 	rsbvs	r6, r1, #490733568	; 0x1d400000
 2a4:	2e342f69 	cdpcs	15, 3, cr2, cr4, cr9, {3}
 2a8:	2f332e34 	svccs	0x00332e34
 2ac:	6c636e69 	stclvs	14, cr6, [r3], #-420	; 0xfffffe5c
 2b0:	00656475 	rsbeq	r6, r5, r5, ror r4
 2b4:	72617500 	rsbvc	r7, r1, #0
 2b8:	00632e74 	rsbeq	r2, r3, r4, ror lr
 2bc:	73000001 	movwvc	r0, #1
 2c0:	72616474 	rsbvc	r6, r1, #1946157056	; 0x74000000
 2c4:	00682e67 	rsbeq	r2, r8, r7, ror #28
 2c8:	00000002 	andeq	r0, r0, r2
 2cc:	ec020500 	cfstr32	mvfx0, [r2], {0}
 2d0:	0300000b 	movweq	r0, #11
 2d4:	9f4b0123 	svcls	0x004b0123
 2d8:	67676767 	strbvs	r6, [r7, -r7, ror #14]!
 2dc:	a0c06767 	sbcge	r6, r0, r7, ror #14
 2e0:	4ca467a1 	stcmi	7, cr6, [r4], #644	; 0x284
 2e4:	83bd67a1 	undefined instruction 0x83bd67a1
 2e8:	6986d430 	stmibvs	r6, {r4, r5, sl, ip, lr, pc}
 2ec:	672f4d83 	strvs	r4, [pc, -r3, lsl #27]!
 2f0:	67c06383 	strbvs	r6, [r0, r3, lsl #7]
 2f4:	862f4b4b 	strthi	r4, [pc], -fp, asr #22
 2f8:	83bb67a1 	undefined instruction 0x83bb67a1
 2fc:	08210830 	stmdaeq	r1!, {r4, r5, fp}
 300:	13240275 	teqne	r4, #1342177287	; 0x50000007
 304:	67a185bb 	undefined instruction 0x67a185bb
 308:	83bbd867 	undefined instruction 0x83bbd867
 30c:	7508f330 	strvc	pc, [r8, #-816]	; 0x330
 310:	08ae08f3 	stmiaeq	lr!, {r0, r1, r4, r5, r6, r7, fp}
 314:	896abb91 	stmdbhi	sl!, {r0, r4, r7, r8, r9, fp, ip, sp, pc}^
 318:	67832f4b 	strvs	r2, [r3, fp, asr #30]
 31c:	9f143802 	svcls	0x00143802
 320:	4b9f3067 	blmi	fe7cc4c4 <bss_end+0xfe7c91ec>
 324:	4b679f30 	blmi	19e7fec <bss_end+0x19e4d14>
 328:	4c678368 	stclmi	3, cr8, [r7], #-416	; 0xfffffe60
 32c:	8388839f 	orrhi	r8, r8, #2080374786	; 0x7c000002
 330:	66780383 	ldrbtvs	r0, [r8], -r3, lsl #7
 334:	032e0a03 	teqeq	lr, #12288	; 0x3000
 338:	2703665e 	smlsdcs	r3, lr, r6, r6
 33c:	0a022f82 	beq	8c14c <bss_end+0x88e74>
 340:	58010100 	stmdapl	r1, {r8}
 344:	02000000 	andeq	r0, r0, #0
 348:	00002500 	andeq	r2, r0, r0, lsl #10
 34c:	fb010200 	blx	40b56 <bss_end+0x3d87e>
 350:	01000d0e 	tsteq	r0, lr, lsl #26
 354:	00010101 	andeq	r0, r1, r1, lsl #2
 358:	00010000 	andeq	r0, r1, r0
 35c:	656b0100 	strbvs	r0, [fp, #-256]!	; 0x100
 360:	6c656e72 	stclvs	14, cr6, [r5], #-456	; 0xfffffe38
 364:	63730000 	cmnvs	r3, #0
 368:	2e646568 	cdpcs	5, 6, cr6, cr4, cr8, {3}
 36c:	00010063 	andeq	r0, r1, r3, rrx
 370:	05000000 	streq	r0, [r0]
 374:	00122802 	andseq	r2, r2, r2, lsl #16
 378:	01130300 	tsteq	r3, r0, lsl #6
 37c:	4d821103 	stfmis	f1, [r2, #12]
 380:	855a084b 	ldrbhi	r0, [sl, #-2123]	; 0x84b
 384:	12036989 	andne	r6, r3, #2244608	; 0x224000
 388:	84674e82 	strbthi	r4, [r7], #-3714	; 0xe82
 38c:	8af44b67 	bhi	ffd13130 <bss_end+0xffd0fe58>
 390:	6d4d8483 	cfstrdvs	mvd8, [sp, #-524]	; 0xfffffdf4
 394:	4b4d694e 	blmi	135a8d4 <bss_end+0x13575fc>
 398:	02024b4b 	andeq	r4, r2, #76800	; 0x12c00
 39c:	49010100 	stmdbmi	r1, {r8}
 3a0:	02000000 	andeq	r0, r0, #0
 3a4:	00002300 	andeq	r2, r0, r0, lsl #6
 3a8:	fb010200 	blx	40bb2 <bss_end+0x3d8da>
 3ac:	01000d0e 	tsteq	r0, lr, lsl #26
 3b0:	00010101 	andeq	r0, r1, r1, lsl #2
 3b4:	00010000 	andeq	r0, r1, r0
 3b8:	656b0100 	strbvs	r0, [fp, #-256]!	; 0x100
 3bc:	6c656e72 	stclvs	14, cr6, [r5], #-456	; 0xfffffe38
 3c0:	656c0000 	strbvs	r0, [ip]!
 3c4:	00632e64 	rsbeq	r2, r3, r4, ror #28
 3c8:	00000001 	andeq	r0, r0, r1
 3cc:	84020500 	strhi	r0, [r2], #-1280	; 0x500
 3d0:	03000013 	movweq	r0, #19
 3d4:	9f4e0116 	svcls	0x004e0116
 3d8:	a04b889f 	umaalge	r8, fp, pc, r8
 3dc:	674b85a0 	strbvs	r8, [fp, -r0, lsr #11]
 3e0:	674ba169 	strbvs	sl, [fp, -r9, ror #2]
 3e4:	02674b85 	rsbeq	r4, r7, #136192	; 0x21400
 3e8:	01010008 	tsteq	r1, r8
 3ec:	00000113 	andeq	r0, r0, r3, lsl r1
 3f0:	00200002 	eoreq	r0, r0, r2
 3f4:	01020000 	tsteq	r2, r0
 3f8:	000d0efb 	strdeq	r0, [sp], -fp
 3fc:	01010101 	tsteq	r1, r1, lsl #2
 400:	01000000 	tsteq	r0, r0
 404:	6c010000 	stcvs	0, cr0, [r1], {0}
 408:	00006269 	andeq	r6, r0, r9, ror #4
 40c:	2e62696c 	cdpcs	9, 6, cr6, cr2, cr12, {3}
 410:	00010063 	andeq	r0, r1, r3, rrx
 414:	05000000 	streq	r0, [r0]
 418:	00148002 	andseq	r8, r4, r2
 41c:	01120300 	tsteq	r2, r0, lsl #6
 420:	3b086785 	blcc	21a23c <bss_end+0x216f64>
 424:	848386db 	strhi	r8, [r3], #1755	; 0x6db
 428:	2fda6567 	svccs	0x00da6567
 42c:	2fbc8387 	svccs	0x00bc8387
 430:	67866467 	strvs	r6, [r6, r7, ror #8]
 434:	64590867 	ldrbvs	r0, [r9], #-2151	; 0x867
 438:	83852fdb 	orrhi	r2, r5, #876	; 0x36c
 43c:	bc304b4c 	ldclt	11, cr4, [r0], #-304	; 0xfffffed0
 440:	03333a08 	teqeq	r3, #32768	; 0x8000
 444:	09034a79 	stmdbeq	r3, {r0, r3, r4, r5, r6, r9, fp, lr}
 448:	872f9008 	strhi	r9, [pc, -r8]!
 44c:	24024c9f 	strcs	r4, [r2], #-3231	; 0xc9f
 450:	bb842f14 	bllt	fe10c0a8 <bss_end+0xfe108dd0>
 454:	1538024c 	ldrne	r0, [r8, #-588]!	; 0x24c
 458:	4c9f842f 	cfldrsmi	mvf8, [pc], {47}	; 0x2f
 45c:	0284652f 	addeq	r6, r4, #197132288	; 0xbc00000
 460:	842f1524 	strthi	r1, [pc], #1316	; 468 <init+0x44>
 464:	2f674cbb 	svccs	0x00674cbb
 468:	bb2f8465 	bllt	be1604 <bss_end+0xbde32c>
 46c:	24022b67 	strcs	r2, [r2], #-2919	; 0xb67
 470:	c0842f1a 	addgt	r2, r4, sl, lsl pc
 474:	163a022c 	ldrtne	r0, [sl], -ip, lsr #4
 478:	30bb844b 	adcscc	r8, fp, fp, asr #8
 47c:	143a022f 	ldrtne	r0, [sl], #-559	; 0x22f
 480:	844b6c63 	strbhi	r6, [fp], #-3171	; 0xc63
 484:	48832f9f 	stmmi	r3, {r0, r1, r2, r3, r4, r7, r8, r9, sl, fp, sp}
 488:	842f2308 	strthi	r2, [pc], #776	; 490 <init+0x6c>
 48c:	673e0885 	ldrvs	r0, [lr, -r5, lsl #17]!
 490:	2802a184 	stmdacs	r2, {r2, r7, r8, sp, pc}
 494:	a1846714 	orrge	r6, r4, r4, lsl r7
 498:	b967674c 	stmdblt	r7!, {r2, r3, r6, r8, r9, sl, sp, lr}^
 49c:	4b8330f4 	blmi	fe0cc874 <bss_end+0xfe0c959c>
 4a0:	03667903 	cmneq	r6, #49152	; 0xc000
 4a4:	842fd60a 	strthi	sp, [pc], #1546	; 4ac <init+0x88>
 4a8:	bb6767a1 	bllt	19da334 <bss_end+0x19d705c>
 4ac:	2fdcd548 	svccs	0x00dcd548
 4b0:	2f4cbb84 	svccs	0x004cbb84
 4b4:	2f3f08d5 	svccs	0x003f08d5
 4b8:	2f84bb84 	svccs	0x0084bb84
 4bc:	3f083b08 	svccc	0x00083b08
 4c0:	83bd842f 	undefined instruction 0x83bd842f
 4c4:	082f4b4b 	stmdaeq	pc!, {r0, r1, r3, r6, r8, r9, fp, lr}
 4c8:	835c083b 	cmphi	ip, #3866624	; 0x3b0000
 4cc:	3b082f83 	blcc	20c2e0 <bss_end+0x209008>
 4d0:	842f4008 	strthi	r4, [pc], #8	; 4d8 <init+0xb4>
 4d4:	089f4cbc 	ldmeq	pc, {r2, r3, r4, r5, r7, sl, fp, lr}
 4d8:	2f92083b 	svccs	0x0092083b
 4dc:	4cbb842f 	cfldrsmi	mvf8, [fp], #188	; 0xbc
 4e0:	674bbb2f 	strbvs	fp, [fp, -pc, lsr #22]
 4e4:	842f6c62 	strthi	r6, [pc], #3170	; 4ec <init+0xc8>
 4e8:	4b6783a1 	blmi	19e1374 <bss_end+0x19de09c>
 4ec:	d7672f83 	strble	r2, [r7, -r3, lsl #31]!
 4f0:	2f88624b 	svccs	0x0088624b
 4f4:	2f4bbb84 	svccs	0x004bbb84
 4f8:	08649108 	stmdaeq	r4!, {r3, r8, ip, pc}^
 4fc:	08022f41 	stmdaeq	r2, {r0, r6, r8, r9, sl, fp, sp}
 500:	43010100 	movwmi	r0, #4352	; 0x1100
 504:	02000000 	andeq	r0, r0, #0
 508:	00002200 	andeq	r2, r0, r0, lsl #4
 50c:	fb010200 	blx	40d16 <bss_end+0x3da3e>
 510:	01000d0e 	tsteq	r0, lr, lsl #26
 514:	00010101 	andeq	r0, r1, r1, lsl #2
 518:	00010000 	andeq	r0, r1, r0
 51c:	6d6d0100 	stfvse	f0, [sp]
 520:	656d0000 	strbvs	r0, [sp]!
 524:	79726f6d 	ldmdbvc	r2!, {r0, r2, r3, r5, r6, r8, r9, sl, fp, sp, lr}^
 528:	0100632e 	tsteq	r0, lr, lsr #6
 52c:	00000000 	andeq	r0, r0, r0
 530:	22040205 	andcs	r0, r4, #1342177280	; 0x50000000
 534:	21030000 	tstcs	r3, r0
 538:	6767a101 	strbvs	sl, [r7, -r1, lsl #2]!
 53c:	8383d881 	orrhi	sp, r3, #8454144	; 0x810000
 540:	08d52f67 	ldmeq	r5, {r0, r1, r2, r5, r6, r8, r9, sl, fp, sp}^
 544:	000c023e 	andeq	r0, ip, lr, lsr r2
 548:	003b0101 	eorseq	r0, fp, r1, lsl #2
 54c:	00020000 	andeq	r0, r2, r0
 550:	00000021 	andeq	r0, r0, r1, lsr #32
 554:	0efb0102 	cdpeq	1, 15, cr0, cr11, cr2, {0}
 558:	0101000d 	tsteq	r1, sp
 55c:	00000101 	andeq	r0, r0, r1, lsl #2
 560:	00000100 	andeq	r0, r0, r0, lsl #2
 564:	70706101 	rsbsvc	r6, r0, r1, lsl #2
 568:	70610000 	rsbvc	r0, r1, r0
 56c:	632e3170 	teqvs	lr, #28
 570:	00000100 	andeq	r0, r0, r0, lsl #2
 574:	02050000 	andeq	r0, r5, #0
 578:	000022e8 	andeq	r2, r0, r8, ror #5
 57c:	4b011303 	blmi	45190 <bss_end+0x41eb8>
 580:	4b4b854b 	blmi	12e1ab4 <bss_end+0x12de7dc>
 584:	01000802 	tsteq	r0, r2, lsl #16
 588:	00003c01 	andeq	r3, r0, r1, lsl #24
 58c:	25000200 	strcs	r0, [r0, #-512]	; 0x200
 590:	02000000 	andeq	r0, r0, #0
 594:	0d0efb01 	vstreq	d15, [lr, #-4]
 598:	01010100 	tsteq	r1, r0, lsl #2
 59c:	00000001 	andeq	r0, r0, r1
 5a0:	01000001 	tsteq	r0, r1
 5a4:	00707061 	rsbseq	r7, r0, r1, rrx
 5a8:	5f646c00 	svcpl	0x00646c00
 5ac:	756e696c 	strbvc	r6, [lr, #-2412]!	; 0x96c
 5b0:	00532e78 	subseq	r2, r3, r8, ror lr
 5b4:	00000001 	andeq	r0, r0, r1
 5b8:	28020500 	stmdacs	r2, {r8, sl}
 5bc:	15000023 	strne	r0, [r0, #-35]	; 0x23
 5c0:	2f302f2f 	svccs	0x00302f2f
 5c4:	01000202 	tsteq	r0, r2, lsl #4
 5c8:	Address 0x000005c8 is out of bounds.


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
      34:	6a6f7270 	bvs	1bdc9fc <bss_end+0x1bd9724>
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
     100:	000001de 	ldrdeq	r0, [r0], -lr
     104:	00860002 	addeq	r0, r6, r2
     108:	01040000 	tsteq	r4, r0
     10c:	0000005c 	andeq	r0, r0, ip, asr r0
     110:	0000b201 	andeq	fp, r0, r1, lsl #4
     114:	00000000 	andeq	r0, r0, r0
     118:	00030800 	andeq	r0, r3, r0, lsl #16
     11c:	00076000 	andeq	r6, r7, r0
     120:	0000ea00 	andeq	lr, r0, r0, lsl #20
     124:	a8010200 	stmdage	r1, {r9}
     128:	01000000 	tsteq	r0, r0
     12c:	03080117 	movweq	r0, #33047	; 0x8117
     130:	03c00000 	biceq	r0, r0, #0
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
     1ac:	c0012401 	andgt	r2, r1, r1, lsl #8
     1b0:	24000003 	strcs	r0, [r0], #-3
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
     1e0:	2b010000 	blcs	401e8 <bss_end+0x3cf10>
     1e4:	00000424 	andeq	r0, r0, r4, lsr #8
     1e8:	00000634 	andeq	r0, r0, r4, lsr r6
     1ec:	000000ac 	andeq	r0, r0, ip, lsr #1
     1f0:	00000143 	andeq	r0, r0, r3, asr #2
     1f4:	00637004 	rsbeq	r7, r3, r4
     1f8:	01432d01 	cmpeq	r3, r1, lsl #26
     1fc:	5f010000 	svcpl	0x00010000
     200:	00009b0c 	andeq	r9, r0, ip, lsl #22
     204:	4a2e0100 	bmi	b8060c <bss_end+0xb7d334>
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
     278:	00063457 	andeq	r3, r6, r7, asr r4
     27c:	00067000 	andeq	r7, r6, r0
     280:	0000d700 	andeq	sp, r0, r0, lsl #14
     284:	a3010f00 	movwge	r0, #7936	; 0x1f00
     288:	01000000 	tsteq	r0, r0
     28c:	0670016c 	ldrbteq	r0, [r0], -ip, ror #2
     290:	07600000 	strbeq	r0, [r0, -r0]!
     294:	01020000 	tsteq	r2, r0
     298:	0b0c0000 	bleq	3002a0 <bss_end+0x2fcfc8>
     29c:	01000001 	tsteq	r0, r1
     2a0:	0001ab66 	andeq	sl, r1, r6, ror #22
     2a4:	c8030500 	stmdagt	r3, {r8, sl}
     2a8:	09000023 	stmdbeq	r0, {r0, r1, r5}
     2ac:	00ce0504 	sbceq	r0, lr, r4, lsl #10
     2b0:	040c0000 	streq	r0, [ip]
     2b4:	01000001 	tsteq	r0, r1
     2b8:	0001ab67 	andeq	sl, r1, r7, ror #22
     2bc:	cc030500 	cfstr32gt	mvfx0, [r3], {0}
     2c0:	0c000023 	stceq	0, cr0, [r0], {35}	; 0x23
     2c4:	000000dc 	ldrdeq	r0, [r0], -ip
     2c8:	01ab6801 	undefined instruction 0x01ab6801
     2cc:	03050000 	movweq	r0, #20480	; 0x5000
     2d0:	000023d0 	ldrdeq	r2, [r0], -r0
     2d4:	00637010 	rsbeq	r7, r3, r0, lsl r0
     2d8:	01436a01 	cmpeq	r3, r1, lsl #20
     2dc:	01010000 	tsteq	r1, r0
     2e0:	0228005f 	eoreq	r0, r8, #95	; 0x5f
     2e4:	00020000 	andeq	r0, r2, r0
     2e8:	0000016f 	andeq	r0, r0, pc, ror #2
     2ec:	005c0104 	subseq	r0, ip, r4, lsl #2
     2f0:	95010000 	strls	r0, [r1]
     2f4:	00000001 	andeq	r0, r0, r1
     2f8:	60000000 	andvs	r0, r0, r0
     2fc:	d8000007 	stmdale	r0, {r0, r1, r2}
     300:	6d00000b 	stcvs	0, cr0, [r0, #-44]	; 0xffffffd4
     304:	02000001 	andeq	r0, r0, #1
     308:	00017001 	andeq	r7, r1, r1
     30c:	600e0100 	andvs	r0, lr, r0, lsl #2
     310:	8c000007 	stchi	0, cr0, [r0], {7}
     314:	2d000007 	stccs	0, cr0, [r0, #-28]	; 0xffffffe4
     318:	02000001 	andeq	r0, r0, #1
     31c:	00016e01 	andeq	r6, r1, r1, lsl #28
     320:	8c130100 	ldfhis	f0, [r3], {0}
     324:	b8000007 	stmdalt	r0, {r0, r1, r2}
     328:	58000007 	stmdapl	r0, {r0, r1, r2}
     32c:	02000001 	andeq	r0, r0, #1
     330:	00012101 	andeq	r2, r1, r1, lsl #2
     334:	b8180100 	ldmdalt	r8, {r8}
     338:	ec000007 	stc	0, cr0, [r0], {7}
     33c:	83000007 	movwhi	r0, #7
     340:	03000001 	movweq	r0, #1
     344:	0001bf01 	andeq	fp, r1, r1, lsl #30
     348:	011d0100 	tsteq	sp, r0, lsl #2
     34c:	000007ec 	andeq	r0, r0, ip, ror #15
     350:	0000081c 	andeq	r0, r0, ip, lsl r8
     354:	000001ae 	andeq	r0, r0, lr, lsr #3
     358:	00000089 	andeq	r0, r0, r9, lsl #1
     35c:	0001c404 	andeq	ip, r1, r4, lsl #8
     360:	891d0100 	ldmdbhi	sp, {r8}
     364:	02000000 	andeq	r0, r0, #0
     368:	05007491 	streq	r7, [r0, #-1169]	; 0x491
     36c:	00760704 	rsbseq	r0, r6, r4, lsl #14
     370:	01030000 	tsteq	r3, r0
     374:	000001ac 	andeq	r0, r0, ip, lsr #3
     378:	1c012301 	stcne	3, cr2, [r1], {1}
     37c:	4c000008 	stcmi	0, cr0, [r0], {8}
     380:	d9000008 	stmdble	r0, {r3}
     384:	b8000001 	stmdalt	r0, {r0}
     388:	04000000 	streq	r0, [r0]
     38c:	000001b1 	undefined instruction 0x000001b1
     390:	00892301 	addeq	r2, r9, r1, lsl #6
     394:	91020000 	tstls	r2, r0
     398:	01020074 	tsteq	r2, r4, ror r0
     39c:	000001b6 	undefined instruction 0x000001b6
     3a0:	084c2901 	stmdaeq	ip, {r0, r8, fp, sp}^
     3a4:	087c0000 	ldmdaeq	ip!, {}^
     3a8:	02040000 	andeq	r0, r4, #0
     3ac:	01020000 	tsteq	r2, r0
     3b0:	00000116 	andeq	r0, r0, r6, lsl r1
     3b4:	087c2f01 	ldmdaeq	ip!, {r0, r8, r9, sl, fp, sp}^
     3b8:	08a80000 	stmiaeq	r8!, {}
     3bc:	022f0000 	eoreq	r0, pc, #0
     3c0:	01020000 	tsteq	r2, r0
     3c4:	0000012b 	andeq	r0, r0, fp, lsr #2
     3c8:	08a84201 	stmiaeq	r8!, {r0, r9, lr}
     3cc:	08e00000 	stmiaeq	r0!, {}^
     3d0:	025a0000 	subseq	r0, sl, #0
     3d4:	01030000 	tsteq	r3, r0
     3d8:	0000017c 	andeq	r0, r0, ip, ror r1
     3dc:	e0014c01 	and	r4, r1, r1, lsl #24
     3e0:	bc000008 	stclt	0, cr0, [r0], {8}
     3e4:	85000009 	strhi	r0, [r0, #-9]
     3e8:	36000002 	strcc	r0, [r0], -r2
     3ec:	04000001 	streq	r0, [r0], #-1
     3f0:	000001b1 	undefined instruction 0x000001b1
     3f4:	01364c01 	teqeq	r6, r1, lsl #24
     3f8:	91020000 	tstls	r2, r0
     3fc:	01c9046c 	biceq	r0, r9, ip, ror #8
     400:	4c010000 	stcmi	0, cr0, [r1], {0}
     404:	0000013d 	andeq	r0, r0, sp, lsr r1
     408:	06689102 	strbteq	r9, [r8], -r2, lsl #2
     40c:	4e010069 	cdpmi	0, 0, cr0, cr1, cr9, {3}
     410:	0000014a 	andeq	r0, r0, sl, asr #2
     414:	00749102 	rsbseq	r9, r4, r2, lsl #2
     418:	71070405 	tstvc	r7, r5, lsl #8
     41c:	07000000 	streq	r0, [r0, -r0]
     420:	00014304 	andeq	r4, r1, r4, lsl #6
     424:	08010500 	stmdaeq	r1, {r8, sl}
     428:	00000150 	andeq	r0, r0, r0, asr r1
     42c:	69050408 	stmdbvs	r5, {r3, sl}
     430:	0900746e 	stmdbeq	r0, {r1, r2, r3, r5, r6, sl, ip, sp, lr}
     434:	00014101 	andeq	r4, r1, r1, lsl #2
     438:	01720100 	cmneq	r2, r0, lsl #2
     43c:	00000136 	andeq	r0, r0, r6, lsr r1
     440:	000009bc 	undefined instruction 0x000009bc
     444:	00000abc 	undefined instruction 0x00000abc
     448:	000002b0 	undefined instruction 0x000002b0
     44c:	000001a5 	andeq	r0, r0, r5, lsr #3
     450:	0001b104 	andeq	fp, r1, r4, lsl #2
     454:	36720100 	ldrbtcc	r0, [r2], -r0, lsl #2
     458:	02000001 	andeq	r0, r0, #1
     45c:	c9046c91 	stmdbgt	r4, {r0, r4, r7, sl, fp, sp, lr}
     460:	01000001 	tsteq	r0, r1
     464:	00013d72 	andeq	r3, r1, r2, ror sp
     468:	68910200 	ldmvs	r1, {r9}
     46c:	01006906 	tsteq	r0, r6, lsl #18
     470:	00014a74 	andeq	r4, r1, r4, ror sl
     474:	70910200 	addsvc	r0, r1, r0, lsl #4
     478:	74657206 	strbtvc	r7, [r5], #-518	; 0x206
     47c:	36750100 	ldrbtcc	r0, [r5], -r0, lsl #2
     480:	02000001 	andeq	r0, r0, #1
     484:	03007491 	movweq	r7, #1169	; 0x491
     488:	00013501 	andeq	r3, r1, r1, lsl #10
     48c:	019d0100 	orrseq	r0, sp, r0, lsl #2
     490:	00000abc 	undefined instruction 0x00000abc
     494:	00000b38 	andeq	r0, r0, r8, lsr fp
     498:	000002db 	ldrdeq	r0, [r0], -fp
     49c:	000001f5 	strdeq	r0, [r0], -r5
     4a0:	00018a04 	andeq	r8, r1, r4, lsl #20
     4a4:	369d0100 	ldrcc	r0, [sp], r0, lsl #2
     4a8:	02000001 	andeq	r0, r0, #1
     4ac:	63046c91 	movwvs	r6, #19601	; 0x4c91
     4b0:	01000001 	tsteq	r0, r1
     4b4:	00013d9d 	muleq	r1, sp, sp
     4b8:	68910200 	ldmvs	r1, {r9}
     4bc:	00015e04 	andeq	r5, r1, r4, lsl #28
     4c0:	4a9d0100 	bmi	fe7408c8 <bss_end+0xfe73d5f0>
     4c4:	02000001 	andeq	r0, r0, #1
     4c8:	69066491 	stmdbvs	r6, {r0, r4, r7, sl, sp, lr}
     4cc:	4a9f0100 	bmi	fe7c08d4 <bss_end+0xfe7bd5fc>
     4d0:	02000001 	andeq	r0, r0, #1
     4d4:	0a007491 	beq	1d720 <bss_end+0x1a448>
     4d8:	0001a101 	andeq	sl, r1, r1, lsl #2
     4dc:	01aa0100 	undefined instruction 0x01aa0100
     4e0:	00000136 	andeq	r0, r0, r6, lsr r1
     4e4:	00000b38 	andeq	r0, r0, r8, lsr fp
     4e8:	00000bd8 	ldrdeq	r0, [r0], -r8
     4ec:	00000306 	andeq	r0, r0, r6, lsl #6
     4f0:	0001b104 	andeq	fp, r1, r4, lsl #2
     4f4:	36aa0100 	strtcc	r0, [sl], r0, lsl #2
     4f8:	02000001 	andeq	r0, r0, #1
     4fc:	72066c91 	andvc	r6, r6, #37120	; 0x9100
     500:	01007465 	tsteq	r0, r5, ror #8
     504:	000136ac 	andeq	r3, r1, ip, lsr #13
     508:	74910200 	ldrvc	r0, [r1], #512	; 0x200
     50c:	00370000 	eorseq	r0, r7, r0
     510:	00020000 	andeq	r0, r2, r0
     514:	0000021b 	andeq	r0, r0, fp, lsl r2
     518:	005c0104 	subseq	r0, ip, r4, lsl #2
     51c:	d8010000 	stmdale	r1, {}
     520:	00000001 	andeq	r0, r0, r1
     524:	d8000000 	stmdale	r0, {}
     528:	ec00000b 	stc	0, cr0, [r0], {11}
     52c:	0500000b 	streq	r0, [r0, #-11]
     530:	02000002 	andeq	r0, r0, #2
     534:	0001ce01 	andeq	ip, r1, r1, lsl #28
     538:	01130100 	tsteq	r3, r0, lsl #2
     53c:	00000bd8 	ldrdeq	r0, [r0], -r8
     540:	00000bec 	andeq	r0, r0, ip, ror #23
     544:	00000331 	andeq	r0, r0, r1, lsr r3
     548:	00023b00 	andeq	r3, r2, r0, lsl #22
     54c:	44000200 	strmi	r0, [r0], #-512	; 0x200
     550:	04000002 	streq	r0, [r0], #-2
     554:	00005c01 	andeq	r5, r0, r1, lsl #24
     558:	01eb0100 	mvneq	r0, r0, lsl #2
     55c:	00000000 	andeq	r0, r0, r0
     560:	0bec0000 	bleq	ffb00568 <bss_end+0xffafd290>
     564:	12280000 	eorne	r0, r8, #0
     568:	02430000 	subeq	r0, r3, #0
     56c:	26020000 	strcs	r0, [r2], -r0
     570:	02000002 	andeq	r0, r0, #2
     574:	00003028 	andeq	r3, r0, r8, lsr #32
     578:	01ff0300 	mvnseq	r0, r0, lsl #6
     57c:	48040000 	stmdami	r4, {}
     580:	04000000 	streq	r0, [r0]
     584:	00000245 	andeq	r0, r0, r5, asr #4
     588:	00000048 	andeq	r0, r0, r8, asr #32
     58c:	01002302 	tsteq	r0, r2, lsl #6
     590:	02040500 	andeq	r0, r4, #0
     594:	00000201 	andeq	r0, r0, r1, lsl #4
     598:	00256602 	eoreq	r6, r5, r2, lsl #12
     59c:	01060000 	tsteq	r6, r0
     5a0:	0000021b 	andeq	r0, r0, fp, lsl r2
     5a4:	ec012301 	stc	3, cr2, [r1], {1}
     5a8:	6800000b 	stmdavs	r0, {r0, r1, r3}
     5ac:	5c00000c 	stcpl	0, cr0, [r0], {12}
     5b0:	07000003 	streq	r0, [r0, -r3]
     5b4:	00023501 	andeq	r3, r2, r1, lsl #10
     5b8:	01310100 	teqeq	r1, r0, lsl #2
     5bc:	00000c68 	andeq	r0, r0, r8, ror #24
     5c0:	00000cb0 	undefined instruction 0x00000cb0
     5c4:	00000387 	andeq	r0, r0, r7, lsl #7
     5c8:	00000090 	muleq	r0, r0, r0
     5cc:	01006308 	tsteq	r0, r8, lsl #6
     5d0:	00009031 	andeq	r9, r0, r1, lsr r0
     5d4:	77910200 	ldrvc	r0, [r1, r0, lsl #4]
     5d8:	08010900 	stmdaeq	r1, {r8, fp}
     5dc:	00000150 	andeq	r0, r0, r0, asr r1
     5e0:	0209010a 	andeq	r0, r9, #-2147483646	; 0x80000002
     5e4:	3d010000 	stccc	0, cr0, [r1]
     5e8:	00009001 	andeq	r9, r0, r1
     5ec:	000cb000 	andeq	fp, ip, r0
     5f0:	000cf000 	andeq	pc, ip, r0
     5f4:	0003b200 	andeq	fp, r3, r0, lsl #4
     5f8:	3a010700 	bcc	42200 <bss_end+0x3ef28>
     5fc:	01000002 	tsteq	r0, r2
     600:	0cf00146 	ldfeqe	f0, [r0], #280	; 0x118
     604:	0d3c0000 	ldceq	0, cr0, [ip]
     608:	03dd0000 	bicseq	r0, sp, #0
     60c:	00d60000 	sbcseq	r0, r6, r0
     610:	73080000 	movwvc	r0, #32768	; 0x8000
     614:	d6460100 	strble	r0, [r6], -r0, lsl #2
     618:	02000000 	andeq	r0, r0, #0
     61c:	0b007491 	bleq	1d868 <bss_end+0x1a590>
     620:	00009004 	andeq	r9, r0, r4
     624:	f9010c00 	undefined instruction 0xf9010c00
     628:	01000001 	tsteq	r0, r1
     62c:	0120014e 	teqeq	r0, lr, asr #2
     630:	0d3c0000 	ldceq	0, cr0, [ip]
     634:	0dc80000 	stcleq	0, cr0, [r8]
     638:	04080000 	streq	r0, [r8]
     63c:	01200000 	teqeq	r0, r0
     640:	73080000 	movwvc	r0, #32768	; 0x8000
     644:	204e0100 	subcs	r0, lr, r0, lsl #2
     648:	02000001 	andeq	r0, r0, #1
     64c:	400d6c91 	mulmi	sp, r1, ip
     650:	01000002 	tsteq	r0, r2
     654:	00012050 	andeq	r2, r1, r0, asr r0
     658:	70910200 	addsvc	r0, r1, r0, lsl #4
     65c:	0100630e 	tsteq	r0, lr, lsl #6
     660:	00012651 	andeq	r2, r1, r1, asr r6
     664:	77910200 	ldrvc	r0, [r1, r0, lsl #4]
     668:	26040b00 	strcs	r0, [r4], -r0, lsl #22
     66c:	09000001 	stmdbeq	r0, {r0}
     670:	01590801 	cmpeq	r9, r1, lsl #16
     674:	01070000 	tsteq	r7, r0
     678:	000001e6 	andeq	r0, r0, r6, ror #3
     67c:	c8016001 	stmdagt	r1, {r0, sp, lr}
     680:	d800000d 	stmdale	r0, {r0, r2, r3}
     684:	3300000e 	movwcc	r0, #14
     688:	6d000004 	stcvs	0, cr0, [r0, #-16]
     68c:	08000001 	stmdaeq	r0, {r0}
     690:	6001006e 	andvs	r0, r1, lr, rrx
     694:	0000016d 	andeq	r0, r0, sp, ror #2
     698:	086c9102 	stmdaeq	ip!, {r1, r8, ip, pc}^
     69c:	00667562 	rsbeq	r7, r6, r2, ror #10
     6a0:	01206001 	teqeq	r0, r1
     6a4:	91020000 	tstls	r2, r0
     6a8:	00690e68 	rsbeq	r0, r9, r8, ror #28
     6ac:	016d6201 	cmneq	sp, r1, lsl #4
     6b0:	91020000 	tstls	r2, r0
     6b4:	040f0074 	streq	r0, [pc], #116	; 6bc <main+0x4c>
     6b8:	746e6905 	strbtvc	r6, [lr], #-2309	; 0x905
     6bc:	0e010700 	cdpeq	7, 0, cr0, cr1, cr0, {0}
     6c0:	01000002 	tsteq	r0, r2
     6c4:	0ed8016f 	cdpeq	1, 13, cr0, cr8, cr15, {3}
     6c8:	104c0000 	subne	r0, ip, r0
     6cc:	045e0000 	ldrbeq	r0, [lr]
     6d0:	01b40000 	undefined instruction 0x01b40000
     6d4:	6e080000 	cdpvs	0, 0, cr0, cr8, cr0, {0}
     6d8:	6d6f0100 	stfvse	f0, [pc]
     6dc:	02000001 	andeq	r0, r0, #1
     6e0:	62086c91 	andvs	r6, r8, #37120	; 0x9100
     6e4:	01006675 	tsteq	r0, r5, ror r6
     6e8:	0001206f 	andeq	r2, r1, pc, rrx
     6ec:	68910200 	ldmvs	r1, {r9}
     6f0:	0100690e 	tsteq	r0, lr, lsl #18
     6f4:	00016d71 	andeq	r6, r1, r1, ror sp
     6f8:	74910200 	ldrvc	r0, [r1], #512	; 0x200
     6fc:	13010c00 	movwne	r0, #7168	; 0x1c00
     700:	01000002 	tsteq	r0, r2
     704:	016d0185 	smulbbeq	sp, r5, r1
     708:	104c0000 	subne	r0, ip, r0
     70c:	12280000 	eorne	r0, r8, #0
     710:	04890000 	streq	r0, [r9]
     714:	02200000 	eoreq	r0, r0, #0
     718:	66080000 	strvs	r0, [r8], -r0
     71c:	0100746d 	tsteq	r0, sp, ror #8
     720:	00022085 	andeq	r2, r2, r5, lsl #1
     724:	00910200 	addseq	r0, r1, r0, lsl #4
     728:	70610e10 	rsbvc	r0, r1, r0, lsl lr
     72c:	4a870100 	bmi	fe1c0b34 <bss_end+0xfe1bd85c>
     730:	02000000 	andeq	r0, r0, #0
     734:	630e6891 	movwvs	r6, #59537	; 0xe891
     738:	26880100 	strcs	r0, [r8], r0, lsl #2
     73c:	02000001 	andeq	r0, r0, #1
     740:	640e6f91 	strvs	r6, [lr], #-3985	; 0xf91
     744:	6d890100 	stfvss	f0, [r9]
     748:	02000001 	andeq	r0, r0, #1
     74c:	730e7091 	movwvc	r7, #57489	; 0xe091
     750:	208a0100 	addcs	r0, sl, r0, lsl #2
     754:	02000001 	andeq	r0, r0, #1
     758:	620e7491 	andvs	r7, lr, #-1862270976	; 0x91000000
     75c:	01006675 	tsteq	r0, r5, ror r6
     760:	00022b8b 	andeq	r2, r2, fp, lsl #23
     764:	48910200 	ldmmi	r1, {r9}
     768:	26040b00 	strcs	r0, [r4], -r0, lsl #22
     76c:	11000002 	tstne	r0, r2
     770:	00000126 	andeq	r0, r0, r6, lsr #2
     774:	00012612 	andeq	r2, r1, r2, lsl r6
     778:	00023b00 	andeq	r3, r2, r0, lsl #22
     77c:	023b1300 	eorseq	r1, fp, #0
     780:	001f0000 	andseq	r0, pc, r0
     784:	00070414 	andeq	r0, r7, r4, lsl r4
     788:	00000130 	andeq	r0, r0, r0, lsr r1
     78c:	03530002 	cmpeq	r3, #2
     790:	01040000 	tsteq	r4, r0
     794:	0000005c 	andeq	r0, r0, ip, asr r0
     798:	00025b01 	andeq	r5, r2, r1, lsl #22
     79c:	00000000 	andeq	r0, r0, r0
     7a0:	00122800 	andseq	r2, r2, r0, lsl #16
     7a4:	00138400 	andseq	r8, r3, r0, lsl #8
     7a8:	00034300 	andeq	r4, r3, r0, lsl #6
     7ac:	8e010200 	cdphi	2, 0, cr0, cr1, cr0, {0}
     7b0:	01000002 	tsteq	r0, r2
     7b4:	12280113 	eorne	r0, r8, #-1073741820	; 0xc0000004
     7b8:	12840000 	addne	r0, r4, #0
     7bc:	04c00000 	strbeq	r0, [r0]
     7c0:	00690000 	rsbeq	r0, r9, r0
     7c4:	51030000 	tstpl	r3, r0
     7c8:	01000000 	tsteq	r0, r0
     7cc:	00006913 	andeq	r6, r0, r3, lsl r9
     7d0:	6c910200 	lfmvs	f0, 4, [r1], {0}	; (ldcvs 2, cr0, [r1], {0})
     7d4:	00008304 	andeq	r8, r0, r4, lsl #6
     7d8:	69240100 	stmdbvs	r4!, {r8}
     7dc:	02000000 	andeq	r0, r0, #0
     7e0:	44047091 	strmi	r7, [r4], #-145	; 0x91
     7e4:	01000000 	tsteq	r0, r0
     7e8:	00007025 	andeq	r7, r0, r5, lsr #32
     7ec:	74910200 	ldrvc	r0, [r1], #512	; 0x200
     7f0:	07040500 	streq	r0, [r4, -r0, lsl #10]
     7f4:	00000071 	andeq	r0, r0, r1, ror r0
     7f8:	00690406 	rsbeq	r0, r9, r6, lsl #8
     7fc:	01020000 	tsteq	r2, r0
     800:	00000275 	andeq	r0, r0, r5, ror r2
     804:	84012d01 	strhi	r2, [r1], #-3329	; 0xd01
     808:	a0000012 	andge	r0, r0, r2, lsl r0
     80c:	eb000012 	bl	85c <wait_RnB+0x10>
     810:	9e000004 	cdpls	0, 0, cr0, cr0, cr4, {0}
     814:	07000000 	streq	r0, [r0, -r0]
     818:	00646970 	rsbeq	r6, r4, r0, ror r9
     81c:	009e2d01 	addseq	r2, lr, r1, lsl #26
     820:	91020000 	tstls	r2, r0
     824:	04050074 	streq	r0, [r5], #-116	; 0x74
     828:	00007607 	andeq	r7, r0, r7, lsl #12
     82c:	4a010200 	bmi	41034 <bss_end+0x3dd5c>
     830:	01000002 	tsteq	r0, r2
     834:	12a00137 	adcne	r0, r0, #-1073741811	; 0xc000000d
     838:	13180000 	tstne	r8, #0
     83c:	05160000 	ldreq	r0, [r6]
     840:	00f70000 	rscseq	r0, r7, r0
     844:	70070000 	andvc	r0, r7, r0
     848:	01006469 	tsteq	r0, r9, ror #8
     84c:	00009e37 	andeq	r9, r0, r7, lsr lr
     850:	64910200 	ldrvs	r0, [r1], #512	; 0x200
     854:	00008304 	andeq	r8, r0, r4, lsl #6
     858:	69480100 	stmdbvs	r8, {r8}^
     85c:	02000000 	andeq	r0, r0, #0
     860:	7e046c91 	mcrvc	12, 0, r6, cr4, cr1, {4}
     864:	01000002 	tsteq	r0, r2
     868:	00006949 	andeq	r6, r0, r9, asr #18
     86c:	70910200 	addsvc	r0, r1, r0, lsl #4
     870:	00004404 	andeq	r4, r0, r4, lsl #8
     874:	704a0100 	subvc	r0, sl, r0, lsl #2
     878:	02000000 	andeq	r0, r0, #0
     87c:	02007491 	andeq	r7, r0, #-1862270976	; 0x91000000
     880:	00028601 	andeq	r8, r2, r1, lsl #12
     884:	015c0100 	cmpeq	ip, r0, lsl #2
     888:	00001318 	andeq	r1, r0, r8, lsl r3
     88c:	00001360 	andeq	r1, r0, r0, ror #6
     890:	00000541 	andeq	r0, r0, r1, asr #10
     894:	0000011f 	andeq	r0, r0, pc, lsl r1
     898:	64697007 	strbtvs	r7, [r9], #-7
     89c:	9e5c0100 	rdflse	f0, f4, f0
     8a0:	02000000 	andeq	r0, r0, #0
     8a4:	08007491 	stmdaeq	r0, {r0, r4, r7, sl, ip, sp, lr}
     8a8:	00026a01 	andeq	r6, r2, r1, lsl #20
     8ac:	60700100 	rsbsvs	r0, r0, r0, lsl #2
     8b0:	84000013 	strhi	r0, [r0], #-19
     8b4:	6c000013 	stcvs	0, cr0, [r0], {19}
     8b8:	00000005 	andeq	r0, r0, r5
     8bc:	00000093 	muleq	r0, r3, r0
     8c0:	03d20002 	bicseq	r0, r2, #2
     8c4:	01040000 	tsteq	r4, r0
     8c8:	0000005c 	andeq	r0, r0, ip, asr r0
     8cc:	0002ab01 	andeq	sl, r2, r1, lsl #22
     8d0:	00000000 	andeq	r0, r0, r0
     8d4:	00138400 	andseq	r8, r3, r0, lsl #8
     8d8:	00148000 	andseq	r8, r4, r0
     8dc:	00039f00 	andeq	r9, r3, r0, lsl #30
     8e0:	b8010200 	stmdalt	r1, {r9}
     8e4:	01000002 	tsteq	r0, r2
     8e8:	13840116 	orrne	r0, r4, #-2147483643	; 0x80000005
     8ec:	13c40000 	bicne	r0, r4, #0
     8f0:	05970000 	ldreq	r0, [r7]
     8f4:	01020000 	tsteq	r2, r0
     8f8:	000002c2 	andeq	r0, r0, r2, asr #5
     8fc:	c4012201 	strgt	r2, [r1], #-513	; 0x201
     900:	04000013 	streq	r0, [r0], #-19
     904:	c2000014 	andgt	r0, r0, #20
     908:	03000005 	movweq	r0, #5
     90c:	0002a201 	andeq	sl, r2, r1, lsl #4
     910:	042a0100 	strteq	r0, [sl], #-256	; 0x100
     914:	38000014 	stmdacc	r0, {r2, r4}
     918:	ed000014 	stc	0, cr0, [r0, #-80]	; 0xffffffb0
     91c:	04000005 	streq	r0, [r0], #-5
     920:	0002d301 	andeq	sp, r2, r1, lsl #6
     924:	7b320100 	blvc	c80d2c <bss_end+0xc7da54>
     928:	38000000 	stmdacc	r0, {}
     92c:	5c000014 	stcpl	0, cr0, [r0], {20}
     930:	18000014 	stmdane	r0, {r2, r4}
     934:	05000006 	streq	r0, [r0, #-6]
     938:	6e690504 	cdpvs	5, 6, cr0, cr9, cr4, {0}
     93c:	01030074 	tsteq	r3, r4, ror r0
     940:	000002cb 	andeq	r0, r0, fp, asr #5
     944:	145c3701 	ldrbne	r3, [ip], #-1793	; 0x701
     948:	14800000 	strne	r0, [r0]
     94c:	06430000 	strbeq	r0, [r3], -r0
     950:	47000000 	strmi	r0, [r0, -r0]
     954:	02000007 	andeq	r0, r0, #7
     958:	00042e00 	andeq	r2, r4, r0, lsl #28
     95c:	5c010400 	cfstrspl	mvf0, [r1], {0}
     960:	01000000 	tsteq	r0, r0
     964:	0000038d 	andeq	r0, r0, sp, lsl #7
     968:	00000000 	andeq	r0, r0, r0
     96c:	00001480 	andeq	r1, r0, r0, lsl #9
     970:	00002204 	andeq	r2, r0, r4, lsl #4
     974:	000003ec 	andeq	r0, r0, ip, ror #7
     978:	031f0102 	tsteq	pc, #-2147483648	; 0x80000000
     97c:	12010000 	andne	r0, r1, #0
     980:	00148001 	andseq	r8, r4, r1
     984:	0014f000 	andseq	pc, r4, r0
     988:	00066e00 	andeq	r6, r6, r0, lsl #28
     98c:	00006300 	andeq	r6, r0, r0, lsl #6
     990:	006e0300 	rsbeq	r0, lr, r0, lsl #6
     994:	00631201 	rsbeq	r1, r3, r1, lsl #4
     998:	91020000 	tstls	r2, r0
     99c:	0069046c 	rsbeq	r0, r9, ip, ror #8
     9a0:	00631401 	rsbeq	r1, r3, r1, lsl #8
     9a4:	91020000 	tstls	r2, r0
     9a8:	006a0470 	rsbeq	r0, sl, r0, ror r4
     9ac:	00631401 	rsbeq	r1, r3, r1, lsl #8
     9b0:	91020000 	tstls	r2, r0
     9b4:	04050074 	streq	r0, [r5], #-116	; 0x74
     9b8:	746e6905 	strbtvc	r6, [lr], #-2309	; 0x905
     9bc:	f0010600 	undefined instruction 0xf0010600
     9c0:	01000002 	tsteq	r0, r2
     9c4:	00ae011e 	adceq	r0, lr, lr, lsl r1
     9c8:	14f00000 	ldrbtne	r0, [r0]
     9cc:	15580000 	ldrbne	r0, [r8]
     9d0:	06990000 	ldreq	r0, [r9], r0
     9d4:	00ae0000 	adceq	r0, lr, r0
     9d8:	6e030000 	cdpvs	0, 0, cr0, cr3, cr0, {0}
     9dc:	ae1e0100 	mufgee	f0, f6, f0
     9e0:	02000000 	andeq	r0, r0, #0
     9e4:	69046c91 	stmdbvs	r4, {r0, r4, r7, sl, fp, sp, lr}
     9e8:	63200100 	teqvs	r0, #0
     9ec:	02000000 	andeq	r0, r0, #0
     9f0:	6d047091 	stcvs	0, cr7, [r4, #-580]	; 0xfffffdbc
     9f4:	01006c75 	tsteq	r0, r5, ror ip
     9f8:	00006320 	andeq	r6, r0, r0, lsr #6
     9fc:	74910200 	ldrvc	r0, [r1], #512	; 0x200
     a00:	07040700 	streq	r0, [r4, -r0, lsl #14]
     a04:	00000076 	andeq	r0, r0, r6, ror r0
     a08:	03660106 	cmneq	r6, #-2147483647	; 0x80000001
     a0c:	2b010000 	blcs	40a14 <bss_end+0x3d73c>
     a10:	0000ae01 	andeq	sl, r0, r1, lsl #28
     a14:	00155800 	andseq	r5, r5, r0, lsl #16
     a18:	00162c00 	andseq	r2, r6, r0, lsl #24
     a1c:	0006c400 	andeq	ip, r6, r0, lsl #8
     a20:	00010700 	andeq	r0, r1, r0, lsl #14
     a24:	72610300 	rsbvc	r0, r1, #0
     a28:	2b010072 	blcs	40bf8 <bss_end+0x3d920>
     a2c:	00000107 	andeq	r0, r0, r7, lsl #2
     a30:	045c9102 	ldrbeq	r9, [ip], #-258	; 0x102
     a34:	006d7573 	rsbeq	r7, sp, r3, ror r5
     a38:	00ae2d01 	adceq	r2, lr, r1, lsl #26
     a3c:	91020000 	tstls	r2, r0
     a40:	00690464 	rsbeq	r0, r9, r4, ror #8
     a44:	00ae2d01 	adceq	r2, lr, r1, lsl #26
     a48:	91020000 	tstls	r2, r0
     a4c:	006a0468 	rsbeq	r0, sl, r8, ror #8
     a50:	00ae2d01 	adceq	r2, lr, r1, lsl #26
     a54:	91020000 	tstls	r2, r0
     a58:	0408006c 	streq	r0, [r8], #-108	; 0x6c
     a5c:	0000010d 	andeq	r0, r0, sp, lsl #2
     a60:	59080107 	stmdbpl	r8, {r0, r1, r2, r8}
     a64:	06000001 	streq	r0, [r0], -r1
     a68:	00034b01 	andeq	r4, r3, r1, lsl #22
     a6c:	013c0100 	teqeq	ip, r0, lsl #2
     a70:	00000063 	andeq	r0, r0, r3, rrx
     a74:	0000162c 	andeq	r1, r0, ip, lsr #12
     a78:	000016e4 	andeq	r1, r0, r4, ror #13
     a7c:	000006ef 	andeq	r0, r0, pc, ror #13
     a80:	00000162 	andeq	r0, r0, r2, ror #2
     a84:	01007303 	tsteq	r0, r3, lsl #6
     a88:	0001073c 	andeq	r0, r1, ip, lsr r7
     a8c:	64910200 	ldrvs	r0, [r1], #512	; 0x200
     a90:	01007004 	tsteq	r0, r4
     a94:	0001073e 	andeq	r0, r1, lr, lsr r7
     a98:	6c910200 	lfmvs	f0, 4, [r1], {0}	; (ldcvs 2, cr0, [r1], {0})
     a9c:	01006304 	tsteq	r0, r4, lsl #6
     aa0:	00010d3f 	andeq	r0, r1, pc, lsr sp
     aa4:	73910200 	orrsvc	r0, r1, #0
     aa8:	01006904 	tsteq	r0, r4, lsl #18
     aac:	00006340 	andeq	r6, r0, r0, asr #6
     ab0:	74910200 	ldrvc	r0, [r1], #512	; 0x200
     ab4:	25010600 	strcs	r0, [r1, #-1536]	; 0x600
     ab8:	01000003 	tsteq	r0, r3
     abc:	0107014f 	tsteq	r7, pc, asr #2
     ac0:	16e40000 	strbtne	r0, [r4], r0
     ac4:	175c0000 	ldrbne	r0, [ip, -r0]
     ac8:	071a0000 	ldreq	r0, [sl, -r0]
     acc:	01aa0000 	undefined instruction 0x01aa0000
     ad0:	1a090000 	bne	240ad8 <bss_end+0x23d800>
     ad4:	01000003 	tsteq	r0, r3
     ad8:	0001074f 	andeq	r0, r1, pc, asr #14
     adc:	6c910200 	lfmvs	f0, 4, [r1], {0}	; (ldcvs 2, cr0, [r1], {0})
     ae0:	63727303 	cmnvs	r2, #201326592	; 0xc000000
     ae4:	aa4f0100 	bge	13c0eec <bss_end+0x13bdc14>
     ae8:	02000001 	andeq	r0, r0, #1
     aec:	74046891 	strvc	r6, [r4], #-2193	; 0x891
     af0:	0100706d 	tsteq	r0, sp, rrx
     af4:	00010751 	andeq	r0, r1, r1, asr r7
     af8:	74910200 	ldrvc	r0, [r1], #512	; 0x200
     afc:	b0040800 	andlt	r0, r4, r0, lsl #16
     b00:	0a000001 	beq	b0c <nand_to_ram+0x50>
     b04:	0000010d 	andeq	r0, r0, sp, lsl #2
     b08:	03330106 	teqeq	r3, #-2147483647	; 0x80000001
     b0c:	57010000 	strpl	r0, [r1, -r0]
     b10:	00010701 	andeq	r0, r1, r1, lsl #14
     b14:	00175c00 	andseq	r5, r7, r0, lsl #24
     b18:	00180000 	andseq	r0, r8, r0
     b1c:	00074500 	andeq	r4, r7, r0, lsl #10
     b20:	00020b00 	andeq	r0, r2, r0, lsl #22
     b24:	031a0900 	tsteq	sl, #0
     b28:	57010000 	strpl	r0, [r1, -r0]
     b2c:	00000107 	andeq	r0, r0, r7, lsl #2
     b30:	036c9102 	cmneq	ip, #-2147483648	; 0x80000000
     b34:	00637273 	rsbeq	r7, r3, r3, ror r2
     b38:	01aa5701 	undefined instruction 0x01aa5701
     b3c:	91020000 	tstls	r2, r0
     b40:	036b0968 	cmneq	fp, #1703936	; 0x1a0000
     b44:	57010000 	strpl	r0, [r1, -r0]
     b48:	00000063 	andeq	r0, r0, r3, rrx
     b4c:	04649102 	strbteq	r9, [r4], #-258	; 0x102
     b50:	00706d74 	rsbseq	r6, r0, r4, ror sp
     b54:	01075901 	tsteq	r7, r1, lsl #18
     b58:	91020000 	tstls	r2, r0
     b5c:	01060074 	tsteq	r6, r4, ror r0
     b60:	0000032c 	andeq	r0, r0, ip, lsr #6
     b64:	07016001 	streq	r6, [r1, -r1]
     b68:	00000001 	andeq	r0, r0, r1
     b6c:	98000018 	stmdals	r0, {r3, r4}
     b70:	70000018 	andvc	r0, r0, r8, lsl r0
     b74:	53000007 	movwpl	r0, #7
     b78:	09000002 	stmdbeq	r0, {r1}
     b7c:	0000031a 	andeq	r0, r0, sl, lsl r3
     b80:	01076001 	tsteq	r7, r1
     b84:	91020000 	tstls	r2, r0
     b88:	7273036c 	rsbsvc	r0, r3, #-1342177279	; 0xb0000001
     b8c:	60010063 	andvs	r0, r1, r3, rrx
     b90:	000001aa 	andeq	r0, r0, sl, lsr #3
     b94:	04689102 	strbteq	r9, [r8], #-258	; 0x102
     b98:	00706d74 	rsbseq	r6, r0, r4, ror sp
     b9c:	01076201 	tsteq	r7, r1, lsl #4
     ba0:	91020000 	tstls	r2, r0
     ba4:	01060074 	tsteq	r6, r4, ror r0
     ba8:	00000343 	andeq	r0, r0, r3, asr #6
     bac:	07016b01 	streq	r6, [r1, -r1, lsl #22]
     bb0:	98000001 	stmdals	r0, {r0}
     bb4:	6c000018 	stcvs	0, cr0, [r0], {24}
     bb8:	9b000019 	blls	c24 <uart0_init+0x38>
     bbc:	a9000007 	stmdbge	r0, {r0, r1, r2}
     bc0:	09000002 	stmdbeq	r0, {r1}
     bc4:	0000031a 	andeq	r0, r0, sl, lsl r3
     bc8:	01076b01 	tsteq	r7, r1, lsl #22
     bcc:	91020000 	tstls	r2, r0
     bd0:	7273036c 	rsbsvc	r0, r3, #-1342177279	; 0xb0000001
     bd4:	6b010063 	blvs	40d68 <bss_end+0x3da90>
     bd8:	000001aa 	andeq	r0, r0, sl, lsr #3
     bdc:	09689102 	stmdbeq	r8!, {r1, r8, ip, pc}^
     be0:	0000036b 	andeq	r0, r0, fp, ror #6
     be4:	00636b01 	rsbeq	r6, r3, r1, lsl #22
     be8:	91020000 	tstls	r2, r0
     bec:	6d740464 	cfldrdvs	mvd0, [r4, #-400]!	; 0xfffffe70
     bf0:	6d010070 	stcvs	0, cr0, [r1, #-448]	; 0xfffffe40
     bf4:	00000107 	andeq	r0, r0, r7, lsl #2
     bf8:	00749102 	rsbseq	r9, r4, r2, lsl #2
     bfc:	03500106 	cmpeq	r0, #-2147483647	; 0x80000001
     c00:	7c010000 	stcvc	0, cr0, [r1], {0}
     c04:	00006301 	andeq	r6, r0, r1, lsl #6
     c08:	00196c00 	andseq	r6, r9, r0, lsl #24
     c0c:	001a1400 	andseq	r1, sl, r0, lsl #8
     c10:	0007c600 	andeq	ip, r7, r0, lsl #12
     c14:	0002ee00 	andeq	lr, r2, r0, lsl #28
     c18:	73630300 	cmnvc	r3, #0
     c1c:	aa7c0100 	bge	1f01024 <bss_end+0x1efdd4c>
     c20:	02000001 	andeq	r0, r0, #1
     c24:	63037491 	movwvs	r7, #13457	; 0x3491
     c28:	7c010074 	stcvc	0, cr0, [r1], {116}	; 0x74
     c2c:	000001aa 	andeq	r0, r0, sl, lsr #3
     c30:	0b709102 	bleq	1c25040 <bss_end+0x1c21d68>
     c34:	0000037f 	andeq	r0, r0, pc, ror r3
     c38:	02ee7e01 	rsceq	r7, lr, #16
     c3c:	54010000 	strpl	r0, [r1]
     c40:	06010700 	streq	r0, [r1], -r0, lsl #14
     c44:	00000152 	andeq	r0, r0, r2, asr r1
     c48:	03850106 	orreq	r0, r5, #-2147483647	; 0x80000001
     c4c:	87010000 	strhi	r0, [r1, -r0]
     c50:	00006301 	andeq	r6, r0, r1, lsl #6
     c54:	001a1400 	andseq	r1, sl, r0, lsl #8
     c58:	001ad800 	andseq	sp, sl, r0, lsl #16
     c5c:	0007f100 	andeq	pc, r7, r0, lsl #2
     c60:	00034800 	andeq	r4, r3, r0, lsl #16
     c64:	73630300 	cmnvc	r3, #0
     c68:	aa870100 	bge	fe1c1070 <bss_end+0xfe1bdd98>
     c6c:	02000001 	andeq	r0, r0, #1
     c70:	63037491 	movwvs	r7, #13457	; 0x3491
     c74:	87010074 	smlsdxhi	r1, r4, r0, r0
     c78:	000001aa 	andeq	r0, r0, sl, lsr #3
     c7c:	09709102 	ldmdbeq	r0!, {r1, r8, ip, pc}^
     c80:	0000036b 	andeq	r0, r0, fp, ror #6
     c84:	00638701 	rsbeq	r8, r3, r1, lsl #14
     c88:	91020000 	tstls	r2, r0
     c8c:	037f0b6c 	cmneq	pc, #110592	; 0x1b000
     c90:	89010000 	stmdbhi	r1, {}
     c94:	000002ee 	andeq	r0, r0, lr, ror #5
     c98:	06005401 	streq	r5, [r0], -r1, lsl #8
     c9c:	00030c01 	andeq	r0, r3, r1, lsl #24
     ca0:	01930100 	orrseq	r0, r3, r0, lsl #2
     ca4:	00000107 	andeq	r0, r0, r7, lsl #2
     ca8:	00001ad8 	ldrdeq	r1, [r0], -r8
     cac:	00001b40 	andeq	r1, r0, r0, asr #22
     cb0:	0000081c 	andeq	r0, r0, ip, lsl r8
     cb4:	0000037e 	andeq	r0, r0, lr, ror r3
     cb8:	01007303 	tsteq	r0, r3, lsl #6
     cbc:	0001aa93 	muleq	r1, r3, sl
     cc0:	74910200 	ldrvc	r0, [r1], #512	; 0x200
     cc4:	01006303 	tsteq	r0, r3, lsl #6
     cc8:	00006393 	muleq	r0, r3, r3
     ccc:	70910200 	addsvc	r0, r1, r0, lsl #4
     cd0:	13010600 	movwne	r0, #5632	; 0x1600
     cd4:	01000003 	tsteq	r0, r3
     cd8:	0063019a 	mlseq	r3, sl, r1, r0
     cdc:	1b400000 	blne	1000ce4 <bss_end+0xffda0c>
     ce0:	1b940000 	blne	fe500ce8 <bss_end+0xfe4fda10>
     ce4:	08470000 	stmdaeq	r7, {}^
     ce8:	03b50000 	undefined instruction 0x03b50000
     cec:	73030000 	movwvc	r0, #12288	; 0x3000
     cf0:	aa9a0100 	bge	fe6810f8 <bss_end+0xfe67de20>
     cf4:	02000001 	andeq	r0, r0, #1
     cf8:	73046c91 	movwvc	r6, #19601	; 0x4c91
     cfc:	9c010063 	stcls	0, cr0, [r1], {99}	; 0x63
     d00:	000001aa 	andeq	r0, r0, sl, lsr #3
     d04:	00749102 	rsbseq	r9, r4, r2, lsl #2
     d08:	03570106 	cmpeq	r7, #-2147483647	; 0x80000001
     d0c:	a2010000 	andge	r0, r1, #0
     d10:	00006301 	andeq	r6, r0, r1, lsl #6
     d14:	001b9400 	andseq	r9, fp, r0, lsl #8
     d18:	001c1400 	andseq	r1, ip, r0, lsl #8
     d1c:	00087200 	andeq	r7, r8, r0, lsl #4
     d20:	0003fa00 	andeq	pc, r3, r0, lsl #20
     d24:	00730300 	rsbseq	r0, r3, r0, lsl #6
     d28:	01aaa201 	undefined instruction 0x01aaa201
     d2c:	91020000 	tstls	r2, r0
     d30:	036b096c 	cmneq	fp, #1769472	; 0x1b0000
     d34:	a2010000 	andge	r0, r1, #0
     d38:	00000063 	andeq	r0, r0, r3, rrx
     d3c:	04689102 	strbteq	r9, [r8], #-258	; 0x102
     d40:	01006373 	tsteq	r0, r3, ror r3
     d44:	0001aaa4 	andeq	sl, r1, r4, lsr #21
     d48:	74910200 	ldrvc	r0, [r1], #512	; 0x200
     d4c:	5f010600 	svcpl	0x00010600
     d50:	01000003 	tsteq	r0, r3
     d54:	006301aa 	rsbeq	r0, r3, sl, lsr #3
     d58:	1c140000 	ldcne	0, cr0, [r4], {0}
     d5c:	1cd80000 	ldclne	0, cr0, [r8], {0}
     d60:	089d0000 	ldmeq	sp, {}
     d64:	04580000 	ldrbeq	r0, [r8]
     d68:	73030000 	movwvc	r0, #12288	; 0x3000
     d6c:	aaaa0100 	bge	fea81174 <bss_end+0xfea7de9c>
     d70:	02000001 	andeq	r0, r0, #1
     d74:	e2096491 	and	r6, r9, #-1862270976	; 0x91000000
     d78:	01000002 	tsteq	r0, r2
     d7c:	0001aaaa 	andeq	sl, r1, sl, lsr #21
     d80:	60910200 	addsvs	r0, r1, r0, lsl #4
     d84:	01007004 	tsteq	r0, r4
     d88:	0001aaac 	andeq	sl, r1, ip, lsr #21
     d8c:	6c910200 	lfmvs	f0, 4, [r1], {0}	; (ldcvs 2, cr0, [r1], {0})
     d90:	01006104 	tsteq	r0, r4, lsl #2
     d94:	0001aaad 	andeq	sl, r1, sp, lsr #21
     d98:	70910200 	addsvc	r0, r1, r0, lsl #4
     d9c:	00036b0b 	andeq	r6, r3, fp, lsl #22
     da0:	63ae0100 	undefined instruction 0x63ae0100
     da4:	02000000 	andeq	r0, r0, #0
     da8:	06007491 	undefined instruction 0x06007491
     dac:	00033b01 	andeq	r3, r3, r1, lsl #22
     db0:	01bc0100 	undefined instruction 0x01bc0100
     db4:	00000107 	andeq	r0, r0, r7, lsl #2
     db8:	00001cd8 	ldrdeq	r1, [r0], -r8
     dbc:	00001d70 	andeq	r1, r0, r0, ror sp
     dc0:	000008c8 	andeq	r0, r0, r8, asr #17
     dc4:	000004ac 	andeq	r0, r0, ip, lsr #9
     dc8:	00736303 	rsbseq	r6, r3, r3, lsl #6
     dcc:	01aabc01 	undefined instruction 0x01aabc01
     dd0:	91020000 	tstls	r2, r0
     dd4:	7463036c 	strbtvc	r0, [r3], #-876	; 0x36c
     dd8:	aabc0100 	bge	fef011e0 <bss_end+0xfeefdf08>
     ddc:	02000001 	andeq	r0, r0, #1
     de0:	73046891 	movwvc	r6, #18577	; 0x4891
     de4:	01003163 	tsteq	r0, r3, ror #2
     de8:	0001aabe 	undefined instruction 0x0001aabe
     dec:	70910200 	addsvc	r0, r1, r0, lsl #4
     df0:	32637304 	rsbcc	r7, r3, #268435456	; 0x10000000
     df4:	aabe0100 	bge	fef811fc <bss_end+0xfef7df24>
     df8:	02000001 	andeq	r0, r0, #1
     dfc:	06007491 	undefined instruction 0x06007491
     e00:	0002f601 	andeq	pc, r2, r1, lsl #12
     e04:	01c80100 	biceq	r0, r8, r0, lsl #2
     e08:	000004fd 	strdeq	r0, [r0], -sp
     e0c:	00001d70 	andeq	r1, r0, r0, ror sp
     e10:	00001dec 	andeq	r1, r0, ip, ror #27
     e14:	000008f3 	strdeq	r0, [r0], -r3
     e18:	000004fd 	strdeq	r0, [r0], -sp
     e1c:	01007303 	tsteq	r0, r3, lsl #6
     e20:	0004fdc8 	andeq	pc, r4, r8, asr #27
     e24:	6c910200 	lfmvs	f0, 4, [r1], {0}	; (ldcvs 2, cr0, [r1], {0})
     e28:	01006303 	tsteq	r0, r3, lsl #6
     e2c:	000063c8 	andeq	r6, r0, r8, asr #7
     e30:	68910200 	ldmvs	r1, {r9}
     e34:	00036b09 	andeq	r6, r3, r9, lsl #22
     e38:	63c80100 	bicvs	r0, r8, #0
     e3c:	02000000 	andeq	r0, r0, #0
     e40:	78046491 	stmdavc	r4, {r0, r4, r7, sl, sp, lr}
     e44:	ca010073 	bgt	41018 <bss_end+0x3dd40>
     e48:	00000107 	andeq	r0, r0, r7, lsl #2
     e4c:	00749102 	rsbseq	r9, r4, r2, lsl #2
     e50:	0106040c 	tsteq	r6, ip, lsl #8
     e54:	00000371 	andeq	r0, r0, r1, ror r3
     e58:	fd01d101 	stc2	1, cr13, [r1, #-4]
     e5c:	ec000004 	stc	0, cr0, [r0], {4}
     e60:	7c00001d 	stcvc	0, cr0, [r0], {29}
     e64:	1e00001e 	mcrne	0, 0, r0, cr0, cr14, {0}
     e68:	61000009 	tstvs	r0, r9
     e6c:	09000005 	stmdbeq	r0, {r0, r2}
     e70:	0000031a 	andeq	r0, r0, sl, lsl r3
     e74:	04fdd101 	ldrbteq	sp, [sp], #257	; 0x101
     e78:	91020000 	tstls	r2, r0
     e7c:	7273036c 	rsbsvc	r0, r3, #-1342177279	; 0xb0000001
     e80:	d1010063 	tstle	r1, r3, rrx
     e84:	00000561 	andeq	r0, r0, r1, ror #10
     e88:	09689102 	stmdbeq	r8!, {r1, r8, ip, pc}^
     e8c:	0000036b 	andeq	r0, r0, fp, ror #6
     e90:	0063d101 	rsbeq	sp, r3, r1, lsl #2
     e94:	91020000 	tstls	r2, r0
     e98:	6d740464 	cfldrdvs	mvd0, [r4, #-400]!	; 0xfffffe70
     e9c:	d3010070 	movwle	r0, #4208	; 0x1070
     ea0:	00000107 	andeq	r0, r0, r7, lsl #2
     ea4:	04709102 	ldrbteq	r9, [r0], #-258	; 0x102
     ea8:	d3010073 	movwle	r0, #4211	; 0x1073
     eac:	00000107 	andeq	r0, r0, r7, lsl #2
     eb0:	00749102 	rsbseq	r9, r4, r2, lsl #2
     eb4:	05670408 	strbeq	r0, [r7, #-1032]!	; 0x408
     eb8:	060d0000 	streq	r0, [sp], -r0
     ebc:	0002da01 	andeq	sp, r2, r1, lsl #20
     ec0:	01da0100 	bicseq	r0, sl, r0, lsl #2
     ec4:	000004fd 	strdeq	r0, [r0], -sp
     ec8:	00001e7c 	andeq	r1, r0, ip, ror lr
     ecc:	00001f94 	muleq	r0, r4, pc
     ed0:	00000949 	andeq	r0, r0, r9, asr #18
     ed4:	000005ca 	andeq	r0, r0, sl, asr #11
     ed8:	00031a09 	andeq	r1, r3, r9, lsl #20
     edc:	fdda0100 	ldc2l	1, cr0, [sl]
     ee0:	02000004 	andeq	r0, r0, #4
     ee4:	73036c91 	movwvc	r6, #15505	; 0x3c91
     ee8:	01006372 	tsteq	r0, r2, ror r3
     eec:	000561da 	ldrdeq	r6, [r5], -sl
     ef0:	68910200 	ldmvs	r1, {r9}
     ef4:	00036b09 	andeq	r6, r3, r9, lsl #22
     ef8:	63da0100 	bicsvs	r0, sl, #0
     efc:	02000000 	andeq	r0, r0, #0
     f00:	74046491 	strvc	r6, [r4], #-1169	; 0x491
     f04:	0100706d 	tsteq	r0, sp, rrx
     f08:	000107dc 	ldrdeq	r0, [r1], -ip
     f0c:	70910200 	addsvc	r0, r1, r0, lsl #4
     f10:	01007304 	tsteq	r0, r4, lsl #6
     f14:	000107dc 	ldrdeq	r0, [r1], -ip
     f18:	74910200 	ldrvc	r0, [r1], #512	; 0x200
     f1c:	e9010600 	stmdb	r1, {r9, sl}
     f20:	01000002 	tsteq	r0, r2
     f24:	006301ed 	rsbeq	r0, r3, sp, ror #3
     f28:	1f940000 	svcne	0x00940000
     f2c:	203c0000 	eorscs	r0, ip, r0
     f30:	09740000 	ldmdbeq	r4!, {}^
     f34:	063a0000 	ldrteq	r0, [sl], -r0
     f38:	63030000 	movwvs	r0, #12288	; 0x3000
     f3c:	ed010073 	stc	0, cr0, [r1, #-460]	; 0xfffffe34
     f40:	00000561 	andeq	r0, r0, r1, ror #10
     f44:	03649102 	cmneq	r4, #-2147483648	; 0x80000000
     f48:	01007463 	tsteq	r0, r3, ror #8
     f4c:	000561ed 	andeq	r6, r5, sp, ror #3
     f50:	60910200 	addsvs	r0, r1, r0, lsl #4
     f54:	00036b09 	andeq	r6, r3, r9, lsl #22
     f58:	63ed0100 	mvnvs	r0, #0
     f5c:	02000000 	andeq	r0, r0, #0
     f60:	73045c91 	movwvc	r5, #19601	; 0x4c91
     f64:	01003175 	tsteq	r0, r5, ror r1
     f68:	00063aef 	andeq	r3, r6, pc, ror #21
     f6c:	6c910200 	lfmvs	f0, 4, [r1], {0}	; (ldcvs 2, cr0, [r1], {0})
     f70:	32757304 	rsbscc	r7, r5, #268435456	; 0x10000000
     f74:	3aef0100 	bcc	ffbc137c <bss_end+0xffbbe0a4>
     f78:	02000006 	andeq	r0, r0, #6
     f7c:	72047091 	andvc	r7, r4, #145	; 0x91
     f80:	01007365 	tsteq	r0, r5, ror #6
     f84:	000063f0 	strdeq	r6, [r0], -r0
     f88:	74910200 	ldrvc	r0, [r1], #512	; 0x200
     f8c:	40040800 	andmi	r0, r4, r0, lsl #16
     f90:	0a000006 	beq	fb0 <xtoa+0xd8>
     f94:	00000645 	andeq	r0, r0, r5, asr #12
     f98:	50080107 	andpl	r0, r8, r7, lsl #2
     f9c:	06000001 	streq	r0, [r0], -r1
     fa0:	00030401 	andeq	r0, r3, r1, lsl #8
     fa4:	01f70100 	mvnseq	r0, r0, lsl #2
     fa8:	000004fd 	strdeq	r0, [r0], -sp
     fac:	0000203c 	andeq	r2, r0, ip, lsr r0
     fb0:	000020b8 	strheq	r2, [r0], -r8
     fb4:	0000099f 	muleq	r0, pc, r9
     fb8:	0000069e 	muleq	r0, lr, r6
     fbc:	0001b109 	andeq	fp, r1, r9, lsl #2
     fc0:	fdf70100 	ldc2l	1, cr0, [r7]
     fc4:	02000004 	andeq	r0, r0, #4
     fc8:	63036c91 	movwvs	r6, #15505	; 0x3c91
     fcc:	63f70100 	mvnsvs	r0, #0
     fd0:	02000000 	andeq	r0, r0, #0
     fd4:	5e096891 	mcrpl	8, 0, r6, cr9, cr1, {4}
     fd8:	01000001 	tsteq	r0, r1
     fdc:	000063f7 	strdeq	r6, [r0], -r7
     fe0:	64910200 	ldrvs	r0, [r1], #512	; 0x200
     fe4:	01007004 	tsteq	r0, r4
     fe8:	00069ef9 	strdeq	r9, [r6], -r9
     fec:	74910200 	ldrvc	r0, [r1], #512	; 0x200
     ff0:	45040800 	strmi	r0, [r4, #-2048]	; 0x800
     ff4:	0e000006 	cdpeq	0, 0, cr0, cr0, cr6, {0}
     ff8:	00037801 	andeq	r7, r3, r1, lsl #16
     ffc:	01030100 	tsteq	r3, r0, lsl #2
    1000:	00010701 	andeq	r0, r1, r1, lsl #14
    1004:	0020b800 	eoreq	fp, r0, r0, lsl #16
    1008:	00216400 	eoreq	r6, r1, r0, lsl #8
    100c:	0009ca00 	andeq	ip, r9, r0, lsl #20
    1010:	0006fb00 	andeq	pc, r6, r0, lsl #22
    1014:	31730f00 	cmncc	r3, r0, lsl #30
    1018:	01030100 	tsteq	r3, r0, lsl #2
    101c:	000001aa 	andeq	r0, r0, sl, lsr #3
    1020:	0f6c9102 	svceq	0x006c9102
    1024:	01003273 	tsteq	r0, r3, ror r2
    1028:	01aa0103 	undefined instruction 0x01aa0103
    102c:	91020000 	tstls	r2, r0
    1030:	316c1068 	cmncc	ip, r8, rrx
    1034:	01050100 	tsteq	r5, r0, lsl #2
    1038:	00000063 	andeq	r0, r0, r3, rrx
    103c:	10709102 	rsbsne	r9, r0, r2, lsl #2
    1040:	0100326c 	tsteq	r0, ip, ror #4
    1044:	00630105 	rsbeq	r0, r3, r5, lsl #2
    1048:	91020000 	tstls	r2, r0
    104c:	01110074 	tsteq	r1, r4, ror r0
    1050:	000002fd 	strdeq	r0, [r0], -sp
    1054:	01011301 	tsteq	r1, r1, lsl #6
    1058:	000004fd 	strdeq	r0, [r0], -sp
    105c:	00002164 	andeq	r2, r0, r4, ror #2
    1060:	00002204 	andeq	r2, r0, r4, lsl #4
    1064:	000009f5 	strdeq	r0, [r0], -r5
    1068:	0100730f 	tsteq	r0, pc, lsl #6
    106c:	05610113 	strbeq	r0, [r1, #-275]!	; 0x113
    1070:	91020000 	tstls	r2, r0
    1074:	00630f6c 	rsbeq	r0, r3, ip, ror #30
    1078:	63011301 	movwvs	r1, #4865	; 0x1301
    107c:	02000000 	andeq	r0, r0, #0
    1080:	6e0f6891 	mcrvs	8, 0, r6, cr15, cr1, {4}
    1084:	01130100 	tsteq	r3, r0, lsl #2
    1088:	00000063 	andeq	r0, r0, r3, rrx
    108c:	10649102 	rsbne	r9, r4, r2, lsl #2
    1090:	15010070 	strne	r0, [r1, #-112]	; 0x70
    1094:	00063a01 	andeq	r3, r6, r1, lsl #20
    1098:	74910200 	ldrvc	r0, [r1], #512	; 0x200
    109c:	00af0000 	adceq	r0, pc, r0
    10a0:	00020000 	andeq	r0, r2, r0
    10a4:	0000052e 	andeq	r0, r0, lr, lsr #10
    10a8:	005c0104 	subseq	r0, ip, r4, lsl #2
    10ac:	c6010000 	strgt	r0, [r1], -r0
    10b0:	00000003 	andeq	r0, r0, r3
    10b4:	04000000 	streq	r0, [r0]
    10b8:	e8000022 	stmda	r0, {r1, r5}
    10bc:	03000022 	movweq	r0, #34	; 0x22
    10c0:	02000005 	andeq	r0, r0, #5
    10c4:	00039f01 	andeq	r9, r3, r1, lsl #30
    10c8:	01210100 	teqeq	r1, r0, lsl #2
    10cc:	00002204 	andeq	r2, r0, r4, lsl #4
    10d0:	000022e8 	andeq	r2, r0, r8, ror #5
    10d4:	00000a20 	andeq	r0, r0, r0, lsr #20
    10d8:	00000067 	andeq	r0, r0, r7, rrx
    10dc:	0003bc03 	andeq	fp, r3, r3, lsl #24
    10e0:	67210100 	strvs	r0, [r1, -r0, lsl #2]!
    10e4:	02000000 	andeq	r0, r0, #0
    10e8:	97036c91 	undefined instruction 0x97036c91
    10ec:	01000003 	tsteq	r0, r3
    10f0:	00006721 	andeq	r6, r0, r1, lsr #14
    10f4:	68910200 	ldmvs	r1, {r9}
    10f8:	01006904 	tsteq	r0, r4, lsl #18
    10fc:	00006e23 	andeq	r6, r0, r3, lsr #28
    1100:	74910200 	ldrvc	r0, [r1], #512	; 0x200
    1104:	05040500 	streq	r0, [r4, #-1280]	; 0x500
    1108:	000000ce 	andeq	r0, r0, lr, asr #1
    110c:	69050406 	stmdbvs	r5, {r1, r2, sl}
    1110:	0700746e 	streq	r7, [r0, -lr, ror #8]
    1114:	000003a8 	andeq	r0, r0, r8, lsr #7
    1118:	00671d01 	rsbeq	r1, r7, r1, lsl #26
    111c:	03050000 	movweq	r0, #20480	; 0x5000
    1120:	000023d4 	ldrdeq	r2, [r0], -r4
    1124:	00009a08 	andeq	r9, r0, r8, lsl #20
    1128:	00009700 	andeq	r9, r0, r0, lsl #14
    112c:	00970900 	addseq	r0, r7, r0, lsl #18
    1130:	0eff0000 	cdpeq	0, 15, cr0, cr15, cr0, {0}
    1134:	07040a00 	streq	r0, [r4, -r0, lsl #20]
    1138:	50080105 	andpl	r0, r8, r5, lsl #2
    113c:	07000001 	streq	r0, [r0, -r1]
    1140:	000003b4 	undefined instruction 0x000003b4
    1144:	00861f01 	addeq	r1, r6, r1, lsl #30
    1148:	03050000 	movweq	r0, #20480	; 0x5000
    114c:	000023d8 	ldrdeq	r2, [r0], -r8
    1150:	00004a00 	andeq	r4, r0, r0, lsl #20
    1154:	b7000200 	strlt	r0, [r0, -r0, lsl #4]
    1158:	04000005 	streq	r0, [r0], #-5
    115c:	00005c01 	andeq	r5, r0, r1, lsl #24
    1160:	03dc0100 	bicseq	r0, ip, #0
    1164:	00000000 	andeq	r0, r0, r0
    1168:	22e80000 	rsccs	r0, r8, #0
    116c:	23280000 	teqcs	r8, #0
    1170:	054a0000 	strbeq	r0, [sl]
    1174:	01020000 	tsteq	r2, r0
    1178:	000003d2 	ldrdeq	r0, [r0], -r2
    117c:	22e81301 	rsccs	r1, r8, #67108864	; 0x4000000
    1180:	23080000 	movwcs	r0, #32768	; 0x8000
    1184:	0a4b0000 	beq	12c118c <bss_end+0x12bdeb4>
    1188:	01020000 	tsteq	r2, r0
    118c:	000003d7 	ldrdeq	r0, [r0], -r7
    1190:	23081801 	movwcs	r1, #34817	; 0x8801
    1194:	23280000 	teqcs	r8, #0
    1198:	0a760000 	beq	1d811a0 <bss_end+0x1d7dec8>
    119c:	63000000 	movwvs	r0, #0
    11a0:	02000000 	andeq	r0, r0, #0
    11a4:	0005de00 	andeq	sp, r5, r0, lsl #28
    11a8:	89010400 	stmdbhi	r1, {sl}
    11ac:	28000005 	stmdacs	r0, {r0, r2}
    11b0:	3c000023 	stccc	0, cr0, [r0], {35}	; 0x23
    11b4:	61000023 	tstvs	r0, r3, lsr #32
    11b8:	6c2f7070 	stcvs	0, cr7, [pc], #-448	; 0xfffffe40
    11bc:	696c5f64 	stmdbvs	ip!, {r2, r5, r6, r8, r9, sl, fp, ip, lr}^
    11c0:	2e78756e 	cdpcs	5, 7, cr7, cr8, cr14, {3}
    11c4:	682f0053 	stmdavs	pc!, {r0, r1, r4, r6}
    11c8:	2f656d6f 	svccs	0x00656d6f
    11cc:	6f6d6564 	svcvs	0x006d6564
    11d0:	666c656e 	strbtvs	r6, [ip], -lr, ror #10
    11d4:	6f72702f 	svcvs	0x0072702f
    11d8:	7463656a 	strbtvc	r6, [r3], #-1386	; 0x56a
    11dc:	2e30302f 	cdpcs	0, 3, cr3, cr0, cr15, {1}
    11e0:	6f77796d 	svcvs	0x0077796d
    11e4:	6c2f6b72 	stcvs	11, cr6, [pc], #-456	; 0xfffffe38
    11e8:	63616765 	cmnvs	r1, #26476544	; 0x1940000
    11ec:	72612d79 	rsbvc	r2, r1, #7744	; 0x1e40
    11f0:	696c2d6d 	stmdbvs	ip!, {r0, r2, r3, r5, r6, r8, sl, fp, sp}^
    11f4:	0078756e 	rsbseq	r7, r8, lr, ror #10
    11f8:	20554e47 	subscs	r4, r5, r7, asr #28
    11fc:	32205341 	eorcc	r5, r0, #67108865	; 0x4000001
    1200:	0030322e 	eorseq	r3, r0, lr, lsr #4
    1204:	Address 0x00001204 is out of bounds.


Disassembly of section .debug_abbrev:

00000000 <.debug_abbrev>:
   0:	10001101 	andne	r1, r0, r1, lsl #2
   4:	12011106 	andne	r1, r1, #-2147483647	; 0x80000001
   8:	1b080301 	blne	200c14 <bss_end+0x1fd93c>
   c:	13082508 	movwne	r2, #34056	; 0x8508
  10:	00000005 	andeq	r0, r0, r5
  14:	25011101 	strcs	r1, [r1, #-257]	; 0x101
  18:	030b130e 	movweq	r1, #45838	; 0xb30e
  1c:	110e1b0e 	tstne	lr, lr, lsl #22
  20:	10011201 	andne	r1, r1, r1, lsl #4
  24:	02000006 	andeq	r0, r0, #6
  28:	0c3f012e 	ldfeqs	f0, [pc], #-184	; 0xffffff48
  2c:	0b3a0e03 	bleq	e83840 <bss_end+0xe80568>
  30:	0c270b3b 	stceq	11, cr0, [r7], #-236	; 0xffffff14
  34:	01120111 	tsteq	r2, r1, lsl r1
  38:	13010640 	movwne	r0, #5696	; 0x1640
  3c:	34030000 	strcc	r0, [r3]
  40:	3a0e0300 	bcc	380c48 <bss_end+0x37d970>
  44:	490b3b0b 	stmdbmi	fp, {r0, r1, r3, r8, r9, fp, ip, sp}
  48:	000a0213 	andeq	r0, sl, r3, lsl r2
  4c:	00240400 	eoreq	r0, r4, r0, lsl #8
  50:	0b3e0b0b 	bleq	f82c84 <bss_end+0xf7f9ac>
  54:	00000e03 	andeq	r0, r0, r3, lsl #28
  58:	0b000f05 	bleq	3c74 <bss_end+0x99c>
  5c:	0013490b 	andseq	r4, r3, fp, lsl #18
  60:	012e0600 	teqeq	lr, r0, lsl #12
  64:	0e030c3f 	mcreq	12, 0, r0, cr3, cr15, {1}
  68:	0b3b0b3a 	bleq	ec2d58 <bss_end+0xebfa80>
  6c:	01110c27 	tsteq	r1, r7, lsr #24
  70:	06400112 	undefined instruction 0x06400112
  74:	34070000 	strcc	r0, [r7]
  78:	3a080300 	bcc	200c80 <bss_end+0x1fd9a8>
  7c:	490b3b0b 	stmdbmi	fp, {r0, r1, r3, r8, r9, fp, ip, sp}
  80:	000a0213 	andeq	r0, sl, r3, lsl r2
  84:	11010000 	tstne	r1, r0
  88:	130e2501 	movwne	r2, #58625	; 0xe501
  8c:	1b0e030b 	blne	380cc0 <bss_end+0x37d9e8>
  90:	1201110e 	andne	r1, r1, #-2147483645	; 0x80000003
  94:	00061001 	andeq	r1, r6, r1
  98:	012e0200 	teqeq	lr, r0, lsl #4
  9c:	0e030c3f 	mcreq	12, 0, r0, cr3, cr15, {1}
  a0:	0b3b0b3a 	bleq	ec2d90 <bss_end+0xebfab8>
  a4:	01110c27 	tsteq	r1, r7, lsr #24
  a8:	06400112 	undefined instruction 0x06400112
  ac:	00001301 	andeq	r1, r0, r1, lsl #6
  b0:	03000503 	movweq	r0, #1283	; 0x503
  b4:	3b0b3a0e 	blcc	2ce8f4 <bss_end+0x2cb61c>
  b8:	0213490b 	andseq	r4, r3, #180224	; 0x2c000
  bc:	0400000a 	streq	r0, [r0], #-10
  c0:	08030034 	stmdaeq	r3, {r2, r4, r5}
  c4:	0b3b0b3a 	bleq	ec2db4 <bss_end+0xebfadc>
  c8:	0a021349 	beq	84df4 <bss_end+0x81b1c>
  cc:	24050000 	strcs	r0, [r5]
  d0:	3e0b0b00 	vmlacc.f64	d0, d11, d0
  d4:	0008030b 	andeq	r0, r8, fp, lsl #6
  d8:	01010600 	tsteq	r1, r0, lsl #12
  dc:	13011349 	movwne	r1, #4937	; 0x1349
  e0:	21070000 	tstcs	r7, r0
  e4:	2f134900 	svccs	0x00134900
  e8:	0800000b 	stmdaeq	r0, {r0, r1, r3}
  ec:	0b0b0024 	bleq	2c0184 <bss_end+0x2bceac>
  f0:	00000b3e 	andeq	r0, r0, lr, lsr fp
  f4:	0b002409 	bleq	9120 <bss_end+0x5e48>
  f8:	030b3e0b 	movweq	r3, #48651	; 0xbe0b
  fc:	0a00000e 	beq	13c <mem_cfg_val+0x2c>
 100:	0b0b000f 	bleq	2c0144 <bss_end+0x2bce6c>
 104:	00001349 	andeq	r1, r0, r9, asr #6
 108:	3f012e0b 	svccc	0x00012e0b
 10c:	3a0e030c 	bcc	380d44 <bss_end+0x37da6c>
 110:	110b3b0b 	tstne	fp, fp, lsl #22
 114:	40011201 	andmi	r1, r1, r1, lsl #4
 118:	00130106 	andseq	r0, r3, r6, lsl #2
 11c:	00340c00 	eorseq	r0, r4, r0, lsl #24
 120:	0b3a0e03 	bleq	e83934 <bss_end+0xe8065c>
 124:	13490b3b 	movtne	r0, #39739	; 0x9b3b
 128:	00000a02 	andeq	r0, r0, r2, lsl #20
 12c:	4900210d 	stmdbmi	r0, {r0, r2, r3, r8, sp}
 130:	00052f13 	andeq	r2, r5, r3, lsl pc
 134:	002e0e00 	eoreq	r0, lr, r0, lsl #28
 138:	0e030c3f 	mcreq	12, 0, r0, cr3, cr15, {1}
 13c:	0b3b0b3a 	bleq	ec2e2c <bss_end+0xebfb54>
 140:	01120111 	tsteq	r2, r1, lsl r1
 144:	00000640 	andeq	r0, r0, r0, asr #12
 148:	3f002e0f 	svccc	0x00002e0f
 14c:	3a0e030c 	bcc	380d84 <bss_end+0x37daac>
 150:	270b3b0b 	strcs	r3, [fp, -fp, lsl #22]
 154:	1201110c 	andne	r1, r1, #3
 158:	00064001 	andeq	r4, r6, r1
 15c:	00341000 	eorseq	r1, r4, r0
 160:	0b3a0803 	bleq	e82174 <bss_end+0xe7ee9c>
 164:	13490b3b 	movtne	r0, #39739	; 0x9b3b
 168:	0a020c3f 	beq	8326c <bss_end+0x7ff94>
 16c:	01000000 	tsteq	r0, r0
 170:	0e250111 	mcreq	1, 1, r0, cr5, cr1, {0}
 174:	0e030b13 	vmoveq.32	d3[0], r0
 178:	01110e1b 	tsteq	r1, fp, lsl lr
 17c:	06100112 	undefined instruction 0x06100112
 180:	2e020000 	cdpcs	0, 0, cr0, cr2, cr0, {0}
 184:	030c3f00 	movweq	r3, #52992	; 0xcf00
 188:	3b0b3a0e 	blcc	2ce9c8 <bss_end+0x2cb6f0>
 18c:	1201110b 	andne	r1, r1, #-1073741822	; 0xc0000002
 190:	00064001 	andeq	r4, r6, r1
 194:	012e0300 	teqeq	lr, r0, lsl #6
 198:	0e030c3f 	mcreq	12, 0, r0, cr3, cr15, {1}
 19c:	0b3b0b3a 	bleq	ec2e8c <bss_end+0xebfbb4>
 1a0:	01110c27 	tsteq	r1, r7, lsr #24
 1a4:	06400112 	undefined instruction 0x06400112
 1a8:	00001301 	andeq	r1, r0, r1, lsl #6
 1ac:	03000504 	movweq	r0, #1284	; 0x504
 1b0:	3b0b3a0e 	blcc	2ce9f0 <bss_end+0x2cb718>
 1b4:	0213490b 	andseq	r4, r3, #180224	; 0x2c000
 1b8:	0500000a 	streq	r0, [r0, #-10]
 1bc:	0b0b0024 	bleq	2c0254 <bss_end+0x2bcf7c>
 1c0:	0e030b3e 	vmoveq.16	d3[0], r0
 1c4:	34060000 	strcc	r0, [r6]
 1c8:	3a080300 	bcc	200dd0 <bss_end+0x1fdaf8>
 1cc:	490b3b0b 	stmdbmi	fp, {r0, r1, r3, r8, r9, fp, ip, sp}
 1d0:	000a0213 	andeq	r0, sl, r3, lsl r2
 1d4:	000f0700 	andeq	r0, pc, r0, lsl #14
 1d8:	13490b0b 	movtne	r0, #39691	; 0x9b0b
 1dc:	24080000 	strcs	r0, [r8]
 1e0:	3e0b0b00 	vmlacc.f64	d0, d11, d0
 1e4:	0008030b 	andeq	r0, r8, fp, lsl #6
 1e8:	012e0900 	teqeq	lr, r0, lsl #18
 1ec:	0e030c3f 	mcreq	12, 0, r0, cr3, cr15, {1}
 1f0:	0b3b0b3a 	bleq	ec2ee0 <bss_end+0xebfc08>
 1f4:	13490c27 	movtne	r0, #39975	; 0x9c27
 1f8:	01120111 	tsteq	r2, r1, lsl r1
 1fc:	13010640 	movwne	r0, #5696	; 0x1640
 200:	2e0a0000 	cdpcs	0, 0, cr0, cr10, cr0, {0}
 204:	030c3f01 	movweq	r3, #52993	; 0xcf01
 208:	3b0b3a0e 	blcc	2cea48 <bss_end+0x2cb770>
 20c:	490c270b 	stmdbmi	ip, {r0, r1, r3, r8, r9, sl, sp}
 210:	12011113 	andne	r1, r1, #-1073741820	; 0xc0000004
 214:	00064001 	andeq	r4, r6, r1
 218:	01000000 	tsteq	r0, r0
 21c:	0e250111 	mcreq	1, 1, r0, cr5, cr1, {0}
 220:	0e030b13 	vmoveq.32	d3[0], r0
 224:	01110e1b 	tsteq	r1, fp, lsl lr
 228:	06100112 	undefined instruction 0x06100112
 22c:	2e020000 	cdpcs	0, 0, cr0, cr2, cr0, {0}
 230:	030c3f00 	movweq	r3, #52992	; 0xcf00
 234:	3b0b3a0e 	blcc	2cea74 <bss_end+0x2cb79c>
 238:	110c270b 	tstne	ip, fp, lsl #14
 23c:	40011201 	andmi	r1, r1, r1, lsl #4
 240:	00000006 	andeq	r0, r0, r6
 244:	25011101 	strcs	r1, [r1, #-257]	; 0x101
 248:	030b130e 	movweq	r1, #45838	; 0xb30e
 24c:	110e1b0e 	tstne	lr, lr, lsl #22
 250:	10011201 	andne	r1, r1, r1, lsl #4
 254:	02000006 	andeq	r0, r0, #6
 258:	0e030016 	mcreq	0, 0, r0, cr3, cr6, {0}
 25c:	0b3b0b3a 	bleq	ec2f4c <bss_end+0xebfc74>
 260:	00001349 	andeq	r1, r0, r9, asr #6
 264:	03011303 	movweq	r1, #4867	; 0x1303
 268:	010b0b0e 	tsteq	fp, lr, lsl #22
 26c:	04000013 	streq	r0, [r0], #-19
 270:	0e03000d 	cdpeq	0, 0, cr0, cr3, cr13, {0}
 274:	0a381349 	beq	e04fa0 <bss_end+0xe01cc8>
 278:	00000c34 	andeq	r0, r0, r4, lsr ip
 27c:	0b000f05 	bleq	3e98 <bss_end+0xbc0>
 280:	0600000b 	streq	r0, [r0], -fp
 284:	0c3f002e 	ldceq	0, cr0, [pc], #-184	; 0xffffff48
 288:	0b3a0e03 	bleq	e83a9c <bss_end+0xe807c4>
 28c:	0c270b3b 	stceq	11, cr0, [r7], #-236	; 0xffffff14
 290:	01120111 	tsteq	r2, r1, lsl r1
 294:	00000640 	andeq	r0, r0, r0, asr #12
 298:	3f012e07 	svccc	0x00012e07
 29c:	3a0e030c 	bcc	380ed4 <bss_end+0x37dbfc>
 2a0:	270b3b0b 	strcs	r3, [fp, -fp, lsl #22]
 2a4:	1201110c 	andne	r1, r1, #3
 2a8:	01064001 	tsteq	r6, r1
 2ac:	08000013 	stmdaeq	r0, {r0, r1, r4}
 2b0:	08030005 	stmdaeq	r3, {r0, r2}
 2b4:	0b3b0b3a 	bleq	ec2fa4 <bss_end+0xebfccc>
 2b8:	0a021349 	beq	84fe4 <bss_end+0x81d0c>
 2bc:	24090000 	strcs	r0, [r9]
 2c0:	3e0b0b00 	vmlacc.f64	d0, d11, d0
 2c4:	000e030b 	andeq	r0, lr, fp, lsl #6
 2c8:	002e0a00 	eoreq	r0, lr, r0, lsl #20
 2cc:	0e030c3f 	mcreq	12, 0, r0, cr3, cr15, {1}
 2d0:	0b3b0b3a 	bleq	ec2fc0 <bss_end+0xebfce8>
 2d4:	13490c27 	movtne	r0, #39975	; 0x9c27
 2d8:	01120111 	tsteq	r2, r1, lsl r1
 2dc:	00000640 	andeq	r0, r0, r0, asr #12
 2e0:	0b000f0b 	bleq	3f14 <bss_end+0xc3c>
 2e4:	0013490b 	andseq	r4, r3, fp, lsl #18
 2e8:	012e0c00 	teqeq	lr, r0, lsl #24
 2ec:	0e030c3f 	mcreq	12, 0, r0, cr3, cr15, {1}
 2f0:	0b3b0b3a 	bleq	ec2fe0 <bss_end+0xebfd08>
 2f4:	13490c27 	movtne	r0, #39975	; 0x9c27
 2f8:	01120111 	tsteq	r2, r1, lsl r1
 2fc:	13010640 	movwne	r0, #5696	; 0x1640
 300:	340d0000 	strcc	r0, [sp]
 304:	3a0e0300 	bcc	380f0c <bss_end+0x37dc34>
 308:	490b3b0b 	stmdbmi	fp, {r0, r1, r3, r8, r9, fp, ip, sp}
 30c:	000a0213 	andeq	r0, sl, r3, lsl r2
 310:	00340e00 	eorseq	r0, r4, r0, lsl #28
 314:	0b3a0803 	bleq	e82328 <bss_end+0xe7f050>
 318:	13490b3b 	movtne	r0, #39739	; 0x9b3b
 31c:	00000a02 	andeq	r0, r0, r2, lsl #20
 320:	0b00240f 	bleq	9364 <bss_end+0x608c>
 324:	030b3e0b 	movweq	r3, #48651	; 0xbe0b
 328:	10000008 	andne	r0, r0, r8
 32c:	00000018 	andeq	r0, r0, r8, lsl r0
 330:	49002611 	stmdbmi	r0, {r0, r4, r9, sl, sp}
 334:	12000013 	andne	r0, r0, #19
 338:	13490101 	movtne	r0, #37121	; 0x9101
 33c:	00001301 	andeq	r1, r0, r1, lsl #6
 340:	49002113 	stmdbmi	r0, {r0, r1, r4, r8, sp}
 344:	000b2f13 	andeq	r2, fp, r3, lsl pc
 348:	00241400 	eoreq	r1, r4, r0, lsl #8
 34c:	0b3e0b0b 	bleq	f82f80 <bss_end+0xf7fca8>
 350:	01000000 	tsteq	r0, r0
 354:	0e250111 	mcreq	1, 1, r0, cr5, cr1, {0}
 358:	0e030b13 	vmoveq.32	d3[0], r0
 35c:	01110e1b 	tsteq	r1, fp, lsl lr
 360:	06100112 	undefined instruction 0x06100112
 364:	2e020000 	cdpcs	0, 0, cr0, cr2, cr0, {0}
 368:	030c3f01 	movweq	r3, #52993	; 0xcf01
 36c:	3b0b3a0e 	blcc	2cebac <bss_end+0x2cb8d4>
 370:	110c270b 	tstne	ip, fp, lsl #14
 374:	40011201 	andmi	r1, r1, r1, lsl #4
 378:	00130106 	andseq	r0, r3, r6, lsl #2
 37c:	00050300 	andeq	r0, r5, r0, lsl #6
 380:	0b3a0e03 	bleq	e83b94 <bss_end+0xe808bc>
 384:	13490b3b 	movtne	r0, #39739	; 0x9b3b
 388:	00000a02 	andeq	r0, r0, r2, lsl #20
 38c:	03003404 	movweq	r3, #1028	; 0x404
 390:	3b0b3a0e 	blcc	2cebd0 <bss_end+0x2cb8f8>
 394:	0213490b 	andseq	r4, r3, #180224	; 0x2c000
 398:	0500000a 	streq	r0, [r0, #-10]
 39c:	0b0b0024 	bleq	2c0434 <bss_end+0x2bd15c>
 3a0:	0e030b3e 	vmoveq.16	d3[0], r0
 3a4:	0f060000 	svceq	0x00060000
 3a8:	490b0b00 	stmdbmi	fp, {r8, r9, fp}
 3ac:	07000013 	smladeq	r0, r3, r0, r0
 3b0:	08030005 	stmdaeq	r3, {r0, r2}
 3b4:	0b3b0b3a 	bleq	ec30a4 <bss_end+0xebfdcc>
 3b8:	0a021349 	beq	850e4 <bss_end+0x81e0c>
 3bc:	2e080000 	cdpcs	0, 0, cr0, cr8, cr0, {0}
 3c0:	030c3f00 	movweq	r3, #52992	; 0xcf00
 3c4:	3b0b3a0e 	blcc	2cec04 <bss_end+0x2cb92c>
 3c8:	1201110b 	andne	r1, r1, #-1073741822	; 0xc0000002
 3cc:	00064001 	andeq	r4, r6, r1
 3d0:	11010000 	tstne	r1, r0
 3d4:	130e2501 	movwne	r2, #58625	; 0xe501
 3d8:	1b0e030b 	blne	38100c <bss_end+0x37dd34>
 3dc:	1201110e 	andne	r1, r1, #-2147483645	; 0x80000003
 3e0:	00061001 	andeq	r1, r6, r1
 3e4:	002e0200 	eoreq	r0, lr, r0, lsl #4
 3e8:	0e030c3f 	mcreq	12, 0, r0, cr3, cr15, {1}
 3ec:	0b3b0b3a 	bleq	ec30dc <bss_end+0xebfe04>
 3f0:	01110c27 	tsteq	r1, r7, lsr #24
 3f4:	06400112 	undefined instruction 0x06400112
 3f8:	2e030000 	cdpcs	0, 0, cr0, cr3, cr0, {0}
 3fc:	030c3f00 	movweq	r3, #52992	; 0xcf00
 400:	3b0b3a0e 	blcc	2cec40 <bss_end+0x2cb968>
 404:	1201110b 	andne	r1, r1, #-1073741822	; 0xc0000002
 408:	00064001 	andeq	r4, r6, r1
 40c:	002e0400 	eoreq	r0, lr, r0, lsl #8
 410:	0e030c3f 	mcreq	12, 0, r0, cr3, cr15, {1}
 414:	0b3b0b3a 	bleq	ec3104 <bss_end+0xebfe2c>
 418:	01111349 	tsteq	r1, r9, asr #6
 41c:	06400112 	undefined instruction 0x06400112
 420:	24050000 	strcs	r0, [r5]
 424:	3e0b0b00 	vmlacc.f64	d0, d11, d0
 428:	0008030b 	andeq	r0, r8, fp, lsl #6
 42c:	11010000 	tstne	r1, r0
 430:	130e2501 	movwne	r2, #58625	; 0xe501
 434:	1b0e030b 	blne	381068 <bss_end+0x37dd90>
 438:	1201110e 	andne	r1, r1, #-2147483645	; 0x80000003
 43c:	00061001 	andeq	r1, r6, r1
 440:	012e0200 	teqeq	lr, r0, lsl #4
 444:	0e030c3f 	mcreq	12, 0, r0, cr3, cr15, {1}
 448:	0b3b0b3a 	bleq	ec3138 <bss_end+0xebfe60>
 44c:	01110c27 	tsteq	r1, r7, lsr #24
 450:	06400112 	undefined instruction 0x06400112
 454:	00001301 	andeq	r1, r0, r1, lsl #6
 458:	03000503 	movweq	r0, #1283	; 0x503
 45c:	3b0b3a08 	blcc	2cec84 <bss_end+0x2cb9ac>
 460:	0213490b 	andseq	r4, r3, #180224	; 0x2c000
 464:	0400000a 	streq	r0, [r0], #-10
 468:	08030034 	stmdaeq	r3, {r2, r4, r5}
 46c:	0b3b0b3a 	bleq	ec315c <bss_end+0xebfe84>
 470:	0a021349 	beq	8519c <bss_end+0x81ec4>
 474:	24050000 	strcs	r0, [r5]
 478:	3e0b0b00 	vmlacc.f64	d0, d11, d0
 47c:	0008030b 	andeq	r0, r8, fp, lsl #6
 480:	012e0600 	teqeq	lr, r0, lsl #12
 484:	0e030c3f 	mcreq	12, 0, r0, cr3, cr15, {1}
 488:	0b3b0b3a 	bleq	ec3178 <bss_end+0xebfea0>
 48c:	13490c27 	movtne	r0, #39975	; 0x9c27
 490:	01120111 	tsteq	r2, r1, lsl r1
 494:	13010640 	movwne	r0, #5696	; 0x1640
 498:	24070000 	strcs	r0, [r7]
 49c:	3e0b0b00 	vmlacc.f64	d0, d11, d0
 4a0:	000e030b 	andeq	r0, lr, fp, lsl #6
 4a4:	000f0800 	andeq	r0, pc, r0, lsl #16
 4a8:	13490b0b 	movtne	r0, #39691	; 0x9b0b
 4ac:	05090000 	streq	r0, [r9]
 4b0:	3a0e0300 	bcc	3810b8 <bss_end+0x37dde0>
 4b4:	490b3b0b 	stmdbmi	fp, {r0, r1, r3, r8, r9, fp, ip, sp}
 4b8:	000a0213 	andeq	r0, sl, r3, lsl r2
 4bc:	00260a00 	eoreq	r0, r6, r0, lsl #20
 4c0:	00001349 	andeq	r1, r0, r9, asr #6
 4c4:	0300340b 	movweq	r3, #1035	; 0x40b
 4c8:	3b0b3a0e 	blcc	2ced08 <bss_end+0x2cba30>
 4cc:	0213490b 	andseq	r4, r3, #180224	; 0x2c000
 4d0:	0c00000a 	stceq	0, cr0, [r0], {10}
 4d4:	0b0b000f 	bleq	2c0518 <bss_end+0x2bd240>
 4d8:	260d0000 	strcs	r0, [sp], -r0
 4dc:	0e000000 	cdpeq	0, 0, cr0, cr0, cr0, {0}
 4e0:	0c3f012e 	ldfeqs	f0, [pc], #-184	; 0xffffff48
 4e4:	0b3a0e03 	bleq	e83cf8 <bss_end+0xe80a20>
 4e8:	0c27053b 	cfstr32eq	mvfx0, [r7], #-236	; 0xffffff14
 4ec:	01111349 	tsteq	r1, r9, asr #6
 4f0:	06400112 	undefined instruction 0x06400112
 4f4:	00001301 	andeq	r1, r0, r1, lsl #6
 4f8:	0300050f 	movweq	r0, #1295	; 0x50f
 4fc:	3b0b3a08 	blcc	2ced24 <bss_end+0x2cba4c>
 500:	02134905 	andseq	r4, r3, #81920	; 0x14000
 504:	1000000a 	andne	r0, r0, sl
 508:	08030034 	stmdaeq	r3, {r2, r4, r5}
 50c:	053b0b3a 	ldreq	r0, [fp, #-2874]!	; 0xb3a
 510:	0a021349 	beq	8523c <bss_end+0x81f64>
 514:	2e110000 	cdpcs	0, 1, cr0, cr1, cr0, {0}
 518:	030c3f01 	movweq	r3, #52993	; 0xcf01
 51c:	3b0b3a0e 	blcc	2ced5c <bss_end+0x2cba84>
 520:	490c2705 	stmdbmi	ip, {r0, r2, r8, r9, sl, sp}
 524:	12011113 	andne	r1, r1, #-1073741820	; 0xc0000004
 528:	00064001 	andeq	r4, r6, r1
 52c:	11010000 	tstne	r1, r0
 530:	130e2501 	movwne	r2, #58625	; 0xe501
 534:	1b0e030b 	blne	381168 <bss_end+0x37de90>
 538:	1201110e 	andne	r1, r1, #-2147483645	; 0x80000003
 53c:	00061001 	andeq	r1, r6, r1
 540:	012e0200 	teqeq	lr, r0, lsl #4
 544:	0e030c3f 	mcreq	12, 0, r0, cr3, cr15, {1}
 548:	0b3b0b3a 	bleq	ec3238 <bss_end+0xebff60>
 54c:	01110c27 	tsteq	r1, r7, lsr #24
 550:	06400112 	undefined instruction 0x06400112
 554:	00001301 	andeq	r1, r0, r1, lsl #6
 558:	03000503 	movweq	r0, #1283	; 0x503
 55c:	3b0b3a0e 	blcc	2ced9c <bss_end+0x2cbac4>
 560:	0213490b 	andseq	r4, r3, #180224	; 0x2c000
 564:	0400000a 	streq	r0, [r0], #-10
 568:	08030034 	stmdaeq	r3, {r2, r4, r5}
 56c:	0b3b0b3a 	bleq	ec325c <bss_end+0xebff84>
 570:	0a021349 	beq	8529c <bss_end+0x81fc4>
 574:	24050000 	strcs	r0, [r5]
 578:	3e0b0b00 	vmlacc.f64	d0, d11, d0
 57c:	000e030b 	andeq	r0, lr, fp, lsl #6
 580:	00240600 	eoreq	r0, r4, r0, lsl #12
 584:	0b3e0b0b 	bleq	f831b8 <bss_end+0xf7fee0>
 588:	00000803 	andeq	r0, r0, r3, lsl #16
 58c:	03003407 	movweq	r3, #1031	; 0x407
 590:	3b0b3a0e 	blcc	2cedd0 <bss_end+0x2cbaf8>
 594:	0213490b 	andseq	r4, r3, #180224	; 0x2c000
 598:	0800000a 	stmdaeq	r0, {r1, r3}
 59c:	13490101 	movtne	r0, #37121	; 0x9101
 5a0:	00001301 	andeq	r1, r0, r1, lsl #6
 5a4:	49002109 	stmdbmi	r0, {r0, r3, r8, sp}
 5a8:	00052f13 	andeq	r2, r5, r3, lsl pc
 5ac:	00240a00 	eoreq	r0, r4, r0, lsl #20
 5b0:	0b3e0b0b 	bleq	f831e4 <bss_end+0xf7ff0c>
 5b4:	01000000 	tsteq	r0, r0
 5b8:	0e250111 	mcreq	1, 1, r0, cr5, cr1, {0}
 5bc:	0e030b13 	vmoveq.32	d3[0], r0
 5c0:	01110e1b 	tsteq	r1, fp, lsl lr
 5c4:	06100112 	undefined instruction 0x06100112
 5c8:	2e020000 	cdpcs	0, 0, cr0, cr2, cr0, {0}
 5cc:	030c3f00 	movweq	r3, #52992	; 0xcf00
 5d0:	3b0b3a0e 	blcc	2cee10 <bss_end+0x2cbb38>
 5d4:	1201110b 	andne	r1, r1, #-1073741822	; 0xc0000002
 5d8:	00064001 	andeq	r4, r6, r1
 5dc:	11010000 	tstne	r1, r0
 5e0:	11061000 	tstne	r6, r0
 5e4:	03011201 	movweq	r1, #4609	; 0x1201
 5e8:	25081b08 	strcs	r1, [r8, #-2824]	; 0xb08
 5ec:	00051308 	andeq	r1, r5, r8, lsl #6
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
  50:	00000308 	andeq	r0, r0, r8, lsl #6
  54:	00000458 	andeq	r0, r0, r8, asr r4
	...
  60:	0000001c 	andeq	r0, r0, ip, lsl r0
  64:	02e20002 	rsceq	r0, r2, #2
  68:	00040000 	andeq	r0, r4, r0
  6c:	00000000 	andeq	r0, r0, r0
  70:	00000760 	andeq	r0, r0, r0, ror #14
  74:	00000478 	andeq	r0, r0, r8, ror r4
	...
  80:	0000001c 	andeq	r0, r0, ip, lsl r0
  84:	050e0002 	streq	r0, [lr, #-2]
  88:	00040000 	andeq	r0, r4, r0
  8c:	00000000 	andeq	r0, r0, r0
  90:	00000bd8 	ldrdeq	r0, [r0], -r8
  94:	00000014 	andeq	r0, r0, r4, lsl r0
	...
  a0:	0000001c 	andeq	r0, r0, ip, lsl r0
  a4:	05490002 	strbeq	r0, [r9, #-2]
  a8:	00040000 	andeq	r0, r4, r0
  ac:	00000000 	andeq	r0, r0, r0
  b0:	00000bec 	andeq	r0, r0, ip, ror #23
  b4:	0000063c 	andeq	r0, r0, ip, lsr r6
	...
  c0:	0000001c 	andeq	r0, r0, ip, lsl r0
  c4:	07880002 	streq	r0, [r8, r2]
  c8:	00040000 	andeq	r0, r4, r0
  cc:	00000000 	andeq	r0, r0, r0
  d0:	00001228 	andeq	r1, r0, r8, lsr #4
  d4:	0000015c 	andeq	r0, r0, ip, asr r1
	...
  e0:	0000001c 	andeq	r0, r0, ip, lsl r0
  e4:	08bc0002 	ldmeq	ip!, {r1}
  e8:	00040000 	andeq	r0, r4, r0
  ec:	00000000 	andeq	r0, r0, r0
  f0:	00001384 	andeq	r1, r0, r4, lsl #7
  f4:	000000fc 	strdeq	r0, [r0], -ip
	...
 100:	0000001c 	andeq	r0, r0, ip, lsl r0
 104:	09530002 	ldmdbeq	r3, {r1}^
 108:	00040000 	andeq	r0, r4, r0
 10c:	00000000 	andeq	r0, r0, r0
 110:	00001480 	andeq	r1, r0, r0, lsl #9
 114:	00000d84 	andeq	r0, r0, r4, lsl #27
	...
 120:	0000001c 	andeq	r0, r0, ip, lsl r0
 124:	109e0002 	addsne	r0, lr, r2
 128:	00040000 	andeq	r0, r4, r0
 12c:	00000000 	andeq	r0, r0, r0
 130:	00002204 	andeq	r2, r0, r4, lsl #4
 134:	000000e4 	andeq	r0, r0, r4, ror #1
	...
 140:	0000001c 	andeq	r0, r0, ip, lsl r0
 144:	11510002 	cmpne	r1, r2
 148:	00040000 	andeq	r0, r4, r0
 14c:	00000000 	andeq	r0, r0, r0
 150:	000022e8 	andeq	r2, r0, r8, ror #5
 154:	00000040 	andeq	r0, r0, r0, asr #32
	...
 160:	0000001c 	andeq	r0, r0, ip, lsl r0
 164:	119f0002 	orrsne	r0, pc, r2
 168:	00040000 	andeq	r0, r4, r0
 16c:	00000000 	andeq	r0, r0, r0
 170:	00002328 	andeq	r2, r0, r8, lsr #6
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
  60:	00000308 	andeq	r0, r0, r8, lsl #6
  64:	000000b8 	strheq	r0, [r0], -r8
  68:	110c0e44 	tstne	ip, r4, asr #28
  6c:	0b11010e 	bleq	4404ac <bss_end+0x43d1d4>
  70:	03041102 	movweq	r1, #16642	; 0x4102
  74:	040b0c44 	streq	r0, [fp], #-3140	; 0xc44
  78:	0000001c 	andeq	r0, r0, ip, lsl r0
  7c:	00000048 	andeq	r0, r0, r8, asr #32
  80:	000003c0 	andeq	r0, r0, r0, asr #7
  84:	00000064 	andeq	r0, r0, r4, rrx
  88:	11080e44 	tstne	r8, r4, asr #28
  8c:	0b11010e 	bleq	4404cc <bss_end+0x43d1f4>
  90:	0b0c4402 	bleq	3110a0 <bss_end+0x30ddc8>
  94:	00000004 	andeq	r0, r0, r4
  98:	0000001c 	andeq	r0, r0, ip, lsl r0
  9c:	00000048 	andeq	r0, r0, r8, asr #32
  a0:	00000424 	andeq	r0, r0, r4, lsr #8
  a4:	00000210 	andeq	r0, r0, r0, lsl r2
  a8:	11080e44 	tstne	r8, r4, asr #28
  ac:	0b11010e 	bleq	4404ec <bss_end+0x43d214>
  b0:	0b0c4402 	bleq	3110c0 <bss_end+0x30dde8>
  b4:	00000004 	andeq	r0, r0, r4
  b8:	0000001c 	andeq	r0, r0, ip, lsl r0
  bc:	00000048 	andeq	r0, r0, r8, asr #32
  c0:	00000634 	andeq	r0, r0, r4, lsr r6
  c4:	0000003c 	andeq	r0, r0, ip, lsr r0
  c8:	11080e44 	tstne	r8, r4, asr #28
  cc:	0b11010e 	bleq	44050c <bss_end+0x43d234>
  d0:	0b0c4402 	bleq	3110e0 <bss_end+0x30de08>
  d4:	00000004 	andeq	r0, r0, r4
  d8:	0000001c 	andeq	r0, r0, ip, lsl r0
  dc:	00000048 	andeq	r0, r0, r8, asr #32
  e0:	00000670 	andeq	r0, r0, r0, ror r6
  e4:	000000f0 	strdeq	r0, [r0], -r0
  e8:	11080e44 	tstne	r8, r4, asr #28
  ec:	0b11010e 	bleq	44052c <bss_end+0x43d254>
  f0:	0b0c4402 	bleq	311100 <bss_end+0x30de28>
  f4:	00000004 	andeq	r0, r0, r4
  f8:	0000000c 	andeq	r0, r0, ip
  fc:	ffffffff 	undefined instruction 0xffffffff
 100:	7c010001 	stcvc	0, cr0, [r1], {1}
 104:	000d0c0e 	andeq	r0, sp, lr, lsl #24
 108:	00000018 	andeq	r0, r0, r8, lsl r0
 10c:	000000f8 	strdeq	r0, [r0], -r8
 110:	00000760 	andeq	r0, r0, r0, ror #14
 114:	0000002c 	andeq	r0, r0, ip, lsr #32
 118:	11040e44 	tstne	r4, r4, asr #28
 11c:	0d44010b 	stfeqe	f0, [r4, #-44]	; 0xffffffd4
 120:	0000000b 	andeq	r0, r0, fp
 124:	00000018 	andeq	r0, r0, r8, lsl r0
 128:	000000f8 	strdeq	r0, [r0], -r8
 12c:	0000078c 	andeq	r0, r0, ip, lsl #15
 130:	0000002c 	andeq	r0, r0, ip, lsr #32
 134:	11040e44 	tstne	r4, r4, asr #28
 138:	0d44010b 	stfeqe	f0, [r4, #-44]	; 0xffffffd4
 13c:	0000000b 	andeq	r0, r0, fp
 140:	00000018 	andeq	r0, r0, r8, lsl r0
 144:	000000f8 	strdeq	r0, [r0], -r8
 148:	000007b8 	undefined instruction 0x000007b8
 14c:	00000034 	andeq	r0, r0, r4, lsr r0
 150:	11040e44 	tstne	r4, r4, asr #28
 154:	0d44010b 	stfeqe	f0, [r4, #-44]	; 0xffffffd4
 158:	0000000b 	andeq	r0, r0, fp
 15c:	00000018 	andeq	r0, r0, r8, lsl r0
 160:	000000f8 	strdeq	r0, [r0], -r8
 164:	000007ec 	andeq	r0, r0, ip, ror #15
 168:	00000030 	andeq	r0, r0, r0, lsr r0
 16c:	11040e44 	tstne	r4, r4, asr #28
 170:	0d44010b 	stfeqe	f0, [r4, #-44]	; 0xffffffd4
 174:	0000000b 	andeq	r0, r0, fp
 178:	00000018 	andeq	r0, r0, r8, lsl r0
 17c:	000000f8 	strdeq	r0, [r0], -r8
 180:	0000081c 	andeq	r0, r0, ip, lsl r8
 184:	00000030 	andeq	r0, r0, r0, lsr r0
 188:	11040e44 	tstne	r4, r4, asr #28
 18c:	0d44010b 	stfeqe	f0, [r4, #-44]	; 0xffffffd4
 190:	0000000b 	andeq	r0, r0, fp
 194:	00000018 	andeq	r0, r0, r8, lsl r0
 198:	000000f8 	strdeq	r0, [r0], -r8
 19c:	0000084c 	andeq	r0, r0, ip, asr #16
 1a0:	00000030 	andeq	r0, r0, r0, lsr r0
 1a4:	11040e44 	tstne	r4, r4, asr #28
 1a8:	0d44010b 	stfeqe	f0, [r4, #-44]	; 0xffffffd4
 1ac:	0000000b 	andeq	r0, r0, fp
 1b0:	0000001c 	andeq	r0, r0, ip, lsl r0
 1b4:	000000f8 	strdeq	r0, [r0], -r8
 1b8:	0000087c 	andeq	r0, r0, ip, ror r8
 1bc:	0000002c 	andeq	r0, r0, ip, lsr #32
 1c0:	11080e44 	tstne	r8, r4, asr #28
 1c4:	0b11010e 	bleq	440604 <bss_end+0x43d32c>
 1c8:	0b0c4402 	bleq	3111d8 <bss_end+0x30df00>
 1cc:	00000004 	andeq	r0, r0, r4
 1d0:	0000001c 	andeq	r0, r0, ip, lsl r0
 1d4:	000000f8 	strdeq	r0, [r0], -r8
 1d8:	000008a8 	andeq	r0, r0, r8, lsr #17
 1dc:	00000038 	andeq	r0, r0, r8, lsr r0
 1e0:	11080e44 	tstne	r8, r4, asr #28
 1e4:	0b11010e 	bleq	440624 <bss_end+0x43d34c>
 1e8:	0b0c4402 	bleq	3111f8 <bss_end+0x30df20>
 1ec:	00000004 	andeq	r0, r0, r4
 1f0:	0000001c 	andeq	r0, r0, ip, lsl r0
 1f4:	000000f8 	strdeq	r0, [r0], -r8
 1f8:	000008e0 	andeq	r0, r0, r0, ror #17
 1fc:	000000dc 	ldrdeq	r0, [r0], -ip
 200:	11080e44 	tstne	r8, r4, asr #28
 204:	0b11010e 	bleq	440644 <bss_end+0x43d36c>
 208:	0b0c4402 	bleq	311218 <bss_end+0x30df40>
 20c:	00000004 	andeq	r0, r0, r4
 210:	0000001c 	andeq	r0, r0, ip, lsl r0
 214:	000000f8 	strdeq	r0, [r0], -r8
 218:	000009bc 	undefined instruction 0x000009bc
 21c:	00000100 	andeq	r0, r0, r0, lsl #2
 220:	11080e44 	tstne	r8, r4, asr #28
 224:	0b11010e 	bleq	440664 <bss_end+0x43d38c>
 228:	0b0c4402 	bleq	311238 <bss_end+0x30df60>
 22c:	00000004 	andeq	r0, r0, r4
 230:	0000001c 	andeq	r0, r0, ip, lsl r0
 234:	000000f8 	strdeq	r0, [r0], -r8
 238:	00000abc 	undefined instruction 0x00000abc
 23c:	0000007c 	andeq	r0, r0, ip, ror r0
 240:	11080e44 	tstne	r8, r4, asr #28
 244:	0b11010e 	bleq	440684 <bss_end+0x43d3ac>
 248:	0b0c4402 	bleq	311258 <bss_end+0x30df80>
 24c:	00000004 	andeq	r0, r0, r4
 250:	0000001c 	andeq	r0, r0, ip, lsl r0
 254:	000000f8 	strdeq	r0, [r0], -r8
 258:	00000b38 	andeq	r0, r0, r8, lsr fp
 25c:	000000a0 	andeq	r0, r0, r0, lsr #1
 260:	11080e44 	tstne	r8, r4, asr #28
 264:	0b11010e 	bleq	4406a4 <bss_end+0x43d3cc>
 268:	0b0c4402 	bleq	311278 <bss_end+0x30dfa0>
 26c:	00000004 	andeq	r0, r0, r4
 270:	0000000c 	andeq	r0, r0, ip
 274:	ffffffff 	undefined instruction 0xffffffff
 278:	7c010001 	stcvc	0, cr0, [r1], {1}
 27c:	000d0c0e 	andeq	r0, sp, lr, lsl #24
 280:	00000018 	andeq	r0, r0, r8, lsl r0
 284:	00000270 	andeq	r0, r0, r0, ror r2
 288:	00000bd8 	ldrdeq	r0, [r0], -r8
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
 2b4:	00000bec 	andeq	r0, r0, ip, ror #23
 2b8:	0000007c 	andeq	r0, r0, ip, ror r0
 2bc:	11040e44 	tstne	r4, r4, asr #28
 2c0:	0d44010b 	stfeqe	f0, [r4, #-44]	; 0xffffffd4
 2c4:	0000000b 	andeq	r0, r0, fp
 2c8:	00000018 	andeq	r0, r0, r8, lsl r0
 2cc:	0000029c 	muleq	r0, ip, r2
 2d0:	00000c68 	andeq	r0, r0, r8, ror #24
 2d4:	00000048 	andeq	r0, r0, r8, asr #32
 2d8:	11040e44 	tstne	r4, r4, asr #28
 2dc:	0d44010b 	stfeqe	f0, [r4, #-44]	; 0xffffffd4
 2e0:	0000000b 	andeq	r0, r0, fp
 2e4:	00000018 	andeq	r0, r0, r8, lsl r0
 2e8:	0000029c 	muleq	r0, ip, r2
 2ec:	00000cb0 	undefined instruction 0x00000cb0
 2f0:	00000040 	andeq	r0, r0, r0, asr #32
 2f4:	11040e44 	tstne	r4, r4, asr #28
 2f8:	0d44010b 	stfeqe	f0, [r4, #-44]	; 0xffffffd4
 2fc:	0000000b 	andeq	r0, r0, fp
 300:	0000001c 	andeq	r0, r0, ip, lsl r0
 304:	0000029c 	muleq	r0, ip, r2
 308:	00000cf0 	strdeq	r0, [r0], -r0
 30c:	0000004c 	andeq	r0, r0, ip, asr #32
 310:	11080e44 	tstne	r8, r4, asr #28
 314:	0b11010e 	bleq	440754 <bss_end+0x43d47c>
 318:	0b0c4402 	bleq	311328 <bss_end+0x30e050>
 31c:	00000004 	andeq	r0, r0, r4
 320:	0000001c 	andeq	r0, r0, ip, lsl r0
 324:	0000029c 	muleq	r0, ip, r2
 328:	00000d3c 	andeq	r0, r0, ip, lsr sp
 32c:	0000008c 	andeq	r0, r0, ip, lsl #1
 330:	11080e44 	tstne	r8, r4, asr #28
 334:	0b11010e 	bleq	440774 <bss_end+0x43d49c>
 338:	0b0c4402 	bleq	311348 <bss_end+0x30e070>
 33c:	00000004 	andeq	r0, r0, r4
 340:	0000001c 	andeq	r0, r0, ip, lsl r0
 344:	0000029c 	muleq	r0, ip, r2
 348:	00000dc8 	andeq	r0, r0, r8, asr #27
 34c:	00000110 	andeq	r0, r0, r0, lsl r1
 350:	11080e44 	tstne	r8, r4, asr #28
 354:	0b11010e 	bleq	440794 <bss_end+0x43d4bc>
 358:	0b0c4402 	bleq	311368 <bss_end+0x30e090>
 35c:	00000004 	andeq	r0, r0, r4
 360:	0000001c 	andeq	r0, r0, ip, lsl r0
 364:	0000029c 	muleq	r0, ip, r2
 368:	00000ed8 	ldrdeq	r0, [r0], -r8
 36c:	00000174 	andeq	r0, r0, r4, ror r1
 370:	11080e44 	tstne	r8, r4, asr #28
 374:	0b11010e 	bleq	4407b4 <bss_end+0x43d4dc>
 378:	0b0c4402 	bleq	311388 <bss_end+0x30e0b0>
 37c:	00000004 	andeq	r0, r0, r4
 380:	00000028 	andeq	r0, r0, r8, lsr #32
 384:	0000029c 	muleq	r0, ip, r2
 388:	0000104c 	andeq	r1, r0, ip, asr #32
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
 3c4:	00001228 	andeq	r1, r0, r8, lsr #4
 3c8:	0000005c 	andeq	r0, r0, ip, asr r0
 3cc:	11040e44 	tstne	r4, r4, asr #28
 3d0:	0d44010b 	stfeqe	f0, [r4, #-44]	; 0xffffffd4
 3d4:	0000000b 	andeq	r0, r0, fp
 3d8:	00000018 	andeq	r0, r0, r8, lsl r0
 3dc:	000003ac 	andeq	r0, r0, ip, lsr #7
 3e0:	00001284 	andeq	r1, r0, r4, lsl #5
 3e4:	0000001c 	andeq	r0, r0, ip, lsl r0
 3e8:	11040e44 	tstne	r4, r4, asr #28
 3ec:	0d44010b 	stfeqe	f0, [r4, #-44]	; 0xffffffd4
 3f0:	0000000b 	andeq	r0, r0, fp
 3f4:	0000001c 	andeq	r0, r0, ip, lsl r0
 3f8:	000003ac 	andeq	r0, r0, ip, lsr #7
 3fc:	000012a0 	andeq	r1, r0, r0, lsr #5
 400:	00000078 	andeq	r0, r0, r8, ror r0
 404:	11080e44 	tstne	r8, r4, asr #28
 408:	0b11010e 	bleq	440848 <bss_end+0x43d570>
 40c:	0b0c4402 	bleq	31141c <bss_end+0x30e144>
 410:	00000004 	andeq	r0, r0, r4
 414:	0000001c 	andeq	r0, r0, ip, lsl r0
 418:	000003ac 	andeq	r0, r0, ip, lsr #7
 41c:	00001318 	andeq	r1, r0, r8, lsl r3
 420:	00000048 	andeq	r0, r0, r8, asr #32
 424:	11080e44 	tstne	r8, r4, asr #28
 428:	0b11010e 	bleq	440868 <bss_end+0x43d590>
 42c:	0b0c4402 	bleq	31143c <bss_end+0x30e164>
 430:	00000004 	andeq	r0, r0, r4
 434:	0000001c 	andeq	r0, r0, ip, lsl r0
 438:	000003ac 	andeq	r0, r0, ip, lsr #7
 43c:	00001360 	andeq	r1, r0, r0, ror #6
 440:	00000024 	andeq	r0, r0, r4, lsr #32
 444:	11080e44 	tstne	r8, r4, asr #28
 448:	0b11010e 	bleq	440888 <bss_end+0x43d5b0>
 44c:	0b0c4402 	bleq	31145c <bss_end+0x30e184>
 450:	00000004 	andeq	r0, r0, r4
 454:	0000000c 	andeq	r0, r0, ip
 458:	ffffffff 	undefined instruction 0xffffffff
 45c:	7c010001 	stcvc	0, cr0, [r1], {1}
 460:	000d0c0e 	andeq	r0, sp, lr, lsl #24
 464:	00000018 	andeq	r0, r0, r8, lsl r0
 468:	00000454 	andeq	r0, r0, r4, asr r4
 46c:	00001384 	andeq	r1, r0, r4, lsl #7
 470:	00000040 	andeq	r0, r0, r0, asr #32
 474:	11040e44 	tstne	r4, r4, asr #28
 478:	0d44010b 	stfeqe	f0, [r4, #-44]	; 0xffffffd4
 47c:	0000000b 	andeq	r0, r0, fp
 480:	00000018 	andeq	r0, r0, r8, lsl r0
 484:	00000454 	andeq	r0, r0, r4, asr r4
 488:	000013c4 	andeq	r1, r0, r4, asr #7
 48c:	00000040 	andeq	r0, r0, r0, asr #32
 490:	11040e44 	tstne	r4, r4, asr #28
 494:	0d44010b 	stfeqe	f0, [r4, #-44]	; 0xffffffd4
 498:	0000000b 	andeq	r0, r0, fp
 49c:	00000018 	andeq	r0, r0, r8, lsl r0
 4a0:	00000454 	andeq	r0, r0, r4, asr r4
 4a4:	00001404 	andeq	r1, r0, r4, lsl #8
 4a8:	00000034 	andeq	r0, r0, r4, lsr r0
 4ac:	11040e44 	tstne	r4, r4, asr #28
 4b0:	0d44010b 	stfeqe	f0, [r4, #-44]	; 0xffffffd4
 4b4:	0000000b 	andeq	r0, r0, fp
 4b8:	00000018 	andeq	r0, r0, r8, lsl r0
 4bc:	00000454 	andeq	r0, r0, r4, asr r4
 4c0:	00001438 	andeq	r1, r0, r8, lsr r4
 4c4:	00000024 	andeq	r0, r0, r4, lsr #32
 4c8:	11040e44 	tstne	r4, r4, asr #28
 4cc:	0d44010b 	stfeqe	f0, [r4, #-44]	; 0xffffffd4
 4d0:	0000000b 	andeq	r0, r0, fp
 4d4:	00000018 	andeq	r0, r0, r8, lsl r0
 4d8:	00000454 	andeq	r0, r0, r4, asr r4
 4dc:	0000145c 	andeq	r1, r0, ip, asr r4
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
 508:	00001480 	andeq	r1, r0, r0, lsl #9
 50c:	00000070 	andeq	r0, r0, r0, ror r0
 510:	11040e44 	tstne	r4, r4, asr #28
 514:	0d44010b 	stfeqe	f0, [r4, #-44]	; 0xffffffd4
 518:	0000000b 	andeq	r0, r0, fp
 51c:	00000018 	andeq	r0, r0, r8, lsl r0
 520:	000004f0 	strdeq	r0, [r0], -r0
 524:	000014f0 	strdeq	r1, [r0], -r0
 528:	00000068 	andeq	r0, r0, r8, rrx
 52c:	11040e44 	tstne	r4, r4, asr #28
 530:	0d44010b 	stfeqe	f0, [r4, #-44]	; 0xffffffd4
 534:	0000000b 	andeq	r0, r0, fp
 538:	0000001c 	andeq	r0, r0, ip, lsl r0
 53c:	000004f0 	strdeq	r0, [r0], -r0
 540:	00001558 	andeq	r1, r0, r8, asr r5
 544:	000000d4 	ldrdeq	r0, [r0], -r4
 548:	110c0e44 	tstne	ip, r4, asr #28
 54c:	0b11010e 	bleq	44098c <bss_end+0x43d6b4>
 550:	03041102 	movweq	r1, #16642	; 0x4102
 554:	040b0c44 	streq	r0, [fp], #-3140	; 0xc44
 558:	00000018 	andeq	r0, r0, r8, lsl r0
 55c:	000004f0 	strdeq	r0, [r0], -r0
 560:	0000162c 	andeq	r1, r0, ip, lsr #12
 564:	000000b8 	strheq	r0, [r0], -r8
 568:	11040e44 	tstne	r4, r4, asr #28
 56c:	0d44010b 	stfeqe	f0, [r4, #-44]	; 0xffffffd4
 570:	0000000b 	andeq	r0, r0, fp
 574:	00000018 	andeq	r0, r0, r8, lsl r0
 578:	000004f0 	strdeq	r0, [r0], -r0
 57c:	000016e4 	andeq	r1, r0, r4, ror #13
 580:	00000078 	andeq	r0, r0, r8, ror r0
 584:	11040e44 	tstne	r4, r4, asr #28
 588:	0d44010b 	stfeqe	f0, [r4, #-44]	; 0xffffffd4
 58c:	0000000b 	andeq	r0, r0, fp
 590:	00000018 	andeq	r0, r0, r8, lsl r0
 594:	000004f0 	strdeq	r0, [r0], -r0
 598:	0000175c 	andeq	r1, r0, ip, asr r7
 59c:	000000a4 	andeq	r0, r0, r4, lsr #1
 5a0:	11040e44 	tstne	r4, r4, asr #28
 5a4:	0d44010b 	stfeqe	f0, [r4, #-44]	; 0xffffffd4
 5a8:	0000000b 	andeq	r0, r0, fp
 5ac:	00000018 	andeq	r0, r0, r8, lsl r0
 5b0:	000004f0 	strdeq	r0, [r0], -r0
 5b4:	00001800 	andeq	r1, r0, r0, lsl #16
 5b8:	00000098 	muleq	r0, r8, r0
 5bc:	11040e44 	tstne	r4, r4, asr #28
 5c0:	0d44010b 	stfeqe	f0, [r4, #-44]	; 0xffffffd4
 5c4:	0000000b 	andeq	r0, r0, fp
 5c8:	00000018 	andeq	r0, r0, r8, lsl r0
 5cc:	000004f0 	strdeq	r0, [r0], -r0
 5d0:	00001898 	muleq	r0, r8, r8
 5d4:	000000d4 	ldrdeq	r0, [r0], -r4
 5d8:	11040e44 	tstne	r4, r4, asr #28
 5dc:	0d44010b 	stfeqe	f0, [r4, #-44]	; 0xffffffd4
 5e0:	0000000b 	andeq	r0, r0, fp
 5e4:	0000001c 	andeq	r0, r0, ip, lsl r0
 5e8:	000004f0 	strdeq	r0, [r0], -r0
 5ec:	0000196c 	andeq	r1, r0, ip, ror #18
 5f0:	000000a8 	andeq	r0, r0, r8, lsr #1
 5f4:	11080e44 	tstne	r8, r4, asr #28
 5f8:	0411010b 	ldreq	r0, [r1], #-267	; 0x10b
 5fc:	0b0c4402 	bleq	31160c <bss_end+0x30e334>
 600:	00000004 	andeq	r0, r0, r4
 604:	0000001c 	andeq	r0, r0, ip, lsl r0
 608:	000004f0 	strdeq	r0, [r0], -r0
 60c:	00001a14 	andeq	r1, r0, r4, lsl sl
 610:	000000c4 	andeq	r0, r0, r4, asr #1
 614:	11080e44 	tstne	r8, r4, asr #28
 618:	0411010b 	ldreq	r0, [r1], #-267	; 0x10b
 61c:	0b0c4402 	bleq	31162c <bss_end+0x30e354>
 620:	00000004 	andeq	r0, r0, r4
 624:	00000018 	andeq	r0, r0, r8, lsl r0
 628:	000004f0 	strdeq	r0, [r0], -r0
 62c:	00001ad8 	ldrdeq	r1, [r0], -r8
 630:	00000068 	andeq	r0, r0, r8, rrx
 634:	11040e44 	tstne	r4, r4, asr #28
 638:	0d44010b 	stfeqe	f0, [r4, #-44]	; 0xffffffd4
 63c:	0000000b 	andeq	r0, r0, fp
 640:	00000018 	andeq	r0, r0, r8, lsl r0
 644:	000004f0 	strdeq	r0, [r0], -r0
 648:	00001b40 	andeq	r1, r0, r0, asr #22
 64c:	00000054 	andeq	r0, r0, r4, asr r0
 650:	11040e44 	tstne	r4, r4, asr #28
 654:	0d44010b 	stfeqe	f0, [r4, #-44]	; 0xffffffd4
 658:	0000000b 	andeq	r0, r0, fp
 65c:	00000018 	andeq	r0, r0, r8, lsl r0
 660:	000004f0 	strdeq	r0, [r0], -r0
 664:	00001b94 	muleq	r0, r4, fp
 668:	00000080 	andeq	r0, r0, r0, lsl #1
 66c:	11040e44 	tstne	r4, r4, asr #28
 670:	0d44010b 	stfeqe	f0, [r4, #-44]	; 0xffffffd4
 674:	0000000b 	andeq	r0, r0, fp
 678:	00000018 	andeq	r0, r0, r8, lsl r0
 67c:	000004f0 	strdeq	r0, [r0], -r0
 680:	00001c14 	andeq	r1, r0, r4, lsl ip
 684:	000000c4 	andeq	r0, r0, r4, asr #1
 688:	11040e44 	tstne	r4, r4, asr #28
 68c:	0d44010b 	stfeqe	f0, [r4, #-44]	; 0xffffffd4
 690:	0000000b 	andeq	r0, r0, fp
 694:	00000018 	andeq	r0, r0, r8, lsl r0
 698:	000004f0 	strdeq	r0, [r0], -r0
 69c:	00001cd8 	ldrdeq	r1, [r0], -r8
 6a0:	00000098 	muleq	r0, r8, r0
 6a4:	11040e44 	tstne	r4, r4, asr #28
 6a8:	0d44010b 	stfeqe	f0, [r4, #-44]	; 0xffffffd4
 6ac:	0000000b 	andeq	r0, r0, fp
 6b0:	00000018 	andeq	r0, r0, r8, lsl r0
 6b4:	000004f0 	strdeq	r0, [r0], -r0
 6b8:	00001d70 	andeq	r1, r0, r0, ror sp
 6bc:	0000007c 	andeq	r0, r0, ip, ror r0
 6c0:	11040e44 	tstne	r4, r4, asr #28
 6c4:	0d44010b 	stfeqe	f0, [r4, #-44]	; 0xffffffd4
 6c8:	0000000b 	andeq	r0, r0, fp
 6cc:	00000018 	andeq	r0, r0, r8, lsl r0
 6d0:	000004f0 	strdeq	r0, [r0], -r0
 6d4:	00001dec 	andeq	r1, r0, ip, ror #27
 6d8:	00000090 	muleq	r0, r0, r0
 6dc:	11040e44 	tstne	r4, r4, asr #28
 6e0:	0d44010b 	stfeqe	f0, [r4, #-44]	; 0xffffffd4
 6e4:	0000000b 	andeq	r0, r0, fp
 6e8:	00000018 	andeq	r0, r0, r8, lsl r0
 6ec:	000004f0 	strdeq	r0, [r0], -r0
 6f0:	00001e7c 	andeq	r1, r0, ip, ror lr
 6f4:	00000118 	andeq	r0, r0, r8, lsl r1
 6f8:	11040e44 	tstne	r4, r4, asr #28
 6fc:	0d44010b 	stfeqe	f0, [r4, #-44]	; 0xffffffd4
 700:	0000000b 	andeq	r0, r0, fp
 704:	00000018 	andeq	r0, r0, r8, lsl r0
 708:	000004f0 	strdeq	r0, [r0], -r0
 70c:	00001f94 	muleq	r0, r4, pc
 710:	000000a8 	andeq	r0, r0, r8, lsr #1
 714:	11040e44 	tstne	r4, r4, asr #28
 718:	0d44010b 	stfeqe	f0, [r4, #-44]	; 0xffffffd4
 71c:	0000000b 	andeq	r0, r0, fp
 720:	00000018 	andeq	r0, r0, r8, lsl r0
 724:	000004f0 	strdeq	r0, [r0], -r0
 728:	0000203c 	andeq	r2, r0, ip, lsr r0
 72c:	0000007c 	andeq	r0, r0, ip, ror r0
 730:	11040e44 	tstne	r4, r4, asr #28
 734:	0d44010b 	stfeqe	f0, [r4, #-44]	; 0xffffffd4
 738:	0000000b 	andeq	r0, r0, fp
 73c:	0000001c 	andeq	r0, r0, ip, lsl r0
 740:	000004f0 	strdeq	r0, [r0], -r0
 744:	000020b8 	strheq	r2, [r0], -r8
 748:	000000ac 	andeq	r0, r0, ip, lsr #1
 74c:	11080e44 	tstne	r8, r4, asr #28
 750:	0b11010e 	bleq	440b90 <bss_end+0x43d8b8>
 754:	0b0c4402 	bleq	311764 <bss_end+0x30e48c>
 758:	00000004 	andeq	r0, r0, r4
 75c:	00000018 	andeq	r0, r0, r8, lsl r0
 760:	000004f0 	strdeq	r0, [r0], -r0
 764:	00002164 	andeq	r2, r0, r4, ror #2
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
 790:	00002204 	andeq	r2, r0, r4, lsl #4
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
 7bc:	000022e8 	andeq	r2, r0, r8, ror #5
 7c0:	00000020 	andeq	r0, r0, r0, lsr #32
 7c4:	11080e44 	tstne	r8, r4, asr #28
 7c8:	0b11010e 	bleq	440c08 <bss_end+0x43d930>
 7cc:	0b0c4402 	bleq	3117dc <bss_end+0x30e504>
 7d0:	00000004 	andeq	r0, r0, r4
 7d4:	0000001c 	andeq	r0, r0, ip, lsl r0
 7d8:	000007a4 	andeq	r0, r0, r4, lsr #15
 7dc:	00002308 	andeq	r2, r0, r8, lsl #6
 7e0:	00000020 	andeq	r0, r0, r0, lsr #32
 7e4:	11080e44 	tstne	r8, r4, asr #28
 7e8:	0b11010e 	bleq	440c28 <bss_end+0x43d950>
 7ec:	0b0c4402 	bleq	3117fc <bss_end+0x30e524>
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
  74:	7b000200 	blvc	87c <nand_reset>
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
 11c:	00045800 	andeq	r5, r4, r0, lsl #16
 120:	7b000200 	blvc	928 <nand_PageRead+0x48>
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
 1cc:	7b000200 	blvc	9d4 <nand_PageWrite+0x18>
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
 278:	7b000200 	blvc	a80 <nand_PageWrite+0xc4>
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
 324:	7b000200 	blvc	b2c <nand_to_ram+0x70>
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
 3d0:	7b000200 	blvc	bd8 <trap_init>
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
 47c:	7b000200 	blvc	c84 <putc+0x1c>
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
 534:	7b000200 	blvc	d3c <ugets>
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
 5e0:	7b000200 	blvc	de8 <itoa+0x20>
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
 68c:	7b000200 	blvc	e94 <itoa+0xcc>
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
 738:	7b000200 	blvc	f40 <xtoa+0x68>
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
 7e4:	7b000200 	blvc	fec <xtoa+0x114>
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
 890:	7b000200 	blvc	1098 <uprintf+0x4c>
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
 93c:	7b000200 	blvc	1144 <uprintf+0xf8>
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
 9a8:	0bc05d00 	bleq	ff017db0 <bss_end+0xff014ad8>
 9ac:	0bc40000 	bleq	ff1009b4 <bss_end+0xff0fd6dc>
 9b0:	00020000 	andeq	r0, r2, r0
 9b4:	0bc4047d 	bleq	ff101bb0 <bss_end+0xff0fe8d8>
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
 9e8:	7b000200 	blvc	11f0 <uprintf+0x1a4>
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
 a94:	7b000200 	blvc	129c <load_app+0x18>
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
  3c:	e2000001 	and	r0, r0, #1
  40:	25000001 	strcs	r0, [r0, #-1]
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
  80:	d4006e69 	strle	r6, [r0], #-3689	; 0xe69
  84:	70000001 	andvc	r0, r0, r1
  88:	00000063 	andeq	r0, r0, r3, rrx
  8c:	00c80000 	sbceq	r0, r8, r0
  90:	00020000 	andeq	r0, r2, r0
  94:	000002e2 	andeq	r0, r0, r2, ror #5
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
 160:	0000050e 	andeq	r0, r0, lr, lsl #10
 164:	0000003b 	andeq	r0, r0, fp, lsr r0
 168:	00000025 	andeq	r0, r0, r5, lsr #32
 16c:	70617274 	rsbvc	r7, r1, r4, ror r2
 170:	696e695f 	stmdbvs	lr!, {r0, r1, r2, r3, r4, r6, r8, fp, sp, lr}^
 174:	00000074 	andeq	r0, r0, r4, ror r0
 178:	00610000 	rsbeq	r0, r1, r0
 17c:	00020000 	andeq	r0, r2, r0
 180:	00000549 	andeq	r0, r0, r9, asr #10
 184:	0000023f 	andeq	r0, r0, pc, lsr r2
 188:	00000055 	andeq	r0, r0, r5, asr r0
 18c:	74726175 	ldrbtvc	r6, [r2], #-373	; 0x175
 190:	6e695f30 	mcrvs	15, 3, r5, cr9, cr0, {1}
 194:	6a007469 	bvs	1d340 <bss_end+0x1a068>
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
 1e4:	00078800 	andeq	r8, r7, r0, lsl #16
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
 24c:	000008bc 	undefined instruction 0x000008bc
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
 29c:	00095300 	andeq	r5, r9, r0, lsl #6
 2a0:	00074b00 	andeq	r4, r7, r0, lsl #22
 2a4:	00002500 	andeq	r2, r0, r0, lsl #10
 2a8:	6c656400 	cfstrdvs	mvd6, [r5]
 2ac:	6a007961 	bvs	1e838 <bss_end+0x1b560>
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
 344:	6b726270 	blvs	1c98d0c <bss_end+0x1c95a34>
 348:	0004ac00 	andeq	sl, r4, r0, lsl #24
 34c:	6d656d00 	stclvs	13, cr6, [r5]
 350:	00746573 	rsbseq	r6, r4, r3, ror r5
 354:	000004ff 	strdeq	r0, [r0], -pc
 358:	636d656d 	cmnvs	sp, #457179136	; 0x1b400000
 35c:	68007970 	stmdavs	r0, {r4, r5, r6, r8, fp, ip, sp, lr}
 360:	6d000005 	stcvs	0, cr0, [r0, #-20]	; 0xffffffec
 364:	6f6d6d65 	svcvs	0x006d6d65
 368:	ca006576 	bgt	19948 <bss_end+0x16670>
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
 3a0:	109e0002 	addsne	r0, lr, r2
 3a4:	00b30000 	adcseq	r0, r3, r0
 3a8:	00250000 	eoreq	r0, r5, r0
 3ac:	656d0000 	strbvs	r0, [sp]!
 3b0:	6e695f6d 	cdpvs	15, 6, cr5, cr9, cr13, {3}
 3b4:	00007469 	andeq	r7, r0, r9, ror #8
 3b8:	20000000 	andcs	r0, r0, r0
 3bc:	02000000 	andeq	r0, r0, #0
 3c0:	00115100 	andseq	r5, r1, r0, lsl #2
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
  1c:	6b726f77 	blvs	1c9be00 <bss_end+0x1c98b28>
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
 1e8:	6b00616f 	blvs	187ac <bss_end+0x154d4>
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
 258:	6b00656c 	blvs	19810 <bss_end+0x16538>
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
 2a8:	6b007469 	blvs	1d454 <bss_end+0x1a17c>
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

