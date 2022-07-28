# Kali

## 下载

因更具使用环境选择合适的镜像文件, 可以从官网查看不同版本的适用情况.  

- [Kali 官网](https://www.kali.org/get-kali/)
- [阿里巴巴开源镜像站](https://mirrors.aliyun.com/kali-images/)
- [华为开源镜像站](https://repo.huaweicloud.com/kali-images/)(旧)

## 持久化

允许将对系统进行的修改持久化, 否则每次重启 Kali 都会回到初始状态.  

- Windows: 在使用 Rufus 烧录前设置 Persistent partition size, 并在启动菜单择带有 persistence 字样的选项.  
- Linux: 详情请参考 [Adding Persistence to a Kali Linux Live USB Drive](https://www.kali.org/docs/usb/usb-persistence/)

!!! warning
    该功能十分重要, 除非有特殊目的否则请启用.  

## 工具

Kali Tweaks -> Metapackages
可以使用 [Kali 工具](https://www.kali.org/tools/) 来搜索并查看 Kali 中工具的信息, 如项目主页或源代码仓库.  
