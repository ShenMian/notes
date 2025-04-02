# Termux

Termux 是一个 Android 终端模拟器.

链接移动设备需要以下软件:

- ssh: 用于互连, 使电脑可以接管移动设备.
- tmux: 用户保存会话, 保留用户在会话中的操作.

## 初始化

Termux 需要执行以下命令来启动 SSH 服务器:

```sh
pkg install openssh # 安装 SSH
passwd              # 设置登录所需密码
sshd                # 启动服务器
ifconfig            # 查看设备 IP 地址
```

## 连接移动设备

电脑通过以下命令来连接移动设备:  

```sh
ssh <IP> -p 8022 # 输入密码并登录移动设备
tmux ls          # 列出 tmux 会话
tmux a -t <name> # 接入指定会话
```

接入 tmux 会话后电脑便会显示会话内容, 可以继续工作.  
工作结束后通过 `<prefix>` `D` 分离会话, 然后结束 SSH 会话, 将工作重新交接给移动设备.  
在会话中可以使用 `<prefix>` `$` 重命名会话, 在存在多个 tmux 会话时有助于区分不同会话.

!!! warning
    若 SSH 连接过程中移动设备断开(显示连接断开或电脑端 SSH 无响应), 请确保 Termux 在正常工作中.  
    若要将 Termux 放置到后台应先允许其能在后台运行.

## 参考

- <https://www.youtube.com/watch?v=B-1wGwvUwm8&list=PLRiHAWwt3g5NZHMP3sOPHiOWCubLe230E>.
