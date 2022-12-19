# Manjaro 故障排除

## 无音频输出

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

## 桌面显示异常

比如任务栏被桌面遮挡, 可以从 Layouts 中重新设置桌面布局, 便可恢复正常.

## 还原用户目录

创建一个新用户, 然后拷贝其用户目录下的文件到要还原的用户目录下.

## Timeshift

利用 Timeshift[^1] 进行备份/还原可以排除新引入的故障.

!!! warning
    Timeshift 默认并不备份用户目录, 因此当还原后问题依然存在可能是由用户目录中文件所导致的.

## 设置

1. Settings: 系统的基本设置.
2. Tweaks: 系统的高级设置.
3. Extensions: 拓展的设置.
4. Manjaro Settings: 系统内核/驱动的设置.
5. Layouts: 桌面布局基本设置.

## 目录

- 服务: `/etc/systemd`.
- 用户安装字体: `~/.local/share/fonts`.

[^1]: [linuxmint/timeshift](https://github.com/linuxmint/timeshift)/[teejee2008/timeshift](https://github.com/teejee2008/timeshift)(原仓库, 已停止更新)
