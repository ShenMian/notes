---
icon: simple/debian
---

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

以 `deb-src` 开头的为源码源. 若无从源代码编译并安装的需求, 建议保持注释状态, 这样既能节省磁盘空间, 也能提升部分 `apt` 命令的执行速度.

### Debian 13 (trixie)

```conf title="/etc/apt/sources.list.d/debian.sources"
Types: deb
URIs: mirror+https://mirrors.cernet.edu.cn/api/apt/mirrorlist/debian
Suites: trixie trixie-updates trixie-backports
Components: main contrib non-free non-free-firmware
Signed-By: /usr/share/keyrings/debian-archive-keyring.gpg

# 默认注释了源码镜像以提高 apt update 速度，如有需要可自行取消注释
# Types: deb-src
# URIs: mirror+https://mirrors.cernet.edu.cn/api/apt/mirrorlist/debian
# Suites: trixie trixie-updates trixie-backports
# Components: main contrib non-free non-free-firmware
# Signed-By: /usr/share/keyrings/debian-archive-keyring.gpg

# 安全更新软件源
Types: deb
URIs: mirror+https://mirrors.cernet.edu.cn/api/apt/mirrorlist/debian-security?official_index=1
Suites: trixie-security
Components: main contrib non-free non-free-firmware
Signed-By: /usr/share/keyrings/debian-archive-keyring.gpg

# Types: deb-src
# URIs: mirror+https://mirrors.cernet.edu.cn/api/apt/mirrorlist/debian-security?official_index=1
# Suites: trixie-security
# Components: main contrib non-free non-free-firmware
# Signed-By: /usr/share/keyrings/debian-archive-keyring.gpg
```

详情请参考[校园网联合镜像站](https://help.mirrors.cernet.edu.cn/debian/).

### Kali

在文件 `/etc/apt/sources.list` 的**头部**添加下面内容:

```conf title="/etc/apt/sources.list"
deb https://mirrors.cernet.edu.cn/kali kali-rolling main non-free contrib non-free-firmware
# deb-src https://mirrors.cernet.edu.cn/kali kali-rolling main non-free contrib non-free-firmware
```

详情请参考[校园网联合镜像站](https://help.mirrors.cernet.edu.cn/kali/).

### Ubuntu 26.04 LTS

```conf title="/etc/apt/sources.list.d/ubuntu.sources"
Types: deb
URIs: mirror+https://mirrors.cernet.edu.cn/api/apt/mirrorlist/ubuntu
Suites: resolute resolute-updates resolute-backports
Components: main restricted universe multiverse
Signed-By: /usr/share/keyrings/ubuntu-archive-keyring.gpg

# 默认注释了源码镜像以提高 apt update 速度，如有需要可自行取消注释
# Types: deb-src
# URIs: mirror+https://mirrors.cernet.edu.cn/api/apt/mirrorlist/ubuntu
# Suites: resolute resolute-updates resolute-backports
# Components: main restricted universe multiverse
# Signed-By: /usr/share/keyrings/ubuntu-archive-keyring.gpg

# 安全更新软件源
Types: deb
URIs: mirror+https://mirrors.cernet.edu.cn/api/apt/mirrorlist/ubuntu?official_index=1
Suites: resolute-security
Components: main restricted universe multiverse
Signed-By: /usr/share/keyrings/ubuntu-archive-keyring.gpg

# Types: deb-src
# URIs: mirror+https://mirrors.cernet.edu.cn/api/apt/mirrorlist/ubuntu?official_index=1
# Suites: resolute-security
# Components: main restricted universe multiverse
# Signed-By: /usr/share/keyrings/ubuntu-archive-keyring.gpg

# 预发布软件源，不建议启用

# Types: deb
# URIs: mirror+https://mirrors.cernet.edu.cn/api/apt/mirrorlist/ubuntu
# Suites: resolute-proposed
# Components: main restricted universe multiverse
# Signed-By: /usr/share/keyrings/ubuntu-archive-keyring.gpg

# # Types: deb-src
# # URIs: mirror+https://mirrors.cernet.edu.cn/api/apt/mirrorlist/ubuntu
# # Suites: resolute-proposed
# # Components: main restricted universe multiverse
# # Signed-By: /usr/share/keyrings/ubuntu-archive-keyring.gpg
```

详情请参考[校园网联合镜像站](https://help.mirrors.cernet.edu.cn/ubuntu/).
