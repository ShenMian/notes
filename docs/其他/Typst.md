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

| LaTeX         | Typst     |
| ------------- | --------- |
| `\rightarrow` | `->`      |
| `\land`       | `and`     |
| `\cup`        | `union`   |
| `\varepsilon` | `epsilon` |
| `\mid`        | `|`       |

[typst]: https://github.com/typst/typst
[hayagriva]: https://github.com/typst/hayagriva
