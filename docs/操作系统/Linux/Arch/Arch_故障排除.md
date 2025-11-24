# Arch 故障排除

[Arch Linux 论坛](https://forum.archlinuxcn.org/).

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
