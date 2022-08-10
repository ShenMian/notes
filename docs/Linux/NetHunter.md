# NetHunter

基于 Kali Linux 的手机渗透测试平台.  

NetHunter 有三个版本, 以下仅说明 Rootless 版本的安装.  

## 安装 CLI

下载并安装 Termux:  

- <https://github.com/termux/termux-app/releases>
- <https://f-droid.org/packages/com.termux>

打开 Termux 并执行以下命令:  

```sh
pkg update
pkg upgrade
pkg install wget

wget -O install-nethunter-termux https://gitlab.com/kalilinux/nethunter/build-scripts/kali-nethunter-project/raw/master/nethunter-rootless/install-nethunter-termux # short url: https://bit.ly/3bvdkvh
chmod +x install-nethunter-termux
./install-nethunter-termux
```

若出现询问则直接回车选择默认值.  

- 启动 CLI: `nh`.
- 启动 CLI 以 root 权限: `nh -r`.
- 配置 GUI 密码: `nh kex passwd`.
- 启动 GUI: `nh kex`, 第一次启动可以在前台运行, 方便查看端口号.
- 启动 GUI 并驻留后台: `nh kex &`.
- 结束 GUI: `nh kex stop`.

命令 `nh` 是 `nethunter` 的别名.  

!!! success
    至此已经完成了 NetHunter 非 root 的安装, 并可以开始使用 CLI.  

## 安装 GUI

!!! warning
    安装 GUI 前请先确保已经安装了 CLI, 并通过 CLI 启动了 KeX.  

1. 下载并安装 [NetHunter App Store](https://store.nethunter.com/).  
2. 搜索关键字 `KeX` 并安装 NetHunter KeX(bVNC).  
3. 设置以下参数
    - 用户名: `kali`.
    - 密码: 先前设置的 KeX 密码.
    - 端口号: 先前启动 KeX 时输出中 `RFB PORT #` 的值.
4. 进行连接.

!!! success
    此时应该能成功看到 Kali 的 GUI 界面.  

## 参见

- <https://www.kali.org/docs/nethunter/nethunter-rootless/>

## 参考

- <https://davidbombal.wiki/nhandroid>
