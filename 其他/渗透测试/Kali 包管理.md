# Kali 包管理

## 更新
```bash
sudo apt-get update
sudo apt-get upgrade
sudo apt-get dist-upgrade
```

## 清理安装包
```bash
sudo apt-get clean
sudo apt-get autoclean
```

## 镜像源
```bash
sudo vim /etc/apt/sources.list
```

```conf
# Aliyun 阿里云
deb http://mirrors.aliyun.com/kali kali-rolling main non-free contrib
deb-src http://mirrors.aliyun.com/kali kali-rolling main non-free contrib

# USTC 中科大
# deb http://mirrors.ustc.edu.cn/kali kali-rolling main non-free contrib
# deb-src http://mirrors.ustc.edu.cn/kali kali-rolling main non-free contrib
# deb http://mirrors.ustc.edu.cn/kali-security kali-current/updates main contrib non-free
# deb-src http://mirrors.ustc.edu.cn/kali-security kali-current/updates main contrib non-free

# Kali 官方
# deb http://http.kali.org/kali kali-rolling main non-free contrib 
# deb-src http://http.kali.org/kali kali-rolling main non-free contrib 

# 默认
# deb http://security.kali.org/kali-security kali-rolling/updates main contrib non-free
# deb-src http://security.kali.org/kali-security kali-rolling/updates main contrib non-free
```