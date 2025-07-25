# Debian 包管理

**发行版**: Ubuntu, Kali, Deepin, Pop!_OS, Q4OS, SparkyLinux, Zorin OS, Devuan, MX Linux, KDE Neon.  

## 更新

```sh
sudo apt update       # 刷新存储库索引
sudo apt upgrade      # 升级所有可升级的软件包
sudo apt full-upgrade # 在升级软件包时自动处理依赖关系
```

## 清理安装包

```sh
sudo apt autoremove # 自动删除不需要的包
```

## 镜像源

将文件 `/etc/apt/sources.list` 中的内容修改为以下内容:

### Kali

```conf
# USTC 中科大镜像
deb http://mirrors.ustc.edu.cn/kali kali-rolling main non-free contrib
deb-src http://mirrors.ustc.edu.cn/kali kali-rolling main non-free contrib
# deb http://mirrors.ustc.edu.cn/kali-security kali-current/updates main contrib non-free
# deb-src http://mirrors.ustc.edu.cn/kali-security kali-current/updates main contrib non-free

# Aliyun 阿里云镜像
# deb http://mirrors.aliyun.com/kali kali-rolling main non-free contrib
# deb-src http://mirrors.aliyun.com/kali kali-rolling main non-free contrib

# Kali 官方
# deb http://http.kali.org/kali kali-rolling main non-free contrib
# deb-src http://http.kali.org/kali kali-rolling main non-free contrib
# deb http://security.kali.org/kali-security kali-rolling/updates main contrib non-free
# deb-src http://security.kali.org/kali-security kali-rolling/updates main contrib non-free
```

### Ubuntu

需要根据具体的版本号进行选择.
