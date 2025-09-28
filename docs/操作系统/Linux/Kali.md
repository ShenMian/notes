# Kali

## 下载

因根据使用环境选择合适的系统镜像文件, 可以从官网查看不同版本的适用情况.

- [Kali 官网](https://www.kali.org/get-kali/)
- [阿里巴巴开源镜像站](https://mirrors.aliyun.com/kali-images/)

## 持久化

允许将对系统进行的修改持久化, 否则每次重启 Kali 都会回到初始状态. 该功能十分重要, 烧录时应预留一定空间.

- Windows: 在使用 Rufus 烧录前设置 Persistent partition size.
- Linux: 详情请参考 [Adding Persistence to a Kali Linux Live USB Drive](https://www.kali.org/docs/usb/usb-persistence/)

启动时需要在启动菜单择带有 persistence 字样的选项.

!!! warning
    因为要进行读写操作, 所以效率会收读写速率的影响.

## 卷标

卷标需要从通过修改文件 `autorun.inf` 中的 `autorun.label` 来进行修改.

## 工具

若觉得默认的工具包不够用, 还可以从 *Kali Tweaks -> Metapackages* 安装其他工具包集合.  
可以使用 [Kali 工具](https://www.kali.org/tools/) 来搜索并查看 Kali 中工具的信息, 如项目主页或源代码仓库.
