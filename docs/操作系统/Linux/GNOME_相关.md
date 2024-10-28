# GNOME 相关

## 插件

| 名称            | 描述                                |
| --------------- | ----------------------------------- |
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

### 分数倍缩放倍率(Fractional scaling)

**关键字**: HiDPI.

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
    gsettings set org.gnome.mutter experimental-features "['x11-randr-fractional-scaling']" # 启用
    gsettings reset org.gnome.mutter experimental-features                                  # 禁用
    ```

    Manjaro:

    ```sh
    sudo pacman -S mutter-x11-scaling gnome-control-center-x11-scaling
    ```

    设置完毕需要重启, 然后启用 `Settings | Displays | Fractional Scaling` 并在 `Settings | Displays | Scale` 里调整具体的缩放倍率.

增强的分数倍缩放 (GNOME 47 引入):

```sh
gsettings set org.gnome.mutter experimental-features '["scale-monitor-framebuffer", "xwayland-native-scaling"]'
```

### 桌面显示异常

比如任务栏被桌面遮挡, 可以从 Layouts 中重新设置桌面布局, 便可恢复正常.

## 参见

- [GNOME Apps](https://wiki.gnome.org/Apps).
- [GNOME Wiki](https://wiki.gnome.org/Home).
- [GNOME 插件管理](https://extensions.gnome.org/): 安装插件后可以直接利用浏览器管理 GNOME 插件.

## 默认文件管理器

打开文件夹的默认程序被设置为 VSCode.

```sh
xdg-mime default org.gnome.Nautilus.desktop inode/directory
xdg-mime query default inode/directory
```
