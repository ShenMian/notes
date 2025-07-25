# Flatpak 包管理

## 主题安装

项目 [stylepak](https://github.com/refi64/stylepak) 可以调用 Flatpak 自动安装当前系统环境所使用的主题.

```sh
# GTK theme
mkdir -p ~/.themes
cp -r /usr/share/themes/Adwaita-dark ~/.themes/Adwaita-dark
cp -r /usr/share/themes/Adwaita ~/.themes/Adwaita
sudo flatpak override --filesystem=$HOME/.themes

# Qt theme
flatpak install org.kde.KStyle.Adwaita
```

## 故障排除

- Partial data loss of static deltas[^1]

    出现 `404 Not Found` 或 `Error: While pulling ... from remote flathub: URI ... exceeded maximum size of ... bytes.` 错误提示.  
     附加参数 `--no-static-deltas`.

- Could not locate theme

    ```
    ./stylepak install-system
    Converting theme: Adw-dark
    Could not locate theme.
    ```

    在 Tweaks 中的 `Appearance | Legacy Applications` 修改为 `Adwaita-dark`. 然后重试.

- kwallet

    ```sh
    flatpak override --talk-name=org.kde.kwalletd6 <APP>
    ```

## 参考

[^1]: <https://github.com/flatpak/flatpak/issues/5648>
