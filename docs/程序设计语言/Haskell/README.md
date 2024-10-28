# Haskell

- 系列视频: [Haskell for Imperative Programmers - YouTube](https://www.youtube.com/playlist?list=PLe7Ei6viL6jGp1Rfu0dil1JH1SHk9bgDV).

本文将在合适的地方添加 Rust 代码, 作为命令式编程范式的对照. 因为该语言受 Haskell 影响较大.

- <https://play.haskell.org/>.

## ToC

| 主题                                                |
| --------------------------------------------------- |
| [函数, let & where](函数,_let_&_where.md)           |
| [递归, 守卫表达式, 模式](递归,_守卫表达式,_模式.md) |
| [柯里化和部分应用](柯里化和部分应用.md)             |
| [类型](类型.md)                                     |
| [函数复合](函数复合.md)                             |

## 安装

```ps1
scoop install msys2
Set-ExecutionPolicy Bypass -Scope Process -Force;[System.Net.ServicePointManager]::SecurityProtocol = [System.Net.ServicePointManager]::SecurityProtocol -bor 3072; try { & ([ScriptBlock]::Create((Invoke-WebRequest https://www.haskell.org/ghcup/sh/bootstrap-haskell.ps1 -UseBasicParsing))) -Interactive -DisableCurl } catch { Write-Error $_ }
```

---

`data` 类似 `enum`.
`class` 类似 `trait`.
`instance` 类似 `impl`.
