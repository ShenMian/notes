# GNOME 相关

## 分数倍缩放 (Fractional scaling)

**关键字**: HiDPI.

!!! warning
    该功能为**实验性功能**, 效果较差且存在严重的性能问题. 短期内不会解决.

!!! info
    本文**不讨论 X11 的解决方案**, 如果依然在使用 X11, 建议尽快切换到 Wayland. 因为:

    - GNOME 50 弃用 X11.
    - KDE Plasma 6.8 弃用 X11.

截至 GNOME 48.3, 分数倍缩放依然为实验性功能.  
相比之下, KDE Plasma 对分数倍缩放 (Wayland 和 X11 应用) 已经有成熟和稳定的支持.

如果使用 **GNOME 47 及以上版本**, 可以通过下面命令启用实验性的分数倍缩放功能:

```sh
gsettings set org.gnome.mutter experimental-features '["scale-monitor-framebuffer", "xwayland-native-scaling"]'
```

然后在 `Settings | Displays | Scale` 里调整具体的缩放倍率.

由于 GTK 不支持分数被缩放, 因此这部分应用 (包括大部分 GNOME 原生应用) 将使用超采样来实现分数倍缩放.  
这将导致下面问题:

- 超采样通常被应用于抗锯齿, 因此应用的界面将变得模糊.
- 需要先以更高的分辨率渲染, 因此会有非常巨大的性能开销. 部分实时渲染应用可能因为严重的性能问题, 而变得不可用.

如果使用 **GNOME 46 及以下版本**, 可以通过下面命令启用实验性的分数倍缩放功能:

```sh
gsettings set org.gnome.mutter experimental-features "['scale-monitor-framebuffer']"
```

但更推荐的做法是更新到 GNOME 47 版本.

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
