# Windows 相关

## 跳过联网/MS账号登录

首先需要确保计算机处于离线状态. 然后按下 `Shift` + `F10` 打开命令行, 然后输入下面命令:

```ps1
oobe\bypassnro
```

随后计算机会重启, 连接网络的步骤现在可以点击 "I don't have internet" 跳过.

## 激活

```ps1
irm massgrave.dev/get | iex
```

<https://massgrave.dev/>
