# Autopsy

```sh
paru -S gcc13
paru -D --asdeps gcc13

# 确保使用 JDK 17 编译 sleuthkit-java
sudo archlinux-java set java-17-openjdk
paru -S --rebuild sleuthkit-java
paru -D --asdeps sleuthkit-java

gpg --keyserver keyserver.ubuntu.com --recv-keys F3691687D867B81B51CE07D9BBE43771487328A9 13975A70E63C361C73AE69EF6EEB81F8981C74C7 D3A93CAD751C2AF4F8C7AD516C35B99309B5FA62 86CFFCA918CF3AF47147588051E8B148A9999C34
# 安装时建议选择 java17-openjfx-bin, 避免编译庞大的 OpenJFX 库
paru -S autopsy

# 消除配置文件中 \r 带来的警告
sudo sed -i 's/\r//' /usr/share/autopsy/etc/autopsy.conf
```

修改 `/usr/share/autopsy/etc/autopsy.conf` 文件, 指定 JDK 17 位置:

```conf title="/usr/share/autopsy/etc/autopsy.conf"
jdkhome="/usr/lib/jvm/java-17-openjdk"
```

![Screenshot](assets/autopsy.webp)
