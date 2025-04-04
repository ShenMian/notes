# GNOME 相关

## 分数倍缩放 (Fractional scaling)

**关键字**: HiDPI.

!!! warning
    截至 GNOME 48, 分数倍缩放依然为实验性功能. 部分 X11 应用可能存在性能和画面模糊的问题.   
    相比之下, KDE Plasma 对分数倍缩放 (Wayland 和 X11 应用) 已经有成熟和稳定的支持.

如果使用 GNOME 47 及以上版本和 Wayland, 可以通过下面命令启用实验性的分数倍缩放功能:

```sh
gsettings set org.gnome.mutter experimental-features '["scale-monitor-framebuffer", "xwayland-native-scaling"]'
```

重启以应用修改, 然后在 `Settings | Displays | Scale` 里调整具体的缩放倍率.

如果依然在使用 X11, 建议尽快切换到 Wayland. 因为 GNOME Shell 和 KDE Plasma 正在为淘汰 X11 做准备工作.

如果你使用的是 GNOME 46 及以下版本:

- Wayland

    ```sh
    gsettings set org.gnome.mutter experimental-features "['scale-monitor-framebuffer']"
    ```

- X11

    ```sh
    gsettings set org.gnome.desktop.interface text-scaling-factor 1.25
    ```

    ```sh
    yay -S mutter-x11-scaling
    gsettings set org.gnome.mutter experimental-features "['x11-randr-fractional-scaling']"
    ```

    Manjaro:

    ```sh
    sudo pacman -S mutter-x11-scaling gnome-control-center-x11-scaling
    ```

    设置完毕需要重启, 然后启用 `Settings | Displays | Fractional Scaling` 并在 `Settings | Displays | Scale` 里调整具体的缩放倍率.

禁用实验性特性:

```sh
gsettings reset org.gnome.mutter experimental-features
```

## 插件

| 名称            | 描述                                |
|-----------------|-------------------------------------|
| [Blur my Shell] | 添加模糊透明等视觉效果.             |
| [TopHat]        | 显示CPU/内存/网络/外存使用率等信息. |
| [GSConnect]     | KDE Connect.                        |

[blur my shell]: https://extensions.gnome.org/extension/3193/blur-my-shell/
[tophat]: https://extensions.gnome.org/extension/5219/tophat/
[gsconnect]: https://extensions.gnome.org/extension/1319/gsconnect/

## 无线投屏

```sh
pamac build gnome-network-displays
```

## 故障排除

### GNOME Terminal 上程序颜色显示异常

勾选 `Profile | Colors | Palette | Show bold text in bright colors`.

### 桌面显示异常

比如任务栏被桌面遮挡, 可以从 Layouts 中重新设置桌面布局, 便可恢复正常.

## 默认文件管理器

打开文件夹的默认程序被设置为 VSCode.

```sh
xdg-mime default org.gnome.Nautilus.desktop inode/directory
xdg-mime query default inode/directory
```

## 参见

- [GNOME Apps](https://wiki.gnome.org/Apps).
- [GNOME Wiki](https://wiki.gnome.org/Home).
- [GNOME 插件管理](https://extensions.gnome.org/): 安装插件后可以直接利用浏览器管理 GNOME 插件.
