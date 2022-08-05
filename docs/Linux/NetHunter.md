# NetHunter

下载并安装 Termux:  

- <https://github.com/termux/termux-app/releases>
- <https://f-droid.org/packages/com.termux>

打开 Termux 并执行以下命令:  

```sh
apt update
apt upgrade
apt install wget

wget -O install-nethunter-termux https://gitlab.com/kalilinux/nethunter/build-scripts/kali-nethunter-project/raw/master/nethunter-rootless/install-nethunter-termux # short url: https://bit.ly/3bvdkvh
chmod +x install-nethunter-termux
./install-nethunter-termux
```

若出现询问则直接回车选择默认值.  

- 启动 CLI: `nh`.
- 启动 CLI 以 root 权限: `nh -r`.
- 配置 GUI 密码: `nh kex passwd`.
- 启动 GUI 并驻留后台: `nh kex &`.
- 结束 GUI: `nh kex stop`.

命令 `nh` 是 `nethunter` 的别名.  

## 参考

- <https://davidbombal.wiki/nhandroid>
