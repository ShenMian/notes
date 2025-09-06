# Scoop

[Scoop] 是 Windows 下的软件管理器. 通过该管理器, 用户可以通过一条指令快速安装/卸载/搜索软件.

[scoop]: https://github.com/ScoopInstaller/Scoop

## 安装

Scoop 安装路径可以通过环境变量 `SCOOP` 指定, 建议选择无需管理员权限的路径.  
Scoop 自身以及其所管理的软件将安装在该路径下的 apps 文件夹.

将下面命令中的 `<install_path>` 替换为 Scoop 安装路径, 并在 Powershell (需要 5.1 或更高版本) 中执行:

```ps1
# 指定 Scoop 安装路径, Scoop 自身以及其所管理的软件将安装在该路径下的 apps 文件夹
[environment]::setEnvironmentVariable('SCOOP', <install_path>, 'User')
```

通过下面命令安装 Scoop:

```ps1
Set-ExecutionPolicy -ExecutionPolicy RemoteSigned -Scope CurrentUser # 给予执行安装脚本的权限
Invoke-RestMethod -Uri https://get.scoop.sh | Invoke-Expression      # 执行 Scoop 安装脚本
```

至此 Scoop 已完成安装, 但若需要完整的 Scoop 基础功能, 还需要执行下面命令:

```ps1
# Scoop 中的软件清单使用 Git 进行管理, 如果要更新或添加其他 Bucket 则必须安装 Git
scoop install git

# sudo 命令可以以管理员权限执行指定命令
# Scoop 安装软件本身是不需要管理员权限的, 但是添加服务等操作则需要
scoop install sudo

scoop install 7zip dark innounp
scoop checkup # 检查是否还存在其他潜在问题

# extras 是由 Scoop 官方维护的一个 Bucket, 其中包含了大量常用软件
scoop bucket add extras
```

可以考虑使用 `innounp-unicode` 替代 `innounp`, 详情请见[故障排除](#innounp-unicode).

## 常用操作

```ps1
scoop search <app>         # 搜索应用
scoop install <app>        # 安装应用
scoop uninstall <app> [-p] # 卸载应用 (包括依赖项), 选项 p 表示同时清除该应用的持久化数据
scoop update *             # 更新全部应用
scoop list                 # 列出已安装的全部应用

scoop bucket add <name> [repo] # 添加 Bucket
scoop bucket rm <name>         # 移除 Bucket
scoop bucket list              # 列出添加的 Bucket
```

## 查询频次限制

由于 `scoop search` 命令需要调用 API, 因此有调用频次限制. 可以通过设置个人 GitHub 账号的 token 来放宽限制.  

```ps1
scoop config gh_token <github_token>
```

创建新的 Personal access token: <https://github.com/settings/personal-access-tokens/new>.

详情请参考 [Scoop Wiki](https://github.com/ScoopInstaller/Scoop/wiki/Using-Scoop-behind-a-proxy).

## 多线程下载

通过下面命令安装 aria2 (多连接下载) 后, Scoop 将自动调用 aria2 下载:

```ps1
scoop install aria2
# 关闭 aria2 启用警告. 由于 Scoop 在安装 aria2 后会自动调用 aria2, 这可能是用户意料外的行为, 所以会弹出警告通知用户
scoop config aria2-warning-enabled false
```

## 网络代理

```ps1
scoop config proxy [username:password@]host:port # 设置网络代理
```

## 故障排除

### innounp-unicode

```txt
WARN  Purging previous failed installation of ollama.
ERROR 'ollama' isn't installed correctly.
Removing older version (0.2.3).
'ollama' was uninstalled.
Installing 'ollama' (0.2.3) [64bit] from 'main' bucket
Loading OllamaSetup.exe from cache
Checking hash of OllamaSetup.exe ... ok.
Extracting OllamaSetup.exe ... ERROR Exit code was 1!
Failed to extract files from D:\scoop\apps\ollama\0.2.3\OllamaSetup.exe.
Log file:
  D:\scoop\apps\ollama\0.2.3\innounp.log

Please try again or create a new issue by using the following link and paste your console output:
https://github.com/ScoopInstaller/Main/issues/new?title=ollama%400.2.3%3a+decompress+error
```

```ps1
scoop uninstall innounp
scoop bucket add versions
scoop install versions/innounp-unicode
```
