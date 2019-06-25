#!/bin/bash

rm -rf target/

mkdir target/

nasm -f elf src/boot/kernel.asm -o target/kernel.o

ld -arch i386 -T src/boot/link.ld -o target/kernel target/kernel.o

mkisofs -R -b src/boot/grub/stage2_eltorito -no-emul-boot -boot-load-size 4 -boot-info-table -o target/bootable.iso target/kernel