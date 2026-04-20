# Manjaro 故障排除

## Timeshift

利用 Timeshift[^1] 进行备份/还原可以排除新引入的故障.

!!! warning
    Timeshift 默认并不备份用户目录, 因此当还原后问题依然存在可能是由用户目录中文件所导致的.

## sudo 密码不正确

```sh
faillock --reset
```

## Secure Boot

```sh
> sudo pacman -S sbctl
> sbctl status
Installed: ✗ sbctl is not installed
Setup Mode: ✓ Disabled
Secure Boot: ✗ Disabled
Vendor Keys: microsoft
> sbctl status
Installed: ✓ sbctl is installed
Owner GUID: 7f6711c7-2f33-42d1-b1a5-c3b00eee5758
Setup Mode: ✗ Enabled
Secure Boot: ✗ Disabled
Vendor Keys: none
> sudo sbctl create-keys
Created Owner UUID 7f6711c7-2f33-42d1-b1a5-c3b00eee5758
Creating secure boot keys...✓ 
Secure boot keys created!
> sudo sbctl enroll-keys --microsoft
Enrolling keys to EFI variables...
With vendor keys from microsoft...✓ 
Enrolled keys to the EFI variables!
> sbctl status
Installed: ✓ sbctl is installed
Owner GUID: 7f6711c7-2f33-42d1-b1a5-c3b00eee5758
Setup Mode: ✓ Disabled
Secure Boot: ✗ Disabled
Vendor Keys: microsoft
> sudo sbctl verify
Verifying file database and EFI images in /boot/efi...
✗ /boot/efi/EFI/Boot/bootx64.efi is not signed
...
> sudo sbctl sign -s /boot/efi/EFI/Manjaro/grubx64.efi
✓ Signed /boot/efi/EFI/Manjaro/grubx64.efi
> sudo sbctl verify
Verifying file database and EFI images in /boot/efi...
✓ /boot/efi/EFI/Manjaro/grubx64.efi is signed
...
> sbctl status
Installed: ✓ sbctl is installed
Owner GUID: 7f6711c7-2f33-42d1-b1a5-c3b00eee5758
Setup Mode: ✓ Disabled
Secure Boot: ✗ Disabled
Vendor Keys: microsoft
> reboot
```

## 还原用户目录

创建一个新用户, 然后拷贝其用户目录下的文件到要还原的用户目录下.

## 设置

**DE**: GNOME.

1. Settings: 系统的基本设置.
2. Tweaks: 系统的高级设置.
3. Extensions: 扩展的设置.
4. Manjaro Settings: 系统内核/驱动的设置.
5. Layouts: 桌面布局基本设置.

## ~~~~无音频输出~~

!!! info
    Manjaro 25.0 中该问题已不存在.

以下方法只能暂时缓解该问题, **暂未找到该问题的永久解决方法**.

```sh
systemctl --user restart pulseaudio.service
systemctl --user restart pulseaudio.socket

pulseaudio --check
pulseaudio --kill
pulseaudio --start

sudo gpasswd -a $USER audio
sudo killall pulseaudio

rm -R .config/pulse/
sudo pacman -S pulseaudio

amixer -D pulse sset Master toggle
```

## 目录

- 服务: `/etc/systemd`.
- 用户安装字体: `~/.local/share/fonts`.

## 参见

- [HiDPI - ArchWiki](https://wiki.archlinux.org/title/HiDPI).
- [[HowTo] Find system information - Manjaro forum](https://forum.manjaro.org/t/howto-find-system-information/105212).

[^1]: [linuxmint/timeshift](https://github.com/linuxmint/timeshift)/[teejee2008/timeshift](https://github.com/teejee2008/timeshift)(原仓库, 已停止更新)
