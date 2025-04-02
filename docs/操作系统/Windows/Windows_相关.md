# Windows 相关

## 跳过联网/MS账号登录

首先需要确保计算机处于离线状态. 然后按下 `Shift` + `F10` 打开命令行, 然后输入下面命令:

```ps1
reg add HKLM\SOFTWARE\Microsoft\Windows\CurrentVersion\OOBE /v BypassNRO /t REG_DWORD /d 1 /f shutdown /r /t 0
```

随后计算机会重启, 连接网络的步骤现在可以点击 "I don't have internet" 跳过.

!!! info
    `oobe\bypassnro` 脚本已于 Build 26200.5516 中被移除. 详情请参考 [Windows Insider Blog](https://blogs.windows.com/windows-insider/2025/03/28/announcing-windows-11-insider-preview-build-26200-5516-dev-channel/).

## 激活

```ps1
irm massgrave.dev/get | iex
```

<https://massgrave.dev/>
