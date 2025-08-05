# Flatpak 包管理

Flatpak 上的内容可以分为应用程序 (Application) 和运行时 (Runtime) 两类, 下面统称为包.

## 常用操作

```sh
flatpak update                            # 更新所有包
flatpak install <package>                 # 安装包
flatpak uninstall <package>               # 卸载包 (保留用户数据)
flatpak uninstall --delete-data <package> # 卸载包 (删除用户数据)
flatpak list                              # 列出已安装的包
flatpak uninstall --unused                # 卸载未使用的包
```

## 更换镜像源

!!! warning
    部分私有的应用程序不允许再分发, 因此安装这些包时依然需要从应用官方指定的位置下载二进制包.

执行下面命令使用 USTC 提供的 Flathub 缓存:

```sh
sudo flatpak remote-modify flathub --url=https://mirrors.ustc.edu.cn/flathub
```

还原默认官方源:

```sh
sudo flatpak remote-modify flathub --url=https://dl.flathub.org/repo
```

详情请参考 [USTC Mirror Help](https://mirrors.ustc.edu.cn/help/flathub.html).

## 工作原理

Flatpak 通过 OSTree 管理软件包, 其应用程序和运行时的安装目录位于 OSTree 仓库中.

TODO

## 主题安装

项目 [stylepak](https://github.com/refi64/stylepak) 可以调用 Flatpak 自动安装当前系统环境所使用的主题.

```sh
sudo pacman -S appstream-glib

# GTK theme
mkdir -p ~/.themes
cp -r /usr/share/themes/Adwaita-dark ~/.themes/Adwaita-dark
cp -r /usr/share/themes/Adwaita ~/.themes/Adwaita
sudo flatpak override --filesystem=$HOME/.themes

# Qt theme
flatpak install org.kde.KStyle.Adwaita
```

!!! info
    无需安装 README 中给出的依赖项 `ostree`, 因为这已经是 Flatpak 的依赖项了.

## 故障排除

- Partial data loss of static deltas[^1]

    出现 `404 Not Found` 或 `Error: While pulling ... from remote flathub: URI ... exceeded maximum size of ... bytes.` 错误提示.  
     附加参数 `--no-static-deltas`.

- Could not locate theme

    ```
    ./stylepak install-system
    Converting theme: Adw-dark
    Could not locate theme.
    ```

    在 Tweaks 中的 `Appearance | Legacy Applications` 修改为 `Adwaita-dark`. 然后重试.

- kwallet

    ```sh
    flatpak override --talk-name=org.kde.kwalletd6 <APP>
    ```

## 参见

- <https://blogs.gnome.org/alexl/2017/10/02/on-application-sizes-and-bloat-in-flatpak/>

## 参考

[^1]: <https://github.com/flatpak/flatpak/issues/5648>
