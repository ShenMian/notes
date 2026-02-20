# Flatpak 包管理

Flatpak 上的内容可以分为应用程序 (Application) 和运行时 (Runtime) 两类, 下面统称为包.

## 常用操作

```sh
flatpak update                            # 更新所有包
flatpak install <PACKAGE>                 # 安装包
flatpak uninstall <PACKAGE>               # 卸载包 (保留用户数据)
flatpak uninstall --delete-data <PACKAGE> # 卸载包 (删除用户数据)
flatpak list --app                        # 列出已安装的应用程序
flatpak uninstall --unused                # 卸载未使用的包
```

## 更换镜像源

!!! warning
    部分私有的应用程序不允许再分发, 因此安装这些包时依然需要从应用官方指定的位置下载二进制包.

执行下面命令使用 USTC 提供的 Flathub 镜像仓库:

```sh
sudo flatpak remote-modify flathub --url=https://mirrors.ustc.edu.cn/flathub
```

还原默认官方源:

```sh
sudo flatpak remote-modify flathub --url=https://dl.flathub.org/repo
```

查看当前 Flathub 的 URL:

```sh
flatpak remotes --columns=name,url

# 本质上是一个 OSTree 仓库, 因此也可以通过下面方式查看
ostree remote --repo=/var/lib/flatpak/repo show-url flathub
```

详情请参考 [USTC Mirror Help](https://mirrors.ustc.edu.cn/help/flathub.html).

## 离线安装

Flatpak 还可以通过 `.flatpak` 文件进行离线安装:

```sh
flatpak install <app.flatpak>
```

但官方并未提供直接 `.flatpak` 文件, 需要先在联网的计算机上自行打包:

```sh
flatpak build-bundle /var/lib/flatpak/repo libreoffice.flatpak org.libreoffice.LibreOffice stable
```

默认情况下, 打包为使用 OSTree 格式数据的单个 `.flatpak` 文件, 也可以通过参数 `--oci` 生成 OCI 镜像文件夹.

## 主题同步

```sh
flatpak install flathub org.gtk.Gtk3theme.Breeze-Dark
```

---

```sh
flatpak -u override --filesystem=xdg-config/gtk-3.0:ro
flatpak -u override --filesystem=xdg-config/gtk-4.0:ro
```

项目 [stylepak](https://github.com/refi64/stylepak) 可以调用 Flatpak 自动安装当前系统环境所使用的主题.

```sh
sudo pacman -S appstream-glib
git clone https://github.com/refi64/stylepak
cd stylepak/
./stylepak install-user
```

!!! info
    无需安装 stylepak 的依赖项 `ostree`, 因为这已经是 Flatpak 的依赖项了.

```sh
# GTK theme
mkdir -p ~/.themes
cp -r /usr/share/themes/Adwaita-dark ~/.themes/Adwaita-dark
cp -r /usr/share/themes/Adwaita ~/.themes/Adwaita
sudo flatpak override --filesystem=$HOME/.themes

# Qt theme
flatpak install org.kde.KStyle.Adwaita
```

## 故障排除

!!! warning
    部分文件夹 (如 `/usr`) 无法给予访问权限[^reserved].

[^reserved]: https://docs.flatpak.org/en/latest/sandbox-permissions.html#reserved-paths

- Partial data loss of static deltas[^1]

    出现 `404 Not Found` 或 `Error: While pulling ... from remote flathub: URI ... exceeded maximum size of ... bytes.` 错误提示.  
     附加参数 `--no-static-deltas`.

- Could not locate theme

    ```sh
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
