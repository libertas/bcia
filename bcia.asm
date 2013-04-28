;bcia.asm
;MIT License
[section .data]
    epre db "#include <stdio.h>",10
         db "int main(){",10
         db "char tape[0xffff]={0};",10
         db "int p=0;",10,0

    e1 db "tape[p]++;",0
    e2 db "tape[p]--;",0
    e3 db "p--;",0
    e4 db "p++;",0
    e5 db "tape[p]=getchar();",0
    e6 db "putchar(tape[p]);",0
    e7 db "while(tape[p]){",0
    e8 db "}",0
    eend db "return 0;",10
         db "}",10,0

[section .text]
extern puts,getchar
global main

main:
    mov rdi,epre
    call puts

    l_start:
    mov al,0
    call getchar
    mov bl,al

    cmp bl,"+"
    je f_e1

    cmp bl,"-"
    je f_e2

    cmp bl,"<"
    je f_e3

    cmp bl,">"
    je f_e4

    cmp bl,","
    je f_e5

    cmp bl,"."
    je f_e6

    cmp bl,"["
    je f_e7

    cmp bl,"]"
    je f_e8

    cmp bl,0xFF
    jne l_start

    mov rdi,eend
    call puts
    mov rax,0
    ret

f_e1:
    mov rdi,e1
    call puts
    jmp l_start

f_e2:
    mov rdi,e2
    call puts
    jmp l_start

f_e3:
    mov rdi,e3
    call puts
    jmp l_start

f_e4:
    mov rdi,e4
    call puts
    jmp l_start

f_e5:
    mov rdi,e5
    call puts
    jmp l_start

f_e6:
    mov rdi,e6
    call puts
    jmp l_start

f_e7:
    mov rdi,e7
    call puts
    jmp l_start

f_e8:
    mov rdi,e8
    call puts
    jmp l_start
