# Notes

## 示例

- [Git](其他/Git.md).
- [Manjaro 安装](操作系统/Linux/Manjaro/Manjaro_安装.md).
- [反汇编器](渗透测试/逆向工程/反汇编器.md).
- [Dishonored 2](<其他/游戏/评价/Dishonored_2.md>).
- [Vim](其他/编辑器/Vim.md).
- [计算理论导论](https://github.com/ShenMian/theory_of_computation): 由 Typst 编写的高质量笔记.
- [现代推箱子教程](https://shenmian.github.io/sokoban-tutorial/).

## 构建

### HTML

```sh
pip install mkdocs-material pymdown-extensions
mkdocs build
```

Arch Linux 下的构建方式:

```sh
sudo pacman -S mkdocs-material python-pymdown-extensions
mkdocs build
```

### PDF

先构建为 HTML 文件, 然后使用浏览器打开指定页面并打印为 PDF 文件.

## 许可协议

![License](assets/cc-by-nc-sa.svg){ align=right }

该系列文章采用 [CC BY-NC-SA 4.0](https://creativecommons.org/licenses/by-nc-sa/4.0/) 许可协议进行授权.  
部分图片来源于互联网, 版权归原作者所有.

---

[![Give up GitHub](https://sfconservancy.org/img/GiveUpGitHub.png){ width=20% style="display: block; margin: 0 auto" }](https://sfconservancy.org/GiveUpGitHub/)
