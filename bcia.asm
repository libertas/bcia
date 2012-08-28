;  This program is free software; you can redistribute it and/or modify
;  it under the terms of the GNU General Public License as published by
;  the Free Software Foundation; either version 2 of the License, or
;  (at your option) any later version.
;  
;  This program is distributed in the hope that it will be useful,
;  but WITHOUT ANY WARRANTY; without even the implied warranty of
;  MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
;  GNU General Public License for more details.
;  
;  You should have received a copy of the GNU General Public License
;  along with this program; if not, write to the Free Software
;  Foundation, Inc., 51 Franklin Street, Fifth Floor, Boston,
;  MA 02110-1301, USA.
;  

section .data
	epre db "section .bss",0XA,"mem resb 30000",0XA,"section .text",0XA,"extern putchar,getchar,exit",0XA,"global main",0XA,"main:",0XA,"mov edi,mem",0XA,0
	e1 db "inc byte [edi]",0XA,0
	e2 db "dec byte [edi]",0XA,0
	e3 db "dec edi",0XA,0
	e4 db "inc edi",0XA,0
	e5 db "push dword [edi]",0xA,"call putchar",0xA,"pop esi",0xA,0
	e6 db "call getchar",0xA,"mov byte [edi],al",0xA,0
	eend db "call exit",0xA,0

section .text
extern exit,getchar,printf
global main
main:
	
	mov edx,epre
	push edx
	call printf
	pop edx
	l0:
		call getchar
		cmp eax,0xA
		je lend
		mov ebx,eax
		
		cmp ebx,"+"
		je l1
		
		cmp ebx,"-"
		je l2
		
		cmp ebx,"<"
		je l3
		
		cmp ebx,">"
		je l4
		
		cmp ebx,"."
		je l5
		
		cmp ebx,","
		je l6
		
		cmp ebx,"["
		je l7
		
		cmp ebx,"]"
		je l8
		
		jmp l0



jmp lend

l1:
	mov edx,e1
	push edx
	call printf
	pop edx
	jmp l0

l2:
	mov edx,e2
	push edx
	call printf
	pop edx
	jmp l0

l3:
	mov edx,e3
	push edx
	call printf
	pop edx
	jmp l0

l4:
	mov edx,e4
	push edx
	call printf
	pop edx
	jmp l0

l5:
	mov edx,e5
	push edx
	call printf
	pop edx
	jmp l0

l6:
	mov edx,e6
	push edx
	call printf
	pop edx
	jmp l0

l7:
	
	jmp l0

l8:
	
	jmp l0

lend:
	mov edx,eend
	push edx
	call printf
	call exit
