# Manjaro 安装

在硬盘的指定位置安装 [Manjaro](https://manjaro.org/), 适用于普通用户/多系统用户/SSD与HDD混合的用户.  

## 条件

1.  U 盘: 将被格式化, 因此应先转移U盘内已有的数据.
2. 良好的网络: 安装时会使用到网络.
3. 充足的电量.

## 梗概

1. 制作 Manjaro 的 USB 启动盘(Live USB).
2. 从 U 盘启动 Manjaro.
3. 利用 Manjaro 自带的安装程序安装 Manjaro 到硬盘.

## 下载系统镜像

从[官网](https://manjaro.org/download/)下载系统镜像.  

![Manjaro official webside](assets/manjaro_official_gnome.png){ width=40% style="display: block; margin: 0 auto" }  

默认是 `Full` 完整版, 也可以选择 `Minimal` 最小版, 仅提供了基本的桌面环境, 没有安装附加的软件.  
点击 `Image` 直接下载镜像文件, 点击 `Torrent` 下载种子文件.  

若使用种子下载需使用专门的下载器进行下载.  

![Download Manjaro ISO](assets/download_manjaro_iso.png){ width=70% style="display: block; margin: 0 auto" }  

## 下载烧录软件

从[官网](http://rufus.ie/zh/)下载软件.  

![Rufus official webside](assets/rufus_official_download.png){ width=70% style="display: block; margin: 0 auto" }  

!!! warning
    自动更新可能失效, 新的系统镜像使用较早版本的 Rufus 可能导致失败, 因此建议从官网下载最新版本.  

## 烧录镜像到 U 盘中

1. 插入 U 盘.
2. 选项设置可参考下图.

    ![Rufus usage](assets/rufus_usage.png){ width=50% }  <!-- FIXME -->

3. 点击 `开始` 按钮.

Rufus 快速格式化 U 盘并开始写入镜像, 耗时大约 3-5 min.  

## 从 U 盘中启动

开机时按下指定按键进入 BIOS 设置, 然后选择从 U 盘启动.  

| 制造商  | 按键             |
| ------- | ---------------- |
| Acer    | F12, F9, F2, Esc |
| Apple   | Option           |
| Asus    | Esc              |
| Clevo   | F7               |
| Dell    | F12              |
| Fujitsu | F12, Esc         |
| HP      | F9               |
| Huawei  | F12              |
| Intel   | F10              |
| Lenovo  | F12              |
| MSI     | F11              |
| Samsung | Esc, F12, F2     |
| Sony    | F11, Esc, F10    |
| Toshiba | F12              |
| others  | F12, Esc         |

!!! tip
    不同电脑进入 BIOS 设置的方式和从 U 盘启动的操作不同, 需根据自己的电脑型号查找具体操作方式.  

!!! warning
    修改前需拍照备份, 方便失败后复原.  

## [更新 pacman 镜像源](./Arch_包管理.md)

后续安装将使用到 pacman 下载内容, 因此提前更新镜像源可以提高成功率.  

## 安装 Manjaro

### 欢迎

![Manjaro Hello](assets/1_manjaro_hello.png){ width=80% style="display: block; margin: 0 auto" }  

点击窗口最下方的 `Launch installer`.  

![Manjaro Linux Installer](assets/2_manjaro_linux_installer.png){ width=80% style="display: block; margin: 0 auto" }  

### 位置

选择时区和系统语言.  

![Time zone and system language](assets/3_location.png){ width=80% style="display: block; margin: 0 auto" }  

### 键盘

选择键盘类型与布局, 通常默认设置即可.  
如果使用的不是美式键盘或布局不是 QWERTY 则需注意.  
该选项可以在安装后到 Manjaro Settings 中调整.  

![Keyboard layout](assets/4_keyboard.png){ width=80% style="display: block; margin: 0 auto" }  

### 分区

!!! danger
    该步骤存在较高风险, 需谨慎操作.  
    如果已经安装了 Windows, 注意不要修改属于 Windows 的 NTFS 文件系统类型的分区.  

选择手动分区.  

![Partitions](assets/5_partitions.png){ width=80% style="display: block; margin: 0 auto" }  

根据硬盘类型和空间进行分区. 在进行分区时, 应该先对 [FHS] 具有基本了解.  

- SSD: EFI(`/boot/efi`), root(`/`), swap.
- HDD: home(`/home`).

![efi](assets/6_efi.png){ width=80% }  
![root](assets/7_root.png){ width=80% }  
![swap](assets/8_swap.png){ width=80% }  
![var](assets/9_var.png){ width=80% }  
![home](assets/10_home.png){ width=80% }  

![overview 1](assets/11_overview_1.png){ width=80% }  
![overview 2](assets/12_overview_2.png){ width=80% }  

### 用户

设置用户名/计算机名/密码.  

![Users](assets/13_users.png){ width=80% style="display: block; margin: 0 auto" }  

### 总览

![Summary](assets/14_summary.png){ width=80% style="display: block; margin: 0 auto" }  

### 安装

点击 `Install` 开始在指定分区安装 Manjaro.  

![](assets/15.png){ style="display: block; margin: 0 auto" }  
![Install](assets/16_install.png){ width=80% style="display: block; margin: 0 auto" }  

!!! info
    `misc postinstall configurations` 步骤需要调用 pacman 下载内容, 因此可能耗时较长.  

可以点击进度条右侧的按钮显示安装日志.  

![Install log](assets/17_install_log.png){ width=80% style="display: block; margin: 0 auto" }  

### 结束

系统成功安装后将显示此提示.  

![Finish](assets/18_finish.png){ width=80% style="display: block; margin: 0 auto" }  

## 安装后配置

- [包管理](./Arch_包管理.md).
- 时间同步: 在设置中开启时间同步, 如果是双系统请参考[双系统时间不一致](./双系统时间不一致.md).
- 启用备份: 使用 Timeshift 对系统进行定期备份.

## 参见

- [Manjaro Wiki](https://wiki.manjaro.org/index.php/Main_Page)

[FHS]: https://refspecs.linuxfoundation.org/FHS_3.0/index.html
