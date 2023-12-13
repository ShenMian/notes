# Arch 安装

命令输出过长可以先传递给 `less`, 如: `ip addr | less`.  
通过 `Ctrl` `Alt` F1-6 切换到其他终端, 可同时执行命令.

## 连接 Wi-Fi

```console
# iwctl
[iwd]# device list                   # 列出无线网卡
[iwd]# station wlan0 scan
[iwd]# station wlan0 get-networks
[iwd]# station wlan0 connect <ESSID> # 连接指定 Wi-Fi, 连接成功后对应 Network name 的左侧会出现 >
[iwd]# exit                          # 连接成功后即可退出
```

```console
# nmcli dev wifi
# nmcli dev wifi connect <ESSID> password <PASSWORD>
```

## 网络

```console
# ping archlinux.org       # 检查是否有网络连接
# timedatectl set-ntp true # 时间同步
```

## 更换源

请参见: <https://archlinux.org/mirrorlist/>.

## 分区

!!! danger
该步骤存在较高风险, 需谨慎操作.  
 如果已经安装了 Windows, 注意不要修改属于 Windows 的 NTFS 文件系统类型的分区.  
 可以使用 `lsblk --fs` 查看文件系统类型.

```console
# fdisk -l
# lsblk
# cfdisk /dev/sda
# lsblk
```

现代计算机标签类型建议选择 GPT.

bootloader 分区大小通常为 128/256/512.  
创建完分区后选中该分区, 按 `b` 标记为可启动的.

按需创建其他分区, 至少创建一个. 用于存放根目录.

创建完全部分区后按 `W` 写入来应用修改. 然后按 `q` 退出.

## 格式化分区

选择合适的文件系统格式化分区.

```console
# mkfs.ext4 /dev/sda1
# mkfs.ext4 /dev/sda2
```

交换分区使用的命令是 `mkswap`.

## 挂载分区

```console
# mount /dev/sda2 /mnt
# mkdir /mnt/boot
# mount /dev/sda1 /mnt/boot
# lsblk
```

## 安装

```console
# pacstrap /mnt linux linux-firmware base base-devel neovim
```

安装基本软件. 可以将 neovim 替换成其他编辑器或使用 nano.

```console
# genfstab -U /mnt >> /mnt/etc/fstab
```

```console
# arch-chroot /mnt /bin/bash
```

## 安装 GRUB

```console
[]# pacman -S grub
[]# grub-install /dev/sda
[]# grub-mkconfig -o /boot/grub/grub.cfg
```

## 安装网络管理器

```console
[]# pacman -S networkmanager
[]# systemctl enable NetworkManager
```

## 安装 microcode

根据 CPU 安装 microcode.

```console
[]# pacman -S intel-ucode # Intel CPU
[]# pacman -S amd-ucode   # AMD CPU
```

## 设置密码

```console
[]# passwd
```

!!! warning
使用数字键盘时需注意 `Num Lock`.

## 设置语言

修改文件 `/etc/local.gen`, 取消需要使用语言的注释, 可以同时启用 UTF-8 和 ISO-8859-1.

应用修改:

```console
[]# locale-gen
```

修改文件 `/etc/locale.conf`, 添加下面内容来设置需要使用的语言:

```conf
LANG=en-US.UTF-8
```

## 设置主机名

修改文件 `/etc/hostname`, 填写主机名.

## 设置时区

利用补全功能选择时区

```console
[]# ln -sf /user/share/zoneinfo/Asia/Shanghai /etc/localtime
```

```console
[]# exit
# umount -R /mnt
# reboot
```
