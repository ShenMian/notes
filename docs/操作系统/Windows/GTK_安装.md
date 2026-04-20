# GTK 安装

```ps1
python -m pip install --user pipx
python -m pipx ensurepath
pipx install gvsbuild
```

```ps1
gvsbuild build gtk4 --msys-dir "D:\apps\msys2" --vs-install-path "D:\apps\Microsoft Visual Studio"
```

## 参考

- <https://gtk-rs.org/gtk4-rs/stable/latest/book/installation_windows.html#install-gtk-4>.
- <https://github.com/wingtk/gvsbuild#development-environment>.
