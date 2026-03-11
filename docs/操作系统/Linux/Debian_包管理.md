# Debian 包管理

**发行版**: Ubuntu, Kali, Deepin, Pop!_OS, Q4OS, SparkyLinux, Zorin OS, Devuan, MX Linux, KDE Neon.  

## 常用操作

```sh
sudo apt install <PACKAGE> # 安装包
sudo apt remove <PACKAGE>  # 卸载包 (保留配置文件)
sudo apt purge <PACKAGE>   # 卸载包 (删除配置文件)
sudo apt update            # 更新存储库索引
sudo apt upgrade           # 更新所有包
sudo apt full-upgrade      # 在升级软件包时自动处理依赖关系
sudo apt autoremove        # 卸载未使用的包
```

## 更换镜像源

### Kali

在文件 `/etc/apt/sources.list` 的**头部**添加下面内容:

```conf title="/etc/apt/sources.list"
# USTC 中科大镜像
deb https://mirrors.ustc.edu.cn/kali kali-rolling main non-free non-free-firmware contrib
deb-src https://mirrors.ustc.edu.cn/kali kali-rolling main non-free non-free-firmware contrib
```

详情请参考 [USTC Mirror Help](https://mirrors.ustc.edu.cn/help/kali.html).

### Ubuntu

需要根据具体的版本号进行选择.
