# Arch 安装

官方安装指南: <https://wiki.archlinuxcn.org/wiki/%E5%AE%89%E8%A3%85%E6%8C%87%E5%8D%97>.

## 前置条件

1. U 盘: 将被格式化, 因此应先转移U盘内已有的数据.
2. 良好的网络: 安装时会使用到网络.
3. 充足的电量: Arch 需要手动安装, 这个过程通常会比自动安装需要更长的时间.
4. 准备安装 Arch Linux 的电脑有至少 3 GiB 的外存空间.

## 下载镜像文件

从[官网](https://archlinux.org/download/)下载镜像文件和 PGP 签名文件.

![Image and sig file](assets/image_and_sig_file.png)

## 验证镜像文件 (可选)

使用 PGP 验证镜像文件.

### GUI

如果已安装 Kleopatra, 可以直接双击签名文件进行验证.

如果提示密钥未知, 点击 `Search` 来从服务器上搜索该密钥. 导入对应密钥后将自动重新验证.

![Verification success](assets/verification_success.png)

出现以上信息则表示验证成功.

### CLI

```console
> gpg --keyserver-options auto-key-retrieve --verify .\archlinux-2024.12.01-x86_64.iso.sig
gpg: assuming signed data in '.\\archlinux-2024.12.01-x86_64.iso'
gpg: Signature made 12/01/24 05:50:47 GMT Standard Time
gpg:                using EDDSA key 3E80CA1A8B89F69CBA57D98A76A5EF9054449A5C
gpg:                issuer "pierre@archlinux.org"
gpg: Good signature from "Pierre Schmitz <pierre@archlinux.org>" [full]
gpg:                 aka "Pierre Schmitz <pierre@archlinux.de>" [full]
```

出现以上信息则表示验证成功.

!!! info
其他验证方法 (如 sha256sum) 请参考[官网](https://archlinux.org/download/)上的 `Download verification` 部分.

## Live USB

将镜像文件 (即下载的 iso 文件) 烧录到 U 盘中, 然后从 U 盘启动 Arch Linux.  
后续将通过从 U 盘上启动的 Arch Linux 来为电脑安装新的 Arch Linux.

## 从 Live USB 启动

成功启动后应该能看到如下界面:

![Screenshot](assets/screenshot_1.png)

若命令输出大量内容可能超出显示范围, 可以将其传递给 `less` 命令来查看完整内容, 如: `ip addr | less`.  
通过 `Ctrl` `Alt` F1-6 切换到其他终端, 可同时执行命令.

如遇到空间不足的问题, 可以通过下面命令解决:

```console
# mount -o remount,size=2G /run/archiso/cowspace
```

## 连接 Wi-Fi

```console
# iwctl
[iwd]# device list                   # 列出无线网卡
[iwd]# station wlan0 scan
[iwd]# station wlan0 get-networks
[iwd]# station wlan0 connect <ESSID> # 连接指定 Wi-Fi, 连接成功后对应 Network name 的左侧会出现 `>` 标识
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

在 Arch Linux 官方提供的[生成器](https://archlinux.org/mirrorlist/)中选择自己所在的国家, 获取镜像源列表. 然后将内容写入到 `/etc/pacman.d/mirrorlist` 中, 替换原有内容.

## 分区

### 布局

| 路径                        | 挂载点  | 类型                | 建议大小                                                        |
|-----------------------------|---------|---------------------|-----------------------------------------------------------------|
| `/dev/efi_system_partition` | `/boot` | EFI System          | 1 GiB                                                           |
| `/dev/root_partition`       | `/`     | Linux root (x86-64) | 除了 EFI 系统分区和交换分区的全部剩余空间                       |
| `/dev/swap_partition`       |         | Linux swap          | RAM 大小的一到两倍. 如果需要支持休眠, 则必须至少与 RAM 大小相等 |

!!! info
    如果硬盘为 SSD/HDD 混合, 应将交换分区划分在 SSD 上.

### 分区

!!! danger
    该步骤存在较高风险, 需谨慎操作.  
    如果已经安装了 Windows, 注意不要修改属于 Windows 的 NTFS 文件系统类型的分区.  
    可以使用 `lsblk --fs` 查看文件系统类型.

```console
# fdisk -l       # 查看当前分区布局
# fdisk /dev/sda # 对 sda 进行分区
```

fdisk 分区常用命令:

- `help`: 查看指令和帮助.
- `p`: 查看当前分区方案.
- `g`: 创建新的空白 GPT 分区表, 即删除当前硬盘的全部分区.
- `n`: 创建新分区.
- `t`: 标记分区.
- `w`: 写入, 执行该命令后先前的修改才会生效.

关于 fdisk 的详细使用方法请参考 [Gentoo 手册](https://wiki.gentoo.org/wiki/Handbook:AMD64/Full/Installation#Partitioning_the_disk_with_GPT_for_UEFI).

## 创建文件系统

创建分区后, 就需要选择合适的文件系统对分区进行格式化.  
根分区建议使用的文件系统为:

- btrfs[^1]: 更新一代的文件系统. 提供先进特性如快照/通过校验和进行自我修复/透明压缩/子卷和集成 RAID.
- ext4: 一个可靠的/通用的/全平台的文件系统, 尽管它缺少现代特性如 reflinks.

其他文件系统请参考 [Gentoo 手册](https://wiki.gentoo.org/wiki/Handbook:AMD64/Full/Installation#Filesystems)和 [ArchWiki](https://wiki.archlinux.org/title/File_systems#Types_of_file_systems).

[^1]: btrfs 的[主要特性已经稳定](https://btrfs.readthedocs.io/en/latest/Status.html#overview). 越来越多的发行版已经将 btrfs 作为默认文件系统, 从最早的 SUSE Linux (2013), Fedora (2020) 到最近的 Manjaro (2025).

如果对 btrfs 兴趣不大, 只是想快速且简单的完成系统的安装, 建议使用 ext4.  
后续可以通过 `btrfs-convert` 命令将 ext4 转换为 btrfs, 反之则无法直接转换, 需要先对数据进行备份, 会麻烦许多.

选择合适的文件系统来格式化分区, 下面以 btrfs 为例:

```console
# mkfs.fat -F 32 /dev/efi_system_partition
# mkfs.btrfs /dev/root_partition
# mkswap /dev/swap_partition
```

[UEFI 规范]规定 EFI 系统分区**必须**使用 FAT 文件系统. 建议使用 FAT32, FAT12 与 FAT16 更适合可移动介质.

[UEFI 规范]: https://uefi.org/sites/default/files/resources/UEFI_Spec_2_10_A_Aug8.pdf

### 创建子卷

| 名称         | 挂载点        | 建议挂载参数    |
|--------------|---------------|-----------------|
| `@`          | `/`           | `compress=zstd` |
| `@home`      | `/home`       | `compress=zstd` |
| `@var`       | `/var/log`    | `nodatacow`     |
| `@cache`     | `/var/cache`  | `nodatacow`     |
| `@snapshots` | `/.snapshots` |                 |

用户可以根据自己的需求创建子卷, 比如游戏玩家可以创建 `@games` 子卷, 用于存储游戏.  
创建子卷的主要目的是允许为不同的子卷配置不同的挂载参数, 以及进行单独的快照.

其他挂载参数可以在 [btrfs 文档](https://btrfs.readthedocs.io/en/latest/Administration.html)中查看.

```console
# mount /dev/root_partition /mnt
# cd /mnt
# btrfs subvolume create @
# btrfs subvolume create @home
# btrfs subvolume create @log
# btrfs subvolume create @cache
# btrfs subvolume create @snapshots
# umount /mnt
```

创建交换分区使用的命令是 `mkswap`.

## 挂载分区

```console
# mount -o subvol=@ /dev/root_partition /mnt
# mount --mkdir /dev/efi_system_partition /mnt/boot
# mount -o subvol=@home /dev/root_partition /mnt/home
# mount -o subvol=@log /dev/root_partition /mnt/var/log
# mount -o subvol=@cache /dev/root_partition /mnt/var/cache
# mount -o subvol=@snapshots /dev/root_partition /mnt/.snapshots
# lsblk
```

如果有 swap 分区, 还需执行下面命令:

```console
# swapon /dev/swap_partition
```

## 安装

```console
# pacstrap /mnt linux linux-firmware base base-devel
```

通过 Arch Linux 提供的脚本 `pacstrap` 安装:

- `linux`: Linux 内核.
- `linux-firmware`: 固件. 确保硬件 (网卡等) 能正常运行.
- `base`: 基本系统组件, 如 `systemd`.
- `base-devel`: 基本开发工具链, 如 `gcc`. 确保能通过包管理器安装软件.

此处还可以附加其他想要安装的软件, 也可以在后续 chroot 进入新系统环境后再进行安装.  
通常需要安装的软件有:

- 编辑器: 如 `neovim`, `nano`.
- 网络管理器: 如 `networkmanager`.
- 文件系统工具: 如 `btrfs-progs`.

## 配置新系统

### Fstab

生成 fstab 文件, 新系统启动后将根据该文件的内容挂在分区.

```console
# genfstab -U /mnt >> /mnt/etc/fstab
```

参数 `-U` 表示使用 UUID 来挂载分区, 否则将使用设备名来挂载. 前者是始终不变的, 而后者可能会改变, 进而导出系统出现启动错误.

### Chroot

通过 Arch Linux 提供的脚本 `arch-chroot` 进入新系统环境.

```console
# arch-chroot /mnt /bin/bash
```

进入新系统环境后, 执行的操作将会应用在新系统上, 比如执行 `pacman -S` 会将包安装在新系统中.

### 安装网络管理器

根据系统的用途选择合适的网络管理器.

```console
[]# pacman -S networkmanager
[]# systemctl enable NetworkManager
```

!!! warning
    跳过该步骤可能导致新系统无法连接网络, 进而无法再安装网络管理器.

### 安装 microcode

根据 CPU 品牌安装 microcode, 只需要安装一个.

```console
[]# pacman -S intel-ucode # Intel CPU
[]# pacman -S amd-ucode   # AMD CPU
```

### 设置密码

通过下面的命令为 root 设置密码:

```console
[]# passwd
```

!!! warning
    使用数字键盘时需注意 `Num Lock`.

### 设置语言

修改文件 `/etc/local.gen`, 取消需要使用语言的注释, 可以同时启用 UTF-8 和 ISO-8859-1.

应用修改:

```console
[]# locale-gen
```

修改文件 `/etc/locale.conf`, 添加下面内容来设置需要使用的语言:

```conf
LANG=en-US.UTF-8
```

### 设置主机名

修改文件 `/etc/hostname`, 填写主机名.

### 设置时区

利用补全功能选择时区.

```console
[]# ln -sf /user/share/zoneinfo/Asia/Shanghai /etc/localtime
```

详情请参考 [ArchWiki](https://wiki.archlinux.org/title/System_time#Time_zone).

### 安装引导加载程序

引导加载程序 (boot loader) 负责在开机时引导操作系统启动.  
建议使用的引导加载程序为:

- GRUB.
- systemd-boot.

下面将以 GRUB 为例.

### 安装 GRUB

TODO: grub-btrfs

```console
[]# pacman -S grub efibootmgr os-prober
[]# grub-install /dev/sda
[]# grub-mkconfig -o /boot/grub/grub.cfg
```

!!! warning
    跳过该步骤将直接导致新系统无法启动, 除非多系统已经安装过 GRUB.

## 重启

```console
[]# exit
# umount -R /mnt
# reboot
```

## 连接网络

如果按照的网络管理器为 NetworkManager, 则可以通过 `nmtui` 命令启动 TUI 来连接网络.

## 安装 KDE Plasma

### 添加用户

创建用户并设置密码.

### 用户组权限管理

```console
# useradd -m -G wheel <username> # 创建家目录并将用户添加到 wheel 用户组. useradd --create-home --groups <username>
# passwd <username>
```

https://wiki.archlinux.org/title/Users_and_groups#User_groups

### 手动权限管理

```console
# useradd <username>
# passwd <username>

# mkdir /home/<username>
# chown <username> /home/<username>
# chgrp <username> /home/<username>
# chmod 700 /home/<username>
```

!!! info
    Arch Linux 默认不包含 `adduser`, 可以从 AUR 安装. 但是 AUR 安装器通常需要非 root 权限用户. 因此手动添加用户.

### 安装 Plasma

```console
# pacman -S plasma-meta
```

建议选项:

- 音频: `pipewire-jack`.
- 字体: `noto-fonts`.

显示服务器建议默认使用 Wayland, 较为保守的用户可以使用 X Window System.

```console
# pacman -S plasma-wayland-session
```

可以选择性安装模拟终端, 以便在桌面环境下使用终端.

```console
pacman -S alacritty
```

或者在进入桌面环境后, 通过组合按键 `Ctrl` `Alt` `F3` 切换到其他 TTY, 通过组合按键 `Ctrl` `Alt` `F2` 切回桌面环境.

---

开启 SDDM 自动登录

---

```console
sudo systemctl enable sddm.service
```

---

```
xdg-user-dirs-update
```

## 启用 pacman 彩色输出

从文件 `/etc/pacman.conf` 中取消注释 `Color`.
