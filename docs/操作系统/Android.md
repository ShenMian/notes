# Android

## 导出 APK

请先确保手机已开启 USB 调试, 并允许当前电脑进行调试.

```console
> adb shell pm list packages         # 列出全部 APK 名称
> adb shell pm path <APK_NAME>       # 获取 APK 路径
> adb pull <APK_PATH> path/to/target # 将 APK 文件下载到电脑的指定位置
```

<https://stackoverflow.com/a/18003462/14268755>
