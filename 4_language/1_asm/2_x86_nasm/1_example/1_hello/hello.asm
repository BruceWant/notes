; install nasm on Ubuntu: sudo apt install nasm
; command: nasm -f elf32 hello.asm
; commnad: ld -m elf_i386 -s -o hello hello.o


section     .text
global      _start 
_start: 
    mov     edx,len   
    mov     ecx,msg   
    mov     ebx,1   
    mov     eax,4   
    int     0x80   
    mov     eax,1  
    int     0x80   
section     .data
msg     db  'Hello world',0xa  
len     equ $ - msg  
