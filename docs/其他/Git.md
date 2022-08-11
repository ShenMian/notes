# Git

!!! info
    以下内容基于 2.X 版本.  

[Git](https://git-scm.com/) 是一款版本控制软件. 名字的由来是项目创始人 Linus 的自嘲[^1], 该词在英语俚语代表 "令人讨厌的人".  

## 基本命令

![Git 常用命令速查表](assets/git_cheat_sheet.jpg)  

## 工作流程

![Git 工作流程](assets/git_flow.png)  

### 分支

- main: 包含稳定的代码.
- develop: 包含不稳定的代码, 将合并到 main.
- feature/xxx: 包含新功能的代码, 将合并到 develop.
- hotfix/xxx: .
- release/xxx: .

### 提交

提交信息的编写方式可以参考 [Conventional Commits](https://www.conventionalcommits.org/en/v1.0.0/), 里面列举了一些[例子](https://www.conventionalcommits.org/en/v1.0.0/#examples)和[优点](https://www.conventionalcommits.org/en/v1.0.0/#why-use-conventional-commits).  

| Command                      | New Files | Modified Files | Deleted Files | Description                            |
| ---------------------------- | --------- | -------------- | ------------- | -------------------------------------- |
| `git add -A`                 | ✔️        | ✔️             | ✔️            | Stage all files.                       |
| `git add .`                  | ✔️        | ✔️             | ✔️            | Stage all files in current folder.     |
| `git add --ignore-removal .` | ✔️        | ✔️             | ❌             | Stage new and modified files only.     |
| `git add -u`                 | ❌         | ✔️             | ✔️            | Stage modified and deleted files only. |

## 清空仓库

```sh
git clone https://github.com/<account>/<repo>.git
cd <repo>
git checkout --orphan empty # 创建孤儿分支 empty
git rm --cached -r .
git commit --allow-empty -m 'first commit'
git push origin empty:<branch> --force
```

!!! waning
    该操作将清空仓库指定分支的全部历史记录.  

## GUI 客户端

- [Github Desktop](https://desktop.github.com/): 跨平台, 简洁, 开源, 目标仅为 Github 服务.
- [GitKraken](https://www.gitkraken.com/): 跨平台, 部分功能收费.

!!! warning
    如果已为 Git 配置了代理服务器不建议使用 `GitKraken`, 可能会导致错误.

## Github CLI

Github CLI 是 Github 官方提供的跨平台的命令行工具. [安装教程](https://github.com/cli/cli#installation).  
Windows 用户可以直接从 [Releases](https://github.com/cli/cli/releases) 上下载安装包.  
安装后执行下面命令, 来登录账户并配置本地的 Git.  
在 Github 因为安全问题禁用 Git 通过账户和密码登录后, 经过 Github CLI 配置后的 Git 可以按原样使用.  

```sh
sudo pacman -S github-cli # Archlinux
gh auth login             # 登录 Github 账号
gh auth setup-git         # 配置 Git
```

## 配置 Git

### 设置用戶

```sh
git config --global user.name 'name'
git config --global user.email 'eamil'
```

### 设置编辑器

```sh
git config --global core.editor 'nvim'
```

### 设置代理

```sh
git config --global http.proxy 'socks5://127.0.0.1:7891'
git config --global https.proxy 'socks5://127.0.0.1:7891'
```

## 参见

- [Git 文档](https://git-scm.com/doc)
- [Git FAQ](https://git.wiki.kernel.org/index.php/GitFaq)
- [Bilibili 入门视频](https://www.bilibili.com/video/BV1KD4y1S7FL)
- [Bilibili 进阶视频](https://www.bilibili.com/video/BV1hA411v7qX)

[^1]: https://git.wiki.kernel.org/index.php/GitFaq#Why_the_.27Git.27_name.3F
