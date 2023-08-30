# Windows 包管理

常见的 Windows 包管理器有:  

- [scoop](https://github.com/ScoopInstaller/Scoop).
- [winget](https://github.com/microsoft/winget-cli).
- [choco](https://github.com/chocolatey/choco).

## 安装 scoop

```ps1
Set-ExecutionPolicy -ExecutionPolicy RemoteSigned -Scope CurrentUser
$env:SCOOP='D:\'                                                   # 指定安装路径, 直接在此路径下安装
[environment]::setEnvironmentVariable('SCOOP', $env:SCOOP, 'User') # 设置环境变量
iwr -useb get.scoop.sh | iex                                       # 安装 scoop

scoop config proxy [username:password@]host:port # 设置网络代理

scoop install sudo 7zip innounp dark
sudo Set-ItemProperty 'HKLM:\SYSTEM\CurrentControlSet\Control\FileSystem' -Name 'LongPathsEnabled' -Value 1
scoop checkup # 检查潜在问题

scoop bucket add extras
```

## 常用操作

```ps1
scoop search <package>    # 搜索包
scoop install <package>   # 安装包
scoop uninstall <package> # 删除包(包括依赖项)
scoop update *            # 更新全部包
```
