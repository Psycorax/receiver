#!/bin/sh

arm-altera-eabi-objcopy -O ihex --adjust-vma -0xc0000000 uboot-socfpga/spl/u-boot-spl preloader.hex
