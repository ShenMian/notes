# Arch 包管理

**操作系统**: Arch, Manjaro.  

!!! info
    Arch 和 Manjaro 有一定区别, 二者不可以混淆. 以下针对 Arch 的步骤, 不建议 Manjaro 执行.  

## 进行全面更新

```sh
sudo pacman -Syyu
```

## 更新镜像源

```sh
sudo pacman-mirrors -c China
```

## 使用 AUR

安装 yay.  

```sh
sudo pacman -S yay
```

yay 包装了 pacman, 语法与其相似. 可以同时管理 pacman 的包和 AUR 的包, 调用时无需使用 `sudo`.  

## 添加 archlinuxcn 仓库

在文件 `/etc/pacman.conf` 中添加以下内容:  

```conf
[archlinuxcn]
SigLevel = Optional TrustedOnly
Server = https://mirrors.tuna.tsinghua.edu.cn/archlinuxcn/$arch
```

## 安装 archlinuxcn-keyring

```sh
sudo pacman -S archlinuxcn-keyring
```
## 参见

- [常用软件](../其他/常用软件.md)
