# Flatpak 包管理

```sh
# GTK theme
mkdir -p ~/.themes
cp -r /usr/share/themes/Adwaita-dark ~/.themes/Adwaita-dark
cp -r /usr/share/themes/Adwaita ~/.themes/Adwaita
sudo flatpak override --filesystem=$HOME/.themes

# Qt theme
flatpak install org.kde.KStyle.Adwaita
```

https://github.com/refi64/stylepak

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

## 参考

[^1]: <https://status.flathub.org/issues/2023-01-14-deltas/>
