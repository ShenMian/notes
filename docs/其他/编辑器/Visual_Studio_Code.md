# Visual Studio Code

**缩写**: VSCode.  

VSCode 主要有以下版本:

- [VSCode] : 官方提供的版本, 属于私有软件, 包含微软的遥测功能.
- [VSCodium] : 社区提供的版本, 属于开源软件, 剔除了微软的遥测功能.
    - **不支持部分 VSCode 插件**: 如果你需要使用这些插件 (如 Live Share, Remote - SSH 等), 请考虑使用 VSCode. 详情请参考[扩展兼容性](https://github.com/VSCodium/vscodium/blob/master/docs/extensions-compatibility.md).
    - **插件来源于 <https://open-vsx.org>**: 部分插件需要从 <https://marketplace.visualstudio.com/vscode> 手动下载并安装 (如 GitHub Copilot).

[VSCode]: https://github.com/microsoft/vscode
[VSCodium]: https://github.com/VSCodium/vscodium

## 扩展 (Extensions)

- [Error Lens] : 行内错误提示.
- EditorConfig for VS Code.
- [Todo Tree] : 高亮 `TODO`/`FIXME`, 并提供树形图导航.
- [Vim] : Vim 模拟.
- Hex Editor: 16 进制编辑器.
- [LeetCode] : 脱离浏览器使用 LeetCode.

[Error Lens]: https://open-vsx.org/extension/usernamehw/errorlens
[Todo Tree]: https://marketplace.visualstudio.com/items?itemName=Gruntfuggly.todo-tree
[Vim]: https://marketplace.visualstudio.com/items?itemName=vscodevim.vim
[LeetCode]: https://marketplace.visualstudio.com/items?itemName=LeetCode.vscode-leetcode

### AI

- [GitHub Copilot] : AI 自动补全, 收费 (天价).
- [TONGYI Lingma] : AI 自动补全, 编写 Git 提交信息 (效果远超 GitHub Copilot).
- Tabnine AI: AI 自动补全, 有免费版, 收费 (天价).

[GitHub Copilot]: https://marketplace.visualstudio.com/items?itemName=GitHub.copilot
[TONGYI Lingma]: https://marketplace.visualstudio.com/items?itemName=Alibaba-Cloud.tongyi-lingma

### Rust

- [rust-analyzer] : LSP.
- [Even Better TOML].
- [Dependi] : 提供依赖项版本信息.
- [CodeLLDB] : 调试.
- [Flowistry] : 程序切片.

[rust-analyzer]: https://marketplace.visualstudio.com/items?itemName=rust-lang.rust-analyzer
[Even Better TOML]: https://marketplace.visualstudio.com/items?itemName=tamasfe.even-better-toml
[Dependi]: https://marketplace.visualstudio.com/items?itemName=fill-labs.dependi
[CodeLLDB]: https://open-vsx.org/extension/vadimcn/vscode-lldb
[Flowistry]: https://marketplace.visualstudio.com/items?itemName=wcrichton.flowistry

### Markdown

- [Markdown Extended] : 包含多种 markdown-it 插件, 支持导出为多种格式 (包括 PDF).
- Markdown All in One: 包含如格式化表格等便捷操作.
- markdownlint: 语法警告, 保证代码的兼容性.

[Markdown Extended]: https://open-vsx.org/extension/jebbs/markdown-extended

### Git

- [GitHub Pull Requests and Issues] : 快捷查看 GitHub 项目的 PRs 和 Issues.

[GitHub Pull Requests and Issues]: https://marketplace.visualstudio.com/items?itemName=GitHub.vscode-pull-request-github

### Typst

- [Tinymist Typst] : LSP.

[Tinymist Typst]: https://open-vsx.org/extension/myriad-dreamin/tinymist

### Haskell

- [Haskell].

[Haskell]: https://open-vsx.org/extension/haskell/haskell

### C++

- [CMake](https://marketplace.visualstudio.com/items?itemName=twxs.cmake) CMake 语法高亮等.
- [Doxygen Documentation Generator](https://marketplace.visualstudio.com/items?itemName=cschlosser.doxdocgen) 生成 Doxygen 文档注释.

### GLSL

- GLSL Lint.
- Shader languages support for VS Code.

## 参见

- [VS Code Top-Ten Pro Tips](https://www.youtube.com/watch?v=u21W_tfPVrY).
