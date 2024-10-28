# [Typst]

## [Hayagriva]

安装 CLI:

```sh
cargo install hayagriva --features cli
```

将 Bib(La)TeX 转换为 Hayagriva:

```sh
hayagriva refs.bib > refs.yml
```

## 包

- [伪粗体](https://typst.app/universe/package/cuti).
- [有限自动机](https://typst.app/universe/package/finite).

<https://github.com/johanvx/typst-undergradmath>

## 字体

- [思源宋体]: 开源, 免费, 粗体.

可以通过下面命令查看 Typst 能检测到的本地已安装字体:

```sh
typst fonts --variants
```

[思源宋体]: https://source.typekit.com/source-han-serif/

## LaTeX 转 Typst

| LaTeX         | Typst     |
| ------------- | --------- |
| `\rightarrow` | `->`      |
| `\land`       | `and`     |
| `\cup`        | `union`   |
| `\varepsilon` | `epsilon` |
| `\mid`        | `|`       |

- <https://typst.app/docs/guides/guide-for-latex-users/>.
- <https://qwinsi.github.io/tex2typst-webapp/>.

[typst]: https://github.com/typst/typst
[hayagriva]: https://github.com/typst/hayagriva
