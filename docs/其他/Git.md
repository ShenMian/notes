# Git

![Git 常用命令速查表 - riku.wowubuntu.com](assets/git_cheat_sheet.jpg)  

!!! info
    以下内容基于 2.X 版本.  

[Git](https://git-scm.com/) 是一款版本控制系统(Version control system, VCS). 名字的由来是项目创始人 Linus 的自嘲[^1], 该词在英语俚语代表 "令人讨厌的人".  

## 提交

提交信息的编写方式可以参考 [Conventional Commits](https://www.conventionalcommits.org/en/v1.0.0/), 里面列举了一些[例子](https://www.conventionalcommits.org/en/v1.0.0/#examples)和[优点](https://www.conventionalcommits.org/en/v1.0.0/#why-use-conventional-commits).  
可以借助工具 [commitlint](https://github.com/conventional-changelog/commitlint) 来进行检查.  

| 类型     | 描述                                                                             |
| -------- | -------------------------------------------------------------------------------- |
| refactor | 代码重构，既不修复错误也不添加功能.                                              |
| feat     | 类型为 feat 的提交表示在代码库中新增了一个功能(这和语义化版本中的 MINOR 相对应). |
| fix      | 类型为 fix 的 提交表示在代码库中修复了一个 bug(这和语义化版本中的 PATCH 相对应). |
| style    | 不影响代码含义的变化(空白/格式化/缺少分号等).                                    |
| perf     | 改进性能的代码更改.                                                              |
| test     | 添加确实测试或更正现有的测试.                                                    |
| build    | 影响构建系统或外部依赖关系的更改.                                                |
| docs     | 只是更改文档.                                                                    |
| ci       | 更改持续集成文件和脚本.                                                          |
| chore    | 其他不修改 src 或 test 文件.                                                     |
| revert   | commit 回退.                                                                     |

## 暂存

| Command                      | New Files | Modified Files | Deleted Files | Description                            |
| ---------------------------- | --------- | -------------- | ------------- | -------------------------------------- |
| `git add -A`                 | √         | √              | √             | Stage all files.                       |
| `git add .`                  | √         | √              | √             | Stage all files in current folder.     |
| `git add --ignore-removal .` | √         | √              | ×             | Stage new and modified files only.     |
| `git add -u`                 | ×         | √              | √             | Stage modified and deleted files only. |

## 忽略文件

不想使用 Git 进行跟踪和管理的文件可以在 `.gitignore` 文件中指定, 语法十分简洁易懂.  
对于常见开发环境通常忽略的文件, 可以利用 gitignore.io([Web](https://www.toptal.com/developers/gitignore)/[CLI](https://docs.gitignore.io/install/command-line))生成.  

## 清空仓库

以下代码用于清空仓库指定分支的全部历史记录, 执行操作后提交历史将会**永久丢失**.  

```sh
git checkout --orphan empty        || exit 1
git branch -D main                 || exit 1
git add -A                         || exit 1
git commit -m 'feat: first commit' || exit 1
git push origin empty:main --force || exit 1
git checkout main                  || exit 1
git branch -D empty
git pull origin main --allow-unrelated-histories
```

## 配置 Git

```sh
# 设置用戶
git config --global user.name 'name'
git config --global user.email 'eamil'

# 设置编辑器
git config --global core.editor 'nvim'

# 设置网络代理
git config --global http.proxy 'http://127.0.0.1:1234'
git config --global https.proxy 'http://127.0.0.1:1234'

# 设置命令别名
git config --global alias.co checkout
git config --global alias.br branch
git config --global alias.ci commit
git config --global alias.st status
```

## 代码托管平台

以下平台提供了 Git 远程仓库托管服务:  

- [GitHub](https://github.com/).
- [GitLab](https://about.gitlab.com/).
- [Bitbucket](https://bitbucket.org/).

使用平台进行对仓库托管还可以利用平台提供的相关功能, 但不应该产生依赖. 应确保项目随时可以脱离该平台并正常运作.  

## GitHub CLI

GitHub CLI 是 GitHub 官方提供的跨平台的命令行工具. [安装教程](https://github.com/cli/cli#installation).  
在 GitHub 因为安全问题禁用 Git 通过账户和密码登录后, 经过 GitHub CLI 配置后的 Git 可以按原样使用.  

```sh
sudo pacman -S github-cli # Arch Linux
choco install gh          # Windows

gh auth login             # 登录 GitHub 账号
gh auth setup-git         # 配置 Git
```

## 工作流程

![Git 分支](assets/git_branch.png){ align=right width=40% }  

### 分支

- main: 包含稳定的代码.
- develop: 包含不稳定的代码, 将合并到 main.
- feature/xxx: 包含新功能的代码, 将合并到 develop.
- hotfix/xxx: <!-- TODO -->.
- release/xxx: 发布版本.

## 参见

- [Git 文档](https://git-scm.com/doc)
- [Git FAQ](https://git.wiki.kernel.org/index.php/GitFaq)
- [入门视频1 - 奇乐编程学院](https://www.bilibili.com/video/BV1KD4y1S7FL)
- [入门视频2 - 奇乐编程学院](https://www.bilibili.com/video/BV1hA411v7qX)
- <https://git-send-email.io/>

[^1]: https://git.wiki.kernel.org/index.php/GitFaq#Why_the_.27Git.27_name.3F
