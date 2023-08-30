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

## 故障排除

- Error: While pulling ... from remote flathub: URI ... exceeded maximum size of ... bytes.

    附加参数 `--no-static-deltas`.  

