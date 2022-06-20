# WSL

## 启用 WSL

### 方法 1:

以管理员身份运行 PowerShell 后执行下面命令.

```ps1
Enable-WindowsOptionalFeature -Online -FeatureName Microsoft-Windows-Subsystem-Linux
```

### 方法 2:

打开 `optionalfeatures.exe`, 勾选 Windows Subsystem for Linux.  

**提示**: 该步骤需要重启计算机.  

## 安装 Linux 发行版

从 [Microsoft Store](ms-windows-store://search/?query=WSL) 中寻找合适的 Linux 发行版(如: [Ubuntu 20.04.4 LTS](https://www.microsoft.com/store/productId/9MTTCL66CPXJ)). 点击 `Get` 获取并点击 `Install` 进行下载安装.  

## 故障排除

- `WslRegisterDistribution failed with error: 0x800701bc`  
   <https://docs.microsoft.com/zh-cn/windows/wsl/install-manual#step-4---download-the-linux-kernel-update-package>
- `WslRegisterDistribution failed with error: 0x80370102`  
   打开 `optionalfeatures.exe`, 勾选 Hyper-V.  

其余故障均可更具错误描述进行排除.  
