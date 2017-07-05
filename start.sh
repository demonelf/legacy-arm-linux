#!/bin/bash
../../mini2440/qemu/mini2440/../arm-softmmu/qemu-system-arm -M mini2440 -m 256m -mtdblock mini2440_nand128.bin -serial stdio -nographic -gdb tcp::1234 -S
