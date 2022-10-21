# Arch 包管理

**发行版**: Arch, Manjaro.  

!!! info
    Arch 和 Manjaro 有一定区别, 二者不可以混淆. 以下针对 Arch 的步骤, 不建议 Manjaro 执行.  

## 常用操作

- 更新镜像源

    ```sh
    sudo pacman-mirrors -c China
    ```

- 进行全面更新

    ```sh
    sudo pacman -Syyu
    ```

- 删除无用的包

    ```sh
    sudo pacman -R $(pacman -Qtdq)
    ```

- 自定义下载器

    允许用户使用自定义下载器以提高下载速度. 以 aria2 为例, 将 `/etc/pacman.conf` 的 `options.XferCommand` 修改为以下内容:  

    ```sh
    /usr/bin/aria2c --allow-overwrite=true --continue=true --file-allocation=none --log-level=error --max-tries=2 --max-connection-per-server=2 --max-file-not-found=5 --min-split-size=5M --no-conf --remote-time=true --summary-interval=60 --timeout=5 --dir=/ --out %o %u
    ```

    详情请参考 [ArchWiki](https://wiki.archlinux.org/title/Pacman/Tips_and_tricks#Performance).  

## 使用 AUR

安装 yay.  

```sh
sudo pacman -S yay
```

yay 包装了 pacman, 语法相似. 可以同时管理 pacman 的包和 AUR 的包, 调用时无需使用 `sudo`.  

## 添加 archlinuxcn 仓库

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

- [常用软件](../其他/常用软件.md)
