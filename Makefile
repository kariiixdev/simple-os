include .env

all: setup compile deploy

setup:
	if not exist build mkdir build
compile:
	wsl $(ASSEMBLER) src/boot.s -o build/boot.o
	wsl $(LINKER) build/boot.o -o build/boot.bin -Ttext 0x7C00 --oformat=binary
deploy:
	qemu-system-x86_64 -hda build/boot.bin
