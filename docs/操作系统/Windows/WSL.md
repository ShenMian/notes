# WSL

**全称**: Windows Subsystem for Linux.  

## 启用 WSL

- 方法 1

    以管理员身份运行 PowerShell 后执行下面命令:

    ```ps1
    Enable-WindowsOptionalFeature -Online -FeatureName Microsoft-Windows-Subsystem-Linux
    ```

- 方法 2

    打开 `optionalfeatures.exe`, 勾选 Windows Subsystem for Linux.

    !!! tip
        该步骤需要重启计算机.  

## 安装 Linux 发行版

从 [Microsoft Store](ms-windows-store://search/?query=WSL) 中寻找并安装合适的 Linux 发行版 (如: [Ubuntu 20.04.4 LTS](https://www.microsoft.com/store/productId/9MTTCL66CPXJ)).

```ps1
wsl --update            # 更新 WSL
wsl --list --online     # 列出可用的发行版
wsl --install archlinux # 安装 Arch Linux 发行版

wsl -d archlinux -u sms # 以用户 sms 登录 Arch Linux
wsl --manage archlinux --set-default-user sms # 设置 Arch Linux 的默认用户为 sms
```

## 故障排除

- `WslRegisterDistribution failed with error: 0x800701bc`  
    <https://docs.microsoft.com/zh-cn/windows/wsl/install-manual#step-4---download-the-linux-kernel-update-package>
- `WslRegisterDistribution failed with error: 0x80370102`  
    打开 `optionalfeatures.exe`, 勾选 Hyper-V.  
- `Class not registered Error code: Wsl/CallMsi/REGDB_E_CLASSNOTREG`
    从 [GitHub](https://github.com/microsoft/WSL/releases) 上下载并安装 WSL.

其余故障均可根据错误描述进行排除.

## 参考

- [官方文档](https://learn.microsoft.com/en-us/windows/wsl/).
