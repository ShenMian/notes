# Arch 故障排除

[Arch Linux 论坛](https://forum.archlinuxcn.org/).

## HP Mute LED 不亮

安装 [MuteLED](https://github.com/username227/MuteLED):

```sh
paru -S muteled
sudo systemctl enable --now acpid.service
```

## 无音频设备

可能是由于缺少 DSP 固件, 可以通过下面命令安装开源的 SOF 固件:

```sh
sudo pacman -S sof-firmware
```

## signature from "XXX" is unknown trust

更新 keyring:

```sh
pacman -S archlinux-keyring
pacman-key -l Caleb
# 密钥过时
# 更新密钥
pacman-key --refresh-keys
pacman-key -l Caleb
# 密钥有效
```

## error: failed to run: gpg --recv-keys ...

需手动指定 keyserver, 如 `keyserver.ubuntu.com`:

```
gpg --keyserver keyserver.ubuntu.com --recv-keys F3691687D867B81B51CE07D9BBE43771487328A9 13975A70E63C361C73AE69EF6EEB81F8981C74C7 D3A93CAD751C2AF4F8C7AD516C35B99309B5FA62 86CFFCA918CF3AF47147588051E8B148A9999C34
```
