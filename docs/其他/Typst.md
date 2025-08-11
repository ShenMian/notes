# Typst

[Typst] 是一种基于标记的排版系统.

与 LaTeX 相比:

- **生态不成熟**: Typst 提供了包索引 [Typst universe], 但目前包的数量以及完成度都无法与 LaTeX 相比.
- 语法更加简洁易用.
- **无感包管理**: Typst 会在编译时自动下载所需的包.
- **安装简单**: 安装 Typst 与安装其他 CLI 工具类似.
- **体积小巧**: Typst 只是一个编译器, 体积约 35 MB. 而 LaTeX (MiKTeX, TeX Live) 则需要数 GB.
- **在线使用**: Typst 官方提供了一个商业化的在线编辑器, 类似 LaTeX 的 Overleaf.

## 字体

可以通过下面命令查看 Typst 能检测到的本地已安装字体:

```sh
typst fonts --variants
```

### 中文粗体

Typst 对 CJK 字符的支持还[比较有限](https://github.com/typst/typst/issues/276).  
比如官方在线编辑器中默认的中文字体不支持粗体和斜体, Typst 也不支持伪粗体和伪斜体.

如果需要使用中文粗体, 有下面解决方式:

- 使用支持粗体的中文字体, 如[思源宋体] (开源).
- 使用 [cuti] 包提供的伪粗体, 可以为不支持粗体的中文字体添加粗体样式.

[思源宋体]: https://source.typekit.com/source-han-serif/
[cuti]: https://typst.app/universe/package/cuti

## LaTeX 转 Typst

| LaTeX         | Typst     |
|---------------|-----------|
| `\rightarrow` | `->`      |
| `\land`       | `and`     |
| `\cup`        | `union`   |
| `\varepsilon` | `epsilon` |
| `\mid`        | `|`       |

- <https://typst.app/docs/guides/guide-for-latex-users/>.
- <https://qwinsi.github.io/tex2typst-webapp/>.
- <https://github.com/johanvx/typst-undergradmath>.

## Hayagriva

[Hayagriva] 是 Typst 配套的引用管理软件, 类似 LaTeX 的 BibTeX.  
语法使用的是 YAML 格式, 更加现代, 简洁.

安装 CLI:

```sh
cargo install hayagriva --features cli
```

将 Bib(La)TeX 转换为 Hayagriva:

```sh
hayagriva refs.bib > refs.yml
```

[typst]: https://github.com/typst/typst
[typst universe]: https://typst.app/universe/
[hayagriva]: https://github.com/typst/hayagriva
