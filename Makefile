ASM=nasm

all:bcia

bcia:bcia.asm
	$(ASM) bcia.asm -o bcia.o -f elf64
	cc bcia.o -o bcia

.PHONY: install clean

install:all
	cp bcia /usr/local/bin/bcia

uninstall:
	rm /usr/local/bin/bcia

clean:
	rm bcia.o bcia
