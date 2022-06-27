# Arch 包管理

**操作系统**: Arch, Manjaro  

## 进行全面更新

```bash
sudo pacman -Syyu
```

## 更新镜像源

```bash
sudo pacman-mirrors -c China
```

## 使用 AUR

安装 yay.  

```bash
sudo pacman -S yay
```

yay 包装了 pacman, 语法与其相似. 可以同时管理 pacman 的包和 AUR 的包, 调用时无需使用 `sudo`.  

## 添加 archlinuxcn 仓库(不推荐)

在文件 `/etc/pacman.conf` 中添加以下内容:  

```conf
[archlinuxcn]
SigLevel = Optional TrustedOnly
Server = https://mirrors.tuna.tsinghua.edu.cn/archlinuxcn/$arch
```

## 安装 archlinuxcn-keyring(不推荐)

```bash
sudo pacman -S archlinuxcn-keyring
```
