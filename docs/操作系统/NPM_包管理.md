# NPM

NPM 是 JavaScript 的包管理器.

部分项目将 NPM 当作跨平台的包管理器使用, 用于安装 CLI 工具. 即使这些工具本身不是由 JS 或 TS 编写的, 如 Tauri, Codex.  
因此即使不使用 JS/TS, 也有必要了解该工具的基本使用方法.

Windows 下可以通过下面命令安装 pnpm:

```ps1
scoop install nodejs pnpm
```

由于 pnpm 依赖 npm, 所以还需要安装带 npm 的 nodejs.

```sh
pnpm search <NAME>     # 搜索应用
pnpm add -g <NAME>     # 安装应用
pnpm remove -g <NAME>  # 卸载应用 (包括依赖项), 选项 p 表示同时清除该应用的持久化数据
pnpm update -g         # 更新全部应用
pnpm list -g --depth 0 # 列出已安装的全部应用
```

首次安装后需要执行下面命令:

```sh
pnpm setup
```

然后重启终端, 才能继续使用全局相关的命令.
