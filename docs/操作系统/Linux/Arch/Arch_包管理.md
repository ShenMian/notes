# Arch 包管理

**发行版**: Arch, Manjaro, EndeavourOS, CachyOS.

## 常用操作

```sh
sudo pacman -Ss <package>       # 搜索包
sudo pacman -Si <package>       # 显示包信息
sudo pacman -S <package>        # 安装包
sudo pacman -Rns <package>      # 删除包 (包括不再需要的依赖项)
sudo pacman -Syu                # 进行全面更新 (如果更换了镜像源, 请使用 -Syyu)
sudo pacman -Rs $(pacman -Qtdq) # 删除无用的包

yay -Ps # 列出外存占用情况和 10 个体积最大的包

sudo pacman-mirrors -c China # 更新镜像源 (仅限 Manjaro)
```

## 使用 AUR

在安装 AUR 包之前, 需要先手动安装一个 AUR Helper. 通过这类工具可以方便地从 AUR (Arch User Repository) 获取和安装包.

以下是两种常见 AUR Helper 的安装方法. 虽然它们的使用方式基本相同, 但在默认配置上存在一些差异.  
这些工具均基于 pacman 进行了封装, 能够同时管理官方仓库和 AUR 中的包, 且调用时无需使用 `sudo`.

!!! info
    若使用 Manjaro 发行版, 还需额外安装 `base-devel` 包, 这是 AUR Helper 在安装 AUR 包时所需的依赖项.

### Paru

使用 Rust 编写的 AUR Helper.

可以通过下面命令手动安装:

```sh
sudo pacman -S --needed base-devel git rustup
rustup default stable

git clone https://aur.archlinux.org/paru.git
cd paru
makepkg -si
```

### Yay

使用 Go 编写的主流 AUR Helper.

可以通过下面命令手动安装:

```sh
sudo pacman -S --needed git base-devel
git clone https://aur.archlinux.org/yay.git
cd yay
makepkg -si
```

Manjaro 的软件源包含了 yay 包, 可以直接通过以下命令安装:

```sh
sudo pacman -S yay
```

## 彩色输出

从文件 `/etc/pacman.conf` 中取消注释 `Color`.

详情请参考 <https://github.com/Jguer/yay/issues/123#issuecomment-361910482>.

## Flatpak

```sh
sudo pacman -S flatpak
```

建议在使用 flatpak 安装软件前重启.

## 自定义下载器

允许用户使用自定义下载器以提高下载速度. 以 aria2 为例, 将 `/etc/pacman.conf` 的 `options.XferCommand` 修改为以下内容:

```sh
/usr/bin/aria2c --allow-overwrite=true --continue=true --file-allocation=none --log-level=error --max-tries=2 --max-connection-per-server=2 --max-file-not-found=5 --min-split-size=5M --no-conf --remote-time=true --summary-interval=60 --timeout=5 --dir=/ --out %o %u
```

详情请参考 [ArchWiki](https://wiki.archlinux.org/title/Pacman/Tips_and_tricks#Performance).

## 添加 archlinuxcn 仓库

!!! warning
    Manjaro 不建议执行该步骤.

在文件 `/etc/pacman.conf` 中添加以下内容:

```conf
[archlinuxcn]
Server = https://repo.archlinuxcn.org/$arch
```

更新镜像源并安装密钥环:

```sh
sudo pacman -Sy
sudo pacman -S archlinuxcn-keyring
```

详情请参考 <https://github.com/archlinuxcn/repo>.

## 故障排除

- 网络环境正常, 但安装时出现网络错误

    可能是由于本地包数据库过时, 先执行 `pacman -Syu` 进行更新.

## 参见

- [常用软件](../../常用软件.md)
