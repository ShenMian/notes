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

请先确保手机已开启 USB 调试, 并允许当前电脑进行调试.

```console
> adb shell pm list packages         # 列出全部 APK 名称
> adb shell pm path <APK_NAME>       # 获取 APK 路径
> adb pull <APK_PATH> path/to/target # 将 APK 文件下载到电脑的指定位置
```

## 参考

- <https://stackoverflow.com/a/18003462/14268755>.
