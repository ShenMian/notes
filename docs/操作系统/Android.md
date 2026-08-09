---
icon: simple/android
---

# Android

## 输入法

| 名称                                      | 离线语音准确度      | 界面简洁度 | 功能简洁度 |
| ----------------------------------------- | ------------------- | ---------- | ---------- |
| 豆包输入法 (Doubao IME)                   | 高                  | 高         | 高         |
| 百度输入法 (Baidu IME)                    | 中                  | 低         | 极低       |
| 微信输入法 (WeType)                       | 极低                | 低         | 高         |
| 讯飞输入法小米版 (iFlytek IME for Xiaomi) | 中 (存在不可用故障) | 极低       | 高         |

## 导出 APK

### 通过 AntiSplit-M 导出

在需要导出 APK 的手机上安装 [AntiSplit-M](https://github.com/AbdurazaaqMohammed/AntiSplit-M), 确保已赋予 `Access list of installed apps` 权限, 然后根据应用里的指示导出 APK 文件.

### 通过 ADB 导出

请先确保手机已开启 USB 调试, 并允许当前电脑进行调试.

```console
> adb shell pm list packages         # 列出全部 APK 名称
> adb shell pm path <APK_NAME>       # 获取 APK 路径
> adb pull <APK_PATH> path/to/target # 将 APK 文件下载到电脑的指定位置
```

如果获取的 APK 路径只包含单个 `base.apk` 文件即可直接导出并分享该文件, 若存在多个 APK 文件则建议使用上一节的方法.

## 远程控制

可以借助 [scrcpy](https://github.com/genymobile/scrcpy) 通过 USB 直接远程控制手机. 通过下面命令安装:

安装 [scrcpy](https://github.com/genymobile/scrcpy):

```ps1
scoop install scrcpy
```

先在手机上开启开发者模式并启用 USB 调试, 然后通过数据线将手机连接至电脑. 最后执行以下命令:

```sh
scrcpy
```

## 参考

- <https://stackoverflow.com/a/18003462/14268755>.
