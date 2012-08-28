section .bss
mem resb 30000
section .text
extern putchar,getchar,exit
global main
main:
mov edi,mem
call getchar
mov byte [edi],al
push dword [edi]
call putchar
pop esi
call getchar
mov byte [edi],al
push dword [edi]
call putchar
pop esi
call exit
