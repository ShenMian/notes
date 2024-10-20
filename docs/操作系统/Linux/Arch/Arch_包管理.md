# Arch 包管理

**发行版**: Arch, Manjaro, EndeavourOS.  

## 常用操作

```sh
sudo pacman -Ss <package>       # 搜索包
sudo pacman -S <package>        # 安装包
sudo pacman -Rns <package>      # 删除包(包括依赖项)
sudo pacman -Syyu               # 进行全面更新
sudo pacman -Rs $(pacman -Qtdq) # 删除无用的包

sudo pacman-mirrors -c China    # 更新镜像源(仅限 Manjaro)
yay -Ps                         # 列出外存占用情况和10个体积最大的包
```

## 使用 AUR

yay 包装了 pacman, 语法相似. 可以同时管理 pacman 的包和 AUR 的包, 调用时无需使用 `sudo`.  

```sh
sudo pacman -S yay # 安装 yay
```

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
SigLevel = Optional TrustedOnly
Server = https://mirrors.tuna.tsinghua.edu.cn/archlinuxcn/$arch # 清华镜像
```

安装 archlinuxcn-keyring:  

```sh
sudo pacman -S archlinuxcn-keyring
```

## 故障排除

- 网络环境正常, 但安装时出现网络错误

    可能是由于使用到了过时的信息, 先执行 `pacman -Syu` 进行更新.  

## 参见

- [常用软件](../../常用软件.md)
