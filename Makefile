
all:bcia

bcia:bcia.asm
	nasm bcia.asm -o bcia.o -f elf32
	cc bcia.o -o bcia

clean:
	rm bcia.o bcia
