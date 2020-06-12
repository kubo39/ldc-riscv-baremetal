.PHONY: all clean

CC = $(PWD)/gcc/bin/riscv64-unknown-elf-gcc
LDC = ldc2

DFLAGS = --mtriple=riscv32-unknown-none-elf -mattr=+m,+a,+c -mcpu=generic-rv32 -betterC -lib
CFLAGS = -march=rv32imac -mabi=ilp32 -nostdlib

OBJ = libhello.a
TARGET = hello

all:
	$(LDC) $(DFLAGS) -of=$(OBJ) hello.d
	$(CC) -T linker.ld boot.S $(OBJ) -o $(TARGET) $(CFLAGS)

clean:
	$(RM) *.o *.a hello
